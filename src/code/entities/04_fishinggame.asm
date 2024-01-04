; defines a list of sprites with [x, y, tile n°, tile attrs]
FishermanRodLowSpriteRect::                       ; $5F28
    db   $00, $F0, $78, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $F8, $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $00, $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $08, $72, OAM_GBC_PAL_1 | OAMF_PAL0

; defines a list of sprites with [x, y, tile n°, tile attrs]
FishermanRowHighSpriteRect::                      ; $5F38
    db   $00, $F0, $7C, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $F8, $7E, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $00, $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $08, $72, OAM_GBC_PAL_1 | OAMF_PAL0

; defines a list of sprites with [x, y, tile n°, tile attrs]
FishermanTowardsLinkSpriteRect::                  ; $5F48
    db   $00, $F0, $78, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $F8, $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $00, $74, OAM_GBC_PAL_1 | OAMF_PAL0
    db   $00, $08, $76, OAM_GBC_PAL_1 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FishermanFishingGameSpriteVariants::
.variant0
    db $9A, OAM_GBC_PAL_6 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_6 | OAMF_PAL1

; Entity responsible for:
; - The fisherman near the pond
; - The fishing game itself
; - Each fish
FishermanFishingGameEntityHandler::
    ;
    ; Special case when wEntitiesPrivateState4Table is non-zero
    ;

    ld   hl, wEntitiesPrivateState4Table          ; $5F5C: $21 $40 $C4
    add  hl, bc                                   ; $5F5F: $09
    ld   a, [hl]                                  ; $5F60: $7E
    and  a                                        ; $5F61: $A7
    jr   z, .privateState4End                     ; $5F62: $28 $32

    ldh  a, [hActiveEntityVisualPosY]             ; $5F64: $F0 $EC
    add  $04                                      ; $5F66: $C6 $04
    ldh  [hActiveEntityVisualPosY], a             ; $5F68: $E0 $EC
    ld   de, FishermanFishingGameSpriteVariants   ; $5F6A: $11 $58 $5F
    call RenderActiveEntitySpritesPair            ; $5F6D: $CD $C0 $3B
    call UpdateEntityPosWithVelocity_04           ; $5F70: $CD $CA $6D
    call AddEntityZVelocityToPos_04               ; $5F73: $CD $03 $6E
    ld   hl, wEntitiesVelocityZTable              ; $5F76: $21 $20 $C3
    add  hl, bc                                   ; $5F79: $09
    dec  [hl]                                     ; $5F7A: $35

    ld   hl, wEntitiesPosZTable                   ; $5F7B: $21 $10 $C3
    add  hl, bc                                   ; $5F7E: $09
    ld   a, [hl]                                  ; $5F7F: $7E
    and  $80                                      ; $5F80: $E6 $80
    jr   z, .jr_5F91                              ; $5F82: $28 $0D
    call ClearEntityStatusBank04                  ; $5F84: $CD $7A $6D
    xor  a                                        ; $5F87: $AF
    ld   [wExchangingTradeSequenceItem], a        ; $5F88: $EA $7F $DB
    ld   [wC167], a                               ; $5F8B: $EA $67 $C1
    jp   CreateTradingItemEntity                  ; $5F8E: $C3 $0C $0C
.jr_5F91

    ld   a, $02                                   ; $5F91: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5F93: $E0 $A1
    ret                                           ; $5F95: $C9
.privateState4End

    ldh  a, [hIsSideScrolling]                    ; $5F96: $F0 $F9
    and  a                                        ; $5F98: $A7
    jp   nz, FishingGameAndFishHandler            ; $5F99: $C2 $A4 $60

    ;
    ; Fisherman near the pond
    ;

    ; Allocate 4 sprites, and don't hurt Link on touch
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5F9C: $21 $40 $C3
    add  hl, bc                                   ; $5F9F: $09
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS        ; $5FA0: $36 $84

    ld   hl, wEntitiesPrivateState5Table          ; $5FA2: $21 $90 $C3
    add  hl, bc                                   ; $5FA5: $09
    ld   a, [hl]                                  ; $5FA6: $7E
    ldh  [hMultiPurposeG], a                      ; $5FA7: $E0 $E8

    ; Select the sprites rect to render:
    ; - if a dialog is visible, FishermanTowardsLinkSpriteRect
    ; - else if wEntitiesInertiaTable is $30, FishermanRowHighSpriteRect
    ; - else FishermanRodLowSpriteRect
    ld   a, [wDialogState]                        ; $5FA9: $FA $9F $C1
    and  a                                        ; $5FAC: $A7
    ld   hl, FishermanTowardsLinkSpriteRect       ; $5FAD: $21 $48 $5F
    jr   nz, .renderSprites                       ; $5FB0: $20 $10

    ld   hl, wEntitiesInertiaTable                ; $5FB2: $21 $D0 $C3
    add  hl, bc                                   ; $5FB5: $09
    ld   a, [hl]                                  ; $5FB6: $7E
    inc  [hl]                                     ; $5FB7: $34
    ld   hl, FishermanRodLowSpriteRect            ; $5FB8: $21 $28 $5F
    and  $30                                      ; $5FBB: $E6 $30
    jr   z, .renderSprites                        ; $5FBD: $28 $03

    ld   hl, FishermanRowHighSpriteRect           ; $5FBF: $21 $38 $5F

.renderSprites
    ; Render a rect of 4 sprites (2 for the rod, 2 for the fisherman)
    ld   c, $04                                   ; $5FC2: $0E $04
    call RenderActiveEntitySpritesRect            ; $5FC4: $CD $E6 $3C

    ld   a, $04                                   ; $5FC7: $3E $04
    call func_015_7964_trampoline                 ; $5FC9: $CD $A0 $3D
    call PushLinkOutOfEntity_04                   ; $5FCC: $CD $E3 $7B

    ldh  a, [hActiveEntityState]                  ; $5FCF: $F0 $F0
    JP_TABLE                                      ; $5FD1
._00 dw FishermanIdleHandler                      ; $5FD2
._01 dw FishermanProposingHandler                 ; $5FD4
._02 dw FishermanExplainingRulesHandler           ; $5FD6

FishermanIdleHandler::
    ld   a, [wGameplayType]                       ; $5FD8: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $5FDB: $FE $0B
    ret  nz                                       ; $5FDD: $C0

    call func_004_7C4B                            ; $5FDE: $CD $4B $7C
    ret  nc                                       ; $5FE1: $D0

    ld   a, $02                                   ; $5FE2: $3E $02
    ld   [wC167], a                               ; $5FE4: $EA $67 $C1
    call_open_dialog Dialog045 ; "How about some fishing" ; $5FE7
    jp   IncrementEntityState                     ; $5FEC: $C3 $12 $3B

; Displaying the dialog that asks if Link's want to fish
FishermanProposingHandler::
    ld   a, [wDialogState]                        ; $5FEF: $FA $9F $C1
    and  a                                        ; $5FF2: $A7
    ret  nz                                       ; $5FF3: $C0

    call IncrementEntityState                     ; $5FF4: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ; $5FF7: $FA $77 $C1
    and  a                                        ; $5FFA: $A7
    jr   z, .accepted                             ; $5FFB: $28 $0A

    ; Declined
    ld   [hl], b                                  ; $5FFD: $70
    xor  a                                        ; $5FFE: $AF
    ld   [wC167], a                               ; $5FFF: $EA $67 $C1
    jp_open_dialog Dialog046 ; "Too bad"          ; $6002

.accepted
    push hl                                       ; $6007: $E5
    push de                                       ; $6008: $D5
    ld   a, [wAddRupeeBufferLow]                  ; $6009: $FA $90 $DB
    ld   e, a                                     ; $600C: $5F
    ld   a, [wAddRupeeBufferHigh]                 ; $600D: $FA $8F $DB
    ld   d, a                                     ; $6010: $57
    ld   a, [wRupeeCountLow]                      ; $6011: $FA $5E $DB
    ld   l, a                                     ; $6014: $6F
    ld   a, [wRupeeCountHigh]                     ; $6015: $FA $5D $DB
    ld   h, a                                     ; $6018: $67

.loop_6019
    ld   a, e                                     ; $6019: $7B
    or   d                                        ; $601A: $B2
    jr   z, .jr_6023                              ; $601B: $28 $06

    daa                                           ; $601D: $27
    inc  hl                                       ; $601E: $23
    daa                                           ; $601F: $27
    dec  de                                       ; $6020: $1B
    jr   .loop_6019                               ; $6021: $18 $F6

    ; Play the fishing game: remove the price from the player's rupees
.jr_6023
    ld   a, l                                     ; $6023: $7D
    sub  $10                                      ; $6024: $D6 $10
    ld   a, h                                     ; $6026: $7C
    sbc  $00                                      ; $6027: $DE $00
    pop  de                                       ; $6029: $D1
    pop  hl                                       ; $602A: $E1
    jr   c, .notEnoughRupees                      ; $602B: $38 $0A

    ld   a, FISHING_GAME_PRICE
    ld   [wSubstractRupeeBufferLow], a            ; $602F: $EA $92 $DB
    jp_open_dialog Dialog047 ; "Here's how it works" ; $6032

.notEnoughRupees
    ld   [hl], b                                  ; $6037: $70
    xor  a                                        ; $6038: $AF
    ld   [wC167], a                               ; $6039: $EA $67 $C1
    jp_open_dialog Dialog04E ; "Not enough rupees" ; $603C

; Fishing accepted; explaining the rules
FishermanExplainingRulesHandler::
    ld   a, [wDialogState]                        ; $6041: $FA $9F $C1
    and  a                                        ; $6044: $A7
    ret  nz                                       ; $6045: $C0

    call UnloadAllEntities                        ; $6046: $CD $83 $3E
    jp   WarpToFishingGame                        ; $6049: $C3 $FB $67

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown080SpriteVariants::
.variant0
    db $58, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $56, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $58, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $58, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_0 | OAMF_PAL0
.variatn5
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant6
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant7
    db $56, OAM_GBC_PAL_0 | OAMF_PAL0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
.variant8
    db $5E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant9
    db $58, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_0 | OAMF_PAL0

Data_004_6074::
    db   $06, $16, $10, $10, $38, $38, $39, $39, $16, $38

Data_004_607E::
    db   $F6, $00, $F1, $F0, $F0, $F0, $F0, $FE, $04, $F2

Data_004_6088::
    db   $00, $F0, $FA, $00, $00, $F8, $F8, $F8, $F2, $FE

Data_004_6092::
    db   $E8, $00, $E0, $E8, $00, $00, $00, $00, $14

Data_004_609B::
    db   $10, $E0, $F8, $10, $00, $00, $00, $00, $F0

FishingGameAndFishHandler::
    ld   a, $01                                   ; $60A4
    ld   [wC167], a
    ld   hl, wEntitiesPrivateState1Table          ; $60A9: $21 $B0 $C2
    add  hl, bc                                   ; $60AC: $09
    ld   a, [hl]                                  ; $60AD: $7E
    JP_TABLE                                      ; $60AE: $C7
._00 dw FishingGameHandler                        ; $60AF
._01 dw FishingLureHandler                        ; $60B1
._02 dw SmallFishHandler                          ; $60B3
._03 dw BigFishHandler                            ; $60B5

FishStartX:
    db   $18, $58, $60, $18, $88

FishStartY:
    db   $40, $4C, $34, $68, $50

FishStartDirection:
    db   $01, $00, $00, $01, $00

FishType:
    db   $02, $02, $02, $03, $03

FishMoveDelay:
    db   $00, $3E, $1E, $10, $30

FishingGameHandler::
    ld   a, $02                                   ; $60D0: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $60D2: $E0 $A1
    ld   hl, wEntitiesPrivateState2Table          ; $60D4: $21 $C0 $C2
    add  hl, bc                                   ; $60D7: $09
    ld   a, [hl]                                  ; $60D8: $7E
    and  a                                        ; $60D9: $A7
    jr   nz, jr_004_6120                          ; $60DA: $20 $44

    inc  [hl]                                     ; $60DC: $34
    push bc                                       ; $60DD: $C5
    ld   c, $05                                   ; $60DE: $0E $05

.loop_60E0
    ld   a, ENTITY_FISHERMAN_FISHING_GAME         ; $60E0: $3E $54
    call SpawnNewEntity_trampoline                ; $60E2: $CD $86 $3B

    ; Set entity X and Y position
    ; (The indexes go from 5 to 1, so index 0 is never used)
    ld   hl, (FishStartX - 1)                     ; $60E5: $21 $B6 $60
    add  hl, bc                                   ; $60E8: $09
    ld   a, [hl]                                  ; $60E9: $7E
    ld   hl, wEntitiesPosXTable                   ; $60EA: $21 $00 $C2
    add  hl, de                                   ; $60ED: $19
    ld   [hl], a                                  ; $60EE: $77
    ld   hl, (FishStartY - 1)                     ; $60EF: $21 $BB $60
    add  hl, bc                                   ; $60F2: $09
    ld   a, [hl]                                  ; $60F3: $7E
    ld   hl, wEntitiesPosYTable                   ; $60F4: $21 $10 $C2
    add  hl, de                                   ; $60F7: $19
    ld   [hl], a                                  ; $60F8: $77

    ld   hl, (FishStartDirection - 1)             ; $60F9: $21 $C0 $60
    add  hl, bc                                   ; $60FC: $09
    ld   a, [hl]                                  ; $60FD: $7E
    ld   hl, wEntitiesDirectionTable              ; $60FE: $21 $80 $C3
    add  hl, de                                   ; $6101: $19
    ld   [hl], a                                  ; $6102: $77
    ld   hl, (FishType - 1)                       ; $6103: $21 $C5 $60
    add  hl, bc                                   ; $6106: $09
    ld   a, [hl]                                  ; $6107: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6108: $21 $B0 $C2
    add  hl, de                                   ; $610B: $19
    ld   [hl], a                                  ; $610C: $77
    ld   hl, (FishMoveDelay - 1)                  ; $610D: $21 $CA $60
    add  hl, bc                                   ; $6110: $09
    ld   a, [hl]                                  ; $6111: $7E
    ld   hl, wEntitiesTransitionCountdownTable    ; $6112: $21 $E0 $C2
    add  hl, de                                   ; $6115: $19
    ld   [hl], a                                  ; $6116: $77
    dec  c                                        ; $6117: $0D
    jr   nz, .loop_60E0                           ; $6118: $20 $C6

    xor  a                                        ; $611A: $AF
    ld   [wD004], a                               ; $611B: $EA $04 $D0
    pop  bc                                       ; $611E: $C1
    ret                                           ; $611F: $C9

jr_004_6120:
    ldh  a, [hActiveEntitySpriteVariant]          ; $6120: $F0 $F1
    ld   e, a                                     ; $6122: $5F
    ld   d, b                                     ; $6123: $50
    ld   hl, Data_004_6074                        ; $6124: $21 $74 $60
    add  hl, de                                   ; $6127: $19
    ld   a, [hl]                                  ; $6128: $7E
    ldh  [hLinkAnimationState], a                 ; $6129: $E0 $9D
    ld   hl, Data_004_607E                        ; $612B: $21 $7E $60
    add  hl, de                                   ; $612E: $19
    ldh  a, [hLinkPositionX]                      ; $612F: $F0 $98
    add  [hl]                                     ; $6131: $86
    ldh  [hActiveEntityPosX], a                   ; $6132: $E0 $EE
    ld   hl, Data_004_6088                        ; $6134: $21 $88 $60
    add  hl, de                                   ; $6137: $19
    ldh  a, [hLinkPositionY]                      ; $6138: $F0 $99
    add  [hl]                                     ; $613A: $86
    ldh  [hActiveEntityVisualPosY], a             ; $613B: $E0 $EC
    ld   de, Unknown080SpriteVariants             ; $613D: $11 $4C $60
    call RenderActiveEntitySpritesPair            ; $6140: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $6143: $F0 $F0
    JP_TABLE                                      ; $6145
._00 dw func_004_6154                             ; $6146
._01 dw func_004_617B                             ; $6148
._02 dw func_004_61E4                             ; $614A
._03 dw func_004_61E5                             ; $614C
._04 dw func_004_6247                             ; $614E
._05 dw func_004_6252                             ; $6150
._06 dw func_004_626C                             ; $6152

func_004_6154::
    ld   a, [wDialogState]                        ; $6154: $FA $9F $C1
    and  a                                        ; $6157: $A7
    jr   nz, .jr_616C                             ; $6158: $20 $12

    ldh  a, [hJoypadState]                        ; $615A: $F0 $CC
    and  J_A | J_B                                ; $615C: $E6 $30
    jr   z, .jr_616C                              ; $615E: $28 $0C

    call IncrementEntityState                     ; $6160: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $6163: $CD $05 $0C
    ld   [hl], $23                                ; $6166: $36 $23
    xor  a                                        ; $6168: $AF
    ld   [wIntroSubTimer], a                      ; $6169: $EA $02 $D0

.jr_616C
    ld   a, $09                                   ; $616C: $3E $09
    jp   label_004_61BA                           ; $616E: $C3 $BA $61

Data_004_6171::
    db   $01, $08, $08, $08, $08, $08, $01, $02, $03, $00

func_004_617B::
    call GetEntityTransitionCountdown             ; $617B: $CD $05 $0C
    jr   nz, .jr_61B6                             ; $617E: $20 $36

    call IncrementEntityState                     ; $6180: $CD $12 $3B
    ld   a, $02                                   ; $6183: $3E $02
    ld   [wEntitiesSpriteVariantTable], a         ; $6185: $EA $B0 $C3
    ld   a, ENTITY_FISHERMAN_FISHING_GAME         ; $6188: $3E $54
    call SpawnNewEntity_trampoline                ; $618A: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $618D: $21 $00 $C2
    add  hl, de                                   ; $6190: $19
    ld   [hl], $78                                ; $6191: $36 $78
    ld   hl, wEntitiesPosYTable                   ; $6193: $21 $10 $C2
    add  hl, de                                   ; $6196: $19
    ld   [hl], $18                                ; $6197: $36 $18
    ld   hl, wEntitiesVelocityXTable              ; $6199: $21 $40 $C2
    add  hl, de                                   ; $619C: $19
    ld   [hl], $E2                                ; $619D: $36 $E2
    ld   hl, wEntitiesVelocityYTable              ; $619F: $21 $50 $C2
    add  hl, de                                   ; $61A2: $19
    ld   [hl], $FA                                ; $61A3: $36 $FA
    ld   hl, wEntitiesPrivateState1Table          ; $61A5: $21 $B0 $C2
    add  hl, de                                   ; $61A8: $19
    ld   [hl], $01                                ; $61A9: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $61AB: $21 $E0 $C2
    add  hl, de                                   ; $61AE: $19
    ld   [hl], $14                                ; $61AF: $36 $14
    ld   a, JINGLE_FALL_DOWN                      ; $61B1: $3E $08
    ldh  [hJingle], a                             ; $61B3: $E0 $F2
    ret                                           ; $61B5: $C9

.jr_61B6
    rra                                           ; $61B6: $1F
    rra                                           ; $61B7: $1F
    and  $1F                                      ; $61B8: $E6 $1F

label_004_61BA:
    ld   e, a                                     ; $61BA: $5F
    ld   d, b                                     ; $61BB: $50
    ld   hl, Data_004_6171                        ; $61BC: $21 $71 $61
    add  hl, de                                   ; $61BF: $19
    ld   a, [hl]                                  ; $61C0: $7E
    ld   [wEntitiesSpriteVariantTable], a         ; $61C1: $EA $B0 $C3
    ld   e, a                                     ; $61C4: $5F
    ld   d, b                                     ; $61C5: $50
    ld   hl, Data_004_6092                        ; $61C6: $21 $92 $60
    add  hl, de                                   ; $61C9: $19
    ldh  a, [hLinkPositionX]                      ; $61CA: $F0 $98
    add  [hl]                                     ; $61CC: $86
    ldh  [hActiveEntityPosX], a                   ; $61CD: $E0 $EE
    ld   hl, Data_004_609B                        ; $61CF: $21 $9B $60
    add  hl, de                                   ; $61D2: $19
    ldh  a, [hLinkPositionY]                      ; $61D3: $F0 $99
    add  [hl]                                     ; $61D5: $86
    ldh  [hActiveEntityVisualPosY], a             ; $61D6: $E0 $EC
    xor  a                                        ; $61D8: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $61D9: $E0 $F1
    ld   de, Unknown081SpriteVariants             ; $61DB: $11 $6D $62
    call RenderActiveEntitySpritesPair            ; $61DE: $CD $C0 $3B
    jp   CopyEntityPositionToActivePosition       ; $61E1: $C3 $8A $3D

func_004_61E4::
    ret                                           ; $61E4: $C9

func_004_61E5::
    ld   a, [wDialogState]                        ; $61E5: $FA $9F $C1
    and  a                                        ; $61E8: $A7
    ret  nz                                       ; $61E9: $C0

    ld   a, [wDialogAskSelectionIndex]            ; $61EA: $FA $77 $C1
    and  a                                        ; $61ED: $A7
    jr   nz, jr_004_6237                          ; $61EE: $20 $47

    ld   a, [wD004]                               ; $61F0: $FA $04 $D0
    cp   $05                                      ; $61F3: $FE $05
    jr   c, .jr_6202                              ; $61F5: $38 $0B

    call_open_dialog Dialog04B                    ; $61F7
    call IncrementEntityState                     ; $61FC: $CD $12 $3B
    ld   [hl], $05                                ; $61FF: $36 $05
    ret                                           ; $6201: $C9

.jr_6202
    push hl                                       ; $6202: $E5
    push de                                       ; $6203: $D5
    ld   a, [wAddRupeeBufferLow]                  ; $6204: $FA $90 $DB
    ld   e, a                                     ; $6207: $5F
    ld   a, [wAddRupeeBufferHigh]                 ; $6208: $FA $8F $DB
    ld   d, a                                     ; $620B: $57
    ld   a, [wRupeeCountLow]                      ; $620C: $FA $5E $DB
    ld   l, a                                     ; $620F: $6F
    ld   a, [wRupeeCountHigh]                     ; $6210: $FA $5D $DB
    ld   h, a                                     ; $6213: $67

.loop_6214
    ld   a, e                                     ; $6214: $7B
    or   d                                        ; $6215: $B2
    jr   z, .jr_621E                              ; $6216: $28 $06

    daa                                           ; $6218: $27
    inc  hl                                       ; $6219: $23
    daa                                           ; $621A: $27
    dec  de                                       ; $621B: $1B
    jr   .loop_6214                               ; $621C: $18 $F6

    ; Play again: remove the price from the player's rupees
.jr_621E
    ld   a, l                                     ; $621E: $7D
    sub  $10                                      ; $621F: $D6 $10
    ld   a, h                                     ; $6221: $7C
    sbc  $00                                      ; $6222: $DE $00
    pop  de                                       ; $6224: $D1
    pop  hl                                       ; $6225: $E1
    jr   c, jr_004_623F                           ; $6226: $38 $17

    ld   a, FISHING_GAME_PRICE                    ; $6228: $3E $0A
    ld   [wSubstractRupeeBufferLow], a            ; $622A: $EA $92 $DB
    call_open_dialog Dialog047                    ; $622D
    call IncrementEntityState                     ; $6232: $CD $12 $3B
    ld   [hl], b                                  ; $6235: $70
    ret                                           ; $6236: $C9

jr_004_6237:
    call_open_dialog Dialog046                    ; $6237
    jp   IncrementEntityState                     ; $623C: $C3 $12 $3B

jr_004_623F:
    call_open_dialog Dialog04E                    ; $623F
    jp   IncrementEntityState                     ; $6244: $C3 $12 $3B

func_004_6247::
    ld   a, [wDialogState]                        ; $6247: $FA $9F $C1
    and  a                                        ; $624A: $A7
    ret  nz                                       ; $624B: $C0

    call UnloadAllEntities                        ; $624C: $CD $83 $3E
    jp   WarpToFishingGame                        ; $624F: $C3 $FB $67

func_004_6252::
    ld   a, [wDialogState]                        ; $6252: $FA $9F $C1
    and  a                                        ; $6255: $A7
    ret  nz                                       ; $6256: $C0

    call IncrementEntityState                     ; $6257: $CD $12 $3B
    ld   [hl], $04                                ; $625A: $36 $04
    ld   a, [wDialogAskSelectionIndex]            ; $625C: $FA $77 $C1
    and  a                                        ; $625F: $A7
    jr   nz, .jr_6267                             ; $6260: $20 $05

    jp_open_dialog Dialog04C                      ; $6262

.jr_6267
    jp_open_dialog Dialog046                      ; $6267

func_004_626C::
    ret                                           ; $626C: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown081SpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
.variant2
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
.variant4
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

FishingLureHandler::
    ld   a, c                                     ; $6281: $79
    ld   [wD003], a                               ; $6282: $EA $03 $D0
    ld   de, Unknown081SpriteVariants             ; $6285: $11 $6D $62
    call RenderActiveEntitySpritesPair            ; $6288: $CD $C0 $3B
    ldh  a, [hActiveEntityPosX]                   ; $628B: $F0 $EE
    ld   [wIsFileSelectionArrowShifted], a        ; $628D: $EA $00 $D0
    ldh  a, [hActiveEntityPosY]                   ; $6290: $F0 $EF
    ld   [wIntroTimer], a                         ; $6292: $EA $01 $D0
    call ReturnIfNonInteractive_04                ; $6295: $CD $A3 $7F
    ldh  a, [hActiveEntityState]                  ; $6298: $F0 $F0
    JP_TABLE                                      ; $629A
._00 dw func_004_629F                             ; $629B
._01 dw func_004_6308                             ; $629D

func_004_629F::
    call AddEntityVelocityToPos_04
    call UpdateEntityYPosWithVelocity_04          ; $62A2: $CD $CD $6D
    ldh  a, [hPressedButtonsMask]                 ; $62A5: $F0 $CB
    and  $01                                      ; $62A7: $E6 $01
    jr   z, .jr_62BC                              ; $62A9: $28 $11

    ldh  a, [hFrameCounter]                       ; $62AB: $F0 $E7
    and  $01                                      ; $62AD: $E6 $01
    jr   nz, .jr_62BC                             ; $62AF: $20 $0B

    ld   hl, wEntitiesVelocityXTable              ; $62B1: $21 $40 $C2
    add  hl, bc                                   ; $62B4: $09
    ld   a, [hl]                                  ; $62B5: $7E
    and  a                                        ; $62B6: $A7
    jr   z, .jr_62BC                              ; $62B7: $28 $03

    inc  [hl]                                     ; $62B9: $34
    jr   jr_004_62C1                              ; $62BA: $18 $05

.jr_62BC
    call GetEntityTransitionCountdown             ; $62BC: $CD $05 $0C
    jr   nz, jr_004_62E7                          ; $62BF: $20 $26

jr_004_62C1:
    ldh  a, [hFrameCounter]                       ; $62C1: $F0 $E7
    and  $01                                      ; $62C3: $E6 $01
    jr   nz, .jr_62D1                             ; $62C5: $20 $0A

    ld   hl, wEntitiesVelocityYTable              ; $62C7: $21 $50 $C2
    add  hl, bc                                   ; $62CA: $09
    ld   a, [hl]                                  ; $62CB: $7E
    cp   $20                                      ; $62CC: $FE $20
    jr   z, .jr_62D1                              ; $62CE: $28 $01

    inc  [hl]                                     ; $62D0: $34

.jr_62D1
    ld   hl, wEntitiesInertiaTable                ; $62D1: $21 $D0 $C3
    add  hl, bc                                   ; $62D4: $09
    ld   a, [hl]                                  ; $62D5: $7E
    inc  a                                        ; $62D6: $3C
    cp   $03                                      ; $62D7: $FE $03
    ld   [hl], a                                  ; $62D9: $77
    jr   nz, jr_004_62E7                          ; $62DA: $20 $0B

    xor  a                                        ; $62DC: $AF
    ld   [hl], a                                  ; $62DD: $77
    ld   hl, wEntitiesVelocityXTable              ; $62DE: $21 $40 $C2
    add  hl, bc                                   ; $62E1: $09
    ld   a, [hl]                                  ; $62E2: $7E
    and  a                                        ; $62E3: $A7
    jr   z, jr_004_62E7                           ; $62E4: $28 $01

    inc  [hl]                                     ; $62E6: $34

jr_004_62E7:
    ld   hl, wEntitiesPosYTable                   ; $62E7: $21 $10 $C2
    add  hl, bc                                   ; $62EA: $09
    ld   a, [hl]                                  ; $62EB: $7E
    cp   $2A                                      ; $62EC: $FE $2A
    jr   c, ret_004_6307                          ; $62EE: $38 $17

    call ClearEntityVelocity                      ; $62F0: $CD $7F $3D
    call IncrementEntityState                     ; $62F3: $CD $12 $3B

label_004_62F6:
    ldh  a, [hActiveEntityVisualPosY]             ; $62F6: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $62F8: $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ; $62FA: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $62FC: $E0 $D7
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $62FE: $3E $01
    call AddTranscientVfx                         ; $6300: $CD $C7 $0C
    ld   a, JINGLE_WATER_SPLASH                   ; $6303: $3E $0E
    ldh  [hJingle], a                             ; $6305: $E0 $F2

ret_004_6307:
    ret                                           ; $6307: $C9

func_004_6308::
    ld   hl, wEntitiesSpriteVariantTable          ; $6308: $21 $B0 $C3
    ld   [hl], $00                                ; $630B: $36 $00
    call GetEntityTransitionCountdown             ; $630D: $CD $05 $0C
    jr   z, .jr_6317                              ; $6310: $28 $05

    ld   hl, wEntitiesSpriteVariantTable          ; $6312: $21 $B0 $C3
    ld   [hl], $04                                ; $6315: $36 $04

.jr_6317
    call GetEntityPrivateCountdown1               ; $6317: $CD $00 $0C
    jr   z, .jr_6321                              ; $631A: $28 $05

    ld   hl, wEntitiesSpriteVariantTable          ; $631C: $21 $B0 $C3
    ld   [hl], $05                                ; $631F: $36 $05

.jr_6321
    ldh  a, [hFrameCounter]                       ; $6321: $F0 $E7
    rra                                           ; $6323: $1F
    rra                                           ; $6324: $1F
    rra                                           ; $6325: $1F
    rra                                           ; $6326: $1F
    and  $01                                      ; $6327: $E6 $01
    call SetEntitySpriteVariant                   ; $6329: $CD $0C $3B
    call UpdateEntityPosWithVelocity_04           ; $632C: $CD $CA $6D
    ldh  a, [hFrameCounter]                       ; $632F: $F0 $E7
    and  $07                                      ; $6331: $E6 $07
    jr   nz, jr_004_6354                          ; $6333: $20 $1F

    ld   hl, wEntitiesVelocityYTable              ; $6335: $21 $50 $C2
    add  hl, bc                                   ; $6338: $09
    ld   a, [hl]                                  ; $6339: $7E
    sub  $04                                      ; $633A: $D6 $04
    jr   z, jr_004_6345                           ; $633C: $28 $07

    and  $80                                      ; $633E: $E6 $80
    jr   z, .jr_6344                              ; $6340: $28 $02

    inc  [hl]                                     ; $6342: $34
    inc  [hl]                                     ; $6343: $34

.jr_6344
    dec  [hl]                                     ; $6344: $35

jr_004_6345:
    ld   hl, wEntitiesVelocityXTable              ; $6345: $21 $40 $C2
    add  hl, bc                                   ; $6348: $09
    ld   a, [hl]                                  ; $6349: $7E
    and  a                                        ; $634A: $A7
    jr   z, jr_004_6354                           ; $634B: $28 $07

    and  $80                                      ; $634D: $E6 $80
    jr   z, .jr_6353                              ; $634F: $28 $02

    inc  [hl]                                     ; $6351: $34
    inc  [hl]                                     ; $6352: $34

.jr_6353
    dec  [hl]                                     ; $6353: $35

jr_004_6354:
    ldh  a, [hJoypadState]                        ; $6354: $F0 $CC
    and  J_A | J_B                                ; $6356: $E6 $30
    jr   z, jr_004_63B9                           ; $6358: $28 $5F

    call GetEntityTransitionCountdown             ; $635A: $CD $05 $0C
    ld   [hl], $08                                ; $635D: $36 $08
    ldh  a, [hLinkPositionX]                      ; $635F: $F0 $98
    push af                                       ; $6361: $F5
    sub  $17                                      ; $6362: $D6 $17
    ldh  [hLinkPositionX], a                      ; $6364: $E0 $98
    ld   a, $04                                   ; $6366: $3E $04
    call ApplyVectorTowardsLink_trampoline        ; $6368: $CD $AA $3B
    pop  af                                       ; $636B: $F1
    ldh  [hLinkPositionX], a                      ; $636C: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $636E: $F0 $EC
    cp   $25                                      ; $6370: $FE $25
    jr   nc, jr_004_63AD                          ; $6372: $30 $39

    ldh  a, [hActiveEntityPosX]                   ; $6374: $F0 $EE
    cp   $70                                      ; $6376: $FE $70
    jr   c, jr_004_63AD                           ; $6378: $38 $33

    ld   hl, wEntitiesStateTable                  ; $637A: $21 $90 $C2
    ld   [hl], $03                                ; $637D: $36 $03
    call_open_dialog Dialog048                    ; $637F
    call ClearEntityStatusBank04                  ; $6384: $CD $7A $6D
    ld   e, $0F                                   ; $6387: $1E $0F
    ld   d, b                                     ; $6389: $50

jr_004_638A:
    ld   hl, wEntitiesStatusTable                 ; $638A: $21 $80 $C2
    add  hl, de                                   ; $638D: $19
    ld   a, [hl]                                  ; $638E: $7E
    and  a                                        ; $638F: $A7
    jr   z, .jr_63A7                              ; $6390: $28 $15

    ld   hl, wEntitiesPrivateState1Table          ; $6392: $21 $B0 $C2
    add  hl, de                                   ; $6395: $19
    ld   a, [hl]                                  ; $6396: $7E
    cp   $02                                      ; $6397: $FE $02
    jr   c, .jr_63A7                              ; $6399: $38 $0C

    ld   hl, wEntitiesStateTable                  ; $639B: $21 $90 $C2
    add  hl, de                                   ; $639E: $19
    ld   a, [hl]                                  ; $639F: $7E
    cp   $02                                      ; $63A0: $FE $02
    jr   c, .jr_63A7                              ; $63A2: $38 $03

    and  $01                                      ; $63A4: $E6 $01
    ld   [hl], a                                  ; $63A6: $77

.jr_63A7
    dec  e                                        ; $63A7: $1D
    ld   a, e                                     ; $63A8: $7B
    cp   $FF                                      ; $63A9: $FE $FF
    jr   nz, jr_004_638A                          ; $63AB: $20 $DD

jr_004_63AD:
    ldh  a, [hFrameCounter]                       ; $63AD: $F0 $E7
    rra                                           ; $63AF: $1F
    rra                                           ; $63B0: $1F
    rra                                           ; $63B1: $1F
    and  $01                                      ; $63B2: $E6 $01
    call SetEntitySpriteVariant                   ; $63B4: $CD $0C $3B
    jr   jr_004_63DE                              ; $63B7: $18 $25

jr_004_63B9:
    ldh  a, [hJoypadState]                        ; $63B9: $F0 $CC
    and  J_RIGHT | J_UP                           ; $63BB: $E6 $05
    jr   z, jr_004_63DE                           ; $63BD: $28 $1F

    ldh  a, [hActiveEntityVisualPosY]             ; $63BF: $F0 $EC
    cp   $30                                      ; $63C1: $FE $30
    jr   c, jr_004_63DE                           ; $63C3: $38 $19

    ld   hl, wEntitiesPrivateCountdown2Table      ; $63C5: $21 $00 $C3
    add  hl, bc                                   ; $63C8: $09
    ld   a, [hl]                                  ; $63C9: $7E
    and  a                                        ; $63CA: $A7
    jr   nz, jr_004_63DE                          ; $63CB: $20 $11

    ld   hl, wEntitiesVelocityYTable              ; $63CD: $21 $50 $C2
    add  hl, bc                                   ; $63D0: $09
    ld   [hl], $FA                                ; $63D1: $36 $FA
    ld   hl, wEntitiesPrivateCountdown2Table      ; $63D3: $21 $00 $C3
    add  hl, bc                                   ; $63D6: $09
    ld   [hl], $50                                ; $63D7: $36 $50
    call GetEntityPrivateCountdown1               ; $63D9: $CD $00 $0C
    ld   [hl], $10                                ; $63DC: $36 $10

jr_004_63DE:
    ldh  a, [hActiveEntityPosX]                   ; $63DE: $F0 $EE
    ld   hl, wEntitiesPosXTable                   ; $63E0: $21 $00 $C2
    add  hl, bc                                   ; $63E3: $09
    cp   [hl]                                     ; $63E4: $BE
    jr   nz, .jr_63F0                             ; $63E5: $20 $09

    ldh  a, [hActiveEntityPosY]                   ; $63E7: $F0 $EF
    ld   hl, wEntitiesPosYTable                   ; $63E9: $21 $10 $C2
    add  hl, bc                                   ; $63EC: $09
    cp   [hl]                                     ; $63ED: $BE
    jr   z, jr_004_6402                           ; $63EE: $28 $12

.jr_63F0
    ld   hl, wEntitiesVelocityYTable              ; $63F0: $21 $50 $C2
    add  hl, bc                                   ; $63F3: $09
    ld   a, [hl]                                  ; $63F4: $7E
    push af                                       ; $63F5: $F5
    push hl                                       ; $63F6: $E5
    and  $80                                      ; $63F7: $E6 $80
    jr   z, .jr_63FC                              ; $63F9: $28 $01

    ld   [hl], b                                  ; $63FB: $70

.jr_63FC
    call DefaultEntityPhysics_trampoline          ; $63FC: $CD $23 $3B
    pop  hl                                       ; $63FF: $E1
    pop  af                                       ; $6400: $F1
    ld   [hl], a                                  ; $6401: $77

jr_004_6402:
    ld   hl, wEntitiesCollisionsTable             ; $6402: $21 $A0 $C2
    add  hl, bc                                   ; $6405: $09
    ld   a, [hl]                                  ; $6406: $7E
    and  a                                        ; $6407: $A7
    jr   z, .jr_640E                              ; $6408: $28 $04

    xor  a                                        ; $640A: $AF
    call SetEntitySpriteVariant                   ; $640B: $CD $0C $3B

.jr_640E
    ld   hl, wEntitiesVelocityYTable              ; $640E: $21 $50 $C2
    add  hl, bc                                   ; $6411: $09
    ld   a, [hl]                                  ; $6412: $7E
    rla                                           ; $6413: $17
    ret  c                                        ; $6414: $D8

    ld   a, $02                                   ; $6415: $3E $02
    jp   SetEntitySpriteVariant                   ; $6417: $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SmallFishSpriteVariants::
.variant0
    db $4C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $4C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $48, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $48, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $4A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $4C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $4C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $4A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $48, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $48, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

SmallFishHandler::
    ld   hl, wEntitiesDirectionTable              ; $643A: $21 $80 $C3
    add  hl, bc                                   ; $643D: $09
    ld   a, [hl]                                  ; $643E: $7E
    and  a                                        ; $643F: $A7
    jr   nz, .jr_6448                             ; $6440: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ; $6442: $F0 $F1
    add  $04                                      ; $6444: $C6 $04
    ldh  [hActiveEntitySpriteVariant], a          ; $6446: $E0 $F1

.jr_6448
    ld   de, SmallFishSpriteVariants              ; $6448: $11 $1A $64
    call RenderActiveEntitySpritesPair            ; $644B: $CD $C0 $3B

.sharedFishBehavior
    ;
    ; Behavior shared between small fish and big fish
    ;

    call ReturnIfNonInteractive_04                ; $644E: $CD $A3 $7F
    call UpdateEntityPosWithVelocity_04           ; $6451: $CD $CA $6D

    ldh  a, [hActiveEntityState]                  ; $6454: $F0 $F0
    JP_TABLE                                      ; $6456
._00 dw func_004_6463                             ; $6457
._01 dw func_004_649B                             ; $6459
._02 dw func_004_64F2                             ; $645B
._03 dw func_004_652D                             ; $645D
._04 dw func_004_657A                             ; $645F
._05 dw func_004_6689                             ; $6461

func_004_6463::
    call func_004_679B                            ; $6463: $CD $9B $67
    ld   hl, wEntitiesPrivateState1Table          ; $6466: $21 $B0 $C2
    add  hl, bc                                   ; $6469: $09
    ld   a, [hl]                                  ; $646A: $7E
    cp   $03                                      ; $646B: $FE $03
    jp   z, label_004_6738                        ; $646D: $CA $38 $67

    call GetEntityTransitionCountdown             ; $6470: $CD $05 $0C
    jr   nz, .jr_6482                             ; $6473: $20 $0D

    ld   [hl], $30                                ; $6475: $36 $30
    ld   hl, wEntitiesDirectionTable              ; $6477: $21 $80 $C3
    add  hl, bc                                   ; $647A: $09
    ld   a, [hl]                                  ; $647B: $7E
    xor  $01                                      ; $647C: $EE $01
    ld   [hl], a                                  ; $647E: $77
    call IncrementEntityState                     ; $647F: $CD $12 $3B

.jr_6482
    ldh  a, [hFrameCounter]                       ; $6482: $F0 $E7
    and  $03                                      ; $6484: $E6 $03
    jr   nz, jr_004_6497                          ; $6486: $20 $0F

    ld   hl, wEntitiesVelocityXTable              ; $6488: $21 $40 $C2
    add  hl, bc                                   ; $648B: $09
    ld   a, [hl]                                  ; $648C: $7E
    and  a                                        ; $648D: $A7
    jr   z, jr_004_6497                           ; $648E: $28 $07

    and  $80                                      ; $6490: $E6 $80
    jr   z, .jr_6496                              ; $6492: $28 $02

    inc  [hl]                                     ; $6494: $34
    inc  [hl]                                     ; $6495: $34

.jr_6496
    dec  [hl]                                     ; $6496: $35

jr_004_6497:
    jr   jr_004_64E0                              ; $6497: $18 $47

Data_004_6499::
    db   $10, $F0

func_004_649B::
    call func_004_679B                            ; $649B: $CD $9B $67
    ld   hl, wEntitiesPrivateState1Table          ; $649E: $21 $B0 $C2
    add  hl, bc                                   ; $64A1: $09
    ld   a, [hl]                                  ; $64A2: $7E
    cp   $03                                      ; $64A3: $FE $03
    jp   z, label_004_6762                        ; $64A5: $CA $62 $67

    call GetEntityTransitionCountdown             ; $64A8: $CD $05 $0C
    jr   nz, .jr_64B3                             ; $64AB: $20 $06

    ld   [hl], $50                                ; $64AD: $36 $50
    call IncrementEntityState                     ; $64AF: $CD $12 $3B
    ld   [hl], b                                  ; $64B2: $70

.jr_64B3
    ldh  a, [hFrameCounter]                       ; $64B3: $F0 $E7
    rra                                           ; $64B5: $1F
    rra                                           ; $64B6: $1F
    rra                                           ; $64B7: $1F
    and  $01                                      ; $64B8: $E6 $01
    call SetEntitySpriteVariant                   ; $64BA: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $64BD: $F0 $E7
    and  $03                                      ; $64BF: $E6 $03
    jr   nz, jr_004_64E0                          ; $64C1: $20 $1D

    ld   hl, wEntitiesVelocityXTable              ; $64C3: $21 $40 $C2
    add  hl, bc                                   ; $64C6: $09
    ld   a, [hl]                                  ; $64C7: $7E
    push hl                                       ; $64C8: $E5
    ld   hl, wEntitiesDirectionTable              ; $64C9: $21 $80 $C3
    add  hl, bc                                   ; $64CC: $09
    ld   e, [hl]                                  ; $64CD: $5E
    ld   d, $00                                   ; $64CE: $16 $00
    ld   hl, Data_004_6499                        ; $64D0: $21 $99 $64
    add  hl, de                                   ; $64D3: $19
    sub  [hl]                                     ; $64D4: $96
    pop  hl                                       ; $64D5: $E1
    and  a                                        ; $64D6: $A7
    jr   z, jr_004_64E0                           ; $64D7: $28 $07

    and  $80                                      ; $64D9: $E6 $80
    jr   z, .jr_64DF                              ; $64DB: $28 $02

    inc  [hl]                                     ; $64DD: $34
    inc  [hl]                                     ; $64DE: $34

.jr_64DF
    dec  [hl]                                     ; $64DF: $35

jr_004_64E0:
    ld   hl, wEntitiesPosYTable                   ; $64E0: $21 $10 $C2
    add  hl, bc                                   ; $64E3: $09
    ld   a, [hl]                                  ; $64E4: $7E
    cp   $34                                      ; $64E5: $FE $34
    jr   nc, .ret_64EF                            ; $64E7: $30 $06

    inc  [hl]                                     ; $64E9: $34
    ld   hl, wEntitiesVelocityYTable              ; $64EA: $21 $50 $C2
    add  hl, bc                                   ; $64ED: $09
    ld   [hl], b                                  ; $64EE: $70

.ret_64EF
    ret                                           ; $64EF: $C9

Data_004_64F0::
    db   $F2, $14

func_004_64F2::
    ldh  a, [hFrameCounter]                       ; $64F2: $F0 $E7
    rra                                           ; $64F4: $1F
    rra                                           ; $64F5: $1F
    rra                                           ; $64F6: $1F
    and  $01                                      ; $64F7: $E6 $01
    call SetEntitySpriteVariant                   ; $64F9: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $64FC: $CD $05 $0C
    jr   nz, .jr_6504                             ; $64FF: $20 $03

    call IncrementEntityState                     ; $6501: $CD $12 $3B

.jr_6504
    ldh  a, [hLinkPositionX]                      ; $6504: $F0 $98
    push af                                       ; $6506: $F5
    ldh  a, [hLinkPositionY]                      ; $6507: $F0 $99
    push af                                       ; $6509: $F5
    ld   hl, wEntitiesDirectionTable              ; $650A: $21 $80 $C3
    add  hl, bc                                   ; $650D: $09
    ld   e, [hl]                                  ; $650E: $5E
    ld   d, b                                     ; $650F: $50
    ld   hl, Data_004_64F0                        ; $6510: $21 $F0 $64
    add  hl, de                                   ; $6513: $19
    ld   a, [wIsFileSelectionArrowShifted]        ; $6514: $FA $00 $D0
    add  [hl]                                     ; $6517: $86
    ldh  [hLinkPositionX], a                      ; $6518: $E0 $98
    ld   a, [wIntroTimer]                         ; $651A: $FA $01 $D0
    ldh  [hLinkPositionY], a                      ; $651D: $E0 $99
    ld   a, $04                                   ; $651F: $3E $04
    call ApplyVectorTowardsLink_trampoline        ; $6521: $CD $AA $3B
    pop  af                                       ; $6524: $F1
    ldh  [hLinkPositionY], a                      ; $6525: $E0 $99
    pop  af                                       ; $6527: $F1
    ldh  [hLinkPositionX], a                      ; $6528: $E0 $98
    jp   UpdateEntityPosWithVelocity_04           ; $652A: $C3 $CA $6D

func_004_652D::
    ldh  a, [hFrameCounter]                       ; $652D: $F0 $E7
    rra                                           ; $652F: $1F
    rra                                           ; $6530: $1F
    and  $01                                      ; $6531: $E6 $01
    add  $02                                      ; $6533: $C6 $02
    call SetEntitySpriteVariant                   ; $6535: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $6538: $F0 $98
    push af                                       ; $653A: $F5
    ldh  a, [hLinkPositionY]                      ; $653B: $F0 $99
    push af                                       ; $653D: $F5
    ld   a, [wIsFileSelectionArrowShifted]        ; $653E: $FA $00 $D0
    add  $04                                      ; $6541: $C6 $04
    ldh  [hLinkPositionX], a                      ; $6543: $E0 $98
    ld   a, [wIntroTimer]                         ; $6545: $FA $01 $D0
    ldh  [hLinkPositionY], a                      ; $6548: $E0 $99
    ld   a, $10                                   ; $654A: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $654C: $CD $AA $3B
    pop  af                                       ; $654F: $F1
    ldh  [hLinkPositionY], a                      ; $6550: $E0 $99
    pop  af                                       ; $6552: $F1
    ldh  [hLinkPositionX], a                      ; $6553: $E0 $98
    call UpdateEntityPosWithVelocity_04           ; $6555: $CD $CA $6D
    ld   a, [wIsFileSelectionArrowShifted]        ; $6558: $FA $00 $D0
    ld   hl, hActiveEntityPosX                    ; $655B: $21 $EE $FF
    sub  [hl]                                     ; $655E: $96
    add  $08                                      ; $655F: $C6 $08
    cp   $10                                      ; $6561: $FE $10
    jr   nc, .ret_6575                            ; $6563: $30 $10

    call ClearEntityVelocity                      ; $6565: $CD $7F $3D
    call IncrementEntityState                     ; $6568: $CD $12 $3B
    ld   a, [wD003]                               ; $656B: $FA $03 $D0
    ld   e, a                                     ; $656E: $5F
    ld   d, b                                     ; $656F: $50
    ld   hl, wEntitiesStatusTable                 ; $6570: $21 $80 $C2
    add  hl, de                                   ; $6573: $19
    ld   [hl], b                                  ; $6574: $70

.ret_6575
    ret                                           ; $6575: $C9

Data_004_6576::
IF __PATCH_0__
    db   $54, $02
ELSE
    db   $54, $00
ENDC

Data_004_6578::
    db   $08, $F8

func_004_657A::
    ld   hl, wEntitiesDirectionTable              ; $657A: $21 $80 $C3
    add  hl, bc                                   ; $657D: $09
    ld   e, [hl]                                  ; $657E: $5E
    ld   d, b                                     ; $657F: $50
    ld   hl, Data_004_6578                        ; $6580: $21 $78 $65
    add  hl, de                                   ; $6583: $19
    ldh  a, [hActiveEntityPosX]                   ; $6584: $F0 $EE
    add  [hl]                                     ; $6586: $86
    ldh  [hActiveEntityPosX], a                   ; $6587: $E0 $EE
    ld   hl, hActiveEntitySpriteVariant           ; $6589: $21 $F1 $FF
    ld   [hl], b                                  ; $658C: $70
    ld   de, Data_004_6576                        ; $658D: $11 $76 $65
    call RenderActiveEntitySprite                 ; $6590: $CD $77 $3C
    call CopyEntityPositionToActivePosition       ; $6593: $CD $8A $3D
    ldh  a, [hFrameCounter]                       ; $6596: $F0 $E7
    rra                                           ; $6598: $1F
    rra                                           ; $6599: $1F
    rra                                           ; $659A: $1F
    and  $01                                      ; $659B: $E6 $01
    call SetEntitySpriteVariant                   ; $659D: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $65A0: $F0 $E7
    and  $07                                      ; $65A2: $E6 $07
    jr   nz, jr_004_65DB                          ; $65A4: $20 $35

    ldh  a, [hLinkPositionX]                      ; $65A6: $F0 $98
    push af                                       ; $65A8: $F5
    ldh  a, [hLinkPositionY]                      ; $65A9: $F0 $99
    push af                                       ; $65AB: $F5
    ld   a, $00                                   ; $65AC: $3E $00
    ldh  [hLinkPositionX], a                      ; $65AE: $E0 $98
    ld   a, $59                                   ; $65B0: $3E $59
    ldh  [hLinkPositionY], a                      ; $65B2: $E0 $99
    ld   a, $08                                   ; $65B4: $3E $08
    call GetVectorTowardsLink_trampoline          ; $65B6: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $65B9: $F0 $D7
    ld   hl, wEntitiesVelocityYTable              ; $65BB: $21 $50 $C2
    add  hl, bc                                   ; $65BE: $09
    sub  [hl]                                     ; $65BF: $96
    inc  [hl]                                     ; $65C0: $34
    and  $80                                      ; $65C1: $E6 $80
    jr   z, .jr_65C7                              ; $65C3: $28 $02

    dec  [hl]                                     ; $65C5: $35
    dec  [hl]                                     ; $65C6: $35

.jr_65C7
    ldh  a, [hMultiPurpose1]                      ; $65C7: $F0 $D8
    ld   hl, wEntitiesVelocityXTable              ; $65C9: $21 $40 $C2
    add  hl, bc                                   ; $65CC: $09
    sub  [hl]                                     ; $65CD: $96
    inc  [hl]                                     ; $65CE: $34
    and  $80                                      ; $65CF: $E6 $80
    jr   z, .jr_65D5                              ; $65D1: $28 $02

    dec  [hl]                                     ; $65D3: $35
    dec  [hl]                                     ; $65D4: $35

.jr_65D5
    pop  af                                       ; $65D5: $F1
    ldh  [hLinkPositionY], a                      ; $65D6: $E0 $99
    pop  af                                       ; $65D8: $F1
    ldh  [hLinkPositionX], a                      ; $65D9: $E0 $98

jr_004_65DB:
    ldh  a, [hJoypadState]                        ; $65DB: $F0 $CC
    and  J_A | J_B                                ; $65DD: $E6 $30
    jr   z, jr_004_6631                           ; $65DF: $28 $50

    ld   hl, wEntitiesPrivateState1Table          ; $65E1: $21 $B0 $C2
    add  hl, bc                                   ; $65E4: $09
    ld   a, [hl]                                  ; $65E5: $7E
    cp   $03                                      ; $65E6: $FE $03
    jr   nz, .jr_65F1                             ; $65E8: $20 $07

    call GetRandomByte                            ; $65EA: $CD $0D $28
    and  $03                                      ; $65ED: $E6 $03
    jr   z, jr_004_6631                           ; $65EF: $28 $40

.jr_65F1
    ldh  a, [hLinkPositionX]                      ; $65F1: $F0 $98
    push af                                       ; $65F3: $F5
    sub  $14                                      ; $65F4: $D6 $14
    ldh  [hLinkPositionX], a                      ; $65F6: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $65F8: $F0 $99
    push af                                       ; $65FA: $F5
    add  $08                                      ; $65FB: $C6 $08
    ldh  [hLinkPositionY], a                      ; $65FD: $E0 $99
    ld   a, $03                                   ; $65FF: $3E $03
    call GetVectorTowardsLink_trampoline          ; $6601: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6604: $F0 $D7
    ld   hl, wEntitiesVelocityYTable              ; $6606: $21 $50 $C2
    add  hl, bc                                   ; $6609: $09
    sub  [hl]                                     ; $660A: $96
    inc  [hl]                                     ; $660B: $34
    inc  [hl]                                     ; $660C: $34
    and  $80                                      ; $660D: $E6 $80
    jr   z, .jr_6615                              ; $660F: $28 $04

    dec  [hl]                                     ; $6611: $35
    dec  [hl]                                     ; $6612: $35
    dec  [hl]                                     ; $6613: $35
    dec  [hl]                                     ; $6614: $35

.jr_6615
    ldh  a, [hMultiPurpose1]                      ; $6615: $F0 $D8
    ld   hl, wEntitiesVelocityXTable              ; $6617: $21 $40 $C2
    add  hl, bc                                   ; $661A: $09
    sub  [hl]                                     ; $661B: $96
    inc  [hl]                                     ; $661C: $34
    inc  [hl]                                     ; $661D: $34
    and  $80                                      ; $661E: $E6 $80
    jr   z, .jr_6626                              ; $6620: $28 $04

    dec  [hl]                                     ; $6622: $35
    dec  [hl]                                     ; $6623: $35
    dec  [hl]                                     ; $6624: $35
    dec  [hl]                                     ; $6625: $35

.jr_6626
    pop  af                                       ; $6626: $F1
    ldh  [hLinkPositionY], a                      ; $6627: $E0 $99
    pop  af                                       ; $6629: $F1
    ldh  [hLinkPositionX], a                      ; $662A: $E0 $98
    call GetEntityTransitionCountdown             ; $662C: $CD $05 $0C
    ld   [hl], $10                                ; $662F: $36 $10

jr_004_6631:
    call UpdateEntityPosWithVelocity_04           ; $6631: $CD $CA $6D
    ld   hl, wEntitiesVelocityXTable              ; $6634: $21 $40 $C2
    add  hl, bc                                   ; $6637: $09
    ld   a, [hl]                                  ; $6638: $7E
    and  a                                        ; $6639: $A7
    jr   z, .jr_6644                              ; $663A: $28 $08

    rlca                                          ; $663C: $07
    and  $01                                      ; $663D: $E6 $01
    ld   hl, wEntitiesDirectionTable              ; $663F: $21 $80 $C3
    add  hl, bc                                   ; $6642: $09
    ld   [hl], a                                  ; $6643: $77

.jr_6644
    ld   hl, wEntitiesSpriteVariantTable          ; $6644: $21 $B0 $C3
    ld   [hl], $05                                ; $6647: $36 $05
    call GetEntityTransitionCountdown             ; $6649: $CD $05 $0C
    jr   z, .jr_6659                              ; $664C: $28 $0B

    ldh  a, [hFrameCounter]                       ; $664E: $F0 $E7
    and  $30                                      ; $6650: $E6 $30
    jr   z, .jr_6659                              ; $6652: $28 $05

    ld   hl, wEntitiesSpriteVariantTable          ; $6654: $21 $B0 $C3
    ld   [hl], $07                                ; $6657: $36 $07

.jr_6659
    ldh  a, [hActiveEntityVisualPosY]             ; $6659: $F0 $EC
    cp   $2C                                      ; $665B: $FE $2C
    jr   nc, .jr_6677                             ; $665D: $30 $18

    ldh  a, [hActiveEntityPosX]                   ; $665F: $F0 $EE
    cp   $74                                      ; $6661: $FE $74
    jr   c, .jr_6677                              ; $6663: $38 $12

    call IncrementEntityState                     ; $6665: $CD $12 $3B
    ld   hl, wEntitiesVelocityXTable              ; $6668: $21 $40 $C2
    add  hl, bc                                   ; $666B: $09
    ld   [hl], $05                                ; $666C: $36 $05
    ld   hl, wEntitiesVelocityYTable              ; $666E: $21 $50 $C2
    add  hl, bc                                   ; $6671: $09
    ld   [hl], $F0                                ; $6672: $36 $F0
    jp   label_004_62F6                           ; $6674: $C3 $F6 $62

.jr_6677
    ldh  a, [hActiveEntityPosX]                   ; $6677: $F0 $EE
    cp   $03                                      ; $6679: $FE $03
    ret  nc                                       ; $667B: $D0

    ld   hl, wEntitiesStateTable                  ; $667C: $21 $90 $C2
    ld   [hl], $03                                ; $667F: $36 $03
    call_open_dialog Dialog049                    ; $6681
    jp   ClearEntityStatusBank04                  ; $6686: $C3 $7A $6D

func_004_6689::
    ld   hl, wEntitiesSpriteVariantTable          ; $6689: $21 $B0 $C3
    ld   [hl], $01                                ; $668C: $36 $01
    call UpdateEntityPosWithVelocity_04           ; $668E: $CD $CA $6D
    ld   hl, wEntitiesVelocityYTable              ; $6691: $21 $50 $C2
    add  hl, bc                                   ; $6694: $09
    inc  [hl]                                     ; $6695: $34
    nop                                           ; $6696: $00
    ld   a, [hl]                                  ; $6697: $7E
    cp   $0C                                      ; $6698: $FE $0C
    ret  nz                                       ; $669A: $C0

    ld   hl, wEntitiesStateTable                  ; $669B: $21 $90 $C2
    ld   [hl], $03                                ; $669E: $36 $03
    ld   a, c                                     ; $66A0: $79
    cp   $0F                                      ; $66A1: $FE $0F
    jr   nz, jr_004_66E6                          ; $66A3: $20 $41

    ldh  a, [hRoomStatus]                         ; $66A5: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $66A7: $E6 $10
    jr   nz, jr_004_66E6                          ; $66A9: $20 $3B

    ld   a, JINGLE_TREASURE_FOUND                 ; $66AB: $3E $01
    ldh  [hJingle], a                             ; $66AD: $E0 $F2
    ldh  a, [hMapRoom]                            ; $66AF: $F0 $F6
    ld   e, a                                     ; $66B1: $5F
    ld   d, $01                                   ; $66B2: $16 $01
    ld   hl, wIndoorARoomStatus                   ; $66B4: $21 $00 $D9
    add  hl, de                                   ; $66B7: $19
    ld   a, [hl]                                  ; $66B8: $7E
    or   ROOM_STATUS_EVENT_1                      ; $66B9: $F6 $10
    ld   [hl], a                                  ; $66BB: $77
    ldh  [hRoomStatus], a                         ; $66BC: $E0 $F8
    ld   a, [wHeartPiecesCount]                   ; $66BE: $FA $5C $DB
    inc  a                                        ; $66C1: $3C
    ld   [wHeartPiecesCount], a                   ; $66C2: $EA $5C $DB
    cp   $04                                      ; $66C5: $FE $04
    jr   nz, .jr_66DA                             ; $66C7: $20 $11

    xor  a                                        ; $66C9: $AF
    ld   [wHeartPiecesCount], a                   ; $66CA: $EA $5C $DB
    ld   hl, wAddHealthBuffer                     ; $66CD: $21 $93 $DB
    ld   [hl], $40                                ; $66D0: $36 $40
    ld   hl, wMaxHearts                           ; $66D2: $21 $5B $DB
    inc  [hl]                                     ; $66D5: $34
    ld_dialog_low a, Dialog1FF ; "It has a piece of heart! New heart" ; $66D6: $3E $FF
    jr   jr_004_66DC                              ; $66D8: $18 $02

.jr_66DA
    ld_dialog_low a, Dialog1FE ; "It has a piece of heart" ; $66DA: $3E $FE

jr_004_66DC:
    call OpenDialogInTable1                       ; $66DC: $CD $73 $23
    ld   hl, wAddRupeeBufferLow                   ; $66DF: $21 $90 $DB
    ld   [hl], $14                                ; $66E2: $36 $14
    jr   jr_004_66FE                              ; $66E4: $18 $18

    ; Check for fish size (in wEntitiesPrivateState1Table)
jr_004_66E6:
    ld   hl, wEntitiesPrivateState1Table          ; $66E6: $21 $B0 $C2
    add  hl, bc                                   ; $66E9: $09
    ld   a, [hl]                                  ; $66EA: $7E
    cp   $03                                      ; $66EB: $FE $03
    ; Nice fish
    ld   e, FISHING_GAME_LARGE_REWARD             ; $66ED: $1E $14
    ld   a, LOW($04A) ; Nice fish dialog id      ; $66EF: $3E $4A
    jr   z, .rewardsSelectionEnd                  ; $66F1: $28 $04
    ; Runt
    ld   e, FISHING_GAME_SMALL_REWARD             ; $66F3: $1E $05
    ld   a, LOW($04D) ; Runt dialog id           ; $66F5: $3E $4D
.rewardsSelectionEnd

    ; Add the prize to the player's rupees
    ld   hl, wAddRupeeBufferLow                   ; $66F7: $21 $90 $DB

    ; Open the prize dialog
    ld   [hl], e                                  ; $66FA: $73
    call OpenDialogInTable0                       ; $66FB: $CD $85 $23

jr_004_66FE:
    jp   ClearEntityStatusBank04                  ; $66FE: $C3 $7A $6D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BigFishSpriteVariants::
.variant0
    db $44, OAM_GBC_PAL_0 | OAMF_PAL0
    db $42, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $44, OAM_GBC_PAL_0 | OAMF_PAL0
    db $46, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $40, OAM_GBC_PAL_0 | OAMF_PAL0
    db $42, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $40, OAM_GBC_PAL_0 | OAMF_PAL0
    db $46, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $42, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $44, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $46, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $44, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $42, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $40, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $46, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $40, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

BigFishHandler::
    ld   hl, wEntitiesDirectionTable              ; $6721: $21 $80 $C3
    add  hl, bc                                   ; $6724: $09
    ld   a, [hl]                                  ; $6725: $7E
    and  a                                        ; $6726: $A7
    jr   nz, .jr_672F                             ; $6727: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ; $6729: $F0 $F1
    add  $04                                      ; $672B: $C6 $04
    ldh  [hActiveEntitySpriteVariant], a          ; $672D: $E0 $F1

.jr_672F
    ld   de, BigFishSpriteVariants                ; $672F: $11 $01 $67
    call RenderActiveEntitySpritesPair            ; $6732: $CD $C0 $3B
    jp  SmallFishHandler.sharedFishBehavior       ; $6735: $C3 $4E $64

label_004_6738:
    call GetEntityTransitionCountdown             ; $6738: $CD $05 $0C
    jr   nz, .jr_674A                             ; $673B: $20 $0D

    ld   [hl], $18                                ; $673D: $36 $18
    ld   hl, wEntitiesDirectionTable              ; $673F: $21 $80 $C3
    add  hl, bc                                   ; $6742: $09
    ld   a, [hl]                                  ; $6743: $7E
    xor  $01                                      ; $6744: $EE $01
    ld   [hl], a                                  ; $6746: $77
    call IncrementEntityState                     ; $6747: $CD $12 $3B

.jr_674A
    ldh  a, [hFrameCounter]                       ; $674A: $F0 $E7
    and  $03                                      ; $674C: $E6 $03
    jr   nz, ret_004_675F                         ; $674E: $20 $0F

    ld   hl, wEntitiesVelocityXTable              ; $6750: $21 $40 $C2
    add  hl, bc                                   ; $6753: $09
    ld   a, [hl]                                  ; $6754: $7E
    and  a                                        ; $6755: $A7
    jr   z, ret_004_675F                          ; $6756: $28 $07

    and  $80                                      ; $6758: $E6 $80
    jr   z, .jr_675E                              ; $675A: $28 $02

    inc  [hl]                                     ; $675C: $34
    inc  [hl]                                     ; $675D: $34

.jr_675E
    dec  [hl]                                     ; $675E: $35

ret_004_675F:
    ret                                           ; $675F: $C9

Data_004_6760::
    db   $08, $F8

label_004_6762:
    call GetEntityTransitionCountdown
    jr   nz, .jr_676D                             ; $6765: $20 $06

    ld   [hl], $50                                ; $6767: $36 $50
    call IncrementEntityState                     ; $6769: $CD $12 $3B
    ld   [hl], b                                  ; $676C: $70

.jr_676D
    ldh  a, [hFrameCounter]                       ; $676D: $F0 $E7
    rra                                           ; $676F: $1F
    rra                                           ; $6770: $1F
    rra                                           ; $6771: $1F
    and  $01                                      ; $6772: $E6 $01
    call SetEntitySpriteVariant                   ; $6774: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $6777: $F0 $E7
    and  $03                                      ; $6779: $E6 $03
    jr   nz, ret_004_679A                         ; $677B: $20 $1D

    ld   hl, wEntitiesVelocityXTable              ; $677D: $21 $40 $C2
    add  hl, bc                                   ; $6780: $09
    ld   a, [hl]                                  ; $6781: $7E
    push hl                                       ; $6782: $E5
    ld   hl, wEntitiesDirectionTable              ; $6783: $21 $80 $C3
    add  hl, bc                                   ; $6786: $09
    ld   e, [hl]                                  ; $6787: $5E
    ld   d, $00                                   ; $6788: $16 $00
    ld   hl, Data_004_6760                        ; $678A: $21 $60 $67
    add  hl, de                                   ; $678D: $19
    sub  [hl]                                     ; $678E: $96
    pop  hl                                       ; $678F: $E1
    and  a                                        ; $6790: $A7
    jr   z, ret_004_679A                          ; $6791: $28 $07

    and  $80                                      ; $6793: $E6 $80
    jr   z, .jr_6799                              ; $6795: $28 $02

    inc  [hl]                                     ; $6797: $34
    inc  [hl]                                     ; $6798: $34

.jr_6799
    dec  [hl]                                     ; $6799: $35

ret_004_679A:
    ret                                           ; $679A: $C9

func_004_679B::
    ld   a, [wIntroSubTimer]                      ; $679B: $FA $02 $D0
    and  a                                        ; $679E: $A7
    jr   nz, .ret_67FA                            ; $679F: $20 $59

    ld   a, [wD003]                               ; $67A1: $FA $03 $D0
    ld   e, a                                     ; $67A4: $5F
    ld   d, b                                     ; $67A5: $50
    ld   hl, wEntitiesStatusTable                 ; $67A6: $21 $80 $C2
    add  hl, de                                   ; $67A9: $19
    ld   a, [hl]                                  ; $67AA: $7E
    and  a                                        ; $67AB: $A7
    jr   z, .ret_67FA                             ; $67AC: $28 $4C

    ld   hl, wEntitiesStateTable                  ; $67AE: $21 $90 $C2
    add  hl, de                                   ; $67B1: $19
    ld   a, [hl]                                  ; $67B2: $7E
    and  a                                        ; $67B3: $A7
    jr   z, .ret_67FA                             ; $67B4: $28 $44

    ld   a, [wIsFileSelectionArrowShifted]        ; $67B6: $FA $00 $D0
    ld   hl, hActiveEntityPosX                    ; $67B9: $21 $EE $FF
    sub  [hl]                                     ; $67BC: $96
    rlca                                          ; $67BD: $07
    rlca                                          ; $67BE: $07
    and  $01                                      ; $67BF: $E6 $01
    ld   hl, wEntitiesDirectionTable              ; $67C1: $21 $80 $C3
    add  hl, bc                                   ; $67C4: $09
    cp   [hl]                                     ; $67C5: $BE
    jr   nz, .ret_67FA                            ; $67C6: $20 $32

    ld   a, [wIsFileSelectionArrowShifted]        ; $67C8: $FA $00 $D0
    ld   hl, hActiveEntityPosX                    ; $67CB: $21 $EE $FF
    sub  [hl]                                     ; $67CE: $96
    add  $18                                      ; $67CF: $C6 $18
    cp   $30                                      ; $67D1: $FE $30
    jr   nc, .ret_67FA                            ; $67D3: $30 $25

    ld   a, [wIntroTimer]                         ; $67D5: $FA $01 $D0
    ld   hl, hActiveEntityPosY                    ; $67D8: $21 $EF $FF
    sub  [hl]                                     ; $67DB: $96
    add  $10                                      ; $67DC: $C6 $10
    cp   $20                                      ; $67DE: $FE $20
    jr   nc, .ret_67FA                            ; $67E0: $30 $18

    call IncrementEntityState                     ; $67E2: $CD $12 $3B
    ld   [hl], $02                                ; $67E5: $36 $02
    ld   hl, wIntroSubTimer                       ; $67E7: $21 $02 $D0
    inc  [hl]                                     ; $67EA: $34
    ld   hl, wD004                                ; $67EB: $21 $04 $D0
    inc  [hl]                                     ; $67EE: $34
    call GetEntityTransitionCountdown             ; $67EF: $CD $05 $0C
    call GetRandomByte                            ; $67F2: $CD $0D $28
    and  $3F                                      ; $67F5: $E6 $3F
    add  $30                                      ; $67F7: $C6 $30
    ld   [hl], a                                  ; $67F9: $77

.ret_67FA
    ret                                           ; $67FA: $C9

WarpToFishingGame:
    call ApplyMapFadeOutTransition                ; $67FB: $CD $83 $0C
    ldh  a, [hLinkPositionX]                      ; $67FE: $F0 $98
    swap a                                        ; $6800: $CB $37
    and  $0F                                      ; $6802: $E6 $0F
    ld   e, a                                     ; $6804: $5F
    ldh  a, [hLinkPositionY]                      ; $6805: $F0 $99
    sub  $08                                      ; $6807: $D6 $08
    and  $F0                                      ; $6809: $E6 $F0
    or   e                                        ; $680B: $B3
    ld   [wWarp0PositionTileIndex], a             ; $680C: $EA $16 $D4
    xor  a                                        ; $680F: $AF
    ld   [wC167], a                               ; $6810: $EA $67 $C1
    ret                                           ; $6813: $C9
