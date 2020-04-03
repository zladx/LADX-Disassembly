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
  puts "  tools/fix-data-sym.rb <asm-file> <bank-number>"
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


# Augment the symbols with the raw addresses read from the source code
missing_symbols = File.readlines(asm_file)
  .select { |l| l =~ /ld   (hl|de|bc), \$[4-7][0-9A-Z]{3}/ }
  .map { |l| l.match(/(hl|de|bc), \$([4-7][0-9A-Z]{3})/)[2].to_i(16) }
  .map { |offset| LocalAddress.new(bank_number, offset) }
  .map { |address| Mgbdis::Symbol.from_address(address) }

all_symbols = (all_symbols + missing_symbols).uniq

# Extract the symbols for the requested bank
symbols = all_symbols.reject { |s| s.address.bank != bank_number }

# Sort the bank symbols by address
symbols.sort_by! { |s| s.address.offset }

# Data previously interpreted as code produced a lot of bogus 'jr_' labels.
# These labels end up in the debug symbols, but should be ignored.
#
# Remove symbols prefixed by 'jr_' who are preceeded by a 'data_' symbol.
jrs_to_reject = symbols.select.with_index do |sym, index|
  if sym.label.start_with?('jr_') && index >= 1
    symbols_before = symbols[0..(index - 1)]
    nearest_non_jr_index = symbols_before.rindex { |s| !s.label.start_with?('jr_') }
    if !nearest_non_jr_index.nil?
      nearest_non_jr_sym = symbols[nearest_non_jr_index]
      if nearest_non_jr_sym.data_label?
        next true
      end
    end
  end
  false
end

all_symbols -= jrs_to_reject
symbols -= jrs_to_reject

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
