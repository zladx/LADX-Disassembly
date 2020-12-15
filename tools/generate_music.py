#!/usr/bin/python3
#
# Dump the music tracks data to readable ASM files.

import sys


DEBUG = False

# ================================================================================
# Helper functions
# ================================================================================
def read16(rom, addr):
    return rom[addr] | ((rom[addr+1])<<8)

def bankedAddress(bank, addr):
    return bank*0x4000 + (addr&0x3fff)

def toGbPointer(addr):
    if addr < 0x4000:
        return addr
    return (addr&0x3fff)+0x4000

# Hexadecimal with "$" instead of "0x"
def myhex(val, digits=2):
    out = hex(val)[2:]
    while len(out) < digits:
        out = '0' + out
    return out

def signedByte(val):
    if val >= 0x80:
        return val - 0x100
    return val

def signedHex(val):
    if val >= 0:
        return '$' + myhex(val)
    out = hex(val)[3:]
    return '-$' + out

# Get byte data in a format the assembler understands (db statements)
def getByteString(data, cols=16):
    i = 0
    s = ''
    for b in data:
        if i == 0:
            s += '    db   '
        else:
            s += ', '
        s += '$' + myhex(b)
        i+=1
        if i == cols:
            i = 0
            s += '\n'
    if i != 0:
        s += '\n'
    return s

def getMusicLabel(index):
    return 'Music' + myhex(index)

def getChannelLabel(musicIndex, channelIndex, cptr):
    return 'Music{0}Channel{1}'.format(myhex(musicIndex), myhex(channelIndex, 1))

def getChannelDefinitionLabel(musicIndex, channelIndex, ptr):
    bank = ptr // 0x4000
    ptr = toGbPointer(ptr)
    return 'ChannelDefinition_{0}_{1}'.format(myhex(bank, 2), myhex(ptr, 4))

def getLoopLabel(ptr):
    if dataSet.hasLabelAt(ptr):
        return dataSet.getFirstLabelAt(ptr)
    bank = ptr // 0x4000
    ptr = toGbPointer(ptr)
    return 'MusicLoop_{0}_{1}'.format(myhex(bank, 2), myhex(ptr, 4))

def getSpeedDataLabel(ptr):
    bank = ptr // 0x4000
    return 'MusicSpeedData_{0}_{1}'.format(myhex(bank), myhex(toGbPointer(ptr), 4))

NOTE_STRINGS = [ 'C_','C#','D_','D#','E_','F_','F#','G_','G#','A_','A#','B_' ]

def getNoteName(note, channel):
    if channel == 4:
        if note == 0xff:
            return 'NOISE_FF'
        assert(note >= 1 and note < 1+17*5 and (note-1)%5 == 0)
        return 'NOISE_{0}'.format(((note-1)//5)+1)
    else:
        assert(note >= 2 and note <= 0x90)
        note -= 2
        octave = note // 24 + 1
        assert(note % 2 == 0)
        return NOTE_STRINGS[(note//2) % 12] + str(octave)

def getWaveformName(addr):
    bank = addr // 0x4000
    addr = toGbPointer(addr)
    return 'waveform_{0}_{1}'.format(myhex(bank), myhex(addr, 4))

# ================================================================================
# Data Class
# ================================================================================
# Represents data at a location with a function that knows how to print the
# data.
class Data:
    def __init__(self, start, printer):
        self.startAddr = start
        self.printerFunc = printer # printerFunc: Data -> String

        # To be filled later
        self.endAddr = None
        self.nextData = None
        self.dataSet = None

        self.label = None

    def getSize(self):
        return self.endAddr - self.startAddr

    def setLabel(self, label):
        self.label = label
        if self.dataSet is not None:
            self.dataSet.addLabel(self.startAddr, label)

    def print(self):
        out = self.dataSet.printLabelsIfAvailable(self.startAddr)
        out += self.printerFunc(self)
        return out

    # Generic print functions
    def printAsByteString(d):
        return getByteString(rom[d.startAddr:d.endAddr])


# Parsing a collection of Data objects together
class DataSet:
    def __init__(self):
        self.dataSet = set()
        self.labelDict = {}
        self.labelAddrDict = {}

    def addData(self, data):
        for d2 in self.dataSet:
            if d2.startAddr == data.startAddr:
                assert(False)
        data.dataSet = self
        self.dataSet.add(data)
        if data.label is not None:
            self.addLabel(data.startAddr, data.label)

    def addLabel(self, addr, label):
        if self.hasLabelAt(addr) and label in self.labelDict[addr]:
            return
        assert(not self.hasLabel(label))
        if not addr in self.labelDict:
            self.labelDict[addr] = []
        self.labelDict[addr].append(label)
        self.labelAddrDict[label] = addr

    def hasLabel(self, label):
        return label in self.labelAddrDict

    def hasLabelAt(self, addr):
        return addr in self.labelDict

    def getFirstLabelAt(self, addr):
        return self.labelDict[addr][0]

    def hasDataAt(self, addr):
        for d in self.dataSet:
            if d.startAddr == addr:
                return True
        return False

    def printLabelsIfAvailable(self, addr):
        if not self.hasLabelAt(addr):
            return ''
        s = '\n'
        for label in self.labelDict[addr]:
            s += '{0}'.format(label)
            if label[0] != '.':
                s += '::'
            if DEBUG:
                s += ' ; $' + myhex(addr, 4)
            s += '\n'
        return s

    # Sorts a collection of Data objects, and fixes their end addresses.
    # Filters out objects that don't fall within the specified range.
    def sortDataCollection(self, dataStart, dataEnd):
        dataList = [d for d in self.dataSet if d.startAddr >= dataStart and d.startAddr < dataEnd]
        dataList = sorted(dataList, key=lambda d: d.startAddr)
        for i in range(len(dataList)):
            d = dataList[i]
            if i == len(dataList)-1:
                d.endAddr = dataEnd
            else:
                d.endAddr = dataList[i+1].startAddr
                d.nextData = dataList[i+1]

        return dataList

    # Prints a collection of data within a specified range
    def printDataRange(self, dataStart, dataEnd):
        dataList = self.sortDataCollection(dataStart, dataEnd)
        out = ''
        for d in dataList:
            out += d.print()
        return out.strip()



# ================================================================================
# Main program
# ================================================================================

MUSIC_BANK_1 = 0x1b
MUSIC_BANK_2 = 0x1e
MUSIC_PTR_TABLE_1 = bankedAddress(MUSIC_BANK_1, 0x0077)
MUSIC_PTR_TABLE_2 = bankedAddress(MUSIC_BANK_2, 0x007f)
NUM_TRACKS_1 = 0x30
NUM_TRACKS_2 = 0x40

if len(sys.argv) < 2:
    print('Usage: {0} <rom.gbc>'.format(sys.argv[0]))
    sys.exit(1)

f = open(sys.argv[1], 'rb')
rom = bytearray(f.read())
f.close()

dataSet = DataSet()
parsedMusicAddresses = set()

waveformAddresses = set()

opNames = {
        0x00: 'end_def',
        0x01: 'rest',
        0x94: 'unknownop_94',
        0x95: 'disable_unknown1',
        0x96: 'enable_unknown1',
        0x97: 'enable_unknown2',
        0x98: 'disable_unknown2',
        0x99: 'enable_software_envelope',
        0x9a: 'disable_software_envelope',
    }


def parseSoundChannelDefinition(ptr, channelIndex, endAddr, printPass):
    out = ''
    inLoop = False

    bank = ptr // 0x4000

    def addByteOperand():
        nonlocal out, ptr
        b = rom[ptr]
        ptr += 1
        out += ', ${0}'.format(myhex(b))

    def addWordOperand():
        nonlocal out, ptr
        b = read16(rom, ptr)
        ptr += 2
        out += ', ${0}'.format(myhex(b, 4))

    def indent():
        if inLoop:
            return ' ' * 8
        else:
            return ' ' * 4

    while True:
        if endAddr != -1 and ptr >= endAddr:
            break
        op = rom[ptr]
        ptr += 1
        if op == 0:
            out += indent() + '{0}'.format(opNames[op])
            out += '\n'
            break
        elif op == 0x01 or op >= 0x94 and op <= 0x9a:
            out += indent() + '{0}'.format(opNames[op])
            out += '\n'
        elif op == 0x9b:
            if len(out) > 0 and not (len(out) >= 2 and out[-1] == '\n' and out[-2] == '\n'):
                out += '\n'
            out += indent() + 'begin_loop ${0}\n'.format(myhex(rom[ptr]))
            ptr += 1
            if inLoop:
                print('WARNING: begin_loop opcode within a loop')
            inLoop = True
        elif op == 0x9c:
            if not inLoop:
                print('WARNING: begin_loop opcode outside a loop')
            inLoop = False
            out += indent() + 'next_loop\n\n'
        elif op == 0x9d:
            if channelIndex == 3:
                waveformAddr = bankedAddress(bank, read16(rom, ptr))
                if not printPass:
                    waveformAddresses.add(waveformAddr)
                waveformName = getWaveformName(waveformAddr)
                out += indent() + 'set_waveform {0}, ${1}'.format(waveformName, myhex(rom[ptr+2]))
                ptr += 3
                out += '\n'
            else:
                assert(channelIndex != 4)
                vol = rom[ptr]
                envDir = rom[ptr+1]
                duty = rom[ptr+2]>>6
                envCounter = rom[ptr+2]&0x3f
                out += indent() + 'set_envelope_duty ${0}, ${1}, {2}, {3}'.format(
                        myhex(vol), myhex(envDir), duty, envCounter)
                ptr += 3
                out += '\n'
        elif op == 0x9e:
            sptr = bankedAddress(bank, read16(rom, ptr))
            out += indent() + 'set_speed {0}\n'.format(getSpeedDataLabel(sptr))
            ptr += 2
            # I didn't add the speed pointer to the dataSet here, but it turned
            # out not to matter (all are accounted for anyway apparently).
        elif op == 0x9f:
            val = signedByte(rom[ptr])
            assert(val % 2 == 0)
            out += indent() + 'set_transpose {0}\n'.format(signedByte(val) // 2)
            ptr+=1
        elif op >= 0xa0 and op <= 0xaf:
            out += indent() + 'notelen {0}'.format(op&0x0f)
            out += '\n'
        elif op >= 2 and op <= 0x90 or (channelIndex == 4 and op == 0xff):
            out += indent() + 'note {0}'.format(getNoteName(op, channelIndex))
            out += '\n'
        else:
            out += indent() + 'db   ${0} ; (UNKNOWN OP)'.format(myhex(op))
            out += '\n'
    return (ptr, out)



# Set MUSIC_BANK, MUSIC_PTR_TABLE, NUM_TRACKS before calling this.
def dumpBank(indexTransformer):
    musicPtrList = []

    for i in range(0, NUM_TRACKS):
        addr = MUSIC_PTR_TABLE + 2*i
        ptr = bankedAddress(MUSIC_BANK, read16(rom, addr))
        newIndex =indexTransformer(i+1)
        assert(newIndex != -1)
        musicPtrList.append((ptr, newIndex))
        #print(hex(addr) + ': ' + hex(ptr))

    for j in range(len(musicPtrList)):
        ptr,i = musicPtrList[j]

        dataSet.addLabel(ptr, getMusicLabel(i))
        if dataSet.hasDataAt(ptr):
            continue

        def printMusicHeader(data):
            out = ''
            ptr = data.startAddr
            bank = ptr // 0x4000

            if data.getSize() == 0: # Multiple pointers referencing same data
                return out

            out += '    db   $' + myhex(rom[ptr]) + '\n'
            ptr += 1
            out += '    dw   {0}\n'.format(getSpeedDataLabel(bankedAddress(bank, read16(rom, ptr))))
            ptr += 2
            for c in range(1, 5): # Sound channels
                cptr = read16(rom, ptr)
                if cptr == 0:
                    out += '    dw   $0000\n'
                else:
                    if DEBUG:
                        out += '    dw   {0} ; {1}\n'.format(getChannelLabel(data.musicIndex, c, cptr), hex(cptr))
                    else:
                        out += '    dw   {0}\n'.format(getChannelLabel(data.musicIndex, c, cptr))
                ptr += 2
            assert(data.endAddr == ptr)
            return out

        musicHeader = Data(ptr, printMusicHeader)
        musicHeader.musicIndex = i
        dataSet.addData(musicHeader)
        ptr += 1

        # Don't parse the data more than once
        if ptr in parsedMusicAddresses:
            continue
        parsedMusicAddresses.add(ptr)

        # Dump "speed" data
        speedPtr = read16(rom, ptr)
        assert(speedPtr != 0)
        speedPtr = bankedAddress(MUSIC_BANK, speedPtr)
        if not dataSet.hasDataAt(speedPtr):
            speedData = Data(speedPtr, Data.printAsByteString)
            speedData.setLabel(getSpeedDataLabel(speedPtr))
            dataSet.addData(speedData)

        # Dump sound channels
        ptr += 2

        def parseSoundChannelData(channel, cptr):
            if channel == -1:
                label = getLoopLabel(cptr)
            else:
                label = getChannelLabel(i, channel, cptr)

            if dataSet.hasDataAt(cptr):
                if not dataSet.hasLabel(label):
                    dataSet.addLabel(cptr, label)
                return # Already processed this

            def printSoundChannelData(data):
                out = ''
                if data.getSize() == 0:
                    return out
                cptr = data.startAddr
                bank = cptr // 0x4000
                while True:
                    if cptr >= data.endAddr: # Loops can cause this to happen
                        break
                    dptr = read16(rom, cptr)
                    cptr += 2
                    if dptr == 0:
                        out += '    dw   $0000\n'
                        break
                    elif dptr == 0xffff:
                        loopPtr = bankedAddress(bank, read16(rom, cptr))
                        cptr += 2
                        out += '    dw   $ffff, ' + getLoopLabel(loopPtr) + '\n'
                        break
                    else:
                        fullPtr = bankedAddress(bank, dptr)
                        out += '    dw   {0}\n'.format(
                                getChannelDefinitionLabel(data.musicIndex, data.channelIndex, fullPtr))
                assert(cptr <= data.endAddr)
                if cptr < data.endAddr:
                    out += '; UNREFERENCED DATA\n'
                    out += getByteString(rom[cptr:data.endAddr])
                return out

            def printSoundChannelDefinitionData(data):
                out = ''
                ptr = data.startAddr

                ptr, out = parseSoundChannelDefinition(data.startAddr, data.channelIndex, data.endAddr, True)

                assert(ptr <= data.endAddr)
                if ptr < data.endAddr:
                    out += '; UNREFERENCED DATA\n'
                    out += getByteString(rom[ptr:data.endAddr])
                return out

            data = Data(cptr, printSoundChannelData)
            data.musicIndex = i
            data.channelIndex = channel
            dataSet.addData(data)
            dataSet.addLabel(cptr, label)

            # Dump "sound definitions"
            while True:
                dptr = read16(rom, cptr)
                cptr += 2
                if dptr == 0:
                    break
                elif dptr == 0xffff:
                    loopPtr = bankedAddress(MUSIC_BANK, read16(rom, cptr))
                    cptr += 2
                    parseSoundChannelData(-1, loopPtr) # Recursive call
                    break
                else:
                    fullPtr = bankedAddress(MUSIC_BANK, dptr)
                    label = getChannelDefinitionLabel(i, channel, fullPtr)
                    if not dataSet.hasLabel(label):
                        dptr = bankedAddress(MUSIC_BANK, dptr)
                        data = Data(dptr, printSoundChannelDefinitionData)
                        data.channelIndex = channel
                        data.setLabel(label)
                        dataSet.addData(data)
                        parseSoundChannelDefinition(dptr, channel, -1, False)

        # End of "parseSoundChannelData" function definition

        for c in range(1,5):
            cptr = read16(rom, ptr)
            if cptr == 0:
                continue
            cptr = bankedAddress(MUSIC_BANK, cptr)
            parseSoundChannelData(c, cptr)
            ptr += 2


# Indexing of songs makes no sense and goes through some transformations (see
# BeginMusicTrack_Dispatch functions)
def indexTransformer1b(inp):
    if inp <= 0x10:
        return inp
    elif inp <= 0x20:
        return inp+0x20
    elif inp <= 0x30:
        return inp+0x40
    return -1

def indexTransformer1e(inp):
    if inp <= 0x20:
        return inp+0x10
    elif inp <= 0x40:
        return inp+0x20


MUSIC_BANK = MUSIC_BANK_1
MUSIC_PTR_TABLE = MUSIC_PTR_TABLE_1
NUM_TRACKS = NUM_TRACKS_1
dumpBank(indexTransformer1b) # Music is 1-indexed

MUSIC_BANK = MUSIC_BANK_2
MUSIC_PTR_TABLE = MUSIC_PTR_TABLE_2
NUM_TRACKS = NUM_TRACKS_2
dumpBank(indexTransformer1e)

# Done with music definitions; now handle the waveform pointers we found

def printWaveformData(data):
    out = ''
    ptr = data.startAddr
    out += getByteString(rom[ptr:ptr+16])
    ptr += 16
    assert(ptr <= data.endAddr)
    if ptr < data.endAddr:
        out += '; UNREFERENCED DATA\n'
        out += getByteString(rom[ptr:data.endAddr])
    return out

for addr in waveformAddresses:
    data = Data(addr, printWaveformData)
    data.setLabel(getWaveformName(addr))
    dataSet.addData(data)


hardcodedAddresses = [
        bankedAddress(0x1e, 0x4b15),
        bankedAddress(0x1b, 0x4b13)
        ]

for addr in hardcodedAddresses:
    data = Data(addr, Data.printAsByteString)
    data.setLabel('HardcodedData_{0}_{1}'.format(myhex(addr // 0x4000), myhex(toGbPointer(addr), 4)))
    dataSet.addData(data)


# Hardcoded offsets for start and end of sound data segments
f = open('src/data/music/music_tracks_data_1b_1.asm', 'w')
s = dataSet.printDataRange(0x6caaa, 0x6ce2c)
f.write(s)
f.close()

f = open('src/data/music/music_tracks_data_1b_2.asm', 'w')
s = dataSet.printDataRange(0x6d000, 0x6f0a7)
f.write(s)
f.close()

f = open('src/data/music/music_tracks_data_1b_3.asm', 'w')
s = dataSet.printDataRange(0x6f100, 0x6f379)
f.write(s)
f.close()

f = open('src/data/music/music_tracks_data_1e_1.asm', 'w')
s = dataSet.printDataRange(0x78a9d, 0x78cff)
f.write(s)
f.close()

f = open('src/data/music/music_tracks_data_1e_2.asm', 'w')
s = dataSet.printDataRange(0x79000, 0x7aeb8)
f.write(s)
f.close()

f = open('src/data/music/music_tracks_data_1e_3.asm', 'w')
s = dataSet.printDataRange(0x7b000, 0x7bf9a)
f.write(s)
f.close()
