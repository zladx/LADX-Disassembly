#!/usr/bin/env python3
import argparse

parser = argparse.ArgumentParser(description='Convert a local bank:offset address into a global ROM address')
parser.add_argument('address', type=str, metavar='local_address', help='A local bank:offset address.')
args = parser.parse_args()

bank, offset = (int(v, 16) for v in args.address.split(':'))
global_address = (max(bank - 1, 0) * 0x4000) + offset
print('0x{:X}'.format(global_address))
