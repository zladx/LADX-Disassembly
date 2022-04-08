#!/usr/bin/env python3
#
# Parse the US v1.0 ROM, and output asm files with the background tilemaps tables and data.

import os
import argparse
import re
from textwrap import dedent
from itertools import groupby
from lib.background_parser import *
from lib.utils import BANK, global_to_local

background_descriptors = [
    # BackgroundTableDescriptor(
    #     name = 'tilemaps',
    #     address = BANK(0x20) + 0x052B,
    #     length = 0x4C,
    #     data = [
    #         BackgroundDescriptor(
    #             address = BANK(0x08) + 0x0DD4,
    #             length = 0x2B4C
    #         )
    #     ]
    # ),
    BackgroundTableDescriptor(
        name = 'attrmaps',
        address = BANK(0x24) + 0x1C4B,
        length = 0x4C,
        data = [
            # US, JP
            BackgroundDescriptor(
                address = BANK(0x24) + 0x1C97,
                length = 0x174A
            ),
            BackgroundDescriptor(
                address = BANK(0x24) + 0x3BA7,
                length = 0x12A
            ),
            # FR, GE
            # BackgroundDescriptor(
            #     address = BANK(0x24) + 0x1C97,
            #     length = 0x1736
            # ),
            # BackgroundDescriptor(
            #     address = BANK(0x24) + 0x3B93,
            #     length = 0x12A
            # ),
        ]
    )
]

background_names = [
  None,                              #00
  'CreditsIslandTilemap',            #01
  'InventoryTilemap',                #02
  'MenuFileSelection',               #03
  'MenuFileSelectionCommandsTilemap',#04
  'MenuFileCreationTilemap',         #05
  'MenuFileEraseTilemap',            #06
  'MinimapTilemap',                  #07
  'WorldMapTilemap',                 #08
  'EaglesTowerCloudsTilemap',        #09
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
  'SchulePaintingTilemap',           #23
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

    def as_label(self, content_type):
        name = background_names[self.index]
        if name is None:
            return None
        return name.replace('Tilemap', content_type.capitalize())

    def as_filename(self, extension):
        name = background_names[self.index]
        if name is None:
            return None
        return f"{to_snake_case(name).replace('_tilemap', '')}.{extension}"

class PointersTableFormatter:
    @classmethod
    def to_asm(cls, table_name):
        return f"{to_camel_case(table_name)}PointersTable::\n"

class PointerFormatter:
    @classmethod
    def to_asm(cls, table_name, content_type, pointer):
        label = BackgroundName(pointer.index).as_label(content_type)
        is_pointing_to_rom = (pointer.address < 0x8000)
        if label and is_pointing_to_rom:
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

def remove_all_dumped_files(background_table_parser, extension):
    for index in range(len(background_table_parser.pointers)):
        filename = BackgroundName(index).as_filename(extension)
        if filename is None:
            continue
        filename_abs = os.path.join(target_dir, filename)
        if os.path.exists(filename_abs):
            os.remove(filename_abs)

if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("rompath", nargs="?", metavar="rompath", type=str)
    arg_parser.add_argument("target", nargs="?", metavar="target", type=str)
    arg_parser.add_argument("--format", nargs=1, metavar="format", choices=['bin', 'asm'], type=str)

    args = arg_parser.parse_args()
    rom_path = args.rompath or 'Zelda.gbc'
    target_dir = args.target or os.path.join('src', 'data', 'backgrounds')
    disclaimer = "; File generated automatically by `tools/generate_background_data.py`\n\n"

    for background_descriptor in background_descriptors:
        #
        # Parse background table and lists
        #
        background_table_parser = BackgroundTableParser(rom_path, background_descriptor)

        #
        # Compute the files type and extension
        #
        content_type = re.sub('s$', '', background_table_parser.name)
        extensions_for_format = {
            "asm": f"{content_type}.asm",
            "bin": f"{content_type}.encoded"
        }
        content_file_extension = extensions_for_format[args.format[0]]

        #
        # Write the pointers table
        #
        with open(os.path.join(target_dir, background_table_parser.name + '_pointers.asm'), 'w') as pointers_file:
            pointers_file.write(PointersTableFormatter.to_asm(background_table_parser.name))

            # Append to the pointers file
            for index, pointer in enumerate(background_table_parser.pointers):
                pointers_file.write(PointerFormatter.to_asm(background_table_parser.name, content_type, pointer))
            pointers_file.write("\n")

        #
        # Write the files include list
        #

        # Make a list of all unique pointers, in the order in which they appear in the commands list
        pointers = set()
        for index, command in enumerate(background_table_parser.list):
            pointers.update(background_table_parser.pointers_for_command(command))

        # Group pointers by similar target address
        sorted_pointers = sorted(list(pointers), key=lambda p: p.address)
        pointer_groups = groupby(sorted_pointers, lambda p: p.address)

        # Compute the target list filename
        list_filename = os.path.join(target_dir, f"{background_table_parser.name}_list.asm")

        with open(list_filename, 'w') as list_file:
            # For each group of pointers at the same address…
            for address, pointers in pointer_groups:
                immutable_pointers = list(pointers)
                # Write the labels
                labels = map(lambda p: BackgroundName(p.index).as_label(content_type), immutable_pointers)
                unique_labels = sorted(set(labels))
                list_file.write("\n".join(f"{label}::" for label in unique_labels))
                # Write the target filename include
                # (always use a path relative to 'src/')
                content_file_name = BackgroundName(immutable_pointers[0].index).as_filename(content_file_extension)
                content_file_path = os.path.join(target_dir, content_file_name).split("src/")[1]
                include = "include" if args.format[0] == "asm" else "incbin"
                list_file.write(f"\n{include} \"{content_file_path}\"\n")

        #
        # Write the content files
        #

        # Remove all previous files
        remove_all_dumped_files(background_table_parser, content_file_extension)

        if args.format == ["asm"] or args.format is None:
            # Write background files as asm files
            for index, command in enumerate(background_table_parser.list):
                pointer_index = background_table_parser.pointers_for_command(command)[0].index
                filename = os.path.join(target_dir, BackgroundName(pointer_index).as_filename(content_file_extension))
                with open(filename, 'a+') as background_file:
                    if background_file.tell() == 0:
                        background_file.write(disclaimer)
                    asm = BackgroundCommandFormatter.to_asm(command)
                    background_file.write(asm)

        elif args.format == ["bin"]:
            # Write background files as binary files
            for index, command in enumerate(background_table_parser.list):
                pointer_index = background_table_parser.pointers_for_command(command)[0].index
                filename = os.path.join(target_dir, BackgroundName(pointer_index).as_filename(content_file_extension))
                with open(filename, 'ab+') as background_file:
                    data = BackgroundCommandFormatter.to_bytes(command)
                    background_file.write(data)

