#!/usr/bin/env bash
#
# Compare the given files to their reference md5 checksum.
# The SUMFILE is expected to be in the `checksum` format.
#
# Usage:
#   md5sum.sh SUMFILE FILE [, FILE…]

set -eu

# Parse arguments
if [[ "$#" -lt 2 ]]; then
  echo "Invalid number of arguments."
  echo "Usage:"
  echo "  md5sum.sh SUMFILE FILE [, FILE…]"
  exit 1
fi

SUMFILE="$1"
shift

# Find an available md5 implementation
# (Most Linuxes ship with `md5sum`, but macOS only has `md5`.)
if [[ $(command -v md5sum) ]]; then
  MD5="md5sum"
elif [[ $(command -v md5) ]]; then
  MD5="md5 -r"
else
  echo 'md5sum.sh: found neither `md5sum` nor `md5` commands.'
  echo 'Please install either `md5sum` or `md5` on your system.'
  exit 1
fi

# For each file in argument, ensure the checksum
# is the same than in the sumfile.
for FILE in "$@"; do
  EXPECTED=$(grep "$FILE" "$SUMFILE" | cut -d ' ' -f1)
  ACTUAL=$($MD5 "$FILE" | cut -d ' ' -f1)
  if [[ "$EXPECTED" == "$ACTUAL" ]]; then
    echo "$FILE checksum: OK"
  elif [[ "$EXPECTED" == "" ]]; then
    echo "'$FILE': no checksum found in '$SUMFILE'"
  else
    echo "$FILE checksum: FAILED"
    exit 1
  fi
done
