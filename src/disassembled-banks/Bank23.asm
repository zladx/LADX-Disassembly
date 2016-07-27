section "bank23",romx,bank[$17]

label_5C000::
    jr   label_5C007
    scf
    jr   nz, label_5C03B
    ld   c, $1E

label_5C007::
    dec  hl
    dec  h
    inc  d
    rra
    ld   [de], a
    dec  d
    inc  l
    ld   sp, label_C3F

label_5C011::
    jr   nc, label_5C014
    inc  sp

label_5C014::
    inc  b
    daa
    ld   [label_381D], sp
    rla
    ld   a, $28
    ld   de, label_3A00
    dec  a
    ld   a, [hli]

label_5C021::
    dec  bc
    dec  de
    ld   a, [bc]
    inc  [hl]
    rlca
    ldi  [hl], a
    rrca
    inc  e
    inc  hl
    cpl
    dec  sp
    dec  l
    ld   d, $3C
    ldd  [hl], a
    db   $10 ; Undefined instruction
    ld   [bc], a
    ld   l, $0D
    add  hl, de
    add  hl, bc
    ld   h, $24
    ld   b, $13

label_5C03B::
    ld   hl, label_31A
    add  hl, sp
    dec  [hl]

label_5C040::
    ld   a, a
    cp   a
    rst  $18
    rst  $28
    rst  $30
    ei
    db   $FD ; Undefined instruction
    cp   $50
    sub  a, c
    ld   h, b
    sub  a, b
    ld   [hl], b
    sub  a, b
    add  a, b
    sub  a, b
    sub  a, b
    sub  a, b
    and  b
    sub  a, b
    ld   a, [$FF91]
    ld   h, b
    sub  a, c
    ld   [hl], b
    sub  a, c
    add  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    and  b
    sub  a, c
    ld   b, b
    sub  a, h
    ld   a, [$D00B]
    ld   e, a
    ld   d, $00
    ld   hl, label_5C000
    add  hl, de
    ld   a, [hl]
    rra
    rra
    and  $0E
    ld   b, a
    ld   a, [hl]
    and  $07
    ld   e, a
    ld   hl, label_5C040
    add  hl, de
    ld   c, [hl]
    xor  a
    ld   d, a

label_5C07D::
    ld   [$FFD9], a
    sla  a
    ld   e, a
    ld   hl, label_5C048
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    add  a, b
    ld   l, a
    ld   a, [hl]
    and  c
    ldi  [hl], a
    ld   a, [hl]
    and  c
    ld   [hl], a
    ld   a, [$FFD9]
    inc  a
    cp   $0D
    jr   nz, label_5C07D
    xor  a
    ld   [$FFA5], a
    ret

label_5C09B::
    jr   nz, label_5C0BD
    jr   nz, label_5C0BF
    ld   sp, label_3939
    jr   c, label_5C0C4
    ld   d, e
    ld   d, h
    ld   b, c
    ld   b, [hl]
    ld   b, [hl]
    jr   nz, label_5C0CB
    jr   nz, label_5C0CD
    jr   nz, label_5C0CF
    jr   nz, label_5C0D1
    ld   d, e
    ld   d, l
    ld   d, b
    ld   b, l
    ld   d, d
    ld   d, [hl]
    ld   c, c
    ld   d, e
    ld   c, a
    ld   d, d
    jr   nz, label_5C0DD

label_5C0BD::
    jr   nz, label_5C0DF

label_5C0BF::
    jr   nz, label_5C0E1
    jr   nz, label_5C0E3
    jr   nz, label_5C109
    ld   c, c
    ld   d, d
    ld   b, l
    ld   b, e
    ld   d, h
    ld   c, a

label_5C0CB::
    ld   d, d
    jr   nz, label_5C0EE
    jr   nz, label_5C0F0
    jr   nz, label_5C0F2
    jr   nz, label_5C127
    ld   b, e
    ld   d, d
    ld   c, c
    ld   d, b
    ld   d, h
    jr   nz, label_5C132
    ld   d, d
    ld   c, c

label_5C0DD::
    ld   d, h
    ld   b, l

label_5C0DF::
    ld   d, d
    jr   nz, label_5C102
    jr   nz, label_5C104
    jr   nz, label_5C106
    jr   nz, label_5C138
    ld   d, d
    ld   c, a
    ld   b, a
    ld   d, d
    ld   b, c
    ld   c, l

label_5C0EE::
    ld   c, l
    ld   b, l

label_5C0F0::
    ld   d, d
    jr   nz, label_5C113
    jr   nz, label_5C115
    ld   b, e
    ld   c, b
    ld   b, c
    ld   d, d
    ld   b, c
    ld   b, e
    ld   d, h
    ld   b, l
    ld   d, d
    jr   nz, label_5C144
    ld   b, l
    ld   d, e

label_5C102::
    ld   c, c
    ld   b, a

label_5C104::
    ld   c, [hl]
    ld   b, l

label_5C106::
    ld   d, d
    jr   nz, label_5C129

label_5C109::
    ld   d, e
    ld   c, a
    ld   d, l
    ld   c, [hl]
    ld   b, h
    jr   nz, label_5C153
    ld   c, a
    ld   c, l
    ld   d, b

label_5C113::
    ld   c, a
    ld   d, e

label_5C115::
    ld   b, l
    ld   d, d
    jr   nz, label_5C139
    jr   nz, label_5C13B
    jr   nz, label_5C13D
    jr   nz, label_5C160
    ld   d, d
    ld   d, h
    jr   nz, label_5C17A
    ld   c, a
    ld   d, d
    ld   c, e
    jr   nz, label_5C148
    jr   nz, label_5C14A
    jr   nz, label_5C180
    ld   b, l
    ld   b, e
    ld   c, b
    ld   c, [hl]
    ld   c, c
    ld   b, e

label_5C132::
    ld   b, c
    ld   c, h
    jr   nz, label_5C189
    ld   d, l
    ld   d, b

label_5C138::
    ld   d, b

label_5C139::
    ld   c, a
    ld   d, d

label_5C13B::
    ld   d, h
    jr   nz, label_5C15E
    jr   nz, label_5C185
    ld   c, [hl]
    ld   b, a
    ld   c, h
    ld   c, c

label_5C144::
    ld   d, e
    ld   c, b
    jr   nz, label_5C19B

label_5C148::
    ld   b, e
    ld   d, d

label_5C14A::
    ld   c, c
    ld   d, b
    ld   d, h
    jr   nz, label_5C16F
    ld   d, e
    ld   d, b
    ld   b, l
    ld   b, e

label_5C153::
    ld   c, c
    ld   b, c
    ld   c, h
    jr   nz, label_5C1AC
    ld   c, b
    ld   b, c
    ld   c, [hl]
    ld   c, e
    ld   d, e
    jr   nz, label_5C1B3
    ld   c, a

label_5C160::
    jr   nz, label_5C182
    jr   nz, label_5C184
    ld   b, h
    ld   b, l
    ld   b, d
    ld   d, l
    ld   b, a
    jr   nz, label_5C1BE
    ld   d, h
    ld   b, c
    ld   b, [hl]
    ld   b, [hl]

label_5C16F::
    jr   nz, label_5C191
    jr   nz, label_5C193
    jr   nz, label_5C195
    jr   nz, label_5C197
    ld   sp, label_3939

label_5C17A::
    inc  sp
    jr   nz, label_5C1D0
    ld   d, h
    ld   b, c
    ld   b, [hl]

label_5C180::
    ld   b, [hl]
    jr   nz, label_5C1A3
    jr   nz, label_5C1A5

label_5C185::
    jr   nz, label_5C1CB
    ld   d, l
    ld   c, [hl]

label_5C189::
    ld   b, a
    ld   b, l
    ld   c, a
    ld   c, [hl]
    jr   nz, label_5C1D3
    ld   b, l
    ld   d, e

label_5C191::
    ld   c, c
    ld   b, a

label_5C193::
    ld   c, [hl]
    ld   b, l

label_5C195::
    ld   d, d
    jr   nz, label_5C1B8
    jr   nz, label_5C1BA
    ld   c, c

label_5C19B::
    ld   c, h
    ld   c, h
    ld   d, l
    ld   d, e
    ld   d, h
    ld   d, d
    ld   b, c
    ld   d, h

label_5C1A3::
    ld   c, a
    ld   d, d

label_5C1A5::
    jr   nz, label_5C1C7
    jr   nz, label_5C1C9
    jr   nz, label_5C1CB
    jr   nz, label_5C1CD
    jr   nz, label_5C1FF
    ld   d, d
    ld   c, a
    ld   b, h
    ld   d, l

label_5C1B3::
    ld   b, e
    ld   b, l
    ld   d, d
    jr   nz, label_5C1D8

label_5C1B8::
    jr   nz, label_5C1DA

label_5C1BA::
    jr   nz, label_5C201
    ld   e, b
    ld   b, l

label_5C1BE::
    ld   b, e
    ld   d, l
    ld   d, h
    ld   c, c
    ld   d, [hl]
    ld   b, l
    jr   nz, label_5C216
    ld   d, d

label_5C1C7::
    ld   c, a
    ld   b, h

label_5C1C9::
    ld   d, l
    ld   b, e

label_5C1CB::
    ld   b, l
    ld   d, d

label_5C1CD::
    jr   nz, label_5C1EF
    jr   nz, label_5C1F1
    jr   nz, label_5C1F3

label_5C1D3::
    jr   nz, label_5C1F5
    jr   nz, label_5C1F7
    jr   nz, label_5C1F9
    jr   nz, label_5C1FB
    jr   nz, label_5C1FD
    jr   nz, label_5C1FF

label_5C1DF::
    jr   nz, label_5C201
    jr   nz, label_5C203
    jr   nz, label_5C205
    jr   nz, label_5C207
    jr   nz, label_5C209
    jr   nz, label_5C20B
    jr   nz, label_5C20D
    jr   nz, label_5C20F

label_5C1EF::
    jr   nz, label_5C211

label_5C1F1::
    jr   nz, label_5C213

label_5C1F3::
    ld   d, h
    ld   b, c

label_5C1F5::
    ld   c, e
    ld   b, c

label_5C1F7::
    ld   d, e
    ld   c, b

label_5C1F9::
    ld   c, c
    jr   nz, label_5C250
    ld   b, l

label_5C1FD::
    ld   e, d
    ld   d, l

label_5C1FF::
    ld   c, e
    ld   b, c

label_5C201::
    jr   nz, label_5C223

label_5C203::
    ld   e, c
    ld   c, a

label_5C205::
    ld   d, e
    ld   c, c

label_5C207::
    ld   c, [hl]
    ld   c, a

label_5C209::
    ld   d, d
    ld   c, c

label_5C20B::
    jr   nz, label_5C261

label_5C20D::
    ld   d, l
    ld   d, h

label_5C20F::
    ld   c, c
    ld   e, c

label_5C211::
    ld   b, c
    ld   c, l

label_5C213::
    ld   b, c
    jr   nz, label_5C236

label_5C216::
    ld   c, [hl]
    ld   c, a
    ld   b, d
    ld   d, l
    ld   c, a
    jr   nz, label_5C26A
    ld   b, c
    ld   d, h
    ld   d, e
    ld   d, l
    ld   c, l
    ld   c, c

label_5C223::
    ld   e, c
    ld   b, c
    jr   nz, label_5C247
    jr   nz, label_5C249
    jr   nz, label_5C24B
    ld   b, l
    ld   c, c
    ld   c, d
    ld   c, c
    jr   nz, label_5C27F
    ld   c, a
    ld   d, h
    ld   c, a
    jr   nz, label_5C256

label_5C236::
    jr   nz, label_5C258
    jr   nz, label_5C25A
    jr   nz, label_5C25C
    ld   c, e
    ld   c, c
    ld   e, c
    ld   c, a
    ld   d, e
    ld   c, b
    ld   c, c
    jr   nz, label_5C290
    ld   c, a
    ld   b, h

label_5C247::
    ld   b, c
    jr   nz, label_5C26A
    jr   nz, label_5C29F
    ld   c, c
    ld   b, a
    ld   b, l
    ld   c, b

label_5C250::
    ld   c, c
    ld   d, d
    ld   c, a
    jr   nz, label_5C2A0
    ld   b, c

label_5C256::
    ld   d, e
    ld   b, c

label_5C258::
    ld   c, l
    ld   b, c

label_5C25A::
    ld   d, h
    ld   d, l

label_5C25C::
    jr   nz, label_5C27E
    jr   nz, label_5C2AD
    ld   c, c

label_5C261::
    ld   c, e
    ld   c, c
    ld   c, a
    jr   nz, label_5C2B3
    ld   c, c
    ld   d, e
    ld   c, b
    ld   c, c

label_5C26A::
    ld   c, l
    ld   b, c
    jr   nz, label_5C28E
    jr   nz, label_5C290
    jr   nz, label_5C292
    ld   c, e
    ld   e, c
    ld   c, a
    ld   c, e
    ld   c, a
    jr   nz, label_5C2C4
    ld   c, c
    ld   c, l
    ld   d, l
    ld   d, d
    ld   b, c

label_5C27E::
    jr   nz, label_5C2A0
    jr   nz, label_5C2A2
    jr   nz, label_5C2A4
    ld   e, c
    ld   d, l
    ld   c, c
    ld   b, e
    ld   c, b
    ld   c, c
    jr   nz, label_5C2DB
    ld   e, d
    ld   b, c

label_5C28E::
    ld   c, e
    ld   c, c

label_5C290::
    jr   nz, label_5C2B2

label_5C292::
    jr   nz, label_5C2B4
    jr   nz, label_5C2B6
    ld   c, e
    ld   b, l
    ld   c, c
    ld   c, e
    ld   c, a
    jr   nz, label_5C2E6
    ld   e, d
    ld   b, c

label_5C29F::
    ld   d, a

label_5C2A0::
    ld   b, c
    jr   nz, label_5C2C3
    jr   nz, label_5C2C5
    jr   nz, label_5C2C7
    jr   nz, label_5C2F7
    jr   nz, label_5C2F6
    ld   c, a
    ld   b, a

label_5C2AD::
    ld   b, c
    ld   c, [hl]
    ld   b, l
    ld   e, d
    ld   b, c

label_5C2B2::
    ld   d, a

label_5C2B3::
    ld   b, c

label_5C2B4::
    jr   nz, label_5C2D6

label_5C2B6::
    jr   nz, label_5C2D8
    jr   nz, label_5C2DA
    ld   c, d
    ld   c, c
    ld   c, l
    jr   nz, label_5C316
    ld   c, a
    ld   d, d
    ld   c, [hl]
    ld   b, l

label_5C2C3::
    ld   c, h

label_5C2C4::
    ld   c, h

label_5C2C5::
    jr   nz, label_5C2E7

label_5C2C7::
    jr   nz, label_5C2E9
    jr   nz, label_5C2EB
    jr   nz, label_5C318
    ld   b, l
    ld   c, c
    ld   c, e
    ld   c, a
    jr   nz, label_5C327
    ld   b, c
    ld   c, l
    ld   d, l

label_5C2D6::
    ld   d, d
    ld   b, c

label_5C2D8::
    jr   nz, label_5C2FA

label_5C2DA::
    jr   nz, label_5C2FC
    jr   nz, label_5C2FE
    jr   nz, label_5C334
    ld   b, c
    ld   c, l
    ld   b, c
    ld   e, c
    ld   c, a
    jr   nz, label_5C330

label_5C2E7::
    ld   d, h
    ld   c, a

label_5C2E9::
    jr   nz, label_5C30B

label_5C2EB::
    jr   nz, label_5C30D
    jr   nz, label_5C30F
    ld   b, c
    ld   c, e
    ld   c, c
    ld   e, c
    ld   b, c
    jr   nz, label_5C349

label_5C2F6::
    ld   b, c

label_5C2F7::
    ld   c, e
    ld   b, c
    ld   c, l

label_5C2FA::
    ld   c, a
    ld   d, h

label_5C2FC::
    ld   c, a
    jr   nz, label_5C31F
    jr   nz, label_5C353
    ld   h, $44
    ldd  [hl], a
    jr   nz, label_5C34A
    ld   b, l
    ld   b, d
    ld   d, l
    ld   b, a
    jr   nz, label_5C35F
    ld   d, h

label_5C30D::
    ld   b, c
    ld   b, [hl]

label_5C30F::
    ld   b, [hl]
    jr   nz, label_5C332
    ld   d, e
    ld   d, l
    ld   d, b
    ld   b, l

label_5C316::
    ld   d, d
    jr   nz, label_5C366
    ld   b, c
    ld   d, d
    ld   c, c
    ld   c, a
    jr   nz, label_5C362

label_5C31F::
    ld   c, h
    ld   d, l
    ld   b, d
    jr   nz, label_5C37D
    ld   b, c
    ld   d, e
    ld   d, l

label_5C327::
    ld   c, b
    ld   c, c
    ld   d, e
    ld   b, c
    jr   nz, label_5C386
    ld   b, c
    ld   c, l
    ld   b, c

label_5C330::
    ld   c, l
    ld   d, l

label_5C332::
    ld   d, d
    ld   b, c

label_5C334::
    jr   nz, label_5C356
    jr   nz, label_5C383
    ld   b, l
    ld   c, [hl]
    ld   d, e
    ld   d, l
    ld   c, e
    ld   b, l
    jr   nz, label_5C394
    ld   b, c
    ld   c, [hl]
    ld   b, c
    ld   b, d
    ld   b, l
    jr   nz, label_5C367
    jr   nz, label_5C3A2

label_5C349::
    ld   c, a

label_5C34A::
    ld   d, e
    ld   c, b
    ld   c, c
    ld   b, c
    ld   c, e
    ld   c, c
    jr   nz, label_5C39D
    ld   c, a

label_5C353::
    ld   c, c
    ld   e, d
    ld   d, l

label_5C356::
    ld   c, l
    ld   c, c
    jr   nz, label_5C37A
    jr   nz, label_5C3A7
    ld   b, c
    ld   e, d
    ld   d, l

label_5C35F::
    ld   b, c
    ld   c, e
    ld   c, c

label_5C362::
    jr   nz, label_5C3B1
    ld   c, a
    ld   d, d

label_5C366::
    ld   c, c

label_5C367::
    ld   d, h
    ld   b, c
    jr   nz, label_5C38B
    ld   d, h
    ld   b, c
    ld   c, e
    ld   b, c
    ld   c, l
    ld   c, c
    ld   d, h
    ld   d, e
    ld   d, l
    jr   nz, label_5C3C1
    ld   d, l
    ld   e, d
    ld   d, l
    ld   c, b

label_5C37A::
    ld   b, c
    ld   d, d
    ld   b, c

label_5C37D::
    jr   nz, label_5C3CC
    ld   b, c
    ld   d, e
    ld   b, c
    ld   c, [hl]

label_5C383::
    ld   b, c
    ld   c, a
    jr   nz, label_5C3C8
    ld   d, d
    ld   c, c
    ld   c, l
    ld   c, a

label_5C38B::
    ld   d, h
    ld   c, a
    jr   nz, label_5C3AF
    jr   nz, label_5C3B1
    ld   d, e
    ld   c, b
    ld   c, c

label_5C394::
    ld   b, a
    ld   b, l
    ld   b, [hl]
    ld   d, l
    ld   c, l
    ld   c, c
    jr   nz, label_5C3E4
    ld   c, c

label_5C39D::
    ld   c, [hl]
    ld   c, a
    jr   nz, label_5C3C1
    jr   nz, label_5C3C3
    ld   c, e
    ld   b, c
    ld   e, d
    ld   d, l

label_5C3A7::
    ld   c, l
    ld   c, c
    jr   nz, label_5C3FF
    ld   c, a
    ld   d, h
    ld   b, c
    ld   c, e

label_5C3AF::
    ld   b, c
    jr   nz, label_5C3D2
    jr   nz, label_5C3D4
    jr   nz, label_5C403
    ld   c, c
    ld   c, [hl]
    ld   b, c
    ld   c, e
    ld   c, a
    jr   nz, label_5C405
    ld   b, c
    ld   c, l
    ld   b, c
    ld   c, [hl]

label_5C3C1::
    ld   c, a
    jr   nz, label_5C3E4
    jr   nz, label_5C3E6
    jr   nz, label_5C413

label_5C3C8::
    ld   c, a
    ld   e, d
    ld   d, l
    ld   b, l

label_5C3CC::
    jr   nz, label_5C417
    ld   d, e
    ld   c, b
    ld   c, c
    ld   c, e

label_5C3D2::
    ld   b, c
    ld   d, a

label_5C3D4::
    ld   b, c
    jr   nz, label_5C3F7
    jr   nz, label_5C3F9
    ld   e, c
    ld   c, a
    ld   d, l
    ld   c, c
    ld   b, e
    ld   c, b
    ld   c, c
    jr   nz, label_5C42D
    ld   c, a
    ld   d, h

label_5C3E4::
    ld   b, c
    ld   b, d

label_5C3E6::
    ld   b, l
    jr   nz, label_5C409
    jr   nz, label_5C40B
    jr   nz, label_5C40D
    ld   b, h
    ld   b, c
    ld   c, [hl]
    jr   nz, label_5C441
    ld   d, a
    ld   d, e
    ld   b, l
    ld   c, [hl]
    jr   nz, label_5C418
    jr   nz, label_5C41A
    jr   nz, label_5C41C
    ld   d, h
    ld   c, a
    ld   d, e

label_5C3FF::
    ld   c, b
    ld   c, c
    ld   c, b
    ld   c, c

label_5C403::
    ld   c, e
    ld   c, a

label_5C405::
    jr   nz, label_5C455
    ld   b, c
    ld   c, e

label_5C409::
    ld   b, c
    ld   b, a

label_5C40B::
    ld   c, a
    jr   nz, label_5C42E
    jr   nz, label_5C430
    jr   nz, label_5C45D
    ld   c, a

label_5C413::
    ld   c, d
    ld   c, c
    jr   nz, label_5C462

label_5C417::
    ld   c, a

label_5C418::
    ld   c, [hl]
    ld   b, h

label_5C41A::
    ld   c, a
    jr   nz, label_5C43D
    jr   nz, label_5C43F
    jr   nz, label_5C475
    ld   c, a
    ld   c, l
    ld   c, a
    ld   b, c
    ld   c, e
    ld   c, c
    jr   nz, label_5C474
    ld   d, l
    ld   d, d
    ld   c, a
    ld   d, l

label_5C42D::
    ld   c, l

label_5C42E::
    ld   b, l
    jr   nz, label_5C451
    jr   nz, label_5C480
    ld   b, c
    ld   d, e
    ld   b, c
    ld   c, c
    ld   b, e
    ld   c, b
    ld   c, c
    jr   nz, label_5C48B
    ld   c, e

label_5C43D::
    ld   d, l
    ld   c, l

label_5C43F::
    ld   d, l
    ld   d, d

label_5C441::
    ld   b, c
    jr   nz, label_5C464
    jr   nz, label_5C466
    jr   nz, label_5C493
    ld   b, c
    ld   c, [hl]
    ld   b, c
    ld   b, l
    jr   nz, label_5C4A5
    ld   b, c
    ld   b, h
    ld   b, c

label_5C451::
    jr   nz, label_5C473
    jr   nz, label_5C475

label_5C455::
    jr   nz, label_5C4AA
    ld   c, b
    ld   c, c
    ld   b, a
    ld   b, l
    ld   d, d
    ld   d, l

label_5C45D::
    jr   nz, label_5C4AC
    ld   c, c
    ld   e, c
    ld   b, c

label_5C462::
    ld   c, l
    ld   c, a

label_5C464::
    ld   d, h
    ld   c, a

label_5C466::
    jr   nz, label_5C488
    ld   c, b
    ld   c, c
    ld   d, d
    ld   c, a
    ld   d, e
    ld   c, b
    ld   c, c
    jr   nz, label_5C4CA
    ld   b, c
    ld   c, l

label_5C473::
    ld   b, c

label_5C474::
    ld   d, l

label_5C475::
    ld   b, e
    ld   c, b
    ld   c, c
    jr   nz, label_5C4CE
    ld   c, b
    ld   b, l
    jr   nz, label_5C49E
    ld   b, l
    ld   c, [hl]

label_5C480::
    ld   b, h
    jr   nz, label_5C4A3
    jr   nz, label_5C4A5
    jr   nz, label_5C4A7
    jr   nz, label_5C4A9
    jr   nz, label_5C4AB

label_5C48B::
    ld   a, [$D009]
    and  a
    ret  nz
    ld   a, [$D01E]

label_5C493::
    and  a
    jr   nz, label_5C49C
    call label_5C69D
    call label_5C784

label_5C49C::
    ld   a, [$D012]
    rst  0
    db   $FC ; Undefined instruction
    ld   b, h
    ld   a, l

label_5C4A3::
    ld   b, l
    sub  a, h

label_5C4A5::
    ld   b, l
    cp   d

label_5C4A7::
    ld   b, l
    jr   nc, label_5C4F0

label_5C4AA::
    ld   a, b

label_5C4AB::
    ld   b, [hl]

label_5C4AC::
    nop
    ld   bc, label_302
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    ld   b, $07
    ld   [label_909], sp
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    inc  c
    ld   [bc], a
    dec  c
    inc  bc
    inc  bc
    inc  b
    inc  b
    dec  b
    dec  b
    ld   b, $06
    ld   b, $0E
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]

label_5C4CE::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    rrca
    db   $10 ; Undefined instruction

label_5C4D4::
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    db   $10 ; Undefined instruction
    nop
    ld   bc, label_1312
    inc  d
    dec  d
    ld   d, $17
    jr   label_5C509

label_5C4F0::
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    jr   nz, label_5C519
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   a, [$D008]
    and  a
    ret  nz
    ld   c, $00
    ld   a, [$D00A]
    ld   e, a
    cp   $25

label_5C509::
    jr   c, label_5C519
    cp   $27
    jr   nz, label_5C514
    ld   a, [$FFFE]
    and  a
    jr   z, label_5C519

label_5C514::
    ld   a, $0C
    ld   [$D01E], a

label_5C519::
    ld   d, $00
    ld   hl, label_5C4AC
    add  hl, de
    ld   a, [$D010]
    cp   [hl]
    jr   nz, label_5C526
    inc  c

label_5C526::
    ld   a, c
    ld   [$D005], a
    ld   a, [hl]
    ld   [$D010], a
    ld   hl, label_5C4D4
    add  hl, de
    ld   a, [hl]
    ld   [$D011], a
    xor  a
    ld   [$D000], a
    jp   label_5C5B5
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    add  hl, de
    add  hl, de
    add  hl, de
    add  hl, de
    ld   e, $1E
    ld   e, $1E
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    xor  a
    xor  a
    xor  a
    xor  a
    ld   e, d
    ld   e, d
    ld   e, d
    ld   e, d
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    add  hl, de
    add  hl, de
    add  hl, de
    add  hl, de
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop

label_5C56D::
    ld   e, $1E
    ld   e, $1E
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, $B0
    ld   [$D008], a
    call label_5C5B5
    ld   a, [$D00A]
    cp   $27
    jr   nz, label_5C58E
    ld   [hl], $04

label_5C58E::
    ld   a, $1E
    ld   [$DB99], a
    ret
    ld   a, [$D008]
    and  a
    ret  nz
    ld   c, $00
    ld   a, [$D00A]
    inc  a
    ld   e, a
    ld   d, $00
    ld   hl, label_5C4AC
    add  hl, de
    ld   a, [$D010]
    cp   [hl]
    jr   nz, label_5C5AD
    inc  c

label_5C5AD::
    ld   a, c
    ld   [$D005], a
    xor  a
    ld   [$D000], a

label_5C5B5::
    ld   hl, $D012
    inc  [hl]
    ret
    ld   a, [$D00A]
    ld   [$FFE4], a
    cp   $26
    jr   c, label_5C5F9
    ld   a, [$FFFE]
    and  a
    jr   z, label_5C5E8
    ld   hl, $DB57
    ld   a, [hli]
    or   [hl]
    jr   z, label_5C5F9
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5C612
    call label_5FFA9
    ld   a, [$FFE7]
    and  $04
    jr   z, label_5C5E3
    ld   a, $02
    ld   [$DDD1], a

label_5C5E3::
    ld   a, [$D00A]
    ld   [$FFE4], a

label_5C5E8::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5C612
    ld   a, [$D000]
    inc  a
    ld   [$D000], a
    cp   $0C
    jr   nz, label_5C612

label_5C5F9::
    ld   a, [$FFE4]
    cp   $26
    ld   a, $10
    jr   c, label_5C603
    ld   a, $80

label_5C603::
    ld   [$D008], a
    ld   a, $00
    ld   [$D012], a
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a

label_5C612::
    ld   a, [$D000]
    ld   e, a
    ld   a, [$FFE7]
    and  $03
    add  a, e
    ld   e, a
    ld   d, $00
    ld   a, [$FFE4]
    cp   $26
    jr   c, label_5C62F
    ld   hl, label_5C56D
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   [$DB99], a

label_5C62F::
    ret
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $E0
    ld   hl, $C210
    add  hl, de
    ld   [hl], $10
    ld   hl, $C240
    add  hl, de
    ld   [hl], $08
    ld   hl, $C250
    add  hl, de
    ld   [hl], $08
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $10
    ld   a, [$FFFE]
    and  a
    jp   z, label_5C5B5
    ld   hl, $C250
    add  hl, de
    ld   [hl], $F8
    ld   hl, $DB57
    ld   a, [hli]
    or   [hl]
    jr   nz, label_5C66A
    ld   a, $3C
    jr   label_5C66B

label_5C66A::
    xor  a

label_5C66B::
    ld   [$D01E], a
    xor  a
    ld   [$D00E], a
    call label_5CDA5
    jp   label_5CC5B
    ret

label_5C679::
    ld   b, b
    jr   label_5C6BD
    ld   b, d
    ld   b, e
    add  hl, de
    ld   b, h
    ld   b, l
    ld   b, [hl]
    nop
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, e
    ld   d, b
    nop
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    cpl
    ccf
    nop
    nop
    nop
    ld   a, [de]
    nop
    inc  e
    nop
    nop
    nop
    nop
    dec  e
    dec  de

label_5C69D::
    ld   a, [$D010]
    cp   $FF
    ret  z
    rla
    and  $FE
    ld   e, a
    ld   d, $00
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    and  $F0
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   hl, label_5C09B

label_5C6BD::
    add  hl, de
    ld   de, $C030
    ld   a, [$FFFE]
    and  a
    jr   z, label_5C6C9
    ld   de, $C000

label_5C6C9::
    ld   a, [$FFE7]
    and  $01
    ld   a, $10
    jr   z, label_5C6D4
    inc  hl
    ld   a, $18

label_5C6D4::
    ld   [$FFD7], a
    ld   c, $09

label_5C6D8::
    ld   a, $40
    ld   [de], a
    inc  de
    ld   a, [$FFD7]
    ld   [de], a
    inc  de
    add  a, $10
    ld   [$FFD7], a
    ld   a, [hli]
    inc  hl
    push hl
    push de
    cp   $30
    jr   c, label_5C6F6
    cp   $3A
    jr   nc, label_5C6F6
    sub  a, $30
    add  a, $1A
    jr   label_5C700

label_5C6F6::
    cp   $20
    jr   nz, label_5C6FE
    ld   a, $0F
    jr   label_5C708

label_5C6FE::
    sub  a, $41

label_5C700::
    ld   e, a
    ld   d, $00
    ld   hl, label_5C679
    add  hl, de
    ld   a, [hl]

label_5C708::
    pop  de
    pop  hl
    ld   [de], a
    inc  de
    ld   a, $10
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5C6D8
    ret

label_5C714::
    jr   nz, label_5C746
    ld   hl, label_2231
    ldi  [hl], a
    inc  hl
    inc  sp
    inc  h
    inc  [hl]
    inc  h
    dec  [hl]
    ldi  [hl], a
    ldd  [hl], a
    ld   [hl], $30
    daa
    daa
    jr   z, label_5C760
    add  hl, hl
    add  hl, sp
    ld   d, $17
    ld   a, [hli]
    db   $3A ; ldd  a, [hl]
    dec  hl
    dec  sp
    jr   nz, label_5C752
    ld   hl, $0035
    nop
    ld   hl, label_2C26
    inc  a
    dec  l
    dec  a
    ld   [hl], $20
    nop
    nop
    ld   l, $3E
    nop
    nop
    ld   [hl], $25

label_5C746::
    scf
    scf
    inc  d
    dec  d
    ld   [de], a
    inc  de

label_5C74C::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction

label_5C752::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   d, b
    db   $10 ; Undefined instruction
    ld   d, b
    db   $10 ; Undefined instruction

label_5C760::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   d, b
    ld   d, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   d, b
    db   $10 ; Undefined instruction
    ld   [hl], b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction

label_5C784::
    ld   a, [$D011]
    rla
    and  $FE
    ld   e, a
    ld   d, $00
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    and  $F0
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   hl, label_5C1DF
    add  hl, de
    push hl
    xor  a
    ld   [$FFD8], a
    ld   de, $C054
    ld   a, [$FFFE]
    and  a
    jr   z, label_5C7B1
    ld   de, $C024

label_5C7B1::
    ld   a, $55
    call label_5C7C8
    ld   hl, $FFD8
    inc  [hl]
    pop  hl
    ld   de, $C078
    ld   a, [$FFFE]
    and  a
    jr   z, label_5C7C6
    ld   de, $C048

label_5C7C6::
    ld   a, $5D

label_5C7C8::
    ld   [$FFE9], a
    ld   c, $12
    ld   b, $08
    ld   a, [$D011]
    cp   $25
    ld   a, $38
    jr   z, label_5C7E6
    ld   c, $09
    ld   b, $10
    ld   a, [$FFE7]
    and  $01
    ld   a, $10
    jr   z, label_5C7E6
    inc  hl
    ld   a, $18

label_5C7E6::
    ld   [$FFD7], a

label_5C7E8::
    ld   a, [$FFE9]
    ld   [de], a
    inc  de
    ld   a, [$FFD7]
    ld   [de], a
    inc  de
    add  a, b
    ld   [$FFD7], a
    ld   a, [$D011]
    cp   $25
    ld   a, [hli]
    jr   z, label_5C7FC
    inc  hl

label_5C7FC::
    push hl
    push de
    cp   $26
    jr   nz, label_5C806
    ld   a, $1A
    jr   label_5C818

label_5C806::
    cp   $32
    jr   nz, label_5C80E
    ld   a, $1B
    jr   label_5C818

label_5C80E::
    cp   $20
    jr   nz, label_5C816
    ld   a, $0F
    jr   label_5C82D

label_5C816::
    sub  a, $41

label_5C818::
    sla  a
    ld   hl, $FFD8
    add  a, [hl]
    ld   e, a
    ld   d, $00
    ld   hl, label_5C74C
    add  hl, de
    ld   a, [hl]
    ld   [$FFE8], a
    ld   hl, label_5C714
    add  hl, de
    ld   a, [hl]

label_5C82D::
    pop  de
    pop  hl
    ld   [de], a
    inc  de
    ld   a, [$FFE8]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5C7E8
    ret

label_5C839::
    ld   a, [$C114]
    inc  a
    cp   $C0
    jr   c, label_5C846
    ld   a, $0F
    ld   [$FFF4], a
    xor  a

label_5C846::
    ld   [$C114], a
    ld   a, [$D466]
    and  a
    jr   nz, label_5C85D
    ld   a, $21
    ld   [$FFF2], a
    call label_280D
    and  $7F
    add  a, $50
    ld   [$D466], a

label_5C85D::
    dec  a
    ld   [$D466], a
    ret

label_5C862::
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

label_5C877::
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

label_5C88C::
    ld   a, [$FFE7]
    and  $0F
    cp   $02
    jr   nz, label_5C8CC
    push de
    ld   hl, $D601
    ld   a, d
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, $13
    ldi  [hl], a
    ld   de, label_5C862
    ld   a, [$FFE7]
    and  $10
    jr   z, label_5C8A9
    inc  de

label_5C8A9::
    ld   c, $14

label_5C8AB::
    ld   a, [de]
    ldi  [hl], a
    dec  c
    jr   nz, label_5C8AB
    pop  de
    ld   a, d
    ldi  [hl], a
    ld   a, e
    sub  a, $20
    ldi  [hl], a
    ld   a, $13
    ldi  [hl], a
    ld   de, label_5C877
    ld   a, [$FFE7]
    and  $10
    jr   z, label_5C8C4
    inc  de

label_5C8C4::
    ld   c, $14

label_5C8C6::
    ld   a, [de]
    ldi  [hl], a
    dec  c
    jr   nz, label_5C8C6
    ld   [hl], c

label_5C8CC::
    ret

label_5C8CD::
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    rst  $30
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    rst  $30
    rst  $30
    or   $F5
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_5C8CD
    add  hl, de
    ld   a, [hl]
    sub  a, $05
    ld   [rSCY], a
    ld   [$FFE8], a
    ld   a, [$C17F]
    cp   $FE
    ret  z
    ld   a, [$C180]
    inc  a
    ld   [$C180], a
    ld   a, [$D005]
    ld   [$FFD8], a
    ld   hl, $C17C
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5C964

label_5C911::
    ld   a, [$FF41]
    and  $03
    jr   nz, label_5C911
    ld   d, $00

label_5C919::
    ld   a, [$C17E]
    inc  a
    ld   [$C17E], a
    and  $01
    jr   nz, label_5C919
    ld   a, [$C17C]
    add  a, $01
    ld   [$C17C], a
    ld   a, [$C17D]
    adc  a, $00
    ld   [$C17D], a
    ld   a, [$C17C]
    cp   $50
    jr   z, label_5C960
    ld   hl, $C180
    ld   a, [$C17C]
    add  a, [hl]
    and  $1F
    ld   hl, $FFD8
    or   [hl]
    ld   e, a
    ld   hl, label_5C9B7
    add  hl, de
    ld   a, [hl]
    push af
    ld   hl, $FF96
    add  a, [hl]
    ld   [rSCX], a
    pop  af
    sra  a
    ld   hl, $FFE8
    add  a, [hl]
    ld   [rSCY], a
    jr   label_5C911

label_5C960::
    xor  a
    ld   [rSCX], a
    ret

label_5C964::
    ld   a, [$FF41]
    and  $03
    jr   nz, label_5C964
    ld   d, $00

label_5C96C::
    ld   a, [$C17E]
    inc  a
    ld   [$C17E], a
    and  $01
    jr   nz, label_5C96C
    ld   a, [$C17C]
    add  a, $01
    ld   [$C17C], a
    ld   a, [$C17D]
    adc  a, $00
    ld   [$C17D], a
    ld   a, [$C17C]
    cp   $60
    jr   z, label_5C9B3
    ld   hl, $C180
    ld   a, [$C17C]
    add  a, [hl]
    and  $1F
    ld   hl, $FFD8
    or   [hl]
    ld   e, a
    ld   hl, label_5C9B7
    add  hl, de
    ld   a, [hl]
    push af
    ld   hl, $FF96
    add  a, [hl]
    ld   [rSCX], a
    pop  af
    sra  a
    ld   hl, $FFE8
    add  a, [hl]
    ld   [rSCY], a
    jr   label_5C964

label_5C9B3::
    xor  a
    ld   [rSCX], a
    ret

label_5C9B7::
    nop
    dec  b
    add  hl, bc
    inc  c
    dec  c
    ld   c, $0E
    rrca
    rrca
    rrca
    ld   c, $0E
    dec  c
    inc  c
    add  hl, bc
    dec  b
    nop
    ei
    rst  $30
    db   $F4 ; Undefined instruction
    di
    ld   a, [$FF00+C]
    pop  af
    pop  af
    pop  af
    ld   a, [$FF00+C]
    di
    db   $F4 ; Undefined instruction
    rst  $30
    ei
    nop
    inc  b
    rlca
    add  hl, bc
    dec  bc
    inc  c
    inc  c
    dec  c
    dec  c
    dec  c
    inc  c
    inc  c
    dec  bc
    add  hl, bc
    rlca
    inc  b
    nop
    db   $FC ; Undefined instruction
    ld   sp, hl
    rst  $30
    push af
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    di
    di
    di
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    push af
    rst  $30
    ld   sp, hl
    db   $FC ; Undefined instruction
    nop
    inc  bc
    dec  b
    rlca
    ld   [label_A09], sp
    dec  bc
    dec  bc
    dec  bc
    ld   a, [bc]
    add  hl, bc
    ld   [label_507], sp
    inc  bc
    nop
    db   $FD ; Undefined instruction
    ei
    ld   sp, hl
    ld    hl, sp+$F7
    or   $F5
    push af
    push af
    or   $F7
    ld    hl, sp+$F9
    ei
    db   $FD ; Undefined instruction
    nop
    inc  bc
    dec  b
    ld   b, $07
    ld   [label_908], sp
    add  hl, bc
    add  hl, bc
    ld   [label_708], sp
    ld   b, $05
    inc  bc
    nop
    db   $FD ; Undefined instruction
    ei
    ld   a, [$F8F9]
    ld    hl, sp+$F7
    rst  $30
    rst  $30
    ld    hl, sp+$F8
    ld   sp, hl
    ld   a, [$FDFB]
    nop
    ld   [bc], a
    inc  b
    dec  b
    dec  b
    ld   b, $06
    rlca
    rlca
    rlca
    ld   b, $06
    dec  b
    dec  b
    inc  b
    ld   [bc], a
    nop
    cp   $FC
    ei
    ei
    ld   a, [$F9FA]
    ld   sp, hl
    ld   sp, hl
    ld   a, [$FBFA]
    ei
    db   $FC ; Undefined instruction
    cp   $00
    ld   bc, label_302
    inc  bc
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   [bc], a
    ld   bc, rJOYP
    cp   $FD
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ei
    ei
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    nop
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    nop
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    cp   $FD
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    cp   $FF
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    ld   a, [$FFCC]
    and  $0C
    jr   z, label_5CAC7
    ld   a, [$0004]
    and  a
    jr   z, label_5CAC7
    xor  a
    ld   [$DB96], a

label_5CAC7::
    ld   a, [$FFCC]
    and  $03
    jr   z, label_5CAD6
    ld   a, [$0004]
    and  a
    jr   z, label_5CAD6
    call label_5E4DE

label_5CAD6::
    ld   a, [$D006]
    and  a
    jr   z, label_5CAE0
    dec  a
    ld   [$D006], a

label_5CAE0::
    ld   a, [$D007]
    and  a
    jr   z, label_5CAEA
    dec  a
    ld   [$D007], a

label_5CAEA::
    ld   a, [$D008]
    and  a
    jr   z, label_5CAF4
    dec  a
    ld   [$D008], a

label_5CAF4::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5CB04
    ld   a, [$D009]
    and  a
    jr   z, label_5CB04
    dec  a
    ld   [$D009], a

label_5CB04::
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_5CB14
    ld   a, [$D013]
    and  a
    jr   z, label_5CB14
    dec  a
    ld   [$D013], a

label_5CB14::
    ld   a, [$D01E]
    and  a
    jr   z, label_5CB22
    dec  a
    ld   [$D01E], a
    ld   hl, $D008
    inc  [hl]

label_5CB22::
    ld   a, [$DB96]
    rst  0
    jp  c, label_E04B
    ld   c, e
    ld   h, b
    ld   c, h
    dec  d
    ld   h, c
    ld   b, [hl]
    ld   h, b
    ld   c, d
    ld   h, d
    add  hl, bc
    ld   l, b
    dec  e
    ld   l, l
    ld   l, a
    ld   l, [hl]
    ret  nz
    ld   l, a

label_5CB3A::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0001
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

label_5CBBA::
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    nop

label_5CBCA::
    inc  e
    inc  e
    inc  e
    inc  e
    jr   label_5CBE8
    jr   label_5CBEA
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    call label_5CDA5
    jp   label_5CC5B
    call label_EED
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5CC03
    ld   a, [$D001]
    inc  a
    ld   [$D001], a
    cp   $0D
    jr   nz, label_5CBF7
    jp   label_5CC22

label_5CBF7::
    ld   a, [$FFFE]
    and  a
    jr   z, label_5CC03
    ld   a, [$D001]
    dec  a
    jp   label_5FF30

label_5CC03::
    ld   a, [$D001]
    ld   e, a
    ld   a, [$FFE7]
    and  $03
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_5CBBA
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   [$DB99], a
    ld   hl, label_5CBCA
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ret

label_5CC22::
    call label_29C1
    ld   hl, $D700
    ld   de, label_5CB3A
    ld   c, $80
    ld   a, $01

label_5CC2F::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_5CC2F
    call label_27F2
    ld   a, $01
    ld   [rIE], a
    ld   a, $00
    ld   [rLYC], a
    ld   hl, $D6FD
    res  3, [hl]
    call label_5CDA5
    call label_5CC5B
    ld   a, $59
    ld   [$D368], a
    ld   a, $40
    ld   [$D006], a
    ld   a, $04
    ld   [$C16B], a
    ret

label_5CC5B::
    ld   hl, $DB96
    inc  [hl]
    ret
    ld   a, $80
    ld   [$DB56], a
    xor  a
    ld   [$DBA5], a
    ld   [$FFF8], a
    ld   a, $01
    ld   [$C3C8], a
    ld   a, $92
    ld   [$FFF6], a
    ld   a, $FF
    ld   [$DBC7], a
    call label_EED
    ld   a, [$D00E]
    rst  0
    or   d
    ld   c, h
    sbc  a, $4C
    add  hl, sp
    ld   c, l
    add  a, c
    ld   c, l
    add  hl, de
    ld   c, [hl]
    ld   b, [hl]
    ld   c, [hl]
    add  a, l
    ld   c, [hl]
    cp   [hl]
    ld   c, [hl]
    rst  8
    ld   d, b
    ld   b, b
    ld   d, c
    ld   [rHDMA3], a
    di
    ld   d, e
    db   $FD ; Undefined instruction
    ld   d, e
    ld   l, $54
    cp   h
    ld   d, h
    dec  bc
    ld   d, l
    jr   nz, label_5CCF7
    ld   l, e
    ld   d, l
    ld   [$FD55], a
    ld   d, l
    db   $5A
    ld   e, d
    ld   h, a
    ld   e, e
    ld   [bc], a
    ld   e, a
    ret
    ld   e, a
    inc  h
    ld   h, b
    ld   a, $FF
    ld   [$DB9A], a
    ld   a, $1F
    ld   [$D6FE], a
    ld   a, $01
    ld   [$DDD5], a
    xor  a
    ld   [$FF96], a
    ld   [$C155], a
    ld   [$C156], a
    ld   [$FF97], a
    ld   hl, $C124
    ld   e, $00

label_5CCD1::
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, label_5CCD1

label_5CCD9::
    ld   hl, $D00E
    inc  [hl]
    ret
    ld   a, $16
    ld   [$D6FF], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $40
    ld   hl, $C210
    add  hl, de
    ld   [hl], $E0
    ld   a, $E8
    call label_3B86
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   a, $50

label_5CD00::
    ld   [$FF98], a
    ld   a, $98
    ld   [$FF99], a
    jp   label_5CCD9

label_5CD09::
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_1616
    ld   d, $16
    daa
    daa
    daa
    daa

label_5CD19::
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    jr   label_5CD3B
    jr   label_5CD3D
    inc  e
    inc  e
    inc  e
    inc  e

label_5CD29::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    sub  a, b
    sub  a, b
    sub  a, b
    sub  a, b
    ld   a, [$D006]
    ld   e, a

label_5CD3D::
    ld   a, [$FFE7]
    and  $07
    or   e
    jr   nz, label_5CD5E
    ld   a, [$D001]
    inc  a
    ld   [$D001], a
    cp   $0C
    jr   nz, label_5CD52
    call label_5CCD9

label_5CD52::
    ld   a, [$FFFE]
    and  a
    jr   z, label_5CD5E
    ld   a, [$D001]
    dec  a
    jp   label_5FE80

label_5CD5E::
    ld   a, [$D001]
    ld   e, a
    ld   a, [$FFE7]
    and  $03
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_5CD09
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_5CD19
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_5CD29
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    ld   a, [$D003]
    add  a, $18
    ld   [$D003], a
    jr   nc, label_5CD8F
    ld   hl, $C21E
    inc  [hl]

label_5CD8F::
    ld   a, [$D002]
    add  a, $40
    ld   [$D002], a
    jr   nc, label_5CDD0
    ld   a, [$FF97]
    dec  a
    ld   [$FF97], a
    cp   $90
    jr   nz, label_5CDD0
    call label_5CCD9

label_5CDA5::
    xor  a
    ld   [$D000], a
    ld   [$D001], a
    ld   [$D002], a
    ld   [$D003], a
    ld   [$D004], a
    ld   [$D005], a
    ld   [$D00A], a
    ld   [$D00B], a
    ld   [$D00C], a
    ld   [$D00D], a
    ld   [$D006], a
    ld   [$D007], a
    ld   [$D008], a
    ld   [$D009], a

label_5CDD0::
    ret

label_5CDD1::
    sbc  a, b
    nop
    ld   d, e
    and  b
    sbc  a, b
    jr   nz, label_5CE2B
    and  b
    sbc  a, b
    ld   b, b
    ld   d, e
    and  b
    sbc  a, b
    ld   h, b
    ld   d, e
    and  b
    sbc  a, b
    add  a, b
    ld   d, e
    and  b
    sbc  a, b
    and  b
    ld   d, e
    and  b
    sbc  a, b
    ret  nz
    ld   d, e
    and  b
    sbc  a, b
    ld   [rHDMA3], a
    and  b
    sbc  a, c
    nop
    ld   d, e
    and  b
    sbc  a, c
    jr   nz, label_5CE4B
    and  b
    sbc  a, c
    ld   b, b
    ld   d, e
    and  b
    sbc  a, c
    ld   h, b
    ld   d, e
    and  b
    sbc  a, c
    add  a, b
    ld   d, e
    and  b
    sbc  a, c
    and  b
    ld   d, e
    and  b
    sbc  a, c
    ret  nz
    ld   d, e
    and  b
    sbc  a, c
    ld   [rHDMA3], a
    and  b
    sbc  a, d
    nop
    ld   d, e
    and  b
    sbc  a, d
    jr   nz, label_5CE6B
    and  b
    ld   a, [$D000]
    cp   $09
    jr   nz, label_5CE27
    ld   a, $F0
    ld   [$FF97], a
    jp   label_5CCD9

label_5CE27::
    ld   e, a
    inc  a
    ld   [$D000], a
    sla  e
    sla  e
    sla  e
    ld   d, $00
    ld   hl, label_5CDD1
    add  hl, de
    ld   de, $D601
    ld   c, $08

label_5CE3D::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5CE3D
    xor  a
    ld   [de], a
    ret
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$D014]
    cp   $0E
    ret  z
    ld   bc, $D601
    ld   de, $DC91
    ld   hl, $9880
    swap a
    sla  a
    push af
    ld   a, h
    adc  a, $00
    ld   h, a
    pop  af
    add  a, l
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   [bc], a
    ld   [de], a
    inc  bc

label_5CE6B::
    inc  de
    ld   a, l
    ld   [bc], a
    ld   [de], a
    inc  bc
    inc  de
    ld   a, $53
    ld   [bc], a
    ld   [de], a
    inc  bc
    inc  de
    ld   a, $A0
    ld   [bc], a
    xor  a
    ld   [de], a
    inc  bc
    inc  de
    ld   [bc], a
    ld   [de], a
    ld   hl, $D014
    inc  [hl]
    ret
    call label_5CDA5
    ld   a, $08
    ld   [$D006], a
    call label_5CE93
    jp   label_5CCD9

label_5CE93::
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   hl, $DC10
    ld   b, $40
    xor  a

label_5CE9D::
    ldi  [hl], a
    dec  b
    jr   nz, label_5CE9D
    ld   hl, $DC1E
    dec  a
    ldi  [hl], a
    ld   a, $47
    ld   [hl], a
    xor  a
    ld   [$DDD3], a
    ld   a, $20
    ld   [$DDD4], a
    ld   a, $81
    ld   [$DDD1], a
    ret

label_5CEB8::
    daa
    daa
    db   $EB ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFE7]
    and  $01
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5CEB8
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   a, [$D006]
    and  a
    jr   nz, label_5CEEE
    ld   a, $08
    ld   [$D006], a
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    cp   $05
    jr   nz, label_5CEEE
    call label_5CDA5
    jp   label_5CCD9

label_5CEEE::
    ret

label_5CEEF::
    sbc  a, e
    ret  nz
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
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    nop
    sbc  a, e

label_5CF08::
    ld   [rNR13], a
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
    ld   a, e
    ld   a, h
    ld   a, l
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    nop
    sbc  a, b
    nop
    inc  de
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $A0
    and  b
    and  b
    nop
    sbc  a, b
    jr   nz, label_5CF4D
    and  b
    and  b
    and  b
    and  b
    and  b
    inc  de
    inc  d
    dec  d
    ld   d, $17
    jr   label_5CF5F
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    and  b

label_5CF4D::
    and  b
    nop
    sbc  a, b
    ld   b, b
    inc  de
    and  b
    and  b
    and  b
    and  b
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_5CF87
    ld   a, [hli]

label_5CF5F::
    dec  hl
    inc  l
    dec  l
    ld   l, $2F
    and  b
    and  b
    nop
    sbc  a, b
    ld   h, b
    inc  de
    and  b
    and  b
    and  b
    ld   sp, label_3332
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    jr   c, label_5CFAF
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    dec  a
    ld   a, $3F
    and  b
    and  b
    nop
    sbc  a, b
    add  a, b
    inc  de
    and  b
    and  b
    ld   b, b
    ld   b, c
    ld   b, d

label_5CF87::
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, e
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    and  b
    and  b
    nop
    sbc  a, b
    and  b
    inc  de
    and  b
    and  b
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
    and  b
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    and  b
    and  b
    nop

label_5CFAF::
    sbc  a, b
    ret  nz
    inc  de
    and  b
    and  b
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    and  b
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    and  b
    and  b
    nop
    sbc  a, b
    ld   [rNR13], a
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    and  b
    and  b
    and  b
    ld   a, [hl]
    xor  a
    and  b
    and  b
    nop

label_5CFDF::
    sbc  a, e
    ret  nz
    inc  de
    nop
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
    sbc  a, e
    ld   [rNR13], a
    nop
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
    sbc  a, b
    nop
    inc  de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_401
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    sbc  a, b
    jr   nz, label_5D03D
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    rlca
    inc  b
    ld   b, $06
    ld   b, $06
    ld   b, $04
    inc  b
    dec  b
    nop

label_5D03D::
    nop

label_5D03E::
    nop
    sbc  a, b
    ld   b, b
    inc  de
    nop
    nop
    nop
    nop
    ld   bc, label_707
    rlca
    ld   [bc], a
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    nop
    nop
    nop
    sbc  a, b
    ld   h, b
    inc  de
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  b
    nop
    ld   [bc], a
    inc  bc
    inc  bc
    nop
    nop
    inc  b
    inc  bc
    nop
    nop
    nop
    sbc  a, b
    add  a, b
    inc  de
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    dec  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    dec  b
    dec  b
    inc  bc
    inc  bc
    nop
    nop
    nop
    sbc  a, b
    and  b
    inc  de
    nop
    nop
    nop
    nop
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
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    sbc  a, b
    ret  nz
    inc  de
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    sbc  a, b
    ld   [rNR13], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [$D000]
    cp   $0A
    jr   nz, label_5D0F9
    ld   a, $F0
    ld   [$FF97], a
    call label_5CDA5
    ld   a, $01
    ld   [rIE], a
    ld   a, $56
    ld   [rLYC], a
    ld   a, $0C
    ld   [$D006], a
    ld   a, $FF
    ld   [$C17F], a
    ld   a, $09
    ld   [$D00E], a
    ld   a, $1F
    ld   [$FFF3], a
    ret

label_5D0F9::
    ld   e, a
    inc  a
    ld   [$D000], a
    sla  e
    sla  e
    sla  e
    ld   a, e
    sla  e
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5CEEF
    add  hl, de
    push de
    ld   de, $D601
    ld   c, $18

label_5D115::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5D115
    pop  de
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   hl, label_5CFDF
    add  hl, de
    ld   de, $DC91
    ld   c, $18

label_5D129::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5D129
    ret

label_5D130::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   a
    cp   a
    cp   a
    cp   a
    ld   l, e
    ld   l, e
    ld   l, e
    ld   l, e
    daa
    daa
    daa
    daa
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D151
    ld   a, $01
    call label_5D3A7
    jr   label_5D160

label_5D151::
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5D130
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a

label_5D160::
    ld   a, [$D006]
    and  a
    jr   nz, label_5D176
    ld   a, [$D00A]
    cp   $0C
    jr   z, label_5D176
    inc  a
    ld   [$D00A], a
    ld   a, $0C
    ld   [$D006], a

label_5D176::
    ld   a, [$D00A]
    cp   $07
    jr   c, label_5D1A6
    ld   a, [$D00B]
    inc  a
    ld   [$D00B], a
    and  $0F
    jr   nz, label_5D1A6
    ld   a, [$D005]
    add  a, $20
    ld   [$D005], a
    jr   nz, label_5D1A6
    ld   a, $FE
    ld   [$C17F], a
    call label_5CDA5
    ld   a, $40
    ld   [$D006], a
    ld   a, $03
    ld   [rIE], a
    jp   label_5CCD9

label_5D1A6::
    ret

label_5D1A7::
    nop
    nop
    ld   [rSTAT], a
    rst  $20
    inc  e
    cp   $73
    nop
    nop
    rst  $18
    jr   c, label_5D224
    inc  e
    rst  $38
    ld   b, a
    rst  $28
    ldi  [hl], a
    or   l
    ld   [bc], a
    rst  $20
    inc  e
    cp   $73
    nop
    nop
    rst  $28
    ldi  [hl], a
    rst  $20
    inc  e
    cp   $73
    nop
    nop
    inc  d
    inc  l
    rst  $20
    inc  e
    cp   $73
    nop
    nop
    rrca

label_5D1D2::
    ld   a, h
    rst  $20
    inc  e
    cp   $73
    inc  d
    inc  l
    rrca
    ld   a, h
    rst  $20
    inc  e
    cp   $73
    or   l
    ld   [bc], a
    rst  $18
    jr   c, label_5D254
    inc  e
    cp   $73
    nop
    nop
    and  b
    add  hl, sp
    add  a, $18
    ld   a, d
    ld   h, e
    nop
    nop

label_5D1F1::
    db   $DB
    jr   nc, label_5D262
    jr   label_5D1F5
    ld   b, a
    adc  a, l
    ld   e, $52
    ld   [bc], a
    add  a, $18
    ld   a, d
    ld   h, e
    nop
    nop
    adc  a, l
    ld   e, $C6
    jr   label_5D280
    ld   h, e
    nop
    nop
    ld   [de], a
    jr   z, label_5D1D2
    jr   label_5D288
    ld   h, e
    nop
    nop
    dec  c
    ld   l, h
    add  a, $18
    ld   a, d
    ld   h, e
    ld   [de], a
    jr   z, label_5D227
    ld   l, h
    add  a, $18
    ld   a, d
    ld   h, e
    ld   d, d
    ld   [bc], a
    db   $DB
    jr   nc, label_5D292

label_5D224::
    jr   label_5D2A0
    ld   h, e

label_5D227::
    nop
    nop
    ld   h, b
    ld   sp, label_14A5
    or   $52
    nop
    nop
    or   a
    jr   z, label_5D2A0
    inc  d
    rst  $38
    ld   b, a
    dec  hl
    ld   a, [de]
    rst  $28
    ld   bc, label_14A5
    or   $52
    nop
    nop
    dec  hl
    ld   a, [de]
    and  l
    inc  d
    or   $52
    nop
    nop
    rrca
    jr   nz, label_5D1F1
    inc  d
    or   $52
    nop
    nop
    dec  bc
    ld   e, h
    and  l

label_5D254::
    inc  d
    or   $52
    rrca
    jr   nz, label_5D265
    ld   e, h
    and  l
    inc  d
    or   $52
    rst  $28
    ld   bc, label_28B7
    ld   l, h
    inc  d

label_5D265::
    or   $52
    nop
    nop
    jr   nz, label_5D294
    add  a, h
    db   $10 ; Undefined instruction
    ld   b, d
    nop
    nop
    sub  a, d
    jr   nz, label_5D2BE
    db   $10 ; Undefined instruction
    ld   b, a
    ret
    dec  d
    adc  a, h
    ld   bc, label_1084
    ld   d, d
    ld   b, d
    nop

label_5D280::
    nop
    ret
    dec  d
    add  a, h
    db   $10 ; Undefined instruction
    ld   b, d
    nop

label_5D288::
    nop
    inc  c
    inc  e
    add  a, h
    db   $10 ; Undefined instruction
    ld   b, d
    nop
    nop
    add  hl, bc

label_5D292::
    ld   c, b
    add  a, h

label_5D294::
    db   $10 ; Undefined instruction
    ld   b, d
    inc  c
    inc  e
    add  hl, bc
    ld   c, b
    add  a, h
    db   $10 ; Undefined instruction
    ld   b, d
    adc  a, h

label_5D2A0::
    ld   bc, label_2092
    ld   c, d
    db   $10 ; Undefined instruction
    ld   b, d
    nop
    nop
    ld   [rNR32], a
    ld   h, e
    inc  c
    call label_31
    nop
    ld   l, [hl]
    jr   label_5D2FB
    inc  c
    rst  $38
    ld   b, a
    ld   b, a
    ld   de, $0129
    ld   h, e
    inc  c
    call label_31
    nop
    ld   b, a
    ld   de, label_C63
    call label_31
    nop
    add  hl, bc
    inc  d
    ld   h, e
    inc  c
    call label_31
    nop
    rlca
    jr   c, label_5D337
    inc  c
    call label_931
    inc  d
    rlca
    jr   c, label_5D33F
    inc  c
    call label_2931
    ld   bc, label_186E
    ld   b, a
    inc  c
    call label_31
    nop
    and  b
    inc  d
    ld   b, d
    ld   [label_2129], sp
    nop
    nop
    ld   c, c
    db   $10 ; Undefined instruction
    ld   [label_5C7FF], sp
    push hl
    inc  c
    add  a, $00

label_5D2FB::
    ld   b, d
    ld   [label_2129], sp
    nop
    nop
    push hl
    inc  c
    ld   b, d
    ld   [label_2129], sp
    nop
    nop
    ld   b, $10
    ld   b, d
    ld   [label_2129], sp
    nop
    nop
    dec  b
    inc  h
    ld   b, d
    ld   [label_2129], sp
    ld   b, $10
    dec  b
    inc  h
    ld   b, d
    ld   [label_2129], sp
    add  a, $00
    ld   c, c
    db   $10 ; Undefined instruction
    ld   [label_2129], sp
    nop
    nop
    ld   h, b
    inc  c
    ld   hl, $A504
    stop
    nop
    dec  h
    ld   [label_423], sp
    rst  $38
    ld   b, a

label_5D337::
    add  a, e
    ld   [$0063], sp
    ld   hl, $A504
    stop
    nop
    add  a, e
    ld   [label_421], sp
    and  l
    stop
    nop
    inc  bc
    ld   [label_421], sp
    and  l
    stop
    nop
    inc  bc
    inc  d
    ld   hl, $A504
    db   $10 ; Undefined instruction
    ld   [label_1403], sp
    ld   hl, $A504
    db   $10 ; Undefined instruction
    nop
    dec  h
    ld   [label_423], sp
    and  l
    stop
    nop
    nop
    nop
    nop
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
    ld   b, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5D3A7::
    and  a
    jr   z, label_5D3B3
    ld   a, [$D00A]
    inc  a
    inc  a
    xor  $0F
    jr   label_5D3B8

label_5D3B3::
    ld   a, [$D00A]
    inc  a
    inc  a

label_5D3B8::
    and  $FE
    swap a
    sla  a
    ld   c, a
    ld   a, $00
    adc  a, $00
    ld   b, a
    ld   hl, label_5D1A7
    add  hl, bc
    ld   bc, $0040
    ld   de, $DC10
    call label_2914
    xor  a
    ld   [$DDD3], a
    ld   a, $20
    ld   [$DDD4], a
    ld   a, $81
    ld   [$DDD1], a
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5D3F2
    call label_5CCD9
    ld   a, $D0

label_5D3EB::
    call label_5FCF0
    ld   a, $17
    ld   [$FFF3], a

label_5D3F2::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_5D3FC
    call label_5CCD9

label_5D3FC::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_5D41D
    ld   a, $01
    ld   [rIE], a
    ld   a, $FF
    ld   [$C17F], a
    ld   a, $E0
    ld   [$D005], a
    ld   a, $50
    ld   [$D006], a
    ld   a, $1F
    ld   [$FFF3], a
    call label_5CCD9

label_5D41D::
    ret

label_5D41E::
    daa
    daa
    daa
    daa
    ld   l, e
    ld   l, e
    ld   l, e
    ld   l, e
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D43E
    xor  a
    call label_5D3A7
    jr   label_5D44D

label_5D43E::
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5D41E
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a

label_5D44D::
    ld   a, [$D005]
    cp   $A0
    jr   nc, label_5D47D
    ld   a, [$D006]
    and  a
    jr   nz, label_5D47D
    ld   a, $0C
    ld   [$D006], a
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    cp   $0D
    jr   nz, label_5D47D
    xor  a
    ld   [$C17F], a
    call label_5CDA5
    ld   a, $30
    ld   [$D006], a
    ld   a, $01
    ld   [rIE], a
    jp   label_5CCD9

label_5D47D::
    ld   a, [$D00B]
    inc  a
    ld   [$D00B], a
    and  $0F
    jr   nz, label_5D493
    ld   a, [$D005]
    and  a
    jr   z, label_5D493
    sub  a, $20
    ld   [$D005], a

label_5D493::
    ret

label_5D494::
    sbc  a, e
    ret  nz
    ld   d, e
    and  b
    sbc  a, e
    ld   [rHDMA3], a
    and  b
    sbc  a, b
    nop
    ld   d, e
    and  b
    sbc  a, b
    jr   nz, label_5D4F6
    and  b
    sbc  a, b
    ld   b, b
    ld   d, e
    and  b
    sbc  a, b
    ld   h, b
    ld   d, e
    and  b
    sbc  a, b
    add  a, b
    ld   d, e
    and  b
    sbc  a, b
    and  b
    ld   d, e
    and  b
    sbc  a, b
    ret  nz
    ld   d, e
    and  b
    sbc  a, b
    ld   [rHDMA3], a
    and  b
    ld   a, [$D006]
    and  a
    ret  nz
    ld   a, [$D000]
    cp   $0A
    jr   nz, label_5D4D5
    ld   a, $D2
    call label_5D3EB
    ld   a, $27
    ld   [$DB97], a
    jp   label_5CCD9

label_5D4D5::
    ld   e, a
    inc  a
    ld   [$D000], a
    sla  e
    sla  e
    ld   d, $00
    ld   hl, label_5D494
    add  hl, de
    push de
    ld   de, $D601
    ld   c, $04

label_5D4EA::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5D4EA
    xor  a
    ld   [de], a
    pop  de
    ld   a, [$FFFE]
    and  a

label_5D4F6::
    ret  z
    ld   hl, label_5D494
    add  hl, de
    ld   de, $DC91
    ld   c, $03

label_5D500::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5D500
    xor  a
    ld   [de], a
    inc  de
    ld   [de], a
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_5D51F
    call label_5CDA5
    ld   a, $03
    ld   [$FF9D], a
    ld   a, $0C
    ld   [$FFA5], a
    call label_5CCD9

label_5D51F::
    ret
    ld   a, [$D000]
    cp   $07
    jr   nz, label_5D532
    call label_5CDA5
    ld   a, $80
    ld   [$D006], a
    jp   label_5CCD9

label_5D532::
    inc  a
    ld   [$D000], a
    ld   a, $0C
    ld   [$FFA5], a
    ret

label_5D53B::
    ld   c, b
    ld   e, b
    ld   h, b
    ld   h, b
    ld   e, b
    ld   c, b
    ld   b, b
    ld   b, b

label_5D543::
    ld   b, b
    ld   b, b
    ld   c, b
    ld   e, b
    ld   h, b
    ld   h, b
    ld   e, b
    ld   c, b

label_5D54B::
    rst  $38
    ld   bc, label_202
    ld   bc, $FEFF
    cp   $FE
    cp   $FF
    ld   bc, label_202
    ld   bc, $00FF
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07

label_5D563::
    nop
    ld   [label_1810], sp
    jr   nz, label_5D591
    jr   nc, label_5D5A3
    ld   a, [$D006]
    and  a
    jr   nz, label_5D5E9
    ld   a, $04
    ld   [$FF9D], a
    ld   a, $3F
    ld   [$D368], a

label_5D57A::
    ld   a, $E8
    call label_3B86
    ld   a, [$D000]
    ld   c, a
    ld   b, $00
    ld   hl, label_5D53B
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_5D543
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    sub  a, $20
    ld   [hl], a
    ld   hl, label_5D54B
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240

label_5D5A3::
    add  hl, de
    ld   [hl], a
    ld   hl, label_5D553
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, label_5D55B
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, label_5D563
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $03
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C450
    add  hl, de
    ld   [hl], $20
    ld   a, c
    inc  a
    ld   [$D000], a
    cp   $08
    jr   nz, label_5D57A
    call label_5CDA5
    ld   a, $A0
    ld   [$D006], a
    call label_5CCD9

label_5D5E9::
    ret
    ld   a, [$D006]
    cp   $9E
    jr   nz, label_5D5F6
    ld   hl, $FFF2
    ld   [hl], $34

label_5D5F6::
    and  a
    jr   nz, label_5D5FC
    call label_5CCD9

label_5D5FC::
    ret
    ld   a, [$D000]
    rst  0
    ld   h, l
    ld   d, [hl]
    ret
    ld   d, [hl]
    jr   z, label_5D65E
    dec  a
    ld   d, a
    sub  a, h
    ld   d, a
    and  d
    ld   d, a
    ld   sp, hl
    ld   d, a
    rlca
    ld   e, b
    inc  a
    ld   e, b
    ld   c, d
    ld   e, b
    jp   label_D158
    ld   e, b
    ld   a, [$FF58]
    ld    hl, sp+$58
    dec  bc
    ld   e, c
    jr   c, label_5D67A
    ld   h, [hl]
    ld   e, d
    call label_215A
    nop
    ret  nc
    inc  [hl]
    ret

label_5D62A::
    ld   e, $10
    ld   hl, $C280
    xor  a

label_5D630::
    ldi  [hl], a
    dec  e
    jr   nz, label_5D630
    ret

label_5D635::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    xor  d
    xor  d
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    ld   d, l
    ld   d, l
    nop
    nop
    nop
    nop

label_5D645::
    inc  e
    inc  e
    inc  e
    inc  e
    jr   label_5D663
    jr   label_5D665
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop

label_5D655::
    sub  a, b
    sub  a, b
    sub  a, b
    sub  a, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    nop

label_5D65E::
    nop
    nop
    nop
    nop
    nop

label_5D663::
    nop
    nop

label_5D665::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5D695
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    cp   $0C
    jr   nz, label_5D689
    ld   a, $1D
    ld   [$D6FE], a
    ld   a, $01
    ld   [$DDD5], a
    xor  a
    ld   [$FF97], a
    call label_5D62A
    jp   label_5D625

label_5D689::
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D695
    ld   a, [$D00A]
    dec  a
    jp   label_5FF30

label_5D695::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5D635
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_5D645
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_5D655
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    ret

label_5D6BA::
    ld   a, [$FFE7]
    ld   e, $01
    and  $04
    jr   z, label_5D6C4
    ld   e, $FE

label_5D6C4::
    ld   hl, $C155
    ld   [hl], e
    ret
    xor  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D6D7
    call label_5DB00
    jr   label_5D6DC

label_5D6D7::
    ld   a, $20
    ld   [$D6FF], a

label_5D6DC::
    ld   a, $6D
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $48
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    ld   a, $6F
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $68
    ld   hl, $C210
    add  hl, de
    ld   [hl], $30
    ld   a, $78
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $2C
    ld   hl, $C210
    add  hl, de
    ld   [hl], $58
    ld   a, $78
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $60
    ld   hl, $C210
    add  hl, de
    ld   [hl], $52
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    jp   label_5D625
    call label_5D970
    jr   nz, label_5D735
    ld   a, $50
    ld   [$D006], a
    jp   label_5D625

label_5D735::
    ret

label_5D736::
    ld   a, [$FFCB]
    and  $30
    ret  nz
    nop
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5D793
    call label_5D736
    call label_5D9FD
    jr   nz, label_5D793
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D755
    call label_5DB00
    jr   label_5D75A

label_5D755::
    ld   a, $1E
    ld   [$D6FF], a

label_5D75A::
    call label_5D62A
    ld   a, $71
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $48
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    ld   hl, $C290
    add  hl, de
    inc  [hl]
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20
    ld   hl, $C380
    add  hl, de
    ld   [hl], $02
    ld   a, $72
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $78
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    jp   label_5D625

label_5D793::
    ret
    call label_5D970
    jr   nz, label_5D7A1
    ld   a, $50
    ld   [$D006], a
    jp   label_5D625

label_5D7A1::
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5D7F8
    call label_5D736
    call label_5D9FD
    jr   nz, label_5D7F8
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D7BA
    call label_5DB00
    jr   label_5D7BF

label_5D7BA::
    ld   a, $22
    ld   [$D6FF], a

label_5D7BF::
    call label_5D62A
    ld   a, $C5
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $28
    ld   hl, $C210
    add  hl, de
    ld   [hl], $40
    ld   a, $09
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $48
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    ld   a, $09
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $68
    ld   hl, $C210
    add  hl, de
    ld   [hl], $60
    jp   label_5D625

label_5D7F8::
    ret
    call label_5D970
    jr   nz, label_5D806
    ld   a, $50
    ld   [$D006], a
    jp   label_5D625

label_5D806::
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5D83B
    call label_5D736
    call label_5D9FD
    jr   nz, label_5D83B
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D81F
    call label_5DB00
    jr   label_5D824

label_5D81F::
    ld   a, $21
    ld   [$D6FF], a

label_5D824::
    call label_5D62A
    ld   a, $3F
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $78
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    jp   label_5D625

label_5D83B::
    ret
    call label_5D970
    jr   nz, label_5D849
    ld   a, $50
    ld   [$D006], a
    jp   label_5D625

label_5D849::
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5D8C2
    call label_5D736
    call label_5D9FD
    jr   nz, label_5D8C2
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D862
    call label_5DB00
    jr   label_5D867

label_5D862::
    ld   a, $1F
    ld   [$D6FF], a

label_5D867::
    call label_5D62A
    ld   a, $3E
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $28
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    ld   a, $6E
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $18
    ld   hl, $C210
    add  hl, de
    ld   [hl], $4C
    ld   a, $6E
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $38
    ld   hl, $C210
    add  hl, de
    ld   [hl], $54
    ld   a, $6E
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $28
    ld   hl, $C210
    add  hl, de
    ld   [hl], $30
    ld   a, $6F
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $78
    ld   hl, $C210
    add  hl, de
    ld   [hl], $60
    jp   label_5D625

label_5D8C2::
    ret
    call label_5D970
    jr   nz, label_5D8D0
    ld   a, $C0
    ld   [$D006], a
    jp   label_5D625

label_5D8D0::
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5D8EF
    call label_5D736
    call label_5D9FD
    jr   nz, label_5D8EF
    ld   a, $1E
    ld   [$D6FE], a
    ld   a, $01
    ld   [$DDD5], a
    call label_5D62A
    jp   label_5D625

label_5D8EF::
    ret
    ld   a, $01
    ld   [$D6FF], a
    jp   label_5D625
    call label_5D9A9
    jr   nz, label_5D90A
    ld   a, $A0
    ld   [$D006], a
    ld   a, $FF
    ld   [$D00B], a
    jp   label_5D625

label_5D90A::
    ret
    ld   a, [$D006]
    cp   $01
    jr   nz, label_5D917
    ld   hl, $FFF4
    ld   [hl], $35

label_5D917::
    and  a
    jr   nz, label_5D94F
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5D94F
    ld   a, [$D00B]
    cp   $3F
    jr   z, label_5D930
    inc  a
    ld   [$D00B], a
    ld   a, $0E
    ld   [$FFA5], a
    ret

label_5D930::
    ld   a, $40
    ld   [$D006], a
    jp   label_5D625
    ld   a, [$D006]
    and  a
    ret  nz
    xor  a
    ld   [$DB97], a
    ld   [$DB98], a
    ld   [$DB99], a
    ld   a, $17
    call label_8FA
    jp   label_5D625

label_5D94F::
    ret

label_5D950::
    nop
    nop
    nop
    nop
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction

label_5D960::
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    jr   label_5D982
    jr   label_5D984
    inc  e
    inc  e
    inc  e
    inc  e

label_5D970::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_5D98F
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D98F

label_5D982::
    ld   a, [$D00A]
    cp   $02
    ret  c
    dec  a
    call label_5FE80
    jp   label_5DA32

label_5D98F::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5D950
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_5D960
    jp   label_5DA32

label_5D9A9::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5D9C7
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5D9C7
    ld   a, [$D00A]
    cp   $02
    ret  c
    dec  a
    call label_5FE80
    jr   label_5DA32

label_5D9C7::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5EED8
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    jr   label_5DA37

label_5D9DD::
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    nop

label_5D9ED::
    inc  e
    inc  e
    inc  e
    inc  e
    jr   label_5DA0B
    jr   label_5DA0D
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop

label_5D9FD::
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_5DA1B
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a

label_5DA0D::
    jr   z, label_5DA1B
    ld   a, [$D00A]
    cp   $02
    ret  c
    dec  a
    call label_5FF30
    jr   label_5DA37

label_5DA1B::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5D9DD
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_5D9ED

label_5DA32::
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a

label_5DA37::
    ld   a, [$D00A]
    cp   $0C
    jr   nz, label_5DA42
    xor  a
    ld   [$D00A], a

label_5DA42::
    ret
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5DA50
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a

label_5DA50::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5E456
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    jr   label_5DA37
    ld   a, $C9
    ld   [$DB97], a
    ld   a, $1C
    ld   [$DB98], a
    ld   a, $90
    ld   [$DB99], a
    ld   a, [$D006]
    and  a
    jp   nz, label_5D6BA
    ld   a, $00
    ld   [$C155], a
    ld   a, $00
    ld   [$FF9D], a
    ld   a, $15
    ld   [$D6FE], a
    xor  a
    ld   [$DDD5], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $40
    ld   hl, $C210
    add  hl, de
    ld   [hl], $60
    ld   hl, $C290
    add  hl, de
    ld   [hl], $02
    ld   a, $E8
    call label_3B86
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   a, $50
    ld   [$FF98], a
    ld   hl, $D6FD
    set  3, [hl]
    ld   a, $A0
    ld   [$D006], a
    ld   a, $FF
    ld   [$DB97], a
    ld   a, $5C
    ld   [$FF99], a
    ld   a, $34
    ld   [$FFF4], a
    jp   label_5D625
    ld   a, [$D006]
    and  a
    jp   nz, label_5D6BA
    ld   [$C155], a
    call label_5CDA5
    jp   label_5CCD9
    ld   a, [$FF99]
    sub  a, $02
    ld   [$FF99], a
    ld   a, [$FF97]
    add  a, $08
    ld   [$FF97], a
    cp   $60
    jr   nz, label_5DAFC
    ld   a, [$C29F]
    inc  a
    ld   [$C29F], a
    ld   a, $40
    ld   [$D009], a
    call label_5CCD9

label_5DAFC::
    call label_5DB96
    ret

label_5DB00::
    call label_28CF
    call label_5DB19
    call label_5DB37
    ld   a, [$D6FD]
    ld   [rLCDC], a
    ret

label_5DB0F::
    ld   b, b
    ld   [hl], e
    ret  nc
    ld   l, d
    and  b
    ld   l, l
    ld   [hl], b
    ld   [hl], b
    nop
    ld   l, b

label_5DB19::
    ld   hl, label_5DB0F
    ld   a, [$D000]
    dec  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   b, a
    ld   a, $17
    ld   [$FFE6], a
    ld   h, [hl]
    ld   l, b
    ld   a, $23
    call label_B69
    ret

label_5DB32::
    nop
    nop
    sbc  a, a
    and  b
    and  c

label_5DB37::
    ld   hl, label_5DB32
    ld   a, [$D000]
    dec  a
    srl  a
    ld   d, $00
    ld   e, a
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    ld   [$DDD2], a
    ret
    ld   b, e
    inc  de
    rlca
    add  a, e
    inc  hl
    dec  bc
    ld   d, e
    rla
    ld   b, a

label_5DB54::
    daa
    ld   c, e
    sub  a, e

label_5DB57::
    ld   h, b
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, h
    ld   h, e
    ld   h, d
    ld   h, c
    ld   h, b
    ld   h, b
    call label_5DB96
    ld   a, [$D009]
    and  a
    jr   nz, label_5DB73
    jp   label_5CCD9

label_5DB73::
    ld   a, [$C21E]
    add  a, $08
    ld   [$C21E], a
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    rra
    rra
    rra
    nop
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_5DB57
    add  hl, de
    ld   a, [hl]
    ld   [$FF97], a
    call label_5DBE2
    ret

label_5DB96::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $07
    add  a, $05
    ld   [$FF9D], a
    ld   a, [$D006]
    and  a
    jr   nz, label_5DBBB
    ld   a, $03
    ld   [$D006], a
    ld   a, [$D000]
    inc  a
    ld   [$D000], a
    cp   $03
    jr   nz, label_5DBBB
    xor  a
    ld   [$D000], a

label_5DBBB::
    ld   a, [$FFFE]
    and  a
    jp   nz, label_5DBD0
    ld   a, [$D000]
    ld   e, a
    ld   d, $00
    ld   hl, label_5DB54
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ret

label_5DBD0::
    ld   hl, $DE01
    ld   a, $20
    ldi  [hl], a
    ld   a, $78
    ldi  [hl], a
    ld   a, $ED
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5DBE2::
    ld   a, [$FF97]
    cpl
    inc  a
    sub  a, $A0
    add  a, $3C
    ld   [$FF99], a
    ret

label_5DBED::
    sbc  a, h
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

label_5DC00::
    and  b
    and  b
    and  b
    and  b
    nop
    sbc  a, h
    jr   nz, label_5DC1B

label_5DC08::
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

label_5DC1B::
    and  b
    nop
    sbc  a, h
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
    nop
    sbc  a, h
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
    nop
    sbc  a, h
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
    nop
    sbc  a, h
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
    nop
    sbc  a, h
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
    nop
    sbc  a, h
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
    nop
    sbc  a, l
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
    nop
    sbc  a, l
    jr   nz, label_5DCDB
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

label_5DCDB::
    and  b
    nop
    sbc  a, l
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
    nop
    sbc  a, l
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
    nop
    sbc  a, l
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
    nop
    sbc  a, l
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
    nop
    sbc  a, l
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
    nop
    sbc  a, l
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
    nop
    sbc  a, [hl]
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
    nop
    sbc  a, [hl]
    jr   nz, label_5DD9B
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

label_5DD9B::
    and  b
    nop
    sbc  a, [hl]
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
    nop
    sbc  a, [hl]
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
    nop
    sbc  a, [hl]
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
    nop
    sbc  a, [hl]
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
    nop
    sbc  a, [hl]
    ret  nz
    inc  de

label_5DE00::
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    add  a, b
    add  a, c

label_5DE08::
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
    nop
    sbc  a, [hl]
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
    nop
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
    nop
    sbc  a, a
    jr   nz, label_5DE5B
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

label_5DE5B::
    and  b
    nop
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
    nop
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
    nop
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
    nop
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
    nop
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
    nop
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
    nop

label_5DEED::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    ld   bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    call label_5DB96
    ld   a, [$C21E]
    add  a, $04
    ld   [$C21E], a
    ld   a, [$D00B]
    inc  a
    ld   [$D00B], a
    and  $07
    jr   nz, label_5DF23
    ld   a, [$D00C]
    cp   $08
    jr   z, label_5DF23
    inc  a
    ld   [$D00C], a

label_5DF23::
    ld   a, [$D00C]
    ld   e, a
    ld   a, [$FF97]
    add  a, e
    ld   [$FF97], a
    call label_5DBE2
    ld   a, [$FF99]
    cp   $F0
    jr   c, label_5DF39
    xor  a
    ld   [$C28F], a

label_5DF39::
    ld   a, [$D00B]
    and  $01
    ret  nz
    ld   a, [$D001]
    cp   $20
    jr   nz, label_5DF4D
    call label_5CDA5
    call label_5CCD9
    ret

label_5DF4D::
    ld   e, a
    inc  a
    ld   [$D001], a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    ld   a, e
    sla  e
    rl   d
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   hl, label_5DBED
    add  hl, de
    push hl
    ld   de, $D601
    ld   c, $18

label_5DF75::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5DF75
    pop  hl
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   de, $DC91
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, $13
    ld   [de], a
    inc  de
    ld   hl, label_5DEED
    ld   c, $15

label_5DF92::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5DF92
    ret

label_5DF99::
    daa
    daa
    daa
    daa
    ld   d, $16
    ld   d, $16
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop

label_5DFA9::
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    jr   label_5DFC9
    ld   [label_808], sp
    ld   [$0000], sp
    nop
    nop

label_5DFB9::
    sub  a, b
    sub  a, b
    sub  a, b
    sub  a, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5DFC9::
    ld   a, [$C21E]
    add  a, $02
    ld   [$C21E], a
    ld   a, [$FF97]
    add  a, $04
    ld   [$FF97], a
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5DFFF
    ld   a, [$D00A]
    cp   $0C
    jr   nz, label_5DFEF
    call label_5CDA5
    ld   a, $C0
    ld   [$D006], a
    jp   label_5CCD9

label_5DFEF::
    inc  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5DFFF
    ld   a, [$D00A]
    dec  a
    jp   label_5FF30

label_5DFFF::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5DF99
    add  hl, de
    ld   a, [hl]

label_5E010::
    ld   [$DB97], a
    ld   hl, label_5DFA9
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_5DFB9
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5E045
    xor  a
    ld   [$D00E], a
    ld   [$C28E], a
    ld   [$C28F], a
    ld   [$C114], a
    ld   a, $80
    ld   [$D466], a
    ld   hl, $D6FD
    res  3, [hl]
    ld   hl, $DB96
    inc  [hl]

label_5E045::
    ret
    call label_5C839
    ld   de, $98E0
    call label_5C88C
    call label_EED
    ld   a, [$D00E]
    rst  0
    ld   e, [hl]
    ld   h, b
    ld   a, b
    ld   h, b
    ld   [$F560], a
    ld   h, b
    ld   a, $16
    ld   [$D6FE], a
    xor  a
    ld   [$DDD5], a
    call label_5CDA5
    ld   a, [$FFFE]
    and  a
    jp   z, label_5CCD9
    ld   hl, $D6FD
    res  2, [hl]
    jp   label_5CCD9
    ld   a, $17
    ld   [$D6FF], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $48
    ld   hl, $C210
    add  hl, de
    ld   [hl], $60
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $04
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $28
    ld   hl, $C210
    add  hl, de
    ld   [hl], $68
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $05
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $78
    ld   hl, $C210
    add  hl, de
    ld   [hl], $60
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $05
    ld   hl, $C3B0
    add  hl, de
    inc  [hl]
    jp   label_5CCD9

label_5E0CA::
    nop
    nop
    nop
    nop
    dec  b
    dec  b
    dec  b
    dec  b
    add  hl, de
    add  hl, de
    ld   a, [de]
    ld   a, [de]
    ld   e, $1E
    ld   e, $1E

label_5E0DA::
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   d, c
    ld   d, c
    ld   d, d
    ld   d, d
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    call label_5CDA5
    ld   a, $60
    ld   [$D009], a
    jp   label_5CCD9
    ld   a, [$D009]
    and  a
    jr   nz, label_5E114
    xor  a
    ld   [$D00E], a
    ld   [$C28C], a
    ld   [$C28D], a
    ld   [$C28E], a
    ld   [$C28F], a
    ld   a, $17
    call label_8FA
    ld   hl, $DB96
    inc  [hl]

label_5E114::
    ret
    call label_5C839
    call label_EED
    ld   a, [$D00E]
    rst  0
    add  hl, hl
    ld   h, c
    ld   c, c
    ld   h, c
    sub  a, $61
    inc  hl
    ld   h, d
    jr   nc, label_5E18B
    ld   a, $17
    ld   [$D6FE], a
    ld   a, $01
    ld   [$DDD5], a
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C155], a
    ld   [$C156], a
    ld   a, $3D
    ld   [$D368], a
    call label_5CDA5
    jp   label_5CCD9
    ld   a, $18
    ld   [$D6FF], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $18
    ld   hl, $C210
    add  hl, de
    ld   [hl], $20
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $06
    ld   hl, $C240
    add  hl, de
    ld   [hl], $03
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $78
    ld   hl, $C210
    add  hl, de
    ld   [hl], $78
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $06
    ld   hl, $C240
    add  hl, de
    ld   [hl], $FD
    ld   hl, $C3B0

label_5E18B::
    add  hl, de
    ld   [hl], $03
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $68
    ld   hl, $C210
    add  hl, de
    ld   [hl], $60
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $07
    ld   a, $60
    ld   [$D009], a
    jp   label_5CCD9

label_5E1AD::
    nop
    nop
    nop
    nop
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    add  hl, de
    add  hl, de
    ld   a, [de]
    ld   a, [de]
    ld   e, $1E
    ld   e, $1E

label_5E1C1::
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_5D151
    ld   d, c
    ld   d, d
    ld   d, d
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_5E1FE
    ld   a, [$D00A]
    cp   $10
    jr   nz, label_5E1EE
    call label_5CDA5
    ld   a, $60
    ld   [$D009], a
    jp   label_5CCD9

label_5E1EE::
    inc  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5E1FE
    ld   a, [$D00A]
    dec  a
    jp   label_5FE80

label_5E1FE::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5E1AD
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_5E1AD
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_5E1C1
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    ret
    ld   a, [$D009]
    and  a
    jr   nz, label_5E22F
    call label_5CDA5
    jp   label_5CCD9

label_5E22F::
    ret
    call label_5CDA5
    xor  a
    ld   [$D00E], a
    ld   [$C28D], a
    ld   [$C28E], a
    ld   [$C28F], a
    ld   a, $17
    call label_8FA
    ld   hl, $DB96
    inc  [hl]
    ret
    call label_5C839
    ld   de, $98E0
    call label_5C88C
    call label_EED
    ld   a, [$D00F]
    inc  a
    ld   [$D00F], a
    cp   $05
    jr   c, label_5E271
    xor  a
    ld   [$D00F], a
    ld   a, [$D00A]
    inc  a
    cp   $2B
    jr   nz, label_5E26E
    xor  a

label_5E26E::
    ld   [$D00A], a

label_5E271::
    ld   a, [$D00A]
    ld   e, a
    ld   d, $00
    ld   hl, label_5E34C
    add  hl, de
    ld   a, [hl]
    add  a, $00
    ld   [$D000], a
    call label_5F971
    ld   a, [$D00E]
    rst  0
    sub  a, d
    ld   h, d
    sbc  a, [hl]
    ld   h, d
    cp   h
    ld   h, e
    db   $76 ; Halt
    ld   h, h
    ret  c
    ld   h, h
    ld   a, $18
    ld   [$D6FE], a
    xor  a
    ld   [$DDD5], a
    jp   label_5CCD9
    ld   a, $19
    ld   [$D6FF], a
    ld   hl, rIE
    set  1, [hl]
    ld   a, $42
    ld   [rLYC], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $18
    ld   hl, $C210
    add  hl, de
    ld   [hl], $55
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $08
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $02
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $68
    ld   hl, $C210
    add  hl, de
    ld   [hl], $58
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $08
    ld   hl, $C3B0
    add  hl, de
    inc  [hl]
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $88
    ld   hl, $C210
    add  hl, de
    ld   [hl], $60
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $08
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $08
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $09
    ld   hl, $C240
    add  hl, de
    ld   [hl], $08
    ld   hl, $C250
    add  hl, de
    ld   [hl], $F8
    call label_5CDA5
    ld   a, $50
    ld   [$D009], a
    ld   a, [$FFFE]
    and  a
    jp   z, label_5CCD9
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $40
    ld   hl, $C210
    add  hl, de
    ld   [hl], $70
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $11
    ld   hl, $D6FD
    res  2, [hl]
    jp   label_5CCD9

label_5E34C::
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    ld   a, [bc]
    dec  bc
    dec  bc
    inc  c
    inc  c
    inc  c
    dec  bc
    dec  bc
    ld   a, [bc]
    ld   a, [bc]
    add  hl, bc
    ld   [label_607], sp
    dec  b
    inc  b
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5E37C::
    dec  c
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    ld   c, h
    ld   c, l
    nop
    dec  c
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   e, h
    ld   e, l
    nop
    dec  c
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
    ld   l, [hl]
    ld   l, a
    ld   l, h
    ld   l, l
    nop
    dec  c
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    ld   a, h
    ld   a, l
    nop
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5E3EE
    ld   hl, $D601
    ld   a, $9A
    ldi  [hl], a
    ld   a, $23
    ldi  [hl], a
    ld   a, [$D00B]
    inc  a
    and  $03
    ld   [$D00B], a
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, $00
    ld   hl, label_5E37C
    add  hl, de
    ld   de, $D603
    ld   c, $10

label_5E3E6::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5E3E6
    jr   label_5E3F1

label_5E3EE::
    call label_5E7CA

label_5E3F1::
    ld   a, [$D001]
    rst  0
    ei
    ld   h, e
    ld   e, $64
    ld   b, a
    ld   h, h
    ld   a, [$D009]
    and  a
    jr   nz, label_5E405

label_5E401::
    ld   hl, $D001
    inc  [hl]

label_5E405::
    ret

label_5E406::
    ld   bc, $0100
    ld   [bc], a
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_1820], sp
    jr   nz, label_5E42E
    jr   label_5E430
    jr   nz, label_5E45A
    inc  c
    inc  c
    inc  c
    ld   b, b
    ld   a, [$D006]
    and  a
    jr   nz, label_5E446
    ld   a, [$D00D]
    ld   e, a
    ld   d, $00
    ld   hl, label_5E406
    add  hl, de

label_5E42E::
    ld   a, [hl]
    ld   [$D002], a
    ld   hl, label_5E412
    add  hl, de
    ld   a, [hl]
    ld   [$D006], a
    ld   a, e
    inc  a
    ld   [$D00D], a
    cp   $0C
    jr   nz, label_5E446
    jp   label_5E401

label_5E446::
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5E455
    xor  a
    ld   [$D005], a
    call label_5CCD9
    ret

label_5E455::
    ret

label_5E456::
    ld   e, $1E
    ld   e, $1E

label_5E45A::
    ld   a, [de]
    ld   a, [de]
    add  hl, de
    add  hl, de
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop

label_5E466::
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    sub  a, d
    ld   d, c
    ld   d, c
    ld   b, c
    ld   b, c
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$D01F]
    and  a
    jp   nz, label_5FF30
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5E4B3
    ld   a, [$D005]
    cp   $0C
    jr   nz, label_5E49C
    ld   a, $C0
    ld   [$D006], a
    xor  a
    ld   [$DB97], a
    ld   [$DB98], a
    ld   [$DB99], a
    jp   label_5CCD9

label_5E49C::
    inc  a
    ld   [$D005], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5E4B3
    ld   a, [$D005]
    dec  a
    and  $01
    ret  nz
    ld   hl, $D01F
    inc  [hl]
    jp   label_5FF30

label_5E4B3::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D005]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5E456
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_5E456
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_5E466
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5E51D

label_5E4DE::
    xor  a
    ld   [$D00E], a
    ld   [$C287], a
    ld   [$C288], a
    ld   [$C289], a
    ld   [$C28A], a
    ld   [$C28B], a
    ld   [$C28C], a
    ld   [$C28D], a
    ld   [$C28E], a
    ld   [$C28F], a
    ld   [$FF97], a
    ld   [$D00F], a
    ld   [$D00F], a
    call label_5CDA5
    ld   hl, rIE
    res  1, [hl]
    ld   hl, $D6FD
    set  2, [hl]
    ld   hl, $DB96
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   nz, label_5E51D
    ld   [hl], $00

label_5E51D::
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    xor  h
    xor  h
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
    dec  b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    sbc  a, c
    add  a, $05
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    sbc  a, c
    and  $05
    call nz, label_C6C5
    rst  0
    ret  z
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    xor  h
    xor  h
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
    dec  b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    sbc  a, c
    add  a, $05
    or   h
    or   l
    adc  a, d
    adc  a, e
    cp   b
    cp   c
    sbc  a, c
    and  $05
    call nz, label_9AC5
    sbc  a, e
    ret  z
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    xor  h
    xor  h
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
    dec  b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    sbc  a, c
    add  a, $05
    or   h
    or   l
    adc  a, h
    adc  a, l
    cp   b
    cp   c
    sbc  a, c
    and  $05
    call nz, label_9CC5
    rst  0
    ret  z
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    xor  h
    xor  h
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
    dec  b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    sbc  a, c
    add  a, $05
    or   h
    or   l
    adc  a, [hl]
    adc  a, a
    cp   b
    cp   c
    sbc  a, c
    and  $05
    call nz, label_9EC5
    rst  0
    ret  z
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    xor  h
    xor  h
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
    dec  b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    sbc  a, c
    add  a, $05
    or   h
    or   l
    jp   [hl]
    ld   [$B9B8], a
    sbc  a, c
    and  $05
    call nz, label_F9C5
    rst  0
    ret  z
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    xor  h
    xor  h
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
    dec  b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    sbc  a, c
    add  a, $05
    or   h
    or   l
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    cp   b
    cp   c
    sbc  a, c
    and  $05
    call nz, label_FBC5
    rst  0
    ret  z
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    xor  h
    xor  h
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
    dec  b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    sbc  a, c
    add  a, $05
    or   h
    or   l
    db   $ED ; Undefined instruction
    xor  $B8
    cp   c
    sbc  a, c
    and  $05
    call nz, label_FBC5
    rst  0
    ret  z
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]
    dec  b
    nop
    ld   bc, label_302
    inc  b
    xor  h
    sbc  a, c
    add  a, [hl]
    dec  b
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  d
    dec  d
    sbc  a, c
    and  [hl]
    dec  b
    jr   nz, label_5E6D9
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    sbc  a, c
    add  a, $05
    jr   nc, label_5E6F2
    ldd  [hl], a
    inc  sp
    inc  [hl]
    dec  [hl]
    sbc  a, c
    and  $05
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    ret
    sbc  a, c
    ld   b, [hl]
    dec  b
    inc  c
    dec  c
    inc  e
    dec  e
    xor  h
    xor  h
    sbc  a, c
    ld   h, [hl]

label_5E6D9::
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    xor  h
    sbc  a, c
    add  a, [hl]
    dec  b
    ld   d, $17
    jr   label_5E700
    ld   a, [de]
    dec  de
    sbc  a, c
    and  [hl]
    dec  b
    ld   h, $27
    jr   z, label_5E719
    ld   a, [hli]
    dec  hl

label_5E6F2::
    sbc  a, c
    add  a, $05
    ld   [hl], $37
    jr   c, label_5E732
    db   $3A ; ldd  a, [hl]
    dec  sp
    sbc  a, c
    and  $05
    ld   b, [hl]
    ld   b, a

label_5E700::
    ld   c, b
    ld   c, c
    ld   c, d
    ret

label_5E704::
    ld   e, $65
    ld   d, h
    ld   h, l
    adc  a, d
    ld   h, l
    ret  nz
    ld   h, l
    or   $65
    inc  l
    ld   h, [hl]
    ld   h, d
    ld   h, [hl]
    sbc  a, b
    ld   h, [hl]
    adc  a, $66
    sbc  a, c
    ld   b, [hl]
    dec  b

label_5E719::
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    sbc  a, c
    ld   h, [hl]
    dec  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    sbc  a, c
    add  a, [hl]
    dec  b
    ld   bc, $0101
    dec  b
    dec  b
    inc  bc
    sbc  a, c

label_5E732::
    and  [hl]
    dec  b
    ld   bc, label_501
    dec  b
    dec  b
    ld   [bc], a
    sbc  a, c
    add  a, $05
    ld   bc, label_501
    dec  b
    ld   bc, $9902
    and  $05
    ld   [bc], a
    ld   [bc], a
    dec  b
    dec  b
    ld   [bc], a
    ld   [bc], a
    sbc  a, c
    ld   b, [hl]
    dec  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    sbc  a, c
    ld   h, [hl]
    dec  b
    ld   bc, label_307
    inc  bc
    inc  bc
    inc  bc
    sbc  a, c
    add  a, [hl]
    dec  b
    ld   bc, $0101
    ld   bc, label_305
    sbc  a, c
    and  [hl]
    dec  b
    ld   bc, label_501
    dec  b
    dec  b
    ld   [bc], a
    sbc  a, c
    add  a, $05
    rlca
    rlca
    dec  b
    dec  b
    dec  b
    ld   [bc], a
    sbc  a, c
    and  $05
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    sbc  a, c
    ld   b, [hl]
    dec  b
    rlca
    ld   bc, label_707
    inc  b
    inc  b
    sbc  a, c
    ld   h, [hl]
    dec  b
    ld   bc, $0101
    ld   bc, label_407
    sbc  a, c
    add  a, [hl]
    dec  b
    ld   bc, label_505
    ld   bc, label_307
    sbc  a, c
    and  [hl]
    dec  b
    ld   bc, label_505
    dec  b
    rlca
    ld   [bc], a
    sbc  a, c
    add  a, $05
    rlca
    dec  b
    dec  b
    dec  b
    dec  b
    ld   [bc], a
    sbc  a, c
    and  $05
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a

label_5E7B8::
    ld   d, $67
    ld   d, $67
    ld   d, $67
    ld   d, $67
    ld   d, $67
    ld   d, $67
    ld   d, $67
    ld   c, h
    ld   h, a
    add  a, d
    ld   h, a

label_5E7CA::
    ld   a, [$FFE7]
    and  $01
    cp   $01
    jr   nz, label_5E808
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    push de
    ld   hl, label_5E704
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $D601
    ld   c, $36

label_5E7E7::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5E7E7
    xor  a
    ld   [de], a
    pop  de
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   hl, label_5E7B8
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $DC91
    ld   c, $36

label_5E800::
    ld   a, [hli]
    ld   [de], a

label_5E802::
    inc  de
    dec  c
    jr   nz, label_5E800
    xor  a
    ld   [de], a

label_5E808::
    ret
    call label_EED
    ld   a, [$D00E]
    rst  0
    ldi  [hl], a
    ld   l, b
    cpl
    ld   l, b
    ld   c, [hl]
    ld   l, b
    and  h
    ld   l, b
    jp   label_AC68
    ld   l, d
    pop  de
    ld   l, d
    ret
    ld   l, e
    sub  a, a
    ld   l, h
    ld   a, $19
    ld   [$D6FE], a
    ld   a, $01
    ld   [$DDD5], a
    jp   label_5CCD9
    ld   a, $1A
    ld   [$D6FF], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $40
    ld   hl, $C210
    add  hl, de
    ld   [hl], $4E
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $0A
    jp   label_5CCD9
    ld   de, $9960
    call label_5C88C
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5E87C
    ld   a, [$D00A]
    cp   $0C
    jr   nz, label_5E86C
    call label_5CDA5
    ld   a, $60
    ld   [$D009], a
    jp   label_5CCD9

label_5E86C::
    inc  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5E87C
    ld   a, [$D00A]
    dec  a
    jp   label_5FE80

label_5E87C::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5E0CA
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   [$DB98], a
    ld   hl, label_5E0CA
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_5E0DA
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    ret
    ld   de, $9960
    call label_5C88C
    ld   a, [$D009]
    and  a
    jr   nz, label_5E8B6
    call label_5CDA5
    jp   label_5CCD9

label_5E8B6::
    ret

label_5E8B7::
    ld   e, $1E
    ld   e, $1E
    ld   l, $2E
    ld   l, $2E
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   de, $9960
    call label_5C88C
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5E8EB
    ld   a, [$D00A]
    cp   $08
    jr   nz, label_5E8E1
    call label_5CDA5
    ld   a, $20
    ld   [$D006], a
    jp   label_5CCD9

label_5E8E1::
    inc  a
    ld   [$D00A], a
    ld   a, [$FFFE]
    and  a
    jp   nz, label_5EA80

label_5E8EB::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5E8B7
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ret

label_5E900::
    push bc
    ld   c, h
    rst  $38
    ld   a, a
    xor  e
    ld   d, [hl]
    ld   [rSTAT], a
    or   e
    ld   a, [hl]
    nop
    nop
    nop
    ld   sp, label_3228
    or   e
    ld   a, [hl]
    nop
    nop
    rra
    ld   [de], a
    cp   $27
    or   e
    ld   a, [hl]
    nop
    nop
    cp   a
    ld   hl, label_5CB1F
    or   e
    ld   a, [hl]
    nop
    nop
    ld   l, e
    inc  b
    dec  d
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    push bc
    ld   c, h
    rst  $38
    ld   a, a
    adc  a, e
    ld   d, d
    ret  nz
    dec  a
    or   e
    ld   a, [hl]
    nop
    nop
    nop
    dec  l
    ld   [$B32E], sp
    ld   a, [hl]
    nop
    nop
    db   $FD ; Undefined instruction
    ld   de, label_27BC
    or   e
    ld   a, [hl]
    nop
    nop
    sbc  a, l
    ld   hl, label_5C6DD
    or   e
    ld   a, [hl]
    nop
    nop
    ld   l, d
    inc  b
    inc  de
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    inc  de
    add  hl, de
    db   $46
    ld   b, [hl]
    push bc
    ld   c, h
    rst  $38
    ld   a, a
    ld   c, d
    ld   c, d
    and  b
    add  hl, sp
    or   e
    ld   a, [hl]
    nop
    nop
    ld   [$FF28], a
    rst  0
    add  hl, hl
    or   e
    ld   a, [hl]
    nop
    nop
    jp  c, label_5D911
    inc  hl
    or   e
    ld   a, [hl]
    nop
    nop
    ld   a, d
    dec  e
    sbc  a, d
    ld   a, $B3
    ld   a, [hl]
    nop
    nop
    ld   l, c
    inc  b
    pop  af
    inc  d
    or   e
    ld   a, [hl]
    nop
    nop
    pop  af
    inc  d
    sbc  a, d
    ld   a, $C5
    ld   c, h
    rst  $38
    ld   a, a
    add  hl, bc
    ld   b, d
    ld   h, b
    ld   sp, label_5FEB3
    nop
    nop
    ret  nz
    inc  h
    and  [hl]
    dec  h
    or   e
    ld   a, [hl]
    nop
    nop
    sub  a, a
    ld   de, label_1EF6
    or   e
    ld   a, [hl]
    nop
    nop
    ld   d, a
    add  hl, de
    ld   d, a
    ld   [hl], $B3
    ld   a, [hl]
    nop
    nop
    ld   l, b
    inc  b
    rst  8
    inc  d
    or   e
    ld   a, [hl]
    nop
    nop
    rst  8
    inc  d
    ld   d, a
    ld   [hl], $C5
    ld   c, h
    rst  $38
    ld   a, a
    db   $E8 ; add  sp, d
    dec  a
    ld   b, b
    dec  l
    or   e
    ld   a, [hl]
    nop
    nop
    ret  nz
    jr   nz, label_5EA35
    ld   hl, label_5FEB3
    nop
    nop
    ld   [hl], h
    dec  c
    sub  a, e
    ld   a, [de]
    or   e
    ld   a, [hl]
    nop
    nop
    inc  [hl]
    add  hl, de
    db   $F4 ; Undefined instruction
    ld   sp, label_5FEB3
    nop
    nop
    ld   b, a
    inc  b
    call label_B310
    ld   a, [hl]
    nop
    nop
    call label_F410
    ld   sp, label_5CCC5
    rst  $38
    ld   a, a
    and  a
    dec  [hl]
    nop
    dec  h
    or   e
    ld   a, [hl]
    nop
    nop
    and  b
    inc  e
    ld   b, l
    dec  e
    or   e
    ld   a, [hl]
    nop
    nop
    ld   sp, label_300D
    ld   d, $B3
    ld   a, [hl]
    nop
    nop

label_5EA0C::
    ld   de, $B115
    add  hl, hl
    or   e
    ld   a, [hl]
    nop
    nop
    ld   b, [hl]
    inc  b
    xor  e
    db   $10 ; Undefined instruction
    ld   a, [hl]
    nop
    nop
    xor  e
    db   $10 ; Undefined instruction
    add  hl, hl
    push bc
    ld   c, h
    rst  $38
    ld   a, a
    ld   h, [hl]
    dec  l
    ld   [rNR41], a
    or   e
    ld   a, [hl]
    nop
    nop
    add  a, b
    jr   label_5EA33
    add  hl, de
    or   e
    ld   a, [hl]
    nop

label_5EA33::
    nop
    ld   c, $0D
    call label_B311
    ld   a, [hl]
    nop
    nop
    xor  $10
    ld   l, [hl]
    ld   hl, label_5FEB3
    nop
    nop
    ld   b, l
    inc  b
    adc  a, c
    inc  c
    or   e
    ld   a, [hl]
    nop
    nop
    adc  a, c
    inc  c
    ld   l, [hl]
    ld   hl, label_5CCC5
    rst  $38
    ld   a, a
    dec  h
    dec  h
    and  b
    jr   label_5EA0C
    ld   a, [hl]
    nop
    nop
    ld   h, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   a, [hl]
    nop
    nop
    rrc  b
    ld   l, d
    dec  c
    or   e
    ld   a, [hl]
    nop
    nop
    xor  e
    inc  c
    dec  bc
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    inc  h
    inc  b
    ld   h, a
    ld   [label_5FEB3], sp
    nop
    nop
    ld   h, a
    ld   [label_190B], sp

label_5EA80::
    ld   a, [$D00A]
    dec  a
    swap a
    ld   c, a
    sla  a
    add  a, c
    ld   c, a
    ld   a, $00
    adc  a, $00
    ld   b, a
    ld   hl, label_5E900
    add  hl, bc
    ld   bc, $0030
    ld   de, $DC50
    call label_2914
    xor  a
    ld   [$DDD3], a
    ld   a, $18
    ld   [$DDD4], a
    ld   a, $82
    ld   [$DDD1], a
    ret
    ld   de, $9960
    call label_5C88C
    ld   a, [$D006]
    and  a
    jr   nz, label_5EAD0
    ld   a, $0A
    ld   [$D006], a
    ld   a, [$D000]
    inc  a
    ld   [$D000], a
    cp   $02
    jr   nz, label_5EAD0
    ld   a, $20
    ld   [$D006], a
    jp   label_5CCD9

label_5EAD0::
    ret
    ld   de, $9960
    call label_5C88C
    ld   a, [$D006]
    and  a
    jr   nz, label_5EAE0
    jp   label_5CCD9

label_5EAE0::
    ret

label_5EAE1::
    ld   [bc], a
    inc  b
    ld   b, $08
    ld   a, [bc]
    inc  c
    ld   c, $10
    ld   [de], a
    inc  d
    ld   d, $18
    ld   a, [de]
    inc  e
    ld   e, $20
    ldi  [hl], a
    inc  h
    ld   h, $28
    jr   z, label_5EB1F
    jr   z, label_5EB21
    jr   z, label_5EB23
    jr   z, label_5EB25
    jr   z, label_5EB27
    jr   z, label_5EB29
    jr   z, label_5EB2B
    jr   z, label_5EB2D
    jr   z, label_5EB2F
    jr   z, label_5EB31
    jr   z, label_5EB33
    jr   z, label_5EB35
    jr   z, label_5EB37
    jr   z, label_5EB39
    jr   z, label_5EB3B
    jr   z, label_5EB3C
    ld   h, $25
    inc  h
    inc  hl
    ldi  [hl], a
    ld   hl, label_1F20
    ld   e, $1D

label_5EB1F::
    inc  e
    dec  de

label_5EB21::
    ld   a, [de]
    add  hl, de

label_5EB23::
    jr   label_5EB3C

label_5EB25::
    ld   d, $15

label_5EB27::
    inc  d
    inc  de

label_5EB29::
    ld   [de], a
    ld   de, label_F10

label_5EB2D::
    ld   c, $0D

label_5EB2F::
    inc  c
    dec  bc

label_5EB31::
    ld   a, [bc]
    add  hl, bc

label_5EB33::
    ld   [label_607], sp
    dec  b

label_5EB37::
    inc  b
    inc  b

label_5EB39::
    inc  b
    inc  b

label_5EB3B::
    inc  b

label_5EB3C::
    inc  b
    nop
    nop
    nop
    nop

label_5EB41::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_202
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b

label_5EBA1::
    ld   e, $1E
    ld   e, $1E
    rra
    rra
    rra
    rra
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    dec  d
    dec  d
    dec  d
    dec  d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    dec  d
    dec  d
    dec  d
    dec  d
    add  hl, de
    add  hl, de
    ld   a, [de]
    ld   a, [de]
    ld   e, $1E
    ld   e, $1E
    ld   a, [$D00D]
    cp   $0E
    jr   nc, label_5EBD6
    ld   de, $9960
    call label_5C88C

label_5EBD6::
    ld   a, [$D00D]
    ld   e, a
    ld   d, $00
    ld   hl, label_5EB41
    add  hl, de
    ld   a, [hl]
    ld   [$D00C], a
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00C]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5EBA1
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   a, [$D00D]
    ld   e, a
    ld   d, $00
    cp   $59
    jr   nz, label_5EC15
    ld   a, [$FF97]
    cp   $30
    jr   nz, label_5EC15
    ld   a, $FF
    ld   [$D008], a
    ld   a, $A8
    ld   [$D009], a
    jp   label_5CCD9

label_5EC15::
    ld   hl, label_5EAE1
    add  hl, de
    ld   a, [hl]
    cpl
    inc  a
    sla  a
    ld   [$C240], a
    ld   bc, $0000
    ld   a, [$C200]
    push af
    call label_5FE3A
    ld   a, [$C200]
    ld   [$FF97], a
    and  $F8
    ld   e, a
    pop  af
    and  $F8
    cp   e
    ret  z
    ld   a, [$D00D]
    cp   $59
    ret  z
    inc  a
    ld   [$D00D], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5EC4A
    call label_5EC85

label_5EC4A::
    ld   a, [$D00D]
    cp   $44
    jr   nz, label_5EC73
    ld   a, $E3
    ld   [$DB99], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   [hl], $80
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $0B
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $A8

label_5EC73::
    ld   hl, $DE01
    ld   a, $23
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, $95
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5EC85::
    ld   hl, $DE01
    ld   a, $20
    ldi  [hl], a
    ld   a, $7C
    ldi  [hl], a
    ld   a, $26
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7
    ld   a, [$D009]
    and  a
    jr   nz, label_5ECA9
    xor  a
    ld   [$DB97], a
    ld   a, $17
    call label_8FA
    jp   label_5E4DE

label_5ECA9::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00C]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5EBA1
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   a, [$D008]
    and  a
    jr   nz, label_5ED0A
    ld   a, [$D00B]
    inc  a
    ld   [$D00B], a
    and  $07
    jr   nz, label_5ED0A
    ld   a, [$D00C]
    cp   $24
    jr   z, label_5ED0A
    ld   a, [$FFFE]
    and  a
    jr   z, label_5ECDD
    call label_5ED0B

label_5ECDD::
    ld   a, [$D00C]
    inc  a
    ld   [$D00C], a
    cp   $05
    jr   nz, label_5ED0A
    ld   a, $1E
    ld   [$DB98], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $62
    ld   hl, $C210
    add  hl, de
    ld   [hl], $5A
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $0C
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $60

label_5ED0A::
    ret

label_5ED0B::
    ld   hl, $DE01
    ld   a, $24
    ldi  [hl], a
    ld   a, $78
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7
    call label_EED
    ld   a, [$D00E]
    rst  0
    ldd  [hl], a
    ld   l, l
    ld   b, d
    ld   l, l
    ld   [hl], e
    ld   l, l
    and  l
    ld   l, l
    db   $ED ; Undefined instruction
    ld   l, l
    inc  d
    ld   l, [hl]
    ld   h, l
    ld   l, [hl]
    ld   a, $1A
    ld   [$D6FE], a
    xor  a
    ld   [$DDD5], a
    dec  a
    ld   [$D022], a
    jp   label_5CCD9
    ld   a, $1B
    ld   [$D6FF], a
    call label_5CDA5
    ld   a, $1E
    ld   [$DB97], a
    ld   a, $6E
    ld   [$DB98], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $38
    ld   hl, $C210
    add  hl, de
    ld   [hl], $50
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $0D
    ld   a, $20
    ld   [$D006], a
    jp   label_5CCD9
    ld   a, [$D006]
    and  a
    jr   nz, label_5ED7C
    call label_5CCD9

label_5ED7C::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5ED8E
    ld   a, [$D00F]
    inc  a
    cp   $31
    jr   nz, label_5ED8B
    xor  a

label_5ED8B::
    ld   [$D00F], a

label_5ED8E::
    ld   a, [$D00F]
    ld   e, a
    ld   d, b
    ld   hl, label_5F6AD
    add  hl, de
    ld   a, [hl]
    sra  a
    ld   [$FF97], a
    ret

label_5ED9D::
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   e, $1E
    ld   e, $1E
    call label_5ED7C
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5EDC1
    ld   a, [$D00A]
    inc  a
    ld   [$D00A], a
    cp   $04
    jr   nz, label_5EDC1
    ld   a, $FF
    ld   [$D006], a
    jp   label_5CCD9

label_5EDC1::
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5EDDB
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D00A]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5ED9D
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ret

label_5EDDB::
    ld   hl, $DE01
    ld   a, $24
    ldi  [hl], a
    ld   a, $7A
    ldi  [hl], a
    ld   a, $40
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7
    call label_5ED7C
    ld   a, [$FFFE]
    and  a
    jr   z, label_5EDF8
    call label_5EDDB

label_5EDF8::
    ld   a, [$D006]
    and  a
    jr   nz, label_5EE07
    ld   a, $E0
    ld   [$D006], a
    jp   label_5CCD9
    ret

label_5EE07::
    cp   $44
    jr   z, label_5EE0F
    cp   $50
    jr   nz, label_5EE13

label_5EE0F::
    ld   hl, $D003
    inc  [hl]

label_5EE13::
    ret
    call label_5ED7C
    ld   hl, $D006
    ld   a, [$FFE7]
    and  $07
    or   [hl]
    jr   nz, label_5EE40
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    cp   $0C
    jr   nz, label_5EE34
    ld   a, $40
    ld   [$D006], a
    call label_5CCD9

label_5EE34::
    ld   a, [$FFFE]
    and  a
    jr   z, label_5EE40
    ld   a, [$D002]
    dec  a
    jp   label_5FF30

label_5EE40::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D002]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5E456
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_5E456
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_5E466
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    ret
    ld   a, [$D006]
    and  a
    jr   nz, label_5EE6E
    jp   label_5E4DE

label_5EE6E::
    ret
    ld   de, $99A0
    call label_5C88C
    call label_5C48B
    ld   a, [$DB96]
    cp   $09
    ret  z
    call label_EED
    ld   a, [$D00E]
    rst  0
    sub  a, c
    ld   l, [hl]
    and  e
    ld   l, [hl]
    db   $E8 ; add  sp, d
    ld   l, [hl]
    jr   z, label_5EEFC
    ld   l, b
    ld   l, a
    ld   l, c
    ld   l, a
    ld   a, $1B
    ld   [$D6FE], a
    ld   a, $01
    ld   [$DDD5], a
    ld   hl, $D6FD
    res  2, [hl]
    jp   label_5CCD9
    ld   a, $1C
    ld   [$D6FF], a
    call label_5CDA5
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   [hl], $78
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $0E
    xor  a
    ld   [$D012], a
    dec  a
    ld   [$D010], a
    ld   a, $B0
    ld   [$D009], a
    xor  a
    ld   [$FFE7], a
    ld   [$DB99], a
    jp   label_5CCD9

label_5EED8::
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    add  hl, de
    add  hl, de
    add  hl, de
    add  hl, de
    ld   e, $1E
    ld   e, $1E
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5EF10
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    cp   $0C
    jr   nz, label_5EF04
    ld   a, $FF
    ld   [$D013], a
    xor  a
    ld   [$FFE7], a
    call label_5CCD9

label_5EF04::
    ld   a, [$FFFE]
    and  a
    jr   z, label_5EF10
    ld   a, [$D002]
    dec  a
    jp   label_5FE80

label_5EF10::
    ld   a, [$FFE7]
    and  $03
    ld   e, a
    ld   a, [$D002]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_5EED8
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   [$DB98], a
    ret
    ld   a, [$D013]
    and  a
    jr   nz, label_5EF67
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5EF67
    ld   hl, $FF97
    dec  [hl]
    ld   a, [hl]
    cp   $70
    jr   nz, label_5EF40
    jp   label_5CCD9

label_5EF40::
    cp   $A0
    jr   nz, label_5EF4C
    ld   hl, $C28F
    ld   [hl], $00
    jp   label_5EF9F

label_5EF4C::
    cp   $C0
    jr   nz, label_5EF67
    ld   a, $E8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $18
    ld   hl, $C210
    add  hl, de
    ld   [hl], $B0
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $0F

label_5EF67::
    ret
    ret
    ret

label_5EF6A::
    sbc  a, c
    pop  bc
    dec  b
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    sbc  a, c
    pop  hl
    dec  b
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    sbc  a, c
    pop  af
    ld   [bc], a
    ld   e, b
    ld   e, c
    ld   e, d
    sbc  a, d
    ld   de, label_5E802
    ld   l, c
    ld   l, d
    sbc  a, d
    jr   nz, label_5EF8C
    ld   e, h

label_5EF8C::
    ld   e, l
    nop

label_5EF8E::
    sbc  a, c
    ret  nz
    ld   d, e
    nop
    sbc  a, c
    ld   [rHDMA3], a
    nop
    sbc  a, d
    nop
    ld   d, e
    nop
    sbc  a, d
    jr   nz, label_5EFF0
    nop
    nop

label_5EF9F::
    ld   hl, label_5EF6A
    ld   de, $D601
    ld   c, $24

label_5EFA7::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5EFA7
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   hl, label_5EF8E
    ld   de, $DC91
    ld   c, $11

label_5EFB9::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5EFB9
    ret
    ld   a, [$D00E]
    rst  0
    jp   nc, label_F76F
    ld   l, a
    jr   label_5F03A
    ld   hl, label_3670
    ld   [hl], b
    or   c
    ld   [hl], b
    ret  nc
    ld   [hl], b
    ld   a, [$D01E]
    and  a
    ret  nz
    ld   hl, $DC56
    ld   a, $FF
    ldi  [hl], a
    ld   a, $7F
    ld   [hl], a
    ld   a, $03
    ld   [$DDD3], a
    ld   a, $01
    ld   [$DDD4], a
    ld   a, $82
    ld   [$DDD1], a
    ld   a, $B4
    ld   [$D006], a
    jp   label_5CCD9
    call label_5C69D
    call label_5C784
    ld   hl, $DB57
    ld   a, [hli]
    or   [hl]
    ret  nz
    ld   a, [$D006]
    and  a
    ret  nz
    ld   a, $07
    ld   [$FFA9], a
    swap a
    ld   [$FFAA], a
    ld   a, $B4
    ld   [$D006], a
    jp   label_5CCD9
    ld   a, [$D006]
    and  a
    ret  nz
    call label_EED
    ret
    ld   a, [$FFE7]
    and  $07
    ret  nz
    call label_5FFA9
    ld   a, [$D01F]
    inc  a
    ld   [$D01F], a
    cp   $10
    jp   z, label_5CCD9
    ret
    ld   a, $23
    ld   [$D6FE], a
    ld   hl, $DC18
    ld   a, $FF
    ldi  [hl], a
    ld   a, $47
    ld   [hl], a
    ld   a, $04
    ld   [$DDD3], a
    ld   a, $01
    ld   [$DDD4], a
    ld   a, $81
    ld   [$DDD1], a
    ld   a, $FA
    ld   [$FF96], a
    xor  a
    ld   [$FF97], a
    jp   label_5CCD9
    sbc  a, b
    and  d
    ld   c, $01
    ld   [bc], a
    inc  bc
    nop
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $98
    ld  [$FF00+C], a
    ld   c, $0E
    db   $10 ; Undefined instruction
    ld   [de], a
    nop
    inc  de
    inc  d
    dec  d
    ld   d, $17
    nop
    jr   label_5F098
    ld   a, [de]
    dec  de
    sbc  a, c
    ldi  [hl], a
    dec  bc
    inc  e
    dec  e
    nop
    ld   e, $1F
    jr   nz, label_5F0AC
    ldi  [hl], a
    nop
    inc  hl
    inc  h
    dec  h
    sbc  a, c
    ld   h, d
    dec  bc
    ld   h, $27
    jr   z, label_5F097

label_5F097::
    add  hl, hl

label_5F098::
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $2F
    rrca
    nop

label_5F0A0::
    sbc  a, b
    and  d
    ld   c, [hl]
    ld   bc, $E298
    ld   c, [hl]
    ld   bc, label_2299
    ld   c, e
    ld   bc, label_5E299
    ld   c, e
    ld   bc, label_2100
    ld   e, l
    ld   [hl], b
    ld   de, $D601
    ld   c, $43

label_5F0B9::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5F0B9
    ld   hl, label_5F0A0
    ld   de, $DC91
    ld   c, $11

label_5F0C7::
    ld   a, [hli]
    ld   [de], a
    inc  de

label_5F0CA::
    dec  c
    jr   nz, label_5F0C7
    jp   label_5CCD9
    ret

label_5F0D1::
    ld   [label_5DC00], sp
    nop
    stop
    ld   e, l
    nop
    nop
    ld   [$00C0], sp
    ld   [$C108], sp
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    ld   [$CF10], sp
    nop
    nop
    jr   label_5F0CA
    nop
    ld   [$DF18], sp
    nop
    nop

label_5F0F2::
    jr   nz, label_5F0DE
    nop
    ld   [$EB20], sp
    nop
    ld   [label_5DE00], sp
    nop
    stop
    ld   e, a
    nop
    nop
    ld   [$00C0], sp
    ld   [$C108], sp
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    ld   [$CF10], sp
    nop
    nop
    jr   label_5F0F2
    nop
    ld   [$DF18], sp
    nop
    nop

label_5F11A::
    jr   nz, label_5F106
    nop
    ld   [$EB20], sp
    nop
    ld   [$EC00], sp
    nop
    stop
    db   $ED ; Undefined instruction
    nop
    nop
    ld   [$00D0], sp
    ld   [$D108], sp
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    ld   [$CF10], sp
    nop
    nop
    jr   label_5F11A
    nop
    ld   [$DF18], sp
    nop
    nop

label_5F142::
    jr   nz, label_5F12E
    nop
    ld   [$EB20], sp
    nop
    ld   [$EE00], sp
    nop
    stop
    rst  $28
    nop
    nop
    ld   [$00D0], sp
    ld   [$D108], sp
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    ld   [$CF10], sp
    nop
    nop
    jr   label_5F142
    nop
    ld   [$DF18], sp
    nop
    nop
    jr   nz, label_5F156
    nop
    ld   [$EB20], sp
    nop
    ld   a, $3C
    ld   [$C3C0], a
    ld   a, [$FF97]
    ld   e, a
    ld   a, [$FFEC]
    sub  a, e
    ld   [$FFEC], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_5F188
    call label_5F1CD
    jr   label_5F1AC

label_5F188::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $03
    rla
    rla
    rla
    and  $F8
    ld   e, a
    rla
    rla
    and  $E0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_5F0D1
    add  hl, de
    ld   c, $0A
    call label_3CE0
    ld   a, $0A
    call label_3DA0

label_5F1AC::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_5F1CC
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $04
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FF
    call label_5FE2D
    ld   a, [$FFEE]
    cp   $A8
    ret  c
    call label_5CCD9
    jp   label_5FCC2

label_5F1CC::
    ret

label_5F1CD::
    ld   hl, $DE01
    ld   a, $20
    ldi  [hl], a
    ld   a, $7D
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F1DF::
    nop
    nop
    nop
    nop
    ld   [$0100], sp
    nop
    nop
    ld   [$0002], sp
    ld   [label_308], sp
    nop
    nop
    ld   a, [$0010]
    ld   [label_11FA], sp
    nop
    nop
    ld   c, $10
    jr   nz, label_5F204
    ld   c, $11
    jr   nz, label_5F200

label_5F200::
    nop
    nop
    nop
    ld   [$0100], sp
    nop
    nop
    ld   [$0002], sp
    ld   [label_308], sp
    nop
    ld   [label_10FA], sp
    ld   b, b
    nop
    ld   a, [label_5C011]
    ld   [label_100E], sp
    ld   h, b
    nop
    ld   c, $11
    ld   h, b
    nop
    ld   [label_2000], sp
    ld   [$0108], sp
    jr   nz, label_5F228

label_5F228::
    nop
    ld   [bc], a
    jr   nz, label_5F234
    nop
    inc  bc
    jr   nz, label_5F230

label_5F230::
    ld   a, [$0010]
    ld   [label_11FA], sp
    nop
    nop
    ld   c, $10
    jr   nz, label_5F244
    ld   c, $11
    jr   nz, label_5F240

label_5F240::
    ld   [label_2000], sp
    ld   [$0108], sp
    jr   nz, label_5F248

label_5F248::
    nop
    ld   [bc], a
    jr   nz, label_5F254
    nop
    inc  bc
    jr   nz, label_5F258
    ld   a, [label_5C010]
    nop

label_5F254::
    ld   a, [label_5C011]
    ld   [label_100E], sp
    ld   h, b
    nop
    ld   c, $11
    ld   h, b
    ld   hl, $DB57
    ld   a, [hli]
    or   [hl]
    jr   nz, label_5F293
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5F2BD
    ld   a, $1C
    ld   [$DB98], a
    ld   a, $3C
    ld   [$C3C0], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_5F1DF
    add  hl, de
    ld   c, $08
    call label_3CE0
    ld   a, $08
    call label_3DA0

label_5F293::
    call label_5FE2D
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_5F2A6
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $FC
    jr   z, label_5F2A6
    dec  [hl]

label_5F2A6::
    ld   a, [$FFEE]
    cp   $A8
    jp   z, label_5FCC2
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $7F
    jr   nz, label_5F2BC
    ld   a, $21
    ld   [$FFF2], a

label_5F2BC::
    ret

label_5F2BD::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   [$DBAF], a
    ld   a, $78
    ldi  [hl], a
    ld   a, $54
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    call label_BD7
    ld   a, $17
    ld   [$DBAF], a
    ret

label_5F2D8::
    nop
    nop
    ld   c, h
    nop
    ld   [label_5CD00], sp
    nop
    nop
    ld   [$004E], sp
    ld   [label_5CF08], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, b
    nop
    jr   label_5F2E6
    ld   h, c
    nop
    stop
    ld   h, d
    nop
    jr   label_5F2F6

label_5F2F6::
    ld   h, e
    nop
    db   $10 ; Undefined instruction
    ld   h, h
    nop
    jr   label_5F306
    ld   h, l
    nop
    db   $10 ; Undefined instruction
    ld   h, [hl]
    nop
    jr   label_5F316

label_5F306::
    ld   h, a
    nop
    nop
    nop
    ld   c, h
    nop
    ld   [label_5CD00], sp
    nop
    nop
    ld   [$004E], sp
    ld   [label_5CF08], sp
    nop
    db   $10 ; Undefined instruction
    ld   l, b
    nop
    jr   label_5F316
    ld   l, c
    nop
    stop
    ld   l, d
    nop
    jr   label_5F326

label_5F326::
    ld   l, e
    nop
    db   $10 ; Undefined instruction
    ld   l, h
    nop
    jr   label_5F336
    ld   l, l
    nop
    db   $10 ; Undefined instruction
    ld   l, [hl]
    nop
    jr   label_5F346

label_5F336::
    ld   l, a
    nop
    nop
    nop
    ld   c, h
    nop
    ld   [label_5CD00], sp
    nop
    nop
    ld   [$004E], sp
    ld   [label_5CF08], sp
    nop
    db   $10 ; Undefined instruction
    ld   [hl], b
    nop
    jr   label_5F346
    ld   [hl], c
    nop
    stop
    ld   [hl], d
    nop
    jr   label_5F356

label_5F356::
    ld   [hl], e
    nop
    db   $10 ; Undefined instruction
    ld   [hl], h
    nop
    jr   label_5F366
    ld   [hl], l
    nop
    db   $10 ; Undefined instruction
    db   $76 ; Halt
    nop
    jr   label_5F376

label_5F366::
    ld   [hl], a
    nop
    nop
    nop
    ld   c, h
    nop
    ld   [label_5CD00], sp
    nop
    nop
    ld   [$004E], sp
    ld   [label_5CF08], sp
    nop
    db   $10 ; Undefined instruction
    ld   a, b
    nop
    jr   label_5F376
    ld   a, c
    nop
    stop
    ld   a, d
    nop
    jr   label_5F386

label_5F386::
    ld   a, e
    nop
    db   $10 ; Undefined instruction
    ld   a, h
    nop
    jr   label_5F396
    ld   a, l
    nop
    db   $10 ; Undefined instruction
    ld   a, [hl]
    nop
    jr   label_5F3A6

label_5F396::
    ld   a, a
    nop
    ld   a, $3C
    ld   [$C3C0], a
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5F3AF
    ld   a, [$D00F]

label_5F3A6::
    inc  a
    cp   $31
    jr   c, label_5F3AC
    xor  a

label_5F3AC::
    ld   [$D00F], a

label_5F3AF::
    ld   a, [$D00F]
    ld   e, a
    ld   d, b
    ld   hl, label_5F6AD
    add  hl, de
    ld   a, [$FF97]
    ld   d, a
    ld   a, [hl]
    sra  a
    ld   e, a
    ld   a, [$FFEC]
    add  a, e
    sub  a, d
    ld   [$FFEC], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5F3ED
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    rla
    and  $E0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_5F2D8
    add  hl, de
    ld   c, $0C
    call label_3CE0
    ld   a, $0C
    call label_3DA0
    ret

label_5F3ED::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   a, $78
    ldi  [hl], a
    ld   a, $2E
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F3FF::
    nop
    nop
    nop
    nop
    nop
    ld   [$0002], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_5F414
    nop
    nop
    jr   nz, label_5F41A
    nop
    nop

label_5F414::
    jr   z, label_5F420
    nop
    db   $10 ; Undefined instruction
    inc  d

label_5F41A::
    nop
    db   $10 ; Undefined instruction
    ld   d, $00
    jr   nz, label_5F441
    ld   e, $00
    jr   nz, label_5F44D
    jr   nz, label_5F427

label_5F427::
    jr   nc, label_5F429

label_5F429::
    ld   d, b
    nop
    jr   nc, label_5F435
    ldi  [hl], a
    nop
    jr   nc, label_5F441
    inc  h
    nop
    jr   nc, label_5F44D

label_5F435::
    ld   h, $00
    jr   nc, label_5F459
    jr   z, label_5F43B

label_5F43B::
    jr   nc, label_5F465
    ld   a, [hli]
    nop
    jr   nc, label_5F471

label_5F441::
    inc  l
    nop
    jr   nc, label_5F47D
    ld   l, $00
    ld   b, b
    nop
    jr   nc, label_5F44B

label_5F44B::
    ld   b, b
    ld   [$0032], sp
    ld   b, b
    db   $10 ; Undefined instruction
    nop
    ld   b, b
    jr   label_5F48C
    nop
    ld   b, b
    jr   nz, label_5F492
    nop
    ld   b, b
    jr   z, label_5F498
    nop
    ld   b, b
    jr   nc, label_5F49E
    nop
    ld   b, b
    jr   c, label_5F4A4
    nop
    ld   b, b
    ld   b, b
    ld   b, b
    nop

label_5F46B::
    stop
    inc  c
    nop
    db   $10 ; Undefined instruction

label_5F471::
    ld   c, $00
    db   $10 ; Undefined instruction
    stop
    db   $10 ; Undefined instruction
    ld   [de], a
    nop
    jr   nz, label_5F485

label_5F47D::
    jr   label_5F47F

label_5F47F::
    jr   nz, label_5F491
    ld   a, [de]
    nop
    jr   nz, label_5F49D

label_5F485::
    inc  e
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    stop
    inc  c
    nop
    db   $10 ; Undefined instruction

label_5F491::
    ld   b, d

label_5F492::
    nop
    db   $10 ; Undefined instruction
    ld   b, h
    nop
    db   $10 ; Undefined instruction
    ld   b, [hl]
    nop
    jr   nz, label_5F4A5

label_5F49D::
    jr   label_5F49F

label_5F49F::
    jr   nz, label_5F4B1
    ld   c, b
    nop
    jr   nz, label_5F4BD

label_5F4A5::
    ld   c, d
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    stop
    inc  c
    nop
    db   $10 ; Undefined instruction

label_5F4B1::
    ld   d, d
    nop
    db   $10 ; Undefined instruction
    ld   d, h
    nop
    db   $10 ; Undefined instruction
    ld   d, [hl]
    nop
    jr   nz, label_5F4C5

label_5F4BD::
    jr   label_5F4BF

label_5F4BF::
    jr   nz, label_5F4D1
    ld   e, b
    nop
    jr   nz, label_5F4DD

label_5F4C5::
    ld   e, d
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$D00F]
    ld   e, a
    ld   d, b
    ld   hl, label_5F6AD
    add  hl, de
    ld   a, [hl]
    sra  a
    ld   e, a
    ld   a, [$FFEC]
    add  a, e
    ld   [$FFEC], a

label_5F4DD::
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5F50F
    ld   hl, label_5F3FF
    ld   c, $1B
    call label_3CE0
    ld   a, $1B
    call label_3DA0
    ld   a, [$D003]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_5F46B
    add  hl, de
    ld   c, $07
    ld   a, $40
    ld   [$C3C0], a
    call label_3CE6
    ld   a, $07
    call label_3DA0
    ret

label_5F50F::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   a, $77
    ldi  [hl], a
    ld   a, $4C
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F521::
    nop
    nop
    ld   [hl], b
    rlca
    nop
    nop
    ld   [hl], b
    rlca
    nop
    nop
    ld   [hl], b
    rlca
    nop
    nop
    ld   [hl], b
    rlca
    ld   [label_5DC08], sp
    rlca
    ld   [label_5DC08], sp
    rlca
    nop
    nop
    ld   [hl], b
    rlca
    ld   [label_5DE08], sp
    rlca
    ld   [label_5E010], sp
    rlca
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C3
    ld   a, [$FFF1]
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_5F521
    add  hl, de
    ld   c, $03
    call label_3CE6
    call label_C05
    cp   $01
    jr   z, label_5F56C
    cp   $30
    jr   nz, label_5F571

label_5F56C::
    ld   hl, $C3B0
    add  hl, bc
    inc  [hl]

label_5F571::
    ret

label_5F572::
    nop
    nop
    ld   h, d
    stop
    ld   [label_3062], sp
    db   $10 ; Undefined instruction
    ld   h, h
    db   $10 ; Undefined instruction
    ld    hl, sp+$66
    db   $10 ; Undefined instruction
    nop
    ld   l, b
    db   $10 ; Undefined instruction
    ld   [label_3068], sp
    db   $10 ; Undefined instruction
    ld   h, [hl]
    jr   nc, label_5F59F
    jr   label_5F5F5
    jr   nc, label_5F5B3
    nop

label_5F594::
    ld   l, d
    db   $10 ; Undefined instruction
    ld   [label_306A], sp
    jr   nc, label_5F594
    ld   l, h
    db   $10 ; Undefined instruction

label_5F59F::
    nop
    ld   l, [hl]
    db   $10 ; Undefined instruction
    ld   [label_306E], sp
    jr   nc, label_5F5B8

label_5F5A8::
    ld   l, h
    jr   nc, label_5F55A
    ld   [$C3C0], a
    ld   hl, $FF97
    ld   a, [$FFEC]

label_5F5B3::
    sub  a, [hl]
    ld   [$FFEC], a
    ld   hl, label_5F572
    ld   c, $0E
    call label_3CE6
    ld   a, $0E
    call label_3DA0
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FE
    call label_5FE30
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_5F5E0
    call label_C05
    jr   nz, label_5F5E0
    ld   [hl], $C0
    call label_3B12
    ld   a, $17
    ld   [$FFF3], a

label_5F5E0::
    ret

label_5F5E1::
    nop
    ld   [$00B2], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_5F5A2
    nop
    nop
    jr   nz, label_5F5A8
    nop
    db   $10 ; Undefined instruction
    cp   d
    nop

label_5F5F5::
    db   $10 ; Undefined instruction
    cp   h
    nop
    db   $10 ; Undefined instruction
    add  a, [hl]

label_5F5FC::
    nop
    jr   nz, label_5F5FF

label_5F5FF::
    adc  a, b
    nop
    jr   nz, label_5F60B
    adc  a, d
    nop
    jr   nz, label_5F617
    adc  a, h

label_5F608::
    nop
    jr   nz, label_5F623

label_5F60B::
    adc  a, [hl]
    nop
    jr   nz, label_5F62F
    sub  a, h
    nop
    jr   nc, label_5F613

label_5F613::
    sbc  a, b
    nop
    jr   nc, label_5F61F

label_5F617::
    sbc  a, d
    nop
    jr   nc, label_5F62B
    and  h
    nop
    jr   nc, label_5F637

label_5F61F::
    xor  b
    nop
    jr   nc, label_5F643

label_5F623::
    xor  d
    nop
    nop
    ld   [$00C2], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_5F5F6
    nop
    nop
    jr   nz, label_5F5FC
    nop
    db   $10 ; Undefined instruction

label_5F637::
    jp   z, label_1000
    jr   label_5F608
    nop
    db   $10 ; Undefined instruction
    sub  a, [hl]
    nop
    jr   nz, label_5F643

label_5F643::
    adc  a, b
    nop
    jr   nz, label_5F64F
    adc  a, d
    nop
    jr   nz, label_5F65B
    adc  a, h
    nop
    jr   nz, label_5F667

label_5F64F::
    adc  a, [hl]

label_5F650::
    nop
    jr   nz, label_5F673
    sub  a, h
    nop
    jr   nc, label_5F657

label_5F657::
    sbc  a, b
    nop
    jr   nc, label_5F663

label_5F65B::
    sbc  a, d

label_5F65C::
    nop
    jr   nc, label_5F66F
    and  h
    nop
    jr   nc, label_5F67B

label_5F663::
    xor  b
    nop
    jr   nc, label_5F687

label_5F667::
    xor  d
    nop
    nop
    ld   [$00D2], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_5F64A
    nop
    nop
    jr   nz, label_5F650
    nop
    db   $10 ; Undefined instruction

label_5F67B::
    jp  c, label_1000
    jr   label_5F65C
    nop
    db   $10 ; Undefined instruction
    and  [hl]
    nop
    jr   nz, label_5F687

label_5F687::
    adc  a, b
    nop
    jr   nz, label_5F693
    adc  a, d
    nop
    jr   nz, label_5F69F
    adc  a, h
    nop
    jr   nz, label_5F6AB

label_5F693::
    adc  a, [hl]
    nop
    jr   nz, label_5F6B7
    sub  a, h
    nop
    jr   nc, label_5F69B

label_5F69B::
    sbc  a, b
    nop
    jr   nc, label_5F6A7

label_5F69F::
    sbc  a, d
    nop
    jr   nc, label_5F6B3
    and  h
    nop
    jr   nc, label_5F6BF

label_5F6A7::
    xor  b
    nop
    jr   nc, label_5F6CB

label_5F6AB::
    xor  d
    nop

label_5F6AD::
    nop
    nop
    nop
    nop
    nop
    nop

label_5F6B3::
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    inc  bc
    inc  bc
    inc  b
    dec  b
    dec  b

label_5F6BF::
    ld   b, $06
    ld   b, $07
    rlca
    rlca
    rlca
    ld   [label_808], sp
    ld   [label_808], sp
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
    ld   b, $05
    dec  b
    inc  b
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $003E
    ld   [$C3C0], a
    ld   a, [$FF97]
    ld   d, a
    sra  a
    add  a, d
    ld   [$FFD7], a
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5F6FD
    ld   a, [$D00F]
    inc  a
    cp   $31
    jr   c, label_5F6FA
    xor  a

label_5F6FA::
    ld   [$D00F], a

label_5F6FD::
    ld   a, [$D00F]
    ld   e, a
    ld   d, b
    ld   hl, label_5F6AD
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   hl, $FFD7
    sub  a, [hl]
    ld   [$FFEC], a
    cp   $A8
    jp   nc, label_5FCC2
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5F739
    ld   a, [$D000]
    rla
    rla
    and  $FC
    ld   e, a
    rla
    rla
    rla
    rla
    and  $C0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_5F5E1
    add  hl, de
    ld   c, $11
    call label_3CE6
    ld   a, $11
    call label_3DA0
    ret

label_5F739::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   a, $76
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F74B::
    nop
    nop
    ld   [hl], b
    rlca
    ld   [label_5DE08], sp
    rlca
    ld   [label_5E010], sp
    rlca
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C3
    ld   hl, label_5F74B
    ld   c, $03
    call label_3CE6
    ret

label_5F766::
    ld   d, b
    nop
    ld   d, d
    nop
    ld   d, h
    nop
    ld   d, [hl]
    nop
    ld   d, a
    nop
    ld   e, d
    nop
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_5F784
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    cp   $06
    jr   nz, label_5F783
    xor  a

label_5F783::
    ld   [hl], a

label_5F784::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C1
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_5F798
    ld   hl, $FFED
    set  5, [hl]

label_5F798::
    ld   de, label_5F766
    call label_3C77
    call label_5FE3A
    ld   a, [$FFEE]
    cp   $B0
    jp   nc, label_5FCC2
    ret

label_5F7A9::
    nop
    ld   [$000E], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_5F7E2
    nop
    stop
    ld   d, b
    nop
    db   $10 ; Undefined instruction
    ld   d, d
    nop
    db   $10 ; Undefined instruction
    ld   d, h
    nop
    db   $10 ; Undefined instruction
    ld   e, b
    nop

label_5F7C5::
    nop
    ld   [$000E], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_5F7FE
    nop
    stop
    ld   h, b
    nop
    db   $10 ; Undefined instruction
    ld   h, d
    nop
    db   $10 ; Undefined instruction
    ld   h, h
    nop
    db   $10 ; Undefined instruction
    ld   l, b
    nop

label_5F7E1::
    nop

label_5F7E2::
    nop
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    ld   bc, $0101
    ld   bc, label_5C021
    jp   label_3609
    rst  0
    ld   a, $00
    ld   [$C3C0], a
    ld   a, [$FFE7]

label_5F7FE::
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_5F7E1
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5F826
    ld   hl, label_5F7A9
    ld   a, [$FFE7]
    and  $10
    jr   z, label_5F820
    ld   hl, label_5F7C5

label_5F820::
    ld   c, $07
    call label_3CE6
    ret

label_5F826::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   a, $72
    ldi  [hl], a
    ld   a, $E4
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F838::
    ld   e, d
    inc  bc
    ld   l, d
    inc  bc
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C1
    ld   a, c
    rla
    and  $06
    ld   e, a
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    add  a, e
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_5F7E9
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5F867
    ld   de, label_5F838
    call label_3C77
    ret

label_5F867::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   a, $73
    ldi  [hl], a
    ld   a, $06
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F879::
    ld   d, h
    inc  b
    ld   h, h
    inc  b
    ld   h, h
    inc  h
    ld   d, h
    inc  h
    ld   c, [hl]
    inc  b
    ld   a, [hl]
    inc  b
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C2
    ld   a, [$FFF1]
    cp   $01
    jr   z, label_5F8B7
    cp   $02
    jr   z, label_5F8C4
    ld   a, [$D00A]

label_5F898::
    ld   e, a
    ld   d, b
    ld   hl, label_5E34C
    add  hl, de
    ld   a, [hl]
    sub  a, $04

label_5F8A1::
    cpl
    inc  a
    sra  a
    ld   e, a
    ld   a, [$FFEC]
    add  a, e
    ld   [$FFEC], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_5F8DD
    ld   de, label_5F879
    call label_3BC0
    ret

label_5F8B7::
    ld   a, [$D00A]
    add  a, $06
    cp   $2B
    jr   c, label_5F8C2
    sub  a, $2B

label_5F8C2::
    jr   label_5F898

label_5F8C4::
    ld   a, [$D00A]
    add  a, $18
    cp   $2B
    jr   c, label_5F8CF
    sub  a, $2B

label_5F8CF::
    ld   e, a
    ld   d, $00
    ld   hl, label_5E34C
    add  hl, de
    ld   a, [hl]
    sub  a, $04
    sra  a
    jr   label_5F8A1

label_5F8DD::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   a, $73
    ldi  [hl], a
    ld   a, $4B
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F8EF::
    ld   [hl], d
    nop
    ld   [hl], d
    jr   nz, label_5F968
    nop
    ld   [hl], h
    jr   nz, label_5F96E
    nop
    db   $76 ; Halt
    jr   nz, label_5F974
    nop
    ld   a, b
    jr   nz, label_5F97A
    nop
    ld   a, d
    jr   nz, label_5F980
    nop
    ld   a, h
    jr   nz, label_5F910
    ld   b, $06
    ld   b, $06
    ld   [label_5C021], sp
    jp   label_3609
    jp   nz, label_FEF0
    and  a
    jr   z, label_5F91D
    call label_5F95E
    jr   label_5F923

label_5F91D::
    ld   de, label_5F8EF
    call label_3BC0

label_5F923::
    call label_C05
    jr   nz, label_5F93E
    push hl
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    cp   $06
    jr   nz, label_5F934
    xor  a

label_5F934::
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, label_5F907
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a

label_5F93E::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $1F
    jr   nz, label_5F953
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_5F953
    inc  [hl]

label_5F953::
    call label_5FE2D
    ld   a, [$FFEE]
    cp   $B0
    jp   nc, label_5FCC2
    ret

label_5F95E::
    ld   hl, $DE01
    ld   a, $27
    ldi  [hl], a
    ld   a, $73
    ldi  [hl], a
    ld   a, $C7
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7
    ret

label_5F971::
    ld   a, [$FFFE]
    and  a

label_5F974::
    ret  z
    ld   hl, $DE01
    ld   a, $27

label_5F97A::
    ldi  [hl], a
    ld   a, $74
    ldi  [hl], a
    ld   a, $E3

label_5F980::
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5F987::
    ret  nc
    ld   bc, label_1D2
    call nc, label_D601
    ld   bc, label_1D8
    jp  c, label_DC01
    ld   bc, label_1DE
    ld   [rSB], a
    ld  [$FF00+C], a
    ld   bc, label_1E4
    and  $01
    db   $E8 ; add  sp, d
    ld   bc, label_1EA
    db   $EC ; Undefined instruction
    ld   bc, label_1EE
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    add  a, $50
    ld   [$FFD7], a
    call label_5FA01
    ld   de, label_5F987
    call label_5FA29
    call label_BFB
    ret  z
    call label_5FE2D
    ret

label_5F9C1::
    add  a, b
    ld   h, $95
    ld   h, e
    jr   nz, label_5FA01
    ld   [hl], l
    ld   l, e
    and  b
    ld   d, c
    dec  [hl]
    ld   [hl], e
    ld   [label_187D], sp
    ld   a, a
    xor  l
    ld   a, b
    ld   sp, hl
    ld   a, [hl]
    ld   d, b
    ld   e, h
    jp  c, label_1276
    ld   b, b
    cp   e
    ld   l, d
    dec  d
    jr   nc, label_5F99C
    ld   h, [hl]
    rla
    inc  d
    cp   l
    ld   e, [hl]
    rst  $10
    inc  b
    db   $FD ; Undefined instruction
    ld   d, [hl]
    scf
    dec  b
    dec  e
    ld   d, a
    sub  a, a
    add  hl, bc
    dec  a
    ld   e, e
    push af
    add  hl, bc
    ld   e, h
    ld   e, e
    db   $10 ; Undefined instruction
    ld   e, d
    ld   e, e
    ld   c, e
    ld   b, $79
    ld   d, a
    and  b
    ld   [bc], a
    sub  a, l
    ld   d, a

label_5FA01::
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$D00E]
    cp   $13
    ret  nc
    ld   a, [$FFE7]
    srl  a
    and  $3C
    ld   e, a
    ld   d, $00
    ld   hl, label_5F9C1
    add  hl, de
    ld   de, $DC5C

label_5FA1B::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, e
    and  $03
    jr   nz, label_5FA1B
    ld   a, $02
    ld   [$DDD1], a
    ret

label_5FA29::
    push bc
    push de
    ld   a, [$FFD7]
    ld   e, a
    ld   d, b
    ld   hl, $C000
    add  hl, de
    push hl
    pop  de
    ld   a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [$C155]
    ld   c, a
    ld   a, [$FFED]
    and  $20
    rra
    rra
    ld   hl, $FFEE
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  de
    ld   a, [$FFF1]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    pop  hl
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    push hl
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    inc  de
    ld   a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [$C155]
    ld   c, a
    ld   a, [$FFED]
    and  $20
    xor  $20
    rra
    rra
    ld   hl, $FFEE
    sub  a, c
    add  a, [hl]
    ld   [de], a
    inc  de
    pop  hl
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    pop  bc
    ret
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    or   c
    ld   a, d
    sbc  a, c
    ld   a, e
    dec  de
    ld   a, h
    and  a
    ld   a, c
    pop  af
    ld   [hl], a
    inc  a
    ld   a, b
    ld   [hl], d
    ld   [hl], a
    ld   d, a
    ld   [hl], a
    add  a, l
    ld   a, b
    dec  c
    ld   a, c
    sbc  a, $76
    xor  d
    ld   [hl], l
    ld   b, l
    ld   [hl], l
    bit  6, h
    sbc  a, b
    ld   [hl], e
    ld   [hl], c
    ld   [hl], c
    ld   e, a
    ld   [hl], d
    ld   [hl], b
    ld   a, c
    call label_5FB5F
    ld   a, [$FFF0]
    rst  0
    pop  bc
    ld   a, d
    ld   b, $7B
    ld   b, c
    ld   a, e
    ld   b, e
    ld   a, e
    ld   e, e
    ld   a, e
    ld   a, [$FFEC]
    cp   $60
    jp   z, label_3B12
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $08
    call label_5FE30
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $F0
    jr   nz, label_5FAEB
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   nc, label_5FAEB
    inc  a
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $E0

label_5FAEB::
    ld   a, $FF
    ld   [$FF9B], a

label_5FAEF::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $00
    ld   [$FF9D], a

label_5FAFA::
    push bc
    xor  a
    ld   [$FF9A], a
    call label_21A8
    call label_5FD34
    pop  bc
    ret
    ld   a, $F8
    ld   [$FF9B], a
    call label_5FAEF
    ld   a, [$FF99]
    cp   $5C
    jr   nz, label_5FB40
    xor  a
    ld   [$FF9B], a
    ld   a, $02
    ld   [$FF9D], a
    ld   a, $E8
    call label_3B86
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   [hl], $00
    ld   hl, $C250
    add  hl, de
    ld   [hl], $14
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $30
    call label_3B12

label_5FB40::
    ret
    jr   label_5FB5B
    call label_5FAFA
    call label_C05
    jr   nz, label_5FB5B
    ld   [hl], $08
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $05
    jr   nz, label_5FB5B
    call label_3B12

label_5FB5B::
    call label_5FAFA
    ret

label_5FB5F::
    ld   hl, $DE01
    ld   a, $20
    ldi  [hl], a
    ld   a, $7B
    ldi  [hl], a
    ld   a, $A5
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7

label_5FB71::
    jr   nz, label_5FBB3
    ld   h, b
    ld   a, b
    db   $10 ; Undefined instruction
    ld   l, b
    sub  a, b
    jr   nc, label_5FBCB
    add  a, b
    sub  a, b
    jr   label_5FBB7
    ld   l, b
    ld   a, b

label_5FB81::
    jr   z, label_5FB8B
    jr   z, label_5FB85

label_5FB85::
    ld   c, b
    ld   b, b
    ld   c, h
    jr   c, label_5FBF2
    ld   [hl], b

label_5FB8B::
    ld   e, b
    ld   l, b
    ld   a, b
    adc  a, b
    sbc  a, b
    add  a, b

label_5FB91::
    ld   e, $1E
    ld   e, $2E
    ld   l, $3E
    ld   l, $2E
    ld   de, $C090
    push bc
    ld   a, [$FFE7]
    and  $01
    ld   c, a

label_5FBA2::
    ld   hl, label_5FB81
    add  hl, bc
    ld   a, [$FFEC]
    add  a, [hl]
    cp   $98
    jr   c, label_5FBAF
    sub  a, $88

label_5FBAF::
    ld   [de], a
    inc  de
    ld   hl, label_5FB71
    add  hl, bc
    ld   a, [hl]
    ld   [de], a

label_5FBB7::
    inc  de
    push bc
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    nop
    xor  c
    and  $07
    ld   c, a
    ld   b, $00
    ld   hl, label_5FB91
    add  hl, bc
    ld   a, [hl]

label_5FBCB::
    ld   [de], a
    inc  de
    pop  bc
    ld   a, $96
    ld   [de], a
    inc  de
    inc  c
    inc  c
    ld   a, c
    cp   $10
    jr   c, label_5FBA2
    pop  bc
    ret

label_5FBDB::
    nop
    ld    hl, sp+$58
    ld   bc, $0000
    ld   l, b
    ld   bc, label_800
    ld   l, b
    ld   hl, label_1000
    ld   e, b
    ld   hl, $F800
    ld   e, d
    ld   bc, $0000
    ld   l, d

label_5FBF2::
    ld   bc, label_800
    ld   l, d
    ld   hl, label_1000
    ld   e, d
    ld   hl, $F800
    ld   e, h
    ld   bc, $0000
    ld   l, h
    ld   bc, label_800
    ld   l, h
    ld   hl, label_1000
    ld   e, h
    ld   hl, $F800
    ld   e, [hl]
    ld   bc, $0000
    ld   l, [hl]
    ld   bc, label_800
    ld   l, [hl]
    ld   hl, label_1000
    ld   e, [hl]
    ld   hl, label_5D03E
    ld   [$C3C0], a
    ld   hl, label_5FBDB
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    call label_3B0C
    ld   a, [$FFF0]
    rst  0
    ld   c, l
    ld   a, h
    ld   a, e
    ld   a, h
    and  l
    ld   a, h
    or   a
    ld   a, h
    call label_C05
    jr   nz, label_5FC6A
    call label_5FE30
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5FC6A
    ld   hl, $C250
    add  hl, bc
    dec  [hl]
    jr   nz, label_5FC6A
    call label_C05
    ld   [hl], $80
    call label_3B12

label_5FC6A::
    ret

label_5FC6B::
    nop
    nop
    nop
    ld   bc, label_201
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   [bc], a
    ld   bc, $CD01
    dec  b
    inc  c
    jr   nz, label_5FC8D
    ld   a, $CF
    call label_5FCF0
    ld   a, $19
    ld   [$C5AB], a
    call label_3B12

label_5FC8D::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   a, [hl]
    inc  [hl]
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_5FC6B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ret
    call label_5FC8D
    ld   a, [$C19F]
    and  a
    jr   nz, label_5FCB6
    call label_C05
    ld   [hl], $FF
    call label_3B12

label_5FCB6::
    ret
    call label_5FC8D
    call label_C05
    jr   nz, label_5FCC8

label_5FCBF::
    call label_5CCD9

label_5FCC2::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_5FCC8::
    cp   $E0
    jr   nc, label_5FCEF
    cp   $DF
    jr   nz, label_5FCD4
    ld   a, $26
    ld   [$FFF2], a

label_5FCD4::
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    ld   a, [hl]
    cp   $FC
    jr   nc, label_5FCBF
    add  a, $02
    ld   [hl], a
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    jr   nc, label_5FCEF
    ld   a, $FF
    call label_3B0C

label_5FCEF::
    ret

label_5FCF0::
    ld   e, a
    ld   a, [$FF99]
    push af
    ld   a, $10
    ld   [$FF99], a
    ld   a, e
    call label_2385
    pop  af
    ld   [$FF99], a
    ret

label_5FD00::
    nop
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    jr   nz, label_5FD07

label_5FD07::
    jr   nz, label_5FD4D
    nop
    ld   b, [hl]
    nop
    ld   c, b

label_5FD0D::
    nop
    ld   c, d
    nop
    ld   c, h
    nop
    ld   c, h
    jr   nz, label_5FCED
    jr   nz, label_5FCED
    jr   nz, label_5FCED
    nop
    call nc, label_D620
    nop
    ret  c
    nop
    jp  c, label_DC00
    nop
    sbc  a, $00
    ld   [rJOYP], a
    ld  [$FF00+C], a
    nop
    ld  [$FF00+C], a
    jr   nz, label_5FD0D
    jr   nz, label_5FD0D
    jr   nz, label_5FD0D
    jr   nz, label_5FD0D
    jr   nz, label_5FD25
    sbc  a, l
    rla
    rla
    and  $FC
    ld   e, a
    ld   d, $00
    ld   hl, label_5FD00
    add  hl, de
    push hl
    pop  de
    ld   hl, $C004
    ld   a, [$FF99]
    ldi  [hl], a
    ld   a, [$C155]
    ld   c, a

label_5FD4D::
    ld   a, [$FF98]
    sub  a, c
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    push hl
    ld   hl, $FFD7
    ld   a, [$DC0F]
    and  a
    jr   z, label_5FD5F
    inc  a

label_5FD5F::
    ld   [hl], a
    ld   a, [de]
    or   [hl]
    pop  hl
    inc  de
    ldi  [hl], a
    ld   a, [$FF99]
    ldi  [hl], a
    ld   a, [$FF98]
    sub  a, c
    add  a, $08
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    push hl
    ld   hl, $FFD7
    ld   a, [de]
    or   [hl]
    pop  hl
    ld   [hl], a
    ret

label_5FD7A::
    scf
    ld   a, a
    ld   a, [$FFE7]
    and  $10
    ret  nz
    ld   e, $00
    ld   a, [$C19F]
    and  $80
    jr   z, label_5FD8B
    inc  e

label_5FD8B::
    ld   d, $00
    ld   a, [$DB95]
    cp   $01
    jr   z, label_5FDAC
    ld   hl, label_5FD7A
    add  hl, de
    ld   a, [hl]
    ld   [$C018], a
    ld   a, $97
    ld   [$C019], a
    ld   a, $A2
    ld   [$C01A], a
    ld   a, $42
    ld   [$C01B], a
    ret

label_5FDAC::
    ld   hl, label_5FD7A
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF97
    sub  a, [hl]
    ld   [$C000], a
    ld   a, $97
    ld   [$C001], a
    ld   a, $FE
    ld   [$C002], a
    ld   a, $40
    ld   [$C003], a
    ret

label_5FDC8::
    jr   nc, label_5FE42

label_5FDCA::
    jr   nc, label_5FE24
    ld   e, $00
    ld   a, [$C19F]
    and  $80
    jr   z, label_5FDD6
    inc  e

label_5FDD6::
    ld   d, $00
    ld   a, [$DB95]
    cp   $01
    jr   z, label_5FE04
    ld   hl, label_5FDC8
    add  hl, de
    ld   a, [hl]
    ld   [$C018], a
    ld   e, $00
    ld   a, [$C177]
    and  $01
    jr   z, label_5FDF1
    inc  e

label_5FDF1::
    ld   hl, label_5FDCA
    add  hl, de
    ld   a, [hl]
    ld   [$C019], a
    ld   a, $3E
    ld   [$C01A], a
    ld   a, $00
    ld   [$C01B], a
    ret

label_5FE04::
    ld   hl, label_5FDC8
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF97
    sub  a, [hl]
    ld   [$C000], a
    ld   e, $00
    ld   a, [$C177]
    and  $01
    jr   z, label_5FE1A
    inc  e

label_5FE1A::
    ld   hl, label_5FDCA
    add  hl, de
    ld   a, [hl]
    ld   [$C001], a
    ld   a, $9E

label_5FE24::
    ld   [$C002], a
    ld   a, $00
    ld   [$C003], a
    ret

label_5FE2D::
    call label_5FE3A

label_5FE30::
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_5FE3A
    pop  bc
    ret

label_5FE3A::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_5FE65

label_5FE42::
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_5FE52::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_5FE5C
    ld   e, $F0

label_5FE5C::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_5FE65::
    ret
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_5FE65
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_5FE52

label_5FE80::
    and  $01
    jr   z, label_5FE88
    ld   a, $02
    jr   label_5FEA0

label_5FE88::
    ld   a, $06
    ld   [$FFE4], a
    ld   a, $0C
    ld   [$FFE5], a
    ld   a, $18
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   a, $40
    ld   [$FFDA], a
    call label_5FEA4
    ld   a, $01

label_5FEA0::
    ld   [$DDD1], a
    ret

label_5FEA4::
    push hl
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    ld   d, a
    dec  hl
    xor  a
    ld   [rSVBK], a
    ld   a, [$FFE4]

label_5FEB3::
    ld   c, a
    ld   a, e
    and  $1F
    ld   b, a
    ld   a, [hl]
    and  $1F
    cp   b
    jr   c, label_5FEC6
    jr   z, label_5FEC6
    sub  a, c
    jr   c, label_5FEC6
    cp   b
    jr   nc, label_5FEC7

label_5FEC6::
    ld   a, b

label_5FEC7::
    ld   [$FFD7], a
    ld   a, e
    and  $E0
    swap a
    ld   b, a
    ld   a, d
    and  $03
    swap a
    or   b
    ld   b, a
    ld   a, [hli]
    and  $E0
    swap a
    ld   c, a
    ld   a, [hl]
    and  $03
    swap a
    or   c
    push af
    ld   a, [$FFE5]
    ld   c, a
    pop  af
    cp   b
    jr   c, label_5FEF2
    jr   z, label_5FEF2
    sub  a, c
    jr   c, label_5FEF2
    cp   b
    jr   nc, label_5FEF3

label_5FEF2::
    ld   a, b

label_5FEF3::
    ld   [$FFD8], a
    ld   a, [$FFE6]
    ld   c, a
    ld   a, d
    and  $7C
    ld   b, a
    ld   a, [hl]
    and  $7C
    cp   b
    jr   c, label_5FF0A
    jr   z, label_5FF0A
    sub  a, c
    jr   c, label_5FF0A
    cp   b
    jr   nc, label_5FF0B

label_5FF0A::
    ld   a, b

label_5FF0B::
    ld   [$FFD9], a
    pop  hl
    ld   a, [$FFD7]
    ld   b, a
    ld   a, [$FFD8]
    swap a
    ld   c, a
    and  $E0
    or   b
    ldi  [hl], a
    ld   a, [$FFD9]
    ld   b, a
    ld   a, c
    and  $03
    or   b
    ldi  [hl], a
    ld   a, [$FFDA]
    dec  a
    ld   [$FFDA], a
    and  a
    jp   nz, label_5FEA4
    xor  a
    ld   [$DDD5], a
    ret

label_5FF30::
    and  $01
    jr   z, label_5FF3C
    xor  a
    ld   [$D01F], a
    ld   a, $02
    jr   label_5FF52

label_5FF3C::
    ld   a, $06
    ld   [$FFE4], a
    ld   a, $0C
    ld   [$FFE5], a
    ld   a, $18
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   d, $40
    call label_5FF57
    ld   a, $01

label_5FF52::
    ld   [$DDD1], a
    xor  a
    ret

label_5FF57::
    push hl
    ld   a, [$FFE4]
    ld   c, a
    ld   a, [hl]
    and  $1F
    add  a, c
    cp   $20
    jr   c, label_5FF65
    ld   a, $1F

label_5FF65::
    ld   [$FFD7], a
    ld   a, [$FFE5]
    ld   c, a
    ld   a, [hli]
    and  $E0
    swap a
    ld   b, a
    ld   a, [hl]
    and  $03
    swap a
    or   b
    and  $3E
    add  a, c
    cp   $40
    jr   c, label_5FF7F
    ld   a, $3E

label_5FF7F::
    ld   [$FFD8], a
    ld   a, [$FFE6]
    ld   c, a
    ld   a, [hl]
    and  $7C
    add  a, c
    cp   $80
    jr   c, label_5FF8E
    ld   a, $7C

label_5FF8E::
    ld   [$FFD9], a
    pop  hl
    ld   a, [$FFD7]
    ld   b, a
    ld   a, [$FFD8]
    swap a
    ld   c, a
    and  $E0
    or   b
    ldi  [hl], a
    ld   a, [$FFD9]
    ld   b, a
    ld   a, c
    and  $03
    or   b
    ldi  [hl], a
    dec  d
    jr   nz, label_5FF57
    ret

label_5FFA9::
    ld   hl, $DE01
    ld   a, $20
    ldi  [hl], a
    ld   a, $7D
    ldi  [hl], a
    ld   a, $7C
    ldi  [hl], a
    ld   a, $17
    ld   [hl], a
    jp   label_BD7
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
