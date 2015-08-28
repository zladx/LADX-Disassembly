section "bank3",romx,bank[$03]

label_C000::
    ld   b, d
    jp   nz, label_C2D2

label_C004::
    jp   nz, label_C2D2
    jp   nz, label_12C3
    ld   b, d
    ld   [de], a
    ld   b, d
    ld   [de], a
    ld   [de], a
    sub  a, d
    ld   [de], a
    jr   label_C025
    ld   de, label_212
    ld   [bc], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [de], a
    ld   de, label_1202
    ld   [de], a
    ld   [de], a
    ld   [bc], a
    ld   b, d
    sub  a, d
    ld   [de], a

label_C025::
    ldh  [$FF0C], a
    ldh  [$FF0C], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [bc], a
    ld   b, c
    ld   [de], a
    or   c
    or   c
    or   c
    or   c
    or   c
    or   d
    or   d
    or   c
    or   d
    or   d
    or   d
    or   c
    sub  a, d
    or   d
    or   c
    or   d
    or   c
    add  a, d
    sub  a, d

label_C040::
    add  a, h
    sub  a, d
    add  a, d
    ret  nz
    ret  nz
    jp   nz, label_8282
    add  a, d
    add  a, d
    db   $F2 ; Undefined instruction
    add  a, d
    ld   b, c
    add  a, d
    add  a, d
    add  a, d
    ld   [de], a
    ld   [bc], a
    ld   b, d
    ld   b, d
    jp   nz, label_202
    ld   [bc], a
    ld   b, d
    ld   [$0048], sp
    sub  a, c
    ld   [bc], a
    nop
    nop
    ld   [bc], a
    jp   nz, label_208
    ret  nz
    nop
    add  a, d
    ld   [bc], a
    ret  nz
    jp   nz, label_8292
    sub  a, d
    ld   [de], a
    pop  bc
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, e
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    ld   d, d
    sub  a, d
    nop
    ld   b, d
    ld   [bc], a
    add  a, d
    sub  a, d
    nop
    ld   b, d
    jp   nz, label_D2D1
    pop  de
    ld   [de], a
    add  a, h
    inc  c
    jp   nz, label_92C2
    sub  a, d
    ld   [label_1212], sp
    inc  de
    inc  d
    ld   [de], a
    add  a, b
    sub  a, d
    sub  a, d
    ret  nz
    jp   nc, label_C012
    jp   nc, label_9412
    ret  nz
    ld   [de], a
    ld   [de], a
    ld   [de], a
    inc  d
    call nz, label_C4C4
    jp   nz, label_D28A
    ld   [bc], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    sub  a, d
    ld   [de], a
    or   d
    ld   [bc], a
    add  a, d
    ret  nz
    add  a, d
    sub  a, d
    add  a, d
    sub  a, d
    sub  a, h
    sub  a, l
    ld   [de], a
    inc  de
    ld   [de], a
    ld   [de], a
    inc  de
    ld   d, $52
    ret  nz
    jp   nc, label_94D2
    sbc  a, b
    ld   [de], a
    ld   [de], a
    ret  nc
    jp   nc, label_88C1
    ld   [bc], a
    ld   d, d
    add  a, l
    add  a, h
    jp   nz, label_8282
    add  a, d
    jp   nc, label_D2D2
    add  a, d
    ld   [bc], a
    jp   nz, label_C2C8
    ld   c, b
    call nz, label_C2C2
    jp   nz, label_D2D3
    ld   b, d
    ld   [de], a
    inc  de
    jp   nc, label_C050
    nop
    inc  de
    inc  de
    inc  de
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    add  a, d
    add  a, d
    add  a, d
    sub  a, h
    sub  a, h
    inc  c
    jp   nz, label_8282
    ld   b, $0C
    add  a, e

label_C0FB::
    nop
    nop
    ld   bc, $0101
    nop
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [$0100], sp
    nop
    nop
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    add  a, d
    nop
    nop
    add  a, b
    nop
    add  a, b
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    ld   bc, label_1D1D
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    nop
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, b
    sbc  a, b

label_C147::
    nop
    sbc  a, b
    sbc  a, b
    sbc  a, b
    nop
    nop
    nop
    nop
    add  a, b
    nop
    nop
    nop
    nop
    adc  a, b
    ld   [$8000], sp
    add  a, b
    add  a, b
    xor  b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    nop
    add  a, b
    sbc  a, b
    nop
    add  a, b
    nop
    nop
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    add  a, b
    sbc  a, b
    nop
    sbc  a, b
    ld   [$0010], sp
    add  a, b
    sbc  a, b
    nop
    jr   nz, label_C17F

label_C17F::
    nop
    nop
    jr   c, label_C183

label_C183::
    adc  a, b
    ld   [label_404], sp
    add  a, h
    add  a, h
    adc  a, b
    nop
    nop
    nop
    add  a, b
    nop

label_C18F::
    nop
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    and  h
    nop
    nop
    nop
    nop
    nop
    inc  l
    inc  l
    inc  l
    jr   nc, label_C147
    add  a, b
    nop
    nop
    nop
    nop
    add  a, b
    nop
    dec  e
    nop
    sbc  a, b
    nop
    sbc  a, b
    sbc  a, b
    or   h
    sbc  a, b
    sbc  a, b
    sbc  a, b
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    nop
    jr   label_C1D6
    or   h
    or   h
    ld   b, $00
    inc  [hl]
    sbc  a, b
    nop
    add  a, b
    nop
    nop
    sbc  a, b
    sbc  a, b
    nop
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    nop
    jr   label_C18F
    add  a, b
    dec  l
    dec  l
    nop

label_C1D6::
    ld   a, [bc]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, h
    jr   c, label_C1E2

label_C1E2::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$0000], sp
    nop
    ld   [$9808], sp

label_C1F6::
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  c
    ld   bc, $010D
    ld   bc, label_1308
    inc  de
    inc  de
    nop
    ld   bc, label_2C06
    inc  l
    inc  c
    nop
    ld   a, [hli]
    nop
    nop
    nop
    ld   a, [hli]
    cpl
    dec  bc
    inc  c
    ld   c, $01
    ld   bc, label_606
    add  hl, bc
    inc  b
    ld   bc, label_E00
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, $00
    nop
    nop
    jr   nz, label_C25B
    nop
    nop
    nop
    dec  bc
    dec  bc
    jr   nc, label_C25D
    jr   label_C26E
    ld   a, [de]
    add  hl, de
    inc  e
    db   $10 ; Undefined instruction
    ld   [de], a
    nop
    rra
    ld   e, $00

label_C25B::
    dec  de
    ldi  [hl], a

label_C25D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C26E::
    nop
    nop
    ld   hl, label_2900
    nop
    add  hl, hl
    nop
    nop
    inc  de
    nop
    nop
    nop
    nop
    nop
    inc  de
    dec  d
    inc  d
    ld   bc, $0101
    ld   bc, label_2413
    dec  l
    ld   l, $13
    dec  h
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    dec  hl
    nop
    nop
    nop
    inc  de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_C2C8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   z, label_C2DA

label_C2DA::
    inc  de
    nop
    ld   h, $00
    nop
    ld   sp, label_3131
    nop
    nop
    nop
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    dec  hl
    nop
    inc  d
    nop
    ldi  [hl], a
    ldi  [hl], a
    inc  sp
    inc  d
    nop

label_C2F1::
    ld   [de], a
    ld   [de], a
    ld   a, [bc]
    ld   [de], a
    ld   [de], a
    ld   a, [bc]
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [label_812], sp
    ld   [de], a
    ld   [label_C000], sp
    ld   de, label_1111
    nop
    ld   [label_1212], sp
    ld   [de], a
    ld   [label_811], sp
    ld   [label_1008], sp
    ld   [label_808], sp
    ld   [label_812], sp
    ld   [label_808], sp
    ld   d, d
    ld   [label_A08], sp
    ld   [de], a
    ld   [label_A0A], sp
    inc  de
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   [label_A0A], sp
    ld   [label_A0A], sp
    dec  de
    ld   a, [de]
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   b, d
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   b, d
    ld   [bc], a
    ld   [de], a
    nop
    ld   [bc], a
    ld   [bc], a
    jr   nc, label_C34B
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [label_808], sp
    ld   [de], a
    ret  nc

label_C34B::
    sub  a, b
    sub  a, b
    ret  nc
    sub  a, b
    call nc, label_D484
    ld   [bc], a
    ret  nc
    sub  a, b
    ld   [bc], a
    add  a, b
    ld   [bc], a
    ld   b, d
    ld   [de], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_C36D

label_C36D::
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   b, b
    nop
    add  a, h
    ld   b, b
    nop
    nop
    nop
    ld   [bc], a
    add  a, h
    call nz, label_94
    nop
    nop
    nop
    add  a, h
    nop
    nop
    nop
    call nz, label_10
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    ld   b, d
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   b, d
    ld   b, d
    nop
    db   $10 ; Undefined instruction
    ld   [$0018], sp
    inc  de
    nop
    ld   [de], a
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $8400
    ld   de, $0084
    nop
    inc  bc
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
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    inc  bc
    ld   [bc], a
    ld   b, d
    ld   b, d
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    ld   [bc], a
    nop
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
    inc  b
    inc  b
    sub  a, h
    ld   b, d
    nop
    nop
    sub  a, h
    sub  a, b
    ld   [de], a

label_C3EC::
    ld   bc, $0101
    nop
    nop
    ld   bc, $0102
    ld   [bc], a
    inc  bc
    inc  bc
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, label_203
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   [bc], a
    ld   bc, $0102
    ld   bc, label_203
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    nop
    nop
    nop
    ld   bc, $0100
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    inc  bc
    nop
    nop
    nop
    ld   bc, $0100
    nop
    nop
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
    ld   [bc], a
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
    nop
    nop
    ld   bc, $0103
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
    inc  bc
    ld   bc, label_402
    nop
    nop
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
    nop
    nop
    nop
    nop
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
    ld   bc, $0103
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0103
    nop
    nop
    nop
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
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_201
    ld   bc, label_202
    ld   [bc], a
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
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  b
    nop
    ld   bc, $0002
    nop
    nop
    nop
    ld   bc, label_202
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  b
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
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
    nop
    nop
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
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0101
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
    ld   bc, $0101
    ld   bc, $0001
    nop
    ld   [bc], a
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   [bc], a
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0001
    nop
    ld   [bc], a
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
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   [bc], a
    ld   bc, $0002
    ld   bc, $0002
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   [bc], a
    ld   bc, $0002
    ld   bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0102
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0000
    nop
    ld   bc, $0002
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   [bc], a
    ld   bc, $0002
    ld   bc, $0002
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   [bc], a
    ld   bc, $0002
    ld   bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   [bc], a
    nop
    nop
    dec  b
    ld   [bc], a
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
    nop
    nop
    nop
    dec  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   [bc], a
    ld   bc, $0004
    ld   bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    inc  b
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_402
    nop
    inc  bc
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0001
    inc  bc
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $00
    ld   b, $06
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $00
    nop
    nop
    nop
    nop
    nop

label_C73C::
    nop
    ld   bc, label_C002
    nop
    nop
    rst  $38
    nop
    nop
    ld   [bc], a
    ld   bc, $0040
    nop
    rst  $38
    nop
    nop
    inc  b
    ld   [bc], a
    ld   b, b
    nop
    nop
    rst  $38
    nop
    nop
    ld   [label_C004], sp
    nop
    nop
    rst  $38
    nop
    nop
    db   $10 ; Undefined instruction
    ld   b, b
    nop
    nop
    rst  $38
    nop
    nop
    ld   bc, label_C004
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38
    ld   [bc], a
    ld   b, b
    nop
    nop
    rst  $38
    nop
    nop
    ld   bc, label_C004
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38

label_C77E::
    jr   label_C77E
    ld   [bc], a
    db   $FD ; Undefined instruction
    rst  $38
    nop
    nop
    rst  $38
    db   $FD ; Undefined instruction
    cp   $00
    nop
    ld   [bc], a
    nop
    nop
    ld   bc, $FE04
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38
    ld   [bc], a
    ld   b, b
    nop
    nop
    rst  $38
    nop
    nop
    ld   bc, label_C002
    nop
    nop
    rst  $38
    nop
    nop
    ld   bc, label_C002
    nop
    nop
    rst  $38
    nop
    nop
    ld   bc, label_C002
    nop
    nop
    rst  $38
    nop
    nop
    ld   bc, label_C002
    nop
    nop
    rst  $38
    nop

label_C7BC::
    ld   bc, label_202
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  c
    ccf
    ld   [label_808], sp
    inc  c
    nop
    nop
    inc  b
    ld   b, $08
    ld   a, [bc]
    inc  b
    inc  d
    ld   a, [bc]
    jr   label_C7E1
    ld   [bc], a
    ld   [label_208], sp

label_C7E1::
    inc  b
    rst  $38
    nop
    ld   [bc], a
    inc  b
    ld   [bc], a
    inc  bc
    ld   bc, label_801
    ld   b, $02
    ld   a, [bc]
    ld   bc, label_808

label_C7F1::
    inc  b
    inc  b
    ld   [label_1808], sp
    ld   [label_804], sp
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_804], sp
    ld   [label_808], sp
    ld   [label_808], sp
    inc  c
    nop
    nop
    ld   [label_808], sp
    inc  c
    inc  c
    inc  d
    db   $10 ; Undefined instruction
    ld   [label_408], sp
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    inc  d
    ld   [label_804], sp
    inc  b
    inc  b
    ld   [label_408], sp
    inc  b
    inc  b
    ld   [label_208], sp
    ld   b, $01
    inc  bc
    inc  bc
    inc  bc
    dec  c
    ld   [label_20A], sp
    rlca
    dec  bc
    nop
    inc  b
    nop
    ld   [label_E04], sp
    ld   c, $0E
    ld   c, $0E
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   b, $06
    dec  c
    ld   c, $00
    add  hl, bc
    inc  bc
    ld   b, $00
    ld   [bc], a
    ld   c, $0E

label_C85B::
    call label_3A0A
    ld   a, [$FFF6]
    ld   hl, $C3E0
    add  hl, bc
    ld   [hl], a
    ld   hl, $C460
    add  hl, bc
    ld   [hl], $FF

label_C86B::
    ld   hl, $C3A0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_C000
    add  hl, de
    ld   a, [hl]
    ld   hl, $C340
    add  hl, bc
    ld   [hl], a
    ld   hl, label_C0FB
    add  hl, de
    ld   a, [hl]
    ld   hl, $C350
    add  hl, bc
    ld   [hl], a
    call label_C895
    ld   hl, label_C2F1
    add  hl, de
    ld   a, [hl]
    ld   hl, $C430
    add  hl, bc
    ld   [hl], a
    jp   label_3AEA

label_C895::
    push de
    ld   hl, label_C1F6
    add  hl, de
    ld   e, [hl]
    ld   hl, $C4D0
    add  hl, bc
    ld   [hl], e
    ld   d, b
    ld   hl, label_C7BC
    add  hl, de
    ld   a, [hl]
    ld   hl, $C360
    add  hl, bc
    ld   [hl], a
    pop  de
    ret

label_C8AD::
    ld   a, $01
    ld   [$C18F], a
    jp   label_3F8D
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_C918
    ld   a, [$FFF8]
    and  $30
    jr   z, label_C8C7
    jp   label_3F8D

label_C8C7::
    ld   a, [$FFEB]
    cp   $5F
    jr   nz, label_C8F0
    ld   a, [$FFF6]
    cp   $95
    jr   z, label_C8F0
    cp   $92
    jr   z, label_C8F0
    cp   $84
    jr   z, label_C8E2
    ld   a, [$D984]
    and  $30
    jr   z, label_C8AD

label_C8E2::
    ld   a, [$D992]
    and  $30
    jr   z, label_C8AD
    ld   a, [$D995]
    and  $30
    jr   z, label_C8AD

label_C8F0::
    ld   a, [$DBA5]
    and  a
    jr   z, label_C908
    ld   a, [$D478]
    and  a
    jr   nz, label_C90B
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $04
    jr   z, label_C908
    ld   [$C1CF], a

label_C908::
    call label_27F2

label_C90B::
    xor  a
    ld   [$C1BD], a
    inc  a
    ld   [$C1BE], a
    ld   a, $20
    ld   [$C165], a

label_C918::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    ld   a, $03
    call label_9D3
    jp   [hl]

label_C924::
    ld   bc, label_2104
    ld   h, b
    call nz, label_DE09
    ld   d, b
    ld   hl, label_C924
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $03
    ld   [hl], a
    ret
    call label_C00
    ld   [hl], $30
    ret
    ld   a, [$FFF6]
    cp   $65
    ret  nz
    ld   a, [$FFEC]
    cp   $50
    ret  c
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ret
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $02
    ret
    ld   hl, $DB74
    ld   a, [$DB73]
    or   [hl]
    jp   nz, label_3F8D
    ret
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $10
    call label_280D
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], a
    ret
    call label_CF83
    ld   a, $02
    jp   label_3B0C
    ld   a, $33
    jr   label_C995
    ld   a, [$DB15]
    cp   $06
    jr   c, label_C993
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $58
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $03

label_C993::
    ld   a, $40

label_C995::
    ld   e, a
    ld   a, [$DB4E]
    and  a
    ret  z
    ld   a, e

label_C99C::
    ld   [$D368], a
    ld   [$FFB0], a
    ld   [$FFBD], a
    ld   [$FFBF], a
    ret
    xor  a
    ld   [$D219], a
    jp   label_27F2
    ld   a, $24
    jr   label_C99C
    ld   a, $3A
    jr   label_C99C
    xor  a
    ld   [$C168], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $04
    ld   [hl], a
    ret
    call label_280D
    jp   label_3B0C
    call label_BFB
    call label_280D
    and  $3F
    add  a, $10
    ld   [hl], a
    ret
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $0A
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ret
    xor  a
    ld   [$FFB0], a
    ret
    call label_CA12
    ld   a, [$FFEE]
    swap a
    and  $01
    add  a, $04
    jp   label_3B0C
    ld   a, [$FFEE]
    swap a
    and  $01
    ld   e, a
    ld   a, [$FFEF]
    swap a
    inc  a
    rla
    and  $02
    or   e
    call label_3B0C
    cp   $01
    jr   nz, label_CA12
    ld   a, [$DB4B]
    and  a
    jp   nz, label_3F8D

label_CA12::
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $13
    ret
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $02
    call label_3B12
    call label_C05
    ld   [hl], $20
    ret
    ld   a, [$FFF6]
    cp   $D9
    ld   a, $32
    jr   nz, label_CA32
    ld   a, $37

label_CA32::
    jr   label_CA4F
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $10
    ld   a, [$DBA5]
    and  a
    jr   z, label_CA46
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_CA4D

label_CA46::
    ld   a, [$C5A9]
    and  a
    jp   nz, label_3F8D

label_CA4D::
    ld   a, $0C

label_CA4F::
    call label_C995
    ld   de, $C220
    ld   hl, $C200
    jp   label_CF92
    ld   a, [$FFF6]
    cp   $E2
    jr   nz, label_CA6B
    ld   a, [$DB56]
    cp   $80
    jr   z, label_CA72
    jp   label_3F8D

label_CA6B::
    ld   a, [$DB56]
    and  a
    jp   nz, label_3F8D

label_CA72::
    ret
    ld   a, [$FFF8]
    rra
    jr   label_CA7A
    ld   a, [$FFF8]

label_CA7A::
    and  $10
    jp   nz, label_3F8D
    ret
    ld   a, [$FFF6]
    cp   $C0
    jr   c, label_CAA3
    ld   a, [$DB74]
    and  a
    jp   z, label_3F8D
    ld   a, [$DB73]
    and  a
    jp   nz, label_3F8D
    inc  a
    ld   [$C3C8], a
    ld   a, $2F
    ld   [$FFB1], a
    ld   [$FFB0], a
    ld   [$FFBD], a
    call label_27EA

label_CAA3::
    ld   a, [$0003]
    and  a
    jp   z, label_CB2F
    ld   a, [$DB4F]
    and  a
    jr   nz, label_CB2F
    ld   a, [$DB50]
    and  a
    jr   nz, label_CABF
    ld   [$DB96], a
    ld   a, $01
    ld   [$DB95], a
    ret

label_CABF::
    ld   hl, $C3A0
    add  hl, bc
    ld   [hl], $6B
    ret

label_CAC6::
    rst  $38
    ld   a, a
    cp   [hl]
    rrca
    inc  de
    ld   [bc], a
    nop
    nop
    ld   a, [$FFFE]
    and  a
    jr   z, label_CB2F
    ld   a, [$DBA5]
    and  a
    jr   z, label_CB2F
    ld   a, [$DB73]
    and  a
    jr   nz, label_CB2F
    ld   a, [$DB67]
    and  $02
    jr   nz, label_CB2F
    ld   a, [$DB0E]
    cp   $04
    jr   nc, label_CB2F
    ld   a, [$DB48]
    and  a
    jr   z, label_CB2F
    cp   $01
    jr   z, label_CB2F
    ld   a, $02
    ld   [rSVBK], a
    ld   hl, $DC88
    ld   de, label_CAC6

label_CB01::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_CB01
    xor  a
    ld   [rSVBK], a
    jr   label_CB2F
    ld   a, [$DB56]
    cp   $80
    jr   nz, label_CB1A
    ld   a, $0E
    ld   [$D368], a

label_CB1A::
    ret
    ld   a, [$DBA5]
    and  a
    jr   nz, label_CB2F
    ld   a, [$D477]
    and  a
    ret  nz
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [hl], a
    ret

label_CB2F::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $03
    ld   a, [$DB44]
    and  a
    jr   nz, label_CB40
    ld   a, $1C
    call label_C99C

label_CB40::
    jr   label_CB48
    ret
    ld   a, $07
    call label_C995

label_CB48::
    ld   a, $01
    jr   label_CB51
    call label_280D
    and  $03

label_CB51::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_CB56::
    ret
    ld   a, $03
    ld   [rIE], a
    ret
    ld   a, $FF
    jp   label_3B0C
    ld   a, [$DBA5]
    and  a
    jr   z, label_CB56
    ld   a, [$FFF6]
    cp   $DA
    jr   nz, label_CB56
    ld   a, [$DB0E]
    cp   $0E
    jp   nz, label_3F8D
    ld   a, [$DC0D]
    and  $01
    jr   z, label_CB56
    ld   a, $03
    jp   label_3B0C
    xor  a
    jr   label_CB51

label_CB84::
    ld   hl, $DDE0
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    ret
    call label_CB84
    and  $10
    jr   nz, label_CBAD
    xor  a
    jp   label_3B0C
    call label_CB84
    and  $10
    jr   nz, label_CBAD
    ld   a, $04
    jp   label_3B0C
    call label_CB84
    and  $10
    jr   z, label_CBB3

label_CBAD::
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $80

label_CBB3::
    ld   a, $08
    jp   label_3B0C
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $03
    jr   label_CBC2
    ld   a, $04

label_CBC2::
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $10
    jp   label_3B0C
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $10
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [hl], a
    jp   label_CB56
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $50
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $00
    jp   label_CB56
    ld   a, [$FFFE]
    and  a
    jp   z, label_CB56
    call label_CB84
    and  $10
    jp   z, label_CB56
    ld   hl, $C200
    add  hl, bc
    ld   a, $3C
    jr   label_CC15
    ld   a, [$FFFE]
    and  a
    jp   z, label_CB56
    call label_CB84
    and  $10
    jp   z, label_CB56
    ld   hl, $C200
    add  hl, bc
    ld   a, $63

label_CC15::
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $04
    jp   label_CB56
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $02
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $04
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $0C
    xor  a
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    jp   label_CB56

label_CC44::
    inc  [hl]
    ld   [bc], a
    inc  [hl]
    ldi  [hl], a
    inc  [hl]
    inc  d
    inc  [hl]
    inc  [hl]
    call label_C05
    jr   z, label_CC77
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$FFF1], a
    ld   de, label_CC44
    call label_3BC0
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    call label_3A81
    call label_FF7E
    call label_FFA9
    call label_E0B3
    call label_3D7F
    ret

label_CC77::
    ld   a, [$FFEB]
    cp   $1F
    jr   nz, label_CC8C
    ld   hl, $C3A0
    add  hl, bc
    ld   [hl], $1E
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    jp   label_C86B

label_CC8C::
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $1F
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $04
    ld   hl, $FFF4
    ld   [hl], $13
    ret

label_CCA4::
    nop
    nop
    inc  b
    nop

label_CCA8::
    nop
    ld   bc, label_603

label_CCAC::
    inc  h
    ld   bc, $0124
    ld   a, $01

label_CCB2::
    ld   e, $01
    ld   e, $61
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_CCDC
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    cp   $E9
    jr   z, label_CCCD
    cp   $EA
    jr   z, label_CCCD
    cp   $EB
    jr   nz, label_CCDC

label_CCCD::
    ld   hl, $C280
    add  hl, bc
    ld   a, $05
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   a, $06
    ld   [hl], a
    ret

label_CCDC::
    call label_C05
    jr   nz, label_CD07
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $02
    jr   nz, label_CCEF
    ld   hl, $D460
    ld   [hl], $01

label_CCEF::
    ld   a, [$FFEB]
    cp   $A8
    jr   nz, label_CD04
    ld   a, $16
    ld   [$DB6F], a
    ld   a, $50
    ld   [$DB70], a
    ld   a, $27
    ld   [$DB71], a

label_CD04::
    jp   label_3F8D

label_CD07::
    cp   $40
    jr   c, label_CD29
    ld   a, [$FFEB]
    cp   $09
    jr   z, label_CD19
    cp   $0B
    jr   z, label_CD19
    cp   $14
    jr   nz, label_CD22

label_CD19::
    call label_D8FC
    call label_D8FC
    call label_D8FC

label_CD22::
    call label_3A81
    call label_FF7E
    ret

label_CD29::
    rra
    rra
    rra
    rra
    and  $03
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ld   [$FFF1], a
    ld   e, a
    ld   d, b
    ld   hl, label_CCA4
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, e
    cp   $03
    jr   nz, label_CD51
    xor  a
    ld   [$FFF1], a
    ld   de, label_CCB2
    call label_3BC0
    jr   label_CD57

label_CD51::
    ld   de, label_CCAC
    call label_3C77

label_CD57::
    call label_FF7E
    call label_C05
    cp   $3F
    jr   nz, label_CD66
    ld   hl, $FFF2
    ld   [hl], $18

label_CD66::
    rra
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_CCA8
    add  hl, de
    ld   e, [hl]
    ld   a, [$FF98]
    push af
    ld   hl, $C4B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF98], a
    ld   a, [$FF99]
    push af
    ld   hl, $C4C0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF99], a
    ld   a, e
    call label_FEC7
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_FF25
    call label_3A81
    call label_FF7E
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $02
    call label_E0B3
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b
    call label_E6FA
    call label_D438
    ld   a, [$FFEB]
    cp   $5C
    jr   nz, label_CDD2
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_CDD2
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $20
    ld   hl, $FFF3
    ld   [hl], $07
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $03
    jr   z, label_CDEF

label_CDD2::
    ld   a, $0B
    ld   [$C19E], a
    call label_F5A2
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    or   [hl]
    jr   nz, label_CE04
    call label_F267
    ld   a, [$FFEB]
    cp   $5C
    jr   nz, label_CE04

label_CDEF::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    call label_3B12
    ld   [hl], $01
    call label_C05
    ld   [hl], $80
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b

label_CE04::
    ret

label_CE05::
    db   $10 ; Undefined instruction
    call label_3A81
    call label_FF7E
    call label_FFA9
    call label_E0B3
    call label_3D7F
    call label_EE2B
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_CE28
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_CE35
    jr   label_CE72

label_CE28::
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_CE72
    ld   a, [$FFCC]
    and  $10
    jr   z, label_CE72

label_CE35::
    ld   a, [$C3CF]
    and  a
    jr   nz, label_CE72
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    push hl
    push af
    or   $80
    ld   [hl], a
    call label_EC72
    rl   e
    pop  af
    pop  hl
    ld   [hl], a
    rr   e
    jr   nc, label_CE72
    ld   a, $01
    ld   [$C3CF], a
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $07
    ld   a, $02
    ld   [$FFF3], a
    ld   hl, $C490
    add  hl, bc
    ld   [hl], b
    call label_C05
    ld   [hl], $02
    ld   a, [$FF9E]
    ld   [$C15D], a
    jp   label_D732

label_CE72::
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_CE85
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_CE85::
    cp   $38
    ret  nc
    srl  a
    srl  a
    and  $01
    ld   e, a
    ld   d, b
    ld   hl, label_CE05
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_FF32
    jp   label_3D7F

label_CEA0::
    inc  c
    inc  c
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction

label_CEA4::
    inc  c
    db   $F4 ; Undefined instruction
    inc  c
    db   $F4 ; Undefined instruction
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_CEA0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_CEA4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ret
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $04
    ld   a, $03
    jr   label_CED0
    ld   a, $FD

label_CED0::
    ld   hl, $C210
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ret
    call label_C05
    ld   [hl], $80
    ld   hl, $C3B0
    add  hl, bc
    dec  [hl]
    ret
    ld   a, [$FFEE]
    and  $10
    ld   a, $00
    jr   nz, label_CEEC
    ld   a, $03

label_CEEC::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    push hl
    call label_D8FC
    pop  hl
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    ret
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $02
    ld   a, [$FFF6]
    cp   $A4
    jr   z, label_CF0B
    cp   $D2
    jr   nz, label_CF0F

label_CF0B::
    dec  [hl]
    call label_CF83

label_CF0F::
    jp   label_CF24

label_CF12::
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $01
    ld   a, [$DBA5]
    and  a
    jr   z, label_CF24
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $02

label_CF24::
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    or   $11
    ld   [hl], a
    ret
    ld   a, [$FFF6]
    cp   $F8
    jr   nz, label_CF44
    ld   a, [$FFF8]
    bit  4, a
    jp   nz, label_3F8D
    bit  5, a
    jp   z, label_3F8D
    ld   a, $02
    jp   label_3B0C

label_CF44::
    cp   $7A
    jr   nz, label_CF54
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_3F8D
    ld   a, $04
    jp   label_3B0C

label_CF54::
    cp   $7C
    jr   nz, label_CF67
    ld   a, [$D969]
    and  $10
    jp   z, label_3F8D
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_3F8D

label_CF67::
    ret
    ld   a, [$DB0E]
    cp   $0E
    jr   z, label_CF83
    ret
    ld   a, [$DBA5]
    and  a
    ret  z
    call label_3B12
    jr   label_CF83
    call label_CF12
    ld   a, [$DBA5]
    and  a
    jr   nz, label_CFA9

label_CF83::
    ld   de, $C220
    ld   hl, $C200
    call label_CF92
    ld   de, $C230
    ld   hl, $C210

label_CF92::
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    rla
    ld   l, e
    ld   h, d
    add  hl, bc
    rra
    ld   a, [hl]
    adc  a, $00
    ld   [hl], a
    ret
    ld   de, $C220
    ld   hl, $C200
    jr   label_CF92

label_CFA9::
    call label_BFB
    ld   [hl], $80
    ret
    call label_C00
    ld   [hl], $A0
    ret
    ld   a, [$FFEB]
    cp   $12
    jr   nz, label_CFC8
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $10
    ret

label_CFC8::
    jp   label_3B12

label_CFCB::
    ld   h, b
    ld   [bc], a
    ld   h, d
    ld   [bc], a
    ld   h, d
    ldi  [hl], a
    ld   h, b
    ldi  [hl], a
    ld   h, h
    ld   [bc], a
    ld   h, [hl]
    ld   [bc], a
    ld   h, [hl]
    ldi  [hl], a
    ld   h, h
    ldi  [hl], a
    ld   l, b
    ld   [bc], a
    ld   l, d
    ld   [bc], a
    ld   l, h
    ld   [bc], a
    ld   l, [hl]
    ld   [bc], a
    ld   l, d
    ldi  [hl], a
    ld   l, b
    ldi  [hl], a
    ld   l, [hl]
    ldi  [hl], a
    ld   l, h
    ldi  [hl], a

label_CFEB::
    ld   [hl], b
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], b
    ldi  [hl], a

label_CFF3::
    inc  c
    db   $F4 ; Undefined instruction
    nop
    nop

label_CFF7::
    nop
    nop
    db   $F4 ; Undefined instruction
    inc  c
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D048
    ld   de, label_CFEB
    call label_3BC0
    call label_FF78
    call label_FFA9
    call label_EE28
    call label_FF25
    call label_F893
    call label_C05
    jr   nz, label_D03D
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_CFF3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_CFF7
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_D03D::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_D048::
    ld   de, label_CFCB
    call label_D83C
    ret

label_D04F::
    ld   h, d
    ld   [hl], b
    ld   h, e
    ld   [hl], c

label_D053::
    ld   h, d
    ld   [hl], b
    ld   h, d
    ld   [hl], b

label_D057::
    inc  bc
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    ld   bc, label_1432
    ld   h, h
    ret  z
    db   $F4 ; Undefined instruction
    ld   a, $2A
    ld   [$C111], a
    ld   a, $04
    ld   [$FFF4], a
    ld   de, label_D04F
    ld   a, [$FFFE]
    and  a
    jr   z, label_D081
    ld   de, label_D053

label_D081::
    ld   b, $A1
    call label_D1C9
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FC
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE8], a
    ld   d, b
    cp   $11
    jr   nz, label_D0AC
    push af
    ld   a, [$C501]
    ld   e, a
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $38
    pop  af

label_D0AC::
    ld   e, a
    cp   $21
    jp   nc, label_D12A
    cp   $20
    jr   nz, label_D0B9
    jp   label_E36D

label_D0B9::
    cp   $1B
    jr   c, label_D0D8
    cp   $20
    jr   nc, label_D0D8
    ld   hl, label_D04D
    add  hl, de
    ld   a, [hl]
    ld   [$DB90], a
    ld   hl, label_D048
    add  hl, de
    ld   a, [hl]
    ld   [$DB8F], a
    ld   a, $18
    ld   [$C3CE], a
    jr   label_D12A

label_D0D8::
    cp   $16
    jr   c, label_D0EF
    cp   $1B
    jr   nc, label_D0EF
    sub  a, $16
    ld   e, a
    ld   d, $00
    ld   hl, $DBCC
    add  hl, de
    inc  [hl]
    call label_2802
    jr   label_D12A

label_D0EF::
    cp   $0C
    jr   nc, label_D125
    ld   a, [$FFE8]
    cp   $01
    jr   nz, label_D0FD
    ld   hl, $DB44
    inc  [hl]

label_D0FD::
    cp   $00
    jr   nz, label_D10C
    ld   a, [$DB43]
    cp   $02
    jr   z, label_D10C
    ld   hl, $DB43
    inc  [hl]

label_D10C::
    ld   a, [$FFE8]
    cp   $0A
    jr   nz, label_D11A
    ld   hl, $DB4D
    ld   a, [hl]
    add  a, $01
    daa
    ld   [hl], a

label_D11A::
    ld   d, b
    ld   hl, label_D057
    add  hl, de
    ld   d, [hl]
    call label_E472
    jr   label_D12A

label_D125::
    ld   hl, $DB00
    add  hl, de
    inc  [hl]

label_D12A::
    call label_D134
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ld   [$FFF8], a
    ret

label_D134::
    ld   a, [$DBA5]
    ld   d, a
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_D14B
    ld   d, $00
    ld   hl, $DDE0
    jr   label_D154

label_D14B::
    cp   $1A
    jr   nc, label_D154
    cp   $06
    jr   c, label_D154
    inc  d

label_D154::
    add  hl, de
    ret

label_D156::
    ld   l, d
    ld   a, d
    ld   l, e
    ld   a, e

label_D15A::
    db   $10 ; Undefined instruction
    ld   de, $F813
    ld   sp, hl
    ld   a, [label_EFB]
    ld   e, $0F
    rra

label_D166::
    ld   l, b
    ld   [hl], a
    ld   l, c
    ld   c, e

label_D16A::
    halt
    halt
    call label_FEFE
    ld   d, $00
    ld   hl, label_D23D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_D241
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_D249
    call label_F893
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D198
    jp   label_3F8D

label_D198::
    ld   a, $11
    ld   [$FFF4], a
    ld   de, label_D166
    ld   b, $C6
    ld   a, [$FFF6]
    cp   $77
    jr   nz, label_D1B3
    ld   a, [$DDD9]
    cp   $80
    jr   z, label_D1B3
    ld   de, label_D16A
    ld   b, $03

label_D1B3::
    ld   a, [$DBA5]
    and  a
    jr   z, label_D1C9
    ld   de, label_D15A
    ld   b, $0D
    ld   a, [$FFF6]
    cp   $C7
    jr   nz, label_D1C9
    ld   de, label_D156
    ld   b, $BE

label_D1C9::
    push de
    ld   a, b
    push af
    ld   b, $00
    ld   a, [$FFEF]
    sub  a, $0F
    ld   [$FFCD], a
    ld   a, [$FFEE]
    sub  a, $07
    ld   [$FFCE], a
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFCD]
    and  $F0
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    add  hl, de
    pop  af
    ld   [hl], a
    ld   [$DDD8], a
    ld   a, $03
    call label_B2F

label_D1F5::
    call label_2887
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $0A
    ld   [$D600], a
    pop  de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_D234
    push bc
    ld   a, $03
    call label_91D
    pop  bc

label_D234::
    ret

label_D235::
    ld   l, [hl]
    rlca
    ld   l, [hl]
    daa
    ld    hl, sp+$17
    ld   a, [$F817]
    ld   [$0000], sp

label_D241::
    nop
    nop
    ld   [label_FEF8], sp
    rlca
    ld   a, [hl]
    daa

label_D249::
    ld   a, [$DBA5]
    ld   [$FFF1], a
    ld   de, label_D235
    and  a
    jr   nz, label_D25D
    ld   a, [$FFF6]
    cp   $77
    jr   nz, label_D25D
    ld   de, label_D245

label_D25D::
    call label_3BC0
    call label_FF78
    call label_FF25
    call label_D2D4
    call label_EC77
    jr   nc, label_D276
    call label_CBE
    ld   a, $03
    ld   [$C144], a

label_D276::
    ld   a, [$FFF6]
    cp   $C7
    jr   z, label_D282
    ld   a, [$DBA5]
    and  a
    jr   nz, label_D286

label_D282::
    ld   a, $02
    ld   [$FFA1], a

label_D286::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $21
    ret  nz
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a
    call label_F893
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    cp   $02
    ret  z
    call label_3F8D
    ld   de, label_D162
    ld   b, $C4
    ld   a, [$DBA5]
    and  a
    jr   z, label_D2B5
    ld   de, label_D15E
    ld   b, $A6

label_D2B5::
    call label_D1C9
    ld   a, [$C18E]
    and  $1F
    cp   $02
    jr   z, label_D2D1
    cp   $07
    ret  nz
    call label_F893
    ld   a, [$C503]
    cp   $A7
    jr   z, label_D2D1
    cp   $A6
    ret  nz

label_D2D1::
    jp   label_C60

label_D2D4::
    ld   e, $0F
    ld   d, b

label_D2D7::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   c, label_D31E
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $40
    jr   nz, label_D31E
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_D31E
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   hl, $C310
    add  hl, de
    sub  a, [hl]
    ld   hl, $FFEC
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_D31E
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $20
    jr   nz, label_D31E
    push bc
    ld   c, e
    ld   b, d
    push de
    ld   a, $08
    call label_EFCC
    pop  de
    pop  bc

label_D31E::
    dec  e
    ld   a, e
    cp   $FF
    jp   nz, label_D2D7
    ret
    ld   d, $03
    ld   a, c
    ld   [$C50C], a
    call label_C00
    ld   [$FFD7], a
    jp   z, label_D3A8
    cp   $01
    jr   nz, label_D395
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D369
    call label_280D
    and  $03
    jr   nz, label_D369
    ld   a, $2F
    call label_E4CA
    jr   c, label_D369
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C450
    add  hl, de
    ld   [hl], $80

label_D369::
    ld   a, [$FFF1]
    and  a
    jr   nz, label_D392
    ld   a, [$FFF7]
    cp   $1E
    jr   z, label_D378
    cp   $10
    jr   nz, label_D392

label_D378::
    ld   a, [$DB73]
    and  a
    jr   z, label_D392
    call label_280D
    and  $3F
    jr   nz, label_D38D
    ld   a, $28
    call label_2385
    jp   label_3F8D

label_D38D::
    ld   a, $99
    call label_2373

label_D392::
    jp   label_3F8D

label_D395::
    jp   label_3935

label_D398::
    ld   a, [$FF17]
    db   $F2 ; Undefined instruction
    rla
    db   $F4 ; Undefined instruction
    ld   d, $F6
    ld   d, $F0
    ld   d, $F2
    ld   d, $F4
    ld   d, $F6
    ld   d, $FA
    and  l
    db   $DB
    and  a
    jr   z, label_D3B3
    ld   de, label_D3A0
    jr   label_D3B6

label_D3B3::
    ld   de, label_D398

label_D3B6::
    call label_3BC0
    call label_FF78
    ld   a, $0B
    ld   [$C19E], a
    call label_F5A2
    call label_E0B3
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_D406
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D3E4
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D406
    call label_D438

label_D3E4::
    ld   hl, $FFF4
    ld   [hl], $05
    ld   e, $1F
    ld   a, [$FFF1]
    cp   $FF
    jr   z, label_D3F9
    cp   $01
    jr   z, label_D3F9
    ld   [hl], $09
    ld   e, $0F

label_D3F9::
    ld   hl, $C2F0
    add  hl, bc
    ld   [hl], e
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    add  a, $02
    ld   [hl], a

label_D406::
    ret
    ld   a, $05
    call label_E4CA
    ret  c
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $FFDA
    sub  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $00
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0F
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C4
    ld   a, $09
    ld   [$FFF4], a
    jp   label_3F8D

label_D438::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$C18E]
    and  $1F
    cp   $0D
    jr   nz, label_D467
    ld   a, [$C503]
    cp   $A0
    jr   z, label_D455
    ld   a, [$C50D]
    cp   $A0
    ret  nz

label_D455::
    ld   a, $30
    ld   [$FFCE], a
    ld   a, $20
    ld   [$FFCD], a
    ld   a, $19
    ld   [$FFDF], a
    call label_3E4D
    jp   label_C60

label_D467::
    cp   $0B
    ret  nz
    ld   a, [$C50D]
    cp   $35
    ret  c
    cp   $3D
    jr   c, label_D47D
    ld   a, [$C503]
    cp   $35
    ret  c
    cp   $3D
    ret  nc

label_D47D::
    jp   label_C60
    ldd  [hl], a
    ld   bc, label_E132

label_D484::
    jr   nc, label_D487
    jr   nc, label_D4E9

label_D488::
    nop
    nop
    inc  a
    ld   bc, label_800
    inc  a
    ld   hl, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    db   $3A ; ldd  a, [hl]
    ld   bc, label_800
    db   $3A ; ldd  a, [hl]
    ld   hl, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [label_3AFA]
    ld   bc, label_2FA
    db   $3A ; ldd  a, [hl]
    ld   hl, label_606
    db   $3A ; ldd  a, [hl]
    ld   bc, label_E06
    db   $3A ; ldd  a, [hl]
    ld   hl, $FC04
    jr   nc, label_D4BD
    inc  b

label_D4BD::
    inc  b
    jr   nc, label_D4E1
    db   $FC ; Undefined instruction
    inc  b
    jr   nc, label_D4C5
    db   $FC ; Undefined instruction

label_D4C5::
    inc  c
    jr   nc, label_D4E9

label_D4C8::
    nop
    nop
    db   $3A ; ldd  a, [hl]
    ld   bc, label_800
    db   $3A ; ldd  a, [hl]
    ld   hl, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$F8
    db   $3A ; ldd  a, [hl]
    ld   bc, $00F8
    db   $3A ; ldd  a, [hl]
    ld   hl, label_808
    db   $3A ; ldd  a, [hl]
    ld   bc, label_1008
    db   $3A ; ldd  a, [hl]
    ld   hl, $F808
    db   $3A ; ldd  a, [hl]
    ld   bc, $0008
    db   $3A ; ldd  a, [hl]
    ld   hl, label_8F8
    db   $3A ; ldd  a, [hl]
    ld   bc, label_10F8
    db   $3A ; ldd  a, [hl]
    ld   hl, $F8F8
    db   $10 ; Undefined instruction
    ld    hl, sp+$00
    ld   [de], a
    ld   [bc], a
    ld    hl, sp+$08
    ld   [de], a
    ldi  [hl], a
    ld    hl, sp+$10
    db   $10 ; Undefined instruction
    ld   [label_10F8], sp
    ld   b, d
    ld   [label_1200], sp
    ld   b, d
    ld   [label_1208], sp
    ld   h, d
    ld   [label_1010], sp
    ld   h, d
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_D524
    jp   label_3A8D

label_D524::
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   z, label_3F50
    push af
    ld   hl, $C4A0
    add  hl, bc
    ld   a, [hl]
    ld   hl, label_D488
    and  a
    jr   z, label_D53C
    ld   hl, label_D4C8

label_D53C::
    pop  af
    cp   $20
    jr   nc, label_D56F
    rla
    and  $30
    ld   e, a
    ld   d, b
    add  hl, de
    cp   $30
    jr   nz, label_D555
    push hl
    ld   hl, $C4A0
    add  hl, bc
    ld   a, [hl]
    pop  hl
    and  a
    jr   nz, label_D55C

label_D555::
    ld   c, $04
    call label_3CE6
    jr   label_D568

label_D55C::
    ld   c, $08
    call label_3CE6
    ld   a, $04
    call label_3DA0
    jr   label_D568

label_D568::
    call label_FF78
    call label_FFA9
    ret

label_D56F::
    call label_3A81
    call label_FF7E
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_D599
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $1F
    ld   a, [$DC0F]
    and  a
    jr   nz, label_D594
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_D594
    ld   a, $12
    ld   [$FFF3], a

label_D594::
    ld   hl, $FFF4
    ld   [hl], $13

label_D599::
    call label_FFA9

label_D59C::
    ret
    ld   l, $2E
    dec  l
    dec  l
    scf
    dec  l
    rst  $38
    rst  $38
    cpl
    scf
    jr   c, label_D5D7
    cpl

label_D5AA::
    cpl
    inc  bc
    ld   bc, $0001
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0000
    nop
    inc  bc

label_D5B8::
    nop
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    ld   bc, label_2E00
    dec  l
    jr   c, label_D5FA
    ld   l, $2D
    jr   c, label_D606
    ld   a, [$FFEB]
    cp   $23
    jr   nz, label_D5E2
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D5E2
    ld   a, $31
    jp   label_D670

label_D5E2::
    ld   hl, $C4E0
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    ret  z
    and  a
    jp   nz, label_D670
    ld   a, [$D471]
    inc  a
    ld   [$D471], a
    cp   $0C
    jr   c, label_D60F
    xor  a

label_D5FA::
    ld   [$D471], a
    ld   a, [$C1BE]
    ld   hl, $D47C
    or   [hl]
    ld   hl, $FFF9
    or   [hl]
    jr   nz, label_D60F
    ld   a, $34
    jp   label_D670

label_D60F::
    ld   hl, $C4D0
    add  hl, bc
    ld   d, b
    ld   e, [hl]
    ld   hl, label_C826
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    ld   e, a
    ld   d, $1E
    ld   a, [$DB5B]
    cp   $07
    jr   c, label_D62E
    ld   d, $23
    cp   $0B
    jr   c, label_D62E
    ld   d, $28

label_D62E::
    ld   hl, $D415
    inc  [hl]
    ld   a, [hl]
    cp   d
    jr   c, label_D648
    ld   [hl], b
    ld   a, [$C1BE]
    ld   hl, $FFF9
    or   [hl]
    ld   hl, $D47C
    or   [hl]
    jr   nz, label_D648
    ld   a, $33
    jr   label_D670

label_D648::
    ld   d, b
    ld   hl, label_D5AA
    ld   a, [$C163]
    and  a
    jr   z, label_D655
    ld   hl, label_D5B8

label_D655::
    add  hl, de
    call label_280D
    and  [hl]
    ret  nz
    ld   hl, label_D59C
    add  hl, de
    ld   a, [hl]
    cp   $FF
    jr   nz, label_D670
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_D5C7
    add  hl, de
    ld   a, [hl]

label_D670::
    call label_E4CA
    ret  c
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C450
    add  hl, de
    ld   [hl], $80
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $18
    ld   hl, $C480
    add  hl, de
    ld   [hl], $03
    ld   a, [$FFF9]
    and  a
    jr   nz, label_D6D9
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $30
    jr   nz, label_D6B8
    ld   a, [$FFEB]
    cp   $88
    jr   nz, label_D6B8
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $03

label_D6B8::
    cp   $3C
    jr   nz, label_D6D1
    ld   a, [$FFF6]
    cp   $58
    jr   z, label_D6C6
    cp   $5A
    jr   nz, label_D6D1

label_D6C6::
    push bc
    push de
    ld   c, e
    ld   b, d
    ld   a, $10
    call label_FEC7
    pop  de
    pop  bc

label_D6D1::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $18
    jr   label_D6DF

label_D6D9::
    ld   hl, $C250
    add  hl, de
    ld   [hl], $EC

label_D6DF::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ret

label_D6EA::
    ld   bc, label_808
    db   $10 ; Undefined instruction
    inc  b
    inc  b

label_D6F1::
    ld   a, [bc]
    scf
    scf
    scf
    ld   bc, label_3939
    add  hl, sp
    ld   bc, label_3B3B
    dec  sp
    ld   bc, label_3D3D
    dec  a

label_D701::
    ld   bc, label_1010
    ld   [$F000], sp
    ld   a, [$FFF8]
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38

label_D711::
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
    ld   [$0000], sp
    nop
    ld   [$000E], sp
    nop
    ld   [$000E], sp
    nop
    ld   [$000E], sp
    nop
    nop
    ld   c, $F0
    db   $EB ; Undefined instruction
    ld   [$C5A8], a
    cp   $02
    jr   nz, label_D745
    ld   hl, $C420
    add  hl, bc
    ld   [hl], b
    call label_E711
    jr   label_D748

label_D745::
    call label_3A81

label_D748::
    ld   hl, $C490
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    cp   $04
    jr   z, label_D789
    ld   a, [$C15D]
    ld   [$FF9E], a
    push hl
    call label_C05
    pop  hl
    and  a
    jr   nz, label_D789
    inc  [hl]
    ld   hl, label_D6EA
    ld   a, [$FFEB]
    cp   $02
    jr   z, label_D77F
    ld   a, [$DB43]
    cp   $02
    jr   nc, label_D77F
    ld   a, [$DC0F]
    and  $01
    jr   nz, label_D77F
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_D782

label_D77F::
    ld   hl, label_D6EE

label_D782::
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2E0
    add  hl, bc
    ld   [hl], a

label_D789::
    ld   a, e
    cp   $00
    jr   nz, label_D78F
    inc  e

label_D78F::
    call label_D795
    jp   label_D7E6

label_D795::
    ld   a, [$FF9E]
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_D6F1
    add  hl, de
    ld   a, [hl]
    ld   [$C15C], a
    ld   hl, label_D701
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF98
    add  a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_D711
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF99
    add  a, [hl]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFF9]
    and  a
    jr   z, label_D7D7
    push hl
    ld   hl, label_D721
    add  hl, de
    ld   e, [hl]
    pop  hl
    ld   a, [hl]
    sub  a, e
    ld   [hl], a
    ret

label_D7D7::
    ld   hl, label_D721
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFA2
    add  a, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ret

label_D7E6::
    jp   label_397B
    ld   de, label_D7FB
    ld   a, [$DB95]
    cp   $01
    jr   z, label_D7F7
    ld   a, $30
    ld   [$FFF5], a

label_D7F7::
    call label_D83C
    ret

label_D7FB::
    jr   nc, label_D7FF
    jr   nc, label_D821

label_D7FF::
    ldd  [hl], a
    ld   [bc], a
    ldd  [hl], a
    ldi  [hl], a
    jr   nc, label_D847
    jr   nc, label_D869
    ldd  [hl], a
    ld   b, d
    ldd  [hl], a
    ld   h, d
    inc  [hl]
    ld   [bc], a
    ld   [hl], $02
    jr   c, label_D813
    db   $3A ; ldd  a, [hl]
    ld   [bc], a

label_D813::
    ld   [hl], $22
    inc  [hl]
    ldi  [hl], a
    db   $3A ; ldd  a, [hl]
    ldi  [hl], a
    jr   c, label_D83D

label_D81B::
    ld   [$00F8], sp
    nop

label_D81F::
    nop
    nop

label_D821::
    ld    hl, sp+$08

label_D823::
    ld   b, $04
    ld   [bc], a
    nop
    ld   a, [$FFF7]
    cp   $15
    jr   nz, label_D835
    ld   a, [$DB56]
    cp   $80
    jp   nz, label_3F8D

label_D835::
    ld   a, c
    ld   [$D153], a
    ld   de, label_D917

label_D83C::
    call label_3BC0
    call label_FF78
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]

label_D847::
    and  a
    jr   z, label_D858
    ld   hl, $C290
    add  hl, bc
    ld   a, $01
    ld   [hl], a
    ld   [$FFF0], a
    call label_C05
    ld   [hl], $40

label_D858::
    call label_FFA9
    call label_EE28
    ld   a, [$FFF0]
    and  a
    jr   z, label_D8D7
    call label_C05
    jr   z, label_D896
    cp   $0A
    jr   nz, label_D889
    call label_C00
    jr   nz, label_D889
    call label_FEFE
    ld   hl, $C380
    add  hl, bc
    ld   a, e
    cp   [hl]
    jr   nz, label_D889
    ld   a, [$FFEB]
    cp   $24
    jr   z, label_D889
    cp   $09
    jr   z, label_D88D
    call label_D947

label_D889::
    call label_F893
    ret

label_D88D::
    ld   a, [$DB95]
    cp   $01
    ret  z
    jp   label_D998

label_D896::
    call label_280D
    and  $1F
    or   $20
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a
    cp   $00
    jr   nz, label_D8B6
    call label_FEFE
    jr   label_D8B9

label_D8B6::
    call label_280D

label_D8B9::
    and  $03
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, label_D81B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_D81F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ret

label_D8D7::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   nz, label_D8E5
    call label_C05
    jr   nz, label_D8F6

label_D8E5::
    call label_280D
    and  $0F
    or   $10
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01
    call label_3D7F

label_D8F6::
    call label_FF25
    call label_F893

label_D8FC::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_D823
    add  hl, de
    push hl
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    pop  hl
    and  $01
    or   [hl]
    jp   label_3B0C

label_D917::
    ld   h, b
    inc  bc
    ld   h, d
    inc  bc
    ld   h, d
    inc  hl
    ld   h, b
    inc  hl
    ld   h, h
    inc  bc

label_D921::
    ld   h, [hl]
    inc  bc
    ld   h, [hl]
    inc  hl
    ld   h, h
    inc  hl
    ld   l, b
    inc  bc
    ld   l, d
    inc  bc
    ld   l, h
    inc  bc
    ld   l, [hl]
    inc  bc
    ld   l, d
    inc  hl
    ld   l, b
    inc  hl
    ld   l, [hl]
    inc  hl
    ld   l, h
    inc  hl

label_D937::
    ld   [label_4F8], sp
    db   $FC ; Undefined instruction

label_D93B::
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld    hl, sp+$00

label_D93F::
    jr   nz, label_D921
    nop
    nop

label_D943::
    nop
    nop
    ld   [rNR41], a

label_D947::
    ld   a, $0C
    call label_E4CA
    jr   c, label_D98B
    push bc
    ld   a, [$FFD9]
    ld   c, a
    ld   hl, label_D937
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_D93B
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_D93F
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a

label_D974::
    ld   hl, label_D943
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD9]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    pop  bc

label_D98B::
    ret

label_D98C::
    ld   [$00F8], sp
    nop
    ld    hl, sp+$08

label_D992::
    jr   nz, label_D974

label_D994::
    nop
    nop
    ld   [rNR41], a

label_D998::
    ld   a, $0A
    call label_E4CA
    jr   c, label_D9D6
    push bc
    ld   a, [$FFD9]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    ld   c, a
    ld   hl, label_D98C
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_D98E
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_D992
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_D994
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    pop  bc
    and  a

label_D9D6::
    ret
    ret

label_D9D8::
    xor  d
    inc  d
    xor  d
    inc  [hl]
    ld   de, label_D9D8
    call label_3BC0
    call label_C05
    jp   z, label_E0AA
    dec  a
    jr   nz, label_DA17
    ld   a, $18
    ld   [$D368], a
    ld   hl, $DB5B
    inc  [hl]
    ld   hl, $DB93
    ld   [hl], $FF
    call label_D134
    ld   a, [hl]
    or   $20
    ld   [hl], a
    ld   [$FFF8], a
    ld   a, [$FFF7]
    ld   hl, $DA2E
    cp   $06
    jr   z, label_DA12
    cp   $03
    jr   nz, label_DA14
    ld   hl, $D966

label_DA12::
    set  5, [hl]

label_DA14::
    jp   label_3F8D

label_DA17::
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, $0C
    ld   [hl], a
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $03
    ld   [$FF9E], a
    xor  a
    ld   [$C137], a
    ld   [$C16A], a
    ld   [$C122], a
    ld   [$C121], a
    ld   hl, $C470
    add  hl, bc
    ld   [hl], a
    ld   a, $02
    ld   [$FFA1], a
    ret

label_DA4D::
    xor  h
    ld   [bc], a
    xor  h
    ldi  [hl], a
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_3F8D
    ld   a, [$FFF0]
    rst  0
    ld   d, d
    ld   e, e
    ld   l, l
    ld   e, d
    ld   a, h
    ld   e, d
    add  a, e
    ld   e, d
    adc  a, d
    ld   e, d
    sbc  a, b
    ld   e, d
    cp   e
    ld   e, d
    ld   a, [$FF5A]
    dec  b
    ld   e, e
    call label_DA17
    call label_C05
    ret  nz
    ld   a, $01
    ld   [$C167], a
    jp   label_3B12
    ld   a, $03
    ld   [$FF90], a
    jp   label_3B12
    ld   a, $04
    ld   [$FF90], a
    jp   label_3B12
    ld   a, $4F
    call label_2385
    call label_3B12
    ld   a, $01
    ld   [$C1AB], a
    ret
    call label_DA17
    ld   de, label_DA4D
    call label_3BC0
    call label_DB2B
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $A8
    jp   z, label_3B12
    cp   $38
    jr   nz, label_DABA
    ld   a, [$DB5C]
    inc  a
    ld   [$DB5C], a

label_DABA::
    ret
    call label_DA17
    ld   de, label_DA4D
    call label_3BC0
    xor  a
    ld   [$C1AB], a
    call label_DB2B
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$DB5C]
    cp   $04
    jr   nz, label_DAED
    ld   a, $19
    ld   [$FFF2], a
    xor  a
    ld   [$DB5C], a
    ld   hl, $DB93
    ld   [hl], $40
    ld   hl, $DB5B
    inc  [hl]
    ld   a, $50
    call label_2385

label_DAED::
    jp   label_3B12
    call label_DA17
    ld   de, label_DA4D
    call label_3BC0
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $05
    ld   [$FF90], a
    jp   label_3B12
    ld   a, $06
    ld   [$FF90], a
    call label_3F8D
    ld   a, $0D
    ld   [$FFA5], a
    xor  a
    ld   [$C167], a
    jp   label_D12A

label_DB17::
    sbc  a, d
    ld   [bc], a
    sbc  a, d
    ldi  [hl], a
    sbc  a, h
    ld   [bc], a
    sbc  a, d
    ldi  [hl], a
    sbc  a, [hl]
    ld   [bc], a
    sbc  a, d
    ldi  [hl], a
    sbc  a, [hl]
    ld   [bc], a
    sbc  a, h
    ldi  [hl], a
    sbc  a, [hl]
    ld   [bc], a
    sbc  a, [hl]
    ldi  [hl], a

label_DB2B::
    ld   a, [$C19F]
    and  a
    ret  z
    ld   a, [$C170]
    cp   $21
    ret  nc
    ld   a, [$C19F]
    and  $80
    ld   a, $23
    jr   z, label_DB41
    ld   a, $6B

label_DB41::
    ld   [$FFEC], a
    ld   a, [$DB5C]
    ld   [$FFF1], a
    ld   a, $8E
    ld   [$FFEE], a
    ld   de, label_DB17
    jp   label_3BC0
    ld   de, label_DA4D
    call label_3BC0
    jp   label_E0AA

label_DB5B::
    xor  [hl]
    inc  d
    ld   de, label_DB5B
    call label_3C77
    jr   label_DB7D

label_DB65::
    inc  d
    ld   [bc], a
    inc  d
    ldi  [hl], a
    inc  d
    inc  d
    inc  d
    inc  [hl]
    ld   de, label_DB65
    call label_3BC0
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C

label_DB7D::
    jp   label_E0AA
    ld   [hl], h
    nop
    halt
    halt
    ld   [hl], h
    jr   nz, label_DB9A
    add  a, b
    ld   e, e
    call label_3BC0
    call label_FF78
    call label_E2AF
    ret

label_DB95::
    add  a, [hl]
    rla

label_DB97::
    add  a, h
    rla
    ld   de, label_DB95
    ld   a, [$DB4E]
    and  a
    jr   nz, label_DBAC
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_3F8D
    ld   de, label_DB97

label_DBAC::
    call label_3C77
    ld   a, [$FFF0]
    rst  0
    cp   d
    ld   e, e
    db   $E4 ; Undefined instruction
    ld   e, e
    ld   bc, label_F5C
    ld   e, h
    call label_C05
    jp   z, label_E0AA
    cp   $10
    jr   nz, label_DBCB
    dec  [hl]
    ld   a, $9B
    call label_2385
    xor  a

label_DBCB::
    dec  a
    jr   nz, label_DBE1
    ld   a, $31
    ld   [$D368], a
    ld   a, $05
    ld   [$FFB0], a
    ld   [$FFBF], a
    call label_BFB
    ld   [hl], $52
    call label_3B12

label_DBE1::
    jp   label_DA17
    call label_DA17
    call label_BFB
    ret  nz
    ld   a, $FF
    call label_3B0C
    call label_C05
    ld   [hl], $20
    ld   a, $20
    ld   [$C121], a
    ld   a, $03
    ld   [$FFF4], a
    jp   label_3B12
    call label_C05
    ret  nz
    ld   [hl], $20
    ld   a, $00
    call label_3B0C
    jp   label_3B12
    call label_DA17
    ld   a, $6B
    ld   [$FF9D], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [$FF98]
    sub  a, $04
    ld   [hl], a
    call label_C05
    jr   nz, label_DC37
    ld   [$C167], a
    ld   d, $01
    call label_E472
    ld   a, $01
    ld   [$DB4E], a
    call label_D12A
    jp   label_3F8D

label_DC37::
    cp   $1A
    jr   nz, label_DC46
    ld   a, [$FFEF]
    sub  a, $0C
    call label_EC36
    ld   a, $07
    ld   [$FFF2], a

label_DC46::
    ret

label_DC47::
    adc  a, d
    inc  d

label_DC49::
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_3F8D
    ld   de, label_DC47
    call label_3C77
    call label_C05
    jp   z, label_E0AA
    cp   $10
    jr   nz, label_DC67
    dec  [hl]
    ld   a, $93
    call label_2385
    xor  a

label_DC67::
    dec  a
    jr   nz, label_DC75
    ld   d, $06
    call label_E472
    call label_D12A
    jp   label_3F8D

label_DC75::
    jp   label_DA17

label_DC78::
    jp   z, label_C017
    rla
    jp   nz, label_C414
    rla
    add  a, $14
    jp   z, label_17
    and  e
    and  h
    and  l
    nop
    call label_DCEA
    jr   nc, label_DC99
    ld   hl, $D8CE
    set  4, [hl]
    ld   hl, $D9F8
    set  5, [hl]
    ret

label_DC99::
    ld   a, [$FFF6]
    cp   $80
    jp   z, label_DC49
    ld   de, label_DC78
    call label_3C77
    call label_C05
    jp   z, label_DCD6
    cp   $10
    jr   nz, label_DCCD
    dec  [hl]
    ld   a, [$FFF1]
    dec  a
    ld   e, a
    ld   d, b
    ld   hl, label_DC84
    add  hl, de
    ld   a, [hl]
    call label_2385
    ld   a, [$FFF1]
    dec  a
    ld   e, a
    ld   d, b
    ld   hl, $DB11
    add  hl, de
    ld   [hl], $01
    call label_D12A
    xor  a

label_DCCD::
    dec  a
    jr   nz, label_DCD3
    jp   label_3F8D

label_DCD3::
    jp   label_DA17

label_DCD6::
    call label_FF78
    call label_E2AF
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_DCE7
    call label_E2EB

label_DCE7::
    jp   label_E0B3

label_DCEA::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_DD34
    ld   a, [$FFF6]
    cp   $CE
    jr   nz, label_DD34
    ld   a, [$FFEF]
    sub  a, $48
    add  a, $03
    cp   $06
    jr   nc, label_DD34
    ld   a, [$FFEE]
    sub  a, $50
    add  a, $03
    cp   $06
    jr   nc, label_DD34
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_DD34
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   nz, label_DD34
    ld   [hl], $02
    ld   hl, $C4B0
    add  hl, bc
    ld   [hl], $50
    ld   hl, $C4C0
    add  hl, bc
    ld   [hl], $48
    call label_C05
    ld   [hl], $2F
    ld   a, $18
    ld   [$FFF2], a
    scf
    ret

label_DD34::
    and  a
    ret

label_DD36::
    xor  b
    inc  d
    call label_E1DE
    call label_E08C
    ld   de, label_DD36
    call label_3C77
    jp   label_E0AA

label_DD47::
    ld   e, [hl]
    ld   [bc], a
    ld   e, [hl]
    ldi  [hl], a
    ld   hl, $DB4B
    ld   a, [$DB4C]
    or   [hl]
    jp   nz, label_3F8D
    ld   de, label_DD47
    call label_3BC0
    call label_C05
    jp   z, label_E0AA
    cp   $10
    jr   nz, label_DD6C
    dec  [hl]
    ld   a, $0F
    call label_2385
    xor  a

label_DD6C::
    dec  a
    jr   nz, label_DD80
    ld   a, $0A
    ld   [$FFA5], a
    ld   d, $0C
    call label_E472
    ld   a, $01
    ld   [$DB4B], a
    jp   label_3F8D

label_DD80::
    jp   label_DA17

label_DD83::
    ld   [hl], b
    ld   bc, label_172
    ld   [hl], h
    ld   bc, label_176
    ld   a, b
    ld   bc, label_17A
    ld   a, h
    ld   bc, label_17E
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    and  e
    ld   e, [hl]
    sub  a, e
    ld   e, [hl]
    reti
    ld   e, l

label_DD9F::
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    sub  a, b
    sub  a, b
    sub  a, b
    sub  a, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_DDBC::
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    ld   [label_808], sp
    ld   [label_404], sp
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    call label_3E76
    ld   a, $01
    ld   [$C167], a
    call label_BFB
    jr   nz, label_DE29
    call label_3F8D
    xor  a
    ld   [$FF9D], a
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    inc  [hl]
    call label_C9E
    ld   a, [$FFF7]
    rst  0
    inc  c
    ld   e, [hl]
    ld   [de], a
    ld   e, [hl]
    jr   label_DE60
    add  hl, de
    ld   e, [hl]
    ld   e, $5E
    rra
    ld   e, [hl]
    inc  h

label_DE09::
    ld   e, [hl]
    ld   e, $5E
    ld   a, $80
    ld   [$DB56], a
    ret
    ld   a, $02
    ld   [$DB48], a
    ret
    ret
    ld   a, $02
    ld   [$DB79], a
    ret
    xor  a
    ld   [$DB74], a
    ret
    xor  a
    ld   [$DB7B], a
    ret

label_DE29::
    cp   $50
    jr   nc, label_DE8A
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cp   $19
    jr   nc, label_DE8A
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_DE5B
    ld   a, [hl]
    and  a
    jr   nz, label_DE45
    ld   a, $2C
    ld   [$FFF4], a
    xor  a

label_DE45::
    inc  [hl]
    cp   $18
    jr   nz, label_DE5B
    ld   a, $9F
    call label_E4CA
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $60

label_DE5B::
    ld   a, [$FFE7]
    and  $03
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    ld   e, a
    ld   d, b
    ld   a, [$FFFE]
    and  a
    jr   z, label_DE76
    push bc
    push de
    ld   a, $03
    call label_978
    pop  de
    pop  bc
    jr   label_DE8A

label_DE76::
    ld   hl, label_DD9F
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_DDBC
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    xor  a
    ld   [$DB99], a

label_DE8A::
    ret

label_DE8B::
    ld   l, h
    nop
    rst  $38
    rst  $38
    ld   l, h
    nop
    ld   l, [hl]
    nop
    ld   de, label_DE8B
    call label_3BC0
    call label_FF25
    call label_C05
    jp   z, label_3F8D
    ret
    ld   a, [$FFF0]
    cp   $03
    jr   nc, label_DEAE
    ld   a, $03
    call label_AD2

label_DEAE::
    ld   a, c
    ld   [$D201], a
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_3F8D
    ld   a, [$FFF7]
    and  $03
    ld   [$FFF1], a
    call label_394D
    ld   de, label_DD83
    call label_3BC0
    ld   a, [$FFF0]
    rst  0
    push de
    ld   e, [hl]
    inc  c
    ld   e, a
    inc  sp
    ld   e, a
    cp   h
    ld   e, a
    cp   a
    ld   e, a
    call label_C05
    jp   z, label_E0AA
    cp   $10
    jr   nz, label_DEFE
    dec  [hl]
    call label_3B12
    ld   a, [$FFF7]
    add  a, $00
    call label_2373
    ld   a, [$FFF7]
    ld   e, a
    ld   d, b
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    or   $02
    ld   [hl], a
    call label_D134
    ld   a, [hl]
    or   $10
    ld   [hl], a
    xor  a

label_DEFE::
    dec  a
    jr   nz, label_DF01

label_DF01::
    jp   label_DA17

label_DF04::
    jr   nz, label_DF2E
    add  hl, hl
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $FA
    ld   l, c
    db   $D3 ; Undefined instruction
    and  a
    jr   nz, label_DF2C
    ld   a, [$C19F]
    and  a
    jr   nz, label_DF2C
    ld   a, [$FFF7]
    ld   e, a
    ld   d, b
    ld   hl, label_DF04
    add  hl, de
    ld   a, [hl]
    ld   [$D368], a
    call label_3B12
    call label_C05
    ld   [hl], $FF

label_DF2C::
    jp   label_DA17

label_DF2F::
    ld   a, [bc]
    ld   a, [$FC04]
    call label_C05
    jr   nz, label_DF5F
    ld   a, $2B
    ld   [$FFF2], a
    ld   a, $39
    call label_E4CA
    ld   a, [$FFD7]
    dec  a
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C450
    add  hl, de
    ld   [hl], $80
    jp   label_3B12

label_DF5F::
    ld   hl, $C2D0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    cp   $FF
    jr   nz, label_DFB9
    ld   [hl], $17
    ld   hl, $C440
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $01
    ld   [$FFE8], a
    ld   a, $39
    call label_E4CA
    push bc
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_DF2F
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_DF31
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    add  a, $F8
    ld   [hl], a
    ld   hl, $C250
    add  hl, de
    ld   [hl], $FD
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $38
    call label_280D
    and  $01
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    pop  bc

label_DFB9::
    jp   label_DA17
    jp   label_DA17
    ret

label_DFC0::
    add  a, b
    dec  d
    call label_E1DE
    call label_E08C
    ld   de, label_DFC0
    call label_3C77
    jp   label_E0AA

label_DFD1::
    sbc  a, [hl]
    inc  d
    ld   a, [$DB4E]
    cp   $02
    jp   nc, label_3F8D
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_3F8D
    ld   a, [$FFF6]
    cp   $E3
    jr   nz, label_DFEF
    ld   a, [$FFF8]
    and  $40
    jp   z, label_3F8D

label_DFEF::
    call label_E1DE
    ld   de, label_DFD1
    call label_3C77
    jp   label_E0AA

label_DFFB::
    jp   z, label_F014
    ld    hl, sp+$E6
    db   $10 ; Undefined instruction
    adc  a, l
    ccf
    call label_E1DE
    ld   de, label_DFFB
    call label_3C77
    call label_C05
    jp   z, label_E0AA
    cp   $10
    jr   nz, label_E04C
    dec  [hl]
    ld   a, [$DBA5]
    and  a
    jr   nz, label_E029
    ld   a, [$FFF6]
    cp   $C6
    jr   nz, label_E029
    ld   a, $05
    ld   [$DB15], a

label_E029::
    ld   hl, $DB15
    call label_E373
    call label_D12A
    ld   hl, $FFF8
    res  4, [hl]
    ld   e, $A2
    ld   a, [$DB15]
    cp   $06
    jr   z, label_E047
    ld   e, $E8
    cp   $05
    jr   nz, label_E047
    inc  e

label_E047::
    ld   a, e
    call label_2385
    xor  a

label_E04C::
    dec  a
    jr   nz, label_E052
    jp   label_3F8D

label_E052::
    jp   label_DA17

label_E055::
    adc  a, [hl]
    ld   d, $FA
    and  l
    db   $DB
    and  a
    jr   z, label_E063
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_E06A

label_E063::
    ld   a, [$DB4B]
    and  a
    jp   nz, label_3F8D

label_E06A::
    call label_E1DE
    call label_E08C
    ld   de, label_E055
    call label_3C77
    jp   label_E0AA

label_E079::
    ld   a, [hli]
    ld   b, c
    ld   a, [hli]
    ld   h, c
    call label_E1DE
    call label_E08C
    ld   de, label_E079
    call label_3BC0
    jp   label_E0AA

label_E08C::
    call label_BFB
    cp   $1C
    ret  nc
    and  a
    jp   z, label_3F8D
    and  $01
    dec  a
    jp   label_3B0C

label_E09C::
    and  [hl]
    dec  d
    call label_E1DE
    call label_E08C
    ld   de, label_E09C
    call label_3C77

label_E0AA::
    call label_FF78
    call label_E2AF
    call label_E2EB

label_E0B3::
    call label_FF25
    call label_EB7B
    call label_F893
    ld   a, [$FFF9]
    and  a
    jr   z, label_E0E3
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $08
    jp   z, label_E156
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    and  $F0
    add  a, $05
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    sra  a
    cp   $F8
    jr   c, label_E112
    jr   label_E103

label_E0E3::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_E156
    xor  a
    ld   [hl], a
    ld   hl, $C470
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C320
    add  hl, bc
    cp   $02
    jr   z, label_E103
    ld   a, [hl]
    sra  a
    cpl
    cp   $07
    jr   nc, label_E112

label_E103::
    xor  a
    push hl
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    pop  hl
    jr   label_E136

label_E112::
    push af
    push hl
    ld   a, [$FFEB]
    cp   $30
    jr   nz, label_E120
    ld   a, $17
    ld   [$FFF4], a
    jr   label_E134

label_E120::
    cp   $02
    jr   nz, label_E134
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_E134
    cp   $02
    jr   z, label_E134
    ld   a, $09

label_E132::
    ld   [$FFF2], a

label_E134::
    pop  hl
    pop  af

label_E136::
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    sra  a
    cp   $FF
    jr   nz, label_E143
    xor  a

label_E143::
    ld   [hl], a
    ld   a, [$FFF9]
    and  a
    jr   nz, label_E156
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    sra  a
    cp   $FF
    jr   nz, label_E155
    xor  a

label_E155::
    ld   [hl], a

label_E156::
    ret

label_E157::
    jr   nz, label_E17A
    jr   nz, label_E15C
    call label_E1DE
    call label_E08C
    ld   de, label_E157
    call label_3C77
    call label_FF78
    call label_E2AF
    call label_E2EB
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    rlca
    and  $01
    call label_3B0C
    call label_FF25
    call label_E1C0
    call label_F893
    call label_FED9
    ld   a, d
    bit  7, a
    jr   z, label_E18C

label_E18C::
    cp   $20
    jr   c, label_E19C
    call label_FEE9
    ld   a, d
    bit  7, a
    jr   z, label_E198

label_E198::
    cp   $20
    jr   nc, label_E1BB

label_E19C::
    call label_C05
    ret  nz
    ld   [hl], $30
    call label_280D
    and  $0F
    sub  a, $08
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $0F
    sub  a, $08
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ret

label_E1BB::
    ld   a, $09
    jp   label_FEC7

label_E1C0::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_E1DD
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $10
    jr   z, label_E1DD
    bit  7, a
    jr   z, label_E1D6
    inc  [hl]
    jr   label_E1DD

label_E1D6::
    cp   $10
    jr   nc, label_E1DC
    inc  [hl]
    ret

label_E1DC::
    dec  [hl]

label_E1DD::
    ret

label_E1DE::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   z, label_E29D
    ld   a, [$C124]
    and  a
    jp   nz, label_E29C
    ld   a, [hl]
    cp   $02
    jr   nz, label_E243
    ld   a, [$FFEB]
    cp   $3D
    jr   z, label_E200
    ld   a, [$DBA5]
    and  a
    jp   nz, label_E29C

label_E200::
    call label_FE0E
    ld   a, [$FFEB]
    cp   $2D
    jr   z, label_E227
    cp   $3D
    jr   nz, label_E22F
    ld   a, [$FFF6]
    cp   $DA
    jr   z, label_E22F
    cp   $A5
    jr   z, label_E22F
    cp   $74
    jr   z, label_E22F
    cp   $3A
    jr   z, label_E22F
    cp   $A8
    jr   z, label_E22F
    cp   $B2
    jr   z, label_E22F

label_E227::
    ld   a, [$FFAF]
    cp   $04
    jr   z, label_E23B
    jr   label_E235

label_E22F::
    ld   hl, $C440
    add  hl, bc
    ld   [hl], $01

label_E235::
    ld   a, [$FFAF]
    cp   $CC
    jr   nz, label_E29C

label_E23B::
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $0A
    jr   label_E26B

label_E243::
    ld   a, [$C157]
    and  a
    jr   z, label_E29C
    ld   a, [$C178]
    and  a
    jr   z, label_E29C
    ld   a, [$FFEE]
    add  a, $08
    ld   hl, $C179
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_E29C
    ld   a, [$FFEF]
    add  a, $08
    ld   hl, $C17A
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_E29C

label_E26B::
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C440
    add  hl, bc
    ld   [hl], b
    call label_C00
    ld   [hl], $18
    ld   a, $0C
    call label_FE45
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_BFB
    ld   [hl], $80

label_E29C::
    pop  af

label_E29D::
    ret

label_E29E::
    ld   bc, $0001
    nop
    ld   bc, $0100
    ld   bc, $0000
    ld   bc, $0001
    nop
    ld   bc, $0000

label_E2AF::
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_E2EA
    pop  de
    dec  a
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_E311
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $01
    jr   z, label_E2D0
    cp   $03
    jr   nz, label_E311

label_E2D0::
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    xor  a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a

label_E2EA::
    ret

label_E2EB::
    call label_C00
    jr   nz, label_E2EA
    ld   a, [$FFEB]
    sub  a, $2D
    ld   e, a
    ld   d, b
    ld   hl, label_E29E
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_E30C
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    push af
    push hl
    ld   [hl], b
    call label_EE2B
    pop  hl
    pop  af
    ld   [hl], a

label_E30C::
    call label_EC6B
    jr   nc, label_E2EA

label_E311::
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    call label_3F78
    ld   a, [$FFEB]
    sub  a, $2D
    cp   $02
    jr   nc, label_E328
    ld   hl, $FFF2
    ld   [hl], $14
    jr   label_E32D

label_E328::
    ld   hl, $FFF3
    ld   [hl], $01

label_E32D::
    rst  0
    or   a
    ld   h, h
    cp   a
    ld   h, h
    add  a, $64
    adc  a, a
    ld   h, h
    ld   c, l
    ld   h, h
    ld   c, h
    ld   h, h
    db   $FC ; Undefined instruction
    ld   h, e
    or   $63
    db   $E4 ; Undefined instruction
    ld   h, e
    or   b
    ld   h, e
    ld   a, l
    ld   h, e
    add  a, l
    ld   h, e
    sub  a, d
    ld   h, e
    rst  0
    ld   h, e
    ld   d, b
    ld   h, e
    rst  0
    ld   h, e
    ld   l, b
    ld   h, e
    ld   a, $0B
    ld   [$FFA5], a
    ld   d, $0C
    call label_E472
    ld   hl, $DB76
    ld   de, $DB4C

label_E35F::
    ld   a, [de]
    cp   [hl]
    jr   nc, label_E367
    add  a, $01
    daa
    ld   [de], a

label_E367::
    ret
    ld   a, $EF
    call label_2385

label_E36D::
    call label_D12A
    ld   hl, $DB0F

label_E373::
    ld   a, [hl]
    cp   $99
    jr   z, label_E37C
    add  a, $01
    daa
    ld   [hl], a

label_E37C::
    ret
    ld   hl, $DB78
    ld   de, $DB45
    jr   label_E35F
    ld   d, $02
    call label_E472
    ld   hl, $DB77
    ld   de, $DB4D
    jr   label_E35F
    xor  a
    ld   [$D46C], a
    ld   [$C3CB], a
    ld   a, $1B
    ld   [$D368], a
    ld   [$C167], a

label_E3A1::
    ld   a, [$FF98]
    push af
    add  a, $04
    ld   [$FF98], a
    call label_E41E
    pop  af
    ld   [$FF98], a
    jr   label_E3D2
    xor  a
    ld   [$D47C], a
    ld   a, $25
    ld   [$D368], a
    ld   [$D46C], a
    call label_C05
    ld   a, $70
    ld   [hl], a
    ld   [$C111], a
    jr   label_E3DB
    ld   a, $10
    ld   [$D368], a
    jr   label_E3D2
    ld   a, $01
    ld   [$FFF2], a

label_E3D2::
    call label_C05
    ld   a, $68
    ld   [hl], a
    ld   [$C111], a

label_E3DB::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    jp   label_CAF
    ld   a, $10
    ld   [$D368], a
    call label_3B12
    jr   label_E3DB

label_E3EE::
    db   $E4 ; Undefined instruction
    inc  d
    db   $E4 ; Undefined instruction
    inc  d

label_E3F2::
    call nc, label_4D4
    inc  b
    ld   a, $02
    ld   e, $05
    jr   label_E400
    ld   a, $01
    ld   e, $01

label_E400::
    ld   [$D47C], a
    ld   a, e
    ld   [$C1A9], a
    ld   a, $30
    ld   [$C1AA], a
    ld   [$C111], a
    xor  a
    ld   [$D47A], a
    ld   a, $27
    ld   [$D368], a
    ld   a, $49
    ld   [$FFBD], a
    ld   [$FFBF], a

label_E41E::
    ld   e, $03
    ld   d, $00

label_E422::
    push de
    ld   hl, label_E3EE
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$FFD7], a
    ld   hl, label_E3F2
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$FFD8], a
    ld   a, $07
    call label_CC7
    ld   hl, $C520
    add  hl, de
    ld   [hl], $22
    ld   hl, $C590
    add  hl, de
    pop  de
    ld   [hl], e
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_E422
    ret
    ld   a, [$DB4E]
    and  a
    jr   nz, label_E468
    ld   a, $0F
    ld   [$D368], a
    ld   [$C167], a
    call label_E3A1
    call label_C05
    ld   [hl], $A0
    ld   a, $FF
    ld   [$FFBF], a
    ret

label_E468::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$DB44], a
    ld   d, $04

label_E472::
    ld   hl, $DB00
    ld   e, $0C

label_E477::
    ld   a, [hli]
    cp   d
    jr   z, label_E48E
    dec  e
    jr   nz, label_E477
    ld   hl, $DB00

label_E481::
    ld   a, [hl]
    and  a
    jr   nz, label_E487
    ld   [hl], d
    ret

label_E487::
    inc  hl
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, label_E481

label_E48E::
    ret
    ld   a, [$FFF6]
    cp   $80
    jr   z, label_E4A5
    ld   a, [$FFF6]
    cp   $7C
    jr   nz, label_E4A0
    ld   hl, $D969
    set  4, [hl]

label_E4A0::
    ld   a, [$FFF1]
    and  a
    jr   z, label_E4AD

label_E4A5::
    ld   a, $10
    ld   [$D368], a
    jp   label_E3D2

label_E4AD::
    call label_D12A
    ld   hl, $DBD0
    inc  [hl]
    jp   label_2802
    ld   a, $08

label_E4B9::
    ld   hl, $DB93

label_E4BC::
    add  a, [hl]
    ld   [hl], a
    ret
    ld   a, $01
    ld   hl, $DB90
    jr   label_E4BC
    ld   a, $30
    jr   label_E4B9

label_E4CA::
    ld   e, $0F
    push af
    ld   d, $00

label_E4CF::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_E4E0
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_E4CF
    pop  af
    scf
    ret

label_E4E0::
    ld   [hl], $05
    pop  af
    ld   hl, $C3A0
    add  hl, de
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD9], a
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    ld   [$FFDA], a
    call label_E524
    ld   hl, $C410
    add  hl, de
    ld   [hl], $01
    ld   hl, $C220
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C220
    add  hl, de
    ld   [hl], a
    ld   hl, $C230
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C230
    add  hl, de
    ld   [hl], a
    scf
    ccf
    ret

label_E524::
    push bc
    push de
    ld   c, e
    ld   b, d
    call label_C85B
    pop  de
    pop  bc
    ret

label_E52E::
    add  a, b
    dec  d

label_E530::
    ld    hl, sp+$F8
    ldd  [hl], a
    ld   bc, $00F8
    ldd  [hl], a
    ld   hl, label_8F8
    ldd  [hl], a
    ld   bc, label_10F8
    ldd  [hl], a
    ld   hl, $F808
    ldd  [hl], a
    ld   bc, $0008
    ldd  [hl], a
    ld   hl, label_808
    ldd  [hl], a
    ld   bc, label_1008
    ldd  [hl], a
    ld   hl, $F8F8
    db   $10 ; Undefined instruction
    ld    hl, sp+$00
    ld   [de], a
    ld   [bc], a
    ld    hl, sp+$08
    ld   [de], a
    ldi  [hl], a
    ld    hl, sp+$10
    db   $10 ; Undefined instruction
    ld   [label_10F8], sp
    ld   b, d
    ld   [label_1200], sp
    ld   b, d
    ld   [label_1208], sp
    ld   h, d
    ld   [label_1010], sp
    ld   h, d
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    jr   nc, label_E585
    db   $FC ; Undefined instruction
    inc  b
    jr   nc, label_E5A9
    db   $FC ; Undefined instruction
    inc  b
    jr   nc, label_E58D
    db   $FC ; Undefined instruction
    inc  c
    jr   nc, label_E5B1
    inc  b
    db   $FC ; Undefined instruction
    jr   nc, label_E595
    inc  b

label_E585::
    inc  b
    jr   nc, label_E5B9
    inc  b
    inc  b
    jr   nc, label_E59D
    inc  b

label_E58D::
    inc  c
    jr   nc, label_E5C1
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    jr   nc, label_E595
    db   $FC ; Undefined instruction

label_E595::
    inc  b
    jr   nc, label_E5B9
    db   $FC ; Undefined instruction
    inc  b
    jr   nc, label_E59D
    db   $FC ; Undefined instruction

label_E59D::
    inc  c
    jr   nc, label_E5C1
    inc  b
    db   $FC ; Undefined instruction
    jr   nc, label_E5A5
    inc  b

label_E5A5::
    inc  b
    jr   nc, label_E5C9
    inc  b

label_E5A9::
    inc  b
    jr   nc, label_E5AD
    inc  b

label_E5AD::
    inc  c
    jr   nc, label_E5D1

label_E5B0::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    sla  a
    sla  a

label_E5B9::
    sla  a
    sla  a
    sla  a
    ld   e, a
    ld   d, b

label_E5C1::
    ld   hl, label_E530
    add  hl, de
    ld   c, $08
    jp   label_3CE6

label_E5CA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E5D1::
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc

label_E5E2::
    call label_E650
    call label_FF78
    call label_C05
    and  a
    jp   nz, label_E5F2
    jp   label_3F8D

label_E5F2::
    ld   e, a
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $4C
    ld   a, e
    jp   z, label_E64F
    cp   $0E
    jr   c, label_E614
    cp   $17
    jr   nc, label_E614
    push af
    sub  a, $0E
    ld   e, a
    ld   d, b
    push de
    call label_E8F8
    pop  de
    call label_E771
    pop  af

label_E614::
    cp   $12
    jr   nz, label_E64F
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_E625
    call label_F7D9
    jr   label_E64A

label_E625::
    ld   a, [$FFEE]
    ld   hl, $FF98
    sub  a, [hl]
    add  a, $18
    cp   $30
    jr   nc, label_E64A
    ld   a, [$FFEF]
    ld   hl, $FF99
    sub  a, [hl]
    add  a, $18
    cp   $30
    jr   nc, label_E64A
    call label_ECD5
    ld   hl, $FF9A
    sla  [hl]
    ld   hl, $FF9B
    sla  [hl]

label_E64A::
    ld   a, $04
    ld   [$C502], a

label_E64F::
    ret

label_E650::
    call label_C05
    ld   e, a
    ld   d, b
    ld   hl, label_E5CA
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $F0
    or   $08
    ld   [hl], a
    call label_E5B0
    ld   a, [$DBA5]
    and  a
    jr   z, label_E68B
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   e, $E4
    ld   a, [$C124]
    and  a
    jr   nz, label_E687
    call label_C05
    and  $04
    jr   z, label_E687
    ld   e, $84

label_E687::
    ld   hl, $DB97
    ld   [hl], e

label_E68B::
    ret

label_E68C::
    ld   de, label_D484
    call label_3BC0
    call label_FF78
    ret
    ld   a, [$FFEC]
    add  a, $10
    cp   $A0
    jp   nc, label_3F8D
    call label_C05
    cp   $18
    jp  c, label_E5E2
    jr   nz, label_E6AD
    dec  [hl]
    call label_C4B

label_E6AD::
    ld   hl, $C14E
    inc  [hl]
    cp   $22
    jr   c, label_E68C
    cp   $48
    jr   nz, label_E6BF
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $30

label_E6BF::
    call label_E711
    call label_DCEA
    call label_FF78
    call label_E0B3
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $FF
    call label_C00
    ld   hl, $C440
    add  hl, bc
    or   [hl]
    jr   nz, label_E6FA
    ld   a, [$DB00]
    cp   $02
    jr   nz, label_E6EA
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_E6F7
    jr   label_E6FA

label_E6EA::
    ld   a, [$DB01]
    cp   $02
    jr   nz, label_E6FA
    ld   a, [$FFCC]
    and  $10
    jr   z, label_E6FA

label_E6F7::
    call label_CE35

label_E6FA::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_E706
    call label_EB34

label_E706::
    ld   a, [$FFF9]
    and  a
    ret  nz
    ld   a, [hl]
    and  $0C
    ret  z
    jp   label_EB43

label_E711::
    ld   hl, $FFEC
    inc  [hl]
    inc  [hl]
    ld   de, label_E52E
    call label_3C77
    jp   label_3D8A

label_E71F::
    ld    hl, sp+$08
    jr   label_E71B
    ld   [$F818], sp
    ld   [$F818], sp
    ld    hl, sp+$F8
    ld   [label_808], sp
    jr   label_E748
    jr   label_E77A
    ld   c, b
    nop
    sub  a, b
    nop
    ld   [hl], b
    jr   c, label_E771

label_E739::
    dec  a
    dec  a
    ld   a, $3E

label_E73D::
    ld   [hl], d
    ld   [hl], d
    ld   [hl], e
    ld   [hl], e
    inc  b
    inc  b
    inc  b
    inc  b
    ld   l, c
    ld   a, c
    ld   l, c

label_E748::
    ld   a, c
    inc  b
    inc  b
    inc  b
    inc  b

label_E74D::
    ld   h, h
    ld   h, [hl]
    ld   h, l
    ld   h, a

label_E751::
    ld   h, h
    ld   h, [hl]
    ld   h, h
    ld   h, [hl]

label_E755::
    inc  b
    ld   [$0102], sp

label_E759::
    ld   [$0104], sp
    ld   [bc], a

label_E75D::
    ld    hl, sp+$08
    rst  $38
    ld   bc, label_F372
    ld   [hl], e
    ld   [hl], d
    nop
    nop
    nop
    nop

label_E769::
    nop
    db   $10 ; Undefined instruction
    stop
    nop
    stop

label_E771::
    ld   a, [$FFF9]
    and  a
    jp   nz, label_E8E5
    push bc
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   hl, label_E71F
    add  hl, de
    add  a, [hl]
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   hl, $C210
    add  hl, bc
    ld   c, a
    ld   a, [hl]
    sub  a, $10
    ld   hl, label_E728
    add  hl, de
    add  a, [hl]
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   c, a
    ld   b, $00
    ld   hl, $D711
    ld   a, h
    add  hl, bc
    ld   h, a
    ld   a, c
    ld   [$FFE9], a
    ld   a, [hl]
    ld   [$FFAF], a
    ld   e, a
    cp   $BB
    jr   c, label_E828
    cp   $BF
    jr   nc, label_E828
    ld   a, [$DBA5]
    and  a
    jr   nz, label_E828
    ld   a, $02
    ld   [$FFF2], a
    ld   a, [$FFCD]
    and  $E0
    ld   [$FFCD], a
    ld   a, [$FFCE]
    and  $E0
    ld   [$FFCE], a
    ld   a, $03
    call label_AA7
    ld   a, c
    and  $EE
    ld   c, a
    ld   hl, $D711
    add  hl, bc
    ld   a, $09
    ldi  [hl], a
    ldd  [hl], a
    ld   a, $83
    call label_B2F
    inc  hl
    ld   a, $83
    call label_B2F
    dec  hl
    ld   a, l
    add  a, $10
    ld   l, a
    ld   a, $09
    ldi  [hl], a
    ld   [hl], a
    ld   [$DDD8], a
    ld   a, $83
    call label_B2F
    dec  hl
    ld   a, $83
    call label_B2F
    inc  hl
    ld   c, $03
    ld   b, $00

label_E802::
    call label_E822
    ld   hl, label_E769
    add  hl, bc
    ld   a, [hl]
    ld   hl, $FFCE
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_E76D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $FFCD
    add  a, [hl]
    ld   [hl], a
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_E802
    jp   label_E8E4

label_E822::
    ld   de, label_E761
    jp   label_E865

label_E828::
    ld   a, [$DBA5]
    ld   d, a
    call label_2A26
    sub  a, $99
    jp  c, label_E8E4
    cp   $04
    jp   nc, label_E8E4
    ld   c, a
    ld   a, $02
    ld   [$FFF2], a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_E878
    pop  bc
    ld   a, [$FFE9]
    ld   e, a
    ld   d, b
    ld   hl, $D711
    add  hl, de
    ld   a, $E1
    ld   [hl], a
    ld   [$DDD8], a
    ld   a, $83
    call label_B2F
    ld   a, [$FFFE]
    and  a
    jr   z, label_E862
    ld   de, label_E751
    jr   label_E865

label_E862::
    ld   de, label_E74D

label_E865::
    push de
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    or   $04
    ld   [hl], a
    ld   [$FFF8], a
    jp   label_D1F5

label_E878::
    ld   hl, $D900
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_E88B
    ld   hl, $DDE0
    jr   label_E894

label_E88B::
    cp   $1A
    jr   nc, label_E894
    cp   $06
    jr   c, label_E894
    inc  d

label_E894::
    add  hl, de
    ld   e, l
    ld   d, h
    ld   hl, label_E755
    add  hl, bc
    ld   a, [de]
    or   [hl]
    ld   [de], a
    ld   [$FFF8], a
    ld   hl, label_E75D
    add  hl, bc
    ld   a, [$DBAE]
    add  a, [hl]
    ld   e, a
    ld   d, $00
    call label_2BC1
    ld   e, l
    ld   d, h
    ld   hl, label_E759
    add  hl, bc
    ld   a, [de]
    or   [hl]
    ld   [de], a
    ld   a, [$FFCE]
    swap a
    and  $0F
    ld   e, a

label_E8BE::
    ld   a, [$FFCD]
    and  $F0
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    add  hl, de
    ld   e, l
    ld   d, h
    ld   hl, label_E739
    add  hl, bc
    ld   a, [hl]
    ld   [de], a
    ld   [$DDD8], a
    ld   a, c
    and  $02
    rla
    rla
    ld   c, a
    ld   hl, label_E73D
    add  hl, bc
    pop  bc
    push hl
    jp   label_D1F5

label_E8E4::
    pop  bc

label_E8E5::
    ret

label_E8E6::
    ld    hl, sp+$08
    jr   label_E8E2
    ld   [$F818], sp
    ld   [$F818], sp
    ld    hl, sp+$F8
    ld   [label_808], sp
    jr   label_E90F
    jr   label_E8BE
    ld   hl, label_E8E6
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   c, a
    ld   hl, label_E8EF
    add  hl, de
    ld   a, [$FFEC]

label_E90F::
    add  a, [hl]
    sub  a, $10
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   e, a
    ld   hl, $D711
    add  hl, de
    ld   a, h
    cp   $D7
    jp   nz, label_E9A0
    ld   a, [$DBA5]
    and  a
    ld   a, [hl]
    ld   [$FFAF], a
    jr   nz, label_E93C
    ld   [$FFE9], a
    cp   $0A
    jr   z, label_E964
    cp   $D3
    jr   z, label_E964
    cp   $5C
    jr   z, label_E964
    jp   label_E9A0

label_E93C::
    cp   $A9
    jp   nz, label_E9A0
    ld   hl, $D900
    ld   a, [$FFF6]
    ld   c, a
    ld   b, $00
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_E954
    ld   hl, $DDE0
    jr   label_E95D

label_E954::
    cp   $1A
    jr   nc, label_E95D
    cp   $06
    jr   c, label_E95D
    inc  b

label_E95D::
    add  hl, bc
    ld   a, [hl]
    or   $40
    ld   [hl], a
    ld   [$FFF8], a

label_E964::
    call label_2178
    ld   a, $05
    call label_E4CA
    jr   c, label_E9A0
    xor  a
    ld   [$C19B], a
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFCE]
    add  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFCD]
    add  a, $10
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   a, [$DBA5]
    xor  $01
    ld   [hl], a
    ld   [$FFF1], a
    ld   a, [$FFE9]
    cp   $0A
    jr   nz, label_E99B
    ld   a, $FF
    ld   [hl], a
    ld   [$FFF1], a

label_E99B::
    ld   c, e
    ld   b, d
    call label_D3E4

label_E9A0::
    pop  bc
    ret

label_E9A2::
    ld   l, h
    ld   [hl], h
    ld   l, l
    ld   [hl], l
    nop
    nop
    nop
    nop

label_E9AA::
    ld   [hl], $02
    ld   [hl], $22
    ld   [hl], $12
    ld   [hl], $32
    ld   hl, $C14D
    inc  [hl]
    ld   a, $0A
    ld   [$C19E], a
    call label_F5A2
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    call label_C00
    jr   z, label_E9D9
    dec  a
    jp   z, label_3F8D
    ld   de, label_CC44
    jp   label_3BC0

label_E9D9::
    ld   de, label_E9AA
    call label_EAD7
    call label_FF78
    ld   a, [$DBA5]
    and  a
    ld   a, [$FFAF]
    jr   z, label_E9F0
    cp   $8A
    jr   z, label_E9F8
    jr   label_EA1D

label_E9F0::
    cp   $D3
    jr   z, label_E9F8
    cp   $5C
    jr   nz, label_EA1D

label_E9F8::
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], b
    call label_C00
    ld   [hl], b
    ld   a, [$FFE9]
    ld   e, a
    ld   d, b
    call label_2178
    ld   a, [$FFCE]
    add  a, $08
    ld   [$FFD7], a
    ld   a, [$FFCD]
    add  a, $10
    ld   [$FFD8], a
    ld   a, $08
    call label_CC7
    ld   a, $13
    ld   [$FFF4], a

label_EA1D::
    ret

label_EA1E::
    ld   l, h
    ld   bc, label_216C
    ld   e, h
    ld   bc, label_215C
    call label_C05
    jr   nz, label_EA2E
    call label_EBDE

label_EA2E::
    ld   de, label_EA1E
    jp   label_EAD7
    ld   hl, $C14D
    inc  [hl]
    ld   a, [$FFF0]
    and  a
    jr   nz, label_EA70
    call label_C05
    jp   nz, label_EAD4
    ld   a, $05
    ld   [$C19E], a
    call label_F5A2
    call label_EAD4
    ld   a, [$FFF1]
    cp   $02
    ret  nz
    ld   a, [$C18E]
    and  $1F
    cp   $0F
    ret  nz
    ld   a, [$FFAF]
    cp   $C0
    ret  nz
    call label_C60
    jp   label_3F8D

label_EA66::
    add  a, b
    dec  d

label_EA68::
    inc  b
    db   $FC ; Undefined instruction
    nop
    nop

label_EA6C::
    cp   $FE
    ld   a, [$CD04]
    dec  b
    inc  c
    jr   z, label_EA96
    ld   a, $02
    call label_E4CA
    jr   c, label_EA93
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $17
    call label_C4B

label_EA93::
    jp   label_3F8D

label_EA96::
    ld   a, [$FFF1]
    push af
    ld   e, a
    ld   d, b
    xor  a
    ld   [$FFF1], a
    ld   hl, label_EA68
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_EA6C
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   de, label_EA66
    call label_3C77
    call label_3D8A
    pop  af
    ld   [$FFF1], a
    ld   de, label_EBC6
    call label_3BC0
    ld   a, $0C
    ld   [$C19E], a
    call label_F5A2
    jr   label_EADA
    call label_C05
    jr   nz, label_EAD4
    call label_EBDE

label_EAD4::
    ld   de, label_EBC6

label_EAD7::
    call label_3BC0

label_EADA::
    call label_FF78
    call label_C05
    jr   nz, label_EB4C
    call label_FF25
    call label_FCAB
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_EB42
    call label_C05
    ld   a, [$FFEB]
    cp   $04
    jr   nz, label_EAFF
    call label_C00
    ld   [hl], $30
    ret

label_EAFF::
    ld   [hl], $18
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    inc  a
    jr   z, label_EB13
    ld   a, $07
    ld   [$FFF2], a

label_EB13::
    call label_C50
    ld   a, [$FFEB]
    cp   $00
    jr   nz, label_EB31
    call label_EB2C
    ld   hl, $C240

label_EB22::
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    sra  a
    sra  a
    ld   [hl], a
    ret

label_EB2C::
    ld   hl, $C250
    jr   label_EB22

label_EB31::
    call label_EB43

label_EB34::
    ld   hl, $C240

label_EB37::
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    sra  a
    sra  a
    sra  a
    ld   [hl], a

label_EB42::
    ret

label_EB43::
    ld   hl, $C250
    jr   label_EB37

label_EB48::
    nop
    inc  bc
    ld   bc, $FE02
    ld   bc, label_320
    jp   label_3F8D
    ld   a, [$FFEB]
    cp   $0A
    jr   z, label_EB6E
    call label_C05
    srl  a
    srl  a
    srl  a
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_EB48
    add  hl, de
    ld   a, [hl]
    call label_3B0C

label_EB6E::
    call label_FF25
    jr   label_EB7B

label_EB73::
    ld   [bc], a
    ld   bc, label_202

label_EB77::
    ld   b, b
    ld   [label_C040], sp

label_EB7B::
    ld   a, [$FFF9]
    and  a
    jr   nz, label_EB8C
    call label_FF5E
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sub  a, $02
    ld   [hl], a
    ret

label_EB8C::
    ld   hl, $C470
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    and  a
    jr   z, label_EBAB
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_EBAB
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_EBAB
    and  $80
    jr   z, label_EBAA
    inc  [hl]
    inc  [hl]

label_EBAA::
    dec  [hl]

label_EBAB::
    ld   hl, label_EB73
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_EB77
    add  hl, de
    sub  a, [hl]
    and  $80
    jr   nz, label_EBC5
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_EBC5::
    ret

label_EBC6::
    ld   l, $21
    inc  l
    ld   hl, $012C
    ld   l, $01
    ld   a, [hli]
    ld   b, c
    ld   a, [hli]
    ld   h, c
    ld   a, [hli]
    ld   bc, label_212A

label_EBD6::
    ld   bc, label_300
    ld   [bc], a

label_EBDA::
    ld   [bc], a
    ld   a, [bc]
    ld   c, $06

label_EBDE::
    ld   a, [$C11C]
    cp   $02
    jr   nc, label_EC5A
    ld   a, [$FFA2]
    and  a
    jr   nz, label_EC5A
    ld   hl, $FFEE
    ld   a, [$FF98]
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   nc, label_EC5A
    ld   hl, $FFEC
    ld   a, [$FF99]
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   nc, label_EC5A
    ld   a, [$C15B]
    and  a
    jr   z, label_EC5B
    ld   a, [$FFEB]
    cp   $2B
    jr   nz, label_EC41
    ld   a, [$DB44]
    cp   $02
    jr   c, label_EC5B
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, label_EBDA
    add  hl, de
    ld   e, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    sub  a, e
    and  $0F
    cp   $05
    jr   nc, label_EC5B
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], $02
    ld   a, $07
    ld   [$FFF2], a
    ld   a, [$FFEF]

label_EC36::
    ld   [$FFD8], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, $05
    jp   label_CC7

label_EC41::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_EBD6
    add  hl, de
    ld   a, [$FF9E]
    cp   [hl]
    jr   nz, label_EC5B
    ld   a, $16
    ld   [$FFF2], a

label_EC54::
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], $FF

label_EC5A::
    ret

label_EC5B::
    call label_ECC0
    ld   a, [$FFEB]
    cp   $2B
    jr   z, label_EC68
    cp   $0C
    jr   nz, label_EC54

label_EC68::
    jp   label_3F8D

label_EC6B::
    ld   a, [$FFE7]
    xor  c
    rra
    jp   nc, label_ECCB

label_EC72::
    ld   a, [$FFA2]
    and  a
    jr   nz, label_EC5A

label_EC77::
    ld   a, [$C11C]
    cp   $02
    jr   nc, label_EC5A
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    pop  bc
    ld   a, [$FFEE]
    add  a, [hl]
    push hl
    ld   hl, $FF98
    sub  a, [hl]
    sub  a, $08
    cp   $80
    jr   c, label_EC98
    cpl
    inc  a

label_EC98::
    pop  hl
    push af
    inc  hl
    ld   a, $04
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jp   nc, label_ECCB
    inc  hl
    ld   a, [$FFEC]
    add  a, [hl]
    push hl
    ld   hl, $FF99
    sub  a, [hl]
    sub  a, $08
    cp   $80
    jr   c, label_ECB5
    cpl
    inc  a

label_ECB5::
    pop  hl
    push af
    inc  hl
    ld   a, $04
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jr   nc, label_ECCB

label_ECC0::
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_ECCD

label_ECC9::
    scf
    ret

label_ECCB::
    and  a
    ret

label_ECCD::
    ld   a, [$FF9D]
    sub  a, $4E
    cp   $02
    jr   c, label_ECC9

label_ECD5::
    ld   a, [$FFEB]
    cp   $AC
    jr   nz, label_ECF9
    call label_FEE9
    ld   a, e
    cp   $02
    jr   nz, label_ED3D
    call label_3B12
    ld   [hl], $05
    ld   a, $02
    ld   [$C146], a
    ld   a, $F0
    ld   [$FF9B], a
    call label_3D7F
    ld   a, $0E
    ld   [$FFF3], a
    ret

label_ECF9::
    ld   a, [$FFEB]
    cp   $9F
    jr   nz, label_ED3D
    ld   a, [$C146]
    and  a
    jr   z, label_ED3D
    ld   a, [$FFB7]
    and  a
    jr   nz, label_ED1B
    ld   a, [$FFF9]
    and  a
    jr   nz, label_ED15
    ld   a, [$FFA3]
    xor  $80
    jr   label_ED17

label_ED15::
    ld   a, [$FF9B]

label_ED17::
    and  $80
    jr   nz, label_ED3D

label_ED1B::
    ld   a, $02
    ld   [$FFB7], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $02
    call label_C05
    ld   [hl], $30
    ld   a, $0E
    ld   [$FFF3], a
    ld   a, [$FFF9]
    and  a
    jr   nz, label_ED38
    ld   a, $10
    ld   [$FFA3], a
    ret

label_ED38::
    ld   a, $F0
    ld   [$FF9B], a
    ret

label_ED3D::
    ld   a, [$FFEB]
    cp   $1C
    jr   nz, label_ED4E
    call label_C05
    ld   [hl], $80
    call label_3B12
    ld   [hl], $04
    ret

label_ED4E::
    cp   $8E
    jr   z, label_ED5D
    cp   $82
    jr   z, label_ED5D
    ld   a, [$C13E]
    and  a
    jp   nz, label_EE0A

label_ED5D::
    ld   a, [$FFEB]
    cp   $E4
    jr   nz, label_ED73
    ld   a, [$FFF0]
    cp   $04
    jr   nz, label_ED73
    call label_3B12
    ld   [hl], $08
    ld   a, $03
    ld   [$FFF3], a
    ret

label_ED73::
    ld   a, [$DBC7]
    ld   hl, $C1C6
    or   [hl]
    ld   hl, $C166
    or   [hl]
    ld   hl, $C1A9
    or   [hl]
    jp   nz, label_EE0A
    ld   a, $03
    ld   [$FFF3], a
    ld   hl, $C4D0
    add  hl, bc
    ld   d, b
    ld   e, [hl]
    ld   hl, label_C7F1
    add  hl, de
    ld   e, [hl]
    ld   a, [$DC0F]
    cp   $02
    jr   z, label_EDA9
    ld   a, [$D47C]
    cp   $02
    jr   nz, label_EDAB
    ld   a, e
    cp   $04
    jr   nz, label_EDA9
    ld   e, $00

label_EDA9::
    srl  e

label_EDAB::
    ld   a, [$DB94]
    add  a, e
    ld   [$DB94], a
    ld   a, $50
    ld   [$DBC7], a
    xor  a
    ld   [$D471], a
    ld   a, [$D47C]
    and  a
    jr   z, label_EDDF
    ld   hl, $D47A
    inc  [hl]
    ld   a, [hl]
    cp   $03
    jr   c, label_EDDF
    xor  a
    ld   [$D47C], a
    ld   a, [$C1BE]
    and  a
    jr   nz, label_EDDF
    ld   a, [$FFB0]
    cp   $22
    jr   z, label_EDDD
    ld   [$D368], a

label_EDDD::
    ld   [$FFBF], a

label_EDDF::
    call label_CB6
    ld   a, $10
    ld   [$C13E], a
    ld   a, [$FFEB]
    ld   e, $18
    cp   $82
    jp   z, label_EFA7
    cp   $5A
    jr   nz, label_EDFA
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], $01

label_EDFA::
    cp   $59
    ld   a, $14
    jr   nz, label_EE02
    ld   a, $18

label_EE02::
    call label_F565
    ld   a, [$FFF9]
    and  a
    jr   nz, label_EE0E

label_EE0A::
    scf
    ret

label_EE0C::
    inc  c
    db   $F4 ; Undefined instruction

label_EE0E::
    ld   a, [$FF9C]
    cp   $02
    jr   z, label_EE0A
    call label_FED9
    ld   d, b
    ld   hl, label_EE0C
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   a, $F4
    ld   [$FF9B], a
    xor  a
    ld   [$FF9C], a
    scf
    ret

label_EE28::
    call label_EC6B

label_EE2B::
    ld   a, [$C140]
    cp   $00
    jp   z, label_F3E6
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_EE40
    cp   $18
    jp  c, label_F3E6

label_EE40::
    ld   a, [$C1AC]
    and  a
    jr   z, label_EE4B
    dec  a
    cp   c
    jp   z, label_F3E6

label_EE4B::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_F3E6
    ld   de, $FFEE
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    pop  bc
    ld   a, [de]
    add  a, [hl]
    push hl
    ld   hl, $C140
    sub  a, [hl]
    cp   $80
    jr   c, label_EE6E
    cpl
    inc  a

label_EE6E::
    pop  hl
    push af
    inc  hl
    ld   a, [$C141]
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jp   nc, label_F3E6
    inc  hl
    push hl
    ld   de, $FFEC
    pop  hl
    ld   a, [de]
    add  a, [hl]
    push hl
    ld   hl, $C142
    sub  a, [hl]
    cp   $80
    jr   c, label_EE8E
    cpl
    inc  a

label_EE8E::
    pop  hl
    push af
    inc  hl
    ld   a, [$C143]
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jp   nc, label_F3E6
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $20
    jp   nz, label_E311
    ld   a, [$C5B0]
    and  a
    jp   nz, label_EFE8
    ld   a, [$C14A]
    ld   [$FFE9], a
    call label_CB6
    ld   a, [$FFEB]
    cp   $E2
    jr   nz, label_EED1
    ld   a, [$DB44]
    cp   $02
    ret  nz
    ld   a, [$FF9E]
    cp   $02
    ret  nz
    ld   a, $04
    ld   [$FF9B], a
    ld   a, $08
    ld   [$C13E], a
    jp   label_3B12

label_EED1::
    cp   $55
    jr   nz, label_EEF7
    ld   a, [$FFF0]
    cp   $02
    jp   nz, label_EF93
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    call label_C05
    ld   [hl], $40
    call label_C00
    ld   [hl], $08
    ret

label_EEF7::
    cp   $51
    jr   nz, label_EF20
    ld   hl, $C430
    add  hl, bc
    and  $40
    jp   z, label_EF93

label_EF04::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    call label_EF5C
    call label_C00
    ld   [hl], $0C
    ld   a, $01
    ld   [$C160], a
    xor  a
    ld   [$C122], a
    jp   label_F13B

label_EF20::
    cp   $58
    jr   nz, label_EF2A

label_EF24::
    call label_EF93
    jp   label_EC54

label_EF2A::
    cp   $2C
    jr   nz, label_EF6D
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jr   z, label_EF5C
    ld   [hl], $03
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_C05
    ld   [hl], $FF
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, label_EF65
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_EF69
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_EF5C::
    call label_EF93
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b
    ret

label_EF65::
    db   $10 ; Undefined instruction
    nop
    nop

label_EF69::
    nop
    nop
    ld   a, [$FF10]

label_EF6D::
    cp   $9C
    jr   z, label_EF75
    cp   $15
    jr   nz, label_EF8E

label_EF75::
    ld   a, [$FF9E]
    and  $02
    jr   nz, label_EF81
    ld   hl, $C240
    add  hl, bc
    jr   label_EF85

label_EF81::
    ld   hl, $C250
    add  hl, bc

label_EF85::
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    call label_EF93
    ld   [hl], b
    ret

label_EF8E::
    cp   $5A
    jp   z, label_EF24

label_EF93::
    ld   a, $09
    ld   [$FFF2], a
    call label_CB6
    ld   a, $0C
    ld   [$C13E], a
    ld   a, [$FFEB]
    cp   $82
    jr   nz, label_EFB9
    ld   e, $10

label_EFA7::
    push de
    call label_FED9
    ld   a, e
    and  a
    pop  de
    ld   a, e
    jr   z, label_EFB3
    cpl
    inc  a

label_EFB3::
    ld   [$FF9A], a
    xor  a
    ld   [$FF9B], a
    ret

label_EFB9::
    ld   a, $12
    call label_F565
    ld   hl, $FFE9
    ld   a, [$FFCB]
    and  $0F
    ld   a, $08
    or   [hl]
    jr   z, label_EFCC
    ld   a, $20

label_EFCC::
    call label_FE45
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C400
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C3F0
    add  hl, bc
    ld   [hl], a
    jp   label_F3DB

label_EFE4::
    nop
    ld   bc, label_302

label_EFE8::
    ld   a, [$FFEB]
    cp   $E2
    ret  z
    cp   $E6
    jr   nz, label_F018
    ld   a, [$D219]
    rst  0
    ld   d, [hl]
    ld   c, e
    ld   bc, label_770
    ld   [hl], b
    ld   d, $70
    ld   d, $70
    ld   b, d
    ld   [hl], b
    call label_3B12
    ld   [hl], $06
    ret
    ld   a, [$C121]
    and  a
    jr   nz, label_F013
    ld   a, [$C16A]
    cp   $04
    ret  nc

label_F013::
    jp   label_3B12
    ld   a, [$FFEB]

label_F018::
    cp   $B9
    jr   nz, label_F042
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_F042
    call label_3B12
    ld   [hl], $01
    call label_C05
    ld   [hl], $40
    ld   a, $40
    ld   [$D464], a
    xor  a
    ld   [$C137], a
    ld   [$C16A], a
    ld   [$C121], a
    ld   a, $1C
    ld   [$FFF4], a
    jp   label_ECD5

label_F042::
    ld   a, [$FFEB]
    cp   $55
    jr   nz, label_F06F
    ld   a, $30
    call label_FE45
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_3B12
    ld   [hl], $02
    call label_C05
    ld   [hl], $40
    call label_C00
    ld   [hl], $08
    ret

label_F06F::
    cp   $65
    jr   nz, label_F07D
    call label_EDDF
    ld   a, $08
    ld   [$C13E], a
    jr   label_F0B9

label_F07D::
    cp   $5B
    jr   nz, label_F0B9
    ld   a, [$FFE8]
    and  a
    jr   nz, label_F0A9
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jp   nz, label_F09D
    ld   a, [$C14A]
    and  a
    jr   z, label_F102
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $0C
    ret

label_F09D::
    ld   a, [$C14A]
    and  a
    jr   z, label_F0AC
    call label_EDDF
    jp   label_F102

label_F0A9::
    jp   label_EDDF

label_F0AC::
    ld   a, $04
    ld   [$C13E], a
    ld   a, $10
    call label_F565
    jp   label_F102

label_F0B9::
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $40
    jr   z, label_F102
    ld   a, [$FFEB]
    cp   $51
    jp   z, label_EF04
    cp   $5C
    jr   nz, label_F0E7
    ld   a, [$DC0F]
    cp   $01
    jr   z, label_F0DD
    ld   a, [$D47C]
    cp   $01
    ld   a, $20
    jr   nz, label_F0DF

label_F0DD::
    ld   a, $30

label_F0DF::
    call label_EFCC
    ld   hl, $C420
    add  hl, bc
    ld   [hl], b

label_F0E7::
    ld   a, c
    inc  a
    ld   [$C1AC], a
    call label_D07
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $10
    ld   hl, $C3F0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C400
    add  hl, bc
    ld   [hl], b
    jp   label_EDDF

label_F102::
    ld   a, [$FFEB]
    cp   $8E
    jr   nz, label_F10D
    call label_CB6
    jr   label_F14D

label_F10D::
    cp   $24
    jr   nz, label_F146
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_F146
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, label_EFE4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    cp   [hl]
    jr   z, label_F14D
    call label_CB6
    ld   a, $10
    ld   [$C13E], a
    ld   a, $10
    call label_F565
    ld   a, $10
    call label_EFCC

label_F13B::
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    jp   label_D15

label_F146::
    ld   a, [$FFEB]
    cp   $15
    jp   z, label_F3E6

label_F14D::
    ld   a, $01
    ld   [$C160], a
    ld   a, [$C16A]
    cp   $05
    jr   nz, label_F15E
    ld   a, $0C
    ld   [$C16D], a

label_F15E::
    xor  a
    ld   [$C122], a
    ld   a, $30
    call label_EFCC
    ld   hl, $FFF2
    ld   [hl], $09
    ld   a, [$DC0F]
    cp   $01
    jr   z, label_F17A
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_F19D

label_F17A::
    call label_F19D
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $20
    ld   hl, $C4A0
    add  hl, bc
    ld   [hl], $01
    ld   a, $11
    ld   [$FFF3], a
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    cp   $01
    jr   nz, label_F19C
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $40

label_F19C::
    ret

label_F19D::
    ld   a, c
    inc  a
    ld   [$C1AC], a
    ld   a, [$DC0F]
    and  $01
    jr   nz, label_F1AE
    ld   a, [$D47C]
    and  $01

label_F1AE::
    ld   hl, $C121
    or   [hl]
    ld   hl, $C14A
    or   [hl]
    ld   a, [$DB4E]
    jr   z, label_F1BC
    inc  a

label_F1BC::
    dec  a
    ld   [$C19E], a

label_F1C0::
    ld   hl, $C4D0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, label_C3EC
    add  hl, de
    ld   a, [$C19E]
    ld   e, a
    ld   d, b
    add  hl, de
    ld   e, [hl]
    push de
    ld   a, [$C19E]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   hl, label_C73C
    add  hl, de
    pop  de
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    push af
    ld   a, [$FFEB]
    cp   $E6
    jr   nz, label_F215
    ld   a, [$D219]
    cp   $04
    jr   nz, label_F215
    ld   a, [$C14A]
    push af
    call label_EDDF
    pop  af
    and  a
    jr   nz, label_F215
    ld   a, [$C121]
    and  a
    jr   nz, label_F215
    pop  af
    ret

label_F215::
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    ld   hl, $FFF2
    ld   [hl], $03
    and  $80
    jr   z, label_F228
    ld   hl, $FFF3
    ld   [hl], $07

label_F228::
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    cp   $6C
    jr   nz, label_F235
    ld   a, $13
    ld   [$FFF3], a

label_F235::
    pop  af
    cp   $F0
    jr   c, label_F2B5
    cp   $FE
    jr   nz, label_F260
    ld   hl, $FFF4
    ld   [hl], $12
    call label_F3DB
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $03
    call label_C05
    ld   [hl], $60
    ld   hl, $C340
    add  hl, bc
    inc  [hl]
    inc  [hl]
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $C2
    ld   [hl], a
    ret

label_F260::
    cp   $FF
    jr   nz, label_F279
    call label_F3DB

label_F267::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $06
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ret

label_F279::
    cp   $FD
    ret  nz
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    cp   $F8
    jr   z, label_F289
    cp   $B9
    jr   nz, label_F293

label_F289::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    inc  [hl]
    jr   label_F29D

label_F293::
    ld   [hl], $2F
    call label_C85B
    call label_BFB
    ld   [hl], $80

label_F29D::
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C310
    add  hl, bc
    sub  a, [hl]
    ld   [$FFD8], a
    ld   a, $02
    jp   label_CC7

label_F2B5::
    ld   e, a
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    sub  a, e
    ld   [hl], a
    jr   c, label_F2C2
    jp   nz, label_F3B6

label_F2C2::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_F33E
    bit  2, a
    jr   nz, label_F304
    ld   e, $0F
    ld   d, b

label_F2D8::
    ld   a, e
    cp   c
    jr   z, label_F2EE
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   nz, label_F2EE
    ld   hl, $C430
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   nz, label_F304

label_F2EE::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_F2D8
    ld   a, [$DBAF]
    push af
    ld   a, $03
    call label_80C
    call label_27F2
    pop  af
    ld   [$DBAF], a

label_F304::
    ld   a, $03
    ld   [$C5A7], a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    ld   e, $B7
    cp   $5A
    jr   z, label_F325
    ld   e, $B9
    cp   $63
    jr   z, label_F330
    ld   e, $BD
    cp   $62
    jr   nz, label_F33E

label_F325::
    ld   a, e
    call label_2385
    ld   a, $5E
    ld   [$D368], a
    jr   label_F33E

label_F330::
    ld   a, [$FF99]
    push af
    ld   a, $10
    ld   [$FF99], a
    ld   a, e
    call label_2385
    pop  af
    ld   [$FF99], a

label_F33E::
    call label_3B12
    ld   [hl], b
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $2F
    ld   hl, $C420
    add  hl, bc
    xor  a
    ld   [hl], a
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_F361
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $F0
    or   $04
    ld   [hl], a

label_F361::
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    cp   $12
    jr   nz, label_F3B6
    ld   e, $0F
    ld   d, b

label_F36D::
    ld   a, e
    cp   c
    jr   z, label_F3AA
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $10
    jr   z, label_F37E
    cp   $11
    jr   nz, label_F3AA

label_F37E::
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_F3AA
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_F3AA
    ld   [hl], $01
    ld   hl, $C480
    add  hl, de
    ld   [hl], $1F
    call label_280D
    and  $03
    push bc
    ld   c, a
    ld   b, $00
    ld   hl, label_F3E7
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C4E0
    add  hl, de
    ld   [hl], a
    pop  bc

label_F3AA::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_F36D
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], $2E

label_F3B6::
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C420
    add  hl, bc
    cp   $E6
    jr   nz, label_F3CC
    ld   a, [$D219]
    cp   $03
    jr   z, label_F3D0
    jr   label_F3D9

label_F3CC::
    cp   $59
    jr   nz, label_F3D9

label_F3D0::
    ld   [hl], $28
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $C8
    ret

label_F3D9::
    ld   [hl], $18

label_F3DB::
    ld   hl, $C4A0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $0A

label_F3E6::
    ret

label_F3E7::
    dec  l
    ld   l, $38
    scf
    ld   hl, $C1AC
    ld   a, [$C13E]
    or   [hl]
    ld   hl, $FFB6
    or   [hl]
    ld   hl, $C121
    or   [hl]
    jp   nz, label_F4E1
    ld   a, [$C140]
    cp   $00
    jp   z, label_F4E1
    ld   hl, $C380
    add  hl, bc
    ld   a, [$FF9E]
    cp   [hl]
    jp   z, label_F4E1
    ld   de, $FFEE
    ld   hl, $D5C0
    ld   a, [de]
    add  a, [hl]
    push hl
    ld   hl, $C140
    sub  a, [hl]
    cp   $80
    jr   c, label_F422
    cpl
    inc  a

label_F422::
    pop  hl
    push af
    inc  hl
    ld   a, [$C141]
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jp   nc, label_F4E1
    inc  hl
    ld   de, $FFEC
    ld   a, [de]
    add  a, [hl]
    push hl
    ld   hl, $C142
    sub  a, [hl]
    cp   $80
    jr   c, label_F440
    cpl
    inc  a

label_F440::
    pop  hl
    push af
    inc  hl
    ld   a, [$C143]
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jp   nc, label_F4E1
    call label_CB6
    ld   a, $08
    ld   [$C13E], a
    ld   a, $12
    call label_F565
    ld   a, $18
    call label_FE45
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C400
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C3F0
    add  hl, bc
    ld   [hl], a
    call label_F3DB
    ld   [hl], $08
    xor  a
    ld   [$C122], a
    call label_C50
    ld   hl, $C121
    ld   a, [$C16A]
    or   [hl]
    jr   z, label_F48B
    ld   a, $0C
    ld   [$C16D], a

label_F48B::
    ld   a, [$FFEB]
    cp   $BE
    jr   nz, label_F4C1
    ld   a, $09
    ld   [$FFF2], a
    ld   a, [$D205]
    cp   $00
    jr   z, label_F4BF
    cp   $01
    jr   z, label_F4B5
    cp   $04
    jr   z, label_F4B5
    cp   $03
    jp   z, label_F571
    ld   a, $20
    ld   [$C13E], a
    ld   a, $20
    call label_F565
    jr   label_F4DC

label_F4B5::
    ld   a, $10
    ld   [$C13E], a
    ld   a, $20
    call label_F565

label_F4BF::
    jr   label_F4DC

label_F4C1::
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, label_F4E4
    add  hl, de
    ld   a, [$C140]
    add  a, [hl]
    ld   [$FFD7], a
    ld   hl, label_F4E8
    add  hl, de
    ld   a, [$C142]
    add  a, [hl]
    ld   [$FFD8], a
    call label_D15

label_F4DC::
    ld   a, $0C
    ld   [$FFB6], a
    ret

label_F4E1::
    jp   label_F4EC

label_F4E4::
    nop
    ld   a, [$FFF8]
    db   $FC ; Undefined instruction

label_F4E8::
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FF00]

label_F4EC::
    ld   a, [$FFE7]
    xor  c
    rra
    jr   nc, label_F570
    ld   a, [$FF98]
    add  a, $08
    ld   [$FFD7], a
    ld   a, [$FF99]
    add  a, $08
    ld   [$FFD9], a
    ld   de, $FFEE
    ld   hl, $D5C0
    ld   a, [de]
    add  a, [hl]
    push hl
    ld   hl, $FFD7
    sub  a, [hl]
    cp   $80
    jr   c, label_F511
    cpl
    inc  a

label_F511::
    pop  hl
    push af
    inc  hl
    ld   a, $04
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jr   nc, label_F570
    inc  hl
    ld   de, $FFEC
    ld   a, [de]
    add  a, [hl]
    push hl
    ld   hl, $FFD9
    sub  a, [hl]
    cp   $80
    jr   c, label_F52D
    cpl
    inc  a

label_F52D::
    pop  hl
    push af
    inc  hl
    ld   a, $05
    add  a, [hl]
    ld   e, a
    pop  af
    cp   e
    jr   nc, label_F570
    ld   a, [$DBC7]
    and  a
    jr   nz, label_F570
    call label_ECD5
    ld   a, [$FFEB]
    cp   $BE
    jr   nz, label_F570
    ld   a, [$D205]
    and  a
    jr   z, label_F570
    cp   $01
    jr   z, label_F570
    cp   $04
    jr   z, label_F570
    cp   $02
    jr   nz, label_F571
    call label_C00
    ld   [hl], $A0
    ld   a, $20
    ld   [$C13E], a
    ld   a, $30

label_F565::
    call label_FE45
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a

label_F570::
    ret

label_F571::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $22
    jr   c, label_F570
    ld   a, $0A
    ld   [$C11C], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   a, $30
    jr   z, label_F58B
    ld   a, $D0

label_F58B::
    ld   [$FF9A], a
    xor  a
    ld   [$FF9B], a
    ld   a, $30
    ld   [$FFA3], a
    ld   a, $0B
    ld   [$FFF2], a
    ret
    ld   a, $20
    ld   [$C13E], a
    ld   a, $20
    jr   label_F565

label_F5A2::
    ld   e, $0F
    ld   d, $00

label_F5A6::
    ld   a, e
    cp   c
    jp   z, label_F79F
    ld   a, [$FFE7]
    xor  e
    and  $01
    jp   nz, label_F79F
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jp  c, label_F79F
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $40
    jp   nz, label_F79F
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jp   nc, label_F79F
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   hl, $C310
    add  hl, de
    sub  a, [hl]
    ld   hl, $FFEC
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jp   nc, label_F79F
    ld   hl, $C3B0
    add  hl, de
    ld   a, [hl]
    cp   $FF
    jp   z, label_F79F
    ld   a, [$FFEB]
    cp   $55
    jr   nz, label_F5FE
    call label_C05
    ld   [hl], b

label_F5FE::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $55
    jr   nz, label_F630
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $40
    ld   hl, $C290
    add  hl, de
    ld   [hl], $02
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $08
    jp   label_F79F

label_F630::
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $20
    jp   nz, label_F715
    ld   a, [$FFEB]
    cp   $08
    jr   z, label_F668
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $E6
    jr   nz, label_F656
    ld   a, [$D219]
    cp   $05
    jr   nz, label_F656
    ld   a, [$FFF1]
    cp   $02
    jr   nz, label_F65F

label_F656::
    ld   hl, $C350
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   z, label_F668

label_F65F::
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], $01
    jp   label_F737

label_F668::
    ld   a, [$FFEB]
    cp   $08
    jr   nz, label_F6AC
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $CA
    jr   nz, label_F680
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_F6AC
    inc  [hl]

label_F680::
    cp   $3F
    jr   nz, label_F6AC
    ld   a, [$DBA5]
    and  a
    jr   nz, label_F6AC
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_F6AC
    inc  [hl]
    ld   hl, $C450
    add  hl, de
    ld   [hl], $7F
    ld   hl, $C420
    add  hl, de
    ld   [hl], $10
    ld   a, $03
    ld   [$DBAF], a
    call label_27F2
    ld   a, $18
    ld   [$DBAF], a

label_F6AC::
    ld   hl, $C350
    add  hl, de
    ld   a, [hl]
    and  $80
    jp   nz, label_F79F
    ld   hl, $C410
    add  hl, de
    ld   a, [hl]
    and  a
    jp   nz, label_F79F
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $24
    jr   nz, label_F710
    ld   hl, $C380
    add  hl, de
    ld   a, [hl]
    xor  $01
    ld   hl, $C380
    add  hl, bc
    cp   [hl]
    jr   nz, label_F710
    ld   hl, $C2C0
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_F710
    ld   a, [$FFEB]
    cp   $03
    jp   nz, label_F65F
    ld   [hl], $01
    push de
    ld   a, $32
    call label_E4CA
    jr   c, label_F70D
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C390
    add  hl, de
    ld   a, c
    inc  a
    ld   [hl], a
    ld   a, [$FFD9]
    and  $01
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a

label_F70D::
    pop  de
    jr   label_F737

label_F710::
    call label_F7A7
    jr   label_F737

label_F715::
    ld   a, [$FFEB]
    cp   $01
    jr   z, label_F71F
    cp   $03
    jr   nz, label_F734

label_F71F::
    call label_C05
    xor  a
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $20
    jr   z, label_F737
    ld   a, c
    inc  a
    ld   hl, $C390
    add  hl, de
    ld   [hl], a

label_F734::
    jp   label_F79F

label_F737::
    ld   a, [$FFEB]
    cp   $A8
    jr   z, label_F75A
    cp   $01
    jr   z, label_F79A
    cp   $03
    jr   z, label_F79A
    cp   $05
    jr   nz, label_F751
    push de
    call label_D3E4
    pop  de
    jp   label_F79F

label_F751::
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   nz, label_F782

label_F75A::
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_F79F
    ld   [hl], $0C
    ld   hl, $C240
    add  hl, bc
    sra  [hl]
    sra  [hl]
    ld   a, [hl]
    cpl
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    sra  [hl]
    sra  [hl]
    ld   a, [hl]
    cpl
    ld   [hl], a
    ld   hl, $C5D0
    add  hl, bc
    ld   [hl], $FF
    jr   label_F79A

label_F782::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_F79A
    ld   a, [$FFEB]
    cp   $00
    jr   nz, label_F795
    ld   a, [$FFF0]
    and  a
    jr   nz, label_F798

label_F795::
    call label_3F8D

label_F798::
    jr   label_F79F

label_F79A::
    call label_C05
    xor  a
    ld   [hl], a

label_F79F::
    dec  e
    ld   a, e
    cp   $FF
    jp   nz, label_F5A6
    ret

label_F7A7::
    ld   a, [$FFEB]
    cp   $00
    jr   nz, label_F7B8
    ld   a, [$FFF0]
    and  a
    jr   z, label_F7B8
    call label_C05
    ld   [hl], $03
    ret

label_F7B8::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C3F0
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C400
    add  hl, de
    ld   [hl], a
    push bc
    ld   c, e
    ld   b, d
    push de
    call label_F7D6
    pop  de
    pop  bc
    ret

label_F7D6::
    jp   label_F1C0

label_F7D9::
    ld   e, $0F
    ld   d, $00

label_F7DD::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   c, label_F834
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $60
    jr   nz, label_F834
    ld   hl, $C350
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   nz, label_F834
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $18
    cp   $30
    jr   nc, label_F834
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   hl, $C310
    add  hl, de
    sub  a, [hl]
    ld   hl, $FFEC
    sub  a, [hl]
    add  a, $18
    cp   $30
    jr   nc, label_F834
    ld   a, $07
    ld   [$C19E], a
    call label_F7A7
    ld   a, $30
    call label_F83B
    ld   hl, $C400
    add  hl, de
    ld   a, [$FFD7]
    ld   [hl], a
    ld   hl, $C3F0
    add  hl, de
    ld   a, [$FFD8]
    ld   [hl], a

label_F834::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_F7DD
    ret

label_F83B::
    ld   [$FFD7], a
    ld   a, [$FF98]
    push af
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    ld   [$FF98], a
    ld   a, [$FF99]
    push af
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   [$FF99], a
    push de
    ld   a, [$FFD7]
    call label_FE45
    pop  de
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    ret

label_F85F::
    dec  c
    ld   [bc], a
    ld   [label_A08], sp
    ld   b, $08
    ld   [rNR10], sp
    ld   [label_D08], sp
    ld   [bc], a
    ld   [label_808], sp
    ld   [label_D02], sp
    ld   [label_608], sp
    ld   a, [bc]
    ld   [$FF08], sp
    db   $10 ; Undefined instruction
    ld   [label_D02], sp

label_F87F::
    ld   bc, label_402
    ld   [$0000], sp
    rst  $38
    ld   bc, rSB
    ld   bc, label_1FF
    rst  $38
    nop
    nop
    ld   bc, rSB
    rst  $38

label_F893::
    ld   hl, $C470
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    xor  a
    ld   [hl], a
    ld   [$FFD8], a
    ld   [$C503], a
    ld   [$C50D], a
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   nz, label_F8B1
    and  a
    jp   nz, label_FA18

label_F8B1::
    ld   hl, $C4F0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    bit  4, a
    jp   nz, label_FA18
    call label_FE0E
    jr   label_F8E3

label_F8C5::
    ld   e, $02
    ld   a, [$FFEB]
    cp   $CC
    jr   z, label_F907
    cp   $A0
    jr   z, label_F907
    cp   $D5
    jr   z, label_F907
    cp   $6D
    jr   z, label_F907
    cp   $C1
    jr   z, label_F907
    call label_3F8D
    jp   label_F95C

label_F8E3::
    ld   e, $01
    ld   a, [$FFAF]
    cp   $67
    jr   z, label_F907
    ld   a, [$FFDA]
    and  a
    jp   z, label_FA18
    cp   $0B
    jr   z, label_F8C5
    cp   $07
    jr   z, label_F8C5
    cp   $B0
    jr   z, label_F907
    inc  e
    cp   $05
    jr   z, label_F907
    cp   $06
    jr   nz, label_F90C
    inc  e

label_F907::
    ld   hl, $C470
    add  hl, bc
    ld   [hl], e

label_F90C::
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $08
    jr   z, label_F973
    ld   hl, $C470
    add  hl, bc
    ld   a, [$FFD7]
    cp   [hl]
    jr   z, label_F973
    ld   a, [hl]
    cp   $03
    jr   z, label_F973
    ld   a, [$FFD7]
    cp   $03
    jr   z, label_F973
    ld   a, [$FFF9]
    and  a
    jr   nz, label_F93D
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_F973
    cp   $E7
    jr   nc, label_F973
    jr   label_F954

label_F93D::
    ld   a, [$FFEB]
    cp   $AC
    jr   z, label_F954
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   nz, label_F954
    ld   [hl], $00
    ld   hl, $C240
    add  hl, bc
    sra  [hl]

label_F954::
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_F973

label_F95C::
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, $01
    call label_CC7

label_F973::
    ld   a, [$FFDA]
    inc  a
    cp   $F1
    jr   c, label_F99C
    sub  a, $F1
    ld   e, a
    ld   d, b
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_F99A
    ld   hl, label_F883
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_F88B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    add  a, [hl]
    ld   [hl], a

label_F99A::
    jr   label_FA18

label_F99C::
    ld   a, [$FFAF]
    cp   $61
    jr   z, label_F9AC
    ld   a, [$FFDA]
    cp   $50
    jr   z, label_F9AC
    cp   $51
    jr   nz, label_FA18

label_F9AC::
    ld   a, [$FFEB]
    cp   $6D
    jr   z, label_FA18
    cp   $D5
    jr   z, label_FA18
    cp   $36
    jr   z, label_FA18
    cp   $C1
    jr   nz, label_F9CB
    ld   a, [$C11C]
    cp   $06
    jr   nz, label_FA18
    ld   a, [$FFAF]
    cp   $61
    jr   nz, label_FA18

label_F9CB::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_FA18
    dec  [hl]
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $02
    ld   a, [$FFCE]
    add  a, $08
    ld   hl, $C4B0
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFCD]
    add  a, $10
    ld   hl, $C4C0
    add  hl, bc
    ld   [hl], a
    call label_C05
    ld   [hl], $6F
    ld   a, [$FFEB]
    cp   $14
    jr   z, label_FA18
    cp   $0B
    jr   z, label_FA18
    cp   $09
    jr   z, label_FA18
    ld   [hl], $48
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_FA18
    call label_C05
    ld   [hl], $2F
    ld   a, $18
    ld   [$FFF2], a

label_FA18::
    ld   a, [$FFEB]
    cp   $6D
    jp   z, label_FA84
    xor  a
    ld   [$C503], a
    ld   hl, $C350
    add  hl, bc
    ld   a, [hl]
    and  $03
    sla  a
    sla  a
    ld   [$FFD7], a
    ld   hl, $C2A0
    add  hl, bc
    xor  a
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cp   $00
    jr   z, label_FA5D
    ld   de, $0000
    and  $80
    jr   z, label_FA47
    inc  e

label_FA47::
    call label_FACD
    jr   c, label_FA5D
    ld   a, [$FFAF]
    ld   [$C503], a
    ld   a, [$FFBE]
    and  a
    jr   nz, label_FA5D
    ld   hl, $C200
    add  hl, bc
    ld   a, [$FFEE]
    ld   [hl], a

label_FA5D::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $00
    jr   z, label_FA84
    ld   de, $0002
    and  $80
    jr   nz, label_FA6E
    inc  e

label_FA6E::
    call label_FACD
    jr   c, label_FA84
    ld   a, [$FFAF]
    ld   [$C50D], a
    ld   a, [$FFBE]
    and  a
    jr   nz, label_FA84
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FFEF]
    ld   [hl], a

label_FA84::
    ret

label_FA85::
    ld   bc, $0100
    nop
    nop
    ld   bc, $0100
    ld   bc, $0001
    nop
    nop
    nop
    ld   bc, $0101
    nop
    ld   bc, $0000
    ld   bc, $0100
    ld   bc, $0001
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0100
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    ld   bc, $0000
    nop
    nop
    ld   bc, $0100
    ld   bc, $0100
    nop
    nop
    ld   bc, label_21C5
    nop
    jp   nz, label_FE09
    sub  a, $08
    push af
    ld   a, [$FFD7]
    ld   c, a
    pop  af
    ld   hl, label_F85F
    add  hl, bc
    add  hl, de
    add  a, [hl]
    ld   [$FFDB], a
    swap a
    and  $0F
    ld   [$FFD8], a
    pop  bc
    push bc
    ld   a, e
    cp   $03
    jr   nz, label_FB0E
    ld   a, [$FFEB]
    cp   $A8
    jr   z, label_FAF9
    cp   $05
    jr   nz, label_FB0E

label_FAF9::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   c, [hl]
    bit  7, c
    jr   z, label_FB09
    ld   c, $00

label_FB09::
    srl  c
    sub  a, c
    jr   label_FB13

label_FB0E::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]

label_FB13::
    sub  a, $10
    push af
    ld   a, [$FFD7]
    ld   c, a
    pop  af
    ld   hl, label_F86F
    add  hl, bc
    add  hl, de
    add  a, [hl]
    ld   [$FFDC], a
    and  $F0
    ld   hl, $FFD8
    or   [hl]
    ld   c, a
    ld   hl, $D711
    ld   a, h
    add  hl, bc
    ld   h, a
    pop  bc
    ld   a, [hl]
    ld   [$FFAF], a
    cp   $20
    jp   z, label_FC7B
    push de
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A2C
    pop  de
    ld   [$FFDA], a
    ld   a, [$FFEB]
    cp   $CC
    jr   z, label_FB4E
    cp   $99
    jr   nz, label_FB5D

label_FB4E::
    ld   a, [$FFDA]
    cp   $05
    jp   z, label_FCA7
    cp   $07
    jp   z, label_FCA7
    jp   label_FC75

label_FB5D::
    ld   a, [$FFDA]
    and  a
    jp   z, label_FCA7
    cp   $0B
    jr   z, label_FB6F
    cp   $50
    jr   z, label_FB6F
    cp   $51
    jr   nz, label_FB8B

label_FB6F::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_FCA7
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   z, label_FC75
    ld   a, [$FFEB]
    cp   $59
    jp   z, label_FC75
    jp   label_FCA7

label_FB8B::
    cp   $7C
    jp  c, label_FBE4
    cp   $90
    jp   nc, label_FBE4
    cp   $80
    ld   a, [$FFEB]
    jr   c, label_FBA7
    cp   $A8
    jp   z, label_FCA7
    cp   $02
    jp   z, label_FCA7
    jr   label_FBBB

label_FBA7::
    cp   $16
    jp   z, label_FC9A
    cp   $17
    jp   z, label_FC9A
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $80
    jp   nz, label_FC9A

label_FBBB::
    push de
    ld   a, [$FFDA]
    sub  a, $7C
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_FA85
    add  hl, de
    ld   a, [$FFDB]
    rra
    rra
    rra
    and  $01
    ld   e, a
    ld   a, [$FFDC]
    rra
    rra
    and  $02
    or   e
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    pop  de
    and  a
    jp   z, label_FCA7

label_FBE4::
    ld   a, [$FFDA]
    cp   $D0
    jr   c, label_FC2B
    cp   $D4
    jr   nc, label_FC2B
    sub  a, $D0
    ld   hl, $C5D0
    add  hl, bc
    cp   [hl]
    jr   z, label_FC1A
    ld   a, [$FFEB]
    cp   $A8
    jr   z, label_FC75
    ld   hl, $C4F0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_FC75
    ld   a, [$FFE7]
    and  $03
    jr   z, label_FC28
    ld   a, [$DBA5]
    and  a
    jr   nz, label_FC17
    ld   a, [$FFE7]
    and  $01
    jr   z, label_FC28

label_FC17::
    dec  [hl]
    jr   label_FC28

label_FC1A::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   z, label_FC75
    ld   hl, $C4F0
    add  hl, bc
    inc  [hl]

label_FC28::
    jp   label_FCA7

label_FC2B::
    cp   $FF
    jr   z, label_FC9A
    cp   $A0
    jr   nc, label_FCA7
    cp   $10
    jr   nc, label_FC75
    cp   $01
    jr   z, label_FC91
    cp   $03
    jr   z, label_FC91
    cp   $04
    jr   nz, label_FCA7
    ld   a, [$FFEB]
    cp   $A8
    jp   z, label_FCA7
    cp   $02
    jp   z, label_FCA7
    cp   $03
    jr   nz, label_FC5A
    ld   a, [$D6F9]
    and  a
    jp   nz, label_FCA7

label_FC5A::
    ld   a, [$FFAF]
    cp   $DB
    jr   c, label_FC9A
    cp   $DD
    jr   nc, label_FC9A
    push de
    sub  a, $DB
    ld   e, a
    ld   d, $00
    ld   hl, label_FCA9
    add  hl, de
    pop  de
    ld   a, [$D6FB]
    xor  [hl]
    jr   z, label_FCA7

label_FC75::
    ld   a, [$FFDA]
    cp   $60
    jr   nz, label_FC91

label_FC7B::
    ld   a, [$FFEB]
    cp   $03
    jr   nz, label_FC91
    call label_C05
    cp   $26
    jr   c, label_FC8B
    call label_3F8D

label_FC8B::
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01

label_FC91::
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $01
    jr   nz, label_FCA7

label_FC9A::
    ld   hl, label_F87F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2A0
    add  hl, bc
    or   [hl]
    ld   [hl], a
    and  a
    ret

label_FCA7::
    scf
    ret

label_FCA9::
    nop
    ld   [bc], a

label_FCAB::
    ld   de, $0000
    push bc
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFDB], a
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   hl, $C210
    add  hl, bc
    ld   c, a
    ld   a, [hl]
    sub  a, $08
    ld   [$FFDC], a
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   c, a
    ld   [$FFE9], a
    ld   b, $00
    ld   hl, $D711
    ld   a, h
    add  hl, bc
    ld   h, a
    pop  bc
    ld   a, [hl]
    ld   [$FFAF], a
    cp   $AC
    jp   z, label_FE03
    cp   $AB
    jp   nz, label_FD6B
    ld   a, [$FFFE]
    and  a
    jr   z, label_FCFD
    ld   a, [$C11C]
    cp   $05
    ret  z
    ld   a, [$DDD6]
    and  a
    jp   nz, label_FE03
    ld   a, [$C124]
    and  a
    jp   nz, label_FE03

label_FCFD::
    ld   a, [$FFEB]
    cp   $04
    jr   nz, label_FD6B
    ld   a, [$DBA5]
    and  a
    jr   z, label_FD6B
    push hl
    ld   a, $12
    ld   [$FFF4], a
    ld   a, $08
    call label_E4CA
    jr   c, label_FD6A
    pop  hl
    ld   a, $AC
    ld   [hl], a
    ld   [$DDD8], a
    push bc
    ld   c, e
    ld   b, d
    ld   d, h
    ld   e, l
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], d
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], e
    ld   a, [$FFCE]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFCD]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01
    call label_BFB
    ld   [hl], $80
    pop  bc
    ld   hl, $C1A2
    inc  [hl]
    ld   a, [$C3CD]
    and  a
    jr   z, label_FD63
    sub  a, $04
    ld   [$C3CD], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_FD63
    ld   a, $40
    ld   [$DDD6], a
    ld   a, $0B
    ld   [$DDD7], a

label_FD63::
    ld   de, label_E9A2
    push de
    jp   label_D1F5

label_FD6A::
    pop  hl

label_FD6B::
    ld   a, [hl]
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A2C
    ld   [$FFD8], a
    and  a
    jp   z, label_FE03
    ld   [$FFDA], a
    cp   $FF
    jp   z, label_FE05
    cp   $D0
    jr   c, label_FDC0
    cp   $D4
    jr   nc, label_FDC0
    sub  a, $D0
    ld   hl, $C5D0
    add  hl, bc
    cp   [hl]
    jr   z, label_FDB0
    ld   hl, $C4F0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_FDE3
    ld   a, [$FFE7]
    and  $03
    jr   z, label_FE03
    ld   a, [$DBA5]
    and  a
    jr   nz, label_FDAC
    ld   a, [$FFE7]
    and  $01
    jr   z, label_FE03

label_FDAC::
    dec  [hl]
    jp   label_FE03

label_FDB0::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_FDE3
    ld   hl, $C4F0
    add  hl, bc
    inc  [hl]
    jp   label_FE03

label_FDC0::
    cp   $7C
    jp  c, label_FDCD
    cp   $90
    jp   nc, label_FDCD
    jp   label_FE03

label_FDCD::
    ld   a, [$FFDA]
    cp   $A0
    jr   nc, label_FE03
    cp   $50
    jr   z, label_FE03
    cp   $51
    jr   z, label_FE03
    cp   $10
    jr   nc, label_FDE3
    cp   $01
    jr   nz, label_FE03

label_FDE3::
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], $01
    ld   a, [$FFEB]
    cp   $01
    jr   nz, label_FDF3
    call label_C05
    ret  z

label_FDF3::
    ld   hl, $C200
    add  hl, bc
    ld   a, [$FFEE]
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FFEF]
    ld   [hl], a
    scf
    ret

label_FE03::
    and  a
    ret

label_FE05::
    ld   a, [$FFEB]
    cp   $01

label_FE09::
    jr   z, label_FDE3
    jp   label_3F8D

label_FE0E::
    push bc
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $01
    ld   [$FFDB], a
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   hl, $C210
    add  hl, bc
    ld   c, a
    ld   a, [hl]
    sub  a, $07
    ld   [$FFDC], a
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   c, a
    ld   b, $00
    ld   hl, $D711
    ld   a, h
    add  hl, bc
    ld   h, a
    pop  bc
    ld   a, [hl]
    ld   [$FFAF], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A2C
    ld   [$FFDA], a
    ret

label_FE45::
    ld   [$FFD8], a
    and  a
    jp   z, label_FEC3
    call label_FEE9
    dec  e
    dec  e
    ld   a, e
    ld   [$FFD9], a
    ld   a, d
    bit  7, a
    jr   z, label_FE5A
    cpl
    inc  a

label_FE5A::
    ld   [$FFE3], a
    call label_FED9
    ld   a, e
    ld   [$FFDA], a
    ld   a, d
    bit  7, a
    jr   z, label_FE69
    cpl
    inc  a

label_FE69::
    ld   [$FFE4], a
    ld   e, $00
    ld   hl, $FFE3
    ld   a, [$FFE4]
    cp   [hl]
    jr   nc, label_FE7E
    inc  e
    push af
    ld   a, [$FFE3]
    ld   [$FFE4], a
    pop  af
    ld   [$FFE3], a

label_FE7E::
    xor  a
    ld   [$FFE2], a
    ld   [$FFD7], a
    ld   a, [$FFD8]
    ld   d, a

label_FE86::
    ld   a, [$FFE2]
    ld   hl, $FFE3
    add  a, [hl]
    jr   c, label_FE94
    ld   hl, $FFE4
    cp   [hl]
    jr   c, label_FE99

label_FE94::
    sub  a, [hl]
    ld   hl, $FFD7
    inc  [hl]

label_FE99::
    ld   [$FFE2], a
    dec  d
    jr   nz, label_FE86
    ld   a, e
    and  a
    jr   z, label_FEAC
    ld   a, [$FFD7]
    push af
    ld   a, [$FFD8]
    ld   [$FFD7], a
    pop  af
    ld   [$FFD8], a

label_FEAC::
    ld   a, [$FFD9]
    and  a
    ld   a, [$FFD7]
    jr   nz, label_FEB7
    cpl
    inc  a
    ld   [$FFD7], a

label_FEB7::
    ld   a, [$FFDA]
    and  a
    ld   a, [$FFD8]
    jr   z, label_FEC2
    cpl
    inc  a
    ld   [$FFD8], a

label_FEC2::
    ret

label_FEC3::
    xor  a
    ld   [$FFD7], a
    ret

label_FEC7::
    call label_FE45
    ld   a, [$FFD7]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ret

label_FED9::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_FEE7
    inc  e

label_FEE7::
    ld   d, a
    ret

label_FEE9::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    ld   hl, $C310
    add  hl, bc
    add  a, [hl]
    bit  7, a
    jr   nz, label_FEFC
    inc  e

label_FEFC::
    ld   d, a
    ret

label_FEFE::
    call label_FED9
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_FF0B
    cpl
    inc  a

label_FF0B::
    push af
    call label_FEE9
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_FF19
    cpl
    inc  a

label_FF19::
    pop  de
    cp   d
    jr   nc, label_FF21
    ld   a, [$FFD7]
    jr   label_FF23

label_FF21::
    ld   a, [$FFD8]

label_FF23::
    ld   e, a
    ret

label_FF25::
    call label_FF32
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_FF32
    pop  bc
    ret

label_FF32::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_FF5D
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_FF4A::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_FF54
    ld   e, $F0

label_FF54::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_FF5D::
    ret

label_FF5E::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_FF5D
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_FF4A

label_FF78::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_FFA7

label_FF7E::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_FFA7
    cp   $01
    jr   z, label_FF94
    cp   $0B
    jr   nz, label_FFA7
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_FFA7

label_FF94::
    ld   a, [$C19F]
    ld   hl, $C1A8
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_FFA7
    ld   a, [$C124]
    and  a
    jr   z, label_FFA8

label_FFA7::
    pop  af

label_FFA8::
    ret

label_FFA9::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    dec  a
    ld   [hl], a
    call label_3E8E
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C400
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_FF25
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_FFE4
    call label_F893

label_FFE4::
    ld   hl, $C250
    add  hl, bc
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af
    call label_3EAF
    ret
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
