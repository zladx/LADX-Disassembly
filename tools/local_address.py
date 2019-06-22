#!/usr/bin/env python3
import argparse

parser = argparse.ArgumentParser(description='Convert a global address in the ROM binary into a local bank:offset address')
parser.add_argument('address', type=lambda x: int(x, 16), metavar='global_address', help='A global address in the ROM binary.')
args = parser.parse_args()

bank = args.address // 0x4000
offset = (args.address % 0x4000) + (0x4000 if bank else 0)
print('{:02X}:{:04X}'.format(bank, offset))
