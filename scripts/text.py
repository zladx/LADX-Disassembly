#!/usr/bin/python3
import struct
from pprint import pprint

NUMSTRINGS = 688
END_CHARS = ("@", "<ask>")
POINTER_TABLE_ADDRESS = 0x1c*0x4000 + 0x0001
BANK_TABLE_ADDRESS = 0x1c*0x4000 + 0x0741

def readbyte():  return struct.unpack("B",  rom.read(1))[0]
def readshort(): return struct.unpack("<H", rom.read(2))[0]
def readchar():
    char = rom.read(1)
    if ord(char) in charmap:
        char = charmap[ord(char)]
    else:
        char = char.decode('ascii')
    return char

def peekchar():
    char = readchar()
    rom.seek(-1, 1)
    return char

charmap = {}
for line in open("src/constants/charmap.asm"):
    if line.startswith("charmap"):
        line = line.split(" ", 1)[1]
        string, num = line.split(",", 2)
        string = string.strip()[1:-1]
        num = int(num.strip().lstrip("$"), 16)
        charmap[num] = string
    

rom = open("Zelda.gbc", "br")

rom.seek(POINTER_TABLE_ADDRESS)
pointers = []

for i in range(NUMSTRINGS):
    pointer = readshort()
    pointers.append(pointer)
    #print(i, hex(offset))
    
rom.seek(BANK_TABLE_ADDRESS)
banks = []

for i in range(NUMSTRINGS):
    bank = readbyte()
    banks.append(bank)
    #print(i, hex(bank))

strings = []
addresses = {}
end_addresses = []

for i in range(NUMSTRINGS):
    bank = banks[i]
    pointer = pointers[i]
    address = (bank&0x3f)*0x4000 + pointer-0x4000
    if address in addresses:
        addresses[address].append(i)
    else:
        addresses[address] = [i]
    rom.seek(address)
    string = []
    line = ""
    chars = 0
    while True:
        char = readchar()
        line += char
        chars += 1
        if chars >= 16 or char in END_CHARS:
            string.append(line)
            line = ""
            chars = 0
            if char in END_CHARS:
                if string[-1] == "@":
                    string[-2] += "@"
                    string.pop(-1)
                next_char = peekchar()
                if next_char not in END_CHARS:
                    break
    strings.append(string)
    end_addresses.append(rom.tell())

def print_strings():
    last_address = None
    
    for address in sorted(addresses):
        indexes = addresses[address]
        string = strings[indexes[0]]
        #print(address, index)
        if last_address != address:
            print("SECTION \"Text at {1:02x}:{0:04x}\", ROMX[${0:04x}], BANK[${1:02x}]".format(address%0x4000 + 0x4000, address//0x4000))
        for index in indexes:
            label = "Dialogue{}".format(index)
            print("{}::".format(label))
        for line in string:
            print("\tdb \"{}\"".format(line))
        #print("; {:x}".format(end_addresses[index]))
        last_address = end_addresses[indexes[0]]
        print()

def print_pointer_table():
    bank = POINTER_TABLE_ADDRESS // 0x4000
    pointer = POINTER_TABLE_ADDRESS % 0x4000 + 0x4000
    print("SECTION \"Text pointer table\", ROMX[${:04x}], BANK[${:02x}]".format(pointer, bank))
    for i in range(NUMSTRINGS):
        print("\tdw Dialogue{}".format(i))
    
    print()
    bank = BANK_TABLE_ADDRESS // 0x4000
    pointer = BANK_TABLE_ADDRESS % 0x4000 + 0x4000
    print("SECTION \"Text bank table\", ROMX[${:04x}], BANK[${:02x}]".format(pointer, bank))
    for i in range(NUMSTRINGS):
        bank = banks[i]
        bank_high = bank & 0xc0
        if bank_high:
            print("\tdb BANK(Dialogue{}) | ${:02x}".format(i, bank_high))
        else:
            print("\tdb BANK(Dialogue{})".format(i))

if __name__ == "__main__":
    # comment/uncomment whichever you want

    pprint(dict(enumerate(strings)))
    #print_strings()
    #print_pointer_table()
