from collections import namedtuple

# Describe the location of a entities pointers table
EntitiesTableDescriptor = namedtuple('EntitiesTableDescriptor', ['name', 'address', 'length', 'entities'])

# Describe the location of a list of entities
EntitiesDescriptor = namedtuple('EntitiesDescriptor', ['address', 'length'])

# Represent a pointer in a pointers table
Pointer = namedtuple('Pointer', ['index', 'address'])

def to_camel_case(snake_str):
    """Convert a string from snake_case to CamelCase"""
    return ''.join(w.title() for w in snake_str.split('_'))

class EntitiesTableParser:
    """
    Parse a entities pointers table and its associated entities from a EntitiesTableDescriptor.
    """
    def __init__(self, rom_path, table_descriptor):
        self.table_descriptor = table_descriptor
        self.name = table_descriptor.name

        with open(rom_path, 'rb') as rom_file:
            rom = rom_file.read()
            self.pointers = self._parse_pointers_table(rom, table_descriptor)
            self.entities_lists = EntitiesListsParser(rom, table_descriptor.entities).lists

    def pointers_for_list(self, list):
        local_list_address = list.address - (0x16 * 0x4000) + 0x4000
        return [pointer for pointer in self.pointers if pointer.address == local_list_address]

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

class EntitiesListsParser:
    """
    Parse an area containing lists of entities (one list per room).
    """
    def __init__(self, rom, entities_descriptor):
        self.lists = self._parse(rom, entities_descriptor)

    def _parse(self, rom, descriptor):
        """Walk the lists, and parse data for each list"""
        lists = []
        address = descriptor.address
        end_address = descriptor.address + descriptor.length

        while address < end_address:
            list = EntitiesList(rom, address)
            lists.append(list)
            address += list.length

        return lists

LIST_END = 0xFF

class EntitiesList:
    """Represents the entities in a room"""
    def __init__(self, rom, address):
        self.address = address
        self.entities = self._parse(rom, address)
        self.length = len(self.entities) * 2 + 1

    def _parse(self, rom, address):
        i = 0
        entities = []

        while True:
            byte = rom[address + i]
            if byte == LIST_END:
                i += 1
                break
            else:
                entity = Entity(rom[address + i + 1], rom[address + i])
                entities.append(entity)
                i += 2

        return entities


class Entity:
    """Represent an entity type and position in a room"""
    def __init__(self, type, position):
        self.type = type
        self.horizontal = position & 0x0F
        self.vertical = position >> 4
