from collections import namedtuple
from lib.utils import global_to_local

# Describe the location of a tilemap pointers table
BackgroundTableDescriptor = namedtuple('BackgroundTableDescriptor', ['name', 'address', 'length', 'data'])

# Describe the location of a tilemap
BackgroundDescriptor = namedtuple('BackgroundDescriptor', ['address', 'length'])

# Represent a pointer in a pointers table
Pointer = namedtuple('Pointer', ['index', 'address'])

class BackgroundTableParser:
    """
    Parse a tilemap pointers table and its associated tilemaps from a BackgroundTableDescriptor.
    """
    def __init__(self, rom_path, table_descriptor):
        self.table_descriptor = table_descriptor
        self.name = table_descriptor.name

        with open(rom_path, 'rb') as rom_file:
            rom = rom_file.read()
            self.pointers = self._parse_pointers_table(rom, table_descriptor)
            self.list = BackgroundListsParser(rom, table_descriptor.data).list

    def pointers_for_command(self, command):
        nearest_previous_pointer = None
        local_command_address = global_to_local(command.address).offset
        sorted_pointers = sorted(self.pointers, key=lambda p: p.address)
        #l_p = map(lambda p: f"{p.address:04X}", sorted_pointers)
        #print(f"{local_command_address:04X}")
        #print(list(l_p))
        for pointer in reversed(sorted_pointers):
            if pointer.address <= local_command_address:
                nearest_previous_pointer = pointer
                break

        return [pointer for pointer in self.pointers if pointer.address == nearest_previous_pointer.address]

    def _parse_pointers_table(self, rom, table_descriptor):
        """Return an array of words in the pointers table"""
        # Figure out where the bytes for this pointer are located
        table_address = table_descriptor.address
        pointers_count = table_descriptor.length // 2
        pointers = []

        for index in range(0, pointers_count):
            pointer_address = table_address + (index * 2)

            # Grab the two bytes making up the partial pointer
            lower_byte = rom[pointer_address]
            higher_byte = rom[pointer_address + 1]

            # Combine the two bytes into a single pointer (0x byte1 byte2)
            target_address = (higher_byte << 8) + lower_byte

            # Store the data into the parsed pointers table
            pointer = Pointer(index = index, address = target_address)
            pointers.append(pointer)

        return pointers

END_OF_LIST = 0x00

class BackgroundListsParser:
    """
    Parse an area containing lists of background draw commands (one list per background entry).
    """
    def __init__(self, rom, entities_descriptor):
        self.list = []
        self._parse(rom, entities_descriptor)

    def _parse(self, rom, descriptor):
        """Walk the lists, and parse data for each list"""
        address = descriptor.address
        end_address = address + descriptor.length

        while address < end_address:
            if rom[address] == END_OF_LIST:
                self.list.append(BackgroundCommandEnd(address))
                address += 1
                continue

            address_high = rom[address]
            address_low = rom[address+1]
            draw_address = (address_high << 8) | address_low
            command = rom[address+2] & 0xC0
            count = (rom[address + 2] & 0x3F) + 1

            if (command & 0xC0) == 0x00:
                self.list.append(BackgroundCommandMultiple(address, draw_address, False, rom[address+3:address+3+count]))
                address += 3 + count
            elif (command & 0xC0) == 0x40:
                self.list.append(BackgroundCommandSingle(address, draw_address, False, rom[address+3], count))
                address += 4
            elif (command & 0xC0) == 0x80:
                self.list.append(BackgroundCommandMultiple(address, draw_address, True, rom[address+3:address+3+count]))
                address += 3 + count
            else:
                self.list.append(BackgroundCommandSingle(address, draw_address, True, rom[address+3], count))
                address += 4

class BackgroundCommandEnd():
    def __init__(self, address):
        self.address = address

class BackgroundCommandMultiple:
    def __init__(self, address, target_address, vertical, data):
        self.address = address
        self.target_address = target_address
        self.vertical = vertical
        self.data = data

class BackgroundCommandSingle:
    def __init__(self, address, target_address, vertical, data, amount):
        self.address = address
        self.target_address = target_address
        self.vertical = vertical
        self.data = data
        self.amount = amount
