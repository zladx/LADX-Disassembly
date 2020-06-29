#!/bin/bash -eu
#
# A partial implementation of md5sum, for systems where the `md5sum` command
# may not be available (i.e. macOS).
#
# In this case, this script provides the same functionnality, using the `md5` command
# (if available).
#
# Usage:
#   md5sum.sh --check [--ignore-missing] ladx.md5

# Find an available implementation
if [[ $(command -v md5sum) ]]; then
  MD5="md5sum"
elif [[ $(command -v md5) ]]; then
  MD5="md5 -r"
else
  echo 'md5sum.sh: found neither `md5sum` nor `md5` commands.'
  echo 'Please install either `md5sum` or `md5` on your system.'
  exit 1
fi

# Compare with the sumfile manually
# (Because not all implementations of `md5sum` support
# the `--ignore-missing` option.)

# Parse options
IGNORE_MISSING=0;

while [[ "$#" -gt 0 ]]; do
  case $1 in
      -c|--check) ;;
      --ignore-missing) IGNORE_MISSING=1 ;;
      *) SUMFILE="$1" ;;
  esac
  shift
done

# For each line in the sumfile, compare the checksum with the expected value
while read -r LINE ; do
  FILE=$(echo "$LINE" | cut -d ' ' -f2)
  if [[ $IGNORE_MISSING && ! -f "$FILE" ]]; then continue; fi

  EXPECTED="$LINE"
  ACTUAL=$($MD5 "$FILE" | tr -s ' ')
  if [[ "$EXPECTED" == "$ACTUAL" ]]; then
    echo "$FILE checksum: OK"
  else
    echo "$FILE checksum: FAILED"
    exit 1
  fi
done < "$SUMFILE"
