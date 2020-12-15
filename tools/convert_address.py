#!/usr/bin/env python3
#
# Convert a local bank:offset address into a global ROM address, and reciprocally.

# Usage:
#   tools/convert_address.py 04:54AC
#   tools/convert_address.py 0x34556

import argparse
from lib.utils import parse_local_address, local_to_global, global_to_local

parser = argparse.ArgumentParser(description='Convert a local bank:offset address into a global ROM address, and reciprocally.')
parser.add_argument('address', type=str, metavar='global_or_local_address', help='A global 0xoffset address, or a local bank:offset address.')
args = parser.parse_args()

if ':' in args.address:
    local_address = args.address
    global_address = local_to_global(parse_local_address(local_address))
    print(f'0x{global_address:X}')
else:
    global_address = int(args.address, base=16)
    local_address = global_to_local(global_address)
    print(f'{local_address.bank:02X}:{local_address.offset:04X}')
