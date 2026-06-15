from pathlib import Path
import json

from zelda_env.games.ladx.state_extractor import LadxStateExtractor
from zelda_env.games.ladx.symbols import default_ladx_symbol_table


class FakeBackend:
    platform = "gbc"
    buttons = ("UP", "DOWN", "LEFT", "RIGHT", "A", "B", "START", "SELECT")

    def __init__(self):
        self.memory = bytearray(0x10000)

    def reset(self): ...

    def close(self): ...

    def press(self, buttons): ...

    def release_all(self): ...

    def advance(self, frames): ...

    def read_u8(self, address):
        return self.memory[address]

    def read_u16(self, address, *, endian="little"):
        return int.from_bytes(self.read_bytes(address, 2), endian)

    def read_bytes(self, address, length):
        return bytes(self.memory[address : address + length])

    def save_state(self):
        return bytes(self.memory)

    def load_state(self, data):
        self.memory[:] = data

    def screen_rgb(self):
        return None


def test_ladx_state_extractor_returns_generic_json_safe_schema():
    symbols = default_ladx_symbol_table(Path(__file__).parents[1])
    backend = FakeBackend()
    backend.memory[symbols.resolve("hLinkPositionX")] = 42
    backend.memory[symbols.resolve("hLinkPositionY")] = 99
    backend.memory[symbols.resolve("hMapRoom")] = 0x92
    backend.memory[symbols.resolve("hMapId")] = 0x00
    backend.memory[symbols.resolve("wHealth")] = 0x18
    backend.memory[symbols.resolve("wMaxHearts")] = 3
    backend.memory[symbols.resolve("wInventoryItems")] = 1
    backend.memory[symbols.resolve("wInventoryItems.AButtonSlot")] = 4
    backend.memory[symbols.resolve("wEntitiesStatusTable")] = 5
    backend.memory[symbols.resolve("wEntitiesTypeTable")] = 9
    backend.memory[symbols.resolve("wEntitiesPosXTable")] = 80
    backend.memory[symbols.resolve("wEntitiesPosYTable")] = 64

    state = LadxStateExtractor(symbols).extract(backend)
    json.dumps(state)

    assert state["meta"]["game"] == "ladx"
    assert state["world"]["room"] == 0x92
    assert state["player"]["x"] == 42
    assert state["player"]["y"] == 99
    assert state["player"]["health"]["current"] == 0x18
    assert state["player"]["magic"]["current"] is None
    assert state["inventory"]["b_button_item"] == 1
    assert state["inventory"]["a_button_item"] == 4
    assert state["entities"][0]["enabled"] is True
    assert state["entities"][0]["status_name"] == "ENTITY_STATUS_ACTIVE"
    assert state["entities"][0]["type"] == 9
    assert state["entities"][0]["x"] == 80
    assert state["entities"][0]["y"] == 64
