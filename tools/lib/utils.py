# Various utility functions
from collections import namedtuple

# Data-type to represent a local `bank:offset` address
LocalAddress = namedtuple('LocalAddress', ['bank', 'offset'])

def parse_local_address(address):
  '''Separate a local address into bank and offset components'''
  bank, offset = (int(v, 16) for v in address.split(':'))
  return LocalAddress(bank, offset)

def local_to_global(local_address):
  '''Convert a local bank:offset address to a global address'''
  return (max(local_address.bank - 1, 0) * 0x4000) + local_address.offset

def global_to_local(global_address):
  '''Convert a global address to a local bank:offset address'''
  bank = global_address // 0x4000
  offset = (global_address % 0x4000) + (0x4000 if bank else 0)
  return LocalAddress(bank, offset)

def BANK(bank_index):
    '''Return the start address of a bank'''
    return bank_index * 0x4000
