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

  local matches_count=$(grep -E --recursive "$regex" "$SOURCE_DIR" $options | wc -l)
  echo "$matches_count"

  if [[ "$matches_count" -gt 0 ]] && [[ "$VERBOSE" != "disabled" ]]; then
    echo "Breakdown per file:"
    grep -E --recursive --count "$regex" "$SOURCE_DIR" $options | grep -v ':0'
    echo ""
  fi
}

cd "$(dirname $0)/.."

echo "Number of remaining raw addresses:"
echo "   Referencing Home (0000-3FFF):"
EXCLUDED_FILES="\
--exclude */bank0.asm \
--exclude */bank1.asm \
--exclude */bank2.asm \
--exclude */bank3.asm \
--exclude */bank4.asm \
--exclude */bank5.asm \
--exclude */bank6.asm \
--exclude */bank7.asm \
--exclude */bank14.asm \
--exclude */bank15.asm \
--exclude */bank18.asm \
--exclude */bank19.asm \
--exclude */bank20.asm \
--exclude */bank36.asm \
--exclude */credits.asm \
--exclude */super_gameboy.asm \
--exclude */home/init.asm \
--exclude */home/clear_memory.asm \
--exclude */audio/sfx.asm \
--exclude */audio/music_1.asm"
count_matches '(, | \[|call |jp   )\$[0-3][A-Z0-9]{3}' "$EXCLUDED_FILES"

echo "   Referencing non-Home ROM banks (4000-7FFF):"
count_matches '(, | \[|call |jp   )\$[4-7][A-Z0-9]{3}'

echo "   Referencing RAM (8000-FFFF):"
count_matches '(, | \[|call |jp   )\$[89A-Z][A-Z0-9]{3}'

echo ""
echo "Number of unlabeled functions:"
count_matches '^[Ff]unc'

echo ""
echo "Number of unlabeled jumps:"
count_matches '^label_|^jr_|^\.jr_|^\.loop_|^\.else_'
