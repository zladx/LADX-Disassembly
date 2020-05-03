;
; Screen for deleting a saved file
;

FileDeletionEntryPoint::
    call func_5DC0                                ; $4CFB: $CD $C0 $5D
    ld   a, [wGameplaySubtype]                    ; $4CFE: $FA $96 $DB
    JP_TABLE                                      ; $4D01
._00 dw label_4D1A                                ; $4D02
._01 dw label_4D2C                                ; $4D04
._02 dw label_4D56                                ; $4D06
._03 dw label_4D65                                ; $4D08
._04 dw label_4D6D                                ; $4D0A
._05 dw label_4D79                                ; $4D0C
._06 dw label_4D82                                ; $4D0E
._07 dw label_4D88                                ; $4D10
._08 dw label_4D39                                ; $4D12
._09 dw label_4D49                                ; $4D14
._0A dw label_4E06                                ; $4D16
._0B dw label_4E6B                                ; $4D18

label_4D1A::
    ldh  a, [hIsGBC]                              ; $4D1A: $F0 $FE
    and  a                                        ; $4D1C: $A7
    jr   z, label_4D53                            ; $4D1D: $28 $34

    ld   a, $01                                   ; $4D1F: $3E $01
    call ClearFileMenuBG_trampoline               ; $4D21: $CD $FA $08
    ld   a, $01                                   ; $4D24: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4D26: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D29: $C3 $D6 $44

label_4D2C::
    ldh  a, [hIsGBC]                              ; $4D2C: $F0 $FE
    and  a                                        ; $4D2E: $A7
    jr   z, label_4D53                            ; $4D2F: $28 $22

    ld   a, $02                                   ; $4D31: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4D33: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D36: $C3 $D6 $44

label_4D39::
    ldh  a, [hIsGBC]                              ; $4D39: $F0 $FE
    and  a                                        ; $4D3B: $A7
    jr   z, label_4D53                            ; $4D3C: $28 $15

    call LoadFileMenuBG_trampoline                ; $4D3E: $CD $05 $09
    ld   a, $01                                   ; $4D41: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4D43: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D46: $C3 $D6 $44

label_4D49::
    ldh  a, [hIsGBC]                              ; $4D49: $F0 $FE
    and  a                                        ; $4D4B: $A7
    jr   z, label_4D53                            ; $4D4C: $28 $05

    ld   a, $02                                   ; $4D4E: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4D50: $EA $D1 $DD

label_4D53::
    jp   IncrementGameplaySubtypeAndReturn        ; $4D53: $C3 $D6 $44

label_4D56::
    ld   a, $08                                   ; $4D56: $3E $08
    ld   [wTileMapToLoad], a                      ; $4D58: $EA $FE $D6
    xor  a                                        ; $4D5B: $AF
    ld   [wSaveSlot], a                           ; $4D5C: $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ; $4D5F: $EA $00 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $4D62: $C3 $D6 $44

label_4D65::
    ld   a, $06                                   ; $4D65: $3E $06
    ld   [wBGMapToLoad], a                        ; $4D67: $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $4D6A: $C3 $D6 $44

label_4D6D::
    call label_4D8B                               ; $4D6D: $CD $8B $4D
    call label_4D94                               ; $4D70: $CD $94 $4D
    call label_4D9D                               ; $4D73: $CD $9D $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D76: $C3 $D6 $44

label_4D79::
    call label_4DA6                               ; $4D79: $CD $A6 $4D
    call label_4DBE                               ; $4D7C: $CD $BE $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D7F: $C3 $D6 $44

label_4D82::
    call label_4DD6                               ; $4D82: $CD $D6 $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D85: $C3 $D6 $44

label_4D88::
    jp   CopyDeathCountsToBG                      ; $4D88: $C3 $0C $48

label_4D8B::
    ld   bc, $98C5                                ; $4D8B: $01 $C5 $98
    ld   de, $DB80                                ; $4D8E: $11 $80 $DB
    jp   func_4852                                ; $4D91: $C3 $52 $48

label_4D94::
    ld   bc, $9925                                ; $4D94: $01 $25 $99
    ld   de, $DB85                                ; $4D97: $11 $85 $DB
    jp   func_4852                                ; $4D9A: $C3 $52 $48

label_4D9D::
    ld   bc, $9985                                ; $4D9D: $01 $85 $99
    ld   de, $DB8A                                ; $4DA0: $11 $8A $DB
    jp   func_4852                                ; $4DA3: $C3 $52 $48

label_4DA6::
    ld   a, [wSaveFilesCount]                     ; $4DA6: $FA $A7 $DB
    and  $01                                      ; $4DA9: $E6 $01
    jr   z, label_4DBD                            ; $4DAB: $28 $10

    xor  a                                        ; $4DAD: $AF
    ldh  [hScratch4], a                           ; $4DAE: $E0 $DB
    ld   a, [$DC06]                               ; $4DB0: $FA $06 $DC
    ldh  [hScratch2], a                           ; $4DB3: $E0 $D9
    ld   a, [$DC09]                               ; $4DB5: $FA $09 $DC
    ldh  [hScratch3], a                           ; $4DB8: $E0 $DA
    jp   label_5D53                               ; $4DBA: $C3 $53 $5D

label_4DBD::
    ret                                           ; $4DBD: $C9

label_4DBE::
    ld   a, [wSaveFilesCount]                     ; $4DBE: $FA $A7 $DB
    and  $02                                      ; $4DC1: $E6 $02
    jr   z, label_4DBD                            ; $4DC3: $28 $F8

    ld   a, $01                                   ; $4DC5: $3E $01
    ldh  [hScratch4], a                           ; $4DC7: $E0 $DB
    ld   a, [$DC07]                               ; $4DC9: $FA $07 $DC
    ldh  [hScratch2], a                           ; $4DCC: $E0 $D9
    ld   a, [$DC0A]                               ; $4DCE: $FA $0A $DC
    ldh  [hScratch3], a                           ; $4DD1: $E0 $DA
    jp   label_5D53                               ; $4DD3: $C3 $53 $5D

label_4DD6::
    ld   a, [wSaveFilesCount]                     ; $4DD6: $FA $A7 $DB
    and  $04                                      ; $4DD9: $E6 $04
    jr   z, label_4DBD                            ; $4DDB: $28 $E0

    ld   a, $02                                   ; $4DDD: $3E $02
    ldh  [hScratch4], a                           ; $4DDF: $E0 $DB
    ld   a, [$DC08]                               ; $4DE1: $FA $08 $DC
    ldh  [hScratch2], a                           ; $4DE4: $E0 $D9
    ld   a, [$DC0B]                               ; $4DE6: $FA $0B $DC
    ldh  [hScratch3], a                           ; $4DE9: $E0 $DA
    jp   label_5D53                               ; $4DEB: $C3 $53 $5D

Data_001_4DEE::
    db   $98, $A5, $44, $7E, $98, $C5, $44, $7E   ; $4DEE
    db   $99, $05, $44, $7E, $99, $25, $44, $7E   ; $4DF6
    db   $99, $65, $44, $7E, $99, $85, $44, $7E   ; $4DFE

label_4E06::
    call label_6BA8                               ; $4E06: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $4E09: $F0 $CC
    and  $08                                      ; $4E0B: $E6 $08
    jr   z, label_4E18                            ; $4E0D: $28 $09

    ld   a, [wSaveSlot]                           ; $4E0F: $FA $A6 $DB
    inc  a                                        ; $4E12: $3C
    and  $03                                      ; $4E13: $E6 $03
    ld   [wSaveSlot], a                           ; $4E15: $EA $A6 $DB

label_4E18::
    ldh  a, [hJoypadState]                        ; $4E18: $F0 $CC
    and  $04                                      ; $4E1A: $E6 $04
    jr   z, label_4E2B                            ; $4E1C: $28 $0D

    ld   a, [wSaveSlot]                           ; $4E1E: $FA $A6 $DB
    dec  a                                        ; $4E21: $3D
    cp   $FF                                      ; $4E22: $FE $FF
    jr   nz, label_4E28                           ; $4E24: $20 $02

    ld   a, $03                                   ; $4E26: $3E $03

label_4E28::
    ld   [wSaveSlot], a                           ; $4E28: $EA $A6 $DB

label_4E2B::
    ldh  a, [hJoypadState]                        ; $4E2B: $F0 $CC
    and  $90                                      ; $4E2D: $E6 $90
    jr   z, label_4E67                            ; $4E2F: $28 $36

    ld   a, [wSaveSlot]                           ; $4E31: $FA $A6 $DB
    cp   $03                                      ; $4E34: $FE $03
    jr   nz, label_4E3B                           ; $4E36: $20 $03

    jp   label_4555                               ; $4E38: $C3 $55 $45

label_4E3B::
    call PlayValidationJingleAndReturn            ; $4E3B: $CD $BE $49
    call IncrementGameplaySubtypeAndReturn        ; $4E3E: $CD $D6 $44
    jr   label_4E55                               ; $4E41: $18 $12

Data_001_4E43::
    db   $99, $E4, $0D, $7E, $7E, $10, $14, $08   ; $4E43
    db   $13, $7E, $7E, $7E, $7E, $0E, $0A, $7E   ; $4E4B
    db   $7E, $00                                 ; $4E53

label_4E55::
    ld   hl, wRequestDestinationHigh              ; $4E55: $21 $01 $D6
    ld   de, Data_001_4E43                        ; $4E58: $11 $43 $4E
    ld   c, $11                                   ; $4E5B: $0E $11

.loop
    ld   a, [de]                                  ; $4E5D: $1A
    inc  de                                       ; $4E5E: $13
    ld   [hl+], a                                 ; $4E5F: $22
    dec  c                                        ; $4E60: $0D
    ld   a, c                                     ; $4E61: $79
    cp   $FF                                      ; $4E62: $FE $FF
    jr   nz, .loop                                ; $4E64: $20 $F7

    ret                                           ; $4E66: $C9

label_4E67::
    call label_4954                               ; $4E67: $CD $54 $49
    ret                                           ; $4E6A: $C9

label_4E6B::
    ldh  a, [hJoypadState]                        ; $4E6B: $F0 $CC
    bit  5, a                                     ; $4E6D: $CB $6F
    jr   nz, label_4E9E                           ; $4E6F: $20 $2D

    and  $90                                      ; $4E71: $E6 $90
    jr   z, label_4ED9                            ; $4E73: $28 $64

    ld   a, [wCreditsScratch0]                    ; $4E75: $FA $00 $D0
    and  a                                        ; $4E78: $A7
    jp   z, label_4555                            ; $4E79: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $4E7C: $CD $BE $49
    ld   a, [wSaveSlot]                           ; $4E7F: $FA $A6 $DB
    sla  a                                        ; $4E82: $CB $27
    ld   e, a                                     ; $4E84: $5F
    ld   d, $00                                   ; $4E85: $16 $00
    ld   hl, label_49F8                           ; $4E87: $21 $F8 $49
    add  hl, de                                   ; $4E8A: $19
    ld   a, [hl+]                                 ; $4E8B: $2A
    ld   h, [hl]                                  ; $4E8C: $66
    ld   l, a                                     ; $4E8D: $6F
    ld   de, InterruptLCDStatus.setScrollY        ; $4E8E: $11 $A8 $03

label_4E91::
    call EnableExternalRAMWriting                 ; $4E91: $CD $D0 $27
    xor  a                                        ; $4E94: $AF
    ld   [hl+], a                                 ; $4E95: $22
    dec  de                                       ; $4E96: $1B
    ld   a, e                                     ; $4E97: $7B
    or   d                                        ; $4E98: $B2
    jr   nz, label_4E91                           ; $4E99: $20 $F6

    jp   label_4555                               ; $4E9B: $C3 $55 $45

label_4E9E::
    call label_4EE5                               ; $4E9E: $CD $E5 $4E
    call label_4EBB                               ; $4EA1: $CD $BB $4E
    ld   hl, wGameplaySubtype                     ; $4EA4: $21 $96 $DB
    dec  [hl]                                     ; $4EA7: $35
    ret                                           ; $4EA8: $C9

Data_001_4EA9::
    db   $99, $E4, $0D, $11, $04, $13, $14, $11   ; $4EA9
    db   $0D, $7E, $13, $0E, $7E, $0C, $04, $0D   ; $4EB1
    db   $14, $00                                 ; $4EB9

label_4EBB::
    ld   a, [wRequests]                           ; $4EBB: $FA $00 $D6
    ld   e, a                                     ; $4EBE: $5F
    add  $11                                      ; $4EBF: $C6 $11
    ld   [wRequests], a                           ; $4EC1: $EA $00 $D6
    ld   d, $00                                   ; $4EC4: $16 $00
    ld   hl, wRequestDestinationHigh              ; $4EC6: $21 $01 $D6
    add  hl, de                                   ; $4EC9: $19
    ld   de, Data_001_4EA9                        ; $4ECA: $11 $A9 $4E
    ld   c, $11                                   ; $4ECD: $0E $11

.loop
    ld   a, [de]                                  ; $4ECF: $1A
    inc  de                                       ; $4ED0: $13
    ld   [hl+], a                                 ; $4ED1: $22
    dec  c                                        ; $4ED2: $0D
    ld   a, c                                     ; $4ED3: $79
    cp   $FF                                      ; $4ED4: $FE $FF
    jr   nz, .loop                                ; $4ED6: $20 $F7

    ret                                           ; $4ED8: $C9

label_4ED9::
    call label_4F0C                               ; $4ED9: $CD $0C $4F
    call label_4954                               ; $4EDC: $CD $54 $49
    ldh  a, [hFrameCounter]                       ; $4EDF: $F0 $E7
    and  $10                                      ; $4EE1: $E6 $10
    jr   z, label_4EEF                            ; $4EE3: $28 $0A

label_4EE5::
    ld   a, [wSaveSlot]                           ; $4EE5: $FA $A6 $DB
    JP_TABLE                                      ; $4EE8
._00 dw label_4D8B                                ; $4EE9
._01 dw label_4D94                                ; $4EEB
._02 dw label_4D9D                                ; $4EED

label_4EEF::
    ld   a, [wSaveSlot]                           ; $4EEF: $FA $A6 $DB
    rla                                           ; $4EF2: $17
    rla                                           ; $4EF3: $17
    rla                                           ; $4EF4: $17
    and  $F8                                      ; $4EF5: $E6 $F8
    ld   e, a                                     ; $4EF7: $5F
    ld   d, $00                                   ; $4EF8: $16 $00
    ld   hl, Data_001_4DEE                        ; $4EFA: $21 $EE $4D
    add  hl, de                                   ; $4EFD: $19
    ld   de, wRequestDestinationHigh              ; $4EFE: $11 $01 $D6
    ld   c, $08                                   ; $4F01: $0E $08

label_4F03::
    ld   a, [hl+]                                 ; $4F03: $2A
    ld   [de], a                                  ; $4F04: $12
    inc  de                                       ; $4F05: $13
    dec  c                                        ; $4F06: $0D
    jr   nz, label_4F03                           ; $4F07: $20 $FA

    xor  a                                        ; $4F09: $AF
    ld   [de], a                                  ; $4F0A: $12
    ret                                           ; $4F0B: $C9

label_4F0C::
    ldh  a, [hJoypadState]                        ; $4F0C: $F0 $CC
    and  $03                                      ; $4F0E: $E6 $03
    jr   z, label_4F1D                            ; $4F10: $28 $0B

    call label_6BAE                               ; $4F12: $CD $AE $6B
    ld   a, [wCreditsScratch0]                    ; $4F15: $FA $00 $D0
    xor  $01                                      ; $4F18: $EE $01
    ld   [wCreditsScratch0], a                    ; $4F1A: $EA $00 $D0

label_4F1D::
    ldh  a, [hFrameCounter]                       ; $4F1D: $F0 $E7
    and  $10                                      ; $4F1F: $E6 $10
    jr   nz, label_4F3A                           ; $4F21: $20 $17

    ld   a, [wCreditsScratch0]                    ; $4F23: $FA $00 $D0
    ld   e, a                                     ; $4F26: $5F
    ld   a, $28                                   ; $4F27: $3E $28
    dec  e                                        ; $4F29: $1D
    jr   nz, label_4F2E                           ; $4F2A: $20 $02

    ld   a, $6C                                   ; $4F2C: $3E $6C

label_4F2E::
    ld   hl, $C00C                                ; $4F2E: $21 $0C $C0
    ld   [hl], $88                                ; $4F31: $36 $88
    inc  hl                                       ; $4F33: $23
    ld   [hl+], a                                 ; $4F34: $22
    ld   a, $BE                                   ; $4F35: $3E $BE
    ld   [hl+], a                                 ; $4F37: $22
    xor  a                                        ; $4F38: $AF
    ld   [hl], a                                  ; $4F39: $77

label_4F3A::
    ret                                           ; $4F3A: $C9

Data_001_4F3B::
    db   $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7   ; $4F3B
    db   $B8, $B9                                 ; $4F43

CopyDigitsToFileScreenBG::
    push hl                                       ; $4F45: $E5
    ld   a, [wRequests]                           ; $4F46: $FA $00 $D6
    ld   c, a                                     ; $4F49: $4F
    add  $06                                      ; $4F4A: $C6 $06
    ld   [wRequests], a                           ; $4F4C: $EA $00 $D6
    ld   b, $00                                   ; $4F4F: $06 $00
    ld   hl, wRequestDestinationHigh              ; $4F51: $21 $01 $D6
    add  hl, bc                                   ; $4F54: $09
    ld   a, d                                     ; $4F55: $7A
    ld   [hl+], a                                 ; $4F56: $22
    ld   a, e                                     ; $4F57: $7B
    ld   [hl+], a                                 ; $4F58: $22
    ld   a, $02                                   ; $4F59: $3E $02
    ld   [hl+], a                                 ; $4F5B: $22
    pop  bc                                       ; $4F5C: $C1
    push hl                                       ; $4F5D: $E5
    ld   a, c                                     ; $4F5E: $79
    and  $0F                                      ; $4F5F: $E6 $0F
    ld   e, a                                     ; $4F61: $5F
    ld   d, $00                                   ; $4F62: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F64: $21 $3B $4F
    add  hl, de                                   ; $4F67: $19
    ld   a, [hl]                                  ; $4F68: $7E
    pop  hl                                       ; $4F69: $E1
    ld   [hl+], a                                 ; $4F6A: $22
    push hl                                       ; $4F6B: $E5
    ld   a, b                                     ; $4F6C: $78
    and  $F0                                      ; $4F6D: $E6 $F0
    swap a                                        ; $4F6F: $CB $37
    ld   e, a                                     ; $4F71: $5F
    ld   d, $00                                   ; $4F72: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F74: $21 $3B $4F
    add  hl, de                                   ; $4F77: $19
    ld   a, [hl]                                  ; $4F78: $7E
    pop  hl                                       ; $4F79: $E1
    ld   [hl+], a                                 ; $4F7A: $22
    push hl                                       ; $4F7B: $E5
    ld   a, b                                     ; $4F7C: $78
    and  $0F                                      ; $4F7D: $E6 $0F
    ld   e, a                                     ; $4F7F: $5F
    ld   d, $00                                   ; $4F80: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F82: $21 $3B $4F
    add  hl, de                                   ; $4F85: $19
    ld   a, [hl]                                  ; $4F86: $7E
    pop  hl                                       ; $4F87: $E1
    ld   [hl+], a                                 ; $4F88: $22
    xor  a                                        ; $4F89: $AF
    ld   [hl], a                                  ; $4F8A: $77
    ret                                           ; $4F8B: $C9

