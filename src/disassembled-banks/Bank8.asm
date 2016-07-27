section "bank8",romx,bank[$08]
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   e, d
    ld   e, d
    ld   e, d
    ld   e, d
    ld   l, [hl]
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   a, h
    ld   a, l
    ld   a, l
    ld   a, h
    db   $10 ; Undefined instruction
    ld   [de], a
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    jr   label_20057
    ld   a, [de]
    dec  de
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   l, b
    ld   l, b
    ld   de, label_1368
    ld   l, b
    ld   l, b
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   l, b
    ld   l, b
    db   $10 ; Undefined instruction
    ld   l, b
    ld   l, b
    ld   l, b
    ld   de, label_22868
    ld   l, b
    ld   l, b
    ld   [de], a
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    inc  de
    inc  e
    dec  e
    ld   e, $1F
    db   $10 ; Undefined instruction
    ld   l, b
    inc  de
    ld   l, b
    ld   de, label_22812
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, c
    ld   c, c
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, c
    ld   c, c
    ld   a, [$FFF2]
    pop  af
    di
    jr   z, label_200AE
    jr   c, label_200C0
    add  hl, hl
    add  hl, hl
    add  hl, sp
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   nz, label_200BE
    ld   a, [hli]
    jr   nc, label_200C1
    ld   hl, label_3B31
    ld   a, [hli]
    ldd  [hl], a
    ldi  [hl], a
    add  hl, sp
    inc  sp
    dec  sp
    add  hl, sp
    inc  hl
    inc  h
    dec  hl
    jr   c, label_200DC
    db   $3A ; ldd  a, [hl]
    dec  h
    dec  [hl]
    jr   c, label_200D6
    ld   [hl], $26
    dec  hl
    scf
    add  hl, hl
    db   $3A ; ldd  a, [hl]
    daa
    jr   z, label_200F6
    jr   c, label_20108
    ld   b, c
    jr   z, label_2010C
    jr   c, label_200E6
    ld   b, d

label_200BE::
    add  hl, sp
    ld   d, d

label_200C0::
    ld   b, e

label_200C1::
    add  hl, hl
    ld   d, e
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   b, h
    ld   b, l
    ld   d, h
    ld   d, l
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   b, [hl]
    ld   b, a
    ld   d, [hl]
    ld   d, a
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   z, label_20116

label_200D6::
    jr   c, label_20130
    ld   b, c
    jr   z, label_20134
    jr   c, label_20106
    ld   c, d
    add  hl, sp
    ld   d, d
    ld   c, e
    add  hl, hl
    ld   d, e
    add  hl, sp
    ld   a, [hli]
    dec  hl

label_200E6::
    ld   b, h
    ld   c, l
    ld   d, h
    ld   e, l
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, [hl]
    ld   b, a
    ld   e, [hl]
    ld   d, a
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [hl], d
    ld   [hl], e

label_200F6::
    ld   [hl], d
    ld   [hl], e
    ld   l, c
    ld   l, c
    ld   a, c
    ld   a, c
    inc  l
    inc  l
    inc  a
    inc  a
    dec  l
    dec  l
    dec  a
    dec  a
    ld   l, $2F

label_20106::
    ld   l, $2F

label_20108::
    ld   a, $3F
    ld   a, $3F

label_2010C::
    jr   z, label_2011F
    jr   c, label_20123
    db   $10 ; Undefined instruction
    ld   [de], a
    jr   c, label_2013E
    ld   h, [hl]

label_20116::
    add  hl, sp
    ld   d, d
    ld   h, a
    add  hl, hl
    ld   d, e
    add  hl, sp
    jr   z, label_20146
    jr   c, label_20158
    add  hl, hl
    add  hl, hl
    add  hl, sp

label_20123::
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [label_1809], sp
    add  hl, de

label_20130::
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], d
    ld   [hl], e

label_20134::
    ld   b, h
    ld   b, l
    ld   d, h
    ld   d, l
    inc  c
    dec  c
    ld   c, $0F
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   [de], a
    ld   de, $0102

label_20146::
    ld   [de], a
    ld   de, $0102
    inc  d
    dec  d
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    nop
    ld   bc, label_1110
    nop
    ld   bc, label_1514

label_20158::
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    nop
    inc  bc
    db   $10 ; Undefined instruction
    nop
    inc  bc
    inc  d
    dec  d
    ld   b, $07
    ld   [de], a
    ld   de, $0102
    ld   d, $17
    ld   b, $07
    db   $10 ; Undefined instruction
    nop
    ld   bc, label_1716
    ld   b, $07
    db   $10 ; Undefined instruction
    nop
    inc  bc
    ld   d, $17
    ld   h, h
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   h, [hl]
    ld   h, a
    db   $76 ; Halt
    ld   [hl], a
    ld   l, b
    ld   l, c
    ld   a, b
    ld   a, c
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   a, [de]
    dec  de
    ld   a, [de]
    dec  de
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    ld   c, $0F
    ld   e, $1F
    ld   [label_1809], sp
    add  hl, de
    ld   a, [hl]
    ld   a, [hl]
    ld   e, $1F
    ld   a, [hl]
    ld   a, [hl]
    jr   label_201C9
    jr   nz, label_201D3
    jr   nc, label_201E5
    ldi  [hl], a
    inc  hl
    ldd  [hl], a
    inc  sp
    ld   a, [hl]
    ld   a, [hl]
    jr   nc, label_201ED
    ld   a, [hl]
    ld   a, [hl]
    ldd  [hl], a
    inc  sp
    inc  h
    dec  h
    inc  [hl]
    dec  [hl]
    ld   h, $27
    ld   [hl], $37
    jr   z, label_201F3
    jr   c, label_20205
    ld   a, [hl]
    ld   a, [hl]
    jr   c, label_2024E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]

label_201D3::
    add  hl, sp
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  l
    dec  l
    inc  a
    dec  a
    ld   l, $2F
    ld   a, $3F
    ld   b, b
    ld   b, c
    ld   d, b
    ld   d, c
    ld   b, d

label_201E5::
    ld   b, e
    ld   d, d
    ld   d, e
    nop
    nop
    nop
    nop
    ld   b, [hl]

label_201ED::
    ld   b, a
    ld   d, [hl]
    ld   d, a
    ld   c, b
    ld   c, c
    ld   e, b

label_201F3::
    ld   e, c
    ld   c, d
    ld   c, e
    ld   e, d
    ld   e, e
    ld   c, [hl]
    ld   c, a
    ld   e, [hl]
    ld   e, a
    ld   h, b
    ld   h, c
    ld   [hl], b
    ld   [hl], c
    ld   l, h
    ld   l, h
    ld   a, l
    ld   a, l
    ld   a, l

label_20205::
    ld   a, l
    ld   a, l
    ld   a, l
    ld   l, l
    ld   l, [hl]
    inc  c
    dec  c
    ld   l, a
    ld   l, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    inc  b
    dec  b
    ld   b, $07
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    jr   label_20247
    ld   a, [de]
    dec  de
    add  hl, hl
    ld   de, label_1339
    ld   [label_A09], sp
    dec  bc
    ld   a, [$FFF2]
    pop  af
    di
    ld   c, h
    ld   c, l
    ld   e, h
    ld   e, l
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp

label_20247::
    dec  bc
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   de, label_1312
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   l, b
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   l, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    ld   [de], a
    inc  de
    inc  c
    inc  b
    ld   c, $05
    inc  b
    dec  c
    dec  b
    rrca
    inc  b
    dec  b
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    ld   b, $07
    ld   h, b
    ld   h, c
    ld   [hl], b
    ld   [hl], c
    ld   h, d
    ld   h, e
    ld   [hl], b
    ld   [hl], c
    inc  c
    dec  c
    ld   c, $0F
    nop
    ld   bc, label_302
    jr   z, label_20292

label_20292::
    jr   c, label_20296
    ld   bc, label_328
    jr   c, label_20291
    ld   a, [$FBF9]
    ld    hl, sp+$FA
    ld   sp, hl
    ei
    inc  c
    dec  c
    ld   c, $0F
    db   $FC ; Undefined instruction
    cp   $FD
    rst  $38
    inc  d
    dec  d
    ld   d, $17
    ld   h, h
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   l, h
    ld   l, l
    ld   [hl], h
    ld   [hl], l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    db   $76 ; Halt
    db   $76 ; Halt
    ld   [hl], a
    ld   [hl], a
    db   $76 ; Halt
    db   $76 ; Halt
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], a
    ld   [hl], a
    jr   z, label_202C6

label_202C6::
    jr   c, label_202CA
    ld   bc, label_328
    jr   c, label_202DD
    dec  bc
    ld   [de], a
    dec  bc
    dec  bc
    dec  bc
    ld   b, $06
    dec  bc
    ld   de, label_130B
    db   $10 ; Undefined instruction
    ld   [de], a
    nop
    ld   b, $07
    ld   bc, label_809
    ld   b, $09
    nop
    dec  bc
    ld   de, label_1301
    add  hl, hl
    ld   [bc], a
    add  hl, sp
    inc  b
    inc  bc
    ld   a, [bc]
    dec  b
    ld   a, a
    ld   a, [bc]
    ld   [bc], a
    ld   a, a
    inc  b
    inc  bc
    add  hl, hl
    dec  b
    add  hl, sp
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    db   $F4 ; Undefined instruction
    or   $F5
    rst  $30
    nop
    ld   a, a
    ld   bc, label_23F7F
    ld   [bc], a
    ld   a, a
    inc  bc
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    ld   [label_A09], sp
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   b, $07
    ld   l, [hl]
    ld   l, [hl]
    ld   c, h
    ld   c, h
    ld   c, a
    ld   c, a
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   e, h
    ld   l, [hl]
    ld   e, h
    ld   e, a
    ld   l, [hl]
    ld   e, a
    ld   l, [hl]
    ld   [label_A09], sp
    dec  bc
    inc  b
    dec  b
    ld   b, $07
    dec  bc
    dec  bc
    ld   [de], a
    inc  de
    inc  c
    dec  c
    ld   c, $0F
    inc  c
    inc  c
    inc  c
    inc  c
    dec  c
    dec  c
    dec  c
    dec  c
    ld   c, $0E
    ld   c, $0E
    rrca
    rrca
    rrca
    rrca
    ld   a, a
    ld   a, a
    dec  bc
    dec  bc
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   [label_908], sp
    dec  bc
    ld   [label_B08], sp
    ld   a, [bc]
    dec  b
    rlca
    inc  b
    inc  b
    rlca
    ld   b, $04
    inc  b
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    ld   e, e
    ld   e, e
    ld   e, e
    ld   e, e
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    inc  c
    dec  c
    ld   c, $0F
    inc  e
    dec  e
    ld   e, $1F
    ld   c, $0F
    ld   e, $1F
    jr   nz, label_203A7
    jr   nc, label_203B9
    ldi  [hl], a
    inc  hl
    ldd  [hl], a
    inc  sp
    ld   l, d
    ld   a, d
    ld   d, b
    ld   h, c
    ld   a, d
    ld   a, d
    ld   b, h
    ld   b, l
    ld   a, d
    ld   l, e
    ld   c, h
    ld   d, e
    ld   c, h
    ld   c, l
    ld   e, h
    ld   e, l
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp

label_203A7::
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    nop
    nop
    nop
    nop
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, l

label_203B9::
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   e, d
    ld   e, d
    ld   e, d
    ld   e, d
    ld   l, [hl]
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   a, h
    ld   a, l
    ld   a, l
    ld   a, h
    db   $10 ; Undefined instruction
    ld   [de], a
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    jr   label_20407
    ld   a, [de]
    dec  de
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   l, b
    ld   l, b
    ld   de, label_1368
    ld   l, b
    ld   l, b
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   l, b
    ld   l, b
    db   $10 ; Undefined instruction
    ld   l, b
    ld   l, b
    ld   l, b
    ld   de, label_22868
    ld   l, b
    ld   l, b
    ld   [de], a
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    inc  de
    inc  e
    dec  e
    ld   e, $1F
    db   $10 ; Undefined instruction
    ld   l, b
    inc  de
    ld   l, b
    ld   de, label_22812
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, c
    ld   c, c
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, c
    ld   c, c
    ld   a, [$FFF2]
    pop  af
    di
    jr   z, label_2045E
    jr   c, label_20470
    add  hl, hl
    add  hl, hl
    add  hl, sp
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   nz, label_2046E
    ld   a, [hli]
    jr   nc, label_20471
    ld   hl, label_3B31
    ld   a, [hli]
    ldd  [hl], a
    ldi  [hl], a
    add  hl, sp
    inc  sp
    dec  sp
    add  hl, sp
    inc  hl
    inc  h
    dec  hl
    jr   c, label_2048C
    db   $3A ; ldd  a, [hl]
    dec  h
    dec  [hl]
    jr   c, label_20486
    ld   [hl], $26
    dec  hl
    scf
    add  hl, hl
    db   $3A ; ldd  a, [hl]
    daa
    jr   z, label_204A6
    jr   c, label_204B8
    ld   b, c
    jr   z, label_204BC
    jr   c, label_20496
    ld   b, d

label_2046E::
    add  hl, sp
    ld   d, d

label_20470::
    ld   b, e

label_20471::
    add  hl, hl
    ld   d, e
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   b, h
    ld   b, l
    ld   d, h
    ld   d, l
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   b, [hl]
    ld   b, a
    ld   d, [hl]
    ld   d, a
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   z, label_204C6

label_20486::
    jr   c, label_204E0
    ld   b, c
    jr   z, label_204E4
    jr   c, label_204B6
    ld   c, d
    add  hl, sp
    ld   d, d
    ld   c, e
    add  hl, hl
    ld   d, e
    add  hl, sp
    ld   a, [hli]
    dec  hl

label_20496::
    ld   b, h
    ld   c, l
    ld   d, h
    ld   e, l
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, [hl]
    ld   b, a
    ld   e, [hl]
    ld   d, a
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [hl], d
    ld   [hl], e

label_204A6::
    ld   [hl], d
    ld   [hl], e
    ld   l, c
    ld   l, c
    ld   a, c
    ld   a, c
    inc  l
    inc  l
    inc  a
    inc  a
    dec  l
    dec  l
    dec  a
    dec  a
    ld   l, $2F

label_204B6::
    ld   l, $2F

label_204B8::
    ld   a, $3F
    ld   a, $3F

label_204BC::
    jr   z, label_204CF
    jr   c, label_204D3
    db   $10 ; Undefined instruction
    ld   [de], a
    jr   c, label_204EE
    ld   h, [hl]

label_204C6::
    add  hl, sp
    ld   d, d
    ld   h, a
    add  hl, hl
    ld   d, e
    add  hl, sp
    jr   z, label_204F6
    jr   c, label_20508
    add  hl, hl
    add  hl, hl
    add  hl, sp

label_204D3::
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [label_1809], sp
    add  hl, de

label_204E0::
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], d
    ld   [hl], e

label_204E4::
    ld   b, h
    ld   b, l
    ld   d, h
    ld   d, l
    inc  c
    dec  c
    ld   c, $0F
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   [de], a
    ld   de, $0102

label_204F6::
    ld   [de], a
    ld   de, $0102
    inc  d
    dec  d
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    nop
    ld   bc, label_1110
    nop
    ld   bc, label_1514

label_20508::
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    nop
    inc  bc
    db   $10 ; Undefined instruction
    nop
    inc  bc
    inc  d
    dec  d
    ld   b, $07
    ld   [de], a
    ld   de, $0102
    ld   d, $17
    ld   b, $07
    db   $10 ; Undefined instruction
    nop
    ld   bc, label_1716
    ld   b, $07
    db   $10 ; Undefined instruction
    nop
    inc  bc
    ld   d, $17
    ld   h, h
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   h, [hl]
    ld   h, a
    db   $76 ; Halt
    ld   [hl], a
    ld   l, b
    ld   l, c
    ld   a, b
    ld   a, c
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   a, [de]
    dec  de
    ld   a, [de]
    dec  de
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    ld   c, $0F
    ld   e, $1F
    ld   [label_1809], sp
    add  hl, de
    ld   a, [hl]
    ld   a, [hl]
    ld   e, $1F
    ld   a, [hl]
    ld   a, [hl]
    jr   label_20579
    jr   nz, label_20583
    jr   nc, label_20595
    ldi  [hl], a
    inc  hl
    ldd  [hl], a
    inc  sp
    ld   a, [hl]
    ld   a, [hl]
    jr   nc, label_2059D
    ld   a, [hl]
    ld   a, [hl]
    ldd  [hl], a
    inc  sp
    inc  h
    dec  h
    inc  [hl]
    dec  [hl]
    ld   h, $27
    ld   [hl], $37
    jr   z, label_205A3
    jr   c, label_205B5
    ld   a, [hl]
    ld   a, [hl]
    jr   c, label_205FE
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]

label_20583::
    add  hl, sp
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  l
    dec  l
    inc  a
    dec  a
    ld   l, $2F
    ld   a, $3F
    ld   b, b
    ld   b, c
    ld   d, b
    ld   d, c
    ld   b, d

label_20595::
    ld   b, e
    ld   d, d
    ld   d, e
    nop
    nop
    nop
    nop
    ld   b, [hl]

label_2059D::
    ld   b, a
    ld   d, [hl]
    ld   d, a
    ld   c, b
    ld   c, c
    ld   e, b

label_205A3::
    ld   e, c
    ld   c, d
    ld   c, e
    ld   e, d
    ld   e, e
    ld   c, [hl]
    ld   c, a
    ld   e, [hl]
    ld   e, a
    ld   h, b
    ld   h, c
    ld   [hl], b
    ld   [hl], c
    ld   l, h
    ld   l, h
    ld   a, l
    ld   a, l
    ld   a, l

label_205B5::
    ld   a, l
    ld   a, l
    ld   a, l
    ld   l, l
    ld   l, [hl]
    inc  c
    dec  c
    ld   l, a
    ld   l, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    inc  b
    dec  b
    ld   b, $07
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    jr   label_205F7
    ld   a, [de]
    dec  de
    add  hl, hl
    ld   de, label_1339
    ld   [label_A09], sp
    dec  bc
    ld   a, [$FFF2]
    pop  af
    di
    ld   c, h
    ld   c, l
    ld   e, h
    ld   e, l
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp

label_205F7::
    dec  bc
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   de, label_1312
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   l, b
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   l, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    ld   [de], a
    inc  de
    inc  c
    inc  b
    ld   c, $05
    inc  b
    dec  c
    dec  b
    rrca
    inc  b
    dec  b
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    ld   b, $07
    ld   h, b
    ld   h, b
    ld   [hl], b
    ld   [hl], b
    ld   h, d
    ld   h, d
    ld   [hl], b
    ld   [hl], b
    inc  c
    dec  c
    ld   c, $0F
    nop
    ld   bc, label_302
    jr   z, label_20642

label_20642::
    jr   c, label_20646
    ld   bc, label_328
    jr   c, label_20641
    ld   a, [$FBF9]
    ld    hl, sp+$FA
    ld   sp, hl
    ei
    inc  c
    dec  c
    ld   c, $0F
    db   $FC ; Undefined instruction
    cp   $FD
    rst  $38
    inc  d
    dec  d
    ld   d, $17
    ld   h, h
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   l, h
    ld   l, l
    ld   [hl], h
    ld   [hl], l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    db   $76 ; Halt
    db   $76 ; Halt
    ld   [hl], a
    ld   [hl], a
    db   $76 ; Halt
    db   $76 ; Halt
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], a
    ld   [hl], a
    jr   z, label_20676

label_20676::
    jr   c, label_2067A
    ld   bc, label_328
    jr   c, label_2068D
    dec  bc
    ld   [de], a
    dec  bc
    dec  bc
    dec  bc
    ld   b, $06
    dec  bc
    ld   de, label_130B
    db   $10 ; Undefined instruction
    ld   [de], a
    nop
    ld   b, $07
    ld   bc, label_809
    ld   b, $09
    nop
    dec  bc
    ld   de, label_1301
    add  hl, hl
    ld   [bc], a
    add  hl, sp
    inc  b
    inc  bc
    ld   a, [bc]
    dec  b
    ld   a, a
    ld   a, [bc]
    ld   [bc], a
    ld   a, a
    inc  b
    inc  bc
    add  hl, hl
    dec  b
    add  hl, sp
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    db   $F4 ; Undefined instruction
    or   $F5
    rst  $30
    nop
    ld   a, a
    ld   bc, label_23F7F
    ld   [bc], a
    ld   a, a
    inc  bc
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    ld   [label_A09], sp
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   b, $07
    ld   l, [hl]
    ld   l, [hl]
    ld   c, h
    ld   c, h
    ld   c, a
    ld   c, a
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   e, h
    ld   l, [hl]
    ld   e, h
    ld   e, a
    ld   l, [hl]
    ld   e, a
    ld   l, [hl]
    ld   [label_A09], sp
    dec  bc
    inc  b
    dec  b
    ld   b, $07
    dec  bc
    dec  bc
    ld   [de], a
    inc  de
    inc  c
    dec  c
    ld   c, $0F
    inc  c
    inc  c
    inc  c
    inc  c
    dec  c
    dec  c
    dec  c
    dec  c
    ld   c, $0E
    ld   c, $0E
    rrca
    rrca
    rrca
    rrca
    ld   a, a
    ld   a, a
    dec  bc
    dec  bc
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   [label_908], sp
    dec  bc
    ld   [label_B08], sp
    ld   a, [bc]
    dec  b
    rlca
    inc  b
    inc  b
    rlca
    ld   b, $04
    inc  b
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    ld   e, e
    ld   e, e
    ld   e, e
    ld   e, e
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    inc  c
    dec  c
    ld   c, $0F
    inc  e
    dec  e
    ld   e, $1F
    ld   c, $0F
    ld   e, $1F
    jr   nz, label_20757
    jr   nc, label_20769
    ldi  [hl], a
    inc  hl
    ldd  [hl], a
    inc  sp
    ld   l, d
    ld   a, d
    ld   d, b
    ld   h, c
    ld   a, d
    ld   a, d
    ld   b, h
    ld   b, l
    ld   a, d
    ld   l, e
    ld   c, h
    ld   d, e
    ld   c, h
    ld   c, l
    ld   e, h
    ld   e, l
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp

label_20757::
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    nop
    nop
    nop
    nop
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, l

label_20769::
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   e, d
    ld   e, d
    ld   e, d
    ld   e, d
    ld   l, [hl]
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   a, h
    ld   a, l
    ld   a, l
    ld   a, h
    db   $10 ; Undefined instruction
    ld   [de], a
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    jr   label_207B7
    ld   a, [de]
    dec  de
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   l, b
    ld   l, b
    ld   de, label_1368
    ld   l, b
    ld   l, b
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   l, b
    ld   l, b
    db   $10 ; Undefined instruction
    ld   l, b
    ld   l, b
    ld   l, b
    ld   de, label_22868
    ld   l, b
    ld   l, b
    ld   [de], a
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    inc  de
    inc  e
    dec  e
    ld   e, $1F
    db   $10 ; Undefined instruction
    ld   l, b
    inc  de
    ld   l, b
    ld   de, label_22812
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, c
    ld   c, c
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, c
    ld   c, c
    ld   a, [$FFF2]
    pop  af
    di
    jr   z, label_2080E
    jr   c, label_20820
    add  hl, hl
    add  hl, hl
    add  hl, sp
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   nz, label_2081E
    ld   a, [hli]
    jr   nc, label_20821
    ld   hl, label_3B31
    ld   a, [hli]
    ldd  [hl], a
    ldi  [hl], a
    add  hl, sp
    inc  sp
    dec  sp
    add  hl, sp
    inc  hl
    inc  h
    dec  hl
    jr   c, label_2083C
    db   $3A ; ldd  a, [hl]
    dec  h
    dec  [hl]
    jr   c, label_20836
    ld   [hl], $26
    dec  hl
    scf
    add  hl, hl
    db   $3A ; ldd  a, [hl]
    daa
    jr   z, label_20856
    jr   c, label_20868
    ld   b, c
    jr   z, label_2086C
    jr   c, label_20846
    ld   b, d

label_2081E::
    add  hl, sp
    ld   d, d

label_20820::
    ld   b, e

label_20821::
    add  hl, hl
    ld   d, e
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   b, h
    ld   b, l
    ld   d, h
    ld   d, l
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   b, [hl]
    ld   b, a
    ld   d, [hl]
    ld   d, a
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   z, label_20876

label_20836::
    jr   c, label_20890
    ld   b, c
    jr   z, label_20894
    jr   c, label_20866
    ld   c, d
    add  hl, sp
    ld   d, d
    ld   c, e
    add  hl, hl
    ld   d, e
    add  hl, sp
    ld   a, [hli]
    dec  hl

label_20846::
    ld   b, h
    ld   c, l
    ld   d, h
    ld   e, l
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, [hl]
    ld   b, a
    ld   e, [hl]
    ld   d, a
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [hl], d
    ld   [hl], e

label_20856::
    ld   [hl], d
    ld   [hl], e
    ld   l, c
    ld   l, c
    ld   a, c
    ld   a, c
    inc  l
    inc  l
    inc  a
    inc  a
    add  hl, hl
    add  hl, hl
    add  hl, sp
    add  hl, sp
    ld   l, $2F

label_20866::
    ld   l, $2F

label_20868::
    ld   a, $3F
    ld   a, $3F

label_2086C::
    jr   z, label_2087F
    jr   c, label_20883
    db   $10 ; Undefined instruction
    ld   [de], a
    jr   c, label_2089E
    ld   h, [hl]

label_20876::
    add  hl, sp
    ld   d, d
    ld   h, a
    add  hl, hl
    ld   d, e
    add  hl, sp
    jr   z, label_208A6
    jr   c, label_208B8
    add  hl, hl
    add  hl, hl
    add  hl, sp

label_20883::
    add  hl, sp
    ld   a, [hli]
    dec  hl
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [label_1809], sp
    add  hl, de

label_20890::
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], d
    ld   [hl], e

label_20894::
    ld   b, h
    ld   b, l
    ld   d, h
    ld   d, l
    inc  c
    dec  c
    ld   c, $0F
    nop
    ld   bc, label_302
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction

label_208A6::
    cp   $FF
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    inc  e
    dec  e
    ld   e, $1F
    inc  e
    dec  e
    ld   e, $1F
    inc  e
    dec  e
    ld   e, $1F

label_208B8::
    ld   l, [hl]
    ld   de, label_136F
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   l, a
    db   $10 ; Undefined instruction
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    ld   [de], a
    rlca
    inc  c
    dec  c
    ld   c, $0F
    ld   [label_911], sp
    inc  de
    ld   a, [bc]
    dec  bc
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    ld   [de], a
    rlca
    inc  c
    dec  c
    ld   c, $0F
    ld   [label_911], sp
    inc  de
    ld   a, [bc]
    dec  bc
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    ld   [de], a
    rlca
    inc  c
    dec  c
    ld   c, $0F
    ld   [label_911], sp
    inc  de
    ld   a, [bc]
    dec  bc
    ld   [de], a
    inc  de
    inc  c
    dec  c
    ld   c, $0F
    inc  c
    dec  c
    ld   c, $0F
    inc  c
    dec  c
    ld   c, $0F
    or   b
    or   c
    or   d
    or   e
    or   b
    or   c
    or   d
    or   e
    or   b
    or   c
    or   d
    or   e
    or   b
    or   c
    or   d
    or   e
    or   b
    or   c
    or   d
    or   e
    or   b
    or   c
    or   d
    or   e
    inc  h
    dec  h
    inc  [hl]
    dec  [hl]
    ld   h, $27
    ld   [hl], $37
    jr   z, label_20953
    jr   c, label_20965
    ld   a, [hl]
    ld   a, [hl]
    jr   c, label_209AE
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    add  hl, sp
    ld   a, [hli]
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  l
    dec  l
    inc  a
    dec  a
    ld   l, $2F
    ld   a, $3F
    ld   b, b
    ld   b, c
    ld   d, b
    ld   d, c
    ld   b, d
    ld   b, e
    ld   d, d
    ld   d, e
    nop
    nop
    nop
    nop
    ld   b, [hl]
    ld   b, a
    ld   d, [hl]
    ld   d, a
    ld   c, b
    ld   c, c
    ld   e, b

label_20953::
    ld   e, c
    ld   c, d
    ld   c, e
    ld   e, d
    ld   e, e
    ld   c, [hl]
    ld   c, a
    ld   e, [hl]
    ld   e, a
    ld   h, b
    ld   h, c
    ld   [hl], b
    ld   [hl], c
    ld   l, h
    ld   l, h
    ld   a, l
    ld   a, l
    ld   a, l

label_20965::
    ld   a, l
    ld   a, l
    ld   a, l
    ld   l, l
    ld   l, [hl]
    inc  c
    dec  c
    ld   l, a
    ld   l, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    inc  b
    dec  b
    ld   b, $07
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    jr   label_209A7
    ld   a, [de]
    dec  de
    add  hl, hl
    ld   de, label_1339
    ld   [label_A09], sp
    dec  bc
    ld   a, [$FFF2]
    pop  af
    di
    ld   c, h
    ld   c, l
    ld   e, h
    ld   e, l
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp

label_209A7::
    dec  bc
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   de, label_1312
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   l, b
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   l, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    ld   [de], a
    inc  de
    inc  b
    inc  b
    dec  b
    dec  b
    ld   b, $07
    ld   [label_409], sp
    dec  b
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    ld   b, $07
    ld   h, b
    ld   h, b
    ld   [hl], b
    ld   [hl], b
    ld   h, d
    ld   h, d
    ld   [hl], b
    ld   [hl], b
    inc  c
    dec  c
    ld   c, $0F
    nop
    ld   bc, label_302
    jr   z, label_209F2

label_209F2::
    jr   c, label_209F6
    ld   bc, label_328
    jr   c, label_209F1
    ld   a, [$FBF9]
    ld    hl, sp+$FA
    ld   sp, hl
    ei
    inc  c
    dec  c
    ld   c, $0F
    db   $FC ; Undefined instruction
    cp   $FD
    rst  $38
    inc  d
    dec  d
    ld   d, $17
    ld   h, h
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   l, h
    ld   l, l
    ld   [hl], h
    ld   [hl], l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    db   $76 ; Halt
    db   $76 ; Halt
    ld   [hl], a
    ld   [hl], a
    db   $76 ; Halt
    db   $76 ; Halt
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], a
    ld   [hl], a
    jr   z, label_20A26

label_20A26::
    jr   c, label_20A2A
    ld   bc, label_328
    jr   c, label_20A3D
    dec  bc
    ld   [de], a
    dec  bc
    ld   a, h
    ld   a, h
    dec  bc
    dec  bc
    dec  bc
    ld   de, label_130B
    db   $10 ; Undefined instruction
    ld   [de], a
    nop
    ld   b, $07
    ld   bc, label_809
    ld   b, $09
    nop
    dec  bc
    ld   de, label_1301
    add  hl, hl
    ld   [bc], a
    add  hl, sp
    inc  b
    inc  bc
    ld   a, [bc]
    dec  b
    ld   a, a
    ld   a, [bc]
    ld   [bc], a
    ld   a, a
    inc  b
    inc  bc
    add  hl, hl
    dec  b
    add  hl, sp
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    db   $F4 ; Undefined instruction
    or   $F5
    rst  $30
    nop
    ld   a, a
    ld   bc, label_23F7F
    ld   [bc], a
    ld   a, a
    inc  bc
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    ld   [label_A09], sp
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   b, $07
    ld   l, [hl]
    ld   l, [hl]
    ld   c, h
    ld   c, h
    ld   c, a
    ld   c, a
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   e, h
    ld   l, [hl]
    ld   e, h
    ld   e, a
    ld   l, [hl]
    ld   e, a
    ld   l, [hl]
    ld   [label_A09], sp
    dec  bc
    inc  b
    dec  b
    ld   b, $07
    dec  bc
    dec  bc
    ld   [de], a
    inc  de
    inc  c
    dec  c
    ld   c, $0F
    inc  c
    inc  c
    inc  c
    inc  c
    dec  c
    dec  c
    dec  c
    dec  c
    ld   c, $0E
    ld   c, $0E
    rrca
    rrca
    rrca
    rrca
    ld   a, a
    ld   a, a
    dec  bc
    dec  bc
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   [label_908], sp
    dec  bc
    ld   [label_B08], sp
    ld   a, [bc]
    dec  b
    rlca
    inc  b
    inc  b
    rlca
    ld   b, $04
    inc  b
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    ld   e, e
    ld   e, e
    ld   e, e
    ld   e, e
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    ld   bc, $0000
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   b, $00
    nop
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    ld   bc, label_501
    inc  b
    jr   nc, label_20AF7
    ld   bc, $0000
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_501
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    stop
    ld   bc, $0101
    ld   bc, label_1001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_A01
    ret  nz
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0130
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_160
    ret  nz
    ld   bc, $0101
    ld   bc, $0101
    ld   [bc], a
    ld   [label_808], sp
    ld   d, b
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   h, b
    ld   h, b
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0001
    sbc  a, c
    ld   bc, $0101
    ld   bc, $C001
    ld   bc, $0101
    ld   bc, label_901
    ld   bc, label_160
    ld   bc, label_903
    ld   bc, $F401
    push af
    or   $F7
    jr   nc, label_20C09
    ld   bc, $0101
    ld   bc, $0107
    ld   [$0100], sp
    ld   bc, label_201
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $8101
    inc  bc
    ld   d, b
    ld   bc, label_701
    rlca
    rlca
    rlca
    ld   d, b
    pop  de
    ld   bc, $D001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, rSB
    nop
    ld   d, b
    nop
    nop
    nop
    nop
    dec  bc
    nop
    ld   a, l
    ld   a, [hl]
    ld   a, a
    ld   a, [hl]
    ld   a, a
    nop
    rlca
    nop
    add  a, c
    add  a, b
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    nop
    adc  a, h
    adc  a, l
    dec  b
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    jr   nc, label_20BC9
    jp   nc, label_D1D0
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $9001
    sub  a, b
    sub  a, c
    sub  a, c
    sub  a, d
    sub  a, d
    sub  a, e
    sub  a, e

label_20C09::
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    jp   nc, label_D0D2
    ret  nc
    pop  de
    pop  de
    nop
    nop
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, h
    ld   a, h
    ld   a, l
    ld   bc, $9901
    sbc  a, d
    sbc  a, e
    sbc  a, h
    or   b
    nop
    nop
    ld   h, b
    ld   h, b
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    or   c
    or   c
    or   c
    or   c
    or   c
    or   b
    ld   bc, $0000
    nop
    ld   bc, $0001
    nop
    nop
    nop
    or   b
    or   b
    or   b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $B000
    or   b
    nop
    or   b
    or   b
    nop
    or   b
    or   b
    or   b
    ld   bc, label_22001
    nop
    ld   bc, label_23C01
    nop
    jr   nc, label_20CC4
    ld   bc, $0001
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    ld   a, [bc]
    ld   [bc], a
    ld   bc, label_17E
    ld   bc, $0000
    nop
    ld   h, b
    ld   h, b
    inc  bc
    inc  bc
    sbc  a, b
    sbc  a, b
    ld   h, b
    ld   h, b
    inc  bc
    jr   nc, label_20C7F

label_20C7F::
    ld   bc, $0101
    ld   d, b
    ld   d, b
    ld   d, b
    ld   a, h
    ld   a, l
    nop
    nop
    nop
    adc  a, e
    adc  a, d
    adc  a, e
    adc  a, d
    ld   bc, label_23D7C
    ld   bc, $0000
    ld   bc, label_23D7C
    ld   bc, $0101
    ld   bc, $D2D3
    ret  nc
    pop  de
    ld   [label_23E09], sp
    ld   bc, $F1F0
    ld   a, [$FF00+C]
    ld   a, a
    ld   [rSB], a
    ld   bc, $0101
    ld   h, b
    nop
    inc  b
    inc  b
    jr   nc, label_20CB4
    nop

label_20CB4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $FFFE
    nop
    ld   d, b
    nop
    nop
    nop
    nop
    dec  bc
    nop
    ld   a, l
    ld   a, [hl]
    ld   a, a
    ld   a, [hl]
    ld   a, a
    nop
    rlca
    nop
    add  a, c
    add  a, b
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    nop
    adc  a, h
    adc  a, l
    dec  b
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    jr   nc, label_20CC9
    jp   nc, label_D1D0
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $9001
    sub  a, b
    sub  a, c
    sub  a, c
    sub  a, d
    sub  a, d
    sub  a, e
    sub  a, e
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    jp   nc, label_D0D2
    ret  nc
    pop  de
    pop  de
    nop
    nop
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, h
    ld   a, h
    ld   a, l
    ld   bc, $9901
    sbc  a, d
    sbc  a, e
    sbc  a, h
    or   b
    nop
    nop
    ld   h, b
    ld   h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   d, b
    nop
    nop
    nop
    nop
    ld   d, b
    nop
    nop
    nop
    nop
    ld   d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or   b
    or   b
    or   b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $B000
    or   b
    nop
    or   b
    or   b
    nop
    or   b
    or   b
    or   b
    ld   bc, label_22001
    nop
    ld   bc, label_23C01
    nop
    jr   nc, label_20DC4
    ld   bc, $0001
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    ld   a, [bc]
    ld   [bc], a
    ld   bc, label_17E
    ld   bc, $0000
    nop
    ld   h, b
    ld   h, b
    inc  bc
    inc  bc
    sbc  a, b
    sbc  a, b
    ld   h, b
    ld   h, b
    inc  bc
    jr   nc, label_20D7F

label_20D7F::
    ld   bc, $0101
    ld   d, b
    ld   d, b
    ld   d, b
    ld   a, h
    ld   a, l
    nop
    nop
    nop
    adc  a, e
    adc  a, d
    adc  a, e
    adc  a, d
    ld   bc, label_23D7C
    ld   bc, $0000
    ld   bc, label_23D7C
    ld   bc, $0101
    ld   bc, $D2D3
    ret  nc
    pop  de
    ld   [label_23E09], sp
    ld   bc, $F1F0
    ld   a, [$FF00+C]
    ld   a, a
    ld   [rSB], a
    ld   bc, $0101
    ld   h, b
    nop
    inc  b
    inc  b
    jr   nc, label_20DB4
    nop

label_20DB4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $FFFE
    sbc  a, e
    ld   [rHDMA3], a
    ld   a, h
    sbc  a, b
    nop
    ld   d, e
    ld   a, h
    sbc  a, b
    jr   nz, label_20E32
    ld   a, h
    sbc  a, b
    ld   b, b
    ld   d, e
    ld   a, h
    sbc  a, b
    ld   h, b
    ld   d, e
    ld   a, h
    sbc  a, b
    add  a, b
    ld   d, e
    ld   a, h
    sbc  a, b
    and  b
    ld   d, e
    ld   a, h
    sbc  a, b
    ret  nz
    ld   d, e
    ld   a, h
    sbc  a, b
    ret  nz
    inc  bc
    ld   a, [hli]
    dec  hl
    inc  b
    inc  d
    sbc  a, b
    adc  a, $03
    ld   a, [hli]
    dec  hl
    inc  b
    inc  d

label_20E02::
    sbc  a, b
    ld   [rHDMA3], a
    ld   a, h
    sbc  a, b
    ld   [$FF03], a
    add  hl, sp
    ld   a, a

label_20E0B::
    ld   a, a
    ld   e, $98
    xor  $05
    add  hl, sp
    ld   a, a
    ld   a, a
    ld   e, $3A
    dec  sp
    sbc  a, c
    nop
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    inc  b

label_20E1E::
    inc  d
    ld   a, h
    ld   a, h
    ld   a, [hli]
    dec  hl
    inc  b
    inc  d
    ld   a, [hli]
    dec  hl
    ld   a, a
    ld   a, a

label_20E29::
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    jr   nz, label_20E83
    ld   a, a
    sbc  a, c

label_20E32::
    dec  h
    inc  bc
    ld   e, $3A
    dec  sp
    add  hl, sp
    sbc  a, c
    dec  hl
    ld   bc, label_391E
    sbc  a, c
    ld   b, b
    ld   d, e
    ld   a, a
    sbc  a, c
    ld   h, b
    ld   d, e
    ld   a, a
    sbc  a, c
    add  a, b
    ld   d, e
    ld   a, a
    sbc  a, c
    and  b
    ld   d, e
    ld   a, a
    sbc  a, c
    ret  nz
    ld   d, e
    ld   a, a
    sbc  a, c
    ld   [rHDMA3], a
    ld   a, a
    sbc  a, d
    nop
    ld   d, e
    ld   a, a
    sbc  a, d
    jr   nz, label_20EAF
    ld   a, a
    sbc  a, c
    add  a, [hl]
    rlca
    inc  h
    dec  h
    ld   h, $26
    add  hl, hl
    add  hl, hl
    daa
    jr   z, label_20E02
    and  a
    dec  b
    inc  [hl]
    dec  [hl]
    ld   [hl], $36
    scf
    jr   c, label_20E0B
    rst  0
    dec  b
    inc  h
    dec  h
    ld   h, $26
    daa
    jr   z, label_20E14
    rst  $20
    dec  b
    inc  h
    dec  h
    ld   h, $26
    daa
    jr   z, label_20E1E
    ld   b, $07
    inc  h
    dec  h
    ld   h, $26
    add  hl, hl
    add  hl, hl
    daa
    jr   z, label_20E29
    ld   h, $07
    inc  h
    dec  h
    ld   h, $26
    add  hl, hl
    add  hl, hl
    daa
    jr   z, label_20E9A

label_20E9A::
    sbc  a, c
    ld   [rNR13], a
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    jr   nc, label_20ED4
    ldd  [hl], a
    inc  sp
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    jr   nc, label_20EDE
    ldd  [hl], a
    inc  sp

label_20EAF::
    jr   nc, label_20EE2
    sbc  a, b
    nop
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   a, [de]
    ld   e, d
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    inc  h
    dec  h
    sbc  a, b
    jr   nz, label_20EDE
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   e, d
    ld   a, [de]
    ld   a, a
    ld   e, d
    ld   a, a

label_20ED4::
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    inc  [hl]

label_20EDE::
    dec  [hl]
    sbc  a, b
    ld   b, b
    inc  de

label_20EE2::
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   e, [hl]
    ld   e, [hl]
    ld   e, [hl]
    ld   e, [hl]
    ld   e, [hl]
    ld   e, [hl]
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    jr   nz, label_20F17
    sbc  a, b
    ld   h, b
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   e, a
    ld   e, a
    ld   e, a
    ld   e, a
    ld   e, a
    ld   e, a
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    jr   nc, label_20F3E
    sbc  a, b
    add  a, b
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    inc  l
    dec  l
    ld   l, $2F
    inc  l
    dec  l
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    inc  h
    dec  h
    sbc  a, b
    and  b
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    inc  a
    dec  a
    ld   a, $3F
    inc  a
    dec  a
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    inc  [hl]
    dec  [hl]
    sbc  a, b
    ret  nz
    inc  de

label_20F3E::
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   a, [de]
    ld   e, d
    jr   nz, label_20F73
    sbc  a, b
    ld   [rNR13], a
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, [de]
    jr   nc, label_20F9A
    sbc  a, c
    nop
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   e, d
    ld   a, a
    ld   e, d

label_20F73::
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    inc  d
    ld   d, $24
    dec  h
    sbc  a, c
    jr   nz, label_20F96
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    dec  d
    rla
    inc  [hl]

label_20F96::
    dec  [hl]
    sbc  a, c
    ld   b, b
    inc  de

label_20F9A::
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    inc  d
    ld   d, $20
    ld   hl, label_22099
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    dec  d
    rla
    jr   nc, label_20FF6
    sbc  a, c
    add  a, b
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    jr   nz, label_20FFB
    ldi  [hl], a
    add  hl, hl
    sbc  a, c
    and  b
    inc  de
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    jr   nc, label_21022
    ldd  [hl], a
    inc  sp
    sbc  a, c
    ret  nz
    inc  de

label_20FF6::
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    jr   nz, label_2101D
    ldi  [hl], a
    inc  hl
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    jr   nz, label_21027
    ldi  [hl], a
    add  hl, hl
    jr   z, label_2102B
    sbc  a, c
    ld   [rNR13], a
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    jr   nc, label_21044
    ldd  [hl], a
    inc  sp
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    jr   nc, label_2104E

label_2101D::
    ldd  [hl], a
    inc  sp
    jr   nc, label_21052
    sbc  a, d

label_21022::
    nop
    inc  de
    dec  de
    dec  de
    ld   c, b

label_21027::
    ld   c, c
    inc  h
    dec  h
    ld   h, $27
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    inc  h
    dec  h
    jr   z, label_21057
    ldi  [hl], a
    add  hl, hl
    sbc  a, d
    jr   nz, label_2104E
    dec  de
    dec  de
    ld   c, b
    ld   c, c
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    ld   a, a

label_21044::
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    inc  [hl]
    dec  [hl]
    jr   nc, label_2107E
    ldd  [hl], a

label_2104E::
    inc  sp
    nop
    sbc  a, b
    nop

label_21052::
    inc  de
    ld   h, $27
    ld   e, d
    ld   a, a

label_21057::
    ld   b, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    jr   nz, label_2107D
    ld   [hl], $37
    ld   a, a
    ld   e, d
    ld   d, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l

label_2107D::
    ld   d, [hl]

label_2107E::
    sbc  a, b
    ld   b, b
    inc  de
    ldi  [hl], a
    inc  hl
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, b
    ld   h, b
    inc  de
    ldd  [hl], a
    inc  sp
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    sbc  a, b
    add  a, b
    inc  de
    ld   h, $27
    ld   e, d
    ld   a, a
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   e, d
    ld   a, a
    sbc  a, b
    and  b
    inc  de
    ld   [hl], $37
    ld   a, a
    ld   e, d
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   e, d

label_210CF::
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, a
    ld   e, d
    sbc  a, b
    ret  nz
    inc  de
    ldi  [hl], a
    inc  hl
    ld   e, d
    ld   a, a
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    ld   [$FFE1], a
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    ld   e, d
    ld   a, a
    sbc  a, b
    ld   [rNR13], a
    ldd  [hl], a
    inc  sp
    ld   a, a
    ld   e, d
    rst  $28
    rst  $28
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    ld   a, [$FFF1]
    rst  $28
    rst  $28
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    ld   a, a
    ld   e, d
    sbc  a, c
    nop
    inc  de
    ld   h, $27
    ld   e, d
    ld   a, a
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    ld   e, d
    ld   a, a
    sbc  a, c
    jr   nz, label_21135
    ld   [hl], $37
    ld   a, a
    ld   e, d
    rst  $28
    rst  $28
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    ld   a, [$FF00+C]
    rst  $28
    rst  $28
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    ld   a, a

label_21135::
    ld   e, d
    sbc  a, c
    ld   b, b
    inc  de
    ldi  [hl], a
    inc  hl
    ld   e, d
    ld   a, a
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    ld   e, d
    ld   a, a
    sbc  a, c
    ld   h, b
    inc  de
    ldd  [hl], a
    inc  sp
    ld   a, a
    ld   e, d
    rst  $28
    rst  $28
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    ld   a, a
    ld   e, d
    sbc  a, c
    add  a, b
    inc  de
    ld   h, $27
    ld   e, d
    ld   a, a
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    ld   e, d
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   [hl], h
    ld   [hl], h
    sbc  a, c
    and  b
    inc  de
    ld   [hl], $37
    ld   a, a
    ld   e, d
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   e, d
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    ld   e, d
    ld   a, [de]
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   [hl], h
    ld   [hl], h
    sbc  a, c
    ret  nz
    inc  de
    ldi  [hl], a
    inc  hl
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, c
    ld   [rNR13], a
    ldd  [hl], a
    inc  sp
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    sbc  a, d
    nop
    inc  de
    ld   h, $27
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, d
    jr   nz, label_211ED
    ld   [hl], $37
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a

label_211ED::
    ld   e, d
    nop
    sbc  a, b
    nop
    inc  de
    inc  h
    dec  h
    ld   h, $27
    inc  h
    dec  h
    ld   h, $27
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    inc  h
    dec  h
    ld   h, $27
    inc  h
    dec  h
    sbc  a, b
    jr   nz, label_2121C
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    inc  [hl]

label_2121C::
    dec  [hl]
    sbc  a, b
    ld   b, b
    inc  de
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    and  $E7
    rst  $20
    rst  $20
    rst  $20
    db   $E8 ; add  sp, d
    ld   [hl], l
    ld   [hl], l
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, b
    ld   h, b
    inc  de
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    jp   [hl]
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   sp, hl
    ld   [hl], l
    ld   [hl], l
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    sbc  a, b
    add  a, b
    inc  de
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    jp   [hl]
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   sp, hl
    ld   e, [hl]
    ld   e, [hl]
    ld   a, [de]
    ld   e, d
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, b
    and  b
    inc  de
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    or   $F7
    rst  $30
    rst  $30
    rst  $30
    ld    hl, sp+$5F
    ld   e, a
    ld   e, d
    ld   a, [de]
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    sbc  a, b
    ret  nz
    inc  de
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    inc  l
    dec  l
    ld   l, $2F
    inc  l
    dec  l
    ld   l, $2F
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    ld   [hl], l
    ld   [hl], l
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, b
    ld   [rNR13], a
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    inc  a
    dec  a
    ld   a, $3F
    inc  a
    dec  a
    ld   a, $3F
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [hl], l
    ld   [hl], l
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    sbc  a, c
    nop
    inc  de
    ld   e, d
    ld   a, a
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    db   $EC ; Undefined instruction
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   e, d
    ld   a, a
    sbc  a, c
    jr   nz, label_212D4
    ld   a, a
    ld   e, d
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    db   $FC ; Undefined instruction
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   a, a

label_212D4::
    ld   e, d
    sbc  a, c
    ld   b, b
    inc  de
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   a, [de]
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, c
    ld   h, b
    inc  de
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   e, d
    ld   a, [de]
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    sbc  a, c
    add  a, b
    inc  de
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   a, [de]
    ld   e, d
    ld   e, d
    ld   a, a
    sbc  a, c
    and  b
    inc  de
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   e, d
    ld   a, [de]
    ld   a, a
    ld   e, d
    sbc  a, c
    ret  nz
    inc  de
    ldi  [hl], a
    inc  hl
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    sbc  a, c
    ld   [rNR13], a
    ldd  [hl], a
    inc  sp
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    sbc  a, d
    nop
    inc  de
    ld   h, $27
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    sbc  a, d
    jr   nz, label_2138C
    ld   [hl], $37
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a

label_2138C::
    ld   e, d
    nop
    sbc  a, b
    nop
    inc  de
    sub  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    sub  a, d
    add  a, e
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], l
    ld   [hl], l
    add  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    inc  h
    dec  h
    sbc  a, b
    jr   nz, label_213BB
    ld   a, h
    sub  a, d
    ld   a, h
    add  a, h
    add  a, b
    adc  a, c
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    add  a, d
    sub  a, d
    ld   a, h
    sub  a, d
    adc  a, [hl]

label_213BB::
    adc  a, a
    sbc  a, b
    ld   b, b
    inc  de
    sub  a, d
    ld   a, h
    sub  a, d
    add  a, e
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], l
    ld   [hl], l
    add  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    jr   z, label_213F4
    sbc  a, b
    ld   h, b
    inc  de
    ld   a, h
    add  a, h
    add  a, b
    adc  a, c
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    adc  a, b
    add  a, b
    add  a, l
    sub  a, d
    jr   nc, label_2141B
    sbc  a, b
    add  a, b
    inc  de
    sub  a, d
    add  a, e
    adc  a, h
    adc  a, l
    ld   e, d
    ld   a, a
    inc  d

label_213F4::
    ld   d, $14
    ld   d, $5A
    ld   a, a
    ld   e, d
    ld   a, a
    ld   a, [de]
    ld   e, d
    add  a, d
    ld   a, h
    inc  h
    dec  h
    sbc  a, b
    and  b
    inc  de
    ld   a, h
    add  a, e
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   e, d
    dec  d
    rla
    dec  d
    rla
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   e, d
    ld   a, [de]
    add  a, d
    sub  a, d
    adc  a, [hl]
    adc  a, a
    sbc  a, b
    ret  nz
    inc  de

label_2141B::
    sub  a, d
    add  a, e
    ld   e, d
    ld   a, a
    inc  d
    ld   d, $20
    ld   hl, label_2322
    inc  d
    ld   d, $1A
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    add  a, d
    ld   a, h
    jr   z, label_21450
    sbc  a, b
    ld   [rNR13], a
    ld   a, h
    add  a, e
    ld   a, a
    ld   e, d
    dec  d
    rla
    jr   nc, label_2146B
    ldd  [hl], a
    inc  sp
    dec  d
    rla
    ld   e, d
    ld   a, [de]
    ld   [hl], l
    ld   [hl], l
    add  a, d
    sub  a, d
    jr   nc, label_21477
    sbc  a, c
    nop
    inc  de
    sub  a, d
    add  a, e
    ld   e, d
    ld   a, a
    inc  d
    ld   d, $24

label_21450::
    dec  h
    ld   h, $27
    inc  d
    ld   d, $5A
    ld   a, a
    ld   [hl], l
    ld   [hl], l
    add  a, d
    ld   a, h
    inc  h
    dec  h
    sbc  a, c
    jr   nz, label_21473
    ld   a, h
    add  a, e
    ld   a, a
    ld   e, d
    dec  d
    rla
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    dec  d

label_2146B::
    rla
    ld   a, a
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    add  a, d
    sub  a, d
    adc  a, [hl]

label_21473::
    adc  a, a
    sbc  a, c
    ld   b, b
    inc  de

label_21477::
    sub  a, d
    add  a, e
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    inc  d
    ld   d, $14
    ld   d, $5A
    ld   a, a
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    add  a, d
    ld   a, h
    jr   z, label_214AC
    sbc  a, c
    ld   h, b
    inc  de
    ld   a, h
    add  a, e
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    dec  d
    rla
    dec  d
    rla
    ld   a, a
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    add  a, d
    sub  a, d
    jr   nc, label_214D3
    sbc  a, c
    add  a, b
    inc  de
    sub  a, d
    add  a, e
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   a, [de]

label_214AC::
    ld   e, d
    adc  a, h
    adc  a, l
    ld   e, d
    ld   a, a
    ld   [hl], l
    ld   [hl], l
    adc  a, d
    add  a, c
    sub  a, d
    ld   a, h
    inc  h
    dec  h
    sbc  a, c
    and  b
    inc  de
    ld   a, h
    add  a, e
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   e, d
    ld   a, [de]
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    add  a, d
    sub  a, d
    ld   a, h
    sub  a, d
    adc  a, [hl]
    adc  a, a
    sbc  a, c
    ret  nz
    inc  de

label_214D3::
    sub  a, d
    add  a, [hl]
    add  a, c
    add  a, c
    add  a, c
    adc  a, e
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], l
    ld   [hl], l
    add  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    jr   z, label_21508
    sbc  a, c
    ld   [rNR13], a
    ld   a, h
    sub  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    add  a, e
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    add  a, d
    sub  a, d
    ld   a, h
    sub  a, d
    jr   nc, label_2152F
    sbc  a, d
    nop
    inc  de
    sub  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    sub  a, d
    add  a, e
    ld   e, d

label_21508::
    ld   a, a
    ld   e, d
    ld   a, a
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    add  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    inc  h
    dec  h
    sbc  a, d
    jr   nz, label_2152B
    ld   a, h
    sub  a, d
    ld   a, h
    sub  a, d
    ld   a, h
    add  a, e
    ld   a, a
    ld   e, d
    ld   a, a
    ld   e, d
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    add  a, d
    sub  a, d
    ld   a, h
    sub  a, d
    adc  a, [hl]

label_2152B::
    adc  a, a
    nop
    sbc  a, b
    nop

label_2152F::
    inc  de
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, c
    ld   e, c
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    ld   b, h
    ld   d, [hl]
    ld   c, b
    ld   d, c
    ld   b, l
    ld   b, l
    sbc  a, b
    jr   nz, label_2155A
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, c
    ld   e, c
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    ld   b, h
    ld   d, [hl]
    ld   b, h
    ld   d, [hl]
    ld   d, l

label_2155A::
    ld   d, [hl]
    sbc  a, b
    ld   b, b
    inc  de
    ld   b, l
    ld   b, l
    ld   d, d
    ld   e, c
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  d
    xor  e
    ld   b, h
    ld   d, [hl]
    ld   b, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    ld   h, b
    inc  de
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   b, a
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   d
    cp   e
    ld   d, h
    ld   d, [hl]
    ld   b, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    add  a, b
    inc  de
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   b, a
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    ld   b, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    and  b
    inc  de
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, a
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    ld   d, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    ret  nz
    inc  de
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  [hl]
    xor  a
    xor  h
    xor  l
    xor  h
    xor  l
    xor  d
    xor  e
    xor  h
    xor  l
    sbc  a, b
    ld   [rNR13], a
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   h
    cp   l
    cp   [hl]
    cp   a
    cp   h
    cp   l
    cp   h
    cp   l
    cp   d
    cp   e
    cp   h
    cp   l
    sbc  a, c
    nop
    inc  de
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, l
    xor  h
    xor  l
    xor  h
    xor  l
    xor  [hl]
    xor  a
    xor  h
    xor  l
    xor  h
    xor  l
    xor  b
    xor  c
    xor  h
    xor  l
    xor  h
    xor  l
    sbc  a, c
    jr   nz, label_21612
    ld   b, l
    ld   b, l
    ld   e, l

label_21602::
    ld   e, c
    cp   h
    cp   l
    cp   h
    cp   l
    cp   [hl]
    cp   a
    cp   h
    cp   l
    cp   h
    cp   l
    cp   b
    cp   c
    cp   h
    cp   l
    cp   h

label_21612::
    cp   l
    sbc  a, c
    ld   b, b
    inc  de
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, c
    ld   e, c
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    inc  e
    dec  e
    sbc  a, c
    ld   h, b
    inc  de
    db   $76 ; Halt
    db   $76 ; Halt
    ld   c, c
    ld   e, c
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    sbc  a, c
    add  a, b
    inc  de
    ld   b, l
    ld   b, l
    ld   d, d
    ld   e, c
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    sbc  a, c
    and  b
    inc  de
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   b, a
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    sbc  a, c
    ret  nz
    inc  de
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   b, a
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    sbc  a, c
    ld   [rNR13], a
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, a
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    sbc  a, d
    nop
    inc  de
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    sbc  a, d
    jr   nz, label_216CA
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    ld   e, $1F
    nop
    sbc  a, b
    nop
    ld   d, e
    xor  h
    sbc  a, b
    jr   nz, label_21726
    xor  h
    sbc  a, b
    ld   b, b
    ld   d, e
    xor  h
    sbc  a, b
    ld   h, b
    ld   d, e
    xor  h
    sbc  a, b
    add  a, b
    ld   d, e
    xor  h
    sbc  a, b
    and  b
    ld   d, e
    xor  h
    sbc  a, b
    ret  nz
    ld   d, e
    xor  h
    sbc  a, b
    ld   [rHDMA3], a
    xor  h
    sbc  a, c
    nop
    ld   d, e
    xor  h
    sbc  a, c
    jr   nz, label_21746
    xor  h
    sbc  a, c
    ld   b, b
    ld   d, e
    xor  h
    sbc  a, c
    ld   h, b
    ld   d, e
    xor  h
    sbc  a, c
    add  a, b
    ld   d, e
    xor  h
    sbc  a, c
    and  b
    ld   d, e
    xor  h
    sbc  a, c
    ret  nz
    ld   d, e
    xor  h
    sbc  a, c
    ld   [rHDMA3], a
    xor  h
    sbc  a, d
    nop
    ld   d, e
    xor  h
    sbc  a, d
    jr   nz, label_21766
    xor  h
    sbc  a, b
    ld   c, c
    nop
    rra
    sbc  a, b
    ld   l, b
    ld   [bc], a
    ld   b, $44
    ld   a, [bc]
    sbc  a, b
    adc  a, b
    ld   [bc], a
    ld   d, $15
    ld   a, [de]
    sbc  a, b
    and  a

label_21726::
    inc  b
    rlca
    dec  d
    dec  d
    dec  d
    add  hl, de
    sbc  a, b
    add  a, $07
    rlca
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    ld   [$9809], sp
    push hl
    add  hl, bc
    rlca
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    add  hl, de
    sbc  a, c
    inc  bc

label_21746::
    dec  c
    rla
    jr   label_2175F
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    ld   [$9909], sp
    ld   hl, label_1711
    jr   label_21770
    dec  d
    dec  d
    dec  d
    dec  d

label_2175F::
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d

label_21766::
    dec  d
    dec  d
    ld   [$9909], sp
    ld   b, b
    inc  de
    add  a, d
    add  a, e
    inc  c

label_21770::
    dec  c
    inc  c
    dec  c
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    inc  c
    dec  c
    inc  c
    dec  c
    add  a, d
    add  a, e
    sbc  a, c
    ld   h, b
    ld   bc, $9392
    sbc  a, c
    ld   [hl], d
    ld   bc, $9392
    nop
    sbc  a, h
    nop
    ld   e, a
    and  b
    sbc  a, h
    jr   nz, label_217F2
    and  b
    sbc  a, h
    ld   b, b
    ld   e, a
    and  b
    sbc  a, h
    ld   h, b
    ld   e, a
    and  b
    sbc  a, h
    add  a, b
    ld   e, a
    and  b
    sbc  a, h
    and  b
    ld   e, a
    and  b
    sbc  a, h
    ret  nz
    ld   e, a
    and  b
    sbc  a, h
    ld   [$FF5F], a
    and  b
    sbc  a, l
    nop
    ld   e, a
    and  b
    sbc  a, l
    jr   nz, label_21812
    and  b
    sbc  a, l
    ld   b, b
    ld   e, a
    and  b
    sbc  a, l
    ld   h, b
    ld   e, a
    and  b
    sbc  a, l
    add  a, b
    ld   e, a
    and  b
    sbc  a, l
    and  b
    ld   e, a
    and  b
    sbc  a, l
    ret  nz
    ld   e, a
    and  b
    sbc  a, l
    ld   [$FF5F], a
    and  b
    sbc  a, [hl]
    nop
    ld   e, a
    and  b
    sbc  a, [hl]
    jr   nz, label_21832
    and  b
    sbc  a, [hl]
    ld   b, b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, [hl]
    ld   h, b
    inc  de
    and  b
    and  b
    and  b
    and  b

label_217F2::
    sub  a, d
    sub  a, e
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, h
    sbc  a, l
    and  b
    and  b
    and  b
    and  b

label_21802::
    sbc  a, [hl]
    add  a, b
    inc  de

label_21805::
    and  b
    and  b
    and  b
    and  c
    and  d
    and  e
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d

label_21812::
    xor  e
    xor  h
    xor  l
    xor  [hl]
    and  b
    and  b
    and  b
    sbc  a, [hl]
    and  b
    inc  de
    and  b
    and  b
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    and  b
    and  b
    sbc  a, [hl]
    ret  nz

label_21832::
    inc  de
    and  b
    and  b
    ret  nz
    pop  bc
    jp   nz, label_C4C3
    push bc
    add  a, $C7
    adc  a, [hl]
    adc  a, a
    jp   z, label_CCCB
    call label_CFCE
    and  b
    and  b
    sbc  a, [hl]
    ld   [rNR13], a
    and  b
    and  b
    and  b
    add  a, d
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$F9
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction
    adc  a, l
    and  b
    and  b
    and  b
    sbc  a, a
    nop
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, a
    jr   nz, label_2188B
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    and  b
    and  b
    and  b
    and  b
    and  b

label_2188B::
    and  b
    sbc  a, a
    ld   b, b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, a
    ld   h, b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, a
    add  a, b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, a
    and  b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, a
    ret  nz
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, a
    ld   [rNR13], a
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, b
    nop
    ld   e, a
    and  b
    sbc  a, b
    jr   nz, label_2197C
    and  b
    sbc  a, b
    ld   b, b
    ld   e, a
    and  b
    sbc  a, b
    ld   h, b
    ld   e, a
    and  b
    sbc  a, b
    add  a, b
    ld   e, a
    and  b
    sbc  a, b
    and  b
    ld   e, a
    and  b
    sbc  a, b
    ret  nz
    ld   e, a
    and  b
    sbc  a, b
    ld   [$FF5F], a
    and  b
    sbc  a, c
    nop
    ld   e, a
    and  b
    sbc  a, c
    jr   nz, label_2199C
    and  b
    sbc  a, c
    ld   b, b
    ld   e, a
    and  b
    sbc  a, c
    ld   h, b
    ld   e, a
    and  b
    sbc  a, c
    add  a, b
    ld   e, a
    and  b
    sbc  a, c
    and  b
    ld   e, a
    and  b
    sbc  a, c
    ret  nz
    ld   e, a
    and  b
    sbc  a, c
    ld   [$FF5F], a
    and  b
    sbc  a, d
    nop
    ld   e, a
    and  b
    sbc  a, d
    jr   nz, label_219BC
    and  b
    sbc  a, e
    nop
    ld   e, a
    and  b
    sbc  a, e
    jr   nz, label_219C4
    and  b
    sbc  a, e
    ld   b, b
    ld   e, a
    and  b
    sbc  a, e
    add  a, b
    ld   e, a
    and  b
    sbc  a, e
    and  b
    ld   e, a
    and  b
    sbc  a, e
    ret  nz
    ld   e, a
    and  b
    sbc  a, e
    ld   [$FF5F], a
    and  b
    sbc  a, b
    add  a, b

label_2197C::
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    and  b
    and  b
    and  b
    sbc  a, b
    and  b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b

label_2199C::
    inc  bc
    inc  b
    and  b
    and  b
    ld   [bc], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  b
    inc  bc
    inc  b
    sbc  a, b
    ret  nz
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    ld   [de], a
    inc  b
    inc  bc
    jr   nc, label_219E5
    jr   nc, label_219BB
    nop
    ld   bc, label_22B00

label_219BB::
    jr   nc, label_219ED
    jr   nc, label_219EF
    sbc  a, b
    ld   [rNR13], a
    and  b
    and  b

label_219C4::
    and  b
    and  b
    ld   [bc], a
    ld   e, d
    db   $10 ; Undefined instruction
    jr   nc, label_219FC
    jr   nc, label_219DE
    inc  b
    and  b
    inc  bc
    jr   nc, label_21A03
    ld   de, label_1110
    sbc  a, c
    nop
    inc  de
    and  b
    and  b
    and  b
    and  b
    nop

label_219DE::
    ld   bc, label_1000
    ld   de, $0021
    nop

label_219E5::
    ld   hl, label_21A12
    db   $10 ; Undefined instruction
    ld   bc, $0100

label_219ED::
    sbc  a, c
    jr   nz, label_21A03
    inc  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    nop
    ld   bc, $A0A0
    and  b

label_219FC::
    and  b
    nop
    ld   bc, $0100
    and  b
    and  b

label_21A03::
    and  b
    sbc  a, c
    ld   b, b
    inc  de
    jr   nc, label_21A0D
    and  b
    and  b
    and  b
    and  b

label_21A0D::
    and  b
    and  b
    and  b
    and  b
    and  b

label_21A12::
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    sbc  a, c
    ld   h, b
    inc  de
    db   $10 ; Undefined instruction
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    inc  bc
    inc  b
    and  b
    and  b
    sbc  a, c
    add  a, b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    ld   [de], a
    jr   nc, label_21A77
    inc  b
    and  b
    sbc  a, c
    and  b
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    inc  bc
    inc  b
    and  b
    ld   [bc], a
    ld   e, d
    jr   nz, label_21A6E
    rrca
    and  b
    sbc  a, c
    ret  nz
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    ld   [de], a
    inc  b
    inc  bc
    jr   nc, label_21A9E

label_21A6E::
    jr   nc, label_21A7F
    and  b
    nop
    ld   bc, $0100
    and  b
    and  b

label_21A77::
    sbc  a, c
    ld   [rNR13], a
    and  b
    ld   [de], a
    inc  b
    and  b
    and  b

label_21A7F::
    and  b
    nop
    jr   nz, label_21A93
    db   $10 ; Undefined instruction
    jr   nc, label_21A8B
    and  b
    and  b
    and  b
    and  b

label_21A8B::
    and  b
    and  b
    and  b
    sbc  a, d
    nop
    inc  de
    and  b
    nop

label_21A93::
    db   $10 ; Undefined instruction
    inc  bc
    inc  b
    inc  bc
    ld   [hl], c
    ld   l, e
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction

label_21A9E::
    and  b
    and  b
    and  b
    and  b
    inc  bc
    inc  b
    and  b
    sbc  a, d
    jr   nz, label_21ABB
    and  b
    ld   [bc], a
    ld   e, d
    db   $10 ; Undefined instruction
    ld   de, label_3010
    ld   de, label_1111
    ld   bc, $A0A0
    ld   [de], a
    inc  b
    inc  bc
    jr   nc, label_21ACA

label_21ABB::
    and  b
    sbc  a, d
    ld   b, b
    ld   d, e
    and  b
    sbc  a, d
    ld   h, b
    ld   d, e
    and  b
    sbc  a, d
    add  a, b
    ld   d, e
    and  b
    sbc  a, d
    and  b

label_21ACA::
    ld   d, e
    and  b
    sbc  a, d
    ret  nz
    ld   d, e
    and  b
    sbc  a, d
    ld   [rHDMA3], a
    and  b
    sbc  a, e
    nop
    ld   d, e
    and  b
    sbc  a, e
    jr   nz, label_21B2E
    and  b
    sbc  a, e
    ld   b, b
    ld   d, e
    and  b
    sbc  a, e
    ld   h, b
    ld   d, e
    and  b
    sbc  a, e
    add  a, b
    ld   d, e
    and  b
    sbc  a, e
    and  b
    ld   d, e
    and  b
    sbc  a, e
    ret  nz
    ld   d, e
    and  b
    sbc  a, e
    ld   [rHDMA3], a
    and  b
    nop
    sbc  a, b
    nop
    ld   e, a
    xor  h
    sbc  a, b
    jr   nz, label_21B5B
    xor  h
    sbc  a, b
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, b
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, b
    add  a, b
    ld   e, a
    xor  h
    sbc  a, b
    and  b
    ld   e, a
    xor  h
    sbc  a, b
    ret  nz
    ld   e, a
    xor  h
    sbc  a, b
    ld   [$FF5F], a
    xor  h
    sbc  a, c
    nop
    ld   e, a
    xor  h
    sbc  a, c
    jr   nz, label_21B7B
    xor  h
    sbc  a, c
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, c
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, c
    add  a, b
    ld   e, a
    xor  h
    sbc  a, c
    and  b
    ld   e, a
    xor  h
    sbc  a, c

label_21B2E::
    ret  nz
    ld   e, a
    xor  h
    sbc  a, c
    ld   [$FF5F], a
    xor  h
    sbc  a, d
    nop
    ld   e, a
    xor  h
    sbc  a, d
    jr   nz, label_21B9B
    xor  h
    sbc  a, b
    ld   [bc], a
    inc  bc
    push hl
    and  $E1
    ld  [$FF00+C], a
    sbc  a, b
    ldi  [hl], a
    inc  bc
    push af
    or   $F1
    ld   a, [$FF00+C]
    ld   b, b
    rlca
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    add  a, b
    add  a, c
    sbc  a, b
    ld   d, d
    ld   bc, $E4E3

label_21B5B::
    sbc  a, b
    ld   h, b
    rlca
    di
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    or   b
    or   c
    sub  a, b
    sub  a, c
    sbc  a, b
    ld   [hl], d
    ld   bc, $F4F3
    sbc  a, b
    add  a, b
    inc  de
    rst  $20
    db   $E8 ; add  sp, d
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    and  b
    and  c
    add  a, b
    add  a, c
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    pop  hl

label_21B7B::
    ld  [$FF00+C], a
    xor  h
    xor  h
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    sbc  a, b
    and  b
    inc  de
    rst  $30
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    or   b
    or   c
    sub  a, b
    sub  a, c
    di
    db   $F4 ; Undefined instruction
    pop  af
    ld   a, [$FF00+C]
    xor  h
    push af
    or   $F7
    xor  [hl]
    sbc  a, b
    ret  nz

label_21B9B::
    inc  de
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    sbc  a, b
    ld   [rNR13], a
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    nop
    sbc  a, b
    nop
    ld   e, a
    xor  h
    sbc  a, b
    jr   nz, label_21C2E
    xor  h
    sbc  a, b
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, b
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, b
    add  a, b
    ld   e, a
    xor  h
    sbc  a, b
    and  b
    ld   e, a
    xor  h
    sbc  a, b
    ret  nz
    ld   e, a
    xor  h
    sbc  a, b
    ld   [$FF5F], a
    xor  h
    sbc  a, c
    nop
    ld   e, a
    xor  h
    sbc  a, c
    jr   nz, label_21C4E
    xor  h
    sbc  a, c
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, c
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, c
    add  a, b
    ld   e, a
    xor  h
    sbc  a, c
    and  b
    ld   e, a
    xor  h
    sbc  a, c
    ret  nz
    ld   e, a
    xor  h
    sbc  a, c
    ld   [$FF5F], a
    xor  h
    sbc  a, d
    nop
    ld   e, a
    xor  h
    sbc  a, d
    jr   nz, label_21C6E
    xor  h
    sbc  a, b
    nop
    rlca
    ld   d, [hl]
    ld   [hl], e
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    ld   a, $98
    ld   c, $05
    ld   d, [hl]
    ld   [hl], e
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    jr   nz, label_21C2E
    ld   [hl], d
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    dec  a

label_21C2E::
    ccf
    sbc  a, b
    ld   l, $05
    ld   [hl], d
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    ld   b, b
    rlca
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    ld   [hl], h
    ld   h, a
    sbc  a, b
    ld   c, [hl]
    dec  b
    ld   b, l
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    ld   h, b

label_21C4E::
    rlca
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    ld   [hl], l
    sbc  a, b
    ld   l, [hl]
    dec  b
    ld   a, b
    ld   a, c
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    add  a, b
    rlca
    ld   b, l
    xor  [hl]
    inc  l
    dec  l
    ld   b, l
    xor  [hl]
    inc  l
    dec  l
    sbc  a, b
    sub  a, b
    inc  bc

label_21C6E::
    ld   a, d
    ld   c, e
    xor  [hl]
    ld   a, $98
    and  b
    ld   b, $78
    ld   a, c
    inc  a
    xor  h
    ld   a, b
    ld   a, c
    inc  a
    sbc  a, b
    or   c
    ld   [bc], a
    ld   a, e
    dec  a
    ccf
    sbc  a, b
    ret  z
    inc  bc
    add  a, h
    add  a, l
    sbc  a, l
    sbc  a, a
    sbc  a, b
    db   $E8 ; add  sp, d
    inc  bc
    and  d
    and  e
    cp   a
    ld   a, [$FF99]
    ld   [$F803], sp
    ld   a, [$FDFC]
    sbc  a, c
    jr   z, label_21C9D
    cp   $FF
    dec  b

label_21C9D::
    dec  bc
    sbc  a, b
    ld   [rSB], a
    ld   [hl], h
    ld   h, a
    sbc  a, c
    nop
    ld   bc, label_235AE
    sbc  a, c
    jr   nz, label_21CAC
    inc  l

label_21CAC::
    dec  l
    sbc  a, c
    ld   b, b
    nop
    inc  a
    sbc  a, c
    ld   b, h
    inc  bc
    ld   d, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   h, a
    sbc  a, c
    ld   h, h
    inc  bc
    ld   [hl], d
    xor  [hl]
    xor  [hl]
    ld   [hl], l
    sbc  a, c
    add  a, h
    inc  bc
    ld   a, d
    ld   c, e
    xor  [hl]
    ld   a, $99
    and  l
    ld   [bc], a
    ld   a, e
    dec  a
    ccf
    sbc  a, c
    sub  a, d
    ld   bc, label_23356
    sbc  a, c
    or   d
    ld   bc, $AE72
    sbc  a, c
    jp   nc, label_23A01
    ld   c, e
    sbc  a, c
    di
    nop
    ld   a, e
    sbc  a, d
    inc  de
    nop
    ld   d, a
    sbc  a, d
    ldd  [hl], a
    ld   bc, label_23170
    sbc  a, c
    jp   nz, label_21602
    ld   [hl], e
    ld   h, [hl]
    sbc  a, c
    ld  [$FF00+C], a
    inc  bc
    ld   [hl], d
    xor  [hl]
    db   $76 ; Halt
    ld   [hl], a
    sbc  a, d
    nop
    rlca
    ld   d, [hl]
    ld   [hl], e
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    ld   [hl], h
    ld   h, a
    sbc  a, d
    jr   nz, label_21D0A
    ld   [hl], d
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]

label_21D0A::
    ld   [hl], l
    nop
    sbc  a, b
    nop
    ld   e, a
    xor  h
    sbc  a, b
    jr   nz, label_21D72
    xor  h
    sbc  a, b
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, b
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, b
    add  a, b
    ld   e, a
    xor  h
    sbc  a, b
    and  b
    ld   e, a
    xor  h
    sbc  a, b
    ret  nz
    ld   e, a
    xor  h
    sbc  a, b
    ld   [$FF5F], a
    xor  h
    sbc  a, c
    nop
    ld   e, a
    xor  h
    sbc  a, c
    jr   nz, label_21D92
    xor  h
    sbc  a, c
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, c
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, c
    add  a, b
    ld   e, a
    xor  h
    sbc  a, c
    and  b
    ld   e, a
    xor  h
    sbc  a, c
    ret  nz
    ld   e, a
    xor  h
    sbc  a, c
    ld   [$FF5F], a
    xor  h
    sbc  a, d
    nop
    ld   e, a
    xor  h
    sbc  a, d
    jr   nz, label_21DB2
    xor  h
    sbc  a, d
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, d
    ld   h, b
    ld   e, a
    xor  h

label_21D5C::
    sbc  a, d
    add  a, b
    ld   e, a
    xor  h
    sbc  a, d
    and  b
    ld   e, a
    xor  h
    sbc  a, d
    ld   [$FF5F], a
    xor  h
    sbc  a, e
    ret  nz
    ld   e, a
    xor  h
    sbc  a, e
    ld   [$FF5F], a
    xor  h
    sbc  a, b
    ld   [de], a

label_21D72::
    ld   bc, $E6E5
    sbc  a, b
    ldd  [hl], a
    ld   bc, $F6F5
    sbc  a, b
    ld   b, b
    ld   bc, $8180
    sbc  a, b
    ld   c, h
    rlca
    push hl
    and  $E1
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    sbc  a, b
    ld   h, b
    ld   bc, $9190
    sbc  a, b
    ld   l, h
    rlca

label_21D92::
    push af
    or   $F1
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    sbc  a, b
    add  a, b
    inc  de
    and  b
    and  c
    pop  hl
    ld  [$FF00+C], a
    xor  h
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    pop  hl
    ld  [$FF00+C], a
    xor  h
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    sbc  a, b

label_21DB2::
    and  b
    inc  de
    or   b
    or   c
    pop  af
    ld   a, [$FF00+C]
    di
    db   $F4 ; Undefined instruction
    pop  af
    ld   a, [$FF00+C]
    di
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    or   b
    or   c
    rst  $30
    xor  [hl]
    or   b
    or   c
    sbc  a, b
    ret  nz
    inc  de
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    sbc  a, b
    ld   [rNR13], a
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sbc  a, c
    ld   l, b
    inc  bc
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    sbc  a, c
    add  a, [hl]
    dec  b
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    sbc  a, c
    and  [hl]
    rlca
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d
    xor  e
    sbc  a, c
    call nz, label_B20C
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    sbc  a, c
    ld  [$FF00+C], a
    rrca
    ret  nz
    pop  bc
    jp   nz, label_C4C3
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_CCCB
    call label_CFCE
    sbc  a, d
    ld   [bc], a
    rrca
    ret  nc
    pop  de
    jp   nc, label_D4D3
    push de
    sub  a, $D7
    ret  c
    reti
    jp  c, label_DCDB
    db   $DE
    sbc  a, $DF
    sbc  a, d
    ldi  [hl], a
    rrca
    ld   [rUNKN1], a
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, h
    ld   l, l
    rst  $28
    nop
    sbc  a, b
    nop
    ld   d, e
    xor  h
    sbc  a, b
    jr   nz, label_21EB5
    xor  h
    sbc  a, b
    jr   z, label_21E69
    ld   d, b
    ld   d, c
    ld   d, d

label_21E69::
    ld   d, e
    sbc  a, b
    ld   b, b
    ld   d, e
    xor  h
    sbc  a, b
    ld   c, b
    dec  b
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    sbc  a, b
    ld   h, b
    ld   d, e
    xor  h
    sbc  a, b
    add  a, b
    ld   d, e
    xor  h
    sbc  a, b
    sub  a, d
    ld   bc, $E6E5
    sbc  a, b
    and  b
    ld   d, e
    xor  h
    sbc  a, b
    and  h
    ld   bc, label_22564
    sbc  a, b
    or   d
    ld   bc, $F6F5
    sbc  a, b
    ret  nz
    ld   d, e
    xor  h
    sbc  a, b
    ret  nz
    ld   bc, $8180
    sbc  a, b
    call z, label_E507
    and  $E1
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    sbc  a, b
    ld   [rHDMA3], a
    xor  h
    sbc  a, b
    ld   [rSB], a
    sub  a, b
    sub  a, c
    sbc  a, b
    db   $EC ; Undefined instruction
    rlca
    push af
    or   $F1

label_21EB5::
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    sbc  a, c
    nop
    inc  de
    and  b
    and  c
    pop  hl
    ld  [$FF00+C], a
    xor  h
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    pop  hl
    ld  [$FF00+C], a
    xor  h
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    sbc  a, c
    jr   nz, label_21EE7
    or   b
    or   c
    pop  af
    ld   a, [$FF00+C]
    di
    db   $F4 ; Undefined instruction
    pop  af
    ld   a, [$FF00+C]
    di
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    or   b
    or   c
    rst  $30
    xor  [hl]
    or   b

label_21EE7::
    or   c
    sbc  a, c
    ld   b, b
    rra
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    sbc  a, c
    ld   h, b
    rra
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sbc  a, c
    add  a, b
    ld   e, a
    xor  h
    sbc  a, c
    and  b
    ld   e, a
    xor  h
    sbc  a, c
    ret  nz
    ld   e, a
    xor  h
    sbc  a, c
    ld   [$FF5F], a
    xor  h
    sbc  a, d
    nop
    ld   e, a
    xor  h
    sbc  a, d
    jr   nz, label_21FA4
    xor  h
    nop
    sbc  a, e
    ret  nz
    ld   e, a
    xor  h
    sbc  a, e
    ld   [$FF5F], a
    xor  h
    sbc  a, b
    nop
    ld   e, a
    xor  h
    sbc  a, b
    jr   nz, label_21FB5
    xor  h
    sbc  a, b
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, b
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, b
    add  a, b
    ld   e, a
    xor  h
    sbc  a, b
    and  b
    ld   e, a
    xor  h
    sbc  a, b
    ret  nz
    ld   e, a
    xor  h
    sbc  a, b
    ld   [$FF5F], a
    xor  h
    sbc  a, c
    nop
    ld   e, a
    xor  h
    sbc  a, c
    jr   nz, label_21FD5
    xor  h
    sbc  a, c
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, c
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, c
    add  a, b
    ld   e, a
    xor  h
    sbc  a, c
    and  b
    ld   e, a
    xor  h
    sbc  a, c
    ret  nz
    ld   e, a
    xor  h
    sbc  a, c
    ld   [$FF5F], a
    xor  h
    sbc  a, d
    nop
    ld   e, a
    xor  h
    sbc  a, d
    jr   nz, label_21FF5
    xor  h
    sbc  a, d
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, d
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, b
    ld   bc, label_21805
    ld   e, c

label_21FA4::
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    sbc  a, b
    ld   hl, label_22805
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    sbc  a, b
    ld   sp, label_21802

label_21FB5::
    ld   e, c
    ld   e, d
    sbc  a, b
    ld   d, c
    ld   [bc], a
    ld   l, b
    ld   l, c
    ld   l, d
    sbc  a, b
    ld   h, b
    ld   bc, label_21D5C
    sbc  a, b
    add  a, b
    rlca
    ld   l, h
    ld   l, l
    xor  h
    xor  h
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    sbc  a, b
    and  h
    dec  b
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h

label_21FD5::
    ld   h, l
    sbc  a, c
    ld   b, b
    inc  bc
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    sbc  a, c
    ld   c, a
    inc  bc
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    sbc  a, c
    ld   h, b
    inc  bc
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    sbc  a, c
    ld   l, l
    dec  b
    ld   h, h
    ld   h, l
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    sbc  a, c

label_21FF5::
    db   $E3 ; Undefined instruction
    ld   bc, label_22564
    sbc  a, d
    nop
    ld   bc, label_22564
    sbc  a, d
    db   $10 ; Undefined instruction

label_22001::
    ld   h, h
    ld   h, l
    nop
    sbc  a, b
    nop
    ld   e, a
    xor  h
    sbc  a, b
    jr   nz, label_2206A
    xor  h
    sbc  a, b
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, b
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, b
    add  a, b
    ld   e, a
    xor  h
    sbc  a, b
    and  b
    ld   e, a
    xor  h
    sbc  a, b
    ret  nz
    ld   e, a
    xor  h
    sbc  a, b
    ld   [$FF5F], a
    xor  h
    sbc  a, c
    nop
    ld   e, a
    xor  h
    sbc  a, c
    jr   nz, label_2208A
    xor  h
    sbc  a, c
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, c
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, c
    add  a, b
    ld   e, a
    xor  h
    sbc  a, c
    and  b
    ld   e, a
    xor  h
    sbc  a, c
    ret  nz
    ld   e, a
    xor  h
    sbc  a, c
    ld   [$FF5F], a
    xor  h
    sbc  a, d
    nop
    ld   e, a
    xor  h
    sbc  a, d
    jr   nz, label_220AA
    xor  h
    sbc  a, d
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, d
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, d
    add  a, b
    ld   e, a
    xor  h
    sbc  a, d
    and  b
    ld   e, a
    xor  h
    sbc  a, d
    ret  nz
    ld   e, a
    xor  h
    sbc  a, d
    ld   [$FF5F], a
    xor  h
    sbc  a, e
    nop
    ld   e, a
    xor  h
    sbc  a, e
    jr   nz, label_220CA
    xor  h
    sbc  a, e
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, e
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, e
    add  a, b
    ld   e, a
    xor  h
    sbc  a, e
    and  b
    ld   e, a
    xor  h
    sbc  a, e
    ret  nz
    ld   e, a
    xor  h
    sbc  a, e
    ld   [$FF5F], a
    xor  h
    sbc  a, d
    ld   b, b
    ld   bc, label_22D6C
    sbc  a, d

label_2208A::
    ld   b, [hl]
    inc  bc
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    sbc  a, d
    ld   h, [hl]
    inc  bc
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    sbc  a, d

label_22098::
    sub  a, b

label_22099::
    inc  bc
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    pop  hl
    ld  [$FF00+C], a
    sbc  a, d
    or   b
    inc  bc
    di
    db   $F4 ; Undefined instruction
    pop  af
    ld   a, [$FF00+C]
    adc  a, $05
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction

label_220AA::
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    sbc  a, d
    xor  $05
    di
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    or   b
    or   c
    sbc  a, e
    inc  b
    inc  bc
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    sbc  a, e
    ld   c, $05
    ldi  [hl], a
    inc  hl
    ld   [bc], a
    inc  bc
    inc  hl
    xor  [hl]
    sbc  a, e
    inc  h
    inc  bc

label_220CA::
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    sbc  a, e
    ld   l, $05
    ldd  [hl], a
    inc  sp
    ld   [de], a
    inc  de
    xor  [hl]
    xor  [hl]
    sbc  a, e
    ld   b, b
    inc  bc
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    pop  hl
    ld  [$FF00+C], a
    sbc  a, e
    ld   c, e
    ld   bc, label_22564
    sbc  a, e
    ld   d, b
    inc  bc
    ldi  [hl], a
    inc  hl
    ld   [bc], a
    inc  bc
    sbc  a, e
    ld   h, b
    inc  bc
    di
    db   $F4 ; Undefined instruction
    pop  af
    ld   a, [$FF00+C]
    ld   [hl], b
    inc  bc
    ldd  [hl], a
    inc  sp
    ld   [de], a
    inc  de
    sbc  a, e
    add  a, b
    ld   [$E8E7], sp
    and  b
    and  c
    add  a, b
    add  a, c
    xor  h
    ld   h, h
    ld   h, l
    sbc  a, e
    sub  a, d
    ld   bc, label_2322
    sbc  a, e
    and  b
    dec  b
    rst  $30
    xor  [hl]
    or   b
    or   c
    sub  a, b
    sub  a, c
    sbc  a, e
    or   d
    ld   bc, $F6F5
    sbc  a, e
    ret  nz
    dec  b
    inc  bc
    nop
    ld   bc, label_20AE
    ld   hl, $CC9B
    rlca
    push hl
    and  $E1
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    sbc  a, e
    ld   [rTIMA], a
    inc  de
    db   $10 ; Undefined instruction
    xor  [hl]
    jr   nc, label_22165
    sbc  a, e
    db   $EC ; Undefined instruction
    rlca
    push af
    or   $F1
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    sbc  a, b
    nop
    inc  bc
    xor  [hl]
    xor  [hl]
    jr   nz, label_22167
    sbc  a, b
    ld   a, [bc]
    add  hl, bc
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    rst  $20
    db   $E8 ; add  sp, d
    and  b
    and  c
    sbc  a, b
    jr   nz, label_22159
    xor  [hl]
    xor  [hl]
    jr   nc, label_2218B
    sbc  a, b
    ld   a, [hli]
    add  hl, bc
    di
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    or   b
    or   c
    rst  $30
    inc  hl

label_22165::
    or   b
    or   c

label_22167::
    sbc  a, b
    ld   b, b
    inc  bc
    ld   [bc], a
    inc  bc
    pop  hl
    ld  [$FF00+C], a
    sbc  a, b
    ld   c, d
    add  hl, bc
    ldi  [hl], a
    inc  hl
    ld   [bc], a
    inc  bc
    inc  hl
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    ld   h, b
    inc  bc
    ld   [de], a
    inc  de
    pop  af
    ld   a, [$FF00+C]
    ld   l, d
    add  hl, bc
    ldd  [hl], a
    inc  sp
    ld   [de], a
    inc  de
    inc  hl
    xor  [hl]

label_2218B::
    inc  hl
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    add  a, b
    inc  bc
    xor  [hl]
    xor  [hl]
    jr   nz, label_221B7
    sbc  a, b
    adc  a, h
    rlca
    ldi  [hl], a
    inc  hl
    ld   [bc], a
    inc  bc
    inc  hl
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    and  b
    inc  bc
    xor  [hl]
    xor  [hl]
    jr   nc, label_221D9
    sbc  a, b
    xor  h
    rlca
    ldd  [hl], a
    inc  sp
    ld   [de], a
    inc  de
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    ret  nz
    inc  bc
    xor  [hl]

label_221B7::
    xor  [hl]
    pop  hl
    ld  [$FF00+C], a
    sbc  a, b
    call z, label_E307
    db   $E4 ; Undefined instruction
    rst  $20
    db   $E8 ; add  sp, d
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, b
    ld   [$FF03], a
    xor  [hl]
    xor  [hl]
    pop  af
    ld   a, [$FF00+C]
    db   $EC ; Undefined instruction
    rlca
    di
    db   $F4 ; Undefined instruction
    rst  $30
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, c
    nop

label_221D9::
    dec  b
    ld   [bc], a
    inc  bc
    nop
    ld   bc, $8180
    sbc  a, c
    ld   a, [bc]
    add  hl, bc
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, c
    jr   nz, label_221F5
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    sub  a, b

label_221F5::
    sub  a, c
    sbc  a, c
    ld   a, [hli]
    add  hl, bc
    push af
    or   $F7
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, c
    ld   b, b
    inc  de
    inc  hl
    xor  [hl]
    xor  [hl]
    xor  [hl]
    and  b
    and  c
    pop  hl
    ld  [$FF00+C], a
    xor  h
    xor  h
    ldi  [hl], a
    inc  hl
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, c
    ld   h, b
    inc  de
    xor  [hl]
    xor  [hl]
    xor  [hl]
    inc  hl
    or   b
    or   c
    pop  af
    ld   a, [$FF00+C]
    xor  h
    ldd  [hl], a
    inc  sp
    inc  hl
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    xor  [hl]
    sbc  a, c
    add  a, b
    inc  de
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    sbc  a, c
    and  b
    inc  de
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, e
    sbc  a, h
    nop
    ld   e, a
    xor  h
    sbc  a, h
    jr   nz, label_222C5
    xor  h
    sbc  a, h
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, h
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, h
    add  a, b
    ld   e, a
    xor  h
    sbc  a, h
    and  b
    ld   e, a
    xor  h
    sbc  a, h
    ret  nz
    ld   e, a
    xor  h
    sbc  a, h
    ld   [$FF5F], a
    xor  h
    sbc  a, l
    nop
    ld   e, a
    xor  h
    sbc  a, l
    jr   nz, label_222E5
    xor  h
    sbc  a, l
    ld   b, b
    ld   e, a
    xor  h
    sbc  a, l
    ld   h, b
    ld   e, a
    xor  h
    sbc  a, l
    add  a, b
    ld   e, a
    xor  h
    sbc  a, l
    and  b
    ld   e, a
    xor  h
    sbc  a, l
    ret  nz
    ld   e, a
    xor  h
    sbc  a, l
    ld   [$FF5F], a
    xor  h
    sbc  a, [hl]
    nop
    ld   e, a
    xor  h
    sbc  a, [hl]
    jr   nz, label_22305
    xor  h
    nop
    sbc  a, d
    nop
    ld   d, e
    ld   a, [hl]
    sbc  a, d
    jr   nz, label_22302
    ld   a, [hl]
    sbc  a, d
    ld   b, b
    ld   d, e
    ld   a, [hl]
    sbc  a, d
    ld   h, b
    ld   d, e
    ld   a, [hl]
    sbc  a, d
    add  a, b
    ld   d, e
    ld   a, [hl]
    sbc  a, d
    and  b
    ld   d, e
    ld   a, [hl]
    sbc  a, d
    ret  nz
    ld   d, e
    ld   a, [hl]
    sbc  a, d

label_222C5::
    ld   [rHDMA3], a
    ld   a, [hl]
    sbc  a, e
    nop
    ld   d, e
    ld   a, [hl]
    sbc  a, e
    jr   nz, label_22322

label_222CF::
    ld   a, [hl]
    sbc  a, e
    ld   b, b
    ld   d, e
    ld   a, [hl]
    sbc  a, e
    ld   h, b
    ld   d, e
    ld   a, [hl]
    sbc  a, e
    add  a, b
    ld   d, e
    ld   a, [hl]
    sbc  a, e
    and  b
    ld   d, e
    ld   a, [hl]
    sbc  a, e
    ret  nz
    ld   d, e
    ld   a, [hl]
    sbc  a, e

label_222E5::
    ld   [rHDMA3], a
    ld   a, [hl]
    nop

label_222E9::
    sbc  a, b
    nop
    inc  de
    db   $FC ; Undefined instruction
    dec  sp
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    inc  a
    db   $FC ; Undefined instruction
    sbc  a, d
    jr   nz, label_22316
    db   $FC ; Undefined instruction
    ld   c, e

label_22305::
    ld   c, a
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    ld   c, l
    ld   d, e
    ld   d, e
    ld   c, a
    ld   c, [hl]
    ld   c, l
    ld   d, e
    ld   d, e
    ld   d, e
    ld   d, e
    ld   d, e
    ld   c, h

label_22316::
    db   $FC ; Undefined instruction
    sbc  a, b
    jr   nz, label_222E9
    db   $FC ; Undefined instruction
    sbc  a, b
    inc  sp
    rst  8
    db   $FC ; Undefined instruction
    sbc  a, b
    ld   hl, label_210CF
    sbc  a, b
    ldd  [hl], a
    rst  8
    ld   d, c
    nop
    sbc  a, c
    and  $0A
    inc  b
    ld   de, label_1200
    inc  b
    ld   a, [hl]
    ld   a, [hl]
    ld   [bc], a
    ld   c, $0F
    jr   label_222CF
    nop
    ld   c, b
    adc  a, a
    sbc  a, b
    ld   bc, $9F00
    sbc  a, b
    inc  bc
    nop
    sbc  a, a
    sbc  a, b
    dec  b
    nop
    sbc  a, a
    sbc  a, b
    rlca
    nop
    sbc  a, a
    sbc  a, b
    add  hl, bc
    nop
    sbc  a, a
    sbc  a, b
    jr   nz, label_22359
    sbc  a, a
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    adc  a, c
    adc  a, a

label_22359::
    sbc  a, a
    sbc  a, b
    ld   b, b
    ld   [$908F], sp
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    xor  d
    sbc  a, a
    adc  a, a
    sbc  a, b
    ld   h, b
    ld   [$8A9F], sp
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    xor  a
    adc  a, a
    sbc  a, a
    sbc  a, b
    add  a, b
    ld   d, d
    adc  a, a
    sbc  a, b
    add  a, c
    nop
    sbc  a, a
    sbc  a, b
    add  a, e
    nop
    sbc  a, a
    sbc  a, b
    add  a, l
    nop
    sbc  a, a
    sbc  a, b
    add  a, a
    nop
    sbc  a, a
    sbc  a, b
    adc  a, c
    nop
    sbc  a, a
    sbc  a, b
    adc  a, e
    nop
    sbc  a, a
    sbc  a, b
    adc  a, l
    nop
    sbc  a, a
    sbc  a, b
    adc  a, a
    nop
    sbc  a, a
    sbc  a, b
    sub  a, c
    nop
    sbc  a, a
    sbc  a, b
    sub  a, e
    nop
    sbc  a, a
    sbc  a, b
    and  b
    res  3, a
    sbc  a, b
    ret  nz
    nop
    adc  a, a
    sbc  a, c
    nop
    nop
    adc  a, a
    sbc  a, c
    ld   b, b
    nop
    adc  a, a
    sbc  a, c
    add  a, b
    nop
    adc  a, a
    sbc  a, c
    ret  nz
    nop
    adc  a, a
    sbc  a, d
    nop
    nop
    adc  a, a
    sbc  a, d
    jr   nz, label_223BD

label_223BD::
    sbc  a, a
    sbc  a, d
    ld   hl, $8F50
    sbc  a, d
    ldi  [hl], a
    nop
    sbc  a, a
    sbc  a, d
    inc  h
    nop
    sbc  a, a
    sbc  a, d
    ld   h, $00
    sbc  a, a
    sbc  a, d
    jr   z, label_223D1

label_223D1::
    sbc  a, a
    sbc  a, d
    ld   a, [hli]
    nop
    sbc  a, a
    sbc  a, d
    inc  l
    nop
    sbc  a, a
    sbc  a, d
    ld   l, $00
    sbc  a, a
    sbc  a, d
    jr   nc, label_223E1

label_223E1::
    sbc  a, a
    sbc  a, d
    ldd  [hl], a
    nop
    adc  a, a
    sbc  a, b
    or   e
    jp   z, label_988F
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, c
    inc  de
    nop
    sbc  a, a
    sbc  a, c
    ld   d, e
    nop
    sbc  a, a
    sbc  a, c
    sub  a, e
    nop
    sbc  a, a
    sbc  a, c
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, d
    inc  de
    nop
    sbc  a, a
    sbc  a, d
    inc  sp
    nop
    sbc  a, a
    sbc  a, b
    ld   a, [bc]
    ld   c, c
    ld   a, a
    sbc  a, b
    add  hl, hl
    ld   c, d
    ld   a, a
    sbc  a, b
    ld   l, c
    ld   c, d
    and  d
    sbc  a, b
    ld   c, c
    ld   a, [bc]
    and  c
    and  b
    and  c
    and  l
    and  [hl]
    and  b
    and  c
    and  l
    and  [hl]
    and  b
    and  c
    sbc  a, b
    inc  l
    ld   bc, $A4A3
    sbc  a, b
    jr   nc, label_22429
    and  e

label_22429::
    and  h
    sbc  a, b
    ld   l, h
    ld   bc, $A8A7
    sbc  a, b
    ld   [hl], b
    ld   bc, $A8A7
    sbc  a, b
    call nz, label_AB00
    sbc  a, c
    inc  h
    nop
    xor  h
    sbc  a, c
    add  a, h
    nop
    xor  l
    sbc  a, c
    jp   nz, label_A94F
    sbc  a, d
    ldd  [hl], a
    nop
    sbc  a, a
    sbc  a, d
    inc  sp
    nop
    adc  a, a
    nop
    sbc  a, b
    nop
    ld   d, b
    adc  a, a
    sbc  a, b
    ld   bc, $9F00
    sbc  a, b
    inc  bc
    nop
    sbc  a, a
    sbc  a, b
    dec  b
    nop
    sbc  a, a
    sbc  a, b
    rlca
    nop
    sbc  a, a
    sbc  a, b
    add  hl, bc
    nop
    sbc  a, a
    sbc  a, b
    dec  bc
    nop
    sbc  a, a
    sbc  a, b
    dec  c
    nop
    sbc  a, a
    sbc  a, b
    rrca
    nop
    sbc  a, a
    sbc  a, b
    ld   de, $9F00
    sbc  a, b
    jr   nz, label_2247F
    sbc  a, a
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, a
    sbc  a, a

label_2247F::
    adc  a, a
    sbc  a, b
    ld   b, b
    rlca
    adc  a, a
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    adc  a, a
    sbc  a, a
    sbc  a, b
    ld   h, b
    rlca
    sbc  a, a
    sbc  a, d
    sbc  a, e
    sbc  a, h
    sbc  a, l
    sbc  a, [hl]
    sbc  a, a
    adc  a, a
    sbc  a, b
    jr   nc, label_22499

label_22499::
    sbc  a, a
    sbc  a, b
    ld   d, b
    nop
    adc  a, a
    sbc  a, b
    ld   [hl], b
    nop
    sbc  a, a
    sbc  a, b
    ld   [de], a
    ld   b, c
    ld   a, a
    sbc  a, b
    ld   sp, label_23F42
    sbc  a, b
    ld   d, c
    ld   [bc], a
    and  c
    and  b
    and  c
    sbc  a, b
    ld   [hl], c
    ld   b, d
    and  d
    sbc  a, b
    add  a, b
    ld   d, d
    adc  a, a
    sbc  a, b
    add  a, c
    nop
    sbc  a, a
    sbc  a, b
    add  a, e
    nop
    sbc  a, a
    sbc  a, b
    add  a, l
    nop
    sbc  a, a
    sbc  a, b
    add  a, a
    nop
    sbc  a, a
    sbc  a, b
    adc  a, c
    nop
    sbc  a, a
    sbc  a, b
    adc  a, e
    nop
    sbc  a, a
    sbc  a, b
    adc  a, l
    nop
    sbc  a, a
    sbc  a, b
    adc  a, a
    nop
    sbc  a, a
    sbc  a, b
    sub  a, c
    nop
    sbc  a, a
    sbc  a, b
    sub  a, e
    nop
    sbc  a, a
    sbc  a, b
    and  b
    ret
    sbc  a, a
    sbc  a, b
    ret  nz
    nop
    adc  a, a
    sbc  a, c
    nop
    nop
    adc  a, a
    sbc  a, c
    ld   b, b
    nop
    adc  a, a
    sbc  a, c
    add  a, b
    nop
    adc  a, a
    sbc  a, c
    ret  nz
    nop
    adc  a, a
    sbc  a, b
    or   e
    ret
    adc  a, a
    sbc  a, b
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, c
    inc  de
    nop
    sbc  a, a
    sbc  a, c
    ld   d, e

label_22506::
    nop
    sbc  a, a
    sbc  a, c
    sub  a, e
    nop
    sbc  a, a
    sbc  a, c
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, d
    jr   nz, label_22565
    sbc  a, a
    sbc  a, d
    ld   hl, $8F00
    sbc  a, d
    inc  hl
    nop
    adc  a, a
    sbc  a, d
    dec  h
    nop
    adc  a, a
    sbc  a, d
    daa
    nop
    adc  a, a
    sbc  a, d
    add  hl, hl
    nop
    adc  a, a
    sbc  a, d
    dec  hl
    nop
    adc  a, a
    sbc  a, d
    dec  l
    nop
    adc  a, a
    sbc  a, d
    cpl
    nop
    adc  a, a
    sbc  a, d
    ld   sp, $8F00
    sbc  a, d
    inc  sp
    nop
    adc  a, a
    sbc  a, b
    jp   nz, label_6
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $99
    ld   [bc], a
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    sbc  a, c
    ld   b, d
    ld   b, $0E
    rrca
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  d
    sbc  a, c
    add  a, d
    inc  b
    dec  d
    ld   d, $17
    jr   label_2257B
    sbc  a, b
    rlc  [hl]

label_22565::
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    jr   nz, label_22506
    dec  bc
    ld   b, $21
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    sbc  a, c
    ld   c, e
    ld   b, $28
    add  hl, hl

label_2257B::
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $99
    adc  a, e
    inc  b
    cpl
    jr   nc, label_225B7
    ldd  [hl], a
    ld   a, $00

label_22589::
    sbc  a, b
    nop
    ld   d, d
    adc  a, a
    sbc  a, b
    ld   bc, $9F00
    sbc  a, b
    inc  bc
    nop
    sbc  a, a
    sbc  a, b
    dec  b
    nop
    sbc  a, a
    sbc  a, b
    rlca
    nop
    sbc  a, a
    sbc  a, b
    add  hl, bc
    nop
    sbc  a, a
    sbc  a, b
    dec  bc
    nop
    sbc  a, a
    sbc  a, b
    dec  c
    nop
    sbc  a, a
    sbc  a, b
    rrca
    nop
    sbc  a, a
    sbc  a, b
    ld   de, $9F00
    sbc  a, b
    inc  de
    nop
    sbc  a, a
    sbc  a, b
    jr   nz, label_22589
    sbc  a, a
    sbc  a, b
    ld   b, b
    nop
    adc  a, a
    sbc  a, b
    add  a, b
    nop
    adc  a, a
    sbc  a, b
    ret  nz
    nop
    adc  a, a
    sbc  a, c
    nop
    nop
    adc  a, a
    sbc  a, c
    ld   b, b
    nop
    adc  a, a
    sbc  a, c
    add  a, b
    nop
    adc  a, a
    sbc  a, c
    ret  nz
    nop
    adc  a, a
    sbc  a, d
    nop
    nop
    adc  a, a
    sbc  a, b
    inc  sp
    pop  de
    adc  a, a
    sbc  a, b
    ld   d, e
    nop
    sbc  a, a
    sbc  a, b
    sub  a, e
    nop
    sbc  a, a
    sbc  a, b
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, c
    inc  de
    nop
    sbc  a, a
    sbc  a, c
    ld   d, e
    nop
    sbc  a, a
    sbc  a, c
    sub  a, e
    nop
    sbc  a, a
    sbc  a, c
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, d
    inc  de
    nop
    sbc  a, a
    sbc  a, d
    ld   hl, $8F50
    sbc  a, d
    ldi  [hl], a
    nop
    sbc  a, a
    sbc  a, d
    inc  h
    nop
    sbc  a, a
    sbc  a, d
    ld   h, $00
    sbc  a, a
    sbc  a, d
    jr   z, label_22610

label_22610::
    sbc  a, a
    sbc  a, d
    ld   a, [hli]
    nop
    sbc  a, a
    sbc  a, d
    inc  l
    nop
    sbc  a, a
    sbc  a, d
    ld   l, $00
    sbc  a, a
    sbc  a, d
    jr   nc, label_22620

label_22620::
    sbc  a, a
    sbc  a, d
    ldd  [hl], a
    nop
    sbc  a, a
    sbc  a, b
    ld   b, d
    ld   a, [bc]
    inc  b
    ld   de, label_1200
    inc  b
    ld   a, [hl]
    ld   d, $07
    ld   [label_702], sp
    sbc  a, b
    adc  a, d
    rlca
    rrca
    dec  bc
    nop
    jr   label_2263F
    ld   de, label_3C7E
    sbc  a, b

label_2263F::
    call nz, label_AB00
    sbc  a, c
    inc  h
    nop
    xor  h
    sbc  a, c
    add  a, h
    nop
    xor  l
    sbc  a, c
    jp   nz, label_A94F
    sbc  a, c
    db   $E4 ; Undefined instruction
    dec  c
    ld   de, label_1304
    inc  d
    ld   de, label_23E0D
    inc  de
    ld   c, $7E
    inc  c
    inc  b
    dec  c
    inc  d
    nop

label_22660::
    sbc  a, b
    nop
    ld   d, d
    adc  a, a
    sbc  a, b
    ld   bc, $9F00
    sbc  a, b
    inc  bc
    nop
    sbc  a, a
    sbc  a, b
    dec  b
    nop
    sbc  a, a
    sbc  a, b
    rlca
    nop
    sbc  a, a
    sbc  a, b
    add  hl, bc
    nop
    sbc  a, a
    sbc  a, b
    dec  bc
    nop
    sbc  a, a
    sbc  a, b
    dec  c
    nop
    sbc  a, a
    sbc  a, b
    rrca
    nop
    sbc  a, a
    sbc  a, b
    ld   de, $9F00
    sbc  a, b
    inc  de
    nop
    sbc  a, a
    sbc  a, b
    jr   nz, label_22660
    sbc  a, a
    sbc  a, b
    ld   b, b
    nop
    adc  a, a
    sbc  a, b
    add  a, b
    nop
    adc  a, a
    sbc  a, b
    ret  nz
    nop
    adc  a, a
    sbc  a, c
    nop
    nop
    adc  a, a
    sbc  a, c
    ld   b, b
    nop
    adc  a, a
    sbc  a, c
    add  a, b
    nop
    adc  a, a
    sbc  a, c
    ret  nz
    nop
    adc  a, a
    sbc  a, d
    nop
    nop
    adc  a, a
    sbc  a, b
    inc  sp
    pop  de
    adc  a, a
    sbc  a, b
    ld   d, e
    nop
    sbc  a, a
    sbc  a, b
    sub  a, e
    nop
    sbc  a, a
    sbc  a, b
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, c
    inc  de
    nop
    sbc  a, a
    sbc  a, c
    ld   d, e
    nop
    sbc  a, a
    sbc  a, c
    sub  a, e
    nop
    sbc  a, a
    sbc  a, c
    db   $D3 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, d
    inc  de
    nop
    sbc  a, a
    sbc  a, d
    ld   hl, $8F50
    sbc  a, d
    ldi  [hl], a
    nop
    sbc  a, a
    sbc  a, d
    inc  h
    nop
    sbc  a, a
    sbc  a, d
    ld   h, $00
    sbc  a, a
    sbc  a, d
    jr   z, label_226E7

label_226E7::
    sbc  a, a
    sbc  a, d
    ld   a, [hli]
    nop
    sbc  a, a
    sbc  a, d
    inc  l
    nop
    sbc  a, a
    sbc  a, d
    ld   l, $00
    sbc  a, a
    sbc  a, d
    jr   nc, label_226F7

label_226F7::
    sbc  a, a
    sbc  a, d
    ldd  [hl], a
    nop
    sbc  a, a
    sbc  a, c
    jp   nz, label_A94F
    sbc  a, b
    ld   b, d
    ld   a, [bc]
    ld   [bc], a
    ld   c, $0F
    jr   label_22786
    rrca
    dec  bc
    nop
    jr   label_22711
    ld   de, $8498
    inc  c

label_22711::
    ccf
    dec  b
    ld   de, label_C0E
    ccf
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ccf
    inc  de
    ld   c, $3F
    sbc  a, b
    jp   label_AB00
    sbc  a, b
    call z, label_AB00
    sbc  a, c
    inc  hl
    nop
    xor  h
    sbc  a, c
    inc  l
    nop
    xor  h
    sbc  a, c
    add  a, e
    nop
    xor  l
    sbc  a, c
    adc  a, h
    nop
    xor  l
    sbc  a, c
    db   $E4 ; Undefined instruction
    dec  c
    ld   de, label_1304
    inc  d
    ld   de, label_23E0D
    inc  de
    ld   c, $7E
    inc  c
    inc  b
    dec  c
    inc  d
    nop
    sbc  a, h
    nop
    ld   d, e
    ld   a, a
    sbc  a, h
    jr   nz, label_227A2
    ld   a, a
    sbc  a, h
    ld   b, b
    ld   d, e
    ld   a, a
    sbc  a, h
    ld   h, b
    ld   d, e
    ld   a, a
    sbc  a, h
    add  a, b
    ld   d, e
    ld   a, a
    sbc  a, h
    and  b
    ld   d, e
    ld   a, a
    sbc  a, h
    ret  nz
    ld   d, e
    ld   a, a
    sbc  a, h
    ld   [rHDMA3], a
    ld   a, a
    sbc  a, l
    nop
    ld   d, e
    ld   a, a
    sbc  a, l
    jr   nz, label_227C2
    ld   a, a
    sbc  a, l
    ld   b, b
    ld   d, e
    ld   a, a
    sbc  a, l
    ld   h, b
    ld   d, e
    ld   a, a
    sbc  a, l
    add  a, b
    ld   d, e
    ld   a, a
    sbc  a, l
    and  b
    ld   d, e
    ld   a, a
    sbc  a, l
    ret  nz
    ld   d, e
    ld   a, a
    sbc  a, l
    ld   [rHDMA3], a
    ld   a, a
    sbc  a, [hl]
    nop
    ld   d, e
    ld   a, a
    sbc  a, [hl]
    jr   nz, label_227E2
    ld   a, a
    sbc  a, h
    nop
    ld   c, $BD
    ld   a, a
    ld   a, a
    ld   a, a
    cp   [hl]
    cp   e
    ld   a, a
    ld   a, a
    ld   a, a
    cp   [hl]
    rst  8
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_227A2::
    sbc  a, h
    jr   nz, label_227B3
    cp   h
    ld   a, a
    ld   a, a
    ld   a, a
    cp   a
    cp   h
    ld   a, a
    ld   a, a
    ld   a, a
    cp   a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_227B3::
    ld   a, a
    sbc  a, h
    ld   b, b
    ld   d, e
    call z, label_2289C
    adc  a, $8D
    sbc  a, h
    jp   [hl]
    ld   c, c
    ld   a, a
    sbc  a, l
    add  hl, bc

label_227C2::
    ld   c, c
    ld   a, a
    sbc  a, l
    ld   a, [bc]
    ret  z
    ld   a, a
    nop
    sbc  a, d
    inc  d
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, d
    inc  [hl]
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h

label_227E2::
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, d
    ld   d, h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, d
    ld   [hl], h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h

label_22805::
    sbc  a, d
    sub  a, h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h

label_22812::
    ld   a, h
    ld   a, h
    sbc  a, d
    or   h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, d
    call nc, label_2C0B
    dec  l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hli]
    dec  hl
    sbc  a, d
    db   $F4 ; Undefined instruction
    dec  bc
    ld   a, a
    dec  a
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    db   $3A ; ldd  a, [hl]
    ld   a, a
    sbc  a, e
    inc  d
    dec  bc
    ld   a, a
    ld   a, a
    inc  l
    dec  l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hli]
    dec  hl
    ld   a, a
    ld   a, a
    sbc  a, e
    inc  [hl]
    dec  bc
    ld   a, a
    ld   a, a
    ld   a, a
    dec  a
    ld   a, $3F
    ld   a, $3F
    db   $3A ; ldd  a, [hl]
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    inc  d
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h

label_22868::
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, b
    inc  [hl]
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, b
    ld   d, h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, b
    ld   [hl], h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, b

label_2289C::
    sub  a, h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, b
    or   h
    dec  bc
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, b
    call nc, label_2C0B
    dec  l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hli]
    dec  hl
    sbc  a, b
    db   $F4 ; Undefined instruction
    dec  bc
    ld   a, a
    dec  a
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    db   $3A ; ldd  a, [hl]
    ld   a, a
    sbc  a, c
    inc  d
    dec  bc
    ld   a, a
    ld   a, a
    inc  l
    dec  l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hli]
    dec  hl
    ld   a, a
    ld   a, a
    sbc  a, c
    inc  [hl]
    dec  bc
    ld   a, a
    ld   a, a
    ld   a, a
    dec  a
    ld   a, $3F
    ld   a, $3F
    db   $3A ; ldd  a, [hl]
    ld   a, a
    ld   a, a
    ld   a, a
    nop
    sbc  a, h
    nop
    ld   e, a
    ld   a, [hl]
    sbc  a, h
    jr   nz, label_2295C
    ld   a, [hl]
    sbc  a, h
    ld   b, b
    ld   e, a
    ld   a, [hl]
    sbc  a, h
    ld   h, b
    ld   e, a
    ld   a, [hl]
    sbc  a, h
    add  a, b
    ld   e, a
    ld   a, [hl]
    sbc  a, h
    and  b
    ld   e, a
    ld   a, [hl]
    sbc  a, h
    ret  nz
    ld   e, a
    ld   a, [hl]
    sbc  a, h
    ld   [$FF5F], a
    ld   a, [hl]
    sbc  a, l
    nop
    ld   e, a
    ld   a, [hl]
    sbc  a, l
    jr   nz, label_2297C
    ld   a, [hl]
    sbc  a, l
    ld   b, b
    ld   e, a
    ld   a, [hl]
    sbc  a, l
    ld   h, b
    ld   e, a
    ld   a, [hl]
    sbc  a, l
    add  a, b
    ld   e, a
    ld   a, [hl]
    sbc  a, l
    and  b
    ld   e, a
    ld   a, [hl]
    sbc  a, l
    ret  nz
    ld   e, a
    ld   a, [hl]
    sbc  a, l
    ld   [$FF5F], a
    ld   a, [hl]
    sbc  a, [hl]
    nop
    ld   e, a
    ld   a, [hl]
    sbc  a, [hl]
    jr   nz, label_2299C
    ld   a, [hl]
    sbc  a, [hl]
    ld   b, b
    ld   e, a
    ld   a, [hl]
    sbc  a, [hl]
    ld   h, b
    ld   e, a
    ld   a, [hl]
    sbc  a, [hl]
    add  a, b
    ld   e, a
    ld   a, [hl]
    sbc  a, [hl]
    and  b
    ld   e, a
    ld   a, [hl]
    sbc  a, [hl]
    ret  nz
    ld   e, a
    ld   a, [hl]
    sbc  a, [hl]
    ld   [$FF5F], a
    ld   a, [hl]
    sbc  a, a
    nop
    ld   e, a
    ld   a, [hl]
    sbc  a, a
    jr   nz, label_229BC
    ld   a, [hl]
    sbc  a, a
    ld   b, b
    ld   e, a
    ld   a, [hl]
    sbc  a, a
    ld   h, b
    ld   e, a
    ld   a, [hl]
    sbc  a, a
    add  a, b
    ld   e, a
    ld   a, [hl]
    sbc  a, a
    and  b
    ld   e, a
    ld   a, [hl]
    sbc  a, a
    ret  nz
    ld   e, a
    ld   a, [hl]
    sbc  a, a
    ld   [$FF5F], a
    ld   a, [hl]
    sbc  a, h
    xor  c
    ld   b, c
    ld   a, a
    sbc  a, h
    ret  z

label_2297C::
    ld   b, e
    ld   a, a
    sbc  a, h
    rst  $20
    ld   b, l
    ld   a, a
    sbc  a, l
    rlca
    ld   b, l
    ld   a, a
    sbc  a, l
    jr   z, label_229CC
    ld   a, a
    sbc  a, l
    ld   c, c
    ld   b, c
    ld   a, a
    nop
    sbc  a, b
    ld   h, l
    ld   c, e
    ld   a, a
    sbc  a, b
    add  a, e
    ld   c, l
    ld   a, a
    sbc  a, b
    and  e
    ld   c, l
    ld   a, a
    sbc  a, b

label_2299C::
    jp   label_23F4D
    sbc  a, b
    db   $E3 ; Undefined instruction
    ld   c, l
    ld   a, a
    sbc  a, c
    inc  bc
    ld   c, l
    ld   a, a
    sbc  a, c
    inc  hl
    ld   c, l
    ld   a, a
    sbc  a, c
    ld   b, e
    ld   c, l
    ld   a, a
    sbc  a, c
    ld   h, e
    ld   c, l
    ld   a, a
    sbc  a, c
    add  a, e
    ld   c, l
    ld   a, a
    sbc  a, c
    and  e
    ld   c, l
    ld   a, a
    sbc  a, c

label_229BC::
    jp   label_23F4D
    sbc  a, b
    ld   b, d
    rrca
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    sbc  a, b
    sbc  a, c
    sbc  a, b
    sbc  a, c
    sbc  a, b

label_229CC::
    sbc  a, c
    sbc  a, b
    sbc  a, c
    sbc  a, b
    sbc  a, c
    and  h
    sbc  a, b
    ld   h, d
    ld   [bc], a
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    add  a, d
    adc  a, e
    sbc  a, [hl]
    sbc  a, h
    sbc  a, [hl]
    sbc  a, h
    sbc  a, [hl]
    sbc  a, h
    sbc  a, [hl]
    sbc  a, h
    sbc  a, [hl]
    sbc  a, h
    sbc  a, [hl]
    and  l
    sbc  a, c
    db   $E3 ; Undefined instruction
    ld   c, $9A
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    and  [hl]
    sbc  a, b
    ld   [hl], c
    adc  a, e
    sbc  a, l
    sbc  a, a
    sbc  a, l
    sbc  a, a
    sbc  a, l
    sbc  a, a
    sbc  a, l
    sbc  a, a
    sbc  a, l
    sbc  a, a
    sbc  a, l
    sbc  a, a
    sbc  a, d
    inc  bc
    ld   c, $A7
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    sbc  a, b
    add  a, [hl]
    ld   b, a
    and  d
    sbc  a, b
    and  l
    add  hl, bc
    and  b
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    and  c
    sbc  a, b
    push bc
    add  hl, bc
    and  b
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    and  c
    sbc  a, b
    and  $47
    and  e
    sbc  a, c
    dec  b
    ld   a, [bc]
    xor  c
    xor  d
    xor  e
    xor  h
    xor  l
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    sbc  a, c
    ld   b, l
    rlca
    xor  c
    xor  d
    xor  e
    xor  h
    xor  l
    or   [hl]
    or   a
    cp   b
    sbc  a, c
    add  a, l
    dec  b
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    sbc  a, c
    and  l
    ld   a, [bc]
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_AAA9
    set  1, h
    call label_9800
    and  l
    ld   c, e
    ld   a, a
    sbc  a, b
    jp   label_23F4D
    sbc  a, b
    db   $E3 ; Undefined instruction
    ld   c, l
    ld   a, a
    sbc  a, c
    inc  bc
    ld   c, l
    ld   a, a
    sbc  a, c
    inc  hl
    ld   c, l
    ld   a, a
    sbc  a, c
    ld   b, e
    ld   c, l
    ld   a, a
    sbc  a, b
    add  a, d
    rrca
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    sbc  a, b
    sbc  a, c
    sbc  a, b
    sbc  a, c
    sbc  a, b
    sbc  a, c
    sbc  a, b
    sbc  a, c
    sbc  a, b
    sbc  a, c
    and  h
    sbc  a, b
    and  d
    ld   [bc], a
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    jp   nz, label_9E84
    sbc  a, h
    sbc  a, [hl]
    sbc  a, h
    sbc  a, [hl]
    sbc  a, b
    or   c
    add  a, l
    sbc  a, l
    sbc  a, a
    sbc  a, l
    sbc  a, a
    sbc  a, l
    sbc  a, a
    sbc  a, c
    ld   h, d
    rrca
    and  l
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    sbc  a, d
    sbc  a, e
    and  [hl]
    sbc  a, c
    add  a, d
    rrca
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    xor  b
    and  a
    sbc  a, b
    push hl
    add  hl, bc
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    ret  nz
    pop  bc
    jp   nz, label_C4C3
    sbc  a, c
    dec  h
    rlca
    xor  c
    xor  d
    xor  e
    xor  h
    xor  l
    or   [hl]
    or   a
    cp   b
    nop
    sbc  a, b
    nop
    ld   e, a
    ld   a, a
    sbc  a, b
    jr   nz, label_22B54
    ld   a, a
    sbc  a, b
    ld   b, b
    ld   e, a
    ld   a, a
    sbc  a, b
    ld   h, b
    ld   e, a
    ld   a, a
    sbc  a, b
    add  a, b

label_22B00::
    rra
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    sbc  a, b
    and  b
    rra
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    sbc  a, b
    ret  nz
    rra
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b

label_22B54::
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    sbc  a, b
    ld   [$FF5F], a
    ld   a, h
    sbc  a, c
    nop
    ld   e, a
    ld   a, h
    sbc  a, c
    jr   nz, label_22BD1
    ld   a, h
    sbc  a, c
    ld   b, b
    rra
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sbc  a, c
    ld   h, b
    rra
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, c
    add  a, b
    rra
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h

label_22BD1::
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    sbc  a, c
    and  b
    rra
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, c
    ret  nz
    rra
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    sbc  a, c
    ld   [$FF5F], a
    ld   a, a
    sbc  a, d
    nop
    ld   e, a
    ld   a, a
    sbc  a, d
    jr   nz, label_22C8C
    ld   a, a
    sbc  a, d
    ld   b, b
    ld   e, a
    ld   a, a
    sbc  a, d
    ld   h, b
    ld   e, a
    ld   a, a
    nop
    sbc  a, b
    nop
    ld   e, a
    ld   a, a
    sbc  a, b
    jr   nz, label_22C9D
    ld   a, a
    sbc  a, b
    ld   b, b
    ld   e, a
    ld   a, a
    sbc  a, b
    ld   h, b
    ld   e, a
    ld   a, a
    sbc  a, b
    add  a, b
    rra
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    sbc  a, b
    and  b
    rra
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    add  a, h
    add  a, l
    add  a, [hl]

label_22C8C::
    add  a, a
    sbc  a, b
    ret  nz
    rra
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b

label_22C9D::
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    sbc  a, b
    ld   [$FF5F], a
    ld   a, l
    sbc  a, c
    nop
    ld   e, a
    ld   a, l
    sbc  a, c
    jr   nz, label_22D1A
    ld   a, l
    sbc  a, c
    ld   b, b
    rra
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sbc  a, c
    ld   h, b
    rra
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, c
    add  a, b
    rra
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h

label_22D1A::
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    sbc  a, c
    and  b
    rra
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, c
    ret  nz
    rra
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    ld   a, a
    ld   a, a
    sbc  a, h
    sbc  a, l
    sbc  a, c

label_22D6C::
    ld   [$FF5F], a
    ld   a, a
    sbc  a, d
    nop
    ld   e, a
    ld   a, a
    sbc  a, d
    jr   nz, label_22DD5
    ld   a, a
    sbc  a, d
    ld   b, b
    ld   e, a
    ld   a, a
    sbc  a, d
    ld   h, b
    ld   e, a
    ld   a, a
    nop
    sbc  a, b
    nop
    ld   e, a
    ld   a, a
    sbc  a, b
    jr   nz, label_22DE6
    ld   a, a
    sbc  a, b
    ld   b, b
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    and  b
    and  c
    and  d
    and  e
    and  h
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    ld   h, b
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    daa
    jr   z, label_22DE1
    ld   a, [hli]
    or   e
    or   h
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    add  a, b
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_22DD5::
    ld   a, a
    ld   a, a
    ld   a, a
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_22DE1::
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_22DE6::
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    and  b
    rra
    ld   a, a
    ld   a, a
    sbc  a, [hl]
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    or   b
    or   c
    or   d
    xor  d
    xor  e
    ld   a, a
    xor  h
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    ret  nz
    rra
    ld   a, a
    ld   a, a
    sbc  a, a
    xor  l
    ld   a, a
    ld   a, a
    or   a
    and  c
    and  d
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    ret  nz
    pop  bc
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    ld   [$FF1F], a
    ld   a, a
    ld   a, a
    xor  [hl]
    xor  a
    or   l
    jp   nz, label_B1C3
    or   d
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_CCCB
    call label_23F7F
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    nop
    rra
    ld   a, a
    ld   a, a
    adc  a, $CF
    cp   b
    ret  nc
    pop  de
    and  d
    and  e
    jp   nc, label_D4D3
    push de
    sub  a, $D7
    ret  c
    reti
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    jr   nz, label_22E9F
    ld   a, a
    ld   a, a
    ld   a, a
    call c, label_DEDD
    call nz, label_B326
    rst  $18
    ld   [$FFE1], a
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_22E9F::
    ld   a, a
    sbc  a, c
    ld   b, b
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$DAEB], a
    ld   a, a
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    ld   h, b
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    or   b
    or   c
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$F9
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction
    cp   $FF
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    add  a, b
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    and  b
    and  c
    and  d
    and  e
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    and  b
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    or   b
    or   c
    or   d
    or   e
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    ret  nz
    rra
    ld   a, a
    ld   a, a
    and  b
    and  c
    and  d
    and  e
    and  h
    ld   a, a
    ld   a, a
    ld   a, a
    inc  d
    dec  d
    ld   d, $17
    jr   label_22F58
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    ld   [$FF1F], a
    ld   a, a
    ld   a, a
    or   b
    or   c
    or   d
    or   e

label_22F58::
    or   h
    ld   a, a
    ld   a, a
    db   $DB
    and  $E7
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, d
    nop
    ld   e, a
    ld   a, a
    sbc  a, d
    jr   nz, label_22FD8
    ld   a, a
    sbc  a, d
    ld   b, b
    ld   e, a
    ld   a, a
    sbc  a, d
    ld   h, b
    ld   e, a
    ld   a, a
    sbc  a, e
    and  b
    ld   e, a
    ld   a, a
    sbc  a, e
    ret  nz
    ld   e, a
    ld   a, a
    nop
    sbc  a, b
    nop
    rra
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   b, h
    ld   b, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    sbc  a, b
    jr   nz, label_22FD0
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l

label_22FD0::
    ld   a, l
    sbc  a, b
    ld   b, b
    rra
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h

label_22FD8::
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    sbc  a, b
    ld   h, b
    rra
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    sbc  a, b
    add  a, b
    ld   e, a
    ld   a, l
    sbc  a, b
    and  b
    ld   e, a
    ld   a, l
    sbc  a, b
    ret  nz
    ld   e, a
    ld   a, l
    sbc  a, b
    ld   [$FF5F], a
    ld   a, l
    sbc  a, c
    nop
    rra
    jr   c, label_23065
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_23069
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_2306D
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_23071
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_23075
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_23079
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_2307D
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_23081
    db   $3A ; ldd  a, [hl]
    dec  sp
    sbc  a, c
    jr   nz, label_2306C
    inc  a
    dec  a
    ld   a, $3F
    inc  a
    dec  a
    ld   a, $3F
    inc  a
    dec  a
    ld   a, $3F
    inc  a
    dec  a
    ld   a, $3F
    inc  a
    dec  a
    ld   a, $3F
    inc  a
    dec  a
    ld   a, $3F

label_23065::
    inc  a
    dec  a
    ld   a, $3F

label_23069::
    inc  a
    dec  a
    ld   a, $3F

label_2306D::
    sbc  a, c
    ld   b, b
    rra
    ld   h, b

label_23071::
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, b

label_23075::
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, b

label_23079::
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, b

label_2307D::
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, b

label_23081::
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    sbc  a, c
    ld   h, b
    rra
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    sbc  a, c
    add  a, b
    ld   e, a
    ld   a, [hl]
    sbc  a, c
    and  b
    ld   e, a
    ld   a, [hl]
    sbc  a, c
    ret  nz
    ld   e, a
    ld   h, h
    sbc  a, c
    ld   [$FF1F], a
    jr   nc, label_230F5
    ldd  [hl], a
    inc  sp
    jr   nc, label_230F9
    ldd  [hl], a
    inc  sp
    jr   nc, label_230FD
    ldd  [hl], a
    inc  sp
    jr   nc, label_23101
    ldd  [hl], a
    inc  sp
    jr   nc, label_23105
    ldd  [hl], a
    inc  sp
    jr   nc, label_23109
    ldd  [hl], a
    inc  sp
    jr   nc, label_2310D
    ldd  [hl], a
    inc  sp
    jr   nc, label_23111
    ldd  [hl], a
    inc  sp
    sbc  a, d
    nop
    rra
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    inc  [hl]
    dec  [hl]
    ld   [hl], $37

label_230F5::
    inc  [hl]
    dec  [hl]
    ld   [hl], $37

label_230F9::
    inc  [hl]
    dec  [hl]
    ld   [hl], $37

label_230FD::
    inc  [hl]
    dec  [hl]
    ld   [hl], $37

label_23101::
    inc  [hl]
    dec  [hl]
    ld   [hl], $37

label_23105::
    sbc  a, d
    jr   nz, label_23167
    ld   a, h

label_23109::
    nop
    sbc  a, b
    nop
    ld   d, e

label_2310D::
    ld   a, [hl]
    sbc  a, b
    jr   nz, label_23164

label_23111::
    ld   a, [hl]
    sbc  a, b
    ld   b, b
    inc  de
    ld   a, [hl]
    ld   a, [hl]
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, b
    ld   h, b
    inc  de
    ld   a, [hl]
    ld   a, [hl]
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, h
    sbc  a, l
    sbc  a, [hl]
    sbc  a, a
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, b
    add  a, b
    inc  de
    ld   a, [hl]
    ld   a, [hl]
    and  b
    and  c
    and  d
    and  e
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d
    xor  e
    xor  h
    xor  l
    xor  [hl]
    xor  a
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, b
    and  b
    inc  de
    ld   a, [hl]
    ld   a, [hl]
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   a

label_23164::
    cp   b
    cp   c
    cp   d

label_23167::
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, b
    ret  nz

label_23170::
    inc  de
    ld   a, [hl]
    ld   a, [hl]
    ret  nz
    pop  bc
    jp   nz, label_C4C3
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_CCCB
    call label_CFCE
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, b
    ld   [rNR13], a
    ld   a, [hl]
    ld   a, [hl]
    ret  nc
    pop  de
    jp   nc, label_D4D3
    push de
    sub  a, $D7
    ret  c
    reti
    jp  c, label_DCDB
    db   $DE
    sbc  a, $DF
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, c
    nop
    inc  de
    ld   a, [hl]
    ld   a, [hl]
    ld   [$FFE1], a
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, c
    jr   nz, label_231C9
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], l
    ld   a, [hl]
    ld   a, b
    ld   [hl], a
    ld   [hl], l
    ld   a, b
    ld   a, c
    dec  hl
    inc  l
    ld   a, c
    ld   a, c
    ld   [hl], a
    ld   [hl], l
    ld   a, b
    ld   [hl], a
    ld   [hl], l
    ld   a, [hl]

label_231C9::
    ld   a, [hl]
    sbc  a, c
    ld   b, b
    inc  de
    ld   [hl], a
    ld   a, b
    ld   a, h
    ld   a, c
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   [hl], a
    ld   a, b
    sbc  a, c
    ld   h, b
    inc  de
    ld   a, h
    ld   a, h
    ld   a, h
    ld   [hl], e
    ld   [hl], h
    db   $76 ; Halt
    ld   [hl], e
    ld   a, d
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   a, d
    ld   [hl], h
    db   $76 ; Halt
    ld   [hl], e
    ld   [hl], h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, c
    add  a, b
    inc  de
    ld   a, h
    ld   a, h
    ld   [hl], e
    ld   [hl], l
    ld   a, b
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   a, c
    ld   a, c
    ld   [hl], a
    ld   [hl], l
    ld   a, [hl]
    ld   [hl], h
    ld   a, h
    ld   a, h
    sbc  a, c
    and  b
    inc  de
    ld   a, h
    ld   a, h
    ld   [hl], a
    ld   a, d
    ld   a, d
    ld   [hl], h
    ld   [hl], e
    ld   [hl], h
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   [hl], e
    ld   [hl], h
    ld   [hl], e
    ld   a, d
    ld   a, [hl]
    ld   a, b
    ld   a, h
    ld   a, h
    sbc  a, c
    ret  nz
    inc  de
    ld   a, h
    ld   a, h
    ld   a, h
    ld   [hl], a
    ld   [hl], l
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], l
    ld   a, b
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, c
    ld   [rNR13], a
    ld   a, h
    ld   a, h
    ld   a, h
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, d
    nop
    inc  de
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   b, h
    ld   b, l
    ld   a, l
    dec  l
    ld   l, $2D
    ld   l, $2D
    ld   l, $7D
    ld   c, h
    ld   c, l
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    sbc  a, d
    jr   nz, label_23281
    ld   a, h
    ld   a, h
    ld   b, h
    ld   b, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   c, h
    ld   c, l
    ld   a, h

label_23281::
    ld   a, h
    nop
    sbc  a, b
    nop
    inc  de
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    sbc  a, b
    jr   nz, label_232B0
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a

label_232B0::
    inc  de
    sbc  a, b
    ld   b, b
    inc  de
    ld   [bc], a
    inc  bc
    inc  b
    dec  b
    ld   b, $07
    ld   b, $07
    rlca
    ld   b, $06
    rlca
    ld   b, $07
    rlca
    rlca
    ld   b, $08
    nop
    ld   bc, label_22098
    inc  de
    ld   [de], a
    inc  de
    add  hl, bc
    ld   a, [bc]
    dec  bc
    inc  d
    inc  c
    dec  c
    ld   c, $0F
    dec  bc
    dec  d
    inc  d
    dec  d
    dec  bc
    inc  d
    ld   d, $17
    db   $10 ; Undefined instruction
    sbc  a, b
    add  a, b
    inc  de
    nop
    inc  bc
    jr   label_232FF
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    jr   nz, label_2330F
    ldi  [hl], a
    ld   e, $20
    ldi  [hl], a
    inc  h
    dec  h
    nop
    inc  bc
    sbc  a, b
    and  b
    inc  de
    db   $10 ; Undefined instruction
    ld   h, $27
    jr   z, label_23328

label_232FF::
    ld   a, [hli]
    dec  hl
    inc  l
    ldi  [hl], a
    ld   hl, label_2137
    ldi  [hl], a
    rra
    jr   nz, label_2334C
    dec  l
    db   $10 ; Undefined instruction
    sbc  a, b
    ret  nz

label_2330F::
    inc  de
    ld   [bc], a
    inc  bc
    jr   label_23342
    cpl
    jr   nc, label_23359
    dec  e
    ld   b, b
    ld   hl, label_221F
    jr   nz, label_2333D
    scf
    ld   hl, label_3140
    nop
    ld   bc, $E098
    inc  de
    ld   [de], a

label_23328::
    inc  de
    ldd  [hl], a
    inc  sp
    inc  [hl]
    ld   b, d
    dec  [hl]
    ld   [hl], $1D
    ldi  [hl], a
    jr   nz, label_23352
    add  hl, sp
    scf
    jr   c, label_23370
    ld   b, d
    dec  l
    db   $10 ; Undefined instruction
    sbc  a, c
    nop

label_2333D::
    inc  de
    nop
    inc  bc
    db   $3A ; ldd  a, [hl]
    dec  sp

label_23342::
    dec  hl
    inc  l
    inc  a
    dec  e
    dec  a
    ld   a, $3F
    ld   b, d
    ld   b, b
    ld   b, b

label_2334C::
    ld   b, b
    ld   b, b
    inc  a
    ld   sp, label_300

label_23352::
    sbc  a, c
    jr   nz, label_23368
    db   $10 ; Undefined instruction
    jr   label_2339A

label_23359::
    ld   b, d
    inc  a
    dec  e
    ld   b, d
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, b
    ld   b, d
    ld   b, b
    ld   b, d
    dec  e
    ld   b, [hl]
    ld   sp, label_1310
    sbc  a, c
    ld   b, b
    inc  de
    ld   [bc], a
    inc  bc
    jr   label_233B7

label_23370::
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, e
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, h
    ld   c, l
    ld   c, [hl]
    inc  a
    ld   c, a
    ld   d, b
    dec  l
    nop
    ld   bc, label_22099
    inc  de
    ld   [de], a
    inc  de
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   d, [hl]
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    dec  l
    db   $10 ; Undefined instruction
    sbc  a, c
    add  a, b
    inc  de

label_2339A::
    ld   [bc], a
    inc  bc
    ld   e, [hl]
    ld   e, a
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, e
    ld   h, h
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   sp, label_300
    sbc  a, c
    and  b
    inc  de
    db   $10 ; Undefined instruction
    jr   label_23420
    ld   l, h
    ld   l, l

label_233B7::
    ld   [hl], b
    ld   l, [hl]
    ld   l, a
    ld   [hl], b
    ld   l, [hl]
    ld   l, a
    ld   [hl], c
    ld   [hl], d
    ld   b, d
    ld   [hl], e
    ld   d, b
    dec  l
    db   $10 ; Undefined instruction
    sbc  a, c
    ret  nz
    inc  de
    ld   [bc], a
    inc  bc
    ld   h, $41
    ld   b, d
    dec  e
    inc  a
    dec  e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    dec  e
    ld   b, b
    dec  e
    dec  [hl]
    ld   [hl], $77
    ld   a, b
    nop
    ld   bc, $E099
    inc  de
    ld   [de], a
    inc  de
    ld   a, c
    db   $10 ; Undefined instruction
    ld   a, d
    ld   a, e
    ld   a, d
    ld   a, h
    ld   a, l
    inc  hl
    ld   a, d
    ld   a, e
    ld   a, e
    ld   a, d
    ld   a, d
    ld   a, a
    inc  de
    db   $10 ; Undefined instruction
    sbc  a, d
    nop
    inc  de
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    nop
    ld   bc, label_302
    sbc  a, d
    jr   nz, label_23420
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a

label_23420::
    inc  de
    nop
    sbc  a, b
    nop
    ld   d, e
    dec  b
    sbc  a, b
    jr   nz, label_2347C
    dec  b
    sbc  a, b
    ld   b, b
    ld   d, e
    dec  b
    sbc  a, b
    ld   h, b
    ld   d, e
    dec  b
    sbc  a, b
    add  a, b
    ld   d, e
    dec  b
    sbc  a, b
    and  b
    ld   d, e
    dec  b
    sbc  a, b
    ret  nz
    ld   d, e
    dec  b
    sbc  a, b
    ld   [rHDMA3], a
    dec  b
    sbc  a, c
    nop
    ld   d, e
    dec  b
    sbc  a, c
    jr   nz, label_2349C
    dec  b
    sbc  a, c
    ld   b, b
    ld   d, e
    dec  b
    sbc  a, c
    ld   h, b
    ld   d, e
    dec  b
    sbc  a, c
    add  a, b
    ld   d, e
    dec  b
    sbc  a, c
    and  b
    ld   d, e
    dec  b
    sbc  a, c
    ret  nz
    ld   d, e
    dec  b
    sbc  a, c
    ld   [rHDMA3], a
    dec  b
    sbc  a, d
    nop
    ld   d, e
    dec  b
    sbc  a, d
    jr   nz, label_234BC
    dec  b
    sbc  a, b
    nop
    ld   d, e
    dec  b
    sbc  a, b
    jr   nz, label_234C4
    dec  b
    sbc  a, b
    ld   b, b
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, e
    ld   a, h

label_2347C::
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, [hl]
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, b
    ld   h, b
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   a, a
    dec  b

label_2349C::
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, b
    add  a, b
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  d
    dec  d
    ld   d, $17
    ld   a, a
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, b
    and  b
    inc  de
    dec  b
    dec  b

label_234BC::
    dec  b
    dec  b
    dec  b
    ld   a, a
    jr   nz, label_234E3
    ldi  [hl], a
    inc  hl

label_234C4::
    inc  h
    dec  h
    ld   h, $27
    ld   a, a
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, b
    ret  nz
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    jr   nc, label_2350A
    ldd  [hl], a
    inc  sp
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    ld   a, a
    dec  b
    dec  b
    dec  b

label_234E3::
    dec  b
    dec  b
    sbc  a, b
    ld   [rNR13], a
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   a, a
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, c
    nop
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h

label_2350A::
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   a, a
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, c
    jr   nz, label_23529
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   a, a
    dec  b
    dec  b
    dec  b
    dec  b

label_23529::
    dec  b
    sbc  a, c
    ld   b, b
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, a
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, c
    ld   h, b
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    ld   a, a
    ld   l, b
    dec  b
    dec  b
    dec  b
    dec  b
    sbc  a, c
    add  a, b
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, a
    jr   label_2357C
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    ld   a, a
    ld   a, b
    ld   a, c
    dec  b
    dec  b
    dec  b
    sbc  a, c
    and  b
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   a, l
    ld   a, $4D
    ld   c, [hl]
    ld   e, b

label_2357C::
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    dec  b
    dec  b
    dec  b
    sbc  a, c
    ret  nz
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    jr   z, label_235BE
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $2F
    dec  b
    dec  b
    sbc  a, c
    ld   [rNR13], a
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    jr   c, label_235E5
    db   $3A ; ldd  a, [hl]
    dec  sp

label_235AE::
    inc  a
    dec  a
    dec  a
    ccf
    dec  b
    dec  b
    sbc  a, d
    nop
    inc  de
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b

label_235BE::
    dec  b
    dec  b
    dec  b
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, e
    ld   c, h
    dec  a
    dec  a
    ld   c, a
    dec  b
    dec  b
    sbc  a, d
    jr   nz, label_235E1
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    dec  b

label_235E1::
    dec  b
    nop
    sbc  a, b
    nop

label_235E5::
    ld   d, e
    ld   a, h
    sbc  a, b
    jr   nz, label_2363D
    ld   a, h
    sbc  a, b
    ld   b, b
    ld   d, e
    ld   a, h
    sbc  a, b
    ld   h, b
    inc  de
    ld   b, $07
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   [$9809], sp
    add  a, b
    inc  de
    ld   a, a
    ld   d, $7C
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    rla
    ld   a, a
    sbc  a, b
    and  b
    inc  de
    ld   a, a
    ld   a, a
    ld   b, $07
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   [label_609], sp
    rlca
    ld   [label_23F09], sp
    ld   a, a
    sbc  a, b
    ret  nz
    inc  de
    dec  c
    ld   c, $0F
    jr   nz, label_236B8
    ld   a, h

label_2363D::
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    rla
    ld   a, a
    ld   a, a
    ld   d, $0A
    dec  bc
    inc  c
    dec  c
    sbc  a, b
    ld   [rNR13], a
    dec  e
    ld   e, $1F
    jr   nc, label_23659
    rlca
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   [label_23F09], sp
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    sbc  a, c
    nop
    inc  de
    inc  h
    dec  h
    ld   h, $27
    ld   a, a
    ld   d, $7C
    ld   a, h
    ld   a, h
    ld   a, h
    rla
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   hl, label_2322
    inc  h
    sbc  a, c
    jr   nz, label_2368F
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    ld   d, b
    ld   d, c
    ld   d, b
    ld   d, c
    ld   d, b
    ld   d, c
    ld   d, b
    ld   d, c
    ld   d, b
    ld   d, c
    ld   d, b
    ld   d, c
    ld   sp, label_3332

label_2368F::
    inc  [hl]
    sbc  a, c
    ld   b, b
    inc  de
    dec  hl
    inc  l
    dec  l
    ld   l, $52
    ld   d, e
    ld   d, d
    ld   d, e
    ld   d, d
    ld   d, e
    ld   d, d
    ld   d, e
    ld   d, d
    ld   d, e
    ld   d, d
    ld   d, e
    jr   z, label_236CE
    ld   a, [hli]
    dec  hl
    sbc  a, c
    ld   h, b
    inc  de
    dec  sp
    inc  a
    ld   d, h
    ld   d, l
    ld   d, h
    ld   d, l
    ld   d, h
    ld   d, l
    ld   d, h
    ld   d, l
    ld   d, h
    ld   d, l
    ld   d, h
    ld   d, l

label_236B8::
    ld   d, h
    ld   d, l
    ld   d, h
    ld   d, l
    db   $3A ; ldd  a, [hl]
    dec  sp
    sbc  a, c
    add  a, b
    inc  de
    ld   a, $3F
    ld   d, [hl]
    ld   d, a
    ld   d, [hl]
    ld   d, a
    ld   d, [hl]
    ld   d, a
    ld   d, [hl]
    ld   d, a
    ld   d, [hl]
    ld   d, a
    ld   d, [hl]

label_236CE::
    ld   d, a
    ld   d, [hl]
    ld   d, a
    ld   d, [hl]
    ld   d, a
    dec  a
    ld   a, $99
    and  b
    inc  de
    ld   a, $3F
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    dec  a
    ld   a, $99
    ret  nz
    inc  de
    ld   a, $3F
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  b
    dec  b
    db   $10 ; Undefined instruction
    dec  a
    ld   a, $99
    ld   [rNR13], a
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    inc  b
    dec  b
    ld   [bc], a
    jr   label_23728
    jr   c, label_2374A
    ld   c, [hl]
    ld   c, a
    inc  bc
    inc  d
    dec  d
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    sbc  a, d
    nop
    inc  de
    ld   c, d
    ld   c, e
    ld   c, h
    ld   c, l
    inc  d
    dec  d
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a

label_23728::
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d
    sbc  a, d
    jr   nz, label_23747
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   [de], a

label_23747::
    inc  de
    sbc  a, d
    ld   b, b

label_2374A::
    ld   d, e
    ld   a, h
    sbc  a, d
    ld   h, b
    ld   d, e
    ld   a, h
    sbc  a, d
    add  a, b
    ld   d, e
    ld   a, h
    sbc  a, d
    and  b
    ld   d, e
    ld   a, h
    sbc  a, d
    ret  nz
    ld   d, e
    ld   a, h
    sbc  a, d
    ld   [rHDMA3], a
    ld   a, h
    sbc  a, e
    nop
    ld   d, e
    ld   a, h
    sbc  a, e
    jr   nz, label_237BA
    ld   a, h
    sbc  a, e
    ld   b, b
    ld   d, e
    ld   a, h
    sbc  a, e
    ld   h, b
    ld   d, e
    ld   a, h
    sbc  a, e
    add  a, b
    ld   d, e
    ld   a, h
    sbc  a, e
    and  b
    ld   d, e
    ld   a, h
    sbc  a, e
    ret  nz
    ld   d, e
    ld   a, h
    sbc  a, e
    ld   [rHDMA3], a
    ld   a, h
    nop
    sbc  a, b
    nop
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    inc  b
    dec  b
    ld   b, $07
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    jr   nz, label_237AE
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    jr   nc, label_23824
    ld   a, a
    ld   b, b
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_237AE::
    ld   a, a
    sbc  a, b
    ld   b, b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    nop
    ld   bc, label_302
    inc  bc
    ld   bc, label_201
    ld   [label_23F09], sp
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    ld   h, b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  d
    dec  d
    ld   d, $17
    jr   label_237F1
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    add  a, b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    jr   nz, label_23808
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_23818
    ld   a, a
    ld   a, a

label_237F1::
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    and  b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    db   $10 ; Undefined instruction
    ldd  [hl], a
    inc  sp
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    jr   c, label_2383F
    ld   a, a
    ld   a, a

label_23808::
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    ret  nz
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    jr   nz, label_23856
    ld   b, d
    ld   b, e
    ld   b, h

label_23818::
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    ld   c, c
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, b
    ld   [rNR13], a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   e, c
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    nop
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a

label_2383F::
    ld   a, a
    ld   a, a
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   b, l
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    jr   nz, label_23866
    ld   a, a
    ld   a, a
    ld   a, a

label_23856::
    ld   a, a
    ld   a, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], l
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_23866::
    ld   a, a
    sbc  a, c
    ld   b, b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, [bc]
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    ld   [hl], a
    ld   c, e
    ld   c, h
    ld   c, l
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    ld   h, b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    add  a, b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $2F
    ld   l, d
    ld   l, e
    dec  de
    ld   l, l
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    and  b
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    dec  a
    ld   a, $3F
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    ret  nz
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   l, [hl]
    ld   c, d
    ld   h, h
    ld   h, h
    ld   l, h
    ld   h, h
    ld   c, d
    ld   c, d
    ld   l, h
    ld   c, d
    ld   h, h
    ld   l, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, c
    ld   [rNR13], a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    inc  b
    dec  b
    ld   a, a
    ld   c, [hl]
    ld   c, a
    ld   a, a
    ld   b, $07
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, d
    nop
    inc  de
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    jr   nc, label_2397B
    ld   a, a
    ld   c, [hl]
    ld   c, a
    ld   a, a
    ld   a, a
    ld   b, b
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, d
    jr   nz, label_2391E
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   b, b
    ld   a, a
    ld   a, a
    ld   e, [hl]
    ld   e, a
    ld   a, a
    ld   a, a
    jr   nc, label_23999
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a

label_2391E::
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_2397B::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23999::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23A01::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23C01::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23D7C::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23E09::
    nop
    nop
    nop
    nop

label_23E0D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23F09::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23F42::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23F4D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_23F7F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
