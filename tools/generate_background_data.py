#!/usr/bin/env python3
#
# Parse the ROM, and output asm files with the background tilemaps tables and data.

import os
import argparse
import re
from textwrap import dedent
from lib.background_parser import *
from lib.utils import BANK, global_to_local

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

background_names = [
  None,                              #00
  'CreditsIslandTilemap',            #01
  'BackgroundTileCommands02',        #02
  'BackgroundTileCommands03',        #03
  'MenuFileSelectionTilemap',        #04
  'MenuFileCreationTilemap',         #05
  'BackgroundTileCommands06',        #06
  None,                              #07
  'WorldMapTilemap',                 #08
  'BackgroundTileCommands09',        #09 (inventory no minimap?)
  'GameOverTilemap',                 #0A
  'InventoryDebugTilemap',           #0B
  'MenuFileCopyTilemap',             #0C
  'MenuFileSaveTilemap',             #0D
  'IntroSeaDMGTilemap',              #0E
  'IntroLinkFaceTilemap',            #0F
  'IntroBeachTilemap',               #10
  'TitleTilemap',                    #11
  'PeachTilemap',                    #12
  'MarinBeachTilemap',               #13
  'MamuTilemap',                     #14
  'FaceShrineMuralTilemap',          #15
  'CreditsStairsTilemap',            #16
  'CreditsLinkOnSeaLargeTilemap',    #17
  'CreditsSunAboveTilemap',          #18
  'CreditsLinkOnSeaCloseTilemap',    #19
  'CreditsLinkSeatedOnLogTilemap',   #1A
  'CreditsLinkFaceCloseUpTilemap',   #1B
  'CreditsRollTilemap',              #1C
  'CreditsRollTilemap',              #1D
  'CreditsKidsTilemap',              #1E
  'CreditsMarinSingingTilemap',      #1F
  'CreditsMrsMeowMeowsHouseTilemap', #20
  'CreditsTarinTilemap',             #21
  'CreditsBeachTilemap',             #22
  'EaglesTowerFIXMETilemap',         #23
  'EaglesTowerCollapseTilemap',      #24
  'IntroSeaCGBTilemap',              #25
]

def to_camel_case(snake_str):
    """Convert a string from snake_case to CamelCase"""
    return ''.join(w.title() for w in snake_str.split('_'))

def to_snake_case(camel_str):
    """Convert a string from CamelCase to snake_case"""
    regexp = re.compile('((?<=[a-z0-9])[A-Z]|(?!^)[A-Z](?=[a-z]))')
    return regexp.sub(r'_\1', camel_str).lower()

class BackgroundName:
    def __init__(self, index):
        self.index = index

    def as_label(self):
        return background_names[self.index]

    def as_filename(self, extension):
        name = background_names[self.index]
        if name is None:
            return None
        return f"{to_snake_case(name).replace('_tilemap', '')}.tilemap.encoded.{extension}"

class PointersTableFormatter:
    @classmethod
    def to_asm(cls, table_name):
        return f"{to_camel_case(table_name)}PointersTable::\n"

class PointerFormatter:
    @classmethod
    def to_asm(cls, table_name, pointer):
        label = BackgroundName(pointer.index).as_label()
        if label:
          return f"._{pointer.index:02X} dw {label.ljust(32, ' ')} ; ${pointer.address:04X}\n"
        else:
          return f"._{pointer.index:02X} dw ${pointer.address:04X}\n"

class BackgroundCommandFormatter:
    @classmethod
    def to_asm(cls, command):
        asm = ""
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

    @classmethod
    def to_bytes(cls, command):
        bytes = bytearray()
        if isinstance(command, BackgroundCommandEnd):
            bytes.append(0x00)
        elif isinstance(command, BackgroundCommandSingle):
            if command.vertical:
                bytes.extend([command.target_address >> 8, command.target_address & 0xFF, (command.amount - 1) | 0xC0, command.data])
            else:
                bytes.extend([command.target_address >> 8, command.target_address & 0xFF, (command.amount - 1) | 0x40, command.data])
        elif isinstance(command, BackgroundCommandMultiple):
            if command.vertical:
                bytes.extend([command.target_address >> 8, command.target_address & 0xFF, (len(command.data) - 1) | 0x80])
            else:
                bytes.extend([command.target_address >> 8, command.target_address & 0xFF, (len(command.data) - 1)])
            bytes.extend(command.data)
        else:
            raise RuntimeError("Unknown command: %s" % (command))
        return bytes

if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("rompath", nargs="?", metavar="rompath", type=str)
    arg_parser.add_argument("target", nargs="?", metavar="target", type=str)
    arg_parser.add_argument("--format", nargs=1, metavar="format", choices=['bin', 'asm', 'decoded'], type=str)

    args = arg_parser.parse_args()
    rom_path = args.rompath or 'Zelda.gbc'
    target_dir = args.target or os.path.join('src', 'data', 'backgrounds')
    disclaimer = "; File generated automatically by `tools/generate_background_data.py`\n\n"

    for background_descriptor in background_descriptors:
        # Parse background table and lists
        background_table_parser = BackgroundTableParser(rom_path, background_descriptor)

        # Write the pointers table
        with open(os.path.join(target_dir, background_table_parser.name + '_pointers.asm'), 'w') as pointers_file:
            pointers_file.write(PointersTableFormatter.to_asm(background_table_parser.name))

            # Append to the pointers file
            for index, pointer in enumerate(background_table_parser.pointers):
                pointers_file.write(PointerFormatter.to_asm(background_table_parser.name, pointer))
            pointers_file.write("\n")

        if args.format == ["asm"] or args.format is None:
            # Remove all previous files
            for index in range(len(background_table_parser.pointers)):
                filename = BackgroundName(index).as_filename('asm')
                if filename is None:
                    continue
                filename_abs = os.path.join(target_dir, filename)
                if os.path.exists(filename_abs):
                    os.remove(filename_abs)

            # Write background files as asm files
            for index, command in enumerate(background_table_parser.list):
                pointer_index = background_table_parser.pointers_for_command(command)[0].index
                filename = os.path.join(target_dir, BackgroundName(pointer_index).as_filename('asm'))
                with open(filename, 'a+') as background_file:
                    if background_file.tell() == 0:
                        background_file.write(disclaimer)
                    asm = BackgroundCommandFormatter.to_asm(command)
                    background_file.write(asm)

        elif args.format == ["bin"]:
            # Remove all previous files
            for index in range(len(background_table_parser.pointers)):
                filename = BackgroundName(index).as_filename('bin')
                if filename is None:
                    continue
                filename_abs = os.path.join(target_dir, filename)
                if os.path.exists(filename_abs):
                    os.remove(filename_abs)

            # Write background files as binary files
            for index, command in enumerate(background_table_parser.list):
                pointer_index = background_table_parser.pointers_for_command(command)[0].index
                filename = os.path.join(target_dir, BackgroundName(pointer_index).as_filename('bin'))
                with open(filename, 'ab+') as background_file:
                    data = BackgroundCommandFormatter.to_bytes(command)
                    background_file.write(data)

        elif args.format == ["decoded"]:
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

