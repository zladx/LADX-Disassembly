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
  local options="$2"

  grep -E --recursive "$regex" "$SOURCE_DIR" $options | wc -l

  if [[ "$VERBOSE" != "disabled" ]]; then
    echo ""
    echo "Breakdown per file:"
    grep -E --recursive --count "$regex" "$SOURCE_DIR" $options | grep -v ':0'
  fi
}

cd "$(dirname $0)/.."

echo "Number of remaining raw addresses:"
echo "   In ROM (0000-7FFF):"
EXCLUDED_FILES="\
--exclude */bank0.asm \
--exclude */home/init.asm \
--exclude */home/clear_memory.asm"
count_matches '(, | \[|call |jp   )\$[0-7][A-Z0-9]{3}' "$EXCLUDED_FILES"

echo "   In RAM (8000-FFFF):"
count_matches '(, | \[|call |jp   )\$[89A-Z][A-Z0-9]{3}'

echo ""
echo "Number of unlabeled functions:"
count_matches '^[Ff]unc'

echo ""
echo "Number of unlabeled jumps:"
count_matches '^label_|^jr_|^\.jr_|^\.loop_|^\.else_'
