#!/usr/bin/env ruby
#
# Given a SYM file, scan the source for labels that are defined, but never used.

def usage
  puts "Usage:"
  puts "  tools/find-unused-labels.rb > unused-labels.txt"
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

  def in_rom?
    return (0x0000...0x8000).include?(offset)
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

def load_symbols(sym_path)
  File.readlines(sym_path)
    .map(&:strip)
    .reject { |l| l.start_with?(';') || l.empty? }
    .map { |l| Mgbdis::Symbol.from_string(l) }
end

# 1. Read the data symbols from the SYM file
symbols = load_symbols('game.sym')
  .reject { |s| s.label.include?('.') } # exclude private symbols

# 2. For each symbol, find if it's used (beside its declaration) or not
symbols.each_with_index do |symbol, index|
  grep = "grep --quiet --recursive --include='*.asm' --extended '#{symbol.label}([^:]|$)' src"
  if !system(grep)
    STDOUT.puts "\nUnused symbol: #{symbol.label}"
  else
    STDERR.print "\r#{index}/#{symbols.count}"
  end
end
