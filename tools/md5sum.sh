#!/bin/bash
#
# A wrapper of md5sum, for systems where the `md5sum` command may not be available (i.e. macOS)
# In this case, this script provides the same functionnality, using the `md5` command
# (if available).
#
# Usage:
#   md5sum.sh -c ladx.md5

OPTIONS="$1"
SUMFILE="$2"

HAS_MD5SUM=$(command -v md5sum)
HAS_MD5=$(command -v md5)

# Implementation based on md5sum
_md5sum()
{
  md5sum -c "$SUMFILE"
}

# Implementation based on md5
_md5()
{
  while read -r line ; do
    FILE=$(echo "$line" | cut -d ' ' -f2)
    if [[ $(md5 -r "$FILE") == "$line" ]]; then
      echo "$FILE checksum: OK"
    else
      echo "$FILE checksum: FAILED"
      exit 1
    fi
  done < "$SUMFILE"
}

# Execute using an available implementation
if [[ $HAS_MD5SUM ]]; then
  _md5sum
elif [[ $HAS_MD5 ]]; then
  _md5
else
  echo 'md5sum.sh: found neither `md5sum` nor `md5` commands.'
  echo 'Please install either `md5sum` or `md5` on your system.'
  exit 1
fi
