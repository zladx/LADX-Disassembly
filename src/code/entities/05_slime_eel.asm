EntityInitSlimeEel::
    call GetEntityTransitionCountdown             ; $6CC6: $CD $05 $0C
    ld   [hl], $80                                ; $6CC9: $36 $80
    xor  a                                        ; $6CCB: $AF
    ld   [wD200], a                               ; $6CCC: $EA $00 $D2
    ld   [wD203], a                               ; $6CCF: $EA $03 $D2
    ld   [wD204], a                               ; $6CD2: $EA $04 $D2
    ld   hl, wEntitiesPrivateState5Table          ; $6CD5: $21 $90 $C3
    add  hl, bc                                   ; $6CD8: $09
    ld   [hl], $01                                ; $6CD9: $36 $01
    ret

SlimeEelEntityHandler::
    call label_394D                               ; $6CDC: $CD $4D $39
    call BossIntro                                ; $6CDF: $CD $E8 $3E
    call DecrementEntityIgnoreHitsCountdown       ; $6CE2: $CD $56 $0C
    ld   hl, wEntitiesPrivateState1Table          ; $6CE5: $21 $B0 $C2
    add  hl, bc                                   ; $6CE8: $09
    ld   a, [hl]                                  ; $6CE9: $7E
    JP_TABLE                                      ; $6CEA
._00 dw func_005_6CF1                             ; $6CEB
._01 dw func_005_72E6                             ; $6CED
._02 dw func_005_75D1                             ; $6CEF

func_005_6CF1::
    ld   a, c                                     ; $6CF1: $79
    ld   [wD201], a                               ; $6CF2: $EA $01 $D2
    ldh  a, [hActiveEntityState]                  ; $6CF5: $F0 $F0
    JP_TABLE                                      ; $6CF7
._00 dw func_005_6D00                             ; $6CF8
._01 dw func_005_6D42                             ; $6CFA
._02 dw func_005_6E7D                             ; $6CFC
._03 dw func_005_70EB                             ; $6CFE

func_005_6D00::
    call GetEntityTransitionCountdown             ; $6D00: $CD $05 $0C
    ret  nz                                       ; $6D03: $C0

    ld   [hl], $80                                ; $6D04: $36 $80
    ld   a, $FF                                   ; $6D06: $3E $FF
    ld   [wC157], a                               ; $6D08: $EA $57 $C1
    ld   a, NOISE_SFX_SLIME_EEL_FLOOR_BREAK       ; $6D0B: $3E $3E
    ldh  [hNoiseSfx], a                           ; $6D0D: $E0 $F4
    ld   [wD3E8], a                               ; $6D0F: $EA $E8 $D3
    ld   a, $04                                   ; $6D12: $3E $04
    ld   [wC158], a                               ; $6D14: $EA $58 $C1
    jp   IncrementEntityState                     ; $6D17: $C3 $12 $3B

Data_005_6D1A::
    db   $20, $60, $20, $60

Data_005_6D1E::
    db   $00, $00, $70, $70

Data_005_6D22::
    db   $08, $08, $08, $08, $09, $0B, $0B, $0A, $08, $08, $08, $08, $09, $0B, $0B, $0A
    db   $05, $07, $07, $06, $04, $04, $04, $04, $05, $07, $07, $06, $04, $04, $04, $04

func_005_6D42::
    ld   a, $38                                   ; $6D42: $3E $38
    ldh  [hIntersectedObjectLeft], a              ; $6D44: $E0 $CE
    add  $10                                      ; $6D46: $C6 $10
    ld   hl, wEntitiesPosXTable                   ; $6D48: $21 $00 $C2
    add  hl, bc                                   ; $6D4B: $09
    ld   [hl], a                                  ; $6D4C: $77
    ld   a, $30                                   ; $6D4D: $3E $30
    ldh  [hIntersectedObjectTop], a               ; $6D4F: $E0 $CD
    add  $18                                      ; $6D51: $C6 $18
    ld   hl, wEntitiesPosYTable                   ; $6D53: $21 $10 $C2
    add  hl, bc                                   ; $6D56: $09
    ld   [hl], a                                  ; $6D57: $77
    call GetEntityTransitionCountdown             ; $6D58: $CD $05 $0C
    jp   nz, label_005_6E30                       ; $6D5B: $C2 $30 $6E

    ld   [hl], $FF                                ; $6D5E: $36 $FF
    xor  a                                        ; $6D60: $AF
    ld   [wD3E8], a                               ; $6D61: $EA $E8 $D3
    call IncrementEntityState                     ; $6D64: $CD $12 $3B
    ld   a, $AF                                   ; $6D67: $3E $AF
    ld   [wRoomObjectsArea + $45], a              ; $6D69: $EA $45 $D7
    ld   a, $AF                                   ; $6D6C: $3E $AF
    ld   [wRoomObjectsArea + $46], a              ; $6D6E: $EA $46 $D7
    ld   a, $B0                                   ; $6D71: $3E $B0
    ld   [wRoomObjectsArea + $55], a              ; $6D73: $EA $55 $D7
    ld   a, $B0                                   ; $6D76: $3E $B0
    ld   [wRoomObjectsArea + $56], a              ; $6D78: $EA $56 $D7
    call GetEntityPrivateCountdown1               ; $6D7B: $CD $00 $0C

.jr_6D7E
    ld   [hl], $1F                                ; $6D7E: $36 $1F
    call GetEntityDropTimer                       ; $6D80: $CD $FB $0B
    ld   [hl], $B0                                ; $6D83: $36 $B0
    call label_3E34                               ; $6D85: $CD $34 $3E
    ld   hl, wEntitiesStatusTable                 ; $6D88: $21 $80 $C2
    add  hl, bc                                   ; $6D8B: $09
    ld   [hl], $05                                ; $6D8C: $36 $05
    ld   hl, wEntitiesPosXTable                   ; $6D8E: $21 $00 $C2
    add  hl, bc                                   ; $6D91: $09
    ld   a, [hl]                                  ; $6D92: $7E
    add  $10                                      ; $6D93: $C6 $10
    ld   [hl], a                                  ; $6D95: $77
    call label_3E34                               ; $6D96: $CD $34 $3E
    ld   hl, wEntitiesStatusTable                 ; $6D99: $21 $80 $C2
    add  hl, bc                                   ; $6D9C: $09
    ld   [hl], $05                                ; $6D9D: $36 $05
    call label_3E34                               ; $6D9F: $CD $34 $3E
    call PlayBombExplosionSfx                     ; $6DA2: $CD $4B $0C
    ld   hl, wEntitiesStatusTable                 ; $6DA5: $21 $80 $C2
    add  hl, bc                                   ; $6DA8: $09
    ld   [hl], $05                                ; $6DA9: $36 $05
    call label_2887                               ; $6DAB: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $6DAE: $F0 $FE
    and  a                                        ; $6DB0: $A7
    jr   z, .jr_6DFD                              ; $6DB1: $28 $4A

    push bc                                       ; $6DB3: $C5
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $6DB4: $F0 $CF
    ld   h, a                                     ; $6DB6: $67
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6DB7: $F0 $D0
    ld   l, a                                     ; $6DB9: $6F
    push hl                                       ; $6DBA: $E5
    inc  l                                        ; $6DBB: $2C
    ld   a, l                                     ; $6DBC: $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6DBD: $E0 $D0
    push hl                                       ; $6DBF: $E5
    ld   a, $AF                                   ; $6DC0: $3E $AF
    ld   [wDDD8], a                               ; $6DC2: $EA $D8 $DD
    ld   a, $05                                   ; $6DC5: $3E $05
    call func_91D                                 ; $6DC7: $CD $1D $09
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6DCA: $F0 $D0
    inc  a                                        ; $6DCC: $3C
    inc  a                                        ; $6DCD: $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6DCE: $E0 $D0
    ld   a, $05                                   ; $6DD0: $3E $05
    call func_91D                                 ; $6DD2: $CD $1D $09
    pop  hl                                       ; $6DD5: $E1
    ld   de, $40                                  ; $6DD6: $11 $40 $00
    add  hl, de                                   ; $6DD9: $19
    ld   a, h                                     ; $6DDA: $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ; $6DDB: $E0 $CF
    ld   a, l                                     ; $6DDD: $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6DDE: $E0 $D0
    ld   a, $B0                                   ; $6DE0: $3E $B0
    ld   [wDDD8], a                               ; $6DE2: $EA $D8 $DD
    ld   a, $05                                   ; $6DE5: $3E $05
    call func_91D                                 ; $6DE7: $CD $1D $09
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6DEA: $F0 $D0
    inc  a                                        ; $6DEC: $3C
    inc  a                                        ; $6DED: $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6DEE: $E0 $D0
    ld   a, $05                                   ; $6DF0: $3E $05
    call func_91D                                 ; $6DF2: $CD $1D $09
    pop  hl                                       ; $6DF5: $E1
    ld   a, h                                     ; $6DF6: $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ; $6DF7: $E0 $CF
    ld   a, l                                     ; $6DF9: $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6DFA: $E0 $D0
    pop  bc                                       ; $6DFC: $C1

.jr_6DFD
    ld   a, [wDrawCommandsSize]                   ; $6DFD: $FA $00 $D6
    ld   e, a                                     ; $6E00: $5F
    ld   d, $00                                   ; $6E01: $16 $00
    ld   hl, wDrawCommand                         ; $6E03: $21 $01 $D6
    add  hl, de                                   ; $6E06: $19
    add  $1C                                      ; $6E07: $C6 $1C
    ld   [wDrawCommandsSize], a                   ; $6E09: $EA $00 $D6
    call func_005_6E15                            ; $6E0C: $CD $15 $6E
    call func_005_6E15                            ; $6E0F: $CD $15 $6E
    call func_005_6E15                            ; $6E12: $CD $15 $6E

func_005_6E15::
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $6E15: $F0 $CF
    ld   [hl+], a                                 ; $6E17: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6E18: $F0 $D0
    inc  a                                        ; $6E1A: $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6E1B: $E0 $D0
    ld   [hl+], a                                 ; $6E1D: $22
    ld   a, $83                                   ; $6E1E: $3E $83
    ld   [hl+], a                                 ; $6E20: $22
    ld   a, $76                                   ; $6E21: $3E $76
    ld   [hl+], a                                 ; $6E23: $22
    ld   a, $7E                                   ; $6E24: $3E $7E
    ld   [hl+], a                                 ; $6E26: $22
    ld   a, $7E                                   ; $6E27: $3E $7E
    ld   [hl+], a                                 ; $6E29: $22
    ld   a, $77                                   ; $6E2A: $3E $77
    ld   [hl+], a                                 ; $6E2C: $22
    xor  a                                        ; $6E2D: $AF
    ld   [hl], a                                  ; $6E2E: $77
    ret                                           ; $6E2F: $C9

label_005_6E30:
    cp   $40                                      ; $6E30: $FE $40
    jp   nz, label_005_6E7C                       ; $6E32: $C2 $7C $6E

    call label_2887                               ; $6E35: $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ; $6E38: $FA $00 $D6
    ld   e, a                                     ; $6E3B: $5F
    ld   d, $00                                   ; $6E3C: $16 $00
    ld   hl, wDrawCommand                         ; $6E3E: $21 $01 $D6
    add  hl, de                                   ; $6E41: $19
    add  $1C                                      ; $6E42: $C6 $1C
    ld   [wDrawCommandsSize], a                   ; $6E44: $EA $00 $D6
    call func_005_6E4A                            ; $6E47: $CD $4A $6E

func_005_6E4A::
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $6E4A: $F0 $CF
    ld   [hl+], a                                 ; $6E4C: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6E4D: $F0 $D0
    inc  a                                        ; $6E4F: $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6E50: $E0 $D0
    ld   [hl+], a                                 ; $6E52: $22
    ld   a, $83                                   ; $6E53: $3E $83
    ld   [hl+], a                                 ; $6E55: $22
    ld   a, $1C                                   ; $6E56: $3E $1C
    ld   [hl+], a                                 ; $6E58: $22
    ld   a, $1E                                   ; $6E59: $3E $1E
    ld   [hl+], a                                 ; $6E5B: $22
    ld   a, $1C                                   ; $6E5C: $3E $1C
    ld   [hl+], a                                 ; $6E5E: $22
    ld   a, $1E                                   ; $6E5F: $3E $1E
    ld   [hl+], a                                 ; $6E61: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $6E62: $F0 $CF
    ld   [hl+], a                                 ; $6E64: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6E65: $F0 $D0
    inc  a                                        ; $6E67: $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ; $6E68: $E0 $D0
    ld   [hl+], a                                 ; $6E6A: $22
    ld   a, $83                                   ; $6E6B: $3E $83
    ld   [hl+], a                                 ; $6E6D: $22
    ld   a, $1D                                   ; $6E6E: $3E $1D
    ld   [hl+], a                                 ; $6E70: $22
    ld   a, $1F                                   ; $6E71: $3E $1F
    ld   [hl+], a                                 ; $6E73: $22
    ld   a, $1D                                   ; $6E74: $3E $1D
    ld   [hl+], a                                 ; $6E76: $22
    ld   a, $1F                                   ; $6E77: $3E $1F
    ld   [hl+], a                                 ; $6E79: $22
    xor  a                                        ; $6E7A: $AF
    ld   [hl], a                                  ; $6E7B: $77

label_005_6E7C:
    ret                                           ; $6E7C: $C9

func_005_6E7D::
    ld   hl, wEntitiesPosXTable                   ; $6E7D: $21 $00 $C2
    add  hl, bc                                   ; $6E80: $09
    ld   a, [hl]                                  ; $6E81: $7E
    push af                                       ; $6E82: $F5
    ld   hl, wEntitiesPosYTable                   ; $6E83: $21 $10 $C2
    add  hl, bc                                   ; $6E86: $09
    ld   a, [hl]                                  ; $6E87: $7E
    push af                                       ; $6E88: $F5
    call func_005_70EB                            ; $6E89: $CD $EB $70
    pop  af                                       ; $6E8C: $F1
    ld   hl, wEntitiesPosYTable                   ; $6E8D: $21 $10 $C2
    add  hl, bc                                   ; $6E90: $09
    ld   [hl], a                                  ; $6E91: $77
    pop  af                                       ; $6E92: $F1
    ld   hl, wEntitiesPosXTable                   ; $6E93: $21 $00 $C2
    add  hl, bc                                   ; $6E96: $09
    ld   [hl], a                                  ; $6E97: $77
    call CopyEntityPositionToActivePosition       ; $6E98: $CD $8A $3D
    call GetEntityTransitionCountdown             ; $6E9B: $CD $05 $0C
    jp   z, IncrementEntityState                  ; $6E9E: $CA $12 $3B

    cp   $98                                      ; $6EA1: $FE $98
    jr   z, .jr_6EB0                              ; $6EA3: $28 $0B

    cp   $68                                      ; $6EA5: $FE $68
    jr   z, .jr_6EB0                              ; $6EA7: $28 $07

    cp   $38                                      ; $6EA9: $FE $38
    jr   z, .jr_6EB0                              ; $6EAB: $28 $03

    cp   $08                                      ; $6EAD: $FE $08
    ret  nz                                       ; $6EAF: $C0

.jr_6EB0
    ld   hl, wEntitiesInertiaTable                ; $6EB0: $21 $D0 $C3
    add  hl, bc                                   ; $6EB3: $09
    ld   a, [hl]                                  ; $6EB4: $7E
    cp   $04                                      ; $6EB5: $FE $04
    ret  z                                        ; $6EB7: $C8

    inc  [hl]                                     ; $6EB8: $34
    ld   e, a                                     ; $6EB9: $5F
    ld   d, b                                     ; $6EBA: $50
    ld   hl, Data_005_6D1A                        ; $6EBB: $21 $1A $6D
    add  hl, de                                   ; $6EBE: $19
    ld   a, [hl]                                  ; $6EBF: $7E
    ldh  [hIntersectedObjectLeft], a              ; $6EC0: $E0 $CE
    ld   hl, Data_005_6D1E                        ; $6EC2: $21 $1E $6D
    add  hl, de                                   ; $6EC5: $19
    ld   a, [hl]                                  ; $6EC6: $7E
    ldh  [hIntersectedObjectTop], a               ; $6EC7: $E0 $CD
    sla  e                                        ; $6EC9: $CB $23
    sla  e                                        ; $6ECB: $CB $23
    sla  e                                        ; $6ECD: $CB $23
    ld   hl, Data_005_6D22                        ; $6ECF: $21 $22 $6D
    add  hl, de                                   ; $6ED2: $19
    push hl                                       ; $6ED3: $E5
    call label_2887                               ; $6ED4: $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ; $6ED7: $FA $00 $D6
    ld   e, a                                     ; $6EDA: $5F
    ld   d, $00                                   ; $6EDB: $16 $00
    ld   hl, wDrawCommand                         ; $6EDD: $21 $01 $D6
    add  hl, de                                   ; $6EE0: $19
    add  $0E                                      ; $6EE1: $C6 $0E
    ld   [wDrawCommandsSize], a                   ; $6EE3: $EA $00 $D6
    pop  de                                       ; $6EE6: $D1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $6EE7: $F0 $CF
    ld   [hl+], a                                 ; $6EE9: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6EEA: $F0 $D0
    ld   [hl+], a                                 ; $6EEC: $22
    ld   a, $03                                   ; $6EED: $3E $03
    ld   [hl+], a                                 ; $6EEF: $22
    ld   a, [de]                                  ; $6EF0: $1A
    inc  de                                       ; $6EF1: $13
    ld   [hl+], a                                 ; $6EF2: $22
    ld   a, [de]                                  ; $6EF3: $1A
    inc  de                                       ; $6EF4: $13
    ld   [hl+], a                                 ; $6EF5: $22
    ld   a, [de]                                  ; $6EF6: $1A
    inc  de                                       ; $6EF7: $13
    ld   [hl+], a                                 ; $6EF8: $22
    ld   a, [de]                                  ; $6EF9: $1A
    inc  de                                       ; $6EFA: $13
    ld   [hl+], a                                 ; $6EFB: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $6EFC: $F0 $CF
    ld   [hl+], a                                 ; $6EFE: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $6EFF: $F0 $D0
    add  $20                                      ; $6F01: $C6 $20
    ld   [hl+], a                                 ; $6F03: $22
    ld   a, $03                                   ; $6F04: $3E $03
    ld   [hl+], a                                 ; $6F06: $22
    ld   a, [de]                                  ; $6F07: $1A
    inc  de                                       ; $6F08: $13
    ld   [hl+], a                                 ; $6F09: $22
    ld   a, [de]                                  ; $6F0A: $1A
    inc  de                                       ; $6F0B: $13
    ld   [hl+], a                                 ; $6F0C: $22
    ld   a, [de]                                  ; $6F0D: $1A
    inc  de                                       ; $6F0E: $13
    ld   [hl+], a                                 ; $6F0F: $22
    ld   a, [de]                                  ; $6F10: $1A
    ld   [hl+], a                                 ; $6F11: $22
    xor  a                                        ; $6F12: $AF
    ld   [hl], a                                  ; $6F13: $77
    ld   a, $D5                                   ; $6F14: $3E $D5
    ld   [wRoomObjectsArea + $13], a              ; $6F16: $EA $13 $D7
    ld   [wRoomObjectsArea + $17], a              ; $6F19: $EA $17 $D7
    ld   a, $D6                                   ; $6F1C: $3E $D6
    ld   [wRoomObjectsArea + $14], a              ; $6F1E: $EA $14 $D7
    ld   [wRoomObjectsArea + $18], a              ; $6F21: $EA $18 $D7
    ld   a, $D7                                   ; $6F24: $3E $D7
    ld   [wRoomObjectsArea + $83], a              ; $6F26: $EA $83 $D7
    ld   [wRoomObjectsArea + $87], a              ; $6F29: $EA $87 $D7
    ld   a, $D8                                   ; $6F2C: $3E $D8
    ld   [wRoomObjectsArea + $84], a              ; $6F2E: $EA $84 $D7
    ld   [wRoomObjectsArea + $88], a              ; $6F31: $EA $88 $D7
    ld   a, ENTITY_SLIME_EEL                      ; $6F34: $3E $5D
    call SpawnNewEntity_trampoline                ; $6F36: $CD $86 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $6F39: $21 $B0 $C2
    add  hl, de                                   ; $6F3C: $19
    ld   [hl], $01                                ; $6F3D: $36 $01
    ld   hl, wEntitiesPosXTable                   ; $6F3F: $21 $00 $C2
    add  hl, de                                   ; $6F42: $19
    ldh  a, [hIntersectedObjectLeft]              ; $6F43: $F0 $CE
    add  $10                                      ; $6F45: $C6 $10
    ld   [hl], a                                  ; $6F47: $77
    ld   hl, wEntitiesPosXTable                   ; $6F48: $21 $00 $C2
    add  hl, bc                                   ; $6F4B: $09
    ld   [hl], a                                  ; $6F4C: $77
    ld   hl, wEntitiesPosYTable                   ; $6F4D: $21 $10 $C2
    add  hl, de                                   ; $6F50: $19
    ldh  a, [hIntersectedObjectTop]               ; $6F51: $F0 $CD
    add  $10                                      ; $6F53: $C6 $10
    ld   [hl], a                                  ; $6F55: $77
    ld   hl, wEntitiesPosYTable                   ; $6F56: $21 $10 $C2
    add  hl, bc                                   ; $6F59: $09
    add  $08                                      ; $6F5A: $C6 $08
    ld   [hl], a                                  ; $6F5C: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $6F5D: $21 $E0 $C2
    add  hl, de                                   ; $6F60: $19
    ld   [hl], $2F                                ; $6F61: $36 $2F
    ld   hl, wEntitiesInertiaTable                ; $6F63: $21 $D0 $C3
    add  hl, bc                                   ; $6F66: $09
    ld   a, [hl]                                  ; $6F67: $7E
    cp   $03                                      ; $6F68: $FE $03
    ld   a, $00                                   ; $6F6A: $3E $00
    jr   c, .jr_6F78                              ; $6F6C: $38 $0A

    ld   hl, wEntitiesPosYTable                   ; $6F6E: $21 $10 $C2
    add  hl, bc                                   ; $6F71: $09
    ld   a, [hl]                                  ; $6F72: $7E
    sub  $08                                      ; $6F73: $D6 $08
    ld   [hl], a                                  ; $6F75: $77
    ld   a, $01                                   ; $6F76: $3E $01

.jr_6F78
    ld   hl, wEntitiesDirectionTable              ; $6F78: $21 $80 $C3
    add  hl, de                                   ; $6F7B: $19
    ld   [hl], a                                  ; $6F7C: $77
    call label_3E34                               ; $6F7D: $CD $34 $3E
    ld   hl, wEntitiesStatusTable                 ; $6F80: $21 $80 $C2
    add  hl, bc                                   ; $6F83: $09
    ld   [hl], $05                                ; $6F84: $36 $05
    jp   PlayBombExplosionSfx                     ; $6F86: $C3 $4B $0C

Data_005_6F89::
    db   $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7   ; $6F89
    db   $00, $09, $12, $1A, $21, $27, $2C, $2F   ; $6F91
    db   $30, $2F, $2C, $27, $21, $1A, $12, $09   ; $6F99
    db   $00, $F7, $EE, $E6, $DF, $D9, $D4, $D1   ; $6FA1
    db   $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7   ; $6FA9

Data_005_6FB1::
    db   $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9   ; $6FB1
    db   $00, $07, $0E, $15, $1A, $1F, $23, $25   ; $6FB9
    db   $26, $25, $23, $1F, $1A, $15, $0E, $07   ; $6FC1
    db   $00, $F9, $F2, $EB, $E6, $E1, $DD, $DB   ; $6FC9
    db   $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9   ; $6FD1

Data_005_6FD9::
    db   $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB   ; $6FD9
    db   $00, $05, $0A, $0F, $13, $17, $19, $1B   ; $6FE1
    db   $1C, $1B, $19, $17, $13, $0F, $0A, $05   ; $6FE9
    db   $00, $FB, $F6, $F1, $ED, $E9, $E7, $E5   ; $6FF1
    db   $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB   ; $6FF9

Data_005_7001::
    db   $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD   ; $7001
    db   $00, $03, $06, $0A, $0C, $0E, $10, $11   ; $7009
    db   $12, $11, $10, $0E, $0C, $0A, $06, $03   ; $7011
    db   $00, $FD, $FA, $F6, $F4, $F2, $F0, $EF   ; $7019
    db   $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD   ; $7021

Data_005_7029::
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF   ; $7029
    db   $00, $01, $03, $04, $05, $05, $06, $07   ; $7031
    db   $08, $07, $06, $05, $05, $04, $03, $01   ; $7039
    db   $00, $FF, $FD, $FC, $FB, $FB, $FA, $F9   ; $7041
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF   ; $7049

Data_005_7051::
    db   $00, $00, $01, $02, $03, $04, $04, $04, $04, $04, $04, $03, $02, $01, $00, $00
    db   $00, $00, $FF, $FE, $FD, $FC, $FC, $FC, $FC, $FC, $FC, $FD, $FE, $FF, $00, $00

Data_005_7071::
    db   $00, $00, $01, $01, $02, $02, $03, $03, $03, $03, $03, $02, $02, $01, $01, $00
    db   $00, $00, $FF, $FF, $FE, $FE, $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FF, $FF, $00

Data_005_7091::
    db   $00, $00, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $00
    db   $00, $00, $FF, $FF, $FF, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $00

Data_005_70B1::
    db   $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00
    db   $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00

Data_005_70D1::
    dw   Data_005_7029
    dw   Data_005_7001
    dw   Data_005_6FD9
    dw   Data_005_6FB1
    dw   Data_005_6F89

Data_005_70DB::
    db   $04, $03, $02, $01

Data_005_70DF::
    db   $30, $70, $30, $70

Data_005_70E3::
    db   $10, $10, $80, $80

Data_005_70E7::
    db   $00, $00, $01, $01

func_005_70EB::
    call GetEntityDropTimer                       ; $70EB: $CD $FB $0B
    ld   a, [wD200]                               ; $70EE: $FA $00 $D2
    and  a                                        ; $70F1: $A7
    jr   z, .jr_70F6                              ; $70F2: $28 $02

    ld   [hl], $20                                ; $70F4: $36 $20

.jr_70F6
    ld   a, [hl]                                  ; $70F6: $7E
    and  a                                        ; $70F7: $A7
    jr   nz, .jr_7151                             ; $70F8: $20 $57

    ld   [hl], $2C                                ; $70FA: $36 $2C
    ld   a, ENTITY_SLIME_EEL                      ; $70FC: $3E $5D
    call SpawnNewEntity_trampoline                ; $70FE: $CD $86 $3B
    jr   c, .jr_7151                              ; $7101: $38 $4E

    ld   hl, wEntitiesHealthTable                 ; $7103: $21 $60 $C3
    add  hl, de                                   ; $7106: $19
    ld   [hl], $FF                                ; $7107: $36 $FF
    ld   hl, wEntitiesSpriteVariantTable          ; $7109: $21 $B0 $C3
    add  hl, de                                   ; $710C: $19
    ld   [hl], $FF                                ; $710D: $36 $FF
    ld   hl, wEntitiesPrivateState1Table          ; $710F: $21 $B0 $C2
    add  hl, de                                   ; $7112: $19
    ld   [hl], $01                                ; $7113: $36 $01
    ld   hl, wEntitiesStateTable                  ; $7115: $21 $90 $C2
    add  hl, de                                   ; $7118: $19
    ld   [hl], $01                                ; $7119: $36 $01
    push bc                                       ; $711B: $C5
    call GetRandomByte                            ; $711C: $CD $0D $28
    and  $03                                      ; $711F: $E6 $03
    ld   c, a                                     ; $7121: $4F
    ld   hl, Data_005_70DF                        ; $7122: $21 $DF $70
    add  hl, bc                                   ; $7125: $09
    ld   a, [hl]                                  ; $7126: $7E
    ld   hl, wEntitiesPosXTable                   ; $7127: $21 $00 $C2
    add  hl, de                                   ; $712A: $19
    ld   [hl], a                                  ; $712B: $77
    ld   hl, wEntitiesPrivateState2Table          ; $712C: $21 $C0 $C2
    add  hl, de                                   ; $712F: $19
    ld   [hl], a                                  ; $7130: $77
    ld   hl, Data_005_70E3                        ; $7131: $21 $E3 $70
    add  hl, bc                                   ; $7134: $09
    ld   a, [hl]                                  ; $7135: $7E
    ld   hl, wEntitiesPosYTable                   ; $7136: $21 $10 $C2
    add  hl, de                                   ; $7139: $19
    ld   [hl], a                                  ; $713A: $77
    ld   hl, wEntitiesPrivateState3Table          ; $713B: $21 $D0 $C2
    add  hl, de                                   ; $713E: $19
    ld   [hl], a                                  ; $713F: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $7140: $21 $E0 $C2
    add  hl, de                                   ; $7143: $19
    ld   [hl], $5F                                ; $7144: $36 $5F
    ld   hl, Data_005_70E7                        ; $7146: $21 $E7 $70
    add  hl, bc                                   ; $7149: $09
    ld   a, [hl]                                  ; $714A: $7E
    ld   hl, wEntitiesDirectionTable              ; $714B: $21 $80 $C3
    add  hl, de                                   ; $714E: $19
    ld   [hl], a                                  ; $714F: $77
    pop  bc                                       ; $7150: $C1

.jr_7151
    call GetEntityPrivateCountdown1               ; $7151: $CD $00 $0C
    jr   z, .jr_7167                              ; $7154: $28 $11

    rra                                           ; $7156: $1F
    rra                                           ; $7157: $1F
    rra                                           ; $7158: $1F
    and  $03                                      ; $7159: $E6 $03
    ld   e, a                                     ; $715B: $5F
    ld   d, b                                     ; $715C: $50
    ld   hl, Data_005_70DB                        ; $715D: $21 $DB $70
    add  hl, de                                   ; $7160: $19
    ld   a, [hl]                                  ; $7161: $7E
    ld   hl, wEntitiesPrivateState3Table          ; $7162: $21 $D0 $C2
    add  hl, bc                                   ; $7165: $09
    ld   [hl], a                                  ; $7166: $77

.jr_7167
    ld   hl, wEntitiesPrivateState4Table          ; $7167: $21 $40 $C4
    add  hl, bc                                   ; $716A: $09
    ld   a, [hl]                                  ; $716B: $7E
    and  $07                                      ; $716C: $E6 $07
    ld   hl, wD200                                ; $716E: $21 $00 $D2
    or   [hl]                                     ; $7171: $B6
    jr   nz, .jr_7188                             ; $7172: $20 $14

    ldh  a, [hActiveEntityState]                  ; $7174: $F0 $F0
    cp   $03                                      ; $7176: $FE $03
    jr   nz, .jr_7188                             ; $7178: $20 $0E

    ld   hl, wEntitiesPrivateState5Table          ; $717A: $21 $90 $C3
    add  hl, bc                                   ; $717D: $09
    ld   e, [hl]                                  ; $717E: $5E
    ld   hl, wEntitiesPrivateState2Table          ; $717F: $21 $C0 $C2
    add  hl, bc                                   ; $7182: $09
    ld   a, [hl]                                  ; $7183: $7E
    add  e                                        ; $7184: $83
    and  $1F                                      ; $7185: $E6 $1F
    ld   [hl], a                                  ; $7187: $77

.jr_7188
    ld   a, [wD200]                               ; $7188: $FA $00 $D2
    and  a                                        ; $718B: $A7
    ld   a, $00                                   ; $718C: $3E $00
    jr   nz, .jr_719A                             ; $718E: $20 $0A

    ld   hl, wEntitiesPrivateState4Table          ; $7190: $21 $40 $C4
    add  hl, bc                                   ; $7193: $09
    inc  [hl]                                     ; $7194: $34
    ld   a, [hl]                                  ; $7195: $7E
    rra                                           ; $7196: $1F
    rra                                           ; $7197: $1F
    and  $1F                                      ; $7198: $E6 $1F

.jr_719A
    ldh  [hMultiPurposeG], a                      ; $719A: $E0 $E8
    ld   hl, wEntitiesPosXTable                   ; $719C: $21 $00 $C2
    add  hl, bc                                   ; $719F: $09
    ld   [hl], $50                                ; $71A0: $36 $50
    ld   hl, wEntitiesPosYTable                   ; $71A2: $21 $10 $C2
    add  hl, bc                                   ; $71A5: $09
    ld   [hl], $48                                ; $71A6: $36 $48
    ldh  a, [hMultiPurposeG]                      ; $71A8: $F0 $E8
    ld   e, a                                     ; $71AA: $5F
    ld   d, b                                     ; $71AB: $50
    ld   hl, Data_005_7051                        ; $71AC: $21 $51 $70
    add  hl, de                                   ; $71AF: $19
    ld   a, [hl]                                  ; $71B0: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $71B1: $21 $C0 $C2
    add  hl, bc                                   ; $71B4: $09
    add  [hl]                                     ; $71B5: $86
    and  $1F                                      ; $71B6: $E6 $1F
    ld   e, a                                     ; $71B8: $5F
    ld   d, b                                     ; $71B9: $50
    push de                                       ; $71BA: $D5
    ld   hl, wEntitiesPrivateState3Table          ; $71BB: $21 $D0 $C2
    add  hl, bc                                   ; $71BE: $09
    ld   e, [hl]                                  ; $71BF: $5E
    sla  e                                        ; $71C0: $CB $23
    ld   d, b                                     ; $71C2: $50
    ld   hl, Data_005_70D1                        ; $71C3: $21 $D1 $70
    add  hl, de                                   ; $71C6: $19
    ld   a, [hl+]                                 ; $71C7: $2A
    ld   h, [hl]                                  ; $71C8: $66
    ld   l, a                                     ; $71C9: $6F
    pop  de                                       ; $71CA: $D1
    ld   a, $02                                   ; $71CB: $3E $02
    call func_005_7283                            ; $71CD: $CD $83 $72
    ldh  a, [hMultiPurposeG]                      ; $71D0: $F0 $E8
    ld   e, a                                     ; $71D2: $5F
    ld   d, b                                     ; $71D3: $50
    ld   hl, Data_005_7071                        ; $71D4: $21 $71 $70
    add  hl, de                                   ; $71D7: $19
    ld   a, [hl]                                  ; $71D8: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $71D9: $21 $C0 $C2
    add  hl, bc                                   ; $71DC: $09
    add  [hl]                                     ; $71DD: $86
    and  $1F                                      ; $71DE: $E6 $1F
    ld   e, a                                     ; $71E0: $5F
    ld   d, b                                     ; $71E1: $50
    push de                                       ; $71E2: $D5
    ld   hl, wEntitiesPrivateState3Table          ; $71E3: $21 $D0 $C2
    add  hl, bc                                   ; $71E6: $09
    ld   e, [hl]                                  ; $71E7: $5E
    dec  e                                        ; $71E8: $1D
    ld   a, e                                     ; $71E9: $7B
    cp   $F0                                      ; $71EA: $FE $F0
    jp   nc, label_005_72CA                       ; $71EC: $D2 $CA $72

    sla  e                                        ; $71EF: $CB $23
    ld   d, b                                     ; $71F1: $50
    ld   hl, Data_005_70D1                        ; $71F2: $21 $D1 $70
    add  hl, de                                   ; $71F5: $19
    ld   a, [hl+]                                 ; $71F6: $2A
    ld   h, [hl]                                  ; $71F7: $66
    ld   l, a                                     ; $71F8: $6F
    pop  de                                       ; $71F9: $D1
    ld   a, $01                                   ; $71FA: $3E $01
    call func_005_7283                            ; $71FC: $CD $83 $72
    ldh  a, [hMultiPurposeG]                      ; $71FF: $F0 $E8
    ld   e, a                                     ; $7201: $5F
    ld   d, b                                     ; $7202: $50
    ld   hl, Data_005_7091                        ; $7203: $21 $91 $70
    add  hl, de                                   ; $7206: $19
    ld   a, [hl]                                  ; $7207: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $7208: $21 $C0 $C2
    add  hl, bc                                   ; $720B: $09
    add  [hl]                                     ; $720C: $86
    and  $1F                                      ; $720D: $E6 $1F
    ld   e, a                                     ; $720F: $5F
    ld   d, b                                     ; $7210: $50
    push de                                       ; $7211: $D5
    ld   hl, wEntitiesPrivateState3Table          ; $7212: $21 $D0 $C2
    add  hl, bc                                   ; $7215: $09
    ld   e, [hl]                                  ; $7216: $5E
    dec  e                                        ; $7217: $1D
    dec  e                                        ; $7218: $1D
    ld   a, e                                     ; $7219: $7B
    cp   $F0                                      ; $721A: $FE $F0
    jp   nc, label_005_72CA                       ; $721C: $D2 $CA $72

    sla  e                                        ; $721F: $CB $23
    ld   d, b                                     ; $7221: $50
    ld   hl, Data_005_70D1                        ; $7222: $21 $D1 $70
    add  hl, de                                   ; $7225: $19
    ld   a, [hl+]                                 ; $7226: $2A
    ld   h, [hl]                                  ; $7227: $66
    ld   l, a                                     ; $7228: $6F
    pop  de                                       ; $7229: $D1
    ld   a, $01                                   ; $722A: $3E $01
    call func_005_7283                            ; $722C: $CD $83 $72
    ldh  a, [hMultiPurposeG]                      ; $722F: $F0 $E8
    ld   e, a                                     ; $7231: $5F
    ld   d, b                                     ; $7232: $50
    ld   hl, Data_005_70B1                        ; $7233: $21 $B1 $70
    add  hl, de                                   ; $7236: $19
    ld   a, [hl]                                  ; $7237: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $7238: $21 $C0 $C2
    add  hl, bc                                   ; $723B: $09
    add  [hl]                                     ; $723C: $86
    and  $1F                                      ; $723D: $E6 $1F
    ld   e, a                                     ; $723F: $5F
    ld   d, b                                     ; $7240: $50
    push de                                       ; $7241: $D5
    ld   hl, wEntitiesPrivateState3Table          ; $7242: $21 $D0 $C2
    add  hl, bc                                   ; $7245: $09
    ld   e, [hl]                                  ; $7246: $5E
    dec  e                                        ; $7247: $1D
    dec  e                                        ; $7248: $1D
    dec  e                                        ; $7249: $1D
    ld   a, e                                     ; $724A: $7B
    cp   $F0                                      ; $724B: $FE $F0
    jp   nc, label_005_72CA                       ; $724D: $D2 $CA $72

    sla  e                                        ; $7250: $CB $23
    ld   d, b                                     ; $7252: $50
    ld   hl, Data_005_70D1                        ; $7253: $21 $D1 $70
    add  hl, de                                   ; $7256: $19
    ld   a, [hl+]                                 ; $7257: $2A
    ld   h, [hl]                                  ; $7258: $66
    ld   l, a                                     ; $7259: $6F
    pop  de                                       ; $725A: $D1
    ld   a, $01                                   ; $725B: $3E $01
    call func_005_7283                            ; $725D: $CD $83 $72
    ld   hl, wEntitiesPrivateState2Table          ; $7260: $21 $C0 $C2
    add  hl, bc                                   ; $7263: $09
    ld   e, [hl]                                  ; $7264: $5E
    ld   d, b                                     ; $7265: $50
    push de                                       ; $7266: $D5
    ld   hl, wEntitiesPrivateState3Table          ; $7267: $21 $D0 $C2
    add  hl, bc                                   ; $726A: $09
    ld   e, [hl]                                  ; $726B: $5E
    dec  e                                        ; $726C: $1D
    dec  e                                        ; $726D: $1D
    dec  e                                        ; $726E: $1D
    dec  e                                        ; $726F: $1D
    ld   a, e                                     ; $7270: $7B
    cp   $F0                                      ; $7271: $FE $F0
    jp   nc, label_005_72CA                       ; $7273: $D2 $CA $72

    sla  e                                        ; $7276: $CB $23
    ld   d, b                                     ; $7278: $50
    ld   hl, Data_005_70D1                        ; $7279: $21 $D1 $70
    add  hl, de                                   ; $727C: $19
    ld   a, [hl+]                                 ; $727D: $2A
    ld   h, [hl]                                  ; $727E: $66
    ld   l, a                                     ; $727F: $6F
    pop  de                                       ; $7280: $D1
    ld   a, $00                                   ; $7281: $3E $00

func_005_7283::
    ldh  [hActiveEntitySpriteVariant], a          ; $7283: $E0 $F1
    add  hl, de                                   ; $7285: $19
    ld   a, $48                                   ; $7286: $3E $48
    add  [hl]                                     ; $7288: $86
    ldh  [hActiveEntityVisualPosY], a             ; $7289: $E0 $EC
    ld   a, l                                     ; $728B: $7D
    add  $08                                      ; $728C: $C6 $08
    ld   l, a                                     ; $728E: $6F
    ld   a, h                                     ; $728F: $7C
    adc  $00                                      ; $7290: $CE $00
    ld   h, a                                     ; $7292: $67
    ld   a, $50                                   ; $7293: $3E $50
    add  [hl]                                     ; $7295: $86
    ldh  [hActiveEntityPosX], a                   ; $7296: $E0 $EE
    call RenderSlimeEel                           ; $7298: $CD $E0 $72
    ldh  a, [hLinkPositionX]                      ; $729B: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $729D: $21 $EE $FF
    sub  [hl]                                     ; $72A0: $96
    add  $08                                      ; $72A1: $C6 $08
    cp   $10                                      ; $72A3: $FE $10
    jr   nc, .ret_72C9                            ; $72A5: $30 $22

    ldh  a, [hLinkPositionY]                      ; $72A7: $F0 $99
    ld   hl, hActiveEntityVisualPosY              ; $72A9: $21 $EC $FF
    sub  [hl]                                     ; $72AC: $96
    add  $08                                      ; $72AD: $C6 $08
    cp   $10                                      ; $72AF: $FE $10
    jr   nc, .ret_72C9                            ; $72B1: $30 $16

    ld   a, [wLinkMotionState]                    ; $72B3: $FA $1C $C1
    and  a                                        ; $72B6: $A7
    jr   nz, .ret_72C9                            ; $72B7: $20 $10

    call HurtBySpikes_trampoline                  ; $72B9: $CD $18 $3B
    ld   a, $18                                   ; $72BC: $3E $18
    call GetVectorTowardsLink_trampoline          ; $72BE: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $72C1: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $72C3: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $72C5: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $72C7: $E0 $9A

.ret_72C9
    ret                                           ; $72C9: $C9

label_005_72CA:
    pop  de                                       ; $72CA: $D1
    ret                                           ; $72CB: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SlimeEelSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_7 | OAMF_PAL0
    db $70, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $72, OAM_GBC_PAL_7 | OAMF_PAL0
    db $72, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $74, OAM_GBC_PAL_7 | OAMF_PAL0
    db $74, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $7C, OAM_GBC_PAL_6 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $7E, OAM_GBC_PAL_6 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP

RenderSlimeEel::
    ld   de, SlimeEelSpriteVariants               ; $72E0: $11 $CC $72
    jp   RenderActiveEntitySpritesPair            ; $72E3: $C3 $C0 $3B

func_005_72E6::
    call func_005_7982                            ; $72E6: $CD $82 $79
    call ReturnIfNonInteractive_05                ; $72E9: $CD $3A $7A
    ldh  a, [hActiveEntityState]                  ; $72EC: $F0 $F0
    JP_TABLE                                      ; $72EE
._00 dw func_005_7305                             ; $72EF
._01 dw func_005_7363                             ; $72F1
._02 dw func_005_7425                             ; $72F3
._03 dw func_005_74B1                             ; $72F5
._04 dw BossDestructionHandler_05                 ; $72F7

Data_005_72F9::
    db   $09, $0A, $0B, $0B, $0B, $0B

Data_005_72FF::
    db   $0C, $0D, $0E, $0E, $0E, $0E

func_005_7305::
    call GetEntityTransitionCountdown             ; $7305: $CD $05 $0C
    jp   z, func_005_7535                         ; $7308: $CA $35 $75

    ld   e, a                                     ; $730B: $5F
    cp   $18                                      ; $730C: $FE $18
    jr   nz, .jr_7314                             ; $730E: $20 $04

    ld   a, WAVE_SFX_BOSS_GROWL                   ; $7310: $3E $16
    ldh  [hWaveSfx], a                            ; $7312: $E0 $F3

.jr_7314
    ld   a, e                                     ; $7314: $7B
    rra                                           ; $7315: $1F
    rra                                           ; $7316: $1F
    rra                                           ; $7317: $1F
    and  $07                                      ; $7318: $E6 $07
    ld   e, a                                     ; $731A: $5F
    ld   d, b                                     ; $731B: $50
    ld   hl, wEntitiesDirectionTable              ; $731C: $21 $80 $C3
    add  hl, bc                                   ; $731F: $09
    ld   a, [hl]                                  ; $7320: $7E
    and  a                                        ; $7321: $A7
    ld   hl, Data_005_72F9                        ; $7322: $21 $F9 $72
    jr   z, .jr_732A                              ; $7325: $28 $03

    ld   hl, Data_005_72FF                        ; $7327: $21 $FF $72

.jr_732A
    add  hl, de                                   ; $732A: $19
    ld   a, [hl]                                  ; $732B: $7E
    jp   SetEntitySpriteVariant                   ; $732C: $C3 $0C $3B

Data_005_732F::
    db   $09, $09, $0A, $0A, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0A, $0A, $09, $09
    db   $09, $09, $09, $09, $09, $09, $09, $09

Data_005_7347::
    db   $0C, $0C, $0D, $0D, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0D, $0D, $0C, $0C
    db   $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C

Data_005_735F::
    db   $18, $D8

Data_005_7361::
    db   $04, $0C

func_005_7363::
    call GetEntityTransitionCountdown             ; $7363: $CD $05 $0C
    jp   z, func_005_7535                         ; $7366: $CA $35 $75

    ld   e, a                                     ; $7369: $5F
    cp   $20                                      ; $736A: $FE $20
    jr   nz, .jr_7372                             ; $736C: $20 $04

    ld   a, WAVE_SFX_BOSS_GROWL                   ; $736E: $3E $16
    ldh  [hWaveSfx], a                            ; $7370: $E0 $F3

.jr_7372
    ld   a, e                                     ; $7372: $7B
    rra                                           ; $7373: $1F
    rra                                           ; $7374: $1F
    and  $1F                                      ; $7375: $E6 $1F
    ld   e, a                                     ; $7377: $5F
    ld   d, b                                     ; $7378: $50
    ld   hl, wEntitiesDirectionTable              ; $7379: $21 $80 $C3
    add  hl, bc                                   ; $737C: $09
    ld   a, [hl]                                  ; $737D: $7E
    and  a                                        ; $737E: $A7
    ld   hl, Data_005_732F                        ; $737F: $21 $2F $73
    jr   z, .jr_7387                              ; $7382: $28 $03

    ld   hl, Data_005_7347                        ; $7384: $21 $47 $73

.jr_7387
    add  hl, de                                   ; $7387: $19
    ld   a, [hl]                                  ; $7388: $7E
    call SetEntitySpriteVariant                   ; $7389: $CD $0C $3B
    cp   $0B                                      ; $738C: $FE $0B
    jr   z, .jr_7395                              ; $738E: $28 $05

    cp   $0E                                      ; $7390: $FE $0E
    jp   nz, ret_005_7424                         ; $7392: $C2 $24 $74

.jr_7395
    ldh  a, [hLinkDirection]                      ; $7395: $F0 $9E
    and  $02                                      ; $7397: $E6 $02
    jp   z, ret_005_7424                          ; $7399: $CA $24 $74

    ld   a, [wC1A6]                               ; $739C: $FA $A6 $C1
    and  a                                        ; $739F: $A7
    jp   z, ret_005_7424                          ; $73A0: $CA $24 $74

    dec  a                                        ; $73A3: $3D
    ld   [wD202], a                               ; $73A4: $EA $02 $D2
    ld   e, a                                     ; $73A7: $5F
    ld   d, b                                     ; $73A8: $50
    ld   hl, wEntitiesStatusTable                 ; $73A9: $21 $80 $C2
    add  hl, de                                   ; $73AC: $19
    ld   a, [hl]                                  ; $73AD: $7E
    and  a                                        ; $73AE: $A7
    jr   z, ret_005_7424                          ; $73AF: $28 $73

    ld   hl, wEntitiesTypeTable                   ; $73B1: $21 $A0 $C3
    add  hl, de                                   ; $73B4: $19
    ld   a, [hl]                                  ; $73B5: $7E
    cp   $03                                      ; $73B6: $FE $03
    jr   nz, ret_005_7424                         ; $73B8: $20 $6A

    ld   hl, wEntitiesPosXTable                   ; $73BA: $21 $00 $C2
    add  hl, de                                   ; $73BD: $19
    ldh  a, [hActiveEntityPosX]                   ; $73BE: $F0 $EE
    sub  [hl]                                     ; $73C0: $96
    add  $08                                      ; $73C1: $C6 $08
    cp   $10                                      ; $73C3: $FE $10
    jr   nc, ret_005_7424                         ; $73C5: $30 $5D

    ld   hl, wEntitiesPosYTable                   ; $73C7: $21 $10 $C2
    add  hl, de                                   ; $73CA: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $73CB: $F0 $EC
    sub  [hl]                                     ; $73CD: $96
    add  $0C                                      ; $73CE: $C6 $0C
    cp   $18                                      ; $73D0: $FE $18
    jr   nc, ret_005_7424                         ; $73D2: $30 $50

    ld   a, [wD203]                               ; $73D4: $FA $03 $D2
    inc  a                                        ; $73D7: $3C
    ld   [wD203], a                               ; $73D8: $EA $03 $D2
    cp   $04                                      ; $73DB: $FE $04
    jr   c, .jr_7414                              ; $73DD: $38 $35

    call GetRandomByte                            ; $73DF: $CD $0D $28
    and  $01                                      ; $73E2: $E6 $01
    jr   nz, .jr_7414                             ; $73E4: $20 $2E

    ld   hl, wEntitiesPrivateState1Table          ; $73E6: $21 $B0 $C2
    add  hl, bc                                   ; $73E9: $09
    ld   [hl], $02                                ; $73EA: $36 $02
    call GetEntityDropTimer                       ; $73EC: $CD $FB $0B
    ld   [hl], $30                                ; $73EF: $36 $30
    ld   hl, wEntitiesPrivateCountdown2Table      ; $73F1: $21 $00 $C3
    add  hl, bc                                   ; $73F4: $09
    ld   [hl], $20                                ; $73F5: $36 $20
    ld   hl, wEntitiesDirectionTable              ; $73F7: $21 $80 $C3
    add  hl, bc                                   ; $73FA: $09
    ld   e, [hl]                                  ; $73FB: $5E
    ld   d, b                                     ; $73FC: $50
    ld   hl, Data_005_735F                        ; $73FD: $21 $5F $73
    add  hl, de                                   ; $7400: $19
    ld   a, [hl]                                  ; $7401: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7402: $21 $50 $C2
    add  hl, bc                                   ; $7405: $09
    ld   [hl], a                                  ; $7406: $77
    ld   hl, Data_005_7361                        ; $7407: $21 $61 $73
    add  hl, de                                   ; $740A: $19
    ld   a, [hl]                                  ; $740B: $7E
    ld   hl, wEntitiesStateTable                  ; $740C: $21 $90 $C2
    add  hl, bc                                   ; $740F: $09
    ld   [hl], a                                  ; $7410: $77
    jp   label_005_7777                           ; $7411: $C3 $77 $77

.jr_7414
    call IncrementEntityState                     ; $7414: $CD $12 $3B
    ld   a, [wD201]                               ; $7417: $FA $01 $D2
    ld   e, a                                     ; $741A: $5F
    ld   d, b                                     ; $741B: $50
    ld   hl, wEntitiesPrivateState5Table          ; $741C: $21 $90 $C3
    add  hl, de                                   ; $741F: $19
    ld   a, [hl]                                  ; $7420: $7E
    cpl                                           ; $7421: $2F
    inc  a                                        ; $7422: $3C
    ld   [hl], a                                  ; $7423: $77

ret_005_7424:
    ret                                           ; $7424: $C9

func_005_7425::
    call func_005_79A7                            ; $7425: $CD $A7 $79
    ld   a, $01                                   ; $7428: $3E $01
    ld   [wD200], a                               ; $742A: $EA $00 $D2
    ld   a, [wD202]                               ; $742D: $FA $02 $D2
    ld   e, a                                     ; $7430: $5F
    ld   d, b                                     ; $7431: $50
    ld   hl, wEntitiesStatusTable                 ; $7432: $21 $80 $C2
    add  hl, de                                   ; $7435: $19
    ld   a, [hl]                                  ; $7436: $7E
    and  a                                        ; $7437: $A7
    jr   z, jr_005_7478                           ; $7438: $28 $3E

    ld   a, [wInvincibilityCounter]               ; $743A: $FA $C7 $DB
    and  a                                        ; $743D: $A7
    jr   nz, jr_005_7478                          ; $743E: $20 $38

    ld   hl, wEntitiesPosYTable                   ; $7440: $21 $10 $C2
    add  hl, de                                   ; $7443: $19
    ld   a, [hl]                                  ; $7444: $7E
    ld   hl, wEntitiesPosYTable                   ; $7445: $21 $10 $C2
    add  hl, bc                                   ; $7448: $09
    ld   [hl], a                                  ; $7449: $77
    ld   a, [wD201]                               ; $744A: $FA $01 $D2
    ld   e, a                                     ; $744D: $5F
    ld   d, b                                     ; $744E: $50
    ld   hl, wEntitiesPrivateState3Table          ; $744F: $21 $D0 $C2
    add  hl, de                                   ; $7452: $19
    ld   a, [hl]                                  ; $7453: $7E
    cp   $00                                      ; $7454: $FE $00
    jr   z, .jr_745F                              ; $7456: $28 $07

    ldh  a, [hFrameCounter]                       ; $7458: $F0 $E7
    and  $03                                      ; $745A: $E6 $03
    jr   nz, .jr_745F                             ; $745C: $20 $01

    dec  [hl]                                     ; $745E: $35

.jr_745F
    ldh  a, [hFrameCounter]                       ; $745F: $F0 $E7
    and  $07                                      ; $7461: $E6 $07
    jr   nz, .jr_7469                             ; $7463: $20 $04

    ld   a, JINGLE_SLIME_EEL_PULL                 ; $7465: $3E $29
    ldh  [hJingle], a                             ; $7467: $E0 $F2

.jr_7469
    ld   hl, wEntitiesDirectionTable              ; $7469: $21 $80 $C3
    add  hl, bc                                   ; $746C: $09
    ld   a, [hl]                                  ; $746D: $7E
    and  a                                        ; $746E: $A7
    ld   a, $00                                   ; $746F: $3E $00
    jr   z, .jr_7475                              ; $7471: $28 $02

    ld   a, $01                                   ; $7473: $3E $01

.jr_7475
    jp   SetEntitySpriteVariant                   ; $7475: $C3 $0C $3B

jr_005_7478:
    call IncrementEntityState                     ; $7478: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $747B: $CD $05 $0C
    ld   [hl], $5F                                ; $747E: $36 $5F
    ret                                           ; $7480: $C9

Data_005_7481::
    db   $10, $10, $0C, $08, $04, $03, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db   $01, $01, $01, $01, $01, $01, $01, $01

Data_005_7499::
    db   $03, $1F, $1F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F
    db   $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F

func_005_74B1::
    call func_005_79A7                            ; $74B1: $CD $A7 $79
    ld   a, $01                                   ; $74B4: $3E $01
    ld   [wD200], a                               ; $74B6: $EA $00 $D2
    ld   hl, wEntitiesDirectionTable              ; $74B9: $21 $80 $C3
    add  hl, bc                                   ; $74BC: $09
    ld   a, [hl]                                  ; $74BD: $7E
    and  a                                        ; $74BE: $A7
    ld   a, $08                                   ; $74BF: $3E $08
    jr   z, .jr_74C5                              ; $74C1: $28 $02

    ld   a, $0F                                   ; $74C3: $3E $0F

.jr_74C5
    call SetEntitySpriteVariant                   ; $74C5: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $74C8: $F0 $98
    push af                                       ; $74CA: $F5
    ld   hl, wEntitiesPrivateState2Table          ; $74CB: $21 $C0 $C2
    add  hl, bc                                   ; $74CE: $09
    ld   a, [hl]                                  ; $74CF: $7E
    ldh  [hLinkPositionX], a                      ; $74D0: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $74D2: $F0 $99
    push af                                       ; $74D4: $F5
    ld   hl, wEntitiesPrivateState3Table          ; $74D5: $21 $D0 $C2
    add  hl, bc                                   ; $74D8: $09
    ld   a, [hl]                                  ; $74D9: $7E
    ldh  [hLinkPositionY], a                      ; $74DA: $E0 $99
    call GetEntityTransitionCountdown             ; $74DC: $CD $05 $0C
    rra                                           ; $74DF: $1F
    rra                                           ; $74E0: $1F
    and  $3F                                      ; $74E1: $E6 $3F
    ld   e, a                                     ; $74E3: $5F
    ld   d, b                                     ; $74E4: $50
    ld   hl, Data_005_7481                        ; $74E5: $21 $81 $74
    add  hl, de                                   ; $74E8: $19
    ld   a, [hl]                                  ; $74E9: $7E
    call GetVectorTowardsLink_trampoline          ; $74EA: $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                      ; $74ED: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $74EF: $21 $40 $C2
    add  hl, bc                                   ; $74F2: $09
    ld   [hl], a                                  ; $74F3: $77
    ldh  a, [hMultiPurpose0]                      ; $74F4: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $74F6: $21 $50 $C2
    add  hl, bc                                   ; $74F9: $09
    ld   [hl], a                                  ; $74FA: $77
    call UpdateEntityPosWithSpeed_05              ; $74FB: $CD $B1 $7A
    ldh  a, [hLinkPositionY]                      ; $74FE: $F0 $99
    ld   hl, hActiveEntityVisualPosY              ; $7500: $21 $EC $FF
    sub  [hl]                                     ; $7503: $96
    add  $03                                      ; $7504: $C6 $03
    cp   $06                                      ; $7506: $FE $06
    jr   nc, .jr_750D                             ; $7508: $30 $03

    call func_005_7535                            ; $750A: $CD $35 $75

.jr_750D
    pop  af                                       ; $750D: $F1
    ldh  [hLinkPositionY], a                      ; $750E: $E0 $99
    pop  af                                       ; $7510: $F1
    ldh  [hLinkPositionX], a                      ; $7511: $E0 $98
    call GetEntityTransitionCountdown             ; $7513: $CD $05 $0C
    rra                                           ; $7516: $1F
    rra                                           ; $7517: $1F
    and  $3F                                      ; $7518: $E6 $3F
    ld   e, a                                     ; $751A: $5F
    ld   d, b                                     ; $751B: $50
    ld   hl, Data_005_7499                        ; $751C: $21 $99 $74
    add  hl, de                                   ; $751F: $19
    ldh  a, [hFrameCounter]                       ; $7520: $F0 $E7
    and  [hl]                                     ; $7522: $A6
    jr   nz, .ret_7534                            ; $7523: $20 $0F

    ld   a, [wD201]                               ; $7525: $FA $01 $D2
    ld   e, a                                     ; $7528: $5F
    ld   d, b                                     ; $7529: $50
    ld   hl, wEntitiesPrivateState3Table          ; $752A: $21 $D0 $C2
    add  hl, de                                   ; $752D: $19
    ld   a, [hl]                                  ; $752E: $7E
    cp   $04                                      ; $752F: $FE $04
    jr   z, .ret_7534                             ; $7531: $28 $01

    inc  [hl]                                     ; $7533: $34

.ret_7534
    ret                                           ; $7534: $C9

func_005_7535::
    xor  a                                        ; $7535: $AF
    ld   [wD200], a                               ; $7536: $EA $00 $D2
    jp   ClearEntityStatus_05                     ; $7539: $C3 $4B $7B

; Loop until boss destruction animation is done, then call to load heart
; Used from 4 different bosses: Slime Eel, Anglerfish, Evil Eagle, Hot Head
BossDestructionHandler_05::
    call func_005_79A7                            ; $753C: $CD $A7 $79
    call GetEntityTransitionCountdown             ; $753F: $CD $05 $0C
    jp   z, DropHeartContainer_05                 ; $7542: $CA $85 $75

    ld   hl, wEntitiesFlashCountdownTable         ; $7545: $21 $20 $C4
    add  hl, bc                                   ; $7548: $09
    ld   [hl], a                                  ; $7549: $77
    cp   $80                                      ; $754A: $FE $80
    ret  nc                                       ; $754C: $D0

    jp   label_005_7550                           ; $754D: $C3 $50 $75

label_005_7550:
    and  $07                                      ; $7550: $E6 $07
    ret  nz                                       ; $7552: $C0

    call GetRandomByte                            ; $7553: $CD $0D $28
    and  $1F                                      ; $7556: $E6 $1F
    sub  $10                                      ; $7558: $D6 $10
    ld   e, a                                     ; $755A: $5F
    ld   hl, hActiveEntityPosX                    ; $755B: $21 $EE $FF
    add  [hl]                                     ; $755E: $86
    ld   [hl], a                                  ; $755F: $77
    call GetRandomByte                            ; $7560: $CD $0D $28
    and  $1F                                      ; $7563: $E6 $1F
    sub  $10                                      ; $7565: $D6 $10
    ld   e, a                                     ; $7567: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7568: $21 $EC $FF
    add  [hl]                                     ; $756B: $86
    ld   [hl], a                                  ; $756C: $77
    jp   label_005_7570                           ; $756D: $C3 $70 $75

label_005_7570:
    call ReturnIfNonInteractive_05.allowInactiveEntity ; $7570: $CD $40 $7A
    ldh  a, [hActiveEntityPosX]                   ; $7573: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7575: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7577: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7579: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $757B: $3E $02
    call AddTranscientVfx                         ; $757D: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $7580: $3E $13
    ldh  [hNoiseSfx], a                           ; $7582: $E0 $F4
    ret                                           ; $7584: $C9

; Load heart container value to load when boss is killed
; Used from 4 different bosses: Slime Eel, Anglerfish, Evil Eagle, Hot Head
DropHeartContainer_05::
    ld   a, ENTITY_HEART_CONTAINER                ; $7585: $3E $36
    call SpawnNewEntity_trampoline                ; $7587: $CD $86 $3B
    jr   .notEvilEagle                            ; $758A: $18 $0D

.evilEagle:
    ld   a, ENTITY_HEART_CONTAINER                ; $758C: $3E $36
    call SpawnNewEntity_trampoline                ; $758E: $CD $86 $3B
    ld   a, $48                                   ; $7591: $3E $48
    ldh  [hMultiPurpose0], a                      ; $7593: $E0 $D7
    ld   a, $10                                   ; $7595: $3E $10
    ldh  [hMultiPurpose1], a                      ; $7597: $E0 $D8

.notEvilEagle:
    ldh  a, [hMultiPurpose1]                      ; $7599: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $759B: $21 $10 $C2
    add  hl, de                                   ; $759E: $19
    ld   [hl], a                                  ; $759F: $77
    ldh  a, [hMultiPurpose0]                      ; $75A0: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $75A2: $21 $00 $C2
    add  hl, de                                   ; $75A5: $19
    ld   [hl], a                                  ; $75A6: $77
    ldh  a, [hIsSideScrolling]                    ; $75A7: $F0 $F9
    and  a                                        ; $75A9: $A7
    jr   z, .jr_75B4                              ; $75AA: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $75AC: $21 $50 $C2
    add  hl, bc                                   ; $75AF: $09
    ld   [hl], $F0                                ; $75B0: $36 $F0
    jr   jr_005_75C0                              ; $75B2: $18 $0C

.jr_75B4
    ld   hl, wEntitiesSpeedZTable                 ; $75B4: $21 $20 $C3
    add  hl, de                                   ; $75B7: $19
    ld   [hl], $10                                ; $75B8: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $75BA: $21 $10 $C3
    add  hl, de                                   ; $75BD: $19
    ld   [hl], $08                                ; $75BE: $36 $08

jr_005_75C0:
    call ClearEntityStatus_05                     ; $75C0: $CD $4B $7B
    ld   hl, hNoiseSfx                            ; $75C3: $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ; $75C6: $36 $1A
    ret                                           ; $75C8: $C9

Data_005_75C9::
    db   $03, $05, $00, $04, $02, $06, $01, $07

func_005_75D1::
    call func_005_766E                            ; $75D1: $CD $6E $76
    call CopyEntityPositionToActivePosition       ; $75D4: $CD $8A $3D
    call ReturnIfNonInteractive_05                ; $75D7: $CD $3A $7A
    ld   a, $01                                   ; $75DA: $3E $01
    ld   [wD200], a                               ; $75DC: $EA $00 $D2
    call GetEntityDropTimer                       ; $75DF: $CD $FB $0B
    cp   $10                                      ; $75E2: $FE $10
    jr   nc, jr_005_7621                          ; $75E4: $30 $3B

    and  a                                        ; $75E6: $A7
    jr   nz, .jr_7619                             ; $75E7: $20 $30

    ld   a, [wD201]                               ; $75E9: $FA $01 $D2
    ld   e, a                                     ; $75EC: $5F
    ld   d, b                                     ; $75ED: $50

    ld   hl, wEntitiesPrivateCountdown1Table      ; $75EE: $21 $F0 $C2
    add  hl, de                                   ; $75F1: $19
    ld   [hl], $1F                                ; $75F2: $36 $1F

    ld   a, ENTITY_BOMB                           ; $75F4: $3E $02
    call SpawnNewEntity_trampoline                ; $75F6: $CD $86 $3B
    call PlayBombExplosionSfx                     ; $75F9: $CD $4B $0C
    ldh  a, [hMultiPurpose0]                      ; $75FC: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $75FE: $21 $00 $C2
    add  hl, de                                   ; $7601: $19
    ld   [hl], a                                  ; $7602: $77
    ldh  a, [hMultiPurpose1]                      ; $7603: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7605: $21 $10 $C2
    add  hl, de                                   ; $7608: $19
    ld   [hl], a                                  ; $7609: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $760A: $21 $E0 $C2
    add  hl, de                                   ; $760D: $19
    ld   [hl], $17                                ; $760E: $36 $17
    ld   hl, wEntitiesPrivateState4Table          ; $7610: $21 $40 $C4
    add  hl, de                                   ; $7613: $19
    ld   [hl], $01                                ; $7614: $36 $01
    jp   func_005_7535                            ; $7616: $C3 $35 $75

.jr_7619
    ldh  a, [hFrameCounter]                       ; $7619: $F0 $E7
    ld   hl, wEntitiesFlashCountdownTable         ; $761B: $21 $20 $C4
    add  hl, bc                                   ; $761E: $09
    ld   [hl], a                                  ; $761F: $77
    ret                                           ; $7620: $C9

jr_005_7621:
    ldh  a, [hFrameCounter]                       ; $7621: $F0 $E7
    and  $07                                      ; $7623: $E6 $07
    jr   nz, .jr_7635                             ; $7625: $20 $0E

    ld   a, [wD201]                               ; $7627: $FA $01 $D2
    ld   e, a                                     ; $762A: $5F
    ld   d, b                                     ; $762B: $50
    ld   hl, wEntitiesPrivateState3Table          ; $762C: $21 $D0 $C2
    add  hl, de                                   ; $762F: $19
    ld   a, [hl]                                  ; $7630: $7E
    and  a                                        ; $7631: $A7
    jr   z, .jr_7635                              ; $7632: $28 $01

    dec  [hl]                                     ; $7634: $35

.jr_7635
    ld   hl, wEntitiesInertiaTable                ; $7635: $21 $D0 $C3
    add  hl, bc                                   ; $7638: $09
    ld   a, [hl]                                  ; $7639: $7E
    inc  a                                        ; $763A: $3C
    and  $7F                                      ; $763B: $E6 $7F
    ld   [hl], a                                  ; $763D: $77
    ld   e, a                                     ; $763E: $5F
    ld   d, b                                     ; $763F: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $7640: $21 $00 $D0
    add  hl, de                                   ; $7643: $19
    ldh  a, [hActiveEntityPosX]                   ; $7644: $F0 $EE
    ld   [hl], a                                  ; $7646: $77
    ld   hl, wD100                                ; $7647: $21 $00 $D1
    add  hl, de                                   ; $764A: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $764B: $F0 $EC
    ld   [hl], a                                  ; $764D: $77
    ld   hl, wEntitiesPrivateCountdown2Table      ; $764E: $21 $00 $C3
    add  hl, bc                                   ; $7651: $09
    ld   a, [hl]                                  ; $7652: $7E
    and  a                                        ; $7653: $A7
    jr   z, .jr_765B                              ; $7654: $28 $05

    call UpdateEntityPosWithSpeed_05              ; $7656: $CD $B1 $7A
    jr   jr_005_765E                              ; $7659: $18 $03

.jr_765B
    call func_005_7702                            ; $765B: $CD $02 $77

jr_005_765E:
    ld   hl, wEntitiesStateTable                  ; $765E: $21 $90 $C2
    add  hl, bc                                   ; $7661: $09
    ld   e, [hl]                                  ; $7662: $5E
    srl  e                                        ; $7663: $CB $3B
    ld   d, b                                     ; $7665: $50
    ld   hl, Data_005_75C9                        ; $7666: $21 $C9 $75
    add  hl, de                                   ; $7669: $19
    ld   a, [hl]                                  ; $766A: $7E
    jp   SetEntitySpriteVariant                   ; $766B: $C3 $0C $3B

func_005_766E::
    ldh  a, [hActiveEntitySpriteVariant]          ; $766E: $F0 $F1
    rla                                           ; $7670: $17
    rla                                           ; $7671: $17
    rla                                           ; $7672: $17
    rla                                           ; $7673: $17
    rla                                           ; $7674: $17
    and  $E0                                      ; $7675: $E6 $E0
    ld   e, a                                     ; $7677: $5F
    ld   d, b                                     ; $7678: $50
    ld   hl, Data_005_7782                        ; $7679: $21 $82 $77
    add  hl, de                                   ; $767C: $19
    ld   c, $08                                   ; $767D: $0E $08
    call RenderActiveEntitySpritesRect            ; $767F: $CD $E6 $3C
    ld   a, $08                                   ; $7682: $3E $08
    call func_015_7964_trampoline                 ; $7684: $CD $A0 $3D
    ld   hl, wEntitiesInertiaTable                ; $7687: $21 $D0 $C3
    add  hl, bc                                   ; $768A: $09
    ld   a, [hl]                                  ; $768B: $7E
    ldh  [hMultiPurpose0], a                      ; $768C: $E0 $D7
    ldh  a, [hMultiPurpose0]                      ; $768E: $F0 $D7
    sub  $0C                                      ; $7690: $D6 $0C
    and  $7F                                      ; $7692: $E6 $7F
    ld   e, a                                     ; $7694: $5F
    ld   d, b                                     ; $7695: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $7696: $21 $00 $D0
    add  hl, de                                   ; $7699: $19
    ld   a, [hl]                                  ; $769A: $7E
    ldh  [hActiveEntityPosX], a                   ; $769B: $E0 $EE
    ld   hl, wD100                                ; $769D: $21 $00 $D1
    add  hl, de                                   ; $76A0: $19
    ld   a, [hl]                                  ; $76A1: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $76A2: $E0 $EC
    ld   a, $00                                   ; $76A4: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $76A6: $E0 $F1
    ld   de, SlimeEelSpriteVariants               ; $76A8: $11 $CC $72
    call RenderActiveEntitySpritesPair            ; $76AB: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $76AE: $F0 $D7
    sub  $18                                      ; $76B0: $D6 $18
    and  $7F                                      ; $76B2: $E6 $7F
    ld   e, a                                     ; $76B4: $5F
    ld   d, b                                     ; $76B5: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $76B6: $21 $00 $D0
    add  hl, de                                   ; $76B9: $19
    ld   a, [hl]                                  ; $76BA: $7E
    ldh  [hActiveEntityPosX], a                   ; $76BB: $E0 $EE
    ld   hl, wD100                                ; $76BD: $21 $00 $D1
    add  hl, de                                   ; $76C0: $19
    ld   a, [hl]                                  ; $76C1: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $76C2: $E0 $EC
    ld   a, $00                                   ; $76C4: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $76C6: $E0 $F1
    ld   de, SlimeEelSpriteVariants               ; $76C8: $11 $CC $72
    call RenderActiveEntitySpritesPair            ; $76CB: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $76CE: $F0 $D7
    sub  $24                                      ; $76D0: $D6 $24
    and  $7F                                      ; $76D2: $E6 $7F
    ld   e, a                                     ; $76D4: $5F
    ld   d, b                                     ; $76D5: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $76D6: $21 $00 $D0
    add  hl, de                                   ; $76D9: $19
    ld   a, [hl]                                  ; $76DA: $7E
    ldh  [hActiveEntityPosX], a                   ; $76DB: $E0 $EE
    ld   hl, wD100                                ; $76DD: $21 $00 $D1
    add  hl, de                                   ; $76E0: $19
    ld   a, [hl]                                  ; $76E1: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $76E2: $E0 $EC
    ld   a, $02                                   ; $76E4: $3E $02
    ldh  [hActiveEntitySpriteVariant], a          ; $76E6: $E0 $F1
    ld   de, SlimeEelSpriteVariants               ; $76E8: $11 $CC $72
    jp   RenderActiveEntitySpritesPair            ; $76EB: $C3 $C0 $3B

Data_005_76EE::
    db   $00, $06, $0C, $0E

Data_005_76F2::
    db   $10, $0E, $0C, $06, $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E

func_005_7702::
    call UpdateEntityPosWithSpeed_05              ; $7702: $CD $B1 $7A
    call label_3B44                               ; $7705: $CD $44 $3B
    call label_3B23                               ; $7708: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $770B: $21 $A0 $C2
    add  hl, bc                                   ; $770E: $09
    ld   a, [hl]                                  ; $770F: $7E
    and  a                                        ; $7710: $A7
    jr   z, jr_005_7730                           ; $7711: $28 $1D

    call GetRandomByte                            ; $7713: $CD $0D $28
    rra                                           ; $7716: $1F
    jr   c, .jr_7721                              ; $7717: $38 $08

    ld   hl, wEntitiesPrivateState2Table          ; $7719: $21 $C0 $C2
    add  hl, bc                                   ; $771C: $09
    ld   a, [hl]                                  ; $771D: $7E
    cpl                                           ; $771E: $2F
    inc  a                                        ; $771F: $3C
    ld   [hl], a                                  ; $7720: $77

.jr_7721
    ld   hl, wEntitiesStateTable                  ; $7721: $21 $90 $C2
    add  hl, bc                                   ; $7724: $09
    ld   a, [hl]                                  ; $7725: $7E
    add  $08                                      ; $7726: $C6 $08
    and  $0F                                      ; $7728: $E6 $0F
    ld   [hl], a                                  ; $772A: $77
    call GetEntityTransitionCountdown             ; $772B: $CD $05 $0C
    ld   [hl], $10                                ; $772E: $36 $10

jr_005_7730:
    call GetEntityPrivateCountdown1               ; $7730: $CD $00 $0C
    jr   nz, .jr_775E                             ; $7733: $20 $29

    ld   [hl], $04                                ; $7735: $36 $04
    ld   hl, wEntitiesPrivateState2Table          ; $7737: $21 $C0 $C2
    add  hl, bc                                   ; $773A: $09
    ld   a, [hl]                                  ; $773B: $7E
    ld   hl, wEntitiesStateTable                  ; $773C: $21 $90 $C2
    add  hl, bc                                   ; $773F: $09
    add  [hl]                                     ; $7740: $86
    and  $0F                                      ; $7741: $E6 $0F
    ld   [hl], a                                  ; $7743: $77
    ld   hl, wEntitiesStateTable                  ; $7744: $21 $90 $C2
    add  hl, bc                                   ; $7747: $09
    ld   e, [hl]                                  ; $7748: $5E
    ld   d, b                                     ; $7749: $50
    ld   hl, Data_005_76EE                        ; $774A: $21 $EE $76
    add  hl, de                                   ; $774D: $19
    ld   a, [hl]                                  ; $774E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $774F: $21 $50 $C2
    add  hl, bc                                   ; $7752: $09
    ld   [hl], a                                  ; $7753: $77
    ld   hl, Data_005_76F2                        ; $7754: $21 $F2 $76
    add  hl, de                                   ; $7757: $19
    ld   a, [hl]                                  ; $7758: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7759: $21 $40 $C2
    add  hl, bc                                   ; $775C: $09
    ld   [hl], a                                  ; $775D: $77

.jr_775E
    call GetEntityTransitionCountdown             ; $775E: $CD $05 $0C
    jr   nz, .ret_7776                            ; $7761: $20 $13

    call GetRandomByte                            ; $7763: $CD $0D $28
    and  $1F                                      ; $7766: $E6 $1F
    add  $10                                      ; $7768: $C6 $10
    ld   [hl], a                                  ; $776A: $77
    call GetRandomByte                            ; $776B: $CD $0D $28
    and  $02                                      ; $776E: $E6 $02
    dec  a                                        ; $7770: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $7771: $21 $C0 $C2
    add  hl, bc                                   ; $7774: $09
    ld   [hl], a                                  ; $7775: $77

.ret_7776
    ret                                           ; $7776: $C9

label_005_7777:
    ld   e, $80                                   ; $7777: $1E $80
    ld   hl, wD100                                ; $7779: $21 $00 $D1

.loop_777C
    xor  a                                        ; $777C: $AF
    ld   [hl+], a                                 ; $777D: $22
    dec  e                                        ; $777E: $1D
    jr   nz, .loop_777C                           ; $777F: $20 $FB

    ret                                           ; $7781: $C9

Data_005_7782::
    db   $F8, $F8, $60, $07, $F8, $00, $62, $07, $F8, $08, $62, $27, $F8, $10, $60, $27
    db   $08, $F8, $64, $07, $08, $00, $66, $07, $08, $08, $66, $27, $08, $10, $64, $27
    db   $F8, $F8, $64, $47, $F8, $00, $66, $47, $F8, $08, $66, $67, $F8, $10, $64, $67
    db   $08, $F8, $60, $47, $08, $00, $62, $47, $08, $08, $62, $67, $08, $10, $60, $67
    db   $F8, $F8, $68, $07, $F8, $00, $6A, $07, $F8, $08, $62, $27, $F8, $10, $60, $27
    db   $08, $F8, $68, $47, $08, $00, $6A, $47, $08, $08, $62, $67, $08, $10, $60, $67
    db   $F8, $F8, $60, $07, $F8, $00, $62, $07, $F8, $08, $6A, $27, $F8, $10, $68, $27
    db   $08, $F8, $60, $47, $08, $00, $62, $47, $08, $08, $6A, $67, $08, $10, $68, $67
    db   $F8, $F8, $60, $07, $F8, $00, $62, $07, $F8, $08, $62, $27, $F8, $10, $60, $27
    db   $08, $F8, $6C, $07, $08, $00, $6E, $07, $08, $08, $62, $67, $08, $10, $60, $67
    db   $F8, $F8, $60, $07, $F8, $00, $62, $07, $F8, $08, $62, $27, $F8, $10, $60, $27
    db   $08, $F8, $60, $47, $08, $00, $62, $47, $08, $08, $6E, $27, $08, $10, $6C, $27
    db   $F8, $F8, $6C, $47, $F8, $00, $6E, $47, $F8, $08, $62, $27, $F8, $10, $60, $27
    db   $08, $F8, $60, $47, $08, $00, $62, $47, $08, $08, $62, $67, $08, $10, $60, $67
    db   $F8, $F8, $60, $07, $F8, $00, $62, $07, $F8, $08, $6E, $67, $F8, $10, $6C, $67
    db   $08, $F8, $60, $47, $08, $00, $62, $47, $08, $08, $62, $67, $08, $10, $60, $67
    db   $F8, $F8, $60, $07, $F8, $00, $62, $07, $F8, $08, $62, $27, $F8, $10, $60, $27
    db   $08, $F8, $78, $07, $08, $00, $7A, $07, $08, $08, $7A, $27, $08, $10, $78, $27
    db   $08, $00, $76, $07, $08, $08, $76, $27, $08, $08, $76, $27, $08, $08, $76, $27
    db   $08, $08, $76, $27, $08, $08, $76, $27, $08, $08, $76, $27, $08, $08, $76, $27
    db   $08, $F8, $64, $07, $08, $00, $66, $07, $08, $08, $66, $27, $08, $10, $64, $27
    db   $08, $F8, $64, $07, $08, $00, $66, $07, $08, $08, $66, $27, $08, $10, $64, $27
    db   $08, $F8, $78, $07, $08, $00, $7A, $07, $08, $08, $7A, $27, $08, $10, $78, $27
    db   $08, $F8, $78, $07, $08, $00, $7A, $07, $08, $08, $7A, $27, $08, $10, $78, $27
    db   $F8, $00, $76, $47, $F8, $08, $76, $67, $F8, $08, $76, $67, $F8, $08, $76, $67
    db   $F8, $08, $76, $67, $F8, $08, $76, $67, $F8, $08, $76, $67, $F8, $08, $76, $67
    db   $F8, $F8, $64, $47, $F8, $00, $66, $47, $F8, $08, $66, $67, $F8, $10, $64, $67
    db   $F8, $F8, $64, $47, $F8, $00, $66, $47, $F8, $08, $66, $67, $F8, $10, $64, $67
    db   $F8, $F8, $78, $47, $F8, $00, $7A, $47, $F8, $08, $7A, $67, $F8, $10, $78, $67
    db   $F8, $F8, $78, $47, $F8, $00, $7A, $47, $F8, $08, $7A, $67, $F8, $10, $78, $67
    db   $08, $F8, $60, $47, $08, $00, $62, $47, $08, $08, $62, $67, $08, $10, $60, $67
    db   $F8, $F8, $78, $47, $F8, $00, $7A, $47, $F8, $08, $7A, $67, $F8, $10, $78, $67

func_005_7982::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7982: $F0 $F1
    ld   d, b                                     ; $7984: $50
    rla                                           ; $7985: $17
    rl   d                                        ; $7986: $CB $12
    rla                                           ; $7988: $17
    rl   d                                        ; $7989: $CB $12
    rla                                           ; $798B: $17
    rl   d                                        ; $798C: $CB $12
    rla                                           ; $798E: $17
    rl   d                                        ; $798F: $CB $12
    rla                                           ; $7991: $17
    rl   d                                        ; $7992: $CB $12
    and  $E0                                      ; $7994: $E6 $E0
    ld   e, a                                     ; $7996: $5F
    ld   hl, Data_005_7782                        ; $7997: $21 $82 $77
    add  hl, de                                   ; $799A: $19
    ld   c, $08                                   ; $799B: $0E $08
    call RenderActiveEntitySpritesRect            ; $799D: $CD $E6 $3C
    ld   a, $08                                   ; $79A0: $3E $08
    jp   func_015_7964_trampoline                 ; $79A2: $C3 $A0 $3D

Data_005_79A5::
    db   $F2, $0E

func_005_79A7::
    ldh  a, [hFrameCounter]                       ; $79A7: $F0 $E7
    and  $10                                      ; $79A9: $E6 $10
    ld   a, $03                                   ; $79AB: $3E $03
    jr   z, .jr_79B0                              ; $79AD: $28 $01

    inc  a                                        ; $79AF: $3C

.jr_79B0
    ldh  [hActiveEntitySpriteVariant], a          ; $79B0: $E0 $F1
    nop                                           ; $79B2: $00

jr_005_79B3:
    ld   hl, wEntitiesDirectionTable              ; $79B3: $21 $80 $C3
    add  hl, bc                                   ; $79B6: $09
    ld   e, [hl]                                  ; $79B7: $5E
    ld   d, b                                     ; $79B8: $50
    ld   hl, Data_005_79A5                        ; $79B9: $21 $A5 $79
    add  hl, de                                   ; $79BC: $19
    ld   a, [hl]                                  ; $79BD: $7E
    ld   hl, hActiveEntityVisualPosY              ; $79BE: $21 $EC $FF
    add  [hl]                                     ; $79C1: $86
    ld   [hl], a                                  ; $79C2: $77
    cp   $14                                      ; $79C3: $FE $14
    jr   c, jr_005_7A1F                           ; $79C5: $38 $58

    cp   $7C                                      ; $79C7: $FE $7C
    jr   nc, jr_005_7A1F                          ; $79C9: $30 $54

    ld   de, SlimeEelSpriteVariants               ; $79CB: $11 $CC $72
    call RenderActiveEntitySpritesPair            ; $79CE: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $79D1: $F0 $F0
    cp   $04                                      ; $79D3: $FE $04
    jr   nc, jr_005_7A1D                          ; $79D5: $30 $46

    ldh  a, [hActiveEntitySpriteVariant]          ; $79D7: $F0 $F1
    and  a                                        ; $79D9: $A7
    jr   z, .jr_7A1A                              ; $79DA: $28 $3E

    xor  a                                        ; $79DC: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $79DD: $E0 $F1
    call label_3B70                               ; $79DF: $CD $70 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $79E2: $21 $20 $C4
    add  hl, bc                                   ; $79E5: $09
    ld   a, [hl]                                  ; $79E6: $7E
    cp   $16                                      ; $79E7: $FE $16
    jr   nz, .jr_7A1A                             ; $79E9: $20 $2F

    ld   hl, wD204                                ; $79EB: $21 $04 $D2
    inc  [hl]                                     ; $79EE: $34
    ld   a, [hl]                                  ; $79EF: $7E
    cp   $08                                      ; $79F0: $FE $08
    jr   nz, .jr_7A1A                             ; $79F2: $20 $26

    ld   a, [wD201]                               ; $79F4: $FA $01 $D2
    ld   e, a                                     ; $79F7: $5F
    ld   d, b                                     ; $79F8: $50
    ld   hl, wEntitiesStatusTable                 ; $79F9: $21 $80 $C2
    add  hl, de                                   ; $79FC: $19
    ld   [hl], b                                  ; $79FD: $70
    call IncrementEntityState                     ; $79FE: $CD $12 $3B
    ld   [hl], $04                                ; $7A01: $36 $04
    call GetEntityTransitionCountdown             ; $7A03: $CD $05 $0C
    ld   [hl], $FF                                ; $7A06: $36 $FF
    call label_27F2                               ; $7A08: $CD $F2 $27
    ld   a, $03                                   ; $7A0B: $3E $03
    ld   [wBossAgonySFXCountdown], a              ; $7A0D: $EA $A7 $C5
    ld   a, MUSIC_BOSS_DEFEAT                     ; $7A10: $3E $5E
    ld   [wMusicTrackToPlay], a                   ; $7A12: $EA $68 $D3
    call_open_dialog Dialog0B5                    ; $7A15: $3E $B5 $CD $85 $23

.jr_7A1A
    call label_3B44                               ; $7A1A: $CD $44 $3B

jr_005_7A1D:
    jr   jr_005_79B3                              ; $7A1D: $18 $94

jr_005_7A1F:
    call CopyEntityPositionToActivePosition       ; $7A1F: $CD $8A $3D
    ld   hl, wEntitiesFlashCountdownTable         ; $7A22: $21 $20 $C4
    add  hl, bc                                   ; $7A25: $09
    ld   a, [hl]                                  ; $7A26: $7E
    and  a                                        ; $7A27: $A7
    jr   nz, .ret_7A39                            ; $7A28: $20 $0F

    ld   hl, wEntitiesOptions1Table               ; $7A2A: $21 $30 $C4
    add  hl, bc                                   ; $7A2D: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF ; $7A2E: $36 $C0
    call label_3B70                               ; $7A30: $CD $70 $3B
    ld   hl, wEntitiesOptions1Table               ; $7A33: $21 $30 $C4
    add  hl, bc                                   ; $7A36: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS                ; $7A37: $36 $80

.ret_7A39
    ret                                           ; $7A39: $C9

