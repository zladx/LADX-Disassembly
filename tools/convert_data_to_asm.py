#!/usr/bin/env python3
#
# Convert a range of data into hexadecimal assembly code.
# Usage:
#   tools/convert_data_to_asm.py 04:4000 04:4010

import argparse
from lib.utils import parse_local_address, local_to_global

if __name__ == "__main__":
  # Parse arguments
  parser = argparse.ArgumentParser(description='Convert a range of data into hexadecimal assembly code')
  parser.add_argument('rom_path', nargs="?", metavar="rom_path", type=str, help='The ROM file to extract data from (by default `Zelda.gbc`)')
  parser.add_argument('start_address', type=str, metavar='range start', help='The range start (included), as a local `bank:offset` address.')
  parser.add_argument('end_address', type=str, metavar='range start', help='The range end (excluded), as a local `bank:offset address.')

  args = parser.parse_args()

  rom_path = args.rom_path or 'Zelda.gbc'
  start_address = parse_local_address(args.start_address)
  end_address = parse_local_address(args.end_address)
  start_offset = local_to_global(start_address)
  end_offset = local_to_global(end_address)
  bytes_count = end_offset - start_offset

  # Read bytes
  with open(rom_path, 'rb') as rom_file:
    #rom = rom_file.read()
    rom_file.seek(start_offset, 0)
    bytes = rom_file.read(bytes_count)

  # Print bytes
  bytes_per_line = 8
  gutter = max(50, 9 + bytes_per_line * 5)
  label = f'Data_{start_address.bank:03X}_{start_address.offset:04X}::'

  print(label)
  for i in range(0, len(bytes), bytes_per_line):
    line_bytes = bytes[i:i+bytes_per_line]
    line = '    db   ' + ', '.join(f"${byte:02X}" for byte in line_bytes)
    line = line.ljust(gutter) + f'; ${(start_address.offset + i):04X}'
    print(line)
