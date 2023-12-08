section "Tiles 0", vram[$8000], BANK[0]
vTiles0::
def vTilesSpriteslots equ $8400
def vTilesSpriteslot1 equ $8400
def vTilesSpriteslot2 equ $8500
def vTilesSpriteslot3 equ $8600
def vTilesSpriteslot4 equ $8700

section "Tiles 1", vram[$8800], BANK[0]
vTiles1::

section "Tiles 2", vram[$9000], BANK[0]
vTiles2::
def vTilesSwitchBlockA equ $9040
def vTilesSwitchBlockB equ $9080

section "BG Map 0", vram[$9800], BANK[0]
vBGMap0::

section "BG Map 1", vram[$9C00], BANK[0]
vBGMap1::
