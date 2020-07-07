# Xkeeper's notes
Misc notes that have not been translated into disassembly comments yet

----

## Patches

### Patch matrix

|       -       | JP 1.0 | JP 1.1 | JP 1.2 | US 1.0 | US 1.1 | US 1.2 | FR 1.0 | FR 1.1 | DE 1.0 | DE 1.1 |
|:-------------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
| `__PATCH_0__` |        |  Yes   |  Yes   |        |  Yes   |  Yes   |  Yes   |  Yes   |  Yes   |  Yes   |
| `__PATCH_1__` |        |        |        |        |        |        |  Yes   |  Yes   |  Yes   |  Yes   |
| `__PATCH_2__` |        |  Yes   |  Yes   |        |        |  Yes   |  Yes   |  Yes   |  Yes   |  Yes   |
| `__PATCH_3__` |        |  Yes   |  Yes   |        |  Yes   |  Yes   |        |        |        |        |
| `__PATCH_4__` |        |        |  Yes   |        |        |  Yes   |        |  Yes   |        |  Yes   |
| `__PATCH_5__` |        |        |        |        |        |        |        |        |  Yes   |  Yes   |
| `__PATCH_6__` |  Yes   |  Yes   |  Yes   |        |        |        |        |        |        |        |
| `__PATCH_7__` |        |        |        |        |        |        |  Yes   |  Yes   |        |        |
| `__PATCH_8__` |        |  Yes   |  Yes   |        |        |        |        |        |        |        |
| `__PATCH_9__` |  Yes   |  Yes   |  Yes   |        |        |        |        |        |  Yes   |  Yes   |
| `__PATCH_A__` |    1   |    1   |    1   |        |        |        |        |        |    2   |    2   |
| `__PATCH_B__` |    1   |    1   |    1   |        |        |        |    2   |    2   |    1   |    1   |
| `__PATCH_C__` |        |        |        |  Yes   |  Yes   |  Yes   |        |        |        |        |

### Patch notes

This is not an exhaustive list. Many patches have effects that are not well-documented.


#### `__PATCH_0__`
*  If **Yes**, will **not** check for Evil Eagle's room when loading a minimap
  * `src/code/minimap.asm -> LoadMinimap`
  * Effects of this are unknown
* Many, many other changes everywhere
  * A handful of checks against your current tunic type when changing music tracks
  * `src/code/entities/bank7.asm -> EntityA8Handler` Code possibly relating to (unused?) entity `A8`?

#### `__PATCH_4__`
* Adds code to recalculate player's count of heart containers at certain times.
  * `src/code/bank1.asm -> Call_001_5eca`
  * Contains two tables; one for boss rooms, one for Piece of Heart rooms
  * Sets max hearts to `CLAMP(3, 14, 3 + (boss room flags) + (PoH room flags / 4))`


#### `__PATCH_6__`
* Seems to be a "reverse history patch". The disassembly is based on DX US 1.0 and this is for the JP versions only
  * That is, rather than representing a change in a future version, this change reverts to an older version of code
* Pointless `push hl`, `pop hl` instruction
  * `src/code/bank1.asm -> jr_001_55F5`
  * This seems like a complete waste of a few bytes and CPU cycles???
* Changes some graphics for the introduction sequence
  * `src/code/intro.asm -> Data_001_72DE`
  * [Obligatory TCRF link](https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening/Version_Differences#Introduction_Background)
* Various other undocumented changes
  * `src/code/intro.asm -> jr_001_797D_a`, more


#### `__PATCH_8__`
* Removes the debug feature that let you jump to the ending by pushing START on the map screen if debug flag 3 was enabled.
  * `src/code/world_map.asm -> WorldMapInteractiveHandler`
  * Oddly, this change didn't proliferate to other versions...
* Writes the current bank to the current bank memory address during the intro
  * `src/code/intro.asm -> IntroSceneStage0Handler`
  * Possible fix for obscure race condition?

#### `__PATCH_8__`
* Completely unfounded assumption: deals with handling dakuten, handakuten, and umlaut modifiers.


## Debug stuff

* While in a dungeon, free movement mode will update your position on the minimap,
  even across rooms that it ordinarily would not; e.g. when entering a side-scrolling area,
  enabling free movement will show the indicator at the "real" room you are in.

