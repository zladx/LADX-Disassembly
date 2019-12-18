#!/usr/bin/env python3
#
# Convert a jump table raw bytes into a list of labels.
# Usage:
#   tools/jptable_to_asm.py 07:430B

import argparse
from lib.utils import parse_local_address, local_to_global

if __name__ == "__main__":
  # Parse arguments
  parser = argparse.ArgumentParser(description='Convert a jump table raw bytes into a list of labels')
  parser.add_argument('rom_path', nargs="?", metavar="rom_path", type=str, help='The ROM file to extract data from (by default `Zelda.gbc`)')
  parser.add_argument('start_address', type=str, metavar='range start', help='The start of the jump table (rst 0 instruction), as a local `bank:offset` address.')

  args = parser.parse_args()

  rom_path = args.rom_path or 'Zelda.gbc'
  start_address = parse_local_address(args.start_address)
  start_offset = local_to_global(start_address)
  pointers = []

  with open(rom_path, 'rb') as rom_file:
    # Read `rst 0` byte
    rom_file.seek(start_offset, 0)
    opcode = rom_file.read(1)
    if opcode != b'\xc7':
      print(f"Error: first byte read should be the jump table instruction (`rst 0`), but was {opcode} instead.")
      exit(-1)

    # Read pointers one-by-one
    max_pointers_count = 32
    for i in range(0, max_pointers_count):
      low_byte, high_byte = rom_file.read(2)
      pointer = high_byte * 0x100 + low_byte

      # If the pointer isn't in the addressable ROM range, it's probably random data,
      # and we probably reached the end of the table.
      addressable_rom_range = range(0x0000, 0x8000)
      if not pointer in addressable_rom_range:
        break

      pointers.append(pointer)

      # If the next address is a pointer in the table, we
      # probably reached the end of the table.
      next_address = start_address.offset + 1 + (i + 1) * 2
      if next_address in pointers:
        break

  # Print the jump-table pointers
  gutter = 50
  header = f'    JP_TABLE'
  header = header.ljust(gutter) + f'; ${(start_address.offset):04X}'
  print(header)

  for i, pointer in enumerate(pointers):
    if 0x4000 < pointer < 0x8000:
      pointer_label = f'func_{start_address.bank:03X}_{pointer:04X}'
    else:
      pointer_label = f'${pointer:04X}'
    line = f'._{i:02X} dw {pointer_label}'
    line = line.ljust(gutter) + f'; ${(start_address.offset + i*2 + 1):04X}'
    print(line)
