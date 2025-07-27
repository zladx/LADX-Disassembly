TrendyGameOwnerEntityHandler::
    ld   a, [wIsMarinFollowingLink]               ;; 04:6E7C $FA $73 $DB
    push af                                       ;; 04:6E7F $F5
    ldh  a, [hRoomStatus]                         ;; 04:6E80 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 04:6E82 $E6 $10
    jr   z, .jr_6E8A                              ;; 04:6E84 $28 $04

    xor  a                                        ;; 04:6E86 $AF
    ld   [wIsMarinFollowingLink], a               ;; 04:6E87 $EA $73 $DB

.jr_6E8A
    call func_004_6E92                            ;; 04:6E8A $CD $92 $6E
    pop  af                                       ;; 04:6E8D $F1
    ld   [wIsMarinFollowingLink], a               ;; 04:6E8E $EA $73 $DB
    ret                                           ;; 04:6E91 $C9

func_004_6E92::
    ld   hl, wEntitiesPrivateState1Table          ;; 04:6E92 $21 $B0 $C2
    add  hl, bc                                   ;; 04:6E95 $09
    ld   a, [hl]                                  ;; 04:6E96 $7E
    and  a                                        ;; 04:6E97 $A7
    jp   nz, label_004_74D9                       ;; 04:6E98 $C2 $D9 $74

    ld   a, c                                     ;; 04:6E9B $79
    ld   [wD210], a                               ;; 04:6E9C $EA $10 $D2
    ld   a, $02                                   ;; 04:6E9F $3E $02
    ld   [wBlockItemUsage], a                     ;; 04:6EA1 $EA $0A $C5
    call GetEntityPrivateCountdown1               ;; 04:6EA4 $CD $00 $0C
    dec  a                                        ;; 04:6EA7 $3D
    jr   nz, .jr_6EAE                             ;; 04:6EA8 $20 $04

    ld   a, JINGLE_NEW_HEART                      ;; 04:6EAA $3E $19
    ldh  [hJingle], a                             ;; 04:6EAC $E0 $F2

.jr_6EAE
    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:6EAE $F0 $F1
    inc  a                                        ;; 04:6EB0 $3C
    jr   z, jr_004_6ECA                           ;; 04:6EB1 $28 $17

    ldh  a, [hFrameCounter]                       ;; 04:6EB3 $F0 $E7
    and  $1F                                      ;; 04:6EB5 $E6 $1F
    jr   nz, .jr_6EC1                             ;; 04:6EB7 $20 $08

    call GetEntityDirectionToLink_04              ;; 04:6EB9 $CD $55 $6E
    ld   hl, wEntitiesDirectionTable              ;; 04:6EBC $21 $80 $C3
    add  hl, bc                                   ;; 04:6EBF $09
    ld   [hl], e                                  ;; 04:6EC0 $73

.jr_6EC1
    call SetEntityVariantForDirection_04          ;; 04:6EC1 $CD $98 $7C
    ld   de, ShopOwnerSpriteVariants              ;; 04:6EC4 $11 $CB $76
    call RenderActiveEntitySpritesPair            ;; 04:6EC7 $CD $C0 $3B

jr_004_6ECA:
    call func_004_73FE                            ;; 04:6ECA $CD $FE $73
    call CopyEntityPositionToActivePosition       ;; 04:6ECD $CD $8A $3D
    call PushLinkOutOfEntity_04                   ;; 04:6ED0 $CD $E3 $7B
    call func_004_73B7                            ;; 04:6ED3 $CD $B7 $73
    ldh  a, [hActiveEntityState]                  ;; 04:6ED6 $F0 $F0
    cp   $03                                      ;; 04:6ED8 $FE $03
    jr   c, .jr_6EE9                              ;; 04:6EDA $38 $0D

    ld   a, [wIsMarinFollowingLink]               ;; 04:6EDC $FA $73 $DB
    and  a                                        ;; 04:6EDF $A7
    jr   z, .jr_6EE9                              ;; 04:6EE0 $28 $07

    ld   a, $02                                   ;; 04:6EE2 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:6EE4 $E0 $A1
    ld   [wC167], a                               ;; 04:6EE6 $EA $67 $C1

.jr_6EE9
    ld   a, [wGameplayType]                       ;; 04:6EE9 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 04:6EEC $FE $0B
    ret  nz                                       ;; 04:6EEE $C0

    ld   a, [wTransitionSequenceCounter]          ;; 04:6EEF $FA $6B $C1
    cp   $04                                      ;; 04:6EF2 $FE $04
    ret  nz                                       ;; 04:6EF4 $C0

TrendyEntityJumpTable:
    ldh  a, [hActiveEntityState]                  ;; 04:6EF5 $F0 $F0
    JP_TABLE                                      ;; 04:6EF7
._00 dw func_004_6F38                             ;; 04:6EF8
._01 dw func_004_6FC6                             ;; 04:6EFA
._02 dw func_004_7020                             ;; 04:6EFC
._03 dw func_004_707F                             ;; 04:6EFE
._04 dw func_004_710C                             ;; 04:6F00
._05 dw func_004_7179                             ;; 04:6F02
._06 dw func_004_71B0                             ;; 04:6F04
._07 dw func_004_71FF                             ;; 04:6F06
._08 dw func_004_7249                             ;; 04:6F08
._09 dw func_004_727C                             ;; 04:6F0A
._0A dw func_004_7296                             ;; 04:6F0C
._0B dw func_004_72EF                             ;; 04:6F0E
._0C dw func_004_732F                             ;; 04:6F10

; Remainer of the entities initial pos y table
Data_004_6F12::
    db   $38, $58, $78

; Trendy entity  initial direction
Data_004_6F15::
    db   $58, $40, $70, $2E, $2E, $2E

; Trendy entity initial sprite variant
Data_004_6F1B::
    db   $3E, $4E, $4E, $00, $00, $00

; Values for wEntitiesPhysicsFlagsTable
Data_004_6F21::
    db   $04, $01, $02, $05, $02, $02, $00, $03, $04, $81, $81, $81, $82, $81, $81

Data_004_6F30::
    db   $FF, $47, $31, $52, $C5, $28, $00, $00

func_004_6F38::
    ld   e, $06                                   ;; 04:6F38 $1E $06
    ld   d, $00                                   ;; 04:6F3A $16 $00

jr_004_6F3C:
    push de                                       ;; 04:6F3C $D5
    ld   a, ENTITY_TRENDY_GAME_OWNER              ;; 04:6F3D $3E $4F
    ld   e, $0E                                   ;; 04:6F3F $1E $0E
    call SpawnNewEntityInRange_trampoline         ;; 04:6F41 $CD $98 $3B

    ; Set entity X and Y position from values depending on privateState1.
    ;
    ; (NB: the code finds it clever to re-use some values from the
    ; entity jump table.)
    ld   hl, wEntitiesPrivateState1Table          ;; 04:6F44 $21 $B0 $C2
    add  hl, de                                   ;; 04:6F47 $19
    ld   [hl], $01                                ;; 04:6F48 $36 $01

    ld   hl, (TrendyEntityJumpTable._08 + 1)      ;; 04:6F4A $21 $09 $6F
    add  hl, de                                   ;; 04:6F4D $19
    ld   a, [hl]                                  ;; 04:6F4E $7E
    ld   hl, wEntitiesPosXTable                   ;; 04:6F4F $21 $00 $C2
    add  hl, de                                   ;; 04:6F52 $19
    ld   [hl], a                                  ;; 04:6F53 $77

    ld   hl, (TrendyEntityJumpTable._0B + 1)      ;; 04:6F54 $21 $0F $6F
    add  hl, de                                   ;; 04:6F57 $19
    ld   a, [hl]                                  ;; 04:6F58 $7E
    ld   hl, wEntitiesPosYTable                   ;; 04:6F59 $21 $10 $C2
    add  hl, de                                   ;; 04:6F5C $19
    ld   [hl], a                                  ;; 04:6F5D $77
    ld   hl, Data_004_6F1B                        ;; 04:6F5E $21 $1B $6F
    add  hl, de                                   ;; 04:6F61 $19
    ld   a, [hl]                                  ;; 04:6F62 $7E
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:6F63 $21 $B0 $C3
    add  hl, de                                   ;; 04:6F66 $19
    ld   [hl], a                                  ;; 04:6F67 $77
    ld   hl, Data_004_6F21                        ;; 04:6F68 $21 $21 $6F
    add  hl, de                                   ;; 04:6F6B $19

    ld   a, [hl]                                  ;; 04:6F6C $7E
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:6F6D $21 $40 $C3
    add  hl, de                                   ;; 04:6F70 $19
    ld   [hl], a                                  ;; 04:6F71 $77
    ld   hl, Data_004_6F15                        ;; 04:6F72 $21 $15 $6F
    add  hl, de                                   ;; 04:6F75 $19
    ld   a, [hl]                                  ;; 04:6F76 $7E
    ld   hl, wEntitiesDirectionTable              ;; 04:6F77 $21 $80 $C3
    add  hl, de                                   ;; 04:6F7A $19
    ld   [hl], a                                  ;; 04:6F7B $77
    push bc                                       ;; 04:6F7C $C5
    ld   c, e                                     ;; 04:6F7D $4B
    ld   b, d                                     ;; 04:6F7E $42
    call func_004_76B3                            ;; 04:6F7F $CD $B3 $76
    pop  bc                                       ;; 04:6F82 $C1
    pop  de                                       ;; 04:6F83 $D1
    dec  e                                        ;; 04:6F84 $1D
    jr   nz, jr_004_6F3C                          ;; 04:6F85 $20 $B5

    xor  a                                        ;; 04:6F87 $AF
    ld   [wD206], a                               ;; 04:6F88 $EA $06 $D2
    ld   a, $10                                   ;; 04:6F8B $3E $10
    ld   [wD202], a                               ;; 04:6F8D $EA $02 $D2
    ld   [wD203], a                               ;; 04:6F90 $EA $03 $D2
    ld   a, $16                                   ;; 04:6F93 $3E $16
    ld   [wD205], a                               ;; 04:6F95 $EA $05 $D2
    ld   a, $18                                   ;; 04:6F98 $3E $18
    ld   [wD204], a                               ;; 04:6F9A $EA $04 $D2
    ld   a, $00                                   ;; 04:6F9D $3E $00
    ld   [wD200], a                               ;; 04:6F9F $EA $00 $D2
    ld   a, $04                                   ;; 04:6FA2 $3E $04
    ld   [wD201], a                               ;; 04:6FA4 $EA $01 $D2
    call IncrementEntityState                     ;; 04:6FA7 $CD $12 $3B
    ld   a, [wTradeSequenceItem]                  ;; 04:6FAA $FA $0E $DB
    ld   hl, wEntitiesPrivateState5Table          ;; 04:6FAD $21 $90 $C3
    add  hl, bc                                   ;; 04:6FB0 $09
    ld   [hl], a                                  ;; 04:6FB1 $77
    ld   hl, wObjPal6                             ;; 04:6FB2 $21 $78 $DC
    ld   de, Data_004_6F30                        ;; 04:6FB5 $11 $30 $6F

.loop_6FB8
    ld   a, [de]                                  ;; 04:6FB8 $1A
    ld   [hl+], a                                 ;; 04:6FB9 $22
    inc  de                                       ;; 04:6FBA $13
    ld   a, l                                     ;; 04:6FBB $7D
    and  $07                                      ;; 04:6FBC $E6 $07
    jr   nz, .loop_6FB8                           ;; 04:6FBE $20 $F8

    ld   a, $02                                   ;; 04:6FC0 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 04:6FC2 $EA $D1 $DD
    ret                                           ;; 04:6FC5 $C9

func_004_6FC6::
    ld   a, [wC167]                               ;; 04:6FC6 $FA $67 $C1
    and  a                                        ;; 04:6FC9 $A7
    ret  nz                                       ;; 04:6FCA $C0

    ld   a, [wIsMarinFollowingLink]               ;; 04:6FCB $FA $73 $DB
    and  a                                        ;; 04:6FCE $A7
    jr   z, .jr_6FE2                              ;; 04:6FCF $28 $11

    ldh  a, [hLinkPositionX]                      ;; 04:6FD1 $F0 $98
    cp   $6C                                      ;; 04:6FD3 $FE $6C
    jr   c, .jr_6FE2                              ;; 04:6FD5 $38 $0B

    ld   hl, wIndoorBRoomStatus + $A0             ;; 04:6FD7 $21 $A0 $DA
    set  4, [hl]                                  ;; 04:6FDA $CB $E6
    ld   a, $6B                                   ;; 04:6FDC $3E $6B
    ldh  [hLinkPositionX], a                      ;; 04:6FDE $E0 $98
    jr   jr_004_6FE6                              ;; 04:6FE0 $18 $04

.jr_6FE2
    call func_004_7C06                            ;; 04:6FE2 $CD $06 $7C
    ret  nc                                       ;; 04:6FE5 $D0

jr_004_6FE6:
    xor  a                                        ;; 04:6FE6 $AF
    ld   [wConsecutiveStepsCount], a              ;; 04:6FE7 $EA $20 $C1
    ldh  [hLinkSpeedX], a                         ;; 04:6FEA $E0 $9A
    ld   e, $06                                   ;; 04:6FEC $1E $06
    ld   hl, wEntitiesPrivateState5Table          ;; 04:6FEE $21 $90 $C3
    add  hl, bc                                   ;; 04:6FF1 $09
    ld   a, [hl]                                  ;; 04:6FF2 $7E
    and  a                                        ;; 04:6FF3 $A7
    jr   z, .jr_6FF7                              ;; 04:6FF4 $28 $01

    dec  e                                        ;; 04:6FF6 $1D

.jr_6FF7
    ld   hl, wEntitiesPrivateState4Table          ;; 04:6FF7 $21 $40 $C4
    add  hl, bc                                   ;; 04:6FFA $09
    ld   a, [hl]                                  ;; 04:6FFB $7E
    cp   e                                        ;; 04:6FFC $BB
    jr   c, .jr_7004                              ;; 04:6FFD $38 $05

    jp_open_dialog Dialog040                      ;; 04:6FFF

.jr_7004
    ld   a, [wIsMarinFollowingLink]               ;; 04:7004 $FA $73 $DB
    and  a                                        ;; 04:7007 $A7
    jr   z, .jr_700E                              ;; 04:7008 $28 $04

    ld_dialog_low a, Dialog0F7                    ;; 04:700A $3E $F7
    jr   jr_004_701A                              ;; 04:700C $18 $0C

.jr_700E
    ld   hl, wEntitiesPrivateState3Table          ;; 04:700E $21 $D0 $C2
    add  hl, bc                                   ;; 04:7011 $09
    ld   a, [hl]                                  ;; 04:7012 $7E
    and  a                                        ;; 04:7013 $A7
    ld_dialog_low a, Dialog03B                    ;; 04:7014 $3E $3B
    jr   z, jr_004_701A                           ;; 04:7016 $28 $02

    ld_dialog_low a, Dialog03E                    ;; 04:7018 $3E $3E

jr_004_701A:
    call OpenDialogInTable0                       ;; 04:701A $CD $85 $23
    jp   IncrementEntityState                     ;; 04:701D $C3 $12 $3B

func_004_7020::
    ld   a, $02                                   ;; 04:7020 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:7022 $E0 $A1
    ld   a, [wDialogState]                        ;; 04:7024 $FA $9F $C1
    and  a                                        ;; 04:7027 $A7
    jr   nz, ret_004_705C                         ;; 04:7028 $20 $32

    ld   a, [wDialogIndex]                        ;; 04:702A $FA $73 $C1
    cp   $F8                                      ;; 04:702D $FE $F8
    jr   z, .jr_7038                              ;; 04:702F $28 $07

    ld   a, [wDialogAskSelectionIndex]            ;; 04:7031 $FA $77 $C1
    cp   $01                                      ;; 04:7034 $FE $01
    jr   nc, jr_004_704B                          ;; 04:7036 $30 $13

.jr_7038
    ld   a, [wRupeeCountLow]                      ;; 04:7038 $FA $5E $DB
    sub  $10                                      ;; 04:703B $D6 $10
    ld   a, [wRupeeCountHigh]                     ;; 04:703D $FA $5D $DB

func_004_7040::
    sbc  $00                                      ;; 04:7040 $DE $00
    jr   nc, jr_004_705D                          ;; 04:7042 $30 $19

    call_open_dialog Dialog034                    ;; 04:7044
    jr   label_004_7056                           ;; 04:7049 $18 $0B

jr_004_704B:
    ld   a, [wIsMarinFollowingLink]               ;; 04:704B $FA $73 $DB
    and  a                                        ;; 04:704E $A7
    jr   z, label_004_7056                        ;; 04:704F $28 $05

    jp_open_dialog Dialog0F8                      ;; 04:7051

label_004_7056:
    ld   hl, wEntitiesStateTable                  ;; 04:7056 $21 $90 $C2
    add  hl, bc                                   ;; 04:7059 $09
    ld   [hl], $01                                ;; 04:705A $36 $01

ret_004_705C:
    ret                                           ;; 04:705C $C9

jr_004_705D:
    ld   a, [wIsMarinFollowingLink]               ;; 04:705D $FA $73 $DB
    and  a                                        ;; 04:7060 $A7
    jr   z, .jr_7066                              ;; 04:7061 $28 $03

    ld   [wIsMarinInAnimalVillage], a             ;; 04:7063 $EA $74 $DB

.jr_7066
    ld   hl, wEntitiesPrivateState3Table          ;; 04:7066 $21 $D0 $C2
    add  hl, bc                                   ;; 04:7069 $09
    ld   a, [hl]                                  ;; 04:706A $7E
    ld   [hl], $01                                ;; 04:706B $36 $01
    and  a                                        ;; 04:706D $A7
    ld_dialog_low a, Dialog03C                    ;; 04:706E $3E $3C
    jr   z, .jr_7074                              ;; 04:7070 $28 $02

    ld_dialog_low a, Dialog03F                    ;; 04:7072 $3E $3F

.jr_7074
    call OpenDialogInTable0                       ;; 04:7074 $CD $85 $23
    ld   a, TRENDY_GAME_PRICE                     ;; 04:7077 $3E $0A
    ld   [wSubstractRupeeBufferLow], a            ;; 04:7079 $EA $92 $DB
    jp   IncrementEntityState                     ;; 04:707C $C3 $12 $3B

func_004_707F::
    ldh  a, [hFrameCounter]                       ;; 04:707F $F0 $E7
    rra                                           ;; 04:7081 $1F
    rra                                           ;; 04:7082 $1F
    rra                                           ;; 04:7083 $1F
    rra                                           ;; 04:7084 $1F
    and  $01                                      ;; 04:7085 $E6 $01
    ld   [wD200], a                               ;; 04:7087 $EA $00 $D2
    ld   a, $10                                   ;; 04:708A $3E $10
    ld   [wD203], a                               ;; 04:708C $EA $03 $D2
    ldh  a, [hIsGBC]                              ;; 04:708F $F0 $FE
    and  a                                        ;; 04:7091 $A7
    jr   z, .jr_70A2                              ;; 04:7092 $28 $0E

    ldh  a, [hFrameCounter]                       ;; 04:7094 $F0 $E7
    and  $08                                      ;; 04:7096 $E6 $08
    srl  a                                        ;; 04:7098 $CB $3F
    srl  a                                        ;; 04:709A $CB $3F
    srl  a                                        ;; 04:709C $CB $3F
    add  $03                                      ;; 04:709E $C6 $03
    jr   jr_004_70A6                              ;; 04:70A0 $18 $04

.jr_70A2
    ldh  a, [hFrameCounter]                       ;; 04:70A2 $F0 $E7
    and  $10                                      ;; 04:70A4 $E6 $10

jr_004_70A6:
    ld   [wD202], a                               ;; 04:70A6 $EA $02 $D2
    ld   a, [wIsMarinFollowingLink]               ;; 04:70A9 $FA $73 $DB
    and  a                                        ;; 04:70AC $A7
    jr   z, jr_004_70F4                           ;; 04:70AD $28 $45

    call GetEntitySlowTransitionCountdown         ;; 04:70AF $CD $FB $0B
    jr   z, .jr_70B9                              ;; 04:70B2 $28 $05

    dec  a                                        ;; 04:70B4 $3D
    ret  nz                                       ;; 04:70B5 $C0

    jp   label_004_7104                           ;; 04:70B6 $C3 $04 $71

.jr_70B9
    call ReturnIfNonInteractive_04                ;; 04:70B9 $CD $A3 $7F
    push bc                                       ;; 04:70BC $C5
    ld   a, [wMarinEntityIndex]                   ;; 04:70BD $FA $0F $C5
    ld   c, a                                     ;; 04:70C0 $4F
    ldh  a, [hFrameCounter]                       ;; 04:70C1 $F0 $E7
    and  $10                                      ;; 04:70C3 $E6 $10
    ld   a, $04                                   ;; 04:70C5 $3E $04
    jr   z, .jr_70CA                              ;; 04:70C7 $28 $01

    inc  a                                        ;; 04:70C9 $3C

.jr_70CA
    call SetEntitySpriteVariant                   ;; 04:70CA $CD $0C $3B
    ld   hl, wEntitiesSpeedXTable                 ;; 04:70CD $21 $40 $C2
    add  hl, bc                                   ;; 04:70D0 $09
    ld   [hl], $F8                                ;; 04:70D1 $36 $F8
    call AddEntitySpeedToPos_04                   ;; 04:70D3 $CD $D7 $6D
    ld   hl, wEntitiesPosXTable                   ;; 04:70D6 $21 $00 $C2
    add  hl, bc                                   ;; 04:70D9 $09
    pop  bc                                       ;; 04:70DA $C1
    ld   a, [hl]                                  ;; 04:70DB $7E
    cp   $28                                      ;; 04:70DC $FE $28
    ret  nz                                       ;; 04:70DE $C0

    call GetEntitySlowTransitionCountdown         ;; 04:70DF $CD $FB $0B
    ld   [hl], $18                                ;; 04:70E2 $36 $18
    ld   a, [wMarinEntityIndex]                   ;; 04:70E4 $FA $0F $C5
    ld   e, a                                     ;; 04:70E7 $5F
    ld   d, b                                     ;; 04:70E8 $50
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:70E9 $21 $B0 $C3
    add  hl, de                                   ;; 04:70EC $19
    ld   [hl], $02                                ;; 04:70ED $36 $02
    ld   e, $01                                   ;; 04:70EF $1E $01
    jp   func_004_723B                            ;; 04:70F1 $C3 $3B $72

jr_004_70F4:
    ldh  a, [hPressedButtonsMask]                 ;; 04:70F4 $F0 $CB
    and  $20                                      ;; 04:70F6 $E6 $20
    jr   z, ret_004_710B                          ;; 04:70F8 $28 $11

    ldh  a, [hLinkPositionX]                      ;; 04:70FA $F0 $98
    cp   $20                                      ;; 04:70FC $FE $20
    jr   c, ret_004_710B                          ;; 04:70FE $38 $0B

    cp   $30                                      ;; 04:7100 $FE $30
    jr   nc, ret_004_710B                         ;; 04:7102 $30 $07

label_004_7104:
    call IncrementEntityState                     ;; 04:7104 $CD $12 $3B

func_004_7107::
    ld   a, NOISE_SFX_TRENDY_CRANE                ;; 04:7107 $3E $20
    ldh  [hNoiseSfx], a                           ;; 04:7109 $E0 $F4

ret_004_710B:
    ret                                           ;; 04:710B $C9

func_004_710C::
    call func_004_7165                            ;; 04:710C $CD $65 $71
    ld   a, $10                                   ;; 04:710F $3E $10
    ld   [wD203], a                               ;; 04:7111 $EA $03 $D2
    ldh  a, [hIsGBC]                              ;; 04:7114 $F0 $FE
    and  a                                        ;; 04:7116 $A7
    jr   z, .jr_7127                              ;; 04:7117 $28 $0E

    ldh  a, [hFrameCounter]                       ;; 04:7119 $F0 $E7
    and  $08                                      ;; 04:711B $E6 $08
    srl  a                                        ;; 04:711D $CB $3F
    srl  a                                        ;; 04:711F $CB $3F
    srl  a                                        ;; 04:7121 $CB $3F
    add  $03                                      ;; 04:7123 $C6 $03
    jr   jr_004_712B                              ;; 04:7125 $18 $04

.jr_7127
    ldh  a, [hFrameCounter]                       ;; 04:7127 $F0 $E7
    and  $10                                      ;; 04:7129 $E6 $10

jr_004_712B:
    ld   [wD202], a                               ;; 04:712B $EA $02 $D2
    ld   a, [wIsMarinFollowingLink]               ;; 04:712E $FA $73 $DB
    and  a                                        ;; 04:7131 $A7
    jr   z, .jr_713B                              ;; 04:7132 $28 $07

    ld   e, $02                                   ;; 04:7134 $1E $02
    call func_004_723B                            ;; 04:7136 $CD $3B $72
    jr   jr_004_7141                              ;; 04:7139 $18 $06

.jr_713B
    ldh  a, [hPressedButtonsMask]                 ;; 04:713B $F0 $CB
    and  $20                                      ;; 04:713D $E6 $20
    jr   z, jr_004_7152                           ;; 04:713F $28 $11

jr_004_7141:
    ldh  a, [hFrameCounter]                       ;; 04:7141 $F0 $E7
    and  $03                                      ;; 04:7143 $E6 $03
    jr   nz, ret_004_7164                         ;; 04:7145 $20 $1D

    ld   a, [wD204]                               ;; 04:7147 $FA $04 $D2
    inc  a                                        ;; 04:714A $3C
    ld   [wD204], a                               ;; 04:714B $EA $04 $D2
    cp   $88                                      ;; 04:714E $FE $88
    jr   c, ret_004_7164                          ;; 04:7150 $38 $12

jr_004_7152:
    call IncrementEntityState                     ;; 04:7152 $CD $12 $3B
    ld   a, [wIsMarinFollowingLink]               ;; 04:7155 $FA $73 $DB
    and  a                                        ;; 04:7158 $A7
    jr   z, func_004_7160                         ;; 04:7159 $28 $05

    call GetEntitySlowTransitionCountdown         ;; 04:715B $CD $FB $0B
    ld   [hl], $10                                ;; 04:715E $36 $10

func_004_7160::
    ld   a, NOISE_SFX_SILENT                      ;; 04:7160 $3E $21
    ldh  [hNoiseSfx], a                           ;; 04:7162 $E0 $F4

ret_004_7164:
    ret                                           ;; 04:7164 $C9

func_004_7165::
    ldh  a, [hFrameCounter]                       ;; 04:7165 $F0 $E7
    rra                                           ;; 04:7167 $1F
    rra                                           ;; 04:7168 $1F
    rra                                           ;; 04:7169 $1F
    rra                                           ;; 04:716A $1F
    and  $01                                      ;; 04:716B $E6 $01
    ld   [wD200], a                               ;; 04:716D $EA $00 $D2
    ld   a, $01                                   ;; 04:7170 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:7172 $E0 $A1
    ld   a, DIRECTION_UP                          ;; 04:7174 $3E $02
    ldh  [hLinkDirection], a                      ;; 04:7176 $E0 $9E
    ret                                           ;; 04:7178 $C9

func_004_7179::
    call func_004_7165                            ;; 04:7179 $CD $65 $71
    ld   a, $10                                   ;; 04:717C $3E $10
    ld   [wD202], a                               ;; 04:717E $EA $02 $D2
    ldh  a, [hIsGBC]                              ;; 04:7181 $F0 $FE
    and  a                                        ;; 04:7183 $A7
    jr   z, .jr_7194                              ;; 04:7184 $28 $0E

    ldh  a, [hFrameCounter]                       ;; 04:7186 $F0 $E7
    and  $08                                      ;; 04:7188 $E6 $08
    srl  a                                        ;; 04:718A $CB $3F
    srl  a                                        ;; 04:718C $CB $3F
    srl  a                                        ;; 04:718E $CB $3F
    add  $03                                      ;; 04:7190 $C6 $03
    jr   jr_004_7198                              ;; 04:7192 $18 $04

.jr_7194
    ldh  a, [hFrameCounter]                       ;; 04:7194 $F0 $E7
    and  $10                                      ;; 04:7196 $E6 $10

jr_004_7198:
    ld   [wD203], a                               ;; 04:7198 $EA $03 $D2
    call GetEntitySlowTransitionCountdown         ;; 04:719B $CD $FB $0B
    ret  nz                                       ;; 04:719E $C0

    ld   a, [wIsMarinFollowingLink]               ;; 04:719F $FA $73 $DB
    and  a                                        ;; 04:71A2 $A7
    jr   nz, .jr_71AA                             ;; 04:71A3 $20 $05

    ldh  a, [hPressedButtonsMask]                 ;; 04:71A5 $F0 $CB
    and  $10                                      ;; 04:71A7 $E6 $10
    ret  z                                        ;; 04:71A9 $C8

.jr_71AA
    call func_004_7107                            ;; 04:71AA $CD $07 $71
    jp   IncrementEntityState                     ;; 04:71AD $C3 $12 $3B

func_004_71B0::
    call func_004_7165                            ;; 04:71B0 $CD $65 $71
    ld   a, $10                                   ;; 04:71B3 $3E $10
    ld   [wD202], a                               ;; 04:71B5 $EA $02 $D2
    ldh  a, [hIsGBC]                              ;; 04:71B8 $F0 $FE
    and  a                                        ;; 04:71BA $A7
    jr   z, .jr_71CB                              ;; 04:71BB $28 $0E

    ldh  a, [hFrameCounter]                       ;; 04:71BD $F0 $E7
    and  $08                                      ;; 04:71BF $E6 $08
    srl  a                                        ;; 04:71C1 $CB $3F
    srl  a                                        ;; 04:71C3 $CB $3F
    srl  a                                        ;; 04:71C5 $CB $3F
    add  $03                                      ;; 04:71C7 $C6 $03
    jr   jr_004_71CF                              ;; 04:71C9 $18 $04

.jr_71CB
    ldh  a, [hFrameCounter]                       ;; 04:71CB $F0 $E7
    and  $10                                      ;; 04:71CD $E6 $10

jr_004_71CF:
    ld   [wD203], a                               ;; 04:71CF $EA $03 $D2
    ld   a, [wIsMarinFollowingLink]               ;; 04:71D2 $FA $73 $DB
    and  a                                        ;; 04:71D5 $A7
    jr   z, .jr_71DA                              ;; 04:71D6 $28 $02

    jr   jr_004_71E0                              ;; 04:71D8 $18 $06

.jr_71DA
    ldh  a, [hPressedButtonsMask]                 ;; 04:71DA $F0 $CB
    and  $10                                      ;; 04:71DC $E6 $10
    jr   z, jr_004_71EF                           ;; 04:71DE $28 $0F

jr_004_71E0:
    ldh  a, [hFrameCounter]                       ;; 04:71E0 $F0 $E7
    and  $03                                      ;; 04:71E2 $E6 $03
    ret  nz                                       ;; 04:71E4 $C0

    ld   a, [wD205]                               ;; 04:71E5 $FA $05 $D2
    inc  a                                        ;; 04:71E8 $3C
    ld   [wD205], a                               ;; 04:71E9 $EA $05 $D2
    cp   $55                                      ;; 04:71EC $FE $55
    ret  c                                        ;; 04:71EE $D8

jr_004_71EF:
    call IncrementEntityState                     ;; 04:71EF $CD $12 $3B
    call func_004_7160                            ;; 04:71F2 $CD $60 $71
    call GetEntityTransitionCountdown             ;; 04:71F5 $CD $05 $0C
    ld   [hl], $60                                ;; 04:71F8 $36 $60
    ld   e, $00                                   ;; 04:71FA $1E $00
    jp   func_004_723B                            ;; 04:71FC $C3 $3B $72

func_004_71FF::
    ldh  a, [hFrameCounter]                       ;; 04:71FF $F0 $E7
    rra                                           ;; 04:7201 $1F
    rra                                           ;; 04:7202 $1F
    rra                                           ;; 04:7203 $1F
    and  $01                                      ;; 04:7204 $E6 $01
    ld   [wD200], a                               ;; 04:7206 $EA $00 $D2
    ld   a, $10                                   ;; 04:7209 $3E $10
    ld   [wD202], a                               ;; 04:720B $EA $02 $D2
    ld   [wD203], a                               ;; 04:720E $EA $03 $D2
    call GetEntityTransitionCountdown             ;; 04:7211 $CD $05 $0C
    cp   $30                                      ;; 04:7214 $FE $30
    jr   nc, .jr_721D                             ;; 04:7216 $30 $05

    ld   hl, wD201                                ;; 04:7218 $21 $01 $D2
    ld   [hl], $02                                ;; 04:721B $36 $02

.jr_721D
    and  a                                        ;; 04:721D $A7
    jr   nz, ret_004_7248                         ;; 04:721E $20 $28

    ldh  a, [hFrameCounter]                       ;; 04:7220 $F0 $E7
    and  $03                                      ;; 04:7222 $E6 $03
    jr   nz, ret_004_7248                         ;; 04:7224 $20 $22

    ld   a, [wD206]                               ;; 04:7226 $FA $06 $D2
    inc  a                                        ;; 04:7229 $3C
    ld   [wD206], a                               ;; 04:722A $EA $06 $D2
    cp   $0F                                      ;; 04:722D $FE $0F
    jr   nz, ret_004_7248                         ;; 04:722F $20 $17

    call GetEntityTransitionCountdown             ;; 04:7231 $CD $05 $0C
    ld   [hl], $FF                                ;; 04:7234 $36 $FF
    call IncrementEntityState                     ;; 04:7236 $CD $12 $3B
    ld   e, $00                                   ;; 04:7239 $1E $00

func_004_723B::
    ld   a, [wIsMarinFollowingLink]               ;; 04:723B $FA $73 $DB
    and  a                                        ;; 04:723E $A7
    ret  z                                        ;; 04:723F $C8

    ld   a, e                                     ;; 04:7240 $7B
    ldh  [hLinkDirection], a                      ;; 04:7241 $E0 $9E
    push bc                                       ;; 04:7243 $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 04:7244 $CD $F0 $0B
    pop  bc                                       ;; 04:7247 $C1

ret_004_7248:
    ret                                           ;; 04:7248 $C9

func_004_7249::
    ldh  a, [hFrameCounter]                       ;; 04:7249 $F0 $E7
    rra                                           ;; 04:724B $1F
    rra                                           ;; 04:724C $1F
    rra                                           ;; 04:724D $1F
    and  $01                                      ;; 04:724E $E6 $01
    ld   [wD200], a                               ;; 04:7250 $EA $00 $D2
    call GetEntityTransitionCountdown             ;; 04:7253 $CD $05 $0C
    cp   $C8                                      ;; 04:7256 $FE $C8
    jr   nz, .jr_725F                             ;; 04:7258 $20 $05

    ld   hl, wD206                                ;; 04:725A $21 $06 $D2
    ld   [hl], $10                                ;; 04:725D $36 $10

.jr_725F
    cp   $A0                                      ;; 04:725F $FE $A0
    jr   nz, .jr_7268                             ;; 04:7261 $20 $05

    ld   hl, wD201                                ;; 04:7263 $21 $01 $D2
    ld   [hl], $03                                ;; 04:7266 $36 $03

.jr_7268
    cp   $50                                      ;; 04:7268 $FE $50
    jr   nz, .jr_7274                             ;; 04:726A $20 $08

    ld   hl, wD201                                ;; 04:726C $21 $01 $D2
    ld   [hl], $04                                ;; 04:726F $36 $04
    jp   label_004_7332                           ;; 04:7271 $C3 $32 $73

.jr_7274
    and  a                                        ;; 04:7274 $A7
    ret  nz                                       ;; 04:7275 $C0

    call IncrementEntityState                     ;; 04:7276 $CD $12 $3B
    jp   func_004_7107                            ;; 04:7279 $C3 $07 $71

func_004_727C::
    ldh  a, [hFrameCounter]                       ;; 04:727C $F0 $E7
    rra                                           ;; 04:727E $1F
    rra                                           ;; 04:727F $1F
    rra                                           ;; 04:7280 $1F
    and  $01                                      ;; 04:7281 $E6 $01
    ld   [wD200], a                               ;; 04:7283 $EA $00 $D2
    ldh  a, [hFrameCounter]                       ;; 04:7286 $F0 $E7
    and  $03                                      ;; 04:7288 $E6 $03
    ret  nz                                       ;; 04:728A $C0

    ld   a, [wD206]                               ;; 04:728B $FA $06 $D2
    dec  a                                        ;; 04:728E $3D
    ld   [wD206], a                               ;; 04:728F $EA $06 $D2
    ret  nz                                       ;; 04:7292 $C0

    jp   IncrementEntityState                     ;; 04:7293 $C3 $12 $3B

func_004_7296::
    ldh  a, [hFrameCounter]                       ;; 04:7296 $F0 $E7
    rra                                           ;; 04:7298 $1F
    rra                                           ;; 04:7299 $1F
    rra                                           ;; 04:729A $1F
    and  $01                                      ;; 04:729B $E6 $01
    ld   [wD200], a                               ;; 04:729D $EA $00 $D2
    ldh  a, [hLinkPositionX]                      ;; 04:72A0 $F0 $98
    push af                                       ;; 04:72A2 $F5
    ldh  a, [hLinkPositionY]                      ;; 04:72A3 $F0 $99
    push af                                       ;; 04:72A5 $F5
    ld   a, $16                                   ;; 04:72A6 $3E $16
    ldh  [hLinkPositionY], a                      ;; 04:72A8 $E0 $99
    ld   a, $18                                   ;; 04:72AA $3E $18
    ldh  [hLinkPositionX], a                      ;; 04:72AC $E0 $98
    ld   a, [wD204]                               ;; 04:72AE $FA $04 $D2
    ld   [wEntitiesPosXTable + $01], a            ;; 04:72B1 $EA $01 $C2
    ld   a, [wD205]                               ;; 04:72B4 $FA $05 $D2
    ld   [wEntitiesPosYTable+1], a                ;; 04:72B7 $EA $11 $C2
    push bc                                       ;; 04:72BA $C5
    ld   c, $01                                   ;; 04:72BB $0E $01
    ld   a, $04                                   ;; 04:72BD $3E $04
    call ApplyVectorTowardsLink_trampoline        ;; 04:72BF $CD $AA $3B
    call UpdateEntityPosWithSpeed_04              ;; 04:72C2 $CD $CA $6D
    ld   a, [wEntitiesPosXTable + $01]            ;; 04:72C5 $FA $01 $C2
    ld   [wD204], a                               ;; 04:72C8 $EA $04 $D2
    ld   a, [wEntitiesPosYTable+1]                ;; 04:72CB $FA $11 $C2
    ld   [wD205], a                               ;; 04:72CE $EA $05 $D2
    pop  bc                                       ;; 04:72D1 $C1
    pop  af                                       ;; 04:72D2 $F1
    ldh  [hLinkPositionY], a                      ;; 04:72D3 $E0 $99
    pop  af                                       ;; 04:72D5 $F1
    ldh  [hLinkPositionX], a                      ;; 04:72D6 $E0 $98
    ld   a, [wD204]                               ;; 04:72D8 $FA $04 $D2
    cp   $18                                      ;; 04:72DB $FE $18
    ret  nz                                       ;; 04:72DD $C0

    ld   a, [wD205]                               ;; 04:72DE $FA $05 $D2
    cp   $16                                      ;; 04:72E1 $FE $16
    ret  nz                                       ;; 04:72E3 $C0

    call GetEntityTransitionCountdown             ;; 04:72E4 $CD $05 $0C
    ld   [hl], $C0                                ;; 04:72E7 $36 $C0
    call IncrementEntityState                     ;; 04:72E9 $CD $12 $3B
    jp   func_004_7160                            ;; 04:72EC $C3 $60 $71

func_004_72EF::
    ldh  a, [hFrameCounter]                       ;; 04:72EF $F0 $E7
    rra                                           ;; 04:72F1 $1F
    rra                                           ;; 04:72F2 $1F
    rra                                           ;; 04:72F3 $1F
    and  $01                                      ;; 04:72F4 $E6 $01
    ld   [wD200], a                               ;; 04:72F6 $EA $00 $D2
    call GetEntityTransitionCountdown             ;; 04:72F9 $CD $05 $0C
    cp   $60                                      ;; 04:72FC $FE $60
    jr   nz, jr_004_7325                          ;; 04:72FE $20 $25

    ld   hl, wD201                                ;; 04:7300 $21 $01 $D2
    ld   [hl], $02                                ;; 04:7303 $36 $02
    ld   hl, wEntitiesPrivateState2Table          ;; 04:7305 $21 $C0 $C2
    add  hl, bc                                   ;; 04:7308 $09
    ld   a, [hl]                                  ;; 04:7309 $7E
    and  a                                        ;; 04:730A $A7
    jr   z, .ret_7324                             ;; 04:730B $28 $17

    ld   [hl], $00                                ;; 04:730D $36 $00
    dec  a                                        ;; 04:730F $3D
    ld   e, a                                     ;; 04:7310 $5F
    ld   d, b                                     ;; 04:7311 $50
    ld   hl, wEntitiesStateTable                  ;; 04:7312 $21 $90 $C2
    add  hl, de                                   ;; 04:7315 $19
    ld   [hl], $02                                ;; 04:7316 $36 $02
    ld   a, [wIsMarinFollowingLink]               ;; 04:7318 $FA $73 $DB
    and  a                                        ;; 04:731B $A7
    jr   z, .ret_7324                             ;; 04:731C $28 $06

    ld   hl, wEntitiesSpriteVariantTable          ;; 04:731E $21 $B0 $C3
    add  hl, de                                   ;; 04:7321 $19
    ld   [hl], $07                                ;; 04:7322 $36 $07

.ret_7324
    ret                                           ;; 04:7324 $C9

jr_004_7325:
    and  a                                        ;; 04:7325 $A7
    ret  nz                                       ;; 04:7326 $C0

    ld   hl, wD201                                ;; 04:7327 $21 $01 $D2
    ld   [hl], $04                                ;; 04:732A $36 $04
    jp   IncrementEntityState                     ;; 04:732C $C3 $12 $3B

func_004_732F::
    jp   label_004_7056                           ;; 04:732F $C3 $56 $70

label_004_7332:
    ld   a, [wIsMarinFollowingLink]               ;; 04:7332 $FA $73 $DB
    and  a                                        ;; 04:7335 $A7
    jr   z, .jr_735F                              ;; 04:7336 $28 $27

    ld   a, $FF                                   ;; 04:7338 $3E $FF
    call SetEntitySpriteVariant                   ;; 04:733A $CD $0C $3B
    ld   a, ENTITY_TRENDY_GAME_OWNER              ;; 04:733D $3E $4F
    call SpawnNewEntity_trampoline                ;; 04:733F $CD $86 $3B
    ld   a, [wD204]                               ;; 04:7342 $FA $04 $D2
    ld   hl, wEntitiesPosXTable                   ;; 04:7345 $21 $00 $C2
    add  hl, de                                   ;; 04:7348 $19
    ld   [hl], a                                  ;; 04:7349 $77
    ld   a, [wD205]                               ;; 04:734A $FA $05 $D2
    add  $18                                      ;; 04:734D $C6 $18
    ld   hl, wEntitiesPosYTable                   ;; 04:734F $21 $10 $C2
    add  hl, de                                   ;; 04:7352 $19
    ld   [hl], a                                  ;; 04:7353 $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:7354 $21 $B0 $C3
    add  hl, de                                   ;; 04:7357 $19
    ld   [hl], $06                                ;; 04:7358 $36 $06
    ld   hl, wEntitiesPrivateState1Table          ;; 04:735A $21 $B0 $C2
    add  hl, de                                   ;; 04:735D $19
    inc  [hl]                                     ;; 04:735E $34

.jr_735F
    ld   e, $0F                                   ;; 04:735F $1E $0F
    ld   d, b                                     ;; 04:7361 $50

jr_004_7362:
    ld   hl, wEntitiesStatusTable                 ;; 04:7362 $21 $80 $C2
    add  hl, de                                   ;; 04:7365 $19
    ld   a, [hl]                                  ;; 04:7366 $7E
    and  a                                        ;; 04:7367 $A7
    jr   z, .jr_73B0                              ;; 04:7368 $28 $46

    ld   hl, wEntitiesStateTable                  ;; 04:736A $21 $90 $C2
    add  hl, de                                   ;; 04:736D $19
    ld   a, [hl]                                  ;; 04:736E $7E
    and  a                                        ;; 04:736F $A7
    jr   nz, .jr_73B0                             ;; 04:7370 $20 $3E

    ld   hl, wEntitiesTypeTable                   ;; 04:7372 $21 $A0 $C3
    add  hl, de                                   ;; 04:7375 $19
    ld   a, [hl]                                  ;; 04:7376 $7E
    cp   $4F                                      ;; 04:7377 $FE $4F
    jr   nz, .jr_73B0                             ;; 04:7379 $20 $35

    ld   hl, wEntitiesPosXTable                   ;; 04:737B $21 $00 $C2
    add  hl, de                                   ;; 04:737E $19
    ld   a, [wD204]                               ;; 04:737F $FA $04 $D2
    sub  [hl]                                     ;; 04:7382 $96
    add  $04                                      ;; 04:7383 $C6 $04
    cp   $08                                      ;; 04:7385 $FE $08
    jr   nc, .jr_73B0                             ;; 04:7387 $30 $27

    ld   hl, wEntitiesPosYTable                   ;; 04:7389 $21 $10 $C2
    add  hl, de                                   ;; 04:738C $19
    ld   a, [wD205]                               ;; 04:738D $FA $05 $D2
    add  $18                                      ;; 04:7390 $C6 $18
    sub  [hl]                                     ;; 04:7392 $96
    add  $06                                      ;; 04:7393 $C6 $06
    cp   $0C                                      ;; 04:7395 $FE $0C
    jr   nc, .jr_73B0                             ;; 04:7397 $30 $17

    ld   hl, wEntitiesStateTable                  ;; 04:7399 $21 $90 $C2
    add  hl, de                                   ;; 04:739C $19
    ld   [hl], $01                                ;; 04:739D $36 $01
    ld   a, e                                     ;; 04:739F $7B
    inc  a                                        ;; 04:73A0 $3C
    ld   hl, wEntitiesPrivateState2Table          ;; 04:73A1 $21 $C0 $C2
    add  hl, bc                                   ;; 04:73A4 $09
    ld   [hl], a                                  ;; 04:73A5 $77
    call GetEntityPrivateCountdown1               ;; 04:73A6 $CD $00 $0C
    ld   [hl], $10                                ;; 04:73A9 $36 $10
    ld   hl, wEntitiesPrivateState4Table          ;; 04:73AB $21 $40 $C4
    inc  [hl]                                     ;; 04:73AE $34
    ret                                           ;; 04:73AF $C9

.jr_73B0
    dec  e                                        ;; 04:73B0 $1D
    ld   a, e                                     ;; 04:73B1 $7B
    cp   $FF                                      ;; 04:73B2 $FE $FF
    jr   nz, jr_004_7362                          ;; 04:73B4 $20 $AC

    ret                                           ;; 04:73B6 $C9

func_004_73B7::
    ld   hl, wEntitiesPrivateState2Table          ;; 04:73B7 $21 $C0 $C2
    add  hl, bc                                   ;; 04:73BA $09
    ld   a, [hl]                                  ;; 04:73BB $7E
    and  a                                        ;; 04:73BC $A7
    jr   z, .ret_73E1                             ;; 04:73BD $28 $22

    dec  a                                        ;; 04:73BF $3D
    ld   e, a                                     ;; 04:73C0 $5F
    ld   d, b                                     ;; 04:73C1 $50
    ld   a, [wD204]                               ;; 04:73C2 $FA $04 $D2
    ld   hl, wEntitiesPosXTable                   ;; 04:73C5 $21 $00 $C2
    add  hl, de                                   ;; 04:73C8 $19
    ld   [hl], a                                  ;; 04:73C9 $77
    ld   a, [wD205]                               ;; 04:73CA $FA $05 $D2
    add  $18                                      ;; 04:73CD $C6 $18
    ld   hl, wEntitiesPosYTable                   ;; 04:73CF $21 $10 $C2
    add  hl, de                                   ;; 04:73D2 $19
    ld   [hl], a                                  ;; 04:73D3 $77
    ld   a, $10                                   ;; 04:73D4 $3E $10
    ld   hl, wD206                                ;; 04:73D6 $21 $06 $D2
    sub  [hl]                                     ;; 04:73D9 $96
    add  $FE                                      ;; 04:73DA $C6 $FE
    ld   hl, wEntitiesPosZTable                   ;; 04:73DC $21 $10 $C3
    add  hl, de                                   ;; 04:73DF $19
    ld   [hl], a                                  ;; 04:73E0 $77

.ret_73E1
    ret                                           ;; 04:73E1 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown093SpriteVariants::
.variant0
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown094SpriteVariants::
    db $26, OAM_GBC_PAL_0 | OAMF_PAL0
    db $26, OAM_GBC_PAL_0 | OAMF_PAL0

func_004_73FE::
    ld   a, [wD204]                               ;; 04:73FE $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ;; 04:7401 $E0 $EE
    ld   a, [wD205]                               ;; 04:7403 $FA $05 $D2
    ld   hl, wD206                                ;; 04:7406 $21 $06 $D2
    add  [hl]                                     ;; 04:7409 $86
    add  $08                                      ;; 04:740A $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ;; 04:740C $E0 $EC
    ld   a, [wD201]                               ;; 04:740E $FA $01 $D2
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:7411 $E0 $F1
    ld   de, Unknown093SpriteVariants             ;; 04:7413 $11 $E2 $73
    call RenderActiveEntitySpritesPair            ;; 04:7416 $CD $C0 $3B
    ld   a, [wD204]                               ;; 04:7419 $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ;; 04:741C $E0 $EE
    ld   a, [wD205]                               ;; 04:741E $FA $05 $D2
    ldh  [hActiveEntityVisualPosY], a             ;; 04:7421 $E0 $EC
    ld   a, [wD200]                               ;; 04:7423 $FA $00 $D2
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:7426 $E0 $F1
    ld   de, Unknown093SpriteVariants             ;; 04:7428 $11 $E2 $73
    call RenderActiveEntitySpritesPair            ;; 04:742B $CD $C0 $3B
    ld   a, [wD206]                               ;; 04:742E $FA $06 $D2
    cp   $08                                      ;; 04:7431 $FE $08
    jr   c, .jr_744B                              ;; 04:7433 $38 $16

    ld   a, [wD204]                               ;; 04:7435 $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ;; 04:7438 $E0 $EE
    ld   a, [wD205]                               ;; 04:743A $FA $05 $D2
    add  $10                                      ;; 04:743D $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 04:743F $E0 $EC
    ld   a, $05                                   ;; 04:7441 $3E $05
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:7443 $E0 $F1
    ld   de, Unknown093SpriteVariants             ;; 04:7445 $11 $E2 $73
    call RenderActiveEntitySpritesPair            ;; 04:7448 $CD $C0 $3B

.jr_744B
    ldh  a, [hFrameCounter]                       ;; 04:744B $F0 $E7
    and  $01                                      ;; 04:744D $E6 $01
    jr   nz, .jr_7477                             ;; 04:744F $20 $26

    ld   a, [wD204]                               ;; 04:7451 $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ;; 04:7454 $E0 $EE
    ld   a, [wD205]                               ;; 04:7456 $FA $05 $D2
    add  $20                                      ;; 04:7459 $C6 $20
    ldh  [hActiveEntityVisualPosY], a             ;; 04:745B $E0 $EC
    xor  a                                        ;; 04:745D $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:745E $E0 $F1
    ld   de, Unknown094SpriteVariants             ;; 04:7460 $11 $FA $73
    ld   a, [wOAMNextAvailableSlot]               ;; 04:7463 $FA $C0 $C3
    push af                                       ;; 04:7466 $F5
    call RenderActiveEntitySpritesPair            ;; 04:7467 $CD $C0 $3B
    pop  af                                       ;; 04:746A $F1
    ld   e, a                                     ;; 04:746B $5F
    ld   d, b                                     ;; 04:746C $50
    ld   hl, wDynamicOAMBuffer+1                  ;; 04:746D $21 $31 $C0
    add  hl, de                                   ;; 04:7470 $19
    inc  [hl]                                     ;; 04:7471 $34
    inc  hl                                       ;; 04:7472 $23
    inc  hl                                       ;; 04:7473 $23
    inc  hl                                       ;; 04:7474 $23
    inc  hl                                       ;; 04:7475 $23
    dec  [hl]                                     ;; 04:7476 $35

.jr_7477
    ld   hl, wOAMBuffer+$20                       ;; 04:7477 $21 $20 $C0
    ld   a, $50                                   ;; 04:747A $3E $50
    ld   [hl+], a                                 ;; 04:747C $22
    ld   a, $28                                   ;; 04:747D $3E $28
    ld   [hl+], a                                 ;; 04:747F $22
    ld   a, $7A                                   ;; 04:7480 $3E $7A
    ld   [hl+], a                                 ;; 04:7482 $22
    ldh  a, [hIsGBC]                              ;; 04:7483 $F0 $FE
    and  a                                        ;; 04:7485 $A7
    jr   z, .jr_748C                              ;; 04:7486 $28 $04

    ld   a, $03                                   ;; 04:7488 $3E $03
    jr   jr_004_748F                              ;; 04:748A $18 $03

.jr_748C
    ld   a, [wD202]                               ;; 04:748C $FA $02 $D2

jr_004_748F:
    ld   [hl+], a                                 ;; 04:748F $22
    ld   a, $60                                   ;; 04:7490 $3E $60
    ld   [hl+], a                                 ;; 04:7492 $22
    ld   a, $28                                   ;; 04:7493 $3E $28
    ld   [hl+], a                                 ;; 04:7495 $22
    ld   a, $3E                                   ;; 04:7496 $3E $3E
    ld   [hl+], a                                 ;; 04:7498 $22
    ld   a, [wD202]                               ;; 04:7499 $FA $02 $D2
    ld   [hl+], a                                 ;; 04:749C $22
    ld   a, $50                                   ;; 04:749D $3E $50
    ld   [hl+], a                                 ;; 04:749F $22
    ld   a, $30                                   ;; 04:74A0 $3E $30
    ld   [hl+], a                                 ;; 04:74A2 $22
    ld   a, $7C                                   ;; 04:74A3 $3E $7C
    ld   [hl+], a                                 ;; 04:74A5 $22
    ldh  a, [hIsGBC]                              ;; 04:74A6 $F0 $FE
    and  a                                        ;; 04:74A8 $A7
    jr   z, .jr_74AF                              ;; 04:74A9 $28 $04

    ld   a, $03                                   ;; 04:74AB $3E $03
    jr   jr_004_74B2                              ;; 04:74AD $18 $03

.jr_74AF
    ld   a, [wD203]                               ;; 04:74AF $FA $03 $D2

jr_004_74B2:
    ld   [hl+], a                                 ;; 04:74B2 $22
    ld   a, $60                                   ;; 04:74B3 $3E $60
    ld   [hl+], a                                 ;; 04:74B5 $22
    ld   a, $30                                   ;; 04:74B6 $3E $30
    ld   [hl+], a                                 ;; 04:74B8 $22

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown097SpriteVariants::
.variant0
    db $3E, OAM_GBC_PAL_6 | OAMF_PAL1 | OAMF_BANK1 | OAMF_XFLIP
    db $22, OAM_GBC_PAL_2 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown096SpriteVariants::
.variant0
    db $03, OAM_GBC_PAL_2 | OAMF_PAL1 | OAMF_BANK0 | OAMF_YFLIP | OAMF_PRI
    db $22, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_BANK1 | OAMF_YFLIP | OAMF_PRI

Data_004_74C1::
    db   $FF, $FF, $9E, $10, $A6, $14, $8E, $16, $86, $15, $A8, $14

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown095SpriteVariants::
.variant0
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant1
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_3 | OAMF_PAL0
.variant2
    db $6E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

label_004_74D9:
    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:74D9 $F0 $F1
    cp   $06                                      ;; 04:74DB $FE $06
    jr   c, .jr_004_74F1                          ;; 04:74DD $38 $12

    ld   de, Unknown097SpriteVariants             ;; 04:74DF $11 $B9 $74
    cp   $07                                      ;; 04:74E2 $FE $07
    jr   z, .to_render                            ;; 04:74E4 $28 $09

    ldh  a, [hFrameCounter]                       ;; 04:74E6 $F0 $E7
    and  $10                                      ;; 04:74E8 $E6 $10
    jr   nz, .to_render                           ;; 04:74EA $20 $03

    ld   de, Unknown096SpriteVariants             ;; 04:74EC $11 $BD $74

.to_render:
    jr   .render                                  ;; 04:74EF $18 $1B

.jr_004_74F1
    cp   $03                                      ;; 04:74F1 $FE $03
    jr   nz, .jr_004_74FE                         ;; 04:74F3 $20 $09

    ld   a, [wHasToadstool]                       ;; 04:74F5 $FA $4B $DB
    and  a                                        ;; 04:74F8 $A7
    jp   nz, ClearEntityStatusBank04              ;; 04:74F9 $C2 $7A $6D

    jr   jr_004_7511                              ;; 04:74FC $18 $13

.jr_004_74FE
    cp   $00                                      ;; 04:74FE $FE $00
    jr   nz, jr_004_7511                          ;; 04:7500 $20 $0F

    ld   a, [wTradeSequenceItem]                  ;; 04:7502 $FA $0E $DB
    and  a                                        ;; 04:7505 $A7
    jp   nz, ClearEntityStatusBank04              ;; 04:7506 $C2 $7A $6D

    ld   de, Unknown095SpriteVariants             ;; 04:7509 $11 $CD $74

.render:
    call RenderActiveEntitySpritesPair            ;; 04:750C $CD $C0 $3B
    jr   jr_004_7517                              ;; 04:750F $18 $06

jr_004_7511:
    ld   de, Data_004_74C1                        ;; 04:7511 $11 $C1 $74
    call RenderActiveEntitySprite                 ;; 04:7514 $CD $77 $3C

jr_004_7517:
    call ReturnIfNonInteractive_04                ;; 04:7517 $CD $A3 $7F
    ldh  a, [hActiveEntityState]                  ;; 04:751A $F0 $F0
    JP_TABLE                                      ;; 04:751C
._00 dw func_004_7529                             ;; 04:751D
._01 dw func_004_755C                             ;; 04:751F
._02 dw func_004_7566                             ;; 04:7521
._03 dw func_004_75BC                             ;; 04:7523
._04 dw func_004_7681                             ;; 04:7525
._05 dw func_004_7698                             ;; 04:7527

func_004_7529::
    call UpdateEntityPosWithSpeed_04              ;; 04:7529 $CD $CA $6D
    ld   hl, wEntitiesDirectionTable              ;; 04:752C $21 $80 $C3
    add  hl, bc                                   ;; 04:752F $09
    ld   a, [hl]                                  ;; 04:7530 $7E
    JP_TABLE                                      ;; 04:7531
._00 dw func_004_753C                             ;; 04:7532
._01 dw func_004_7544                             ;; 04:7534
._02 dw func_004_754C                             ;; 04:7536
._03 dw func_004_7554                             ;; 04:7538
._04 dw func_004_7543                             ;; 04:753A

func_004_753C::
    ldh  a, [hActiveEntityPosX]                   ;; 04:753C $F0 $EE
    cp   $3A                                      ;; 04:753E $FE $3A
    jp   c, label_004_76AA                        ;; 04:7540 $DA $AA $76

func_004_7543::
    ret                                           ;; 04:7543 $C9

func_004_7544::
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:7544 $F0 $EC
    cp   $4E                                      ;; 04:7546 $FE $4E
    jp   nc, label_004_76AA                       ;; 04:7548 $D2 $AA $76

    ret                                           ;; 04:754B $C9

func_004_754C::
    ldh  a, [hActiveEntityPosX]                   ;; 04:754C $F0 $EE
    cp   $78                                      ;; 04:754E $FE $78
    jp   nc, label_004_76AA                       ;; 04:7550 $D2 $AA $76

    ret                                           ;; 04:7553 $C9

func_004_7554::
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:7554 $F0 $EC
    cp   $2E                                      ;; 04:7556 $FE $2E
    jp   c, label_004_76AA                        ;; 04:7558 $DA $AA $76

    ret                                           ;; 04:755B $C9

func_004_755C::
    call GetEntityDirectionToLink_04              ;; 04:755C $CD $55 $6E
    ld   a, e                                     ;; 04:755F $7B
    xor  $01                                      ;; 04:7560 $EE $01
    ld   e, a                                     ;; 04:7562 $5F
    jp   func_004_723B                            ;; 04:7563 $C3 $3B $72

func_004_7566::
    ld   a, [wIsMarinFollowingLink]               ;; 04:7566 $FA $73 $DB
    and  a                                        ;; 04:7569 $A7
    jr   z, .jr_7570                              ;; 04:756A $28 $04

    ld   a, $02                                   ;; 04:756C $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:756E $E0 $A1

.jr_7570
    call AddEntityZSpeedToPos_04                  ;; 04:7570 $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:7573 $21 $20 $C3
    add  hl, bc                                   ;; 04:7576 $09
    dec  [hl]                                     ;; 04:7577 $35
    dec  [hl]                                     ;; 04:7578 $35
    ld   hl, wEntitiesPosZTable                   ;; 04:7579 $21 $10 $C3
    add  hl, bc                                   ;; 04:757C $09
    ld   a, [hl]                                  ;; 04:757D $7E
    and  $80                                      ;; 04:757E $E6 $80
    jr   z, jr_004_7598                           ;; 04:7580 $28 $16

    xor  a                                        ;; 04:7582 $AF
    ld   [hl], a                                  ;; 04:7583 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 04:7584 $21 $20 $C3
    add  hl, bc                                   ;; 04:7587 $09
    ld   a, [hl]                                  ;; 04:7588 $7E
    sra  a                                        ;; 04:7589 $CB $2F
    cpl                                           ;; 04:758B $2F
    ld   [hl], a                                  ;; 04:758C $77
    cp   $07                                      ;; 04:758D $FE $07
    jr   nc, .jr_7594                             ;; 04:758F $30 $03

    ld   [hl], b                                  ;; 04:7591 $70
    jr   jr_004_7598                              ;; 04:7592 $18 $04

.jr_7594
    ld   a, JINGLE_BUMP                           ;; 04:7594 $3E $09
    ldh  [hJingle], a                             ;; 04:7596 $E0 $F2

jr_004_7598:
    ldh  a, [hFrameCounter]                       ;; 04:7598 $F0 $E7
    and  $03                                      ;; 04:759A $E6 $03
    jr   nz, .ret_75A9                            ;; 04:759C $20 $0B

    ld   hl, wEntitiesPosYTable                   ;; 04:759E $21 $10 $C2
    add  hl, bc                                   ;; 04:75A1 $09
    ld   a, [hl]                                  ;; 04:75A2 $7E
    cp   $56                                      ;; 04:75A3 $FE $56
    jr   z, jr_004_75AA                           ;; 04:75A5 $28 $03

    inc  a                                        ;; 04:75A7 $3C
    ld   [hl], a                                  ;; 04:75A8 $77

.ret_75A9
    ret                                           ;; 04:75A9 $C9

jr_004_75AA:
    add  $0A                                      ;; 04:75AA $C6 $0A
    ld   [hl], a                                  ;; 04:75AC $77
    ld   hl, wEntitiesPosZTable                   ;; 04:75AD $21 $10 $C3
    add  hl, bc                                   ;; 04:75B0 $09
    ld   [hl], $0A                                ;; 04:75B1 $36 $0A
    jp   IncrementEntityState                     ;; 04:75B3 $C3 $12 $3B

TrendyPrizeDialogs::
._0 db_dialog_low Dialog044 ; Yoshi
._1 db_dialog_low Dialog043 ; unused
._2 db_dialog_low Dialog042 ; 30 Rupees
._3 db_dialog_low Dialog041 ; Magic Powder
._4 db_dialog_low Dialog03D ; Shield
._5 db_dialog_low Dialog02A ; 1 Heart

func_004_75BC::
    ld   a, [wIsMarinFollowingLink]               ;; 04:75BC $FA $73 $DB
    and  a                                        ;; 04:75BF $A7
    jr   z, .jr_75C6                              ;; 04:75C0 $28 $04

    ld   a, $02                                   ;; 04:75C2 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:75C4 $E0 $A1

.jr_75C6
    call AddEntityZSpeedToPos_04                  ;; 04:75C6 $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:75C9 $21 $20 $C3
    add  hl, bc                                   ;; 04:75CC $09
    dec  [hl]                                     ;; 04:75CD $35
    dec  [hl]                                     ;; 04:75CE $35
    ld   hl, wEntitiesPosZTable                   ;; 04:75CF $21 $10 $C3
    add  hl, bc                                   ;; 04:75D2 $09
    ld   a, [hl]                                  ;; 04:75D3 $7E
    and  $80                                      ;; 04:75D4 $E6 $80
    jp   z, label_004_7680                        ;; 04:75D6 $CA $80 $76

    xor  a                                        ;; 04:75D9 $AF
    ld   [hl], a                                  ;; 04:75DA $77
    ld   hl, wEntitiesSpeedZTable                 ;; 04:75DB $21 $20 $C3
    add  hl, bc                                   ;; 04:75DE $09
    ld   a, [hl]                                  ;; 04:75DF $7E
    sra  a                                        ;; 04:75E0 $CB $2F
    cpl                                           ;; 04:75E2 $2F
    ld   [hl], a                                  ;; 04:75E3 $77
    cp   $07                                      ;; 04:75E4 $FE $07
    jr   nc, .jr_75EA                             ;; 04:75E6 $30 $02

    xor  a                                        ;; 04:75E8 $AF
    ld   [hl], a                                  ;; 04:75E9 $77

.jr_75EA
    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:75EA $F0 $F1
    cp   $06                                      ;; 04:75EC $FE $06
    jr   c, .jr_75F8                              ;; 04:75EE $38 $08

    call_open_dialog Dialog0F9                    ;; 04:75F0
    jp   IncrementEntityState                     ;; 04:75F5 $C3 $12 $3B

.jr_75F8
    ldh  a, [hActiveEntityPosX]                   ;; 04:75F8 $F0 $EE
    ld   hl, hLinkPositionX                       ;; 04:75FA $21 $98 $FF
    sub  [hl]                                     ;; 04:75FD $96
    add  $07                                      ;; 04:75FE $C6 $07
    cp   $0E                                      ;; 04:7600 $FE $0E
    ret  nc                                       ;; 04:7602 $D0

    ldh  a, [hActiveEntityVisualPosY]             ;; 04:7603 $F0 $EC
    ld   hl, hLinkPositionY                       ;; 04:7605 $21 $99 $FF
    sub  [hl]                                     ;; 04:7608 $96
    add  $05                                      ;; 04:7609 $C6 $05
    cp   $0A                                      ;; 04:760B $FE $0A
    ret  nc                                       ;; 04:760D $D0

    ld   a, [wD210]                               ;; 04:760E $FA $10 $D2
    ld   e, a                                     ;; 04:7611 $5F
    ld   d, b                                     ;; 04:7612 $50
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 04:7613 $21 $80 $C4
    add  hl, de                                   ;; 04:7616 $19
    ld   a, [hl]                                  ;; 04:7617 $7E
    and  a                                        ;; 04:7618 $A7
    ret  nz                                       ;; 04:7619 $C0

    ld   [hl], $18                                ;; 04:761A $36 $18
    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:761C $F0 $F1
    cp   $00                                      ;; 04:761E $FE $00
    jr   nz, .jr_762D                             ;; 04:7620 $20 $0B

    ld   a, $01                                   ;; 04:7622 $3E $01
    ld   [wTradeSequenceItem], a                  ;; 04:7624 $EA $0E $DB
    call CreateTradingItemEntity                  ;; 04:7627 $CD $0C $0C
    jp   ClearEntityStatusBank04                  ;; 04:762A $C3 $7A $6D

.jr_762D
    call ClearEntityStatusBank04                  ;; 04:762D $CD $7A $6D
    ld   hl, hWaveSfx                             ;; 04:7630 $21 $F3 $FF
    ld   [hl], WAVE_SFX_SEASHELL                  ;; 04:7633 $36 $01

    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:7635 $F0 $F1
    ld   e, a                                     ;; 04:7637 $5F
    ld   d, b                                     ;; 04:7638 $50

    ld   hl, TrendyPrizeDialogs                   ;; 04:7639 $21 $B6 $75
    add  hl, de                                   ;; 04:763C $19
    ld   a, [hl]                                  ;; 04:763D $7E
    call OpenDialogInTable0                       ;; 04:763E $CD $85 $23

    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:7641 $F0 $F1
    dec  a                                        ;; 04:7643 $3D
    jr   nz, .jr_7647                             ;; 04:7644 $20 $01

    ret                                           ;; 04:7646 $C9

.jr_7647
    dec  a                                        ;; 04:7647 $3D
    jr   nz, .jr_7653                             ;; 04:7648 $20 $09

    ld   a, [wAddRupeeBufferLow]                  ;; 04:764A $FA $90 $DB
    add  $1E                                      ;; 04:764D $C6 $1E
    ld   [wAddRupeeBufferLow], a                  ;; 04:764F $EA $90 $DB
    ret                                           ;; 04:7652 $C9

.jr_7653
    dec  a                                        ;; 04:7653 $3D
    jr   nz, jr_004_7673                          ;; 04:7654 $20 $1D

    ld   hl, wMaxMagicPowder                      ;; 04:7656 $21 $76 $DB
    ld   a, [wMagicPowderCount]                   ;; 04:7659 $FA $4C $DB
    cp   [hl]                                     ;; 04:765C $BE
    jr   nc, .jr_7666                             ;; 04:765D $30 $07

    add  $10                                      ;; 04:765F $C6 $10
    daa                                           ;; 04:7661 $27
    cp   [hl]                                     ;; 04:7662 $BE
    jr   c, .jr_7666                              ;; 04:7663 $38 $01

    ld   a, [hl]                                  ;; 04:7665 $7E

.jr_7666
    ld   [wMagicPowderCount], a                   ;; 04:7666 $EA $4C $DB
    ld   d, $0C                                   ;; 04:7669 $16 $0C
    call GiveInventoryItem_trampoline             ;; 04:766B $CD $6B $3E
    ld   a, REPLACE_TILES_MAGIC_POWDER            ;; 04:766E $3E $0B
    ldh  [hReplaceTiles], a                       ;; 04:7670 $E0 $A5
    ret                                           ;; 04:7672 $C9

jr_004_7673:
    dec  a                                        ;; 04:7673 $3D
    jr   nz, .jr_767B                             ;; 04:7674 $20 $05

    ld   d, $04                                   ;; 04:7676 $16 $04
    jp   GiveInventoryItem_trampoline             ;; 04:7678 $C3 $6B $3E

.jr_767B
    ld   a, $FF                                   ;; 04:767B $3E $FF
    ld   [wAddHealthBuffer], a                    ;; 04:767D $EA $93 $DB

label_004_7680:
    ret                                           ;; 04:7680 $C9

func_004_7681::
    ld   a, $02                                   ;; 04:7681 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:7683 $E0 $A1
    ld   [wC167], a                               ;; 04:7685 $EA $67 $C1
    ld   a, [wItemUsageContext]                   ;; 04:7688 $FA $AD $C1
    and  a                                        ;; 04:768B $A7
    ret  nz                                       ;; 04:768C $C0

    ld   [wIsMarinInAnimalVillage], a             ;; 04:768D $EA $74 $DB
    ld   a, $18                                   ;; 04:7690 $3E $18
    ld   [wLoadPreviousMapCountdown], a           ;; 04:7692 $EA $BC $C1
    jp   IncrementEntityState                     ;; 04:7695 $C3 $12 $3B

func_004_7698::
    ld   a, $02                                   ;; 04:7698 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:769A $E0 $A1
    ld   [wC167], a                               ;; 04:769C $EA $67 $C1
    ret                                           ;; 04:769F $C9

Data_004_76A0::
    db   $FC, $00, $04, $00, $00

Data_004_76A5::
    db   $00, $04, $00, $FC, $00

label_004_76AA:
    ld   hl, wEntitiesDirectionTable              ;; 04:76AA $21 $80 $C3
    add  hl, bc                                   ;; 04:76AD $09
    ld   a, [hl]                                  ;; 04:76AE $7E
    inc  a                                        ;; 04:76AF $3C
    and  $03                                      ;; 04:76B0 $E6 $03
    ld   [hl], a                                  ;; 04:76B2 $77

func_004_76B3::
    ld   e, a                                     ;; 04:76B3 $5F
    ld   d, b                                     ;; 04:76B4 $50
    ld   hl, Data_004_76A0                        ;; 04:76B5 $21 $A0 $76
    add  hl, de                                   ;; 04:76B8 $19
    ld   a, [hl]                                  ;; 04:76B9 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:76BA $21 $40 $C2
    add  hl, bc                                   ;; 04:76BD $09
    ld   [hl], a                                  ;; 04:76BE $77
    ld   hl, Data_004_76A5                        ;; 04:76BF $21 $A5 $76
    add  hl, de                                   ;; 04:76C2 $19
    ld   a, [hl]                                  ;; 04:76C3 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:76C4 $21 $50 $C2
    add  hl, bc                                   ;; 04:76C7 $09
    ld   [hl], a                                  ;; 04:76C8 $77
    ret                                           ;; 04:76C9 $C9
