#!/usr/bin/env python3
import argparse
from lib.utils import global_to_local

parser = argparse.ArgumentParser(description='Convert a global address in the ROM binary into a local bank:offset address')
parser.add_argument('address', type=lambda x: int(x, 16), metavar='global_address', help='A global address in the ROM binary.')
args = parser.parse_args()

local_address = global_to_local(args.address)
print(f'{local_address.bank:02X}:{local_address.offset:04X}')
