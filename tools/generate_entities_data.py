#!/usr/bin/env python3
#
# Parse the ROM, and output asm files with the entities pointer tables and data.

import os
import argparse
from textwrap import dedent
from entities_parser import *

def BANK(bank_index):
    """Return the start address of a bank"""
    return bank_index * 0x4000

entities_descriptors = [
    EntitiesTableDescriptor(
        name = 'overworld',
        address = BANK(0x16) + 0x000,
        length = 0x200,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x1186,
            length = 0x4DE
        )
    ),
    EntitiesTableDescriptor(
        name = 'indoors_a',
        address = BANK(0x16) + 0x200,
        length = 0x200,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x0640,
            length = 0x664
        )
    ),
    EntitiesTableDescriptor(
        name = 'indoors_b',
        address = BANK(0x16) + 0x400,
        length = 0x200,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x0CA4,
            length = 0x4E2
        )
    ),
    EntitiesTableDescriptor(
        name = 'color_dungeon',
        address = BANK(0x16) + 0x600,
        length = 0x40,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x1664,
            length = 0x9D
        )
    )
]

def to_camel_case(snake_str):
    """Convert a string from snake_case to CamelCase"""
    return ''.join(w.title() for w in snake_str.split('_'))

class PointersTableFormatter:
    @classmethod
    def to_asm(cls, table_name):
        return f"{to_camel_case(table_name)}EntitiesPointersTable::\n"

class PointerFormatter:
    @classmethod
    def to_asm(cls, table_name, pointer):
        room_label = "{}{:02X}".format(to_camel_case(table_name), pointer.index)
        return f"  dw    {room_label}Entities  ; ${pointer.address:04X}\n"

class EntitiesListFormatter:
    @classmethod
    def to_asm(cls, list, table_name, pointers):
        asm = ""
        for pointer in pointers:
            room_label = "{}{:02X}".format(to_camel_case(table_name), pointer.index)
            asm += f"{room_label}Entities::\n"

        for entity in list.entities:
            asm += f"  db   ${entity.position:02X}, ${entity.type:02X}\n"
        asm += "  db   ENTITIES_END\n\n"
        return asm

if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("rompath", nargs="?", metavar="rompath", type=str)
    arg_parser.add_argument("target", nargs="?", metavar="target", type=str)

    args = arg_parser.parse_args()
    rom_path = args.rompath or 'Zelda.gbc'
    target_dir = args.target or os.path.join('src', 'data', 'entities')
    disclaimer = "; File generated automatically by `tools/generate_entities_data.py`\n\n"

    pointers_file = open(os.path.join(target_dir, 'pointers_table' + '.asm'), 'w')
    pointers_file.write(disclaimer)

    for entities_descriptor in entities_descriptors:
        # Parse entities table and lists
        entities_table_parser = EntitiesTableParser(rom_path, entities_descriptor)
        pointers_file.write(PointersTableFormatter.to_asm(entities_table_parser.name))

        # Append to the pointers file
        for index, pointer in enumerate(entities_table_parser.pointers):
            pointers_file.write(PointerFormatter.to_asm(entities_table_parser.name, pointer))

        pointers_file.write("\n")

        # Write entities
        entities_file = open(os.path.join(target_dir, entities_table_parser.name + '.asm'), 'w')
        entities_file.write(disclaimer)

        for index, list in enumerate(entities_table_parser.entities_lists):
            pointers = entities_table_parser.pointers_for_list(list)
            entities_file.write(EntitiesListFormatter.to_asm(list, entities_table_parser.name, pointers))

        entities_file.close()

        # Write constants
        # TODO

    pointers_file.close()
