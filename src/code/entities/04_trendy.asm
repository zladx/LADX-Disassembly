TrendyGameOwnerEntityHandler::
    ld   a, [wIsMarinFollowingLink]               ; $6E7C: $FA $73 $DB
    push af                                       ; $6E7F: $F5
    ldh  a, [hRoomStatus]                         ; $6E80: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $6E82: $E6 $10
    jr   z, .jr_6E8A                              ; $6E84: $28 $04

    xor  a                                        ; $6E86: $AF
    ld   [wIsMarinFollowingLink], a               ; $6E87: $EA $73 $DB

.jr_6E8A
    call func_004_6E92                            ; $6E8A: $CD $92 $6E
    pop  af                                       ; $6E8D: $F1
    ld   [wIsMarinFollowingLink], a               ; $6E8E: $EA $73 $DB
    ret                                           ; $6E91: $C9

func_004_6E92::
    ld   hl, wEntitiesPrivateState1Table          ; $6E92: $21 $B0 $C2
    add  hl, bc                                   ; $6E95: $09
    ld   a, [hl]                                  ; $6E96: $7E
    and  a                                        ; $6E97: $A7
    jp   nz, label_004_74D9                       ; $6E98: $C2 $D9 $74

    ld   a, c                                     ; $6E9B: $79
    ld   [wD210], a                               ; $6E9C: $EA $10 $D2
    ld   a, $02                                   ; $6E9F: $3E $02
    ld   [wBlockItemUsage], a                     ; $6EA1: $EA $0A $C5
    call GetEntityPrivateCountdown1               ; $6EA4: $CD $00 $0C
    dec  a                                        ; $6EA7: $3D
    jr   nz, .jr_6EAE                             ; $6EA8: $20 $04

    ld   a, JINGLE_NEW_HEART                      ; $6EAA: $3E $19
    ldh  [hJingle], a                             ; $6EAC: $E0 $F2

.jr_6EAE
    ldh  a, [hActiveEntitySpriteVariant]          ; $6EAE: $F0 $F1
    inc  a                                        ; $6EB0: $3C
    jr   z, jr_004_6ECA                           ; $6EB1: $28 $17

    ldh  a, [hFrameCounter]                       ; $6EB3: $F0 $E7
    and  $1F                                      ; $6EB5: $E6 $1F
    jr   nz, .jr_6EC1                             ; $6EB7: $20 $08

    call func_004_6E55                            ; $6EB9: $CD $55 $6E
    ld   hl, wEntitiesDirectionTable              ; $6EBC: $21 $80 $C3
    add  hl, bc                                   ; $6EBF: $09
    ld   [hl], e                                  ; $6EC0: $73

.jr_6EC1
    call func_004_7C98                            ; $6EC1: $CD $98 $7C
    ld   de, ShopOwnerSpriteVariants              ; $6EC4: $11 $CB $76
    call RenderActiveEntitySpritesPair            ; $6EC7: $CD $C0 $3B

jr_004_6ECA:
    call func_004_73FE                            ; $6ECA: $CD $FE $73
    call CopyEntityPositionToActivePosition       ; $6ECD: $CD $8A $3D
    call PushLinkOutOfEntity_04                   ; $6ED0: $CD $E3 $7B
    call func_004_73B7                            ; $6ED3: $CD $B7 $73
    ldh  a, [hActiveEntityState]                  ; $6ED6: $F0 $F0
    cp   $03                                      ; $6ED8: $FE $03
    jr   c, .jr_6EE9                              ; $6EDA: $38 $0D

    ld   a, [wIsMarinFollowingLink]               ; $6EDC: $FA $73 $DB
    and  a                                        ; $6EDF: $A7
    jr   z, .jr_6EE9                              ; $6EE0: $28 $07

    ld   a, $02                                   ; $6EE2: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6EE4: $E0 $A1
    ld   [wC167], a                               ; $6EE6: $EA $67 $C1

.jr_6EE9
    ld   a, [wGameplayType]                       ; $6EE9: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $6EEC: $FE $0B
    ret  nz                                       ; $6EEE: $C0

    ld   a, [wTransitionSequenceCounter]          ; $6EEF: $FA $6B $C1
    cp   $04                                      ; $6EF2: $FE $04
    ret  nz                                       ; $6EF4: $C0

TrendyEntityJumpTable:
    ldh  a, [hActiveEntityState]                  ; $6EF5: $F0 $F0
    JP_TABLE                                      ; $6EF7
._00 dw func_004_6F38                             ; $6EF8
._01 dw func_004_6FC6                             ; $6EFA
._02 dw func_004_7020                             ; $6EFC
._03 dw func_004_707F                             ; $6EFE
._04 dw func_004_710C                             ; $6F00
._05 dw func_004_7179                             ; $6F02
._06 dw func_004_71B0                             ; $6F04
._07 dw func_004_71FF                             ; $6F06
._08 dw func_004_7249                             ; $6F08
._09 dw func_004_727C                             ; $6F0A
._0A dw func_004_7296                             ; $6F0C
._0B dw func_004_72EF                             ; $6F0E
._0C dw func_004_732F                             ; $6F10

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
    ld   e, $06                                   ; $6F38: $1E $06
    ld   d, $00                                   ; $6F3A: $16 $00

jr_004_6F3C:
    push de                                       ; $6F3C: $D5
    ld   a, ENTITY_TRENDY_GAME_OWNER              ; $6F3D: $3E $4F
    ld   e, $0E                                   ; $6F3F: $1E $0E
    call SpawnNewEntityInRange_trampoline         ; $6F41: $CD $98 $3B

    ; Set entity X and Y position from values depending on privateState1.
    ;
    ; (NB: the code finds it clever to re-use some values from the
    ; entity jump table.)
    ld   hl, wEntitiesPrivateState1Table          ; $6F44: $21 $B0 $C2
    add  hl, de                                   ; $6F47: $19
    ld   [hl], $01                                ; $6F48: $36 $01

    ld   hl, (TrendyEntityJumpTable._08 + 1)      ; $6F4A: $21 $09 $6F
    add  hl, de                                   ; $6F4D: $19
    ld   a, [hl]                                  ; $6F4E: $7E
    ld   hl, wEntitiesPosXTable                   ; $6F4F: $21 $00 $C2
    add  hl, de                                   ; $6F52: $19
    ld   [hl], a                                  ; $6F53: $77

    ld   hl, (TrendyEntityJumpTable._0B + 1)      ; $6F54: $21 $0F $6F
    add  hl, de                                   ; $6F57: $19
    ld   a, [hl]                                  ; $6F58: $7E
    ld   hl, wEntitiesPosYTable                   ; $6F59: $21 $10 $C2
    add  hl, de                                   ; $6F5C: $19
    ld   [hl], a                                  ; $6F5D: $77
    ld   hl, Data_004_6F1B                        ; $6F5E: $21 $1B $6F
    add  hl, de                                   ; $6F61: $19
    ld   a, [hl]                                  ; $6F62: $7E
    ld   hl, wEntitiesSpriteVariantTable          ; $6F63: $21 $B0 $C3
    add  hl, de                                   ; $6F66: $19
    ld   [hl], a                                  ; $6F67: $77
    ld   hl, Data_004_6F21                        ; $6F68: $21 $21 $6F
    add  hl, de                                   ; $6F6B: $19

    ld   a, [hl]                                  ; $6F6C: $7E
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6F6D: $21 $40 $C3
    add  hl, de                                   ; $6F70: $19
    ld   [hl], a                                  ; $6F71: $77
    ld   hl, Data_004_6F15                        ; $6F72: $21 $15 $6F
    add  hl, de                                   ; $6F75: $19
    ld   a, [hl]                                  ; $6F76: $7E
    ld   hl, wEntitiesDirectionTable              ; $6F77: $21 $80 $C3
    add  hl, de                                   ; $6F7A: $19
    ld   [hl], a                                  ; $6F7B: $77
    push bc                                       ; $6F7C: $C5
    ld   c, e                                     ; $6F7D: $4B
    ld   b, d                                     ; $6F7E: $42
    call func_004_76B3                            ; $6F7F: $CD $B3 $76
    pop  bc                                       ; $6F82: $C1
    pop  de                                       ; $6F83: $D1
    dec  e                                        ; $6F84: $1D
    jr   nz, jr_004_6F3C                          ; $6F85: $20 $B5

    xor  a                                        ; $6F87: $AF
    ld   [wD206], a                               ; $6F88: $EA $06 $D2
    ld   a, $10                                   ; $6F8B: $3E $10
    ld   [wD202], a                               ; $6F8D: $EA $02 $D2
    ld   [wD203], a                               ; $6F90: $EA $03 $D2
    ld   a, $16                                   ; $6F93: $3E $16
    ld   [wD205], a                               ; $6F95: $EA $05 $D2
    ld   a, $18                                   ; $6F98: $3E $18
    ld   [wD204], a                               ; $6F9A: $EA $04 $D2
    ld   a, $00                                   ; $6F9D: $3E $00
    ld   [wD200], a                               ; $6F9F: $EA $00 $D2
    ld   a, $04                                   ; $6FA2: $3E $04
    ld   [wD201], a                               ; $6FA4: $EA $01 $D2
    call IncrementEntityState                     ; $6FA7: $CD $12 $3B
    ld   a, [wTradeSequenceItem]                  ; $6FAA: $FA $0E $DB
    ld   hl, wEntitiesPrivateState5Table          ; $6FAD: $21 $90 $C3
    add  hl, bc                                   ; $6FB0: $09
    ld   [hl], a                                  ; $6FB1: $77
    ld   hl, wObjPal6                             ; $6FB2: $21 $78 $DC
    ld   de, Data_004_6F30                        ; $6FB5: $11 $30 $6F

.loop_6FB8
    ld   a, [de]                                  ; $6FB8: $1A
    ld   [hl+], a                                 ; $6FB9: $22
    inc  de                                       ; $6FBA: $13
    ld   a, l                                     ; $6FBB: $7D
    and  $07                                      ; $6FBC: $E6 $07
    jr   nz, .loop_6FB8                           ; $6FBE: $20 $F8

    ld   a, $02                                   ; $6FC0: $3E $02
    ld   [wPaletteDataFlags], a                   ; $6FC2: $EA $D1 $DD
    ret                                           ; $6FC5: $C9

func_004_6FC6::
    ld   a, [wC167]                               ; $6FC6: $FA $67 $C1
    and  a                                        ; $6FC9: $A7
    ret  nz                                       ; $6FCA: $C0

    ld   a, [wIsMarinFollowingLink]               ; $6FCB: $FA $73 $DB
    and  a                                        ; $6FCE: $A7
    jr   z, .jr_6FE2                              ; $6FCF: $28 $11

    ldh  a, [hLinkPositionX]                      ; $6FD1: $F0 $98
    cp   $6C                                      ; $6FD3: $FE $6C
    jr   c, .jr_6FE2                              ; $6FD5: $38 $0B

    ld   hl, wIndoorBRoomStatus + $A0             ; $6FD7: $21 $A0 $DA
    set  4, [hl]                                  ; $6FDA: $CB $E6
    ld   a, $6B                                   ; $6FDC: $3E $6B
    ldh  [hLinkPositionX], a                      ; $6FDE: $E0 $98
    jr   jr_004_6FE6                              ; $6FE0: $18 $04

.jr_6FE2
    call func_004_7C06                            ; $6FE2: $CD $06 $7C
    ret  nc                                       ; $6FE5: $D0

jr_004_6FE6:
    xor  a                                        ; $6FE6: $AF
    ld   [wConsecutiveStepsCount], a              ; $6FE7: $EA $20 $C1
    ldh  [hLinkSpeedX], a                         ; $6FEA: $E0 $9A
    ld   e, $06                                   ; $6FEC: $1E $06
    ld   hl, wEntitiesPrivateState5Table          ; $6FEE: $21 $90 $C3
    add  hl, bc                                   ; $6FF1: $09
    ld   a, [hl]                                  ; $6FF2: $7E
    and  a                                        ; $6FF3: $A7
    jr   z, .jr_6FF7                              ; $6FF4: $28 $01

    dec  e                                        ; $6FF6: $1D

.jr_6FF7
    ld   hl, wEntitiesPrivateState4Table          ; $6FF7: $21 $40 $C4
    add  hl, bc                                   ; $6FFA: $09
    ld   a, [hl]                                  ; $6FFB: $7E
    cp   e                                        ; $6FFC: $BB
    jr   c, .jr_7004                              ; $6FFD: $38 $05

    jp_open_dialog Dialog040                      ; $6FFF

.jr_7004
    ld   a, [wIsMarinFollowingLink]               ; $7004: $FA $73 $DB
    and  a                                        ; $7007: $A7
    jr   z, .jr_700E                              ; $7008: $28 $04

    ld_dialog_low a, Dialog0F7                    ; $700A: $3E $F7
    jr   jr_004_701A                              ; $700C: $18 $0C

.jr_700E
    ld   hl, wEntitiesPrivateState3Table          ; $700E: $21 $D0 $C2
    add  hl, bc                                   ; $7011: $09
    ld   a, [hl]                                  ; $7012: $7E
    and  a                                        ; $7013: $A7
    ld_dialog_low a, Dialog03B                    ; $7014: $3E $3B
    jr   z, jr_004_701A                           ; $7016: $28 $02

    ld_dialog_low a, Dialog03E                    ; $7018: $3E $3E

jr_004_701A:
    call OpenDialogInTable0                       ; $701A: $CD $85 $23
    jp   IncrementEntityState                     ; $701D: $C3 $12 $3B

func_004_7020::
    ld   a, $02                                   ; $7020: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7022: $E0 $A1
    ld   a, [wDialogState]                        ; $7024: $FA $9F $C1
    and  a                                        ; $7027: $A7
    jr   nz, ret_004_705C                         ; $7028: $20 $32

    ld   a, [wDialogIndex]                        ; $702A: $FA $73 $C1
    cp   $F8                                      ; $702D: $FE $F8
    jr   z, .jr_7038                              ; $702F: $28 $07

    ld   a, [wDialogAskSelectionIndex]            ; $7031: $FA $77 $C1
    cp   $01                                      ; $7034: $FE $01
    jr   nc, jr_004_704B                          ; $7036: $30 $13

.jr_7038
    ld   a, [wRupeeCountLow]                      ; $7038: $FA $5E $DB
    sub  $10                                      ; $703B: $D6 $10
    ld   a, [wRupeeCountHigh]                     ; $703D: $FA $5D $DB

func_004_7040::
    sbc  $00                                      ; $7040: $DE $00
    jr   nc, jr_004_705D                          ; $7042: $30 $19

    call_open_dialog Dialog034                    ; $7044
    jr   label_004_7056                           ; $7049: $18 $0B

jr_004_704B:
    ld   a, [wIsMarinFollowingLink]               ; $704B: $FA $73 $DB
    and  a                                        ; $704E: $A7
    jr   z, label_004_7056                        ; $704F: $28 $05

    jp_open_dialog Dialog0F8                      ; $7051

label_004_7056:
    ld   hl, wEntitiesStateTable                  ; $7056: $21 $90 $C2
    add  hl, bc                                   ; $7059: $09
    ld   [hl], $01                                ; $705A: $36 $01

ret_004_705C:
    ret                                           ; $705C: $C9

jr_004_705D:
    ld   a, [wIsMarinFollowingLink]               ; $705D: $FA $73 $DB
    and  a                                        ; $7060: $A7
    jr   z, .jr_7066                              ; $7061: $28 $03

    ld   [wIsMarinInAnimalVillage], a             ; $7063: $EA $74 $DB

.jr_7066
    ld   hl, wEntitiesPrivateState3Table          ; $7066: $21 $D0 $C2
    add  hl, bc                                   ; $7069: $09
    ld   a, [hl]                                  ; $706A: $7E
    ld   [hl], $01                                ; $706B: $36 $01
    and  a                                        ; $706D: $A7
    ld_dialog_low a, Dialog03C                    ; $706E: $3E $3C
    jr   z, .jr_7074                              ; $7070: $28 $02

    ld_dialog_low a, Dialog03F                    ; $7072: $3E $3F

.jr_7074
    call OpenDialogInTable0                       ; $7074: $CD $85 $23
    ld   a, TRENDY_GAME_PRICE                     ; $7077: $3E $0A
    ld   [wSubstractRupeeBufferLow], a            ; $7079: $EA $92 $DB
    jp   IncrementEntityState                     ; $707C: $C3 $12 $3B

func_004_707F::
    ldh  a, [hFrameCounter]                       ; $707F: $F0 $E7
    rra                                           ; $7081: $1F
    rra                                           ; $7082: $1F
    rra                                           ; $7083: $1F
    rra                                           ; $7084: $1F
    and  $01                                      ; $7085: $E6 $01
    ld   [wD200], a                               ; $7087: $EA $00 $D2
    ld   a, $10                                   ; $708A: $3E $10
    ld   [wD203], a                               ; $708C: $EA $03 $D2
    ldh  a, [hIsGBC]                              ; $708F: $F0 $FE
    and  a                                        ; $7091: $A7
    jr   z, .jr_70A2                              ; $7092: $28 $0E

    ldh  a, [hFrameCounter]                       ; $7094: $F0 $E7
    and  $08                                      ; $7096: $E6 $08
    srl  a                                        ; $7098: $CB $3F
    srl  a                                        ; $709A: $CB $3F
    srl  a                                        ; $709C: $CB $3F
    add  $03                                      ; $709E: $C6 $03
    jr   jr_004_70A6                              ; $70A0: $18 $04

.jr_70A2
    ldh  a, [hFrameCounter]                       ; $70A2: $F0 $E7
    and  $10                                      ; $70A4: $E6 $10

jr_004_70A6:
    ld   [wD202], a                               ; $70A6: $EA $02 $D2
    ld   a, [wIsMarinFollowingLink]               ; $70A9: $FA $73 $DB
    and  a                                        ; $70AC: $A7
    jr   z, jr_004_70F4                           ; $70AD: $28 $45

    call GetEntityDropTimer                       ; $70AF: $CD $FB $0B
    jr   z, .jr_70B9                              ; $70B2: $28 $05

    dec  a                                        ; $70B4: $3D
    ret  nz                                       ; $70B5: $C0

    jp   label_004_7104                           ; $70B6: $C3 $04 $71

.jr_70B9
    call ReturnIfNonInteractive_04                ; $70B9: $CD $A3 $7F
    push bc                                       ; $70BC: $C5
    ld   a, [wMarinEntityIndex]                   ; $70BD: $FA $0F $C5
    ld   c, a                                     ; $70C0: $4F
    ldh  a, [hFrameCounter]                       ; $70C1: $F0 $E7
    and  $10                                      ; $70C3: $E6 $10
    ld   a, $04                                   ; $70C5: $3E $04
    jr   z, .jr_70CA                              ; $70C7: $28 $01

    inc  a                                        ; $70C9: $3C

.jr_70CA
    call SetEntitySpriteVariant                   ; $70CA: $CD $0C $3B
    ld   hl, wEntitiesSpeedXTable                 ; $70CD: $21 $40 $C2
    add  hl, bc                                   ; $70D0: $09
    ld   [hl], $F8                                ; $70D1: $36 $F8
    call AddEntitySpeedToPos_04                   ; $70D3: $CD $D7 $6D
    ld   hl, wEntitiesPosXTable                   ; $70D6: $21 $00 $C2
    add  hl, bc                                   ; $70D9: $09
    pop  bc                                       ; $70DA: $C1
    ld   a, [hl]                                  ; $70DB: $7E
    cp   $28                                      ; $70DC: $FE $28
    ret  nz                                       ; $70DE: $C0

    call GetEntityDropTimer                       ; $70DF: $CD $FB $0B
    ld   [hl], $18                                ; $70E2: $36 $18
    ld   a, [wMarinEntityIndex]                   ; $70E4: $FA $0F $C5
    ld   e, a                                     ; $70E7: $5F
    ld   d, b                                     ; $70E8: $50
    ld   hl, wEntitiesSpriteVariantTable          ; $70E9: $21 $B0 $C3
    add  hl, de                                   ; $70EC: $19
    ld   [hl], $02                                ; $70ED: $36 $02
    ld   e, $01                                   ; $70EF: $1E $01
    jp   func_004_723B                            ; $70F1: $C3 $3B $72

jr_004_70F4:
    ldh  a, [hPressedButtonsMask]                 ; $70F4: $F0 $CB
    and  $20                                      ; $70F6: $E6 $20
    jr   z, ret_004_710B                          ; $70F8: $28 $11

    ldh  a, [hLinkPositionX]                      ; $70FA: $F0 $98
    cp   $20                                      ; $70FC: $FE $20
    jr   c, ret_004_710B                          ; $70FE: $38 $0B

    cp   $30                                      ; $7100: $FE $30
    jr   nc, ret_004_710B                         ; $7102: $30 $07

label_004_7104:
    call IncrementEntityState                     ; $7104: $CD $12 $3B

func_004_7107::
    ld   a, NOISE_SFX_TRENDY_CRANE                ; $7107: $3E $20
    ldh  [hNoiseSfx], a                           ; $7109: $E0 $F4

ret_004_710B:
    ret                                           ; $710B: $C9

func_004_710C::
    call func_004_7165                            ; $710C: $CD $65 $71
    ld   a, $10                                   ; $710F: $3E $10
    ld   [wD203], a                               ; $7111: $EA $03 $D2
    ldh  a, [hIsGBC]                              ; $7114: $F0 $FE
    and  a                                        ; $7116: $A7
    jr   z, .jr_7127                              ; $7117: $28 $0E

    ldh  a, [hFrameCounter]                       ; $7119: $F0 $E7
    and  $08                                      ; $711B: $E6 $08
    srl  a                                        ; $711D: $CB $3F
    srl  a                                        ; $711F: $CB $3F
    srl  a                                        ; $7121: $CB $3F
    add  $03                                      ; $7123: $C6 $03
    jr   jr_004_712B                              ; $7125: $18 $04

.jr_7127
    ldh  a, [hFrameCounter]                       ; $7127: $F0 $E7
    and  $10                                      ; $7129: $E6 $10

jr_004_712B:
    ld   [wD202], a                               ; $712B: $EA $02 $D2
    ld   a, [wIsMarinFollowingLink]               ; $712E: $FA $73 $DB
    and  a                                        ; $7131: $A7
    jr   z, .jr_713B                              ; $7132: $28 $07

    ld   e, $02                                   ; $7134: $1E $02
    call func_004_723B                            ; $7136: $CD $3B $72
    jr   jr_004_7141                              ; $7139: $18 $06

.jr_713B
    ldh  a, [hPressedButtonsMask]                 ; $713B: $F0 $CB
    and  $20                                      ; $713D: $E6 $20
    jr   z, jr_004_7152                           ; $713F: $28 $11

jr_004_7141:
    ldh  a, [hFrameCounter]                       ; $7141: $F0 $E7
    and  $03                                      ; $7143: $E6 $03
    jr   nz, ret_004_7164                         ; $7145: $20 $1D

    ld   a, [wD204]                               ; $7147: $FA $04 $D2
    inc  a                                        ; $714A: $3C
    ld   [wD204], a                               ; $714B: $EA $04 $D2
    cp   $88                                      ; $714E: $FE $88
    jr   c, ret_004_7164                          ; $7150: $38 $12

jr_004_7152:
    call IncrementEntityState                     ; $7152: $CD $12 $3B
    ld   a, [wIsMarinFollowingLink]               ; $7155: $FA $73 $DB
    and  a                                        ; $7158: $A7
    jr   z, func_004_7160                         ; $7159: $28 $05

    call GetEntityDropTimer                       ; $715B: $CD $FB $0B
    ld   [hl], $10                                ; $715E: $36 $10

func_004_7160::
    ld   a, NOISE_SFX_SILENT                      ; $7160: $3E $21
    ldh  [hNoiseSfx], a                           ; $7162: $E0 $F4

ret_004_7164:
    ret                                           ; $7164: $C9

func_004_7165::
    ldh  a, [hFrameCounter]                       ; $7165: $F0 $E7
    rra                                           ; $7167: $1F
    rra                                           ; $7168: $1F
    rra                                           ; $7169: $1F
    rra                                           ; $716A: $1F
    and  $01                                      ; $716B: $E6 $01
    ld   [wD200], a                               ; $716D: $EA $00 $D2
    ld   a, $01                                   ; $7170: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7172: $E0 $A1
    ld   a, DIRECTION_UP                          ; $7174: $3E $02
    ldh  [hLinkDirection], a                      ; $7176: $E0 $9E
    ret                                           ; $7178: $C9

func_004_7179::
    call func_004_7165                            ; $7179: $CD $65 $71
    ld   a, $10                                   ; $717C: $3E $10
    ld   [wD202], a                               ; $717E: $EA $02 $D2
    ldh  a, [hIsGBC]                              ; $7181: $F0 $FE
    and  a                                        ; $7183: $A7
    jr   z, .jr_7194                              ; $7184: $28 $0E

    ldh  a, [hFrameCounter]                       ; $7186: $F0 $E7
    and  $08                                      ; $7188: $E6 $08
    srl  a                                        ; $718A: $CB $3F
    srl  a                                        ; $718C: $CB $3F
    srl  a                                        ; $718E: $CB $3F
    add  $03                                      ; $7190: $C6 $03
    jr   jr_004_7198                              ; $7192: $18 $04

.jr_7194
    ldh  a, [hFrameCounter]                       ; $7194: $F0 $E7
    and  $10                                      ; $7196: $E6 $10

jr_004_7198:
    ld   [wD203], a                               ; $7198: $EA $03 $D2
    call GetEntityDropTimer                       ; $719B: $CD $FB $0B
    ret  nz                                       ; $719E: $C0

    ld   a, [wIsMarinFollowingLink]               ; $719F: $FA $73 $DB
    and  a                                        ; $71A2: $A7
    jr   nz, .jr_71AA                             ; $71A3: $20 $05

    ldh  a, [hPressedButtonsMask]                 ; $71A5: $F0 $CB
    and  $10                                      ; $71A7: $E6 $10
    ret  z                                        ; $71A9: $C8

.jr_71AA
    call func_004_7107                            ; $71AA: $CD $07 $71
    jp   IncrementEntityState                     ; $71AD: $C3 $12 $3B

func_004_71B0::
    call func_004_7165                            ; $71B0: $CD $65 $71
    ld   a, $10                                   ; $71B3: $3E $10
    ld   [wD202], a                               ; $71B5: $EA $02 $D2
    ldh  a, [hIsGBC]                              ; $71B8: $F0 $FE
    and  a                                        ; $71BA: $A7
    jr   z, .jr_71CB                              ; $71BB: $28 $0E

    ldh  a, [hFrameCounter]                       ; $71BD: $F0 $E7
    and  $08                                      ; $71BF: $E6 $08
    srl  a                                        ; $71C1: $CB $3F
    srl  a                                        ; $71C3: $CB $3F
    srl  a                                        ; $71C5: $CB $3F
    add  $03                                      ; $71C7: $C6 $03
    jr   jr_004_71CF                              ; $71C9: $18 $04

.jr_71CB
    ldh  a, [hFrameCounter]                       ; $71CB: $F0 $E7
    and  $10                                      ; $71CD: $E6 $10

jr_004_71CF:
    ld   [wD203], a                               ; $71CF: $EA $03 $D2
    ld   a, [wIsMarinFollowingLink]               ; $71D2: $FA $73 $DB
    and  a                                        ; $71D5: $A7
    jr   z, .jr_71DA                              ; $71D6: $28 $02

    jr   jr_004_71E0                              ; $71D8: $18 $06

.jr_71DA
    ldh  a, [hPressedButtonsMask]                 ; $71DA: $F0 $CB
    and  $10                                      ; $71DC: $E6 $10
    jr   z, jr_004_71EF                           ; $71DE: $28 $0F

jr_004_71E0:
    ldh  a, [hFrameCounter]                       ; $71E0: $F0 $E7
    and  $03                                      ; $71E2: $E6 $03
    ret  nz                                       ; $71E4: $C0

    ld   a, [wD205]                               ; $71E5: $FA $05 $D2
    inc  a                                        ; $71E8: $3C
    ld   [wD205], a                               ; $71E9: $EA $05 $D2
    cp   $55                                      ; $71EC: $FE $55
    ret  c                                        ; $71EE: $D8

jr_004_71EF:
    call IncrementEntityState                     ; $71EF: $CD $12 $3B
    call func_004_7160                            ; $71F2: $CD $60 $71
    call GetEntityTransitionCountdown             ; $71F5: $CD $05 $0C
    ld   [hl], $60                                ; $71F8: $36 $60
    ld   e, $00                                   ; $71FA: $1E $00
    jp   func_004_723B                            ; $71FC: $C3 $3B $72

func_004_71FF::
    ldh  a, [hFrameCounter]                       ; $71FF: $F0 $E7
    rra                                           ; $7201: $1F
    rra                                           ; $7202: $1F
    rra                                           ; $7203: $1F
    and  $01                                      ; $7204: $E6 $01
    ld   [wD200], a                               ; $7206: $EA $00 $D2
    ld   a, $10                                   ; $7209: $3E $10
    ld   [wD202], a                               ; $720B: $EA $02 $D2
    ld   [wD203], a                               ; $720E: $EA $03 $D2
    call GetEntityTransitionCountdown             ; $7211: $CD $05 $0C
    cp   $30                                      ; $7214: $FE $30
    jr   nc, .jr_721D                             ; $7216: $30 $05

    ld   hl, wD201                                ; $7218: $21 $01 $D2
    ld   [hl], $02                                ; $721B: $36 $02

.jr_721D
    and  a                                        ; $721D: $A7
    jr   nz, ret_004_7248                         ; $721E: $20 $28

    ldh  a, [hFrameCounter]                       ; $7220: $F0 $E7
    and  $03                                      ; $7222: $E6 $03
    jr   nz, ret_004_7248                         ; $7224: $20 $22

    ld   a, [wD206]                               ; $7226: $FA $06 $D2
    inc  a                                        ; $7229: $3C
    ld   [wD206], a                               ; $722A: $EA $06 $D2
    cp   $0F                                      ; $722D: $FE $0F
    jr   nz, ret_004_7248                         ; $722F: $20 $17

    call GetEntityTransitionCountdown             ; $7231: $CD $05 $0C
    ld   [hl], $FF                                ; $7234: $36 $FF
    call IncrementEntityState                     ; $7236: $CD $12 $3B
    ld   e, $00                                   ; $7239: $1E $00

func_004_723B::
    ld   a, [wIsMarinFollowingLink]               ; $723B: $FA $73 $DB
    and  a                                        ; $723E: $A7
    ret  z                                        ; $723F: $C8

    ld   a, e                                     ; $7240: $7B
    ldh  [hLinkDirection], a                      ; $7241: $E0 $9E
    push bc                                       ; $7243: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $7244: $CD $F0 $0B
    pop  bc                                       ; $7247: $C1

ret_004_7248:
    ret                                           ; $7248: $C9

func_004_7249::
    ldh  a, [hFrameCounter]                       ; $7249: $F0 $E7
    rra                                           ; $724B: $1F
    rra                                           ; $724C: $1F
    rra                                           ; $724D: $1F
    and  $01                                      ; $724E: $E6 $01
    ld   [wD200], a                               ; $7250: $EA $00 $D2
    call GetEntityTransitionCountdown             ; $7253: $CD $05 $0C
    cp   $C8                                      ; $7256: $FE $C8
    jr   nz, .jr_725F                             ; $7258: $20 $05

    ld   hl, wD206                                ; $725A: $21 $06 $D2
    ld   [hl], $10                                ; $725D: $36 $10

.jr_725F
    cp   $A0                                      ; $725F: $FE $A0
    jr   nz, .jr_7268                             ; $7261: $20 $05

    ld   hl, wD201                                ; $7263: $21 $01 $D2
    ld   [hl], $03                                ; $7266: $36 $03

.jr_7268
    cp   $50                                      ; $7268: $FE $50
    jr   nz, .jr_7274                             ; $726A: $20 $08

    ld   hl, wD201                                ; $726C: $21 $01 $D2
    ld   [hl], $04                                ; $726F: $36 $04
    jp   label_004_7332                           ; $7271: $C3 $32 $73

.jr_7274
    and  a                                        ; $7274: $A7
    ret  nz                                       ; $7275: $C0

    call IncrementEntityState                     ; $7276: $CD $12 $3B
    jp   func_004_7107                            ; $7279: $C3 $07 $71

func_004_727C::
    ldh  a, [hFrameCounter]                       ; $727C: $F0 $E7
    rra                                           ; $727E: $1F
    rra                                           ; $727F: $1F
    rra                                           ; $7280: $1F
    and  $01                                      ; $7281: $E6 $01
    ld   [wD200], a                               ; $7283: $EA $00 $D2
    ldh  a, [hFrameCounter]                       ; $7286: $F0 $E7
    and  $03                                      ; $7288: $E6 $03
    ret  nz                                       ; $728A: $C0

    ld   a, [wD206]                               ; $728B: $FA $06 $D2
    dec  a                                        ; $728E: $3D
    ld   [wD206], a                               ; $728F: $EA $06 $D2
    ret  nz                                       ; $7292: $C0

    jp   IncrementEntityState                     ; $7293: $C3 $12 $3B

func_004_7296::
    ldh  a, [hFrameCounter]                       ; $7296: $F0 $E7
    rra                                           ; $7298: $1F
    rra                                           ; $7299: $1F
    rra                                           ; $729A: $1F
    and  $01                                      ; $729B: $E6 $01
    ld   [wD200], a                               ; $729D: $EA $00 $D2
    ldh  a, [hLinkPositionX]                      ; $72A0: $F0 $98
    push af                                       ; $72A2: $F5
    ldh  a, [hLinkPositionY]                      ; $72A3: $F0 $99
    push af                                       ; $72A5: $F5
    ld   a, $16                                   ; $72A6: $3E $16
    ldh  [hLinkPositionY], a                      ; $72A8: $E0 $99
    ld   a, $18                                   ; $72AA: $3E $18
    ldh  [hLinkPositionX], a                      ; $72AC: $E0 $98
    ld   a, [wD204]                               ; $72AE: $FA $04 $D2
    ld   [wEntitiesPosXTable + $01], a            ; $72B1: $EA $01 $C2
    ld   a, [wD205]                               ; $72B4: $FA $05 $D2
    ld   [wEntitiesPosYTable+1], a                ; $72B7: $EA $11 $C2
    push bc                                       ; $72BA: $C5
    ld   c, $01                                   ; $72BB: $0E $01
    ld   a, $04                                   ; $72BD: $3E $04
    call ApplyVectorTowardsLink_trampoline        ; $72BF: $CD $AA $3B
    call UpdateEntityPosWithSpeed_04              ; $72C2: $CD $CA $6D
    ld   a, [wEntitiesPosXTable + $01]            ; $72C5: $FA $01 $C2
    ld   [wD204], a                               ; $72C8: $EA $04 $D2
    ld   a, [wEntitiesPosYTable+1]                ; $72CB: $FA $11 $C2
    ld   [wD205], a                               ; $72CE: $EA $05 $D2
    pop  bc                                       ; $72D1: $C1
    pop  af                                       ; $72D2: $F1
    ldh  [hLinkPositionY], a                      ; $72D3: $E0 $99
    pop  af                                       ; $72D5: $F1
    ldh  [hLinkPositionX], a                      ; $72D6: $E0 $98
    ld   a, [wD204]                               ; $72D8: $FA $04 $D2
    cp   $18                                      ; $72DB: $FE $18
    ret  nz                                       ; $72DD: $C0

    ld   a, [wD205]                               ; $72DE: $FA $05 $D2
    cp   $16                                      ; $72E1: $FE $16
    ret  nz                                       ; $72E3: $C0

    call GetEntityTransitionCountdown             ; $72E4: $CD $05 $0C
    ld   [hl], $C0                                ; $72E7: $36 $C0
    call IncrementEntityState                     ; $72E9: $CD $12 $3B
    jp   func_004_7160                            ; $72EC: $C3 $60 $71

func_004_72EF::
    ldh  a, [hFrameCounter]                       ; $72EF: $F0 $E7
    rra                                           ; $72F1: $1F
    rra                                           ; $72F2: $1F
    rra                                           ; $72F3: $1F
    and  $01                                      ; $72F4: $E6 $01
    ld   [wD200], a                               ; $72F6: $EA $00 $D2
    call GetEntityTransitionCountdown             ; $72F9: $CD $05 $0C
    cp   $60                                      ; $72FC: $FE $60
    jr   nz, jr_004_7325                          ; $72FE: $20 $25

    ld   hl, wD201                                ; $7300: $21 $01 $D2
    ld   [hl], $02                                ; $7303: $36 $02
    ld   hl, wEntitiesPrivateState2Table          ; $7305: $21 $C0 $C2
    add  hl, bc                                   ; $7308: $09
    ld   a, [hl]                                  ; $7309: $7E
    and  a                                        ; $730A: $A7
    jr   z, .ret_7324                             ; $730B: $28 $17

    ld   [hl], $00                                ; $730D: $36 $00
    dec  a                                        ; $730F: $3D
    ld   e, a                                     ; $7310: $5F
    ld   d, b                                     ; $7311: $50
    ld   hl, wEntitiesStateTable                  ; $7312: $21 $90 $C2
    add  hl, de                                   ; $7315: $19
    ld   [hl], $02                                ; $7316: $36 $02
    ld   a, [wIsMarinFollowingLink]               ; $7318: $FA $73 $DB
    and  a                                        ; $731B: $A7
    jr   z, .ret_7324                             ; $731C: $28 $06

    ld   hl, wEntitiesSpriteVariantTable          ; $731E: $21 $B0 $C3
    add  hl, de                                   ; $7321: $19
    ld   [hl], $07                                ; $7322: $36 $07

.ret_7324
    ret                                           ; $7324: $C9

jr_004_7325:
    and  a                                        ; $7325: $A7
    ret  nz                                       ; $7326: $C0

    ld   hl, wD201                                ; $7327: $21 $01 $D2
    ld   [hl], $04                                ; $732A: $36 $04
    jp   IncrementEntityState                     ; $732C: $C3 $12 $3B

func_004_732F::
    jp   label_004_7056                           ; $732F: $C3 $56 $70

label_004_7332:
    ld   a, [wIsMarinFollowingLink]               ; $7332: $FA $73 $DB
    and  a                                        ; $7335: $A7
    jr   z, .jr_735F                              ; $7336: $28 $27

    ld   a, $FF                                   ; $7338: $3E $FF
    call SetEntitySpriteVariant                   ; $733A: $CD $0C $3B
    ld   a, ENTITY_TRENDY_GAME_OWNER              ; $733D: $3E $4F
    call SpawnNewEntity_trampoline                ; $733F: $CD $86 $3B
    ld   a, [wD204]                               ; $7342: $FA $04 $D2
    ld   hl, wEntitiesPosXTable                   ; $7345: $21 $00 $C2
    add  hl, de                                   ; $7348: $19
    ld   [hl], a                                  ; $7349: $77
    ld   a, [wD205]                               ; $734A: $FA $05 $D2
    add  $18                                      ; $734D: $C6 $18
    ld   hl, wEntitiesPosYTable                   ; $734F: $21 $10 $C2
    add  hl, de                                   ; $7352: $19
    ld   [hl], a                                  ; $7353: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $7354: $21 $B0 $C3
    add  hl, de                                   ; $7357: $19
    ld   [hl], $06                                ; $7358: $36 $06
    ld   hl, wEntitiesPrivateState1Table          ; $735A: $21 $B0 $C2
    add  hl, de                                   ; $735D: $19
    inc  [hl]                                     ; $735E: $34

.jr_735F
    ld   e, $0F                                   ; $735F: $1E $0F
    ld   d, b                                     ; $7361: $50

jr_004_7362:
    ld   hl, wEntitiesStatusTable                 ; $7362: $21 $80 $C2
    add  hl, de                                   ; $7365: $19
    ld   a, [hl]                                  ; $7366: $7E
    and  a                                        ; $7367: $A7
    jr   z, .jr_73B0                              ; $7368: $28 $46

    ld   hl, wEntitiesStateTable                  ; $736A: $21 $90 $C2
    add  hl, de                                   ; $736D: $19
    ld   a, [hl]                                  ; $736E: $7E
    and  a                                        ; $736F: $A7
    jr   nz, .jr_73B0                             ; $7370: $20 $3E

    ld   hl, wEntitiesTypeTable                   ; $7372: $21 $A0 $C3
    add  hl, de                                   ; $7375: $19
    ld   a, [hl]                                  ; $7376: $7E
    cp   $4F                                      ; $7377: $FE $4F
    jr   nz, .jr_73B0                             ; $7379: $20 $35

    ld   hl, wEntitiesPosXTable                   ; $737B: $21 $00 $C2
    add  hl, de                                   ; $737E: $19
    ld   a, [wD204]                               ; $737F: $FA $04 $D2
    sub  [hl]                                     ; $7382: $96
    add  $04                                      ; $7383: $C6 $04
    cp   $08                                      ; $7385: $FE $08
    jr   nc, .jr_73B0                             ; $7387: $30 $27

    ld   hl, wEntitiesPosYTable                   ; $7389: $21 $10 $C2
    add  hl, de                                   ; $738C: $19
    ld   a, [wD205]                               ; $738D: $FA $05 $D2
    add  $18                                      ; $7390: $C6 $18
    sub  [hl]                                     ; $7392: $96
    add  $06                                      ; $7393: $C6 $06
    cp   $0C                                      ; $7395: $FE $0C
    jr   nc, .jr_73B0                             ; $7397: $30 $17

    ld   hl, wEntitiesStateTable                  ; $7399: $21 $90 $C2
    add  hl, de                                   ; $739C: $19
    ld   [hl], $01                                ; $739D: $36 $01
    ld   a, e                                     ; $739F: $7B
    inc  a                                        ; $73A0: $3C
    ld   hl, wEntitiesPrivateState2Table          ; $73A1: $21 $C0 $C2
    add  hl, bc                                   ; $73A4: $09
    ld   [hl], a                                  ; $73A5: $77
    call GetEntityPrivateCountdown1               ; $73A6: $CD $00 $0C
    ld   [hl], $10                                ; $73A9: $36 $10
    ld   hl, wEntitiesPrivateState4Table          ; $73AB: $21 $40 $C4
    inc  [hl]                                     ; $73AE: $34
    ret                                           ; $73AF: $C9

.jr_73B0
    dec  e                                        ; $73B0: $1D
    ld   a, e                                     ; $73B1: $7B
    cp   $FF                                      ; $73B2: $FE $FF
    jr   nz, jr_004_7362                          ; $73B4: $20 $AC

    ret                                           ; $73B6: $C9

func_004_73B7::
    ld   hl, wEntitiesPrivateState2Table          ; $73B7: $21 $C0 $C2
    add  hl, bc                                   ; $73BA: $09
    ld   a, [hl]                                  ; $73BB: $7E
    and  a                                        ; $73BC: $A7
    jr   z, .ret_73E1                             ; $73BD: $28 $22

    dec  a                                        ; $73BF: $3D
    ld   e, a                                     ; $73C0: $5F
    ld   d, b                                     ; $73C1: $50
    ld   a, [wD204]                               ; $73C2: $FA $04 $D2
    ld   hl, wEntitiesPosXTable                   ; $73C5: $21 $00 $C2
    add  hl, de                                   ; $73C8: $19
    ld   [hl], a                                  ; $73C9: $77
    ld   a, [wD205]                               ; $73CA: $FA $05 $D2
    add  $18                                      ; $73CD: $C6 $18
    ld   hl, wEntitiesPosYTable                   ; $73CF: $21 $10 $C2
    add  hl, de                                   ; $73D2: $19
    ld   [hl], a                                  ; $73D3: $77
    ld   a, $10                                   ; $73D4: $3E $10
    ld   hl, wD206                                ; $73D6: $21 $06 $D2
    sub  [hl]                                     ; $73D9: $96
    add  $FE                                      ; $73DA: $C6 $FE
    ld   hl, wEntitiesPosZTable                   ; $73DC: $21 $10 $C3
    add  hl, de                                   ; $73DF: $19
    ld   [hl], a                                  ; $73E0: $77

.ret_73E1
    ret                                           ; $73E1: $C9

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
    ld   a, [wD204]                               ; $73FE: $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ; $7401: $E0 $EE
    ld   a, [wD205]                               ; $7403: $FA $05 $D2
    ld   hl, wD206                                ; $7406: $21 $06 $D2
    add  [hl]                                     ; $7409: $86
    add  $08                                      ; $740A: $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ; $740C: $E0 $EC
    ld   a, [wD201]                               ; $740E: $FA $01 $D2
    ldh  [hActiveEntitySpriteVariant], a          ; $7411: $E0 $F1
    ld   de, Unknown093SpriteVariants             ; $7413: $11 $E2 $73
    call RenderActiveEntitySpritesPair            ; $7416: $CD $C0 $3B
    ld   a, [wD204]                               ; $7419: $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ; $741C: $E0 $EE
    ld   a, [wD205]                               ; $741E: $FA $05 $D2
    ldh  [hActiveEntityVisualPosY], a             ; $7421: $E0 $EC
    ld   a, [wD200]                               ; $7423: $FA $00 $D2
    ldh  [hActiveEntitySpriteVariant], a          ; $7426: $E0 $F1
    ld   de, Unknown093SpriteVariants             ; $7428: $11 $E2 $73
    call RenderActiveEntitySpritesPair            ; $742B: $CD $C0 $3B
    ld   a, [wD206]                               ; $742E: $FA $06 $D2
    cp   $08                                      ; $7431: $FE $08
    jr   c, .jr_744B                              ; $7433: $38 $16

    ld   a, [wD204]                               ; $7435: $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ; $7438: $E0 $EE
    ld   a, [wD205]                               ; $743A: $FA $05 $D2
    add  $10                                      ; $743D: $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $743F: $E0 $EC
    ld   a, $05                                   ; $7441: $3E $05
    ldh  [hActiveEntitySpriteVariant], a          ; $7443: $E0 $F1
    ld   de, Unknown093SpriteVariants             ; $7445: $11 $E2 $73
    call RenderActiveEntitySpritesPair            ; $7448: $CD $C0 $3B

.jr_744B
    ldh  a, [hFrameCounter]                       ; $744B: $F0 $E7
    and  $01                                      ; $744D: $E6 $01
    jr   nz, .jr_7477                             ; $744F: $20 $26

    ld   a, [wD204]                               ; $7451: $FA $04 $D2
    ldh  [hActiveEntityPosX], a                   ; $7454: $E0 $EE
    ld   a, [wD205]                               ; $7456: $FA $05 $D2
    add  $20                                      ; $7459: $C6 $20
    ldh  [hActiveEntityVisualPosY], a             ; $745B: $E0 $EC
    xor  a                                        ; $745D: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $745E: $E0 $F1
    ld   de, Unknown094SpriteVariants             ; $7460: $11 $FA $73
    ld   a, [wOAMNextAvailableSlot]               ; $7463: $FA $C0 $C3
    push af                                       ; $7466: $F5
    call RenderActiveEntitySpritesPair            ; $7467: $CD $C0 $3B
    pop  af                                       ; $746A: $F1
    ld   e, a                                     ; $746B: $5F
    ld   d, b                                     ; $746C: $50
    ld   hl, wDynamicOAMBuffer+1                  ; $746D: $21 $31 $C0
    add  hl, de                                   ; $7470: $19
    inc  [hl]                                     ; $7471: $34
    inc  hl                                       ; $7472: $23
    inc  hl                                       ; $7473: $23
    inc  hl                                       ; $7474: $23
    inc  hl                                       ; $7475: $23
    dec  [hl]                                     ; $7476: $35

.jr_7477
    ld   hl, wOAMBuffer+$20                       ; $7477: $21 $20 $C0
    ld   a, $50                                   ; $747A: $3E $50
    ld   [hl+], a                                 ; $747C: $22
    ld   a, $28                                   ; $747D: $3E $28
    ld   [hl+], a                                 ; $747F: $22
    ld   a, $7A                                   ; $7480: $3E $7A
    ld   [hl+], a                                 ; $7482: $22
    ldh  a, [hIsGBC]                              ; $7483: $F0 $FE
    and  a                                        ; $7485: $A7
    jr   z, .jr_748C                              ; $7486: $28 $04

    ld   a, $03                                   ; $7488: $3E $03
    jr   jr_004_748F                              ; $748A: $18 $03

.jr_748C
    ld   a, [wD202]                               ; $748C: $FA $02 $D2

jr_004_748F:
    ld   [hl+], a                                 ; $748F: $22
    ld   a, $60                                   ; $7490: $3E $60
    ld   [hl+], a                                 ; $7492: $22
    ld   a, $28                                   ; $7493: $3E $28
    ld   [hl+], a                                 ; $7495: $22
    ld   a, $3E                                   ; $7496: $3E $3E
    ld   [hl+], a                                 ; $7498: $22
    ld   a, [wD202]                               ; $7499: $FA $02 $D2
    ld   [hl+], a                                 ; $749C: $22
    ld   a, $50                                   ; $749D: $3E $50
    ld   [hl+], a                                 ; $749F: $22
    ld   a, $30                                   ; $74A0: $3E $30
    ld   [hl+], a                                 ; $74A2: $22
    ld   a, $7C                                   ; $74A3: $3E $7C
    ld   [hl+], a                                 ; $74A5: $22
    ldh  a, [hIsGBC]                              ; $74A6: $F0 $FE
    and  a                                        ; $74A8: $A7
    jr   z, .jr_74AF                              ; $74A9: $28 $04

    ld   a, $03                                   ; $74AB: $3E $03
    jr   jr_004_74B2                              ; $74AD: $18 $03

.jr_74AF
    ld   a, [wD203]                               ; $74AF: $FA $03 $D2

jr_004_74B2:
    ld   [hl+], a                                 ; $74B2: $22
    ld   a, $60                                   ; $74B3: $3E $60
    ld   [hl+], a                                 ; $74B5: $22
    ld   a, $30                                   ; $74B6: $3E $30
    ld   [hl+], a                                 ; $74B8: $22

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
    ldh  a, [hActiveEntitySpriteVariant]          ; $74D9: $F0 $F1
    cp   $06                                      ; $74DB: $FE $06
    jr   c, .jr_004_74F1                          ; $74DD: $38 $12

    ld   de, Unknown097SpriteVariants             ; $74DF: $11 $B9 $74
    cp   $07                                      ; $74E2: $FE $07
    jr   z, .to_render                            ; $74E4: $28 $09

    ldh  a, [hFrameCounter]                       ; $74E6: $F0 $E7
    and  $10                                      ; $74E8: $E6 $10
    jr   nz, .to_render                           ; $74EA: $20 $03

    ld   de, Unknown096SpriteVariants             ; $74EC: $11 $BD $74

.to_render:
    jr   .render                                  ; $74EF: $18 $1B

.jr_004_74F1
    cp   $03                                      ; $74F1: $FE $03
    jr   nz, .jr_004_74FE                         ; $74F3: $20 $09

    ld   a, [wHasToadstool]                       ; $74F5: $FA $4B $DB
    and  a                                        ; $74F8: $A7
    jp   nz, ClearEntityStatusBank04              ; $74F9: $C2 $7A $6D

    jr   jr_004_7511                              ; $74FC: $18 $13

.jr_004_74FE
    cp   $00                                      ; $74FE: $FE $00
    jr   nz, jr_004_7511                          ; $7500: $20 $0F

    ld   a, [wTradeSequenceItem]                  ; $7502: $FA $0E $DB
    and  a                                        ; $7505: $A7
    jp   nz, ClearEntityStatusBank04              ; $7506: $C2 $7A $6D

    ld   de, Unknown095SpriteVariants             ; $7509: $11 $CD $74

.render:
    call RenderActiveEntitySpritesPair            ; $750C: $CD $C0 $3B
    jr   jr_004_7517                              ; $750F: $18 $06

jr_004_7511:
    ld   de, Data_004_74C1                        ; $7511: $11 $C1 $74
    call RenderActiveEntitySprite                 ; $7514: $CD $77 $3C

jr_004_7517:
    call ReturnIfNonInteractive_04                ; $7517: $CD $A3 $7F
    ldh  a, [hActiveEntityState]                  ; $751A: $F0 $F0
    JP_TABLE                                      ; $751C
._00 dw func_004_7529                             ; $751D
._01 dw func_004_755C                             ; $751F
._02 dw func_004_7566                             ; $7521
._03 dw func_004_75BC                             ; $7523
._04 dw func_004_7681                             ; $7525
._05 dw func_004_7698                             ; $7527

func_004_7529::
    call UpdateEntityPosWithSpeed_04              ; $7529: $CD $CA $6D
    ld   hl, wEntitiesDirectionTable              ; $752C: $21 $80 $C3
    add  hl, bc                                   ; $752F: $09
    ld   a, [hl]                                  ; $7530: $7E
    JP_TABLE                                      ; $7531
._00 dw func_004_753C                             ; $7532
._01 dw func_004_7544                             ; $7534
._02 dw func_004_754C                             ; $7536
._03 dw func_004_7554                             ; $7538
._04 dw func_004_7543                             ; $753A

func_004_753C::
    ldh  a, [hActiveEntityPosX]                   ; $753C: $F0 $EE
    cp   $3A                                      ; $753E: $FE $3A
    jp   c, label_004_76AA                        ; $7540: $DA $AA $76

func_004_7543::
    ret                                           ; $7543: $C9

func_004_7544::
    ldh  a, [hActiveEntityVisualPosY]             ; $7544: $F0 $EC
    cp   $4E                                      ; $7546: $FE $4E
    jp   nc, label_004_76AA                       ; $7548: $D2 $AA $76

    ret                                           ; $754B: $C9

func_004_754C::
    ldh  a, [hActiveEntityPosX]                   ; $754C: $F0 $EE
    cp   $78                                      ; $754E: $FE $78
    jp   nc, label_004_76AA                       ; $7550: $D2 $AA $76

    ret                                           ; $7553: $C9

func_004_7554::
    ldh  a, [hActiveEntityVisualPosY]             ; $7554: $F0 $EC
    cp   $2E                                      ; $7556: $FE $2E
    jp   c, label_004_76AA                        ; $7558: $DA $AA $76

    ret                                           ; $755B: $C9

func_004_755C::
    call func_004_6E55                            ; $755C: $CD $55 $6E
    ld   a, e                                     ; $755F: $7B
    xor  $01                                      ; $7560: $EE $01
    ld   e, a                                     ; $7562: $5F
    jp   func_004_723B                            ; $7563: $C3 $3B $72

func_004_7566::
    ld   a, [wIsMarinFollowingLink]               ; $7566: $FA $73 $DB
    and  a                                        ; $7569: $A7
    jr   z, .jr_7570                              ; $756A: $28 $04

    ld   a, $02                                   ; $756C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $756E: $E0 $A1

.jr_7570
    call AddEntityZSpeedToPos_04                  ; $7570: $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ; $7573: $21 $20 $C3
    add  hl, bc                                   ; $7576: $09
    dec  [hl]                                     ; $7577: $35
    dec  [hl]                                     ; $7578: $35
    ld   hl, wEntitiesPosZTable                   ; $7579: $21 $10 $C3
    add  hl, bc                                   ; $757C: $09
    ld   a, [hl]                                  ; $757D: $7E
    and  $80                                      ; $757E: $E6 $80
    jr   z, jr_004_7598                           ; $7580: $28 $16

    xor  a                                        ; $7582: $AF
    ld   [hl], a                                  ; $7583: $77
    ld   hl, wEntitiesSpeedZTable                 ; $7584: $21 $20 $C3
    add  hl, bc                                   ; $7587: $09
    ld   a, [hl]                                  ; $7588: $7E
    sra  a                                        ; $7589: $CB $2F
    cpl                                           ; $758B: $2F
    ld   [hl], a                                  ; $758C: $77
    cp   $07                                      ; $758D: $FE $07
    jr   nc, .jr_7594                             ; $758F: $30 $03

    ld   [hl], b                                  ; $7591: $70
    jr   jr_004_7598                              ; $7592: $18 $04

.jr_7594
    ld   a, JINGLE_BUMP                           ; $7594: $3E $09
    ldh  [hJingle], a                             ; $7596: $E0 $F2

jr_004_7598:
    ldh  a, [hFrameCounter]                       ; $7598: $F0 $E7
    and  $03                                      ; $759A: $E6 $03
    jr   nz, .ret_75A9                            ; $759C: $20 $0B

    ld   hl, wEntitiesPosYTable                   ; $759E: $21 $10 $C2
    add  hl, bc                                   ; $75A1: $09
    ld   a, [hl]                                  ; $75A2: $7E
    cp   $56                                      ; $75A3: $FE $56
    jr   z, jr_004_75AA                           ; $75A5: $28 $03

    inc  a                                        ; $75A7: $3C
    ld   [hl], a                                  ; $75A8: $77

.ret_75A9
    ret                                           ; $75A9: $C9

jr_004_75AA:
    add  $0A                                      ; $75AA: $C6 $0A
    ld   [hl], a                                  ; $75AC: $77
    ld   hl, wEntitiesPosZTable                   ; $75AD: $21 $10 $C3
    add  hl, bc                                   ; $75B0: $09
    ld   [hl], $0A                                ; $75B1: $36 $0A
    jp   IncrementEntityState                     ; $75B3: $C3 $12 $3B

TrendyPrizeDialogs::
._0 db_dialog_low Dialog044 ; Yoshi
._1 db_dialog_low Dialog043 ; unused
._2 db_dialog_low Dialog042 ; 30 Rupees
._3 db_dialog_low Dialog041 ; Magic Powder
._4 db_dialog_low Dialog03D ; Shield
._5 db_dialog_low Dialog02A ; 1 Heart

func_004_75BC::
    ld   a, [wIsMarinFollowingLink]               ; $75BC: $FA $73 $DB
    and  a                                        ; $75BF: $A7
    jr   z, .jr_75C6                              ; $75C0: $28 $04

    ld   a, $02                                   ; $75C2: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $75C4: $E0 $A1

.jr_75C6
    call AddEntityZSpeedToPos_04                  ; $75C6: $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ; $75C9: $21 $20 $C3
    add  hl, bc                                   ; $75CC: $09
    dec  [hl]                                     ; $75CD: $35
    dec  [hl]                                     ; $75CE: $35
    ld   hl, wEntitiesPosZTable                   ; $75CF: $21 $10 $C3
    add  hl, bc                                   ; $75D2: $09
    ld   a, [hl]                                  ; $75D3: $7E
    and  $80                                      ; $75D4: $E6 $80
    jp   z, label_004_7680                        ; $75D6: $CA $80 $76

    xor  a                                        ; $75D9: $AF
    ld   [hl], a                                  ; $75DA: $77
    ld   hl, wEntitiesSpeedZTable                 ; $75DB: $21 $20 $C3
    add  hl, bc                                   ; $75DE: $09
    ld   a, [hl]                                  ; $75DF: $7E
    sra  a                                        ; $75E0: $CB $2F
    cpl                                           ; $75E2: $2F
    ld   [hl], a                                  ; $75E3: $77
    cp   $07                                      ; $75E4: $FE $07
    jr   nc, .jr_75EA                             ; $75E6: $30 $02

    xor  a                                        ; $75E8: $AF
    ld   [hl], a                                  ; $75E9: $77

.jr_75EA
    ldh  a, [hActiveEntitySpriteVariant]          ; $75EA: $F0 $F1
    cp   $06                                      ; $75EC: $FE $06
    jr   c, .jr_75F8                              ; $75EE: $38 $08

    call_open_dialog Dialog0F9                    ; $75F0
    jp   IncrementEntityState                     ; $75F5: $C3 $12 $3B

.jr_75F8
    ldh  a, [hActiveEntityPosX]                   ; $75F8: $F0 $EE
    ld   hl, hLinkPositionX                       ; $75FA: $21 $98 $FF
    sub  [hl]                                     ; $75FD: $96
    add  $07                                      ; $75FE: $C6 $07
    cp   $0E                                      ; $7600: $FE $0E
    ret  nc                                       ; $7602: $D0

    ldh  a, [hActiveEntityVisualPosY]             ; $7603: $F0 $EC
    ld   hl, hLinkPositionY                       ; $7605: $21 $99 $FF
    sub  [hl]                                     ; $7608: $96
    add  $05                                      ; $7609: $C6 $05
    cp   $0A                                      ; $760B: $FE $0A
    ret  nc                                       ; $760D: $D0

    ld   a, [wD210]                               ; $760E: $FA $10 $D2
    ld   e, a                                     ; $7611: $5F
    ld   d, b                                     ; $7612: $50
    ld   hl, wEntitiesPrivateCountdown3Table      ; $7613: $21 $80 $C4
    add  hl, de                                   ; $7616: $19
    ld   a, [hl]                                  ; $7617: $7E
    and  a                                        ; $7618: $A7
    ret  nz                                       ; $7619: $C0

    ld   [hl], $18                                ; $761A: $36 $18
    ldh  a, [hActiveEntitySpriteVariant]          ; $761C: $F0 $F1
    cp   $00                                      ; $761E: $FE $00
    jr   nz, .jr_762D                             ; $7620: $20 $0B

    ld   a, $01                                   ; $7622: $3E $01
    ld   [wTradeSequenceItem], a                  ; $7624: $EA $0E $DB
    call CreateTradingItemEntity                  ; $7627: $CD $0C $0C
    jp   ClearEntityStatusBank04                  ; $762A: $C3 $7A $6D

.jr_762D
    call ClearEntityStatusBank04                  ; $762D: $CD $7A $6D
    ld   hl, hWaveSfx                             ; $7630: $21 $F3 $FF
    ld   [hl], WAVE_SFX_SEASHELL                  ; $7633: $36 $01

    ldh  a, [hActiveEntitySpriteVariant]          ; $7635: $F0 $F1
    ld   e, a                                     ; $7637: $5F
    ld   d, b                                     ; $7638: $50

    ld   hl, TrendyPrizeDialogs                   ; $7639: $21 $B6 $75
    add  hl, de                                   ; $763C: $19
    ld   a, [hl]                                  ; $763D: $7E
    call OpenDialogInTable0                       ; $763E: $CD $85 $23

    ldh  a, [hActiveEntitySpriteVariant]          ; $7641: $F0 $F1
    dec  a                                        ; $7643: $3D
    jr   nz, .jr_7647                             ; $7644: $20 $01

    ret                                           ; $7646: $C9

.jr_7647
    dec  a                                        ; $7647: $3D
    jr   nz, .jr_7653                             ; $7648: $20 $09

    ld   a, [wAddRupeeBufferLow]                  ; $764A: $FA $90 $DB
    add  $1E                                      ; $764D: $C6 $1E
    ld   [wAddRupeeBufferLow], a                  ; $764F: $EA $90 $DB
    ret                                           ; $7652: $C9

.jr_7653
    dec  a                                        ; $7653: $3D
    jr   nz, jr_004_7673                          ; $7654: $20 $1D

    ld   hl, wMaxMagicPowder                      ; $7656: $21 $76 $DB
    ld   a, [wMagicPowderCount]                   ; $7659: $FA $4C $DB
    cp   [hl]                                     ; $765C: $BE
    jr   nc, .jr_7666                             ; $765D: $30 $07

    add  $10                                      ; $765F: $C6 $10
    daa                                           ; $7661: $27
    cp   [hl]                                     ; $7662: $BE
    jr   c, .jr_7666                              ; $7663: $38 $01

    ld   a, [hl]                                  ; $7665: $7E

.jr_7666
    ld   [wMagicPowderCount], a                   ; $7666: $EA $4C $DB
    ld   d, $0C                                   ; $7669: $16 $0C
    call GiveInventoryItem_trampoline             ; $766B: $CD $6B $3E
    ld   a, REPLACE_TILES_MAGIC_POWDER            ; $766E: $3E $0B
    ldh  [hReplaceTiles], a                       ; $7670: $E0 $A5
    ret                                           ; $7672: $C9

jr_004_7673:
    dec  a                                        ; $7673: $3D
    jr   nz, .jr_767B                             ; $7674: $20 $05

    ld   d, $04                                   ; $7676: $16 $04
    jp   GiveInventoryItem_trampoline             ; $7678: $C3 $6B $3E

.jr_767B
    ld   a, $FF                                   ; $767B: $3E $FF
    ld   [wAddHealthBuffer], a                    ; $767D: $EA $93 $DB

label_004_7680:
    ret                                           ; $7680: $C9

func_004_7681::
    ld   a, $02                                   ; $7681: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7683: $E0 $A1
    ld   [wC167], a                               ; $7685: $EA $67 $C1
    ld   a, [wItemUsageContext]                   ; $7688: $FA $AD $C1
    and  a                                        ; $768B: $A7
    ret  nz                                       ; $768C: $C0

    ld   [wIsMarinInAnimalVillage], a             ; $768D: $EA $74 $DB
    ld   a, $18                                   ; $7690: $3E $18
    ld   [wLoadPreviousMapCountdown], a           ; $7692: $EA $BC $C1
    jp   IncrementEntityState                     ; $7695: $C3 $12 $3B

func_004_7698::
    ld   a, $02                                   ; $7698: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $769A: $E0 $A1
    ld   [wC167], a                               ; $769C: $EA $67 $C1
    ret                                           ; $769F: $C9

Data_004_76A0::
    db   $FC, $00, $04, $00, $00

Data_004_76A5::
    db   $00, $04, $00, $FC, $00

label_004_76AA:
    ld   hl, wEntitiesDirectionTable              ; $76AA: $21 $80 $C3
    add  hl, bc                                   ; $76AD: $09
    ld   a, [hl]                                  ; $76AE: $7E
    inc  a                                        ; $76AF: $3C
    and  $03                                      ; $76B0: $E6 $03
    ld   [hl], a                                  ; $76B2: $77

func_004_76B3::
    ld   e, a                                     ; $76B3: $5F
    ld   d, b                                     ; $76B4: $50
    ld   hl, Data_004_76A0                        ; $76B5: $21 $A0 $76
    add  hl, de                                   ; $76B8: $19
    ld   a, [hl]                                  ; $76B9: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $76BA: $21 $40 $C2
    add  hl, bc                                   ; $76BD: $09
    ld   [hl], a                                  ; $76BE: $77
    ld   hl, Data_004_76A5                        ; $76BF: $21 $A5 $76
    add  hl, de                                   ; $76C2: $19
    ld   a, [hl]                                  ; $76C3: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $76C4: $21 $50 $C2
    add  hl, bc                                   ; $76C7: $09
    ld   [hl], a                                  ; $76C8: $77
    ret                                           ; $76C9: $C9
