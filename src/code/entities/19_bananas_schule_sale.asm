; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown069SpriteVariants::
.variant0
    db $9A, $15
    db $9C, $15

label_019_6CE7:
    ld   de, Unknown069SpriteVariants             ;; 19:6CE7 $11 $E3 $6C
    call RenderActiveEntitySpritesPair            ;; 19:6CEA $CD $C0 $3B
    call AddEntityZSpeedToPos_19                  ;; 19:6CED $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ;; 19:6CF0 $21 $20 $C3
    add  hl, bc                                   ;; 19:6CF3 $09
    dec  [hl]                                     ;; 19:6CF4 $35
    ld   hl, wEntitiesPosZTable                   ;; 19:6CF5 $21 $10 $C3
    add  hl, bc                                   ;; 19:6CF8 $09
    ld   a, [hl]                                  ;; 19:6CF9 $7E
    and  $80                                      ;; 19:6CFA $E6 $80
    jp   nz, ClearEntityStatus_19                 ;; 19:6CFC $C2 $61 $7E

    ret                                           ;; 19:6CFF $C9

label_019_6D00:
    push bc                                       ;; 19:6D00 $C5
    sla  c                                        ;; 19:6D01 $CB $21
    sla  c                                        ;; 19:6D03 $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 19:6D05 $21 $80 $D5
    add  hl, bc                                   ;; 19:6D08 $09
    ld   a, $0B                                   ;; 19:6D09 $3E $0B
    ld   [hl+], a                                 ;; 19:6D0B $22
    ld   a, $09                                   ;; 19:6D0C $3E $09
    ld   [hl+], a                                 ;; 19:6D0E $22
    ld   a, $08                                   ;; 19:6D0F $3E $08
    ld   [hl+], a                                 ;; 19:6D11 $22
    ld   a, $0B                                   ;; 19:6D12 $3E $0B
    ld   [hl], a                                  ;; 19:6D14 $77
    pop  bc                                       ;; 19:6D15 $C1
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6D16 $21 $B0 $C2
    add  hl, bc                                   ;; 19:6D19 $09
    ld   a, [hl]                                  ;; 19:6D1A $7E
    and  a                                        ;; 19:6D1B $A7
    jp   nz, label_019_6CE7                       ;; 19:6D1C $C2 $E7 $6C

    call func_019_6EC5                            ;; 19:6D1F $CD $C5 $6E
    call PushLinkOutOfEntity_19                   ;; 19:6D22 $CD $A2 $7C
    ld   a, [wGameplayType]                       ;; 19:6D25 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 19:6D28 $FE $0B
    ret  nz                                       ;; 19:6D2A $C0

    ld   a, [wTransitionSequenceCounter]          ;; 19:6D2B $FA $6B $C1
    cp   $04                                      ;; 19:6D2E $FE $04
    ret  nz                                       ;; 19:6D30 $C0

    ldh  a, [hActiveEntityState]                  ;; 19:6D31 $F0 $F0
    JP_TABLE                                      ;; 19:6D33
._00 dw BananasSchuleState0Handler
._01 dw BananasSchuleState1Handler
._02 dw BananasSchuleState2Handler
._03 dw BananasSchuleState3Handler

BananasSchuleState0Handler::
    call func_019_7CF0                            ;; 19:6D3C $CD $F0 $7C
    jr   nc, jr_019_6D67                          ;; 19:6D3F $30 $26

    ld_dialog_low e, Dialog1CD                    ;; 19:6D41 $1E $CD
    ldh  a, [hRoomStatus]                         ;; 19:6D43 $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 19:6D45 $E6 $20
    jr   nz, .jr_6D63                             ;; 19:6D47 $20 $1A

    ld_dialog_low e, Dialog1CC                    ;; 19:6D49 $1E $CC
    ld   a, [wIndoorBRoomStatus + $FE]            ;; 19:6D4B $FA $FE $DA
    and  $20                                      ;; 19:6D4E $E6 $20
    jr   nz, .jr_6D63                             ;; 19:6D50 $20 $11

    ld_dialog_low e, Dialog1C6                    ;; 19:6D52 $1E $C6
    ld   a, [wTradeSequenceItem]                  ;; 19:6D54 $FA $0E $DB
    cp   TRADING_ITEM_DOG_FOOD                    ;; 19:6D57 $FE $03
    jr   nz, .jr_6D63                             ;; 19:6D59 $20 $08

    call_open_dialog Dialog1C7                    ;; 19:6D5B
    jp   IncrementEntityState                     ;; 19:6D60 $C3 $12 $3B

.jr_6D63
    ld   a, e                                     ;; 19:6D63 $7B
    call OpenDialogInTable1                       ;; 19:6D64 $CD $73 $23

jr_019_6D67:
    ldh  a, [hFrameCounter]                       ;; 19:6D67 $F0 $E7
    rra                                           ;; 19:6D69 $1F
    rra                                           ;; 19:6D6A $1F
    rra                                           ;; 19:6D6B $1F
    rra                                           ;; 19:6D6C $1F
    and  $01                                      ;; 19:6D6D $E6 $01
    jp   SetEntitySpriteVariant                   ;; 19:6D6F $C3 $0C $3B

BananasSchuleState1Handler::
    ld   a, [wDialogState]                        ;; 19:6D72 $FA $9F $C1
    and  a                                        ;; 19:6D75 $A7
    ret  nz                                       ;; 19:6D76 $C0

    call IncrementEntityState                     ;; 19:6D77 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 19:6D7A $FA $77 $C1
    and  a                                        ;; 19:6D7D $A7
    jr   z, .jr_6D86                              ;; 19:6D7E $28 $06

    ld   [hl], b                                  ;; 19:6D80 $70
    jp_open_dialog Dialog1C9                      ;; 19:6D81

.jr_6D86
    jp_open_dialog Dialog1C8                      ;; 19:6D86

BananasSchuleState2Handler::
    ld   a, [wDialogState]                        ;; 19:6D8B $FA $9F $C1
    and  a                                        ;; 19:6D8E $A7
    ret  nz                                       ;; 19:6D8F $C0

    ld   a, ENTITY_BANANAS_SCHULE_SALE            ;; 19:6D90 $3E $CD
    call SpawnNewEntity_trampoline                ;; 19:6D92 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 19:6D95 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 19:6D97 $21 $00 $C2
    add  hl, de                                   ;; 19:6D9A $19
    sub  $02                                      ;; 19:6D9B $D6 $02
    ld   [hl], a                                  ;; 19:6D9D $77
    ldh  a, [hMultiPurpose1]                      ;; 19:6D9E $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 19:6DA0 $21 $10 $C2
    add  hl, de                                   ;; 19:6DA3 $19
    ld   [hl], a                                  ;; 19:6DA4 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6DA5 $21 $B0 $C2
    add  hl, de                                   ;; 19:6DA8 $19
    ld   [hl], $01                                ;; 19:6DA9 $36 $01
    ld   hl, wEntitiesSpeedZTable                 ;; 19:6DAB $21 $20 $C3
    add  hl, de                                   ;; 19:6DAE $19
    ld   [hl], $20                                ;; 19:6DAF $36 $20
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:6DB1 $21 $40 $C3
    add  hl, de                                   ;; 19:6DB4 $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 19:6DB5 $36 $C2
    ld   a, JINGLE_JUMP                           ;; 19:6DB7 $3E $24
    ldh  [hJingle], a                             ;; 19:6DB9 $E0 $F2
    ldh  a, [hIsGBC]                              ;; 19:6DBB $F0 $FE
    and  a                                        ;; 19:6DBD $A7
    jr   z, .jr_6DD4                              ;; 19:6DBE $28 $14

    ld   hl, wObjPal6 + 1*2                       ;; 19:6DC0 $21 $7A $DC
    ld   a, $FF                                   ;; 19:6DC3 $3E $FF
    ld   [hl+], a                                 ;; 19:6DC5 $22
    ld   a, $7F                                   ;; 19:6DC6 $3E $7F
    ld   [hl+], a                                 ;; 19:6DC8 $22
    ld   a, $31                                   ;; 19:6DC9 $3E $31
    ld   [hl+], a                                 ;; 19:6DCB $22
    ld   a, $52                                   ;; 19:6DCC $3E $52
    ld   [hl+], a                                 ;; 19:6DCE $22
    ld   a, $02                                   ;; 19:6DCF $3E $02
    ld   [wPaletteDataFlags], a                   ;; 19:6DD1 $EA $D1 $DD

.jr_6DD4
    call GetEntityTransitionCountdown             ;; 19:6DD4 $CD $05 $0C
    ld   [hl], $C0                                ;; 19:6DD7 $36 $C0
    jp   IncrementEntityState                     ;; 19:6DD9 $C3 $12 $3B

Data_019_6DDC::
    db   $00, $01, $02, $01

BananasSchuleState3Handler::
    ld   a, $02                                   ;; 19:6DE0 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:6DE2 $E0 $A1
    ld   [wC167], a                               ;; 19:6DE4 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 19:6DE7 $CD $05 $0C
    jr   nz, .jr_6E01                             ;; 19:6DEA $20 $15

    xor  a                                        ;; 19:6DEC $AF
    ld   [wC167], a                               ;; 19:6DED $EA $67 $C1
    ld   a, TRADING_ITEM_BANANAS                  ;; 19:6DF0 $3E $04
    ld   [wTradeSequenceItem], a                  ;; 19:6DF2 $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 19:6DF5 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 19:6DF7 $E0 $A5
    call CreateTradingItemEntity                  ;; 19:6DF9 $CD $0C $0C
    call IncrementEntityState                     ;; 19:6DFC $CD $12 $3B
    ld   [hl], b                                  ;; 19:6DFF $70
    ret                                           ;; 19:6E00 $C9

.jr_6E01
    cp   $80                                      ;; 19:6E01 $FE $80
    jr   c, .jr_6E0A                              ;; 19:6E03 $38 $05

    ld   a, $03                                   ;; 19:6E05 $3E $03
    jp   SetEntitySpriteVariant                   ;; 19:6E07 $C3 $0C $3B

.jr_6E0A
    cp   $08                                      ;; 19:6E0A $FE $08
    jr   nz, .jr_6E14                             ;; 19:6E0C $20 $06

    dec  [hl]                                     ;; 19:6E0E $35
    call_open_dialog Dialog1CA                    ;; 19:6E0F

.jr_6E14
    ldh  a, [hFrameCounter]                       ;; 19:6E14 $F0 $E7
    rra                                           ;; 19:6E16 $1F
    rra                                           ;; 19:6E17 $1F
    rra                                           ;; 19:6E18 $1F
    and  $03                                      ;; 19:6E19 $E6 $03
    ld   e, a                                     ;; 19:6E1B $5F
    ld   d, b                                     ;; 19:6E1C $50
    ld   hl, Data_019_6DDC                        ;; 19:6E1D $21 $DC $6D
    add  hl, de                                   ;; 19:6E20 $19
    ld   a, [hl]                                  ;; 19:6E21 $7E
    jp   SetEntitySpriteVariant                   ;; 19:6E22 $C3 $0C $3B

Data_019_6E25::
    db   $00, $00, $50, $03, $00, $08, $52, $03, $00, $10, $54, $03, $10, $00, $56, $03
    db   $10, $08, $58, $03, $10, $10, $5A, $03, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $50, $03, $00, $08, $52, $03, $00, $10, $5C, $03, $10, $00, $56, $03
    db   $10, $08, $58, $03, $10, $10, $5E, $03, $10, $18, $60, $03, $FF, $FF, $FF, $FF
    db   $00, $00, $62, $03, $00, $08, $64, $03, $00, $10, $66, $03, $10, $00, $68, $03
    db   $10, $08, $58, $03, $10, $10, $5E, $03, $10, $18, $60, $03, $FF, $FF, $FF, $FF
    db   $00, $00, $6A, $03, $00, $08, $6C, $03, $00, $10, $6E, $03, $10, $00, $68, $03
    db   $10, $08, $58, $03, $10, $10, $5E, $03, $10, $18, $60, $03, $FF, $FF, $FF, $FF

Data_019_6EA5::
    db   $10, $00, $74, $07, $10, $08, $76, $07, $10, $10, $74, $07, $10, $18, $76, $07
    db   $00, $10, $74, $07, $00, $18, $76, $07, $00, $00, $74, $07, $00, $08, $76, $07

func_019_6EC5::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:6EC5 $F0 $F1
    rla                                           ;; 19:6EC7 $17
    rla                                           ;; 19:6EC8 $17
    rla                                           ;; 19:6EC9 $17
    rla                                           ;; 19:6ECA $17
    rla                                           ;; 19:6ECB $17
    and  $E0                                      ;; 19:6ECC $E6 $E0
    ld   e, a                                     ;; 19:6ECE $5F
    ld   d, b                                     ;; 19:6ECF $50
    ld   hl, Data_019_6E25                        ;; 19:6ED0 $21 $25 $6E
    add  hl, de                                   ;; 19:6ED3 $19
    ldh  a, [hActiveEntityPosX]                   ;; 19:6ED4 $F0 $EE
    add  $03                                      ;; 19:6ED6 $C6 $03
    ldh  [hActiveEntityPosX], a                   ;; 19:6ED8 $E0 $EE
    ld   c, $07                                   ;; 19:6EDA $0E $07
    call RenderActiveEntitySpritesRect            ;; 19:6EDC $CD $E6 $3C
    ld   a, $02                                   ;; 19:6EDF $3E $02
    call func_015_7964_trampoline                 ;; 19:6EE1 $CD $A0 $3D
    ld   a, $78                                   ;; 19:6EE4 $3E $78
    ldh  [hActiveEntityPosX], a                   ;; 19:6EE6 $E0 $EE
    ld   a, $5C                                   ;; 19:6EE8 $3E $5C
    ldh  [hActiveEntityVisualPosY], a             ;; 19:6EEA $E0 $EC
    ld   hl, Data_019_6EA5                        ;; 19:6EEC $21 $A5 $6E
    ld   c, $08                                   ;; 19:6EEF $0E $08
    ld   a, [wTradeSequenceItem]                  ;; 19:6EF1 $FA $0E $DB
    cp   TRADING_ITEM_BANANAS                     ;; 19:6EF4 $FE $04
    jr   nz, .jr_6EFA                             ;; 19:6EF6 $20 $02

    dec  c                                        ;; 19:6EF8 $0D
    dec  c                                        ;; 19:6EF9 $0D

.jr_6EFA
    call RenderActiveEntitySpritesRect            ;; 19:6EFA $CD $E6 $3C
    ld   a, $03                                   ;; 19:6EFD $3E $03
    call func_015_7964_trampoline                 ;; 19:6EFF $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ;; 19:6F02 $C3 $8A $3D

Data_019_6F05::
    db   $08, $04, $70, $01, $08, $0C, $72, $01, $08, $14, $70, $21

BananasSchuleSaleEntityHandler::
    ld   a, [wIsIndoor]                           ;; 19:6F11 $FA $A5 $DB
    and  a                                        ;; 19:6F14 $A7
    jr   nz, .jr_6F25                             ;; 19:6F15 $20 $0E

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:6F17 $21 $40 $C3
    add  hl, bc                                   ;; 19:6F1A $09
    ld   [hl], 3 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 19:6F1B $36 $C3
    ld   hl, Data_019_6F05                        ;; 19:6F1D $21 $05 $6F
    ld   c, $03                                   ;; 19:6F20 $0E $03
    jp   RenderActiveEntitySpritesRect            ;; 19:6F22 $C3 $E6 $3C

.jr_6F25
    ldh  a, [hMapRoom]                            ;; 19:6F25 $F0 $F6
    cp   UNKNOWN_ROOM_FE                          ;; 19:6F27 $FE $FE
    jp   z, label_019_6D00                        ;; 19:6F29 $CA $00 $6D

    ldh  a, [hActiveEntityPosX]                   ;; 19:6F2C $F0 $EE
    cp   $30                                      ;; 19:6F2E $FE $30
    jp   c, label_019_70A9                        ;; 19:6F30 $DA $A9 $70

    ldh  a, [hActiveEntityState]                  ;; 19:6F33 $F0 $F0
    and  a                                        ;; 19:6F35 $A7
    jr   nz, .jr_6F66                             ;; 19:6F36 $20 $2E

    call IncrementEntityState                     ;; 19:6F38 $CD $12 $3B
    ld   hl, wEntitiesPosYTable                   ;; 19:6F3B $21 $10 $C2
    add  hl, bc                                   ;; 19:6F3E $09
    ld   [hl], $48                                ;; 19:6F3F $36 $48
    ld   hl, wEntitiesPosXTable                   ;; 19:6F41 $21 $00 $C2
    add  hl, bc                                   ;; 19:6F44 $09
    ld   a, [hl]                                  ;; 19:6F45 $7E
    sub  $04                                      ;; 19:6F46 $D6 $04
    ld   [hl], a                                  ;; 19:6F48 $77
    ld   a, ENTITY_BANANAS_SCHULE_SALE            ;; 19:6F49 $3E $CD
    call SpawnNewEntity_trampoline                ;; 19:6F4B $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 19:6F4E $21 $00 $C2
    add  hl, de                                   ;; 19:6F51 $19
    ld   [hl], $28                                ;; 19:6F52 $36 $28
    ld   hl, wEntitiesPosYTable                   ;; 19:6F54 $21 $10 $C2
    add  hl, de                                   ;; 19:6F57 $19
    ld   [hl], $28                                ;; 19:6F58 $36 $28
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6F5A $21 $B0 $C2
    add  hl, de                                   ;; 19:6F5D $19
    ld   [hl], $01                                ;; 19:6F5E $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:6F60 $21 $E0 $C2
    add  hl, de                                   ;; 19:6F63 $19
    ld   [hl], $40                                ;; 19:6F64 $36 $40

.jr_6F66
    push bc                                       ;; 19:6F66 $C5
    sla  c                                        ;; 19:6F67 $CB $21
    sla  c                                        ;; 19:6F69 $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 19:6F6B $21 $80 $D5
    add  hl, bc                                   ;; 19:6F6E $09
    ld   a, $0A                                   ;; 19:6F6F $3E $0A
    ld   [hl+], a                                 ;; 19:6F71 $22
    ld   a, $08                                   ;; 19:6F72 $3E $08
    ld   [hl+], a                                 ;; 19:6F74 $22
    ld   a, $FF                                   ;; 19:6F75 $3E $FF
    ld   [hl+], a                                 ;; 19:6F77 $22
    ld   a, $09                                   ;; 19:6F78 $3E $09
    ld   [hl], a                                  ;; 19:6F7A $77
    pop  bc                                       ;; 19:6F7B $C1
    call func_019_7039                            ;; 19:6F7C $CD $39 $70
    call PushLinkOutOfEntity_19                   ;; 19:6F7F $CD $A2 $7C
    ldh  a, [hActiveEntityState]                  ;; 19:6F82 $F0 $F0
    JP_TABLE                                      ;; 19:6F84
._00 dw func_019_6F8B                             ;; 19:6F85
._01 dw func_019_6F8C                             ;; 19:6F87
._02 dw func_019_6FC5                             ;; 19:6F89

func_019_6F8B::
    ret                                           ;; 19:6F8B $C9

func_019_6F8C::
    call GetEntitySlowTransitionCountdown         ;; 19:6F8C $CD $FB $0B
    ret  nz                                       ;; 19:6F8F $C0

    call func_019_7CF0                            ;; 19:6F90 $CD $F0 $7C
    jr   nc, jr_019_6FB8                          ;; 19:6F93 $30 $23

    ld   a, [wTradeSequenceItem]                  ;; 19:6F95 $FA $0E $DB
    cp   TRADING_ITEM_SCALE                       ;; 19:6F98 $FE $0D
    jr   nz, .jr_6FA0                             ;; 19:6F9A $20 $04

    ld_dialog_low a, Dialog18F                    ;; 19:6F9C $3E $8F
    jr   jr_019_6FAD                              ;; 19:6F9E $18 $0D

.jr_6FA0
    cp   TRADING_ITEM_MAGNIFYING_LENS             ;; 19:6FA0 $FE $0E
    jr   nz, .jr_6FAB                             ;; 19:6FA2 $20 $07

    call_open_dialog Dialog0D8                    ;; 19:6FA4
    jr   jr_019_6FB0                              ;; 19:6FA9 $18 $05

.jr_6FAB
    ld_dialog_low a, Dialog19B                    ;; 19:6FAB $3E $9B

jr_019_6FAD:
    call OpenDialogInTable1                       ;; 19:6FAD $CD $73 $23

jr_019_6FB0:
    ld   hl, wDialogState                         ;; 19:6FB0 $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 19:6FB3 $CB $FE
    call IncrementEntityState                     ;; 19:6FB5 $CD $12 $3B

jr_019_6FB8:
    ldh  a, [hFrameCounter]                       ;; 19:6FB8 $F0 $E7
    ld   e, $00                                   ;; 19:6FBA $1E $00
    and  $20                                      ;; 19:6FBC $E6 $20
    jr   z, .jr_6FC1                              ;; 19:6FBE $28 $01

    inc  e                                        ;; 19:6FC0 $1C

.jr_6FC1
    ld   a, e                                     ;; 19:6FC1 $7B
    jp   SetEntitySpriteVariant                   ;; 19:6FC2 $C3 $0C $3B

func_019_6FC5::
    ld   a, [wDialogState]                        ;; 19:6FC5 $FA $9F $C1
    and  a                                        ;; 19:6FC8 $A7
    jr   nz, .jr_6FD0                             ;; 19:6FC9 $20 $05

    call IncrementEntityState                     ;; 19:6FCB $CD $12 $3B
    ld   [hl], $01                                ;; 19:6FCE $36 $01

.jr_6FD0
    call EntityLinkPositionXDifference_19         ;; 19:6FD0 $CD $0B $7E
    ld   a, e                                     ;; 19:6FD3 $7B
    add  $02                                      ;; 19:6FD4 $C6 $02
    jp   SetEntitySpriteVariant                   ;; 19:6FD6 $C3 $0C $3B

Data_019_6FD9::
    db   $F8, $F8, $5A, $02, $F8, $00, $5C, $02, $F8, $08, $5E, $02, $08, $00, $60, $02
    db   $08, $08, $62, $02, $F8, $10, $5A, $22, $F8, $00, $5E, $22, $F8, $08, $5C, $22
    db   $08, $00, $62, $22, $08, $08, $60, $22, $00, $10, $50, $22, $F8, $00, $54, $22
    db   $F8, $08, $52, $22, $08, $00, $58, $22, $08, $08, $56, $22, $00, $F8, $50, $02
    db   $F8, $00, $52, $02, $F8, $08, $54, $02, $08, $00, $56, $02, $08, $08, $58, $02

Data_019_7029::
    db   $F0, $00, $76, $01, $F0, $08, $76, $21, $00, $00, $78, $01, $00, $08, $78, $21

func_019_7039::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:7039 $F0 $F1
    rla                                           ;; 19:703B $17
    rla                                           ;; 19:703C $17
    and  $FC                                      ;; 19:703D $E6 $FC
    ld   e, a                                     ;; 19:703F $5F
    rla                                           ;; 19:7040 $17
    rla                                           ;; 19:7041 $17
    and  $F0                                      ;; 19:7042 $E6 $F0
    add  e                                        ;; 19:7044 $83
    ld   e, a                                     ;; 19:7045 $5F
    ld   d, b                                     ;; 19:7046 $50
    ld   hl, Data_019_6FD9                        ;; 19:7047 $21 $D9 $6F
    add  hl, de                                   ;; 19:704A $19
    ldh  a, [hActiveEntityPosX]                   ;; 19:704B $F0 $EE
    add  $04                                      ;; 19:704D $C6 $04
    ldh  [hActiveEntityPosX], a                   ;; 19:704F $E0 $EE
    ld   c, $05                                   ;; 19:7051 $0E $05
    call RenderActiveEntitySpritesRect            ;; 19:7053 $CD $E6 $3C
    ldh  a, [hActiveEntityPosX]                   ;; 19:7056 $F0 $EE
    add  $10                                      ;; 19:7058 $C6 $10
    ldh  [hActiveEntityPosX], a                   ;; 19:705A $E0 $EE
    ld   hl, Data_019_7029                        ;; 19:705C $21 $29 $70
    ld   c, $04                                   ;; 19:705F $0E $04
    call RenderActiveEntitySpritesRect            ;; 19:7061 $CD $E6 $3C
    call PushLinkOutOfEntity_19                   ;; 19:7064 $CD $A2 $7C
    ldh  a, [hLinkPositionX]                      ;; 19:7067 $F0 $98
    sub  $68                                      ;; 19:7069 $D6 $68
    add  $04                                      ;; 19:706B $C6 $04
    cp   $08                                      ;; 19:706D $FE $08
    jr   nc, .jr_70A6                             ;; 19:706F $30 $35

    ldh  a, [hLinkPositionY]                      ;; 19:7071 $F0 $99
    sub  $50                                      ;; 19:7073 $D6 $50
    add  $04                                      ;; 19:7075 $C6 $04
    cp   $08                                      ;; 19:7077 $FE $08
    jr   nc, .jr_70A6                             ;; 19:7079 $30 $2B

    ldh  a, [hLinkDirection]                      ;; 19:707B $F0 $9E
    cp   $02                                      ;; 19:707D $FE $02
    jr   nz, .jr_70A6                             ;; 19:707F $20 $25

    call func_019_7D16                            ;; 19:7081 $CD $16 $7D
    jr   nc, .jr_70A6                             ;; 19:7084 $30 $20

    call GetEntitySlowTransitionCountdown         ;; 19:7086 $CD $FB $0B
    jr   nz, .jr_70A6                             ;; 19:7089 $20 $1B

    ld   a, [wTransitionSequenceCounter]          ;; 19:708B $FA $6B $C1
    cp   $04                                      ;; 19:708E $FE $04
    jr   nz, .jr_70A6                             ;; 19:7090 $20 $14

    ld   a, GAMEPLAY_CUTSCENE                     ;; 19:7092 $3E $08
    ld   [wGameplayType], a                       ;; 19:7094 $EA $95 $DB
    xor  a                                        ;; 19:7097 $AF
    ld   [wTransitionSequenceCounter], a          ;; 19:7098 $EA $6B $C1
    ld   [wC16C], a                               ;; 19:709B $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 19:709E $EA $96 $DB
    call GetEntitySlowTransitionCountdown         ;; 19:70A1 $CD $FB $0B
    ld   [hl], $08                                ;; 19:70A4 $36 $08

.jr_70A6
    jp   CopyEntityPositionToActivePosition       ;; 19:70A6 $C3 $8A $3D

label_019_70A9:
    push bc                                       ;; 19:70A9 $C5
    sla  c                                        ;; 19:70AA $CB $21
    sla  c                                        ;; 19:70AC $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 19:70AE $21 $80 $D5
    add  hl, bc                                   ;; 19:70B1 $09
    inc  hl                                       ;; 19:70B2 $23
    inc  hl                                       ;; 19:70B3 $23
    inc  hl                                       ;; 19:70B4 $23
    ld   a, $09                                   ;; 19:70B5 $3E $09
    ld   [hl], a                                  ;; 19:70B7 $77
    pop  bc                                       ;; 19:70B8 $C1
    call GetEntityTransitionCountdown             ;; 19:70B9 $CD $05 $0C
    jr   z, .jr_70C2                              ;; 19:70BC $28 $04

    ld   a, $00                                   ;; 19:70BE $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ;; 19:70C0 $E0 $F1

.jr_70C2
    call func_019_717C                            ;; 19:70C2 $CD $7C $71
    call PushLinkOutOfEntity_19                   ;; 19:70C5 $CD $A2 $7C
    ld   hl, wEntitiesDirectionTable              ;; 19:70C8 $21 $80 $C3
    add  hl, bc                                   ;; 19:70CB $09
    ldh  a, [hFrameCounter]                       ;; 19:70CC $F0 $E7
    rra                                           ;; 19:70CE $1F
    rra                                           ;; 19:70CF $1F
    rra                                           ;; 19:70D0 $1F
    and  $01                                      ;; 19:70D1 $E6 $01
    inc  a                                        ;; 19:70D3 $3C
    add  [hl]                                     ;; 19:70D4 $86
    call SetEntitySpriteVariant                   ;; 19:70D5 $CD $0C $3B
    call EntityLinkPositionYDifference_19         ;; 19:70D8 $CD $1B $7E
    add  $13                                      ;; 19:70DB $C6 $13
    cp   $26                                      ;; 19:70DD $FE $26
    jr   nc, .jr_70F2                             ;; 19:70DF $30 $11

    call EntityLinkPositionXDifference_19         ;; 19:70E1 $CD $0B $7E
    add  $13                                      ;; 19:70E4 $C6 $13
    cp   $26                                      ;; 19:70E6 $FE $26
    jr   nc, .jr_70F2                             ;; 19:70E8 $30 $08

    ld   a, e                                     ;; 19:70EA $7B
    sla  a                                        ;; 19:70EB $CB $27
    ld   hl, wEntitiesDirectionTable              ;; 19:70ED $21 $80 $C3
    add  hl, bc                                   ;; 19:70F0 $09
    ld   [hl], a                                  ;; 19:70F1 $77

.jr_70F2
    call func_019_7CF0                            ;; 19:70F2 $CD $F0 $7C
    ret  nc                                       ;; 19:70F5 $D0

    ld   hl, wEntitiesInertiaTable                ;; 19:70F6 $21 $D0 $C3
    add  hl, bc                                   ;; 19:70F9 $09
    ld   a, [hl]                                  ;; 19:70FA $7E
    inc  [hl]                                     ;; 19:70FB $34
    and  $01                                      ;; 19:70FC $E6 $01
    jr   z, .jr_7112                              ;; 19:70FE $28 $12

    ld_dialog_low e, Dialog0AF                    ;; 19:7100 $1E $AF
    call GetRandomByte                            ;; 19:7102 $CD $0D $28
    and  $3F                                      ;; 19:7105 $E6 $3F
    jr   z, jr_019_7114                           ;; 19:7107 $28 $0B

    ld_dialog_low e, Dialog0FB                    ;; 19:7109 $1E $FB
    call GetRandomByte                            ;; 19:710B $CD $0D $28
    and  $07                                      ;; 19:710E $E6 $07
    jr   z, jr_019_7114                           ;; 19:7110 $28 $02

.jr_7112
    ld_dialog_low e, Dialog0FA                    ;; 19:7112 $1E $FA

jr_019_7114:
    ld   a, e                                     ;; 19:7114 $7B
    jp   OpenDialogInTable0                       ;; 19:7115 $C3 $85 $23

Data_019_7118::
    db   $F4, $00, $64, $03, $F4, $08, $66, $03, $04, $00, $68, $03, $04, $08, $6A, $03
    db   $FF, $FF, $FF, $FF, $04, $F8, $70, $03, $F4, $00, $6C, $03, $F4, $08, $6E, $03
    db   $04, $00, $72, $03, $04, $08, $74, $03, $04, $F8, $7A, $03, $F4, $00, $6C, $03
    db   $F4, $08, $6E, $03, $04, $00, $7C, $03, $04, $08, $74, $03, $04, $10, $70, $23
    db   $F4, $00, $6E, $23, $F4, $08, $6C, $23, $04, $00, $74, $23, $04, $08, $72, $23
    db   $04, $10, $7A, $23, $F4, $00, $6E, $23, $F4, $08, $6C, $23, $04, $00, $74, $23
    db   $04, $08, $7C, $23

func_019_717C::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:717C $F0 $F1
    rla                                           ;; 19:717E $17
    rla                                           ;; 19:717F $17
    and  $FC                                      ;; 19:7180 $E6 $FC
    ld   e, a                                     ;; 19:7182 $5F
    rla                                           ;; 19:7183 $17
    rla                                           ;; 19:7184 $17
    and  $F0                                      ;; 19:7185 $E6 $F0
    add  e                                        ;; 19:7187 $83
    ld   e, a                                     ;; 19:7188 $5F
    ld   d, b                                     ;; 19:7189 $50
    ld   hl, Data_019_7118                        ;; 19:718A $21 $18 $71
    add  hl, de                                   ;; 19:718D $19
    ld   c, $05                                   ;; 19:718E $0E $05
    jp   RenderActiveEntitySpritesRect            ;; 19:7190 $C3 $E6 $3C
