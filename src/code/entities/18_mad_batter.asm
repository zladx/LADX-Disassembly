MadBatterEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ;; 18:4EDD $21 $D0 $C2
    add  hl, bc                                   ;; 18:4EE0 $09
    ld   a, [hl]                                  ;; 18:4EE1 $7E
    and  a                                        ;; 18:4EE2 $A7
    jp   nz, MadBatterApplyFlashingEffect         ;; 18:4EE3 $C2 $E2 $50

    ldh  a, [hRoomStatus]                         ;; 18:4EE6 $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 18:4EE8 $E6 $20
    jp   nz, ClearEntityStatusBank18              ;; 18:4EEA $C2 $08 $7F

    call DecrementEntityIgnoreHitsCountdown       ;; 18:4EED $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 18:4EF0 $F0 $F0
    JP_TABLE                                      ;; 18:4EF2
._00 dw MadBatterState0Handler                    ;; 18:4EF3
._01 dw MadBatterState1Handler                    ;; 18:4EF5
._02 dw MadBatterState2Handler                    ;; 18:4EF7
._03 dw MadBatterState3Handler                    ;; 18:4EF9
._04 dw MadBatterState4Handler                    ;; 18:4EFB
._05 dw MadBatterState5Handler                    ;; 18:4EFD
._06 dw MadBatterState6Handler                    ;; 18:4EFF
._07 dw MadBatterState7Handler                    ;; 18:4F01
._08 dw MadBatterState8Handler                    ;; 18:4F03

MadBatterState0Handler::
    ld   a, [wMaxMagicPowder]                     ;; 18:4F05 $FA $76 $DB
    ld   hl, MadBatterUpgradedMaximumTable        ;; 18:4F08 $21 $90 $4F
    cp   [hl]                                     ;; 18:4F0B $BE
    jr   nz, .ret_4F1D                            ;; 18:4F0C $20 $0F

    inc  hl                                       ;; 18:4F0E $23
    ld   a, [wMaxBombs]                           ;; 18:4F0F $FA $77 $DB
    cp   [hl]                                     ;; 18:4F12 $BE
    jr   nz, .ret_4F1D                            ;; 18:4F13 $20 $08

    inc  hl                                       ;; 18:4F15 $23
    ld   a, [wMaxArrows]                          ;; 18:4F16 $FA $78 $DB
    cp   [hl]                                     ;; 18:4F19 $BE
    jp   z, ClearEntityStatusBank18               ;; 18:4F1A $CA $08 $7F

.ret_4F1D
    ret                                           ;; 18:4F1D $C9

MadBatterState1Handler::
    call GetEntityTransitionCountdown             ;; 18:4F1E $CD $05 $0C
    ld   [hl], $90                                ;; 18:4F21 $36 $90
    ldh  a, [hActiveEntityPosX]                   ;; 18:4F23 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:4F25 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:4F27 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 18:4F29 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 18:4F2B $3E $02
    call AddTranscientVfx                         ;; 18:4F2D $CD $C7 $0C
    ld   a, JINGLE_GENIE_APPEAR                   ;; 18:4F30 $3E $06
    ldh  [hJingle], a                             ;; 18:4F32 $E0 $F2
    jp   IncrementEntityState                     ;; 18:4F34 $C3 $12 $3B

MadBatterState2Handler::
    call MadBatterRenderSmallSprite               ;; 18:4F37 $CD $C3 $50
    call GetEntityTransitionCountdown             ;; 18:4F3A $CD $05 $0C
    jr   nz, .jr_018_4F44                         ;; 18:4F3D $20 $05

    ld   [hl], $60                                ;; 18:4F3F $36 $60
    jp   IncrementEntityState                     ;; 18:4F41 $C3 $12 $3B

.jr_018_4F44
    ld   e, $FC                                   ;; 18:4F44 $1E $FC
    sub  $08                                      ;; 18:4F46 $D6 $08
    and  $10                                      ;; 18:4F48 $E6 $10
    jr   z, .jr_018_4F4E                          ;; 18:4F4A $28 $02

    ld   e, $04                                   ;; 18:4F4C $1E $04

.jr_018_4F4E
    ld   hl, wEntitiesSpeedXTable                 ;; 18:4F4E $21 $40 $C2
    add  hl, bc                                   ;; 18:4F51 $09
    ld   [hl], e                                  ;; 18:4F52 $73
    ld   hl, wEntitiesSpeedYTable                 ;; 18:4F53 $21 $50 $C2
    add  hl, bc                                   ;; 18:4F56 $09
    ld   [hl], $FC                                ;; 18:4F57 $36 $FC
    jp   UpdateEntityPosWithSpeed_18              ;; 18:4F59 $C3 $5F $7E

MadBatterState3Handler::
    call MadBatterRenderSmallSprite               ;; 18:4F5C $CD $C3 $50
    call GetEntityTransitionCountdown             ;; 18:4F5F $CD $05 $0C
    ret  nz                                       ;; 18:4F62 $C0

    ld   [hl], $48                                ;; 18:4F63 $36 $48
    ld   a, ENTITY_BOMB                           ;; 18:4F65 $3E $02
    call SpawnNewEntity_trampoline                ;; 18:4F67 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 18:4F6A $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 18:4F6C $21 $00 $C2
    add  hl, de                                   ;; 18:4F6F $19
    ld   [hl], a                                  ;; 18:4F70 $77
    ldh  a, [hMultiPurpose1]                      ;; 18:4F71 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 18:4F73 $21 $10 $C2
    add  hl, de                                   ;; 18:4F76 $19
    ld   [hl], a                                  ;; 18:4F77 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 18:4F78 $21 $E0 $C2
    add  hl, de                                   ;; 18:4F7B $19
    ld   [hl], $20                                ;; 18:4F7C $36 $20
    jp   IncrementEntityState                     ;; 18:4F7E $C3 $12 $3B

MadBatterState4Handler::
    call RenderMadBatterSprite                    ;; 18:4F81 $CD $A8 $50
    call GetEntityTransitionCountdown             ;; 18:4F84 $CD $05 $0C
    ret  nz                                       ;; 18:4F87 $C0

    ld_dialog_low a, Dialog0E1 ; "You woke me up" ;; 18:4F88 $3E $E1
    call OpenDialogAtBottom                       ;; 18:4F8A $CD $80 $50
    jp   IncrementEntityState                     ;; 18:4F8D $C3 $12 $3B

MadBatterUpgradedMaximumTable::
    db   $40, $60, $60

MadBatterUpgradeDialogs::
._0 db_dialog_low Dialog0E2 ; "More Magic Powder"
._1 db_dialog_low Dialog0E3 ; "More Bombs"
._2 db_dialog_low Dialog0E4 ; "More arrows"

MadBatterState5Handler::
    call RenderMadBatterSprite                    ;; 18:4F96 $CD $A8 $50
    ld   a, [wDialogState]                        ;; 18:4F99 $FA $9F $C1
    and  a                                        ;; 18:4F9C $A7
    ret  nz                                       ;; 18:4F9D $C0

jr_018_4F9E:
    ld   hl, wEntitiesPrivateState1Table          ;; 18:4F9E $21 $B0 $C2
    add  hl, bc                                   ;; 18:4FA1 $09
    ld   e, [hl]                                  ;; 18:4FA2 $5E
    ld   d, $00                                   ;; 18:4FA3 $16 $00
    ld   a, e                                     ;; 18:4FA5 $7B
    ld   [wD201], a                               ;; 18:4FA6 $EA $01 $D2
    inc  a                                        ;; 18:4FA9 $3C
    cp   $03                                      ;; 18:4FAA $FE $03
    jr   nz, .jr_4FAF                             ;; 18:4FAC $20 $01

    xor  a                                        ;; 18:4FAE $AF

.jr_4FAF
    ld   [hl], a                                  ;; 18:4FAF $77
    ld   hl, MadBatterUpgradedMaximumTable        ;; 18:4FB0 $21 $90 $4F
    add  hl, de                                   ;; 18:4FB3 $19
    ld   a, [hl]                                  ;; 18:4FB4 $7E
    ld   hl, wMaxMagicPowder                      ;; 18:4FB5 $21 $76 $DB
    add  hl, de                                   ;; 18:4FB8 $19
    cp   [hl]                                     ;; 18:4FB9 $BE
    jr   z, jr_018_4F9E                           ;; 18:4FBA $28 $E2

    ld   hl, MadBatterUpgradeDialogs              ;; 18:4FBC $21 $93 $4F
    add  hl, de                                   ;; 18:4FBF $19
    ld   a, [hl]                                  ;; 18:4FC0 $7E
    call OpenDialogAtBottom                       ;; 18:4FC1 $CD $80 $50
    jp   IncrementEntityState                     ;; 18:4FC4 $C3 $12 $3B

MadBatterState6Handler::
    call RenderMadBatterSprite                    ;; 18:4FC7 $CD $A8 $50
    ld   a, [wDialogState]                        ;; 18:4FCA $FA $9F $C1
    and  a                                        ;; 18:4FCD $A7
    ret  nz                                       ;; 18:4FCE $C0

    call IncrementEntityState                     ;; 18:4FCF $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 18:4FD2 $FA $77 $C1
    and  a                                        ;; 18:4FD5 $A7
    jr   nz, .jr_5001                             ;; 18:4FD6 $20 $29

    ld   a, ENTITY_MAD_BATTER                     ;; 18:4FD8 $3E $CA
    call SpawnNewEntity_trampoline                ;; 18:4FDA $CD $86 $3B
    ld   a, NOISE_SFX_ELECTRIC_BEAM               ;; 18:4FDD $3E $26
    ldh  [hNoiseSfx], a                           ;; 18:4FDF $E0 $F4
    ldh  a, [hMultiPurpose0]                      ;; 18:4FE1 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 18:4FE3 $21 $00 $C2
    add  hl, de                                   ;; 18:4FE6 $19
    ld   [hl], a                                  ;; 18:4FE7 $77
    ldh  a, [hMultiPurpose1]                      ;; 18:4FE8 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 18:4FEA $21 $10 $C2
    add  hl, de                                   ;; 18:4FED $19
    ld   [hl], a                                  ;; 18:4FEE $77
    ld   hl, wEntitiesPrivateState3Table          ;; 18:4FEF $21 $D0 $C2
    add  hl, de                                   ;; 18:4FF2 $19
    ld   [hl], $01                                ;; 18:4FF3 $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ;; 18:4FF5 $21 $E0 $C2
    add  hl, de                                   ;; 18:4FF8 $19
    ld   [hl], $C0                                ;; 18:4FF9 $36 $C0
    call GetEntityTransitionCountdown             ;; 18:4FFB $CD $05 $0C
    ld   [hl], $C0                                ;; 18:4FFE $36 $C0
    ret                                           ;; 18:5000 $C9

.jr_5001
    dec  [hl]                                     ;; 18:5001 $35
    dec  [hl]                                     ;; 18:5002 $35
    ret                                           ;; 18:5003 $C9

MadBatterState7Handler::
    ld   hl, Data_018_5090                        ;; 18:5004 $21 $90 $50
    ld   c, $03                                   ;; 18:5007 $0E $03
    call RenderActiveEntitySpritesRect            ;; 18:5009 $CD $E6 $3C
    call func_018_50D2                            ;; 18:500C $CD $D2 $50
    call GetEntityTransitionCountdown             ;; 18:500F $CD $05 $0C
    ret  nz                                       ;; 18:5012 $C0

    call ClearEntitySpeed                         ;; 18:5013 $CD $7F $3D
    ld_dialog_low a, Dialog0E5 ; "Take care!"     ;; 18:5016 $3E $E5
    call OpenDialogAtBottom                       ;; 18:5018 $CD $80 $50
    call IncrementEntityState                     ;; 18:501B $CD $12 $3B
    ld   a, [wD201]                               ;; 18:501E $FA $01 $D2
    ld   e, a                                     ;; 18:5021 $5F
    ld   d, b                                     ;; 18:5022 $50
    ld   hl, MadBatterUpgradedMaximumTable        ;; 18:5023 $21 $90 $4F
    add  hl, de                                   ;; 18:5026 $19
    ld   a, [hl]                                  ;; 18:5027 $7E
    ld   hl, wMaxMagicPowder                      ;; 18:5028 $21 $76 $DB
    add  hl, de                                   ;; 18:502B $19
    ld   [hl], a                                  ;; 18:502C $77
    ld   d, a                                     ;; 18:502D $57
    ld   a, e                                     ;; 18:502E $7B
    and  a                                        ;; 18:502F $A7
    jr   nz, .jr_5044                             ;; 18:5030 $20 $12

    ld   hl, wMagicPowderCount                    ;; 18:5032 $21 $4C $DB
    ld   [hl], d                                  ;; 18:5035 $72
    ld   d, $0C                                   ;; 18:5036 $16 $0C
    call GiveInventoryItem_trampoline             ;; 18:5038 $CD $6B $3E
    xor  a                                        ;; 18:503B $AF
    ld   [wHasToadstool], a                       ;; 18:503C $EA $4B $DB
    ld   a, REPLACE_TILES_MAGIC_POWDER            ;; 18:503F $3E $0B
    ldh  [hReplaceTiles], a                       ;; 18:5041 $E0 $A5
    ret                                           ;; 18:5043 $C9

.jr_5044
    cp   $01                                      ;; 18:5044 $FE $01
    jr   nz, .jr_504D                             ;; 18:5046 $20 $05

    ld   hl, wBombCount                           ;; 18:5048 $21 $4D $DB
    ld   [hl], d                                  ;; 18:504B $72
    ret                                           ;; 18:504C $C9

.jr_504D
    ld   hl, wArrowCount                          ;; 18:504D $21 $45 $DB
    ld   [hl], d                                  ;; 18:5050 $72
    ret                                           ;; 18:5051 $C9

MadBatterState8Handler::
    call RenderMadBatterSprite                    ;; 18:5052 $CD $A8 $50
    ld   a, [wDialogState]                        ;; 18:5055 $FA $9F $C1
    and  a                                        ;; 18:5058 $A7
    ret  nz                                       ;; 18:5059 $C0

    ld   hl, wEntitiesPrivateState4Table          ;; 18:505A $21 $40 $C4
    add  hl, bc                                   ;; 18:505D $09
    ld   a, [hl]                                  ;; 18:505E $7E
    and  a                                        ;; 18:505F $A7
    jr   nz, .jr_5067                             ;; 18:5060 $20 $05

    inc  [hl]                                     ;; 18:5062 $34
    ld   a, JINGLE_SWORD_BEAM                     ;; 18:5063 $3E $3B
    ldh  [hJingle], a                             ;; 18:5065 $E0 $F2

.jr_5067
    call UpdateEntityYPosWithSpeed_18             ;; 18:5067 $CD $62 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 18:506A $21 $50 $C2
    add  hl, bc                                   ;; 18:506D $09
    dec  [hl]                                     ;; 18:506E $35
    dec  [hl]                                     ;; 18:506F $35
    dec  [hl]                                     ;; 18:5070 $35
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:5071 $F0 $EC
    cp   $F0                                      ;; 18:5073 $FE $F0
    ret  c                                        ;; 18:5075 $D8

    call SetRoomStatus20                          ;; 18:5076 $CD $B9 $7F
    xor  a                                        ;; 18:5079 $AF
    ld   [wC167], a                               ;; 18:507A $EA $67 $C1
    jp   ClearEntityStatusBank18                  ;; 18:507D $C3 $08 $7F

OpenDialogAtBottom::
    ld   e, a                                     ;; 18:5080 $5F
    ldh  a, [hLinkPositionY]                      ;; 18:5081 $F0 $99
    push af                                       ;; 18:5083 $F5
    ld   a, $20                                   ;; 18:5084 $3E $20
    ldh  [hLinkPositionY], a                      ;; 18:5086 $E0 $99
    ld   a, e                                     ;; 18:5088 $7B
    call OpenDialogInTable0                       ;; 18:5089 $CD $85 $23
    pop  af                                       ;; 18:508C $F1
    ldh  [hLinkPositionY], a                      ;; 18:508D $E0 $99
    ret                                           ;; 18:508F $C9

Data_018_5090::
    db   $00, $FC, $70, $03, $00, $04, $72, $03, $00, $0C, $70, $23

Data_018_509C::
    db   $00, $FC, $74, $03, $00, $04, $76, $03, $00, $0C, $74, $23

RenderMadBatterSprite::
    ld   hl, Data_018_5090                        ;; 18:50A8 $21 $90 $50
    ldh  a, [hFrameCounter]                       ;; 18:50AB $F0 $E7
    and  $08                                      ;; 18:50AD $E6 $08
    jr   z, .jr_50B4                              ;; 18:50AF $28 $03

    ld   hl, Data_018_509C                        ;; 18:50B1 $21 $9C $50

.jr_50B4
    ld   c, $03                                   ;; 18:50B4 $0E $03
    call RenderActiveEntitySpritesRect            ;; 18:50B6 $CD $E6 $3C
    jr   func_018_50D2                            ;; 18:50B9 $18 $17

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MadBatterSpriteVariants::
.variant0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

MadBatterRenderSmallSprite::
    ldh  a, [hFrameCounter]                       ;; 18:50C3 $F0 $E7
    rra                                           ;; 18:50C5 $1F
    rra                                           ;; 18:50C6 $1F
    rra                                           ;; 18:50C7 $1F
    and  $01                                      ;; 18:50C8 $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ;; 18:50CA $E0 $F1
    ld   de, MadBatterSpriteVariants              ;; 18:50CC $11 $BB $50
    call RenderActiveEntitySpritesPair            ;; 18:50CF $CD $C0 $3B

func_018_50D2::
    ld   a, $02                                   ;; 18:50D2 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:50D4 $E0 $A1
    ld   [wC167], a                               ;; 18:50D6 $EA $67 $C1
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ;; 18:50D9 $3E $04
    ldh  [hLinkAnimationState], a                 ;; 18:50DB $E0 $9D

    xor  a                                        ;; 18:50DD $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 18:50DE $EA $9B $C1

    ret                                           ;; 18:50E1 $C9

; Make the BG palette flash during the upgrade lightning.
; (Implementation differs between DMG and CGB.)
MadBatterApplyFlashingEffect::
    call func_018_5174                            ;; 18:50E2 $CD $74 $51
    call GetEntityTransitionCountdown             ;; 18:50E5 $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ;; 18:50E8 $CA $08 $7F

    ld   d, a                                     ;; 18:50EB $57
    ldh  a, [hIsGBC]                              ;; 18:50EC $F0 $FE
    and  a                                        ;; 18:50EE $A7
    jr   nz, .replaceScenePalettesGBC             ;; 18:50EF $20 $0D

    ; On DMG, simply alternate the BG palette between $E4 and $44
    ld   a, d                                     ;; 18:50F1 $7A
    bit  1, a                                     ;; 18:50F2 $CB $4F
    ld   a, $E4                                   ;; 18:50F4 $3E $E4
    jr   z, .replaceScenePalettesDMG              ;; 18:50F6 $28 $02
    ld   a, $44                                   ;; 18:50F8 $3E $44
.replaceScenePalettesDMG
    ld   [wBGPalette], a                          ;; 18:50FA $EA $97 $DB
    ret                                           ;; 18:50FD $C9

.replaceScenePalettesGBC
    ld   hl, wFarcallParams                       ;; 18:50FE $21 $01 $DE
    ld   a, BANK(MadBatterReplaceScenePalettes)   ;; 18:5101 $3E $24
    ld   [hl+], a                                 ;; 18:5103 $22
    ld   a, HIGH(MadBatterReplaceScenePalettes)   ;; 18:5104 $3E $7B
    ld   [hl+], a                                 ;; 18:5106 $22
    ld   a, LOW(MadBatterReplaceScenePalettes)    ;; 18:5107 $3E $77
    ld   [hl+], a                                 ;; 18:5109 $22
    ld   a, BANK(@)                               ;; 18:510A $3E $18
    ld   [hl], a                                  ;; 18:510C $77
    jp   Farcall                                  ;; 18:510D $C3 $D7 $0B

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
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:5174 $F0 $EC
    sub  $05                                      ;; 18:5176 $D6 $05
    ldh  [hActiveEntityVisualPosY], a             ;; 18:5178 $E0 $EC
    call GetEntityTransitionCountdown             ;; 18:517A $CD $05 $0C
    ld   c, $0C                                   ;; 18:517D $0E $0C
    cp   $B0                                      ;; 18:517F $FE $B0
    jr   c, .jr_5190                              ;; 18:5181 $38 $0D

    sub  $B0                                      ;; 18:5183 $D6 $B0
    rra                                           ;; 18:5185 $1F
    rra                                           ;; 18:5186 $1F
    and  $03                                      ;; 18:5187 $E6 $03
    ld   e, a                                     ;; 18:5189 $5F
    ld   d, b                                     ;; 18:518A $50
    ld   hl, Data_018_5170                        ;; 18:518B $21 $70 $51
    add  hl, de                                   ;; 18:518E $19
    ld   c, [hl]                                  ;; 18:518F $4E

.jr_5190
    ld   hl, Data_018_5110                        ;; 18:5190 $21 $10 $51
    ldh  a, [hFrameCounter]                       ;; 18:5193 $F0 $E7
    and  $04                                      ;; 18:5195 $E6 $04
    jr   z, .jr_519C                              ;; 18:5197 $28 $03

    ld   hl, Data_018_5140                        ;; 18:5199 $21 $40 $51

.jr_519C
    call RenderActiveEntitySpritesRect            ;; 18:519C $CD $E6 $3C
    ld   a, $04                                   ;; 18:519F $3E $04
    jp   func_015_7964_trampoline                 ;; 18:51A1 $C3 $A0 $3D
