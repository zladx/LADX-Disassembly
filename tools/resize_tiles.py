#!/usr/bin/env python3
#
# Resize a PNG file containing tiles to the given width or height.

import argparse
import os

dir_path = os.path.dirname(os.path.realpath(__file__))
gfx_py = "python3 " + os.path.join(dir_path, 'gfx', 'gfx.py')

parser = argparse.ArgumentParser(description='Resize a PNG file containing tiles to the given width or height')
parser.add_argument('--width', type=lambda x: int(x, 10), metavar='target_width', default=32, help='Target width of the png')
parser.add_argument('files', type=argparse.FileType('r'), nargs='+')
args = parser.parse_args()

for io in args.files:
  src_file = io.name
  src_filename, src_extension = os.path.splitext(src_file)
  src_2bpp_file = f"{src_filename}.2bpp"
  renamed_2bpp_file = f"{src_filename}.w{args.width}.2bpp"
  dest_file = f"{src_filename}.w{args.width}.png"
  # Step 1: convert the file to 2bpp
  if not os.system(f"{gfx_py} 2bpp {src_file}"):
    exit
  # Step 2: rename the file with the format expected by gfx.py
  os.rename(src_2bpp_file, renamed_2bpp_file)
  # Step 3: execute gfx.py on the 2bpp file
  if not os.system(f"{gfx_py} png {renamed_2bpp_file}"):
    exit
  # Step 4: replace the source file by the resized file
  os.remove(src_file)
  os.rename(dest_file, src_file)
  # Step 5: cleanup the intermediate 2bpp file
  os.remove(renamed_2bpp_file)
