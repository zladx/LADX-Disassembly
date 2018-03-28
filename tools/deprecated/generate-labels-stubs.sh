#!/bin/bash -e
# Replace `label_1234` by `$1234` using compiler errors,
# until the ROM compiles.

DIRNAME=$(dirname $0)
ROOT_DIR="$DIRNAME/../.."

cd "$ROOT_DIR"

asm_files=$(find src -type f -name '*.asm')

while ! make; do
	echo "Compiling…"
	address=$(make 2>&1 >/dev/null | grep "Unknown symbol 'label" | cut -f 2 -d "'" | cut -f 2 -d '_');
  sed -i '' -e "s| label_${address}$| \$${address}|g" $asm_files;
done;
