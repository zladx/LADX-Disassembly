#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Generate a Virtual Console patch by filling values into a patch template.
#
# Usage:
#     tools/vc.py --template src/vc/azle.patch.template --sym azle.sym --rom azle.gbc --out azle.patch

import argparse
import re
import sys


def get_sym_value(label, symbols):
    # Labels may have a delta value added to them
    if '+' in label:
        label, delta = label.split('+')
        delta = int(delta, 0)
    else:
        delta = 0
    try:
        return symbols[label] + delta
    except KeyError:
        raise Exception(f'Undefined label: "{label}"')


def parse_sym_file(sym_file):
    symbols = {}

    for line in sym_file:
        # Skip comments and empty lines
        line = line.split(';', 1)[0].strip()
        if not line:
            continue

        # Parse "bank:address label ..." and "value name ..." lines into offset values
        value, name, *_ = line.split()
        if ':' in value:
            bank, address = [int(part, 16) for part in value.split(':')]
            if address < 0x8000:
                # ROM addresses are relative to their bank
                offset = (bank * 0x4000) + (address & 0x3fff)
            else:
                # RAM addresses are relative to the start of all RAM
                offset = address & 0x7fff
        else:
            offset = int(value, 16)

        symbols[name] = offset

    return symbols


def interpret_command(capture, symbols, rom):
    command, *args = capture.group(1).split()

    # {LABEL value} expands to one given value
    if command == 'LABEL':
        value = get_sym_value(args[0], symbols)
        return f'x{value:X}'

    # {MIXEDCASELABEL value} expands to one given value with a lowercase hex digit in the middle
    elif command == 'MIXEDCASELABEL':
        value = get_sym_value(args[0], symbols)
        formatted = f'x{value:X}'
        return formatted[:-3] + formatted[-3:-2].lower() + formatted[-2:]

    # {PATCH offset length} expands to a series of bytes from the patched ROM
    elif command == 'PATCH':
        start_patch = get_sym_value(args[0], symbols)
        end_patch = start_patch + int(args[1], 0)
        data = rom[start_patch:end_patch]
        if len(data) == 1:
            return f'x{data[0]:02X}'
        else:
            return f'a{len(data)}:' + ' '.join(f'{byte:02X}' for byte in data)

    else:
        raise Exception(f'Invalid command: "{capture.group()}"')


def fill_in_template(template_file, symbols, rom):
    contents = template_file.read()

    # Fill in brace-delimited {commands} with their expanded values
    replace_command = lambda capture: interpret_command(capture, symbols, rom)
    return re.sub(r'\{(.+?)\}', replace_command, contents)


def main():
    ap = argparse.ArgumentParser(description='Generate a VC patch by filling values into a patch template')
    ap.add_argument('--template', required=True, help='The .patch.template file to fill in')
    ap.add_argument('--out', required=True, help='The .patch file to output')
    ap.add_argument('--sym', required=True, help='The .sym file to read symbol values from')
    ap.add_argument('--rom', required=True, help='The .gbc file of the *patched* ROM')

    args = ap.parse_args()

    try:
        with open(args.sym, 'r', encoding='utf-8') as sym_file:
            symbols = parse_sym_file(sym_file)
        with open(args.rom, 'rb') as rom_file:
            rom = rom_file.read()
        with open(args.template, 'r', encoding='utf-8') as template_file:
            contents = fill_in_template(template_file, symbols, rom)

    except Exception as err:
        print(f'{sys.argv[0]}: error: {err}', file=sys.stderr)
        sys.exit(1)

    # Output Windows CRLF newlines
    with open(args.out, 'w', encoding='utf-8', newline='\r\n') as patch_file:
        patch_file.write(contents)


if __name__ == '__main__':
    main()
