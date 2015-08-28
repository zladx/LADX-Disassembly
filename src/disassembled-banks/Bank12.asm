section "bank12",romx,bank[$0C]
    rlca
    nop
    dec  bc
    rlca
    dec  de
    inc  b

label_30006::
    ccf

label_30007::
    inc  de
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction
    jr   label_3002E
    dec  c
    rla
    dec  c
    dec  hl
    rla
    ld   l, a
    jr   nc, label_3008F
    daa
    scf
    rrca
    ld   e, $01
    scf
    ld   c, $1F
    nop
    ret  nz
    nop
    jr   nz, label_3FE4
    jr   label_30006
    call c, label_FCE8
    jr   z, label_30027
    ld   [label_18E4], sp

label_3002E::
    ld    hl, sp+$B0
    db   $E8 ; add  sp, d
    or   b
    call nc, label_F4E8
    ld   [$B874], sp
    ld    hl, sp+$B0
    jr   nc, label_3FFC
    ld    hl, sp+$00
    ld   a, [$FF00]
    inc  a
    nop
    inc  h
    jr   label_3009F
    inc  a
    ld   e, d
    inc  a
    ld   a, [hl]
    nop
    inc  a
    jr   label_30089

label_3004D::
    jr   label_3008B
    jr   label_3008D
    jr   label_3008F
    jr   label_30091
    jr   label_30093
    jr   label_30095
    jr   label_30097
    jr   label_30075
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf

label_30075::
    nop
    ld   a, a
    ccf
    ld   a, a
    ccf
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_30089::
    nop
    nop

label_3008B::
    nop
    nop

label_3008D::
    nop
    nop

label_3008F::
    nop
    nop

label_30091::
    nop
    inc  e

label_30093::
    nop
    di

label_30095::
    inc  c
    db   $FD ; Undefined instruction

label_30097::
    xor  $FD
    xor  $F3
    inc  c
    inc  e
    nop
    nop

label_3009F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  c
    nop
    rra
    dec  c
    rra
    ld   c, $0F
    rlca
    rra
    dec  bc
    dec  hl
    dec  e
    dec  a
    jr   label_30109
    jr   c, label_3012F
    jr   nc, label_30121
    jr   nc, label_3012B
    jr   nz, label_3012D
    jr   nz, label_3012F
    jr   nz, label_300C1

label_300C1::
    nop
    ccf

label_300C3::
    nop
    rst  $18
    ccf
    ld   [hl], a
    ld    hl, sp+$D8
    ld   [$FF60], a
    add  a, b
    add  a, b
    nop

label_300CE::
    ret  nz
    add  a, b
    ld   [$FFC0], a
    ld   a, [$FFE0]
    ld   a, [label_33570]
    db   $3A ; ldd  a, [hl]
    dec  l
    ld   d, $1D
    ld   c, $23
    inc  e
    ld   e, $00
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  e
    ld   e, $21
    ld   l, $51
    ld   a, $41
    inc  a
    ld   b, d
    nop
    inc  a
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    sbc  a, b

label_30103::
    ld   h, b
    and  [hl]
    ld   a, b
    ld   e, c
    ld   a, $56

label_30109::
    ccf
    add  hl, hl
    rra
    ld   a, [hli]
    dec  e
    dec  d
    ld   c, $15
    ld   c, $0A
    rlca
    ld   a, [bc]
    rlca
    ld   a, [bc]
    rlca
    dec  d
    ld   c, $2B
    inc  e
    ld   d, a
    jr   c, label_300CE
    ld   [hl], b
    ld   bc, label_200
    ld   bc, label_305
    adc  a, d
    rlca
    ld   [hl], l
    adc  a, [hl]
    adc  a, e

label_3012B::
    db   $FC ; Undefined instruction
    ld   [hl], a

label_3012D::
    ld    hl, sp+$8F

label_3012F::
    ld   [hl], b
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    ret  nz
    ccf
    jp   label_C73F
    ccf
    rst  8
    ccf
    sbc  a, a
    ld   a, a
    rra
    rst  $38
    nop
    nop
    nop
    nop
    ccf
    nop
    ccf
    rra
    ccf
    rra
    inc  e
    rrca
    inc  e
    rrca
    ld   c, $07
    ld   c, $07
    rlca
    inc  bc
    rlca
    inc  bc
    inc  bc
    ld   bc, $0103
    ld   bc, $0000
    nop
    nop
    nop
    inc  a
    nop
    ld   a, d
    inc  [hl]
    db   $FD ; Undefined instruction
    ld   a, d
    rst  $38
    ld   a, b
    ld   sp, hl
    ld   d, $99
    ld   h, [hl]
    ld   c, d
    inc  [hl]
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    add  a, d
    nop
    jr   c, label_301C3
    ld   a, h
    ld   e, h
    cp   $3E
    ld   a, a
    ld   a, [hl]
    rst  $38
    rlca
    rst  $38
    inc  bc
    rlca
    ld   bc, label_30103
    ld   b, e
    ld   bc, $0013
    ld   bc, $0100
    nop
    ret  nz
    nop
    ld   h, b
    nop
    ld   [hl], c
    nop
    inc  sp
    nop
    scf
    nop
    ld   [hl], $00
    ld   d, $00
    inc  d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_301C3::
    nop
    nop
    nop
    jr   nc, label_301D8
    jr   nc, label_301DA
    inc  e
    inc  c
    rrca
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_301D8::
    nop
    nop

label_301DA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   [label_1107], sp
    rrca
    inc  de
    rrca
    dec  bc
    rlca
    add  hl, bc
    rlca
    ld   [label_407], sp
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, h

label_30203::
    nop
    ld   d, b
    nop
    ld   [hl], b
    nop
    adc  a, b
    ld   [hl], b
    db   $E4 ; Undefined instruction
    jr   label_30203
    ld   l, b
    rst  $30
    ld   l, d
    ld   a, a
    ld   b, $4E
    jr   nc, label_3028B
    jr   c, label_30263
    jr   nc, label_30257
    inc  c
    ld   e, $00
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   a, [$FF60]
    ld    hl, sp+$70
    cp   h
    ld   a, b
    ld   a, [hl]
    inc  a
    ld   e, [hl]
    inc  a
    cpl
    ld   e, $1F
    ld   b, $07
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_3024E

label_3024E::
    inc  h
    jr   label_30275
    jr   label_3026B
    nop
    nop
    nop
    nop

label_30257::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_30263::
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [hl]

label_3026B::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_30275::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ld   h, $18
    ld   a, [hli]
    inc  d
    ld   d, d
    inc  l
    add  a, h

label_3028B::
    ld   a, b
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0003
    rrca
    ld   bc, label_50F
    rlca
    ld   [bc], a
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_302CA

label_302CA::
    jr   c, label_302DC
    ld   a, a
    jr   nz, label_302CB
    ld   e, e
    db   $FC ; Undefined instruction
    ld   e, e
    ld   a, a
    jr   nz, label_3030D
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop

label_302DC::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $00
    ld   bc, label_1FE
    cp   $FE
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    dec  bc
    rlca
    inc  d
    rrca
    inc  d
    rrca
    ld   h, e
    rra
    or   a

label_3030D::
    ld   a, a
    rst  $20
    ld   a, a
    db   $E3 ; Undefined instruction
    ld   a, a
    xor  e
    ld   [hl], a
    ld   c, b
    scf
    inc  [hl]
    dec  bc
    inc  de
    inc  c
    jr   label_30323
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    ld   h, b

label_30323::
    nop
    sub  a, b
    ld   h, b
    ld   a, [$FF60]
    ld   h, c
    nop
    ld   b, $01
    add  hl, bc
    rlca
    dec  bc
    rlca
    dec  bc
    rlca
    add  hl, bc
    rlca
    inc  b
    inc  bc
    inc  bc
    nop
    ld   h, b
    nop
    sub  a, b
    ld   h, b
    ld   a, [$FF60]
    ld   h, b
    nop
    ld   b, $00
    ld   a, [bc]
    inc  b
    dec  bc
    ld   b, $0A
    rlca
    scf
    rrca
    ld   d, [hl]
    cpl
    ld   [hl], h
    cpl
    ld   l, [hl]
    dec  a
    ld   l, d
    dec  a
    ld   e, e
    inc  a
    ld   c, e
    inc  a
    dec  l
    ld   e, $26
    rra
    inc  de
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  bc
    ld   bc, $0107
    rrca
    inc  bc
    ld   a, $07
    ld   a, l
    ld   e, $7D
    ld   e, $3E
    rlca
    rrca
    inc  bc
    rlca
    ld   bc, $0103
    inc  bc
    nop
    ld   bc, $0000
    nop
    ld   [bc], a
    inc  bc
    dec  b
    ld   b, $0B
    inc  c
    rla
    jr   label_303B6
    inc  sp
    db   $3A ; ldd  a, [hl]
    ld   h, $34
    inc  l
    jr   c, label_303C8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_303A6

label_303A6::
    jr   c, label_303B8
    ld   e, $08
    dec  c
    ld   b, $0B
    rlca
    rlca
    inc  bc
    rlca
    inc  bc
    dec  bc
    rlca
    dec  c
    ld   b, $1E
    ld   [label_1038], sp
    jr   nc, label_303BC

label_303BC::
    nop

label_303BD::
    nop
    nop
    nop
    ret  nz
    nop
    ld   [rLCDC], a
    ld   [hl], b
    jr   nz, label_303EF
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_303D8

label_303D8::
    jr   z, label_303EA
    ld   [hl], b
    jr   nz, label_303BD
    ld   b, b
    ret  nz
    nop
    nop
    nop
    inc  a
    nop
    ld   e, d
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    inc  a

label_303EA::
    ld   e, d
    inc  a
    inc  a
    nop
    nop

label_303EF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    ld   a, b
    rst  $38
    add  a, a
    rst  $38
    add  a, h
    ld   a, a
    ld   b, h
    ld   l, l
    ld   e, [hl]
    ld   a, [hl]
    ld   b, e
    ld   a, a
    ld   b, c
    cp   $82
    db   $FC ; Undefined instruction
    add  a, h
    ld   a, b
    ld   c, b
    jr   nc, label_3044C
    nop
    nop
    nop
    nop
    inc  e
    inc  e
    ld   a, $22
    ld   a, [hl]
    ld   b, d
    db   $FC ; Undefined instruction
    add  a, h
    db   $EC ; Undefined instruction
    sub  a, h
    sbc  a, $E2
    cp   a
    pop  bc
    rst  $38
    add  a, c
    rst  $18
    pop  hl
    scf
    add  hl, sp
    ld   c, $0E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rra
    db   $10 ; Undefined instruction
    daa
    ccf
    jr   z, label_30488
    daa
    inc  a
    jr   nc, label_3048C
    ccf
    ccf
    dec  sp
    ccf
    jr   c, label_30492
    db   $3A ; ldd  a, [hl]
    cpl
    jr   c, label_30496
    cpl
    inc  e
    db   $10 ; Undefined instruction
    rrca
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    ld   a, [$FF10]
    ld    hl, sp+$C8
    ld    hl, sp+$28
    ld    hl, sp+$C8
    ld   a, b
    jr   label_30465
    ld    hl, sp+$F8

label_3046F::
    cp   b
    ld    hl, sp+$38
    ld    hl, sp+$B8
    db   $E8 ; add  sp, d
    jr   c, label_3046F
    db   $E8 ; add  sp, d
    ld   [hl], b
    db   $10 ; Undefined instruction
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_304BE
    inc  l
    inc  [hl]

label_30488::
    cpl

label_30489::
    inc  sp
    rst  $38
    ld   a, [$FF9F]
    db   $EC ; Undefined instruction
    sbc  a, a
    db   $E3 ; Undefined instruction
    ld   c, a
    ld   [hl], b

label_30492::
    rst  $38
    rst  $38
    sbc  a, a
    ld   [$FF9F], a
    ld   [rVBK], a
    ld   [hl], b
    scf
    jr   c, label_304AC
    rrca
    nop
    nop
    inc  e
    inc  e
    ld   a, $22
    ccf
    ld   sp, label_191F
    rst  $38
    rst  $38
    cp   $1A

label_304AC::
    cp   $6A
    cp   $92
    ld   a, [$FC66]
    add  a, h
    db   $F4 ; Undefined instruction
    inc  c
    db   $E8 ; add  sp, d
    jr   label_30489
    jr   nc, label_3051B
    ld   [$FF80], a
    add  a, b

label_304BE::
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ld   [$FF60], a
    ld   a, [$FF90]
    ld   a, [$FF90]
    ld   a, [$FF10]
    ld   [rNR41], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b

label_304F8::
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    rlca
    rlca
    rlca
    inc  b
    inc  bc
    inc  bc
    ld   [bc], a
    inc  bc
    dec  c
    ld   c, $13
    inc  e
    cpl
    inc  [hl]
    ccf
    inc  h
    ld   e, a
    ld   l, a
    ld   e, a
    ld   [hl], b
    ld   a, a
    ld   h, a
    ld   a, a
    ld   d, a
    ld   a, a
    ld   d, b
    ccf

label_3051B::
    ld   h, $1F
    rra
    nop
    nop
    ld   [$FFE0], a
    ld   [rNR41], a
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    or   b
    ld   [hl], b
    ret  z
    jr   c, label_30521
    inc  l
    db   $FC ; Undefined instruction
    inc  h
    ld   a, [$FAF6]
    ld   c, $FE
    ld   h, [hl]
    cp   $6A
    cp   $0A
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    ld    hl, sp+$F8
    nop
    nop
    ld   bc, label_F01
    ld   c, $1B
    rla
    ld   sp, label_2C2F
    ccf
    ldd  [hl], a
    inc  sp
    rlca
    dec  b
    rrca
    ld   [label_1916], sp
    add  hl, de
    ld   d, $1F
    db   $10 ; Undefined instruction
    add  hl, de
    add  hl, de
    ld   d, $0F
    ld   [label_707], sp
    nop
    nop
    ret  nz
    ret  nz
    ld   [hl], b
    ld   a, [$FF98]
    db   $E8 ; add  sp, d
    inc  c
    db   $F4 ; Undefined instruction
    inc  [hl]
    db   $FC ; Undefined instruction
    ld   c, h
    call z, label_A0E0
    ld   a, [$FF10]
    ld   l, b
    sbc  a, b
    sbc  a, b
    ld   l, b
    ld    hl, sp+$08
    ld   l, b
    sbc  a, b
    sbc  a, b
    ld   l, b
    ld   a, [$FF10]
    ld   [$FFE0], a
    nop
    nop
    rlca
    rlca
    inc  c
    rrca
    ld   c, $0B
    rrca
    dec  c
    rra
    ld   [de], a
    cpl
    inc  sp
    daa
    ld   a, $35
    ld   a, $1C
    rra
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, label_203
    inc  bc
    ld   [bc], a
    inc  bc
    inc  bc
    nop
    nop
    add  a, b
    add  a, b
    ld   a, b
    ld    hl, sp+$C4
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    sbc  a, h
    db   $E4 ; Undefined instruction
    sbc  a, h
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    ld    hl, sp+$38
    sub  a, b
    ld   [hl], b
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    ccf
    ccf
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   h, b
    ld   a, a
    ld   d, d
    ld   a, a
    ld   c, a
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, c
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ccf
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $02
    cp   $02
    cp   $02
    cp   $06
    cp   $4A
    cp   $F2
    cp   $C2
    cp   $82
    cp   $02
    cp   $02
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    inc  bc

label_3060F::
    inc  bc
    inc  bc
    ld   [bc], a
    rlca
    inc  b
    rrca
    ld   [label_101F], sp
    dec  sp
    inc  h
    ld   [hl], $29
    rra
    rra
    nop
    nop
    inc  e
    inc  e
    inc  e
    inc  d
    inc  [hl]
    inc  l
    jr   c, label_30650
    ld   l, b
    ld   e, b
    ld   a, [$FFD0]
    ld   a, [$FF30]
    ld   a, [$FF90]
    ld   a, [$FF50]
    ld   [rNR41], a
    and  b
    ld   h, b
    ret  nz
    ld   b, b
    ld   b, b
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    inc  c
    inc  e
    inc  d
    inc  e
    inc  d
    inc  a
    inc  h

label_30650::
    ld   a, $22
    ld   a, $2E
    jr   c, label_3067E
    inc  a
    inc  h
    rra
    inc  de
    rrca
    ld   [label_707], sp
    nop
    nop
    jr   label_3067A
    inc  a
    inc  h
    ld   a, h
    ld   d, h
    ld   a, b
    ld   c, b
    ld   [hl], b
    ld   d, b
    ld   [hl], b
    ld   d, b
    ld   [hl], b
    ld   d, b
    ld   a, b
    ld   c, b
    jr   c, label_3069A
    jr   c, label_3069C
    jr   c, label_3069E
    ld   a, b
    ld   c, b
    ld   a, [$FF90]

label_3067A::
    ld   [rNR41], a
    ret  nz
    ret  nz

label_3067E::
    nop
    nop
    inc  bc
    inc  bc
    rrca
    ld   c, $0F
    dec  bc
    ld   e, $1E
    inc  e
    inc  d
    inc  a
    inc  a
    jr   c, label_306B6
    jr   c, label_306C8
    ld   a, h
    ld   b, h
    sub  a, $8A
    or   $8A
    rst  0
    cp   e
    ld   a, a
    ld   b, [hl]

label_3069A::
    dec  sp
    dec  sp

label_3069C::
    nop
    nop

label_3069E::
    nop
    nop
    ld    hl, sp+$F8
    cp   $AE
    cp   $FA
    rrca
    rrca
    rlca
    dec  b
    rlca
    rlca
    rlca
    dec  b
    rlca
    rlca
    rlca
    dec  b
    rrca
    rrca
    ld   a, $3A

label_306B6::
    cp   $EE
    ld    hl, sp+$B8
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rrca
    ld   [label_90F], sp
    rrca
    ld   a, [bc]
    rrca
    ld   c, $0F
    rrca
    rrca
    rrca
    rrca
    rrca
    rlca
    ld   b, $03
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   [rNR41], a
    ld   [rNR41], a
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   a, [$FFF0]
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   [rNR41], a
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    ld   b, $05
    dec  c
    dec  bc
    ld   c, $0B
    ld   c, $0B
    ld   c, $0B
    rrca
    add  hl, bc
    rra
    inc  d
    dec  sp

label_30715::
    daa
    ld   [hl], h
    ld   c, h
    db   $E8 ; add  sp, d
    sbc  a, b
    ret  nc
    or   b
    ld   h, b
    ld   h, b
    nop
    nop
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    inc  b
    ld   a, [hl]
    db   $F2 ; Undefined instruction
    xor  $9A
    adc  a, [hl]
    ld   a, d
    ld   c, $FA
    ld   a, [de]
    or   $34
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    ret  c
    ret  nc
    jr   nc, label_30715
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    inc  b
    ld   [label_100B], sp
    rlca
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rNR41], a
    db   $10 ; Undefined instruction
    ld   [label_8E0], sp
    ld   [$FF08], a
    rlca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_700], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$FF08], a
    ld   [$FF08], a
    ret  nc
    ld   [label_1020], sp
    nop
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_30788

label_30788::
    stop
    jr   z, label_3078C

label_3078C::
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_30798

label_30798::
    stop
    jr   z, label_3079C

label_3079C::
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, c
    nop
    ld   h, e
    nop
    ld   [hl], a
    nop
    ld   a, $00
    inc  e
    nop
    ld   [$0000], sp
    nop
    nop
    nop
    ld   [label_1C00], sp
    nop
    ld   a, $00
    ld   [hl], a
    nop
    ld   h, e
    nop
    ld   b, c
    nop
    nop
    nop
    ld   c, $00
    inc  e
    nop
    jr   c, label_307E6

label_307E6::
    ld   [hl], b
    nop
    jr   c, label_307EA

label_307EA::
    inc  e
    nop
    ld   c, $00
    nop
    nop
    ld   [hl], b
    nop
    jr   c, label_307F4

label_307F4::
    inc  e
    nop
    ld   c, $00
    inc  e
    nop
    jr   c, label_307FC

label_307FC::
    ld   [hl], b
    nop
    nop
    nop
    nop
    nop
    ld   b, $06
    inc  c
    inc  c
    ld   [label_1808], sp
    jr   label_3083F
    inc  l
    ld   a, [hl]
    ld   a, [hl]
    ld   l, [hl]
    sbc  a, a
    rst  $28
    sbc  a, a
    adc  a, l
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   a, d
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    jr   label_30858
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    inc  e
    ldi  [hl], a
    ldi  [hl], a
    ld   e, a
    ld   b, c
    rst  $38
    db   $ED ; Undefined instruction
    rst  $18
    cp   l
    xor  e
    sbc  a, e
    xor  b
    sbc  a, b
    db   $E8 ; add  sp, d
    sbc  a, b
    res  7, e
    sbc  a, l
    db   $FD ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   [hl], e
    ld   b, c
    ld   a, $22
    inc  e
    inc  e
    nop

label_3083F::
    nop
    jr   label_3085A
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    rst  $28
    rst  $20
    rst  $38
    cp   l
    ld   a, [hl]
    ld   b, d

label_30858::
    inc  a
    inc  a

label_3085A::
    inc  h
    inc  a
    inc  h
    inc  a
    jr   label_30878
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $20
    rst  $20
    rst  $38
    cp   l
    rst  $38
    add  a, c
    rst  $38
    cp   l
    rst  $20
    cp   l
    rst  $20
    cp   l
    rst  $20
    cp   l
    rst  $38
    sbc  a, c
    ld   a, [hl]
    ld   b, d

label_30878::
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, $0E
    ld   e, $12
    ld   a, $26
    ld   a, d
    ld   c, d
    ld   [hl], d
    ld   d, d
    ld   [hl], d
    ld   d, d
    ld   [hl], d
    ld   d, d
    ld   [hl], d
    ld   d, d
    ld   [hl], d
    ld   d, d
    ld   [hl], d
    ld   d, d
    ld   a, d
    ld   c, d
    ld   a, $26
    ld   e, $12
    ld   c, $0E
    nop
    nop
    ld   [label_1408], sp
    inc  d
    ld   a, [hli]
    ldi  [hl], a
    ld   d, l
    ld   c, c
    ld   h, e
    ld   e, l
    ld   [hl], $3E
    ld   [label_808], sp
    ld   [label_1010], sp
    db   $10 ; Undefined instruction
    ld   [label_1C08], sp
    inc  e
    db   $3A ; ldd  a, [hl]
    ld   h, $22
    ld   a, $22
    ld   a, $3E
    ld   a, $1C
    inc  e
    ld   a, $22
    ld   a, a
    ld   h, e
    ld   a, a
    ld   b, c
    ldi  [hl], a
    ld   a, $1C
    inc  e
    ld   a, $22
    ld   a, $36
    inc  e
    inc  e
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e
    inc  e
    nop
    nop
    nop
    nop
    db   $DB
    db   $DB
    rst  $38
    and  l
    db   $DB
    and  l
    halt
    inc  a
    inc  a
    inc  [hl]
    inc  l
    halt
    push de
    adc  a, e
    db   $83
    add  a, e
    db   $FD ; Undefined instruction
    add  a, e
    db   $FD ; Undefined instruction
    add  a, e
    xor  c
    rst  $10
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    ld   c, $0E
    rra
    ld   de, label_213F
    ccf
    add  hl, hl
    ld   a, a
    ld   b, c
    ld   a, l
    ld   d, e
    db   $FD ; Undefined instruction
    add  a, e
    ld   sp, hl
    sub  a, a
    ld   a, [$F286]
    xor  [hl]
    db   $E4 ; Undefined instruction
    sbc  a, h
    adc  a, h
    db   $FC ; Undefined instruction
    halt
    ld   c, $0E
    nop
    nop
    rlca
    rlca
    add  hl, bc
    rrca
    ld   de, label_211F
    ccf
    add  hl, sp
    daa
    ld   [hl], l
    ld   c, e
    ld   [hl], a
    ld   c, c
    ld   l, a
    ld   d, c
    ld   l, [hl]
    ld   d, [hl]
    ld   e, [hl]
    ld   h, d
    ld   e, h
    ld   h, h
    ld   a, b
    ld   a, b
    ld   [hl], b
    ld   d, b
    ld   [hl], b
    ld   d, b
    ld   [hl], b
    ld   d, b
    jr   nz, label_30960
    inc  e
    inc  e
    db   $3A ; ldd  a, [hl]
    ld   h, $7D
    ld   e, e
    ld   a, l

label_30947::
    ld   e, e
    ld   a, l
    ld   e, e
    ld   a, e
    ld   b, a
    ccf
    dec  a
    ccf
    dec  h
    ld   a, a
    ld   e, c
    ld   a, a
    ld   b, c
    rst  $38
    add  a, c
    rst  $38
    sub  a, c
    rst  $28
    xor  c
    rst  0
    push bc
    inc  bc
    inc  bc
    nop
    nop

label_30960::
    nop
    nop
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   b, d
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  h
    inc  a
    inc  h
    inc  a
    inc  a
    rst  $38
    rst  $20
    rst  $38
    and  l
    db   $DB
    cp   l
    jp   label_E7BD
    sbc  a, c
    ld   a, [hl]
    ld   b, d
    inc  a
    inc  h
    jr   label_30996
    nop
    nop
    nop
    nop
    ld   a, a
    ld   a, a
    ld   e, a
    ld   b, c
    ld   a, a
    ld   b, c
    ccf
    ccf
    rra
    dec  d
    rra
    dec  e
    rra
    dec  d
    rra
    dec  d
    ccf
    dec  a
    ld   a, a
    ld   b, c

label_30996::
    rst  $38
    add  a, c
    rst  $38
    add  a, l
    ld   a, e
    ld   a, e
    nop
    nop
    nop
    nop
    ld   bc, label_1A01
    ld   a, [de]
    ccf
    daa
    ld   b, c
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, c
    ld   a, a
    daa
    ld   a, $1F
    jr   label_309B8
    inc  b
    rrca
    add  hl, bc
    rrca
    ld   a, [bc]
    rlca
    inc  b

label_309B8::
    inc  bc
    inc  bc
    ld   b, $05
    rlca
    rlca
    nop
    nop
    add  a, b
    add  a, b

label_309C2::
    ld   [hl], b
    ld   [hl], b
    jr   nc, label_30A36
    jr   label_30A40
    jr   label_309C2
    sub  a, b
    ld   [hl], b

label_309CC::
    or   b
    ld   [hl], b
    ld   b, b
    ret  nz
    ld   [hl], h
    db   $FC ; Undefined instruction
    ld   a, h
    db   $F4 ; Undefined instruction
    ld   a, h
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$C8
    jr   nc, label_309CC
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    ld   b, $06
    ld   c, $0A
    ld   e, $1E
    ld   [hl], $22
    ld   a, a
    ld   a, c
    ld   a, a
    ld   b, l
    rst  8
    add  a, e
    rst  $38
    add  a, c
    rst  $28
    sbc  a, l
    rst  $38
    cp   l
    cp   $A2
    db   $FC ; Undefined instruction
    cp   h
    ld   [$FFA0], a
    ret  nz
    ret  nz
    nop
    nop
    ld   a, [hl]
    ld   a, [hl]
    ld   c, [hl]
    ld   b, d
    ld   a, [hl]
    ld   a, [hl]
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    inc  l
    inc  h
    ld   a, [hl]
    ld   b, d
    rst  8
    add  a, c
    and  l
    rst  $18
    adc  a, l
    rst  $38
    cp   c
    rst  $38
    ld   b, d
    ld   a, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_30A35

label_30A35::
    inc  a

label_30A36::
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    inc  a
    nop
    inc  a
    nop
    nop

label_30A40::
    nop
    nop
    nop
    nop
    rrca
    rrca
    rla
    add  hl, de
    dec  l
    inc  sp
    ld   e, d
    ld   h, [hl]
    or   h
    call z, label_88F8
    ld    hl, sp+$88
    or   h
    call z, label_3265A
    dec  l
    inc  sp
    rla
    add  hl, de
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    jr   c, label_30A8E
    ld   a, h
    ld   b, h
    cp   $C6
    cp   $AA
    cp   $92
    cp   $92
    cp   $92
    cp   $92
    cp   $AA
    cp   $C6
    ld   a, h
    ld   b, h
    jr   c, label_30AA4
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_30A8E::
    nop
    nop
    nop
    nop
    ld   l, h
    ld   l, h
    sub  a, d
    cp   $AA
    sub  a, $BA
    add  a, $54
    ld   l, h
    jr   z, label_30AD6
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop

label_30AA4::
    inc  e
    inc  e
    ld   a, $22
    ld   [hl], c
    ld   c, a
    ld   h, b
    ld   e, a
    ld   h, b
    ld   e, a
    ld   b, b
    ld   a, a
    jr   nz, label_30AF1
    db   $10 ; Undefined instruction
    ld   [label_40F], sp
    rlca
    ld   [bc], a
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    ld   a, $1C
    ld   a, a
    ld   a, $FF
    ld   a, a
    rst  $38
    ld   a, c
    ld   sp, hl
    halt
    ld   [hl], a
    ld    hl, sp+$77
    ld   a, h
    dec  sp
    ld   a, $1D

label_30AD6::
    rra
    ld   c, $0F
    rlca
    rlca
    inc  bc
    inc  bc
    ld   bc, $0001
    jr   label_30AFA
    inc  a
    inc  h
    inc  a
    inc  a
    ld   b, d
    ld   a, [hl]
    and  c
    rst  $18
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    add  a, a
    reti

label_30AF1::
    add  a, a

label_30AF2::
    reti
    add  a, a
    ld   sp, hl
    add  a, a
    ld   a, d
    ld   b, [hl]
    ld   [hl], d
    ld   c, [hl]

label_30AFA::
    inc  h
    inc  a
    jr   label_30B16
    nop
    nop
    nop
    nop
    inc  a
    inc  a
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    jr   label_30B2C
    jr   c, label_30B4E

label_30B16::
    jr   label_30B30
    jr   label_30B32
    jr   label_30B34
    jr   label_30B36
    nop
    nop
    nop
    nop
    inc  a
    inc  a
    ld   h, [hl]
    ld   h, [hl]
    ld   b, $06
    inc  a
    inc  a
    ld   h, b
    ld   h, b

label_30B2C::
    ld   a, [hl]
    ld   a, [hl]
    nop
    nop

label_30B30::
    nop
    nop

label_30B32::
    inc  a
    inc  a

label_30B34::
    ld   h, [hl]
    ld   h, [hl]

label_30B36::
    inc  c
    inc  c
    ld   b, $06
    ld   h, [hl]
    ld   h, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    inc  c
    inc  c
    inc  e
    inc  e
    inc  a
    inc  a
    ld   l, h
    ld   l, h
    ld   a, [hl]
    ld   a, [hl]
    inc  c
    inc  c

label_30B4E::
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, h
    ld   h, b
    ld   h, b
    ld   a, h
    ld   a, h
    ld   b, $06
    ld   b, $06
    ld   a, h
    ld   a, h
    nop
    nop
    nop
    nop
    inc  a
    inc  a
    ld   h, b
    ld   h, b
    ld   a, h
    ld   a, h
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    ld   a, [hl]
    ld   a, [hl]
    ld   b, $06
    inc  c
    inc  c
    jr   label_30B92
    jr   label_30B94
    jr   label_30B96
    nop
    nop
    nop
    nop
    inc  a
    inc  a
    ld   h, [hl]
    ld   h, [hl]
    inc  a
    inc  a
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop

label_30B92::
    inc  a
    inc  a

label_30B94::
    ld   h, [hl]
    ld   h, [hl]

label_30B96::
    ld   h, [hl]
    ld   h, [hl]
    ld   a, $3E
    ld   b, $06
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    jr   nc, label_30BD4
    jr   nc, label_30BD6
    jr   nc, label_30BD8
    inc  sp
    inc  sp
    jr   nc, label_30BDC
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    inc  sp
    inc  sp
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, d
    ld   a, d
    ld   a, d
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, d
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    ld   [hl], e
    ld   [hl], e

label_30BD4::
    ld   c, d
    ld   c, d

label_30BD6::
    ld   c, d
    ld   c, d

label_30BD8::
    ld   [hl], d
    ld   [hl], d
    ld   c, d
    ld   c, d

label_30BDC::
    ld   c, d
    ld   c, d
    ld   [hl], d
    ld   [hl], d
    nop
    nop
    ret  nz
    ret  nz
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    ld   h, b
    ld   h, b
    db   $FC ; Undefined instruction
    sbc  a, h
    cp   $92
    ld   l, a
    ld   l, c
    rrca
    add  hl, bc
    ld   a, a
    ld   a, l
    cp   $82
    cp   $AA
    cp   $82
    ld   a, h
    ld   a, h
    jr   c, label_30C40
    jr   c, label_30C42
    ld   a, $2E
    ld   a, $2A
    ld   a, $3E
    nop
    nop
    rrca
    rrca
    rra
    ld   de, label_253F
    ccf
    ld   hl, label_213F
    cp   $E2
    db   $FC ; Undefined instruction
    sbc  a, h
    ld   a, b
    ld   c, b
    jr   c, label_30C5C
    jr   c, label_30C6E
    jr   c, label_30C60
    jr   c, label_30C62
    ld   a, b
    ld   e, b
    ld   a, h
    ld   b, h
    ld   a, h
    ld   a, h

label_30C40::
    nop
    nop

label_30C42::
    ld   h, [hl]
    ld   h, [hl]
    rst  $38
    sbc  a, c
    rst  $38
    add  a, c
    rst  $38
    and  l
    rst  $38
    and  l
    rst  $38
    add  a, c
    rst  $38
    sbc  a, c
    ld   a, [hl]
    ld   b, d
    inc  a
    inc  a
    jr   c, label_30C7E
    jr   c, label_30C80
    inc  a
    inc  l
    ld   a, $2A

label_30C5C::
    ld   a, $2A
    ld   a, $3E

label_30C60::
    nop
    nop

label_30C62::
    inc  bc
    inc  bc
    ld   a, a
    ld   a, l
    rst  $38
    sub  a, c
    rst  $38
    sub  a, l
    rst  $38
    or   c
    rst  $38
    and  c

label_30C6E::
    cp   $FE
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e
    inc  d
    rra
    rla
    rra
    dec  d
    ld   a, a
    ld   [hl], a
    ld   a, h
    ld   d, h

label_30C7E::
    ld   a, h
    ld   a, h

label_30C80::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    or   $F6
    or   $F6
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    inc  e
    inc  e
    inc  a
    inc  h
    halt
    halt
    rst  $28
    sub  a, c
    rst  $28
    sub  a, c
    rst  $28
    sub  a, c
    rst  $28
    rst  $10
    ld   l, h
    ld   d, h
    rst  $28
    rst  $10
    rst  $28
    sub  a, c
    ld   l, [hl]
    ld   d, d
    inc  a
    inc  a
    db   $10 ; Undefined instruction
    jr   label_30CD8
    nop
    nop
    nop
    nop
    cp   $FE
    cp   $82
    cp   $FE
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, h
    nop
    sub  a, d
    nop
    add  a, d

label_30CD8::
    nop
    add  a, d
    nop
    ld   b, h
    nop
    jr   z, label_30CDF

label_30CDF::
    stop
    nop
    ld   h, b
    ld   l, h
    sub  a, b
    db   $F2 ; Undefined instruction
    and  b
    jp   nc, label_C2B0
    ld   d, b
    ld   h, h
    jr   nz, label_30D26
    db   $10 ; Undefined instruction
    nop
    nop
    rrca
    rrca
    ld   de, label_2111
    ld   hl, label_30947
    ld   c, [hl]
    ld   [hl], d
    ld   c, h
    ld   [hl], h
    ld   a, b
    ld   a, b
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  b
    inc  b
    dec  a
    dec  a
    ld   b, e
    ld   b, d
    sub  a, a
    sub  a, l
    ld   e, $1E
    rla
    ld   de, label_253F
    rst  $38
    rst  $18
    ld   a, [$FFB0]
    ld   a, [$FF50]
    ld    hl, sp+$98
    ld    hl, sp+$18
    nop
    nop
    rlca
    rlca
    ld   a, [de]
    jr   label_30D4C
    ldi  [hl], a
    dec  sp
    ld   h, $56
    ld   c, [hl]
    ld   d, l
    ld   c, h
    cp   e
    adc  a, c
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   b, b
    ld   b, b
    ld   h, b
    ld   h, b
    ret  nc
    ld   d, b
    ret  c
    sbc  a, b
    ld   [hl], h
    sub  a, h
    nop
    nop
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    ld   e, $1C
    dec  sp
    daa

label_30D4C::
    ld   [hl], a
    ld   c, a
    ld   l, a
    ld   e, [hl]
    ld   b, $06
    ld   a, e
    ld   a, c
    rst  8
    add  a, l
    ld   e, $02
    ld   a, $02
    cp   d
    ld   b, $DA
    add  a, [hl]
    ld   [hl], h
    ld   c, h
    inc  a
    inc  a
    ld   b, h
    ld   b, h
    ld   e, a
    ld   c, a
    ld   h, b
    ld   b, c
    ccf
    daa
    ld   a, [de]
    jr   label_30D77
    nop
    ld   a, [bc]
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz

label_30D77::
    ld   b, b
    ld   h, b
    and  b
    or   b
    ret  nc
    ret  c
    ld   l, b
    xor  h
    inc  [hl]
    ld   bc, label_301
    ld   [bc], a
    rlca
    ld   b, $0F
    add  hl, bc
    rra
    jr   label_30DCA
    inc  h
    ld   a, a
    ld   h, d
    rst  $38
    sub  a, c
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ld   [rNR41], a
    ld   a, [$FF10]
    ld    hl, sp+$88
    db   $FC ; Undefined instruction
    ld   b, h
    cp   $26
    ld   sp, hl
    add  hl, sp
    ld   b, $06
    dec  b
    dec  b
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    rlca
    dec  b
    rlca
    dec  b
    ld   c, $0A
    or   b
    or   b
    ld   e, h
    ld   e, h
    db   $F2 ; Undefined instruction
    ld   [de], a
    jp   [hl]
    xor  c
    push hl
    dec  h
    di
    db   $D3 ; Undefined instruction
    ld   [hl], b
    ld   d, b
    jr   c, label_30DE8
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101F], sp
    inc  [hl]
    ld   a, [hli]

label_30DCA::
    ld   h, c
    ld   e, l
    ld   b, e
    ld   a, e
    ld   b, a
    ld   [hl], a
    nop
    nop
    ld   a, [$FFF0]
    jr   c, label_30E0E
    ld   [hl], h
    ld   [hl], h
    ld   a, [$D9FA]
    reti
    push hl
    push hl
    ld   h, e
    ld   h, e
    nop
    nop
    rlca
    rlca
    jr   label_30DFE
    daa
    jr   nz, label_30E48
    ld   b, c
    ld   e, [hl]
    ld   b, d
    ld   e, a
    ld   b, e
    ld   h, a
    ld   h, c
    inc  e
    inc  e
    ld   [label_316EA], a
    ld   d, d
    xor  h
    and  h
    ld   e, h
    ld   c, h
    cp   d
    sub  a, d
    ld   a, d
    ldi  [hl], a

label_30DFE::
    and  $C6
    cp   a
    cp   d
    xor  a
    xor  h
    adc  a, a
    add  a, b
    sbc  a, a
    add  a, e
    db   $FD ; Undefined instruction
    add  a, $7F
    ld   h, b
    rst  $38
    ld   a, a

label_30E0E::
    rst  $38
    sbc  a, a
    ld    hl, sp+$78
    ld   a, [$FF30]
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [rNR41], a
    ld    hl, sp+$60
    db   $FC ; Undefined instruction
    ret  nz
    ld    hl, sp+$80
    add  a, a
    add  a, d
    ld   a, [hl]
    ld   a, l
    inc  de
    inc  e
    ld   de, label_381E
    rrca
    ld   a, b
    rrca
    ld   a, a
    rlca
    ccf
    nop
    sub  a, a
    ld   [hl], a
    rst  $38
    dec  d
    rla
    rst  $38
    call nc, label_3C3C
    ld    hl, sp+$7E
    ret  nz
    cp   $80
    db   $FC ; Undefined instruction
    nop
    ld   l, [hl]

label_30E41::
    ld   e, [hl]
    halt
    add  hl, hl
    daa
    ld   [hl], e
    jr   nz, label_30E41
    db   $10 ; Undefined instruction
    inc  c
    ld   a, a
    inc  bc
    rra
    nop
    ld   [hl], h
    inc  l
    cp   b
    ld   l, b
    ld    hl, sp+$D0
    call c, label_1E10

label_30E59::
    db   $10 ; Undefined instruction
    jr   nz, label_30E59
    ret  nz
    ld    hl, sp+$00
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ccf
    dec  [hl]
    jp   z, label_CF55
    ld   a, a
    ld   a, a
    ld   [hl], b
    or   [hl]
    ld   a, [de]
    xor  d
    ld   c, $A7
    dec  b
    and  l
    rlca
    and  l
    rlca
    db   $FD ; Undefined instruction
    ld   e, e
    dec  bc
    or   $FE
    db   $FC ; Undefined instruction
    rst  $38
    adc  a, c
    ld   a, [hl]
    ld   c, [hl]
    or   e
    di
    sbc  a, a
    cp   $BA
    rst  0
    rst  0
    ld   a, a
    ld   a, a
    jr   c, label_30EAE
    nop
    rst  8
    rst  8
    ld   a, a
    ld   a, c
    ld   sp, hl
    rst  8
    rst  8
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [$FFFC]
    add  a, b
    ld    hl, sp+$00
    ret  nz
    nop
    ld   c, $0A
    inc  e
    inc  d
    inc  e
    inc  d
    ld   a, a
    jr   z, label_30EA8
    cpl
    rst  $18
    ld   b, b
    rst  $38
    ld   a, a

label_30EAE::
    ld   a, a
    nop
    jr   c, label_30EDA
    inc  e
    inc  d
    inc  e
    inc  d
    cp   $08
    rst  $38
    cp   $FF
    ld   [bc], a
    rst  $38
    cp   $FE
    nop
    rst  8
    ld   l, a
    db   $5D
    ld   e, l
    cp   $7E
    and  $66
    pop  de
    ld   [hl], c
    ld   l, b
    jr   c, label_30F44
    rra
    ccf
    rrca
    sub  a, l
    sub  a, a
    adc  a, e
    adc  a, [hl]
    ld   d, a
    ld   e, h
    ld   l, $38
    ld   e, [hl]
    ld   [hl], b

label_30EDA::
    cp   h
    ld   [$FF78], a
    ret  nz
    ld   [$FF80], a
    ld   e, b
    ld   e, b
    ld   h, a
    ld   h, a
    ld   e, b
    ld   e, b
    ld   b, a
    ld   c, a
    ret  nz
    ld   e, c
    ld   [$FF33], a
    ld   sp, hl
    ld   e, $7F
    rlca
    ld   a, [de]
    ld   a, [de]
    and  $E6
    ld   a, [de]
    ld   e, $F2
    cp   $F7
    ld   a, $E7
    inc  a
    rst  $38
    ld   a, b
    cp   $E0
    nop
    nop
    inc  bc
    inc  bc
    inc  b
    rlca
    ld   [label_100F], sp
    rra
    jr   nz, label_30F4B
    ld   [hl], c
    ld   c, [hl]
    ld   e, e
    ld   h, h
    ld   c, [hl]
    ld   [hl], c
    ld   b, h
    ld   a, e
    ld   b, h
    ld   a, e
    ld   b, h
    ld   a, e
    ld   b, h
    ld   a, e
    inc  h
    dec  sp
    jr   label_30F3D
    rlca
    rlca
    nop
    nop
    ld   [$FFE0], a
    sub  a, b
    ld   [hl], b
    adc  a, b
    ld   a, b
    add  a, h
    ld   a, h
    add  a, d
    ld   a, [hl]
    push bc
    dec  sp
    ld   l, l
    sub  a, e
    add  hl, sp
    rst  0
    ld   de, label_11EF
    rst  $28
    ld   de, label_11EF
    rst  $28
    ld   [de], a
    xor  $0C

label_30F3D::
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    nop
    nop
    ld   bc, label_32301
    ld   h, d
    ld   [hl], a
    ld   d, h
    ld   a, a
    ld   c, l
    ld   l, a

label_30F4B::
    ld   d, [hl]
    ld   [hl], a
    ld   c, d
    dec  sp
    ld   h, $1E
    rra
    dec  sp
    daa
    ld   [hl], a
    ld   c, d
    ld   a, a
    ld   b, h
    ld   a, a
    ld   a, h
    rlca
    inc  b
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    add  a, $46
    xor  $2A
    cp   $B2
    or   $6A
    xor  $52
    call c, label_33864
    ld    hl, sp+$DC
    db   $E4 ; Undefined instruction
    ld   c, [hl]
    db   $F2 ; Undefined instruction
    ld   a, [hl]
    and  d
    cp   $3E
    ld   [rNR41], a
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    ld   d, b
    ld   [hl], b
    ld   d, [hl]
    halt
    ld   [hl], b
    ld   d, l
    ld   [hl], l
    ld   d, b
    ld   [hl], b
    rst  $18
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    dec  b
    ld   b, $05
    ld   b, $03
    inc  bc
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_1FF
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   c, $AA
    xor  [hl]
    ld   a, [bc]
    ld   c, $AA
    xor  [hl]
    ld   a, [bc]
    ld   c, $FB
    rst  $38
    rst  $38
    ld   bc, rIE
    and  b
    ld   h, b
    and  b
    ld   h, b
    ret  nz
    ret  nz
    ld   [hl], e
    adc  a, a
    db   $3E
    ld   a, $B7
    ld   l, h
    ld   [hl], a
    call z, label_DE65
    ld   c, h
    rst  $38
    ld   [hl], d
    rst  $38
    reti
    rst  $20
    cp   $F1
    db   $EB ; Undefined instruction
    inc  e
    push af
    ld   c, $F6
    rrca
    and  $1F
    dec  c
    ei
    dec  e
    di
    pop  af
    rst  $38
    cp   h
    jp   label_C1BE
    sbc  a, h
    db   $E3 ; Undefined instruction
    add  a, c
    rst  $38
    ld   b, c
    rst  $38
    ld   b, e
    rst  $38
    ld   a, h
    rst  $38
    add  a, e
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    cp   e
    add  a, $FD
    add  a, e
    ld   a, l
    add  a, e
    ld   bc, label_1FF
    rst  $38
    add  a, [hl]
    rst  $38
    ld   a, c
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    di
    db   $EC ; Undefined instruction
    ld    hl, sp+$E7
    db   $FC ; Undefined instruction
    db   $EB ; Undefined instruction
    cp   $DD
    rst  $38
    ret  c
    cp   $D9
    rst  $28
    sbc  a, $F7
    call label_A1DF
    sub  a, $AD
    rst  $10
    xor  [hl]
    res  6, a
    db   $FC ; Undefined instruction
    jp   label_DCF7
    rst  $38
    ret  nz
    rst  $38
    rst  0
    rst  8
    scf
    rra
    rst  $20
    ccf
    rst  $10
    ld   a, a
    cp   e
    rst  $38
    dec  de
    ld   a, a
    sbc  a, e
    rst  $30
    ld   a, e
    rst  $28
    or   e
    ei
    add  a, l
    ld   l, e
    or   l
    db   $EB ; Undefined instruction
    ld   [hl], l
    db   $D3 ; Undefined instruction
    db   $ED ; Undefined instruction
    ccf
    jp   label_3BEF
    rst  $38
    inc  bc
    rst  $38
    ld   a, [$FFFF]
    rst  $28
    ld    hl, sp+$DF
    rst  $30
    cp   b
    rst  $28
    ld   [hl], b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    ret  c
    ld   h, a
    ret  nc
    ld   l, a
    rst  $38
    rra
    rst  $38
    rrca
    rst  $38
    rst  $30
    rra
    ei
    rst  $28
    dec  e
    rst  $30
    ld   c, $FB
    ld   b, $FB
    ld   b, $FB
    ld   b, $FB
    ld   b, $FB
    ld   b, $FB
    ld   b, $FB
    ld   b, $FB
    ld   b, $1B
    and  $0B
    or   $FF
    ld    hl, sp+$FF
    ret  nz
    rst  8
    or   b
    rst  $38
    nop
    rst  $38
    ld   l, d
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   a, [hli]
    rst  $38
    ld   l, d
    rst  $38
    nop
    and  $7F
    and  $7F
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  8
    or   b
    rst  8
    or   b
    ret  z
    or   a
    rst  $38
    adc  a, a
    rst  $38
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    xor  $FF
    xor  d
    rst  $38
    xor  [hl]
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    nop
    ld   h, a
    cp   $67
    cp   $FF
    nop
    rst  $38
    ld   bc, label_DF3
    di
    dec  c
    inc  de
    db   $ED ; Undefined instruction
    rst  $38
    pop  af
    rst  $38
    rst  $20
    rst  $38
    jp   label_C2FF
    rst  $38
    jp   nz, label_C2FF
    rst  $38
    add  a, $FF
    rst  0
    rst  $38
    rst  8
    rst  $38
    rst  8
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    sbc  a, a
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    sbc  a, a
    rst  $38
    add  a, e
    rst  $38
    ld   bc, label_38FF
    rst  $38
    ld   a, h
    rst  $38
    inc  e
    rst  $38
    inc  e
    rst  $38
    jr   c, label_310EE
    pop  af
    rst  $38
    rst  $20
    rst  $38
    rst  8
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    sbc  a, a
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    sbc  a, a
    nop
    nop
    inc  bc
    inc  bc
    inc  b
    rlca
    ld   [label_100F], sp
    rra
    jr   nz, label_3114B
    ld   [hl], c
    ld   c, [hl]
    ld   e, e
    ld   h, h
    ld   c, [hl]

label_31111::
    ld   [hl], c
    ld   b, h
    ld   a, e
    ld   b, h
    ld   a, e
    ld   b, h
    ld   a, e
    ld   b, h
    ld   a, e
    inc  h
    dec  sp
    jr   label_3113D
    rlca
    rlca
    nop
    nop
    ld   [$FFE0], a
    sub  a, b
    ld   [hl], b
    adc  a, b
    ld   a, b
    add  a, h
    ld   a, h
    add  a, d
    ld   a, [hl]
    push bc
    dec  sp
    ld   l, l
    sub  a, e
    add  hl, sp
    rst  0
    ld   de, label_11EF
    rst  $28
    ld   de, label_11EF
    rst  $28
    ld   [de], a
    xor  $0C

label_3113D::
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    nop
    nop
    ld   bc, label_32301
    ld   h, d
    ld   [hl], a
    ld   d, h
    ld   a, a
    ld   c, l
    ld   l, a

label_3114B::
    ld   d, [hl]
    ld   [hl], a
    ld   c, d
    dec  sp
    ld   h, $1E
    rra
    dec  sp
    daa
    ld   [hl], a
    ld   c, d
    ld   a, a
    ld   b, h
    ld   a, a
    ld   a, h
    rlca
    inc  b
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    add  a, $46
    xor  $2A
    cp   $B2
    or   $6A
    xor  $52
    call c, label_33864
    ld    hl, sp+$DC
    db   $E4 ; Undefined instruction
    ld   c, [hl]
    db   $F2 ; Undefined instruction
    ld   a, [hl]
    and  d
    cp   $3E
    ld   [rNR41], a
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_31188

label_31188::
    stop
    jr   z, label_3118C

label_3118C::
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_31194::
    ld   b, h
    nop
    jr   z, label_31198

label_31198::
    stop
    jr   z, label_3119C

label_3119C::
    ld   b, h
    nop
    nop
    nop
    jr   c, label_311A2

label_311A2::
    jr   c, label_311A4

label_311A4::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_311AC

label_311AC::
    jr   c, label_311AE

label_311AE::
    nop
    nop
    rst  $38
    nop
    di
    nop
    ld   [rJOYP], a
    ld   c, $00
    rst  $38
    nop
    ld   a, h
    nop
    ld   sp, $8700
    nop
    inc  bc
    nop
    inc  e
    inc  bc
    ld   [$FF1F], a
    ld   [bc], a

label_311C7::
    db   $FC ; Undefined instruction
    ld   [label_1F0], sp
    nop
    ld   de, $CE00
    nop
    ret  nz
    nop
    jr   c, label_31194
    rlca
    ld    hl, sp+$40
    ccf
    ld   [$8007], sp
    nop

label_311DC::
    and  d
    nop
    ld   a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ret  nz
    nop
    add  hl, bc
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
    rlca
    nop
    add  a, b
    nop
    ret  c
    nop
    ld   bc, label_700
    inc  bc
    dec  c
    ld   c, $17
    jr   label_31238
    jr   nc, label_31279
    ld   sp, label_3235C
    call z, label_FF73
    rst  $38
    ld   a, a
    add  a, b
    ret  c
    jr   nz, label_311C7
    ld   b, b
    jr   nc, label_311DA
    jr   c, label_311DC
    ccf

label_3121D::
    ret  nz
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    ret  nz
    ccf
    di
    inc  c

label_31226::
    ld   a, c
    ld   b, $78
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction

label_3122D::
    inc  bc
    ld    hl, sp+$07
    add  a, b
    nop
    ld   [$FFC0], a
    jr   nc, label_31226
    ret  z
    jr   c, label_3121D
    inc  e
    ld   h, [hl]
    sbc  a, h
    ld   [hl], d
    adc  a, [hl]
    ld   [hl], e
    adc  a, [hl]
    add  a, b
    rst  $38
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ld   a, [$FF7F]
    db   $F2 ; Undefined instruction
    sbc  a, a
    cp   $8F
    rst  $38
    ld   [hl], e
    rst  $38
    inc  e
    ccf
    ret  nz
    rra
    ld   [rNR34], a
    pop  hl
    ld   [$00F7], sp
    rst  $38
    nop
    rst  $38
    sub  a, b
    rst  $38
    ld   sp, hl
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    jr   c, label_3122D
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, d
    rst  $38
    rst  8
    rst  $38
    ld   bc, label_1FF
    rst  $38
    dec  bc
    cp   $0F
    cp   $4F

label_31279::
    db   $FD ; Undefined instruction
    ld   a, a
    pop  af
    rst  $38
    adc  a, $FF
    cp   b
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    rlca
    add  hl, hl
    sbc  a, $17
    ld    hl, sp+$2F
    ld   a, [$FF2E]
    pop  af
    ld   e, h
    db   $E3 ; Undefined instruction
    ld   e, h
    db   $E3 ; Undefined instruction
    ccf
    ret  nz
    rst  $18
    ld   [$FF36], a
    ld   sp, hl
    ret  z
    ccf
    db   $E4 ; Undefined instruction
    rra
    ld   h, h
    sbc  a, a
    ld   [hl], d
    adc  a, a
    ld   [hl], d
    adc  a, a
    db   $FD ; Undefined instruction
    cp   $02
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    inc  bc
    ld   bc, $0143
    db   $FD ; Undefined instruction
    inc  bc
    ld   [bc], a
    rst  $38
    db   $FD ; Undefined instruction
    cp   $BF
    ld   a, a
    ld   b, b
    rst  $38
    cp   a
    ret  nz
    jp   nz, label_C080
    add  a, b
    cp   a
    ret  nz
    ld   b, b
    rst  $38
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    sbc  a, a
    rst  $30
    rst  $38
    sub  a, a
    rst  $38
    sub  a, a
    rst  $38
    rst  $38
    ld   bc, label_1FF
    ld   bc, label_1FF
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $28
    rst  $38
    jp   [hl]
    rst  $38
    jp   [hl]
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop

label_312E6::
    rst  $38
    nop
    ret  nz
    ccf
    rst  $18
    ccf
    rst  $38
    rst  $38
    rra
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    adc  a, h
    di
    sbc  a, [hl]
    pop  hl
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FF8F], a
    ld   a, [$FF89]
    or   $81
    cp   $80
    rst  $38
    ld   h, a
    sbc  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    sbc  a, b
    ld   h, a
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   b, b
    cp   a
    nop
    rst  $38
    add  hl, bc
    or   $1F
    ld   [$FF3F], a
    ret  nz
    rst  $38
    nop
    ld   h, c
    sbc  a, a
    pop  hl
    rra
    pop  af
    rrca
    pop  af
    rrca
    pop  af
    rrca
    pop  hl
    rra
    ld   bc, label_1FF
    rst  $38
    adc  a, h
    ld   a, b
    ret  c
    jr   nc, label_312E6
    jr   nc, label_3137D
    ld   hl, label_372B
    ld   a, $1F
    rlca
    nop
    nop
    nop
    ld   l, [hl]
    rra
    ei
    inc  b
    xor  b
    ld   [hl], b
    ld   a, [$FFF8]
    sub  a, h
    ld    hl, sp+$0B
    db   $FC ; Undefined instruction
    add  a, a
    ld   a, [hl]
    ccf
    inc  bc
    ld   a, b
    rst  $38
    pop  bc
    ld   a, $64
    rra
    ld   l, a
    rra
    ret
    ccf
    sub  a, b
    ld   a, a
    ld   h, c
    cp   $C7
    ld    hl, sp+$B0
    rra
    sbc  a, c
    ld   c, $C7
    inc  c
    ld   l, [hl]
    add  a, h
    sbc  a, $E4
    ld   a, h
    ld    hl, sp+$F0

label_3137D::
    nop
    nop
    nop
    jr   nc, label_313B2
    ld   e, a
    ld   c, a
    ld   d, d
    ld   c, h
    ld   b, c
    ld   a, [hl]
    ld   b, b
    ld   h, e
    ld   c, h
    ld   c, l
    call z, label_3004D
    ldh  [$FF0C], a
    inc  c
    inc  c
    ld   a, [label_30AF2]
    ldd  [hl], a
    add  a, d
    ld   a, [hl]
    ld   [bc], a
    add  a, $32
    or   d
    inc  sp
    or   d
    ld   [bc], a
    ld   b, a
    ei
    ld   b, $03
    cp   $44
    cp   $4A
    cp   h
    inc  d
    ld    hl, sp+$68
    ld   a, [$FFA0]
    ret  nz
    add  a, b
    nop
    rst  $18
    ld   h, b

label_313B2::
    ret  nz
    ld   a, a
    jr   nz, label_31435
    ld   d, b
    ccf
    jr   z, label_313D9
    ld   d, $0F
    dec  b
    inc  bc
    ld   bc, rJOYP
    sub  a, a
    ld    hl, sp+$90
    sbc  a, a
    rst  $38
    sbc  a, a
    ld   [$FFF3], a
    adc  a, h
    di
    adc  a, h
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    jp   [hl]
    rra
    add  hl, bc
    db   $FD ; Undefined instruction
    ei
    dec  a
    inc  bc
    daa

label_313D9::
    add  hl, de
    rst  $20
    add  hl, de
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $18
    ccf
    rst  $18
    ccf
    rst  $18
    ccf
    rst  $18
    ccf
    rst  $18
    ccf
    rst  $18
    ccf
    rst  $18
    ccf
    rst  $38
    rst  $38
    cp   $F9
    cp   $F9
    cp   $F9
    cp   $F9
    cp   $F9
    cp   $F9
    cp   $F9
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    rst  $38
    nop
    ld    hl, sp+$1F
    call z, label_C63F
    ccf
    rst  0
    ccf
    jp   label_C33F
    ccf
    ret  nc
    ld   [$FF34], a
    ld    hl, sp+$EA
    inc  e
    inc  e
    ld   b, $0B
    ld   b, $8E
    inc  bc
    ld   b, l
    add  a, e
    and  l
    jp   label_70B
    inc  l
    rra
    ld   d, a
    jr   c, label_3145F
    ld   h, b
    ret  nc
    ld   h, b
    ld   [hl], c
    ret  nz
    and  d
    pop  bc
    and  l
    jp   label_1FE
    rst  $38
    nop
    dec  de

label_31435::
    db   $FC ; Undefined instruction
    inc  sp
    db   $FC ; Undefined instruction
    ld   h, e
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    jp   label_C3FC
    db   $FC ; Undefined instruction
    pop  bc
    cp   $E0
    rst  $38
    ld   [rIE], a
    ret  nc
    rst  $38
    db   $E8 ; add  sp, d
    rst  $18
    or   $CF
    db   $DB
    rst  $20
    adc  a, $F1
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    inc  b
    nop
    ld   b, b
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38

label_3145F::
    rst  $38
    db   $FC ; Undefined instruction
    ld   c, $FC
    dec  a
    ld   a, h
    db   $FD ; Undefined instruction
    ld   a, h
    sbc  a, $7F
    rst  $18
    ld   e, a
    ret  nz
    rst  $38
    ld   a, a
    rst  $38
    nop
    add  a, e
    ld   a, a
    rlca
    rst  $38
    rlca
    rst  $38
    dec  bc
    rst  $38
    rla
    ei
    ld   l, a
    di
    db   $DB
    rst  $20
    ld   [hl], e
    adc  a, a
    jp   label_C3FC
    db   $FC ; Undefined instruction
    pop  bc
    cp   $C1
    cp   $C1
    cp   $E3
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    and  l
    jp   label_C3A5
    or   l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    xor  l
    jp   label_C3A5
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  c
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    rst  0
    jr   c, label_314AE
    nop
    ld   h, h
    cp   [hl]
    ld   [hl], $DF
    sbc  a, a
    xor  $75
    cp   $0E
    rra
    cp   [hl]
    ld   b, e
    db   $FC ; Undefined instruction
    cp   $38
    inc  b
    adc  a, a
    rra
    ccf
    ccf
    ld   a, h
    ld   a, a
    ld   [hl], b
    rst  $38
    ld   [rIE], a
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  0
    ld    hl, sp+$C7
    ld    hl, sp+$F1
    ld    hl, sp+$FC
    db   $FC ; Undefined instruction
    ld   a, $FE
    ld   c, $FF
    rlca
    rst  $38
    rst  0
    ccf
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    dec  sp
    db   $FC ; Undefined instruction
    dec  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$FE
    ld   bc, label_3FD
    rst  0
    ccf
    rst  8
    ccf
    call c, label_D03F
    ccf
    ret  nz
    ccf
    ld   [$FF1F], a
    ld   a, a
    add  a, b
    cp   a
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   [hl], b
    ld   [hl], b
    rst  $18
    cp   a
    cp   h
    rst  $38
    rst  $38
    rst  $38
    or   [hl]
    or   $FF
    rst  $30
    and  l
    jp   label_C1A2
    or   c
    ret  nz
    sbc  a, b
    ld   [$FFCE], a
    ld   a, [$FF63]
    db   $FC ; Undefined instruction
    or   b
    ld   a, a
    ld   l, a
    rra
    and  l
    jp   label_8345
    adc  a, l
    inc  bc
    add  hl, de
    rlca
    ld   [hl], e
    rrca
    add  a, $3F
    dec  c
    cp   $F6
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    nop
    ld   c, $0E
    ei
    db   $FD ; Undefined instruction
    dec  a
    rst  $38
    rst  $38
    rst  $38
    ld   l, c
    ld   l, a
    rst  $38
    rst  $28
    pop  bc
    cp   $C0
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ld   [$FF7F], a
    ld   a, b
    ccf
    cp   a
    rra
    rra
    ld   [$FFF8], a
    rlca
    ld   [$FF1F], a
    nop
    rst  $38
    jr   nz, label_31559
    nop
    rst  $38
    rlca
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$07
    rra
    ld   [rBGP], a
    ld    hl, sp+$40
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    rst  $38
    rst  $38
    add  a, e
    ld   a, a
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rlca
    cp   $1E
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    ld    hl, sp+$3F
    ld   [hl], b
    ccf
    cp   h
    ld   a, $BF
    ld   a, $7B
    cp   $FB
    ld   a, [$FF03]
    cp   $FF
    nop
    jp   label_C33F
    ccf
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    rst  0
    ccf
    rst  0
    ccf
    rst  0
    ccf
    nop
    nop
    stop
    ld   d, h
    nop
    jr   z, label_315A8

label_315A8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   a, a
    rst  $38
    ld   [rIE], a
    rst  8
    ld   a, [$FF90]
    ld   [$FFA0], a
    ret  nz
    and  e
    ret  nz
    and  [hl]
    pop  bc
    and  l
    jp   label_FFFE
    inc  bc
    rst  $38
    ld   sp, hl
    rlca
    dec  c
    inc  bc
    dec  b
    inc  bc
    push bc
    inc  bc
    ld   h, l
    add  a, e
    and  l
    jp   label_33EBD
    ld   e, d
    rst  $20
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    xor  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3BD
    sbc  a, c
    rst  $20
    add  a, c
    rst  $38
    ld   b, d
    rst  $38
    cp   l
    ld   a, [hl]
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    sbc  a, [hl]
    sbc  a, [hl]
    sbc  a, [hl]
    sub  a, d
    sbc  a, [hl]
    sub  a, d
    sbc  a, [hl]
    sub  a, d
    sbc  a, [hl]
    sbc  a, [hl]
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    ld   bc, label_33901
    ld   a, c
    ld   a, c
    ld   c, c
    ld   a, c
    ld   c, c
    ld   a, c
    ld   c, c
    ld   a, c
    ld   a, c
    ld   bc, rSB
    rst  $38
    add  a, b
    add  a, b
    and  b
    cp   a
    and  b
    cp   a
    and  b
    cp   a
    and  b
    cp   a
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    ld   bc, label_501
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    di
    rrca
    rst  8
    ccf
    sbc  a, a
    ld   a, a
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    rst  8
    ld   a, [$FFF3]
    db   $FC ; Undefined instruction
    ld   sp, hl
    cp   $FC
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   a
    rst  $38
    rst  $38
    ccf
    cp   a
    ld   a, a
    rra
    rst  $38
    rra
    rst  $38
    jr   nz, label_3166B
    ld   e, a
    ld   [$FFBF], a
    ret  nz
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $F8
    rst  $38
    ld    hl, sp+$FF
    inc  b
    rst  $38
    ld   a, [$FD07]
    inc  bc
    ld   b, h
    add  hl, bc
    db   $DB
    ld   l, l
    dec  l
    ld   a, a
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ccf
    ld   a, a
    ldi  [hl], a
    sub  a, b
    db   $DB
    or   [hl]

label_31694::
    or   h
    cp   $FF
    db   $FC ; Undefined instruction
    cp   $FD
    rst  $38
    rst  $38
    rst  $38
    cp   $FC
    cp   $04
    add  hl, bc
    ld   a, a
    dec  c
    dec  sp
    ld   l, a
    ld   [hl], b
    ccf
    rst  $20
    jr   c, label_31694
    or   b
    ld   e, b
    ld   [rNR24], a
    ld   h, b
    jr   nc, label_316C2
    or   $30
    call c, label_CF6
    db   $FC ; Undefined instruction
    push hl
    inc  e
    rla
    dec  c
    sbc  a, d
    rlca
    ld   c, b
    ld   b, $00
    nop

label_316C2::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_316EA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $30
    sbc  a, l
    rst  $30
    sbc  a, l
    rst  $30
    sbc  a, h
    rst  $38
    sbc  a, a
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    ld   bc, rSB
    rst  $38
    rst  $28
    cp   c
    rst  $28
    cp   c
    rst  $28
    add  hl, sp
    rst  $38
    ld   sp, hl
    rst  $38
    ld   bc, rIE
    nop
    jr   c, label_3172B
    ld   b, h
    inc  c
    add  a, d
    inc  l
    add  a, d
    ld   l, h
    add  a, d
    nop

label_3172B::
    ld   a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    inc  b
    ldi  [hl], a
    inc  c
    ldi  [hl], a
    ldi  [hl], a
    inc  e
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $30
    ld   [$00FF], sp
    cp   a
    ld   b, b
    ei
    nop
    rst  $38
    nop
    ld   a, [hl]
    nop
    add  a, $00
    ld   h, h
    nop
    ld   [hl], b
    nop
    ld   sp, label_3300
    nop
    scf
    nop
    ld   d, $00
    ld   d, $00
    nop
    nop
    ld   b, b
    nop
    nop
    nop
    inc  b
    nop
    nop
    nop
    stop
    nop
    nop
    ld   bc, label_33E00
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    jp   label_33867
    ret  nz
    ld   e, a
    ld   [$FFCA], a
    ld   a, l
    ld   a, a
    scf
    inc  sp
    nop
    rst  $38
    ld   a, a
    ld   a, a
    rst  $38
    ccf
    ld   a, a
    ccf
    ccf
    ccf
    rst  $38
    rra
    ccf
    dec  bc
    rra
    nop
    inc  sp
    db   $FC ; Undefined instruction
    cp   $FE
    rst  $38
    db   $FC ; Undefined instruction
    cp   $FF
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    cp   $68
    db   $FC ; Undefined instruction
    nop
    ld   h, $26
    ld   b, b
    ldi  [hl], a
    ret  nz
    cpl
    ld   b, b
    ld   sp, label_1840
    ld   [rIF], a
    jr   nc, label_317B0
    inc  e
    nop
    inc  sp

label_317B0::
    inc  a
    ld   [bc], a
    inc  l
    inc  bc
    call nz, label_2402
    ld   [bc], a
    sbc  a, h
    inc  bc
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_317E4::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_317FC::
    nop
    nop
    nop
    nop
    rlca
    nop
    dec  bc
    rlca
    dec  de
    inc  b

label_31806::
    ccf
    inc  de
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction
    jr   label_3182E
    dec  c
    rla
    dec  c
    dec  hl
    rla
    ld   l, a
    jr   nc, label_3188F
    daa
    scf
    rrca
    ld   e, $01
    scf
    ld   c, $1F
    nop
    ret  nz
    nop
    jr   nz, label_317E4
    jr   label_31806
    call c, label_FCE8
    jr   z, label_31827
    ld   [label_18E4], sp

label_3182E::
    ld    hl, sp+$B0
    db   $E8 ; add  sp, d
    or   b

label_31832::
    call nc, label_F4E8
    ld   [$B874], sp
    ld    hl, sp+$B0
    jr   nc, label_317FC
    ld    hl, sp+$00
    ld   a, [$FF00]
    inc  bc
    nop
    rlca
    nop
    rlca
    inc  bc
    rra
    inc  b
    dec  a
    inc  de
    add  hl, sp
    rla
    db   $3A ; ldd  a, [hl]
    dec  d
    inc  l
    inc  de
    inc  e
    inc  bc
    inc  d
    dec  bc
    inc  [hl]
    dec  de
    dec  sp
    inc  d
    rla
    rrca
    jr   label_31863
    rra
    nop
    rrca
    nop
    add  a, b
    nop
    ret  nz

label_31863::
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    sbc  a, h
    db   $E8 ; add  sp, d
    sub  a, h
    db   $E8 ; add  sp, d
    jr   c, label_31832
    ld   d, h
    xor  b
    sub  a, h
    ld   l, b
    inc  l

label_31877::
    ld   a, [$FFC8]
    ld   a, [$FF38]
    ret  nz
    db   $FC ; Undefined instruction
    jr   nc, label_31877

label_3187F::
    nop
    inc  bc
    nop
    dec  c
    inc  bc
    ld   e, $0D
    ld   [hl], a
    ld   c, $3B
    rlca
    ld   c, $01
    ccf
    ld   a, [bc]
    ccf

label_3188F::
    dec  de
    rla
    rrca
    ld   [label_F07], sp
    nop
    dec  bc
    dec  b
    rrca
    dec  b
    dec  bc
    inc  b
    rrca
    ld   bc, $001F
    ld   [rJOYP], a
    db   $10 ; Undefined instruction
    ret  z
    ld   a, [$FF24]

label_318A7::
    ret  c
    db   $F2 ; Undefined instruction
    inc  l
    or   d
    ld   l, h
    db   $F4 ; Undefined instruction
    ld   l, b
    ld    hl, sp+$60
    ret  nc
    ld   h, b
    or   b
    ld   b, b
    ret  nc
    jr   nz, label_3187F
    or   b
    ret  z
    or   b
    ld    hl, sp+$00
    ld   a, [$FFE0]
    ld    hl, sp+$00
    nop
    nop
    inc  bc
    nop
    dec  l
    inc  bc
    ld   a, $0D
    scf
    ld   c, $1B
    rlca
    ld   c, $01
    ccf
    ld   a, [bc]
    ccf
    dec  de
    rla
    rrca
    rrca
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    rrca
    nop
    rra
    rrca
    rra
    nop
    nop
    nop
    ld   a, [$FF00]
    adc  a, h
    ld   a, [$FF62]
    db   $FC ; Undefined instruction
    ldi  [hl], a
    call c, label_2CF2
    or   h
    ld   l, b
    db   $F4 ; Undefined instruction
    ld   l, b
    ld    hl, sp+$60
    ret  nc
    ld   h, b
    ld   a, [$FF00]
    sbc  a, b
    ld   h, b
    sbc  a, h
    ld   l, b
    inc  a
    ret  z
    db   $FC ; Undefined instruction

label_318FD::
    jr   label_318FD
    nop
    nop
    nop
    adc  a, a
    nop
    db   $F4 ; Undefined instruction
    rrca
    ei
    scf
    db   $FC ; Undefined instruction
    dec  de
    ld   l, a
    inc  e
    db   $3A ; ldd  a, [hl]
    dec  b
    ld   a, a
    add  hl, hl
    rst  $38
    ld   l, l
    ld   a, a
    nop
    ld   a, b
    scf
    ld   a, b
    scf
    inc  a
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   h, b
    add  a, b
    db   $10 ; Undefined instruction
    adc  a, b
    ld   [hl], b
    call nz, label_C4B8
    cp   b
    call z, label_33EB0
    add  a, h
    xor  a
    halt
    or   $2B
    or   $2D
    db   $F2 ; Undefined instruction
    dec  hl
    ld   a, [$FFF8]
    nop
    nop
    nop
    nop
    nop
    ld   c, a
    nop
    db   $F4 ; Undefined instruction
    rrca
    ei
    rla
    db   $FC ; Undefined instruction
    dec  de
    ld   l, a
    inc  e
    db   $3A ; ldd  a, [hl]
    dec  b
    ld   a, a
    add  hl, hl
    rst  $38
    ld   l, l
    ld   a, a
    nop
    ld   a, b
    scf
    ld   a, b
    scf
    inc  a
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   h, b
    add  a, b
    db   $10 ; Undefined instruction

label_31968::
    adc  a, b
    ld   [hl], b
    call nz, label_C6B8
    cp   b
    rst  $18
    and  [hl]
    ld   l, e
    sub  a, [hl]
    xor  l
    ld   [hl], d
    cpl
    db   $F4 ; Undefined instruction
    cpl
    or   $2F
    or   $2F
    or   $FF
    ld   [bc], a
    rlca
    nop
    nop
    nop
    rlca
    nop
    ld   [label_3307], sp
    rrca
    ld   [hl], d
    cpl
    ld   a, h
    inc  hl
    ld   [hl], a
    cpl
    ld   e, a
    jr   nz, label_319C0
    db   $10 ; Undefined instruction
    dec  de
    scf
    rrca
    cpl
    db   $10 ; Undefined instruction
    ld   c, $1F
    nop
    ccf
    ld   c, $1F
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nc, label_31968
    jr   c, label_3197A
    ld    hl, sp+$10
    cp   h
    ret  nc
    db   $EC ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  l
    sbc  a, $6C
    cp   h
    ret  nc
    ld    hl, sp+$30
    ld   [hl], h
    adc  a, b
    xor  h
    ret  c
    ret  c
    ld   [hl], b
    ld    hl, sp+$00

label_319C0::
    ld   de, label_3A00
    ld   de, label_386F
    rst  $10
    ld   l, h
    cp   e
    ld   d, h
    rst  $38
    nop
    ccf
    ld   a, [de]
    ccf
    ld   [de], a
    rra
    dec  bc
    rra
    dec  c
    dec  c
    ld   [bc], a
    inc  b
    inc  bc
    rlca
    nop
    rrca
    inc  bc
    rlca
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   l, h
    ld   a, [$FFFA]
    inc  e
    db   $DB
    db   $E4 ; Undefined instruction
    rst  $20

label_319E9::
    db   $3A ; ldd  a, [hl]
    rst  $30
    ld   a, [bc]
    db   $FD ; Undefined instruction
    sub  a, $FB
    call nc, label_338F6
    db   $EC ; Undefined instruction
    jr   nc, label_319E9
    ld   [$D83C], sp
    call nz, label_F838
    add  a, b
    db   $FC ; Undefined instruction
    jr   c, label_319F7
    nop
    inc  bc
    nop
    ld   b, $01
    dec  e
    inc  bc
    add  hl, sp

label_31A07::
    rla
    ld   a, $11

label_31A0A::
    ccf
    rla
    ld   h, a
    jr   label_31A0A
    ld   l, h
    ld   [hl], a
    dec  l
    dec  sp
    rlca
    rla
    ld   [label_73A], sp
    dec  h

label_31A19::
    dec  de
    ld   e, $01
    inc  bc
    nop
    ld   bc, $E000
    nop
    sub  a, b
    ld   [$FFB8], a
    ret  nz
    sbc  a, h
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ld   [$E8FC], sp
    db   $E4 ; Undefined instruction
    jr   label_31A07
    jr   nc, label_31A19
    or   b
    ret  nc
    ld   [$FFE8], a
    db   $10 ; Undefined instruction

label_31A37::
    or   b
    ld    hl, sp+$80
    ld   a, b
    or   b
    db   $FC ; Undefined instruction
    jr   nc, label_31A37
    nop
    rra
    nop

label_31A42::
    ccf
    dec  de
    ccf
    inc  b
    dec  a
    inc  de
    add  hl, sp
    rla
    add  hl, hl
    rla
    add  hl, de
    rlca
    inc  c
    inc  bc
    ld   [de], a
    dec  c
    dec  d
    ld   c, $12
    rrca
    add  hl, de
    rlca
    inc  c
    inc  bc
    rlca
    nop
    inc  bc
    nop
    nop
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    inc  d
    db   $E8 ; add  sp, d
    ld   e, b
    and  b
    or   b
    ret  nz
    jr   z, label_31A42
    inc  h
    ret  c
    xor  $1C
    sbc  a, [hl]
    db   $EC ; Undefined instruction
    ld   a, h
    add  a, b
    ld   a, [$FF60]
    ld    hl, sp+$60
    ld    hl, sp+$00
    nop
    nop
    rlca
    nop
    ld   e, e
    rlca
    ld   a, h
    dec  de
    ld   l, [hl]
    dec  e
    scf
    ld   c, $3D
    ld   [bc], a
    ld   a, a
    inc  d
    ld   a, a
    ld   [hl], $2F
    ld   e, $7F
    nop
    pop  af
    ld   l, [hl]
    di
    ld   l, l
    ld   a, [hl]
    ld   bc, label_E1F
    ccf
    nop
    nop
    nop
    ld   [rJOYP], a

label_31AA4::
    sbc  a, h
    ld   [$FFE2], a
    db   $FC ; Undefined instruction
    ld   b, d
    cp   h
    db   $E4 ; Undefined instruction
    ld   e, b
    ld   l, b
    ret  nc
    db   $E8 ; add  sp, d
    ret  nc
    ld   a, [$FFC0]
    and  b
    ret  nz
    ld   [rJOYP], a
    ld   e, b
    ld   [$FF9C], a
    db   $E8 ; add  sp, d
    inc  a
    ret  z
    db   $FC ; Undefined instruction

label_31ABD::
    jr   label_31ABD
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    inc  de
    rrca
    db   $10 ; Undefined instruction
    ccf
    db   $10 ; Undefined instruction
    ld   e, $F7
    ld   c, $7F
    nop
    rra
    ld   a, [bc]
    ld   a, $1F
    pop  af
    ld   c, $FE
    ld   b, c
    cp   a
    ld   d, [hl]
    sbc  a, a
    ld   h, [hl]
    add  a, a
    ld   a, c
    db   $FD ; Undefined instruction
    nop
    ret  nz
    nop
    jr   nc, label_31AA4
    adc  a, b
    ld   a, [$FF84]
    ld   a, b
    call nz, label_E8B8
    ret  nc
    ld    hl, sp+$C0
    ld   a, [$FFC0]
    ld   a, [$FF40]
    ret  z
    jr   nc, label_31B3D
    or   b
    ld   c, b
    or   b
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    ld   h, b
    ld   a, [$FFC0]
    ld    hl, sp+$00
    ld   bc, label_200
    ld   bc, $0007
    rrca
    rlca
    ccf
    ld   bc, $001F
    rrca
    nop
    rrca
    dec  b
    dec  bc
    rlca
    rrca
    ld   bc, label_E1D
    inc  e
    rrca
    inc  c
    inc  bc
    rlca
    nop
    ld   bc, $0000
    nop
    ld   [rJOYP], a
    ret  nc
    ld   [$FF08], a
    ld   a, [$FFD4]

label_31B27::
    jr   z, label_31B27
    call nz, label_32CFA
    db   $F2 ; Undefined instruction
    inc  e
    and  $58
    db   $EC ; Undefined instruction
    ld   d, b
    cp   b
    ret  nz
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    ret  nc
    ld   c, b
    or   b
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction

label_31B3D::
    ld   [hl], b
    ld    hl, sp+$00
    nop
    nop
    rla
    nop
    jr   c, label_31B5D
    inc  sp
    rrca
    inc  de
    inc  c
    rla
    add  hl, bc
    ld   d, $0D
    dec  d
    ld   c, $10
    rrca
    add  hl, bc
    ld   b, $17
    ld   [label_E13], sp
    add  hl, de
    rlca
    inc  c
    inc  bc
    rlca

label_31B5D::
    nop
    inc  bc
    nop
    nop
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   b, b
    ld   a, h
    and  b
    cp   b
    ld   d, b
    cp   $90
    rst  $38
    add  a, $7F
    sub  a, $BE
    ld   d, b
    ld    hl, sp+$00

label_31B74::
    jr   nc, label_31B36
    ld   [hl], b
    ld   [$FFF0], a
    ld   h, b
    ld   [hl], b
    add  a, b
    ld    hl, sp+$70
    ld    hl, sp+$00
    rrca
    nop
    rra
    dec  bc
    rra
    ld   b, $3E
    dec  c
    dec  sp
    inc  c
    ld   [hl], a
    add  hl, bc
    ld   a, a
    inc  bc
    rra
    dec  bc
    ld   e, $0B
    dec  e
    ld   [bc], a
    rla
    ld   [label_71A], sp
    add  hl, sp
    rlca
    inc  a
    dec  de
    ccf
    inc  c
    rra
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    ret  nc
    ld   [rBGPI], a
    ld   a, [$FFBE]
    ld   [hl], b
    adc  a, c
    halt
    ld   l, [hl]
    add  a, d
    ld   a, h
    add  a, h
    ld   a, b
    jr   c, label_31B74
    and  $18
    daa
    sbc  a, $D7
    xor  $3E

label_31BBB::
    ret  nz
    db   $FC ; Undefined instruction
    jr   c, label_31BBB
    nop
    dec  de
    nop
    inc  a
    dec  de
    ccf
    jr   label_31C06
    nop
    inc  l
    inc  de
    cpl
    inc  de
    cpl
    rla
    cpl
    inc  d
    cpl
    inc  d
    dec  hl
    rla
    scf
    ld   [label_1F30], sp
    ld   l, a
    rra
    ret  nc
    ld   l, a
    rst  $28
    ld   [hl], b
    rst  $38
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b

label_31BE4::
    and  b
    ret  nz
    ld   a, [$FF40]
    ld    hl, sp+$10
    ld    hl, sp+$50
    ld    hl, sp+$D0
    ret  z
    ld   a, [$FFAE]
    ret  nc
    ld   d, a
    xor  d
    and  a
    ld   e, d
    ld   a, $E0
    ret  c
    ld   [$FF3E], a
    ret  z
    rst  $38
    ld   e, $FF
    nop
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc

label_31C06::
    ld   [label_1907], sp
    rlca
    ccf
    db   $10 ; Undefined instruction
    rla
    ccf
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  b
    cpl
    dec  d
    ld   c, a
    inc  sp
    ld   c, a
    jr   nc, label_31C79
    dec  l
    ccf
    inc  c
    rra
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc
    rlca
    dec  de
    inc  b
    ccf
    inc  de
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction
    jr   label_31C63
    dec  c
    ld   [hl], $0D
    dec  hl
    rla
    daa
    jr   label_31C67
    ld   de, label_C1F
    rra
    inc  c
    ld   e, $00
    inc  sp
    nop
    ld   a, a
    jr   nc, label_31CC4
    inc  sp
    cp   e
    ld   b, h
    cp   h

label_31C49::
    ld   d, e
    cp   c
    ld   d, a
    ld   a, d
    dec  d
    inc  l
    inc  de
    inc  e
    inc  bc
    inc  e
    dec  bc
    rla
    inc  c
    inc  de
    rrca
    inc  e
    inc  bc
    ccf
    inc  c
    ccf
    nop
    rra
    nop
    call z, label_FE00

label_31C63::
    inc  c
    cp   $CC
    db   $22

label_31C67::
    ldi  [hl], a
    dec  a
    jp   z, label_EA9D
    ld   e, [hl]
    db   $E8 ; add  sp, d
    inc  [hl]
    ret  z

label_31C70::
    ld   e, h
    and  b
    xor  b
    ld   [hl], b
    ld   c, b
    ld   a, [$FFB8]

label_31C77::
    ret  nz
    ld   a, b

label_31C79::
    or   b
    db   $FC ; Undefined instruction
    jr   nc, label_31C49
    jr   nc, label_31C77
    nop
    inc  sp
    nop

label_31C82::
    ld   a, a
    inc  sp
    ld   a, e
    inc  h
    inc  a
    inc  de
    add  hl, sp
    rla
    db   $3A ; ldd  a, [hl]
    rla
    inc  l
    inc  de
    ld   e, $01
    add  hl, de
    ld   b, $14
    rrca
    ld   [de], a
    rrca
    dec  e
    inc  bc
    ld   e, $0D
    ccf
    inc  c
    inc  sp
    inc  c
    rra
    nop
    db   $EC ; Undefined instruction
    nop
    cp   $CC
    sbc  a, $24

label_31CA6::
    inc  a
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    ld   e, h
    xor  b
    inc  [hl]
    ret  z
    jr   c, label_31C70
    jr   z, label_31C82
    ret  c
    jr   nc, label_31CDD
    ld   a, [$FFC8]
    ld   a, [$FF38]

label_31CB9::
    ret  nz
    db   $FC ; Undefined instruction
    jr   nc, label_31CB9
    nop
    ld    hl, sp+$00
    nop
    nop
    rlca
    nop

label_31CC4::
    dec  de
    rlca
    db   $FC ; Undefined instruction
    dec  de
    ld   l, [hl]
    dec  e
    scf
    ld   c, $3F
    nop
    ld   a, a
    jr   label_31D50
    ld   [hl], $EF
    ld   e, $FF
    ld   b, b
    ld   a, [$FF6F]
    ld   [hl], c
    ld   l, $3F
    nop
    rlca

label_31CDD::
    inc  bc
    rrca
    nop
    nop
    nop
    ret  nz
    nop

label_31CE4::
    jr   nc, label_31CA6
    call z, label_302F0
    cp   h
    ldh  [$FF0C], a
    ld   e, h
    ld   h, h
    ret  c
    db   $E8 ; add  sp, d
    ret  nc
    ld   a, [$FFC0]
    and  b
    ret  nz
    ld   [rJOYP], a
    sbc  a, h
    ld   h, b
    xor  $F4
    sbc  a, [hl]
    ld   h, h
    cp   $8C
    cp   $00
    rlca
    nop
    dec  de
    rlca
    ld   a, h
    dec  de
    xor  $1D
    ld   [hl], a
    ld   c, $3F
    nop
    ld   a, a
    inc  d
    ld   a, a
    ld   [hl], $EF
    ld   e, $FF
    ld   b, b
    ld   a, [$FF6F]
    ld   [hl], c
    ld   l, $3E
    ld   bc, $0003
    ld   bc, label_700
    nop
    ret  nz
    nop

label_31D22::
    jr   nz, label_31CE4
    ret  nc
    ld   [rOBP0], a
    or   b
    db   $E8 ; add  sp, d
    ld   d, b
    ld   h, h
    ret  c
    db   $E4 ; Undefined instruction
    ret  c
    ld    hl, sp+$C0
    and  b
    ret  nz
    ld   [rJOYP], a
    sub  a, b
    ld   h, b
    db   $E8 ; add  sp, d
    ld   a, [$FF04]
    ld    hl, sp+$FC
    nop
    db   $FC ; Undefined instruction
    ld   a, b
    cp   $00
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, de
    rlca
    add  hl, sp
    rla
    inc  a
    inc  de
    ccf
    inc  d

label_31D50::
    cpl
    inc  de
    rla
    ld   [label_41B], sp
    dec  a
    dec  de
    ccf
    inc  e
    ld   a, e
    ld   l, $7F
    ld   h, $3F
    nop
    ld   h, a
    jr   nz, label_31D22
    sub  a, h
    sbc  a, a
    nop
    ld   a, $11
    db   $3A ; ldd  a, [hl]
    dec  d
    dec  sp
    rla
    daa
    ld   e, $3F
    dec  c
    rra
    rlca
    rla
    ld   [label_D12], sp

label_31D76::
    inc  de
    dec  c
    ld   e, $01
    ccf
    inc  c
    ld   a, $0D
    rra
    nop
    rrca
    nop
    or   [hl]
    rrca
    ld   sp, hl
    scf
    call c, label_EF3B
    inc  e
    ld   a, [hl]
    ld   bc, label_29FF
    rst  $38
    ld   l, l
    cp   $1D
    ei
    ld   h, h
    push af
    ld   l, d
    ld   h, c
    ld   e, $13
    inc  c
    rrca
    nop
    rra
    inc  bc
    rra
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    and  b
    ret  nz
    sub  a, b
    ld   h, b
    ret  z
    or   b
    ret  z
    or   b
    ret  nc
    and  b
    ld   h, b
    add  a, b
    ret  nz
    nop
    ld   b, b
    add  a, b
    jr   nz, label_31D76
    ld   a, [$FFE0]
    db   $10 ; Undefined instruction
    ld   [rJOYP], a
    ld   [$FFC0], a
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   [bc], a
    ld   bc, label_306
    rrca
    ld   b, $0F
    inc  bc
    rrca
    dec  b
    ld   a, a
    nop
    pop  af
    ld   l, [hl]
    ld   a, [$FF6F]
    ld   a, a
    nop
    db   $E4 ; Undefined instruction
    ld   e, a
    di
    ld   l, [hl]
    ld   a, e
    inc  [hl]
    ld   a, a
    nop
    inc  hl
    ld   [bc], a
    ld   h, [hl]
    inc  b
    ld   a, c
    ld   bc, label_18FD
    ld   d, [hl]
    cp   b
    db   $FD ; Undefined instruction
    ld   [hl], $7B
    or   [hl]
    di
    ld   c, $69
    or   $BD
    ld   a, d
    ld   sp, hl
    ld   b, $42
    cp   h
    ld   b, d
    cp   h
    and  h
    jr   label_31E15
    nop
    add  a, b
    nop
    ld   b, $00
    rrca
    ld   b, $0E
    ld   bc, label_609
    ld   d, $0D
    ld   e, $09
    inc  e
    dec  bc
    add  hl, sp
    rla
    add  hl, sp
    rla
    add  hl, sp
    rla
    jr   c, label_31E1D
    inc  e
    dec  bc
    rrca
    inc  b
    rrca
    inc  bc
    rlca

label_31E1D::
    nop
    inc  bc
    nop
    ld   b, $00
    rrca
    ld   b, $1F
    ld   b, $2F
    ld   d, $2F
    db   $10 ; Undefined instruction
    ld   d, $27
    jr   label_31E47
    rrca
    rla
    rrca
    add  hl, de
    ld   b, $2A
    dec  d
    ld   a, $11
    add  hl, sp
    rla
    inc  d
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    dec  bc
    ld   b, $1F

label_31E47::
    inc  b
    ld   a, $11
    ccf
    dec  d
    ccf
    rla
    daa
    ld   e, $17
    rrca
    dec  hl
    rla
    daa
    jr   label_31E86
    ld   d, $3F
    ld   b, $3F
    ld   b, $1F
    ld   b, $0F
    nop
    inc  c
    nop
    inc  [hl]
    ld   [label_3846], sp
    ld   b, c
    ld   a, $8F
    ld   [hl], b
    cp   a
    ld   l, a
    xor  e
    ld   [hl], a
    rst  8
    ld   [hl], b
    db   $DB
    ld   l, l
    cp   a
    ld   e, e
    ld   [hl], a
    jr   c, label_31EE6
    inc  sp
    dec  sp
    ld   bc, $0073
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    nop
    xor  b
    ld   [hl], b

label_31E86::
    inc  h
    ld    hl, sp+$34
    ret  z
    call z, label_C430
    cp   b
    add  a, $B8
    or   a
    jp   z, label_B2FF
    rst  $38
    or   d
    rst  $38
    add  a, [hl]
    add  a, a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    add  hl, de
    ld   b, $12
    dec  c
    ld   e, $0D
    ld   de, label_90E
    ld   b, $07
    ld   bc, label_50B
    dec  sp
    dec  b
    inc  hl
    dec  e
    ld   de, label_110E
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    ld   a, $00
    ld   a, a
    ld   a, $FE
    inc  b
    inc  e
    ld   [$FF3C], a
    ret  c
    inc  a
    ret  c
    call c, label_FE20
    db   $FC ; Undefined instruction
    rst  $38
    or   [hl]
    rst  $38
    sub  a, h
    ld   e, h
    and  b
    or   $38
    dec  sp
    call c, label_EC9F
    ld   l, l
    ld   a, [$FFF0]
    nop
    jr   label_31EE2

label_31EE2::
    inc  a
    jr   label_31F21
    jr   label_31F23
    nop
    daa
    jr   label_31F11
    add  hl, de
    add  hl, hl
    ld   d, $3B
    rlca
    ld   a, [hli]
    dec  d
    inc  a
    inc  de
    ccf
    db   $10 ; Undefined instruction
    inc  d
    sbc  a, a
    add  a, e
    adc  a, e
    inc  b
    inc  [hl]
    inc  hl
    ld   h, e
    ld   b, b
    inc  bc
    nop
    inc  e
    inc  bc
    ld   a, $19
    ccf
    dec  de
    dec  sp
    inc  b
    cpl
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    dec  d
    cpl

label_31F11::
    dec  d
    dec  de
    rlca
    rla
    ld   [label_F14], sp
    inc  de
    rrca
    ld   [label_1F07], sp
    nop
    rrca
    nop
    ret  nz

label_31F21::
    nop
    jr   c, label_31EE4
    ld   a, h

label_31F25::
    sbc  a, b
    db   $FC ; Undefined instruction
    ret  c
    call c, label_F420
    ld   [label_8F4], sp
    db   $F4 ; Undefined instruction
    xor  b
    db   $F4 ; Undefined instruction
    xor  b
    call nc, label_E8E8
    db   $10 ; Undefined instruction
    ld   a, [$FFE8]
    ld   a, [$FF78]
    add  a, b
    db   $EC ; Undefined instruction
    ld   [hl], b
    ld    hl, sp+$00
    inc  bc
    nop
    rra
    nop
    ccf
    dec  de
    ccf
    jr   label_31F86
    inc  bc
    add  hl, hl
    rla
    ld   a, [hli]
    dec  d
    inc  l
    inc  de
    inc  l
    inc  de
    inc  l
    inc  de
    inc  d
    dec  bc
    inc  de
    inc  c
    rla
    rrca
    jr   label_31F63
    rra
    nop
    rrca
    nop
    add  a, b
    nop
    ret  c

label_31F63::
    nop
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    jr   label_31F25
    ret  nz
    sub  a, h
    db   $E8 ; add  sp, d
    sub  a, h
    db   $E8 ; add  sp, d
    sub  a, h
    db   $E8 ; add  sp, d
    inc  [hl]
    ret  z

label_31F72::
    ld   c, b
    or   b

label_31F74::
    adc  a, b
    ld   [hl], b
    jr   z, label_31F68
    ret  z
    ld   a, [$FF78]
    add  a, b
    db   $FC ; Undefined instruction
    jr   nc, label_31F77
    nop

label_31F80::
    inc  bc
    nop
    inc  c
    inc  bc
    rra
    inc  c

label_31F86::
    ld   [hl], a
    ld   c, $3B
    ld   b, $0F
    nop
    ccf

label_31F8D::
    ld   a, [bc]
    ccf
    ld   a, [de]
    rla
    ld   c, $0B
    inc  b
    inc  c
    inc  bc
    ld   [label_F07], sp
    rlca
    add  hl, bc
    ld   b, $0F
    ld   bc, $001F
    ld   [rJOYP], a
    ret  nc
    jr   nz, label_31F8D
    ret  nc
    db   $E4 ; Undefined instruction
    ret  c
    ldh  [$FF0C], a
    inc  e
    ldi  [hl], a
    call c, label_D824
    jr   z, label_31F80
    jr   nc, label_31F72
    jr   nc, label_31F74

label_31FB4::
    ret  nc
    jr   nz, label_31FDF
    ld   a, [$FFC8]
    ld   a, [$FFF8]
    nop
    ld   a, [$FFE0]
    ld    hl, sp+$00
    nop
    nop

label_31FC2::
    inc  bc
    nop
    inc  l
    inc  bc
    ccf
    inc  c
    scf
    ld   c, $1B
    ld   b, $0F
    nop
    ccf
    ld   a, [bc]
    ccf
    ld   a, [de]
    rla
    ld   c, $09
    ld   b, $06
    ld   bc, label_306
    rrca
    ld   bc, label_E1F
    rra

label_31FDF::
    nop
    nop
    nop
    ld   a, [$FF00]
    call z, label_E230
    call c, label_DCE2
    ldh  [$FF0C], a
    inc  e
    inc  h
    ret  c
    inc  h
    ret  c
    jr   z, label_31FC2
    jr   nc, label_31FB4
    jr   nc, label_31FB6
    ret  c
    jr   nz, label_32035
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ret  z
    db   $FC ; Undefined instruction

label_31FFD::
    jr   label_31FFD
    nop
    rlca
    nop
    dec  bc
    rlca
    dec  de
    inc  b
    ccf
    inc  de
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction
    jr   label_3200E
    ld   c, l
    rst  $30
    ld   c, l
    db   $EB ; Undefined instruction
    ld   d, a
    rst  $38
    ld   d, b
    ld    hl, sp+$57
    rst  $30
    ld   c, a
    ld   a, [hl]
    ld   bc, label_E37
    rra
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    jr   label_3202D

label_32026::
    dec  sp
    rla
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction

label_3202D::
    jr   label_3202E
    dec  c
    rst  $30
    ld   l, l
    cp   e
    ld   [hl], a
    sbc  a, a

label_32035::
    ld   [hl], b
    sbc  a, [hl]
    ld   [hl], l
    sbc  a, a
    ld   [hl], l
    ld   e, h
    inc  sp

label_3203C::
    ccf
    nop
    rrca
    nop
    nop
    nop
    rlca
    nop
    dec  bc
    rlca
    dec  de
    inc  b

label_32048::
    ccf
    inc  de
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction
    jr   label_320D0
    nop
    ld   a, a
    ld   [hl], $6B
    ld   a, $7F
    ldi  [hl], a
    ld   h, e
    ld   a, $63
    ld   a, $3F
    inc  e
    rra
    nop
    nop
    nop
    ret  nz
    nop
    jr   nz, label_32026
    jr   label_32048
    call c, label_FCE8
    jr   z, label_32069
    ld   [label_18E4], sp
    ld    hl, sp+$B0
    db   $F4 ; Undefined instruction
    xor  b
    db   $F4 ; Undefined instruction
    ret  z
    db   $F4 ; Undefined instruction
    jr   c, label_32071
    or   b
    jr   nc, label_3203C
    ld    hl, sp+$00
    ld   a, [$FF00]
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    jr   label_3208F
    dec  sp
    rla
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction

label_3208F::
    nop
    ld   a, a
    ld   [hl], $6B
    ld   a, $7F
    ldi  [hl], a
    ld   h, e
    ld   a, $63
    ld   a, $7F
    inc  e
    ccf
    nop
    rra
    nop
    nop
    nop
    ld   [rJOYP], a
    ret  nc

label_320A5::
    ld   [$FFD8], a
    jr   nz, label_320A5

label_320A9::
    ret  z
    db   $FC ; Undefined instruction
    jr   z, label_320A9
    ld   [label_18E4], sp
    ld    hl, sp+$B0
    db   $EC ; Undefined instruction
    or   b
    sub  a, $E8
    db   $F2 ; Undefined instruction
    inc  c
    xor  $F4
    ld   a, h
    add  a, b
    db   $EC ; Undefined instruction
    ld   [hl], b
    ld    hl, sp+$00
    nop
    nop
    rlca
    nop
    dec  bc
    rlca
    dec  de
    inc  b

label_320C8::
    ccf
    inc  de
    ccf
    inc  d
    rst  $38
    db   $10 ; Undefined instruction
    ld   b, b

label_320D0::
    rst  $38
    ld   a, a
    sbc  a, $73
    sbc  a, $7F
    sbc  a, $7F
    sbc  a, $7F
    pop  hl
    ld   a, a
    ld   a, a
    ccf
    ccf
    nop
    nop
    nop
    ret  nz
    nop
    jr   nz, label_320A6
    jr   label_320C8
    call c, label_FCE8
    jr   z, label_320E9
    ld   [$98E4], sp
    ld    hl, sp+$B0
    db   $F4 ; Undefined instruction
    xor  b
    db   $F4 ; Undefined instruction
    adc  a, b
    db   $FC ; Undefined instruction
    or   b
    ld    hl, sp+$B0
    ld   a, [$FF80]
    ld    hl, sp+$00
    ld   a, [$FF00]
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    jr   label_3210F
    dec  sp
    rla
    rst  $38
    inc  d
    rst  $38
    ld   b, b
    rst  $38

label_3210F::
    ld   a, a
    sbc  a, $73
    sbc  a, $7F
    sbc  a, $7F
    sbc  a, $7F
    pop  hl
    ld   a, a
    ld   a, a
    ccf
    ld   a, a
    nop
    ccf
    nop
    nop
    nop
    ld   [rJOYP], a
    ret  nc

label_32125::
    ld   [$FFD8], a
    jr   nz, label_32125

label_32129::
    ret  z
    db   $FC ; Undefined instruction
    jr   z, label_32129
    adc  a, b
    db   $E4 ; Undefined instruction
    sbc  a, b
    ld    hl, sp+$B0
    db   $EC ; Undefined instruction
    or   b
    sub  a, $A8
    db   $F2 ; Undefined instruction
    adc  a, h
    adc  a, $B4
    db   $FC ; Undefined instruction
    nop
    db   $EC ; Undefined instruction
    ld   [hl], b
    ld    hl, sp+$00
    nop
    nop
    rlca
    nop
    ld   a, [de]
    rlca
    dec  a
    dec  de
    xor  $1D
    rst  $30
    ld   c, $FD
    ld   b, d
    rst  $38
    ld   d, h
    rst  $38
    ld   [hl], $AF
    ld   e, [hl]
    or   e
    ld   c, h
    xor  a
    ld   d, e
    cp   a
    ld   b, e
    xor  e
    ld   b, h
    rst  $28
    ld   bc, $001F
    nop
    nop
    ret  nz
    nop
    jr   nz, label_32126
    sub  a, b
    ld   [rOBP0], a
    or   b
    db   $E4 ; Undefined instruction
    ld   e, b
    ld   h, h
    ret  c
    db   $E8 ; add  sp, d
    ret  nc
    ld   a, [$FFC0]
    and  b
    ret  nz
    ld   [rJOYP], a
    sub  a, b
    ld   h, b
    adc  a, b
    ld   [hl], b
    ld    hl, sp+$00
    ld   a, [$FFE0]
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   e, e
    rlca

label_32188::
    ld   a, h
    dec  de
    ld   l, [hl]
    dec  e
    rst  $30
    ld   c, $FD
    ld   b, d
    rst  $38
    ld   d, h
    rst  $38
    ld   [hl], $AF
    ld   e, b
    cp   a
    ld   b, [hl]
    cp   a
    ld   b, [hl]
    and  a
    ld   b, b
    xor  a
    ld   b, a
    rst  $18
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    jr   label_32188
    call nz, label_304F8
    cp   b
    db   $E4 ; Undefined instruction
    ld   e, b
    ld   l, b
    ret  nc
    db   $E8 ; add  sp, d
    ret  nc
    ld   a, [$FFC0]
    ld   [$FF80], a
    sbc  a, b
    ld   h, b
    inc  e
    db   $E8 ; add  sp, d
    inc  a
    ret  z
    db   $FC ; Undefined instruction

label_321BD::
    jr   label_321BD
    nop
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc
    rlca
    ld   [de], a
    dec  c
    daa
    ld   a, [de]
    ld   h, $1B
    rla
    dec  bc
    rrca
    inc  bc
    dec  b
    inc  bc
    rlca
    nop
    add  hl, bc
    ld   b, $10
    rrca
    rra
    nop
    rrca
    rlca
    rra
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   e, b
    ld   [$FFBC], a
    ret  c
    ld   [hl], a
    cp   b
    rst  $28
    ld   [hl], b
    cp   a
    ld   b, d
    rst  $38
    ld   a, [hli]
    ei
    ld   l, h
    db   $FD ; Undefined instruction
    ld   [bc], a
    dec  e
    ld   [label_32A9D], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    push af
    ld   [bc], a
    db   $E3 ; Undefined instruction
    add  a, b
    ld    hl, sp+$00
    inc  bc
    nop
    rrca
    inc  bc
    ld   de, label_230E
    dec  e
    rst  $30
    ld   a, [bc]
    cp   a
    ld   d, b
    cp   a
    ld   e, d
    ld   a, a
    ld   [bc], a
    ccf
    jr   label_32250
    dec  de
    jr   c, label_3222D
    rra
    nop
    ld   de, label_3C0E
    inc  bc
    ld   a, e
    inc  a
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    jp  c, label_3EE0
    ret  c
    halt
    rst  $28

label_3222D::
    ld   [hl], b
    cp   a
    ld   b, d
    rst  $38
    ld   a, [hli]
    ei
    ld   l, h
    db   $FD ; Undefined instruction
    ld   [bc], a
    dec  e
    ld   [label_32A9D], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    push af
    ldh  [$FF0C], a
    ei
    nop
    rlca
    nop
    ld   [label_1307], sp
    rrca
    inc  h
    dec  de
    ld   c, a
    inc  [hl]
    ld   c, l
    ld   [hl], $2F
    ld   d, $1F
    ld   b, $FF
    ld   bc, label_32DFE
    rst  $10
    ld   a, h
    rst  $38
    ld   b, l
    rst  0
    ld   a, l
    rst  0
    ld   a, h
    ld   a, a
    dec  sp
    ccf
    nop
    nop
    nop
    rrca
    nop
    ld   sp, label_3060F
    ccf
    ld   b, h
    dec  sp
    ld   c, a
    inc  [hl]
    dec  l
    ld   d, $2F
    ld   d, $7F
    nop
    ld   a, a
    ld   [hl], $6B
    ld   a, $7F
    ldi  [hl], a
    ld   h, e
    ld   a, $63
    ld   a, $3F
    inc  e
    ccf
    nop
    rlca
    nop
    ld   [label_1307], sp
    rrca
    inc  h
    dec  de
    ld   c, a
    inc  [hl]
    ld   a, l
    ld   b, $3F
    db   $10 ; Undefined instruction
    rra
    scf
    inc  e
    scf
    rra
    scf
    rra
    scf
    rra
    jr   c, label_322B9
    rra
    rrca
    rrca
    nop
    rra
    nop
    ret  nz
    nop
    or   b
    ret  nz
    ld   a, b
    or   b
    xor  $70
    call c, label_330E0

label_322AB::
    add  a, b
    db   $FC ; Undefined instruction
    jr   nz, label_322AB
    db   $E8 ; add  sp, d
    cp   b
    ld   [$FFB0], a
    ld   [$FFB0], a
    ld   [$FFB0], a
    ld   [rSVBK], a

label_322B9::
    ld   [$FFE0], a
    ret  nz
    ld   [rJOYP], a
    ld   a, [$FF00]
    nop
    nop
    rrca
    nop
    ld   sp, label_3060F
    ccf
    ld   b, h
    dec  sp
    ld   a, a
    inc  b
    ld   a, a
    jr   nz, label_3234E
    ccf
    ld   l, a
    add  hl, sp
    ld   l, a
    ccf
    ld   l, a
    ccf
    ld   l, a
    ccf
    ld   [hl], b
    ccf
    ccf
    rra
    rra
    nop
    ld   a, a
    nop
    nop
    nop
    ret  nz
    nop
    or   h
    ret  nz
    ld   a, h
    or   b
    db   $EC ; Undefined instruction
    ld   [hl], b
    ld    hl, sp+$00
    ld   a, [$FF40]
    db   $FC ; Undefined instruction
    ret  nc
    ld   a, h
    ret  c
    ld   l, b
    ret  nc
    ld   [hl], b
    ret  nz
    ld   h, b
    ret  nz
    ld   [$FFC0], a
    ld   a, [$FF80]
    ld    hl, sp+$70
    ld    hl, sp+$00
    nop

label_32301::
    nop
    inc  bc
    nop
    rlca
    nop
    rrca
    inc  bc
    rra
    inc  b
    dec  a
    inc  de
    jr   c, label_32325
    db   $3A ; ldd  a, [hl]
    dec  d
    inc  l
    inc  de
    inc  [hl]
    dec  bc
    inc  l
    inc  de
    inc  a
    dec  bc
    rla
    inc  c
    jr   label_32323
    rra
    nop
    rrca
    nop
    rst  $20
    nop
    rst  $38

label_32323::
    ld   b, d
    rst  $38

label_32325::
    ld   e, $F3
    adc  a, $FB
    ld   h, $BF
    jp   z, label_EA9F
    sbc  a, a
    ld   [$EA15], a
    db   $3A ; ldd  a, [hl]
    call nz, label_A05C
    xor  h

label_32337::
    ld   [hl], b
    ret  z
    ld   a, [$FF38]
    ret  nz
    db   $FC ; Undefined instruction
    jr   nc, label_32337
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    inc  bc
    rra
    inc  b
    dec  a
    inc  de
    add  hl, sp
    rla

label_3234E::
    add  hl, sp
    rla
    jr   z, label_32369
    inc  a
    inc  bc
    ld   a, [hli]
    dec  d
    dec  [hl]
    ld   c, $13
    rrca
    inc  e
    inc  bc

label_3235C::
    ccf
    inc  c
    rra
    nop
    nop
    nop
    rst  $20
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    adc  a, $FB

label_32369::
    ld   h, $BF
    jp   z, label_EA1F
    ld   e, a
    xor  d
    scf
    jp   z, label_C23D
    db   $3A ; ldd  a, [hl]
    call nz, label_D02C
    db   $E8 ; add  sp, d
    jr   nc, label_32393
    ld   [$FFF8], a
    nop
    ld   a, [$FF00]
    scf
    nop
    ld   a, $07
    ld   a, a
    ld   bc, $007F
    ld   a, a
    ld   a, $7F
    dec  l
    ld   a, a
    dec  l
    ld   a, a
    scf
    ccf
    ld   [de], a
    rra

label_32393::
    ld   bc, label_D13
    ld   de, label_F0E
    nop
    rlca
    nop
    rrca
    rlca
    rra
    nop
    add  a, b
    nop
    ld   b, b

label_323A3::
    add  a, b
    ccf
    ret  nz
    cp   l
    sbc  a, $E9
    ld   d, [hl]
    db   $FD ; Undefined instruction
    adc  a, d
    ld   sp, hl
    sub  a, [hl]
    ld   a, a
    add  a, b

label_323B0::
    ld    hl, sp+$30
    ld    hl, sp+$B0
    ld    hl, sp+$80
    ret  z
    jr   nc, label_32351
    ld   h, b
    db   $FC ; Undefined instruction
    ld   [$98FC], sp
    db   $FC ; Undefined instruction
    nop
    rra
    nop
    daa
    dec  de
    ld   e, e
    inc  h
    cp   l
    ld   d, e
    ld   sp, hl
    rla
    db   $3A ; ldd  a, [hl]
    dec  d
    ld   l, h
    inc  de
    ld   e, h
    inc  hl
    ld   c, h
    inc  sp
    dec  sp
    inc  b
    rla
    rrca
    jr   label_323DF
    rra
    nop
    rrca
    nop
    ld   bc, $0000

label_323DF::
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ret  c
    jr   nz, label_323A3
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    sbc  a, h
    db   $E8 ; add  sp, d
    sub  a, h
    db   $E8 ; add  sp, d
    jr   c, label_323B0
    ret  c
    jr   nc, label_3241B
    ld   a, [$FFC8]
    ld   a, [$FF38]

label_323F7::
    ret  nz
    ret  z
    jr   nc, label_323F7
    ld   [hl], b
    ld    hl, sp+$00
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, a
    db   $E8 ; add  sp, d
    sbc  a, a
    ld   [$EA97], a
    ccf
    jp   nz, label_AA57
    sub  a, a
    ld   l, d
    cpl

label_32417::
    db   $F2 ; Undefined instruction
    rst  8
    db   $F2 ; Undefined instruction
    ld   a, $C0
    db   $FC ; Undefined instruction
    jr   nc, label_32417
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    ld   e, [hl]
    xor  b
    scf
    jp   z, label_C63D
    dec  l
    sub  a, $2D
    sub  a, $DD
    ld   h, $FD
    and  $1E
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    ld   a, [de]
    dec  b
    ccf
    inc  de
    ccf
    inc  d
    ld   a, a
    ld   d, b
    ld   h, a
    ld   e, b
    ld   a, a
    ld   l, l
    ccf
    dec  [hl]
    rra
    jr   label_3246A
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    ld   a, [de]
    dec  b

label_3246A::
    ccf
    inc  de
    ccf
    inc  d
    ccf
    db   $10 ; Undefined instruction
    ld   e, b
    ld   a, a
    ld   l, l
    ld   [hl], a
    ld   l, l
    dec  sp
    scf
    rra
    jr   label_3248A
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    dec  c
    inc  bc

label_3248A::
    ld   e, $0D
    ld   [hl], a
    ld   c, $3B
    rlca
    ld   c, $01
    ccf
    ld   a, [bc]
    ld   a, a
    ld   e, e
    ld   [hl], a
    ld   l, a
    ccf
    jr   nc, label_324BA
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   [rBGPI], a
    ld   a, [$FF24]
    ret  c
    db   $F2 ; Undefined instruction
    inc  l
    or   d
    ld   l, h
    db   $F2 ; Undefined instruction
    ld   l, h
    or   $6A
    sbc  a, $66
    db   $FC ; Undefined instruction
    inc  c

label_324BA::
    ld    hl, sp+$F8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    nop
    rrca
    inc  bc
    rra
    inc  b
    dec  a
    inc  de
    add  hl, sp
    rla
    ld   a, d
    ld   d, l
    ld   l, h
    ld   d, e
    ld   a, h
    ld   h, e
    ld   a, h
    ld   [hl], e
    inc  a
    dec  sp
    rrca
    inc  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    sbc  a, [hl]
    ld   [$EA96], a
    ld   e, $E6
    ld   a, $DE
    ld   a, h
    cp   h
    ld   a, [$FF70]
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    add  hl, bc
    ld   b, $16
    rrca
    daa
    jr   label_32532
    dec  de
    ld   c, l
    dec  sp
    ld   c, d
    dec  a
    ld   b, c
    ld   a, $43
    inc  a
    ccf
    nop
    inc  d
    rrca
    inc  de
    rrca
    inc  c
    inc  bc
    rlca
    nop
    ld   bc, $0000
    nop
    ld   a, [$FF00]
    ld    hl, sp+$80
    ld    hl, sp+$40
    ld   [hl], b

label_32529::
    and  b
    db   $FC ; Undefined instruction
    jr   nz, label_32529
    adc  a, b
    cp   $A0
    ld   e, [hl]
    xor  h

label_32532::
    cp   [hl]
    ld   b, h
    rst  $38
    ld   [label_2ADD], sp
    db   $EB ; Undefined instruction
    or   [hl]
    or   $1C
    db   $FC ; Undefined instruction
    ld   l, b
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    inc  bc
    nop
    dec  c
    inc  bc
    ld   e, $0D
    ld   [hl], a
    ld   c, $3B
    rlca
    ld   c, $01
    ccf
    ld   a, [bc]
    ccf
    dec  de
    scf
    cpl
    jr   c, label_3258F
    rra
    jr   label_3256A
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    db   $10 ; Undefined instruction
    ret  z
    ld   a, [$FF24]
    ret  c
    db   $F2 ; Undefined instruction
    inc  l
    or   d
    ld   l, h
    db   $F2 ; Undefined instruction
    ld   l, h
    db   $F4 ; Undefined instruction
    ld   l, b
    call c, label_FC64
    ld   c, h
    ld    hl, sp+$18
    ld   a, [$FFF0]
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    nop
    rrca
    inc  bc
    rra
    inc  b
    dec  a
    inc  de
    add  hl, sp
    rla
    db   $3A ; ldd  a, [hl]

label_3258F::
    dec  d
    inc  l
    inc  de
    inc  a
    inc  hl
    inc  a
    inc  hl
    inc  a
    inc  sp
    rra
    inc  e
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    sbc  a, h
    db   $E8 ; add  sp, d
    sub  a, h
    db   $E8 ; add  sp, d
    inc  e
    db   $E4 ; Undefined instruction
    inc  a
    call z, label_9C7C
    ld    hl, sp+$38
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca

label_325C5::
    jr   label_325E6
    jr   nz, label_32608
    ld   b, b
    ccf
    ld   b, b
    rrca
    ld   a, [$FF7F]
    add  a, b
    ld   a, a
    add  a, b
    ccf
    ld   b, b
    ld   bc, label_1F3E
    jr   nz, label_32618
    ld   b, b
    rra
    jr   nz, label_325E4
    jr   label_325DF

label_325DF::
    rlca
    nop
    nop
    nop
    inc  bc

label_325E4::
    inc  bc
    inc  e

label_325E6::
    rra
    jr   nz, label_32608
    jr   nz, label_325EE
    inc  a
    ccf
    ret  nz

label_325EE::
    ld   a, a
    nop
    ld   a, a
    add  a, b
    ccf
    ld   b, b
    rlca
    jr   label_32616
    jr   nz, label_32638
    ld   b, b
    rra
    jr   nz, label_32600
    inc  e
    nop
    inc  bc

label_32600::
    rra
    nop
    dec  hl
    dec  e
    ld   e, a
    jr   nc, label_325C5
    ld   h, e

label_32608::
    rst  $38
    ld   c, a
    cp   a
    ld   c, h
    cp   $19
    db   $ED ; Undefined instruction
    ld   e, e
    ld   [hl], a
    ld   l, $7E
    ld   bc, label_31BE4

label_32616::
    di
    ld   l, h

label_32618::
    ld   a, a
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    nop
    nop
    jr   nc, label_32622

label_32622::
    ld    hl, sp+$30
    ld    hl, sp+$90
    ret  c
    jr   nz, label_32671
    or   b
    db   $EC ; Undefined instruction
    sub  a, b
    sbc  a, $AC
    sbc  a, [hl]
    ld   l, h
    ld   [hl], $EC
    ld   a, d
    call z, label_80FC
    db   $F4 ; Undefined instruction
    ld   [$D068], sp
    or   b
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    add  hl, bc
    rlca
    dec  bc
    rlca
    rrca
    ld   b, $06
    ld   bc, label_60D
    rlca
    ld   bc, $0001
    nop
    nop

label_3265A::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, b
    nop
    ld   [rLCDC], a
    and  b
    ld   b, b
    ld   [hl], b
    and  b
    ld   [hl], b

label_32671::
    and  b
    ld   [rJOYP], a
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, $0103
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   a, b
    ei
    ld   [hl], a
    ei
    ld   h, h
    cp   a
    ld   d, e
    cp   a
    ld   d, h
    cp   a
    ld   d, b
    and  a
    ld   e, b
    sbc  a, a
    ld   l, l
    or   a
    ld   c, l
    swap a
    rst  8
    ld   [hl], b
    ld    hl, sp+$67
    rst  $30
    rrca
    sbc  a, h
    ld   h, e
    xor  a
    ld   e, h
    rst  $38
    nop
    rst  $38
    ld   a, $3F
    sbc  a, $1F
    and  $DD
    ld   [label_2AFD], a
    db   $FD ; Undefined instruction
    ld   a, [bc]
    push hl
    ld   a, [de]
    ld   sp, hl
    or   [hl]
    db   $ED ; Undefined instruction
    or   d
    rst  $10
    db   $E8 ; add  sp, d
    di
    ld   c, $1F
    and  $FF
    ld   a, [$FF39]
    add  a, $F5
    db   $3A ; ldd  a, [hl]
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    ld   c, $FE
    dec  e
    and  $1D
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    ldh  [$FF0C], a
    dec  e
    db   $E3 ; Undefined instruction
    dec  e
    db   $E3 ; Undefined instruction
    dec  e
    and  e
    ld   e, h
    db   $E3 ; Undefined instruction
    ld   e, h
    rst  $38
    ld   b, b
    rst  $38
    nop
    cpl
    ld   a, [$FF5F]
    db   $EC ; Undefined instruction
    cp   e
    ld   e, h
    rst  $30
    cp   b
    rst  $38
    call nz, label_D6FF
    ld   a, e
    call c, label_318A7
    ld   e, a
    and  b
    inc  hl
    call c, label_9CFF
    jp   label_FFBC
    nop
    rst  $18
    db   $3A ; ldd  a, [hl]
    rst  $38
    ld   [bc], a
    ld   sp, hl
    rlca
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ret  c
    daa
    ret  c
    daa
    ld    hl, sp+$17
    db   $FC ; Undefined instruction
    rrca
    ei
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    add  a, e
    ld   a, h
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   [rIE], a
    ld   a, [$FF7F]
    ld    hl, sp+$27
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$87
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$05
    ld   a, [label_33A87]
    rst  $38
    ld   [bc], a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, h
    ld   a, a
    add  a, [hl]
    ld   a, a
    add  a, a
    ld   a, a
    add  a, e
    ld   a, a
    add  a, c
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    rrca
    cp   $1F

label_32786::
    db   $E4 ; Undefined instruction
    rra
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    and  b
    ld   e, a
    pop  hl
    ld   e, [hl]
    rst  $38
    ld   b, b
    sbc  a, a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF3F], a
    ret  nz
    ld   a, a
    add  a, b
    pop  bc
    ld   a, $FF
    ld   a, [hl]
    rst  $38
    cp   $C0
    nop
    and  b
    ret  nz
    jr   nc, label_32786
    db   $E8 ; add  sp, d
    ld   a, [$FFFC]
    nop
    rst  $38
    nop
    cp   $00
    ld    hl, sp+$D0
    db   $E8 ; add  sp, d
    ld   [hl], b
    ld   [hl], b
    add  a, b
    ld   a, [$FF60]
    ld   a, [$FFE0]
    ld   a, [$FF00]
    ld   a, b
    add  a, b
    cp   h
    ld   a, b
    db   $FC ; Undefined instruction
    nop
    dec  de
    nop
    dec  a
    dec  de
    ccf
    jr   label_32826
    nop
    cpl
    ld   de, label_152F
    cpl
    rla
    dec  hl
    ld   d, $2B
    ld   d, $15
    dec  bc
    dec  de
    inc  b
    jr   label_32807
    daa
    rra
    ld   a, b
    daa
    rst  $30
    ld   a, b
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_32807::
    nop
    nop
    rra
    rrca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    rrca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    rra
    nop
    nop
    nop
    nop
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rrca
    rra
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    rra
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rra
    db   $10 ; Undefined instruction
    rra
    rra
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    inc  b
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    rra
    rrca
    rra
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld    hl, sp+$FC
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rra
    rra
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    inc  a
    ld   e, d
    ld   h, [hl]
    sbc  a, c
    rst  $20
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    ld   a, [hl]
    ld   a, [hl]
    inc  a
    inc  h
    inc  a
    inc  h
    inc  a
    inc  h
    inc  a
    inc  h
    jr   label_328F4
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_328FC
    inc  a
    inc  h
    inc  a
    inc  h
    ld   a, [hl]
    ld   b, d
    rst  $38
    sbc  a, c
    rst  $38
    and  l
    rst  $38
    and  l
    rst  $38
    sbc  a, c
    ld   a, [hl]
    ld   b, d

label_328F4::
    inc  a
    inc  a
    inc  e
    inc  d
    ld   a, h
    ld   [hl], h
    ld   a, h
    ld   d, h

label_328FC::
    ld   a, h
    ld   b, h
    ld   a, h
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    db   $FF
    rst  $38
    cp   [hl]
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    rst  $18
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $20
    reti
    rst  $18
    and  b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $18
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $20
    reti
    rst  $18
    and  b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, $00FF
    ld    hl, sp+$07
    ret  nc
    cpl
    sub  a, c
    ld   l, [hl]
    add  a, e
    ld   a, l
    or   e
    ld   c, l
    rst  $38
    ld   sp, label_35FF
    rst  $28
    dec  e
    sub  a, a
    ld   l, a
    adc  a, e
    ld   [hl], a
    rst  0
    jr   c, label_329A0
    nop
    rst  $38
    ld   b, $FF
    ld   b, $FF
    ld   b, $FF
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   sp, hl
    rlca
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    dec  de
    db   $FC ; Undefined instruction
    inc  de
    rst  $38
    dec  de
    ei
    ld   b, $F7
    ld   c, $CF
    scf
    sbc  a, e
    ld   h, a
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    dec  c
    rst  $38
    dec  c
    rst  $38
    dec  c
    rst  $38
    nop
    pop  af
    ld   c, $EE
    rla
    xor  $1B
    xor  $1D
    ret  nz
    ccf
    add  a, b
    ld   a, a
    or   d
    ld   c, l
    cp   b
    ld   d, a
    sbc  a, h
    ld   h, e
    rst  $18
    inc  a
    rst  $28
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FF
    cp   $07
    db   $FC ; Undefined instruction
    rrca
    ld    hl, sp+$1F
    cp   $1F
    cp   $03
    cp   $03
    cp   $03
    cp   $03
    cp   $03
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    nop
    ld   [rJOYP], a
    ld   c, $00
    rst  $38
    nop
    ld   a, h
    nop
    ld   sp, $8700
    nop
    ld   a, a
    nop
    ld   a, [hl]
    nop
    ld   d, h
    nop
    pop  bc
    nop
    ld   l, e
    add  a, b
    ld   a, [hl]
    add  a, c
    push de
    ld   a, [hli]
    rst  $10
    jr   z, label_32A31

label_32A31::
    rst  $38
    ld   h, e
    sbc  a, h
    nop
    rst  $38
    sub  a, h
    ld   h, e
    nop
    rst  $38
    ld   b, $F9
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  8
    nop
    rst  $38

label_32A45::
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    jr   c, label_32A56

label_32A56::
    add  a, e
    nop
    rst  $38
    nop
    pop  af
    nop
    call nz, label_1E00
    nop
    sub  a, l
    ld   l, d
    rst  $10

label_32A63::
    jr   z, label_32A63
    nop
    ld   e, [hl]
    nop
    inc  d
    nop
    and  c
    nop
    ld   [label_33C01], a
    add  a, e
    nop
    rst  $38
    inc  de
    xor  h
    nop
    rst  $38
    jr   nc, label_32A45
    nop
    rst  $38
    ld   b, $F9
    nop
    rst  $38
    and  b
    rra
    rst  $38

label_32A81::
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    ld   c, $00
    ld   [rJOYP], a
    rst  $38
    nop
    rst  0
    nop
    inc  de

label_32A9D::
    nop
    ld   a, b
    nop
    ld   l, e
    add  a, b
    ld   a, $C1
    xor  c
    ld   d, [hl]
    db   $EB ; Undefined instruction
    inc  d
    ld   a, a
    nop
    ld   a, [hl]
    nop
    ld   e, [hl]
    nop
    rlc  b
    nop
    rst  $38
    jr   nc, label_32A81
    nop
    rst  $38
    ld   b, $D9
    nop
    rst  $38
    pop  bc
    ld   a, $00
    rst  $38
    inc  d
    db   $E3 ; Undefined instruction
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop

label_32AD4::
    add  a, e
    nop
    jr   c, label_32AD8

label_32AD8::
    rst  $38
    nop
    rra
    nop
    ld   c, h
    nop
    pop  hl
    nop
    ld   e, h
    nop
    push de
    nop
    ld   d, e
    add  a, b
    db   $3A ; ldd  a, [hl]
    pop  bc
    sbc  a, l
    ld   h, d
    push de
    ld   a, [hli]
    ld   [hl], a
    ld   [$003E], sp
    nop
    rst  $38
    adc  a, b
    dec  [hl]
    nop
    rst  $38
    inc  c
    or   e
    nop
    rst  $38
    inc  sp
    call z, label_FF00
    ld   a, [bc]
    pop  af
    inc  bc
    nop
    inc  e
    inc  bc
    ld   [$FF1F], a
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [label_1F0], sp
    nop
    ld   de, $CE00
    nop
    ret  nz
    nop
    jr   c, label_32AD4
    rlca
    ld    hl, sp+$40
    ccf
    ld   [$8007], sp
    nop
    and  d
    nop
    ld   a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ret  nz
    nop
    add  hl, bc
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
    rlca
    nop
    add  a, b
    nop
    ret  c
    nop
    inc  bc
    nop
    inc  e
    nop
    ld   [rJOYP], a
    add  hl, bc
    nop
    ld   bc, $E600
    nop
    rst  $38
    nop
    rst  $38
    nop
    ret  nz
    nop
    jr   c, label_32B54

label_32B54::
    rrca
    nop
    and  b
    nop
    call z, label_3500
    nop
    ei
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    ld   [rJOYP], a
    ld   bc, label_3300
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rrca
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    nop
    inc  e
    inc  bc
    ldh  [$FF0C], a
    inc  e
    ld   [label_3F0], sp
    nop
    jr   nz, label_32B8C

label_32B8C::
    adc  a, a
    nop
    rst  $38
    nop
    ret  nz
    nop
    jr   c, label_32B54

label_32B94::
    ld   b, a
    jr   c, label_32BA7
    rrca
    stop
    ld   b, b
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    ld   bc, label_300

label_32BA7::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
    nop
    nop
    ret  nz
    nop
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    nop
    inc  e
    inc  bc
    ld   [$FF1F], a
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    ld    hl, sp+$10
    ld   [rTIMA], a
    nop
    ret  nz
    nop
    jr   c, label_32B94
    rlca
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    jr   nz, label_32BFB
    ld   [label_30007], sp
    nop
    inc  bc
    nop
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ret  nz
    nop
    add  a, b
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_32BFB::
    nop
    ccf
    nop
    rlca
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    nop
    ld   [rJOYP], a
    ld   c, $00
    rst  $38
    nop
    ld   a, h
    nop
    ld   sp, $8700
    nop
    jr   c, label_32C22

label_32C22::
    jr   c, label_32C24

label_32C24::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_32C2C

label_32C2C::
    jr   c, label_32C2E

label_32C2E::
    nop
    nop
    nop
    nop
    jr   c, label_32C34

label_32C34::
    jr   c, label_32C36

label_32C36::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_32C3E

label_32C3E::
    jr   c, label_32C40

label_32C40::
    rst  $38
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    jr   c, label_32C56

label_32C56::
    add  a, e
    nop
    rst  $38
    nop
    pop  af
    nop
    call nz, label_1E00
    nop
    nop
    nop
    jr   c, label_32C64

label_32C64::
    cp   d
    nop
    add  a, $00
    add  a, $00
    ld   b, h
    nop
    jr   c, label_32C6E

label_32C6E::
    nop
    nop
    nop
    nop
    jr   c, label_32C74

label_32C74::
    ld   b, h
    nop
    add  a, $00
    add  a, $00
    cp   d
    nop
    jr   c, label_32C7E

label_32C7E::
    nop
    nop
    rst  $38
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    ld   c, $00
    ld   [rJOYP], a
    rst  $38
    nop
    rst  0
    nop
    inc  de
    nop
    ld   a, b
    nop
    nop
    nop
    jr   c, label_32CA4

label_32CA4::
    jr   c, label_32CA6

label_32CA6::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_32CAE

label_32CAE::
    jr   c, label_32CB0

label_32CB0::
    jr   c, label_32CB2

label_32CB2::
    jr   c, label_32CB4

label_32CB4::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_32CBC

label_32CBC::
    jr   c, label_32CBE

label_32CBE::
    nop
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    add  a, e
    nop
    jr   c, label_32CD8

label_32CD8::
    rst  $38
    nop
    rra
    nop
    ld   c, h
    nop
    pop  hl
    nop
    nop
    nop
    jr   c, label_32CE4

label_32CE4::
    ld   b, h
    nop
    add  a, $00
    add  a, $00
    cp   d
    nop
    jr   c, label_32CEE

label_32CEE::
    nop
    nop
    nop
    nop
    jr   c, label_32CF4

label_32CF4::
    cp   d
    nop
    add  a, $00
    add  a, $00

label_32CFA::
    ld   b, h
    nop
    jr   c, label_32CFE

label_32CFE::
    nop
    nop
    ccf
    ccf
    ld   b, d
    ld   b, d
    add  a, h
    add  a, h
    adc  a, d
    adc  a, b
    sub  a, e
    sub  a, b
    sub  a, [hl]
    sub  a, c
    sub  a, [hl]
    sub  a, c
    adc  a, e

label_32D0F::
    adc  a, c
    db   $FC ; Undefined instruction

label_32D11::
    db   $FC ; Undefined instruction
    jp   nz, label_B1C2
    and  c
    sbc  a, c
    sub  a, c
    ld   e, c
    ld   de, label_11D9
    ld   e, c
    sub  a, c
    or   c
    and  c
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    jr   label_32D0F
    jr   label_32D11
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   a, h
    ld   a, h
    nop
    nop
    ccf
    ccf
    ld   b, e
    ld   b, e
    adc  a, l
    add  a, l
    sbc  a, b
    adc  a, b
    sbc  a, c
    adc  a, b
    sbc  a, e
    adc  a, b
    sbc  a, d

label_32D4D::
    adc  a, c
    adc  a, l
    add  a, l
    ld   a, h
    ld   a, h
    ldi  [hl], a

label_32D53::
    ldi  [hl], a
    ld   de, label_31111
    ld   de, label_9C9
    ld   l, c
    adc  a, c
    ld   l, c
    adc  a, c
    pop  de
    sub  a, c
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    jr   label_32D4D
    inc  h
    jp   label_C324
    jr   label_32D53
    nop
    rst  $38
    add  a, c
    ld   a, [hl]
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   a, h
    ld   a, h
    nop
    nop
    ccf
    ccf
    ld   b, b
    ld   b, b
    sbc  a, a
    add  a, c
    cp   [hl]
    add  a, d
    cp   h
    add  a, h
    cp   b
    adc  a, b
    cp   c
    adc  a, b
    sbc  a, l
    add  a, l
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [bc], a
    ld   [bc], a
    ld   sp, hl
    pop  bc
    cp   l
    and  c
    dec  e
    ld   de, label_119D
    dec  e
    sub  a, c
    cp   c
    and  c
    add  a, c
    ld   a, [hl]
    inc  a
    jp   label_8166
    ld   b, d
    add  a, c
    ld   b, d
    add  a, c
    ld   h, [hl]
    add  a, c
    inc  a
    jp   label_33E81
    nop
    nop
    db   $10 ; Undefined instruction
    jr   z, label_32DDE
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   b, h
    ld   l, h
    ld   a, h
    ld   a, h
    nop
    nop
    ccf
    ccf
    ld   b, c
    ld   b, c
    sbc  a, a
    add  a, e
    cp   l
    add  a, l
    cp   b
    adc  a, b
    cp   c
    adc  a, b
    cp   b
    adc  a, c
    sbc  a, l
    add  a, l
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    add  a, d
    add  a, d
    ld   a, c
    ld   b, c
    dec  a
    ld   hl, label_119D
    db   $11
    ld   de, $915D

label_32DDE::
    cp   c
    and  c
    cp   l
    ld   b, d
    ld   h, [hl]
    add  a, c
    jp   label_8100
    nop
    add  a, c
    nop
    jp   label_32600
    add  a, c
    cp   l
    ld   b, d
    db   $10 ; Undefined instruction
    jr   z, label_32E1C
    jr   z, label_32E1E
    ld   l, h
    ld   l, h
    ld   b, h
    ld   l, h
    ld   l, h
    ld   b, h
    ld   a, h
    ld   a, h

label_32DFE::
    nop
    nop
    inc  a
    nop
    jp   label_1800
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    pop  af
    rst  $38
    adc  a, $F2
    sbc  a, [hl]
    ldh  [$FF0C], a
    cp   h
    call nz, label_C4BD
    cp   l
    call nz, label_E4DC

label_32E1E::
    ldh  [$FF0C], a
    cp   $0F
    rst  $38
    di
    adc  a, a
    ld   a, c
    ld   b, a
    dec  a
    inc  hl
    dec  a
    inc  hl
    cp   l
    inc  hl
    cp   e
    daa
    ld   b, a
    ld   a, a
    rst  $38
    rst  $38
    cp   l
    ld   a, [hl]
    set  6, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    nop
    ld   a, [$FF00]
    ld   b, $F9
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  0
    ld   sp, hl
    adc  a, $F2
    call z, label_CDF4
    db   $F4 ; Undefined instruction
    push hl
    db   $FC ; Undefined instruction
    db   $F2 ; Undefined instruction
    cp   $1F
    rst  $38
    rst  0
    cp   a
    ld   h, e
    ld   e, a
    ld   [hl], e
    ld   c, a
    or   e
    cpl
    or   e
    cpl
    daa
    ccf
    ld   c, a
    ld   a, a
    rst  $38
    rst  $38
    ld   l, a
    sbc  a, a
    db   $F2 ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   label_3C00
    nop
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    di
    db   $FD ; Undefined instruction
    and  $FA
    and  $FA
    push hl
    db   $FC ; Undefined instruction
    push hl
    db   $FC ; Undefined instruction
    db   $F2 ; Undefined instruction
    cp   $FF
    rst  $38
    rra
    rst  $38
    rst  8
    ccf
    rst  $20
    sbc  a, a
    ld   h, a
    ld   e, a
    daa
    ccf
    and  a
    ccf
    ld   c, a
    ld   a, a
    rst  $38
    rst  $38
    db   $DB
    rst  $20
    cp   h
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FF00]
    rrca
    nop
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    pop  af
    rst  $38
    db   $F2 ; Undefined instruction
    cp   $FA
    cp   $FE
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rra
    rst  $38
    adc  a, a
    rst  $38
    ld   c, a
    ld   a, a
    ld   c, a
    ld   a, a
    ld   e, a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    or   $F9
    cpl
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    ccf
    ld   b, d
    ld   b, d
    add  a, h
    add  a, h
    adc  a, d
    adc  a, b
    sub  a, e
    sub  a, b
    sub  a, [hl]
    sub  a, c
    sub  a, [hl]
    sub  a, c
    adc  a, e
    adc  a, c
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    jp   nz, label_B1C2
    and  c
    sbc  a, c
    sub  a, c
    ld   e, c
    ld   de, label_11D9
    ld   e, c
    sub  a, c
    or   c
    and  c
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    rst  $38
    ldd  [hl], a
    rst  $28
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    nop

label_32F2D::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    cp   l
    jr   z, label_32F2D
    nop
    rst  $38
    inc  h
    rst  $38
    ld   e, d
    cp   l
    nop
    rst  $38
    nop
    rst  $38
    ccf
    ccf
    ld   b, e
    ld   b, e
    adc  a, l
    add  a, l
    sbc  a, b
    adc  a, b
    sbc  a, c
    adc  a, b
    sbc  a, e
    adc  a, b
    sbc  a, d
    adc  a, c
    adc  a, l
    add  a, l
    ld   a, h
    ld   a, h
    ldi  [hl], a
    ldi  [hl], a
    ld   de, label_31111
    ld   de, label_9C9
    ld   l, c
    adc  a, c
    ld   l, c
    adc  a, c
    pop  de
    sub  a, c
    nop
    rst  $38
    inc  a
    rst  $38
    ld   b, d
    rst  $38
    sbc  a, c
    rst  0
    or   c
    rst  8
    add  a, c
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    jr   label_32F79
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ccf
    ccf
    ld   b, b
    ld   b, b
    sbc  a, a
    add  a, c
    cp   [hl]
    add  a, d
    cp   h
    add  a, h
    cp   b
    adc  a, b
    cp   c
    adc  a, b
    sbc  a, l
    add  a, l
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [bc], a
    ld   [bc], a
    ld   sp, hl
    pop  bc
    cp   l
    and  c
    dec  e
    ld   de, label_119D
    dec  e

label_32F9D::
    sub  a, c
    cp   c
    and  c
    nop
    rst  $38
    ld   b, d
    cp   l
    jr   z, label_32F9D
    nop
    rst  $38
    inc  h
    rst  $38
    ld   e, d
    cp   l
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    rst  $38
    ldd  [hl], a
    rst  $28
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ccf
    ccf
    ld   b, c
    ld   b, c
    sbc  a, a
    add  a, e
    cp   l
    add  a, l
    cp   b
    adc  a, b
    cp   c
    adc  a, b
    cp   b
    adc  a, c
    sbc  a, l
    add  a, l
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    add  a, d
    add  a, d
    ld   a, c
    ld   b, c
    dec  a
    ld   hl, label_119D
    db   $11
    ld   de, $915D
    cp   c
    and  c
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    jr   label_32FE9
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    rst  $38
    ld   b, d
    rst  $38
    adc  a, c
    rst  0
    or   c
    rst  8
    add  a, c
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    ld   h, b
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  0
    nop
    rlca
    nop
    ld   b, $00
    ld   c, $00
    ld   a, h
    nop
    ld   a, b
    nop
    ld   b, $00
    rst  0
    nop
    db   $E3 ; Undefined instruction
    nop
    ld   [rJOYP], a
    ld   h, b
    nop
    ld   [hl], b
    nop
    ld   a, $00
    ld   e, $00
    ld   a, b
    nop
    ld   a, h
    nop
    ld   c, $00
    ld   b, $00
    rlca
    nop
    rst  0
    nop
    db   $E3 ; Undefined instruction
    nop
    ld   h, b
    nop
    ld   c, $00
    ld   a, $00
    ld   a, h
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    jp   label_C700
    nop
    ld   b, $00
    jr   nc, label_33042

label_33042::
    jr   nc, label_33044

label_33044::
    pop  af
    nop
    pop  hl
    nop
    ld   bc, label_300
    nop
    rrca
    nop
    ld   a, $00
    inc  c
    nop
    inc  c
    nop
    adc  a, a
    nop
    add  a, a
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld   a, h
    nop
    ld   a, $00
    rrca
    nop
    inc  bc
    nop
    ld   bc, $E100
    nop
    pop  af
    nop
    jr   nc, label_3306E

label_3306E::
    jr   nc, label_33070

label_33070::
    ld   a, h
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
    add  a, a
    nop
    adc  a, a
    nop
    inc  c
    nop
    inc  c
    nop
    rra
    nop
    jr   label_33084

label_33084::
    jr   c, label_33086

label_33086::
    ld    hl, sp+$00
    ld   a, [$FF00]
    add  a, b
    nop
    add  a, c
    nop
    add  a, e
    nop
    ld    hl, sp+$00
    jr   label_33094

label_33094::
    inc  e
    nop
    rra
    nop
    rrca
    nop
    ld   bc, $8100
    nop
    pop  bc
    nop
    add  a, e
    nop
    add  a, c
    nop
    add  a, b
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    jr   c, label_330AC

label_330AC::
    jr   label_330AE

label_330AE::
    rra
    nop
    pop  bc
    nop
    add  a, c
    nop
    ld   bc, label_F00
    nop
    rra
    nop
    inc  e
    nop
    jr   label_330BE

label_330BE::
    ld    hl, sp+$00
    pop  bc
    nop
    adc  a, a
    nop
    inc  c
    nop
    inc  c
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, b
    nop
    ret  nz
    nop
    add  a, e
    nop
    pop  af
    nop
    jr   nc, label_330D6

label_330D6::
    jr   nc, label_330D8

label_330D8::
    ld   a, $00
    ld   a, $00
    ld   e, $00
    inc  bc
    nop

label_330E0::
    ret  nz
    nop
    ld   a, b
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    inc  c
    nop
    inc  c
    nop
    adc  a, a
    nop
    pop  bc
    nop
    inc  bc
    nop
    ld   [bc], a
    nop
    ld   a, $00
    ld   a, [hl]
    nop
    ld   [hl], b
    nop
    ld   [hl], b
    nop
    pop  af
    nop
    add  a, e
    nop
    rst  $38
    nop
    rst  $18
    nop
    rst  $18
    nop
    rst  $38
    nop
    rst  $28
    nop
    rst  $28
    nop
    rst  $18
    nop
    rst  $18
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    add  hl, sp
    nop
    rst  $38
    nop
    rst  $38
    nop
    ei
    nop
    ei
    nop
    rst  $30
    nop
    rst  $30
    nop
    rst  $38
    nop
    ei
    nop
    ei
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  hl, sp
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    nop
    rst  $30
    nop
    ei
    nop
    ei
    nop
    rst  $38
    nop
    rst  $30
    nop
    rst  $30
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    nop
    sbc  a, h
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    nop
    rst  $28
    nop
    rst  $38
    nop
    rst  $18
    nop
    rst  $18
    nop
    rst  $28
    nop
    rst  $28
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, h
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    rst  8
    nop
    add  hl, sp
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    nop
    cp   a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    cp   a
    nop
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  hl, sp
    nop
    rst  8
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    cp   a
    nop
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    nop
    sbc  a, h
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    rst  $38
    nop
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    cp   $00
    cp   $00
    sbc  a, h
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    nop
    rst  $18
    nop
    rst  $38
    nop
    rst  $28
    nop
    rst  $28
    nop
    rst  $18
    nop
    rst  $18
    nop
    rst  $38
    nop
    di
    nop
    ld   [rJOYP], a
    ld   c, $00
    rst  $38
    nop
    ld   a, h
    nop
    ld   sp, $8700
    nop
    ld   a, a
    nop
    ld   a, [hl]
    nop
    ld   d, h
    nop
    pop  bc
    nop
    ld   l, e
    add  a, b
    ld   a, [hl]
    add  a, c
    push de
    ld   a, [hli]
    rst  $10
    jr   z, label_33230
    nop
    rst  $38
    nop
    add  hl, sp
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    nop
    rst  $30
    nop
    ei
    nop
    ei
    nop
    rst  $38
    nop
    rst  $30
    nop
    rst  $30
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    jr   c, label_33256

label_33256::
    add  a, e
    nop
    rst  $38
    nop
    pop  af
    nop
    call nz, label_1E00
    nop
    sub  a, l
    ld   l, d
    rst  $10

label_33263::
    jr   z, label_33263
    nop
    ld   e, [hl]
    nop
    inc  d
    nop
    and  c
    nop
    ld   [label_33C01], a
    add  a, e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, h
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    nop
    ld   c, $00
    ld   [rJOYP], a
    rst  $38
    nop
    rst  0
    nop
    inc  de
    nop
    ld   a, b
    nop
    ld   l, e
    add  a, b
    ld   a, $C1
    xor  c
    ld   d, [hl]
    db   $EB ; Undefined instruction
    inc  d
    ld   a, a
    nop
    ld   a, [hl]
    nop
    ld   e, [hl]
    nop
    rlc  b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  hl, sp
    nop
    rst  8
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    cp   a
    nop
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    add  a, e
    nop
    jr   c, label_332D8

label_332D8::
    rst  $38
    nop
    rra
    nop
    ld   c, h
    nop
    pop  hl
    nop
    ld   e, h
    nop
    push de
    nop
    ld   d, e
    add  a, b
    db   $3A ; ldd  a, [hl]
    pop  bc
    sbc  a, l
    ld   h, d
    push de
    ld   a, [hli]
    ld   [hl], a
    ld   [$003E], sp
    sbc  a, h
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38

label_3330F::
    nop
    nop

label_33311::
    rst  $38
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    ld   a, [hl]
    nop

label_33323::
    rst  $38
    nop
    rst  $38
    jr   label_3330F
    jr   label_33311
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   a, h
    ld   a, h
    nop
    nop
    rst  $38
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    nop
    rst  $38

label_3334D::
    nop
    rst  $38
    nop
    nop
    rst  $38
    jr   nc, label_33323
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    di
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    jr   label_3334D
    inc  h
    jp   label_C324
    jr   label_33353
    nop
    rst  $38
    add  a, c
    ld   a, [hl]
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   a, h
    ld   a, h
    nop
    nop
    rst  $38
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    inc  c
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_3336B
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    ld   a, [hl]
    inc  a
    jp   label_8166
    ld   b, d
    add  a, c
    ld   b, d
    add  a, c
    ld   h, [hl]
    add  a, c
    inc  a
    jp   label_33E81
    nop
    nop
    db   $10 ; Undefined instruction
    jr   z, label_333DE
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   b, h
    ld   l, h
    ld   a, h
    ld   a, h
    nop
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    nop
    rst  $38

label_333DE::
    nop
    rst  $38
    cp   l
    ld   b, d
    ld   h, [hl]
    add  a, c
    jp   label_8100
    nop
    add  a, c
    nop
    jp   label_32600
    add  a, c
    cp   l
    ld   b, d
    db   $10 ; Undefined instruction
    jr   z, label_3341C
    jr   z, label_3341E
    ld   l, h
    ld   l, h
    ld   b, h
    ld   l, h
    ld   l, h
    ld   b, h
    ld   a, h
    ld   a, h
    nop
    nop
    xor  d
    rst  $38
    ld   d, l
    rst  $38
    and  d
    rst  $38
    nop
    rst  $38
    nop

label_33409::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    xor  d
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_3341C::
    inc  a
    jp   label_8142
    jr   label_33409
    inc  h
    jp   label_E7
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    nop
    add  a, c
    nop
    add  a, c
    nop
    jp   label_FF00
    nop
    rst  $38
    nop
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    ld   d, l
    rst  $38
    xor  d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    jp   label_FFFF
    ld   d, l
    rst  $38
    xor  d
    rst  $38
    ld   b, l
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    db   $DB
    inc  b
    ei
    ld   h, [hl]
    add  a, c
    ld   b, d
    add  a, c
    jp   label_FF00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    nop
    rst  $38
    nop
    inc  l
    db   $D3 ; Undefined instruction
    ld   a, [hl]
    add  a, c
    rst  $20
    nop
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_3347F::
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    xor  d
    rst  $38
    ld   d, l
    rst  $38
    and  d
    rst  $38
    nop
    rst  $38
    inc  a
    jp   label_8142
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    xor  d

label_33499::
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    jr   nz, label_3347F
    add  a, c
    nop
    add  a, c
    nop
    jp   label_FF00
    nop
    rst  $38
    nop
    rst  $20
    nop
    rst  $38

label_334AD::
    nop
    rst  $38
    nop
    jr   label_33499
    inc  h
    jp   label_E7
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    ld   d, l
    rst  $38
    xor  d
    rst  $38
    nop
    rst  $38
    jr   nz, label_334AD
    ldi  [hl], a
    db   $FF
    rst  $38
    rst  $38
    ld   d, l
    rst  $38
    xor  d
    rst  $38
    ld   b, l
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    jp   label_D926
    ld   a, [hl]
    add  a, c
    rst  $20
    nop
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   h, [hl]
    add  a, c
    ld   b, d
    add  a, c
    jp   label_FF00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    nop
    rst  $38
    nop
    ld   [rIE], a
    db   $E4 ; Undefined instruction
    rst  $38
    db   $ED ; Undefined instruction
    cp   $FF
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    ldh  [$FF0C], a
    db   $FD ; Undefined instruction
    ld   b, a
    cp   a
    rst  0
    ccf
    rst  8
    ccf
    rst  $18
    ccf
    rst  $38
    ccf
    or   a
    ld   a, a
    daa
    rst  $38
    rlca
    rst  $38
    ld   [rIE], a
    db   $E4 ; Undefined instruction
    rst  $38
    db   $ED ; Undefined instruction
    cp   $FF
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    ldh  [$FF0C], a
    db   $FD ; Undefined instruction
    ld   b, a
    cp   a
    rst  0
    ccf
    rst  8
    ccf
    rst  $18
    ccf
    rst  $38
    ccf
    or   a
    ld   a, a
    daa
    rst  $38
    rlca
    rst  $38
    call c, label_DDE0
    ld   [$FFDF], a
    ld   [$FFDB], a
    db   $E4 ; Undefined instruction
    jp   nc, label_C0EC
    db   $FC ; Undefined instruction
    call nz, label_CCF8
    ld   a, [$FFDB]
    daa
    db   $DB
    rlca
    sbc  a, e
    rlca
    dec  de
    rlca
    inc  de
    rrca
    inc  bc
    rra
    inc  bc
    ccf
    ld   c, e
    scf
    call c, label_DDE0
    ld   [$FFDF], a
    ld   [$FFDB], a
    db   $E4 ; Undefined instruction
    jp   nc, label_C0EC
    db   $FC ; Undefined instruction
    ret  nz
    ld    hl, sp+$C8
    ld   a, [$FFDB]
    daa
    db   $DB
    rlca
    sbc  a, e
    rlca
    dec  de
    rlca
    inc  de
    rrca
    inc  bc
    rra
    inc  bc
    ccf
    ld   c, e
    scf
    ld   a, b
    add  a, b
    ld   [hl], b
    add  a, b
    ld   h, b
    add  a, b
    ld   h, b
    add  a, b
    ld   h, b
    add  a, b
    ld   h, h
    add  a, b
    ld   l, h
    add  a, b
    ld   a, h
    add  a, b
    ld   a, $01
    ld   [hl], $01
    ld   h, $01
    ld   b, $01
    ld   b, $01
    ld   b, $01
    ld   c, $01
    ld   e, $01
    ld   a, b
    add  a, b
    ld   [hl], b
    add  a, b
    ld   h, b
    add  a, b
    ld   h, b
    add  a, b
    ld   h, b
    add  a, b
    ld   h, h
    add  a, b
    ld   l, h
    add  a, b
    ld   a, h
    add  a, b
    ld   a, $01
    ld   [hl], $01
    ld   h, $01
    ld   b, $01
    ld   b, $01
    ld   b, $01
    ld   c, $01
    ld   e, $01
    jp   nc, label_C0EC
    db   $FC ; Undefined instruction
    call nz, label_CCF8
    ld   a, [$FFDC]
    ld   [$FFDD], a
    ld   [$FFDF], a
    ld   [$FFDB], a
    db   $E4 ; Undefined instruction
    inc  de
    rrca
    inc  bc
    rra
    inc  bc
    ccf
    ld   c, e
    scf
    db   $DB
    daa
    db   $DB
    rlca
    sbc  a, e
    rlca
    dec  de
    rlca
    jp   nc, label_C0EC
    db   $FC ; Undefined instruction
    call nz, label_CCF8
    ld   a, [$FFDC]
    ld   [$FFDD], a
    ld   [$FFDF], a
    ld   [$FFDB], a
    db   $E4 ; Undefined instruction
    inc  de
    rrca
    inc  bc
    rra
    inc  bc
    ccf
    ld   c, e
    scf
    db   $DB
    daa
    db   $DB
    rlca
    sbc  a, e
    rlca
    dec  de
    rlca
    rst  $38
    ld   a, a
    or   b
    ld   a, [$FFCB]
    ld   [$FFD8], a
    ret  nz
    sub  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    rst  $38
    cp   $0D
    rrca
    sub  a, e
    rlca
    ld   a, e
    inc  bc
    ld   sp, label_301
    dec  c
    adc  a, e
    sbc  a, l
    adc  a, e
    sbc  a, l
    add  a, h
    add  a, h
    add  a, b
    add  a, b
    add  a, b
    sub  a, b
    sub  a, b
    cp   b
    rst  $28
    db   $DB
    call nc, label_BFEB
    ld   a, [$FFFF]
    ld   a, a
    adc  a, e
    sbc  a, l
    dec  bc
    dec  e
    dec  sp
    dec  c
    ld   e, l
    ld   sp, $BBE7
    dec  hl
    rst  $10
    db   $FD ; Undefined instruction
    rrca
    rst  $38
    cp   $7F
    rst  $38
    or   b
    ld   a, [$FFE1]
    ld   [$FFC0], a
    ret  nz
    add  a, c
    add  a, b
    cp   e
    add  a, b
    and  e
    sbc  a, c
    and  e
    sbc  a, c
    cp   $FF
    dec  c
    rrca
    rst  $20
    rlca
    dec  de
    inc  bc
    jp   [hl]
    ld   bc, label_5F3
    di
    dec  h
    di
    dec  h
    and  e
    sbc  a, c
    and  e
    sub  a, b
    xor  c
    adc  a, h
    adc  a, h
    sbc  a, [hl]
    rst  $20
    db   $F4
    db   $F4 ; Undefined instruction
    db   $EB ; Undefined instruction
    cp   a
    ld   a, [$FF7F]
    rst  $38
    di
    dec  h
    di
    dec  b
    db   $EB ; Undefined instruction
    dec  b
    dec  c
    add  hl, de
    rst  $30
    db   $DB
    rra
    rst  $20
    db   $ED ; Undefined instruction
    rrca
    cp   $FF
    rst  $38
    ld   a, a
    or   b
    ld   a, [$FFC8]
    ld   [$FFDC], a
    ret  nz
    sbc  a, h
    add  a, b
    call z, label_C0A1
    or   e
    pop  bc
    cp   e
    rst  $38
    cp   $0D
    rrca
    inc  bc
    rlca
    dec  de
    inc  bc
    dec  e
    ld   bc, $E10B
    rlca
    pop  af
    inc  hl
    push af
    pop  de
    cp   e
    pop  de
    cp   e
    ret  c
    or   e
    ld    hl, sp+$8D
    and  $DC
    push de
    db   $EB ; Undefined instruction
    or   a
    ld   a, [$FFFF]
    ld   a, a
    inc  hl
    push af
    inc  hl
    push af
    inc  bc
    push af
    dec  c
    jp   [hl]
    rla
    dec  de
    db   $DB
    rst  $20
    db   $ED ; Undefined instruction
    rrca
    rst  $38
    cp   $7F
    ld   a, a
    ld   a, [$FFB0]
    rst  0
    ld   [$FFDB], a
    ret  nz
    cp   b
    add  a, b
    rst  $10
    add  a, b
    rst  8
    and  b
    rst  8
    and  h
    cp   $FE
    rrca
    dec  c
    db   $E3 ; Undefined instruction
    rlca
    jp   label_103
    ld   bc, label_181
    db   $01
    ld   bc, $81DD
    rst  8
    and  h
    rst  8
    and  h
    rst  8
    and  b
    or   a
    sub  a, b
    db   $E8 ; add  sp, d
    ret  c
    call nc, label_F7EB
    or   b
    ld   a, a
    ld   a, a
    db   $81
    add  a, c
    db   $81
    add  a, c
    call label_9101
    ld   sp, label_3B67
    dec  hl
    rst  $10
    rst  $38
    dec  c
    cp   $FE
    nop
    nop
    inc  bc
    inc  bc
    dec  b
    dec  b
    ld   [hl], l
    ld   [hl], l
    rst  $30
    sub  a, l
    rst  $30
    push af
    rst  $30
    rst  $30
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    push af
    dec  d
    rst  $38
    db   $F7
    rst  $30
    rst  $10
    rst  $30
    push af
    sub  a, a
    sub  a, l
    daa
    dec  h
    rst  0
    push bc
    ld   b, e
    ld   b, e
    jr   c, label_33722

label_33722::
    jr   c, label_33724

label_33724::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_3372C

label_3372C::
    jr   c, label_3372E

label_3372E::
    nop
    nop
    nop
    nop
    jr   c, label_33734

label_33734::
    jr   c, label_33736

label_33736::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_3373E

label_3373E::
    jr   c, label_33740

label_33740::
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   [hl], l
    ld   [hl], l
    push af
    sub  a, l
    rst  $30
    push af
    rst  $30
    push af
    rst  $38
    rst  $38
    push af
    dec  d
    db   $FD ; Undefined instruction
    db   $F5
    push af
    push de
    rst  $30
    push af
    sub  a, a
    sub  a, a
    daa
    dec  h
    jp   label_300C3
    ld   b, b
    nop
    nop
    jr   c, label_33764

label_33764::
    cp   d
    nop
    add  a, $00
    add  a, $00
    ld   b, h
    nop
    jr   c, label_3376E

label_3376E::
    nop
    nop
    nop
    nop
    jr   c, label_33774

label_33774::
    ld   b, h
    nop
    add  a, $00
    add  a, $00
    cp   d
    nop
    jr   c, label_3377E

label_3377E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], e
    ld   [hl], e
    push af
    sub  a, l
    push af
    push af
    rst  $30
    push af
    rst  $38
    db   $FD ; Undefined instruction
    rst  $30
    rla
    db   $FD ; Undefined instruction
    db   $F5
    push af
    push de
    push af
    push af
    sub  a, a
    sub  a, l
    inc  hl
    inc  hl
    ret  nz
    ret  nz
    ld   b, b
    ld   b, b
    nop
    nop
    jr   c, label_337A4

label_337A4::
    jr   c, label_337A6

label_337A6::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_337AE

label_337AE::
    jr   c, label_337B0

label_337B0::
    jr   c, label_337B2

label_337B2::
    jr   c, label_337B4

label_337B4::
    add  a, $00
    add  a, $00
    add  a, $00
    jr   c, label_337BC

label_337BC::
    jr   c, label_337BE

label_337BE::
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   [hl], l
    ld   [hl], l
    rst  $30
    sub  a, a
    push af
    push af
    rst  $30
    push af
    rst  $38
    db   $FD ; Undefined instruction
    rst  $30
    dec  d
    rst  $38
    rst  $18
    push af
    push de
    push af
    push af
    sub  a, l
    sub  a, l
    daa
    dec  h
    jp   label_300C3
    ld   b, b
    nop
    nop
    jr   c, label_337E4

label_337E4::
    ld   b, h
    nop
    add  a, $00
    add  a, $00
    cp   d
    nop
    jr   c, label_337EE

label_337EE::
    nop
    nop
    nop
    nop
    jr   c, label_337F4

label_337F4::
    cp   d
    nop
    add  a, $00
    add  a, $00
    ld   b, h
    nop
    jr   c, label_337FE

label_337FE::
    nop
    nop
    ccf
    ccf
    ld   a, a
    ld   h, c
    rst  $38
    pop  bc
    rst  $38
    adc  a, a
    ld   a, [$FF90]
    ld   a, [$FF90]
    ld   a, [$FF90]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FF90]
    ld   a, [$FF90]
    ld   a, [$FF90]
    rst  $38
    adc  a, a
    rst  $38
    pop  bc
    ld   a, a
    ld   h, c
    ccf
    ccf
    nop
    nop
    rra
    rra
    ccf
    jr   nz, label_338A6
    ld   b, b
    ld   a, a
    ld   c, h
    ld   a, a
    ld   c, h
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, c
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  c
    inc  c
    inc  e
    inc  d

label_33864::
    ccf
    daa
    ld   a, a

label_33867::
    ld   b, c
    rst  $38
    add  a, c
    ld   a, a
    ld   b, c
    ccf
    daa
    inc  e
    inc  d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_1C08], sp
    inc  d
    ld   a, $22
    ld   a, a
    ld   b, c
    rst  $38
    add  a, b
    rst  $38
    db   $E3 ; Undefined instruction
    ld   a, $22
    ld   a, $3E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b

label_338A6::
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    sub  a, d
    and  h
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    sub  a, d
    and  h
    add  a, b
    add  a, b
    add  a, b
    cp   $00
    cp   a
    nop
    rst  $30
    nop
    cp   $00
    cp   a
    nop
    rst  $30
    nop
    cp   $00
    cp   a
    nop
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    adc  a, h
    add  a, b
    sub  a, [hl]
    add  a, b
    and  [hl]
    add  a, h
    xor  d
    add  a, h
    adc  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    sbc  a, h
    add  a, b
    sub  a, h
    and  d
    sub  a, h
    sbc  a, h
    and  d
    add  a, b
    cp   [hl]
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    cp   [hl]

label_338F6::
    sbc  a, h
    and  d
    add  a, b
    cp   [hl]
    adc  a, b
    xor  d
    add  a, b
    cp   [hl]
    add  a, b
    add  a, b
    rst  $38

label_33901::
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, e
    add  a, e
    adc  a, h
    adc  a, l
    sub  a, d
    sbc  a, b
    and  a
    sbc  a, h
    and  e
    sbc  a, a
    and  b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    ld   [$FFE0], a
    sbc  a, b
    ret  c
    and  h
    adc  a, h
    db   $F2 ; Undefined instruction
    sbc  a, h
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    add  a, d
    rst  $38
    rst  $38
    and  b
    add  a, b
    add  a, h
    add  a, b
    add  a, b
    add  a, b
    cp   c
    add  a, h
    db   $FC ; Undefined instruction
    add  a, d
    db   $F4 ; Undefined instruction
    add  a, d
    call c, label_FF82
    rst  $38
    add  a, d
    add  a, b
    sub  a, b
    add  a, b
    add  a, b
    add  a, b
    adc  a, $90
    sbc  a, a
    and  b
    sub  a, a
    and  b
    sbc  a, l
    and  b
    rst  $38
    rst  $38
    ret  nz
    and  b
    ret  nz
    xor  a
    rst  0
    xor  b
    rst  0
    xor  b
    call nz, label_C0AB
    xor  [hl]
    ret  nz
    xor  d
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    cp   $BC
    jp   nz, label_C2BC
    add  a, h
    ld   a, [$CE80]
    add  a, b
    jp   z, label_FFFF
    db   $FC ; Undefined instruction
    add  a, d
    add  a, h
    ei
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    rst  $38
    rst  $38
    pop  bc
    xor  d
    pop  bc
    xor  d
    pop  bc
    xor  d
    ret  nz
    xor  e
    ret  nz
    xor  b
    ret  nz
    xor  a
    ret  nz
    and  b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    db   $E3 ; Undefined instruction
    sbc  a, h
    db   $E3 ; Undefined instruction
    sbc  a, h
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    db   $E3 ; Undefined instruction
    add  a, b
    cp   [hl]
    rst  $38
    rst  $38
    ld   a, [$FF8A]
    ld   a, [$FF8A]
    ld   a, [$FF8A]
    add  a, b
    ld   a, [$8280]
    add  a, b
    cp   $80
    add  a, b
    rst  $38
    rst  $38
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    adc  a, a
    adc  a, a
    sub  a, b
    adc  a, a
    sub  a, b
    adc  a, a
    sub  a, b
    xor  a
    sub  a, b
    adc  a, a
    sub  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    ld    hl, sp+$F8
    add  a, h
    ld    hl, sp+$84
    ld    hl, sp+$84
    ld   a, [$F884]
    add  a, h
    rst  $38
    rst  $38
    add  a, b
    sbc  a, a
    add  a, b
    pop  af
    add  a, b
    pop  de
    add  a, b
    pop  de
    add  a, b
    rst  $18
    adc  a, [hl]
    push de
    add  a, b
    rst  $18
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    ld   [$FF80], a
    cp   [hl]
    add  a, b
    cp   [hl]
    sbc  a, h
    and  d
    sbc  a, h
    and  d
    sbc  a, h
    and  d
    rst  $38
    rst  $38
    add  a, a
    cp   b
    add  a, b
    sbc  a, a
    sub  a, h
    adc  a, e
    and  e
    sub  a, b
    and  b
    sbc  a, [hl]
    sbc  a, h
    add  a, e
    add  a, e
    add  a, b
    rst  $38
    rst  $38
    ld   a, [$FF8E]
    add  a, b
    db   $FC ; Undefined instruction
    sub  a, h
    db   $E8 ; add  sp, d
    ldh  [$FF0C], a
    add  a, h
    add  a, d
    cp   h
    sbc  a, h
    ld   [$FFE0], a
    add  a, b
    rst  $38
    rst  $38
    and  d
    add  a, b
    adc  a, b
    add  a, b
    add  a, b
    add  a, b
    sbc  a, [hl]
    add  a, b
    ei
    add  a, b
    sbc  a, $80
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, d
    add  a, b
    and  b
    add  a, b
    add  a, h
    add  a, b
    pop  af
    add  a, b
    sbc  a, $80
    rst  $30
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    ret  nz
    xor  d
    ret  nz
    xor  d
    ret  nz
    xor  d
    ret  nz
    xor  d
    ret  nz
    xor  d
    ret  nz
    xor  d
    ret  nz
    xor  d
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    db   $E3 ; Undefined instruction
    sbc  a, h
    db   $E3 ; Undefined instruction
    sbc  a, h
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    jp   z, label_CA80
    add  a, b
    jp   z, label_CA80
    add  a, b
    jp   z, label_8A80
    add  a, b
    adc  a, d
    rst  $38
    rst  $38
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    rst  $38
    rst  $38
    ret  nz
    and  b
    ret  nz
    and  b
    ret  nz

label_33A87::
    and  b
    ret  nz
    cp   a
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    sbc  a, h
    and  d
    sbc  a, h
    and  d
    add  a, b
    cp   [hl]
    add  a, b
    db   $E3 ; Undefined instruction
    pop  bc
    and  d
    add  a, b
    db   $E3 ; Undefined instruction
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    ret
    add  a, [hl]
    ld   sp, hl
    cp   $81
    add  a, [hl]
    ld   sp, hl
    add  a, [hl]
    ret
    add  a, [hl]
    adc  a, c
    rst  $38
    rst  $38
    xor  a
    sub  a, b
    add  a, b
    sbc  a, a
    and  h
    sub  a, c
    add  a, b
    sub  a, c
    and  b
    sbc  a, a
    sub  a, l
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    ld   a, [$8084]
    db   $FC ; Undefined instruction
    sub  a, d
    call nz, label_C480
    add  a, d
    db   $FC ; Undefined instruction
    call nc, label_8080
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    ret  nz
    add  a, b
    rst  $38
    cp   a
    ret  nz
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    sbc  a, h
    and  d
    sbc  a, h
    ldh  [$FF0C], a
    call c, label_9CA2
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    add  a, d
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    db   $EB ; Undefined instruction
    sub  a, h
    pop  de
    xor  [hl]
    pop  bc
    cp   [hl]
    rst  $30
    adc  a, b
    pop  bc
    sbc  a, h
    db   $E3 ; Undefined instruction
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    sbc  a, a
    add  a, b
    sub  a, b
    add  a, b
    or   b
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    and  b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    add  a, b
    rst  8
    add  a, b
    ret  z
    add  a, b
    ld    hl, sp+$80
    ret  z
    add  a, b
    adc  a, a
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    add  a, h
    add  a, b
    add  a, a
    add  a, b
    add  a, l
    add  a, b
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    add  a, b
    sbc  a, h
    add  a, h
    db   $E3 ; Undefined instruction
    add  a, b
    pop  bc
    add  a, h
    pop  bc
    sub  a, d
    pop  bc
    add  a, b
    db   $E3 ; Undefined instruction
    add  a, b
    cp   a
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, a
    add  a, b
    add  a, h
    add  a, b
    add  a, h
    add  a, b
    call c, label_D780
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   [$FF80], a
    and  b
    add  a, b
    cp   b
    add  a, b
    and  a
    add  a, b
    db   $E4 ; Undefined instruction
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    sbc  a, [hl]
    add  a, b
    and  c
    add  a, b
    and  c
    add  a, b
    and  c
    add  a, b
    and  c
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    adc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    cp   a
    adc  a, a
    or   b
    sbc  a, l
    and  b
    sbc  a, a
    and  b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $28
    add  a, b
    db   $FD ; Undefined instruction
    add  a, b
    rst  $18
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    cp   $80
    rst  $38
    ld    hl, sp+$83
    cp   $81
    xor  $81
    rst  $38
    rst  $38
    adc  a, a
    sub  a, b
    add  a, c
    adc  a, [hl]
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    rst  $38
    add  a, c
    cp   $FF
    rst  $38
    rst  $38
    add  a, b
    pop  bc
    cp   [hl]
    pop  bc
    cp   [hl]
    pop  bc
    cp   [hl]
    pop  bc
    cp   [hl]
    pop  bc
    cp   [hl]
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    pop  bc
    add  a, b
    pop  bc
    add  a, b
    rst  $38
    cp   [hl]
    ret
    add  a, b
    rst  $38
    add  a, b
    pop  bc
    add  a, b
    pop  bc
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    cp   $FC
    add  a, d
    add  a, b
    cp   $80
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    rst  $38

label_33C01::
    rst  $38
    rst  $38
    add  a, b
    db   $E3 ; Undefined instruction
    sbc  a, h
    pop  bc
    cp   [hl]
    add  a, b
    xor  d
    add  a, b
    cp   [hl]
    pop  bc
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    and  b
    add  a, b
    ld   [$FF80], a
    cp   a
    add  a, b
    cp   a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    adc  a, a
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    cp   $80
    add  a, d
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    adc  a, b
    add  a, b
    adc  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, e
    add  a, b
    add  a, e
    add  a, b
    add  a, a
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    or   a
    ld   [$FF97], a
    ld   [$FF90], a
    ld   [$FF90], a
    ld   a, [$FF8F]
    ld   a, [$FF8F]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    db   $E4 ; Undefined instruction
    add  a, b
    rst  $20
    add  a, e
    add  a, h
    add  a, e
    cp   h
    add  a, e
    db   $FC ; Undefined instruction
    add  a, b
    rst  $38
    add  a, b
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    db   $80
    add  a, b
    rst  $38
    add  a, b
    push af
    add  a, b
    cp   a
    ret  nz
    add  a, b
    cp   a
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    sbc  a, a
    and  b
    sbc  a, l
    and  b
    sub  a, a
    and  b
    sbc  a, a
    and  b
    sbc  a, e
    and  b
    sbc  a, a
    and  b
    sbc  a, a
    and  b
    rst  $38
    rst  $38
    sbc  a, a
    and  b
    sbc  a, a
    ld   [$FF9D], a
    ld   [$FFBF], a
    ret  nz
    rst  $18
    add  a, b
    ei
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    cp   $81
    cp   $81
    ld   a, [$FE81]
    add  a, c
    xor  $81
    db   $FC ; Undefined instruction
    add  a, c
    cp   $81
    rst  $38
    nop
    ei
    nop
    rst  $18
    nop
    rst  $38
    nop
    rst  $38
    nop
    xor  $01
    db   $FC ; Undefined instruction
    ld   [bc], a
    ld    hl, sp+$04
    rst  $38
    nop
    ei
    nop
    rst  $18
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    nop
    cpl
    ret  nz
    rra
    jr   nz, label_33CDE
    db   $10 ; Undefined instruction
    rst  $38
    cp   [hl]
    pop  bc
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38

label_33CDE::
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    cp   $80
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    adc  a, a
    sub  a, b
    sbc  a, a
    and  b
    sbc  a, l
    and  b
    sub  a, a
    and  b
    sbc  a, a
    and  b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $18
    add  a, b
    db   $FD ; Undefined instruction
    add  a, b
    rst  $30
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld    hl, sp+$84
    call c, label_FC82
    add  a, d
    db   $F4 ; Undefined instruction
    add  a, d
    db   $FC ; Undefined instruction
    add  a, d
    rst  $38
    rst  $38
    add  a, b
    ld    hl, sp+$80
    ld    hl, sp+$80
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    sbc  a, h
    add  a, h
    db   $E3 ; Undefined instruction
    add  a, b
    db   $E3 ; Undefined instruction
    add  a, h
    pop  bc
    sub  a, d
    pop  bc
    add  a, b
    db   $E3 ; Undefined instruction
    pop  bc
    cp   [hl]
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    db   $FD ; Undefined instruction
    add  a, b
    rst  $18
    add  a, b
    rst  $38
    add  a, b
    rst  $28
    add  a, b
    cp   l
    ret  nz
    sbc  a, a
    and  b
    rst  $38
    rst  $38
    sbc  a, a
    and  b
    sbc  a, e
    and  b
    sbc  a, a
    and  b
    sub  a, a
    and  b
    adc  a, l
    sub  a, b
    add  a, b
    adc  a, a
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b

label_33D94::
    db   $80
    add  a, b
    rst  $38
    add  a, b
    push af
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    cp   $81
    or   $81
    cp   $81
    xor  $81
    db   $FC ; Undefined instruction
    add  a, d
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    add  a, b
    ld    hl, sp+$04
    ld    hl, sp+$04
    ret  c
    ld   b, $F8
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    xor  $01
    rst  $38
    nop
    db   $FD ; Undefined instruction
    nop
    rrca
    sub  a, b
    dec  bc
    db   $10 ; Undefined instruction
    jr   nc, label_33DD6
    ld   a, [$FF0D]
    ld   [$FF3F], a
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $02
    ld   [bc], a

label_33DD6::
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    xor  $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    cp   a
    nop
    rst  $30
    nop
    cp   $00
    cp   a
    nop
    rst  $30
    nop
    cp   $00
    cp   a
    nop
    rst  $38
    rst  $38
    ld   e, e

label_33DF3::
    jr   nz, label_33D94
    ld   h, b
    rra
    ld   [$FF2D], a
    ret  nz
    ld   a, a
    add  a, b
    ei
    nop
    cp   a
    nop

label_33E00::
    ld    hl, sp+$04
    ld   a, [$D804]
    ld   b, $F8
    ld   b, $FC
    ld   [bc], a
    db   $EC ; Undefined instruction
    ld   [bc], a
    ld   a, [$F804]
    inc  b
    adc  a, a
    sub  a, b
    xor  a
    sub  a, b
    adc  a, e
    or   b
    adc  a, a
    or   b
    sbc  a, a
    and  b
    sbc  a, l

label_33E1B::
    and  b
    xor  a
    sub  a, b
    adc  a, a
    sub  a, b
    cp   a
    nop
    ei
    nop
    rst  $38
    nop
    rst  $18
    nop
    rst  $38
    nop
    jr   c, label_33DF3
    ld   b, h
    jr   c, label_33E2F

label_33E2F::
    nop
    rst  $38
    rst  $38
    nop
    nop
    adc  a, b
    ld   [hl], b
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_33E1B
    db   $FD ; Undefined instruction
    nop
    cp   a
    nop
    rst  $38
    rst  $38
    and  h
    add  a, b
    xor  h
    add  a, b
    ret
    add  a, b
    sub  a, c
    add  a, b
    sub  a, d
    add  a, b
    or   d
    add  a, b
    and  [hl]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $28
    add  a, b
    db   $FD ; Undefined instruction
    add  a, b
    rst  $38
    add  a, b
    rst  $18
    add  a, b
    ei
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    adc  a, a
    adc  a, a
    sub  a, b
    sbc  a, e
    and  b
    sbc  a, [hl]
    and  b
    sub  a, a
    and  b
    adc  a, l
    sub  a, b
    add  a, b
    adc  a, a
    rst  $38
    rst  $38
    add  a, b
    ld    hl, sp+$F0
    adc  a, h
    ld    hl, sp+$86
    db   $F4 ; Undefined instruction
    add  a, d
    call c, label_F882
    add  a, h
    add  a, b
    ld    hl, sp+$FF

label_33E81::
    rst  $38
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    sbc  a, a
    sbc  a, a
    and  b
    sbc  a, b
    and  a
    sbc  a, b
    and  h
    sbc  a, b
    and  h
    rst  $38
    rst  $38
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    ld   sp, hl
    cp   $81
    add  a, b
    cp   $80
    add  a, b
    add  a, b
    add  a, b

label_33EB0::
    rst  $38
    rst  $38
    sbc  a, b
    and  h
    sbc  a, b
    and  $98
    rst  $20
    sbc  a, b
    rst  $20
    sbc  a, $81
    db   $FC ; Undefined instruction

label_33EBD::
    add  a, c
    xor  $81
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    cp   [hl]
    add  a, b
    cp   [hl]
    sbc  a, h
    and  d
    sbc  a, h
    and  e
    sbc  a, $A1
    rst  $38
    rst  $38
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    add  a, a
    adc  a, b
    add  a, [hl]
    adc  a, c
    add  a, [hl]
    adc  a, c
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, c
    add  a, b
    add  a, d
    add  a, b
    sub  a, d
    sub  a, d
    xor  h
    add  a, b
    and  b
    add  a, l
    sub  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    and  b
    ret  nz
    and  h
    db   $E4 ; Undefined instruction
    sbc  a, d
    and  h
    add  a, d
    adc  a, b
    add  a, h
    rst  $38
    rst  $38
    add  a, b
    cp   $80
    cp   $80
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    sub  a, a
    ld   [$FFFD], a
    add  a, b
    rst  $38
    add  a, b
    rst  $30
    add  a, b
    db   $FD ; Undefined instruction
    add  a, b
    ret  c
    add  a, a
    add  a, b
    ld    hl, sp+$FF
    rst  $38
    add  a, h
    adc  a, d
    add  a, h
    adc  a, d
    add  a, h
    adc  a, d
    add  a, h
    adc  a, d
    add  a, h
    adc  a, d
    add  a, h
    cp   e
    sbc  a, a
    ld   [rIE], a
    rst  $38
    add  a, b
    add  a, a
    add  a, b
    add  a, a
    add  a, e
    add  a, h
    add  a, b
    add  a, a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    adc  a, [hl]
    rst  $38
    rst  $38
    add  a, b
    cp   $80
    rst  $38
    add  a, c
    cp   $FF
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    cp   a
    add  a, b
    rst  $38
    add  a, b
    cp   a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    cp   $80
    cp   $80
    cp   $80
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    cp   $80
    cp   $FF
    rst  $38
    add  a, b
    cp   a
    add  a, b
    rst  $38
    ret  nz
    cp   a
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    cp   $80
    rst  $38
    add  a, b
    cp   $FC
    add  a, d
    db   $FC ; Undefined instruction
    add  a, d
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    sbc  a, a
    add  a, b
    and  b
    add  a, b
    and  b
    add  a, b
    and  b
    add  a, b
    and  b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    add  a, d
    add  a, b
    cp   $FF
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, d
    adc  a, h
    add  a, e
    adc  a, d
    sub  a, d
    adc  a, d
    and  b
    sub  a, b
    and  b
    sbc  a, [hl]
    sbc  a, h
    add  a, e
    add  a, e
    add  a, b
    rst  $38
    rst  $38
    and  b
    sbc  a, b
    ld   [$FFA8], a
    and  h
    xor  b
    add  a, d
    add  a, h
    add  a, d
    cp   h
    sbc  a, h
    ld   [$FFE0], a
    add  a, b
