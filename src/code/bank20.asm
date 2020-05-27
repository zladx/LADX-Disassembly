; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Contains pointers to wRequests data.
; (The requests themselves load data in bank 8.)
include "data/backgrounds/background_tile_commands_pointers.asm"

; Retrieve the address of a wRequest for loading a given background.
; Input:
;   wBGMapToLoad
; Returns:
;   de   an address to a wRequest for loading BG data
GetBGCopyRequest::
    ld   hl, BackgroundTileCommandsPointersTable  ; $4577: $21 $2B $45
    ld   b, $00                                   ; $457A: $06 $00
    ld   a, [wBGMapToLoad]                        ; $457C: $FA $FF $D6
    sla  a                                        ; $457F: $CB $27
    ld   c, a                                     ; $4581: $4F
    add  hl, bc                                   ; $4582: $09
    ld   a, [hl]                                  ; $4583: $7E
    ld   e, a                                     ; $4584: $5F
    inc  hl                                       ; $4585: $23
    ld   a, [hl]                                  ; $4586: $7E
    ld   d, a                                     ; $4587: $57
    ret                                           ; $4588: $C9

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
    push de                                       ; $4616: $D5
    ldh  a, [hMapRoom]                            ; $4617: $F0 $F6
    and  a                                        ; $4619: $A7
    jr   z, jr_020_4620                           ; $461A: $28 $04

    cp   $05                                      ; $461C: $FE $05
    jr   nz, jr_020_4640                          ; $461E: $20 $20

jr_020_4620:
    ld   a, [$D6FB]                               ; $4620: $FA $FB $D6
    and  a                                        ; $4623: $A7
    jr   z, jr_020_4640                           ; $4624: $28 $1A

    ld   a, c                                     ; $4626: $79
    cp   $40                                      ; $4627: $FE $40
    jr   z, jr_020_462F                           ; $4629: $28 $04

    cp   $80                                      ; $462B: $FE $80
    jr   nz, jr_020_4640                          ; $462D: $20 $11

jr_020_462F:
    xor  $C0                                      ; $462F: $EE $C0
    ld   l, a                                     ; $4631: $6F
    ld   h, $5E                                   ; $4632: $26 $5E
    ld   a, [$D6FB]                               ; $4634: $FA $FB $D6
    ldh  [$FFBB], a                               ; $4637: $E0 $BB
    ld   [wRoomSwitchableObject], a               ; $4639: $EA $FA $D6
    pop  de                                       ; $463C: $D1
    ld   a, $2D                                   ; $463D: $3E $2D
    ret                                           ; $463F: $C9

jr_020_4640:
    ld   hl, data_020_45EA                        ; $4640: $21 $EA $45
    ; de = ([hMapRoom] * 2) % $FF
    ldh  a, [hMapRoom]                            ; $4643: $F0 $F6
    sla  a                                        ; $4645: $CB $27
    ld   e, a                                     ; $4647: $5F
    ld   d, $00                                   ; $4648: $16 $00

    ; e = data_020_45EA[de + 1]
    add  hl, de                                   ; $464A: $19
    inc  hl                                       ; $464B: $23
    ld   a, [hl]                                  ; $464C: $7E
    ld   e, a                                     ; $464D: $5F
    ; hl = data_020_45EA[de] * $100
    ; (i.e. higher byte is read from the tabel, lower byte is 0)
    dec  hl                                       ; $464E: $2B
    ld   a, [hl]                                  ; $464F: $7E
    ld   h, a                                     ; $4650: $67
    ld   l, $00                                   ; $4651: $2E $00

    add  hl, bc                                   ; $4653: $09
    ld   a, e                                     ; $4654: $7B

    ; cleanup and return
    pop  de                                       ; $4655: $D1
    ret                                           ; $4656: $C9

; Retrieve the address of a tilemap loading handler
;   input:  wTileMapToLoad in e
;   output: address to jump to in hl
GetTilemapHandlerAddress::
    ; de = (e - 1) * 2
    dec  e                                        ; $4657: $1D
    sla  e                                        ; $4658: $CB $23
    ld   d, $00                                   ; $465A: $16 $00
    ld   hl, TilemapLoadingHandlersTable          ; $465C: $21 $64 $46
    add  hl, de                                   ; $465F: $19
    ld   a, [hl+]                                 ; $4660: $2A
    ld   h, [hl]                                  ; $4661: $66
    ld   l, a                                     ; $4662: $6F
    ret                                           ; $4663: $C9

; Pointers to addresses to execute for loading a specific tilemap
TilemapLoadingHandlersTable::
._01 dw LoadTileset1
._02 dw ClearBGMap
._03 dw LoadBaseTiles
._04 dw LoadInventoryTiles
._05 dw LoadTileset5
._06 dw LoadDungeonTiles
._07 dw LoadTileset5
._08 dw LoadTileset8
._09 dw LoadTileset9
._0A dw LoadMapData.return
._0B dw LoadTileset0B
._0C dw LoadMapData.return
._0D dw LoadSaveMenuTiles
._0E dw LoadTileset0E_trampoline
._0F dw LoadTileset0F_trampoline
._10 dw LoadIntroSequenceTiles
._11 dw LoadTitleScreenTiles
._12 dw LoadChristinePortraitTiles
._13 dw LoadTileset13
._14 dw LoadFaceShrineReliefTiles
._15 dw LoadTileset15
._16 dw LoadTileset16
._17 dw LoadTileset17
._18 dw LoadTileset18
._19 dw LoadTileset19
._1A dw LoadTileset1A
._1B dw LoadTileset1B
._1C dw LoadTileset1A
._1D dw LoadTileset1D
._1E dw LoadTileset1E
._1F dw LoadTileset1F
._20 dw LoadSchulePaintingTiles
._21 dw LoadEaglesTowerTopTiles
._22 dw LoadTileset22_trampoline
._23 dw LoadTileset23_trampoline

data_020_46AA::
    db   $51, $35, $4F, $35, $00, $00, $4B, $35, $00, $00, $00, $00, $00, $00, $44, $35
    db   $00, $00, $00, $00, $00, $00, $00, $00, $48, $35, $00, $00, $00, $00, $00, $00
    db   $00, $00, $44, $35, $4E, $35, $00, $00, $00, $00, $00, $00

Data_020_46D6::
    db   $00, $00, $4D, $31, $00, $00, $4C, $35, $51, $2E, $45, $35, $45, $35, $00, $00
    db   $45, $35, $00, $00, $45, $35, $00, $00, $49, $35, $00, $00, $00, $00, $45, $35
    db   $00, $00, $45, $35, $00, $00, $00, $00, $00, $00, $00, $00

Data_020_4702::
    db   $50, $35, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $46, $35, $00, $00, $00, $00, $4A, $35, $00, $00, $46, $35, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $46, $35

Data_020_472E::
    db   $00, $00, $00, $00, $00, $00, $4D, $35, $00, $00, $00, $00, $00, $00, $00, $00
    db   $47, $35, $00, $00, $47, $35, $47, $35, $00, $00, $47, $35, $00, $00, $47, $35
    db   $47, $35, $00, $00, $00, $00, $00, $00, $47, $35, $00, $00

; Color-dungeon related function
func_020_475A::
    ld   hl, data_020_46AA                        ; $475A: $21 $AA $46
    ldh  a, [hMapRoom]                            ; $475D: $F0 $F6
    rla                                           ; $475F: $17
    ld   e, a                                     ; $4760: $5F
    ld   d, $00                                   ; $4761: $16 $00
    inc  e                                        ; $4763: $1C
    push de                                       ; $4764: $D5
    add  hl, de                                   ; $4765: $19
    ld   a, [hl]                                  ; $4766: $7E
    and  a                                        ; $4767: $A7
    jr   z, jr_020_4776                           ; $4768: $28 $0C

    ld   d, a                                     ; $476A: $57
    dec  hl                                       ; $476B: $2B
    ld   a, [hl]                                  ; $476C: $7E
    ld   b, a                                     ; $476D: $47
    ld   c, $04                                   ; $476E: $0E $04
    ld   a, d                                     ; $4770: $7A
    ld   h, $20                                   ; $4771: $26 $20
    call Copy100BytesFromBankAtA                  ; $4773: $CD $13 $0A

jr_020_4776:
    pop  de                                       ; $4776: $D1
    push de                                       ; $4777: $D5
    ld   hl, Data_020_46D6                        ; $4778: $21 $D6 $46
    add  hl, de                                   ; $477B: $19
    ld   a, [hl]                                  ; $477C: $7E
    and  a                                        ; $477D: $A7
    jr   z, jr_020_478C                           ; $477E: $28 $0C

    ld   d, a                                     ; $4780: $57
    dec  hl                                       ; $4781: $2B
    ld   a, [hl]                                  ; $4782: $7E
    ld   b, a                                     ; $4783: $47
    ld   c, $05                                   ; $4784: $0E $05
    ld   a, d                                     ; $4786: $7A
    ld   h, $20                                   ; $4787: $26 $20
    call Copy100BytesFromBankAtA                  ; $4789: $CD $13 $0A

jr_020_478C:
    pop  de                                       ; $478C: $D1
    push de                                       ; $478D: $D5
    ld   hl, Data_020_4702                        ; $478E: $21 $02 $47
    add  hl, de                                   ; $4791: $19
    ld   a, [hl]                                  ; $4792: $7E
    and  a                                        ; $4793: $A7
    jr   z, jr_020_47A2                           ; $4794: $28 $0C

    ld   d, a                                     ; $4796: $57
    dec  hl                                       ; $4797: $2B
    ld   a, [hl]                                  ; $4798: $7E
    ld   b, a                                     ; $4799: $47
    ld   c, $06                                   ; $479A: $0E $06
    ld   a, d                                     ; $479C: $7A
    ld   h, $20                                   ; $479D: $26 $20
    call Copy100BytesFromBankAtA                  ; $479F: $CD $13 $0A

jr_020_47A2:
    pop  de                                       ; $47A2: $D1
    ld   hl, Data_020_472E                        ; $47A3: $21 $2E $47
    add  hl, de                                   ; $47A6: $19
    ld   a, [hl]                                  ; $47A7: $7E
    and  a                                        ; $47A8: $A7
    jr   z, jr_020_47B7                           ; $47A9: $28 $0C

    ld   d, a                                     ; $47AB: $57
    dec  hl                                       ; $47AC: $2B
    ld   a, [hl]                                  ; $47AD: $7E
    ld   b, a                                     ; $47AE: $47
    ld   c, $07                                   ; $47AF: $0E $07
    ld   a, d                                     ; $47B1: $7A
    ld   h, $20                                   ; $47B2: $26 $20
    call Copy100BytesFromBankAtA                  ; $47B4: $CD $13 $0A

jr_020_47B7:
    ldh  a, [hMapRoom]                            ; $47B7: $F0 $F6
    cp   $01                                      ; $47B9: $FE $01
    jr   nz, jr_020_47C2                          ; $47BB: $20 $05

    ld   a, $20                                   ; $47BD: $3E $20
    call CopyColorDungeonSymbols                  ; $47BF: $CD $32 $0A

jr_020_47C2:
    ret                                           ; $47C2: $C9

data_020_47C3::
    db   $00, $40, $80, $C0, $00, $40, $80, $C0

MapRoomTable_b0::
    nop                                           ; $47CB: $00
    nop                                           ; $47CC: $00
    nop                                           ; $47CD: $00
    nop                                           ; $47CE: $00
    nop                                           ; $47CF: $00
    nop                                           ; $47D0: $00
    nop                                           ; $47D1: $00
    nop                                           ; $47D2: $00
    nop                                           ; $47D3: $00
    nop                                           ; $47D4: $00
    nop                                           ; $47D5: $00
    nop                                           ; $47D6: $00
    nop                                           ; $47D7: $00
    nop                                           ; $47D8: $00
    nop                                           ; $47D9: $00
    inc  b                                        ; $47DA: $04
    nop                                           ; $47DB: $00
    nop                                           ; $47DC: $00
    nop                                           ; $47DD: $00
    inc  b                                        ; $47DE: $04
    nop                                           ; $47DF: $00
    nop                                           ; $47E0: $00

MapRoomTable_b1::
    nop                                           ; $47E1: $00
    nop                                           ; $47E2: $00
    nop                                           ; $47E3: $00
    nop                                           ; $47E4: $00
    nop                                           ; $47E5: $00
    nop                                           ; $47E6: $00
    nop                                           ; $47E7: $00
    nop                                           ; $47E8: $00
    nop                                           ; $47E9: $00
    dec  b                                        ; $47EA: $05
    nop                                           ; $47EB: $00
    nop                                           ; $47EC: $00
    nop                                           ; $47ED: $00
    nop                                           ; $47EE: $00
    dec  b                                        ; $47EF: $05
    nop                                           ; $47F0: $00
    nop                                           ; $47F1: $00
    nop                                           ; $47F2: $00
    nop                                           ; $47F3: $00
    nop                                           ; $47F4: $00
    nop                                           ; $47F5: $00
    dec  b                                        ; $47F6: $05

; Configure the parameters for copying the animated tiles.
; First called with b=1, then with b=0
; Inputs:
;   b:  ??? (0 or 1)
ConfigureAnimatedTilesCopy::
    ldh  a, [hMapRoom]                            ; $47F7: $F0 $F6
    ld   c, a                                     ; $47F9: $4F

    ; hl = (b == 0 ? MapRoomTable_b0 : MapRoomTable_b1)
    ld   hl, MapRoomTable_b0                      ; $47FA: $21 $CB $47
    ld   a, b                                     ; $47FD: $78
    and  a                                        ; $47FE: $A7
    jr   z, .b1End                                ; $47FF: $28 $03
    ld   hl, MapRoomTable_b1                      ; $4801: $21 $E1 $47
.b1End

    ld   b, $00                                   ; $4804:  $06 $00
    add  hl, bc                                   ; $4806: $09
    ld   a, [hl]                                  ; $4807: $7E
    and  a                                        ; $4808: $A7
    ret  z                                        ; $4809: $C8

    ld   b, a                                     ; $480A: $47
    ld   c, $00                                   ; $480B: $0E $00
    ldh  a, [hAnimatedTilesFrameCount]            ; $480D: $F0 $A6
    rra                                           ; $480F: $1F
    rra                                           ; $4810: $1F
    rra                                           ; $4811: $1F
    and  $07                                      ; $4812: $E6 $07
    ld   e, a                                     ; $4814: $5F
    ld   d, $00                                   ; $4815: $16 $00
    ld   hl, data_020_47C3                        ; $4817: $21 $C3 $47
    add  hl, de                                   ; $481A: $19
    ld   l, [hl]                                  ; $481B: $6E
    ld   h, $00                                   ; $481C: $26 $00
    ld   de, $6000                                ; $481E: $11 $00 $60
    add  hl, bc                                   ; $4821: $09
    add  hl, de                                   ; $4822: $19
    ld   de, $8FC0                                ; $4823: $11 $C0 $8F
    ld   bc, $40                                  ; $4826: $01 $40 $00
    ld   a, $35                                   ; $4829: $3E $35
    and  a                                        ; $482B: $A7
    ret                                           ; $482C: $C9

; Replace objects $56 and $57 by object $0D.
; Used in the color dungeon.
ReplaceObjects56and57::
    di                                            ; $482D: $F3
    ld   bc, wRoomObjectsArea                     ; $482E: $01 $00 $D7
    ld   de, wIsFileSelectionArrowShifted         ; $4831: $11 $00 $D0
    ld   hl, rSVBK                                ; $4834: $21 $70 $FF

    ; For each object in the room…
.loop
    ; If the object type is $56 or $57…
    ld   a, [bc]                                  ; $4837: $0A
    cp   $56                                      ; $4838: $FE $56
    jr   z, .handleSpecialObject                  ; $483A: $28 $04

    cp   $57                                      ; $483C: $FE $57
    jr   nz, .continue                            ; $483E: $20 $0B

.handleSpecialObject
    ld   [hl], $05                                ; $4840: $36 $05
    ld   a, [de]                                  ; $4842: $1A
    ld   [hl], $00                                ; $4843: $36 $00
    and  a                                        ; $4845: $A7
    jr   z, .continue                             ; $4846: $28 $03

    ld   a, $0D                                   ; $4848: $3E $0D
    ld   [bc], a                                  ; $484A: $02

.continue
    inc  bc                                       ; $484B: $03
    inc  de                                       ; $484C: $13
    ld   a, e                                     ; $484D: $7B
    cp   $C0                                      ; $484E: $FE $C0
    jr   nz, .loop                                ; $4850: $20 $E5

    ei                                            ; $4852: $FB
    ret                                           ; $4853: $C9

; On GBC, clear the $0C first bytes of WRAM bank 5
ClearWRAMBank5::
    ; If not on GBC, return
    ldh  a, [hIsGBC]                              ; $4854: $F0 $FE

func_020_4856::
    and  a                                        ; $4856: $A7
    ret  z                                        ; $4857: $C8

    di                                            ; $4858: $F3
    ld   a, $05                                   ; $4859: $3E $05
    ld   [rSVBK], a                               ; $485B: $E0 $70
    ld   hl, $D000                                ; $485D: $21 $00 $D0

.loop
    xor  a                                        ; $4860: $AF
    ld   [hl+], a                                 ; $4861: $22
    ld   a, l                                     ; $4862: $7D
    cp   $C0                                      ; $4863: $FE $C0
    jr   nz, .loop                                ; $4865: $20 $F9

    xor  a                                        ; $4867: $AF
    ldh  [rSVBK], a                               ; $4868: $E0 $70
    ei                                            ; $486A: $FB
    ret                                           ; $486B: $C9

Data_020_486C::
    db   $09, $05, $08, $08

Data_020_4870::
    db   $0A, $0A, $07, $0C

func_020_4874::
    ld   hl, Data_020_486C                        ; $4874: $21 $6C $48
    add  hl, de                                   ; $4877: $19
    ldh  a, [hScratch0]                           ; $4878: $F0 $D7
    add  [hl]                                     ; $487A: $86
    sub  $08                                      ; $487B: $D6 $08
    and  $F0                                      ; $487D: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $487F: $E0 $CE
    swap a                                        ; $4881: $CB $37
    ldh  [hScratch0], a                           ; $4883: $E0 $D7
    ld   hl, Data_020_4870                        ; $4885: $21 $70 $48
    add  hl, de                                   ; $4888: $19
    ldh  a, [hScratch1]                           ; $4889: $F0 $D8
    add  [hl]                                     ; $488B: $86
    sub  $10                                      ; $488C: $D6 $10
    and  $F0                                      ; $488E: $E6 $F0
    ld   e, a                                     ; $4890: $5F
    ldh  [hSwordIntersectedAreaY], a              ; $4891: $E0 $CD
    ldh  a, [hScratch0]                           ; $4893: $F0 $D7
    or   e                                        ; $4895: $B3
    ld   e, a                                     ; $4896: $5F
    ret                                           ; $4897: $C9

func_020_4898::
    push de                                       ; $4898: $D5
    ld   hl, wRequestDestinationHigh              ; $4899: $21 $01 $D6
    ld   a, [wRequests]                           ; $489C: $FA $00 $D6
    ld   e, a                                     ; $489F: $5F
    add  $0A                                      ; $48A0: $C6 $0A
    ld   [wRequests], a                           ; $48A2: $EA $00 $D6
    ld   d, $00                                   ; $48A5: $16 $00
    add  hl, de                                   ; $48A7: $19
    pop  de                                       ; $48A8: $D1
    ldh  a, [$FFCF]                               ; $48A9: $F0 $CF
    ld   [hl+], a                                 ; $48AB: $22
    ldh  a, [$FFD0]                               ; $48AC: $F0 $D0
    ld   [hl+], a                                 ; $48AE: $22
    ld   a, $81                                   ; $48AF: $3E $81
    ld   [hl+], a                                 ; $48B1: $22
    ld   a, [de]                                  ; $48B2: $1A
    inc  de                                       ; $48B3: $13
    ld   [hl+], a                                 ; $48B4: $22
    ld   a, [de]                                  ; $48B5: $1A
    inc  de                                       ; $48B6: $13
    ld   [hl+], a                                 ; $48B7: $22
    ldh  a, [$FFCF]                               ; $48B8: $F0 $CF
    ld   [hl+], a                                 ; $48BA: $22
    ldh  a, [$FFD0]                               ; $48BB: $F0 $D0
    inc  a                                        ; $48BD: $3C
    ld   [hl+], a                                 ; $48BE: $22
    ld   a, $81                                   ; $48BF: $3E $81
    ld   [hl+], a                                 ; $48C1: $22
    ld   a, [de]                                  ; $48C2: $1A
    inc  de                                       ; $48C3: $13
    ld   [hl+], a                                 ; $48C4: $22
    ld   a, [de]                                  ; $48C5: $1A
    ld   [hl+], a                                 ; $48C6: $22
    ld   [hl], $00                                ; $48C7: $36 $00
    ret                                           ; $48C9: $C9

; Special code for the Color Dungeon
func_020_48CA::
    ; If Free-movement mode is enabled, return
    ld   a, [wFreeMovementMode]                   ; $48CA: $FA $7B $C1
    and  a                                        ; $48CD: $A7
    ret  nz                                       ; $48CE: $C0

    ; If not on color dungeon, return
    ldh  a, [hMapId]                              ; $48CF: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $48D1: $FE $FF
    ret  nz                                       ; $48D3: $C0

    ldh  a, [hSwordIntersectedAreaY]              ; $48D4: $F0 $CD
    ld   d, a                                     ; $48D6: $57
    ldh  a, [hSwordIntersectedAreaX]              ; $48D7: $F0 $CE
    ld   e, a                                     ; $48D9: $5F
    push de                                       ; $48DA: $D5
    ld   d, $00                                   ; $48DB: $16 $00
    ldh  a, [hLinkDirection]                      ; $48DD: $F0 $9E
    ld   e, a                                     ; $48DF: $5F
    ldh  a, [hLinkPositionX]                      ; $48E0: $F0 $98
    ldh  [hScratch0], a                           ; $48E2: $E0 $D7
    ldh  a, [hLinkPositionY]                      ; $48E4: $F0 $99
    ldh  [hScratch1], a                           ; $48E6: $E0 $D8
    call func_020_4874                            ; $48E8: $CD $74 $48
    ld   hl, wRoomObjects                         ; $48EB: $21 $11 $D7
    add  hl, de                                   ; $48EE: $19
    ld   a, [hl]                                  ; $48EF: $7E
    cp   $53                                      ; $48F0: $FE $53
    jr   z, jr_020_48FC                           ; $48F2: $28 $08

    cp   $55                                      ; $48F4: $FE $55
    jr   z, jr_020_48FC                           ; $48F6: $28 $04

    cp   $54                                      ; $48F8: $FE $54
    jr   nz, jr_020_490A                          ; $48FA: $20 $0E

jr_020_48FC:
    ld   a, [$C146]                               ; $48FC: $FA $46 $C1
    and  a                                        ; $48FF: $A7
    jr   nz, jr_020_4917                          ; $4900: $20 $15

    call func_020_4954                            ; $4902: $CD $54 $49
    call UseRocsFeather                          ; $4905: $CD $CB $14
    jr   jr_020_4917                              ; $4908: $18 $0D

jr_020_490A:
    cp   $56                                      ; $490A: $FE $56
    jr   z, jr_020_4912                           ; $490C: $28 $04

    cp   $57                                      ; $490E: $FE $57
    jr   nz, jr_020_4917                          ; $4910: $20 $05

jr_020_4912:
    call func_020_4923                            ; $4912: $CD $23 $49
    jr   jr_020_4917                              ; $4915: $18 $00

jr_020_4917:
    pop  de                                       ; $4917: $D1
    ld   a, d                                     ; $4918: $7A
    ldh  [hSwordIntersectedAreaY], a              ; $4919: $E0 $CD
    ld   a, e                                     ; $491B: $7B
    ldh  [hSwordIntersectedAreaX], a              ; $491C: $E0 $CE
    ret                                           ; $491E: $C9

Data_020_491F::
    db   $10, $12, $11, $13

func_020_4923::
    ld   a, $0D                                   ; $4923: $3E $0D
    ld   [$DDD8], a                               ; $4925: $EA $D8 $DD
    ld   [hl], a                                  ; $4928: $77
    ld   a, [wAddRupeeBufferLow]                  ; $4929: $FA $90 $DB
    add  $05                                      ; $492C: $C6 $05
    ld   [wAddRupeeBufferLow], a                  ; $492E: $EA $90 $DB
    di                                            ; $4931: $F3
    ld   a, $05                                   ; $4932: $3E $05
    ld   [rSVBK], a                               ; $4934: $E0 $70
    ld   hl, $D011                                ; $4936: $21 $11 $D0
    add  hl, de                                   ; $4939: $19
    ld   [hl], a                                  ; $493A: $77
    xor  a                                        ; $493B: $AF
    ld   [rSVBK], a                               ; $493C: $E0 $70
    ei                                            ; $493E: $FB
    call label_2887                               ; $493F: $CD $87 $28
    push bc                                       ; $4942: $C5
    ld   a, $20                                   ; $4943: $3E $20
    call func_91D                                 ; $4945: $CD $1D $09
    pop  bc                                       ; $4948: $C1
    ld   de, Data_020_491F                        ; $4949: $11 $1F $49
    call func_020_4898                            ; $494C: $CD $98 $48
    ret                                           ; $494F: $C9

Data_020_4950::
    db   $76, $77, $76, $77

func_020_4954::
    ld   a, [hl]                                  ; $4954: $7E
    inc  a                                        ; $4955: $3C
    ldh  [hScratch0], a                           ; $4956: $E0 $D7
    dec  a                                        ; $4958: $3D
    cp   $55                                      ; $4959: $FE $55
    jr   nz, jr_020_4961                          ; $495B: $20 $04

    ld   a, $AE                                   ; $495D: $3E $AE
    ldh  [hScratch0], a                           ; $495F: $E0 $D7

jr_020_4961:
    ldh  a, [hScratch0]                           ; $4961: $F0 $D7
    ld   [hl], a                                  ; $4963: $77
    call label_2887                               ; $4964: $CD $87 $28
    push bc                                       ; $4967: $C5
    ldh  a, [hScratch0]                           ; $4968: $F0 $D7
    ld   [$DDD8], a                               ; $496A: $EA $D8 $DD
    ld   a, $20                                   ; $496D: $3E $20
    call func_91D                                 ; $496F: $CD $1D $09
    pop  bc                                       ; $4972: $C1
    ldh  a, [hScratch0]                           ; $4973: $F0 $D7
    cp   $AE                                      ; $4975: $FE $AE
    jr   nz, jr_020_497F                          ; $4977: $20 $06

    ld   de, Data_020_4950                        ; $4979: $11 $50 $49
    call func_020_4898                            ; $497C: $CD $98 $48

jr_020_497F:
    ret                                           ; $497F: $C9

; Order in which the tomb stones should be pushed
TombStonesSequence::
    db   $35, $33, $13, $15, $17

; When pushing a tomb stone in the Color dungeon graveyard,
; check if the order matches the secret sequence.
CheckPushedTombStone::
    push bc                                       ; $4985: $C5
    push de                                       ; $4986: $D5
    ; a = TombStonesSequence[wColorDungonCorrectTombStones]
    ld   hl, TombStonesSequence                   ; $4987: $21 $80 $49
    ld   a, [wColorDungonCorrectTombStones]       ; $498A: $FA $D9 $DD
    ld   e, a                                     ; $498D: $5F
    ld   d, $00                                   ; $498E: $16 $00
    add  hl, de                                   ; $4990: $19
    ld   a, [hl]                                  ; $4991: $7E

    ; If [hFFE9] != 0, return.
    ld   hl, hFFE9                                ; $4992: $21 $E9 $FF
    cp   [hl]                                     ; $4995: $BE
    jr   nz, .return                              ; $4996: $20 $17

    ; Increment the correct number of tomb stones pushed
    ld   a, [wColorDungonCorrectTombStones]       ; $4998: $FA $D9 $DD
    inc  a                                        ; $499B: $3C
    ld   [wColorDungonCorrectTombStones], a       ; $499C: $EA $D9 $DD

    ; If all 5 tomb stones were correctly pushed…
    cp   $05                                      ; $499F: $FE $05
    jr   nz, .return                              ; $49A1: $20 $0C

    ; Mark the color dungon as opened
    ld   a, $80                                   ; $49A3: $3E $80
    ld   [wColorDungonCorrectTombStones], a       ; $49A5: $EA $D9 $DD

    ; Play the puzzle solved jingle
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $49A8: $3E $02
    ldh  [hJingle], a                             ; $49AA: $E0 $F2
    call ClearWRAMBank5                           ; $49AC: $CD $54 $48

.return
    pop  de                                       ; $49AF: $D1
    pop  bc                                       ; $49B0: $C1
    ret                                           ; $49B1: $C9

Data_020_49B2::
    db   $10, $F0, $08, $08

Data_020_49B6::
    db   $0C, $0C, $F0, $10

func_020_49BA::
    ldh  a, [hLinkDirection]                      ; $49BA: $F0 $9E
    ld   e, a                                     ; $49BC: $5F
    ld   d, $00                                   ; $49BD: $16 $00
    ld   hl, Data_020_49B2                        ; $49BF: $21 $B2 $49
    add  hl, de                                   ; $49C2: $19
    ldh  a, [hLinkPositionX]                      ; $49C3: $F0 $98
    add  [hl]                                     ; $49C5: $86
    ld   [wC179], a                               ; $49C6: $EA $79 $C1
    ld   hl, Data_020_49B6                        ; $49C9: $21 $B6 $49
    add  hl, de                                   ; $49CC: $19
    ldh  a, [hLinkPositionY]                      ; $49CD: $F0 $99
    add  [hl]                                     ; $49CF: $86
    ld   [wC17a], a                               ; $49D0: $EA $7A $C1
    ld   a, $02                                   ; $49D3: $3E $02
    ld   [wC178], a                               ; $49D5: $EA $78 $C1
    ret                                           ; $49D8: $C9

; Load BG palette data
func_020_49D9::
    ldh  a, [hBGMapOffsetHigh]                    ; $49D9: $F0 $E0
    ld   h, a                                     ; $49DB: $67
    ldh  a, [hBGMapOffsetLow]                     ; $49DC: $F0 $E1
    ld   l, a                                     ; $49DE: $6F
    ldh  a, [hScratchB]                           ; $49DF: $F0 $E2
    ld   b, a                                     ; $49E1: $47
    ldh  a, [hScratchC]                           ; $49E2: $F0 $E3
    ld   c, a                                     ; $49E4: $4F
    ldh  a, [hScratchD]                           ; $49E5: $F0 $E4
    ld   d, a                                     ; $49E7: $57
    ldh  a, [hScratchE]                           ; $49E8: $F0 $E5
    ld   e, a                                     ; $49EA: $5F
    ret                                           ; $49EB: $C9

Data_020_49EC::
    db   $01, $01, $20, $20

Data_020_49F0::
    db   $93, $93, $13, $13

func_020_49F4::
    ld   a, [wBGUpdateRegionOriginLow]            ; $49F4: $FA $27 $C1
    ld   [wRequestDestinationLow], a              ; $49F7: $EA $02 $D6
    ld   a, [wBGUpdateRegionOriginHigh]           ; $49FA: $FA $26 $C1
    or   $98                                      ; $49FD: $F6 $98
    ld   [wRequestDestinationHigh], a             ; $49FF: $EA $01 $D6
    ld   hl, Data_020_49F0                        ; $4A02: $21 $F0 $49
    add  hl, bc                                   ; $4A05: $09
    ld   a, [hl]                                  ; $4A06: $7E
    ld   [wRequestLength], a                      ; $4A07: $EA $03 $D6
    ld   a, $00                                   ; $4A0A: $3E $00
    ld   [$D618], a                               ; $4A0C: $EA $18 $D6
    ld   a, $EE                                   ; $4A0F: $3E $EE
    ld   [$D614], a                               ; $4A11: $EA $14 $D6
    ld   [$D615], a                               ; $4A14: $EA $15 $D6
    ld   [$D616], a                               ; $4A17: $EA $16 $D6
    ld   [$D617], a                               ; $4A1A: $EA $17 $D6
    ld   b, $D6                                   ; $4A1D: $06 $D6
    ld   c, $04                                   ; $4A1F: $0E $04
    ret                                           ; $4A21: $C9

func_020_4A22::
    ld   a, [wBGUpdateRegionOriginLow]            ; $4A22: $FA $27 $C1
    ld   [wRequestDestinationLow], a              ; $4A25: $EA $02 $D6
    ld   [$DC92], a                               ; $4A28: $EA $92 $DC
    ld   a, [wBGUpdateRegionOriginHigh]           ; $4A2B: $FA $26 $C1
    or   $98                                      ; $4A2E: $F6 $98
    ld   [wRequestDestinationHigh], a             ; $4A30: $EA $01 $D6
    ld   [$DC91], a                               ; $4A33: $EA $91 $DC
    ld   hl, Data_020_49F0                        ; $4A36: $21 $F0 $49
    add  hl, bc                                   ; $4A39: $09
    ld   a, [hl]                                  ; $4A3A: $7E
    ld   [wRequestLength], a                      ; $4A3B: $EA $03 $D6
    ld   [$DC93], a                               ; $4A3E: $EA $93 $DC
    ld   a, $00                                   ; $4A41: $3E $00
    ld   [$D618], a                               ; $4A43: $EA $18 $D6
    ld   [$DCA8], a                               ; $4A46: $EA $A8 $DC
    ld   a, $EE                                   ; $4A49: $3E $EE
    ld   [$D614], a                               ; $4A4B: $EA $14 $D6
    ld   [$D615], a                               ; $4A4E: $EA $15 $D6
    ld   [$D616], a                               ; $4A51: $EA $16 $D6
    ld   [$D617], a                               ; $4A54: $EA $17 $D6
    ld   b, $D6                                   ; $4A57: $06 $D6
    ld   c, $04                                   ; $4A59: $0E $04
    ld   [$DCA4], a                               ; $4A5B: $EA $A4 $DC
    ld   [$DCA5], a                               ; $4A5E: $EA $A5 $DC
    ld   [$DCA6], a                               ; $4A61: $EA $A6 $DC
    ld   [$DCA7], a                               ; $4A64: $EA $A7 $DC
    ld   a, $DC                                   ; $4A67: $3E $DC
    ldh  [hScratchB], a                           ; $4A69: $E0 $E2
    ldh  [hScratchD], a                           ; $4A6B: $E0 $E4
    ld   a, $94                                   ; $4A6D: $3E $94
    ldh  [hScratchC], a                           ; $4A6F: $E0 $E3
    ld   a, $AB                                   ; $4A71: $3E $AB
    ldh  [hScratchE], a                           ; $4A73: $E0 $E5
    ret                                           ; $4A75: $C9

; Configures an async data request to copy background tilemap
func_020_4A76::
    ld   a, [wRoomTransitionDirection]            ; $4A76: $FA $25 $C1
    ld   c, a                                     ; $4A79: $4F
    ld   b, $00                                   ; $4A7A: $06 $00
    ld   a, [$C12A]                               ; $4A7C: $FA $2A $C1
    ldh  [hScratch2], a                           ; $4A7F: $E0 $D9
    ld   hl, Data_020_49EC                        ; $4A81: $21 $EC $49
    add  hl, bc                                   ; $4A84: $09
    ldh  a, [hIsGBC]                              ; $4A85: $F0 $FE
    and  a                                        ; $4A87: $A7
    jr   nz, jr_020_4A8F                          ; $4A88: $20 $05

    call func_020_49F4                            ; $4A8A: $CD $F4 $49
    jr   jr_020_4A92                              ; $4A8D: $18 $03

jr_020_4A8F:
    call func_020_4A22                            ; $4A8F: $CD $22 $4A

jr_020_4A92:
    ret                                           ; $4A92: $C9

Data_020_4A93::
    db   $08

Data_020_4A94::
    db   $06, $0C, $0A, $FF, $04, $0A, $0C, $06, $08, $0A, $0C, $FF, $04, $0C, $0A

Data_020_4AA3::
    db   $23

Data_020_4AA4::
    db   $23, $63, $63, $03, $03, $43, $43, $03, $03, $03, $03, $43, $43, $23, $23

func_020_4AB3::
    push hl                                       ; $4AB3: $E5
    ldh  a, [hScratch0]                           ; $4AB4: $F0 $D7
    add  h                                        ; $4AB6: $84
    ld   [bc], a                                  ; $4AB7: $02
    inc  bc                                       ; $4AB8: $03
    ldh  a, [hScratch1]                           ; $4AB9: $F0 $D8
    add  l                                        ; $4ABB: $85
    ld   [bc], a                                  ; $4ABC: $02
    inc  bc                                       ; $4ABD: $03
    ld   hl, Data_020_4A93                        ; $4ABE: $21 $93 $4A
    ldh  a, [hScratch2]                           ; $4AC1: $F0 $D9
    sla  a                                        ; $4AC3: $CB $27
    ld   e, a                                     ; $4AC5: $5F
    ld   d, $00                                   ; $4AC6: $16 $00
    add  hl, de                                   ; $4AC8: $19
    ld   a, [hl]                                  ; $4AC9: $7E
    ld   [bc], a                                  ; $4ACA: $02
    cp   $FF                                      ; $4ACB: $FE $FF
    jr   nz, jr_020_4AD4                          ; $4ACD: $20 $05

    dec  bc                                       ; $4ACF: $0B
    ld   a, $F0                                   ; $4AD0: $3E $F0
    ld   [bc], a                                  ; $4AD2: $02
    inc  bc                                       ; $4AD3: $03

jr_020_4AD4:
    inc  bc                                       ; $4AD4: $03
    ld   hl, Data_020_4AA3                        ; $4AD5: $21 $A3 $4A
    add  hl, de                                   ; $4AD8: $19
    ld   a, [hl]                                  ; $4AD9: $7E
    ld   hl, hScratch3                            ; $4ADA: $21 $DA $FF
    or   [hl]                                     ; $4ADD: $B6
    ld   [bc], a                                  ; $4ADE: $02
    ldh  a, [hIsGBC]                              ; $4ADF: $F0 $FE
    and  a                                        ; $4AE1: $A7
    jr   z, jr_020_4AEF                           ; $4AE2: $28 $0B

    ldh  a, [hScratch3]                           ; $4AE4: $F0 $DA
    and  a                                        ; $4AE6: $A7
    jr   z, jr_020_4AEF                           ; $4AE7: $28 $06

    ld   a, [bc]                                  ; $4AE9: $0A
    and  $F8                                      ; $4AEA: $E6 $F8
    or   $04                                      ; $4AEC: $F6 $04
    ld   [bc], a                                  ; $4AEE: $02

jr_020_4AEF:
    inc  bc                                       ; $4AEF: $03
    pop  hl                                       ; $4AF0: $E1
    ldh  a, [hScratch0]                           ; $4AF1: $F0 $D7
    add  h                                        ; $4AF3: $84
    ld   [bc], a                                  ; $4AF4: $02
    inc  bc                                       ; $4AF5: $03
    ldh  a, [hScratch1]                           ; $4AF6: $F0 $D8
    add  l                                        ; $4AF8: $85
    add  $08                                      ; $4AF9: $C6 $08
    ld   [bc], a                                  ; $4AFB: $02
    inc  bc                                       ; $4AFC: $03
    ld   hl, Data_020_4A94                        ; $4AFD: $21 $94 $4A
    add  hl, de                                   ; $4B00: $19
    ld   a, [hl]                                  ; $4B01: $7E
    ld   [bc], a                                  ; $4B02: $02
    inc  bc                                       ; $4B03: $03
    ld   hl, Data_020_4AA4                        ; $4B04: $21 $A4 $4A
    add  hl, de                                   ; $4B07: $19
    ld   a, [hl]                                  ; $4B08: $7E
    ld   hl, hScratch3                            ; $4B09: $21 $DA $FF
    or   [hl]                                     ; $4B0C: $B6
    ld   [bc], a                                  ; $4B0D: $02
    ldh  a, [hIsGBC]                              ; $4B0E: $F0 $FE
    and  a                                        ; $4B10: $A7
    jr   z, jr_020_4B1E                           ; $4B11: $28 $0B

    ldh  a, [hScratch3]                           ; $4B13: $F0 $DA
    and  a                                        ; $4B15: $A7
    jr   z, jr_020_4B1E                           ; $4B16: $28 $06

    ld   a, [bc]                                  ; $4B18: $0A
    and  $F8                                      ; $4B19: $E6 $F8
    or   $04                                      ; $4B1B: $F6 $04
    ld   [bc], a                                  ; $4B1D: $02

jr_020_4B1E:
    ret                                           ; $4B1E: $C9

func_20_4B1F::
    xor  a                                        ; $4B1F: $AF
    ld   [wHasPlacedBomb], a                      ; $4B20: $EA $4E $C1
    ld   [wActiveProjectileCount], a              ; $4B23: $EA $4D $C1
    ld   [$C1A4], a                               ; $4B26: $EA $A4 $C1
    ld   [wIsCarryingLiftedObject], a             ; $4B29: $EA $5C $C1
    ld   [$C1AE], a                               ; $4B2C: $EA $AE $C1
    ld   a, [wIsLinkPushing]                      ; $4B2F: $FA $44 $C1
    and  a                                        ; $4B32: $A7
    jr   z, jr_020_4B39                           ; $4B33: $28 $04

    dec  a                                        ; $4B35: $3D
    ld   [wIsLinkPushing], a                      ; $4B36: $EA $44 $C1

jr_020_4B39:
    ret                                           ; $4B39: $C9

; Link's direction table
data_020_4B3A::
    db   $10, $00, $08, $08

data_020_4B3E::
    db   $03, $03, $08, $08

data_020_4B42::
    db   $08, $08, $00, $0D

data_020_4B46::
    db   $08, $08, $03, $04

; Shield-related function
func_020_4B4A::
    ldh  a, [hLinkDirection]                      ; $4B4A: $F0 $9E
    ld   e, a                                     ; $4B4C: $5F
    ld   d, $00                                   ; $4B4D: $16 $00
    ld   hl, data_020_4B3A                        ; $4B4F: $21 $3A $4B
    add  hl, de                                   ; $4B52: $19
    ldh  a, [hLinkPositionX]                      ; $4B53: $F0 $98
    add  [hl]                                     ; $4B55: $86
    ld   [$C140], a                               ; $4B56: $EA $40 $C1
    ld   hl, data_020_4B3E                        ; $4B59: $21 $3E $4B
    add  hl, de                                   ; $4B5C: $19
    ld   a, [hl]                                  ; $4B5D: $7E
    ld   [$C141], a                               ; $4B5E: $EA $41 $C1
    ld   hl, data_020_4B42                        ; $4B61: $21 $42 $4B
    add  hl, de                                   ; $4B64: $19
    ld   a, [$C145]                               ; $4B65: $FA $45 $C1
    add  [hl]                                     ; $4B68: $86
    ld   [$C142], a                               ; $4B69: $EA $42 $C1
    ld   hl, data_020_4B46                        ; $4B6C: $21 $46 $4B
    add  hl, de                                   ; $4B6F: $19
    ld   a, [hl]                                  ; $4B70: $7E
    ld   [wIsLinkInTheAir], a                     ; $4B71: $EA $43 $C1
    xor  a                                        ; $4B74: $AF
    ld   [$C5B0], a                               ; $4B75: $EA $B0 $C5
    ret                                           ; $4B78: $C9

Data_020_4B79::
    db   $08, $F8, $00, $00

Data_020_4B7D::
    db   $00, $00, $FD, $04

func_020_4B81::
    ld   hl, wEntitiesPrivateCountdown1Table      ; $4B81: $21 $F0 $C2
    add  hl, de                                   ; $4B84: $19
    ld   [hl], $10                                ; $4B85: $36 $10
    ld   a, [wBombArrowCooldown]                  ; $4B87: $FA $C0 $C1
    and  a                                        ; $4B8A: $A7
    jp   z, label_020_4B9E                        ; $4B8B: $CA $9E $4B

    xor  a                                        ; $4B8E: $AF
    ld   [wBombArrowCooldown], a                  ; $4B8F: $EA $C0 $C1
    ld   a, [$C1C2]                               ; $4B92: $FA $C2 $C1
    ld   c, a                                     ; $4B95: $4F
    ld   b, d                                     ; $4B96: $42
    ld   hl, wEntitiesStateTable                  ; $4B97: $21 $90 $C2
    add  hl, bc                                   ; $4B9A: $09
    ld   [hl], $01                                ; $4B9B: $36 $01
    ret                                           ; $4B9D: $C9

label_020_4B9E:
    ld   a, $06                                   ; $4B9E: $3E $06
    ld   [wBombArrowCooldown], a                  ; $4BA0: $EA $C0 $C1
    ld   a, e                                     ; $4BA3: $7B
    ld   [$C1C1], a                               ; $4BA4: $EA $C1 $C1
    ld   a, $0C                                   ; $4BA7: $3E $0C
    ld   [$C19B], a                               ; $4BA9: $EA $9B $C1
    ld   hl, wEntitiesTransitionCountdownTable    ; $4BAC: $21 $E0 $C2
    add  hl, de                                   ; $4BAF: $19
    ld   [hl], $A0                                ; $4BB0: $36 $A0
    ld   hl, wEntitiesSpriteVariantTable          ; $4BB2: $21 $B0 $C3
    add  hl, de                                   ; $4BB5: $19
    ld   [hl], d                                  ; $4BB6: $72
    ld   hl, wEntitiesUnknowTableV                ; $4BB7: $21 $80 $C4
    add  hl, de                                   ; $4BBA: $19
    ld   [hl], $03                                ; $4BBB: $36 $03
    ldh  a, [hIsSideScrolling]                    ; $4BBD: $F0 $F9
    and  a                                        ; $4BBF: $A7
    jr   nz, jr_020_4BC8                          ; $4BC0: $20 $06

    ld   a, JINGLE_BUMP                           ; $4BC2: $3E $09
    ldh  [hJingle], a                             ; $4BC4: $E0 $F2
    jr   jr_020_4BCD                              ; $4BC6: $18 $05

jr_020_4BC8:
    ld   hl, wEntitiesPosZTable                   ; $4BC8: $21 $10 $C3
    add  hl, de                                   ; $4BCB: $19
    ld   [hl], d                                  ; $4BCC: $72

jr_020_4BCD:
    ld   hl, wEntitiesSpeedXTable                 ; $4BCD: $21 $40 $C2
    add  hl, de                                   ; $4BD0: $19
    ld   [hl], d                                  ; $4BD1: $72
    ld   hl, wEntitiesSpeedYTable                 ; $4BD2: $21 $50 $C2
    add  hl, de                                   ; $4BD5: $19
    ld   [hl], d                                  ; $4BD6: $72
    ld   hl, wEntitiesSpeedZTable                 ; $4BD7: $21 $20 $C3
    add  hl, de                                   ; $4BDA: $19
    ld   [hl], d                                  ; $4BDB: $72
    ldh  a, [hLinkDirection]                      ; $4BDC: $F0 $9E
    ld   c, a                                     ; $4BDE: $4F
    ld   b, d                                     ; $4BDF: $42
    ld   hl, Data_020_4B79                        ; $4BE0: $21 $79 $4B

jr_020_4BE3:
    add  hl, bc                                   ; $4BE3: $09
    ldh  a, [hLinkPositionX]                      ; $4BE4: $F0 $98
    add  [hl]                                     ; $4BE6: $86
    ld   hl, wEntitiesPosXTable                   ; $4BE7: $21 $00 $C2
    add  hl, de                                   ; $4BEA: $19
    ld   [hl], a                                  ; $4BEB: $77
    ld   hl, Data_020_4B7D                        ; $4BEC: $21 $7D $4B
    add  hl, bc                                   ; $4BEF: $09
    ldh  a, [hLinkPositionY]                      ; $4BF0: $F0 $99
    add  [hl]                                     ; $4BF2: $86
    ld   hl, wEntitiesPosYTable                   ; $4BF3: $21 $10 $C2
    add  hl, de                                   ; $4BF6: $19
    ld   [hl], a                                  ; $4BF7: $77
    ret

Data_020_4BF9::
    db   $18, -$18

Data_020_4BFB::
    db   $00, -$18, $18, $00

func_020_4BFF::
    ld   hl, wEntitiesTransitionCountdownTable    ; $4BFF: $21 $E0 $C2
    add  hl, de                                   ; $4C02: $19
    ld   [hl], $28                                ; $4C03: $36 $28
    ld   c, $04                                   ; $4C05: $0E $04
    ld   b, $00                                   ; $4C07: $06 $00
    ldh  a, [hPressedButtonsMask]                 ; $4C09: $F0 $CB

jr_020_4C0B:
    srl  a                                        ; $4C0B: $CB $3F
    jr   nc, jr_020_4C10                          ; $4C0D: $30 $01

    inc  b                                        ; $4C0F: $04

jr_020_4C10:
    dec  c                                        ; $4C10: $0D
    jr   nz, jr_020_4C0B                          ; $4C11: $20 $F8

    ld   a, b                                     ; $4C13: $78
    cp   $02                                      ; $4C14: $FE $02
    jr   c, jr_020_4C3E                           ; $4C16: $38 $26

    ldh  a, [hPressedButtonsMask]                 ; $4C18: $F0 $CB
    and  $03                                      ; $4C1A: $E6 $03
    ld   c, a                                     ; $4C1C: $4F
    ld   b, $00                                   ; $4C1D: $06 $00
    ld   hl, Data_020_4BF9 - 1                    ; $4C1F: $21 $F8 $4B
    add  hl, bc                                   ; $4C22: $09
    ld   a, [hl]                                  ; $4C23: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4C24: $21 $40 $C2
    add  hl, de                                   ; $4C27: $19
    ld   [hl], a                                  ; $4C28: $77
    ldh  a, [hPressedButtonsMask]                 ; $4C29: $F0 $CB
    srl  a                                        ; $4C2B: $CB $3F
    srl  a                                        ; $4C2D: $CB $3F
    and  $03                                      ; $4C2F: $E6 $03
    ld   c, a                                     ; $4C31: $4F
    ld   b, $00                                   ; $4C32: $06 $00
    ld   hl, Data_020_4BFB                        ; $4C34: $21 $FB $4B
    add  hl, bc                                   ; $4C37: $09
    ld   a, [hl]                                  ; $4C38: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4C39: $21 $50 $C2
    add  hl, de                                   ; $4C3C: $19
    ld   [hl], a                                  ; $4C3D: $77

jr_020_4C3E:
    ret                                           ; $4C3E: $C9

Data_020_4C3F::
    db   $0E, $F2, $00, $00

Data_020_4C43::
    db   $00, $00, $F4, $0C

func_020_4C47::
    ld   a, JINGLE_POWDER                         ; $4C47: $3E $05
    ldh  [hJingle], a                             ; $4C49: $E0 $F2
    ld   a, $0E                                   ; $4C4B: $3E $0E
    ld   [$C19B], a                               ; $4C4D: $EA $9B $C1
    ld   a, [wMagicPowderCount]                   ; $4C50: $FA $4C $DB
    sub  $01                                      ; $4C53: $D6 $01
    daa                                           ; $4C55: $27
    ld   [wMagicPowderCount], a                   ; $4C56: $EA $4C $DB
    jr   nz, jr_020_4C6D                          ; $4C59: $20 $12

    ld   hl, wBButtonSlot                         ; $4C5B: $21 $00 $DB
    ld   a, [hl]                                  ; $4C5E: $7E
    cp   $0C                                      ; $4C5F: $FE $0C
    jr   nz, jr_020_4C65                          ; $4C61: $20 $02

    ld   [hl], $00                                ; $4C63: $36 $00

jr_020_4C65:
    inc  hl                                       ; $4C65: $23
    ld   a, [hl]                                  ; $4C66: $7E
    cp   $0C                                      ; $4C67: $FE $0C
    jr   nz, jr_020_4C6D                          ; $4C69: $20 $02

    ld   [hl], $00                                ; $4C6B: $36 $00

jr_020_4C6D:
    push bc                                       ; $4C6D: $C5
    ldh  a, [hLinkDirection]                      ; $4C6E: $F0 $9E
    ld   c, a                                     ; $4C70: $4F
    ld   hl, Data_020_4C3F                        ; $4C71: $21 $3F $4C
    add  hl, bc                                   ; $4C74: $09
    ldh  a, [hLinkPositionX]                      ; $4C75: $F0 $98
    add  [hl]                                     ; $4C77: $86
    ld   hl, wEntitiesPosXTable                   ; $4C78: $21 $00 $C2
    add  hl, de                                   ; $4C7B: $19
    ld   [hl], a                                  ; $4C7C: $77
    ld   hl, Data_020_4C43                        ; $4C7D: $21 $43 $4C
    add  hl, bc                                   ; $4C80: $09
    ldh  a, [hLinkPositionY]                      ; $4C81: $F0 $99
    add  [hl]                                     ; $4C83: $86
    ld   hl, wEntitiesPosYTable                   ; $4C84: $21 $10 $C2
    add  hl, de                                   ; $4C87: $19
    ld   [hl], a                                  ; $4C88: $77
    ldh  a, [hLinkPositionZ]                      ; $4C89: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $4C8B: $21 $10 $C3
    add  hl, de                                   ; $4C8E: $19
    ld   [hl], a                                  ; $4C8F: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4C90: $21 $E0 $C2
    add  hl, de                                   ; $4C93: $19
    ld   [hl], $17                                ; $4C94: $36 $17
    pop  bc                                       ; $4C96: $C1
    ret                                           ; $4C97: $C9

PlayBoomerangSfx::
    ld   a, [$C5AC]                               ; $4C98: $FA $AC $C5
    and  a                                        ; $4C9B: $A7
    jr   nz, PlayBoomerangSfx.return              ; $4C9C: $20 $04

    ld   a, $2D                                   ; $4C9E: $3E $2D
    ldh  [hNoiseSfx], a                           ; $4CA0: $E0 $F4

PlayBoomerangSfx.return::
    ret                                           ; $4CA2: $C9

ResetRoomVariables::
    xor  a                                        ; $4CA3: $AF
    ldh  [hFreeWarpDataAddress], a                ; $4CA4: $E0 $E6
    ld   [$C19C], a                               ; $4CA6: $EA $9C $C1
    ld   [$C504], a                               ; $4CA9: $EA $04 $C5
    ld   [$DBC8], a                               ; $4CAC: $EA $C8 $DB
    ld   [wTorchesCount], a                       ; $4CAF: $EA $C9 $DB
    ld   [$C1A2], a                               ; $4CB2: $EA $A2 $C1
    ld   [$C1C6], a                               ; $4CB5: $EA $C6 $C1
    ld   [wRoomSwitchableObject], a               ; $4CB8: $EA $FA $D6
    ld   [$C50A], a                               ; $4CBB: $EA $0A $C5
    ldh  [$FFAC], a                               ; $4CBE: $E0 $AC
    ld   [wC113], a                               ; $4CC0: $EA $13 $C1
    ld   [$D460], a                               ; $4CC3: $EA $60 $D4
    ld   [wInBossBattle], a                       ; $4CC6: $EA $BE $C1
    ld   [$C50E], a                               ; $4CC9: $EA $0E $C5
    ld   [$C3C8], a                               ; $4CCC: $EA $C8 $C3
    ld   [$C5A6], a                               ; $4CCF: $EA $A6 $C5
    ld   [wCompassSfxCountdown], a                ; $4CD2: $EA $62 $D4
    ld   [wC3CD], a                               ; $4CD5: $EA $CD $C3
    ld   [wColorDungonCorrectTombStones], a       ; $4CD8: $EA $D9 $DD
    ld   a, $FF                                   ; $4CDB: $3E $FF
    ld   [wWarpStructs], a                        ; $4CDD: $EA $01 $D4
    ld   [$C50F], a                               ; $4CE0: $EA $0F $C5
    ret                                           ; $4CE3: $C9

;
; Title screen GFX coordinates
;

Data_020_4CE4::
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4CE4
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4CEC
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4CF4
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4CFC
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4D04
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4D0C
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4D14
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4D1C

Data_020_4D24::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ; $4D24
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ; $4D2C
    db   $E0, $E0, $E0, $E0, $E0, $E2, $E5, $E8   ; $4D34
    db   $EB, $EE, $F1, $F4, $F7, $FA, $FD, $00   ; $4D3C
    db   $03, $06, $09, $0C, $0F, $12, $15, $18   ; $4D44
    db   $1B, $1E, $21, $24, $27, $2A, $2D, $30   ; $4D4C
    db   $33, $36, $39, $3C, $3F, $42, $45, $48   ; $4D54
    db   $33, $36, $39, $3C, $3F, $42, $45, $48   ; $4D5C

Data_020_4D64::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ; $4D64
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $E0   ; $4D6C
    db   $E2, $E4, $E6, $E8, $EA, $EC, $EE, $F0   ; $4D74
    db   $F2, $F4, $F6, $F8, $FA, $FC, $FE, $00   ; $4D7C
    db   $02, $04, $06, $08, $0A, $0C, $0E, $10   ; $4D84
    db   $12, $14, $16, $18, $1A, $1C, $1D, $1E   ; $4D8C
    db   $20, $22, $24, $26, $28, $2A, $2C, $2E   ; $4D94
    db   $20, $22, $24, $26, $28, $2A, $2C, $2E   ; $4D9C

Data_020_4DA4::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ; $4DA4
    db   $F0, $DF, $E0, $E2, $E3, $E5, $E6, $E8   ; $4DAC
    db   $E9, $EB, $EC, $EE, $EF, $F1, $F2, $F4   ; $4DB4
    db   $F5, $F7, $F8, $FA, $FB, $FD, $FE, $00   ; $4DBC
    db   $01, $03, $04, $06, $07, $09, $0A, $0C   ; $4DC4
    db   $0D, $0F, $10, $12, $13, $15, $16, $18   ; $4DCC
    db   $19, $1B, $1C, $1E, $1F, $21, $22, $24   ; $4DD4
    db   $19, $1B, $1C, $1E, $1F, $21, $22, $24   ; $4DDC
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ; $4DE4
    db   $F0, $F0, $E2, $E3, $E5, $E6, $E8, $E9   ; $4DEC
    db   $EB, $EC, $EE, $F0, $F2, $F3, $F6, $F7   ; $4DF4
    db   $F8, $F9, $FA, $FC, $FD, $FE, $FF, $00   ; $4DFC
    db   $01, $03, $04, $06, $07, $09, $0A, $0C   ; $4E04
    db   $0D, $0F, $10, $12, $13, $15, $16, $18   ; $4E0C
    db   $19, $1B, $1C, $1E, $1F, $21, $22, $22   ; $4E14
    db   $24, $25, $27, $29, $2B, $2C, $2E, $2F   ; $4E1C

Data_020_4E24::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0   ; $4E24
    db   $E1, $E2, $E4, $E5, $E6, $E8, $E9, $EA   ; $4E2C
    db   $EC, $ED, $EE, $F0, $F1, $F2, $F4, $F5   ; $4E34
    db   $F6, $F8, $F9, $FA, $FC, $FE, $FF, $00   ; $4E3C
    db   $01, $02, $04, $05, $06, $08, $09, $0A   ; $4E44
    db   $0C, $0D, $0E, $10, $11, $12, $14, $15   ; $4E4C
    db   $16, $18, $19, $1A, $1C, $1D, $1E, $20   ; $4E54
    db   $22, $23, $24, $25, $27, $28, $2A, $2B   ; $4E5C
    db   $F0, $F0, $F0, $F0, $F0, $F0, $F0, $E2   ; $4E64
    db   $E3, $E4, $E5, $E6, $E8, $E9, $EA, $EC   ; $4E6C
    db   $ED, $EE, $EF, $F1, $F2, $F3, $F5, $F6   ; $4E74
    db   $F8, $F9, $FA, $FB, $FD, $FE, $FF, $00   ; $4E7C
    db   $01, $02, $03, $05, $06, $07, $08, $0A   ; $4E84
    db   $0B, $0C, $0D, $0F, $10, $11, $12, $14   ; $4E8C
    db   $15, $16, $17, $19, $1A, $1B, $1D, $1E   ; $4E94
    db   $20, $21, $22, $23, $25, $26, $27, $28   ; $4E9C

Data_020_4EA4::
    db   $F0, $F0, $F0, $F0, $F0, $F0, $E3, $E4   ; $4EA4
    db   $E5, $E6, $E7, $E8, $E9, $EB, $EC, $ED   ; $4EAC
    db   $EE, $F0, $F1, $F2, $F3, $F4, $F6, $F7   ; $4EB4
    db   $F8, $F9, $FB, $FC, $FD, $FE, $FF, $00   ; $4EBC
    db   $01, $02, $03, $04, $06, $07, $08, $09   ; $4EC4
    db   $0A, $0B, $0C, $0E, $10, $11, $12, $13   ; $4ECC
    db   $14, $15, $16, $18, $19, $1A, $1B, $1C   ; $4ED4
    db   $1D, $1F, $20, $21, $22, $23, $24, $25   ; $4EDC

Data_020_4EE4::
    db   $F0, $F0, $F0, $F0, $F0, $E4, $E5, $E6   ; $4EE4
    db   $E7, $E8, $E9, $EA, $EB, $EC, $EE, $EF   ; $4EEC
    db   $F0, $F1, $F2, $F3, $F4, $F5, $F6, $F8   ; $4EF4
    db   $F9, $FA, $FB, $FC, $FD, $FE, $FF, $00   ; $4EFC
    db   $01, $02, $03, $04, $05, $06, $07, $08   ; $4F04
    db   $09, $0A, $0C, $0D, $0E, $0F, $10, $11   ; $4F0C
    db   $12, $13, $15, $16, $17, $18, $19, $1A   ; $4F14
    db   $1B, $1C, $1D, $1E, $1F, $21, $22, $23   ; $4F1C
    db   $F0, $F0, $F0, $F0, $E5, $E6, $E7, $E8   ; $4F24
    db   $E9, $EA, $EB, $EC, $ED, $EE, $EF, $F0   ; $4F2C
    db   $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8   ; $4F34
    db   $F9, $FA, $FB, $FC, $FD, $FE, $FF, $00   ; $4F3C
    db   $01, $02, $03, $04, $05, $06, $07, $08   ; $4F44
    db   $09, $0A, $0B, $0C, $0D, $0E, $0F, $10   ; $4F4C
    db   $11, $12, $13, $14, $15, $16, $17, $18   ; $4F54
    db   $19, $1A, $1B, $1C, $1D, $1E, $1F, $20   ; $4F5C

Data_020_4F64::
    db   $F0, $F0, $F0, $E6, $E7, $E8, $E8, $E9   ; $4F64
    db   $EA, $EB, $EC, $ED, $EE, $EF, $F0, $F0   ; $4F6C
    db   $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8   ; $4F74
    db   $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF   ; $4F7C
    db   $00, $01, $02, $03, $04, $05, $06, $07   ; $4F84
    db   $07, $08, $09, $0A, $0B, $0C, $0D, $0E   ; $4F8C
    db   $0F, $10, $11, $12, $13, $14, $15, $16   ; $4F94
    db   $17, $18, $19, $1A, $1A, $1B, $1C, $1D   ; $4F9C

Data_020_4FA4::
    db   $F0, $F0, $E7, $E8, $E9, $EA, $EB, $EC   ; $4FA4
    db   $EC, $EC, $ED, $EE, $EF, $F0, $F1, $F2   ; $4FAC
    db   $F2, $F3, $F4, $F5, $F6, $F7, $F7, $F8   ; $4FB4
    db   $F9, $FA, $FB, $FC, $FC, $FD, $FE, $FF   ; $4FBC
    db   $00, $01, $02, $03, $04, $04, $05, $06   ; $4FC4
    db   $07, $08, $09, $09, $0A, $0B, $0C, $0D   ; $4FCC
    db   $0E, $0E, $0F, $10, $11, $12, $13, $14   ; $4FD4
    db   $15, $16, $16, $17, $18, $19, $1A, $1B   ; $4FDC

Data_020_4FE4::
    db   $F0, $E9, $E9, $EA, $EB, $EB, $EC, $ED   ; $4FE4
    db   $EE, $EE, $EF, $F0, $F0, $F1, $F2, $F3   ; $4FEC
    db   $F4, $F4, $F5, $F6, $F7, $F8, $F8, $F9   ; $4FF4
    db   $FA, $FB, $FC, $FC, $FD, $FE, $FF, $00   ; $4FFC
    db   $00, $01, $02, $03, $03, $04, $05, $06   ; $5004
    db   $06, $07, $08, $09, $0A, $0A, $0B, $0C   ; $500C
    db   $0C, $0D, $0E, $0E, $10, $11, $12, $12   ; $5014
    db   $13, $14, $15, $15, $16, $17, $18, $18   ; $501C
    db   $EB, $EC, $EC, $ED, $EE, $EE, $EF, $F0   ; $5024
    db   $F0, $F1, $F2, $F2, $F3, $F4, $F4, $F5   ; $502C
    db   $F6, $F6, $F7, $F8, $F8, $F9, $FA, $FA   ; $5034
    db   $FB, $FC, $FC, $FD                       ; $503C
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
    ld   a, [wGameplaySubtype]                    ; $5257: $FA $96 $DB
    cp   GAMEPLAY_INTRO_TITLE - 1                 ; $525A: $FE $0A
    ret  nc                                       ; $525C: $D0

    ld   hl, $C17C                                ; $525D: $21 $7C $C1
    xor  a                                        ; $5260: $AF
    ld   [hl+], a                                 ; $5261: $22
    ld   [hl+], a                                 ; $5262: $22
    ld   d, $00                                   ; $5263: $16 $00
    ldh  a, [hFrameCounter]                       ; $5265: $F0 $E7
    and  $01                                      ; $5267: $E6 $01
    jr   nz, jr_020_527C                          ; $5269: $20 $11

    ld   a, [$C17E]                               ; $526B: $FA $7E $C1
    inc  a                                        ; $526E: $3C
    cp   $10                                      ; $526F: $FE $10
    jr   c, jr_020_5279                           ; $5271: $38 $06

    ld   a, $10                                   ; $5273: $3E $10
    ld   [$C17E], a                               ; $5275: $EA $7E $C1
    ret                                           ; $5278: $C9

jr_020_5279:
    ld   [$C17E], a                               ; $5279: $EA $7E $C1

jr_020_527C:
    ld   a, [$C17E]                               ; $527C: $FA $7E $C1
    ld   e, a                                     ; $527F: $5F
    ld   hl, data_020_5246                        ; $5280: $21 $46 $52
    add  hl, de                                   ; $5283: $19
    ld   a, [hl]                                  ; $5284: $7E
    ldh  [hScratch0], a                           ; $5285: $E0 $D7
    sla  e                                        ; $5287: $CB $23
    ld   hl, data_020_5224                        ; $5289: $21 $24 $52
    add  hl, de                                   ; $528C: $19
    ld   a, [hl+]                                 ; $528D: $2A
    ld   b, [hl]                                  ; $528E: $46
    ld   c, a                                     ; $528F: $4F

jr_020_5290:
    ldh  a, [rLY]                                 ; $5290: $F0 $44
    cp   $10                                      ; $5292: $FE $10
    jr   nz, jr_020_5290                          ; $5294: $20 $FA

jr_020_5296:
    ldh  a, [rSTAT]                               ; $5296: $F0 $41
    and  $03                                      ; $5298: $E6 $03
    jr   nz, jr_020_5296                          ; $529A: $20 $FA

    ld   hl, hScratch1                            ; $529C: $21 $D8 $FF
    ld   [hl], $01                                ; $529F: $36 $01
    ldh  a, [hIsGBC]                              ; $52A1: $F0 $FE
    and  a                                        ; $52A3: $A7
    jr   z, jr_020_52A8                           ; $52A4: $28 $02

    ld   [hl], $03                                ; $52A6: $36 $03

jr_020_52A8:
    ld   a, [$C17D]                               ; $52A8: $FA $7D $C1
    inc  a                                        ; $52AB: $3C
    ld   [$C17D], a                               ; $52AC: $EA $7D $C1
    and  [hl]                                     ; $52AF: $A6
    jr   nz, jr_020_52A8                          ; $52B0: $20 $F6

    ldh  a, [hScratch0]                           ; $52B2: $F0 $D7
    ld   l, a                                     ; $52B4: $6F
    ld   a, [$C17C]                               ; $52B5: $FA $7C $C1
    ld   e, a                                     ; $52B8: $5F
    inc  a                                        ; $52B9: $3C
    ld   [$C17C], a                               ; $52BA: $EA $7C $C1
    cp   $3A                                      ; $52BD: $FE $3A
    jr   z, jr_020_52DC                           ; $52BF: $28 $1B

    cp   l                                        ; $52C1: $BD
    jr   c, jr_020_52CE                           ; $52C2: $38 $0A

    ldh  a, [hIsGBC]                              ; $52C4: $F0 $FE
    and  a                                        ; $52C6: $A7
    jr   nz, jr_020_52DC                          ; $52C7: $20 $13

    xor  a                                        ; $52C9: $AF
    ldh  [rBGP], a                                ; $52CA: $E0 $47
    jr   jr_020_5296                              ; $52CC: $18 $C8

jr_020_52CE:
    ld   hl, $0000                                ; $52CE: $21 $00 $00
    add  hl, de                                   ; $52D1: $19
    add  hl, bc                                   ; $52D2: $09
    ld   a, [hl]                                  ; $52D3: $7E
    ld   hl, hBaseScrollY                         ; $52D4: $21 $97 $FF
    add  [hl]                                     ; $52D7: $86
    ldh  [rSCY], a                                ; $52D8: $E0 $42
    jr   jr_020_5296                              ; $52DA: $18 $BA

jr_020_52DC:
    ldh  a, [hBaseScrollY]                        ; $52DC: $F0 $97
    sub  $38                                      ; $52DE: $D6 $38
    ldh  [rSCY], a                                ; $52E0: $E0 $42

jr_020_52E2:
    ldh  a, [rLY]                                 ; $52E2: $F0 $44
    cp   $48                                      ; $52E4: $FE $48
    jr   c, jr_020_52E2                           ; $52E6: $38 $FA

jr_020_52E8:
    ldh  a, [rSTAT]                               ; $52E8: $F0 $41
    and  $03                                      ; $52EA: $E6 $03
    jr   nz, jr_020_52E8                          ; $52EC: $20 $FA

    ldh  a, [hBaseScrollY]                        ; $52EE: $F0 $97
    ldh  [rSCY], a                                ; $52F0: $E0 $42
    ld   a, [wBGPalette]                          ; $52F2: $FA $97 $DB
    ldh  [rBGP], a                                ; $52F5: $E0 $47
    ret                                           ; $52F7: $C9

; Unused data
Data_020_52F8::
    db   $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F

; Fill a palette with white?
; (dead code)
func_020_5308::
    ld   a, $98                                   ; $5308: $3E $98
    ldh  [rBCPS], a                               ; $530A: $E0 $68
    ld   hl, rBGPD                                ; $530C: $21 $69 $FF
    ld   b, $08                                   ; $530F: $06 $08

.loop
    ld   [hl], $FF                                ; $5311: $36 $FF
    ld   [hl], $7F                                ; $5313: $36 $7F
    dec  b                                        ; $5315: $05
    jr   nz, .loop                                ; $5316: $20 $F9

    ret                                           ; $5318: $C9

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
    ldh  a, [hLinkAnimationState]                 ; $54F5: $F0 $9D
    cp   $FF                                      ; $54F7: $FE $FF
    ret  z                                        ; $54F9: $C8

    ; Read the first byte in LinkAnimationStateTable
    ld   hl, LinkAnimationStateTable              ; $54FA: $21 $19 $53
    sla  a                                        ; $54FD: $CB $27
    ld   c, a                                     ; $54FF: $4F
    ld   b, $00                                   ; $5500: $06 $00
    add  hl, bc                                   ; $5502: $09
    ld   e, [hl]                                  ; $5503: $5E
    push hl                                       ; $5504: $E5

    ld   hl, data_020_5407                        ; $5505: $21 $07 $54
    add  hl, bc                                   ; $5508: $09
    ld   a, [wC11D]                               ; $5509: $FA $1D $C1
    and  $98                                      ; $550C: $E6 $98
    or   [hl]                                     ; $550E: $B6
    ld   [wC11D], a                               ; $550F: $EA $1D $C1
    inc  hl                                       ; $5512: $23
    ld   a, [wC11E]                               ; $5513: $FA $1E $C1
    and  $98                                      ; $5516: $E6 $98
    or   [hl]                                     ; $5518: $B6
    ld   [wC11E], a                               ; $5519: $EA $1E $C1
    ld   d, $00                                   ; $551C: $16 $00
    sla  e                                        ; $551E: $CB $23
    rl   d                                        ; $5520: $CB $12
    sla  e                                        ; $5522: $CB $23
    rl   d                                        ; $5524: $CB $12
    sla  e                                        ; $5526: $CB $23
    rl   d                                        ; $5528: $CB $12
    sla  e                                        ; $552A: $CB $23
    rl   d                                        ; $552C: $CB $12
    ld   hl, LinkCharacter2Tiles                  ; $552E: $21 $00 $58
    add  hl, de                                   ; $5531: $19
    ld   c, l                                     ; $5532: $4D
    ld   b, h                                     ; $5533: $44
    ld   hl, vTiles0                              ; $5534: $21 $00 $80
    ld   d, $20                                   ; $5537: $16 $20
    call CopyLinkTilesPair                        ; $5539: $CD $0A $1D

    ; hl = LinkAnimationStateTable + hLinkAnimationState
    pop  hl                                       ; $553C: $E1
    ; Read the 2nd byte from the table
    inc  hl                                       ; $553D: $23
    ld   e, [hl]                                  ; $553E: $5E
    ld   d, $00                                   ; $553F: $16 $00
    sla  e                                        ; $5541: $CB $23
    rl   d                                        ; $5543: $CB $12
    sla  e                                        ; $5545: $CB $23
    rl   d                                        ; $5547: $CB $12
    sla  e                                        ; $5549: $CB $23
    rl   d                                        ; $554B: $CB $12
    sla  e                                        ; $554D: $CB $23
    rl   d                                        ; $554F: $CB $12
    ld   hl, LinkCharacter2Tiles                  ; $5551: $21 $00 $58
    add  hl, de                                   ; $5554: $19
    ld   c, l                                     ; $5555: $4D
    ld   b, h                                     ; $5556: $44
    ld   hl, vTiles0 + $20                        ; $5557: $21 $20 $80
    ld   d, $20                                   ; $555A: $16 $20
    call CopyLinkTilesPair                        ; $555C: $CD $0A $1D
    ret                                           ; $555F: $C9

Data_020_5560::
    db   $08, $08, $0A, $0A

Data_020_5564::
    db   $01, $FF, $F0, $10

Data_020_5568::
    db   $00, $00, $03, $00

Data_020_556C::
    db   $01, $1F, $E0, $20

; Set next BG region origin, and decrement wRoomTransitionFramesBeforeMidScreen
func_020_5570::
    ld   e, $FF                                   ; $5570: $1E $FF
    ld   a, [wRoomTransitionDirection]            ; $5572: $FA $25 $C1
    ld   c, a                                     ; $5575: $4F
    ld   b, $00                                   ; $5576: $06 $00
    and  $02                                      ; $5578: $E6 $02
    jr   nz, jr_020_557E                          ; $557A: $20 $02

    ld   e, $DF                                   ; $557C: $1E $DF

jr_020_557E:
    ld   hl, Data_020_5560                        ; $557E: $21 $60 $55
    add  hl, bc                                   ; $5581: $09
    ld   a, [hl]                                  ; $5582: $7E
    ld   [wBGUpdateRegionTilesCount], a           ; $5583: $EA $28 $C1
    ld   a, [wRoomTransitionFramesBeforeMidScreen]; $5586: $FA $29 $C1
    and  $01                                      ; $5589: $E6 $01
    jr   z, jr_020_5598                           ; $558B: $28 $0B

    ld   hl, Data_020_5564                        ; $558D: $21 $64 $55
    add  hl, bc                                   ; $5590: $09
    ld   a, [$C12A]                               ; $5591: $FA $2A $C1
    add  [hl]                                     ; $5594: $86
    ld   [$C12A], a                               ; $5595: $EA $2A $C1

jr_020_5598:
    ld   hl, Data_020_556C                        ; $5598: $21 $6C $55
    add  hl, bc                                   ; $559B: $09
    ld   a, [wBGUpdateRegionOriginLow]            ; $559C: $FA $27 $C1
    add  [hl]                                     ; $559F: $86
    rr   d                                        ; $55A0: $CB $1A
    and  e                                        ; $55A2: $A3
    ld   [wBGUpdateRegionOriginLow], a            ; $55A3: $EA $27 $C1
    ld   hl, Data_020_5568                        ; $55A6: $21 $68 $55
    add  hl, bc                                   ; $55A9: $09
    ld   a, [wBGUpdateRegionOriginHigh]           ; $55AA: $FA $26 $C1
    rl   d                                        ; $55AD: $CB $12
    adc  [hl]                                     ; $55AF: $8E
    and  $03                                      ; $55B0: $E6 $03
    ld   [wBGUpdateRegionOriginHigh], a           ; $55B2: $EA $26 $C1
    ld   a, [wRoomTransitionFramesBeforeMidScreen]; $55B5: $FA $29 $C1
    dec  a                                        ; $55B8: $3D
    ld   [wRoomTransitionFramesBeforeMidScreen], a; $55B9: $EA $29 $C1
    jr   nz, jr_020_55C1                          ; $55BC: $20 $03

    jp   label_020_55C2                           ; $55BE: $C3 $C2 $55

jr_020_55C1:
    ret                                           ; $55C1: $C9

label_020_55C2:
    ld   a, [wRoomTransitionState]                ; $55C2: $FA $24 $C1
    inc  a                                        ; $55C5: $3C
    ld   [wRoomTransitionState], a                ; $55C6: $EA $24 $C1
    ret                                           ; $55C9: $C9

func_020_55CA::
    ldh  a, [hMusicFadeOutTimer]                  ; $55CA: $F0 $A8
    and  a                                        ; $55CC: $A7
    jr   z, jr_020_55F0                           ; $55CD: $28 $21

    ld   a, [wTransitionSequenceCounter]          ; $55CF: $FA $6B $C1
    cp   $03                                      ; $55D2: $FE $03
    jr   nz, jr_020_55F0                          ; $55D4: $20 $1A

    ld   a, [wC16C]                               ; $55D6: $FA $6C $C1
    and  $03                                      ; $55D9: $E6 $03
    cp   $03                                      ; $55DB: $FE $03
    jr   nz, jr_020_55F0                          ; $55DD: $20 $11

    ld   hl, hWindowYUnused                       ; $55DF: $21 $A9 $FF
    ld   a, [hl]                                  ; $55E2: $7E
    inc  hl                                       ; $55E3: $23
    or   [hl]                                     ; $55E4: $B6
    jr   z, jr_020_55F0                           ; $55E5: $28 $09

    ldh  a, [hMusicFadeOutTimer]                  ; $55E7: $F0 $A8
    and  $FC                                      ; $55E9: $E6 $FC
    or   $01                                      ; $55EB: $F6 $01
    ldh  [hMusicFadeOutTimer], a                  ; $55ED: $E0 $A8
    ret                                           ; $55EF: $C9

jr_020_55F0:
    ld   hl, wC16C                                ; $55F0: $21 $6C $C1
    inc  [hl]                                     ; $55F3: $34
    ld   a, [hl]                                  ; $55F4: $7E
    and  $03                                      ; $55F5: $E6 $03
    jr   nz, jr_020_562E                          ; $55F7: $20 $35

    ld   hl, wTransitionSequenceCounter           ; $55F9: $21 $6B $C1
    ld   a, [hl]                                  ; $55FC: $7E
    cp   $04                                      ; $55FD: $FE $04
    jr   z, jr_020_562E                           ; $55FF: $28 $2D

    inc  [hl]                                     ; $5601: $34
    xor  a                                        ; $5602: $AF
    ldh  [hScratch0], a                           ; $5603: $E0 $D7

jr_020_5605:
    ldh  a, [hScratch0]                           ; $5605: $F0 $D7
    cp   $03                                      ; $5607: $FE $03
    jr   z, jr_020_562E                           ; $5609: $28 $23

    ld   hl, wBGPalette                           ; $560B: $21 $97 $DB
    ld   e, a                                     ; $560E: $5F
    ld   d, $00                                   ; $560F: $16 $00
    add  hl, de                                   ; $5611: $19
    ld   a, [hl]                                  ; $5612: $7E
    ld   c, a                                     ; $5613: $4F
    ld   b, $00                                   ; $5614: $06 $00

jr_020_5616:
    ld   a, c                                     ; $5616: $79
    and  $03                                      ; $5617: $E6 $03
    jr   z, jr_020_561C                           ; $5619: $28 $01

    dec  c                                        ; $561B: $0D

jr_020_561C:
    rrc  c                                        ; $561C: $CB $09
    rrc  c                                        ; $561E: $CB $09
    inc  b                                        ; $5620: $04
    ld   a, b                                     ; $5621: $78
    cp   $04                                      ; $5622: $FE $04
    jr   nz, jr_020_5616                          ; $5624: $20 $F0

    ld   a, c                                     ; $5626: $79
    ld   [hl], a                                  ; $5627: $77
    ld   hl, hScratch0                            ; $5628: $21 $D7 $FF
    inc  [hl]                                     ; $562B: $34
    jr   jr_020_5605                              ; $562C: $18 $D7

jr_020_562E:
    ret                                           ; $562E: $C9

Data_020_562F::
    db   $00, $01, $02, $03, $00, $03, $01, $00, $00, $01, $02, $03

func_020_563B::
    ld   hl, wC16C                                ; $563B: $21 $6C $C1
    inc  [hl]                                     ; $563E: $34
    ld   a, [wC16C]                               ; $563F: $FA $6C $C1
    and  $03                                      ; $5642: $E6 $03
    jr   nz, jr_020_568A                          ; $5644: $20 $44

    ld   hl, wTransitionSequenceCounter           ; $5646: $21 $6B $C1

label_020_5649:
    ld   a, [hl]                                  ; $5649: $7E
    inc  [hl]                                     ; $564A: $34

func_020_564B::
    cp   $04                                      ; $564B: $FE $04
    jr   z, jr_020_568A                           ; $564D: $28 $3B

    xor  a                                        ; $564F: $AF
    ldh  [hScratch0], a                           ; $5650: $E0 $D7

jr_020_5652:
    ldh  a, [hScratch0]                           ; $5652: $F0 $D7
    cp   $03                                      ; $5654: $FE $03
    jr   z, jr_020_568A                           ; $5656: $28 $32

    ld   hl, wBGPalette                           ; $5658: $21 $97 $DB
    ld   e, a                                     ; $565B: $5F
    ld   d, $00                                   ; $565C: $16 $00
    add  hl, de                                   ; $565E: $19
    ld   a, [hl]                                  ; $565F: $7E
    push hl                                       ; $5660: $E5
    ld   c, a                                     ; $5661: $4F
    ld   b, $00                                   ; $5662: $06 $00

jr_020_5664:
    ldh  a, [hScratch0]                           ; $5664: $F0 $D7
    sla  a                                        ; $5666: $CB $27
    sla  a                                        ; $5668: $CB $27
    or   b                                        ; $566A: $B0
    ld   e, a                                     ; $566B: $5F
    ld   hl, Data_020_562F                        ; $566C: $21 $2F $56
    add  hl, de                                   ; $566F: $19
    ld   a, c                                     ; $5670: $79
    and  $03                                      ; $5671: $E6 $03
    cp   [hl]                                     ; $5673: $BE
    jr   z, jr_020_5677                           ; $5674: $28 $01

    inc  c                                        ; $5676: $0C

jr_020_5677:
    rrc  c                                        ; $5677: $CB $09
    rrc  c                                        ; $5679: $CB $09
    inc  b                                        ; $567B: $04
    ld   a, b                                     ; $567C: $78
    cp   $04                                      ; $567D: $FE $04
    jr   nz, jr_020_5664                          ; $567F: $20 $E3

    ld   a, c                                     ; $5681: $79
    pop  hl                                       ; $5682: $E1
    ld   [hl], a                                  ; $5683: $77
    ld   hl, hScratch0                            ; $5684: $21 $D7 $FF
    inc  [hl]                                     ; $5687: $34
    jr   jr_020_5652                              ; $5688: $18 $C8

jr_020_568A:
    ret                                           ; $568A: $C9

Data_20_568B::
    db   $27, $6A, $6C, $21, $22, $23, $24, $25
    db   $26, $6A, $FF, $6C, $6A, $6C, $6A, $6C
    db   $65, $65, $66, $31, $32, $33, $34, $35
    db   $36, $67, $68, $64, $67, $69, $65, $66
    db   $40, $40, $41, $42, $43, $44, $FA, $FA
    db   $63, $40, $40, $40, $40, $40, $40, $60
    db   $FF, $FA, $48, $49, $4A, $FA, $FA, $FF
    db   $62, $6D, $6D, $6D, $6D, $6D, $6D, $FF
    db   $00, $01, $00, $01, $FA, $FF, $5E, $5F
    db   $04, $05, $06, $07, $28, $29, $29, $2A
    db   $10, $11, $10, $11, $FA, $FA, $6E, $6F
    db   $14, $15, $16, $17, $38, $20, $20, $3A
    db   $00, $01, $00, $01, $FB, $FF, $FE, $FE
    db   $08, $09, $0A, $0B, $38, $20, $20, $3A
    db   $10, $11, $10, $11, $FB, $FB, $FE, $FE
    db   $18, $19, $1A, $1B, $48, $49, $49, $4A
    db   $FB, $FF, $0C, $0D, $40, $40, $40, $40
    db   $FA, $FA, $FF, $58, $0E, $0F, $FA, $FA
    db   $FB, $FB, $1C, $1D, $FA, $FA, $FA, $FA
    db   $FA, $FA, $FA, $5D, $1E, $1F, $FA, $FA
    db   $0C, $0D, $0C, $0D, $FB, $FB, $28, $2A
    db   $FA, $FA, $FA, $58, $2D, $2E, $2E, $2F
    db   $1C, $1D, $1C, $1D, $FB, $56, $61, $4A
    db   $FA, $FA, $59, $5A, $3D, $3E, $3E, $3F
    db   $FD, $FD, $FD, $FD, $FB, $FB, $FB, $FB
    db   $28, $29, $5B, $FA, $FF, $FF, $54, $54
    db   $FD, $FD, $FD, $FD, $FB, $FB, $FF, $FB
    db   $38, $30, $3A, $FA, $FF, $FF, $54, $54
    db   $FD, $FD, $FD, $FF, $FD, $FD, $FB, $FB
    db   $48, $FE, $4A, $FA, $56, $57, $54, $54
    db   $03, $12, $13, $12, $13, $02, $FF, $FB
    db   $5C, $2B, $FA, $FA, $FA, $FA, $54, $54

Data_020_578B::
    db   $03, $03, $03, $03, $03, $03, $02, $03   ; $578B
    db   $03, $03, $00, $03, $03, $03, $03, $03   ; $5793
    db   $03, $03, $03, $03, $03, $03, $03, $03   ; $579B
    db   $03, $03, $03, $03, $03, $03, $03, $03   ; $57A3
    db   $03, $03, $04, $04, $04, $04, $00, $00   ; $57AB
    db   $04, $03, $03, $03, $03, $03, $03, $03   ; $57B3
    db   $01, $00, $04, $04, $04, $04, $00, $01   ; $57BB
    db   $04, $04, $04, $04, $04, $04, $04, $01   ; $57C3
    db   $00, $00, $00, $00, $00, $02, $01, $01   ; $57CB
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $57D3
    db   $00, $00, $00, $00, $00, $00, $01, $01   ; $57DB
    db   $04, $06, $04, $04, $04, $07, $07, $04   ; $57E3
    db   $00, $00, $00, $00, $00, $01, $01, $01   ; $57EB
    db   $04, $06, $04, $04, $04, $07, $07, $04   ; $57F3
    db   $00, $00, $00, $00, $00, $00, $01, $01   ; $57FB
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $5803
    db   $00, $01, $02, $02, $03, $03, $03, $03   ; $580B
    db   $00, $00, $00, $04, $02, $07, $00, $00   ; $5813
    db   $00, $00, $02, $02, $00, $00, $00, $00   ; $581B
    db   $00, $00, $00, $04, $07, $07, $00, $00   ; $5823
    db   $07, $07, $01, $01, $00, $00, $04, $04   ; $582B
    db   $00, $00, $00, $04, $05, $03, $03, $03   ; $5833
    db   $07, $07, $01, $01, $00, $04, $04, $04   ; $583B
    db   $00, $00, $04, $04, $03, $03, $03, $03   ; $5843
    db   $03, $03, $03, $03, $00, $00, $00, $00   ; $584B
    db   $04, $04, $04, $00, $07, $01, $03, $03   ; $5853
    db   $03, $03, $03, $03, $00, $00, $02, $00   ; $585B
    db   $04, $04, $04, $00, $00, $02, $03, $03   ; $5863
    db   $03, $03, $03, $07, $03, $03, $00, $00   ; $586B
    db   $04, $04, $04, $00, $04, $04, $03, $03   ; $5873
    db   $04, $04, $04, $04, $04, $04, $07, $00   ; $587B
    db   $04, $04, $00, $00, $00, $00, $03, $03   ; $5883

LoadTileset0E::
    ld   a, LOW(Data_20_568B)                     ; $588B: $3E $8B
    ldh  [hScratchA], a                           ; $588D: $E0 $E1
    ld   a, HIGH(Data_20_568B)                    ; $588F: $3E $56
    ldh  [hScratchB], a                           ; $5891: $E0 $E2

    xor  a                                        ; $5893: $AF
    ldh  [hScratchC], a                           ; $5894: $E0 $E3
    call func_020_58AD                            ; $5896: $CD $AD $58
    ldh  a, [hIsGBC]                              ; $5899: $F0 $FE
    and  a                                        ; $589B: $A7
    ret  z                                        ; $589C: $C8

    ld   a, LOW(Data_020_578B)                    ; $589D: $3E $8B
    ldh  [hScratchA], a                           ; $589F: $E0 $E1
    ld   a, HIGH(Data_020_578B)                   ; $58A1: $3E $57
    ldh  [hScratchB], a                           ; $58A3: $E0 $E2
    ld   hl, hScratchC                            ; $58A5: $21 $E3 $FF
    inc  [hl]                                     ; $58A8: $34
    call func_020_58AD                            ; $58A9: $CD $AD $58
    ret                                           ; $58AC: $C9

func_020_58AD::
    ld   de, vBGMap0 + $22                        ; $58AD: $11 $22 $98
    ld   bc, 0                                    ; $58B0: $01 $00 $00

jr_020_58B3:
    ld   a, [$C5A2]                               ; $58B3: $FA $A2 $C5
    and  a                                        ; $58B6: $A7
    jr   nz, jr_020_58CB                          ; $58B7: $20 $12

    ld   a, [wGameplayType]                       ; $58B9: $FA $95 $DB
    cp   $01                                      ; $58BC: $FE $01
    jr   z, jr_020_58CB                           ; $58BE: $28 $0B

    ld   hl, wOverworldRoomStatus                 ; $58C0: $21 $00 $D8
    add  hl, bc                                   ; $58C3: $09
    ld   a, [hl]                                  ; $58C4: $7E
    and  $80                                      ; $58C5: $E6 $80
    ld   a, $2C                                   ; $58C7: $3E $2C
    jr   z, jr_020_58D3                           ; $58C9: $28 $08

jr_020_58CB:
    ldh  a, [hBGMapOffsetLow]                     ; $58CB: $F0 $E1
    ld   l, a                                     ; $58CD: $6F
    ldh  a, [hScratchB]                           ; $58CE: $F0 $E2
    ld   h, a                                     ; $58D0: $67
    add  hl, bc                                   ; $58D1: $09
    ld   a, [hl]                                  ; $58D2: $7E

jr_020_58D3:
    ld   h, a                                     ; $58D3: $67
    ldh  a, [hScratchC]                           ; $58D4: $F0 $E3
    and  a                                        ; $58D6: $A7
    jr   z, jr_020_58EA                           ; $58D7: $28 $11

    ld   a, $01                                   ; $58D9: $3E $01
    ldh  [rVBK], a                                ; $58DB: $E0 $4F
    ld   a, h                                     ; $58DD: $7C
    cp   $2C                                      ; $58DE: $FE $2C
    jr   nz, jr_020_58E4                          ; $58E0: $20 $02

    ld   a, $01                                   ; $58E2: $3E $01

jr_020_58E4:
    ld   [de], a                                  ; $58E4: $12
    xor  a                                        ; $58E5: $AF
    ldh  [rVBK], a                                ; $58E6: $E0 $4F
    jr   jr_020_58EC                              ; $58E8: $18 $02

jr_020_58EA:
    ld   a, h                                     ; $58EA: $7C
    ld   [de], a                                  ; $58EB: $12

jr_020_58EC:
    inc  c                                        ; $58EC: $0C
    jr   z, jr_020_5903                           ; $58ED: $28 $14

    inc  e                                        ; $58EF: $1C
    ld   a, e                                     ; $58F0: $7B
    and  $1F                                      ; $58F1: $E6 $1F
    cp   $12                                      ; $58F3: $FE $12
    jr   nz, jr_020_5901                          ; $58F5: $20 $0A

    ld   a, e                                     ; $58F7: $7B
    and  $E0                                      ; $58F8: $E6 $E0
    add  $22                                      ; $58FA: $C6 $22
    ld   e, a                                     ; $58FC: $5F
    ld   a, d                                     ; $58FD: $7A
    adc  $00                                      ; $58FE: $CE $00
    ld   d, a                                     ; $5900: $57

jr_020_5901:
    jr   jr_020_58B3                              ; $5901: $18 $B0

jr_020_5903:
    ret                                           ; $5903: $C9

InventoryEntryPoint::
    ld   a, [wGameplaySubtype]                    ; $5904: $FA $96 $DB
    JP_TABLE                                      ; $5907
._00 dw InventoryInitialHandler
._01 dw InventoryMapFadeOutHandler
._02 dw InventoryLoad1Handler
._03 dw InventoryLoad2Handler
._04 dw InventoryLoad3Handler
._05 dw InventoryLoad4Handler
._06 dw InventoryLoad5Handler
._07 dw InventoryFadeInHandler
._08 dw InventoryVisibleHandler
._09 dw InventoryInteractiveHandler
._0A dw InventoryStatusInHandler
._0B dw InventoryStatusOutHandler
._0C dw InventoryFadeOutHandler

InventoryInitialHandler::
    ldh  a, [hIsGBC]
    and  a
    jr   z, jr_020_5940                           ; $5925: $28 $19

    ld   hl, $DC10                                ; $5927: $21 $10 $DC
    ld   c, $80                                   ; $592A: $0E $80
    di                                            ; $592C: $F3

jr_020_592D:
    xor  a                                        ; $592D: $AF
    ldh  [rSVBK], a                               ; $592E: $E0 $70
    ld   b, [hl]                                  ; $5930: $46
    ld   a, $03                                   ; $5931: $3E $03
    ldh  [rSVBK], a                               ; $5933: $E0 $70
    ld   [hl], b                                  ; $5935: $70
    inc  hl                                       ; $5936: $23
    dec  c                                        ; $5937: $0D
    ld   a, c                                     ; $5938: $79
    and  a                                        ; $5939: $A7
    jr   nz, jr_020_592D                          ; $593A: $20 $F1

    xor  a                                        ; $593C: $AF
    ldh  [rSVBK], a                               ; $593D: $E0 $70
    ei                                            ; $593F: $FB

jr_020_5940:
    call IncrementGameplaySubtype_20                            ; $5940: $CD $83 $66

InventoryMapFadeOutHandler::
    call func_1A22                                ; $5943: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $5946: $FA $6B $C1
    cp   $04                                      ; $5949: $FE $04
    ; Returns back to render palettes if transition isn't finished
    jr   nz, .return                               ; $594B: $20 $1C

    xor  a                                        ; $594D: $AF
    ld   [wInventoryAppearing], a                 ; $594E: $EA $4F $C1
    ld   a, $03                                   ; $5951: $3E $03
    ldh  [hWindowYUnused], a                      ; $5953: $E0 $A9
    ld   a, $30                                   ; $5955: $3E $30
    ldh  [hWindowXUnused], a                      ; $5957: $E0 $AA
    xor  a                                        ; $5959: $AF
    ld   [$DE06], a                               ; $595A: $EA $06 $DE
    ld   [$DE07], a                               ; $595D: $EA $07 $DE
    ld   [$DE08], a                               ; $5960: $EA $08 $DE
    ld   [$DE09], a                               ; $5963: $EA $09 $DE
    call IncrementGameplaySubtype_20                            ; $5966: $CD $83 $66

.return
    ; Returns to 0346 (Render Palettes)
    ret                                           ; $5969: $C9

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
    ; These are actually indexes in the precious table of bytes that need to be set to 7F to hide items.
    ; It uses this offset to write 2x7F byte when an item is not available
    db   $03, $0A, $11, $22, $05, $0C, $13, $1D, $27

; Start building display of inventory
; Called from jp hl in 00:28CE (TABLEJUMP)
; Copies 51 bytes from data_020_5994 (above) to wRequestDestination (D601)                                          ; $59CF: $27
InventoryLoad1Handler::
    ld   hl, wRequestDestinationHigh              ; $59D0: $21 $01 $D6
    ld   bc, data_020_5994                        ; $59D3: $01 $94 $59
    ld   e, $33                                   ; $59D6: $1E $33

jr_020_59D8:
    ld   a, [bc]                                  ; $59D8: $0A
    inc  bc                                       ; $59D9: $03
    ld   [hl+], a                                 ; $59DA: $22
    dec  e                                        ; $59DB: $1D
    jr   nz, jr_020_59D8                          ; $59DC: $20 $FA

    ldh  a, [hIsGBC]                              ; $59DE: $F0 $FE
    and  a                                        ; $59E0: $A7
    jr   z, inventoryDisplayEntryPoint            ; $59E1: $28 $40

; GBC Exclusive code
; Load 32 bytes from 596A into DC91
    ld   hl, $DC91                                ; $59E3: $21 $91 $DC
    ld   bc, data_020_596A                        ; $59E6: $01 $6A $59
    ld   e, $1F                                   ; $59E9: $1E $1F

jr_020_59EB:
    ld   a, [bc]                                  ; $59EB: $0A
    inc  bc                                       ; $59EC: $03
    ld   [hl+], a                                 ; $59ED: $22
    dec  e                                        ; $59EE: $1D
    jr   nz, jr_020_59EB                          ; $59EF: $20 $FA

    ld   a, $1E                                   ; $59F1: $3E $1E
    ld   [$DC90], a                               ; $59F3: $EA $90 $DC

    ; If on the overworld…
    ld   a, [wIsIndoor]                           ; $59F6: $FA $A5 $DB
    and  a                                        ; $59F9: $A7
    ; start building the inventory
    jr   z, inventoryDisplayEntryPoint            ; $59FA: $28 $27

    ;
    ; Dungeon inventory
    ;

; If inside Color Dungeon…
    ldh  a, [hMapId]                              ; $59FC: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $59FE: $FE $FF
    jr   z, .colorDungeonEnd                      ; $5A00: $28 $04

    ; Jump ahead if map is greater than MAP_CAVE_B
    cp   MAP_CAVE_B                               ; $5A02: $FE $0A
    jr   nc, inventoryDisplayEntryPoint           ; $5A04: $30 $1D
.colorDungeonEnd

; Set BC and E to point to the end of the "Palette Data?" (12 bytes) above
    ld   hl, $DC91                                ; $5A06: $21 $91 $DC
    ld   a, [$DC90]                               ; $5A09: $FA $90 $DC
    ld   c, a                                     ; $5A0C: $4F
    ld   b, $00                                   ; $5A0D: $06 $00
    add  hl, bc                                   ; $5A0F: $09
    ld   bc, Data_020_5989                        ; $5A10: $01 $89 $59
    ld   e, $0B                                   ; $5A13: $1E $0B

; Copy the remaining palette data
jr_020_5A15:
    ld   a, [bc]                                  ; $5A15: $0A
    inc  bc                                       ; $5A16: $03
    ld   [hl+], a                                 ; $5A17: $22
    dec  e                                        ; $5A18: $1D
    jr   nz, jr_020_5A15                          ; $5A19: $20 $FA

    ld   a, [$DC90]                               ; $5A1B: $FA $90 $DC
    add  $0A                                      ; $5A1E: $C6 $0A
    ld   [$DC90], a                               ; $5A20: $EA $90 $DC

; Palette loading complete, start building inventory
inventoryDisplayEntryPoint:
    ld   de, wHasFlippers                         ; $5A23: $11 $0C $DB
    ld   bc, $00                                  ; $5A26: $01 $00 $00

inventoryDisplayLoop:
    ; c is the counted
    ld   a, c                                     ; $5A29: $79
    cp   $02                                      ; $5A2A: $FE $02
    jr   nz, .tradeSequenceItemEnd                ; $5A2C: $20 $06

    ; Only executed for Trade Sequence items
    ld   a, [$DB7F]                               ; $5A2E: $FA $7F $DB
    and  a                                        ; $5A31: $A7
    jr   nz, overwriteInventoryDisplaySprite      ; $5A32: $20 $23
.tradeSequenceItemEnd

    ld   a, c                                     ; $5A34: $79
    cp   $04                                      ; $5A35: $FE $04
    jr   nz, jr_020_5A4F                          ; $5A37: $20 $16

    ; Only executed for dungeon keys
    ld   de, wHasTailKey                          ; $5A39: $11 $11 $DB
    ld   a, [wIsIndoor]                           ; $5A3C: $FA $A5 $DB
    and  a                                        ; $5A3F: $A7
    jr   z, jr_020_5A4F                           ; $5A40: $28 $0D

    ldh  a, [hMapId]                              ; $5A42: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5A44: $FE $FF
    jr   z, jr_020_5A4C                           ; $5A46: $28 $04

    cp   $0A                                      ; $5A48: $FE $0A
    jr   nc, jr_020_5A4F                          ; $5A4A: $30 $03

jr_020_5A4C:
    ld   de, wCurrentDungeonItemFlags             ; $5A4C: $11 $CC $DB

jr_020_5A4F:
    ; Load current inventory display item memory
    ld   a, [de]                                  ; $5A4F: $1A
    cp   $FF                                      ; $5A50: $FE $FF
    jr   z, overwriteInventoryDisplaySprite       ; $5A52: $28 $03

    and  a                                        ; $5A54: $A7
    jr   nz, incrementInventoryDisplay            ; $5A55: $20 $1E

overwriteInventoryDisplaySprite:
    ; Push current inventory item to the stack
    push de                                       ; $5A57: $D5

    ld   hl, data_020_59C7                        ; $5A58: $21 $C7 $59
    add  hl, bc                                   ; $5A5B: $09
    ld   e, [hl]                                  ; $5A5C: $5E
    ld   d, $00                                   ; $5A5D: $16 $00
    ld   hl, wRequestDestinationHigh              ; $5A5F: $21 $01 $D6
    add  hl, de                                   ; $5A62: $19

    ; Write $7F over sprite data (won't display)
    ld   a, $7F                                   ; $5A63: $3E $7F
    ld   [hl+], a                                 ; $5A65: $22
    ld   [hl+], a                                 ; $5A66: $22

    ; Only executed for Trade Sequence items
    ld   a, c                                     ; $5A67: $79
    cp   $02                                      ; $5A68: $FE $02
    jr   nz, .tradeSequenceItem2End                ; $5A6A: $20 $08

    ld   de, $05                                  ; $5A6C: $11 $05 $00
    add  hl, de                                   ; $5A6F: $19
    ld   a, $7F                                   ; $5A70: $3E $7F
    ld   [hl+], a                                 ; $5A72: $22
    ld   [hl], a                                  ; $5A73: $77
.tradeSequenceItem2End

    ; Reload inventory item to de
    pop  de                                       ; $5A74: $D1

; Increment inventory memory pointer to display next item
incrementInventoryDisplay:
    inc  de                                       ; $5A75: $13
    inc  c                                        ; $5A76: $0C

    ; Loop until all 8 items are handled
    ld   a, c                                     ; $5A77: $79
    cp   $09                                      ; $5A78: $FE $09
    jr   nz, inventoryDisplayLoop                 ; $5A7A: $20 $AD


    ld   hl, wRequestDestinationHigh              ; $5A7C: $21 $01 $D6
    ld   de, $2C                                  ; $5A7F: $11 $2C $00
    add  hl, de                                   ; $5A82: $19
    ld   a, [wSeashellsCount]                     ; $5A83: $FA $0F $DB
    and  a                                        ; $5A86: $A7
    jr   z, jr_020_5A97                           ; $5A87: $28 $0E

    ; Offset seashell count sprites to reflect seashell count in inventory
    ld   e, a                                     ; $5A89: $5F
    swap a                                        ; $5A8A: $CB $37
    and  $0F                                      ; $5A8C: $E6 $0F
    add  $B0                                      ; $5A8E: $C6 $B0
    ld   [hl+], a                                 ; $5A90: $22
    ld   a, e                                     ; $5A91: $7B
    and  $0F                                      ; $5A92: $E6 $0F
    add  $B0                                      ; $5A94: $C6 $B0
    ld   [hl+], a                                 ; $5A96: $22

jr_020_5A97:
    ld   hl, wRequestDestinationHigh              ; $5A97: $21 $01 $D6
    ld   de, $31                                  ; $5A9A: $11 $31 $00
    add  hl, de                                   ; $5A9D: $19
    ld   a, [wIsIndoor]                           ; $5A9E: $FA $A5 $DB
    and  a                                        ; $5AA1: $A7
    jr   z, jr_020_5AD1                           ; $5AA2: $28 $2D

    ldh  a, [hMapId]                              ; $5AA4: $F0 $F7
    cp   $FF                                      ; $5AA6: $FE $FF
    jr   z, jr_020_5AAE                           ; $5AA8: $28 $04

    cp   $0A                                      ; $5AAA: $FE $0A
    jr   nc, jr_020_5AD1                          ; $5AAC: $30 $23

jr_020_5AAE:
    ld   a, [wSmallKeysCount]                     ; $5AAE: $FA $D0 $DB
    and  a                                        ; $5AB1: $A7
    jr   z, jr_020_5ADE                           ; $5AB2: $28 $2A

    push af                                       ; $5AB4: $F5
    push hl                                       ; $5AB5: $E5
    ld   b, $00                                   ; $5AB6: $06 $00
    ld   a, [$DC90]                               ; $5AB8: $FA $90 $DC
    ld   c, a                                     ; $5ABB: $4F
    ld   hl, $DC91                                ; $5ABC: $21 $91 $DC
    add  hl, bc                                   ; $5ABF: $09
    ld   a, l                                     ; $5AC0: $7D
    sub  $11                                      ; $5AC1: $D6 $11
    ld   l, a                                     ; $5AC3: $6F
    ld   a, h                                     ; $5AC4: $7C
    sbc  $00                                      ; $5AC5: $DE $00
    ld   h, a                                     ; $5AC7: $67
    ld   [hl], $01                                ; $5AC8: $36 $01
    inc  hl                                       ; $5ACA: $23
    ld   [hl], $01                                ; $5ACB: $36 $01
    pop  hl                                       ; $5ACD: $E1
    pop  af                                       ; $5ACE: $F1
    jr   DrawKeyCounter                              ; $5ACF: $18 $0A

jr_020_5AD1:
    ld   a, [wGoldenLeavesCount]                  ; $5AD1: $FA $15 $DB
    and  a                                        ; $5AD4: $A7
    jr   z, jr_020_5ADE                           ; $5AD5: $28 $07

    cp   $06                                      ; $5AD7: $FE $06
    jr   nc, jr_020_5ADE                          ; $5AD9: $30 $03

DrawKeyCounter:
    add  $B0                                      ; $5ADB: $C6 $B0
    ld   [hl], a                                  ; $5ADD: $77

jr_020_5ADE:
    ld   a, $32                                   ; $5ADE: $3E $32
    ld   [wRequests], a                           ; $5AE0: $EA $00 $D6
    ld   a, $03                                   ; $5AE3: $3E $03
    ldh  [hWindowYUnused], a                      ; $5AE5: $E0 $A9
    ld   a, $30                                   ; $5AE7: $3E $30
    ldh  [hWindowXUnused], a                      ; $5AE9: $E0 $AA
    jp   label_020_5D34                           ; $5AEB: $C3 $34 $5D

tradingItemPaletteIndexes:
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
    db $05  ; TRADING_ITEM_MAGNIFIYING_GLASS

InventoryLoad2Handler::
    ldh  a, [hIsGBC]                              ; $5AFD: $F0 $FE
    and  a                                        ; $5AFF: $A7
    jr   z, jr_020_5B3D                           ; $5B00: $28 $3B

    ld   b, $00                                   ; $5B02: $06 $00
    ld   a, [wTradeSequenceItem]                  ; $5B04: $FA $0E $DB
    ld   c, a                                     ; $5B07: $4F
    ld   hl, tradingItemPaletteIndexes           ; $5B08: $21 $EE $5A
    add  hl, bc                                   ; $5B0B: $09
    ld   a, [hl]                                  ; $5B0C: $7E
    ldh  [hScratch0], a                           ; $5B0D: $E0 $D7
    ld   a, $9C                                   ; $5B0F: $3E $9C
    ld   [$DC91], a                               ; $5B11: $EA $91 $DC
    ld   [$DC95], a                               ; $5B14: $EA $95 $DC
    ld   a, $6E                                   ; $5B17: $3E $6E
    ld   [$DC92], a                               ; $5B19: $EA $92 $DC
    ld   a, $8E                                   ; $5B1C: $3E $8E
    ld   [$DC96], a                               ; $5B1E: $EA $96 $DC
    ld   a, $41                                   ; $5B21: $3E $41
    ld   [$DC93], a                               ; $5B23: $EA $93 $DC
    ld   [$DC97], a                               ; $5B26: $EA $97 $DC
    ldh  a, [hScratch0]                           ; $5B29: $F0 $D7
    ld   [$DC94], a                               ; $5B2B: $EA $94 $DC
    ld   [$DC98], a                               ; $5B2E: $EA $98 $DC
    xor  a                                        ; $5B31: $AF
    ld   [$DC99], a                               ; $5B32: $EA $99 $DC
    ld   a, [$DC90]                               ; $5B35: $FA $90 $DC
    add  $08                                      ; $5B38: $C6 $08
    ld   [$DC90], a                               ; $5B3A: $EA $90 $DC

jr_020_5B3D:
    ld   a, $03                                   ; $5B3D: $3E $03
    ldh  [hWindowYUnused], a                      ; $5B3F: $E0 $A9
    ld   a, $30                                   ; $5B41: $3E $30
    ldh  [hWindowXUnused], a                      ; $5B43: $E0 $AA
    call IncrementGameplaySubtype_20                            ; $5B45: $CD $83 $66
    ret                                           ; $5B48: $C9

AdjustInventoryTilesForLevelsAndCounts::
    ldh  a, [hScratch1]                           ; $5B49: $F0 $D8
    cp   INVENTORY_OCARINA                        ; $5B4B: $FE $09
    jr   z, jr_020_5B8B                           ; $5B4D: $28 $3C

    cp   INVENTORY_MAGIC_POWDER                   ; $5B4F: $FE $0C
    jr   z, jr_020_5B80                           ; $5B51: $28 $2D

    dec  a                                        ; $5B53: $3D
    jr   z, jr_020_5B73                           ; $5B54: $28 $1D

    dec  a                                        ; $5B56: $3D
    jr   z, jr_020_5BA5                           ; $5B57: $28 $4C

    dec  a                                        ; $5B59: $3D
    jr   z, jr_020_5B69                           ; $5B5A: $28 $0D

    dec  a                                        ; $5B5C: $3D
    jr   z, jr_020_5B6E                           ; $5B5D: $28 $0F

    dec  a                                        ; $5B5F: $3D
    jr   z, jr_020_5BA0                           ; $5B60: $28 $3E

label_020_5B62:
    ld   a, [de]                                  ; $5B62: $1A
    inc  de                                       ; $5B63: $13
    ld   [hl+], a                                 ; $5B64: $22
    ld   a, [de]                                  ; $5B65: $1A
    inc  de                                       ; $5B66: $13
    ld   [hl+], a                                 ; $5B67: $22
    ret                                           ; $5B68: $C9

jr_020_5B69:
    ld   a, [wPowerBraceletLevel]                 ; $5B69: $FA $43 $DB
    jr   jr_020_5B76                              ; $5B6C: $18 $08

jr_020_5B6E:
    ld   a, [wShieldLevel]                        ; $5B6E: $FA $44 $DB
    jr   jr_020_5B76                              ; $5B71: $18 $03

jr_020_5B73:
    ld   a, [wSwordLevel]                         ; $5B73: $FA $4E $DB

jr_020_5B76:
    add  $B0                                      ; $5B76: $C6 $B0
    ld   c, a                                     ; $5B78: $4F
    ld   a, [de]                                  ; $5B79: $1A
    inc  de                                       ; $5B7A: $13
    ld   [hl+], a                                 ; $5B7B: $22
    ld   a, c                                     ; $5B7C: $79
    inc  de                                       ; $5B7D: $13
    ld   [hl+], a                                 ; $5B7E: $22
    ret                                           ; $5B7F: $C9

jr_020_5B80:
    ld   a, [wHasToadstool]                       ; $5B80: $FA $4B $DB
    and  a                                        ; $5B83: $A7
    jr   nz, label_020_5B62                       ; $5B84: $20 $DC

    ld   a, [wMagicPowderCount]                   ; $5B86: $FA $4C $DB
    jr   func_020_5BA8                            ; $5B89: $18 $1D

jr_020_5B8B:
    ld   a, [wOcarinaSongFlags]                   ; $5B8B: $FA $49 $DB
    and  a                                        ; $5B8E: $A7
    jp   z, label_020_5B62                        ; $5B8F: $CA $62 $5B

    ld   a, [$DB4A]                               ; $5B92: $FA $4A $DB
    inc  a                                        ; $5B95: $3C
    swap a                                        ; $5B96: $CB $37
    call func_020_5BA8                            ; $5B98: $CD $A8 $5B
    dec  hl                                       ; $5B9B: $2B
    ld   [hl], $7F                                ; $5B9C: $36 $7F
    inc  hl                                       ; $5B9E: $23
    ret                                           ; $5B9F: $C9

jr_020_5BA0:
    ld   a, [wArrowCount]                         ; $5BA0: $FA $45 $DB
    jr   func_020_5BA8                            ; $5BA3: $18 $03

jr_020_5BA5:
    ld   a, [wBombCount]                          ; $5BA5: $FA $4D $DB

func_020_5BA8::
    push af                                       ; $5BA8: $F5
    and  $0F                                      ; $5BA9: $E6 $0F
    add  $B0                                      ; $5BAB: $C6 $B0
    ld   c, a                                     ; $5BAD: $4F
    pop  af                                       ; $5BAE: $F1
    swap a                                        ; $5BAF: $CB $37
    and  $0F                                      ; $5BB1: $E6 $0F
    add  $B0                                      ; $5BB3: $C6 $B0
    ld   [hl+], a                                 ; $5BB5: $22
    ld   a, c                                     ; $5BB6: $79
    ld   [hl+], a                                 ; $5BB7: $22
    ret                                           ; $5BB8: $C9

; Configure request for loading inventory plette
func_020_5BB9::
    push bc                                       ; $5BB9: $C5
    ld   a, [$DC90]                               ; $5BBA: $FA $90 $DC
    ld   e, a                                     ; $5BBD: $5F
    ld   d, $00                                   ; $5BBE: $16 $00
    ld   hl, $DC91                                ; $5BC0: $21 $91 $DC
    add  hl, de                                   ; $5BC3: $19
    add  $05                                      ; $5BC4: $C6 $05
    ld   [$DC90], a                               ; $5BC6: $EA $90 $DC
    push hl                                       ; $5BC9: $E5
    sla  c                                        ; $5BCA: $CB $21
    ld   hl, InventoryTileMapPositions            ; $5BCC: $21 $84 $5C
    add  hl, bc                                   ; $5BCF: $09
    push hl                                       ; $5BD0: $E5
    pop  de                                       ; $5BD1: $D1
    pop  hl                                       ; $5BD2: $E1
    ld   a, [de]                                  ; $5BD3: $1A
    inc  de                                       ; $5BD4: $13
    ld   [hl+], a                                 ; $5BD5: $22
    ld   a, [de]                                  ; $5BD6: $1A
    ld   [hl+], a                                 ; $5BD7: $22
    ld   a, $81                                   ; $5BD8: $3E $81
    ld   [hl+], a                                 ; $5BDA: $22
    push hl                                       ; $5BDB: $E5
    ldh  a, [hScratch1]                           ; $5BDC: $F0 $D8
    sla  a                                        ; $5BDE: $CB $27
    ld   c, a                                     ; $5BE0: $4F
    ld   hl, InventoryItemPaletteIndexes          ; $5BE1: $21 $14 $5C
    add  hl, bc                                   ; $5BE4: $09
    push hl                                       ; $5BE5: $E5
    pop  de                                       ; $5BE6: $D1
    pop  hl                                       ; $5BE7: $E1
    cp   $06                                      ; $5BE8: $FE $06
    jr   nz, jr_020_5BF9                          ; $5BEA: $20 $0D

    ld   a, [wPowerBraceletLevel]                 ; $5BEC: $FA $43 $DB
    cp   $02                                      ; $5BEF: $FE $02
    jr   nz, jr_020_5BF9                          ; $5BF1: $20 $06

    ld   a, $02                                   ; $5BF3: $3E $02
    ld   [hl+], a                                 ; $5BF5: $22
    ld   [hl+], a                                 ; $5BF6: $22
    jr   jr_020_5C10                              ; $5BF7: $18 $17

jr_020_5BF9:
    cp   $18                                      ; $5BF9: $FE $18
    jr   nz, jr_020_5C0B                          ; $5BFB: $20 $0E

    ld   a, [wHasToadstool]                       ; $5BFD: $FA $4B $DB
    and  a                                        ; $5C00: $A7
    jr   z, jr_020_5C0B                           ; $5C01: $28 $08

    ld   a, $02                                   ; $5C03: $3E $02
    ld   [hl+], a                                 ; $5C05: $22
    ld   a, $03                                   ; $5C06: $3E $03
    ld   [hl+], a                                 ; $5C08: $22
    jr   jr_020_5C10                              ; $5C09: $18 $05

jr_020_5C0B:
    ld   a, [de]                                  ; $5C0B: $1A
    inc  de                                       ; $5C0C: $13
    ld   [hl+], a                                 ; $5C0D: $22
    ld   a, [de]                                  ; $5C0E: $1A
    ld   [hl+], a                                 ; $5C0F: $22

jr_020_5C10:
    xor  a                                        ; $5C10: $AF
    ld   [hl], a                                  ; $5C11: $77
    pop  bc                                       ; $5C12: $C1
    ret                                           ; $5C13: $C9

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

; Draw a and B button slot in the inventory bar
func_020_5C9C::
    push de                                       ; $5C9C: $D5
    push bc                                       ; $5C9D: $C5
    ld   hl, wBButtonSlot                         ; $5C9E: $21 $00 $DB
    add  hl, bc                                   ; $5CA1: $09
    ld   a, [hl]                                  ; $5CA2: $7E
    ldh  [hScratch1], a                           ; $5CA3: $E0 $D8
    sla  a                                        ; $5CA5: $CB $27
    ld   e, a                                     ; $5CA7: $5F
    sla  a                                        ; $5CA8: $CB $27
    add  e                                        ; $5CAA: $83
    ldh  [hScratch0], a                           ; $5CAB: $E0 $D7
    ldh  a, [hIsGBC]                              ; $5CAD: $F0 $FE
    and  a                                        ; $5CAF: $A7
    jr   z, jr_020_5CB5                           ; $5CB0: $28 $03

    call func_020_5BB9                            ; $5CB2: $CD $B9 $5B

jr_020_5CB5:
    ; de = [wRequests]
    ld   a, [wRequests]                           ; $5CB5: $FA $00 $D6
    ld   e, a                                     ; $5CB8: $5F
    ld   d, $00                                   ; $5CB9: $16 $00

    ; hl = request start address
    ld   hl, wRequestDestinationHigh              ; $5CBB: $21 $01 $D6
    add  hl, de                                   ; $5CBE: $19

    ; Increment the request start by 0C
    add  $0C                                      ; $5CBF: $C6 $0C
    ld   [wRequests], a                           ; $5CC1: $EA $00 $D6
    push hl                                       ; $5CC4: $E5

    ; de = InventoryTileMapPositions + c * 2
    sla  c                                        ; $5CC5: $CB $21
    ld   hl, InventoryTileMapPositions            ; $5CC7: $21 $84 $5C
    add  hl, bc                                   ; $5CCA: $09
    push hl                                       ; $5CCB: $E5
    pop  de                                       ; $5CCC: $D1
    pop  hl                                       ; $5CCD: $E1

    ; Copy request destination (2 bytes)
    ld   a, [de]                                  ; $5CCE: $1A
    inc  de                                       ; $5CCF: $13
    ld   [hl+], a                                 ; $5CD0: $22
    ld   a, [de]                                  ; $5CD1: $1A
    inc  de                                       ; $5CD2: $13
    ld   [hl+], a                                 ; $5CD3: $22

    ; Copy request length
    ld   a, $02                                   ; $5CD4: $3E $02
    ld   [hl+], a                                 ; $5CD6: $22

    push hl                                       ; $5CD7: $E5
    ldh  a, [hScratch0]                           ; $5CD8: $F0 $D7
    ld   c, a                                     ; $5CDA: $4F

    ; de = InventoryItemTiles + [hScratch0]
    ld   hl, InventoryItemTiles                   ; $5CDB: $21 $30 $5C
    add  hl, bc                                   ; $5CDE: $09
    push hl                                       ; $5CDF: $E5
    pop  de                                       ; $5CE0: $D1
    pop  hl                                       ; $5CE1: $E1

    ; Append 3 data bytes to the request
    ld   a, [de]                                  ; $5CE2: $1A
    inc  de                                       ; $5CE3: $13
    ld   [hl+], a                                 ; $5CE4: $22
    ld   a, [de]                                  ; $5CE5: $1A
    inc  de                                       ; $5CE6: $13
    ld   [hl+], a                                 ; $5CE7: $22
    ld   a, [de]                                  ; $5CE8: $1A
    inc  de                                       ; $5CE9: $13
    ld   [hl+], a                                 ; $5CEA: $22

    ; hl = bc
    pop  bc                                       ; $5CEB: $C1
    push bc                                       ; $5CEC: $C5
    push hl                                       ; $5CED: $E5
    sla  c                                        ; $5CEE: $CB $21

    ld   hl, InventoryTileMapPositions            ; $5CF0: $21 $84 $5C
    add  hl, bc                                   ; $5CF3: $09
    push hl                                       ; $5CF4: $E5
    pop  de                                       ; $5CF5: $D1
    pop  hl                                       ; $5CF6: $E1
    inc  de                                       ; $5CF7: $13
    inc  hl                                       ; $5CF8: $23
    ld   a, [de]                                  ; $5CF9: $1A
    add  $20                                      ; $5CFA: $C6 $20
    ld   [hl], a                                  ; $5CFC: $77
    dec  de                                       ; $5CFD: $1B
    dec  hl                                       ; $5CFE: $2B
    ld   a, [de]                                  ; $5CFF: $1A
    inc  de                                       ; $5D00: $13
    inc  de                                       ; $5D01: $13
    adc  $00                                      ; $5D02: $CE $00
    ld   [hl+], a                                 ; $5D04: $22
    inc  hl                                       ; $5D05: $23
    ld   a, $02                                   ; $5D06: $3E $02
    ld   [hl+], a                                 ; $5D08: $22
    push hl                                       ; $5D09: $E5
    ldh  a, [hScratch0]                           ; $5D0A: $F0 $D7
    ld   c, a                                     ; $5D0C: $4F
    ld   hl, InventoryItemTiles + 3               ; $5D0D: $21 $33 $5C
    add  hl, bc                                   ; $5D10: $09
    push hl                                       ; $5D11: $E5
    pop  de                                       ; $5D12: $D1
    pop  hl                                       ; $5D13: $E1
    ld   a, [de]                                  ; $5D14: $1A
    inc  de                                       ; $5D15: $13
    ld   [hl+], a                                 ; $5D16: $22

    call AdjustInventoryTilesForLevelsAndCounts                            ; $5D17: $CD $49 $5B

    xor  a                                        ; $5D1A: $AF
    ld   [hl], a                                  ; $5D1B: $77
    pop  bc                                       ; $5D1C: $C1
    pop  de                                       ; $5D1D: $D1
    dec  c                                        ; $5D1E: $0D
    ld   a, c                                     ; $5D1F: $79
    cp   e                                        ; $5D20: $BB
    jp   nz, func_020_5C9C                        ; $5D21: $C2 $9C $5C

    ret                                           ; $5D24: $C9

InventoryLoad3Handler::
    ld   a, [$C154]                               ; $5D25: $FA $54 $C1
    ld   c, a                                     ; $5D28: $4F
    ld   b, $00                                   ; $5D29: $06 $00
    ld   e, $FF                                   ; $5D2B: $1E $FF
    call func_020_5C9C                            ; $5D2D: $CD $9C $5C
    xor  a                                        ; $5D30: $AF
    ld   [$C154], a                               ; $5D31: $EA $54 $C1

label_020_5D34:
    call IncrementGameplaySubtype_20                            ; $5D34: $CD $83 $66
    call LCDOff                                   ; $5D37: $CD $CF $28
    ld   a, $20                                   ; $5D3A: $3E $20
    call func_AB5                                 ; $5D3C: $CD $B5 $0A
    xor  a                                        ; $5D3F: $AF
    ld   [wRequests], a                           ; $5D40: $EA $00 $D6
    ld   [wRequestDestinationHigh], a             ; $5D43: $EA $01 $D6
    ld   [$DC90], a                               ; $5D46: $EA $90 $DC
    ld   [$DC91], a                               ; $5D49: $EA $91 $DC
    ld   a, [wLCDControl]                         ; $5D4C: $FA $FD $D6
    ldh  [rLCDC], a                               ; $5D4F: $E0 $40
    ret                                           ; $5D51: $C9

InventoryLoad4Handler::
    call LCDOff                                   ; $5D52: $CD $CF $28
    call LoadColorDungeonTiles                    ; $5D55: $CD $D1 $3F
    ld   a, [wLCDControl]                         ; $5D58: $FA $FD $D6
    ldh  [rLCDC], a                               ; $5D5B: $E0 $40
    call IncrementGameplaySubtype_20                            ; $5D5D: $CD $83 $66
    ret                                           ; $5D60: $C9

InventoryPalettes::
    ; 8 + 8 palettes used for the inventory subscreen
    ;       0      1      2      3
    dw   $57FF, $26C4, $1521, $0000
    dw   $57FF, $5231, $28C5, $0000
    dw   $57FF, $2C7F, $140E, $0000
    dw   $57FF, $11D9, $10CE, $0000
    dw   $57FF, $7EAE, $7C00, $0000
    dw   $57FF, $7FFF, $0642, $0000
    dw   $57FF, $12BB, $0151, $0000
    dw   $57FF, $2B02, $0A00, $0000
    dw   $57FF, $0000, $22A2, $4EFF
    dw   $7C00, $0000, $05FF, $4EFF
    dw   $7C00, $0000, $7E03, $4EFF
    dw   $7C00, $0000, $5231, $7FFF
    dw   $7C00, $1ADF, $187D, $0000
    dw   $7C00, $0000, $22A2, $7FFF
    dw   $7C00, $0000, $001F, $7FFF
    dw   $7C00, $0000, $7C00, $7FFF

InventoryTradingItemPalettes::
    ; Replaces the second and third color in the fifth BG palette line
    ; Used for trading sequence items
    ;       2      3
    dw   $7FFF, $0642
    dw   $0FBE, $0213
    dw   $0F7F, $09E0
    dw   $32DF, $187D
    dw   $7FFF, $083D
    dw   $7EAE, $7C00
    dw   $7FFF, $5231

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
    db  $06  ; TRADING_ITEM_MAGNIFIYING_GLASS

InventoryLoad5Handler::
    xor  a                                        ; $5E1A: $AF
    ld   [wWindowY], a                            ; $5E1B: $EA $9A $DB
    ld   a, $01                                   ; $5E1E: $3E $01
    ld   [wPaletteUnknownE], a                    ; $5E20: $EA $D5 $DD
    ldh  a, [hIsGBC]                              ; $5E23: $F0 $FE
    and  a                                        ; $5E25: $A7
    jr   z, jr_020_5E6D                           ; $5E26: $28 $45

    ld   bc, InventoryPalettes                        ; $5E28: $01 $61 $5D
    ld   hl, $DC10                                ; $5E2B: $21 $10 $DC
    di                                            ; $5E2E: $F3
    ld   a, $02                                   ; $5E2F: $3E $02
    ldh  [rSVBK], a                               ; $5E31: $E0 $70

.loop
    ld   a, [bc]                                  ; $5E33: $0A
    ld   [hl+], a                                 ; $5E34: $22
    inc  bc                                       ; $5E35: $03
    ld   a, l                                     ; $5E36: $7D
    cp   $90                                      ; $5E37: $FE $90
    jr   nz, .loop                                ; $5E39: $20 $F8

    xor  a                                        ; $5E3B: $AF
    ldh  [rSVBK], a                               ; $5E3C: $E0 $70
    ei                                            ; $5E3E: $FB
    ld   hl, InventoryTradingItemPaletteIndex                        ; $5E3F: $21 $0B $5E
    ld   a, [wTradeSequenceItem]                  ; $5E42: $FA $0E $DB
    ld   e, a                                     ; $5E45: $5F
    ld   d, $00                                   ; $5E46: $16 $00
    add  hl, de                                   ; $5E48: $19
    ld   a, [hl]                                  ; $5E49: $7E
    and  a                                        ; $5E4A: $A7
    jr   z, jr_020_5E6D                           ; $5E4B: $28 $20

    sla  a                                        ; $5E4D: $CB $27
    ld   e, a                                     ; $5E4F: $5F
    ld   hl, InventoryTradingItemPaletteTable - 2                    ; $5E50: $21 $FB $5D
    add  hl, de                                   ; $5E53: $19
    ld   a, [hl+]                                 ; $5E54: $2A
    ld   h, [hl]                                  ; $5E55: $66
    ld   l, a                                     ; $5E56: $6F
    ld   de, $DC3A                                ; $5E57: $11 $3A $DC
    ld   c, $04                                   ; $5E5A: $0E $04
    di                                            ; $5E5C: $F3
    ld   a, $02                                   ; $5E5D: $3E $02
    ldh  [rSVBK], a                               ; $5E5F: $E0 $70

jr_020_5E61:
    ld   a, [hl+]                                 ; $5E61: $2A
    ld   [de], a                                  ; $5E62: $12
    inc  de                                       ; $5E63: $13
    dec  c                                        ; $5E64: $0D
    ld   a, c                                     ; $5E65: $79
    and  a                                        ; $5E66: $A7
    jr   nz, jr_020_5E61                          ; $5E67: $20 $F8

    xor  a                                        ; $5E69: $AF
    ldh  [rSVBK], a                               ; $5E6A: $E0 $70
    ei                                            ; $5E6C: $FB

jr_020_5E6D:
    xor  a                                        ; $5E6D: $AF
    ld   [wTransitionSequenceCounter], a          ; $5E6E: $EA $6B $C1
    call IncrementGameplaySubtype_20                            ; $5E71: $CD $83 $66
    ret                                           ; $5E74: $C9

InventoryInstrumentCyclingColors::
    ; Palette colors for the color-cycling the instruments use on the subscreen.
    dw  $2680, $1100
    dw  $3A20, $18E0
    dw  $51A0, $20C0
    dw  $7D08, $3484
    dw  $7CAD, $3046
    dw  $5C50, $2827
    dw  $4012, $1C08
    dw  $3015, $1409
    dw  $1417, $0009
    dw  $04D7, $046A
    dw  $0537, $048A
    dw  $0997, $04AA
    dw  $09F5, $04C9
    dw  $0A10, $04E7
    dw  $064B, $0505
    dw  $02A0, $0120

func_020_5EB5::
    ldh  a, [hIsGBC]                              ; $5EB5: $F0 $FE
    and  a                                        ; $5EB7: $A7
    jr   z, jr_020_5EEE                           ; $5EB8: $28 $34

    ld   a, [$DE07]                               ; $5EBA: $FA $07 $DE
    ld   c, a                                     ; $5EBD: $4F
    ld   a, [$DE06]                               ; $5EBE: $FA $06 $DE
    inc  a                                        ; $5EC1: $3C
    ld   [$DE06], a                               ; $5EC2: $EA $06 $DE
    cp   $08                                      ; $5EC5: $FE $08
    jr   c, jr_020_5ED6                           ; $5EC7: $38 $0D

    xor  a                                        ; $5EC9: $AF
    ld   [$DE06], a                               ; $5ECA: $EA $06 $DE
    ld   a, c                                     ; $5ECD: $79
    add  $04                                      ; $5ECE: $C6 $04
    and  $3C                                      ; $5ED0: $E6 $3C
    ld   [$DE07], a                               ; $5ED2: $EA $07 $DE
    ld   c, a                                     ; $5ED5: $4F

jr_020_5ED6:
    ld   b, $00                                   ; $5ED6: $06 $00
    ld   hl, InventoryInstrumentCyclingColors                        ; $5ED8: $21 $75 $5E
    add  hl, bc                                   ; $5EDB: $09
    ld   bc, $DC4A                                ; $5EDC: $01 $4A $DC
    ld   e, $04                                   ; $5EDF: $1E $04

jr_020_5EE1:
    ld   a, [hl+]                                 ; $5EE1: $2A
    ld   [bc], a                                  ; $5EE2: $02
    inc  bc                                       ; $5EE3: $03
    dec  e                                        ; $5EE4: $1D
    ld   a, e                                     ; $5EE5: $7B
    and  a                                        ; $5EE6: $A7
    jr   nz, jr_020_5EE1                          ; $5EE7: $20 $F8

    ld   a, $01                                   ; $5EE9: $3E $01
    ld   [wPaletteDataFlags], a                   ; $5EEB: $EA $D1 $DD

jr_020_5EEE:
    ret                                           ; $5EEE: $C9

InventoryFadeInHandler::
    call func_020_635C                            ; $5EEF: $CD $5C $63
    call func_1A39                                ; $5EF2: $CD $39 $1A

    ld   a, [wTransitionSequenceCounter]          ; $5EF5: $FA $6B $C1
    cp   $04                                      ; $5EF8: $FE $04
    jr   nz, .jr_020_5EFF                         ; $5EFA: $20 $03
    call IncrementGameplaySubtype_20                            ; $5EFC: $CD $83 $66
.jr_020_5EFF

    ret                                           ; $5EFF: $C9

Data_020_5F00::
    db   $00, $01, $FF

Data_020_5F03::
    db   $00, $FE, $02

func_020_5F06::
    ld   a, [$DBA3]                               ; $5F06: $FA $A3 $DB
    ld   [$C1B6], a                               ; $5F09: $EA $B6 $C1
    ld   a, [$C1B8]                               ; $5F0C: $FA $B8 $C1
    ld   hl, $C1B9                                ; $5F0F: $21 $B9 $C1
    or   [hl]                                     ; $5F12: $B6
    jr   nz, jr_020_5F59                          ; $5F13: $20 $44

    ld   a, [$C1B5]                               ; $5F15: $FA $B5 $C1
    and  a                                        ; $5F18: $A7
    jr   nz, jr_020_5F38                          ; $5F19: $20 $1D

    ldh  a, [hJoypadState]                        ; $5F1B: $F0 $CC
    and  J_LEFT | J_RIGHT                         ; $5F1D: $E6 $03
    ld   e, a                                     ; $5F1F: $5F
    ld   d, $00                                   ; $5F20: $16 $00
    ld   hl, Data_020_5F00                        ; $5F22: $21 $00 $5F
    add  hl, de                                   ; $5F25: $19
    ld   a, [$DBA3]                               ; $5F26: $FA $A3 $DB
    add  [hl]                                     ; $5F29: $86
    cp   $0A                                      ; $5F2A: $FE $0A
    jr   c, jr_020_5F35                           ; $5F2C: $38 $07

    rla                                           ; $5F2E: $17
    ld   a, $00                                   ; $5F2F: $3E $00
    jr   nc, jr_020_5F35                          ; $5F31: $30 $02

    ld   a, $09                                   ; $5F33: $3E $09

jr_020_5F35:
    ld   [$DBA3], a                               ; $5F35: $EA $A3 $DB

jr_020_5F38:
    ldh  a, [hJoypadState]                        ; $5F38: $F0 $CC
    srl  a                                        ; $5F3A: $CB $3F
    srl  a                                        ; $5F3C: $CB $3F
    and  (J_UP | J_DOWN) >> 2                     ; ...probably
    ld   e, a                                     ; $5F40: $5F
    ld   d, $00                                   ; $5F41: $16 $00
    ld   hl, Data_020_5F03                        ; $5F43: $21 $03 $5F
    add  hl, de                                   ; $5F46: $19
    ld   a, [$DBA3]                               ; $5F47: $FA $A3 $DB
    add  [hl]                                     ; $5F4A: $86
    cp   $0A                                      ; $5F4B: $FE $0A
    jr   c, jr_020_5F56                           ; $5F4D: $38 $07

    rla                                           ; $5F4F: $17
    ld   a, $00                                   ; $5F50: $3E $00
    jr   nc, jr_020_5F56                          ; $5F52: $30 $02

    ld   a, $09                                   ; $5F54: $3E $09

jr_020_5F56:
    ld   [$DBA3], a                               ; $5F56: $EA $A3 $DB

jr_020_5F59:
    ldh  a, [hPressedButtonsMask]                 ; $5F59: $F0 $CB
    and  J_UP | J_DOWN | J_LEFT | J_RIGHT         ; $5F5B: $E6 $0F
    jr   z, jr_020_5F69                           ; $5F5D: $28 $0A

    ld   a, [$C1B5]                               ; $5F5F: $FA $B5 $C1
    and  a                                        ; $5F62: $A7
    jr   nz, jr_020_5F69                          ; $5F63: $20 $04

    xor  a                                        ; $5F65: $AF
    ld   [wInventoryCursorFrameCounter], a        ; $5F66: $EA $59 $C1

jr_020_5F69:
    ld   a, [$C1B5]                               ; $5F69: $FA $B5 $C1
    and  a                                        ; $5F6C: $A7
    jr   z, jr_020_5F85                           ; $5F6D: $28 $16

    ld   a, [$C1B8]                               ; $5F6F: $FA $B8 $C1
    ld   hl, $C1B9                                ; $5F72: $21 $B9 $C1
    or   [hl]                                     ; $5F75: $B6
    jr   nz, jr_020_5F85                          ; $5F76: $20 $0D

    ldh  a, [hJoypadState]                        ; $5F78: $F0 $CC
    and  J_START                                  ; $5F7A: $E6 $80
    jr   z, jr_020_5F85                           ; $5F7C: $28 $07

    ld   a, $01                                   ; $5F7E: $3E $01
    ld   [$C1BA], a                               ; $5F80: $EA $BA $C1
    jr   jr_020_5FB2                              ; $5F83: $18 $2D

jr_020_5F85:
    ld   a, [$DBA3]                               ; $5F85: $FA $A3 $DB
    ld   hl, $C1B6                                ; $5F88: $21 $B6 $C1
    cp   [hl]                                     ; $5F8B: $BE
    jr   z, jr_020_5FC1                           ; $5F8C: $28 $33

    ld   hl, hJingle                              ; $5F8E: $21 $F2 $FF
    ld   [hl], JINGLE_MOVE_SELECTION              ; $5F91: $36 $0A
    ld   e, a                                     ; $5F93: $5F
    ld   d, $00                                   ; $5F94: $16 $00
    ld   hl, wInventoryItem1                      ; $5F96: $21 $02 $DB
    add  hl, de                                   ; $5F99: $19
    ld   a, [hl]                                  ; $5F9A: $7E
    cp   $09                                      ; $5F9B: $FE $09
    jr   nz, jr_020_5FB2                          ; $5F9D: $20 $13

    ld   a, [wOcarinaSongFlags]                   ; $5F9F: $FA $49 $DB
    and  a                                        ; $5FA2: $A7
    jr   z, jr_020_5FB2                           ; $5FA3: $28 $0D

    ld   a, $08                                   ; $5FA5: $3E $08
    ldh  [hNeedsUpdatingBGTiles], a               ; $5FA7: $E0 $90
    ld   a, $10                                   ; $5FA9: $3E $10
    ld   [$C1B8], a                               ; $5FAB: $EA $B8 $C1
    ld   a, $01                                   ; $5FAE: $3E $01
    jr   jr_020_5FBE                              ; $5FB0: $18 $0C

jr_020_5FB2:
    ld   a, [$C1B5]                               ; $5FB2: $FA $B5 $C1
    and  a                                        ; $5FB5: $A7
    jr   z, jr_020_5FC1                           ; $5FB6: $28 $09

    ld   a, $10                                   ; $5FB8: $3E $10
    ld   [$C1B9], a                               ; $5FBA: $EA $B9 $C1
    xor  a                                        ; $5FBD: $AF

jr_020_5FBE:
    ld   [$C1B5], a                               ; $5FBE: $EA $B5 $C1

jr_020_5FC1:
    ld   hl, $C1B9                                ; $5FC1: $21 $B9 $C1
    ld   a, [$C1B8]                               ; $5FC4: $FA $B8 $C1
    or   [hl]                                     ; $5FC7: $B6
    jp   nz, jr_020_604A                          ; $5FC8: $C2 $4A $60

    ldh  a, [hJoypadState]                        ; $5FCB: $F0 $CC
    and  J_A                                      ; $5FCD: $E6 $10
    jr   z, jr_020_5FED                           ; $5FCF: $28 $1C

    ld   a, [wAButtonSlot]                        ; $5FD1: $FA $01 $DB
    push af                                       ; $5FD4: $F5
    ld   hl, wInventoryItem1                      ; $5FD5: $21 $02 $DB
    ld   a, [$DBA3]                               ; $5FD8: $FA $A3 $DB

label_020_5FDB:
    ld   c, a                                     ; $5FDB: $4F
    ld   b, $00                                   ; $5FDC: $06 $00
    add  hl, bc                                   ; $5FDE: $09
    ld   a, [hl]                                  ; $5FDF: $7E
    ld   [wAButtonSlot], a                        ; $5FE0: $EA $01 $DB
    pop  af                                       ; $5FE3: $F1
    ld   [hl], a                                  ; $5FE4: $77
    ld   c, $01                                   ; $5FE5: $0E $01
    ld   b, $00                                   ; $5FE7: $06 $00
    ld   e, $00                                   ; $5FE9: $1E $00
    jr   @+$22                                    ; $5FEB: $18 $20

jr_020_5FED:
    ldh  a, [hJoypadState]                        ; $5FED: $F0 $CC
    and  J_B                                      ; $5FEF: $E6 $20
    jr   z, jr_020_604A                           ; $5FF1: $28 $57

    ld   a, [wBButtonSlot]                        ; $5FF3: $FA $00 $DB
    push af                                       ; $5FF6: $F5
    ld   hl, wInventoryItem1                      ; $5FF7: $21 $02 $DB
    ld   a, [$DBA3]                               ; $5FFA: $FA $A3 $DB
    ld   c, a                                     ; $5FFD: $4F
    ld   b, $00                                   ; $5FFE: $06 $00
    add  hl, bc                                   ; $6000: $09
    ld   a, [hl]                                  ; $6001: $7E
    ld   [wBButtonSlot], a                        ; $6002: $EA $00 $DB
    pop  af                                       ; $6005: $F1
    ld   [hl], a                                  ; $6006: $77
    ld   c, $00                                   ; $6007: $0E $00
    ld   b, $00                                   ; $6009: $06 $00
    ld   e, $FF                                   ; $600B: $1E $FF

jr_020_600D:
    cp   $09                                      ; $600D: $FE $09
    jr   nz, jr_020_6027                          ; $600F: $20 $16

    ld   a, [wOcarinaSongFlags]                  ; $6011: $FA $49 $DB
    and  a                                        ; $6014: $A7
    jr   z, jr_020_6027                           ; $6015: $28 $10

    ld   a, $08                                   ; $6017: $3E $08
    ldh  [hNeedsUpdatingBGTiles], a               ; $6019: $E0 $90
    ld   a, $10                                   ; $601B: $3E $10
    ld   [$C1B8], a                               ; $601D: $EA $B8 $C1
    ld   a, $01                                   ; $6020: $3E $01
    ld   [$C1B5], a                               ; $6022: $EA $B5 $C1
    jr   jr_020_6036                              ; $6025: $18 $0F

jr_020_6027:
    ld   a, [$C1B5]                               ; $6027: $FA $B5 $C1
    and  a                                        ; $602A: $A7
    jr   z, jr_020_6036                           ; $602B: $28 $09

    xor  a                                        ; $602D: $AF
    ld   [$C1B5], a                               ; $602E: $EA $B5 $C1
    ld   a, $10                                   ; $6031: $3E $10
    ld   [$C1B9], a                               ; $6033: $EA $B9 $C1

jr_020_6036:
    call func_020_5C9C                            ; $6036: $CD $9C $5C

func_020_6039:
    ld   a, JINGLE_VALIDATE                       ; $6039: $3E $13
    ldh  [hJingle], a                             ; $603B: $E0 $F2
    ld   a, [$DBA3]                               ; $603D: $FA $A3 $DB
    add  $02                                      ; $6040: $C6 $02
    ld   c, a                                     ; $6042: $4F
    ld   b, $00                                   ; $6043: $06 $00
    dec  a                                        ; $6045: $3D
    ld   e, a                                     ; $6046: $5F
    call func_020_5C9C                            ; $6047: $CD $9C $5C

jr_020_604A:
    ret                                           ; $604A: $C9

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
    ld   a, [$C1B9]
    and  a                                        ; $6114: $A7
    jr   z, jr_020_6131                           ; $6115: $28 $1A

    dec  a                                        ; $6117: $3D
    ld   [$C1B9], a                               ; $6118: $EA $B9 $C1
    jr   nz, jr_020_612E                          ; $611B: $20 $11

    ld   hl, hNeedsUpdatingBGTiles                ; $611D: $21 $90 $FF
    ld   [hl], $0B                                ; $6120: $36 $0B
    ld   a, [$C1BA]                               ; $6122: $FA $BA $C1
    and  a                                        ; $6125: $A7
    jr   z, jr_020_612D                           ; $6126: $28 $05

    ld   a, $0C                                   ; $6128: $3E $0C
    ld   [wGameplaySubtype], a                    ; $612A: $EA $96 $DB

jr_020_612D:
    ret                                           ; $612D: $C9

jr_020_612E:
    cpl                                           ; $612E: $2F
    jr   jr_020_613B                              ; $612F: $18 $0A

jr_020_6131:
    ld   a, [$C1B8]                               ; $6131: $FA $B8 $C1
    and  a                                        ; $6134: $A7
    jr   z, jr_020_6141                           ; $6135: $28 $0A

    dec  a                                        ; $6137: $3D
    ld   [$C1B8], a                               ; $6138: $EA $B8 $C1

jr_020_613B:
    rra                                           ; $613B: $1F
    rra                                           ; $613C: $1F
    and  $03                                      ; $613D: $E6 $03
    jr   jr_020_614A                              ; $613F: $18 $09

jr_020_6141:
    ld   a, [$C1B5]                               ; $6141: $FA $B5 $C1
    and  a                                        ; $6144: $A7
    jp   z, jr_020_6214                           ; $6145: $CA $14 $62

    ld   a, $00                                   ; $6148: $3E $00

jr_020_614A:
    ld   [$C1B7], a                               ; $614A: $EA $B7 $C1
    ld   a, [$C1B7]                               ; $614D: $FA $B7 $C1
    ld   d, $00                                   ; $6150: $16 $00
    sla  a                                        ; $6152: $CB $27
    sla  a                                        ; $6154: $CB $27
    sla  a                                        ; $6156: $CB $27
    sla  a                                        ; $6158: $CB $27
    ld   e, a                                     ; $615A: $5F
    sla  a                                        ; $615B: $CB $27
    add  e                                        ; $615D: $83
    ld   e, a                                     ; $615E: $5F
    ld   hl, Data_020_604B                        ; $615F: $21 $4B $60
    add  hl, de                                   ; $6162: $19
    ld   de, $C018                                ; $6163: $11 $18 $C0
    ld   c, $0C                                   ; $6166: $0E $0C
    ld   b, $04                                   ; $6168: $06 $04

jr_020_616A:
    ld   a, [hl+]                                 ; $616A: $2A
    add  $30                                      ; $616B: $C6 $30
    ld   [de], a                                  ; $616D: $12
    inc  de                                       ; $616E: $13
    ld   a, [hl+]                                 ; $616F: $2A
    add  $60                                      ; $6170: $C6 $60
    ld   [de], a                                  ; $6172: $12
    inc  de                                       ; $6173: $13
    ld   a, [hl+]                                 ; $6174: $2A
    ld   [de], a                                  ; $6175: $12
    inc  de                                       ; $6176: $13
    cp   $22                                      ; $6177: $FE $22
    jr   z, jr_020_6185                           ; $6179: $28 $0A

    cp   $24                                      ; $617B: $FE $24
    jr   z, jr_020_6189                           ; $617D: $28 $0A

    cp   $26                                      ; $617F: $FE $26
    jr   z, jr_020_618D                           ; $6181: $28 $0A

    jr   jr_020_619A                              ; $6183: $18 $15

jr_020_6185:
    ld   b, $04                                   ; $6185: $06 $04
    jr   jr_020_618F                              ; $6187: $18 $06

jr_020_6189:
    ld   b, $02                                   ; $6189: $06 $02
    jr   jr_020_618F                              ; $618B: $18 $02

jr_020_618D:
    ld   b, $01                                   ; $618D: $06 $01

jr_020_618F:
    ld   a, [wOcarinaSongFlags]                   ; $618F: $FA $49 $DB
    and  b                                        ; $6192: $A0
    jr   nz, jr_020_619A                          ; $6193: $20 $05

    dec  de                                       ; $6195: $1B
    ld   a, $20                                   ; $6196: $3E $20
    ld   [de], a                                  ; $6198: $12
    inc  de                                       ; $6199: $13

jr_020_619A:
    ld   a, [hl+]                                 ; $619A: $2A
    ld   [de], a                                  ; $619B: $12
    inc  de                                       ; $619C: $13
    dec  c                                        ; $619D: $0D
    jr   nz, jr_020_616A                          ; $619E: $20 $CA

    ld   a, [$C1B7]                               ; $61A0: $FA $B7 $C1
    cp   $00                                      ; $61A3: $FE $00
    jr   nz, jr_020_6214                          ; $61A5: $20 $6D

    ldh  a, [hJoypadState]                        ; $61A7: $F0 $CC
    and  $01                                      ; $61A9: $E6 $01
    jr   z, jr_020_61C5                           ; $61AB: $28 $18

jr_020_61AD:
    ld   hl, $DB4A                                ; $61AD: $21 $4A $DB
    ld   a, [hl]                                  ; $61B0: $7E
    inc  a                                        ; $61B1: $3C
    cp   $03                                      ; $61B2: $FE $03
    jr   nz, jr_020_61B7                          ; $61B4: $20 $01

    xor  a                                        ; $61B6: $AF

jr_020_61B7:
    ld   [hl], a                                  ; $61B7: $77
    ld   e, a                                     ; $61B8: $5F
    ld   d, $00                                   ; $61B9: $16 $00
    ld   hl, Data_020_610E                        ; $61BB: $21 $0E $61
    add  hl, de                                   ; $61BE: $19
    ld   a, [wOcarinaSongFlags]                   ; $61BF: $FA $49 $DB
    and  [hl]                                     ; $61C2: $A6
    jr   z, jr_020_61AD                           ; $61C3: $28 $E8

jr_020_61C5:
    ldh  a, [hJoypadState]                        ; $61C5: $F0 $CC
    and  $02                                      ; $61C7: $E6 $02
    jr   z, jr_020_61E4                           ; $61C9: $28 $19

jr_020_61CB:
    ld   hl, $DB4A                                ; $61CB: $21 $4A $DB
    ld   a, [hl]                                  ; $61CE: $7E
    dec  a                                        ; $61CF: $3D
    cp   $80                                      ; $61D0: $FE $80
    jr   c, jr_020_61D6                           ; $61D2: $38 $02

    ld   a, $02                                   ; $61D4: $3E $02

jr_020_61D6:
    ld   [hl], a                                  ; $61D6: $77
    ld   e, a                                     ; $61D7: $5F
    ld   d, $00                                   ; $61D8: $16 $00
    ld   hl, Data_020_610E                        ; $61DA: $21 $0E $61
    add  hl, de                                   ; $61DD: $19
    ld   a, [wOcarinaSongFlags]                   ; $61DE: $FA $49 $DB
    and  [hl]                                     ; $61E1: $A6
    jr   z, jr_020_61CB                           ; $61E2: $28 $E7

jr_020_61E4:
    ldh  a, [hJoypadState]                        ; $61E4: $F0 $CC
    and  $03                                      ; $61E6: $E6 $03
    jr   z, jr_020_61ED                           ; $61E8: $28 $03

    call func_020_6039                            ; $61EA: $CD $39 $60

jr_020_61ED:
    ld   hl, $C010                                ; $61ED: $21 $10 $C0
    ld   a, $38                                   ; $61F0: $3E $38
    ld   [hl+], a                                 ; $61F2: $22
    push hl                                       ; $61F3: $E5
    ld   a, [$DB4A]                               ; $61F4: $FA $4A $DB
    ld   e, a                                     ; $61F7: $5F
    ld   d, $00                                   ; $61F8: $16 $00
    ld   hl, Data_020_610B                        ; $61FA: $21 $0B $61
    add  hl, de                                   ; $61FD: $19
    ld   a, [hl]                                  ; $61FE: $7E
    pop  hl                                       ; $61FF: $E1
    ld   [hl+], a                                 ; $6200: $22
    push af                                       ; $6201: $F5
    ld   a, $28                                   ; $6202: $3E $28
    ld   [hl+], a                                 ; $6204: $22
    ld   a, $06                                   ; $6205: $3E $06
    ld   [hl+], a                                 ; $6207: $22
    ld   a, $38                                   ; $6208: $3E $38
    ld   [hl+], a                                 ; $620A: $22
    pop  af                                       ; $620B: $F1
    add  $08                                      ; $620C: $C6 $08
    ld   [hl+], a                                 ; $620E: $22
    ld   a, $28                                   ; $620F: $3E $28
    ld   [hl+], a                                 ; $6211: $22
    ld   [hl], $26                                ; $6212: $36 $26

jr_020_6214:
    ret                                           ; $6214: $C9

func_020_6215::
    ld   a, [wIsIndoor]                           ; $6215: $FA $A5 $DB
    and  a                                        ; $6218: $A7
    jr   z, label_020_628D                        ; $6219: $28 $72

    ldh  a, [hMapId]                              ; $621B: $F0 $F7
    cp   $FF                                      ; $621D: $FE $FF
    jr   z, jr_020_6226                           ; $621F: $28 $05

    cp   $08                                      ; $6221: $FE $08
    jp   nc, label_020_628D                       ; $6223: $D2 $8D $62

jr_020_6226:
    ld   a, [$D46B]                               ; $6226: $FA $6B $D4
    and  $F8                                      ; $6229: $E6 $F8
    add  $50                                      ; $622B: $C6 $50
    ld   h, a                                     ; $622D: $67
    ld   a, [$D46B]                               ; $622E: $FA $6B $D4
    rla                                           ; $6231: $17
    rla                                           ; $6232: $17
    rla                                           ; $6233: $17
    and  $38                                      ; $6234: $E6 $38
    add  $60                                      ; $6236: $C6 $60
    ld   l, a                                     ; $6238: $6F
    ld   a, [wMinimapLayout]                      ; $6239: $FA $B0 $DB
    and  $20                                      ; $623C: $E6 $20
    jr   z, jr_020_624D                           ; $623E: $28 $0D

    ld   a, [$D46B]                               ; $6240: $FA $6B $D4
    and  $38                                      ; $6243: $E6 $38
    cp   $20                                      ; $6245: $FE $20
    jr   nc, jr_020_624D                          ; $6247: $30 $04

    ld   a, h                                     ; $6249: $7C
    sub  $08                                      ; $624A: $D6 $08
    ld   h, a                                     ; $624C: $67

jr_020_624D:
    ld   a, [wMinimapLayout]                      ; $624D: $FA $B0 $DB
    and  $10                                      ; $6250: $E6 $10
    jr   z, jr_020_6261                           ; $6252: $28 $0D

    ld   a, [$D46B]                               ; $6254: $FA $6B $D4
    and  $07                                      ; $6257: $E6 $07
    cp   $04                                      ; $6259: $FE $04
    jr   c, jr_020_6261                           ; $625B: $38 $04

    ld   a, l                                     ; $625D: $7D
    add  $08                                      ; $625E: $C6 $08
    ld   l, a                                     ; $6260: $6F

jr_020_6261:
    ld   a, h                                     ; $6261: $7C
    ld   [wOAMBuffer], a                          ; $6262: $EA $00 $C0
    ld   a, l                                     ; $6265: $7D
    ld   [$C001], a                               ; $6266: $EA $01 $C0
    ld   a, $3F                                   ; $6269: $3E $3F
    ld   [$C002], a                               ; $626B: $EA $02 $C0
    ldh  a, [hIsGBC]                              ; $626E: $F0 $FE
    and  a                                        ; $6270: $A7
    jr   z, jr_020_6285                           ; $6271: $28 $12

    ld   a, $01                                   ; $6273: $3E $01
    ld   [$C003], a                               ; $6275: $EA $03 $C0
    ldh  a, [hFrameCounter]                       ; $6278: $F0 $E7
    and  $08                                      ; $627A: $E6 $08
    jr   z, label_020_628D                        ; $627C: $28 $0F

    ld   a, $04                                   ; $627E: $3E $04
    ld   [$C003], a                               ; $6280: $EA $03 $C0
    jr   label_020_628D                           ; $6283: $18 $08

jr_020_6285:
    ldh  a, [hFrameCounter]                       ; $6285: $F0 $E7
    rla                                           ; $6287: $17
    and  $10                                      ; $6288: $E6 $10
    ld   [$C003], a                               ; $628A: $EA $03 $C0

label_020_628D:
    ret                                           ; $628D: $C9

Data_020_628E::
    db   $08, $28, $08, $28, $08, $28, $08, $28, $08, $28

Data_020_6298::
    db   $28, $28, $40, $40, $58, $58, $70, $70, $88, $88

func_020_62A2::
    ld   a, [wInventoryCursorFrameCounter]        ; $62A2: $FA $59 $C1
    inc  a                                        ; $62A5: $3C
    ld   [wInventoryCursorFrameCounter], a        ; $62A6: $EA $59 $C1
    and  $10                                      ; $62A9: $E6 $10
    jr   nz, jr_020_62DD                          ; $62AB: $20 $30

    ld   a, [$DBA3]                               ; $62AD: $FA $A3 $DB
    ld   e, a                                     ; $62B0: $5F
    ld   d, $00                                   ; $62B1: $16 $00
    ld   hl, Data_020_6298                        ; $62B3: $21 $98 $62
    add  hl, de                                   ; $62B6: $19
    ld   a, [hl]                                  ; $62B7: $7E
    ld   [$C004], a                               ; $62B8: $EA $04 $C0
    ld   [$C008], a                               ; $62BB: $EA $08 $C0
    ld   hl, Data_020_628E                        ; $62BE: $21 $8E $62

jr_020_62C1:
    add  hl, de                                   ; $62C1: $19
    ld   a, [hl]                                  ; $62C2: $7E
    ld   [$C005], a                               ; $62C3: $EA $05 $C0
    add  $20                                      ; $62C6: $C6 $20
    ld   [$C009], a                               ; $62C8: $EA $09 $C0
    ld   a, $BE                                   ; $62CB: $3E $BE
    ld   [$C006], a                               ; $62CD: $EA $06 $C0
    ld   [$C00A], a                               ; $62D0: $EA $0A $C0
    ld   a, $34                                   ; $62D3: $3E $34
    ld   [$C007], a                               ; $62D5: $EA $07 $C0
    ld   a, $14                                   ; $62D8: $3E $14
    ld   [$C00B], a                               ; $62DA: $EA $0B $C0

jr_020_62DD:
    ret                                           ; $62DD: $C9

func_020_62DE::
    ld   a, [$DE09]                               ; $62DE: $FA $09 $DE
    ld   b, a                                     ; $62E1: $47
    ld   a, [$DE08]                               ; $62E2: $FA $08 $DE
    inc  a                                        ; $62E5: $3C
    ld   [$DE08], a                               ; $62E6: $EA $08 $DE
    cp   $10                                      ; $62E9: $FE $10
    jr   c, jr_020_62F2                           ; $62EB: $38 $05

    xor  a                                        ; $62ED: $AF
    ld   [$DE08], a                               ; $62EE: $EA $08 $DE
    inc  b                                        ; $62F1: $04

jr_020_62F2:
    ld   a, b                                     ; $62F2: $78
    ld   [$DE09], a                               ; $62F3: $EA $09 $DE
    ldh  [hFreeWarpDataAddress], a                ; $62F6: $E0 $E6
    ld   hl, $C050                                ; $62F8: $21 $50 $C0
    ld   b, $4A                                   ; $62FB: $06 $4A
    ld   c, $53                                   ; $62FD: $0E $53
    ld   d, $08                                   ; $62FF: $16 $08
    ld   a, $90                                   ; $6301: $3E $90
    ld   [hl+], a                                 ; $6303: $22
    ld   a, c                                     ; $6304: $79
    ld   [hl+], a                                 ; $6305: $22
    add  $08                                      ; $6306: $C6 $08
    ld   c, a                                     ; $6308: $4F
    ld   a, b                                     ; $6309: $78
    inc  b                                        ; $630A: $04
    inc  b                                        ; $630B: $04
    ld   [hl+], a                                 ; $630C: $22
    ld   a, $26                                   ; $630D: $3E $26
    ld   [hl+], a                                 ; $630F: $22
    ldh  a, [hFreeWarpDataAddress]                ; $6310: $F0 $E6
    and  $03                                      ; $6312: $E6 $03
    jr   nz, jr_020_631A                          ; $6314: $20 $04

    ld   c, $9B                                   ; $6316: $0E $9B
    jr   jr_020_632E                              ; $6318: $18 $14

jr_020_631A:
    ld   a, $90                                   ; $631A: $3E $90
    ld   [hl+], a                                 ; $631C: $22
    ld   a, c                                     ; $631D: $79
    ld   [hl+], a                                 ; $631E: $22
    add  $08                                      ; $631F: $C6 $08
    ld   c, a                                     ; $6321: $4F
    ld   a, b                                     ; $6322: $78
    ld   [hl+], a                                 ; $6323: $22
    inc  b                                        ; $6324: $04
    inc  b                                        ; $6325: $04
    ld   a, $06                                   ; $6326: $3E $06
    ld   [hl+], a                                 ; $6328: $22
    dec  d                                        ; $6329: $15
    ld   a, d                                     ; $632A: $7A
    and  a                                        ; $632B: $A7
    jr   nz, jr_020_631A                          ; $632C: $20 $EC

jr_020_632E:
    ld   a, $90                                   ; $632E: $3E $90
    ld   [hl+], a                                 ; $6330: $22
    ld   a, c                                     ; $6331: $79
    ld   [hl+], a                                 ; $6332: $22
    ld   a, $4A                                   ; $6333: $3E $4A
    ld   [hl+], a                                 ; $6335: $22
    ld   a, $26                                   ; $6336: $3E $26
    ld   [hl], a                                  ; $6338: $77
    ret                                           ; $6339: $C9

Data_020_633A::
    db   $10, $38, $10, $30, $10, $30, $10, $30, $10, $30, $10, $30

Data_020_6346::
    db   $0E, $0E, $26, $26, $3E, $3E, $56, $56, $6E, $6E, $86, $86

func_020_6352::
    ld   a, [wBGPalette]                          ; $6352: $FA $97 $DB

jr_020_6355:
    cp   $E4                                      ; $6355: $FE $E4
    ret  c                                        ; $6357: $D8

    ld   d, $02                                   ; $6358: $16 $02
    jr   jr_020_635E                              ; $635A: $18 $02

func_020_635C::
    ld   d, $0C                                   ; $635C: $16 $0C

jr_020_635E:
    ld   hl, wBButtonSlot                         ; $635E: $21 $00 $DB
    ld   e, $00                                   ; $6361: $1E $00

jr_020_6363:
    ld   a, [hl+]                                 ; $6363: $2A
    cp   $01                                      ; $6364: $FE $01
    jr   z, jr_020_636E                           ; $6366: $28 $06

    inc  e                                        ; $6368: $1C
    ld   a, e                                     ; $6369: $7B
    cp   d                                        ; $636A: $BA
    jr   nz, jr_020_6363                          ; $636B: $20 $F6

    ret                                           ; $636D: $C9

jr_020_636E:
    ld   d, $00                                   ; $636E: $16 $00
    ld   hl, Data_020_633A                        ; $6370: $21 $3A $63
    add  hl, de                                   ; $6373: $19
    ld   a, [hl]                                  ; $6374: $7E
    ldh  [hScratch0], a                           ; $6375: $E0 $D7
    ld   hl, Data_020_6346                        ; $6377: $21 $46 $63
    add  hl, de                                   ; $637A: $19
    ld   a, [hl]                                  ; $637B: $7E
    ldh  [hScratch1], a                           ; $637C: $E0 $D8
    ld   a, [wActivePowerUp]                      ; $637E: $FA $7C $D4
    dec  a                                        ; $6381: $3D
    jr   nz, jr_020_63BE                          ; $6382: $20 $3A

    ldh  a, [hFrameCounter]                       ; $6384: $F0 $E7
    and  $08                                      ; $6386: $E6 $08
    jr   nz, jr_020_63BE                          ; $6388: $20 $34

    ld   a, [wOAMNextAvailableSlot]               ; $638A: $FA $C0 $C3
    ld   e, a                                     ; $638D: $5F
    ld   d, $00                                   ; $638E: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $6390: $21 $30 $C0
    ld   a, [wGameplayType]                       ; $6393: $FA $95 $DB
    cp   $0C                                      ; $6396: $FE $0C
    jr   nz, jr_020_63A1                          ; $6398: $20 $07

    ld   a, [wGameplaySubtype]                    ; $639A: $FA $96 $DB
    cp   $02                                      ; $639D: $FE $02
    jr   nc, jr_020_63A2                          ; $639F: $30 $01

jr_020_63A1:
    add  hl, de                                   ; $63A1: $19

jr_020_63A2:
    ld   a, [$C1B5]                               ; $63A2: $FA $B5 $C1
    and  a                                        ; $63A5: $A7
    jr   z, jr_020_63AB                           ; $63A6: $28 $03

    ld   hl, $C09C                                ; $63A8: $21 $9C $C0

jr_020_63AB:
    ld   a, [wWindowY]                            ; $63AB: $FA $9A $DB
    push hl                                       ; $63AE: $E5
    ld   hl, hScratch1                            ; $63AF: $21 $D8 $FF
    add  [hl]                                     ; $63B2: $86
    pop  hl                                       ; $63B3: $E1
    ld   [hl+], a                                 ; $63B4: $22
    ldh  a, [hScratch0]                           ; $63B5: $F0 $D7
    ld   [hl+], a                                 ; $63B7: $22
    ld   a, $04                                   ; $63B8: $3E $04
    ld   [hl+], a                                 ; $63BA: $22
    ld   a, $54                                   ; $63BB: $3E $54
    ld   [hl+], a                                 ; $63BD: $22

jr_020_63BE:
    ld   a, $01                                   ; $63BE: $3E $01
    call label_3DA0                               ; $63C0: $CD $A0 $3D
    ret                                           ; $63C3: $C9

InventoryVisibleHandler::
    call func_020_5EB5                            ; $63C4: $CD $B5 $5E
    call func_020_6215                            ; $63C7: $CD $15 $62
    call func_020_5F06                            ; $63CA: $CD $06 $5F
    call func_020_6111                            ; $63CD: $CD $11 $61
    call func_020_62A2                            ; $63D0: $CD $A2 $62
    call func_020_635C                            ; $63D3: $CD $5C $63
    call func_020_62DE                            ; $63D6: $CD $DE $62
    ld   a, [$C1BA]                               ; $63D9: $FA $BA $C1
    and  a                                        ; $63DC: $A7
    jr   z, jr_020_63F5                           ; $63DD: $28 $16

    ld   a, [wGameplaySubtype]                    ; $63DF: $FA $96 $DB
    cp   $0C                                      ; $63E2: $FE $0C
    jr   nz, jr_020_6445                          ; $63E4: $20 $5F

    xor  a                                        ; $63E6: $AF
    ld   [$C1BA], a                               ; $63E7: $EA $BA $C1
    ld   [$C1B5], a                               ; $63EA: $EA $B5 $C1
    ld   [$C1B8], a                               ; $63ED: $EA $B8 $C1
    ld   [$C1B9], a                               ; $63F0: $EA $B9 $C1
    jr   jr_020_6436                              ; $63F3: $18 $41

jr_020_63F5:
    ; POI: Debug tool 3 check to enable free movement mode on the subscreen
    ; and resetting the photo album on pushing Select
    ldh  a, [hJoypadState]                        ; $63F5: $F0 $CC
    and  J_SELECT                                 ; $63F7: $E6 $40
    jr   z, jr_020_641E                           ; $63F9: $28 $23

    ld   a, $09                                   ; $63FB: $3E $09
    ld   [wGameplaySubtype], a                    ; $63FD: $EA $96 $DB
    ld   a, $90                                   ; $6400: $3E $90
    ld   [$DE0A], a                               ; $6402: $EA $0A $DE
    ld   a, [ROM_DebugTool3]                      ; $6405: $FA $05 $00
    and  a                                        ; $6408: $A7
    jr   z, jr_020_641C                           ; $6409: $28 $11

    ld   a, [wFreeMovementMode]                   ; $640B: $FA $7B $C1
    xor  $01                                      ; $640E: $EE $01
    ld   [wFreeMovementMode], a                   ; $6410: $EA $7B $C1
    ld   a, $01                                   ; $6413: $3E $01
    ld   [wPhotos1], a                            ; $6415: $EA $0C $DC
    xor  a                                        ; $6418: $AF
    ld   [wPhotos2], a                            ; $6419: $EA $0D $DC

jr_020_641C:
    jr   jr_020_6445                              ; $641C: $18 $27

jr_020_641E:
    ld   a, [$C1B5]                               ; $641E: $FA $B5 $C1
    ld   hl, $C1B8                                ; $6421: $21 $B8 $C1
    or   [hl]                                     ; $6424: $B6
    ld   hl, $C1B9                                ; $6425: $21 $B9 $C1
    or   [hl]                                     ; $6428: $B6
    jr   nz, jr_020_6445                          ; $6429: $20 $1A

    ldh  a, [hJoypadState]                        ; $642B: $F0 $CC
    and  J_START                                  ; $642D: $E6 $80
    jr   z, jr_020_6445                           ; $642F: $28 $14

    ld   a, $0C                                   ; $6431: $3E $0C
    ld   [wGameplaySubtype], a                    ; $6433: $EA $96 $DB

jr_020_6436:
    xor  a                                        ; $6436: $AF
    ld   [wTransitionSequenceCounter], a          ; $6437: $EA $6B $C1
    ld   [wC16C], a                               ; $643A: $EA $6C $C1
    inc  a                                        ; $643D: $3C
    ld   [wPaletteUnknownE], a                    ; $643E: $EA $D5 $DD
    ld   a, JINGLE_CLOSE_INVENTORY                ; $6441: $3E $12
    ldh  [hJingle], a                             ; $6443: $E0 $F2

jr_020_6445:
    ret                                           ; $6445: $C9

func_020_6446::
    ldh  a, [hScratchB]                           ; $6446: $F0 $E2
    ld   [hl+], a                                 ; $6448: $22
    ldh  a, [hBGMapOffsetLow]                     ; $6449: $F0 $E1
    ld   [hl+], a                                 ; $644B: $22
    add  $08                                      ; $644C: $C6 $08
    ldh  [hBGMapOffsetLow], a                     ; $644E: $E0 $E1
    ld   a, [de]                                  ; $6450: $1A
    ld   [hl+], a                                 ; $6451: $22
    inc  de                                       ; $6452: $13
    ld   a, [de]                                  ; $6453: $1A
    ld   [hl+], a                                 ; $6454: $22
    inc  de                                       ; $6455: $13
    dec  c                                        ; $6456: $0D
    ld   a, c                                     ; $6457: $79
    and  a                                        ; $6458: $A7
    jr   nz, func_020_6446                        ; $6459: $20 $EB

    ret                                           ; $645B: $C9

Data_020_645C::
    db   $40, $05, $40, $25, $5C, $03, $5E, $03   ; $645C

Data_020_6464::
    db   $40, $06, $40, $26, $60, $03, $62, $03   ; $6464

Data_020_646C::
    db   $40, $07, $40, $27, $64, $03, $7E, $03   ; $646C

Data_020_6474::
    dw   Data_020_645C
    dw   Data_020_6464
    dw   Data_020_646C

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
    db   $66, $03, $66, $03, $68, $03, $66, $03   ; $64B2
    db   $6A, $03, $66, $03, $6C, $03, $66, $03   ; $64BA
    db   $6E, $03, $66, $03, $70, $03, $66, $03   ; $64C2
    db   $72, $03, $66, $03, $74, $03, $66, $03   ; $64CA
    db   $76, $03, $66, $03, $78, $03, $68, $03   ; $64D2
    db   $66, $03, $68, $03, $68, $03, $68, $03   ; $64DA
    db   $6A, $03

Data_020_64E4::
    db   $7A, $03, $68, $03, $6A, $03   ; $64E2
    db   $7C, $03, $7C, $03                       ; $64EA

func_020_64EE::
    ld   hl, $C010                                ; $64EE: $21 $10 $C0
    ld   a, $53                                   ; $64F1: $3E $53
    ldh  [hBGMapOffsetLow], a                     ; $64F3: $E0 $E1
    ld   a, [$DE0A]                               ; $64F5: $FA $0A $DE
    ldh  [hScratchB], a                           ; $64F8: $E0 $E2
    push hl                                       ; $64FA: $E5
    ld   c, $04                                   ; $64FB: $0E $04
    ld   hl, Data_020_6474                        ; $64FD: $21 $74 $64
    ld   a, [wTunicType]                          ; $6500: $FA $0F $DC
    sla  a                                        ; $6503: $CB $27
    ld   e, a                                     ; $6505: $5F
    ld   d, $00                                   ; $6506: $16 $00
    add  hl, de                                   ; $6508: $19
    ld   e, [hl]                                  ; $6509: $5E
    inc  hl                                       ; $650A: $23
    ld   d, [hl]                                  ; $650B: $56
    pop  hl                                       ; $650C: $E1
    call func_020_6446                            ; $650D: $CD $46 $64
    ldh  a, [hScratchB]                           ; $6510: $F0 $E2
    ld   [hl+], a                                 ; $6512: $22
    ldh  a, [hBGMapOffsetLow]                     ; $6513: $F0 $E1
    ld   [hl+], a                                 ; $6515: $22
    add  $08                                      ; $6516: $C6 $08
    ldh  [hBGMapOffsetLow], a                     ; $6518: $E0 $E1
    ld   a, $7C                                   ; $651A: $3E $7C
    ld   [hl+], a                                 ; $651C: $22
    ld   a, $03                                   ; $651D: $3E $03
    ld   [hl+], a                                 ; $651F: $22
    push hl                                       ; $6520: $E5
    ld   c, $06                                   ; $6521: $0E $06
    ld   de, Data_020_64A2                        ; $6523: $11 $A2 $64
    ld   h, $00                                   ; $6526: $26 $00
    ld   a, [wHeartPiecesCount]                   ; $6528: $FA $5C $DB
    sla  a                                        ; $652B: $CB $27
    ld   l, a                                     ; $652D: $6F
    add  hl, de                                   ; $652E: $19
    ld   e, [hl]                                  ; $652F: $5E
    inc  hl                                       ; $6530: $23
    ld   d, [hl]                                  ; $6531: $56
    pop  hl                                       ; $6532: $E1
    call func_020_6446                            ; $6533: $CD $46 $64
    ld   a, $53                                   ; $6536: $3E $53
    ldh  [hBGMapOffsetLow], a                     ; $6538: $E0 $E1
    ld   a, [$DE0A]                               ; $653A: $FA $0A $DE
    add  $10                                      ; $653D: $C6 $10
    ldh  [hScratchB], a                           ; $653F: $E0 $E2
    ld   c, $03                                   ; $6541: $0E $03
    ld   de, Data_020_64AA                        ; $6543: $11 $AA $64
    call func_020_6446                            ; $6546: $CD $46 $64
    ld   e, $00                                   ; $6549: $1E $00
    ld   a, [wPhotos1]                            ; $654B: $FA $0C $DC

jr_020_654E:
    bit  0, a                                     ; $654E: $CB $47
    jr   z, jr_020_6553                           ; $6550: $28 $01

    inc  e                                        ; $6552: $1C

jr_020_6553:
    srl  a                                        ; $6553: $CB $3F
    and  a                                        ; $6555: $A7
    jr   nz, jr_020_654E                          ; $6556: $20 $F6

    ld   a, [wPhotos2]                            ; $6558: $FA $0D $DC
    and  $0F                                      ; $655B: $E6 $0F

.loop
    bit  0, a                                     ; $655D: $CB $47
    jr   z, .jr_020_6562                          ; $655F: $28 $01

    inc  e                                        ; $6561: $1C

.jr_020_6562:
    srl  a                                        ; $6562: $CB $3F
    and  a                                        ; $6564: $A7

    jr   nz, .loop                                ; $6565: $20 $F6

    ld   d, $00                                   ; $6567: $16 $00
    sla  e                                        ; $6569: $CB $23
    sla  e                                        ; $656B: $CB $23
    push hl                                       ; $656D: $E5
    ld   c, $02                                   ; $656E: $0E $02
    ld   hl, Data_020_64B0                        ; $6570: $21 $B0 $64
    add  hl, de                                   ; $6573: $19
    push hl                                       ; $6574: $E5
    pop  de                                       ; $6575: $D1
    pop  hl                                       ; $6576: $E1
    call func_020_6446                            ; $6577: $CD $46 $64
    ld   c, $05                                   ; $657A: $0E $05
    ld   de, Data_020_64E4                        ; $657C: $11 $E4 $64
    call func_020_6446                            ; $657F: $CD $46 $64
    ret                                           ; $6582: $C9

InventoryInteractiveHandler::
    call func_020_5EB5                            ; $6583: $CD $B5 $5E
    call func_020_64EE                            ; $6586: $CD $EE $64
    ldh  a, [hPressedButtonsMask]                 ; $6589: $F0 $CB
    and  $40                                      ; $658B: $E6 $40
    jr   nz, jr_020_6596                          ; $658D: $20 $07

    ld   a, $0B                                   ; $658F: $3E $0B
    ld   [wGameplaySubtype], a                    ; $6591: $EA $96 $DB
    jr   jr_020_65A7                              ; $6594: $18 $11

jr_020_6596:
    ld   a, [$DE0A]                               ; $6596: $FA $0A $DE
    sub  $04                                      ; $6599: $D6 $04
    cp   $78                                      ; $659B: $FE $78
    jr   nc, jr_020_65A4                          ; $659D: $30 $05

    call IncrementGameplaySubtype_20                            ; $659F: $CD $83 $66
    ld   a, $78                                   ; $65A2: $3E $78

jr_020_65A4:
    ld   [$DE0A], a                               ; $65A4: $EA $0A $DE

jr_020_65A7:
    ret                                           ; $65A7: $C9

InventoryStatusInHandler::
    call func_020_5EB5                            ; $65A8: $CD $B5 $5E
    call func_020_64EE                            ; $65AB: $CD $EE $64
    ldh  a, [hPressedButtonsMask]                 ; $65AE: $F0 $CB
    and  $40                                      ; $65B0: $E6 $40
    jr   nz, jr_020_65B7                          ; $65B2: $20 $03

    call IncrementGameplaySubtype_20                            ; $65B4: $CD $83 $66

jr_020_65B7:
    ret                                           ; $65B7: $C9

InventoryStatusOutHandler::
    call func_020_5EB5                            ; $65B8: $CD $B5 $5E
    call func_020_64EE                            ; $65BB: $CD $EE $64
    ld   a, [$DE0A]                               ; $65BE: $FA $0A $DE
    add  $04                                      ; $65C1: $C6 $04
    cp   $90                                      ; $65C3: $FE $90
    jr   c, jr_020_65CE                           ; $65C5: $38 $07

    ld   a, $08                                   ; $65C7: $3E $08
    ld   [wGameplaySubtype], a                    ; $65C9: $EA $96 $DB
    ld   a, $90                                   ; $65CC: $3E $90

jr_020_65CE:
    ld   [$DE0A], a                               ; $65CE: $EA $0A $DE
    ret                                           ; $65D1: $C9

InventoryFadeOutHandler::
    call func_020_635C                            ; $65D2: $CD $5C $63
    call func_1A22                                ; $65D5: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $65D8: $FA $6B $C1
    cp   $04                                      ; $65DB: $FE $04
    jp   nz, jr_020_6682                          ; $65DD: $C2 $82 $66

    ld   a, $01                                   ; $65E0: $3E $01
    ld   [wPaletteUnknownE], a                    ; $65E2: $EA $D5 $DD
    xor  a                                        ; $65E5: $AF
    ld   [$C50A], a                               ; $65E6: $EA $0A $C5
    ld   [wC116], a                               ; $65E9: $EA $16 $C1
    ldh  [hBaseScrollX], a                        ; $65EC: $E0 $96
    ldh  [hBaseScrollY], a                        ; $65EE: $E0 $97
    ld   [wC167], a                               ; $65F0: $EA $67 $C1
    ld   [wInventoryAppearing], a                 ; $65F3: $EA $4F $C1
    ld   a, $07                                   ; $65F6: $3E $07
    ldh  [hWindowYUnused], a                      ; $65F8: $E0 $A9
    ld   a, $70                                   ; $65FA: $3E $70
    ldh  [hWindowXUnused], a                      ; $65FC: $E0 $AA
    ld   a, $0B                                   ; $65FE: $3E $0B
    ld   [wGameplayType], a                       ; $6600: $EA $95 $DB
    ldh  [hFFBC], a                               ; $6603: $E0 $BC
    ld   a, $02                                   ; $6605: $3E $02
    ld   [wGameplaySubtype], a                    ; $6607: $EA $96 $DB
    ld   a, [wIsIndoor]                           ; $660A: $FA $A5 $DB
    and  a                                        ; $660D: $A7
    ld   a, $06                                   ; $660E: $3E $06
    jr   nz, jr_020_6628                          ; $6610: $20 $16

    ldh  a, [hMapRoom]                            ; $6612: $F0 $F6
    cp   $64                                      ; @TODO ?? Map screen where you take the ghost after the house
    jr   nz, jr_020_6626                          ; $6616: $20 $0E

    ld   hl, $C193                                ; $6618: $21 $93 $C1
    ld   [hl], $A4                                ; $661B: $36 $A4
    inc  hl                                       ; $661D: $23
    ld   [hl], $E5                                ; $661E: $36 $E5
    inc  hl                                       ; $6620: $23
    ld   [hl], $82                                ; $6621: $36 $82
    inc  hl                                       ; $6623: $23
    ld   [hl], $A2                                ; $6624: $36 $A2

jr_020_6626:
    ld   a, $07                                   ; $6626: $3E $07

jr_020_6628:
    ld   [wTileMapToLoad], a                      ; $6628: $EA $FE $D6
    ld   hl, wRoomTransitionState                 ; $662B: $21 $24 $C1
    ld   e, $00                                   ; $662E: $1E $00

jr_020_6630:
    xor  a                                        ; $6630: $AF
    ld   [hl+], a                                 ; $6631: $22
    inc  e                                        ; $6632: $1C
    ld   a, e                                     ; $6633: $7B
    cp   $0C                                      ; $6634: $FE $0C
    jr   nz, jr_020_6630                          ; $6636: $20 $F8

    ld   a, $80                                   ; $6638: $3E $80
    ld   [wWindowY], a                            ; $663A: $EA $9A $DB
    ld   a, $07                                   ; $663D: $3E $07
    ld   [rWX], a                                 ; $663F: $E0 $4B
    ld   a, $08                                   ; $6641: $3E $08
    ld   [$C150], a                               ; $6643: $EA $50 $C1
    ld   a, $07                                   ; $6646: $3E $07
    ldh  [hWindowYUnused], a                      ; $6648: $E0 $A9
    ld   a, $70                                   ; $664A: $3E $70
    ldh  [hWindowXUnused], a                      ; $664C: $E0 $AA
    ldh  a, [hIsGBC]                              ; $664E: $F0 $FE
    and  a                                        ; $6650: $A7
    jr   z, jr_020_6682                           ; $6651: $28 $2F

    ld   hl, $DC10                                ; $6653: $21 $10 $DC
    ld   c, $80                                   ; $6656: $0E $80
    di                                            ; $6658: $F3

jr_020_6659:
    ld   a, $03                                   ; $6659: $3E $03
    ld   [rSVBK], a                               ; $665B: $E0 $70
    ld   b, [hl]                                  ; $665D: $46
    dec  a                                        ; $665E: $3D
    ld   [rSVBK], a                               ; $665F: $E0 $70
    ld   [hl], b                                  ; $6661: $70
    inc  hl                                       ; $6662: $23
    dec  c                                        ; $6663: $0D
    ld   a, c                                     ; $6664: $79
    and  a                                        ; $6665: $A7
    jr   nz, jr_020_6659                          ; $6666: $20 $F1

    xor  a                                        ; $6668: $AF
    ld   [rSVBK], a                               ; $6669: $E0 $70
    ld   a, [wLCDControl]                         ; $666B: $FA $FD $D6
    and  $7F                                      ; $666E: $E6 $7F
    ld   [rLCDC], a                               ; $6670: $E0 $40
    ldh  a, [hMapId]                              ; $6672: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $6674: $FE $FF
    jr   nz, jr_020_667C                          ; $6676: $20 $04

    ld   a, $01                                   ; $6678: $3E $01
    ldh  [hNeedsUpdatingEnnemiesTiles], a         ; $667A: $E0 $91

jr_020_667C:
    ld   a, [wLCDControl]                         ; $667C: $FA $FD $D6
    ld   [rLCDC], a                               ; $667F: $E0 $40
    ei                                            ; $6681: $FB

label_020_6682:
jr_020_6682:
    ret                                           ; $6682: $C9

IncrementGameplaySubtype_20::
    ld   hl, wGameplaySubtype                     ; $6683: $21 $96 $DB
    inc  [hl]                                     ; $6686: $34
    ret                                           ; $6687: $C9

Data_020_6688::
    db   $00, $08, $48, $02, $00, $00, $40, $02   ; $6688
    db   $00, $00, $FF, $FF, $00, $08, $4A, $02   ; $6690
    db   $00, $00, $4C, $02, $00, $00, $FF, $FF   ; $6698
    db   $00, $00, $4A, $22, $00, $08, $4C, $22   ; $66A0
    db   $00, $08, $FF, $FF, $00, $00, $48, $22   ; $66A8
    db   $00, $08, $40, $22, $00, $08, $FF, $FF   ; $66B0
    db   $00, $0C, $44, $02, $00, $04, $46, $02   ; $66B8
    db   $00, $FC, $40, $02, $00, $FC, $44, $22   ; $66C0
    db   $00, $04, $46, $22, $00, $0C, $40, $22   ; $66C8
    db   $00, $FC, $44, $22, $00, $04, $42, $22   ; $66D0
    db   $00, $0C, $40, $22, $00, $0C, $44, $02   ; $66D8
    db   $00, $04, $42, $02, $00, $FC, $40, $02   ; $66E0
Data_020_66E8::
    db   $00, $08, $48, $00, $00, $00, $40, $00   ; $66E8
    db   $00, $00, $FF, $FF, $00, $08, $4A, $00   ; $66F0
    db   $00, $00, $4C, $00, $00, $00, $FF, $FF   ; $66F8
    db   $00, $00, $4A, $20, $00, $08, $4C, $20   ; $6700
    db   $00, $08, $FF, $FF, $00, $00, $48, $20   ; $6708
    db   $00, $08, $40, $20, $00, $08, $FF, $FF   ; $6710
    db   $00, $0C, $44, $00, $00, $04, $46, $00   ; $6718
    db   $00, $FC, $40, $00, $00, $FC, $44, $20   ; $6720
    db   $00, $04, $46, $20, $00, $0C, $40, $20   ; $6728
    db   $00, $FC, $44, $20, $00, $04, $42, $20   ; $6730
    db   $00, $0C, $40, $20, $00, $0C, $44, $00   ; $6738
    db   $00, $04, $42, $00, $00, $FC, $40, $00   ; $6740
Data_020_6748::
    db   $00, $08, $48, $03, $00, $00, $40, $03   ; $6748
    db   $00, $00, $FF, $FF, $00, $08, $4A, $03   ; $6750
    db   $00, $00, $4C, $03, $00, $00, $FF, $FF   ; $6758
    db   $00, $00, $4A, $23, $00, $08, $4C, $23   ; $6760
    db   $00, $08, $FF, $FF, $00, $00, $48, $23   ; $6768
    db   $00, $08, $40, $23, $00, $08, $FF, $FF   ; $6770
    db   $00, $0C, $44, $03, $00, $04, $46, $03   ; $6778
    db   $00, $FC, $40, $03, $00, $FC, $44, $23   ; $6780
    db   $00, $04, $46, $23, $00, $0C, $40, $23   ; $6788
    db   $00, $FC, $44, $23, $00, $04, $42, $23   ; $6790
    db   $00, $0C, $40, $23, $00, $0C, $44, $03   ; $6798
    db   $00, $04, $42, $03, $00, $FC, $40, $03   ; $67A0
Data_020_67A8::
    db   $00, $00, $4C, $02, $00, $08, $4E, $02   ; $67A8
    db   $00, $00, $FF, $02, $00, $00, $4E, $22   ; $67B0
    db   $00, $08, $4C, $22, $00, $00, $FF, $02   ; $67B8
    db   $00, $00, $50, $02, $00, $08, $5A, $02   ; $67C0
    db   $00, $00, $FF, $02, $00, $00, $5A, $22   ; $67C8
    db   $00, $08, $50, $22, $00, $00, $FF, $02   ; $67D0
Data_020_67D8::
    db   $00, $00, $4C, $00, $00, $08, $4E, $00   ; $67D8
    db   $00, $00, $FF, $00, $00, $00, $4E, $20   ; $67E0
    db   $00, $08, $4C, $20, $00, $00, $FF, $00   ; $67E8
    db   $00, $00, $50, $00, $00, $08, $5A, $00   ; $67F0
    db   $00, $00, $FF, $00, $00, $00, $5A, $20   ; $67F8
    db   $00, $08, $50, $20, $00, $00, $FF, $00   ; $6800
Data_020_6808::
    db   $00, $00, $4C, $03, $00, $08, $4E, $03   ; $6808
    db   $00, $00, $FF, $03, $00, $00, $4E, $23   ; $6810
    db   $00, $08, $4C, $23, $00, $00, $FF, $03   ; $6818
    db   $00, $00, $50, $03, $00, $08, $5A, $03   ; $6820
    db   $00, $00, $FF, $03, $00, $00, $5A, $23   ; $6828
    db   $00, $08, $50, $23, $00, $00, $FF, $03   ; $6830
Data_020_6838::
    db   $00, $00, $78, $03, $00, $08, $7A, $03   ; $6838
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ; $6840
Data_020_6848::
    db   $00, $00, $7C, $03, $00, $08, $7E, $03   ; $6848
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ; $6850
Data_020_6858::
    db   $00, $00, $7A, $23, $00, $08, $78, $23   ; $6858
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ; $6860
Data_020_6868::
    db   $00, $00, $7E, $23, $00, $08, $7C, $23   ; $6868
    db   $00, $00, $FF, $03, $00, $00, $FF, $03   ; $6870
Data_020_6878::
    db   $FD, $10, $22, $23, $FD, $FD, $22, $03   ; $6878
    db   $00, $00, $78, $03, $00, $08, $7A, $03   ; $6880
Data_020_6888::
    db   $07, $10, $22, $03, $07, $FD, $22, $23   ; $6888
    db   $FF, $00, $78, $03, $FF, $08, $7A, $03   ; $6890
Data_020_6898::
    db   $FD, $0B, $22, $23, $FD, $F8, $22, $03   ; $6898
    db   $00, $00, $7A, $23, $00, $08, $78, $23   ; $68A0
Data_020_68A8::
    db   $07, $0B, $22, $03, $07, $F8, $22, $23   ; $68A8
    db   $FF, $00, $7A, $23, $FF, $08, $78, $23   ; $68B0
Data_020_68B8::
    db   $F4, $F8, $40, $07, $F4, $00, $42, $07   ; $68B8
    db   $F4, $08, $44, $07, $F4, $10, $46, $07   ; $68C0
    db   $04, $F8, $48, $07, $04, $00, $4A, $07   ; $68C8
    db   $04, $08, $4C, $07, $04, $10, $4E, $07   ; $68D0
Data_020_68D8::
    db   $F4, $10, $40, $27, $F4, $08, $42, $27   ; $68D8
    db   $F4, $00, $44, $27, $F4, $F8, $46, $27   ; $68E0
    db   $04, $10, $48, $27, $04, $08, $4A, $27   ; $68E8
    db   $04, $00, $4C, $27, $04, $F8, $4E, $27   ; $68F0
Data_020_68F8::
    db   $F4, $10, $50, $27, $F4, $08, $52, $27   ; $68F8
    db   $F4, $00, $54, $27, $F4, $F8, $56, $27   ; $6900
    db   $04, $10, $58, $27, $04, $08, $5A, $27   ; $6908
    db   $04, $00, $5C, $27, $04, $F8, $5E, $27   ; $6910
Data_020_6918::
    db   $F4, $F8, $50, $07, $F4, $00, $52, $07   ; $6918
    db   $F4, $08, $54, $07, $F4, $10, $56, $07   ; $6920
    db   $04, $F8, $58, $07, $04, $00, $5A, $07   ; $6928
    db   $04, $08, $5C, $07, $04, $10, $5E, $07   ; $6930
Data_020_6938::
    db   $02, $FC, $40, $07, $02, $04, $42, $07   ; $6938
    db   $02, $0C, $40, $27, $00, $00, $FF, $00   ; $6940
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $6948
Data_020_6950::
    db   $F2, $00, $44, $07, $F2, $08, $44, $27   ; $6950
    db   $02, $00, $46, $07, $02, $08, $46, $27   ; $6958
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $6960
Data_020_6968::
    db   $F2, $00, $48, $07, $F2, $08, $48, $27   ; $6968
    db   $02, $00, $4A, $07, $02, $08, $4A, $27   ; $6970
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $6978
Data_020_6980::
    db   $F2, $00, $4C, $07, $F2, $08, $4C, $27   ; $6980
    db   $02, $F8, $4E, $07, $02, $00, $50, $07   ; $6988
    db   $02, $08, $50, $27, $02, $10, $4E, $27   ; $6990
Data_020_6998::
    db   $F2, $FC, $52, $07, $F2, $04, $56, $07   ; $6998
    db   $F2, $0C, $5A, $07, $02, $FC, $54, $07   ; $69A0
    db   $02, $04, $58, $07, $02, $0C, $5C, $07   ; $69A8
Data_020_69B0::
    db   $F2, $FC, $5A, $27, $F2, $04, $56, $27   ; $69B0
    db   $F2, $0C, $52, $27, $02, $FC, $5C, $27   ; $69B8
    db   $02, $04, $58, $27, $02, $0C, $54, $27   ; $69C0
Data_020_69C8::
    db   $F2, $00, $4C, $04, $F2, $08, $4C, $24   ; $69C8
    db   $02, $F8, $4E, $04, $02, $00, $50, $04   ; $69D0
    db   $02, $08, $50, $24, $02, $10, $4E, $24   ; $69D8
Data_020_69E0::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01   ; $69E0
    db   $F0, $0C, $54, $01, $00, $FC, $56, $01   ; $69E8
    db   $00, $04, $58, $01, $00, $0C, $5A, $01   ; $69F0
Data_020_69F8::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01   ; $69F8
    db   $F0, $0C, $54, $01, $00, $FC, $5C, $01   ; $6A00
    db   $00, $04, $58, $01, $00, $0C, $5E, $01   ; $6A08
Data_020_6A10::
    db   $F4, $04, $20, $21, $00, $04, $8E, $16   ; $6A10
    db   $F4, $04, $20, $01, $00, $04, $8E, $16   ; $6A18
Data_020_6A20::
    db   $F4, $00, $40, $03, $F4, $08, $40, $23   ; $6A20

Data_020_6A28::
    db   $F4, $00, $40, $02, $F4, $08, $40, $22   ; $6A28

func_020_6A30::
    ldh  a, [hIsGBC]                              ; $6A30: $F0 $FE
    and  a                                        ; $6A32: $A7
    jp   z, label_020_6B81                        ; $6A33: $CA $81 $6B

    ld   a, e                                     ; $6A36: $7B
    cp   $03                                      ; $6A37: $FE $03
    ret  c                                        ; $6A39: $D8

    ld   a, $01                                   ; $6A3A: $3E $01
    ldh  [hScratchD], a                           ; $6A3C: $E0 $E4
    ld   a, $02                                   ; $6A3E: $3E $02
    ldh  [hScratchE], a                           ; $6A40: $E0 $E5
    ld   a, $04                                   ; $6A42: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6A44: $E0 $E6
    ld   hl, $DC10                                ; $6A46: $21 $10 $DC
    ld   d, $40                                   ; $6A49: $16 $40
    ld   a, e                                     ; $6A4B: $7B
    cp   $06                                      ; $6A4C: $FE $06
    jr   nc, jr_020_6A52                          ; $6A4E: $30 $02

    ld   d, $28                                   ; $6A50: $16 $28

jr_020_6A52:
    and  $10                                      ; $6A52: $E6 $10
    jr   z, func_020_6A68                         ; $6A54: $28 $12

    ldh  a, [hScratchD]                           ; $6A56: $F0 $E4
    sla  a                                        ; $6A58: $CB $27
    ldh  [hScratchD], a                           ; $6A5A: $E0 $E4
    ldh  a, [hScratchE]                           ; $6A5C: $F0 $E5
    sla  a                                        ; $6A5E: $CB $27
    ldh  [hScratchE], a                           ; $6A60: $E0 $E5
    ldh  a, [hFreeWarpDataAddress]                ; $6A62: $F0 $E6
    sla  a                                        ; $6A64: $CB $27
    ldh  [hFreeWarpDataAddress], a                ; $6A66: $E0 $E6

func_020_6A68::
    push hl                                       ; $6A68: $E5
    ldh  a, [hScratchD]                           ; $6A69: $F0 $E4
    ld   c, a                                     ; $6A6B: $4F
    ld   a, [hl]                                  ; $6A6C: $7E
    and  $1F                                      ; $6A6D: $E6 $1F
    add  c                                        ; $6A6F: $81
    cp   $20                                      ; $6A70: $FE $20
    jr   c, jr_020_6A76                           ; $6A72: $38 $02

    ld   a, $1F                                   ; $6A74: $3E $1F

jr_020_6A76:
    ldh  [hScratch0], a                           ; $6A76: $E0 $D7
    ldh  a, [hScratchE]                           ; $6A78: $F0 $E5
    ld   c, a                                     ; $6A7A: $4F
    ld   a, [hl+]                                 ; $6A7B: $2A
    and  $E0                                      ; $6A7C: $E6 $E0
    swap a                                        ; $6A7E: $CB $37
    ld   b, a                                     ; $6A80: $47
    ld   a, [hl]                                  ; $6A81: $7E
    and  $03                                      ; $6A82: $E6 $03
    swap a                                        ; $6A84: $CB $37
    or   b                                        ; $6A86: $B0
    and  $3E                                      ; $6A87: $E6 $3E
    add  c                                        ; $6A89: $81
    cp   $40                                      ; $6A8A: $FE $40
    jr   c, jr_020_6A90                           ; $6A8C: $38 $02

    ld   a, $3E                                   ; $6A8E: $3E $3E

jr_020_6A90:
    ldh  [hScratch1], a                           ; $6A90: $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ; $6A92: $F0 $E6
    ld   c, a                                     ; $6A94: $4F
    ld   a, [hl]                                  ; $6A95: $7E
    and  $7C                                      ; $6A96: $E6 $7C
    add  c                                        ; $6A98: $81
    cp   $80                                      ; $6A99: $FE $80
    jr   c, jr_020_6A9F                           ; $6A9B: $38 $02

    ld   a, $7C                                   ; $6A9D: $3E $7C

jr_020_6A9F:
    ldh  [hScratch2], a                           ; $6A9F: $E0 $D9
    pop  hl                                       ; $6AA1: $E1
    ldh  a, [hScratch0]                           ; $6AA2: $F0 $D7
    ld   b, a                                     ; $6AA4: $47
    ldh  a, [hScratch1]                           ; $6AA5: $F0 $D8
    swap a                                        ; $6AA7: $CB $37
    ld   c, a                                     ; $6AA9: $4F
    and  $E0                                      ; $6AAA: $E6 $E0
    or   b                                        ; $6AAC: $B0
    ld   [hl+], a                                 ; $6AAD: $22
    ldh  a, [hScratch2]                           ; $6AAE: $F0 $D9
    ld   b, a                                     ; $6AB0: $47
    ld   a, c                                     ; $6AB1: $79
    and  $03                                      ; $6AB2: $E6 $03
    or   b                                        ; $6AB4: $B0
    ld   [hl+], a                                 ; $6AB5: $22
    dec  d                                        ; $6AB6: $15
    ld   a, d                                     ; $6AB7: $7A
    and  a                                        ; $6AB8: $A7
    jr   nz, func_020_6A68                        ; $6AB9: $20 $AD

    ld   a, $03                                   ; $6ABB: $3E $03
    ld   [wPaletteDataFlags], a                   ; $6ABD: $EA $D1 $DD
    ret                                           ; $6AC0: $C9

func_020_6AC1::
    ldh  a, [hIsGBC]                              ; $6AC1: $F0 $FE
    and  a                                        ; $6AC3: $A7
    jp   z, label_020_6B81                        ; $6AC4: $CA $81 $6B

    ld   a, e                                     ; $6AC7: $7B
    cp   $06                                      ; $6AC8: $FE $06
    ret  c                                        ; $6ACA: $D8

    ld   a, $01                                   ; $6ACB: $3E $01
    ldh  [hScratchD], a                           ; $6ACD: $E0 $E4
    ld   a, $02                                   ; $6ACF: $3E $02
    ldh  [hScratchE], a                           ; $6AD1: $E0 $E5
    ld   a, $04                                   ; $6AD3: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6AD5: $E0 $E6
    ld   hl, $DC10                                ; $6AD7: $21 $10 $DC
    ld   a, $40                                   ; $6ADA: $3E $40
    ldh  [hScratch3], a                           ; $6ADC: $E0 $DA
    ld   a, e                                     ; $6ADE: $7B
    and  $10                                      ; $6ADF: $E6 $10
    jr   z, func_020_6AF5                         ; $6AE1: $28 $12

    ldh  a, [hScratchD]                           ; $6AE3: $F0 $E4
    sla  a                                        ; $6AE5: $CB $27
    ldh  [hScratchD], a                           ; $6AE7: $E0 $E4
    ldh  a, [hScratchE]                           ; $6AE9: $F0 $E5
    sla  a                                        ; $6AEB: $CB $27
    ldh  [hScratchE], a                           ; $6AED: $E0 $E5
    ldh  a, [hFreeWarpDataAddress]                ; $6AEF: $F0 $E6
    sla  a                                        ; $6AF1: $CB $27
    ldh  [hFreeWarpDataAddress], a                ; $6AF3: $E0 $E6

func_020_6AF5::
    push hl                                       ; $6AF5: $E5
    ld   a, $02                                   ; $6AF6: $3E $02
    ldh  [rSVBK], a                               ; $6AF8: $E0 $70
    ld   a, [hl+]                                 ; $6AFA: $2A
    ld   e, a                                     ; $6AFB: $5F
    ld   a, [hl]                                  ; $6AFC: $7E
    ld   d, a                                     ; $6AFD: $57
    dec  hl                                       ; $6AFE: $2B
    xor  a                                        ; $6AFF: $AF
    ldh  [rSVBK], a                               ; $6B00: $E0 $70
    ldh  a, [hScratchD]                           ; $6B02: $F0 $E4
    ld   c, a                                     ; $6B04: $4F
    ld   a, e                                     ; $6B05: $7B
    and  $1F                                      ; $6B06: $E6 $1F
    ld   b, a                                     ; $6B08: $47
    ld   a, [hl]                                  ; $6B09: $7E
    and  $1F                                      ; $6B0A: $E6 $1F
    cp   b                                        ; $6B0C: $B8
    jr   c, jr_020_6B17                           ; $6B0D: $38 $08

    jr   z, jr_020_6B17                           ; $6B0F: $28 $06

    sub  c                                        ; $6B11: $91
    jr   c, jr_020_6B17                           ; $6B12: $38 $03

    cp   b                                        ; $6B14: $B8
    jr   nc, jr_020_6B18                          ; $6B15: $30 $01

jr_020_6B17:
    ld   a, b                                     ; $6B17: $78

jr_020_6B18:
    ldh  [hScratch0], a                           ; $6B18: $E0 $D7
    ld   a, e                                     ; $6B1A: $7B
    and  $E0                                      ; $6B1B: $E6 $E0
    swap a                                        ; $6B1D: $CB $37
    ld   b, a                                     ; $6B1F: $47
    ld   a, d                                     ; $6B20: $7A
    and  $03                                      ; $6B21: $E6 $03
    swap a                                        ; $6B23: $CB $37
    or   b                                        ; $6B25: $B0
    ld   b, a                                     ; $6B26: $47
    ld   a, [hl+]                                 ; $6B27: $2A
    and  $E0                                      ; $6B28: $E6 $E0
    swap a                                        ; $6B2A: $CB $37
    ld   c, a                                     ; $6B2C: $4F
    ld   a, [hl]                                  ; $6B2D: $7E
    and  $03                                      ; $6B2E: $E6 $03
    swap a                                        ; $6B30: $CB $37
    or   c                                        ; $6B32: $B1
    push af                                       ; $6B33: $F5
    ldh  a, [hScratchE]                           ; $6B34: $F0 $E5
    ld   c, a                                     ; $6B36: $4F
    pop  af                                       ; $6B37: $F1
    cp   b                                        ; $6B38: $B8
    jr   c, jr_020_6B43                           ; $6B39: $38 $08

    jr   z, jr_020_6B43                           ; $6B3B: $28 $06

    sub  c                                        ; $6B3D: $91
    jr   c, jr_020_6B43                           ; $6B3E: $38 $03

    cp   b                                        ; $6B40: $B8
    jr   nc, jr_020_6B44                          ; $6B41: $30 $01

jr_020_6B43:
    ld   a, b                                     ; $6B43: $78

jr_020_6B44:
    ldh  [hScratch1], a                           ; $6B44: $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ; $6B46: $F0 $E6
    ld   c, a                                     ; $6B48: $4F
    ld   a, d                                     ; $6B49: $7A
    and  $7C                                      ; $6B4A: $E6 $7C
    ld   b, a                                     ; $6B4C: $47
    ld   a, [hl]                                  ; $6B4D: $7E
    and  $7C                                      ; $6B4E: $E6 $7C
    cp   b                                        ; $6B50: $B8
    jr   c, jr_020_6B5B                           ; $6B51: $38 $08

    jr   z, jr_020_6B5B                           ; $6B53: $28 $06

    sub  c                                        ; $6B55: $91
    jr   c, jr_020_6B5B                           ; $6B56: $38 $03

    cp   b                                        ; $6B58: $B8
    jr   nc, jr_020_6B5C                          ; $6B59: $30 $01

jr_020_6B5B:
    ld   a, b                                     ; $6B5B: $78

jr_020_6B5C:
    ldh  [hScratch2], a                           ; $6B5C: $E0 $D9
    pop  hl                                       ; $6B5E: $E1
    ldh  a, [hScratch0]                           ; $6B5F: $F0 $D7
    ld   b, a                                     ; $6B61: $47
    ldh  a, [hScratch1]                           ; $6B62: $F0 $D8
    swap a                                        ; $6B64: $CB $37
    ld   c, a                                     ; $6B66: $4F
    and  $E0                                      ; $6B67: $E6 $E0
    or   b                                        ; $6B69: $B0
    ld   [hl+], a                                 ; $6B6A: $22
    ldh  a, [hScratch2]                           ; $6B6B: $F0 $D9
    ld   b, a                                     ; $6B6D: $47
    ld   a, c                                     ; $6B6E: $79
    and  $03                                      ; $6B6F: $E6 $03
    or   b                                        ; $6B71: $B0
    ld   [hl+], a                                 ; $6B72: $22
    ldh  a, [hScratch3]                           ; $6B73: $F0 $DA
    dec  a                                        ; $6B75: $3D
    ldh  [hScratch3], a                           ; $6B76: $E0 $DA
    and  a                                        ; $6B78: $A7
    jp   nz, func_020_6AF5                        ; $6B79: $C2 $F5 $6A

    ld   a, $03                                   ; $6B7C: $3E $03
    ld   [wPaletteDataFlags], a                   ; $6B7E: $EA $D1 $DD

label_020_6B81:
    xor  a                                        ; $6B81: $AF
    ld   [wPaletteUnknownE], a                    ; $6B82: $EA $D5 $DD
    ret                                           ; $6B85: $C9

func_020_6B86::
    ld   a, $02                                   ; $6B86: $3E $02
    ldh  [rSVBK], a                               ; $6B88: $E0 $70
    ld   a, [bc]                                  ; $6B8A: $0A
    or   [hl]                                     ; $6B8B: $B6
    ld   e, a                                     ; $6B8C: $5F
    inc  bc                                       ; $6B8D: $03
    inc  hl                                       ; $6B8E: $23
    ld   a, [bc]                                  ; $6B8F: $0A
    or   [hl]                                     ; $6B90: $B6
    ld   d, a                                     ; $6B91: $57
    dec  bc                                       ; $6B92: $0B
    dec  hl                                       ; $6B93: $2B
    xor  a                                        ; $6B94: $AF
    ldh  [rSVBK], a                               ; $6B95: $E0 $70
    ld   [hl], e                                  ; $6B97: $73
    inc  hl                                       ; $6B98: $23
    ld   [hl], d                                  ; $6B99: $72
    inc  hl                                       ; $6B9A: $23
    ret                                           ; $6B9B: $C9

Data_020_6B9C::
    db   $00, $00, $84, $10, $8C, $31, $84, $10

func_020_6BA4::
    ldh  a, [hIsGBC]                              ; $6BA4: $F0 $FE
    and  a                                        ; $6BA6: $A7
    jp   z, label_020_6B81                        ; $6BA7: $CA $81 $6B

    ld   a, [wIntroSubTimer]                      ; $6BAA: $FA $02 $D0
    and  a                                        ; $6BAD: $A7
    jr   z, jr_020_6BB4                           ; $6BAE: $28 $04

    cp   $18                                      ; $6BB0: $FE $18
    jr   nc, jr_020_6BDB                          ; $6BB2: $30 $27

jr_020_6BB4:
    ld   hl, Data_020_6B9C                        ; $6BB4: $21 $9C $6B
    sla  e                                        ; $6BB7: $CB $23
    add  hl, de                                   ; $6BB9: $19
    push hl                                       ; $6BBA: $E5
    pop  bc                                       ; $6BBB: $C1
    ld   hl, $DC10                                ; $6BBC: $21 $10 $DC
    ld   a, $08                                   ; $6BBF: $3E $08
    ldh  [hScratch0], a                           ; $6BC1: $E0 $D7

jr_020_6BC3:
    call func_020_6B86                            ; $6BC3: $CD $86 $6B
    call func_020_6B86                            ; $6BC6: $CD $86 $6B
    call func_020_6B86                            ; $6BC9: $CD $86 $6B
    inc  hl                                       ; $6BCC: $23
    inc  hl                                       ; $6BCD: $23
    ldh  a, [hScratch0]                           ; $6BCE: $F0 $D7
    dec  a                                        ; $6BD0: $3D
    and  a                                        ; $6BD1: $A7
    ldh  [hScratch0], a                           ; $6BD2: $E0 $D7
    jr   nz, jr_020_6BC3                          ; $6BD4: $20 $ED

    ld   a, $01                                   ; $6BD6: $3E $01
    ld   [wPaletteDataFlags], a                   ; $6BD8: $EA $D1 $DD

jr_020_6BDB:
    ret                                           ; $6BDB: $C9

func_020_6BDC::
    ldh  a, [hIsGBC]                              ; $6BDC: $F0 $FE
    and  a                                        ; $6BDE: $A7
    ret  z                                        ; $6BDF: $C8

    ld   hl, $DC10                                ; $6BE0: $21 $10 $DC
    ld   bc, $DC50                                ; $6BE3: $01 $50 $DC
    ld   d, $20                                   ; $6BE6: $16 $20

jr_020_6BE8:
    ld   a, $FF                                   ; $6BE8: $3E $FF
    ld   [hl+], a                                 ; $6BEA: $22
    ld   [bc], a                                  ; $6BEB: $02
    inc  bc                                       ; $6BEC: $03
    ld   [hl+], a                                 ; $6BED: $22
    ld   [bc], a                                  ; $6BEE: $02
    inc  bc                                       ; $6BEF: $03
    dec  d                                        ; $6BF0: $15
    ld   a, d                                     ; $6BF1: $7A
    and  a                                        ; $6BF2: $A7
    jr   nz, jr_020_6BE8                          ; $6BF3: $20 $F3

    ld   a, $03                                   ; $6BF5: $3E $03
    ld   [wPaletteDataFlags], a                   ; $6BF7: $EA $D1 $DD
    ld   a, $01                                   ; $6BFA: $3E $01
    ld   [wPaletteUnknownE], a                    ; $6BFC: $EA $D5 $DD
    ret                                           ; $6BFF: $C9

LoadFileMenuBG::
    ldh  a, [hIsGBC]                              ; $6C00: $F0 $FE
    and  a                                        ; $6C02: $A7
    jp   z, label_020_6B81                        ; $6C03: $CA $81 $6B

    ld   c, $80                                   ; $6C06: $0E $80
    ld   hl, $DC10                                ; $6C08: $21 $10 $DC

jr_020_6C0B:
    ld   a, $02                                   ; $6C0B: $3E $02
    ldh  [rSVBK], a                               ; $6C0D: $E0 $70
    ld   b, [hl]                                  ; $6C0F: $46
    xor  a                                        ; $6C10: $AF
    ldh  [rSVBK], a                               ; $6C11: $E0 $70
    ld   [hl], b                                  ; $6C13: $70
    inc  hl                                       ; $6C14: $23
    dec  c                                        ; $6C15: $0D
    ld   a, c                                     ; $6C16: $79
    and  a                                        ; $6C17: $A7
    jr   nz, jr_020_6C0B                          ; $6C18: $20 $F1

    ld   a, $03                                   ; $6C1A: $3E $03
    ld   [wPaletteDataFlags], a                   ; $6C1C: $EA $D1 $DD
    xor  a                                        ; $6C1F: $AF
    ld   [wPaletteUnknownE], a                    ; $6C20: $EA $D5 $DD
    ret                                           ; $6C23: $C9

; Copy some tunic-related data to 01:DC50
; (GBC only)
CopyLinkTunicPalette::
    ldh  a, [hIsGBC]                              ; $6C24: $F0 $FE
    and  a                                        ; $6C26: $A7
    jr   z, .return                               ; $6C27: $28 $25

    ld   hl, $DC50                                ; $6C29: $21 $50 $DC
    ld   a, [wTunicType]                          ; $6C2C: $FA $0F $DC
    and  a                                        ; $6C2F: $A7
    jr   z, .specialTunicEnd                      ; $6C30: $28 $0B
    ; Change the base pointer for the color tunics
    inc  a                                        ; $6C32: $3C
    sla  a                                        ; $6C33: $CB $27
    sla  a                                        ; $6C35: $CB $27
    sla  a                                        ; $6C37: $CB $27
    ld   c, a                                     ; $6C39: $4F
    ld   b, $00                                   ; $6C3A: $06 $00
    add  hl, bc                                   ; $6C3C: $09

.specialTunicEnd
    ; Data length
    ld   b, $08                                   ; $6C3D: $06 $08

    ; Copy 8 bytes from 02:DC50 to 01:DC50
.loop
    ld   a, $02                                   ; $6C3F: $3E $02
    ldh  [rSVBK], a                               ; $6C41: $E0 $70
    ld   c, [hl]                                  ; $6C43: $4E
    xor  a                                        ; $6C44: $AF
    ldh  [rSVBK], a                               ; $6C45: $E0 $70
    ld   [hl], c                                  ; $6C47: $71
    inc  hl                                       ; $6C48: $23
    dec  b                                        ; $6C49: $05
    ld   a, b                                     ; $6C4A: $78
    and  a                                        ; $6C4B: $A7
    jr   nz, .loop                                ; $6C4C: $20 $F1

.return
    ret                                           ; $6C4E: $C9

func_020_6C4F::
    ldh  a, [hIsGBC]                              ; $6C4F: $F0 $FE
    and  a                                        ; $6C51: $A7
    jp   z, label_020_6B81                        ; $6C52: $CA $81 $6B

    ld   a, [wC16C]                               ; $6C55: $FA $6C $C1
    and  $01                                      ; $6C58: $E6 $01
    jr   z, jr_020_6C60                           ; $6C5A: $28 $04

    ld   a, $02                                   ; $6C5C: $3E $02
    jr   jr_020_6C76                              ; $6C5E: $18 $16

jr_020_6C60:
    ld   a, $04                                   ; $6C60: $3E $04
    ldh  [hScratchD], a                           ; $6C62: $E0 $E4
    ld   a, $08                                   ; $6C64: $3E $08
    ldh  [hScratchE], a                           ; $6C66: $E0 $E5
    ld   a, $10                                   ; $6C68: $3E $10
    ldh  [hFreeWarpDataAddress], a                ; $6C6A: $E0 $E6
    ld   hl, $DC10                                ; $6C6C: $21 $10 $DC
    ld   d, $40                                   ; $6C6F: $16 $40
    call func_020_6A68                            ; $6C71: $CD $68 $6A
    ld   a, $01                                   ; $6C74: $3E $01

jr_020_6C76:
    ld   [wPaletteDataFlags], a                   ; $6C76: $EA $D1 $DD
    ret                                           ; $6C79: $C9

func_020_6C7A::
    ldh  a, [hIsGBC]                              ; $6C7A: $F0 $FE
    and  a                                        ; $6C7C: $A7
    jp   z, label_020_6B81                        ; $6C7D: $CA $81 $6B

    ld   a, [wC16C]                               ; $6C80: $FA $6C $C1
    and  $01                                      ; $6C83: $E6 $01
    jr   z, jr_020_6C8B                           ; $6C85: $28 $04

    ld   a, $02                                   ; $6C87: $3E $02
    jr   jr_020_6CA3                              ; $6C89: $18 $18

jr_020_6C8B:
    ld   a, $04                                   ; $6C8B: $3E $04
    ldh  [hScratchD], a                           ; $6C8D: $E0 $E4
    ld   a, $08                                   ; $6C8F: $3E $08
    ldh  [hScratchE], a                           ; $6C91: $E0 $E5
    ld   a, $10                                   ; $6C93: $3E $10
    ldh  [hFreeWarpDataAddress], a                ; $6C95: $E0 $E6
    ld   hl, $DC10                                ; $6C97: $21 $10 $DC
    ld   a, $40                                   ; $6C9A: $3E $40
    ldh  [hScratch3], a                           ; $6C9C: $E0 $DA
    call func_020_6AF5                            ; $6C9E: $CD $F5 $6A
    ld   a, $01                                   ; $6CA1: $3E $01

jr_020_6CA3:
    ld   [wPaletteDataFlags], a                   ; $6CA3: $EA $D1 $DD
    ret                                           ; $6CA6: $C9

ApplyFadeToWhite_GBC::
    ld   a, [$C3CA]                               ; $6CA7: $FA $CA $C3
    cp   $20                                      ; $6CAA: $FE $20
    jr   z, jr_020_6D0D                           ; $6CAC: $28 $5F

    push af                                       ; $6CAE: $F5
    and  $02                                      ; $6CAF: $E6 $02
    jr   nz, jr_020_6CB5                          ; $6CB1: $20 $02

    ld   a, $01                                   ; $6CB3: $3E $01

jr_020_6CB5:
    or   $80                                      ; $6CB5: $F6 $80
    ld   [wPaletteDataFlags], a                   ; $6CB7: $EA $D1 $DD
    ld   a, [$C3CA]                               ; $6CBA: $FA $CA $C3
    and  $01                                      ; $6CBD: $E6 $01
    swap a                                        ; $6CBF: $CB $37
    ld   [wPaletteUnknownC], a                    ; $6CC1: $EA $D3 $DD
    ld   a, $10                                   ; $6CC4: $3E $10
    ld   [wPaletteUnknownD], a                    ; $6CC6: $EA $D4 $DD
    pop  af                                       ; $6CC9: $F1
    inc  a                                        ; $6CCA: $3C
    ld   [$C3CA], a                               ; $6CCB: $EA $CA $C3
    ld   a, $08                                   ; $6CCE: $3E $08
    ldh  [hScratchD], a                           ; $6CD0: $E0 $E4
    ld   a, $10                                   ; $6CD2: $3E $10
    ldh  [hScratchE], a                           ; $6CD4: $E0 $E5
    ld   a, $20                                   ; $6CD6: $3E $20
    ldh  [hFreeWarpDataAddress], a                ; $6CD8: $E0 $E6
    ld   hl, $DC10                                ; $6CDA: $21 $10 $DC
    ld   a, $40                                   ; $6CDD: $3E $40
    ldh  [hScratch3], a                           ; $6CDF: $E0 $DA
    ld   a, [wTransitionGfx]                      ; $6CE1: $FA $7F $C1
    cp   $03                                      ; $6CE4: $FE $03
    jr   z, jr_020_6CFA                           ; $6CE6: $28 $12

    ld   a, [wPaletteDataFlags]                   ; $6CE8: $FA $D1 $DD
    push af                                       ; $6CEB: $F5
    call func_020_6A30                            ; $6CEC: $CD $30 $6A
    pop  af                                       ; $6CEF: $F1
    ld   [wPaletteDataFlags], a                   ; $6CF0: $EA $D1 $DD
    ld   a, $01                                   ; $6CF3: $3E $01
    ld   [wPaletteUnknownE], a                    ; $6CF5: $EA $D5 $DD
    jr   jr_020_6D0D                              ; $6CF8: $18 $13

jr_020_6CFA:
    ld   a, [$C3CA]                               ; $6CFA: $FA $CA $C3
    dec  a                                        ; $6CFD: $3D
    and  $03                                      ; $6CFE: $E6 $03
    jr   nz, jr_020_6D0D                          ; $6D00: $20 $0B

    ld   a, [wPaletteDataFlags]                   ; $6D02: $FA $D1 $DD
    push af                                       ; $6D05: $F5
    call func_020_6AF5                            ; $6D06: $CD $F5 $6A
    pop  af                                       ; $6D09: $F1
    ld   [wPaletteDataFlags], a                   ; $6D0A: $EA $D1 $DD

jr_020_6D0D:
    ret                                           ; $6D0D: $C9

func_020_6D0E::
    ld   a, [hl]                                  ; $6D0E: $7E
    dec  a                                        ; $6D0F: $3D
    cp   $04                                      ; $6D10: $FE $04
    jr   c, jr_020_6D51                           ; $6D12: $38 $3D

    ldh  a, [hFrameCounter]                       ; $6D14: $F0 $E7
    and  $01                                      ; $6D16: $E6 $01
    jr   z, jr_020_6D1E                           ; $6D18: $28 $04

    ld   a, $02                                   ; $6D1A: $3E $02
    jr   jr_020_6D4E                              ; $6D1C: $18 $30

jr_020_6D1E:
    ld   a, [hl]                                  ; $6D1E: $7E
    dec  a                                        ; $6D1F: $3D
    cp   $0E                                      ; $6D20: $FE $0E
    jr   c, jr_020_6D38                           ; $6D22: $38 $14

    ld   a, $01                                   ; $6D24: $3E $01
    ldh  [hScratchD], a                           ; $6D26: $E0 $E4
    ld   a, $02                                   ; $6D28: $3E $02
    ldh  [hScratchE], a                           ; $6D2A: $E0 $E5
    ld   a, $04                                   ; $6D2C: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6D2E: $E0 $E6
    ld   hl, $DC30                                ; $6D30: $21 $30 $DC
    ld   d, $20                                   ; $6D33: $16 $20
    call func_020_6A68                            ; $6D35: $CD $68 $6A

jr_020_6D38:
    ld   a, $01                                   ; $6D38: $3E $01
    ldh  [hScratchD], a                           ; $6D3A: $E0 $E4
    ld   a, $02                                   ; $6D3C: $3E $02
    ldh  [hScratchE], a                           ; $6D3E: $E0 $E5
    ld   a, $04                                   ; $6D40: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6D42: $E0 $E6
    ld   hl, $DC10                                ; $6D44: $21 $10 $DC
    ld   d, $20                                   ; $6D47: $16 $20
    call func_020_6A68                            ; $6D49: $CD $68 $6A
    ld   a, $01                                   ; $6D4C: $3E $01

jr_020_6D4E:
    ld   [wPaletteDataFlags], a                   ; $6D4E: $EA $D1 $DD

jr_020_6D51:
    ret                                           ; $6D51: $C9

func_020_6D52::
    ld   e, $20                                   ; $6D52: $1E $20
    ld   a, [hl]                                  ; $6D54: $7E
    cp   $30                                      ; $6D55: $FE $30
    jr   c, jr_020_6D60                           ; $6D57: $38 $07

    ld   hl, $DC50                                ; $6D59: $21 $50 $DC
    ld   a, $02                                   ; $6D5C: $3E $02
    jr   jr_020_6D65                              ; $6D5E: $18 $05

jr_020_6D60:
    ld   hl, $DC10                                ; $6D60: $21 $10 $DC
    ld   a, $01                                   ; $6D63: $3E $01

jr_020_6D65:
    ld   [wPaletteDataFlags], a                   ; $6D65: $EA $D1 $DD

jr_020_6D68:
    push hl                                       ; $6D68: $E5
    ld   a, [hl]                                  ; $6D69: $7E
    inc  a                                        ; $6D6A: $3C
    and  $1F                                      ; $6D6B: $E6 $1F
    jr   nz, jr_020_6D71                          ; $6D6D: $20 $02

    ld   a, $1F                                   ; $6D6F: $3E $1F

jr_020_6D71:
    ldh  [hScratch0], a                           ; $6D71: $E0 $D7
    ld   a, [hl+]                                 ; $6D73: $2A
    and  $E0                                      ; $6D74: $E6 $E0
    swap a                                        ; $6D76: $CB $37
    ld   d, a                                     ; $6D78: $57
    ld   a, [hl]                                  ; $6D79: $7E
    and  $03                                      ; $6D7A: $E6 $03
    swap a                                        ; $6D7C: $CB $37
    or   d                                        ; $6D7E: $B2
    add  $02                                      ; $6D7F: $C6 $02
    and  $3E                                      ; $6D81: $E6 $3E
    jr   nz, jr_020_6D87                          ; $6D83: $20 $02

    ld   a, $3E                                   ; $6D85: $3E $3E

jr_020_6D87:
    ldh  [hScratch1], a                           ; $6D87: $E0 $D8
    ld   a, [hl]                                  ; $6D89: $7E
    add  $04                                      ; $6D8A: $C6 $04
    and  $7C                                      ; $6D8C: $E6 $7C
    jr   nz, jr_020_6D92                          ; $6D8E: $20 $02

    ld   a, $7C                                   ; $6D90: $3E $7C

jr_020_6D92:
    ldh  [hScratch2], a                           ; $6D92: $E0 $D9
    pop  hl                                       ; $6D94: $E1
    ldh  a, [hScratch0]                           ; $6D95: $F0 $D7
    ld   d, a                                     ; $6D97: $57
    ldh  a, [hScratch1]                           ; $6D98: $F0 $D8
    swap a                                        ; $6D9A: $CB $37
    and  $E0                                      ; $6D9C: $E6 $E0
    or   d                                        ; $6D9E: $B2
    ld   [hl+], a                                 ; $6D9F: $22
    ldh  a, [hScratch2]                           ; $6DA0: $F0 $D9
    ld   d, a                                     ; $6DA2: $57
    ldh  a, [hScratch1]                           ; $6DA3: $F0 $D8
    swap a                                        ; $6DA5: $CB $37
    and  $03                                      ; $6DA7: $E6 $03
    or   d                                        ; $6DA9: $B2
    ld   [hl+], a                                 ; $6DAA: $22
    dec  e                                        ; $6DAB: $1D
    jr   nz, jr_020_6D68                          ; $6DAC: $20 $BA

    ret                                           ; $6DAE: $C9

LoadRoomObjectsAttributes::
    ld   a, [wIsIndoor]                           ; $6DAF: $FA $A5 $DB
    and  a                                        ; $6DB2: $A7
    ret  nz                                       ; $6DB3: $C0

    ldh  a, [hMapRoom]                            ; $6DB4: $F0 $F6
    cp   $0E                                      ; $6DB6: $FE $0E
    jr   nz, .jr_020_6DC6                         ; $6DB8: $20 $0C

    ld   a, [wOverworldRoomStatus + $0E]                               ; $6DBA: $FA $0E $D8
    and  $10                                      ; $6DBD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DBF: $28 $59

    ld   hl, RoomGBCOverlay0EAlt                  ; $6DC1: $21 $90 $50
    jr   .jr_020_6E14                             ; $6DC4: $18 $4E

.jr_020_6DC6
    cp   $8C                                      ; $6DC6: $FE $8C
    jr   nz, .jr_020_6DD6                         ; $6DC8: $20 $0C

    ld   a, [wOverworldRoomStatus + $8C]                               ; $6DCA: $FA $8C $D8
    and  $10                                      ; $6DCD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DCF: $28 $49

    ld   hl, RoomGBCOverlay8CAlt                  ; $6DD1: $21 $D0 $51
    jr   .jr_020_6E14                             ; $6DD4: $18 $3E

.jr_020_6DD6
    cp   $79                                      ; $6DD6: $FE $79
    jr   nz, .jr_020_6DE6                         ; $6DD8: $20 $0C

    ld   a, [wOverworldRoomStatus + $79]                               ; $6DDA: $FA $79 $D8
    and  $10                                      ; $6DDD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DDF: $28 $39

    ld   hl, RoomGBCOverlay79Alt                  ; $6DE1: $21 $80 $51
    jr   .jr_020_6E14                             ; $6DE4: $18 $2E

.jr_020_6DE6
    cp   $06                                      ; $6DE6: $FE $06
    jr   nz, .jr_020_6DF6                         ; $6DE8: $20 $0C

    ld   a, [wOverworldRoomStatus + $06]                               ; $6DEA: $FA $06 $D8
    and  $10                                      ; $6DED: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DEF: $28 $29

    ld   hl, RoomGBCOverlay06Alt                  ; $6DF1: $21 $40 $50
    jr   .jr_020_6E14                             ; $6DF4: $18 $1E

.jr_020_6DF6
    cp   $1B                                      ; $6DF6: $FE $1B
    jr   nz, .jr_020_6E06                         ; $6DF8: $20 $0C

    ld   a, [wOverworldRoomStatus + $2B]                               ; $6DFA: $FA $2B $D8
    and  $10                                      ; $6DFD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DFF: $28 $19

    ld   hl, RoomGBCOverlay1BAlt                  ; $6E01: $21 $E0 $50
    jr   .jr_020_6E14                             ; $6E04: $18 $0E

.jr_020_6E06
    cp   $2B                                      ; $6E06: $FE $2B
    jr   nz, .jr_020_6E1A                         ; $6E08: $20 $10

    ld   a, [wOverworldRoomStatus + $2B]                               ; $6E0A: $FA $2B $D8
    and  $10                                      ; $6E0D: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6E0F: $28 $09

    ld   hl, RoomGBCOverlay2BAlt                 ; $6E11: $21 $30 $51

.jr_020_6E14
    ld   a, BANK(RoomGBCOverlay2BAlt)             ; $6E14: $3E $27
    ldh  [hScratch0], a                           ; $6E16: $E0 $D7
    jr   .copyAttributes                          ; $6E18: $18 $22

.jr_020_6E1A
    ; Set attributes bank for rooms < $CC
    ld   a, BANK(RoomGBCOverlaysA) ; $6E1A: $3E $26
    ldh  [hScratch0], a                           ; $6E1C: $E0 $D7
    ; If the room id >= $CC…
    ldh  a, [hMapRoom]                            ; $6E1E: $F0 $F6
    cp   $CC                                      ; $6E20: $FE $CC
    jr   c, .bankEnd                              ; $6E22: $38 $06
    ld   hl, hScratch0                            ; $6E24: $21 $D7 $FF
    ; … use BANK(RoomGBCOverlaysA) + 1 for the overlay bank
    inc  [hl]                                     ; $6E27: $34
    sub  $CC                                      ; $6E28: $D6 $CC
.bankEnd

    ld   hl, RoomGBCOverlaysA     ; $6E2A: $21 $00 $40
    ld   b, a                                     ; $6E2D: $47
    and  b                                        ; $6E2E: $A0

    ; hl += $50 * MapRoom
.mapRoomLoop
    jr   z, .copyAttributes                       ; $6E2F: $28 $0B

    ld   a, l                                     ; $6E31: $7D
    add  $50                                      ; $6E32: $C6 $50
    ld   l, a                                     ; $6E34: $6F
    ld   a, h                                     ; $6E35: $7C
    adc  $00                                      ; $6E36: $CE $00
    ld   h, a                                     ; $6E38: $67
    dec  b                                        ; $6E39: $05
    jr   .mapRoomLoop                             ; $6E3A: $18 $F3

.copyAttributes
    ; Copy the objects attributes to the room objects attributes in WRAM 2
    ld   de, wRoomObjects                         ; $6E3C: $11 $11 $D7
.loop
    ld   bc, $0A                                  ; $6E3F: $01 $0A $00
    push de                                       ; $6E42: $D5
    call CopyObjectsAttributesToWRAM2                  ; $6E43: $CD $1A $0B
    pop  de                                       ; $6E46: $D1
    ld   a, e                                     ; $6E47: $7B
    add  $10                                      ; $6E48: $C6 $10
    ld   e, a                                     ; $6E4A: $5F
    cp   $91                                      ; $6E4B: $FE $91
    jr   nz, .loop                                ; $6E4D: $20 $F0

    ret                                           ; $6E4F: $C9

func_020_6E50::
    push hl                                       ; $6E50: $E5
    ld   c, [hl]                                  ; $6E51: $4E
    ld   b, $0E                                   ; $6E52: $06 $0E
    ld   hl, Data_020_6E65                        ; $6E54: $21 $65 $6E

jr_020_6E57:
    ld   a, [hl+]                                 ; $6E57: $2A
    cp   c                                        ; $6E58: $B9
    jr   nz, jr_020_6E5F                          ; $6E59: $20 $04

    scf                                           ; $6E5B: $37
    ccf                                           ; $6E5C: $3F
    jr   jr_020_6E63                              ; $6E5D: $18 $04

jr_020_6E5F:
    dec  b                                        ; $6E5F: $05
    jr   nz, jr_020_6E57                          ; $6E60: $20 $F5

    scf                                           ; $6E62: $37

jr_020_6E63:
    pop  hl                                       ; $6E63: $E1
    ret                                           ; $6E64: $C9

; Sprite table for overworld?
Data_020_6E65::
    db   $03, $04, $09, $5E, $91, $A1, $AA, $C4, $C6, $CC, $DB, $E1, $E3, $E8

TilesetTables::

; Constants for Overworld tilesets
; See W_TILESET_* constants for values
OverworldTilesetsTable::
    db   $1C, $1C, $3E, $3C, $3E, $3E, $3E, $30
    db   $0F, $36, $36, $1A, $0F, $34, $0F, $3E
    db   $20, $20, $0F, $38, $28, $28, $32, $32
    db   $20, $20, $38, $38, $28, $28, $32, $32
    db   $0F, $26, $0F, $24, $0F, $1E, $2A, $0F
    db   $26, $26, $2E, $2E, $0F, $2A, $2A, $2A
    db   $0F, $24, $2E, $2E, $3A, $0F, $26, $2C
    db   $22, $22, $22, $0F, $3A, $3A, $0F, $2C

; Constants for Indoors tilesets
; See W_TILESET_* constants for values
IndoorsTilesetsTable::
    db   $FF, $00, $00, $00, $FF, $01, $00, $05, $00, $09, $00, $00, $05, $05, $05, $FF
    db   $00, $00, $FF, $FF, $02, $01, $01, $01, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $00, $FF, $00, $FF, $00, $FF, $FF, $02, $00, $FF, $0E
    db   $FF, $FF, $FF, $FF, $FF, $FF, $01, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $02, $02, $FF, $02, $02, $09, $09, $FF, $02, $02, $09, $02, $09, $09, $09, $09
    db   $09, $FF, $01, $01, $05, $00, $00, $00, $00, $0A, $0A, $0A, $0A, $00, $00, $00
    db   $09, $00, $00, $09, $09, $00, $00, $09, $09, $09, $09, $00, $00, $FF, $02, $FF
    db   $09, $00, $00, $FF, $00, $00, $00, $FF, $FF, $00, $01, $05, $00, $00, $00, $00
    db   $FF, $05, $FF, $FF, $FF, $06, $07, $07, $07, $FF, $FF, $06, $06, $FF, $FF, $FF
    db   $09, $FF, $FF, $FF, $07, $FF, $FF, $07, $FF, $07, $05, $FF, $FF, $05, $05, $05
    db   $FF, $01, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $19, $FF, $FF, $FF
    db   $03, $0E, $03, $0E, $FF, $0E, $0E, $0E, $0E, $0E, $0E, $FF, $0E, $0E, $FF, $0E
    db   $0E, $0E, $0E, $09, $00, $0E, $09, $FF, $FF, $0E, $09, $00, $0E, $FF, $02, $0E
    db   $0E, $0E, $02, $FF, $01, $01, $01, $09, $00, $00, $00, $00, $00, $00, $00, $00
    db   $0F, $0F, $0F, $08, $00, $0C, $0C, $03, $0C, $0C, $0C, $00, $00, $00, $0C, $00
    db   $03, $03, $00, $19, $00, $08, $0C, $03, $0C, $0C, $08, $19, $0C, $05, $0C, $00

    db   $00, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $FF, $01, $FF
    db   $03, $03, $03, $FF, $03, $03, $FF, $0B, $FF, $03, $FF, $FF, $FF, $07, $07, $FF
    db   $FF, $06, $FF, $FF, $00, $FF, $FF, $FF, $FF, $0E, $0E, $FF, $FF, $0E, $0E, $00
    db   $FF, $00, $FF, $FF, $FF, $FF, $FF, $00, $FF, $17, $17, $17, $FF, $03, $FF, $FF
    db   $FF, $FF, $0A, $0A, $0A, $FF, $FF, $FF, $0A, $0A, $FF, $0B, $FF, $0D, $FF, $FF
    db   $0A, $0A, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $09, $01, $00, $00
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $01
    db   $0C, $FF, $FF, $FF, $1A, $FF, $FF, $FF, $FF, $FF, $0C, $0C, $0C, $0C, $0C, $01
    db   $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $05, $05, $05, $01
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $04, $05, $04, $04, $04, $00, $08
    db   $04, $04, $08, $08, $00, $08, $08, $08, $08, $08, $08, $05, $05, $08, $0C, $0C
    db   $08, $04, $05, $0C, $04, $08, $05, $05, $0C, $0C, $0C, $0C, $0C, $05, $0C, $0C
    db   $0C, $0C, $03, $03, $00, $03, $FF, $08, $00, $0C, $0C, $04, $04, $0C, $0C, $0C
    db   $0C, $0C, $FF, $01, $00, $01, $01, $08, $00, $08, $08, $08, $08, $08, $0C, $0C
    db   $FF, $08, $08, $04, $0C, $0C, $0C, $0C, $00, $08, $0C, $0C, $0C, $0C, $0C, $0C
    db   $0C, $0C, $0C, $0C, $0C, $00, $0C, $0C, $00, $0C, $0C, $18, $05, $00, $08, $00

; Constants for Color Dungeon tilesets
; See W_TILESET_* constants for values
ColorDungeonTilesetsTable::
    db   $00, $00, $0B, $0B, $00, $00, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0E
    db   $0B, $0B, $0B, $18, $0B, $0B, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

data_020_70D3::
    db   $65, $66, $67, $68, $69, $6D, $45, $46   ; $70D3
    db   $46, $00, $4E, $4E, $4E, $4E, $44, $50   ; $70DB
    db   $20, $74, $6B, $6C, $6D, $6D, $37, $37   ; $70E3
    db   $4F, $1C, $4F, $4E, $4E, $4E, $50, $4E   ; $70EB
    db   $02, $7D, $00, $0E, $48, $47, $37, $06   ; $70F3
    db   $06, $00, $51, $50, $50, $62, $62, $62   ; $70FB
    db   $02, $7D, $00, $0E, $48, $47, $37, $06   ; $7103
    db   $06, $00, $51, $51, $00, $62, $62, $62   ; $710B
    db   $00, $41, $7E, $7E, $7A, $06, $28, $28   ; $7113
    db   $11, $11, $64, $63, $2D, $2D, $2D, $2D   ; $711B
    db   $01, $2E, $74, $7F, $38, $28, $28, $29   ; $7123
    db   $11, $11, $11, $64, $2D, $2D, $2D, $2D   ; $712B
    db   $00, $00, $7E, $00, $00, $28, $29, $05   ; $7133
    db   $58, $59, $5A, $00, $2D, $2D, $2D, $2D   ; $713B
    db   $7E, $7E, $7E, $7E, $3A, $3A, $28, $29   ; $7143
    db   $5B, $5C, $00, $12, $2D, $2D, $2D, $2D   ; $714B
    db   $3D, $03, $0A, $0B, $39, $61, $18, $18   ; $7153
    db   $4A, $2C, $72, $00, $2A, $6F, $2D, $2D   ; $715B
    db   $00, $00, $43, $0A, $40, $3E, $00, $00   ; $7163
    db   $75, $5F, $73, $70, $2A, $6F, $2D, $2D   ; $716B
    db   $13, $0C, $0A, $00, $3B, $00, $3B, $3B   ; $7173
    db   $5F, $54, $37, $71, $6E, $6E, $6E, $00   ; $717B
    db   $0F, $0C, $09, $09, $00, $3B, $3B, $3B   ; $7183
    db   $77, $72, $70, $4B, $6E, $6E, $6E, $6E   ; $718B
    db   $08, $08, $07, $07, $3C, $3C, $3C, $00   ; $7193
    db   $78, $23, $26, $57, $34, $35, $1D, $7B   ; $719B
    db   $07, $07, $07, $07, $3C, $3C, $3C, $7A   ; $71A3
    db   $79, $26, $1F, $53, $2F, $34, $00, $4D   ; $71AB
    db   $07, $07, $00, $42, $00, $90, $91, $26   ; $71B3
    db   $26, $25, $36, $33, $31, $30, $7C, $4D   ; $71BB
    db   $07, $07, $07, $00, $90, $90, $91, $00   ; $71C3
    db   $1F, $26, $1F, $00, $30, $21, $4C, $7C   ; $71CB
    db   $01, $03, $0E, $07, $07, $00, $05, $01   ; $71D3
    db   $00, $03, $1C, $05, $01, $01, $01, $00   ; $71DB
    db   $00, $02, $00, $03, $03, $03, $03, $03   ; $71E3
    db   $33, $33, $33, $33, $00, $00, $63, $63   ; $71EB
    db   $14, $00, $14, $14, $00, $06, $13, $06   ; $71F3
    db   $13, $13, $0E, $08, $13, $08, $06, $07   ; $71FB
    db   $06, $06, $00, $00, $1B, $1B, $06, $1B   ; $7203
    db   $06, $00, $33, $33, $33, $33, $33, $33   ; $720B
    db   $18, $18, $18, $18, $00, $15, $00, $00   ; $7213
    db   $17, $00, $17, $17, $06, $17, $06, $00   ; $721B
    db   $18, $3C, $3C, $3C, $17, $17, $17, $17   ; $7223
    db   $17, $0E, $16, $00, $17, $01, $33, $33   ; $722B
    db   $00, $00, $0E, $31, $19, $30, $32, $32   ; $7233
    db   $00, $00, $32, $32, $00, $32, $30, $30   ; $723B
    db   $00, $30, $32, $00, $30, $30, $00, $30   ; $7243
    db   $30, $30, $30, $30, $33, $33, $00, $01   ; $724B
    db   $1E, $1E, $0F, $1E, $1E, $1D, $00, $00   ; $7253
    db   $24, $24, $24, $00, $24, $24, $24, $24   ; $725B
    db   $24, $00, $1E, $1F, $1F, $1E, $1E, $04   ; $7263
    db   $04, $00, $00, $04, $04, $04, $04, $04   ; $726B
    db   $04, $04, $33, $33, $33, $33, $33, $33   ; $7273
    db   $33, $33, $64, $64, $80, $00, $00, $00   ; $727B
    db   $28, $28, $28, $28, $61, $0F, $61, $00   ; $7283
    db   $00, $28, $28, $00, $25, $26, $61, $29   ; $728B
    db   $27, $00, $28, $61, $00, $26, $00, $29   ; $7293
    db   $2A, $00, $00, $62, $00, $61, $00, $27   ; $729B
    db   $61, $61, $27, $27, $27, $27, $00, $61   ; $72A3
    db   $63, $63, $33, $33, $33, $33, $00, $00   ; $72AB
    db   $44, $44, $44, $00, $4A, $67, $67, $00   ; $72B3
    db   $7F, $00, $00, $33, $33, $00, $6E, $1A   ; $72BB
    db   $67, $67, $00, $80, $4A, $7E, $67, $00   ; $72C3
    db   $7F, $7F, $3D, $80, $10, $00, $6E, $1A   ; $72CB
    db   $00, $00, $3F, $2C, $2C, $5E, $34, $39   ; $72D3
    db   $00, $5F, $60, $3E, $39, $2B, $2B, $00   ; $72DB
    db   $39, $2D, $2D, $2D, $2D, $2D, $2D, $2E   ; $72E3
    db   $2D, $2D, $2D, $2E, $00, $2D, $2D, $00   ; $72EB
    db   $36, $00, $35, $0F, $37, $35, $35, $00   ; $72F3
    db   $37, $00, $38, $35, $0F, $35, $38, $01   ; $72FB
    db   $0F, $5C, $56, $00, $50, $5C, $00, $51   ; $7303
    db   $56, $58, $5B, $5B, $00, $54, $00, $51   ; $730B
    db   $5A, $00, $59, $59, $00, $57, $5A, $59   ; $7313
    db   $59, $00, $5C, $5C, $52, $00, $55, $00   ; $731B
    db   $5C, $5C, $00, $53, $52, $52, $00, $5B   ; $7323
    db   $00, $5C, $00, $53, $52, $5B, $5A, $53   ; $732B
    db   $33, $33, $33, $33, $33, $33, $33, $33   ; $7333
    db   $33, $33, $33, $33, $01, $01, $01, $3D   ; $733B
    db   $01, $01, $01, $01, $6F, $01, $01, $01   ; $7343
    db   $01, $01, $01, $01, $01, $01, $01, $3D   ; $734B
    db   $66, $66, $66, $01, $01, $66, $66, $66   ; $7353
    db   $65, $65, $65, $65, $66, $66, $65, $3D   ; $735B
    db   $65, $65, $65, $65, $66, $66, $66, $0D   ; $7363
    db   $0D, $09, $65, $09, $09, $09, $00, $49   ; $736B
    db   $10, $11, $20, $2F, $01, $0A, $0A, $0B   ; $7373
    db   $0C, $09, $4B, $65, $65, $4C, $65, $65   ; $737B
    db   $10, $12, $0B, $65, $09, $01, $65, $65   ; $7383
    db   $65, $65, $65, $65, $65, $65, $0D, $0D   ; $738B
    db   $00, $00, $21, $21, $21, $21, $21, $22   ; $7393
    db   $66, $65, $65, $09, $09, $66, $0D, $0D   ; $739B
    db   $67, $67, $21, $21, $21, $21, $21, $40   ; $73A3
    db   $66, $41, $7D, $4D, $4D, $46, $66, $66   ; $73AB
    db   $3A, $4E, $3A, $09, $66, $66, $65, $65   ; $73B3
    db   $3B, $47, $65, $65, $65, $65, $65, $65   ; $73BB
    db   $3A, $67, $67, $67, $66, $7C, $65, $65   ; $73C3
    db   $3B, $67, $67, $43, $01, $45, $48, $00   ; $73CB
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $73D3
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $73DB
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $73E3
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $73EB

data_020_73F3::
    db   $A4, $FF, $FF, $FF, $A4, $8E, $7C, $C8   ; $73F3
    db   $A4, $4A, $7C, $93, $A4, $E5, $FF, $4E   ; $73FB
    db   $A4, $91, $83, $A2, $A4, $42, $8A, $FF   ; $7403
    db   $A4, $42, $83, $A2, $A4, $81, $E3, $A2   ; $740B
    db   $A4, $E5, $E3, $FF, $A4, $E5, $43, $E7   ; $7413
    db   $A4, $E5, $E6, $FF, $A4, $E5, $E6, $E7   ; $741B
    db   $A4, $E5, $43, $A4, $A4, $8E, $83, $A4   ; $7423
    db   $A4, $4A, $83, $40, $A4, $E5, $4C, $E7   ; $742B
    db   $A4, $4D, $83, $FF, $A4, $42, $92, $5A   ; $7433
    db   $A4, $61, $92, $67, $A4, $E5, $FF, $FF   ; $743B
    db   $A4, $E3, $8B, $FF, $A4, $E3, $83, $76   ; $7443
    db   $A4, $81, $79, $76, $A4, $61, $8B, $FF   ; $744B
    db   $A4, $6C, $8B, $6B, $A4, $FF, $8B, $FF   ; $7453
    db   $A4, $E3, $8B, $A2, $A4, $E5, $FF, $FF   ; $745B
    db   $A4, $4A, $8F, $6D, $A4, $81, $6E, $52   ; $7463
    db   $A4, $4D, $43, $A2, $A4, $61, $79, $76   ; $746B
    db   $A4, $C6, $7C, $41, $A4, $C5, $6E, $6F   ; $7473
    db   $A4, $C5, $FF, $70, $A4, $61, $FF, $71   ; $747B
    db   $A4, $61, $FF, $72, $A4, $61, $79, $73   ; $7483
    db   $A4, $61, $79, $FF, $A4, $E3, $79, $76   ; $748B
    db   $A4, $42, $82, $A2, $A4, $42, $FF, $82   ; $7493
    db   $A4, $61, $78, $A2, $A4, $81, $8F, $E7   ; $749B
    db   $A4, $E3, $8B, $8C, $A4, $87, $78, $A2   ; $74A3
    db   $A4, $6C, $7C, $C8, $A4, $C4, $E6, $CF   ; $74AB
    db   $A4, $FF, $6E, $6F, $A4, $FF, $E6, $CF   ; $74B3
    db   $A4, $FF, $83, $FF, $A4, $C4, $79, $76   ; $74BB
    db   $A4, $C4, $FF, $FF, $A4, $C4, $43, $CF   ; $74C3
    db   $A4, $FF, $79, $FF, $A4, $FF, $FF, $A2   ; $74CB
    db   $A4, $61, $79, $A2, $A4, $E5, $FF, $FF   ; $74D3
    db   $A4, $E5, $82, $A2, $A4, $E3, $83, $A2   ; $74DB
    db   $A4, $91, $83, $76, $A4, $FF, $7C, $A2   ; $74E3
    db   $A4, $E3, $8B, $A2, $A4, $E3, $FF, $76   ; $74EB
    db   $A4, $FF, $E6, $A2, $A4, $FF, $7C, $A2   ; $74F3
    db   $A4, $81, $E3, $D4, $A4, $E5, $E6, $DC   ; $74FB
    db   $A4, $87, $D6, $D7, $A4, $50, $51, $A2   ; $7503
    db   $A4, $6C, $8F, $A2, $A4, $4A, $83, $A2   ; $750B
    db   $A4, $4A, $83, $FF, $A4, $81, $8F, $76   ; $7513
    db   $A4, $E3, $8B, $FF, $A4, $FF, $79, $FF   ; $751B
    db   $A4, $81, $6E, $FF, $A4, $81, $6E, $8C   ; $7523
    db   $A4, $87, $8F, $76, $A4, $FF, $8F, $FF   ; $752B
    db   $A4, $87, $FF, $FF, $A4, $87, $83, $76   ; $7533
    db   $A4, $87, $83, $98, $A4, $FF, $79, $76   ; $753B
    db   $A4, $E3, $83, $A2, $A4, $61, $79, $93   ; $7543
    db   $A4, $FF, $79, $93, $A4, $C4, $79, $FF   ; $754B
    db   $A4, $FF, $92, $5A, $A4, $61, $92, $8C   ; $7553
    db   $A4, $42, $92, $FF, $A4, $61, $FF, $FF   ; $755B
    db   $A4, $61, $FF, $8C, $A4, $FF, $83, $93   ; $7563
    db   $A4, $61, $8B, $FF, $A4, $E3, $FF, $FF   ; $756B
    db   $A4, $61, $FF, $67, $A4, $FF, $FF, $A2   ; $7573
    db   $A4, $87, $E3, $93, $A4, $87, $FF, $FF   ; $757B
    db   $A4, $87, $92, $5A, $A4, $C6, $9C, $98   ; $7583
    db   $A4, $C6, $9C, $FF, $A4, $FF, $9C, $93   ; $758B
    db   $A4, $81, $FF, $FF, $A4, $FF, $9C, $98   ; $7593
    db   $A4, $FF, $83, $FF, $A4, $81, $FF, $93   ; $759B
    db   $A4, $81, $9C, $93, $A4, $44, $9C, $98   ; $75A3
    db   $A4, $91, $78, $A2, $A4, $FF, $78, $A2   ; $75AB
    db   $A4, $61, $FF, $A2, $A4, $FF, $79, $A2   ; $75B3
    db   $A4, $61, $83, $FF, $A4, $FF, $83, $A2   ; $75BB
    db   $A4, $FF, $7C, $FF, $A4, $E3, $8B, $A2   ; $75C3
    db   $A4, $E3, $83, $FF, $A4, $FF, $83, $76   ; $75CB
    db   $A4, $61, $83, $FF, $A4, $61, $FF, $76   ; $75D3
    db   $A4, $61, $FF, $A2, $A4, $81, $6E, $FF   ; $75DB
    db   $A4, $81, $FF, $8C, $A4, $4A, $7C, $93   ; $75E3
    db   $A4, $91, $7C, $A2, $A4, $4D, $7C, $FF   ; $75EB
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $75F3
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $75FB
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $7603
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $760B
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $7613
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $761B
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $7623
    db   $A4, $FF, $FF, $FF, $A4, $FF, $FF, $FF   ; $762B
    db   $A4, $81, $8F, $D4, $A4, $81, $79, $FF   ; $7633

data_020_763B::
    db   $FF, $FF, $FF, $FF, $90, $91, $92, $98   ; $763B
    db   $90, $91, $AB, $FF, $90, $91, $92, $93   ; $7643
    db   $90, $91, $94, $9F, $90, $91, $B0, $B1   ; $764B
    db   $90, $91, $9C, $93, $90, $91, $97, $9B   ; $7653
    db   $FF, $FF, $B6, $B7, $A4, $4C, $49, $46   ; $765B
    db   $A4, $FF, $45, $6D, $A4, $FF, $47, $48   ; $7663
    db   $A4, $FF, $4C, $4B, $90, $91, $96, $FF   ; $766B
    db   $FF, $FF, $4F, $50, $FF, $FF, $4F, $51   ; $7673
    db   $A4, $87, $84, $89, $A4, $FF, $88, $C7   ; $767B
    db   $A0, $A1, $84, $83, $90, $91, $54, $A6   ; $7683
    db   $90, $91, $97, $93, $90, $91, $AA, $FF   ; $768B
    db   $90, $91, $B4, $B5, $90, $91, $9C, $9E   ; $7693
    db   $90, $91, $9C, $9D, $68, $91, $56, $60   ; $769B
    db   $AC, $AD, $AE, $AF, $90, $91, $58, $9B   ; $76A3
    db   $90, $91, $A6, $59, $FF, $FF, $B8, $B9   ; $76AB
    db   $90, $91, $62, $63, $90, $91, $A8, $9F   ; $76B3
    db   $A4, $DF, $A3, $FF, $90, $91, $92, $9A   ; $76BB
    db   $A4, $5B, $5C, $FF, $A6, $91, $97, $9B   ; $76C3
    db   $90, $91, $9C, $60, $FF, $FF, $B2, $B3   ; $76CB
    db   $A6, $91, $57, $FF, $A6, $91, $95, $98   ; $76D3
    db   $A6, $91, $5E, $60, $A6, $91, $AA, $93   ; $76DB
    db   $A6, $91, $58, $99, $90, $91, $95, $93   ; $76E3
    db   $5F, $91, $55, $99, $66, $91, $5E, $59   ; $76EB
    db   $66, $91, $54, $59, $8D, $8E, $8F, $6A   ; $76F3
    db   $68, $91, $9B, $60, $68, $91, $94, $9F   ; $76FB
    db   $68, $91, $9C, $60, $5F, $65, $5D, $64   ; $7703
    db   $FF, $91, $55, $FF, $5F, $91, $95, $99   ; $770B
    db   $5F, $91, $5E, $99, $5F, $91, $A9, $FF   ; $7713
    db   $5F, $91, $94, $9F, $90, $91, $55, $93   ; $771B
    db   $A4, $FF, $7C, $FF, $BC, $BD, $BE, $BF   ; $7723
    db   $A6, $91, $9C, $9D, $FF, $D5, $78, $53   ; $772B
    db   $90, $91, $FF, $FF, $5F, $91, $55, $98   ; $7733
    db   $A4, $FF, $FF, $69, $A4, $FF, $4C, $74   ; $773B
    db   $A0, $A1, $75, $4E, $A4, $7D, $7E, $7F   ; $7743
    db   $A4, $FF, $FF, $C7, $C0, $C1, $C2, $C3   ; $774B
    db   $A4, $CC, $CD, $CE, $A4, $C9, $CA, $CB   ; $7753
    db   $A4, $D1, $D2, $6A, $DD, $E5, $D3, $DD   ; $775B
    db   $DD, $FF, $DE, $FF, $A4, $8D, $FF, $FF   ; $7763
    db   $FF, $DF, $49, $FF, $FF, $C4, $FF, $FF   ; $776B
    db   $A4, $80, $7C, $A5, $FF, $FF, $FF, $FF   ; $7773
    db   $FF, $FF, $BA, $BB, $77, $91, $A7, $FF   ; $777B
    db   $7B, $91, $7A, $AB, $7B, $91, $57, $99   ; $7783
    db   $77, $91, $7A, $AA, $7B, $91, $54, $99   ; $778B
    db   $7B, $91, $56, $FF, $77, $91, $54, $99   ; $7793
    db   $7B, $91, $FF, $FF, $5F, $91, $9D, $99   ; $779B
    db   $7B, $91, $96, $99, $7B, $91, $7A, $99   ; $77A3
    db   $77, $91, $7A, $99, $77, $91, $96, $99   ; $77AB
    db   $5F, $91, $55, $93, $FF, $91, $95, $93   ; $77B3
    db   $90, $91, $55, $93, $A6, $91, $95, $60   ; $77BB
    db   $A6, $91, $95, $99, $5F, $D9, $DA, $DB   ; $77C3
    db   $5F, $D9, $DA, $64, $FF, $91, $90, $76   ; $77CB
    db   $FF, $91, $90, $98, $FF, $4A, $90, $76   ; $77D3
    db   $5F, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $77DB
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $77E3
    db   $FF, $FF, $FF, $FF, $FF, $91, $90, $A6   ; $77EB
    db   $A4, $FF, $FF, $F4, $E8, $E9, $EA, $EB   ; $77F3
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $77FB
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7803
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $780B
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7813
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $781B
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7823
    db   $44, $A1, $75, $4E, $FF, $61, $FF, $FF   ; $782B
    db   $A4, $FF, $86, $FF, $A4, $FF, $8B, $FF   ; $7833
    db   $A4, $4D, $FF, $FF                       ; $783B

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

; Copy palette data to $DC10
; (Called during the Credits water geyser sequence; to animate the water?)
func_020_78ED::
    ld   a, [wCreditsScratch0]                    ; $78ED: $FA $00 $D0
    sla  a                                        ; $78F0: $CB $27
    ld   e, a                                     ; $78F2: $5F
    ld   d, $00                                   ; $78F3: $16 $00
    ld   hl, EndingWaterGeyserPalettes            ; $78F5: $21 $3F $78
    add  hl, de                                   ; $78F8: $19
    ld   a, [hl+]                                 ; $78F9: $2A
    ld   b, a                                     ; $78FA: $47
    ld   h, [hl]                                  ; $78FB: $66
    ld   l, b                                     ; $78FC: $68

    ld   bc, $38                                  ; $78FD: $01 $38 $00
    ld   de, $DC10                                ; $7900: $11 $10 $DC
    call CopyData                                 ; $7903: $CD $14 $29

    xor  a                                        ; $7906: $AF
    ld   [wPaletteUnknownC], a                    ; $7907: $EA $D3 $DD
    ld   a, $1C                                   ; $790A: $3E $1C
    ld   [wPaletteUnknownD], a                    ; $790C: $EA $D4 $DD
    ld   a, $81                                   ; $790F: $3E $81
    ld   [wPaletteDataFlags], a                   ; $7911: $EA $D1 $DD
    ret                                           ; $7914: $C9

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
    push bc                                       ; $7BA5: $C5
    ldh  a, [hActiveEntityVisualPosY]             ; $7BA6: $F0 $EC
    swap a                                        ; $7BA8: $CB $37
    and  $0F                                      ; $7BAA: $E6 $0F
    ld   e, a                                     ; $7BAC: $5F
    ld   d, b                                     ; $7BAD: $50
    ld   hl, Data_020_7B95                        ; $7BAE: $21 $95 $7B
    add  hl, de                                   ; $7BB1: $19
    ld   b, [hl]                                  ; $7BB2: $46
    ld   hl, Data_020_7915                        ; $7BB3: $21 $15 $79
    ldh  a, [hActiveEntitySpriteVariant]          ; $7BB6: $F0 $F1
    cp   $05                                      ; $7BB8: $FE $05
    jr   z, jr_020_7BFC                           ; $7BBA: $28 $40

    and  a                                        ; $7BBC: $A7
    jr   z, jr_020_7BD4                           ; $7BBD: $28 $15

    ld   hl, Data_020_7995                        ; $7BBF: $21 $95 $79

jr_020_7BC2:
    dec  a                                        ; $7BC2: $3D
    jr   z, jr_020_7BD4                           ; $7BC3: $28 $0F

    ld   hl, Data_020_7A15                        ; $7BC5: $21 $15 $7A
    dec  a                                        ; $7BC8: $3D
    jr   z, jr_020_7BD4                           ; $7BC9: $28 $09

    ld   hl, Data_020_7A95                        ; $7BCB: $21 $95 $7A

jr_020_7BCE:
    dec  a                                        ; $7BCE: $3D
    jr   z, jr_020_7BD4                           ; $7BCF: $28 $03

    ld   hl, Data_020_7B15                        ; $7BD1: $21 $15 $7B

jr_020_7BD4:
    ld   de, $C00C                                ; $7BD4: $11 $0C $C0
    ld   c, $00                                   ; $7BD7: $0E $00

.loop
    ld   a, c                                     ; $7BD9: $79
    and  $03                                      ; $7BDA: $E6 $03
    cp   $00                                      ; $7BDC: $FE $00
    jr   nz, .jr_020_7BE4                         ; $7BDE: $20 $04

    ldh  a, [hActiveEntityVisualPosY]             ; $7BE0: $F0 $EC
    jr   .jr_020_7BF0                             ; $7BE2: $18 $0C

.jr_020_7BE4
    cp   $01                                      ; $7BE4: $FE $01
    jr   nz, .jr_020_7BF3                         ; $7BE6: $20 $0B

    push hl                                       ; $7BE8: $E5
    ld   hl, wScreenShakeHorizontal               ; $7BE9: $21 $55 $C1
    ldh  a, [hActiveEntityPosX]                   ; $7BEC: $F0 $EE
    sub  [hl]                                     ; $7BEE: $96
    pop  hl                                       ; $7BEF: $E1

.jr_020_7BF0
    add  [hl]                                     ; $7BF0: $86
    jr   .jr_020_7BF4                             ; $7BF1: $18 $01

.jr_020_7BF3
    ld   a, [hl]                                  ; $7BF3: $7E
.jr_020_7BF4
    ld   [de], a                                  ; $7BF4: $12
    inc  hl                                       ; $7BF5: $23
    inc  de                                       ; $7BF6: $13
    inc  c                                        ; $7BF7: $0C
    ld   a, c                                     ; $7BF8: $79
    cp   b                                        ; $7BF9: $B8
    jr   nz, .loop                                ; $7BFA: $20 $DD

jr_020_7BFC:
    pop  bc                                       ; $7BFC: $C1
    ret                                           ; $7BFD: $C9

Data_020_7BFE::
    db   $48, $71, $31, $56, $31, $56, $9C, $73
    db   $27, $65, $EF, $4D, $EF, $4D, $39, $67
    db   $06, $69, $AD, $45, $AD, $45, $D6, $5A
    db   $E5, $4C, $6B, $3D, $6B, $3D, $73, $4E
    db   $A4, $3C, $29, $31, $29, $31, $EF, $3D

func_020_7C26::
    ld   a, [$D00D]                               ; $7C26: $FA $0D $D0
    cp   $50                                      ; $7C29: $FE $50
    ret  nc                                       ; $7C2B: $D0

    ld   b, a                                     ; $7C2C: $47
    and  $0F                                      ; $7C2D: $E6 $0F
    ret  nz                                       ; $7C2F: $C0

    ld   a, b                                     ; $7C30: $78
    and  $F0                                      ; $7C31: $E6 $F0
    srl  a                                        ; $7C33: $CB $3F
    ld   c, a                                     ; $7C35: $4F
    ld   b, $00                                   ; $7C36: $06 $00
    push bc                                       ; $7C38: $C5

    ld   hl, Data_020_7BFE                        ; $7C39: $21 $FE $7B
    add  hl, bc                                   ; $7C3C: $09
    ld   bc, $08                                  ; $7C3D: $01 $08 $00
    ld   de, $DC10                                ; $7C40: $11 $10 $DC
    call CopyData                                 ; $7C43: $CD $14 $29

    pop  bc                                       ; $7C46: $C1
    ld   a, c                                     ; $7C47: $79
    cp   $20                                      ; $7C48: $FE $20
    jr   z, jr_020_7C50                           ; $7C4A: $28 $04

    ld   a, $04                                   ; $7C4C: $3E $04
    jr   jr_020_7C5B                              ; $7C4E: $18 $0B

jr_020_7C50:
    ld   hl, $DC48                                ; $7C50: $21 $48 $DC
    ld   a, $A4                                   ; $7C53: $3E $A4
    ld   [hl+], a                                 ; $7C55: $22
    ld   a, $3C                                   ; $7C56: $3E $3C
    ld   [hl], a                                  ; $7C58: $77
    ld   a, $20                                   ; $7C59: $3E $20

jr_020_7C5B:
    ld   [wPaletteUnknownD], a                    ; $7C5B: $EA $D4 $DD
    xor  a                                        ; $7C5E: $AF
    ld   [wPaletteUnknownC], a                    ; $7C5F: $EA $D3 $DD
    ld   a, $81                                   ; $7C62: $3E $81
    ld   [wPaletteDataFlags], a                   ; $7C64: $EA $D1 $DD
    ret                                           ; $7C67: $C9

Data_020_7C68::
    db   $00, $19, $5B, $06, $03, $10, $5A, $06, $05, $08, $59, $06

Data_020_7C74::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ; $7C74
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ; $7C7C
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ; $7C84
    db   $08, $08, $C1, $05, $00, $08, $C0, $05   ; $7C8C
    db   $10, $00, $5D, $05, $08, $00, $5C, $05   ; $7C94

Data_020_7C9C::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ; $7C9C
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ; $7CA4
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ; $7CAC
    db   $08, $08, $C1, $05, $00, $08, $C0, $05   ; $7CB4
    db   $10, $00, $5F, $05, $08, $00, $5E, $05   ; $7CBC

Data_020_7CC4::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ; $7CC4
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ; $7CCC
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ; $7CD4
    db   $08, $08, $D1, $05, $00, $08, $D0, $05   ; $7CDC
    db   $10, $00, $ED, $05, $08, $00, $EC, $05   ; $7CE4

Data_020_7CEC::
    db   $08, $20, $EB, $05, $00, $20, $EA, $05   ; $7CEC
    db   $08, $18, $DF, $05, $00, $18, $DE, $05   ; $7CF4
    db   $08, $10, $CF, $05, $00, $10, $CE, $05   ; $7CFC
    db   $08, $08, $D1, $05, $00, $08, $D0, $05   ; $7D04
    db   $10, $00, $EF, $05, $08, $00, $EE, $05   ; $7D0C

Data_020_7D14::
    dw   Data_020_7C74
    dw   Data_020_7C9C
    dw   Data_020_7CC4
    dw   Data_020_7CEC

func_020_7D1C::
    ld   a, $6C                                   ; $7D1C: $3E $6C
    ld   [wOAMNextAvailableSlot], a               ; $7D1E: $EA $C0 $C3
    ldh  a, [hFrameCounter]                       ; $7D21: $F0 $E7
    and  $60                                      ; $7D23: $E6 $60
    swap a                                        ; $7D25: $CB $37
    ld   e, a                                     ; $7D27: $5F
    ld   d, $00                                   ; $7D28: $16 $00
    ld   hl, Data_020_7D14                        ; $7D2A: $21 $14 $7D
    add  hl, de                                   ; $7D2D: $19
    ld   a, [hl+]                                 ; $7D2E: $2A
    ld   d, a                                     ; $7D2F: $57
    ld   h, [hl]                                  ; $7D30: $66
    ld   l, d                                     ; $7D31: $6A
    ld   c, $28                                   ; $7D32: $0E $28
    call func_020_7D40                            ; $7D34: $CD $40 $7D
    ld   hl, Data_020_7C68                        ; $7D37: $21 $68 $7C
    ld   c, $0C                                   ; $7D3A: $0E $0C
    call func_020_7D40                            ; $7D3C: $CD $40 $7D
    ret                                           ; $7D3F: $C9

func_020_7D40::
    push bc                                       ; $7D40: $C5
    push hl                                       ; $7D41: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $7D42: $FA $C0 $C3
    ld   e, a                                     ; $7D45: $5F
    ld   d, $00                                   ; $7D46: $16 $00
    ld   hl, wOAMBuffer                           ; $7D48: $21 $00 $C0
    add  hl, de                                   ; $7D4B: $19
    ld   d, h                                     ; $7D4C: $54
    ld   e, l                                     ; $7D4D: $5D
    pop  hl                                       ; $7D4E: $E1
    ld   a, c                                     ; $7D4F: $79
    srl  a                                        ; $7D50: $CB $3F
    srl  a                                        ; $7D52: $CB $3F
    ld   c, a                                     ; $7D54: $4F

jr_020_7D55:
    ldh  a, [hActiveEntityVisualPosY]             ; $7D55: $F0 $EC
    add  [hl]                                     ; $7D57: $86
    ld   [de], a                                  ; $7D58: $12
    inc  de                                       ; $7D59: $13
    inc  hl                                       ; $7D5A: $23
    ldh  a, [hActiveEntityPosX]                   ; $7D5B: $F0 $EE
    add  [hl]                                     ; $7D5D: $86
    ld   [de], a                                  ; $7D5E: $12
    inc  de                                       ; $7D5F: $13
    inc  hl                                       ; $7D60: $23
    ld   a, [hl+]                                 ; $7D61: $2A
    ld   [de], a                                  ; $7D62: $12
    inc  de                                       ; $7D63: $13
    ld   a, [hl+]                                 ; $7D64: $2A
    ld   [de], a                                  ; $7D65: $12
    inc  de                                       ; $7D66: $13
    dec  c                                        ; $7D67: $0D
    jr   nz, jr_020_7D55                          ; $7D68: $20 $EB

    pop  bc                                       ; $7D6A: $C1
    ld   a, [wOAMNextAvailableSlot]               ; $7D6B: $FA $C0 $C3
    add  c                                        ; $7D6E: $81
    cp   $A0                                      ; $7D6F: $FE $A0
    jr   c, jr_020_7D74                           ; $7D71: $38 $01

    xor  a                                        ; $7D73: $AF

jr_020_7D74:
    ld   [wOAMNextAvailableSlot], a               ; $7D74: $EA $C0 $C3
    ld   a, [wActiveEntityIndex]                  ; $7D77: $FA $23 $C1
    ld   c, a                                     ; $7D7A: $4F
    ret                                           ; $7D7B: $C9

func_020_7D7C::
    ld   a, $03                                   ; $7D7C: $3E $03
    ldh  [hScratchD], a                           ; $7D7E: $E0 $E4
    ld   a, $06                                   ; $7D80: $3E $06
    ldh  [hScratchE], a                           ; $7D82: $E0 $E5
    ld   a, $0C                                   ; $7D84: $3E $0C
    ldh  [hFreeWarpDataAddress], a                ; $7D86: $E0 $E6
    ld   hl, $DC10                                ; $7D88: $21 $10 $DC
    ld   d, $24                                   ; $7D8B: $16 $24
    call jr_020_7D97                              ; $7D8D: $CD $97 $7D
    ld   a, $01                                   ; $7D90: $3E $01
    ld   [wPaletteDataFlags], a                   ; $7D92: $EA $D1 $DD
    xor  a                                        ; $7D95: $AF
    ret                                           ; $7D96: $C9

jr_020_7D97:
    push hl                                       ; $7D97: $E5
    ldh  a, [hScratchD]                           ; $7D98: $F0 $E4
    ld   c, a                                     ; $7D9A: $4F
    ld   a, [hl]                                  ; $7D9B: $7E
    and  $1F                                      ; $7D9C: $E6 $1F
    jr   z, jr_020_7DA4                           ; $7D9E: $28 $04

    sub  c                                        ; $7DA0: $91
    jr   nc, jr_020_7DA4                          ; $7DA1: $30 $01

    xor  a                                        ; $7DA3: $AF

jr_020_7DA4:
    ldh  [hScratch0], a                           ; $7DA4: $E0 $D7
    ldh  a, [hScratchE]                           ; $7DA6: $F0 $E5
    ld   c, a                                     ; $7DA8: $4F
    ld   a, [hl+]                                 ; $7DA9: $2A
    and  $E0                                      ; $7DAA: $E6 $E0
    swap a                                        ; $7DAC: $CB $37
    ld   b, a                                     ; $7DAE: $47
    ld   a, [hl]                                  ; $7DAF: $7E
    and  $03                                      ; $7DB0: $E6 $03
    swap a                                        ; $7DB2: $CB $37
    or   b                                        ; $7DB4: $B0
    and  $3E                                      ; $7DB5: $E6 $3E
    jr   z, jr_020_7DBD                           ; $7DB7: $28 $04

    sub  c                                        ; $7DB9: $91
    jr   nc, jr_020_7DBD                          ; $7DBA: $30 $01

    xor  a                                        ; $7DBC: $AF

jr_020_7DBD:
    ldh  [hScratch1], a                           ; $7DBD: $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ; $7DBF: $F0 $E6
    ld   c, a                                     ; $7DC1: $4F
    ld   a, [hl]                                  ; $7DC2: $7E
    and  $7C                                      ; $7DC3: $E6 $7C
    jr   z, jr_020_7DCB                           ; $7DC5: $28 $04

    sub  c                                        ; $7DC7: $91
    jr   nc, jr_020_7DCB                          ; $7DC8: $30 $01

    xor  a                                        ; $7DCA: $AF

jr_020_7DCB:
    ldh  [hScratch2], a                           ; $7DCB: $E0 $D9
    pop  hl                                       ; $7DCD: $E1
    ldh  a, [hScratch0]                           ; $7DCE: $F0 $D7
    ld   b, a                                     ; $7DD0: $47
    ldh  a, [hScratch1]                           ; $7DD1: $F0 $D8
    swap a                                        ; $7DD3: $CB $37
    ld   c, a                                     ; $7DD5: $4F
    and  $E0                                      ; $7DD6: $E6 $E0
    or   b                                        ; $7DD8: $B0
    ld   [hl+], a                                 ; $7DD9: $22
    ldh  a, [hScratch2]                           ; $7DDA: $F0 $D9
    ld   b, a                                     ; $7DDC: $47
    ld   a, c                                     ; $7DDD: $79
    and  $03                                      ; $7DDE: $E6 $03
    or   b                                        ; $7DE0: $B0
    ld   [hl+], a                                 ; $7DE1: $22
    dec  d                                        ; $7DE2: $15
    jr   nz, jr_020_7D97                          ; $7DE3: $20 $B2

    ret                                           ; $7DE5: $C9

LoadTileset23::
    ld   c, $10                                   ; $7DE6: $0E $10
    ld   b, HIGH(PhotoElementsTiles + $800)       ; $7DE8: $06 $68
    ld   a, BANK(PhotoElementsTiles)              ; $7DEA: $3E $38
    ld   h, BANK(@)                               ; $7DEC: $26 $20
    call Copy100BytesFromBankAtA                  ; $7DEE: $CD $13 $0A

    ld   c, $11                                   ; $7DF1: $0E $11
    ld   b, HIGH(PhotoElementsTiles + $900)       ; $7DF3: $06 $69
    ld   a, BANK(PhotoElementsTiles)              ; $7DF5: $3E $38
    ld   h, BANK(@)                               ; $7DF7: $26 $20
    call Copy100BytesFromBankAtA                  ; $7DF9: $CD $13 $0A

    ld   c, $12                                   ; $7DFC: $0E $12
    ld   b, HIGH(PhotoElementsTiles + $A00)       ; $7DFE: $06 $6A
    ld   a, BANK(PhotoElementsTiles)              ; $7E00: $3E $38
    ld   h, BANK(@)                               ; $7E02: $26 $20
    call Copy100BytesFromBankAtA                  ; $7E04: $CD $13 $0A
    ret                                           ; $7E07: $C9
