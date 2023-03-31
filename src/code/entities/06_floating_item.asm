Data_006_7ADD::
    db   $A6, $15, $8E, $16, $80, $15, $A6, $15, $A9, $14, $2A, $41, $2A, $61

Data_006_7AEB::
    db   $00, $FC, $22, $00, $00, $0C, $22, $20, $00, $FC, $22, $40, $00, $0C, $22, $60

Data_006_7AFB::
    db   $0F, $0F, $10, $11, $11, $11, $10, $0F

Data_006_7B03::
    db   $00, $00, $01, $02, $02, $02, $01, $00

; The ENTITY_FLOATING_ITEM item type depends on its position in the room.
;
;         | X even | X odd  |
; --------|--------|--------|
;  Y even | Rupees | Bombs  |
;  Y odd  | Powder | Rupees |
;
FloatingItemEntityHandler::
    ld   a, [wIsIndoor]                           ; $7B0B: $FA $A5 $DB
    and  a                                        ; $7B0E: $A7
    jr   z, FloatingItem2EntityHandler            ; $7B0F: $28 $0B

    ldh  a, [hMapId]                              ; $7B11: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $7B13: $FE $FF
    jr   nz, FloatingItem2EntityHandler           ; $7B15: $20 $05

    ld   a, $06                                   ; $7B17: $3E $06
    jp   func_036_4F9B_trampoline                 ; $7B19: $C3 $53 $0A

; The ENTITY_FLOATING_ITEM_2 item type depends on its position in the room.
;
; --------|--------|
;  X even | Arrows |
;  X odd  | Hearts |
;
FloatingItem2EntityHandler::
    ld   a, [wIsIndoor]                           ; $7B1C: $FA $A5 $DB
    and  a                                        ; $7B1F: $A7
    jr   z, .jr_7B32                              ; $7B20: $28 $10

    ldh  a, [hMapId]                              ; $7B22: $F0 $F7
    and  a                                        ; $7B24: $A7
    jr   nz, .jr_7B32                             ; $7B25: $20 $0B

    ldh  a, [hMapRoom]                            ; $7B27: $F0 $F6
    cp   UNKNOWN_ROOM_1C                          ; $7B29: $FE $1C
    jr   nz, .jr_7B32                             ; $7B2B: $20 $05

    ld   a, $01                                   ; $7B2D: $3E $01
    ld   [wDE00], a                               ; $7B2F: $EA $00 $DE

.jr_7B32
    ld   hl, Data_006_7AFB                        ; $7B32: $21 $FB $7A
    ldh  a, [hIsSideScrolling]                    ; $7B35: $F0 $F9
    and  a                                        ; $7B37: $A7
    jr   z, .jr_7B3D                              ; $7B38: $28 $03

    ld   hl, Data_006_7B03                        ; $7B3A: $21 $03 $7B

.jr_7B3D
    ldh  a, [hFrameCounter]                       ; $7B3D: $F0 $E7
    rra                                           ; $7B3F: $1F
    rra                                           ; $7B40: $1F
    rra                                           ; $7B41: $1F
    and  $07                                      ; $7B42: $E6 $07
    ld   e, a                                     ; $7B44: $5F
    ld   d, b                                     ; $7B45: $50
    add  hl, de                                   ; $7B46: $19
    ld   a, [hl]                                  ; $7B47: $7E
    ld   hl, wEntitiesPosZTable                   ; $7B48: $21 $10 $C3
    add  hl, bc                                   ; $7B4B: $09
    ld   [hl], a                                  ; $7B4C: $77
    ldh  a, [hActiveEntitySpriteVariant]          ; $7B4D: $F0 $F1
    cp   $05                                      ; $7B4F: $FE $05
    jr   nz, .jr_7B5B                             ; $7B51: $20 $08

    ld   de, Data_006_7AD1 + 2                    ; $7B53: $11 $D3 $7A
    call RenderActiveEntitySpritesPair            ; $7B56: $CD $C0 $3B
    jr   jr_006_7B61                              ; $7B59: $18 $06

.jr_7B5B
    ld   de, Data_006_7ADD                        ; $7B5B: $11 $DD $7A
    call RenderActiveEntitySprite                 ; $7B5E: $CD $77 $3C

jr_006_7B61:
    ldh  a, [hFrameCounter]                       ; $7B61: $F0 $E7
    and  $08                                      ; $7B63: $E6 $08
    ld   e, a                                     ; $7B65: $5F
    ld   d, b                                     ; $7B66: $50
    ld   hl, Data_006_7AEB                        ; $7B67: $21 $EB $7A
    add  hl, de                                   ; $7B6A: $19
    ld   c, $02                                   ; $7B6B: $0E $02
    call RenderActiveEntitySpritesRect            ; $7B6D: $CD $E6 $3C
    ld   a, $01                                   ; $7B70: $3E $01
    call func_015_7964_trampoline                 ; $7B72: $CD $A0 $3D
    call CopyEntityPositionToActivePosition       ; $7B75: $CD $8A $3D
    call ReturnIfNonInteractive_06                ; $7B78: $CD $C6 $64
    ldh  a, [hIsSideScrolling]                    ; $7B7B: $F0 $F9
    and  a                                        ; $7B7D: $A7
    jr   nz, .jr_7B85                             ; $7B7E: $20 $05

    ldh  a, [hLinkPositionZ]                      ; $7B80: $F0 $A2
    cp   $0C                                      ; $7B82: $FE $0C
    ret  c                                        ; $7B84: $D8

.jr_7B85
    call CheckLinkCollisionWithEnemy_trampoline   ; $7B85: $CD $5A $3B
    ret  nc                                       ; $7B88: $D0

    call DidKillEnemy.label_3F5E                  ; $7B89: $CD $5E $3F
    call ClearEntityStatus_06                     ; $7B8C: $CD $DB $65
    ld   a, WAVE_SFX_SEASHELL                     ; $7B8F: $3E $01
    ldh  [hWaveSfx], a                            ; $7B91: $E0 $F3
    ldh  a, [hActiveEntitySpriteVariant]          ; $7B93: $F0 $F1
    JP_TABLE                                      ; $7B95
._00 dw Floating10RupeesHandler
._01 dw FloatingMagicPowderHandler
._02 dw FloatingBombsHandler
._03 dw Floating10RupeesHandler
._04 dw func_006_7BA2
._05 dw FloatingArrowsHandler

func_006_7BA2::
    ld   a, [wAddHealthBuffer]                    ; $7BA2: $FA $93 $DB
    add  $18                                      ; $7BA5: $C6 $18
    jr   nc, .jr_7BAB                             ; $7BA7: $30 $02

    ld   a, $FF                                   ; $7BA9: $3E $FF

.jr_7BAB
    ld   [wAddHealthBuffer], a                    ; $7BAB: $EA $93 $DB
    ret                                           ; $7BAE: $C9

FloatingArrowsHandler::
    ld   a, [wArrowCount]                         ; $7BAF: $FA $45 $DB
    add  $10                                      ; $7BB2: $C6 $10
    daa                                           ; $7BB4: $27
    ld   [wArrowCount], a                         ; $7BB5: $EA $45 $DB
    ret                                           ; $7BB8: $C9

Floating10RupeesHandler::
    ld   a, 10                                    ; $7BB9: $3E $0A
    ld   [wAddRupeeBufferLow], a                  ; $7BBB: $EA $90 $DB
    ret                                           ; $7BBE: $C9

FloatingMagicPowderHandler::
    ld   d, $0C                                   ; $7BBF: $16 $0C
    call GiveInventoryItem_trampoline             ; $7BC1: $CD $6B $3E
    ld   a, REPLACE_TILES_MAGIC_POWDER            ; $7BC4: $3E $0B
    ldh  [hReplaceTiles], a                       ; $7BC6: $E0 $A5
    ld   hl, wMaxMagicPowder                      ; $7BC8: $21 $76 $DB
    ld   de, wMagicPowderCount                    ; $7BCB: $11 $4C $DB
    jr   jr_006_7BD6                              ; $7BCE: $18 $06

FloatingBombsHandler::
    ld   hl, wMaxBombs                            ; $7BD0: $21 $77 $DB
    ld   de, wBombCount                           ; $7BD3: $11 $4D $DB

jr_006_7BD6:
    ld   a, [de]                                  ; $7BD6: $1A
    cp   [hl]                                     ; $7BD7: $BE
    ret  nc                                       ; $7BD8: $D0

    add  $10                                      ; $7BD9: $C6 $10
    daa                                           ; $7BDB: $27
    cp   [hl]                                     ; $7BDC: $BE
    jr   c, .jr_7BE0                              ; $7BDD: $38 $01

    ld   a, [hl]                                  ; $7BDF: $7E

.jr_7BE0
    ld   [de], a                                  ; $7BE0: $12
    ret                                           ; $7BE1: $C9

func_006_7BE2::
    ldh  a, [hMapId]                              ; $7BE2: $F0 $F7
    cp   MAP_CAVE_B                               ; $7BE4: $FE $0A
    ret  nz                                       ; $7BE6: $C0

.jr_7BE7
    ldh  a, [hMapRoom]                            ; $7BE7: $F0 $F6
    cp   ROOM_INDOOR_B_97                         ; $7BE9: $FE $97
    jr   z, .jr_7BF0                              ; $7BEB: $28 $03
    cp   ROOM_INDOOR_B_98                         ; $7BED: $FE $98
    ret  nz                                       ; $7BEF: $C0

.jr_7BF0
    ld   a, [wExchangingTradeSequenceItem]        ; $7BF0: $FA $7F $DB
    and  a                                        ; $7BF3: $A7
    ret  z                                        ; $7BF4: $C8

    ld   a, $FF                                   ; $7BF5: $3E $FF
    ldh  [hActiveEntitySpriteVariant], a          ; $7BF7: $E0 $F1
    ret                                           ; $7BF9: $C9
