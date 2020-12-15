#!/usr/bin/env python3
#
# Decode or encode BG tilemap data
#
# Usage:
#  tools/convert_background.py --decode marin_beach.tilemap.compressed
#  tools/convert_background.py --decode marin_beach.tilemap.compressed -o marin_beach.tilemap
#  tools/convert_background.py --encode marin_beach-modified.tilemap -o marin_beach.tilemap.compressed

import sys
import argparse
from textwrap import wrap
from lib.background_coder import BackgroundCoder

def write_result(bytes, outfile, wrap_count=None):
    if 'b' in outfile.mode:
        outfile.write(bytes)
    else:
        text = bytes.hex()
        if wrap_count:
            text = "\n".join(wrap(text, wrap_count))
        outfile.write(text + "\n")

if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    operation_args = arg_parser.add_argument_group('Operation').add_mutually_exclusive_group()
    operation_args.add_argument('--decode', '-d', nargs=1, type=str, metavar='encoded tilemap', help='encoded binary tilemap file to decode')
    operation_args.add_argument('--encode', '-e', nargs=1, type=str, metavar='tilemap', help='raw binary tilemap file to encode')
    arg_parser.add_argument('--wrap', '-w', nargs=1, type=int, metavar='char_count', default=40, help='wrap the stdout output to a number of characters (40 by default; 0 to disable)')
    arg_parser.add_argument('--output', '-o', nargs=1, type=str, metavar='outfile', help='file to write the output to')

    args = arg_parser.parse_args()

    if args.decode is None and args.encode is None:
        arg_parser.print_help()
        sys.exit(-1)

    infile = open(args.decode[0] or args.encode[0], 'rb')
    data = infile.read()
    infile.close()

    outfile = (args.output and open(args.output[0], 'wb')) or sys.stdout
    result = bytearray()

    if args.decode:
        tilemap_bytes = BackgroundCoder.decode(data)
        for address in sorted(tilemap_bytes):
            result.append(tilemap_bytes[address])
        write_result(result, outfile, wrap_count=args.wrap[0])

    elif args.encode:
        result = BackgroundCoder.encode(data)
        write_result(result, outfile, wrap_count=args.wrap[0])

    outfile.close()

