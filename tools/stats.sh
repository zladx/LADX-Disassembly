#!/usr/bin/env bash
#
# Output statistics about the project progression.
# Usage:
#   tools/stats [--verbose]

set -e

VERBOSE=${1:-"disabled"}
SOURCE_DIR="src/code"
SYM_FILE="azle.sym"

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
--exclude */macros.asm \
--exclude */bank0.asm \
--exclude */bank1.asm \
--exclude */bank14.asm \
--exclude */bank15.asm \
--exclude */bank18.asm \
--exclude */bank19.asm \
--exclude */bank20.asm \
--exclude */bank36.asm \
--exclude */animated_tiles.asm \
--exclude */credits.asm \
--exclude */photos.asm \
--exclude */photos_bg.asm \
--exclude */super_gameboy.asm \
--exclude */home/init.asm \
--exclude */home/clear_memory.asm \
--exclude */audio/sfx.asm \
--exclude */audio/music_1.asm \
--exclude */palettes.asm"
count_matches '[^;] \$[0-3][0-9A-F]{3}' "$EXCLUDED_FILES"

echo "   Referencing non-Home ROM banks (4000-7FFF):"
EXCLUDED_FILES="\
--exclude */bank20.asm"
count_matches '[^;] \$[4-7][0-9A-F]{3}' "$EXCLUDED_FILES"

echo "   Referencing RAM (8000-FFFF):"
count_matches '(, | \[|call |jp   )\$[89A-Z][A-Z0-9]{3}'

echo ""
echo "Documented labels:"
UNDOCUMENTED_LABEL='[A-Za-z0-9_\.]*[0-9A-F]{4}[A-Za-z0-9_]*'
ANY_LABEL='[A-Za-z0-9_\.]*'
undocumented_labels=$(grep -E --only-matching " $UNDOCUMENTED_LABEL" "$SYM_FILE" | sort -u | wc -l)
documented_labels=$(grep -E -v " $UNDOCUMENTED_LABEL" "$SYM_FILE" | grep --only-matching " $ANY_LABEL" | sort -u | wc -l)
all_labels=$(expr $documented_labels + $undocumented_labels)
completion_percentage=$(awk "BEGIN {print $documented_labels / $all_labels * 100}")
echo "$documented_labels / $all_labels ($completion_percentage %)"
