#!/bin/bash -e
# Generate `label_1234 equ $1234` declarations from compiler errors,
# and write them into `src/labels.asm`.

DIRNAME=$(dirname $0)
ROOT_DIR="$DIRNAME/.."

cd "$ROOT_DIR"

while ! make; do
	echo "Compiling…"
	make clean && make 2>&1 >/dev/null \
    | grep "Unknown symbol 'label" \
    | cut -f 2 -d "'" \
    | cut -f 2 -d '_' \
    | sed -E 's|(.*)|label_\1 equ $\1|g' \
    >> "src/labels.asm";
	echo "Generated label stub."
done;
