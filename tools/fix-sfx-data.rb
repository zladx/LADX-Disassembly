#!/usr/bin/env ruby
#
# Given a source file, scan the unresolved data raw addresses,
# and emit an SYM file with additional data labels for those addresses.
#
# This SYM-file can then be fed into mgbdis to generate a new disassembly
# that includes the proper data blocks.
#
# For best results:
#  - Document symbols in the original source file the best you can.
#  - Label the jump tables.
#  - Label internal call and jp addreses
#  - Maybe remove duplicated labels for the same location

def usage
  puts "Usage:"
  puts "  tools/fix-sfx-data.rb <asm-file> <bank-number>"
end

LocalAddress = Struct.new(:bank, :offset) do
  def self.from_string(str)
    bank, offset = str.split(':')
    self.new(bank.to_i(16), offset.to_i(16))
  end

  def to_s
    ("%02x:%02x" % [bank, offset]).upcase
  end

  def to_global
    return [bank - 1, 0].max * 0x4000 + offset
  end

  def inspect
    "#<LocalAddress #{to_s}>"
  end

  def in_bank?(bank_number)
    return bank == bank_number && (0x4000...0x8000).include?(offset)
  end
end

module Mgbdis
  Symbol = Struct.new(:address, :label, :length) do
    def self.from_string(str)
      address, label = str.split(' ')
      self.new(LocalAddress.from_string(address), label)
    end

    def self.from_address(address)
      label = "Data_" + ("%03x_%04x" % [address.bank, address.offset]).upcase
      self.new(address, label)
    end

    def data_label?
      label.downcase.start_with?('data_')
    end
  end
end

asm_file, bank_number, *the_rest = ARGV
if asm_file.nil? || bank_number.nil?
  usage
  exit -1
end

bank_number = bank_number.to_i(16)
sym_file = 'game.sym'

# Read the existing symbols from the SYM files
all_symbols = File.readlines(sym_file)
  .map(&:strip)
  .reject { |l| l.start_with?(';') || l.empty? }
  .map { |l| Mgbdis::Symbol.from_string(l) }


# 1. Extract the addresses of data used as parameters to GetHandlerAddressInTable
handler_table_addresses = File.read(asm_file)
  .scan(/ld   hl, Data_01F_(.{4}).*\n *call GetHandlerAddressInTable/)
  .flatten
  .map { |offset_str| offset_str.to_i(16) }
  .map { |offset| LocalAddress.new(bank_number, offset) }

handler_table_addresses << LocalAddress.new(bank_number, 0x7012)

# 2. Read the pointers in the handler tables, and generate new data symbols for the pointer targets
rom = File.open('Zelda.gbc', 'rb')
symbols_in_handler_tables = handler_table_addresses
  .map do |table_address|
    target_symbols = []
    rom.seek(table_address.to_global)
    loop do
      l = rom.readbyte
      h = rom.readbyte
      target_address = LocalAddress.new(bank_number, h * 0x100 + l)
      break if !target_address.in_bank?(bank_number)
      target_symbols << Mgbdis::Symbol.from_address(target_address)
    end
    target_symbols
  end
  .flatten

# Add the new symbols to the global ones
all_symbols = (all_symbols + symbols_in_handler_tables).uniq

# Extract the symbols for the requested bank
symbols = all_symbols.reject { |s| s.address.bank != bank_number }

# Sort the bank symbols by address
symbols.sort_by! { |s| s.address.offset }

# For each data symbol, compute its actual length
# (i.e. the distance with the next symbol.)
symbols.each.with_index do |sym, index|
  if sym.data_label?
    next_sym = symbols[index + 1]
    next_sym_address = next_sym&.address&.offset || 0x7fff
    sym.length = next_sym_address - sym.address.offset
  end
end

# Emit the mgbdis-compatible symbols, including the fixed data
all_symbols
  .each do |s|
    puts "#{s.address} #{s.label}"
    if !s.length.nil?
      puts "#{s.address} .data:%x" % [s.length]
    end
  end
