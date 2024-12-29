; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Contains pointers to wDrawCommand data.
; (The requests themselves load data in bank 8.)
include "data/backgrounds/tilemaps_pointers.asm"

; Retrieve the address of a wDrawCommand for loading a given background.
; Input:
;   wBGMapToLoad
; Returns:
;   de   an address to a wDrawCommand for loading BG data
GetBGCopyRequest::
    ld   hl, TilemapsPointersTable                ;; 20:4577 $21 $2B $45
    ld   b, $00                                   ;; 20:457A $06 $00
    ld   a, [wBGMapToLoad]                        ;; 20:457C $FA $FF $D6
    sla  a                                        ;; 20:457F $CB $27
    ld   c, a                                     ;; 20:4581 $4F
    add  hl, bc                                   ;; 20:4582 $09
    ld   a, [hl]                                  ;; 20:4583 $7E
    ld   e, a                                     ;; 20:4584 $5F
    inc  hl                                       ;; 20:4585 $23
    ld   a, [hl]                                  ;; 20:4586 $7E
    ld   d, a                                     ;; 20:4587 $57
    ret                                           ;; 20:4588 $C9

DungeonFloorTilesPointers::
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorGTiles)
    db   HIGH(DungeonFloorHTiles)
    db   HIGH(DungeonFloorKTiles)
    db   HIGH(DungeonFloorLTiles)
    db   HIGH(DungeonFloorHTiles)
    db   HIGH(DungeonFloorJTiles)
    db   HIGH(DungeonFloorITiles)
    db   HIGH(DungeonFloorETiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorBTiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorBTiles)
    db   HIGH(DungeonFloorBTiles)
    db   HIGH(DungeonFloorDTiles)
    db   HIGH(DungeonFloorFTiles)
    db   HIGH(DungeonFloorHTiles)
    db   HIGH(DungeonFloorHTiles)
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorBTiles)

DungeonWallsTilesPointers::
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsETiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsETiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsFTiles)
    db   HIGH(DungeonWallsDTiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsBTiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsBTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsDTiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsBTiles)
    db   HIGH(DungeonWallsETiles)
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsBTiles)

ColorDungeonWallsTilesPointers::
    db   HIGH(DungeonWallsDTiles) ; actually color dungeon walls

DungeonItemsTilesPointers::
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsATiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsATiles)
    db   HIGH(DungeonItemsBTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(Npc3Tiles + $2300) ; TODO: add a proper label
    db   HIGH(DungeonItemsDTiles)
    db   $00
    db   $00
    db   $00
    db   HIGH(HouseAItemsTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(DungeonItemsDTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(HouseBItemsTiles)
    db   HIGH(DungeonItemsDTiles)
    db   HIGH(DungeonItemsATiles)
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   HIGH(HouseBItemsTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(DungeonItemsDTiles)

; Tuples of (address higher byte, bank index)
data_020_45EA::
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($5000), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($5000), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)

; Get the address of color dungeon tiles to copy.
; Tiles may be for background or sprites.
;
; Inputs:
;   c    ???
; Returns:
;   hl   tiles target address (blocks of $40 bytes)
;   a    tiles target bank
GetColorDungeonTilesAddress::
    push de                                       ;; 20:4616 $D5

    ldh  a, [hMapRoom]                            ;; 20:4617 $F0 $F6
    and  a                                        ;; 20:4619 $A7
    jr   z, .jr_4620                              ;; 20:461A $28 $04
    cp   ROOM_CD_05                               ;; 20:461C $FE $05
    jr   nz, jr_020_4640                          ;; 20:461E $20 $20

.jr_4620
    ld   a, [wSwitchBlocksState]                  ;; 20:4620 $FA $FB $D6
    and  a                                        ;; 20:4623 $A7
    jr   z, jr_020_4640                           ;; 20:4624 $28 $1A

    ld   a, c                                     ;; 20:4626 $79
    cp   $40                                      ;; 20:4627 $FE $40
    jr   z, .jr_462F                              ;; 20:4629 $28 $04

    cp   $80                                      ;; 20:462B $FE $80
    jr   nz, jr_020_4640                          ;; 20:462D $20 $11

.jr_462F
    xor  $C0                                      ;; 20:462F $EE $C0
    ld   l, a                                     ;; 20:4631 $6F
    ld   h, $5E                                   ;; 20:4632 $26 $5E
    ld   a, [wSwitchBlocksState]                  ;; 20:4634 $FA $FB $D6
    ldh  [hSwitchBlockNeedingUpdate], a           ;; 20:4637 $E0 $BB
    ld   [wRoomSwitchableObject], a               ;; 20:4639 $EA $FA $D6
    pop  de                                       ;; 20:463C $D1
    ld   a, $2D                                   ;; 20:463D $3E $2D
    ret                                           ;; 20:463F $C9

jr_020_4640:
    ld   hl, data_020_45EA                        ;; 20:4640 $21 $EA $45
    ; de = ([hMapRoom] * 2) % $FF
    ldh  a, [hMapRoom]                            ;; 20:4643 $F0 $F6
    sla  a                                        ;; 20:4645 $CB $27
    ld   e, a                                     ;; 20:4647 $5F
    ld   d, $00                                   ;; 20:4648 $16 $00

    ; e = data_020_45EA[de + 1]
    add  hl, de                                   ;; 20:464A $19
    inc  hl                                       ;; 20:464B $23
    ld   a, [hl]                                  ;; 20:464C $7E
    ld   e, a                                     ;; 20:464D $5F
    ; hl = data_020_45EA[de] * $100
    ; (i.e. higher byte is read from the tabel, lower byte is 0)
    dec  hl                                       ;; 20:464E $2B
    ld   a, [hl]                                  ;; 20:464F $7E
    ld   h, a                                     ;; 20:4650 $67
    ld   l, $00                                   ;; 20:4651 $2E $00

    add  hl, bc                                   ;; 20:4653 $09
    ld   a, e                                     ;; 20:4654 $7B

    ; cleanup and return
    pop  de                                       ;; 20:4655 $D1
    ret                                           ;; 20:4656 $C9

; Retrieve the address of a tileset load handler
;   input:  wTilesetToLoad in e
;   output: address to jump to in hl
GetTilesetHandlerAddress::
    ; de = (e - 1) * 2
    dec  e                                        ;; 20:4657 $1D
    sla  e                                        ;; 20:4658 $CB $23
    ld   d, $00                                   ;; 20:465A $16 $00
    ld   hl, TilesetLoadHandlersTable             ;; 20:465C $21 $64 $46
    add  hl, de                                   ;; 20:465F $19
    ld   a, [hl+]                                 ;; 20:4660 $2A
    ld   h, [hl]                                  ;; 20:4661 $66
    ld   l, a                                     ;; 20:4662 $6F
    ret                                           ;; 20:4663 $C9

; Pointers to addresses to execute for loading a specific tileset.
;
; NB: curiously, some of these functions actually load a tilemap
; into BG memory (rather than a tileset in tiles memory.)
TilesetLoadHandlersTable::
._01 dw LoadRoomTilemap
._02 dw FillBGMapWhite
._03 dw LoadBaseTiles
._04 dw LoadMenuTiles
._05 dw LoadBaseOverworldTiles
._06 dw LoadIndoorTiles
._07 dw LoadBaseOverworldTiles ; same as command $05
._08 dw FillBGMapBlack
._09 dw LoadRoomSpecificTiles
._0A dw LoadRequestedGfx.return
._0B dw LoadWorldMapTiles
._0C dw LoadRequestedGfx.return
._0D dw LoadSaveMenuTiles
._0E dw LoadWorldMapBGMap_trampoline
._0F dw LoadTileset0F_trampoline ; fade from white? used in menus
._10 dw LoadIntroSequenceTiles
._11 dw LoadTitleScreenTiles
._12 dw LoadChristinePortraitTiles
._13 dw LoadMarinBeachTiles
._14 dw LoadFaceShrineReliefTiles
._15 dw LoadTileset15
._16 dw LoadCreditsLinkOnSeaLargeTiles
._17 dw LoadCreditsSunAboveTiles
._18 dw LoadCreditsLinkOnSeaCloseTiles
._19 dw LoadCreditsLinkSeatedOnLogTiles
._1A dw LoadCreditsLinkFaceCloseUpTiles
._1B dw LoadCreditsRollTiles
._1C dw LoadCreditsLinkFaceCloseUpTiles
._1D dw LoadCreditsKoholintViewsTiles
._1E dw LoadCreditsKoholintDisappearingTiles
._1F dw LoadCreditsStairsTiles
._20 dw LoadSchulePaintingTiles
._21 dw LoadEaglesTowerTopTiles
._22 dw LoadCreditsMarinPortraitTiles_trampoline
._23 dw LoadThanksForPlayingTiles_trampoline

; Color dungeon spritesets (this table, and the other 3 below).
; There are 4 tables there (one for each spriteslot), with 22 entries
; (one for each color dungeon room).
; The format is:
; - graphics high byte address,
; - graphics bank
;
; (It's a complete break from how the normal tables are done, with indexing
; into a different table that contains 4 bytes for that whole room, and does
; not encode bank and address into a single byte.)
ColorDungeonEntitySpritesheetsTable_Slot1::
    db   HIGH(ColorDungeonNpcTiles + $1100), BANK(ColorDungeonNpcTiles)
    db   HIGH(ColorDungeonNpcTiles + $0F00), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0B00), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0400), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0800), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0400), BANK(ColorDungeonNpcTiles)
    db   HIGH(ColorDungeonNpcTiles + $0E00), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00

ColorDungeonEntitySpritesheetsTable_Slot2::
    db   HIGH($0000), $00
    db   HIGH(Npc2TilesCGB + $0D00),         BANK(Npc2TilesCGB)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0C00), BANK(ColorDungeonNpcTiles)
    db   HIGH(Npc1TilesCGB + $1100),         BANK(Npc1TilesCGB)
    db   HIGH(ColorDungeonNpcTiles + $0500), BANK(ColorDungeonNpcTiles)
    db   HIGH(ColorDungeonNpcTiles + $0500), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0500), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0500), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0900), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0500), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0500), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00

ColorDungeonEntitySpritesheetsTable_Slot3::
    db   HIGH(ColorDungeonNpcTiles + $1000), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0600), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0A00), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0600), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0600), BANK(ColorDungeonNpcTiles)

ColorDungeonEntitySpritesheetsTable_Slot4::
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0D00), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0700), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0700), BANK(ColorDungeonNpcTiles)
    db   HIGH(ColorDungeonNpcTiles + $0700), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0700), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0700), BANK(ColorDungeonNpcTiles)
    db   HIGH(ColorDungeonNpcTiles + $0700), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH($0000), $00
    db   HIGH(ColorDungeonNpcTiles + $0700), BANK(ColorDungeonNpcTiles)
    db   HIGH($0000), $00

LoadColorDungeonTiles::
    ld   hl, ColorDungeonEntitySpritesheetsTable_Slot1 ;; 20:475A $21 $AA $46
    ldh  a, [hMapRoom]                            ;; 20:475D $F0 $F6
    rla                                           ;; 20:475F $17
    ld   e, a                                     ;; 20:4760 $5F
    ld   d, $00                                   ;; 20:4761 $16 $00
    inc  e                                        ;; 20:4763 $1C
    push de                                       ;; 20:4764 $D5
    add  hl, de                                   ;; 20:4765 $19
    ld   a, [hl]                                  ;; 20:4766 $7E
    and  a                                        ;; 20:4767 $A7
    jr   z, .jr_4776                              ;; 20:4768 $28 $0C

    ld   d, a                                     ;; 20:476A $57
    dec  hl                                       ;; 20:476B $2B
    ld   a, [hl]                                  ;; 20:476C $7E
    ld   b, a                                     ;; 20:476D $47
    ld   c, $04                                   ;; 20:476E $0E $04
    ld   a, d                                     ;; 20:4770 $7A
    ld   h, $20                                   ;; 20:4771 $26 $20
    call CopyDataToVRAM                           ;; 20:4773 $CD $13 $0A

.jr_4776
    pop  de                                       ;; 20:4776 $D1
    push de                                       ;; 20:4777 $D5
    ld   hl, ColorDungeonEntitySpritesheetsTable_Slot2 ;; 20:4778 $21 $D6 $46
    add  hl, de                                   ;; 20:477B $19
    ld   a, [hl]                                  ;; 20:477C $7E
    and  a                                        ;; 20:477D $A7
    jr   z, .jr_478C                              ;; 20:477E $28 $0C

    ld   d, a                                     ;; 20:4780 $57
    dec  hl                                       ;; 20:4781 $2B
    ld   a, [hl]                                  ;; 20:4782 $7E
    ld   b, a                                     ;; 20:4783 $47
    ld   c, $05                                   ;; 20:4784 $0E $05
    ld   a, d                                     ;; 20:4786 $7A
    ld   h, $20                                   ;; 20:4787 $26 $20
    call CopyDataToVRAM                           ;; 20:4789 $CD $13 $0A

.jr_478C
    pop  de                                       ;; 20:478C $D1
    push de                                       ;; 20:478D $D5
    ld   hl, ColorDungeonEntitySpritesheetsTable_Slot3 ;; 20:478E $21 $02 $47
    add  hl, de                                   ;; 20:4791 $19
    ld   a, [hl]                                  ;; 20:4792 $7E
    and  a                                        ;; 20:4793 $A7
    jr   z, .jr_47A2                              ;; 20:4794 $28 $0C

    ld   d, a                                     ;; 20:4796 $57
    dec  hl                                       ;; 20:4797 $2B
    ld   a, [hl]                                  ;; 20:4798 $7E
    ld   b, a                                     ;; 20:4799 $47
    ld   c, $06                                   ;; 20:479A $0E $06
    ld   a, d                                     ;; 20:479C $7A
    ld   h, $20                                   ;; 20:479D $26 $20
    call CopyDataToVRAM                           ;; 20:479F $CD $13 $0A

.jr_47A2
    pop  de                                       ;; 20:47A2 $D1
    ld   hl, ColorDungeonEntitySpritesheetsTable_Slot4 ;; 20:47A3 $21 $2E $47
    add  hl, de                                   ;; 20:47A6 $19
    ld   a, [hl]                                  ;; 20:47A7 $7E
    and  a                                        ;; 20:47A8 $A7
    jr   z, .jr_47B7                              ;; 20:47A9 $28 $0C

    ld   d, a                                     ;; 20:47AB $57
    dec  hl                                       ;; 20:47AC $2B
    ld   a, [hl]                                  ;; 20:47AD $7E
    ld   b, a                                     ;; 20:47AE $47
    ld   c, $07                                   ;; 20:47AF $0E $07
    ld   a, d                                     ;; 20:47B1 $7A
    ld   h, $20                                   ;; 20:47B2 $26 $20
    call CopyDataToVRAM                           ;; 20:47B4 $CD $13 $0A

.jr_47B7
    ldh  a, [hMapRoom]                            ;; 20:47B7 $F0 $F6
    cp   UNKNOWN_ROOM_01                          ;; 20:47B9 $FE $01
    jr   nz, .ret_47C2                            ;; 20:47BB $20 $05

    ld   a, $20                                   ;; 20:47BD $3E $20
    call CopyColorDungeonSymbols                  ;; 20:47BF $CD $32 $0A

.ret_47C2
    ret                                           ;; 20:47C2 $C9

data_020_47C3::
    db   $00, $40, $80, $C0, $00, $40, $80, $C0

MapRoomTable_b0::
    ; indexed by hMapRoom
    db   $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $04
    db   $00, $00, $00, $04, $00, $00

MapRoomTable_b1::
    ; indexed by hMapRoom
    db   $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $05, $00, $00, $00, $00, $05, $00
    db   $00, $00, $00, $00, $00, $05

; Configure the parameters for copying the animated tiles.
; First called with b=1, then with b=0
; Inputs:
;   b:  ??? (0 or 1)
ConfigureAnimatedTilesCopy::
    ldh  a, [hMapRoom]                            ;; 20:47F7 $F0 $F6
    ld   c, a                                     ;; 20:47F9 $4F

    ; hl = (b == 0 ? MapRoomTable_b0 : MapRoomTable_b1)
    ld   hl, MapRoomTable_b0                      ;; 20:47FA $21 $CB $47
    ld   a, b                                     ;; 20:47FD $78
    and  a                                        ;; 20:47FE $A7
    jr   z, .b1End                                ;; 20:47FF $28 $03
    ld   hl, MapRoomTable_b1                      ;; 20:4801 $21 $E1 $47
.b1End

    ld   b, $00                                   ; $4804:  $06 $00
    add  hl, bc                                   ;; 20:4806 $09
    ld   a, [hl]                                  ;; 20:4807 $7E
    and  a                                        ;; 20:4808 $A7
    ret  z                                        ;; 20:4809 $C8

    ld   b, a                                     ;; 20:480A $47
    ld   c, $00                                   ;; 20:480B $0E $00
    ldh  a, [hAnimatedTilesFrameCount]            ;; 20:480D $F0 $A6
    rra                                           ;; 20:480F $1F
    rra                                           ;; 20:4810 $1F
    rra                                           ;; 20:4811 $1F
    and  $07                                      ;; 20:4812 $E6 $07
    ld   e, a                                     ;; 20:4814 $5F
    ld   d, $00                                   ;; 20:4815 $16 $00
    ld   hl, data_020_47C3                        ;; 20:4817 $21 $C3 $47
    add  hl, de                                   ;; 20:481A $19
    ld   l, [hl]                                  ;; 20:481B $6E
    ld   h, $00                                   ;; 20:481C $26 $00
    ld   de, $6000                                ;; 20:481E $11 $00 $60
    add  hl, bc                                   ;; 20:4821 $09
    add  hl, de                                   ;; 20:4822 $19
    ld   de, $8FC0                                ;; 20:4823 $11 $C0 $8F
    ld   bc, $40                                  ;; 20:4826 $01 $40 $00
    ld   a, $35                                   ;; 20:4829 $3E $35
    and  a                                        ;; 20:482B $A7
    ret                                           ;; 20:482C $C9

; Replace objects $56 and $57 by object $0D.
; Used in the color dungeon.
ReplaceObjects56and57::
    di                                            ;; 20:482D $F3
    ld   bc, wRoomObjectsArea                     ;; 20:482E $01 $00 $D7
    ld   de, wIsFileSelectionArrowShifted         ;; 20:4831 $11 $00 $D0
    ld   hl, rSVBK                                ;; 20:4834 $21 $70 $FF

    ; For each object in the room…
.loop
    ; If the object type is $56 or $57…
    ld   a, [bc]                                  ;; 20:4837 $0A
    cp   $56                                      ;; 20:4838 $FE $56
    jr   z, .handleSpecialObject                  ;; 20:483A $28 $04

    cp   $57                                      ;; 20:483C $FE $57
    jr   nz, .continue                            ;; 20:483E $20 $0B

.handleSpecialObject
    ld   [hl], $05                                ;; 20:4840 $36 $05
    ld   a, [de]                                  ;; 20:4842 $1A
    ld   [hl], $00                                ;; 20:4843 $36 $00
    and  a                                        ;; 20:4845 $A7
    jr   z, .continue                             ;; 20:4846 $28 $03

    ld   a, $0D                                   ;; 20:4848 $3E $0D
    ld   [bc], a                                  ;; 20:484A $02

.continue
    inc  bc                                       ;; 20:484B $03
    inc  de                                       ;; 20:484C $13
    ld   a, e                                     ;; 20:484D $7B
    cp   $C0                                      ;; 20:484E $FE $C0
    jr   nz, .loop                                ;; 20:4850 $20 $E5

    ei                                            ;; 20:4852 $FB
    ret                                           ;; 20:4853 $C9

; On GBC, clear the $0C first bytes of WRAM bank 5
ClearWRAMBank5::
    ; If not on GBC, return
    ldh  a, [hIsGBC]                              ;; 20:4854 $F0 $FE

func_020_4856::
    and  a                                        ;; 20:4856 $A7
    ret  z                                        ;; 20:4857 $C8

    di                                            ;; 20:4858 $F3
    ld   a, $05                                   ;; 20:4859 $3E $05
    ldh  [rSVBK], a                               ;; 20:485B $E0 $70
    ld   hl, wIsFileSelectionArrowShifted         ;; 20:485D $21 $00 $D0

.loop
    xor  a                                        ;; 20:4860 $AF
    ld   [hl+], a                                 ;; 20:4861 $22
    ld   a, l                                     ;; 20:4862 $7D
    cp   $C0                                      ;; 20:4863 $FE $C0
    jr   nz, .loop                                ;; 20:4865 $20 $F9

    xor  a                                        ;; 20:4867 $AF
    ldh  [rSVBK], a                               ;; 20:4868 $E0 $70
    ei                                            ;; 20:486A $FB
    ret                                           ;; 20:486B $C9

Data_020_486C::
    db   $09, $05, $08, $08

Data_020_4870::
    db   $0A, $0A, $07, $0C

func_020_4874::
    ld   hl, Data_020_486C                        ;; 20:4874 $21 $6C $48
    add  hl, de                                   ;; 20:4877 $19
    ldh  a, [hMultiPurpose0]                      ;; 20:4878 $F0 $D7
    add  [hl]                                     ;; 20:487A $86
    sub  $08                                      ;; 20:487B $D6 $08
    and  $F0                                      ;; 20:487D $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 20:487F $E0 $CE
    swap a                                        ;; 20:4881 $CB $37
    ldh  [hMultiPurpose0], a                      ;; 20:4883 $E0 $D7
    ld   hl, Data_020_4870                        ;; 20:4885 $21 $70 $48
    add  hl, de                                   ;; 20:4888 $19
    ldh  a, [hMultiPurpose1]                      ;; 20:4889 $F0 $D8
    add  [hl]                                     ;; 20:488B $86
    sub  $10                                      ;; 20:488C $D6 $10
    and  $F0                                      ;; 20:488E $E6 $F0
    ld   e, a                                     ;; 20:4890 $5F
    ldh  [hIntersectedObjectTop], a               ;; 20:4891 $E0 $CD
    ldh  a, [hMultiPurpose0]                      ;; 20:4893 $F0 $D7
    or   e                                        ;; 20:4895 $B3
    ld   e, a                                     ;; 20:4896 $5F
    ret                                           ;; 20:4897 $C9

func_020_4898::
    push de                                       ;; 20:4898 $D5
    ld   hl, wDrawCommand                         ;; 20:4899 $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 20:489C $FA $00 $D6
    ld   e, a                                     ;; 20:489F $5F
    add  $0A                                      ;; 20:48A0 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 20:48A2 $EA $00 $D6
    ld   d, $00                                   ;; 20:48A5 $16 $00
    add  hl, de                                   ;; 20:48A7 $19
    pop  de                                       ;; 20:48A8 $D1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 20:48A9 $F0 $CF
    ld   [hl+], a                                 ;; 20:48AB $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 20:48AC $F0 $D0
    ld   [hl+], a                                 ;; 20:48AE $22
    ld   a, $81                                   ;; 20:48AF $3E $81
    ld   [hl+], a                                 ;; 20:48B1 $22
    ld   a, [de]                                  ;; 20:48B2 $1A
    inc  de                                       ;; 20:48B3 $13
    ld   [hl+], a                                 ;; 20:48B4 $22
    ld   a, [de]                                  ;; 20:48B5 $1A
    inc  de                                       ;; 20:48B6 $13
    ld   [hl+], a                                 ;; 20:48B7 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 20:48B8 $F0 $CF
    ld   [hl+], a                                 ;; 20:48BA $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 20:48BB $F0 $D0
    inc  a                                        ;; 20:48BD $3C
    ld   [hl+], a                                 ;; 20:48BE $22
    ld   a, $81                                   ;; 20:48BF $3E $81
    ld   [hl+], a                                 ;; 20:48C1 $22
    ld   a, [de]                                  ;; 20:48C2 $1A
    inc  de                                       ;; 20:48C3 $13
    ld   [hl+], a                                 ;; 20:48C4 $22
    ld   a, [de]                                  ;; 20:48C5 $1A
    ld   [hl+], a                                 ;; 20:48C6 $22
    ld   [hl], $00                                ;; 20:48C7 $36 $00
    ret                                           ;; 20:48C9 $C9

; Special code for the Color Dungeon
func_020_48CA::
    ; If Free-movement mode is enabled, return
    ld   a, [wFreeMovementMode]                   ;; 20:48CA $FA $7B $C1
    and  a                                        ;; 20:48CD $A7
    ret  nz                                       ;; 20:48CE $C0

    ; If not on color dungeon, return
    ldh  a, [hMapId]                              ;; 20:48CF $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 20:48D1 $FE $FF
    ret  nz                                       ;; 20:48D3 $C0

    ldh  a, [hIntersectedObjectTop]               ;; 20:48D4 $F0 $CD
    ld   d, a                                     ;; 20:48D6 $57
    ldh  a, [hIntersectedObjectLeft]              ;; 20:48D7 $F0 $CE
    ld   e, a                                     ;; 20:48D9 $5F
    push de                                       ;; 20:48DA $D5
    ld   d, $00                                   ;; 20:48DB $16 $00
    ldh  a, [hLinkDirection]                      ;; 20:48DD $F0 $9E
    ld   e, a                                     ;; 20:48DF $5F
    ldh  a, [hLinkPositionX]                      ;; 20:48E0 $F0 $98
    ldh  [hMultiPurpose0], a                      ;; 20:48E2 $E0 $D7
    ldh  a, [hLinkPositionY]                      ;; 20:48E4 $F0 $99
    ldh  [hMultiPurpose1], a                      ;; 20:48E6 $E0 $D8
    call func_020_4874                            ;; 20:48E8 $CD $74 $48
    ld   hl, wRoomObjects                         ;; 20:48EB $21 $11 $D7
    add  hl, de                                   ;; 20:48EE $19
    ld   a, [hl]                                  ;; 20:48EF $7E
    cp   $53                                      ;; 20:48F0 $FE $53
    jr   z, .jr_48FC                              ;; 20:48F2 $28 $08

    cp   $55                                      ;; 20:48F4 $FE $55
    jr   z, .jr_48FC                              ;; 20:48F6 $28 $04

    cp   $54                                      ;; 20:48F8 $FE $54
    jr   nz, jr_020_490A                          ;; 20:48FA $20 $0E

.jr_48FC
    ld   a, [wIsLinkInTheAir]                     ;; 20:48FC $FA $46 $C1
    and  a                                        ;; 20:48FF $A7
    jr   nz, jr_020_4917                          ;; 20:4900 $20 $15

    call func_020_4954                            ;; 20:4902 $CD $54 $49
    call UseRocsFeather                           ;; 20:4905 $CD $CB $14
    jr   jr_020_4917                              ;; 20:4908 $18 $0D

jr_020_490A:
    cp   $56                                      ;; 20:490A $FE $56
    jr   z, .jr_4912                              ;; 20:490C $28 $04

    cp   $57                                      ;; 20:490E $FE $57
    jr   nz, jr_020_4917                          ;; 20:4910 $20 $05

.jr_4912
    call func_020_4923                            ;; 20:4912 $CD $23 $49
    jr   jr_020_4917                              ;; 20:4915 $18 $00

jr_020_4917:
    pop  de                                       ;; 20:4917 $D1
    ld   a, d                                     ;; 20:4918 $7A
    ldh  [hIntersectedObjectTop], a               ;; 20:4919 $E0 $CD
    ld   a, e                                     ;; 20:491B $7B
    ldh  [hIntersectedObjectLeft], a              ;; 20:491C $E0 $CE
    ret                                           ;; 20:491E $C9

Data_020_491F::
    db   $10, $12, $11, $13

func_020_4923::
    ld   a, $0D                                   ;; 20:4923 $3E $0D
    ld   [wDDD8], a                               ;; 20:4925 $EA $D8 $DD
    ld   [hl], a                                  ;; 20:4928 $77
    ld   a, [wAddRupeeBufferLow]                  ;; 20:4929 $FA $90 $DB
    add  $05                                      ;; 20:492C $C6 $05
    ld   [wAddRupeeBufferLow], a                  ;; 20:492E $EA $90 $DB
    di                                            ;; 20:4931 $F3
    ld   a, $05                                   ;; 20:4932 $3E $05
    ldh  [rSVBK], a                               ;; 20:4934 $E0 $70
    ld   hl, wD011                                ;; 20:4936 $21 $11 $D0
    add  hl, de                                   ;; 20:4939 $19
    ld   [hl], a                                  ;; 20:493A $77
    xor  a                                        ;; 20:493B $AF
    ldh  [rSVBK], a                               ;; 20:493C $E0 $70
    ei                                            ;; 20:493E $FB
    call label_2887                               ;; 20:493F $CD $87 $28
    push bc                                       ;; 20:4942 $C5
    ld   a, $20                                   ;; 20:4943 $3E $20
    call func_91D                                 ;; 20:4945 $CD $1D $09
    pop  bc                                       ;; 20:4948 $C1
    ld   de, Data_020_491F                        ;; 20:4949 $11 $1F $49
    call func_020_4898                            ;; 20:494C $CD $98 $48
    ret                                           ;; 20:494F $C9

Data_020_4950::
    db   $76, $77, $76, $77

func_020_4954::
    ld   a, [hl]                                  ;; 20:4954 $7E
    inc  a                                        ;; 20:4955 $3C
    ldh  [hMultiPurpose0], a                      ;; 20:4956 $E0 $D7
    dec  a                                        ;; 20:4958 $3D
    cp   $55                                      ;; 20:4959 $FE $55
    jr   nz, .jr_4961                             ;; 20:495B $20 $04

    ld   a, $AE                                   ;; 20:495D $3E $AE
    ldh  [hMultiPurpose0], a                      ;; 20:495F $E0 $D7

.jr_4961
    ldh  a, [hMultiPurpose0]                      ;; 20:4961 $F0 $D7
    ld   [hl], a                                  ;; 20:4963 $77
    call label_2887                               ;; 20:4964 $CD $87 $28
    push bc                                       ;; 20:4967 $C5
    ldh  a, [hMultiPurpose0]                      ;; 20:4968 $F0 $D7
    ld   [wDDD8], a                               ;; 20:496A $EA $D8 $DD
    ld   a, $20                                   ;; 20:496D $3E $20
    call func_91D                                 ;; 20:496F $CD $1D $09
    pop  bc                                       ;; 20:4972 $C1
    ldh  a, [hMultiPurpose0]                      ;; 20:4973 $F0 $D7
    cp   $AE                                      ;; 20:4975 $FE $AE
    jr   nz, .ret_497F                            ;; 20:4977 $20 $06

    ld   de, Data_020_4950                        ;; 20:4979 $11 $50 $49
    call func_020_4898                            ;; 20:497C $CD $98 $48

.ret_497F
    ret                                           ;; 20:497F $C9

; Order in which the tomb stones should be pushed
TombStonesSequence::
    db   $35, $33, $13, $15, $17

; When pushing a tomb stone in the Color dungeon graveyard,
; check if the order matches the secret sequence.
CheckPushedTombStone::
    push bc                                       ;; 20:4985 $C5
    push de                                       ;; 20:4986 $D5
    ; a = TombStonesSequence[wColorDungonCorrectTombStones]
    ld   hl, TombStonesSequence                   ;; 20:4987 $21 $80 $49
    ld   a, [wColorDungonCorrectTombStones]       ;; 20:498A $FA $D9 $DD
    ld   e, a                                     ;; 20:498D $5F
    ld   d, $00                                   ;; 20:498E $16 $00
    add  hl, de                                   ;; 20:4990 $19
    ld   a, [hl]                                  ;; 20:4991 $7E

    ; If [hMultiPurposeH] != 0, return.
    ld   hl, hMultiPurposeH                       ;; 20:4992 $21 $E9 $FF
    cp   [hl]                                     ;; 20:4995 $BE
    jr   nz, .return                              ;; 20:4996 $20 $17

    ; Increment the correct number of tomb stones pushed
    ld   a, [wColorDungonCorrectTombStones]       ;; 20:4998 $FA $D9 $DD
    inc  a                                        ;; 20:499B $3C
    ld   [wColorDungonCorrectTombStones], a       ;; 20:499C $EA $D9 $DD

    ; If all 5 tomb stones were correctly pushed…
    cp   $05                                      ;; 20:499F $FE $05
    jr   nz, .return                              ;; 20:49A1 $20 $0C

    ; Mark the color dungon as opened
    ld   a, $80                                   ;; 20:49A3 $3E $80
    ld   [wColorDungonCorrectTombStones], a       ;; 20:49A5 $EA $D9 $DD

    ; Play the puzzle solved jingle
    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 20:49A8 $3E $02
    ldh  [hJingle], a                             ;; 20:49AA $E0 $F2
    call ClearWRAMBank5                           ;; 20:49AC $CD $54 $48

.return
    pop  de                                       ;; 20:49AF $D1
    pop  bc                                       ;; 20:49B0 $C1
    ret                                           ;; 20:49B1 $C9

PegasusBootsCollisionXOffsets::
.right: db  $10
.left:  db  $F0
.up:    db  $08
.down:  db  $08

PegasusBootsCollisionYOffsets::
.right: db  $0C
.left:  db  $0C
.up:    db  $F0
.down:  db  $10

func_020_49BA::
    ; wPegasusBootsCollisionPosX = [PegasusBootsCollisionXOffsets + Linkdirection] + hLinkPositionX
    ldh  a, [hLinkDirection]                      ;; 20:49BA $F0 $9E
    ld   e, a                                     ;; 20:49BC $5F
    ld   d, $00                                   ;; 20:49BD $16 $00
    ld   hl, PegasusBootsCollisionXOffsets        ;; 20:49BF $21 $B2 $49
    add  hl, de                                   ;; 20:49C2 $19
    ldh  a, [hLinkPositionX]                      ;; 20:49C3 $F0 $98
    add  [hl]                                     ;; 20:49C5 $86
    ld   [wPegasusBootsCollisionPosX], a          ;; 20:49C6 $EA $79 $C1
    ; wPegasusBootsCollisionPosY = [PegasusBootsCollisionYOffsets + Linkdirection] + hLinkPositionY
    ld   hl, PegasusBootsCollisionYOffsets        ;; 20:49C9 $21 $B6 $49
    add  hl, de                                   ;; 20:49CC $19
    ldh  a, [hLinkPositionY]                      ;; 20:49CD $F0 $99
    add  [hl]                                     ;; 20:49CF $86
    ld   [wPegasusBootsCollisionPosY], a          ;; 20:49D0 $EA $7A $C1
    ; wPegasusBootsCollisionCountdown = 2
    ld   a, $02                                   ;; 20:49D3 $3E $02
    ld   [wPegasusBootsCollisionCountdown], a     ;; 20:49D5 $EA $78 $C1
    ret                                           ;; 20:49D8 $C9

; Load BG palette data
func_020_49D9::
    ldh  a, [hBGMapOffsetHigh]                    ;; 20:49D9 $F0 $E0
    ld   h, a                                     ;; 20:49DB $67
    ldh  a, [hBGMapOffsetLow]                     ;; 20:49DC $F0 $E1
    ld   l, a                                     ;; 20:49DE $6F
    ldh  a, [hMultiPurposeB]                      ;; 20:49DF $F0 $E2
    ld   b, a                                     ;; 20:49E1 $47
    ldh  a, [hMultiPurposeC]                      ;; 20:49E2 $F0 $E3
    ld   c, a                                     ;; 20:49E4 $4F
    ldh  a, [hMultiPurposeD]                      ;; 20:49E5 $F0 $E4
    ld   d, a                                     ;; 20:49E7 $57
    ldh  a, [hMultiPurposeE]                      ;; 20:49E8 $F0 $E5
    ld   e, a                                     ;; 20:49EA $5F
    ret                                           ;; 20:49EB $C9

Data_020_49EC::
    db   $01, $01, $20, $20

Data_020_49F0::
    db   $93, $93, $13, $13

; DMG version
func_020_49F4::
    ld   a, [wBGUpdateRegionOriginLow]            ;; 20:49F4 $FA $27 $C1
    ld   [wDrawCommand.destinationLow], a         ;; 20:49F7 $EA $02 $D6
    ld   a, [wBGUpdateRegionOriginHigh]           ;; 20:49FA $FA $26 $C1
    or   $98                                      ;; 20:49FD $F6 $98
    ld   [wDrawCommand.destinationHigh], a        ;; 20:49FF $EA $01 $D6
    ld   hl, Data_020_49F0                        ;; 20:4A02 $21 $F0 $49
    add  hl, bc                                   ;; 20:4A05 $09
    ld   a, [hl]                                  ;; 20:4A06 $7E
    ld   [wDrawCommand.length], a                 ;; 20:4A07 $EA $03 $D6
    ld   a, $00                                   ;; 20:4A0A $3E $00
    ld   [wDrawCommand.data + $14], a             ;; 20:4A0C $EA $18 $D6
    ld   a, $EE                                   ;; 20:4A0F $3E $EE
    ld   [wDrawCommand.data + $10], a             ;; 20:4A11 $EA $14 $D6
    ld   [wDrawCommand.data + $11], a             ;; 20:4A14 $EA $15 $D6
    ld   [wDrawCommand.data + $12], a             ;; 20:4A17 $EA $16 $D6
    ld   [wDrawCommand.data + $13], a             ;; 20:4A1A $EA $17 $D6
    ld   b, HIGH(wDrawCommand.data)               ;; 20:4A1D $06 $D6
    ld   c, LOW(wDrawCommand.data)                ;; 20:4A1F $0E $04
    ret                                           ;; 20:4A21 $C9

; CGB version
func_020_4A22::
    ld   a, [wBGUpdateRegionOriginLow]            ;; 20:4A22 $FA $27 $C1
    ld   [wDrawCommand.destinationLow], a         ;; 20:4A25 $EA $02 $D6
    ld   [wDrawCommandVRAM1.destinationLow], a    ;; 20:4A28 $EA $92 $DC

    ld   a, [wBGUpdateRegionOriginHigh]           ;; 20:4A2B $FA $26 $C1
    or   $98                                      ;; 20:4A2E $F6 $98
    ld   [wDrawCommand.destinationHigh], a        ;; 20:4A30 $EA $01 $D6
    ld   [wDrawCommandVRAM1.destinationHigh], a   ;; 20:4A33 $EA $91 $DC

    ld   hl, Data_020_49F0                        ;; 20:4A36 $21 $F0 $49
    add  hl, bc                                   ;; 20:4A39 $09
    ld   a, [hl]                                  ;; 20:4A3A $7E
    ld   [wDrawCommand.length], a                 ;; 20:4A3B $EA $03 $D6
    ld   [wDrawCommandVRAM1.length], a            ;; 20:4A3E $EA $93 $DC

    ld   a, $00                                   ;; 20:4A41 $3E $00
    ld   [wDrawCommand.data + $14], a             ;; 20:4A43 $EA $18 $D6
    ld   [wDrawCommandVRAM1.data + $14], a        ;; 20:4A46 $EA $A8 $DC

    ld   a, $EE                                   ;; 20:4A49 $3E $EE
    ld   [wDrawCommand.data + $10], a             ;; 20:4A4B $EA $14 $D6
    ld   [wDrawCommand.data + $11], a             ;; 20:4A4E $EA $15 $D6
    ld   [wDrawCommand.data + $12], a             ;; 20:4A51 $EA $16 $D6
    ld   [wDrawCommand.data + $13], a             ;; 20:4A54 $EA $17 $D6
    ld   b, HIGH(wDrawCommand.data)               ;; 20:4A57 $06 $D6
    ld   c, LOW(wDrawCommand.data)                ;; 20:4A59 $0E $04
    ld   [wDrawCommandVRAM1.data + $10], a        ;; 20:4A5B $EA $A4 $DC
    ld   [wDrawCommandVRAM1.data + $11], a        ;; 20:4A5E $EA $A5 $DC
    ld   [wDrawCommandVRAM1.data + $12], a        ;; 20:4A61 $EA $A6 $DC
    ld   [wDrawCommandVRAM1.data + $13], a        ;; 20:4A64 $EA $A7 $DC
    ld   a, HIGH(wDrawCommandVRAM1.data)          ;; 20:4A67 $3E $DC
ASSERT HIGH(wDrawCommandVRAM1.data) == HIGH(wDrawCommandVRAM1.data + $17)
    ldh  [hMultiPurposeB], a                      ;; 20:4A69 $E0 $E2
    ldh  [hMultiPurposeD], a                      ;; 20:4A6B $E0 $E4
    ld   a, LOW(wDrawCommandVRAM1.data)           ;; 20:4A6D $3E $94
    ldh  [hMultiPurposeC], a                      ;; 20:4A6F $E0 $E3
    ld   a, LOW(wDrawCommandVRAM1.data + $17)     ;; 20:4A71 $3E $AB
    ldh  [hMultiPurposeE], a                      ;; 20:4A73 $E0 $E5
    ret                                           ;; 20:4A75 $C9

; Configures an async data request to copy BG tilemap
func_020_4A76::
    ld   a, [wRoomTransitionDirection]            ;; 20:4A76 $FA $25 $C1
    ld   c, a                                     ;; 20:4A79 $4F
    ld   b, $00                                   ;; 20:4A7A $06 $00
    ld   a, [wTransitionOffset]                   ;; 20:4A7C $FA $2A $C1
    ldh  [hMultiPurpose2], a                      ;; 20:4A7F $E0 $D9
    ld   hl, Data_020_49EC                        ;; 20:4A81 $21 $EC $49
    add  hl, bc                                   ;; 20:4A84 $09

    ldh  a, [hIsGBC]                              ;; 20:4A85 $F0 $FE
    and  a                                        ;; 20:4A87 $A7
    jr   nz, .gbc                                 ;; 20:4A88 $20 $05

    ; DMG
    call func_020_49F4                            ;; 20:4A8A $CD $F4 $49
    jr   .return                                  ;; 20:4A8D $18 $03
.gbc
    ; GBC
    call func_020_4A22                            ;; 20:4A8F $CD $22 $4A

.return
    ret                                           ;; 20:4A92 $C9

Data_020_4A93::
    db   $08

Data_020_4A94::
    db   $06, $0C, $0A, $FF, $04, $0A, $0C, $06, $08, $0A, $0C, $FF, $04, $0C, $0A

Data_020_4AA3::
    db   $23

Data_020_4AA4::
    db   $23, $63, $63, $03, $03, $43, $43, $03, $03, $03, $03, $43, $43, $23, $23

func_020_4AB3::
    push hl                                       ;; 20:4AB3 $E5
    ldh  a, [hMultiPurpose0]                      ;; 20:4AB4 $F0 $D7
    add  h                                        ;; 20:4AB6 $84
    ld   [bc], a                                  ;; 20:4AB7 $02
    inc  bc                                       ;; 20:4AB8 $03
    ldh  a, [hMultiPurpose1]                      ;; 20:4AB9 $F0 $D8
    add  l                                        ;; 20:4ABB $85
    ld   [bc], a                                  ;; 20:4ABC $02
    inc  bc                                       ;; 20:4ABD $03
    ld   hl, Data_020_4A93                        ;; 20:4ABE $21 $93 $4A
    ldh  a, [hMultiPurpose2]                      ;; 20:4AC1 $F0 $D9
    sla  a                                        ;; 20:4AC3 $CB $27
    ld   e, a                                     ;; 20:4AC5 $5F
    ld   d, $00                                   ;; 20:4AC6 $16 $00
    add  hl, de                                   ;; 20:4AC8 $19
    ld   a, [hl]                                  ;; 20:4AC9 $7E
    ld   [bc], a                                  ;; 20:4ACA $02
    cp   $FF                                      ;; 20:4ACB $FE $FF
    jr   nz, .jr_4AD4                             ;; 20:4ACD $20 $05

    dec  bc                                       ;; 20:4ACF $0B
    ld   a, $F0                                   ;; 20:4AD0 $3E $F0
    ld   [bc], a                                  ;; 20:4AD2 $02
    inc  bc                                       ;; 20:4AD3 $03

.jr_4AD4
    inc  bc                                       ;; 20:4AD4 $03
    ld   hl, Data_020_4AA3                        ;; 20:4AD5 $21 $A3 $4A
    add  hl, de                                   ;; 20:4AD8 $19
    ld   a, [hl]                                  ;; 20:4AD9 $7E
    ld   hl, hMultiPurpose3                       ;; 20:4ADA $21 $DA $FF
    or   [hl]                                     ;; 20:4ADD $B6
    ld   [bc], a                                  ;; 20:4ADE $02
    ldh  a, [hIsGBC]                              ;; 20:4ADF $F0 $FE
    and  a                                        ;; 20:4AE1 $A7
    jr   z, .jr_4AEF                              ;; 20:4AE2 $28 $0B

    ldh  a, [hMultiPurpose3]                      ;; 20:4AE4 $F0 $DA
    and  a                                        ;; 20:4AE6 $A7
    jr   z, .jr_4AEF                              ;; 20:4AE7 $28 $06

    ld   a, [bc]                                  ;; 20:4AE9 $0A
    and  $F8                                      ;; 20:4AEA $E6 $F8
    or   $04                                      ;; 20:4AEC $F6 $04
    ld   [bc], a                                  ;; 20:4AEE $02

.jr_4AEF
    inc  bc                                       ;; 20:4AEF $03
    pop  hl                                       ;; 20:4AF0 $E1
    ldh  a, [hMultiPurpose0]                      ;; 20:4AF1 $F0 $D7
    add  h                                        ;; 20:4AF3 $84
    ld   [bc], a                                  ;; 20:4AF4 $02
    inc  bc                                       ;; 20:4AF5 $03
    ldh  a, [hMultiPurpose1]                      ;; 20:4AF6 $F0 $D8
    add  l                                        ;; 20:4AF8 $85
    add  $08                                      ;; 20:4AF9 $C6 $08
    ld   [bc], a                                  ;; 20:4AFB $02
    inc  bc                                       ;; 20:4AFC $03
    ld   hl, Data_020_4A94                        ;; 20:4AFD $21 $94 $4A
    add  hl, de                                   ;; 20:4B00 $19
    ld   a, [hl]                                  ;; 20:4B01 $7E
    ld   [bc], a                                  ;; 20:4B02 $02
    inc  bc                                       ;; 20:4B03 $03
    ld   hl, Data_020_4AA4                        ;; 20:4B04 $21 $A4 $4A
    add  hl, de                                   ;; 20:4B07 $19
    ld   a, [hl]                                  ;; 20:4B08 $7E
    ld   hl, hMultiPurpose3                       ;; 20:4B09 $21 $DA $FF
    or   [hl]                                     ;; 20:4B0C $B6
    ld   [bc], a                                  ;; 20:4B0D $02
    ldh  a, [hIsGBC]                              ;; 20:4B0E $F0 $FE
    and  a                                        ;; 20:4B10 $A7
    jr   z, .ret_4B1E                             ;; 20:4B11 $28 $0B

    ldh  a, [hMultiPurpose3]                      ;; 20:4B13 $F0 $DA
    and  a                                        ;; 20:4B15 $A7
    jr   z, .ret_4B1E                             ;; 20:4B16 $28 $06

    ld   a, [bc]                                  ;; 20:4B18 $0A
    and  $F8                                      ;; 20:4B19 $E6 $F8
    or   $04                                      ;; 20:4B1B $F6 $04
    ld   [bc], a                                  ;; 20:4B1D $02

.ret_4B1E
    ret                                           ;; 20:4B1E $C9

func_20_4B1F::
    xor  a                                        ;; 20:4B1F $AF
    ld   [wHasPlacedBomb], a                      ;; 20:4B20 $EA $4E $C1
    ld   [wActiveProjectileCount], a              ;; 20:4B23 $EA $4D $C1
    ld   [wC1A4], a                               ;; 20:4B26 $EA $A4 $C1
    ld   [wIsCarryingLiftedObject], a             ;; 20:4B29 $EA $5C $C1
    ld   [wZolCount], a                           ;; 20:4B2C $EA $AE $C1
    ld   a, [wIsLinkPushing]                      ;; 20:4B2F $FA $44 $C1
    and  a                                        ;; 20:4B32 $A7
    jr   z, .ret_4B39                             ;; 20:4B33 $28 $04

    dec  a                                        ;; 20:4B35 $3D
    ld   [wIsLinkPushing], a                      ;; 20:4B36 $EA $44 $C1

.ret_4B39
    ret                                           ;; 20:4B39 $C9

; Link's direction table
LinkDirectionTowC140::
.right: db  $10
.left:  db  $00
.up:    db  $08
.down:  db  $08

LinkDirectionTowC141::
.right: db  $03
.left:  db  $03
.up:    db  $08
.down:  db  $08

LinkDirectionTowC142::
.right: db  $08
.left:  db  $08
.up:    db  $00
.down:  db  $0D

LinkDirectionTowC143::
.right: db  $08
.left:  db  $08
.up:    db  $03
.down:  db  $04

; Shield-related function
func_020_4B4A::
    ldh  a, [hLinkDirection]                      ;; 20:4B4A $F0 $9E
    ld   e, a                                     ;; 20:4B4C $5F
    ld   d, $00                                   ;; 20:4B4D $16 $00
    ld   hl, LinkDirectionTowC140                 ;; 20:4B4F $21 $3A $4B
    add  hl, de                                   ;; 20:4B52 $19
    ldh  a, [hLinkPositionX]                      ;; 20:4B53 $F0 $98
    add  [hl]                                     ;; 20:4B55 $86
    ld   [wC140], a                               ;; 20:4B56 $EA $40 $C1
    ld   hl, LinkDirectionTowC141                 ;; 20:4B59 $21 $3E $4B
    add  hl, de                                   ;; 20:4B5C $19
    ld   a, [hl]                                  ;; 20:4B5D $7E
    ld   [wC141], a                               ;; 20:4B5E $EA $41 $C1
    ld   hl, LinkDirectionTowC142                 ;; 20:4B61 $21 $42 $4B
    add  hl, de                                   ;; 20:4B64 $19
    ld   a, [wC145]                               ;; 20:4B65 $FA $45 $C1
    add  [hl]                                     ;; 20:4B68 $86
    ld   [wC142], a                               ;; 20:4B69 $EA $42 $C1
    ld   hl, LinkDirectionTowC143                 ;; 20:4B6C $21 $46 $4B
    add  hl, de                                   ;; 20:4B6F $19
    ld   a, [hl]                                  ;; 20:4B70 $7E
    ld   [wC143], a                               ;; 20:4B71 $EA $43 $C1
    ; disable sword collision and return
    xor  a                                        ;; 20:4B74 $AF
    ld   [wSwordCollisionEnabled], a              ;; 20:4B75 $EA $B0 $C5
    ret                                           ;; 20:4B78 $C9

; trwo speed in X direction ?
Data_020_4B79::
.right: db   8
.left:  db  -8
.up:    db   0
.down:  db   0

; trwo speed in Y direction ?
Data_020_4B7D::
.right: db   0
.left:  db   0
.up:    db  -3
.down:  db   4

; Convert last placed bomb to a bomb arrow
; (if all conditions are met)
ConvertToBombArrowIfNeeded::
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 20:4B81 $21 $F0 $C2
    add  hl, de                                   ;; 20:4B84 $19
    ld   [hl], $10                                ;; 20:4B85 $36 $10
    ; reset wBombArrowCooldown if not already zero
    ld   a, [wBombArrowCooldown]                  ;; 20:4B87 $FA $C0 $C1
    and  a                                        ;; 20:4B8A $A7
    jp   z, .label_020_4B9E                       ;; 20:4B8B $CA $9E $4B
    xor  a                                        ;; 20:4B8E $AF
    ld   [wBombArrowCooldown], a                  ;; 20:4B8F $EA $C0 $C1

IF __PATCH_0__
    ; This patch is meant to fix the bomb triggers bug.
    ;
    ; But as both conditions will never be true, it results in bomb arrows
    ;  not working when firing the arrow first and place the bomb second.
    ld   a, [wInventoryItems.AButtonSlot]
    cp   INVENTORY_BOW
    ret  nz

    ld   a, [wInventoryItems.BButtonSlot]
    cp   INVENTORY_BOW
    ret  nz
ENDC

    ld   a, [wLatestShotArrowEntityIndex]         ;; 20:4B92 $FA $C2 $C1
    ld   c, a                                     ;; 20:4B95 $4F
    ld   b, d                                     ;; 20:4B96 $42
    ld   hl, wEntitiesStateTable                  ;; 20:4B97 $21 $90 $C2
    add  hl, bc                                   ;; 20:4B9A $09
    ld   [hl], $01                                ;; 20:4B9B $36 $01
    ret                                           ;; 20:4B9D $C9

.label_020_4B9E
    ld   a, BOMB_ARROW_COOLDOWN                   ;; 20:4B9E $3E $06
    ld   [wBombArrowCooldown], a                  ;; 20:4BA0 $EA $C0 $C1
    ld   a, e                                     ;; 20:4BA3 $7B
    ld   [wLatestDroppedBombEntityIndex], a       ;; 20:4BA4 $EA $C1 $C1

    ld   a, $0C | ATTACK_STEP_ITEM_ANY            ;; 20:4BA7 $3E $0C
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 20:4BA9 $EA $9B $C1

    ld   hl, wEntitiesTransitionCountdownTable    ;; 20:4BAC $21 $E0 $C2
    add  hl, de                                   ;; 20:4BAF $19
    ld   [hl], $A0                                ;; 20:4BB0 $36 $A0
    ld   hl, wEntitiesSpriteVariantTable          ;; 20:4BB2 $21 $B0 $C3
    add  hl, de                                   ;; 20:4BB5 $19
    ld   [hl], d                                  ;; 20:4BB6 $72
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 20:4BB7 $21 $80 $C4
    add  hl, de                                   ;; 20:4BBA $19
    ld   [hl], $03                                ;; 20:4BBB $36 $03
    ldh  a, [hIsSideScrolling]                    ;; 20:4BBD $F0 $F9
    and  a                                        ;; 20:4BBF $A7
    jr   nz, .jr_4BC8                             ;; 20:4BC0 $20 $06

    ld   a, JINGLE_BUMP                           ;; 20:4BC2 $3E $09
    ldh  [hJingle], a                             ;; 20:4BC4 $E0 $F2
    jr   jr_020_4BCD                              ;; 20:4BC6 $18 $05

.jr_4BC8
    ld   hl, wEntitiesPosZTable                   ;; 20:4BC8 $21 $10 $C3
    add  hl, de                                   ;; 20:4BCB $19
    ld   [hl], d                                  ;; 20:4BCC $72

jr_020_4BCD:
    ld   hl, wEntitiesSpeedXTable                 ;; 20:4BCD $21 $40 $C2
    add  hl, de                                   ;; 20:4BD0 $19
    ld   [hl], d                                  ;; 20:4BD1 $72
    ld   hl, wEntitiesSpeedYTable                 ;; 20:4BD2 $21 $50 $C2
    add  hl, de                                   ;; 20:4BD5 $19
    ld   [hl], d                                  ;; 20:4BD6 $72
    ld   hl, wEntitiesSpeedZTable                 ;; 20:4BD7 $21 $20 $C3
    add  hl, de                                   ;; 20:4BDA $19
    ld   [hl], d                                  ;; 20:4BDB $72
    ldh  a, [hLinkDirection]                      ;; 20:4BDC $F0 $9E
    ld   c, a                                     ;; 20:4BDE $4F
    ld   b, d                                     ;; 20:4BDF $42
    ld   hl, Data_020_4B79                        ;; 20:4BE0 $21 $79 $4B
    add  hl, bc                                   ;; 20:4BE3 $09
    ldh  a, [hLinkPositionX]                      ;; 20:4BE4 $F0 $98
    add  [hl]                                     ;; 20:4BE6 $86
    ld   hl, wEntitiesPosXTable                   ;; 20:4BE7 $21 $00 $C2
    add  hl, de                                   ;; 20:4BEA $19
    ld   [hl], a                                  ;; 20:4BEB $77
    ld   hl, Data_020_4B7D                        ;; 20:4BEC $21 $7D $4B
    add  hl, bc                                   ;; 20:4BEF $09
    ldh  a, [hLinkPositionY]                      ;; 20:4BF0 $F0 $99
    add  [hl]                                     ;; 20:4BF2 $86
    ld   hl, wEntitiesPosYTable                   ;; 20:4BF3 $21 $10 $C2
    add  hl, de                                   ;; 20:4BF6 $19
    ld   [hl], a                                  ;; 20:4BF7 $77
    ret

Data_020_4BF9::
    db   $18, -$18

Data_020_4BFB::
    db   $00, -$18, $18, $00

func_020_4BFF::
    ld   hl, wEntitiesTransitionCountdownTable    ;; 20:4BFF $21 $E0 $C2
    add  hl, de                                   ;; 20:4C02 $19
    ld   [hl], $28                                ;; 20:4C03 $36 $28
    ld   c, $04                                   ;; 20:4C05 $0E $04
    ld   b, $00                                   ;; 20:4C07 $06 $00
    ldh  a, [hPressedButtonsMask]                 ;; 20:4C09 $F0 $CB

jr_020_4C0B:
    srl  a                                        ;; 20:4C0B $CB $3F
    jr   nc, .jr_4C10                             ;; 20:4C0D $30 $01

    inc  b                                        ;; 20:4C0F $04

.jr_4C10
    dec  c                                        ;; 20:4C10 $0D
    jr   nz, jr_020_4C0B                          ;; 20:4C11 $20 $F8

    ld   a, b                                     ;; 20:4C13 $78
    cp   $02                                      ;; 20:4C14 $FE $02
    jr   c, .ret_4C3E                             ;; 20:4C16 $38 $26

    ldh  a, [hPressedButtonsMask]                 ;; 20:4C18 $F0 $CB
    and  J_RIGHT | J_LEFT                         ;; 20:4C1A $E6 $03
    ld   c, a                                     ;; 20:4C1C $4F
    ld   b, $00                                   ;; 20:4C1D $06 $00
    ld   hl, Data_020_4BF9 - 1                    ;; 20:4C1F $21 $F8 $4B
    add  hl, bc                                   ;; 20:4C22 $09
    ld   a, [hl]                                  ;; 20:4C23 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 20:4C24 $21 $40 $C2
    add  hl, de                                   ;; 20:4C27 $19
    ld   [hl], a                                  ;; 20:4C28 $77
    ldh  a, [hPressedButtonsMask]                 ;; 20:4C29 $F0 $CB
    srl  a                                        ;; 20:4C2B $CB $3F
    srl  a                                        ;; 20:4C2D $CB $3F
    and  $03                                      ;; 20:4C2F $E6 $03
    ld   c, a                                     ;; 20:4C31 $4F
    ld   b, $00                                   ;; 20:4C32 $06 $00
    ld   hl, Data_020_4BFB                        ;; 20:4C34 $21 $FB $4B
    add  hl, bc                                   ;; 20:4C37 $09
    ld   a, [hl]                                  ;; 20:4C38 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 20:4C39 $21 $50 $C2
    add  hl, de                                   ;; 20:4C3C $19
    ld   [hl], a                                  ;; 20:4C3D $77

.ret_4C3E
    ret                                           ;; 20:4C3E $C9

; some conversion table to X direction
Data_020_4C3F::
.right: db  14
.left:  db -14
.up:    db   0
.down:  db   0

; some conversion table to Y direction
Data_020_4C43::
.right: db   0
.left:  db   0
.up:    db -12
.down:  db  12

SprinkleMagicPowder::
    ; play powder jingle
    ld   a, JINGLE_POWDER                         ;; 20:4C47 $3E $05
    ldh  [hJingle], a                             ;; 20:4C49 $E0 $F2

    ld   a, $0E | ATTACK_STEP_ITEM_ANY            ;; 20:4C4B $3E $0E
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 20:4C4D $EA $9B $C1

    ; reduce wMagicPowderCount
    ld   a, [wMagicPowderCount]                   ;; 20:4C50 $FA $4C $DB
    sub  $01                                      ;; 20:4C53 $D6 $01
    daa                                           ;; 20:4C55 $27
    ld   [wMagicPowderCount], a                   ;; 20:4C56 $EA $4C $DB
    ; if powder is left update entities positions
    jr   nz, .updateEntitiesPositions             ;; 20:4C59 $20 $12
    ; powder is empty, so empty button slot
    ld   hl, wInventoryItems.BButtonSlot          ;; 20:4C5B $21 $00 $DB
    ld   a, [hl]                                  ;; 20:4C5E $7E
    cp   INVENTORY_MAGIC_POWDER                   ;; 20:4C5F $FE $0C
    ; powder not in B slot, so check A slot
    jr   nz, .checkAButtonSlot                    ;; 20:4C61 $20 $02
    ; empty B slot
    ld   [hl], INVENTORY_EMPTY                    ;; 20:4C63 $36 $00

.checkAButtonSlot:
    ; hl = wInventoryItems.AButtonSlot
    inc  hl                                       ;; 20:4C65 $23
    ld   a, [hl]                                  ;; 20:4C66 $7E
    cp   INVENTORY_MAGIC_POWDER                   ;; 20:4C67 $FE $0C
    ; powder not in A slot, so continue
    jr   nz, .updateEntitiesPositions             ;; 20:4C69 $20 $02
    ; empty A slot
    ld   [hl], INVENTORY_EMPTY                    ;; 20:4C6B $36 $00

.updateEntitiesPositions:
    push bc                                       ;; 20:4C6D $C5
    ldh  a, [hLinkDirection]                      ;; 20:4C6E $F0 $9E
    ld   c, a                                     ;; 20:4C70 $4F
    ld   hl, Data_020_4C3F                        ;; 20:4C71 $21 $3F $4C
    add  hl, bc                                   ;; 20:4C74 $09
    ldh  a, [hLinkPositionX]                      ;; 20:4C75 $F0 $98
    add  [hl]                                     ;; 20:4C77 $86
    ld   hl, wEntitiesPosXTable                   ;; 20:4C78 $21 $00 $C2
    add  hl, de                                   ;; 20:4C7B $19
    ld   [hl], a                                  ;; 20:4C7C $77
    ld   hl, Data_020_4C43                        ;; 20:4C7D $21 $43 $4C
    add  hl, bc                                   ;; 20:4C80 $09
    ldh  a, [hLinkPositionY]                      ;; 20:4C81 $F0 $99
    add  [hl]                                     ;; 20:4C83 $86
    ld   hl, wEntitiesPosYTable                   ;; 20:4C84 $21 $10 $C2
    add  hl, de                                   ;; 20:4C87 $19
    ld   [hl], a                                  ;; 20:4C88 $77
    ldh  a, [hLinkPositionZ]                      ;; 20:4C89 $F0 $A2
    ld   hl, wEntitiesPosZTable                   ;; 20:4C8B $21 $10 $C3
    add  hl, de                                   ;; 20:4C8E $19
    ld   [hl], a                                  ;; 20:4C8F $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 20:4C90 $21 $E0 $C2
    add  hl, de                                   ;; 20:4C93 $19
    ld   [hl], $17                                ;; 20:4C94 $36 $17
    pop  bc                                       ;; 20:4C96 $C1
    ret                                           ;; 20:4C97 $C9

PlayBoomerangSfx::
    ld   a, [wC5AC]                               ;; 20:4C98 $FA $AC $C5
    and  a                                        ;; 20:4C9B $A7
    jr   nz, PlayBoomerangSfx.return              ;; 20:4C9C $20 $04

    ld   a, NOISE_SFX_BOOMERANG                   ;; 20:4C9E $3E $2D
    ldh  [hNoiseSfx], a                           ;; 20:4CA0 $E0 $F4

PlayBoomerangSfx.return::
    ret                                           ;; 20:4CA2 $C9

ResetRoomVariables::
    xor  a                                        ;; 20:4CA3 $AF
    ldh  [hFreeWarpDataAddress], a                ;; 20:4CA4 $E0 $E6
    ld   [wC19C], a                               ;; 20:4CA6 $EA $9C $C1
    ld   [wC504], a                               ;; 20:4CA9 $EA $04 $C5
    ld   [wMapEntrancePositionZ], a               ;; 20:4CAC $EA $C8 $DB
    ld   [wTorchesCount], a                       ;; 20:4CAF $EA $C9 $DB
    ld   [wC1A2], a                               ;; 20:4CB2 $EA $A2 $C1
    ld   [wC1C6], a                               ;; 20:4CB5 $EA $C6 $C1
    ld   [wRoomSwitchableObject], a               ;; 20:4CB8 $EA $FA $D6
    ld   [wBlockItemUsage], a                     ;; 20:4CBB $EA $0A $C5
    ldh  [hStaircase], a                          ;; 20:4CBE $E0 $AC
    ld   [wEnemyWasKilled], a                     ;; 20:4CC0 $EA $13 $C1
    ld   [wD460], a                               ;; 20:4CC3 $EA $60 $D4
    ld   [wInBossBattle], a                       ;; 20:4CC6 $EA $BE $C1
    ld   [wC50E], a                               ;; 20:4CC9 $EA $0E $C5
    ld   [wIsMarinSinging], a                     ;; 20:4CCC $EA $C8 $C3
    ld   [wC5A6], a                               ;; 20:4CCF $EA $A6 $C5
    ld   [wCompassSfxCountdown], a                ;; 20:4CD2 $EA $62 $D4
    ld   [wC3CD], a                               ;; 20:4CD5 $EA $CD $C3
    ld   [wColorDungonCorrectTombStones], a       ;; 20:4CD8 $EA $D9 $DD
    ld   a, $FF                                   ;; 20:4CDB $3E $FF
    ld   [wWarpStructs], a                        ;; 20:4CDD $EA $01 $D4
    ld   [wMarinEntityIndex], a                   ;; 20:4CE0 $EA $0F $C5
    ret                                           ;; 20:4CE3 $C9

;
; Title screen GFX coordinates
;

Data_020_4CE4::
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4CE4
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4CEC
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4CF4
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4CFC
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4D04
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4D0C
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4D14
    db   $00, $00, $00, $00, $00, $00, $00, $00   ;; 20:4D1C

Data_020_4D24::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ;; 20:4D24
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ;; 20:4D2C
    db   $E0, $E0, $E0, $E0, $E0, $E2, $E5, $E8   ;; 20:4D34
    db   $EB, $EE, $F1, $F4, $F7, $FA, $FD, $00   ;; 20:4D3C
    db   $03, $06, $09, $0C, $0F, $12, $15, $18   ;; 20:4D44
    db   $1B, $1E, $21, $24, $27, $2A, $2D, $30   ;; 20:4D4C
    db   $33, $36, $39, $3C, $3F, $42, $45, $48   ;; 20:4D54
    db   $33, $36, $39, $3C, $3F, $42, $45, $48   ;; 20:4D5C

Data_020_4D64::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ;; 20:4D64
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $E0   ;; 20:4D6C
    db   $E2, $E4, $E6, $E8, $EA, $EC, $EE, $F0   ;; 20:4D74
    db   $F2, $F4, $F6, $F8, $FA, $FC, $FE, $00   ;; 20:4D7C
    db   $02, $04, $06, $08, $0A, $0C, $0E, $10   ;; 20:4D84
    db   $12, $14, $16, $18, $1A, $1C, $1D, $1E   ;; 20:4D8C
    db   $20, $22, $24, $26, $28, $2A, $2C, $2E   ;; 20:4D94
    db   $20, $22, $24, $26, $28, $2A, $2C, $2E   ;; 20:4D9C

Data_020_4DA4::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ;; 20:4DA4
    db   $F0, $DF, $E0, $E2, $E3, $E5, $E6, $E8   ;; 20:4DAC
    db   $E9, $EB, $EC, $EE, $EF, $F1, $F2, $F4   ;; 20:4DB4
    db   $F5, $F7, $F8, $FA, $FB, $FD, $FE, $00   ;; 20:4DBC
    db   $01, $03, $04, $06, $07, $09, $0A, $0C   ;; 20:4DC4
    db   $0D, $0F, $10, $12, $13, $15, $16, $18   ;; 20:4DCC
    db   $19, $1B, $1C, $1E, $1F, $21, $22, $24   ;; 20:4DD4
    db   $19, $1B, $1C, $1E, $1F, $21, $22, $24   ;; 20:4DDC
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ;; 20:4DE4
    db   $F0, $F0, $E2, $E3, $E5, $E6, $E8, $E9   ;; 20:4DEC
    db   $EB, $EC, $EE, $F0, $F2, $F3, $F6, $F7   ;; 20:4DF4
    db   $F8, $F9, $FA, $FC, $FD, $FE, $FF, $00   ;; 20:4DFC
    db   $01, $03, $04, $06, $07, $09, $0A, $0C   ;; 20:4E04
    db   $0D, $0F, $10, $12, $13, $15, $16, $18   ;; 20:4E0C
    db   $19, $1B, $1C, $1E, $1F, $21, $22, $22   ;; 20:4E14
    db   $24, $25, $27, $29, $2B, $2C, $2E, $2F   ;; 20:4E1C

Data_020_4E24::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ;; 20:4E24
    db   $E1, $E2, $E4, $E5, $E6, $E8, $E9, $EA   ;; 20:4E2C
    db   $EC, $ED, $EE, $F0, $F1, $F2, $F4, $F5   ;; 20:4E34
    db   $F6, $F8, $F9, $FA, $FC, $FE, $FF, $00   ;; 20:4E3C
    db   $01, $02, $04, $05, $06, $08, $09, $0A   ;; 20:4E44
    db   $0C, $0D, $0E, $10, $11, $12, $14, $15   ;; 20:4E4C
    db   $16, $18, $19, $1A, $1C, $1D, $1E, $20   ;; 20:4E54
    db   $22, $23, $24, $25, $27, $28, $2A, $2B   ;; 20:4E5C
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $E2   ;; 20:4E64
    db   $E3, $E4, $E5, $E6, $E8, $E9, $EA, $EC   ;; 20:4E6C
    db   $ED, $EE, $EF, $F1, $F2, $F3, $F5, $F6   ;; 20:4E74
    db   $F8, $F9, $FA, $FB, $FD, $FE, $FF, $00   ;; 20:4E7C
    db   $01, $02, $03, $05, $06, $07, $08, $0A   ;; 20:4E84
    db   $0B, $0C, $0D, $0F, $10, $11, $12, $14   ;; 20:4E8C
    db   $15, $16, $17, $19, $1A, $1B, $1D, $1E   ;; 20:4E94
    db   $20, $21, $22, $23, $25, $26, $27, $28   ;; 20:4E9C

Data_020_4EA4::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $E3, $E4   ;; 20:4EA4
    db   $E5, $E6, $E7, $E8, $E9, $EB, $EC, $ED   ;; 20:4EAC
    db   $EE, $F0, $F1, $F2, $F3, $F4, $F6, $F7   ;; 20:4EB4
    db   $F8, $F9, $FB, $FC, $FD, $FE, $FF, $00   ;; 20:4EBC
    db   $01, $02, $03, $04, $06, $07, $08, $09   ;; 20:4EC4
    db   $0A, $0B, $0C, $0E, $10, $11, $12, $13   ;; 20:4ECC
    db   $14, $15, $16, $18, $19, $1A, $1B, $1C   ;; 20:4ED4
    db   $1D, $1F, $20, $21, $22, $23, $24, $25   ;; 20:4EDC

Data_020_4EE4::
    db   $F0, $F0, $F0, $F0, $F0, $E4, $E5, $E6   ;; 20:4EE4
    db   $E7, $E8, $E9, $EA, $EB, $EC, $EE, $EF   ;; 20:4EEC
    db   $F0, $F1, $F2, $F3, $F4, $F5, $F6, $F8   ;; 20:4EF4
    db   $F9, $FA, $FB, $FC, $FD, $FE, $FF, $00   ;; 20:4EFC
    db   $01, $02, $03, $04, $05, $06, $07, $08   ;; 20:4F04
    db   $09, $0A, $0C, $0D, $0E, $0F, $10, $11   ;; 20:4F0C
    db   $12, $13, $15, $16, $17, $18, $19, $1A   ;; 20:4F14
    db   $1B, $1C, $1D, $1E, $1F, $21, $22, $23   ;; 20:4F1C
    db   $F0, $F0, $F0, $F0, $E5, $E6, $E7, $E8   ;; 20:4F24
    db   $E9, $EA, $EB, $EC, $ED, $EE, $EF, $F0   ;; 20:4F2C
    db   $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8   ;; 20:4F34
    db   $F9, $FA, $FB, $FC, $FD, $FE, $FF, $00   ;; 20:4F3C
    db   $01, $02, $03, $04, $05, $06, $07, $08   ;; 20:4F44
    db   $09, $0A, $0B, $0C, $0D, $0E, $0F, $10   ;; 20:4F4C
    db   $11, $12, $13, $14, $15, $16, $17, $18   ;; 20:4F54
    db   $19, $1A, $1B, $1C, $1D, $1E, $1F, $20   ;; 20:4F5C

Data_020_4F64::
    db   $F0, $F0, $F0, $E6, $E7, $E8, $E8, $E9   ;; 20:4F64
    db   $EA, $EB, $EC, $ED, $EE, $EF, $F0, $F0   ;; 20:4F6C
    db   $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8   ;; 20:4F74
    db   $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF   ;; 20:4F7C
    db   $00, $01, $02, $03, $04, $05, $06, $07   ;; 20:4F84
    db   $07, $08, $09, $0A, $0B, $0C, $0D, $0E   ;; 20:4F8C
    db   $0F, $10, $11, $12, $13, $14, $15, $16   ;; 20:4F94
    db   $17, $18, $19, $1A, $1A, $1B, $1C, $1D   ;; 20:4F9C

Data_020_4FA4::
    db   $F0, $F0, $E7, $E8, $E9, $EA, $EB, $EC   ;; 20:4FA4
    db   $EC, $EC, $ED, $EE, $EF, $F0, $F1, $F2   ;; 20:4FAC
    db   $F2, $F3, $F4, $F5, $F6, $F7, $F7, $F8   ;; 20:4FB4
    db   $F9, $FA, $FB, $FC, $FC, $FD, $FE, $FF   ;; 20:4FBC
    db   $00, $01, $02, $03, $04, $04, $05, $06   ;; 20:4FC4
    db   $07, $08, $09, $09, $0A, $0B, $0C, $0D   ;; 20:4FCC
    db   $0E, $0E, $0F, $10, $11, $12, $13, $14   ;; 20:4FD4
    db   $15, $16, $16, $17, $18, $19, $1A, $1B   ;; 20:4FDC

Data_020_4FE4::
    db   $F0, $E9, $E9, $EA, $EB, $EB, $EC, $ED   ;; 20:4FE4
    db   $EE, $EE, $EF, $F0, $F0, $F1, $F2, $F3   ;; 20:4FEC
    db   $F4, $F4, $F5, $F6, $F7, $F8, $F8, $F9   ;; 20:4FF4
    db   $FA, $FB, $FC, $FC, $FD, $FE, $FF, $00   ;; 20:4FFC
    db   $00, $01, $02, $03, $03, $04, $05, $06   ;; 20:5004
    db   $06, $07, $08, $09, $0A, $0A, $0B, $0C   ;; 20:500C
    db   $0C, $0D, $0E, $0E, $10, $11, $12, $12   ;; 20:5014
    db   $13, $14, $15, $15, $16, $17, $18, $18   ;; 20:501C
    db   $EB, $EC, $EC, $ED, $EE, $EE, $EF, $F0   ;; 20:5024
    db   $F0, $F1, $F2, $F2, $F3, $F4, $F4, $F5   ;; 20:502C
    db   $F6, $F6, $F7, $F8, $F8, $F9, $FA, $FA   ;; 20:5034
    db   $FB, $FC, $FC, $FD                       ;; 20:503C
    db   $FE, $FE, $FF, $00, $00, $01, $02, $02, $03, $04, $04, $05, $06, $06, $07, $08
    db   $08, $09, $0A, $0A, $0B, $0C, $0C, $0D, $0E, $0E, $0F, $10, $10, $11, $12, $12
    db   $13, $14, $14, $15

Data_020_5064::
    db   $ED, $EE, $EE, $EF, $F0, $F0, $F1, $F1, $F2, $F2, $F3, $F3
    db   $F3, $F4, $F5, $F5, $F6, $F6, $F7, $F8, $F8, $F9, $F9, $FA, $FB, $FB, $FC, $FC
    db   $FE, $FF, $FF, $00, $00, $01, $01, $02, $03, $03, $04, $04, $05, $06, $06, $07
    db   $07, $08, $09, $09, $0A, $0A, $0B, $0C, $0C, $0D, $0D, $0E, $0F, $0F, $10, $10
    db   $11, $12, $12, $13

Data_020_50A4::
    db   $F0, $F1, $F1, $F2, $F2, $F3, $F3, $F4, $F4, $F5, $F5, $F6
    db   $F6, $F7, $F7, $F8, $F8, $F9, $F9, $FA, $FA, $FB, $FB, $FC, $FC, $FD, $FD, $FE
    db   $FE, $FF, $FF, $00, $00, $01, $01, $02, $02, $03, $03, $04, $04, $05, $05, $06
    db   $06, $07, $07, $08, $08, $09, $09, $0A, $0A, $0B, $0B, $0C, $0C, $0D, $0D, $0E
    db   $0E, $0F, $0F, $10

Data_020_50E4::
    db   $F3, $F4, $F4, $F4, $F5, $F5, $F6, $F6, $F6, $F7, $F7, $F8
    db   $F8, $F8, $F9, $F9, $FA, $FA, $FA, $FB, $FB, $FC, $FC, $FC, $FD, $FD, $FE, $FE
    db   $FF, $FF, $00, $00, $00, $01, $01, $02, $02, $03, $03, $03, $04, $04, $05, $05
    db   $05, $06, $06, $07, $07, $07, $08, $08, $09, $09, $09, $0A, $0A, $0B, $0B, $0B
    db   $0C, $0C, $0D, $0D

Data_020_5124::
    db   $F5, $F6, $F6, $F6, $F7, $F7, $F7, $F8, $F8, $F8, $F9, $F9
    db   $F9, $FA, $FA, $FA, $FB, $FB, $FB, $FC, $FC, $FC, $FD, $FD, $FD, $FE, $FE, $FE
    db   $FF, $FF, $FF, $00, $00, $01, $01, $01, $02, $02, $02, $03, $03, $03, $04, $04
    db   $04, $05, $05, $05, $06, $06, $06, $07, $07, $07, $08, $08, $08, $09, $09, $09
    db   $0A, $0A, $0A, $0B

Data_020_5164::
    db   $FC, $FC, $FB, $FB, $FB, $FB, $FA, $FA, $FA, $FA, $FB, $FB
    db   $FB, $FB, $FC, $FC, $FC, $FC, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FF, $FF
    db   $FF, $FF, $00, $00, $00, $00, $01, $01, $01, $01, $02, $02, $02, $02, $03, $03
    db   $03, $03, $04, $04, $04, $04, $05, $05, $05, $05, $06, $06, $06, $06, $07, $07
    db   $07, $07, $08, $08

Data_020_51A4::
    db   $FB, $FB, $FB, $FB, $FB, $FC, $FC, $FC, $FC, $FC, $FC, $FD
    db   $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02
    db   $02, $02, $03, $03, $03, $03, $03, $03, $04, $04, $04, $04, $04, $04, $05, $05
    db   $05, $05, $05, $05

Data_020_51E4::
    db   $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE
    db   $FE, $FE, $FE, $FE, $FE, $FE, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01
    db   $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03
    db   $03, $03, $03, $03

data_020_5224::
    dw   Data_020_4D24
    dw   Data_020_4D64
    dw   Data_020_4DA4
    dw   Data_020_4E24
    dw   Data_020_4EA4
    dw   Data_020_4EE4
    dw   Data_020_4F64
    dw   Data_020_4FA4
    dw   Data_020_4FE4
    dw   Data_020_5064
    dw   Data_020_50A4
    dw   Data_020_50E4
    dw   Data_020_5124
    dw   Data_020_5164
    dw   Data_020_51A4
    dw   Data_020_51E4
    dw   Data_020_4CE4

; Position sprites for the title screen (?)
; Maybe also controls the apparition effect of
; the title.
data_020_5246::
    db   $28, $2A, $2C, $2C, $2E, $2E, $30, $30, $31, $33, $33, $34, $35, $36, $38, $3A
    db   $3A

PositionTitleScreenSprites::
    ; If not on the intro title, return
    ld   a, [wGameplaySubtype]                    ;; 20:5257 $FA $96 $DB
    cp   GAMEPLAY_INTRO_TITLE - 1                 ;; 20:525A $FE $0A
    ret  nc                                       ;; 20:525C $D0

    ld   hl, wC17C                                ;; 20:525D $21 $7C $C1
    xor  a                                        ;; 20:5260 $AF
    ld   [hl+], a                                 ;; 20:5261 $22
    ld   [hl+], a                                 ;; 20:5262 $22
    ld   d, $00                                   ;; 20:5263 $16 $00
    ldh  a, [hFrameCounter]                       ;; 20:5265 $F0 $E7
    and  $01                                      ;; 20:5267 $E6 $01
    jr   nz, jr_020_527C                          ;; 20:5269 $20 $11

    ld   a, [wC17E]                               ;; 20:526B $FA $7E $C1
    inc  a                                        ;; 20:526E $3C
    cp   $10                                      ;; 20:526F $FE $10
    jr   c, .jr_5279                              ;; 20:5271 $38 $06

    ld   a, $10                                   ;; 20:5273 $3E $10
    ld   [wC17E], a                               ;; 20:5275 $EA $7E $C1
    ret                                           ;; 20:5278 $C9

.jr_5279
    ld   [wC17E], a                               ;; 20:5279 $EA $7E $C1

jr_020_527C:
    ld   a, [wC17E]                               ;; 20:527C $FA $7E $C1
    ld   e, a                                     ;; 20:527F $5F
    ld   hl, data_020_5246                        ;; 20:5280 $21 $46 $52
    add  hl, de                                   ;; 20:5283 $19
    ld   a, [hl]                                  ;; 20:5284 $7E
    ldh  [hMultiPurpose0], a                      ;; 20:5285 $E0 $D7
    sla  e                                        ;; 20:5287 $CB $23
    ld   hl, data_020_5224                        ;; 20:5289 $21 $24 $52
    add  hl, de                                   ;; 20:528C $19
    ld   a, [hl+]                                 ;; 20:528D $2A
    ld   b, [hl]                                  ;; 20:528E $46
    ld   c, a                                     ;; 20:528F $4F

.loop_5290
    ldh  a, [rLY]                                 ;; 20:5290 $F0 $44
    cp   $10                                      ;; 20:5292 $FE $10
    jr   nz, .loop_5290                           ;; 20:5294 $20 $FA

jr_020_5296:
    ldh  a, [rSTAT]                               ;; 20:5296 $F0 $41
    and  STATF_LCD                                ;; 20:5298 $E6 $03
    jr   nz, jr_020_5296                          ;; 20:529A $20 $FA

    ld   hl, hMultiPurpose1                       ;; 20:529C $21 $D8 $FF
    ld   [hl], $01                                ;; 20:529F $36 $01
    ldh  a, [hIsGBC]                              ;; 20:52A1 $F0 $FE
    and  a                                        ;; 20:52A3 $A7
    jr   z, .loop_52A8                            ;; 20:52A4 $28 $02

    ld   [hl], $03                                ;; 20:52A6 $36 $03

.loop_52A8
    ld   a, [wC17D]                               ;; 20:52A8 $FA $7D $C1
    inc  a                                        ;; 20:52AB $3C
    ld   [wC17D], a                               ;; 20:52AC $EA $7D $C1
    and  [hl]                                     ;; 20:52AF $A6
    jr   nz, .loop_52A8                           ;; 20:52B0 $20 $F6

    ldh  a, [hMultiPurpose0]                      ;; 20:52B2 $F0 $D7
    ld   l, a                                     ;; 20:52B4 $6F
    ld   a, [wC17C]                               ;; 20:52B5 $FA $7C $C1
    ld   e, a                                     ;; 20:52B8 $5F
    inc  a                                        ;; 20:52B9 $3C
    ld   [wC17C], a                               ;; 20:52BA $EA $7C $C1
    cp   $3A                                      ;; 20:52BD $FE $3A
    jr   z, jr_020_52DC                           ;; 20:52BF $28 $1B

    cp   l                                        ;; 20:52C1 $BD
    jr   c, .jr_52CE                              ;; 20:52C2 $38 $0A

    ldh  a, [hIsGBC]                              ;; 20:52C4 $F0 $FE
    and  a                                        ;; 20:52C6 $A7
    jr   nz, jr_020_52DC                          ;; 20:52C7 $20 $13

    xor  a                                        ;; 20:52C9 $AF
    ldh  [rBGP], a                                ;; 20:52CA $E0 $47
    jr   jr_020_5296                              ;; 20:52CC $18 $C8

.jr_52CE
    ld   hl, $0000                                ;; 20:52CE $21 $00 $00
    add  hl, de                                   ;; 20:52D1 $19
    add  hl, bc                                   ;; 20:52D2 $09
    ld   a, [hl]                                  ;; 20:52D3 $7E
    ld   hl, hBaseScrollY                         ;; 20:52D4 $21 $97 $FF
    add  [hl]                                     ;; 20:52D7 $86
    ldh  [rSCY], a                                ;; 20:52D8 $E0 $42
    jr   jr_020_5296                              ;; 20:52DA $18 $BA

jr_020_52DC:
    ldh  a, [hBaseScrollY]                        ;; 20:52DC $F0 $97
    sub  $38                                      ;; 20:52DE $D6 $38
    ldh  [rSCY], a                                ;; 20:52E0 $E0 $42

.loop_52E2
    ldh  a, [rLY]                                 ;; 20:52E2 $F0 $44
    cp   $48                                      ;; 20:52E4 $FE $48
    jr   c, .loop_52E2                            ;; 20:52E6 $38 $FA

.loop_52E8
    ldh  a, [rSTAT]                               ;; 20:52E8 $F0 $41
    and  STATF_LCD                                ;; 20:52EA $E6 $03
    jr   nz, .loop_52E8                           ;; 20:52EC $20 $FA

    ldh  a, [hBaseScrollY]                        ;; 20:52EE $F0 $97
    ldh  [rSCY], a                                ;; 20:52F0 $E0 $42
    ld   a, [wBGPalette]                          ;; 20:52F2 $FA $97 $DB
    ldh  [rBGP], a                                ;; 20:52F5 $E0 $47
    ret                                           ;; 20:52F7 $C9

; Unused data
Data_020_52F8::
    db   $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F

; Fill a palette with white?
; (dead code)
func_020_5308::
    ld   a, $98                                   ;; 20:5308 $3E $98
    ldh  [rBCPS], a                               ;; 20:530A $E0 $68
    ld   hl, rBGPD                                ;; 20:530C $21 $69 $FF
    ld   b, $08                                   ;; 20:530F $06 $08

.loop
    ld   [hl], $FF                                ;; 20:5311 $36 $FF
    ld   [hl], $7F                                ;; 20:5313 $36 $7F
    dec  b                                        ;; 20:5315 $05
    jr   nz, .loop                                ;; 20:5316 $20 $F9

    ret                                           ;; 20:5318 $C9

LinkAnimationStateTable::
    db   $00, $02
    db   $02, $00
    db   $10, $02
    db   $12, $00
    db   $04, $06
    db   $06, $04
    db   $08, $0A
    db   $0C, $0E
    db   $18, $0A
    db   $1C, $0E
    db   $0A, $08
    db   $0E, $0C
    db   $0A, $18
    db   $0E, $1C
    db   $20, $22
    db   $24, $26
    db   $28, $2A
    db   $2A, $28
    db   $30, $32
    db   $20, $22
    db   $34, $36
    db   $24, $26
    db   $38, $3A
    db   $28, $2A
    db   $3A, $38
    db   $2A, $28
    db   $40, $40
    db   $42, $42
    db   $44, $46
    db   $48, $4A
    db   $4C, $4E
    db   $50, $52
    db   $4E, $4C
    db   $52, $50
    db   $80, $02
    db   $82, $00
    db   $84, $86
    db   $88, $8A
    db   $8C, $8E
    db   $90, $92
    db   $94, $96
    db   $98, $9A
    db   $9C, $9E
    db   $9A, $A2
    db   $A4, $08
    db   $A6, $0C
    db   $A8, $AA
    db   $AC, $AE
    db   $B0, $B2
    db   $B4, $B6
    db   $B0, $B2
    db   $B4, $B6
    db   $04, $C0
    db   $06, $C2
    db   $5A, $58
    db   $5E, $5C
    db   $58, $5A
    db   $5C, $5E
    db   $44, $46
    db   $6E, $6E
    db   $40, $40
    db   $56, $56
    db   $7A, $78
    db   $7E, $7C
    db   $78, $7A
    db   $7C, $7E
    db   $74, $76
    db   $76, $74
    db   $70, $72
    db   $72, $70
    db   $CA, $C8
    db   $D6, $D4
    db   $C8, $CA
    db   $D4, $D6
    db   $CC, $CE
    db   $D8, $DA
    db   $C4, $C4
    db   $C6, $C6
    db   $DC, $DC
    db   $DE, $DE
    db   $EA, $EC
    db   $EE, $F0
    db   $F2, $F4
    db   $F6, $F6
    db   $F8, $FA
    db   $E0, $E2
    db   $E4, $E6
    db   $E8, $E8
    db   $10, $12
    db   $14, $16
    db   $18, $1C
    db   $12, $10
    db   $16, $14
    db   $1C, $18
    db   $66, $68
    db   $6A, $6C
    db   $68, $66
    db   $68, $66
    db   $6C, $6A
    db   $66, $68
    db   $60, $60
    db   $62, $62
    db   $64, $64
    db   $62, $62
    db   $64, $64
    db   $60, $60
    db   $54, $54
    db   $3C, $3E
    db   $FE, $FE
    db   $18, $1A
    db   $1C, $1E
    db   $2C, $2E
    db   $B8, $BA
    db   $2E, $2C
    db   $BA, $B8
    db   $BC, $BE
    db   $D0, $D2
    db   $A0, $FC
    db   $FC, $A0

data_020_5407::
; Called from SkipTilesGroupAnimation
    db   $00, $00, $20, $20, $00, $00, $00, $20, $00, $00, $20, $20, $00, $00, $00, $00
    db   $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $00, $00
    db   $00, $00, $20, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $20, $20, $20, $20, $00, $20, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00
    db   $20, $20, $20, $20, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $20, $00, $00, $20, $00, $20, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $20, $20, $20, $20
    db   $00, $00, $00, $00, $00, $00, $00, $20, $00, $20, $00, $20, $20, $20, $20, $20
    db   $00, $00, $00, $00, $00, $00, $20, $20, $00, $00, $20, $20, $20, $20, $20, $20
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $20, $00, $20, $00, $20
    db   $00, $00, $00, $00, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $20
    db   $00, $00, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $00, $00, $00, $00
    db   $60, $60, $20, $20, $20, $20, $40, $40, $00, $20, $00, $20, $00, $20, $40, $60
    db   $40, $60, $40, $60, $00, $20, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00
    db   $00, $00, $20, $20, $20, $20, $00, $00, $00, $00, $00, $00, $20, $20

func_020_54F5::
    ldh  a, [hLinkAnimationState]                 ;; 20:54F5 $F0 $9D
    cp   LINK_ANIMATION_STATE_HIDDEN              ;; 20:54F7 $FE $FF
    ret  z                                        ;; 20:54F9 $C8

    ; Read the first byte in LinkAnimationStateTable
    ld   hl, LinkAnimationStateTable              ;; 20:54FA $21 $19 $53
    sla  a                                        ;; 20:54FD $CB $27
    ld   c, a                                     ;; 20:54FF $4F
    ld   b, $00                                   ;; 20:5500 $06 $00
    add  hl, bc                                   ;; 20:5502 $09
    ld   e, [hl]                                  ;; 20:5503 $5E
    push hl                                       ;; 20:5504 $E5

    ld   hl, data_020_5407                        ;; 20:5505 $21 $07 $54
    add  hl, bc                                   ;; 20:5508 $09
    ld   a, [wC11D]                               ;; 20:5509 $FA $1D $C1
    and  $98                                      ;; 20:550C $E6 $98
    or   [hl]                                     ;; 20:550E $B6
    ld   [wC11D], a                               ;; 20:550F $EA $1D $C1
    inc  hl                                       ;; 20:5512 $23
    ld   a, [wC11E]                               ;; 20:5513 $FA $1E $C1
    and  $98                                      ;; 20:5516 $E6 $98
    or   [hl]                                     ;; 20:5518 $B6
    ld   [wC11E], a                               ;; 20:5519 $EA $1E $C1
    ld   d, $00                                   ;; 20:551C $16 $00
    sla  e                                        ;; 20:551E $CB $23
    rl   d                                        ;; 20:5520 $CB $12
    sla  e                                        ;; 20:5522 $CB $23
    rl   d                                        ;; 20:5524 $CB $12
    sla  e                                        ;; 20:5526 $CB $23
    rl   d                                        ;; 20:5528 $CB $12
    sla  e                                        ;; 20:552A $CB $23
    rl   d                                        ;; 20:552C $CB $12
    ld   hl, LinkCharacter2Tiles                  ;; 20:552E $21 $00 $58
    add  hl, de                                   ;; 20:5531 $19
    ld   c, l                                     ;; 20:5532 $4D
    ld   b, h                                     ;; 20:5533 $44
    ld   hl, vTiles0                              ;; 20:5534 $21 $00 $80
    ld   d, $20                                   ;; 20:5537 $16 $20
    call CopyLinkTilesPair                        ;; 20:5539 $CD $0A $1D

    ; hl = LinkAnimationStateTable + hLinkAnimationState
    pop  hl                                       ;; 20:553C $E1
    ; Read the 2nd byte from the table
    inc  hl                                       ;; 20:553D $23
    ld   e, [hl]                                  ;; 20:553E $5E
    ld   d, $00                                   ;; 20:553F $16 $00
    sla  e                                        ;; 20:5541 $CB $23
    rl   d                                        ;; 20:5543 $CB $12
    sla  e                                        ;; 20:5545 $CB $23
    rl   d                                        ;; 20:5547 $CB $12
    sla  e                                        ;; 20:5549 $CB $23
    rl   d                                        ;; 20:554B $CB $12
    sla  e                                        ;; 20:554D $CB $23
    rl   d                                        ;; 20:554F $CB $12
    ld   hl, LinkCharacter2Tiles                  ;; 20:5551 $21 $00 $58
    add  hl, de                                   ;; 20:5554 $19
    ld   c, l                                     ;; 20:5555 $4D
    ld   b, h                                     ;; 20:5556 $44
    ld   hl, vTiles0 + $20                        ;; 20:5557 $21 $20 $80
    ld   d, $20                                   ;; 20:555A $16 $20
    call CopyLinkTilesPair                        ;; 20:555C $CD $0A $1D
    ret                                           ;; 20:555F $C9

; amount of BG tiles to be updated for next row / column
RegionUpdateTileAmount::
.right:  db TILES_PER_COLUMN - 1
.left:   db TILES_PER_COLUMN - 1
.up:     db TILES_PER_ROW
.down:   db TILES_PER_ROW

; I am not absolute sure about that, but it is used as an offset
TransitionOffsetTable::
.right:  db $01
.left:   db $FF
.up:     db $F0
.down:   db $10

RegionOriginHighOffset::
.right:  db $00
.left:   db $00
.up:     db $03
.down:   db $00

RegionOriginLowOffset::
.right:  db $01
.left:   db $1F
.up:     db $E0
.down:   db $20

; Set next BG region origin, and decrement wRoomTransitionFramesBeforeMidScreen
UpdateBGRegionOrigin::
    ; a = c = wRoomTransitionDirection
    ; b = $00
    ; e = $FF
    ld   e, $FF                                   ;; 20:5570 $1E $FF
    ld   a, [wRoomTransitionDirection]            ;; 20:5572 $FA $25 $C1
    ld   c, a                                     ;; 20:5575 $4F
    ld   b, $00                                   ;; 20:5576 $06 $00
    ; if direction is up or down do not override e
    and  DIRECTION_VERTICAL_MASK                  ;; 20:5578 $E6 $02
    jr   nz, .updateTileAmount                    ;; 20:557A $20 $02
    ld   e, $DF                                   ;; 20:557C $1E $DF

.updateTileAmount:
    ld   hl, RegionUpdateTileAmount               ;; 20:557E $21 $60 $55
    ; offset by direction
    add  hl, bc                                   ;; 20:5581 $09
    ld   a, [hl]                                  ;; 20:5582 $7E
    ld   [wBGUpdateRegionTilesCount], a           ;; 20:5583 $EA $28 $C1
    ld   a, [wRoomTransitionFramesBeforeMidScreen] ;; 20:5586 $FA $29 $C1
    ; if uneven frame skip transition offset addition
    and  $01                                      ;; 20:5589 $E6 $01
    jr   z, .skipOffsetAddition                   ;; 20:558B $28 $0B

    ld   hl, TransitionOffsetTable                ;; 20:558D $21 $64 $55
    add  hl, bc                                   ;; 20:5590 $09
    ld   a, [wTransitionOffset]                   ;; 20:5591 $FA $2A $C1
    add  [hl]                                     ;; 20:5594 $86
    ld   [wTransitionOffset], a                   ;; 20:5595 $EA $2A $C1

.skipOffsetAddition:
    ; add offset to wBGUpdateRegionOriginLow
    ld   hl, RegionOriginLowOffset                ;; 20:5598 $21 $6C $55
    add  hl, bc                                   ;; 20:559B $09
    ld   a, [wBGUpdateRegionOriginLow]            ;; 20:559C $FA $27 $C1
    add  [hl]                                     ;; 20:559F $86
    rr   d                                        ;; 20:55A0 $CB $1A
    and  e                                        ;; 20:55A2 $A3
    ld   [wBGUpdateRegionOriginLow], a            ;; 20:55A3 $EA $27 $C1
    ; add offset to wBGUpdateRegionOriginHigh
    ld   hl, RegionOriginHighOffset               ;; 20:55A6 $21 $68 $55
    add  hl, bc                                   ;; 20:55A9 $09
    ld   a, [wBGUpdateRegionOriginHigh]           ;; 20:55AA $FA $26 $C1
    rl   d                                        ;; 20:55AD $CB $12
    adc  [hl]                                     ;; 20:55AF $8E
    and  $03                                      ;; 20:55B0 $E6 $03
    ld   [wBGUpdateRegionOriginHigh], a           ;; 20:55B2 $EA $26 $C1
    ; decrement wRoomTransitionFramesBeforeMidScreen
    ld   a, [wRoomTransitionFramesBeforeMidScreen] ;; 20:55B5 $FA $29 $C1
    dec  a                                        ;; 20:55B8 $3D
    ld   [wRoomTransitionFramesBeforeMidScreen], a ;; 20:55B9 $EA $29 $C1
    ; could be improved with:
    ;   jr z, .incrementRoomTransitionState
    ;   ret
    ;   .incrementRoomTransitionState
    jr   nz, .return                              ;; 20:55BC $20 $03
    jp   .incrementRoomTransitionState            ;; 20:55BE $C3 $C2 $55

.return:
    ret                                           ;; 20:55C1 $C9

.incrementRoomTransitionState:
    ld   a, [wRoomTransitionState]                ;; 20:55C2 $FA $24 $C1
    inc  a                                        ;; 20:55C5 $3C
    ld   [wRoomTransitionState], a                ;; 20:55C6 $EA $24 $C1
    ret                                           ;; 20:55C9 $C9

FadeOutMusic::
    ldh  a, [hMusicFadeOutTimer]                  ;; 20:55CA $F0 $A8
    and  a                                        ;; 20:55CC $A7
    jr   z, .jr_55F0                              ;; 20:55CD $28 $21

    ld   a, [wTransitionSequenceCounter]          ;; 20:55CF $FA $6B $C1
    cp   $03                                      ;; 20:55D2 $FE $03
    jr   nz, .jr_55F0                             ;; 20:55D4 $20 $1A

    ld   a, [wC16C]                               ;; 20:55D6 $FA $6C $C1
    and  $03                                      ;; 20:55D9 $E6 $03
    cp   $03                                      ;; 20:55DB $FE $03
    jr   nz, .jr_55F0                             ;; 20:55DD $20 $11

    ld   hl, hVolumeRight                         ;; 20:55DF $21 $A9 $FF
    ld   a, [hl]                                  ;; 20:55E2 $7E
    inc  hl                                       ;; 20:55E3 $23
    or   [hl]                                     ;; 20:55E4 $B6
    jr   z, .jr_55F0                              ;; 20:55E5 $28 $09

    ldh  a, [hMusicFadeOutTimer]                  ;; 20:55E7 $F0 $A8
    and  $FC                                      ;; 20:55E9 $E6 $FC
    or   $01                                      ;; 20:55EB $F6 $01
    ldh  [hMusicFadeOutTimer], a                  ;; 20:55ED $E0 $A8
    ret                                           ;; 20:55EF $C9

.jr_55F0
    ld   hl, wC16C                                ;; 20:55F0 $21 $6C $C1
    inc  [hl]                                     ;; 20:55F3 $34
    ld   a, [hl]                                  ;; 20:55F4 $7E
    and  $03                                      ;; 20:55F5 $E6 $03
    jr   nz, ret_020_562E                         ;; 20:55F7 $20 $35

    ld   hl, wTransitionSequenceCounter           ;; 20:55F9 $21 $6B $C1
    ld   a, [hl]                                  ;; 20:55FC $7E
    cp   $04                                      ;; 20:55FD $FE $04
    jr   z, ret_020_562E                          ;; 20:55FF $28 $2D

    inc  [hl]                                     ;; 20:5601 $34
    xor  a                                        ;; 20:5602 $AF
    ldh  [hMultiPurpose0], a                      ;; 20:5603 $E0 $D7

jr_020_5605:
    ldh  a, [hMultiPurpose0]                      ;; 20:5605 $F0 $D7
    cp   $03                                      ;; 20:5607 $FE $03
    jr   z, ret_020_562E                          ;; 20:5609 $28 $23

    ld   hl, wBGPalette                           ;; 20:560B $21 $97 $DB
    ld   e, a                                     ;; 20:560E $5F
    ld   d, $00                                   ;; 20:560F $16 $00
    add  hl, de                                   ;; 20:5611 $19
    ld   a, [hl]                                  ;; 20:5612 $7E
    ld   c, a                                     ;; 20:5613 $4F
    ld   b, $00                                   ;; 20:5614 $06 $00

jr_020_5616:
    ld   a, c                                     ;; 20:5616 $79
    and  $03                                      ;; 20:5617 $E6 $03
    jr   z, .jr_561C                              ;; 20:5619 $28 $01

    dec  c                                        ;; 20:561B $0D

.jr_561C
    rrc  c                                        ;; 20:561C $CB $09
    rrc  c                                        ;; 20:561E $CB $09
    inc  b                                        ;; 20:5620 $04
    ld   a, b                                     ;; 20:5621 $78
    cp   $04                                      ;; 20:5622 $FE $04
    jr   nz, jr_020_5616                          ;; 20:5624 $20 $F0

    ld   a, c                                     ;; 20:5626 $79
    ld   [hl], a                                  ;; 20:5627 $77
    ld   hl, hMultiPurpose0                       ;; 20:5628 $21 $D7 $FF
    inc  [hl]                                     ;; 20:562B $34
    jr   jr_020_5605                              ;; 20:562C $18 $D7

ret_020_562E:
    ret                                           ;; 20:562E $C9

Data_020_562F::
    db   $00, $01, $02, $03, $00, $03, $01, $00, $00, $01, $02, $03

func_020_563B::
    ld   hl, wC16C                                ;; 20:563B $21 $6C $C1
    inc  [hl]                                     ;; 20:563E $34
    ld   a, [wC16C]                               ;; 20:563F $FA $6C $C1
    and  $03                                      ;; 20:5642 $E6 $03
    jr   nz, ret_020_568A                         ;; 20:5644 $20 $44

    ld   hl, wTransitionSequenceCounter           ;; 20:5646 $21 $6B $C1

label_020_5649:
    ld   a, [hl]                                  ;; 20:5649 $7E
    inc  [hl]                                     ;; 20:564A $34

func_020_564B::
    cp   $04                                      ;; 20:564B $FE $04
    jr   z, ret_020_568A                          ;; 20:564D $28 $3B

    xor  a                                        ;; 20:564F $AF
    ldh  [hMultiPurpose0], a                      ;; 20:5650 $E0 $D7

jr_020_5652:
    ldh  a, [hMultiPurpose0]                      ;; 20:5652 $F0 $D7
    cp   $03                                      ;; 20:5654 $FE $03
    jr   z, ret_020_568A                          ;; 20:5656 $28 $32

    ld   hl, wBGPalette                           ;; 20:5658 $21 $97 $DB
    ld   e, a                                     ;; 20:565B $5F
    ld   d, $00                                   ;; 20:565C $16 $00
    add  hl, de                                   ;; 20:565E $19
    ld   a, [hl]                                  ;; 20:565F $7E
    push hl                                       ;; 20:5660 $E5
    ld   c, a                                     ;; 20:5661 $4F
    ld   b, $00                                   ;; 20:5662 $06 $00

jr_020_5664:
    ldh  a, [hMultiPurpose0]                      ;; 20:5664 $F0 $D7
    sla  a                                        ;; 20:5666 $CB $27
    sla  a                                        ;; 20:5668 $CB $27
    or   b                                        ;; 20:566A $B0
    ld   e, a                                     ;; 20:566B $5F
    ld   hl, Data_020_562F                        ;; 20:566C $21 $2F $56
    add  hl, de                                   ;; 20:566F $19
    ld   a, c                                     ;; 20:5670 $79
    and  $03                                      ;; 20:5671 $E6 $03
    cp   [hl]                                     ;; 20:5673 $BE
    jr   z, .jr_5677                              ;; 20:5674 $28 $01

    inc  c                                        ;; 20:5676 $0C

.jr_5677
    rrc  c                                        ;; 20:5677 $CB $09
    rrc  c                                        ;; 20:5679 $CB $09
    inc  b                                        ;; 20:567B $04
    ld   a, b                                     ;; 20:567C $78
    cp   $04                                      ;; 20:567D $FE $04
    jr   nz, jr_020_5664                          ;; 20:567F $20 $E3

    ld   a, c                                     ;; 20:5681 $79
    pop  hl                                       ;; 20:5682 $E1
    ld   [hl], a                                  ;; 20:5683 $77
    ld   hl, hMultiPurpose0                       ;; 20:5684 $21 $D7 $FF
    inc  [hl]                                     ;; 20:5687 $34
    jr   jr_020_5652                              ;; 20:5688 $18 $C8

ret_020_568A:
    ret                                           ;; 20:568A $C9

; The tiles to draw for the visited locations (see OW_ROOM_STATUS_VISITED) on the overworld
; map, within the outer border defined in WorldMapTilemap
InnerWorldMapTilemap::
    db   $27, $6A, $6C, $21, $22, $23, $24, $25, $26, $6A, $FF, $6C, $6A, $6C, $6A, $6C
    db   $65, $65, $66, $31, $32, $33, $34, $35, $36, $67, $68, $64, $67, $69, $65, $66
    db   $40, $40, $41, $42, $43, $44, $FA, $FA, $63, $40, $40, $40, $40, $40, $40, $60
    db   $FF, $FA, $48, $49, $4A, $FA, $FA, $FF, $62, $6D, $6D, $6D, $6D, $6D, $6D, $FF
    db   $00, $01, $00, $01, $FA, $FF, $5E, $5F, $04, $05, $06, $07, $28, $29, $29, $2A
    db   $10, $11, $10, $11, $FA, $FA, $6E, $6F, $14, $15, $16, $17, $38, $20, $20, $3A
    db   $00, $01, $00, $01, $FB, $FF, $FE, $FE, $08, $09, $0A, $0B, $38, $20, $20, $3A
    db   $10, $11, $10, $11, $FB, $FB, $FE, $FE, $18, $19, $1A, $1B, $48, $49, $49, $4A
    db   $FB, $FF, $0C, $0D, $40, $40, $40, $40, $FA, $FA, $FF, $58, $0E, $0F, $FA, $FA
    db   $FB, $FB, $1C, $1D, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $5D, $1E, $1F, $FA, $FA
    db   $0C, $0D, $0C, $0D, $FB, $FB, $28, $2A, $FA, $FA, $FA, $58, $2D, $2E, $2E, $2F
    db   $1C, $1D, $1C, $1D, $FB, $56, $61, $4A, $FA, $FA, $59, $5A, $3D, $3E, $3E, $3F
    db   $FD, $FD, $FD, $FD, $FB, $FB, $FB, $FB, $28, $29, $5B, $FA, $FF, $FF, $54, $54
    db   $FD, $FD, $FD, $FD, $FB, $FB, $FF, $FB, $38, $30, $3A, $FA, $FF, $FF, $54, $54
    db   $FD, $FD, $FD, $FF, $FD, $FD, $FB, $FB, $48, $FE, $4A, $FA, $56, $57, $54, $54
    db   $03, $12, $13, $12, $13, $02, $FF, $FB, $5C, $2B, $FA, $FA, $FA, $FA, $54, $54

; The tile attributes (in practice, palettes) to use for InnerWorldMapTilemap
InnerWorldMapAttrmap::
    db   $03, $03, $03, $03, $03, $03, $02, $03, $03, $03, $00, $03, $03, $03, $03, $03
    db   $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db   $03, $03, $04, $04, $04, $04, $00, $00, $04, $03, $03, $03, $03, $03, $03, $03
    db   $01, $00, $04, $04, $04, $04, $00, $01, $04, $04, $04, $04, $04, $04, $04, $01
    db   $00, $00, $00, $00, $00, $02, $01, $01, $04, $04, $04, $04, $04, $04, $04, $04
    db   $00, $00, $00, $00, $00, $00, $01, $01, $04, $06, $04, $04, $04, $07, $07, $04
    db   $00, $00, $00, $00, $00, $01, $01, $01, $04, $06, $04, $04, $04, $07, $07, $04
    db   $00, $00, $00, $00, $00, $00, $01, $01, $04, $04, $04, $04, $04, $04, $04, $04
    db   $00, $01, $02, $02, $03, $03, $03, $03, $00, $00, $00, $04, $02, $07, $00, $00
    db   $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $04, $07, $07, $00, $00
    db   $07, $07, $01, $01, $00, $00, $04, $04, $00, $00, $00, $04, $05, $03, $03, $03
    db   $07, $07, $01, $01, $00, $04, $04, $04, $00, $00, $04, $04, $03, $03, $03, $03
    db   $03, $03, $03, $03, $00, $00, $00, $00, $04, $04, $04, $00, $07, $01, $03, $03
    db   $03, $03, $03, $03, $00, $00, $02, $00, $04, $04, $04, $00, $00, $02, $03, $03
    db   $03, $03, $03, $07, $03, $03, $00, $00, $04, $04, $04, $00, $04, $04, $03, $03
    db   $04, $04, $04, $04, $04, $04, $07, $00, $04, $04, $00, $00, $00, $00, $03, $03

; Copy the World Map tilemap to BG memory
LoadWorldMapBGMap::
    ld   a, LOW(InnerWorldMapTilemap)             ;; 20:588B $3E $8B
    ldh  [hMultiPurposeA], a                      ;; 20:588D $E0 $E1
    ld   a, HIGH(InnerWorldMapTilemap)            ;; 20:588F $3E $56
    ldh  [hMultiPurposeB], a                      ;; 20:5891 $E0 $E2

    xor  a                                        ;; 20:5893 $AF
    ldh  [hMultiPurposeC], a                      ;; 20:5894 $E0 $E3
    call func_020_58AD                            ;; 20:5896 $CD $AD $58
    ldh  a, [hIsGBC]                              ;; 20:5899 $F0 $FE
    and  a                                        ;; 20:589B $A7
    ret  z                                        ;; 20:589C $C8

    ld   a, LOW(InnerWorldMapAttrmap)             ;; 20:589D $3E $8B
    ldh  [hMultiPurposeA], a                      ;; 20:589F $E0 $E1
    ld   a, HIGH(InnerWorldMapAttrmap)            ;; 20:58A1 $3E $57
    ldh  [hMultiPurposeB], a                      ;; 20:58A3 $E0 $E2
    ld   hl, hMultiPurposeC                       ;; 20:58A5 $21 $E3 $FF
    inc  [hl]                                     ;; 20:58A8 $34
    call func_020_58AD                            ;; 20:58A9 $CD $AD $58
    ret                                           ;; 20:58AC $C9

func_020_58AD::
    ld   de, vBGMap0 + $22                        ;; 20:58AD $11 $22 $98
    ld   bc, 0                                    ;; 20:58B0 $01 $00 $00

jr_020_58B3:
    ld   a, [wC5A2]                               ;; 20:58B3 $FA $A2 $C5
    and  a                                        ;; 20:58B6 $A7
    jr   nz, .jr_58CB                             ;; 20:58B7 $20 $12

    ld   a, [wGameplayType]                       ;; 20:58B9 $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 20:58BC $FE $01
    jr   z, .jr_58CB                              ;; 20:58BE $28 $0B

    ld   hl, wOverworldRoomStatus                 ;; 20:58C0 $21 $00 $D8
    add  hl, bc                                   ;; 20:58C3 $09
    ld   a, [hl]                                  ;; 20:58C4 $7E
    and  OW_ROOM_STATUS_VISITED                   ;; 20:58C5 $E6 $80
    ld   a, $2C ; Unvisited location tile         ;; 20:58C7 $3E $2C
    jr   z, jr_020_58D3                           ;; 20:58C9 $28 $08

.jr_58CB
    ldh  a, [hBGMapOffsetLow]                     ;; 20:58CB $F0 $E1
    ld   l, a                                     ;; 20:58CD $6F
    ldh  a, [hMultiPurposeB]                      ;; 20:58CE $F0 $E2
    ld   h, a                                     ;; 20:58D0 $67
    add  hl, bc                                   ;; 20:58D1 $09
    ld   a, [hl]                                  ;; 20:58D2 $7E

jr_020_58D3:
    ld   h, a                                     ;; 20:58D3 $67
    ldh  a, [hMultiPurposeC]                      ;; 20:58D4 $F0 $E3
    and  a                                        ;; 20:58D6 $A7
    jr   z, jr_020_58EA                           ;; 20:58D7 $28 $11

    ld   a, $01                                   ;; 20:58D9 $3E $01
    ldh  [rVBK], a                                ;; 20:58DB $E0 $4F
    ld   a, h                                     ;; 20:58DD $7C
    cp   $2C                                      ;; 20:58DE $FE $2C
    jr   nz, .jr_58E4                             ;; 20:58E0 $20 $02

    ld   a, $01                                   ;; 20:58E2 $3E $01

.jr_58E4
    ld   [de], a                                  ;; 20:58E4 $12
    xor  a                                        ;; 20:58E5 $AF
    ldh  [rVBK], a                                ;; 20:58E6 $E0 $4F
    jr   jr_020_58EC                              ;; 20:58E8 $18 $02

jr_020_58EA:
    ld   a, h                                     ;; 20:58EA $7C
    ld   [de], a                                  ;; 20:58EB $12

jr_020_58EC:
    inc  c                                        ;; 20:58EC $0C
    jr   z, .return                               ;; 20:58ED $28 $14

    inc  e                                        ;; 20:58EF $1C
    ld   a, e                                     ;; 20:58F0 $7B
    and  $1F                                      ;; 20:58F1 $E6 $1F
    cp   $12                                      ;; 20:58F3 $FE $12
    jr   nz, .jr_5901                             ;; 20:58F5 $20 $0A

    ld   a, e                                     ;; 20:58F7 $7B
    and  $E0                                      ;; 20:58F8 $E6 $E0
    add  $22                                      ;; 20:58FA $C6 $22
    ld   e, a                                     ;; 20:58FC $5F
    ld   a, d                                     ;; 20:58FD $7A
    adc  $00                                      ;; 20:58FE $CE $00
    ld   d, a                                     ;; 20:5900 $57

.jr_5901
    jr   jr_020_58B3                              ;; 20:5901 $18 $B0

.return:
    ret                                           ;; 20:5903 $C9

InventoryEntryPoint::
    ld   a, [wGameplaySubtype]                    ;; 20:5904 $FA $96 $DB
    JP_TABLE                                      ;; 20:5907
._00 dw InventoryInitialHandler     ; GAMEPLAY_INVENTORY_INITIAL
._01 dw InventoryMapFadeOutHandler  ; GAMEPLAY_INVENTORY_MAP_FADE_OUT
._02 dw InventoryLoad1Handler       ; GAMEPLAY_INVENTORY_DELAY1
._03 dw InventoryLoad2Handler       ; GAMEPLAY_INVENTORY_DELAY2
._04 dw InventoryLoad3Handler       ; GAMEPLAY_INVENTORY_DELAY3
._05 dw InventoryLoad4Handler       ; GAMEPLAY_INVENTORY_DELAY4
._06 dw InventoryLoad5Handler       ; GAMEPLAY_INVENTORY_DELAY5
._07 dw InventoryFadeInHandler      ; GAMEPLAY_INVENTORY_FADE_IN
._08 dw InventoryInteractiveHandler ; GAMEPLAY_INVENTORY_INTERACTIVE
._09 dw InventoryStatusInHandler    ; GAMEPLAY_INVENTORY_STATUS_IN
._0A dw InventoryStatusHandler      ; GAMEPLAY_INVENTORY_STATUS
._0B dw InventoryStatusOutHandler   ; GAMEPLAY_INVENTORY_STATUS_OUT
._0C dw InventoryFadeOutHandler     ; GAMEPLAY_INVENTORY_FADE_OUT

InventoryInitialHandler::
    ldh  a, [hIsGBC]
    and  a
    jr   z, .notGBC                               ;; 20:5925 $28 $19

    ; If GBC, store current background and OAM
    ; palettes in WRAM bank 3
    ld   hl, wBGPal1                              ;; 20:5927 $21 $10 $DC
    ld   c, $80 ; counter, copy 128 palette bytes ;; 20:592A $0E $80
    ; Disable interrupts
    di                                            ;; 20:592C $F3

.copyPalettes
    ; Select WRAM bank 1
    xor  a                                        ;; 20:592D $AF
    ldh  [rSVBK], a                               ;; 20:592E $E0 $70
    ; Load palette into b
    ld   b, [hl]                                  ;; 20:5930 $46
    ; Select WRAM bank 3
    ld   a, 3                                     ;; 20:5931 $3E $03
    ldh  [rSVBK], a                               ;; 20:5933 $E0 $70
    ; Store palette in WRAM bank 3
    ld   [hl], b                                  ;; 20:5935 $70
    ; Select next palette and decrease counter
    inc  hl                                       ;; 20:5936 $23
    dec  c                                        ;; 20:5937 $0D
    ld   a, c                                     ;; 20:5938 $79
    and  a                                        ;; 20:5939 $A7
    jr   nz, .copyPalettes                        ;; 20:593A $20 $F1

    ; Select WRAM bank 1 and enable interrupts
    xor  a                                        ;; 20:593C $AF
    ldh  [rSVBK], a                               ;; 20:593D $E0 $70
    ei                                            ;; 20:593F $FB

.notGBC:
    call IncrementGameplaySubtype_20              ;; 20:5940 $CD $83 $66
    ; Fall through and handle next gameplay
    ; subtype directly this frame

InventoryMapFadeOutHandler::
    ; Fade to white and fade out music
    call func_1A22                                ;; 20:5943 $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 20:5946 $FA $6B $C1
    cp   $04                                      ;; 20:5949 $FE $04
    ; Returns back to render palettes if transition isn't finished
    jr   nz, .return                              ;; 20:594B $20 $1C

    xor  a                                        ;; 20:594D $AF
    ld   [wInventoryAppearing], a                 ;; 20:594E $EA $4F $C1
    ; Set volume for "inventory appearing" sfx?
    ld   a, $03                                   ;; 20:5951 $3E $03
    ldh  [hVolumeRight], a                        ;; 20:5953 $E0 $A9
    ld   a, $30                                   ;; 20:5955 $3E $30
    ldh  [hVolumeLeft], a                         ;; 20:5957 $E0 $AA
    xor  a                                        ;; 20:5959 $AF
    ld   [wDE06], a                               ;; 20:595A $EA $06 $DE
    ld   [wDE07], a                               ;; 20:595D $EA $07 $DE
    ld   [wDE08], a                               ;; 20:5960 $EA $08 $DE
    ld   [wDE09], a                               ;; 20:5963 $EA $09 $DE
    call IncrementGameplaySubtype_20              ;; 20:5966 $CD $83 $66

.return
    ; Returns to 0346 (Render Palettes)
    ret                                           ;; 20:5969 $C9

; Palette Data ?
data_020_596A::
; Sprite Data ?
; Start of data copied for inventory display
    db   $9C, $AA, $81, $06, $06, $9C, $AC, $81, $06, $06, $9C, $AE, $81, $06, $06, $9C
    db   $B0, $81, $06, $06, $9C, $B2, $81, $06, $06, $9C, $71, $81, $03, $03, $00

Data_020_5989::
    db   $9C, $AC, $81, $04, $04, $9C, $AE, $81, $03, $03, $00

data_020_5994::
; Location for overwriting each inventory sprite
    db   $9C, $6A, $83, $94, $95, $C0, $C1
    db   $9C, $6C, $83, $A0, $A1, $C2, $C3
    db   $9C, $6E, $83, $9A, $9B, $C4, $C5
    db   $9C, $6F, $81, $9C, $9D
    db   $9C, $B0, $81, $C6, $C7
    db   $9C, $71, $81, $9E, $9F
    db   $9C, $B2, $81, $CA, $CB
    db   $9C, $92, $01, $7F, $7F
    db   $9C, $D3, $00, $7F
    db   $00

data_020_59C7::
    ; These are actually indexes in the previous table of bytes that need to be set to 7F to hide items.
    ; It uses this offset to write 2x7F byte when an item is not available
    db   $03, $0A, $11, $22, $05, $0C, $13, $1D, $27 ;; 20:59CF

; Start building display of inventory
; Called from jp hl in 00:28CE (TABLEJUMP)
; Copies 51 bytes from data_020_5994 (above) to wDrawCommand (D601)
InventoryLoad1Handler::
    ld   hl, wDrawCommand                         ;; 20:59D0 $21 $01 $D6
    ld   bc, data_020_5994                        ;; 20:59D3 $01 $94 $59
    ld   e, $33                                   ;; 20:59D6 $1E $33

.loop_59D8
    ld   a, [bc]                                  ;; 20:59D8 $0A
    inc  bc                                       ;; 20:59D9 $03
    ld   [hl+], a                                 ;; 20:59DA $22
    dec  e                                        ;; 20:59DB $1D
    jr   nz, .loop_59D8                           ;; 20:59DC $20 $FA

    ldh  a, [hIsGBC]                              ;; 20:59DE $F0 $FE
    and  a                                        ;; 20:59E0 $A7
    jr   z, .inventoryDisplayEntryPoint           ;; 20:59E1 $28 $40

; GBC Exclusive code
; Load 32 bytes from 596A into DC91
    ld   hl, wDrawCommandVRAM1                    ;; 20:59E3 $21 $91 $DC
    ld   bc, data_020_596A                        ;; 20:59E6 $01 $6A $59
    ld   e, $1F                                   ;; 20:59E9 $1E $1F

.loop_59EB
    ld   a, [bc]                                  ;; 20:59EB $0A
    inc  bc                                       ;; 20:59EC $03
    ld   [hl+], a                                 ;; 20:59ED $22
    dec  e                                        ;; 20:59EE $1D
    jr   nz, .loop_59EB                           ;; 20:59EF $20 $FA

    ld   a, $1E                                   ;; 20:59F1 $3E $1E
    ld   [wDrawCommandsVRAM1Size], a              ;; 20:59F3 $EA $90 $DC

    ; If on the overworld…
    ld   a, [wIsIndoor]                           ;; 20:59F6 $FA $A5 $DB
    and  a                                        ;; 20:59F9 $A7
    ; start building the inventory
    jr   z, .inventoryDisplayEntryPoint           ;; 20:59FA $28 $27

    ;
    ; Dungeon inventory
    ;

; If inside Color Dungeon…
    ldh  a, [hMapId]                              ;; 20:59FC $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 20:59FE $FE $FF
    jr   z, .colorDungeonEnd                      ;; 20:5A00 $28 $04

    ; Jump ahead if map is greater than MAP_CAVE_B
    cp   MAP_CAVE_B                               ;; 20:5A02 $FE $0A
    jr   nc, .inventoryDisplayEntryPoint          ;; 20:5A04 $30 $1D
.colorDungeonEnd

; Set BC and E to point to the end of the "Palette Data?" (12 bytes) above
    ld   hl, wDrawCommandVRAM1                    ;; 20:5A06 $21 $91 $DC
    ld   a, [wDrawCommandsVRAM1Size]              ;; 20:5A09 $FA $90 $DC
    ld   c, a                                     ;; 20:5A0C $4F
    ld   b, $00                                   ;; 20:5A0D $06 $00
    add  hl, bc                                   ;; 20:5A0F $09
    ld   bc, Data_020_5989                        ;; 20:5A10 $01 $89 $59
    ld   e, $0B                                   ;; 20:5A13 $1E $0B

; Copy the remaining palette data
.loop_5A15
    ld   a, [bc]                                  ;; 20:5A15 $0A
    inc  bc                                       ;; 20:5A16 $03
    ld   [hl+], a                                 ;; 20:5A17 $22
    dec  e                                        ;; 20:5A18 $1D
    jr   nz, .loop_5A15                           ;; 20:5A19 $20 $FA

    ld   a, [wDrawCommandsVRAM1Size]              ;; 20:5A1B $FA $90 $DC
    add  $0A                                      ;; 20:5A1E $C6 $0A
    ld   [wDrawCommandsVRAM1Size], a              ;; 20:5A20 $EA $90 $DC

; Palette loading complete, start building inventory
.inventoryDisplayEntryPoint:
    ld   de, wHasFlippers                         ;; 20:5A23 $11 $0C $DB
    ld   bc, $00                                  ;; 20:5A26 $01 $00 $00

.inventoryDisplayLoop:
    ; c is the counted
    ld   a, c                                     ;; 20:5A29 $79
    cp   $02                                      ;; 20:5A2A $FE $02
    jr   nz, .tradeSequenceItemEnd                ;; 20:5A2C $20 $06

    ; Only executed for Trade Sequence items
    ld   a, [wExchangingTradeSequenceItem]        ;; 20:5A2E $FA $7F $DB
    and  a                                        ;; 20:5A31 $A7
    jr   nz, .overwriteInventoryDisplaySprite     ;; 20:5A32 $20 $23
.tradeSequenceItemEnd

    ld   a, c                                     ;; 20:5A34 $79
    cp   $04                                      ;; 20:5A35 $FE $04
    jr   nz, .jr_020_5A4F                         ;; 20:5A37 $20 $16

    ; Only executed for dungeon keys
    ld   de, wHasTailKey                          ;; 20:5A39 $11 $11 $DB
    ld   a, [wIsIndoor]                           ;; 20:5A3C $FA $A5 $DB
    and  a                                        ;; 20:5A3F $A7
    jr   z, .jr_020_5A4F                          ;; 20:5A40 $28 $0D

    ldh  a, [hMapId]                              ;; 20:5A42 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 20:5A44 $FE $FF
    jr   z, .jr_5A4C                              ;; 20:5A46 $28 $04

    cp   $0A                                      ;; 20:5A48 $FE $0A
    jr   nc, .jr_020_5A4F                         ;; 20:5A4A $30 $03

.jr_5A4C
    ld   de, wCurrentDungeonItemFlags             ;; 20:5A4C $11 $CC $DB

.jr_020_5A4F:
    ; Load current inventory display item memory
    ld   a, [de]                                  ;; 20:5A4F $1A
    cp   $FF                                      ;; 20:5A50 $FE $FF
    jr   z, .overwriteInventoryDisplaySprite      ;; 20:5A52 $28 $03

    and  a                                        ;; 20:5A54 $A7
    jr   nz, .incrementInventoryDisplay           ;; 20:5A55 $20 $1E

.overwriteInventoryDisplaySprite:
    ; Push current inventory item to the stack
    push de                                       ;; 20:5A57 $D5

    ld   hl, data_020_59C7                        ;; 20:5A58 $21 $C7 $59
    add  hl, bc                                   ;; 20:5A5B $09
    ld   e, [hl]                                  ;; 20:5A5C $5E
    ld   d, $00                                   ;; 20:5A5D $16 $00
    ld   hl, wDrawCommand                         ;; 20:5A5F $21 $01 $D6
    add  hl, de                                   ;; 20:5A62 $19

    ; Write $7F over sprite data (won't display)
    ld   a, $7F                                   ;; 20:5A63 $3E $7F
    ld   [hl+], a                                 ;; 20:5A65 $22
    ld   [hl+], a                                 ;; 20:5A66 $22

    ; Only executed for Trade Sequence items
    ld   a, c                                     ;; 20:5A67 $79
    cp   $02                                      ;; 20:5A68 $FE $02
    jr   nz, .tradeSequenceItem2End               ;; 20:5A6A $20 $08

    ld   de, $05                                  ;; 20:5A6C $11 $05 $00
    add  hl, de                                   ;; 20:5A6F $19
    ld   a, $7F                                   ;; 20:5A70 $3E $7F
    ld   [hl+], a                                 ;; 20:5A72 $22
    ld   [hl], a                                  ;; 20:5A73 $77
.tradeSequenceItem2End

    ; Reload inventory item to de
    pop  de                                       ;; 20:5A74 $D1

; Increment inventory memory pointer to display next item
.incrementInventoryDisplay:
    inc  de                                       ;; 20:5A75 $13
    inc  c                                        ;; 20:5A76 $0C

    ; Loop until all 8 items are handled
    ld   a, c                                     ;; 20:5A77 $79
    cp   $09                                      ;; 20:5A78 $FE $09
    jr   nz, .inventoryDisplayLoop                ;; 20:5A7A $20 $AD


    ld   hl, wDrawCommand                         ;; 20:5A7C $21 $01 $D6
    ld   de, $2C                                  ;; 20:5A7F $11 $2C $00
    add  hl, de                                   ;; 20:5A82 $19
    ld   a, [wSeashellsCount]                     ;; 20:5A83 $FA $0F $DB
    and  a                                        ;; 20:5A86 $A7
    jr   z, .jr_5A97                              ;; 20:5A87 $28 $0E

    ; Offset seashell count sprites to reflect seashell count in inventory
    ld   e, a                                     ;; 20:5A89 $5F
    swap a                                        ;; 20:5A8A $CB $37
    and  $0F                                      ;; 20:5A8C $E6 $0F
    add  $B0                                      ;; 20:5A8E $C6 $B0
    ld   [hl+], a                                 ;; 20:5A90 $22
    ld   a, e                                     ;; 20:5A91 $7B
    and  $0F                                      ;; 20:5A92 $E6 $0F
    add  $B0                                      ;; 20:5A94 $C6 $B0
    ld   [hl+], a                                 ;; 20:5A96 $22

.jr_5A97
    ld   hl, wDrawCommand                         ;; 20:5A97 $21 $01 $D6
    ld   de, $31                                  ;; 20:5A9A $11 $31 $00
    add  hl, de                                   ;; 20:5A9D $19
    ld   a, [wIsIndoor]                           ;; 20:5A9E $FA $A5 $DB
    and  a                                        ;; 20:5AA1 $A7
    jr   z, .jr_020_5AD1                          ;; 20:5AA2 $28 $2D

    ldh  a, [hMapId]                              ;; 20:5AA4 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 20:5AA6 $FE $FF
    jr   z, .jr_5AAE                              ;; 20:5AA8 $28 $04

    cp   $0A                                      ;; 20:5AAA $FE $0A
    jr   nc, .jr_020_5AD1                         ;; 20:5AAC $30 $23

.jr_5AAE
    ld   a, [wSmallKeysCount]                     ;; 20:5AAE $FA $D0 $DB
    and  a                                        ;; 20:5AB1 $A7
    jr   z, .jr_020_5ADE                          ;; 20:5AB2 $28 $2A

    push af                                       ;; 20:5AB4 $F5
    push hl                                       ;; 20:5AB5 $E5
    ld   b, $00                                   ;; 20:5AB6 $06 $00
    ld   a, [wDrawCommandsVRAM1Size]              ;; 20:5AB8 $FA $90 $DC
    ld   c, a                                     ;; 20:5ABB $4F
    ld   hl, wDrawCommandVRAM1                    ;; 20:5ABC $21 $91 $DC
    add  hl, bc                                   ;; 20:5ABF $09
    ld   a, l                                     ;; 20:5AC0 $7D
    sub  $11                                      ;; 20:5AC1 $D6 $11
    ld   l, a                                     ;; 20:5AC3 $6F
    ld   a, h                                     ;; 20:5AC4 $7C
    sbc  $00                                      ;; 20:5AC5 $DE $00
    ld   h, a                                     ;; 20:5AC7 $67
    ld   [hl], $01                                ;; 20:5AC8 $36 $01
    inc  hl                                       ;; 20:5ACA $23
    ld   [hl], $01                                ;; 20:5ACB $36 $01
    pop  hl                                       ;; 20:5ACD $E1
    pop  af                                       ;; 20:5ACE $F1
    jr   .drawKeyCounter                          ;; 20:5ACF $18 $0A

.jr_020_5AD1:
    ld   a, [wGoldenLeavesCount]                  ;; 20:5AD1 $FA $15 $DB
    ; if no golden leaves
    and  a                                        ;; 20:5AD4 $A7
    jr   z, .jr_020_5ADE                          ;; 20:5AD5 $28 $07
    ; if not slime key
    cp   SLIME_KEY                                ;; 20:5AD7 $FE $06
    jr   nc, .jr_020_5ADE                         ;; 20:5AD9 $30 $03

.drawKeyCounter:
    add  $B0                                      ;; 20:5ADB $C6 $B0
    ld   [hl], a                                  ;; 20:5ADD $77

.jr_020_5ADE:
    ld   a, $32                                   ;; 20:5ADE $3E $32
    ld   [wDrawCommandsSize], a                   ;; 20:5AE0 $EA $00 $D6
    ld   a, $03                                   ;; 20:5AE3 $3E $03
    ldh  [hVolumeRight], a                        ;; 20:5AE5 $E0 $A9
    ld   a, $30                                   ;; 20:5AE7 $3E $30
    ldh  [hVolumeLeft], a                         ;; 20:5AE9 $E0 $AA
    jp   InventoryLoad3Handler.changeBGColumnPaletteAndExecuteDrawCommands ;; 20:5AEB $C3 $34 $5D

TradingItemPaletteIndexes:
    db $00  ; TRADING_ITEM_NONE
    db $05  ; TRADING_ITEM_YOSHI_DOLL
    db $02  ; TRADING_ITEM_RIBBON
    db $05  ; TRADING_ITEM_DOG_FOOD
    db $05  ; TRADING_ITEM_BANANAS
    db $06  ; TRADING_ITEM_STICK
    db $06  ; TRADING_ITEM_HONEYCOMB
    db $05  ; TRADING_ITEM_PINEAPPLE
    db $05  ; TRADING_ITEM_HIBISCUS
    db $05  ; TRADING_ITEM_LETTER
    db $06  ; TRADING_ITEM_BROOM
    db $01  ; TRADING_ITEM_FISHING_HOOK
    db $02  ; TRADING_ITEM_NECKLACE
    db $02  ; TRADING_ITEM_SCALE
    db $05  ; TRADING_ITEM_MAGNIFYING_LENS

; Continue building display of inventory
InventoryLoad2Handler::
    ldh  a, [hIsGBC]                              ;; 20:5AFD $F0 $FE
    and  a                                        ;; 20:5AFF $A7
    jr   z, .jr_5B3D                              ;; 20:5B00 $28 $3B

    ld   b, $00                                   ;; 20:5B02 $06 $00
    ld   a, [wTradeSequenceItem]                  ;; 20:5B04 $FA $0E $DB
    ld   c, a                                     ;; 20:5B07 $4F
    ld   hl, TradingItemPaletteIndexes            ;; 20:5B08 $21 $EE $5A
    add  hl, bc                                   ;; 20:5B0B $09
    ld   a, [hl]                                  ;; 20:5B0C $7E
    ldh  [hMultiPurpose0], a                      ;; 20:5B0D $E0 $D7
    ld   a, HIGH($9C6E)                           ;; 20:5B0F $3E $9C
    ld   [wDrawCommandVRAM1.destinationHigh], a   ;; 20:5B11 $EA $91 $DC
    ld   [wDrawCommandVRAM1.data+1], a            ;; 20:5B14 $EA $95 $DC
    ld   a, LOW($9C6E)                            ;; 20:5B17 $3E $6E
    ld   [wDrawCommandVRAM1.destinationLow], a    ;; 20:5B19 $EA $92 $DC
    ld   a, $8E                                   ;; 20:5B1C $3E $8E
    ld   [wDrawCommandVRAM1.data+2], a            ;; 20:5B1E $EA $96 $DC
    ld   a, $41                                   ;; 20:5B21 $3E $41
    ld   [wDrawCommandVRAM1.length], a            ;; 20:5B23 $EA $93 $DC
    ld   [wDrawCommandVRAM1.data+3], a            ;; 20:5B26 $EA $97 $DC
    ldh  a, [hMultiPurpose0]                      ;; 20:5B29 $F0 $D7
    ld   [wDrawCommandVRAM1.data], a              ;; 20:5B2B $EA $94 $DC
    ld   [wDrawCommandVRAM1.data+4], a            ;; 20:5B2E $EA $98 $DC
    xor  a                                        ;; 20:5B31 $AF
    ld   [wDrawCommandVRAM1.data+5], a            ;; 20:5B32 $EA $99 $DC

    ld   a, [wDrawCommandsVRAM1Size]              ;; 20:5B35 $FA $90 $DC
    add  $08                                      ;; 20:5B38 $C6 $08
    ld   [wDrawCommandsVRAM1Size], a              ;; 20:5B3A $EA $90 $DC

.jr_5B3D
    ld   a, $03                                   ;; 20:5B3D $3E $03
    ldh  [hVolumeRight], a                        ;; 20:5B3F $E0 $A9
    ld   a, $30                                   ;; 20:5B41 $3E $30
    ldh  [hVolumeLeft], a                         ;; 20:5B43 $E0 $AA
    call IncrementGameplaySubtype_20              ;; 20:5B45 $CD $83 $66
    ret                                           ;; 20:5B48 $C9

AdjustInventoryTilesForLevelsAndCounts::
    ldh  a, [hMultiPurpose1]                      ;; 20:5B49 $F0 $D8
    cp   INVENTORY_OCARINA                        ;; 20:5B4B $FE $09
    jr   z, jr_020_5B8B                           ;; 20:5B4D $28 $3C

    cp   INVENTORY_MAGIC_POWDER                   ;; 20:5B4F $FE $0C
    jr   z, jr_020_5B80                           ;; 20:5B51 $28 $2D

    dec  a                                        ;; 20:5B53 $3D
    jr   z, jr_020_5B73                           ;; 20:5B54 $28 $1D

    dec  a                                        ;; 20:5B56 $3D
    jr   z, jr_020_5BA5                           ;; 20:5B57 $28 $4C

    dec  a                                        ;; 20:5B59 $3D
    jr   z, jr_020_5B69                           ;; 20:5B5A $28 $0D

    dec  a                                        ;; 20:5B5C $3D
    jr   z, jr_020_5B6E                           ;; 20:5B5D $28 $0F

    dec  a                                        ;; 20:5B5F $3D
    jr   z, jr_020_5BA0                           ;; 20:5B60 $28 $3E

label_020_5B62:
    ld   a, [de]                                  ;; 20:5B62 $1A
    inc  de                                       ;; 20:5B63 $13
    ld   [hl+], a                                 ;; 20:5B64 $22
    ld   a, [de]                                  ;; 20:5B65 $1A
    inc  de                                       ;; 20:5B66 $13
    ld   [hl+], a                                 ;; 20:5B67 $22
    ret                                           ;; 20:5B68 $C9

jr_020_5B69:
    ld   a, [wPowerBraceletLevel]                 ;; 20:5B69 $FA $43 $DB
    jr   jr_020_5B76                              ;; 20:5B6C $18 $08

jr_020_5B6E:
    ld   a, [wShieldLevel]                        ;; 20:5B6E $FA $44 $DB
    jr   jr_020_5B76                              ;; 20:5B71 $18 $03

jr_020_5B73:
    ld   a, [wSwordLevel]                         ;; 20:5B73 $FA $4E $DB

jr_020_5B76:
    add  $B0                                      ;; 20:5B76 $C6 $B0
    ld   c, a                                     ;; 20:5B78 $4F
    ld   a, [de]                                  ;; 20:5B79 $1A
    inc  de                                       ;; 20:5B7A $13
    ld   [hl+], a                                 ;; 20:5B7B $22
    ld   a, c                                     ;; 20:5B7C $79
    inc  de                                       ;; 20:5B7D $13
    ld   [hl+], a                                 ;; 20:5B7E $22
    ret                                           ;; 20:5B7F $C9

jr_020_5B80:
    ld   a, [wHasToadstool]                       ;; 20:5B80 $FA $4B $DB
    and  a                                        ;; 20:5B83 $A7
    jr   nz, label_020_5B62                       ;; 20:5B84 $20 $DC

    ld   a, [wMagicPowderCount]                   ;; 20:5B86 $FA $4C $DB
    jr   func_020_5BA8                            ;; 20:5B89 $18 $1D

jr_020_5B8B:
    ld   a, [wOcarinaSongFlags]                   ;; 20:5B8B $FA $49 $DB
    and  a                                        ;; 20:5B8E $A7
    jp   z, label_020_5B62                        ;; 20:5B8F $CA $62 $5B

    ld   a, [wSelectedSongIndex]                  ;; 20:5B92 $FA $4A $DB
    inc  a                                        ;; 20:5B95 $3C
    swap a                                        ;; 20:5B96 $CB $37
    call func_020_5BA8                            ;; 20:5B98 $CD $A8 $5B
    dec  hl                                       ;; 20:5B9B $2B
    ld   [hl], $7F                                ;; 20:5B9C $36 $7F
    inc  hl                                       ;; 20:5B9E $23
    ret                                           ;; 20:5B9F $C9

jr_020_5BA0:
    ld   a, [wArrowCount]                         ;; 20:5BA0 $FA $45 $DB
    jr   func_020_5BA8                            ;; 20:5BA3 $18 $03

jr_020_5BA5:
    ld   a, [wBombCount]                          ;; 20:5BA5 $FA $4D $DB

func_020_5BA8::
    push af                                       ;; 20:5BA8 $F5
    and  $0F                                      ;; 20:5BA9 $E6 $0F
    add  $B0                                      ;; 20:5BAB $C6 $B0
    ld   c, a                                     ;; 20:5BAD $4F
    pop  af                                       ;; 20:5BAE $F1
    swap a                                        ;; 20:5BAF $CB $37
    and  $0F                                      ;; 20:5BB1 $E6 $0F
    add  $B0                                      ;; 20:5BB3 $C6 $B0
    ld   [hl+], a                                 ;; 20:5BB5 $22
    ld   a, c                                     ;; 20:5BB6 $79
    ld   [hl+], a                                 ;; 20:5BB7 $22
    ret                                           ;; 20:5BB8 $C9

; Configure request for loading inventory palette
func_020_5BB9::
    push bc                                       ;; 20:5BB9 $C5
    ld   a, [wDrawCommandsVRAM1Size]              ;; 20:5BBA $FA $90 $DC
    ld   e, a                                     ;; 20:5BBD $5F
    ld   d, $00                                   ;; 20:5BBE $16 $00
    ld   hl, wDrawCommandVRAM1                    ;; 20:5BC0 $21 $91 $DC
    add  hl, de                                   ;; 20:5BC3 $19
    add  $05                                      ;; 20:5BC4 $C6 $05
    ld   [wDrawCommandsVRAM1Size], a              ;; 20:5BC6 $EA $90 $DC
    push hl                                       ;; 20:5BC9 $E5
    sla  c                                        ;; 20:5BCA $CB $21
    ld   hl, InventoryTileMapPositions            ;; 20:5BCC $21 $84 $5C
    add  hl, bc                                   ;; 20:5BCF $09
    push hl                                       ;; 20:5BD0 $E5
    pop  de                                       ;; 20:5BD1 $D1
    pop  hl                                       ;; 20:5BD2 $E1
    ld   a, [de]                                  ;; 20:5BD3 $1A
    inc  de                                       ;; 20:5BD4 $13
    ld   [hl+], a                                 ;; 20:5BD5 $22
    ld   a, [de]                                  ;; 20:5BD6 $1A
    ld   [hl+], a                                 ;; 20:5BD7 $22
    ld   a, $81                                   ;; 20:5BD8 $3E $81
    ld   [hl+], a                                 ;; 20:5BDA $22
    push hl                                       ;; 20:5BDB $E5
    ldh  a, [hMultiPurpose1]                      ;; 20:5BDC $F0 $D8
    sla  a                                        ;; 20:5BDE $CB $27
    ld   c, a                                     ;; 20:5BE0 $4F
    ld   hl, InventoryItemPaletteIndexes          ;; 20:5BE1 $21 $14 $5C
    add  hl, bc                                   ;; 20:5BE4 $09
    push hl                                       ;; 20:5BE5 $E5
    pop  de                                       ;; 20:5BE6 $D1
    pop  hl                                       ;; 20:5BE7 $E1
    cp   $06                                      ;; 20:5BE8 $FE $06
    jr   nz, .jr_5BF9                             ;; 20:5BEA $20 $0D

    ld   a, [wPowerBraceletLevel]                 ;; 20:5BEC $FA $43 $DB
    cp   $02                                      ;; 20:5BEF $FE $02
    jr   nz, .jr_5BF9                             ;; 20:5BF1 $20 $06

    ld   a, $02                                   ;; 20:5BF3 $3E $02
    ld   [hl+], a                                 ;; 20:5BF5 $22
    ld   [hl+], a                                 ;; 20:5BF6 $22
    jr   .jr_020_5C10                             ;; 20:5BF7 $18 $17

.jr_5BF9
    cp   $18                                      ;; 20:5BF9 $FE $18
    jr   nz, .jr_5C0B                             ;; 20:5BFB $20 $0E

    ld   a, [wHasToadstool]                       ;; 20:5BFD $FA $4B $DB
    and  a                                        ;; 20:5C00 $A7
    jr   z, .jr_5C0B                              ;; 20:5C01 $28 $08

    ld   a, $02                                   ;; 20:5C03 $3E $02
    ld   [hl+], a                                 ;; 20:5C05 $22
    ld   a, $03                                   ;; 20:5C06 $3E $03
    ld   [hl+], a                                 ;; 20:5C08 $22
    jr   .jr_020_5C10                             ;; 20:5C09 $18 $05

.jr_5C0B
    ld   a, [de]                                  ;; 20:5C0B $1A
    inc  de                                       ;; 20:5C0C $13
    ld   [hl+], a                                 ;; 20:5C0D $22
    ld   a, [de]                                  ;; 20:5C0E $1A
    ld   [hl+], a                                 ;; 20:5C0F $22

.jr_020_5C10:
    xor  a                                        ;; 20:5C10 $AF
    ld   [hl], a                                  ;; 20:5C11 $77
    pop  bc                                       ;; 20:5C12 $C1
    ret                                           ;; 20:5C13 $C9

InventoryItemPaletteIndexes::
    ; Palettes used by the inventory items. This only affects the
    ; leftmost column.
    db  $01, $01 ; (blank)
    db  $01, $01 ; INVENTORY_SWORD
    db  $01, $01 ; INVENTORY_BOMBS
    db  $01, $01 ; INVENTORY_POWER_BRACELET  (note: L2 has special code elsewhere)
    db  $01, $01 ; INVENTORY_SHIELD
    db  $03, $03 ; INVENTORY_BOW
    db  $01, $02 ; INVENTORY_HOOKSHOT
    db  $02, $01 ; INVENTORY_MAGIC_ROD
    db  $03, $03 ; INVENTORY_PEGASUS_BOOTS
    db  $02, $02 ; INVENTORY_OCARINA
    db  $03, $03 ; INVENTORY_ROCS_FEATHER
    db  $03, $01 ; INVENTORY_SHOVEL
    db  $03, $03 ; INVENTORY_MAGIC_POWDER
    db  $02, $02 ; INVENTORY_BOOMERANG

InventoryItemTiles::
    ; Tiles used for the inventory items.
    ; The "L-" is baked in for the sword/shield/bracelet.
    db $7F, $7F, $7F ; (Blank space)
    db $7F, $7F, $7F ;
    db $84, $7F, $7F ; INVENTORY_SWORD
    db $85, $BA, $7F ; L-
    db $80, $7F, $7F ; INVENTORY_BOMBS
    db $81, $7F, $7F ;
    db $82, $7F, $7F ; INVENTORY_POWER_BRACELET
    db $83, $BA, $7F ; L-
    db $86, $7F, $7F ; INVENTORY_SHIELD
    db $87, $BA, $7F ; L-
    db $88, $7F, $7F ; INVENTORY_BOW
    db $89, $7F, $7F ;
    db $8A, $7F, $7F ; INVENTORY_HOOKSHOT
    db $8B, $7F, $7F ;
    db $8C, $7F, $7F ; INVENTORY_MAGIC_ROD
    db $8D, $7F, $7F ;
    db $98, $7F, $7F ; INVENTORY_PEGASUS_BOOTS
    db $99, $7F, $7F ;
    db $90, $7F, $7F ; INVENTORY_OCARINA
    db $91, $7F, $7F ;
    db $92, $7F, $7F ; INVENTORY_ROCS_FEATHER
    db $93, $7F, $7F ;
    db $96, $7F, $7F ; INVENTORY_SHOVEL
    db $97, $7F, $7F ;
    db $8E, $7F, $7F ; INVENTORY_MAGIC_POWDER
    db $8F, $7F, $7F ;
    db $A4, $7F, $7F ; INVENTORY_BOOMERANG
    db $A5, $7F, $7F ;


InventoryTileMapPositions::
    ; Where each inventory item is drawn in the subscreen
    ; (and, for the first one, the status bar)
    db  HIGH(vBGMap1), $01,          HIGH(vBGMap1), $06         ; B[   ] A[   ]
    db  HIGH(vBGMap1), $61,          HIGH(vBGMap1), $65         ;  [   ] [   ]
    db  HIGH(vBGMap1), $C1,          HIGH(vBGMap1), $C5         ;  [   ] [   ]
    db  HIGH(vBGMap1 + $100), $21,   HIGH(vBGMap1 + $100), $25  ;  [   ] [   ]
    db  HIGH(vBGMap1 + $100), $81,   HIGH(vBGMap1 + $100), $85  ;  [   ] [   ]
    db  HIGH(vBGMap1 + $100), $E1,   HIGH(vBGMap1 + $100), $E5  ;  [   ] [   ]

; Build wDrawCommand to draw inventory slots
;
; Starts at the slot number in bc, counting from the bottom of the inventory
; and up, ie. from the highest slot number, and up until (but not including)
; the slot number in e. This numbering starts at wInventoryItems.BButtonSlot as index 0,
; wInventoryItems.AButtonSlot as index 1, and then the remaining wInventoryItems.
;
; If this were Python, it could be described as: range(bc, e, -1)
;
; bc = The bottom-most inventory slot to draw
; e = One less than the top-most inventory slot to draw
;     ($FF draws all the way to the top, including the A and B slots)
DrawInventorySlots::
    push de                                       ;; 20:5C9C $D5
    push bc                                       ;; 20:5C9D $C5
    ld   hl, wInventoryItems                      ;; 20:5C9E $21 $00 $DB
    add  hl, bc                                   ;; 20:5CA1 $09
    ld   a, [hl]                                  ;; 20:5CA2 $7E
    ldh  [hMultiPurpose1], a                      ;; 20:5CA3 $E0 $D8
    sla  a                                        ;; 20:5CA5 $CB $27
    ld   e, a                                     ;; 20:5CA7 $5F
    sla  a                                        ;; 20:5CA8 $CB $27
    add  e                                        ;; 20:5CAA $83
    ldh  [hMultiPurpose0], a                      ;; 20:5CAB $E0 $D7
    ldh  a, [hIsGBC]                              ;; 20:5CAD $F0 $FE
    and  a                                        ;; 20:5CAF $A7
    jr   z, .jr_5CB5                              ;; 20:5CB0 $28 $03

    call func_020_5BB9                            ;; 20:5CB2 $CD $B9 $5B

.jr_5CB5
    ; de = start of the next draw command
    ld   a, [wDrawCommandsSize]                   ;; 20:5CB5 $FA $00 $D6
    ld   e, a                                     ;; 20:5CB8 $5F
    ld   d, $00                                   ;; 20:5CB9 $16 $00

    ; hl = request start address
    ld   hl, wDrawCommand                         ;; 20:5CBB $21 $01 $D6
    add  hl, de                                   ;; 20:5CBE $19

    ; Increment the requests size by 0C
    add  $0C                                      ;; 20:5CBF $C6 $0C
    ld   [wDrawCommandsSize], a                   ;; 20:5CC1 $EA $00 $D6
    push hl                                       ;; 20:5CC4 $E5

    ; de = InventoryTileMapPositions + c * 2
    sla  c                                        ;; 20:5CC5 $CB $21
    ld   hl, InventoryTileMapPositions            ;; 20:5CC7 $21 $84 $5C
    add  hl, bc                                   ;; 20:5CCA $09
    push hl                                       ;; 20:5CCB $E5
    pop  de                                       ;; 20:5CCC $D1
    pop  hl                                       ;; 20:5CCD $E1

    ; Copy request destination (2 bytes)
    ld   a, [de]                                  ;; 20:5CCE $1A
    inc  de                                       ;; 20:5CCF $13
    ld   [hl+], a                                 ;; 20:5CD0 $22
    ld   a, [de]                                  ;; 20:5CD1 $1A
    inc  de                                       ;; 20:5CD2 $13
    ld   [hl+], a                                 ;; 20:5CD3 $22

    ; Copy request length (2 tiles)
    ld   a, $02                                   ;; 20:5CD4 $3E $02
    ld   [hl+], a                                 ;; 20:5CD6 $22

    push hl                                       ;; 20:5CD7 $E5
    ldh  a, [hMultiPurpose0]                      ;; 20:5CD8 $F0 $D7
    ld   c, a                                     ;; 20:5CDA $4F

    ; de = InventoryItemTiles + [hMultiPurpose0]
    ld   hl, InventoryItemTiles                   ;; 20:5CDB $21 $30 $5C
    add  hl, bc                                   ;; 20:5CDE $09
    push hl                                       ;; 20:5CDF $E5
    pop  de                                       ;; 20:5CE0 $D1
    pop  hl                                       ;; 20:5CE1 $E1

    ; Append 3 data bytes to the request
    ld   a, [de]                                  ;; 20:5CE2 $1A
    inc  de                                       ;; 20:5CE3 $13
    ld   [hl+], a                                 ;; 20:5CE4 $22
    ld   a, [de]                                  ;; 20:5CE5 $1A
    inc  de                                       ;; 20:5CE6 $13
    ld   [hl+], a                                 ;; 20:5CE7 $22
    ld   a, [de]                                  ;; 20:5CE8 $1A
    inc  de                                       ;; 20:5CE9 $13
    ld   [hl+], a                                 ;; 20:5CEA $22

    ; hl = bc
    pop  bc                                       ;; 20:5CEB $C1
    push bc                                       ;; 20:5CEC $C5
    push hl                                       ;; 20:5CED $E5
    sla  c                                        ;; 20:5CEE $CB $21

    ld   hl, InventoryTileMapPositions            ;; 20:5CF0 $21 $84 $5C
    add  hl, bc                                   ;; 20:5CF3 $09
    push hl                                       ;; 20:5CF4 $E5
    pop  de                                       ;; 20:5CF5 $D1
    pop  hl                                       ;; 20:5CF6 $E1
    inc  de                                       ;; 20:5CF7 $13
    inc  hl                                       ;; 20:5CF8 $23
    ld   a, [de]                                  ;; 20:5CF9 $1A
    add  $20                                      ;; 20:5CFA $C6 $20
    ld   [hl], a                                  ;; 20:5CFC $77
    dec  de                                       ;; 20:5CFD $1B
    dec  hl                                       ;; 20:5CFE $2B
    ld   a, [de]                                  ;; 20:5CFF $1A
    inc  de                                       ;; 20:5D00 $13
    inc  de                                       ;; 20:5D01 $13
    adc  $00                                      ;; 20:5D02 $CE $00
    ld   [hl+], a                                 ;; 20:5D04 $22
    inc  hl                                       ;; 20:5D05 $23
    ld   a, $02                                   ;; 20:5D06 $3E $02
    ld   [hl+], a                                 ;; 20:5D08 $22
    push hl                                       ;; 20:5D09 $E5
    ldh  a, [hMultiPurpose0]                      ;; 20:5D0A $F0 $D7
    ld   c, a                                     ;; 20:5D0C $4F
    ld   hl, InventoryItemTiles + 3               ;; 20:5D0D $21 $33 $5C
    add  hl, bc                                   ;; 20:5D10 $09
    push hl                                       ;; 20:5D11 $E5
    pop  de                                       ;; 20:5D12 $D1
    pop  hl                                       ;; 20:5D13 $E1
    ld   a, [de]                                  ;; 20:5D14 $1A
    inc  de                                       ;; 20:5D15 $13
    ld   [hl+], a                                 ;; 20:5D16 $22

    call AdjustInventoryTilesForLevelsAndCounts   ;; 20:5D17 $CD $49 $5B

    xor  a                                        ;; 20:5D1A $AF
    ld   [hl], a                                  ;; 20:5D1B $77
    pop  bc                                       ;; 20:5D1C $C1
    pop  de                                       ;; 20:5D1D $D1
    dec  c                                        ;; 20:5D1E $0D
    ld   a, c                                     ;; 20:5D1F $79
    cp   e                                        ;; 20:5D20 $BB
    jp   nz, DrawInventorySlots                   ;; 20:5D21 $C2 $9C $5C

    ret                                           ;; 20:5D24 $C9

; Draws the inventory slots
InventoryLoad3Handler::
    ld   a, [wC154]                               ;; 20:5D25 $FA $54 $C1
    ld   c, a                                     ;; 20:5D28 $4F
    ld   b, $00                                   ;; 20:5D29 $06 $00
    ld   e, $FF                                   ;; 20:5D2B $1E $FF
    call DrawInventorySlots                       ;; 20:5D2D $CD $9C $5C
    xor  a                                        ;; 20:5D30 $AF
    ld   [wC154], a                               ;; 20:5D31 $EA $54 $C1

.changeBGColumnPaletteAndExecuteDrawCommands                                 :
    call IncrementGameplaySubtype_20              ;; 20:5D34 $CD $83 $66
    call LCDOff                                   ;; 20:5D37 $CD $CF $28
    ld   a, $20                                   ;; 20:5D3A $3E $20
    call ChangeBGColumnPaletteAndExecuteDrawCommands ;; 20:5D3C $CD $B5 $0A
    xor  a                                        ;; 20:5D3F $AF
    ld   [wDrawCommandsSize], a                   ;; 20:5D40 $EA $00 $D6
    ld   [wDrawCommand]               , a         ;; 20:5D43 $EA $01 $D6
    ld   [wDrawCommandsVRAM1Size], a              ;; 20:5D46 $EA $90 $DC
    ld   [wDrawCommandVRAM1.destinationHigh], a   ;; 20:5D49 $EA $91 $DC
    ld   a, [wLCDControl]                         ;; 20:5D4C $FA $FD $D6
    ldh  [rLCDC], a                               ;; 20:5D4F $E0 $40
    ret                                           ;; 20:5D51 $C9

InventoryLoad4Handler::
    call LCDOff                                   ;; 20:5D52 $CD $CF $28
    call ReloadColorDungeonNpcTiles               ;; 20:5D55 $CD $D1 $3F
    ; Turn on LCD
    ld   a, [wLCDControl]                         ;; 20:5D58 $FA $FD $D6
    ldh  [rLCDC], a                               ;; 20:5D5B $E0 $40
    call IncrementGameplaySubtype_20              ;; 20:5D5D $CD $83 $66
    ret                                           ;; 20:5D60 $C9

InventoryPalettes::
    rgb   #F8F8A8, #20B048, #084828, #000000
    rgb   #F8F8A8, #8888A0, #283050, #000000
    rgb   #F8F8A8, #F81858, #700028, #000000
    rgb   #F8F8A8, #C87020, #703020, #000000
    rgb   #F8F8A8, #70A8F8, #0000F8, #000000
    rgb   #F8F8A8, #F8F8F8, #109008, #000000
    rgb   #F8F8A8, #D8A820, #885000, #000000
    rgb   #F8F8A8, #10C050, #008010, #000000

    rgb   #F8F8A8, #000000, #10A840, #F8B898
    rgb   #0000F8, #000000, #F87808, #F8B898
    rgb   #0000F8, #000000, #1880F8, #F8B898
    rgb   #0000F8, #000000, #8888A0, #F8F8F8
    rgb   #0000F8, #F8B030, #E81830, #000000
    rgb   #0000F8, #000000, #10A840, #F8F8F8
    rgb   #0000F8, #000000, #F80000, #F8F8F8
    rgb   #0000F8, #000000, #0000F8, #F8F8F8

InventoryTradingItemPalettes::
    ; Replaces the second and third color in the fifth BG palette line
    ; Used for trading sequence items
    rgb            #F8F8F8, #109008          ; Yoshi doll
    rgb            #F0E818, #988000          ; bananas
    rgb            #F8D818, #007810          ; pineapple
    rgb            #F8B060, #E81830          ; hibiscus
    rgb            #F8F8F8, #E80810          ; letter
    rgb            #70A8F8, #0000F8          ; magnifying lens
    rgb            #F8F8F8, #8888A0          ; dog food

InventoryTradingItemPaletteTable::
    ; Pointers to InventoryTradingItemPalettes
    ; POI: This seems really inefficent compared to just adding the index... but w/e
    dw   InventoryTradingItemPalettes
    dw   InventoryTradingItemPalettes + $04
    dw   InventoryTradingItemPalettes + $08
    dw   InventoryTradingItemPalettes + $0C
    dw   InventoryTradingItemPalettes + $10
    dw   InventoryTradingItemPalettes + $14
    dw   InventoryTradingItemPalettes + $18

InventoryTradingItemPaletteIndex::
    ; Which trading item palette should be used, per trading item
    db  $00  ; TRADING_ITEM_NONE
    db  $01  ; TRADING_ITEM_YOSHI_DOLL
    db  $00  ; TRADING_ITEM_RIBBON
    db  $07  ; TRADING_ITEM_DOG_FOOD
    db  $02  ; TRADING_ITEM_BANANAS
    db  $00  ; TRADING_ITEM_STICK
    db  $00  ; TRADING_ITEM_HONEYCOMB
    db  $03  ; TRADING_ITEM_PINEAPPLE
    db  $04  ; TRADING_ITEM_HIBISCUS
    db  $05  ; TRADING_ITEM_LETTER
    db  $00  ; TRADING_ITEM_BROOM
    db  $00  ; TRADING_ITEM_FISHING_HOOK
    db  $00  ; TRADING_ITEM_NECKLACE
    db  $00  ; TRADING_ITEM_SCALE
    db  $06  ; TRADING_ITEM_MAGNIFYING_LENS

InventoryLoad5Handler::
    xor  a                                        ;; 20:5E1A $AF
    ld   [wWindowY], a                            ;; 20:5E1B $EA $9A $DB
    ld   a, $01                                   ;; 20:5E1E $3E $01
    ld   [wPaletteUnknownE], a                    ;; 20:5E20 $EA $D5 $DD
    ldh  a, [hIsGBC]                              ;; 20:5E23 $F0 $FE
    and  a                                        ;; 20:5E25 $A7
    jr   z, .jr_020_5E6D                          ;; 20:5E26 $28 $45

    ld   bc, InventoryPalettes                    ;; 20:5E28 $01 $61 $5D
    ld   hl, wBGPal1                              ;; 20:5E2B $21 $10 $DC
    di                                            ;; 20:5E2E $F3
    ld   a, $02                                   ;; 20:5E2F $3E $02
    ldh  [rSVBK], a                               ;; 20:5E31 $E0 $70

.loop
    ld   a, [bc]                                  ;; 20:5E33 $0A
    ld   [hl+], a                                 ;; 20:5E34 $22
    inc  bc                                       ;; 20:5E35 $03
    ld   a, l                                     ;; 20:5E36 $7D
    cp   $90                                      ;; 20:5E37 $FE $90
    jr   nz, .loop                                ;; 20:5E39 $20 $F8

    xor  a                                        ;; 20:5E3B $AF
    ldh  [rSVBK], a                               ;; 20:5E3C $E0 $70
    ei                                            ;; 20:5E3E $FB
    ld   hl, InventoryTradingItemPaletteIndex     ;; 20:5E3F $21 $0B $5E
    ld   a, [wTradeSequenceItem]                  ;; 20:5E42 $FA $0E $DB
    ld   e, a                                     ;; 20:5E45 $5F
    ld   d, $00                                   ;; 20:5E46 $16 $00
    add  hl, de                                   ;; 20:5E48 $19
    ld   a, [hl]                                  ;; 20:5E49 $7E
    and  a                                        ;; 20:5E4A $A7
    jr   z, .jr_020_5E6D                          ;; 20:5E4B $28 $20

    sla  a                                        ;; 20:5E4D $CB $27
    ld   e, a                                     ;; 20:5E4F $5F
    ld   hl, InventoryTradingItemPaletteTable - 2 ;; 20:5E50 $21 $FB $5D
    add  hl, de                                   ;; 20:5E53 $19
    ld   a, [hl+]                                 ;; 20:5E54 $2A
    ld   h, [hl]                                  ;; 20:5E55 $66
    ld   l, a                                     ;; 20:5E56 $6F
    ld   de, wBGPal6 + 2                          ;; 20:5E57 $11 $3A $DC
    ld   c, $04                                   ;; 20:5E5A $0E $04
    di                                            ;; 20:5E5C $F3
    ld   a, $02                                   ;; 20:5E5D $3E $02
    ldh  [rSVBK], a                               ;; 20:5E5F $E0 $70

.loop_5E61
    ld   a, [hl+]                                 ;; 20:5E61 $2A
    ld   [de], a                                  ;; 20:5E62 $12
    inc  de                                       ;; 20:5E63 $13
    dec  c                                        ;; 20:5E64 $0D
    ld   a, c                                     ;; 20:5E65 $79
    and  a                                        ;; 20:5E66 $A7
    jr   nz, .loop_5E61                           ;; 20:5E67 $20 $F8

    xor  a                                        ;; 20:5E69 $AF
    ldh  [rSVBK], a                               ;; 20:5E6A $E0 $70
    ei                                            ;; 20:5E6C $FB

.jr_020_5E6D
    xor  a                                        ;; 20:5E6D $AF
    ld   [wTransitionSequenceCounter], a          ;; 20:5E6E $EA $6B $C1
    call IncrementGameplaySubtype_20              ;; 20:5E71 $CD $83 $66
    ret                                           ;; 20:5E74 $C9

InventoryInstrumentCyclingColors::
    ; Palette colors for the color-cycling the instruments use on the subscreen.
    rgb   #00A048, #004020
    rgb   #008870, #003830
    rgb   #0068A0, #003040
    rgb   #4040F8, #202068
    rgb   #6828F8, #301060
    rgb   #8010B8, #380850
    rgb   #900080, #400038
    rgb   #A80060, #480028
    rgb   #B80028, #480000
    rgb   #B83008, #501808
    rgb   #B84808, #502008
    rgb   #B86010, #502808
    rgb   #A87810, #483008
    rgb   #808010, #383808
    rgb   #589008, #284008
    rgb   #00A800, #004800

func_020_5EB5::
    ldh  a, [hIsGBC]                              ;; 20:5EB5 $F0 $FE
    and  a                                        ;; 20:5EB7 $A7
    jr   z, ret_020_5EEE                          ;; 20:5EB8 $28 $34

    ld   a, [wDE07]                               ;; 20:5EBA $FA $07 $DE
    ld   c, a                                     ;; 20:5EBD $4F
    ld   a, [wDE06]                               ;; 20:5EBE $FA $06 $DE
    inc  a                                        ;; 20:5EC1 $3C
    ld   [wDE06], a                               ;; 20:5EC2 $EA $06 $DE
    cp   $08                                      ;; 20:5EC5 $FE $08
    jr   c, .jr_5ED6                              ;; 20:5EC7 $38 $0D

    xor  a                                        ;; 20:5EC9 $AF
    ld   [wDE06], a                               ;; 20:5ECA $EA $06 $DE
    ld   a, c                                     ;; 20:5ECD $79
    add  $04                                      ;; 20:5ECE $C6 $04
    and  $3C                                      ;; 20:5ED0 $E6 $3C
    ld   [wDE07], a                               ;; 20:5ED2 $EA $07 $DE
    ld   c, a                                     ;; 20:5ED5 $4F

.jr_5ED6
    ld   b, $00                                   ;; 20:5ED6 $06 $00
    ld   hl, InventoryInstrumentCyclingColors     ;; 20:5ED8 $21 $75 $5E
    add  hl, bc                                   ;; 20:5EDB $09
    ld   bc, wBGPal8 + 1*2                        ;; 20:5EDC $01 $4A $DC
    ld   e, $04                                   ;; 20:5EDF $1E $04

.loop_5EE1
    ld   a, [hl+]                                 ;; 20:5EE1 $2A
    ld   [bc], a                                  ;; 20:5EE2 $02
    inc  bc                                       ;; 20:5EE3 $03
    dec  e                                        ;; 20:5EE4 $1D
    ld   a, e                                     ;; 20:5EE5 $7B
    and  a                                        ;; 20:5EE6 $A7
    jr   nz, .loop_5EE1                           ;; 20:5EE7 $20 $F8

    ld   a, $01                                   ;; 20:5EE9 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 20:5EEB $EA $D1 $DD

ret_020_5EEE:
    ret                                           ;; 20:5EEE $C9

InventoryFadeInHandler::
    call func_020_635C                            ;; 20:5EEF $CD $5C $63
    call func_1A39                                ;; 20:5EF2 $CD $39 $1A

    ld   a, [wTransitionSequenceCounter]          ;; 20:5EF5 $FA $6B $C1
    cp   $04                                      ;; 20:5EF8 $FE $04
    jr   nz, .jr_020_5EFF                         ;; 20:5EFA $20 $03
    call IncrementGameplaySubtype_20              ;; 20:5EFC $CD $83 $66
.jr_020_5EFF

    ret                                           ;; 20:5EFF $C9

InventoryCursorLeftRightOffset:: ; Indexed by left/right button press to offset the inventory cursor
    db   $00, $01, $FF

InventoryCursorUpDownOffset::  ; Indexed by up/down button press to offset the inventory cursor
    db   $00, $FE, $02

moveInventoryCursor::
    ld   a, [wInventorySelection]                 ;; 20:5F06 $FA $A3 $DB
    ld   [wC1B6], a                               ;; 20:5F09 $EA $B6 $C1
    ld   a, [wOcarinaMenuOpening]                 ;; 20:5F0C $FA $B8 $C1
    ld   hl, wOcarinaMenuClosing                  ;; 20:5F0F $21 $B9 $C1
    or   [hl]                                     ;; 20:5F12 $B6
    jr   nz, jr_020_5F59                          ;; 20:5F13 $20 $44

    ld   a, [wOcarinaMenuOpen]                    ;; 20:5F15 $FA $B5 $C1
    and  a                                        ;; 20:5F18 $A7
    jr   nz, jr_020_5F38                          ;; 20:5F19 $20 $1D

    ldh  a, [hJoypadState]                        ;; 20:5F1B $F0 $CC
    and  J_RIGHT | J_LEFT                         ;; 20:5F1D $E6 $03
    ld   e, a                                     ;; 20:5F1F $5F
    ld   d, $00                                   ;; 20:5F20 $16 $00
    ld   hl, InventoryCursorLeftRightOffset       ;; 20:5F22 $21 $00 $5F
    add  hl, de                                   ;; 20:5F25 $19
    ld   a, [wInventorySelection]                 ;; 20:5F26 $FA $A3 $DB
    add  [hl]                                     ;; 20:5F29 $86
    cp   INVENTORY_SLOT_COUNT - 2                 ;; 20:5F2A $FE $0A
    jr   c, .jr_5F35                              ;; 20:5F2C $38 $07

    rla                                           ;; 20:5F2E $17
    ld   a, $00                                   ;; 20:5F2F $3E $00
    jr   nc, .jr_5F35                             ;; 20:5F31 $30 $02

    ld   a, INVENTORY_SLOT_COUNT - 3              ;; 20:5F33 $3E $09

.jr_5F35
    ld   [wInventorySelection], a                 ;; 20:5F35 $EA $A3 $DB

jr_020_5F38:
    ldh  a, [hJoypadState]                        ;; 20:5F38 $F0 $CC
    srl  a                                        ;; 20:5F3A $CB $3F
    srl  a                                        ;; 20:5F3C $CB $3F
    and  J_RIGHT | J_LEFT                         ;; 20:5F3E $E6 $03
    ld   e, a                                     ;; 20:5F40 $5F
    ld   d, $00                                   ;; 20:5F41 $16 $00
    ld   hl, InventoryCursorUpDownOffset          ;; 20:5F43 $21 $03 $5F
    add  hl, de                                   ;; 20:5F46 $19
    ld   a, [wInventorySelection]                 ;; 20:5F47 $FA $A3 $DB
    add  [hl]                                     ;; 20:5F4A $86
    cp   INVENTORY_SLOT_COUNT - 2                 ;; 20:5F4B $FE $0A
    jr   c, .jr_5F56                              ;; 20:5F4D $38 $07

    rla                                           ;; 20:5F4F $17
    ld   a, $00                                   ;; 20:5F50 $3E $00
    jr   nc, .jr_5F56                             ;; 20:5F52 $30 $02

    ld   a, INVENTORY_SLOT_COUNT - 3              ;; 20:5F54 $3E $09

.jr_5F56
    ld   [wInventorySelection], a                 ;; 20:5F56 $EA $A3 $DB

jr_020_5F59:
    ldh  a, [hPressedButtonsMask]                 ;; 20:5F59 $F0 $CB
    and  J_UP | J_DOWN | J_LEFT | J_RIGHT         ;; 20:5F5B $E6 $0F
    jr   z, .jr_5F69                              ;; 20:5F5D $28 $0A

    ld   a, [wOcarinaMenuOpen]                    ;; 20:5F5F $FA $B5 $C1
    and  a                                        ;; 20:5F62 $A7
    jr   nz, .jr_5F69                             ;; 20:5F63 $20 $04

    xor  a                                        ;; 20:5F65 $AF
    ld   [wInventoryCursorFrameCounter], a        ;; 20:5F66 $EA $59 $C1

.jr_5F69
    ld   a, [wOcarinaMenuOpen]                    ;; 20:5F69 $FA $B5 $C1
    and  a                                        ;; 20:5F6C $A7
    jr   z, .jr_5F85                              ;; 20:5F6D $28 $16

    ld   a, [wOcarinaMenuOpening]                 ;; 20:5F6F $FA $B8 $C1
    ld   hl, wOcarinaMenuClosing                  ;; 20:5F72 $21 $B9 $C1
    or   [hl]                                     ;; 20:5F75 $B6
    jr   nz, .jr_5F85                             ;; 20:5F76 $20 $0D

    ldh  a, [hJoypadState]                        ;; 20:5F78 $F0 $CC
    and  J_START                                  ;; 20:5F7A $E6 $80
    jr   z, .jr_5F85                              ;; 20:5F7C $28 $07

    ld   a, $01                                   ;; 20:5F7E $3E $01
    ld   [wCloseInventoryAfterOcarinaMenuClosed], a ;; 20:5F80 $EA $BA $C1
    jr   jr_020_5FB2                              ;; 20:5F83 $18 $2D

.jr_5F85
    ld   a, [wInventorySelection]                 ;; 20:5F85 $FA $A3 $DB
    ld   hl, wC1B6                                ;; 20:5F88 $21 $B6 $C1
    cp   [hl]                                     ;; 20:5F8B $BE
    jr   z, jr_020_5FC1                           ;; 20:5F8C $28 $33

    ld   hl, hJingle                              ;; 20:5F8E $21 $F2 $FF
    ld   [hl], JINGLE_MOVE_SELECTION              ;; 20:5F91 $36 $0A
    ld   e, a                                     ;; 20:5F93 $5F
    ld   d, $00                                   ;; 20:5F94 $16 $00
    ld   hl, wInventoryItems.subscreen            ;; 20:5F96 $21 $02 $DB
    add  hl, de                                   ;; 20:5F99 $19
    ld   a, [hl]                                  ;; 20:5F9A $7E
    cp   INVENTORY_OCARINA                        ;; 20:5F9B $FE $09
    jr   nz, jr_020_5FB2                          ;; 20:5F9D $20 $13

    ld   a, [wOcarinaSongFlags]                   ;; 20:5F9F $FA $49 $DB
    and  a                                        ;; 20:5FA2 $A7
    jr   z, jr_020_5FB2                           ;; 20:5FA3 $28 $0D

    ld   a, TILESET_LOAD_INVENTORY_SONG_1         ;; 20:5FA5 $3E $08
    ldh  [hNeedsUpdatingBGTiles], a               ;; 20:5FA7 $E0 $90
    ld   a, $10                                   ;; 20:5FA9 $3E $10
    ld   [wOcarinaMenuOpening], a                 ;; 20:5FAB $EA $B8 $C1
    ld   a, $01                                   ;; 20:5FAE $3E $01
    jr   jr_020_5FBE                              ;; 20:5FB0 $18 $0C

jr_020_5FB2:
    ld   a, [wOcarinaMenuOpen]                    ;; 20:5FB2 $FA $B5 $C1
    and  a                                        ;; 20:5FB5 $A7
    jr   z, jr_020_5FC1                           ;; 20:5FB6 $28 $09

    ld   a, $10                                   ;; 20:5FB8 $3E $10
    ld   [wOcarinaMenuClosing], a                 ;; 20:5FBA $EA $B9 $C1
    xor  a                                        ;; 20:5FBD $AF

jr_020_5FBE:
    ld   [wOcarinaMenuOpen], a                    ;; 20:5FBE $EA $B5 $C1

jr_020_5FC1:
    ld   hl, wOcarinaMenuClosing                  ;; 20:5FC1 $21 $B9 $C1
    ld   a, [wOcarinaMenuOpening]                 ;; 20:5FC4 $FA $B8 $C1
    or   [hl]                                     ;; 20:5FC7 $B6
    jp   nz, ret_020_604A                         ;; 20:5FC8 $C2 $4A $60

    ldh  a, [hJoypadState]                        ;; 20:5FCB $F0 $CC
    and  J_A                                      ;; 20:5FCD $E6 $10
    jr   z, jr_020_5FED                           ;; 20:5FCF $28 $1C

    ld   a, [wInventoryItems.AButtonSlot]         ;; 20:5FD1 $FA $01 $DB
    push af                                       ;; 20:5FD4 $F5
    ld   hl, wInventoryItems.subscreen            ;; 20:5FD5 $21 $02 $DB
    ld   a, [wInventorySelection]                 ;; 20:5FD8 $FA $A3 $DB

label_020_5FDB:
    ld   c, a                                     ;; 20:5FDB $4F
    ld   b, $00                                   ;; 20:5FDC $06 $00
    add  hl, bc                                   ;; 20:5FDE $09
    ld   a, [hl]                                  ;; 20:5FDF $7E
    ld   [wInventoryItems.AButtonSlot], a         ;; 20:5FE0 $EA $01 $DB
    pop  af                                       ;; 20:5FE3 $F1
    ld   [hl], a                                  ;; 20:5FE4 $77
    ld   c, $01                                   ;; 20:5FE5 $0E $01
    ld   b, $00                                   ;; 20:5FE7 $06 $00
    ld   e, $00                                   ;; 20:5FE9 $1E $00
    jr   jr_020_600D                              ;; 20:5FEB $18 $20

jr_020_5FED:
    ldh  a, [hJoypadState]                        ;; 20:5FED $F0 $CC
    and  J_B                                      ;; 20:5FEF $E6 $20
    jr   z, ret_020_604A                          ;; 20:5FF1 $28 $57

    ld   a, [wInventoryItems.BButtonSlot]         ;; 20:5FF3 $FA $00 $DB
    push af                                       ;; 20:5FF6 $F5
    ld   hl, wInventoryItems.subscreen            ;; 20:5FF7 $21 $02 $DB
    ld   a, [wInventorySelection]                 ;; 20:5FFA $FA $A3 $DB
    ld   c, a                                     ;; 20:5FFD $4F
    ld   b, $00                                   ;; 20:5FFE $06 $00
    add  hl, bc                                   ;; 20:6000 $09
    ld   a, [hl]                                  ;; 20:6001 $7E
    ld   [wInventoryItems.BButtonSlot], a         ;; 20:6002 $EA $00 $DB
    pop  af                                       ;; 20:6005 $F1
    ld   [hl], a                                  ;; 20:6006 $77
    ld   c, $00                                   ;; 20:6007 $0E $00
    ld   b, $00                                   ;; 20:6009 $06 $00
    ld   e, $FF                                   ;; 20:600B $1E $FF

jr_020_600D:
    cp   INVENTORY_OCARINA                        ;; 20:600D $FE $09
    jr   nz, .jr_6027                             ;; 20:600F $20 $16

    ld   a, [wOcarinaSongFlags]                   ;; 20:6011 $FA $49 $DB
    and  a                                        ;; 20:6014 $A7
    jr   z, .jr_6027                              ;; 20:6015 $28 $10

    ld   a, TILESET_LOAD_INVENTORY_SONG_1         ;; 20:6017 $3E $08
    ldh  [hNeedsUpdatingBGTiles], a               ;; 20:6019 $E0 $90
    ld   a, $10                                   ;; 20:601B $3E $10
    ld   [wOcarinaMenuOpening], a                 ;; 20:601D $EA $B8 $C1
    ld   a, $01                                   ;; 20:6020 $3E $01
    ld   [wOcarinaMenuOpen], a                    ;; 20:6022 $EA $B5 $C1
    jr   jr_020_6036                              ;; 20:6025 $18 $0F

.jr_6027
    ld   a, [wOcarinaMenuOpen]                    ;; 20:6027 $FA $B5 $C1
    and  a                                        ;; 20:602A $A7
    jr   z, jr_020_6036                           ;; 20:602B $28 $09

    xor  a                                        ;; 20:602D $AF
    ld   [wOcarinaMenuOpen], a                    ;; 20:602E $EA $B5 $C1
    ld   a, $10                                   ;; 20:6031 $3E $10
    ld   [wOcarinaMenuClosing], a                 ;; 20:6033 $EA $B9 $C1

jr_020_6036:
    call DrawInventorySlots                       ;; 20:6036 $CD $9C $5C

func_020_6039:
    ld   a, JINGLE_VALIDATE                       ;; 20:6039 $3E $13
    ldh  [hJingle], a                             ;; 20:603B $E0 $F2
    ld   a, [wInventorySelection]                 ;; 20:603D $FA $A3 $DB
    add  $02                                      ;; 20:6040 $C6 $02
    ld   c, a                                     ;; 20:6042 $4F
    ld   b, $00                                   ;; 20:6043 $06 $00
    dec  a                                        ;; 20:6045 $3D
    ld   e, a                                     ;; 20:6046 $5F
    call DrawInventorySlots                       ;; 20:6047 $CD $9C $5C

ret_020_604A:
    ret                                           ;; 20:604A $C9

Data_020_604B::
    ; @TODO This is a big block of data for the ocarina song selection popup
    ; involving how it animates and draws on the subscreen
    db   $F8, $F0, $22, $01, $F8, $F8, $22, $21, $F8, $00, $24, $02, $F8, $08, $24, $22
    db   $F8, $10, $26, $00, $F8, $18, $26, $20, $08, $F0, $20, $00, $08, $F8, $20, $00
    db   $08, $00, $20, $00, $08, $08, $20, $00, $08, $10, $20, $00, $08, $18, $20, $00
    db   $FB, $F4, $20, $00, $FB, $FC, $20, $20, $FB, $00, $20, $00, $FB, $08, $20, $20
    db   $FB, $0C, $20, $00, $FB, $14, $20, $20, $05, $F4, $20, $00, $05, $FC, $20, $00
    db   $05, $00, $20, $00, $05, $08, $20, $00, $05, $0C, $20, $00, $05, $14, $20, $00
    db   $FD, $F8, $20, $00, $FD, $10, $20, $20, $FD, $00, $20, $00, $FD, $08, $20, $20
    db   $FD, $08, $20, $00, $FD, $10, $20, $20, $03, $F8, $20, $00, $03, $10, $20, $00
    db   $03, $00, $20, $00, $03, $08, $20, $00, $03, $08, $20, $00, $03, $10, $20, $00
    db   $00, $00, $20, $00, $00, $08, $20, $20, $00, $00, $20, $00, $00, $08, $20, $20
    db   $00, $00, $20, $00, $00, $08, $20, $20, $00, $00, $20, $00, $00, $08, $20, $00
    db   $00, $00, $20, $00, $00, $08, $20, $00, $00, $00, $20, $00, $00, $08, $20, $00

Data_020_610B::
    db   $50, $60, $70

Data_020_610E::
    db   $04, $02, $01

func_020_6111::
    ld   a, [wOcarinaMenuClosing]
    and  a                                        ;; 20:6114 $A7
    jr   z, jr_020_6131                           ;; 20:6115 $28 $1A

    dec  a                                        ;; 20:6117 $3D
    ld   [wOcarinaMenuClosing], a                 ;; 20:6118 $EA $B9 $C1
    jr   nz, jr_020_612E                          ;; 20:611B $20 $11

    ld   hl, hNeedsUpdatingBGTiles                ;; 20:611D $21 $90 $FF
    ld   [hl], TILESET_LOAD_SHARED_GFX_1          ;; 20:6120 $36 $0B
    ld   a, [wCloseInventoryAfterOcarinaMenuClosed] ;; 20:6122 $FA $BA $C1
    and  a                                        ;; 20:6125 $A7
    jr   z, .ret_612D                             ;; 20:6126 $28 $05

    ld   a, GAMEPLAY_INVENTORY_FADE_OUT           ;; 20:6128 $3E $0C
    ld   [wGameplaySubtype], a                    ;; 20:612A $EA $96 $DB

.ret_612D
    ret                                           ;; 20:612D $C9

jr_020_612E:
    cpl                                           ;; 20:612E $2F
    jr   jr_020_613B                              ;; 20:612F $18 $0A

jr_020_6131:
    ld   a, [wOcarinaMenuOpening]                 ;; 20:6131 $FA $B8 $C1
    and  a                                        ;; 20:6134 $A7
    jr   z, jr_020_6141                           ;; 20:6135 $28 $0A

    dec  a                                        ;; 20:6137 $3D
    ld   [wOcarinaMenuOpening], a                 ;; 20:6138 $EA $B8 $C1

jr_020_613B:
    rra                                           ;; 20:613B $1F
    rra                                           ;; 20:613C $1F
    and  $03                                      ;; 20:613D $E6 $03
    jr   jr_020_614A                              ;; 20:613F $18 $09

jr_020_6141:
    ld   a, [wOcarinaMenuOpen]                    ;; 20:6141 $FA $B5 $C1
    and  a                                        ;; 20:6144 $A7
    jp   z, ret_020_6214                          ;; 20:6145 $CA $14 $62

    ld   a, $00                                   ;; 20:6148 $3E $00

jr_020_614A:
    ld   [wC1B7], a                               ;; 20:614A $EA $B7 $C1
    ld   a, [wC1B7]                               ;; 20:614D $FA $B7 $C1
    ld   d, $00                                   ;; 20:6150 $16 $00
    sla  a                                        ;; 20:6152 $CB $27
    sla  a                                        ;; 20:6154 $CB $27
    sla  a                                        ;; 20:6156 $CB $27
    sla  a                                        ;; 20:6158 $CB $27
    ld   e, a                                     ;; 20:615A $5F
    sla  a                                        ;; 20:615B $CB $27
    add  e                                        ;; 20:615D $83
    ld   e, a                                     ;; 20:615E $5F
    ld   hl, Data_020_604B                        ;; 20:615F $21 $4B $60
    add  hl, de                                   ;; 20:6162 $19
    ld   de, wOAMBuffer+$18                       ;; 20:6163 $11 $18 $C0
    ld   c, $0C                                   ;; 20:6166 $0E $0C
    ld   b, $04                                   ;; 20:6168 $06 $04

jr_020_616A:
    ld   a, [hl+]                                 ;; 20:616A $2A
    add  $30                                      ;; 20:616B $C6 $30
    ld   [de], a                                  ;; 20:616D $12
    inc  de                                       ;; 20:616E $13
    ld   a, [hl+]                                 ;; 20:616F $2A
    add  $60                                      ;; 20:6170 $C6 $60
    ld   [de], a                                  ;; 20:6172 $12
    inc  de                                       ;; 20:6173 $13
    ld   a, [hl+]                                 ;; 20:6174 $2A
    ld   [de], a                                  ;; 20:6175 $12
    inc  de                                       ;; 20:6176 $13
    cp   $22                                      ;; 20:6177 $FE $22
    jr   z, .jr_6185                              ;; 20:6179 $28 $0A

    cp   $24                                      ;; 20:617B $FE $24
    jr   z, jr_020_6189                           ;; 20:617D $28 $0A

    cp   $26                                      ;; 20:617F $FE $26
    jr   z, jr_020_618D                           ;; 20:6181 $28 $0A

    jr   jr_020_619A                              ;; 20:6183 $18 $15

.jr_6185
    ld   b, $04                                   ;; 20:6185 $06 $04
    jr   jr_020_618F                              ;; 20:6187 $18 $06

jr_020_6189:
    ld   b, $02                                   ;; 20:6189 $06 $02
    jr   jr_020_618F                              ;; 20:618B $18 $02

jr_020_618D:
    ld   b, $01                                   ;; 20:618D $06 $01

jr_020_618F:
    ld   a, [wOcarinaSongFlags]                   ;; 20:618F $FA $49 $DB
    and  b                                        ;; 20:6192 $A0
    jr   nz, jr_020_619A                          ;; 20:6193 $20 $05

    dec  de                                       ;; 20:6195 $1B
    ld   a, $20                                   ;; 20:6196 $3E $20
    ld   [de], a                                  ;; 20:6198 $12
    inc  de                                       ;; 20:6199 $13

jr_020_619A:
    ld   a, [hl+]                                 ;; 20:619A $2A
    ld   [de], a                                  ;; 20:619B $12
    inc  de                                       ;; 20:619C $13
    dec  c                                        ;; 20:619D $0D
    jr   nz, jr_020_616A                          ;; 20:619E $20 $CA

    ld   a, [wC1B7]                               ;; 20:61A0 $FA $B7 $C1
    cp   $00                                      ;; 20:61A3 $FE $00
    jr   nz, ret_020_6214                         ;; 20:61A5 $20 $6D

    ldh  a, [hJoypadState]                        ;; 20:61A7 $F0 $CC
    and  J_RIGHT                                  ;; 20:61A9 $E6 $01
    jr   z, jr_020_61C5                           ;; 20:61AB $28 $18

jr_020_61AD:
    ld   hl, wSelectedSongIndex                   ;; 20:61AD $21 $4A $DB
    ld   a, [hl]                                  ;; 20:61B0 $7E
    inc  a                                        ;; 20:61B1 $3C
    cp   $03                                      ;; 20:61B2 $FE $03
    jr   nz, .jr_61B7                             ;; 20:61B4 $20 $01

    xor  a                                        ;; 20:61B6 $AF

.jr_61B7
    ld   [hl], a                                  ;; 20:61B7 $77
    ld   e, a                                     ;; 20:61B8 $5F
    ld   d, $00                                   ;; 20:61B9 $16 $00
    ld   hl, Data_020_610E                        ;; 20:61BB $21 $0E $61
    add  hl, de                                   ;; 20:61BE $19
    ld   a, [wOcarinaSongFlags]                   ;; 20:61BF $FA $49 $DB
    and  [hl]                                     ;; 20:61C2 $A6
    jr   z, jr_020_61AD                           ;; 20:61C3 $28 $E8

jr_020_61C5:
    ldh  a, [hJoypadState]                        ;; 20:61C5 $F0 $CC
    and  J_LEFT                                   ;; 20:61C7 $E6 $02
    jr   z, jr_020_61E4                           ;; 20:61C9 $28 $19

jr_020_61CB:
    ld   hl, wSelectedSongIndex                   ;; 20:61CB $21 $4A $DB
    ld   a, [hl]                                  ;; 20:61CE $7E
    dec  a                                        ;; 20:61CF $3D
    cp   $80                                      ;; 20:61D0 $FE $80
    jr   c, .jr_61D6                              ;; 20:61D2 $38 $02

    ld   a, $02                                   ;; 20:61D4 $3E $02

.jr_61D6
    ld   [hl], a                                  ;; 20:61D6 $77
    ld   e, a                                     ;; 20:61D7 $5F
    ld   d, $00                                   ;; 20:61D8 $16 $00
    ld   hl, Data_020_610E                        ;; 20:61DA $21 $0E $61
    add  hl, de                                   ;; 20:61DD $19
    ld   a, [wOcarinaSongFlags]                   ;; 20:61DE $FA $49 $DB
    and  [hl]                                     ;; 20:61E1 $A6
    jr   z, jr_020_61CB                           ;; 20:61E2 $28 $E7

jr_020_61E4:
    ldh  a, [hJoypadState]                        ;; 20:61E4 $F0 $CC
    and  J_RIGHT | J_LEFT                         ;; 20:61E6 $E6 $03
    jr   z, .jr_61ED                              ;; 20:61E8 $28 $03

    call func_020_6039                            ;; 20:61EA $CD $39 $60

.jr_61ED
    ld   hl, wOAMBuffer+$10                       ;; 20:61ED $21 $10 $C0
    ld   a, $38                                   ;; 20:61F0 $3E $38
    ld   [hl+], a                                 ;; 20:61F2 $22
    push hl                                       ;; 20:61F3 $E5
    ld   a, [wSelectedSongIndex]                  ;; 20:61F4 $FA $4A $DB
    ld   e, a                                     ;; 20:61F7 $5F
    ld   d, $00                                   ;; 20:61F8 $16 $00
    ld   hl, Data_020_610B                        ;; 20:61FA $21 $0B $61
    add  hl, de                                   ;; 20:61FD $19
    ld   a, [hl]                                  ;; 20:61FE $7E
    pop  hl                                       ;; 20:61FF $E1
    ld   [hl+], a                                 ;; 20:6200 $22
    push af                                       ;; 20:6201 $F5
    ld   a, $28                                   ;; 20:6202 $3E $28
    ld   [hl+], a                                 ;; 20:6204 $22
    ld   a, $06                                   ;; 20:6205 $3E $06
    ld   [hl+], a                                 ;; 20:6207 $22
    ld   a, $38                                   ;; 20:6208 $3E $38
    ld   [hl+], a                                 ;; 20:620A $22
    pop  af                                       ;; 20:620B $F1
    add  $08                                      ;; 20:620C $C6 $08
    ld   [hl+], a                                 ;; 20:620E $22
    ld   a, $28                                   ;; 20:620F $3E $28
    ld   [hl+], a                                 ;; 20:6211 $22
    ld   [hl], $26                                ;; 20:6212 $36 $26

ret_020_6214:
    ret                                           ;; 20:6214 $C9

func_020_6215::
    ld   a, [wIsIndoor]                           ;; 20:6215 $FA $A5 $DB
    and  a                                        ;; 20:6218 $A7
    jr   z, label_020_628D                        ;; 20:6219 $28 $72

    ldh  a, [hMapId]                              ;; 20:621B $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 20:621D $FE $FF
    jr   z, .jr_6226                              ;; 20:621F $28 $05

    cp   $08                                      ;; 20:6221 $FE $08
    jp   nc, label_020_628D                       ;; 20:6223 $D2 $8D $62

.jr_6226
    ld   a, [wD46B]                               ;; 20:6226 $FA $6B $D4
    and  $F8                                      ;; 20:6229 $E6 $F8
    add  $50                                      ;; 20:622B $C6 $50
    ld   h, a                                     ;; 20:622D $67
    ld   a, [wD46B]                               ;; 20:622E $FA $6B $D4
    rla                                           ;; 20:6231 $17
    rla                                           ;; 20:6232 $17
    rla                                           ;; 20:6233 $17
    and  $38                                      ;; 20:6234 $E6 $38
    add  $60                                      ;; 20:6236 $C6 $60
    ld   l, a                                     ;; 20:6238 $6F
    ld   a, [wMinimapLayout]                      ;; 20:6239 $FA $B0 $DB
    and  $20                                      ;; 20:623C $E6 $20
    jr   z, .jr_624D                              ;; 20:623E $28 $0D

    ld   a, [wD46B]                               ;; 20:6240 $FA $6B $D4
    and  $38                                      ;; 20:6243 $E6 $38
    cp   $20                                      ;; 20:6245 $FE $20
    jr   nc, .jr_624D                             ;; 20:6247 $30 $04

    ld   a, h                                     ;; 20:6249 $7C
    sub  $08                                      ;; 20:624A $D6 $08
    ld   h, a                                     ;; 20:624C $67

.jr_624D
    ld   a, [wMinimapLayout]                      ;; 20:624D $FA $B0 $DB
    and  $10                                      ;; 20:6250 $E6 $10
    jr   z, .jr_6261                              ;; 20:6252 $28 $0D

    ld   a, [wD46B]                               ;; 20:6254 $FA $6B $D4
    and  $07                                      ;; 20:6257 $E6 $07
    cp   $04                                      ;; 20:6259 $FE $04
    jr   c, .jr_6261                              ;; 20:625B $38 $04

    ld   a, l                                     ;; 20:625D $7D
    add  $08                                      ;; 20:625E $C6 $08
    ld   l, a                                     ;; 20:6260 $6F

.jr_6261
    ld   a, h                                     ;; 20:6261 $7C
    ld   [wOAMBuffer], a                          ;; 20:6262 $EA $00 $C0
    ld   a, l                                     ;; 20:6265 $7D
    ld   [wOAMBuffer+1], a                        ;; 20:6266 $EA $01 $C0
    ld   a, $3F                                   ;; 20:6269 $3E $3F
    ld   [wOAMBuffer+2], a                        ;; 20:626B $EA $02 $C0
    ldh  a, [hIsGBC]                              ;; 20:626E $F0 $FE
    and  a                                        ;; 20:6270 $A7
    jr   z, .jr_6285                              ;; 20:6271 $28 $12

    ld   a, $01                                   ;; 20:6273 $3E $01
    ld   [wOAMBuffer+3], a                        ;; 20:6275 $EA $03 $C0
    ldh  a, [hFrameCounter]                       ;; 20:6278 $F0 $E7
    and  $08                                      ;; 20:627A $E6 $08
    jr   z, label_020_628D                        ;; 20:627C $28 $0F

    ld   a, $04                                   ;; 20:627E $3E $04
    ld   [wOAMBuffer+3], a                        ;; 20:6280 $EA $03 $C0
    jr   label_020_628D                           ;; 20:6283 $18 $08

.jr_6285
    ldh  a, [hFrameCounter]                       ;; 20:6285 $F0 $E7
    rla                                           ;; 20:6287 $17
    and  $10                                      ;; 20:6288 $E6 $10
    ld   [wOAMBuffer+3], a                        ;; 20:628A $EA $03 $C0

label_020_628D:
    ret                                           ;; 20:628D $C9

Data_020_628E::
    db   $08, $28, $08, $28, $08, $28, $08, $28, $08, $28

Data_020_6298::
    db   $28, $28, $40, $40, $58, $58, $70, $70, $88, $88

func_020_62A2::
    ld   a, [wInventoryCursorFrameCounter]        ;; 20:62A2 $FA $59 $C1
    inc  a                                        ;; 20:62A5 $3C
    ld   [wInventoryCursorFrameCounter], a        ;; 20:62A6 $EA $59 $C1
    and  $10                                      ;; 20:62A9 $E6 $10
    jr   nz, ret_020_62DD                         ;; 20:62AB $20 $30

    ld   a, [wInventorySelection]                 ;; 20:62AD $FA $A3 $DB
    ld   e, a                                     ;; 20:62B0 $5F
    ld   d, $00                                   ;; 20:62B1 $16 $00
    ld   hl, Data_020_6298                        ;; 20:62B3 $21 $98 $62
    add  hl, de                                   ;; 20:62B6 $19
    ld   a, [hl]                                  ;; 20:62B7 $7E
    ld   [wOAMBuffer+4], a                        ;; 20:62B8 $EA $04 $C0
    ld   [wOAMBuffer+8], a                        ;; 20:62BB $EA $08 $C0
    ld   hl, Data_020_628E                        ;; 20:62BE $21 $8E $62

.jr_62C1
    add  hl, de                                   ;; 20:62C1 $19
    ld   a, [hl]                                  ;; 20:62C2 $7E
    ld   [wOAMBuffer+5], a                        ;; 20:62C3 $EA $05 $C0
    add  $20                                      ;; 20:62C6 $C6 $20
    ld   [wOAMBuffer+9], a                        ;; 20:62C8 $EA $09 $C0
    ld   a, $BE                                   ;; 20:62CB $3E $BE
    ld   [wOAMBuffer+6], a                        ;; 20:62CD $EA $06 $C0
    ld   [wOAMBuffer+10], a                       ;; 20:62D0 $EA $0A $C0
    ld   a, $34                                   ;; 20:62D3 $3E $34
    ld   [wOAMBuffer+7], a                        ;; 20:62D5 $EA $07 $C0
    ld   a, $14                                   ;; 20:62D8 $3E $14
    ld   [wOAMBuffer+11], a                       ;; 20:62DA $EA $0B $C0

ret_020_62DD:
    ret                                           ;; 20:62DD $C9

func_020_62DE::
    ld   a, [wDE09]                               ;; 20:62DE $FA $09 $DE
    ld   b, a                                     ;; 20:62E1 $47
    ld   a, [wDE08]                               ;; 20:62E2 $FA $08 $DE
    inc  a                                        ;; 20:62E5 $3C
    ld   [wDE08], a                               ;; 20:62E6 $EA $08 $DE
    cp   $10                                      ;; 20:62E9 $FE $10
    jr   c, .jr_62F2                              ;; 20:62EB $38 $05

    xor  a                                        ;; 20:62ED $AF
    ld   [wDE08], a                               ;; 20:62EE $EA $08 $DE
    inc  b                                        ;; 20:62F1 $04

.jr_62F2
    ld   a, b                                     ;; 20:62F2 $78
    ld   [wDE09], a                               ;; 20:62F3 $EA $09 $DE
    ldh  [hFreeWarpDataAddress], a                ;; 20:62F6 $E0 $E6
    ld   hl, wDynamicOAMBuffer+$20                ;; 20:62F8 $21 $50 $C0
    ld   b, $4A                                   ;; 20:62FB $06 $4A
    ld   c, $53                                   ;; 20:62FD $0E $53
    ld   d, $08                                   ;; 20:62FF $16 $08
    ld   a, $90                                   ;; 20:6301 $3E $90
    ld   [hl+], a                                 ;; 20:6303 $22
    ld   a, c                                     ;; 20:6304 $79
    ld   [hl+], a                                 ;; 20:6305 $22
    add  $08                                      ;; 20:6306 $C6 $08
    ld   c, a                                     ;; 20:6308 $4F
    ld   a, b                                     ;; 20:6309 $78
    inc  b                                        ;; 20:630A $04
    inc  b                                        ;; 20:630B $04
    ld   [hl+], a                                 ;; 20:630C $22
    ld   a, $26                                   ;; 20:630D $3E $26
    ld   [hl+], a                                 ;; 20:630F $22
    ldh  a, [hFreeWarpDataAddress]                ;; 20:6310 $F0 $E6
    and  $03                                      ;; 20:6312 $E6 $03
    jr   nz, .loop_631A                           ;; 20:6314 $20 $04

    ld   c, $9B                                   ;; 20:6316 $0E $9B
    jr   jr_020_632E                              ;; 20:6318 $18 $14

.loop_631A
    ld   a, $90                                   ;; 20:631A $3E $90
    ld   [hl+], a                                 ;; 20:631C $22
    ld   a, c                                     ;; 20:631D $79
    ld   [hl+], a                                 ;; 20:631E $22
    add  $08                                      ;; 20:631F $C6 $08
    ld   c, a                                     ;; 20:6321 $4F
    ld   a, b                                     ;; 20:6322 $78
    ld   [hl+], a                                 ;; 20:6323 $22
    inc  b                                        ;; 20:6324 $04
    inc  b                                        ;; 20:6325 $04
    ld   a, $06                                   ;; 20:6326 $3E $06
    ld   [hl+], a                                 ;; 20:6328 $22
    dec  d                                        ;; 20:6329 $15
    ld   a, d                                     ;; 20:632A $7A
    and  a                                        ;; 20:632B $A7
    jr   nz, .loop_631A                           ;; 20:632C $20 $EC

jr_020_632E:
    ld   a, $90                                   ;; 20:632E $3E $90
    ld   [hl+], a                                 ;; 20:6330 $22
    ld   a, c                                     ;; 20:6331 $79
    ld   [hl+], a                                 ;; 20:6332 $22
    ld   a, $4A                                   ;; 20:6333 $3E $4A
    ld   [hl+], a                                 ;; 20:6335 $22
    ld   a, $26                                   ;; 20:6336 $3E $26
    ld   [hl], a                                  ;; 20:6338 $77
    ret                                           ;; 20:6339 $C9

Data_020_633A::
    db   $10, $38, $10, $30, $10, $30, $10, $30, $10, $30, $10, $30

Data_020_6346::
    db   $0E, $0E, $26, $26, $3E, $3E, $56, $56, $6E, $6E, $86, $86

func_020_6352::
IF __PATCH_0__
    ldh  a, [hIsGBC]
    and  a
    jr   nz, jr_020_6369
ENDC
    ld   a, [wBGPalette]                          ;; 20:6352 $FA $97 $DB

.jr_6355
    cp   $E4                                      ;; 20:6355 $FE $E4
    ret  c                                        ;; 20:6357 $D8

jr_020_6369:
    ld   d, $02                                   ;; 20:6358 $16 $02
    jr   jr_020_635E                              ;; 20:635A $18 $02

func_020_635C::
    ld   d, $0C                                   ;; 20:635C $16 $0C

jr_020_635E:
    ld   hl, wInventoryItems.BButtonSlot          ;; 20:635E $21 $00 $DB
    ld   e, $00                                   ;; 20:6361 $1E $00

.loop_6363
    ld   a, [hl+]                                 ;; 20:6363 $2A
    cp   INVENTORY_SWORD                          ;; 20:6364 $FE $01
    jr   z, .jr_636E                              ;; 20:6366 $28 $06

    inc  e                                        ;; 20:6368 $1C
    ld   a, e                                     ;; 20:6369 $7B
    cp   d                                        ;; 20:636A $BA
    jr   nz, .loop_6363                           ;; 20:636B $20 $F6

    ret                                           ;; 20:636D $C9

.jr_636E
    ld   d, $00                                   ;; 20:636E $16 $00
    ld   hl, Data_020_633A                        ;; 20:6370 $21 $3A $63
    add  hl, de                                   ;; 20:6373 $19
    ld   a, [hl]                                  ;; 20:6374 $7E
    ldh  [hMultiPurpose0], a                      ;; 20:6375 $E0 $D7
    ld   hl, Data_020_6346                        ;; 20:6377 $21 $46 $63
    add  hl, de                                   ;; 20:637A $19
    ld   a, [hl]                                  ;; 20:637B $7E
    ldh  [hMultiPurpose1], a                      ;; 20:637C $E0 $D8
    ld   a, [wActivePowerUp]                      ;; 20:637E $FA $7C $D4
    dec  a                                        ;; 20:6381 $3D
    jr   nz, jr_020_63BE                          ;; 20:6382 $20 $3A

    ldh  a, [hFrameCounter]                       ;; 20:6384 $F0 $E7
    and  $08                                      ;; 20:6386 $E6 $08
    jr   nz, jr_020_63BE                          ;; 20:6388 $20 $34

    ld   a, [wOAMNextAvailableSlot]               ;; 20:638A $FA $C0 $C3
    ld   e, a                                     ;; 20:638D $5F
    ld   d, $00                                   ;; 20:638E $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 20:6390 $21 $30 $C0
    ld   a, [wGameplayType]                       ;; 20:6393 $FA $95 $DB
    cp   GAMEPLAY_INVENTORY                       ;; 20:6396 $FE $0C
    jr   nz, .jr_63A1                             ;; 20:6398 $20 $07

    ld   a, [wGameplaySubtype]                    ;; 20:639A $FA $96 $DB
    cp   GAMEPLAY_INVENTORY_DELAY1                ;; 20:639D $FE $02
    jr   nc, jr_020_63A2                          ;; 20:639F $30 $01

.jr_63A1
    add  hl, de                                   ;; 20:63A1 $19

jr_020_63A2:
    ld   a, [wOcarinaMenuOpen]                    ;; 20:63A2 $FA $B5 $C1
    and  a                                        ;; 20:63A5 $A7
    jr   z, .jr_63AB                              ;; 20:63A6 $28 $03

    ; Look at the last entry in wDynamicOAMBuffer
    ld   hl, wDynamicOAMBuffer + (27 * sizeof_OAM_ATTRS) ;; 20:63A8 $21 $9C $C0

.jr_63AB
    ld   a, [wWindowY]                            ;; 20:63AB $FA $9A $DB
    push hl                                       ;; 20:63AE $E5
    ld   hl, hMultiPurpose1                       ;; 20:63AF $21 $D8 $FF
    add  [hl]                                     ;; 20:63B2 $86
    pop  hl                                       ;; 20:63B3 $E1
    ld   [hl+], a                                 ;; 20:63B4 $22
    ldh  a, [hMultiPurpose0]                      ;; 20:63B5 $F0 $D7
    ld   [hl+], a                                 ;; 20:63B7 $22
    ld   a, $04                                   ;; 20:63B8 $3E $04
    ld   [hl+], a                                 ;; 20:63BA $22
    ld   a, $54                                   ;; 20:63BB $3E $54
    ld   [hl+], a                                 ;; 20:63BD $22

jr_020_63BE:
    ld   a, $01                                   ;; 20:63BE $3E $01
    call func_015_7964_trampoline                 ;; 20:63C0 $CD $A0 $3D
    ret                                           ;; 20:63C3 $C9

InventoryInteractiveHandler::
    call func_020_5EB5                            ;; 20:63C4 $CD $B5 $5E
    call func_020_6215                            ;; 20:63C7 $CD $15 $62
    call moveInventoryCursor                      ;; 20:63CA $CD $06 $5F
    call func_020_6111                            ;; 20:63CD $CD $11 $61
    call func_020_62A2                            ;; 20:63D0 $CD $A2 $62
    call func_020_635C                            ;; 20:63D3 $CD $5C $63
    call func_020_62DE                            ;; 20:63D6 $CD $DE $62
    ld   a, [wCloseInventoryAfterOcarinaMenuClosed] ;; 20:63D9 $FA $BA $C1
    and  a                                        ;; 20:63DC $A7
    jr   z, .jr_63F5                              ;; 20:63DD $28 $16

    ld   a, [wGameplaySubtype]                    ;; 20:63DF $FA $96 $DB
    cp   GAMEPLAY_INVENTORY_FADE_OUT              ;; 20:63E2 $FE $0C
    jr   nz, CloseInventory.return                ;; 20:63E4 $20 $5F

    xor  a                                        ;; 20:63E6 $AF
    ld   [wCloseInventoryAfterOcarinaMenuClosed], a ;; 20:63E7 $EA $BA $C1
    ld   [wOcarinaMenuOpen], a                    ;; 20:63EA $EA $B5 $C1
    ld   [wOcarinaMenuOpening], a                 ;; 20:63ED $EA $B8 $C1
    ld   [wOcarinaMenuClosing], a                 ;; 20:63F0 $EA $B9 $C1
    jr   CloseInventory                           ;; 20:63F3 $18 $41

.jr_63F5
    ; POI: Debug tool 3 check to enable free movement mode on the subscreen
    ; and resetting the photo album on pushing Select
    ldh  a, [hJoypadState]                        ;; 20:63F5 $F0 $CC
    and  J_SELECT                                 ;; 20:63F7 $E6 $40
    jr   z, jr_020_641E                           ;; 20:63F9 $28 $23

    ld   a, GAMEPLAY_INVENTORY_STATUS_IN          ;; 20:63FB $3E $09
    ld   [wGameplaySubtype], a                    ;; 20:63FD $EA $96 $DB
    ld   a, $90                                   ;; 20:6400 $3E $90
    ld   [wDE0A], a                               ;; 20:6402 $EA $0A $DE
    ld   a, [ROM_DebugTool3]                      ;; 20:6405 $FA $05 $00
    and  a                                        ;; 20:6408 $A7
    jr   z, .jr_641C                              ;; 20:6409 $28 $11

    ld   a, [wFreeMovementMode]                   ;; 20:640B $FA $7B $C1
    xor  $01                                      ;; 20:640E $EE $01
    ld   [wFreeMovementMode], a                   ;; 20:6410 $EA $7B $C1

IF !__PATCH_3__
    ld   a, $01                                   ;; 20:6413 $3E $01
    ld   [wPhotos1], a                            ;; 20:6415 $EA $0C $DC
    xor  a                                        ;; 20:6418 $AF
    ld   [wPhotos2], a                            ;; 20:6419 $EA $0D $DC
ENDC

.jr_641C
    jr   CloseInventory.return                    ;; 20:641C $18 $27

jr_020_641E:
    ld   a, [wOcarinaMenuOpen]                    ;; 20:641E $FA $B5 $C1
    ld   hl, wOcarinaMenuOpening                  ;; 20:6421 $21 $B8 $C1
    or   [hl]                                     ;; 20:6424 $B6
    ld   hl, wOcarinaMenuClosing                  ;; 20:6425 $21 $B9 $C1
    or   [hl]                                     ;; 20:6428 $B6
    jr   nz, CloseInventory.return                ;; 20:6429 $20 $1A

    ldh  a, [hJoypadState]                        ;; 20:642B $F0 $CC
    and  J_START                                  ;; 20:642D $E6 $80
    jr   z, CloseInventory.return                 ;; 20:642F $28 $14

    ld   a, GAMEPLAY_INVENTORY_FADE_OUT           ;; 20:6431 $3E $0C
    ld   [wGameplaySubtype], a                    ;; 20:6433 $EA $96 $DB

CloseInventory:
    xor  a                                        ;; 20:6436 $AF
    ld   [wTransitionSequenceCounter], a          ;; 20:6437 $EA $6B $C1
    ld   [wC16C], a                               ;; 20:643A $EA $6C $C1
    inc  a                                        ;; 20:643D $3C
    ld   [wPaletteUnknownE], a                    ;; 20:643E $EA $D5 $DD
    ld   a, JINGLE_CLOSE_INVENTORY                ;; 20:6441 $3E $12
    ldh  [hJingle], a                             ;; 20:6443 $E0 $F2
.return:
    ret                                           ;; 20:6445 $C9

func_020_6446::
    ldh  a, [hMultiPurposeB]                      ;; 20:6446 $F0 $E2
    ld   [hl+], a                                 ;; 20:6448 $22
    ldh  a, [hBGMapOffsetLow]                     ;; 20:6449 $F0 $E1
    ld   [hl+], a                                 ;; 20:644B $22
    add  $08                                      ;; 20:644C $C6 $08
    ldh  [hBGMapOffsetLow], a                     ;; 20:644E $E0 $E1
    ld   a, [de]                                  ;; 20:6450 $1A
    ld   [hl+], a                                 ;; 20:6451 $22
    inc  de                                       ;; 20:6452 $13
    ld   a, [de]                                  ;; 20:6453 $1A
    ld   [hl+], a                                 ;; 20:6454 $22
    inc  de                                       ;; 20:6455 $13
    dec  c                                        ;; 20:6456 $0D
    ld   a, c                                     ;; 20:6457 $79
    and  a                                        ;; 20:6458 $A7
    jr   nz, func_020_6446                        ;; 20:6459 $20 $EB

    ret                                           ;; 20:645B $C9

GreenTunicStatusOAMData::
    db   $40, OAM_GBC_PAL_5              ; left green tunic
    db   $40, OAM_GBC_PAL_5 | OAMF_XFLIP ; right green tunic
    db   $5C, OAM_GBC_PAL_3              ; left "WEAR G"
    db   $5E, OAM_GBC_PAL_3              ; right "WEAR G"

RedTunicStatusOAMData::
    db   $40, OAM_GBC_PAL_6              ; left red tunic
    db   $40, OAM_GBC_PAL_6 | OAMF_XFLIP ; right red tunic
    db   $60, OAM_GBC_PAL_3              ; left "WEAR R"
    db   $62, OAM_GBC_PAL_3              ; right "WEAR R"

BlueTunicStatusOAMData::
    db   $40, OAM_GBC_PAL_7              ; left blue tunic
    db   $40, OAM_GBC_PAL_7 | OAMF_XFLIP ; right blue tunic
    db   $64, OAM_GBC_PAL_3              ; left "WEAR B"
    db   $7E, OAM_GBC_PAL_3              ; right "WEAR B"

TunicStatusOAMTable::
    dw   GreenTunicStatusOAMData
    dw   RedTunicStatusOAMData
    dw   BlueTunicStatusOAMData

Data_020_647A::
    db   $42, $06, $42, $26, $66, $03, $7A, $03, $6E, $03

Data_020_6484::
    db   $46, $06, $42, $26, $68, $03, $7A, $03, $6E, $03

Data_020_648E::
    db   $44, $06, $42, $26, $6A, $03, $7A, $03, $6E, $03

Data_020_6498::
    db   $44, $06, $46, $26, $6C, $03, $7A, $03, $6E, $03

Data_020_64A2::
    dw   Data_020_647A
    dw   Data_020_6484
    dw   Data_020_648E
    dw   Data_020_6498

Data_020_64AA::
    db   $7C, $03, $48, $03, $48, $23

Data_020_64B0::
    db   $66, $03
    db   $66, $03, $66, $03, $68, $03, $66, $03   ;; 20:64B2
    db   $6A, $03, $66, $03, $6C, $03, $66, $03   ;; 20:64BA
    db   $6E, $03, $66, $03, $70, $03, $66, $03   ;; 20:64C2
    db   $72, $03, $66, $03, $74, $03, $66, $03   ;; 20:64CA
    db   $76, $03, $66, $03, $78, $03, $68, $03   ;; 20:64D2
    db   $66, $03, $68, $03, $68, $03, $68, $03   ;; 20:64DA
    db   $6A, $03

Data_020_64E4::
    db   $7A, $03, $68, $03, $6A, $03   ;; 20:64E2
    db   $7C, $03, $7C, $03                       ;; 20:64EA

; Draw the inventory status window that appears when you hold SELECT
RenderInventoryStatus::
    ld   hl, wOAMBuffer+$10                       ;; 20:64EE $21 $10 $C0
    ld   a, $53                                   ;; 20:64F1 $3E $53
    ldh  [hBGMapOffsetLow], a                     ;; 20:64F3 $E0 $E1
    ld   a, [wDE0A]                               ;; 20:64F5 $FA $0A $DE
    ldh  [hMultiPurposeB], a                      ;; 20:64F8 $E0 $E2
    push hl                                       ;; 20:64FA $E5
    ld   c, $04                                   ;; 20:64FB $0E $04
    ld   hl, TunicStatusOAMTable                  ;; 20:64FD $21 $74 $64
    ld   a, [wTunicType]                          ;; 20:6500 $FA $0F $DC
    sla  a                                        ;; 20:6503 $CB $27
    ld   e, a                                     ;; 20:6505 $5F
    ld   d, $00                                   ;; 20:6506 $16 $00
    add  hl, de                                   ;; 20:6508 $19
    ld   e, [hl]                                  ;; 20:6509 $5E
    inc  hl                                       ;; 20:650A $23
    ld   d, [hl]                                  ;; 20:650B $56
    pop  hl                                       ;; 20:650C $E1
    call func_020_6446                            ;; 20:650D $CD $46 $64
    ldh  a, [hMultiPurposeB]                      ;; 20:6510 $F0 $E2
    ld   [hl+], a                                 ;; 20:6512 $22
    ldh  a, [hBGMapOffsetLow]                     ;; 20:6513 $F0 $E1
    ld   [hl+], a                                 ;; 20:6515 $22
    add  $08                                      ;; 20:6516 $C6 $08
    ldh  [hBGMapOffsetLow], a                     ;; 20:6518 $E0 $E1
    ld   a, $7C                                   ;; 20:651A $3E $7C
    ld   [hl+], a                                 ;; 20:651C $22
    ld   a, $03                                   ;; 20:651D $3E $03
    ld   [hl+], a                                 ;; 20:651F $22
    push hl                                       ;; 20:6520 $E5
    ld   c, $06                                   ;; 20:6521 $0E $06
    ld   de, Data_020_64A2                        ;; 20:6523 $11 $A2 $64
    ld   h, $00                                   ;; 20:6526 $26 $00
    ld   a, [wHeartPiecesCount]                   ;; 20:6528 $FA $5C $DB
    sla  a                                        ;; 20:652B $CB $27
    ld   l, a                                     ;; 20:652D $6F
    add  hl, de                                   ;; 20:652E $19
    ld   e, [hl]                                  ;; 20:652F $5E
    inc  hl                                       ;; 20:6530 $23
    ld   d, [hl]                                  ;; 20:6531 $56
    pop  hl                                       ;; 20:6532 $E1
    call func_020_6446                            ;; 20:6533 $CD $46 $64
    ld   a, $53                                   ;; 20:6536 $3E $53
    ldh  [hBGMapOffsetLow], a                     ;; 20:6538 $E0 $E1
    ld   a, [wDE0A]                               ;; 20:653A $FA $0A $DE
    add  $10                                      ;; 20:653D $C6 $10
    ldh  [hMultiPurposeB], a                      ;; 20:653F $E0 $E2
    ld   c, $03                                   ;; 20:6541 $0E $03
    ld   de, Data_020_64AA                        ;; 20:6543 $11 $AA $64
    call func_020_6446                            ;; 20:6546 $CD $46 $64
    ld   e, $00                                   ;; 20:6549 $1E $00
    ld   a, [wPhotos1]                            ;; 20:654B $FA $0C $DC

jr_020_654E:
    bit  0, a                                     ;; 20:654E $CB $47
    jr   z, .jr_6553                              ;; 20:6550 $28 $01

    inc  e                                        ;; 20:6552 $1C

.jr_6553
    srl  a                                        ;; 20:6553 $CB $3F
    and  a                                        ;; 20:6555 $A7
    jr   nz, jr_020_654E                          ;; 20:6556 $20 $F6

    ld   a, [wPhotos2]                            ;; 20:6558 $FA $0D $DC
    and  $0F                                      ;; 20:655B $E6 $0F

.loop
    bit  0, a                                     ;; 20:655D $CB $47
    jr   z, .jr_020_6562                          ;; 20:655F $28 $01

    inc  e                                        ;; 20:6561 $1C

.jr_020_6562
    srl  a                                        ;; 20:6562 $CB $3F
    and  a                                        ;; 20:6564 $A7

    jr   nz, .loop                                ;; 20:6565 $20 $F6

    ld   d, $00                                   ;; 20:6567 $16 $00
    sla  e                                        ;; 20:6569 $CB $23
    sla  e                                        ;; 20:656B $CB $23
    push hl                                       ;; 20:656D $E5
    ld   c, $02                                   ;; 20:656E $0E $02
    ld   hl, Data_020_64B0                        ;; 20:6570 $21 $B0 $64
    add  hl, de                                   ;; 20:6573 $19
    push hl                                       ;; 20:6574 $E5
    pop  de                                       ;; 20:6575 $D1
    pop  hl                                       ;; 20:6576 $E1
    call func_020_6446                            ;; 20:6577 $CD $46 $64
    ld   c, $05                                   ;; 20:657A $0E $05
    ld   de, Data_020_64E4                        ;; 20:657C $11 $E4 $64
    call func_020_6446                            ;; 20:657F $CD $46 $64
    ret                                           ;; 20:6582 $C9

InventoryStatusInHandler::
    call func_020_5EB5                            ;; 20:6583 $CD $B5 $5E
    call RenderInventoryStatus                    ;; 20:6586 $CD $EE $64
    ldh  a, [hPressedButtonsMask]                 ;; 20:6589 $F0 $CB
    and  J_SELECT                                 ;; 20:658B $E6 $40
    jr   nz, .jr_6596                             ;; 20:658D $20 $07

    ld   a, GAMEPLAY_INVENTORY_STATUS_OUT         ;; 20:658F $3E $0B
    ld   [wGameplaySubtype], a                    ;; 20:6591 $EA $96 $DB
    jr   .return                                  ;; 20:6594 $18 $11

.jr_6596
    ld   a, [wDE0A]                               ;; 20:6596 $FA $0A $DE
    sub  $04                                      ;; 20:6599 $D6 $04
    cp   $78                                      ;; 20:659B $FE $78
    jr   nc, .jr_65A4                             ;; 20:659D $30 $05

    call IncrementGameplaySubtype_20              ;; 20:659F $CD $83 $66
    ld   a, $78                                   ;; 20:65A2 $3E $78

.jr_65A4
    ld   [wDE0A], a                               ;; 20:65A4 $EA $0A $DE

.return:
    ret                                           ;; 20:65A7 $C9

InventoryStatusHandler::
    call func_020_5EB5                            ;; 20:65A8 $CD $B5 $5E
    call RenderInventoryStatus                    ;; 20:65AB $CD $EE $64
    ldh  a, [hPressedButtonsMask]                 ;; 20:65AE $F0 $CB
    and  J_SELECT                                 ;; 20:65B0 $E6 $40
    jr   nz, .ret_65B7                            ;; 20:65B2 $20 $03

    call IncrementGameplaySubtype_20              ;; 20:65B4 $CD $83 $66

.ret_65B7
    ret                                           ;; 20:65B7 $C9

InventoryStatusOutHandler::
    call func_020_5EB5                            ;; 20:65B8 $CD $B5 $5E
    call RenderInventoryStatus                    ;; 20:65BB $CD $EE $64
    ld   a, [wDE0A]                               ;; 20:65BE $FA $0A $DE
    add  $04                                      ;; 20:65C1 $C6 $04
    cp   $90                                      ;; 20:65C3 $FE $90
    jr   c, .jr_65CE                              ;; 20:65C5 $38 $07

    ld   a, GAMEPLAY_INVENTORY_INTERACTIVE        ;; 20:65C7 $3E $08
    ld   [wGameplaySubtype], a                    ;; 20:65C9 $EA $96 $DB
    ld   a, $90                                   ;; 20:65CC $3E $90

.jr_65CE
    ld   [wDE0A], a                               ;; 20:65CE $EA $0A $DE
    ret                                           ;; 20:65D1 $C9

InventoryFadeOutHandler::
    call func_020_635C                            ;; 20:65D2 $CD $5C $63
    call func_1A22                                ;; 20:65D5 $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 20:65D8 $FA $6B $C1
    cp   $04                                      ;; 20:65DB $FE $04
    jp   nz, ret_020_6682                         ;; 20:65DD $C2 $82 $66

    ld   a, $01                                   ;; 20:65E0 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 20:65E2 $EA $D5 $DD
    xor  a                                        ;; 20:65E5 $AF
    ld   [wBlockItemUsage], a                     ;; 20:65E6 $EA $0A $C5
    ld   [wC116], a                               ;; 20:65E9 $EA $16 $C1
    ldh  [hBaseScrollX], a                        ;; 20:65EC $E0 $96
    ldh  [hBaseScrollY], a                        ;; 20:65EE $E0 $97
    ld   [wC167], a                               ;; 20:65F0 $EA $67 $C1
    ld   [wInventoryAppearing], a                 ;; 20:65F3 $EA $4F $C1
    ld   a, $07                                   ;; 20:65F6 $3E $07
    ldh  [hVolumeRight], a                        ;; 20:65F8 $E0 $A9
    ld   a, $70                                   ;; 20:65FA $3E $70
    ldh  [hVolumeLeft], a                         ;; 20:65FC $E0 $AA
    ld   a, GAMEPLAY_WORLD                        ;; 20:65FE $3E $0B
    ld   [wGameplayType], a                       ;; 20:6600 $EA $95 $DB
    ldh  [hContinueMusicAfterWarp], a             ;; 20:6603 $E0 $BC
    ld   a, GAMEPLAY_INVENTORY_DELAY1             ;; 20:6605 $3E $02
    ld   [wGameplaySubtype], a                    ;; 20:6607 $EA $96 $DB
    ld   a, [wIsIndoor]                           ;; 20:660A $FA $A5 $DB
    and  a                                        ;; 20:660D $A7
    ld   a, TILESET_INDOOR                        ;; 20:660E $3E $06
    jr   nz, jr_020_6628                          ;; 20:6610 $20 $16

    ldh  a, [hMapRoom]                            ;; 20:6612 $F0 $F6
    cp   UNKNOWN_ROOM_64                          ;
    jr   nz, useOverworldTileset                  ;; 20:6616 $20 $0E

    ld   hl, wLoadedEntitySpritesheets            ;; 20:6618 $21 $93 $C1
    ld   [hl], $A4                                ;; 20:661B $36 $A4
    inc  hl                                       ;; 20:661D $23
    ld   [hl], $E5                                ;; 20:661E $36 $E5
    inc  hl                                       ;; 20:6620 $23
    ld   [hl], $82                                ;; 20:6621 $36 $82
    inc  hl                                       ;; 20:6623 $23
    ld   [hl], $A2                                ;; 20:6624 $36 $A2

useOverworldTileset:
    ld   a, TILESET_BASE_OVERWORLD_DUP            ;; 20:6626 $3E $07

jr_020_6628:
    ld   [wTilesetToLoad], a                      ;; 20:6628 $EA $FE $D6
    ld   hl, wRoomTransitionState                 ;; 20:662B $21 $24 $C1
    ld   e, $00                                   ;; 20:662E $1E $00

.loop_6630
    xor  a                                        ;; 20:6630 $AF
    ld   [hl+], a                                 ;; 20:6631 $22
    inc  e                                        ;; 20:6632 $1C
    ld   a, e                                     ;; 20:6633 $7B
    cp   $0C                                      ;; 20:6634 $FE $0C
    jr   nz, .loop_6630                           ;; 20:6636 $20 $F8

    ld   a, $80                                   ;; 20:6638 $3E $80
    ld   [wWindowY], a                            ;; 20:663A $EA $9A $DB
    ld   a, $07                                   ;; 20:663D $3E $07
    ldh  [rWX], a                                 ;; 20:663F $E0 $4B
    ld   a, $08                                   ;; 20:6641 $3E $08
    ld   [wSubscreenScrollIncrement], a           ;; 20:6643 $EA $50 $C1
    ld   a, $07                                   ;; 20:6646 $3E $07
    ldh  [hVolumeRight], a                        ;; 20:6648 $E0 $A9
    ld   a, $70                                   ;; 20:664A $3E $70
    ldh  [hVolumeLeft], a                         ;; 20:664C $E0 $AA
    ldh  a, [hIsGBC]                              ;; 20:664E $F0 $FE
    and  a                                        ;; 20:6650 $A7
    jr   z, ret_020_6682                          ;; 20:6651 $28 $2F

    ld   hl, wBGPal1                              ;; 20:6653 $21 $10 $DC
    ld   c, $80                                   ;; 20:6656 $0E $80
    di                                            ;; 20:6658 $F3

.loop_6659
    ld   a, $03                                   ;; 20:6659 $3E $03
    ldh  [rSVBK], a                               ;; 20:665B $E0 $70
    ld   b, [hl]                                  ;; 20:665D $46
    dec  a                                        ;; 20:665E $3D
    ldh  [rSVBK], a                               ;; 20:665F $E0 $70
    ld   [hl], b                                  ;; 20:6661 $70
    inc  hl                                       ;; 20:6662 $23
    dec  c                                        ;; 20:6663 $0D
    ld   a, c                                     ;; 20:6664 $79
    and  a                                        ;; 20:6665 $A7
    jr   nz, .loop_6659                           ;; 20:6666 $20 $F1

    xor  a                                        ;; 20:6668 $AF
    ldh  [rSVBK], a                               ;; 20:6669 $E0 $70
    ld   a, [wLCDControl]                         ;; 20:666B $FA $FD $D6
    and  ~LCDCF_ON                                ;; 20:666E $E6 $7F
    ldh  [rLCDC], a                               ;; 20:6670 $E0 $40
    ldh  a, [hMapId]                              ;; 20:6672 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 20:6674 $FE $FF
    jr   nz, .jr_667C                             ;; 20:6676 $20 $04

    ld   a, TRUE                                  ;; 20:6678 $3E $01
    ldh  [hNeedsUpdatingEntityTilesA], a          ;; 20:667A $E0 $91

.jr_667C
    ld   a, [wLCDControl]                         ;; 20:667C $FA $FD $D6
    ldh  [rLCDC], a                               ;; 20:667F $E0 $40
    ei                                            ;; 20:6681 $FB

label_020_6682:
ret_020_6682:
    ret                                           ;; 20:6682 $C9

IncrementGameplaySubtype_20::
    ld   hl, wGameplaySubtype                     ;; 20:6683 $21 $96 $DB
    inc  [hl]                                     ;; 20:6686 $34
    ret                                           ;; 20:6687 $C9

Data_020_6688::
    db   $00, $08, $48, $02, $00, $00, $40, $02   ;; 20:6688
    db   $00, $00, $FF, $FF, $00, $08, $4A, $02   ;; 20:6690
    db   $00, $00, $4C, $02, $00, $00, $FF, $FF   ;; 20:6698
    db   $00, $00, $4A, $22, $00, $08, $4C, $22   ;; 20:66A0
    db   $00, $08, $FF, $FF, $00, $00, $48, $22   ;; 20:66A8
    db   $00, $08, $40, $22, $00, $08, $FF, $FF   ;; 20:66B0
    db   $00, $0C, $44, $02, $00, $04, $46, $02   ;; 20:66B8
    db   $00, $FC, $40, $02, $00, $FC, $44, $22   ;; 20:66C0
    db   $00, $04, $46, $22, $00, $0C, $40, $22   ;; 20:66C8
    db   $00, $FC, $44, $22, $00, $04, $42, $22   ;; 20:66D0
    db   $00, $0C, $40, $22, $00, $0C, $44, $02   ;; 20:66D8
    db   $00, $04, $42, $02, $00, $FC, $40, $02   ;; 20:66E0
Data_020_66E8::
    db   $00, $08, $48, $00, $00, $00, $40, $00   ;; 20:66E8
    db   $00, $00, $FF, $FF, $00, $08, $4A, $00   ;; 20:66F0
    db   $00, $00, $4C, $00, $00, $00, $FF, $FF   ;; 20:66F8
    db   $00, $00, $4A, $20, $00, $08, $4C, $20   ;; 20:6700
    db   $00, $08, $FF, $FF, $00, $00, $48, $20   ;; 20:6708
    db   $00, $08, $40, $20, $00, $08, $FF, $FF   ;; 20:6710
    db   $00, $0C, $44, $00, $00, $04, $46, $00   ;; 20:6718
    db   $00, $FC, $40, $00, $00, $FC, $44, $20   ;; 20:6720
    db   $00, $04, $46, $20, $00, $0C, $40, $20   ;; 20:6728
    db   $00, $FC, $44, $20, $00, $04, $42, $20   ;; 20:6730
    db   $00, $0C, $40, $20, $00, $0C, $44, $00   ;; 20:6738
    db   $00, $04, $42, $00, $00, $FC, $40, $00   ;; 20:6740
Data_020_6748::
    db   $00, $08, $48, $03, $00, $00, $40, $03   ;; 20:6748
    db   $00, $00, $FF, $FF, $00, $08, $4A, $03   ;; 20:6750
    db   $00, $00, $4C, $03, $00, $00, $FF, $FF   ;; 20:6758
    db   $00, $00, $4A, $23, $00, $08, $4C, $23   ;; 20:6760
    db   $00, $08, $FF, $FF, $00, $00, $48, $23   ;; 20:6768
    db   $00, $08, $40, $23, $00, $08, $FF, $FF   ;; 20:6770
    db   $00, $0C, $44, $03, $00, $04, $46, $03   ;; 20:6778
    db   $00, $FC, $40, $03, $00, $FC, $44, $23   ;; 20:6780
    db   $00, $04, $46, $23, $00, $0C, $40, $23   ;; 20:6788
    db   $00, $FC, $44, $23, $00, $04, $42, $23   ;; 20:6790
    db   $00, $0C, $40, $23, $00, $0C, $44, $03   ;; 20:6798
    db   $00, $04, $42, $03, $00, $FC, $40, $03   ;; 20:67A0
Data_020_67A8::
    db   $00, $00, $4C, $02, $00, $08, $4E, $02   ;; 20:67A8
    db   $00, $00, $FF, $02, $00, $00, $4E, $22   ;; 20:67B0
    db   $00, $08, $4C, $22, $00, $00, $FF, $02   ;; 20:67B8
    db   $00, $00, $50, $02, $00, $08, $5A, $02   ;; 20:67C0
    db   $00, $00, $FF, $02, $00, $00, $5A, $22   ;; 20:67C8
    db   $00, $08, $50, $22, $00, $00, $FF, $02   ;; 20:67D0
Data_020_67D8::
    db   $00, $00, $4C, $00, $00, $08, $4E, $00   ;; 20:67D8
    db   $00, $00, $FF, $00, $00, $00, $4E, $20   ;; 20:67E0
    db   $00, $08, $4C, $20, $00, $00, $FF, $00   ;; 20:67E8
    db   $00, $00, $50, $00, $00, $08, $5A, $00   ;; 20:67F0
    db   $00, $00, $FF, $00, $00, $00, $5A, $20   ;; 20:67F8
    db   $00, $08, $50, $20, $00, $00, $FF, $00   ;; 20:6800
Data_020_6808::
    db   $00, $00, $4C, $03, $00, $08, $4E, $03   ;; 20:6808
    db   $00, $00, $FF, $03, $00, $00, $4E, $23   ;; 20:6810
    db   $00, $08, $4C, $23, $00, $00, $FF, $03   ;; 20:6818
    db   $00, $00, $50, $03, $00, $08, $5A, $03   ;; 20:6820
    db   $00, $00, $FF, $03, $00, $00, $5A, $23   ;; 20:6828
    db   $00, $08, $50, $23, $00, $00, $FF, $03   ;; 20:6830
Data_020_6838::
    db   $00, $00, $78, $03, $00, $08, $7A, $03   ;; 20:6838
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ;; 20:6840
Data_020_6848::
    db   $00, $00, $7C, $03, $00, $08, $7E, $03   ;; 20:6848
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ;; 20:6850
Data_020_6858::
    db   $00, $00, $7A, $23, $00, $08, $78, $23   ;; 20:6858
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ;; 20:6860
Data_020_6868::
    db   $00, $00, $7E, $23, $00, $08, $7C, $23   ;; 20:6868
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ;; 20:6870
Data_020_6878::
    db   $FD, $10, $22, $23, $FD, $FD, $22, $03   ;; 20:6878
    db   $00, $00, $78, $03, $00, $08, $7A, $03   ;; 20:6880
Data_020_6888::
    db   $07, $10, $22, $03, $07, $FD, $22, $23   ;; 20:6888
    db   $FF, $00, $78, $03, $FF, $08, $7A, $03   ;; 20:6890
Data_020_6898::
    db   $FD, $0B, $22, $23, $FD, $F8, $22, $03   ;; 20:6898
    db   $00, $00, $7A, $23, $00, $08, $78, $23   ;; 20:68A0
Data_020_68A8::
    db   $07, $0B, $22, $03, $07, $F8, $22, $23   ;; 20:68A8
    db   $FF, $00, $7A, $23, $FF, $08, $78, $23   ;; 20:68B0
Data_020_68B8::
    db   $F4, $F8, $40, $07, $F4, $00, $42, $07   ;; 20:68B8
    db   $F4, $08, $44, $07, $F4, $10, $46, $07   ;; 20:68C0
    db   $04, $F8, $48, $07, $04, $00, $4A, $07   ;; 20:68C8
    db   $04, $08, $4C, $07, $04, $10, $4E, $07   ;; 20:68D0
Data_020_68D8::
    db   $F4, $10, $40, $27, $F4, $08, $42, $27   ;; 20:68D8
    db   $F4, $00, $44, $27, $F4, $F8, $46, $27   ;; 20:68E0
    db   $04, $10, $48, $27, $04, $08, $4A, $27   ;; 20:68E8
    db   $04, $00, $4C, $27, $04, $F8, $4E, $27   ;; 20:68F0
Data_020_68F8::
    db   $F4, $10, $50, $27, $F4, $08, $52, $27   ;; 20:68F8
    db   $F4, $00, $54, $27, $F4, $F8, $56, $27   ;; 20:6900
    db   $04, $10, $58, $27, $04, $08, $5A, $27   ;; 20:6908
    db   $04, $00, $5C, $27, $04, $F8, $5E, $27   ;; 20:6910
Data_020_6918::
    db   $F4, $F8, $50, $07, $F4, $00, $52, $07   ;; 20:6918
    db   $F4, $08, $54, $07, $F4, $10, $56, $07   ;; 20:6920
    db   $04, $F8, $58, $07, $04, $00, $5A, $07   ;; 20:6928
    db   $04, $08, $5C, $07, $04, $10, $5E, $07   ;; 20:6930
Data_020_6938::
    db   $02, $FC, $40, $07, $02, $04, $42, $07   ;; 20:6938
    db   $02, $0C, $40, $27, $00, $00, $FF, $00   ;; 20:6940
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ;; 20:6948
Data_020_6950::
    db   $F2, $00, $44, $07, $F2, $08, $44, $27   ;; 20:6950
    db   $02, $00, $46, $07, $02, $08, $46, $27   ;; 20:6958
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ;; 20:6960
Data_020_6968::
    db   $F2, $00, $48, $07, $F2, $08, $48, $27   ;; 20:6968
    db   $02, $00, $4A, $07, $02, $08, $4A, $27   ;; 20:6970
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ;; 20:6978
Data_020_6980::
    db   $F2, $00, $4C, $07, $F2, $08, $4C, $27   ;; 20:6980
    db   $02, $F8, $4E, $07, $02, $00, $50, $07   ;; 20:6988
    db   $02, $08, $50, $27, $02, $10, $4E, $27   ;; 20:6990
Data_020_6998::
    db   $F2, $FC, $52, $07, $F2, $04, $56, $07   ;; 20:6998
    db   $F2, $0C, $5A, $07, $02, $FC, $54, $07   ;; 20:69A0
    db   $02, $04, $58, $07, $02, $0C, $5C, $07   ;; 20:69A8
Data_020_69B0::
    db   $F2, $FC, $5A, $27, $F2, $04, $56, $27   ;; 20:69B0
    db   $F2, $0C, $52, $27, $02, $FC, $5C, $27   ;; 20:69B8
    db   $02, $04, $58, $27, $02, $0C, $54, $27   ;; 20:69C0
Data_020_69C8::
    db   $F2, $00, $4C, $04, $F2, $08, $4C, $24   ;; 20:69C8
    db   $02, $F8, $4E, $04, $02, $00, $50, $04   ;; 20:69D0
    db   $02, $08, $50, $24, $02, $10, $4E, $24   ;; 20:69D8
Data_020_69E0::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01   ;; 20:69E0
    db   $F0, $0C, $54, $01, $00, $FC, $56, $01   ;; 20:69E8
    db   $00, $04, $58, $01, $00, $0C, $5A, $01   ;; 20:69F0
Data_020_69F8::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01   ;; 20:69F8
    db   $F0, $0C, $54, $01, $00, $FC, $5C, $01   ;; 20:6A00
    db   $00, $04, $58, $01, $00, $0C, $5E, $01   ;; 20:6A08
Data_020_6A10::
    db   $F4, $04, $20, $21, $00, $04, $8E, $16   ;; 20:6A10
    db   $F4, $04, $20, $01, $00, $04, $8E, $16   ;; 20:6A18
Data_020_6A20::
    db   $F4, $00, $40, $03, $F4, $08, $40, $23   ;; 20:6A20

Data_020_6A28::
    db   $F4, $00, $40, $02, $F4, $08, $40, $22   ;; 20:6A28

func_020_6A30::
    ldh  a, [hIsGBC]                              ;; 20:6A30 $F0 $FE
    and  a                                        ;; 20:6A32 $A7
    jp   z, IgnorePaletteChange_DMG               ;; 20:6A33 $CA $81 $6B

    ld   a, e                                     ;; 20:6A36 $7B
    cp   $03                                      ;; 20:6A37 $FE $03
    ret  c                                        ;; 20:6A39 $D8

    ld   a, $01                                   ;; 20:6A3A $3E $01
    ldh  [hMultiPurposeD], a                      ;; 20:6A3C $E0 $E4
    ld   a, $02                                   ;; 20:6A3E $3E $02
    ldh  [hMultiPurposeE], a                      ;; 20:6A40 $E0 $E5
    ld   a, $04                                   ;; 20:6A42 $3E $04
    ldh  [hFreeWarpDataAddress], a                ;; 20:6A44 $E0 $E6
    ld   hl, wBGPal1                              ;; 20:6A46 $21 $10 $DC
    ld   d, $40                                   ;; 20:6A49 $16 $40
    ld   a, e                                     ;; 20:6A4B $7B
    cp   $06                                      ;; 20:6A4C $FE $06
    jr   nc, .jr_6A52                             ;; 20:6A4E $30 $02

    ld   d, $28                                   ;; 20:6A50 $16 $28

.jr_6A52
    and  $10                                      ;; 20:6A52 $E6 $10
    jr   z, func_020_6A68                         ;; 20:6A54 $28 $12

    ldh  a, [hMultiPurposeD]                      ;; 20:6A56 $F0 $E4
    sla  a                                        ;; 20:6A58 $CB $27
    ldh  [hMultiPurposeD], a                      ;; 20:6A5A $E0 $E4
    ldh  a, [hMultiPurposeE]                      ;; 20:6A5C $F0 $E5
    sla  a                                        ;; 20:6A5E $CB $27
    ldh  [hMultiPurposeE], a                      ;; 20:6A60 $E0 $E5
    ldh  a, [hFreeWarpDataAddress]                ;; 20:6A62 $F0 $E6
    sla  a                                        ;; 20:6A64 $CB $27
    ldh  [hFreeWarpDataAddress], a                ;; 20:6A66 $E0 $E6

func_020_6A68::
    push hl                                       ;; 20:6A68 $E5
    ldh  a, [hMultiPurposeD]                      ;; 20:6A69 $F0 $E4
    ld   c, a                                     ;; 20:6A6B $4F
    ld   a, [hl]                                  ;; 20:6A6C $7E
    and  $1F                                      ;; 20:6A6D $E6 $1F
    add  c                                        ;; 20:6A6F $81
    cp   $20                                      ;; 20:6A70 $FE $20
    jr   c, .jr_6A76                              ;; 20:6A72 $38 $02

    ld   a, $1F                                   ;; 20:6A74 $3E $1F

.jr_6A76
    ldh  [hMultiPurpose0], a                      ;; 20:6A76 $E0 $D7
    ldh  a, [hMultiPurposeE]                      ;; 20:6A78 $F0 $E5
    ld   c, a                                     ;; 20:6A7A $4F
    ld   a, [hl+]                                 ;; 20:6A7B $2A
    and  $E0                                      ;; 20:6A7C $E6 $E0
    swap a                                        ;; 20:6A7E $CB $37
    ld   b, a                                     ;; 20:6A80 $47
    ld   a, [hl]                                  ;; 20:6A81 $7E
    and  $03                                      ;; 20:6A82 $E6 $03
    swap a                                        ;; 20:6A84 $CB $37
    or   b                                        ;; 20:6A86 $B0
    and  $3E                                      ;; 20:6A87 $E6 $3E
    add  c                                        ;; 20:6A89 $81
    cp   $40                                      ;; 20:6A8A $FE $40
    jr   c, .jr_6A90                              ;; 20:6A8C $38 $02

    ld   a, $3E                                   ;; 20:6A8E $3E $3E

.jr_6A90
    ldh  [hMultiPurpose1], a                      ;; 20:6A90 $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ;; 20:6A92 $F0 $E6
    ld   c, a                                     ;; 20:6A94 $4F
    ld   a, [hl]                                  ;; 20:6A95 $7E
    and  $7C                                      ;; 20:6A96 $E6 $7C
    add  c                                        ;; 20:6A98 $81
    cp   $80                                      ;; 20:6A99 $FE $80
    jr   c, .jr_6A9F                              ;; 20:6A9B $38 $02

    ld   a, $7C                                   ;; 20:6A9D $3E $7C

.jr_6A9F
    ldh  [hMultiPurpose2], a                      ;; 20:6A9F $E0 $D9
    pop  hl                                       ;; 20:6AA1 $E1
    ldh  a, [hMultiPurpose0]                      ;; 20:6AA2 $F0 $D7
    ld   b, a                                     ;; 20:6AA4 $47
    ldh  a, [hMultiPurpose1]                      ;; 20:6AA5 $F0 $D8
    swap a                                        ;; 20:6AA7 $CB $37
    ld   c, a                                     ;; 20:6AA9 $4F
    and  $E0                                      ;; 20:6AAA $E6 $E0
    or   b                                        ;; 20:6AAC $B0
    ld   [hl+], a                                 ;; 20:6AAD $22
    ldh  a, [hMultiPurpose2]                      ;; 20:6AAE $F0 $D9
    ld   b, a                                     ;; 20:6AB0 $47
    ld   a, c                                     ;; 20:6AB1 $79
    and  $03                                      ;; 20:6AB2 $E6 $03
    or   b                                        ;; 20:6AB4 $B0
    ld   [hl+], a                                 ;; 20:6AB5 $22
    dec  d                                        ;; 20:6AB6 $15
    ld   a, d                                     ;; 20:6AB7 $7A
    and  a                                        ;; 20:6AB8 $A7
    jr   nz, func_020_6A68                        ;; 20:6AB9 $20 $AD

    ld   a, $03                                   ;; 20:6ABB $3E $03
    ld   [wPaletteDataFlags], a                   ;; 20:6ABD $EA $D1 $DD
    ret                                           ;; 20:6AC0 $C9

func_020_6AC1::
    ldh  a, [hIsGBC]                              ;; 20:6AC1 $F0 $FE
    and  a                                        ;; 20:6AC3 $A7
    jp   z, IgnorePaletteChange_DMG               ;; 20:6AC4 $CA $81 $6B

    ld   a, e                                     ;; 20:6AC7 $7B
    cp   $06                                      ;; 20:6AC8 $FE $06
    ret  c                                        ;; 20:6ACA $D8

    ld   a, $01                                   ;; 20:6ACB $3E $01
    ldh  [hMultiPurposeD], a                      ;; 20:6ACD $E0 $E4
    ld   a, $02                                   ;; 20:6ACF $3E $02
    ldh  [hMultiPurposeE], a                      ;; 20:6AD1 $E0 $E5
    ld   a, $04                                   ;; 20:6AD3 $3E $04
    ldh  [hFreeWarpDataAddress], a                ;; 20:6AD5 $E0 $E6
    ld   hl, wBGPal1                              ;; 20:6AD7 $21 $10 $DC
    ld   a, $40                                   ;; 20:6ADA $3E $40
    ldh  [hMultiPurpose3], a                      ;; 20:6ADC $E0 $DA
    ld   a, e                                     ;; 20:6ADE $7B
    and  $10                                      ;; 20:6ADF $E6 $10
    jr   z, func_020_6AF5                         ;; 20:6AE1 $28 $12

    ldh  a, [hMultiPurposeD]                      ;; 20:6AE3 $F0 $E4
    sla  a                                        ;; 20:6AE5 $CB $27
    ldh  [hMultiPurposeD], a                      ;; 20:6AE7 $E0 $E4
    ldh  a, [hMultiPurposeE]                      ;; 20:6AE9 $F0 $E5
    sla  a                                        ;; 20:6AEB $CB $27
    ldh  [hMultiPurposeE], a                      ;; 20:6AED $E0 $E5
    ldh  a, [hFreeWarpDataAddress]                ;; 20:6AEF $F0 $E6
    sla  a                                        ;; 20:6AF1 $CB $27
    ldh  [hFreeWarpDataAddress], a                ;; 20:6AF3 $E0 $E6

func_020_6AF5::
    push hl                                       ;; 20:6AF5 $E5
    ld   a, $02                                   ;; 20:6AF6 $3E $02
    ldh  [rSVBK], a                               ;; 20:6AF8 $E0 $70
    ld   a, [hl+]                                 ;; 20:6AFA $2A
    ld   e, a                                     ;; 20:6AFB $5F
    ld   a, [hl]                                  ;; 20:6AFC $7E
    ld   d, a                                     ;; 20:6AFD $57
    dec  hl                                       ;; 20:6AFE $2B
    xor  a                                        ;; 20:6AFF $AF
    ldh  [rSVBK], a                               ;; 20:6B00 $E0 $70
    ldh  a, [hMultiPurposeD]                      ;; 20:6B02 $F0 $E4
    ld   c, a                                     ;; 20:6B04 $4F
    ld   a, e                                     ;; 20:6B05 $7B
    and  $1F                                      ;; 20:6B06 $E6 $1F
    ld   b, a                                     ;; 20:6B08 $47
    ld   a, [hl]                                  ;; 20:6B09 $7E
    and  $1F                                      ;; 20:6B0A $E6 $1F
    cp   b                                        ;; 20:6B0C $B8
    jr   c, .jr_6B17                              ;; 20:6B0D $38 $08

    jr   z, .jr_6B17                              ;; 20:6B0F $28 $06

    sub  c                                        ;; 20:6B11 $91
    jr   c, .jr_6B17                              ;; 20:6B12 $38 $03

    cp   b                                        ;; 20:6B14 $B8
    jr   nc, jr_020_6B18                          ;; 20:6B15 $30 $01

.jr_6B17
    ld   a, b                                     ;; 20:6B17 $78

jr_020_6B18:
    ldh  [hMultiPurpose0], a                      ;; 20:6B18 $E0 $D7
    ld   a, e                                     ;; 20:6B1A $7B
    and  $E0                                      ;; 20:6B1B $E6 $E0
    swap a                                        ;; 20:6B1D $CB $37
    ld   b, a                                     ;; 20:6B1F $47
    ld   a, d                                     ;; 20:6B20 $7A
    and  $03                                      ;; 20:6B21 $E6 $03
    swap a                                        ;; 20:6B23 $CB $37
    or   b                                        ;; 20:6B25 $B0
    ld   b, a                                     ;; 20:6B26 $47
    ld   a, [hl+]                                 ;; 20:6B27 $2A
    and  $E0                                      ;; 20:6B28 $E6 $E0
    swap a                                        ;; 20:6B2A $CB $37
    ld   c, a                                     ;; 20:6B2C $4F
    ld   a, [hl]                                  ;; 20:6B2D $7E
    and  $03                                      ;; 20:6B2E $E6 $03
    swap a                                        ;; 20:6B30 $CB $37
    or   c                                        ;; 20:6B32 $B1
    push af                                       ;; 20:6B33 $F5
    ldh  a, [hMultiPurposeE]                      ;; 20:6B34 $F0 $E5
    ld   c, a                                     ;; 20:6B36 $4F
    pop  af                                       ;; 20:6B37 $F1
    cp   b                                        ;; 20:6B38 $B8
    jr   c, .jr_6B43                              ;; 20:6B39 $38 $08

    jr   z, .jr_6B43                              ;; 20:6B3B $28 $06

    sub  c                                        ;; 20:6B3D $91
    jr   c, .jr_6B43                              ;; 20:6B3E $38 $03

    cp   b                                        ;; 20:6B40 $B8
    jr   nc, jr_020_6B44                          ;; 20:6B41 $30 $01

.jr_6B43
    ld   a, b                                     ;; 20:6B43 $78

jr_020_6B44:
    ldh  [hMultiPurpose1], a                      ;; 20:6B44 $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ;; 20:6B46 $F0 $E6
    ld   c, a                                     ;; 20:6B48 $4F
    ld   a, d                                     ;; 20:6B49 $7A
    and  $7C                                      ;; 20:6B4A $E6 $7C
    ld   b, a                                     ;; 20:6B4C $47
    ld   a, [hl]                                  ;; 20:6B4D $7E
    and  $7C                                      ;; 20:6B4E $E6 $7C
    cp   b                                        ;; 20:6B50 $B8
    jr   c, .jr_6B5B                              ;; 20:6B51 $38 $08

    jr   z, .jr_6B5B                              ;; 20:6B53 $28 $06

    sub  c                                        ;; 20:6B55 $91
    jr   c, .jr_6B5B                              ;; 20:6B56 $38 $03

    cp   b                                        ;; 20:6B58 $B8
    jr   nc, jr_020_6B5C                          ;; 20:6B59 $30 $01

.jr_6B5B
    ld   a, b                                     ;; 20:6B5B $78

jr_020_6B5C:
    ldh  [hMultiPurpose2], a                      ;; 20:6B5C $E0 $D9
    pop  hl                                       ;; 20:6B5E $E1
    ldh  a, [hMultiPurpose0]                      ;; 20:6B5F $F0 $D7
    ld   b, a                                     ;; 20:6B61 $47
    ldh  a, [hMultiPurpose1]                      ;; 20:6B62 $F0 $D8
    swap a                                        ;; 20:6B64 $CB $37
    ld   c, a                                     ;; 20:6B66 $4F
    and  $E0                                      ;; 20:6B67 $E6 $E0
    or   b                                        ;; 20:6B69 $B0
    ld   [hl+], a                                 ;; 20:6B6A $22
    ldh  a, [hMultiPurpose2]                      ;; 20:6B6B $F0 $D9
    ld   b, a                                     ;; 20:6B6D $47
    ld   a, c                                     ;; 20:6B6E $79
    and  $03                                      ;; 20:6B6F $E6 $03
    or   b                                        ;; 20:6B71 $B0
    ld   [hl+], a                                 ;; 20:6B72 $22
    ldh  a, [hMultiPurpose3]                      ;; 20:6B73 $F0 $DA
    dec  a                                        ;; 20:6B75 $3D
    ldh  [hMultiPurpose3], a                      ;; 20:6B76 $E0 $DA
    and  a                                        ;; 20:6B78 $A7
    jp   nz, func_020_6AF5                        ;; 20:6B79 $C2 $F5 $6A

    ld   a, $03                                   ;; 20:6B7C $3E $03
    ld   [wPaletteDataFlags], a                   ;; 20:6B7E $EA $D1 $DD

; Jumped to when running on DMG: don't do anything with palettes
IgnorePaletteChange_DMG:
    xor  a                                        ;; 20:6B81 $AF
    ld   [wPaletteUnknownE], a                    ;; 20:6B82 $EA $D5 $DD
    ret                                           ;; 20:6B85 $C9

; Copy a color (two bytes) from RAM2 (where the original color is stored)
; to RAM0 (where the final blended color is).
;
; Inputs:
;   bc   address of the blending color
;   hl   address of the source color in RAM2, and destination color in RAM0
;
; Ouputs:
;   hl and bc are incremented by 2
IntroCopyAndBlendColor::
    ; Switch to RAM bank 2
    ld   a, $02                                   ;; 20:6B86 $3E $02
    ldh  [rSVBK], a                               ;; 20:6B88 $E0 $70

    ; Copy two bytes from [hl] in RAM 2 to de (masked with [bc])
    ld   a, [bc]                                  ;; 20:6B8A $0A
    or   [hl]                                     ;; 20:6B8B $B6
    ld   e, a                                     ;; 20:6B8C $5F
    inc  bc                                       ;; 20:6B8D $03
    inc  hl                                       ;; 20:6B8E $23
    ld   a, [bc]                                  ;; 20:6B8F $0A
    or   [hl]                                     ;; 20:6B90 $B6
    ld   d, a                                     ;; 20:6B91 $57
    dec  bc                                       ;; 20:6B92 $0B
    dec  hl                                       ;; 20:6B93 $2B

    ; Switch back to RAM bank 1
    xor  a                                        ;; 20:6B94 $AF
    ldh  [rSVBK], a                               ;; 20:6B95 $E0 $70

    ; Copy two bytes from de to [hl] in RAM1
    ld   [hl], e                                  ;; 20:6B97 $73
    inc  hl                                       ;; 20:6B98 $23
    ld   [hl], d                                  ;; 20:6B99 $72
    inc  hl                                       ;; 20:6B9A $23

    ret                                           ;; 20:6B9B $C9

; Value blended with the palette when a lighting strikes.
IntroColorModifierTable::
._00  db   $00, $00 ; no color modification
._01  db   $84, $10
._02  db   $8C, $31
._03  db   $84, $10

; Update the BG palette for the intro sea sequence, optionaly blending each
; color with a color modifier.
;
; The palettes are copied from wBGPal1 in RAM2 (original colors)
; to wBGPal1 in RAM0 (blended colors).
;
; Inputs:
;   e    color modifier (index in IntroColorModifierTable)
UpdateIntroSeaBGPalettes::
    ldh  a, [hIsGBC]                              ;; 20:6BA4 $F0 $FE
    and  a                                        ;; 20:6BA6 $A7
    jp   z, IgnorePaletteChange_DMG               ;; 20:6BA7 $CA $81 $6B

    ld   a, [wIntroSubTimer]                      ;; 20:6BAA $FA $02 $D0
    and  a                                        ;; 20:6BAD $A7
    jr   z, .jr_020_6BB4                          ;; 20:6BAE $28 $04
    cp   $18                                      ;; 20:6BB0 $FE $18
    jr   nc, .return                              ;; 20:6BB2 $30 $27
.jr_020_6BB4

    ; bc = IntroColorModifierTable + (e * 2)
    ld   hl, IntroColorModifierTable              ;; 20:6BB4 $21 $9C $6B
    sla  e                                        ;; 20:6BB7 $CB $23
    add  hl, de                                   ;; 20:6BB9 $19
    push hl                                       ;; 20:6BBA $E5
    pop  bc                                       ;; 20:6BBB $C1

    ld   hl, wBGPal1                              ;; 20:6BBC $21 $10 $DC

    ; For each 8 BG color palettes…
    ld   a, $08                                   ;; 20:6BBF $3E $08
    ldh  [hMultiPurpose0], a                      ;; 20:6BC1 $E0 $D7
.loop
    ; Copy and blend the first 3 colors of the palette
    call IntroCopyAndBlendColor                   ;; 20:6BC3 $CD $86 $6B
    call IntroCopyAndBlendColor                   ;; 20:6BC6 $CD $86 $6B
    call IntroCopyAndBlendColor                   ;; 20:6BC9 $CD $86 $6B
    ; The 4th color is always black: skip it
    inc  hl                                       ;; 20:6BCC $23
    inc  hl                                       ;; 20:6BCD $23

    ; Decrement loop counter
    ldh  a, [hMultiPurpose0]                      ;; 20:6BCE $F0 $D7
    dec  a                                        ;; 20:6BD0 $3D
    and  a                                        ;; 20:6BD1 $A7
    ldh  [hMultiPurpose0], a                      ;; 20:6BD2 $E0 $D7

    jr   nz, .loop                                ;; 20:6BD4 $20 $ED

    ld   a, $01                                   ;; 20:6BD6 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 20:6BD8 $EA $D1 $DD

.return
    ret                                           ;; 20:6BDB $C9

func_020_6BDC::
    ldh  a, [hIsGBC]                              ;; 20:6BDC $F0 $FE
    and  a                                        ;; 20:6BDE $A7
    ret  z                                        ;; 20:6BDF $C8

    ld   hl, wBGPal1                              ;; 20:6BE0 $21 $10 $DC
    ld   bc, wObjPal1                             ;; 20:6BE3 $01 $50 $DC
    ld   d, $20                                   ;; 20:6BE6 $16 $20

.loop_6BE8
    ld   a, $FF                                   ;; 20:6BE8 $3E $FF
    ld   [hl+], a                                 ;; 20:6BEA $22
    ld   [bc], a                                  ;; 20:6BEB $02
    inc  bc                                       ;; 20:6BEC $03
    ld   [hl+], a                                 ;; 20:6BED $22
    ld   [bc], a                                  ;; 20:6BEE $02
    inc  bc                                       ;; 20:6BEF $03
    dec  d                                        ;; 20:6BF0 $15
    ld   a, d                                     ;; 20:6BF1 $7A
    and  a                                        ;; 20:6BF2 $A7
    jr   nz, .loop_6BE8                           ;; 20:6BF3 $20 $F3

    ld   a, $03                                   ;; 20:6BF5 $3E $03
    ld   [wPaletteDataFlags], a                   ;; 20:6BF7 $EA $D1 $DD
    ld   a, $01                                   ;; 20:6BFA $3E $01
    ld   [wPaletteUnknownE], a                    ;; 20:6BFC $EA $D5 $DD
    ret                                           ;; 20:6BFF $C9

LoadFileMenuBG::
    ldh  a, [hIsGBC]                              ;; 20:6C00 $F0 $FE
    and  a                                        ;; 20:6C02 $A7
    jp   z, IgnorePaletteChange_DMG               ;; 20:6C03 $CA $81 $6B

    ld   c, $80                                   ;; 20:6C06 $0E $80
    ld   hl, wBGPal1                              ;; 20:6C08 $21 $10 $DC

.loop_6C0B
    ld   a, $02                                   ;; 20:6C0B $3E $02
    ldh  [rSVBK], a                               ;; 20:6C0D $E0 $70
    ld   b, [hl]                                  ;; 20:6C0F $46
    xor  a                                        ;; 20:6C10 $AF
    ldh  [rSVBK], a                               ;; 20:6C11 $E0 $70
    ld   [hl], b                                  ;; 20:6C13 $70
    inc  hl                                       ;; 20:6C14 $23
    dec  c                                        ;; 20:6C15 $0D
    ld   a, c                                     ;; 20:6C16 $79
    and  a                                        ;; 20:6C17 $A7
    jr   nz, .loop_6C0B                           ;; 20:6C18 $20 $F1

    ld   a, $03                                   ;; 20:6C1A $3E $03
    ld   [wPaletteDataFlags], a                   ;; 20:6C1C $EA $D1 $DD
    xor  a                                        ;; 20:6C1F $AF
    ld   [wPaletteUnknownE], a                    ;; 20:6C20 $EA $D5 $DD
    ret                                           ;; 20:6C23 $C9

; Copy some tunic-related data to 01:DC50
; (GBC only)
CopyLinkTunicPalette::
    ldh  a, [hIsGBC]                              ;; 20:6C24 $F0 $FE
    and  a                                        ;; 20:6C26 $A7
    jr   z, .return                               ;; 20:6C27 $28 $25

    ld   hl, wObjPal1                             ;; 20:6C29 $21 $50 $DC
    ld   a, [wTunicType]                          ;; 20:6C2C $FA $0F $DC
    and  a                                        ;; 20:6C2F $A7
    jr   z, .specialTunicEnd                      ;; 20:6C30 $28 $0B
    ; Change the base pointer for the color tunics
    inc  a                                        ;; 20:6C32 $3C
    sla  a                                        ;; 20:6C33 $CB $27
    sla  a                                        ;; 20:6C35 $CB $27
    sla  a                                        ;; 20:6C37 $CB $27
    ld   c, a                                     ;; 20:6C39 $4F
    ld   b, $00                                   ;; 20:6C3A $06 $00
    add  hl, bc                                   ;; 20:6C3C $09

.specialTunicEnd
    ; Data length
    ld   b, $08                                   ;; 20:6C3D $06 $08

    ; Copy 8 bytes from 02:DC50 to 01:DC50
.loop
    ld   a, $02                                   ;; 20:6C3F $3E $02
    ldh  [rSVBK], a                               ;; 20:6C41 $E0 $70
    ld   c, [hl]                                  ;; 20:6C43 $4E
    xor  a                                        ;; 20:6C44 $AF
    ldh  [rSVBK], a                               ;; 20:6C45 $E0 $70
    ld   [hl], c                                  ;; 20:6C47 $71
    inc  hl                                       ;; 20:6C48 $23
    dec  b                                        ;; 20:6C49 $05
    ld   a, b                                     ;; 20:6C4A $78
    and  a                                        ;; 20:6C4B $A7
    jr   nz, .loop                                ;; 20:6C4C $20 $F1

.return
    ret                                           ;; 20:6C4E $C9

func_020_6C4F::
    ldh  a, [hIsGBC]                              ;; 20:6C4F $F0 $FE
    and  a                                        ;; 20:6C51 $A7
    jp   z, IgnorePaletteChange_DMG               ;; 20:6C52 $CA $81 $6B

    ld   a, [wC16C]                               ;; 20:6C55 $FA $6C $C1
    and  $01                                      ;; 20:6C58 $E6 $01
    jr   z, .jr_6C60                              ;; 20:6C5A $28 $04

    ld   a, $02                                   ;; 20:6C5C $3E $02
    jr   jr_020_6C76                              ;; 20:6C5E $18 $16

.jr_6C60
    ld   a, $04                                   ;; 20:6C60 $3E $04
    ldh  [hMultiPurposeD], a                      ;; 20:6C62 $E0 $E4
    ld   a, $08                                   ;; 20:6C64 $3E $08
    ldh  [hMultiPurposeE], a                      ;; 20:6C66 $E0 $E5
    ld   a, $10                                   ;; 20:6C68 $3E $10
    ldh  [hFreeWarpDataAddress], a                ;; 20:6C6A $E0 $E6
    ld   hl, wBGPal1                              ;; 20:6C6C $21 $10 $DC
    ld   d, $40                                   ;; 20:6C6F $16 $40
    call func_020_6A68                            ;; 20:6C71 $CD $68 $6A
    ld   a, $01                                   ;; 20:6C74 $3E $01

jr_020_6C76:
    ld   [wPaletteDataFlags], a                   ;; 20:6C76 $EA $D1 $DD
    ret                                           ;; 20:6C79 $C9

func_020_6C7A::
    ldh  a, [hIsGBC]                              ;; 20:6C7A $F0 $FE
    and  a                                        ;; 20:6C7C $A7
    jp   z, IgnorePaletteChange_DMG               ;; 20:6C7D $CA $81 $6B

    ld   a, [wC16C]                               ;; 20:6C80 $FA $6C $C1
    and  $01                                      ;; 20:6C83 $E6 $01
    jr   z, .jr_6C8B                              ;; 20:6C85 $28 $04

    ld   a, $02                                   ;; 20:6C87 $3E $02
    jr   jr_020_6CA3                              ;; 20:6C89 $18 $18

.jr_6C8B
    ld   a, $04                                   ;; 20:6C8B $3E $04
    ldh  [hMultiPurposeD], a                      ;; 20:6C8D $E0 $E4
    ld   a, $08                                   ;; 20:6C8F $3E $08
    ldh  [hMultiPurposeE], a                      ;; 20:6C91 $E0 $E5
    ld   a, $10                                   ;; 20:6C93 $3E $10
    ldh  [hFreeWarpDataAddress], a                ;; 20:6C95 $E0 $E6
    ld   hl, wBGPal1                              ;; 20:6C97 $21 $10 $DC
    ld   a, $40                                   ;; 20:6C9A $3E $40
    ldh  [hMultiPurpose3], a                      ;; 20:6C9C $E0 $DA
    call func_020_6AF5                            ;; 20:6C9E $CD $F5 $6A
    ld   a, $01                                   ;; 20:6CA1 $3E $01

jr_020_6CA3:
    ld   [wPaletteDataFlags], a                   ;; 20:6CA3 $EA $D1 $DD
    ret                                           ;; 20:6CA6 $C9

ApplyFadeToWhite_GBC::
    ld   a, [wC3CA]                               ;; 20:6CA7 $FA $CA $C3
    cp   $20                                      ;; 20:6CAA $FE $20
    jr   z, ret_020_6D0D                          ;; 20:6CAC $28 $5F

    push af                                       ;; 20:6CAE $F5
    and  $02                                      ;; 20:6CAF $E6 $02
    jr   nz, .jr_6CB5                             ;; 20:6CB1 $20 $02

    ld   a, $01                                   ;; 20:6CB3 $3E $01

.jr_6CB5
    or   $80                                      ;; 20:6CB5 $F6 $80
    ld   [wPaletteDataFlags], a                   ;; 20:6CB7 $EA $D1 $DD
    ld   a, [wC3CA]                               ;; 20:6CBA $FA $CA $C3
    and  $01                                      ;; 20:6CBD $E6 $01
    swap a                                        ;; 20:6CBF $CB $37
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 20:6CC1 $EA $D3 $DD
    ld   a, $10                                   ;; 20:6CC4 $3E $10
    ld   [wPalettePartialCopyColorCount], a       ;; 20:6CC6 $EA $D4 $DD
    pop  af                                       ;; 20:6CC9 $F1
    inc  a                                        ;; 20:6CCA $3C
    ld   [wC3CA], a                               ;; 20:6CCB $EA $CA $C3
    ld   a, $08                                   ;; 20:6CCE $3E $08
    ldh  [hMultiPurposeD], a                      ;; 20:6CD0 $E0 $E4
    ld   a, $10                                   ;; 20:6CD2 $3E $10
    ldh  [hMultiPurposeE], a                      ;; 20:6CD4 $E0 $E5
    ld   a, $20                                   ;; 20:6CD6 $3E $20
    ldh  [hFreeWarpDataAddress], a                ;; 20:6CD8 $E0 $E6
    ld   hl, wBGPal1                              ;; 20:6CDA $21 $10 $DC
    ld   a, $40                                   ;; 20:6CDD $3E $40
    ldh  [hMultiPurpose3], a                      ;; 20:6CDF $E0 $DA
    ld   a, [wTransitionGfx]                      ;; 20:6CE1 $FA $7F $C1
    cp   $03                                      ;; 20:6CE4 $FE $03
    jr   z, .jr_6CFA                              ;; 20:6CE6 $28 $12

    ld   a, [wPaletteDataFlags]                   ;; 20:6CE8 $FA $D1 $DD
    push af                                       ;; 20:6CEB $F5
    call func_020_6A30                            ;; 20:6CEC $CD $30 $6A
    pop  af                                       ;; 20:6CEF $F1
    ld   [wPaletteDataFlags], a                   ;; 20:6CF0 $EA $D1 $DD
    ld   a, $01                                   ;; 20:6CF3 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 20:6CF5 $EA $D5 $DD
    jr   ret_020_6D0D                             ;; 20:6CF8 $18 $13

.jr_6CFA
    ld   a, [wC3CA]                               ;; 20:6CFA $FA $CA $C3
    dec  a                                        ;; 20:6CFD $3D
    and  $03                                      ;; 20:6CFE $E6 $03
    jr   nz, ret_020_6D0D                         ;; 20:6D00 $20 $0B

    ld   a, [wPaletteDataFlags]                   ;; 20:6D02 $FA $D1 $DD
    push af                                       ;; 20:6D05 $F5
    call func_020_6AF5                            ;; 20:6D06 $CD $F5 $6A
    pop  af                                       ;; 20:6D09 $F1
    ld   [wPaletteDataFlags], a                   ;; 20:6D0A $EA $D1 $DD

ret_020_6D0D:
    ret                                           ;; 20:6D0D $C9

func_020_6D0E::
    ld   a, [hl]                                  ;; 20:6D0E $7E
    dec  a                                        ;; 20:6D0F $3D
    cp   $04                                      ;; 20:6D10 $FE $04
    jr   c, ret_020_6D51                          ;; 20:6D12 $38 $3D

    ldh  a, [hFrameCounter]                       ;; 20:6D14 $F0 $E7
    and  $01                                      ;; 20:6D16 $E6 $01
    jr   z, .jr_6D1E                              ;; 20:6D18 $28 $04

    ld   a, $02                                   ;; 20:6D1A $3E $02
    jr   jr_020_6D4E                              ;; 20:6D1C $18 $30

.jr_6D1E
    ld   a, [hl]                                  ;; 20:6D1E $7E
    dec  a                                        ;; 20:6D1F $3D
    cp   $0E                                      ;; 20:6D20 $FE $0E
    jr   c, .jr_6D38                              ;; 20:6D22 $38 $14

    ld   a, $01                                   ;; 20:6D24 $3E $01
    ldh  [hMultiPurposeD], a                      ;; 20:6D26 $E0 $E4
    ld   a, $02                                   ;; 20:6D28 $3E $02
    ldh  [hMultiPurposeE], a                      ;; 20:6D2A $E0 $E5
    ld   a, $04                                   ;; 20:6D2C $3E $04
    ldh  [hFreeWarpDataAddress], a                ;; 20:6D2E $E0 $E6
IF __PATCH_3__
    ld   hl, wObjPal1
ELSE
    ld   hl, wBGPal5                              ;; 20:6D30 $21 $30 $DC
ENDC
    ld   d, $20                                   ;; 20:6D33 $16 $20
    call func_020_6A68                            ;; 20:6D35 $CD $68 $6A

.jr_6D38
    ld   a, $01                                   ;; 20:6D38 $3E $01
    ldh  [hMultiPurposeD], a                      ;; 20:6D3A $E0 $E4
    ld   a, $02                                   ;; 20:6D3C $3E $02
    ldh  [hMultiPurposeE], a                      ;; 20:6D3E $E0 $E5
    ld   a, $04                                   ;; 20:6D40 $3E $04
    ldh  [hFreeWarpDataAddress], a                ;; 20:6D42 $E0 $E6
    ld   hl, wBGPal1                              ;; 20:6D44 $21 $10 $DC
    ld   d, $20                                   ;; 20:6D47 $16 $20
    call func_020_6A68                            ;; 20:6D49 $CD $68 $6A
    ld   a, $01                                   ;; 20:6D4C $3E $01

jr_020_6D4E:
    ld   [wPaletteDataFlags], a                   ;; 20:6D4E $EA $D1 $DD

ret_020_6D51:
    ret                                           ;; 20:6D51 $C9

func_020_6D52::
    ld   e, $20                                   ;; 20:6D52 $1E $20
    ld   a, [hl]                                  ;; 20:6D54 $7E
    cp   $30                                      ;; 20:6D55 $FE $30
    jr   c, .jr_6D60                              ;; 20:6D57 $38 $07

    ld   hl, wObjPal1                             ;; 20:6D59 $21 $50 $DC
    ld   a, $02                                   ;; 20:6D5C $3E $02
    jr   jr_020_6D65                              ;; 20:6D5E $18 $05

.jr_6D60
    ld   hl, wBGPal1                              ;; 20:6D60 $21 $10 $DC
    ld   a, $01                                   ;; 20:6D63 $3E $01

jr_020_6D65:
    ld   [wPaletteDataFlags], a                   ;; 20:6D65 $EA $D1 $DD

jr_020_6D68:
    push hl                                       ;; 20:6D68 $E5
    ld   a, [hl]                                  ;; 20:6D69 $7E
    inc  a                                        ;; 20:6D6A $3C
    and  $1F                                      ;; 20:6D6B $E6 $1F
    jr   nz, .jr_6D71                             ;; 20:6D6D $20 $02

    ld   a, $1F                                   ;; 20:6D6F $3E $1F

.jr_6D71
    ldh  [hMultiPurpose0], a                      ;; 20:6D71 $E0 $D7
    ld   a, [hl+]                                 ;; 20:6D73 $2A
    and  $E0                                      ;; 20:6D74 $E6 $E0
    swap a                                        ;; 20:6D76 $CB $37
    ld   d, a                                     ;; 20:6D78 $57
    ld   a, [hl]                                  ;; 20:6D79 $7E
    and  $03                                      ;; 20:6D7A $E6 $03
    swap a                                        ;; 20:6D7C $CB $37
    or   d                                        ;; 20:6D7E $B2
    add  $02                                      ;; 20:6D7F $C6 $02
    and  $3E                                      ;; 20:6D81 $E6 $3E
    jr   nz, .jr_6D87                             ;; 20:6D83 $20 $02

    ld   a, $3E                                   ;; 20:6D85 $3E $3E

.jr_6D87
    ldh  [hMultiPurpose1], a                      ;; 20:6D87 $E0 $D8
    ld   a, [hl]                                  ;; 20:6D89 $7E
    add  $04                                      ;; 20:6D8A $C6 $04
    and  $7C                                      ;; 20:6D8C $E6 $7C
    jr   nz, .jr_6D92                             ;; 20:6D8E $20 $02

    ld   a, $7C                                   ;; 20:6D90 $3E $7C

.jr_6D92
    ldh  [hMultiPurpose2], a                      ;; 20:6D92 $E0 $D9
    pop  hl                                       ;; 20:6D94 $E1
    ldh  a, [hMultiPurpose0]                      ;; 20:6D95 $F0 $D7
    ld   d, a                                     ;; 20:6D97 $57
    ldh  a, [hMultiPurpose1]                      ;; 20:6D98 $F0 $D8
    swap a                                        ;; 20:6D9A $CB $37
    and  $E0                                      ;; 20:6D9C $E6 $E0
    or   d                                        ;; 20:6D9E $B2
    ld   [hl+], a                                 ;; 20:6D9F $22
    ldh  a, [hMultiPurpose2]                      ;; 20:6DA0 $F0 $D9
    ld   d, a                                     ;; 20:6DA2 $57
    ldh  a, [hMultiPurpose1]                      ;; 20:6DA3 $F0 $D8
    swap a                                        ;; 20:6DA5 $CB $37
    and  $03                                      ;; 20:6DA7 $E6 $03
    or   d                                        ;; 20:6DA9 $B2
    ld   [hl+], a                                 ;; 20:6DAA $22
    dec  e                                        ;; 20:6DAB $1D
    jr   nz, jr_020_6D68                          ;; 20:6DAC $20 $BA

    ret                                           ;; 20:6DAE $C9

LoadRoomObjectsAttributes::
    ld   a, [wIsIndoor]                           ;; 20:6DAF $FA $A5 $DB
    and  a                                        ;; 20:6DB2 $A7
    ret  nz                                       ;; 20:6DB3 $C0

    ldh  a, [hMapRoom]                            ;; 20:6DB4 $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ;; 20:6DB6 $FE $0E
    jr   nz, .jr_020_6DC6                         ;; 20:6DB8 $20 $0C

    ld   a, [wOverworldRoomStatus + ROOM_OW_EAGLES_TOWER] ;; 20:6DBA $FA $0E $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 20:6DBD $E6 $10
    jr   z, .jr_020_6E1A                          ;; 20:6DBF $28 $59
    ld   hl, RoomGBCOverlay0EAlt                  ;; 20:6DC1 $21 $90 $50
    jr   .jr_020_6E14                             ;; 20:6DC4 $18 $4E

.jr_020_6DC6
    cp   ROOM_OW_FACE_SHRINE_ENTRANCE             ;; 20:6DC6 $FE $8C
    jr   nz, .jr_020_6DD6                         ;; 20:6DC8 $20 $0C

    ld   a, [wOverworldRoomStatus + ROOM_OW_FACE_SHRINE_ENTRANCE] ;; 20:6DCA $FA $8C $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 20:6DCD $E6 $10
    jr   z, .jr_020_6E1A                          ;; 20:6DCF $28 $49
    ld   hl, RoomGBCOverlay8CAlt                  ;; 20:6DD1 $21 $D0 $51
    jr   .jr_020_6E14                             ;; 20:6DD4 $18 $3E

.jr_020_6DD6
    cp   UNKNOWN_ROOM_79                          ;; 20:6DD6 $FE $79
    jr   nz, .jr_020_6DE6                         ;; 20:6DD8 $20 $0C

    ld   a, [wOverworldRoomStatus + UNKNOWN_ROOM_79] ;; 20:6DDA $FA $79 $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 20:6DDD $E6 $10
    jr   z, .jr_020_6E1A                          ;; 20:6DDF $28 $39
    ld   hl, RoomGBCOverlay79Alt                  ;; 20:6DE1 $21 $80 $51
    jr   .jr_020_6E14                             ;; 20:6DE4 $18 $2E

.jr_020_6DE6
    cp   UNKNOWN_ROOM_06                          ;; 20:6DE6 $FE $06
    jr   nz, .jr_020_6DF6                         ;; 20:6DE8 $20 $0C

    ld   a, [wOverworldRoomStatus + UNKNOWN_ROOM_06] ;; 20:6DEA $FA $06 $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 20:6DED $E6 $10
    jr   z, .jr_020_6E1A                          ;; 20:6DEF $28 $29
    ld   hl, RoomGBCOverlay06Alt                  ;; 20:6DF1 $21 $40 $50
    jr   .jr_020_6E14                             ;; 20:6DF4 $18 $1E

.jr_020_6DF6
    cp   UNKNOWN_ROOM_1B                          ;; 20:6DF6 $FE $1B
    jr   nz, .jr_020_6E06                         ;; 20:6DF8 $20 $0C
    ld   a, [wOverworldRoomStatus + ROOM_OW_ANGLERS_TUNNEL_ENTRANCE] ;; 20:6DFA $FA $2B $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 20:6DFD $E6 $10
    jr   z, .jr_020_6E1A                          ;; 20:6DFF $28 $19
    ld   hl, RoomGBCOverlay1BAlt                  ;; 20:6E01 $21 $E0 $50
    jr   .jr_020_6E14                             ;; 20:6E04 $18 $0E

.jr_020_6E06
    cp   ROOM_OW_ANGLERS_TUNNEL_ENTRANCE          ;; 20:6E06 $FE $2B
    jr   nz, .jr_020_6E1A                         ;; 20:6E08 $20 $10

    ld   a, [wOverworldRoomStatus + ROOM_OW_ANGLERS_TUNNEL_ENTRANCE] ;; 20:6E0A $FA $2B $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 20:6E0D $E6 $10
    jr   z, .jr_020_6E1A                          ;; 20:6E0F $28 $09
    ld   hl, RoomGBCOverlay2BAlt                  ;; 20:6E11 $21 $30 $51

.jr_020_6E14
    ld   a, BANK(RoomGBCOverlay2BAlt)             ;; 20:6E14 $3E $27
    ldh  [hMultiPurpose0], a                      ;; 20:6E16 $E0 $D7
    jr   .copyAttributes                          ;; 20:6E18 $18 $22

.jr_020_6E1A
    ; Set attributes bank for rooms < $CC
    ld   a, BANK(RoomGBCOverlaysA)                ;; 20:6E1A $3E $26
    ldh  [hMultiPurpose0], a                      ;; 20:6E1C $E0 $D7
    ; If the room id >= $CC…
    ldh  a, [hMapRoom]                            ;; 20:6E1E $F0 $F6
    cp   UNKNOWN_ROOM_CC                          ;; 20:6E20 $FE $CC
    jr   c, .bankEnd                              ;; 20:6E22 $38 $06
    ld   hl, hMultiPurpose0                       ;; 20:6E24 $21 $D7 $FF
    ; … use BANK(RoomGBCOverlaysA) + 1 for the overlay bank
    inc  [hl]                                     ;; 20:6E27 $34
    sub  $CC                                      ;; 20:6E28 $D6 $CC
.bankEnd

    ld   hl, RoomGBCOverlaysA                     ;; 20:6E2A $21 $00 $40
    ld   b, a                                     ;; 20:6E2D $47
    and  b                                        ;; 20:6E2E $A0

    ; hl += $50 * MapRoom
.mapRoomLoop
    jr   z, .copyAttributes                       ;; 20:6E2F $28 $0B

    ld   a, l                                     ;; 20:6E31 $7D
    add  $50                                      ;; 20:6E32 $C6 $50
    ld   l, a                                     ;; 20:6E34 $6F
    ld   a, h                                     ;; 20:6E35 $7C
    adc  $00                                      ;; 20:6E36 $CE $00
    ld   h, a                                     ;; 20:6E38 $67
    dec  b                                        ;; 20:6E39 $05
    jr   .mapRoomLoop                             ;; 20:6E3A $18 $F3

.copyAttributes
    ; Copy the objects attributes to the room objects attributes in WRAM 2
    ; (NB: this assumes that wRoomObjectsArea is $10-bytes aligned)
ASSERT LOW(wRoomObjectsArea) & $0F == 0, "wRoomObjectsArea must be aligned on $10 addresses"
    ld   de, wRoomObjects                         ;; 20:6E3C $11 $11 $D7
.loop
    ld   bc, OBJECTS_PER_ROW                      ;; 20:6E3F $01 $0A $00
    push de                                       ;; 20:6E42 $D5
    call CopyObjectsAttributesToWRAM2             ;; 20:6E43 $CD $1A $0B
    pop  de                                       ;; 20:6E46 $D1
    ld   a, e                                     ;; 20:6E47 $7B
    add  $10                                      ;; 20:6E48 $C6 $10
    ld   e, a                                     ;; 20:6E4A $5F
    cp   LOW(wRoomObjects) + OBJECTS_PER_COLUMN * $10 ;; 20:6E4B $FE $91
    jr   nz, .loop                                ;; 20:6E4D $20 $F0

    ret                                           ;; 20:6E4F $C9

; Check if the object at HL is in the overworld object ignore list.
;
; See BackupObjectInRAM2
CheckOverworldObjectIgnoreList::
    push hl                                       ;; 20:6E50 $E5
    ld   c, [hl]                                  ;; 20:6E51 $4E
    ld   b, $0E                                   ;; 20:6E52 $06 $0E
    ld   hl, OverworldObjectIgnoreList            ;; 20:6E54 $21 $65 $6E

.loop
    ld   a, [hl+]                                 ;; 20:6E57 $2A
    cp   c                                        ;; 20:6E58 $B9
    jr   nz, .jr_020_6E5F                         ;; 20:6E59 $20 $04

    scf                                           ;; 20:6E5B $37
    ccf                                           ;; 20:6E5C $3F
    jr   .done                                    ;; 20:6E5D $18 $04

.jr_020_6E5F
    dec  b                                        ;; 20:6E5F $05
    jr   nz, .loop                                ;; 20:6E60 $20 $F5

    scf                                           ;; 20:6E62 $37

.done
    pop  hl                                       ;; 20:6E63 $E1
    ret                                           ;; 20:6E64 $C9

; List of overworld objects that should not be backed up in WRAM bank 2.
; This is used to prevent exiting the inventory menu from messing up the overlay grass tiles.
OverworldObjectIgnoreList::
    db   $03, $04, $09, $5E, $91, $A1, $AA, $C4, $C6, $CC, $DB, $E1, $E3, $E8

TilesetTables::

; Constants for Overworld tilesets
; See W_TILESET_* constants for values
OverworldTilesetsTable::
    db   W_TILESET_TURTLE_ROCK,      W_TILESET_TURTLE_ROCK,         W_TILESET_TARAMANCH_MIDDLE, W_TILESET_EGG,                  W_TILESET_TARAMANCH_MIDDLE, W_TILESET_TARAMANCH_MIDDLE, W_TILESET_TARAMANCH_MIDDLE, W_TILESET_EAGLES_TOWER
    db   W_TILESET_KEEP,             W_TILESET_GOPONGO_SWAMP,       W_TILESET_GOPONGO_SWAMP,    W_TILESET_CAMERA_SHOP,          W_TILESET_KEEP,             W_TILESET_ANGLERS_TUNNEL,   W_TILESET_KEEP,             W_TILESET_TARAMANCH_MIDDLE
    db   W_TILESET_MYSTERIOUS_WOODS, W_TILESET_MYSTERIOUS_WOODS,    W_TILESET_KEEP,             W_TILESET_GRAVEYARD,            W_TILESET_KANALET_CASTLE,   W_TILESET_KANALET_CASTLE,   W_TILESET_RAFTING_GAME,     W_TILESET_RAFTING_GAME
    db   W_TILESET_MYSTERIOUS_WOODS, W_TILESET_MYSTERIOUS_WOODS,    W_TILESET_GRAVEYARD,        W_TILESET_GRAVEYARD,            W_TILESET_KANALET_CASTLE,   W_TILESET_KANALET_CASTLE,   W_TILESET_RAFTING_GAME,     W_TILESET_RAFTING_GAME
    db   W_TILESET_KEEP,             W_TILESET_MABE_VILLAGE,        W_TILESET_KEEP,             W_TILESET_PRAIRIE_STONE_HEAD,   W_TILESET_KEEP,             W_TILESET_SEASHELL_MANSION, W_TILESET_FACE_SHRINE,      W_TILESET_KEEP
    db   W_TILESET_MABE_VILLAGE,     W_TILESET_MABE_VILLAGE,        W_TILESET_PRAIRIE_SOUTH,    W_TILESET_PRAIRIE_SOUTH,        W_TILESET_KEEP,             W_TILESET_FACE_SHRINE,      W_TILESET_FACE_SHRINE,      W_TILESET_FACE_SHRINE
    db   W_TILESET_KEEP,             W_TILESET_PRAIRIE_STONE_HEAD,  W_TILESET_PRAIRIE_SOUTH,    W_TILESET_PRAIRIE_SOUTH,        W_TILESET_MARTHAS_BAY,      W_TILESET_KEEP,             W_TILESET_MABE_VILLAGE,     W_TILESET_YARNA_DESERT
    db   W_TILESET_BEACH,            W_TILESET_BEACH,               W_TILESET_BEACH,            W_TILESET_KEEP,                 W_TILESET_MARTHAS_BAY,      W_TILESET_MARTHAS_BAY,      W_TILESET_KEEP,             W_TILESET_YARNA_DESERT

; Constants for Indoors tilesets, indexed by hRoomId.
; See W_TILESET_* constants for values
IndoorsTilesetsTable::
    db   W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01, W_TILESET_INDOOR_00, W_TILESET_INDOOR_05, W_TILESET_INDOOR_00, W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_NO_UPDATE
    db   W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_02, W_TILESET_INDOOR_01, W_TILESET_INDOOR_01, W_TILESET_INDOOR_01, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE
    db   W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_02, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0E
    db   W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE
    db   W_TILESET_INDOOR_02, W_TILESET_INDOOR_02, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_02, W_TILESET_INDOOR_02, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_02, W_TILESET_INDOOR_02, W_TILESET_INDOOR_09, W_TILESET_INDOOR_02, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09
    db   W_TILESET_INDOOR_09, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01, W_TILESET_INDOOR_01, W_TILESET_INDOOR_05, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0A, W_TILESET_INDOOR_0A, W_TILESET_INDOOR_0A, W_TILESET_INDOOR_0A, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00
    db   W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09, W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_02, W_TILESET_NO_UPDATE
    db   W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_INDOOR_01, W_TILESET_INDOOR_05, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00
    db   W_TILESET_NO_UPDATE, W_TILESET_INDOOR_05, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_06, W_TILESET_INDOOR_07, W_TILESET_INDOOR_07, W_TILESET_INDOOR_07, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_06, W_TILESET_INDOOR_06, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE
    db   W_TILESET_INDOOR_09, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_07, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_07, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_07, W_TILESET_INDOOR_05, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05
    db   W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_19, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE
    db   W_TILESET_INDOOR_03, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_03, W_TILESET_INDOOR_0E, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0E
    db   W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_09, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0E, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_02, W_TILESET_INDOOR_0E
    db   W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_02, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01, W_TILESET_INDOOR_01, W_TILESET_INDOOR_01, W_TILESET_INDOOR_09, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00
    db   W_TILESET_INDOOR_0F, W_TILESET_INDOOR_0F, W_TILESET_INDOOR_0F, W_TILESET_INDOOR_08, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_03, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_00
    db   W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_00, W_TILESET_INDOOR_19, W_TILESET_INDOOR_00, W_TILESET_INDOOR_08, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_03, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_08, W_TILESET_INDOOR_19, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_05, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_00

    db   W_TILESET_INDOOR_00, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01, W_TILESET_NO_UPDATE
    db   W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0B, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_03, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_07, W_TILESET_INDOOR_07, W_TILESET_NO_UPDATE
    db   W_TILESET_NO_UPDATE, W_TILESET_INDOOR_06, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_0E, W_TILESET_INDOOR_00
    db   W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_17, W_TILESET_INDOOR_17, W_TILESET_INDOOR_17, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_03, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE
    db   W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0A, W_TILESET_INDOOR_0A, W_TILESET_INDOOR_0A, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0A, W_TILESET_INDOOR_0A, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0B, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0D, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE
    db   W_TILESET_INDOOR_0A, W_TILESET_INDOOR_0A, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_00, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_09, W_TILESET_INDOOR_01, W_TILESET_INDOOR_00, W_TILESET_INDOOR_00
    db   W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01
    db   W_TILESET_INDOOR_0C, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_WINDFISH_FLOOR, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_01
    db   W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_01
    db   W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_04, W_TILESET_INDOOR_05, W_TILESET_INDOOR_04, W_TILESET_INDOOR_04, W_TILESET_INDOOR_04, W_TILESET_INDOOR_00, W_TILESET_INDOOR_08
    db   W_TILESET_INDOOR_04, W_TILESET_INDOOR_04, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_00, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_08, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C
    db   W_TILESET_INDOOR_08, W_TILESET_INDOOR_04, W_TILESET_INDOOR_05, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_04, W_TILESET_INDOOR_08, W_TILESET_INDOOR_05, W_TILESET_INDOOR_05, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_05, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C
    db   W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_03, W_TILESET_INDOOR_03, W_TILESET_INDOOR_00, W_TILESET_INDOOR_03, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_08, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_04, W_TILESET_INDOOR_04, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C
    db   W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_NO_UPDATE, W_TILESET_INDOOR_01, W_TILESET_INDOOR_00, W_TILESET_INDOOR_01, W_TILESET_INDOOR_01, W_TILESET_INDOOR_08, W_TILESET_INDOOR_00, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C
    db   W_TILESET_NO_UPDATE, W_TILESET_INDOOR_08, W_TILESET_INDOOR_08, W_TILESET_INDOOR_04, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_00, W_TILESET_INDOOR_08, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C
    db   W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_00, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_0C, W_TILESET_INDOOR_18, W_TILESET_INDOOR_05, W_TILESET_INDOOR_00, W_TILESET_INDOOR_08, W_TILESET_INDOOR_00

; Constants for Color Dungeon tilesets
; See W_TILESET_* constants for values
ColorDungeonTilesetsTable::
    db   $00, $00, $0B, $0B, $00, $00, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0E
    db   $0B, $0B, $0B, $18, $0B, $0B, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE, W_TILESET_NO_UPDATE

; Spritesheets group for each room, indexed by hRoomId.
;
; This gives a spritesheet group index, used to reference the actual 4 spritesheets in
; OverworldEntitySpritesheetsTable or IndoorsEntitySpritesheetsTable.
RoomSpritesheetGroupsTable::
.overworld ;; 20:70D3
    db   $65, $66, $67, $68, $69, $6D, $45, $46, $46, $00, $4E, $4E, $4E, $4E, $44, $50
    db   $20, $74, $6B, $6C, $6D, $6D, $37, $37, $4F, $1C, $4F, $4E, $4E, $4E, $50, $4E
    db   $02, $7D, $00, $0E, $48, $47, $37, $06, $06, $00, $51, $50, $50, $62, $62, $62
    db   $02, $7D, $00, $0E, $48, $47, $37, $06, $06, $00, $51, $51, $00, $62, $62, $62
    db   $00, $41, $7E, $7E, $7A, $06, $28, $28, $11, $11, $64, $63, $2D, $2D, $2D, $2D
    db   $01, $2E, $74, $7F, $38, $28, $28, $29, $11, $11, $11, $64, $2D, $2D, $2D, $2D
    db   $00, $00, $7E, $00, $00, $28, $29, $05, $58, $59, $5A, $00, $2D, $2D, $2D, $2D
    db   $7E, $7E, $7E, $7E, $3A, $3A, $28, $29, $5B, $5C, $00, $12, $2D, $2D, $2D, $2D
    db   $3D, $03, $0A, $0B, $39, $61, $18, $18, $4A, $2C, $72, $00, $2A, $6F, $2D, $2D
    db   $00, $00, $43, $0A, $40, $3E, $00, $00, $75, $5F, $73, $70, $2A, $6F, $2D, $2D
    db   $13, $0C, $0A, $00, $3B, $00, $3B, $3B, $5F, $54, $37, $71, $6E, $6E, $6E, $00
    db   $0F, $0C, $09, $09, $00, $3B, $3B, $3B, $77, $72, $70, $4B, $6E, $6E, $6E, $6E
    db   $08, $08, $07, $07, $3C, $3C, $3C, $00, $78, $23, $26, $57, $34, $35, $1D, $7B
    db   $07, $07, $07, $07, $3C, $3C, $3C, $7A, $79, $26, $1F, $53, $2F, $34, $00, $4D
    db   $07, $07, $00, $42, $00, $90, $91, $26, $26, $25, $36, $33, $31, $30, $7C, $4D
    db   $07, $07, $07, $00, $90, $90, $91, $00, $1F, $26, $1F, $00, $30, $21, $4C, $7C
.indoors_a ;; 20:71D3
    db   $01, $03, $0E, $07, $07, $00, $05, $01, $00, $03, $1C, $05, $01, $01, $01, $00
    db   $00, $02, $00, $03, $03, $03, $03, $03, $33, $33, $33, $33, $00, $00, $63, $63
    db   $14, $00, $14, $14, $00, $06, $13, $06, $13, $13, $0E, $08, $13, $08, $06, $07
    db   $06, $06, $00, $00, $1B, $1B, $06, $1B, $06, $00, $33, $33, $33, $33, $33, $33
    db   $18, $18, $18, $18, $00, $15, $00, $00, $17, $00, $17, $17, $06, $17, $06, $00
    db   $18, $3C, $3C, $3C, $17, $17, $17, $17, $17, $0E, $16, $00, $17, $01, $33, $33
    db   $00, $00, $0E, $31, $19, $30, $32, $32, $00, $00, $32, $32, $00, $32, $30, $30
    db   $00, $30, $32, $00, $30, $30, $00, $30, $30, $30, $30, $30, $33, $33, $00, $01
    db   $1E, $1E, $0F, $1E, $1E, $1D, $00, $00, $24, $24, $24, $00, $24, $24, $24, $24
    db   $24, $00, $1E, $1F, $1F, $1E, $1E, $04, $04, $00, $00, $04, $04, $04, $04, $04
    db   $04, $04, $33, $33, $33, $33, $33, $33, $33, $33, $64, $64, $80, $00, $00, $00
    db   $28, $28, $28, $28, $61, $0F, $61, $00, $00, $28, $28, $00, $25, $26, $61, $29
    db   $27, $00, $28, $61, $00, $26, $00, $29, $2A, $00, $00, $62, $00, $61, $00, $27
    db   $61, $61, $27, $27, $27, $27, $00, $61, $63, $63, $33, $33, $33, $33, $00, $00
    db   $44, $44, $44, $00, $4A, $67, $67, $00, $7F, $00, $00, $33, $33, $00, $6E, $1A
    db   $67, $67, $00, $80, $4A, $7E, $67, $00, $7F, $7F, $3D, $80, $10, $00, $6E, $1A
.indoors_b ;; 20:72D3
    db   $00, $00, $3F, $2C, $2C, $5E, $34, $39, $00, $5F, $60, $3E, $39, $2B, $2B, $00
    db   $39, $2D, $2D, $2D, $2D, $2D, $2D, $2E, $2D, $2D, $2D, $2E, $00, $2D, $2D, $00
    db   $36, $00, $35, $0F, $37, $35, $35, $00, $37, $00, $38, $35, $0F, $35, $38, $01
    db   $0F, $5C, $56, $00, $50, $5C, $00, $51, $56, $58, $5B, $5B, $00, $54, $00, $51
    db   $5A, $00, $59, $59, $00, $57, $5A, $59, $59, $00, $5C, $5C, $52, $00, $55, $00
    db   $5C, $5C, $00, $53, $52, $52, $00, $5B, $00, $5C, $00, $53, $52, $5B, $5A, $53
    db   $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $01, $01, $01, $3D
    db   $01, $01, $01, $01, $6F, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $3D
    db   $66, $66, $66, $01, $01, $66, $66, $66, $65, $65, $65, $65, $66, $66, $65, $3D
    db   $65, $65, $65, $65, $66, $66, $66, $0D, $0D, $09, $65, $09, $09, $09, $00, $49
    db   $10, $11, $20, $2F, $01, $0A, $0A, $0B, $0C, $09, $4B, $65, $65, $4C, $65, $65
    db   $10, $12, $0B, $65, $09, $01, $65, $65, $65, $65, $65, $65, $65, $65, $0D, $0D
    db   $00, $00, $21, $21, $21, $21, $21, $22, $66, $65, $65, $09, $09, $66, $0D, $0D
    db   $67, $67, $21, $21, $21, $21, $21, $40, $66, $41, $7D, $4D, $4D, $46, $66, $66
    db   $3A, $4E, $3A, $09, $66, $66, $65, $65, $3B, $47, $65, $65, $65, $65, $65, $65
    db   $3A, $67, $67, $67, $66, $7C, $65, $65, $3B, $67, $67, $43, $01, $45, $48, $00

Data_020_73D3::
    db   $04, $04, $04, $04, $04, $04, $04, $04
    db   $04, $04, $04, $04, $04, $04, $04, $04
    db   $04, $04, $04, $04, $04, $04, $04, $04
    db   $04, $04, $04, $04, $04, $04, $04, $04

; Which spritesheets to load for each room (Overworld),
; indexed by the value read from RoomSpritesheetGroupsTable.
;
; Contains 4 bytes per room (one for each spriteslot).
; See wLoadedEntitySpritesheets for the byte format.
OverworldEntitySpritesheetsTable::
._00  db   $A4, $FF, $FF, $FF ;; 20:73F3
._01  db   $A4, $8E, $7C, $C8
._02  db   $A4, $4A, $7C, $93 ;; 20:73FB
._03  db   $A4, $E5, $FF, $4E
._04  db   $A4, $91, $83, $A2 ;; 20:7403
._05  db   $A4, $42, $8A, $FF
._06  db   $A4, $42, $83, $A2 ;; 20:740B
._07  db   $A4, $81, $E3, $A2
._08  db   $A4, $E5, $E3, $FF ;; 20:7413
._09  db   $A4, $E5, $43, $E7
._0A  db   $A4, $E5, $E6, $FF ;; 20:741B
._0B  db   $A4, $E5, $E6, $E7
._0C  db   $A4, $E5, $43, $A4 ;; 20:7423
._0D  db   $A4, $8E, $83, $A4
._0E  db   $A4, $4A, $83, $40 ;; 20:742B
._0F  db   $A4, $E5, $4C, $E7
._10  db   $A4, $4D, $83, $FF ;; 20:7433
._11  db   $A4, $42, $92, $5A
._12  db   $A4, $61, $92, $67 ;; 20:743B
._13  db   $A4, $E5, $FF, $FF
._14  db   $A4, $E3, $8B, $FF ;; 20:7443
._15  db   $A4, $E3, $83, $76
._16  db   $A4, $81, $79, $76 ;; 20:744B
._17  db   $A4, $61, $8B, $FF
._18  db   $A4, $6C, $8B, $6B ;; 20:7453
._19  db   $A4, $FF, $8B, $FF
._1A  db   $A4, $E3, $8B, $A2 ;; 20:745B
._1B  db   $A4, $E5, $FF, $FF
._1C  db   $A4, $4A, $8F, $6D ;; 20:7463
._1D  db   $A4, $81, $6E, $52
._1E  db   $A4, $4D, $43, $A2 ;; 20:746B
._1F  db   $A4, $61, $79, $76
._20  db   $A4, $C6, $7C, $41 ;; 20:7473
._21  db   $A4, $C5, $6E, $6F
._22  db   $A4, $C5, $FF, $70 ;; 20:747B
._23  db   $A4, $61, $FF, $71
._24  db   $A4, $61, $FF, $72 ;; 20:7483
._25  db   $A4, $61, $79, $73
._26  db   $A4, $61, $79, $FF ;; 20:748B
._27  db   $A4, $E3, $79, $76
._28  db   $A4, $42, $82, $A2 ;; 20:7493
._29  db   $A4, $42, $FF, $82
._2A  db   $A4, $61, $78, $A2 ;; 20:749B
._2B  db   $A4, $81, $8F, $E7
._2C  db   $A4, $E3, $8B, $8C ;; 20:74A3
._2D  db   $A4, $87, $78, $A2
._2E  db   $A4, $6C, $7C, $C8 ;; 20:74AB
._2F  db   $A4, $C4, $E6, $CF
._30  db   $A4, $FF, $6E, $6F ;; 20:74B3
._31  db   $A4, $FF, $E6, $CF
._32  db   $A4, $FF, $83, $FF ;; 20:74BB
._33  db   $A4, $C4, $79, $76
._34  db   $A4, $C4, $FF, $FF ;; 20:74C3
._35  db   $A4, $C4, $43, $CF
._36  db   $A4, $FF, $79, $FF ;; 20:74CB
._37  db   $A4, $FF, $FF, $A2
._38  db   $A4, $61, $79, $A2 ;; 20:74D3
._39  db   $A4, $E5, $FF, $FF
._3A  db   $A4, $E5, $82, $A2 ;; 20:74DB
._3B  db   $A4, $E3, $83, $A2
._3C  db   $A4, $91, $83, $76 ;; 20:74E3
._3D  db   $A4, $FF, $7C, $A2
._3E  db   $A4, $E3, $8B, $A2 ;; 20:74EB
._3F  db   $A4, $E3, $FF, $76
._40  db   $A4, $FF, $E6, $A2 ;; 20:74F3
._41  db   $A4, $FF, $7C, $A2
._42  db   $A4, $81, $E3, $D4 ;; 20:74FB
._43  db   $A4, $E5, $E6, $DC
._44  db   $A4, $87, $D6, $D7 ;; 20:7503
._45  db   $A4, $50, $51, $A2
._46  db   $A4, $6C, $8F, $A2 ;; 20:750B
._47  db   $A4, $4A, $83, $A2
._48  db   $A4, $4A, $83, $FF ;; 20:7513
._49  db   $A4, $81, $8F, $76
._4A  db   $A4, $E3, $8B, $FF ;; 20:751B
._4B  db   $A4, $FF, $79, $FF
._4C  db   $A4, $81, $6E, $FF ;; 20:7523
._4D  db   $A4, $81, $6E, $8C
._4E  db   $A4, $87, $8F, $76 ;; 20:752B
._4F  db   $A4, $FF, $8F, $FF
._50  db   $A4, $87, $FF, $FF ;; 20:7533
._51  db   $A4, $87, $83, $76
._52  db   $A4, $87, $83, $98 ;; 20:753B
._53  db   $A4, $FF, $79, $76
._54  db   $A4, $E3, $83, $A2 ;; 20:7543
._55  db   $A4, $61, $79, $93
._56  db   $A4, $FF, $79, $93 ;; 20:754B
._57  db   $A4, $C4, $79, $FF
._58  db   $A4, $FF, $92, $5A ;; 20:7553
._59  db   $A4, $61, $92, $8C
._5A  db   $A4, $42, $92, $FF ;; 20:755B
._5B  db   $A4, $61, $FF, $FF
._5C  db   $A4, $61, $FF, $8C ;; 20:7563
._5D  db   $A4, $FF, $83, $93
._5E  db   $A4, $61, $8B, $FF ;; 20:756B
._5F  db   $A4, $E3, $FF, $FF
._60  db   $A4, $61, $FF, $67 ;; 20:7573
._61  db   $A4, $FF, $FF, $A2
._62  db   $A4, $87, $E3, $93 ;; 20:757B
._63  db   $A4, $87, $FF, $FF
._64  db   $A4, $87, $92, $5A ;; 20:7583
._65  db   $A4, $C6, $9C, $98
._66  db   $A4, $C6, $9C, $FF ;; 20:758B
._67  db   $A4, $FF, $9C, $93
._68  db   $A4, $81, $FF, $FF ;; 20:7593
._69  db   $A4, $FF, $9C, $98
._6A  db   $A4, $FF, $83, $FF ;; 20:759B
._6B  db   $A4, $81, $FF, $93
._6C  db   $A4, $81, $9C, $93 ;; 20:75A3
._6D  db   $A4, $44, $9C, $98
._6E  db   $A4, $91, $78, $A2 ;; 20:75AB
._6F  db   $A4, $FF, $78, $A2
._70  db   $A4, $61, $FF, $A2 ;; 20:75B3
._71  db   $A4, $FF, $79, $A2
._72  db   $A4, $61, $83, $FF ;; 20:75BB
._73  db   $A4, $FF, $83, $A2
._74  db   $A4, $FF, $7C, $FF ;; 20:75C3
._75  db   $A4, $E3, $8B, $A2
._76  db   $A4, $E3, $83, $FF ;; 20:75CB
._77  db   $A4, $FF, $83, $76
._78  db   $A4, $61, $83, $FF ;; 20:75D3
._79  db   $A4, $61, $FF, $76
._7A  db   $A4, $61, $FF, $A2 ;; 20:75DB
._7B  db   $A4, $81, $6E, $FF
._7C  db   $A4, $81, $FF, $8C ;; 20:75E3
._7D  db   $A4, $4A, $7C, $93
._7E  db   $A4, $91, $7C, $A2 ;; 20:75EB
._7F  db   $A4, $4D, $7C, $FF
._80  db   $A4, $FF, $FF, $FF ;; 20:75F3
._81  db   $A4, $FF, $FF, $FF
._82  db   $A4, $FF, $FF, $FF ;; 20:75FB
._83  db   $A4, $FF, $FF, $FF
._84  db   $A4, $FF, $FF, $FF ;; 20:7603
._85  db   $A4, $FF, $FF, $FF
._86  db   $A4, $FF, $FF, $FF ;; 20:760B
._87  db   $A4, $FF, $FF, $FF
._88  db   $A4, $FF, $FF, $FF ;; 20:7613
._89  db   $A4, $FF, $FF, $FF
._8A  db   $A4, $FF, $FF, $FF ;; 20:761B
._8B  db   $A4, $FF, $FF, $FF
._8C  db   $A4, $FF, $FF, $FF ;; 20:7623
._8D  db   $A4, $FF, $FF, $FF
._8E  db   $A4, $FF, $FF, $FF ;; 20:762B
._8F  db   $A4, $FF, $FF, $FF
._90  db   $A4, $81, $8F, $D4 ;; 20:7633
._91  db   $A4, $81, $79, $FF

; Which spritesheets to load for each room (Indoors),
; indexed by the value read from RoomSpritesheetGroupsTable * 4
;
; Contains 4 bytes per room (one for each spriteslot).
; See wLoadedEntitySpritesheets for the byte format.
IndoorEntitySpritesheetsTable::
._00  db   $FF, $FF, $FF, $FF ;; 20:763B
._01  db   $90, $91, $92, $98
._02  db   $90, $91, $AB, $FF ;; 20:7643
._03  db   $90, $91, $92, $93
._04  db   $90, $91, $94, $9F ;; 20:764B
._05  db   $90, $91, $B0, $B1
._06  db   $90, $91, $9C, $93 ;; 20:7653
._07  db   $90, $91, $97, $9B
._08  db   $FF, $FF, $B6, $B7 ;; 20:765B
._09  db   $A4, $4C, $49, $46
._0A  db   $A4, $FF, $45, $6D ;; 20:7663
._0B  db   $A4, $FF, $47, $48
._0C  db   $A4, $FF, $4C, $4B ;; 20:766B
._0D  db   $90, $91, $96, $FF
._0E  db   $FF, $FF, $4F, $50 ;; 20:7673
._0F  db   $FF, $FF, $4F, $51
._10  db   $A4, $87, $84, $89 ;; 20:767B
._11  db   $A4, $FF, $88, $C7
._12  db   $A0, $A1, $84, $83 ;; 20:7683
._13  db   $90, $91, $54, $A6
._14  db   $90, $91, $97, $93 ;; 20:768B
._15  db   $90, $91, $AA, $FF
._16  db   $90, $91, $B4, $B5 ;; 20:7693
._17  db   $90, $91, $9C, $9E
._18  db   $90, $91, $9C, $9D ;; 20:769B
._19  db   $68, $91, $56, $60
._1A  db   $AC, $AD, $AE, $AF ;; 20:76A3
._1B  db   $90, $91, $58, $9B
._1C  db   $90, $91, $A6, $59 ;; 20:76AB
._1D  db   $FF, $FF, $B8, $B9
._1E  db   $90, $91, $62, $63 ;; 20:76B3
._1F  db   $90, $91, $A8, $9F
._20  db   $A4, $DF, $A3, $FF ;; 20:76BB
._21  db   $90, $91, $92, $9A
._22  db   $A4, $5B, $5C, $FF ;; 20:76C3
._23  db   $A6, $91, $97, $9B
._24  db   $90, $91, $9C, $60 ;; 20:76CB
._25  db   $FF, $FF, $B2, $B3
._26  db   $A6, $91, $57, $FF ;; 20:76D3
._27  db   $A6, $91, $95, $98
._28  db   $A6, $91, $5E, $60 ;; 20:76DB
._29  db   $A6, $91, $AA, $93
._2A  db   $A6, $91, $58, $99 ;; 20:76E3
._2B  db   $90, $91, $95, $93
._2C  db   $5F, $91, $55, $99 ;; 20:76EB
._2D  db   $66, $91, $5E, $59
._2E  db   $66, $91, $54, $59 ;; 20:76F3
._2F  db   $8D, $8E, $8F, $6A
._30  db   $68, $91, $9B, $60 ;; 20:76FB
._31  db   $68, $91, $94, $9F
._32  db   $68, $91, $9C, $60 ;; 20:7703
._33  db   $5F, $65, $5D, $64
._34  db   $FF, $91, $55, $FF ;; 20:770B
._35  db   $5F, $91, $95, $99
._36  db   $5F, $91, $5E, $99 ;; 20:7713
._37  db   $5F, $91, $A9, $FF
._38  db   $5F, $91, $94, $9F ;; 20:771B
._39  db   $90, $91, $55, $93
._3A  db   $A4, $FF, $7C, $FF ;; 20:7723
._3B  db   $BC, $BD, $BE, $BF
._3C  db   $A6, $91, $9C, $9D ;; 20:772B
._3D  db   $FF, $D5, $78, $53
._3E  db   $90, $91, $FF, $FF ;; 20:7733
._3F  db   $5F, $91, $55, $98
._40  db   $A4, $FF, $FF, $69 ;; 20:773B
._41  db   $A4, $FF, $4C, $74
._42  db   $A0, $A1, $75, $4E ;; 20:7743
._43  db   $A4, $7D, $7E, $7F
._44  db   $A4, $FF, $FF, $C7 ;; 20:774B
._45  db   $C0, $C1, $C2, $C3
._46  db   $A4, $CC, $CD, $CE ;; 20:7753
._47  db   $A4, $C9, $CA, $CB
._48  db   $A4, $D1, $D2, $6A ;; 20:775B
._49  db   $DD, $E5, $D3, $DD
._4A  db   $DD, $FF, $DE, $FF ;; 20:7763
._4B  db   $A4, $8D, $FF, $FF
._4C  db   $FF, $DF, $49, $FF ;; 20:776B
._4D  db   $FF, $C4, $FF, $FF
._4E  db   $A4, $80, $7C, $A5 ;; 20:7773
._4F  db   $FF, $FF, $FF, $FF
._50  db   $FF, $FF, $BA, $BB ;; 20:777B
._51  db   $77, $91, $A7, $FF
._52  db   $7B, $91, $7A, $AB ;; 20:7783
._53  db   $7B, $91, $57, $99
._54  db   $77, $91, $7A, $AA ;; 20:778B
._55  db   $7B, $91, $54, $99
._56  db   $7B, $91, $56, $FF ;; 20:7793
._57  db   $77, $91, $54, $99
._58  db   $7B, $91, $FF, $FF ;; 20:779B
._59  db   $5F, $91, $9D, $99
._5A  db   $7B, $91, $96, $99 ;; 20:77A3
._5B  db   $7B, $91, $7A, $99
._5C  db   $77, $91, $7A, $99 ;; 20:77AB
._5D  db   $77, $91, $96, $99
._5E  db   $5F, $91, $55, $93 ;; 20:77B3
._5F  db   $FF, $91, $95, $93
._60  db   $90, $91, $55, $93 ;; 20:77BB
._61  db   $A6, $91, $95, $60
._62  db   $A6, $91, $95, $99 ;; 20:77C3
._63  db   $5F, $D9, $DA, $DB
._64  db   $5F, $D9, $DA, $64 ;; 20:77CB
._65  db   $FF, $91, $90, $76
._66  db   $FF, $91, $90, $98 ;; 20:77D3
._67  db   $FF, $4A, $90, $76
._68  db   $5F, $FF, $FF, $FF ;; 20:77DB
._69  db   $FF, $FF, $FF, $FF
._6A  db   $FF, $FF, $FF, $FF ;; 20:77E3
._6B  db   $FF, $FF, $FF, $FF
._6C  db   $FF, $FF, $FF, $FF ;; 20:77EB
._6D  db   $FF, $91, $90, $A6
._6E  db   $A4, $FF, $FF, $F4 ;; 20:77F3
._6F  db   $E8, $E9, $EA, $EB
._70  db   $FF, $FF, $FF, $FF ;; 20:77FB
._71  db   $FF, $FF, $FF, $FF
._72  db   $FF, $FF, $FF, $FF ;; 20:7803
._73  db   $FF, $FF, $FF, $FF
._74  db   $FF, $FF, $FF, $FF ;; 20:780B
._75  db   $FF, $FF, $FF, $FF
._76  db   $FF, $FF, $FF, $FF ;; 20:7813
._77  db   $FF, $FF, $FF, $FF
._78  db   $FF, $FF, $FF, $FF ;; 20:781B
._79  db   $FF, $FF, $FF, $FF
._7A  db   $FF, $FF, $FF, $FF ;; 20:7823
._7B  db   $FF, $FF, $FF, $FF
._7C  db   $44, $A1, $75, $4E ;; 20:782B
._7D  db   $FF, $61, $FF, $FF
._7E  db   $A4, $FF, $86, $FF ;; 20:7833
._7F  db   $A4, $FF, $8B, $FF
._80  db   $A4, $4D, $FF, $FF ;; 20:783B

EndingWaterGeyserPalettes::
    dw   Data_020_7845
    dw   Data_020_787D
    dw   Data_020_78B5

Data_020_7845:
    db   $00, $00
    db   $C5, $4C
    db   $68, $7D
    db   $FF, $7F
    db   $00, $00
    db   $62, $3C
    db   $E5, $68
    db   $D6, $5E
    db   $00, $00
    db   $00, $20
    db   $00, $50
    db   $AD, $35
    db   $00, $00
    db   $0F, $66
    db   $D6, $6E
    db   $FF, $7F
    db   $0F, $66
    db   $0F, $66
    db   $D6, $6E
    db   $FF, $7F
    db   $AC, $59
    db   $0F, $66
    db   $D6, $6E
    db   $FF, $7F
    db   $49, $4D
    db   $0F, $66
    db   $D6, $6E
    db   $FF, $7F

Data_020_787D:
    db   $00, $00
    db   $68, $7D
    db   $FF, $7F
    db   $C5, $4C
    db   $00, $00
    db   $E5, $68
    db   $D6, $5E
    db   $62, $3C
    db   $00, $00
    db   $00, $50
    db   $AD, $35
    db   $00, $20
    db   $00, $00
    db   $D6, $6E
    db   $FF, $7F
    db   $0F, $66
    db   $C5, $4C
    db   $D6, $6E
    db   $FF, $7F
    db   $0F, $66
    db   $62, $3C
    db   $D6, $6E
    db   $FF, $7F
    db   $0F, $66
    db   $00, $20
    db   $D6, $6E
    db   $FF, $7F
    db   $0F, $66

Data_020_78B5:
    db   $00, $00
    db   $FF, $7F
    db   $C5, $4C
    db   $68, $7D
    db   $00, $00
    db   $D6, $5E
    db   $62, $3C
    db   $E5, $68
    db   $00, $00
    db   $AD, $35
    db   $00, $20
    db   $00, $50
    db   $00, $00
    db   $FF, $7F
    db   $0F, $66
    db   $D6, $6E
    db   $68, $7D
    db   $FF, $7F
    db   $0F, $66
    db   $D6, $6E
    db   $E5, $68
    db   $FF, $7F
    db   $0F, $66
    db   $D6, $6E
    db   $00, $50
    db   $FF, $7F
    db   $0F, $66
    db   $D6, $6E

; Copy palette data to wDC10
; (Called during the Credits water geyser sequence; to animate the water?)
func_020_78ED::
    ld   a, [wCreditsScratch0]                    ;; 20:78ED $FA $00 $D0
    sla  a                                        ;; 20:78F0 $CB $27
    ld   e, a                                     ;; 20:78F2 $5F
    ld   d, $00                                   ;; 20:78F3 $16 $00
    ld   hl, EndingWaterGeyserPalettes            ;; 20:78F5 $21 $3F $78
    add  hl, de                                   ;; 20:78F8 $19
    ld   a, [hl+]                                 ;; 20:78F9 $2A
    ld   b, a                                     ;; 20:78FA $47
    ld   h, [hl]                                  ;; 20:78FB $66
    ld   l, b                                     ;; 20:78FC $68

    ld   bc, $38                                  ;; 20:78FD $01 $38 $00
    ld   de, wBGPal1                              ;; 20:7900 $11 $10 $DC
    call CopyData                                 ;; 20:7903 $CD $14 $29

    xor  a                                        ;; 20:7906 $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 20:7907 $EA $D3 $DD
    ld   a, $1C                                   ;; 20:790A $3E $1C
    ld   [wPalettePartialCopyColorCount], a       ;; 20:790C $EA $D4 $DD
    ld   a, $81                                   ;; 20:790F $3E $81
    ld   [wPaletteDataFlags], a                   ;; 20:7911 $EA $D1 $DD
    ret                                           ;; 20:7914 $C9

Data_020_7915::
    db   $00, $00, $10, $17, $00, $08, $04, $17, $00, $10, $06, $17, $00, $18, $06, $37
    db   $00, $20, $04, $37, $00, $28, $10, $37, $10, $00, $08, $17, $10, $08, $0A, $17
    db   $10, $10, $0C, $17, $10, $18, $0C, $37, $10, $20, $0A, $37, $10, $28, $08, $37
    db   $20, $10, $20, $17, $20, $18, $30, $17, $30, $10, $20, $17, $30, $18, $30, $17
    db   $40, $10, $20, $17, $40, $18, $30, $17, $50, $10, $20, $17, $50, $18, $30, $17
    db   $60, $10, $20, $17, $60, $18, $30, $17, $70, $10, $20, $17, $70, $18, $30, $17
    db   $80, $10, $20, $17, $80, $18, $30, $17, $90, $10, $20, $17, $90, $18, $30, $17
    db   $A0, $10, $20, $17, $A0, $18, $30, $17, $B0, $10, $20, $17, $B0, $18, $30, $17

Data_020_7995::
    db   $00, $00, $12, $17, $00, $08, $14, $17, $00, $10, $16, $17, $00, $18, $16, $37
    db   $00, $20, $14, $37, $00, $28, $12, $37, $10, $00, $18, $17, $10, $08, $1A, $17
    db   $10, $10, $1C, $17, $10, $18, $1C, $37, $10, $20, $1A, $37, $10, $28, $18, $37
    db   $20, $10, $40, $17, $20, $18, $50, $17, $30, $10, $40, $17, $30, $18, $50, $17
    db   $40, $10, $40, $17, $40, $18, $50, $17, $50, $10, $40, $17, $50, $18, $50, $17
    db   $60, $10, $40, $17, $60, $18, $50, $17, $70, $10, $40, $17, $70, $18, $50, $17
    db   $80, $10, $40, $17, $80, $18, $50, $17, $90, $10, $40, $17, $90, $18, $50, $17
    db   $A0, $10, $40, $17, $A0, $18, $50, $17, $B0, $10, $40, $17, $B0, $18, $50, $17

Data_020_7A15::
    db   $00, $00, $22, $17, $00, $08, $24, $17, $00, $10, $26, $17, $00, $18, $26, $37
    db   $00, $20, $24, $37, $00, $28, $22, $37, $10, $00, $28, $17, $10, $08, $2A, $17
    db   $10, $10, $2C, $17, $10, $18, $2C, $37, $10, $20, $2A, $37, $10, $28, $28, $37
    db   $20, $10, $60, $17, $20, $18, $70, $17, $30, $10, $60, $17, $30, $18, $70, $17
    db   $40, $10, $60, $17, $40, $18, $70, $17, $50, $10, $60, $17, $50, $18, $70, $17
    db   $60, $10, $60, $17, $60, $18, $70, $17, $70, $10, $60, $17, $70, $18, $70, $17
    db   $80, $10, $60, $17, $80, $18, $70, $17, $90, $10, $60, $17, $90, $18, $70, $17
    db   $A0, $10, $60, $17, $A0, $18, $70, $17, $B0, $10, $60, $17, $B0, $18, $70, $17

Data_020_7A95::
    db   $00, $00, $32, $17, $00, $08, $34, $17, $00, $10, $36, $17, $00, $18, $36, $37
    db   $00, $20, $34, $37, $00, $28, $32, $37, $10, $00, $38, $17, $10, $08, $3A, $17
    db   $10, $10, $3C, $17, $10, $18, $3C, $37, $10, $20, $3A, $37, $10, $28, $38, $37
    db   $20, $10, $52, $17, $20, $18, $62, $17, $30, $10, $52, $17, $30, $18, $62, $17
    db   $40, $10, $52, $17, $40, $18, $62, $17, $50, $10, $52, $17, $50, $18, $62, $17
    db   $60, $10, $52, $17, $60, $18, $62, $17, $70, $10, $52, $17, $70, $18, $62, $17
    db   $80, $10, $52, $17, $80, $18, $62, $17, $90, $10, $52, $17, $90, $18, $62, $17
    db   $A0, $10, $52, $17, $A0, $18, $62, $17, $B0, $10, $52, $17, $B0, $18, $62, $17

Data_020_7B15::
    db   $00, $00, $42, $17, $00, $08, $44, $17, $00, $10, $46, $17, $00, $18, $46, $37
    db   $00, $20, $44, $37, $00, $28, $42, $37, $10, $00, $48, $17, $10, $08, $4A, $17
    db   $10, $10, $4C, $17, $10, $18, $4C, $37, $10, $20, $4A, $37, $10, $28, $08, $37
    db   $20, $10, $56, $17, $20, $18, $66, $17, $30, $10, $56, $17, $30, $18, $66, $17
    db   $40, $10, $56, $17, $40, $18, $66, $17, $50, $10, $56, $17, $50, $18, $66, $17
    db   $60, $10, $56, $17, $60, $18, $66, $17, $70, $10, $56, $17, $70, $18, $66, $17
    db   $80, $10, $56, $17, $80, $18, $66, $17, $90, $10, $56, $17, $90, $18, $66, $17
    db   $A0, $10, $56, $17, $A0, $18, $66, $17, $B0, $10, $56, $17, $B0, $18, $66, $17

Data_020_7B95::
    db   $70, $68, $60, $58, $50, $48, $40, $38, $30, $30, $30, $30, $30, $30, $80, $78

func_020_7BA5::
    push bc                                       ;; 20:7BA5 $C5
    ldh  a, [hActiveEntityVisualPosY]             ;; 20:7BA6 $F0 $EC
    swap a                                        ;; 20:7BA8 $CB $37
    and  $0F                                      ;; 20:7BAA $E6 $0F
    ld   e, a                                     ;; 20:7BAC $5F
    ld   d, b                                     ;; 20:7BAD $50
    ld   hl, Data_020_7B95                        ;; 20:7BAE $21 $95 $7B
    add  hl, de                                   ;; 20:7BB1 $19
    ld   b, [hl]                                  ;; 20:7BB2 $46
    ld   hl, Data_020_7915                        ;; 20:7BB3 $21 $15 $79
    ldh  a, [hActiveEntitySpriteVariant]          ;; 20:7BB6 $F0 $F1
    cp   $05                                      ;; 20:7BB8 $FE $05
    jr   z, jr_020_7BFC                           ;; 20:7BBA $28 $40

    and  a                                        ;; 20:7BBC $A7
    jr   z, jr_020_7BD4                           ;; 20:7BBD $28 $15

    ld   hl, Data_020_7995                        ;; 20:7BBF $21 $95 $79

.jr_7BC2
    dec  a                                        ;; 20:7BC2 $3D
    jr   z, jr_020_7BD4                           ;; 20:7BC3 $28 $0F

    ld   hl, Data_020_7A15                        ;; 20:7BC5 $21 $15 $7A
    dec  a                                        ;; 20:7BC8 $3D
    jr   z, jr_020_7BD4                           ;; 20:7BC9 $28 $09

    ld   hl, Data_020_7A95                        ;; 20:7BCB $21 $95 $7A

.jr_7BCE
    dec  a                                        ;; 20:7BCE $3D
    jr   z, jr_020_7BD4                           ;; 20:7BCF $28 $03

    ld   hl, Data_020_7B15                        ;; 20:7BD1 $21 $15 $7B

jr_020_7BD4:
    ld   de, wOAMBuffer+12                        ;; 20:7BD4 $11 $0C $C0
    ld   c, $00                                   ;; 20:7BD7 $0E $00

.loop
    ld   a, c                                     ;; 20:7BD9 $79
    and  $03                                      ;; 20:7BDA $E6 $03
    cp   $00                                      ;; 20:7BDC $FE $00
    jr   nz, .jr_020_7BE4                         ;; 20:7BDE $20 $04

    ldh  a, [hActiveEntityVisualPosY]             ;; 20:7BE0 $F0 $EC
    jr   .jr_020_7BF0                             ;; 20:7BE2 $18 $0C

.jr_020_7BE4
    cp   $01                                      ;; 20:7BE4 $FE $01
    jr   nz, .jr_020_7BF3                         ;; 20:7BE6 $20 $0B

    push hl                                       ;; 20:7BE8 $E5
    ld   hl, wScreenShakeHorizontal               ;; 20:7BE9 $21 $55 $C1
    ldh  a, [hActiveEntityPosX]                   ;; 20:7BEC $F0 $EE
    sub  [hl]                                     ;; 20:7BEE $96
    pop  hl                                       ;; 20:7BEF $E1

.jr_020_7BF0
    add  [hl]                                     ;; 20:7BF0 $86
    jr   .jr_020_7BF4                             ;; 20:7BF1 $18 $01

.jr_020_7BF3
    ld   a, [hl]                                  ;; 20:7BF3 $7E
.jr_020_7BF4
    ld   [de], a                                  ;; 20:7BF4 $12
    inc  hl                                       ;; 20:7BF5 $23
    inc  de                                       ;; 20:7BF6 $13
    inc  c                                        ;; 20:7BF7 $0C
    ld   a, c                                     ;; 20:7BF8 $79
    cp   b                                        ;; 20:7BF9 $B8
    jr   nz, .loop                                ;; 20:7BFA $20 $DD

jr_020_7BFC:
    pop  bc                                       ;; 20:7BFC $C1
    ret                                           ;; 20:7BFD $C9

Data_020_7BFE::
    db   $48, $71, $31, $56, $31, $56, $9C, $73
    db   $27, $65, $EF, $4D, $EF, $4D, $39, $67
    db   $06, $69, $AD, $45, $AD, $45, $D6, $5A
    db   $E5, $4C, $6B, $3D, $6B, $3D, $73, $4E
    db   $A4, $3C, $29, $31, $29, $31, $EF, $3D

func_020_7C26::
    ld   a, [wD00D]                               ;; 20:7C26 $FA $0D $D0
    cp   $50                                      ;; 20:7C29 $FE $50
    ret  nc                                       ;; 20:7C2B $D0

    ld   b, a                                     ;; 20:7C2C $47
    and  $0F                                      ;; 20:7C2D $E6 $0F
    ret  nz                                       ;; 20:7C2F $C0

    ld   a, b                                     ;; 20:7C30 $78
    and  $F0                                      ;; 20:7C31 $E6 $F0
    srl  a                                        ;; 20:7C33 $CB $3F
    ld   c, a                                     ;; 20:7C35 $4F
    ld   b, $00                                   ;; 20:7C36 $06 $00
    push bc                                       ;; 20:7C38 $C5

    ld   hl, Data_020_7BFE                        ;; 20:7C39 $21 $FE $7B
    add  hl, bc                                   ;; 20:7C3C $09
    ld   bc, $08                                  ;; 20:7C3D $01 $08 $00
    ld   de, wBGPal1                              ;; 20:7C40 $11 $10 $DC
    call CopyData                                 ;; 20:7C43 $CD $14 $29

    pop  bc                                       ;; 20:7C46 $C1
    ld   a, c                                     ;; 20:7C47 $79
    cp   $20                                      ;; 20:7C48 $FE $20
    jr   z, .jr_7C50                              ;; 20:7C4A $28 $04

    ld   a, $04                                   ;; 20:7C4C $3E $04
    jr   jr_020_7C5B                              ;; 20:7C4E $18 $0B

.jr_7C50
    ld   hl, wBGPal8                              ;; 20:7C50 $21 $48 $DC
    ld   a, $A4                                   ;; 20:7C53 $3E $A4
    ld   [hl+], a                                 ;; 20:7C55 $22
    ld   a, $3C                                   ;; 20:7C56 $3E $3C
    ld   [hl], a                                  ;; 20:7C58 $77
    ld   a, $20                                   ;; 20:7C59 $3E $20

jr_020_7C5B:
    ld   [wPalettePartialCopyColorCount], a       ;; 20:7C5B $EA $D4 $DD
    xor  a                                        ;; 20:7C5E $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 20:7C5F $EA $D3 $DD
    ld   a, $81                                   ;; 20:7C62 $3E $81
    ld   [wPaletteDataFlags], a                   ;; 20:7C64 $EA $D1 $DD
    ret                                           ;; 20:7C67 $C9

Data_020_7C68::
IF __PATCH_1__
    db   $00, $19, $4F, $06, $03, $10, $4E, $06, $05, $08, $4D, $06
ELSE
    db   $00, $19, $5B, $06, $03, $10, $5A, $06, $05, $08, $59, $06
ENDC

Data_020_7C74::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ;; 20:7C74
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ;; 20:7C7C
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ;; 20:7C84
    db   $08, $08, $C1, $05, $00, $08, $C0, $05   ;; 20:7C8C
    db   $10, $00, $5D, $05, $08, $00, $5C, $05   ;; 20:7C94

Data_020_7C9C::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ;; 20:7C9C
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ;; 20:7CA4
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ;; 20:7CAC
    db   $08, $08, $C1, $05, $00, $08, $C0, $05   ;; 20:7CB4
    db   $10, $00, $5F, $05, $08, $00, $5E, $05   ;; 20:7CBC

Data_020_7CC4::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ;; 20:7CC4
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ;; 20:7CCC
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ;; 20:7CD4
    db   $08, $08, $D1, $05, $00, $08, $D0, $05   ;; 20:7CDC
    db   $10, $00, $ED, $05, $08, $00, $EC, $05   ;; 20:7CE4

Data_020_7CEC::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ;; 20:7CEC
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ;; 20:7CF4
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ;; 20:7CFC
    db   $08, $08, $D1, $05, $00, $08, $D0, $05   ;; 20:7D04
    db   $10, $00, $EF, $05, $08, $00, $EE, $05   ;; 20:7D0C

Data_020_7D14::
    dw   Data_020_7C74
    dw   Data_020_7C9C
    dw   Data_020_7CC4
    dw   Data_020_7CEC

func_020_7D1C::
    ld   a, $6C                                   ;; 20:7D1C $3E $6C
    ld   [wOAMNextAvailableSlot], a               ;; 20:7D1E $EA $C0 $C3
    ldh  a, [hFrameCounter]                       ;; 20:7D21 $F0 $E7
    and  $60                                      ;; 20:7D23 $E6 $60
    swap a                                        ;; 20:7D25 $CB $37
    ld   e, a                                     ;; 20:7D27 $5F
    ld   d, $00                                   ;; 20:7D28 $16 $00
    ld   hl, Data_020_7D14                        ;; 20:7D2A $21 $14 $7D
    add  hl, de                                   ;; 20:7D2D $19
    ld   a, [hl+]                                 ;; 20:7D2E $2A
    ld   d, a                                     ;; 20:7D2F $57
    ld   h, [hl]                                  ;; 20:7D30 $66
    ld   l, d                                     ;; 20:7D31 $6A
    ld   c, $28                                   ;; 20:7D32 $0E $28
    call func_020_7D40                            ;; 20:7D34 $CD $40 $7D
    ld   hl, Data_020_7C68                        ;; 20:7D37 $21 $68 $7C
    ld   c, $0C                                   ;; 20:7D3A $0E $0C
    call func_020_7D40                            ;; 20:7D3C $CD $40 $7D
    ret                                           ;; 20:7D3F $C9

func_020_7D40::
    push bc                                       ;; 20:7D40 $C5
    push hl                                       ;; 20:7D41 $E5
    ld   a, [wOAMNextAvailableSlot]               ;; 20:7D42 $FA $C0 $C3
    ld   e, a                                     ;; 20:7D45 $5F
    ld   d, $00                                   ;; 20:7D46 $16 $00
    ld   hl, wOAMBuffer                           ;; 20:7D48 $21 $00 $C0
    add  hl, de                                   ;; 20:7D4B $19
    ld   d, h                                     ;; 20:7D4C $54
    ld   e, l                                     ;; 20:7D4D $5D
    pop  hl                                       ;; 20:7D4E $E1
    ld   a, c                                     ;; 20:7D4F $79
    srl  a                                        ;; 20:7D50 $CB $3F
    srl  a                                        ;; 20:7D52 $CB $3F
    ld   c, a                                     ;; 20:7D54 $4F

.loop_7D55
    ldh  a, [hActiveEntityVisualPosY]             ;; 20:7D55 $F0 $EC
    add  [hl]                                     ;; 20:7D57 $86
    ld   [de], a                                  ;; 20:7D58 $12
    inc  de                                       ;; 20:7D59 $13
    inc  hl                                       ;; 20:7D5A $23
    ldh  a, [hActiveEntityPosX]                   ;; 20:7D5B $F0 $EE
    add  [hl]                                     ;; 20:7D5D $86
    ld   [de], a                                  ;; 20:7D5E $12
    inc  de                                       ;; 20:7D5F $13
    inc  hl                                       ;; 20:7D60 $23
    ld   a, [hl+]                                 ;; 20:7D61 $2A
    ld   [de], a                                  ;; 20:7D62 $12
    inc  de                                       ;; 20:7D63 $13
    ld   a, [hl+]                                 ;; 20:7D64 $2A
    ld   [de], a                                  ;; 20:7D65 $12
    inc  de                                       ;; 20:7D66 $13
    dec  c                                        ;; 20:7D67 $0D
    jr   nz, .loop_7D55                           ;; 20:7D68 $20 $EB

    pop  bc                                       ;; 20:7D6A $C1
    ld   a, [wOAMNextAvailableSlot]               ;; 20:7D6B $FA $C0 $C3
    add  c                                        ;; 20:7D6E $81
    cp   $A0                                      ;; 20:7D6F $FE $A0
    jr   c, .jr_7D74                              ;; 20:7D71 $38 $01

    xor  a                                        ;; 20:7D73 $AF

.jr_7D74
    ld   [wOAMNextAvailableSlot], a               ;; 20:7D74 $EA $C0 $C3
    ld   a, [wActiveEntityIndex]                  ;; 20:7D77 $FA $23 $C1
    ld   c, a                                     ;; 20:7D7A $4F
    ret                                           ;; 20:7D7B $C9

func_020_7D7C::
    ld   a, $03                                   ;; 20:7D7C $3E $03
    ldh  [hMultiPurposeD], a                      ;; 20:7D7E $E0 $E4
    ld   a, $06                                   ;; 20:7D80 $3E $06
    ldh  [hMultiPurposeE], a                      ;; 20:7D82 $E0 $E5
    ld   a, $0C                                   ;; 20:7D84 $3E $0C
    ldh  [hFreeWarpDataAddress], a                ;; 20:7D86 $E0 $E6
    ld   hl, wBGPal1                              ;; 20:7D88 $21 $10 $DC
    ld   d, $24                                   ;; 20:7D8B $16 $24
    call jr_020_7D97                              ;; 20:7D8D $CD $97 $7D
    ld   a, $01                                   ;; 20:7D90 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 20:7D92 $EA $D1 $DD
    xor  a                                        ;; 20:7D95 $AF
    ret                                           ;; 20:7D96 $C9

jr_020_7D97:
    push hl                                       ;; 20:7D97 $E5
    ldh  a, [hMultiPurposeD]                      ;; 20:7D98 $F0 $E4
    ld   c, a                                     ;; 20:7D9A $4F
    ld   a, [hl]                                  ;; 20:7D9B $7E
    and  $1F                                      ;; 20:7D9C $E6 $1F
    jr   z, .jr_7DA4                              ;; 20:7D9E $28 $04

    sub  c                                        ;; 20:7DA0 $91
    jr   nc, .jr_7DA4                             ;; 20:7DA1 $30 $01

    xor  a                                        ;; 20:7DA3 $AF

.jr_7DA4
    ldh  [hMultiPurpose0], a                      ;; 20:7DA4 $E0 $D7
    ldh  a, [hMultiPurposeE]                      ;; 20:7DA6 $F0 $E5
    ld   c, a                                     ;; 20:7DA8 $4F
    ld   a, [hl+]                                 ;; 20:7DA9 $2A
    and  $E0                                      ;; 20:7DAA $E6 $E0
    swap a                                        ;; 20:7DAC $CB $37
    ld   b, a                                     ;; 20:7DAE $47
    ld   a, [hl]                                  ;; 20:7DAF $7E
    and  $03                                      ;; 20:7DB0 $E6 $03
    swap a                                        ;; 20:7DB2 $CB $37
    or   b                                        ;; 20:7DB4 $B0
    and  $3E                                      ;; 20:7DB5 $E6 $3E
    jr   z, .jr_7DBD                              ;; 20:7DB7 $28 $04

    sub  c                                        ;; 20:7DB9 $91
    jr   nc, .jr_7DBD                             ;; 20:7DBA $30 $01

    xor  a                                        ;; 20:7DBC $AF

.jr_7DBD
    ldh  [hMultiPurpose1], a                      ;; 20:7DBD $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ;; 20:7DBF $F0 $E6
    ld   c, a                                     ;; 20:7DC1 $4F
    ld   a, [hl]                                  ;; 20:7DC2 $7E
    and  $7C                                      ;; 20:7DC3 $E6 $7C
    jr   z, .jr_7DCB                              ;; 20:7DC5 $28 $04

    sub  c                                        ;; 20:7DC7 $91
    jr   nc, .jr_7DCB                             ;; 20:7DC8 $30 $01

    xor  a                                        ;; 20:7DCA $AF

.jr_7DCB
    ldh  [hMultiPurpose2], a                      ;; 20:7DCB $E0 $D9
    pop  hl                                       ;; 20:7DCD $E1
    ldh  a, [hMultiPurpose0]                      ;; 20:7DCE $F0 $D7
    ld   b, a                                     ;; 20:7DD0 $47
    ldh  a, [hMultiPurpose1]                      ;; 20:7DD1 $F0 $D8
    swap a                                        ;; 20:7DD3 $CB $37
    ld   c, a                                     ;; 20:7DD5 $4F
    and  $E0                                      ;; 20:7DD6 $E6 $E0
    or   b                                        ;; 20:7DD8 $B0
    ld   [hl+], a                                 ;; 20:7DD9 $22
    ldh  a, [hMultiPurpose2]                      ;; 20:7DDA $F0 $D9
    ld   b, a                                     ;; 20:7DDC $47
    ld   a, c                                     ;; 20:7DDD $79
    and  $03                                      ;; 20:7DDE $E6 $03
    or   b                                        ;; 20:7DE0 $B0
    ld   [hl+], a                                 ;; 20:7DE1 $22
    dec  d                                        ;; 20:7DE2 $15
    jr   nz, jr_020_7D97                          ;; 20:7DE3 $20 $B2

    ret                                           ;; 20:7DE5 $C9

; Copy tiles for the Credits "Thanks for playing" message to tiles memory
LoadThanksForPlayingTiles::
    ld   c, HIGH(vTiles0 + $1000 - $8000) ; dest  ;; 20:7DE6 $0E $10
    ld   b, HIGH(ThanksForPlayingTiles) ; src     ;; 20:7DE8 $06 $68
    ld   a, BANK(ThanksForPlayingTiles) ; src bank  ;; 20:7DEA $3E $38
    ld   h, BANK(@) ; return bank                 ;; 20:7DEC $26 $20
    call CopyDataToVRAM                           ;; 20:7DEE $CD $13 $0A

    ld   c, HIGH(vTiles0 + $1100 - $8000) ; dest  ;; 20:7DF1 $0E $11
    ld   b, HIGH(ThanksForPlayingTiles + $100) ; src ;; 20:7DF3 $06 $69
    ld   a, BANK(ThanksForPlayingTiles) ; src bank ;; 20:7DF5 $3E $38
    ld   h, BANK(@) ; return bank                 ;; 20:7DF7 $26 $20
    call CopyDataToVRAM                           ;; 20:7DF9 $CD $13 $0A

IF !__PATCH_1__
    ld   c, HIGH(vTiles0 + $1200 - $8000) ; dest  ;; 20:7DFC $0E $12
    ld   b, HIGH(ThanksForPlayingTiles + $200) ; src ;; 20:7DFE $06 $6A
    ld   a, BANK(ThanksForPlayingTiles) ; src bank ;; 20:7E00 $3E $38
    ld   h, BANK(@) ; return bank                 ;; 20:7E02 $26 $20
    call CopyDataToVRAM                           ;; 20:7E04 $CD $13 $0A
ENDC

    ret                                           ;; 20:7E07 $C9

IF __PATCH_1__
func_020_7E0E:
    ld a, $06                                     ;; 20:7E0E $3E $06
    ldh [hMultiPurposeD], a                       ;; 20:7E10 $E0 $E4
    ld a, $0c                                     ;; 20:7E12 $3E $0C
    ldh [hMultiPurposeE], a                       ;; 20:7E14 $E0 $E5
    ld a, $18                                     ;; 20:7E16 $3E $18
    ldh [hMultiPurposeF], a                       ;; 20:7E18 $E0 $E6
    ld hl, wBGPal1                                ;; 20:7E1A $21 $10 $DC
    ld a, $40                                     ;; 20:7E1D $3E $40
    ldh [hMultiPurpose3], a                       ;; 20:7E1F $E0 $DA
    call Call_020_7e25                            ;; 20:7E21 $CD $25 $7E
    ret                                           ;; 20:7E24 $C9

Call_020_7e25:
Jump_020_7e25:
    push hl                                       ;; 20:7E25 $E5
    ld a, $02                                     ;; 20:7E26 $3E $02
    ldh [rSVBK], a                                ;; 20:7E28 $E0 $70
    ld a, [hl+]                                   ;; 20:7E2A $2A
    ld e, a                                       ;; 20:7E2B $5F
    ld a, [hl]                                    ;; 20:7E2C $7E
    ld d, a                                       ;; 20:7E2D $57
    dec hl                                        ;; 20:7E2E $2B
    xor a                                         ;; 20:7E2F $AF
    ldh [rSVBK], a                                ;; 20:7E30 $E0 $70
    ldh a, [hMultiPurposeD]                       ;; 20:7E32 $F0 $E4
    ld c, a                                       ;; 20:7E34 $4F
    ld a, e                                       ;; 20:7E35 $7B
    and $1f                                       ;; 20:7E36 $E6 $1F
    ld b, a                                       ;; 20:7E38 $47
    ld a, [hl]                                    ;; 20:7E39 $7E
    and $1f                                       ;; 20:7E3A $E6 $1F
    cp b                                          ;; 20:7E3C $B8
    jr c, .jr_7e47                                ;; 20:7E3D $38 $08

    jr z, .jr_7e47                                ;; 20:7E3F $28 $06

    sub c                                         ;; 20:7E41 $91
    jr c, .jr_7e47                                ;; 20:7E42 $38 $03

    cp b                                          ;; 20:7E44 $B8
    jr nc, jr_020_7e48                            ;; 20:7E45 $30 $01

.jr_7e47
    ld a, b                                       ;; 20:7E47 $78

jr_020_7e48:
    ldh [hMultiPurpose0], a                       ;; 20:7E48 $E0 $D7
    ld a, e                                       ;; 20:7E4A $7B
    and $e0                                       ;; 20:7E4B $E6 $E0
    swap a                                        ;; 20:7E4D $CB $37
    ld b, a                                       ;; 20:7E4F $47
    ld a, d                                       ;; 20:7E50 $7A
    and $03                                       ;; 20:7E51 $E6 $03
    swap a                                        ;; 20:7E53 $CB $37
    or b                                          ;; 20:7E55 $B0
    ld b, a                                       ;; 20:7E56 $47
    ld a, [hl+]                                   ;; 20:7E57 $2A
    and $e0                                       ;; 20:7E58 $E6 $E0
    swap a                                        ;; 20:7E5A $CB $37
    ld c, a                                       ;; 20:7E5C $4F
    ld a, [hl]                                    ;; 20:7E5D $7E
    and $03                                       ;; 20:7E5E $E6 $03
    swap a                                        ;; 20:7E60 $CB $37
    or c                                          ;; 20:7E62 $B1
    push af                                       ;; 20:7E63 $F5
    ldh a, [hMultiPurposeE]                       ;; 20:7E64 $F0 $E5
    ld c, a                                       ;; 20:7E66 $4F
    pop af                                        ;; 20:7E67 $F1
    cp b                                          ;; 20:7E68 $B8
    jr c, .jr_7e73                                ;; 20:7E69 $38 $08

    jr z, .jr_7e73                                ;; 20:7E6B $28 $06

    sub c                                         ;; 20:7E6D $91
    jr c, .jr_7e73                                ;; 20:7E6E $38 $03

    cp b                                          ;; 20:7E70 $B8
    jr nc, jr_020_7e74                            ;; 20:7E71 $30 $01

.jr_7e73
    ld a, b                                       ;; 20:7E73 $78

jr_020_7e74:
    ldh [hMultiPurpose1], a                       ;; 20:7E74 $E0 $D8
    ldh a, [hMultiPurposeF]                       ;; 20:7E76 $F0 $E6
    ld c, a                                       ;; 20:7E78 $4F
    ld a, d                                       ;; 20:7E79 $7A
    and $7c                                       ;; 20:7E7A $E6 $7C
    ld b, a                                       ;; 20:7E7C $47
    ld a, [hl]                                    ;; 20:7E7D $7E
    and $7c                                       ;; 20:7E7E $E6 $7C
    cp b                                          ;; 20:7E80 $B8
    jr c, .jr_7e8b                                ;; 20:7E81 $38 $08

    jr z, .jr_7e8b                                ;; 20:7E83 $28 $06

    sub c                                         ;; 20:7E85 $91
    jr c, .jr_7e8b                                ;; 20:7E86 $38 $03

    cp b                                          ;; 20:7E88 $B8
    jr nc, jr_020_7e8c                            ;; 20:7E89 $30 $01

.jr_7e8b
    ld a, b                                       ;; 20:7E8B $78

jr_020_7e8c:
    ldh [hMultiPurpose2], a                       ;; 20:7E8C $E0 $D9
    pop hl                                        ;; 20:7E8E $E1
    ldh a, [hMultiPurpose0]                       ;; 20:7E8F $F0 $D7
    ld b, a                                       ;; 20:7E91 $47
    ldh a, [hMultiPurpose1]                       ;; 20:7E92 $F0 $D8
    swap a                                        ;; 20:7E94 $CB $37
    ld c, a                                       ;; 20:7E96 $4F
    and $e0                                       ;; 20:7E97 $E6 $E0
    or b                                          ;; 20:7E99 $B0
    ld [hl+], a                                   ;; 20:7E9A $22
    ldh a, [hMultiPurpose2]                       ;; 20:7E9B $F0 $D9
    ld b, a                                       ;; 20:7E9D $47
    ld a, c                                       ;; 20:7E9E $79
    and $03                                       ;; 20:7E9F $E6 $03
    or b                                          ;; 20:7EA1 $B0
    ld [hl+], a                                   ;; 20:7EA2 $22
    ldh a, [hMultiPurpose3]                       ;; 20:7EA3 $F0 $DA
    dec a                                         ;; 20:7EA5 $3D
    ldh [hMultiPurpose3], a                       ;; 20:7EA6 $E0 $DA
    and a                                         ;; 20:7EA8 $A7
    jp nz, Jump_020_7e25                          ;; 20:7EA9 $C2 $25 $7E

    xor a                                         ;; 20:7EAC $AF
    ld [wPaletteUnknownE], a                      ;; 20:7EAD $EA $D5 $DD
    ret                                           ;; 20:7EB0 $C9

func_020_7EB1::
    ld a, $06                                     ;; 20:7EB1 $3E $06
    ldh [hMultiPurposeD], a                       ;; 20:7EB3 $E0 $E4
    ld a, $0c                                     ;; 20:7EB5 $3E $0C
    ldh [hMultiPurposeE], a                       ;; 20:7EB7 $E0 $E5
    ld a, $18                                     ;; 20:7EB9 $3E $18
    ldh [hMultiPurposeF], a                       ;; 20:7EBB $E0 $E6
    ld hl, wBGPal1                                ;; 20:7EBD $21 $10 $DC
    ld d, $40                                     ;; 20:7EC0 $16 $40
    ldh [hMultiPurpose3], a                       ;; 20:7EC2 $E0 $DA
    call Call_020_7ec8                            ;; 20:7EC4 $CD $C8 $7E
    ret                                           ;; 20:7EC7 $C9


Call_020_7ec8:
jr_020_7ec8:
    push hl                                       ;; 20:7EC8 $E5
    ldh a, [hMultiPurposeD]                       ;; 20:7EC9 $F0 $E4
    ld c, a                                       ;; 20:7ECB $4F
    ld a, [hl]                                    ;; 20:7ECC $7E
    and $1f                                       ;; 20:7ECD $E6 $1F
    add c                                         ;; 20:7ECF $81
    cp $20                                        ;; 20:7ED0 $FE $20
    jr c, .jr_7ed6                                ;; 20:7ED2 $38 $02

    ld a, $1f                                     ;; 20:7ED4 $3E $1F

.jr_7ed6
    ldh [hMultiPurpose0], a                       ;; 20:7ED6 $E0 $D7
    ldh a, [hMultiPurposeE]                       ;; 20:7ED8 $F0 $E5
    ld c, a                                       ;; 20:7EDA $4F
    ld a, [hl+]                                   ;; 20:7EDB $2A
    and $e0                                       ;; 20:7EDC $E6 $E0
    swap a                                        ;; 20:7EDE $CB $37
    ld b, a                                       ;; 20:7EE0 $47
    ld a, [hl]                                    ;; 20:7EE1 $7E
    and $03                                       ;; 20:7EE2 $E6 $03
    swap a                                        ;; 20:7EE4 $CB $37
    or b                                          ;; 20:7EE6 $B0
    and $3e                                       ;; 20:7EE7 $E6 $3E
    add c                                         ;; 20:7EE9 $81
    cp $40                                        ;; 20:7EEA $FE $40
    jr c, .jr_7ef0                                ;; 20:7EEC $38 $02

    ld a, $3e                                     ;; 20:7EEE $3E $3E

.jr_7ef0
    ldh [hMultiPurpose1], a                       ;; 20:7EF0 $E0 $D8
    ldh a, [hMultiPurposeF]                       ;; 20:7EF2 $F0 $E6
    ld c, a                                       ;; 20:7EF4 $4F
    ld a, [hl]                                    ;; 20:7EF5 $7E
    and $7c                                       ;; 20:7EF6 $E6 $7C
    add c                                         ;; 20:7EF8 $81
    cp $80                                        ;; 20:7EF9 $FE $80
    jr c, .jr_7eff                                ;; 20:7EFB $38 $02

    ld a, $7c                                     ;; 20:7EFD $3E $7C

.jr_7eff
    ldh [hMultiPurpose2], a                       ;; 20:7EFF $E0 $D9
    pop hl                                        ;; 20:7F01 $E1
    ldh a, [hMultiPurpose0]                       ;; 20:7F02 $F0 $D7
    ld b, a                                       ;; 20:7F04 $47
    ldh a, [hMultiPurpose1]                       ;; 20:7F05 $F0 $D8
    swap a                                        ;; 20:7F07 $CB $37
    ld c, a                                       ;; 20:7F09 $4F
    and $e0                                       ;; 20:7F0A $E6 $E0
    or b                                          ;; 20:7F0C $B0
    ld [hl+], a                                   ;; 20:7F0D $22
    ldh a, [hMultiPurpose2]                       ;; 20:7F0E $F0 $D9
    ld b, a                                       ;; 20:7F10 $47
    ld a, c                                       ;; 20:7F11 $79
    and $03                                       ;; 20:7F12 $E6 $03
    or b                                          ;; 20:7F14 $B0
    ld [hl+], a                                   ;; 20:7F15 $22
    dec d                                         ;; 20:7F16 $15
    jr nz, jr_020_7ec8                            ;; 20:7F17 $20 $AF

    ret                                           ;; 20:7F19 $C9
ENDC
