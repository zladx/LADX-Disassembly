#!/bin/bash -e
# Output statistics about the project progression.
#
# Usage:
#   tools/stats [--verbose]

VERBOSE=${1:-"disabled"}
SOURCE_DIR="src/code"

count_matches()
{
  local regex="$1"

  grep -E --recursive "$regex" "$SOURCE_DIR" | wc -l

  if [[ "$VERBOSE" != "disabled" ]]; then
    echo ""
    echo "Breakdown per file:"
    grep -E --recursive --count "$regex" "$SOURCE_DIR" | grep -v ':0'
  fi
}

cd "$(dirname $0)/.."

echo "Number of remaining raw addresses:"
count_matches '(, | \[|call |jp   )\$[A-Z0-9]{4}'

echo ""
echo "Number of unlabeled functions:"
count_matches '^[Ff]unc'

echo ""
echo "Number of unlabeled jumps:"
count_matches '^label_|^jr_|^\.jr_|^\.loop_|^\.else_'
