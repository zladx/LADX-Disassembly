EntityInitSlimeEel::
    call GetEntityTransitionCountdown             ;; 05:6CC6 $CD $05 $0C
    ld   [hl], $80                                ;; 05:6CC9 $36 $80
    xor  a                                        ;; 05:6CCB $AF
    ld   [wD200], a                               ;; 05:6CCC $EA $00 $D2
    ld   [wD203], a                               ;; 05:6CCF $EA $03 $D2
    ld   [wD204], a                               ;; 05:6CD2 $EA $04 $D2
    ld   hl, wEntitiesPrivateState5Table          ;; 05:6CD5 $21 $90 $C3
    add  hl, bc                                   ;; 05:6CD8 $09
    ld   [hl], $01                                ;; 05:6CD9 $36 $01
    ret

SlimeEelEntityHandler::
    call label_394D                               ;; 05:6CDC $CD $4D $39
    call BossIntro                                ;; 05:6CDF $CD $E8 $3E
    call DecrementEntityIgnoreHitsCountdown       ;; 05:6CE2 $CD $56 $0C
    ld   hl, wEntitiesPrivateState1Table          ;; 05:6CE5 $21 $B0 $C2
    add  hl, bc                                   ;; 05:6CE8 $09
    ld   a, [hl]                                  ;; 05:6CE9 $7E
    JP_TABLE                                      ;; 05:6CEA
._00 dw func_005_6CF1                             ;; 05:6CEB
._01 dw func_005_72E6                             ;; 05:6CED
._02 dw func_005_75D1                             ;; 05:6CEF

func_005_6CF1::
    ld   a, c                                     ;; 05:6CF1 $79
    ld   [wD201], a                               ;; 05:6CF2 $EA $01 $D2
    ldh  a, [hActiveEntityState]                  ;; 05:6CF5 $F0 $F0
    JP_TABLE                                      ;; 05:6CF7
._00 dw func_005_6D00                             ;; 05:6CF8
._01 dw func_005_6D42                             ;; 05:6CFA
._02 dw func_005_6E7D                             ;; 05:6CFC
._03 dw func_005_70EB                             ;; 05:6CFE

func_005_6D00::
    call GetEntityTransitionCountdown             ;; 05:6D00 $CD $05 $0C
    ret  nz                                       ;; 05:6D03 $C0

    ld   [hl], $80                                ;; 05:6D04 $36 $80
    ld   a, $FF                                   ;; 05:6D06 $3E $FF
    ld   [wScreenShakeCountdown], a               ;; 05:6D08 $EA $57 $C1
    ld   a, NOISE_SFX_SLIME_EEL_FLOOR_BREAK       ;; 05:6D0B $3E $3E
    ldh  [hNoiseSfx], a                           ;; 05:6D0D $E0 $F4
    ld   [wD3E8], a                               ;; 05:6D0F $EA $E8 $D3
    ld   a, $04                                   ;; 05:6D12 $3E $04
    ld   [wC158], a                               ;; 05:6D14 $EA $58 $C1
    jp   IncrementEntityState                     ;; 05:6D17 $C3 $12 $3B

Data_005_6D1A::
    db   $20, $60, $20, $60

Data_005_6D1E::
    db   $00, $00, $70, $70

Data_005_6D22::
    db   $08, $08, $08, $08, $09, $0B, $0B, $0A, $08, $08, $08, $08, $09, $0B, $0B, $0A
    db   $05, $07, $07, $06, $04, $04, $04, $04, $05, $07, $07, $06, $04, $04, $04, $04

func_005_6D42::
    ld   a, $38                                   ;; 05:6D42 $3E $38
    ldh  [hIntersectedObjectLeft], a              ;; 05:6D44 $E0 $CE
    add  $10                                      ;; 05:6D46 $C6 $10
    ld   hl, wEntitiesPosXTable                   ;; 05:6D48 $21 $00 $C2
    add  hl, bc                                   ;; 05:6D4B $09
    ld   [hl], a                                  ;; 05:6D4C $77
    ld   a, $30                                   ;; 05:6D4D $3E $30
    ldh  [hIntersectedObjectTop], a               ;; 05:6D4F $E0 $CD
    add  $18                                      ;; 05:6D51 $C6 $18
    ld   hl, wEntitiesPosYTable                   ;; 05:6D53 $21 $10 $C2
    add  hl, bc                                   ;; 05:6D56 $09
    ld   [hl], a                                  ;; 05:6D57 $77
    call GetEntityTransitionCountdown             ;; 05:6D58 $CD $05 $0C
    jp   nz, label_005_6E30                       ;; 05:6D5B $C2 $30 $6E

    ld   [hl], $FF                                ;; 05:6D5E $36 $FF
    xor  a                                        ;; 05:6D60 $AF
    ld   [wD3E8], a                               ;; 05:6D61 $EA $E8 $D3
    call IncrementEntityState                     ;; 05:6D64 $CD $12 $3B
    ld   a, $AF                                   ;; 05:6D67 $3E $AF
    ld   [wRoomObjectsArea + $45], a              ;; 05:6D69 $EA $45 $D7
    ld   a, $AF                                   ;; 05:6D6C $3E $AF
    ld   [wRoomObjectsArea + $46], a              ;; 05:6D6E $EA $46 $D7
    ld   a, $B0                                   ;; 05:6D71 $3E $B0
    ld   [wRoomObjectsArea + $55], a              ;; 05:6D73 $EA $55 $D7
    ld   a, $B0                                   ;; 05:6D76 $3E $B0
    ld   [wRoomObjectsArea + $56], a              ;; 05:6D78 $EA $56 $D7
    call GetEntityPrivateCountdown1               ;; 05:6D7B $CD $00 $0C

.jr_6D7E
    ld   [hl], $1F                                ;; 05:6D7E $36 $1F
    call GetEntitySlowTransitionCountdown         ;; 05:6D80 $CD $FB $0B
    ld   [hl], $B0                                ;; 05:6D83 $36 $B0
    call label_3E34                               ;; 05:6D85 $CD $34 $3E
    ld   hl, wEntitiesStatusTable                 ;; 05:6D88 $21 $80 $C2
    add  hl, bc                                   ;; 05:6D8B $09
    ld   [hl], $05                                ;; 05:6D8C $36 $05
    ld   hl, wEntitiesPosXTable                   ;; 05:6D8E $21 $00 $C2
    add  hl, bc                                   ;; 05:6D91 $09
    ld   a, [hl]                                  ;; 05:6D92 $7E
    add  $10                                      ;; 05:6D93 $C6 $10
    ld   [hl], a                                  ;; 05:6D95 $77
    call label_3E34                               ;; 05:6D96 $CD $34 $3E
    ld   hl, wEntitiesStatusTable                 ;; 05:6D99 $21 $80 $C2
    add  hl, bc                                   ;; 05:6D9C $09
    ld   [hl], $05                                ;; 05:6D9D $36 $05
    call label_3E34                               ;; 05:6D9F $CD $34 $3E
    call PlayBombExplosionSfx                     ;; 05:6DA2 $CD $4B $0C
    ld   hl, wEntitiesStatusTable                 ;; 05:6DA5 $21 $80 $C2
    add  hl, bc                                   ;; 05:6DA8 $09
    ld   [hl], $05                                ;; 05:6DA9 $36 $05
    call label_2887                               ;; 05:6DAB $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 05:6DAE $F0 $FE
    and  a                                        ;; 05:6DB0 $A7
    jr   z, .jr_6DFD                              ;; 05:6DB1 $28 $4A

    push bc                                       ;; 05:6DB3 $C5
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 05:6DB4 $F0 $CF
    ld   h, a                                     ;; 05:6DB6 $67
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6DB7 $F0 $D0
    ld   l, a                                     ;; 05:6DB9 $6F
    push hl                                       ;; 05:6DBA $E5
    inc  l                                        ;; 05:6DBB $2C
    ld   a, l                                     ;; 05:6DBC $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6DBD $E0 $D0
    push hl                                       ;; 05:6DBF $E5
    ld   a, $AF                                   ;; 05:6DC0 $3E $AF
    ld   [wDDD8], a                               ;; 05:6DC2 $EA $D8 $DD
    ld   a, $05                                   ;; 05:6DC5 $3E $05
    call func_91D                                 ;; 05:6DC7 $CD $1D $09
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6DCA $F0 $D0
    inc  a                                        ;; 05:6DCC $3C
    inc  a                                        ;; 05:6DCD $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6DCE $E0 $D0
    ld   a, $05                                   ;; 05:6DD0 $3E $05
    call func_91D                                 ;; 05:6DD2 $CD $1D $09
    pop  hl                                       ;; 05:6DD5 $E1
    ld   de, $40                                  ;; 05:6DD6 $11 $40 $00
    add  hl, de                                   ;; 05:6DD9 $19
    ld   a, h                                     ;; 05:6DDA $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 05:6DDB $E0 $CF
    ld   a, l                                     ;; 05:6DDD $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6DDE $E0 $D0
    ld   a, $B0                                   ;; 05:6DE0 $3E $B0
    ld   [wDDD8], a                               ;; 05:6DE2 $EA $D8 $DD
    ld   a, $05                                   ;; 05:6DE5 $3E $05
    call func_91D                                 ;; 05:6DE7 $CD $1D $09
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6DEA $F0 $D0
    inc  a                                        ;; 05:6DEC $3C
    inc  a                                        ;; 05:6DED $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6DEE $E0 $D0
    ld   a, $05                                   ;; 05:6DF0 $3E $05
    call func_91D                                 ;; 05:6DF2 $CD $1D $09
    pop  hl                                       ;; 05:6DF5 $E1
    ld   a, h                                     ;; 05:6DF6 $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 05:6DF7 $E0 $CF
    ld   a, l                                     ;; 05:6DF9 $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6DFA $E0 $D0
    pop  bc                                       ;; 05:6DFC $C1

.jr_6DFD
    ld   a, [wDrawCommandsSize]                   ;; 05:6DFD $FA $00 $D6
    ld   e, a                                     ;; 05:6E00 $5F
    ld   d, $00                                   ;; 05:6E01 $16 $00
    ld   hl, wDrawCommand                         ;; 05:6E03 $21 $01 $D6
    add  hl, de                                   ;; 05:6E06 $19
    add  $1C                                      ;; 05:6E07 $C6 $1C
    ld   [wDrawCommandsSize], a                   ;; 05:6E09 $EA $00 $D6
    call func_005_6E15                            ;; 05:6E0C $CD $15 $6E
    call func_005_6E15                            ;; 05:6E0F $CD $15 $6E
    call func_005_6E15                            ;; 05:6E12 $CD $15 $6E

func_005_6E15::
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 05:6E15 $F0 $CF
    ld   [hl+], a                                 ;; 05:6E17 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6E18 $F0 $D0
    inc  a                                        ;; 05:6E1A $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6E1B $E0 $D0
    ld   [hl+], a                                 ;; 05:6E1D $22
    ld   a, $83                                   ;; 05:6E1E $3E $83
    ld   [hl+], a                                 ;; 05:6E20 $22
    ld   a, $76                                   ;; 05:6E21 $3E $76
    ld   [hl+], a                                 ;; 05:6E23 $22
    ld   a, $7E                                   ;; 05:6E24 $3E $7E
    ld   [hl+], a                                 ;; 05:6E26 $22
    ld   a, $7E                                   ;; 05:6E27 $3E $7E
    ld   [hl+], a                                 ;; 05:6E29 $22
    ld   a, $77                                   ;; 05:6E2A $3E $77
    ld   [hl+], a                                 ;; 05:6E2C $22
    xor  a                                        ;; 05:6E2D $AF
    ld   [hl], a                                  ;; 05:6E2E $77
    ret                                           ;; 05:6E2F $C9

label_005_6E30:
    cp   $40                                      ;; 05:6E30 $FE $40
    jp   nz, label_005_6E7C                       ;; 05:6E32 $C2 $7C $6E

    call label_2887                               ;; 05:6E35 $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ;; 05:6E38 $FA $00 $D6
    ld   e, a                                     ;; 05:6E3B $5F
    ld   d, $00                                   ;; 05:6E3C $16 $00
    ld   hl, wDrawCommand                         ;; 05:6E3E $21 $01 $D6
    add  hl, de                                   ;; 05:6E41 $19
    add  $1C                                      ;; 05:6E42 $C6 $1C
    ld   [wDrawCommandsSize], a                   ;; 05:6E44 $EA $00 $D6
    call func_005_6E4A                            ;; 05:6E47 $CD $4A $6E

func_005_6E4A::
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 05:6E4A $F0 $CF
    ld   [hl+], a                                 ;; 05:6E4C $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6E4D $F0 $D0
    inc  a                                        ;; 05:6E4F $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6E50 $E0 $D0
    ld   [hl+], a                                 ;; 05:6E52 $22
    ld   a, $83                                   ;; 05:6E53 $3E $83
    ld   [hl+], a                                 ;; 05:6E55 $22
    ld   a, $1C                                   ;; 05:6E56 $3E $1C
    ld   [hl+], a                                 ;; 05:6E58 $22
    ld   a, $1E                                   ;; 05:6E59 $3E $1E
    ld   [hl+], a                                 ;; 05:6E5B $22
    ld   a, $1C                                   ;; 05:6E5C $3E $1C
    ld   [hl+], a                                 ;; 05:6E5E $22
    ld   a, $1E                                   ;; 05:6E5F $3E $1E
    ld   [hl+], a                                 ;; 05:6E61 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 05:6E62 $F0 $CF
    ld   [hl+], a                                 ;; 05:6E64 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6E65 $F0 $D0
    inc  a                                        ;; 05:6E67 $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 05:6E68 $E0 $D0
    ld   [hl+], a                                 ;; 05:6E6A $22
    ld   a, $83                                   ;; 05:6E6B $3E $83
    ld   [hl+], a                                 ;; 05:6E6D $22
    ld   a, $1D                                   ;; 05:6E6E $3E $1D
    ld   [hl+], a                                 ;; 05:6E70 $22
    ld   a, $1F                                   ;; 05:6E71 $3E $1F
    ld   [hl+], a                                 ;; 05:6E73 $22
    ld   a, $1D                                   ;; 05:6E74 $3E $1D
    ld   [hl+], a                                 ;; 05:6E76 $22
    ld   a, $1F                                   ;; 05:6E77 $3E $1F
    ld   [hl+], a                                 ;; 05:6E79 $22
    xor  a                                        ;; 05:6E7A $AF
    ld   [hl], a                                  ;; 05:6E7B $77

label_005_6E7C:
    ret                                           ;; 05:6E7C $C9

func_005_6E7D::
    ld   hl, wEntitiesPosXTable                   ;; 05:6E7D $21 $00 $C2
    add  hl, bc                                   ;; 05:6E80 $09
    ld   a, [hl]                                  ;; 05:6E81 $7E
    push af                                       ;; 05:6E82 $F5
    ld   hl, wEntitiesPosYTable                   ;; 05:6E83 $21 $10 $C2
    add  hl, bc                                   ;; 05:6E86 $09
    ld   a, [hl]                                  ;; 05:6E87 $7E
    push af                                       ;; 05:6E88 $F5
    call func_005_70EB                            ;; 05:6E89 $CD $EB $70
    pop  af                                       ;; 05:6E8C $F1
    ld   hl, wEntitiesPosYTable                   ;; 05:6E8D $21 $10 $C2
    add  hl, bc                                   ;; 05:6E90 $09
    ld   [hl], a                                  ;; 05:6E91 $77
    pop  af                                       ;; 05:6E92 $F1
    ld   hl, wEntitiesPosXTable                   ;; 05:6E93 $21 $00 $C2
    add  hl, bc                                   ;; 05:6E96 $09
    ld   [hl], a                                  ;; 05:6E97 $77
    call CopyEntityPositionToActivePosition       ;; 05:6E98 $CD $8A $3D
    call GetEntityTransitionCountdown             ;; 05:6E9B $CD $05 $0C
    jp   z, IncrementEntityState                  ;; 05:6E9E $CA $12 $3B

    cp   $98                                      ;; 05:6EA1 $FE $98
    jr   z, .jr_6EB0                              ;; 05:6EA3 $28 $0B

    cp   $68                                      ;; 05:6EA5 $FE $68
    jr   z, .jr_6EB0                              ;; 05:6EA7 $28 $07

    cp   $38                                      ;; 05:6EA9 $FE $38
    jr   z, .jr_6EB0                              ;; 05:6EAB $28 $03

    cp   $08                                      ;; 05:6EAD $FE $08
    ret  nz                                       ;; 05:6EAF $C0

.jr_6EB0
    ld   hl, wEntitiesInertiaTable                ;; 05:6EB0 $21 $D0 $C3
    add  hl, bc                                   ;; 05:6EB3 $09
    ld   a, [hl]                                  ;; 05:6EB4 $7E
    cp   $04                                      ;; 05:6EB5 $FE $04
    ret  z                                        ;; 05:6EB7 $C8

    inc  [hl]                                     ;; 05:6EB8 $34
    ld   e, a                                     ;; 05:6EB9 $5F
    ld   d, b                                     ;; 05:6EBA $50
    ld   hl, Data_005_6D1A                        ;; 05:6EBB $21 $1A $6D
    add  hl, de                                   ;; 05:6EBE $19
    ld   a, [hl]                                  ;; 05:6EBF $7E
    ldh  [hIntersectedObjectLeft], a              ;; 05:6EC0 $E0 $CE
    ld   hl, Data_005_6D1E                        ;; 05:6EC2 $21 $1E $6D
    add  hl, de                                   ;; 05:6EC5 $19
    ld   a, [hl]                                  ;; 05:6EC6 $7E
    ldh  [hIntersectedObjectTop], a               ;; 05:6EC7 $E0 $CD
    sla  e                                        ;; 05:6EC9 $CB $23
    sla  e                                        ;; 05:6ECB $CB $23
    sla  e                                        ;; 05:6ECD $CB $23
    ld   hl, Data_005_6D22                        ;; 05:6ECF $21 $22 $6D
    add  hl, de                                   ;; 05:6ED2 $19
    push hl                                       ;; 05:6ED3 $E5
    call label_2887                               ;; 05:6ED4 $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ;; 05:6ED7 $FA $00 $D6
    ld   e, a                                     ;; 05:6EDA $5F
    ld   d, $00                                   ;; 05:6EDB $16 $00
    ld   hl, wDrawCommand                         ;; 05:6EDD $21 $01 $D6
    add  hl, de                                   ;; 05:6EE0 $19
    add  $0E                                      ;; 05:6EE1 $C6 $0E
    ld   [wDrawCommandsSize], a                   ;; 05:6EE3 $EA $00 $D6
    pop  de                                       ;; 05:6EE6 $D1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 05:6EE7 $F0 $CF
    ld   [hl+], a                                 ;; 05:6EE9 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6EEA $F0 $D0
    ld   [hl+], a                                 ;; 05:6EEC $22
    ld   a, $03                                   ;; 05:6EED $3E $03
    ld   [hl+], a                                 ;; 05:6EEF $22
    ld   a, [de]                                  ;; 05:6EF0 $1A
    inc  de                                       ;; 05:6EF1 $13
    ld   [hl+], a                                 ;; 05:6EF2 $22
    ld   a, [de]                                  ;; 05:6EF3 $1A
    inc  de                                       ;; 05:6EF4 $13
    ld   [hl+], a                                 ;; 05:6EF5 $22
    ld   a, [de]                                  ;; 05:6EF6 $1A
    inc  de                                       ;; 05:6EF7 $13
    ld   [hl+], a                                 ;; 05:6EF8 $22
    ld   a, [de]                                  ;; 05:6EF9 $1A
    inc  de                                       ;; 05:6EFA $13
    ld   [hl+], a                                 ;; 05:6EFB $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 05:6EFC $F0 $CF
    ld   [hl+], a                                 ;; 05:6EFE $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 05:6EFF $F0 $D0
    add  $20                                      ;; 05:6F01 $C6 $20
    ld   [hl+], a                                 ;; 05:6F03 $22
    ld   a, $03                                   ;; 05:6F04 $3E $03
    ld   [hl+], a                                 ;; 05:6F06 $22
    ld   a, [de]                                  ;; 05:6F07 $1A
    inc  de                                       ;; 05:6F08 $13
    ld   [hl+], a                                 ;; 05:6F09 $22
    ld   a, [de]                                  ;; 05:6F0A $1A
    inc  de                                       ;; 05:6F0B $13
    ld   [hl+], a                                 ;; 05:6F0C $22
    ld   a, [de]                                  ;; 05:6F0D $1A
    inc  de                                       ;; 05:6F0E $13
    ld   [hl+], a                                 ;; 05:6F0F $22
    ld   a, [de]                                  ;; 05:6F10 $1A
    ld   [hl+], a                                 ;; 05:6F11 $22
    xor  a                                        ;; 05:6F12 $AF
    ld   [hl], a                                  ;; 05:6F13 $77
    ld   a, $D5                                   ;; 05:6F14 $3E $D5
    ld   [wRoomObjectsArea + $13], a              ;; 05:6F16 $EA $13 $D7
    ld   [wRoomObjectsArea + $17], a              ;; 05:6F19 $EA $17 $D7
    ld   a, $D6                                   ;; 05:6F1C $3E $D6
    ld   [wRoomObjectsArea + $14], a              ;; 05:6F1E $EA $14 $D7
    ld   [wRoomObjectsArea + $18], a              ;; 05:6F21 $EA $18 $D7
    ld   a, $D7                                   ;; 05:6F24 $3E $D7
    ld   [wRoomObjectsArea + $83], a              ;; 05:6F26 $EA $83 $D7
    ld   [wRoomObjectsArea + $87], a              ;; 05:6F29 $EA $87 $D7
    ld   a, $D8                                   ;; 05:6F2C $3E $D8
    ld   [wRoomObjectsArea + $84], a              ;; 05:6F2E $EA $84 $D7
    ld   [wRoomObjectsArea + $88], a              ;; 05:6F31 $EA $88 $D7
    ld   a, ENTITY_SLIME_EEL                      ;; 05:6F34 $3E $5D
    call SpawnNewEntity_trampoline                ;; 05:6F36 $CD $86 $3B
    ld   hl, wEntitiesPrivateState1Table          ;; 05:6F39 $21 $B0 $C2
    add  hl, de                                   ;; 05:6F3C $19
    ld   [hl], $01                                ;; 05:6F3D $36 $01
    ld   hl, wEntitiesPosXTable                   ;; 05:6F3F $21 $00 $C2
    add  hl, de                                   ;; 05:6F42 $19
    ldh  a, [hIntersectedObjectLeft]              ;; 05:6F43 $F0 $CE
    add  $10                                      ;; 05:6F45 $C6 $10
    ld   [hl], a                                  ;; 05:6F47 $77
    ld   hl, wEntitiesPosXTable                   ;; 05:6F48 $21 $00 $C2
    add  hl, bc                                   ;; 05:6F4B $09
    ld   [hl], a                                  ;; 05:6F4C $77
    ld   hl, wEntitiesPosYTable                   ;; 05:6F4D $21 $10 $C2
    add  hl, de                                   ;; 05:6F50 $19
    ldh  a, [hIntersectedObjectTop]               ;; 05:6F51 $F0 $CD
    add  $10                                      ;; 05:6F53 $C6 $10
    ld   [hl], a                                  ;; 05:6F55 $77
    ld   hl, wEntitiesPosYTable                   ;; 05:6F56 $21 $10 $C2
    add  hl, bc                                   ;; 05:6F59 $09
    add  $08                                      ;; 05:6F5A $C6 $08
    ld   [hl], a                                  ;; 05:6F5C $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 05:6F5D $21 $E0 $C2
    add  hl, de                                   ;; 05:6F60 $19
    ld   [hl], $2F                                ;; 05:6F61 $36 $2F
    ld   hl, wEntitiesInertiaTable                ;; 05:6F63 $21 $D0 $C3
    add  hl, bc                                   ;; 05:6F66 $09
    ld   a, [hl]                                  ;; 05:6F67 $7E
    cp   $03                                      ;; 05:6F68 $FE $03
    ld   a, $00                                   ;; 05:6F6A $3E $00
    jr   c, .jr_6F78                              ;; 05:6F6C $38 $0A

    ld   hl, wEntitiesPosYTable                   ;; 05:6F6E $21 $10 $C2
    add  hl, bc                                   ;; 05:6F71 $09
    ld   a, [hl]                                  ;; 05:6F72 $7E
    sub  $08                                      ;; 05:6F73 $D6 $08
    ld   [hl], a                                  ;; 05:6F75 $77
    ld   a, $01                                   ;; 05:6F76 $3E $01

.jr_6F78
    ld   hl, wEntitiesDirectionTable              ;; 05:6F78 $21 $80 $C3
    add  hl, de                                   ;; 05:6F7B $19
    ld   [hl], a                                  ;; 05:6F7C $77
    call label_3E34                               ;; 05:6F7D $CD $34 $3E
    ld   hl, wEntitiesStatusTable                 ;; 05:6F80 $21 $80 $C2
    add  hl, bc                                   ;; 05:6F83 $09
    ld   [hl], $05                                ;; 05:6F84 $36 $05
    jp   PlayBombExplosionSfx                     ;; 05:6F86 $C3 $4B $0C

Data_005_6F89::
    db   $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7   ;; 05:6F89
    db   $00, $09, $12, $1A, $21, $27, $2C, $2F   ;; 05:6F91
    db   $30, $2F, $2C, $27, $21, $1A, $12, $09   ;; 05:6F99
    db   $00, $F7, $EE, $E6, $DF, $D9, $D4, $D1   ;; 05:6FA1
    db   $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7   ;; 05:6FA9

Data_005_6FB1::
    db   $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9   ;; 05:6FB1
    db   $00, $07, $0E, $15, $1A, $1F, $23, $25   ;; 05:6FB9
    db   $26, $25, $23, $1F, $1A, $15, $0E, $07   ;; 05:6FC1
    db   $00, $F9, $F2, $EB, $E6, $E1, $DD, $DB   ;; 05:6FC9
    db   $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9   ;; 05:6FD1

Data_005_6FD9::
    db   $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB   ;; 05:6FD9
    db   $00, $05, $0A, $0F, $13, $17, $19, $1B   ;; 05:6FE1
    db   $1C, $1B, $19, $17, $13, $0F, $0A, $05   ;; 05:6FE9
    db   $00, $FB, $F6, $F1, $ED, $E9, $E7, $E5   ;; 05:6FF1
    db   $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB   ;; 05:6FF9

Data_005_7001::
    db   $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD   ;; 05:7001
    db   $00, $03, $06, $0A, $0C, $0E, $10, $11   ;; 05:7009
    db   $12, $11, $10, $0E, $0C, $0A, $06, $03   ;; 05:7011
    db   $00, $FD, $FA, $F6, $F4, $F2, $F0, $EF   ;; 05:7019
    db   $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD   ;; 05:7021

Data_005_7029::
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF   ;; 05:7029
    db   $00, $01, $03, $04, $05, $05, $06, $07   ;; 05:7031
    db   $08, $07, $06, $05, $05, $04, $03, $01   ;; 05:7039
    db   $00, $FF, $FD, $FC, $FB, $FB, $FA, $F9   ;; 05:7041
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF   ;; 05:7049

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
    call GetEntitySlowTransitionCountdown         ;; 05:70EB $CD $FB $0B
    ld   a, [wD200]                               ;; 05:70EE $FA $00 $D2
    and  a                                        ;; 05:70F1 $A7
    jr   z, .jr_70F6                              ;; 05:70F2 $28 $02

    ld   [hl], $20                                ;; 05:70F4 $36 $20

.jr_70F6
    ld   a, [hl]                                  ;; 05:70F6 $7E
    and  a                                        ;; 05:70F7 $A7
    jr   nz, .jr_7151                             ;; 05:70F8 $20 $57

    ld   [hl], $2C                                ;; 05:70FA $36 $2C
    ld   a, ENTITY_SLIME_EEL                      ;; 05:70FC $3E $5D
    call SpawnNewEntity_trampoline                ;; 05:70FE $CD $86 $3B
    jr   c, .jr_7151                              ;; 05:7101 $38 $4E

    ld   hl, wEntitiesHealthTable                 ;; 05:7103 $21 $60 $C3
    add  hl, de                                   ;; 05:7106 $19
    ld   [hl], $FF                                ;; 05:7107 $36 $FF
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:7109 $21 $B0 $C3
    add  hl, de                                   ;; 05:710C $19
    ld   [hl], $FF                                ;; 05:710D $36 $FF
    ld   hl, wEntitiesPrivateState1Table          ;; 05:710F $21 $B0 $C2
    add  hl, de                                   ;; 05:7112 $19
    ld   [hl], $01                                ;; 05:7113 $36 $01
    ld   hl, wEntitiesStateTable                  ;; 05:7115 $21 $90 $C2
    add  hl, de                                   ;; 05:7118 $19
    ld   [hl], $01                                ;; 05:7119 $36 $01
    push bc                                       ;; 05:711B $C5
    call GetRandomByte                            ;; 05:711C $CD $0D $28
    and  $03                                      ;; 05:711F $E6 $03
    ld   c, a                                     ;; 05:7121 $4F
    ld   hl, Data_005_70DF                        ;; 05:7122 $21 $DF $70
    add  hl, bc                                   ;; 05:7125 $09
    ld   a, [hl]                                  ;; 05:7126 $7E
    ld   hl, wEntitiesPosXTable                   ;; 05:7127 $21 $00 $C2
    add  hl, de                                   ;; 05:712A $19
    ld   [hl], a                                  ;; 05:712B $77
    ld   hl, wEntitiesPrivateState2Table          ;; 05:712C $21 $C0 $C2
    add  hl, de                                   ;; 05:712F $19
    ld   [hl], a                                  ;; 05:7130 $77
    ld   hl, Data_005_70E3                        ;; 05:7131 $21 $E3 $70
    add  hl, bc                                   ;; 05:7134 $09
    ld   a, [hl]                                  ;; 05:7135 $7E
    ld   hl, wEntitiesPosYTable                   ;; 05:7136 $21 $10 $C2
    add  hl, de                                   ;; 05:7139 $19
    ld   [hl], a                                  ;; 05:713A $77
    ld   hl, wEntitiesPrivateState3Table          ;; 05:713B $21 $D0 $C2
    add  hl, de                                   ;; 05:713E $19
    ld   [hl], a                                  ;; 05:713F $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 05:7140 $21 $E0 $C2
    add  hl, de                                   ;; 05:7143 $19
    ld   [hl], $5F                                ;; 05:7144 $36 $5F
    ld   hl, Data_005_70E7                        ;; 05:7146 $21 $E7 $70
    add  hl, bc                                   ;; 05:7149 $09
    ld   a, [hl]                                  ;; 05:714A $7E
    ld   hl, wEntitiesDirectionTable              ;; 05:714B $21 $80 $C3
    add  hl, de                                   ;; 05:714E $19
    ld   [hl], a                                  ;; 05:714F $77
    pop  bc                                       ;; 05:7150 $C1

.jr_7151
    call GetEntityPrivateCountdown1               ;; 05:7151 $CD $00 $0C
    jr   z, .jr_7167                              ;; 05:7154 $28 $11

    rra                                           ;; 05:7156 $1F
    rra                                           ;; 05:7157 $1F
    rra                                           ;; 05:7158 $1F
    and  $03                                      ;; 05:7159 $E6 $03
    ld   e, a                                     ;; 05:715B $5F
    ld   d, b                                     ;; 05:715C $50
    ld   hl, Data_005_70DB                        ;; 05:715D $21 $DB $70
    add  hl, de                                   ;; 05:7160 $19
    ld   a, [hl]                                  ;; 05:7161 $7E
    ld   hl, wEntitiesPrivateState3Table          ;; 05:7162 $21 $D0 $C2
    add  hl, bc                                   ;; 05:7165 $09
    ld   [hl], a                                  ;; 05:7166 $77

.jr_7167
    ld   hl, wEntitiesPrivateState4Table          ;; 05:7167 $21 $40 $C4
    add  hl, bc                                   ;; 05:716A $09
    ld   a, [hl]                                  ;; 05:716B $7E
    and  $07                                      ;; 05:716C $E6 $07
    ld   hl, wD200                                ;; 05:716E $21 $00 $D2
    or   [hl]                                     ;; 05:7171 $B6
    jr   nz, .jr_7188                             ;; 05:7172 $20 $14

    ldh  a, [hActiveEntityState]                  ;; 05:7174 $F0 $F0
    cp   $03                                      ;; 05:7176 $FE $03
    jr   nz, .jr_7188                             ;; 05:7178 $20 $0E

    ld   hl, wEntitiesPrivateState5Table          ;; 05:717A $21 $90 $C3
    add  hl, bc                                   ;; 05:717D $09
    ld   e, [hl]                                  ;; 05:717E $5E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:717F $21 $C0 $C2
    add  hl, bc                                   ;; 05:7182 $09
    ld   a, [hl]                                  ;; 05:7183 $7E
    add  e                                        ;; 05:7184 $83
    and  $1F                                      ;; 05:7185 $E6 $1F
    ld   [hl], a                                  ;; 05:7187 $77

.jr_7188
    ld   a, [wD200]                               ;; 05:7188 $FA $00 $D2
    and  a                                        ;; 05:718B $A7
    ld   a, $00                                   ;; 05:718C $3E $00
    jr   nz, .jr_719A                             ;; 05:718E $20 $0A

    ld   hl, wEntitiesPrivateState4Table          ;; 05:7190 $21 $40 $C4
    add  hl, bc                                   ;; 05:7193 $09
    inc  [hl]                                     ;; 05:7194 $34
    ld   a, [hl]                                  ;; 05:7195 $7E
    rra                                           ;; 05:7196 $1F
    rra                                           ;; 05:7197 $1F
    and  $1F                                      ;; 05:7198 $E6 $1F

.jr_719A
    ldh  [hMultiPurposeG], a                      ;; 05:719A $E0 $E8
    ld   hl, wEntitiesPosXTable                   ;; 05:719C $21 $00 $C2
    add  hl, bc                                   ;; 05:719F $09
    ld   [hl], $50                                ;; 05:71A0 $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 05:71A2 $21 $10 $C2
    add  hl, bc                                   ;; 05:71A5 $09
    ld   [hl], $48                                ;; 05:71A6 $36 $48
    ldh  a, [hMultiPurposeG]                      ;; 05:71A8 $F0 $E8
    ld   e, a                                     ;; 05:71AA $5F
    ld   d, b                                     ;; 05:71AB $50
    ld   hl, Data_005_7051                        ;; 05:71AC $21 $51 $70
    add  hl, de                                   ;; 05:71AF $19
    ld   a, [hl]                                  ;; 05:71B0 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:71B1 $21 $C0 $C2
    add  hl, bc                                   ;; 05:71B4 $09
    add  [hl]                                     ;; 05:71B5 $86
    and  $1F                                      ;; 05:71B6 $E6 $1F
    ld   e, a                                     ;; 05:71B8 $5F
    ld   d, b                                     ;; 05:71B9 $50
    push de                                       ;; 05:71BA $D5
    ld   hl, wEntitiesPrivateState3Table          ;; 05:71BB $21 $D0 $C2
    add  hl, bc                                   ;; 05:71BE $09
    ld   e, [hl]                                  ;; 05:71BF $5E
    sla  e                                        ;; 05:71C0 $CB $23
    ld   d, b                                     ;; 05:71C2 $50
    ld   hl, Data_005_70D1                        ;; 05:71C3 $21 $D1 $70
    add  hl, de                                   ;; 05:71C6 $19
    ld   a, [hl+]                                 ;; 05:71C7 $2A
    ld   h, [hl]                                  ;; 05:71C8 $66
    ld   l, a                                     ;; 05:71C9 $6F
    pop  de                                       ;; 05:71CA $D1
    ld   a, $02                                   ;; 05:71CB $3E $02
    call func_005_7283                            ;; 05:71CD $CD $83 $72
    ldh  a, [hMultiPurposeG]                      ;; 05:71D0 $F0 $E8
    ld   e, a                                     ;; 05:71D2 $5F
    ld   d, b                                     ;; 05:71D3 $50
    ld   hl, Data_005_7071                        ;; 05:71D4 $21 $71 $70
    add  hl, de                                   ;; 05:71D7 $19
    ld   a, [hl]                                  ;; 05:71D8 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:71D9 $21 $C0 $C2
    add  hl, bc                                   ;; 05:71DC $09
    add  [hl]                                     ;; 05:71DD $86
    and  $1F                                      ;; 05:71DE $E6 $1F
    ld   e, a                                     ;; 05:71E0 $5F
    ld   d, b                                     ;; 05:71E1 $50
    push de                                       ;; 05:71E2 $D5
    ld   hl, wEntitiesPrivateState3Table          ;; 05:71E3 $21 $D0 $C2
    add  hl, bc                                   ;; 05:71E6 $09
    ld   e, [hl]                                  ;; 05:71E7 $5E
    dec  e                                        ;; 05:71E8 $1D
    ld   a, e                                     ;; 05:71E9 $7B
    cp   $F0                                      ;; 05:71EA $FE $F0
    jp   nc, label_005_72CA                       ;; 05:71EC $D2 $CA $72

    sla  e                                        ;; 05:71EF $CB $23
    ld   d, b                                     ;; 05:71F1 $50
    ld   hl, Data_005_70D1                        ;; 05:71F2 $21 $D1 $70
    add  hl, de                                   ;; 05:71F5 $19
    ld   a, [hl+]                                 ;; 05:71F6 $2A
    ld   h, [hl]                                  ;; 05:71F7 $66
    ld   l, a                                     ;; 05:71F8 $6F
    pop  de                                       ;; 05:71F9 $D1
    ld   a, $01                                   ;; 05:71FA $3E $01
    call func_005_7283                            ;; 05:71FC $CD $83 $72
    ldh  a, [hMultiPurposeG]                      ;; 05:71FF $F0 $E8
    ld   e, a                                     ;; 05:7201 $5F
    ld   d, b                                     ;; 05:7202 $50
    ld   hl, Data_005_7091                        ;; 05:7203 $21 $91 $70
    add  hl, de                                   ;; 05:7206 $19
    ld   a, [hl]                                  ;; 05:7207 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:7208 $21 $C0 $C2
    add  hl, bc                                   ;; 05:720B $09
    add  [hl]                                     ;; 05:720C $86
    and  $1F                                      ;; 05:720D $E6 $1F
    ld   e, a                                     ;; 05:720F $5F
    ld   d, b                                     ;; 05:7210 $50
    push de                                       ;; 05:7211 $D5
    ld   hl, wEntitiesPrivateState3Table          ;; 05:7212 $21 $D0 $C2
    add  hl, bc                                   ;; 05:7215 $09
    ld   e, [hl]                                  ;; 05:7216 $5E
    dec  e                                        ;; 05:7217 $1D
    dec  e                                        ;; 05:7218 $1D
    ld   a, e                                     ;; 05:7219 $7B
    cp   $F0                                      ;; 05:721A $FE $F0
    jp   nc, label_005_72CA                       ;; 05:721C $D2 $CA $72

    sla  e                                        ;; 05:721F $CB $23
    ld   d, b                                     ;; 05:7221 $50
    ld   hl, Data_005_70D1                        ;; 05:7222 $21 $D1 $70
    add  hl, de                                   ;; 05:7225 $19
    ld   a, [hl+]                                 ;; 05:7226 $2A
    ld   h, [hl]                                  ;; 05:7227 $66
    ld   l, a                                     ;; 05:7228 $6F
    pop  de                                       ;; 05:7229 $D1
    ld   a, $01                                   ;; 05:722A $3E $01
    call func_005_7283                            ;; 05:722C $CD $83 $72
    ldh  a, [hMultiPurposeG]                      ;; 05:722F $F0 $E8
    ld   e, a                                     ;; 05:7231 $5F
    ld   d, b                                     ;; 05:7232 $50
    ld   hl, Data_005_70B1                        ;; 05:7233 $21 $B1 $70
    add  hl, de                                   ;; 05:7236 $19
    ld   a, [hl]                                  ;; 05:7237 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:7238 $21 $C0 $C2
    add  hl, bc                                   ;; 05:723B $09
    add  [hl]                                     ;; 05:723C $86
    and  $1F                                      ;; 05:723D $E6 $1F
    ld   e, a                                     ;; 05:723F $5F
    ld   d, b                                     ;; 05:7240 $50
    push de                                       ;; 05:7241 $D5
    ld   hl, wEntitiesPrivateState3Table          ;; 05:7242 $21 $D0 $C2
    add  hl, bc                                   ;; 05:7245 $09
    ld   e, [hl]                                  ;; 05:7246 $5E
    dec  e                                        ;; 05:7247 $1D
    dec  e                                        ;; 05:7248 $1D
    dec  e                                        ;; 05:7249 $1D
    ld   a, e                                     ;; 05:724A $7B
    cp   $F0                                      ;; 05:724B $FE $F0
    jp   nc, label_005_72CA                       ;; 05:724D $D2 $CA $72

    sla  e                                        ;; 05:7250 $CB $23
    ld   d, b                                     ;; 05:7252 $50
    ld   hl, Data_005_70D1                        ;; 05:7253 $21 $D1 $70
    add  hl, de                                   ;; 05:7256 $19
    ld   a, [hl+]                                 ;; 05:7257 $2A
    ld   h, [hl]                                  ;; 05:7258 $66
    ld   l, a                                     ;; 05:7259 $6F
    pop  de                                       ;; 05:725A $D1
    ld   a, $01                                   ;; 05:725B $3E $01
    call func_005_7283                            ;; 05:725D $CD $83 $72
    ld   hl, wEntitiesPrivateState2Table          ;; 05:7260 $21 $C0 $C2
    add  hl, bc                                   ;; 05:7263 $09
    ld   e, [hl]                                  ;; 05:7264 $5E
    ld   d, b                                     ;; 05:7265 $50
    push de                                       ;; 05:7266 $D5
    ld   hl, wEntitiesPrivateState3Table          ;; 05:7267 $21 $D0 $C2
    add  hl, bc                                   ;; 05:726A $09
    ld   e, [hl]                                  ;; 05:726B $5E
    dec  e                                        ;; 05:726C $1D
    dec  e                                        ;; 05:726D $1D
    dec  e                                        ;; 05:726E $1D
    dec  e                                        ;; 05:726F $1D
    ld   a, e                                     ;; 05:7270 $7B
    cp   $F0                                      ;; 05:7271 $FE $F0
    jp   nc, label_005_72CA                       ;; 05:7273 $D2 $CA $72

    sla  e                                        ;; 05:7276 $CB $23
    ld   d, b                                     ;; 05:7278 $50
    ld   hl, Data_005_70D1                        ;; 05:7279 $21 $D1 $70
    add  hl, de                                   ;; 05:727C $19
    ld   a, [hl+]                                 ;; 05:727D $2A
    ld   h, [hl]                                  ;; 05:727E $66
    ld   l, a                                     ;; 05:727F $6F
    pop  de                                       ;; 05:7280 $D1
    ld   a, $00                                   ;; 05:7281 $3E $00

func_005_7283::
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:7283 $E0 $F1
    add  hl, de                                   ;; 05:7285 $19
    ld   a, $48                                   ;; 05:7286 $3E $48
    add  [hl]                                     ;; 05:7288 $86
    ldh  [hActiveEntityVisualPosY], a             ;; 05:7289 $E0 $EC
    ld   a, l                                     ;; 05:728B $7D
    add  $08                                      ;; 05:728C $C6 $08
    ld   l, a                                     ;; 05:728E $6F
    ld   a, h                                     ;; 05:728F $7C
    adc  $00                                      ;; 05:7290 $CE $00
    ld   h, a                                     ;; 05:7292 $67
    ld   a, $50                                   ;; 05:7293 $3E $50
    add  [hl]                                     ;; 05:7295 $86
    ldh  [hActiveEntityPosX], a                   ;; 05:7296 $E0 $EE
    call RenderSlimeEel                           ;; 05:7298 $CD $E0 $72
    ldh  a, [hLinkPositionX]                      ;; 05:729B $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 05:729D $21 $EE $FF
    sub  [hl]                                     ;; 05:72A0 $96
    add  $08                                      ;; 05:72A1 $C6 $08
    cp   $10                                      ;; 05:72A3 $FE $10
    jr   nc, .ret_72C9                            ;; 05:72A5 $30 $22

    ldh  a, [hLinkPositionY]                      ;; 05:72A7 $F0 $99
    ld   hl, hActiveEntityVisualPosY              ;; 05:72A9 $21 $EC $FF
    sub  [hl]                                     ;; 05:72AC $96
    add  $08                                      ;; 05:72AD $C6 $08
    cp   $10                                      ;; 05:72AF $FE $10
    jr   nc, .ret_72C9                            ;; 05:72B1 $30 $16

    ld   a, [wLinkMotionState]                    ;; 05:72B3 $FA $1C $C1
    and  a                                        ;; 05:72B6 $A7
    jr   nz, .ret_72C9                            ;; 05:72B7 $20 $10

    call HurtBySpikes_trampoline                  ;; 05:72B9 $CD $18 $3B
    ld   a, $18                                   ;; 05:72BC $3E $18
    call GetVectorTowardsLink_trampoline          ;; 05:72BE $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 05:72C1 $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 05:72C3 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 05:72C5 $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 05:72C7 $E0 $9A

.ret_72C9
    ret                                           ;; 05:72C9 $C9

label_005_72CA:
    pop  de                                       ;; 05:72CA $D1
    ret                                           ;; 05:72CB $C9

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
    ld   de, SlimeEelSpriteVariants               ;; 05:72E0 $11 $CC $72
    jp   RenderActiveEntitySpritesPair            ;; 05:72E3 $C3 $C0 $3B

func_005_72E6::
    call func_005_7982                            ;; 05:72E6 $CD $82 $79
    call ReturnIfNonInteractive_05                ;; 05:72E9 $CD $3A $7A
    ldh  a, [hActiveEntityState]                  ;; 05:72EC $F0 $F0
    JP_TABLE                                      ;; 05:72EE
._00 dw func_005_7305                             ;; 05:72EF
._01 dw func_005_7363                             ;; 05:72F1
._02 dw func_005_7425                             ;; 05:72F3
._03 dw func_005_74B1                             ;; 05:72F5
._04 dw BossDestructionHandler_05                 ;; 05:72F7

Data_005_72F9::
    db   $09, $0A, $0B, $0B, $0B, $0B

Data_005_72FF::
    db   $0C, $0D, $0E, $0E, $0E, $0E

func_005_7305::
    call GetEntityTransitionCountdown             ;; 05:7305 $CD $05 $0C
    jp   z, func_005_7535                         ;; 05:7308 $CA $35 $75

    ld   e, a                                     ;; 05:730B $5F
    cp   $18                                      ;; 05:730C $FE $18
    jr   nz, .jr_7314                             ;; 05:730E $20 $04

    ld   a, WAVE_SFX_BOSS_GROWL                   ;; 05:7310 $3E $16
    ldh  [hWaveSfx], a                            ;; 05:7312 $E0 $F3

.jr_7314
    ld   a, e                                     ;; 05:7314 $7B
    rra                                           ;; 05:7315 $1F
    rra                                           ;; 05:7316 $1F
    rra                                           ;; 05:7317 $1F
    and  $07                                      ;; 05:7318 $E6 $07
    ld   e, a                                     ;; 05:731A $5F
    ld   d, b                                     ;; 05:731B $50
    ld   hl, wEntitiesDirectionTable              ;; 05:731C $21 $80 $C3
    add  hl, bc                                   ;; 05:731F $09
    ld   a, [hl]                                  ;; 05:7320 $7E
    and  a                                        ;; 05:7321 $A7
    ld   hl, Data_005_72F9                        ;; 05:7322 $21 $F9 $72
    jr   z, .jr_732A                              ;; 05:7325 $28 $03

    ld   hl, Data_005_72FF                        ;; 05:7327 $21 $FF $72

.jr_732A
    add  hl, de                                   ;; 05:732A $19
    ld   a, [hl]                                  ;; 05:732B $7E
    jp   SetEntitySpriteVariant                   ;; 05:732C $C3 $0C $3B

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
    call GetEntityTransitionCountdown             ;; 05:7363 $CD $05 $0C
    jp   z, func_005_7535                         ;; 05:7366 $CA $35 $75

    ld   e, a                                     ;; 05:7369 $5F
    cp   $20                                      ;; 05:736A $FE $20
    jr   nz, .jr_7372                             ;; 05:736C $20 $04

    ld   a, WAVE_SFX_BOSS_GROWL                   ;; 05:736E $3E $16
    ldh  [hWaveSfx], a                            ;; 05:7370 $E0 $F3

.jr_7372
    ld   a, e                                     ;; 05:7372 $7B
    rra                                           ;; 05:7373 $1F
    rra                                           ;; 05:7374 $1F
    and  $1F                                      ;; 05:7375 $E6 $1F
    ld   e, a                                     ;; 05:7377 $5F
    ld   d, b                                     ;; 05:7378 $50
    ld   hl, wEntitiesDirectionTable              ;; 05:7379 $21 $80 $C3
    add  hl, bc                                   ;; 05:737C $09
    ld   a, [hl]                                  ;; 05:737D $7E
    and  a                                        ;; 05:737E $A7
    ld   hl, Data_005_732F                        ;; 05:737F $21 $2F $73
    jr   z, .jr_7387                              ;; 05:7382 $28 $03

    ld   hl, Data_005_7347                        ;; 05:7384 $21 $47 $73

.jr_7387
    add  hl, de                                   ;; 05:7387 $19
    ld   a, [hl]                                  ;; 05:7388 $7E
    call SetEntitySpriteVariant                   ;; 05:7389 $CD $0C $3B
    cp   $0B                                      ;; 05:738C $FE $0B
    jr   z, .jr_7395                              ;; 05:738E $28 $05

    cp   $0E                                      ;; 05:7390 $FE $0E
    jp   nz, ret_005_7424                         ;; 05:7392 $C2 $24 $74

.jr_7395
    ldh  a, [hLinkDirection]                      ;; 05:7395 $F0 $9E
    and  $02                                      ;; 05:7397 $E6 $02
    jp   z, ret_005_7424                          ;; 05:7399 $CA $24 $74

    ld   a, [wC1A6]                               ;; 05:739C $FA $A6 $C1
    and  a                                        ;; 05:739F $A7
    jp   z, ret_005_7424                          ;; 05:73A0 $CA $24 $74

    dec  a                                        ;; 05:73A3 $3D
    ld   [wD202], a                               ;; 05:73A4 $EA $02 $D2
    ld   e, a                                     ;; 05:73A7 $5F
    ld   d, b                                     ;; 05:73A8 $50
    ld   hl, wEntitiesStatusTable                 ;; 05:73A9 $21 $80 $C2
    add  hl, de                                   ;; 05:73AC $19
    ld   a, [hl]                                  ;; 05:73AD $7E
    and  a                                        ;; 05:73AE $A7
    jr   z, ret_005_7424                          ;; 05:73AF $28 $73

    ld   hl, wEntitiesTypeTable                   ;; 05:73B1 $21 $A0 $C3
    add  hl, de                                   ;; 05:73B4 $19
    ld   a, [hl]                                  ;; 05:73B5 $7E
    cp   $03                                      ;; 05:73B6 $FE $03
    jr   nz, ret_005_7424                         ;; 05:73B8 $20 $6A

    ld   hl, wEntitiesPosXTable                   ;; 05:73BA $21 $00 $C2
    add  hl, de                                   ;; 05:73BD $19
    ldh  a, [hActiveEntityPosX]                   ;; 05:73BE $F0 $EE
    sub  [hl]                                     ;; 05:73C0 $96
    add  $08                                      ;; 05:73C1 $C6 $08
    cp   $10                                      ;; 05:73C3 $FE $10
    jr   nc, ret_005_7424                         ;; 05:73C5 $30 $5D

    ld   hl, wEntitiesPosYTable                   ;; 05:73C7 $21 $10 $C2
    add  hl, de                                   ;; 05:73CA $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:73CB $F0 $EC
    sub  [hl]                                     ;; 05:73CD $96
    add  $0C                                      ;; 05:73CE $C6 $0C
    cp   $18                                      ;; 05:73D0 $FE $18
    jr   nc, ret_005_7424                         ;; 05:73D2 $30 $50

    ld   a, [wD203]                               ;; 05:73D4 $FA $03 $D2
    inc  a                                        ;; 05:73D7 $3C
    ld   [wD203], a                               ;; 05:73D8 $EA $03 $D2
    cp   $04                                      ;; 05:73DB $FE $04
    jr   c, .jr_7414                              ;; 05:73DD $38 $35

    call GetRandomByte                            ;; 05:73DF $CD $0D $28
    and  $01                                      ;; 05:73E2 $E6 $01
    jr   nz, .jr_7414                             ;; 05:73E4 $20 $2E

    ld   hl, wEntitiesPrivateState1Table          ;; 05:73E6 $21 $B0 $C2
    add  hl, bc                                   ;; 05:73E9 $09
    ld   [hl], $02                                ;; 05:73EA $36 $02
    call GetEntitySlowTransitionCountdown         ;; 05:73EC $CD $FB $0B
    ld   [hl], $30                                ;; 05:73EF $36 $30
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:73F1 $21 $00 $C3
    add  hl, bc                                   ;; 05:73F4 $09
    ld   [hl], $20                                ;; 05:73F5 $36 $20
    ld   hl, wEntitiesDirectionTable              ;; 05:73F7 $21 $80 $C3
    add  hl, bc                                   ;; 05:73FA $09
    ld   e, [hl]                                  ;; 05:73FB $5E
    ld   d, b                                     ;; 05:73FC $50
    ld   hl, Data_005_735F                        ;; 05:73FD $21 $5F $73
    add  hl, de                                   ;; 05:7400 $19
    ld   a, [hl]                                  ;; 05:7401 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:7402 $21 $50 $C2
    add  hl, bc                                   ;; 05:7405 $09
    ld   [hl], a                                  ;; 05:7406 $77
    ld   hl, Data_005_7361                        ;; 05:7407 $21 $61 $73
    add  hl, de                                   ;; 05:740A $19
    ld   a, [hl]                                  ;; 05:740B $7E
    ld   hl, wEntitiesStateTable                  ;; 05:740C $21 $90 $C2
    add  hl, bc                                   ;; 05:740F $09
    ld   [hl], a                                  ;; 05:7410 $77
    jp   label_005_7777                           ;; 05:7411 $C3 $77 $77

.jr_7414
    call IncrementEntityState                     ;; 05:7414 $CD $12 $3B
    ld   a, [wD201]                               ;; 05:7417 $FA $01 $D2
    ld   e, a                                     ;; 05:741A $5F
    ld   d, b                                     ;; 05:741B $50
    ld   hl, wEntitiesPrivateState5Table          ;; 05:741C $21 $90 $C3
    add  hl, de                                   ;; 05:741F $19
    ld   a, [hl]                                  ;; 05:7420 $7E
    cpl                                           ;; 05:7421 $2F
    inc  a                                        ;; 05:7422 $3C
    ld   [hl], a                                  ;; 05:7423 $77

ret_005_7424:
    ret                                           ;; 05:7424 $C9

func_005_7425::
    call func_005_79A7                            ;; 05:7425 $CD $A7 $79
    ld   a, $01                                   ;; 05:7428 $3E $01
    ld   [wD200], a                               ;; 05:742A $EA $00 $D2
    ld   a, [wD202]                               ;; 05:742D $FA $02 $D2
    ld   e, a                                     ;; 05:7430 $5F
    ld   d, b                                     ;; 05:7431 $50
    ld   hl, wEntitiesStatusTable                 ;; 05:7432 $21 $80 $C2
    add  hl, de                                   ;; 05:7435 $19
    ld   a, [hl]                                  ;; 05:7436 $7E
    and  a                                        ;; 05:7437 $A7
    jr   z, jr_005_7478                           ;; 05:7438 $28 $3E

    ld   a, [wInvincibilityCounter]               ;; 05:743A $FA $C7 $DB
    and  a                                        ;; 05:743D $A7
    jr   nz, jr_005_7478                          ;; 05:743E $20 $38

    ld   hl, wEntitiesPosYTable                   ;; 05:7440 $21 $10 $C2
    add  hl, de                                   ;; 05:7443 $19
    ld   a, [hl]                                  ;; 05:7444 $7E
    ld   hl, wEntitiesPosYTable                   ;; 05:7445 $21 $10 $C2
    add  hl, bc                                   ;; 05:7448 $09
    ld   [hl], a                                  ;; 05:7449 $77
    ld   a, [wD201]                               ;; 05:744A $FA $01 $D2
    ld   e, a                                     ;; 05:744D $5F
    ld   d, b                                     ;; 05:744E $50
    ld   hl, wEntitiesPrivateState3Table          ;; 05:744F $21 $D0 $C2
    add  hl, de                                   ;; 05:7452 $19
    ld   a, [hl]                                  ;; 05:7453 $7E
    cp   $00                                      ;; 05:7454 $FE $00
    jr   z, .jr_745F                              ;; 05:7456 $28 $07

    ldh  a, [hFrameCounter]                       ;; 05:7458 $F0 $E7
    and  $03                                      ;; 05:745A $E6 $03
    jr   nz, .jr_745F                             ;; 05:745C $20 $01

    dec  [hl]                                     ;; 05:745E $35

.jr_745F
    ldh  a, [hFrameCounter]                       ;; 05:745F $F0 $E7
    and  $07                                      ;; 05:7461 $E6 $07
    jr   nz, .jr_7469                             ;; 05:7463 $20 $04

    ld   a, JINGLE_SLIME_EEL_PULL                 ;; 05:7465 $3E $29
    ldh  [hJingle], a                             ;; 05:7467 $E0 $F2

.jr_7469
    ld   hl, wEntitiesDirectionTable              ;; 05:7469 $21 $80 $C3
    add  hl, bc                                   ;; 05:746C $09
    ld   a, [hl]                                  ;; 05:746D $7E
    and  a                                        ;; 05:746E $A7
    ld   a, $00                                   ;; 05:746F $3E $00
    jr   z, .jr_7475                              ;; 05:7471 $28 $02

    ld   a, $01                                   ;; 05:7473 $3E $01

.jr_7475
    jp   SetEntitySpriteVariant                   ;; 05:7475 $C3 $0C $3B

jr_005_7478:
    call IncrementEntityState                     ;; 05:7478 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 05:747B $CD $05 $0C
    ld   [hl], $5F                                ;; 05:747E $36 $5F
    ret                                           ;; 05:7480 $C9

Data_005_7481::
    db   $10, $10, $0C, $08, $04, $03, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db   $01, $01, $01, $01, $01, $01, $01, $01

Data_005_7499::
    db   $03, $1F, $1F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F
    db   $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F

func_005_74B1::
    call func_005_79A7                            ;; 05:74B1 $CD $A7 $79
    ld   a, $01                                   ;; 05:74B4 $3E $01
    ld   [wD200], a                               ;; 05:74B6 $EA $00 $D2
    ld   hl, wEntitiesDirectionTable              ;; 05:74B9 $21 $80 $C3
    add  hl, bc                                   ;; 05:74BC $09
    ld   a, [hl]                                  ;; 05:74BD $7E
    and  a                                        ;; 05:74BE $A7
    ld   a, $08                                   ;; 05:74BF $3E $08
    jr   z, .jr_74C5                              ;; 05:74C1 $28 $02

    ld   a, $0F                                   ;; 05:74C3 $3E $0F

.jr_74C5
    call SetEntitySpriteVariant                   ;; 05:74C5 $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ;; 05:74C8 $F0 $98
    push af                                       ;; 05:74CA $F5
    ld   hl, wEntitiesPrivateState2Table          ;; 05:74CB $21 $C0 $C2
    add  hl, bc                                   ;; 05:74CE $09
    ld   a, [hl]                                  ;; 05:74CF $7E
    ldh  [hLinkPositionX], a                      ;; 05:74D0 $E0 $98
    ldh  a, [hLinkPositionY]                      ;; 05:74D2 $F0 $99
    push af                                       ;; 05:74D4 $F5
    ld   hl, wEntitiesPrivateState3Table          ;; 05:74D5 $21 $D0 $C2
    add  hl, bc                                   ;; 05:74D8 $09
    ld   a, [hl]                                  ;; 05:74D9 $7E
    ldh  [hLinkPositionY], a                      ;; 05:74DA $E0 $99
    call GetEntityTransitionCountdown             ;; 05:74DC $CD $05 $0C
    rra                                           ;; 05:74DF $1F
    rra                                           ;; 05:74E0 $1F
    and  $3F                                      ;; 05:74E1 $E6 $3F
    ld   e, a                                     ;; 05:74E3 $5F
    ld   d, b                                     ;; 05:74E4 $50
    ld   hl, Data_005_7481                        ;; 05:74E5 $21 $81 $74
    add  hl, de                                   ;; 05:74E8 $19
    ld   a, [hl]                                  ;; 05:74E9 $7E
    call GetVectorTowardsLink_trampoline          ;; 05:74EA $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                      ;; 05:74ED $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ;; 05:74EF $21 $40 $C2
    add  hl, bc                                   ;; 05:74F2 $09
    ld   [hl], a                                  ;; 05:74F3 $77
    ldh  a, [hMultiPurpose0]                      ;; 05:74F4 $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ;; 05:74F6 $21 $50 $C2
    add  hl, bc                                   ;; 05:74F9 $09
    ld   [hl], a                                  ;; 05:74FA $77
    call UpdateEntityPosWithSpeed_05              ;; 05:74FB $CD $B1 $7A
    ldh  a, [hLinkPositionY]                      ;; 05:74FE $F0 $99
    ld   hl, hActiveEntityVisualPosY              ;; 05:7500 $21 $EC $FF
    sub  [hl]                                     ;; 05:7503 $96
    add  $03                                      ;; 05:7504 $C6 $03
    cp   $06                                      ;; 05:7506 $FE $06
    jr   nc, .jr_750D                             ;; 05:7508 $30 $03

    call func_005_7535                            ;; 05:750A $CD $35 $75

.jr_750D
    pop  af                                       ;; 05:750D $F1
    ldh  [hLinkPositionY], a                      ;; 05:750E $E0 $99
    pop  af                                       ;; 05:7510 $F1
    ldh  [hLinkPositionX], a                      ;; 05:7511 $E0 $98
    call GetEntityTransitionCountdown             ;; 05:7513 $CD $05 $0C
    rra                                           ;; 05:7516 $1F
    rra                                           ;; 05:7517 $1F
    and  $3F                                      ;; 05:7518 $E6 $3F
    ld   e, a                                     ;; 05:751A $5F
    ld   d, b                                     ;; 05:751B $50
    ld   hl, Data_005_7499                        ;; 05:751C $21 $99 $74
    add  hl, de                                   ;; 05:751F $19
    ldh  a, [hFrameCounter]                       ;; 05:7520 $F0 $E7
    and  [hl]                                     ;; 05:7522 $A6
    jr   nz, .ret_7534                            ;; 05:7523 $20 $0F

    ld   a, [wD201]                               ;; 05:7525 $FA $01 $D2
    ld   e, a                                     ;; 05:7528 $5F
    ld   d, b                                     ;; 05:7529 $50
    ld   hl, wEntitiesPrivateState3Table          ;; 05:752A $21 $D0 $C2
    add  hl, de                                   ;; 05:752D $19
    ld   a, [hl]                                  ;; 05:752E $7E
    cp   $04                                      ;; 05:752F $FE $04
    jr   z, .ret_7534                             ;; 05:7531 $28 $01

    inc  [hl]                                     ;; 05:7533 $34

.ret_7534
    ret                                           ;; 05:7534 $C9

func_005_7535::
    xor  a                                        ;; 05:7535 $AF
    ld   [wD200], a                               ;; 05:7536 $EA $00 $D2
    jp   ClearEntityStatus_05                     ;; 05:7539 $C3 $4B $7B

; Loop until boss destruction animation is done, then call to load heart
; Used from 4 different bosses: Slime Eel, Anglerfish, Evil Eagle, Hot Head
BossDestructionHandler_05::
    call func_005_79A7                            ;; 05:753C $CD $A7 $79
    call GetEntityTransitionCountdown             ;; 05:753F $CD $05 $0C
    jp   z, DropHeartContainer_05                 ;; 05:7542 $CA $85 $75

    ld   hl, wEntitiesFlashCountdownTable         ;; 05:7545 $21 $20 $C4
    add  hl, bc                                   ;; 05:7548 $09
    ld   [hl], a                                  ;; 05:7549 $77
    cp   $80                                      ;; 05:754A $FE $80
    ret  nc                                       ;; 05:754C $D0

    jp   label_005_7550                           ;; 05:754D $C3 $50 $75

label_005_7550:
    and  $07                                      ;; 05:7550 $E6 $07
    ret  nz                                       ;; 05:7552 $C0

    call GetRandomByte                            ;; 05:7553 $CD $0D $28
    and  $1F                                      ;; 05:7556 $E6 $1F
    sub  $10                                      ;; 05:7558 $D6 $10
    ld   e, a                                     ;; 05:755A $5F
    ld   hl, hActiveEntityPosX                    ;; 05:755B $21 $EE $FF
    add  [hl]                                     ;; 05:755E $86
    ld   [hl], a                                  ;; 05:755F $77
    call GetRandomByte                            ;; 05:7560 $CD $0D $28
    and  $1F                                      ;; 05:7563 $E6 $1F
    sub  $10                                      ;; 05:7565 $D6 $10
    ld   e, a                                     ;; 05:7567 $5F
    ld   hl, hActiveEntityVisualPosY              ;; 05:7568 $21 $EC $FF
    add  [hl]                                     ;; 05:756B $86
    ld   [hl], a                                  ;; 05:756C $77
    jp   label_005_7570                           ;; 05:756D $C3 $70 $75

label_005_7570:
    call ReturnIfNonInteractive_05.allowInactiveEntity ;; 05:7570 $CD $40 $7A
    ldh  a, [hActiveEntityPosX]                   ;; 05:7573 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 05:7575 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:7577 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 05:7579 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 05:757B $3E $02
    call AddTranscientVfx                         ;; 05:757D $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 05:7580 $3E $13
    ldh  [hNoiseSfx], a                           ;; 05:7582 $E0 $F4
    ret                                           ;; 05:7584 $C9

; Load heart container value to load when boss is killed
; Used from 4 different bosses: Slime Eel, Anglerfish, Evil Eagle, Hot Head
DropHeartContainer_05::
    ld   a, ENTITY_HEART_CONTAINER                ;; 05:7585 $3E $36
    call SpawnNewEntity_trampoline                ;; 05:7587 $CD $86 $3B
    jr   .notEvilEagle                            ;; 05:758A $18 $0D

.evilEagle:
    ld   a, ENTITY_HEART_CONTAINER                ;; 05:758C $3E $36
    call SpawnNewEntity_trampoline                ;; 05:758E $CD $86 $3B
    ld   a, $48                                   ;; 05:7591 $3E $48
    ldh  [hMultiPurpose0], a                      ;; 05:7593 $E0 $D7
    ld   a, $10                                   ;; 05:7595 $3E $10
    ldh  [hMultiPurpose1], a                      ;; 05:7597 $E0 $D8

.notEvilEagle:
    ldh  a, [hMultiPurpose1]                      ;; 05:7599 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 05:759B $21 $10 $C2
    add  hl, de                                   ;; 05:759E $19
    ld   [hl], a                                  ;; 05:759F $77
    ldh  a, [hMultiPurpose0]                      ;; 05:75A0 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 05:75A2 $21 $00 $C2
    add  hl, de                                   ;; 05:75A5 $19
    ld   [hl], a                                  ;; 05:75A6 $77
    ldh  a, [hIsSideScrolling]                    ;; 05:75A7 $F0 $F9
    and  a                                        ;; 05:75A9 $A7
    jr   z, .jr_75B4                              ;; 05:75AA $28 $08

    ld   hl, wEntitiesSpeedYTable                 ;; 05:75AC $21 $50 $C2
    add  hl, bc                                   ;; 05:75AF $09
    ld   [hl], $F0                                ;; 05:75B0 $36 $F0
    jr   jr_005_75C0                              ;; 05:75B2 $18 $0C

.jr_75B4
    ld   hl, wEntitiesSpeedZTable                 ;; 05:75B4 $21 $20 $C3
    add  hl, de                                   ;; 05:75B7 $19
    ld   [hl], $10                                ;; 05:75B8 $36 $10
    ld   hl, wEntitiesPosZTable                   ;; 05:75BA $21 $10 $C3
    add  hl, de                                   ;; 05:75BD $19
    ld   [hl], $08                                ;; 05:75BE $36 $08

jr_005_75C0:
    call ClearEntityStatus_05                     ;; 05:75C0 $CD $4B $7B
    ld   hl, hNoiseSfx                            ;; 05:75C3 $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ;; 05:75C6 $36 $1A
    ret                                           ;; 05:75C8 $C9

Data_005_75C9::
    db   $03, $05, $00, $04, $02, $06, $01, $07

func_005_75D1::
    call func_005_766E                            ;; 05:75D1 $CD $6E $76
    call CopyEntityPositionToActivePosition       ;; 05:75D4 $CD $8A $3D
    call ReturnIfNonInteractive_05                ;; 05:75D7 $CD $3A $7A
    ld   a, $01                                   ;; 05:75DA $3E $01
    ld   [wD200], a                               ;; 05:75DC $EA $00 $D2
    call GetEntitySlowTransitionCountdown         ;; 05:75DF $CD $FB $0B
    cp   $10                                      ;; 05:75E2 $FE $10
    jr   nc, jr_005_7621                          ;; 05:75E4 $30 $3B

    and  a                                        ;; 05:75E6 $A7
    jr   nz, .jr_7619                             ;; 05:75E7 $20 $30

    ld   a, [wD201]                               ;; 05:75E9 $FA $01 $D2
    ld   e, a                                     ;; 05:75EC $5F
    ld   d, b                                     ;; 05:75ED $50

    ld   hl, wEntitiesPrivateCountdown1Table      ;; 05:75EE $21 $F0 $C2
    add  hl, de                                   ;; 05:75F1 $19
    ld   [hl], $1F                                ;; 05:75F2 $36 $1F

    ld   a, ENTITY_BOMB                           ;; 05:75F4 $3E $02
    call SpawnNewEntity_trampoline                ;; 05:75F6 $CD $86 $3B
    call PlayBombExplosionSfx                     ;; 05:75F9 $CD $4B $0C
    ldh  a, [hMultiPurpose0]                      ;; 05:75FC $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 05:75FE $21 $00 $C2
    add  hl, de                                   ;; 05:7601 $19
    ld   [hl], a                                  ;; 05:7602 $77
    ldh  a, [hMultiPurpose1]                      ;; 05:7603 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 05:7605 $21 $10 $C2
    add  hl, de                                   ;; 05:7608 $19
    ld   [hl], a                                  ;; 05:7609 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 05:760A $21 $E0 $C2
    add  hl, de                                   ;; 05:760D $19
    ld   [hl], $17                                ;; 05:760E $36 $17
    ld   hl, wEntitiesPrivateState4Table          ;; 05:7610 $21 $40 $C4
    add  hl, de                                   ;; 05:7613 $19
    ld   [hl], $01                                ;; 05:7614 $36 $01
    jp   func_005_7535                            ;; 05:7616 $C3 $35 $75

.jr_7619
    ldh  a, [hFrameCounter]                       ;; 05:7619 $F0 $E7
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:761B $21 $20 $C4
    add  hl, bc                                   ;; 05:761E $09
    ld   [hl], a                                  ;; 05:761F $77
    ret                                           ;; 05:7620 $C9

jr_005_7621:
    ldh  a, [hFrameCounter]                       ;; 05:7621 $F0 $E7
    and  $07                                      ;; 05:7623 $E6 $07
    jr   nz, .jr_7635                             ;; 05:7625 $20 $0E

    ld   a, [wD201]                               ;; 05:7627 $FA $01 $D2
    ld   e, a                                     ;; 05:762A $5F
    ld   d, b                                     ;; 05:762B $50
    ld   hl, wEntitiesPrivateState3Table          ;; 05:762C $21 $D0 $C2
    add  hl, de                                   ;; 05:762F $19
    ld   a, [hl]                                  ;; 05:7630 $7E
    and  a                                        ;; 05:7631 $A7
    jr   z, .jr_7635                              ;; 05:7632 $28 $01

    dec  [hl]                                     ;; 05:7634 $35

.jr_7635
    ld   hl, wEntitiesInertiaTable                ;; 05:7635 $21 $D0 $C3
    add  hl, bc                                   ;; 05:7638 $09
    ld   a, [hl]                                  ;; 05:7639 $7E
    inc  a                                        ;; 05:763A $3C
    and  $7F                                      ;; 05:763B $E6 $7F
    ld   [hl], a                                  ;; 05:763D $77
    ld   e, a                                     ;; 05:763E $5F
    ld   d, b                                     ;; 05:763F $50
    ld   hl, wIsFileSelectionArrowShifted         ;; 05:7640 $21 $00 $D0
    add  hl, de                                   ;; 05:7643 $19
    ldh  a, [hActiveEntityPosX]                   ;; 05:7644 $F0 $EE
    ld   [hl], a                                  ;; 05:7646 $77
    ld   hl, wD100                                ;; 05:7647 $21 $00 $D1
    add  hl, de                                   ;; 05:764A $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:764B $F0 $EC
    ld   [hl], a                                  ;; 05:764D $77
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:764E $21 $00 $C3
    add  hl, bc                                   ;; 05:7651 $09
    ld   a, [hl]                                  ;; 05:7652 $7E
    and  a                                        ;; 05:7653 $A7
    jr   z, .jr_765B                              ;; 05:7654 $28 $05

    call UpdateEntityPosWithSpeed_05              ;; 05:7656 $CD $B1 $7A
    jr   jr_005_765E                              ;; 05:7659 $18 $03

.jr_765B
    call func_005_7702                            ;; 05:765B $CD $02 $77

jr_005_765E:
    ld   hl, wEntitiesStateTable                  ;; 05:765E $21 $90 $C2
    add  hl, bc                                   ;; 05:7661 $09
    ld   e, [hl]                                  ;; 05:7662 $5E
    srl  e                                        ;; 05:7663 $CB $3B
    ld   d, b                                     ;; 05:7665 $50
    ld   hl, Data_005_75C9                        ;; 05:7666 $21 $C9 $75
    add  hl, de                                   ;; 05:7669 $19
    ld   a, [hl]                                  ;; 05:766A $7E
    jp   SetEntitySpriteVariant                   ;; 05:766B $C3 $0C $3B

func_005_766E::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:766E $F0 $F1
    rla                                           ;; 05:7670 $17
    rla                                           ;; 05:7671 $17
    rla                                           ;; 05:7672 $17
    rla                                           ;; 05:7673 $17
    rla                                           ;; 05:7674 $17
    and  $E0                                      ;; 05:7675 $E6 $E0
    ld   e, a                                     ;; 05:7677 $5F
    ld   d, b                                     ;; 05:7678 $50
    ld   hl, Data_005_7782                        ;; 05:7679 $21 $82 $77
    add  hl, de                                   ;; 05:767C $19
    ld   c, $08                                   ;; 05:767D $0E $08
    call RenderActiveEntitySpritesRect            ;; 05:767F $CD $E6 $3C
    ld   a, $08                                   ;; 05:7682 $3E $08
    call func_015_7964_trampoline                 ;; 05:7684 $CD $A0 $3D
    ld   hl, wEntitiesInertiaTable                ;; 05:7687 $21 $D0 $C3
    add  hl, bc                                   ;; 05:768A $09
    ld   a, [hl]                                  ;; 05:768B $7E
    ldh  [hMultiPurpose0], a                      ;; 05:768C $E0 $D7
    ldh  a, [hMultiPurpose0]                      ;; 05:768E $F0 $D7
    sub  $0C                                      ;; 05:7690 $D6 $0C
    and  $7F                                      ;; 05:7692 $E6 $7F
    ld   e, a                                     ;; 05:7694 $5F
    ld   d, b                                     ;; 05:7695 $50
    ld   hl, wIsFileSelectionArrowShifted         ;; 05:7696 $21 $00 $D0
    add  hl, de                                   ;; 05:7699 $19
    ld   a, [hl]                                  ;; 05:769A $7E
    ldh  [hActiveEntityPosX], a                   ;; 05:769B $E0 $EE
    ld   hl, wD100                                ;; 05:769D $21 $00 $D1
    add  hl, de                                   ;; 05:76A0 $19
    ld   a, [hl]                                  ;; 05:76A1 $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 05:76A2 $E0 $EC
    ld   a, $00                                   ;; 05:76A4 $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:76A6 $E0 $F1
    ld   de, SlimeEelSpriteVariants               ;; 05:76A8 $11 $CC $72
    call RenderActiveEntitySpritesPair            ;; 05:76AB $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ;; 05:76AE $F0 $D7
    sub  $18                                      ;; 05:76B0 $D6 $18
    and  $7F                                      ;; 05:76B2 $E6 $7F
    ld   e, a                                     ;; 05:76B4 $5F
    ld   d, b                                     ;; 05:76B5 $50
    ld   hl, wIsFileSelectionArrowShifted         ;; 05:76B6 $21 $00 $D0
    add  hl, de                                   ;; 05:76B9 $19
    ld   a, [hl]                                  ;; 05:76BA $7E
    ldh  [hActiveEntityPosX], a                   ;; 05:76BB $E0 $EE
    ld   hl, wD100                                ;; 05:76BD $21 $00 $D1
    add  hl, de                                   ;; 05:76C0 $19
    ld   a, [hl]                                  ;; 05:76C1 $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 05:76C2 $E0 $EC
    ld   a, $00                                   ;; 05:76C4 $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:76C6 $E0 $F1
    ld   de, SlimeEelSpriteVariants               ;; 05:76C8 $11 $CC $72
    call RenderActiveEntitySpritesPair            ;; 05:76CB $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ;; 05:76CE $F0 $D7
    sub  $24                                      ;; 05:76D0 $D6 $24
    and  $7F                                      ;; 05:76D2 $E6 $7F
    ld   e, a                                     ;; 05:76D4 $5F
    ld   d, b                                     ;; 05:76D5 $50
    ld   hl, wIsFileSelectionArrowShifted         ;; 05:76D6 $21 $00 $D0
    add  hl, de                                   ;; 05:76D9 $19
    ld   a, [hl]                                  ;; 05:76DA $7E
    ldh  [hActiveEntityPosX], a                   ;; 05:76DB $E0 $EE
    ld   hl, wD100                                ;; 05:76DD $21 $00 $D1
    add  hl, de                                   ;; 05:76E0 $19
    ld   a, [hl]                                  ;; 05:76E1 $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 05:76E2 $E0 $EC
    ld   a, $02                                   ;; 05:76E4 $3E $02
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:76E6 $E0 $F1
    ld   de, SlimeEelSpriteVariants               ;; 05:76E8 $11 $CC $72
    jp   RenderActiveEntitySpritesPair            ;; 05:76EB $C3 $C0 $3B

Data_005_76EE::
    db   $00, $06, $0C, $0E

Data_005_76F2::
    db   $10, $0E, $0C, $06, $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E

func_005_7702::
    call UpdateEntityPosWithSpeed_05              ;; 05:7702 $CD $B1 $7A
    call label_3B44                               ;; 05:7705 $CD $44 $3B
    call ApplyEntityInteractionWithBackground_trampoline ;; 05:7708 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 05:770B $21 $A0 $C2
    add  hl, bc                                   ;; 05:770E $09
    ld   a, [hl]                                  ;; 05:770F $7E
    and  a                                        ;; 05:7710 $A7
    jr   z, jr_005_7730                           ;; 05:7711 $28 $1D

    call GetRandomByte                            ;; 05:7713 $CD $0D $28
    rra                                           ;; 05:7716 $1F
    jr   c, .jr_7721                              ;; 05:7717 $38 $08

    ld   hl, wEntitiesPrivateState2Table          ;; 05:7719 $21 $C0 $C2
    add  hl, bc                                   ;; 05:771C $09
    ld   a, [hl]                                  ;; 05:771D $7E
    cpl                                           ;; 05:771E $2F
    inc  a                                        ;; 05:771F $3C
    ld   [hl], a                                  ;; 05:7720 $77

.jr_7721
    ld   hl, wEntitiesStateTable                  ;; 05:7721 $21 $90 $C2
    add  hl, bc                                   ;; 05:7724 $09
    ld   a, [hl]                                  ;; 05:7725 $7E
    add  $08                                      ;; 05:7726 $C6 $08
    and  $0F                                      ;; 05:7728 $E6 $0F
    ld   [hl], a                                  ;; 05:772A $77
    call GetEntityTransitionCountdown             ;; 05:772B $CD $05 $0C
    ld   [hl], $10                                ;; 05:772E $36 $10

jr_005_7730:
    call GetEntityPrivateCountdown1               ;; 05:7730 $CD $00 $0C
    jr   nz, .jr_775E                             ;; 05:7733 $20 $29

    ld   [hl], $04                                ;; 05:7735 $36 $04
    ld   hl, wEntitiesPrivateState2Table          ;; 05:7737 $21 $C0 $C2
    add  hl, bc                                   ;; 05:773A $09
    ld   a, [hl]                                  ;; 05:773B $7E
    ld   hl, wEntitiesStateTable                  ;; 05:773C $21 $90 $C2
    add  hl, bc                                   ;; 05:773F $09
    add  [hl]                                     ;; 05:7740 $86
    and  $0F                                      ;; 05:7741 $E6 $0F
    ld   [hl], a                                  ;; 05:7743 $77
    ld   hl, wEntitiesStateTable                  ;; 05:7744 $21 $90 $C2
    add  hl, bc                                   ;; 05:7747 $09
    ld   e, [hl]                                  ;; 05:7748 $5E
    ld   d, b                                     ;; 05:7749 $50
    ld   hl, Data_005_76EE                        ;; 05:774A $21 $EE $76
    add  hl, de                                   ;; 05:774D $19
    ld   a, [hl]                                  ;; 05:774E $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:774F $21 $50 $C2
    add  hl, bc                                   ;; 05:7752 $09
    ld   [hl], a                                  ;; 05:7753 $77
    ld   hl, Data_005_76F2                        ;; 05:7754 $21 $F2 $76
    add  hl, de                                   ;; 05:7757 $19
    ld   a, [hl]                                  ;; 05:7758 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7759 $21 $40 $C2
    add  hl, bc                                   ;; 05:775C $09
    ld   [hl], a                                  ;; 05:775D $77

.jr_775E
    call GetEntityTransitionCountdown             ;; 05:775E $CD $05 $0C
    jr   nz, .ret_7776                            ;; 05:7761 $20 $13

    call GetRandomByte                            ;; 05:7763 $CD $0D $28
    and  $1F                                      ;; 05:7766 $E6 $1F
    add  $10                                      ;; 05:7768 $C6 $10
    ld   [hl], a                                  ;; 05:776A $77
    call GetRandomByte                            ;; 05:776B $CD $0D $28
    and  $02                                      ;; 05:776E $E6 $02
    dec  a                                        ;; 05:7770 $3D
    ld   hl, wEntitiesPrivateState2Table          ;; 05:7771 $21 $C0 $C2
    add  hl, bc                                   ;; 05:7774 $09
    ld   [hl], a                                  ;; 05:7775 $77

.ret_7776
    ret                                           ;; 05:7776 $C9

label_005_7777:
    ld   e, $80                                   ;; 05:7777 $1E $80
    ld   hl, wD100                                ;; 05:7779 $21 $00 $D1

.loop_777C
    xor  a                                        ;; 05:777C $AF
    ld   [hl+], a                                 ;; 05:777D $22
    dec  e                                        ;; 05:777E $1D
    jr   nz, .loop_777C                           ;; 05:777F $20 $FB

    ret                                           ;; 05:7781 $C9

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
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:7982 $F0 $F1
    ld   d, b                                     ;; 05:7984 $50
    rla                                           ;; 05:7985 $17
    rl   d                                        ;; 05:7986 $CB $12
    rla                                           ;; 05:7988 $17
    rl   d                                        ;; 05:7989 $CB $12
    rla                                           ;; 05:798B $17
    rl   d                                        ;; 05:798C $CB $12
    rla                                           ;; 05:798E $17
    rl   d                                        ;; 05:798F $CB $12
    rla                                           ;; 05:7991 $17
    rl   d                                        ;; 05:7992 $CB $12
    and  $E0                                      ;; 05:7994 $E6 $E0
    ld   e, a                                     ;; 05:7996 $5F
    ld   hl, Data_005_7782                        ;; 05:7997 $21 $82 $77
    add  hl, de                                   ;; 05:799A $19
    ld   c, $08                                   ;; 05:799B $0E $08
    call RenderActiveEntitySpritesRect            ;; 05:799D $CD $E6 $3C
    ld   a, $08                                   ;; 05:79A0 $3E $08
    jp   func_015_7964_trampoline                 ;; 05:79A2 $C3 $A0 $3D

Data_005_79A5::
    db   $F2, $0E

func_005_79A7::
    ldh  a, [hFrameCounter]                       ;; 05:79A7 $F0 $E7
    and  $10                                      ;; 05:79A9 $E6 $10
    ld   a, $03                                   ;; 05:79AB $3E $03
    jr   z, .jr_79B0                              ;; 05:79AD $28 $01

    inc  a                                        ;; 05:79AF $3C

.jr_79B0
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:79B0 $E0 $F1
    nop                                           ;; 05:79B2 $00

jr_005_79B3:
    ld   hl, wEntitiesDirectionTable              ;; 05:79B3 $21 $80 $C3
    add  hl, bc                                   ;; 05:79B6 $09
    ld   e, [hl]                                  ;; 05:79B7 $5E
    ld   d, b                                     ;; 05:79B8 $50
    ld   hl, Data_005_79A5                        ;; 05:79B9 $21 $A5 $79
    add  hl, de                                   ;; 05:79BC $19
    ld   a, [hl]                                  ;; 05:79BD $7E
    ld   hl, hActiveEntityVisualPosY              ;; 05:79BE $21 $EC $FF
    add  [hl]                                     ;; 05:79C1 $86
    ld   [hl], a                                  ;; 05:79C2 $77
    cp   $14                                      ;; 05:79C3 $FE $14
    jr   c, jr_005_7A1F                           ;; 05:79C5 $38 $58

    cp   $7C                                      ;; 05:79C7 $FE $7C
    jr   nc, jr_005_7A1F                          ;; 05:79C9 $30 $54

    ld   de, SlimeEelSpriteVariants               ;; 05:79CB $11 $CC $72
    call RenderActiveEntitySpritesPair            ;; 05:79CE $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ;; 05:79D1 $F0 $F0
    cp   $04                                      ;; 05:79D3 $FE $04
    jr   nc, jr_005_7A1D                          ;; 05:79D5 $30 $46

    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:79D7 $F0 $F1
    and  a                                        ;; 05:79D9 $A7
    jr   z, .jr_7A1A                              ;; 05:79DA $28 $3E

    xor  a                                        ;; 05:79DC $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:79DD $E0 $F1
    call label_3B70                               ;; 05:79DF $CD $70 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:79E2 $21 $20 $C4
    add  hl, bc                                   ;; 05:79E5 $09
    ld   a, [hl]                                  ;; 05:79E6 $7E
    cp   $16                                      ;; 05:79E7 $FE $16
    jr   nz, .jr_7A1A                             ;; 05:79E9 $20 $2F

    ld   hl, wD204                                ;; 05:79EB $21 $04 $D2
    inc  [hl]                                     ;; 05:79EE $34
    ld   a, [hl]                                  ;; 05:79EF $7E
    cp   $08                                      ;; 05:79F0 $FE $08
    jr   nz, .jr_7A1A                             ;; 05:79F2 $20 $26

    ld   a, [wD201]                               ;; 05:79F4 $FA $01 $D2
    ld   e, a                                     ;; 05:79F7 $5F
    ld   d, b                                     ;; 05:79F8 $50
    ld   hl, wEntitiesStatusTable                 ;; 05:79F9 $21 $80 $C2
    add  hl, de                                   ;; 05:79FC $19
    ld   [hl], b                                  ;; 05:79FD $70
    call IncrementEntityState                     ;; 05:79FE $CD $12 $3B
    ld   [hl], $04                                ;; 05:7A01 $36 $04
    call GetEntityTransitionCountdown             ;; 05:7A03 $CD $05 $0C
    ld   [hl], $FF                                ;; 05:7A06 $36 $FF
    call label_27F2                               ;; 05:7A08 $CD $F2 $27
    ld   a, $03                                   ;; 05:7A0B $3E $03
    ld   [wBossAgonySFXCountdown], a              ;; 05:7A0D $EA $A7 $C5
    ld   a, MUSIC_BOSS_DEFEAT                     ;; 05:7A10 $3E $5E
    ld   [wMusicTrackToPlay], a                   ;; 05:7A12 $EA $68 $D3
    call_open_dialog Dialog0B5                    ;; 05:7A15 $3E $B5 $CD $85 $23

.jr_7A1A
    call label_3B44                               ;; 05:7A1A $CD $44 $3B

jr_005_7A1D:
    jr   jr_005_79B3                              ;; 05:7A1D $18 $94

jr_005_7A1F:
    call CopyEntityPositionToActivePosition       ;; 05:7A1F $CD $8A $3D
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:7A22 $21 $20 $C4
    add  hl, bc                                   ;; 05:7A25 $09
    ld   a, [hl]                                  ;; 05:7A26 $7E
    and  a                                        ;; 05:7A27 $A7
    jr   nz, .ret_7A39                            ;; 05:7A28 $20 $0F

    ld   hl, wEntitiesOptions1Table               ;; 05:7A2A $21 $30 $C4
    add  hl, bc                                   ;; 05:7A2D $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF ;; 05:7A2E $36 $C0
    call label_3B70                               ;; 05:7A30 $CD $70 $3B
    ld   hl, wEntitiesOptions1Table               ;; 05:7A33 $21 $30 $C4
    add  hl, bc                                   ;; 05:7A36 $09
    ld   [hl], ENTITY_OPT1_IS_BOSS                ;; 05:7A37 $36 $80

.ret_7A39
    ret                                           ;; 05:7A39 $C9

