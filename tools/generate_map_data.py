#!/usr/bin/env python3
#
# Parse the ROM, and output asm files with the map headers and map data.

import os
import argparse
from textwrap import dedent
from lib.map_parser import *
from lib.utils import BANK

map_descriptors = [
    MapDescriptor(
        name = 'overworld',
        address = BANK(0x09),
        length = 0x200,
        data_base_address = (lambda room_index: BANK(0x09) if room_index <= 0x7F else BANK(0x1A)),
        rooms = [
            RoomsDescriptor(
                name = 'overworld_a',
                address = BANK(0x09) + 512,
                length = 9357,
                klass = OverworldRoom
            ),
            RoomsDescriptor(
                name = 'overworld_b',
                address = BANK(0x1A),
                length = 7797,
                klass = OverworldRoom
            )
        ]),
    MapDescriptor(
        name = 'indoors_a',
        address = BANK(0x0A),
        length = 0x200,
        data_base_address = BANK(0x0A),
        rooms = [
            RoomsDescriptor(
                name = 'indoors_a',
                address = BANK(0x0A) + 0x200,
                length = 0x3977,
                klass = IndoorRoom
            )]
    ),
    MapDescriptor(
        name = 'indoors_b',
        address = BANK(0x0B),
        length = 0x200,
        data_base_address = BANK(0x0B),
        invalid_pointers = [0x2FE01],
        rooms = [
            RoomsDescriptor(
                name = 'indoors_b',
                address = BANK(0x0B) + 0x200,
                length = 0x3C00,
                klass = IndoorRoom
            )]
    ),
    MapDescriptor(
        name = 'color_dungeon',
        address = BANK(0x0A) + 0x200 + 0x3977,
        length = 0x40,
        data_base_address = BANK(0x0A),
        invalid_pointers = [BANK(0x0A) + 0x200],
        rooms = [
            RoomsDescriptor(
                name = 'color_dungeon',
                address = BANK(0x0A) + 0x200 + 0x3977 + 0x40,
                length = 0x38B,
                klass = IndoorRoom
            )
        ]
    )
]

class RoomFormatter:
    """Output annotated assembly code for a given room"""

    @classmethod
    def to_asm(cls, room):
        asm = "{}::\n".format(room.label)
        if room.animation_id is not None:
            asm += "  db   {} ; animation id\n".format(cls._asm_animation_id(room))

        if room.floor_tile is not None and room.template is not None:
            asm += "  db   {} | ${:02X} ; room template | floor tile\n".format(cls._asm_room_template(room), room.floor_tile)
        elif room.floor_tile is not None:
            asm += "  db   ${:02X} ; floor tile\n".format(room.floor_tile)

        if room.objects:
            for room_object in room.objects:
                asm += "  db   {:23} ; object\n".format(cls._bytes_to_hex(room_object))
        asm += "  db   ROOM_END\n\n"

        return asm

    def _asm_room_template(room):
        return room.template_id_constant() or "${:02X}".format(room.template << 4)

    def _asm_animation_id(room):
        return room.animation_id_constant() or "${:02X}".format(room.animation_id)

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
    disclaimer = "; File generated automatically by `tools/generate_map_data.py`\n\n"

    for map_descriptor in map_descriptors:
        # Parse map and rooms in the rom file
        map_parser = MapParser(rom_path, map_descriptor)

        # Write map pointers table
        map_file = open(os.path.join(target_dir, 'maps', map_descriptor.name + '.asm'), 'w')
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
            rooms_file = open(os.path.join(target_dir, 'rooms', rooms_parser.name + '.asm'), 'w')
            rooms_file.write(disclaimer)

            for index, room in enumerate(rooms_parser.rooms):
                rooms_file.write(RoomFormatter.to_asm(room))

            rooms_file.close()

        # Write constants
        with open(os.path.join(target_dir, '..', 'constants', 'animated_tiles.asm'), 'w') as file:
            i = 0
            file.write(disclaimer)
            file.write("; Values for hAnimatedTilesGroup\n")
            for animated_tiles_constant in ANIMATED_TILES_IDS:
                file.write("{:29} equ ${:02X}\n".format(animated_tiles_constant, i))
                i += 1

        with open(os.path.join(target_dir, '..', 'constants', 'room_templates.asm'), 'w') as file:
            i = 0
            file.write(disclaimer)
            file.write("; Values for indoor rooms templates\n")
            for template_constant in TEMPLATE_IDS:
                file.write("{:35} equ ${:02X}\n".format(template_constant, i << 4))
                i += 1
