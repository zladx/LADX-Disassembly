"""Extract a generic, interpretable state dictionary from LADX memory."""

from __future__ import annotations

from pathlib import Path
from typing import Any

from zelda_env.backends.base import EmulatorBackend
from zelda_env.games.ladx import memory_map
from zelda_env.games.ladx.constants import (
    ENTITY_STATUS_NAMES,
    INVENTORY_SLOT_COUNT,
    MAX_ENTITIES,
    load_entity_type_names,
)
from zelda_env.games.ladx.symbols import SymbolTable, default_ladx_symbol_table


class LadxStateExtractor:
    """Maps LADX-specific memory symbols into the shared Zelda state schema."""

    def __init__(self, symbols: SymbolTable | None = None, *, repo_root: str | Path = ".") -> None:
        self.symbols = symbols or default_ladx_symbol_table(repo_root)
        self.entity_type_names = load_entity_type_names(repo_root)

    def extract(self, backend: EmulatorBackend) -> dict[str, Any]:
        state: dict[str, Any] = {
            "meta": {
                "game": "ladx",
                "platform": "gbc",
                "backend": backend.__class__.__name__,
                "schema_version": 1,
            },
            "world": {},
            "player": {"magic": {"current": None}},
            "inventory": {},
            "progress": {},
            "entities": [],
            "room": {},
            "effects": {"magic_cost_modifier": None},
            "flags": {},
            "raw": {},
        }
        self._read_fields(backend, state["meta"], memory_map.META_FIELDS)
        self._read_fields(backend, state["world"], memory_map.WORLD_FIELDS)
        self._read_fields(backend, state["player"], memory_map.PLAYER_FIELDS)
        self._read_fields(backend, state["inventory"], memory_map.INVENTORY_FIELDS)
        self._read_fields(backend, state["progress"], memory_map.PROGRESS_FIELDS)
        self._read_fields(backend, state["effects"], memory_map.EFFECT_FIELDS)
        self._read_inventory_items(backend, state["inventory"])
        self._read_progress_items(backend, state["progress"])
        self._read_entities(backend, state["entities"], state["raw"])
        self._read_room(backend, state["room"])
        return state

    def _read_fields(self, backend: EmulatorBackend, target: dict[str, Any], fields: tuple[memory_map.Field, ...]) -> None:
        for field in fields:
            address = self.symbols.get(field.symbol)
            if address is None:
                continue
            value: int | list[int]
            if field.size == 1:
                raw = backend.read_u8(address)
                value = _to_signed(raw) if field.signed else raw
            else:
                value = list(backend.read_bytes(address, field.size))
            _set_path(target, field.path, value)

    def _read_inventory_items(self, backend: EmulatorBackend, inventory: dict[str, Any]) -> None:
        base = self.symbols.get("wInventoryItems")
        if base is None:
            return
        items = list(backend.read_bytes(base, INVENTORY_SLOT_COUNT))
        inventory["items"] = items
        inventory["b_button_item"] = items[0]
        inventory["a_button_item"] = items[1]

    def _read_progress_items(self, backend: EmulatorBackend, progress: dict[str, Any]) -> None:
        instruments = []
        for index in range(1, 9):
            address = self.symbols.get(f"wHasInstrument{index}")
            if address is not None:
                instruments.append(backend.read_u8(address))
        progress["instruments"] = instruments
        high = self.symbols.get("wRupeeCountHigh")
        low = self.symbols.get("wRupeeCountLow")
        if high is not None and low is not None:
            progress["rupees"] = backend.read_u8(high) * 100 + backend.read_u8(low)

    def _read_entities(
        self,
        backend: EmulatorBackend,
        entities: list[dict[str, Any]],
        raw: dict[str, Any],
    ) -> None:
        table_addresses = {
            field: self.symbols.get(symbol)
            for field, symbol in memory_map.ENTITY_TABLES.items()
        }
        raw["entity_tables"] = {}
        for field, base in table_addresses.items():
            if base is not None:
                raw["entity_tables"][field] = list(backend.read_bytes(base, MAX_ENTITIES))

        for slot in range(MAX_ENTITIES):
            entity: dict[str, Any] = {"slot": slot, "private": {}}
            for field, base in table_addresses.items():
                if base is None:
                    continue
                value = backend.read_u8(base + slot)
                _set_path(entity, field, value)
            status = entity.get("status", 0)
            entity_type = entity.get("type")
            entity["enabled"] = status != 0
            entity["status_name"] = ENTITY_STATUS_NAMES.get(status)
            entity["type_name"] = self.entity_type_names.get(entity_type) if isinstance(entity_type, int) else None
            entities.append(entity)

    def _read_room(self, backend: EmulatorBackend, room: dict[str, Any]) -> None:
        objects = self.symbols.get("wRoomObjects")
        if objects is not None:
            room["objects_runtime"] = list(backend.read_bytes(objects, 0xEF))
        area = self.symbols.get("wRoomObjectsArea")
        if area is not None:
            room["objects_area_raw"] = list(backend.read_bytes(area, 0x100))


def _set_path(target: dict[str, Any], dotted_path: str, value: Any) -> None:
    parts = dotted_path.split(".")
    current = target
    for part in parts[:-1]:
        nested = current.get(part)
        if not isinstance(nested, dict):
            nested = {}
            current[part] = nested
        current = nested
    current[parts[-1]] = value


def _to_signed(value: int) -> int:
    return value - 0x100 if value & 0x80 else value
