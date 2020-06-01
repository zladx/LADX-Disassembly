#!/usr/bin/env python3
#
# Parse the ROM, and output asm files with the entities pointer tables and data.

import os
import argparse
from textwrap import dedent
from lib.background_parser import *
from lib.utils import BANK

background_descriptors = [
    BackgroundTableDescriptor(
        name = 'background_tile_commands',
        address = BANK(0x20) + 0x052B,
        length = 0x4C,
        data = BackgroundDescriptor(
            address = BANK(0x08) + 0x0DD4,
            length = 0x2B4C
        )
    ),

    # TODO: The attributes are split into multiple areas where they are stored.
    #  so we need to split the output into multiple files and make sure not to decode any code.
    #  But we only need a single pointer list.
    #BackgroundTableDescriptor(
    #    name = 'background_attributes',
    #    address = BANK(0x24) + 0x1C4B,
    #    length = 0x4C,
    #    data = BackgroundDescriptor(
    #        address = BANK(0x24) + 0x1C97,
    #        length = 0x203A
    #    )
    #)
]

def to_camel_case(snake_str):
    """Convert a string from snake_case to CamelCase"""
    return ''.join(w.title() for w in snake_str.split('_'))

class PointersTableFormatter:
    @classmethod
    def to_asm(cls, table_name):
        return f"{to_camel_case(table_name)}PointersTable::\n"

class PointerFormatter:
    @classmethod
    def to_asm(cls, table_name, pointer):
        if pointer.index == 0 or (pointer.index == 7 and pointer.address > 0xD000):  # ignore wrong pointers
            return f"  dw    ${pointer.address:04X}\n"
        label = "{}{:02X}".format(to_camel_case(table_name), pointer.index)
        return f"  dw    {label}  ; ${pointer.address:04X}\n"

class BackgroundCommandFormatter:
    @classmethod
    def to_asm(cls, command, table_name, pointers):
        asm = ""
        for pointer in pointers:
            if (pointer.address & 0x3FFF) == (command.address & 0x3FFF):
                label = "{}{:02X}".format(to_camel_case(table_name), pointer.index)
                asm += f"{label} ; ${pointer.address:04X}\n"
        if asm != "":
            asm = "\n" + asm
        if isinstance(command, BackgroundCommandEnd):
            asm += f"  db    $00 ; end of draw commands\n"
        elif isinstance(command, BackgroundCommandSingle):
            if command.vertical:
                asm += "  db    ${:02X}, ${:02X}, ${:02X}, ${:02X} ; draw column of {:d}x the same tile\n".format(command.target_address >> 8, command.target_address & 0xFF, (command.amount - 1) | 0xC0, command.data, command.amount)
            else:
                asm += "  db    ${:02X}, ${:02X}, ${:02X}, ${:02X} ; draw row of {:d}x the same tile\n".format(command.target_address >> 8, command.target_address & 0xFF, (command.amount - 1) | 0x40, command.data, command.amount)
        elif isinstance(command, BackgroundCommandMultiple):
            if command.vertical:
                asm += "  db    ${:02X}, ${:02X}, ${:02X} ; draw column of {:d} tiles\n".format(command.target_address >> 8, command.target_address & 0xFF, (len(command.data) - 1) | 0x80, len(command.data))
            else:
                asm += "  db    ${:02X}, ${:02X}, ${:02X}; draw row of {:d} tiles\n".format(command.target_address >> 8, command.target_address & 0xFF, (len(command.data) - 1), len(command.data))
            asm += "  db    " + ", ".join(map(lambda b: "${:02X}".format(b), command.data)) + "\n"
        else:
            raise RuntimeError("Unknown command: %s" % (command))
        return asm


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("rompath", nargs="?", metavar="rompath", type=str)
    arg_parser.add_argument("target", nargs="?", metavar="target", type=str)
    arg_parser.add_argument("--dump", metavar="dump", action="store_const", const=True)

    args = arg_parser.parse_args()
    rom_path = args.rompath or 'Zelda.gbc'
    target_dir = args.target or os.path.join('src', 'data', 'backgrounds')
    dump = args.dump
    disclaimer = "; File generated automatically by `tools/generate_background_data.py`\n\n"

    for background_descriptor in background_descriptors:
        # Parse background table and lists
        background_table_parser = BackgroundTableParser(rom_path, background_descriptor)

        pointers_file = open(os.path.join(target_dir, background_table_parser.name + '_pointers.asm'), 'w')
        pointers_file.write(PointersTableFormatter.to_asm(background_table_parser.name))

        # Append to the pointers file
        for index, pointer in enumerate(background_table_parser.pointers):
            pointers_file.write(PointerFormatter.to_asm(background_table_parser.name, pointer))
        pointers_file.write("\n")

        # Write entities
        background_file = open(os.path.join(target_dir, background_table_parser.name + '.asm'), 'w')
        background_file.write(disclaimer)

        for index, command in enumerate(background_table_parser.list):
            background_file.write(BackgroundCommandFormatter.to_asm(command, background_table_parser.name, background_table_parser.pointers))

        if dump:
            mem = {}
            for command in background_table_parser.list:
                for pointer in background_table_parser.pointers:
                    if (pointer.address & 0x3FFF) == (command.address & 0x3FFF):
                        label = "{}{:02X}".format(to_camel_case(background_table_parser.name), pointer.index)
                        print(f"{label}:")
                if isinstance(command, BackgroundCommandEnd) and mem:
                    start = min(mem.keys()) & 0xFFE0
                    end = (max(mem.keys()) | 0x001F) + 1
                    for row in range(start, end, 0x20):
                        print(("".join(map(lambda addr: "{:02X}".format(mem[addr]) if addr in mem else "  ", range(row, row+0x20)))).rstrip())
                    mem = {}
                elif isinstance(command, BackgroundCommandSingle):
                    address = command.target_address
                    for n in range(command.amount):
                        mem[address] = command.data
                        if command.vertical:
                            address += 0x20
                        else:
                            address += 1
                elif isinstance(command, BackgroundCommandMultiple):
                    address = command.target_address
                    for n in range(len(command.data)):
                        mem[address] = command.data[n]
                        if command.vertical:
                            address += 0x20
                        else:
                            address += 1
        background_file.close()
        pointers_file.close()

