#!/usr/bin/env python3
#
# Parse the ROM, and output asm files with the map headers and map data.

import os
import argparse
from textwrap import dedent
from map_parser import *

def BANK(bank_index):
    """Return the start address of a bank"""
    return bank_index * 0x4000

map_descriptors = [
    MapDescriptor(
        name = 'overworld',
        address = BANK(0x09),
        length = 512,
        data_base_address = (lambda room_index: BANK(0x09) if room_index <= 0x7F else BANK(0x1A)),
        rooms = [
            RoomsDescriptor(
                name = 'overworld_a',
                address = BANK(0x09) + 512,
                length = 9357
            ),
            RoomsDescriptor(
                name = 'overworld_b',
                address = BANK(0x1A),
                length = 7797
            )
        ]),
    # MapDescriptor(
    #     name = 'dungeons_a',
    #     address = BANK(0x0A),
    #     length = 512,
    #     data_base_address = BANK(0x0A),
    #     rooms = [
    #         RoomsDescriptor(
    #             name = 'dungeons_a',
    #             address = BANK(0x0A) + 512,
    #             length = 0x3D42
    #         )]
    # ),
    # MapDescriptor(
    #     name = 'dungeons_b',
    #     address = BANK(0x0B),
    #     length = 512,
    #     data_base_address = BANK(0x0B),
    #     invalid_pointers = [0x2FE01],
    #     rooms = [
    #         RoomsDescriptor(
    #             name = 'dungeons_b',
    #             address = BANK(0x0B) + 512,
    #             length = 0x3C00
    #         )]
    # )
]

class RoomFormatter:
    """Output annotated assembly code for a given room"""

    @classmethod
    def to_asm(cls, room):
        asm = "{}::\n".format(room.label)
        if room.animation is not None:
            asm += "  db   ${:02X} ; animation id\n".format(room.animation)
        if room.floor_tile is not None:
            asm += "  db   ${:02X} ; floor tile\n".format(room.floor_tile)
        if room.objects:
            asm += "  db   {} ; objects data\n".format(cls._bytes_to_hex(room.objects))
        asm += "  db   $FE ; room end\n\n"

        return asm

    def _bytes_to_hex(bytes):
        """
        Format an array of bytes into a string suitable for inclusion in an assembly file.
        Example: [0x01, 0x34, 0x3E] -> 'db    $01, $34, $3E'
        """
        return ', '.join('${:02X}'.format(b) for b in bytes)


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("rompath", nargs="?", metavar="rompath", type=str)
    arg_parser.add_argument("target", nargs="?", metavar="target", type=str)

    args = arg_parser.parse_args()
    rom_path = args.rompath or 'Zelda.gbc'
    target_dir = args.target or os.path.join('src', 'data')
    disclaimer = "; File generated automatically with `tools/generate_map_data.py`\n\n"

    for map_descriptor in map_descriptors:
        # Parse map and rooms in the rom file
        map_parser = MapParser(rom_path, map_descriptor)

        # Write map pointers table
        map_file = open(os.path.join(target_dir, 'map_pointers', map_descriptor.name + '.asm'), 'w')
        map_file.write(disclaimer)

        for room_pointer in map_parser.room_pointers:
            room = map_parser.room_for_pointer(room_pointer)
            if room:
                map_file.write("dw {}  ; ${:02X}\n".format(room.label, room_pointer.address))
            else:
                map_file.write("dw ${:02X}  ; Invalid room pointer\n".format(room_pointer.value))

        map_file.close()

        # Write rooms
        for rooms_parser in map_parser.rooms_parsers:
            rooms_file = open(os.path.join(target_dir, 'maps', rooms_parser.name + '.asm'), 'w')
            rooms_file.write(disclaimer)

            for index, room in enumerate(rooms_parser.rooms):
                rooms_file.write(RoomFormatter.to_asm(room))

            rooms_file.close()
