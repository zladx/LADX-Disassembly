section "Tiles 0", vram[$8000], BANK[0]
vTiles0::
DEF vTilesSpriteslots EQU $8400
DEF vTilesSpriteslot1 EQU $8400
DEF vTilesSpriteslot2 EQU $8500
DEF vTilesSpriteslot3 EQU $8600
DEF vTilesSpriteslot4 EQU $8700

section "Tiles 1", vram[$8800], BANK[0]
vTiles1::

section "Tiles 2", vram[$9000], BANK[0]
vTiles2::
DEF vTilesSwitchBlockA EQU $9040
DEF vTilesSwitchBlockB EQU $9080

section "BG Map 0", vram[$9800], BANK[0]
vBGMap0::

section "BG Map 1", vram[$9C00], BANK[0]
vBGMap1::
