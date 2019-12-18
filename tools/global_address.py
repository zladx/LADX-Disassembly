#!/usr/bin/env python3
#
# Convert a local bank:offset address into a global ROM address.
# Usage:
#   tools/global_address.py 04:54AC

import argparse
from lib.utils import parse_local_address, local_to_global

parser = argparse.ArgumentParser(description='Convert a local bank:offset address into a global ROM address')
parser.add_argument('address', type=str, metavar='local_address', help='A local bank:offset address.')
args = parser.parse_args()

global_address = local_to_global(parse_local_address(args.address))
print(f'0x{global_address:X}')
