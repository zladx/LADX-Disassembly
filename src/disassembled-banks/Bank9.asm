section "bank9",romx,bank[$09]
    nop
    ld   b, d
    ld   h, h
    ld   b, d
    or   l
    ld   b, d
    ld   d, $43
    adc  a, e
    ld   b, e
    ret  c
    ld   b, e
    rra
    ld   b, h
    dec  bc
    ld   b, l
    ld   l, b
    ld   b, l
    or   h
    ld   b, l
    inc  c
    ld   b, [hl]
    ld   e, l
    ld   b, [hl]
    and  a
    ld   b, [hl]
    jr   nz, label_24063
    adc  a, e
    ld   b, a
    ld   d, b
    ld   c, b
    sbc  a, h
    ld   c, b
    db   $EB ; Undefined instruction
    ld   c, b
    ld   b, d
    ld   c, c
    ld   h, h
    ld   c, c
    sbc  a, e
    ld   c, c
    rst  $10
    ld   c, c
    ld   a, [de]

label_2402D::
    ld   c, d
    ld   h, l
    ld   c, d
    jp   nc, label_234A
    ld   c, e
    ld   l, b
    ld   c, e
    or   e
    ld   c, e
    ld   [hl], b
    ld   c, h
    cp   h
    ld   c, h

label_2403C::
    dec  d
    ld   c, l
    add  a, b
    ld   c, l
    db   $E8 ; add  sp, d
    ld   c, l
    rra
    ld   c, [hl]
    ld   e, [hl]
    ld   c, [hl]
    sub  a, e
    ld   c, [hl]
    cp   h
    ld   c, [hl]
    dec  bc
    ld   c, a
    dec  a
    ld   c, a
    ld   l, a
    ld   c, a
    xor  c
    ld   c, a
    push hl
    ld   c, a
    rra
    ld   d, b
    ld   e, h
    ld   d, b
    ld   sp, hl
    ld   d, b
    dec  [hl]
    ld   d, c
    ld   [hl], d
    ld   d, c
    xor  b
    ld   d, c
    db   $E4 ; Undefined instruction
    ld   d, c
    jr   nz, label_240B6
    ld   e, c
    ld   d, d
    cp   h
    ld   d, d
    db   $E3 ; Undefined instruction
    ld   d, d
    ld   a, $53
    add  a, d
    ld   d, e
    cp   h
    ld   d, e
    ld    hl, sp+$53
    ld   c, [hl]
    ld   d, h
    ld   a, [hl]
    ld   d, h
    cp   d
    ld   d, h
    rla
    ld   d, l
    ld   l, [hl]
    ld   d, l
    xor  e
    ld   d, l
    sbc  a, $55
    ld   hl, label_26C56
    ld   d, [hl]
    cp   [hl]
    ld   d, [hl]
    ld   l, $57
    ld   [hl], d
    ld   d, a
    cp   c
    ld   d, a
    rst  $38
    ld   d, a
    dec  a
    ld   e, b
    db   $76 ; Halt
    ld   e, b
    push bc
    ld   e, b
    and  $58
    inc  h
    ld   e, c
    ld   c, d
    ld   e, c
    sbc  a, b
    ld   e, c
    jp   [hl]
    ld   e, c
    ld   c, $5A
    ccf
    ld   e, d
    adc  a, a
    ld   e, d
    ld  [$FF00+C], a
    ld   e, d
    dec  [hl]
    ld   e, e
    add  a, d
    ld   e, e
    cp   [hl]
    ld   e, e
    push af
    ld   e, e
    ld   sp, label_2735C
    ld   e, h
    xor  c
    ld   e, h
    rst  $20
    ld   e, h

label_240B6::
    ld   de, label_2455D
    ld   e, l
    adc  a, e
    ld   e, l
    db   $D3 ; Undefined instruction
    ld   e, l
    ldi  [hl], a
    ld   e, [hl]
    ld   h, h
    ld   e, [hl]
    and  a
    ld   e, [hl]
    di
    ld   e, [hl]
    adc  a, a
    ld   e, d
    ld   c, h
    ld   e, a
    adc  a, b
    ld   e, a
    add  a, $5F
    rrca
    ld   h, b
    ld   e, d
    ld   h, b
    add  a, c
    ld   h, b
    bit  4, b
    rst  $38
    ld   h, b
    jr   c, label_2413B
    add  a, a
    ld   h, c
    rst  0
    ld   h, c
    ld   [label_24362], sp
    ld   h, d
    adc  a, c
    ld   h, d
    jp   nz, label_C62
    ld   h, e
    ld   e, a
    ld   h, e
    sub  a, [hl]
    ld   h, e
    db   $63
    ld   h, e
    ldd  [hl], a
    ld   h, h
    sub  a, l
    ld   h, h
    rst  0
    ld   h, h
    ld   e, c
    ld   h, l
    ld   a, d
    ld   h, l
    cp   [hl]
    ld   h, l
    ld  [$FF00+C], a
    ld   h, l
    dec  bc
    ld   h, [hl]
    inc  [hl]
    ld   h, [hl]
    nop
    ld   b, b
    jr   c, label_24144
    add  a, c
    ld   b, b
    cp   e
    ld   b, b
    or   $40
    ld   l, $41
    add  a, d
    ld   b, c
    pop  hl
    ld   b, c
    cpl
    ld   b, d
    ld   e, h
    ld   b, d
    sub  a, d
    ld   b, d
    cp   a
    ld   b, d
    db   $FC ; Undefined instruction
    ld   b, d
    cp   c
    ld   b, e
    ld   a, [label_3A43]
    ld   b, h

label_24120::
    sub  a, e
    ld   b, h
    cp   h
    ld   b, h
    db   $DB
    ld   b, h
    ld   d, $45
    ld   c, c
    ld   b, l
    add  a, l
    ld   b, l
    pop  de
    ld   b, l
    ei
    ld   b, l
    dec  [hl]
    ld   b, [hl]
    ld   a, b
    ld   b, [hl]
    or   l
    ld   b, [hl]
    sbc  a, $46
    ld   a, [hli]
    ld   b, a
    ld   l, h

label_2413B::
    ld   b, a
    and  a
    ld   b, a
    rst  $18
    ld   b, a
    ld   a, [de]
    ld   c, b
    ld   h, [hl]
    ld   c, b

label_24144::
    xor  e
    ld   c, b
    sbc  a, $48
    or   $48
    add  hl, sp
    ld   c, c
    ld   [hl], e
    ld   c, c

label_2414E::
    or   b
    ld   c, c
    db   $E4 ; Undefined instruction
    ld   c, c
    add  hl, de
    ld   c, d
    ld   b, [hl]
    ld   c, d
    ld   h, l
    ld   c, d
    xor  [hl]
    ld   c, d
    ei
    ld   c, d
    dec  e
    ld   c, e
    ld   c, e
    ld   c, e
    sbc  a, d
    ld   c, e
    ret  z
    ld   c, e
    push af
    ld   c, e
    ld   h, $4C
    ld   h, e
    ld   c, h
    sbc  a, c
    ld   c, h
    ld   a, [label_2444C]
    ld   c, l
    add  a, l
    ld   c, l
    rst  8
    ld   c, l
    ld   [bc], a
    ld   c, [hl]
    ld   b, a
    ld   c, [hl]
    add  a, a
    ld   c, [hl]
    rst  0
    ld   c, [hl]
    db   $E8 ; add  sp, d
    ld   c, [hl]
    db   $10 ; Undefined instruction
    ld   c, h
    ld   c, a
    and  c
    ld   c, a
    add  a, $4F
    pop  hl
    ld   c, a
    ld   [label_26750], sp
    ld   d, b
    sub  a, $50
    inc  h
    ld   d, c
    ld   d, l
    ld   d, c
    or   [hl]
    ld   d, c
    ld   [rHDMA1], a
    xor  $51
    dec  hl
    ld   d, d
    ld   l, c
    ld   d, d
    and  b
    ld   d, d
    ld   a, [$FF00+C]
    cpl
    ld   d, e
    ld   h, a
    ld   d, e
    and  b
    ld   d, e
    cp   l
    ld   d, e
    cp   $53
    ld   l, l
    ld   d, h
    ret  z
    ld   d, h
    dec  bc
    ld   d, l
    ld   c, a
    ld   d, l
    add  a, d
    ld   d, l
    xor  c
    ld   d, l
    ld   [label_2B55], a
    ld   d, [hl]
    ld   e, a
    ld   d, [hl]
    xor  h
    ld   d, [hl]
    di
    ld   d, [hl]
    dec  h
    ld   d, a
    ld   c, b
    ld   d, a
    ld   a, a
    ld   d, a
    xor  b
    ld   d, a
    call nc, label_FE57
    ld   d, a
    ld   [hl], $58
    ld   [hl], d
    ld   e, b
    and  d
    ld   e, b
    sbc  a, $58
    scf
    ld   e, c
    sub  a, b
    ld   e, c
    cp   b
    ld   e, c
    nop
    ld   e, d
    ld   d, l
    ld   e, d
    adc  a, l
    ld   e, d
    xor  c
    ld   e, d
    and  $5A
    rla
    ld   e, e
    ld   e, b
    ld   e, e
    ld   a, e
    ld   e, e
    and  l
    ld   e, e
    reti
    ld   e, e
    inc  l
    ld   e, h
    ld   e, e
    ld   e, h
    or   l
    ld   e, h
    ld   a, [label_2495C]
    ld   e, l
    ld   a, c
    ld   e, l

label_241FA::
    jp   nz, label_FC5D
    ld   e, l
    ld   a, [hli]

label_241FF::
    ld   e, [hl]
    dec  bc
    push hl
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_241FA
    db   $10 ; Undefined instruction
    ld   de, label_197D
    ld   a, h
    inc  de
    add  a, b
    add  a, h
    inc  d
    ld   c, l
    rla
    add  a, c
    inc  hl
    scf
    add  a, e

label_2421B::
    inc  h
    ld   a, [bc]
    daa
    jr   c, label_24252
    dec  e
    inc  sp
    ld   l, $34
    ld   c, b
    ld   [hl], $49
    scf
    ld   c, [hl]
    jr   c, label_24288
    ld   b, c
    dec  e
    ld   b, d
    scf
    ld   b, e
    add  hl, sp
    ld   b, h
    pop  hl
    pop  hl
    rlca
    db   $3A ; ldd  a, [hl]
    ld   e, b
    db   $10 ; Undefined instruction
    ld   b, l
    db   $3A ; ldd  a, [hl]
    jp   nz, label_E035
    ld   b, a
    dec  sp
    ld   c, b
    jr   c, label_24293
    dec  e
    jp   label_3751
    jp   nz, label_3752
    add  a, l
    ld   d, e
    add  hl, bc
    add  a, d
    ld   e, b
    ld   a, d
    jp   nz, label_3760
    add  a, l
    ld   h, e
    add  hl, bc
    ld   l, b
    jr   c, label_242CB
    ld   l, $85
    ld   [hl], e
    cpl
    ld   a, b

label_2425E::
    ld   c, [hl]
    ld   l, c
    ld   d, b
    ld   a, c
    add  hl, bc
    cp   $0B
    push hl
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_2425E
    nop
    ld   a, h
    ld   bc, label_37D
    ld   a, h
    inc  b
    ld   a, l
    db   $10 ; Undefined instruction
    add  a, d
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   a, [hl]
    add  a, d
    inc  de
    inc  e
    dec  d

label_24282::
    ld   a, [hl]
    ld   d, $7D
    dec  [hl]
    dec  e
    ld   [hl], $50
    scf
    ld   e, l
    ld   b, e
    dec  e
    add  a, [hl]
    ld   b, h
    ld   d, b
    ld   b, l
    scf
    ld   b, [hl]

label_24293::
    db   $E8 ; add  sp, d
    ld   b, a
    jr   c, label_2421B
    ld   d, b
    ld   a, d
    ld   d, h
    ld   a, [bc]
    ld   d, l
    inc  sp
    ld   d, [hl]
    ld   [$FF57], a
    inc  [hl]
    add  a, d
    ld   e, b
    inc  bc
    add  a, e
    ld   h, b
    ld   d, b
    ld   h, e
    scf
    add  a, [hl]
    ld   h, h
    ld   a, [bc]
    add  a, e
    ld   [hl], b
    add  hl, bc

label_242AF::
    ld   [hl], e
    ld   l, $86
    ld   [hl], h
    cpl
    cp   $0B
    push hl
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_242AF
    ld   b, $7C
    rlca
    ld   a, l
    dec  d
    ld   a, h
    add  a, d
    ld   d, $1C
    jr   label_24349

label_242CB::
    add  hl, de
    ld   a, l
    ld   [de], a
    add  a, b
    inc  de
    ld   c, l
    inc  d
    add  a, c
    ldi  [hl], a
    scf
    inc  hl
    inc  bc
    inc  h
    jr   c, label_2430B
    dec  e
    ldd  [hl], a
    ld   l, $33
    cpl
    inc  [hl]
    ld   c, [hl]
    dec  [hl]
    ld   e, l
    add  hl, sp
    dec  e
    ld   b, b
    ld   d, b
    ld   b, c
    ld   c, e
    ld   b, d
    add  hl, sp
    ld   b, e
    pop  hl
    pop  hl
    rlca
    dec  a
    ld   e, b
    db   $10 ; Undefined instruction
    dec  sp
    jp   label_3845
    ld   c, c
    scf
    add  a, l
    ld   d, b
    inc  bc
    add  a, e
    ld   d, [hl]
    ld   d, b

label_242FF::
    ld   e, c
    ld   c, e
    add  a, l
    ld   h, b
    inc  bc
    add  a, l
    ld   [hl], b
    cpl
    ld   [hl], l
    ld   c, [hl]
    add  a, h
    ld   h, [hl]

label_2430B::
    inc  bc
    add  a, h
    db   $76 ; Halt
    inc  bc
    ld   a, c
    dec  a
    ld   b, d
    call label_D744
    cp   $0B
    inc  bc
    nop
    add  a, b
    add  a, d
    ld   bc, label_34D
    add  a, c
    inc  b
    nop
    dec  b
    add  a, b
    add  a, d
    ld   b, $4D
    ld   [label_981], sp
    nop
    jp   label_3710
    add  a, a
    ld   de, $8703
    ld   hl, $8703
    ld   sp, label_1303
    ld   c, h

label_24338::
    inc  d
    ld   c, l
    dec  d
    ld   c, e
    jp   label_3818
    ld   b, b
    ld   l, $82
    ld   b, c
    cpl
    ld   b, e
    ld   c, [hl]
    inc  sp
    dec  a
    inc  [hl]

label_24349::
    cpl
    dec  [hl]
    inc  a
    ld   b, h
    db   $3A ; ldd  a, [hl]
    ld   b, l
    ld   l, $82
    ld   b, [hl]
    cpl
    ld   c, b
    ld   c, [hl]
    ld   d, b
    add  hl, sp
    add  a, d
    ld   d, c
    db   $3A ; ldd  a, [hl]
    ld   d, e
    dec  sp
    ld   d, l
    add  hl, sp
    add  a, d
    ld   d, [hl]
    db   $3A ; ldd  a, [hl]
    ld   e, b

label_24362::
    dec  sp
    add  hl, sp
    ld   e, l
    call nz, label_3849
    ld   l, c
    ld   a, d
    ld   a, b
    add  hl, bc
    add  hl, de
    nop
    add  hl, hl
    rst  $28
    ld   h, [hl]
    ret  z
    adc  a, d
    ld   [hl], b
    cpl
    ld   [hl], d
    ld   c, b
    ld   [hl], e
    ld   c, d
    ld   [hl], h
    ld   c, c
    db   $76 ; Halt
    ld   c, b
    ld   [hl], a
    ld   c, d
    ld   a, b
    ld   c, c
    ld   a, c
    ld   c, [hl]
    ld   b, h
    pop  hl

label_24385::
    pop  hl
    rra
    xor  $18
    ld   b, b
    cp   $0B
    push hl
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_24385
    ld   b, $7C
    rlca
    ld   a, l
    db   $10 ; Undefined instruction
    ld   de, label_137D
    ld   a, h
    inc  d
    ld   a, l
    dec  d
    ld   a, h
    add  a, d
    ld   d, $1C
    jr   label_24427
    add  hl, de
    ld   a, l
    ldd  [hl], a
    dec  e
    add  a, a
    inc  sp
    ld   d, b
    jp   nz, label_3742
    add  a, a

label_243B4::
    ld   b, e
    inc  bc
    add  a, a
    ld   d, e
    inc  bc
    add  a, a
    ld   h, e
    inc  bc
    ld   b, l
    and  b
    ld   [hl], b
    dec  e
    ld   [hl], c
    ld   d, b
    ld   [hl], d
    ld   l, $87
    ld   [hl], e
    cpl
    db   $76 ; Halt
    ld   c, b
    ld   [hl], a
    ld   c, d
    ld   a, b
    ld   c, c
    add  a, e
    ld   h, b
    ld   a, d
    ld   h, [hl]
    jr   nz, label_243B4
    rra
    ld  [$FF00+C], a
    adc  a, b
    ld   d, b
    cp   $0B
    inc  bc
    adc  a, d
    nop
    nop

label_243DD::
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_243D2
    inc  de
    ld   a, h
    inc  b
    ld   a, h
    dec  b
    ld   a, l
    ld   d, $7E
    rla
    ld   a, l
    add  a, d
    inc  d
    inc  e
    add  a, a
    jr   nc, label_24443
    scf
    ld   e, l
    add  a, d
    jr   c, label_243DD
    ld   b, c
    add  hl, bc
    jp   label_3847
    call nz, label_E548
    call nz, label_E549
    ld   h, e
    add  hl, bc
    add  a, a
    ld   [hl], b
    cpl
    ld   [hl], e
    ld   c, b
    ld   [hl], h
    ld   [rUNKN5], a
    ld   c, c
    ld   [hl], a
    ld   c, [hl]
    ld   a, b
    ld   d, b
    ld   a, c
    ld   e, l
    ld   b, e
    jr   nz, label_2445D
    jr   nz, label_2446A
    jr   nz, label_2446F

label_2441B::
    jr   nz, label_24482

label_2441D::
    jr   nz, label_2441D
    dec  bc

label_24420::
    push hl
    dec  [hl]
    pop  hl
    adc  a, d
    nop

label_24425::
    nop
    adc  a, d

label_24427::
    stop
    adc  a, d
    jr   nz, label_2441B
    inc  b
    dec  b
    dec  b
    ld   b, $06
    rlca
    inc  d
    ld   h, e

label_24434::
    dec  d
    ld   h, h
    ld   d, $65

label_24438::
    inc  h
    ld   [hl], c
    dec  h
    inc  e
    ld   h, $7F
    inc  [hl]
    xor  c
    dec  [hl]
    xor  d
    ld   [hl], $BF
    db   $10 ; Undefined instruction
    ld   de, label_187D
    ld   a, h
    add  hl, de
    ld   a, l

label_2444C::
    inc  de
    add  a, b
    rla
    add  a, c
    jp   nz, label_3723
    jp   nz, label_3827
    ldd  [hl], a
    dec  e
    jr   c, label_244B7
    jp   nz, label_3742

label_2445D::
    jp   nz, label_3848
    ld   b, e
    ld   l, $44
    ld   c, b
    ld   b, [hl]
    ld   c, c
    ld   b, a
    ld   c, [hl]
    jp   nz, label_3848
    ld   d, e
    ld   a, $83
    ld   d, h

label_2446F::
    db   $3A ; ldd  a, [hl]
    ld   d, a
    ccf
    ld   h, c
    dec  e
    ld   h, d
    ld   l, $63
    cpl
    ld   h, h
    ld   c, b
    ld   h, [hl]
    ld   c, c
    ld   h, a
    cpl
    ld   l, b
    ld   c, [hl]
    ld   l, c
    ld   e, l

label_24482::
    ld   [hl], c
    scf
    ld   [hl], d
    ld   a, $85
    ld   [hl], e
    db   $3A ; ldd  a, [hl]
    ld   a, b
    dec  sp
    ld   a, c
    jr   c, label_24452
    ld   b, l
    ld   [$FFE1], a
    ld   [label_25070], sp
    ld   a, h
    cp   $0B
    push hl
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_24490
    inc  b
    dec  b
    dec  b
    ld   b, $06
    rlca
    inc  d
    ld   h, e
    dec  d
    ld   h, h
    ld   d, $65
    inc  h
    ld   [hl], c
    ld   h, $7F
    inc  [hl]
    xor  c
    ld   [hl], $BF
    db   $10 ; Undefined instruction

label_244B7::
    ld   de, label_187D
    ld   a, h
    add  hl, de
    ld   a, l
    inc  de
    add  a, b
    rla
    add  a, c
    jp   nz, label_3723
    jp   nz, label_3827
    ldd  [hl], a
    dec  e
    jr   c, label_24528
    jp   nz, label_3742
    jp   nz, label_3848
    ld   b, e
    ld   l, $44
    ld   c, b
    ld   b, [hl]
    ld   c, c
    ld   b, a
    ld   c, [hl]
    jp   nz, label_3848
    ld   d, e
    ld   a, $83
    ld   d, h
    db   $3A ; ldd  a, [hl]
    ld   d, a
    ccf
    ld   h, c
    dec  e
    ld   h, d
    ld   l, $63
    cpl
    ld   h, h
    ld   c, b
    ld   h, [hl]
    ld   c, c
    ld   h, a
    cpl
    ld   l, b
    ld   c, [hl]
    ld   l, c
    ld   e, l
    ld   [hl], c
    scf
    ld   [hl], d
    ld   a, $85
    ld   [hl], e
    db   $3A ; ldd  a, [hl]
    ld   a, b
    dec  sp
    ld   a, c
    jr   c, label_244C3
    ld   b, l
    ld   [rNR51], a
    pop  bc
    dec  [hl]
    set  4, c
    ld   [label_25070], sp
    ld   a, h
    cp   $0B
    push hl
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    add  a, l
    jr   nz, label_24505
    db   $10 ; Undefined instruction
    ld   de, label_137D
    add  a, b
    add  a, l
    inc  d
    ld   c, l
    add  hl, de
    add  a, c
    inc  hl
    scf
    add  a, l
    inc  h
    inc  bc
    dec  h
    add  hl, bc

label_24528::
    add  hl, hl
    jr   c, label_2455D
    dec  e
    inc  sp
    ld   c, e
    add  a, l
    inc  [hl]
    inc  bc
    add  hl, sp
    ld   a, d
    jp   label_3742
    ld   b, e
    db   $D3 ; Undefined instruction
    pop  hl
    ld   a, [bc]
    xor  $78
    jr   nc, label_24501
    ld   b, h
    inc  bc
    ld   b, l
    dec  a
    ld   b, [hl]
    ld   c, b
    ld   b, a

label_24545::
    ld   c, d
    ld   c, b
    ld   c, c
    ld   c, c
    ld   c, [hl]
    ld   d, e
    inc  bc
    jp   nz, label_3855
    add  a, e
    ld   d, [hl]
    db   $3A ; ldd  a, [hl]
    ld   e, c
    dec  sp
    ld   h, e
    add  hl, bc
    add  a, h
    ld   h, [hl]
    inc  bc
    ld   [hl], d
    ld   l, $82
    ld   [hl], e

label_2455D::
    cpl
    ld   [hl], l
    ld   c, [hl]
    db   $76 ; Halt
    ld   [rUNKN7], a
    inc  a
    add  a, d
    ld   a, b
    inc  bc
    cp   $0B
    push hl
    adc  a, d

label_2456B::
    nop
    nop
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_24562
    ld   [de], a
    ld   a, h
    inc  de
    ld   a, l
    jr   label_245F5
    add  hl, de
    ld   a, l
    jr   nz, label_24545
    add  a, d
    ld   hl, label_247A
    ld   a, d
    add  a, d
    jr   z, label_245FF
    add  a, e
    jr   nc, label_24602
    add  a, [hl]
    inc  sp
    ld   a, e
    inc  [hl]
    ld   a, d
    add  a, d
    jr   c, label_2460A
    add  hl, hl
    ret  z
    add  a, d
    ld   d, b
    ld   d, b
    ld   d, d
    ld   e, l
    add  a, d
    ld   h, b
    inc  bc
    jp   nz, label_3862
    add  a, d
    ld   [hl], b
    inc  bc
    ld   [hl], c
    add  hl, bc
    ld   d, h
    dec  e
    add  a, l
    ld   d, l
    ld   d, b
    ld   h, h
    scf
    add  a, l
    ld   h, l
    inc  bc
    ld   [hl], e
    dec  e

label_245AE::
    ld   [hl], h
    ld   l, $85
    ld   [hl], l
    cpl
    cp   $0B
    inc  bc
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    adc  a, d
    jr   nz, label_245AE
    add  a, e
    jr   nz, label_2463A
    add  a, e
    jr   nc, label_2463E
    add  a, h
    inc  sp
    ld   a, e
    add  a, h
    ld   b, b
    push hl
    ld   b, h
    dec  e
    add  a, l
    ld   b, l
    ld   d, b
    add  a, h

label_245D1::
    ld   d, b
    ld   d, b

label_245D3::
    ld   d, h
    ld   c, e
    add  a, h
    ld   [hl], b
    cpl
    ld   [hl], e
    inc  a
    ld   h, [hl]
    add  hl, bc
    ld   [bc], a
    ld   a, h
    inc  bc
    ld   a, l
    ld   de, $827C
    ld   [de], a
    inc  e
    inc  d
    ld   a, [hl]
    dec  d
    ld   a, l
    jr   label_2456B
    add  hl, de
    ld   c, l
    add  a, d
    daa
    ld   a, b
    add  a, d
    scf
    ld   a, c
    jp   nz, label_329
    ld   c, b
    ld   l, $49
    cpl
    ld   e, b
    ld   a, $C2
    ld   e, c
    db   $3A ; ldd  a, [hl]

label_245FF::
    ld   l, b
    add  hl, sp
    ld   [hl], b

label_24602::
    ld   c, b
    ld   [hl], c
    ld   c, d
    ld   [hl], d
    ld   c, c
    jr   nz, label_245D1
    jr   c, label_245D3
    cp   $0B
    inc  bc
    adc  a, d
    nop
    ld   c, l
    adc  a, d
    ld   b, b
    cpl
    ld   b, e
    ld   c, b
    ld   b, h
    ld   c, d
    ld   b, l
    ld   c, c
    ld   b, [hl]
    inc  a
    ld   b, a
    inc  bc
    ld   c, b
    dec  a

label_24620::
    adc  a, d
    ld   d, b
    db   $3A ; ldd  a, [hl]
    add  a, d
    ld   h, b
    db   $3A ; ldd  a, [hl]
    adc  a, d
    ld   [hl], b
    inc  bc
    jp   nz, label_3762
    ld   d, [hl]
    ld   l, $57
    cpl
    ld   e, b
    ld   c, [hl]
    ld   h, c
    pop  hl
    pop  hl
    ld   a, [bc]
    adc  a, e
    ld   d, b
    ld   a, h
    ld   h, [hl]

label_2463A::
    add  hl, sp
    ld   h, a
    pop  hl
    pop  hl

label_2463E::
    ld   a, [bc]
    ld   a, [hl]
    ld   h, b
    ld   a, h
    ld   l, b
    dec  sp
    inc  bc
    db   $FD ; Undefined instruction
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    ld   [de], a
    add  hl, bc
    ld   d, $09
    inc  hl
    add  hl, bc
    jr   c, label_2465C
    jp   nz, label_E044
    ld   h, d
    sbc  a, $00
    add  a, b
    db   $10 ; Undefined instruction

label_2465C::
    cp   $0B
    inc  bc
    add  a, e
    nop
    ld   c, l
    inc  bc
    add  a, c
    inc  de
    ld   c, h
    inc  d
    ld   c, l
    dec  d
    add  a, c
    add  a, l
    ld   b, b
    cpl
    ld   b, l
    ld   c, [hl]
    add  a, l
    dec  [hl]
    ld   a, d
    scf
    ld   a, e
    add  a, l
    ld   d, b
    db   $3A ; ldd  a, [hl]
    add  a, a
    ld   [hl], b
    inc  bc
    ld   d, l
    ccf
    ld   b, [hl]
    ld   d, b
    ld   b, a
    ld   e, l
    add  a, d
    ld   c, b
    push hl
    add  a, d
    ld   [hl], h
    add  hl, bc
    ld   h, [hl]
    add  hl, bc
    add  a, e
    ld   d, a
    ld   a, b
    add  a, e
    ld   h, a

label_2468D::
    ld   a, c
    add  a, [hl]
    inc  b
    nop
    add  a, h
    ld   d, $00
    ld   d, $7C
    rla
    ld   a, l
    add  a, h
    ld   h, $EF
    ld   [hl], a
    jr   c, label_24620
    ld   a, b
    push hl
    ld   d, [hl]
    inc  bc
    dec  h
    jr   c, label_246FA
    dec  sp
    cp   $0B
    push hl
    adc  a, d
    nop
    nop
    stop
    ld   de, label_127C
    ld   a, l
    inc  de
    nop
    inc  d
    ld   a, h
    dec  d
    ld   a, l
    ld   d, $80
    add  a, d
    rla
    ld   c, l
    add  hl, de
    add  a, c
    jr   nz, label_246B0
    add  a, d
    ld   hl, $8478
    inc  hl
    ld   a, d
    add  a, d
    daa
    jr   nz, label_2468D
    add  hl, hl
    jr   c, label_246FE
    ld   a, d
    add  a, d
    ld   sp, label_3579
    dec  e
    ld   [hl], $4B
    scf
    inc  bc
    jr   c, label_246DD
    ld   b, c
    dec  e
    add  a, d

label_246DD::
    ld   b, d
    ld   d, b
    ld   b, h
    ld   e, l
    jp   nz, label_3745
    add  a, d
    ld   b, [hl]
    inc  bc
    ld   c, b
    dec  a
    ld   c, c
    ld   c, [hl]
    add  a, d
    ld   d, b
    ld   a, b
    add  a, d
    ld   d, d
    inc  bc
    jp   nz, label_3854
    add  a, d
    ld   d, [hl]
    inc  bc
    add  a, d
    ld   c, b
    ld   a, d

label_246FA::
    ld   e, b
    jr   c, label_24756
    ccf

label_246FE::
    add  a, d

label_246FF::
    ld   h, b
    ld   a, c
    add  a, d
    ld   h, d
    inc  bc
    ld   h, l
    ld   l, $82
    ld   h, [hl]
    cpl
    ld   l, b
    ld   c, [hl]
    ld   l, c
    ccf
    ld   [hl], c
    ld   l, $82
    ld   [hl], d
    cpl
    ld   [hl], h
    ld   c, [hl]
    ld   [hl], l
    ld   a, $76
    pop  hl
    ld   [hl], a
    db   $3A ; ldd  a, [hl]
    add  a, d
    ld   a, b
    ccf
    ld   [hl], e
    ld   [$FFFE], a

label_24720::
    dec  bc
    push hl
    adc  a, d
    nop
    nop

label_24725::
    adc  a, d
    stop
    ld   d, $7C
    add  a, d
    rla
    inc  e
    add  hl, de
    ld   a, l
    rlca
    ld   a, h
    ld   [$8A7D], sp
    jr   nz, label_24725
    db   $10 ; Undefined instruction
    add  a, e
    ld   de, label_144D
    add  a, c
    add  a, d
    ld   [hl], $50
    jr   c, label_2479F
    jr   nc, label_24782
    add  a, e
    ld   sp, label_343A
    ccf
    jr   nz, label_24779
    add  a, e
    ld   hl, label_242F
    ld   c, [hl]
    dec  [hl]
    dec  e
    add  a, d
    ld   b, [hl]
    inc  bc
    jp   nz, label_3848
    add  a, [hl]
    ld   b, b
    ld   a, d
    add  a, d
    ld   d, [hl]
    inc  bc
    ld   d, b
    ld   a, $83
    ld   d, c
    db   $3A ; ldd  a, [hl]
    ld   d, h
    ccf
    ld   d, l
    scf
    ld   h, b
    ld   a, $83
    ld   h, c
    db   $3A ; ldd  a, [hl]
    ld   h, h
    ccf
    ld   h, l
    ld   l, $82
    ld   h, [hl]
    cpl
    ld   l, b
    ld   c, [hl]
    ld   [hl], b
    scf
    add  a, e
    ld   [hl], c

label_24779::
    inc  bc
    ld   [hl], h
    jr   c, label_247F2
    ld   a, $82
    db   $76 ; Halt
    db   $3A ; ldd  a, [hl]
    ld   a, b

label_24782::
    ccf
    ld   h, c
    pop  hl
    pop  hl
    ld   a, [bc]
    ld   a, [$FF00+C]
    ld   a, h
    cp   $0B
    inc  bc
    dec  h
    pop  hl
    adc  a, d
    nop

label_24791::
    nop
    adc  a, d
    stop
    db   $10 ; Undefined instruction
    ld   de, label_127E
    ld   a, l
    jr   label_24819
    add  hl, de
    ld   a, l

label_2479F::
    adc  a, d
    jr   nz, label_24791
    jr   nc, label_247C1
    adc  a, c
    ld   sp, $C250
    ld   b, b
    scf
    ld   h, b
    ld   l, $61
    inc  a
    ld   [hl], b
    ld   a, $71
    ld   l, $82
    ld   [hl], d
    cpl
    ld   [hl], h
    ld   c, b
    ld   [hl], l
    ld   c, d
    db   $76 ; Halt
    ld   c, c
    ld   [hl], a
    ld   c, b
    ld   a, b
    ld   c, d
    ld   a, c
    ld   c, c

label_247C1::
    ld   b, c
    ld   d, h
    ld   b, d
    jr   nz, label_24817
    jr   nz, label_2481E
    add  hl, bc
    ld   e, c
    add  hl, bc
    ld   h, e
    add  hl, bc
    call nz, label_27203
    ld   b, e
    or   [hl]
    push bc
    inc  b
    ld   [hl], h
    push bc
    dec  b
    ld   [hl], h
    push bc
    ld   b, $74
    call nz, label_27307
    ld   b, a
    or   a
    inc  d
    ld   [hl], l
    dec  d
    sub  a, $16
    db   $76 ; Halt
    pop  hl
    ld   b, $0E
    ld   d, b
    ld   a, h
    cp   $0B
    inc  bc
    adc  a, d
    nop

label_247F0::
    nop
    adc  a, d

label_247F2::
    stop
    db   $10 ; Undefined instruction
    ld   de, label_127E
    ld   a, l
    jr   label_24878
    add  hl, de
    ld   a, l
    adc  a, d

label_247FF::
    jr   nz, label_247F0
    jr   nc, label_24820
    adc  a, c
    ld   sp, $C250
    ld   b, b
    scf
    ld   h, b
    ld   l, $61
    inc  a
    ld   [hl], b
    ld   a, $71
    ld   l, $82
    ld   [hl], d
    cpl
    ld   [hl], h
    ld   c, b
    ld   [hl], l

label_24817::
    ld   c, d
    db   $76 ; Halt

label_24819::
    ld   c, c
    ld   [hl], a
    ld   c, b
    ld   a, b
    ld   c, d

label_2481E::
    ld   a, c
    ld   c, c

label_24820::
    ld   b, c
    ld   d, h
    ld   b, d
    jr   nz, label_24876
    jr   nz, label_2487D
    add  hl, bc
    ld   e, c
    add  hl, bc
    ld   h, e
    add  hl, bc
    call nz, label_27203
    ld   b, e
    or   [hl]
    push bc
    inc  b
    ld   [hl], h
    push bc
    dec  b
    ld   [hl], h
    push bc
    ld   b, $74
    call nz, label_27307
    ld   b, a
    or   a
    inc  d
    ld   [hl], l
    dec  d
    sub  a, $16
    db   $76 ; Halt
    jp   nz, label_27735
    dec  h
    pop  hl
    pop  hl
    ld   b, $0E
    ld   d, b
    ld   a, h
    cp   $0B
    push hl
    adc  a, d
    nop
    nop
    adc  a, d
    stop
    ld   b, $7C
    rlca

label_2485B::
    ld   a, l
    db   $10 ; Undefined instruction
    ld   de, label_157D
    ld   a, [hl]
    add  a, d
    ld   d, $1C
    inc  d
    ld   a, h
    jr   label_248E6
    adc  a, d
    jr   nz, label_2485B
    adc  a, b
    jr   nc, label_248BF
    jr   c, label_248CE
    adc  a, b
    ld   b, b
    inc  bc
    jp   nz, label_3848
    ld   b, c

label_24878::
    add  hl, bc
    ld   b, a
    add  hl, bc
    inc  sp
    db   $FD ; Undefined instruction

label_2487D::
    pop  hl
    ld   a, [bc]
    adc  a, [hl]
    ld   [hl], b
    ld   a, h
    ld   b, e
    or   [hl]
    ld   b, l
    or   a
    adc  a, b
    ld   d, b
    inc  bc
    add  a, [hl]
    ld   h, b
    inc  bc
    ld   h, [hl]
    dec  a
    ld   h, a
    cpl
    ld   l, b
    ld   c, [hl]

label_24892::
    add  a, [hl]
    ld   [hl], b
    cpl
    db   $76 ; Halt
    ld   c, [hl]
    ld   [hl], a
    db   $3A ; ldd  a, [hl]
    ld   a, b
    ccf
    cp   $0B
    add  hl, bc
    rst  0
    nop
    scf
    ld   [hl], b
    ld   l, $85
    ld   [hl], c
    cpl
    db   $76 ; Halt
    inc  a
    rst  0
    ld   bc, label_26137
    inc  sp
    adc  a, b
    ld   h, d
    cpl
    ld   [bc], a
    add  hl, sp
    add  a, l
    inc  bc
    db   $3A ; ldd  a, [hl]
    dec  b
    pop  hl
    pop  hl
    rlca
    ld   e, l
    ld   d, b
    ld   a, h
    ld   [label_33B], sp

label_248BF::
    or   [hl]
    rlca
    or   [hl]
    inc  de
    or   a
    rla
    or   a
    ldi  [hl], a
    ret  z
    jr   z, label_24892
    add  a, e
    ld   [hl], a
    ld   a, [bc]
    add  hl, bc

label_248CE::
    ret  z
    add  a, e
    ld   [hl], a
    inc  b
    add  a, d
    ld   [hl], a
    push af
    ld   c, c
    dec  a
    ld   e, c
    jr   c, label_24943
    inc  [hl]
    add  a, e
    ldd  [hl], a
    inc  bc
    ld   b, e
    inc  bc
    ld   d, d
    inc  bc
    add  a, e
    ld   [hl], $03
    ld   b, a

label_248E6::
    inc  bc
    add  a, e
    ld   d, [hl]
    inc  bc
    cp   $0B
    inc  bc
    inc  bc
    add  hl, sp
    add  a, [hl]
    inc  b
    db   $3A ; ldd  a, [hl]
    call nz, label_910
    dec  d
    push af
    ld   d, $F5
    ld   d, $45
    jp   nz, label_921
    jp   nz, label_923
    ld   h, $E1
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    add  a, d
    ld   b, b
    cpl
    ld   b, d
    inc  a
    ld   b, [hl]
    dec  a
    add  a, e
    ld   b, a
    cpl
    jp   nz, label_C850
    ld   d, c
    ld   a, [bc]
    ld   d, d
    ld   l, $53
    ld   c, b
    ld   d, h
    ld   c, d
    ld   d, l
    ld   c, c
    ld   d, [hl]

label_24920::
    ld   c, [hl]
    add  a, e
    ld   d, a
    db   $3A ; ldd  a, [hl]
    ld   h, d
    add  hl, sp
    add  a, h
    ld   h, e
    db   $3A ; ldd  a, [hl]
    ld   h, [hl]
    dec  sp
    ld   a, a
    push af
    add  a, h
    ld   [hl], c
    ld   a, [bc]
    ld   [hl], d
    add  hl, bc
    ld   [hl], l
    dec  a
    db   $76 ; Halt
    ld   c, b
    ld   [hl], a
    ld   c, d
    ld   a, b
    ld   c, c
    ld   a, c
    inc  a
    ld   d, c
    ld   l, a
    add  a, e
    nop
    ret  z
    cp   $0B

label_24943::
    inc  bc

label_24944::
    add  a, l
    nop
    db   $3A ; ldd  a, [hl]
    dec  b
    dec  sp
    adc  a, d
    ld   b, b
    cpl
    adc  a, d
    ld   d, b
    db   $3A ; ldd  a, [hl]
    adc  a, d
    ld   [hl], b
    cpl
    inc  d
    add  hl, bc
    ld   sp, label_27009
    dec  a
    call nz, label_3809
    ld   c, b

label_2495C::
    cpl
    ld   c, c
    ld   c, [hl]
    ld   e, b
    db   $3A ; ldd  a, [hl]
    ld   e, c
    dec  sp
    cp   $0B
    inc  bc
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    add  hl, bc
    dec  sp
    ld   [de], a
    add  hl, bc
    ld   l, b
    add  hl, bc
    adc  a, d
    ld   [hl], b
    cpl
    db   $10 ; Undefined instruction
    jp   nz, label_C812
    jp   label_C816
    jr   label_24944
    inc  h
    ret  z
    jp   nz, label_C829
    ld   sp, $C2C8
    ld   b, b
    ret  z
    ld   b, e
    ret  z
    ld   b, l
    ret  z
    ld   c, b
    ret  z
    jp   nz, label_C859
    ld   h, h
    ret  z
    ld   h, a
    ret  z
    dec  b
    cp   d
    pop  hl
    rra
    cp   $70
    ld   a, h
    cp   $0B
    inc  bc
    jp   nz, label_3700
    ld   [bc], a
    ld   a, $87
    inc  bc
    db   $3A ; ldd  a, [hl]
    ld   [de], a
    add  hl, sp
    add  a, a
    inc  de
    db   $3A ; ldd  a, [hl]
    jr   nz, label_249DA
    ld   hl, label_303C
    add  hl, sp
    ld   sp, $882E
    ldd  [hl], a
    cpl
    inc  sp
    ld   c, b
    dec  [hl]
    ld   c, c
    ld   b, b
    add  hl, bc
    ld   b, c
    add  hl, sp
    adc  a, b
    ld   b, d
    db   $3A ; ldd  a, [hl]
    jp   nz, label_E034
    ld   d, b
    ret  z
    ld   h, c
    ret  z
    ld   h, l
    add  hl, bc
    ld   h, [hl]
    dec  a
    add  a, e
    ld   h, a
    cpl
    add  a, a
    ld   [hl], b
    cpl
    db   $76 ; Halt
    ld   c, [hl]
    add  a, e
    ld   [hl], a
    db   $3A ; ldd  a, [hl]
    cp   $0B
    inc  bc
    add  a, a

label_249DA::
    nop
    db   $3A ; ldd  a, [hl]
    rlca
    ccf
    jp   nz, label_3809
    add  a, a
    db   $10 ; Undefined instruction
    rla
    dec  sp

label_249E6::
    jr   label_249F1
    jp   nz, label_E004
    ld   hl, label_2609
    dec  a
    add  a, d
    daa

label_249F1::
    cpl
    add  hl, hl
    ld   c, [hl]
    add  a, [hl]
    jr   nc, label_24A26
    ld   [hl], $4E
    add  a, d
    scf
    db   $3A ; ldd  a, [hl]
    add  hl, sp
    dec  sp
    add  a, [hl]

label_249FF::
    ld   b, b
    db   $3A ; ldd  a, [hl]
    ld   b, [hl]
    dec  sp
    jr   c, label_249E6
    pop  hl
    ld   a, [bc]
    ld   [label_27C50], a
    jp   nz, label_C849
    ld   e, b
    add  hl, bc
    adc  a, d
    ld   h, b
    cpl
    adc  a, d
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    ld   l, c
    inc  a
    ld   a, c
    ld   l, $FE
    dec  bc
    inc  bc
    nop
    dec  e
    ld   bc, $822E
    ld   [bc], a
    cpl
    inc  b
    ld   c, b
    ld   b, $49
    add  a, d
    rlca
    cpl
    add  hl, bc
    ld   c, [hl]
    jp   nz, label_3710
    jp   nz, label_3E11
    add  a, a
    ld   [de], a
    db   $3A ; ldd  a, [hl]
    add  a, a
    ldi  [hl], a
    db   $3A ; ldd  a, [hl]
    jp   nz, label_3F19
    jr   nc, label_24A6B
    add  a, e
    ld   sp, label_342F
    ld   c, b
    ld   [hl], $49
    add  a, e
    scf
    cpl
    ld   b, b
    add  hl, sp
    adc  a, c
    ld   b, c

label_24A4B::
    db   $3A ; ldd  a, [hl]
    push bc
    dec  b
    ld   [$FFC2], a
    ld   d, b
    ret  z
    ld   d, h
    call nc, label_957
    jp   nz, label_C859
    ld   h, c
    add  hl, bc
    adc  a, d
    ld   [hl], b
    cpl
    ld   [hl], h
    ld   c, b
    ld   [hl], l
    ld   [rUNKN6], a
    ld   c, c
    cp   $0B
    inc  bc
    nop
    ld   e, l
    ld   bc, $C21D
    ld   [bc], a
    ld   a, $C2
    inc  bc
    db   $3A ; ldd  a, [hl]
    jp   label_3A04
    jp   nz, label_3F05
    jp   nz, label_E006
    jp   nz, label_3707
    add  hl, bc
    add  hl, bc
    jp   nz, label_3810
    call nz, label_3711
    ldi  [hl], a
    add  hl, sp
    dec  h
    dec  sp
    dec  [hl]
    add  hl, bc
    daa
    ld   l, $82
    jr   z, label_24ABF
    jr   nc, label_24AE0
    ldd  [hl], a
    jr   nz, label_24AC9
    jr   nz, label_24ADA
    jr   nz, label_24AD0
    add  hl, sp
    jr   c, label_24AD6
    jp   nz, label_3839
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    ld   b, b
    dec  sp
    ld   d, c
    inc  sp
    add  a, d
    ld   d, d
    cpl
    ld   d, h
    ld   c, b
    ld   d, [hl]
    ld   c, c
    add  a, d
    ld   d, a
    cpl
    ld   e, c
    ld   c, [hl]
    add  a, [hl]
    ld   h, e
    db   $3A ; ldd  a, [hl]
    add  a, [hl]
    ld   [hl], e
    db   $3A ; ldd  a, [hl]
    jp   nz, label_3F69
    jp   label_E055
    ld   b, d
    add  hl, bc

label_24ABF::
    inc  hl
    pop  hl
    pop  hl
    ld   a, [bc]
    or   [hl]
    ld   d, b
    ld   a, h
    ld   h, d
    jr   c, label_24A4B

label_24AC9::
    ld   [hl], b
    cpl
    ld   [hl], d
    ld   c, [hl]
    ld   c, c
    db   $62
    ld   h, d

label_24AD0::
    db   $FE
    cp   $0B
    inc  bc
    jp   nz, label_3802
    add  a, d
    jr   nz, label_24B09

label_24ADA::
    ldi  [hl], a
    ld   c, [hl]
    call nz, label_3A30
    call nz, label_3A31
    call nz, label_3703
    ld   b, e
    inc  sp
    add  a, [hl]
    ld   b, h
    cpl
    inc  b
    add  hl, sp
    add  a, l
    dec  b
    db   $3A ; ldd  a, [hl]
    inc  d
    and  b
    jp   label_C817
    jr   label_24AFF
    ld   h, $09
    ldd  [hl], a
    scf
    jp   nz, label_3742
    ld   h, d
    ld   l, $85
    ld   h, e
    cpl
    add  a, l
    ld   [hl], e
    db   $3A ; ldd  a, [hl]
    add  a, a
    ld   d, e
    dec  de
    ld   l, b

label_24B09::
    inc  a
    ld   a, b
    ld   l, $79
    cpl
    ld   l, c
    dec  de
    ld   [hl], d
    ld   a, $06
    pop  hl
    pop  hl
    ld   a, [bc]
    cp   e
    ld   d, b
    ld   a, h
    ld   [$E1E1], sp
    ld   a, [bc]
    cp   h
    jr   nc, label_24B9C

label_24B20::
    ld   [hl], b
    push af
    cp   $0B
    inc  bc
    add  a, e
    nop
    db   $3A ; ldd  a, [hl]
    jp   label_3703
    ld   [label_2209], sp
    add  hl, bc
    dec  h
    add  hl, bc
    daa
    dec  a
    add  a, d
    jr   z, label_24B65
    inc  sp
    ld   l, $83
    inc  [hl]
    cpl
    scf
    ld   c, [hl]
    jr   c, label_24B20
    pop  hl
    ld   a, [bc]
    adc  a, c
    ld   b, b
    ld   a, h
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    ld   b, b
    cpl
    ld   b, c
    ld   c, b
    ld   b, d
    ld   [rSCX], a
    add  hl, sp
    add  a, e
    ld   b, h
    db   $3A ; ldd  a, [hl]
    ld   b, a
    dec  sp
    add  a, d
    ld   c, b
    dec  de
    adc  a, d
    ld   d, b
    dec  de
    ld   h, b
    dec  de
    ld   h, c
    dec  a
    adc  a, b
    ld   h, d
    cpl
    ld   [hl], b
    cpl
    ld   [hl], c
    ld   c, [hl]
    adc  a, b

label_24B65::
    ld   [hl], d
    db   $3A ; ldd  a, [hl]
    cp   $0B
    dec  de
    adc  a, d
    nop
    inc  bc
    adc  a, d
    db   $10 ; Undefined instruction
    jp   nz, label_3702
    inc  d
    dec  a
    add  a, e
    dec  d
    cpl
    jr   label_24BB6
    add  a, d
    jr   nz, label_24BAC
    ldi  [hl], a
    ld   l, $23
    cpl
    inc  h
    ld   c, [hl]
    add  a, e
    dec  h
    pop  hl
    jr   z, label_24BB6
    add  hl, hl
    cpl
    add  a, d
    jr   nc, label_24BC7
    ldd  [hl], a
    ld   a, $C2
    inc  sp
    db   $3A ; ldd  a, [hl]
    inc  [hl]
    ccf
    add  a, e
    dec  [hl]
    jp   [hl]
    jr   c, label_24BD7
    jp   nz, label_3A39

label_24B9C::
    ld   b, d
    add  hl, sp
    ld   b, h
    dec  sp
    add  a, e
    ld   b, l
    jp   [hl]
    ld   c, b
    add  hl, sp
    add  a, e
    ld   h, b
    cpl
    ld   h, e
    inc  a
    add  a, e
    ld   [hl], b

label_24BAC::
    db   $3A ; ldd  a, [hl]
    ld   [hl], e
    ld   l, $86
    ld   [hl], h
    cpl
    cp   $0B
    dec  de
    add  a, a

label_24BB6::
    nop
    inc  bc
    add  a, a
    db   $10 ; Undefined instruction
    jr   nz, label_24BEC
    ld   hl, label_114E
    dec  a
    ld   [de], a
    cpl
    inc  de
    inc  a
    inc  hl
    ld   l, $83
    inc  h
    cpl
    daa
    ld   c, [hl]
    jp   nz, label_3807
    add  a, d
    ld   [label_2250], sp
    pop  hl
    jp   nz, label_3A30

label_24BD7::
    ld   sp, $C23F
    ldd  [hl], a
    jp   [hl]
    inc  sp
    ld   a, $83
    inc  [hl]
    db   $3A ; ldd  a, [hl]
    ld   [hl], $E1
    scf
    ccf
    ld   b, c
    dec  sp
    ld   b, e
    add  hl, sp
    add  a, e
    ld   b, h
    db   $3A ; ldd  a, [hl]

label_24BEC::
    ld   b, [hl]
    jp   [hl]
    ld   b, a
    dec  sp
    add  a, a
    ld   d, c
    ld   c, $68
    ld   c, $8A
    ld   [hl], b
    cpl
    ld   h, c
    dec  a
    ld   h, d
    ld   c, b
    add  a, e
    ld   h, e
    jp   [hl]
    ld   h, [hl]
    ld   c, c
    ld   h, a
    inc  a
    ld   [hl], c
    ld   c, [hl]
    ld   [hl], d
    db   $3A ; ldd  a, [hl]
    add  a, e
    ld   [hl], e
    jp   [hl]
    db   $76 ; Halt
    db   $3A ; ldd  a, [hl]
    ld   [hl], a
    ld   l, $FE
    dec  bc
    inc  bc
    add  a, d
    jr   label_24C2F
    add  hl, hl
    dec  de
    ld   e, c
    dec  de
    jp   nz, label_1B50
    add  a, a
    nop
    inc  bc
    add  a, a
    db   $10 ; Undefined instruction
    jr   nz, label_24C52
    ld   hl, label_114E
    dec  a
    ld   [de], a
    cpl
    inc  de
    inc  a
    inc  hl
    ld   l, $83
    inc  h

label_24C2F::
    cpl
    daa
    ld   c, [hl]
    jp   nz, label_3807
    add  a, d
    ld   [label_2250], sp
    pop  hl
    jp   nz, label_3A30
    ld   sp, label_323F
    db   $3A ; ldd  a, [hl]
    inc  sp
    ld   a, $83
    inc  [hl]
    db   $3A ; ldd  a, [hl]
    ld   [hl], $E1
    scf
    ccf
    ld   b, c
    dec  sp
    ld   b, e
    add  hl, sp
    add  a, e
    ld   b, h
    db   $3A ; ldd  a, [hl]
    ld   b, a

label_24C52::
    dec  sp
    adc  a, d
    ld   [hl], b
    cpl
    ld   h, c
    dec  a
    ld   h, d
    ld   c, b
    ld   h, [hl]
    ld   c, c
    ld   h, a
    inc  a
    ld   [hl], c
    ld   c, [hl]
    add  a, e
    ld   h, e
    ld   c, d
    add  a, l
    ld   [hl], d
    db   $3A ; ldd  a, [hl]
    ld   [hl], a
    ld   l, $52
    add  hl, bc
    add  a, d
    ld   d, l
    add  hl, bc
    ld   l, b
    add  hl, bc
    cp   $0B
    ld   c, $00
    ld   d, b
    call nz, label_3E01
    push bc
    ld   [bc], a
    db   $3A ; ldd  a, [hl]
    call nz, label_3F04
    jp   label_3E05
    call nz, label_E906
    call nz, label_3A07
    jp   label_3F08
    jp   nz, label_3F09
    call nz, label_E913
    ld   b, c
    add  hl, sp
    ld   b, h
    dec  sp
    dec  [hl]
    add  hl, sp
    jr   c, label_24CD2
    adc  a, d
    ld   h, b
    cpl
    adc  a, d
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    add  hl, hl
    dec  sp
    ld   h, c
    dec  a
    ld   [hl], b
    cpl
    ld   [hl], c
    ld   c, [hl]
    add  a, $10
    dec  de
    ld   d, c
    dec  de
    ld   c, b
    dec  de
    jp   label_1B39
    jp   nz, label_E963
    jp   nz, label_E965
    jp   nz, label_E967
    push bc
    inc  bc
    ld   [$FFFE], a
    dec  bc
    inc  bc
    nop
    scf
    add  a, e
    ld   bc, label_403
    ldd  [hl], a
    dec  b
    inc  l
    ld   b, $2D
    call nz, label_3A07
    call nz, label_3F08
    jp   nz, label_E509

label_24CD2::
    db   $10 ; Undefined instruction
    ld   de, label_122F
    inc  a
    dec  d
    and  b
    jp   nz, label_3816
    jr   nz, label_24D18
    ld   hl, $E1E1
    ld   a, [bc]
    ld   sp, hl
    jr   nz, label_24D62
    ldi  [hl], a
    scf
    add  hl, hl
    ld   d, b
    jp   label_1B30
    jp   label_1B31
    ldd  [hl], a
    ld   l, $83
    inc  sp
    cpl
    ld   [hl], $4E
    ld   b, d
    ld   a, $83
    ld   b, e
    db   $3A ; ldd  a, [hl]
    add  a, e
    ld   d, e
    db   $3A ; ldd  a, [hl]

label_24CFF::
    ld   b, [hl]
    ccf
    ld   b, a
    pop  hl
    pop  hl
    ld   a, [bc]
    ld   a, [label_27C70]
    ld   c, b
    dec  sp
    ld   d, d
    add  hl, sp
    ld   d, [hl]
    dec  sp
    adc  a, d
    ld   h, b
    cpl
    adc  a, d
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    cp   $0B
    inc  bc
    jp   nz, label_3E00
    jr   nz, label_24D55
    jp   label_3E01
    ld   sp, $8839
    ld   [bc], a
    db   $3A ; ldd  a, [hl]
    ld   [de], a
    scf
    ldi  [hl], a
    ld   l, $32
    ld   a, $42
    add  hl, sp
    inc  bc
    pop  hl
    pop  hl
    ld   a, [bc]
    add  a, b
    jr   nz, label_24DAF
    inc  de
    inc  bc
    jp   label_E023
    inc  d
    jr   c, label_24D5F
    ld   c, [hl]
    inc  [hl]
    ccf
    ld   b, h
    dec  sp
    ld   d, $37
    ld   h, $2E
    ld   [hl], $3E
    ld   b, [hl]
    add  hl, sp
    add  a, e
    daa
    cpl
    add  a, e
    rla
    inc  bc
    rlca
    pop  hl
    pop  hl
    ld   a, [bc]
    add  a, e
    add  a, b
    ld   a, h

label_24D55::
    scf
    scf
    ld   b, a
    ld   l, $57
    add  hl, sp
    add  a, d
    ld   c, b
    cpl
    add  a, d

label_24D5F::
    ld   e, b
    db   $3A ; ldd  a, [hl]
    add  hl, sp

label_24D62::
    inc  bc
    adc  a, d
    ld   h, b

label_24D65::
    cpl
    adc  a, d
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    jp   label_3A15
    ld   b, l
    pop  hl
    pop  hl
    rra
    ld   a, [$FF00+C]
    ld   b, b
    ld   b, l
    db   $E8 ; add  sp, d
    ld   d, $DE
    scf
    sbc  a, $12
    sbc  a, $14
    db   $41
    ld   b, c
    ld   l, a
    cp   $0B
    inc  bc
    ret  z
    add  hl, bc
    push hl
    add  a, [hl]
    nop
    db   $3A ; ldd  a, [hl]
    ld   [bc], a
    pop  hl
    pop  hl
    ld   a, [bc]
    add  a, d
    ld   [hl], b
    ld   a, h
    jp   label_3F06
    rlca
    pop  hl
    pop  hl
    ld   a, [bc]
    adc  a, h
    ld   h, b
    ld   a, h
    ld   [$843F], sp
    db   $10 ; Undefined instruction
    ld   de, label_1409
    jr   c, label_24D65
    dec  d
    db   $3A ; ldd  a, [hl]
    push bc
    jr   label_24DE0
    add  a, h
    jr   nz, label_24DDA
    jr   nz, label_24DF5
    ld   hl, label_22E0
    ld   c, c
    inc  h
    ld   c, [hl]
    add  a, d
    jr   nc, label_24DB9
    ldd  [hl], a
    jr   c, label_24D7B

label_24DB9::
    inc  sp
    db   $3A ; ldd  a, [hl]
    inc  [hl]
    ccf
    dec  [hl]
    pop  hl
    pop  hl
    ld   a, [bc]
    add  a, a
    ld   h, b
    ld   a, h
    ld   [hl], $3B
    add  a, d
    ld   b, b
    cpl
    ld   b, d
    ld   c, [hl]
    ld   b, e
    cp   d
    pop  hl
    rra
    ei
    ld   d, b
    ld   a, h
    ld   b, h
    dec  sp
    add  a, d
    ld   d, b
    db   $3A ; ldd  a, [hl]
    ld   d, d
    dec  sp
    adc  a, b

label_24DDA::
    ld   h, b
    cpl
    ld   l, b
    ld   c, [hl]
    adc  a, b

label_24DDF::
    ld   [hl], b

label_24DE0::
    db   $3A ; ldd  a, [hl]
    ld   a, b
    ccf
    inc  d
    db   $32

label_24DE5::
    ldd  [hl], a
    db   $FE
    cp   $03
    inc  b
    jp   label_3700
    add  a, [hl]
    ld   bc, label_63A
    scf
    add  a, d
    rst  $30
    push af

label_24DF5::
    add  a, [hl]
    ld   de, label_163A
    ld   l, $83
    rla
    cpl
    ld   h, $39
    add  a, e
    daa
    db   $3A ; ldd  a, [hl]
    jr   z, label_24DE5
    pop  hl
    ld   de, label_250AE
    ld   a, h
    jr   nc, label_24E39
    ld   sp, label_2403C
    add  hl, sp
    call nz, label_3741
    ld   c, c
    dec  hl
    jp   label_E50
    ld   d, h
    jr   nz, label_24E71
    jr   nz, label_24DDF
    ld   e, c
    scf
    cp   $03
    inc  b
    rst  $38
    push af
    add  a, [hl]
    ld   bc, label_50A
    jr   c, label_24DAC
    ld   b, $3A
    add  a, e
    ld   d, $3A
    ret  z
    add  hl, bc
    scf
    add  a, l
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   c, b
    inc  d
    ld   c, c
    dec  d

label_24E39::
    ld   c, [hl]
    add  a, [hl]
    jr   nz, label_24E77
    ld   hl, $E1E1
    ld   de, label_250AF
    ld   a, h
    dec  h
    dec  sp
    add  a, d
    inc  [hl]
    ld   e, h
    ld   b, b
    dec  l
    call nz, label_A48
    jp   label_3850
    ld   d, d
    ld   e, h
    ld   d, [hl]
    ld   a, [bc]
    ld   d, a
    ld   e, h
    add  a, e
    ld   h, l
    ld   a, [bc]
    jp   nz, label_E013
    cp   $03
    dec  de
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    add  a, $21
    inc  b

label_24E69::
    add  a, e
    jr   nz, label_24E70
    push bc
    jr   nc, label_24E73
    inc  hl

label_24E70::
    ld   de, label_1332

label_24E73::
    inc  sp
    rla
    call nz, label_1142
    jp   label_3024
    jp   nz, label_3043
    ld   h, $30
    jp   label_25125
    add  hl, hl
    ld   d, c
    add  a, d
    ld   d, a
    ld   d, c
    ld   c, c
    ld   d, c
    ld   [hl], l
    ld   d, c
    add  a, d
    ld   a, b
    ld   d, c
    ret  z
    nop

label_24E91::
    jr   c, label_24E91
    inc  bc
    dec  de
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    jr   nz, label_24EEE
    add  a, d
    ld   hl, label_2730
    ld   d, c
    ld   sp, label_3430
    ld   d, c
    add  hl, sp
    ld   d, c
    add  a, e
    ld   b, b
    ld   d, c
    add  a, d
    ld   c, b
    ld   d, c
    ld   d, e
    ld   d, c
    jp   label_25159
    ld   h, [hl]
    ld   d, c
    ld   [hl], b
    ld   d, c
    ld   [hl], h
    ld   d, c
    db   $76 ; Halt
    ld   d, c
    cp   $03
    dec  de
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    add  a, [hl]
    db   $10 ; Undefined instruction
    ld   b, $3F
    ld   d, $3B
    inc  de
    pop  hl
    dec  h
    ld   [de], a
    dec  [hl]
    jr   label_24F05
    inc  d
    call nz, label_1246
    rst  0
    rla
    inc  b
    rst  0
    jr   label_24EDD
    rst  0
    add  hl, de
    inc  b
    jp   label_F537
    add  hl, hl
    push af
    ld   a, c
    push af
    push bc
    jr   nc, label_24F37
    add  a, d
    ld   [hl], c
    ld   d, c
    ld   [hl], l
    ld   d, c
    add  a, d
    ld   d, a
    inc  b

label_24EEE::
    add  a, d
    ld   h, a
    inc  b
    add  a, d
    ld   h, $20
    jp   nz, label_2057
    ld   [bc], a
    or   [hl]
    inc  bc
    rst  $10
    inc  b
    or   [hl]
    ld   de, label_12B6
    or   a
    inc  d
    or   a
    dec  d
    or   [hl]

label_24F05::
    pop  hl
    ld   bc, label_25036
    ld   a, h
    cp   $03
    inc  b
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    add  a, d
    cpl
    push af
    jp   nz, label_2023
    dec  [hl]
    jr   nz, label_24F3D
    ld   [hl], $25
    cpl
    ld   h, $3C
    ld   [hl], $37

label_24F20::
    ld   b, [hl]
    ld   l, $47
    ld   c, b
    ld   c, b

label_24F25::
    ld   c, d
    ld   c, c
    ld   c, c
    ld   d, [hl]
    add  hl, sp
    add  a, e
    ld   d, a
    db   $3A ; ldd  a, [hl]
    ld   a, a
    push af
    ld   d, c
    ld   [hl], $C2
    ld   h, d
    scf
    ld   d, d
    inc  a
    inc  [hl]

label_24F37::
    call nc, label_3E09
    add  hl, de
    add  hl, sp
    cp   $03
    inc  b
    add  a, d
    ld   b, b
    cpl
    add  a, d
    ld   d, b
    db   $3A ; ldd  a, [hl]
    add  a, a
    inc  sp
    cpl
    add  a, a
    ld   b, e
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    dec  a
    ld   b, d

label_24F4E::
    ld   c, [hl]
    ld   d, d
    dec  sp
    inc  [hl]
    ld   c, b
    dec  [hl]
    ld   c, d
    ld   [hl], $49
    ld   [bc], a
    add  hl, bc
    rla
    add  hl, bc
    ld   [hl], l
    dec  a
    ld   h, [hl]
    dec  a
    ld   h, a
    dec  [hl]
    db   $76 ; Halt
    ld   c, [hl]
    daa
    add  hl, bc
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    jp   nz, label_E005
    cp   $0B
    inc  b
    add  a, [hl]
    jr   nc, label_24FA3
    ldd  [hl], a
    ld   c, b
    inc  sp
    ld   c, d
    inc  [hl]
    ld   c, c
    add  a, [hl]
    ld   b, b
    db   $3A ; ldd  a, [hl]
    call nz, label_3746
    add  a, d
    ld   d, d
    ld   a, [bc]
    ld   d, h
    ld   e, h
    ld   d, l
    ld   e, h
    ld   h, l
    ld   e, h
    rla
    add  hl, bc
    inc  h
    add  hl, bc
    jr   c, label_24F98
    ld   [hl], a
    add  hl, bc
    ld   bc, $8939
    nop
    db   $3A ; ldd  a, [hl]
    add  hl, bc
    dec  sp

label_24F98::
    dec  b
    ld   [rSC], a
    ccf
    add  a, d
    db   $10 ; Undefined instruction
    ld   [de], a
    dec  sp
    ld   [hl], $3C

label_24FA3::
    add  hl, hl
    dec  hl
    push bc
    add  hl, sp
    scf
    cp   $0B
    inc  b
    add  a, [hl]
    inc  bc
    db   $3A ; ldd  a, [hl]
    ld   [bc], a
    add  hl, sp
    add  a, h
    dec  d
    db   $3A ; ldd  a, [hl]
    add  a, h
    dec  h
    ld   c, $85
    dec  [hl]
    ld   c, $C3
    inc  d
    jr   c, label_25001
    ldd  [hl], a
    add  a, l
    ld   b, l
    inc  l
    ld   h, h
    dec  a
    add  a, e
    ld   h, l
    cpl
    ld   l, b
    inc  a
    ld   [hl], h
    jr   c, label_24F4E
    ld   [hl], l

label_24FCC::
    db   $3A ; ldd  a, [hl]
    ld   a, b
    ld   l, $79
    cpl
    jp   label_3A09
    jp   nz, label_3E08
    jr   z, label_25012
    ld   d, l
    jr   nz, label_24FCC
    push af
    jr   nz, label_2500C
    push bc
    jr   nc, label_2501A
    inc  d
    db   $FE
    cp   $0B
    inc  b
    jp   label_3A00
    jp   nz, label_3F01
    ld   hl, $883B
    ld   [bc], a
    db   $3A ; ldd  a, [hl]
    adc  a, b
    ld   [de], a
    db   $3A ; ldd  a, [hl]
    adc  a, b
    ldi  [hl], a
    ld   c, $8A
    jr   nc, label_25009
    ld   b, e
    ld   c, $82
    ld   b, b

label_24FFF::
    inc  l
    ld   b, d

label_25001::
    dec  l
    jp   nz, label_3852
    ld   [hl], b
    ld   c, b
    ld   [hl], c
    ld   [rUNKN2], a
    ld   c, [hl]
    ld   d, e

label_2500C::
    inc  l
    ld   d, h
    ld   sp, label_2B44
    add  a, l

label_25012::
    ld   b, l
    inc  l
    ld   [hl], e
    ld   a, [bc]
    ld   [hl], h
    dec  hl
    ld   [hl], l
    inc  l

label_2501A::
    db   $76 ; Halt
    dec  l
    ld   a, c
    dec  hl
    cp   $0B
    ld   c, $8A
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    add  a, [hl]
    inc  h
    db   $3A ; ldd  a, [hl]
    jp   nz, label_3E03
    inc  hl
    add  hl, sp
    ld   b, b
    inc  l
    ld   b, c
    dec  l
    ld   d, c
    ldd  [hl], a
    adc  a, b

label_25036::
    ld   d, d
    inc  l
    ld   d, b
    inc  b
    adc  a, d
    ld   h, b
    inc  b
    adc  a, d
    ld   [hl], b
    inc  b
    inc  d
    or   [hl]
    dec  d
    or   a
    rla
    or   [hl]
    jr   label_24FFF
    ld   h, $E1
    ld  [$FF00+C], a
    ld   a, [bc]
    db   $FD ; Undefined instruction
    dec  bc
    jr   nc, label_250C0
    inc  l
    ld   [hl], c
    dec  l
    ld   [hl], h
    dec  hl
    ld   [hl], l
    inc  l
    db   $76 ; Halt
    dec  l
    ld   a, c
    dec  hl
    cp   $0B
    ld   c, $8A
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_250A1
    jp   nz, label_3F01
    jp   nz, label_3E07
    ld   hl, label_273B

label_25070::
    add  hl, sp
    adc  a, d
    ld   d, b
    inc  l
    adc  a, d
    ld   h, b
    inc  b
    adc  a, d
    ld   [hl], b
    inc  b
    ld   d, h
    ld   d, h
    add  a, e
    inc  bc
    jp   [hl]
    add  a, e
    inc  de
    jp   [hl]
    add  a, l
    ldi  [hl], a
    ld   c, $70
    inc  l
    ld   [hl], c
    dec  l
    ld   [hl], d
    dec  hl
    ld   [hl], e
    inc  l
    ld   [hl], h
    dec  l
    ld   [hl], l
    dec  hl
    db   $76 ; Halt
    inc  l
    ld   [hl], a
    dec  l
    ld   a, b
    dec  hl
    ld   a, c
    inc  l
    cp   $0B
    ld   c, $8A
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_250DF
    jp   nz, label_3F01
    jp   nz, label_3E07
    ld   hl, label_273B

label_250AE::
    add  hl, sp

label_250AF::
    adc  a, d
    ld   d, b
    inc  l
    adc  a, d

label_250B3::
    ld   h, b
    inc  b
    adc  a, d
    ld   [hl], b
    inc  b
    ld   d, h
    ld   d, h
    inc  bc
    push de
    inc  b
    sub  a, $05
    rst  $10

label_250C0::
    add  a, l
    ldi  [hl], a
    inc  bc

label_250C3::
    add  a, e
    inc  [hl]
    inc  bc
    inc  hl
    add  hl, bc
    dec  h
    add  hl, bc
    ld   [hl], $09
    add  a, d
    ldd  [hl], a
    dec  de
    add  a, h
    ld   b, e
    dec  de
    inc  de
    call label_E114
    dec  d
    adc  a, $E1
    inc  bc
    ld   a, d
    ld   d, b
    ld   a, h
    ld   [hl], b
    inc  l

label_250DF::
    ld   [hl], c
    dec  l
    ld   [hl], d
    dec  hl
    ld   [hl], e
    inc  l
    ld   [hl], h
    dec  l
    ld   [hl], l
    dec  hl
    db   $76 ; Halt
    inc  l
    ld   [hl], a
    dec  l
    ld   a, b
    dec  hl
    ld   a, c
    inc  l
    ld   h, $C6
    pop  hl
    rra
    jp   [hl]
    jr   z, label_25118
    cp   $0B
    inc  b
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    jp   nz, label_3F01

label_25104::
    ld   hl, $883B
    ldi  [hl], a
    ld   c, $8A
    jr   nc, label_2511A
    add  a, e
    ld   b, b
    ld   c, $43
    dec  hl
    add  a, [hl]

label_25112::
    ld   b, h
    inc  l
    add  a, e
    ld   d, b
    inc  l
    ld   d, e

label_25118::
    ld   sp, label_3A20
    dec  [hl]
    db   $FC ; Undefined instruction
    add  hl, sp
    db   $FC ; Undefined instruction
    ld   d, [hl]
    ld   [rSVBK], a
    dec  l
    ld   [hl], c
    db   $FC ; Undefined instruction

label_25125::
    ld   [hl], l
    db   $FC ; Undefined instruction
    ld   a, c
    dec  hl
    jp   nz, label_E903
    jp   nz, label_E905
    jp   nz, label_E907
    ld   l, c
    ld   a, [bc]
    cp   $0B
    inc  b
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_2514E
    adc  a, d
    jr   nc, label_25151

label_25143::
    adc  a, d
    ld   b, b
    inc  l
    jr   nc, label_25174
    ld   sp, label_2402D
    db   $E8 ; add  sp, d
    ld   b, c
    jr   c, label_2519F
    cpl
    ld   d, c

label_25151::
    inc  [hl]
    inc  [hl]
    db   $FC ; Undefined instruction
    add  a, d
    ld   h, b
    ld   a, [bc]
    add  a, e
    ld   h, h

label_25159::
    ld   a, [bc]
    ld   [hl], b
    inc  l
    ld   [hl], c
    dec  l
    ld   [hl], h
    db   $FC ; Undefined instruction
    ld   b, l
    add  a, $55
    ld   [$FFE1], a
    rra
    ld   [label_27088], a
    jr   c, label_25196
    add  hl, sp
    inc  l
    ld   c, b
    ld   sp, label_449
    cp   $03
    inc  b

label_25174::
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_2518B
    adc  a, d
    jr   nc, label_251AC
    push bc
    inc  [hl]
    ld   c, $C5
    dec  [hl]
    ld   c, $33
    dec  l
    ld   [hl], $2B
    ld   b, e

label_2518B::
    ld   a, [$FF00+C]
    ld   [label_26E51], a
    jp   nz, label_F353
    jp   nz, label_F056

label_25196::
    ld   l, b
    ld   l, [hl]
    ld   l, c
    push af
    ld   [hl], e
    db   $F4 ; Undefined instruction
    db   $76 ; Halt
    pop  af
    ld   [hl], l

label_2519F::
    jp   z, label_E115
    pop  hl
    rra
    ld   a, [$FF00+C]
    ld   a, h
    cp   $03
    inc  b
    adc  a, b
    nop

label_251AC::
    db   $3A ; ldd  a, [hl]
    ld   [label_93F], sp
    dec  l
    adc  a, b
    db   $10 ; Undefined instruction
    rst  0
    jr   label_251C5
    rst  0
    add  hl, de
    jr   c, label_25143
    jr   nz, label_251CB
    jp   nz, label_E36
    push bc
    scf
    ld   c, $85
    jr   nc, label_251F2
    dec  [hl]
    dec  l
    ld   b, l
    jr   c, label_25220

label_251CB::
    ldd  [hl], a
    ld   d, [hl]
    dec  l
    jp   nz, label_3866
    ld   l, a
    push af
    add  a, d
    ld   [hl], b
    push af
    jr   label_25213
    ld   d, a
    jp   z, label_CA68
    ld   h, c
    add  a, $E1
    rra
    rst  $20
    ld   c, b
    db   $10 ; Undefined instruction
    inc  bc
    inc  b
    jp   nz, label_E00
    jp   nz, label_3701
    push bc
    jr   nc, label_25226
    add  a, e
    ld   b, [hl]
    db   $E8 ; add  sp, d

label_251F2::
    add  a, d
    ld   d, l
    db   $E8 ; add  sp, d
    jp   nz, label_F551
    ld   h, d
    push af
    ld   l, b
    push af
    ld   a, c
    push af
    inc  [hl]
    db   $E8 ; add  sp, d
    ld   d, h
    call nc, label_3121
    jr   nz, label_25231
    ld   [de], a
    ld   b, h
    dec  h
    ld   b, h
    ld   b, c
    ld   b, h
    call nz, label_3709
    add  hl, sp
    ld   l, $49
    add  hl, sp

label_25213::
    dec  h
    ld   a, [bc]
    add  a, e
    ld   [hl], $0A
    ld   d, $FD
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h

label_2521F::
    cp   $03
    inc  b
    ld   h, b
    push af
    ld   l, b
    push af

label_25226::
    add  a, [hl]
    ld   a, a
    push af
    jp   nz, label_A49
    add  a, [hl]
    ld   b, e
    ld   a, [bc]
    add  a, d
    ld   d, l

label_25231::
    ld   a, [bc]
    ld   [label_220A], sp
    ld   b, h
    call nz, label_3800
    jr   nc, label_25289
    ld   b, b
    dec  sp
    jp   nz, label_3709
    add  hl, hl
    ld   l, $39
    add  hl, sp
    inc  hl
    push af
    daa
    push af
    add  a, d
    ld   sp, label_35E8
    push af
    ld   [hl], $F5
    ld   [hl], $45
    ld   b, [hl]
    pop  hl
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    cp   $03
    inc  b
    jp   label_1102
    ldd  [hl], a
    dec  d
    inc  sp
    db   $10 ; Undefined instruction
    add  hl, de

label_25264::
    jp   nz, label_1144
    add  a, a
    inc  bc
    dec  de
    add  a, a
    inc  de
    dec  de
    add  a, a
    inc  hl
    dec  de
    add  a, l
    dec  [hl]
    dec  de
    add  a, l
    ld   b, l
    dec  de
    add  a, l
    ld   d, l
    dec  de
    add  a, d
    ld   l, b
    dec  de
    ld   d, h
    dec  d
    ld   d, l
    db   $10 ; Undefined instruction
    add  hl, de
    ld   h, a
    dec  de
    add  a, e
    ld   [hl], a
    dec  de
    add  a, h
    ld   h, b

label_25289::
    push af
    add  a, [hl]
    ld   a, a
    push af
    jp   nz, label_3013
    jp   nz, label_25105
    add  hl, de
    ld   d, c
    inc  h
    jr   nc, label_252BE
    ld   d, c
    add  a, d
    ld   b, l
    jr   nc, label_2521F
    ld   c, b
    ld   d, c
    ld   d, a
    jr   nc, label_25264
    ld   e, b
    ld   d, c
    add  a, d
    ld   [label_1151], sp
    ld   b, h
    inc  sp
    call nc, label_C2
    jr   c, label_252CF
    ld   c, [hl]
    jr   nc, label_252ED
    jp   nz, label_A40
    ld   d, c
    ld   a, [bc]
    ld   d, e
    ld   b, h
    scf
    ld   d, c
    cp   $03
    dec  de

label_252BE::
    add  a, h
    ld   [hl], b
    dec  de
    add  a, [hl]
    ld   a, a
    push af
    jp   nz, label_25100
    jp   label_25104
    call nz, label_25106
    jp   nz, label_25109
    inc  sp
    ld   d, c
    add  a, e
    ld   b, b
    ld   d, c
    add  a, e
    ld   b, a
    ld   d, c
    ld   d, e
    ld   d, c
    add  a, d
    ld   h, c
    jr   nc, label_25343
    ld   d, c
    add  a, d
    ld   h, a

label_252E1::
    jr   nc, label_252E1
    inc  bc
    inc  b
    add  a, [hl]
    nop
    dec  de
    add  a, [hl]
    db   $10 ; Undefined instruction
    add  a, h
    jr   nz, label_25309
    add  a, e
    jr   nc, label_2530C
    add  a, e
    ld   b, b
    dec  de
    add  a, e
    ld   d, b
    dec  de
    add  a, e
    ld   h, b
    dec  de
    add  a, e
    ld   [hl], b
    dec  de
    add  a, e
    nop

label_252FF::
    ld   d, c
    dec  b
    ld   d, c
    jp   nz, label_1206
    add  a, d
    rst  $30
    push af
    db   $10 ; Undefined instruction
    jp   nz, label_25112
    dec  d
    jr   nc, label_25329
    push af
    inc  h
    ld   a, [de]
    dec  h
    db   $10 ; Undefined instruction
    ld   d, $27
    push af
    ld   sp, label_3351
    ld   a, [de]
    inc  [hl]
    ld   d, $35
    push af
    add  a, d
    ld   b, b
    ld   d, c
    jp   nz, label_1243
    jp   nz, label_2044
    ld   d, d
    jr   nc, label_25386
    push af
    ld   h, c
    jr   nc, label_25393
    push af
    add  a, d
    ld   h, [hl]
    push af
    add  a, d
    ld   a, a
    push af
    add  a, d
    ld   [hl], a
    push af
    ld   de, $FEA0
    inc  bc
    inc  b
    ld   h, b
    push af
    push bc

label_25343::
    rst  $38
    push af
    ld   l, b
    push af
    add  a, l
    ld   [hl], c
    push af
    jp   label_3702
    ldd  [hl], a
    ld   l, $87
    inc  sp
    cpl
    ld   [hl], $48
    add  a, d
    scf
    ld   c, d
    add  hl, sp
    ld   c, c
    ld   b, d
    add  hl, sp
    add  a, a
    ld   b, e
    db   $3A ; ldd  a, [hl]
    ld   b, l
    or   [hl]
    ld   b, [hl]
    pop  hl
    ld   b, a
    or   [hl]
    pop  hl
    dec  d
    ld   a, [$FF50]
    ld   a, h
    jp   nz, label_430
    add  a, e
    inc  bc
    rrca
    ld   b, $14
    add  a, d
    inc  de
    dec  de
    dec  d
    jr   nc, label_2538D
    ld   [de], a
    add  a, d
    inc  hl
    dec  de
    dec  h
    ld   a, [de]
    ld   h, $16
    ld   d, e
    ld   l, a
    cp   $03

label_25383::
    inc  b
    jr   nc, label_253B5

label_25386::
    ld   b, b
    db   $3A ; ldd  a, [hl]
    add  a, e
    ldi  [hl], a
    db   $3A ; ldd  a, [hl]
    ld   de, label_123D
    ld   c, b
    inc  de
    ld   c, d
    inc  d
    ld   c, c

label_25393::
    dec  d
    ld   c, [hl]
    dec  b
    jr   c, label_253BD
    dec  sp
    ld   b, $3B
    add  a, d
    ldd  [hl], a
    ld   a, [bc]
    ld   b, d
    ld   a, [bc]
    ld   d, $0A
    ld   b, [hl]
    db   $E8 ; add  sp, d
    ld   h, h
    db   $E8 ; add  sp, d
    jp   nz, label_F559
    ld   l, b
    push af
    ld   [hl], a
    push af
    ld   sp, label_2414E
    dec  sp
    ld   h, b
    push af
    ld   a, a
    push af

label_253B5::
    inc  h
    db   $3A ; ldd  a, [hl]
    ld   hl, label_24338
    call nc, label_BFE

label_253BD::
    inc  b
    add  a, [hl]
    ld   a, a
    push af
    ld   e, a
    push af
    jp   nz, label_3706
    jp   nz, label_3737
    ld   h, $2E
    ld   [hl], $39
    daa
    inc  a
    ld   d, a
    ld   l, $67
    add  hl, sp
    add  a, d
    ld   e, b
    cpl
    add  a, d
    ld   l, b
    db   $3A ; ldd  a, [hl]
    add  hl, bc
    add  hl, bc
    jr   z, label_253E6
    add  hl, bc
    scf
    add  hl, de
    ld   l, $29
    add  hl, sp
    inc  de
    rst  $30
    inc  d

label_253E6::
    ld   h, c
    inc  hl

label_253E8::
    ld   b, b
    inc  h
    ld   h, b
    dec  h
    ld   b, d
    ld   b, h
    inc  c
    jp   nz, label_26222
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    cp   $0B
    inc  b
    jp   nz, label_3804
    add  a, e
    dec  b

label_253FF::
    db   $3A ; ldd  a, [hl]
    ld   [$C23E], sp
    add  hl, bc
    db   $3A ; ldd  a, [hl]
    dec  d
    db   $3A ; ldd  a, [hl]
    jr   label_25442
    inc  hl
    dec  a
    inc  h

label_2540C::
    ld   c, [hl]
    jp   nz, label_3833
    ld   d, e
    ld   c, [hl]
    add  a, e
    ld   d, b
    cpl
    add  a, e
    ld   h, b
    db   $3A ; ldd  a, [hl]
    inc  [hl]
    ccf
    ld   b, h
    dec  sp
    ld   h, e
    ccf
    ld   [hl], e
    ccf

label_25420::
    ld   a, a
    push af
    ld   [hl], d
    jr   c, label_253E8
    ld   d, $37
    ld   b, [hl]
    inc  sp
    ld   b, a
    inc  a
    ld   d, a
    inc  sp
    add  a, d
    ld   e, b
    cpl
    add  a, d
    jr   z, label_2543D
    jp   label_E25
    add  a, e
    ld   d, h
    ld   c, $86
    ld   h, h
    ld   c, $74

label_2543D::
    ld   c, $75
    dec  hl
    add  a, h
    db   $76 ; Halt

label_25442::
    inc  l
    nop
    jr   c, label_25456
    ld   c, [hl]
    jr   nz, label_25484
    ld   d, $DE
    ld   [hl], d
    db   $FE
    cp   $0B
    inc  b
    add  a, d
    nop
    db   $3A ; ldd  a, [hl]
    add  a, d
    db   $10 ; Undefined instruction

label_25456::
    jp   nz, label_E001
    ld   [bc], a
    ccf
    ld   [de], a
    dec  sp
    add  a, h
    jr   nz, label_2546A
    inc  bc
    ld   a, [bc]
    ld   d, $F5
    adc  a, d
    ld   d, b
    cpl
    adc  a, d
    ld   h, b
    ld   c, $8A
    ld   [hl], b
    inc  l
    inc  b
    inc  sp
    dec  b
    cpl
    ld   b, $34
    add  a, d
    rlca
    ld   a, [bc]
    add  hl, bc
    inc  sp
    add  a, d
    inc  d
    ld   a, [bc]
    add  hl, de
    ld   a, [bc]
    cp   $0B
    inc  b
    dec  [hl]
    dec  a
    add  a, h
    ld   [hl], $2F
    ld   b, l
    jr   c, label_2540C
    ld   b, [hl]
    ld   c, $85
    ld   d, b
    cpl
    ld   d, l
    inc  [hl]
    add  a, d
    ld   d, [hl]
    ld   c, $58
    dec  hl
    ld   e, c
    inc  l
    adc  a, b
    ld   h, b
    ld   c, $68
    scf
    ld   l, c
    push af
    adc  a, b
    ld   [hl], b
    inc  l
    ld   a, b
    ld   sp, $008A
    ld   a, [bc]
    add  a, d
    db   $10 ; Undefined instruction
    add  a, e
    inc  d
    ld   a, [bc]
    add  hl, de
    ld   a, [bc]
    nop
    cpl
    ld   bc, label_434
    inc  sp
    dec  b
    cpl
    ld   b, $34
    add  hl, bc
    inc  sp
    cp   $0B
    inc  b
    add  a, [hl]
    jr   nc, label_254EE
    ld   [hl], $3C
    ld   b, [hl]
    inc  sp
    ld   b, a
    cpl
    ld   c, b
    inc  a
    jp   nz, label_3758
    ld   l, b
    ld   l, $69
    inc  a
    ld   a, c
    scf
    ld   a, b
    ld   a, $86
    ld   b, b
    ld   c, $88
    ld   d, b
    ld   c, $84
    ld   h, h
    ld   c, $77
    ld   c, $83
    ld   d, b
    inc  l
    ld   d, c
    ld   [rHDMA3], a
    dec  l
    ld   l, a
    push af
    ld   h, e
    jr   c, label_2555C
    ldd  [hl], a
    add  a, d
    ld   [hl], h
    inc  l
    db   $76 ; Halt

label_254EE::
    dec  l
    inc  sp
    ld   c, b
    inc  [hl]
    ld   [$FF35], a
    ld   c, c
    nop
    cpl
    ld   bc, label_234
    inc  sp
    inc  bc
    cpl
    inc  b
    inc  [hl]

label_254FF::
    dec  b
    inc  sp
    ld   b, $2F
    rlca
    inc  [hl]
    ld   [label_937], sp
    db   $E8 ; add  sp, d
    adc  a, b
    db   $10 ; Undefined instruction
    jr   label_25541
    add  hl, de
    cpl
    add  a, l
    dec  h
    ld   a, [bc]
    add  a, d
    scf
    ld   a, [bc]
    cp   $0A
    inc  b
    nop
    jr   c, label_2552C
    inc  [hl]
    ld   bc, label_237
    db   $E8 ; add  sp, d
    inc  bc
    jr   c, label_25535
    inc  sp
    ld   [de], a
    cpl
    inc  de
    inc  [hl]
    dec  b
    scf
    ld   b, $E8
    rlca
    jr   c, label_25545
    inc  sp
    ld   d, $2F
    rla
    inc  [hl]

label_25535::
    add  hl, bc
    scf
    add  hl, de
    inc  sp
    ld   b, c
    dec  a
    adc  a, b
    ld   b, d
    cpl
    ld   d, c
    jr   c, label_255A2

label_25541::
    ld   c, [hl]
    ld   h, b
    dec  a
    ld   [hl], b

label_25545::
    jr   c, label_255B8
    ccf
    ld   d, d
    ld   c, $87
    ld   d, e
    ld   c, $83
    ld   h, a
    ld   c, $83
    ld   h, d
    jp   [hl]
    add  a, e
    ld   [hl], d
    jp   [hl]
    ld   h, l
    ld   c, c
    ld   h, [hl]
    inc  a
    ld   [hl], l
    db   $3A ; ldd  a, [hl]

label_2555C::
    db   $76 ; Halt
    ld   l, $83
    ld   [hl], a
    cpl
    add  a, h
    jr   nz, label_2556E
    inc  d
    ld   a, [bc]
    add  a, e
    dec  h
    ld   a, [bc]
    jr   label_25575
    add  hl, hl
    ld   a, [bc]
    cp   $0A
    inc  b
    nop
    db   $E8 ; add  sp, d
    ld   bc, label_1038

label_25575::
    cpl
    ld   de, label_434
    scf
    dec  b
    db   $E8 ; add  sp, d
    ld   b, $38
    inc  d
    inc  sp
    dec  d
    cpl
    ld   d, $34
    adc  a, d
    ld   b, b
    cpl
    adc  a, d
    ld   d, b
    ld   c, $60
    ld   c, $70
    cpl
    ld   [hl], c
    ld   c, [hl]
    ld   h, c
    dec  a
    ld   h, d
    ld   c, b
    ld   [hl], d
    db   $3A ; ldd  a, [hl]
    add  a, d
    ld   h, e
    jp   [hl]
    add  a, d
    ld   [hl], e
    jp   [hl]
    ld   h, l
    ld   c, c
    add  a, h
    ld   h, [hl]
    cpl
    add  a, l

label_255A2::
    ld   [hl], l
    db   $3A ; ldd  a, [hl]
    add  a, d
    jr   nz, label_255B1
    add  a, e
    inc  h
    ld   a, [bc]
    cp   $0B
    inc  b
    jp   nz, label_3803
    call nz, label_E04
    dec  b
    dec  hl
    ld   b, $31
    jp   nz, label_F509
    jp   label_3715
    ld   hl, label_223D
    ld   [rNR44], a
    inc  [hl]
    ld   sp, $8338
    ldd  [hl], a
    ld   c, $40
    cpl

label_255CA::
    ld   b, c
    inc  [hl]
    add  a, e
    ld   b, d
    jp   z, label_3345
    add  a, h
    ld   b, [hl]
    cpl
    adc  a, d
    ld   d, b
    ld   c, $8A
    ld   h, b
    cpl
    adc  a, d
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    cp   $03
    inc  b
    jp   nz, label_F50F
    ld   bc, $82FD
    ld   hl, label_140A
    ld   a, [bc]
    jp   nz, label_3806
    dec  h
    dec  a
    ld   h, $34
    dec  [hl]
    jr   c, label_25639
    inc  [hl]
    add  a, h
    ld   b, b
    cpl
    ld   b, h
    ld   [$FF89], a
    ld   h, b
    cpl
    adc  a, c
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    ret  z
    add  hl, bc
    jr   c, label_255CA
    rlca
    ld   c, $C3
    ld   [hl], $0E
    add  a, [hl]
    ld   d, b
    ld   c, $C6
    ld   [label_230E], sp
    call nc, label_24E69
    ld   a, c
    ccf
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    ld   bc, label_2B6
    or   a
    inc  bc
    ld   h, [hl]
    cp   $03
    inc  b
    ret  z
    nop
    scf
    call nz, label_9001
    call nz, label_9002
    ld   b, c
    adc  a, b
    jp   label_8751
    inc  bc
    adc  a, [hl]
    jp   nz, label_8713
    inc  sp
    adc  a, d
    add  a, [hl]

label_25639::
    inc  [hl]
    add  a, l
    adc  a, b
    ld   b, d
    add  a, h
    jp   nz, label_F5F1
    inc  d
    ld   [label_827], sp
    ld   d, d
    ld   [label_25383], sp
    ld   e, h
    ld   [hl], l
    ld   a, [bc]
    db   $76 ; Halt
    adc  a, a
    add  a, e
    ld   [hl], a
    add  a, l
    ld   [label_98F], sp
    sub  a, b
    jr   label_255E4
    add  hl, de
    add  a, h
    ld   sp, hl
    push af
    dec  [hl]
    adc  a, [hl]
    ld   [hl], $04
    scf
    adc  a, a
    ld   b, l
    adc  a, h
    ld   b, [hl]
    db   $E8 ; add  sp, d
    ld   b, a
    adc  a, l
    jr   z, label_256AD
    ld   [hl], d
    ld   b, h
    cp   $03
    inc  b
    adc  a, d
    nop
    sub  a, b
    add  a, [hl]
    rst  $38
    push af
    adc  a, d
    db   $10 ; Undefined instruction
    ld   d, $89
    rla
    adc  a, b
    ld   h, $86
    daa
    add  a, a
    ld   [hl], $8D
    scf
    adc  a, h
    jp   nz, label_E847
    add  a, d
    jr   nc, label_2560E
    ldd  [hl], a
    adc  a, [hl]
    ld   b, b
    add  a, h
    ld   b, c
    adc  a, c
    call nz, label_8742
    jp   nz, label_8651
    ld   [hl], b
    add  a, l
    ld   [hl], c
    adc  a, e
    ld   e, b
    adc  a, a
    ld   e, c
    add  a, l
    ld   h, a
    adc  a, a
    ld   [hl], a
    add  a, [hl]
    add  a, d
    ld   l, b
    sub  a, b
    add  a, d
    ld   a, b
    sub  a, b
    ld   l, b
    push af
    ld   a, c
    push af
    add  a, e
    inc  sp

label_256AD::
    ld   e, h
    ld   b, h
    ld   e, h
    inc  [hl]
    and  b
    jr   z, label_256BC
    jp   nz, label_A66
    ld   h, l
    ld   [label_24438], sp
    ld   [hl], e

label_256BC::
    ld   b, h
    cp   $03
    inc  b
    adc  a, d
    nop
    sub  a, b
    add  a, [hl]
    rst  $38
    push af
    adc  a, d

label_256C7::
    db   $10 ; Undefined instruction
    ld   de, label_2189
    add  a, [hl]
    ld   sp, label_328D
    adc  a, h
    ldi  [hl], a
    add  a, a

label_256D3::
    ld   [de], a
    adc  a, b
    inc  de
    sub  a, d
    inc  d
    adc  a, c
    inc  h
    add  a, [hl]
    inc  [hl]
    adc  a, l
    dec  [hl]
    add  a, h
    inc  hl
    db   $E4 ; Undefined instruction
    ld   [hl], $8C
    ld   h, $87
    ld   d, $88
    ld   d, b
    adc  a, [hl]
    ld   h, b
    adc  a, d
    ld   h, c
    adc  a, [hl]
    ld   [hl], b
    sub  a, b
    ld   [hl], c
    add  a, a
    ld   c, b
    adc  a, a
    ld   c, c
    add  a, l

label_256F5::
    ld   e, b
    add  a, [hl]
    ld   l, b

label_256F8::
    adc  a, e
    ld   h, [hl]
    adc  a, a
    ld   h, a
    add  a, l
    db   $76 ; Halt
    add  a, [hl]
    add  a, e
    ld   [hl], a
    sub  a, b
    jp   nz, label_9059
    jp   nz, label_A20
    ld   b, c
    ld   a, [bc]
    ld   b, d
    jr   nz, label_25751
    jr   nz, label_25762
    jr   nz, label_256D3
    ld   b, a
    ld   a, [bc]
    jp   nz, label_A65
    ld   d, c
    ld   [label_15C2], sp
    sub  a, b
    ld   e, c
    push af
    add  a, d
    ld   [hl], a
    push af

label_25720::
    ld   a, a
    push af
    inc  sp
    db   $E3 ; Undefined instruction
    pop  hl
    ld   de, label_250B3
    ld   a, h
    ld   d, [hl]
    ld   b, h
    ld   h, h
    ld   b, h
    cp   $03
    inc  b
    adc  a, d
    nop
    sub  a, b
    add  a, l
    rst  $38
    push af
    adc  a, d
    db   $10 ; Undefined instruction
    jr   z, label_256C7
    ld   b, b
    add  a, l
    ld   b, c
    adc  a, [hl]
    ld   d, c
    add  a, a
    ld   h, c
    adc  a, d
    add  a, [hl]
    ld   h, d
    add  a, l
    adc  a, b
    ld   [hl], b
    sub  a, b
    add  a, [hl]
    ld   a, a
    push af
    ld   h, a
    adc  a, [hl]
    jp   nz, label_9050

label_25751::
    ld   e, a
    push af
    add  a, [hl]
    ld   d, d
    ld   a, [bc]
    ld   l, b
    ld   a, [bc]
    ldd  [hl], a
    ld   [label_848], sp
    ld   l, c
    ld   [$8917], sp
    daa
    adc  a, l

label_25762::
    add  a, d
    jr   label_256F5
    add  a, d
    jr   z, label_256F8
    jp   nz, label_F508
    add  hl, de
    push af
    inc  sp
    ld   b, h
    ld   b, [hl]
    ld   b, h
    cp   $03
    inc  b
    add  a, d
    rst  $38
    push af
    add  a, d
    rst  $30
    push af
    add  a, l
    nop
    push af
    add  a, d
    inc  b
    inc  b
    add  a, d
    inc  d
    inc  b
    add  a, d
    rra
    push af
    ld   a, a
    push af
    jp   nz, label_F559
    add  a, e
    inc  hl
    db   $E8 ; add  sp, d
    add  a, e
    ld   h, e
    db   $E8 ; add  sp, d
    jp   label_E832
    jp   label_E836
    add  a, e
    inc  sp
    ld   a, [bc]
    add  a, e
    ld   b, e
    ld   a, [bc]
    add  a, e
    ld   d, e
    ld   a, [bc]
    add  a, d
    ld   d, b
    dec  bc
    add  a, d
    ld   h, c
    dec  bc
    ld   [hl], d
    dec  bc
    inc  sp
    db   $E8 ; add  sp, d
    dec  [hl]

label_257AB::
    db   $E8 ; add  sp, d
    ld   d, e
    db   $E8 ; add  sp, d
    ld   d, l
    db   $E8 ; add  sp, d
    scf
    ld   b, h
    ld   e, b
    ld   b, h
    jr   nz, label_257AB
    ld   h, $20
    cp   $03
    inc  b
    add  a, [hl]
    rst  $38
    push af
    add  a, l
    nop
    push af
    jp   nz, label_F55F
    inc  de
    push af
    inc  sp
    jr   nz, label_2580B
    dec  a
    add  a, d
    ld   b, e
    cpl
    ld   b, h
    ld   [rLYC], a
    inc  a
    add  a, h
    ld   b, [hl]
    ld   a, [bc]
    ld   d, c
    jr   nz, label_25829
    jr   c, label_2575B
    ld   d, e
    dec  de
    ld   d, l
    scf
    add  a, e
    ld   d, [hl]
    ld   a, [bc]
    ld   h, c
    ld   a, [bc]
    ld   h, d
    ldd  [hl], a
    add  a, d
    ld   h, e
    inc  l
    ld   h, l
    ld   sp, label_A66
    add  a, e
    ld   [hl], e
    ld   a, [bc]
    jr   nz, label_25834
    ld   a, b
    ld   b, h
    ldi  [hl], a
    call nc, label_FD27
    pop  hl
    ld   c, $AD
    ld   d, b
    ld   a, h
    jp   nz, label_F559
    cp   $03
    inc  b
    rst  $38
    push af
    ld   e, c
    ld   a, [bc]
    jp   nz, label_F500
    add  a, d
    rst  $30

label_2580A::
    push af

label_2580B::
    inc  d
    ei
    jr   label_2580A
    ld   [hl], $FB
    ld   c, c
    ei
    ld   d, e
    ei
    ld   [hl], l
    ei
    ld   a, c
    ei
    jp   label_A12
    inc  hl
    ld   a, [bc]
    add  a, e
    inc  sp
    add  hl, bc
    add  a, d
    ld   b, d
    add  hl, bc
    jp   nz, label_A40
    ld   d, c
    add  hl, bc

label_25829::
    add  a, d
    ld   h, a
    add  hl, bc
    add  a, d
    jr   c, label_25832
    ld   c, b
    inc  bc
    add  a, d

label_25832::
    ld   d, [hl]
    inc  bc

label_25834::
    add  a, d
    ld   [hl], c
    inc  bc
    jp   nz, label_F55F
    ld   b, c

label_2583B::
    jr   nz, label_2583B
    inc  bc
    inc  b
    ld   d, b
    ld   a, [bc]
    add  a, [hl]
    rst  $38
    push af
    call nz, label_F508
    db   $10 ; Undefined instruction
    dec  h
    ei
    ccf
    ei
    ld   d, d
    ei
    ld   [hl], b
    or   a

label_25851::
    ldi  [hl], a
    db   $E8 ; add  sp, d
    dec  d
    add  hl, bc
    inc  hl
    add  hl, bc
    add  a, h
    jr   nc, label_2585D
    add  a, d
    ld   b, h
    add  hl, bc

label_2585D::
    ld   b, a
    inc  bc
    ld   d, l
    db   $E8 ; add  sp, d
    ld   h, a
    add  hl, bc

label_25863::
    add  a, d
    ld   d, [hl]
    inc  bc
    add  a, d
    ld   h, h
    inc  bc
    add  a, d
    ld   [hl], d
    inc  bc
    add  a, d
    ld   [hl], h
    add  hl, bc
    ld   [hl], a
    inc  bc
    ld   b, $F5
    rla
    push af
    cp   $03
    inc  b
    rst  $38
    push af
    db   $10 ; Undefined instruction
    ld   de, label_122F
    ld   c, [hl]
    ld   [bc], a
    jr   c, label_25886
    dec  sp
    ld   hl, label_223A
    dec  sp
    add  a, $20
    jr   c, label_25851

label_2588C::
    ld   sp, $830E
    ldd  [hl], a
    ld   c, $C3
    inc  de
    ld   c, $C4
    inc  b
    ld   c, $05
    sbc  a, e
    add  a, h
    ld   b, $99
    add  a, h
    ld   d, $96
    add  a, h
    ld   h, $93
    jp   label_9A15
    ld   b, l
    sbc  a, [hl]
    add  a, d
    ld   b, e
    sbc  a, c
    ld   b, d
    sbc  a, e
    jp   label_9A52
    add  a, d
    ld   d, e
    sub  a, [hl]
    ld   d, l
    sbc  a, b
    add  a, d
    ld   h, e
    sub  a, e
    ld   h, l
    sub  a, l
    ld   e, c
    sbc  a, e
    ld   l, b
    sbc  a, e
    ld   a, b
    sbc  a, d
    jp   nz, label_9A69
    ld   [hl], e
    push af
    cp   $03
    inc  b
    adc  a, d
    nop
    sbc  a, c
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_25863
    add  a, d
    ld   b, d
    push af
    add  hl, sp

label_258D4::
    ld   b, h
    adc  a, d
    ld   d, b
    sbc  a, c
    adc  a, d
    ld   h, b
    inc  c
    adc  a, d
    ld   [hl], b
    inc  c
    ld   b, [hl]
    add  a, $E2
    rra
    db   $EB ; Undefined instruction
    jr   label_25915
    cp   $03
    inc  b
    add  a, [hl]
    nop
    sbc  a, c
    ld   b, $9C
    add  a, d
    rlca
    push af
    add  a, [hl]
    db   $10 ; Undefined instruction
    jp   label_9A16
    add  a, [hl]
    jr   nz, label_2588C
    add  a, e
    daa
    ld   b, h
    add  a, e
    scf
    ld   b, h
    jr   z, label_258D4
    ld   b, [hl]
    sbc  a, l
    add  a, d
    ld   b, a
    sbc  a, c
    ld   c, c
    sbc  a, h
    ld   d, b
    sbc  a, h
    ld   d, [hl]
    sub  a, a
    add  a, d
    ld   d, a
    sub  a, [hl]
    jp   label_9A59
    jp   nz, label_9A60

label_25915::
    ld   h, c
    sbc  a, h
    ld   [hl], c
    sbc  a, d
    ld   h, [hl]
    sub  a, h
    add  a, d
    ld   h, a
    sub  a, e
    ld  [$FF00+C], a
    rra

label_25920::
    db   $EC ; Undefined instruction
    ld   l, b

label_25922::
    jr   nc, label_25922
    inc  bc
    inc  b
    rrca
    push af
    jp   nz, label_E06
    ret  z
    rlca
    ld   c, $08
    add  hl, sp
    rst  0
    jr   label_25941
    ret  z
    add  hl, bc
    scf
    jp   nz, label_F540
    inc  bc
    push af
    inc  b
    push af
    inc  d
    pop  hl
    inc  b
    ld   b, l

label_25941::
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    ret  z
    ld   b, $38
    cp   $0A
    db   $EB ; Undefined instruction
    ret  z
    nop
    jr   c, label_25951
    ccf

label_25951::
    ld   de, $833B
    ld   [bc], a
    jp   [hl]
    add  a, e
    ld   [de], a
    jp   [hl]
    jp   nz, label_3A05
    jp   nz, label_3E06
    ld   h, $39
    add  a, e
    rlca
    db   $3A ; ldd  a, [hl]
    add  a, e
    rla
    db   $3A ; ldd  a, [hl]
    add  a, e
    daa
    db   $3A ; ldd  a, [hl]
    call nz, label_ED21
    ld   d, d
    db   $ED ; Undefined instruction
    add  a, d
    inc  h
    db   $ED ; Undefined instruction
    ld   b, [hl]
    db   $ED ; Undefined instruction
    ld   b, a
    ret  z
    add  a, d
    ld   h, c
    jp   [hl]
    add  a, d
    ld   [hl], c
    jp   [hl]
    add  a, d
    ld   h, a
    jp   [hl]
    add  a, d
    ld   [hl], a
    jp   [hl]
    ld   h, e
    dec  hl
    ld   l, c
    dec  hl
    ld   [hl], e
    ld   l, $79
    ld   l, $82
    ld   h, h
    inc  l
    ld   h, [hl]
    dec  l
    add  a, d
    ld   [hl], h
    cpl
    db   $76 ; Halt
    ld   c, [hl]
    jp   nz, label_ED22
    cp   $0A
    db   $EB ; Undefined instruction
    jp   label_3A00
    jp   nz, label_3F01
    ld   [bc], a
    dec  sp
    jp   nz, label_3A02
    add  a, l
    dec  b
    db   $3A ; ldd  a, [hl]
    add  a, l
    dec  d
    db   $3A ; ldd  a, [hl]
    add  a, d
    inc  bc
    jp   [hl]
    add  a, d
    inc  de
    jp   [hl]
    ld   sp, label_32ED
    ret  z
    jp   nz, label_ED25
    ld   b, [hl]
    db   $ED ; Undefined instruction
    ld   e, b
    db   $ED ; Undefined instruction
    rla
    ld   hl, label_24F18
    ld   h, $B6
    daa
    ld   c, a
    jr   z, label_259E7
    add  hl, hl
    or   a
    ld   [hl], $CD
    scf
    ld   hl, label_24F38
    add  hl, sp
    adc  a, $47
    call label_CE48
    ld   h, b
    inc  l
    ld   h, c
    dec  l
    ld   [hl], b
    cpl
    ld   [hl], c
    ld   c, [hl]
    ld   hl, label_2623B
    ei
    ld   h, h
    ei
    ld   h, [hl]
    ei
    ld   a, b
    or   [hl]
    ld   a, c

label_259E7::
    or   a
    cp   $09
    db   $EB ; Undefined instruction
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]

label_259EE::
    adc  a, d
    db   $10 ; Undefined instruction
    jr   nz, label_259EE
    call nz, label_ED24
    ld   b, l
    ei
    ld   b, a
    ei
    ld   c, c
    or   [hl]
    ld   e, c
    call label_FB70
    ld   [hl], d
    ei
    ld   [hl], h
    ret  z
    ld   [hl], l
    ei
    ld   [hl], a
    ei
    ld   a, c
    or   [hl]

label_25A0A::
    jp   nz, label_EB24

label_25A0D::
    cp   $09
    db   $ED ; Undefined instruction
    adc  a, c
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, c
    db   $10 ; Undefined instruction
    jp   nz, label_3F09
    add  a, $29
    jr   c, label_259A4
    jr   nz, label_25A0A
    add  a, l
    jr   nc, label_25A0D
    scf
    db   $EB ; Undefined instruction
    add  a, d
    ld   b, l
    xor  $82
    ld   d, a
    xor  $36
    ret  z
    ld   b, a
    ret  z
    ld   d, l
    ret  z
    ld   h, [hl]
    ret  z
    ld   d, [hl]
    db   $EC ; Undefined instruction
    ld   b, b

label_25A35::
    or   a

label_25A36::
    ld   d, b
    adc  a, $70
    or   a
    ld   b, c

label_25A3B::
    ei
    ld   h, b
    db   $EB ; Undefined instruction
    cp   $03
    inc  b
    ret  z
    nop
    scf
    push bc
    ld   bc, $C387
    dec  b
    ld   a, [bc]
    jp   nz, label_8606
    rlca
    adc  a, b
    ld   [label_992], sp
    adc  a, c
    rla
    add  a, a
    jr   label_25A3B
    add  a, $19
    add  a, [hl]
    jp   label_25C23
    ld   h, $8D
    daa
    adc  a, h
    add  a, e
    ld   [hl], $0A
    ld   d, c
    adc  a, d
    ld   d, d
    add  a, l
    ld   d, e
    adc  a, [hl]
    add  a, d
    ld   h, c

label_25A6C::
    sub  a, b
    ld   h, e
    add  a, a
    add  a, d
    ld   [hl], c
    sub  a, b
    ld   [hl], e
    adc  a, d
    add  a, l
    ld   [hl], h
    add  a, l
    ld   a, c
    adc  a, e
    ld   h, c
    push af
    ld   [de], a
    ld   [label_842], sp
    ld   h, h
    ld   [label_24434], sp
    ld   b, l
    ld   b, h
    ld   e, b
    ld   b, h
    jr   z, label_25A6C
    pop  hl
    ld   a, [bc]
    xor  e
    ld   d, b
    ld   a, h
    cp   $03
    inc  b
    nop
    sub  a, b
    ld   bc, label_288

label_25A96::
    adc  a, h
    jp   nz, label_A06
    rlca
    add  a, [hl]
    ld   [$C890], sp
    add  hl, bc
    sub  a, b
    push bc
    ld   sp, hl
    push af
    db   $10 ; Undefined instruction
    ld   de, label_178C
    adc  a, l
    jr   label_25A35
    push bc
    jr   nz, label_25A36
    ld   hl, $8208
    inc  hl
    ld   e, h
    daa
    ld   b, h
    call nz, label_8628
    jp   nz, label_25C32
    inc  sp
    push af
    jp   nz, label_25C35
    ld   [hl], $44
    jp   label_A37
    add  a, d
    ld   d, e
    ld   e, h
    jp   nz, label_A56
    ld   h, e
    ld   b, h
    ld   h, h
    ld   [$8F67], sp
    ld   l, b
    adc  a, e
    ld   [hl], b
    adc  a, d
    ld   [hl], c
    add  a, l
    ld   [hl], d
    adc  a, [hl]
    add  a, d
    ld   [hl], l
    ld   a, [bc]
    ld   [hl], a
    add  a, [hl]
    ld   a, b
    sub  a, b
    cp   $03
    inc  b
    add  a, e
    rlca
    sub  a, b
    ret  z
    nop
    sub  a, b
    ret  z
    ld   bc, label_687
    add  a, [hl]
    push bc
    rst  $38
    push af
    add  a, d
    rst  $30
    push af
    call nz, label_9019

label_25AF8::
    jp   nz, label_F519
    jp   label_8628
    add  a, l
    ld   [hl], l
    add  a, l
    ld   [hl], e
    adc  a, a
    ld   e, b
    adc  a, l
    ld   e, c
    add  a, h
    ld   d, $8D
    rla
    add  a, h
    jr   label_25A96
    jp   nz, label_A05
    ld   h, $0A
    jp   nz, label_A52
    jp   nz, label_A63
    inc  h
    ld   [label_827], sp
    ld   d, [hl]
    ld   [label_869], sp
    ld   [hl], d
    ld   [$8F75], sp
    add  a, e
    inc  sp
    ld   b, h
    add  a, e
    ld   b, e
    ld   b, h
    add  a, e
    ld   d, e
    ld   b, h
    daa
    jr   nz, label_25B11
    rra
    pop  hl
    adc  a, b
    ld   d, b
    cp   $03
    ld   a, [bc]
    adc  a, d
    nop
    sub  a, b
    add  a, [hl]
    rst  $38
    push af
    call nz, label_9010
    jp   nz, label_F51F
    rst  0
    add  hl, de
    sub  a, b
    call nz, label_F519
    jp   label_8721
    add  a, [hl]
    ld   [de], a
    add  a, h
    add  a, $28
    add  a, [hl]
    add  a, d
    ld   [hl], b
    add  a, l
    ld   [hl], d
    adc  a, [hl]
    ld   d, c
    adc  a, h
    ld   d, b
    add  a, h
    ld   de, label_1888
    adc  a, c
    add  a, d
    ld   h, c
    inc  b
    ld   h, a
    inc  b
    db   $76 ; Halt
    inc  b
    ld   h, b
    ld   [$8F77], sp
    ld   a, b
    adc  a, e
    inc  hl
    dec  a
    add  a, d
    inc  h
    cpl
    ld   h, $3C
    inc  sp

label_25B74::
    jr   c, label_25AF8
    inc  [hl]
    ld   c, $36
    scf
    ld   b, e
    ldd  [hl], a
    add  a, d
    ld   b, h
    inc  l
    ld   b, [hl]
    ld   sp, label_3FE
    inc  b
    push bc
    rst  $38
    push af
    ld   h, b
    push af
    add  a, l
    ld   [hl], c
    push af
    ld   hl, $833D
    ldi  [hl], a
    cpl
    dec  h
    inc  a
    jp   nz, label_3831
    ld   d, c
    ldd  [hl], a
    ld   d, d
    dec  l
    ld   h, d
    ldd  [hl], a
    add  a, d
    ld   h, e
    inc  l
    dec  h
    inc  a
    jp   label_3735
    ld   h, l
    ld   sp, label_3283
    ld   c, $83
    ld   b, d
    ld   c, $82
    ld   d, e
    ld   c, $02
    dec  bc
    add  a, [hl]
    ld   [de], a
    dec  bc
    call nz, label_F5F9
    add  a, h
    ld   [hl], l
    inc  b
    add  a, $27
    dec  bc
    cp   $03
    inc  b
    add  a, [hl]
    ld   a, a
    push af
    call nz, label_F5FF
    ld   h, b
    push af
    add  a, d
    inc  d
    add  hl, bc
    add  a, h
    ld   b, c
    add  hl, bc
    add  a, d
    ld   d, d
    add  hl, bc
    ld   [bc], a
    ld   b, h
    ld   e, c
    add  hl, bc
    add  a, d
    ld   h, a
    add  hl, bc
    ld   h, d
    db   $E8 ; add  sp, d
    add  a, d
    ld   b, l
    inc  bc

label_25BDD::
    ld   d, h
    inc  bc
    add  a, e
    ld   h, e
    inc  bc
    ld   h, $F5
    ldd  [hl], a
    push af
    jr   c, label_25BDD
    jp   nz, label_F5F9
    ld   de, label_24F5
    jr   nz, label_25C25
    jr   nz, label_25B74
    ld   [hl], a
    inc  b
    cp   $03
    inc  b
    ld   bc, label_509
    call label_CE06
    add  a, d
    ld   [bc], a
    inc  bc
    ld   [label_909], sp
    call label_FB16
    add  hl, de

label_25C07::
    add  hl, bc
    ldi  [hl], a
    ei
    jr   nc, label_25C07
    inc  [hl]
    ei
    ld   [hl], $E8
    ld   b, d
    add  hl, bc
    ld   b, e
    db   $E8 ; add  sp, d
    add  a, d
    ld   d, b
    add  hl, bc
    add  a, d
    ld   d, d
    inc  bc
    add  a, d
    ld   d, [hl]
    add  hl, bc
    ld   e, b
    inc  bc
    add  a, d
    ld   h, b
    inc  bc

label_25C22::
    add  a, d

label_25C23::
    ld   h, e
    add  hl, bc

label_25C25::
    add  a, e
    ld   b, [hl]
    inc  bc

label_25C28::
    add  a, [hl]
    ld   a, a
    push af
    ld   e, c
    ei
    jp   nz, label_F5FF
    cp   $03

label_25C32::
    inc  b
    call nz, label_F508

label_25C36::
    add  a, l
    ld   a, a
    push af
    add  a, d
    ld   [hl], e
    inc  b
    nop
    adc  a, $83
    inc  b
    inc  bc

label_25C41::
    add  a, d
    db   $10 ; Undefined instruction

label_25C44::
    inc  de
    inc  bc

label_25C46::
    inc  d
    add  hl, bc
    add  a, d
    ld   d, $03
    ld   hl, label_2203
    ei
    add  a, d
    dec  h
    inc  bc

label_25C52::
    daa
    add  hl, bc
    add  a, d
    ld   b, d
    add  hl, bc
    ld   b, h
    inc  bc
    ld   b, l
    ei
    ld   c, a

label_25C5C::
    ei
    ld   d, c
    add  hl, bc
    add  a, d
    ld   d, d
    inc  bc
    ld   d, h
    add  hl, bc
    ld   d, a
    add  hl, bc
    ld   h, d

label_25C67::
    add  hl, bc
    ld   h, e
    inc  bc
    add  a, d
    ld   h, [hl]
    inc  bc
    add  a, d
    inc  [hl]
    inc  bc
    ld   h, c
    inc  bc
    cp   $03
    inc  b
    ret  z
    nop
    jr   c, label_25C41
    ld   bc, $C20E
    ld   h, d
    ld   c, $C3
    ld   [bc], a
    sbc  a, d
    call nz, label_9A43
    rst  0
    ld   [label_99A], sp
    sbc  a, l
    ldd  [hl], a

label_25C8A::
    sbc  a, l
    ld   a, b
    sbc  a, l
    inc  sp
    sbc  a, h
    ld   b, d
    sub  a, a
    ld   d, d
    sub  a, h
    add  hl, de
    sub  a, a
    add  hl, hl
    sub  a, h
    jp   nz, label_F5F3
    db   $76 ; Halt
    push af
    dec  [hl]
    ld   b, h
    ld   h, h
    ld   b, h
    call nz, label_D39
    ld   a, c
    sbc  a, c
    jp   nz, label_2057
    cp   $03
    dec  c
    adc  a, d
    nop
    sbc  a, c
    inc  bc
    sbc  a, h
    add  a, e
    inc  b
    inc  c
    rlca
    sbc  a, e
    db   $10 ; Undefined instruction
    pop  hl
    inc  d
    push de
    ld   d, b
    ld   a, h
    inc  de
    sbc  a, l
    add  a, e
    inc  d
    sbc  a, c
    rla
    sbc  a, [hl]
    add  a, d
    jr   label_25C5C
    inc  hl
    or   a
    inc  h
    ld   sp, hl
    pop  hl
    inc  d
    sub  a, $50
    ld   a, h
    daa
    or   a
    add  a, d
    jr   z, label_25C67
    inc  sp
    and  d
    scf
    and  d
    ld   b, e
    or   [hl]
    ld   b, a
    or   [hl]
    add  a, e
    ld   [hl], b
    sbc  a, c
    add  a, d
    ld   a, b
    sbc  a, c
    ld   [hl], e
    sbc  a, h
    ld   [hl], a
    sbc  a, e
    cp   $03
    inc  b
    nop
    sbc  a, [hl]
    rst  0
    ld   bc, $C79A
    add  hl, bc

label_25CF0::
    sbc  a, d
    db   $10 ; Undefined instruction
    jr   nz, label_25C8A
    call nz, label_D30
    ld   [hl], b
    sbc  a, c
    ld   [hl], c
    sbc  a, [hl]
    ld   [hl], a
    sbc  a, e
    ld   a, b
    sbc  a, c
    ld   a, c
    sbc  a, [hl]
    dec  d
    db   $E8 ; add  sp, d

label_25D04::
    ldd  [hl], a
    db   $E8 ; add  sp, d
    jr   c, label_25CF0
    ld   b, l
    db   $E8 ; add  sp, d
    ld   h, e
    db   $E8 ; add  sp, d
    ld   h, a
    db   $E8 ; add  sp, d
    ld   [hl], d
    push af
    cp   $03
    inc  b
    ret  z
    add  hl, bc
    scf
    jp   nz, label_3806
    jp   label_3834
    inc  h
    dec  a
    dec  h
    cpl
    ld   h, $34
    add  a, e
    inc  [hl]
    jr   c, label_25D8A
    ldd  [hl], a
    ld   h, l
    inc  l
    ld   h, [hl]
    dec  l
    ld   h, a
    jr   c, label_25CF6
    rlca
    ld   c, $C8
    ld   [$C30E], sp
    dec  [hl]
    ld   c, $C3
    ld   [hl], $0E
    inc  de
    ld   b, h
    ld   [hl], l
    ld   b, h
    db   $76 ; Halt
    jr   c, label_25D04
    nop
    push af
    ld   [hl], h
    push af
    cp   $0A
    db   $EB ; Undefined instruction
    ret  z
    nop
    jr   c, label_25D4E
    ld   a, $82
    inc  b

label_25D4E::
    db   $3A ; ldd  a, [hl]
    ld   b, $3F
    jp   label_3713
    jp   label_3816
    ld   b, e
    inc  sp
    ld   b, h
    ld   c, b
    ld   b, l
    ld   [rDMA], a
    inc  [hl]
    jp   label_414
    jp   label_415
    add  a, d
    ld   bc, $82E9
    rlca
    jp   [hl]
    add  hl, bc
    add  hl, sp
    push bc
    ld   de, $C5ED
    ld   [de], a
    db   $ED ; Undefined instruction
    jp   label_ED17
    ld   d, [hl]
    ret  z
    ld   b, a
    ret  z
    inc  h
    and  b
    ld   l, b
    ei
    ld   [hl], c
    ei
    ld   [hl], e
    ei
    ld   [hl], l
    ei
    ld   [hl], a
    ei
    ld   a, b
    ld   c, a
    ld   a, c
    ld   hl, label_9FE
    db   $EB ; Undefined instruction
    nop
    db   $3A ; ldd  a, [hl]
    ld   bc, label_23B
    dec  hl
    add  a, h
    inc  bc
    inc  l
    rlca
    dec  l
    ld   [label_9CD], sp
    adc  a, $12
    scf
    add  a, h
    inc  de
    inc  b
    ld   d, $A0
    jp   nz, label_3817
    ldi  [hl], a
    inc  sp
    inc  hl
    inc  a
    add  a, e
    inc  h
    inc  b
    inc  sp
    inc  sp
    inc  [hl]
    ld   c, b
    dec  [hl]
    ld   [$FF36], a
    ld   c, c
    scf
    inc  [hl]
    jp   nz, label_ED11
    ldd  [hl], a
    db   $ED ; Undefined instruction
    ld   b, e

label_25DBD::
    db   $ED ; Undefined instruction
    ld   b, [hl]
    ret  z
    ld   h, b
    ei
    ld   [hl], c
    ei
    ld   [hl], e
    ei
    ld   [hl], l
    ei
    ld   [hl], a
    ei
    ld   [hl], b
    ld   c, a
    ld   [hl], c
    ld   hl, $B679
    inc  d
    ld   l, a
    cp   $09
    db   $EB ; Undefined instruction
    jp   label_EC40
    ld   b, c
    dec  hl
    ld   b, d
    inc  l
    ld   b, e
    inc  l
    ld   b, h
    dec  l
    jp   nz, label_3751
    jp   nz, label_3854
    ld   [hl], c
    inc  sp
    add  a, d
    ld   [hl], d
    cpl
    ld   [hl], h
    inc  [hl]
    add  a, d
    ld   d, d
    inc  b
    add  a, d
    ld   h, d
    inc  b
    jr   z, label_25DBD
    scf
    ret  z
    ld   e, b
    ret  z
    ld   h, [hl]
    ret  z
    daa
    db   $EC ; Undefined instruction
    ld   sp, label_36EC
    db   $EC ; Undefined instruction
    ld   d, a
    db   $EC ; Undefined instruction
    ld   h, l
    db   $EC ; Undefined instruction
    nop
    call label_CD02
    dec  b
    call label_CD07
    add  hl, bc
    call label_CE01
    inc  bc
    adc  a, $06
    adc  a, $08
    adc  a, $04
    ret  z
    ld   [hl], b
    or   a
    ld   [hl], l
    ei
    ld   [hl], a
    ei
    ld   a, c
    or   [hl]
    cp   $09
    db   $ED ; Undefined instruction
    nop
    adc  a, $C6
    db   $10 ; Undefined instruction
    add  a, d
    ld   sp, $82EB
    ld   b, $EB
    add  a, d
    ld   b, [hl]
    db   $EB ; Undefined instruction
    add  a, e
    inc  bc
    xor  $82
    scf
    xor  $43
    xor  $13
    ei
    dec  d
    ei
    inc  h
    ld   hl, label_24F25
    inc  [hl]
    call label_CE35
    ld   b, h
    ei
    ld   d, e
    ei
    ld   d, l

label_25E4B::
    ei
    ld   d, h
    ld   c, a
    ld   d, l
    ld   hl, label_2164
    ld   h, l
    ld   c, a
    ld   [hl], h
    call label_CE75
    jp   nz, label_C817
    jp   nz, label_C857
    ret  z
    add  hl, bc
    jr   c, label_25ED2
    or   a
    cp   $03
    inc  b
    ret  z
    nop
    scf
    ret  z
    ld   bc, $C890
    ld   [bc], a
    sub  a, b
    ret  z
    inc  bc
    sub  a, b
    push bc
    inc  b
    add  a, a
    inc  b
    adc  a, b
    add  a, l
    dec  b
    add  a, h
    jr   c, label_25E0B
    add  hl, sp
    add  a, l
    jp   nz, label_8648
    jp   nz, label_9049
    ld   c, c
    push af
    jp   nz, label_F551
    ld   d, e
    adc  a, b
    ld   d, h
    adc  a, h
    jp   nz, label_8763
    ld   l, b
    adc  a, l
    ld   l, c
    add  a, h
    dec  d
    ld   [label_836], sp
    ld   h, l
    ld   [label_24425], sp
    add  hl, hl
    ld   b, h
    ld   d, [hl]
    ld   b, h
    jp   nz, label_F501
    jp   nz, label_F512
    cp   $03

label_25EA8::
    inc  b
    add  a, d
    nop
    add  a, h
    ld   [bc], a
    adc  a, h
    call nz, label_8607
    call nz, label_9008
    call nz, label_9009
    jp   nz, label_A11
    inc  de
    ld   [label_A22], sp
    ld   b, a
    adc  a, l
    add  a, d
    ld   c, b
    add  a, h
    add  a, e
    jr   nc, label_25E4B
    inc  sp
    adc  a, [hl]
    ld   [hl], $5C
    add  a, e
    ld   b, b
    sub  a, b
    jp   nz, label_8743
    add  a, e
    ld   d, b

label_25ED2::
    sub  a, b
    add  a, d
    ld   c, a
    push af
    add  a, e
    ld   h, b
    add  a, h
    ld   h, e
    adc  a, h
    ld   h, l
    ld   [$8F67], sp
    add  a, d
    ld   l, b
    add  a, l
    ld   [hl], a
    add  a, [hl]
    add  a, d
    ld   a, b
    sub  a, b
    ld   a, c
    push af
    jp   nz, label_F508
    add  hl, de
    push af
    ld   b, h
    ld   b, h
    ld   d, [hl]
    ld   b, h
    cp   $03
    inc  b
    call nz, label_9000
    jp   nz, label_F5FF
    call nz, label_8701
    add  a, h
    ld   b, $90
    add  a, h
    ld   d, $90
    add  a, h
    ld   h, $90
    add  a, h
    ld   [hl], $84
    jp   label_8605
    dec  [hl]
    adc  a, l
    ld   b, l
    call nc, label_27486
    add  a, l
    ld   [hl], e
    adc  a, a
    ld   d, $88
    rla
    sub  a, d
    jr   label_25EA5
    ld   h, $87
    daa
    db   $E4 ; Undefined instruction
    jr   z, label_25EA8
    ld   [hl], $8C
    jr   c, label_25EB3
    scf
    db   $E3 ; Undefined instruction
    pop  hl
    ld   a, [bc]
    cp   l
    ld   d, b
    ld   a, h
    add  hl, sp
    adc  a, c
    jp   label_8649
    ld   b, b
    add  a, h
    ld   b, c
    adc  a, h
    ld   h, b
    add  a, l
    ld   h, c
    adc  a, [hl]
    ld   [hl], b
    sub  a, b

label_25F3C::
    ld   [hl], c
    add  a, a
    ld   a, a
    push af
    ld   [hl], d
    ld   [label_26582], sp
    ld   [label_858], sp
    ld   a, c
    adc  a, e
    ld   d, d
    ld   b, h
    cp   $03
    inc  b
    add  a, [hl]
    rst  $38
    push af
    add  a, d

label_25F52::
    nop
    push af
    add  a, d
    rra
    push af
    jp   label_F53F
    add  a, d
    jr   nz, label_25F52
    inc  sp
    push af
    ld   b, h
    push af
    ld   d, l
    push af
    jp   label_B18
    add  hl, sp
    dec  bc
    daa
    ld   [label_3D75], sp
    db   $76 ; Halt
    ld   c, b
    ld   [hl], a
    ld   [$FF78], a
    ld   c, c
    ld   a, c
    cpl
    add  a, h
    dec  b
    inc  b
    ld   h, a
    jr   nz, label_25F3C
    rlca
    dec  bc
    add  a, d
    ld   b, c
    ld   b, h
    add  a, e
    ld   d, c
    ld   b, h
    add  a, e
    ld   h, c
    ld   b, h
    ld   d, d
    call nz, label_3FE
    inc  b
    add  a, [hl]
    rst  $38
    push af
    inc  de
    ei
    inc  d
    ei
    inc  d
    ret  z
    inc  h
    pop  hl
    ldd  [hl], a
    ei
    dec  [hl]
    ei
    jr   nz, label_25FA3
    jr   label_25FA5
    add  a, [hl]
    ld   [hl], b
    cpl
    db   $76 ; Halt
    inc  a
    ld   [hl], a

label_25FA3::
    ld   a, [bc]
    jr   nc, label_25FB1
    jp   label_B31

label_25FA9::
    add  a, e
    ld   d, d
    dec  bc
    jp   nz, label_B34
    jp   nz, label_F519
    jr   z, label_25FA9
    ld   b, a
    jr   nz, label_25F79
    ld   d, [hl]
    db   $E8 ; add  sp, d
    ld   a, c
    push af
    ld   c, b
    call nc, label_EE1
    and  d
    ld   d, b
    ld   a, h
    add  a, d
    rlca
    inc  b
    cp   $03
    ld   a, [bc]
    adc  a, d
    nop
    inc  b
    rst  0
    db   $10 ; Undefined instruction
    add  a, [hl]
    rst  $38
    push af
    jp   nz, label_F51F
    adc  a, c
    ld   de, $C651
    ld   hl, $8551
    ldi  [hl], a
    add  hl, bc
    inc  sp
    call nz, label_334
    dec  [hl]
    call nz, label_C437
    jr   c, label_25FEA
    ld   b, l
    add  hl, bc
    ld   b, [hl]

label_25FEA::
    inc  bc
    jp   nz, label_451
    ld   d, e
    call nz, label_354
    ld   d, l
    call nz, label_C457
    add  a, d
    ld   e, b
    add  hl, bc
    ld   h, l
    inc  bc
    add  a, d
    ld   h, [hl]
    add  hl, bc
    ld   a, a
    push af
    add  a, d
    ld   [hl], d
    add  hl, bc
    add  a, d
    ld   [hl], a
    inc  bc
    ld   a, c
    push af
    add  hl, hl
    ei
    ld   c, c
    ei
    ld   l, c
    ei
    cp   $03
    ld   a, [bc]
    adc  a, d
    nop
    inc  b
    add  a, l
    rst  $38
    push af
    inc  bc
    ld   [label_404], sp
    add  a, d
    jr   label_26022
    adc  a, b

label_2601F::
    db   $10 ; Undefined instruction
    add  a, d

label_26022::
    inc  de
    inc  b
    add  a, $29
    ld   d, c
    add  a, d

label_26028::
    ld   sp, label_3303
    call nz, label_C435
    scf
    call nz, label_24282

label_26032::
    inc  bc
    ld   b, h
    add  hl, bc
    add  a, d
    ld   b, a
    inc  bc
    add  a, e
    ld   d, b
    inc  bc
    ld   d, c
    ld   a, [bc]
    ld   d, e
    call nz, label_C455
    ld   d, a
    call nz, label_26282
    add  hl, bc
    ld   a, a
    push af
    add  a, d
    ld   [hl], l
    inc  bc
    ld   [label_20F5], sp
    or   a
    jr   nc, label_2601F
    ld   b, b
    or   a
    ld   d, b
    adc  a, $60
    or   a
    ld   [hl], b
    adc  a, $FE
    inc  bc
    inc  b
    ret  z
    nop
    jr   c, label_26028
    ld   bc, $C60E
    ld   [bc], a
    ld   c, $C6
    inc  bc
    sbc  a, d
    ld   h, d
    sbc  a, e
    ld   h, e
    sbc  a, [hl]
    ld   [hl], d
    sbc  a, d
    ld   [hl], e
    sbc  a, e
    add  a, [hl]
    ld   [hl], h
    sbc  a, c
    jp   nz, label_F5F6
    ld   [label_18B7], sp
    and  d
    jr   z, label_26032
    add  hl, bc
    sub  a, [hl]
    add  hl, de
    sub  a, e
    cp   $03
    inc  b
    adc  a, d
    ld   [hl], b
    sbc  a, c
    add  a, e
    ld   [hl], h
    inc  b
    adc  a, d
    nop
    sub  a, [hl]
    adc  a, d

label_2608D::
    db   $10 ; Undefined instruction
    inc  hl
    or   a
    daa
    or   a
    inc  sp
    and  d
    scf
    and  d
    ld   b, e
    or   [hl]
    ld   b, a
    or   [hl]
    inc  bc
    sbc  a, d
    rlca
    sbc  a, d
    inc  de
    sbc  a, l
    rla
    sbc  a, [hl]
    add  a, e
    inc  d
    sbc  a, c
    add  a, e
    inc  b
    dec  c
    inc  h
    ld   sp, hl
    jp   label_25C22
    jp   label_25C28
    jp   nz, label_25C32
    jp   label_25C44
    call nz, label_C45
    jp   label_25C46
    ld   [hl], d
    sbc  a, e
    ld   [hl], e
    sbc  a, h
    ld   [hl], a
    sbc  a, e
    ld   a, b
    sbc  a, h
    pop  hl
    inc  d
    db   $D3 ; Undefined instruction
    ld   d, b
    ld   a, h
    cp   $03
    inc  b
    nop
    sub  a, [hl]
    db   $10 ; Undefined instruction
    ld   bc, label_11B7
    and  d
    ld   hl, $C2B6
    ld   a, [$FF00+C]
    add  a, $70
    sbc  a, d
    ld   h, a
    sbc  a, l
    ld   l, b
    sbc  a, h
    add  a, a
    ld   [hl], b
    sbc  a, c
    ld   [hl], a
    sbc  a, h
    ld   a, b
    sbc  a, d
    add  a, d
    ld   c, b
    cpl
    add  a, d
    ld   e, b
    ld   c, $C2
    ld   l, c
    ld   c, $C6
    rlca
    sbc  a, d
    ld   [label_996], sp
    sbc  a, b
    jr   label_2608D
    add  hl, de
    sub  a, l
    ld   c, b
    ld   [$FFFE], a
    inc  bc
    inc  b
    ret  z
    add  hl, bc
    scf
    jp   nz, label_3806
    push bc
    scf
    jr   c, label_26141
    ldd  [hl], a
    daa
    dec  l
    ld   b, b
    cpl
    ld   b, c
    inc  a
    jp   label_3751
    jp   label_E50
    jp   nz, label_E07
    ret  z
    ld   [$000E], sp
    push af
    db   $F4 ; Undefined instruction
    push af
    call nz, label_D03
    call nz, label_D34
    jp   nz, label_25C36
    jp   nz, label_25C52
    ld   h, e
    ld   e, h
    jp   nz, label_F555
    ld   [hl], d
    push af
    ld   h, $32

label_26137::
    cp   $09
    xor  $01
    call label_CE02
    inc  bc
    call label_CE04
    dec  b
    call label_CE06
    rlca
    call label_CE08
    add  hl, bc
    call label_C8
    jr   c, label_26117
    ld   de, $82ED
    ld   h, $EC
    add  a, d
    ld   [hl], $EC
    add  a, d
    ld   b, [hl]
    db   $ED ; Undefined instruction
    add  a, d
    ld   d, [hl]
    db   $ED ; Undefined instruction
    adc  a, b
    ld   h, d
    db   $EB ; Undefined instruction
    adc  a, b
    ld   [hl], d
    db   $EB ; Undefined instruction
    ldi  [hl], a
    dec  hl
    add  a, d
    inc  hl
    inc  l
    dec  h
    dec  l
    jp   nz, label_3732
    ld   d, d
    inc  sp
    add  a, d
    ld   d, e
    cpl
    ld   d, l
    inc  [hl]
    jp   nz, label_3835
    add  a, d
    ld   b, e
    inc  b
    inc  sp
    and  b
    inc  [hl]
    add  a, $E1
    dec  b
    or   b
    ld   a, b
    db   $10 ; Undefined instruction
    ei
    cp   $09
    xor  $25
    ei
    daa
    ei
    inc  [hl]
    ei
    dec  [hl]
    ld   c, a
    ld   b, b
    ei

label_26193::
    ld   [hl], a
    ei
    ld   a, c
    or   [hl]
    nop
    adc  a, $01
    call label_CE02
    inc  bc
    call label_CE04
    dec  b
    call label_CE06
    rlca
    call label_CE08
    add  hl, bc
    call label_25382
    ret  z
    jp   nz, label_C865
    jp   nz, label_ED42
    jp   nz, label_ED64
    call nz, label_ED46
    ld   d, l
    db   $EB ; Undefined instruction
    add  a, h
    ld   h, b
    db   $EB ; Undefined instruction
    add  a, h
    ld   [hl], b
    db   $EB ; Undefined instruction
    add  hl, sp
    ret  z
    add  hl, hl
    db   $EC ; Undefined instruction
    cp   $09
    xor  $00
    adc  a, $01
    ei
    inc  bc
    ei
    dec  b
    call label_CE06
    rlca
    call label_CE08
    add  hl, bc

label_261D8::
    call label_3083
    ret  z
    push bc
    dec  d
    db   $ED ; Undefined instruction
    jp   label_ED46
    inc  sp
    db   $ED ; Undefined instruction
    inc  [hl]
    db   $EC ; Undefined instruction
    add  a, d
    ld   h, $C8
    jr   z, label_261D8
    add  hl, sp

label_261EC::
    ret  z
    add  a, h
    ld   b, c
    db   $EB ; Undefined instruction
    jp   nz, label_EC51
    add  a, e
    ld   d, d
    ret  z
    add  a, d
    ld   h, a
    ret  z
    ld   l, c
    db   $EC ; Undefined instruction
    ld   [hl], b
    or   a
    ld   [hl], c
    ei
    ld   [hl], e
    ei
    ld   [hl], l
    ei
    ld   [hl], a
    ei
    ld   a, c
    or   [hl]
    cp   $09
    xor  $00
    adc  a, $C8
    add  hl, bc
    jr   c, label_26193
    ld   bc, $82ED
    inc  b
    ret  z
    call nz, label_ED06
    call nz, label_C817
    push bc
    ld   [$C2ED], sp
    dec  d
    ret  z

label_26221::
    add  a, e

label_26222::
    jr   nc, label_261EC
    inc  de
    db   $EC ; Undefined instruction
    inc  h
    db   $EC ; Undefined instruction
    inc  sp
    db   $EC ; Undefined instruction
    add  a, h
    ld   d, e
    ret  z
    jp   label_EC44
    add  a, d
    ld   b, c
    db   $ED ; Undefined instruction
    add  a, d
    ld   d, c
    db   $ED ; Undefined instruction
    ld   d, a
    db   $ED ; Undefined instruction
    ld   [hl], b
    or   a
    ld   [hl], c

label_2623B::
    ei
    ld   [hl], e
    ei
    ld   [hl], l
    ei
    ld   [hl], a
    ei
    cp   $03
    inc  b
    call nz, label_3700
    ld   b, b
    ld   sp, label_250C3
    sub  a, b
    ret  z
    ld   bc, $C890
    ld   [bc], a
    sub  a, b
    jp   nz, label_9033
    jp   nz, label_8703
    inc  hl
    adc  a, d
    inc  h
    adc  a, [hl]
    jp   nz, label_8734
    ld   d, d
    adc  a, b
    ld   d, e
    add  a, h
    ld   d, h
    adc  a, h
    ld   h, d
    add  a, a
    jp   label_F5F1
    jp   nz, label_F550

label_2626E::
    add  a, d
    ld   [hl], b

label_26270::
    push af
    ld   d, $08
    daa
    ld   [label_863], sp
    jr   c, label_2626E
    jp   nz, label_F549
    jp   nz, label_F558
    jp   nz, label_A67

label_26282::
    jr   label_262C8
    ld   b, l
    ld   b, h
    ld   h, e
    ld   b, h
    cp   $03
    inc  b
    push bc
    rlca
    add  a, [hl]
    push bc
    ld   [$C590], sp
    add  hl, bc
    sub  a, b
    jp   nz, label_F54F
    ld   h, c
    push af
    jp   label_F530
    ldd  [hl], a
    jr   nz, label_26221
    inc  hl

label_262A0::
    push af
    push bc
    ld   sp, hl
    push af

label_262A4::
    call nz, label_F508
    ld   b, [hl]
    push af
    ld   d, a
    push af
    add  a, e
    ld   d, e

label_262AD::
    ld   a, [bc]
    ld   h, h
    ld   a, [bc]
    ld   [de], a
    ld   [label_814], sp
    add  a, e
    ld   [hl], d
    push af
    ld   b, h
    ld   b, h
    ld   d, e
    ld   b, h
    ld   d, l
    ld   b, h
    ld   h, h
    ld   b, h
    ld   d, h
    and  b
    cp   $03
    inc  b
    ret  z
    nop
    sub  a, b
    adc  a, c

label_262C8::
    ld   [hl], c
    sub  a, b
    call nz, label_9039
    add  a, $01
    add  a, a
    add  a, [hl]
    ld   h, d
    add  a, l
    jp   nz, label_8603
    jp   label_8638
    ld   l, b
    adc  a, e
    ld   h, c
    adc  a, d
    inc  hl
    adc  a, l
    jr   z, label_26270
    add  hl, hl
    add  a, l
    ld   b, a
    ld   e, h
    add  a, [hl]
    ld   d, d
    ld   e, h
    add  a, d
    inc  h
    add  a, h
    add  a, d
    inc  d
    sub  a, b
    add  a, d
    inc  b
    sub  a, b
    ld   h, $8C
    ld   d, $87
    ld   b, $88
    ld   h, b
    push af
    add  a, e
    rlca
    add  a, h
    inc  b
    push af
    push bc
    rst  $38
    push af
    add  a, l
    ld   [hl], c
    push af
    jp   nz, label_F539
    dec  [hl]
    ld   b, h
    ld   b, d
    ld   b, h
    cp   $03
    inc  b
    add  a, d
    nop
    add  a, h
    push bc
    jr   nc, label_262A4
    ret  z
    add  hl, bc
    sub  a, b
    push bc
    jr   z, label_262A0
    ld   a, b
    sub  a, b
    ld   [bc], a
    adc  a, h
    push bc
    ld   sp, hl
    push af
    ld   [hl], c
    sub  a, b
    call nz, label_8731
    jr   nz, label_262AD
    ld   hl, $C38E
    ccf
    push af
    add  a, [hl]
    ld   h, d
    add  a, l
    ld   h, c
    adc  a, d
    ld   l, b
    adc  a, e
    add  a, a
    ld   [hl], c
    sub  a, b
    add  a, l
    ld   [hl], c
    push af
    add  a, d
    dec  b
    ld   a, [bc]
    rlca
    adc  a, l
    ld   [$C589], sp
    rla
    ld   a, [bc]
    ld   d, [hl]
    ld   a, [bc]
    ld   d, d
    ld   [$8618], sp
    inc  d
    db   $E8 ; add  sp, d
    inc  hl
    ld   [label_825], sp
    ldd  [hl], a
    db   $E8 ; add  sp, d
    inc  [hl]
    ld   e, h
    ld   [hl], $E8
    ld   b, e
    ld   [label_845], sp
    ld   d, h
    db   $E8 ; add  sp, d
    ld   [de], a
    ld   b, h
    cp   $03
    inc  bc
    ret  z
    nop
    inc  b
    add  a, h
    ld   b, $3A
    rlca
    ld   [$FFC5], a
    rst  $38
    push af
    dec  b
    jr   c, label_26380
    dec  a
    ld   [de], a
    ld   c, b
    inc  de
    ld   [rNR14], a
    ld   c, c
    dec  d
    inc  [hl]
    push bc
    ld   hl, $8338
    dec  h
    ld   a, [bc]

label_2637E::
    ld   h, $08

label_26380::
    inc  [hl]
    ld   a, [bc]
    add  a, e
    dec  [hl]
    ld   [label_A38], sp
    ld   [hl], $5C
    add  a, e
    ld   b, l
    ld   a, [bc]
    ld   b, [hl]
    ld   [label_3271], sp
    adc  a, b
    ld   [hl], d
    inc  l
    ld   h, $08
    cp   $03
    inc  b
    add  a, [hl]
    nop
    db   $3A ; ldd  a, [hl]
    jp   label_3706
    add  a, [hl]
    db   $10 ; Undefined instruction
    add  a, [hl]
    jr   nz, label_263A7
    add  a, [hl]
    jr   nc, label_263AA

label_263A7::
    add  a, [hl]
    ld   b, b
    inc  bc

label_263AA::
    add  a, [hl]
    ld   d, b
    inc  bc
    add  a, [hl]
    ld   h, b
    inc  bc
    call nz, label_A17
    jp   label_F5F9
    inc  hl
    jr   nz, label_2637B
    ldd  [hl], a
    jr   nz, label_2637E
    inc  [hl]
    jr   nz, label_263F4
    dec  hl
    ld   [hl], $31
    jr   c, label_263CE
    jp   label_3745
    ld   d, e
    jr   nz, label_26420
    ld   a, [bc]
    jp   nz, label_F558

label_263CE::
    ld   l, c
    push af
    add  a, l
    ld   [hl], b
    inc  l
    ld   [hl], l
    ld   sp, $C633
    pop  hl
    ld   a, [bc]
    sbc  a, $38
    ld   b, b
    cp   $03
    ld   a, [bc]
    ret  z
    nop
    inc  b
    jp   label_F5FF
    ld   sp, $C504
    ld   bc, $8251
    inc  b
    add  hl, bc
    ld   b, $03
    add  hl, bc
    inc  b
    ld   sp, hl
    push af
    inc  de

label_263F4::
    add  hl, bc
    inc  d
    call nz, label_C416
    add  a, e
    rla
    inc  bc
    jr   label_26408
    ld   h, $03
    add  a, d
    daa
    add  hl, bc
    inc  [hl]
    call nz, label_335
    ld   [hl], $C5
    scf
    inc  bc
    add  a, d
    ld   b, e
    inc  bc
    add  a, d
    ld   b, a
    inc  bc
    ld   c, c
    add  hl, bc
    jp   nz, label_451
    adc  a, b
    ld   d, d
    ld   d, c
    ld   [hl], c
    ld   [label_3872], sp
    ld   h, d
    dec  a
    add  a, a

label_26420::
    ld   h, e
    cpl
    add  a, a
    ld   [hl], e
    db   $3A ; ldd  a, [hl]
    jp   nz, label_F550
    ld   l, a
    push af
    add  hl, bc
    ei
    pop  hl
    ld   a, [bc]
    rst  $18
    jr   c, label_26461
    cp   $03
    ld   a, [bc]
    rst  $38
    push af
    ld   bc, $8209
    ld   [bc], a
    inc  bc
    call nz, label_25109
    ld   [de], a
    inc  bc
    inc  de
    push bc
    inc  d
    add  hl, bc
    dec  d
    push bc
    ld   d, $03
    ld   hl, $8203
    ldi  [hl], a
    add  hl, bc
    ld   h, $09
    daa
    inc  bc
    ldd  [hl], a
    inc  bc
    inc  sp
    push bc
    dec  [hl]
    push bc
    rla
    push bc
    pop  hl
    rst  $38
    ld   [de], a
    ld   d, b
    ld   e, h
    pop  hl
    rst  $38
    ld   [de], a

label_26461::
    ld   d, b
    ld   e, h
    pop  hl
    rst  $38
    ld   [de], a
    ld   d, b
    ld   e, h
    pop  hl
    rst  $38
    ld   [de], a
    ld   d, b
    ld   e, h
    ld   [hl], $03
    add  a, d
    ld   b, h
    inc  bc
    add  a, h
    ld   b, [hl]
    ld   d, c
    add  a, l
    ld   d, b
    ld   d, c
    add  a, l
    ld   h, b
    cpl
    ld   h, l
    ld   c, [hl]
    ld   d, l
    dec  a
    ld   d, [hl]
    dec  [hl]
    add  a, l
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    ld   [hl], l

label_26485::
    ccf
    add  a, d
    ld   l, b
    inc  b
    add  a, h
    db   $76 ; Halt
    inc  b
    ld   l, b
    push af
    db   $76 ; Halt
    push af
    nop
    or   a
    db   $10 ; Undefined instruction
    cp   $03
    ld   c, $8A
    ld   h, b
    inc  b
    adc  a, d
    ld   [hl], b
    inc  b
    ld   h, b
    push af
    add  a, h
    ld   [hl], d
    push af
    push bc
    nop
    jr   c, label_264F6
    ldd  [hl], a
    adc  a, c
    ld   d, c
    inc  l
    add  a, [hl]
    inc  b
    sub  a, [hl]
    add  a, [hl]
    inc  d
    sub  a, e
    ld   [bc], a
    sbc  a, l
    inc  bc
    sbc  a, [hl]
    ld   [de], a
    sub  a, a
    ldi  [hl], a
    sub  a, h
    inc  de
    sbc  a, b
    inc  hl
    sub  a, l
    ld   h, d
    add  a, $E1
    rra
    db   $FD ; Undefined instruction
    ld   e, b
    ld   d, b
    add  a, l
    ld   h, h
    db   $E8 ; add  sp, d
    cp   $03
    inc  b
    adc  a, d
    nop
    sub  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_264E0
    adc  a, d
    jr   nc, label_264E3
    adc  a, d
    ld   b, b
    ld   c, $03
    sbc  a, [hl]
    inc  de
    sbc  a, b
    inc  hl
    sub  a, l
    ld   [bc], a
    sbc  a, l

label_264E0::
    ld   [de], a
    sub  a, a
    ldi  [hl], a

label_264E3::
    sub  a, h
    rlca
    sbc  a, l
    rla
    sub  a, a
    daa
    sub  a, h
    ld   [label_189E], sp
    sbc  a, b
    jr   z, label_26485
    adc  a, d
    ld   d, b
    inc  l
    inc  sp
    sbc  a, a
    scf

label_264F6::
    sbc  a, a
    ld   b, e
    sbc  a, d
    ld   b, a
    sbc  a, d
    ld   d, e
    and  e
    ld   d, a
    and  e
    add  a, $04
    dec  c
    add  a, $06
    dec  c
    ret  z
    dec  b
    inc  c
    ld   [hl], b
    push af
    ld   a, c
    push af
    add  a, e

label_2650D::
    inc  d

label_2650E::
    xor  e
    add  a, e
    inc  h
    xor  h
    cp   $03
    inc  b
    adc  a, d
    nop
    sub  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_2652C
    adc  a, d
    jr   nc, label_2652F
    adc  a, d
    ld   b, b
    ld   c, $03
    sbc  a, [hl]
    inc  de
    sbc  a, b
    inc  hl
    sub  a, l
    ld   [bc], a
    sbc  a, l

label_2652C::
    ld   [de], a
    sub  a, a
    ldi  [hl], a

label_2652F::
    sub  a, h
    rlca
    sbc  a, l
    rla
    sub  a, a
    daa
    sub  a, h
    ld   [label_189E], sp
    sbc  a, b
    jr   z, label_264D1
    adc  a, d
    ld   d, b
    inc  l
    inc  sp
    sbc  a, a
    scf
    sbc  a, a
    ld   b, e
    sbc  a, d
    ld   b, a
    sbc  a, d
    ld   d, e
    and  e
    ld   d, a
    and  e
    add  a, $04
    dec  c
    add  a, $06
    dec  c
    ret  z
    dec  b
    inc  c
    ld   [hl], b
    push af

label_26556::
    ld   a, c
    push af
    cp   $03
    ld   c, $8A
    ld   d, b
    inc  l
    adc  a, d
    ld   h, b
    inc  b
    adc  a, d
    ld   [hl], b
    inc  b
    add  a, a
    nop
    sub  a, [hl]
    add  a, a
    db   $10 ; Undefined instruction
    add  a, [hl]
    ld   a, a
    push af
    rlca
    sbc  a, l
    ld   [label_179E], sp
    sub  a, a
    jr   label_2650D
    daa
    sub  a, h
    jr   z, label_2650E
    cp   $03
    inc  b
    ld   a, [$FF00+C]
    push af
    push af
    push bc
    nop

label_26582::
    ld   c, $C8
    ld   [$C30E], sp
    ld   hl, $C30E
    daa
    ld   c, $85
    ldi  [hl], a
    ld   c, $01
    scf
    ld   de, $8533
    ld   [de], a
    cpl
    rlca
    jr   c, label_265B0
    inc  [hl]
    ldd  [hl], a
    dec  hl
    ld   [hl], $2D
    ld   b, d
    scf
    ld   b, [hl]
    jr   c, label_265F5
    ld   sp, label_3256
    ld   d, a
    dec  l
    add  a, d
    ld   d, b
    inc  l
    jp   nz, label_3867
    ret  z
    add  hl, bc

label_265B0::
    scf
    add  a, e
    inc  sp
    inc  l
    inc  d
    ret  c
    inc  h
    reti
    inc  [hl]
    jp  c, label_27F82
    push af
    cp   $09
    db   $EB ; Undefined instruction
    push bc
    nop

label_265C2::
    jr   c, label_26614
    ldd  [hl], a
    adc  a, c
    ld   d, c
    inc  l
    ld   h, b
    dec  a
    ld   [hl], b
    jr   c, label_26556
    ld   h, c
    cpl
    adc  a, c

label_265D0::
    ld   [hl], c
    db   $3A ; ldd  a, [hl]
    call nz, label_ED01
    add  a, l
    ld   [de], a
    db   $EC ; Undefined instruction
    add  a, l
    ldi  [hl], a
    db   $EC ; Undefined instruction
    add  a, l
    ldd  [hl], a
    db   $EC ; Undefined instruction
    add  a, e
    rla
    ret  z
    cp   $09
    db   $EB ; Undefined instruction
    adc  a, d
    ld   d, b
    inc  l
    adc  a, d
    ld   h, b
    cpl
    adc  a, d
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    db   $10 ; Undefined instruction
    add  a, e
    ld   hl, $C3C8
    dec  b
    ret  z

label_265F5::
    ld   h, $C8

label_265F7::
    add  a, d
    jr   c, label_265C2
    rlca
    call label_CE08
    add  hl, bc
    call label_4C3
    db   $ED ; Undefined instruction
    jp   nz, label_ED27
    ld   b, $ED
    jr   nz, label_265F7
    cp   $0A
    db   $EB ; Undefined instruction
    nop
    adc  a, $01
    call label_CE02
    inc  bc

label_26614::
    call label_CE04
    dec  b

label_26618::
    call label_CE06
    rlca
    call label_CE08
    add  hl, bc
    call label_3083
    ret  z
    adc  a, b

label_26625::
    ldi  [hl], a
    ret  z
    add  a, e
    ld   b, l
    ret  z
    adc  a, d
    ld   d, b
    inc  l
    adc  a, d
    ld   h, b
    cpl
    adc  a, d
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    cp   $0A
    db   $ED ; Undefined instruction
    nop
    adc  a, $01
    call label_CE02
    inc  bc
    call label_CE04

label_26640::
    dec  b
    call label_CE06
    rlca
    call label_CE08
    ret  z
    add  hl, bc
    jr   c, label_265D0
    db   $10 ; Undefined instruction
    jr   nz, label_26618
    add  a, e
    jr   nc, label_26640
    add  a, e
    ld   b, b
    db   $ED ; Undefined instruction
    inc  sp
    ret  z
    add  a, e
    ld   d, $C8
    jr   z, label_26625
    ld   d, b
    inc  l
    ld   d, c
    dec  l
    ld   d, l
    dec  hl
    add  a, d
    ld   d, [hl]
    inc  l
    ld   e, b
    dec  l
    ld   h, b
    cpl
    ld   h, c
    ld   c, [hl]
    ld   h, l
    ld   l, $82
    ld   h, [hl]
    cpl
    ld   l, b
    ld   c, [hl]
    ld   [hl], b
    db   $3A ; ldd  a, [hl]

label_26675::
    ld   [hl], c
    ccf
    ld   [hl], l
    ld   a, $82
    db   $76 ; Halt
    db   $3A ; ldd  a, [hl]
    ld   a, b
    ccf
    add  a, e
    ld   h, d
    jp   [hl]
    add  a, e
    ld   [hl], d
    jp   [hl]
    add  a, h
    db   $10 ; Undefined instruction
    add  a, d
    jr   nc, label_26675
    add  a, d
    ld   b, b
    db   $EB ; Undefined instruction
    cp   $48
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_2670D
    ld   l, a
    ld   [hl], l
    jr   nz, label_26700
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_266BE
    ld   l, a
    ld   h, [hl]
    jr   nz, label_26716
    ld   l, b
    ld   h, l
    jr   nz, label_266EC
    ld   l, h
    ld   a, c
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_266CD
    jr   nz, label_26701
    ld   l, a
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ccf
    jr   nz, label_266D8
    ld   d, h
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_266DE

label_266BE::
    ld   [hl], e
    ld   h, c
    ld   a, c
    jr   nz, label_2672C
    ld   [hl], h
    jr   nz, label_26732
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   h, h
    jr   nz, label_26735
    ld   l, [hl]

label_266CD::
    jr   nz, label_2671C
    ld   h, c
    ld   h, d
    ld   h, l
    jr   nz, label_2672A
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c

label_266D8::
    ld   h, a
    ld   h, l
    jr   nz, label_2673D
    jr   nz, label_266FE

label_266DE::
    ld   l, h
    ld   l, a
    ld   l, [hl]
    ld   h, a
    jr   nz, label_26758
    ld   l, c
    ld   l, l
    ld   h, l
    jr   nz, label_2674A
    ld   h, a
    ld   l, a
    ld   l, $2E
    ld   l, $49
    jr   nz, label_26768
    ld   l, a
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    jr   nz, label_26761
    ld   h, [hl]
    jr   nz, label_26764
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_266FE::
    ld   [hl], h
    ld   [hl], d

label_26700::
    ld   [hl], l

label_26701::
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   b, c
    ld   h, c
    ld   h, c
    ld   h, c
    ld   l, b
    inc  l
    jr   nz, label_2675A
    ld   l, c
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_26735
    jr   nz, label_26764
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20
    ld   c, c
    jr   nz, label_26799
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_2678F
    ld   h, l
    ld   [hl], d
    jr   nz, label_2679F
    ld   l, a

label_2672C::
    jr   nz, label_26791
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_26795
    ld   h, c
    ld   h, e

label_26735::
    ld   l, e
    ld   h, c
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   l, $2E

label_2673D::
    ld   l, $48
    ld   h, l
    ld   [hl], d
    jr   nz, label_267B6
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   l, c
    ld   [hl], e
    jr   nz, label_267BE

label_2674A::
    ld   l, b
    ld   h, l
    jr   nz, label_267B0
    ld   h, l
    ld   [hl], e

label_26750::
    ld   [hl], h
    ld   l, $2E
    ld   l, $FF
    ld   c, c
    jr   nz, label_267BC

label_26758::
    ld   [hl], d
    ld   h, l

label_2675A::
    ld   h, c
    ld   l, l
    ld   h, l
    ld   h, h
    jr   nz, label_267D4
    ld   l, b

label_26761::
    ld   h, c
    ld   [hl], h
    jr   nz, label_26785
    ld   c, c
    jr   nz, label_267DC

label_26768::
    ld   [hl], l
    ld   [hl], d
    ld   l, [hl]
    ld   h, l
    ld   h, h
    jr   nz, label_267D8
    ld   l, [hl]
    ld   [hl], h
    ld   l, a
    jr   nz, label_267D5
    jr   nz, label_267D9
    ld   h, c
    ld   [hl], d
    ld   [hl], d
    ld   l, a
    ld   [hl], h
    jr   nz, label_267E9
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_267A2
    jr   nz, label_267A4
    jr   nz, label_267F4
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_267E7
    ld   l, b

label_26791::
    ld   h, c
    ld   [hl], h
    jr   nz, label_267B5

label_26795::
    ld   h, c
    ld   l, [hl]
    jr   nz, label_26808

label_26799::
    ld   h, h
    ld   h, h
    jr   nz, label_26801
    ld   [hl], d
    ld   h, l

label_2679F::
    ld   h, c
    ld   l, l
    ld   l, $2E
    ld   l, $FF
    ld   b, l
    ld   l, b
    ccf
    jr   nz, label_267CA
    ld   c, b
    ld   l, a
    ld   [hl], a
    jr   nz, label_26812
    ld   h, c

label_267B0::
    ld   l, [hl]
    jr   nz, label_26814
    ld   l, [hl]
    jr   nz, label_26817

label_267B6::
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_26831
    ld   h, c

label_267BE::
    ld   l, h
    ld   l, e
    ccf
    jr   nz, label_267E3
    jr   nz, label_267E5
    ld   c, b
    ld   l, a
    ld   [hl], a
    ccf
    jr   nz, label_267EB
    ld   c, b
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_2681A
    ld   e, [hl]
    ld   l, l
    jr   nz, label_267F5

label_267D5::
    ld   l, d
    ld   [hl], l
    ld   [hl], e

label_267D8::
    ld   [hl], h

label_267D9::
    jr   nz, label_2683C
    jr   nz, label_2684F
    ld   h, c
    ld   h, d
    ld   h, d
    ld   l, c
    ld   [hl], h
    inc  l

label_267E3::
    jr   nz, label_26805

label_267E5::
    ld   [hl], e
    ld   l, a

label_267E7::
    jr   nz, label_26832

label_267E9::
    jr   nz, label_2684F

label_267EB::
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_2685C
    ld   l, [hl]
    ld   l, a
    ld   [hl], a

label_267F4::
    ld   hl, label_241FF
    ld   l, b
    ld   l, b
    ld   l, b
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_26801::
    jr   nz, label_2686B
    ld   h, l
    ld   [hl], d

label_26805::
    ld   hl, label_2694C

label_26808::
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_2685B
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]

label_26812::
    ld   hl, rNR42
    ld   c, c
    ld   h, [hl]

label_26817::
    jr   nz, label_26892
    ld   l, a

label_2681A::
    ld   [hl], l
    jr   nz, label_26885
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_26890
    ld   l, a
    jr   nz, label_26845
    ld   h, e
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   h, c
    ld   h, a
    ld   h, l
    inc  l
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   l, [hl]

label_26831::
    jr   nz, label_26853
    jr   nz, label_26855
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_268A2
    ld   h, c
    db   $76 ; Halt

label_2683C::
    ld   h, l
    jr   nz, label_268AD
    ld   l, a
    jr   nz, label_26862
    jr   nz, label_26864
    jr   nz, label_268B9
    ld   [hl], h
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    ld   h, a
    ld   [hl], h
    ld   l, b
    ld   l, $20

label_2684F::
    jr   nz, label_26871
    jr   nz, label_26873

label_26853::
    jr   nz, label_26875

label_26855::
    ld   b, a
    ld   [hl], d
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   [hl], e

label_2685B::
    ld   [hl], h

label_2685C::
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    jr   nz, label_26882

label_26862::
    jr   nz, label_26884

label_26864::
    jr   nz, label_268DD
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_268D9
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_268D7

label_26871::
    ld   l, a
    ld   [hl], d

label_26873::
    jr   nz, label_26895

label_26875::
    ld   h, e
    ld   l, a
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   [hl], e
    ld   l, $FF
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_268F1
    ld   l, a

label_26884::
    ld   [hl], h

label_26885::
    jr   nz, label_268E8
    ld   h, [hl]
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   h, h
    ld   l, $20
    ld   c, c
    jr   nz, label_268FB
    ld   [hl], l

label_26892::
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_268FA
    ld   h, l
    ld   h, e
    ld   l, c
    ld   h, h
    ld   h, l
    ld   h, h
    jr   nz, label_268BE
    ld   [hl], h
    ld   l, a
    jr   nz, label_26919

label_268A2::
    ld   h, c
    ld   l, c
    ld   [hl], h
    jr   nz, label_26908
    ld   [hl], h
    jr   nz, label_26912
    ld   l, a
    ld   l, l
    ld   h, l

label_268AD::
    ld   l, $FF
    ld   d, h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_2691E
    ld   [hl], e
    jr   nz, label_26925
    ld   a, c

label_268B9::
    jr   nz, label_26921
    ld   l, c
    ld   [hl], d
    ld   [hl], e

label_268BE::
    ld   [hl], h
    ld   [hl], a
    ld   h, c
    ld   l, h
    ld   l, e
    jr   nz, label_2693C
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_26943
    ld   l, a
    ld   [hl], l
    inc  l
    jr   nz, label_268EF
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   l, $FF
    ld   l, $20
    ld   l, $20
    ld   l, $20
    ld   l, $20
    ld   l, $FF
    ld   d, h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_26949
    ld   l, h
    ld   l, c

label_268E8::
    ld   h, [hl]
    ld   h, [hl]
    jr   nz, label_26963
    ld   l, c
    ld   l, h
    ld   l, h

label_268EF::
    jr   nz, label_26953

label_268F1::
    ld   h, l
    jr   nz, label_26963
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_2696B
    ld   h, l
    ld   h, e

label_268FA::
    ld   [hl], d

label_268FB::
    ld   h, l
    ld   [hl], h
    jr   nz, label_2691F
    jr   nz, label_26971
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    ld   l, $20
    rst  $38

label_26908::
    ld   b, c
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_26989
    ld   l, a
    ld   [hl], l

label_26912::
    jr   nz, label_2697B
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   [hl], h

label_26919::
    ld   l, a
    jr   nz, label_2698F
    ld   h, c
    ld   a, c

label_2691E::
    jr   nz, label_26981
    ld   l, [hl]

label_26921::
    ld   a, c
    ld   [hl], h
    ld   l, b
    ld   l, c

label_26925::
    ld   l, [hl]
    ld   h, a
    ccf
    rst  $38
    ld   c, a
    ld   l, b
    jr   nz, label_26995
    ld   l, a
    ld   [hl], a
    jr   nz, label_2697A
    jr   nz, label_2699F
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_26958
    jr   nz, label_269AA
    ld   l, c
    ld   h, e

label_2693C::
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   hl, label_25720
    ld   l, b
    ld   a, c
    jr   nz, label_26968
    jr   nz, label_269AE
    ld   l, a
    ld   l, [hl]

label_2694C::
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_269C9
    ld   l, a
    ld   [hl], l
    jr   nz, label_269C8
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_26979
    ld   h, c
    jr   nz, label_269CC
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_269DB
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_26989
    ld   l, [hl]
    ld   l, a

label_2696B::
    jr   nz, label_269DC
    ld   l, [hl]
    ld   h, l
    jr   nz, label_269DA

label_26971::
    ld   [hl], e
    jr   nz, label_26994
    jr   nz, label_26996
    jr   nz, label_26998
    jr   nz, label_269DB

label_2697A::
    ld   [hl], d

label_2697B::
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    ccf
    jr   nz, label_269DB
    ld   l, a
    ld   [hl], l
    jr   nz, label_269E9
    ld   h, c
    ld   l, [hl]
    jr   nz, label_269ED
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_269F8

label_2698F::
    ld   [hl], h
    jr   nz, label_269C0
    jr   nz, label_269C2

label_26994::
    jr   nz, label_269C4

label_26996::
    rst  $38
    ld   e, c

label_26998::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_26A06

label_2699F::
    ld   l, a
    ld   [hl], h
    jr   nz, label_26A17
    ld   l, b
    ld   h, l
    jr   nz, label_269C7
    ld   b, d
    ld   l, h
    ld   [hl], l

label_269AA::
    ld   h, l
    jr   nz, label_269F0
    ld   l, h

label_269AE::
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_26A11
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_26A21
    ld   h, c
    ld   l, l
    ld   h, c

label_269C0::
    ld   h, a
    ld   h, l

label_269C2::
    jr   nz, label_26A3B

label_269C4::
    ld   l, c
    ld   l, h
    ld   l, h

label_269C7::
    ld   h, d

label_269C8::
    ld   h, l

label_269C9::
    jr   nz, label_26A3D
    ld   h, l

label_269CC::
    ld   h, h
    ld   [hl], l
    ld   h, e
    ld   h, l
    ld   h, h
    jr   nz, label_26A35
    ld   a, c
    jr   nz, label_269F6
    jr   nz, label_26A40
    ld   h, c
    ld   l, h

label_269DA::
    ld   h, [hl]

label_269DB::
    ld   hl, label_259FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_26A4C
    ld   l, a
    ld   [hl], h
    jr   nz, label_26A5D

label_269E9::
    ld   l, b
    ld   h, l
    jr   nz, label_26A0D

label_269ED::
    ld   d, d
    ld   h, l
    ld   h, h

label_269F0::
    jr   nz, label_26A35
    ld   l, h
    ld   l, a
    ld   [hl], h
    ld   l, b

label_269F6::
    ld   h, l
    ld   [hl], e

label_269F8::
    ld   hl, label_2020
    jr   nz, label_26A1D
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_26A65
    ld   l, a
    ld   h, h
    ld   a, c

label_26A06::
    jr   nz, label_26A71
    ld   [hl], e
    jr   nz, label_26A2B
    jr   nz, label_26A2D

label_26A0D::
    ld   h, [hl]
    ld   [hl], l
    ld   l, h
    ld   l, h

label_26A11::
    jr   nz, label_26A82
    ld   h, [hl]
    jr   nz, label_26A7B
    ld   l, [hl]

label_26A17::
    ld   h, l
    ld   [hl], d
    ld   h, a
    ld   a, c
    ld   hl, rNR41
    ld   d, d
    ld   h, l
    ld   h, h

label_26A21::
    jr   nz, label_26A89
    ld   l, a
    ld   [hl], d
    jr   nz, label_26A96
    ld   h, [hl]
    ld   h, [hl]
    ld   h, l
    ld   l, [hl]

label_26A2B::
    ld   [hl], e
    ld   h, l

label_26A2D::
    inc  l
    ld   h, d
    ld   l, h
    ld   [hl], l
    ld   h, l
    jr   nz, label_26A9A
    ld   l, a

label_26A35::
    ld   [hl], d
    jr   nz, label_26A58
    jr   nz, label_26A5A
    jr   nz, label_26A5C
    jr   nz, label_26A5E
    ld   h, h
    ld   h, l

label_26A40::
    ld   h, [hl]
    ld   h, l
    ld   l, [hl]
    ld   [hl], e
    ld   h, l
    ld   l, $20
    ld   d, a
    ld   l, b
    ld   l, c
    ld   h, e
    ld   l, b

label_26A4C::
    jr   nz, label_26A6E
    ld   h, h
    ld   l, a
    jr   nz, label_26ACB
    ld   l, a
    ld   [hl], l
    jr   nz, label_26AB9
    ld   l, b
    ld   l, a

label_26A58::
    ld   l, a
    ld   [hl], e

label_26A5A::
    ld   h, l
    ccf

label_26A5C::
    jr   nz, label_26A7E

label_26A5E::
    jr   nz, label_26A80
    jr   nz, label_26A82
    ld   d, d
    ld   b, l
    ld   b, h

label_26A65::
    jr   nz, label_26A87
    ld   b, d
    ld   c, h
    ld   d, l
    ld   b, l
    cp   $41
    ld   [hl], d

label_26A6E::
    ld   h, l
    jr   nz, label_26AEA

label_26A71::
    ld   l, a
    ld   [hl], l
    jr   nz, label_26AE8
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ccf
    jr   nz, label_26A9B

label_26A7B::
    jr   nz, label_26A9D
    jr   nz, label_26A9F
    jr   nz, label_26ADA
    ld   b, l

label_26A82::
    ld   d, e
    jr   nz, label_26AA5
    ld   c, [hl]
    ld   c, a

label_26A87::
    cp   $54

label_26A89::
    ld   l, b
    ld   h, l
    jr   nz, label_26AF3
    ld   h, c
    ld   l, c
    ld   [hl], d
    ld   a, c
    jr   nz, label_26B04
    ld   [hl], l
    ld   h, l
    ld   h, l

label_26A96::
    ld   l, [hl]
    jr   nz, label_26B02
    ld   [hl], e

label_26A9A::
    jr   nz, label_26B13
    ld   h, c

label_26A9D::
    ld   l, c
    ld   [hl], h

label_26A9F::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_26B0A
    ld   l, a

label_26AA5::
    ld   [hl], d
    jr   nz, label_26AC8
    ld   a, c
    ld   l, a
    ld   [hl], l
    ld   l, $FF
    ld   b, h
    ld   l, a
    jr   nz, label_26B2A
    ld   l, a
    ld   [hl], l
    jr   nz, label_26B1D
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_26B2E
    ld   l, b
    ld   h, l
    jr   nz, label_26B2E
    ld   l, a
    ld   [hl], a
    ld   h, h
    ld   h, l
    ld   [hl], d
    ccf
    jr   nz, label_26B0F
    ld   h, [hl]
    jr   nz, label_26B37
    ld   l, a
    ld   [hl], h

label_26ACB::
    inc  l
    jr   nz, label_26B47
    ld   l, a
    ld   [hl], l
    jr   nz, label_26B3F
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_26B3E
    ld   l, a
    jr   nz, label_26AFA

label_26ADA::
    jr   nz, label_26AFC
    jr   nz, label_26B40
    ld   h, c
    ld   h, e
    ld   l, e
    ld   l, $FF
    ld   c, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_26B4B

label_26AE8::
    ld   l, a
    ld   l, h

label_26AEA::
    ld   l, a
    ld   [hl], d
    ld   [hl], e
    jr   nz, label_26B50
    ld   [hl], d
    ld   h, l
    jr   nz, label_26B13

label_26AF3::
    ld   l, [hl]
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_26B6E

label_26AFA::
    ld   l, b
    ld   h, l

label_26AFC::
    jr   nz, label_26B71
    ld   h, c
    ld   l, l
    ld   h, l
    ld   hl, label_24920

label_26B04::
    ld   h, [hl]
    jr   nz, label_26B50
    jr   nz, label_26B6A
    ld   l, l

label_26B0A::
    jr   nz, label_26B7E
    ld   h, l
    ld   h, h
    inc  l

label_26B0F::
    jr   nz, label_26B79
    ld   h, l
    jr   nz, label_26B7D
    ld   [hl], e
    jr   nz, label_26B79
    ld   l, h
    ld   [hl], l
    ld   h, l
    ld   hl, label_24920

label_26B1D::
    ld   h, [hl]
    jr   nz, label_26B88
    ld   h, l
    jr   nz, label_26B43
    ld   l, c
    ld   [hl], e
    jr   nz, label_26B99
    ld   h, l
    ld   h, h
    inc  l

label_26B2A::
    jr   nz, label_26B75
    jr   nz, label_26B8F

label_26B2E::
    ld   l, l
    jr   nz, label_26B51
    jr   nz, label_26B53
    ld   h, d
    ld   l, h
    ld   [hl], l
    ld   h, l

label_26B37::
    ld   hl, label_25720
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_26BA2

label_26B3F::
    ld   l, a

label_26B40::
    ld   l, h
    ld   l, a
    ld   [hl], d

label_26B43::
    ld   l, c
    ld   [hl], e
    jr   nz, label_26BB4

label_26B47::
    ld   a, c
    jr   nz, label_26BAD
    ld   l, h

label_26B4B::
    ld   l, a
    ld   [hl], h
    ld   l, b
    ccf
    jr   nz, label_26B71

label_26B51::
    jr   nz, label_26B73

label_26B53::
    jr   nz, label_26B75
    jr   nz, label_26B77
    ld   d, d
    ld   h, l
    ld   h, h
    jr   nz, label_26B7C
    ld   b, d
    ld   l, h
    ld   [hl], l
    ld   h, l
    cp   $42
    ld   c, a
    ld   c, a
    ld   hl, label_24920
    jr   nz, label_26BCA
    ld   l, l

label_26B6A::
    jr   nz, label_26BDA
    ld   l, a
    jr   nz, label_26B8F
    jr   nz, label_26B91

label_26B71::
    ld   [hl], a
    ld   h, l

label_26B73::
    ld   h, c
    ld   l, e

label_26B75::
    ld   l, h
    ld   l, c

label_26B77::
    ld   l, [hl]
    ld   h, a

label_26B79::
    ld   hl, label_25920

label_26B7C::
    ld   l, a

label_26B7D::
    ld   [hl], l

label_26B7E::
    ld   [hl], d
    jr   nz, label_26BA1
    ld   [hl], b
    ld   l, c
    ld   [hl], h
    ld   l, c
    ld   h, [hl]
    ld   [hl], l
    ld   l, h

label_26B88::
    jr   nz, label_26BFD
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   h, h
    jr   nz, label_26BF9
    ld   [hl], e

label_26B91::
    ld   l, [hl]
    ld   l, a
    jr   nz, label_26C02
    ld   h, c
    ld   [hl], h
    ld   h, e
    ld   l, b

label_26B99::
    jr   nz, label_26C01
    ld   l, a
    ld   [hl], d
    jr   nz, label_26C0C
    ld   h, l
    ld   hl, label_249FF
    jr   nz, label_26C06
    ld   l, l
    jr   nz, label_26C1B
    ld   l, a
    ld   [hl], d
    ld   [hl], d
    ld   a, c
    inc  l

label_26BAD::
    jr   nz, label_26C11
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_26C27
    ld   l, b

label_26BB4::
    ld   l, c
    ld   [hl], e
    jr   nz, label_26C21
    ld   [hl], e
    jr   nz, label_26C2F
    ld   l, b
    ld   h, l
    jr   nz, label_26BDF
    jr   nz, label_26BE1
    jr   nz, label_26C06
    ld   l, a
    ld   l, h
    ld   l, a
    ld   [hl], d
    jr   nz, label_26C0D
    ld   [hl], l

label_26BCA::
    ld   l, [hl]
    ld   h, a
    ld   h, l
    ld   l, a
    ld   l, [hl]
    ld   l, $20
    jr   nz, label_26C22
    ld   l, [hl]
    ld   l, h
    ld   a, c
    jr   nz, label_26C4C
    ld   l, b
    ld   l, a

label_26BDA::
    ld   [hl], e
    ld   h, l
    jr   nz, label_26C55
    ld   l, c

label_26BDF::
    ld   [hl], h
    ld   l, b

label_26BE1::
    jr   nz, label_26C57
    ld   l, b
    ld   h, l
    jr   nz, label_26C57
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    jr   nz, label_26C5C
    ld   h, [hl]
    jr   nz, label_26C10
    jr   nz, label_26C12
    ld   h, e
    ld   l, a
    ld   l, h
    ld   l, a
    ld   [hl], d
    jr   nz, label_26C66

label_26BF9::
    ld   h, c
    ld   a, c
    jr   nz, label_26C62

label_26BFD::
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_26C01::
    ld   l, $49
    ld   h, [hl]
    jr   nz, label_26C7F

label_26C06::
    ld   l, a
    ld   [hl], l
    jr   nz, label_26C6D
    ld   h, c
    ld   l, [hl]

label_26C0C::
    jr   nz, label_26C82
    ld   h, l
    ld   l, h

label_26C10::
    ld   l, h

label_26C11::
    jr   nz, label_26C8A
    ld   l, b
    ld   l, a
    jr   nz, label_26C8E
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], e

label_26C1B::
    jr   nz, label_26C8F
    ld   h, l
    ld   h, h
    jr   nz, label_26C41

label_26C21::
    jr   nz, label_26C84
    ld   l, [hl]
    ld   h, h
    jr   nz, label_26C9E

label_26C27::
    ld   l, b
    ld   l, a
    jr   nz, label_26CA2
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], e

label_26C2F::
    jr   nz, label_26C51
    jr   nz, label_26C95
    ld   l, h
    ld   [hl], l
    ld   h, l
    inc  l
    jr   nz, label_26CB2
    ld   l, a
    ld   [hl], l
    jr   nz, label_26CAA
    ld   h, c
    ld   a, c
    jr   nz, label_26C61

label_26C41::
    jr   nz, label_26CA8
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, $20
    jr   nz, label_26C6B
    jr   nz, label_26C6D
    jr   nz, label_26C6F
    jr   nz, label_26C71

label_26C51::
    jr   nz, label_26C99
    ld   h, c
    ld   [hl], d

label_26C55::
    ld   h, l

label_26C56::
    ld   [hl], a

label_26C57::
    ld   h, l
    ld   l, h
    ld   l, h
    ld   l, $FF

label_26C5C::
    ld   c, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_26CCB

label_26C62::
    ld   [hl], e
    jr   nz, label_26CDE
    ld   l, a

label_26C66::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_26C8A
    jr   nz, label_26C8C
    ld   h, e

label_26C6D::
    ld   l, h
    ld   [hl], l

label_26C6F::
    ld   h, l
    ld   l, $20
    ld   c, l
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_26C98
    jr   nz, label_26C9A
    jr   nz, label_26C9C
    ld   h, c
    ld   l, h
    ld   l, h

label_26C7F::
    jr   nz, label_26CF5
    ld   l, b

label_26C82::
    ld   h, l
    jr   nz, label_26CF7
    ld   h, l
    ld   h, h
    jr   nz, label_26CA9
    jr   nz, label_26CAB
    jr   nz, label_26CEF
    ld   l, h

label_26C8E::
    ld   [hl], l

label_26C8F::
    ld   h, l
    ld   l, $FF
    ld   c, [hl]
    ld   l, a
    inc  l

label_26C95::
    jr   nz, label_26CB7
    ld   l, [hl]

label_26C98::
    ld   l, a

label_26C99::
    ld   l, $20
    ld   d, h

label_26C9C::
    ld   h, c
    ld   l, e

label_26C9E::
    ld   h, l
    jr   nz, label_26D02
    jr   nz, label_26D06
    ld   l, h
    ld   l, a
    ld   [hl], e
    ld   h, l
    ld   [hl], d

label_26CA8::
    jr   nz, label_26D16

label_26CAA::
    ld   l, a

label_26CAB::
    ld   l, a
    ld   l, e
    jr   nz, label_26D10
    ld   l, [hl]
    ld   h, h
    jr   nz, label_26D27
    ld   [hl], d
    ld   a, c
    jr   nz, label_26D18

label_26CB7::
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   l, $FF
    ld   b, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_26D38
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_26CE9
    jr   nz, label_26CEB

label_26CCB::
    jr   nz, label_26CED
    ld   h, c
    ld   l, [hl]
    ld   a, c
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   l, $FF
    ld   b, h
    ld   l, a
    jr   nz, label_26D52
    ld   l, a
    ld   [hl], l
    jr   nz, label_26D54
    ld   h, c

label_26CDE::
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_26D56
    ld   l, a
    jr   nz, label_26D05
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   h, h

label_26CE9::
    jr   nz, label_26D5F

label_26CEB::
    ld   l, b
    ld   l, c

label_26CED::
    ld   [hl], e
    jr   nz, label_26D52
    ld   l, a
    ld   l, a
    ld   l, e
    ccf
    jr   nz, label_26D16
    jr   nz, label_26D18
    jr   nz, label_26D53
    ld   b, l
    ld   d, e
    jr   nz, label_26D1E
    ld   c, [hl]
    ld   c, a
    cp   $4E

label_26D02::
    ld   h, l
    ld   [hl], a
    jr   nz, label_26D7D

label_26D06::
    ld   l, a
    ld   [hl], d
    ld   l, h
    ld   h, h
    jr   nz, label_26D7B
    ld   h, [hl]
    jr   nz, label_26D2F
    jr   nz, label_26D31
    ld   h, e
    ld   l, a
    ld   l, h
    ld   l, a
    ld   [hl], d

label_26D16::
    jr   nz, label_26D8D

label_26D18::
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    jr   nz, label_26D92

label_26D1E::
    ld   l, b
    ld   h, l
    jr   nz, label_26D57
    jr   nz, label_26D8B
    ld   [hl], d
    ld   h, c
    db   $76 ; Halt

label_26D27::
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    ld   l, $20
    jr   nz, label_26D52
    jr   nz, label_26D54
    jr   nz, label_26D56
    jr   nz, label_26D58

label_26D38::
    jr   nz, label_26D5A
    jr   nz, label_26D5C
    jr   nz, label_26D5E
    jr   nz, label_26D60
    jr   nz, label_26D62
    jr   nz, label_26D64
    inc  sp
    ld   a, [$FF20]
    jr   nz, label_26D7D
    di
    jr   nz, label_26D6C
    dec  [hl]
    ld   a, [$FF20]
    jr   nz, label_26D71
    jr   nz, label_26D73

label_26D53::
    jr   nz, label_26D87
    ld   a, [$FF00+C]

label_26D57::
    jr   nz, label_26D8A
    pop  af

label_26D5A::
    jr   nz, label_26D7C

label_26D5C::
    jr   nz, label_26D7E

label_26D5E::
    jr   nz, label_26D80

label_26D60::
    jr   nz, label_26DB6

label_26D62::
    ld   [hl], d
    ld   a, c

label_26D64::
    jr   nz, label_26DDD
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_26DCC
    ld   l, h

label_26D6C::
    ld   l, h
    jr   nz, label_26D8F
    jr   nz, label_26D91

label_26D71::
    ld   a, c
    ld   l, a

label_26D73::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_26DE4
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h

label_26D7B::
    ld   l, $20

label_26D7D::
    ld   c, a

label_26D7E::
    ld   [hl], b
    ld   h, l

label_26D80::
    ld   l, [hl]
    ld   h, c
    jr   nz, label_26DF2
    ld   h, l
    ld   [hl], a
    jr   nz, label_26DF8
    ld   h, c
    ld   [hl], h

label_26D8A::
    ld   l, b

label_26D8B::
    ld   hl, label_2020
    jr   nz, label_26DB0
    jr   nz, label_26DE9

label_26D92::
    ld   l, b
    ld   l, a
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_26E03
    ld   [hl], e
    jr   nz, label_26DBD
    jr   nz, label_26DBF
    jr   nz, label_26DC1
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   l, b
    ld   a, c
    jr   nz, label_26E1B
    ld   h, l
    ld   h, e
    ld   h, l
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   [hl], e

label_26DB0::
    jr   nz, label_26E26
    ld   l, b
    ld   h, l
    jr   nz, label_26E26

label_26DB6::
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    jr   nz, label_26E2B
    ld   h, [hl]

label_26DBD::
    jr   nz, label_26DDF

label_26DBF::
    jr   nz, label_26DE1

label_26DC1::
    ld   h, e
    ld   l, a
    ld   l, h
    ld   l, a
    ld   [hl], d
    ld   l, $20
    ld   c, c
    jr   nz, label_26E42
    ld   l, a

label_26DCC::
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    jr   nz, label_26E49
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_26E4B
    ld   l, b
    ld   h, l
    jr   nz, label_26E52
    ld   l, a
    ld   [hl], d

label_26DDD::
    ld   l, h
    ld   h, h

label_26DDF::
    jr   nz, label_26E01

label_26DE1::
    ld   l, a
    ld   h, [hl]
    jr   nz, label_26E48
    ld   l, a
    ld   l, h
    ld   l, a
    ld   [hl], d

label_26DE9::
    jr   nz, label_26E54
    ld   [hl], e
    ccf
    rst  $38
    ld   d, a
    ld   h, l
    ld   l, h
    ld   h, e

label_26DF2::
    ld   l, a
    ld   l, l
    ld   h, l
    inc  l
    jr   nz, label_26E1B

label_26DF8::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   l, $20
    ld   c, c
    jr   nz, label_26E62

label_26E01::
    ld   h, h
    ld   l, l

label_26E03::
    ld   l, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_26E81
    ld   l, a
    ld   [hl], l
    jr   nz, label_26E72
    ld   l, a
    ld   [hl], d
    ld   h, e
    ld   l, a
    ld   l, l
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_26E8A
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_26E81

label_26E1B::
    ld   h, c
    ld   [hl], d
    ld   l, $49
    jr   nz, label_26E98
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_26E8D

label_26E26::
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_26EA4

label_26E2B::
    ld   l, a
    ld   [hl], l
    jr   nz, label_26EA3
    ld   l, b
    ld   h, l
    jr   nz, label_26EA3
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    jr   nz, label_26EA8
    ld   h, [hl]
    jr   nz, label_26E5C
    jr   nz, label_26E5E
    ld   h, e
    ld   l, a
    ld   l, h
    ld   l, a

label_26E42::
    ld   [hl], d
    ld   l, $20
    ld   c, c
    ld   h, [hl]
    jr   nz, label_26EC2

label_26E49::
    ld   l, a
    ld   [hl], l

label_26E4B::
    jr   nz, label_26E6D
    jr   nz, label_26EC6
    ld   h, c
    ld   l, [hl]

label_26E51::
    ld   [hl], h

label_26E52::
    jr   nz, label_26EC3

label_26E54::
    ld   h, [hl]
    ld   h, [hl]
    ld   h, l
    ld   l, [hl]
    ld   [hl], e
    ld   h, l
    inc  l
    jr   nz, label_26E7D
    jr   nz, label_26EC2
    ld   l, b
    ld   l, a
    ld   l, a

label_26E62::
    ld   [hl], e
    ld   h, l
    jr   nz, label_26ED8
    ld   h, l
    ld   h, h
    ld   l, $20
    ld   c, c
    ld   h, [hl]
    jr   nz, label_26E8E
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_26EEA
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_26EDC
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   l, [hl]
    ld   [hl], e

label_26E7D::
    ld   h, l
    ld   h, e
    ld   l, b
    ld   l, a

label_26E81::
    ld   l, a
    ld   [hl], e
    ld   h, l
    jr   nz, label_26EE8
    ld   l, h
    ld   [hl], l
    ld   h, l
    ld   l, $20
    jr   nz, label_26EAD

label_26E8D::
    jr   nz, label_26EE6
    ld   l, b
    ld   l, c
    ld   h, e
    ld   l, b
    jr   nz, label_26F05
    ld   l, a
    ld   [hl], a
    ld   h, l

label_26E98::
    ld   [hl], d
    jr   nz, label_26EFF
    ld   l, a
    jr   nz, label_26EBE
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_26F1A

label_26EA3::
    ld   h, c

label_26EA4::
    ld   l, [hl]
    ld   [hl], h
    ccf
    jr   nz, label_26EC9
    jr   nz, label_26ECB
    jr   nz, label_26ECD

label_26EAD::
    jr   nz, label_26ECF
    jr   nz, label_26ED1
    jr   nz, label_26F05
    ld   b, l
    ld   b, h
    jr   nz, label_26ED7
    ld   b, d
    ld   c, h
    ld   d, l
    ld   b, l
    cp   $59
    ld   l, a

label_26EBE::
    ld   [hl], l
    jr   nz, label_26F27
    ld   l, a

label_26EC2::
    ld   l, a

label_26EC3::
    ld   l, h
    ld   hl, label_25920
    ld   l, a
    ld   [hl], l

label_26EC9::
    ld   [hl], d
    jr   nz, label_26EEC
    ld   [hl], e

label_26ECD::
    ld   [hl], a
    ld   l, a

label_26ECF::
    ld   [hl], d
    ld   h, h

label_26ED1::
    jr   nz, label_26F4A
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h

label_26ED7::
    jr   nz, label_26EF9
    jr   nz, label_26EFB
    jr   nz, label_26F54
    ld   l, a
    ld   [hl], d
    ld   l, e
    ld   hl, label_25420
    ld   [hl], d
    ld   a, c
    jr   nz, label_26F07
    jr   nz, label_26F09
    jr   nz, label_26F0B
    jr   nz, label_26F60
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_26F5C
    ld   l, h
    ld   [hl], e

label_26EF9::
    ld   h, l
    ld   hl, label_257FF
    ld   l, b
    ld   h, c

label_26EFF::
    ld   [hl], h
    jr   nz, label_26F63
    jr   nz, label_26F6B
    ld   [hl], d

label_26F05::
    ld   h, l
    ld   h, l

label_26F07::
    ld   h, h
    ld   a, c

label_26F09::
    jr   nz, label_26F2B

label_26F0B::
    jr   nz, label_26F73
    ld   l, a
    ld   l, a
    ld   l, h
    ld   hl, label_25920
    ld   l, a
    ld   [hl], l
    jr   nz, label_26F8E
    ld   h, c
    ld   l, [hl]
    ld   [hl], h

label_26F1A::
    jr   nz, label_26F3C
    ld   l, l
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_26F92
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ccf

label_26F27::
    ld   hl, label_24120
    jr   nz, label_26F4C
    ld   h, d
    ld   [hl], l
    ld   h, [hl]
    ld   h, [hl]
    ld   l, a
    ld   l, a
    ld   l, [hl]
    jr   nz, label_26FA1
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_26FB3
    ld   l, a
    ld   [hl], l

label_26F3C::
    ld   l, l
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_26FA4
    ld   [hl], e

label_26F44::
    jr   nz, label_26FBD
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_26F6B
    jr   nz, label_26FB4
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_26FC7
    ld   [hl], b
    jr   nz, label_26FB6
    ld   l, [hl]
    ld   h, h
    jr   nz, label_26F79
    jr   nz, label_26F7B
    jr   nz, label_26FC4
    ld   l, a
    jr   nz, label_26FC8

label_26F60::
    ld   l, a
    ld   l, l
    ld   h, l

label_26F63::
    ld   hl, label_252FF
    ld   h, l
    ld   l, h
    ld   h, c
    ld   a, b
    jr   nz, label_26FCD
    ld   l, [hl]
    ld   h, h
    jr   nz, label_26FD3
    ld   l, h
    ld   l, a
    ld   [hl], e

label_26F73::
    ld   h, l
    jr   nz, label_26FEF
    ld   l, a
    ld   [hl], l
    ld   [hl], d

label_26F79::
    jr   nz, label_26FE0

label_26F7B::
    ld   a, c
    ld   h, l
    ld   [hl], e
    ld   l, $FF
    ld   c, c
    jr   nz, label_26FFA
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_26FF6
    ld   l, a
    ld   [hl], a
    jr   nz, label_27000
    ld   h, c
    ld   l, e

label_26F8E::
    ld   h, l
    jr   nz, label_2700A
    ld   l, a

label_26F92::
    ld   [hl], l
    jr   nz, label_27004
    ld   [hl], l
    ld   [hl], h
    ld   l, $FF
    ld   b, d
    ld   l, h
    ld   [hl], l
    ld   h, l
    jr   nz, label_27008
    ld   [hl], e
    jr   nz, label_27015
    ld   h, c
    ld   h, [hl]

label_26FA4::
    ld   h, l
    ld   l, $20
    jr   nz, label_26FC9
    ld   e, c
    ld   h, l
    ld   l, h
    ld   l, h
    ld   l, a
    ld   [hl], a
    jr   nz, label_2701A
    ld   [hl], e
    jr   nz, label_26FD4

label_26FB4::
    jr   nz, label_26FD6

label_26FB6::
    jr   nz, label_26FD8
    jr   nz, label_2701D
    ld   h, c
    ld   [hl], l
    ld   [hl], h

label_26FBD::
    ld   l, c
    ld   l, a
    ld   l, [hl]
    ld   l, $20
    ld   d, d
    ld   h, l

label_26FC4::
    ld   h, h
    jr   nz, label_27030

label_26FC7::
    ld   [hl], e

label_26FC8::
    jr   nz, label_2702E
    ld   h, c
    ld   l, [hl]
    ld   h, a

label_26FCD::
    ld   h, l
    ld   [hl], d
    ld   l, $FF
    ld   e, c
    ld   h, l

label_26FD3::
    ld   l, h

label_26FD4::
    ld   l, h
    ld   l, a

label_26FD6::
    ld   [hl], a
    jr   nz, label_27042
    ld   [hl], e
    jr   nz, label_26FFC
    jr   nz, label_26FFE
    jr   nz, label_27000

label_26FE0::
    jr   nz, label_27045
    ld   h, c
    ld   [hl], l
    ld   [hl], h
    ld   l, c
    ld   l, a
    ld   l, [hl]
    ld   l, $20
    ld   d, d
    ld   h, l
    ld   h, h
    jr   nz, label_27058

label_26FEF::
    ld   [hl], e
    jr   nz, label_27056
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   h, l

label_26FF6::
    ld   [hl], d
    inc  l
    ld   d, h
    ld   h, c

label_26FFA::
    ld   l, e
    ld   h, l

label_26FFC::
    jr   nz, label_2701E

label_26FFE::
    jr   nz, label_27020

label_27000::
    jr   nz, label_2707B
    ld   l, a
    ld   [hl], l

label_27004::
    ld   [hl], d
    jr   nz, label_2707B
    ld   l, c

label_27008::
    ld   l, l

label_27009::
    ld   h, l

label_2700A::
    ld   l, $FF
    ld   b, d
    ld   l, h
    ld   [hl], l
    ld   h, l
    ld   l, $20
    ld   d, e
    ld   [hl], h
    ld   h, c

label_27015::
    ld   [hl], d
    ld   [hl], h
    jr   nz, label_27039
    jr   nz, label_2703B
    jr   nz, label_2708C

label_2701D::
    db   $76 ; Halt

label_2701E::
    ld   h, l
    ld   [hl], d

label_27020::
    ld   l, $20
    ld   e, c
    ld   h, l
    ld   l, h
    ld   l, h
    ld   l, a
    ld   [hl], a
    jr   nz, label_27093
    ld   [hl], e
    jr   nz, label_27090
    ld   h, c

label_2702E::
    ld   [hl], l
    ld   [hl], h

label_27030::
    ld   l, c
    ld   l, a
    ld   l, [hl]
    ld   l, $20
    ld   d, d
    ld   h, l
    ld   h, h
    jr   nz, label_270A3
    ld   [hl], e

label_2703B::
    jr   nz, label_270A1
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   h, l
    ld   [hl], d

label_27042::
    ld   l, $FF
    ld   c, b

label_27045::
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_270BE
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_270BB
    ld   l, a
    ld   l, a
    ld   l, e
    ld   [hl], e
    jr   nz, label_270BC
    ld   [hl], d

label_27056::
    ld   h, l
    ld   h, c

label_27058::
    ld   [hl], h
    ld   hl, label_24920
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_270C4
    ld   h, c
    ld   l, h
    ld   l, h
    ld   l, c
    ld   [hl], h
    jr   nz, label_270C6
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    jr   nz, label_270BF
    ld   l, h
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_270CC
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_270BC
    ld   l, a

label_2707B::
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    ld   hl, label_205E
    jr   nz, label_270A4
    ld   c, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_270F0
    ld   h, l
    ld   [hl], h
    jr   nz, label_270F0
    ld   l, h
    ld   l, a
    ld   [hl], e

label_27090::
    ld   h, l
    ld   [hl], d
    jr   nz, label_270B4
    ld   [hl], h
    ld   l, a
    jr   nz, label_270DA
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    ld   hl, label_247FF
    ld   [hl], d

label_270A1::
    ld   [hl], d
    ld   [hl], d

label_270A3::
    ld   [hl], d

label_270A4::
    ld   hl, label_23FF
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_27115
    ld   h, l
    ld   [hl], h
    jr   nz, label_270D2
    jr   nz, label_270D4

label_270B4::
    jr   nz, label_270D6
    ld   h, e
    ld   l, h
    ld   l, a
    ld   [hl], e
    ld   h, l

label_270BB::
    ld   [hl], d

label_270BC::
    ld   hl, label_247FF

label_270BF::
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   hl, label_24720

label_270C6::
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   hl, rNR42
    ld   c, l
    ld   [hl], l
    ld   h, e
    ld   l, b
    jr   nz, label_27136
    ld   l, h

label_270D4::
    ld   l, a
    ld   [hl], e

label_270D6::
    ld   h, l
    ld   [hl], d
    ld   hl, label_24F20
    ld   c, e
    inc  l
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_27154
    ld   h, l
    ld   h, c
    ld   h, h
    ld   a, c
    ld   l, $20
    jr   nz, label_2710A
    jr   nz, label_2710C
    jr   nz, label_27141
    ld   l, l
    ld   l, c

label_270F0::
    ld   l, h
    ld   h, l
    ld   hl, label_247FF
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   hl, label_24720
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   hl, label_2021
    jr   nz, label_2714C
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   hl, label_248FF

label_2710C::
    ld   h, c
    jr   nz, label_27177
    ld   h, c
    jr   nz, label_2717A
    ld   h, c
    ld   hl, label_24420
    ld   l, a
    jr   nz, label_27182
    ld   [hl], h
    ld   hl, label_26F44
    jr   nz, label_27188
    ld   [hl], h
    ld   hl, label_2020
    ld   b, h
    ld   l, a
    jr   nz, label_27190
    ld   [hl], h
    jr   nz, label_2714A
    jr   nz, label_27199
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   [hl], d
    ld   h, l
    ld   hl, label_2E20
    ld   l, $2E
    jr   nz, label_27167
    ld   l, $2E
    ld   c, b
    ld   [hl], l
    ld   l, [hl]
    ld   l, b
    ccf
    jr   nz, label_27162
    ld   c, [hl]
    ld   l, a
    inc  l
    jr   nz, label_271B0
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_2714A::
    jr   nz, label_271BA

label_2714C::
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, $2E

label_27154::
    ld   l, $20
    ld   c, c
    jr   nz, label_27179
    jr   nz, label_2717B
    ld   h, h
    ld   l, c
    ld   h, h
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_271D0
    ld   h, l
    ld   h, c
    ld   l, [hl]
    jr   nz, label_271D1
    ld   [hl], h
    ld   l, $FF
    ld   c, [hl]
    ld   l, a
    ld   [hl], h
    jr   nz, label_271E6
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_271DC
    ld   l, a
    ld   l, a

label_27177::
    ld   h, h
    ld   l, $2E

label_2717A::
    ld   l, $45
    ld   l, b
    ccf
    jr   nz, label_271A0
    ld   d, a
    ld   l, b

label_27182::
    ld   h, c
    ld   [hl], h
    ccf
    jr   nz, label_271A7
    ld   b, h

label_27188::
    ld   l, c
    ld   h, h
    jr   nz, label_271D5
    jr   nz, label_27201
    ld   h, c
    ld   a, c

label_27190::
    jr   nz, label_27205
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]

label_27199::
    ld   h, a
    ccf
    ld   c, [hl]
    ld   l, a
    inc  l
    jr   nz, label_27219

label_271A0::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_2720F

label_271A7::
    ld   h, l
    ld   h, c
    ld   [hl], d
    dec  l
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_27224

label_271B0::
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    inc  hl

label_271BA::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_27225
    ld   l, a
    jr   nz, label_2723D
    ld   l, a
    ld   [hl], l
    jr   nz, label_271E8
    jr   nz, label_2722B
    ld   l, h
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_2723D

label_271D1::
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_2723F
    ld   l, [hl]
    jr   nz, label_271F9
    ld   l, a
    ld   [hl], h
    ld   l, b

label_271DC::
    ld   h, l
    ld   [hl], d
    jr   nz, label_27250
    ld   h, l
    ld   l, a
    ld   [hl], b
    ld   l, h
    ld   h, l
    ld   e, [hl]

label_271E6::
    ld   [hl], e
    jr   nz, label_27209
    ld   h, h
    ld   [hl], d
    ld   h, c
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ccf
    rst  $38
    ld   b, a
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   [hl], h
    ld   hl, label_2020
    ld   b, h
    ld   l, c
    ld   h, a
    jr   nz, label_27268
    ld   [hl], h
    ld   hl, label_24420

label_27203::
    ld   l, c
    ld   h, a

label_27205::
    jr   nz, label_27270
    ld   [hl], h
    ld   hl, label_2020
    ld   b, h
    ld   l, c
    ld   h, a
    jr   nz, label_27284
    ld   l, a
    jr   nz, label_27287
    ld   l, b
    ld   h, l
    jr   nz, label_2727A
    ld   h, l
    ld   l, [hl]

label_27219::
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_2728D
    ld   h, [hl]
    jr   nz, label_27241
    jr   nz, label_27297
    ld   l, b

label_27224::
    ld   h, l

label_27225::
    jr   nz, label_2728C
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   l, b

label_2722B::
    ld   hl, rNR42
    ld   d, a
    ld   l, b
    ld   h, l
    ld   [hl], a
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_2729C
    jr   nz, label_2725D

label_2723D::
    jr   nz, label_272B2

label_2723F::
    ld   [hl], l
    ld   [hl], d

label_27241::
    ld   [hl], b
    ld   [hl], d
    ld   l, c
    ld   [hl], e
    ld   h, l
    ld   hl, label_24FFF
    ld   l, b
    ld   l, b
    ld   hl, label_2020
    ld   c, c
    ld   e, [hl]

label_27250::
    ld   l, l
    jr   nz, label_272C6
    ld   l, a
    ld   [hl], d
    ld   [hl], d
    ld   a, c
    ld   hl, label_27241
    ld   h, l
    jr   nz, label_272D6

label_2725D::
    ld   l, a
    ld   [hl], l
    jr   nz, label_272D0
    ld   l, e
    ld   h, c
    ld   a, c
    ccf
    ld   hl, label_2020

label_27268::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ccf
    rst  $38
    ld   c, b

label_27270::
    ld   h, l
    ld   a, c
    jr   nz, label_272C1
    ld   l, a
    ld   l, [hl]
    ld   hl, label_259FF
    ld   l, a

label_2727A::
    ld   [hl], l
    jr   nz, label_272E8
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_272EF
    ld   h, l
    inc  l

label_27284::
    jr   nz, label_272CF
    jr   nz, label_272A8
    ld   l, h
    ld   l, c
    ld   l, e
    ld   h, l

label_2728C::
    jr   nz, label_27301
    ld   l, b
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    jr   nz, label_27302
    ld   h, c
    ld   l, l
    ld   h, l

label_27297::
    ld   [hl], e
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_272FF
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, $2E
    ld   l, $FF
    ld   c, c
    ld   [hl], h
    jr   nz, label_2730B

label_272A8::
    ld   h, c
    ld   l, [hl]
    jr   nz, label_27310
    ld   l, c
    ld   [hl], e
    ld   [hl], b
    ld   l, h
    ld   h, c
    ld   a, c

label_272B2::
    jr   nz, label_272D4
    ld   l, l
    ld   l, c
    ld   l, h
    ld   l, h
    ld   l, c
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_2732D
    ld   h, [hl]
    jr   nz, label_272E1

label_272C1::
    jr   nz, label_272E3
    jr   nz, label_27335
    ld   l, a

label_272C6::
    ld   l, h
    ld   a, c
    ld   h, a
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   hl, label_249FF

label_272CF::
    jr   nz, label_27335
    ld   h, l
    ld   h, [hl]
    ld   l, c

label_272D4::
    ld   l, [hl]
    ld   l, c

label_272D6::
    ld   [hl], h
    ld   h, l
    ld   l, h
    ld   a, c
    jr   nz, label_272FC
    jr   nz, label_272FE
    ld   l, [hl]
    ld   h, l
    ld   h, l

label_272E1::
    ld   h, h
    jr   nz, label_2734D
    ld   [hl], h
    inc  l
    jr   nz, label_27349

label_272E8::
    ld   [hl], e
    jr   nz, label_2735E
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   h, c

label_272EF::
    ld   [hl], e
    jr   nz, label_27362
    ld   l, a
    ld   [hl], e
    ld   [hl], e
    ld   l, c
    ld   h, d
    ld   l, h
    ld   h, l
    ld   hl, label_254FF

label_272FC::
    ld   [hl], l
    ld   [hl], d

label_272FE::
    ld   l, [hl]

label_272FF::
    jr   nz, label_27362

label_27301::
    ld   [hl], e

label_27302::
    ld   l, c
    ld   h, h
    ld   h, l
    jr   nz, label_2737B

label_27307::
    ld   l, b
    ld   h, l
    jr   nz, label_2732B

label_2730B::
    ld   [hl], e
    ld   [hl], b
    ld   l, c
    ld   l, [hl]
    ld   h, l

label_27310::
    ld   h, h
    jr   nz, label_27382
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    jr   nz, label_2738F
    ld   l, c
    ld   [hl], h
    ld   l, b
    ld   h, c
    jr   nz, label_27391
    ld   l, b
    ld   l, c

label_27320::
    ld   h, l
    ld   l, h
    ld   h, h
    ld   l, $2E
    ld   l, $FF
    ld   b, [hl]
    ld   l, c
    ld   [hl], d
    ld   [hl], e

label_2732B::
    ld   [hl], h
    inc  l

label_2732D::
    jr   nz, label_27393
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   h, c
    ld   [hl], h
    jr   nz, label_27356
    jr   nz, label_273AC
    ld   l, b
    ld   h, l
    jr   nz, label_273A5
    ld   l, l
    ld   [hl], b
    ld   [hl], d
    ld   l, c
    ld   [hl], e
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   h, h
    jr   nz, label_27367
    ld   d, b
    ld   l, a

label_27349::
    ld   l, h
    ld   [hl], e
    jr   nz, label_273A3

label_2734D::
    ld   l, a
    ld   l, c
    ld   h, e
    ld   h, l
    inc  l
    jr   nz, label_27374
    jr   nz, label_27376

label_27356::
    jr   nz, label_273A4
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    inc  l

label_2735C::
    jr   nz, label_273B1

label_2735E::
    ld   [hl], h
    ld   h, c
    ld   l, h
    ld   h, [hl]

label_27362::
    ld   l, a
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    rst  $38
    ld   b, [hl]
    ld   h, c
    ld   [hl], d
    jr   nz, label_273CF
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   l, $2E
    ld   l, $20
    jr   nz, label_27397
    jr   nz, label_27399
    ld   b, h
    ld   l, a

label_2737B::
    jr   nz, label_273EB
    ld   l, a
    ld   [hl], h
    jr   nz, label_273E7
    ld   h, l

label_27382::
    ld   h, c
    ld   [hl], d
    inc  l
    jr   nz, label_273A7
    jr   nz, label_273A9
    ld   h, h
    ld   h, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_273F0

label_2738F::
    ld   l, [hl]
    ld   h, h

label_27391::
    jr   nz, label_273F9

label_27393::
    ld   l, h
    ld   a, c
    ld   hl, label_254FF
    ld   l, b

label_27399::
    ld   h, l
    jr   nz, label_27403
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_27411
    ld   h, [hl]

label_273A3::
    jr   nz, label_27419

label_273A5::
    ld   l, b
    ld   h, l

label_273A7::
    ld   [hl], h
    ld   l, c

label_273A9::
    ld   l, h
    ld   h, l
    jr   nz, label_27424
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_27414
    ld   h, l
    jr   nz, label_273D5
    jr   nz, label_273D7
    ld   a, c
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_27424
    ld   [hl], l
    ld   l, c
    ld   h, h
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   b, h
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_27440
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d

label_273CF::
    jr   nz, label_27448
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_273D5::
    ld   [hl], h
    ld   l, a

label_273D7::
    ld   [hl], d
    ld   h, e
    ld   l, b
    ld   l, h
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_27443
    ld   h, l
    ld   h, c
    ld   l, l
    ld   [hl], e
    ld   h, h
    ld   l, a

label_273E7::
    jr   nz, label_2744C
    ld   [hl], d
    ld   l, a

label_273EB::
    ld   [hl], e
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    ld   b, l
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_2746C
    ld   l, b

label_273F9::
    ld   h, l
    jr   nz, label_2746F
    ld   [hl], b
    ld   h, c
    ld   h, e
    ld   h, l
    jr   nz, label_27479
    ld   l, b

label_27403::
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_2747C
    ld   l, b
    ld   h, l
    jr   nz, label_27471
    ld   a, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_27431

label_27411::
    ld   l, b
    ld   h, c
    db   $76 ; Halt

label_27414::
    ld   h, l
    jr   nz, label_2748E
    ld   h, c
    ld   l, h

label_27419::
    ld   l, h
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_27496

label_27424::
    ld   l, c
    ld   h, h
    ld   h, h
    ld   l, h
    ld   h, l
    jr   nz, label_27494
    ld   [hl], e
    jr   nz, label_2744E
    jr   nz, label_274A3
    ld   l, a

label_27431::
    ld   l, h
    db   $76 ; Halt
    ld   h, l
    ld   h, h
    jr   nz, label_274AE
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_274B0
    ld   l, b
    ld   h, l
    jr   nz, label_274B0

label_27440::
    ld   l, c
    ld   l, h
    ld   l, h

label_27443::
    ld   h, c
    ld   [hl], d
    ld   [hl], e
    jr   nz, label_274AE

label_27448::
    ld   h, c
    ld   l, h
    ld   l, h
    ld   hl, label_246FF

label_2744E::
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_274B4
    ld   l, h
    ld   l, h
    jr   nz, label_274CB
    ld   l, b
    ld   h, l
    jr   nz, label_2747B
    jr   nz, label_2747D
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   [hl], e
    jr   nz, label_274DB
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_274DD
    ld   l, b
    ld   h, l
    jr   nz, label_2748D
    ld   [hl], d
    ld   l, a

label_2746F::
    ld   h, e
    ld   l, e

label_27471::
    jr   nz, label_274E7
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_274EA
    ld   l, a

label_27479::
    ld   l, h
    ld   l, h

label_2747B::
    ld   [hl], e

label_2747C::
    inc  l

label_2747D::
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_274AB
    xor  $29
    jr   nz, label_274F0
    ld   [hl], e
    jr   nz, label_274FE
    ld   l, b
    ld   h, l
    jr   nz, label_274F9

label_2748E::
    ld   h, l
    ld   a, c
    ld   hl, label_249FF
    ld   h, [hl]

label_27494::
    jr   nz, label_2750A

label_27496::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27505
    ld   [hl], e
    jr   nz, label_27500
    jr   nz, label_274C1
    jr   nz, label_27507

label_274A3::
    ld   l, a
    ld   l, a
    ld   [hl], d
    jr   nz, label_2751C
    ld   l, b
    ld   h, c
    ld   [hl], h

label_274AB::
    jr   nz, label_27526
    ld   l, a

label_274AE::
    ld   [hl], l
    jr   nz, label_274D1
    jr   nz, label_27516
    ld   h, c

label_274B4::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_27528
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    inc  l
    jr   nz, label_2752C
    ld   l, a
    db   $76 ; Halt

label_274C1::
    ld   h, l
    ld   h, c
    jr   nz, label_27538
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_2752D

label_274CB::
    ld   l, h
    ld   l, a
    ld   h, e
    ld   l, e
    ld   l, $FF

label_274D1::
    ld   c, l
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_2753C
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c

label_274DB::
    jr   nz, label_2753F

label_274DD::
    ld   l, h
    ld   l, a
    ld   h, e
    ld   l, e
    ld   h, h
    ld   h, l
    ld   [hl], e
    ld   l, c
    ld   h, a
    ld   l, [hl]

label_274E7::
    jr   nz, label_2755D
    ld   l, b

label_274EA::
    ld   h, l
    jr   nz, label_27560
    ld   h, c
    ld   l, l
    ld   h, l

label_274F0::
    ld   l, $41
    jr   nz, label_27562
    ld   h, l
    ld   [hl], a
    jr   nz, label_27568
    ld   h, c

label_274F9::
    ld   [hl], h
    ld   l, b
    jr   nz, label_27574
    ld   l, c

label_274FE::
    ld   l, h
    ld   l, h

label_27500::
    jr   nz, label_27571
    ld   [hl], b
    ld   h, l
    ld   l, [hl]

label_27505::
    ld   l, $FF

label_27507::
    ld   d, b
    ld   h, c
    ld   [hl], d

label_2750A::
    ld   [hl], h
    jr   nz, label_2757C
    ld   h, [hl]
    jr   nz, label_27584
    ld   l, b
    ld   h, l
    jr   nz, label_27534
    jr   nz, label_27536

label_27516::
    jr   nz, label_2757E
    ld   l, h
    ld   l, a
    ld   l, a
    ld   [hl], d

label_2751C::
    jr   nz, label_27587
    ld   [hl], e
    jr   nz, label_27593
    ld   h, c
    ld   l, c
    ld   [hl], e
    ld   h, l
    ld   h, h

label_27526::
    ld   l, $54

label_27528::
    ld   h, c
    ld   [hl], b
    jr   nz, label_275A0

label_2752C::
    ld   l, b

label_2752D::
    ld   h, l
    jr   nz, label_27592
    ld   l, h
    ld   [hl], l
    ld   h, l
    jr   nz, label_27555
    jr   nz, label_27557
    ld   h, e

label_27538::
    ld   [hl], d
    ld   a, c
    ld   [hl], e
    ld   [hl], h

label_2753C::
    ld   h, c
    ld   l, h
    ld   l, $FF
    ld   d, h
    ld   l, a
    jr   nz, label_275A8
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   h, c
    ld   [hl], h
    jr   nz, label_275BF
    ld   l, b
    ld   h, l
    jr   nz, label_2756F
    jr   nz, label_275B3
    ld   l, h
    ld   h, c
    ld   h, e
    ld   l, e

label_27555::
    jr   nz, label_275C4

label_27557::
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_2755D::
    jr   nz, label_2757F
    jr   nz, label_275D8
    ld   l, c

label_27562::
    ld   [hl], h
    ld   l, b
    jr   nz, label_275DA
    ld   l, b
    ld   h, l

label_27568::
    jr   nz, label_275D2
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_2758F

label_2756F::
    jr   nz, label_275E4

label_27571::
    ld   l, b
    ld   h, l
    ld   l, h

label_27574::
    ld   l, h
    inc  l
    jr   nz, label_275DE
    ld   h, l
    ld   h, l
    ld   h, h
    jr   nz, label_275E5
    ld   l, c

label_2757E::
    ld   l, l

label_2757F::
    jr   nz, label_275F4
    ld   l, a
    ld   l, l
    ld   h, l

label_27584::
    ld   [hl], h
    ld   l, b
    ld   l, c

label_27587::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_275F0
    ld   a, b
    dec  l
    jr   nz, label_275AF

label_2758F::
    jr   nz, label_27601
    ld   l, h

label_27592::
    ld   l, a

label_27593::
    ld   [hl], e
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   l, $FF
    ld   d, b
    ld   l, a
    ld   l, e
    ld   h, l
    jr   nz, label_27612
    ld   [hl], l

label_275A0::
    ld   [hl], e
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e

label_275A8::
    jr   nz, label_2761A
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_2761F
    ld   h, [hl]
    jr   nz, label_27627

label_275B3::
    ld   l, b
    ld   h, l
    jr   nz, label_275D7
    jr   nz, label_275D9
    ld   [hl], a
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_27636

label_275BF::
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_2763D

label_275C4::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_275E9
    ld   [hl], e
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   h, h
    jr   nz, label_27631
    ld   l, [hl]
    ld   h, h

label_275D2::
    jr   nz, label_27640
    ld   l, c
    ld   [hl], e
    ld   [hl], h

label_275D7::
    ld   h, l

label_275D8::
    ld   l, [hl]

label_275D9::
    ld   [hl], h

label_275DA::
    ld   l, a
    jr   nz, label_27651
    ld   l, b

label_275DE::
    ld   h, l
    jr   nz, label_27654
    ld   l, a
    ld   [hl], l
    ld   l, [hl]

label_275E4::
    ld   h, h

label_275E5::
    ld   [hl], e
    jr   nz, label_27651
    ld   [hl], h

label_275E9::
    ld   l, l
    ld   h, c
    ld   l, e
    ld   h, l
    ld   [hl], e
    ld   l, $FF

label_275F0::
    ld   c, c
    ld   h, [hl]
    jr   nz, label_2766D

label_275F4::
    ld   l, a
    ld   [hl], l
    jr   nz, label_2765B
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_2761E
    jr   nz, label_27620
    ld   h, h

label_27601::
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d
    ld   l, a
    ld   a, c
    jr   nz, label_2766A
    jr   nz, label_2762B
    jr   nz, label_2762D
    jr   nz, label_2762F
    jr   nz, label_27684
    ld   l, e

label_27612::
    ld   h, l
    ld   l, h
    ld   h, l
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    jr   nz, label_27691

label_2761A::
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_2763F

label_2761F::
    jr   nz, label_2769A
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_27699
    ld   [hl], a

label_27627::
    ld   l, a
    ld   [hl], d
    ld   h, h
    inc  l

label_2762B::
    jr   nz, label_276A1

label_2762D::
    ld   [hl], d
    ld   a, c

label_2762F::
    jr   nz, label_276A6

label_27631::
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_27698
    jr   nz, label_2769B
    ld   l, a
    ld   l, l
    ld   h, d
    ld   l, $FF
    ld   d, h

label_2763F::
    ld   l, a

label_27640::
    jr   nz, label_276B1
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_276A8
    jr   nz, label_27669
    jr   nz, label_2766B
    jr   nz, label_2766D
    jr   nz, label_276C3
    ld   [hl], d
    ld   h, l

label_27651::
    ld   h, c
    ld   [hl], e
    ld   [hl], l

label_27654::
    ld   [hl], d
    ld   h, l
    jr   nz, label_276BB
    ld   l, b
    ld   h, l
    ld   [hl], e

label_2765B::
    ld   [hl], h
    inc  l
    jr   nz, label_276D4
    ld   [hl], e
    ld   h, l
    jr   nz, label_276D7
    ld   l, b
    ld   h, l
    jr   nz, label_276D7
    ld   l, a
    ld   [hl], h

label_27669::
    ld   [hl], e

label_2766A::
    jr   nz, label_2768C
    jr   nz, label_2768E
    ld   h, c
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_276DF
    ld   [hl], h
    ld   l, $FF
    ld   c, b
    ld   l, a
    ld   [hl], b
    jr   nz, label_276ED
    ld   l, [hl]
    jr   nz, label_276F5
    ld   l, a
    ld   [hl], b
    jr   nz, label_276F4
    ld   h, [hl]
    jr   nz, label_276A8
    jr   nz, label_276FE
    ld   l, b
    ld   h, l

label_2768C::
    jr   nz, label_276F1

label_2768E::
    ld   [hl], d
    ld   a, c
    ld   [hl], e

label_27691::
    ld   [hl], h
    ld   h, c
    ld   l, h
    ld   [hl], e
    jr   nz, label_2770B
    ld   l, a

label_27698::
    jr   nz, label_27707

label_2769A::
    ld   l, a

label_2769B::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_27705
    ld   l, a
    ld   [hl], d

label_276A1::
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   l, $FF
    ld   c, c

label_276A8::
    ld   h, [hl]
    jr   nz, label_27724
    ld   l, a
    ld   [hl], l
    jr   nz, label_27712
    ld   h, c
    ld   l, [hl]

label_276B1::
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_2771C
    ld   l, a
    jr   nz, label_27727
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d

label_276BB::
    jr   nz, label_27731
    ld   l, b
    ld   h, l
    jr   nz, label_27731
    ld   l, a
    ld   l, h

label_276C3::
    ld   h, l
    ld   [hl], e
    inc  l
    jr   nz, label_2773C
    ld   [hl], d
    ld   a, c
    jr   nz, label_27740
    ld   l, b
    ld   [hl], d
    ld   l, a
    ld   [hl], a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_276F5
    jr   nz, label_276F7

label_276D7::
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   [hl], e
    jr   nz, label_27758

label_276DF::
    ld   l, a
    ld   [hl], l
    jr   nz, label_2774B
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_27751
    ld   l, [hl]
    jr   nz, label_27764
    ld   l, a
    ld   [hl], l

label_276ED::
    ld   [hl], d
    jr   nz, label_27758
    ld   h, c

label_276F1::
    ld   l, [hl]
    ld   h, h
    ld   [hl], e

label_276F4::
    ld   l, $FF
    ld   c, d

label_276F7::
    ld   [hl], l
    ld   l, l
    ld   [hl], b
    jr   nz, label_2776B
    ld   h, [hl]
    ld   h, [hl]

label_276FE::
    jr   nz, label_27774
    ld   l, b
    ld   h, l
    jr   nz, label_27724
    jr   nz, label_27726
    ld   h, [hl]

label_27707::
    ld   l, h
    ld   l, a
    ld   l, a
    ld   [hl], d

label_2770B::
    jr   nz, label_2776E
    ld   h, d
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_27787
    ld   l, a
    jr   nz, label_27736
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   h, e
    ld   l, b
    jr   nz, label_27791
    ld   l, b
    ld   h, l
    jr   nz, label_27784
    ld   l, b
    ld   h, l
    ld   [hl], e

label_27724::
    ld   [hl], h
    jr   nz, label_27796

label_27727::
    ld   l, [hl]
    jr   nz, label_2779E
    ld   l, b
    ld   h, l
    jr   nz, label_277A2
    ld   h, c
    ld   h, d
    ld   l, h

label_27731::
    ld   h, l
    ld   l, $FF
    ld   d, h

label_27735::
    ld   l, a

label_27736::
    jr   nz, label_2779C
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   h, c

label_2773C::
    ld   [hl], h
    jr   nz, label_277B3
    ld   l, b

label_27740::
    ld   h, l
    jr   nz, label_27763
    jr   nz, label_277B2
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_2774B::
    ld   [hl], e
    jr   nz, label_277C5
    ld   l, b
    ld   l, a
    jr   nz, label_27772
    jr   nz, label_27774
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, h

label_27758::
    jr   nz, label_277CE
    ld   l, b
    ld   h, l
    jr   nz, label_277C9
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_27783

label_27763::
    jr   nz, label_277C6
    ld   [hl], h
    ld   [hl], h
    ld   h, c
    ld   h, e
    ld   l, e
    jr   nz, label_277E0
    ld   l, b
    ld   h, l

label_2776E::
    ld   l, l
    jr   nz, label_277D7
    ld   [hl], d

label_27772::
    ld   l, a
    ld   l, l

label_27774::
    ld   h, c
    jr   nz, label_277DF
    ld   l, c
    ld   h, a
    ld   l, b
    ld   h, l
    ld   [hl], d
    jr   nz, label_277EE
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    ld   l, $FF

label_27784::
    ld   c, c
    ld   h, [hl]
    jr   nz, label_277FC
    ld   l, b
    ld   h, l
    jr   nz, label_277FF
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   [hl], l
    ld   h, l

label_27791::
    jr   nz, label_277B3
    jr   nz, label_27801
    ld   l, a

label_27796::
    ld   l, a
    ld   l, e
    ld   [hl], e
    jr   nz, label_2780E
    ld   [hl], h

label_2779C::
    ld   [hl], d
    ld   h, c

label_2779E::
    ld   l, [hl]
    ld   h, a
    ld   h, l
    inc  l

label_277A2::
    jr   nz, label_277C4
    ld   [hl], e
    ld   l, b
    ld   l, a
    ld   l, a
    ld   [hl], h
    jr   nz, label_27814
    ld   [hl], h
    jr   nz, label_27825
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_277D3

label_277B3::
    jr   nz, label_27829
    ld   l, b
    ld   h, l
    jr   nz, label_2781B
    ld   l, a
    ld   [hl], a
    ld   l, $FF
    ld   c, h
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_27838

label_277C4::
    ld   h, c

label_277C5::
    ld   l, e

label_277C6::
    ld   h, l
    jr   nz, label_2782A

label_277C9::
    jr   nz, label_277EB
    jr   nz, label_277ED
    ld   [hl], b

label_277CE::
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d

label_277D3::
    ld   h, l
    ld   hl, label_2020

label_277D7::
    jr   nz, label_277F9
    jr   nz, label_277FB
    jr   nz, label_277FD
    jr   nz, label_277FF

label_277DF::
    jr   nz, label_27801
    ld   e, c
    ld   b, l
    ld   d, e
    jr   nz, label_27806
    ld   c, [hl]
    ld   c, a
    cp   $4E
    ld   l, a

label_277EB::
    jr   nz, label_2785D

label_277ED::
    ld   l, c

label_277EE::
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ccf
    ld   hl, label_24120
    ld   [hl], d
    ld   h, l

label_277F9::
    ld   a, c
    ld   l, a

label_277FB::
    ld   [hl], l

label_277FC::
    jr   nz, label_2786E
    ld   [hl], l

label_277FF::
    ld   l, h
    ld   l, h

label_27801::
    ld   l, c
    ld   l, [hl]
    ld   e, [hl]
    jr   nz, label_27873

label_27806::
    ld   a, c
    jr   nz, label_27829
    ld   l, h
    ld   h, l
    ld   h, a
    ccf
    jr   nz, label_2782F
    jr   nz, label_27831
    jr   nz, label_27833
    jr   nz, label_27835
    jr   nz, label_27837
    jr   nz, label_27839
    jr   nz, label_2783B

label_2781B::
    jr   nz, label_2783D
    ld   e, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_27842
    ld   c, [hl]
    ld   l, a
    jr   nz, label_2789D
    ld   h, c
    ld   a, c
    cp   $57

label_2782A::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27890

label_2782F::
    jr   nz, label_27893

label_27831::
    ld   [hl], l
    ld   l, l

label_27833::
    ld   l, l
    ld   h, l

label_27835::
    ld   [hl], d
    ld   hl, label_242FF

label_27839::
    ld   h, l
    ld   h, c

label_2783B::
    ld   [hl], l
    ld   [hl], h

label_2783D::
    ld   l, c
    ld   h, [hl]
    ld   [hl], l
    ld   l, h
    ld   hl, label_24920
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_278AC
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_278C2
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_278B1
    ld   b, a
    ld   h, c
    ld   l, l
    ld   h, l
    jr   nz, label_278A8
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   l, $5E
    rst  $38
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_278E0
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_2788C
    jr   nz, label_2788E

label_2786E::
    jr   nz, label_278DE
    ld   h, c
    ld   l, l
    ld   h, l

label_27873::
    inc  l
    jr   nz, label_278EF
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, a
    jr   nz, label_278E9
    ld   h, c
    ld   l, [hl]
    ccf
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ccf
    jr   nz, label_278DE
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_278AC

label_2788C::
    jr   nz, label_278AE

label_2788E::
    jr   nz, label_278F8

label_27890::
    ld   h, l
    ld   [hl], d
    ld   h, l

label_27893::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_27910
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_278BC
    jr   nz, label_278BE
    jr   nz, label_27901
    ld   l, h
    ld   h, d
    ld   [hl], l
    ld   l, l
    inc  l
    jr   nz, label_278CA
    inc  hl

label_278A8::
    inc  hl
    inc  hl
    inc  hl
    ld   l, $20
    jr   nz, label_278CF
    ld   b, a
    ld   l, c

label_278B1::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_2791E
    ld   [hl], h
    jr   nz, label_27919
    jr   nz, label_27926
    ld   l, a
    ld   l, a

label_278BC::
    ld   l, e
    jr   nz, label_278DF
    ld   h, d
    ld   h, l
    ld   h, [hl]

label_278C2::
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_27940
    ld   l, a
    ld   [hl], l
    jr   nz, label_278EB
    jr   nz, label_278ED
    jr   nz, label_278EF

label_278CF::
    ld   l, h
    ld   h, l
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   hl, label_24CFF
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_27950
    ld   h, l

label_278DE::
    ld   h, l

label_278DF::
    jr   nz, label_2794A
    ld   h, [hl]
    jr   nz, label_2795B
    ld   h, l
    jr   nz, label_2794A
    ld   h, c
    ld   l, [hl]

label_278E9::
    jr   nz, label_27951

label_278EB::
    ld   l, c
    ld   l, h

label_278ED::
    ld   l, h
    jr   nz, label_27964
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27915
    jr   nz, label_27958
    ld   l, h

label_278F8::
    ld   h, d
    ld   [hl], l
    ld   l, l
    ld   hl, label_31FF
    ld   sp, label_27320

label_27901::
    ld   l, b
    ld   l, a
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_27973
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, c

label_27910::
    ld   [hl], h
    jr   nz, label_2797E
    ld   l, c
    ld   l, [hl]

label_27915::
    ld   h, h
    jr   nz, label_27987
    ld   h, [hl]

label_27919::
    jr   nz, label_2793B
    jr   nz, label_2793D
    ld   [hl], b

label_2791E::
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27999

label_27926::
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_2794D
    ld   c, c
    jr   nz, label_279A4
    ld   h, c
    ld   l, e
    ld   h, l
    ccf
    rst  $38
    ld   sp, label_2030
    ld   [hl], e
    ld   l, b
    ld   l, a

label_2793B::
    ld   [hl], h
    ld   [hl], e

label_2793D::
    jr   nz, label_279AB
    ld   h, l

label_27940::
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_279B6
    ld   l, c
    ld   l, [hl]

label_2794D::
    ld   h, h
    jr   nz, label_279BF

label_27950::
    ld   h, [hl]

label_27951::
    jr   nz, label_27973
    jr   nz, label_27975
    ld   [hl], b
    ld   l, c
    ld   h, e

label_27958::
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d

label_2795B::
    ld   h, l
    jr   nz, label_279D1
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_27985
    ld   c, c
    jr   nz, label_279DC
    ld   h, c
    ld   l, e
    ld   h, l
    ccf
    rst  $38
    add  hl, sp
    jr   nz, label_279E3
    ld   l, b
    ld   l, a
    ld   [hl], h

label_27973::
    ld   [hl], e
    jr   nz, label_279E2
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_279D5

label_2797E::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_279EE
    ld   l, c
    ld   l, [hl]

label_27985::
    ld   h, h
    jr   nz, label_279F7
    ld   h, [hl]
    jr   nz, label_279AB
    jr   nz, label_279AD
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27A09
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27999::
    ld   l, h
    ld   h, h
    jr   nz, label_279BD
    ld   c, c
    jr   nz, label_27A14
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_279A4::
    rst  $38
    jr   c, label_279C7
    ld   [hl], e
    ld   l, b
    ld   l, a
    ld   [hl], h

label_279AB::
    ld   [hl], e
    jr   nz, label_27A1A
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27A0D

label_279B6::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27A26
    ld   l, c
    ld   l, [hl]

label_279BD::
    ld   h, h
    jr   nz, label_27A2F
    ld   h, [hl]
    jr   nz, label_279E3
    jr   nz, label_279E5
    ld   [hl], b
    ld   l, c

label_279C7::
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27A41
    ld   l, b
    ld   l, a
    ld   [hl], l

label_279D1::
    ld   l, h
    ld   h, h
    jr   nz, label_279F5

label_279D5::
    ld   c, c
    jr   nz, label_27A4C
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_279DC::
    rst  $38
    scf
    jr   nz, label_27A53
    ld   l, b
    ld   l, a

label_279E2::
    ld   [hl], h

label_279E3::
    ld   [hl], e
    jr   nz, label_27A52
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27A45

label_279EE::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27A5E
    ld   l, c
    ld   l, [hl]

label_279F5::
    ld   h, h
    jr   nz, label_27A67
    ld   h, [hl]
    jr   nz, label_27A1B
    jr   nz, label_27A1D
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27A79
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27A09::
    ld   l, h
    ld   h, h
    jr   nz, label_27A2D

label_27A0D::
    ld   c, c
    jr   nz, label_27A84
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_27A14::
    rst  $38
    ld   [hl], $20
    ld   [hl], e
    ld   l, b
    ld   l, a

label_27A1A::
    ld   [hl], h

label_27A1B::
    ld   [hl], e
    jr   nz, label_27A8A
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27A7D

label_27A26::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27A96
    ld   l, c
    ld   l, [hl]

label_27A2D::
    ld   h, h
    jr   nz, label_27A9F
    ld   h, [hl]
    jr   nz, label_27A53
    jr   nz, label_27A55
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27AB1
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27A41::
    ld   l, h
    ld   h, h
    jr   nz, label_27A65

label_27A45::
    ld   c, c
    jr   nz, label_27ABC
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_27A4C::
    rst  $38
    dec  [hl]
    jr   nz, label_27AC3
    ld   l, b
    ld   l, a

label_27A52::
    ld   [hl], h

label_27A53::
    ld   [hl], e
    jr   nz, label_27AC2
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27AB5

label_27A5E::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27ACE
    ld   l, c
    ld   l, [hl]

label_27A65::
    ld   h, h
    jr   nz, label_27AD7
    ld   h, [hl]
    jr   nz, label_27A8B
    jr   nz, label_27A8D
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27AE9
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27A79::
    ld   l, h
    ld   h, h
    jr   nz, label_27A9D

label_27A7D::
    ld   c, c
    jr   nz, label_27AF4
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_27A84::
    rst  $38
    inc  [hl]
    jr   nz, label_27AFB
    ld   l, b
    ld   l, a

label_27A8A::
    ld   [hl], h

label_27A8B::
    ld   [hl], e
    jr   nz, label_27AFA
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27AED

label_27A96::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27B06
    ld   l, c
    ld   l, [hl]

label_27A9D::
    ld   h, h
    jr   nz, label_27B0F
    ld   h, [hl]
    jr   nz, label_27AC3
    jr   nz, label_27AC5
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27B21
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27AB1::
    ld   l, h
    ld   h, h
    jr   nz, label_27AD5

label_27AB5::
    ld   c, c
    jr   nz, label_27B2C
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_27ABC::
    rst  $38
    inc  sp
    jr   nz, label_27B33
    ld   l, b
    ld   l, a

label_27AC2::
    ld   [hl], h

label_27AC3::
    ld   [hl], e
    jr   nz, label_27B32
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27B25

label_27ACE::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27B3E
    ld   l, c
    ld   l, [hl]

label_27AD5::
    ld   h, h
    jr   nz, label_27B47
    ld   h, [hl]
    jr   nz, label_27AFB
    jr   nz, label_27AFD
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27B59
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27AE9::
    ld   l, h
    ld   h, h
    jr   nz, label_27B0D

label_27AED::
    ld   c, c
    jr   nz, label_27B64
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_27AF4::
    rst  $38
    ldd  [hl], a
    jr   nz, label_27B6B
    ld   l, b
    ld   l, a

label_27AFA::
    ld   [hl], h

label_27AFB::
    ld   [hl], e
    jr   nz, label_27B6A
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27B5D

label_27B06::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27B76
    ld   l, c
    ld   l, [hl]

label_27B0D::
    ld   h, h
    jr   nz, label_27B7F
    ld   h, [hl]
    jr   nz, label_27B33
    jr   nz, label_27B35
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27B91
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27B21::
    ld   l, h
    ld   h, h
    jr   nz, label_27B45

label_27B25::
    ld   c, c
    jr   nz, label_27B9C
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_27B2C::
    rst  $38
    ld   sp, label_27320
    ld   l, b
    ld   l, a

label_27B32::
    ld   [hl], h

label_27B33::
    ld   [hl], e
    jr   nz, label_27BA2
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27B95

label_27B3E::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27BAE
    ld   l, c
    ld   l, [hl]

label_27B45::
    ld   h, h
    jr   nz, label_27BB7
    ld   h, [hl]
    jr   nz, label_27B6B
    jr   nz, label_27B6D
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_27BC9
    ld   l, b
    ld   l, a
    ld   [hl], l

label_27B59::
    ld   l, h
    ld   h, h
    jr   nz, label_27B7D

label_27B5D::
    ld   c, c
    jr   nz, label_27BD4
    ld   h, c
    ld   l, e
    ld   h, l
    ccf

label_27B64::
    rst  $38
    ld   c, a
    ld   l, b
    jr   nz, label_27BD7
    ld   l, a

label_27B6A::
    ld   hl, label_25920

label_27B6D::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_27B94
    jr   nz, label_27BE5

label_27B76::
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_27BE9
    ld   h, [hl]
    jr   nz, label_27BE3

label_27B7D::
    ld   l, c
    ld   l, h

label_27B7F::
    ld   l, l
    ld   hl, label_2020
    jr   nz, label_27BA5
    ld   b, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_27BF2
    ld   l, a
    ld   [hl], d
    ld   h, a
    ld   h, l
    ld   [hl], h

label_27B91::
    jr   nz, label_27C07
    ld   l, a

label_27B94::
    jr   nz, label_27C02
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_27BFC
    ld   [hl], h

label_27B9C::
    jr   nz, label_27C17
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_27BC3
    jr   nz, label_27BC5

label_27BA5::
    ld   h, c
    ld   l, h
    ld   h, d
    ld   [hl], l
    ld   l, l
    ld   hl, label_248FF
    ld   l, c

label_27BAE::
    ld   hl, label_24920
    ld   e, [hl]
    ld   l, l
    jr   nz, label_27C29
    ld   l, b
    ld   h, l

label_27BB7::
    jr   nz, label_27BD9
    jr   nz, label_27BDB
    jr   nz, label_27C2D
    ld   l, b
    ld   l, a
    ld   [hl], h
    ld   l, a
    ld   h, a
    ld   [hl], d

label_27BC3::
    ld   h, c
    ld   [hl], b

label_27BC5::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020
    jr   nz, label_27C24
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27C33
    jr   nz, label_27C3B

label_27BD4::
    ld   [hl], d
    ld   h, l
    ld   h, c

label_27BD7::
    ld   [hl], h
    jr   nz, label_27BFA
    jr   nz, label_27BFC
    ld   [hl], b
    ld   l, b
    ld   l, a
    ld   [hl], h
    ld   l, a
    jr   nz, label_27C50

label_27BE3::
    ld   l, a
    ld   l, l

label_27BE5::
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_27C36
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_27C55

label_27BF2::
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_27C6B
    ld   l, b
    ld   l, c
    ld   [hl], e

label_27BFA::
    jr   nz, label_27C1C

label_27BFC::
    ld   e, [hl]
    ld   c, b
    ld   h, l
    ld   h, c
    ld   h, h
    ld   [hl], e

label_27C02::
    jr   nz, label_27C59
    ld   [hl], b
    ld   hl, $FF5E
    ld   c, b
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_27C82
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_27C33
    jr   nz, label_27C35
    jr   nz, label_27C37

label_27C17::
    jr   nz, label_27C8B
    ld   h, l
    ld   [hl], b
    ld   [hl], d

label_27C1C::
    ld   h, l
    ld   [hl], e
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_27C9D

label_27C24::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_27C8A

label_27C29::
    ld   h, h
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]

label_27C2D::
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    jr   nz, label_27C54
    jr   nz, label_27C56

label_27C36::
    jr   nz, label_27C58
    ld   [hl], b
    ld   h, l
    ld   [hl], d

label_27C3B::
    ld   h, [hl]
    ld   h, l
    ld   h, e
    ld   [hl], h
    ld   l, h
    ld   a, c
    ld   hl, label_249FF
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_27CAC
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_27CC2
    ld   l, b
    ld   l, c

label_27C50::
    ld   [hl], e
    jr   nz, label_27C73
    ld   l, a

label_27C54::
    ld   l, [hl]

label_27C55::
    ld   h, l

label_27C56::
    jr   nz, label_27CB6

label_27C58::
    ld   b, e

label_27C59::
    ld   l, h
    ld   l, a
    ld   [hl], e
    ld   h, l
    jr   nz, label_27C7F
    jr   nz, label_27C81
    jr   nz, label_27C83
    ld   b, e
    ld   h, c
    ld   l, h
    ld   l, h
    ld   l, $5E
    jr   nz, label_27CB3

label_27C6B::
    ld   l, l
    ld   l, l
    ld   l, $FF
    ld   c, c

label_27C70::
    ld   e, [hl]
    ld   l, l
    jr   nz, label_27CE8
    ld   l, a
    ld   l, a
    jr   nz, label_27CDB
    ld   l, h
    ld   l, a
    ld   [hl], e
    ld   h, l
    ld   l, $FF
    ld   c, c

label_27C7F::
    jr   nz, label_27CF4

label_27C81::
    ld   l, b

label_27C82::
    ld   l, a

label_27C83::
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_27CEA
    ld   h, c
    ld   h, e

label_27C8A::
    ld   l, e

label_27C8B::
    jr   nz, label_27D02
    ld   [hl], b
    ld   l, $FF
    ld   b, c
    ld   h, c
    ld   h, c
    ld   h, c
    ld   h, c
    ld   h, c
    ld   l, b
    ld   hl, label_249FF
    ld   e, [hl]
    ld   l, l
    jr   nz, label_27D05
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_27D06
    ld   h, c
    ld   h, e
    ld   l, e
    jr   nz, label_27CC9
    ld   [hl], h
    ld   l, a
    jr   nz, label_27D21
    ld   l, b
    ld   h, l
    jr   nz, label_27D24
    ld   [hl], h
    ld   l, a

label_27CB3::
    ld   [hl], d
    ld   h, l
    ld   l, $20
    jr   nz, label_27CD9
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_253FF
    ld   h, l
    ld   h, l
    jr   nz, label_27D30
    ld   h, l
    jr   nz, label_27D32
    ld   h, c
    ld   [hl], h
    ld   h, l

label_27CC9::
    ld   [hl], d
    inc  l
    jr   nz, label_27CED
    jr   nz, label_27D46
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_27D4D
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l

label_27CD9::
    jr   nz, label_27CFB

label_27CDB::
    jr   nz, label_27CFD
    jr   nz, label_27D40
    ld   l, h
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   hl, label_241FF
    ld   [hl], d
    ld   h, l

label_27CE8::
    jr   nz, label_27D63

label_27CEA::
    ld   l, a
    ld   [hl], l
    jr   nz, label_27D61
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ccf
    jr   nz, label_27D14

label_27CF4::
    jr   nz, label_27D16
    jr   nz, label_27D18
    jr   nz, label_27D53
    ld   b, l

label_27CFB::
    ld   d, e
    jr   nz, label_27D1E
    ld   c, [hl]
    ld   c, a
    cp   $41

label_27D02::
    ld   l, b
    jr   nz, label_27D6D

label_27D05::
    ld   l, a

label_27D06::
    ld   [hl], a
    jr   nz, label_27D52
    jr   nz, label_27D77
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_27D30
    jr   nz, label_27D82
    ld   l, c
    ld   h, e

label_27D14::
    ld   [hl], h
    ld   [hl], l

label_27D16::
    ld   [hl], d
    ld   h, l

label_27D18::
    ld   [hl], e
    ld   l, $20
    ld   c, b
    ld   h, l
    ld   a, c

label_27D1E::
    inc  l
    jr   nz, label_27D41

label_27D21::
    inc  hl
    inc  hl
    inc  hl

label_27D24::
    inc  hl
    inc  hl
    ld   hl, label_25720
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_27D8F
    ld   [hl], d
    ld   h, l

label_27D30::
    jr   nz, label_27DAB

label_27D32::
    ld   l, a
    ld   [hl], l
    jr   nz, label_27D9A
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_27DA4
    ld   h, l
    ld   [hl], d
    ld   h, l
    ccf

label_27D40::
    jr   nz, label_27D41
    nop
    nop
    nop
    nop

label_27D46::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27D4D::
    nop
    nop
    nop
    nop
    nop

label_27D52::
    nop

label_27D53::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27D61::
    nop
    nop

label_27D63::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27D6D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27D77::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27D82::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27D8F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27D9A::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27DA4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27DAB::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_27F82::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
