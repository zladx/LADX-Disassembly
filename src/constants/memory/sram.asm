; Save data is made up of multiple areas:
; * Prefix, the values 1,3,5,7,9 are stored here to indicate that the save is valid.
; * Main, a copy of wram, from wOverworldRoomStatus till wSaveSlotNames (exclusive)
; * 3 pieces of data added with the DX version, for the color dungeon and tunic and photos.
DEF SAVE_PREFIX_SIZE EQU 5
DEF SAVE_MAIN_SIZE   EQU $0380
DEF SAVE_DX1_SIZE    EQU $0005 ; wColorDungeonItemFlags
DEF SAVE_DX2_SIZE    EQU $0020 ; wColorDungeonRoomStatus
DEF SAVE_DX3_SIZE    EQU $0003 ; wTunicType, wPhotos1, wPhotos2

assert SAVE_MAIN_SIZE == (wSaveSlotNames - wOverworldRoomStatus)

section "SRAM", sram[$A000], bank[0]
; For some reason the first 256 bytes are skipped in the sram.
    ds $100
SaveGame1:
.prefix:
    ds SAVE_PREFIX_SIZE
.main:
    ds SAVE_MAIN_SIZE
.dx1:
    ds SAVE_DX1_SIZE
.dx2:
    ds SAVE_DX2_SIZE
.dx3:
    ds SAVE_DX3_SIZE
.end:

SaveGame2:
.prefix:
    ds SAVE_PREFIX_SIZE
.main:
    ds SAVE_MAIN_SIZE
.dx1:
    ds SAVE_DX1_SIZE
.dx2:
    ds SAVE_DX2_SIZE
.dx3:
    ds SAVE_DX3_SIZE
.end:

SaveGame3:
.prefix:
    ds SAVE_PREFIX_SIZE
.main:
    ds SAVE_MAIN_SIZE
.dx1:
    ds SAVE_DX1_SIZE
.dx2:
    ds SAVE_DX2_SIZE
.dx3:
    ds SAVE_DX3_SIZE
.end:
