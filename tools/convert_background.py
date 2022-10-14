#!/usr/bin/env python3
#
# Decode or encode BG tilemap data using the ZLADX encoding format
#
# Usage:
#  tools/convert_background.py decode marin_beach.tilemap.encoded
#  tools/convert_background.py decode marin_beach.tilemap.encoded --output marin_beach.tilemap
#  tools/convert_background.py encode marin_beach-modified.tilemap --output marin_beach.tilemap.encoded

import sys
import argparse
from textwrap import wrap
from functools import reduce
from lib.background_coder import BackgroundCoder

def write_result(bytes, outfile, wrap_count=None):
    """
    Write as a sequence of bytes if the outfile is binary,
    but as wrapped hexadecimal values if printing on stdout.
    """
    if 'b' in outfile.mode:
        outfile.write(bytes)
    else:
        text = bytes.hex()
        if wrap_count:
            text = "\n".join(wrap(text, wrap_count))
        outfile.write(text + "\n")

if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    options_parser = argparse.ArgumentParser(add_help=False)
    options_parser.add_argument('--output', '-o', type=str, metavar='outfile', action='store', help='file to write the output to')
    options_parser.add_argument('--width', type=int, metavar='tiles_count', default=20, action='store', help='number of tiles in the tilemap width')
    options_parser.add_argument('--filler', type=lambda x: int(x, 0), metavar='filler', default=None, action='store', help='filler byte used as the tilemap background')
    options_parser.add_argument('--no-file-terminator', dest='has_file_terminator', default=True, action='store_false', help='operate on a partial tilemap without a file terminator (e.g. some menus)')

    operations_subparser = arg_parser.add_subparsers(title='commands', dest='command', required=True)
    decoding_parser = operations_subparser.add_parser('decode',  parents=[options_parser], help='convert a tilemap encoded with the ZLADX format to a raw tilemap')
    decoding_parser.add_argument('infile', type=str, help='encoded tilemap file to decode')
    decoding_parser.add_argument('--wrap', '-w', type=int, metavar='char_count', default=40, action='store', help='wrap the stdout output to a number of characters (40 by default; 0 to disable)')

    encoding_parser = operations_subparser.add_parser('encode',  parents=[options_parser], help='convert a raw tilemap to the encoded ZLADX format')
    encoding_parser.add_argument('infile', type=str, help='raw tilemap file to encode')
    encoding_parser.add_argument('--location', type=lambda x: int(x, 0), metavar="VRAM_address", default=0x9800, action='store', help='start address of the tilemap in VRAM')

    args = arg_parser.parse_args()

    infile = open(args.infile, 'rb')
    data = infile.read()
    infile.close()

    outfile = (args.output and open(args.output, 'wb')) or sys.stdout

    if args.command == 'decode':
        result = BackgroundCoder.decode(data, args.width, args.filler or 0x00, args.has_file_terminator)
        write_result(result, outfile, wrap_count=args.wrap)

    elif args.command == 'encode':
        result = BackgroundCoder.encode(data, args.location, args.width, args.filler, args.has_file_terminator)
        write_result(result, outfile)

    outfile.close()
