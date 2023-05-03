MadBatterEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ; $4EDD: $21 $D0 $C2
    add  hl, bc                                   ; $4EE0: $09
    ld   a, [hl]                                  ; $4EE1: $7E
    and  a                                        ; $4EE2: $A7
    jp   nz, label_018_50E2                       ; $4EE3: $C2 $E2 $50

    ldh  a, [hRoomStatus]                         ; $4EE6: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $4EE8: $E6 $20
    jp   nz, ClearEntityStatusBank18              ; $4EEA: $C2 $08 $7F

    call DecrementEntityIgnoreHitsCountdown       ; $4EED: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $4EF0: $F0 $F0
    JP_TABLE                                      ; $4EF2
._00 dw MadBatterState0Handler                    ; $4EF3
._01 dw MadBatterState1Handler                    ; $4EF5
._02 dw MadBatterState2Handler                    ; $4EF7
._03 dw MadBatterState3Handler                    ; $4EF9
._04 dw MadBatterState4Handler                    ; $4EFB
._05 dw MadBatterState5Handler                    ; $4EFD
._06 dw MadBatterState6Handler                    ; $4EFF
._07 dw MadBatterState7Handler                    ; $4F01
._08 dw MadBatterState8Handler                    ; $4F03

MadBatterState0Handler::
    ld   a, [wMaxMagicPowder]                     ; $4F05: $FA $76 $DB
    ld   hl, MadBatterUpgradedMaximumTable        ; $4F08: $21 $90 $4F
    cp   [hl]                                     ; $4F0B: $BE
    jr   nz, .ret_4F1D                            ; $4F0C: $20 $0F

    inc  hl                                       ; $4F0E: $23
    ld   a, [wMaxBombs]                           ; $4F0F: $FA $77 $DB
    cp   [hl]                                     ; $4F12: $BE
    jr   nz, .ret_4F1D                            ; $4F13: $20 $08

    inc  hl                                       ; $4F15: $23
    ld   a, [wMaxArrows]                          ; $4F16: $FA $78 $DB
    cp   [hl]                                     ; $4F19: $BE
    jp   z, ClearEntityStatusBank18               ; $4F1A: $CA $08 $7F

.ret_4F1D
    ret                                           ; $4F1D: $C9

MadBatterState1Handler::
    call GetEntityTransitionCountdown             ; $4F1E: $CD $05 $0C
    ld   [hl], $90                                ; $4F21: $36 $90
    ldh  a, [hActiveEntityPosX]                   ; $4F23: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4F25: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4F27: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $4F29: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $4F2B: $3E $02
    call AddTranscientVfx                         ; $4F2D: $CD $C7 $0C
    ld   a, JINGLE_GENIE_APPEAR                   ; $4F30: $3E $06
    ldh  [hJingle], a                             ; $4F32: $E0 $F2
    jp   IncrementEntityState                     ; $4F34: $C3 $12 $3B

MadBatterState2Handler::
    call MadBatterRenderSmallSprite               ; $4F37: $CD $C3 $50
    call GetEntityTransitionCountdown             ; $4F3A: $CD $05 $0C
    jr   nz, .jr_018_4F44                         ; $4F3D: $20 $05

    ld   [hl], $60                                ; $4F3F: $36 $60
    jp   IncrementEntityState                     ; $4F41: $C3 $12 $3B

.jr_018_4F44
    ld   e, $FC                                   ; $4F44: $1E $FC
    sub  $08                                      ; $4F46: $D6 $08
    and  $10                                      ; $4F48: $E6 $10
    jr   z, .jr_018_4F4E                          ; $4F4A: $28 $02

    ld   e, $04                                   ; $4F4C: $1E $04

.jr_018_4F4E
    ld   hl, wEntitiesSpeedXTable                 ; $4F4E: $21 $40 $C2
    add  hl, bc                                   ; $4F51: $09
    ld   [hl], e                                  ; $4F52: $73
    ld   hl, wEntitiesSpeedYTable                 ; $4F53: $21 $50 $C2
    add  hl, bc                                   ; $4F56: $09
    ld   [hl], $FC                                ; $4F57: $36 $FC
    jp   UpdateEntityPosWithSpeed_18              ; $4F59: $C3 $5F $7E

MadBatterState3Handler::
    call MadBatterRenderSmallSprite               ; $4F5C: $CD $C3 $50
    call GetEntityTransitionCountdown             ; $4F5F: $CD $05 $0C
    ret  nz                                       ; $4F62: $C0

    ld   [hl], $48                                ; $4F63: $36 $48
    ld   a, ENTITY_BOMB                           ; $4F65: $3E $02
    call SpawnNewEntity_trampoline                ; $4F67: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $4F6A: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4F6C: $21 $00 $C2
    add  hl, de                                   ; $4F6F: $19
    ld   [hl], a                                  ; $4F70: $77
    ldh  a, [hMultiPurpose1]                      ; $4F71: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4F73: $21 $10 $C2
    add  hl, de                                   ; $4F76: $19
    ld   [hl], a                                  ; $4F77: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4F78: $21 $E0 $C2
    add  hl, de                                   ; $4F7B: $19
    ld   [hl], $20                                ; $4F7C: $36 $20
    jp   IncrementEntityState                     ; $4F7E: $C3 $12 $3B

MadBatterState4Handler::
    call RenderMadBatterSprite                    ; $4F81: $CD $A8 $50
    call GetEntityTransitionCountdown             ; $4F84: $CD $05 $0C
    ret  nz                                       ; $4F87: $C0

    ld_dialog_low a, Dialog0E1 ; "You woke me up" ; $4F88: $3E $E1
    call OpenDialogAtBottom                       ; $4F8A: $CD $80 $50
    jp   IncrementEntityState                     ; $4F8D: $C3 $12 $3B

MadBatterUpgradedMaximumTable::
    db   $40, $60, $60

MadBatterUpgradeDialogs::
._0 db_dialog_low Dialog0E2 ; "More Magic Powder"
._1 db_dialog_low Dialog0E3 ; "More Bombs"
._2 db_dialog_low Dialog0E4 ; "More arrows"

MadBatterState5Handler::
    call RenderMadBatterSprite                    ; $4F96: $CD $A8 $50
    ld   a, [wDialogState]                        ; $4F99: $FA $9F $C1
    and  a                                        ; $4F9C: $A7
    ret  nz                                       ; $4F9D: $C0

jr_018_4F9E:
    ld   hl, wEntitiesPrivateState1Table          ; $4F9E: $21 $B0 $C2
    add  hl, bc                                   ; $4FA1: $09
    ld   e, [hl]                                  ; $4FA2: $5E
    ld   d, $00                                   ; $4FA3: $16 $00
    ld   a, e                                     ; $4FA5: $7B
    ld   [wD201], a                               ; $4FA6: $EA $01 $D2
    inc  a                                        ; $4FA9: $3C
    cp   $03                                      ; $4FAA: $FE $03
    jr   nz, .jr_4FAF                             ; $4FAC: $20 $01

    xor  a                                        ; $4FAE: $AF

.jr_4FAF
    ld   [hl], a                                  ; $4FAF: $77
    ld   hl, MadBatterUpgradedMaximumTable        ; $4FB0: $21 $90 $4F
    add  hl, de                                   ; $4FB3: $19
    ld   a, [hl]                                  ; $4FB4: $7E
    ld   hl, wMaxMagicPowder                      ; $4FB5: $21 $76 $DB
    add  hl, de                                   ; $4FB8: $19
    cp   [hl]                                     ; $4FB9: $BE
    jr   z, jr_018_4F9E                           ; $4FBA: $28 $E2

    ld   hl, MadBatterUpgradeDialogs              ; $4FBC: $21 $93 $4F
    add  hl, de                                   ; $4FBF: $19
    ld   a, [hl]                                  ; $4FC0: $7E
    call OpenDialogAtBottom                       ; $4FC1: $CD $80 $50
    jp   IncrementEntityState                     ; $4FC4: $C3 $12 $3B

MadBatterState6Handler::
    call RenderMadBatterSprite                    ; $4FC7: $CD $A8 $50
    ld   a, [wDialogState]                        ; $4FCA: $FA $9F $C1
    and  a                                        ; $4FCD: $A7
    ret  nz                                       ; $4FCE: $C0

    call IncrementEntityState                     ; $4FCF: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ; $4FD2: $FA $77 $C1
    and  a                                        ; $4FD5: $A7
    jr   nz, .jr_5001                             ; $4FD6: $20 $29

    ld   a, ENTITY_MAD_BATTER                     ; $4FD8: $3E $CA
    call SpawnNewEntity_trampoline                ; $4FDA: $CD $86 $3B
    ld   a, NOISE_SFX_ELECTRIC_BEAM               ; $4FDD: $3E $26
    ldh  [hNoiseSfx], a                           ; $4FDF: $E0 $F4
    ldh  a, [hMultiPurpose0]                      ; $4FE1: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4FE3: $21 $00 $C2
    add  hl, de                                   ; $4FE6: $19
    ld   [hl], a                                  ; $4FE7: $77
    ldh  a, [hMultiPurpose1]                      ; $4FE8: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4FEA: $21 $10 $C2
    add  hl, de                                   ; $4FED: $19
    ld   [hl], a                                  ; $4FEE: $77
    ld   hl, wEntitiesPrivateState3Table          ; $4FEF: $21 $D0 $C2
    add  hl, de                                   ; $4FF2: $19
    ld   [hl], $01                                ; $4FF3: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $4FF5: $21 $E0 $C2
    add  hl, de                                   ; $4FF8: $19
    ld   [hl], $C0                                ; $4FF9: $36 $C0
    call GetEntityTransitionCountdown             ; $4FFB: $CD $05 $0C
    ld   [hl], $C0                                ; $4FFE: $36 $C0
    ret                                           ; $5000: $C9

.jr_5001
    dec  [hl]                                     ; $5001: $35
    dec  [hl]                                     ; $5002: $35
    ret                                           ; $5003: $C9

MadBatterState7Handler::
    ld   hl, Data_018_5090                        ; $5004: $21 $90 $50
    ld   c, $03                                   ; $5007: $0E $03
    call RenderActiveEntitySpritesRect            ; $5009: $CD $E6 $3C
    call func_018_50D2                            ; $500C: $CD $D2 $50
    call GetEntityTransitionCountdown             ; $500F: $CD $05 $0C
    ret  nz                                       ; $5012: $C0

    call ClearEntitySpeed                         ; $5013: $CD $7F $3D
    ld_dialog_low a, Dialog0E5 ; "Take care!"     ; $5016: $3E $E5
    call OpenDialogAtBottom                       ; $5018: $CD $80 $50
    call IncrementEntityState                     ; $501B: $CD $12 $3B
    ld   a, [wD201]                               ; $501E: $FA $01 $D2
    ld   e, a                                     ; $5021: $5F
    ld   d, b                                     ; $5022: $50
    ld   hl, MadBatterUpgradedMaximumTable        ; $5023: $21 $90 $4F
    add  hl, de                                   ; $5026: $19
    ld   a, [hl]                                  ; $5027: $7E
    ld   hl, wMaxMagicPowder                      ; $5028: $21 $76 $DB
    add  hl, de                                   ; $502B: $19
    ld   [hl], a                                  ; $502C: $77
    ld   d, a                                     ; $502D: $57
    ld   a, e                                     ; $502E: $7B
    and  a                                        ; $502F: $A7
    jr   nz, .jr_5044                             ; $5030: $20 $12

    ld   hl, wMagicPowderCount                    ; $5032: $21 $4C $DB
    ld   [hl], d                                  ; $5035: $72
    ld   d, $0C                                   ; $5036: $16 $0C
    call GiveInventoryItem_trampoline             ; $5038: $CD $6B $3E
    xor  a                                        ; $503B: $AF
    ld   [wHasToadstool], a                       ; $503C: $EA $4B $DB
    ld   a, REPLACE_TILES_MAGIC_POWDER            ; $503F: $3E $0B
    ldh  [hReplaceTiles], a                       ; $5041: $E0 $A5
    ret                                           ; $5043: $C9

.jr_5044
    cp   $01                                      ; $5044: $FE $01
    jr   nz, .jr_504D                             ; $5046: $20 $05

    ld   hl, wBombCount                           ; $5048: $21 $4D $DB
    ld   [hl], d                                  ; $504B: $72
    ret                                           ; $504C: $C9

.jr_504D
    ld   hl, wArrowCount                          ; $504D: $21 $45 $DB
    ld   [hl], d                                  ; $5050: $72
    ret                                           ; $5051: $C9

MadBatterState8Handler::
    call RenderMadBatterSprite                    ; $5052: $CD $A8 $50
    ld   a, [wDialogState]                        ; $5055: $FA $9F $C1
    and  a                                        ; $5058: $A7
    ret  nz                                       ; $5059: $C0

    ld   hl, wEntitiesPrivateState4Table          ; $505A: $21 $40 $C4
    add  hl, bc                                   ; $505D: $09
    ld   a, [hl]                                  ; $505E: $7E
    and  a                                        ; $505F: $A7
    jr   nz, .jr_5067                             ; $5060: $20 $05

    inc  [hl]                                     ; $5062: $34
    ld   a, JINGLE_SWORD_BEAM                     ; $5063: $3E $3B
    ldh  [hJingle], a                             ; $5065: $E0 $F2

.jr_5067
    call UpdateEntityYPosWithSpeed_18             ; $5067: $CD $62 $7E
    ld   hl, wEntitiesSpeedYTable                 ; $506A: $21 $50 $C2
    add  hl, bc                                   ; $506D: $09
    dec  [hl]                                     ; $506E: $35
    dec  [hl]                                     ; $506F: $35
    dec  [hl]                                     ; $5070: $35
    ldh  a, [hActiveEntityVisualPosY]             ; $5071: $F0 $EC
    cp   $F0                                      ; $5073: $FE $F0
    ret  c                                        ; $5075: $D8

    call SetRoomStatus20                          ; $5076: $CD $B9 $7F
    xor  a                                        ; $5079: $AF
    ld   [wC167], a                               ; $507A: $EA $67 $C1
    jp   ClearEntityStatusBank18                  ; $507D: $C3 $08 $7F

OpenDialogAtBottom::
    ld   e, a                                     ; $5080: $5F
    ldh  a, [hLinkPositionY]                      ; $5081: $F0 $99
    push af                                       ; $5083: $F5
    ld   a, $20                                   ; $5084: $3E $20
    ldh  [hLinkPositionY], a                      ; $5086: $E0 $99
    ld   a, e                                     ; $5088: $7B
    call OpenDialogInTable0                       ; $5089: $CD $85 $23
    pop  af                                       ; $508C: $F1
    ldh  [hLinkPositionY], a                      ; $508D: $E0 $99
    ret                                           ; $508F: $C9

Data_018_5090::
    db   $00, $FC, $70, $03, $00, $04, $72, $03, $00, $0C, $70, $23

Data_018_509C::
    db   $00, $FC, $74, $03, $00, $04, $76, $03, $00, $0C, $74, $23

RenderMadBatterSprite::
    ld   hl, Data_018_5090                        ; $50A8: $21 $90 $50
    ldh  a, [hFrameCounter]                       ; $50AB: $F0 $E7
    and  $08                                      ; $50AD: $E6 $08
    jr   z, .jr_50B4                              ; $50AF: $28 $03

    ld   hl, Data_018_509C                        ; $50B1: $21 $9C $50

.jr_50B4
    ld   c, $03                                   ; $50B4: $0E $03
    call RenderActiveEntitySpritesRect            ; $50B6: $CD $E6 $3C
    jr   func_018_50D2                            ; $50B9: $18 $17

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MadBatterSpriteVariants::
.variant0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

MadBatterRenderSmallSprite::
    ldh  a, [hFrameCounter]                       ; $50C3: $F0 $E7
    rra                                           ; $50C5: $1F
    rra                                           ; $50C6: $1F
    rra                                           ; $50C7: $1F
    and  $01                                      ; $50C8: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ; $50CA: $E0 $F1
    ld   de, MadBatterSpriteVariants              ; $50CC: $11 $BB $50
    call RenderActiveEntitySpritesPair            ; $50CF: $CD $C0 $3B

func_018_50D2::
    ld   a, $02                                   ; $50D2: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $50D4: $E0 $A1
    ld   [wC167], a                               ; $50D6: $EA $67 $C1
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ; $50D9: $3E $04
    ldh  [hLinkAnimationState], a                 ; $50DB: $E0 $9D

    xor  a                                        ; $50DD: $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ; $50DE: $EA $9B $C1

    ret                                           ; $50E1: $C9

label_018_50E2:
    call func_018_5174                            ; $50E2: $CD $74 $51
    call GetEntityTransitionCountdown             ; $50E5: $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ; $50E8: $CA $08 $7F

    ld   d, a                                     ; $50EB: $57
    ldh  a, [hIsGBC]                              ; $50EC: $F0 $FE
    and  a                                        ; $50EE: $A7
    jr   nz, jr_018_50FE                          ; $50EF: $20 $0D

    ld   a, d                                     ; $50F1: $7A
    bit  1, a                                     ; $50F2: $CB $4F
    ld   a, $E4                                   ; $50F4: $3E $E4
    jr   z, .jr_50FA                              ; $50F6: $28 $02

    ld   a, $44                                   ; $50F8: $3E $44

.jr_50FA
    ld   [wBGPalette], a                          ; $50FA: $EA $97 $DB
    ret                                           ; $50FD: $C9

jr_018_50FE:
    ld   hl, wFarcallParams                       ; $50FE: $21 $01 $DE
    ld   a, BANK(func_024_7B77)                   ; $5101: $3E $24
    ld   [hl+], a                                 ; $5103: $22
    ld   a, HIGH(func_024_7B77)                   ; $5104: $3E $7B
    ld   [hl+], a                                 ; $5106: $22
    ld   a, LOW(func_024_7B77)                    ; $5107: $3E $77
    ld   [hl+], a                                 ; $5109: $22
    ld   a, BANK(@)                               ; $510A: $3E $18
    ld   [hl], a                                  ; $510C: $77
    jp   Farcall                                  ; $510D: $C3 $D7 $0B

Data_018_5110::
    db   $10, $00, $7C, $07, $10, $08, $7C, $67, $20, $00, $7C, $07, $20, $08, $7C, $67
    db   $30, $F8, $78, $07, $30, $00, $7A, $07, $30, $08, $7A, $27, $30, $10, $78, $27
    db   $40, $F8, $78, $47, $40, $00, $7A, $47, $40, $08, $7A, $67, $40, $10, $78, $67

Data_018_5140::
    db   $10, $00, $7C, $54, $10, $08, $7C, $34, $20, $00, $7C, $54, $20, $08, $7C, $34
    db   $30, $F8, $78, $14, $30, $00, $7A, $14, $30, $08, $7A, $34, $30, $10, $78, $34
    db   $40, $F8, $78, $54, $40, $00, $7A, $54, $40, $08, $7A, $74, $40, $10, $78, $74

Data_018_5170::
    db   $0C, $0C, $04, $02

func_018_5174::
    ldh  a, [hActiveEntityVisualPosY]             ; $5174: $F0 $EC
    sub  $05                                      ; $5176: $D6 $05
    ldh  [hActiveEntityVisualPosY], a             ; $5178: $E0 $EC
    call GetEntityTransitionCountdown             ; $517A: $CD $05 $0C
    ld   c, $0C                                   ; $517D: $0E $0C
    cp   $B0                                      ; $517F: $FE $B0
    jr   c, .jr_5190                              ; $5181: $38 $0D

    sub  $B0                                      ; $5183: $D6 $B0
    rra                                           ; $5185: $1F
    rra                                           ; $5186: $1F
    and  $03                                      ; $5187: $E6 $03
    ld   e, a                                     ; $5189: $5F
    ld   d, b                                     ; $518A: $50
    ld   hl, Data_018_5170                        ; $518B: $21 $70 $51
    add  hl, de                                   ; $518E: $19
    ld   c, [hl]                                  ; $518F: $4E

.jr_5190
    ld   hl, Data_018_5110                        ; $5190: $21 $10 $51
    ldh  a, [hFrameCounter]                       ; $5193: $F0 $E7
    and  $04                                      ; $5195: $E6 $04
    jr   z, .jr_519C                              ; $5197: $28 $03

    ld   hl, Data_018_5140                        ; $5199: $21 $40 $51

.jr_519C
    call RenderActiveEntitySpritesRect            ; $519C: $CD $E6 $3C
    ld   a, $04                                   ; $519F: $3E $04
    jp   func_015_7964_trampoline                 ; $51A1: $C3 $A0 $3D
