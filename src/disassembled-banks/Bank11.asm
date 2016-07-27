section "bank11",romx,bank[$0B]
    nop
    ld   b, d
    nop
    ld   b, d
    ld   a, [hli]
    ld   b, d
    ld   e, b
    ld   b, d
    ld   [hl], h
    ld   b, d
    sub  a, a
    ld   b, d
    sub  a, $42
    inc  l

label_2C00F::
    ld   b, e
    ld   h, [hl]
    ld   b, e
    sbc  a, [hl]
    ld   b, e
    db   $DB
    ld   b, e
    dec  h
    ld   b, h
    and  e
    ld   b, h
    db   $DB
    ld   b, h
    inc  c
    ld   b, l
    ccf
    ld   b, l
    ld   a, b
    ld   b, l
    and  c
    ld   b, l
    call nc, label_445
    ld   b, [hl]
    add  hl, hl

label_2C029::
    ld   b, [hl]
    ld   l, c
    ld   b, [hl]
    or   l
    ld   b, [hl]
    push af
    ld   b, [hl]
    inc  e
    ld   b, a
    ld   c, e
    ld   b, a
    adc  a, e
    ld   b, a
    ld   [label_1847], a
    ld   c, b
    ld   e, d
    ld   c, b
    sbc  a, [hl]
    ld   c, b
    push de
    ld   c, b
    inc  bc
    ld   c, c
    inc  l
    ld   c, c
    ld   d, c
    ld   c, c
    xor  h
    ld   c, c
    or   [hl]
    ld   c, c
    sub  a, $49
    ld   bc, label_2D04A
    ld   c, d
    add  a, l
    ld   c, d
    and  l
    ld   c, d
    jp   z, label_E94A
    ld   c, d
    dec  a
    ld   c, e
    sub  a, h
    ld   c, e
    call z, label_FB4B
    ld   c, e
    cp   $4B
    ccf
    ld   c, h
    ld   e, [hl]
    ld   c, h
    adc  a, d
    ld   c, h
    adc  a, d
    ld   c, h
    and  h
    ld   c, h
    ld  [$FF00+C], a
    ld   c, h
    ld  [$FF00+C], a
    ld   c, h
    ld   b, b
    ld   c, l
    ld   d, a
    ld   c, l
    or   a
    ld   c, l
    add  hl, bc
    ld   c, [hl]
    ld   c, e
    ld   c, [hl]
    and  d
    ld   c, [hl]
    db   $4E
    ld   c, [hl]
    rrca
    ld   c, a
    inc  h
    ld   c, a

label_2C082::
    ld   h, h

label_2C083::
    ld   c, a
    xor  a
    ld   c, a
    rst  $18
    ld   c, a
    ld   sp, label_2D250
    ld   d, b
    add  a, d
    ld   d, b
    cp   b
    ld   d, b
    db   $50
    ld   d, b
    ld   c, $51
    ld   e, l
    ld   d, c
    adc  a, c
    ld   d, c
    and  e
    ld   d, c
    db   $D3 ; Undefined instruction
    ld   d, c
    ld   de, label_2C52
    ld   d, d
    ld   e, b
    ld   d, d
    or   l
    ld   d, d
    ld   bc, label_2E53
    ld   d, e
    ld   h, [hl]
    ld   d, e
    ld   [hl], a
    ld   d, e
    sbc  a, a
    ld   d, e
    cp   e
    ld   d, e
    jp   [hl]
    ld   d, e
    inc  h
    ld   d, h
    ld   [hl], c
    ld   d, h
    xor  l
    ld   d, h
    or   [hl]
    ld   d, h
    rst  $28
    ld   d, h
    inc  a
    ld   d, l
    ld   e, h
    ld   d, l
    or   l
    ld   d, l
    rst  $28
    ld   d, l

label_2C0C4::
    add  hl, hl
    ld   d, [hl]
    ld   a, d
    ld   d, [hl]
    call nc, label_856
    ld   d, a
    ld   b, b
    ld   d, a
    add  a, l
    ld   d, a
    ret  nc
    ld   d, a
    ld   c, $58
    ld   e, d
    ld   e, b
    xor  b
    ld   e, b
    ld   a, [$FF58]
    ld   a, [$FF58]
    ld   a, [$FF58]
    ld   a, [$FF58]
    dec  a
    ld   e, c
    ld   [hl], d
    ld   e, c
    sub  a, c
    ld   e, c
    add  a, $59
    rra
    ld   e, d
    ld   c, d
    ld   e, d
    dec  a
    ld   e, c
    sbc  a, h
    ld   e, d
    sbc  a, h
    ld   e, d
    sbc  a, h
    ld   e, d
    sbc  a, h
    ld   e, d
    rst  $38
    ld   e, d
    ld   e, c
    ld   e, e
    call z, label_205B
    ld   e, h
    db   $76 ; Halt
    ld   e, h
    or   d
    ld   e, h
    rla
    ld   e, l
    ld   b, [hl]
    ld   e, l
    or   h
    ld   e, l
    add  hl, de
    ld   e, [hl]
    ld   c, l
    ld   e, [hl]
    xor  h
    ld   e, [hl]
    or   $5E
    ld   b, [hl]
    ld   e, a
    or   [hl]
    ld   e, a
    add  hl, de
    ld   h, b
    ld   a, h
    ld   h, b
    or   a
    ld   h, b
    ld   [label_2E961], sp
    ld   h, c
    xor  b
    ld   h, c
    db   $DB
    ld   h, c
    ld   b, a
    ld   h, d
    ld   a, d
    ld   h, d
    cp   a
    ld   h, d
    ei
    ld   h, d
    inc  a
    ld   h, e
    add  a, b
    ld   h, e
    ret
    ld   h, e
    ld   [de], a
    ld   h, h
    add  hl, sp
    ld   h, h
    ld   h, [hl]
    ld   h, h
    sbc  a, d
    ld   h, h
    rst  0
    ld   h, h
    db   $F4 ; Undefined instruction
    ld   h, h
    ld   hl, label_2165
    ld   h, l
    ld   b, h
    ld   h, l
    add  a, b
    ld   h, l
    sbc  a, c
    ld   h, l
    bit  4, l
    ei
    ld   h, l
    ld   c, [hl]
    ld   h, [hl]
    ld   a, [hl]
    ld   h, [hl]
    xor  e
    ld   h, [hl]
    pop  de
    ld   h, [hl]
    ld   a, [$FF66]
    ld   e, $67
    ld   e, d
    ld   h, a
    xor  [hl]
    ld   h, a
    db   $FC ; Undefined instruction
    ld   h, a
    ldi  [hl], a
    ld   l, b
    ld   a, [hl]
    ld   l, b
    rst  $10
    ld   l, b
    inc  c
    ld   l, c
    ld   d, l
    ld   l, c
    adc  a, a
    ld   l, c
    adc  a, $69
    ei
    ld   l, c
    jr   z, label_2C1D8
    ld   [hl], e
    ld   l, d
    ret  z
    ld   l, d
    db   $FC ; Undefined instruction
    ld   l, d
    ld   l, $6B
    add  a, d
    ld   l, e
    db   $6B
    ld   l, e
    ld   h, $6C
    ld   [hl], e
    ld   l, h
    xor  e
    ld   l, h
    db   $E3 ; Undefined instruction
    ld   l, h

label_2C182::
    inc  sp
    ld   l, l
    adc  a, e
    ld   l, l

label_2C186::
    call nc, label_146D
    ld   l, [hl]
    ld   l, a
    ld   l, [hl]
    and  e
    ld   l, [hl]
    pop  de
    ld   l, [hl]
    dec  bc
    ld   l, a
    ld   l, e
    ld   l, a
    jp   z, label_1A6F
    ld   [hl], b
    ld   b, a
    ld   [hl], b
    ld   [hl], h
    ld   [hl], b
    or   l
    ld   [hl], b
    inc  b
    ld   [hl], c
    ld   a, $71
    adc  a, b
    ld   [hl], c
    call c, label_F671
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], d
    ld   [hl], c
    ld   [hl], d
    and  b
    ld   [hl], d
    jp   [hl]
    ld   [hl], d
    ld   a, [de]
    ld   [hl], e
    ld   l, c
    ld   [hl], e
    sbc  a, h
    ld   [hl], e
    pop  de
    ld   [hl], e
    inc  bc
    ld   [hl], h
    add  hl, hl
    ld   [hl], h
    ld   e, h
    ld   [hl], h
    sbc  a, [hl]
    ld   [hl], h

label_2C1C0::
    cp   $74

label_2C1C2::
    ld   e, $75
    ld   c, l
    ld   [hl], l
    sub  a, a
    ld   [hl], l
    call nz, label_975
    db   $76 ; Halt
    ld   h, c
    db   $76 ; Halt
    and  c
    db   $76 ; Halt
    rst  $28
    db   $76 ; Halt
    dec  hl
    ld   [hl], a
    ld   h, e
    ld   [hl], a
    ret  nz
    ld   [hl], a

label_2C1D8::
    ld   a, [de]
    ld   a, b
    ld   a, [hl]
    ld   a, b
    ld   [$FF78], a
    ld   b, c
    ld   a, c
    adc  a, a
    ld   a, c
    ret  c
    ld   a, c
    dec  h
    ld   a, d
    ld   a, c
    ld   a, d
    call nc, label_57A
    ld   a, e
    ld   d, b
    ld   a, e
    sub  a, h
    ld   a, e
    db   $EC ; Undefined instruction
    ld   a, e
    ld   h, $7C
    adc  a, e
    ld   a, h
    jp   [hl]
    ld   a, h
    inc  e
    ld   a, l
    adc  a, b
    ld   a, l
    jp   z, label_17D
    ld   a, [hl]
    inc  b
    adc  a, l
    add  hl, de
    rst  $30
    ld   [hl], l
    push af
    adc  a, c
    ld   de, $C60F
    ld   hl, label_220F
    dec  h
    add  a, a
    inc  hl
    ld   hl, label_32C5
    inc  hl
    add  a, [hl]
    ld   b, h
    db   $DB
    jp   label_DB54
    inc  h
    rst  0
    daa
    rst  0
    ld   b, d
    ret
    ld   [hl], l
    dec  c
    db   $76 ; Halt
    inc  l
    add  a, e
    ld   [hl], a
    ldi  [hl], a
    ld   de, $FEA0
    inc  b
    ld   c, l
    db   $10 ; Undefined instruction
    add  hl, de
    rst  $30
    ld   [hl], d
    push af
    add  hl, bc
    ld   hl, label_108A

label_2C236::
    rrca
    adc  a, c
    jr   nz, label_2C25B
    add  hl, hl
    ld   h, $C5
    ldd  [hl], a
    call c, label_2C082
    db   $DB
    ld   [hl], c
    dec  hl
    ld   [hl], e
    inc  l
    db   $76 ; Halt
    dec  hl
    ld   [hl], a
    call c, label_2C78
    inc  hl
    rst  0
    daa
    rst  0
    dec  h
    and  e
    pop  hl
    ld   b, $11
    ld   e, b

label_2C256::
    jr   nc, label_2C256
    inc  b
    dec  l
    db   $10 ; Undefined instruction
    add  hl, de

label_2C25D::
    rst  $30
    nop
    ld   hl, label_108A
    rrca
    jr   nz, label_2C28A
    adc  a, c
    ld   hl, label_2221
    rst  0
    ld   h, $C7
    inc  h
    and  e
    pop  hl
    ld   b, $12
    ld   c, b

label_2C272::
    jr   nc, label_2C272
    inc  b
    ld   a, l
    db   $10 ; Undefined instruction
    ld   [hl], h
    push af
    adc  a, c
    db   $10 ; Undefined instruction
    add  a, $28
    rrca
    add  a, a
    jr   nz, label_2C2A4
    daa
    ld   h, $C5

label_2C286::
    scf
    inc  h
    ld   [hl], b
    dec  hl

label_2C28A::
    ld   [hl], e
    inc  l
    ld   [hl], h
    ldi  [hl], a
    ld   [hl], l
    dec  hl
    ldi  [hl], a
    rst  0
    dec  h
    rst  0
    jr   label_2C236
    cp   $04
    sbc  a, l
    ld   bc, label_29F4
    rst  $30
    ld   [hl], c
    push af
    ret  z
    nop
    inc  hl
    ret  z
    ld   bc, $C80F
    ld   [bc], a
    inc  hl
    ld   b, $2A
    add  a, d
    rlca
    ld   hl, label_2609
    jr   label_2C25D
    add  hl, de
    ld   a, [hli]
    daa
    dec  c
    add  hl, sp
    inc  l
    ld   c, c
    ld   a, [hli]
    ld   l, b
    xor  h
    ld   l, c
    inc  l
    ld   a, c
    inc  h
    ldi  [hl], a
    ret
    ld   d, d
    ret
    ret  z
    inc  b
    db   $DB
    add  a, $16
    call c, label_2585
    db   $DB
    db   $76 ; Halt
    inc  l
    add  a, d
    ld   [hl], a
    ldi  [hl], a
    ld   a, c

label_2C2D2::
    jr   z, label_2C32D
    call c, label_4FE
    dec  c
    ld   [bc], a
    db   $F4 ; Undefined instruction
    jr   nz, label_2C2D2
    add  hl, hl
    rst  $30
    ld   [hl], d

label_2C2DF::
    push af
    adc  a, b
    ld   de, $88B0
    ld   sp, $88AF
    ld   b, c
    or   b
    add  a, [hl]
    ld   h, c
    xor  a
    ld   bc, $C229
    ld   [bc], a
    call c, label_2A03
    add  a, d
    inc  b
    rst  0
    ld   b, $29
    push bc
    rlca
    call c, label_2A08
    db   $10 ; Undefined instruction
    add  hl, de
    ld   a, [hli]
    adc  a, d
    jr   nz, label_2C2DF
    jr   nc, label_2C331
    jp   nz, label_DB32
    add  hl, sp
    inc  l
    ld   b, b
    add  hl, hl
    ld   c, c
    ld   a, [hli]
    adc  a, d
    ld   d, b
    call c, label_2B60
    jp   nz, label_DB62
    jp   nz, label_DB67

label_2C31A::
    ld   l, b
    inc  l
    ld   l, c
    ldi  [hl], a
    ld   [hl], c
    dec  hl
    ld   [hl], e
    inc  l
    add  a, d
    ld   [hl], h
    ret  z
    db   $76 ; Halt
    dec  hl
    ld   a, b
    inc  h
    ld   a, c
    rrca
    cp   $04

label_2C32D::
    dec  c
    db   $10 ; Undefined instruction
    add  hl, de

label_2C331::
    rst  $30
    ld   [hl], h
    push af
    db   $10 ; Undefined instruction
    ld   de, label_18AC
    xor  h
    add  hl, de
    ld   a, [hli]
    add  a, l
    jr   nz, label_2C31A
    add  hl, hl
    dec  c
    jr   nc, label_2C36E
    adc  a, d
    ld   d, b
    call c, label_34C5
    db   $DB
    add  hl, sp
    inc  l
    ld   b, b
    add  hl, hl
    ld   c, c
    ld   a, [hli]
    add  a, e
    ld   h, b
    ldi  [hl], a
    ld   h, e
    dec  hl
    jp   nz, label_DC65
    ld   l, b
    xor  h
    ld   l, c
    inc  l
    add  a, e
    ld   [hl], b
    rrca
    ld   [hl], e
    inc  hl
    db   $76 ; Halt
    inc  l

label_2C362::
    add  a, d
    ld   h, [hl]
    call c, label_4FE
    dec  e
    inc  bc
    db   $F4 ; Undefined instruction
    jr   nc, label_2C362
    ld   [hl], a
    push af

label_2C36E::
    inc  bc
    inc  h
    inc  b
    xor  h
    dec  b
    inc  hl
    rst  0
    rlca
    inc  h
    ret  z
    ld   [label_100F], sp
    add  hl, hl
    inc  de
    ld   a, [hli]
    inc  d
    ld   hl, label_2915
    jr   nz, label_2C391

label_2C384::
    jr   nc, label_2C3B1
    ld   b, b
    add  hl, hl
    ld   d, b
    call c, label_2B60
    daa
    jp   z, label_CA57
    ld   [hl], a

label_2C391::
    jr   z, label_2C40C
    inc  h
    add  a, e
    ld   b, e
    call nc, label_2D383
    call nc, label_2E383
    call nc, label_4FE
    sbc  a, l
    ld   bc, label_2F1F4
    push af
    ret  z
    nop
    inc  hl
    ret  z
    ld   bc, $C80F
    ld   [bc], a
    inc  hl
    ret  z
    add  hl, bc
    inc  h
    add  hl, hl

label_2C3B1::
    di
    add  a, [hl]
    ld   d, e
    call c, label_C922
    ld   d, d
    ret
    ld   b, $2A
    add  a, d
    rlca
    ld   hl, label_2609
    call nz, label_DB04
    dec  [hl]
    db   $DB
    jp   nz, label_DB26
    add  a, e
    ld   d, $DC
    dec  h
    and  b
    rlca
    and  e
    pop  hl
    ld   b, $17
    ld   a, b
    db   $10 ; Undefined instruction
    ld   a, [hli]
    add  hl, sp
    dec  c
    ld   c, c
    inc  l
    cp   $04
    dec  c
    ld   bc, label_20F4
    or   $39
    rst  $30
    ld   bc, label_229
    db   $DB
    inc  bc
    ld   a, [hli]
    ld   b, $29
    jp   label_DB07
    jp   nz, label_2408
    jp   nz, label_F09
    ld   de, label_1225
    ld   hl, label_2613
    jp   nz, label_2321
    jp   nz, label_122
    jp   nz, label_2423
    add  a, e
    scf
    db   $DB
    jr   z, label_2C432
    add  hl, hl
    ld   hl, label_2741

label_2C40C::
    ld   b, d
    ldi  [hl], a
    ld   b, e
    jr   z, label_2C45A
    call c, label_2C59
    ld   h, c
    xor  h
    ld   [hl], $20
    ld   h, d
    jr   nz, label_2C482
    jr   nz, label_2C485
    xor  h
    jr   nz, label_2C449
    jr   nc, label_2C42F
    ld   b, b
    dec  hl
    cp   $04
    sbc  a, l
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_2C421
    add  hl, sp
    rst  $30
    ld   [hl], d
    push af

label_2C42F::
    add  a, e
    nop
    rrca

label_2C432::
    inc  bc
    inc  hl
    inc  b
    db   $DB
    dec  b
    call c, label_2A06
    rlca
    rst  0
    ld   [$C226], sp
    add  hl, bc
    inc  bc
    db   $10 ; Undefined instruction
    ld   de, label_1225
    sbc  a, b
    inc  de
    add  hl, hl

label_2C449::
    add  a, h
    inc  d
    call c, label_2608
    jr   label_2C474
    jr   nz, label_2C473
    ld   hl, label_2229
    db   $DB
    add  a, h
    inc  hl
    xor  h
    daa

label_2C45A::
    call c, label_2A28
    add  hl, hl
    ld   hl, label_3083
    db   $DB
    jp   nz, label_AC33
    add  a, d
    inc  [hl]
    rrca
    jp   nz, label_AC36
    add  a, e
    scf
    call c, label_2C083
    call c, label_2C482

label_2C473::
    rrca

label_2C474::
    add  a, e
    ld   b, a
    db   $DB
    ld   d, b
    ldi  [hl], a
    ld   d, c
    dec  hl
    ld   d, d
    call c, label_2D384
    xor  h
    ld   d, a
    db   $DB

label_2C482::
    ld   e, b
    inc  l
    ld   e, c

label_2C485::
    ldi  [hl], a
    jp   nz, label_360
    ld   h, c
    inc  hl
    add  a, e
    ld   h, d
    call c, label_2E583
    db   $DB
    ld   l, b
    inc  h
    jp   nz, label_369
    ld   [hl], c
    daa
    ld   [hl], d
    ret  z

label_2C49A::
    ld   [hl], e
    dec  hl
    db   $76 ; Halt
    inc  l
    ld   [hl], a
    ret  z
    ld   a, b

label_2C4A1::
    jr   z, label_2C4A1
    inc  b
    dec  c
    dec  b
    and  e
    rlca
    db   $F4 ; Undefined instruction
    jr   nc, label_2C4A1
    ld   [hl], l
    db   $ED ; Undefined instruction
    rlca
    ld   h, $C8
    ld   [label_90F], sp
    inc  h
    add  a, $14
    and  [hl]
    add  a, $17
    inc  h
    jr   nz, label_2C4E5
    jr   nc, label_2C49A
    add  a, d
    ld   sp, label_2C00F
    db   $DB
    add  a, d
    ld   b, c
    rrca
    ld   d, b
    dec  hl
    jp   label_F52
    ld   [hl], c
    dec  hl
    ld   [hl], e
    dec  c
    ld   [hl], h
    inc  l
    ld   [hl], a
    jr   z, label_2C54D
    inc  h
    pop  hl
    ld   b, $1A
    ld   l, b

label_2C4D9::
    jr   nc, label_2C4D9
    inc  b
    ld   e, l
    ld   bc, label_2D9F4
    rst  $30
    add  a, $01
    rrca
    push bc

label_2C4E5::
    ld   [bc], a
    inc  hl
    add  hl, bc
    inc  h
    add  a, [hl]
    inc  de
    rrca
    add  a, [hl]
    inc  hl
    rrca
    add  a, a
    inc  sp
    rrca
    add  a, [hl]
    ld   b, e
    rrca
    dec  h
    jr   nz, label_2C51E
    jr   nz, label_2C52F
    jr   nz, label_2C532
    jr   nz, label_2C517
    ld   a, [hli]
    ld   d, d
    daa
    add  a, a
    ld   d, e
    ldi  [hl], a
    adc  a, b
    ld   h, c

label_2C506::
    rrca
    ld   l, c
    xor  h
    ld   a, c
    dec  hl
    cp   $04

label_2C50D::
    dec  c
    jr   nc, label_2C506
    add  hl, sp
    rst  $30
    ld   de, label_18AC
    xor  h
    ld   h, c

label_2C517::
    xor  h
    ld   l, b
    xor  h
    db   $10 ; Undefined instruction
    add  hl, de
    ld   a, [hli]

label_2C51E::
    jp   label_D20
    jp   label_D29
    ld   d, b
    dec  hl
    ld   e, c

label_2C527::
    inc  l
    jp   nz, label_C042
    jp   nz, label_C047
    add  a, h

label_2C52F::
    inc  hl
    rrca
    adc  a, d

label_2C532::
    jr   nc, label_2C543
    add  a, h
    ld   b, e
    rrca
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a

label_2C53B::
    ld   c, $58

label_2C53D::
    jr   nc, label_2C53D
    inc  b
    dec  c
    inc  b
    db   $F4 ; Undefined instruction

label_2C543::
    jr   nz, label_2C53B
    add  hl, hl
    rst  $30
    jp   label_D20
    jp   label_D29

label_2C54D::
    ld   a, c
    ldi  [hl], a
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    db   $10 ; Undefined instruction
    add  hl, de
    ld   a, [hli]
    adc  a, d
    jr   nc, label_2C56C
    adc  a, d
    ld   d, b
    ldi  [hl], a
    adc  a, d

label_2C561::
    ld   h, b
    rrca
    ld   h, b
    xor  h
    ld   [hl], b
    inc  l
    ld   b, c
    and  [hl]
    ld   c, b
    and  [hl]
    ld   l, b

label_2C56C::
    and  [hl]
    add  a, h
    inc  hl
    call nc, label_D433
    ld   [hl], $D4
    add  a, h
    ld   b, e
    call nc, label_4FE
    ld   l, l
    dec  b
    db   $EC ; Undefined instruction
    ld   d, b
    or   $00
    xor  h
    ld   bc, $C323
    ld   [bc], a

label_2C584::
    rrca
    inc  bc
    dec  c
    inc  b
    ld   a, [hli]
    rlca
    ld   h, $C6
    ld   [label_100F], sp
    ld   hl, label_2911
    call nz, label_2417
    add  a, e
    jr   nc, label_2C5A7
    add  a, a
    ld   d, b
    ldi  [hl], a
    ld   d, a
    jr   z, label_2C527
    ld   h, b
    rrca
    cp   $04
    rlca
    ld   [hl], d
    push af
    ld   [bc], a
    rst  0

label_2C5A7::
    inc  bc
    ld   h, $82
    inc  b
    adc  a, e
    ld   b, $25
    rlca
    rst  0
    inc  de
    inc  h
    add  a, d
    inc  d
    adc  a, e
    ld   d, $23
    inc  hl
    ld   a, [hli]
    add  a, d
    inc  h
    ld   hl, label_2926
    jr   z, label_2C561
    dec  h
    and  d
    ld   [hl], d
    dec  hl
    ld   [hl], e
    rlca
    ld   [hl], h
    inc  l
    ld   [hl], a
    dec  hl
    ld   a, b
    rlca
    ld   a, c
    inc  h
    pop  hl
    ld   b, $02
    ld   e, b

label_2C5D2::
    jr   nc, label_2C5D2
    inc  b
    dec  c
    ld   [hl], c
    push af
    ld   [bc], a
    rst  0
    inc  bc
    ld   h, $82
    inc  b
    adc  a, e
    ld   b, $25
    rlca
    rst  0
    inc  de
    inc  h
    add  a, d
    inc  d
    adc  a, e
    ld   d, $23
    inc  hl
    ld   a, [hli]
    add  a, d
    inc  h
    ld   hl, label_2926
    jr   z, label_2C594
    inc  h
    and  d
    ld   [hl], b
    inc  hl
    add  a, d
    ld   [hl], c
    dec  c
    ld   [hl], e
    inc  l
    inc  [hl]
    call c, label_6E1
    inc  bc
    ld   c, b

label_2C602::
    jr   nc, label_2C602
    inc  b
    dec  c
    ld   c, c
    di
    ld   [hl], h
    ei
    inc  bc
    rst  0
    ld   b, $C7
    add  a, d
    inc  d
    jp  c, label_21C3
    jp  c, label_28C3
    jp  c, label_3482
    jp  c, label_2C482
    jp  c, label_2D3C2
    jp  c, label_2D6C2
    jp  c, label_6E1
    dec  b
    nop
    nop
    cp   $04
    dec  c
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld   b, b
    or   $59
    rst  $30

label_2C631::
    ld   [hl], d
    ld   c, b
    ld   [bc], a
    add  hl, hl
    inc  bc
    dec  c
    inc  b
    ld   a, [hli]
    rlca
    add  hl, hl
    ld   [label_90D], sp
    inc  h
    ld   de, $C2AC
    inc  d
    ld   de, label_17C5
    and  [hl]
    add  a, e
    ld   hl, label_3213
    ld   e, $42
    rra
    ld   e, c
    ld   a, [hli]
    ld   h, [hl]
    and  a
    ld   h, a
    dec  e
    ld   l, c
    dec  c
    ld   a, c
    ldi  [hl], a
    jp   nz, label_D416
    jr   z, label_2C631
    inc  [hl]
    call nc, label_C871
    ld   [hl], e
    ret  z
    pop  hl

label_2C664::
    ld   b, $06
    nop
    nop
    cp   $04
    dec  c
    ld   bc, label_39F4
    rst  $30
    ld   d, b
    or   $71
    push af
    inc  b
    rst  0
    rlca
    rst  0
    nop
    inc  hl
    add  a, d
    ld   bc, label_30D
    ld   a, [hli]
    jr   c, label_2C693
    ld   b, a
    ld   e, $50

label_2C683::
    add  hl, hl
    add  a, l
    ld   d, c
    call c, label_1C57

label_2C689::
    ld   h, b
    dec  c
    ld   h, c
    and  a
    add  a, e
    ld   h, h
    dec  e
    ld   h, a
    rra
    ld   [hl], b

label_2C693::
    dec  hl
    add  a, d
    ld   [hl], c
    dec  c
    ld   [hl], e
    inc  l
    db   $76 ; Halt
    dec  hl
    add  a, d
    ld   [hl], a
    dec  c
    ld   a, c
    inc  h
    add  a, d
    ld   [de], a
    call nc, label_1582
    call nc, label_D423
    dec  h
    call nc, label_38C3
    ld   de, label_1568

label_2C6AF::
    pop  hl
    ld   b, $07
    nop
    nop
    cp   $04
    dec  c
    jr   nc, label_2C6AF
    ld   [hl], a
    push af
    jp   nz, label_F31
    jr   nz, label_2C689
    ld   d, b
    ret
    add  hl, hl
    jp   z, label_CA59
    ld   [hl], a
    dec  hl
    ld   a, c
    inc  h
    ld   a, b
    db   $DB

label_2C6CC::
    ld   [bc], a
    ld   h, $07
    dec  h
    inc  bc
    xor  h
    add  a, d
    inc  b
    rst  0
    ld   b, $AC
    ld   [de], a
    ld   a, [hli]
    inc  de
    ld   h, $82
    inc  d
    rrca
    add  a, d
    inc  h
    rrca
    ld   d, $25
    rla
    add  hl, hl
    inc  hl
    inc  h
    inc  sp
    ld   a, [hli]
    add  a, d
    inc  [hl]
    sub  a, a
    ld   h, $23
    ld   [hl], $29
    ld   b, e
    xor  h
    ld   b, [hl]
    xor  h
    cp   $04
    dec  l
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    ld   a, [$A207]
    add  hl, sp
    rst  $30
    ld   [hl], l
    push af
    jr   nz, label_2C6CC
    ld   d, b
    ret
    jp   nz, label_D39

label_2C708::
    inc  [hl]
    inc  l
    dec  [hl]
    dec  hl
    ld   b, h
    ld   a, [hli]
    ld   b, l
    add  hl, hl
    ld   [hl], l
    dec  hl
    db   $76 ; Halt
    dec  c
    ld   [hl], a
    inc  l
    pop  hl
    ld   b, $09
    ld   a, b
    db   $10 ; Undefined instruction
    inc  b
    ld   c, l
    db   $10 ; Undefined instruction
    ld   [hl], l
    db   $ED ; Undefined instruction
    ld   [bc], a
    ccf
    ld   [hl], d
    ld   b, b
    ld   bc, label_3C7
    rst  0
    ld   [hl], c
    ret  z
    ld   [hl], e
    ret  z
    add  a, $10
    dec  c
    add  a, $11
    and  a
    add  a, $13
    and  [hl]
    jr   label_2C759
    ld   l, b
    jr   nz, label_2C7B0
    dec  hl
    add  a, d
    ld   [hl], l
    dec  c
    ld   [hl], a
    inc  l
    add  a, h
    inc  d
    call nc, label_D427
    add  a, d
    scf
    call nc, label_4FE
    dec  e
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [hl], e
    push af
    ld   [hl], d
    ret  z
    db   $76 ; Halt
    ret  z
    inc  bc
    ld   a, [hli]
    add  a, d
    inc  b

label_2C759::
    ld   hl, label_2906
    jp   label_DC13
    add  a, e
    inc  d
    dec  e
    ld   h, $DC
    daa
    dec  e
    add  a, d
    ld   sp, label_281D
    inc  l
    add  hl, hl
    jr   z, label_2C732
    jr   c, label_2C794
    push bc
    add  hl, sp
    rrca
    ld   [hl], e
    dec  hl
    ld   [hl], h
    dec  c
    ld   [hl], l
    inc  l
    ld   a, b
    jr   z, label_2C79D
    call nc, label_2C1C2
    call nc, label_D457
    add  a, e
    ld   h, l
    call nc, label_6E1

label_2C787::
    dec  bc
    nop
    nop
    cp   $04
    dec  c
    rlca
    db   $F4 ; Undefined instruction
    jr   nc, label_2C787
    ld   [hl], l
    push af
    nop

label_2C794::
    inc  l
    ld   bc, label_22B
    dec  h
    inc  bc
    rst  0
    ld   b, $C7

label_2C79D::
    rlca
    add  hl, hl
    ld   [label_90D], sp
    inc  h
    db   $10 ; Undefined instruction
    ld   de, $C623

label_2C7A8::
    ld   [de], a
    inc  hl
    add  a, d
    inc  de
    call c, label_2382
    call c, label_3382
    call c, label_2C384
    call c, label_2D386
    call c, label_2E384
    call c, label_2A20
    ld   hl, $C529
    jr   nc, label_2C7D2
    push bc
    ld   sp, label_2F10F
    ret  nz
    ld   [hl], d
    daa
    ld   [hl], l
    dec  hl
    db   $76 ; Halt
    call c, label_2C77
    add  a, e
    dec  d

label_2C7D2::
    rrca
    add  a, e
    dec  h
    rrca
    add  a, e
    dec  [hl]
    rrca
    ld   h, $BE
    inc  hl
    and  b
    ld   e, b
    dec  e
    add  a, d
    ld   b, a
    and  [hl]
    pop  hl
    ld   b, $0C
    ld   e, b
    db   $10 ; Undefined instruction
    db   $DB
    cp   $04
    dec  c
    dec  b
    db   $F4 ; Undefined instruction
    add  hl, sp
    rst  $30
    dec  b
    add  hl, hl
    ld   b, $0D
    rlca

label_2C7F5::
    ld   a, [hli]
    ld   de, label_14AC
    dec  e
    jr   label_2C7A8
    ld   hl, label_271D
    dec  e
    add  hl, sp
    ld   a, [hli]
    ld   c, c
    dec  c
    ld   b, c
    dec  e
    ld   b, a
    dec  e
    ld   e, c
    inc  l
    ld   h, c
    xor  h
    ld   h, h
    dec  e
    ld   l, b
    xor  h
    ldd  [hl], a
    rrca
    pop  hl
    ld   b, $0D
    nop
    nop
    cp   $04
    dec  c
    ld   [bc], a
    ld   b, a
    jr   nc, label_2C814
    ld   c, c
    rst  $30
    add  a, d
    inc  de
    and  [hl]
    add  a, d
    daa
    rrca
    add  a, d
    rla
    rrca
    add  a, h
    inc  hl
    dec  e
    jr   nc, label_2C857
    add  a, d
    ld   sp, $84A7
    inc  sp
    and  [hl]
    add  a, d
    scf
    rrca
    ld   b, b
    dec  c
    ld   b, [hl]
    and  [hl]
    add  a, d
    ld   b, a
    and  a
    ld   c, c
    ld   a, [hli]
    ld   d, b
    dec  hl
    ld   e, c
    dec  c
    ld   l, c
    inc  l
    inc  b
    add  hl, hl
    add  a, d
    dec  b
    dec  c
    rlca
    ld   a, [hli]
    add  a, d
    dec  d
    inc  de
    dec  [hl]
    ld   [de], a
    jr   z, label_2C7F5
    pop  hl
    ld   b, $0E

label_2C857::
    nop
    nop
    cp   $04
    dec  c
    inc  bc
    db   $F4 ; Undefined instruction
    ld   d, b
    or   $29
    rst  $30
    inc  bc
    add  hl, hl
    inc  b
    dec  c
    dec  b
    ld   a, [hli]
    ld   [$C226], sp
    add  hl, bc
    rrca
    ld   de, $C3AC
    ld   [de], a

label_2C871::
    db   $10 ; Undefined instruction
    inc  de
    rrca
    jp   label_1116
    rlca
    and  e
    pop  hl
    ld   b, $2A
    adc  a, b
    jr   nz, label_2C898
    inc  h
    add  a, e
    inc  hl
    rrca
    jr   z, label_2C8B0

label_2C886::
    add  hl, hl
    ld   hl, label_3383
    rrca
    jp   nz, label_DB39
    ld   b, b
    add  hl, hl
    ld   b, d
    sub  a, h
    add  a, e
    ld   b, e
    ld   [de], a
    ld   b, [hl]
    sub  a, e
    ld   d, b

label_2C898::
    dec  c
    ld   e, c

label_2C89A::
    inc  l
    ld   h, b
    dec  hl
    cp   $04
    dec  c
    dec  b

label_2C8A1::
    db   $F4 ; Undefined instruction
    jr   nz, label_2C89A
    add  a, d
    nop
    rrca
    ld   [bc], a
    dec  h
    inc  b
    rst  0
    dec  b
    add  hl, hl
    ld   b, $DC
    rlca

label_2C8B0::
    ld   a, [hli]
    ld   [$82C7], sp
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  hl
    add  a, d
    jr   nz, label_2C8DC
    ld   hl, label_2298
    add  hl, hl
    inc  h
    jr   nz, label_2C8E9

label_2C8C2::
    jr   nz, label_2C886
    jr   nc, label_2C8A1
    ld   sp, label_2C4DE
    jr   nz, label_2C912
    jr   nz, label_2C91D
    dec  hl
    ld   h, h
    jr   nz, label_2C938
    jr   nz, label_2C8D4
    ret  nz

label_2C8D4::
    cp   $07
    dec  c
    add  hl, hl
    rst  8
    add  hl, hl
    di
    ld   [hl], h

label_2C8DC::
    push af
    inc  bc
    rst  0
    ld   b, $C7
    ld   h, b
    daa
    adc  a, b
    ld   h, c
    ldi  [hl], a
    ld   h, e
    dec  hl
    add  a, d

label_2C8E9::
    ld   h, h
    dec  c
    ld   h, [hl]
    inc  l
    ld   l, c
    jr   z, label_2C960
    inc  l
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], d
    dec  hl
    ld   [hl], e
    inc  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  h
    ld   [hl], a

label_2C8FD::
    inc  l
    ld   a, b
    ldi  [hl], a
    ld   a, c
    dec  hl
    cp   $07
    dec  c
    jr   nz, label_2C8FD
    add  a, l
    ld   [de], a
    jp   nc, label_17C4
    rst  8
    add  a, l
    ld   d, e
    pop  de
    call nz, label_D022
    ld   h, d
    inc  l
    add  a, h
    ld   h, e
    ldi  [hl], a
    ld   h, a
    dec  hl
    ld   [hl], d
    jr   z, label_2C990

label_2C91D::
    inc  l
    add  a, d
    ld   [hl], h
    ldi  [hl], a
    db   $76 ; Halt
    dec  hl
    ld   [hl], a
    daa
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    jr   z, label_2C8CC
    cp   $04
    dec  c
    add  hl, hl
    rst  $30
    db   $76 ; Halt
    push af
    inc  bc
    rst  0
    ld   b, $C7
    ld   de, label_1820
    jr   nz, label_2C99C
    jr   nz, label_2C9A5
    jr   nz, label_2C968
    ld   a, [hli]
    add  a, l
    dec  [hl]
    call c, label_2C49
    jp   label_DC44
    ld   [hl], d
    dec  hl
    ld   [hl], e
    dec  c
    ld   [hl], h

label_2C94D::
    inc  l
    ld   h, e
    sbc  a, $FE
    inc  b
    adc  a, l
    inc  b
    db   $F4 ; Undefined instruction
    jr   nz, label_2C94D
    adc  a, c
    ld   de, $891C
    ld   hl, $891C
    ld   sp, $891C
    ld   b, c
    inc  e
    adc  a, c
    ld   d, c
    inc  e
    adc  a, c
    ld   h, c

label_2C968::
    inc  e
    adc  a, c
    ld   [hl], c
    inc  e

label_2C96C::
    nop
    ld   a, [hli]
    ld   bc, label_2C7
    add  hl, hl
    inc  bc
    inc  hl
    add  a, d
    inc  b

label_2C976::
    dec  c
    ld   b, $24
    rlca
    ld   a, [hli]
    ld   [label_9C7], sp
    add  hl, hl
    inc  bc
    inc  hl
    db   $10 ; Undefined instruction
    ld   de, label_1225
    ld   hl, label_2913
    jr   nz, label_2C9AC
    ld   hl, $8229
    jr   nc, label_2C96C

label_2C990::
    ld   b, b
    dec  hl
    jp   label_1116
    add  a, [hl]
    ld   b, c
    ld   e, $82

label_2C999::
    inc  d
    dec  c
    add  a, h

label_2C99C::
    ldi  [hl], a
    dec  c
    add  a, h
    ldd  [hl], a
    dec  c
    ld   d, $2A
    add  a, e
    rla

label_2C9A5::
    ld   hl, label_6E1
    inc  d
    nop
    nop
    cp   $04
    ld   a, l
    inc  [hl]
    cp   [hl]
    pop  hl
    ld   b, $2B
    jr   label_2C9C5
    cp   $04
    dec  c
    ld   [hl], a
    push af
    add  a, d
    ld   de, $820F
    ld   hl, $820F
    ld   sp, $820F
    rla

label_2C9C5::
    rrca
    daa

label_2C9C7::
    rrca
    add  a, d
    scf
    rrca
    inc  sp
    and  a
    ld   [hl], $A7
    ld   d, e
    xor  h
    ld   d, [hl]
    xor  h
    jr   z, label_2C976
    cp   $04
    dec  c
    ld   b, $F0
    add  hl, hl
    rst  $30
    add  a, d
    nop
    inc  bc
    ld   [bc], a
    inc  hl
    inc  bc
    dec  c
    inc  b
    ld   a, [hli]
    db   $10 ; Undefined instruction
    ld   de, label_1221
    add  hl, hl
    jr   label_2C999
    ld   hl, label_29AC
    ld   a, [hli]
    add  hl, sp
    db   $DB
    ld   c, c

label_2C9F4::
    inc  l
    ldi  [hl], a
    call nc, label_31C2
    call nc, label_2C8C2
    call nc, label_2E782
    call nc, label_4FE
    sbc  a, l
    jr   nz, label_2C9FB
    ld   [hl], l
    push af
    ret  z
    nop
    inc  hl
    jr   nz, label_2CA35
    ld   b, b

label_2CA0D::
    dec  hl
    adc  a, b
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], d
    inc  l
    ld   [hl], l
    dec  hl
    ld   [hl], a
    inc  l
    add  a, d
    ld   bc, $871C
    inc  bc
    inc  e
    adc  a, c
    ld   de, $C61F
    jr   label_2CA3F
    add  a, $19
    inc  e
    add  a, e
    ld   hl, $8413
    inc  h
    inc  de
    call nz, label_1137
    add  a, a
    jr   nc, label_2CA0D
    ld   b, d
    rla
    add  a, d

label_2CA35::
    ld   b, e
    ld   [de], a
    ld   b, l
    ld   d, $C2
    ld   d, d
    ld   de, label_2D5C2
    db   $10 ; Undefined instruction
    ld   d, e
    ld   e, $82
    ld   h, e
    inc  e
    call nz, label_DC46
    daa
    sub  a, l
    pop  hl
    ld   b, $18
    nop
    nop
    cp   $04
    ld   l, l
    add  hl, hl
    rst  $30
    ld   [hl], d
    push af
    adc  a, c
    nop
    inc  e
    add  a, $10
    inc  e
    add  a, $11
    inc  e

label_2CA5F::
    add  a, a
    ld   [de], a
    rra
    push bc
    ldi  [hl], a
    db   $10 ; Undefined instruction
    inc  hl
    ld   [de], a
    inc  [hl]
    inc  de
    jr   c, label_2CA7F
    ld   b, h
    ld   de, label_2C584
    ld   e, $54
    ld   e, $84
    ld   d, l
    inc  e
    add  a, l
    ld   h, h
    inc  e
    ld   [hl], d
    dec  hl
    ld   [hl], e
    dec  c
    ld   [hl], h
    inc  l

label_2CA7F::
    pop  hl
    ld   b, $19
    nop
    nop
    cp   $04
    dec  c
    rlca
    ld   a, [$FF20]
    ld   a, [$FF00+C]
    ld   h, $82
    inc  b
    rrca
    ld   b, $25
    inc  de
    inc  h
    add  a, d
    inc  d
    rrca
    ld   d, $23
    inc  hl
    ld   a, [hli]
    add  a, d
    inc  h
    ld   hl, label_2926
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    cp   $04
    dec  e
    ld   bc, label_2C9F4
    di
    ld   bc, label_20D
    ld   a, [hli]
    add  a, d
    inc  bc
    ld   hl, label_2905
    jp   label_DC06
    jp   label_2407
    ld   [label_912], sp
    ld   d, $11
    and  a
    jp   nz, label_1019
    scf
    ld   a, [hli]
    jr   c, label_2CA5F
    add  hl, sp
    ld   h, $FE
    inc  b
    dec  c
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld   b, b
    ld   a, [$FF00+C]
    add  hl, hl
    inc  bc
    dec  c
    inc  b
    ld   a, [hli]
    ld   b, $C7
    jr   label_2CA98
    ld   [label_2C9C7], sp
    jp   z, label_DB16
    add  a, e
    ld   h, $DB
    pop  hl
    ld   b, $1D
    ld   a, b
    db   $10 ; Undefined instruction
    inc  b
    sbc  a, l
    ld   [bc], a
    db   $F4 ; Undefined instruction
    jr   nz, label_2CAE5
    ld   [hl], c
    push af
    nop
    ld   a, [hli]
    ld   bc, label_2C7
    add  hl, hl
    jp   nz, label_2303
    jp   label_2406
    rlca
    ld   a, [hli]
    ld   [label_9C7], sp
    add  hl, hl
    db   $10 ; Undefined instruction
    jr   label_2CAAD
    add  hl, de
    ld   d, $83
    jr   nz, label_2CB2D
    ld   hl, label_2398
    add  hl, hl
    add  a, $29
    db   $10 ; Undefined instruction
    call c, label_2240
    ld   b, c
    dec  hl
    jp   label_350
    jp   label_2351
    dec  [hl]
    inc  l
    ld   [hl], $28
    jp   label_2445
    add  a, h
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], c
    daa
    ld   [hl], d
    push af

label_2CB2D::
    ld   h, h
    inc  l
    ld   h, l
    jr   z, label_2CBA6
    jr   z, label_2CBAD
    inc  l
    ld   b, d
    dec  e
    pop  hl
    ld   b, $14
    nop
    nop
    cp   $04
    dec  c
    ld   [hl], h
    pop  af
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, d
    ld   d, h
    rrca
    add  a, d
    ld   h, h
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_2C482
    sub  a, a
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de
    ret  nz
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   de, label_18AC
    xor  h
    ld   h, b
    daa
    add  a, d
    ld   h, c
    ldi  [hl], a
    ld   h, e
    dec  hl
    ld   h, [hl]
    inc  l
    add  a, d
    ld   h, a
    ldi  [hl], a
    ld   l, c
    jr   z, label_2CB06
    ld   [hl], a
    inc  bc
    add  a, d
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], d
    dec  hl
    ld   [hl], e
    daa
    db   $76 ; Halt
    jr   z, label_2CB6F
    nop
    ld   c, $58
    ldd  [hl], a
    cp   $04
    ld   e, l
    jr   nz, label_2CB8E
    ld   e, c
    rst  $30
    ld   [hl], l
    push af
    nop
    xor  h
    ld   bc, label_225
    ld    hl, sp+$04
    ld   h, $09
    ld   a, [hli]

label_2CBA6::
    db   $10 ; Undefined instruction
    ld   de, $C323
    inc  d
    inc  h

label_2CBAD::
    jr   nz, label_2CBD0
    ld   hl, label_3029
    db   $DB
    inc  [hl]
    ld   a, [hli]
    add  a, l
    dec  [hl]
    ld   hl, label_2B40
    jp   nz, label_D59
    ld   [hl], l
    dec  hl
    db   $76 ; Halt
    dec  c
    ld   [hl], a
    inc  l
    ld   [hl], b
    inc  hl
    ld   [hl], c
    dec  c
    ld   [hl], d
    inc  l
    db   $76 ; Halt
    call c, label_4FE
    ld   c, l
    inc  b
    ld   a, [$FF50]
    or   $29
    rst  $30
    ld   [hl], d
    push af
    ld   [bc], a
    add  hl, hl
    inc  bc
    dec  h
    jp   label_2313

label_2CBDD::
    add  a, e
    jr   nc, label_2CC01
    inc  sp
    add  hl, hl
    jp   nz, label_D50
    ld   [hl], d
    dec  hl
    ld   [hl], e
    dec  c
    ld   [hl], h
    inc  l
    add  a, d
    inc  [hl]
    and  [hl]
    ld   [hl], $A7
    jp   label_A717
    ld   bc, $E2A8
    ld   b, $F8
    ld   c, b
    ld   d, b
    cp   $04
    dec  c
    cp   $06
    dec  c
    ld   [hl], h

label_2CC01::
    pop  af
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, d
    ld   d, h
    rrca
    add  a, d
    ld   h, h
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_2C482
    sub  a, a
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de

label_2CC2A::
    ret  nz
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    ld   [rJOYP], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   b, $93
    db   $76 ; Halt
    push af
    dec  b
    dec  h
    add  a, d
    ld   b, $21
    ld   [$C726], sp
    dec  d
    inc  hl
    rst  0
    ld   d, $0D
    rst  0
    rla
    dec  c
    rst  0
    jr   label_2CC7A
    rla
    set  4, d
    rlca
    ld   h, [hl]
    jr   label_2CBDD
    cp   $06
    dec  c
    ld   [hl], c
    push af
    add  a, [hl]
    ldi  [hl], a
    xor  a
    add  a, [hl]
    ldd  [hl], a
    ld   bc, label_2C286
    ld   bc, label_2D286
    ld   bc, label_2E385
    or   b
    inc  hl
    xor  [hl]
    ld   h, $AE
    inc  sp
    dec  c
    ld   [hl], $0D
    ld   b, e

label_2CC7A::
    xor  a
    ld   b, [hl]
    xor  a
    ld   l, b
    xor  [hl]
    inc  sp
    xor  h
    ld   [hl], $AC
    ld   d, d
    dec  c
    ld   b, d
    or   b
    jr   z, label_2CC2A
    cp   $06
    dec  c
    inc  b
    ld   a, [$FF74]
    pop  af
    ld   [de], a
    ld   b, $17
    ld   b, $86
    ldi  [hl], a
    ld   b, $86
    ldd  [hl], a
    ld   b, $86
    ld   b, d
    ld   b, $86
    ld   d, d
    ld   b, $C5
    ld   de, $FE06
    ld   b, $3D
    ld   b, $F4
    ld   [hl], c
    push af
    ld   [bc], a
    ld   h, $03
    ld   [de], a
    inc  b
    dec  h
    rst  0
    ld   de, $C206
    ld   [de], a
    inc  h
    inc  de
    and  b
    rst  0
    inc  d
    inc  hl
    ldd  [hl], a
    ld   a, [hli]
    inc  sp
    ld   hl, label_2934
    add  a, e
    ld   b, d
    ld   b, $52
    inc  l
    ld   d, e
    ldi  [hl], a
    ld   d, h
    dec  hl
    jp   nz, label_2462
    jp   nz, label_2364
    ld   [hl], h
    daa
    add  a, h
    ld   [hl], l
    ldi  [hl], a
    ld   a, c
    jr   z, label_2CC9A
    ld   h, c
    dec  c
    dec  b
    add  hl, hl
    add  a, d
    ld   b, $0D
    ld   [$FE2A], sp
    inc  b
    dec  c
    add  a, l
    ld   [hl], c
    dec  c
    nop
    ret  nz
    ld   bc, label_825
    ld   h, $09
    ret  nz
    db   $10 ; Undefined instruction
    ld   de, $8629
    ld   [de], a
    rrca
    jr   label_2CD22
    add  hl, de
    ld   hl, label_2920
    add  a, h
    ld   hl, label_250F
    dec  h
    ld   h, $C7
    daa
    sbc  a, b
    jr   z, label_2CCCE
    add  hl, hl
    ld   h, $30
    dec  h
    add  a, h
    ld   sp, label_3521
    add  hl, hl
    ld   b, l
    and  [hl]

label_2CD12::
    ld   d, h
    and  [hl]
    ld   c, c

label_2CD15::
    ld   a, [hli]
    ld   d, b
    add  hl, hl
    add  a, e
    ld   b, [hl]
    call c, label_2555
    ld   d, [hl]
    rst  0
    ld   d, a
    sbc  a, b
    ld   e, b

label_2CD22::
    rst  0
    ld   e, c
    ld   h, $60
    dec  h
    add  a, d
    ld   h, c
    ld   hl, label_2663
    ld   h, l
    inc  hl
    ld   [hl], b
    inc  hl
    ld   [hl], e
    inc  h
    ld   [hl], l
    daa
    db   $76 ; Halt
    push af

label_2CD36::
    inc  de
    and  b
    ld   b, d
    cp   [hl]
    ld  [$FF00+C], a
    rlca
    ld   h, l
    adc  a, b
    db   $10 ; Undefined instruction
    ld   b, $06
    ld   bc, label_2D9F0
    di
    adc  a, b
    ld   de, $C40D
    ld   hl, $C40D
    jr   z, label_2CD5C
    adc  a, b
    ld   h, c
    dec  c
    ld   d, $06
    ld   h, e
    ld   b, $FE
    ld   b, $2D
    ld   d, b
    xor  $C2

label_2CD5C::
    nop
    inc  h
    ld   bc, $8317
    ld   [bc], a
    ld   [de], a
    dec  b
    ld   d, $06
    dec  h
    ld   de, label_1511
    db   $10 ; Undefined instruction
    inc  hl
    jr   nz, label_2CD99
    add  a, l
    ld   hl, label_2221
    sbc  a, b
    ld   h, $29
    daa
    dec  h
    jr   z, label_2CD12
    add  hl, hl
    ld   h, $30
    ret  nz
    add  a, [hl]
    ld   sp, $C30F
    scf
    inc  hl
    jp   label_2439
    ld   b, b
    dec  h
    ld   b, c
    sbc  a, b
    ld   b, d
    ld   hl, label_2643
    ld   b, h
    inc  l
    ld   b, l
    ldi  [hl], a
    ld   b, [hl]
    dec  hl
    ld   c, c
    di
    jp   nz, label_2453
    jp   label_2454
    jp   label_355
    jp   nz, label_2356
    ld   h, a
    daa
    ld   l, b
    ldi  [hl], a
    ld   l, c
    jr   z, label_2CE1D
    jr   z, label_2CE22
    daa
    ld   a, c
    dec  hl
    inc  d
    set  4, d
    rlca
    ld   h, b
    jr   label_2CD36
    cp   $06
    dec  l
    ld   b, b
    ld   a, [$FF00+C]
    rst  $30
    ld   [hl], c
    push af
    nop
    ld   hl, label_2902
    inc  bc
    dec  h
    ld   b, $26
    rlca
    rla
    ld   [label_912], sp
    ld   d, $83
    db   $10 ; Undefined instruction
    inc  de
    inc  hl
    jp   nz, label_2416
    add  hl, de
    db   $10 ; Undefined instruction
    dec  h
    add  a, d
    ld   hl, label_2321
    add  hl, hl
    add  hl, hl
    inc  d
    ld   [hl], $2A
    add  a, e
    scf
    ld   hl, label_2E882
    ld   b, $70
    inc  hl
    ld   [hl], c
    dec  c
    ld   [hl], d
    inc  l
    ld   [hl], e
    dec  hl
    ld   [hl], h
    ld   b, $75
    inc  l
    ld   [hl], a
    dec  hl
    ld   a, b
    ld   b, $79
    inc  l
    add  a, [hl]
    ld   h, d
    jr   nz, label_2CE62
    dec  c
    jr   label_2CDA1
    dec  b
    xor  b
    ld   [rJOYP], a
    nop
    ld   c, b
    ld   d, b
    cp   $06
    ld   b, $39
    rst  $28
    inc  b
    ld    hl, sp+$C3
    inc  d
    ld   de, label_15C3
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   hl, label_2212
    xor  h
    daa
    xor  h

label_2CE1D::
    jr   z, label_2CE31
    jp   nz, label_D40

label_2CE22::
    jp   label_1032

label_2CE25::
    jp   label_1137
    ld   b, h
    dec  d
    ld   b, l
    inc  d
    ld   e, c
    ld   a, [hli]
    ld   h, b
    ld   b, $62

label_2CE31::
    sub  a, h
    add  a, h
    ld   h, e
    ld   [de], a
    ld   h, a
    sub  a, e
    ld   l, c
    ld   b, $70
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    call nz, label_D31
    call nz, label_D38
    dec  [hl]
    set  4, d
    rlca
    ld   h, d
    jr   label_2CDCA
    cp   $06
    dec  e
    ld   bc, label_30F4
    xor  $39
    rst  $28
    jp   label_601
    jp   nz, label_2402
    jp   nz, label_2304
    inc  b
    dec  h
    add  a, h
    dec  b
    ld   hl, label_2609
    ldi  [hl], a
    ld   a, [hli]
    inc  hl
    sbc  a, b
    inc  h
    add  hl, hl
    add  hl, sp
    dec  c
    ld   c, c
    inc  l
    ld   d, b
    add  hl, hl
    ld   [hl], b
    ldi  [hl], a
    push bc
    ld   bc, $C20D
    dec  d
    dec  c
    add  a, d

label_2CE78::
    daa
    dec  c
    add  a, [hl]
    inc  sp
    dec  c
    add  a, d
    ld   b, e
    dec  c
    ld   d, c
    ld   b, $53
    dec  c
    jp   label_632
    ld   d, $06
    jp   nz, label_626
    add  a, h
    ld   b, l
    ld   b, $85
    ld   d, h
    ld   b, $89
    ld   h, b
    ld   b, $08
    ld   h, $09
    ret  nz
    jr   label_2CEBF
    add  hl, de
    inc  de
    jr   z, label_2CEC9
    add  hl, hl
    ld   hl, label_6FE
    dec  l
    dec  b
    and  e
    db   $10 ; Undefined instruction
    add  hl, de
    rst  $30
    nop
    ld   a, [hli]
    add  hl, bc
    add  hl, hl
    add  a, a
    db   $10 ; Undefined instruction
    rla
    sub  a, l
    add  hl, de
    dec  c
    add  a, [hl]
    jr   nz, label_2CED9
    ld   h, $26
    jp   nz, label_1127
    add  hl, hl
    inc  l

label_2CEBF::
    jr   nc, label_2CECE
    jp   nz, label_2436
    ld   b, a
    dec  d
    add  hl, sp
    inc  h
    ld   b, b

label_2CEC9::
    dec  hl
    ld   d, [hl]
    ld   a, [hli]
    add  a, d
    ld   d, a

label_2CECE::
    ld   hl, label_2A49
    ld   e, c
    ld   hl, label_1348
    jr   z, label_2CE78
    ld   [rJOYP], a

label_2CED9::
    ld   [bc], a
    jr   c, label_2CF2C
    cp   $06
    ld   c, l
    db   $10 ; Undefined instruction
    ld   [hl], h
    pop  af
    add  a, a
    ld   [de], a
    rst  $18
    add  a, a
    ldi  [hl], a
    rst  $18
    add  a, a
    ldd  [hl], a
    rst  $18
    add  a, a
    ld   b, d
    rst  $18
    add  a, d
    ld   d, a
    rst  $18
    add  a, e
    ld   h, c
    rst  $18
    add  a, e
    ld   h, [hl]
    rst  $18
    nop
    ret  nz
    ld   bc, label_1025
    dec  c
    call nz, label_2311
    jr   nz, label_2CF2E
    jr   nc, label_2CF28
    ld   b, b
    add  hl, hl
    ld   d, b
    ld   hl, label_2951
    add  a, l
    ld   d, d
    and  [hl]
    cp   $04
    dec  c
    nop
    inc  hl
    add  a, d
    ld   bc, label_30D
    ld   a, [hli]
    dec  b
    rst  0
    ld   b, $F0
    ld   [$E1C7], sp
    rlca
    ld   e, l
    ld   d, b
    ld   d, b
    cp   $06
    dec  c
    add  hl, de
    rst  $30

label_2CF28::
    ld   [hl], b
    push af
    nop
    rla

label_2CF2C::
    add  a, e
    ld   bc, label_412
    ld   a, [hli]
    add  a, h
    dec  b
    ld   hl, label_2909
    rst  0
    db   $10 ; Undefined instruction
    rst  0
    ld   de, label_1210
    dec  h
    inc  de
    sbc  a, b
    add  a, l
    inc  d
    ld   hl, label_2619
    push bc
    ldi  [hl], a
    inc  hl
    inc  h
    and  [hl]
    daa
    and  [hl]
    ld   [hl], $A0
    ld   b, e
    xor  a
    add  a, d
    ld   b, l
    and  a
    ld   c, b
    xor  a
    ld   d, e
    or   b
    ld   e, b
    ld   bc, $B068
    ld   [hl], d
    daa
    add  hl, de
    ld   hl, label_D29
    add  hl, sp
    inc  l
    cp   $06
    dec  c
    add  hl, sp
    ld   c, d
    ld   bc, label_10F4
    or   $71
    push af
    ld   [hl], b
    inc  hl
    ld   [hl], c
    dec  c
    ld   [hl], d
    inc  l
    nop
    inc  hl
    ld   bc, label_20D
    ld   a, [hli]
    inc  bc
    add  hl, hl
    inc  b
    ld   b, $05
    ld   a, [hli]
    rlca
    add  hl, hl
    ret  z
    ld   [label_906], sp
    inc  h
    ld   [de], a
    db   $10 ; Undefined instruction
    inc  de
    ld   b, $14
    ret  nz
    ld   d, $11
    ldi  [hl], a
    sub  a, h
    inc  hl
    ld   d, $24
    ld   b, $25
    rla
    ld   h, $93
    call nz, label_F34
    add  a, l
    ld   b, d
    and  [hl]

label_2CFA0::
    ld   b, h
    rrca
    ld   [hl], a
    dec  hl
    ld   a, c
    inc  h

label_2CFA6::
    db   $10 ; Undefined instruction
    jr   nz, label_2CFB7
    jr   nc, label_2CFD7
    ldd  [hl], a
    rrca
    cp   $06
    dec  c
    jr   nc, label_2CFF4
    add  hl, sp
    di
    ld   [hl], h
    ld   b, b

label_2CFB7::
    ld   b, $26
    add  a, e
    rlca
    and  [hl]
    dec  h
    xor  e
    ld   d, $24
    jr   label_2CFA0
    add  hl, de
    dec  c
    inc  hl
    xor  [hl]
    ld   h, $2A
    daa
    sbc  a, b
    jr   z, label_2CFED
    add  hl, hl
    ld   h, $33
    and  [hl]
    ld   b, l
    xor  [hl]
    ld   b, a
    and  [hl]
    ld   d, d

label_2CFD5::
    xor  [hl]
    ld   e, b

label_2CFD7::
    xor  [hl]
    ld   h, c
    xor  e
    ld   h, l
    and  [hl]
    ld   h, a
    xor  [hl]
    cp   $06
    rlca
    jr   nc, label_2CFD5
    ld   e, c
    rst  $30
    ld   [hl], c
    ld   b, b
    adc  a, d
    nop
    dec  c
    adc  a, d
    db   $10 ; Undefined instruction

label_2CFED::
    nop
    and  [hl]
    adc  a, b
    ld   bc, $8212
    inc  b

label_2CFF4::
    and  [hl]
    jp   nz, label_A609
    ld   [de], a
    xor  e
    rla
    xor  e
    jr   nz, label_2D023
    adc  a, b
    ld   hl, label_2221
    sbc  a, b
    daa
    sbc  a, b
    add  hl, hl
    ld   h, $42
    inc  l
    add  a, e
    ld   b, e
    ldi  [hl], a
    ld   b, [hl]
    dec  hl
    ld   e, c
    ld   a, [hli]
    jp   nz, label_2452
    add  a, e
    ld   d, e
    dec  c
    ld   d, h
    sbc  a, $C2
    ld   d, [hl]
    inc  hl
    add  a, e
    ld   h, e
    and  [hl]
    ld   l, c
    dec  c
    ld   [hl], d
    jr   z, label_2CFA6

label_2D023::
    ld   [hl], e
    and  [hl]
    db   $76 ; Halt
    daa
    ld   a, c

label_2D028::
    ldi  [hl], a
    ld   h, h
    cp   [hl]
    ld  [$FF00+C], a
    rlca
    ld   h, h
    jr   label_2D040
    cp   $06
    rlca
    ld   d, b
    or   $49
    ld   b, d
    inc  d
    xor  a
    call nz, label_124
    ldd  [hl], a
    xor  e
    call nz, label_A633
    dec  [hl]
    xor  [hl]
    scf
    xor  e
    ld   d, b
    add  hl, hl
    ld   h, b
    dec  c
    ld   h, c

label_2D04A::
    sbc  a, $64
    or   b
    ld   h, l
    xor  [hl]
    ld   [hl], b
    ldi  [hl], a
    cp   $06
    rrca
    inc  b
    ld   a, [$FF40]
    ld   c, c

label_2D058::
    ld   [hl], h
    ei
    jp   label_D13
    jp   nz, label_A922
    jp   nz, label_A931
    add  a, e
    inc  sp
    dec  c
    inc  [hl]
    xor  c
    add  a, e
    ld   [hl], $A9
    ld   b, d
    dec  c
    add  a, e
    ld   b, e
    xor  c
    add  a, d
    ld   b, [hl]
    dec  c
    ld   c, b
    xor  c
    add  a, d
    ld   d, d
    dec  c

label_2D078::
    ld   h, e
    dec  c
    jp   nz, label_D38
    ld   b, a
    xor  c
    ld   b, c
    dec  c
    cp   $04
    dec  c
    nop
    db   $F4 ; Undefined instruction
    ld   [hl], h
    push af
    nop
    ld   de, $9401
    add  a, e
    ld   [bc], a
    ld   [de], a
    dec  b
    ld   d, $06
    dec  h
    db   $10 ; Undefined instruction
    ld   d, $23
    jr   nz, label_2D0BE
    add  a, l
    ld   hl, label_2621
    add  hl, hl
    adc  a, b
    ld   b, c
    inc  de
    add  a, d
    ld   b, h
    dec  c
    jp   nz, label_1053
    jp   nz, label_1156
    ld   h, c
    xor  e
    ld   l, b
    xor  e
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  l
    jr   z, label_2D058
    cp   $06
    dec  c
    ld   bc, label_29F4
    rst  $30

label_2D0BE::
    nop
    inc  hl
    ld   bc, label_20D
    ld   a, [hli]
    rlca
    add  hl, hl
    ld   [label_906], sp
    ld   a, [hli]
    add  a, e
    rla
    ld   b, $27
    ld   b, $82
    jr   z, label_2D0D8
    add  hl, sp
    dec  c
    ld   c, c
    inc  l
    add  a, $15

label_2D0D8::
    and  a
    add  a, $16
    ld   b, $FE
    ld   b, $2D
    inc  b
    ld   b, a
    db   $10 ; Undefined instruction
    add  hl, hl
    rst  $30
    ld   [hl], a
    ld   b, b
    nop
    ld   hl, label_D30
    jp   label_D29
    add  hl, bc
    ld   h, $19
    ld   a, [hli]
    ld   b, b
    dec  hl
    jp   nz, label_610
    ld   [de], a
    xor  h
    add  a, h
    inc  de
    ld   b, $17
    xor  h
    add  a, d
    ld   b, c
    and  [hl]
    add  a, [hl]
    ld   d, h
    and  [hl]
    ld   d, e
    and  a

label_2D106::
    ld   h, c
    cp   [hl]

label_2D108::
    ld  [$FF00+C], a

label_2D109::
    rlca
    ld   l, d
    jr   label_2D11D
    cp   $06
    dec  a
    ld   bc, label_2047
    or   $29
    rst  $30
    ld   [hl], c
    push af
    add  a, $20
    dec  c
    add  a, $29

label_2D11D::
    dec  c
    db   $10 ; Undefined instruction

label_2D120::
    adc  a, b
    ld   de, label_1906
    ld   a, [hli]
    ld   h, $DE
    ldd  [hl], a
    inc  l
    add  a, d
    inc  sp
    ldi  [hl], a
    dec  [hl]
    dec  hl
    scf
    inc  l
    add  a, d
    jr   c, label_2D155
    ld   b, d
    inc  h
    add  a, d
    ld   b, e
    inc  bc
    ld   b, l
    inc  hl
    ld   b, a
    ld   a, [hli]
    add  a, d
    ld   c, b
    ld   hl, label_2D082
    and  [hl]
    ld   d, d
    ld   a, [hli]
    add  a, d
    ld   d, e
    ld   hl, label_2955

label_2D149::
    jp   label_A657
    ld   h, d
    and  a
    jp   nz, label_A665
    ld   l, c
    inc  l
    ld   [hl], b
    dec  hl

label_2D155::
    ld   [hl], e
    and  [hl]

label_2D157::
    ld   a, c
    inc  h

label_2D159::
    add  a, d
    ld   [hl], c
    dec  c
    cp   $06
    ld   c, l
    jr   nc, label_2D157
    add  hl, sp
    rst  $28
    ld   [hl], c
    push af
    nop
    dec  h

label_2D167::
    db   $10 ; Undefined instruction
    jr   nz, label_2D178
    jr   nc, label_2D198
    ld   b, b
    add  hl, hl
    add  a, h
    ld   b, c
    and  [hl]
    ld   d, h
    and  [hl]
    add  a, h
    ld   h, b
    ldi  [hl], a
    ld   h, d

label_2D178::
    sbc  a, b
    ld   h, h
    dec  hl
    ld   [hl], b
    and  [hl]
    add  a, e
    ld   [hl], c
    dec  c
    ld   [hl], h
    daa
    adc  a, b

label_2D183::
    ld   de, $C306
    ld   h, $06
    cp   $06
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    ld   a, [$EE30]
    call nz, label_2023
    call nz, label_2026
    dec  [hl]

label_2D198::
    jr   nz, label_2D1DE
    jr   nz, label_2D1E1
    set  4, d
    rlca
    ld   h, a
    adc  a, b
    add  a, b
    cp   $04
    dec  c
    ld   [hl], c
    push af
    ld   [bc], a
    rst  0
    rlca
    rst  0
    jp   nz, label_300
    ld   bc, label_825

label_2D1B1::
    ld   h, $C2
    add  hl, bc
    inc  bc
    ld   de, label_1823
    inc  h
    jr   nz, label_2D1E0
    ld   hl, label_2829
    ld   a, [hli]
    add  hl, hl
    ld   h, $82
    inc  d
    xor  [hl]
    ld   sp, label_38AF
    xor  a
    ld   b, c

label_2D1C9::
    or   b
    ld   c, b
    or   b
    add  a, d
    ld   d, h
    xor  a
    add  a, d
    ld   h, h
    or   b
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    add  hl, sp
    rst  $30
    ld   [hl], c
    push af
    inc  bc
    add  hl, hl
    add  a, d

label_2D1DE::
    inc  b

label_2D1DF::
    dec  c

label_2D1E0::
    ld   b, $2A

label_2D1E2::
    add  a, d
    ld   de, label_17AF
    and  a
    call nz, label_121
    ldi  [hl], a
    ld   bc, label_2384
    and  [hl]
    ldd  [hl], a
    or   b
    add  a, e
    inc  sp
    xor  [hl]
    ld   b, d
    xor  h
    add  a, h
    ld   b, e
    and  [hl]
    ld   d, a
    and  a
    ld   h, c
    or   b
    ld   h, e
    inc  l
    add  a, l
    ld   h, h
    ldi  [hl], a
    ld   l, c
    jr   z, label_2D275
    inc  hl
    add  a, d

label_2D207::
    ld   [hl], c
    dec  c
    ld   [hl], e
    inc  h
    add  a, [hl]
    ld   [hl], h

label_2D20D::
    inc  bc
    jr   z, label_2D1B1
    cp   $06
    dec  c
    jr   nc, label_2D207
    ld   [hl], h
    push af
    ldi  [hl], a
    rrca
    call nz, label_F24
    call nz, label_F25
    daa
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, h
    ld   b, e
    rrca
    ld   d, d
    rrca

label_2D229::
    ld   d, a
    rrca
    cp   $06
    dec  l
    rlca
    ccf
    ld   c, c
    rst  $30
    ld   [hl], h
    push af
    jp   label_A716
    jr   label_2D1DF
    add  a, d
    jr   z, label_2D1E2
    adc  a, c
    ld   b, c
    and  [hl]
    add  a, d
    ld   b, a
    and  a
    adc  a, c
    ld   d, c
    ld   b, $82
    ld   h, c
    ld   b, $70
    inc  hl
    ld   [hl], c
    ld   b, $72
    inc  l
    ld   [hl], e
    dec  hl

label_2D250::
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt

label_2D254::
    inc  l
    inc  hl
    and  b
    cp   $06
    sub  a, [hl]
    inc  bc
    db   $F4 ; Undefined instruction
    jr   nz, label_2D254
    add  hl, hl
    rst  $30
    ld   [hl], e
    push af
    nop
    add  hl, hl
    add  a, d
    ld   bc, $820D

label_2D268::
    inc  bc
    dec  c
    inc  bc
    and  [hl]
    dec  b
    and  [hl]
    ld   b, $0D
    rlca
    and  [hl]
    jp   nz, label_D08

label_2D275::
    add  hl, bc
    ld   a, [hli]
    add  a, d
    db   $10 ; Undefined instruction
    inc  d
    and  a
    ld   d, $A7
    add  hl, de
    and  [hl]
    add  a, d
    jr   nz, label_2D229
    jr   z, label_2D22C
    add  hl, hl

label_2D286::
    dec  c

label_2D287::
    jr   nc, label_2D296
    add  hl, sp
    and  [hl]
    add  a, d
    ld   b, b
    and  [hl]
    ld   c, c
    dec  c
    ld   d, [hl]
    inc  l
    ld   d, a
    sbc  a, b
    add  a, d
    ld   e, b

label_2D296::
    ldi  [hl], a
    add  a, l
    ld   h, b
    dec  c
    ld   h, [hl]
    inc  h
    ld   l, b
    rrca
    jp   nz, label_C069
    add  a, [hl]
    ld   [hl], b
    ldi  [hl], a
    db   $76 ; Halt
    jr   z, label_2D229
    ld   [hl], a
    rrca
    ld   d, c
    dec  c
    ld   d, e
    dec  c
    ld   h, a
    set  4, d
    rlca
    ld   h, c
    adc  a, b
    add  a, b
    cp   $06
    ld   a, l
    ld   bc, label_2C9F4
    ld   c, d
    ld   h, b
    or   $73
    push af
    nop
    ld   h, $83
    ld   bc, label_40D
    dec  h
    db   $10 ; Undefined instruction
    ld   de, label_1298
    ld   h, $14
    inc  hl
    ldi  [hl], a
    ld   a, [hli]
    inc  hl
    ld   hl, label_2924
    add  a, d
    jr   nc, label_2D27D
    add  a, [hl]
    ld   d, b
    ldi  [hl], a
    ld   d, [hl]
    sbc  a, b
    ld   d, a
    dec  hl
    add  a, d
    ld   h, b
    ret  nz
    add  a, l
    ld   h, d
    rrca
    ld   h, h
    and  [hl]
    ld   h, a
    inc  hl
    add  a, d
    ld   [hl], b
    ret  nz
    ld   [hl], d
    rrca
    add  a, d
    ld   [hl], e
    and  [hl]
    add  a, d
    ld   [hl], l
    rrca
    ld   [hl], a
    daa
    ld   a, b
    ldi  [hl], a
    ld   a, c
    jr   z, label_2D312
    set  4, d
    rlca
    ld   h, e
    adc  a, b
    add  a, b
    cp   $06
    dec  c
    ld   b, b
    ld   b, c
    ld   [hl], h
    ld   b, b
    ld   [$C826], sp
    add  hl, bc
    inc  bc
    add  a, $18
    inc  h
    ld   a, b
    jr   z, label_2D334

label_2D312::
    inc  l
    add  a, e
    inc  hl
    ldi  [hl], a
    ld   h, $2B
    jp   nz, label_2432
    add  a, e
    inc  sp
    rrca
    jp   nz, label_2336
    add  a, e
    ld   b, e
    rrca
    ld   d, d
    ld   a, [hli]
    add  a, e
    ld   d, e
    ld   hl, label_2956
    ld   d, h
    sbc  a, b
    cp   $04
    dec  c
    ld   [hl], a
    pop  af
    inc  bc
    rst  0

label_2D334::
    ld   b, $C7
    add  a, l
    inc  de
    xor  a

label_2D339::
    inc  de
    and  [hl]
    add  a, d
    inc  hl
    or   b
    add  a, e
    dec  h
    ld   bc, $AF31
    add  a, e
    dec  [hl]
    ld   bc, label_2C1C2
    ld   bc, $AF42
    add  a, e
    ld   b, l
    or   b
    ld   d, d
    ld   bc, $AF53
    add  a, d
    ld   h, l
    xor  [hl]
    inc  hl
    dec  c
    add  a, d
    ld   d, c
    or   b
    ld   d, e
    xor  [hl]
    ld   c, b
    adc  a, [hl]
    ld   de, $E2BE
    rlca
    ld   l, c
    adc  a, b
    db   $10 ; Undefined instruction
    inc  b
    dec  c
    ld   bc, label_39F0
    di
    ld   [hl], c
    pop  af
    jr   nz, label_2D339
    add  hl, hl
    jp   z, label_C950
    ld   e, c
    jp   z, label_4FE
    dec  c
    ld   bc, label_30F4
    or   $00
    inc  hl
    add  a, d
    ld   bc, label_30D

label_2D383::
    ld   a, [hli]

label_2D384::
    inc  de
    xor  a

label_2D386::
    dec  d
    xor  [hl]
    rla
    xor  [hl]
    jp   label_123
    ld   h, $A0
    dec  [hl]
    xor  [hl]
    scf
    xor  [hl]
    add  a, d
    ld   d, c
    xor  [hl]
    ld   d, e
    or   b
    ld   d, [hl]
    xor  [hl]

label_2D39A::
    ld   h, h
    xor  [hl]
    ld   l, b

label_2D39D::
    xor  [hl]
    cp   $06
    dec  c
    inc  b
    ld   a, [$FF39]
    rst  $30
    add  hl, bc
    ld   hl, label_1882
    ld   b, $24
    and  [hl]
    add  hl, hl
    inc  l
    ld   b, [hl]
    and  [hl]
    ld   b, d
    and  [hl]
    add  a, d

label_2D3B3::
    ld   b, e
    ld   b, $53
    ld   b, $88
    ld   h, c
    ld   b, $FE
    ld   b, $0D
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_2D3B3
    add  hl, sp

label_2D3C2::
    di
    ld   [hl], h
    push af
    nop
    add  hl, hl
    ld   bc, label_206
    ld   a, [hli]
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    adc  a, c
    db   $10 ; Undefined instruction
    add  a, d

label_2D3D6::
    inc  d
    dec  c
    jr   nz, label_2D405
    inc  hl
    ld   b, $26
    ld   b, $84

label_2D3DF::
    inc  sp
    ld   b, $73
    dec  hl
    add  a, d
    ld   [hl], h

label_2D3E5::
    dec  c
    db   $76 ; Halt
    inc  l
    cp   $06
    dec  c
    rlca
    db   $F4 ; Undefined instruction
    jr   nc, label_2D3E5
    add  hl, sp
    di
    ld   [hl], h
    pop  af
    jp   nz, label_611
    ldi  [hl], a
    ld   b, $06
    ld   h, $82
    rlca
    rrca
    add  hl, bc
    ret  nz
    jp   nz, label_2014

label_2D402::
    jp   label_2015

label_2D405::
    ld   d, $2A
    add  a, d
    rla
    ld   hl, label_2619
    ld   h, $20
    daa
    ld   b, $82
    ldd  [hl], a
    jr   nz, label_2D3D6

label_2D414::
    scf
    jr   nz, label_2D39A
    ld   b, d
    jr   nz, label_2D39D
    ld   d, h
    jr   nz, label_2D39F
    ld   h, c
    jr   nz, label_2D488

label_2D420::
    jr   nz, label_2D434
    adc  a, [hl]
    cp   $06
    dec  c
    inc  bc
    db   $F4 ; Undefined instruction
    jr   nc, label_2D420
    add  hl, sp
    rst  $30
    add  a, d
    nop
    ret  nz
    add  a, l
    ld   [bc], a
    rrca
    add  a, d
    inc  bc

label_2D434::
    and  [hl]
    add  a, e
    rlca
    ret  nz
    db   $10 ; Undefined instruction
    add  a, [hl]
    ld   de, label_1721
    ld   h, $82

label_2D440::
    jr   label_2D402
    push bc
    ld   h, $06
    daa
    ld   a, [hli]
    jr   z, label_2D46A

label_2D449::
    add  hl, hl
    ld   h, $83
    inc  sp
    rrca
    add  a, e
    ld   b, e

label_2D450::
    rrca

label_2D451::
    ld   b, h
    and  b
    add  a, e
    ld   d, e
    rrca

label_2D456::
    ld   d, a
    inc  l
    ld   e, b
    ldi  [hl], a
    ld   e, c
    jr   z, label_2D3DF
    ld   h, c
    ld   b, $67

label_2D460::
    inc  h

label_2D461::
    add  a, d

label_2D462::
    ld   l, b

label_2D463::
    ret  nz

label_2D464::
    ld   [hl], a
    jr   z, label_2D3E9
    ld   a, b

label_2D468::
    ret  nz

label_2D469::
    add  hl, hl

label_2D46A::
    ld   hl, label_39C2

label_2D46D::
    dec  c
    ld   e, c
    ldi  [hl], a
    cp   $06
    dec  c
    inc  b
    ld   b, a
    jr   nc, label_2D46D
    add  hl, sp
    rst  $30
    add  a, e
    ld   de, label_21AF
    or   b
    add  a, d
    ldi  [hl], a
    ld   bc, $AF24

label_2D483::
    dec  h
    and  [hl]
    ldd  [hl], a
    or   b
    add  a, d

label_2D488::
    inc  sp
    ld   bc, $AF35
    ld   [hl], $A6
    ld   b, e
    or   b
    add  a, d
    ld   b, h
    ld   bc, $AF46
    ld   d, h
    or   b
    add  a, d
    ld   d, l
    ld   bc, $AF57
    add  a, e
    ld   h, l
    or   b
    ld   l, b
    xor  [hl]
    jr   label_2D463
    ld   h, c
    ret  nz
    jr   nz, label_2D4D0
    jp   nz, label_D30
    ld   d, b
    dec  hl
    cp   $04
    dec  c
    rlca
    ld   a, [$FF30]
    ld   a, [$FF00+C]
    pop  af
    cp   $04
    dec  c
    ld   bc, label_3F4
    rst  0
    dec  b
    rst  0
    ld   [$C826], sp
    add  hl, bc
    inc  bc
    add  a, $18
    inc  h
    ldi  [hl], a
    and  [hl]
    add  a, e
    inc  hl
    ld   [de], a
    ld   h, $11
    jp   nz, label_1132

label_2D4D0::
    add  a, e
    inc  sp
    rrca
    inc  [hl]
    and  b
    ld   [hl], $16
    add  a, e
    ld   b, e
    rrca
    ld   b, [hl]
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   d, e
    dec  d
    add  a, d
    ld   d, h
    inc  de
    ld   a, b
    jr   z, label_2D559
    ret  z
    ld   [hl], l
    ret  z
    pop  hl
    rlca
    ld   e, l
    ld   d, b
    ld   a, h
    cp   $06
    dec  c
    ld   bc, $0106
    db   $F4 ; Undefined instruction
    add  a, d
    inc  b
    dec  c
    add  a, e
    nop
    inc  bc
    add  a, e
    rlca
    inc  bc
    add  a, e
    db   $10 ; Undefined instruction
    add  a, e
    rla
    inc  bc
    add  a, d
    jr   nz, label_2D50A
    add  a, d
    jr   z, label_2D50D

label_2D50A::
    push bc
    jr   nc, label_2D510

label_2D50D::
    push bc
    add  hl, sp
    inc  bc

label_2D510::
    jp   nz, label_2303
    jp   nz, label_2406
    ldi  [hl], a
    dec  h
    inc  hl
    add  hl, hl
    ld   h, $2A
    daa
    ld   h, $31
    dec  h
    ldd  [hl], a
    add  hl, hl
    inc  sp
    ret  nz
    ld   [hl], $C0
    scf

label_2D527::
    ld   a, [hli]
    jr   c, label_2D550
    jp   label_2341
    jp   label_2448
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2D588
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   b, $0D
    inc  b
    db   $F4 ; Undefined instruction
    ld   hl, label_2820
    jr   nz, label_2D586
    jr   nz, label_2D58F
    jr   nz, label_2D57D
    inc  l
    dec  [hl]
    dec  hl
    ld   b, h

label_2D54D::
    ld   a, [hli]
    ld   b, l
    add  hl, hl

label_2D550::
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    jr   label_2D515
    ld  [$FF00+C], a
    rlca
    ld   l, b

label_2D559::
    jr   label_2D56B
    cp   $04
    dec  c
    rlca
    ld   a, [$FF04]
    rst  0
    ld   b, $C7
    add  a, e
    nop
    inc  bc
    inc  bc
    dec  h
    jp   label_310
    jp   label_311
    ld   [de], a
    dec  h
    inc  de
    add  hl, hl
    inc  d
    xor  a
    ld   d, $20
    jp   nz, label_2322
    inc  h
    or   b
    add  a, d

label_2D57D::
    ld   h, $AE
    add  a, d
    inc  [hl]
    jr   nz, label_2D5C3
    dec  h
    ld   b, c
    ld   hl, label_2942

label_2D588::
    ld   b, h
    xor  a
    ld   b, [hl]
    inc  l
    add  a, d
    ld   b, a
    ldi  [hl], a

label_2D58F::
    ld   c, c
    jr   z, label_2D5E5
    jr   nz, label_2D5E8
    or   b
    ld   d, [hl]
    inc  h
    add  a, e
    ld   d, a
    inc  bc
    ld   h, e
    inc  l
    ld   d, [hl]
    inc  h
    add  a, d
    ld   h, h
    ldi  [hl], a
    ld   h, [hl]
    jr   z, label_2D527
    ld   h, a
    inc  bc
    ld   [hl], e
    jr   z, label_2D52F
    ld   [hl], h
    inc  bc
    jr   z, label_2D54D
    ld   h, c
    cp   [hl]
    ld  [$FF00+C], a
    rlca
    ld   l, e
    adc  a, b
    db   $10 ; Undefined instruction
    ld   c, $94
    add  a, d
    nop
    ld   d, h
    add  a, a
    ld   [bc], a
    ld   e, h
    add  hl, bc
    ld   d, h
    jp   nz, label_2D410

label_2D5C2::
    ld   de, $C357
    add  hl, de
    ld   d, c
    ld   hl, $875E
    ldi  [hl], a
    adc  a, d
    push bc
    jr   nc, label_2D626
    ld   b, c
    ld   h, d
    ld   b, d
    ld   e, e
    add  a, h
    ld   b, e
    adc  a, d
    ld   c, c
    ld   e, h
    jp   label_2E351
    ld   d, d
    ld   d, a
    add  a, h
    ld   d, e
    adc  a, d
    jp   nz, label_2D462
    add  a, a
    ld   h, e

label_2D5E5::
    ld   e, e
    add  a, a
    ld   [hl], e

label_2D5E8::
    ld   d, h
    pop  hl
    rlca
    add  hl, sp
    ld   c, b

label_2D5ED::
    jr   nz, label_2D5ED
    ld   c, $94
    adc  a, d
    nop
    ld   d, h
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_2D64E
    adc  a, d
    jr   nc, label_2D651
    add  a, h
    ldi  [hl], a
    ld   e, h
    ld   sp, $845E
    ldd  [hl], a
    adc  a, d
    add  a, d
    ld   [hl], $5C
    ld   b, b
    ld   e, [hl]
    add  a, d
    ld   b, c
    adc  a, d
    ld   b, [hl]
    adc  a, d
    ld   c, b
    ld   e, d
    ld   c, c
    ld   d, h
    add  a, l
    ld   d, d
    adc  a, d
    jp   label_2D159
    adc  a, b
    ld   h, b
    ld   e, e
    adc  a, b
    ld   [hl], b
    ld   d, h
    ld   l, b
    ld   h, d
    ld   a, b
    ld   h, e
    pop  hl
    rlca
    ld   d, b

label_2D626::
    ld   a, b
    ld   [hl], b
    cp   $0E
    sub  a, h
    nop
    ld   d, h
    add  a, [hl]
    ld   bc, $835C
    rlca
    ld   d, h
    rst  0
    db   $10 ; Undefined instruction
    add  a, d
    dec  d
    adc  a, d
    add  a, e
    rla
    ld   e, h
    ld   hl, label_2262
    ld   e, e
    add  a, e
    dec  h
    adc  a, d
    push bc
    ld   sp, $C563
    ldd  [hl], a
    ld   d, a
    call nz, label_8A33
    jp   nz, label_8A36
    jp   label_8A44
    ld   c, b
    ld   h, h
    ld   c, c
    ld   e, e
    jp   nz, label_8A55
    ld   d, a
    adc  a, d
    ld   e, b
    ld   h, l
    jp   nz, label_2D159
    ld   h, [hl]
    adc  a, d
    add  a, [hl]
    ld   [hl], e
    ld   e, e
    ld   a, c
    ld   d, h
    ld   d, [hl]
    adc  a, d
    ld   h, a
    adc  a, d
    ld   b, $54
    ld   d, $51
    rla
    ld   d, h
    add  a, d
    ld   h, $5C
    pop  hl
    rlca
    dec  sp
    ld   e, b
    ld   b, b
    cp   $0E
    sub  a, h
    add  a, d
    nop
    ld   d, h
    add  a, [hl]
    ld   [bc], a
    ld   e, h
    add  a, e

label_2D683::
    rlca
    ld   d, h
    db   $10 ; Undefined instruction
    ld   de, $8554
    ld   [de], a
    adc  a, d
    add  a, d
    rla
    ld   d, h
    add  hl, de
    ld   d, h
    add  a, d
    ld   hl, $825C
    inc  hl
    adc  a, d
    dec  h
    ld   e, e
    add  a, d
    ld   h, $8A
    add  a, $29
    ld   d, c
    add  a, l
    ldd  [hl], a
    adc  a, d
    dec  [hl]
    ld   e, h
    scf
    ld   e, e
    jr   c, label_2D70C
    add  a, e
    ld   b, b
    ld   e, e
    add  a, e
    ld   b, h
    adc  a, d
    ld   b, a
    ld   d, a
    jp   nz, label_2E548
    add  a, d
    ld   d, b
    ld   d, h
    jp   nz, label_2D752
    ld   d, l
    adc  a, d
    add  a, d
    ld   d, [hl]
    ld   e, h
    add  a, d
    ld   h, b
    ld   d, h
    add  a, d

label_2D6C2::
    ld   h, e
    ld   e, e
    ld   h, a
    adc  a, d
    add  a, l
    ld   [hl], b
    ld   d, h
    add  a, e
    ld   [hl], l
    ld   e, e
    ld   a, b
    ld   h, d
    pop  hl
    rlca
    ld   d, c
    adc  a, b

label_2D6D2::
    jr   nz, label_2D6D2
    rrca
    sub  a, h
    ld   [bc], a
    ld   e, h
    add  a, a
    inc  bc
    ld   d, h
    jp   label_2E301
    push bc
    nop
    ld   d, a
    add  hl, bc
    ld   e, h
    ld   sp, label_355B
    ld   h, c
    add  hl, sp
    ld   e, c
    call nz, label_2D440
    call nz, label_2D741
    call nz, label_2D149
    add  a, a
    ld   h, d
    add  a, l
    add  a, a
    ld   [hl], d
    xor  l
    add  a, [hl]
    inc  de
    ld   [hl], c
    jp   nz, label_2CD15
    rla
    ld   [hl], b
    daa
    ld   [hl], c

label_2D702::
    pop  hl
    rlca
    ld   b, e
    ld   c, b
    ld   [hl], b
    cp   $0F
    sub  a, h
    adc  a, d
    nop

label_2D70C::
    ld   d, h
    add  a, d
    nop
    ld   e, h
    rlca
    ld   e, h
    jp   label_2E208
    jp   label_2D109
    jr   nc, label_2D777
    jr   c, label_2D775
    jr   c, label_2D779
    add  hl, sp
    ld   d, h
    call nz, label_2D740
    call nz, label_2D148

label_2D726::
    call nz, label_2D449
    add  a, a
    ld   h, c
    add  a, l
    add  a, a
    ld   [hl], c
    xor  l
    add  a, l
    ld   [de], a
    ld   [hl], c
    inc  de
    ld   [hl], b
    dec  d
    ld   [hl], b
    inc  hl
    ld   [hl], c
    dec  h
    ld   [hl], c
    pop  hl
    rlca
    scf
    jr   z, label_2D78F
    cp   $0F

label_2D741::
    sub  a, h
    add  a, [hl]
    nop
    ld   d, h
    add  a, h
    ld   b, $5C
    add  a, e
    db   $10 ; Undefined instruction
    inc  de
    ld   [hl], b
    add  a, d
    inc  d
    ld   [hl], c
    add  a, $20

label_2D752::
    ld   d, h
    ld   hl, $8257
    ldi  [hl], a

label_2D757::
    ld   [hl], c
    daa
    ld   e, c
    add  a, d
    jr   z, label_2D7B8
    ld   sp, label_3254
    ld   e, e

label_2D761::
    dec  [hl]

label_2D762::
    ld   e, e
    scf
    ld   e, d
    add  a, d
    jr   c, label_2D7C4
    ld   b, c
    ld   [hl], c
    add  a, h
    ld   b, d
    ld   e, h
    ld   h, c
    ld   h, h
    ld   h, d
    ld   e, e
    ld   l, b
    ld   e, c
    ld   l, c
    ld   e, e

label_2D775::
    ld   [hl], c
    ld   h, l

label_2D777::
    ld   [hl], d
    ld   d, h

label_2D779::
    add  a, l
    ld   [hl], e
    ld   e, e
    add  a, d
    ld   a, b
    ld   d, h
    pop  hl
    rlca
    ld   sp, label_2078
    cp   $0F
    sub  a, h
    adc  a, d
    nop
    ld   e, h
    add  a, e
    inc  bc
    ld   d, h
    add  hl, bc
    ld   d, h

label_2D78F::
    inc  de
    ld   [hl], c
    inc  d
    ld   [hl], b
    dec  d
    ld   [hl], c
    jr   label_2D726
    add  hl, de
    ld   d, h
    jr   nz, label_2D7F6
    add  a, d
    ld   hl, label_2464
    ld   [hl], c
    jr   z, label_2D806
    add  a, $29
    ld   d, c
    jr   nc, label_2D803
    ld   sp, label_32D9
    ld   h, l
    push bc
    jr   c, label_2D813
    ld   d, d
    ld   e, e
    add  a, d
    ld   h, b
    ld   e, e
    jp   nz, label_2D762
    add  a, h
    ld   h, e

label_2D7B8::
    add  a, l
    ld   b, a
    ld   e, e
    add  a, d
    ld   [hl], b
    ld   d, h
    add  a, h
    ld   [hl], e
    xor  l
    jp   label_2D757

label_2D7C4::
    jr   z, label_2D82A
    ld   c, b
    ld   h, h
    ld   l, b
    ld   h, h
    pop  hl
    rlca
    ld   c, e
    ld   e, b
    ld   d, b
    cp   $05
    sub  a, h
    adc  a, b
    ld   [bc], a
    ld   d, h
    ld   [bc], a
    ld   d, c
    add  hl, bc
    ld   e, h
    rst  0
    ld   bc, $8763
    ld   [de], a
    ld   [hl], c
    inc  de
    ld   [hl], b
    dec  d
    ld   [hl], b
    rla
    ld   [hl], b
    inc  hl
    ld   [hl], c
    dec  h
    ld   [hl], c
    daa
    ld   [hl], c
    ld   [hl], $59
    scf
    ld   e, l
    add  hl, sp
    ld   e, e
    rst  0
    nop
    ld   d, a
    add  a, d
    ld   b, [hl]

label_2D7F6::
    ld   e, h
    jp   label_2D149
    ld   h, l
    ld   c, h
    ld   l, b
    ld   c, h
    ld   [hl], b
    ld   d, h
    add  a, a
    ld   [hl], c
    ld   e, e

label_2D803::
    ld   [hl], l
    ld   d, h
    add  a, d

label_2D806::
    ld   a, b
    ld   d, h
    pop  hl
    rlca
    ld   e, [hl]
    adc  a, b

label_2D80C::
    jr   nz, label_2D80C
    dec  b
    sub  a, h
    adc  a, d
    nop
    ld   d, h

label_2D813::
    nop
    ld   e, h
    rlca
    ld   d, a
    jp   label_2E308
    inc  de
    ld   e, d
    jp   nz, label_2D414
    add  a, e
    dec  d
    ld   e, h
    rla
    ld   e, [hl]
    inc  [hl]
    ld   e, h
    jp   label_2D109
    jr   nc, label_2D886
    ld   sp, label_3564
    ld   h, h
    add  a, e
    ld   [hl], $5B
    add  hl, sp
    ld   d, h
    jp   label_2D740
    jp   label_2E541
    add  a, d
    ld   b, [hl]
    ld   e, h
    add  a, d
    ld   c, b
    ld   d, h
    ld   e, b
    ld   d, c
    ld   e, c
    ld   d, h
    add  a, d
    ld   h, l
    ld   c, h
    ld   h, a
    ld   e, e
    add  a, d
    ld   l, b
    ld   d, h
    ld   [hl], b
    ld   d, h
    add  a, h
    ld   [hl], c
    ld   e, e
    add  a, l
    ld   [hl], l
    ld   d, h
    pop  hl
    rlca
    ld   d, e
    jr   label_2D879
    cp   $0F
    sub  a, h
    ld   [bc], a
    ld   e, h
    add  a, a
    inc  bc
    ld   d, h
    call nz, label_2E301
    push bc
    nop
    ld   d, a
    ld   b, c
    ld   e, e
    ld   b, d
    ld   e, l
    ld   b, [hl]
    ld   e, e
    jp   label_2D450
    jp   label_2D451
    jp   label_2D752
    ld   d, h
    ld   e, e
    add  a, l

label_2D879::
    ld   h, e
    add  a, l
    add  a, l
    ld   [hl], e
    xor  l
    jp   label_2D456
    ld   e, b
    ld   e, c
    ld   e, c
    ld   e, e
    jp   nz, label_2D464
    jp   nz, label_2D168
    jp   nz, label_2D469
    inc  de
    ld   [hl], c
    inc  d
    ld   [hl], b
    dec  d
    ld   [hl], c
    ld   d, $70
    rla
    ld   [hl], c
    jr   label_2D90A
    add  hl, de
    ld   [hl], c
    inc  h
    ld   [hl], c
    ld   h, $71
    jr   z, label_2D913
    pop  hl
    rlca
    ld   c, b
    jr   label_2D917
    cp   $0F
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    push bc
    ld   [label_1163], sp
    ld   e, h
    add  a, l
    ld   [de], a
    ld   d, h
    rla
    ld   e, h
    add  a, $09
    ld   d, c
    ldi  [hl], a
    ld   e, d
    add  a, e
    inc  hl
    ld   e, h
    ld   h, $5E
    add  a, [hl]
    ld   sp, label_2C664
    ld   h, l
    ld   d, b
    ld   e, e
    ld   d, c
    ld   e, l
    ld   d, a
    ld   e, c
    ld   e, b
    ld   e, e
    jp   nz, label_2D460
    jp   nz, label_2D761
    add  a, l
    ld   h, d
    add  a, l
    add  a, l
    ld   [hl], d
    xor  l
    jp   nz, label_2D167
    jp   nz, label_2D468
    jp   nz, label_2D469
    nop
    ld   e, h
    add  a, [hl]
    ld   bc, label_754
    ld   d, a
    pop  hl
    rlca
    ld   e, a
    jr   label_2D95F
    cp   $04
    rrca
    ld   [hl], h
    push af
    add  a, d
    nop
    inc  bc
    ld   [bc], a
    dec  h
    rlca
    ld   h, $82
    ld   [$C203], sp
    db   $10 ; Undefined instruction
    ld   de, label_1225
    add  hl, hl
    rla
    ld   a, [hli]
    jr   label_2D92F
    jp   nz, label_319
    ld   hl, label_2823
    inc  h
    jr   nc, label_2D937
    ld   sp, label_3229
    dec  h
    add  a, h

label_2D917::
    inc  sp
    ld   hl, label_3482
    sub  a, a
    scf
    ld   h, $38
    ld   a, [hli]
    add  hl, sp
    ld   h, $41
    dec  h
    ld   b, d
    add  hl, hl
    ld   b, a
    ld   a, [hli]
    ld   c, b
    ld   h, $C2
    ld   d, c
    inc  hl
    jp   nz, label_2458
    ld   [hl], b
    inc  hl
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2D9B0

label_2D937::
    inc  h
    ld   d, e
    xor  e
    ld   d, [hl]
    xor  e
    cp   $04
    rrca
    nop
    nop
    ld   bc, label_325
    add  hl, hl
    add  a, d
    inc  b
    rrca
    ld   b, $2A
    ld   [label_926], sp
    nop
    db   $10 ; Undefined instruction
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2D9CF

label_2D95F::
    nop
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2D9DE
    nop
    nop
    xor  e
    add  hl, bc
    xor  e
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   b, $58
    ld   b, b
    cp   $04
    dec  c
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    jr   nz, label_2D9A6
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D30
    jp   nz, label_D39
    ld   d, b
    dec  hl
    ld   e, c
    inc  l
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  l
    cp   $04
    dec  c
    nop
    nop
    ld   bc, label_325
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    ld   [label_926], sp
    nop
    db   $10 ; Undefined instruction
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l

label_2D9B0::
    ld   l, c
    jr   z, label_2DA23
    nop
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2DA32
    nop
    ldd  [hl], a
    xor  h
    scf
    xor  h
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  l
    cp   $04
    dec  a
    ld   de, $8625
    ld   [de], a
    ld   hl, label_2618

label_2D9CF::
    push bc
    ld   hl, label_2223
    dec  h
    add  a, h
    inc  hl
    ld   hl, label_2627
    push bc
    jr   z, label_2DA00
    jp   label_2332
    inc  sp
    dec  h
    add  a, d
    inc  [hl]
    ld   hl, label_2636
    jp   label_2437
    ld   b, e
    inc  hl
    add  a, d
    ld   b, h
    inc  e
    ld   b, [hl]
    inc  h

label_2D9F0::
    ld   d, e
    daa
    add  a, d
    ld   d, h

label_2D9F4::
    ldi  [hl], a
    ld   d, [hl]
    jr   z, label_2DA58
    add  hl, hl
    ld   h, d
    daa
    ld   h, e
    dec  hl
    add  a, d
    ld   h, h
    dec  c

label_2DA00::
    ld   h, [hl]
    inc  l
    ld   h, a
    jr   z, label_2DA6E
    ld   a, [hli]
    ld   [hl], b
    ld   hl, label_2971
    ld   [hl], d
    xor  h
    ld   [hl], e
    inc  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  h
    ld   [hl], a
    xor  h
    ld   a, b
    ld   a, [hli]
    ld   a, c
    ld   hl, label_8E1
    ld   [hl], h
    ld   c, b
    ld   [hl], b
    cp   $04
    dec  c
    nop
    nop

label_2DA23::
    ld   bc, label_825
    ld   h, $09
    nop
    db   $10 ; Undefined instruction
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60

label_2DA32::
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2DAAA
    nop
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2DAB9
    nop
    inc  [hl]
    rst  $20
    dec  [hl]
    db   $E8 ; add  sp, d
    ld   b, h
    jp   [hl]
    ld   b, l
    ld   [label_4FE], a
    rrca
    nop
    nop
    ld   bc, label_325
    add  hl, hl
    add  a, d
    inc  b
    rrca
    ld   b, $2A
    ld   [label_926], sp
    nop

label_2DA5B::
    db   $10 ; Undefined instruction
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2DADC
    nop
    ld   [hl], c

label_2DA6E::
    daa
    ld   a, b
    jr   z, label_2DAEB
    nop
    add  a, [hl]
    ld   [de], a
    inc  e
    adc  a, b
    ld   hl, $881C
    ld   sp, $881C
    ld   b, c
    inc  e
    adc  a, b
    ld   d, c
    inc  e
    add  a, [hl]
    ld   h, d
    inc  e
    add  a, d
    ld   d, h
    inc  e
    add  a, d
    ld   h, h
    rrca
    ldd  [hl], a
    xor  e
    scf
    xor  e
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    rrca
    db   $76 ; Halt
    inc  l
    pop  hl
    ld   [label_2C871], sp
    ld   b, b
    cp   $04
    sub  a, l
    nop
    dec  h
    adc  a, b
    ld   bc, label_921
    ld   h, $10
    add  hl, hl
    ld   de, label_18AC

label_2DAAA::
    xor  h
    add  hl, de
    ld   a, [hli]
    jr   nz, label_2DA5B
    add  hl, hl
    xor  h
    ld   hl, label_2225
    ld   hl, label_2623
    ld   h, $25

label_2DAB9::
    daa
    ld   hl, label_2628
    add  hl, hl
    xor  h
    jr   nc, label_2DAE6
    ld   sp, label_3329
    inc  h
    ld   [hl], $23
    jr   c, label_2DAF3
    add  hl, sp
    ld   hl, label_2C0C4
    inc  hl
    ld   b, e
    ld   a, [hli]
    add  a, d
    ld   b, h
    sub  a, a
    ld   b, [hl]
    add  hl, hl
    ld   d, c
    inc  l
    ld   d, d
    ldi  [hl], a
    ld   d, e
    dec  hl
    ld   h, c

label_2DADC::
    ld   a, [hli]
    ld   h, d
    ld   h, $63
    daa
    ld   h, h
    ldi  [hl], a
    ld   h, l
    dec  hl
    ld   l, c

label_2DAE6::
    inc  l
    ld   [hl], d
    inc  h
    add  a, d
    ld   [hl], h

label_2DAEB::
    rst  $18
    ld   [hl], l
    daa
    add  a, h
    db   $76 ; Halt
    ldi  [hl], a
    ld   a, c
    jr   z, label_2DB26
    ld   bc, $B037
    add  a, d
    ld   b, c
    or   b
    ld   d, a
    xor  [hl]
    ld   l, b
    xor  [hl]
    cp   $04
    dec  b
    nop
    rst  $18
    ld   bc, label_325
    rst  0
    ld   b, $C7
    ld   [label_926], sp
    rst  $18
    db   $10 ; Undefined instruction
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $30
    add  hl, hl
    inc  [hl]
    inc  l
    dec  [hl]
    dec  hl
    jp   nz, label_540
    jp   label_2444
    call nz, label_2345
    ld   h, b
    ldi  [hl], a

label_2DB26::
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2DB9D
    rst  $18
    ld   [hl], c
    daa
    ld   [hl], h
    jr   z, label_2DBA9
    dec  b
    ld   [hl], a
    inc  l
    ld   a, b
    jr   z, label_2DBB2
    dec  c
    add  a, [hl]
    ld   [de], a
    xor  a
    ld   hl, label_28AF
    xor  a
    ld   sp, $86B0
    ldi  [hl], a
    ld   bc, label_32C3
    ld   bc, label_33C3
    ld   bc, label_3683
    ld   bc, label_2C683
    ld   bc, label_2D683
    or   b
    add  a, d
    ld   h, d
    or   b
    cp   $04
    sub  a, l
    jp   nz, label_2300
    ld   [bc], a
    ld   a, [hli]
    inc  bc
    ld   h, $82
    inc  b
    rst  $18
    add  a, d

label_2DB66::
    ld   b, $0D

label_2DB68::
    ld   [label_900], sp
    rst  $18
    db   $10 ; Undefined instruction
    inc  de
    ld   a, [hli]
    inc  d
    ld   hl, label_2615
    add  a, d
    ld   d, $DF
    add  a, d
    jr   label_2DB87
    jr   nz, label_2DBA3
    ld   hl, label_252B
    ld   a, [hli]
    ld   h, $21
    daa
    ld   h, $82
    jr   z, label_2DB66

label_2DB87::
    jr   nc, label_2DB68
    ld   sp, label_3227
    dec  hl
    scf
    ld   a, [hli]
    jr   c, label_2DBB2
    add  hl, sp
    ld   h, $40
    dec  c
    ld   b, c
    rst  $18
    ld   b, d
    daa
    ld   b, e
    dec  hl
    ld   c, c
    ld   a, [hli]

label_2DB9D::
    add  a, d
    ld   d, b
    dec  c
    ld   d, d
    rst  $18
    ld   d, e

label_2DBA3::
    daa
    ld   d, h
    ldi  [hl], a
    ld   d, l
    dec  hl
    ld   h, b

label_2DBA9::
    nop
    add  a, d
    ld   h, c
    dec  c
    add  a, d
    ld   h, e
    rst  $18
    ld   h, l
    daa

label_2DBB2::
    add  a, h
    ld   h, [hl]
    ldi  [hl], a
    ld   h, a
    ret  z
    add  a, d
    ld   [hl], b
    nop
    add  a, e
    ld   [hl], d
    dec  c
    add  a, l
    ld   [hl], l
    rst  $18
    inc  h
    xor  [hl]
    dec  [hl]
    xor  [hl]
    ld   [hl], $AF
    ld   b, [hl]
    or   b
    add  a, d
    ld   b, a
    xor  [hl]
    cp   $04
    dec  b
    ld   [bc], a
    rst  0
    dec  b
    add  hl, hl
    rlca
    ld   a, [hli]
    ld   [$82C7], sp
    rla
    and  [hl]
    add  a, d
    ldi  [hl], a
    and  a
    add  a, d
    dec  h
    and  a
    jr   z, label_2DB87
    add  a, d
    inc  sp
    and  a
    scf

label_2DBE5::
    and  a
    add  a, e
    ld   b, h
    and  a
    add  a, e
    ld   d, d
    and  a
    ld   b, b
    add  hl, hl
    ld   c, c
    ld   a, [hli]
    ld   h, b
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    ldi  [hl], a
    ld   [hl], b
    daa
    ld   [hl], d
    ret  z
    ld   [hl], a
    ret  z
    ld   a, b
    jr   z, label_2DC78
    rst  $18
    ld   de, label_13AF
    xor  [hl]
    inc  d
    xor  a
    ld   hl, label_2401
    or   b
    ld   sp, label_32B0
    xor  a
    add  a, d
    dec  [hl]
    xor  [hl]
    ld   b, d
    or   b
    ld   b, e
    xor  [hl]
    ld   b, a
    xor  [hl]
    ld   d, [hl]
    xor  [hl]
    ld   b, $05
    ld   d, b
    dec  b
    ld   e, c
    dec  b
    cp   $04
    sub  a, l
    nop
    dec  c
    add  a, [hl]
    ld   bc, $82DF
    rlca
    dec  c
    add  hl, bc
    nop
    db   $10 ; Undefined instruction
    ld   de, $8425
    ld   [de], a
    ld   hl, label_2616
    rla
    rst  $18
    jr   label_2DC46
    add  a, $19
    dec  c
    jr   nz, label_2DC63
    ld   hl, label_2629
    ld   a, [hli]
    daa
    ld   h, $C5
    jr   z, label_2DC26
    jr   nc, label_2DC6C
    push bc
    scf
    inc  h
    ld   b, b
    add  hl, hl
    ld   b, d
    inc  l
    ld   b, e
    ldi  [hl], a
    ld   b, h
    dec  hl
    ld   d, d
    inc  h
    jp   nz, label_DF53
    jp   nz, label_2354
    add  a, d
    ld   h, b
    ldi  [hl], a
    ld   h, d
    jr   z, label_2DBE5
    ld   [hl], b

label_2DC63::
    rst  $18
    ld   [hl], e
    dec  c
    ld   [hl], h
    daa

label_2DC68::
    ld   [hl], a

label_2DC69::
    jr   z, label_2DCE3
    dec  c

label_2DC6C::
    ld   a, c
    nop
    ld   [hl], l
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   a, [bc]
    ld   a, b
    ld   [hl], b
    cp   $04
    ccf

label_2DC78::
    nop
    inc  hl
    ld   bc, label_825
    ld   h, $09
    inc  h
    push bc
    ld   de, $C523
    jr   label_2DCAA
    ld   h, c
    daa
    ld   h, d
    dec  hl
    ld   h, a
    inc  l
    ld   l, b
    jr   z, label_2DD00
    dec  c
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    ld   [hl], a
    jr   z, label_2DD10
    dec  c
    inc  bc
    rst  0
    ld   b, $C7
    jr   nz, label_2DC68
    ld   sp, label_2D1C9
    ret
    ld   h, b
    ret
    add  hl, hl
    jp   z, label_CA38
    ld   e, b

label_2DCAA::
    jp   z, label_CA69
    inc  b
    ld   a, [$FF74]
    pop  af
    cp   $0C
    sub  a, l
    add  a, d
    nop
    dec  c
    add  a, d
    ld   [bc], a
    rst  $18
    inc  b
    dec  h
    add  a, l
    dec  b
    ld   hl, label_10C3
    dec  c
    ld   de, label_12DF
    dec  h
    inc  de
    ld   hl, label_2914
    ld   hl, label_2225
    add  hl, hl
    ld   h, $2C
    add  a, e
    daa
    ldi  [hl], a
    ld   sp, label_3423
    inc  l
    dec  [hl]
    ldi  [hl], a
    ld   [hl], $28
    add  a, e
    scf
    rst  $18
    ld   b, b
    dec  h
    ld   b, c
    add  hl, hl
    ld   b, e

label_2DCE3::
    inc  l
    ld   b, h
    jr   z, label_2DC69
    ld   b, l
    rst  $18
    ld   b, a
    dec  h
    add  a, d
    ld   c, b
    ld   hl, label_2D0C2
    inc  hl
    jp   nz, label_2453
    add  a, d
    ld   d, h
    rst  $18
    ld   d, [hl]
    dec  h
    ld   d, a
    add  hl, hl
    jp   nz, label_DF64
    jp   nz, label_D65
    ld   h, [hl]
    inc  hl
    ld   [hl], b

label_2DD04::
    daa
    ld   [hl], e
    jr   z, label_2DD7E
    daa
    ld   [hl], a
    pop  bc
    ld   a, b
    jp   nz, label_2279
    ld   [hl], c

label_2DD10::
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   e, $38
    db   $10 ; Undefined instruction
    inc  c
    sub  a, l
    adc  a, d
    nop
    ld   hl, label_1782
    rst  $18
    adc  a, d
    jr   nz, label_2DD44
    adc  a, c
    jr   nc, label_2DD04
    add  hl, sp
    dec  c
    add  a, l
    ld   b, b
    ld   hl, label_2645
    add  a, h
    ld   b, [hl]
    rst  $18
    ld   d, l
    ld   a, [hli]
    ld   d, [hl]
    ld   h, $83
    ld   d, a
    rst  $18
    ld   h, [hl]
    inc  h
    add  a, e
    ld   h, a
    rst  $18
    add  a, [hl]
    ld   [hl], b

label_2DD3D::
    ldi  [hl], a
    db   $76 ; Halt
    jr   z, label_2DCC4
    ld   [hl], a
    rst  $18
    ld   h, h

label_2DD44::
    cp   [hl]
    cp   $0C
    sub  a, l
    add  a, l
    nop
    ld   hl, label_2605
    ld   b, $0D
    add  a, e
    rlca
    rst  $18
    add  a, e
    ld   de, label_15DF
    ld   a, [hli]
    ld   d, $21
    rla
    ld   h, $82
    jr   label_2DD3D
    add  a, e
    jr   nz, label_2DD83
    inc  hl
    dec  hl
    inc  h
    rst  $18
    daa
    inc  h
    jr   z, label_2DD76
    add  hl, hl
    rst  $18

label_2DD6B::
    add  a, d
    jr   nc, label_2DD7B
    ldd  [hl], a
    nop
    inc  sp
    daa
    inc  [hl]
    dec  hl
    jp   nz, label_DF35
    scf
    ld   a, [hli]
    jr   c, label_2DDA1

label_2DD7B::
    add  hl, sp
    dec  c
    ld   b, b

label_2DD7E::
    rst  $18
    add  a, e
    ld   b, c
    dec  c
    ld   b, h

label_2DD83::
    inc  hl
    jp   label_2448
    jp   nz, label_DF49
    add  a, d
    ld   d, b
    rst  $18
    jp   label_D52
    jp   label_53
    ld   d, h
    daa
    ld   d, l
    dec  hl
    add  a, d
    ld   h, b
    rst  $18
    ld   h, h
    dec  c
    ld   h, l
    inc  hl
    jp   nz, label_D69

label_2DDA1::
    ld   [hl], b
    rst  $18
    ld   [hl], c
    dec  c
    add  a, d
    ld   [hl], e
    nop
    ld   [hl], l
    daa
    ld   a, b
    jr   z, label_2DE23
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    rra
    jr   z, label_2DDC3
    cp   $0C
    sub  a, l
    add  a, d
    nop
    dec  c
    add  a, d
    ld   [bc], a
    rst  $18
    inc  b
    dec  h
    add  a, l
    dec  b
    ld   hl, label_10C3

label_2DDC3::
    dec  c
    ld   de, label_12DF
    dec  h
    inc  de
    ld   hl, label_2914
    ld   hl, label_2225
    add  hl, hl
    ld   h, $2C
    add  a, e
    daa
    ldi  [hl], a
    ld   sp, label_3423
    inc  l
    dec  [hl]
    ldi  [hl], a
    ld   [hl], $28
    add  a, e
    scf
    rst  $18
    ld   b, b
    dec  h
    ld   b, c
    add  hl, hl
    ld   b, e
    inc  l
    ld   b, h
    jr   z, label_2DD6B
    ld   b, l
    rst  $18
    ld   b, a
    dec  h
    add  a, d
    ld   c, b
    ld   hl, label_2D0C2
    inc  hl
    jp   nz, label_2453
    add  a, d
    ld   d, h
    rst  $18
    ld   d, [hl]
    dec  h
    ld   d, a
    add  hl, hl
    jp   nz, label_DF64
    jp   nz, label_D65
    ld   h, [hl]
    inc  hl
    ld   [hl], b

label_2DE06::
    daa
    ld   [hl], c
    pop  bc
    ld   [hl], d
    jp   nz, label_2873
    db   $76 ; Halt
    daa
    ld   a, c
    ldi  [hl], a
    ld   [hl], a
    db   $FD ; Undefined instruction

label_2DE13::
    ld   [rJOYP], a
    ld   e, $78
    db   $10 ; Undefined instruction
    inc  c
    sub  a, l
    adc  a, d
    nop
    ld   hl, label_1782
    rst  $18
    adc  a, d
    jr   nz, label_2DE46
    adc  a, c

label_2DE25::
    jr   nc, label_2DE06
    add  hl, sp
    dec  c
    add  a, l
    ld   b, b
    ld   hl, label_2645
    add  a, h
    ld   b, [hl]
    rst  $18
    ld   d, l
    ld   a, [hli]
    ld   d, [hl]
    ld   h, $83
    ld   d, a
    rst  $18
    ld   h, [hl]
    inc  h
    add  a, e
    ld   h, a
    rst  $18
    add  a, [hl]
    ld   [hl], b
    ldi  [hl], a
    db   $76 ; Halt
    jr   z, label_2DDC6
    ld   [hl], a
    rst  $18
    ld   h, h

label_2DE46::
    cp   [hl]
    pop  hl
    ld   a, [bc]
    add  a, l
    ld   c, b
    ld   b, b
    cp   $0C
    dec  h
    add  a, d
    nop
    dec  c
    add  a, d
    ld   [bc], a
    rst  $18
    inc  b
    dec  h
    ld   b, $26
    rlca
    ld   a, [hli]
    db   $10 ; Undefined instruction
    ld   de, label_12DF
    dec  h
    inc  de
    ld   hl, label_2914
    dec  d
    xor  a
    ld   d, $2A
    rla
    ld   h, $20
    dec  c
    ld   hl, label_2225
    add  hl, hl
    inc  hl
    xor  [hl]
    dec  h
    or   b
    ld   h, $AF
    daa
    ld   a, [hli]
    jr   z, label_2DE13
    add  hl, hl
    ld   hl, label_2530
    ld   sp, label_3229
    xor  a
    ld   [hl], $01
    ld   b, d
    or   b
    ld   b, e
    xor  a
    ld   b, l
    xor  a
    ld   b, [hl]
    or   b
    add  a, e
    ld   d, e
    or   b
    ld   d, h
    xor  [hl]
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   h, [hl]
    inc  l
    add  a, e
    ld   h, a
    ldi  [hl], a
    ld   [hl], b
    rst  $18
    ld   [hl], c
    daa
    db   $76 ; Halt
    jr   z, label_2DE25
    ld   [hl], a
    rst  $18
    inc  [hl]
    set  4, c
    ld   a, [bc]
    add  a, h
    ld   c, b
    ld   [hl], b
    cp   $0C
    ld   [hl], l
    inc  bc
    ld   h, $04
    rst  $18
    dec  b
    dec  h
    rlca
    ld   h, $82
    ld   [label_13DF], sp
    ld   a, [hli]
    inc  d
    ld   hl, label_2915
    rla
    ld   a, [hli]
    jr   label_2DEE9
    add  hl, de
    rst  $18
    jr   nz, label_2DEE8
    ld   hl, label_3126
    ld   a, [hli]
    jr   z, label_2DEF7
    add  hl, hl
    ld   h, $32
    ld   hl, label_2633
    ld   b, e
    ld   a, [hli]
    add  a, d
    ld   b, h
    ld   hl, label_2646
    add  a, d
    ld   d, h
    xor  a
    ld   d, [hl]
    ld   a, [hli]
    ld   d, a
    ld   h, $60
    dec  hl
    add  a, h
    ld   h, e
    xor  a
    add  a, d
    ld   h, h

label_2DEE8::
    ld   bc, label_2E7C2
    inc  h
    ld   [hl], b
    daa
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], d
    dec  hl
    add  a, h
    ld   [hl], e
    ld   bc, label_CFE

label_2DEF7::
    dec  d
    nop
    dec  hl
    ld   [bc], a
    daa
    inc  bc
    dec  hl
    push bc
    inc  b
    ld   bc, label_5C5
    ld   bc, label_2C06
    rlca
    jr   z, label_2DF1A
    and  [hl]
    jp   nz, label_2313
    jp   nz, label_2416
    jr   z, label_2DEB8
    add  hl, hl
    ld   a, [hli]
    ldd  [hl], a
    dec  h
    inc  sp
    add  hl, hl

label_2DF18::
    ld   [hl], $2A

label_2DF1A::
    add  a, d
    scf
    ld   hl, label_2639
    jp   nz, label_2342
    ld   b, e
    xor  [hl]
    ld   b, h
    or   b
    add  a, e
    ld   b, [hl]
    xor  a
    add  a, h
    ld   d, l
    or   b
    ld   h, d
    daa
    ld   h, e
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2DFA6
    dec  hl
    ld   [hl], d
    rst  $18
    ld   [hl], e
    daa
    ld   a, b
    jr   z, label_2DFB6
    rst  $18
    ld   [hl], l
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    rra
    ld   e, b
    ld   b, b
    cp   $0C
    sbc  a, l
    nop
    rst  $18
    inc  bc
    rst  $18
    inc  b
    dec  h
    add  a, e
    dec  b
    ld   hl, label_2608
    add  hl, bc
    rst  $18
    add  a, d
    ld   de, label_13DF
    dec  h
    inc  d
    add  hl, hl
    add  a, e
    dec  d
    dec  de
    jr   label_2DF8B
    add  hl, de
    ld   h, $C2
    ldi  [hl], a
    rst  $18
    jp   label_2323
    add  a, l
    inc  h
    dec  de
    ld   h, $05
    jp   label_2429
    jr   nc, label_2DF52
    add  a, e
    ld   b, b
    rst  $18
    ld   d, c
    rst  $18
    ld   d, e
    daa
    ld   d, h
    dec  hl
    add  a, l
    inc  [hl]
    dec  de
    add  a, e

label_2DF80::
    dec  [hl]
    dec  b
    add  a, l
    ld   b, h
    dec  de
    ld   b, [hl]
    dec  b
    ld   d, c
    rst  $18
    ld   d, e
    daa

label_2DF8B::
    ld   d, h
    dec  hl
    add  a, e
    ld   d, l
    dec  de
    ld   e, b

label_2DF91::
    inc  l
    ld   e, c
    jr   z, label_2DF18
    ld   h, c
    rst  $18
    ld   h, h
    daa
    ld   h, l
    dec  hl
    jp   nz, label_1B66
    ld   h, a
    inc  l
    ld   l, b
    jr   z, label_2E00C
    rst  $18
    add  a, e
    ld   [hl], d

label_2DFA6::
    rst  $18
    ld   [hl], l
    inc  hl
    ld   [hl], a
    inc  h
    add  a, d
    ld   a, b
    rst  $18
    ld   [hl], $CB
    pop  hl
    ld   a, [bc]
    adc  a, d
    ld   l, b
    ld   h, b
    cp   $0C
    sbc  a, l
    nop
    rst  $18
    inc  b
    dec  h
    dec  b
    add  hl, hl
    ld   b, $1B
    jp   nz, label_2407
    add  hl, bc
    rst  $18
    add  a, d

label_2DFC6::
    db   $10 ; Undefined instruction
    jp   nz, label_2314
    add  a, d
    dec  d
    dec  de
    ld   hl, $C2DF
    dec  h
    dec  de
    ld   h, $2C
    daa
    jr   z, label_2E000
    rst  $18
    ldd  [hl], a
    dec  h
    inc  sp
    ld   hl, label_2934
    jp   nz, label_2436
    add  a, d
    scf
    rst  $18
    jr   c, label_2DFC6
    ld   b, b
    rst  $18
    jp   label_2342
    add  a, e
    ld   b, e
    dec  de
    ld   b, a
    rst  $18
    ld   c, c
    rst  $18
    jp   nz, label_DF51
    add  a, d
    ld   d, e
    dec  de
    ld   d, l
    inc  l
    ld   d, [hl]
    jr   z, label_2DF80
    ld   e, b
    rst  $18

label_2E000::
    add  a, d
    ld   h, e
    dec  de
    ld   h, l
    inc  h
    ld   l, b
    rst  $18
    add  a, d
    ld   [hl], b
    rst  $18
    ld   [hl], d
    daa

label_2E00C::
    ld   [hl], l
    jr   z, label_2DF91
    db   $76 ; Halt
    rst  $18
    ld   [hl], e
    db   $FD ; Undefined instruction

label_2E013::
    ld   [rJOYP], a
    add  hl, de
    adc  a, b
    ld   b, b
    cp   $0C
    sbc  a, l
    add  a, e
    ld   bc, $82DF
    ld   [$84DF], sp
    ld   [de], a
    rst  $18
    add  hl, de
    rst  $18
    jp   label_DF20

label_2E029::
    ldi  [hl], a
    rst  $18
    inc  hl
    dec  h
    add  a, d
    inc  h
    ld   hl, label_2626
    jr   nc, label_2E013
    ldd  [hl], a
    dec  h
    inc  sp
    add  hl, hl
    add  a, d
    inc  [hl]
    dec  b
    ld   [hl], $2A
    scf
    ld   h, $38
    rst  $18
    ld   b, c
    dec  h
    ld   b, d
    add  hl, hl
    add  a, h
    ld   b, e
    dec  b
    ld   b, a
    ld   a, [hli]
    ld   c, b
    ld   h, $C2
    ld   c, c
    rst  $18
    ld   d, c
    inc  hl
    add  a, [hl]
    ld   d, d
    dec  b
    ld   e, b
    inc  h
    ld   h, b
    rst  $18
    ld   h, c
    daa
    ld   h, d
    dec  hl
    add  a, h
    ld   h, e
    dec  b
    ld   h, a
    inc  l
    ld   l, b
    jr   z, label_2E0D5
    rst  $18

label_2E065::
    ld   [hl], d
    daa
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  b
    db   $76 ; Halt
    inc  l
    ld   [hl], a
    jr   z, label_2E0EA
    rst  $18
    ld   d, e
    and  b
    ld   d, [hl]
    cp   [hl]
    pop  hl
    ld   a, [bc]
    adc  a, b
    ld   l, b
    ld   b, b
    cp   $0C
    sbc  a, l
    jp   nz, label_DF02
    db   $10 ; Undefined instruction
    add  a, d
    jr   nz, label_2E065
    ld   sp, label_2C0DF
    rst  $18
    ld   b, d
    rst  $18
    add  a, d
    ld   d, b
    rst  $18
    ld   h, d
    rst  $18
    ld   [hl], b
    rst  $18
    add  a, e
    daa
    rst  $18
    add  a, e
    scf
    rst  $18
    add  a, e
    ld   b, a
    rst  $18
    add  a, e
    ld   h, a
    rst  $18
    rst  0
    inc  bc
    inc  hl
    rst  0
    inc  b
    dec  b
    rst  0
    dec  b
    dec  b
    rst  0
    ld   b, $24
    ld   [hl], e
    daa
    db   $76 ; Halt
    jr   z, label_2E124
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   a, [bc]
    jr   label_2E126

label_2E0B6::
    cp   $0C
    sub  a, l
    add  a, e
    nop
    rst  $18
    push bc
    inc  bc
    inc  hl
    jp   label_2405
    jp   label_DF06
    jp   nz, label_D09
    db   $10 ; Undefined instruction
    ld   de, $C2DF
    rla
    dec  c
    add  a, d
    ld   hl, $C30D
    jr   z, label_2E0E2

label_2E0D5::
    jr   nc, label_2E0B6
    dec  [hl]
    ld   a, [hli]
    ld   [hl], $26
    jp   nz, label_DF37
    add  a, d
    ld   b, b
    rst  $18
    ld   b, [hl]

label_2E0E2::
    inc  h
    jp   nz, label_D51
    ld   d, d
    rst  $18
    ld   d, e
    daa

label_2E0EA::
    ld   d, h
    dec  hl
    ld   d, [hl]
    ld   a, [hli]
    ld   d, a
    ld   h, $C2
    ld   e, c
    rst  $18
    ld   h, h
    inc  hl
    ld   h, a
    inc  h
    add  a, d
    ld   [hl], d
    rst  $18
    ld   [hl], h
    daa
    ld   [hl], a
    jr   z, label_2E177
    rst  $18
    ld   [hl], l
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    rra
    ld   a, b
    db   $10 ; Undefined instruction
    inc  c
    sbc  a, l
    add  a, d
    nop
    rst  $18
    add  a, e
    inc  b
    rst  $18
    add  a, d
    ld   [$C3DF], sp
    db   $10 ; Undefined instruction
    jp   label_DF12
    jp   nz, label_DF13
    jp   nz, label_DF15
    jp   label_DF16
    jp   nz, label_DF18
    jp   nz, label_DF19
    inc  sp
    dec  h
    inc  [hl]
    ld   hl, label_2635
    push bc
    scf
    rst  $18
    ld   b, d
    dec  h
    ld   b, e
    add  hl, hl
    ld   b, h
    dec  b
    ld   b, l
    ld   a, [hli]
    ld   b, [hl]
    ld   h, $82
    ld   c, b
    rst  $18
    jp   label_DF51
    jp   nz, label_2352
    add  a, e
    ld   d, e
    dec  b
    jp   label_2456
    jp   nz, label_DF60
    add  a, e
    ld   h, e
    dec  b
    add  a, d
    ld   l, b
    rst  $18
    ld   [hl], d
    daa
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  b
    add  a, d
    ld   [hl], a
    rst  $18
    ld   [hl], l
    inc  l
    db   $76 ; Halt
    jr   z, label_2E1B6
    set  4, c
    ld   a, [bc]
    sbc  a, d
    jr   c, label_2E1A8
    cp   $0C
    dec  h
    add  a, e
    nop
    nop
    inc  bc
    dec  h
    stop
    ld   de, label_1225
    ld   hl, label_2913
    jr   nz, label_2E19F
    ld   hl, label_2E029
    daa
    add  a, e
    ld   h, c
    ldi  [hl], a
    ld   h, h
    dec  hl

label_2E183::
    add  a, h
    ld   [hl], b
    nop
    ld   [hl], h
    daa
    ld   a, c
    jr   z, label_2E1F4
    inc  l
    add  a, [hl]
    inc  h
    xor  a
    add  a, [hl]
    inc  [hl]
    ld   bc, label_2C482

label_2E194::
    or   b
    ld   c, c
    or   b
    ld   [hl], $B0
    jr   c, label_2E14B
    jp   nz, label_527
    ld   d, a

label_2E19F::
    xor  [hl]
    db   $76 ; Halt
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    rrca
    ld   c, b
    ld   d, b
    cp   $04
    dec  e
    ld   [bc], a
    dec  h
    add  a, h
    inc  bc
    ld   hl, label_2607
    inc  b
    db   $F4 ; Undefined instruction
    jp   nz, label_2312

label_2E1B6::
    add  a, h
    inc  de
    rrca

label_2E1B9::
    jp   nz, label_2417
    add  a, h
    inc  hl
    rrca
    ldd  [hl], a
    daa
    add  a, h
    inc  sp
    ldi  [hl], a
    scf

label_2E1C5::
    jr   z, label_2E149
    inc  [hl]
    sub  a, a
    jp   label_AC42
    ld   b, e
    jr   nz, label_2E215
    jr   nz, label_2E194
    ld   b, a
    xor  h
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    xor  h
    ld   e, b
    ld   b, b
    cp   $0C
    dec  b
    ld   c, c
    ld   a, $C8
    nop
    nop
    ld   bc, $8200
    ld   [bc], a
    dec  c
    add  a, [hl]
    inc  b
    rst  $18
    rlca
    dec  c
    add  a, h
    ld   de, label_120D
    dec  c
    inc  d
    dec  h
    add  a, e

label_2E1F4::
    dec  d
    ld   hl, label_2618
    add  hl, de
    rst  $18
    push bc
    ld   hl, label_220D
    rst  $18
    inc  hl
    dec  h
    inc  h
    add  hl, hl
    add  a, d
    dec  h
    xor  [hl]
    daa
    xor  a

label_2E208::
    jr   z, label_2E234
    add  hl, hl
    ld   h, $32
    dec  h
    inc  sp
    add  hl, hl
    inc  [hl]
    xor  [hl]
    scf
    or   b
    jr   c, label_2E1C5
    jp   nz, label_2342
    ld   b, e
    xor  a
    ld   c, b
    ld   bc, $DF51
    ld   d, e
    or   b
    ld   d, h
    xor  a
    ld   d, a
    xor  a
    ld   e, b
    or   b
    ld   h, d
    daa
    ld   h, e
    dec  hl
    ld   h, h
    or   b
    add  a, d
    ld   h, l
    xor  [hl]
    ld   h, a
    or   b
    ld   l, b
    inc  l

label_2E234::
    ld   l, c
    jr   z, label_2E1B9
    ld   [hl], c
    dec  c
    ld   [hl], e
    daa
    ld   a, b
    jr   z, label_2E2B7
    rst  $18
    ld   b, l
    set  4, c
    ld   a, [bc]
    sub  a, [hl]
    jr   z, label_2E266
    cp   $0C
    sub  a, l
    adc  a, d
    nop
    rst  $18
    add  a, e
    db   $10 ; Undefined instruction
    inc  de
    dec  h
    add  a, [hl]
    inc  d
    ld   hl, $DF20
    ld   hl, label_2225
    ld   hl, label_2923
    jr   nc, label_2E283
    ld   sp, label_2C029
    ld   c, c
    ld   b, c
    dec  c
    ld   d, b
    daa

label_2E266::
    ld   d, c
    dec  hl
    ld   h, b
    rst  $18
    ld   h, c
    daa
    ld   h, d
    dec  hl
    ld   l, c
    inc  l
    add  a, d
    ld   [hl], b
    rst  $18
    ld   [hl], d
    inc  hl

label_2E275::
    ld   a, b
    inc  l
    ld   a, c

label_2E278::
    jr   z, label_2E278
    inc  c
    sub  a, l
    nop
    dec  c
    add  a, e
    ld   bc, $82DF
    inc  b

label_2E283::
    dec  c
    jp   nz, label_6
    ret  z
    rlca
    nop
    ret  z
    ld   [$C800], sp
    add  hl, bc
    nop
    add  a, e
    db   $10 ; Undefined instruction
    inc  de
    ld   h, $14
    rst  $18
    dec  d
    dec  c
    inc  hl
    ld   a, [hli]
    inc  h
    ld   hl, label_2625
    ld   h, $0D
    dec  [hl]
    ld   a, [hli]
    ld   [hl], $26
    jp   nz, label_2446
    ld   h, b
    dec  hl
    ld   h, l
    inc  l
    ld   h, [hl]
    jr   z, label_2E31F
    daa
    add  a, h
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], l
    jr   z, label_2E32C
    dec  c

label_2E2B7::
    ld   [hl], d
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    cp   b
    ld   a, b
    ld   h, b
    cp   $0C
    dec  d
    nop
    rst  $18
    ld   bc, label_225
    add  hl, hl
    call nz, label_2408
    jp   nz, label_DF09
    db   $10 ; Undefined instruction
    ld   de, $C229
    add  hl, hl
    dec  c
    ld   b, l
    inc  l
    add  a, d
    ld   b, [hl]
    ldi  [hl], a
    ld   c, b
    jr   z, label_2E325
    nop
    jp   nz, label_2455
    add  a, h
    ld   d, [hl]
    nop
    ld   h, b
    daa
    ld   h, c
    dec  hl
    add  a, h
    ld   h, [hl]
    nop
    ld   [hl], b
    dec  c
    ld   [hl], c
    daa
    ld   [hl], l
    jr   z, label_2E275
    db   $76 ; Halt
    nop
    ld   [hl], d
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ret  z
    jr   z, label_2E34A
    cp   $0C
    sub  a, b
    dec  b
    dec  c
    ld   b, $DF

label_2E301::
    rlca
    dec  h
    add  a, d
    ld   [$C321], sp
    dec  d

label_2E308::
    rst  $18
    ld   d, $25
    rla
    add  hl, hl
    add  a, d
    jr   label_2E31D
    ld   h, $23
    add  a, d
    daa
    dec  c
    add  hl, hl
    and  [hl]
    ld   [hl], $27
    scf
    dec  hl
    add  a, d

label_2E31C::
    jr   c, label_2E32B
    jp   nz, label_D45
    ld   b, [hl]
    rst  $18
    ld   b, a
    daa

label_2E325::
    add  a, d
    ld   c, b
    ldi  [hl], a
    ld   d, [hl]
    dec  c
    add  a, e

label_2E32B::
    ld   d, a

label_2E32C::
    rst  $18
    ld   h, l
    rst  $18
    ld   h, a
    dec  c
    add  a, d
    ld   l, b
    rst  $18
    db   $76 ; Halt
    rst  $18
    add  a, d
    ld   [hl], a
    dec  c
    ld   a, c
    rst  $18

label_2E33B::
    cp   $0C
    sub  a, l
    adc  a, d
    nop
    ld   hl, label_10C3
    dec  c
    inc  de
    xor  [hl]
    inc  d
    and  a
    jr   nz, label_2E2F0

label_2E34A::
    add  a, e
    ld   hl, label_25A7
    and  a
    ld   h, $A6

label_2E351::
    daa
    inc  l
    add  a, d
    jr   z, label_2E378
    inc  sp
    and  a
    jp   label_A734
    jp   nz, label_2437
    ld   b, b
    dec  hl
    add  a, d
    ld   c, b
    ld   hl, label_2A47
    ld   d, b
    inc  hl
    ld   h, b
    daa
    ld   h, c
    dec  hl
    add  a, d
    ld   h, h
    and  [hl]
    add  a, d
    ld   h, a
    dec  c
    ld   [hl], b
    rst  $18
    ld   [hl], c
    daa
    adc  a, b
    ld   [hl], d
    ldi  [hl], a

label_2E378::
    db   $76 ; Halt
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    cp   b
    ld   e, b

label_2E37E::
    jr   nc, label_2E37E
    inc  c
    sub  a, b
    add  a, e

label_2E383::
    nop

label_2E384::
    ld   hl, label_2603
    rst  0
    inc  b
    rst  $18
    dec  b
    dec  c
    add  a, d
    db   $10 ; Undefined instruction
    inc  de
    inc  h
    call nz, label_DF15
    add  a, e
    jr   nz, label_2E3B9
    inc  hl
    jr   z, label_2E31C
    jr   nc, label_2E3A1
    ldd  [hl], a
    and  [hl]
    inc  sp
    rst  $18
    add  a, e

label_2E3A1::
    ld   b, b
    ld   hl, $9841
    ld   b, e
    ld   h, $82
    ld   d, b
    dec  b
    ld   d, d
    dec  c
    ld   d, e
    inc  h
    jp   nz, label_D55
    add  a, d
    ld   h, b
    dec  b
    ld   h, d
    inc  l
    ld   h, e
    jr   z, label_2E33B

label_2E3B9::
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], d
    jr   z, label_2E431
    rst  $18
    ld   [hl], h
    dec  c
    ld   [de], a
    cp   [hl]
    pop  hl
    ld   a, [bc]
    sub  a, b
    ld   e, b
    ld   d, b
    cp   $04
    dec  b
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2011
    jp   nz, label_2412
    jp   nz, label_AC13
    jp   label_D14
    jp   label_D15
    jp   nz, label_AC16
    jp   nz, label_2317
    jp   label_2018
    ldd  [hl], a
    ld   a, [hli]
    inc  sp
    ld   h, $36
    dec  h
    scf
    add  hl, hl
    ld   b, e
    ld   a, [hli]
    add  a, d
    ld   b, h
    sub  a, a
    ld   b, [hl]
    add  hl, hl
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2E473
    rst  $18
    ld   [hl], c
    daa
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  b
    db   $76 ; Halt
    inc  l
    ld   a, b
    jr   z, label_2E489
    rst  $18
    cp   $04
    dec  b
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  b
    ld   b, $2A
    jp   label_D46
    add  a, e
    ld   d, l
    dec  c
    ld   h, b
    daa
    ld   h, c
    dec  hl

label_2E425::
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2E49A
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2E4A9
    rst  $18

label_2E431::
    ld   d, [hl]
    set  4, b
    nop
    jp   [hl]
    ld   l, b

label_2E437::
    jr   nc, label_2E437
    inc  b
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h
    ld   h, e
    dec  c
    ldd  [hl], a
    dec  h
    add  a, h
    inc  sp
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2E4D3
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   de, label_3268
    cp   $0C
    sub  a, b
    nop
    ld   hl, label_2601
    db   $10 ; Undefined instruction
    ld   de, label_122A
    ld   hl, label_2613
    jr   nz, label_2E425
    add  a, d
    ld   hl, label_2305
    ld   a, [hli]
    inc  h
    ld   h, $30
    ld   bc, label_3182
    dec  b
    jp   label_2434
    ld   b, b
    or   b
    add  a, e
    ld   b, c

label_2E489::
    dec  b
    add  a, h
    ld   d, b
    dec  b
    add  a, h
    ld   h, b
    ldi  [hl], a
    ld   h, h
    jr   z, label_2E4C6
    cp   [hl]
    pop  hl
    ld   a, [bc]
    adc  a, l
    ld   c, b
    ld   h, b
    cp   $04
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h
    ld   h, e
    dec  c
    ldd  [hl], a
    dec  h
    add  a, h
    inc  sp

label_2E4A9::
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2E534
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   sp, label_2D268

label_2E4C6::
    cp   $04
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h
    ld   h, e
    dec  c
    ldd  [hl], a

label_2E4D3::
    dec  h
    add  a, h
    inc  sp
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2E561
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    adc  a, b
    ld   e, b
    ld   d, d
    cp   $04
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h
    ld   h, e
    dec  c
    ldd  [hl], a
    dec  h
    add  a, h
    inc  sp
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2E58E
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    db   $E8 ; add  sp, d
    jr   c, label_2E582
    cp   $0C
    dec  c
    rlca
    rst  0

label_2E525::
    ld   [bc], a
    sbc  a, c
    ld   [de], a
    sbc  a, d
    ld   de, label_21C5
    add  a, $C2
    inc  de
    db   $10 ; Undefined instruction
    inc  d
    dec  de
    add  a, l

label_2E534::
    inc  h
    ld   [de], a
    ld   h, $0D

label_2E538::
    ld   sp, label_3313
    inc  d
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   a, [bc]

label_2E541::
    ld   c, b
    ldi  [hl], a
    cp   $07
    dec  c
    adc  a, b
    ld   de, $C300
    ldi  [hl], a
    nop
    jp   label_28
    add  a, e
    inc  [hl]
    nop
    ld   [bc], a
    rst  0
    rlca
    rst  0
    ld   [hl], d
    ret  z
    ld   [hl], a
    ret  z
    jr   nz, label_2E525
    ld   d, b
    ret
    add  hl, hl
    jp   z, label_CA59
    call nz, label_CF11
    add  a, h
    inc  h
    pop  de
    jp   nz, label_D037
    jp   nz, label_CF23
    add  a, h

label_2E56F::
    ld   b, e
    jp   nc, label_2D287
    db   $D3 ; Undefined instruction
    ld   h, d
    rrca
    ld   d, c
    call label_FD74
    ld   [rJOYP], a
    or   e
    ld   e, b
    ld   d, d
    cp   $04
    dec  c

label_2E582::
    adc  a, b

label_2E583::
    ld   de, $8800
    ld   hl, $8800
    ld   sp, label_2CD
    rst  0
    rlca

label_2E58E::
    rst  0
    ld   d, [hl]
    adc  a, $74
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    sub  a, e
    ld   c, b
    ld   h, d
    cp   $04
    dec  c
    ld   [bc], a
    sbc  a, c
    add  a, $11
    jr   nz, label_2E5B3
    sbc  a, d
    add  a, l
    inc  de
    jr   nz, label_2E5BE
    push bc
    add  a, d
    ldi  [hl], a
    jr   nz, label_2E5D1
    jr   nz, label_2E56F
    daa
    jr   nz, label_2E5D8
    add  a, $32
    jr   nz, label_2E538
    inc  sp
    rrca
    call nz, label_2038
    add  a, h
    ld   b, e
    rrca
    add  a, h
    ld   d, e

label_2E5BE::
    rrca
    ld   d, e
    and  [hl]
    ld   d, [hl]
    xor  e
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   h, l
    ld   c, b
    ldd  [hl], a
    cp   $04
    dec  c
    add  a, l
    ld   de, $850F

label_2E5D1::
    ld   hl, $850F
    ld   sp, $850F
    ld   b, c

label_2E5D8::
    rrca
    ld   hl, label_31C5
    add  a, $23
    push bc
    inc  sp
    add  a, $C2
    jr   label_2E58A
    add  a, d
    ld   h, c
    jr   nz, label_2E630
    ret  nz
    ld   l, b
    ret  nz
    ld   d, a
    sbc  a, e
    ld   e, b

label_2E5EE::
    sbc  a, h
    rlca
    sbc  a, c
    rla
    sbc  a, d
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    and  d
    ld   e, b
    ld   d, d
    cp   $0C
    dec  b
    add  a, d
    nop
    nop
    stop
    add  a, d
    ld   [label_1900], sp
    nop
    add  a, d
    ld   [hl], b
    nop
    ld   h, b
    nop
    add  a, d
    ld   a, b
    nop
    ld   l, c
    nop
    ld   [bc], a
    dec  h
    ld   de, label_2025
    dec  h
    rlca
    ld   h, $18
    ld   h, $29
    ld   h, $50
    daa
    ld   h, c
    daa
    ld   [hl], d
    daa
    ld   e, c
    jr   z, label_2E68E
    jr   z, label_2E69F
    jr   z, label_2E63C
    add  hl, hl
    ld   hl, label_1729
    ld   a, [hli]
    jr   z, label_2E65B
    ld   d, c
    dec  hl
    ld   h, d
    dec  hl
    ld   e, b
    inc  l
    ld   h, a
    inc  l
    add  a, h
    inc  sp
    dec  de

label_2E63C::
    add  a, h
    ld   b, e
    dec  de
    add  a, d
    ld   d, h
    dec  de
    inc  h
    rrca
    ld   d, a
    rrca
    dec  [hl]
    set  4, b
    nop
    and  b
    ld   e, b
    ld   [hl], d
    cp   $04
    cpl
    ld   de, $8525
    ld   [de], a
    ld   hl, label_2617
    jp   nz, label_2321
    jp   nz, label_2427
    ld   b, c
    daa
    add  a, l
    ld   b, d
    ldi  [hl], a
    ld   b, a
    jr   z, label_2E5EE
    ld   h, c
    dec  c
    add  a, h
    ldi  [hl], a
    jr   nz, label_2E691
    dec  c
    add  a, d
    ld   h, c
    jr   nz, label_2E6B3
    sbc  a, b
    inc  de
    rst  0
    add  a, l
    ldd  [hl], a
    dec  c
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    add  a, d
    ld   e, b
    ld   d, d
    cp   $04
    ld   c, l
    push bc
    db   $10 ; Undefined instruction
    inc  bc
    sbc  a, c
    add  a, h
    dec  b
    sbc  a, c
    inc  de
    sbc  a, d
    add  a, h
    dec  d
    sbc  a, d
    inc  hl

label_2E68E::
    push bc
    add  a, h
    dec  h

label_2E691::
    push bc
    inc  sp
    add  a, $84
    dec  [hl]
    add  a, $52

label_2E698::
    ret  nz
    ld   b, d
    sbc  a, e
    ld   b, e
    sbc  a, h
    add  a, h
    ld   b, l

label_2E69F::
    adc  a, $84
    ld   d, l
    ret  nz
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    add  a, d
    ld   a, b
    ld   d, d
    cp   $04
    dec  c
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   de, label_21C5
    add  a, $83
    ld   h, c
    ret  nz
    ld   h, d
    adc  a, $C4
    rla
    jr   nz, label_2E682
    jr   label_2E6DE
    ld   b, $99
    ld   d, $9A
    inc  h
    ret  nz
    dec  h
    sbc  a, e
    ld   h, $9C
    add  a, d
    dec  [hl]
    ret  nz
    ld   [rJOYP], a
    and  c
    jr   c, label_2E712
    cp   $04
    dec  c
    ld   [hl], h

label_2E6D4::
    db   $FD ; Undefined instruction
    add  a, $11
    jr   nz, label_2E69F
    ld   [de], a
    jr   nz, label_2E6DF
    sbc  a, c
    inc  de

label_2E6DE::
    sbc  a, d

label_2E6DF::
    inc  hl
    push bc
    inc  sp
    add  a, $44
    sbc  a, e
    ld   b, l
    sbc  a, h
    add  a, d
    ld   h, h

label_2E6E9::
    rrca
    ld   [rJOYP], a
    jr   nc, label_2E766
    ldd  [hl], a
    cp   $04
    dec  c
    ld   [hl], h
    db   $FD ; Undefined instruction
    add  a, [hl]
    ld   [bc], a
    sbc  a, c
    add  a, [hl]
    ld   [de], a

label_2E6F9::
    sbc  a, d
    ld   hl, label_229B
    sbc  a, h
    add  a, d
    ld   h, $C5
    add  a, d
    ld   [hl], $C6
    jr   z, label_2E6D4
    ld   d, c
    adc  a, $41
    ret  nz
    ld   h, c
    ret  nz
    add  a, h
    ld   d, e
    rrca
    add  a, h
    ld   h, e
    rrca

label_2E712::
    add  a, d
    ld   d, a
    jr   nz, label_2E698
    ld   h, a
    jr   nz, label_2E6F9
    nop
    or   c
    ld   c, b
    ld   h, d
    cp   $04
    rrca
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    ldi  [hl], a
    inc  l
    daa
    dec  hl
    ld   d, d
    ld   a, [hli]
    ld   d, a
    add  hl, hl
    add  a, h
    inc  sp
    dec  c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    inc  hl
    ldi  [hl], a
    add  a, h
    ld   d, e
    ld   hl, label_32C2
    inc  h
    jp   nz, label_2337
    dec  [hl]
    push bc
    ld   b, l
    add  a, $54
    sbc  a, b
    inc  sp
    rla
    inc  [hl]
    ld   [de], a
    ld   [hl], $16
    ld   b, e
    dec  d
    ld   b, [hl]
    inc  d
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    add  a, e
    jr   z, label_2E79B
    cp   $04
    dec  b
    ld   de, label_14A6
    and  [hl]
    add  hl, de
    ld   a, [hli]
    inc  hl
    and  [hl]
    dec  h
    jr   nz, label_2E6E9
    ld   h, $A7
    jp   nz, label_529
    inc  [hl]
    jr   nz, label_2E7A4
    and  a
    scf
    and  a
    ld   c, c
    inc  l
    ld   b, c
    and  a
    add  a, d
    ld   b, e
    and  a
    ld   b, [hl]
    and  a
    ld   c, b
    and  a
    add  a, d
    ld   d, d
    and  a
    ld   d, a
    and  a

label_2E782::
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   h, d
    and  [hl]
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2E7FD
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2E80C
    rst  $18
    inc  de
    dec  c
    jr   label_2E7A5
    ldi  [hl], a
    dec  c
    add  a, d

label_2E79B::
    ld   sp, label_2C50D
    dec  c
    ld   b, a
    dec  c
    ld   h, h
    dec  c
    add  a, d

label_2E7A4::
    ld   h, [hl]

label_2E7A5::
    dec  c
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   d, b
    adc  a, b
    ldd  [hl], a
    cp   $04
    sbc  a, l
    nop
    rst  $18
    add  a, e
    inc  bc

label_2E7B4::
    rst  $18
    add  a, e
    rlca
    rst  $18
    add  a, h
    db   $10 ; Undefined instruction
    inc  d
    ld   h, $15
    rst  $18
    rla
    rst  $18
    jp   label_DF19
    add  a, h
    jr   nz, label_2E7CC
    inc  h
    ld   a, [hli]
    dec  h
    ld   h, $C4

label_2E7CC::
    ld   h, $DF
    add  a, h
    jr   nc, label_2E7D6
    add  a, d
    ld   b, b
    ldi  [hl], a
    ld   b, d
    dec  hl

label_2E7D6::
    inc  sp
    dec  b
    push bc
    inc  [hl]
    dec  b
    push bc
    dec  [hl]
    inc  h
    call nz, label_DF38
    ld   b, e
    dec  b
    ld   d, d
    daa
    ld   d, e
    dec  hl
    ld   b, a
    rst  $18
    ld   d, c
    rst  $18
    jp   nz, label_2363
    ld   e, c
    rst  $18
    add  a, e
    ld   h, b
    rst  $18
    ld   h, a
    rst  $18
    add  a, d
    ld   [hl], b
    rst  $18
    add  a, d
    db   $76 ; Halt
    rst  $18
    cp   $04

label_2E7FD::
    dec  c
    ld   de, label_31C0
    ret  nz
    ld   hl, label_34CE
    adc  a, $24
    ret  nz
    jp   nz, label_2025
    add  a, h

label_2E80C::
    ld   b, l
    jr   nz, label_2E870
    xor  h
    ld   l, b
    xor  h
    rla
    push bc
    daa
    add  a, $08
    sbc  a, c
    jr   label_2E7B4
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   b, l
    adc  a, b
    ld   b, d
    cp   $04
    dec  h
    add  a, d
    ld   [hl], b
    dec  b
    ld   d, $0D
    add  hl, de
    dec  c
    ldi  [hl], a
    dec  c
    add  a, d
    daa
    dec  c
    ld   sp, $C20D
    jr   c, label_2E842
    ld   c, c
    dec  c
    add  a, d
    ld   b, d
    dec  c
    ld   d, l
    dec  c
    ld   l, c
    dec  c
    ld   h, b
    daa
    ld   h, c
    ldi  [hl], a

label_2E842::
    ld   h, d
    dec  hl
    ld   [hl], d
    daa
    ld   b, c
    rst  $18
    add  a, h
    ld   d, c
    rst  $18
    add  a, e
    ld   h, e
    rst  $18
    inc  d
    rst  $18
    add  a, d
    inc  h
    rst  $18
    add  hl, hl
    rrca
    ld   d, e
    rrca
    ld   h, [hl]
    rrca
    add  a, d
    ld   de, $C2B0
    inc  de
    ld   bc, $B033
    add  a, e
    inc  [hl]
    xor  [hl]
    scf
    xor  a
    ld   b, a
    ld   bc, $B057
    add  a, d
    ld   e, b
    xor  [hl]
    rla
    and  b
    ld   c, b

label_2E870::
    dec  d
    ld   c, c
    inc  de
    add  a, d
    ld   l, b
    ld   [de], a
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    jr   nz, label_2E804
    ldd  [hl], a
    cp   $04
    ld   b, l
    inc  de
    inc  l

label_2E882::
    add  a, h
    inc  d
    ldi  [hl], a
    jr   label_2E8B2
    jp   nz, label_2423
    jp   nz, label_2328
    ld   b, e
    ld   a, [hli]
    add  a, h
    ld   b, h
    ld   hl, label_2948
    add  a, d
    ld   d, b
    xor  [hl]
    ldi  [hl], a
    xor  a
    jp   nz, label_132
    ld   d, d
    or   b
    add  a, e
    db   $10 ; Undefined instruction
    jr   nz, label_2E8B0
    inc  [hl]

label_2E8A4::
    rrca
    ld   d, a
    rrca
    dec  h

label_2E8A8::
    dec  c
    ld   b, b
    dec  c
    ld   h, b
    dec  c
    ld   d, h
    dec  c
    ld   b, l

label_2E8B0::
    sbc  a, b
    ld   l, c

label_2E8B2::
    jr   z, label_2E91C
    inc  l
    ld   a, b
    jr   z, label_2E931
    dec  b
    ld   b, b
    inc  de
    ld   b, c
    inc  d
    add  a, d
    ld   h, b
    ld   [de], a
    inc  h
    rla
    add  a, d
    dec  h
    ld   [de], a
    ld   h, $A0
    daa
    ld   d, $36
    jr   nz, label_2E903
    inc  d
    inc  [hl]
    dec  d
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   hl, label_3218
    cp   $04
    dec  c
    inc  b
    sbc  a, c
    add  a, e
    ld   de, $830F
    ld   hl, $830F
    ld   sp, label_120F
    push bc
    inc  d
    sbc  a, d
    jp   nz, label_1115
    add  a, e
    ld   d, $20
    ldi  [hl], a
    add  a, $24
    inc  de
    add  a, e
    ld   h, $20
    inc  [hl]
    ld   de, label_2C182
    ld   [de], a
    ld   b, h
    sub  a, e
    ld   d, [hl]
    ret  nz
    ld   d, a
    adc  a, $72
    ret  z
    ld   [hl], a

label_2E903::
    ret  z
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ccf
    jr   z, label_2E92D
    cp   $05
    sub  a, b
    adc  a, d
    nop
    ld   a, b
    ld   bc, label_379
    ld   a, c
    dec  b
    ld   a, c
    rlca
    ld   a, c
    add  hl, bc
    ld   a, c
    adc  a, d

label_2E91C::
    db   $10 ; Undefined instruction
    add  a, d
    jr   label_2E99D
    adc  a, b
    jr   nz, label_2E8A4
    adc  a, d
    jr   nc, label_2E8A8
    adc  a, d
    ld   b, b
    add  a, c
    adc  a, d
    ld   d, b

label_2E92C::
    add  a, c

label_2E92D::
    adc  a, d
    ld   h, b
    add  a, c
    jr   z, label_2E991
    add  hl, hl

label_2E933::
    ld   h, b
    jr   c, label_2E988
    add  hl, sp
    ld   d, h
    ld   c, c
    ld   d, c
    ld   d, a
    ld   [hl], d
    ld   e, b
    ld   d, b
    ld   e, c
    ld   d, h
    ld   h, c
    ld   [hl], d
    ld   h, [hl]
    ld   [hl], d
    ld   h, a
    ld   d, b
    add  a, d
    ld   l, b
    ld   d, h
    add  a, a
    ld   [hl], b
    ld   d, e
    add  a, e
    ld   [hl], a
    ld   d, h
    ld   [rJOYP], a
    add  a, c
    ld   l, b
    ld   h, b
    cp   $00
    sub  a, c
    ret  z
    nop
    dec  c
    nop
    ld   hl, label_2601
    add  a, $11
    inc  h

label_2E961::
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], c
    jr   z, label_2E92C
    db   $10 ; Undefined instruction
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    ld   [hl], a
    jr   z, label_2E933
    ld   b, d
    inc  hl
    jp   label_2447
    ldd  [hl], a
    dec  h
    scf
    ld   h, $84
    inc  sp
    ld   hl, label_2C384
    dec  b
    add  a, h
    ld   d, e
    dec  b
    add  a, h
    ld   h, e
    dec  b
    ld   d, h
    rrca
    ld   [hl], h

label_2E988::
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    and  c
    ld   e, b
    ld   b, d
    cp   $04
    dec  b

label_2E991::
    add  a, h
    inc  hl
    ld   bc, label_2C186
    ld   bc, label_2C383
    ld   bc, label_2D183
    ld   bc, label_3188
    xor  a
    ld   [hl], $01
    add  a, h
    inc  de
    ld   bc, label_2E183
    ld   bc, label_2D483
    or   b
    add  a, d
    ld   b, a
    or   b
    add  a, d
    ld   de, $820D
    ld   hl, $820D
    rla
    dec  c
    add  a, e
    inc  sp
    ld   bc, label_D28
    ld   h, l
    dec  c
    ld   h, a
    dec  c
    ld   de, label_18A0
    and  [hl]
    ld   l, b
    and  [hl]
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   b, d
    jr   c, label_2EA0F
    cp   $04
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h

label_2E9D7::
    ld   h, e
    dec  c
    ldd  [hl], a
    dec  h
    add  a, h
    inc  sp
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2EA68
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    and  h
    jr   c, label_2EA3C
    cp   $04
    dec  c
    add  a, h
    inc  bc
    sbc  a, e
    jp   nz, label_B313
    add  a, d
    inc  d
    inc  bc
    jp   nz, label_B516
    add  a, d
    inc  h
    or   h
    jr   nz, label_2E9D7
    ld   d, b

label_2EA0F::
    ret
    add  hl, hl

label_2EA11::
    jp   z, label_CA59
    ldi  [hl], a
    sbc  a, h
    ld   h, c
    sbc  a, h
    ld   b, a
    adc  a, $84
    ld   d, e
    rrca
    add  a, h
    ld   h, e
    rrca
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    scf
    ld   c, b
    ld   b, d
    cp   $04
    dec  l
    add  a, e
    nop
    rst  $18
    add  a, e
    db   $10 ; Undefined instruction
    jr   nz, label_2EA11
    inc  bc
    dec  h
    inc  de
    inc  hl
    ld   hl, label_2225
    ld   hl, label_2923

label_2EA3C::
    jr   nc, label_2EA63
    ld   sp, label_1429
    rrca
    ldd  [hl], a
    rrca
    ld   d, c
    rrca
    ld   h, d
    rrca
    dec  d
    dec  b
    jr   label_2EA51
    inc  sp
    dec  b
    ld   b, c
    dec  b
    ld   d, d

label_2EA51::
    dec  b
    ld   h, c
    dec  b
    ld   h, a
    dec  b
    add  a, l
    dec  h
    xor  [hl]
    inc  [hl]
    xor  [hl]
    ld   b, e
    xor  a
    jp   nz, label_153
    add  a, e
    ld   d, a
    xor  [hl]

label_2EA63::
    ld   d, [hl]
    xor  a
    ld   h, [hl]
    ld   bc, $AC29
    ld   e, c
    xor  h
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    rla
    jr   c, label_2EAA4
    cp   $04
    ld   c, l
    adc  a, c
    ld   h, b
    rst  $18
    add  a, d
    ld   h, b
    dec  c
    ld   [$C226], sp
    add  hl, bc
    rst  $18
    jr   label_2EAA6
    jr   z, label_2EAAE
    add  hl, hl
    ld   h, $11
    dec  b
    jp   nz, label_517
    jr   c, label_2EA92
    add  a, h
    ld   [de], a
    rst  $18
    inc  h
    rst  $18

label_2EA92::
    add  a, d
    inc  sp
    rst  $18
    ld   b, [hl]
    rst  $18
    add  a, e
    ld   d, l
    rst  $18
    add  a, h
    jr   nz, label_2EA4B
    add  a, e
    ld   d, b
    xor  [hl]
    ld   b, e
    xor  a
    ld   d, e
    or   b

label_2EAA4::
    jp   label_A716
    ldd  [hl], a
    and  a
    dec  [hl]

label_2EAAA::
    and  a
    jp   nz, label_A744

label_2EAAE::
    ld   b, a
    and  a
    ld   e, b
    and  a
    ld   h, l
    and  a
    dec  h
    db   $45
    ld   b, l

label_2EAB7::
    db   $48
    ld   c, b
    db   $64
    ld   h, h
    db   $37
    scf
    cp   [hl]
    pop  hl
    ld   a, [bc]
    cp   b
    jr   c, label_2EB05
    jr   nz, label_2EA71
    ld   d, b
    xor  h
    cp   $04
    sbc  a, l
    adc  a, d
    nop
    rst  $18
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    ld   h, b
    rst  $18
    adc  a, d
    ld   [hl], b
    rst  $18
    jr   nz, label_2EAB7
    ld   hl, $8825
    ldi  [hl], a
    ld   hl, label_2530
    ld   sp, label_2C029
    inc  hl
    ld   d, b
    daa
    adc  a, c
    ld   d, c
    ldi  [hl], a
    jr   c, label_2EAEF
    add  hl, sp
    rrca
    ld   b, d
    dec  b
    ld   b, h

label_2EAEF::
    dec  b
    ld   c, c
    dec  b
    ld   b, [hl]
    rrca
    inc  sp
    set  4, c
    ld   a, [bc]
    or   a
    ld   a, b
    ld   b, d

label_2EAFB::
    cp   $04
    sbc  a, l
    adc  a, d
    nop
    rst  $18
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d

label_2EB05::
    ld   h, b
    rst  $18
    adc  a, d
    ld   [hl], b
    rst  $18
    ld   e, c
    rst  $18
    adc  a, c
    jr   nz, label_2EB30
    add  hl, hl
    ld   h, $33
    rrca
    dec  [hl]
    dec  b
    ld   b, b
    dec  b
    ld   b, d
    dec  b
    ld   b, a
    dec  b
    ld   c, b
    inc  l
    ld   c, c
    jr   z, label_2EB78
    jr   z, label_2EAAA
    ld   d, b
    ldi  [hl], a
    ld   b, [hl]
    set  4, c
    ld   a, [bc]
    cp   d
    adc  a, b
    ld   b, d

label_2EB2B::
    add  hl, sp
    inc  h
    cp   $04
    sub  a, l

label_2EB30::
    push bc
    jr   nz, label_2EB56
    jr   nc, label_2EB2B
    jr   nc, label_2EB60
    ld   b, b
    dec  c
    ld   d, b

label_2EB3A::
    dec  hl
    nop
    rst  $18
    ld   bc, $8825
    ld   [bc], a
    ld   hl, label_2604
    add  a, d
    dec  b
    rst  $18
    rlca
    dec  h
    db   $10 ; Undefined instruction
    ld   de, label_1229
    rrca
    inc  d
    ld   a, [hli]
    dec  d
    ld   h, $16
    dec  h
    rla

label_2EB56::
    add  hl, hl
    jr   label_2EB68
    call nz, label_2425
    call nz, label_2326
    ld   d, [hl]

label_2EB60::
    daa
    ld   d, a
    dec  hl
    ld   h, h
    inc  l
    ld   h, l
    jr   z, label_2EBCE

label_2EB68::
    rst  $18
    ld   h, a
    daa
    add  a, d
    ld   l, b
    ldi  [hl], a

label_2EB6E::
    ld   [hl], b
    daa
    add  a, e
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], h
    jr   z, label_2EAFB
    ld   [hl], l
    rst  $18

label_2EB78::
    ld   d, e
    rrca
    jr   c, label_2EB3A
    pop  hl
    ld   a, [bc]
    cp   c
    ld   l, b
    ld   d, d
    cp   $04
    sub  a, l
    adc  a, d
    nop
    ld   hl, label_2F08A
    ldi  [hl], a
    add  a, d
    ld   h, b
    ldi  [hl], a
    ld   h, d
    dec  hl
    add  a, d
    ld   [hl], b
    rst  $18
    ld   [hl], d
    daa
    push bc
    db   $10 ; Undefined instruction
    ld   de, label_2D20D
    dec  c
    ld   h, e
    dec  c
    add  a, d
    ld   l, b
    dec  c
    add  a, d
    jr   label_2EBB0
    daa

label_2EBA4::
    dec  c
    scf
    rrca
    jr   c, label_2EBB6
    add  a, h
    inc  de
    ld   bc, label_2383
    ld   bc, $B026
    inc  sp
    or   b
    jp   nz, label_134

label_2EBB6::
    jp   nz, label_135
    ld   b, [hl]
    xor  a
    ld   c, c
    xor  a
    add  a, [hl]
    ld   d, h
    or   b
    add  a, d
    ld   d, a
    xor  [hl]
    jr   nc, label_2EBD4
    ld   hl, label_2D120
    ld   c, [hl]
    add  a, d
    ld   h, [hl]
    ld   c, [hl]
    jr   z, label_2EB6E

label_2EBCE::
    ld   [hl], $A6
    add  hl, sp
    and  [hl]
    add  a, d
    ld   b, a

label_2EBD4::
    and  [hl]
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    jr   label_2EC43
    ld   [de], a
    cp   $04
    ld   c, l
    ld   [label_1826], sp
    inc  h
    jr   z, label_2EC0F
    add  hl, hl
    ld   h, $C2
    add  hl, bc
    rst  $18
    add  a, d
    ld   de, $C2DF
    inc  de
    and  [hl]
    call nz, label_114
    jp   nz, label_115
    jp   label_DF17
    ld   h, $DF
    add  a, e
    jr   nc, label_2EBA4
    jp   nz, label_133
    dec  [hl]
    or   b
    add  a, e
    ld   b, b
    xor  a
    ld   b, l
    rrca
    jp   nz, label_DF48
    add  a, l
    ld   d, b
    or   b
    ld   d, l

label_2EC0F::
    dec  b
    ld   d, [hl]
    rst  $18
    ld   h, c
    dec  b
    ld   h, h
    rst  $18
    ld   h, l
    rst  $18
    ld   h, a
    dec  b
    ld   l, b
    rrca
    ld   h, c
    ld   c, [hl]
    ld   [hl], d
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    jr   label_2EBAC
    ld   [de], a
    cp   $04
    dec  b
    inc  bc
    add  hl, hl
    inc  b
    dec  b
    dec  b
    ld   a, [hli]
    ld   [label_926], sp
    rst  $18
    add  a, a
    ld   de, label_18DF
    ld   a, [hli]
    add  hl, de
    ld   h, $C5
    ld   hl, label_22DF
    xor  a
    jp   label_DD23
    inc  h
    db   $82

label_2EC43::
    add  a, d
    dec  h
    xor  [hl]
    add  a, d
    daa
    rst  $18
    ldd  [hl], a
    or   b
    inc  [hl]
    and  b
    jp   nz, label_DD35
    add  a, d
    scf
    rst  $18
    ld   b, h
    and  a
    add  a, e
    ld   d, d
    xor  [hl]
    ld   d, l
    and  a
    ld   c, b
    dec  c
    add  a, d
    ld   d, a
    dec  c
    ld   h, [hl]
    inc  l
    add  a, d
    ld   h, a
    ldi  [hl], a
    ld   l, c
    jr   z, label_2ECDD
    jr   z, label_2EBEC
    ld   [hl], a
    rst  $18
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   h, d
    ld   a, b
    ld   b, d

label_2EC72::
    cp   $04
    adc  a, l

label_2EC75::
    add  a, $13
    rst  $18
    call nz, label_DF31
    ldi  [hl], a
    inc  l
    add  a, a
    inc  hl
    ldi  [hl], a
    push bc
    ldd  [hl], a
    inc  h
    call nz, label_1143
    inc  sp
    rla
    inc  [hl]
    ld   [de], a
    dec  [hl]
    inc  l
    add  a, h
    ld   [hl], $22
    call nz, label_2445

label_2EC92::
    ld   b, [hl]
    xor  h
    add  a, e
    ld   b, a
    ld   [de], a
    jp   label_1156
    add  a, e
    ld   d, a
    rrca
    add  a, e
    ld   h, a
    rrca
    add  a, e
    ld   [hl], a
    rrca
    ld   l, b
    and  b
    ld   c, c
    ld   d, $C3
    ld   e, c
    db   $10 ; Undefined instruction
    inc  b
    ld   a, l
    add  a, [hl]
    ld   de, $C4DF
    jr   c, label_2EC92
    add  a, a
    jr   nz, label_2ECD8
    daa
    dec  hl
    push bc
    scf
    inc  hl
    add  a, h
    jr   nc, label_2ECE0
    inc  [hl]
    dec  hl
    dec  [hl]
    ld   [de], a
    ld   [hl], $16
    call nz, label_1046
    call nz, label_2344
    add  a, e
    ld   b, b
    ld   [de], a
    ld   b, e
    xor  h
    jp   label_1053
    add  a, e
    ld   d, b
    rrca
    add  a, e
    ld   h, b
    rrca

label_2ECD8::
    add  a, e
    ld   [hl], b
    rrca
    ld   h, c
    and  b

label_2ECDD::
    ld   b, b
    rla
    jp   label_1150
    cp   $05
    sub  a, h
    add  a, [hl]
    nop
    inc  bc
    add  a, [hl]
    nop
    add  a, b
    add  a, [hl]
    db   $10 ; Undefined instruction
    add  a, [hl]
    jr   nz, label_2EC72
    add  a, [hl]
    jr   nc, label_2EC75
    add  a, [hl]
    ld   b, b
    add  a, c
    add  a, [hl]
    ld   d, b
    add  a, c
    add  a, e
    rlca
    ld   d, h
    add  a, e
    rla
    ld   d, h
    add  a, e
    daa
    ld   d, h
    add  a, h
    ld   [hl], $54
    jp   label_2D106
    dec  [hl]
    ld   d, b
    ld   b, l
    ld   d, d
    add  a, h
    ld   b, [hl]
    ld   e, h
    ld   d, [hl]
    ld   a, l
    add  a, e
    ld   d, a
    add  a, h
    adc  a, d
    ld   h, b
    ld   d, e
    ld   h, c
    ld   d, [hl]
    ld   h, d
    add  a, c
    ld   h, h
    ld   d, b
    adc  a, d
    ld   [hl], b
    ld   d, h
    add  a, d
    ld   [hl], d
    ld   d, e
    dec  h
    ld   [hl], d
    ld   d, b
    ld   [hl], d
    ld   h, e
    ld   [hl], d
    add  a, h
    ld   h, [hl]
    ld   e, e
    ld   [rJOYP], a
    reti
    jr   z, label_2ED92
    cp   $05
    sub  a, h
    add  a, [hl]
    inc  bc
    add  a, b
    add  a, [hl]
    inc  de
    add  a, c
    add  a, [hl]
    inc  hl
    add  a, c
    add  a, [hl]
    inc  sp
    add  a, c
    add  a, [hl]
    ld   b, e
    add  a, c
    add  a, [hl]
    ld   d, e
    add  a, c
    call nz, label_2D400
    call nz, label_2D401
    jp   label_2D702
    ldd  [hl], a
    ld   d, h
    inc  sp
    ld   d, [hl]
    add  a, e
    ld   b, b
    ld   e, h
    ld   b, e
    ld   e, b
    add  a, d
    ld   d, b
    add  a, h
    ld   d, d
    ld   a, [hl]
    add  a, e
    ld   h, b
    ld   e, e
    ld   h, e
    ld   d, e
    adc  a, d
    ld   [hl], b
    ld   d, h
    ld   l, b
    ld   d, h
    jp   label_2D449
    call nz, label_2D109
    ld   c, b
    ld   d, b
    ld   e, b
    ld   d, c
    ld   h, a
    ld   d, b
    ld   h, l
    add  a, c
    add  a, d
    ld   [hl], l
    ld   d, e
    inc  hl
    ld   [hl], d
    jr   c, label_2EDEF
    ld   d, h
    ld   [hl], d
    ld   d, a
    ld   [hl], d
    ld   h, [hl]
    ld   [hl], d
    ld   h, h
    ld   d, [hl]
    ld   [rJOYP], a
    reti
    ld   c, b
    ld   h, b
    cp   $04
    adc  a, l
    add  a, d
    nop
    inc  bc
    ld   [bc], a
    dec  h

label_2ED92::
    inc  b
    rst  0
    ld   [label_10C7], sp
    inc  bc
    ld   de, label_1225
    add  hl, hl
    add  a, a
    inc  de
    rrca
    jr   nz, label_2EDC6
    ld   hl, label_2229
    rrca
    inc  hl
    sub  a, [hl]
    add  a, [hl]
    inc  h
    inc  de

label_2EDAA::
    ld   sp, label_32AC
    inc  de
    inc  sp
    inc  d
    inc  [hl]
    dec  h
    add  a, l
    dec  [hl]
    ld   hl, label_2940
    ld   b, c
    dec  h
    add  a, d
    ld   b, d
    ld   hl, label_2944
    ld   b, l
    xor  h
    ld   d, b
    dec  h
    ld   d, c
    add  hl, hl
    ld   h, c
    xor  h

label_2EDC6::
    ld   [hl], e
    ret  nz
    db   $76 ; Halt
    ret  nz
    ld   a, c
    inc  l
    ld   b, $A3
    pop  hl
    inc  d
    push bc
    ld   c, b
    db   $10 ; Undefined instruction
    inc  b
    ld   c, l
    rlca
    ld   h, $82
    ld   [$8703], sp
    db   $10 ; Undefined instruction
    rla
    ld   a, [hli]
    jr   label_2EE08
    add  hl, de
    inc  bc
    add  a, [hl]
    jr   nz, label_2EDFA
    ldi  [hl], a
    dec  c
    ld   h, $95
    daa
    rrca
    jr   z, label_2EE19

label_2EDEF::
    add  hl, hl
    ld   h, $85
    jr   nc, label_2EE15
    ldd  [hl], a
    sbc  a, b

label_2EDF6::
    dec  [hl]
    ld   h, $36
    dec  d

label_2EDFA::
    scf
    inc  de
    jr   c, label_2EDAA
    ld   b, h
    xor  h
    ld   b, l
    ld   a, [hli]
    add  a, d
    ld   b, [hl]
    ld   hl, label_2648
    ld   c, c

label_2EE08::
    ld   a, [hli]
    ld   d, a
    xor  h
    ld   e, b
    ld   a, [hli]
    ld   e, c
    ld   h, $67
    rrca
    ld   l, b
    xor  d
    cp   $04

label_2EE15::
    ld   [hl], e
    add  a, l
    nop
    inc  bc

label_2EE19::
    jp   label_359
    dec  b
    dec  h
    jp   nz, label_2315
    dec  [hl]
    daa
    ld   [hl], $2B
    ld   b, [hl]
    inc  hl
    ld   d, e
    dec  h
    add  a, d
    ld   d, h
    ld   hl, label_2956
    jp   nz, label_2458
    ld   a, b
    jr   z, label_2EDF6
    ld   h, e
    inc  hl
    ld   [hl], l
    inc  l
    add  a, d
    db   $76 ; Halt
    ldi  [hl], a
    ld   d, $AB
    jp   nz, label_D17
    ld   h, $0D
    jp   nz, label_D28
    jp   label_D37

label_2EE48::
    add  a, d
    ld   h, h
    dec  c
    add  a, d
    ld   h, [hl]
    dec  c
    ld   [hl], h
    dec  c
    ld   c, b
    inc  l
    ld   c, c
    jr   z, label_2EE6D
    set  0, d
    rla
    rlca
    ld   h, $07
    jp   nz, label_728
    jp   label_737
    add  a, d
    ld   h, h
    rlca
    add  a, d
    ld   h, [hl]
    rlca
    ld   [hl], h
    rlca
    ld   [rJOYP], a
    ld   c, d
    adc  a, b

label_2EE6D::
    jr   nc, label_2EE6D
    inc  b
    dec  c
    inc  bc
    rst  0
    dec  b
    rst  0
    nop
    inc  bc
    ld   bc, label_1025
    dec  h
    ld   de, label_1429
    rrca
    jr   nz, label_2EEAA
    adc  a, c
    ld   hl, label_2413
    dec  c
    jr   nc, label_2EEAD
    adc  a, b
    ld   sp, label_3921
    ld   h, $34
    sbc  a, b
    ld   d, d
    xor  h
    ld   d, a
    xor  h
    add  hl, bc
    ld   hl, label_D19
    ldd  [hl], a
    sub  a, b
    scf
    sub  a, b
    inc  b
    and  d
    pop  hl
    inc  d
    jp   nz, label_1068
    cp   $04
    ld   c, l
    ld   [hl], h
    pop  af
    ld   bc, label_229

label_2EEAA::
    dec  h
    rst  0
    ld   de, $C510
    jr   nc, label_2EEC2
    jr   nz, label_2EE48
    add  a, $12
    inc  hl
    ld   [hl], d
    daa
    ld   h, a
    inc  l
    ld   l, b
    ldi  [hl], a
    ld   l, c
    jr   z, label_2EF36
    jr   z, label_2EE43
    ld   a, b

label_2EEC2::
    inc  bc
    push bc
    inc  hl
    rst  $18
    add  a, [hl]
    inc  de
    rst  $18
    call nz, label_DF28
    inc  de
    xor  h
    jr   label_2EE7C
    cp   $04
    dec  c
    nop
    rla
    ld   bc, label_212
    sbc  a, c
    inc  bc
    ld   d, $C2
    db   $10 ; Undefined instruction
    inc  de
    db   $10 ; Undefined instruction
    inc  d
    ld   [de], a
    sbc  a, d
    ld   de, label_21C5
    add  a, $04
    dec  h
    jr   nc, label_2EF11
    jp   nz, label_2314
    add  a, e
    ld   sp, label_3421
    add  hl, hl
    ldd  [hl], a

label_2EEF5::
    sbc  a, b
    jp   label_2041
    rla
    and  a
    daa
    adc  a, $57
    adc  a, $28
    ret  nz
    scf
    ret  nz
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    sub  a, $48
    ld   d, b

label_2EF0A::
    cp   $04
    sbc  a, l
    nop
    nop
    ld   bc, $8725
    ld   [bc], a
    ld   hl, label_2609
    inc  b
    ld   h, $05
    dec  h
    db   $10 ; Undefined instruction
    ld   de, $C329
    inc  d
    inc  h
    jp   nz, label_2315
    add  hl, de
    inc  h
    ld   b, b
    daa
    ld   b, c
    dec  hl
    jp   label_2350
    ld   b, e
    inc  l
    ld   b, h

label_2EF30::
    jr   z, label_2EEF5
    ld   d, e
    inc  h
    dec  [hl]
    daa

label_2EF36::
    ld   [hl], $2B
    ld   b, [hl]
    inc  hl
    ld   d, l
    dec  h
    ld   d, [hl]
    add  hl, hl
    jp   nz, label_2365
    jr   z, label_2EF6F
    add  hl, hl
    jr   z, label_2EF0A
    jr   c, label_2EF6C
    ld   [hl], a
    inc  l
    ld   a, b
    jr   z, label_2EF11
    ld   d, b
    nop
    ld   b, l
    nop
    jp   label_54
    push bc
    add  hl, sp
    nop
    ldi  [hl], a
    and  b
    ld   d, d
    xor  [hl]
    ld   h, d
    and  a
    jp   nz, label_2320
    jp   label_2351
    jr   label_2EF30
    pop  hl
    ld   de, label_28CA

label_2EF69::
    jr   nz, label_2EF69
    inc  b

label_2EF6C::
    sub  a, b
    add  a, h
    ld   b, [hl]

label_2EF6F::
    dec  b
    add  a, h
    ld   d, [hl]
    dec  b
    add  a, h
    ld   h, [hl]
    dec  b
    add  a, $00
    inc  h
    ld   h, b
    ld   a, [hli]
    add  a, d
    ld   h, c
    ld   hl, label_2963
    inc  bc
    dec  h
    ld   [de], a
    dec  h
    inc  de
    add  hl, hl
    jp   nz, label_2322
    ld   b, d
    daa
    ld   b, e
    dec  hl
    ld   d, e
    inc  hl
    add  a, [hl]
    inc  b
    ld   hl, label_2535
    ld   b, h
    dec  h
    ld   b, l
    add  hl, hl
    add  a, h
    ld   [hl], $21
    scf
    sbc  a, b
    jp   nz, label_2354
    ld   [hl], h
    daa
    add  a, l
    ld   [hl], l
    ldi  [hl], a
    add  a, l
    dec  h
    inc  de
    add  a, [hl]
    inc  d
    dec  c
    add  a, d
    inc  hl
    dec  c
    daa
    dec  c
    inc  [hl]
    xor  h
    add  a, d
    ld   b, a
    dec  c
    ld   d, l
    dec  c
    ld   d, a
    dec  c
    ld   e, b
    rrca
    add  a, d
    ld   h, l
    dec  c
    ld   l, b
    dec  c
    inc  sp
    dec  c
    ld   [hl], a
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    add  a, $38
    ld   d, b
    cp   $04
    sub  a, b
    adc  a, b
    ld   b, b
    dec  b
    adc  a, b
    ld   d, b
    dec  b
    adc  a, b
    ld   h, b
    dec  b
    adc  a, b
    ld   [hl], b
    dec  b
    add  a, e
    nop
    ld   hl, label_2603
    inc  de
    ld   a, [hli]
    inc  d
    ld   h, $24
    ld   a, [hli]
    dec  h
    ld   hl, label_6C2
    inc  hl
    ld   h, $29
    ld   de, $840D
    jr   nz, label_2F002
    add  a, a
    jr   nc, label_2F013
    scf
    ld   h, $47
    ld   a, [hli]
    ld   c, b
    ld   h, $C2
    ld   e, b
    inc  h
    adc  a, b
    ld   [hl], b
    ldi  [hl], a
    ld   b, b
    dec  c
    ld   b, d
    dec  c

label_2F002::
    ld   b, [hl]
    dec  c
    add  a, d
    ld   d, h
    dec  c
    ld   h, d
    dec  c
    add  a, e
    ld   h, l
    dec  c
    ld   b, e
    rrca
    ld   h, [hl]
    rrca
    ld   a, b
    jr   z, label_2F025

label_2F013::
    cp   [hl]
    pop  hl
    ld   de, $88C8

label_2F018::
    jr   nz, label_2F018
    inc  b
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h
    ld   h, e
    dec  c

label_2F025::
    ldd  [hl], a
    dec  h
    add  a, h
    inc  sp
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2F0B4
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    or   d
    ld   e, b
    ld   d, d
    cp   $04
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h
    ld   h, e
    dec  c
    ldd  [hl], a
    dec  h
    add  a, h
    inc  sp
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2F0E1
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    ld   c, e
    ld   c, b
    ldi  [hl], a
    cp   $04
    dec  c
    ld   [de], a
    rst  $18
    add  a, d
    inc  d
    dec  b
    ld   d, $A7
    dec  h
    and  a
    inc  [hl]
    and  a

label_2F081::
    ld   [hl], $A7
    ld   b, l
    and  a
    ld   d, e
    and  a
    ld   d, l
    and  a
    ld   h, [hl]

label_2F08A::
    and  a
    ld   hl, label_230F
    dec  b
    inc  h
    and  b
    ld   h, $DF
    daa
    rrca
    jr   z, label_2F0B7
    ldd  [hl], a
    dec  b
    inc  sp
    rst  $18
    dec  [hl]
    dec  b
    ld   b, e
    rrca
    ld   b, h
    rst  $18
    ld   b, [hl]
    dec  b
    ld   c, b
    rrca
    ld   d, c
    dec  b
    ld   h, c
    jr   nz, label_2F10C
    dec  b
    ld   l, b
    dec  b
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    add  a, h
    sbc  a, b
    ld   h, d

label_2F0B4::
    cp   $04
    ld   e, l

label_2F0B7::
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    call nz, label_DF11
    push bc
    ld   [bc], a
    inc  h
    call nz, label_1103
    jp   nz, label_2405
    ld   b, $11
    add  a, e
    rlca
    rrca
    ld   d, d
    ld   a, [hli]
    ld   b, e
    dec  d
    add  a, [hl]
    ld   b, h
    inc  de
    ld   h, [hl]
    xor  h
    jp   nz, label_2405
    dec  h
    ld   a, [hli]
    add  a, h
    ld   h, $21
    ld   d, $AC
    add  a, e
    rla

label_2F0E1::
    inc  de
    jr   label_2F0F1
    add  a, e
    rlca
    rrca
    jr   z, label_2F081
    add  a, a
    ld   d, e
    ld   hl, label_1009
    add  hl, de
    inc  d
    add  hl, sp

label_2F0F1::
    db   $10 ; Undefined instruction
    sub  a, l
    ld   b, l
    sub  a, [hl]
    ld   b, a
    dec  c
    ld   c, c
    inc  d
    ld   d, a
    sbc  a, b
    ld   [hl], h
    db   $FD ; Undefined instruction
    pop  hl
    inc  de
    xor  d
    ld   c, b
    ld   c, b
    cp   $04
    ld   l, l
    add  a, e
    nop
    rrca
    inc  bc
    db   $10 ; Undefined instruction

label_2F10C::
    inc  b
    inc  hl
    call nz, label_1006
    push bc
    rlca
    inc  hl
    call nz, label_DF18
    add  a, [hl]
    ld   b, b
    inc  de
    ld   b, d
    dec  c
    add  a, a
    ld   d, b
    ld   hl, $9852
    ld   b, [hl]
    inc  d
    inc  h
    add  hl, hl
    ld   d, a
    add  hl, hl
    inc  de
    xor  h
    add  a, h
    jr   nz, label_2F14D
    add  a, e
    db   $10 ; Undefined instruction
    ld   de, $000D
    ld   de, label_1510
    ld   hl, label_3098
    ld   de, label_1540
    ld   h, c
    ld   c, [hl]
    cp   $0C
    sub  a, b
    add  a, [hl]
    ld   hl, $8605
    ld   sp, $8505
    ld   b, c
    dec  b
    add  a, h
    ld   d, c
    dec  b
    ld   de, $8625
    ld   [de], a
    ld   hl, label_2618
    inc  de
    rst  0
    ld   d, $C7
    jr   nz, label_2F17E
    ld   hl, label_2829
    ld   a, [hli]
    add  hl, hl
    ld   hl, label_30C2
    inc  hl
    ld   d, b
    daa
    ld   d, c
    dec  hl
    ld   e, b
    inc  l
    ld   e, c
    ldi  [hl], a
    ld   h, c
    daa
    add  a, [hl]
    ld   h, d
    ldi  [hl], a
    ld   h, e
    ret  z
    ld   h, [hl]
    ret  z
    ld   l, b
    jr   z, label_2F19D
    dec  de
    add  a, e
    scf
    dec  de
    add  a, h
    ld   b, [hl]
    dec  de
    add  a, e

label_2F17E::
    ld   d, l
    dec  de
    ldd  [hl], a
    set  4, b
    nop
    xor  d
    adc  a, b
    ld   b, b
    cp   $0C
    sub  a, b
    adc  a, b
    jr   nz, label_2F1A8
    adc  a, b
    jr   nc, label_2F1AB
    adc  a, b
    ld   b, b
    dec  de
    adc  a, b
    ld   d, b
    dec  de
    add  a, e
    ld   b, c
    ld   c, $83
    ld   d, d
    ld   c, $83

label_2F19D::
    ld   [hl], $05
    add  a, e
    ld   b, [hl]
    dec  b
    ld   d, a
    dec  b
    jp   nz, label_2CE25
    ld   b, [hl]

label_2F1A8::
    ld   c, [hl]
    ld   d, a
    ld   c, [hl]

label_2F1AB::
    ld   de, $8625
    ld   [de], a
    ld   hl, $C713
    ld   d, $C7
    jr   label_2F1DC
    jr   nz, label_2F1D9
    ld   hl, label_2829
    ld   a, [hli]
    add  hl, hl
    ld   h, $C2
    add  hl, sp
    inc  h
    ld   d, b
    ldi  [hl], a
    ld   d, c
    dec  hl
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_2F22B
    daa
    add  a, [hl]

label_2F1CC::
    ld   h, d
    ldi  [hl], a
    ld   h, e
    ret  z
    ld   h, [hl]
    ret  z

label_2F1D2::
    ld   l, b
    jr   z, label_2F20C
    set  4, b
    nop
    xor  e

label_2F1D9::
    ld   a, b
    ld   d, b
    cp   $04
    sbc  a, l
    call nz, label_2300
    ld   b, b
    daa
    adc  a, c
    ld   b, c
    ldi  [hl], a
    adc  a, d
    ld   d, b
    inc  bc
    adc  a, d
    ld   h, b
    inc  bc
    adc  a, d
    ld   [hl], b
    inc  bc
    inc  bc
    ret  nz
    ld   b, $C0
    add  hl, bc

label_2F1F4::
    ld   a, [hli]
    cp   $04
    ld   c, l
    inc  de
    ret  nz
    ld   d, $C0
    ld   b, b
    ldi  [hl], a
    ld   b, c
    dec  hl
    jp   nz, label_2351
    ld   [hl], c
    daa
    ld   c, b
    inc  l
    ld   c, c
    jr   z, label_2F1CC
    ld   e, b
    inc  h

label_2F20C::
    ld   a, b
    jr   z, label_2F1D2
    ld   d, b
    inc  bc
    jp   label_359
    jp   label_AC42
    jp   label_AC47
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    ld   l, c
    ld   e, b
    ld   b, b
    cp   $04
    ld   d, e
    inc  b
    dec  c
    add  a, d
    inc  de
    dec  c
    ld   [bc], a
    ld   hl, $00C3
    inc  bc
    jr   nc, label_2F255
    ld   sp, $C229
    ld   de, $0123
    dec  h
    inc  bc
    add  hl, hl
    jp   nz, label_2405
    inc  hl
    inc  l
    inc  h
    ldi  [hl], a
    dec  h
    jr   z, label_2F276
    inc  h
    ld   b, e
    ld   a, [hli]
    ld   b, h
    ld   h, $C2
    ld   d, h
    inc  h

label_2F24B::
    ld   [hl], h
    jr   z, label_2F212
    ld   [de], a
    dec  c
    add  a, e
    ld   d, c
    dec  c
    add  a, e
    ld   h, c

label_2F255::
    dec  c

label_2F256::
    ld   b, c
    xor  e
    add  a, l
    ld   [hl], l
    inc  bc
    inc  b
    rlca
    add  a, d
    inc  de
    rlca
    call nz, label_712
    add  a, e
    ld   d, c
    rlca
    add  a, e
    ld   h, c
    rlca
    ld   h, e
    set  4, c
    inc  d
    jp   label_1028
    cp   $04
    dec  c
    nop
    rla
    adc  a, c

label_2F276::
    ld   bc, label_1012
    dec  d
    adc  a, c
    ld   de, $8213
    inc  d
    dec  c
    jr   nz, label_2F2A7
    adc  a, b
    ld   hl, label_2921
    ld   h, $31
    ret  nz
    jr   c, label_2F24B
    add  a, d
    inc  [hl]
    rrca
    add  a, d
    ld   b, h
    rrca
    ld   h, d
    xor  h
    ld   h, a
    xor  h
    add  a, d
    inc  h
    sub  a, a
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    ld   e, c
    jr   label_2F2CF
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF00]
    sub  a, e
    ld   bc, label_1010
    inc  de
    ld   de, label_214
    dec  h
    rlca
    ld   h, $82
    ld   [$8203], sp
    jr   label_2F2B9
    jr   nz, label_2F2DD
    ld   hl, label_2221
    add  hl, hl
    ld   [de], a
    inc  hl
    rla

label_2F2BF::
    inc  h
    daa
    ld   a, [hli]
    jr   z, label_2F2E5
    add  hl, hl
    ld   h, $84
    inc  de
    rrca
    call nz, label_F14
    call nz, label_F15

label_2F2CF::
    inc  hl
    jr   nz, label_2F2F8
    jr   nz, label_2F256
    ld   sp, $8220
    scf
    jr   nz, label_2F31B
    jr   nz, label_2F324
    jr   nz, label_2F340
    xor  h
    ld   h, a
    xor  h
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a

label_2F2E5::
    ld   e, c
    ld   e, b
    ld   b, b
    cp   $04
    dec  c
    add  a, d
    dec  b
    sbc  a, c
    add  a, e
    ld   de, $8220
    dec  d
    sbc  a, d
    add  a, d
    rla
    push bc
    add  a, d

label_2F2F8::
    daa
    add  a, $82
    ld   sp, label_2C1C0
    sbc  a, e
    ld   b, d
    sbc  a, h
    ld   b, l
    sbc  a, e
    ld   b, [hl]
    sbc  a, h
    ld   b, a
    sbc  a, e
    ld   c, b
    sbc  a, h
    add  a, d
    ld   d, c
    ret  nz
    add  a, h
    ld   d, l
    ret  nz
    add  a, h
    ld   h, e
    rrca
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    db   $58
    ld   e, b
    ld   b, d
    cp   $04

label_2F31B::
    sub  a, b
    jp   nz, label_2301
    ld   hl, $8327
    ldi  [hl], a
    ldi  [hl], a

label_2F324::
    dec  h
    dec  hl
    dec  [hl]
    daa
    ld   [hl], $2B
    ld   b, [hl]
    inc  hl
    ld   d, l
    dec  h
    ld   d, [hl]
    add  hl, hl
    ld   h, l
    inc  hl
    ld   [hl], l
    daa
    add  a, e
    db   $76 ; Halt
    ldi  [hl], a
    ld   a, c
    jr   z, label_2F2BF
    ld   [bc], a
    dec  c
    inc  bc
    ld   a, [hli]
    inc  b
    ld   hl, label_2905
    rlca
    inc  h
    rla
    ld   a, [hli]
    jr   label_2F36E

label_2F348::
    jp   nz, label_2428

label_2F34B::
    ld   c, b
    ld   a, [hli]
    ld   c, c

label_2F34E::
    ld   h, $C2
    ld   e, c
    inc  h
    add  a, l
    ld   [de], a
    dec  c
    ld   h, $0D
    call nz, label_D27
    ld   e, b
    dec  c
    add  a, d
    ld   h, [hl]
    dec  c
    inc  de
    rrca
    ld   l, b
    set  4, c
    db   $10 ; Undefined instruction
    ld   l, b
    ldd  [hl], a
    cp   $0C
    dec  c
    ld   [bc], a
    rst  0
    rlca

label_2F36E::
    rst  0
    add  a, e
    ld   de, $831B
    ld   hl, label_311B
    ld   [de], a

label_2F377::
    inc  sp
    ld   [de], a
    inc  [hl]

label_2F37A::
    sub  a, e
    jp   nz, label_1114
    jp   label_F17
    jp   label_F18
    jr   label_2F34B
    jr   z, label_2F34E
    jp   label_2041
    jp   label_2042
    ld   d, [hl]
    sbc  a, e
    ld   d, a
    sbc  a, h
    ld   e, b
    adc  a, $74
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    call label_2D028
    cp   $0C
    dec  c
    ld   [bc], a
    rst  0
    rlca
    rst  0
    call nz, label_F11
    call nz, label_F12
    jp   nz, label_1015
    add  a, e
    ld   d, $1B
    add  a, e
    ld   h, $1B
    add  a, d
    ld   h, $1B
    ld   [hl], $12
    jr   c, label_2F3CA
    dec  [hl]
    sub  a, h
    ld   hl, label_31C5
    add  a, $C3
    ld   b, a
    jr   nz, label_2F385
    ld   c, b
    jr   nz, label_2F348
    ld   d, c
    ret  nz
    ld   d, d
    adc  a, $74

label_2F3CA::
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    call label_2D058
    cp   $0C
    dec  l
    inc  bc
    rst  0

label_2F3D5::
    ld   b, $C7
    jp   nz, label_1011
    jp   nz, label_1118
    add  a, d
    ldd  [hl], a
    ld   [de], a
    add  a, d
    ld   [hl], $12
    ld   sp, label_3894
    sub  a, e
    add  a, [hl]
    ld   [de], a
    dec  de
    add  a, [hl]
    ldi  [hl], a
    dec  de
    add  a, e
    ld   b, c
    jr   nz, label_2F374
    ld   d, c
    jr   nz, label_2F377
    ld   h, c
    jr   nz, label_2F37A
    ld   d, [hl]
    ret  nz
    ld   d, a

label_2F3FA::
    adc  a, $74
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    call z, label_2D028
    cp   $0C
    ld   c, l
    ld   b, $26
    add  a, $16
    inc  h
    db   $76 ; Halt
    jr   z, label_2F3D5
    rlca
    inc  bc
    ret  z
    ld   [$C803], sp
    add  hl, bc
    inc  bc
    add  a, h
    ld   [de], a
    push bc
    add  a, h
    ldi  [hl], a
    add  a, $82
    ld   b, e
    ret  nz
    add  a, h
    ld   d, d
    ret  nz
    add  a, d
    ld   h, e
    ret  nz
    ld   d, e
    sbc  a, e
    ld   d, h
    sbc  a, h
    cp   $0C
    dec  c
    add  a, e
    inc  b
    sbc  a, c
    add  a, e
    inc  d
    sbc  a, d
    add  a, d
    rla
    ret  nz
    daa
    jr   nz, label_2F45F
    and  [hl]
    jr   c, label_2F3FA
    add  a, e
    ld   b, c
    rrca
    ld   b, a
    sbc  a, e
    ld   c, b
    sbc  a, h
    add  a, e
    ld   d, c
    rrca
    ld   d, c
    push bc
    ld   d, d
    adc  a, $58
    jr   nz, label_2F3CE
    ld   h, c
    rrca
    ld   h, c
    add  a, $66
    and  [hl]
    add  a, d
    ld   h, a
    jr   nz, label_2F4C9
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    call z, label_2D078
    cp   $04
    dec  h
    nop

label_2F45F::
    nop
    ld   bc, label_625
    ld   h, $83
    rlca
    nop
    db   $10 ; Undefined instruction
    ld   de, label_1229
    xor  a
    add  a, e
    inc  de
    xor  [hl]
    ld   d, $2A
    add  a, e
    rla
    ld   hl, $AF21
    ldi  [hl], a
    or   b
    add  a, h

label_2F47A::
    ld   h, $AE
    jp   nz, label_131
    ld   b, h
    xor  [hl]
    ld   b, a
    xor  [hl]
    ld   d, c
    or   b
    ld   d, d
    xor  a
    ld   d, l
    xor  [hl]
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   h, d
    or   b
    add  a, a
    ld   h, e
    xor  [hl]
    ld   [hl], b
    dec  c
    ld   [hl], c
    daa
    inc  sp
    set  4, b
    nop
    ld   [hl], l
    jr   c, label_2F4DD
    cp   $04
    ld   b, l
    nop
    nop
    ld   bc, label_20D
    dec  h
    ld   [label_926], sp
    nop
    add  a, d
    db   $10 ; Undefined instruction
    ld   [de], a
    add  hl, hl
    add  a, d
    inc  de
    xor  [hl]
    jp   nz, label_A715
    jr   label_2F4E1
    add  hl, de
    ld   h, $82
    jr   nz, label_2F46A
    ldi  [hl], a
    xor  a
    jr   z, label_2F4C1
    jp   label_132
    add  a, e
    inc  [hl]
    xor  a
    scf
    xor  [hl]
    jr   c, label_2F47A
    ld   b, e
    xor  c
    add  a, e
    ld   b, h
    ld   bc, $A748
    ld   d, c
    xor  a
    ld   d, e
    xor  a
    ld   d, h
    ld   bc, label_2D582
    or   b
    ld   d, a
    xor  [hl]
    ld   e, b

label_2F4DD::
    inc  l
    ld   e, c
    jr   z, label_2F541

label_2F4E1::
    xor  [hl]
    add  a, h
    ld   h, c
    or   b
    ld   h, l
    inc  l
    add  a, d
    ld   h, [hl]
    ldi  [hl], a
    ld   l, b
    jr   z, label_2F556
    dec  c
    ld   [hl], l
    jr   z, label_2F475
    db   $76 ; Halt
    nop
    add  a, d
    ld   a, b
    dec  c
    inc  hl
    set  4, b
    nop
    db   $76 ; Halt
    ld   l, b
    ld   d, b
    cp   $04
    dec  c
    add  hl, sp
    di
    ld   [hl], c
    pop  af
    nop
    nop
    ld   bc, label_1025
    dec  h
    ld   de, label_329
    rst  0
    ld   b, $C7

label_2F510::
    ld   [label_926], sp
    nop

label_2F514::
    jr   label_2F540
    add  hl, de
    ld   h, $12
    rst  $18
    jp   nz, label_DF31
    cp   $04
    dec  c
    jr   nc, label_2F514
    add  hl, sp
    di
    inc  bc
    rst  0
    ld   b, $C7
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    nop
    nop
    add  hl, bc
    nop
    ld   [hl], b
    nop
    ld   a, c
    nop
    db   $10 ; Undefined instruction
    ld   de, $0129
    dec  h
    ld   [label_1826], sp
    ld   a, [hli]
    add  hl, de
    ld   h, $60

label_2F541::
    daa
    ld   h, c
    dec  hl
    ld   [hl], c
    daa
    ld   l, b

label_2F547::
    inc  l
    ld   l, c
    jr   z, label_2F5C3

label_2F54B::
    jr   z, label_2F54B
    inc  b
    sbc  a, l
    jr   nc, label_2F547
    add  a, l
    nop
    nop
    dec  b
    dec  h

label_2F556::
    add  a, d
    ld   b, $21
    ld   [label_926], sp
    nop
    add  a, h
    stop
    inc  d
    dec  h
    dec  d
    add  hl, hl
    jr   label_2F590
    add  hl, de
    ld   h, $20
    dec  h
    add  a, e
    ld   hl, label_2221
    rst  0
    inc  h
    add  hl, hl
    call nz, label_2429
    jr   c, label_2F51C
    ld   d, b
    daa
    add  a, e
    ld   d, c
    ldi  [hl], a
    ld   d, d
    ret  z
    ld   d, h
    dec  hl
    add  a, h
    ld   h, b
    nop
    ld   h, h
    daa
    ld   h, l
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2F510
    ld   [hl], b
    nop
    ld   [hl], l
    daa
    add  a, d

label_2F590::
    db   $76 ; Halt
    ldi  [hl], a
    ld   a, b
    jr   z, label_2F60E
    nop
    cp   $04
    sub  a, c
    add  a, h
    ld   b, e
    dec  c
    add  a, h
    ld   d, e
    dec  c
    add  a, h
    ld   h, e
    dec  c
    ldd  [hl], a
    dec  h
    add  a, h
    inc  sp
    ld   hl, label_2637
    jp   label_2342
    ld   [hl], d
    daa
    add  a, h
    ld   [hl], e
    ldi  [hl], a
    call nz, label_2447
    inc  [hl]
    sbc  a, c
    ld   b, h
    sbc  a, d
    ld   d, l
    ret  nz
    ld   [hl], a
    jr   z, label_2F631
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    db   $DB
    ld   a, b
    ld   d, d

label_2F5C3::
    cp   $0C
    dec  [hl]
    push bc
    nop
    nop
    ld   bc, $C200
    ld   de, label_20D
    dec  h
    rlca
    ld   h, $08
    dec  c
    jp   nz, label_18
    push bc
    add  hl, bc
    nop
    add  hl, hl
    dec  c
    jp   nz, label_2312
    jp   nz, label_2417
    ld   sp, label_3225
    add  hl, hl
    scf
    ld   a, [hli]
    jr   c, label_2F610
    ld   b, c
    inc  hl
    ld   c, b
    inc  h
    ld   d, b
    dec  h
    ld   d, c
    add  hl, hl
    ld   e, b
    ld   a, [hli]
    ld   e, c
    ld   h, $C2
    ld   h, b
    inc  hl
    jp   nz, label_2469
    ld   l, c
    ld   c, d
    rst  0
    dec  d
    and  [hl]
    jp   label_A653
    ld   [bc], a
    dec  h
    rlca
    ld   h, $FE
    inc  c
    sub  a, b
    nop
    dec  c
    add  a, d

label_2F60E::
    ld   [bc], a
    dec  c

label_2F610::
    rlca
    dec  c
    ld   de, label_180D
    dec  c
    jr   nc, label_2F625
    ld   b, c
    dec  c
    jp   nz, label_D49
    ld   a, b
    dec  c
    inc  de
    dec  h
    add  a, e
    inc  d
    ld   hl, label_2617
    ldi  [hl], a
    dec  h
    inc  hl
    add  hl, hl
    add  a, e
    inc  h
    dec  de
    daa
    ld   a, [hli]
    jr   z, label_2F657

label_2F631::
    jp   nz, label_2332
    add  a, l
    inc  sp
    dec  de
    dec  [hl]
    dec  b
    jp   label_2438
    add  a, l
    ld   b, e
    dec  de
    add  a, e
    ld   b, h
    dec  b
    ld   d, b
    dec  h
    ld   d, c
    ld   hl, label_2952
    add  a, l
    ld   d, e
    dec  de
    ld   d, l
    dec  b
    ld   h, b
    ld   a, $83
    ld   h, c

label_2F651::
    dec  b

label_2F652::
    add  a, e
    ld   h, h
    dec  de
    ld   h, a
    inc  l

label_2F657::
    ld   l, b
    jr   z, label_2F6CA
    daa
    add  a, [hl]
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], a

label_2F65F::
    jr   z, label_2F65F
    inc  c
    ld   d, l
    add  a, h
    nop
    ld   hl, label_2604
    add  a, l
    dec  b
    nop
    nop
    dec  h
    inc  d
    ld   a, [hli]
    add  a, l
    dec  d
    ld   hl, label_2522
    add  a, a
    inc  hl
    ld   hl, label_2930
    ldd  [hl], a
    inc  hl
    add  hl, sp
    dec  b
    ld   b, b
    dec  h
    ld   b, c
    sbc  a, b
    ld   b, d
    add  hl, hl
    add  a, d
    ld   b, e
    ld   [de], a
    ld   b, l
    inc  l
    add  a, h
    ld   b, [hl]
    ldi  [hl], a
    ld   d, l
    ld   a, [hli]
    add  a, e
    ld   d, [hl]
    ld   hl, label_2659
    ld   h, d
    and  [hl]
    add  a, h
    ld   h, h
    xor  a
    ld   h, e
    xor  c
    jp   nz, label_2469
    ld   [hl], a
    dec  hl
    ld   a, b
    dec  b
    cp   $0C
    sub  a, b
    ld   [bc], a
    dec  c
    add  a, d
    dec  b
    dec  c
    add  a, [hl]
    db   $10 ; Undefined instruction
    ld   d, $26
    rla
    dec  c
    add  a, l
    jr   nz, label_2F6D3
    dec  h
    ld   h, $26
    ld   a, [hli]
    daa
    ld   h, $30
    dec  b
    add  a, h
    ld   sp, label_3505
    ld   a, [hli]
    ld   [hl], $26
    jp   label_2437
    add  a, e
    ld   b, b
    ldi  [hl], a
    ld   b, e
    dec  hl
    add  a, d

label_2F6CA::
    ld   b, h
    dec  b
    jp   label_2446
    jp   nz, label_D49
    ld   d, b

label_2F6D3::
    dec  c
    ld   d, e
    daa
    ld   d, h
    dec  hl
    jp   nz, label_555
    jp   nz, label_D61
    ld   h, h
    inc  hl
    ld   h, a
    ld   a, [hli]
    ld   l, b
    ld   h, $74
    daa
    ld   [hl], l
    ld   b, b
    db   $76 ; Halt
    jr   z, label_2F762
    dec  c
    ld   a, b
    inc  h
    cp   $00
    sub  a, b
    adc  a, d
    nop
    inc  bc
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_2F6FD
    adc  a, d
    jr   nc, label_2F700

label_2F6FD::
    jr   nc, label_2F775
    dec  [hl]

label_2F700::
    ld   [hl], l
    ld   [hl], $76
    add  hl, sp
    ld   [hl], l
    ld   b, c
    db   $76 ; Halt
    add  a, d
    ld   b, d
    ld   [hl], a
    ld   b, h
    ld   [hl], l
    ld   b, a
    db   $76 ; Halt
    ld   c, b
    ld   [hl], l
    ld   d, d
    ld   l, h
    add  a, h
    ld   d, e
    ld   l, b
    ld   d, a
    ld   l, l
    ld   h, e
    ld   l, [hl]
    ld   h, h
    ld   l, d
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    pop  hl
    add  a, h
    ld   [hl], e
    ld   [rUNKN7], a
    ld  [$FF00+C], a
    ld   d, l
    ld   h, d
    ld   h, l
    ld   h, l
    ld   [hl], l
    ld   h, d
    cp   $0D
    sub  a, b
    adc  a, d
    nop
    ld   h, c
    db   $10 ; Undefined instruction
    jr   nz, label_2F795
    adc  a, d
    ld   [hl], b
    ld   h, c
    rla
    ld   e, a
    rst  0
    jr   label_2F7A5
    add  hl, de
    ld   e, a
    push bc
    daa
    ld   h, c
    push bc
    add  hl, hl
    ld   h, c
    scf
    ld   e, a
    add  hl, sp
    ld   e, a
    ld   d, a
    ld   e, a
    ld   e, c
    ld   e, a
    ld   b, c
    ld   [hl], a
    ld   b, d
    ld   [hl], a
    jp   nz, label_2F651
    jp   nz, label_2F652
    add  a, [hl]
    ld   de, label_227F
    ld   a, h
    dec  h
    ld   a, h
    ld   [rJOYP], a
    adc  a, d
    ld   e, b
    ld   b, b

label_2F762::
    cp   $04

label_2F764::
    sub  a, b
    add  a, d
    jr   c, label_2F76D
    add  a, h
    ld   b, [hl]
    dec  b
    add  a, h
    ld   d, h

label_2F76D::
    dec  b
    add  a, d
    ld   h, h
    dec  b
    ld   bc, $83DF
    inc  bc

label_2F775::
    rst  $18
    add  a, d
    ld   [label_13DF], sp
    rst  $18
    add  a, l
    dec  d
    rst  $18
    inc  h
    rst  $18
    ld   h, $DF
    add  a, l
    jr   nc, label_2F764
    ldd  [hl], a
    nop
    ld   b, b
    rst  $18
    ld   d, b
    rst  $18
    ld   d, d
    rst  $18
    ld   h, c
    rst  $18
    ld   [hl], b
    rst  $18
    daa
    dec  h
    add  a, d
    jr   z, label_2F7B7
    dec  [hl]
    dec  h
    ld   [hl], $21
    scf
    add  hl, hl
    ld   b, e
    dec  h

label_2F79E::
    ld   b, h
    ld   hl, label_2945
    jp   nz, label_2353

label_2F7A5::
    ld   [hl], e
    daa
    ld   e, b
    inc  l
    ld   e, c
    ldi  [hl], a
    ld   h, [hl]
    inc  l
    ld   h, a
    ldi  [hl], a
    ld   l, b
    jr   z, label_2F828
    jr   z, label_2F81D
    rst  $18
    add  a, e
    ld   [hl], a

label_2F7B7::
    rst  $18
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    dec  d
    adc  a, b
    ld   b, b
    cp   $04
    sub  a, b
    adc  a, d
    jr   nc, label_2F7CA
    adc  a, d
    ld   b, b
    dec  b
    nop
    rst  $18

label_2F7CA::
    ld   bc, label_227
    dec  hl
    add  a, $03
    ld   bc, label_4C8
    ld   bc, label_5C8
    ld   bc, label_26C6
    ld   bc, label_2A06
    rlca
    ld   h, $82
    ld   [label_11DF], sp
    rst  $18

label_2F7E3::
    ld   [de], a
    inc  hl
    ld   d, $AF
    rla

label_2F7E8::
    inc  h
    add  hl, de
    rst  $18
    add  a, d
    jr   nz, label_2F80F
    ldi  [hl], a
    add  hl, hl
    daa
    ld   a, [hli]
    add  a, d
    jr   z, label_2F816
    jr   c, label_2F79E
    ld   b, c
    and  a
    add  a, d
    ld   d, b
    ldi  [hl], a
    ld   d, d
    dec  hl
    ld   d, a
    inc  l
    add  a, d
    ld   e, b
    ldi  [hl], a
    jp   nz, label_DF61
    ld   h, d
    inc  hl
    ld   h, e
    or   b
    ld   h, a
    ld   a, [hli]
    ld   l, b
    ld   h, $C2

label_2F80F::
    ld   l, c
    rst  $18
    ld   [hl], d
    daa
    ld   [hl], e
    dec  hl
    ld   [hl], a

label_2F816::
    xor  a
    ld   a, b
    inc  h
    cp   $04
    sub  a, b
    ld   d, $05
    add  a, a
    ld   hl, $8205
    jr   nc, label_2F829
    ld   [hl], $05
    add  a, d
    ld   b, b

label_2F828::
    dec  b

label_2F829::
    add  a, d
    nop
    rst  $18
    inc  bc
    rst  $18
    dec  b
    dec  h
    ld   b, $21
    rlca
    ld   h, $82
    ld   [label_10DF], sp
    dec  h
    add  a, h
    ld   de, label_1521
    add  hl, hl
    rla
    ld   a, [hli]
    jr   label_2F868
    add  a, $19
    rst  $18
    jr   nz, label_2F870
    jr   z, label_2F86D
    ldd  [hl], a
    inc  l
    add  a, d
    inc  sp
    ldi  [hl], a
    dec  [hl]
    dec  hl
    scf
    inc  l
    jr   c, label_2F87C
    add  hl, sp
    nop

label_2F856::
    ld   b, d
    inc  h
    ld   b, h
    rst  $18
    ld   b, l
    daa
    ld   b, [hl]
    ldi  [hl], a
    ld   b, a
    jr   z, label_2F7E3
    ld   d, b
    ldi  [hl], a
    ld   d, d
    jr   z, label_2F7E8
    ld   d, h
    rst  $18

label_2F868::
    add  a, e
    ld   h, b
    rst  $18
    add  a, e
    ld   h, a

label_2F86D::
    rst  $18
    add  a, h
    ld   [hl], b

label_2F870::
    rst  $18
    ld   [hl], l
    rst  $18
    add  a, d
    ld   [hl], a
    rst  $18
    ld   h, $CB
    pop  hl
    ld   a, [bc]
    db   $ED ; Undefined instruction
    ld   c, b

label_2F87C::
    ld   b, b
    cp   $04
    sub  a, l
    ret  z
    nop
    rst  $18
    ld   bc, label_2DF
    dec  h
    add  a, [hl]
    inc  bc
    ld   hl, label_2609
    ld   de, label_1225
    add  hl, hl
    inc  de
    dec  h
    inc  d
    ld   hl, label_2615
    add  hl, de
    ld   a, [hli]
    jp   label_2321
    ldi  [hl], a
    dec  h
    inc  hl
    add  hl, hl
    dec  h
    ld   a, [hli]
    ld   h, $21
    daa
    ld   h, $32
    inc  hl
    scf
    inc  h
    ld   b, d
    daa
    ld   b, e
    dec  hl
    ld   b, l
    inc  l
    ld   b, [hl]
    ldi  [hl], a
    ld   b, a
    jr   z, label_2F8FC
    inc  l
    ld   c, c
    ldi  [hl], a
    ld   d, c
    daa
    ld   d, d
    dec  hl
    ld   d, e

label_2F8BC::
    daa
    ld   d, h
    ldi  [hl], a
    ld   d, l
    jr   z, label_2F918
    inc  l
    ld   d, a
    ldi  [hl], a
    ld   e, b
    jr   z, label_2F921
    rst  $18
    ld   h, c
    rst  $18
    ld   h, d
    daa
    add  a, e
    ld   h, e
    ldi  [hl], a
    ld   h, [hl]
    jr   z, label_2F856
    ld   h, a
    rst  $18
    adc  a, c
    ld   [hl], c
    rst  $18
    inc  [hl]
    cp   [hl]
    pop  hl
    ld   a, [bc]
    db   $EC ; Undefined instruction
    ld   l, b

label_2F8DE::
    jr   nc, label_2F8DE
    inc  b
    sub  a, l
    nop
    rst  $18
    ld   bc, $8225
    ld   [bc], a
    ld   hl, label_2604
    dec  b
    ld   a, [hli]
    ld   b, $21
    rlca
    ld   h, $82
    ld   [label_10DF], sp
    ld   hl, label_2911
    inc  d
    ld   a, [hli]
    dec  d
    ld   h, $17
    ld   a, [hli]
    jr   label_2F926
    add  hl, de
    rst  $18
    jp   nz, label_2425
    jr   z, label_2F931
    add  hl, hl
    ld   h, $39
    inc  h
    ld   b, b
    ldi  [hl], a
    ld   b, c

label_2F90E::
    dec  hl
    ld   b, l
    ld   a, [hli]
    ld   b, [hl]
    ld   hl, $9847
    ld   c, b
    ld   h, $49

label_2F918::
    ld   a, [hli]
    jp   label_DF50
    ld   d, c
    inc  hl
    ld   e, b
    inc  h
    jp   nz, label_DF59
    ld   h, c
    daa
    ld   h, d

label_2F926::
    dec  hl
    ld   h, h
    inc  l
    add  a, e
    ld   h, l
    ldi  [hl], a
    ld   l, b
    jr   z, label_2F9A0
    rst  $18
    ld   [hl], d

label_2F931::
    daa
    ld   [hl], e
    ld   c, b
    ld   [hl], h
    jr   z, label_2F8BC
    ld   [hl], l
    rst  $18
    daa
    set  4, b
    nop
    rlca
    jr   c, label_2F990
    cp   $04
    sub  a, l
    adc  a, d
    nop
    rst  $18
    ld   [bc], a
    dec  h
    inc  bc
    dec  a
    inc  b
    ld   h, $10
    rst  $18
    ld   de, label_1225
    add  hl, hl
    inc  d
    ld   a, [hli]
    add  a, d
    dec  d
    ld   hl, label_2617
    add  a, d
    jr   label_2F93B
    jr   nz, label_2F983
    ld   hl, label_2729
    ld   a, [hli]
    jr   z, label_2F985
    add  hl, hl
    ld   h, $C2
    jr   nc, label_2F98C
    add  hl, sp
    ld   a, [hli]
    ld   d, b
    daa
    ld   d, c
    dec  hl
    ld   e, b
    inc  l
    ld   e, c
    ldi  [hl], a
    ld   h, b
    rst  $18
    ld   h, c
    daa
    ld   h, d
    ldi  [hl], a
    ld   h, e
    dec  hl
    ld   h, a
    inc  l
    ld   l, b
    jr   z, label_2F9E9
    rst  $18
    add  a, e
    ld   [hl], b

label_2F983::
    rst  $18
    ld   [hl], e

label_2F985::
    daa
    add  a, e
    ld   [hl], h
    ldi  [hl], a
    ld   [hl], a
    jr   z, label_2F90E

label_2F98C::
    ld   a, b
    rst  $18
    cp   $04

label_2F990::
    dec  b
    ld   bc, label_3F0
    ld   h, $82
    inc  b
    xor  h
    ld   b, $25
    inc  de
    ld   a, [hli]
    add  a, d
    inc  d
    ld   hl, label_2916
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2FA1A
    nop
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2FA29
    nop
    add  a, d
    rla
    dec  c
    add  a, d
    ldi  [hl], a
    dec  c
    dec  h
    dec  c
    daa
    dec  c
    add  a, e
    ld   sp, $C30D
    jr   c, label_2F9A0
    ld   b, c
    dec  c
    ld   b, [hl]
    dec  c
    add  a, d
    ld   d, c
    dec  c
    ld   d, l
    dec  c
    ld   h, d
    dec  c
    ld   h, e
    rst  $18
    ld   h, a
    rst  $18
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    dec  [hl]
    ld   l, b
    ld   d, b
    cp   $0C
    dec  b
    add  a, d
    nop
    rst  $18
    ld   [bc], a
    dec  h
    dec  b
    add  hl, hl
    ld   b, $25
    db   $10 ; Undefined instruction
    ld   de, label_1225
    add  hl, hl

label_2F9E9::
    ld   d, $23
    add  a, d
    rla
    dec  de
    jr   nz, label_2FA15
    ld   hl, label_2429
    dec  h
    dec  h
    sbc  a, b
    ld   h, $29
    add  a, d
    daa
    dec  de
    inc  sp
    dec  h
    inc  [hl]
    add  hl, hl
    add  a, h
    dec  [hl]
    dec  de
    ld   b, e
    inc  hl
    add  a, l

label_2FA05::
    ld   b, h
    dec  de
    ld   d, c
    dec  h
    ld   d, d
    ld   hl, label_2953
    add  a, l
    ld   d, h
    dec  de
    ld   h, b
    add  hl, hl
    ld   h, c
    inc  hl
    add  a, a

label_2FA15::
    ld   h, d
    dec  de
    ld   [hl], b
    dec  c
    ld   [hl], c

label_2FA1A::
    daa
    ld   a, b
    dec  a
    inc  hl
    set  4, c
    ld   a, [bc]
    di
    ld   e, b
    ld   b, b
    cp   $0C
    dec  b
    nop
    rst  $18

label_2FA29::
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10 ; Undefined instruction
    ld   de, label_1823
    inc  h
    add  hl, de
    rst  $18
    jr   nz, label_2FA5E
    ld   hl, label_2829
    ld   a, [hli]
    add  hl, hl
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2FAB8
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2FAC7
    rst  $18
    inc  hl
    and  a
    add  a, e
    inc  [hl]
    and  a
    ld   b, c
    and  a
    ld   b, e
    and  a
    add  a, d
    ld   b, [hl]
    and  a
    ld   d, d
    and  a
    ld   e, b

label_2FA5E::
    and  a
    ld   h, [hl]
    and  a
    inc  de
    and  b
    jr   c, label_2FA05
    ld   b, d
    and  b
    ld   d, h

label_2FA68::
    and  b
    ld   d, [hl]
    and  b
    inc  b
    add  hl, hl
    dec  b
    dec  b
    ld   b, $2A
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    dec  c
    jr   label_2FAE8
    cp   $0C
    sbc  a, l
    add  a, a
    ld   [bc], a
    rst  $18
    add  a, a
    ld   [de], a
    rst  $18
    add  a, d
    ld   hl, $C2DF
    add  hl, hl
    rst  $18
    jr   nc, label_2FA68
    ldd  [hl], a
    rst  $18

label_2FA8B::
    add  a, d
    ld   b, b
    rst  $18
    jp   nz, label_DF43
    ld   c, b
    rst  $18
    ld   d, c
    rst  $18
    add  a, d
    ld   e, b
    rst  $18
    add  a, d
    ld   h, c
    rst  $18
    add  a, d
    ld   h, a
    rst  $18
    ld   [hl], b
    rst  $18
    ld   [hl], d
    rst  $18
    ld   [hl], a
    rst  $18
    ld   a, c
    rst  $18
    rst  0
    dec  d
    dec  b
    add  a, e
    inc  h
    dec  b
    inc  b
    dec  h
    dec  b
    ld   hl, label_2606
    inc  de
    dec  h
    inc  d
    add  hl, hl
    ld   d, $2A

label_2FAB8::
    rla
    ld   h, $23
    inc  hl
    daa
    inc  h
    inc  sp
    daa
    inc  [hl]
    dec  hl
    ld   [hl], $2C
    scf
    jr   z, label_2FA8B

label_2FAC7::
    ld   b, h
    inc  hl
    call nz, label_2446
    dec  h
    cp   [hl]
    pop  hl
    ld   a, [bc]
    pop  af
    jr   c, label_2FB03
    cp   $0C
    dec  d
    jp   nz, label_A603
    dec  b
    and  [hl]
    add  a, l
    inc  hl
    and  [hl]
    add  a, l
    ld   sp, label_374E
    and  a
    jr   c, label_2FB33
    add  a, h
    ld   b, c
    and  [hl]

label_2FAE8::
    jp   label_A646
    ld   c, b
    and  b
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2FB66
    dec  c
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2FB75
    dec  c
    ld   [hl], e
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    add  a, [hl]
    jr   label_2FB44
    cp   $05
    sub  a, b
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, b
    ldi  [hl], a
    ld   a, b
    inc  hl
    ld   a, c
    dec  h
    ld   a, c
    daa
    ld   a, c
    add  hl, hl

label_2FB14::
    ld   a, c
    adc  a, b
    ldd  [hl], a
    inc  bc
    adc  a, b
    ld   b, d
    add  a, b
    adc  a, b
    ld   d, d
    add  a, c
    add  a, h
    ld   h, e
    add  a, c
    ld   [hl], e
    add  a, c
    jr   nz, label_2FB91
    ld   hl, label_306D
    ld   h, b
    ld   sp, $C461
    ld   b, b
    ld   d, h
    jp   nz, label_2D741
    jp   nz, label_2D461
    ld   h, d
    ld   d, [hl]
    ld   [hl], d
    ld   d, h
    ld   d, d
    ld   [hl], d
    add  a, d
    ld   d, a
    ld   [hl], d
    ld   h, l
    ld   [hl], d
    ld   h, a
    ld   d, b
    add  a, d
    ld   l, b
    ld   d, e

label_2FB44::
    add  a, h
    ld   [hl], e
    ld   d, e
    add  a, e
    ld   [hl], a
    ld   d, h
    ld   [rJOYP], a
    ld   [label_3068], a
    cp   $0C
    dec  h
    rlca
    add  hl, hl
    ld   [label_90D], sp
    inc  h
    add  a, l
    ld   de, label_19DF
    ld   a, [hli]
    add  a, d
    ld   hl, label_23DF
    inc  l
    inc  h
    dec  hl
    jr   z, label_2FB14

label_2FB66::
    add  hl, hl
    xor  a
    ld   sp, label_33DF
    ld   a, [hli]
    inc  [hl]

label_2FB6D::
    add  hl, hl
    ld   [hl], $2C
    scf
    dec  hl
    add  hl, sp
    or   b
    ld   b, c

label_2FB75::
    xor  [hl]
    ld   b, [hl]
    ld   a, [hli]
    ld   b, a
    add  hl, hl
    ld   d, b
    daa
    ld   d, c
    dec  hl
    add  a, d
    ld   d, d
    xor  [hl]
    ld   h, b
    dec  c
    ld   h, c
    daa
    ld   h, d
    ldi  [hl], a
    ld   h, e
    dec  hl
    add  a, [hl]
    ld   h, h
    xor  [hl]
    add  a, d
    ld   [hl], b
    dec  c
    ld   [hl], d
    nop

label_2FB91::
    ld   [hl], e
    daa
    cp   $0C
    ld   b, l
    add  a, d
    nop
    nop
    ld   [bc], a
    dec  h
    dec  b
    ld   b, a
    rlca
    ld   h, $08
    inc  h
    add  hl, bc
    nop
    add  a, d
    db   $10 ; Undefined instruction
    ld   [de], a
    add  hl, hl
    add  a, d
    inc  de
    xor  [hl]
    ld   d, $A7
    rla
    inc  h
    jr   label_2FBDB
    add  hl, de
    ld   h, $83
    jr   nz, label_2FB65
    daa
    ld   a, [hli]
    jr   z, label_2FBE0
    add  a, d
    jr   nc, label_2FB6D
    jp   label_132
    inc  sp
    xor  [hl]
    add  a, e
    inc  [hl]
    xor  a
    jp   label_2438
    ld   b, h
    or   b
    ld   b, [hl]
    ld   bc, $B045
    ld   d, [hl]
    or   b
    ld   d, c
    xor  a
    add  a, h
    ld   h, b
    xor  [hl]
    add  a, d
    ld   h, c
    or   b
    ld   d, l
    and  a
    ld   h, h

label_2FBDB::
    and  a
    ld   h, a
    inc  l
    ld   l, b
    jr   z, label_2FC58
    jr   z, label_2FC5B
    inc  l
    ld   [hl], l
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    call label_2088
    cp   $00
    sub  a, b
    call nz, label_E102
    add  a, h
    inc  bc
    ld   [$FF84], a
    inc  de
    ld   [$FF84], a
    inc  hl
    ld   [$FF84], a
    inc  sp
    ld   [$FFC4], a
    rlca

label_2FBFF::
    ld  [$FF00+C], a
    call nz, label_2E305
    ld   b, e
    ld   [hl], b
    ld   b, h
    inc  b
    ld   b, l
    ld   h, h
    ld   b, [hl]
    ld   [hl], c
    ld   d, b
    ld   l, h
    adc  a, b
    ld   d, c
    ld   l, b
    ld   e, c
    ld   l, l
    ld   h, c
    ld   l, [hl]
    add  a, [hl]
    ld   h, d
    ld   l, d
    ld   l, b
    ld   l, a
    ld   [hl], c
    ld   l, h
    add  a, [hl]
    ld   [hl], d
    ld   l, b
    ld   a, b
    ld   l, l
    pop  hl
    ld   b, $2E
    jr   label_2FC35
    cp   $0C
    sub  a, b
    inc  b
    dec  h
    add  a, l
    dec  b
    ld   hl, label_2C708
    add  a, h
    nop
    dec  c
    inc  bc
    rst  $18
    db   $10 ; Undefined instruction
    ld   de, label_12DF
    dec  h
    inc  de
    ld   hl, label_2914
    add  a, l
    dec  d
    dec  de
    jr   nz, label_2FC22
    ld   hl, label_2225
    add  hl, hl
    add  a, a
    inc  hl
    dec  de
    jr   nc, label_2FC59
    ld   sp, $8323
    ldd  [hl], a
    dec  de
    dec  [hl]
    inc  l
    add  a, h
    ld   [hl], $22
    ld   b, b
    dec  h

label_2FC58::
    ld   b, c

label_2FC59::
    add  hl, hl
    add  a, d

label_2FC5B::
    ld   b, d
    dec  de
    ld   b, h
    inc  l
    ld   b, l
    jr   z, label_2FCAB
    rst  $18
    jp   nz, label_2350
    add  a, d
    ld   d, c
    dec  de
    add  a, d
    ld   h, c
    dec  de
    ld   d, e
    inc  l
    ld   d, h
    jr   z, label_2FBF4
    ld   d, [hl]
    rst  $18
    ld   h, e
    inc  h
    add  a, l
    ld   h, l
    rst  $18
    ld   [hl], b
    daa
    ld   [hl], e
    jr   z, label_2FBFF
    ld   [hl], h
    rst  $18
    ld   a, c
    rst  $18
    jr   label_2FC88
    ld   [hl], c
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    dec  e

label_2FC88::
    jr   label_2FCBA
    cp   $0C
    sub  a, b
    add  a, l
    nop
    ld   hl, label_2605
    dec  d
    ld   a, [hli]
    ld   d, $21
    rla
    ld   h, $27
    inc  h
    scf
    ld   a, [hli]
    jr   c, label_2FCC4
    call nz, label_2448
    add  a, l
    db   $10 ; Undefined instruction
    add  a, e
    jr   nz, label_2FCC2
    add  a, h
    inc  hl
    dec  b
    add  a, e

label_2FCAB::
    jr   nc, label_2FCCF
    inc  sp
    dec  hl
    add  a, e
    inc  [hl]
    dec  b
    add  a, e
    ld   b, l
    dec  b
    add  a, d
    ld   d, [hl]
    dec  b
    add  a, d
    ld   h, [hl]

label_2FCBA::
    dec  b
    ld   b, e
    daa
    ld   b, h
    dec  hl
    ld   d, h
    daa
    ld   d, l

label_2FCC2::
    dec  hl
    jp   nz, label_2365
    ld   b, b
    rst  $18
    add  a, d
    ld   d, c
    rst  $18
    add  a, h
    ld   h, b
    rst  $18
    ld   [hl], b

label_2FCCF::
    rst  $18
    add  a, d
    ld   [hl], e
    rst  $18
    add  a, h
    ld   b, $DF
    add  hl, bc
    dec  c
    jp   nz, label_D18
    call nz, label_DF19
    jp   label_D59
    db   $76 ; Halt
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    dec  e
    ld   a, b
    ld   d, b
    cp   $0C
    dec  c
    nop
    rst  $18
    ld   bc, label_1025
    dec  h
    ld   de, label_1829
    ld   a, [hli]

label_2FCF5::
    add  hl, de
    ld   h, $08
    ld   h, $09
    rst  $18
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   [hl], b
    rst  $18
    ld   [hl], c
    daa
    inc  bc
    rst  0
    ld   b, $C7
    add  a, h
    inc  sp
    dec  de
    add  a, h
    ld   b, e
    dec  de

label_2FD0D::
    add  a, d
    ld   d, h
    dec  de
    jr   c, label_2FD21
    ld   h, d
    rrca
    ld   l, b
    set  4, b
    nop
    call nc, label_3088
    cp   $0C
    dec  b
    nop

label_2FD1F::
    dec  c
    add  a, d

label_2FD21::
    ld   bc, $82DF
    inc  bc
    dec  c
    add  a, d
    dec  b
    rst  $18
    rlca

label_2FD2A::
    dec  c
    add  a, d

label_2FD2C::
    ld   [$82DF], sp
    db   $10 ; Undefined instruction
    ld   [de], a
    dec  h
    add  a, e
    inc  de
    ld   hl, label_2616
    rla
    rst  $18
    jr   label_2FD49
    add  hl, de
    rst  $18
    jr   nz, label_2FD1F
    ld   hl, label_2225
    add  hl, hl
    ld   h, $2A
    daa
    ld   h, $82

label_2FD49::
    jr   z, label_2FD2A
    jr   nc, label_2FD2C
    jp   nz, label_2331
    inc  [hl]
    and  b
    jp   label_2437
    jr   c, label_2FD36
    add  hl, sp
    dec  c
    jp   nz, label_D40

label_2FD5C::
    ld   c, b
    dec  c
    ld   c, c
    rst  $18
    ld   d, c

label_2FD61::
    daa
    ld   d, d
    dec  hl
    ld   e, b
    rst  $18
    ld   e, c
    dec  c
    add  a, d
    ld   h, b
    rst  $18
    ld   h, d
    daa
    add  a, h
    ld   h, e
    ldi  [hl], a
    ld   h, a
    jr   z, label_2FCF5
    ld   l, b
    rst  $18
    ld   [hl], b
    rst  $18
    add  a, d
    ld   [hl], c
    dec  c
    add  a, l
    ld   [hl], e
    rst  $18
    add  a, d
    ld   a, b
    dec  c
    ld   d, [hl]
    set  4, b
    nop
    xor  [hl]
    ld   c, b
    ld   [hl], b
    cp   $05
    sub  a, h
    adc  a, c
    jr   nz, label_2FD0D
    adc  a, c
    jr   nc, label_2FD11
    adc  a, c
    ld   b, b
    add  a, c
    adc  a, c
    ld   d, b
    add  a, c
    adc  a, c
    ld   h, b
    add  a, c
    adc  a, c
    ld   [hl], b
    add  a, c
    nop
    ld   d, a
    ld   bc, label_105E
    ld   e, [hl]
    ld   b, $5A
    rlca
    ld   d, c
    jp   nz, label_2D108
    ret  z
    add  hl, bc
    ld   d, c
    rla
    ld   e, d
    jr   z, label_2FE02
    ld   e, b
    ld   [hl], d
    ld   h, b
    ld   d, [hl]
    ld   [hl], b
    ld   d, a
    ld   [hl], c
    ld   d, [hl]
    ld   [hl], e
    ld   [hl], d
    db   $76 ; Halt
    ld   [hl], d
    ld   h, a
    ld   [hl], d
    ld   l, b
    ld   d, b
    ld   [hl], a
    ld   d, b
    ld   a, b
    ld   d, c
    ld   [rJOYP], a
    ld   a, [hli]
    ld   l, b

label_2FDC8::
    jr   nc, label_2FDC8
    inc  c
    dec  c
    add  a, d
    dec  b
    sbc  a, c
    add  a, e
    ld   de, $821B
    dec  d
    sbc  a, d
    add  a, d
    rla
    jr   nz, label_2FD5C
    ld   hl, label_281B
    jr   nz, label_2FD61
    ld   sp, $C31B
    inc  d
    ld   de, label_1241
    ld   b, e
    ld   [de], a
    ld   b, h
    sub  a, e
    add  a, e
    ld   d, c
    and  [hl]
    add  a, e
    ld   d, [hl]
    and  [hl]
    add  a, e
    ld   h, c
    and  [hl]
    add  a, e
    ld   h, [hl]
    and  [hl]
    ld   [de], a
    push bc
    ldi  [hl], a
    add  a, $74
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    db   $E3 ; Undefined instruction
    ld   c, b

label_2FDFF::
    jr   nc, label_2FDFF
    nop

label_2FE02::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
