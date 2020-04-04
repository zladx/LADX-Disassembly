#!/bin/sh -ex
#
# Generate an automatic disassembly of the whole ROM,
# using mgbdis, and the debug symbols already documented.

TOOLS_DIR=$(dirname "$0")
ROOT_DIR="$TOOLS_DIR/.."
cd "$ROOT_DIR"

# # Generate the ROM and the debug symbols if not found
# if ! [[ -f game.gbc ]] || ! [[ -f game.sym ]]; then
#   make game.gbc
# fi

# # Ensure the built ROM is correct
# make test

# Retrieve the disassembler submodule if not initialized yet
if ! [[ -f tools/mgbdis/mgbdis.py ]]; then
  git submodule update --init
fi

# Invoke the disassembler with the specific formatting options
tools/mgbdis/mgbdis.py game.gbc --overwrite --print-hex --uppercase-hex --align-operands --ldh_a8 ldh_ffa8 --indent-spaces 4

# Fix some of the formatting

## Turn `jr_XXX_YYYY::` into `jr_XXX_YYYY:`
echo 'Fixing jr_XXX_YYYY format…'
sed -E -i '' 's/^(jr|label)_([0-9A-F]{3}_[0-9A-F]{4})::/\1_\2:/g' disassembly/*.asm
