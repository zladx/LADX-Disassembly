"""Constants for LADX state extraction."""

from __future__ import annotations

import re
from pathlib import Path

MAX_ENTITIES = 0x10
INVENTORY_SLOT_COUNT = 0x0C

ENTITY_STATUS_NAMES = {
    0: "ENTITY_STATUS_DISABLED",
    1: "ENTITY_STATUS_DYING",
    2: "ENTITY_STATUS_FALLING",
    3: "ENTITY_STATUS_BURNING",
    4: "ENTITY_STATUS_INIT",
    5: "ENTITY_STATUS_ACTIVE",
    6: "ENTITY_STATUS_STUNNED",
    7: "ENTITY_STATUS_LIFTED",
    8: "ENTITY_STATUS_THROWN",
}


_ENTITY_TYPE_RE = re.compile(r"^\s*DEF\s+(ENTITY_[A-Z0-9_]+)\s+EQU\s+\$([0-9A-Fa-f]{1,2})\b")


def load_entity_type_names(repo_root: str | Path = ".") -> dict[int, str]:
    """Load LADX entity type names from the disassembly constants file."""
    constants_path = Path(repo_root) / "src" / "constants" / "entities.asm"
    if not constants_path.exists():
        return {}

    names: dict[int, str] = {}
    in_type_section = False
    for line in constants_path.read_text(encoding="utf-8").splitlines():
        if "Values for wEntitiesTypeTable" in line:
            in_type_section = True
            continue
        if not in_type_section:
            continue

        match = _ENTITY_TYPE_RE.match(line)
        if not match:
            continue
        name, value_hex = match.groups()
        names[int(value_hex, 16)] = name
    return names
