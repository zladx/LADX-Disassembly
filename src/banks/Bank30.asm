section "bank30",romx,bank[$1E]
    jp   label_78009
    jp   label_78CFF
    jp   label_7801E

label_78009::
    ld   hl, $D300

label_7800C::
    ld   [hl], $00
    inc  l
    jr   nz, label_7800C
    ld   a, $80
    ld   [rNR52], a
    ld   a, $77
    ld   [rNR50], a
    ld   a, $FF
    ld   [rNR51], a
    ret

label_7801E::
    ld   hl, $D368
    ld   a, [hli]
    and  a
    jr   nz, label_78039
    call label_7803F

label_78028::
    call label_78581

label_7802B::
    xor  a
    ld   [$D360], a
    ld   [$D368], a
    ld   [$D370], a
    ld   [$D378], a
    ret

label_78039::
    ld   [hl], a
    call label_78163
    jr   label_78028

label_7803F::
    ld   de, $D393
    ld   hl, $D378
    ld   a, [hli]
    cp   $01
    jr   z, label_78050

label_7804A::
    ld   a, [hl]
    cp   $01
    jr   z, label_7805B
    ret

label_78050::
    ld   a, $01
    ld   [$D379], a
    ld   hl, label_78068
    jp   label_78072

label_7805B::
    ld   a, [de]
    dec  a
    ld   [de], a
    ret  nz
    xor  a
    ld   [$D379], a
    ld   hl, label_7806D
    jr   label_78072

label_78068::
    dec  sp
    add  a, b
    rlca
    ret  nz
    ld   [bc], a

label_7806D::
    nop
    ld   b, d
    ld   [bc], a
    ret  nz
    inc  b

label_78072::
    ld   b, $04
    ld   c, $20

label_78076::
    ld   a, [hli]
    ldh  [$FF0C], a
    inc  c
    dec  b
    jr   nz, label_78076
    ld   a, [hl]
    ld   [de], a
    ret

label_7807F::
    add  hl, bc
    ld   d, d
    ld   d, [hl]
    ld   d, [hl]
    ld   l, d
    ld   e, [hl]
    ld   [hl], h
    ld   e, c
    xor  [hl]
    ld   e, d
    and  a
    ld   e, h
    or   e
    ld   e, l
    xor  $5E
    inc  a
    ld   e, a
    nop
    ld   d, b
    ld   h, h
    ld   h, b
    jp   nz, label_2360
    ld   h, c
    xor  c
    ld   h, d
    ld   [hl], l
    ld   h, h
    and  l
    ld   [hl], d
    db   $10 ; Undefined instruction

label_780A1::
    ld   [hl], $66

label_780A3::
    cp   a
    ld   d, d
    ld   h, d
    ld   h, [hl]
    and  [hl]
    ld   a, e
    ld   [hl], a
    ld   h, a
    inc  sp
    ld   c, e
    pop  af
    ld   [hl], d
    ccf
    ld   [hl], e
    sbc  a, [hl]
    ld   [hl], e
    ld   d, $74
    xor  b
    ld   [hl], h
    ld   b, [hl]
    ld   [hl], l
    sub  a, d
    ld   [hl], l
    nop
    halt
    ld   [hl], a
    nop
    ld   [hl], b
    inc  l
    ld   [hl], b
    ld   a, [$FF70]
    ld   e, b
    ld   [hl], c
    and  [hl]
    ld   [hl], c
    call nc, label_3C71
    ld   [hl], d
    db   $D3 ; Undefined instruction
    ld   a, b
    jr   z, label_7811C
    sub  a, e
    halt
    ld   h, e
    ld   a, c
    ld   l, c
    rst  $18
    ld   l, c
    ld   hl, label_96A
    ld   l, h
    jr   c, label_7812B
    ld   l, d
    ld   e, [hl]
    ld   [hl], h
    ld   e, c
    or   a
    ld   h, [hl]
    add  a, b
    ld   l, h
    dec  b
    ld   a, d
    ld   e, d
    ld   a, d
    jr   z, label_78168
    ld   a, e
    ld   h, l
    jr   z, label_7816D
    ret
    ld   e, b
    sbc  a, h
    ld   h, a
    ld   c, c
    ld   l, h
    xor  h
    ld   d, d
    rst  $38
    ld   a, h
    ld   c, e
    ld   a, l
    inc  b
    ld   a, [hl]

label_780FF::
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

label_7810E::
    push bc
    ld   c, $30

label_78111::
    ld   a, [hli]
    ldh  [$FF0C], a
    inc  c
    ld   a, c
    cp   $40
    jr   nz, label_78111
    pop  bc
    ret

label_7811B::
    xor  a

label_7811C::
    ld   [$D379], a
    ld   [$D34F], a
    ld   [$D398], a
    ld   [$D393], a
    ld   [$D3C9], a

label_7812B::
    ld   [$D3A3], a
    ld   a, $08
    ld   [rNR42], a
    ld   a, $80
    ld   [rNR44], a
    ret

label_78137::
    ld   a, [$D379]
    cp   $05
    jp   z, label_78D1D
    cp   $0C
    jp   z, label_78D1D
    cp   $1A
    jp   z, label_78D1D
    cp   $24
    jp   z, label_78D1D
    cp   $2A
    jp   z, label_78D1D
    cp   $2E
    jp   z, label_78D1D
    cp   $3F
    jp   z, label_78D1D
    call label_7811B
    jp   label_78D1D

label_78163::
    ld   b, a
    ld   a, [$D3CE]
    and  a

label_78168::
    jp   nz, label_7802B
    ld   a, b
    cp   $FF
    jr   z, label_78137
    cp   $11
    jr   nc, label_78177
    jp   label_7802B

label_78177::
    cp   $21
    jr   nc, label_7817F
    add  a, $F0
    jr   label_78193

label_7817F::
    cp   $31
    jr   nc, label_78187
    add  a, $F0
    jr   label_78193

label_78187::
    cp   $41
    jp  c, label_7802B
    cp   $61
    jp   nc, label_7802B
    add  a, $E0

label_78193::
    dec  hl
    ldi  [hl], a
    ldd  [hl], a
    ld   a, [$D3CA]
    ld   [$D3CB], a
    ld   a, [hli]
    ld   [$D3CA], a
    ld   b, a
    ld   hl, label_7807F
    and  $7F
    call label_780FF
    call label_783C0
    jp   label_78359

label_781AF::
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

label_782A2::
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

label_7832F::
    ld   a, [$D3E7]
    and  a
    jp   z, label_7873F
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

label_78348::
    ld   a, [hli]
    ldh  [$FF0C], a
    inc  c
    ld   a, c
    cp   $40
    jr   nz, label_78348
    ld   a, $80
    ld   [rNR30], a
    pop  bc
    pop  hl
    jp   label_7873F

label_78359::
    ld   a, [$D369]
    ld   hl, label_781AF

label_7835F::
    dec  a
    jr   z, label_7836A
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    jr   label_7835F

label_7836A::
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

label_78387::
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
    jr   z, label_783AB
    inc  c
    cp   $01
    jr   z, label_783AB
    inc  c
    cp   $02
    jr   z, label_783AB
    inc  c

label_783AB::
    ld   a, [bc]
    ld   [rNR51], a
    ret

label_783AF::
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

label_783BA::
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, [hli]
    ld   [de], a
    ret

label_783C0::
    ld   a, [$D379]
    cp   $05
    jr   z, label_783E2
    cp   $0C
    jr   z, label_783E2
    cp   $1A
    jr   z, label_783E2
    cp   $24
    jr   z, label_783E2
    cp   $2A
    jr   z, label_783E2
    cp   $2E
    jr   z, label_783E2
    cp   $3F
    jr   z, label_783E2
    call label_7811B

label_783E2::
    call label_78D2A
    ld   de, $D300
    ld   b, $00
    ld   a, [hli]
    ld   [de], a
    inc  e
    call label_783BA
    ld   de, $D310
    call label_783BA
    ld   de, $D320
    call label_783BA
    ld   de, $D330
    call label_783BA
    ld   de, $D340
    call label_783BA
    ld   hl, $D310
    ld   de, $D314
    call label_783AF
    ld   hl, $D320
    ld   de, $D324
    call label_783AF
    ld   hl, $D330
    ld   de, $D334
    call label_783AF
    ld   hl, $D340
    ld   de, $D344
    call label_783AF
    ld   bc, label_410
    ld   hl, $D312

label_78432::
    ld   [hl], $01
    ld   a, c
    add  a, l
    ld   l, a
    dec  b
    jr   nz, label_78432
    xor  a
    ld   [$D31E], a
    ld   [$D32E], a
    ld   [$D33E], a

label_78444::
    ret

label_78445::
    push hl
    ld   a, [$D371]
    and  a
    jr   nz, label_78454
    xor  a
    ld   [rNR30], a
    ld   l, e
    ld   h, d
    call label_7810E

label_78454::
    pop  hl
    jr   label_78481

label_78457::
    call label_78487
    call label_7849C
    ld   e, a
    call label_78487
    call label_7849C
    ld   d, a
    call label_78487
    call label_7849C
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
    pop  hl
    cp   $03
    jr   z, label_78445

label_78481::
    call label_78487
    jp   label_785A5

label_78487::
    push de
    ld   a, [hli]
    ld   e, a
    db   $3A ; ldd  a, [hl]
    ld   d, a
    inc  de

label_7848D::
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldd  [hl], a
    pop  de
    ret

label_78493::
    push de
    ld   a, [hli]
    ld   e, a
    db   $3A ; ldd  a, [hl]
    ld   d, a
    inc  de
    inc  de
    jr   label_7848D

label_7849C::
    ld   a, [hli]
    ld   c, a
    db   $3A ; ldd  a, [hl]
    ld   b, a
    ld   a, [bc]
    ld   b, a

label_784A2::
    ret

label_784A3::
    pop  hl
    jr   label_784D7

label_784A6::
    ld   a, [$D350]
    cp   $03
    jr   nz, label_784BD
    ld   a, [$D338]
    bit  7, a
    jr   z, label_784BD
    ld   a, [hl]
    cp   $06
    jr   nz, label_784BD
    ld   a, $40
    ld   [rNR32], a

label_784BD::
    push hl
    ld   a, l
    add  a, $09
    ld   l, a
    ld   a, [hl]
    and  a
    jr   nz, label_784A3
    ld   a, l
    add  a, $04
    ld   l, a
    bit  7, [hl]
    jr   nz, label_784A3
    pop  hl
    call label_78772
    push hl
    call label_787F6
    pop  hl

label_784D7::
    dec  l
    dec  l
    jp   label_78752

label_784DC::
    dec  l
    dec  l
    dec  l
    dec  l
    call label_78493

label_784E3::
    ld   a, l
    add  a, $04
    ld   e, a
    ld   d, h
    call label_783AF
    cp   $00
    jr   z, label_7850E
    cp   $FF
    jr   z, label_784F7
    inc  l
    jp   label_785A3

label_784F7::
    dec  l
    push hl
    call label_78493
    call label_7849C
    ld   e, a
    call label_78487
    call label_7849C
    ld   d, a
    pop  hl
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldd  [hl], a
    jr   label_784E3

label_7850E::
    ld   a, [$D3CA]
    cp   $15
    jp   z, label_78854
    ld   hl, $D369
    ld   [hl], $00
    call label_78137
    ret

label_7851F::
    call label_78487
    call label_7849C
    ld   [$D301], a
    call label_78487
    call label_7849C
    ld   [$D302], a
    jr   label_7853C

label_78533::
    call label_78487
    call label_7849C
    ld   [$D300], a

label_7853C::
    call label_78487
    jr   label_785A5

label_78541::
    call label_78487
    call label_7849C
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
    jr   label_785A5

label_78565::
    push hl
    ld   a, l
    add  a, $0B
    ld   l, a
    ld   a, [hl]
    dec  [hl]
    ld   a, [hl]
    and  $7F
    jr   z, label_7857E
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
    jr   label_785A5

label_7857E::
    pop  hl
    jr   label_7853C

label_78581::
    ld   hl, $D369
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$D3CE]
    and  a
    jp   nz, label_7802B
    call label_78387
    ld   a, $01
    ld   [$D350], a
    ld   hl, $D310

label_78599::
    inc  l
    ld   a, [hli]
    and  a
    jp   z, label_784D7
    dec  [hl]
    jp   nz, label_784A6

label_785A3::
    inc  l
    inc  l

label_785A5::
    call label_7849C
    cp   $00
    jp   z, label_784DC
    cp   $9D
    jp   z, label_78457
    cp   $9E
    jp   z, label_7851F
    cp   $9F
    jp   z, label_78533
    cp   $9B
    jp   z, label_78541
    cp   $9C
    jp   z, label_78565
    cp   $99
    jp   z, label_7886E
    cp   $9A
    jp   z, label_78879
    cp   $94
    jp   z, label_788B8
    cp   $97
    jp   z, label_788ED
    cp   $98
    jp   z, label_788FC
    cp   $96
    jp   z, label_78860
    cp   $95
    jp   z, label_7886B
    and  $F0
    cp   $A0
    jr   nz, label_7863C
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
    jr   nz, label_7860E
    ld   a, d
    jr   label_78633

label_7860E::
    ld   e, a
    ld   a, d
    push af
    srl  a
    sla  e
    jr   c, label_7861F
    ld   d, a
    srl  a
    sla  e
    jr   c, label_7861F
    add  a, d

label_7861F::
    ld   c, a
    and  a
    jr   nz, label_78625
    ld   c, $02

label_78625::
    ld   de, $D350
    ld   a, [de]
    dec  a
    ld   e, a
    ld   d, $00
    ld   hl, $D307
    add  hl, de
    ld   [hl], c
    pop  af

label_78633::
    pop  hl
    dec  l
    ldi  [hl], a
    call label_78487
    call label_7849C

label_7863C::
    ld   a, [$D350]
    cp   $04
    jr   z, label_7867B
    push de
    ld   de, $D3B0
    call label_7893C
    xor  a
    ld   [de], a
    inc  e
    ld   [de], a
    ld   de, $D3B6
    call label_7893C
    inc  e
    xor  a
    ld   [de], a
    ld   a, [$D350]
    cp   $03
    jr   nz, label_7867A
    ld   de, $D39E
    ld   a, [de]
    and  a
    jr   z, label_7866C
    ld   a, $01
    ld   [de], a
    xor  a
    ld   [$D39F], a

label_7866C::
    ld   de, $D3D9
    ld   a, [de]
    and  a
    jr   z, label_7867A
    ld   a, $01
    ld   [de], a
    xor  a
    ld   [$D3DA], a

label_7867A::
    pop  de

label_7867B::
    ld   c, b
    ld   b, $00
    call label_78487
    ld   a, [$D350]
    cp   $04
    jp   z, label_786BD
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
    jr   z, label_786B8
    ld   [hl], $00
    ld   a, [$D300]
    and  a
    jr   z, label_786AB
    ld   l, a
    ld   h, $00
    bit  7, l
    jr   z, label_786A8
    ld   h, $FF

label_786A8::
    add  hl, bc
    ld   b, h
    ld   c, l

label_786AB::
    ld   hl, label_789BF
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, [hl]
    ld   [de], a
    pop  hl
    jp   label_786EE

label_786B8::
    ld   [hl], $01
    pop  hl
    jr   label_786EE

label_786BD::
    push hl
    ld   a, c
    cp   $FF
    jr   z, label_786DB
    ld   de, $D346
    ld   hl, label_78A51
    add  hl, bc

label_786CA::
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, e
    cp   $4B
    jr   nz, label_786CA
    ld   c, $20
    ld   hl, $D344
    ld   b, $00
    jr   label_7871C

label_786DB::
    ld   a, [$D34F]
    bit  7, a
    jp   nz, label_7874D
    ld   a, $01
    ld   [$D378], a
    call label_7803F
    jp   label_7874D

label_786EE::
    push hl
    ld   b, $00
    ld   a, [$D350]
    cp   $01
    jr   z, label_78719
    cp   $02
    jr   z, label_78715
    ld   c, $1A
    ld   a, [$D33F]
    bit  7, a
    jr   nz, label_7870A
    xor  a
    ldh  [$FF0C], a
    ld   a, $80
    ldh  [$FF0C], a

label_7870A::
    inc  c
    inc  l
    inc  l
    inc  l
    inc  l
    ld   a, [hli]
    ld   e, a
    ld   d, $00
    jr   label_78723

label_78715::
    ld   c, $16
    jr   label_7871C

label_78719::
    ld   c, $10
    inc  c

label_7871C::
    inc  l
    inc  l
    ld   a, [hli]
    ld   e, a
    inc  l
    ld   a, [hli]
    ld   d, a

label_78723::
    push hl
    inc  l
    inc  l
    ld   a, [hli]
    and  a
    jr   z, label_7872C
    ld   e, $08

label_7872C::
    inc  l
    inc  l
    ld   [hl], $00
    inc  l
    ld   a, [hl]
    pop  hl
    bit  7, a
    jr   nz, label_7874D
    ld   a, [$D350]
    cp   $03
    jp   z, label_7832F

label_7873F::
    ld   a, d
    or   b
    ldh  [$FF0C], a
    inc  c
    ld   a, e
    ldh  [$FF0C], a
    inc  c
    ld   a, [hli]
    ldh  [$FF0C], a
    inc  c
    ld   a, [hl]
    or   $80
    ldh  [$FF0C], a

label_7874D::
    pop  hl
    dec  l
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    dec  l

label_78752::
    ld   de, $D350
    ld   a, [de]
    cp   $04
    jr   z, label_78763
    inc  a
    ld   [de], a
    ld   a, $10
    add  a, l
    ld   l, a
    jp   label_78599

label_78763::
    ld   hl, $D31E
    inc  [hl]
    ld   hl, $D32E
    inc  [hl]
    ld   hl, $D33E
    inc  [hl]
    ret

label_78770::
    pop  hl
    ret

label_78772::
    push hl
    ld   a, l
    add  a, $06
    ld   l, a
    ld   a, [hl]
    and  $0F
    jr   z, label_78794
    ld   [$D351], a
    ld   a, [$D350]
    ld   c, $13
    cp   $01
    jr   z, label_787D6
    ld   c, $18
    cp   $02
    jr   z, label_787D6
    ld   c, $1D
    cp   $03
    jr   z, label_787D6

label_78794::
    ld   a, [$D350]
    cp   $04
    jp   z, label_78770
    ld   de, $D3B6
    call label_7893C
    ld   a, [de]
    and  a
    jp   z, label_787BD
    ld   a, [$D350]
    ld   c, $13
    cp   $01
    jp   z, label_78905
    ld   c, $18
    cp   $02
    jp   z, label_78905
    ld   c, $1D
    jp   label_78905

label_787BD::
    ld   a, [$D350]
    cp   $03
    jp   nz, label_78770
    ld   a, [$D39E]
    and  a
    jp   nz, label_78882
    ld   a, [$D3D9]
    and  a
    jp   nz, label_788C3
    jp   label_78770

label_787D6::
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
    jp   z, label_78952
    ld   hl, rIE
    pop  de
    add  hl, de
    call label_7892B
    jp   label_78794

label_787F6::
    ld   a, [$D31B]
    and  a
    jr   nz, label_7881D
    ld   a, [$D317]
    and  a
    jr   z, label_7881D
    and  $0F
    ld   b, a
    ld   hl, $D307
    ld   a, [$D31E]
    cp   [hl]
    jr   nz, label_7881D
    ld   c, $12
    ld   de, $D31A
    ld   a, [$D31F]
    bit  7, a
    jr   nz, label_7881D
    call label_78841

label_7881D::
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
    call label_78841
    ret

label_78841::
    push bc
    dec  b
    ld   c, b
    ld   b, $00
    ld   hl, label_78B15
    add  hl, bc
    ld   a, [hl]
    pop  bc
    ldh  [$FF0C], a
    inc  c
    inc  c
    ld   a, [de]
    or   $80
    ldh  [$FF0C], a
    ret

label_78854::
    xor  a
    ld   [$D3CE], a
    ld   a, [$FFBF]
    ld   [$D368], a
    jp   label_7801E

label_78860::
    ld   a, $01

label_78862::
    ld   [$D3CD], a
    call label_78487
    jp   label_785A5

label_7886B::
    xor  a
    jr   label_78862

label_7886E::
    ld   a, $01

label_78870::
    ld   [$D39E], a
    call label_78487
    jp   label_785A5

label_78879::
    xor  a
    ld   [$D3D9], a
    ld   [$D3DA], a
    jr   label_78870

label_78882::
    cp   $02
    jp   z, label_78770
    ld   bc, $D39F
    call label_788B4
    ld   c, $1C
    ld   b, $40
    cp   $03
    jr   z, label_788AF
    ld   b, $60
    cp   $05
    jr   z, label_788AF
    cp   $0A
    jr   z, label_788AF
    ld   b, $00
    cp   $07

label_788A3::
    jr   z, label_788AF
    cp   $0D
    jp   nz, label_78770
    ld   a, $02
    ld   [$D39E], a

label_788AF::
    ld   a, b
    ldh  [$FF0C], a
    jp   label_78770

label_788B4::
    ld   a, [bc]
    inc  a
    ld   [bc], a
    ret

label_788B8::
    ld   a, $01
    ld   [$D3D9], a
    call label_78487
    jp   label_785A5

label_788C3::
    cp   $02
    jp   z, label_78770
    ld   bc, $D3DA
    call label_788B4
    ld   c, $1C
    ld   b, $60
    cp   $03
    jp   z, label_788AF
    ld   b, $40
    cp   $05
    jp   z, label_788AF
    ld   b, $20
    cp   $06
    jp   nz, label_78770
    ld   a, $02
    ld   [$D3D9], a
    jp   label_788AF

label_788ED::
    ld   de, $D3B6
    call label_7893C
    ld   a, $01

label_788F5::
    ld   [de], a
    call label_78487
    jp   label_785A5

label_788FC::
    ld   de, $D3B6
    call label_7893C
    xor  a
    jr   label_788F5

label_78905::
    inc  e
    ld   a, [de]
    and  a
    jr   nz, label_7891B
    inc  a
    ld   [de], a
    pop  hl
    push hl
    call label_78920

label_78911::
    ld   hl, $FF9C
    add  hl, de
    call label_7892B
    jp   label_78770

label_7891B::
    call label_78945
    jr   label_78911

label_78920::
    ld   a, $07
    add  a, l
    ld   l, a
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    and  $0F
    ld   d, a
    ret

label_7892B::
    ld   de, $D3A4
    call label_7893C
    ld   a, l
    ldh  [$FF0C], a
    ld   [de], a
    inc  c
    inc  e
    ld   a, h
    and  $0F
    ldh  [$FF0C], a
    ld   [de], a
    ret

label_7893C::
    ld   a, [$D350]
    dec  a
    sla  a
    add  a, e
    ld   e, a
    ret

label_78945::
    ld   de, $D3A4
    call label_7893C
    ld   a, [de]
    ld   l, a
    inc  e
    ld   a, [de]
    ld   d, a
    ld   e, l
    ret

label_78952::
    pop  de
    ld   de, $D3B0
    call label_7893C
    ld   a, [de]
    inc  a
    ld   [de], a
    inc  e
    cp   $19
    jr   z, label_78992
    cp   $2D
    jr   z, label_7898B
    ld   a, [de]
    and  a
    jp   z, label_78794

label_7896A::
    dec  e
    ld   a, [de]
    sub  a, $19
    sla  a
    ld   l, a
    ld   h, $00
    ld   de, label_78997
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   a, [hl]
    ld   e, a
    pop  hl
    push hl
    push de
    call label_78920
    ld   h, d
    ld   l, e
    pop  de
    add  hl, de
    call label_7892B
    jp   label_78794

label_7898B::
    dec  e
    ld   a, $19
    ld   [de], a
    inc  e
    jr   label_7896A

label_78992::
    ld   a, $01
    ld   [de], a
    jr   label_7896A

label_78997::
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

label_789BF::
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

label_789FA::
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

label_78A32::
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

label_78A48::
    rlca
    reti
    rlca
    db   $DB
    rlca
    db   $07
    rlca
    rst  $18
    rlca

label_78A51::
    nop
    nop
    nop
    nop
    nop
    ret  nz
    add  hl, bc
    nop
    jr   c, label_78A8F
    ret  nz
    add  hl, de
    nop
    jr   c, label_78A93
    ret  nz
    ld   b, [hl]
    nop
    inc  de
    db   $10 ; Undefined instruction
    inc  hl
    nop
    jr   nz, label_78AAA
    add  a, b
    ld   d, c
    nop
    jr   nz, label_78A76
    add  a, b
    and  c
    nop
    nop
    jr   label_789F5
    db   $F2 ; Undefined instruction

label_78A76::
    nop
    nop
    jr   label_789FA
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
    stop
    nop
    db   $10 ; Undefined instruction
    ld   bc, label_402
    ld   [label_2010], sp
    ld   b, $0C
    jr   label_78A99
    ld   bc, $0101
    ld   bc, $0130
    inc  bc
    ld   b, $0C
    jr   label_78AD3

label_78AA3::
    add  hl, bc
    ld   [de], a
    inc  h
    ld   [bc], a
    inc  b
    ld   [$0101], sp
    ld   c, b
    ld   [bc], a
    inc  b
    ld   [label_2010], sp
    ld   b, b
    inc  c
    jr   label_78AE5
    ld   [bc], a
    dec  b
    inc  bc
    ld   bc, label_7A001
    inc  bc
    dec  b
    ld   a, [bc]
    inc  d
    jr   z, label_78B11
    rrca
    ld   e, $3C
    ld   [bc], a
    ld   [label_210], sp
    ld   bc, label_378
    ld   b, $0C
    jr   label_78AFF
    ld   h, b
    ld   [de], a
    inc  h
    ld   c, b

label_78AD3::
    inc  bc
    ld   [label_210], sp
    inc  b
    sub  a, b
    inc  bc
    rlca
    ld   c, $1C
    jr   c, label_78B4F
    dec  d
    ld   a, [hli]
    ld   d, h
    inc  b
    add  hl, bc
    ld   [de], a

label_78AE5::
    ld   [bc], a
    ld   bc, label_4A8
    ld   [label_2010], sp
    ld   b, b
    add  a, b
    jr   label_78B20
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
    jr   label_78B1C
    ld   b, $D8
    dec  b
    ld   a, [bc]
    inc  d
    jr   z, label_78B5B
    and  b
    ld   e, $3C
    ld   a, b
    dec  b
    ld   bc, $0101
    ld   bc, label_10F0
    ldd  [hl], a
    ldi  [hl], a
    ld   b, a
    ld   h, b
    jr   nz, label_78B1C

label_78B1C::
    ldi  [hl], a
    ld   c, e
    rst  $38
    rst  $38

label_78B20::
    inc  e
    ld   c, e
    sbc  a, e
    jr   nz, label_78AD3
    ld   bc, $009C
    nop
    jp   z, label_7804A
    ld   c, e
    ld   c, b
    ld   c, e
    ld   d, b
    ld   c, e
    ld   e, b
    ld   c, e
    nop
    jp   z, label_3E4A
    ld   c, e
    ld   b, [hl]
    ld   c, e
    ld   c, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   e, [hl]
    ld   c, e
    ld   h, l
    ld   c, e
    rst  $38
    rst  $38
    ld   b, b
    ld   c, e
    add  a, a
    ld   c, e
    sub  a, a
    ld   c, e
    rst  $38
    rst  $38
    ld   c, b
    ld   c, e
    add  hl, de

label_78B4F::
    ld   c, h
    ld   e, $4C
    rst  $38
    rst  $38
    ld   d, b
    ld   c, e
    ld   a, [hli]
    ld   c, h
    cpl
    ld   c, h
    rst  $38

label_78B5B::
    rst  $38
    ld   e, b
    ld   c, e
    and  l
    ld   bc, label_1A8
    xor  d
    ld   bc, $9D00
    stop
    add  a, b
    sbc  a, e
    inc  b
    and  c
    ld   a, h
    halt
    ld   h, h
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, [hl]
    ld   a, b
    ld   [hl], b
    ld   h, [hl]
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, h
    halt
    ld   h, h
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, b
    ld   [hl], d
    ld   l, d
    ld   h, b
    sbc  a, h
    nop
    sbc  a, l
    ld   h, b
    add  a, c
    ld   b, c
    xor  d
    ld   bc, label_7A056
    ld   l, d
    ld   h, b
    ld   h, [hl]
    and  l
    ld   h, h
    and  e
    ld   bc, $9D00
    inc  [hl]
    nop
    nop
    sbc  a, e
    inc  bc
    and  c
    ld   a, h
    halt
    ld   h, h
    sbc  a, h
    sbc  a, l
    ld   b, e
    nop
    nop
    ld   a, h
    halt
    ld   h, h
    sbc  a, l
    ld   h, d
    nop
    nop
    ld   a, [hl]
    ld   a, b
    ld   [hl], b
    ld   h, [hl]
    sbc  a, l
    ld   b, e
    nop
    nop
    ld   a, [hl]
    ld   a, b
    ld   [hl], b
    ld   h, [hl]
    sbc  a, l

label_78BBC::
    inc  [hl]
    nop
    nop
    sbc  a, e
    ld   [bc], a
    ld   a, [hl]
    ld   a, b
    ld   [hl], b
    ld   h, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a

label_78BC8::
    ld   a, h
    halt
    ld   h, h
    sbc  a, h
    sbc  a, l
    ld   b, e
    nop
    nop
    ld   a, h
    halt

label_78BD4::
    ld   h, h
    sbc  a, l
    ld   h, d
    nop
    nop
    ld   a, h
    halt
    ld   h, h
    sbc  a, l
    add  a, d
    nop
    nop
    ld   a, b
    ld   [hl], d
    ld   l, d
    ld   h, b
    sbc  a, l
    ld   h, d
    nop
    nop
    ld   a, b
    ld   [hl], d
    ld   l, d
    ld   h, b
    sbc  a, l
    ld   b, e
    nop
    nop
    sbc  a, e
    ld   [bc], a
    ld   a, b
    ld   [hl], d
    ld   l, d
    ld   h, b
    sbc  a, h
    nop
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    nop
    nop
    nop
    nop

label_78C01::
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    nop
    nop
    nop
    nop
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
    and  l
    ld   bc, label_1A8
    nop
    sbc  a, l
    ld   sp, hl
    ld   c, e
    jr   nz, label_78BBC
    sbc  a, e
    jr   nz, label_78BC8
    inc  b
    inc  e
    sbc  a, h
    nop
    and  l
    ld   bc, label_1A8
    nop
    sbc  a, e
    jr   nz, label_78BD4
    ld   a, [de]
    and  c
    ld   a, [de]
    ld   a, [de]
    sbc  a, h
    nop
    ld   [bc], a
    cp   e
    ld   c, d
    ld   b, e
    ld   c, h
    ld   d, c
    ld   c, h
    ld   h, l
    ld   c, h
    ld   l, e
    ld   c, h
    ld   [hl], c
    ld   c, h
    add  a, a
    ld   c, h
    sbc  a, c

label_78C48::
    ld   c, h
    xor  e
    ld   c, h
    sbc  a, c
    ld   c, h
    rst  $38
    rst  $38
    ld   b, l
    ld   c, h
    ld   a, b
    ld   c, h
    add  a, a
    ld   c, h
    ld   a, l
    ld   c, h
    sbc  a, c
    ld   c, h
    add  a, d
    ld   c, h

label_78C5B::
    xor  e
    ld   c, h
    ld   a, l
    ld   c, h
    sbc  a, c
    ld   c, h
    rst  $38
    rst  $38
    ld   d, c
    ld   c, h
    cp   l
    ld   c, h
    rst  $38
    rst  $38
    ld   h, l
    ld   c, h
    ld   a, [$FF4C]
    rst  $38
    rst  $38
    ld   l, e
    ld   c, h
    sbc  a, l
    ld   b, e
    nop
    inc  bc
    and  b
    ld   bc, $9D00
    ld   b, e
    nop
    nop
    nop
    sbc  a, l
    ld   [hl], c
    nop
    nop
    nop
    sbc  a, l
    sub  a, c
    nop
    nop
    nop
    sbc  a, e
    ld   [bc], a
    and  c
    ld   c, b
    ld   c, h
    ld   c, [hl]
    and  [hl]
    ld   e, h
    and  c
    ld   c, b
    ld   c, h
    ld   c, [hl]
    and  [hl]
    ld   e, d
    and  e
    ld   bc, $009C
    sbc  a, e
    ld   [bc], a
    and  c
    ld   c, h
    ld   d, b
    ld   d, d
    and  [hl]
    ld   h, b

label_78CA1::
    and  c
    ld   c, h
    ld   d, b
    ld   d, d
    and  [hl]
    ld   e, [hl]
    and  e
    ld   bc, $009C
    sbc  a, e
    ld   [bc], a
    and  c
    ld   d, b
    ld   d, h
    ld   d, [hl]
    and  [hl]
    ld   h, h
    and  c
    ld   d, b
    ld   d, h
    ld   d, [hl]
    and  [hl]
    ld   h, d
    and  e
    ld   bc, $009C
    sbc  a, l
    add  hl, bc
    ld   c, h
    jr   nz, label_78C5B
    sbc  a, e
    ld   [bc], a
    and  d
    jr   nc, label_78CDF
    jr   label_78CF9
    jr   label_78CE3
    jr   nc, label_78CE5
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    inc  [hl]
    inc  e
    inc  e
    inc  [hl]
    inc  e
    inc  e
    inc  [hl]
    inc  e
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    jr   c, label_78CFD
    jr   nz, label_78D17

label_78CDF::
    jr   nz, label_78D01
    jr   c, label_78D03

label_78CE3::
    sbc  a, h
    sbc  a, e

label_78CE5::
    ld   [bc], a
    inc  [hl]
    inc  e
    inc  e
    inc  [hl]
    inc  e
    inc  e
    inc  [hl]
    inc  e
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    and  c
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    and  [hl]
    ld   a, [de]
    sbc  a, h

label_78CF9::
    and  c
    ld   a, [de]
    dec  d
    dec  d

label_78CFD::
    dec  d
    nop

label_78CFF::
    xor  a
    ld   [$D379], a

label_78D03::
    ld   [$D34F], a
    ld   [$D398], a
    ld   [$D393], a
    ld   [$D3C9], a
    ld   [$D3A3], a
    ld   [$D3E5], a
    ld   a, $08

label_78D17::
    ld   [rNR42], a
    ld   a, $80
    ld   [rNR44], a

label_78D1D::
    ld   a, $FF
    ld   [rNR51], a
    ld   a, $03
    ld   [$D355], a
    xor  a
    ld   [$D369], a

label_78D2A::
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

label_78E48::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_78EA1::
    nop

label_78EA2::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_78EAA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    dec  bc
    ld   d, b
    cpl
    ld   d, b
    ld   d, e
    ld   d, b
    nop
    nop
    inc  de
    ld   l, [hl]
    ld   l, a
    ld   d, b
    xor  h
    ld   l, [hl]
    and  c
    ld   d, b
    xor  b
    ld   l, [hl]
    ldi  [hl], a
    ld   l, [hl]
    xor  b
    ld   d, b
    add  hl, bc
    ld   l, [hl]
    ld   a, [hli]
    ld   l, l
    ld   b, a
    ld   d, c
    ld   b, a
    ld   d, c
    dec  d
    ld   l, l
    or   b
    ld   l, [hl]
    db   $10 ; Undefined instruction
    add  hl, bc
    ld   l, [hl]
    ld   d, c
    ld   d, c
    db   $E3 ; Undefined instruction
    ld   d, c
    nop
    nop
    or   a
    ld   d, b
    xor  h
    ld   l, [hl]
    rst  $38
    ld   l, l
    db   $ED ; Undefined instruction
    ld   d, b
    xor  b

label_79038::
    ld   l, [hl]
    db   $F2 ; Undefined instruction
    ld   d, b
    call label_7876D
    ld   d, c
    add  hl, bc
    ld   l, [hl]
    ld   b, a
    ld   d, c
    dec  d
    ld   l, l
    or   b

label_79046::
    ld   l, [hl]
    cp   [hl]
    ld   l, l
    ld   d, c
    ld   d, c
    dec  l
    ld   l, l
    jr   label_790BD
    db   $E3 ; Undefined instruction
    ld   d, c
    nop
    nop
    ld   h, e
    ld   l, [hl]
    nop
    ld   d, c
    xor  h
    ld   l, [hl]
    ld   sp, $A851
    ld   l, [hl]
    ld   d, h
    ld   l, [hl]
    jr   c, label_790B2
    ld   [hl], d
    ld   l, [hl]
    daa
    ld   l, l
    ld   b, a
    ld   d, c
    ld   [hl], a
    ld   l, [hl]
    ld   b, a
    ld   d, c
    rst  $38
    rst  $38
    jr   nc, label_790DC
    sbc  a, e
    ld   [bc], a
    and  d
    ld   [de], a
    ld   a, [hli]
    ld   [de], a
    jr   label_790A7
    sbc  a, h
    ld   d, $2E
    ld   d, $1C
    inc  [hl]
    ld   d, $2E
    inc  d
    inc  l
    sbc  a, e
    ld   [bc], a
    and  d
    ld   [de], a
    ld   a, [hli]
    ld   [de], a
    jr   label_790B9

label_79089::
    sbc  a, h
    ld   a, [de]
    ldd  [hl], a
    ld   a, [de]
    jr   nz, label_790C7
    ld   a, [de]
    ldd  [hl], a
    jr   label_790C3
    sbc  a, e
    ld   [bc], a
    ld   d, $2E
    ld   d, $1C
    inc  [hl]
    sbc  a, h
    ldi  [hl], a
    db   $3A ; ldd  a, [hl]
    ldi  [hl], a
    jr   z, label_790E0
    nop
    and  d

label_790A2::
    ld   d, $2E
    ld   d, $1C
    inc  [hl]

label_790A7::
    nop
    and  d
    ldi  [hl], a
    db   $3A ; ldd  a, [hl]
    ldi  [hl], a
    jr   z, label_790EE
    and  d
    ld   l, $46
    ld   l, $34
    ld   c, h
    and  l
    ld   bc, $9D00
    sub  a, a

label_790B9::
    add  a, [hl]
    add  a, b
    and  a
    ld   b, d

label_790BD::
    and  h
    inc  [hl]
    and  [hl]
    ld   bc, label_38A1

label_790C3::
    db   $3A ; ldd  a, [hl]
    ld   a, $A3
    ld   b, b

label_790C7::
    and  h
    ld   e, b
    and  a
    ld   bc, $A442
    inc  [hl]
    and  [hl]
    ld   bc, label_38A1
    db   $3A ; ldd  a, [hl]
    ld   c, h
    and  e
    ld   c, d
    and  h
    ld   c, b
    and  a
    ld   bc, $B79D

label_790DC::
    add  a, [hl]
    add  a, b
    and  a
    ld   b, [hl]

label_790E0::
    and  h
    jr   c, label_79089
    ld   bc, label_3EA1
    ld   b, b
    ld   b, d
    and  e
    ld   b, h
    and  a
    ld   e, h
    nop
    and  e

label_790EE::
    ldd  [hl], a
    and  a
    ld   c, d
    nop
    sbc  a, l
    adc  a, c
    add  a, [hl]
    add  a, c
    and  e
    ld   c, b
    and  a
    ld   h, b
    xor  b
    add  a, b
    ld   bc, label_1A2
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    inc  b
    inc  e
    inc  b
    ld   a, [bc]
    ldi  [hl], a
    sbc  a, h
    ld   [label_820], sp
    ld   c, $26
    ld   [label_620], sp
    ld   e, $9B
    ld   [bc], a
    inc  b
    inc  e
    inc  b
    ld   a, [bc]
    ldi  [hl], a
    sbc  a, h
    inc  c
    inc  h
    inc  c
    ld   [de], a
    ld   a, [hli]
    inc  c
    inc  h
    ld   a, [bc]
    ldi  [hl], a
    sbc  a, e
    ld   [bc], a
    ld   [label_820], sp
    ld   c, $26
    sbc  a, h
    inc  d
    inc  l
    inc  d
    ld   a, [de]
    ldd  [hl], a
    nop
    and  d
    ld   [label_820], sp
    ld   c, $26
    nop
    and  d
    inc  d
    inc  l
    inc  d
    ld   a, [de]
    ldd  [hl], a
    and  d
    jr   nz, label_79179
    jr   nz, label_79169
    ld   a, $A5
    ld   bc, $A100
    ld   c, b
    ld   d, b
    ld   d, h
    ld   e, h
    ld   h, b
    ld   l, b
    ld   l, h
    ld   [hl], h
    nop
    and  e
    inc  a
    ld   l, $01
    and  c
    ld   l, $32
    ld   [hl], $38
    and  e
    ld   bc, label_2A38
    and  c
    ld   a, [hli]
    ld   l, $32
    ld   [hl], $A2
    ld   bc, label_79E6C
    inc  h
    ld   d, $5E
    and  c
    ld   e, [hl]
    ld   h, d
    ld   h, [hl]
    and  [hl]
    ld   l, b
    and  d
    ld   l, b
    ld   e, d
    jr   nz, label_79187
    ld   e, d
    and  c
    ld   e, d
    ld   e, [hl]

label_79179::
    ld   h, d
    ld   h, [hl]
    and  d
    ld   bc, label_7B684
    inc  a
    ld   l, $76
    and  c
    halt
    ld   a, [hl]
    and  [hl]

label_79187::
    add  a, b
    and  d
    add  a, b
    ld   [hl], d
    jr   c, label_791B7
    ld   [hl], d
    and  c
    ld   [hl], d
    halt
    ld   a, [hl]
    and  d
    jr   c, label_791FC
    ld   e, b
    jr   c, label_791B9
    ld   e, b
    and  c
    ld   e, b
    ld   e, h
    ld   e, [hl]
    ld   h, d
    and  d
    ld   [hl], $62
    ld   d, h
    ld   l, h
    and  c
    ld   [hl], $3C
    ld   b, h
    ld   c, d
    ld   c, [hl]
    ld   d, h
    ld   e, h
    ld   h, d
    and  d
    ldd  [hl], a
    ld   e, [hl]
    ld   d, b
    ldd  [hl], a
    ld   c, d
    ld   d, b
    and  c
    ld   d, b
    ld   d, h

label_791B7::
    ld   e, b
    ld   e, h

label_791B9::
    and  d
    ld   l, $5C
    ld   c, [hl]
    ld   h, [hl]
    and  c
    ld   l, $36
    inc  a
    ld   b, h
    ld   b, [hl]
    ld   c, [hl]
    ld   d, h
    ld   e, h
    and  d
    ld   a, [hli]
    ld   e, b
    and  c
    ld   c, d
    ld   d, b
    ld   e, b
    ld   h, d
    and  d
    ld   h, $54
    and  c
    ld   b, [hl]
    and  b
    ld   bc, label_78CA1
    and  b
    ld   bc, label_794A1
    and  b
    ld   bc, label_79EA1
    and  h
    ld   bc, $9E00
    reti
    ld   c, d
    and  c
    ldd  [hl], a
    inc  a
    ld   b, [hl]
    sbc  a, e
    ld   [bc], a
    inc  c
    ld   bc, $9C01
    inc  a
    ld   b, b
    ld   b, h
    ld   b, [hl]
    ld   c, d
    ld   bc, label_3C0C
    ld   b, [hl]
    ld   d, b
    inc  c
    ld   bc, label_C01
    ld   bc, label_79046
    ld   e, d
    ld   bc, label_C0C
    ld   bc, $010C
    nop
    nop
    reti
    ld   c, d
    inc  d
    ld   d, d
    ld   e, $52
    ld   h, $52
    ld   l, $52
    dec  d
    ld   l, l
    pop  hl
    ld   l, l
    ld   d, e
    ld   d, d
    rst  $38
    rst  $38
    ld   d, $52
    ld   sp, label_346E
    ld   d, d
    rst  $38
    rst  $38
    ld   e, $52
    ld   h, e
    ld   l, [hl]
    ld   [hl], h
    ld   d, d
    rst  $38
    rst  $38
    ld   h, $52
    sub  a, e
    ld   d, d
    rst  $38
    rst  $38
    ld   l, $52
    and  d
    ld   b, [hl]
    ld   bc, label_3CA7
    and  c
    ld   b, [hl]
    ld   bc, label_78A46
    ld   c, [hl]
    ld   d, b
    and  h
    ld   d, h
    ld   bc, label_79EA2
    ld   bc, label_794A7
    and  c
    ld   e, [hl]

label_7924A::
    ld   bc, label_7A25E
    ld   h, [hl]
    ld   l, b
    and  h
    ld   l, h
    ld   bc, $A200
    ld   a, [hli]
    ld   bc, label_20A7
    and  c
    ld   a, [hli]
    ld   bc, label_2E2A
    ldd  [hl], a
    jr   c, label_7929E
    and  [hl]
    ld   bc, label_1A5
    and  d
    ld   b, d
    ld   bc, label_38A3
    and  c
    ld   b, d
    jr   c, label_7929F
    ld   a, [hli]
    ld   l, $A6
    ld   bc, label_1A8
    nop
    sbc  a, e
    ld   [bc], a
    sbc  a, c
    and  d
    ld   d, $16
    ld   bc, $9C16
    sbc  a, e
    ld   [bc], a
    ld   [de], a
    ld   [de], a
    ld   bc, $9C12
    sbc  a, e
    ld   [bc], a
    ld   c, $0E
    ld   bc, $9C0E
    sbc  a, e
    ld   [bc], a
    ld   [de], a
    ld   [de], a
    ld   bc, $9C12
    nop
    sbc  a, e
    rlca
    and  d
    ld   a, [de]
    and  c
    ld   a, [de]
    ld   a, [de]
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, [de]

label_7929E::
    sbc  a, h

label_7929F::
    sbc  a, e
    ld   b, $A2
    ld   a, [de]

label_792A3::
    and  c
    ld   a, [de]
    ld   a, [de]
    sbc  a, h
    sbc  a, e
    ld   [$9C1A], sp
    nop
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    inc  e
    ld   c, e
    or   a
    ld   d, d
    inc  e
    ld   c, e
    nop
    nop
    inc  l
    ld   l, [hl]
    jp  c, label_FF53
    rst  $38
    or   a
    ld   d, d
    nop
    xor  h
    ld   c, d
    ld   a, [$FF52]
    jp   z, label_9A52
    ld   d, e
    cp   [hl]
    ld   d, e
    pop  hl
    ld   l, l
    adc  a, $53
    and  b
    ld   l, [hl]
    dec  d
    ld   l, l
    xor  h
    ld   l, [hl]
    daa
    ld   l, l
    db   $EB ; Undefined instruction
    ld   l, l
    sbc  a, b
    ld   d, h
    rst  $10
    ld   d, h
    rst  $10
    ld   d, h
    rst  $10
    ld   d, h
    sbc  a, $54
    sbc  a, b
    ld   d, h
    rst  $10
    ld   d, h
    rst  $10
    ld   d, h
    rst  $10
    ld   d, h
    sbc  a, $54
    rst  $38
    rst  $38
    dec  sp
    ld   d, l
    ld   a, h
    ld   l, [hl]
    jp   nc, label_116D
    ld   d, h
    and  b
    ld   l, [hl]
    dec  d
    ld   l, l
    xor  h
    ld   l, [hl]
    daa
    ld   l, l
    ld   b, b
    ld   l, [hl]
    ld   a, [hli]
    ld   d, h
    dec  sp
    ld   d, h
    ld   a, [hli]
    ld   l, l
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   d, b
    ld   d, h
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   h, c
    ld   d, h
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   a, [hli]
    ld   d, h
    dec  sp
    ld   d, h
    ld   a, [hli]
    ld   l, l
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   d, b
    ld   d, h
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   h, c
    ld   d, h
    dec  sp
    ld   d, h
    sub  a, c
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   [hl], d
    ld   d, h
    dec  sp
    ld   d, h
    ld   a, [hli]
    ld   l, l
    dec  sp
    ld   d, h
    ld   a, [$FF6D]
    ld   a, h
    ld   l, [hl]
    xor  e
    ld   d, h
    sub  a, h
    ld   l, [hl]
    xor  e
    ld   d, h
    adc  a, [hl]
    ld   l, [hl]
    cp   d
    ld   d, h
    ld   a, h
    ld   l, [hl]
    ld   a, [$FF6D]
    jp   nz, label_78054
    ld   l, [hl]
    ld   a, [hli]
    ld   d, h
    dec  sp
    ld   d, h
    ld   a, [hli]
    ld   l, l
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   d, b
    ld   d, h
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   h, c
    ld   d, h
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   a, [hli]
    ld   d, h
    dec  sp
    ld   d, h
    ld   a, [hli]
    ld   l, l
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   d, b
    ld   d, h
    dec  sp
    ld   d, h
    ld   b, b
    ld   l, [hl]
    ld   h, c
    ld   d, h
    dec  sp
    ld   d, h
    sub  a, c
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   [hl], d
    ld   d, h
    dec  sp
    ld   d, h
    ld   a, [hli]
    ld   l, l
    dec  sp
    ld   d, h
    ld   a, [$FF6D]
    ld   a, h
    ld   l, [hl]
    xor  e
    ld   d, h
    sub  a, h
    ld   l, [hl]
    xor  e
    ld   d, h
    adc  a, [hl]
    ld   l, [hl]
    cp   d
    ld   d, h
    ld   a, h
    ld   l, [hl]
    pop  hl
    ld   l, l
    jp   nz, label_FF54
    rst  $38
    ld   sp, label_79455
    ld   l, [hl]
    dec  e
    ld   d, h
    and  b
    ld   l, [hl]
    dec  d
    ld   l, l
    xor  h
    ld   l, [hl]
    daa
    ld   l, l
    ld   e, c
    ld   l, [hl]
    add  a, d
    ld   d, h
    di
    ld   d, h
    ld   d, h
    ld   l, [hl]
    ld   [label_79955], sp
    ld   l, [hl]
    add  a, d
    ld   d, h
    di
    ld   d, h
    ld   d, h
    ld   l, [hl]
    ld   [rHDMA5], sp
    rst  $38
    ld   b, l
    ld   d, l
    jr   label_79415
    and  b
    ld   l, [hl]
    dec  l
    ld   h, b
    xor  h
    ld   l, [hl]
    dec  e
    ld   d, l
    jr   nz, label_7941F
    rst  $38
    rst  $38
    ret  z
    ld   d, e
    and  d
    ld   c, [hl]
    ld   c, h
    ld   c, d
    ld   c, b
    ld   c, [hl]
    ld   d, b
    ld   d, d
    ld   d, h
    and  e
    ld   bc, $9B00
    ld   b, $A0
    ld   c, b
    ld   b, [hl]
    sbc  a, h
    sbc  a, e
    ld   a, [bc]
    ld   b, [hl]
    ld   b, h
    sbc  a, h
    sbc  a, l
    ld   l, b
    nop
    add  a, c
    sbc  a, e
    ld   b, $44
    ld   b, d
    sbc  a, h
    sbc  a, e
    ld   a, [bc]
    ld   b, d
    ld   b, b
    sbc  a, h
    sbc  a, l
    xor  b
    nop
    add  a, c
    sbc  a, e
    ld   b, $A0
    ld   c, h
    ld   c, d
    sbc  a, h
    sbc  a, e
    ld   a, [bc]
    ld   c, d
    ld   c, b
    sbc  a, h
    sbc  a, l
    ld   a, b
    nop
    add  a, c
    sbc  a, e
    ld   b, $48
    ld   b, [hl]
    sbc  a, h
    sbc  a, e
    ld   a, [bc]
    ld   b, [hl]
    ld   b, h
    sbc  a, h
    nop
    and  d
    ld   d, h
    ld   d, d
    ld   d, b

label_79415::
    ld   c, [hl]
    ld   d, h
    ld   d, [hl]
    ld   e, b
    ld   e, d
    and  e
    ld   bc, $9900
    and  d

label_7941F::
    ld   e, d
    ld   e, b
    ld   d, [hl]
    ld   d, h
    ld   e, d
    ld   e, h
    ld   e, [hl]
    ld   h, b
    and  e
    ld   bc, $A100
    ld   b, b
    ld   b, h
    ld   bc, label_786A5
    and  a
    ld   bc, label_780A1
    ld   b, h
    ld   bc, $A246
    ld   bc, $004C
    sbc  a, l
    sub  a, d
    nop
    ret  nz
    and  c
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   bc, label_1C1A
    ld   bc, $0110
    ld   [de], a
    ld   bc, label_412
    ld   bc, $A100
    ld   bc, label_79EA2
    and  c

label_79455::
    ld   bc, label_15E
    xor  c
    ld   e, [hl]
    and  b
    ld   bc, label_79EA4
    and  d
    ld   bc, $A100
    ld   bc, label_7A4A2
    and  c
    ld   bc, label_164
    xor  c
    ld   h, h
    and  b
    ld   bc, label_7A4A4
    and  d
    ld   bc, $A100
    ld   b, b
    ld   b, h
    ld   bc, label_786A5
    and  h
    ld   bc, label_1A1
    ld   b, b
    ld   b, h
    ld   b, [hl]
    ld   d, b
    ld   c, [hl]
    nop
    sbc  a, e
    inc  d
    sbc  a, c
    and  c
    ldd  [hl], a
    ldd  [hl], a
    ld   bc, label_78A32
    ld   bc, label_3E3C
    ld   bc, $0132
    inc  [hl]
    ld   bc, label_2634
    ld   bc, $009C
    and  c
    inc  b
    sbc  a, e
    ld   a, a
    ld   [bc], a
    sbc  a, h
    and  c
    inc  b
    sbc  a, e

label_794A1::
    ld   a, a
    ld   [bc], a
    sbc  a, h
    and  c

label_794A5::
    inc  b
    sbc  a, e

label_794A7::
    ccf
    ld   [bc], a
    sbc  a, h
    nop
    and  c
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, b
    and  e
    ld   bc, label_78EA1
    ld   bc, label_78C01
    and  e
    ld   bc, $A100
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, b
    xor  b
    ld   bc, $A100
    ld   b, [hl]
    ld   b, [hl]
    ld   bc, $0146
    ld   b, [hl]
    ld   bc, label_150
    ld   d, b
    and  d
    ld   d, b
    sub  a, a
    and  c
    ld   bc, label_2C36
    inc  h
    sbc  a, b
    nop
    and  c
    db   $10 ; Undefined instruction
    rrca
    ld   c, $9C
    nop
    and  c
    inc  a
    inc  a
    ld   bc, $013C
    inc  a
    ld   bc, $013C
    ld   b, [hl]
    and  d
    ld   b, [hl]
    sub  a, a
    and  c
    ld   bc, label_242C
    ld   e, $98
    nop
    sbc  a, e
    inc  bc
    and  c
    ld   a, $3E
    ld   bc, label_7963E
    ld   bc, label_78A48
    ld   bc, $013E
    ld   b, b
    ld   bc, label_3240
    ld   bc, $009C
    and  c
    ldd  [hl], a
    ldd  [hl], a
    ld   bc, $0132
    ldd  [hl], a
    ld   bc, $013C
    inc  a
    inc  a
    ld   bc, label_1A3
    nop
    and  l
    ld   bc, label_1A3
    nop
    and  [hl]
    ld   bc, $9B00
    ld   [bc], a
    and  c
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    dec  d
    sbc  a, h
    ld   a, [de]
    ld   a, [de]
    dec  d
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    nop
    ld   d, c
    ld   d, l
    ld   d, c
    ld   d, l
    ld   h, c
    ld   d, l
    rst  $38
    rst  $38
    cp   $52
    ld   a, h
    ld   d, l
    ld   a, h
    ld   d, l
    xor  b
    ld   d, l
    rst  $38
    rst  $38
    sub  a, $52
    ld   e, c
    ld   l, [hl]
    db   $EC ; Undefined instruction
    ld   d, l
    db   $EC ; Undefined instruction
    ld   d, l
    dec  d
    ld   d, [hl]
    rst  $38
    rst  $38
    and  [hl]
    ld   d, e
    sbc  a, l
    call nz, label_8083
    and  c
    inc  b
    sbc  a, e
    rra
    ld   [bc], a
    sbc  a, h
    ld   a, [bc]
    sbc  a, e
    rra
    ld   [$009C], sp
    and  c
    db   $10 ; Undefined instruction
    dec  c
    ld   c, $9C
    db   $10 ; Undefined instruction
    sbc  a, e
    rrca
    inc  d
    sbc  a, h
    db   $10 ; Undefined instruction
    ld   c, $0E
    sbc  a, h
    db   $10 ; Undefined instruction
    sbc  a, e
    rlca
    inc  d
    sbc  a, h
    ld   d, $A4
    ld   bc, $9D00
    add  a, h
    add  a, [hl]
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  c
    db   $10 ; Undefined instruction
    ld   bc, label_2810
    ld   bc, label_1C1A
    ld   bc, $0110
    ld   [de], a
    ld   bc, label_412
    ld   bc, $9B9C
    ld   [bc], a
    ld   d, $16
    ld   bc, label_2E16
    ld   bc, label_2220
    ld   bc, $0116
    jr   label_795A4
    jr   label_795B1
    ld   bc, $009C
    and  c
    inc  e
    inc  e
    ld   bc, label_341C
    ld   bc, label_2A26

label_795B1::
    ld   bc, $9B1C
    ld   [bc], a
    ld   bc, $9C1E
    ld   [de], a
    ld   bc, label_2222
    ld   bc, label_3A22
    ld   bc, label_2E2C
    ld   bc, $9B22
    ld   [bc], a
    ld   bc, $9C24
    jr   label_795CC
    inc  e

label_795CC::
    inc  e
    ld   bc, label_341C
    ld   bc, label_2A26
    ld   bc, $9B1C
    ld   [bc], a
    ld   bc, $9C1E
    ld   [de], a
    ld   bc, label_22A2
    ldi  [hl], a
    db   $3A ; ldd  a, [hl]
    and  c
    inc  h
    ld   h, $01
    ld   h, $A6
    ld   a, $A1
    ld   h, $0E
    ld   h, $00
    sbc  a, e
    ld   [bc], a
    sbc  a, c
    and  c
    ldd  [hl], a
    ldd  [hl], a
    ld   bc, label_78A32
    ld   bc, label_3E3C
    ld   bc, $0132
    inc  [hl]
    ld   bc, label_2634
    ld   bc, $9B9C
    ld   [bc], a
    jr   c, label_7963D
    ld   bc, label_79038
    ld   bc, label_78442
    ld   bc, $0138
    db   $3A ; ldd  a, [hl]
    ld   bc, label_2E3A
    ld   bc, $009C
    and  c
    ld   a, $3E
    ld   bc, label_7963E
    ld   bc, label_78C48
    ld   bc, $013E
    ld   b, b
    ld   bc, label_3440
    ld   bc, label_78444
    ld   bc, label_79C44
    ld   bc, label_7904E
    ld   bc, $0144
    ld   b, [hl]
    ld   bc, label_3A46
    ld   bc, label_3E3E
    ld   bc, label_7963E
    ld   bc, label_78C48

label_7963E::
    ld   bc, $013E
    ld   b, b
    ld   bc, label_3440
    ld   bc, label_784A2
    ld   b, h
    ld   e, h
    and  c
    ld   b, [hl]
    ld   c, b
    ld   bc, $A648
    ld   h, b
    and  c
    ld   c, b
    jr   nc, label_7969D
    nop
    nop
    rst  $30
    ld   c, d
    ld   h, c
    ld   d, [hl]
    ld   l, l
    ld   d, [hl]
    sub  a, e
    ld   d, [hl]
    nop
    nop
    pop  hl
    ld   l, l
    and  a
    ld   d, [hl]
    jr   nz, label_796D4
    jr   nz, label_796D6
    rst  $38
    rst  $38
    ld   b, l
    ld   d, a
    sbc  a, e
    ld   l, l
    cp   h
    ld   d, [hl]
    ld   b, l
    ld   l, [hl]
    rst  0
    ld   d, [hl]
    sbc  a, e
    ld   l, l
    jp   nc, label_BC56
    ld   d, [hl]
    ld   b, l
    ld   l, [hl]
    rst  0
    ld   d, [hl]
    sbc  a, e
    ld   l, l
    jp   nc, label_2756
    ld   l, [hl]
    db   $E3 ; Undefined instruction
    ld   d, [hl]
    sbc  a, e
    ld   l, l
    jp   nc, label_8256
    ld   l, l
    db   $ED ; Undefined instruction
    ld   d, [hl]
    rst  $38
    rst  $38
    ld   e, a
    ld   d, a
    ld   e, c
    ld   l, [hl]
    ld   sp, hl
    ld   d, [hl]
    ld   sp, hl
    ld   d, [hl]
    ld   d, h
    ld   l, [hl]
    dec  [hl]
    ld   d, a

label_7969D::
    ld   e, c
    ld   l, [hl]
    inc  h
    ld   d, a
    inc  h

label_796A2::
    ld   d, a
    rst  $38
    rst  $38

label_796A5::
    sub  a, c
    ld   d, a
    sbc  a, e
    db   $10 ; Undefined instruction
    ld   bc, $A39C
    ld   bc, label_CA1
    jr   label_796D6
    jr   nc, label_796F0
    ld   c, b
    ld   d, h
    ld   h, b
    and  l
    ld   bc, label_1A3
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    ld   l, d
    ld   [hl], b
    ld   l, [hl]
    ld   [hl], h
    xor  [hl]
    ld   bc, $009C
    and  c
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   a, $44
    and  h
    ld   d, b
    ld   bc, label_1A8
    nop
    xor  b
    ld   bc, label_1A2

label_796D6::
    and  c
    ld   a, b
    halt
    dec  c
    and  b
    ld   a, b
    halt
    ld   a, b
    and  e
    ld   bc, $A100
    ld   l, d
    ld   [hl], b
    ld   a, b
    halt
    ld   a, [hl]
    xor  b
    ld   bc, $A300
    ld   bc, label_D9B
    and  b
    ld   a, b
    halt
    ld   a, b
    and  l
    ld   bc, $9900
    and  d
    ld   a, [bc]
    ld   bc, label_1A4
    and  [hl]
    ld   bc, label_AA1
    ld   a, [bc]
    and  [hl]
    ld   bc, label_1A8
    and  d
    ld   a, [bc]
    ld   a, [bc]
    and  h
    ld   bc, label_1A6
    and  c
    ld   a, [bc]
    and  d
    ld   a, [bc]
    ld   bc, label_1A8
    and  d
    ld   a, [bc]
    ld   bc, label_1A4
    and  [hl]
    ld   bc, label_AA1
    and  d
    ld   a, [bc]
    ld   bc, label_1A8
    sbc  a, c
    and  d
    ld   a, [bc]
    ld   a, [bc]
    and  h
    ld   bc, label_1A6
    and  c
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    xor  b
    ld   bc, label_AA2
    nop
    sbc  a, d
    and  c
    ld   a, [bc]
    db   $10 ; Undefined instruction
    ld   d, $A5
    ld   e, $A4
    ld   bc, label_20A1
    jr   label_79753
    ld   a, [bc]
    nop
    ld   [hl], $6E
    or   c
    ld   d, a
    ld   b, b
    ld   l, [hl]
    db   $DB
    ld   d, a
    sbc  a, e
    ld   l, l
    or   h
    ld   l, [hl]
    ld   [$E158], sp
    ld   l, l
    and  a
    ld   d, [hl]
    jr   nz, label_797C6
    jr   nz, label_797C8
    rst  $38
    rst  $38
    ld   h, c
    ld   d, [hl]
    ld   [hl], $6E
    inc  d
    ld   e, b
    ld   b, b
    ld   l, [hl]
    ld   a, $58
    or   h
    ld   l, [hl]
    dec  d
    ld   l, l
    sbc  a, e
    ld   l, l
    cp   h
    ld   d, [hl]
    ld   b, l
    ld   l, [hl]
    rst  0
    ld   d, [hl]
    sbc  a, e
    ld   l, l
    jp   nc, label_BC56
    ld   d, [hl]
    ld   b, l
    ld   l, [hl]
    rst  0
    ld   d, [hl]
    sbc  a, e
    ld   l, l
    jp   nc, label_2756
    ld   l, [hl]
    db   $E3 ; Undefined instruction
    ld   d, [hl]
    sbc  a, e
    ld   l, l
    jp   nc, label_8256
    ld   l, l
    db   $ED ; Undefined instruction
    ld   d, [hl]
    rst  $38
    rst  $38
    ld   l, l
    ld   d, [hl]
    ld   h, e
    ld   l, [hl]
    ld   l, e
    ld   e, b
    ld   d, h
    ld   l, [hl]
    sbc  a, e
    ld   e, b
    or   h
    ld   l, [hl]
    dec  d
    ld   l, l
    ld   e, c
    ld   l, [hl]
    ld   sp, hl
    ld   d, [hl]
    ld   sp, hl
    ld   d, [hl]
    ld   d, h
    ld   l, [hl]
    dec  [hl]
    ld   d, a
    ld   e, c
    ld   l, [hl]
    inc  h
    ld   d, a
    inc  h
    ld   d, a
    rst  $38
    rst  $38
    sub  a, e
    ld   d, [hl]
    and  d
    jr   label_797D0
    and  h
    ld   e, $A3
    ld   bc, label_18A2
    inc  e
    and  a
    ld   e, $A2
    jr   z, label_797E6
    jr   label_79766
    inc  e

label_797C3::
    xor  [hl]
    ld   bc, label_18A2
    inc  e

label_797C8::
    and  h
    ld   e, $A3
    ld   bc, label_18A2
    inc  e
    and  a

label_797D0::
    ld   e, $A2
    ld   h, $30
    ld   l, $A4
    ld   l, $01
    and  l
    ld   bc, $A100
    jr   nc, label_79810
    and  h
    inc  [hl]
    and  d
    ld   bc, label_30A1
    ldd  [hl], a
    inc  [hl]

label_797E6::
    and  [hl]
    ld   bc, label_780A3
    and  c
    ld   a, $3C
    ld   c, b
    ld   c, d
    and  h
    ld   c, h
    and  c
    ld   c, [hl]
    ld   bc, label_78A48
    ld   c, h
    ld   c, [hl]
    and  d
    ld   bc, label_798A3
    and  c
    ld   d, [hl]
    ld   d, h
    ld   d, d
    ld   d, h
    ld   d, [hl]
    ld   c, b
    ld   c, d
    ld   bc, label_1A7
    nop
    and  a
    ld   bc, label_7B8A1
    halt
    add  hl, bc
    and  b

label_79810::
    ld   a, b
    halt
    nop
    and  d
    ldi  [hl], a
    ld   h, $A4
    jr   z, label_797BD
    ld   bc, label_22A2
    ld   h, $A7
    jr   z, label_797C3
    ldd  [hl], a
    jr   nc, label_79846
    and  h
    inc  h
    xor  [hl]
    ld   bc, label_22A2
    ld   h, $A4
    jr   z, label_797D1
    ld   bc, label_22A2
    ld   h, $A7
    jr   z, label_797D7
    jr   nc, label_79871
    jr   c, label_797DD
    ld   [hl], $01
    and  l
    ld   bc, $A100
    db   $3A ; ldd  a, [hl]
    inc  a
    and  h
    ld   a, $A2
    ld   bc, label_3AA1
    inc  a
    ld   a, $A6
    ld   bc, label_78AA3
    and  c
    ld   c, b
    ld   b, [hl]
    ld   d, d
    ld   d, h
    and  h
    ld   d, [hl]
    and  c
    ld   e, b
    ld   bc, label_79452
    ld   d, [hl]
    ld   e, b
    and  d

label_7985C::
    ld   bc, label_78AA3
    and  c
    ld   h, b
    ld   e, [hl]
    ld   l, d
    ld   l, h
    ld   l, [hl]
    ld   h, b
    ld   h, d
    ld   bc, label_1A7
    nop
    sbc  a, e
    ld   [bc], a
    sbc  a, c
    and  d
    ld   a, [bc]
    ld   a, [bc]

label_79871::
    xor  b
    ld   bc, $9B9C
    ld   [bc], a
    and  d
    ld   b, $06
    xor  b
    ld   bc, $9B9C
    ld   [bc], a
    and  d
    ld   a, [bc]
    ld   a, [bc]
    ld   bc, $010A
    ld   a, [bc]
    and  c
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    and  d
    ld   a, [de]
    ld   a, [de]
    ld   bc, $011A
    ld   a, [de]
    and  c
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    and  c
    ld   a, [bc]
    sbc  a, h
    ldi  [hl], a

label_798A1::
    sbc  a, e

label_798A2::
    rlca

label_798A3::
    ld   a, [bc]
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, [bc]
    sbc  a, h
    ldi  [hl], a
    sbc  a, e
    rlca
    ld   a, [bc]
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, [bc]
    sbc  a, h
    ldi  [hl], a
    sbc  a, e
    rlca
    ld   a, [bc]
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, [bc]
    sbc  a, h
    ldi  [hl], a
    sbc  a, e
    rlca
    ld   a, [bc]
    sbc  a, h
    ldi  [hl], a
    inc  h
    ld   h, $18
    ld   a, [de]
    ld   bc, label_1A7
    nop
    nop
    jp   z, label_D44A
    ld   e, b
    xor  $58
    inc  c
    ld   e, c
    nop
    nop
    daa
    ld   l, l
    ld   a, b
    ld   l, l
    jr   label_79933
    ld   hl, label_1859
    ld   e, c
    add  hl, bc

label_798DF::
    ld   l, [hl]
    add  hl, hl
    ld   e, c
    ld   sp, label_3159
    ld   e, c
    ld   sp, label_3159
    ld   e, c
    rst  $38
    rst  $38
    sub  a, $58
    add  hl, bc
    ld   l, [hl]
    jr   label_7994B
    ld   hl, $C359
    ld   l, l
    jr   label_79951
    add  hl, hl
    ld   e, c
    and  l
    ld   l, l
    ld   sp, label_3159
    ld   e, c
    jp   label_316D
    ld   e, c
    add  hl, bc
    ld   l, [hl]
    ld   sp, $FF59
    rst  $38
    xor  $58
    ld   d, h
    ld   l, [hl]
    ld   l, [hl]
    ld   e, c
    add  hl, sp
    ld   e, c
    ld   h, c
    ld   e, c
    rst  $38
    rst  $38
    inc  c
    ld   e, c
    sbc  a, e
    inc  b
    and  d
    ld   c, b
    ld   c, h
    ld   d, h
    ld   e, b
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    ld   b, h
    ld   c, b
    ld   d, b
    ld   d, h
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    ld   c, d
    ld   c, [hl]
    ld   d, [hl]
    ld   e, d
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a

label_79933::
    ld   c, h
    ld   d, b
    ld   d, [hl]
    ld   e, h
    sbc  a, h
    nop
    sbc  a, c
    and  a
    jr   label_798DF
    jr   label_798E4
    ld   bc, label_1A7
    and  d
    ld   d, $A7
    inc  d
    and  d
    inc  d
    and  l
    ld   bc, label_1A7
    and  d
    inc  d
    and  a
    ld   a, [bc]
    and  d

label_79951::
    ld   a, [bc]
    and  l
    ld   bc, label_1A7
    and  d
    ld   a, [bc]
    ld   [bc], a
    ld   [bc], a
    ld   bc, $A502
    ld   bc, label_1A7
    nop
    sbc  a, e
    inc  b
    and  d
    inc  b
    sbc  a, h
    xor  [hl]
    ld   bc, $A401
    ld   bc, label_18A2
    nop
    sbc  a, e
    inc  c
    and  l
    ld   bc, $009C
    nop
    cp   e
    ld   c, d
    inc  e
    ld   c, e
    ld   a, a
    ld   e, c
    cpl
    ld   e, d
    nop
    nop
    inc  de
    ld   l, [hl]
    ld   a, h
    ld   l, [hl]
    ld   b, a
    ld   e, d
    ld   d, c
    ld   e, d
    dec  e
    ld   l, [hl]
    sub  a, h
    ld   l, [hl]
    ld   b, a
    ld   e, d
    ld   d, c
    ld   e, d
    ld   a, [$8B6D]
    ld   l, [hl]
    ld   b, a
    ld   e, d
    adc  a, b
    ld   l, [hl]
    ld   b, a
    ld   e, d
    and  $6D
    add  a, l
    ld   l, [hl]
    ld   b, a
    ld   e, d
    jr   nz, label_79A0E
    ld   a, h
    ld   l, [hl]
    inc  de
    ld   l, [hl]
    ld   a, h
    ld   l, [hl]
    ld   b, a
    ld   e, d
    ld   d, c
    ld   e, d
    dec  e
    ld   l, [hl]
    sub  a, h
    ld   l, [hl]
    ld   b, a
    ld   e, d
    ld   d, c
    ld   e, d
    ld   a, [$8B6D]
    ld   l, [hl]
    ld   b, a
    ld   e, d
    adc  a, b
    ld   l, [hl]
    ld   b, a
    ld   e, d
    and  $6D
    add  a, l
    ld   l, [hl]
    ld   b, a
    ld   e, d
    jr   nz, label_79A32
    ld   a, h
    ld   l, [hl]
    sbc  a, e
    ld   l, l
    ld   [hl], a
    ld   e, d
    adc  a, h
    ld   l, l
    ld   a, [hl]
    ld   e, d
    sub  a, c
    ld   l, l
    add  a, h
    ld   e, d
    sbc  a, e
    ld   l, l
    add  a, h
    ld   e, d
    add  a, h
    ld   e, d
    add  a, d
    ld   l, l
    add  a, h
    ld   e, d
    sbc  a, e
    ld   l, l
    adc  a, d
    ld   e, d
    adc  a, h
    ld   l, l
    sub  a, b
    ld   e, d
    sub  a, c
    ld   l, l
    add  a, h
    ld   e, d
    sbc  a, e
    ld   l, l
    add  a, h
    ld   e, d
    add  a, h
    ld   e, d
    add  a, d
    ld   l, l
    add  a, h

label_799F2::
    ld   e, d
    sub  a, h
    ld   l, [hl]
    sbc  a, e
    ld   l, l
    ld   [hl], a
    ld   e, d
    adc  a, h
    ld   l, l

label_799FB::
    ld   a, [hl]
    ld   e, d
    sub  a, c
    ld   l, l
    add  a, h
    ld   e, d
    sbc  a, e
    ld   l, l

label_79A03::
    add  a, h
    ld   e, d
    add  a, h

label_79A06::
    ld   e, d
    add  a, d
    ld   l, l
    add  a, h
    ld   e, d

label_79A0B::
    sbc  a, e
    ld   l, l
    adc  a, d

label_79A0E::
    ld   e, d
    adc  a, h
    ld   l, l
    sub  a, b

label_79A12::
    ld   e, d
    sub  a, c
    ld   l, l
    add  a, h
    ld   e, d
    sbc  a, e
    ld   l, l
    add  a, h
    ld   e, d
    add  a, h
    ld   e, d
    add  a, d
    ld   l, l
    add  a, h
    ld   e, d
    ld   a, h
    ld   l, [hl]
    cp   c
    ld   l, l
    ccf
    ld   e, d
    daa
    ld   l, [hl]
    sub  a, [hl]
    ld   e, d
    rst  $38
    rst  $38
    ld   a, a
    ld   e, c
    ld   e, [hl]
    ld   l, [hl]
    ld   l, d

label_79A32::
    ld   e, d
    sbc  a, a
    ld   e, d
    ld   e, c
    ld   l, [hl]
    ccf
    ld   e, d
    sub  a, [hl]
    ld   e, d
    rst  $38
    rst  $38
    cpl
    ld   e, d
    and  d
    jr   label_79A5E
    ld   e, $14
    jr   label_79A60
    nop
    and  e
    jr   nc, label_79A7E
    ld   [hl], $A4
    ld   b, h
    jr   label_799F2
    ld   bc, label_3000

label_79A52::
    inc  [hl]
    ld   [hl], $A4
    ld   b, d
    jr   label_799FB
    ld   bc, label_3430
    ld   [hl], $A4
    ld   b, b

label_79A5E::
    jr   label_79A03

label_79A60::
    ld   bc, label_3430
    ld   [hl], $A4
    ld   b, d
    jr   label_79A0B
    ld   bc, $9B00
    jr   label_79A06
    and  e
    jr   label_79A88
    and  l
    ld   bc, label_1A3
    jr   label_79A12
    nop
    sbc  a, e
    inc  c
    and  c
    inc  h
    inc  l
    sbc  a, h
    nop

label_79A7E::
    sbc  a, e
    inc  b
    inc  h
    inc  l
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    ldi  [hl], a
    ld   a, [hli]

label_79A88::
    sbc  a, h
    nop
    sbc  a, e
    inc  c
    jr   nz, label_79AB6
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    jr   nz, label_79ABC
    sbc  a, h
    nop
    and  d
    ld   bc, label_CAE
    and  l
    ld   bc, label_1A7
    nop
    sbc  a, e
    ld   [$A399], sp
    jr   label_79ABD
    ld   bc, $0118
    and  h
    jr   nc, label_79A4E
    jr   label_79A49
    nop
    nop
    cp   e
    ld   c, d
    cp   c
    ld   e, d
    push de
    ld   e, d
    or   c

label_79AB6::
    ld   e, e
    nop
    nop
    add  a, d
    ld   l, l
    rst  $18

label_79ABC::
    ld   e, e

label_79ABD::
    sbc  a, e
    ld   l, l
    rst  $18
    ld   e, e
    rst  $18
    ld   e, e
    nop
    ld   e, h
    adc  a, h
    ld   l, l
    dec  bc
    ld   e, h
    dec  bc
    ld   e, h
    dec  bc
    ld   e, h
    ld   a, h
    ld   l, [hl]
    dec  bc
    ld   e, h
    rst  $38
    rst  $38
    cp   c
    ld   e, d
    add  a, d
    ld   l, l
    cpl
    ld   e, h
    cpl
    ld   e, h
    sbc  a, e
    ld   l, l
    cpl
    ld   e, h
    add  a, d
    ld   l, l
    cpl
    ld   e, h
    add  a, d
    ld   l, l
    dec  [hl]
    ld   e, h
    dec  [hl]
    ld   e, h
    sbc  a, e
    ld   l, l
    dec  [hl]
    ld   e, h
    add  a, d
    ld   l, l
    dec  [hl]
    ld   e, h
    add  a, d
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    db   $3A ; ldd  a, [hl]
    ld   e, h
    sbc  a, e
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    add  a, d
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    add  a, d
    ld   l, l
    ccf
    ld   e, h
    ccf
    ld   e, h
    sbc  a, e
    ld   l, l
    ccf
    ld   e, h
    add  a, d
    ld   l, l
    ccf
    ld   e, h
    add  a, d
    ld   l, l
    cpl
    ld   e, h
    sbc  a, e
    ld   l, l
    cpl
    ld   e, h
    adc  a, h
    ld   l, l
    cpl
    ld   e, h
    add  a, d
    ld   l, l
    cpl
    ld   e, h
    add  a, d
    ld   l, l
    dec  [hl]
    ld   e, h
    sbc  a, e
    ld   l, l
    dec  [hl]
    ld   e, h
    adc  a, h
    ld   l, l
    dec  [hl]
    ld   e, h
    add  a, d
    ld   l, l
    dec  [hl]
    ld   e, h
    add  a, d
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    sbc  a, e
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    adc  a, h
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    add  a, d
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    add  a, d
    ld   l, l
    ccf
    ld   e, h
    sbc  a, e
    ld   l, l
    ccf
    ld   e, h
    adc  a, h
    ld   l, l
    ccf
    ld   e, h
    add  a, d
    ld   l, l
    ccf
    ld   e, h
    add  a, d
    ld   l, l
    cpl
    ld   e, h
    sbc  a, e
    ld   l, l
    cpl
    ld   e, h
    adc  a, h
    ld   l, l
    cpl
    ld   e, h
    add  a, d
    ld   l, l
    cpl
    ld   e, h
    add  a, d
    ld   l, l
    dec  [hl]
    ld   e, h
    sbc  a, e
    ld   l, l
    dec  [hl]
    ld   e, h
    adc  a, h
    ld   l, l
    dec  [hl]
    ld   e, h
    add  a, d
    ld   l, l
    dec  [hl]
    ld   e, h
    add  a, d
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    sbc  a, e
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    adc  a, h
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    add  a, d
    ld   l, l
    db   $3A ; ldd  a, [hl]
    ld   e, h
    add  a, d
    ld   l, l
    ccf
    ld   e, h
    sbc  a, e
    ld   l, l
    ccf
    ld   e, h
    adc  a, h
    ld   l, l
    ccf
    ld   e, h
    add  a, d
    ld   l, l
    ccf
    ld   e, h
    add  a, d
    ld   l, l
    ld   b, h
    ld   e, h
    adc  a, h
    ld   l, l
    ld   b, h
    ld   e, h
    sbc  a, e
    ld   l, l
    ld   c, c
    ld   e, h
    adc  a, h
    ld   l, l
    ld   c, c
    ld   e, h
    jr   nz, label_79C0C
    jr   nz, label_79C0E
    sbc  a, e
    ld   l, l
    ld   c, [hl]
    ld   e, h
    sub  a, h
    ld   l, [hl]
    ld   c, [hl]
    ld   e, h
    jr   nz, label_79C18
    jr   nz, label_79C1A
    rst  $38
    rst  $38
    push de
    ld   e, d
    ld   h, a
    ld   e, l
    dec  d
    ld   l, l
    jr   nz, label_79C24
    jr   nz, label_79C26
    jr   nz, label_79C28
    ld   h, e
    ld   l, [hl]
    ld   e, [hl]
    ld   e, h
    ld   [hl], d
    ld   l, [hl]
    adc  a, l
    ld   e, h
    ld   l, l
    ld   l, [hl]
    and  c
    ld   e, h
    ld   [hl], d
    ld   l, [hl]
    adc  a, l
    ld   e, h
    ld   l, l
    ld   l, [hl]
    and  c
    ld   e, h
    jr   label_79C3E
    ld   l, l
    ld   l, [hl]
    sub  a, [hl]
    ld   e, h
    ld   [hl], a
    ld   l, [hl]
    and  c
    ld   e, h
    jr   label_79C48
    rst  $38
    rst  $38
    or   c
    ld   e, e
    and  l
    ld   bc, label_1A3
    sbc  a, e
    inc  b
    and  d
    ld   d, h
    sbc  a, h
    xor  [hl]
    ld   bc, label_49B
    and  d
    ld   d, d
    sbc  a, h
    xor  [hl]
    ld   bc, label_49B
    and  d
    ld   e, b
    sbc  a, h
    xor  [hl]
    ld   bc, label_49B
    and  d
    ld   d, [hl]
    sbc  a, h
    and  e
    ld   bc, $A800
    ld   bc, label_1A2
    ld   e, [hl]
    xor  b
    ld   bc, label_1A2
    ld   h, b
    nop
    sbc  a, e

label_79C0C::
    inc  bc
    and  d

label_79C0E::
    ld   [bc], a
    ld   [label_C04], sp
    sbc  a, h
    sbc  a, l
    and  d
    add  a, e
    ret  nz
    ld   [bc], a

label_79C18::
    ld   [label_C04], sp
    sbc  a, l
    jp   nz, label_C083
    ld   [bc], a
    ld   [label_C04], sp
    sbc  a, l

label_79C24::
    add  a, c
    add  a, e

label_79C26::
    ret  nz
    sbc  a, e

label_79C28::
    inc  bc
    ld   [bc], a
    ld   [label_C04], sp
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    and  d
    ld   h, b
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    ld   e, [hl]
    sbc  a, h
    nop
    sbc  a, e
    inc  b
    ld   h, h
    sbc  a, h

label_79C3E::
    nop
    sbc  a, e
    inc  b
    ld   h, d
    sbc  a, h
    nop

label_79C44::
    sbc  a, e
    inc  b
    ld   l, d
    sbc  a, h

label_79C48::
    nop
    sbc  a, e
    inc  b
    ld   l, h
    sbc  a, h
    nop
    and  d
    jr   nc, label_79C85
    ld   [hl], $44
    and  l
    ld   bc, label_1A2
    ld   b, d
    inc  [hl]
    ld   b, d
    and  l
    ld   bc, $0001
    sbc  a, c
    and  d
    jr   label_79C7E
    ld   e, $2C
    xor  [hl]
    ld   bc, label_18A2
    inc  e
    ld   e, $2A
    xor  [hl]
    ld   bc, label_1CA2
    jr   nz, label_79C93
    jr   nc, label_79C21
    ld   bc, label_1CA2
    jr   nz, label_79C9A
    ld   l, $AE
    ld   bc, label_26A2
    ld   a, [hli]

label_79C7E::
    inc  l
    db   $3A ; ldd  a, [hl]
    and  h
    ld   bc, label_28A2
    inc  l

label_79C85::
    ld   l, $3C
    sbc  a, e
    add  hl, bc
    and  h
    ld   bc, $009C
    and  e
    ld   bc, label_7A0A2
    ld   h, h
    ld   h, [hl]

label_79C93::
    ld   [hl], h
    and  e
    ld   bc, label_1A5
    sbc  a, e
    inc  bc

label_79C9A::
    and  d
    ld   e, d
    ld   h, b
    ld   e, [hl]
    ld   h, d
    sbc  a, h
    nop

label_79CA1::
    and  d

label_79CA2::
    ld   e, d

label_79CA3::
    ld   h, b

label_79CA4::
    ld   e, [hl]
    ld   h, d
    nop

label_79CA7::
    nop
    reti
    ld   c, d
    or   d
    ld   e, h
    nop
    ld   e, l
    inc  l
    ld   e, l
    nop
    nop
    add  hl, bc
    ld   l, [hl]
    ld   l, l
    ld   e, l
    inc  de
    ld   l, [hl]
    ld   l, l
    ld   e, l
    call label_7AD6D
    ld   e, l
    inc  de
    ld   l, [hl]
    ld   l, l
    ld   e, l
    add  a, a
    ld   l, l
    ld   [hl], l
    ld   e, l
    add  hl, bc
    ld   l, [hl]
    ld   l, l
    ld   e, l
    ld   l, l
    ld   e, l
    jr   label_79D3B
    inc  h
    ld   l, l
    inc  h
    ld   l, l
    dec  l
    ld   l, l
    add  hl, bc
    ld   l, [hl]
    ld   l, l
    ld   e, l
    inc  de
    ld   l, [hl]
    ld   l, l
    ld   e, l

label_79CDC::
    call label_7AD6D
    ld   e, l
    inc  de
    ld   l, [hl]
    ld   l, l
    ld   e, l
    add  a, a
    ld   l, l
    add  a, [hl]

label_79CE7::
    ld   e, l
    ld   c, $6E
    ld   l, l
    ld   e, l
    inc  de
    ld   l, [hl]
    ld   l, l
    ld   e, l
    call label_7AD6D
    ld   e, l
    inc  h
    ld   l, l
    inc  h
    ld   l, l
    ld   c, $6E
    sbc  a, b
    ld   e, l
    rst  $38
    rst  $38
    or   d
    ld   e, h
    ld   b, l
    ld   l, [hl]
    ld   [hl], $5D
    inc  de
    ld   l, [hl]
    ld   c, l
    ld   e, l
    add  hl, bc
    ld   l, [hl]
    ld   l, l
    ld   e, l
    inc  de
    ld   l, [hl]
    ld   l, l
    ld   e, l
    add  hl, bc
    ld   l, [hl]
    ld   l, l
    ld   e, l
    dec  l
    ld   l, l
    dec  l
    ld   l, l
    add  hl, bc
    ld   l, [hl]
    ld   l, l
    ld   e, l
    ld   c, $6E
    ld   l, l
    ld   e, l
    inc  de
    ld   l, [hl]
    ld   l, l
    ld   e, l
    dec  l
    ld   l, l
    dec  l
    ld   l, l
    rst  $38
    rst  $38
    nop
    ld   e, l
    ld   e, [hl]
    ld   l, [hl]
    ld   [hl], $5D
    ld   h, a
    ld   e, l
    rst  $38
    rst  $38
    inc  l
    ld   e, l
    and  h
    jr   label_79CDC
    inc  e
    ld   e, $A5
    ld   d, $9B
    inc  b
    ld   bc, $A49C
    jr   label_79CE7
    inc  e
    ld   e, $A5
    inc  h
    sbc  a, e
    inc  b
    ld   bc, $009C
    and  h
    ld   h, b
    and  e
    ld   h, h
    ld   h, [hl]
    and  h
    ld   [hl], h
    ld   e, [hl]
    and  e
    ld   h, d
    ld   h, h
    and  h
    ld   [hl], d
    ld   l, [hl]
    and  e
    ld   [hl], d
    ld   [hl], h
    and  h
    add  a, d
    ld   [hl], b
    and  e
    ld   [hl], h
    halt
    add  a, h
    nop
    sbc  a, e
    add  hl, bc
    and  l
    ld   bc, $009C
    xor  d
    ld   c, b
    ld   d, h
    ld   d, [hl]
    ld   h, b
    ld   d, [hl]
    ld   d, h
    nop
    and  c
    ld   bc, label_1AD
    and  e
    ld   bc, label_7B274
    ld   bc, label_7B274
    and  h
    ld   bc, label_7B4A2
    ld   [hl], d
    nop
    and  c
    ld   bc, label_1AD
    ld   bc, label_1A3
    ld   a, d
    ld   a, b
    ld   bc, label_7B87A
    and  h
    ld   bc, label_7BAA2
    ld   a, b
    nop
    and  b
    ld   bc, $9B01
    inc  bc
    and  e
    ld   c, b
    inc  a
    sbc  a, h
    sbc  a, e
    inc  bc
    ld   b, [hl]
    db   $3A ; ldd  a, [hl]
    sbc  a, h
    sbc  a, e
    inc  bc
    ld   a, $32
    sbc  a, h
    sbc  a, e
    ld   b, $40
    inc  [hl]
    sbc  a, h
    xor  [hl]
    ld   bc, $0000
    cp   e
    ld   c, d
    cp   [hl]
    ld   e, l
    add  a, $5D
    inc  e
    ld   c, e
    nop
    nop
    add  hl, bc
    ld   l, [hl]
    sub  a, $5D
    rst  $38
    rst  $38
    cp   [hl]
    ld   e, l
    ld   c, $6E
    jr   nz, label_79E28
    inc  de
    ld   l, [hl]
    ld   c, l
    ld   e, [hl]
    call label_79F6D
    ld   e, [hl]
    rst  $38
    rst  $38
    add  a, $5D
    and  e
    ld   bc, label_788A2
    ld   c, h
    ld   c, [hl]
    ld   e, h
    ld   bc, label_7AC6C
    and  h
    ld   bc, label_1A2
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   e, d
    ld   bc, label_7AA6A
    and  h
    ld   bc, label_1A2
    ld   c, h
    ld   d, b
    ld   d, d
    ld   h, b
    ld   bc, label_7B070
    and  h
    ld   bc, label_1A2
    ld   c, h
    ld   d, b
    ld   d, d
    ld   e, [hl]
    ld   bc, label_7AE6E
    and  h
    ld   bc, label_1A2
    ld   d, [hl]
    ld   e, d
    ld   e, h
    ld   l, d
    ld   bc, $A376
    ld   bc, label_798A2
    ld   e, h
    ld   e, [hl]
    ld   l, h
    ld   bc, $A378
    ld   bc, label_7A0A2
    ld   h, h
    add  a, h
    add  a, d
    add  a, b
    ld   a, [hl]
    xor  [hl]
    ld   bc, $A200
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   e, h
    and  a
    ld   bc, label_7B8A2
    and  h
    ld   a, b
    and  d
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   e, d
    and  a
    ld   bc, label_7B6A2
    and  h
    halt
    ld   c, h
    ld   d, b
    ld   d, d
    ld   h, b
    and  a
    ld   bc, label_7BCA2
    and  h
    ld   a, h
    and  d
    ld   c, h
    ld   d, b
    ld   d, d
    ld   e, [hl]
    and  a
    ld   bc, label_7BAA2
    and  h
    ld   a, d
    nop
    and  d
    ld   d, [hl]
    ld   e, d
    ld   e, h
    ld   l, d
    and  a
    ld   bc, $82A2
    ld   e, b
    ld   e, h
    ld   e, [hl]
    ld   l, h
    and  a
    ld   bc, $84A2
    nop
    ld   h, b
    ld   h, h
    ld   h, [hl]
    adc  a, h
    adc  a, d
    adc  a, b
    add  a, [hl]
    add  a, h
    xor  [hl]
    ld   bc, $0000
    db   $E8 ; add  sp, d

label_79E6C::
    ld   c, d
    adc  a, c
    ld   e, [hl]
    ld   [hl], l
    ld   e, [hl]
    sub  a, e
    ld   e, [hl]
    nop
    nop
    xor  d
    ld   l, l
    sbc  a, e
    ld   e, [hl]
    xor  a
    ld   l, l
    xor  l
    ld   e, [hl]
    or   h
    ld   l, l
    cp   [hl]
    ld   e, [hl]
    xor  a
    ld   l, l
    rst  8
    ld   e, [hl]
    rst  $38
    rst  $38
    ld   [hl], l
    ld   e, [hl]
    db   $10 ; Undefined instruction
    ld   a, l
    ld   l, l
    sbc  a, e
    ld   e, [hl]
    rst  $38
    rst  $38
    adc  a, e
    ld   e, [hl]
    ld   d, h
    ld   l, [hl]
    ld   [$FF5E], a
    rst  $38
    rst  $38
    sub  a, e
    ld   e, [hl]
    and  d
    inc  l
    ld   h, $20
    ld   a, [de]
    inc  d

label_79EA1::
    ld   c, $08

label_79EA3::
    inc  b

label_79EA4::
    ld   [bc], a
    ld   [label_140E], sp

label_79EA8::
    ld   a, [de]
    jr   nz, label_79ED1
    inc  l
    nop
    ld   l, $26
    jr   nz, label_79ECB
    ld   d, $0E
    ld   [label_204], sp
    ld   [label_160E], sp
    ld   a, [de]
    jr   nz, label_79EE2
    ld   l, $00
    jr   nc, label_79EE6
    jr   nz, label_79EDC
    jr   label_79ED2
    ld   [label_204], sp
    ld   [label_180E], sp
    ld   a, [de]

label_79ECB::
    jr   nz, label_79EF3
    jr   nc, label_79ECF

label_79ECF::
    ld   l, $26

label_79ED1::
    jr   nz, label_79EED
    ld   d, $0E
    ld   [label_204], sp
    ld   [label_160E], sp
    ld   a, [de]

label_79EDC::
    jr   nz, label_79F04
    ld   l, $00
    sbc  a, c
    xor  b

label_79EE2::
    ld   bc, label_1A2
    ld   [bc], a

label_79EE6::
    ld   [bc], a
    ld   bc, label_1A8
    and  l
    ld   bc, $0001
    nop
    reti
    ld   c, d
    ld   sp, hl
    ld   e, [hl]

label_79EF3::
    dec  b
    ld   e, a
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    ld   a, l
    ld   l, l
    add  hl, de
    ld   e, a
    add  hl, de
    ld   e, a
    rst  $38
    rst  $38
    ei

label_79F04::
    ld   e, [hl]
    add  hl, bc
    ld   l, [hl]
    add  hl, de
    ld   e, a
    ld   c, $6E
    dec  hl
    ld   e, a
    inc  de
    ld   l, [hl]
    add  hl, de
    ld   e, a
    ldi  [hl], a
    ld   l, [hl]
    dec  hl
    ld   e, a
    rst  $38
    rst  $38
    dec  c
    ld   e, a
    and  c
    ld   c, b
    ld   b, h
    ld   a, $38
    jr   nc, label_79F4C
    ld   h, $20
    jr   label_79F44
    ld   h, $2C
    jr   nc, label_79F60
    ld   a, $44
    nop
    ld   c, h
    ld   c, b
    ld   b, h
    ld   a, $38
    jr   nc, label_79F5E
    ld   h, $20
    ld   h, $2C
    inc  [hl]
    ld   a, $44
    ld   c, h
    ld   d, b
    nop
    nop
    sbc  a, l
    ld   c, d
    ld   b, a
    ld   e, a
    ld   e, l
    ld   e, a
    ld   [hl], a

label_79F44::
    ld   e, a
    adc  a, e
    ld   e, a
    ld   c, a
    ld   l, [hl]

label_79F49::
    inc  bc
    ld   h, b
    ret  z

label_79F4C::
    ld   l, l
    sbc  a, l
    ld   e, a
    daa
    ld   l, [hl]
    cp   h
    ld   e, a
    ret  z
    ld   l, l
    sbc  a, l
    ld   e, a
    jr   nz, label_79FC6
    rst  $38
    rst  $38
    ld   b, a

label_79F5C::
    ld   e, a
    ld   c, a

label_79F5E::
    ld   l, [hl]
    pop  af

label_79F60::
    ld   e, a
    ret  z
    ld   l, l
    rst  0
    ld   e, a
    daa
    ld   l, [hl]
    and  $5F
    adc  a, [hl]
    ld   l, [hl]
    ret  z
    ld   l, l

label_79F6D::
    rst  0
    ld   e, a
    jr   nz, label_79FDE
    ld   a, h
    ld   l, [hl]
    rst  $38
    rst  $38
    ld   e, l
    ld   e, a
    dec  d
    ld   l, l
    ld   e, [hl]
    ld   l, [hl]
    dec  d
    ld   h, b
    ld   e, c
    ld   l, [hl]
    ldi  [hl], a
    ld   h, b
    ld   e, [hl]
    ld   l, [hl]
    dec  d
    ld   h, b
    jr   nz, label_79FF4
    rst  $38
    rst  $38
    ld   [hl], a
    ld   e, a
    dec  l
    ld   h, b
    jr   nc, label_79FEF
    jr   nc, label_79FF1
    ld   c, b
    ld   h, b
    jr   nc, label_79FF5
    jr   nc, label_79FF7
    ld   d, e
    ld   h, b
    rst  $38
    rst  $38
    adc  a, e
    ld   e, a
    sbc  a, e
    ld   [bc], a
    and  d
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    jr   nz, label_79F49
    ld   bc, label_1EA7
    inc  e
    and  e
    ld   bc, $9B9C
    ld   [bc], a
    and  d
    ld   h, $26
    ld   h, $24
    and  h
    ld   bc, label_22A7
    jr   nz, label_79F5C
    ld   bc, $009C
    and  a
    ld   c, b
    ld   b, [hl]
    and  d
    ld   c, b
    ld   c, d
    ld   c, h
    and  c
    ld   c, [hl]
    ld   bc, $9B00
    ld   [bc], a

label_79FC9::
    and  d
    jr   nc, label_79FFC
    jr   nc, label_79FFC
    and  h
    ld   bc, label_2CA7
    ld   a, [hli]
    and  e
    ld   bc, $9B9C
    ld   [bc], a
    and  d
    inc  [hl]
    inc  [hl]
    inc  [hl]
    ldd  [hl], a
    and  h

label_79FDE::
    ld   bc, label_30A7
    ld   l, $A3
    ld   bc, $009C
    and  a
    ld   d, d
    ld   d, b
    and  d
    ld   d, d
    ld   d, h
    ld   d, [hl]
    and  c
    ld   e, b

label_79FEF::
    ld   bc, $A100
    ld   l, h
    ld   l, d

label_79FF4::
    ld   l, b

label_79FF5::
    ld   h, [hl]
    ld   h, h

label_79FF7::
    ld   h, d
    ld   h, b
    ld   e, [hl]
    ld   e, h
    ld   e, d

label_79FFC::
    ld   e, b
    ld   d, [hl]
    ld   d, h
    ld   d, d
    ld   d, b

label_7A001::
    ld   c, [hl]
    nop
    and  c
    ld   h, [hl]
    ld   h, h
    ld   h, d
    ld   h, b
    ld   e, [hl]
    ld   e, h
    ld   e, d
    ld   e, b
    ld   d, [hl]
    ld   d, h
    ld   d, d
    ld   d, b
    ld   c, [hl]
    ld   c, h
    ld   c, d
    ld   c, b
    nop
    sbc  a, e
    db   $10 ; Undefined instruction
    and  d
    jr   label_7A029
    sbc  a, h
    sbc  a, e
    db   $10 ; Undefined instruction
    inc  e
    sbc  a, h
    nop
    sbc  a, d
    and  a
    ldd  [hl], a
    jr   nc, label_79FC9
    ldd  [hl], a
    inc  [hl]

label_7A029::
    ld   [hl], $99
    jr   c, label_7A02D

label_7A02D::
    and  l
    ld   bc, $9B00
    inc  b
    and  d
    dec  d
    dec  d
    rst  $38
    ld   bc, $9B9C
    ld   [bc], a
    dec  d
    dec  d
    rst  $38
    dec  d
    sbc  a, h
    ld   a, [de]
    rst  $38
    dec  d
    rst  $38
    sbc  a, e
    inc  b
    rst  $38
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    rst  $38
    ld   a, [de]
    ld   a, [de]
    sbc  a, h
    sbc  a, e
    inc  b
    rst  $38
    sbc  a, h
    nop
    ld   a, [de]
    ld   a, [de]
    ld   bc, label_1515
    ld   bc, rIE
    sbc  a, e
    inc  b
    dec  d
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, [de]
    sbc  a, h
    nop

label_7A064::
    nop
    xor  h
    ld   c, d
    ld   l, a
    ld   h, b
    ld   a, c
    ld   h, b
    ld   a, a
    ld   h, b
    nop
    nop
    add  hl, bc
    ld   l, [hl]
    inc  h
    ld   l, l
    daa
    ld   l, l
    add  a, a
    ld   h, b
    nop
    nop
    call label_876D
    ld   h, b
    nop

label_7A07E::
    nop
    ld   [hl], a
    ld   l, [hl]
    daa
    ld   l, l
    add  a, a
    ld   h, b
    nop
    nop
    sbc  a, e
    ld   [bc], a
    and  c
    sub  a, b
    adc  a, d
    add  a, d
    ld   a, h
    ld   a, b
    ld   [hl], d
    ld   l, d
    ld   h, h
    ld   h, b
    ld   e, d
    ld   d, d
    ld   c, h
    ld   c, b
    ld   b, d
    db   $3A ; ldd  a, [hl]
    inc  [hl]
    adc  a, [hl]
    adc  a, b
    add  a, d
    ld   a, d
    halt
    ld   l, d
    ld   h, d

label_7A0A2::
    ld   e, [hl]
    ld   e, b
    ld   d, d
    ld   c, d
    ld   b, [hl]
    ld   b, b
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    sbc  a, h
    ld   l, $28
    ldi  [hl], a
    ld   a, [de]
    ld   d, $10
    ld   a, [bc]
    ld   [bc], a
    and  [hl]
    ld   c, b
    ld   d, [hl]
    ld   e, h
    ld   h, h
    ld   bc, label_7A0A2
    and  c
    ld   l, b
    ld   l, [hl]
    and  l
    ld   a, b
    ld   bc, $0000
    jp   z, label_CD4A
    ld   h, b
    reti
    ld   h, b
    inc  e
    ld   c, e
    nop
    nop
    add  hl, bc
    ld   l, [hl]
    inc  bc
    ld   h, b
    db   $10 ; Undefined instruction
    db   $E3 ; Undefined instruction
    ld   h, b
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    ld   h, b
    add  hl, bc
    ld   l, [hl]
    sbc  a, l
    ld   l, [hl]
    pop  af
    ld   e, a
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    ld   h, b
    and  d
    jr   z, label_7A116
    ld   [hl], $3E
    and  e
    ld   l, [hl]
    ld   bc, label_7A0A2
    jr   z, label_7A11F
    ld   [hl], $60
    ld   h, h
    ld   h, [hl]
    ld   l, d
    ld   h, $34
    and  e
    ld   l, d
    ld   e, h
    ld   [hl], h
    and  d
    ld   d, d
    ld   c, h
    ld   b, h
    ld   a, $3A
    inc  [hl]
    inc  l
    ld   h, $22
    jr   z, label_7A136
    ld   [hl], $A3
    ld   h, [hl]
    ld   bc, label_798A2
    ldi  [hl], a
    jr   z, label_7A13F
    ld   e, b
    ld   e, h
    ld   h, b
    ld   h, h
    ld   e, $2C
    and  e

label_7A116::
    ld   h, h
    ld   d, [hl]
    ld   l, [hl]
    and  d
    ld   c, h
    ld   b, h
    ld   a, $36
    inc  [hl]

label_7A11F::
    inc  l
    ld   h, $1E
    nop
    nop
    xor  h
    ld   c, d
    ld   l, $61
    inc  [hl]
    ld   h, c
    ld   c, b
    ld   h, c
    nop
    nop
    ld   d, h
    ld   h, c
    rst  $38
    rst  $38
    ld   l, $61
    adc  a, a
    ld   h, c

label_7A136::
    db   $E3 ; Undefined instruction
    ld   h, b
    ld   a, h
    ld   l, [hl]
    sbc  a, l
    ld   h, c
    sub  a, [hl]
    ld   h, c
    ldh  [$FF0C], a

label_7A13F::
    ld   h, c
    ld   a, h
    ld   l, [hl]
    ld   h, $62
    rst  $38
    rst  $38
    inc  [hl]
    ld   h, c
    ld   l, b
    ld   l, [hl]
    ld   h, a
    ld   h, d
    ld   l, l
    ld   l, [hl]
    ld   h, a
    ld   h, d
    rst  $38
    rst  $38
    ld   c, b
    ld   h, c
    sbc  a, l
    ldd  [hl], a
    add  a, e
    add  a, b
    sbc  a, e
    inc  b
    and  d
    ld   c, b
    ld   bc, label_78848
    sbc  a, h
    sbc  a, e
    inc  b
    ld   b, h
    ld   bc, label_78444
    sbc  a, h
    sbc  a, e
    inc  b
    ld   b, b
    ld   bc, label_78040
    sbc  a, h
    sbc  a, e
    inc  b
    ld   a, $01
    ld   a, $3E
    sbc  a, h
    sbc  a, e
    inc  b
    jr   nc, label_7A17A
    jr   nc, label_7A1AB
    sbc  a, h
    sbc  a, e
    inc  b
    inc  l
    ld   bc, label_2C2C
    sbc  a, h
    sbc  a, e
    rlca
    ld   l, $01
    ld   l, $2E
    sbc  a, h
    inc  l
    ld   bc, label_2C2C
    nop
    sbc  a, l
    ld   h, a
    add  a, [hl]
    add  a, b
    sbc  a, a
    db   $E8 ; add  sp, d
    nop
    sbc  a, l
    ld   b, a
    add  a, [hl]
    add  a, b
    sbc  a, a
    db   $E8 ; add  sp, d
    nop
    and  d
    db   $10 ; Undefined instruction
    ld   e, $26
    and  e
    ld   d, [hl]
    and  d
    ld   e, b
    ld   e, h
    and  e
    ld   h, b
    and  d
    db   $10 ; Undefined instruction
    jr   z, label_7A1DE
    ld   e, h
    ld   e, b
    ld   e, h
    ld   b, $1E
    ld   e, b
    and  e
    ld   d, [hl]
    and  d
    ld   d, d
    ld   c, [hl]
    ld   b, $0E
    inc  d
    ld   e, $A4
    ld   c, [hl]
    and  d
    inc  c
    ld   d, $1A
    ld   e, $54
    ld   e, [hl]
    ld   h, d
    and  e
    ld   h, [hl]
    and  d
    ld   d, $0C
    inc  h
    ld   l, $3C
    ld   h, d
    ld   e, [hl]
    and  a
    ld   h, d
    and  d
    ld   [hl], b
    ld   a, [bc]
    ld   d, $1A
    jr   z, label_7A181
    ld   l, [hl]
    and  d
    ld   a, d
    ld   [label_1A14], sp
    ld   h, $00
    and  d
    jr   z, label_7A215
    ld   [hl], $3E
    and  e
    ld   l, [hl]
    ld   bc, label_7A0A2
    jr   z, label_7A21E
    ld   [hl], $01
    add  a, [hl]
    ld   a, b
    sub  a, b
    and  d
    adc  a, h
    ld   c, h
    ld   c, [hl]
    ld   d, d
    and  e
    ld   d, [hl]
    and  d
    ld   e, b
    and  h
    ld   e, h
    and  d
    ld   a, $3A
    inc  [hl]
    ld   a, $44
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   c, b
    ld   c, [hl]
    and  e
    ld   c, [hl]
    ld   bc, label_780A2
    ldi  [hl], a
    jr   z, label_7A240
    ld   b, b
    ld   b, h
    ld   c, b
    ld   c, h
    jr   nc, label_7A24A
    ld   [hl], $3E
    and  e
    ld   c, [hl]
    and  d
    ld   d, d
    and  a
    ld   d, [hl]

label_7A21E::
    and  d
    ld   bc, label_78E48
    ld   d, [hl]
    ld   e, b
    ld   e, h
    nop
    and  h
    ld   c, b
    and  d
    db   $10 ; Undefined instruction
    ld   e, $26
    jr   z, label_7A25F
    ld   [hl], $3E
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   d, d
    and  a
    ld   b, h
    and  d
    ld   e, h
    ld   h, $2C
    jr   nc, label_7A271
    ld   [hl], $6E
    ld   h, [hl]

label_7A240::
    ld   [hl], h
    adc  a, h
    ld   h, $2C
    ld   [hl], $A7
    halt
    adc  a, [hl]
    inc  a

label_7A24A::
    ld   b, [hl]
    ld   c, d
    and  e
    ld   c, [hl]
    and  d
    ld   d, $0C
    inc  h
    ld   l, $3C
    ld   c, d
    ld   b, [hl]
    and  a
    ld   c, d
    and  d
    ld   e, b
    ldi  [hl], a
    inc  h
    jr   z, label_7A28C

label_7A25E::
    and  a

label_7A25F::
    ld   d, [hl]

label_7A260::
    and  d
    ld   h, d
    jr   c, label_7A2A2
    ld   b, h
    ld   c, d
    nop
    sbc  a, e
    inc  b
    sbc  a, c
    and  d
    ld   b, b
    ld   bc, label_78040
    sbc  a, h
    sbc  a, e

label_7A271::
    inc  b
    ld   a, $01
    ld   a, $3E
    sbc  a, h
    sbc  a, e
    inc  b
    db   $3A ; ldd  a, [hl]
    ld   bc, label_3A3A
    sbc  a, h
    sbc  a, e
    inc  b
    jr   nc, label_7A283
    jr   nc, label_7A2B4
    sbc  a, h
    sbc  a, e
    inc  b
    jr   z, label_7A28A
    jr   z, label_7A2B3
    sbc  a, h

label_7A28C::
    sbc  a, e
    inc  b
    ld   h, $01
    ld   h, $26
    sbc  a, h
    sbc  a, e
    inc  b
    inc  h
    ld   bc, label_2424
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ldi  [hl], a
    ld   bc, label_2222
    sbc  a, h
    sbc  a, e

label_7A2A2::
    ld   [bc], a
    jr   nz, label_7A2A6
    jr   nz, label_7A2C7
    sbc  a, h
    nop
    nop
    cp   e
    ld   c, d
    or   h
    ld   h, d
    ret  nc
    ld   h, d
    inc  e
    ld   c, e
    nop

label_7A2B3::
    nop

label_7A2B4::
    ld   a, l
    ld   l, l
    db   $10 ; Undefined instruction
    db   $F2 ; Undefined instruction
    ld   h, d
    add  hl, bc
    ld   l, [hl]
    db   $F2 ; Undefined instruction
    ld   h, d
    inc  b
    ld   h, e
    dec  l
    ld   l, l
    xor  b
    ld   l, [hl]
    ld   a, l
    ld   l, l
    ld   b, a

label_7A2C7::
    ld   d, c
    ld   b, a
    ld   d, c
    ld   b, a
    ld   d, c
    jr   nz, label_7A33B
    nop
    nop
    ld   a, [$FF6D]
    db   $F2 ; Undefined instruction
    ld   h, d
    pop  hl
    ld   l, l
    sub  a, h
    ld   l, [hl]
    db   $F2 ; Undefined instruction
    ld   h, d
    inc  de
    ld   l, [hl]
    ld   a, h
    ld   l, [hl]
    inc  b
    ld   h, e
    ldi  [hl], a
    ld   l, [hl]
    xor  b
    ld   l, [hl]
    ld   b, a
    ld   d, c
    call label_7876D
    ld   d, c
    ld   c, $6E
    ld   b, a
    ld   d, c
    jr   nz, label_7A35D
    nop
    nop
    and  c
    ld   l, $34
    inc  a
    ld   b, h
    ld   b, [hl]
    ld   c, h
    ld   d, h
    ld   e, h
    inc  l
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    ld   b, d
    ld   b, h
    ld   b, d
    db   $3A ; ldd  a, [hl]
    ldd  [hl], a
    nop
    and  c
    jr   c, label_7A345
    ld   b, [hl]
    ld   c, [hl]
    ld   d, b
    ld   d, [hl]
    ld   e, [hl]
    ld   h, [hl]
    nop
    nop
    reti
    ld   c, d
    add  hl, de
    ld   h, e
    add  hl, hl
    ld   h, e
    ld   d, l
    ld   h, e
    nop
    nop
    and  b
    ld   l, l
    rst  0
    ld   h, e
    dec  sp
    ld   l, [hl]
    rst  $20
    ld   h, e
    and  b
    ld   l, l
    jr   label_7A389
    rst  $38
    rst  $38
    add  hl, de
    ld   h, e
    xor  d
    ld   l, l
    ld   h, l
    ld   h, e
    xor  d
    ld   l, l
    ld   h, l
    ld   h, e
    xor  d
    ld   l, l
    adc  a, e
    ld   h, e
    xor  d
    ld   l, l
    ld   h, l
    ld   h, e
    xor  d
    ld   l, l

label_7A33B::
    ld   h, l
    ld   h, e
    xor  d
    ld   l, l
    ld   h, l
    ld   h, e
    xor  d
    ld   l, l
    adc  a, e
    ld   h, e

label_7A345::
    xor  a
    ld   l, l
    xor  c
    ld   h, e
    xor  d
    ld   l, l
    adc  a, e
    ld   h, e
    xor  a
    ld   l, l
    xor  c
    ld   h, e
    rst  $38
    rst  $38
    add  hl, hl
    ld   h, e
    ld   l, l
    ld   l, [hl]
    inc  sp
    ld   h, h
    ld   l, l
    ld   l, [hl]
    ld   d, h
    ld   h, h

label_7A35D::
    ld   l, l
    ld   l, [hl]
    ld   e, d
    ld   h, h
    rst  $38
    rst  $38
    ld   d, l
    ld   h, e
    and  d
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9D04
    sub  a, d
    nop
    ret  nz
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9D04
    or   d
    nop
    ret  nz
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9D04
    sub  a, d
    nop
    ret  nz
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $0004
    sbc  a, e
    ld   [bc], a
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9C04
    sbc  a, l
    sub  a, d
    nop
    ret  nz
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9D04
    or   d
    nop
    ret  nz
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $0004
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9D04
    sub  a, d
    nop
    ret  nz
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9D04
    ld   h, d
    nop
    ret  nz
    sbc  a, e
    ld   [bc], a
    ld   [bc], a
    ld   c, $04
    inc  c
    ld   bc, $9C04
    nop
    xor  [hl]
    ld   bc, $9B01
    ld   [bc], a
    and  c
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    inc  [hl]
    ldd  [hl], a
    and  d
    ldd  [hl], a
    xor  [hl]
    ld   bc, label_1A8
    and  d
    ld   bc, $A14A
    ldd  [hl], a
    ldd  [hl], a
    and  a
    ld   bc, label_1A5
    xor  [hl]
    ld   bc, $009C
    and  c
    ld   bc, label_79450
    ld   d, [hl]
    ld   h, h
    and  e
    ld   e, [hl]
    and  c
    ld   e, [hl]
    ld   h, d
    ld   bc, label_1AE
    and  h
    ld   bc, label_7A8A1
    ld   h, d
    ld   e, [hl]
    ld   e, h
    xor  [hl]
    ld   bc, label_2CA9
    and  b
    ld   bc, label_2CA1
    and  a
    ld   bc, label_1A5
    and  c
    ld   h, d
    ld   e, [hl]
    ld   d, d
    ld   d, b
    and  l
    ld   bc, $A401
    ld   bc, label_30A2
    and  c
    ldd  [hl], a
    ld   bc, $A100
    inc  l
    inc  l
    inc  l
    inc  l
    ld   l, $2C
    and  d
    inc  l
    xor  [hl]
    ld   bc, label_1A5
    and  c
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    inc  h
    ldi  [hl], a
    and  d
    ldi  [hl], a
    and  l
    ld   bc, label_1AE
    nop
    sbc  a, c
    xor  [hl]
    ld   bc, $9B01
    ld   [bc], a
    and  c
    ld   l, $2E
    ld   l, $2E
    jr   nc, label_7A46E
    and  d
    ld   l, $AE
    ld   bc, label_1A8
    and  d
    ld   bc, $A146
    ld   l, $2E
    and  a
    ld   bc, label_1AE
    and  l
    ld   bc, $009C
    sbc  a, e
    inc  c
    xor  b
    ld   bc, $009C
    and  c
    inc  h
    inc  h
    inc  h
    inc  h
    ld   h, $24
    inc  h
    ld   bc, label_1A5
    xor  [hl]
    ld   bc, label_1AA1
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    inc  [hl]
    ld   a, [de]

label_7A46E::
    ld   a, [de]
    ld   bc, label_1A5
    xor  [hl]
    ld   bc, $0000
    cp   e
    ld   c, d
    add  a, b
    ld   h, h
    or   h
    ld   h, h
    inc  e
    ld   c, e
    inc  e
    ld   c, e
    ld   a, a
    ld   l, [hl]
    ld   c, $6E
    ret  nz
    ld   h, h
    ret  nz
    ld   h, h
    inc  de
    ld   l, [hl]
    ret  nz
    ld   h, h
    rst  $10
    ld   h, h
    ld   [$FF64], a
    jp   [hl]
    ld   h, h
    ld   c, $6E
    db   $F2 ; Undefined instruction
    ld   h, h
    inc  de
    ld   l, [hl]
    ei
    ld   h, h
    dec  e
    ld   l, [hl]
    inc  b
    ld   h, l
    inc  de
    ld   l, [hl]
    dec  c
    ld   h, l

label_7A4A2::
    ld   c, $6E

label_7A4A4::
    ld   d, $65
    inc  de
    ld   l, [hl]
    rra
    ld   h, l
    dec  e
    ld   l, [hl]
    jr   z, label_7A513
    ld   b, d
    ld   h, l
    rst  $38
    rst  $38
    adc  a, b
    ld   h, h
    jr   nz, label_7A523
    jr   nz, label_7A525
    inc  l
    ld   l, [hl]
    ld   c, e
    ld   h, l
    rst  $38
    rst  $38
    cp   b
    ld   h, h
    and  e
    jr   z, label_7A4F5
    jr   nc, label_7A4F7
    jr   c, label_7A4F9
    jr   nc, label_7A4FB
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    jr   z, label_7A501
    jr   nc, label_7A503
    jr   c, label_7A505
    jr   nc, label_7A507
    sbc  a, h
    nop
    ld   a, [hli]
    ldd  [hl], a
    jr   nc, label_7A50D
    jr   c, label_7A50F
    jr   nc, label_7A511
    nop
    ld   a, [hli]
    ld   [hl], $32
    ld   [hl], $3C
    ld   [hl], $32
    ld   [hl], $00
    jr   z, label_7A523
    ld   [hl], $38
    ld   b, b
    jr   c, label_7A526
    jr   c, label_7A4F2

label_7A4F2::
    ldd  [hl], a
    jr   c, label_7A52B

label_7A4F5::
    jr   c, label_7A539

label_7A4F7::
    jr   c, label_7A52F

label_7A4F9::
    jr   c, label_7A4FB

label_7A4FB::
    ld   a, [hli]
    ld   [hl], $32
    ld   [hl], $3C
    ld   [hl], $32
    ld   [hl], $00
    ld   l, $36
    ldd  [hl], a

label_7A507::
    ld   [hl], $3C
    ld   [hl], $32
    ld   [hl], $00

label_7A50D::
    ld   l, $38

label_7A50F::
    ld   [hl], $38

label_7A511::
    ld   b, b
    jr   c, label_7A54A
    jr   c, label_7A516

label_7A516::
    ld   a, [hli]
    jr   c, label_7A54F
    jr   c, label_7A55D
    jr   c, label_7A553
    jr   c, label_7A51F

label_7A51F::
    inc  l
    ld   [hl], $32
    ld   [hl], $3E
    ld   [hl], $32

label_7A526::
    ld   [hl], $00
    jr   z, label_7A560
    ldd  [hl], a

label_7A52B::
    ld   [hl], $40
    ld   [hl], $32

label_7A52F::
    ld   [hl], $00
    jr   nc, label_7A569
    inc  a
    ld   b, d
    ld   c, b
    ld   c, [hl]
    ld   d, h
    ld   e, d

label_7A539::
    ld   e, b
    ld   d, h
    ld   c, [hl]
    ld   c, b
    ld   b, b
    inc  a
    ld   [hl], $30
    nop
    jr   nc, label_7A57A
    inc  a
    ld   b, d
    ld   c, b
    ld   c, [hl]
    ld   d, h
    ld   e, d

label_7A54A::
    nop
    sbc  a, e
    ld   [bc], a
    and  e
    ld   c, d

label_7A54F::
    ld   c, [hl]
    xor  [hl]
    ld   d, b
    sbc  a, h

label_7A553::
    and  l
    ld   c, [hl]
    ld   c, b
    xor  [hl]
    ld   c, d
    and  h
    ld   bc, label_78AA3
    ld   c, [hl]

label_7A55D::
    xor  [hl]
    ld   d, b
    and  e

label_7A560::
    ld   c, [hl]
    ld   d, b
    and  l
    ld   d, h
    and  h
    ld   bc, label_786A3
    ld   c, [hl]

label_7A569::
    and  l
    ld   d, h
    and  h
    ld   e, d
    xor  [hl]
    ld   e, b
    and  h
    ld   bc, label_794A5
    ld   d, h
    ld   d, [hl]
    ld   d, [hl]
    ld   e, b
    ld   e, b
    ld   bc, $0001
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    add  a, [hl]
    ld   h, l
    cp   d
    ld   h, l
    inc  e
    ld   c, e
    nop
    nop
    inc  h
    ld   l, l
    ld   a, l
    ld   l, l
    jp   z, label_D764
    ld   h, h
    rst  $10
    ld   h, h
    ld   [$FF64], a
    ld   [$FF64], a
    jp   [hl]
    ld   h, h
    jp   [hl]
    ld   h, h
    db   $F2 ; Undefined instruction
    ld   h, h
    db   $F2 ; Undefined instruction
    ld   h, h
    ei
    ld   h, h
    ei
    ld   h, h
    inc  b
    ld   h, l
    inc  b
    ld   h, l
    dec  c
    ld   h, l
    dec  c
    ld   h, l
    ld   d, $65
    ld   d, $65
    rra
    ld   h, l
    rra
    ld   h, l
    jr   z, label_7A617
    jr   z, label_7A619
    ld   sp, $FF65
    rst  $38
    adc  a, b
    ld   h, l
    ld   c, $6E
    jp   z, label_D764
    ld   h, h
    inc  de
    ld   l, [hl]
    rst  $10
    ld   h, h
    call label_E06D
    ld   h, h
    ld   a, [$E06D]
    ld   h, h
    inc  de
    ld   l, [hl]
    jp   [hl]
    ld   h, h
    ld   c, $6E
    jp   [hl]
    ld   h, h
    db   $F2 ; Undefined instruction
    ld   h, h
    inc  de
    ld   l, [hl]
    db   $F2 ; Undefined instruction
    ld   h, h
    call label_FB6D
    ld   h, h
    ld   c, $6E
    ei
    ld   h, h
    add  hl, bc
    ld   l, [hl]
    inc  b
    ld   h, l
    ld   c, $6E
    inc  b
    ld   h, l
    inc  de
    ld   l, [hl]
    dec  c
    ld   h, l
    add  hl, bc
    ld   l, [hl]
    dec  c
    ld   h, l
    ld   c, $6E
    ld   d, $65
    inc  de
    ld   l, [hl]
    ld   d, $65
    call label_1F6D
    ld   h, l
    ld   a, [label_1F6D]
    ld   h, l
    jr   z, label_7A669
    and  $6D
    jr   z, label_7A66D
    call label_316D
    ld   h, l
    rst  $38
    rst  $38
    cp   d
    ld   h, l
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    inc  e
    ld   c, e
    dec  de
    ld   h, [hl]

label_7A617::
    inc  e
    ld   c, e

label_7A619::
    nop
    nop
    push af
    ld   l, l
    dec  h
    ld   h, [hl]
    jr   nz, label_7A68E
    rst  $38
    rst  $38
    dec  de
    ld   h, [hl]
    and  d
    ld   [bc], a
    ld   c, $0C
    and  a
    ld   bc, label_1A6
    and  c
    ld   [bc], a
    and  d
    ld   [bc], a
    ld   c, $A1
    inc  c
    jr   label_7A636

label_7A636::
    nop
    cp   e
    ld   c, d
    ld   b, c
    ld   h, [hl]
    ld   c, l
    ld   h, [hl]
    inc  e
    ld   c, e
    nop
    nop
    add  hl, bc
    ld   l, [hl]
    inc  h
    ld   l, l
    db   $10 ; Undefined instruction
    ld   d, e
    ld   h, [hl]
    rst  $38
    rst  $38
    ld   b, a
    ld   h, [hl]
    call label_FF6D
    rst  $38
    ld   b, a
    ld   h, [hl]
    and  e
    ldd  [hl], a
    ld   b, [hl]
    ld   e, b
    ld   h, [hl]
    ld   [hl], b
    ld   bc, label_2EA3
    ld   b, d
    ld   d, h
    ld   h, d
    ld   l, h
    ld   bc, $0000
    jp   z, label_7AD4A
    ld   h, [hl]
    ld   a, e
    ld   h, [hl]

label_7A669::
    inc  e
    ld   c, e
    nop
    nop

label_7A66D::
    add  hl, bc
    ld   l, [hl]
    db   $10 ; Undefined instruction
    add  a, l
    ld   h, [hl]
    sbc  a, e
    ld   h, [hl]
    xor  e
    ld   h, [hl]
    rst  $38
    rst  $38
    ld   [hl], l
    ld   h, [hl]
    ld   c, $6E
    add  a, l
    ld   h, [hl]
    adc  a, a
    ld   h, [hl]
    rst  $38
    rst  $38
    ld   a, a
    ld   h, [hl]
    and  c
    adc  a, [hl]
    adc  a, h
    add  a, h
    ld   a, h
    halt
    ld   l, h
    ld   h, h

label_7A68E::
    nop
    sbc  a, e
    inc  bc
    and  a
    ld   [hl], h
    ld   bc, $A29C
    ld   [hl], h
    ld   [hl], h
    and  h
    ld   bc, $A400
    ld   bc, label_1A6
    sbc  a, e
    ld   [bc], a
    and  a

label_7A6A2::
    ld   d, h
    ld   bc, $A29C
    ld   d, h
    ld   d, h
    and  h
    ld   bc, $9B00
    inc  bc
    and  a
    ld   d, h
    ld   bc, $A29C
    ld   d, h
    ld   d, h
    and  h
    ld   bc, $0000
    jp   z, label_C24A
    ld   h, [hl]
    call nc, label_E666
    ld   h, [hl]
    nop
    nop
    ld   a, l
    ld   l, l
    db   $10 ; Undefined instruction
    or   $66
    and  h
    ld   l, [hl]
    add  hl, bc
    ld   l, [hl]
    ld   b, l
    ld   h, a
    xor  b
    ld   l, [hl]
    rst  $38
    rst  $38
    jp   nz, label_A066
    ld   l, l
    or   $66
    db   $10 ; Undefined instruction
    and  h
    ld   l, [hl]
    cp   [hl]
    ld   l, l
    add  hl, de
    ld   h, a
    xor  b
    ld   l, [hl]
    rst  $38
    rst  $38
    call nc, label_1066
    ld   l, l
    jr   label_7A757
    and  h
    ld   l, [hl]
    ld   l, b
    ld   l, [hl]
    nop
    ld   h, a
    xor  b
    ld   l, [hl]
    rst  $38
    rst  $38
    and  $66
    and  c
    adc  a, [hl]
    adc  a, h
    add  a, h
    ld   a, h
    halt
    ld   l, h
    ld   h, h
    nop
    sbc  a, e
    ld   [bc], a
    and  e
    ld   bc, $88A6
    and  c
    ld   bc, label_1AE
    ld   bc, $A501
    ld   bc, $A39C
    ld   bc, $88A6
    and  c
    ld   bc, label_1AE
    ld   bc, $9D00
    ld   h, c
    add  a, [hl]
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  e
    ld   h, h
    ld   l, b
    ld   l, d
    add  a, d
    and  l
    ld   bc, label_1A3
    add  a, b
    ld   a, h
    ld   l, d
    and  l
    ld   bc, $A39C
    ld   h, h
    ld   l, b
    ld   l, d
    ld   bc, label_7A801
    ld   h, h
    ld   e, b
    ld   e, [hl]
    ld   h, h
    xor  b
    ld   bc, label_7A8A3
    ld   l, d
    ld   l, [hl]
    ld   [hl], b
    adc  a, b
    xor  [hl]
    ld   bc, $0001
    sbc  a, e
    inc  b
    and  d
    ld   d, h
    ld   e, h
    ld   c, h
    ld   d, d
    ld   d, h
    ld   d, d
    ld   c, h
    ld   b, h
    sbc  a, h
    sbc  a, e
    inc  b
    ld   d, d
    ld   e, b
    ld   c, b
    ld   d, b

label_7A757::
    ld   d, d
    ld   e, b
    ld   h, b
    ld   l, b
    sbc  a, h
    sbc  a, e
    inc  b
    ld   d, b
    ld   e, b
    ld   b, [hl]
    ld   c, h
    ld   d, b
    ld   c, h
    ld   b, [hl]
    ld   b, b
    sbc  a, h
    sbc  a, e
    inc  bc
    ld   d, d
    ld   e, b
    ld   c, b
    ld   d, b
    ld   d, d
    ld   e, b
    ld   h, b
    ld   l, b
    sbc  a, h
    ld   d, d
    ld   e, b
    ld   c, b
    ld   d, b
    nop
    nop
    jp   z, label_824A
    ld   h, a
    adc  a, d
    ld   h, a
    inc  e
    ld   c, e
    nop
    nop
    add  hl, bc
    ld   l, [hl]
    sub  a, $5D
    rst  $38
    rst  $38
    add  a, d
    ld   h, a
    inc  de
    ld   l, [hl]
    sbc  a, d
    ld   l, [hl]
    rst  $38
    rst  $38
    sub  a, d
    ld   h, a
    jr   nz, label_7A7F2
    ld   c, l
    ld   e, [hl]
    ld   e, a
    ld   e, [hl]
    rst  $38
    rst  $38
    sub  a, d
    ld   h, a
    nop
    reti
    ld   c, d
    and  a
    ld   h, a
    db   $FD ; Undefined instruction
    ld   h, a
    db   $D3 ; Undefined instruction
    ld   h, a
    nop
    nop
    db   $10 ; Undefined instruction
    ld   a, b
    ld   l, l
    db   $DB
    ld   l, b
    db   $DB
    ld   l, b
    db   $DB
    ld   l, b
    db   $DB
    ld   l, b
    db   $DB
    ld   l, b
    db   $DB
    ld   l, b
    ld   a, b
    ld   l, l
    db   $DB
    ld   l, b
    db   $DB
    ld   l, b
    ld   a, l
    ld   l, l
    sub  a, a
    ld   l, b
    ld   a, b
    ld   l, l
    db   $DB
    ld   l, b
    call nz, label_2068
    ld   l, l
    jr   nz, label_7A838
    jr   nz, label_7A83A
    jr   nz, label_7A83C
    rst  $38
    rst  $38
    xor  c
    ld   h, a
    ld   [hl], e
    ld   l, c
    ld   l, b
    ld   l, [hl]
    ld   d, [hl]
    ld   l, b
    ld   l, l
    ld   l, [hl]
    ld   d, [hl]
    ld   l, b
    ld   l, b
    ld   l, [hl]
    dec  h
    ld   l, b
    ld   [hl], a
    ld   l, [hl]
    dec  h
    ld   l, b
    ld   l, b
    ld   l, [hl]
    add  hl, sp
    ld   l, b
    ld   l, l
    ld   l, [hl]
    ld   h, [hl]
    ld   l, b
    ld   l, b
    ld   l, [hl]
    ld   [hl], e
    ld   l, b
    ld   l, l

label_7A7F2::
    ld   l, [hl]
    ld   a, a
    ld   l, b
    ld   [hl], a
    ld   l, [hl]
    adc  a, e
    ld   l, b
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    ld   h, a
    add  hl, bc
    ld   l, [hl]
    db   $FC ; Undefined instruction
    ld   l, b

label_7A801::
    db   $FC ; Undefined instruction
    ld   l, b
    db   $FC ; Undefined instruction
    ld   l, b
    db   $FC ; Undefined instruction
    ld   l, b
    db   $FC ; Undefined instruction
    ld   l, b
    db   $FC ; Undefined instruction
    ld   l, b
    add  hl, bc
    ld   l, [hl]
    db   $FC ; Undefined instruction
    ld   l, b
    db   $FC ; Undefined instruction
    ld   l, b
    sub  a, a
    ld   l, b
    db   $FC ; Undefined instruction
    ld   l, b
    ld   c, $6E
    call nz, label_968
    ld   l, [hl]
    dec  [hl]
    ld   l, c
    ld   a, b
    ld   l, l
    ld   h, l
    ld   l, c
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    ld   h, a
    and  e
    ld   d, b
    ld   h, h
    ld   h, d
    ld   l, [hl]
    and  h
    ld   bc, label_1A2
    ld   h, h
    ld   h, d
    ld   d, b
    and  e
    ld   c, [hl]
    ld   h, b
    ld   e, [hl]
    ld   l, h
    and  l
    ld   bc, $A300

label_7A83A::
    ld   c, h
    ld   e, h

label_7A83C::
    ld   e, d
    ld   l, d
    and  l
    ld   bc, label_78AA3
    ld   e, d
    ld   e, b
    ld   l, b
    and  l
    ld   bc, label_788A3
    ld   e, b
    ld   d, [hl]
    ld   h, [hl]
    and  l
    ld   bc, label_78AA3
    ld   e, d
    ld   e, b
    ld   l, b
    and  l
    ld   bc, $9900
    and  e
    ld   c, h
    ld   e, h
    ld   e, d
    ld   l, d
    and  l
    ld   bc, label_78AA3
    ld   e, d
    ld   e, b
    ld   l, b
    and  l

label_7A864::
    ld   bc, $9A00
    and  d
    jr   nc, label_7A89E
    ld   [hl], $44
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   e, h
    and  l
    ld   bc, $A200
    jr   nc, label_7A8AA
    ld   [hl], $42
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   e, d
    and  l
    ld   bc, $A200
    inc  [hl]
    jr   c, label_7A8BD
    ld   c, b
    ld   c, h
    ld   d, b
    ld   d, d
    ld   h, b
    and  l
    ld   bc, $A200
    inc  [hl]
    jr   c, label_7A8C9
    ld   b, [hl]
    ld   c, h
    ld   d, b
    ld   d, d
    ld   e, [hl]
    and  l
    ld   bc, $9B00
    ld   [bc], a
    and  d
    ld   bc, label_3C38
    jr   c, label_7A8DB
    and  a
    ld   bc, $9B9C

label_7A8A3::
    ld   [bc], a
    and  d
    ld   bc, label_3C36
    ld   [hl], $3C

label_7A8AA::
    and  a
    ld   bc, $9B9C
    ld   [bc], a
    and  d
    ld   bc, label_3C38
    ld   a, $46
    and  a
    ld   bc, $9B9C
    ld   [bc], a
    and  d
    ld   bc, label_3C36
    ld   a, $4E
    and  a
    ld   bc, $009C
    sbc  a, e
    ld   [bc], a
    ld   a, $36
    ld   a, $40
    ld   b, [hl]
    ld   c, b
    ld   b, [hl]
    ld   b, h
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ldd  [hl], a
    jr   c, label_7A914
    ld   b, d
    ld   c, b
    ld   c, d
    ld   c, b
    ld   b, d
    sbc  a, h
    nop

label_7A8DB::
    and  d
    ld   b, h
    ld   c, h
    ld   c, d
    ld   c, h
    sbc  a, l
    jr   nz, label_7A8E3

label_7A8E3::
    add  a, b
    sbc  a, e
    inc  bc
    and  d
    ld   b, h
    ld   c, h
    ld   c, d
    ld   c, h
    sbc  a, h
    sbc  a, e
    inc  bc
    ld   b, d
    ld   c, b
    ld   c, d
    ld   c, b
    sbc  a, h
    sbc  a, l
    stop
    add  a, b
    ld   b, d
    ld   c, b
    ld   c, d
    ld   c, b
    nop
    and  d
    ld   b, h
    ld   c, h
    ld   c, d
    ld   c, h
    sbc  a, l
    scf
    nop
    add  a, b
    ld   b, h
    ld   c, h
    ld   c, d
    ld   c, h
    sbc  a, l
    ld   d, e
    nop
    add  a, b
    ld   b, h
    ld   c, h
    ld   c, d
    ld   c, h
    sbc  a, l
    ld   h, h
    nop

label_7A914::
    add  a, b
    ld   b, h
    ld   c, h
    ld   c, d
    ld   c, h
    sbc  a, l
    ld   d, e

label_7A91B::
    nop
    add  a, b
    ld   b, d
    ld   c, b
    ld   c, d
    ld   c, b
    sbc  a, l
    scf
    nop
    add  a, b
    ld   b, d
    ld   c, b
    ld   c, d
    ld   c, b
    sbc  a, l
    daa
    nop
    add  a, b
    sbc  a, e
    ld   [bc], a
    ld   b, d
    ld   c, b
    ld   c, d
    ld   c, b
    sbc  a, h
    nop
    and  d
    ld   bc, label_3430
    ld   [hl], $44
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   h, b
    ld   h, h
    ld   h, [hl]
    ld   [hl], h
    and  h
    ld   bc, label_1A2
    jr   nc, label_7A97C
    ld   [hl], $42
    ld   c, b
    ld   c, h
    ld   c, [hl]
    ld   h, b
    ld   h, h
    ld   h, [hl]
    ld   [hl], d
    and  h

label_7A952::
    ld   bc, label_1A2
    inc  [hl]
    jr   c, label_7A992
    ld   c, b
    ld   c, h
    ld   d, b
    ld   d, d
    ld   h, h
    ld   l, b
    ld   l, d
    ld   a, b
    and  h
    ld   bc, label_1A2
    nop
    inc  [hl]
    jr   c, label_7A9A2
    ld   b, [hl]
    ld   c, h
    ld   d, b
    ld   d, d
    ld   h, h
    ld   l, b
    ld   l, d
    halt
    ld   bc, $9B00
    jr   label_7A91B
    ld   bc, $009C
    nop
    reti
    ld   c, d

label_7A97C::
    add  a, h
    ld   l, c
    adc  a, [hl]
    ld   l, c
    sbc  a, b
    ld   l, c
    nop
    nop
    rst  $38
    ld   l, l
    and  d
    ld   l, c
    ld   c, d
    ld   l, [hl]
    or   h
    ld   l, c
    nop
    nop
    rst  $38
    ld   l, l
    or   a
    ld   l, c

label_7A992::
    ld   c, d
    ld   l, [hl]
    ret
    ld   l, c
    nop
    nop
    ld   d, h
    ld   l, [hl]
    call z, label_79969
    ld   l, [hl]
    jp  c, label_69
    nop

label_7A9A2::
    and  c
    ld   bc, label_1A4
    and  e
    inc  e
    jr   nz, label_7A952
    ldi  [hl], a
    and  e
    ld   bc, label_2622
    and  a
    ld   a, [hli]
    and  d
    ld   l, $00
    xor  [hl]
    ld   a, [de]
    nop
    and  c
    ld   bc, label_1A4
    and  e
    ld   l, $30
    xor  b
    inc  [hl]
    and  e
    ld   bc, label_3834
    and  a
    db   $3A ; ldd  a, [hl]
    and  d
    ld   a, $00
    xor  [hl]
    ld   b, d
    nop
    sbc  a, e
    ld   [bc], a
    sbc  a, c
    and  c
    ld   c, $9A
    and  l
    ld   c, $A3
    ld   c, $A6
    ld   bc, $009C
    and  c
    ld   bc, label_14AE
    nop
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    ld   [$F469], a
    ld   l, c
    cp   $69
    nop
    nop
    ld   a, l
    ld   l, l
    db   $10 ; Undefined instruction
    ld   [rOBPI], sp
    rst  $38
    ld    hl, sp+$69
    add  a, a
    ld   l, l
    ld   [label_126A], sp
    ld   l, d
    rst  $38
    rst  $38
    jr   nc, label_7AA6B
    jr   label_7AA6D
    ld   [hl], a
    ld   l, [hl]
    inc  e
    ld   l, d
    rst  $38
    rst  $38
    jr   nc, label_7AA75
    and  c
    add  a, b
    ld   a, b
    ld   [hl], d
    ld   l, d
    ld   l, b
    ld   h, b
    ld   e, d
    ld   d, b
    nop
    and  c
    ld   d, h
    ld   e, h
    ld   h, d
    ld   l, d
    ld   l, h
    ld   [hl], h
    ld   a, d
    add  a, d
    nop
    sbc  a, c
    and  d
    ld   d, h
    ld   d, h
    nop
    nop
    reti
    ld   c, d
    ld   d, h
    ld   l, d
    inc  l
    ld   l, d
    ld   a, h
    ld   l, d
    nop
    nop
    and  b
    ld   l, l
    sbc  a, e
    ld   l, d
    and  l
    ld   l, d
    or   b
    ld   l, [hl]
    sub  a, [hl]
    ld   l, l
    xor  b
    ld   l, d
    db   $10 ; Undefined instruction
    ld   a, l
    ld   l, l
    ld   [label_246A], sp
    ld   l, l
    dec  l
    ld   l, l
    sub  a, [hl]
    ld   l, d
    ld   a, b
    ld   l, e
    and  b
    ld   l, l
    jr   z, label_7AAB5
    add  hl, bc
    ld   l, [hl]
    ld   b, b
    ld   l, e
    daa
    ld   l, l
    rst  $38
    rst  $38
    ldd  [hl], a
    ld   l, d
    ld   a, l
    ld   l, l
    db   $10 ; Undefined instruction
    sbc  a, e
    ld   l, d
    dec  l
    ld   l, l
    or   b
    ld   l, [hl]
    ldi  [hl], a
    ld   l, e
    add  a, a
    ld   l, l

label_7AA62::
    ld   [label_206A], sp
    ld   l, l
    jr   nz, label_7AAD5
    jr   nz, label_7AAD7

label_7AA6A::
    jr   nz, label_7AAD9
    db   $10 ; Undefined instruction
    ld   a, l
    ld   l, l
    jr   z, label_7AADD
    daa
    ld   l, l
    dec  l

label_7AA75::
    ld   l, l
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    ld   e, h
    ld   l, d
    jr   label_7AAEB
    inc  h
    ld   l, l
    ld   l, l
    ld   l, [hl]
    or   b
    ld   l, [hl]
    db   $10 ; Undefined instruction
    ld   h, a
    ld   e, l
    ld   b, [hl]
    ld   l, e
    dec  d
    ld   l, l
    dec  l
    ld   l, l
    jr   label_7AAFD
    inc  h
    ld   l, l
    rst  $38
    rst  $38
    add  a, b
    ld   l, d
    sbc  a, l
    jp   nz, label_C083
    nop
    and  c
    ld   b, h
    ld   c, b
    ld   c, h
    ld   d, b
    ld   d, [hl]
    ld   e, h

label_7AAA2::
    ld   h, b

label_7AAA3::
    ld   h, h
    nop
    ld   l, b
    ld   l, [hl]
    nop
    sbc  a, l
    or   c
    add  a, e
    add  a, b
    and  [hl]
    ld   bc, label_7A864
    ld   l, d
    sbc  a, l
    add  a, c
    add  a, e
    add  a, b

label_7AAB5::
    and  d
    ld   a, $42
    ld   b, h
    ld   c, h
    ld   d, d
    and  c
    ld   bc, $B19D
    add  a, e
    add  a, b
    and  [hl]
    ld   h, h
    ld   l, b
    ld   l, d
    sbc  a, l
    add  a, c
    add  a, e
    add  a, b
    and  d
    jr   nc, label_7AB0A
    ld   b, h
    ld   c, h
    ld   d, b
    sbc  a, l
    or   c
    add  a, e
    add  a, b
    ld   l, b
    ld   h, h

label_7AAD5::
    ld   e, d
    ld   h, b

label_7AAD7::
    sbc  a, l
    add  a, c

label_7AAD9::
    add  a, e
    add  a, b
    db   $3A ; ldd  a, [hl]
    ld   b, d

label_7AADD::
    ld   h, h
    ld   d, b
    and  a
    ld   bc, label_34A2
    inc  a
    ld   b, d
    ld   c, b
    ld   c, h
    sbc  a, l
    or   c
    add  a, e
    add  a, b

label_7AAEB::
    ld   h, h
    ld   l, b
    ld   l, d
    sbc  a, l
    add  a, c
    add  a, e
    add  a, b
    and  d
    ld   a, $42
    ld   b, h
    ld   c, h
    ld   d, d
    sbc  a, l
    or   c
    add  a, e
    add  a, b
    ld   h, b

label_7AAFD::
    ld   l, d
    ld   [hl], h
    sbc  a, l
    add  a, c
    add  a, e
    add  a, b
    and  d
    jr   nc, label_7AB44
    ld   b, h
    ld   c, h
    ld   d, [hl]
    sbc  a, l

label_7AB0A::
    or   c
    add  a, e
    add  a, b
    ld   [hl], d
    ld   l, [hl]
    ld   [hl], d
    sbc  a, l
    add  a, c
    add  a, e
    add  a, b
    and  d
    db   $3A ; ldd  a, [hl]
    ld   b, d
    ld   c, b
    ld   d, b
    ld   d, d
    ld   e, d
    ld   h, b
    ld   l, b
    ld   a, b
    ld   bc, label_190
    nop
    sbc  a, e
    ld   de, label_1A4
    sbc  a, h
    nop
    and  c
    inc  e
    ldi  [hl], a
    ld   a, [hli]
    jr   nc, label_7AB66
    db   $3A ; ldd  a, [hl]
    ld   b, d
    ld   c, b
    ld   d, b
    ld   c, b
    ld   b, d
    db   $3A ; ldd  a, [hl]
    jr   c, label_7AB67
    ld   a, [hli]
    ldi  [hl], a
    jr   label_7AB61
    inc  l
    inc  [hl]
    ld   a, $44
    nop
    ld   c, h
    ld   d, [hl]
    ld   h, b
    xor  c

label_7AB44::
    ld   bc, $A900
    ld   bc, label_1A3
    and  e
    add  a, b
    ld   a, h
    ld   [hl], d
    and  a
    ld   [hl], d
    and  h
    ld   [hl], h
    and  a
    ld   bc, $86A3
    add  a, d
    ld   [hl], d
    and  a
    ld   [hl], d
    and  e
    ld   [hl], h
    and  d
    ld   bc, label_7B4A3
    and  e

label_7AB61::
    ld   a, b
    ld   bc, label_7A6A2
    ld   l, h

label_7AB66::
    ld   a, b

label_7AB67::
    and  h
    ld   [hl], d
    and  a
    ld   bc, label_7AAA2
    and  h
    ld   a, h
    ld   bc, label_1A2
    and  a
    ld   a, d
    adc  a, h
    and  e
    adc  a, d
    nop
    sbc  a, l
    jp   nz, label_C083
    and  e
    add  a, b
    ld   a, h
    ld   [hl], d
    and  d
    ld   [hl], d
    sbc  a, l
    ld   [hl], d
    nop
    add  a, b
    ld   h, $34
    sbc  a, l
    jp   nz, label_C083
    ld   [hl], h
    sbc  a, l
    ld   [hl], d
    nop
    add  a, b
    and  c
    ld   a, $42
    ld   b, h
    ld   c, h
    ld   d, [hl]
    ld   e, d
    ld   e, h
    ld   l, d
    inc  [hl]
    ld   b, d
    ld   d, b
    ld   h, b
    sbc  a, l
    jp   nz, label_C083
    and  e
    add  a, [hl]
    add  a, d
    ld   [hl], d
    and  d
    ld   [hl], d
    sbc  a, l
    ld   [hl], d
    nop
    add  a, b
    ld   a, $4C
    sbc  a, l
    jp   nz, label_C083
    ld   [hl], h
    sbc  a, l
    ld   [hl], d
    nop
    add  a, b
    and  c
    ld   d, [hl]
    ld   e, d
    ld   e, h
    ld   h, h
    sbc  a, l
    jp   nz, label_C083
    and  e
    ld   [hl], h
    ld   a, b
    sbc  a, l
    ld   [hl], d
    nop
    add  a, b
    and  c
    ld   c, [hl]
    ld   d, h
    ld   e, d
    ld   h, b
    sbc  a, l
    jp   nz, label_C083
    and  d
    ld   h, [hl]
    ld   l, h
    ld   a, b
    ld   [hl], d
    sbc  a, l
    ld   [hl], d
    nop
    add  a, b
    and  c
    ld   bc, label_79A52
    ld   h, b
    ld   l, d
    ld   [hl], d
    ld   a, b
    ld   a, [hl]
    and  e
    add  a, d
    sbc  a, l
    jp   nz, label_C083
    and  d
    ld   l, d
    ld   a, h
    sbc  a, l
    ld   [hl], d
    nop
    add  a, b
    and  c
    inc  l
    inc  [hl]
    db   $3A ; ldd  a, [hl]
    ld   b, d
    ld   b, h
    ld   c, h
    ld   d, d
    ld   e, d
    ld   c, h
    ld   d, d
    ld   e, d
    ld   e, h
    ld   d, d
    ld   e, d
    ld   e, h
    ld   h, h
    sbc  a, l
    jp   nz, label_C083
    and  a
    ld   a, d
    adc  a, h
    and  e
    adc  a, d
    nop
    jp   z, label_144A
    ld   l, h
    ld   e, $6C
    ld   h, $6C
    nop
    nop
    sbc  a, e
    ld   l, l
    ld   b, b
    ld   l, h
    ld   a, [hli]
    ld   l, l
    rst  $38
    rst  $38
    ldi  [hl], a
    ld   l, h
    cp   c
    ld   l, l
    ld   l, $6C
    jr   c, label_7AC90
    nop
    nop
    ld   l, l
    ld   l, [hl]
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    jr   nz, label_7AC9A
    and  c
    ld   d, d
    ld   e, d
    ld   h, b
    ld   l, b
    ld   l, d
    ld   [hl], d
    ld   a, b
    add  a, b
    nop
    and  e
    ld   bc, $8AA1
    sub  a, b
    ld   bc, $0001
    sbc  a, e
    ld   [bc], a
    and  c
    db   $3A ; ldd  a, [hl]
    ld   b, d
    ld   c, b
    ld   b, d
    sbc  a, h
    nop
    nop
    cp   e
    ld   c, d
    ld   d, h
    ld   l, h
    ld   h, [hl]
    ld   l, h
    inc  e
    ld   c, e
    nop
    nop
    pop  hl
    ld   l, l
    inc  bc
    ld   l, l
    ld   a, [$FF6D]
    inc  bc
    ld   l, l
    inc  bc
    ld   l, l
    pop  hl
    ld   l, l
    inc  bc
    ld   l, l
    rst  $38
    rst  $38
    ld   d, h
    ld   l, h
    sbc  a, e
    ld   l, l
    jp   [hl]
    ld   l, h
    adc  a, h
    ld   l, l

label_7AC6C::
    sbc  a, l
    ld   l, [hl]
    jp   [hl]
    ld   l, h
    sub  a, h
    ld   l, [hl]
    jp   [hl]
    ld   l, h
    sbc  a, e
    ld   l, l
    sub  a, a
    ld   l, [hl]
    jp   [hl]
    ld   l, h
    ld   a, h
    ld   l, [hl]
    rst  $38
    rst  $38
    ld   h, [hl]
    ld   l, h
    nop
    cp   e
    ld   c, d
    adc  a, e
    ld   l, h
    and  l
    ld   l, h
    db   $D3 ; Undefined instruction
    ld   l, h
    pop  hl
    ld   l, h
    pop  hl
    ld   l, l
    inc  bc
    ld   l, l
    ld   a, [$FF6D]
    inc  bc
    ld   l, l
    rst  $38
    ld   l, l
    inc  bc
    ld   l, l
    inc  bc
    ld   l, l
    inc  bc

label_7AC9A::
    ld   l, l
    inc  bc
    ld   l, l
    inc  bc
    ld   l, l
    and  b
    ld   l, [hl]
    rst  $38
    rst  $38
    ld   b, a
    ld   e, a
    sbc  a, e
    ld   l, l
    jp   [hl]
    ld   l, h
    adc  a, h
    ld   l, l
    sbc  a, l
    ld   l, [hl]
    jp   [hl]
    ld   l, h
    db   $EB ; Undefined instruction
    ld   l, l
    sub  a, h
    ld   l, [hl]
    jp   [hl]
    ld   l, h
    sub  a, a
    ld   l, [hl]
    jp   [hl]
    ld   l, h
    adc  a, h
    ld   l, l
    ld   a, h
    ld   l, [hl]
    or   $6C
    cp   c
    ld   l, l
    sbc  a, l
    ld   l, [hl]
    or   $6C
    db   $EB ; Undefined instruction
    ld   l, l
    sub  a, h
    ld   l, [hl]
    or   $6C
    ld   a, h
    ld   l, [hl]
    and  b
    ld   l, [hl]
    rst  $38
    rst  $38
    ld   e, l
    ld   e, a
    jr   nz, label_7AD42
    jr   nz, label_7AD44
    jr   nz, label_7AD46
    dec  d
    ld   l, l
    and  b
    ld   l, [hl]
    rst  $38
    rst  $38
    ld   [hl], a
    ld   e, a
    ld   a, [bc]
    ld   l, l
    and  b
    ld   l, [hl]
    rst  $38
    rst  $38
    adc  a, e
    ld   e, a
    sbc  a, e
    ld   [bc], a
    and  c
    ld   b, $0C
    ld   [de], a
    ld   a, [de]
    ld   e, $24
    ld   a, [hli]
    ldd  [hl], a
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    and  c
    ld   e, $24
    ld   a, [hli]
    ldd  [hl], a
    ld   [hl], $3C
    ld   b, d
    ld   c, d
    sbc  a, h
    nop
    sbc  a, c
    and  d
    ld   b, $06
    xor  b
    ld   bc, $9B00
    rlca
    and  l
    ld   bc, $009C
    and  c
    ld   bc, label_1A9
    nop
    and  l
    ld   bc, $A400
    ld   bc, $A500
    ld   bc, label_1A8
    nop
    and  l
    ld   bc, $0001
    and  d
    ld   bc, $A600
    ld   bc, $A100
    ld   bc, $A000
    ld   bc, label_1500
    ld   l, l
    rst  $38
    rst  $38
    jr   nc, label_7ADA3
    sbc  a, c
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38

label_7AD42::
    rst  $38
    rst  $38

label_7AD44::
    nop
    nop

label_7AD46::
    nop
    nop
    rst  $38
    rst  $38

label_7AD4A::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    nop
    nop
    nop
    nop
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    nop
    nop
    nop
    nop
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    nop

label_7AD6D::
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
    stop
    add  a, b
    nop
    sbc  a, l
    jr   nz, label_7AD80

label_7AD80::
    add  a, b
    nop
    sbc  a, l
    inc  h
    add  a, e
    ret  nz
    nop
    sbc  a, l
    ld   b, [hl]
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    add  a, c
    add  a, e
    ret  nz
    nop
    sbc  a, l
    and  d
    add  a, e
    ret  nz
    nop
    sbc  a, l
    sub  a, c
    add  a, e
    add  a, b
    nop
    sbc  a, l
    ld   d, d
    add  a, e
    ret  nz
    nop
    sbc  a, l
    ld   h, d
    nop

label_7ADA3::
    add  a, b
    nop
    sbc  a, l
    add  a, d
    nop
    add  a, b
    nop
    sbc  a, l
    ld   h, d
    nop
    ret  nz
    nop
    sbc  a, l
    sub  a, d
    nop
    ret  nz
    nop
    sbc  a, l
    or   d
    nop
    ret  nz
    nop
    sbc  a, l
    pop  bc
    add  a, e
    nop
    nop
    sbc  a, l
    ld   b, l
    nop
    add  a, b
    nop
    sbc  a, l
    ld   d, e
    nop
    add  a, b
    nop
    sbc  a, l
    sub  a, e
    nop
    nop
    nop
    sbc  a, l
    ld   h, h
    nop
    add  a, b
    nop
    sbc  a, l
    add  a, h
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    or   h
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    db   $E4 ; Undefined instruction
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    ld   [hl], l
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    and  l
    nop
    add  a, b
    nop
    sbc  a, l
    push af
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    and  l
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    and  l
    ld   b, [hl]
    add  a, b
    nop
    sbc  a, l
    add  a, l
    nop
    add  a, b
    nop
    sbc  a, l
    rst  $20
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    rla
    nop
    add  a, b
    nop
    sbc  a, l
    daa
    nop
    add  a, b
    nop
    sbc  a, l
    scf
    nop
    add  a, b
    nop
    sbc  a, l
    ld   b, a
    nop
    add  a, b
    nop
    sbc  a, l
    add  a, [hl]
    nop
    ret  nz
    nop
    sbc  a, l
    ld   h, [hl]
    nop
    add  a, b
    nop
    sbc  a, l
    add  a, a
    nop
    add  a, b
    nop
    sbc  a, l
    ld   c, b
    nop
    add  a, b
    nop
    sbc  a, l
    jr   c, label_7AE2F

label_7AE2F::
    add  a, c
    nop
    sbc  a, l
    ld   c, b
    add  a, [hl]
    add  a, b
    nop
    sbc  a, l
    ld   c, b
    nop
    nop
    nop
    sbc  a, l
    ld   e, b
    nop
    nop
    nop
    sbc  a, l
    xor  b
    add  a, [hl]
    ret  nz
    nop
    sbc  a, l
    adc  a, b
    nop
    nop
    nop
    sbc  a, l
    rra
    nop
    nop
    nop
    sbc  a, l
    ld   e, a
    nop
    add  a, b
    nop
    sbc  a, l
    jr   c, label_7AEC4
    jr   nz, label_7AE59

label_7AE59::
    sbc  a, l
    ld   c, b
    ld   l, l
    jr   nz, label_7AE5E

label_7AE5E::
    sbc  a, l
    ld   c, b
    ld   l, l
    ld   b, b
    nop
    sbc  a, l
    ld   e, b
    ld   l, l
    jr   nz, label_7AE68

label_7AE68::
    sbc  a, l
    ld   e, b
    ld   l, l
    ld   b, b
    nop
    sbc  a, l

label_7AE6E::
    ld   e, b
    ld   l, l
    ld   h, b
    nop
    sbc  a, l
    ld   l, b
    ld   l, l
    ld   b, b
    nop
    sbc  a, l
    ld   l, b
    ld   l, l
    ld   h, b
    nop
    sbc  a, a
    nop
    nop
    sbc  a, a
    jr   label_7AE82

label_7AE82::
    sbc  a, a
    ld   d, $00
    sbc  a, a
    ld   c, $00
    sbc  a, a
    inc  c
    nop
    sbc  a, a
    ld   a, [bc]
    nop
    sbc  a, a
    ld   [$9F00], sp
    ld   b, $00
    sbc  a, a
    inc  b
    nop
    sbc  a, a
    ld   [bc], a
    nop
    sbc  a, a
    ret  nc
    nop
    sbc  a, a
    cp   $00
    sbc  a, [hl]
    sbc  a, l

label_7AEA2::
    ld   c, d
    nop
    sbc  a, [hl]
    xor  h
    ld   c, d
    nop
    sbc  a, [hl]
    jp   z, label_4A
    sbc  a, [hl]
    reti
    ld   c, d
    nop
    sbc  a, [hl]
    db   $E8 ; add  sp, d
    ld   c, d
    nop
    sbc  a, [hl]
    rst  $30
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

label_7AEC4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    reti
    ld   c, d
    dec  bc
    ld   [hl], b
    inc  e
    ld   c, e
    inc  de
    ld   [hl], b
    nop
    nop
    dec  e
    ld   [hl], b
    sub  a, a
    ld   [hl], b
    ret  nz
    ld   [hl], b
    nop
    nop
    ld   h, $70
    sub  a, a
    ld   [hl], b
    sub  a, c
    ld   [hl], b
    ret  nz
    ld   [hl], b
    nop
    nop
    sbc  a, l
    jr   nz, label_7B020

label_7B020::
    add  a, c
    and  d
    ld   bc, label_1A9
    nop
    sbc  a, l
    rrca
    ld   [hl], e
    ld   bc, $0094
    nop
    reti
    ld   c, d
    scf
    ld   [hl], b
    ccf
    ld   [hl], b
    ld   b, e
    ld   [hl], b
    nop
    nop
    ld   c, l
    ld   [hl], b
    sub  a, a
    ld   [hl], b
    ret  nz
    ld   [hl], b
    nop
    nop
    ld   e, b
    ld   [hl], b
    nop
    nop
    adc  a, c
    ld   [hl], b
    sub  a, a
    ld   [hl], b
    sub  a, c
    ld   [hl], b
    ret  nz
    ld   [hl], b
    nop
    nop
    sbc  a, l
    jr   nz, label_7B050

label_7B050::
    add  a, c
    and  d
    ld   bc, label_1A9
    xor  [hl]
    ld   bc, $9D00
    ld   b, a
    nop
    add  a, b
    sub  a, [hl]
    sbc  a, e

label_7B05E::
    ld   a, [bc]
    and  e
    ld   [hl], h
    ld   h, [hl]
    ld   l, d
    ld   a, b
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   l, [hl]
    ld   h, b
    ld   h, [hl]
    ld   l, [hl]
    ld   [hl], b
    ld   h, b
    ld   l, d
    ld   [hl], b
    sbc  a, h

label_7B070::
    ld   [hl], h
    ld   h, d
    ld   l, d
    ld   [hl], h
    ld   a, d
    ld   l, b
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], b
    ld   h, b
    ld   h, [hl]
    ld   [hl], b
    ld   l, d
    ld   e, [hl]
    ld   h, h
    halt
    ld   [bc], a
    ld   [hl], h
    ld   h, [hl]
    ld   l, d
    ld   a, b
    sbc  a, h
    sub  a, l
    nop
    sbc  a, l
    rrca
    ld   [hl], e
    ld   bc, label_1AE
    sub  a, h
    nop
    sbc  a, l
    pop  hl
    ld   [hl], d
    ld   bc, $0094
    sub  a, [hl]
    and  d
    ld   bc, label_3430
    xor  b
    ld   [hl], $A2
    jr   nc, label_7B0D5

label_7B0A1::
    xor  b
    ld   [hl], $A2
    inc  [hl]
    jr   nc, label_7B0CD

label_7B0A7::
    and  a
    inc  l
    and  l
    jr   nc, label_7B04F
    ld   bc, label_30A2
    inc  [hl]
    xor  b
    ld   [hl], $A2
    inc  l
    ld   [hl], $A8
    ld   b, b
    and  d
    ld   a, $3A
    and  l
    ld   a, $01
    and  d
    ld   bc, $A300
    ld   bc, label_7A064
    ld   d, [hl]
    and  a
    ld   d, [hl]
    and  l
    ld   e, b
    and  d
    ld   l, d
    ld   h, [hl]
    ld   h, h

label_7B0CD::
    ld   h, b
    ld   d, [hl]
    ld   d, d
    ld   d, [hl]
    ld   h, b
    and  a
    ld   e, b
    and  d

label_7B0D5::
    ld   e, b
    and  h
    ld   e, h
    and  d
    ld   bc, label_7924A
    ld   e, h
    xor  b
    ld   d, [hl]
    and  d
    ld   bc, $A84E
    ld   h, b
    and  a
    ld   bc, label_7B05E
    ld   l, [hl]
    ld   bc, label_1A4
    and  l
    ld   bc, $0095
    nop
    reti
    ld   c, d
    ccf
    ld   [hl], b
    ei
    ld   [hl], b
    ld   b, e
    ld   [hl], b
    nop
    nop
    rlca
    ld   [hl], c
    inc  d
    ld   [hl], c
    inc  hl
    ld   [hl], c
    inc  hl
    ld   [hl], c
    inc  sp
    ld   [hl], c
    nop
    nop
    sbc  a, l
    ld   [hl], c
    add  a, d
    add  a, b
    sub  a, [hl]
    sbc  a, e
    inc  b
    and  d
    ld   c, [hl]
    ld   d, [hl]
    ld   h, h
    ld   e, h
    sbc  a, h
    sbc  a, e
    inc  b
    ld   d, d
    ld   e, b
    ld   h, [hl]
    ld   h, b
    sbc  a, h
    sbc  a, e
    inc  b
    ld   c, [hl]
    ld   d, [hl]
    ld   h, h
    ld   h, b
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    ld   c, b
    ld   c, [hl]
    ld   h, b
    ld   d, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   c, b
    ld   d, d
    ld   h, b
    ld   e, b
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    ld   b, h
    ld   c, d
    ld   e, b
    ld   d, d
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, h
    ld   c, d
    ld   d, [hl]
    ld   d, b
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, b
    ld   c, b
    ld   d, [hl]
    ld   c, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ld   b, b
    ld   b, [hl]
    ld   d, d
    ld   c, h
    sbc  a, h
    sbc  a, e
    inc  b
    ld   c, [hl]
    ld   d, [hl]
    ld   h, h
    ld   e, h
    sbc  a, h
    sub  a, l
    nop
    nop
    reti
    ld   c, d
    ld   h, e
    ld   [hl], c
    ei
    ld   [hl], b
    ld   b, e
    ld   [hl], b
    nop
    nop
    ld   l, l
    ld   [hl], c
    halt
    halt
    adc  a, d
    ld   [hl], c
    nop
    nop
    sbc  a, l
    add  a, a
    nop
    add  a, b
    sub  a, [hl]
    and  l
    adc  a, h
    adc  a, h
    nop
    sbc  a, l
    add  a, a
    nop
    add  a, b
    and  l
    adc  a, h
    adc  a, h
    sbc  a, l
    scf
    nop
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  e
    ld   [hl], h
    ld   h, [hl]
    ld   l, d
    ld   a, b
    sbc  a, h
    nop
    sbc  a, l
    halt
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  h
    sub  a, b
    add  a, [hl]
    sub  a, b
    adc  a, b
    sbc  a, h
    adc  a, h
    adc  a, b
    add  a, [hl]
    adc  a, h
    sub  a, b
    adc  a, b
    adc  a, [hl]
    adc  a, b
    sbc  a, l
    add  a, a
    nop
    add  a, b
    and  l
    adc  a, h
    adc  a, h
    nop
    nop

label_7B1A7::
    reti
    ld   c, d
    ld   h, e
    ld   [hl], c
    ei
    ld   [hl], b
    ld   b, e
    ld   [hl], b
    or   c
    ld   [hl], c
    or   l
    ld   [hl], c
    nop
    nop
    sbc  a, e
    ld   a, [bc]
    and  c
    rra
    rra
    rra

label_7B1BB::
    rra
    and  d
    rra
    and  e
    inc  h
    and  d
    rra
    and  e
    inc  h
    and  c
    rra
    rra
    rra
    rra
    and  e
    inc  h
    and  c
    rra
    rra
    rra
    rra
    and  e
    inc  h
    sbc  a, h
    nop
    nop
    reti
    ld   c, d
    rst  $18
    ld   [hl], c
    rst  $28
    ld   [hl], c
    ld   b, e
    ld   [hl], b
    or   c
    ld   [hl], c
    ld   l, l
    ld   [hl], c
    halt
    halt
    scf
    ld   [hl], d
    inc  hl
    ld   [hl], c
    inc  hl
    ld   [hl], c
    inc  sp
    ld   [hl], c
    nop
    nop
    rst  $30
    ld   [hl], c
    inc  b
    ld   [hl], d
    inc  de
    ld   [hl], d
    nop
    nop
    sbc  a, l
    add  hl, de
    ld   b, l
    ld   b, b
    sub  a, [hl]
    sbc  a, e
    ld   [bc], a
    and  e
    ld   e, $2C
    ld   h, $2C
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    ldi  [hl], a
    jr   nc, label_7B231
    jr   nc, label_7B1A7
    sbc  a, e
    ld   [bc], a
    ld   e, $2C
    ld   h, $2C
    sbc  a, h
    nop
    sbc  a, e
    ld   [bc], a
    and  e
    jr   label_7B23E
    ld   e, $26
    jr   label_7B244
    ldi  [hl], a
    jr   z, label_7B1BB
    inc  l
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    inc  l
    jr   nz, label_7B240
    jr   nz, label_7B250
    ld   e, $18
    ld   e, $28
    inc  e
    ld   d, $1C
    sbc  a, e
    ld   [bc], a

label_7B231::
    ld   e, $2C
    ld   h, $2C
    sbc  a, h
    nop
    sbc  a, l
    ld   h, c
    add  a, d
    add  a, b
    nop
    nop
    reti

label_7B23E::
    ld   c, d
    ei

label_7B240::
    ld   [hl], b
    ld   b, a
    ld   [hl], d
    ld   b, e

label_7B244::
    ld   [hl], b
    ld   d, e
    ld   [hl], d
    ld   l, l
    ld   [hl], c
    halt
    halt
    ld   a, l
    ld   [hl], d
    inc  de

label_7B250::
    ld   [hl], d
    nop
    nop
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    sub  a, l
    ld   [hl], d
    add  a, d
    ld   [hl], d
    sub  a, l
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d

label_7B274::
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    add  a, d
    ld   [hl], d
    nop
    nop
    sbc  a, l
    add  hl, de
    ld   b, l
    ld   b, b
    nop
    sbc  a, e

label_7B283::
    inc  bc
    and  d
    ld   a, [de]
    xor  c
    dec  d
    xor  l
    ld   bc, label_15A9
    xor  l
    ld   bc, label_15A9
    sbc  a, h
    and  d
    ld   a, [de]
    ld   a, [de]
    nop
    sbc  a, e
    ld   [bc], a
    and  c
    rra
    rra
    rra
    rra
    and  d
    rra
    and  e
    inc  h
    and  d
    rra
    and  e
    inc  h
    nop
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    inc  e
    ld   c, e
    or   b
    ld   [hl], d
    or   [hl]
    ld   [hl], d
    nop
    nop
    cp   d
    ld   [hl], d
    ret  z
    ld   [hl], d
    nop
    nop
    jp   label_72
    nop
    sbc  a, l
    jr   nz, label_7B2BD

label_7B2BD::
    ld   b, c
    and  c
    ld   bc, label_1A0
    nop
    sbc  a, l
    pop  hl
    ld   [hl], d
    ld   bc, $A294
    ld   h, b
    ld   h, h
    xor  b
    ld   h, [hl]
    and  d
    ld   h, b
    ld   h, h
    and  h
    ld   h, [hl]
    and  d
    ld   h, h
    and  [hl]
    ld   h, b
    and  e

label_7B2D7::
    ld   d, [hl]
    xor  [hl]
    ld   l, [hl]
    sbc  a, d
    sbc  a, e
    jr   nz, label_7B283
    ld   bc, $009C
    ld   bc, label_7A635
    ld   d, e
    db   $10 ; Undefined instruction
    ld   b, [hl]
    adc  a, d
    ld   bc, label_7A635
    ld   d, e
    db   $10 ; Undefined instruction
    ld   b, [hl]
    adc  a, d
    nop
    rst  $30
    ld   c, d
    inc  e
    ld   c, e
    db   $FC ; Undefined instruction
    ld   [hl], d
    ld   [bc], a
    ld   [hl], e
    nop
    nop
    ld   b, $73
    inc  h
    ld   [hl], e
    nop
    nop
    rra
    ld   [hl], e
    nop
    nop
    sbc  a, l
    jr   nz, label_7B309

label_7B309::
    ld   b, c
    and  c
    ld   bc, label_1A0
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
    cp   $9D
    rrca
    ld   [hl], e
    ld   bc, $A194
    jr   nc, label_7B35B
    and  h
    ld   [hl], $A3
    ld   bc, label_30A1
    inc  [hl]
    and  d
    ld   [hl], $34
    and  [hl]
    jr   nc, label_7B2D7
    ld   h, $A2
    ld   bc, label_3EA5
    sbc  a, e
    jr   nz, label_7B2EA
    ld   bc, $009C
    nop
    reti
    ld   c, d
    inc  e
    ld   c, e
    ld   c, d
    ld   [hl], e
    ld   d, h
    ld   [hl], e
    nop

label_7B349::
    nop
    ld   e, d
    ld   [hl], e
    ld   e, d
    ld   [hl], e
    ld   l, d
    ld   [hl], e
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    add  a, b
    ld   [hl], e
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    sbc  a, l

label_7B35B::
    add  a, c
    nop
    add  a, b
    and  c
    ld   [hl], h
    ld   h, [hl]
    ld   l, d
    ld   a, b
    sbc  a, l
    and  [hl]
    nop
    add  a, b
    and  h
    ld   [hl], h
    nop

label_7B36A::
    sbc  a, l
    add  a, d
    nop
    add  a, b
    and  d
    ld   [hl], h
    ld   h, [hl]
    and  [hl]
    ld   l, d
    sbc  a, l
    add  a, l
    nop
    add  a, b
    and  e
    ld   a, b
    sbc  a, l
    and  [hl]
    nop
    add  a, b
    xor  [hl]
    ld   [hl], h
    nop
    sbc  a, l
    inc  c
    ld   [hl], l
    inc  hl
    sbc  a, c
    sbc  a, e
    ld   [bc], a
    and  c
    ld   l, d
    ld   e, h
    ld   h, b
    ld   l, [hl]
    and  h
    ld   l, d
    sbc  a, h
    and  d
    ld   l, d
    ld   e, h
    and  [hl]
    ld   h, b
    and  e
    ld   l, [hl]
    xor  [hl]
    ld   l, d
    sbc  a, e
    jr   nz, label_7B349
    ld   bc, $009C
    jr   label_7B33D
    ld   c, d
    inc  e
    ld   c, e
    xor  c
    ld   [hl], e
    xor  a
    ld   [hl], e
    nop
    nop
    or   e
    ld   [hl], e
    pop  de
    ld   [hl], e
    nop
    nop
    call z, label_73
    nop
    sbc  a, l
    stop
    add  a, b
    and  e
    ld   bc, label_1A1
    nop
    ld   b, [hl]
    ld   a, c
    sbc  a, b
    ld   h, h
    ld   b, e

label_7B3C1::
    db   $10 ; Undefined instruction
    inc  [hl]
    ld   b, [hl]
    ld   a, c
    sbc  a, b
    ld   h, h
    ld   b, e
    db   $10 ; Undefined instruction
    inc  [hl]
    sbc  a, l
    cp   h
    ld   [hl], e
    jr   nz, label_7B36A
    and  e
    ld   h, d
    ld   h, b
    ld   e, b
    ld   d, d
    and  [hl]
    ld   c, d
    ld   c, b
    ld   c, d
    ld   d, d
    ld   e, b
    xor  e
    ld   h, b
    ld   e, b
    ld   d, d
    ld   c, d
    and  d
    ld   c, b
    ld   c, d
    ld   d, d
    ld   e, b
    ld   h, b
    ld   e, b
    ld   d, d
    ld   c, d
    ld   c, b
    ld   c, d
    ld   d, d
    ld   e, b
    sbc  a, e
    ld   [bc], a
    ld   e, [hl]
    ld   d, [hl]
    ld   d, b
    ld   c, b
    ld   b, [hl]
    ld   c, b
    ld   d, b
    ld   d, [hl]
    sbc  a, h
    ld   e, b
    ld   d, b
    ld   c, d
    ld   b, d
    ld   b, b
    ld   b, d
    ld   c, d
    ld   d, b
    xor  e
    ld   d, h
    ld   c, h
    ld   b, [hl]
    ld   a, $A6
    inc  a
    ld   a, $A3
    ld   b, [hl]
    ld   c, h
    xor  d
    ld   bc, label_790A2
    sbc  a, e
    jr   nz, label_7B3C1
    ld   bc, $009C
    nop
    cp   e
    ld   c, d
    ld   hl, label_2774
    ld   [hl], h
    dec  l
    ld   [hl], h
    nop
    nop
    inc  sp
    ld   [hl], h
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    ld   e, b
    ld   [hl], h
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    adc  a, h
    ld   [hl], h
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    sbc  a, l
    add  a, c
    nop
    add  a, b
    and  c
    ld   bc, label_7AEA2
    sbc  a, l
    pop  bc
    nop
    add  a, b
    and  d
    ld   l, [hl]
    and  [hl]
    ld   bc, label_1A4
    sbc  a, l
    and  d
    nop
    add  a, b
    and  d
    ld   bc, label_7A4A3
    ld   l, d
    ld   [hl], h
    ld   l, d
    ld   a, b
    sbc  a, l
    and  a
    nop
    add  a, b
    xor  [hl]
    adc  a, h
    nop
    sbc  a, l
    ld   h, c
    nop
    add  a, b
    and  d
    ld   l, [hl]
    sbc  a, l
    and  c
    nop
    add  a, b
    and  d
    ld   l, [hl]
    sbc  a, l
    push hl
    nop
    add  a, b
    xor  b
    ld   l, [hl]
    sbc  a, l
    and  d
    nop
    add  a, b
    and  e
    ld   h, b

label_7B470::
    ld   h, [hl]
    ld   l, [hl]
    ld   [hl], d
    ld   l, [hl]
    add  a, d
    sbc  a, l
    and  a
    nop
    add  a, b
    xor  [hl]
    add  a, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    sbc  a, l
    ld   a, h
    ld   [hl], h
    inc  hl
    sbc  a, c
    and  c
    ld   h, h
    ld   h, h
    ld   h, h
    ld   h, h
    xor  b
    ld   h, h
    and  d
    ld   d, [hl]
    ld   e, d
    ld   e, h
    ld   a, b
    ld   h, h
    ld   l, d
    ld   l, b
    ld   h, b
    ld   h, h

label_7B4A2::
    ld   l, [hl]

label_7B4A3::
    ld   a, b
    add  a, d
    xor  [hl]
    ld   a, h

label_7B4A7::
    nop
    nop
    jp   z, label_1C4A
    ld   c, e
    or   e
    ld   [hl], h
    rst  8
    ld   [hl], h
    nop
    nop
    db   $D3 ; Undefined instruction
    ld   [hl], h
    db   $EC ; Undefined instruction
    ld   [hl], h
    db   $D3 ; Undefined instruction
    ld   [hl], h
    cp   $74
    db   $D3 ; Undefined instruction
    ld   [hl], h
    cp   $74
    db   $D3 ; Undefined instruction
    ld   [hl], h
    db   $EC ; Undefined instruction
    ld   [hl], h
    db   $D3 ; Undefined instruction
    ld   [hl], h
    cp   $74
    db   $D3 ; Undefined instruction
    ld   [hl], h
    dec  b
    ld   [hl], l
    ld   b, b
    ld   [hl], l
    nop
    nop
    inc  e
    ld   [hl], l
    nop
    nop
    sbc  a, l
    ld   hl, $8000
    and  c
    ld   a, b
    sbc  a, l
    ld   b, c
    nop
    add  a, b
    and  c
    ld   a, b
    sbc  a, l
    ld   [hl], c
    nop
    add  a, b
    and  c
    ld   a, b
    sbc  a, l
    and  c
    nop
    add  a, b
    and  c
    ld   a, b
    nop
    sbc  a, l
    and  c
    nop
    add  a, b
    and  d

label_7B4F1::
    ld   a, b
    sbc  a, l
    jp   label_8000
    and  e
    ld   a, b
    sbc  a, l
    add  a, d
    nop
    add  a, b
    and  d
    ld   a, b
    sbc  a, l
    jp   nc, label_8000
    and  e
    ld   a, b
    nop
    sbc  a, l
    db   $E3 ; Undefined instruction
    nop
    add  a, b
    xor  [hl]
    ld   a, b
    nop
    nop
    inc  c
    nop
    inc  c
    nop
    inc  c
    nop
    inc  c
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    sbc  a, l
    inc  c
    ld   [hl], l
    jr   nz, label_7B4BA
    sbc  a, e
    ld   [bc], a
    and  c
    add  a, [hl]
    add  a, [hl]
    add  a, [hl]
    add  a, [hl]
    and  d
    add  a, [hl]
    and  e
    add  a, [hl]
    and  d
    add  a, [hl]
    and  e
    add  a, [hl]
    and  c
    add  a, [hl]
    add  a, [hl]
    add  a, [hl]
    add  a, [hl]
    and  e
    add  a, [hl]
    and  c
    add  a, [hl]
    add  a, [hl]
    add  a, [hl]
    add  a, [hl]
    and  e
    add  a, [hl]
    sbc  a, h
    sbc  a, d
    sbc  a, e
    jr   nz, label_7B4F1
    ld   bc, $009C
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    inc  e
    ld   c, e
    ld   d, c
    ld   [hl], l
    ld   e, c
    ld   [hl], l
    nop
    nop
    ld   e, a
    ld   [hl], l
    ld   a, l
    ld   [hl], l
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    ld   a, b
    ld   [hl], l
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    sbc  a, l
    jr   nz, label_7B562

label_7B562::
    add  a, b
    and  d
    ld   bc, label_1A9
    nop
    adc  a, b
    adc  a, b
    adc  a, b
    add  a, h
    nop
    nop
    nop
    nop
    adc  a, b
    adc  a, b
    adc  a, b
    add  a, h
    nop
    nop
    nop
    nop
    sbc  a, l
    ld   l, b
    ld   [hl], l
    nop
    sub  a, h
    and  d
    ld   c, b
    ld   c, h
    xor  b
    ld   c, [hl]
    and  d
    ld   c, b
    ld   c, h
    and  e
    ld   c, [hl]
    ld   c, h
    ld   c, b
    and  b
    ld   bc, label_3EA3
    and  c
    ld   bc, label_796A5
    nop
    nop
    reti
    ld   c, d
    inc  e
    ld   c, e
    sbc  a, l
    ld   [hl], l
    inc  e
    ld   c, e
    xor  l
    ld   [hl], l
    or   l
    ld   [hl], l
    or   l
    ld   [hl], l
    bit  6, l
    or   l
    ld   [hl], l
    or   l
    ld   [hl], l
    bit  6, l
    rst  $38
    rst  $38

label_7B5AB::
    cp   e
    ld   a, b
    ldh  [$FF0C], a
    ld   [hl], l
    ldh  [$FF0C], a
    ld   [hl], l
    ld   a, [$0075]
    nop
    sbc  a, l
    and  c
    nop
    add  a, b
    sub  a, a
    and  d
    ld   [hl], $9D
    ld   h, c
    nop
    add  a, b
    xor  c
    inc  l
    xor  l
    ld   bc, label_2CA9
    xor  l
    ld   bc, label_2CA9
    nop
    and  c
    inc  l
    sbc  a, l
    and  c
    nop
    add  a, b
    and  c
    ld   [hl], $9D
    ld   h, c
    nop
    add  a, b
    and  c
    inc  l
    inc  l
    sbc  a, l
    and  c
    nop
    add  a, b
    and  d
    ld   [hl], $36
    nop
    sbc  a, e
    ld   [bc], a
    and  d
    rst  $38
    xor  c
    dec  d
    xor  l
    ld   bc, label_15A9
    xor  l
    ld   bc, label_15A9
    sbc  a, h
    and  c
    dec  d
    rst  $38
    dec  d
    dec  d
    and  d
    rst  $38
    rst  $38
    nop
    sbc  a, e
    jr   nz, label_7B5AB
    ld   bc, $009C
    nop
    reti
    ld   c, d
    dec  bc
    halt
    halt
    halt
    nop
    daa
    halt
    halt
    halt
    halt
    rst  $38
    dec  c
    halt
    halt
    halt
    halt
    rst  $38
    rla
    halt
    halt
    rst  $38
    dec  c
    halt
    jr   nz, label_7B62A

label_7B62A::
    add  a, b
    and  c
    ld   bc, label_1A9
    nop
    sbc  a, l
    ld   h, b
    ld   hl, $A280
    ld   bc, label_7A460
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
    ld   l, [hl]
    ld   bc, label_1A7
    nop
    and  e
    ld   a, h
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
    and  a
    ld   [hl], b
    and  d
    ld   [hl], b
    and  h
    ld   [hl], h
    and  d
    ld   bc, label_7AA62
    ld   [hl], h
    xor  b
    ld   l, [hl]
    and  d
    ld   bc, $A566
    ld   a, b
    and  d
    ld   bc, label_7B6A7

label_7B684::
    adc  a, b
    add  a, [hl]
    ld   bc, label_1A5
    nop
    sbc  a, l
    ld   l, b
    ld   l, l
    ld   h, b
    and  e
    ld   bc, label_1A1
    nop
    nop
    reti
    ld   c, d
    sbc  a, [hl]
    halt
    halt
    halt
    nop
    cp   [hl]
    halt
    ld   [hl], c

label_7B6A2::
    inc  d
    ld   [hl], c
    inc  hl
    ld   [hl], c
    inc  hl

label_7B6A7::
    ld   [hl], c
    inc  sp
    ld   [hl], c
    rst  $38
    rst  $38
    and  b
    halt
    halt
    halt
    halt
    rst  $38
    xor  [hl]
    halt
    halt
    rst  $38
    cp   b
    halt
    add  hl, de
    ld   b, d
    ld   b, b
    and  a
    ld   bc, label_1A2
    nop
    and  d
    jr   nc, label_7B6FE
    xor  b
    ld   [hl], $A2
    inc  l
    ld   [hl], $A8
    ld   b, b
    and  d
    ld   a, $3A
    xor  [hl]
    ld   a, $A4
    ld   bc, label_1A7
    nop
    ld   bc, $9A37
    cp   e
    cp   e
    cp   e
    and  [hl]
    ld   hl, label_3701
    sbc  a, d
    cp   e
    cp   e
    cp   e
    and  [hl]
    ld   hl, $DB9D
    halt
    sbc  a, e
    ld   [label_1A5], sp
    sbc  a, h
    xor  b
    ld   bc, label_7AAA3
    ld   h, [hl]
    and  [hl]
    ld   e, h
    and  c
    ld   bc, label_79CA7
    xor  b
    ld   h, b
    and  e
    ld   bc, label_7B0A1
    ld   bc, label_16E
    ld   l, d
    ld   bc, label_166
    ld   e, h
    ld   bc, label_158
    ld   e, h
    ld   bc, label_166
    and  [hl]
    ld   h, b
    ld   bc, label_7A0A2
    and  a
    ld   h, d
    and  e
    ld   bc, label_792A1
    ld   bc, label_158
    ld   h, d
    ld   bc, label_79CA4
    and  a
    ld   bc, label_796A2
    xor  b
    ld   h, [hl]
    and  a
    ld   bc, label_7A4A3
    and  d
    ld   bc, label_79EA3
    and  d
    ld   bc, label_79CA3
    and  h
    ld   bc, label_1A5
    nop
    nop
    ld   b, $4B
    ld   c, b
    ld   [hl], a
    ld   c, h
    ld   [hl], a
    ld   d, b
    ld   [hl], a
    ld   d, h
    ld   [hl], a
    ld   e, b
    ld   [hl], a
    nop
    nop
    and  e
    ld   [hl], a
    nop
    nop
    daa
    ld   a, b
    nop
    nop
    adc  a, h
    ld   a, b
    nop
    nop
    sbc  a, l
    ld   h, d
    nop
    nop
    and  c
    ld   e, $22
    inc  h
    and  [hl]
    ld   h, $A1
    ld   h, $28
    ld   a, [hli]
    and  [hl]
    inc  l
    and  c
    inc  l
    jr   nc, label_7B79E
    inc  [hl]

label_7B76D::
    and  e
    ld   [hl], $97
    inc  a
    sbc  a, b
    sbc  a, l
    ld   b, c
    nop
    add  a, b
    sbc  a, e

label_7B777::
    ld   b, $A2
    ld   a, b
    and  c

label_7B77B::
    ld   a, [hl]
    and  d
    ld   [hl], h
    ld   a, [hl]
    ld   a, b
    ld   a, [hl]
    and  c
    ld   a, b
    and  d
    ld   [hl], h
    ld   a, [hl]
    sbc  a, h
    sbc  a, l
    ld   h, c
    nop
    ld   b, b
    and  [hl]
    ld   [hl], b
    and  c
    ld   [hl], b
    ld   l, h
    and  d
    ld   [hl], h
    ld   [hl], b
    ld   [hl], b
    and  c
    ld   [hl], b
    and  d
    ld   l, h
    ld   [hl], h
    adc  a, b
    adc  a, b
    add  a, h
    and  a
    adc  a, b

label_7B79E::
    sub  a, a
    and  e
    inc  l
    sbc  a, b
    nop
    sbc  a, l
    add  a, c
    nop
    ld   b, b
    and  c
    ld   a, $40
    ld   b, d
    and  [hl]
    ld   b, h
    and  c
    ld   b, h
    ld   b, [hl]
    ld   c, b
    and  [hl]
    ld   c, d
    and  c
    ld   c, d
    ld   c, [hl]
    ld   d, d
    ld   d, h
    and  h
    ld   d, [hl]
    xor  [hl]
    ld   bc, $A197
    ld   bc, label_78AA2
    and  c
    ld   c, d
    and  d
    ld   b, b

label_7B7C5::
    and  c
    jr   nc, label_7B7F8
    sbc  a, b
    and  [hl]
    jr   nc, label_7B76D
    jr   nc, label_7B7FA
    and  d
    ldd  [hl], a
    jr   nc, label_7B802
    and  c
    jr   nc, label_7B777
    inc  l
    ldd  [hl], a
    and  [hl]
    jr   nc, label_7B77B
    jr   nc, label_7B808
    and  d
    ldd  [hl], a
    and  d
    jr   nc, label_7B778
    ld   c, d
    and  c
    ld   c, d
    and  d

label_7B7E5::
    ld   b, b
    and  c
    jr   nc, label_7B819
    sbc  a, b
    and  [hl]
    ld   [hl], $A1
    ld   [hl], $32

label_7B7EF::
    and  d
    db   $3A ; ldd  a, [hl]
    ld   [hl], $36

label_7B7F3::
    and  c
    ld   [hl], $A2
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]

label_7B7F8::
    and  [hl]
    ld   [hl], $A1
    ld   [hl], $32
    and  d

label_7B7FE::
    db   $3A ; ldd  a, [hl]
    and  d

label_7B800::
    ld   [hl], $97

label_7B802::
    ld   c, d
    and  c
    ld   c, d
    and  d
    ld   b, b
    and  c

label_7B808::
    jr   nc, label_7B83A

label_7B80A::
    sbc  a, b
    and  [hl]
    db   $10 ; Undefined instruction

label_7B80E::
    db   $10 ; Undefined instruction
    and  d
    inc  d
    db   $10 ; Undefined instruction
    and  c
    db   $10 ; Undefined instruction
    inc  c
    inc  d

label_7B819::
    db   $10 ; Undefined instruction
    inc  c
    and  a
    db   $10 ; Undefined instruction
    and  c
    nop
    add  a, b
    sub  a, a
    and  e
    inc  a
    sbc  a, b
    nop
    sbc  a, l
    rrca
    ld   [hl], e
    jr   nz, label_7B7C5
    and  c
    ld   c, [hl]
    ld   d, d
    ld   d, h
    and  [hl]
    ld   d, [hl]
    and  c
    ld   d, [hl]
    ld   e, b
    ld   e, d
    and  [hl]
    ld   e, h
    and  c
    ld   e, h

label_7B83A::
    ld   h, b
    ld   h, d
    ld   h, h
    and  h
    ld   h, [hl]
    sbc  a, e
    ld   [bc], a
    and  [hl]
    jr   z, label_7B7E5
    jr   z, label_7B86A
    and  d
    inc  l
    jr   z, label_7B872
    and  c
    jr   z, label_7B7EF
    inc  h
    inc  l
    and  [hl]
    jr   z, label_7B7F3
    jr   z, label_7B878
    and  d
    inc  l
    jr   z, label_7B7FE
    ld   bc, label_1A3
    sbc  a, h
    and  [hl]
    jr   nc, label_7B800
    jr   nc, label_7B88D
    and  d
    ldd  [hl], a
    jr   nc, label_7B895
    and  c
    jr   nc, label_7B80A
    inc  l
    ldd  [hl], a

label_7B86A::
    and  [hl]
    jr   nc, label_7B80E
    jr   nc, label_7B89B
    and  d
    ldd  [hl], a
    jr   nc, label_7B819
    ld   bc, label_1A3
    and  [hl]
    ld   b, b

label_7B878::
    and  c
    ld   b, b

label_7B87A::
    inc  a
    and  d
    ld   b, h
    ld   b, b

label_7B87E::
    ld   b, b
    and  c
    ld   b, b
    and  d
    inc  a
    ld   b, h
    ld   b, b
    ld   b, b
    inc  a
    and  a
    ld   b, b
    and  e
    ld   bc, $A500

label_7B88D::
    ld   bc, label_1A3
    rst  $38
    sbc  a, e
    ld   b, $A1
    ld   a, [de]

label_7B895::
    dec  d
    dec  d
    ld   a, [de]
    dec  d
    dec  d
    rst  $38

label_7B89B::
    ld   a, [de]
    ld   a, [de]
    dec  d
    dec  d
    ld   a, [de]
    dec  d

label_7B8A1::
    dec  d

label_7B8A2::
    rst  $38
    rst  $38
    sbc  a, h
    and  [hl]
    rst  $38
    and  c
    rst  $38
    rst  $38
    and  d
    rst  $38
    rst  $38
    rst  $38
    and  c
    rst  $38
    and  d
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    and  a
    rst  $38
    and  e
    rst  $38
    nop
    pop  bc
    ld   a, b
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    sbc  a, e
    jr   nz, label_7B872
    ld   bc, $009C
    call label_FF78
    rst  $38
    rst  0
    ld   a, b
    sbc  a, e
    jr   nz, label_7B87E
    ld   bc, $009C
    nop
    reti
    ld   c, d
    sbc  a, $78
    db   $E4 ; Undefined instruction
    ld   a, b
    ld   [$0078], a
    nop
    db   $F2 ; Undefined instruction
    ld   a, b
    rst  $38
    rst  $38
    sbc  a, $78
    ld   h, b
    ld   a, c
    rst  $38
    rst  $38
    db   $E4 ; Undefined instruction
    ld   a, b
    or   a
    ld   a, c
    cp   [hl]
    ld   a, c
    rst  $38
    rst  $38
    db   $EC ; Undefined instruction
    ld   a, b
    sbc  a, l
    ld   b, d
    add  a, d
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  d
    ld   b, b
    ld   c, [hl]
    ld   e, h
    ld   h, b
    and  h
    ld   bc, label_780A2
    ld   d, d
    ld   h, b
    ld   h, d
    and  h
    ld   bc, $A29C
    ld   b, b
    ld   c, [hl]
    ld   e, h
    ld   h, b
    and  h
    ld   bc, label_780A2
    ld   c, h
    ld   e, h
    ld   e, [hl]
    and  h
    ld   bc, label_784A2
    ld   d, d
    ld   h, b
    ld   h, d
    and  h
    ld   bc, label_782A2
    ld   c, b
    ld   c, [hl]
    ld   d, h
    ld   d, d
    and  a
    ld   bc, label_784A2
    ld   c, h
    ld   d, d
    ld   e, b
    and  h
    ld   bc, label_78AA2
    ld   d, b
    ld   d, [hl]
    ld   e, h
    and  h
    ld   bc, label_788A2
    ld   c, [hl]
    ld   d, [hl]
    ld   e, h
    and  h
    ld   bc, label_788A2
    ld   c, [hl]
    ld   d, [hl]
    ld   e, b
    and  h
    ld   bc, label_784A2
    ld   c, d
    ld   d, d
    ld   e, b
    and  h
    ld   bc, label_784A2
    ld   c, h
    ld   d, d
    ld   e, b
    and  h
    ld   bc, label_788A2
    ld   c, [hl]
    ld   d, [hl]
    ld   c, [hl]
    ld   b, [hl]
    ld   c, h
    ld   d, d
    ld   c, h
    ld   b, h
    ld   c, d
    ld   d, d
    ld   c, d
    ld   b, h
    ld   c, d
    ld   d, b

label_7B95E::
    ld   c, d
    nop
    sbc  a, l
    ld   d, b
    ld   b, h
    add  a, b
    sbc  a, e
    ld   [bc], a
    and  h
    ld   h, [hl]
    ld   e, b
    ld   e, h
    and  e
    ld   bc, label_7A0A2
    ld   h, d
    sbc  a, h
    and  e
    ld   h, b
    ld   h, [hl]
    and  h
    ld   [hl], h
    and  e
    ld   bc, label_7B470
    ld   [hl], b
    ld   h, [hl]
    and  d
    ld   h, d
    ld   h, b
    and  h
    ld   e, h
    ld   bc, label_1A2
    ld   h, b
    ld   h, d
    ld   h, [hl]
    and  h
    ld   l, d
    ld   e, b
    ld   d, [hl]
    and  e
    ld   bc, label_79CA2
    ld   l, d
    and  h
    ld   h, [hl]
    ld   d, [hl]
    ld   e, b
    and  e
    ld   bc, label_798A2
    ld   d, [hl]
    and  e
    ld   d, d
    ld   e, b
    and  h
    ld   h, b
    and  e
    ld   bc, label_7985C
    ld   d, b
    and  h
    ld   c, [hl]
    xor  [hl]
    ld   bc, label_1100
    ld   de, label_1011
    nop
    nop
    nop
    nop
    ld   de, label_1111
    stop
    nop
    nop
    nop
    sbc  a, l
    and  a
    ld   a, c
    jr   nz, label_7B95E
    ld   bc, $9B00
    ld   [bc], a
    and  h
    ld   h, [hl]
    ld   e, b
    ld   e, h
    and  e
    ld   bc, label_7A0A2
    ld   h, d
    sbc  a, h
    and  e
    ld   h, b
    ld   h, [hl]
    and  a
    ld   [hl], h
    ld   bc, label_7B0A3
    ld   [hl], h
    ld   [hl], b
    ld   h, [hl]
    and  d
    ld   h, d
    ld   h, b
    and  a
    ld   e, h
    and  h
    ld   bc, label_1A2
    ld   bc, label_7A260
    ld   h, [hl]
    and  h
    ld   l, d
    ld   e, b
    and  a
    ld   d, [hl]
    ld   bc, label_79CA2
    ld   l, d
    and  h
    ld   h, [hl]
    ld   d, [hl]
    and  a
    ld   e, b
    ld   bc, label_798A2
    ld   d, [hl]
    and  e
    ld   d, d

label_7B9F6::
    ld   e, b
    and  a
    ld   h, b
    ld   bc, label_79CA3
    ld   e, b
    ld   d, b
    and  a
    ld   c, [hl]
    and  d
    ld   bc, label_1AE
    nop
    nop
    jp   z, label_104A
    ld   a, d
    inc  h
    ld   a, d
    ld   a, [hli]
    ld   a, d
    nop
    nop
    ld   a, $7A
    ldd  [hl], a
    ld   a, d
    ld   b, e
    ld   a, d
    ldd  [hl], a
    ld   a, d
    ld   c, b
    ld   a, d
    ldd  [hl], a
    ld   a, d
    ld   b, e
    ld   a, d
    ldd  [hl], a
    ld   a, d
    rst  $38
    rst  $38
    db   $10 ; Undefined instruction
    ld   c, l
    ld   a, d
    rst  $38
    rst  $38
    inc  h
    ld   a, d
    or   a
    ld   a, c
    ld   d, c
    ld   a, d
    rst  $38
    rst  $38
    inc  l
    ld   a, d
    sbc  a, e
    ld   [bc], a
    xor  h
    ld   a, h
    ld   a, [hl]
    sbc  a, h
    sbc  a, e
    ld   [bc], a
    add  a, d
    add  a, h
    sbc  a, h
    nop
    sbc  a, l
    stop
    nop
    nop
    sbc  a, l
    jr   nz, label_7BA46

label_7BA46::
    nop
    nop
    sbc  a, l
    jr   nc, label_7BA4B

label_7BA4B::
    nop
    nop
    sbc  a, l
    ld   a, [de]
    add  a, c
    ld   b, b
    sbc  a, e
    jr   nz, label_7B9F6
    ld   h, d
    ld   l, h
    halt
    sbc  a, h
    nop
    nop
    rst  $30
    ld   c, d
    ld   h, l
    ld   a, d
    ld   [hl], c
    ld   a, d
    inc  e
    ld   c, e
    nop
    nop
    ld   a, e
    ld   a, d
    add  a, a
    ld   a, d
    ld   d, $7B
    rra
    ld   a, e
    rst  $38
    rst  $38
    ld   l, c
    ld   a, d
    add  a, d
    ld   a, d
    add  a, a
    ld   a, d
    dec  de
    ld   a, e
    rst  $38
    rst  $38
    ld   [hl], l
    ld   a, d
    sbc  a, l
    ld   b, d
    nop
    add  a, b
    and  c
    ld   bc, $9D00
    add  a, c
    nop
    add  a, b
    nop
    and  l
    ld   bc, label_1A2
    sub  a, a
    and  b
    ld   l, $30
    ld   a, $40
    ld   b, [hl]
    ld   b, b
    jr   c, label_7BAC5
    ldd  [hl], a
    inc  [hl]
    inc  a
    ld   b, h
    ld   c, d
    ld   b, h
    inc  a
    inc  [hl]
    ld   [hl], $38
    ld   b, b
    ld   c, b
    ld   c, [hl]

label_7BAA2::
    ld   c, b
    ld   b, b
    jr   c, label_7BAE0
    inc  a
    ld   b, h
    ld   c, h
    ld   d, d
    ld   c, h
    ld   b, h
    inc  a

label_7BAAD::
    ld   a, $40
    ld   c, b
    ld   d, b
    ld   d, [hl]
    ld   d, b
    ld   c, b
    ld   b, b
    ld   b, d
    ld   b, h
    ld   c, h

label_7BAB8::
    ld   d, h
    ld   e, d
    ld   d, h
    ld   c, h
    ld   b, h
    ld   b, [hl]
    ld   c, b
    ld   d, b
    ld   e, b
    ld   e, [hl]
    ld   e, b
    ld   d, b
    ld   c, b

label_7BAC5::
    ld   c, d
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, d
    ld   e, h
    ld   d, h

label_7BACC::
    ld   c, h
    ld   c, [hl]
    ld   d, b
    ld   e, b
    ld   h, b
    ld   h, [hl]
    ld   h, b
    ld   e, b
    ld   d, b
    ld   d, d
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, d
    ld   h, h
    ld   e, h
    ld   d, h
    sbc  a, e
    ld   [bc], a
    ld   d, [hl]

label_7BAE0::
    ld   e, b
    ld   h, b
    ld   l, b
    ld   l, [hl]
    ld   l, b
    ld   h, b
    ld   e, b
    ld   d, [hl]
    ld   d, b
    ld   c, b
    ld   b, b
    ld   c, b
    ld   d, b
    sbc  a, h
    ld   d, [hl]

label_7BAEF::
    ld   e, b
    ld   h, b
    ld   l, b
    ld   l, [hl]
    ld   l, b
    ld   h, b
    ld   e, b
    ld   l, b
    ld   h, b
    ld   e, b
    ld   d, [hl]
    ld   h, b
    ld   e, b
    ld   d, [hl]
    ld   d, b
    ld   e, b
    ld   d, [hl]
    ld   d, b
    ld   c, b
    ld   d, [hl]
    ld   d, b
    ld   c, b
    ld   b, b
    ld   d, b
    ld   c, b
    ld   b, b
    jr   c, label_7BB53
    ld   b, b
    ld   a, $38
    ld   b, b
    ld   a, $38
    jr   nc, label_7BAB8
    jr   z, label_7BAAD
    nop
    sbc  a, l
    stop
    add  a, b
    nop
    sbc  a, l
    ld   a, [de]
    add  a, c
    ld   b, b
    sbc  a, e
    jr   nz, label_7BACC
    ld   h, d
    ld   l, h
    halt
    sbc  a, h
    nop
    ld   c, $BB
    ld   c, d
    inc  sp
    ld   a, e
    add  hl, sp
    ld   a, e
    ccf
    ld   a, e
    nop
    nop
    ld   b, l
    ld   a, e
    rst  $38
    rst  $38
    inc  sp
    ld   a, e
    ld   h, c
    ld   a, e
    rst  $38

label_7BB3C::
    rst  $38
    add  hl, sp
    ld   a, e
    sub  a, b
    ld   a, e
    rst  $38
    rst  $38
    ccf
    ld   a, e
    sbc  a, l
    ld   h, d
    nop
    ld   b, b
    sbc  a, e
    jr   nz, label_7BAEF
    ldd  [hl], a
    and  d
    db   $3A ; ldd  a, [hl]
    and  e
    ld   b, b
    and  d
    ld   c, b

label_7BB53::
    xor  b
    ld   b, h
    and  e
    inc  l
    and  d
    ld   [hl], $A3
    inc  a
    and  d
    ld   b, h
    xor  b
    ld   b, b
    sbc  a, h
    nop
    sbc  a, l
    ld   d, b
    ld   hl, $AE80
    ld   bc, $A801
    ld   e, b
    and  e
    ld   bc, label_78EA2
    and  e
    ld   d, d
    and  d
    ld   b, b
    and  l
    ld   b, h
    and  d
    ld   bc, label_792A3
    and  d
    ld   e, h
    xor  b
    ld   e, b
    and  e
    ld   bc, label_78EA2
    and  e
    ld   d, d
    and  d
    ld   b, b
    and  l
    ld   b, h
    and  d
    ld   bc, label_780A3
    and  d
    ld   d, d
    xor  [hl]
    ld   c, d
    ld   bc, $9D00
    ld   sp, hl
    ld   c, e
    ld   b, b
    sbc  a, e
    jr   nz, label_7BB3C
    ld   bc, label_79CA1
    ld   bc, label_7B4A7
    and  l
    ld   bc, label_798A1
    ld   bc, label_7B0A7

label_7BBA4::
    sbc  a, h
    nop
    nop
    db   $E8 ; add  sp, d
    ld   c, d
    or   c
    ld   a, e
    or   a
    ld   a, e
    cp   l
    ld   a, e
    jp   label_C97B
    ld   a, e
    rst  $38
    rst  $38
    ld   sp, hl
    ld   e, [hl]
    ld   [$FF7B], a
    rst  $38
    rst  $38
    dec  b
    ld   e, a
    ld   b, $7C
    rst  $38
    rst  $38
    cp   e
    ld   a, b
    ld   a, [de]
    ld   a, h
    rst  $38
    rst  $38
    rst  0
    ld   a, b
    sbc  a, l
    add  a, b
    add  a, c
    nop
    sub  a, [hl]
    and  c
    ld   d, d
    ld   e, h
    ld   h, [hl]
    ld   h, b
    ld   l, d
    ld   [hl], h
    sbc  a, l
    add  a, b
    nop
    nop
    and  h
    ld   l, [hl]
    ld   bc, $D99E
    ld   c, d
    nop
    sbc  a, l
    ld   b, b
    add  a, c
    ld   b, b
    and  c
    ld   b, d
    ld   c, h
    ld   d, [hl]
    ld   d, b
    ld   e, d
    ld   h, h
    sbc  a, l
    ld   b, b
    nop
    ld   b, b
    and  h
    ld   e, [hl]
    ld   bc, $D99E
    ld   c, d
    nop
    xor  d
    xor  d
    xor  d
    xor  b
    nop
    nop
    nop
    nop
    xor  d
    xor  d
    xor  d
    xor  b
    nop
    nop
    nop
    nop
    sbc  a, l
    or   $7B
    jr   nz, label_7BBA4
    and  c
    jr   nc, label_7BC48
    ld   b, h
    ld   a, $48
    ld   d, d
    sbc  a, d
    and  h
    ld   c, h
    ld   bc, $D99E
    ld   c, d
    nop
    sbc  a, e
    ld   b, $A1
    ld   a, [de]
    sbc  a, h
    sbc  a, e
    db   $10 ; Undefined instruction
    dec  d
    sbc  a, h
    sbc  a, [hl]
    reti
    ld   c, d
    nop
    nop
    jp   z, label_334A
    ld   a, h
    dec  sp
    ld   a, h
    inc  e
    ld   c, e
    ld   b, c
    ld   a, h
    ld   b, a
    ld   a, h
    ld   c, [hl]
    ld   a, h
    rst  $38
    rst  $38
    dec  [hl]
    ld   a, h
    sub  a, e
    ld   a, h
    rst  $38
    rst  $38
    dec  sp
    ld   a, h
    ld   sp, hl
    ld   a, h
    rst  $38
    rst  $38
    ld   b, c
    ld   a, h
    sbc  a, l

label_7BC48::
    stop
    add  a, b
    and  c
    ld   bc, $AC00
    sub  a, b
    add  a, [hl]
    adc  a, [hl]
    add  a, h
    adc  a, h
    add  a, d
    adc  a, d
    add  a, b
    adc  a, b
    ld   a, [hl]
    add  a, [hl]
    ld   a, b
    add  a, h
    halt
    ld   [hl], h
    add  a, b
    ld   [hl], d
    xor  h
    add  a, [hl]
    ld   a, b
    add  a, h
    halt
    ld   [hl], h
    add  a, b
    ld   [hl], d
    xor  l
    ld   a, h
    ld   a, d
    ld   [hl], d
    ld   l, h
    ld   l, b
    ld   h, h
    ld   h, d
    ld   e, d
    ld   d, h
    ld   d, b
    xor  l
    ld   h, h
    ld   h, d
    ld   e, d
    ld   d, h
    ld   d, b
    xor  [hl]
    ld   bc, label_7BAAD
    ld   [hl], d
    xor  l
    ld   a, d
    ld   [hl], d
    and  l
    ld   bc, $AD01
    ld   h, d
    ld   h, h
    ld   [hl], d
    ld   l, h
    ld   h, d
    ld   h, h
    ld   [hl], d
    ld   l, h
    and  l
    ld   bc, $0001
    sbc  a, l
    add  hl, sp
    nop
    nop
    xor  h
    sub  a, b
    add  a, [hl]

label_7BC9A::
    adc  a, [hl]
    add  a, h
    adc  a, h
    add  a, d
    adc  a, d

label_7BC9F::
    add  a, b
    adc  a, b
    ld   a, [hl]

label_7BCA2::
    add  a, [hl]
    ld   a, b
    add  a, h
    halt
    ld   [hl], h
    add  a, b
    ld   [hl], d
    sbc  a, l
    jr   nz, label_7BCAD

label_7BCAD::
    ld   b, b
    xor  h
    add  a, [hl]
    ld   a, b
    add  a, h
    halt
    ld   [hl], h
    add  a, b
    ld   [hl], d
    sbc  a, l
    add  hl, hl
    nop
    nop
    xor  l
    ld   a, h
    ld   a, d
    ld   [hl], d
    ld   l, h
    ld   l, b
    ld   h, h
    ld   h, d
    ld   e, d
    ld   d, h
    ld   d, b
    sbc  a, l
    jr   nz, label_7BCC9

label_7BCC9::
    ld   b, b
    xor  l
    ld   h, h
    ld   h, d
    ld   e, d
    ld   d, h
    ld   d, b
    xor  [hl]
    ld   bc, label_299D
    nop
    nop
    xor  l
    ld   a, d
    ld   [hl], d
    sbc  a, l
    jr   nz, label_7BCDC

label_7BCDC::
    ld   b, b
    xor  l
    ld   a, d
    ld   [hl], d
    and  l
    ld   bc, $9D01
    add  hl, hl
    nop
    nop
    xor  l
    ld   h, d
    ld   h, h
    ld   [hl], d
    ld   l, h
    sbc  a, l
    jr   nz, label_7BCEF

label_7BCEF::
    ld   b, b
    xor  l
    ld   h, d
    ld   h, h
    ld   [hl], d
    ld   l, h
    and  l
    ld   bc, $0001
    sbc  a, e
    jr   nz, label_7BC9F
    jr   c, label_7BC9A
    nop
    nop
    jp   z, label_A4A
    ld   a, l
    ld   [de], a
    ld   a, l
    inc  e
    ld   c, e
    nop
    nop
    jr   z, label_7BD89
    ld   [hl], $7D
    rst  $38
    rst  $38
    inc  c
    ld   a, l
    inc  sp
    ld   a, l
    inc  a
    ld   a, l
    ld   [hl], $7D
    ld   b, c
    ld   a, l
    ld   [hl], $7D
    ld   b, [hl]
    ld   a, l
    ld   [hl], $7D
    ld   b, c
    ld   a, l
    ld   [hl], $7D
    rst  $38
    rst  $38
    inc  d
    ld   a, l
    sbc  a, l
    jr   nz, label_7BD2B

label_7BD2B::
    ld   b, e
    and  a
    ld   bc, label_1A1
    and  b
    ld   bc, $A700
    ld   bc, $A100
    jr   nz, label_7BD5B
    jr   nz, label_7BD5D
    nop
    sbc  a, l
    jr   nz, label_7BD3F

label_7BD3F::
    ld   b, b
    nop
    sbc  a, l
    jr   nc, label_7BD44

label_7BD44::
    ld   b, b
    nop
    sbc  a, l
    ld   b, b
    nop
    ld   b, b
    nop
    nop
    xor  h
    ld   c, d
    ld   d, [hl]
    ld   a, l
    ld   e, [hl]
    ld   a, l
    ld   h, [hl]
    ld   a, l
    nop
    nop
    ld   l, [hl]
    ld   a, l
    add  a, h
    ld   a, l
    rst  $38

label_7BD5B::
    rst  $38
    ld   e, b

label_7BD5D::
    ld   a, l
    ld   a, d
    ld   a, l
    add  a, h
    ld   a, l
    rst  $38
    rst  $38
    ld   h, b
    ld   a, l
    ld    hl, sp+$7D
    add  a, h
    ld   a, l
    rst  $38
    rst  $38
    ld   l, b
    ld   a, l
    sbc  a, l
    stop
    ld   b, b
    and  l
    ld   bc, $A801
    ld   bc, label_1AA
    nop
    sbc  a, l
    jr   nz, label_7BD7D

label_7BD7D::
    nop
    and  l
    ld   bc, $A801
    ld   bc, $A100
    adc  a, [hl]
    adc  a, d
    adc  a, b
    add  a, b

label_7BD89::
    ld   a, d
    halt
    ld   [hl], b
    ld   l, b
    ld   h, d
    ld   e, [hl]
    ld   e, d
    ld   e, b
    ld   d, b
    ld   c, d
    ld   b, [hl]
    ld   b, d
    ld   b, b
    jr   c, label_7BDCB
    ld   l, $2A
    ld   l, $32
    jr   c, label_7BDDF
    ld   b, d
    ld   b, [hl]
    ld   c, d

label_7BDA2::
    ld   d, b
    ld   e, b
    ld   e, d
    ld   e, [hl]
    ld   h, d
    ld   l, b
    ld   [hl], b
    ld   [hl], d
    halt
    add  a, b
    adc  a, b
    adc  a, d
    adc  a, [hl]
    adc  a, d
    add  a, [hl]
    add  a, b
    ld   a, b
    halt
    ld   l, [hl]
    ld   l, b
    ld   h, b
    ld   e, [hl]
    ld   e, d
    ld   d, [hl]
    ld   d, b
    ld   c, b
    ld   b, [hl]
    ld   b, d
    ld   a, $38
    jr   nc, label_7BDF8
    jr   c, label_7BE04
    ld   b, d
    ld   b, [hl]
    ld   c, b
    inc  [hl]
    ld   d, b

label_7BDCB::
    ld   d, [hl]
    ld   e, d
    ld   e, [hl]
    ld   h, b
    inc  [hl]
    ld   l, b
    ld   l, [hl]
    ld   [hl], d
    halt
    ld   [hl], d
    ld   l, h
    ld   h, h
    ld   h, d
    ld   e, [hl]
    ld   e, d
    ld   d, h
    ld   c, h
    ld   c, d
    ld   b, [hl]

label_7BDDF::
    ld   b, d
    inc  a
    inc  [hl]
    ldd  [hl], a
    ld   l, $32
    inc  [hl]
    inc  a
    ld   b, d
    ld   b, [hl]
    ld   c, d
    ld   c, h
    ld   d, h
    ld   e, d
    ld   e, [hl]
    ld   h, d
    ld   h, h
    ld   l, h
    ld   [hl], d
    halt
    ld   a, h
    add  a, h
    adc  a, d
    nop

label_7BDF8::
    sbc  a, l
    and  a
    ld   a, c
    jr   nz, label_7BDA2
    ld   bc, $A801
    ld   bc, label_1A3
    nop

label_7BE04::
    nop
    reti
    ld   c, d
    rrca
    ld   a, [hl]
    rla
    ld   a, [hl]
    rra
    ld   a, [hl]
    daa
    ld   a, [hl]
    cpl
    ld   a, [hl]
    ld   [hl], b
    ld   a, [hl]
    rst  $38
    rst  $38
    ld   de, label_3A7E
    ld   a, [hl]
    sub  a, [hl]
    ld   a, [hl]
    rst  $38
    rst  $38
    add  hl, de
    ld   a, [hl]
    ld   d, l
    ld   a, [hl]
    cp   $7E
    rst  $38
    rst  $38
    ld   hl, label_7A07E
    ld   a, [hl]
    halt
    rst  $38
    rst  $38
    add  hl, hl
    ld   a, [hl]
    sbc  a, l
    ld   h, b
    nop
    ld   b, c
    and  a
    ld   bc, label_78EAA
    xor  [hl]
    ld   d, b
    nop
    sbc  a, l
    ld   b, b
    nop
    ld   bc, label_1A7
    xor  d
    ld   h, h
    xor  [hl]
    ld   h, [hl]
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
    ld   b, l
    ld   a, [hl]
    jr   nz, label_7BE01
    ld   bc, label_79AAA
    xor  [hl]
    ld   e, h
    nop
    and  a
    ld   bc, label_1AA
    and  l
    ld   bc, $FFA1
    and  d
    rst  $38
    rst  $38
    and  c
    rst  $38
    and  d
    rst  $38
    nop
    sbc  a, l
    ld   b, c
    nop
    add  a, b
    sbc  a, e
    rlca
    and  [hl]
    add  a, d
    add  a, d
    and  e
    add  a, d
    and  d
    add  a, d
    and  e
    add  a, d
    sbc  a, h
    sbc  a, l
    ld   h, c
    nop
    add  a, b
    sub  a, a
    and  d
    ld   b, h
    and  [hl]
    ld   b, h
    and  c
    ld   b, h
    ld   b, h
    and  e
    ld   b, h
    and  d
    ld   b, h
    and  c
    ld   b, h
    and  d
    ld   b, h
    sbc  a, b
    nop
    sbc  a, l
    ld   h, b
    ld   hl, $A341
    ld   b, [hl]

label_7BE9C::
    and  a
    inc  a
    and  c
    ld   bc, label_78646
    ld   c, d
    ld   c, h
    ld   d, b
    xor  b
    ld   d, h
    xor  d
    ld   d, h
    ld   d, [hl]
    ld   e, d
    xor  l
    ld   bc, label_79EA8
    xor  d
    ld   e, [hl]
    ld   e, d
    ld   d, [hl]
    xor  l
    ld   bc, label_79AA6
    and  c
    ld   d, [hl]
    and  h
    ld   d, h
    and  e
    ld   d, h
    and  d
    ld   d, b
    and  c
    ld   d, b
    ld   d, h
    and  h
    ld   d, [hl]
    and  d
    ld   d, h
    ld   d, b
    and  d
    ld   c, h
    and  c
    ld   c, h
    ld   d, b
    and  h
    ld   d, h
    and  d
    ld   d, b
    ld   c, h
    and  d
    ld   c, d
    and  c
    ld   c, d
    ld   c, [hl]
    and  h
    ld   d, d
    and  e
    ld   e, b
    sbc  a, l
    ld   h, d
    nop
    ld   b, b
    and  d
    ld   d, h
    and  [hl]
    ld   d, h
    and  c
    ld   d, h
    ld   d, h
    and  e
    ld   d, h
    and  d
    ld   d, h
    and  c
    ld   d, h
    and  d
    ld   d, h
    nop
    nop
    ld   de, label_3322
    ld   b, h
    ld   d, l
    ld   h, a
    adc  a, c
    nop
    nop
    nop
    dec  b
    nop
    nop
    nop
    dec  b
    sbc  a, l
    xor  $7E
    jr   nz, label_7BE9C
    and  d
    ld   e, [hl]
    and  c
    ld   c, h
    and  d
    ld   d, h
    ld   e, [hl]
    ld   e, h
    ld   c, h
    ld   d, h
    ld   e, h
    and  c
    ld   c, h
    and  d
    ld   e, d
    and  c
    ld   c, h
    and  d
    ld   d, h
    ld   e, d
    ld   e, b
    ld   c, h
    ld   d, h
    ld   e, b
    and  c
    ld   c, h
    and  d
    ld   d, [hl]
    and  c
    ld   b, [hl]
    and  d
    ld   c, h
    ld   d, [hl]
    ld   e, d
    ld   c, d
    ld   d, b
    ld   e, d
    and  c
    ld   c, d
    and  d
    ld   e, d
    and  c
    ld   c, h
    and  d
    ld   d, h
    ld   e, d
    ld   e, d
    and  c
    ld   c, h
    ld   d, h
    and  d
    ld   e, d
    and  c
    ld   c, h
    ld   d, h
    ld   e, d
    and  d
    ld   d, [hl]
    and  c
    ld   c, b
    and  d
    ld   d, b
    ld   d, [hl]
    ld   d, b
    ld   a, $48
    ld   d, b
    and  c
    ld   d, d
    and  d
    ld   d, h
    and  c
    ld   b, [hl]
    and  d
    ld   c, h
    ld   d, h
    ld   e, [hl]
    and  c
    ld   c, h
    ld   d, h
    and  d
    ld   e, [hl]
    and  c
    ld   e, h
    ld   e, [hl]
    ld   h, b
    and  d
    ld   h, d
    and  c
    ld   d, d
    and  d
    ld   e, b
    ld   h, d
    ld   e, [hl]
    ld   d, d
    ld   e, b
    ld   e, [hl]
    and  c
    ld   e, b
    and  d
    ld   e, h
    and  [hl]
    ld   e, h
    and  c
    ld   e, h
    ld   e, h
    and  e
    ld   e, h
    and  d
    ld   e, h
    and  c
    ld   e, h
    and  d
    ld   e, h
    nop
    sbc  a, e
    rlca
    and  c
    dec  d
    dec  d
    ld   a, [de]
    dec  d
    dec  d
    dec  d
    rst  $38
    dec  d
    dec  d
    dec  d
    ld   a, [de]
    dec  d
    dec  d
    dec  d
    ld   a, [de]
    rst  $38
    sbc  a, h
    and  d
    rst  $38
    and  [hl]
    rst  $38
    and  c
    rst  $38
    rst  $38
    and  e
    rst  $38
    and  d
    rst  $38
    and  c
    rst  $38
    and  d
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
