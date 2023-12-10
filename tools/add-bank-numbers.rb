#!/usr/bin/env ruby

require "tempfile"

LocalAddress = Struct.new(:bank, :offset) do
  def self.from_string(str)
    bank, offset = str.split(':')
    self.new(bank.to_i(16), offset.to_i(16))
  end

  def to_s
    "%02X:%02X" % [bank, offset]
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

def replace_in_file(filename, regexp, replacement)
  Tempfile.open(".#{File.basename(filename)}", File.dirname(filename)) do |tempfile|
    File.open(filename).each do |line|
      tempfile.puts line.gsub(regexp, replacement)
    end
    tempfile.close
    FileUtils.mv tempfile.path, filename
  end
end

asm_files = ARGV
sym_file = 'azle.sym'

# Parse the SYM file
symbols = File.readlines(sym_file)
  .map(&:strip)
  .reject { |l| l.start_with?(';') || l.empty? }
  .map { |l| Mgbdis::Symbol.from_string(l) }

FUNCTION_RE = /^[A-Za-z][\w]*:/i
ADDRESS_COMMENT_RE = /; \$([0-9A-F]{4})(:?)(( \$[0-9A-F]{2})*)$/i

# Enumerate asm files
asm_files.each do |path|
  # Find the first symbol
  result = nil
  File.open(path) do |asm_file|
    result = asm_file.find { |line| line =~ FUNCTION_RE }
  end
  if !result
    puts "WARNING: No symbol found in #{path}"
    next
  end
  first_sym = result.split(':').first

  # Retrieve the matching symbol
  symbol = symbols.find { |s| s.label == first_sym }
  if !symbol
    puts "WARNING: no address found for symbol `#{first_sym}`"
    next
  end

  # Print the bank number
  bank = symbol.address.bank

  # Replace each address by the bank+address
  replace_in_file(path, ADDRESS_COMMENT_RE, ";; #{"%02X" % [bank]}:\\1\\3")
end
