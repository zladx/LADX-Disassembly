func_027_7240::
    push bc                                       ; $7240: $C5
    push hl                                       ; $7241: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $7242: $FA $C0 $C3
    ld   e, a                                     ; $7245: $5F
    ld   d, $00                                   ; $7246: $16 $00
    ld   hl, wOAMBuffer                           ; $7248: $21 $00 $C0
    add  hl, de                                   ; $724B: $19
    ld   d, h                                     ; $724C: $54
    ld   e, l                                     ; $724D: $5D
    pop  hl                                       ; $724E: $E1
    ld   a, c                                     ; $724F: $79
    srl  a                                        ; $7250: $CB $3F
    srl  a                                        ; $7252: $CB $3F
    ld   c, a                                     ; $7254: $4F

.loop_7255
    ldh  a, [hActiveEntityVisualPosY]             ; $7255: $F0 $EC
    add  [hl]                                     ; $7257: $86
    ld   [de], a                                  ; $7258: $12
    inc  de                                       ; $7259: $13
    inc  hl                                       ; $725A: $23
    ldh  a, [hActiveEntityPosX]                   ; $725B: $F0 $EE
    add  [hl]                                     ; $725D: $86
    ld   [de], a                                  ; $725E: $12
    inc  de                                       ; $725F: $13
    inc  hl                                       ; $7260: $23
    ld   a, [hl+]                                 ; $7261: $2A
    ld   [de], a                                  ; $7262: $12
    inc  de                                       ; $7263: $13
    ld   a, [hl+]                                 ; $7264: $2A
    ld   [de], a                                  ; $7265: $12
    inc  de                                       ; $7266: $13
    dec  c                                        ; $7267: $0D
    jr   nz, .loop_7255                           ; $7268: $20 $EB

    pop  bc                                       ; $726A: $C1
    ld   a, [wOAMNextAvailableSlot]               ; $726B: $FA $C0 $C3
    add  c                                        ; $726E: $81
    cp   $A0                                      ; $726F: $FE $A0
    jr   c, .jr_7274                              ; $7271: $38 $01

    xor  a                                        ; $7273: $AF

.jr_7274
    ld   [wOAMNextAvailableSlot], a               ; $7274: $EA $C0 $C3
    ld   a, [wActiveEntityIndex]                  ; $7277: $FA $23 $C1
    ld   c, a                                     ; $727A: $4F
    ret                                           ; $727B: $C9

Data_027_727C::
    db   $00, $08, $0F, $02, $00, $10, $1F, $02   ; $727C
    db   $00, $18, $2F, $02, $08, $00, $50, $03   ; $7284
    db   $08, $08, $52, $03, $08, $18, $58, $03   ; $728C
    db   $08, $20, $59, $00, $10, $00, $51, $03   ; $7294
    db   $10, $08, $53, $00, $10, $10, $55, $00   ; $729C

Data_027_72A4::
    db   $00, $08, $0F, $02, $00, $10, $1F, $02   ; $72A4
    db   $00, $18, $2F, $02, $08, $00, $50, $03   ; $72AC
    db   $08, $08, $52, $03, $08, $18, $68, $03   ; $72B4
    db   $08, $20, $69, $00, $10, $00, $61, $03   ; $72BC
    db   $10, $08, $63, $00, $10, $10, $65, $00   ; $72C4

Data_027_72CC::
    db   $00, $08, $0E, $01, $00, $10, $1E, $01   ; $72CC
    db   $08, $00, $60, $02, $08, $08, $62, $01   ; $72D4
    db   $08, $10, $54, $01, $08, $18, $64, $01   ; $72DC

func_027_72E4::
    ld   hl, Data_027_72CC                        ; $72E4
    ld   c, $18                                   ; $72E7: $0E $18
    call func_027_7240                            ; $72E9: $CD $40 $72
    ld   hl, Data_027_727C                        ; $72EC: $21 $7C $72
    ldh  a, [hFrameCounter]                       ; $72EF: $F0 $E7
    and  $10                                      ; $72F1: $E6 $10
    jr   z, .jr_72F8                              ; $72F3: $28 $03

    ld   hl, Data_027_72A4                        ; $72F5: $21 $A4 $72

.jr_72F8
    ld   c, $28                                   ; $72F8: $0E $28
    call func_027_7240                            ; $72FA: $CD $40 $72
    ret                                           ; $72FD: $C9

Data_027_72FE::
    db   $00, $00, $5A, $03                       ; $72FE

Data_027_7302::
    db   $00, $00, $6A, $03                       ; $7302

func_027_7306::
    ld   de, wEntitiesPosXTable                   ; $7306: $11 $00 $C2
    add  hl, bc                                   ; $7309: $09
    ld   a, [hl]                                  ; $730A: $7E
    cp   $28                                      ; $730B: $FE $28
    ld   hl, Data_027_72FE                        ; $730D: $21 $FE $72
    jr   z, .jr_7315                              ; $7310: $28 $03

    ld   hl, Data_027_7302                        ; $7312: $21 $02 $73

.jr_7315
    ld   c, $04                                   ; $7315: $0E $04
    call func_027_7240                            ; $7317: $CD $40 $72
    ret                                           ; $731A: $C9

Data_027_731B::
    db   $00, $00, $54, $04, $00, $08, $64, $04   ; $731B
    db   $08, $00, $55, $04, $08, $08, $65, $04   ; $7323

Data_027_732B::
    db   $00, $00, $64, $24, $00, $08, $54, $24   ; $732B
    db   $08, $00, $65, $24, $08, $08, $55, $24   ; $7333

Data_027_733B::
    db   $00, $00, $6E, $04, $00, $08, $7E, $04   ; $733B
    db   $08, $00, $6F, $04, $08, $08, $7F, $04   ; $7343

func_027_734B::
    ld   hl, wEntitiesPosXTable                   ; $734B: $21 $00 $C2
    add  hl, bc                                   ; $734E: $09
    ld   a, [hl]                                  ; $734F: $7E
    cp   $18                                      ; $7350: $FE $18
    ld   hl, Data_027_733B                        ; $7352: $21 $3B $73
    jr   z, .jr_7361                              ; $7355: $28 $0A

    ld   hl, Data_027_731B                        ; $7357: $21 $1B $73
    cp   $68                                      ; $735A: $FE $68
    jr   z, .jr_7361                              ; $735C: $28 $03

    ld   hl, Data_027_732B                        ; $735E: $21 $2B $73

.jr_7361
    ld   c, $10                                   ; $7361: $0E $10
    call func_027_7240                            ; $7363: $CD $40 $72
    ret                                           ; $7366: $C9

Data_027_7367::
    db   $00, $00, $72, $00, $00, $08, $72, $20   ; $7367
    db   $08, $00, $73, $00, $08, $08, $73, $20   ; $736F
    db   $00, $00, $74, $00, $00, $08, $74, $20   ; $7377
    db   $08, $00, $75, $00, $08, $08, $75, $20   ; $737F
    db   $00, $00, $76, $00, $00, $08, $76, $20   ; $7387
    db   $08, $00, $77, $00, $08, $08, $77, $20   ; $738F
    db   $00, $00, $78, $00, $00, $08, $78, $20   ; $7397
    db   $08, $00, $79, $00, $08, $08, $79, $20   ; $739F
    db   $00, $00, $7A, $00, $00, $08, $7A, $20   ; $73A7
    db   $08, $00, $7B, $00, $08, $08, $7B, $20   ; $73AF
    db   $00, $00, $7C, $00, $00, $08, $7C, $20   ; $73B7
    db   $08, $00, $7D, $00, $08, $08, $7D, $20   ; $73BF

func_027_73C7::
    ld   hl, wEntitiesSpriteVariantTable          ; $73C7: $21 $B0 $C3
    add  hl, bc                                   ; $73CA
    ld   a, [hl]                                  ; $73CB
    sla  a                                        ; $73CC: $CB $27
    sla  a                                        ; $73CE: $CB $27
    sla  a                                        ; $73D0: $CB $27
    sla  a                                        ; $73D2: $CB $27
    ld   d, $00                                   ; $73D4: $16 $00
    ld   e, a                                     ; $73D6: $5F
    ld   hl, Data_027_7367                        ; $73D7: $21 $67 $73
    add  hl, de                                   ; $73DA: $19
    ld   c, $10                                   ; $73DB: $0E $10
    call func_027_7240                            ; $73DD: $CD $40 $72
    ret                                           ; $73E0: $C9

Data_027_73E1::
    db   $00, $10, $03, $01, $00, $18, $04, $01   ; $73E1
    db   $18, $18, $0C, $05, $10, $20, $0B, $07   ; $73E9
    db   $10, $18, $0A, $07, $10, $08, $09, $06   ; $73F1
    db   $08, $24, $08, $01, $08, $1C, $07, $01   ; $73F9
    db   $08, $10, $06, $06, $08, $08, $05, $06   ; $7401
    db   $00, $10, $02, $06, $00, $08, $01, $06   ; $7409
    db   $00, $00, $00, $06, $20, $50, $0F, $03   ; $7411
    db   $18, $50, $0E, $03, $18, $D8, $0D, $03   ; $7419
    db   $10, $D8, $2D, $03, $00, $FF, $FF, $FF   ; $7421
    db   $00, $FF, $FF, $FF, $00, $FF, $FF, $FF   ; $7429

Data_027_7431::
    db   $18, $18, $1D, $01, $18, $10, $1C, $05   ; $7431
    db   $18, $08, $1B, $05, $10, $1D, $1A, $01   ; $7439
    db   $10, $15, $19, $01, $08, $24, $18, $01   ; $7441
    db   $08, $1C, $17, $01, $08, $10, $16, $06   ; $7449
    db   $00, $18, $15, $02, $00, $10, $14, $06   ; $7451
    db   $04, $08, $13, $06, $F8, $10, $12, $06   ; $7459
    db   $FC, $08, $11, $06, $F8, $00, $10, $06   ; $7461
    db   $20, $50, $0F, $03, $18, $50, $0E, $03   ; $7469
    db   $18, $D8, $0D, $03, $10, $D8, $2D, $03   ; $7471
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7479

Data_027_7481::
    db   $10, $00, $2C, $03, $08, $00, $2B, $03   ; $7481
    db   $18, $18, $2A, $06, $10, $1C, $29, $01   ; $7489
    db   $10, $14, $28, $01, $08, $24, $18, $01   ; $7491
    db   $08, $1C, $27, $01, $08, $10, $26, $06   ; $7499
    db   $00, $18, $25, $02, $00, $10, $24, $06   ; $74A1
    db   $00, $00, $23, $06, $F8, $18, $22, $02   ; $74A9
    db   $F8, $10, $21, $02, $FC, $08, $20, $06   ; $74B1
    db   $F0, $10, $1F, $06, $F4, $08, $1E, $06   ; $74B9
    db   $20, $50, $0F, $03, $18, $50, $0E, $03   ; $74C1
    db   $18, $D8, $0D, $03, $10, $D8, $2D, $03   ; $74C9

Data_027_74D1::
    dw   Data_027_73E1
    dw   Data_027_73E1
    dw   Data_027_73E1
    dw   Data_027_73E1
    dw   Data_027_73E1
    dw   Data_027_73E1
    dw   Data_027_73E1
    dw   Data_027_7431
    dw   Data_027_7481

func_027_74E3::
    ld   b, $00                                   ; $74E3: $06 $00
    ld   c, $0B                                   ; $74E5: $0E $0B
    ld   a, [wIsFileSelectionArrowShifted]        ; $74E7: $FA $00 $D0
    ld   d, a                                     ; $74EA: $57
    ld   hl, wEntitiesPosYTable                   ; $74EB: $21 $10 $C2
    add  hl, bc                                   ; $74EE: $09

.jr_74EF
    ld   a, [hl]                                  ; $74EF: $7E
    sub  d                                        ; $74F0: $92
    ldh  [hActiveEntityVisualPosY], a             ; $74F1: $E0 $EC
    ld   a, [wIntroSubTimer]                      ; $74F3: $FA $02 $D0
    sla  a                                        ; $74F6: $CB $27
    ld   e, a                                     ; $74F8: $5F
    ld   d, $00                                   ; $74F9: $16 $00
    ld   hl, Data_027_74D1                        ; $74FB: $21 $D1 $74
    add  hl, de                                   ; $74FE: $19
    ld   a, [hl+]                                 ; $74FF: $2A
    ld   d, a                                     ; $7500: $57
    ld   h, [hl]                                  ; $7501: $66
    ld   l, d                                     ; $7502: $6A
    ld   c, $50                                   ; $7503: $0E $50
    ld   a, [wCreditsSubscene]                    ; $7505: $FA $0E $D0
    cp   $03                                      ; $7508: $FE $03
    jr   c, .jr_750E                              ; $750A: $38 $02

    ld   c, $4F                                   ; $750C: $0E $4F

.jr_750E
    call func_027_7240                            ; $750E: $CD $40 $72
    ld   b, $00                                   ; $7511: $06 $00

.jr_7513
    ld   c, $0B                                   ; $7513: $0E $0B
    ret                                           ; $7515: $C9

Data_027_7516::
    db   $08, $20, $0A, $03, $08, $18, $08, $03   ; $7516
    db   $08, $10, $06, $03, $10, $18, $02, $02   ; $751E
    db   $30, $18, $2E, $05, $30, $10, $2C, $05   ; $7526
    db   $08, $20, $04, $02, $18, $18, $BC, $04   ; $752E
    db   $00, $18, $B6, $02, $28, $18, $1E, $04   ; $7536
    db   $21, $10, $0E, $04, $20, $08, $0C, $05   ; $753E
    db   $30, $08, $9A, $05, $18, $18, $BA, $01   ; $7546
    db   $10, $20, $86, $01, $00, $20, $B8, $01   ; $754E
    db   $00, $18, $00, $01, $00, $10, $B4, $02   ; $7556
    db   $00, $08, $B2, $02, $28, $18, $1C, $01   ; $755E
    db   $30, $20, $AA, $05, $28, $10, $8E, $01   ; $7566
    db   $18, $10, $8C, $01, $20, $20, $94, $01   ; $756E
    db   $30, $00, $98, $04, $20, $08, $8A, $01   ; $7576
    db   $20, $00, $88, $05

Data_027_7582::
    db   $08, $20, $1A, $03, $08, $18, $18, $03   ; $7582
    db   $08, $10, $16, $03, $00, $20, $A4, $02   ; $758A
    db   $10, $18, $12, $02, $30, $18, $2E, $05   ; $7592
    db   $30, $10, $2C, $05, $08, $20, $14, $02   ; $759A
    db   $18, $18, $CC, $04, $28, $18, $1E, $04   ; $75A2
    db   $21, $10, $0E, $04, $20, $08, $0C, $05   ; $75AA
    db   $00, $18, $C6, $02, $18, $18, $CA, $01   ; $75B2
    db   $10, $20, $96, $01, $00, $20, $C8, $01   ; $75BA
    db   $00, $10, $C4, $02, $00, $08, $C2, $02   ; $75C2
    db   $28, $18, $1C, $01, $30, $20, $AA, $05   ; $75CA
    db   $28, $10, $8E, $01, $18, $10, $8C, $01   ; $75D2
    db   $20, $20, $94, $01, $30, $08, $9A, $05   ; $75DA
    db   $30, $00, $98, $04, $20, $08, $8A, $01   ; $75E2
    db   $20, $00, $88, $05                       ; $75EA

Data_027_75EE::
    db   $08, $20, $2A, $03, $08, $18, $28, $03   ; $75EE
    db   $08, $10, $26, $03, $00, $20, $A8, $02   ; $75F6
    db   $10, $18, $22, $02, $30, $18, $2E, $05   ; $75FE
    db   $30, $10, $2C, $05, $08, $20, $24, $02   ; $7606
    db   $18, $18, $DC, $04, $28, $18, $1E, $04   ; $760E
    db   $21, $10, $0E, $04, $20, $08, $0C, $05   ; $7616
    db   $00, $18, $D6, $02, $18, $18, $DA, $01   ; $761E
    db   $10, $20, $A6, $01, $00, $20, $D8, $01   ; $7626
    db   $00, $10, $D4, $02, $00, $08, $D2, $02   ; $762E
    db   $28, $18, $1C, $01, $30, $20, $AA, $05   ; $7636
    db   $28, $10, $8E, $01, $18, $10, $8C, $01   ; $763E
    db   $20, $20, $94, $01, $30, $08, $9A, $05   ; $7646
    db   $30, $00, $98, $04, $20, $08, $8A, $01   ; $764E
    db   $20, $00, $88, $05

Data_027_765A::
    dw  Data_027_7516
    dw  Data_027_7582
    dw  Data_027_75EE

func_027_7660::
    ld   a, [wIsFileSelectionArrowShifted]        ; $7660: $FA $00 $D0
    sla  a                                        ; $7663: $CB $27
    ld   e, a                                     ; $7665: $5F
    ld   d, $00                                   ; $7666: $16 $00
    ld   hl, Data_027_765A                        ; $7668: $21 $5A $76
    add  hl, de                                   ; $766B: $19
    ld   a, [hl+]                                 ; $766C: $2A
    ld   d, a                                     ; $766D: $57
    ld   h, [hl]                                  ; $766E: $66
    ld   l, d                                     ; $766F: $6A
    ld   c, $6C                                   ; $7670: $0E $6C
    call func_027_7240                            ; $7672: $CD $40 $72
    ret                                           ; $7675: $C9

Data_027_7676::
    db   $10, $25, $12, $04, $30, $1B, $1A, $04   ; $7676
    db   $3B, $30, $1C, $02, $40, $03, $30, $02   ; $767E
    db   $40, $40, $40, $02, $40, $38, $3E, $02   ; $7686
    db   $40, $30, $3C, $03, $40, $28, $3A, $03   ; $768E
    db   $40, $20, $38, $03, $40, $18, $36, $03   ; $7696
    db   $40, $10, $34, $03, $40, $08, $32, $03   ; $769E
    db   $30, $00, $50, $02, $30, $38, $2E, $02   ; $76A6
    db   $30, $30, $2C, $03, $30, $28, $2A, $03   ; $76AE
    db   $30, $20, $28, $05, $30, $18, $26, $00   ; $76B6
    db   $30, $10, $24, $00, $30, $08, $22, $05   ; $76BE
    db   $20, $28, $20, $07, $20, $20, $1E, $01   ; $76C6
    db   $20, $08, $18, $01, $10, $28, $16, $07   ; $76CE
    db   $10, $20, $14, $01, $10, $10, $10, $01   ; $76D6
    db   $10, $08, $0E, $01, $10, $00, $0C, $01   ; $76DE
    db   $00, $28, $0A, $06, $00, $20, $08, $01   ; $76E6
    db   $00, $18, $06, $01, $00, $10, $04, $01   ; $76EE
    db   $00, $08, $02, $01, $00, $00, $00, $01   ; $76F6

Data_027_76FE:
    db   $20, $1C, $4C, $04, $20, $14, $4A, $04   ; $76FE
    db   $20, $0C, $48, $04, $10, $1C, $46, $04   ; $7706
    db   $10, $14, $44, $04, $10, $0C, $42, $04   ; $770E

Data_027_7716:
    db   $20, $1C, $5C, $04, $20, $14, $5A, $04   ; $7716
    db   $20, $0C, $58, $04, $10, $1C, $56, $04   ; $771E
    db   $10, $14, $54, $04, $10, $0C, $52, $04   ; $7726

Data_027_772E:
    db   $20, $1C, $6C, $04, $20, $14, $6A, $04   ; $772E
    db   $20, $0C, $68, $04, $10, $1C, $66, $04   ; $7736
    db   $10, $14, $64, $04, $10, $0C, $62, $04   ; $773E

Data_027_7746::
    dw   Data_027_76FE
    dw   Data_027_7716
    dw   Data_027_772E

func_027_774C::
    xor  a                                        ; $774C: $AF
    ld   [wOAMNextAvailableSlot], a               ; $774D: $EA $C0 $C3
    ld   a, [wD003]                               ; $7750: $FA $03 $D0
    sla  a                                        ; $7753: $CB $27
    ld   e, a                                     ; $7755: $5F
    ld   d, $00                                   ; $7756: $16 $00
    ld   hl, Data_027_7746                        ; $7758: $21 $46 $77
    add  hl, de                                   ; $775B: $19
    ld   a, [hl+]                                 ; $775C: $2A
    ld   d, a                                     ; $775D: $57
    ld   h, [hl]                                  ; $775E: $66
    ld   l, d                                     ; $775F: $6A
    ld   c, $18                                   ; $7760: $0E $18
    call func_027_7240                            ; $7762: $CD $40 $72
    ld   hl, Data_027_7676                        ; $7765: $21 $76 $76
    ld   c, $88                                   ; $7768: $0E $88
    call func_027_7240                            ; $776A: $CD $40 $72
    ret                                           ; $776D: $C9

Data_027_776E::
    db   $08, $04, $68, $01, $00, $04, $67, $01   ; $776E

Data_027_7776:
    db   $12, $10, $6C, $04, $12, $08, $6B, $04   ; $7776
    db   $12, $00, $6A, $04, $12, $F8, $69, $04   ; $777E
    db   $FA, $04, $60, $02, $02, $08, $62, $04   ; $7786
    db   $02, $00, $61, $04, $0A, $10, $66, $03   ; $778E
    db   $0A, $08, $65, $03, $0A, $00, $64, $03   ; $7796
    db   $0A, $F8, $63, $03                       ; $779E

Data_027_77A2:
    db   $12, $10, $70, $04
    db   $12, $08, $6F, $04, $12, $00, $6E, $04   ; $77A6
    db   $12, $F8, $6D, $04, $FA, $04, $60, $02   ; $77AE
    db   $02, $08, $62, $04, $02, $00, $61, $04   ; $77B6
    db   $0A, $10, $66, $03, $0A, $08, $65, $03   ; $77BE
    db   $0A, $00, $64, $03, $0A, $F8, $63, $03   ; $77C6

Data_027_77CE:
    db   $12, $10, $74, $04, $12, $08, $73, $04   ; $77CE
    db   $12, $00, $72, $04, $12, $F8, $71, $04   ; $77D6
    db   $FA, $04, $60, $02, $02, $08, $62, $04   ; $77DE
    db   $02, $00, $61, $04, $0A, $10, $66, $03   ; $77E6
    db   $0A, $08, $65, $03, $0A, $00, $64, $03   ; $77EE
    db   $0A, $F8, $63, $03                       ; $77F6

Data_027_77FA:
    db   $12, $10, $78, $04
    db   $12, $08, $77, $04, $12, $00, $76, $04   ; $77FE
    db   $12, $F8, $75, $04, $FA, $04, $60, $02   ; $7806
    db   $02, $08, $62, $04, $02, $00, $61, $04   ; $780E
    db   $0A, $10, $66, $03, $0A, $08, $65, $03   ; $7816
    db   $0A, $00, $64, $03, $0A, $F8, $63, $03   ; $781E

Data_027_7826::
    dw   Data_027_7776
    dw   Data_027_77A2
    dw   Data_027_77CE
    dw   Data_027_77FA

func_027_782E::
    ld   a, $6C
    ld   [wOAMNextAvailableSlot], a               ; $7830: $EA $C0 $C3
    ldh  a, [hFrameCounter]                       ; $7833: $F0 $E7
    and  $18                                      ; $7835: $E6 $18
    sra  a                                        ; $7837: $CB $2F
    sra  a                                        ; $7839: $CB $2F
    ld   e, a                                     ; $783B: $5F
    ld   d, $00                                   ; $783C: $16 $00
    ld   hl, Data_027_7826                        ; $783E: $21 $26 $78
    add  hl, de                                   ; $7841: $19
    ld   a, [hl+]                                 ; $7842: $2A
    ld   d, a                                     ; $7843: $57
    ld   h, [hl]                                  ; $7844: $66
    ld   l, d                                     ; $7845: $6A
    ld   c, $2C                                   ; $7846: $0E $2C
    call func_027_7240                            ; $7848: $CD $40 $72
    ld   hl, Data_027_776E                        ; $784B: $21 $6E $77
    ld   c, $08                                   ; $784E: $0E $08
    call func_027_7240                            ; $7850: $CD $40 $72
    ret                                           ; $7853: $C9

; Render disappearing island during credits?
func_027_7854::
    ld   a, [wD015]                               ; $7854: $FA $15 $D0
    JP_TABLE                                      ; $7857
._00 dw func_027_7860                             ; $7858
._01 dw func_027_7884                             ; $785A
._02 dw func_027_789E                             ; $785C
._03 dw func_027_7944                             ; $785E

func_027_7860::
    ld   hl, wLCDControl                          ; $7860: $21 $FD $D6
    set  LCDCB_OBJ16, [hl]                        ; $7863: $CB $D6
    ld   hl, wEntitiesPosXTable                   ; $7865: $21 $00 $C2
    add  hl, bc                                   ; $7868: $09
    ld   a, $50                                   ; $7869: $3E $50
    ld   [hl], a                                  ; $786B: $77
    ld   hl, wEntitiesPosYTable                   ; $786C: $21 $10 $C2
    add  hl, bc                                   ; $786F: $09
    ld   a, $50                                   ; $7870: $3E $50
    ld   [hl], a                                  ; $7872: $77
    ld   a, $FF                                   ; $7873: $3E $FF
    ld   [wD01A], a                               ; $7875: $EA $1A $D0
    call func_027_7E55                            ; $7878: $CD $55 $7E
    call func_027_7F87                            ; $787B: $CD $87 $7F
    call func_027_7BB6                            ; $787E: $CD $B6 $7B
    jp   label_027_7BAB                           ; $7881: $C3 $AB $7B

func_027_7884::
    ld   a, [wD01A]                               ; $7884: $FA $1A $D0
    inc  a                                        ; $7887: $3C
    cp   $06                                      ; $7888: $FE $06
    jp   nz, label_027_7895                       ; $788A: $C2 $95 $78

    ld   a, MUSIC_MARIN_SING                      ; $788D: $3E $2F
    ld   [wMusicTrackToPlay], a                   ; $788F: $EA $68 $D3
    jp   label_027_7BAB                           ; $7892: $C3 $AB $7B

label_027_7895:
    ld   [wD01A], a                               ; $7895: $EA $1A $D0
    ld   a, TILESET_CREDITS_MARIN_PORTRAIT        ; $7898: $3E $22
    ld   [wTilesetToLoad], a                      ; $789A: $EA $FE $D6
    ret                                           ; $789D: $C9

func_027_789E::
    ld   hl, wD01D                                ; $789E: $21 $1D $D0
    ld   a, [wD01C]                               ; $78A1: $FA $1C $D0
    ld   d, a                                     ; $78A4: $57
    or   [hl]                                     ; $78A5: $B6
    jr   z, jr_027_78DB                           ; $78A6: $28 $33

    ld   a, d                                     ; $78A8: $7A
    dec  a                                        ; $78A9: $3D
    ld   [wD01C], a                               ; $78AA: $EA $1C $D0
    jr   nz, jr_027_78CD                          ; $78AD: $20 $1E

    ld   a, [hl]                                  ; $78AF: $7E
    and  a                                        ; $78B0: $A7
    jr   z, .jr_78BB                              ; $78B1: $28 $08

    dec  [hl]                                     ; $78B3: $35
    ld   a, $FF                                   ; $78B4: $3E $FF
    ld   [wD01C], a                               ; $78B6: $EA $1C $D0
    jr   jr_027_78CD                              ; $78B9: $18 $12

.jr_78BB
    ld   hl, wD016                                ; $78BB: $21 $16 $D0
    inc  [hl]                                     ; $78BE: $34
    ld   a, $01                                   ; $78BF: $3E $01
    ld   [wD017], a                               ; $78C1: $EA $17 $D0
    ld   a, JINGLE_DUNGEON_WARP                   ; $78C4: $3E $1C
    ldh  [hJingle], a                             ; $78C6: $E0 $F2
    ld   a, $60                                   ; $78C8: $3E $60
    ld   [wD021], a                               ; $78CA: $EA $21 $D0

jr_027_78CD:
    ld   a, [wD017]                               ; $78CD: $FA $17 $D0
    inc  a                                        ; $78D0: $3C
    and  $01                                      ; $78D1: $E6 $01
    ld   [wD017], a                               ; $78D3: $EA $17 $D0
    ret  z                                        ; $78D6: $C8

    call func_027_79E6                            ; $78D7: $CD $E6 $79
    ret                                           ; $78DA: $C9

jr_027_78DB:
    call func_027_7925                            ; $78DB: $CD $25 $79
    ld   a, [wD017]                               ; $78DE: $FA $17 $D0
    inc  a                                        ; $78E1: $3C
    and  $01                                      ; $78E2: $E6 $01
    ld   [wD017], a                               ; $78E4: $EA $17 $D0
    jr   nz, .jr_78F1                             ; $78E7: $20 $08

    call func_027_7ACB                            ; $78E9: $CD $CB $7A
    call func_027_7B8F                            ; $78EC: $CD $8F $7B
    jr   jr_027_790C                              ; $78EF: $18 $1B

.jr_78F1
    call func_027_79E6                            ; $78F1: $CD $E6 $79
    ld   hl, wD016                                ; $78F4: $21 $16 $D0
    inc  [hl]                                     ; $78F7: $34
    ld   a, [hl]                                  ; $78F8: $7E
    cp   $40                                      ; $78F9: $FE $40
    jr   nz, .jr_7908                             ; $78FB: $20 $0B

    ld   a, $01                                   ; $78FD: $3E $01
    ld   [wD01D], a                               ; $78FF: $EA $1D $D0
    ld   a, $2C                                   ; $7902: $3E $2C
    ld   [wD01C], a                               ; $7904: $EA $1C $D0
    ret                                           ; $7907: $C9

.jr_7908
    cp   $C0                                      ; $7908: $FE $C0
    jr   z, jr_027_7910                           ; $790A: $28 $04

jr_027_790C:
    call func_027_7BB0                            ; $790C: $CD $B0 $7B
    ret                                           ; $790F: $C9

jr_027_7910:
    ld   a, $07                                   ; $7910: $3E $07
    ldh  [hVolumeRight], a                        ; $7912: $E0 $A9
    swap a                                        ; $7914: $CB $37
    ldh  [hVolumeLeft], a                         ; $7916: $E0 $AA
    ld   a, $32                                   ; $7918: $3E $32
    ld   [wD466], a                               ; $791A: $EA $66 $D4
    ld   a, $90                                   ; $791D: $3E $90
    ld   [wD020], a                               ; $791F: $EA $20 $D0
    jp   label_027_7BAB                           ; $7922: $C3 $AB $7B

func_027_7925::
    ld   hl, wD021                                ; $7925: $21 $21 $D0
    ld   a, [hl]                                  ; $7928: $7E
    and  a                                        ; $7929: $A7
    ret  z                                        ; $792A: $C8

    dec  [hl]                                     ; $792B: $35
    ret  nz                                       ; $792C: $C0

    ldh  a, [hVolumeRight]                        ; $792D: $F0 $A9
    dec  a                                        ; $792F: $3D
    ldh  [hVolumeRight], a                        ; $7930: $E0 $A9
    ldh  a, [hVolumeLeft]                         ; $7932: $F0 $AA
    sub  $10                                      ; $7934: $D6 $10
    ldh  [hVolumeLeft], a                         ; $7936: $E0 $AA
    jr   nz, .jr_7940                             ; $7938: $20 $06

    ld   a, MUSIC_SILENCE                         ; $793A: $3E $FF
    ld   [wMusicTrackToPlay], a                   ; $793C: $EA $68 $D3
    ret                                           ; $793F: $C9

.jr_7940
    ld   a, $14                                   ; $7940: $3E $14
    ld   [hl], a                                  ; $7942: $77
    ret                                           ; $7943: $C9

func_027_7944::
    call func_027_79F2                            ; $7944: $CD $F2 $79
    call func_027_7ACB                            ; $7947: $CD $CB $7A
    call func_027_7B8F                            ; $794A: $CD $8F $7B
    ret                                           ; $794D: $C9

Data_027_794E::
    db   $20, $F9, $3E, $06, $18, $08, $3C, $02   ; $794E
    db   $18, $00, $3A, $02, $18, $F8, $38, $02   ; $7956
    db   $08, $17, $36, $03, $08, $0F, $34, $03   ; $795E
    db   $08, $00, $4A, $01, $08, $F8, $48, $01   ; $7966
    db   $F8, $16, $32, $04, $F8, $0E, $30, $04   ; $796E
    db   $F8, $00, $46, $01, $F8, $F8, $44, $01   ; $7976
    db   $E8, $01, $42, $01, $E8, $F9, $40, $01   ; $797E
    db   $18, $18, $2E, $03, $18, $10, $2C, $03   ; $7986
    db   $18, $08, $2A, $03, $18, $00, $28, $03   ; $798E
    db   $18, $F8, $26, $03, $18, $F0, $24, $03   ; $7996
    db   $08, $18, $22, $00, $08, $10, $20, $00   ; $799E
    db   $08, $08, $1E, $00, $08, $00, $1C, $00   ; $79A6
    db   $08, $F8, $1A, $00, $08, $F0, $18, $00   ; $79AE
    db   $F8, $16, $16, $00, $F8, $0E, $14, $00   ; $79B6
    db   $F8, $06, $12, $00, $F8, $FE, $10, $00   ; $79BE
    db   $F8, $F6, $0E, $00, $F8, $EE, $0C, $00   ; $79C6
    db   $E8, $16, $0A, $04, $E8, $0E, $08, $05   ; $79CE
    db   $E8, $06, $06, $00, $E8, $FE, $04, $00   ; $79D6
    db   $E8, $F6, $02, $00, $E8, $EE, $00, $00   ; $79DE

func_027_79E6::
    xor  a                                        ; $79E6: $AF
    ld   [wOAMNextAvailableSlot], a               ; $79E7: $EA $C0 $C3
    ld   hl, Data_027_794E                        ; $79EA: $21 $4E $79
    ld   c, $26                                   ; $79ED: $0E $26
    jp   RenderActiveEntitySpritesRectUsingAllOAM ; $79EF: $C3 $E0 $3C

func_027_79F2::
    ld   a, [wD466]                               ; $79F2: $FA $66 $D4
    and  a                                        ; $79F5: $A7
    jr   nz, .jr_7A06                             ; $79F6: $20 $0E

    ld   a, JINGLE_SEAGULL                        ; $79F8: $3E $21
    ldh  [hJingle], a                             ; $79FA: $E0 $F2
    call GetRandomByte                            ; $79FC: $CD $0D $28
    and  $7F                                      ; $79FF: $E6 $7F
    add  $30                                      ; $7A01: $C6 $30
    ld   [wD466], a                               ; $7A03: $EA $66 $D4

.jr_7A06
    dec  a                                        ; $7A06: $3D
    ld   [wD466], a                               ; $7A07: $EA $66 $D4
    ret                                           ; $7A0A: $C9

Data_027_7A0B::
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A0B
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A13
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A1B
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A23
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A2B
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A33
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A3B
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A43
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7A4B
    db   $00, $00, $00, $00, $01, $01, $01, $01   ; $7A53
    db   $02, $02, $02, $02, $03, $03, $03, $03   ; $7A5B
    db   $04, $04, $04, $04, $05, $05, $05, $05   ; $7A63
    db   $00, $00, $00, $00, $01, $01, $01, $01   ; $7A6B
    db   $02, $02, $02, $02, $03, $03, $03, $03   ; $7A73
    db   $04, $04, $04, $04, $05, $05, $05, $05   ; $7A7B
    db   $00, $00, $00, $00, $01, $01, $01, $01   ; $7A83
    db   $02, $02, $02, $02, $03, $03, $03, $03   ; $7A8B
    db   $04, $04, $04, $04, $05, $05, $05, $05   ; $7A93
    db   $00, $00, $00, $00, $01, $01, $01, $01   ; $7A9B
    db   $02, $02, $02, $02, $03, $03, $03, $03   ; $7AA3
    db   $04, $04, $04, $04, $05, $05, $05, $05   ; $7AAB
    db   $00, $00, $00, $00, $01, $01, $01, $01   ; $7AB3
    db   $02, $02, $02, $02, $03, $03, $03, $03   ; $7ABB
    db   $04, $04, $04, $04, $05, $05, $05, $05   ; $7AC3

; Fly Marin as seagull upwards?
func_027_7ACB::
    ld   a, [wD016]                               ; $7ACB: $FA $16 $D0
    cp   $C0                                      ; $7ACE: $FE $C0
    jr   nc, .jr_7ADE                             ; $7AD0: $30 $0C

    ld   e, a                                     ; $7AD2: $5F
    ld   d, $00                                   ; $7AD3: $16 $00
    ld   hl, Data_027_7A0B                        ; $7AD5: $21 $0B $7A
    add  hl, de                                   ; $7AD8: $19
    ld   a, [hl]                                  ; $7AD9: $7E
    ld   [wD01B], a                               ; $7ADA: $EA $1B $D0
    ret                                           ; $7ADD: $C9

.jr_7ADE
    ld   hl, wD020                                ; $7ADE: $21 $20 $D0
    ld   a, [hl]                                  ; $7AE1: $7E
    and  a                                        ; $7AE2: $A7
    jr   z, .jr_7AE8                              ; $7AE3: $28 $03

    dec  [hl]                                     ; $7AE5: $35
    jr   jr_027_7B07                              ; $7AE6: $18 $1F

.jr_7AE8
    ; Increment wEntitiesInertiaTable[bc]
    ld   hl, wEntitiesInertiaTable                ; $7AE8: $21 $D0 $C3
    add  hl, bc                                   ; $7AEB: $09
    ld   a, [hl]                                  ; $7AEC: $7E
    inc  a                                        ; $7AED: $3C
    ld   [hl], a                                  ; $7AEE: $77

    ; Every 32 frames…
    and  $1F                                      ; $7AEF: $E6 $1F
    jr   nz, .done                                ; $7AF1: $20 $0A
    ; if the Y speed hasn't maxed out yet…
    ld   hl, wEntitiesSpeedYTable                 ; $7AF3: $21 $50 $C2
    add  hl, bc                                   ; $7AF6: $09
    ld   a, [hl]                                  ; $7AF7: $7E
    cp   $FF                                      ; $7AF8: $FE $FF
    jr   z, .done                                 ; $7AFA: $28 $01
    ; increment the Y speed.
    inc  [hl]                                     ; $7AFC: $34
.done
    call UpdateEntityPosWithSpeed_27              ; $7AFD: $CD $18 $7B

    ldh  a, [hActiveEntityPosX]                   ; $7B00: $F0 $EE
    cp   $B0                                      ; $7B02: $FE $B0
    jp   nc, label_027_7B51                       ; $7B04: $D2 $51 $7B

jr_027_7B07:
    ldh  a, [hFrameCounter]                       ; $7B07: $F0 $E7
    and  $07                                      ; $7B09: $E6 $07
    ret  nz                                       ; $7B0B: $C0

    ld   hl, wD01B                                ; $7B0C: $21 $1B $D0
    inc  [hl]                                     ; $7B0F: $34
    ld   a, [hl]                                  ; $7B10: $7E
    cp   $06                                      ; $7B11: $FE $06
    jr   nz, .jr_7B16                             ; $7B13: $20 $01

    xor  a                                        ; $7B15: $AF

.jr_7B16
    ld   [hl], a                                  ; $7B16: $77
    ret                                           ; $7B17: $C9

UpdateEntityPosWithSpeed_27::
    call AddEntitySpeedToPos_27                   ; $7B18: $CD $25 $7B
    push bc                                       ; $7B1B: $C5
    ld   a, c                                     ; $7B1C: $79
    add  $10                                      ; $7B1D: $C6 $10
    ld   c, a                                     ; $7B1F: $4F
    call AddEntitySpeedToPos_27                   ; $7B20: $CD $25 $7B
    pop  bc                                       ; $7B23: $C1
    ret                                           ; $7B24: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_27::
    ld   hl, wEntitiesSpeedXTable                 ; $7B25: $21 $40 $C2
    add  hl, bc                                   ; $7B28: $09
    ld   a, [hl]                                  ; $7B29: $7E
    and  a                                        ; $7B2A: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7B2B: $28 $23

    push af                                       ; $7B2D: $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ; $7B2E: $CB $37
    and  $F0                                      ; $7B30: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7B32: $21 $60 $C2
    add  hl, bc                                   ; $7B35: $09
    add  [hl]                                     ; $7B36: $86
    ld   [hl], a                                  ; $7B37: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7B38: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7B3A: $21 $00 $C2
    add  hl, bc                                   ; $7B3D: $09
    pop  af                                       ; $7B3E: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7B3F: $1E $00
    bit  7, a                                     ; $7B41: $CB $7F
    jr   z, .positive                             ; $7B43: $28 $02

    ld   e, $F0                                   ; $7B45: $1E $F0

.positive
    swap a                                        ; $7B47: $CB $37
    and  $0F                                      ; $7B49: $E6 $0F
    or   e                                        ; $7B4B: $B3
    ; Get carry back from d
    rr   d                                        ; $7B4C: $CB $1A
    adc  [hl]                                     ; $7B4E: $8E
    ld   [hl], a                                  ; $7B4F: $77

.return
    ret                                           ; $7B50: $C9

label_027_7B51:
    ld   hl, wEntitiesStatusTable                 ; $7B51: $21 $80 $C2
    add  hl, bc                                   ; $7B54: $09
    ld   [hl], b                                  ; $7B55: $70
    xor  a                                        ; $7B56: $AF
    ld   [wD01F], a                               ; $7B57: $EA $1F $D0
    ld   hl, wCreditsSubscene                     ; $7B5A: $21 $0E $D0
    inc  [hl]                                     ; $7B5D: $34
    ret                                           ; $7B5E: $C9

Data_027_7B5F::
    db   $00, $00, $72, $07, $00, $08, $72, $27   ; $7B5F
    db   $00, $00, $74, $07, $00, $08, $74, $27   ; $7B67
    db   $00, $00, $76, $07, $00, $08, $76, $27   ; $7B6F
    db   $00, $00, $78, $07, $00, $08, $78, $27   ; $7B77
    db   $00, $00, $7A, $07, $00, $08, $7A, $27   ; $7B7F
    db   $00, $00, $7C, $07, $00, $08, $7C, $27   ; $7B87

func_027_7B8F::
    xor  a                                        ; $7B8F: $AF
    ld   [wOAMNextAvailableSlot], a               ; $7B90: $EA $C0 $C3
    ld   a, [wD01B]                               ; $7B93: $FA $1B $D0
    cp   $FF                                      ; $7B96: $FE $FF
    ret  z                                        ; $7B98: $C8

    sla  a                                        ; $7B99: $CB $27
    sla  a                                        ; $7B9B: $CB $27
    sla  a                                        ; $7B9D: $CB $27
    ld   e, a                                     ; $7B9F: $5F
    ld   d, $00                                   ; $7BA0: $16 $00
    ld   hl, Data_027_7B5F                        ; $7BA2: $21 $5F $7B
    add  hl, de                                   ; $7BA5: $19
    ld   c, $02                                   ; $7BA6: $0E $02
    jp   RenderActiveEntitySpritesRectUsingAllOAM ; $7BA8: $C3 $E0 $3C

label_027_7BAB:
    ld   hl, wD015                                ; $7BAB: $21 $15 $D0
    inc  [hl]                                     ; $7BAE: $34
    ret                                           ; $7BAF: $C9

func_027_7BB0::
    call func_027_7E5A                            ; $7BB0: $CD $5A $7E
    call func_027_7F8C                            ; $7BB3: $CD $8C $7F

func_027_7BB6::
    xor  a                                        ; $7BB6: $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ; $7BB7: $EA $D3 $DD
    ld   a, $20                                   ; $7BBA: $3E $20
    ld   [wPalettePartialCopyColorCount], a       ; $7BBC: $EA $D4 $DD
    ld   a, $82                                   ; $7BBF: $3E $82
    ld   [wPaletteDataFlags], a                   ; $7BC1: $EA $D1 $DD
    ret                                           ; $7BC4: $C9

Data_027_7BC5::
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $7BC5
    db   $01, $01, $01, $01, $01, $01, $01, $01   ; $7BCD
    db   $02, $02, $02, $02, $02, $02, $02, $02   ; $7BD5
    db   $03, $03, $03, $03, $03, $03, $03, $03   ; $7BDD
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $7BE5
    db   $05, $05, $05, $05, $05, $05, $05, $05   ; $7BED
    db   $06, $06, $06, $06, $06, $06, $06, $06   ; $7BF5
    db   $07, $07, $07, $07, $07, $07, $07, $07   ; $7BFD
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C05
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C0D
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C15
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C1D
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C25
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C2D
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C35
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7C3D
    db   $07, $07, $07, $07, $07, $07, $07, $07   ; $7C45
    db   $06, $06, $06, $06, $06, $06, $06, $06   ; $7C4D
    db   $05, $05, $05, $05, $05, $05, $05, $05   ; $7C55
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $7C5D
    db   $03, $03, $03, $03, $03, $03, $03, $03   ; $7C65
    db   $02, $02, $02, $02, $02, $02, $02, $02   ; $7C6D
    db   $01, $01, $01, $01, $01, $01, $01, $01   ; $7C75
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $7C7D

; Marin fading in and out

MarinFadePalette0::
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7C85
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7C8D
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7C95
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7C9D
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7CA5
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7CAD
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7CB5

MarinFadePalette1:
    rgb   #F8F8F8, #2838D0, #5050D8, #4840D8   ; $7CBD
    rgb   #F8F8F8, #2838D0, #3840D0, #5060E8   ; $7CC5
    rgb   #F8F8F8, #4840D8, #5050D8, #5060E8   ; $7CCD
    rgb   #F8F8F8, #2838D0, #3850F8, #4058F8   ; $7CD5
    rgb   #F8F8F8, #2838D0, #5038E0, #5060E8   ; $7CDD
    rgb   #F8F8F8, #2838D0, #5050D8, #5038E0   ; $7CE5
    rgb   #F8F8F8, #4038D0, #5038E0, #5060E8   ; $7CED

MarinFadePalette2:
    rgb   #F8F8F8, #2030B0, #7058C0, #5840B8   ; $7CF5
    rgb   #F8F8F8, #2030B0, #4038B0, #7070D8   ; $7CFD
    rgb   #F8F8F8, #5840B8, #7058C0, #7070D8   ; $7D05
    rgb   #F8F8F8, #2030B0, #3850F8, #5068F8   ; $7D0D
    rgb   #F8F8F8, #2030B0, #7030D0, #7070D8   ; $7D15
    rgb   #F8F8F8, #2030B0, #7058C0, #7030D0   ; $7D1D
    rgb   #F8F8F8, #5030B0, #7030D0, #7070D8   ; $7D25

MarinFadePalette3:
    rgb   #F8F8F8, #182888, #8858A8, #6840A0   ; $7D2D
    rgb   #F8F8F8, #182888, #483090, #8880C8   ; $7D35
    rgb   #F8F8F8, #6840A0, #8858A8, #8880C8   ; $7D3D
    rgb   #F8F8F8, #182888, #3850F8, #6078F8   ; $7D45
    rgb   #F8F8F8, #182888, #8828C0, #8880C8   ; $7D4D
    rgb   #F8F8F8, #182888, #8858A8, #8828C0   ; $7D55
    rgb   #F8F8F8, #582888, #8828C0, #8880C8   ; $7D5D

MarinFadePalette4:
    rgb   #F8F8F8, #101868, #A86088, #784080   ; $7D65
    rgb   #F8F8F8, #101868, #482868, #A890B8   ; $7D6D
    rgb   #F8F8F8, #784080, #A86088, #A890B8   ; $7D75
    rgb   #F8F8F8, #101868, #3850F8, #7080F8   ; $7D7D
    rgb   #F8F8F8, #101868, #A818B0, #A890B8   ; $7D85
    rgb   #F8F8F8, #101868, #A86088, #A818B0   ; $7D8D
    rgb   #F8F8F8, #681868, #A818B0, #A890B8   ; $7D95

MarinFadePalette5:
    rgb   #F8F8F8, #081040, #C06070, #884068   ; $7D9D
    rgb   #F8F8F8, #081040, #502048, #C0A0A8   ; $7DA5
    rgb   #F8F8F8, #884068, #C06070, #C0A0A8   ; $7DAD
    rgb   #F8F8F8, #081040, #3850F8, #8090F8   ; $7DB5
    rgb   #F8F8F8, #081040, #C010A0, #C0A0A8   ; $7DBD
    rgb   #F8F8F8, #081040, #C06070, #C010A0   ; $7DC5
    rgb   #F8F8F8, #701040, #C010A0, #C0A0A8   ; $7DCD

MarinFadePalette6:
    rgb   #F8F8F8, #000820, #E06858, #984048   ; $7DD5
    rgb   #F8F8F8, #000820, #581828, #E0B098   ; $7DDD
    rgb   #F8F8F8, #984048, #E06858, #E0B098   ; $7DE5
    rgb   #F8F8F8, #000820, #3850F8, #90A0F8   ; $7DED
    rgb   #F8F8F8, #000820, #E00890, #E0B098   ; $7DF5
    rgb   #F8F8F8, #000820, #E06858, #E00890   ; $7DFD
    rgb   #F8F8F8, #800820, #E00890, #E0B098   ; $7E05

MarinFadePalette7:
    rgb   #3048F8, #000000, #F86840, #A84030   ; $7E0D
    rgb   #F8F8F8, #000000, #581808, #F8C090   ; $7E15
    rgb   #F8F8F8, #A84030, #F86840, #F8C090   ; $7E1D
    rgb   #F8F8F8, #000000, #4058F8, #98A8F8   ; $7E25
    rgb   #F8F8F8, #000000, #F80080, #F8C090   ; $7E2D
    rgb   #F8F8F8, #000000, #F86840, #F80080   ; $7E35
    rgb   #F8F8F8, #880000, #F80080, #F8C090   ; $7E3D

MarinFadePalettes::
    dw   MarinFadePalette0
    dw   MarinFadePalette1
    dw   MarinFadePalette2
    dw   MarinFadePalette3
    dw   MarinFadePalette4
    dw   MarinFadePalette5
    dw   MarinFadePalette6
    dw   MarinFadePalette7

func_027_7E55::
    ld   hl, MarinFadePalette0                    ; $7E55: $21 $85 $7C
    jr   jr_027_7E7D                              ; $7E58: $18 $23

func_027_7E5A::
    ld   a, [wD016]                               ; $7E5A: $FA $16 $D0
    ld   e, a                                     ; $7E5D: $5F
    ld   d, $00                                   ; $7E5E: $16 $00
    ld   hl, Data_027_7BC5                        ; $7E60: $21 $C5 $7B
    add  hl, de                                   ; $7E63: $19
    ld   a, [hl]                                  ; $7E64: $7E
    cp   $FF                                      ; $7E65: $FE $FF
    ret  z                                        ; $7E67: $C8

    ld   hl, wD018                                ; $7E68: $21 $18 $D0
    cp   [hl]                                     ; $7E6B: $BE
    ret  z                                        ; $7E6C: $C8

    ld   [wD018], a                               ; $7E6D: $EA $18 $D0
    sla  a                                        ; $7E70: $CB $27
    ld   e, a                                     ; $7E72: $5F
    ld   d, $00                                   ; $7E73: $16 $00
    ld   hl, MarinFadePalettes                    ; $7E75: $21 $45 $7E
    add  hl, de                                   ; $7E78: $19
    ld   a, [hl+]                                 ; $7E79: $2A
    ld   d, a                                     ; $7E7A: $57
    ld   h, [hl]                                  ; $7E7B: $66
    ld   l, d                                     ; $7E7C: $6A

jr_027_7E7D:
    ld   bc, $38                                  ; $7E7D: $01 $38 $00
    ld   de, wObjPal1                             ; $7E80: $11 $50 $DC
    call CopyData                                 ; $7E83: $CD $14 $29
    ret                                           ; $7E86: $C9

Data_027_7E87::
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7E87
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7E8F
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7E97
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7E9F
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7EA7
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7EAF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7EB7
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7EBF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7EC7
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $7ECF
    db   $01, $01, $01, $01, $01, $01, $01, $01   ; $7ED7
    db   $02, $02, $02, $02, $02, $02, $02, $02   ; $7EDF
    db   $03, $03, $03, $03, $03, $03, $03, $03   ; $7EE7
    db   $04, $04, $04, $04, $04, $04, $04, $04   ; $7EEF
    db   $05, $05, $05, $05, $05, $05, $05, $05   ; $7EF7
    db   $06, $06, $06, $06, $06, $06, $06, $06   ; $7EFF
    db   $07, $07, $07, $07, $07, $07, $07, $07   ; $7F07
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7F0F
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7F17
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7F1F
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7F27
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7F2F
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7F37
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; $7F3F

SeagullFadePalettes::
    rgb   #F8F8F8, #3048F8, #3048F8, #3048F8   ; $7F47
    rgb   #F8F8F8, #2838D0, #7080F8, #7080F8   ; $7F4F
    rgb   #F8F8F8, #2030B0, #B0B8F8, #B0B8F8   ; $7F57
    rgb   #F8F8F8, #182888, #F8F8F8, #F8F8F8   ; $7F5F
    rgb   #F8F8F8, #101868, #C8D0F8, #F8F8F8   ; $7F67
    rgb   #F8F8F8, #081040, #98A8F8, #F8F8F8   ; $7F6F
    rgb   #F8F8F8, #000820, #6880F8, #F8F8F8   ; $7F77
    rgb   #F8F8F8, #000000, #4058F8, #F8F8F8   ; $7F7F

func_027_7F87::
    ld   hl, SeagullFadePalettes                  ; $7F87: $21 $47 $7F
    jr   jr_027_7FAF                              ; $7F8A: $18 $23

func_027_7F8C::
    ld   a, [wD016]                               ; $7F8C: $FA $16 $D0
    ld   e, a                                     ; $7F8F: $5F
    ld   d, $00                                   ; $7F90: $16 $00
    ld   hl, Data_027_7E87                        ; $7F92: $21 $87 $7E
    add  hl, de                                   ; $7F95: $19
    ld   a, [hl]                                  ; $7F96: $7E
    cp   $FF                                      ; $7F97: $FE $FF
    ret  z                                        ; $7F99: $C8

    ld   hl, wD019                                ; $7F9A: $21 $19 $D0
    cp   [hl]                                     ; $7F9D: $BE
    ret  z                                        ; $7F9E: $C8

    ld   [wD019], a                               ; $7F9F: $EA $19 $D0
    sla  a                                        ; $7FA2: $CB $27
    sla  a                                        ; $7FA4: $CB $27
    sla  a                                        ; $7FA6: $CB $27
    ld   e, a                                     ; $7FA8: $5F
    ld   d, $00                                   ; $7FA9: $16 $00
    ld   hl, SeagullFadePalettes                  ; $7FAB: $21 $47 $7F
    add  hl, de                                   ; $7FAE: $19

jr_027_7FAF:
    ld   bc, $08                                  ; $7FAF: $01 $08 $00
    ld   de, wObjPal8                             ; $7FB2: $11 $88 $DC
    call CopyData                                 ; $7FB5: $CD $14 $29
    ret                                           ; $7FB8: $C9


; Pointers table
; Format: [address high-byte, bank]
MarinPortraitTilesTable::
._00 db HIGH(MarinPortraitTiles + $000), BANK(MarinPortraitTiles)
._01 db HIGH(MarinPortraitTiles + $100), BANK(MarinPortraitTiles)
._02 db HIGH(MarinPortraitTiles + $200), BANK(MarinPortraitTiles)
._03 db HIGH(MarinPortraitOverlayTiles + $000), BANK(MarinPortraitOverlayTiles)
._04 db HIGH(MarinPortraitOverlayTiles + $100), BANK(MarinPortraitOverlayTiles)
._05 db HIGH(PhotoAlbumTiles    + $700), BANK(PhotoAlbumTiles)

; Copy tiles of Marin's portrait to tiles memory, in several steps.
;
; Inputs:
;   wD01A:  copy step (from 0 to 5)
LoadCreditsMarinPortraitTiles::
    ; Destination address higher byte
    ld   a, [wD01A]                               ; $7FC5: $FA $1A $D0
    cp   $05                                      ; $7FC8: $FE $05
    jr   nz, .else                                ; $7FCA: $20 $04
    ld   c, $07                                   ; $7FCC: $0E $07
    jr   .sourceEnd                               ; $7FCE: $18 $01
.else
    ld   c, a                                     ; $7FD0: $4F
.sourceEnd

    ; de = a * 2
    sla  a                                        ; $7FD1: $CB $27
    ld   e, a                                     ; $7FD3: $5F
    ld   d, $00                                   ; $7FD4: $16 $00
    ld   hl, MarinPortraitTilesTable              ; $7FD6: $21 $B9 $7F
    add  hl, de                                   ; $7FD9: $19

    ; Source address higher byte
    ld   a, [hl+]                                 ; $7FDA: $2A
    ld   b, a                                     ; $7FDB: $47
    ; Source bank
    ld   a, [hl]                                  ; $7FDC: $7E
    ; Bank to switch back after the transfer
    ld   h, BANK(@)                               ; $7FDD: $26 $27
    ; Execute the copy
    jp   CopyDataToVRAM                           ; $7FDF: $C3 $13 $0A
