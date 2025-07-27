; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
YipYipSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant2
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $00, OAM_GBC_PAL_2 | OAMF_PAL0
    db $02, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db $04, OAM_GBC_PAL_2 | OAMF_PAL0
    db $06, OAM_GBC_PAL_2 | OAMF_PAL0
.variant6
    db $02, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $00, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $06, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $04, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
YipYipWithRibbonSpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant2
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $10, OAM_GBC_PAL_2 | OAMF_PAL0
    db $12, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db $14, OAM_GBC_PAL_2 | OAMF_PAL0
    db $16, OAM_GBC_PAL_2 | OAMF_PAL0
.variant6
    db $12, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $10, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $16, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $14, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

YipYipEntityHandler::
    ld   a, [wDialogState]                        ;; 06:59E8 $FA $9F $C1
    and  a                                        ;; 06:59EB $A7
    jr   z, .jr_006_5A0D                          ;; 06:59EC $28 $1F

    ld   a, [wDialogIndex]                        ;; 06:59EE $FA $73 $C1
    cp_dialog_low Dialog182                       ;; 06:59F1 $FE $82
    jr   z, .jr_006_5A0D                          ;; 06:59F3 $28 $18

    call GetEntityXDistanceToLink_06              ;; 06:59F5 $CD $94 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:59F8 $21 $80 $C3
    add  hl, bc                                   ;; 06:59FB $09
    ld   [hl], e                                  ;; 06:59FC $73
    call ClearEntitySpeed                         ;; 06:59FD $CD $7F $3D
    ld   a, [wDialogCharacterIndex]               ;; 06:5A00 $FA $70 $C1
    ld   e, $00                                   ;; 06:5A03 $1E $00
    and  $06                                      ;; 06:5A05 $E6 $06
    jr   z, .jr_5A0A                              ;; 06:5A07 $28 $01

    inc  e                                        ;; 06:5A09 $1C

.jr_5A0A
    ld   a, e                                     ;; 06:5A0A $7B
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:5A0B $E0 $F1

.jr_006_5A0D
    ld   hl, wEntitiesDirectionTable              ;; 06:5A0D $21 $80 $C3
    add  hl, bc                                   ;; 06:5A10 $09
    ld   a, [hl]                                  ;; 06:5A11 $7E
    and  a                                        ;; 06:5A12 $A7
    jr   nz, .jr_5A1B                             ;; 06:5A13 $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:5A15 $F0 $F1
    add  $02                                      ;; 06:5A17 $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:5A19 $E0 $F1

.jr_5A1B
    ld   de, YipYipSpriteVariants                 ;; 06:5A1B $11 $A8 $59
    ld   hl, wEntitiesPrivateState1Table          ;; 06:5A1E $21 $B0 $C2
    add  hl, bc                                   ;; 06:5A21 $09
    ld   a, [hl]                                  ;; 06:5A22 $7E
    and  a                                        ;; 06:5A23 $A7
    jr   nz, .useRibbonVariant                    ;; 06:5A24 $20 $0D

    ldh  a, [hMapRoom]                            ;; 06:5A26 $F0 $F6
    cp   UNKNOWN_ROOM_B2                          ; Inside the dog house
    jr   nz, .ribbonEnd                           ;; 06:5A2A $20 $0A
    ld   a, [wTradeSequenceItem]                  ;; 06:5A2C $FA $0E $DB
    cp   TRADING_ITEM_DOG_FOOD                    ;; 06:5A2F $FE $03
    jr   c, .ribbonEnd                            ;; 06:5A31 $38 $03
.useRibbonVariant
    ld   de, YipYipWithRibbonSpriteVariants       ;; 06:5A33 $11 $C8 $59
.ribbonEnd

    ld   a, [wGameplayType]                       ;; 06:5A36 $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 06:5A39 $FE $01
    jr   nz, .jr_5A43                             ;; 06:5A3B $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:5A3D $F0 $F1
    add  $04                                      ;; 06:5A3F $C6 $04
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:5A41 $E0 $F1

.jr_5A43
    call RenderActiveEntitySpritesPair            ;; 06:5A43 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:5A46 $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ;; 06:5A49 $CD $56 $0C
    call AddEntityZSpeedToPos_06                  ;; 06:5A4C $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5A4F $21 $20 $C3
    add  hl, bc                                   ;; 06:5A52 $09
    dec  [hl]                                     ;; 06:5A53 $35
    dec  [hl]                                     ;; 06:5A54 $35
    ld   hl, wEntitiesPosZTable                   ;; 06:5A55 $21 $10 $C3
    add  hl, bc                                   ;; 06:5A58 $09
    ld   a, [hl]                                  ;; 06:5A59 $7E
    and  $80                                      ;; 06:5A5A $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 06:5A5C $E0 $E8
    jr   z, .jr_5A67                              ;; 06:5A5E $28 $07

    xor  a                                        ;; 06:5A60 $AF
    ld   [hl], a                                  ;; 06:5A61 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5A62 $21 $20 $C3
    add  hl, bc                                   ;; 06:5A65 $09
    ld   [hl], a                                  ;; 06:5A66 $77

.jr_5A67
    ldh  a, [hActiveEntityState]                  ;; 06:5A67 $F0 $F0
    cp   $02                                      ;; 06:5A69 $FE $02
    jr   nc, jr_006_5A98                          ;; 06:5A6B $30 $2B

    call CheckLinkInteractionWithEntity_06        ;; 06:5A6D $CD $5D $64
    jr   nc, jr_006_5A98                          ;; 06:5A70 $30 $26

    ld_dialog_low e, Dialog023                    ;; 06:5A72 $1E $23
    ldh  a, [hMapRoom]                            ;; 06:5A74 $F0 $F6
    cp   UNKNOWN_ROOM_B2                          ; Inside the dog house
    jr   nz, .openDialogInTable0                  ;; 06:5A78 $20 $17

    ld_dialog_low e, Dialog180                    ;; 06:5A7A $1E $80
    ld   a, [wTradeSequenceItem]                  ;; 06:5A7C $FA $0E $DB
    cp   TRADING_ITEM_RIBBON                      ;; 06:5A7F $FE $02
    jr   nz, .openDialogInTable1                  ;; 06:5A81 $20 $07

    call IncrementEntityState                     ;; 06:5A83 $CD $12 $3B
    ld   [hl], $02                                ;; 06:5A86 $36 $02
    ld_dialog_low e, Dialog181                    ;; 06:5A88 $1E $81

.openDialogInTable1
    ld   a, e                                     ;; 06:5A8A $7B
    call OpenDialogInTable1                       ;; 06:5A8B $CD $73 $23
    jp   func_006_5ACC                            ;; 06:5A8E $C3 $CC $5A

.openDialogInTable0
    ld   a, e                                     ;; 06:5A91 $7B
    call OpenDialogInTable0                       ;; 06:5A92 $CD $85 $23
    call func_006_5ACC                            ;; 06:5A95 $CD $CC $5A

jr_006_5A98:
    ldh  a, [hActiveEntityState]                  ;; 06:5A98 $F0 $F0
    JP_TABLE                                      ;; 06:5A9A
._00 dw YipYipState0Handler
._01 dw YipYipState1Handler
._02 dw YipYipState2Handler
._03 dw YipYipState3Handler

YipYipState2Handler::
    ld   a, [wDialogState]                        ;; 06:5AA3 $FA $9F $C1
    and  a                                        ;; 06:5AA6 $A7
    jr   nz, ret_006_5AD0                         ;; 06:5AA7 $20 $27

    ld   a, [wDialogAskSelectionIndex]            ;; 06:5AA9 $FA $77 $C1
    and  a                                        ;; 06:5AAC $A7
    jr   nz, .jr_5AC3                             ;; 06:5AAD $20 $14

    ld   a, TRADING_ITEM_DOG_FOOD                 ;; 06:5AAF $3E $03
    ld   [wTradeSequenceItem], a                  ;; 06:5AB1 $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 06:5AB4 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 06:5AB6 $E0 $A5
    call_open_dialog Dialog183                    ;; 06:5AB8
    call func_006_5ACC                            ;; 06:5ABD $CD $CC $5A
    jp   IncrementEntityState                     ;; 06:5AC0 $C3 $12 $3B

.jr_5AC3
    call IncrementEntityState                     ;; 06:5AC3 $CD $12 $3B
    ld   [hl], b                                  ;; 06:5AC6 $70
    call_open_dialog Dialog184                    ;; 06:5AC7

func_006_5ACC::
    ld   a, WAVE_SFX_CHAIN_CHOMP                  ;; 06:5ACC $3E $18
    ldh  [hWaveSfx], a                            ;; 06:5ACE $E0 $F3

ret_006_5AD0:
    ret                                           ;; 06:5AD0 $C9

YipYipState3Handler::
    ld   a, [wDialogState]                        ;; 06:5AD1 $FA $9F $C1
    and  a                                        ;; 06:5AD4 $A7
    jr   nz, .ret_5ADE                            ;; 06:5AD5 $20 $07

    call CreateTradingItemEntity                  ;; 06:5AD7 $CD $0C $0C
    call IncrementEntityState                     ;; 06:5ADA $CD $12 $3B
    ld   [hl], b                                  ;; 06:5ADD $70

.ret_5ADE
    ret                                           ;; 06:5ADE $C9

Data_006_5ADF::
    db   $02, $08, $0C, $08, $FE, $F8, $F4, $F8

YipYipState0Handler::
    xor  a                                        ;; 06:5AE7 $AF
    call SetEntitySpriteVariant                   ;; 06:5AE8 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 06:5AEB $CD $05 $0C
    jr   nz, .jr_5B27                             ;; 06:5AEE $20 $37

    call GetRandomByte                            ;; 06:5AF0 $CD $0D $28
    and  $07                                      ;; 06:5AF3 $E6 $07
    ld   e, a                                     ;; 06:5AF5 $5F
    ld   d, b                                     ;; 06:5AF6 $50
    ld   hl, Data_006_5ADF                        ;; 06:5AF7 $21 $DF $5A
    add  hl, de                                   ;; 06:5AFA $19
    ld   a, [hl]                                  ;; 06:5AFB $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:5AFC $21 $40 $C2
    add  hl, bc                                   ;; 06:5AFF $09
    ld   [hl], a                                  ;; 06:5B00 $77
    ld   a, e                                     ;; 06:5B01 $7B
    and  $04                                      ;; 06:5B02 $E6 $04
    ld   hl, wEntitiesDirectionTable              ;; 06:5B04 $21 $80 $C3
    add  hl, bc                                   ;; 06:5B07 $09
    ld   [hl], a                                  ;; 06:5B08 $77
    call GetRandomByte                            ;; 06:5B09 $CD $0D $28
    and  $07                                      ;; 06:5B0C $E6 $07
    ld   e, a                                     ;; 06:5B0E $5F
    ld   hl, Data_006_5ADF                        ;; 06:5B0F $21 $DF $5A
    add  hl, de                                   ;; 06:5B12 $19
    ld   a, [hl]                                  ;; 06:5B13 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:5B14 $21 $50 $C2
    add  hl, bc                                   ;; 06:5B17 $09
    ld   [hl], a                                  ;; 06:5B18 $77
    call GetEntityTransitionCountdown             ;; 06:5B19 $CD $05 $0C
    call GetRandomByte                            ;; 06:5B1C $CD $0D $28
    and  $1F                                      ;; 06:5B1F $E6 $1F
    add  $30                                      ;; 06:5B21 $C6 $30
    ld   [hl], a                                  ;; 06:5B23 $77
    call IncrementEntityState                     ;; 06:5B24 $CD $12 $3B

.jr_5B27
    jp   label_006_5B4C                           ;; 06:5B27 $C3 $4C $5B

YipYipState1Handler::
    call UpdateEntityPosWithSpeed_06              ;; 06:5B2A $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:5B2D $CD $23 $3B
    ldh  a, [hMultiPurposeG]                      ;; 06:5B30 $F0 $E8
    and  a                                        ;; 06:5B32 $A7
    jr   z, label_006_5B4C                        ;; 06:5B33 $28 $17

    call GetEntityTransitionCountdown             ;; 06:5B35 $CD $05 $0C
    jr   nz, .jr_5B41                             ;; 06:5B38 $20 $07

    ld   [hl], $30                                ;; 06:5B3A $36 $30
    call IncrementEntityState                     ;; 06:5B3C $CD $12 $3B
    ld   [hl], b                                  ;; 06:5B3F $70
    ret                                           ;; 06:5B40 $C9

.jr_5B41
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5B41 $21 $20 $C3
    add  hl, bc                                   ;; 06:5B44 $09
    ld   [hl], $08                                ;; 06:5B45 $36 $08
    ld   hl, wEntitiesPosZTable                   ;; 06:5B47 $21 $10 $C3
    add  hl, bc                                   ;; 06:5B4A $09
    inc  [hl]                                     ;; 06:5B4B $34

label_006_5B4C:
    ldh  a, [hFrameCounter]                       ;; 06:5B4C $F0 $E7
    rra                                           ;; 06:5B4E $1F
    rra                                           ;; 06:5B4F $1F
    rra                                           ;; 06:5B50 $1F
    and  $01                                      ;; 06:5B51 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:5B53 $C3 $0C $3B
