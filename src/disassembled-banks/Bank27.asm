section "bank27",romx,bank[$1B]

label_6C000::
    jp   label_6C009
    jp   label_6CE2C
    jp   label_6C01E

label_6C009::
    ld   hl, $D300

label_6C00C::
    ld   [hl], $00
    inc  l
    jr   nz, label_6C00C
    ld   a, $80
    ld   [rNR52], a
    ld   a, $77
    ld   [rNR50], a
    ld   a, $FF
    ld   [rNR51], a
    ret

label_6C01E::
    ld   hl, $D368
    ld   a, [hli]
    and  a
    jr   nz, label_6C031
    call label_6C037

label_6C028::
    call label_6C50F
    ret

label_6C02C::
    xor  a
    ld   [$D3CE], a
    ret

label_6C031::
    ld   [hl], a
    call label_6C13B
    jr   label_6C028

label_6C037::
    ld   de, $D393
    ld   hl, $D378
    ld   a, [hli]
    cp   $01

label_6C040::
    jr   z, label_6C048
    ld   a, [hl]
    cp   $01
    jr   z, label_6C053
    ret

label_6C048::
    ld   a, $01
    ld   [$D379], a
    ld   hl, label_6C060
    jp   label_6C06A

label_6C053::
    ld   a, [de]
    dec  a
    ld   [de], a
    ret  nz
    xor  a
    ld   [$D379], a
    ld   hl, label_6C065
    jr   label_6C06A

label_6C060::
    dec  sp
    add  a, b
    rlca
    ret  nz
    ld   [bc], a

label_6C065::
    nop
    ld   b, d
    ld   [bc], a
    ret  nz
    inc  b

label_6C06A::
    ld   b, $04
    ld   c, $20

label_6C06E::
    ld   a, [hli]

label_6C06F::
    ld  [$FF00+C], a
    inc  c
    dec  b
    jr   nz, label_6C06E
    ld   a, [hl]
    ld   [de], a
    ret

label_6C077::
    inc  [hl]
    ld   d, b
    ld  [$FF00+C], a
    ld   d, c
    sub  a, e
    ld   d, d
    inc  l
    ld   d, e
    dec  b
    ld   d, h
    ld   e, b
    ld   d, a
    ld   a, [$FF59]
    adc  a, l
    ld   e, d
    ld   a, l
    ld   e, e
    ld   [hl], c
    ld   e, h
    add  hl, bc
    ld   e, l
    cp   b
    ld   e, l
    ld   [label_275E], sp
    ld   e, [hl]
    and  a
    ld   e, [hl]
    ld   [hl], $4B
    ld   a, [bc]
    ld   e, a
    pop  bc
    ld   e, a
    rla
    ld   h, b

label_6C09D::
    sub  a, [hl]
    ld   h, b
    ld   e, a
    ld   h, c

label_6C0A1::
    ld   b, c
    ld   h, d
    xor  h
    ld   c, l
    nop
    ld   d, b
    dec  d
    ld   h, e
    ld   a, $64
    rst  $18
    ld   h, h
    ld   a, d
    ld   c, h
    inc  de
    ld   h, l
    dec  de
    ld   l, h
    ld   l, c
    ld   l, h
    adc  a, a
    ld   c, e
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c
    nop
    ld   [hl], c

label_6C0D7::
    inc  e
    dec  a
    sla  a
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   l, c
    ld   h, b
    ld   a, h
    ret

label_6C0E6::
    push bc
    ld   c, $30

label_6C0E9::
    ld   a, [hli]
    ld  [$FF00+C], a
    inc  c
    ld   a, c
    cp   $40
    jr   nz, label_6C0E9
    pop  bc
    ret

label_6C0F3::
    xor  a
    ld   [$D379], a
    ld   [$D34F], a
    ld   [$D398], a
    ld   [$D393], a
    ld   [$D3C9], a
    ld   [$D3A3], a
    ld   a, $08
    ld   [rNR42], a
    ld   a, $80
    ld   [rNR44], a
    ret

label_6C10F::
    ld   a, [$D379]
    cp   $0C
    jp   z, label_6CE4A
    cp   $05
    jp   z, label_6CE4A
    cp   $1A
    jp   z, label_6CE4A
    cp   $24
    jp   z, label_6CE4A
    cp   $2A
    jp   z, label_6CE4A
    cp   $2E
    jp   z, label_6CE4A
    cp   $3F
    jp   z, label_6CE4A
    call label_6C0F3
    jp   label_6CE4A

label_6C13B::
    cp   $FF
    jr   z, label_6C10F
    ld   a, [$D3CA]
    ld   [$D3CB], a
    ld   a, [hl]
    ld   [$D3CA], a
    cp   $11
    jr   nc, label_6C14F
    jr   label_6C172

label_6C14F::
    cp   $21
    jr   nc, label_6C156
    jp   label_6C02C

label_6C156::
    cp   $31
    jr   nc, label_6C15D
    jp   label_6C02C

label_6C15D::
    cp   $41
    jp   nc, label_6C166
    add  a, $E0
    jr   label_6C172

label_6C166::
    cp   $61
    jp  c, label_6C02C
    cp   $70
    jp   nc, label_6C02C
    add  a, $C0

label_6C172::
    dec  hl
    ldi  [hl], a
    ld   b, a
    ld   a, $01
    ld   [$D3CE], a
    ld   a, b
    ld   [hl], a
    ld   b, a
    ld   hl, label_6C077
    and  $7F
    call label_6C0D7
    call label_6C33C
    jp   label_6C2D5

label_6C18B::
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    nop

label_6C2AB::
    ld   a, [$D3E7]
    and  a
    jp   z, label_6C6CB
    xor  a
    ld   [rNR30], a
    ld   [$D3E7], a
    push hl
    ld   a, [$D336]
    ld   l, a
    ld   a, [$D337]
    ld   h, a
    push bc
    ld   c, $30

label_6C2C4::
    ld   a, [hli]
    ld  [$FF00+C], a
    inc  c
    ld   a, c
    cp   $40
    jr   nz, label_6C2C4
    ld   a, $80
    ld   [rNR30], a
    pop  bc
    pop  hl
    jp   label_6C6CB

label_6C2D5::
    ld   a, [$D369]
    ld   hl, label_6C18B

label_6C2DB::
    dec  a
    jr   z, label_6C2E6
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    jr   label_6C2DB

label_6C2E6::
    ld   bc, $D355
    ld   a, [hli]
    ld   [bc], a
    inc  c
    xor  a
    ld   [bc], a
    inc  c
    ld   a, [hli]
    ld   [bc], a
    inc  c
    xor  a
    ld   [bc], a
    inc  c
    ld   a, [hli]
    ld   [bc], a
    ld   [rNR51], a
    inc  c
    ld   a, [hli]
    ld   [bc], a
    inc  c
    ld   a, [hli]
    ld   [bc], a
    inc  c
    ld   a, [hli]
    ld   [bc], a
    ret

label_6C303::
    ld   hl, $D355
    ld   a, [hli]
    cp   $01
    ret  z
    inc  [hl]
    ld   a, [hli]
    cp   [hl]
    ret  nz
    dec  l
    ld   [hl], $00
    inc  l
    inc  l
    inc  [hl]
    ld   a, [hli]
    and  $03
    ld   c, l
    ld   b, h
    and  a
    jr   z, label_6C327
    inc  c
    cp   $01
    jr   z, label_6C327
    inc  c
    cp   $02
    jr   z, label_6C327
    inc  c

label_6C327::
    ld   a, [bc]
    ld   [rNR51], a
    ret

label_6C32B::
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a
    ld   a, [bc]
    ld   [de], a
    inc  e
    inc  bc
    ld   a, [bc]
    ld   [de], a
    ret

label_6C336::
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, [hli]
    ld   [de], a
    ret

label_6C33C::
    ld   a, [$D379]
    cp   $05
    jr   z, label_6C35E
    cp   $0C
    jr   z, label_6C35E
    cp   $1A
    jr   z, label_6C35E
    cp   $24
    jr   z, label_6C35E
    cp   $2A
    jr   z, label_6C35E
    cp   $2E
    jr   z, label_6C35E
    cp   $3F
    jr   z, label_6C35E
    call label_6C0F3

label_6C35E::
    call label_6CE57
    ld   de, $D300
    ld   b, $00
    ld   a, [hli]
    ld   [de], a
    inc  e
    call label_6C336
    ld   de, $D310
    call label_6C336
    ld   de, $D320
    call label_6C336
    ld   de, $D330
    call label_6C336
    ld   de, $D340
    call label_6C336
    ld   hl, $D310
    ld   de, $D314
    call label_6C32B
    ld   hl, $D320
    ld   de, $D324
    call label_6C32B
    ld   hl, $D330
    ld   de, $D334
    call label_6C32B
    ld   hl, $D340
    ld   de, $D344
    call label_6C32B
    ld   bc, label_410
    ld   hl, $D312

label_6C3AE::
    ld   [hl], $01
    ld   a, c
    add  a, l
    ld   l, a
    dec  b
    jr   nz, label_6C3AE
    xor  a
    ld   [$D31E], a
    ld   [$D32E], a
    ld   [$D33E], a
    ret

label_6C3C1::
    push hl
    ld   a, e
    ld   [$D336], a
    ld   a, d
    ld   [$D337], a
    ld   a, [$D371]
    and  a
    jr   nz, label_6C3D8
    xor  a
    ld   [rNR30], a
    ld   l, e
    ld   h, d
    call label_6C0E6

label_6C3D8::
    pop  hl
    jr   label_6C405

label_6C3DB::
    call label_6C40B
    call label_6C420
    ld   e, a
    call label_6C40B
    call label_6C420
    ld   d, a
    call label_6C40B
    call label_6C420
    ld   c, a
    inc  l
    inc  l
    ld   [hl], e
    inc  l
    ld   [hl], d
    inc  l
    ld   [hl], c
    dec  l
    dec  l
    dec  l
    dec  l
    push hl
    ld   hl, $D350
    ld   a, [hl]

label_6C400::
    pop  hl
    cp   $03
    jr   z, label_6C3C1

label_6C405::
    call label_6C40B
    jp   label_6C531

label_6C40B::
    push de
    ld   a, [hli]
    ld   e, a
    db   $3A ; ldd  a, [hl]
    ld   d, a
    inc  de

label_6C411::
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldd  [hl], a
    pop  de
    ret

label_6C417::
    push de
    ld   a, [hli]
    ld   e, a
    db   $3A ; ldd  a, [hl]
    ld   d, a
    inc  de
    inc  de
    jr   label_6C411

label_6C420::
    ld   a, [hli]
    ld   c, a
    db   $3A ; ldd  a, [hl]
    ld   b, a
    ld   a, [bc]
    ld   b, a
    ret

label_6C427::
    pop  hl
    jr   label_6C45B

label_6C42A::
    ld   a, [$D350]
    cp   $03
    jr   nz, label_6C441
    ld   a, [$D338]
    bit  7, a
    jr   z, label_6C441
    ld   a, [hl]
    cp   $06
    jr   nz, label_6C441
    ld   a, $40
    ld   [rNR32], a

label_6C441::
    push hl
    ld   a, l
    add  a, $09
    ld   l, a
    ld   a, [hl]
    and  a
    jr   nz, label_6C427
    ld   a, l
    add  a, $04
    ld   l, a
    bit  7, [hl]
    jr   nz, label_6C427
    pop  hl
    call label_6C6FE
    push hl
    call label_6C787
    pop  hl

label_6C45B::
    dec  l
    dec  l
    jp   label_6C6DE

label_6C460::
    dec  l
    dec  l
    dec  l
    dec  l
    call label_6C417

label_6C467::
    ld   a, l
    add  a, $04
    ld   e, a
    ld   d, h
    call label_6C32B
    cp   $00
    jr   z, label_6C492
    cp   $FF
    jr   z, label_6C47B
    inc  l
    jp   label_6C52F

label_6C47B::
    dec  l
    push hl
    call label_6C417
    call label_6C420
    ld   e, a
    call label_6C40B
    call label_6C420
    ld   d, a
    pop  hl
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldd  [hl], a
    jr   label_6C467

label_6C492::
    ld   a, [$D3CA]
    cp   $0F
    jp   z, label_6C7E5
    cp   $10
    jp   z, label_6C7E5
    cp   $25
    jp   z, label_6C7E5
    ld   hl, $D369
    ld   [hl], $00
    call label_6C10F
    ret

label_6C4AD::
    call label_6C40B
    call label_6C420
    ld   [$D301], a
    call label_6C40B
    call label_6C420
    ld   [$D302], a
    jr   label_6C4CA

label_6C4C1::
    call label_6C40B
    call label_6C420
    ld   [$D300], a

label_6C4CA::
    call label_6C40B
    jr   label_6C531

label_6C4CF::
    call label_6C40B
    call label_6C420
    push hl
    ld   a, l
    add  a, $0B
    ld   l, a
    ld   c, [hl]
    ld   a, b
    or   c
    ld   [hl], a
    ld   b, h
    ld   c, l
    dec  c
    dec  c
    pop  hl
    ld   a, [hli]
    ld   e, a
    db   $3A ; ldd  a, [hl]
    ld   d, a
    inc  de
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldd  [hl], a
    ld   a, d
    ld   [bc], a
    dec  c
    ld   a, e
    ld   [bc], a
    jr   label_6C531

label_6C4F3::
    push hl
    ld   a, l
    add  a, $0B
    ld   l, a
    ld   a, [hl]
    dec  [hl]
    ld   a, [hl]
    and  $7F
    jr   z, label_6C50C
    ld   b, h
    ld   c, l
    dec  c
    dec  c
    dec  c
    pop  hl
    ld   a, [bc]
    ldi  [hl], a
    inc  c
    ld   a, [bc]
    ldd  [hl], a
    jr   label_6C531

label_6C50C::
    pop  hl
    jr   label_6C4CA

label_6C50F::
    ld   hl, $D369
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$D3CE]
    and  a
    ret  z
    call label_6C303
    ld   a, $01
    ld   [$D350], a
    ld   hl, $D310

label_6C525::
    inc  l
    ld   a, [hli]
    and  a
    jp   z, label_6C45B
    dec  [hl]
    jp   nz, label_6C42A

label_6C52F::
    inc  l
    inc  l

label_6C531::
    call label_6C420
    cp   $00
    jp   z, label_6C460
    cp   $9D
    jp   z, label_6C3DB
    cp   $9E
    jp   z, label_6C4AD
    cp   $9F
    jp   z, label_6C4C1
    cp   $9B
    jp   z, label_6C4CF
    cp   $9C
    jp   z, label_6C4F3
    cp   $99
    jp   z, label_6C7FF
    cp   $9A
    jp   z, label_6C80A
    cp   $94
    jp   z, label_6C98D
    cp   $97
    jp   z, label_6C846
    cp   $98
    jp   z, label_6C855
    cp   $96
    jp   z, label_6C7F1
    cp   $95
    jp   z, label_6C7FC
    and  $F0
    cp   $A0
    jr   nz, label_6C5C8
    ld   a, b
    and  $0F
    ld   c, a
    ld   b, $00
    push hl
    ld   de, $D301
    ld   a, [de]
    ld   l, a
    inc  e
    ld   a, [de]
    ld   h, a
    add  hl, bc
    ld   a, [hl]
    pop  hl
    push hl
    ld   d, a
    inc  l
    inc  l
    inc  l
    ld   a, [hl]
    and  $F0
    jr   nz, label_6C59A
    ld   a, d
    jr   label_6C5BF

label_6C59A::
    ld   e, a
    ld   a, d
    push af
    srl  a
    sla  e
    jr   c, label_6C5AB
    ld   d, a
    srl  a
    sla  e
    jr   c, label_6C5AB
    add  a, d

label_6C5AB::
    ld   c, a
    and  a
    jr   nz, label_6C5B1
    ld   c, $02

label_6C5B1::
    ld   de, $D350
    ld   a, [de]
    dec  a
    ld   e, a
    ld   d, $00
    ld   hl, $D307
    add  hl, de
    ld   [hl], c
    pop  af

label_6C5BF::
    pop  hl
    dec  l
    ldi  [hl], a
    call label_6C40B
    call label_6C420

label_6C5C8::
    ld   a, [$D350]
    cp   $04
    jr   z, label_6C607
    push de
    ld   de, $D3B0
    call label_6C895
    xor  a
    ld   [de], a
    inc  e
    ld   [de], a
    ld   de, $D3B6
    call label_6C895
    inc  e
    xor  a
    ld   [de], a
    ld   a, [$D350]
    cp   $03
    jr   nz, label_6C606
    ld   de, $D39E
    ld   a, [de]
    and  a
    jr   z, label_6C5F8
    ld   a, $01
    ld   [de], a
    xor  a
    ld   [$D39F], a

label_6C5F8::
    ld   de, $D3D9
    ld   a, [de]
    and  a
    jr   z, label_6C606
    ld   a, $01
    ld   [de], a
    xor  a
    ld   [$D3DA], a

label_6C606::
    pop  de

label_6C607::
    ld   c, b
    ld   b, $00
    call label_6C40B
    ld   a, [$D350]
    cp   $04
    jp   z, label_6C649
    push hl
    ld   a, l
    add  a, $05
    ld   l, a
    ld   e, l
    ld   d, h
    inc  l
    inc  l
    ld   a, c
    cp   $01
    jr   z, label_6C644
    ld   [hl], $00
    ld   a, [$D300]
    and  a
    jr   z, label_6C637
    ld   l, a
    ld   h, $00
    bit  7, l
    jr   z, label_6C634
    ld   h, $FF

label_6C634::
    add  hl, bc
    ld   b, h
    ld   c, l

label_6C637::
    ld   hl, label_6C9C2
    add  hl, bc
    ld   a, [hli]

label_6C63C::
    ld   [de], a
    inc  e
    ld   a, [hl]
    ld   [de], a
    pop  hl
    jp   label_6C67A

label_6C644::
    ld   [hl], $01

label_6C646::
    pop  hl
    jr   label_6C67A

label_6C649::
    push hl
    ld   a, c
    cp   $FF
    jr   z, label_6C667
    ld   de, $D346
    ld   hl, label_6CA54
    add  hl, bc

label_6C656::
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, e

label_6C65A::
    cp   $4B
    jr   nz, label_6C656
    ld   c, $20
    ld   hl, $D344
    ld   b, $00
    jr   label_6C6A8

label_6C667::
    ld   a, [$D34F]
    bit  7, a
    jp   nz, label_6C6D9
    ld   a, $01
    ld   [$D378], a
    call label_6C037
    jp   label_6C6D9

label_6C67A::
    push hl
    ld   b, $00
    ld   a, [$D350]
    cp   $01
    jr   z, label_6C6A5
    cp   $02
    jr   z, label_6C6A1
    ld   c, $1A
    ld   a, [$D33F]
    bit  7, a
    jr   nz, label_6C696
    xor  a
    ld  [$FF00+C], a
    ld   a, $80
    ld  [$FF00+C], a

label_6C696::
    inc  c
    inc  l
    inc  l
    inc  l
    inc  l
    ld   a, [hli]
    ld   e, a
    ld   d, $00
    jr   label_6C6AF

label_6C6A1::
    ld   c, $16
    jr   label_6C6A8

label_6C6A5::
    ld   c, $10
    inc  c

label_6C6A8::
    inc  l
    inc  l
    ld   a, [hli]
    ld   e, a
    inc  l
    ld   a, [hli]
    ld   d, a

label_6C6AF::
    push hl
    inc  l
    inc  l
    ld   a, [hli]
    and  a
    jr   z, label_6C6B8
    ld   e, $08

label_6C6B8::
    inc  l
    inc  l
    ld   [hl], $00
    inc  l
    ld   a, [hl]
    pop  hl
    bit  7, a
    jr   nz, label_6C6D9
    ld   a, [$D350]
    cp   $03
    jp   z, label_6C2AB

label_6C6CB::
    ld   a, d
    or   b
    ld  [$FF00+C], a
    inc  c
    ld   a, e
    ld  [$FF00+C], a
    inc  c
    ld   a, [hli]
    ld  [$FF00+C], a
    inc  c
    ld   a, [hl]
    or   $80
    ld  [$FF00+C], a

label_6C6D9::
    pop  hl
    dec  l
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    dec  l

label_6C6DE::
    ld   de, $D350
    ld   a, [de]
    cp   $04
    jr   z, label_6C6EF
    inc  a
    ld   [de], a
    ld   a, $10
    add  a, l
    ld   l, a
    jp   label_6C525

label_6C6EF::
    ld   hl, $D31E
    inc  [hl]
    ld   hl, $D32E
    inc  [hl]
    ld   hl, $D33E
    inc  [hl]
    ret

label_6C6FC::
    pop  hl
    ret

label_6C6FE::
    push hl
    ld   a, l
    add  a, $06
    ld   l, a
    ld   a, [hl]
    and  $0F
    jr   z, label_6C720
    ld   [$D351], a
    ld   a, [$D350]
    ld   c, $13
    cp   $01
    jr   z, label_6C762
    ld   c, $18
    cp   $02
    jr   z, label_6C762
    ld   c, $1D
    cp   $03
    jr   z, label_6C762

label_6C720::
    ld   a, [$D350]
    cp   $04
    jp   z, label_6C6FC
    ld   de, $D3B6
    call label_6C895
    ld   a, [de]
    and  a
    jp   z, label_6C749
    ld   a, [$D350]
    ld   c, $13
    cp   $01
    jp   z, label_6C85E
    ld   c, $18
    cp   $02
    jp   z, label_6C85E
    ld   c, $1D
    jp   label_6C85E

label_6C749::
    ld   a, [$D350]
    cp   $03
    jp   nz, label_6C6FC
    ld   a, [$D39E]
    and  a
    jp   nz, label_6C810
    ld   a, [$D3D9]
    and  a
    jp   nz, label_6C998
    jp   label_6C6FC

label_6C762::
    inc  l
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    and  $0F
    ld   d, a
    push de
    ld   a, l
    add  a, $04
    ld   l, a
    ld   b, [hl]
    ld   a, [$D351]
    cp   $01
    jp   z, label_6C8AB
    cp   $05
    jp   z, label_6C918
    ld   hl, rIE
    pop  de
    add  hl, de
    call label_6C884
    jp   label_6C720

label_6C787::
    ld   a, [$D31B]
    and  a
    jr   nz, label_6C7AE
    ld   a, [$D317]
    and  a
    jr   z, label_6C7AE
    and  $0F
    ld   b, a
    ld   hl, $D307
    ld   a, [$D31E]
    cp   [hl]
    jr   nz, label_6C7AE
    ld   c, $12
    ld   de, $D31A
    ld   a, [$D31F]
    bit  7, a
    jr   nz, label_6C7AE
    call label_6C7D2

label_6C7AE::
    ld   a, [$D32B]
    and  a
    ret  nz
    ld   a, [$D327]
    and  a
    ret  z
    and  $0F
    ld   b, a
    ld   hl, $D308
    ld   a, [$D32E]
    cp   [hl]
    ret  nz
    ld   a, [$D32F]
    bit  7, a
    ret  nz
    ld   c, $17
    ld   de, $D32A
    call label_6C7D2
    ret

label_6C7D2::
    push bc
    dec  b
    ld   c, b
    ld   b, $00
    ld   hl, label_6CB13
    add  hl, bc
    ld   a, [hl]
    pop  bc
    ld  [$FF00+C], a
    inc  c
    inc  c
    ld   a, [de]
    or   $80
    ld  [$FF00+C], a
    ret

label_6C7E5::
    xor  a
    ld   [$D3CE], a
    ld   a, [$FFBF]
    ld   [$D368], a
    jp   label_6C01E

label_6C7F1::
    ld   a, $01

label_6C7F3::
    ld   [$D3CD], a
    call label_6C40B
    jp   label_6C531

label_6C7FC::
    xor  a
    jr   label_6C7F3

label_6C7FF::
    ld   a, $01

label_6C801::
    ld   [$D39E], a
    call label_6C40B
    jp   label_6C531

label_6C80A::
    xor  a
    ld   [$D39E], a
    jr   label_6C801

label_6C810::
    cp   $02
    jp   z, label_6C6FC
    ld   bc, $D39F
    call label_6C842
    ld   c, $1C
    ld   b, $40
    cp   $03
    jr   z, label_6C83D
    ld   b, $60
    cp   $05
    jr   z, label_6C83D
    cp   $0A
    jr   z, label_6C83D
    ld   b, $00
    cp   $07
    jr   z, label_6C83D
    cp   $0D
    jp   nz, label_6C6FC
    ld   a, $02
    ld   [$D39E], a

label_6C83D::
    ld   a, b
    ld  [$FF00+C], a
    jp   label_6C6FC

label_6C842::
    ld   a, [bc]
    inc  a
    ld   [bc], a
    ret

label_6C846::
    ld   de, $D3B6
    call label_6C895
    ld   a, $01

label_6C84E::
    ld   [de], a
    call label_6C40B
    jp   label_6C531

label_6C855::
    ld   de, $D3B6
    call label_6C895
    xor  a
    jr   label_6C84E

label_6C85E::
    inc  e
    ld   a, [de]
    and  a
    jr   nz, label_6C874
    inc  a
    ld   [de], a
    pop  hl
    push hl
    call label_6C879

label_6C86A::
    ld   hl, $FF9C
    add  hl, de
    call label_6C884
    jp   label_6C6FC

label_6C874::
    call label_6C89E
    jr   label_6C86A

label_6C879::
    ld   a, $07
    add  a, l
    ld   l, a
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    and  $0F
    ld   d, a
    ret

label_6C884::
    ld   de, $D3A4
    call label_6C895
    ld   a, l
    ld  [$FF00+C], a
    ld   [de], a
    inc  c
    inc  e
    ld   a, h
    and  $0F
    ld  [$FF00+C], a
    ld   [de], a
    ret

label_6C895::
    ld   a, [$D350]
    dec  a
    sla  a
    add  a, e
    ld   e, a
    ret

label_6C89E::
    ld   de, $D3A4

label_6C8A1::
    call label_6C895
    ld   a, [de]
    ld   l, a
    inc  e
    ld   a, [de]
    ld   d, a
    ld   e, l
    ret

label_6C8AB::
    pop  de
    ld   de, $D3B0
    call label_6C895
    ld   a, [de]
    inc  a
    ld   [de], a
    inc  e
    cp   $19
    jr   z, label_6C8EB
    cp   $2D
    jr   z, label_6C8E4
    ld   a, [de]
    and  a
    jp   z, label_6C720

label_6C8C3::
    dec  e
    ld   a, [de]
    sub  a, $19
    sla  a
    ld   l, a
    ld   h, $00
    ld   de, label_6C8F0
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   a, [hl]
    ld   e, a
    pop  hl
    push hl
    push de
    call label_6C879
    ld   h, d
    ld   l, e
    pop  de
    add  hl, de
    call label_6C884
    jp   label_6C720

label_6C8E4::
    dec  e
    ld   a, $19
    ld   [de], a
    inc  e
    jr   label_6C8C3

label_6C8EB::
    ld   a, $01
    ld   [de], a
    jr   label_6C8C3

label_6C8F0::
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    cp   $00
    nop
    nop
    ld   bc, label_200
    nop
    ld   bc, $0000
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    rst  $38

label_6C918::
    pop  de
    ld   de, $D3D0
    call label_6C895
    ld   a, [de]
    inc  a
    ld   [de], a
    inc  e
    cp   $21
    jr   z, label_6C946

label_6C927::
    dec  e
    ld   a, [de]
    sla  a
    ld   l, a
    ld   h, $00
    ld   de, label_6C94D
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   a, [hl]
    ld   e, a
    pop  hl
    push hl
    push de
    call label_6C879
    ld   h, d
    ld   l, e
    pop  de
    add  hl, de
    call label_6C884
    jp   label_6C720

label_6C946::
    dec  e
    ld   a, $01
    ld   [de], a
    inc  e
    jr   label_6C927

label_6C94D::
    nop
    ld   [$0000], sp
    rst  $38
    ld    hl, sp+$00
    nop
    nop
    ld   a, [bc]
    nop
    ld   [bc], a
    rst  $38
    ld   a, [label_200]
    nop
    inc  c
    nop
    inc  b
    rst  $38
    db   $FC ; Undefined instruction
    nop
    inc  b
    nop
    ld   a, [bc]
    nop
    ld   [bc], a
    rst  $38
    ld   a, [label_200]
    nop
    ld   [$0000], sp
    rst  $38
    ld    hl, sp+$00
    nop
    nop
    ld   b, $FF
    cp   $FF
    or   $FF
    cp   $00
    inc  b
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    nop
    ld   b, $FF
    cp   $FF
    or   $FF
    cp   $3E
    ld   bc, $D9EA
    db   $D3 ; Undefined instruction
    call label_6C40B
    jp   label_6C531

label_6C998::
    cp   $02
    jp   z, label_6C6FC
    ld   bc, $D3DA
    call label_6C842
    ld   c, $1C
    ld   b, $60
    cp   $03
    jp   z, label_6C83D
    ld   b, $40
    cp   $05
    jp   z, label_6C83D
    ld   b, $20
    cp   $06
    jp   nz, label_6C6FC
    ld   a, $02
    ld   [$D3D9], a
    jp   label_6C83D

label_6C9C2::
    nop
    rrca
    inc  l
    nop
    sbc  a, h
    nop
    ld   b, $01
    ld   l, e
    ld   bc, label_1C9
    inc  hl
    ld   [bc], a
    ld   [hl], a
    ld   [bc], a
    add  a, $02
    ld   [de], a
    inc  bc
    ld   d, [hl]
    inc  bc
    sbc  a, e
    inc  bc
    jp  c, label_1603
    inc  b
    ld   c, [hl]
    inc  b
    add  a, e
    inc  b
    or   l
    inc  b
    push hl
    inc  b
    ld   de, label_3B05
    dec  b
    ld   h, e
    dec  b
    adc  a, c
    dec  b
    xor  h
    dec  b
    adc  a, $05
    db   $ED ; Undefined instruction
    dec  b
    ld   a, [bc]
    ld   b, $27
    ld   b, $42
    ld   b, $5B
    ld   b, $72

label_6C9FD::
    ld   b, $89
    ld   b, $9E
    ld   b, $B2
    ld   b, $C4
    ld   b, $D6
    ld   b, $E7
    ld   b, $F7
    ld   b, $06
    rlca
    inc  d
    rlca
    ld   hl, label_2D07
    rlca
    add  hl, sp
    rlca
    ld   b, h
    rlca
    ld   c, a
    rlca
    ld   e, c
    rlca
    ld   h, d
    rlca
    ld   l, e
    rlca
    ld   [hl], h
    rlca
    ld   a, e
    rlca
    add  a, e
    rlca
    adc  a, d
    rlca
    sub  a, b
    rlca
    sub  a, a
    rlca
    sbc  a, l
    rlca
    and  d
    rlca
    and  a
    rlca
    xor  h
    rlca
    or   c
    rlca
    or   [hl]
    rlca
    cp   d
    rlca
    cp   [hl]
    rlca
    pop  bc
    rlca
    push bc
    rlca
    ret  z
    rlca
    rlc  a
    adc  a, $07
    pop  de
    rlca
    call nc, label_D607
    rlca
    reti
    rlca
    db   $DB
    rlca
    db   $07
    rlca
    rst  $18
    rlca

label_6CA54::
    nop
    nop
    nop
    nop
    nop
    ret  nz
    add  hl, bc
    nop
    jr   c, label_6CA92
    ret  nz
    add  hl, de
    nop
    jr   c, label_6CA96
    ret  nz
    ld   b, [hl]
    nop
    inc  de
    db   $10 ; Undefined instruction
    inc  hl
    nop
    jr   nz, label_6CAAD
    add  a, b
    ld   d, c
    nop
    jr   nz, label_6CA79
    add  a, b
    and  c
    nop
    nop
    jr   label_6C9F8
    ld   a, [$FF00+C]
    nop
    jr   label_6C9FD
    add  a, c
    nop
    db   $3A ; ldd  a, [hl]
    db   $10 ; Undefined instruction
    add  a, b
    nop
    nop
    db   $10 ; Undefined instruction
    ld   d, a
    nop
    nop
    ld   h, b
    add  a, b
    ld   bc, label_402
    ld   [label_2010], sp

label_6CA92::
    ld   b, $0C
    jr   label_6CA97

label_6CA96::
    ld   bc, $0101
    ld   bc, $0130
    inc  bc
    ld   b, $0C
    jr   label_6CAD1
    add  hl, bc
    ld   [de], a
    inc  h
    ld   [bc], a
    inc  b
    ld   [$0101], sp
    ld   c, b

label_6CAAA::
    ld   [bc], a
    inc  b
    ld   [label_2010], sp
    ld   b, b
    inc  c
    jr   label_6CAE3
    ld   [bc], a
    dec  b
    inc  bc
    ld   bc, label_6E001
    inc  bc
    dec  b
    ld   a, [bc]
    inc  d
    jr   z, label_6CB0F
    rrca
    ld   e, $3C
    ld   [bc], a
    ld   [label_210], sp
    ld   bc, label_378
    ld   b, $0C
    jr   label_6CAFD
    ld   h, b
    ld   [de], a
    inc  h
    ld   c, b

label_6CAD1::
    inc  bc
    ld   [label_210], sp
    inc  b
    sub  a, b
    inc  bc
    rlca
    ld   c, $1C
    jr   c, label_6CB4D
    dec  d
    ld   a, [hli]
    ld   d, h
    inc  b
    add  hl, bc
    ld   [de], a

label_6CAE3::
    ld   [bc], a
    ld   bc, label_4A8
    ld   [label_2010], sp
    ld   b, b
    add  a, b
    jr   label_6CB1E
    ld   h, b
    inc  b
    ld   [bc], a
    ld   bc, $0001
    ret  nz
    inc  b
    add  hl, bc
    ld   [de], a
    inc  h
    ld   c, b
    sub  a, b
    dec  de
    ld   [hl], $6C
    dec  b
    inc  c
    jr   label_6CB1A
    ld   b, $D8
    dec  b
    ld   a, [bc]
    inc  d
    jr   z, label_6CB59
    and  b
    ld   e, $3C
    ld   a, b

label_6CB0D::
    dec  b
    ld   bc, $0101
    ld   bc, label_10F0
    ldd  [hl], a
    ldi  [hl], a
    ld   b, a
    add  a, c
    jr   nz, label_6CB1A

label_6CB1A::
    jr   nz, label_6CB67
    rst  $38
    rst  $38

label_6CB1E::
    ld   a, [de]
    ld   c, e
    sbc  a, e
    jr   nz, label_6CAD1
    ld   bc, $009C
    nop
    ldi  [hl], a
    ld   b, h
    ld   d, l
    ld   h, [hl]
    ld   h, [hl]
    adc  a, b
    adc  a, b
    xor  d
    xor  d
    call z, label_4CC
    add  a, h
    inc  b
    add  a, h
    nop
    cp   c
    ld   c, d
    ld   b, c
    ld   c, e
    ld   b, l
    ld   c, e
    ld   c, c
    ld   c, e
    ld   c, l
    ld   c, e
    ld   d, c
    ld   c, e
    nop
    nop
    ld   h, c
    ld   c, e
    nop
    nop
    ld   l, a
    ld   c, e
    nop
    nop

label_6CB4D::
    add  a, c
    ld   c, e
    nop
    nop
    sbc  a, l
    ld   h, b
    ld   hl, $9600
    and  d
    ld   e, h
    ld   e, [hl]

label_6CB59::
    xor  d
    ld   h, b
    ld   h, d
    ld   h, h
    xor  [hl]
    ld   h, [hl]
    sub  a, l
    nop
    sbc  a, l
    add  a, b
    ld   hl, $A241
    ld   c, d

label_6CB67::
    ld   c, h
    xor  d
    ld   c, [hl]
    ld   d, b
    ld   d, d
    xor  [hl]
    ld   d, h
    nop
    sbc  a, l
    pop  bc
    ld   l, [hl]
    jr   nz, label_6CB0D
    and  d
    inc  a
    ld   a, $AA
    ld   b, b
    ld   b, d
    ld   b, h
    sbc  a, d
    and  l
    ld   b, [hl]
    and  h
    ld   bc, $A300
    ld   bc, label_15AA
    ld   a, [de]
    ld   a, [de]
    sbc  a, e
    ld   e, $A0
    dec  d
    sbc  a, h
    and  a
    ld   bc, label_400
    push af
    ld   c, d
    sbc  a, d
    ld   c, e
    or   d
    ld   c, e
    cp   d
    ld   c, e
    nop
    nop
    ret  nc
    ld   c, e
    ld   a, [bc]
    ld   c, h
    ld   a, [bc]
    ld   c, h
    ld   a, [bc]
    ld   c, h
    ld   a, [bc]
    ld   c, h
    ld   a, [bc]
    ld   c, h
    ld   a, [bc]
    ld   c, h
    ld   a, [bc]
    ld   c, h
    ld   a, [bc]
    ld   c, h
    ld   [hl], h
    ld   c, h
    rst  $38
    rst  $38
    sbc  a, d
    ld   c, e
    push de
    ld   c, e
    ccf

label_6CBB5::
    ld   c, h
    rst  $38
    rst  $38
    or   d
    ld   c, e
    dec  b
    ld   c, h
    dec  b
    ld   c, h
    dec  b
    ld   c, h
    dec  b
    ld   c, h
    dec  b
    ld   c, h
    dec  b
    ld   c, h
    dec  b
    ld   c, h
    dec  b
    ld   c, h
    ld   [hl], h
    ld   c, h
    rst  $38
    rst  $38
    cp   d
    ld   c, e
    sbc  a, l
    ld   sp, label_6C000
    nop
    sbc  a, l
    jr   nc, label_6CB59
    add  a, b
    sbc  a, e
    ld   [label_1A3], sp
    and  d
    ld   b, h
    ld   b, [hl]
    and  e
    ld   c, d
    and  d
    ld   d, h
    ld   e, h
    and  a
    ld   e, h
    and  c
    ld   e, b
    ld   d, [hl]
    and  h
    ld   e, b
    and  d
    ld   bc, label_6DC58
    ld   e, [hl]
    and  e
    ld   e, h
    ld   e, b
    and  l
    ld   c, d
    and  h
    ld   a, d
    and  a
    ld   l, h
    and  c
    ld   l, d
    ld   l, h
    and  h
    ld   [hl], b
    ld   h, d
    ld   h, [hl]
    xor  [hl]
    ld   [hl], h
    sbc  a, h
    nop
    sbc  a, l
    pop  de
    ld   l, [hl]
    ld   b, b
    sbc  a, c
    sbc  a, e
    ld   [bc], a
    and  d
    inc  h
    inc  l

label_6CC0F::
    ldd  [hl], a
    inc  l
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    inc  h
    jr   nc, label_6CC4D
    jr   nc, label_6CBB5
    inc  h
    ld   l, $36
    ld   l, $22
    ld   l, $34
    ld   l, $2C
    ldd  [hl], a
    ld   b, b
    db   $3A ; ldd  a, [hl]
    inc  a
    ld   [hl], $32
    inc  l
    sbc  a, e
    ld   [bc], a
    jr   z, label_6CC5B
    ld   [hl], $2E
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    jr   z, label_6CC62
    inc  [hl]
    ld   l, $9C
    sbc  a, e
    inc  b
    inc  h
    inc  l
    ldd  [hl], a
    inc  l
    sbc  a, h
    nop
    sbc  a, l
    ld   h, c
    nop
    add  a, b
    and  h
    ld   bc, $AC97
    ld   bc, label_2CAD
    inc  l
    xor  h
    inc  l

label_6CC4D::
    xor  d
    inc  l
    sbc  a, b
    xor  h
    ldd  [hl], a
    xor  l
    ldd  [hl], a
    ld   [hl], $AC
    db   $3A ; ldd  a, [hl]
    xor  d
    ld   [hl], $A3
    ldd  [hl], a

label_6CC5B::
    ld   b, b
    db   $3A ; ldd  a, [hl]
    ld   c, d
    and  h
    ld   b, b
    xor  h
    ld   b, b

label_6CC62::
    xor  l
    ld   b, b
    ld   b, d
    xor  h
    ld   b, b
    xor  d
    ld   a, $A4
    jr   c, label_6CC0F
    ld   [hl], $A7
    ld   b, b
    and  h
    ld   b, b
    and  a
    ld   bc, $9B00
    dec  bc
    and  h
    ld   bc, $009C
    nop
    and  $4A
    add  a, l
    ld   c, h
    adc  a, l
    ld   c, h
    sub  a, l
    ld   c, h
    sbc  a, l
    ld   c, h
    and  l
    ld   c, h

label_6CC87::
    sbc  a, $4C
    rst  $38
    rst  $38
    add  a, a
    ld   c, h
    or   d
    ld   c, h
    rst  $28
    ld   c, h
    rst  $38
    rst  $38
    adc  a, a
    ld   c, h
    cp   a
    ld   c, h
    ccf
    ld   c, l
    rst  $38
    rst  $38
    sub  a, a
    ld   c, h
    call z, label_884C
    ld   c, l

label_6CCA1::
    rst  $38
    rst  $38
    sbc  a, a
    ld   c, h
    sbc  a, l
    ld   h, b
    nop
    ld   b, c
    and  a
    ld   bc, label_6CEA1
    xor  d
    ld   bc, label_6D0AE
    nop
    sbc  a, l
    ld   b, b
    nop
    ld   bc, label_1A7
    and  c
    ld   h, h
    xor  d
    ld   bc, label_6E6AE
    nop
    sbc  a, l
    cpl
    ld   c, l
    jr   nz, label_6CC6B
    ld   bc, label_6DAA1
    xor  d
    ld   bc, label_6DCAE
    nop
    and  a
    ld   bc, label_1A1
    xor  d
    ld   bc, label_1A5
    and  c
    rst  $38
    and  d
    rst  $38
    rst  $38
    and  c
    rst  $38

label_6CCDB::
    and  d
    rst  $38
    nop
    sbc  a, l
    ldi  [hl], a
    nop
    add  a, b
    sub  a, a
    sbc  a, e
    jr   nz, label_6CC87
    ld   d, h
    ld   l, d
    ld   h, d
    ld   e, h
    ld   a, b
    ld   [hl], b
    ld   l, d
    sbc  a, h
    nop
    sbc  a, l
    add  a, c
    nop
    ld   b, b
    and  [hl]
    ld   b, [hl]
    and  b
    ld   b, [hl]
    ld   c, d
    and  [hl]
    ld   c, [hl]
    and  c
    ld   c, d
    and  e
    ld   b, [hl]
    ld   d, h
    ld   c, [hl]
    ld   e, [hl]
    and  h
    ld   d, h
    and  [hl]
    ld   d, h
    and  b
    ld   d, h
    ld   d, [hl]
    and  [hl]
    ld   d, h
    and  c
    ld   d, d
    and  h
    ld   c, h
    and  e
    ld   c, d
    ld   d, h
    and  h
    ld   b, [hl]
    and  l
    ld   bc, $0101
    sbc  a, l
    ld   h, c
    nop
    add  a, b
    sub  a, a
    and  c
    ld   [hl], $A6
    ld   [hl], $A1
    ld   [hl], $A6
    ld   [hl], $A1
    ld   [hl], $A2
    ld   [hl], $36
    and  c
    ld   [hl], $A2
    ld   [hl], $98
    nop
    adc  a, d
    rst  $18
    jp  c, label_3186
    ld   bc, $8636
    adc  a, d
    rst  $18
    jp  c, label_3186
    ld   bc, $8636
    sbc  a, l
    cpl
    ld   c, l
    jr   nz, label_6CCDB
    sbc  a, e
    ld   [bc], a
    xor  d
    jr   nc, label_6CD4A
    and  b

label_6CD4A::
    ld   bc, label_1A1
    sbc  a, h
    and  [hl]
    ld   bc, label_30AA
    ld   bc, label_1A0
    and  c
    ld   bc, label_29B
    xor  d
    jr   nc, label_6CD5D
    and  b

label_6CD5D::
    ld   bc, $A19C
    ld   bc, label_1A3
    sbc  a, e
    ld   [bc], a
    xor  d
    jr   nc, label_6CD69
    and  b

label_6CD69::
    ld   bc, label_1A1
    sbc  a, h
    and  [hl]
    ld   bc, label_30AA
    ld   bc, label_1A0
    and  c
    ld   bc, label_29B
    xor  d
    jr   nc, label_6CD7C
    and  b

label_6CD7C::
    ld   bc, $A19C
    ld   bc, label_1A6
    xor  d
    jr   nc, label_6CD86
    and  b

label_6CD86::
    ld   bc, $9B00
    rlca
    and  c
    dec  d
    dec  d
    dec  d
    dec  d
    rst  $38
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    rst  $38
    dec  d
    dec  d
    ld   a, [de]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    rst  $38
    rst  $38
    dec  d
    dec  d
    sbc  a, h
    rst  $38
    rst  $38
    dec  d
    rst  $38
    dec  d
    rst  $38
    rst  $38
    dec  d
    nop
    nop
    cp   c
    ld   c, d
    or   a
    ld   c, l
    cp   l
    ld   c, l

label_6CDB3::
    jp   label_4D
    nop
    ret
    ld   c, l
    rst  $38
    rst  $38
    or   a
    ld   c, l
    rst  $18
    ld   c, l
    rst  $38
    rst  $38
    cp   l
    ld   c, l
    dec  d
    ld   c, [hl]
    rst  $38
    rst  $38
    jp   label_9D4D
    ld   b, e
    nop
    add  a, b
    and  a
    ld   c, h
    ld   c, h
    ld   c, h
    ld   c, h
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, d
    ld   b, [hl]
    ld   b, [hl]
    ld   b, [hl]
    ld   b, [hl]
    ld   b, d
    ld   b, [hl]
    ld   c, d
    ld   d, b
    nop
    sbc  a, l
    ld   b, b
    ld   hl, $A880
    ld   e, d
    and  e
    ld   bc, label_6D8A2
    and  e
    ld   e, [hl]
    xor  b
    ld   d, b
    and  d
    ld   bc, label_6DAA3
    and  d
    ld   b, d
    and  e
    ld   b, [hl]
    and  d
    ld   c, d
    and  e
    ld   c, h
    and  d
    ld   c, d
    and  e
    ld   c, h
    and  a
    ld   b, b
    ld   d, h
    xor  [hl]

label_6CE01::
    ld   d, b
    and  d
    ld   bc, label_6C400
    ld   b, h
    ld   b, h
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, d
    nop
    nop
    nop
    nop
    sbc  a, l
    dec  b
    ld   c, [hl]
    jr   nz, label_6CDB3
    and  a
    ld   c, d
    ld   c, d
    ld   b, [hl]
    ld   b, [hl]
    ld   b, [hl]
    ld   b, [hl]
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, b
    ld   b, b
    ld   a, $3E
    ld   b, h
    ld   c, d
    nop

label_6CE2C::
    xor  a
    ld   [$D379], a
    ld   [$D34F], a
    ld   [$D398], a
    ld   [$D393], a
    ld   [$D3C9], a
    ld   [$D3A3], a
    ld   [$D3E5], a
    ld   a, $08
    ld   [rNR42], a
    ld   a, $80
    ld   [rNR44], a

label_6CE4A::
    ld   a, $FF
    ld   [rNR51], a

label_6CE4E::
    ld   a, $03
    ld   [$D355], a
    xor  a
    ld   [$D369], a

label_6CE57::
    xor  a
    ld   [$D361], a
    ld   [$D371], a
    ld   [$D31F], a
    ld   [$D32F], a
    ld   [$D33F], a
    ld   [$D39E], a
    ld   [$D39F], a
    ld   [$D3D9], a
    ld   [$D3DA], a
    ld   [$D3B6], a
    ld   [$D3B7], a
    ld   [$D3B8], a
    ld   [$D3B9], a
    ld   [$D3BA], a
    ld   [$D3BB], a
    ld   [$D394], a
    ld   [$D395], a
    ld   [$D396], a
    ld   [$D390], a
    ld   [$D391], a
    ld   [$D392], a
    ld   [$D3C6], a
    ld   [$D3C7], a
    ld   [$D3C8], a
    ld   [$D3A0], a
    ld   [$D3A1], a
    ld   [$D3A2], a
    ld   [$D3CD], a
    ld   [$D3D6], a
    ld   [$D3D7], a
    ld   [$D3D8], a
    ld   [$D3DC], a
    ld   [$D3E7], a
    ld   [$D3E2], a
    ld   [$D3E3], a
    ld   [$D3E4], a
    ld   a, $08
    ld   [rNR12], a
    ld   [rNR22], a
    ld   a, $80
    ld   [rNR14], a
    ld   [rNR24], a
    xor  a
    ld   [rNR10], a
    ld   [rNR30], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and  $4A
    ld   a, [de]
    ld   c, e
    ld   a, [de]
    ld   c, e
    dec  bc
    ld   d, b
    nop
    nop
    rrca
    ld   d, b
    nop
    nop
    sbc  a, l
    ld   bc, label_16F
    sub  a, h
    and  e
    ld   c, d
    and  d
    ld   c, [hl]
    and  e
    ld   d, d
    and  d
    ld   c, [hl]
    and  a
    ld   c, d
    ld   e, b
    ld   d, d
    ld   h, d
    xor  b
    ld   e, b
    and  e
    ld   e, b
    and  d
    ld   e, d
    and  e
    ld   e, b
    and  d
    ld   d, [hl]
    xor  b
    ld   d, b
    and  a
    ld   c, [hl]
    ld   e, b
    xor  b
    ld   c, d
    sbc  a, d
    nop
    nop
    ret  z
    ld   c, d
    ccf
    ld   d, b
    ld   b, a
    ld   d, b
    ld   c, a
    ld   d, b
    nop
    nop
    ld   l, e
    ld   [hl], b
    ld   e, e
    ld   d, b
    rst  $38
    rst  $38
    ld   b, c
    ld   d, b
    xor  e
    ld   d, b
    reti
    ld   d, b
    rst  $38
    rst  $38
    ld   c, c
    ld   d, b
    ld   h, b

label_6D050::
    ld   l, a
    inc  a
    ld   d, c
    ld   b, c
    ld   l, a
    ld   a, [hl]
    ld   d, c
    rst  $38
    rst  $38
    ld   d, e
    ld   d, b
    sbc  a, l
    ld   h, [hl]
    add  a, c
    add  a, b
    and  l
    ld   bc, label_1A2
    ld   e, [hl]
    and  c
    ld   e, [hl]
    ld   h, d
    ld   h, [hl]
    ld   l, b
    and  e
    ld   l, h
    ld   bc, $A101
    ld   h, h
    ld   l, [hl]
    ld   [hl], d
    db   $76 ; Halt
    and  e
    ld   a, h
    ld   bc, label_1A7
    and  c
    ld   h, h
    ld   l, b
    and  d
    ld   l, h
    ld   h, h
    and  e
    ld   e, d
    and  a
    ld   bc, label_29B
    and  c
    ld   l, b
    ld   l, h
    and  d
    ld   l, [hl]
    sbc  a, h
    ld   bc, label_1A7
    sbc  a, e
    ld   [bc], a
    and  c
    ld   h, h
    ld   l, b
    and  d
    ld   l, h
    sbc  a, h
    ld   bc, label_1A7
    and  c
    ld   h, d
    ld   h, [hl]
    and  d
    ld   l, d
    and  c

label_6D09D::
    ld   l, d
    ld   l, h
    ld   [hl], b
    ld   [hl], h
    db   $76 ; Halt
    ld   a, d
    and  d
    ld   [hl], h
    ld   bc, label_1A8
    and  l
    ld   bc, $9D00
    and  b
    add  a, h

label_6D0AE::
    add  a, b
    and  h
    ld   b, [hl]
    and  d
    ld   bc, label_6C646
    and  c
    ld   b, [hl]
    ld   b, [hl]
    sbc  a, e
    ld   [bc], a
    and  [hl]
    ld   b, [hl]
    and  c
    ld   b, d
    and  e
    ld   b, [hl]
    and  d
    ld   bc, label_6C646
    and  c
    ld   b, [hl]
    ld   b, [hl]
    sbc  a, h
    and  d
    ld   b, [hl]
    and  c
    inc  a
    inc  a
    sbc  a, e
    ld   [bc], a
    and  d
    inc  a
    and  c
    inc  a
    inc  a
    sbc  a, h
    and  d
    inc  a
    inc  a
    nop
    sbc  a, l
    add  a, b
    ld   hl, $A240
    ld   b, [hl]
    ld   bc, label_3CA7
    and  c
    ld   bc, label_6C646
    ld   c, d
    ld   c, [hl]
    ld   d, b
    and  h
    ld   d, h
    and  d
    ld   bc, label_6D454
    and  c
    ld   d, [hl]
    ld   e, d
    and  h
    ld   e, [hl]
    and  d
    ld   bc, label_6DE5E
    and  c
    ld   e, d
    ld   d, [hl]
    and  [hl]
    ld   e, d
    and  c
    ld   d, [hl]
    and  h
    ld   d, h
    and  e
    ld   d, h
    and  [hl]
    ld   d, b
    and  c
    ld   d, h
    and  h
    ld   d, [hl]
    and  d
    ld   d, h
    ld   d, b
    and  [hl]
    ld   c, h
    and  c
    ld   d, b
    and  h
    ld   d, h
    and  d
    ld   d, b
    ld   c, h
    and  [hl]
    ld   c, d
    and  c
    ld   c, [hl]
    and  h
    ld   d, d
    and  e
    ld   e, b
    sbc  a, l
    ld   h, b
    add  a, c
    add  a, b
    and  d
    ld   d, h
    and  c
    ld   b, [hl]
    ld   b, [hl]
    and  d
    ld   b, [hl]
    and  c
    ld   b, [hl]
    ld   b, [hl]
    and  e
    ld   b, [hl]
    ld   bc, label_1A2
    and  c
    ld   b, h
    ld   b, h
    and  d
    ld   b, h
    and  c
    ld   b, h
    ld   b, h
    and  e
    ld   b, h
    ld   bc, $9900
    and  e
    ld   c, [hl]
    and  d
    ld   bc, label_2EA1
    ld   l, $A2
    ld   l, $4E
    ld   c, [hl]
    and  c
    ld   c, [hl]
    ld   c, [hl]

label_6D14B::
    and  [hl]
    ld   c, d
    and  c
    ld   c, d
    and  d
    ld   c, d
    and  c
    ld   a, [hli]
    ld   a, [hli]
    and  d
    ld   a, [hli]
    ld   c, d
    ld   c, d
    and  c
    ld   c, d
    ld   c, d
    and  [hl]
    ld   c, h
    and  c
    ld   c, h
    and  d
    ld   c, h
    and  c
    ld   h, $26
    and  d
    ld   h, $4C
    ld   c, h
    and  c
    ld   c, h
    ld   c, h
    and  d
    ld   c, h
    and  c
    ld   b, h
    ld   b, h
    sbc  a, e
    ld   [bc], a
    and  d
    ld   b, h
    and  c
    ld   b, h
    ld   b, h
    sbc  a, h
    and  d
    inc  h
    and  c
    jr   z, label_6D1A9
    nop
    sbc  a, c
    sbc  a, e
    ld   [bc], a
    and  d
    ld   l, $A3
    ld   b, [hl]
    and  d
    ld   b, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    and  d
    ld   a, [hli]
    and  e
    ld   b, d
    and  d
    ld   b, d
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    and  d
    ld   h, $A3
    ld   a, $A2
    ld   a, $9C
    sbc  a, e
    ld   [bc], a
    and  d
    inc  [hl]
    and  e
    ld   c, h
    and  d
    ld   c, h
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    and  d
    jr   nc, label_6D14B
    ld   c, b

label_6D1A9::
    and  d
    ld   c, b
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    and  d
    ld   l, $A3
    ld   b, [hl]
    and  d
    ld   b, [hl]
    sbc  a, h
    and  d
    ldd  [hl], a
    and  e
    ld   c, d
    and  d
    ld   c, d
    ldd  [hl], a
    ld   c, d
    ld   e, [hl]
    ldd  [hl], a
    inc  a
    sbc  a, e
    ld   [bc], a
    and  c
    ld   d, b
    ld   d, b
    and  d
    ld   d, b
    sbc  a, h
    and  c
    ldd  [hl], a
    ldd  [hl], a
    and  d
    ldd  [hl], a
    and  c
    ldd  [hl], a
    ldd  [hl], a
    and  d
    inc  a
    sbc  a, e
    ld   [bc], a
    and  c
    ld   d, b
    ld   d, b
    and  d
    ld   d, b
    sbc  a, h
    and  c
    inc  h
    inc  h
    inc  h
    ld   h, $28
    inc  l
    nop
    nop
    xor  d
    ld   c, d
    db   $ED ; Undefined instruction
    ld   d, c
    dec  c
    ld   d, d
    ld   hl, $0052
    nop
    ld   a, d
    ld   l, a
    inc  h
    ld   [hl], b
    ld   b, c
    ld   d, d
    ld   b, c
    ld   d, d
    ld   b, c
    ld   d, d
    ld   b, c
    ld   d, d
    ld   b, c
    ld   d, d
    ld   b, c
    ld   d, d
    ld   a, a
    ld   l, a
    ld   a, [hli]
    ld   [hl], b
    ld   b, c
    ld   d, d
    ld   b, c
    ld   d, d
    ld   b, c
    ld   d, d
    ld   c, e
    ld   d, d
    rst  $38
    rst  $38
    db   $ED ; Undefined instruction
    ld   d, c
    add  a, h
    ld   l, a
    inc  h
    ld   [hl], b
    ld   d, l
    ld   d, d
    ld   e, l
    ld   d, d
    adc  a, c
    ld   l, a
    ld   a, [hli]
    ld   [hl], b
    ld   e, l
    ld   d, d
    ld   a, d
    ld   d, d
    rst  $38
    rst  $38
    dec  c
    ld   d, d
    ld   e, e
    ld   l, a
    inc  h
    ld   [hl], b
    ld   a, l
    ld   d, d
    ld   a, l
    ld   d, d
    ld   a, l
    ld   d, d
    ld   a, l
    ld   d, d
    ld   a, l
    ld   d, d
    ld   a, l
    ld   d, d
    ld   b, c
    ld   l, a
    ld   a, [hli]
    ld   [hl], b
    ld   a, l
    ld   d, d
    ld   a, l
    ld   d, d
    ld   a, l
    ld   d, d
    adc  a, b
    ld   d, d
    rst  $38
    rst  $38
    ld   hl, $A752
    ldi  [hl], a
    and  d
    ldi  [hl], a
    and  e
    inc  h
    ldi  [hl], a
    ld   e, $18
    nop
    and  a
    ldi  [hl], a
    and  d

label_6D24E::
    ldi  [hl], a
    and  e
    inc  h
    ldi  [hl], a
    ld   e, $01
    nop
    sbc  a, e
    inc  bc
    xor  b
    ld   bc, $A49C
    ld   bc, $9B00
    ld   [bc], a
    and  c
    ld   bc, label_6C240
    ld   b, h
    and  a
    ld   b, [hl]
    and  d
    db   $3A ; ldd  a, [hl]
    and  h
    ld   b, [hl]
    and  c
    ld   bc, label_6C644
    ld   b, h
    and  d
    ld   b, b
    inc  a
    and  a
    ld   b, b
    and  d
    ldd  [hl], a
    xor  b
    ld   b, b
    sbc  a, h
    nop
    and  e
    ld   bc, $9900
    and  a
    ldd  [hl], a
    and  d
    ldd  [hl], a
    and  e
    inc  [hl]
    ldd  [hl], a
    ld   l, $28
    nop
    sbc  a, c
    and  a
    ldd  [hl], a
    and  d
    ldd  [hl], a
    and  e
    inc  [hl]
    ldd  [hl], a
    ld   l, $01
    nop
    nop
    and  $4A
    sbc  a, [hl]
    ld   d, d
    and  h
    ld   d, d
    xor  h
    ld   d, d
    nop
    nop
    db   $EB ; Undefined instruction
    ld   d, d
    rst  $38
    rst  $38
    sbc  a, [hl]
    ld   d, d
    or   [hl]
    ld   d, d
    cp   e
    ld   d, d
    rst  $38
    rst  $38
    and  h
    ld   d, d
    ld   a, d
    ld   [hl], b
    daa
    ld   d, e
    cp   e
    ld   d, d
    rst  $38
    rst  $38
    xor  [hl]
    ld   d, d
    sbc  a, l
    ld   d, a
    nop
    add  a, b
    nop
    and  d
    ld   a, b
    ld   a, h
    and  e
    ld   a, [hl]
    ld   bc, $A201
    ld   a, b
    ld   a, h
    and  e
    ld   a, [hl]
    ld   bc, $A201
    ld   a, h
    ld   a, b
    ld   l, [hl]
    and  a
    ld   [hl], h
    and  e
    ld   a, b
    ld   bc, label_1A8
    and  d
    ld   a, b
    ld   a, h
    and  e
    ld   a, [hl]
    ld   bc, $A201
    ld   a, b
    ld   a, [hl]
    and  e
    adc  a, b
    ld   bc, $A201
    add  a, [hl]
    add  a, d
    and  h
    add  a, [hl]
    ld   bc, label_1A8
    nop
    sbc  a, l
    scf
    nop
    add  a, b
    and  a
    ld   bc, label_29B
    and  d
    ld   b, b
    ld   c, [hl]
    ld   e, b
    ld   e, h
    and  e
    ld   h, b
    ld   bc, $A29C
    ld   c, b
    ld   d, [hl]
    ld   e, h
    ld   l, d
    and  e
    ld   l, [hl]
    ld   bc, label_6C8A2
    ld   d, [hl]
    ld   e, h
    ld   d, [hl]
    ld   b, h
    ld   d, [hl]
    ld   e, h
    ld   d, [hl]
    sbc  a, e
    ld   [bc], a
    and  d
    ld   b, b
    ld   c, [hl]
    ld   e, b
    ld   e, h
    and  e
    ld   h, b
    ld   bc, $A29C
    ld   [hl], $44
    ld   c, h
    ld   d, d
    ld   d, [hl]
    ld   e, h
    ld   h, h
    ld   l, d
    ld   l, [hl]
    ld   l, d
    ld   l, [hl]
    ld   [hl], h
    adc  a, h
    nop
    sbc  a, l
    ld   hl, label_206F
    nop
    nop
    push af
    ld   c, d
    scf
    ld   d, e
    dec  a
    ld   d, e
    ld   a, [de]
    ld   c, e
    nop
    nop
    ld   b, e
    ld   d, e
    rst  $38
    rst  $38
    scf
    ld   d, e
    and  l
    ld   d, e
    rst  $38
    rst  $38

label_6D341::
    dec  a
    ld   d, e
    sbc  a, l
    ld   d, d
    nop
    add  a, b
    sbc  a, c
    sbc  a, e
    ld   [bc], a
    and  d
    ld   b, b
    ld   c, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, b
    ld   d, d
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, b
    ld   d, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, b
    ld   d, d
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, b
    ld   c, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, b
    ld   d, b
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, h
    ld   d, d
    sbc  a, h
    ld   c, [hl]
    ld   [hl], $3A
    ld   [hl], $9B
    ld   [bc], a
    ldd  [hl], a
    ld   b, b
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ldd  [hl], a
    ld   b, h
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    jr   nc, label_6D3C2
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    db   $3A ; ldd  a, [hl]
    ld   c, b
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    inc  l
    db   $3A ; ldd  a, [hl]
    sbc  a, h
    inc  l
    jr   c, label_6D3C2
    ldd  [hl], a
    sbc  a, l
    ld   b, b
    nop
    add  a, b
    and  h
    ld   [hl], $32
    sbc  a, [hl]
    inc  b
    ld   c, e
    and  h
    jr   nc, label_6D341
    inc  l
    sbc  a, l
    ld   d, d
    nop
    add  a, b
    and  d
    ld   [hl], $9E
    push af
    ld   c, d
    nop
    sbc  a, l
    ld   d, [hl]
    nop
    add  a, b
    and  e
    ld   h, [hl]
    ld   e, b
    and  a
    ld   e, h
    and  c
    ld   h, b
    ld   h, d
    and  d
    ld   h, [hl]
    ld   h, [hl]
    ld   e, b
    ld   e, b
    and  a
    ld   e, h
    and  c
    ld   h, b
    ld   h, d
    and  d
    ld   h, b
    ld   h, [hl]
    and  a
    ld   [hl], h
    and  d
    ld   [hl], b

label_6D3C2::
    ld   [hl], h
    ld   [hl], b
    ld   h, [hl]
    and  c
    ld   h, d
    ld   h, b
    and  e
    ld   e, h
    sbc  a, l
    ld   b, d
    nop
    add  a, b
    ld   d, [hl]
    sbc  a, l
    ld   d, [hl]
    nop
    add  a, b
    and  c
    ld   bc, label_6E260
    ld   h, [hl]
    and  e
    ld   l, d
    ld   e, b
    and  a
    ld   d, [hl]
    and  c
    ld   e, h
    ld   l, d
    and  d
    ld   h, [hl]
    ld   h, [hl]
    ld   d, [hl]
    ld   d, [hl]
    and  a
    ld   e, b
    and  c
    ld   e, b
    ld   d, [hl]
    and  d
    ld   d, d
    ld   e, b
    and  a
    ld   h, b
    and  d
    ld   e, h
    ld   e, b
    ld   d, b
    sbc  a, e

label_6D3F4::
    inc  b
    ld   c, [hl]
    ld   h, [hl]

label_6D3F7::
    sbc  a, h
    sbc  a, [hl]
    inc  b
    ld   c, e
    sbc  a, e
    inc  b
    and  d
    ld   h, [hl]
    ld   a, [hl]

label_6D400::
    sbc  a, h

label_6D401::
    sbc  a, [hl]
    push af

label_6D403::
    ld   c, d
    nop
    nop
    ret  z
    ld   c, d
    db   $10 ; Undefined instruction
    ld   e, $54
    inc  l
    ld   d, h
    nop
    nop
    ld   b, [hl]
    ld   d, h
    ld   [hl], c
    ld   d, h
    cp   h
    ld   d, h
    ld   [hl], c
    ld   d, h
    jp   hl
    ld   d, h
    rst  $38
    rst  $38
    ld   [de], a
    ld   d, h
    ld   h, d

label_6D41F::
    ld   d, l
    adc  a, a
    ld   d, l

label_6D422::
    call nz, label_8F55
    ld   d, l
    db   $E8 ; add  sp, d
    ld   d, l
    rst  $38
    rst  $38
    jr   nz, label_6D480
    ld   b, c
    ld   l, a
    ld   h, h
    ld   d, [hl]
    ld   b, c
    ld   l, a
    adc  a, l
    ld   d, [hl]
    xor  a
    ld   d, [hl]
    adc  a, l
    ld   d, [hl]
    db   $56
    ld   d, [hl]
    ld   b, [hl]
    ld   l, a
    ld   [label_6C156], a
    ld   l, a
    rst  $30
    ld   d, [hl]
    rst  $38
    rst  $38
    jr   nc, label_6D49A
    sbc  a, l
    ld   b, l
    nop
    add  a, b
    and  e
    jr   nc, label_6D3F7
    jr   nc, label_6D47F
    jr   nc, label_6D3F4
    inc  l
    xor  d
    inc  l

label_6D454::
    jr   nc, label_6D488
    and  e
    jr   c, label_6D403
    jr   c, label_6D493
    jr   c, label_6D400
    inc  a
    xor  d
    inc  a
    inc  a
    inc  a
    sbc  a, l
    ld   b, b
    ld   hl, $A881
    ld   b, b
    xor  d
    inc  a
    inc  a
    inc  a
    xor  b
    ld   b, b
    and  e
    ld   bc, $9D00
    ld   b, l
    nop
    add  a, b
    and  e
    jr   nc, label_6D422
    ldd  [hl], a
    jr   nc, label_6D4A7
    and  [hl]
    jr   nc, label_6D41F
    jr   nc, label_6D4B0

label_6D480::
    ldd  [hl], a
    ld   [hl], $3A
    and  [hl]
    inc  a
    and  c
    ld   b, b
    ld   b, b

label_6D488::
    ld   b, h
    ld   c, b
    ld   c, d
    and  e
    ld   c, [hl]
    xor  d
    inc  a
    ld   b, b
    ld   b, h
    and  [hl]
    ld   b, [hl]

label_6D493::
    and  c
    jr   c, label_6D4CE
    inc  a
    ld   b, b
    ld   b, h
    xor  d

label_6D49A::
    ld   b, [hl]
    ld   bc, label_6C646
    ld   b, h
    ld   b, b
    ld   b, [hl]

label_6D4A1::
    ld   bc, label_3C3C
    inc  a
    jr   c, label_6D4E3

label_6D4A7::
    ld   bc, label_3C3C
    jr   c, label_6D4E8
    and  d
    jr   c, label_6D450
    jr   c, label_6D4E7
    and  d
    jr   c, label_6D455
    jr   c, label_6D4F2
    and  e
    ld   b, b
    and  d
    inc  a
    jr   c, label_6D4BC

label_6D4BC::
    and  d
    ld   [hl], $A1
    ld   [hl], $32
    and  d
    ld   [hl], $A1
    ld   [hl], $38
    and  e
    inc  a
    and  d
    jr   c, label_6D501
    and  e
    inc  [hl]
    and  d

label_6D4CE::
    inc  [hl]
    and  c
    inc  [hl]
    ld   [hl], $A2
    db   $3A ; ldd  a, [hl]
    and  c
    db   $3A ; ldd  a, [hl]
    inc  a
    ld   b, b
    ld   b, h
    ld   b, [hl]
    ld   c, d
    and  e
    ld   b, h
    sbc  a, l
    ld   b, b
    ld   hl, $AA41
    ldd  [hl], a

label_6D4E3::
    ldd  [hl], a
    ldd  [hl], a
    and  e
    ld   [hl], $01

label_6D4E8::
    nop
    sbc  a, l
    ld   b, l
    nop
    add  a, b
    xor  d
    ld   [hl], $34
    ld   [hl], $3E

label_6D4F2::
    ld   b, b
    ld   b, h
    ld   b, [hl]
    ld   bc, label_6C646
    ld   b, h
    ld   b, b
    sbc  a, l
    ld   [hl], b
    ld   hl, $A680
    ld   c, [hl]
    ld   b, [hl]

label_6D501::
    and  d
    ld   b, b
    and  e
    ld   a, $AA
    ld   a, $3A
    ld   a, $AA
    ld   b, b
    ld   b, h
    ld   b, [hl]
    ld   c, d
    ld   b, [hl]
    ld   b, h
    and  e
    ld   b, [hl]
    ld   bc, label_6D09D
    ld   hl, $A381
    ld   b, [hl]
    and  a
    ld   b, b
    and  c
    ld   bc, label_6C646
    ld   c, d
    ld   c, [hl]
    ld   d, b
    xor  d
    ld   c, d
    ld   bc, $A446
    ld   b, h
    and  e
    inc  a
    xor  d
    ld   b, b
    ld   bc, $A336
    ld   [hl], $32
    db   $3A ; ldd  a, [hl]
    and  d
    ld   b, b
    and  c
    ld   b, b
    ld   a, $40
    ld   b, h
    ld   b, [hl]
    ld   c, d
    and  h
    ld   c, [hl]
    xor  d
    ld   c, [hl]
    ld   bc, $A44A
    ld   b, [hl]
    and  e
    ld   bc, label_6CAAA
    ld   bc, $A450
    ld   e, d
    and  e
    ld   bc, $AA01
    ld   b, b
    ld   b, b
    ld   b, b
    and  e
    ld   b, b
    ld   bc, label_6C09D
    ld   hl, $0140
    xor  d
    ld   c, d
    ld   c, d
    ld   c, d
    and  e
    ld   c, [hl]
    ld   bc, $9D00
    ld   d, l
    nop
    add  a, b
    and  e
    ld   b, b
    xor  d
    ld   b, b
    ld   [hl], $40
    and  e
    inc  a
    xor  d
    inc  a
    ld   b, b
    ld   b, h
    and  e
    ld   b, [hl]
    xor  d
    ld   b, [hl]
    ld   b, b
    ld   b, [hl]
    and  e
    ld   b, h
    xor  d
    ld   b, h
    ld   b, [hl]
    ld   c, d
    sbc  a, l
    ld   d, b
    ld   hl, $A881
    ld   c, [hl]
    xor  d
    ld   c, d
    ld   c, d
    ld   c, d
    xor  b
    ld   c, [hl]
    xor  d
    ld   c, d
    ld   c, b
    ld   b, h
    nop
    sbc  a, l
    ld   h, l
    nop
    add  a, b
    and  e
    ld   b, b
    and  a
    ld   [hl], $A1
    ld   bc, label_6C040
    ld   b, h
    ld   c, b
    ld   c, d
    and  h
    ld   c, [hl]
    xor  d
    ld   bc, label_6CE01
    ld   c, [hl]
    ld   d, b
    ld   d, h
    and  h
    ld   e, b
    xor  d
    ld   bc, label_6D801
    ld   e, b
    ld   d, h
    ld   d, b
    ld   d, h
    ld   bc, $A450
    ld   c, [hl]
    xor  d
    ld   c, [hl]
    ld   d, b
    ld   c, [hl]
    and  d
    ld   c, d
    and  c
    ld   c, d
    ld   c, [hl]
    and  h
    ld   d, b
    and  d
    ld   c, [hl]
    ld   c, d
    nop
    and  d
    ld   b, [hl]
    and  c
    ld   b, [hl]
    ld   c, d
    and  h
    ld   c, [hl]
    and  d
    ld   c, d
    ld   b, [hl]
    ld   b, h
    and  c
    ld   b, h
    ld   c, b
    and  h
    ld   c, h
    and  e
    ld   d, d
    and  d
    ld   c, [hl]
    sbc  a, l
    ld   h, b
    ld   hl, $AD01
    ld   [hl], $36
    ld   [hl], $AA
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    and  e
    ld   a, $01
    nop
    sbc  a, l
    ld   b, l
    nop
    add  a, b
    xor  d
    ld   b, [hl]
    ld   b, h
    ld   b, [hl]
    ld   c, d
    ld   b, [hl]
    ld   c, d
    ld   c, [hl]
    ld   bc, label_6CE4E
    ld   c, d
    ld   b, [hl]
    sbc  a, l
    ld   b, b
    nop
    add  a, c
    and  h
    ld   c, [hl]
    ld   h, [hl]
    xor  b

label_6D601::
    ld   e, b
    sbc  a, l
    ld   [hl], b
    ld   hl, $AA41
    ld   c, [hl]
    ld   d, b
    ld   d, h
    and  e
    ld   e, b
    and  a
    ld   c, [hl]
    and  c
    ld   bc, label_6D858
    ld   e, h
    ld   e, [hl]
    ld   h, d
    xor  d
    ld   e, h
    ld   bc, $A754
    ld   c, d
    and  c
    ld   c, d
    ld   c, [hl]

label_6D61E::
    ld   d, h
    ld   d, b
    ld   c, [hl]
    ld   c, d
    xor  d
    ld   c, [hl]
    ld   bc, $A740
    ld   b, b
    and  c
    ld   b, b
    ld   a, $40
    ld   b, h
    ld   b, [hl]
    ld   c, d
    and  h
    ld   c, [hl]
    and  e
    ld   bc, label_6CEAA
    ld   c, d
    ld   c, [hl]
    xor  d
    ld   e, [hl]
    ld   bc, $A35C
    ld   e, b
    xor  d
    ld   bc, label_6CE4E
    ld   c, [hl]
    ld   b, [hl]
    ld   e, b
    ld   e, d
    ld   bc, $A35E
    ld   h, d
    xor  d

label_6D64A::
    ld   bc, label_6E662
    ld   l, b
    ld   l, h
    ld   l, b
    and  l
    ld   h, [hl]
    sbc  a, l
    ld   b, b
    ld   hl, $A240
    ld   bc, label_6CEAD
    ld   c, [hl]
    ld   c, [hl]
    xor  d
    ld   d, d
    ld   d, d
    ld   d, d
    and  e
    ld   d, [hl]

label_6D662::
    ld   bc, $9900
    and  e
    ld   b, b

label_6D667::
    xor  d
    ld   b, b
    ld   b, b
    ld   b, b
    and  e
    inc  a

label_6D66D::
    xor  d
    inc  a
    inc  a
    inc  a
    and  e
    jr   c, label_6D61E
    jr   c, label_6D6AE
    jr   c, label_6D6B4
    inc  a
    inc  a
    inc  a
    jr   c, label_6D6B9
    sbc  a, e
    ld   [bc], a
    and  e
    ld   b, b
    xor  d
    ld   b, b
    ld   b, b
    ld   b, b
    and  e
    ld   b, b
    xor  d
    ld   [hl], $36
    ld   [hl], $9C
    nop
    and  e
    jr   z, label_6D63A
    jr   z, label_6D6BA
    inc  h
    and  e
    jr   z, label_6D6BE
    inc  h
    xor  d
    inc  h
    inc  h
    jr   nz, label_6D63F
    inc  h
    inc  h
    jr   nz, label_6D64A
    jr   nz, label_6D6C2

label_6D6A2::
    ld   e, $A3
    jr   nz, label_6D6C6
    ld   l, $AA
    ld   l, $2E
    ld   a, [hli]
    and  e
    ld   l, $2E

label_6D6AE::
    nop
    ld   a, [hli]
    xor  d

label_6D6B1::
    ld   a, [hli]
    ld   a, [hli]
    jr   z, label_6D658
    ld   a, [hli]
    xor  d
    ld   a, [hli]
    ld   a, [hli]

label_6D6B9::
    ld   a, [hli]

label_6D6BA::
    and  e
    jr   z, label_6D667
    jr   z, label_6D6E7
    inc  h
    and  e
    jr   z, label_6D66D
    jr   z, label_6D6ED
    jr   z, label_6D662
    ld   [bc], a

label_6D6C8::
    and  e
    inc  l
    xor  d
    inc  l
    inc  l
    inc  l
    sbc  a, h
    and  e
    ld   [hl], $AA
    ld   b, b
    ld   b, b

label_6D6D4::
    ld   b, b
    sbc  a, d
    and  e

label_6D6D7::
    ld   b, h
    sbc  a, c
    and  d

label_6D6DA::
    ldi  [hl], a
    ld   h, $00

label_6D6DD::
    and  e
    ld   a, [hli]
    xor  d
    ld   b, d
    ld   b, d
    ld   b, b
    and  e
    ld   b, d
    xor  d
    ld   b, d

label_6D6E7::
    ld   b, d
    ld   b, d
    nop
    sbc  a, d
    and  e
    ld   b, b

label_6D6ED::
    ld   a, $A4
    inc  a
    and  e
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    sbc  a, c
    and  e
    ld   [hl], $00
    xor  d
    ld   [hl], $4E
    ld   c, d
    ld   b, [hl]
    ld   b, h
    ld   b, b
    and  e
    ld   b, h
    ld   b, b
    ld   bc, $AA20
    jr   c, label_6D746
    ld   b, [hl]
    and  e
    ld   d, b
    xor  d
    jr   nz, label_6D72C
    jr   nz, label_6D6B1
    ld   e, $AA
    ld   [hl], $3C
    ld   b, h
    and  e
    ld   c, [hl]
    xor  d
    ld   [hl], $36
    ld   [hl], $9B
    inc  bc
    and  e
    jr   z, label_6D6C8
    jr   z, label_6D748
    jr   z, label_6D6BE
    and  [hl]
    jr   z, label_6D74D
    and  d
    inc  h
    and  e
    jr   nz, label_6D6D4
    jr   nz, label_6D754

label_6D72C::
    ld   l, $A3
    jr   c, label_6D6DA
    jr   nz, label_6D752
    jr   nz, label_6D6D7
    ld   a, [hli]
    xor  d
    ld   a, [hli]
    ldd  [hl], a
    jr   c, label_6D6DD
    ld   b, d
    xor  d
    ld   a, [hli]
    ld   a, [hli]
    ld   a, [hli]
    and  e
    ld   e, $AA
    ld   c, d
    ld   c, d
    ld   c, d
    and  e

label_6D746::
    ld   c, d
    xor  d

label_6D748::
    ld   e, $1E
    ld   e, $A3
    ld   e, $AA
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, h

label_6D752::
    jr   c, label_6D78A

label_6D754::
    ldd  [hl], a
    ld   l, $2C
    nop
    nop
    ret  z
    ld   c, d
    ld   h, e
    ld   d, a
    adc  a, l
    ld   d, a
    and  a
    ld   d, a
    jp   label_9857
    ld   l, a
    db   $D3 ; Undefined instruction
    ld   d, a
    db   $D3 ; Undefined instruction
    ld   d, a
    sbc  a, b
    ld   l, a
    ld    hl, sp+$57
    ld   d, $58
    sbc  a, b
    ld   l, a
    ld    hl, sp+$57
    daa
    ld   [hl], b
    ld   a, d
    ld   l, a
    ld    hl, sp+$57
    sbc  a, l
    ld   l, a
    ld    hl, sp+$57
    ld   d, $58
    inc  h
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    sbc  a, b
    ld   l, a
    ld    hl, sp+$57
    ld    hl, sp+$57
    rst  $38

label_6D78A::
    rst  $38
    ld   l, c
    ld   d, a
    ld   l, e
    ld   [hl], b
    ld   l, a
    ld   e, b
    and  d
    ld   l, a
    adc  a, [hl]
    ld   e, b
    ld   l, e
    ld   [hl], b
    ld   l, e
    ld   [hl], b
    and  a
    ld   l, a
    adc  a, [hl]
    ld   e, b
    ld   h, c
    ld   [hl], b
    ld   l, e
    ld   [hl], b
    dec  de
    ld   e, c
    rst  $38
    rst  $38
    sub  a, c
    ld   d, a
    ld   d, l
    ld   l, a
    ld   h, $59
    ld   l, e
    ld   l, a
    inc  sp
    ld   e, c
    ld   a, a
    ld   e, c
    ld   l, e
    ld   [hl], b
    ld   [hl], c
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    ld   a, a
    ld   e, c
    ld   h, c
    ld   [hl], b
    ld   l, e
    ld   [hl], b
    ld   l, e
    ld   [hl], b
    rst  $38
    rst  $38
    xor  e
    ld   d, a
    sub  a, h
    ld   e, c
    and  c
    ld   e, c
    cp   b
    ld   e, c
    jp   nz, label_B859
    ld   e, c
    reti
    ld   e, c
    rst  $38
    rst  $38
    push bc
    ld   d, a
    sbc  a, l
    inc  sp
    nop
    add  a, b
    sbc  a, e
    inc  b
    and  d
    ld   c, [hl]
    and  c
    ld   c, [hl]
    ld   c, [hl]
    sbc  a, h
    sbc  a, e
    inc  b
    and  d
    ld   d, d

label_6D7E3::
    and  c
    ld   d, d
    ld   d, d
    sbc  a, h
    sbc  a, e
    inc  b
    and  d
    ld   d, h
    and  c
    ld   d, h
    ld   d, h
    sbc  a, h
    sbc  a, e
    inc  b
    and  d
    ld   d, d
    and  c
    ld   d, d
    ld   d, d
    sbc  a, h
    nop

label_6D7F8::
    sbc  a, e
    inc  b
    and  c
    jr   z, label_6D833
    ld   l, $36
    sbc  a, h
    sbc  a, e

label_6D801::
    inc  b
    jr   z, label_6D83E
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    sbc  a, h
    sbc  a, e
    inc  b
    jr   z, label_6D847
    ld   [hl], $3C
    sbc  a, h
    sbc  a, e
    inc  b
    jr   z, label_6D84C
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    jr   nz, label_6D850
    ld   l, $36
    sbc  a, h
    sbc  a, e
    inc  b
    inc  h
    ldd  [hl], a
    inc  l
    ldd  [hl], a
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    inc  h
    ld   [hl], $2E
    ld   [hl], $9C
    sbc  a, e
    ld   [bc], a
    jr   z, label_6D869
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    sbc  a, h
    sbc  a, e

label_6D833::
    inc  b
    inc  l
    ld   a, $36
    ld   a, $9C
    sbc  a, e
    inc  b
    jr   z, label_6D873
    ld   l, $36
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, [hli]
    jr   c, label_6D877
    jr   c, label_6D7E3

label_6D847::
    sbc  a, e
    inc  b
    jr   z, label_6D881
    ld   l, $36
    sbc  a, h
    sbc  a, e
    inc  b

label_6D850::
    ldi  [hl], a
    ld   [hl], $2E
    ld   [hl], $9C
    sbc  a, e
    inc  b
    ld   a, [hli]

label_6D858::
    jr   c, label_6D88C
    jr   c, label_6D7F8
    and  c
    ld   [hl], $40
    ld   b, h
    ld   c, d
    and  e
    ld   c, [hl]
    and  h
    ld   bc, label_6D09D
    ld   h, $01

label_6D869::
    and  h
    ld   c, [hl]
    ld   c, d
    ld   b, [hl]
    ld   c, d
    nop
    sbc  a, l

label_6D870::
    ld   b, b
    ld   h, $41

label_6D873::
    and  e
    ld   b, b
    and  a
    ld   [hl], $A2
    ld   b, b
    and  c
    ld   b, b
    ld   b, h
    ld   b, [hl]
    ld   c, d
    and  l
    ld   c, [hl]
    and  e

label_6D881::
    ld   e, b
    and  a
    ld   c, [hl]
    and  d
    ld   e, b
    and  c
    ld   e, b
    ld   e, h
    ld   e, [hl]
    ld   h, d
    and  l

label_6D88C::
    ld   h, [hl]
    nop
    and  [hl]
    ld   b, b
    and  c
    ld   [hl], $A7
    ld   [hl], $A2
    ld   b, b
    and  c
    ld   b, b
    ld   b, h
    ld   b, [hl]
    ld   c, d
    and  a
    ld   c, [hl]
    and  c
    ld   d, d
    ld   d, h
    and  [hl]
    ld   d, d

label_6D8A2::
    ld   c, [hl]
    and  d
    ld   c, d

label_6D8A5::
    and  [hl]
    ld   c, [hl]
    and  c
    ld   b, b
    and  l
    ld   e, b
    and  d
    ld   bc, label_6DE4E
    ld   e, h
    ld   e, [hl]
    ld   h, d
    ld   h, [hl]
    and  c
    ld   e, b
    ld   h, [hl]
    and  e
    ld   [hl], b
    and  d
    ld   bc, label_6E266
    ld   e, [hl]
    ld   h, d
    and  c
    ld   d, h
    ld   h, d
    and  e
    ld   l, h
    and  d
    ld   bc, label_6DE62
    ld   e, h
    and  [hl]
    ld   e, [hl]
    and  c
    ld   c, [hl]
    and  e
    ld   c, [hl]
    and  d
    ld   bc, label_6CAAD
    ld   c, [hl]
    ld   c, d
    and  d
    ld   b, [hl]
    ld   c, d
    and  l
    ld   c, [hl]

label_6D8D9::
    and  [hl]
    ld   b, b
    and  c
    ld   [hl], $A7

label_6D8DE::
    ld   [hl], $A2
    ld   b, b
    and  c
    ld   b, b

label_6D8E3::
    ld   b, h

label_6D8E4::
    ld   b, [hl]
    ld   c, d
    and  a
    ld   c, [hl]
    and  c
    ld   d, b
    ld   d, h
    and  [hl]
    ld   d, b
    ld   c, [hl]
    and  d

label_6D8EF::
    ld   c, d

label_6D8F0::
    and  [hl]
    ld   b, [hl]
    and  c
    ld   b, b
    and  a
    ld   c, [hl]
    and  d
    ld   b, [hl]
    ld   e, b
    ld   c, [hl]
    and  a
    ld   e, [hl]
    and  d
    ld   e, h
    ld   e, b
    ld   e, h
    ld   e, [hl]
    ld   h, d
    and  d
    ld   h, [hl]
    and  c
    ld   h, d

label_6D906::
    ld   h, [hl]

label_6D907::
    and  e
    ld   l, b
    and  d
    ld   bc, label_6ECA6
    ld   l, b
    ld   h, [hl]
    ld   e, h

label_6D910::
    and  d

label_6D911::
    ld   e, [hl]
    and  [hl]
    ld   h, d
    ld   e, [hl]
    and  d
    ld   e, h
    and  l
    ld   e, b
    ld   [hl], b
    nop
    sbc  a, l
    ld   d, [hl]
    nop
    add  a, b
    sbc  a, e
    inc  b
    and  h
    ld   bc, $9C8C
    nop
    sbc  a, e
    rra
    and  d
    ld   b, b
    and  c

label_6D92B::
    ld   b, b
    ld   b, b
    sbc  a, h
    ld   bc, label_161A
    inc  d
    nop
    sbc  a, c
    sbc  a, e

label_6D935::
    ld   [bc], a
    and  e
    jr   z, label_6D8DD
    jr   z, label_6D8DE
    jr   z, label_6D8D9
    jr   z, label_6D8E3
    jr   z, label_6D8E4
    ld   [hl], $32
    and  h
    ldd  [hl], a
    and  d
    ldd  [hl], a
    ld   [hl], $A3
    jr   c, label_6D8EF
    jr   c, label_6D8F0
    jr   c, label_6D98B
    and  h
    inc  a
    and  e
    inc  a
    ld   l, $2E
    ldd  [hl], a
    ldd  [hl], a
    ld   [hl], $A4
    ld   [hl], $A1
    ld   [hl], $32
    ld   l, $2C
    and  e
    jr   z, label_6D906
    jr   z, label_6D907
    jr   z, label_6D990
    and  h
    ld   a, [hli]
    and  e
    ld   a, [hli]
    jr   z, label_6D910
    jr   z, label_6D911
    inc  h
    ldi  [hl], a
    and  h
    ldi  [hl], a
    and  e
    ldi  [hl], a
    ld   a, [hli]
    and  h
    ld   a, [hli]
    and  e
    ld   a, [hli]
    ld   [hl], $01
    ld   bc, label_1E9A
    nop
    and  [hl]
    jr   z, label_6D9B8
    and  d
    jr   z, label_6D92B
    inc  h
    ldd  [hl], a
    and  d
    inc  h
    and  [hl]
    jr   nz, label_6D9BA
    and  d
    jr   nz, label_6D935
    inc  h

label_6D990::
    ldd  [hl], a
    and  d
    inc  h
    nop
    sbc  a, e
    rra
    and  d
    dec  bc
    and  c
    dec  bc
    dec  bc
    sbc  a, h
    dec  d
    dec  d
    dec  d
    dec  d
    nop
    sbc  a, e
    dec  c
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    sbc  a, h
    nop

label_6D9B8::
    and  c
    dec  d

label_6D9BA::
    dec  d
    dec  d
    dec  d
    and  e
    dec  d
    and  h
    ld   bc, $9B00
    rla
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    sbc  a, h
    nop
    sbc  a, e
    inc  c
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    and  d
    dec  d
    and  c
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    sbc  a, h
    nop
    nop
    inc  b
    ld   c, e
    ei
    ld   e, c
    ld   bc, label_75A
    ld   e, d
    nop
    nop
    rrca
    ld   e, d
    rst  $38
    rst  $38
    ei
    ld   e, c
    ccf
    ld   e, d
    rst  $38
    rst  $38
    ld   bc, label_6C65A
    ld   l, a
    ld   a, d
    ld   e, d
    rst  $38
    rst  $38
    rlca
    ld   e, d
    sbc  a, l
    ld   b, h
    nop
    add  a, b
    sbc  a, b
    sbc  a, e
    ld   [bc], a
    and  e
    ld   bc, label_6C6A2
    and  c
    adc  a, b
    adc  a, b
    and  e
    ld   bc, label_6C4A2
    and  c
    adc  a, b
    adc  a, b
    sbc  a, h
    sbc  a, l
    inc  h
    nop
    add  a, b
    and  e
    ld   bc, label_6E4A2
    ld   h, d
    ld   h, b
    ld   h, h
    ld   e, [hl]
    ld   h, b
    ld   e, h
    ld   h, b
    ld   e, d
    ld   e, h
    ld   e, b
    ld   d, [hl]
    and  h
    ld   bc, $A197
    adc  a, b
    adc  a, b
    nop
    sbc  a, l
    ld   d, b
    add  a, h
    nop
    and  [hl]
    ld   [hl], b
    and  c
    ld   h, [hl]
    and  d
    ld   h, b
    ld   e, b
    and  e
    ld   e, d
    and  c
    ld   l, b
    ld   h, d
    ld   e, d
    ld   d, b
    and  d
    ld   c, [hl]
    and  c
    ld   h, [hl]
    ld   h, b
    and  d
    ld   e, b
    ld   c, [hl]
    ld   d, h
    and  c
    ld   d, b
    ld   d, h
    and  e
    ld   c, [hl]
    sbc  a, l
    inc  h
    nop
    nop
    and  d
    ld   c, h
    ld   c, [hl]
    ld   l, b
    ld   h, [hl]
    ld   h, h
    ld   h, [hl]
    ld   h, d
    ld   h, h
    ld   h, b
    ld   h, d
    ld   e, [hl]
    ld   h, b
    and  c
    ld   e, h
    ld   e, [hl]
    ld   e, d
    ld   e, h
    and  e
    ld   bc, label_1A7
    nop
    sbc  a, e
    ld   [bc], a
    sbc  a, c
    and  d
    ld   b, b
    ld   c, h
    ld   d, [hl]
    ld   c, h
    ld   [hl], $4A
    ld   d, h
    ld   c, d
    sbc  a, h
    and  l
    ld   bc, $A701
    ld   bc, $0000
    rst  $10
    ld   c, d
    sbc  a, b
    ld   e, d
    or   d
    ld   e, d
    call nz, label_D65A
    ld   e, d
    ld   a, [hli]
    ld   [hl], b
    ld   e, [hl]
    ld   [hl], b
    or   c
    ld   l, a
    ld   sp, hl
    ld   e, d
    xor  h

label_6DAA1::
    ld   l, a
    ld   sp, hl

label_6DAA3::
    ld   e, d
    inc  h
    ld   [hl], b
    ld   [$FF5A], a
    ld   a, [hli]
    ld   [hl], b
    ld   [$FF5A], a
    ld   h, c
    ld   [hl], b
    rst  $38
    rst  $38
    sbc  a, b
    ld   e, d
    or   c
    ld   l, a
    ld   hl, $AC5B
    ld   l, a
    jr   z, label_6DB15
    nop
    ld   e, e
    nop
    ld   e, e
    ld   h, c
    ld   [hl], b
    rst  $38
    rst  $38
    or   d
    ld   e, d
    ld   b, c
    ld   l, a
    ld   h, c
    ld   [hl], b
    cpl
    ld   e, e
    ld   b, l
    ld   e, e
    cpl
    ld   e, e
    ld   b, l
    ld   e, e
    ld   h, c
    ld   [hl], b
    rst  $38
    rst  $38
    call nz, label_6E85A
    ld   e, e
    ld   e, d

label_6DAD9::
    ld   e, e
    ld   l, b
    ld   e, e
    rst  $38
    rst  $38

label_6DADE::
    sub  a, $5A
    sbc  a, l
    inc  sp
    nop

label_6DAE3::
    add  a, b
    sbc  a, e
    inc  b
    and  c
    ld   e, b
    ld   d, [hl]
    ld   d, h

label_6DAEA::
    ld   d, d
    ld   d, b
    ld   c, [hl]
    ld   c, h

label_6DAEE::
    ld   c, d
    ld   c, b
    ld   c, d
    ld   c, h
    ld   c, [hl]

label_6DAF3::
    ld   d, b

label_6DAF4::
    ld   d, d
    ld   d, h
    ld   d, [hl]
    sbc  a, h

label_6DAF8::
    nop
    sbc  a, e
    inc  b
    and  c
    ld   b, [hl]
    ld   b, h
    sbc  a, h
    nop
    sbc  a, l
    ld   b, b
    add  a, c
    add  a, b
    and  a
    ld   e, b
    and  d
    ld   c, [hl]
    ld   e, b
    ld   e, h
    ld   h, b
    ld   h, [hl]
    and  a
    ld   h, h
    and  d
    ld   h, [hl]
    and  h
    ld   l, b
    and  a
    ld   e, b
    and  d

label_6DB15::
    ld   c, [hl]
    ld   e, b
    ld   e, h
    ld   h, b
    ld   h, [hl]
    and  a
    ld   h, h
    and  d
    ld   h, [hl]
    and  h
    add  a, b
    nop
    sbc  a, e
    inc  c
    and  c
    ld   e, b
    ld   d, [hl]
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    and  c
    ld   e, b
    ld   d, [hl]
    sbc  a, h
    nop
    sbc  a, c
    and  e
    jr   z, label_6DAD5
    ld   [hl], $A3
    jr   z, label_6DAD9
    jr   z, label_6DB63
    jr   c, label_6DADE
    jr   z, label_6DADF
    ld   [hl], $A3
    jr   z, label_6DAE3
    jr   z, label_6DB67
    ld   h, $00
    and  e
    jr   z, label_6DAEA
    ld   [hl], $A3
    jr   z, label_6DAEE
    jr   z, label_6DB78
    jr   c, label_6DAF3
    jr   z, label_6DAF4
    ld   [hl], $A3
    jr   z, label_6DAF8
    jr   z, label_6DB8E
    ld   b, b
    nop
    sbc  a, e
    ld   [label_29A2], sp
    add  hl, hl
    add  hl, hl
    add  hl, hl
    and  e
    rst  $38

label_6DB63::
    and  d
    add  hl, hl
    add  hl, hl
    sbc  a, h

label_6DB67::
    nop
    and  e
    add  hl, hl
    and  d
    add  hl, hl
    add  hl, hl
    and  e
    rst  $38
    and  d
    add  hl, hl
    add  hl, hl
    and  d
    add  hl, hl
    add  hl, hl
    add  hl, hl
    add  hl, hl
    and  e

label_6DB78::
    rst  $38
    and  d
    add  hl, hl
    add  hl, hl
    nop
    nop
    inc  b
    ld   c, e
    adc  a, b
    ld   e, e
    sub  a, h
    ld   e, e
    sbc  a, h
    ld   e, e
    xor  b
    ld   e, e

label_6DB88::
    ld   h, c
    ld   [hl], b
    xor  [hl]
    ld   e, e
    xor  [hl]
    ld   e, e

label_6DB8E::
    cp   [hl]
    ld   e, e
    rst  $38
    rst  $38
    adc  a, d
    ld   e, e
    db   $D3 ; Undefined instruction
    ld   e, e

label_6DB96::
    db   $F4 ; Undefined instruction
    ld   e, e
    rst  $38
    rst  $38
    sub  a, [hl]
    ld   e, e
    ld   h, c
    ld   [hl], b
    ld   l, e
    ld   l, a
    ld   h, $5C
    ld   b, h
    ld   e, h
    rst  $38
    rst  $38
    sbc  a, [hl]
    ld   e, e
    ld   h, c
    ld   e, h
    rst  $38
    rst  $38
    xor  b
    ld   e, e
    sbc  a, l
    inc  hl
    nop
    add  a, b
    sbc  a, e
    jr   nz, label_6DB55
    ld   e, [hl]
    ld   h, d
    sbc  a, h
    sbc  a, e
    jr   nz, label_6DC1D
    ld   h, h
    sbc  a, h
    nop
    sbc  a, e
    jr   nz, label_6DC1F
    ld   d, h
    sbc  a, h
    sbc  a, e
    jr   nz, label_6DC22
    ld   d, d
    sbc  a, h
    sbc  a, e
    jr   nz, label_6DC29
    ld   d, b
    sbc  a, h
    sbc  a, e
    jr   nz, label_6DC2C
    ld   d, d
    sbc  a, h
    nop
    sbc  a, l
    add  a, c
    add  a, d
    nop
    and  d
    db   $10 ; Undefined instruction
    and  c
    inc  h
    and  d
    ld   h, $A1
    jr   z, label_6DB88
    ld   bc, label_CA1
    ld   c, $A2
    db   $10 ; Undefined instruction
    ld   e, $A2
    inc  h
    ld   h, $A1
    jr   z, label_6DB96
    ld   bc, label_CA1
    ld   c, $00
    sbc  a, l

label_6DBF5::
    ld   b, b
    nop
    add  a, c
    sbc  a, e

label_6DBF9::
    ld   [bc], a
    and  h
    ld   e, b
    ld   c, [hl]
    xor  b
    ld   c, [hl]
    and  b
    ld   e, b
    ld   d, [hl]
    ld   e, b
    ld   e, h
    ld   e, [hl]
    ld   e, h
    ld   e, [hl]
    ld   h, d
    and  [hl]
    ld   h, [hl]
    ld   l, b
    and  d
    ld   l, h
    xor  b
    ld   [hl], b
    and  d
    ld   [hl], b
    ld   l, h
    and  [hl]
    ld   l, b
    ld   h, d
    and  d
    ld   e, d
    sbc  a, h
    sbc  a, l
    jr   nc, label_6DC1B

label_6DC1B::
    ld   bc, label_6D8A5
    ld   c, [hl]

label_6DC1F::
    ld   d, b
    ld   d, d
    ld   d, h

label_6DC22::
    ld   d, h
    ld   d, [hl]
    ld   d, [hl]
    nop
    sbc  a, c
    and  d
    jr   z, label_6DC60
    and  c
    inc  a

label_6DC2C::
    and  d
    ld   a, $A1
    ld   b, b
    and  a
    ld   bc, label_24A1
    ld   h, $A2
    jr   z, label_6DBD9
    ld   [hl], $A2
    inc  a
    ld   a, $A1
    ld   b, b
    and  a
    ld   bc, label_26A1
    jr   z, label_6DC44

label_6DC44::
    and  d
    ld   a, [hli]
    jr   c, label_6DBE9
    ld   a, $A2
    ld   b, b
    and  c
    ld   b, d
    and  a
    ld   bc, label_26A1
    jr   z, label_6DBF5
    ld   a, [hli]
    and  c
    jr   c, label_6DBF9
    ld   a, $40
    and  c
    ld   b, d
    and  a
    ld   bc, label_24A1
    ld   h, $00
    sbc  a, e
    inc  b
    and  c
    add  hl, hl
    sbc  a, h
    rst  $38
    sbc  a, e
    dec  b
    add  hl, hl
    sbc  a, h
    rst  $38
    sbc  a, e
    dec  b
    add  hl, hl
    sbc  a, h
    nop
    inc  b
    and  $4A
    ld   a, h
    ld   e, h
    add  a, [hl]
    ld   e, h
    ld   a, [de]
    ld   c, e
    nop
    nop
    dec  l
    ld   [hl], b
    ld   a, d
    ld   [hl], b
    adc  a, [hl]
    ld   e, h
    rst  $38
    rst  $38
    add  a, b
    ld   e, h
    ldd  [hl], a
    ld   [hl], b
    adc  a, [hl]
    ld   e, h
    rst  $38
    rst  $38
    add  a, [hl]
    ld   e, h
    and  d
    ld   e, h
    inc  a
    ld   c, d
    ld   d, d
    ld   e, b
    ld   e, h
    ld   e, [hl]
    ld   b, b
    ld   c, [hl]
    ld   d, h
    ld   e, h
    ld   e, [hl]
    ld   h, d
    ld   b, h
    ld   d, d
    ld   e, b
    ld   [hl], b
    ld   l, h
    ld   h, d
    ld   [hl], $44
    ld   c, d
    ld   e, [hl]
    ld   e, h
    ld   e, h
    ld   b, b
    ld   c, [hl]
    ld   d, h
    ld   e, b
    ld   e, h
    ld   e, [hl]

label_6DCAE::
    ld   b, b
    ld   c, h
    ld   d, h
    ld   e, h
    ld   e, [hl]
    ld   e, b
    ldd  [hl], a
    ld   b, b
    ld   b, [hl]
    ld   c, h
    ld   d, h
    ld   d, d
    ld   c, d
    ld   c, [hl]
    ld   d, d
    ld   d, h
    ld   e, b
    ld   e, h
    inc  a
    ld   c, d
    ld   d, d
    ld   e, b
    ld   e, h
    ld   e, [hl]
    ld   b, b
    ld   c, [hl]
    ld   d, h
    ld   e, h
    ld   e, [hl]
    ld   h, d
    ld   b, h
    ld   d, d
    ld   e, b
    ld   [hl], h
    ld   [hl], b
    ld   [hl], b
    ld   [hl], $44
    ld   l, [hl]
    ld   l, b
    ld   h, [hl]
    ld   h, d
    ld   b, b
    ld   c, [hl]
    ld   d, h
    ld   e, [hl]
    ld   e, h
    ld   e, h
    ldd  [hl], a
    ld   b, b
    ld   b, [hl]
    ld   e, b
    ld   e, h
    ld   d, h
    ld   b, [hl]
    ld   d, h
    ld   e, h
    ld   e, [hl]
    ld   [hl], h
    ld   [hl], b
    ld   b, h
    ld   d, d
    ld   e, b
    ld   e, h
    ld   l, d
    ld   h, [hl]
    ld   b, b
    ld   c, [hl]
    ld   d, h
    ld   e, b

label_6DCF4::
    ld   h, [hl]
    ld   h, h
    ldd  [hl], a
    ld   b, b
    ld   b, [hl]
    ld   c, h
    ld   d, h
    ld   h, d
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   c, d
    ld   d, d
    and  e
    ld   h, d
    and  d
    ld   h, d
    and  a
    ld   a, d
    ldd  [hl], a
    nop
    nop
    inc  b
    ld   c, e
    inc  d
    ld   e, l
    ldi  [hl], a
    ld   e, l
    inc  l
    ld   e, l
    jr   c, label_6DD71
    ld   e, [hl]
    ld   [hl], b
    inc  h
    ld   [hl], b
    ld   a, $5D
    ld   a, [hli]
    ld   [hl], b
    ld   a, $5D
    rst  $38
    rst  $38

label_6DD20::
    ld   d, $5D
    ld   e, [hl]
    ld   [hl], b
    ld   h, b
    ld   e, l
    ld   h, b
    ld   e, l
    rst  $38
    rst  $38

label_6DD2A::
    inc  h
    ld   e, l
    ld   e, [hl]
    ld   [hl], b
    ld   b, c
    ld   l, a
    ld   a, e
    ld   e, l
    ld   a, e
    ld   e, l

label_6DD34::
    rst  $38
    rst  $38
    ld   l, $5D
    and  l
    ld   e, l
    rst  $38
    rst  $38
    jr   c, label_6DD9B

label_6DD3E::
    sbc  a, l
    ld   b, h
    nop
    add  a, b
    and  d
    ld   bc, label_36A1
    ld   [hl], $A2
    inc  [hl]
    and  e
    ld   bc, label_36A1
    ld   [hl], $A2
    jr   c, label_6DCF4
    ld   bc, label_36A1
    ld   [hl], $A2
    inc  [hl]
    and  e
    ld   bc, label_36A1
    inc  [hl]
    and  d
    ld   [hl], $01
    nop
    sbc  a, l
    ld   h, h
    nop
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    ld   b, b
    ld   [hl], $A1
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, d
    and  d
    ld   c, [hl]
    and  b

label_6DD71::
    ld   d, [hl]
    and  c
    ld   e, b
    and  b
    ld   bc, label_6CEA2
    ld   bc, $009C
    sbc  a, c
    and  d
    jr   z, label_6DD20
    ld   b, b
    ld   b, b
    and  d
    ld   a, $A1
    ld   [hl], $36
    and  d
    jr   z, label_6DD2A
    ld   b, b
    ld   b, b
    and  d
    ld   b, d
    and  c
    ld   a, [hli]
    ld   a, [hli]
    and  d
    jr   z, label_6DD34
    ld   b, b
    ld   b, b
    and  d
    ld   a, $A1
    ld   [hl], $36
    and  d

label_6DD9B::
    jr   z, label_6DD3E
    ld   b, b
    ld   a, $A2
    ld   b, b
    and  c
    jr   z, label_6DDCC
    nop
    and  d
    add  hl, hl
    and  c
    add  hl, hl
    add  hl, hl
    and  d
    rst  $38
    and  c
    add  hl, hl
    add  hl, hl
    and  c
    add  hl, hl
    add  hl, hl
    add  hl, hl
    add  hl, hl
    and  d
    rst  $38
    ld   a, [de]
    nop
    nop
    ret  z
    ld   c, d
    jp   label_D35D
    ld   e, l
    pop  hl
    ld   e, l
    nop
    nop
    pop  af
    ld   e, l
    add  a, b
    ld   [hl], b
    inc  h
    ld   [hl], b
    or   $5D
    ld   hl, $F670
    ld   e, l
    rst  $38
    rst  $38
    rst  0
    ld   e, l
    scf
    ld   [hl], b
    inc  h
    ld   [hl], b
    or   $5D
    ld   hl, $F670
    ld   e, l
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    ld   e, l
    ld   a, d
    ld   [hl], b
    ld   h, l
    ld   l, a
    inc  h
    ld   [hl], b
    or   $5D
    ld   hl, $F670
    ld   e, l
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    ld   e, l
    sbc  a, l
    ld   b, h
    nop
    add  a, b
    nop
    and  d
    jr   nc, label_6DE2D
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   c, b
    ld   c, h
    ld   d, d
    ld   e, b
    ld   h, b

label_6DE00::
    ld   h, h

label_6DE01::
    ld   l, d
    ld   [hl], b
    ld   a, b
    ld   a, h
    add  a, d
    adc  a, b
    nop
    nop
    ret  z
    ld   c, d
    inc  de
    ld   e, [hl]
    add  hl, de
    ld   e, [hl]
    rra
    ld   e, [hl]
    nop
    nop
    ld   e, e
    ld   d, b
    rst  $38
    rst  $38
    inc  de
    ld   e, [hl]
    reti
    ld   d, b
    rst  $38
    rst  $38
    add  hl, de
    ld   e, [hl]
    ld   b, c
    ld   l, a
    ld   a, [hl]
    ld   d, c
    rst  $38
    rst  $38
    rra
    ld   e, [hl]
    nop
    cp   c
    ld   c, d
    ldd  [hl], a
    ld   e, [hl]
    ld   d, d

label_6DE2D::
    ld   e, [hl]
    ld   e, [hl]
    ld   e, [hl]
    nop
    nop
    inc  h
    ld   [hl], b
    adc  a, [hl]
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   l, [hl]
    ld   e, [hl]
    sub  a, e
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   l, [hl]
    ld   e, [hl]
    ld   hl, $8E70
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   l, [hl]
    ld   e, [hl]
    sub  a, e
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   l, [hl]
    ld   e, [hl]

label_6DE4E::
    rst  $38
    rst  $38
    ldd  [hl], a
    ld   e, [hl]
    ld   a, b
    ld   e, [hl]
    sub  a, c
    ld   e, [hl]
    ld   a, b
    ld   e, [hl]
    sub  a, c
    ld   e, [hl]
    rst  $38
    rst  $38
    ld   d, d
    ld   e, [hl]

label_6DE5E::
    ld   l, e
    ld   l, a
    and  b
    ld   e, [hl]

label_6DE62::
    and  b
    ld   e, [hl]
    ld   [hl], l
    ld   l, a
    and  b
    ld   e, [hl]
    and  b
    ld   e, [hl]
    rst  $38
    rst  $38
    ld   e, [hl]
    ld   e, [hl]
    sbc  a, e
    ld   [bc], a
    and  d
    inc  e
    jr   nz, label_6DE94
    sbc  a, h
    inc  e
    jr   nz, label_6DE78

label_6DE78::
    sbc  a, l
    ld   [hl], b
    ld   hl, $A740
    ld   c, b
    and  c
    ld   b, h
    ld   c, b
    and  a
    ld   c, d
    and  c
    ld   c, b
    ld   c, d
    and  a
    ld   c, h
    and  c
    ld   e, h
    ld   e, b
    and  d
    ld   c, h
    ld   h, h
    and  e
    ld   h, h
    nop
    sbc  a, l
    jr   nz, label_6DEB5

label_6DE94::
    add  a, c
    and  d
    ld   c, h
    ld   h, h
    xor  b
    ld   h, h
    and  d
    ld   h, h
    ld   a, h
    xor  b
    ld   a, h
    nop
    sbc  a, c
    and  a
    jr   z, label_6DECC
    and  e
    jr   z, label_6DEA7

label_6DEA7::
    nop
    cp   c
    ld   c, d
    or   d
    ld   e, [hl]
    cp   d
    ld   e, [hl]
    jp   nz, label_5E
    nop
    call z, label_D15E

label_6DEB5::
    ld   e, [hl]
    db   $DB
    ld   e, [hl]
    nop
    nop
    sub  a, $5E
    db   $DB
    ld   e, [hl]
    pop  de
    ld   e, [hl]
    nop
    nop
    ld   d, l
    ld   l, a
    add  a, e
    ld   [hl], b
    db   $DB
    ld   e, [hl]
    ld   a, d
    ld   [hl], b
    nop
    nop

label_6DECC::
    sbc  a, l
    ld   h, $00
    add  a, b
    nop
    and  e
    ld   bc, label_1A1
    nop
    sbc  a, l
    ld   h, a
    nop
    add  a, c
    nop
    sub  a, [hl]
    and  c
    ld   [hl], b
    ld   l, [hl]
    ld   h, [hl]
    ld   h, b
    ld   e, b
    ld   d, [hl]
    ld   c, [hl]
    ld   c, b
    ld   [hl], h
    ld   [hl], b
    ld   l, d
    ld   h, d
    ld   e, h
    ld   e, b
    ld   d, d
    ld   c, d
    ld   a, b
    ld   [hl], h
    ld   l, [hl]
    ld   h, [hl]
    ld   h, b
    ld   e, h
    ld   d, [hl]
    ld   c, [hl]
    ld   a, d
    ld   a, b
    ld   [hl], b
    ld   l, d
    ld   h, d
    ld   h, b
    ld   e, b
    ld   d, d
    and  d
    ld   [hl], $44
    ld   c, d
    ld   c, [hl]
    ld   d, [hl]
    ld   e, h
    ld   h, d
    ld   h, [hl]
    xor  b
    ld   a, [hl]
    sub  a, l
    nop
    nop
    ret  z
    ld   c, d
    dec  d
    ld   e, a
    dec  de
    ld   e, a
    ld   hl, $005F
    nop
    add  hl, hl
    ld   e, a
    rst  $38
    rst  $38
    ld   [de], a
    ld   d, h
    ld   e, h
    ld   e, a
    rst  $38
    rst  $38
    jr   nz, label_6DF75
    ld   b, c
    ld   l, a
    add  a, l
    ld   e, a
    rst  $38
    rst  $38
    jr   nc, label_6DF7D
    sbc  a, l
    ld   [hl], b
    ld   hl, $AA81
    ld   bc, label_6C036
    and  e
    ld   c, b
    xor  d
    ld   c, b
    ld   c, b
    ld   b, h
    and  e
    ld   c, b
    xor  d
    ld   bc, label_6C63C
    and  e
    ld   c, [hl]
    xor  d
    ld   c, [hl]
    ld   c, [hl]
    ld   c, d
    and  e
    ld   c, [hl]
    and  e
    ld   bc, label_29B
    and  e
    ld   c, h
    and  d
    ld   bc, label_6CCA1
    ld   c, h
    sbc  a, h
    xor  b
    ld   c, d
    sbc  a, l
    ld   b, b
    ld   hl, $AA80
    ldd  [hl], a
    jr   nc, label_6DF87
    nop
    sbc  a, l
    sub  a, b
    ld   hl, $AA81
    ld   [hl], $40
    ld   c, b
    xor  b
    ld   c, [hl]
    xor  d
    inc  a
    ld   b, [hl]
    ld   c, [hl]
    xor  b
    ld   d, h
    xor  d
    ld   c, [hl]
    ld   d, h
    ld   e, [hl]
    sbc  a, e
    ld   [bc], a
    and  e
    ld   e, d
    and  d

label_6DF75::
    ld   bc, label_6DAA1
    ld   e, d
    sbc  a, h
    xor  b
    ld   e, h
    sbc  a, l

label_6DF7D::
    ld   h, b
    ld   hl, $AA80
    ld   b, h
    ld   b, b
    ld   a, $00
    sbc  a, c
    xor  d

label_6DF87::
    ld   bc, label_6CE01
    sbc  a, d
    and  e
    ld   e, b
    sbc  a, c
    xor  d
    ld   b, b
    ld   b, b
    inc  a
    sbc  a, d
    and  e
    ld   b, b
    sbc  a, c
    xor  d
    ld   bc, label_6D401
    sbc  a, d
    and  e
    ld   e, [hl]
    sbc  a, c
    xor  d
    ld   b, [hl]
    ld   b, [hl]
    ld   b, d
    sbc  a, d
    and  e
    ld   b, [hl]
    ld   bc, $AA99
    ld   a, [hli]
    jr   z, label_6DFD5
    inc  [hl]
    ldd  [hl], a
    inc  [hl]
    inc  a
    db   $3A ; ldd  a, [hl]
    inc  a
    ld   b, d
    ld   c, h
    ld   d, h
    ld   d, [hl]
    ld   d, d
    ld   d, [hl]
    ld   e, b
    ld   d, [hl]
    ld   d, d
    and  e
    ld   c, [hl]
    xor  d
    ld   e, $1E
    ld   e, $00
    nop
    and  $4A
    call z, label_D45F
    ld   e, a
    ld   a, [de]
    ld   c, e
    nop
    nop
    or   [hl]
    ld   l, a
    call c, label_FF5F
    rst  $38
    call z, label_BB5F

label_6DFD5::
    ld   l, a
    cp   $5F
    rst  $38
    rst  $38
    call nc, label_A25F
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    ld   b, b
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    ld   [hl], $3E
    ld   b, h
    jr   nc, label_6E01D
    ld   a, $44
    ldi  [hl], a
    jr   z, label_6E01C
    jr   z, label_6E01A
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    ld   e, $26
    inc  l
    ld   h, $28
    inc  l
    ldd  [hl], a
    ld   [hl], $28
    jr   nc, label_6E032
    inc  a
    nop
    and  h
    ld   [hl], b
    and  d

label_6E001::
    ld   bc, label_6F46E
    and  h
    ld   h, [hl]
    and  d
    ld   bc, label_6D870
    ld   e, h
    ld   h, b
    ld   h, d
    ld   h, b
    ld   h, d
    and  e
    ld   d, [hl]
    ld   l, d
    and  l
    ld   h, [hl]
    and  d
    ld   bc, $0000
    cp   c
    ld   c, d

label_6E01A::
    ldi  [hl], a
    ld   h, b

label_6E01C::
    jr   c, label_6E07E
    ld   a, [de]
    ld   c, e
    nop
    nop
    ld   e, c
    ld   h, b
    ld   h, l
    ld   h, b
    ld   c, [hl]
    ld   h, b
    ld   c, [hl]
    ld   h, b
    ld   e, c
    ld   h, b
    ld   l, d
    ld   h, b
    ld   c, [hl]
    ld   h, b
    ld   c, [hl]
    ld   h, b

label_6E032::
    ld   c, [hl]
    ld   h, b
    rst  $38
    rst  $38
    ldi  [hl], a
    ld   h, b
    ld   a, [hl]
    ld   h, b
    adc  a, d
    ld   h, b
    ld   l, a
    ld   h, b
    ld   l, a
    ld   h, b
    ld   a, [hl]
    ld   h, b
    sub  a, b
    ld   h, b
    ld   l, a
    ld   h, b
    ld   l, a
    ld   h, b
    ld   l, a
    ld   h, b
    rst  $38
    rst  $38
    jr   c, label_6E0AE
    sbc  a, e
    inc  c
    xor  l
    ld   bc, $0101
    ld   bc, $A59C
    ld   bc, $9D00
    ld   b, b
    ld   b, c
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  e
    jr   z, label_6E094
    ldd  [hl], a
    sbc  a, h
    nop
    and  e
    jr   nc, label_6E08E
    ld   bc, $A300
    inc  [hl]
    ld   a, [hli]
    ld   bc, $9D00
    ld   b, d
    nop
    add  a, b
    sbc  a, e
    inc  c
    xor  l
    ld   b, [hl]
    ld   b, h
    ld   b, [hl]
    ld   bc, $A59C
    ld   bc, $9D00
    ld   b, b
    ld   b, c
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  e
    jr   nc, label_6E0C1
    db   $3A ; ldd  a, [hl]
    sbc  a, h
    nop
    and  e
    jr   c, label_6E0BB
    and  e

label_6E08E::
    ld   bc, $A300
    inc  a
    ldd  [hl], a
    and  e

label_6E094::
    ld   bc, $0000
    rst  $10
    ld   c, d
    ld   a, [de]
    ld   c, e
    and  c
    ld   h, b
    or   c
    ld   h, b
    nop
    nop
    pop  bc
    ld   h, b
    reti
    ld   h, b
    reti
    ld   h, b
    ld   a, [label_3260]
    ld   [hl], b
    rrca
    ld   h, c
    add  a, b

label_6E0AE::
    ld   [hl], b
    nop
    nop
    ld   c, e
    ld   l, a
    dec  e
    ld   h, c
    add  hl, hl
    ld   h, c
    ld   d, l
    ld   l, a
    ld   c, h
    ld   h, c

label_6E0BB::
    ld   e, c
    ld   h, c
    rrca
    ld   h, c
    nop
    nop

label_6E0C1::
    sbc  a, l
    ld   b, e
    nop
    add  a, b
    and  h
    ld   bc, label_1A2
    and  c
    ld   a, b
    ld   [hl], h
    and  d
    ld   a, b
    and  e
    ld   bc, label_6FAA1
    ld   a, b
    and  d
    ld   a, d
    and  e
    ld   bc, $0001
    sbc  a, l
    ld   d, l
    nop
    nop
    sbc  a, [hl]
    cp   c
    ld   c, d
    sbc  a, e
    ld   [bc], a
    and  c
    ld   h, [hl]
    ld   l, b
    ld   h, [hl]
    ld   h, h
    ld   h, d
    ld   h, h
    ld   h, d
    ld   h, h
    sbc  a, h
    and  d
    ld   h, [hl]
    ld   a, [hl]
    ld   h, [hl]
    and  c
    ld   h, [hl]
    ld   l, b
    ld   l, d
    ld   l, h
    ld   l, d
    ld   l, b
    and  e
    ld   h, [hl]
    nop
    sbc  a, l
    dec  [hl]
    nop
    ld   b, b
    sbc  a, e
    ld   [bc], a
    and  c
    ld   h, [hl]
    ld   l, b
    ld   h, [hl]
    ld   h, h
    ld   h, d
    ld   h, h
    ld   h, d
    ld   h, h
    sbc  a, h
    and  l
    ld   bc, label_1A3
    nop
    sbc  a, [hl]
    ret  z
    ld   c, d
    and  b
    ld   a, [hl]
    ld   a, d
    db   $76 ; Halt
    ld   [hl], d
    ld   l, [hl]
    ld   l, d
    and  e
    ld   h, [hl]
    ld   bc, $A400
    ld   bc, label_1A2
    sbc  a, c
    and  e
    ld   l, h
    ld   bc, label_16E
    ld   bc, $9E00
    cp   c
    ld   c, d
    sbc  a, c
    sbc  a, e
    ld   [bc], a
    and  d
    ld   b, b
    ld   c, [hl]
    ld   [hl], $4E
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, d
    ld   d, b
    jr   c, label_6E18B
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, [hl]
    ld   d, h
    inc  a
    ld   d, h
    sbc  a, h
    ld   c, d
    ld   e, b
    ld   b, b
    ld   e, b
    ld   c, d
    ld   e, b
    ld   c, b
    ld   b, h
    nop
    sbc  a, e
    ld   [bc], a

label_6E14E::
    and  d
    ld   b, b
    ld   c, [hl]
    ld   [hl], $4E
    sbc  a, h
    and  l
    ld   bc, label_1A3
    nop
    sbc  a, [hl]
    ret  z
    ld   c, d
    and  c
    ld   bc, $0000
    rst  $10
    ld   c, d
    ld   l, d
    ld   h, c
    db   $76 ; Halt
    ld   h, c
    add  a, d
    ld   h, c
    nop
    nop
    ret  nz
    ld   l, a
    adc  a, h
    ld   h, c
    push bc
    ld   l, a
    sbc  a, d
    ld   h, c
    sbc  a, d
    ld   h, c
    nop
    nop
    ret  nz
    ld   l, a
    ret  z
    ld   h, c
    push bc
    ld   l, a
    sub  a, $61
    sub  a, $61
    nop
    nop
    ld   [hl], b
    ld   l, a
    inc  b
    ld   h, d
    ld   de, label_1162
    ld   h, d
    nop

label_6E18B::
    nop
    and  h
    ld   bc, label_26A1
    ld   a, [hli]
    ld   l, $30
    inc  [hl]
    ld   bc, $0134
    and  l
    ld   [hl], $00
    and  h
    ld   bc, label_34A2
    jr   c, label_6E1DC
    ld   a, $A7
    ld   b, d
    and  d
    ld   b, [hl]
    ld   b, d
    ld   a, $3C
    jr   c, label_6E14E
    inc  [hl]
    and  d
    inc  a
    ld   a, $42
    ld   c, h
    and  a
    ld   d, h
    and  d
    ld   d, [hl]
    ld   d, h
    ld   d, b
    ld   c, h
    ld   c, d
    and  a
    ld   c, h
    and  c
    ld   b, d
    ld   b, d
    sbc  a, e
    ld   [bc], a
    and  d
    ld   c, h
    and  c
    ld   b, d
    ld   b, d
    sbc  a, h
    and  l
    ld   c, h
    nop
    and  l
    ld   bc, label_6C0A1
    ld   b, h
    ld   c, b
    ld   c, d
    ld   c, [hl]
    ld   bc, $014E
    and  h
    ld   d, b
    nop
    and  l
    ld   bc, label_6CEA2
    ld   d, d
    ld   d, [hl]

label_6E1DC::
    ld   e, b
    and  a
    ld   e, h
    and  d
    ld   h, b
    ld   e, h
    ld   e, b
    ld   d, [hl]
    ld   d, d
    and  h
    ld   c, [hl]
    and  d
    ld   d, [hl]
    ld   e, b
    ld   e, h
    ld   h, [hl]
    and  a
    ld   l, [hl]
    and  d
    ld   [hl], b
    ld   l, [hl]
    ld   l, d
    ld   h, [hl]
    ld   h, h
    and  a
    ld   h, [hl]
    and  c
    ld   e, h
    ld   e, h
    sbc  a, e
    ld   [bc], a
    and  d
    ld   h, [hl]
    and  c
    ld   e, h
    ld   e, h
    sbc  a, h
    and  h
    ld   h, [hl]
    nop
    sbc  a, d
    and  c
    inc  h
    jr   z, label_6E235
    ld   l, $32
    ld   bc, $0132
    xor  [hl]
    inc  [hl]
    nop
    and  d
    ldd  [hl], a
    ld   [hl], $3A
    inc  a
    and  a
    ld   b, b
    and  d
    ld   b, h
    ld   b, b
    inc  a
    db   $3A ; ldd  a, [hl]
    ld   [hl], $A4
    ldd  [hl], a
    and  d
    db   $3A ; ldd  a, [hl]
    inc  a
    ld   b, b
    ld   c, d
    and  a
    ld   d, d
    and  d
    ld   d, h
    ld   d, d
    ld   c, [hl]
    ld   c, d
    ld   c, b
    and  e
    ld   c, d
    and  d
    ld   bc, $A199
    ld   b, b
    ld   b, b

label_6E235::
    sbc  a, e
    ld   [bc], a
    and  d
    ld   c, d
    and  c
    ld   b, b
    ld   b, b
    sbc  a, h
    sbc  a, d
    xor  [hl]
    ld   c, d
    nop
    nop
    rst  $10
    ld   c, d
    ld   a, [de]
    ld   c, e
    ld   c, h
    ld   h, d
    ld   e, h
    ld   h, d
    nop
    nop
    ld   l, h
    ld   h, d
    ld   [hl], c
    ld   h, d
    and  d
    ld   l, a
    ld   [hl], c
    ld   h, d
    add  a, d
    ld   h, d
    or   [hl]
    ld   l, a
    cp   d
    ld   h, d
    nop
    nop
    ld   d, l
    ld   l, a

label_6E25E::
    rst  0
    ld   h, d

label_6E260::
    ld   c, e
    ld   l, a
    rst  0
    ld   h, d
    reti
    ld   h, d

label_6E266::
    ld   d, l
    ld   l, a
    nop
    ld   h, e
    nop
    nop
    sbc  a, l
    ld   b, b
    ld   h, $01
    nop
    and  c
    sub  a, b
    and  [hl]
    sub  a, b
    and  c
    adc  a, b
    and  [hl]
    adc  a, b
    and  c
    ld   a, [hl]
    and  [hl]
    ld   a, [hl]
    and  c
    adc  a, b

label_6E27F::
    and  [hl]
    adc  a, b
    nop
    and  [hl]
    ld   c, [hl]
    and  c
    ld   c, [hl]
    and  e
    ld   c, b
    and  [hl]
    ld   c, d
    and  c
    ld   c, d
    and  e

label_6E28D::
    ld   b, d

label_6E28E::
    and  c
    ld   c, [hl]
    and  d
    ld   c, [hl]

label_6E292::
    and  c

label_6E293::
    ld   d, d
    ld   c, [hl]
    ld   c, b
    ld   b, b
    ld   c, b
    and  d
    ld   c, d
    sub  a, b
    and  e
    sub  a, b
    and  [hl]
    ld   c, [hl]
    and  c
    ld   c, [hl]
    and  e
    ld   c, b
    and  [hl]

label_6E2A4::
    ld   e, b
    and  c
    ld   e, b
    and  e
    ld   d, b
    and  c
    ld   c, [hl]
    and  d
    ld   c, [hl]
    and  c
    ld   d, d
    and  d
    ld   c, [hl]
    and  c

label_6E2B2::
    ld   e, b

label_6E2B3::
    ld   h, b
    and  d
    ld   h, d
    sub  a, b
    and  e
    sub  a, b
    nop
    and  [hl]
    ld   c, [hl]
    and  c
    ld   c, [hl]
    and  e
    ld   c, b
    and  [hl]
    ld   c, d
    and  c
    ld   c, d
    and  e
    ld   b, d
    nop
    sbc  a, c
    and  c
    adc  a, [hl]
    and  [hl]
    adc  a, [hl]
    and  c
    add  a, [hl]
    and  [hl]
    add  a, [hl]
    and  c
    ld   a, h
    and  [hl]
    ld   a, h
    and  c
    add  a, [hl]
    and  [hl]
    add  a, [hl]
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    jr   z, label_6E27F
    jr   nc, label_6E316
    and  d
    ld   e, $A1
    jr   nc, label_6E31B
    and  d
    ld   a, [hli]
    and  c
    ldd  [hl], a
    jr   c, label_6E28D
    jr   nz, label_6E28E
    ldd  [hl], a
    jr   c, label_6E292
    jr   z, label_6E293
    jr   nc, label_6E32A
    and  d
    ld   e, $A1
    jr   nc, label_6E32F
    and  d
    ld   a, [hli]
    adc  a, [hl]
    adc  a, [hl]
    ld   e, $9C
    nop
    and  d
    jr   z, label_6E2A4
    jr   nc, label_6E33B
    and  d
    ld   e, $A1
    jr   nc, label_6E340
    and  d
    ld   a, [hli]
    and  c
    ldd  [hl], a
    jr   c, label_6E2B2
    jr   nz, label_6E2B3
    ldd  [hl], a
    jr   c, label_6E315

label_6E315::
    nop

label_6E316::
    cp   c
    ld   c, d
    jr   nz, label_6E37D
    db   $3A ; ldd  a, [hl]

label_6E31B::
    ld   h, e
    ld   d, b
    ld   h, e
    ld   h, h
    ld   h, e
    ld   l, e
    ld   [hl], b
    xor  h
    ld   l, a
    ld   l, [hl]
    ld   h, e
    jp   z, label_6FF6F
    ld   h, e

label_6E32A::
    adc  a, [hl]
    ld   l, a
    inc  h
    ld   [hl], b
    sub  a, h

label_6E32F::
    ld   h, e
    reti
    ld   l, a
    daa
    ld   [hl], b
    sub  a, h
    ld   h, e
    rst  $38
    rst  $38
    ld   a, [hli]
    ld   h, e
    xor  h

label_6E33B::
    ld   l, a
    and  e
    ld   h, e
    or   d
    ld   h, e

label_6E340::
    jp   z, label_C16F
    ld   h, e
    rst  8
    ld   l, a
    sub  a, $63
    call nc, label_D66F
    ld   h, e
    rst  $38
    rst  $38
    ld   b, h
    ld   h, e
    ld   b, [hl]
    ld   l, a
    push hl
    ld   h, e
    ld   h, c
    ld   [hl], b
    ld   b, c
    ld   l, a
    db   $F4 ; Undefined instruction
    ld   h, e
    ld   b, c
    ld   l, a
    inc  b
    ld   h, h
    inc  b
    ld   h, h
    rst  $38
    rst  $38
    ld   e, d
    ld   h, e
    jr   nz, label_6E3CA
    jr   z, label_6E3CC
    ld   l, $64
    rst  $38
    rst  $38
    ld   l, b
    ld   h, e
    xor  b
    ld   bc, label_6C6A1
    ld   c, b
    ld   e, [hl]
    ld   h, b
    xor  b
    ld   bc, label_6C8A1
    ld   c, d
    ld   h, b
    ld   h, d
    xor  b

label_6E37D::
    ld   bc, $9B00
    dec  b
    and  c
    ld   [hl], b
    ld   [hl], d
    ld   [hl], b
    ld   l, [hl]
    sbc  a, h
    ld   [hl], b
    ld   l, [hl]
    ld   l, h
    ld   l, d
    ld   l, b
    ld   h, [hl]
    ld   h, h
    ld   h, d
    ld   h, b
    ld   e, [hl]
    ld   e, h
    ld   e, d
    nop
    sbc  a, e
    inc  b
    and  d
    ld   d, b
    ld   c, d
    ld   c, d
    ld   d, b
    ld   c, d
    ld   c, d
    ld   d, b
    ld   c, d
    ld   d, b
    ld   c, d
    sbc  a, h
    nop
    and  l
    ld   bc, label_89B
    and  c
    ld   e, $20
    sbc  a, h
    and  e
    ld   e, $AE
    ld   bc, label_1A5
    nop
    and  c
    ld   d, d
    ld   d, h
    ld   l, d
    ld   l, h
    xor  b
    ld   bc, label_6D4A1
    ld   d, [hl]
    ld   l, h
    ld   l, [hl]
    xor  b
    ld   bc, $9B00
    dec  b
    and  c
    ld   e, b
    ld   e, d
    ld   e, b
    ld   d, [hl]
    sbc  a, h
    ld   e, b

label_6E3CA::
    ld   d, [hl]
    ld   d, h

label_6E3CC::
    ld   d, d
    ld   d, b
    ld   c, [hl]
    ld   c, h
    ld   c, d
    ld   c, b
    ld   b, [hl]
    ld   b, h
    ld   b, d
    nop
    sbc  a, e
    inc  b
    and  d
    ld   e, b
    ld   bc, label_6D601
    ld   bc, label_6D801
    ld   bc, label_15A
    sbc  a, h
    nop
    sbc  a, d
    sbc  a, e
    db   $10 ; Undefined instruction
    jr   z, label_6E415
    sbc  a, h
    sbc  a, c
    and  e
    inc  l
    xor  [hl]
    ld   bc, label_1A5
    nop
    and  l
    ld   bc, $9B99
    inc  b
    and  d
    ld   b, b
    sbc  a, h
    jr   z, label_6E426
    and  c
    jr   z, label_6E429
    ld   a, [hli]
    jr   z, label_6E404

label_6E404::
    sbc  a, c
    sbc  a, e
    inc  b
    and  c
    ld   c, d
    ld   c, d
    ldd  [hl], a
    ldd  [hl], a
    and  d
    ldd  [hl], a
    and  c
    ld   c, d
    ld   c, d
    ldd  [hl], a
    ldd  [hl], a
    and  d
    ldd  [hl], a

label_6E415::
    and  c
    ld   c, d
    ld   c, d
    ldd  [hl], a
    ldd  [hl], a
    ld   c, d
    ld   c, d
    ldd  [hl], a
    ldd  [hl], a
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    and  l
    ld   bc, $A89C

label_6E426::
    ld   bc, $9B00

label_6E429::
    inc  b
    and  l
    ld   bc, $009C
    sbc  a, e
    ld   [bc], a
    and  c
    dec  d
    dec  d
    dec  d
    dec  d
    and  d
    ld   bc, $9B9C
    ld   [label_15A1], sp
    sbc  a, h
    nop
    nop
    push af
    ld   c, d
    ld   a, [de]
    ld   c, e
    ld   c, c
    ld   h, h
    ld   d, e
    ld   h, h
    ld   e, e
    ld   h, h
    or   [hl]
    ld   l, a
    ld   h, c
    ld   h, h
    add  a, b
    ld   h, h
    rst  $38
    rst  $38
    ld   c, c
    ld   h, h
    ld   l, e
    ld   l, a
    or   l
    ld   h, h
    rst  $38
    rst  $38
    ld   d, e
    ld   h, h
    ret  nc

label_6E45C::
    ld   h, h
    rst  $38
    rst  $38

label_6E45F::
    ld   e, e

label_6E460::
    ld   h, h
    and  h
    ld   bc, label_1A7
    xor  l
    ld   e, d

label_6E467::
    ld   e, [hl]
    ld   e, d
    and  e

label_6E46A::
    ld   e, b
    ld   bc, label_1A7
    and  c
    ld   c, d
    ld   d, h
    and  e
    ld   c, [hl]
    ld   bc, label_1A7
    xor  l
    ld   b, d
    ld   b, [hl]
    ld   b, d
    and  e
    ld   b, b
    ld   bc, label_1A7
    nop
    sbc  a, l
    ld   b, b
    ld   hl, $AD01
    ld   c, [hl]
    ld   d, b
    ld   d, d
    and  [hl]
    ld   d, h
    and  c
    ld   c, b
    and  a
    ld   d, h
    xor  l
    ld   d, d
    ld   d, h
    ld   d, d
    and  d
    ld   c, [hl]
    ld   c, d
    and  [hl]
    ld   c, [hl]
    and  c
    ld   b, b
    and  h
    ld   c, [hl]
    and  d
    ld   bc, label_6CEAD
    ld   d, b
    ld   d, d
    and  [hl]

label_6E4A2::
    ld   d, h
    and  c
    ld   c, b
    and  a
    ld   d, h
    xor  l
    ld   d, d
    ld   d, h
    ld   d, d
    and  d
    ld   c, [hl]
    ld   c, d
    and  [hl]
    ld   c, [hl]
    and  c
    ld   b, b
    xor  b
    ld   c, [hl]
    nop
    sbc  a, c
    sbc  a, e
    inc  b
    and  [hl]
    jr   z, label_6E45C
    jr   nc, label_6E45F
    ld   [hl], $28
    ld   a, [hli]
    ldd  [hl], a
    and  e
    jr   c, label_6E46A
    jr   z, label_6E467
    jr   nc, label_6E46A
    ld   [hl], $28
    ld   e, $2A
    and  e
    ldd  [hl], a
    sbc  a, h
    nop
    sbc  a, e
    inc  bc
    and  d
    dec  d
    xor  l
    dec  d
    dec  d
    dec  d
    sbc  a, h
    sbc  a, e
    inc  b
    and  c
    dec  d
    sbc  a, h
    nop
    nop
    cp   c
    ld   c, d
    ld   [$F064], a
    ld   h, h
    or   $64
    nop
    nop
    rst  8
    ld   l, a
    db   $FC ; Undefined instruction
    ld   h, h
    nop
    nop
    rst  8
    ld   l, a
    inc  bc
    ld   h, l
    nop
    nop
    ld   l, e
    ld   l, a
    ld   a, [bc]
    ld   h, l
    nop
    nop
    and  d
    ld   d, d
    ld   d, h
    ld   d, [hl]
    xor  b
    ld   e, b
    nop
    and  d
    ld   e, h
    ld   e, [hl]
    ld   h, b
    xor  b
    ld   h, d
    nop
    sbc  a, c
    and  d
    jr   nc, label_6E540
    inc  [hl]
    sbc  a, d
    xor  b
    ld   [hl], $00
    nop
    and  $4A
    ld   e, $65
    ld   e, [hl]
    ld   h, l
    xor  d
    ld   h, l
    ld    hl, sp+$65
    ld   c, d
    ld   [hl], b
    inc  a
    ld   [hl], b
    ld   d, [hl]
    ld   h, [hl]
    ld   e, e
    ld   h, [hl]
    ld   l, l
    ld   h, [hl]
    adc  a, d
    ld   h, [hl]
    cp   d
    ld   h, [hl]
    sbc  a, a
    ld   [hl], b
    ret  c
    ld   h, [hl]
    ld   d, $67
    dec  de
    ld   h, a
    add  a, [hl]
    ld   [hl], b
    sbc  a, e
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    cpl
    ld   h, a
    ld   l, d
    ld   h, a
    ld   l, d
    ld   h, a

label_6E540::
    ld   a, [$FF00+C]
    ld   l, d
    ld   h, a
    ld   l, d
    ld   h, a
    ld   a, [$FF00+C]
    ld   l, d
    ld   h, a
    ld   l, d
    ld   h, a
    ld   a, [$FF00+C]
    pop  de
    ld   h, a
    ldd  [hl], a
    ld   l, b
    ld   d, d
    ld   l, b
    sbc  a, a
    ld   [hl], b
    ld   h, e
    ld   l, b
    and  e
    ld   [hl], b
    add  a, b
    ld   l, b
    nop
    nop
    ld   c, d
    ld   [hl], b
    db   $E8 ; add  sp, d
    ld   l, a
    adc  a, a
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, a
    and  l
    ld   l, b
    ld   a, [$FF00+C]
    adc  a, a
    ld   l, b
    sbc  a, $6F
    cp   c
    ld   l, b
    call z, label_ED68
    ld   l, a
    pop  de
    ld   l, b
    sbc  a, a
    ld   [hl], b
    db   $E8 ; add  sp, d
    ld   l, b
    call z, label_805E
    ld   [hl], b
    dec  de
    ld   h, a
    ld   a, d
    ld   [hl], b
    sbc  a, e
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    inc  b
    ld   l, c
    dec  a
    ld   l, c
    dec  a
    ld   l, c
    xor  [hl]
    ld   l, c
    dec  a
    ld   l, c
    dec  a
    ld   l, c
    xor  [hl]
    ld   l, c
    dec  a
    ld   l, c
    dec  a
    ld   l, c
    xor  [hl]
    ld   l, c
    adc  a, a
    ld   l, c
    xor  $69
    rlca
    ld   l, d
    sbc  a, a
    ld   [hl], b
    jr   label_6E60E
    and  e
    ld   [hl], b
    dec  l
    ld   l, d
    nop
    nop
    ld   c, d
    ld   [hl], b
    ld   a, d
    ld   [hl], b
    inc  a
    ld   l, d
    adc  a, a
    ld   l, b
    ld   b, c
    ld   l, d
    and  l
    ld   l, b
    ld   b, [hl]
    ld   l, d
    ld   d, l
    ld   l, a
    ld   e, e
    ld   h, [hl]
    ld   l, l
    ld   h, [hl]
    ld   e, [hl]
    ld   [hl], b
    ld   d, b
    ld   l, d
    ld   d, l
    ld   l, d
    sbc  a, a
    ld   [hl], b
    ld   a, h
    ld   l, d
    ld   d, l
    ld   l, a
    add  a, e
    ld   [hl], b
    dec  de
    ld   h, a
    ld   a, l
    ld   [hl], b
    sbc  a, e
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    and  e
    ld   l, d
    or   a
    ld   l, d
    or   a
    ld   l, d
    jr   nc, label_6E647
    or   a
    ld   l, d
    or   a
    ld   l, d
    jr   nc, label_6E64D
    or   a
    ld   l, d
    or   a
    ld   l, d
    jr   nc, label_6E653
    dec  d
    ld   l, e
    ld   a, e
    ld   l, e
    sbc  a, b
    ld   l, e
    sbc  a, a
    ld   [hl], b
    and  h
    ld   l, e
    and  e
    ld   [hl], b
    cp   d
    ld   l, e
    nop
    nop
    ld   d, d
    ld   [hl], b
    push bc
    ld   l, e
    sbc  a, a
    ld   [hl], b
    call label_9B6B
    ld   [hl], b
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e

label_6E60E::
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    rst  $30
    ld   l, e
    rst  $30
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    rst  $30
    ld   l, e
    rst  $30
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    push de
    ld   l, e
    rst  $30
    ld   l, e
    rst  $30
    ld   l, e
    and  $6B
    push de

label_6E647::
    ld   l, e
    ld   [bc], a
    ld   l, h
    sbc  a, a
    ld   [hl], b
    ld   [bc], a

label_6E64D::
    ld   l, h
    ld   [bc], a
    ld   l, h
    and  e
    ld   [hl], b
    db   $10 ; Undefined instruction
    nop
    nop
    sbc  a, l
    ld   d, [hl]
    nop
    add  a, b
    nop
    and  c
    jr   nc, label_6E69C
    ld   b, h
    ld   c, h
    ld   c, [hl]
    ld   d, [hl]

label_6E662::
    ld   e, h
    ld   h, h
    ld   h, [hl]
    ld   h, h
    ld   e, h
    ld   d, [hl]
    ld   c, [hl]
    ld   c, h
    ld   b, h
    ld   a, $00
    and  c
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, [hl]
    ld   e, b
    ld   e, h
    ld   h, b
    ld   h, [hl]
    ld   [hl], b
    ld   h, [hl]
    ld   h, b
    ld   e, h
    ld   e, b
    ld   c, [hl]
    ld   c, b
    ld   b, h
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, [hl]
    ld   e, b
    ld   e, h
    ld   h, b
    ld   h, [hl]
    and  e
    ld   [hl], b
    ld   bc, $9D00
    ld   b, d
    nop
    add  a, b
    and  c
    ld   [hl], $34
    ld   [hl], $2C
    jr   nc, label_6E6C9
    ld   [hl], $3A
    ld   a, $3A
    ld   a, $36
    db   $3A ; ldd  a, [hl]

label_6E69C::
    ld   a, $40
    ld   b, h
    sbc  a, l
    ld   d, d
    nop
    add  a, b
    ld   c, [hl]
    ld   c, h
    ld   c, [hl]
    ld   b, h
    ld   d, [hl]
    ld   d, d
    ld   d, [hl]
    ld   c, [hl]
    sbc  a, l
    ld   h, d
    nop

label_6E6AE::
    add  a, b
    ld   e, h
    ld   d, [hl]
    ld   c, [hl]
    ld   h, [hl]
    ld   h, h
    ld   e, [hl]
    ld   d, [hl]
    ld   d, d
    and  e
    ld   c, [hl]
    nop
    sbc  a, l
    ld   h, b
    ld   hl, $A380
    ld   d, d
    ld   c, [hl]
    ld   e, h
    and  a
    ld   e, h
    and  e
    ld   h, b
    and  d
    ld   e, h
    ld   e, b

label_6E6C9::
    ld   d, d
    and  e
    ld   d, [hl]
    and  d
    ld   bc, label_6D658
    ld   d, d
    ld   c, [hl]
    ld   e, h
    and  e
    ld   e, b
    and  h
    ld   bc, $9D00
    ld   d, d
    nop
    add  a, b
    and  e
    ld   bc, label_29B
    and  c
    ld   b, h
    ld   c, d
    ld   d, d
    ld   e, b
    ld   h, b
    ld   e, b

label_6E6E7::
    ld   d, d
    ld   c, d
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   [hl], $3E
    ld   b, h
    ld   c, d
    ld   d, d
    ld   c, d
    ld   b, h
    ld   a, $9C
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, [hl]
    ld   e, b
    ld   c, [hl]
    ld   c, b
    ld   b, h
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, [hl]
    ld   e, b
    ld   c, [hl]
    ld   c, b
    ld   b, b
    ld   a, $42
    ld   b, [hl]
    ld   c, h
    ld   d, [hl]
    ld   e, d
    ld   e, [hl]
    ld   h, h
    ld   l, [hl]
    ld   h, h
    ld   e, [hl]
    ld   e, d
    ld   d, [hl]
    ld   c, h
    ld   b, [hl]
    ld   a, $00
    sbc  a, l
    ld   b, a
    nop
    add  a, b
    nop

label_6E71B::
    and  c
    ld   e, $22
    ld   h, $2C
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    ld   a, $44
    ld   c, d
    ld   d, d
    ld   d, [hl]
    ld   e, h
    ld   h, d
    ld   l, d
    ld   l, [hl]
    ld   [hl], h
    and  h
    ld   a, [hl]
    nop
    sbc  a, l
    ld   d, d
    nop
    add  a, b
    and  h
    ld   bc, label_1EA3
    xor  d
    ld   e, $1E
    ld   e, $9D
    ld   [hl], d
    nop
    add  a, b
    and  e
    ldi  [hl], a
    sbc  a, e
    ld   b, $AA
    ldi  [hl], a
    sbc  a, h
    jr   z, label_6E770
    jr   z, label_6E6E7
    sub  a, d
    nop
    add  a, b
    and  e
    inc  l
    xor  d
    inc  l
    inc  l
    inc  l
    and  e
    ldd  [hl], a
    xor  d
    ldd  [hl], a
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    and  e
    ld   a, $AA
    ld   [hl], $36
    ld   [hl], $A3
    ld   [hl], $9D
    sub  a, d
    nop
    ld   b, b
    xor  d
    ld   [hl], $3A
    ld   a, $00
    sbc  a, l
    sub  a, b
    ld   hl, $A341
    jr   nc, label_6E71B
    ldd  [hl], a
    jr   nc, label_6E7A0
    jr   nc, label_6E777
    jr   nc, label_6E7AA
    ld   [hl], $3A
    and  e
    inc  a
    xor  d
    ld   b, h
    ld   c, b
    ld   b, h
    and  e
    ld   b, d

label_6E782::
    xor  d
    db   $3A ; ldd  a, [hl]
    ld   a, $42
    and  e
    ld   b, h
    xor  d
    ld   e, h
    ld   h, d
    ld   l, d
    ld   [hl], b
    jr   c, label_6E7CB
    ld   b, b
    inc  a
    jr   c, label_6E736
    ld   [hl], $AA
    ld   [hl], $3A
    ld   [hl], $A3
    ldd  [hl], a
    ld   bc, label_6F79D
    nop
    add  a, b
    sbc  a, e

label_6E7A0::
    ld   [bc], a
    xor  d
    ld   d, d
    ld   d, [hl]
    ld   e, b
    sbc  a, h
    ld   d, [hl]
    ld   c, [hl]
    ld   c, b
    and  e

label_6E7AA::
    ld   c, [hl]
    xor  d
    ld   d, d
    ld   d, [hl]
    ld   e, b
    ld   e, b
    ld   e, h
    ld   e, b
    ld   d, [hl]
    ld   c, [hl]
    ld   c, b
    and  e
    ld   c, [hl]
    sbc  a, l
    ld   [hl], b
    ld   hl, $AA41
    ld   c, d
    ld   c, [hl]
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, d
    and  e
    ld   d, b
    xor  d
    ld   d, b
    ld   d, h
    ld   d, b
    and  e
    ld   c, [hl]
    xor  d

label_6E7CB::
    ld   c, [hl]
    ld   d, d
    ld   c, [hl]
    and  h
    ld   c, d
    nop
    sbc  a, l
    sub  a, b
    ld   hl, $A341
    jr   nc, label_6E782
    ldd  [hl], a
    jr   nc, label_6E807
    jr   nc, label_6E7DE
    jr   nc, label_6E811
    ld   [hl], $3A
    and  e
    ld   a, $9D
    ld   [hl], b
    ld   hl, $AA41
    ld   a, [de]
    ld   e, $28
    inc  l
    ld   h, $2C
    ld   [hl], $3E
    ld   b, h
    nop
    sbc  a, l
    ld   [hl], b
    nop
    add  a, c
    and  l
    ld   bc, $A801
    ld   c, d
    xor  d
    ld   c, d
    ld   c, [hl]
    ld   c, d
    and  h
    ld   c, b
    and  e
    ld   c, d
    ld   c, [hl]
    sbc  a, l
    sub  a, b
    ld   h, $80
    xor  d
    ld   d, b
    ld   bc, $A454
    ld   e, b
    xor  d
    ld   d, b
    ld   d, h

label_6E811::
    ld   e, b
    xor  b
    ld   e, b
    xor  d
    ld   e, b
    ld   e, b
    ld   e, b
    sbc  a, e
    ld   [bc], a
    ld   bc, label_6D050
    ld   d, b
    ld   c, [hl]
    ld   d, b
    sbc  a, h
    and  e
    ld   c, [hl]
    sbc  a, l
    ld   [hl], b
    ld   hl, $AA40
    db   $3A ; ldd  a, [hl]
    ld   bc, label_363A
    ld   bc, label_3236
    ld   bc, $0032
    sbc  a, l
    add  a, b
    ld   hl, $AA41
    ld   b, [hl]
    ld   b, h
    ld   b, [hl]
    ld   c, d
    ld   b, [hl]
    ld   b, h
    sbc  a, e
    inc  b
    ld   b, [hl]
    sbc  a, h
    ld   b, h
    ld   b, [hl]
    ld   c, d
    ld   b, [hl]
    ld   c, d
    ld   d, b
    ld   e, d
    ld   h, d
    ld   l, b
    ld   e, d
    ld   e, d
    ld   h, d
    ld   h, d
    ld   h, d
    and  e
    ld   h, b
    nop
    sbc  a, l
    ld   [hl], b
    ld   hl, $A241
    ld   c, b
    and  c
    ld   c, b

label_6E85A::
    ld   c, b
    and  e
    ld   b, h
    and  d
    ld   b, h
    and  c
    ld   b, [hl]
    ld   c, d
    nop
    sbc  a, l
    ld   [hl], b
    ld   hl, $A341
    ld   d, b
    and  d
    ld   d, b
    and  c
    ld   d, b
    ld   d, b
    and  d
    ld   e, h
    ld   e, b
    and  e
    ld   d, h
    and  e
    ld   h, b
    and  d
    ld   h, b
    and  c
    ld   e, h
    ld   h, b
    and  d
    ld   h, d
    ld   h, [hl]
    ld   l, b
    ld   h, d
    nop
    and  e
    ld   h, [hl]
    sbc  a, l
    and  b
    ld   hl, $A240
    jr   z, label_6E82A
    jr   z, label_6E8B3
    and  e
    jr   z, label_6E88F
    nop

label_6E88F::
    and  d
    ld   bc, label_6E460
    xor  b
    ld   h, [hl]
    and  d
    ld   h, b
    ld   h, h
    xor  b
    ld   h, [hl]
    and  d
    ld   h, h
    ld   h, b
    ld   d, [hl]
    and  a
    ld   e, h
    and  l
    ld   h, b
    and  e
    ld   bc, $A200
    ld   h, b
    ld   h, h
    xor  b
    ld   h, [hl]
    and  d
    ld   e, h
    ld   h, [hl]
    xor  b
    ld   [hl], b
    and  d
    ld   l, [hl]
    ld   l, d
    and  l

label_6E8B3::
    ld   l, [hl]
    and  h
    ld   bc, label_1A2
    nop
    and  d
    ld   h, b
    ld   h, h
    xor  b
    ld   h, [hl]
    and  d
    ld   e, h
    ld   h, [hl]

label_6E8C1::
    xor  b
    ld   [hl], b
    and  d
    ld   l, [hl]
    ld   l, d
    sbc  a, l
    ld   d, b
    nop
    add  a, b
    ld   l, [hl]
    nop
    and  l
    ld   l, [hl]
    and  h
    ld   bc, $A800
    ld   bc, label_6FCA3
    ld   a, b
    ld   l, [hl]
    and  a
    ld   l, [hl]
    and  l
    ld   [hl], b
    and  d
    add  a, d
    ld   a, [hl]
    ld   a, h
    ld   a, b
    ld   l, [hl]
    ld   l, d
    ld   l, [hl]
    ld   a, b
    ld   [hl], b
    and  e
    ld   bc, $A200
    ld   [hl], b
    and  h
    ld   [hl], h
    and  d
    ld   bc, label_6EA62
    ld   [hl], h
    xor  b
    ld   l, [hl]
    and  d
    ld   bc, $A566
    ld   a, b
    and  d
    ld   bc, label_6F6A7
    adc  a, b
    sbc  a, l
    ld   h, b
    nop
    add  a, b
    and  h
    add  a, [hl]
    nop
    sbc  a, l
    ld   h, d
    ld   hl, $A380
    ld   bc, label_2601
    xor  d
    ld   h, $26
    ld   h, $9D
    add  a, d
    ld   hl, $A380
    jr   z, label_6E8C1
    jr   z, label_6E941
    jr   z, label_6E94D
    ldd  [hl], a
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    sbc  a, l
    and  d
    ld   hl, $A380
    ld   a, $AA
    ld   a, $3E
    ld   a, $A3
    ld   b, b
    xor  d
    ld   b, b
    ld   b, b
    ld   b, b
    and  e
    ld   b, h
    xor  d
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    and  e
    ld   c, [hl]
    xor  d
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    nop
    sbc  a, l
    and  b
    ld   hl, $A341
    ld   b, b
    ld   [hl], $AA
    ld   [hl], $01
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, d
    and  h
    ld   c, [hl]

label_6E94D::
    xor  d
    ld   bc, label_6D24E
    ld   d, h
    ld   d, d
    ld   c, [hl]
    and  h
    ld   c, d
    xor  d
    ld   bc, label_6CE4A
    ld   d, b
    ld   c, [hl]
    ld   c, d
    and  e
    ld   c, b
    xor  d
    ld   c, b
    ld   c, d
    ld   c, b
    and  e
    ld   b, h
    sbc  a, l
    ld   d, a
    nop
    add  a, b
    xor  d
    ld   bc, label_6F470
    sbc  a, e
    ld   [bc], a
    and  e
    ld   a, b
    ld   [hl], b
    and  h
    ld   a, [hl]
    sbc  a, h
    sbc  a, l
    and  b
    ld   hl, $AA41
    ld   d, d
    ld   d, [hl]
    ld   e, b
    ld   e, b
    ld   e, h
    ld   h, b
    and  e
    ld   h, d
    xor  d
    ld   h, d
    ld   h, [hl]
    ld   h, d
    and  e
    ld   h, b
    xor  d
    ld   h, b
    ld   h, d
    ld   h, b
    and  h
    ld   e, h
    nop
    sbc  a, l
    and  b
    ld   hl, $A341
    ld   b, b
    ld   [hl], $AA
    ld   [hl], $01
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, d
    and  e
    ld   c, [hl]
    sbc  a, l
    add  a, b
    ld   hl, $AA41
    jr   z, label_6E9D2
    ld   [hl], $3E
    ld   [hl], $3E
    ld   b, h
    ld   c, [hl]
    ld   d, [hl]
    nop
    sbc  a, l
    and  b
    ld   h, $81
    xor  d
    ld   e, b
    ld   bc, $A45C
    ld   e, [hl]
    xor  d
    ld   e, b
    ld   bc, $A35C
    ld   e, [hl]
    xor  d
    ld   bc, label_6DE01
    and  [hl]
    ld   e, h
    ld   e, b
    and  d
    ld   c, [hl]
    and  h
    ld   d, h
    xor  [hl]
    ld   e, b
    xor  d
    ld   e, b
    ld   bc, $A45C
    ld   e, [hl]
    xor  d

label_6E9D2::
    ld   e, b
    ld   e, h
    ld   e, [hl]
    xor  b
    ld   l, b
    xor  d
    ld   l, b
    ld   h, [hl]
    ld   e, [hl]
    and  l
    ld   h, d
    and  e
    ld   h, d
    sbc  a, l
    and  b
    ld   hl, $AA40
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   c, b
    ld   c, d
    ld   c, b
    ld   b, h
    ld   c, b
    ld   b, h
    nop
    sbc  a, l
    and  b
    ld   hl, $A441

label_6E9F3::
    ld   e, b
    xor  d
    ld   bc, label_6D858
    ld   e, b
    ld   d, h
    ld   e, b
    and  h
    ld   e, d
    xor  d
    ld   bc, label_6E25E
    ld   h, [hl]
    ld   l, b
    ld   l, h
    and  e
    ld   [hl], b
    nop
    sbc  a, l
    and  b
    ld   hl, $A200
    ld   e, b
    and  c
    ld   c, [hl]
    ld   e, b
    and  e
    ld   d, h
    and  d
    ld   d, h
    and  c
    ld   e, b
    ld   e, h
    nop
    and  e
    ld   e, [hl]
    and  d
    ld   e, [hl]
    and  c
    ld   e, b
    ld   e, [hl]
    and  e
    ld   h, d
    and  c
    ld   h, d
    ld   h, [hl]
    ld   l, b
    ld   l, h
    sbc  a, l
    and  b
    nop
    ld   bc, label_6F0A5
    nop
    sbc  a, l
    and  b
    ld   hl, $A300
    ld   a, b
    and  d
    ld   b, b

label_6EA35::
    and  c
    ld   b, b
    ld   b, b

label_6EA38::
    and  e

label_6EA39::
    ld   b, b
    ld   bc, $9D00
    ld   hl, label_206F
    nop

label_6EA41::
    sbc  a, l
    ld   de, label_6C06F
    nop
    sbc  a, e
    inc  bc
    and  l
    ld   bc, $A39C
    ld   bc, label_1A6
    nop
    xor  b
    ld   bc, label_1A2
    nop
    sbc  a, l
    pop  bc
    ld   l, [hl]
    jr   nz, label_6E9F3
    and  d
    ld   c, b
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    and  h
    ld   bc, label_3AA2
    ld   c, b
    ld   c, [hl]

label_6EA65::
    ld   e, b
    ld   bc, $A156
    ld   d, d
    ld   c, [hl]

label_6EA6B::
    ld   c, h
    ld   a, $A2
    ld   c, b
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    and  h
    ld   bc, label_3AA2
    ld   c, b
    ld   c, [hl]
    ld   e, b
    and  e
    ld   bc, $A300
    ld   bc, label_29B
    and  d
    inc  l
    and  e
    inc  l
    and  d
    inc  l
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    and  d
    ld   e, $A3
    ld   e, $A2
    ld   e, $9C
    sbc  a, e
    ld   [bc], a
    and  d
    jr   z, label_6EA38
    jr   z, label_6EA39
    jr   z, label_6EA35
    sbc  a, e
    ld   [bc], a
    and  d
    ld   h, $A3
    ld   h, $A2

label_6EAA0::
    ld   h, $9C
    nop
    sbc  a, l
    pop  bc
    ld   l, [hl]
    jr   nz, label_6EA41
    sbc  a, e
    ld   b, $A3
    ld   e, $AA
    ld   e, $1E
    ld   e, $9C
    and  e
    ld   e, $1E
    ldi  [hl], a
    ld   h, $00
    sbc  a, c
    and  e
    jr   z, label_6EA65
    jr   z, label_6EAE5
    inc  h
    and  e
    jr   z, label_6EA6B
    jr   z, label_6EAEB

label_6EAC3::
    jr   z, label_6EA68
    inc  h

label_6EAC6::
    xor  d
    inc  a
    inc  a

label_6EAC9::
    inc  a
    sbc  a, d
    and  e
    db   $3A ; ldd  a, [hl]
    ldi  [hl], a
    sbc  a, c
    sbc  a, e
    ld   [bc], a
    and  e
    inc  l
    xor  d
    inc  l
    inc  l
    inc  l
    sbc  a, h
    and  e
    ld   e, $AA
    ld   e, $1E
    ld   e, $9A
    and  e
    ld   e, $20
    sbc  a, c
    xor  d
    ldi  [hl], a

label_6EAE5::
    ld   b, b
    ld   c, b
    ld   d, d
    ld   c, b
    ld   b, b
    jr   nc, label_6EB2A
    ld   b, h
    ld   c, [hl]
    ld   b, h
    ld   a, $3A
    ld   b, b
    ld   c, b
    ld   d, d
    ld   c, b
    ld   b, b
    jr   nc, label_6EB36
    ld   b, h
    ld   c, [hl]
    ld   b, h
    jr   nc, label_6EAA0
    ldd  [hl], a
    xor  d
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    and  e
    ld   a, [hli]
    xor  d
    ld   a, [hli]
    ld   a, [hli]
    ld   a, [hli]
    ld   e, $28
    inc  l
    ld   [hl], $40
    ld   b, h
    ld   c, [hl]
    ld   [hl], $3A
    ld   a, $3A
    ld   [hl], $00
    sbc  a, c
    and  e
    jr   z, label_6EAC3
    jr   z, label_6EB43
    inc  h
    and  e
    jr   z, label_6EAC9
    jr   z, label_6EB49
    jr   z, label_6EAC6
    ld   e, $AA
    ld   e, $1E
    ld   e, $1E
    xor  d

label_6EB2A::
    ld   [hl], $3A
    ld   a, $3A
    ld   [hl], $00
    xor  d
    jr   c, label_6EB8B
    ld   e, [hl]
    ld   l, b
    ld   e, [hl]

label_6EB36::
    ld   e, b
    ld   d, b
    ld   e, b
    ld   e, [hl]
    ld   l, b
    ld   e, [hl]
    ld   e, b
    sbc  a, e
    ld   [bc], a
    ld   d, b
    ld   d, h
    ld   e, h
    ld   h, d

label_6EB43::
    ld   e, h
    ld   d, h
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   c, [hl]

label_6EB49::
    ld   d, h
    ld   e, h
    ld   h, d
    ld   e, h
    ld   d, h
    sbc  a, h
    ld   b, b
    ld   c, b
    ld   c, [hl]
    ld   d, h
    ld   c, [hl]
    ld   c, b

label_6EB55::
    ld   b, b
    ld   c, b
    ld   c, [hl]
    ld   d, h
    ld   c, [hl]
    ld   b, b
    sbc  a, e
    ld   [bc], a
    sbc  a, c
    xor  d

label_6EB5F::
    ldd  [hl], a

label_6EB60::
    ld   b, b
    ld   b, [hl]
    ld   d, b
    ld   e, b
    ld   e, [hl]
    sbc  a, d
    and  e
    ld   l, b
    ld   bc, $999C
    sbc  a, e
    ld   [bc], a
    xor  d
    ld   a, [hli]
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, [hl]
    ld   c, d
    sbc  a, h
    and  e
    ld   c, [hl]
    ld   e, $22
    ld   h, $00
    jr   c, label_6EBBD
    ld   b, [hl]
    ld   d, b
    ld   e, b
    ld   e, [hl]
    sbc  a, d
    and  e
    ld   l, b
    sbc  a, c
    xor  d
    jr   c, label_6EBC0
    jr   c, label_6EBB4
    ldd  [hl], a

label_6EB8B::
    jr   c, label_6EBCF
    ld   c, d
    ld   d, b
    sbc  a, d
    and  e
    ld   [hl], d
    sbc  a, c
    xor  d
    ld   a, [hli]
    ld   a, [hli]
    ld   a, [hli]
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    jr   z, label_6EBBB
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    inc  h
    ld   a, [de]
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    jr   nz, label_6EBD7
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    inc  h
    ldd  [hl], a
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    jr   z, label_6EBD1
    sbc  a, h

label_6EBB4::
    sbc  a, e
    ld   [bc], a
    ld   a, [hli]
    jr   nz, label_6EB55
    nop
    and  e

label_6EBBB::
    jr   z, label_6EB5F

label_6EBBD::
    jr   z, label_6EB60
    jr   z, label_6EBE9
    and  e
    jr   z, label_6EBC5
    nop

label_6EBC5::
    sbc  a, e
    inc  d
    and  l
    ld   bc, $A39C
    ld   bc, $9B00
    ld   b, $A5
    ld   bc, $A39C
    ld   bc, $9B00
    inc  bc

label_6EBD7::
    and  e
    dec  d
    xor  d
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    sbc  a, h
    xor  d
    dec  d
    dec  d
    dec  d
    ld   a, [de]
    dec  d
    dec  d
    nop
    sbc  a, e
    inc  bc
    and  e

label_6EBE9::
    dec  d
    xor  d
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    sbc  a, h
    xor  d
    dec  d
    dec  d
    dec  d
    ld   a, [de]
    dec  d
    dec  d
    nop
    sbc  a, e
    ld   [label_29AA], sp
    add  hl, hl
    add  hl, hl
    ld   a, [de]
    add  hl, hl
    add  hl, hl
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    and  c
    ld   a, [de]
    ld   a, [de]
    and  e
    ld   a, [de]
    sbc  a, h
    sbc  a, e
    inc  b
    and  c
    ld   a, [de]
    sbc  a, h
    nop
    and  e
    ld   a, [de]
    and  d
    ld   a, [de]
    and  c
    ld   a, [de]
    ld   a, [de]
    and  e
    ld   a, [de]
    ld   bc, $0000
    cp   c
    ld   c, d
    ld   h, $6C
    jr   c, label_6EC8E
    ld   c, d
    ld   l, h
    nop
    nop
    ld   d, b
    ld   l, h
    ld   d, l
    ld   l, h
    ld   d, l
    ld   l, h
    ret  nz
    ld   l, a
    ld   d, l
    ld   l, h
    rst  $30
    ld   l, a
    ld   d, l
    ld   l, h
    rst  $38
    rst  $38
    ldd  [hl], a
    ld   e, [hl]
    ld   d, b
    ld   l, h
    ld   e, a
    ld   l, h
    ld   e, a
    ld   l, h
    ret  nz
    ld   l, a
    ld   e, a
    ld   l, h
    rst  $30
    ld   l, a
    ld   e, a
    ld   l, h
    rst  $38
    rst  $38
    ld   d, d
    ld   e, [hl]
    ld   h, c
    ld   [hl], b
    rst  $38
    rst  $38
    ld   e, [hl]
    ld   e, [hl]
    sbc  a, l
    ld   b, b
    nop
    ld   b, b
    nop
    and  c
    inc  [hl]
    ld   [hl], $34
    ldd  [hl], a
    jr   nc, label_6EC8A
    jr   nc, label_6EC90
    nop
    and  c
    ld   c, b
    ld   c, d
    ld   c, b
    ld   b, [hl]
    ld   b, h
    ld   b, d
    ld   b, h
    ld   b, [hl]
    nop
    nop
    rst  $10
    ld   c, d
    ld   [hl], h
    ld   l, h
    sub  a, h
    ld   l, h
    cp   b
    ld   l, h
    ret  c
    ld   l, h
    ld   h, c
    ld   [hl], b
    or   $6C
    nop
    ld   l, [hl]
    adc  a, c
    ld   [hl], b
    ld   b, $70
    db   $FD ; Undefined instruction
    ld   l, h
    dec  bc
    ld   [hl], b
    inc  bc
    ld   l, l
    ld   bc, label_970
    ld   l, l
    ld   a, d
    ld   l, l

label_6EC8A::
    ld   [$FF6D], a
    di
    ld   l, l

label_6EC8E::
    ld    hl, sp+$6D

label_6EC90::
    rst  $38
    rst  $38
    adc  a, a
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    add  a, c
    ld   l, l
    nop
    ld   l, [hl]
    adc  a, c
    ld   [hl], b
    db   $FC ; Undefined instruction
    ld   l, a
    adc  a, b
    ld   l, l
    db   $10 ; Undefined instruction
    and  a
    ld   l, l
    add  a, e
    ld   [hl], b

label_6ECA6::
    ei
    ld   l, l
    rst  0
    ld   l, l
    call nc, label_E06D
    ld   l, l
    add  a, e
    ld   [hl], b
    di
    ld   l, l
    ld    hl, sp+$6D
    rst  $38
    rst  $38
    adc  a, a
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    dec  d
    ld   [hl], b
    nop
    ld   l, [hl]
    add  a, e
    ld   [hl], b
    adc  a, c
    ld   [hl], b
    dec  de
    ld   [hl], b
    ld   [de], a
    ld   l, [hl]
    inc  [hl]
    ld   l, [hl]
    ld   d, l
    ld   l, a
    rst  0
    ld   l, l
    call nc, label_E06D
    ld   l, l
    adc  a, c
    ld   [hl], b
    ld    hl, sp+$6D
    rst  $38
    rst  $38

label_6ECD6::
    adc  a, a
    ld   [hl], b
    ld   c, d
    ld   l, [hl]
    ld   d, [hl]
    ld   l, [hl]
    ld   d, [hl]
    ld   l, [hl]
    ld   d, [hl]
    ld   l, [hl]
    ld   d, [hl]
    ld   l, [hl]
    ld   l, e
    ld   l, [hl]
    ld   l, e
    ld   l, [hl]
    ld   l, e
    ld   l, [hl]
    ld   l, e
    ld   l, [hl]

label_6ECEA::
    ld   l, e
    ld   l, [hl]
    ld   l, e
    ld   l, [hl]
    sub  a, l
    ld   l, [hl]
    sbc  a, c
    ld   l, [hl]
    rst  $38
    rst  $38
    sub  a, l
    ld   [hl], b
    sbc  a, l
    stop
    add  a, c
    and  d
    ld   bc, $A400
    sub  a, b
    add  a, d
    add  a, [hl]
    ld   a, b
    nop
    and  h
    sub  a, b
    add  a, d
    add  a, [hl]
    ld   bc, $9D00
    or   c
    add  a, d
    nop
    and  d
    db   $10 ; Undefined instruction
    sbc  a, l
    ld   [hl], c
    add  a, d
    add  a, b
    and  c
    ld   l, [hl]
    ld   h, b
    ld   l, [hl]
    ld   a, b
    and  e
    ld   bc, $B19D
    add  a, d
    nop
    and  d
    ld   bc, label_1006
    db   $10 ; Undefined instruction
    ld   [hl], c
    add  a, d
    add  a, b
    and  c
    ld   l, [hl]
    ld   h, b
    ld   l, [hl]
    ld   a, b
    and  e
    ld   bc, $B19D
    add  a, d
    nop
    and  d
    ld   bc, label_1810
    jr   label_6ECD6
    ld   [hl], c
    add  a, d
    add  a, b
    and  c
    ld   l, d
    ld   e, h
    ld   l, d
    ld   l, [hl]
    and  e
    ld   bc, $B19D
    add  a, d
    nop
    and  d
    ld   bc, label_180E
    jr   label_6ECEA
    ld   [hl], c
    add  a, d
    add  a, b
    and  c
    ld   l, d
    ld   e, h
    ld   l, d
    ld   l, [hl]
    sbc  a, l
    add  a, b
    nop
    nop
    and  e
    jr   label_6ED70
    sbc  a, l
    and  c
    add  a, d
    nop
    and  d
    db   $10 ; Undefined instruction
    and  h
    ld   bc, label_1A2
    ld   b, $10
    db   $10 ; Undefined instruction
    ld   bc, label_10A3
    sbc  a, e
    inc  bc

label_6ED70::
    and  d
    ld   b, $06
    and  h
    ld   bc, label_1A2
    inc  d
    sbc  a, h
    nop
    sbc  a, l
    ld   h, $00
    nop
    and  e
    ld   bc, $9D00
    ld   b, b
    nop
    ld   b, c
    and  d
    ld   bc, $9B00
    inc  bc
    and  l
    ld   bc, $A49C
    ld   bc, label_1A2
    ld   c, b
    ld   c, h
    xor  b
    ld   c, [hl]
    and  d
    ld   c, b
    ld   c, h
    xor  b
    ld   c, [hl]
    and  d
    ld   c, h
    ld   c, b
    ld   a, $A7
    ld   b, h
    xor  b
    ld   c, b
    and  d
    ld   bc, label_1A8
    nop
    sbc  a, e
    inc  bc
    and  c
    ld   h, b
    ld   e, h
    ld   e, b
    ld   c, [hl]
    ld   c, b
    ld   c, [hl]
    ld   e, b
    ld   e, h
    sbc  a, h
    ld   h, b
    ld   e, h
    ld   e, b
    ld   c, [hl]
    ld   c, b
    ld   c, [hl]
    ld   e, b
    ld   h, b
    sbc  a, e
    ld   [bc], a
    ld   e, h
    ld   d, [hl]
    ld   d, d
    ld   c, [hl]
    ld   b, h
    ld   c, [hl]
    ld   d, d
    ld   d, [hl]
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    and  c
    ld   h, h
    ld   e, h
    ld   d, [hl]
    ld   c, [hl]
    ld   c, h
    ld   c, [hl]
    ld   d, [hl]
    ld   e, h
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    ld   l, d
    ld   h, h
    ld   e, h
    ld   d, [hl]
    ld   d, d
    ld   d, [hl]
    ld   e, h
    ld   h, h
    sbc  a, h
    nop
    and  c
    ld   b, $14
    inc  e
    ld   e, $26
    inc  l
    inc  [hl]
    ld   [hl], $3E
    ld   b, h
    ld   c, h
    ld   c, [hl]
    ld   d, [hl]
    ld   e, h
    and  d
    ld   h, h
    ld   h, [hl]
    nop
    sbc  a, l
    ld   [hl], a
    nop
    add  a, b
    nop
    and  l
    adc  a, h
    nop
    sbc  a, l
    ld   b, b
    nop
    add  a, b
    nop
    and  d
    ld   c, b
    ld   c, h
    xor  b
    ld   c, [hl]
    and  d
    ld   c, b
    ld   c, h
    xor  b
    ld   c, [hl]
    and  d
    ld   c, h
    ld   c, b
    and  [hl]
    ld   a, $A5
    ld   d, [hl]
    nop
    sbc  a, e
    inc  bc
    and  l
    ld   bc, $A49C
    ld   bc, label_1A2
    and  d
    ld   [hl], $3A
    and  h
    ld   a, $A3
    ld   bc, label_36A2
    db   $3A ; ldd  a, [hl]
    and  h
    ld   a, $A3
    ld   bc, label_3AA2
    and  e
    ld   [hl], $A7
    inc  [hl]
    and  h
    ld   [hl], $A8
    ld   bc, $A200
    ld   c, b
    ld   c, h
    and  h
    ld   c, [hl]
    and  e
    ld   bc, label_6C8A2
    ld   c, [hl]
    and  h
    ld   e, b
    and  e
    ld   bc, label_6D6A2
    ld   d, d
    and  l
    ld   d, [hl]
    and  d
    ld   bc, $9B00
    dec  b
    and  l
    ld   bc, $A49C
    ld   bc, label_1A2
    and  [hl]
    ld   bc, $9B00
    inc  bc
    and  d
    dec  d
    xor  c
    dec  d
    xor  l
    ld   bc, label_15A9
    xor  l
    ld   bc, label_15A9
    sbc  a, h
    sbc  a, e
    inc  b
    and  c
    dec  d
    sbc  a, h
    nop
    and  d
    inc  h
    xor  c
    ld   a, [de]
    xor  l
    ld   bc, label_1AA9
    xor  l
    ld   bc, label_1AA9
    and  d
    ld   a, [de]
    xor  c
    ld   a, [de]
    xor  l
    ld   bc, label_1AA9
    xor  l
    ld   bc, label_1AA9
    and  d
    inc  h
    xor  c
    dec  d
    xor  l
    ld   bc, label_1AA9
    xor  l
    ld   bc, label_1AA9
    sbc  a, e
    inc  b
    and  c
    ld   a, [de]
    sbc  a, h
    nop
    and  h
    inc  h
    ld   bc, $9B00
    inc  b
    and  l
    ld   bc, $A79C
    ld   bc, label_6E600
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, b
    adc  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
    nop
    nop
    nop
    nop
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
    nop
    nop
    nop
    nop
    xor  d
    xor  d
    xor  d
    xor  d
    xor  d
    xor  d
    xor  d
    xor  d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $9B
    call label_EEDE
    rst  $38
    rst  $38
    cp   $06
    sbc  a, e
    call label_EEDE
    rst  $38
    rst  $38
    cp   $7F
    rst  $38
    ld   d, a
    ld   [hl], e
    ld   d, l
    inc  [hl]
    ld   b, d
    ld   hl, $FF7F
    ld   d, a
    ld   [hl], e
    ld   d, l
    inc  [hl]
    ld   b, d
    ld   hl, label_3333
    inc  sp
    inc  sp
    nop
    nop
    nop
    nop
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    nop
    nop
    nop
    nop
    ld   de, label_1111
    ld   de, $0000
    nop
    nop
    ld   de, label_1111
    ld   de, $0000
    nop
    nop
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    nop
    nop
    nop
    nop
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    nop
    nop
    nop
    nop
    sbc  a, l
    pop  bc
    ld   l, [hl]
    jr   nz, label_6EF46

label_6EF46::
    sbc  a, l
    pop  bc
    ld   l, [hl]
    ld   b, b
    nop
    sbc  a, l
    pop  de
    ld   l, [hl]
    ld   hl, $9D00
    pop  de
    ld   l, [hl]
    ld   b, b
    nop
    sbc  a, l
    pop  de
    ld   l, [hl]
    ld   b, b
    sbc  a, c
    nop
    sbc  a, l
    and  c
    ld   l, [hl]
    jr   nz, label_6EF60

label_6EF60::
    sbc  a, l
    pop  hl
    ld   l, [hl]
    jr   nz, label_6EF65

label_6EF65::
    sbc  a, l
    ld   sp, label_6C06F
    sbc  a, c
    nop
    sbc  a, l
    or   c
    ld   l, [hl]
    ld   hl, $9D00
    or   c
    ld   l, [hl]
    dec  h
    nop
    sbc  a, l
    or   c
    ld   l, [hl]
    ld   b, b
    nop
    sbc  a, l
    ld   b, d
    nop
    add  a, b
    nop
    sbc  a, l
    ld   d, e
    nop
    add  a, b
    nop
    sbc  a, l
    ld   d, b
    add  a, e
    ld   b, b
    nop
    sbc  a, l
    ld   h, b
    add  a, c
    add  a, b
    nop
    sbc  a, l
    ld   [hl], c
    nop
    ld   b, b
    nop
    sbc  a, l
    ld   b, d
    nop
    ld   b, b
    nop
    sbc  a, l
    inc  sp
    nop
    ld   b, b
    nop
    sbc  a, l
    ld   h, d
    nop
    add  a, b
    nop
    sbc  a, l
    ld   h, b
    ld   h, $01
    nop
    sbc  a, l
    ld   h, b
    ld   h, $81
    nop
    sbc  a, l
    ld   b, b
    nop
    add  a, b
    nop
    sbc  a, l
    jr   nz, label_6EFB4

label_6EFB4::
    add  a, b
    nop
    sbc  a, l
    ld   b, e
    nop
    add  a, b
    nop
    sbc  a, l
    ld   b, b
    ld   hl, $0080
    sbc  a, l
    ld   d, b
    nop
    ld   b, c
    nop
    sbc  a, l
    ld   h, b
    ld   hl, $0041
    sbc  a, l
    ld   h, b
    nop
    add  a, c
    nop
    sbc  a, l
    sub  a, b
    ld   hl, $0041
    sbc  a, l
    or   b
    ld   hl, $0041
    sbc  a, l
    sub  a, c
    nop
    ld   b, b
    nop
    sbc  a, l
    ld   d, b
    ld   h, $80
    nop
    sbc  a, l
    jr   nc, label_6F007
    add  a, b
    nop
    sbc  a, l
    jr   nz, label_6F00C
    add  a, b
    nop
    sbc  a, l
    ld   h, b
    ld   h, $80
    nop
    sbc  a, l
    ld   b, b
    ld   h, $80
    nop
    sbc  a, l
    ld   h, b
    nop
    ld   b, b
    nop
    sbc  a, l
    and  b
    ld   hl, $0041
    sbc  a, l
    add  a, d
    add  a, d
    add  a, b
    nop
    sbc  a, l

label_6F007::
    ld   [hl], a
    nop
    add  a, b
    nop
    sbc  a, l

label_6F00C::
    sub  a, a
    nop
    add  a, b
    nop
    sbc  a, l
    ld   d, c
    add  a, d
    add  a, b
    nop
    sbc  a, l
    ld   bc, label_16F
    sub  a, h
    nop
    sbc  a, l
    pop  af
    ld   l, [hl]
    ld   bc, $0094
    sbc  a, a
    cp   $00
    sbc  a, a
    nop
    nop
    sbc  a, a
    ld   [bc], a
    nop
    sbc  a, a
    ld   a, [bc]
    nop
    sbc  a, l
    stop
    add  a, b
    nop
    sbc  a, l
    scf
    nop
    add  a, b
    nop
    sbc  a, l
    ld   b, e
    add  a, e
    add  a, b
    nop
    sbc  a, e
    dec  bc
    and  l
    ld   bc, $A49C
    ld   bc, $9B00
    ld   de, label_1A5
    sbc  a, h
    nop
    sbc  a, e
    add  hl, bc
    and  l
    ld   bc, $A49C
    ld   bc, $9B00
    add  hl, bc
    and  l
    ld   bc, $A49C
    ld   bc, $A500
    ld   bc, $0001
    and  l
    ld   bc, $A500
    ld   bc, $0001
    sbc  a, e
    inc  bc
    and  l
    ld   bc, $009C
    sbc  a, e
    inc  b
    and  l
    ld   bc, $009C
    sbc  a, e
    db   $10 ; Undefined instruction
    ld   bc, $009C
    xor  b
    ld   bc, $A600
    ld   bc, $A700
    ld   bc, $A100
    ld   bc, $A200
    ld   bc, $A400
    ld   bc, $A300
    ld   bc, $A500
    ld   bc, label_6DE00
    ld   [hl], b
    rst  $38
    rst  $38
    adc  a, a
    ld   [hl], b
    adc  a, h
    ld   [hl], b
    rst  $38
    rst  $38
    sub  a, l
    ld   [hl], b
    sbc  a, [hl]
    ret  z
    ld   c, d
    nop
    sbc  a, [hl]
    rst  $10
    ld   c, d
    nop
    sbc  a, [hl]
    push af

label_6F0A5::
    ld   c, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  z
    ld   c, d
    dec  bc
    ld   [hl], c
    ld   de, label_1D71
    ld   [hl], c
    nop
    nop
    cpl
    ld   [hl], c
    rst  $38
    rst  $38
    inc  de
    ld   [hl], c
    scf
    ld   [hl], c
    inc  a
    ld   [hl], c
    inc  a
    ld   [hl], c
    or   d
    ld   [hl], c
    rst  $38
    rst  $38
    inc  de
    ld   [hl], c
    jr   z, label_6F191
    dec  l
    ld   [hl], d
    dec  l
    ld   [hl], d
    ld   l, d
    ld   [hl], d
    rst  $38
    rst  $38
    dec  e
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], e
    rst  $38
    rst  $38
    add  hl, hl
    ld   [hl], c
    sbc  a, l
    scf
    nop
    add  a, b
    xor  d
    ld   bc, $0001
    sbc  a, l
    ld   b, a
    nop
    add  a, b
    nop
    and  d
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   l, b
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   l, b
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   l, b
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   l, b
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    ld   l, b
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    ld   l, b
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    ld   l, b
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    ld   l, b
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   l, b
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   l, b
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   l, b
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   l, b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   l, b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   l, b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   l, b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   l, b
    ld   d, b
    ld   e, b
    ld   h, d
    ld   h, [hl]
    ld   d, b
    ld   e, b
    ld   h, d
    ld   h, [hl]
    ld   d, b
    ld   e, b
    ld   h, d
    ld   h, [hl]
    ld   d, b
    ld   e, b
    ld   h, d
    ld   h, [hl]
    ld   c, [hl]
    ld   e, b
    ld   h, d
    ld   h, [hl]

label_6F191::
    ld   c, [hl]
    ld   e, b
    ld   h, d
    ld   h, [hl]
    ld   c, [hl]
    ld   e, b
    ld   h, d
    ld   h, [hl]
    ld   c, [hl]
    ld   e, b
    ld   h, d
    ld   h, [hl]
    ld   c, d
    ld   d, [hl]
    ld   e, h
    ld   h, d
    ld   d, [hl]
    ld   e, h
    ld   h, d
    ld   l, b
    ld   e, h
    ld   h, d
    ld   l, b
    ld   h, d
    ld   l, b
    ld   l, [hl]
    ld   l, b
    ld   l, [hl]
    ld   [hl], h
    ld   l, [hl]
    ld   [hl], h
    ld   a, d
    nop
    and  d
    ld   h, [hl]
    ld   e, [hl]
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   e, [hl]
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   e, [hl]
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   e, [hl]
    ld   e, b
    ld   e, [hl]
    ld   h, [hl]
    ld   e, h
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    ld   e, h
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    ld   e, h
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]
    ld   e, h
    ld   d, [hl]
    ld   e, h
    ld   h, [hl]

label_6F1D4::
    ld   e, d
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   e, d
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   e, d
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   e, d
    ld   d, h
    ld   e, d
    ld   h, [hl]
    ld   e, b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   e, b

label_6F1ED::
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   d, b
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   d, b
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   d, b
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   d, b
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   c, [hl]
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   c, [hl]
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   c, [hl]
    ld   e, b
    ld   h, [hl]
    ld   e, b
    ld   c, [hl]
    ld   e, b
    ld   c, d
    ld   d, [hl]
    ld   e, h
    ld   h, d
    ld   d, [hl]
    ld   e, h
    ld   h, d
    ld   l, b
    ld   e, h
    ld   h, d
    ld   l, b
    ld   h, d
    ld   l, b
    ld   l, [hl]
    ld   l, b
    ld   l, [hl]
    ld   [hl], h
    ld   l, [hl]
    ld   [hl], h
    ld   a, d
    nop
    sbc  a, l
    ld   c, c
    ld   [hl], e
    ld   hl, $A500
    jr   z, label_6F1D4
    ld   l, $36
    inc  [hl]
    xor  [hl]
    ld   h, $A5
    inc  h
    and  a
    inc  h
    ld   a, [hli]
    and  e
    inc  [hl]
    and  h
    ldd  [hl], a
    xor  [hl]
    ldi  [hl], a
    and  d
    jr   nz, label_6F261
    xor  b
    jr   nz, label_6F1ED
    jr   z, label_6F280
    and  e
    ld   [hl], $A2
    ld   e, $1C
    xor  b
    ld   e, $A7
    jr   z, label_6F288
    and  e
    inc  [hl]
    and  d
    ld   e, $26
    inc  l
    ld   h, $2C
    ldd  [hl], a
    inc  l
    ldd  [hl], a
    jr   c, label_6F291
    jr   c, label_6F29F

label_6F261::
    ld   b, h
    ld   a, $38
    ldd  [hl], a
    jr   c, label_6F299
    inc  l
    ld   h, $00
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b
    sbc  a, c
    and  d
    ld   [hl], $36
    ld   [hl], $36
    sbc  a, l
    ld   l, c
    ld   [hl], e
    ld   b, b
    ld   [hl], $36
    ld   [hl], $36
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b

label_6F280::
    ld   [hl], $36
    ld   [hl], $36
    sbc  a, l
    ld   l, c
    ld   [hl], e
    ld   b, b

label_6F288::
    ld   [hl], $36
    ld   [hl], $36
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b
    ld   bc, $0101
    ld   bc, label_3434
    inc  [hl]
    inc  [hl]
    inc  l

label_6F299::
    inc  l
    inc  l
    inc  l
    sbc  a, l
    ld   l, c
    ld   [hl], e

label_6F29F::
    ld   b, b
    inc  l
    inc  l
    inc  l
    inc  l
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    sbc  a, l
    ld   l, c
    ld   [hl], e
    ld   b, b
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b
    ld   bc, $0101
    ld   bc, label_3636
    ldd  [hl], a
    ldd  [hl], a
    jr   nc, label_6F2F2
    jr   nc, label_6F2F4
    sbc  a, l
    ld   l, c
    ld   [hl], e
    ld   b, b
    jr   nc, label_6F2FA
    jr   nc, label_6F2FC
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b
    ld   bc, $0101
    ld   bc, label_2828
    inc  l
    inc  l
    ld   l, $2E
    ld   l, $2E
    sbc  a, l
    ld   l, c
    ld   [hl], e
    ld   b, b
    ld   l, $2E
    ld   l, $2E
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b
    ld   bc, label_2E01
    ld   l, $32
    ldd  [hl], a
    ld   l, $2E
    inc  l
    inc  l

label_6F2F2::
    inc  l
    inc  l

label_6F2F4::
    sbc  a, l
    ld   l, c
    ld   [hl], e
    ld   b, b
    inc  l
    inc  l

label_6F2FA::
    inc  l
    inc  l

label_6F2FC::
    sbc  a, l
    ld   e, c
    ld   [hl], e
    ld   b, b
    ld   bc, label_2801
    jr   z, label_6F32B
    ld   h, $28
    jr   z, label_6F335
    inc  l
    inc  l
    inc  l
    sbc  a, l
    ld   l, c
    ld   [hl], e
    ld   b, b
    inc  l
    inc  l
    inc  l
    inc  l
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    sbc  a, d
    nop
    sbc  a, e
    rlca
    and  e
    dec  d
    dec  d
    rra
    and  d
    ld   b, $A3

label_6F32B::
    dec  d
    dec  d
    and  d
    dec  d
    and  e
    db   $10 ; Undefined instruction
    and  d
    dec  d
    dec  d

label_6F335::
    dec  d
    dec  d
    and  e
    ld   bc, label_15A2
    dec  d
    dec  d
    dec  d
    and  e
    ld   bc, label_15A2
    dec  d
    dec  d
    dec  d
    and  e
    ld   b, $06
    nop
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
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
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6F46E::
    nop
    nop

label_6F470::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6F6A7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6F79D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6FAA1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6FCA3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6FF6F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
