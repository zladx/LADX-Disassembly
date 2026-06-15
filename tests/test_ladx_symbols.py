from pathlib import Path

from zelda_env.games.ladx.symbols import default_ladx_symbol_table


def test_default_ladx_symbol_table_parses_key_asm_memory_symbols():
    symbols = default_ladx_symbol_table(Path(__file__).parents[1])

    assert symbols.resolve("hLinkPositionX") == 0xFF98
    assert symbols.resolve("hLinkPositionY") == 0xFF99
    assert symbols.resolve("hMapRoom") == 0xFFF6
    assert symbols.resolve("hMapId") == 0xFFF7
    assert symbols.resolve("wEntitiesStatusTable") == 0xC280
    assert symbols.resolve("wEntitiesTypeTable") == 0xC3A0
    assert symbols.resolve("wInventoryItems") == 0xDB00
    assert symbols.resolve("wInventoryItems.BButtonSlot") == 0xDB00
    assert symbols.resolve("wInventoryItems.AButtonSlot") == 0xDB01
    assert symbols.resolve("wHealth") == 0xDB5A
    assert symbols.resolve("wRoomObjects") == 0xD711

