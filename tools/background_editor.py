#!/usr/bin/env python3
#
# Decode or encode BG tilemap data
#
# Usage:
#  background_editor.py --decode marin_beach_tilemap.compressed
#  background_editor.py --decode marin_beach.tilemap.compressed -o marin_beach.tilemap

import sys
import argparse
from textwrap import wrap
from lib.background_coder import BackgroundCoder

def write_result(bytes, outfile, wrapped=False):
    if 'b' in outfile.mode:
        outfile.write(bytes)
    else:
        text = bytes.hex()
        if wrapped:
            text = "\n".join(wrap(text, 40))
        outfile.write(text + "\n")

if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    operation_args = arg_parser.add_argument_group('Operation').add_mutually_exclusive_group()
    operation_args.add_argument('--decode', '-d', nargs=1, type=str, metavar='encoded tilemap', help='encoded binary tilemap file to decode')
    operation_args.add_argument('--encode', '-e', nargs=1, type=str, metavar='tilemap', help='raw binary tilemap file to encode')
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
        write_result(result, outfile, wrapped=True)

    elif args.encode:
        result = BackgroundCoder.encode(data)
        write_result(result, outfile, wrapped=False)

    outfile.close()

