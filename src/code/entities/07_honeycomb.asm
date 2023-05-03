; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HoneycombSpriteVariants::
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

HoneycombEntityHandler::
    ldh  a, [hRoomStatus]                         ; $4C97: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $4C99: $E6 $20
    jp   nz, ClearEntityStatus_07                 ; $4C9B: $C2 $A4 $7E

    ld   hl, wEntitiesPrivateState4Table          ; $4C9E: $21 $40 $C4
    add  hl, bc                                   ; $4CA1: $09
    ld   a, [hl]                                  ; $4CA2: $7E
    and  a                                        ; $4CA3: $A7
    jp   nz, label_007_4D84                       ; $4CA4: $C2 $84 $4D

    ld   a, c                                     ; $4CA7: $79
    ld   [wD201], a                               ; $4CA8: $EA $01 $D2
    call GetEntityTransitionCountdown             ; $4CAB: $CD $05 $0C
    and  $20                                      ; $4CAE: $E6 $20
    jr   z, .jr_4CB6                              ; $4CB0: $28 $04

    ld   hl, hActiveEntityPosX                    ; $4CB2: $21 $EE $FF
    dec  [hl]                                     ; $4CB5: $35

.jr_4CB6
    ld   de, HoneycombSpriteVariants              ; $4CB6: $11 $93 $4C
    call RenderActiveEntitySpritesPair            ; $4CB9: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $4CBC: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $4CBF: $F0 $F0
    JP_TABLE                                      ; $4CC1
._00 dw func_007_4CCC                             ; $4CC2
._01 dw func_007_4D1F                             ; $4CC4
._02 dw func_007_4D27                             ; $4CC6
._03 dw func_007_4D4D                             ; $4CC8
._04 dw func_007_4D4E                             ; $4CCA

func_007_4CCC::
    ld   a, [wExchangingTradeSequenceItem]        ; $4CCC: $FA $7F $DB
    cp   $02                                      ; $4CCF: $FE $02
    jr   nz, .jr_4CE7                             ; $4CD1: $20 $14

    ld   hl, wEntitiesPosYTable                   ; $4CD3: $21 $10 $C2
    add  hl, bc                                   ; $4CD6: $09
    ld   a, [hl]                                  ; $4CD7: $7E
    add  $10                                      ; $4CD8: $C6 $10
    ld   [hl], a                                  ; $4CDA: $77
    ld   hl, wEntitiesPosZTable                   ; $4CDB: $21 $10 $C3
    add  hl, bc                                   ; $4CDE: $09
    ld   [hl], $10                                ; $4CDF: $36 $10
    call IncrementEntityState                     ; $4CE1: $CD $12 $3B
    ld   [hl], $04                                ; $4CE4: $36 $04
    ret                                           ; $4CE6: $C9

.jr_4CE7
    xor  a                                        ; $4CE7: $AF
    ld   [wD202], a                               ; $4CE8: $EA $02 $D2
    call IncrementEntityState                     ; $4CEB: $CD $12 $3B

func_007_4CEE::
    ld   a, ENTITY_HONEYCOMB                      ; $4CEE: $3E $B3
    call SpawnNewEntity_trampoline                ; $4CF0: $CD $86 $3B
    jr   c, .jr_4D1D                              ; $4CF3: $38 $28

    ldh  a, [hMultiPurpose0]                      ; $4CF5: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4CF7: $21 $00 $C2
    add  hl, de                                   ; $4CFA: $19
    ld   [hl], a                                  ; $4CFB: $77
    ldh  a, [hMultiPurpose1]                      ; $4CFC: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4CFE: $21 $10 $C2
    add  hl, de                                   ; $4D01: $19
    ld   [hl], a                                  ; $4D02: $77
    ld   hl, wEntitiesPrivateState4Table          ; $4D03: $21 $40 $C4
    add  hl, de                                   ; $4D06: $19
    ld   [hl], $01                                ; $4D07: $36 $01
    ld   hl, wEntitiesSpeedXTable                 ; $4D09: $21 $40 $C2
    add  hl, de                                   ; $4D0C: $19
    ld   [hl], $0E                                ; $4D0D: $36 $0E
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4D0F: $21 $40 $C3
    add  hl, de                                   ; $4D12: $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $4D13: $36 $C1
    ld   hl, wEntitiesHitboxFlagsTable            ; $4D15: $21 $50 $C3
    add  hl, de                                   ; $4D18: $19
    ld   [hl], $00                                ; $4D19: $36 $00
    and  a                                        ; $4D1B: $A7
    ret                                           ; $4D1C: $C9

.jr_4D1D
    scf                                           ; $4D1D: $37
    ret                                           ; $4D1E: $C9

func_007_4D1F::
    ld   a, [wD202]                               ; $4D1F: $FA $02 $D2
    and  a                                        ; $4D22: $A7
    jp   nz, IncrementEntityState                 ; $4D23: $C2 $12 $3B

    ret                                           ; $4D26: $C9

func_007_4D27::
    ld   hl, wEntitiesInertiaTable                ; $4D27: $21 $D0 $C3
    add  hl, bc                                   ; $4D2A: $09
    ld   a, [hl]                                  ; $4D2B: $7E
    cp   $05                                      ; $4D2C: $FE $05
    jp   z, IncrementEntityState                  ; $4D2E: $CA $12 $3B

    ldh  a, [hFrameCounter]                       ; $4D31: $F0 $E7
    and  $07                                      ; $4D33: $E6 $07
    jr   nz, .ret_4D4C                            ; $4D35: $20 $15

    call func_007_4CEE                            ; $4D37: $CD $EE $4C
    jr   c, .ret_4D4C                             ; $4D3A: $38 $10

    ld   hl, wEntitiesInertiaTable                ; $4D3C: $21 $D0 $C3
    add  hl, bc                                   ; $4D3F: $09
    inc  [hl]                                     ; $4D40: $34
    ld   a, [hl]                                  ; $4D41: $7E
    ld   hl, wEntitiesInertiaTable                ; $4D42: $21 $D0 $C3
    add  hl, de                                   ; $4D45: $19
    ld   [hl], a                                  ; $4D46: $77
    ld   hl, wEntitiesSpeedXTable                 ; $4D47: $21 $40 $C2
    add  hl, de                                   ; $4D4A: $19
    ld   [hl], b                                  ; $4D4B: $70

.ret_4D4C
    ret                                           ; $4D4C: $C9

func_007_4D4D::
    ret                                           ; $4D4D: $C9

func_007_4D4E::
    call GetEntityTransitionCountdown             ; $4D4E: $CD $05 $0C
    ret  nz                                       ; $4D51: $C0

    call AddEntityZSpeedToPos_07                  ; $4D52: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4D55: $21 $20 $C3
    add  hl, bc                                   ; $4D58: $09
    dec  [hl]                                     ; $4D59: $35
    dec  [hl]                                     ; $4D5A: $35
    ld   hl, wEntitiesPosZTable                   ; $4D5B: $21 $10 $C3
    add  hl, bc                                   ; $4D5E: $09
    ld   a, [hl]                                  ; $4D5F: $7E
    and  $80                                      ; $4D60: $E6 $80
    ret  z                                        ; $4D62: $C8

    ld   [hl], b                                  ; $4D63: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4D64: $21 $20 $C3
    add  hl, bc                                   ; $4D67: $09
    ld   [hl], b                                  ; $4D68: $70
    call CheckLinkCollisionWithEnemy_trampoline   ; $4D69: $CD $5A $3B
    ret  nc                                       ; $4D6C: $D0

    xor  a                                        ; $4D6D: $AF
    ld   [wExchangingTradeSequenceItem], a        ; $4D6E: $EA $7F $DB
    ld   a, TRADING_ITEM_HONEYCOMB                ; $4D71: $3E $06
    ld   [wTradeSequenceItem], a                  ; $4D73: $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ; $4D76: $3E $0D
    ldh  [hReplaceTiles], a                       ; $4D78: $E0 $A5
    call CreateTradingItemEntity                  ; $4D7A: $CD $0C $0C
    jp   ClearEntityStatus_07                     ; $4D7D: $C3 $A4 $7E

Data_007_4D80::
    db   $72, $00, $72, $40

label_007_4D84:
    ld   de, Data_007_4D80                        ; $4D84: $11 $80 $4D
    call RenderActiveEntitySprite                 ; $4D87: $CD $77 $3C
    ldh  a, [hFrameCounter]                       ; $4D8A: $F0 $E7
    rra                                           ; $4D8C: $1F
    rra                                           ; $4D8D: $1F
    and  $01                                      ; $4D8E: $E6 $01
    call SetEntitySpriteVariant                   ; $4D90: $CD $0C $3B
    call ReturnIfNonInteractive_07                ; $4D93: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $4D96: $F0 $F0
    JP_TABLE                                      ; $4D98
._00 dw func_007_4DA5                             ; $4D99
._01 dw func_007_4E25                             ; $4D9B
._02 dw func_007_4E8C                             ; $4D9D

Data_007_4D9F::
    db   $01, $FF

Data_007_4DA1::
    db   $10, $F0

Data_007_4DA3::
    db   $0B, $F5

func_007_4DA5::
    ldh  a, [hFrameCounter]                       ; $4DA5: $F0 $E7
    and  $01                                      ; $4DA7: $E6 $01
    jr   nz, jr_007_4DEA                          ; $4DA9: $20 $3F

    ld   hl, wEntitiesPrivateState1Table          ; $4DAB: $21 $B0 $C2
    add  hl, bc                                   ; $4DAE: $09
    ld   e, [hl]                                  ; $4DAF: $5E
    ld   d, b                                     ; $4DB0: $50
    ld   hl, Data_007_4D9F                        ; $4DB1: $21 $9F $4D
    add  hl, de                                   ; $4DB4: $19
    ld   a, [hl]                                  ; $4DB5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4DB6: $21 $40 $C2
    add  hl, bc                                   ; $4DB9: $09
    add  [hl]                                     ; $4DBA: $86
    ld   [hl], a                                  ; $4DBB: $77
    ld   hl, Data_007_4DA1                        ; $4DBC: $21 $A1 $4D
    add  hl, de                                   ; $4DBF: $19
    cp   [hl]                                     ; $4DC0: $BE
    jr   nz, .jr_4DCB                             ; $4DC1: $20 $08

    ld   hl, wEntitiesPrivateState1Table          ; $4DC3: $21 $B0 $C2
    add  hl, bc                                   ; $4DC6: $09
    ld   a, [hl]                                  ; $4DC7: $7E
    xor  $01                                      ; $4DC8: $EE $01
    ld   [hl], a                                  ; $4DCA: $77

.jr_4DCB
    ld   hl, wEntitiesPrivateState2Table          ; $4DCB: $21 $C0 $C2
    add  hl, bc                                   ; $4DCE: $09
    ld   e, [hl]                                  ; $4DCF: $5E
    ld   d, b                                     ; $4DD0: $50
    ld   hl, Data_007_4D9F                        ; $4DD1: $21 $9F $4D
    add  hl, de                                   ; $4DD4: $19
    ld   a, [hl]                                  ; $4DD5: $7E
    call GetEntitySpeedYAddress                   ; $4DD6: $CD $05 $40
    add  [hl]                                     ; $4DD9: $86
    ld   [hl], a                                  ; $4DDA: $77
    ld   hl, Data_007_4DA3                        ; $4DDB: $21 $A3 $4D
    add  hl, de                                   ; $4DDE: $19
    cp   [hl]                                     ; $4DDF: $BE
    jr   nz, jr_007_4DEA                          ; $4DE0: $20 $08

    ld   hl, wEntitiesPrivateState2Table          ; $4DE2: $21 $C0 $C2
    add  hl, bc                                   ; $4DE5: $09
    ld   a, [hl]                                  ; $4DE6: $7E
    xor  $01                                      ; $4DE7: $EE $01
    ld   [hl], a                                  ; $4DE9: $77

jr_007_4DEA:
    call UpdateEntityPosWithSpeed_07              ; $4DEA: $CD $0A $7E
    ld   a, [wD202]                               ; $4DED: $FA $02 $D2
    and  a                                        ; $4DF0: $A7
    jp   nz, IncrementEntityState                 ; $4DF1: $C2 $12 $3B

    ret                                           ; $4DF4: $C9

Data_007_4DF5::
    db   $F0, $E8, $E8, $E0, $E0, $D8, $10, $18, $18, $20, $20, $28, $00, $F8, $08, $F8
    db   $08, $00, $00, $08, $F8, $08, $F8, $00

Data_007_4E0D::
    db   $00, $F8, $08, $F8, $08, $00, $00, $08, $F8, $08, $F8, $00, $10, $18, $18, $20
    db   $20, $28, $F0, $E8, $E8, $E0, $E0, $D8

func_007_4E25::
    ld   a, JINGLE_TARIN_BEE_BUZZ                 ; $4E25: $3E $22
    ldh  [hJingle], a                             ; $4E27: $E0 $F2
    ld   a, [wD204]                               ; $4E29: $FA $04 $D2
    ld   e, a                                     ; $4E2C: $5F
    ld   d, b                                     ; $4E2D: $50
    ld   hl, wEntitiesStatusTable                 ; $4E2E: $21 $80 $C2
    add  hl, de                                   ; $4E31: $19
    ld   a, [hl]                                  ; $4E32: $7E
    and  a                                        ; $4E33: $A7

.jr_4E34
    jp   z, ClearEntityStatus_07                  ; $4E34: $CA $A4 $7E

    ldh  a, [hFrameCounter]                       ; $4E37: $F0 $E7
    and  $07                                      ; $4E39: $E6 $07
    ld   hl, wEntitiesInertiaTable                ; $4E3B: $21 $D0 $C3

.jr_4E3E
    add  hl, bc                                   ; $4E3E: $09
    cp   [hl]                                     ; $4E3F: $BE
    jr   nz, .jr_4E89                             ; $4E40: $20 $47

    ld   a, [wD204]                               ; $4E42: $FA $04 $D2
    ld   e, a                                     ; $4E45: $5F
    ld   d, b                                     ; $4E46: $50
    ld   hl, wEntitiesDirectionTable              ; $4E47: $21 $80 $C3
    add  hl, de                                   ; $4E4A: $19
    ld   a, [hl]                                  ; $4E4B: $7E
    ld   e, a                                     ; $4E4C: $5F
    ld   hl, wEntitiesInertiaTable                ; $4E4D: $21 $D0 $C3
    add  hl, bc                                   ; $4E50: $09
    rla                                           ; $4E51: $17
    rla                                           ; $4E52: $17
    and  $FC                                      ; $4E53: $E6 $FC
    add  e                                        ; $4E55: $83
    add  e                                        ; $4E56: $83
    add  [hl]                                     ; $4E57: $86
    ld   e, a                                     ; $4E58: $5F
    ld   d, b                                     ; $4E59: $50
    ldh  a, [hLinkPositionX]                      ; $4E5A: $F0 $98
    push af                                       ; $4E5C: $F5
    ldh  a, [hLinkPositionY]                      ; $4E5D: $F0 $99
    push af                                       ; $4E5F: $F5
    push bc                                       ; $4E60: $C5
    ld   a, [wD204]                               ; $4E61: $FA $04 $D2
    ld   c, a                                     ; $4E64: $4F
    ld   hl, Data_007_4DF5                        ; $4E65: $21 $F5 $4D
    add  hl, de                                   ; $4E68: $19
    ld   a, [hl]                                  ; $4E69: $7E
    ld   hl, wEntitiesPosXTable                   ; $4E6A: $21 $00 $C2
    add  hl, bc                                   ; $4E6D: $09
    add  [hl]                                     ; $4E6E: $86
    ldh  [hLinkPositionX], a                      ; $4E6F: $E0 $98
    ld   hl, Data_007_4E0D                        ; $4E71: $21 $0D $4E
    add  hl, de                                   ; $4E74: $19
    ld   a, [hl]                                  ; $4E75: $7E
    ld   hl, wEntitiesPosYTable                   ; $4E76: $21 $10 $C2
    add  hl, bc                                   ; $4E79: $09
    add  [hl]                                     ; $4E7A: $86
    ldh  [hLinkPositionY], a                      ; $4E7B: $E0 $99
    pop  bc                                       ; $4E7D: $C1
    ld   a, $24                                   ; $4E7E: $3E $24
    call ApplyVectorTowardsLink_trampoline        ; $4E80: $CD $AA $3B
    pop  af                                       ; $4E83: $F1
    ldh  [hLinkPositionY], a                      ; $4E84: $E0 $99
    pop  af                                       ; $4E86: $F1
    ldh  [hLinkPositionX], a                      ; $4E87: $E0 $98

.jr_4E89
    jp   UpdateEntityPosWithSpeed_07              ; $4E89: $C3 $0A $7E

func_007_4E8C::
    ret                                           ; $4E8C: $C9
