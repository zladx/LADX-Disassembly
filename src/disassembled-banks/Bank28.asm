section "bank28",romx,bank[$1C]
    ld   bc, label_71934
    adc  a, l
    ld   e, c
    ld   c, [hl]
    ld   e, d
    db   $ED ; Undefined instruction
    ld   e, d
    ld   a, c
    ld   e, e
    rst  0
    ld   e, e
    ld   c, $5C
    cp   d
    ld   e, h
    ld   sp, hl
    ld   e, h
    ld   b, [hl]
    ld   e, l
    and  [hl]
    ld   e, l
    ld   c, e
    ld   e, [hl]
    sbc  a, b
    ld   e, [hl]
    ld   [$FF5E], a
    ld   l, $5F
    cp   b
    ld   e, a
    ldi  [hl], a
    ld   h, b
    ld   [hl], d
    ld   h, b
    and  e
    ld   h, b
    ld   c, c
    ld   h, c
    and  l
    ld   h, c
    dec  bc
    ld   h, d
    ld   b, l
    ld   h, d
    or   c
    ld   h, d
    ld   c, $63
    ld   c, l
    ld   h, e
    adc  a, h
    ld   h, e
    dec  [hl]
    ld   h, h
    ld   l, e
    ld   h, h
    sub  a, [hl]
    ld   h, h
    ld   a, [$FF64]
    ld   a, [hli]
    ld   h, l
    ld   d, d
    ld   h, l
    ld   e, e
    ld   h, l
    sbc  a, h
    ld   h, l
    or   l
    ld   h, l
    adc  a, $65
    daa
    ld   h, [hl]
    add  a, e
    ld   h, [hl]
    rst  $18
    ld   h, [hl]
    ld   e, l
    ld   h, a
    or   h
    ld   h, a
    dec  d
    ld   l, b
    ld   h, b
    ld   l, b
    ld   h, b
    ld   l, b
    sub  a, b
    ld   l, b
    cp   a
    ld   l, b
    cp   $68
    dec  hl
    ld   l, c
    ld   l, h
    ld   l, c
    sbc  a, e
    ld   l, c
    jp   z, label_F969
    ld   l, c
    ld   c, b

label_7006C::
    ld   l, d
    ld   l, b
    ld   l, d
    and  d
    ld   l, d
    and  d
    ld   l, d
    ld   [label_3A6A], a
    ld   l, e
    db   $3A ; ldd  a, [hl]
    ld   l, e
    ld   h, [hl]
    ld   l, e
    pop  de
    ld   l, e
    nop
    ld   l, h
    inc  e
    ld   l, h
    daa
    ld   l, h
    ld   d, a
    ld   l, h
    sbc  a, a
    ld   l, h
    ld   [rUNKN1], a
    ccf
    ld   l, l
    adc  a, e
    ld   l, l
    db   $EC ; Undefined instruction
    ld   l, l
    dec  de
    ld   l, [hl]
    sbc  a, e
    ld   l, [hl]
    call c, label_1D6E
    ld   l, a
    ld   a, [hl]
    ld   l, a
    jp   z, label_FB6F
    ld   l, a
    ld   h, a
    ld   [hl], b
    push de
    ld   [hl], b
    dec  e
    ld   [hl], c
    ld   l, [hl]
    ld   [hl], c
    and  h
    ld   [hl], c
    rst  $18
    ld   [hl], c
    ld   h, $72
    db   $E3 ; Undefined instruction
    ld   [hl], d
    sub  a, e
    ld   [hl], e
    or   d
    ld   [hl], e
    db   $D3 ; Undefined instruction
    ld   [hl], e
    db   $F4 ; Undefined instruction
    ld   [hl], e
    dec  d
    ld   [hl], h
    ld   [hl], $74
    ld   d, a
    ld   [hl], h
    ld   a, b
    ld   [hl], h
    sbc  a, c
    ld   [hl], h
    xor  d
    ld   [hl], h
    xor  d
    ld   [hl], h
    cp   e
    ld   [hl], h
    rst  $10
    ld   [hl], h
    push hl
    ld   [hl], h
    ld   [bc], a
    ld   [hl], l
    ld   de, label_2275
    ld   [hl], l
    ld   b, e
    ld   [hl], l
    ld   d, d
    ld   [hl], l
    ld   h, c
    ld   [hl], l
    ld   [hl], c
    ld   [hl], l
    add  a, d
    ld   [hl], l
    sub  a, e
    ld   [hl], l
    or   h
    ld   [hl], l
    push bc
    ld   [hl], l
    sub  a, $75
    rst  $20
    ld   [hl], l
    ld    hl, sp+$75
    add  hl, bc
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    ld   [hl], a
    add  hl, hl
    ld   [hl], a
    ld   b, [hl]
    ld   [hl], a
    ld   h, d
    ld   [hl], a
    ld   [hl], e
    ld   [hl], a
    sub  a, h
    ld   [hl], a
    and  l
    ld   [hl], a
    or   [hl]
    ld   [hl], a
    rst  0
    ld   [hl], a
    ret  c
    ld   [hl], a
    jp   [hl]
    ld   [hl], a
    ld   a, [label_70877]
    ld   a, b
    sub  a, d
    ld   a, b
    db   $D3 ; Undefined instruction
    ld   a, b
    ld   sp, label_72F79

label_70120::
    ld   a, c
    sub  a, b
    ld   a, c
    ret  c
    ld   a, c
    add  hl, hl
    ld   a, d
    ld   [label_327A], a
    ld   a, e
    add  a, e
    ld   a, e
    call label_E7B
    ld   a, h
    ld   e, e
    ld   a, h
    sub  a, a
    ld   a, h
    ldh  [$FF0C], a
    ld   a, h
    ld   b, $7D
    ld   d, [hl]
    ld   a, l
    or   a
    ld   a, l
    rrca
    ld   a, [hl]
    rrca
    ld   a, [hl]
    ld   d, l
    ld   a, [hl]
    and  e
    ld   a, [hl]
    db   $E3 ; Undefined instruction
    ld   a, [hl]
    inc  l
    ld   a, a
    ld   bc, label_1B57
    ld   d, a
    dec  [hl]
    ld   d, a
    ld   [hl], h
    ld   d, a
    dec  [hl]
    ld   e, b
    add  a, h
    ld   e, b
    jp  c, label_1058
    ld   e, c
    dec  sp
    ld   e, c
    ld   l, d
    ld   e, c
    sbc  a, d
    ld   e, c
    bit  3, c
    jr   label_701BD
    add  hl, sp
    ld   e, d
    ld   l, c
    ld   e, d
    xor  c
    ld   e, d
    ld   a, [bc]
    ld   e, e
    ld   b, h
    ld   e, e
    jp   nz, label_205B
    ld   e, h
    sbc  a, h
    ld   e, h
    sbc  a, h
    ld   e, h
    dec  de
    ld   e, l
    ld   [hl], d
    ld   e, l
    ld   [hl], d
    ld   e, l
    rst  8
    ld   e, l
    ld   a, a
    ld   e, [hl]
    ld   a, a
    ld   e, [hl]

label_70181::
    ld   a, a
    ld   e, [hl]
    jr   nc, label_701E5
    pop  bc
    ld   h, b
    rra
    ld   h, d
    adc  a, [hl]
    ld   h, d
    ld   e, a
    ld   h, e
    sbc  a, a
    ld   h, h
    ld   b, b
    ld   h, l
    xor  $65
    ld   l, a
    ld   h, a
    ld   l, e
    ld   l, b
    and  $68
    push de
    ld   l, c
    dec  d
    ld   l, e
    ld   h, c
    ld   l, e
    ld   h, c
    ld   l, e
    ld   [hl], d
    ld   l, l
    and  b
    ld   l, a
    and  b
    ld   l, a
    rst  $18
    ld   l, a
    rst  $18
    ld   l, a
    rst  $18
    ld   l, a
    ld   a, [$FF6F]
    ld   a, [$FF6F]
    inc  a
    ld   [hl], b
    add  a, [hl]
    ld   [hl], b
    db   $E4 ; Undefined instruction
    ld   [hl], c
    db   $10 ; Undefined instruction
    sub  a, b
    ld   [hl], d
    adc  a, a
    ld   [hl], e

label_701BD::
    cp   [hl]
    ld   [hl], e
    db   $F4 ; Undefined instruction
    ld   [hl], e
    ld   h, l
    ld   [hl], h
    or   c
    ld   [hl], h
    cpl
    ld   [hl], l
    ld   a, l
    ld   [hl], l
    bit  6, l
    add  hl, de
    halt
    halt
    halt
    ld   a, b
    ld   d, h
    ld   a, b
    or   b
    ld   a, b
    or   b
    ld   a, b
    or   b
    ld   a, b
    cp   $78
    ld   e, h
    ld   a, c
    xor  d
    ld   a, c
    ld   [de], a
    ld   a, d
    ld   d, d
    ld   a, d

label_701E5::
    add  a, e
    ld   a, d
    sbc  a, [hl]
    ld   a, d
    cp   c
    ld   a, d
    reti
    ld   a, d
    rla
    ld   a, h
    adc  a, b
    ld   a, h
    ret  z
    ld   a, h
    ld   b, $7D
    ld   [hl], a
    ld   a, l
    add  a, b
    ld   a, l
    adc  a, c
    ld   a, l
    cp   a
    ld   a, l
    or   $7D

label_701FF::
    ld   d, l
    ld   a, [hl]
    and  h
    ld   a, [hl]
    push bc
    ld   a, [hl]
    pop  hl
    ld   a, [hl]
    ld   [bc], a
    ld   a, a
    dec  e
    ld   a, a
    dec  sp
    ld   a, a
    ld   e, e
    ld   a, a
    adc  a, e
    ld   a, a
    ld   a, [hli]
    ld   c, e
    ld   [hl], d
    ld   c, e
    xor  e
    ld   c, e
    sub  a, $4B
    inc  b
    ld   c, h
    ld   h, b
    ld   c, h
    sbc  a, a
    ld   c, h
    rst  $30

label_70220::
    ld   c, h
    inc  sp
    ld   c, l
    sbc  a, h
    ld   c, l
    db   $EC ; Undefined instruction
    ld   c, l
    inc  l
    ld   c, [hl]
    ld   e, b
    ld   c, [hl]
    xor  a
    ld   c, [hl]
    ret  nz
    ld   c, [hl]
    ld    hl, sp+$4E
    ld   e, $4F
    sbc  a, [hl]
    ld   c, a
    dec  [hl]
    ld   d, b
    xor  l
    ld   d, b
    ldi  [hl], a
    ld   d, c
    ld   [hl], d
    ld   d, c
    sbc  a, $51
    ld   e, l
    ld   d, d
    di
    ld   d, d
    ld   d, a
    ld   d, e
    or   a
    ld   d, e

label_70247::
    ld   c, h
    ld   d, h
    add  a, c
    ld   d, h
    jp   nc, label_E54
    ld   d, l
    and  a
    ld   d, l
    jp   nz, label_1A55
    ld   d, [hl]
    ld   l, d
    ld   d, [hl]
    ld   [de], a
    ld   d, a
    ld   c, [hl]
    ld   d, a
    adc  a, a
    ld   d, a
    add  hl, de
    ld   e, b
    adc  a, b
    ld   e, b
    ld   h, e
    ld   e, c
    and  d
    ld   e, c
    dec  hl
    ld   e, d
    bit  3, d
    ld   l, c
    ld   e, e
    rst  0
    ld   e, e
    halt
    call nz, label_45C
    ld   e, l
    inc  sp
    ld   e, l
    ld   h, d
    ld   e, l
    ldh  [$FF0C], a
    ld   e, [hl]
    inc  a
    ld   e, a
    sbc  a, d
    ld   e, a
    ld   [de], a
    ld   h, b
    ld   c, a
    ld   h, b
    xor  a
    ld   h, b
    inc  l
    ld   h, c
    xor  c
    ld   h, c
    ld   l, d
    ld   h, d
    ld   a, [hli]
    ld   h, e
    jr   label_702F1
    sub  a, [hl]
    ld   h, h
    ld   l, $65
    sub  a, $65
    ld   e, [hl]
    ld   h, [hl]
    and  $66
    jp   label_71067
    ld   l, b
    adc  a, $68
    ld   e, [hl]
    ld   l, c
    ld   l, a
    ld   l, d
    db   $FD ; Undefined instruction
    ld   l, d
    ld   l, $6B
    ld   l, [hl]
    ld   l, e
    sbc  a, a
    ld   l, e
    ret  nc
    ld   l, e
    ld   bc, label_7006C
    ld   l, h
    ld   [hl], c
    ld   l, h
    and  c
    ld   l, h
    and  c
    ld   l, h
    cp   l
    ld   l, h
    db   $6C
    ld   l, h
    inc  e
    ld   l, l
    ld   l, b
    ld   l, l
    ret  z
    ld   l, l
    dec  d
    ld   l, [hl]
    dec  [hl]
    ld   l, [hl]
    ld   h, h
    ld   l, [hl]
    and  l
    ld   l, [hl]
    and  $6E
    inc  de
    ld   l, a
    ld   d, b
    ld   l, a
    adc  a, l
    ld   l, a
    ld   l, c
    ld   [hl], b
    push af
    ld   [hl], b
    ld   h, l
    ld   [hl], c
    and  d
    ld   [hl], c
    pop  de
    ld   [hl], c
    ld   e, a
    ld   [hl], d
    adc  a, a
    ld   [hl], d
    ret
    ld   [hl], d
    sub  a, c
    ld   [hl], e
    db   $FC ; Undefined instruction
    ld   [hl], e
    ld   a, d
    ld   [hl], h
    sub  a, h
    ld   [hl], h
    ldh  [$FF0C], a
    ld   [hl], h
    inc  sp
    ld   [hl], l
    ld   c, [hl]
    ld   [hl], l
    ld   a, e
    ld   [hl], l
    sbc  a, c
    ld   [hl], l

label_702F1::
    jr   label_70369
    add  a, d
    halt
    ld   [hl], a
    adc  a, b
    ld   [hl], a
    and  l
    ld   [hl], a
    ld   d, e
    ld   a, b
    add  a, e
    ld   a, b

label_702FF::
    add  hl, de
    ld   a, c
    add  a, c
    ld   a, c
    ldh  [$FF0C], a
    ld   a, c
    adc  a, a
    ld   a, d
    cp   [hl]
    ld   a, d
    and  $7A
    ld   d, $7B
    ld   h, d
    ld   a, e
    add  a, e
    ld   a, e
    or   b
    ld   a, e
    ld   sp, hl
    ld   a, e
    add  a, [hl]
    ld   a, h
    or   [hl]
    ld   a, h
    ld   b, e
    ld   a, l
    jp   z, label_47D
    ld   a, [hl]
    inc  h

label_70320::
    ld   a, [hl]
    nop
    ld   b, b
    ld   c, a
    ld   b, b
    adc  a, $40
    ld   a, l
    ld   b, c
    xor  l
    ld   b, c
    ld   c, [hl]
    ld   b, d
    db   $E3 ; Undefined instruction
    ld   b, d
    inc  h
    ld   b, e
    xor  a
    ld   b, e
    db   $10 ; Undefined instruction
    scf
    ld   b, h
    ld   a, b
    ld   b, h
    jr   nc, label_70380
    ld   a, e
    ld   b, l
    adc  a, h
    ld   b, l
    xor  l
    ld   b, l
    xor  l
    ld   b, l
    xor  $45
    ld   c, h
    ld   b, [hl]
    adc  a, l
    ld   b, [hl]
    sbc  a, [hl]
    ld   b, [hl]
    cp   a
    ld   b, [hl]
    db   $E8 ; add  sp, d
    ld   b, [hl]
    ld   sp, label_70247
    ld   b, a
    ld   [hl], d
    ld   b, a
    add  a, b
    ld   b, a
    adc  a, [hl]
    ld   b, a
    sbc  a, h
    ld   b, a
    xor  d
    ld   b, a
    rst  0
    ld   b, a
    or   $47
    inc  d
    ld   c, b
    inc  sp
    ld   c, b
    ld   d, d
    ld   c, b
    ld   [hl], e
    ld   c, b

label_70369::
    sub  a, h
    ld   c, b
    rst  8
    ld   c, b
    ld   a, [$FF48]
    ld   hl, label_71049
    ld   c, c
    ld   a, [hl]
    ld   c, c
    xor  h
    ld   c, c
    call label_FE49
    ld   c, c
    ld   a, [hli]

label_7037C::
    ld   c, d
    ld   h, d
    ld   c, d
    xor  e

label_70380::
    ld   c, d
    xor  e
    ld   c, d
    ld   a, [bc]
    ld   c, e
    ld   d, a
    ld   c, e
    ld   [hl], c
    ld   c, e
    or   d
    ld   c, e
    or   d
    ld   c, e
    inc  a
    ld   c, h
    ld   [$974D], sp
    ld   c, l
    or   a
    ld   c, l
    ld   d, $4E
    add  a, [hl]
    ld   c, [hl]
    pop  bc
    ld   c, [hl]
    pop  hl
    ld   c, [hl]
    ld   d, d
    ld   c, a
    or   d
    ld   c, a
    ld   e, $50
    ld   e, a
    ld   d, b
    xor  c
    ld   d, b
    add  a, $51
    rst  $38
    ld   d, c
    ld   e, b
    ld   d, d
    rst  0
    ld   d, d
    or   $52
    db   $10 ; Undefined instruction
    dec  de
    ld   d, h
    ei
    ld   d, h
    ld   c, d
    ld   d, l
    add  a, a
    ld   d, l
    push hl
    ld   d, l
    inc  l
    ld   d, [hl]
    ld   a, e
    ld   d, [hl]
    or   c
    ld   d, [hl]
    jp   nc, label_3156
    ld   d, a
    ld   l, b
    ld   d, a
    xor  c
    ld   d, a
    ld   a, [label_3957]
    ld   e, b
    ld   h, h
    ld   e, b
    inc  b
    ld   e, c
    or   b
    ld   e, c
    rst  $18
    ld   e, c
    dec  e
    ld   e, d
    add  hl, sp
    ld   e, d
    ld   h, h
    ld   e, d
    sub  a, b
    ld   e, d
    call label_7045A
    ld   e, e
    push hl
    ld   e, e
    dec  bc
    ld   e, h
    ld   a, c
    ld   e, h
    sbc  a, b
    ld   e, h
    cp   b
    ld   e, h
    ld   d, $5D
    ld   b, [hl]
    ld   e, l
    jp   nz, label_7095D
    ld   e, [hl]
    ld   e, d
    ld   e, [hl]
    halt
    adc  a, a
    ld   e, [hl]
    xor  d
    ld   e, [hl]
    ld   b, h
    ld   e, a

label_703FF::
    ret  nz
    ld   e, a
    ld   a, h
    ld   h, b
    ret  z
    ld   h, b
    sbc  a, b
    ld   h, c
    db   $E4 ; Undefined instruction
    ld   h, c
    and  h
    ld   h, d
    ld   [$FF62], a
    ld   a, [$FF63]
    inc  l
    ld   h, h
    ld   a, [hli]
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   [hl], e
    ld   h, [hl]
    sbc  a, a
    ld   h, [hl]
    ld   c, e
    ld   h, a
    jp  c, label_3667
    ld   l, b
    sbc  a, a

label_70420::
    ld   l, b
    sbc  a, a
    ld   l, b
    adc  a, $68
    rrca
    ld   l, c
    cpl
    ld   l, c
    ld   e, a
    ld   l, c
    adc  a, [hl]
    ld   l, c
    adc  a, $69
    ld   e, $6A
    adc  a, h
    ld   l, d
    ld   a, [label_7286A]
    ld   l, e
    sub  a, $6B
    rlca
    ld   l, h
    ld   b, c
    ld   l, h
    ld   h, a
    ld   l, h
    add  a, $6C
    add  a, $6C
    ld   [hl], l
    ld   l, [hl]
    pop  af
    ld   l, [hl]
    ld   b, d
    ld   l, a
    ld   h, d
    ld   l, a
    and  b
    ld   l, a
    ld   bc, label_3C70
    ld   [hl], b
    ld   a, b
    ld   [hl], b
    jr   nz, label_704C6
    cp   b
    ld   [hl], c
    ld   h, b
    ld   [hl], d
    xor  a

label_7045A::
    ld   [hl], d
    rlca
    ld   [hl], e
    dec  a
    ld   [hl], e
    sbc  a, h
    ld   [hl], e
    sbc  a, h
    ld   [hl], e
    bit  6, e
    ei
    ld   [hl], e
    inc  l
    ld   [hl], h
    ld   e, e
    ld   [hl], h
    adc  a, d
    ld   [hl], h
    sbc  a, d
    ld   [hl], h
    rst  $30
    ld   [hl], h
    ldi  [hl], a
    ld   [hl], l
    ld   d, e
    ld   [hl], l
    add  a, d
    ld   [hl], l
    jp   label_D475
    ld   [hl], l
    ld   l, e
    halt
    halt
    ld   [hl], a
    ld   a, $77
    and  $77
    sub  a, e
    ld   a, b
    ld   hl, $F279
    ld   a, c
    ld   [hl], e
    ld   a, d
    ld   d, c
    ld   a, e
    cpl
    ld   a, h
    sbc  a, $7C
    ld   c, h
    ld   a, l
    add  a, [hl]
    ld   a, l
    ld   [de], a
    ld   a, [hl]
    ld   d, e
    ld   a, [hl]
    ld   l, [hl]
    ld   a, a
    adc  a, [hl]
    ld   h, [hl]
    ld   b, $67
    ld   d, l
    ld   h, a
    and  l
    ld   h, a
    or   $67
    dec  d
    ld   l, b
    ld   a, [hl]
    ld   l, b
    xor  a
    ld   l, b
    sub  a, $68
    ld   [rBGPI], a
    ld   [label_2969], sp
    ld   l, c
    sub  a, a
    ld   l, c
    db   $69
    ld   l, c
    ld   e, $6A
    ld   l, h
    ld   l, d
    adc  a, b
    ld   l, d
    xor  l
    ld   l, d
    db   $E3 ; Undefined instruction
    ld   l, d
    ld   h, c
    ld   l, e
    and  d

label_704C6::
    ld   l, e
    ld   e, h
    ld   l, h
    sub  a, d
    ld   l, h
    cp   l
    ld   l, h
    push de
    ld   l, h
    ld   bc, $EE6D
    ld   l, l
    cp   h
    ld   l, [hl]
    db   $FC ; Undefined instruction
    ld   l, [hl]
    ld   h, l
    ld   l, a
    add  a, b
    ld   l, a
    sbc  a, c
    ld   l, a
    pop  de
    ld   l, a
    inc  c
    ld   [hl], b
    ld   b, h
    ld   [hl], b
    sbc  a, a
    ld   [hl], b
    and  [hl]
    ld   [hl], b
    cp   [hl]
    ld   [hl], b
    call label_F470
    ld   [hl], b
    dec  bc
    ld   [hl], c
    ld   l, e
    ld   [hl], c
    cp   c
    ld   [hl], c
    db   $F2 ; Undefined instruction
    ld   [hl], c
    ld   l, $72
    ld   c, b
    ld   [hl], d
    ld   l, a
    ld   [hl], d
    ld   a, b
    ld   [hl], d
    and  h
    ld   [hl], d

label_704FF::
    adc  a, $72
    ei
    ld   [hl], d
    daa
    ld   [hl], e
    ld   l, c
    ld   [hl], e
    sub  a, a
    ld   [hl], e
    push bc
    ld   [hl], e
    pop  af
    ld   [hl], e
    rra
    ld   [hl], h
    ld   c, l
    ld   [hl], h
    sub  a, d
    ld   [hl], h
    pop  de
    ld   [hl], h
    rlca
    ld   [hl], l
    ld   b, b
    ld   [hl], l
    sbc  a, c
    ld   [hl], l
    ld   a, [$FF75]
    ld   a, $76
    ld   a, c
    halt
    halt
    halt
    ld   [hl], a
    add  a, h
    ld   [hl], a
    cp   l
    ld   [hl], a
    jp   [hl]
    ld   [hl], a
    add  hl, hl
    ld   a, b
    jr   c, label_705A9
    ld   e, a
    ld   a, b
    sub  a, $78
    db   $FD ; Undefined instruction
    ld   a, b
    dec  [hl]
    ld   a, c
    ld   l, l
    ld   a, c
    and  l
    ld   a, c
    db   $79
    ld   a, c
    dec  d
    ld   a, d
    ld   c, l
    ld   a, d
    add  a, l
    ld   a, d
    cp   l
    ld   a, d
    push af
    ld   a, d
    dec  l
    ld   a, e
    ld   h, l
    ld   a, e
    xor  h
    ld   a, e
    ld   [label_7037C], sp
    ld   a, h
    ld   l, a
    ld   a, h
    ld   a, [hl]
    ld   a, h
    sub  a, b
    ld   a, h
    sbc  a, c
    ld   a, h
    cp   [hl]
    ld   a, h
    push hl
    ld   a, h
    ld   bc, $007D
    db   $10 ; Undefined instruction
    jr   nc, label_705A6
    ld   d, b
    ld   h, b
    ld   [hl], b
    add  a, b
    sub  a, b
    and  b
    or   b
    ret  nz
    ret  nc
    ld   [$FFF0], a
    nop
    db   $10 ; Undefined instruction
    jr   nc, label_705B6
    ld   d, b
    ld   h, b
    ld   [hl], b
    add  a, b
    sub  a, b
    and  b
    or   b
    ret  nz
    ret  nc
    ld   [$FFF0], a

label_70581::
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, l
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    ret  nc
    pop  de
    jp   nc, label_D4D3

label_705A6::
    push de
    sub  a, $D7

label_705A9::
    ret  c
    reti
    jp  c, label_DCDB
    db   $DE
    sbc  a, $DF
    ld   [$FFE1], a
    ldh  [$FF0C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction

label_705B6::
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    xor  $EF
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c

label_705FF::
    sbc  a, c
    sbc  a, c
    ld   b, d
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
    ld   d, b
    ld   d, c
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
    sub  a, b
    sub  a, c
    ld   h, d
    ld   h, e
    ld   h, h
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
    or   b
    or   c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [hl]
    dec  a
    ld   b, c
    nop
    adc  a, d
    adc  a, e
    ld   b, h
    ld   b, b
    ld   b, l
    ld   b, [hl]
    adc  a, h
    adc  a, l
    db   $3A ; ldd  a, [hl]
    ccf
    dec  sp
    nop
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    halt
    ld   a, b
    ld   a, c
    ld   b, d
    ld   b, e
    adc  a, [hl]
    nop
    adc  a, a
    inc  a
    nop
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
    ld   [de], a
    inc  de
    inc  d
    dec  d
    ld   d, $17
    jr   label_706B5
    nop
    nop
    nop
    ld   b, b
    nop
    nop
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    jr   nz, label_706CB
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_706DB
    ld   a, [hli]
    dec  hl
    inc  l

label_706B5::
    dec  l
    ld   l, $2F
    jr   nc, label_706EB
    ldd  [hl], a
    ld   a, $00
    nop
    nop
    nop
    nop
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, e
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    ld   d, b

label_706CB::
    ld   d, c
    ld   d, d
    ld   d, e
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ldd  [hl], a
    ld   l, a
    ld   l, l

label_706DB::
    ld   l, [hl]
    nop
    nop
    nop
    nop
    nop
    dec  a
    inc  a
    ccf
    ld   a, [hl]
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   a, d
    ld   a, e
    nop

label_706EB::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    halt
    ld   a, b
    ld   a, c
    sbc  a, e
    sbc  a, h
    sbc  a, l
    sbc  a, [hl]
    sbc  a, a
    jr   c, label_70702

label_70702::
    nop
    nop
    nop
    nop
    nop
    nop
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

label_70720::
    adc  a, a
    adc  a, b
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    sub  a, l
    adc  a, c
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    sbc  a, d
    add  a, a
    add  a, [hl]
    nop
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [hl]
    nop
    nop
    inc  d
    sub  a, h
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    sub  a, h
    inc  d
    inc  d
    inc  d
    sub  a, h
    inc  d
    inc  d
    sub  a, h
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    sub  a, h
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    sub  a, h
    inc  d
    sub  a, h
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]

label_707FF::
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    ld   d, $16
    sub  a, [hl]
    ld   d, $16

label_70820::
    ld   d, $16
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    ld   d, $16
    ld   d, $96
    ld   d, $16
    ld   d, $16
    ld   d, $16
    ld   d, $16
    ld   d, $16
    ld   d, $96
    sub  a, [hl]
    sub  a, [hl]
    ld   d, $16
    ld   d, $16
    ld   d, $16
    sub  a, [hl]
    ld   d, $16
    ld   d, $16
    ld   d, $16
    ld   d, $16
    ld   d, $9C
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
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
    inc  e
    inc  e
    inc  e
    inc  e

label_70877::
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
    inc  e
    sbc  a, h
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
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    dec  e
    sbc  a, l
    dec  e
    dec  e
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e

label_708FF::
    dec  e
    dec  e
    dec  e
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, l
    dec  e
    dec  e
    sbc  a, l
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e

label_70920::
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, l
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, l
    sbc  a, l
    dec  e
    sbc  a, l
    sbc  a, l
    sbc  a, l
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e

label_7095D::
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    sbc  a, l
    sbc  a, l
    sbc  a, l
    sbc  a, l
    sbc  a, l
    sbc  a, l
    sbc  a, l
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
    dec  e
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
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
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
    adc  a, c
    add  hl, bc
    add  hl, bc
    adc  a, c
    adc  a, c
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
    add  hl, bc
    add  hl, bc
    add  hl, bc
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    add  hl, bc
    add  hl, bc
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    adc  a, c
    ld   a, [$C170]
    and  $1F
    ld   e, a
    ld   d, $00
    ld   c, $01
    ld   b, $00
    ld   hl, label_70581
    add  hl, de
    ld   a, [hl]
    ld   hl, $D600
    add  hl, bc
    ldi  [hl], a
    push hl
    ld   hl, label_70561
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    ld   a, $4F
    ldi  [hl], a
    ld   a, $FF
    ldi  [hl], a
    ld   [hl], $00
    ret

label_70A18::
    ld   h, c
    ld   b, c
    add  a, c
    ld   hl, $81A1
    ld   h, c
    and  c

label_70A20::
    ld   b, c
    pop  bc

label_70A22::
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    ld   a, [$C19F]
    ld   c, a
    ld   a, [$C16F]
    cp   $05
    jr   z, label_70A71
    bit  7, c
    jr   z, label_70A3D
    add  a, $05

label_70A3D::
    ld   c, a
    ld   b, $00
    ld   e, $01
    ld   d, $00
    ld   a, [$C12E]
    ld   hl, label_70A22
    add  hl, bc
    add  a, [hl]
    ld   hl, $D600
    add  hl, de
    ldi  [hl], a
    push hl
    ld   a, [$C12F]
    ld   hl, label_70A18
    add  hl, bc
    add  a, [hl]
    pop  hl
    ldi  [hl], a
    ld   a, $51
    ldi  [hl], a
    ld   a, [$FFE8]
    ldi  [hl], a
    ld   [hl], $00
    ld   a, [$FFFE]
    and  a
    jr   z, label_70A6C
    call label_70A76

label_70A6C::
    ld   hl, $C16F
    inc  [hl]
    ret

label_70A71::
    ld   hl, $C19F
    inc  [hl]
    ret

label_70A76::
    ld   hl, $DC90
    ld   de, $D600
    ld   b, $04

label_70A7E::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    dec  b
    jr   nz, label_70A7E
    ld   a, $01
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_70A8A::
    and  c
    ld   hl, label_70181
    ld   h, c
    pop  bc
    ld   b, c
    and  c
    ld   h, c
    add  a, c

label_70A94::
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c

label_70A9E::
    ld   c, b
    nop
    ld   [hl], $12
    inc  h
    ld   c, b
    nop
    ld   [hl], $12
    inc  h
    ld   a, [$C19F]
    ld   c, a
    ld   a, [$C16F]
    cp   $05
    jr   z, label_70A71
    bit  7, c
    jr   z, label_70AB9
    add  a, $05

label_70AB9::
    ld   c, a
    ld   b, $00
    ld   e, $01
    ld   d, $00
    ld   a, [$C12E]
    ld   hl, label_70A94
    add  hl, bc
    add  a, [hl]
    ld   hl, $D600
    add  hl, de
    ldi  [hl], a
    push hl
    ld   a, [$C12F]
    ld   hl, label_70A8A
    add  hl, bc
    add  a, [hl]
    pop  hl
    ldi  [hl], a
    ld   a, $11
    ldi  [hl], a
    push hl
    ld   hl, label_70A9E
    add  hl, bc
    ld   a, [hl]
    ld   c, a
    ld   b, $00
    ld   hl, $D500
    add  hl, bc
    push hl
    pop  bc
    pop  hl
    ld   e, $12

label_70AED::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_70AED
    ld   [hl], $00
    ld   a, [$FFFE]
    and  a
    jr   z, label_70AFD
    call label_70B02

label_70AFD::
    ld   hl, $C16F
    inc  [hl]
    ret

label_70B02::
    push bc
    ld   hl, $DC90
    ld   de, $D600
    ld   b, $04

label_70B0B::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    dec  b
    jr   nz, label_70B0B
    pop  bc
    ld   a, c
    sub  a, $12
    ld   c, a
    ld   e, $12

label_70B18::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [bc]
    ld   d, a
    xor  a
    ld   [rSVBK], a
    ld   a, d
    ldi  [hl], a
    inc  bc
    dec  e
    jr   nz, label_70B18
    ld   [hl], $00
    ret
    ld   c, b
    ld   l, c
    ld   hl, label_70920
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_70BA1
    ld   h, l
    inc  l
    jr   nz, label_70BAC
    ld   l, b
    ld   h, l
    ld   [hl], b
    ld   l, b
    ld   l, a
    ld   [hl], h
    ld   l, a
    ld   h, a
    ld   [hl], d
    ld   h, c
    ld   [hl], b
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020
    jr   nz, label_70BA4
    ld   l, a
    ld   [hl], l
    jr   nz, label_70BC2
    ld   h, l
    ld   h, l
    ld   l, l
    jr   nz, label_70BB7
    ld   [hl], l
    ld   [hl], d
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, c
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_70BA8
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   [hl], b
    ld   h, c
    jr   nz, label_70B89
    jr   nz, label_70BC0
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   l, $FF
    ld   c, c
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_70BDB
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_70BF1
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_70BA2
    ld   e, [hl]
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    jr   nz, label_70BCE
    ld   l, c
    ld   [hl], e
    dec  l
    jr   nz, label_70BAF
    jr   nz, label_70BB1
    jr   nz, label_70BF6
    ld   l, a
    halt
    ld   [hl], d
    ld   [hl], e
    jr   nz, label_70BEF
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   e, [hl]
    ld   [hl], e

label_70BA1::
    jr   nz, label_70BF6
    ld   h, l

label_70BA4::
    ld   h, e
    ld   [hl], d
    ld   h, l
    ld   [hl], h

label_70BA8::
    ld   hl, $FF5E
    inc  hl

label_70BAC::
    inc  hl
    inc  hl
    inc  hl

label_70BAF::
    inc  hl
    inc  l

label_70BB1::
    jr   nz, label_70C21
    ld   l, a
    ld   [hl], a
    jr   nz, label_70C29

label_70BB7::
    ld   [hl], l
    ld   l, [hl]
    jr   nz, label_70BDB
    ld   h, c
    ld   [hl], a
    ld   h, c
    ld   a, c
    jr   nz, label_70C23
    ld   h, l

label_70BC2::
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_70C30
    ld   h, l
    jr   nz, label_70BEB
    ld   h, [hl]
    ld   l, c
    ld   l, [hl]

label_70BCE::
    ld   h, h
    ld   [hl], e
    jr   nz, label_70C4B
    ld   l, a
    ld   [hl], l
    ld   l, $FF
    ld   c, c
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_70C43
    ld   l, a
    jr   nz, label_70C43
    ld   h, l
    halt
    ld   l, h
    ld   l, a
    ld   [hl], b
    jr   nz, label_70C5B
    ld   l, b
    ld   l, c
    ld   [hl], e
    ld   l, $20
    ld   b, e
    ld   l, a
    ld   l, l

label_70BEF::
    ld   h, l
    jr   nz, label_70C65
    ld   h, l
    ld   h, l
    jr   nz, label_70C16

label_70BF6::
    ld   l, c
    ld   [hl], h
    jr   nz, label_70C66
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    inc  l

label_70BFF::
    jr   nz, label_70C50
    ld   c, e
    ccf
    rst  $38
    ld   c, c
    jr   nz, label_70C71
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_70C58
    ld   c, a
    ld   d, [hl]
    ld   b, l
    jr   nz, label_70C85
    ld   l, a
    jr   nz, label_70C34
    ld   [hl], h
    ld   h, c

label_70C16::
    ld   l, e
    ld   h, l
    jr   nz, label_70C8A
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   [hl], e

label_70C21::
    ld   l, $20

label_70C23::
    jr   nz, label_70C7C
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_70CA3
    ld   l, a
    ld   [hl], l
    jr   nz, label_70C9A
    ld   h, l
    ld   [hl], h

label_70C30::
    jr   nz, label_70C9F
    ld   h, l
    jr   nz, label_70CA9
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_70CB3
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_70C5F
    jr   nz, label_70C61
    jr   nz, label_70C63

label_70C43::
    jr   nz, label_70CB5
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l

label_70C4B::
    ccf
    jr   nz, label_70C6E
    jr   nz, label_70C70

label_70C50::
    jr   nz, label_70C72
    jr   nz, label_70C74
    jr   nz, label_70C76
    jr   nz, label_70C78

label_70C58::
    ld   e, c
    ld   b, l
    ld   d, e

label_70C5B::
    jr   nz, label_70C7D
    ld   c, [hl]
    ld   c, a

label_70C5F::
    cp   $47

label_70C61::
    ld   l, a
    jr   nz, label_70CD8
    ld   l, a

label_70C65::
    jr   nz, label_70CDB
    ld   l, b
    ld   h, l
    jr   nz, label_70CCD
    ld   h, c
    ld   h, e
    ld   l, e

label_70C6E::
    jr   nz, label_70C90

label_70C70::
    ld   l, a

label_70C71::
    ld   h, [hl]

label_70C72::
    jr   nz, label_70CE8

label_70C74::
    ld   l, b
    ld   h, l

label_70C76::
    jr   nz, label_70CEA

label_70C78::
    ld   l, a
    ld   l, a
    ld   l, l
    jr   nz, label_70CDE

label_70C7D::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_70CF4
    ld   [hl], h
    ld   h, c
    ld   l, [hl]
    ld   h, h

label_70C85::
    jr   nz, label_70CF0
    ld   l, [hl]
    jr   nz, label_70CF0

label_70C8A::
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_70CB0

label_70C90::
    ld   l, a
    ld   h, [hl]
    jr   nz, label_70D08
    ld   l, b
    ld   h, l
    jr   nz, label_70D0B
    ld   h, e
    ld   [hl], d

label_70C9A::
    ld   h, l
    ld   h, l
    ld   l, [hl]
    ld   l, $FF

label_70C9F::
    ld   c, b
    ld   h, l
    ld   a, c
    ld   hl, label_70920
    jr   nz, label_70D0F
    ld   h, c
    halt
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_70CCF
    ld   [hl], h

label_70CB0::
    ld   h, c
    ld   l, e
    ld   h, l

label_70CB3::
    ld   l, [hl]
    jr   nz, label_70D2F
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_70CDB
    jr   nz, label_70CDD
    jr   nz, label_70CDF
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_70D41
    ld   h, l
    ld   [hl], h
    ld   hl, label_70720

label_70CCD::
    ld   l, a
    jr   nz, label_70D32
    ld   h, c
    ld   h, e
    ld   l, e
    jr   nz, label_70D36
    ld   l, [hl]
    ld   h, h
    jr   nz, label_70D4C
    ld   [hl], h
    ld   h, c

label_70CDB::
    ld   l, [hl]
    ld   h, h

label_70CDD::
    jr   nz, label_70CFF

label_70CDF::
    ld   l, c
    ld   l, [hl]
    jr   nz, label_70D49
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_70D58
    ld   h, [hl]

label_70CEA::
    jr   nz, label_70D60
    ld   l, b
    ld   h, l
    jr   nz, label_70D63

label_70CF0::
    ld   h, e
    ld   [hl], d
    ld   h, l
    ld   h, l

label_70CF4::
    ld   l, [hl]
    ld   hl, label_709FF
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_70D60
    ld   h, c
    ld   l, h

label_70CFF::
    ld   l, h
    jr   nz, label_70D76
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_70D27
    ld   e, [hl]

label_70D08::
    ld   c, b
    ld   h, l
    ld   [hl], d

label_70D0B::
    ld   h, l
    jr   nz, label_70D61
    ld   [hl], h

label_70D0F::
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   [hl], e
    jr   nz, label_70D56
    jr   nz, label_70D37
    ld   b, d
    ld   [hl], d
    ld   h, c
    halt
    jr   nz, label_70D6B
    ld   h, c
    ld   l, [hl]

label_70D20::
    ld   l, $5E
    jr   nz, label_70D44
    jr   nz, label_70D46
    jr   nz, label_70D7B
    ld   h, c
    ld   a, c
    jr   nz, label_70D8F
    ld   l, b
    ld   h, l
    ld   h, l

label_70D2F::
    ld   [hl], e
    ld   h, l
    ld   hl, label_714FF
    ld   l, b
    ld   l, c

label_70D36::
    ld   [hl], e

label_70D37::
    jr   nz, label_70DA8
    ld   [hl], a
    ld   l, h
    jr   nz, label_70DB0
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   [hl], l

label_70D41::
    ld   h, l
    jr   nz, label_70DAD

label_70D44::
    ld   [hl], e
    jr   nz, label_70DBB
    ld   [hl], d
    ld   a, c

label_70D49::
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_70D4C::
    jr   nz, label_70DC2
    ld   l, a
    jr   nz, label_70DC4
    ld   h, c
    ld   a, c
    ld   [hl], e
    ld   l, a
    ld   l, l

label_70D56::
    ld   h, l
    ld   [hl], h

label_70D58::
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    inc  l
    jr   nz, label_70DC1
    ld   [hl], l

label_70D60::
    ld   [hl], h

label_70D61::
    jr   nz, label_70D83

label_70D63::
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_70DCB
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]

label_70D6B::
    ld   [hl], h
    jr   nz, label_70D8E
    jr   nz, label_70D90
    jr   nz, label_70D92
    jr   nz, label_70DE9
    ld   l, [hl]
    ld   h, h

label_70D76::
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   h, c

label_70D7B::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_70DE8
    ld   [hl], h
    jr   nz, label_70DA2
    jr   nz, label_70DE6
    ld   h, l
    ld   h, e
    ld   h, c
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_70DF5
    ld   [hl], h
    jr   nz, label_70DF7

label_70D8F::
    ld   h, c

label_70D90::
    ld   [hl], e
    jr   nz, label_70DB3
    ld   l, [hl]
    ld   l, a
    jr   nz, label_70DF9
    ld   h, l
    ld   h, c
    ld   l, e
    ld   l, $FF
    ld   e, [hl]
    ld   c, c
    ld   e, [hl]
    halt
    jr   nz, label_70E0A
    ld   l, a
    ld   [hl], h
    jr   nz, label_70E1E
    ld   l, b

label_70DA8::
    ld   h, c
    ld   [hl], h
    jr   nz, label_70DCC
    ld   [hl], a

label_70DAD::
    ld   h, c
    ld   [hl], e
    jr   nz, label_70E1A
    ld   l, [hl]
    ld   [hl], e

label_70DB3::
    ld   l, c
    ld   h, h
    ld   h, l
    jr   nz, label_70E2C
    ld   l, b
    ld   l, c
    ld   [hl], e

label_70DBB::
    jr   nz, label_70E1F
    ld   l, a
    ld   a, b
    ld   l, $20

label_70DC1::
    jr   nz, label_70E06
    ld   l, a

label_70DC4::
    ld   l, l
    ld   h, l
    jr   nz, label_70E29
    ld   l, [hl]
    ld   h, h
    jr   nz, label_70DEC

label_70DCC::
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_70E3A
    ld   [hl], h
    inc  l
    jr   nz, label_70E3E
    ld   h, [hl]
    jr   nz, label_70E51
    ld   l, a
    ld   [hl], l
    jr   nz, label_70DFC
    ld   h, e
    ld   h, c
    ld   l, [hl]
    ld   hl, label_205E
    jr   nz, label_70E31
    ld   h, c
    ld   [hl], e

label_70DE6::
    ld   [hl], h
    ld   h, l

label_70DE8::
    ld   [hl], d

label_70DE9::
    jr   nz, label_70DC7
    rst  $38

label_70DEC::
    ld   b, a
    ld   [hl], l
    ld   l, h
    ld   [hl], b
    ld   hl, label_2020
    ld   e, c
    ld   l, a

label_70DF5::
    ld   [hl], l
    jr   nz, label_70E5E
    ld   l, a

label_70DF9::
    ld   [hl], l
    ld   l, [hl]
    ld   h, h

label_70DFC::
    ld   l, l
    ld   h, l
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d

label_70E06::
    ld   h, l
    jr   nz, label_70E6A
    jr   nz, label_70E2B
    jr   nz, label_70E7F
    ld   h, l
    ld   h, c
    ld   l, h
    jr   nz, label_70E82
    ld   h, l
    ld   [hl], e
    ld   l, e
    ld   a, c
    jr   nz, label_70E83
    ld   l, c
    ld   h, h

label_70E1A::
    inc  l
    jr   nz, label_70E96
    ld   l, a

label_70E1E::
    ld   [hl], l

label_70E1F::
    jr   nz, label_70E8C
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_70E9A
    ld   l, b
    ld   h, c
    ld   [hl], h

label_70E29::
    ccf
    ld   hl, label_701FF
    ld   [hl], d
    ld   [hl], d
    ld   h, a
    ld   l, b

label_70E31::
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_70E9A
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]

label_70E3A::
    ld   [hl], h
    jr   nz, label_70E9F
    ld   h, l

label_70E3E::
    ld   h, c
    ld   [hl], h
    jr   nz, label_70EBB
    ld   l, a
    ld   [hl], l
    ld   hl, label_2020
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_70E6C
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   h, c

label_70E51::
    jr   nz, label_70EBB
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_719FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_70EBE
    ld   h, a

label_70E5E::
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ccf
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   l, e
    ld   h, l

label_70E6A::
    ld   h, l
    ld   [hl], b

label_70E6C::
    jr   nz, label_70ED5
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_70ED5
    ld   l, [hl]
    ld   h, h
    jr   nz, label_70E98
    ld   h, a
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, $2E

label_70E7F::
    ld   l, $20
    ld   c, c

label_70E82::
    jr   nz, label_70EE7
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, h

label_70E8C::
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_70F0A
    ld   l, a
    ld   [hl], l
    ld   hl, label_2020

label_70E96::
    jr   nz, label_70EB8

label_70E98::
    ld   b, c
    ld   l, h

label_70E9A::
    ld   l, h
    jr   nz, label_70F0F
    ld   l, c
    ld   h, a

label_70E9F::
    ld   l, b
    ld   [hl], h
    inc  l
    jr   nz, label_70F10
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    ld   h, h
    ld   l, a
    jr   nz, label_70F15
    ld   [hl], h
    ld   hl, label_717FF
    ld   c, a
    ld   c, a
    ld   b, [hl]
    ld   hl, label_70420
    ld   l, c
    ld   h, a

label_70EB8::
    ld   hl, label_71220

label_70EBB::
    ld   d, l
    ld   b, [hl]
    ld   b, [hl]

label_70EBE::
    ld   hl, label_719FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_70F35
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_70F3D
    ld   l, b
    ld   h, l
    jr   nz, label_70EED
    jr   nz, label_70EEF
    jr   nz, label_70F3E
    ld   l, c
    ld   [hl], e
    ld   [hl], e
    ld   l, c

label_70ED5::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_70F4C
    ld   h, e
    ld   h, c
    ld   l, h
    ld   h, l
    jr   nz, label_70F48
    ld   l, [hl]
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_70F52
    ld   h, l
    ld   [hl], d

label_70EE7::
    ld   l, l
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_70F0D

label_70EED::
    jr   nz, label_70F0F

label_70EEF::
    jr   nz, label_70F64
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   [hl], l
    ld   h, l
    ld   hl, label_708FF
    ld   h, l
    ld   a, c
    ld   hl, label_70220
    ld   h, l
    jr   nz, label_70F6E
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_70F26
    jr   nz, label_70F28
    ld   h, e
    ld   h, c

label_70F0A::
    ld   [hl], d
    ld   h, l
    ld   h, [hl]

label_70F0D::
    ld   [hl], l
    ld   l, h

label_70F0F::
    jr   nz, label_70F7F
    ld   h, l
    ld   a, b
    ld   [hl], h
    jr   nz, label_70F36
    jr   nz, label_70F38
    ld   [hl], h
    ld   l, c
    ld   l, l
    ld   h, l
    ld   hl, label_708FF
    ld   h, l

label_70F20::
    ld   a, c
    inc  l
    jr   nz, label_70F91
    ld   h, c
    ld   l, [hl]

label_70F26::
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_70FA8
    ld   l, a
    ld   [hl], l
    jr   nz, label_70FAA
    ld   h, c
    ld   l, [hl]

label_70F35::
    ld   [hl], h

label_70F36::
    jr   nz, label_70FAC

label_70F38::
    ld   l, a
    jr   nz, label_70FAE
    ld   h, c
    halt

label_70F3E::
    ld   l, d
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_70FB4
    ld   [hl], l
    ld   [hl], e
    ld   l, b
    jr   nz, label_70FAA
    ld   l, h
    ld   l, h
    jr   nz, label_70F6D
    jr   nz, label_70FC3
    ld   l, b
    ld   h, l
    jr   nz, label_70F95
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_70FBC
    ld   [hl], h
    jr   nz, label_70F7E
    ld   l, a
    ld   l, [hl]
    ld   h, e
    ld   h, l
    ld   hl, label_2020
    ld   d, l
    ld   l, b
    ld   l, b
    ld   l, $2E
    ld   l, $20
    jr   nz, label_70F8E

label_70F6E::
    ld   b, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_70FD6
    ld   [hl], e
    ld   l, e
    jr   nz, label_70FE6
    ld   h, l
    jr   nz, label_70F9C
    jr   nz, label_70F9E

label_70F7E::
    ld   [hl], a

label_70F7F::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_70FF8
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_70FF6
    ld   h, l
    ld   h, c
    ld   l, [hl]
    ld   [hl], e
    inc  l

label_70F8E::
    ld   c, c
    ld   e, [hl]
    ld   l, l

label_70F91::
    jr   nz, label_70FFD
    ld   [hl], l
    ld   [hl], e

label_70F95::
    ld   [hl], h
    jr   nz, label_70FF9
    jr   nz, label_71005
    ld   l, c
    ld   h, h

label_70F9C::
    ld   hl, label_717FF
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_7100E
    ld   [hl], h
    jr   nz, label_7101B

label_70FA8::
    ld   h, l
    ld   h, l

label_70FAA::
    ld   l, l
    ld   [hl], e

label_70FAC::
    jr   nz, label_70FCE

label_70FAE::
    ld   [hl], h
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71015

label_70FB4::
    ld   h, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_71033
    ld   l, a
    ld   [hl], l

label_70FBC::
    jr   nz, label_70FDE
    ld   [hl], e
    ld   h, c
    halt
    inc  l

label_70FC3::
    jr   nz, label_7103E
    ld   l, a
    ld   [hl], l
    jr   nz, label_71040
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_70FEE

label_70FCE::
    ld   [hl], e
    ld   [hl], h
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    jr   nz, label_71036
    ld   [hl], h

label_70FD6::
    jr   nz, label_7104C
    ld   l, b
    ld   h, l
    jr   nz, label_70FFC
    jr   nz, label_70FFE

label_70FDE::
    ld   l, h
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_71048
    ld   l, a
    ld   l, a

label_70FE6::
    ld   [hl], d
    jr   nz, label_71062
    ld   l, a
    ld   [hl], l
    jr   nz, label_7100D
    jr   nz, label_71066
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_71068
    ld   l, b
    ld   [hl], d

label_70FF6::
    ld   l, a
    ld   [hl], l

label_70FF8::
    ld   h, a

label_70FF9::
    ld   l, b
    ld   l, $2E

label_70FFC::
    ld   l, $20

label_70FFE::
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_71071
    ld   l, a
    ld   [hl], h

label_71005::
    jr   nz, label_71079
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    jr   nz, label_7102E

label_7100E::
    ld   [hl], e
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_7108B
    ld   l, b

label_71015::
    ld   a, c
    jr   nz, label_7108C
    ld   l, b
    ld   h, c
    ld   [hl], h

label_7101B::
    jr   nz, label_71086
    ld   [hl], e
    ld   e, [hl]
    ld   h, e
    ld   h, c
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_7106F
    ld   e, [hl]
    ld   l, l
    jr   nz, label_71094
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_71090
    jr   nz, label_7109C
    ld   l, c
    ld   h, h

label_71033::
    ld   hl, label_709FF

label_71036::
    jr   nz, label_710A0
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_710B2

label_7103E::
    ld   l, b
    ld   h, c

label_71040::
    ld   [hl], h
    jr   nz, label_710BC
    ld   l, a
    ld   [hl], l
    ld   h, e
    ld   h, c
    ld   l, [hl]

label_71048::
    jr   nz, label_710BA
    ld   [hl], d
    ld   h, l

label_7104C::
    ld   [hl], e
    ld   [hl], e
    jr   nz, label_710A3
    ld   b, l
    ld   c, h
    ld   b, l
    ld   b, e
    ld   d, h
    ld   [hl], h
    ld   l, a
    jr   nz, label_710C5
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_710BF
    ld   [hl], h
    jr   nz, label_710D5
    ld   l, b

label_71062::
    ld   h, l
    jr   nz, label_71085
    ld   l, c

label_71066::
    ld   [hl], e

label_71067::
    ld   l, h

label_71068::
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_710DA
    ld   h, c
    ld   [hl], b

label_7106F::
    ld   l, $2E

label_71071::
    ld   l, $20
    jr   nz, label_71095
    ld   b, d
    ld   [hl], l
    ld   [hl], h
    inc  l

label_71079::
    jr   nz, label_710C4
    jr   nz, label_710E1
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_710A3
    jr   nz, label_710A5

label_71085::
    ld   [hl], l

label_71086::
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    ld   [hl], e

label_7108B::
    ld   [hl], h

label_7108C::
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_71108
    ld   l, b
    ld   h, c
    ld   [hl], h

label_71094::
    jr   nz, label_7110A
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_71108
    ld   h, l

label_7109C::
    ld   h, c
    ld   l, [hl]
    jr   nz, label_71102

label_710A0::
    ld   a, c
    jr   nz, label_710C3

label_710A3::
    jr   nz, label_710C5

label_710A5::
    ld   [hl], h
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   l, $2E
    ld   l, $FF
    ld   d, a
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_7112C
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_710DA

label_710BA::
    jr   nz, label_710DC

label_710BC::
    jr   nz, label_71130
    ld   [hl], l

label_710BF::
    ld   l, [hl]
    ld   l, [hl]
    ld   l, c
    ld   l, [hl]

label_710C3::
    ld   h, a

label_710C4::
    jr   nz, label_71135
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_71139
    ld   h, [hl]
    jr   nz, label_710ED
    ld   c, b
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   [hl], e
    inc  l
    jr   nz, label_7114F
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   h, h

label_710DA::
    jr   nz, label_710FC

label_710DC::
    jr   nz, label_71140
    ld   h, l
    ld   [hl], h
    ld   [hl], h

label_710E1::
    ld   h, l
    ld   [hl], d
    jr   nz, label_7114A
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_7114C
    jr   nz, label_7110D

label_710ED::
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_71163
    ld   [hl], d
    jr   nz, label_7115A
    ld   h, c
    halt
    ld   l, $2E

label_710FC::
    ld   l, $57
    ld   l, b
    ld   a, c
    ccf
    jr   nz, label_71123
    ld   c, c
    jr   nz, label_7116E
    ld   h, c
    halt
    jr   nz, label_71179
    ld   l, a
    jr   nz, label_71177
    ld   h, h
    ld   h, l
    ld   h, c
    inc  l
    jr   nz, label_7115D
    ld   e, [hl]
    ld   l, l
    jr   nz, label_71182
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_7117E
    ld   l, e
    ld   l, c
    ld   h, h
    ld   hl, label_708FF

label_71123::
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_7118C
    ld   [hl], l
    ld   h, h
    ld   h, l
    ld   hl, label_71720
    ld   l, b
    ld   h, c

label_71130::
    ld   [hl], h
    jr   nz, label_71197
    ld   l, a
    jr   nz, label_711AF
    ld   l, a
    ld   [hl], l
    jr   nz, label_711AE
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_711AF

label_71140::
    ld   h, [hl]
    jr   nz, label_71190
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ccf
    jr   nz, label_7116A

label_7114A::
    ld   d, l
    ld   l, b

label_7114C::
    ld   l, b
    ld   l, $2E

label_7114F::
    ld   l, $20
    jr   nz, label_7119C
    jr   nz, label_711B9
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_711C6
    ld   l, [hl]
    ld   l, a

label_7115D::
    ld   [hl], a
    inc  l
    jr   nz, label_71181
    jr   nz, label_711AC

label_71163::
    ld   e, [hl]
    ld   l, l
    jr   nz, label_711D1
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_7116A::
    jr   nz, label_711CD
    jr   nz, label_711D9

label_7116E::
    ld   l, c
    ld   h, h
    ld   hl, label_717FF
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_71177::
    jr   nz, label_711DA

label_71179::
    ld   [hl], d
    ld   h, l
    jr   nz, label_711F6
    ld   l, a

label_7117E::
    ld   [hl], l
    jr   nz, label_711A1

label_71181::
    jr   nz, label_711E9
    ld   [hl], d
    ld   l, a
    ld   l, l
    inc  l
    jr   nz, label_711EB
    ld   [hl], d
    ld   l, a
    ld   [hl], h

label_7118C::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ccf

label_71190::
    jr   nz, label_711B2
    ld   l, $2E
    ld   l, $4F
    ld   [hl], l

label_71197::
    ld   [hl], h
    ld   [hl], e
    ld   l, c
    ld   h, h
    ld   h, l

label_7119C::
    jr   nz, label_71212
    ld   l, b
    ld   h, l
    jr   nz, label_711C2
    ld   l, c
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ccf
    jr   nz, label_711CB
    ld   d, a

label_711AC::
    ld   l, b
    ld   h, c

label_711AE::
    ld   [hl], h

label_711AF::
    jr   nz, label_7121A
    ld   [hl], e

label_711B2::
    ld   e, [hl]
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   [hl], e
    ld   l, c
    ld   h, h

label_711B9::
    ld   h, l
    ccf
    ld   e, [hl]
    jr   nz, label_711DE
    ld   c, c
    ld   e, [hl]
    halt

label_711C2::
    ld   l, [hl]
    ld   h, l
    halt

label_711C6::
    ld   [hl], d
    jr   nz, label_7123D
    ld   l, b
    ld   l, a

label_711CB::
    ld   [hl], l
    ld   h, a

label_711CD::
    ld   l, b
    ld   [hl], h
    jr   nz, label_711F1

label_711D1::
    jr   nz, label_71234
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_71242

label_711D9::
    ld   [hl], h

label_711DA::
    ld   l, $2E
    ld   l, $FF

label_711DE::
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_7124A
    ld   l, c
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_7124E

label_711E9::
    ld   h, a
    ld   h, a

label_711EB::
    jr   nz, label_7125C
    ld   l, [hl]
    ld   [hl], h
    ld   l, a
    ld   [hl], b

label_711F1::
    jr   nz, label_71262
    ld   h, [hl]
    jr   nz, label_7124A

label_711F6::
    ld   h, c
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, e
    ld   l, b
    ld   c, l
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ccf
    jr   nz, label_71229
    ld   d, h
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_71282
    ld   h, c
    ld   a, c
    jr   nz, label_71287
    ld   l, b
    ld   h, l
    jr   nz, label_7126E
    ld   l, c
    ld   l, [hl]
    ld   h, h

label_7121A::
    jr   nz, label_7123C
    jr   nz, label_7123E
    ld   b, [hl]
    ld   l, c

label_71220::
    ld   [hl], e
    ld   l, b
    jr   nz, label_7128D
    ld   [hl], e
    jr   nz, label_7129A
    ld   l, h
    ld   h, l

label_71229::
    ld   h, l
    ld   [hl], b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    ld   l, c
    ld   h, h
    ld   h, l

label_71234::
    jr   nz, label_712A5
    ld   h, [hl]
    jr   nz, label_712A2
    ld   [hl], h
    ld   l, $2E

label_7123C::
    ld   l, $20

label_7123E::
    ld   d, a
    ld   l, b
    ld   a, c
    ccf

label_71242::
    jr   nz, label_71264
    ld   c, c
    jr   nz, label_712AB
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]

label_7124A::
    ld   [hl], h
    jr   nz, label_7126D
    jr   nz, label_712BA
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_712B9
    ld   l, c
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   l, $2E
    ld   l, $FF
    ld   b, h
    ld   [hl], l
    ld   h, h
    ld   h, l
    ld   hl, label_2020

label_71264::
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_7128C
    jr   nz, label_712CF

label_7126E::
    ld   [hl], e
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_712E2
    ld   h, l
    jr   nz, label_712EF
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_7129D
    ld   [hl], a
    ld   h, l
    jr   nz, label_712F4
    ld   [hl], h

label_71282::
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   h, l
    ld   h, h

label_71287::
    jr   nz, label_712FD
    ld   l, a
    jr   nz, label_712AC

label_7128C::
    jr   nz, label_712FA
    ld   l, c
    halt
    jr   nz, label_71302
    ld   l, [hl]
    jr   nz, label_7130A
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_712BB
    jr   nz, label_712BD

label_7129D::
    ld   l, c
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]

label_712A2::
    ld   h, h
    ccf
    jr   nz, label_712C6
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71310

label_712AC::
    ld   l, a
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_7131F
    ld   h, l
    ld   h, c
    ld   l, [hl]
    jr   nz, label_71319
    ld   a, c
    jr   nz, label_712DA

label_712BA::
    jr   nz, label_712DC
    jr   nz, label_7131C
    ld   [hl], a
    ld   l, b
    ld   h, l
    ld   l, [hl]
    ccf
    ld   e, [hl]
    jr   nz, label_712E6

label_712C6::
    ld   d, a
    ld   l, b
    ld   l, a
    ld   h, c
    ld   hl, label_2020
    ld   d, h
    ld   l, b

label_712CF::
    ld   h, l
    jr   nz, label_71335
    ld   l, a
    ld   l, [hl]
    ld   h, e
    ld   h, l
    ld   [hl], b
    ld   [hl], h
    jr   nz, label_71344

label_712DA::
    ld   [hl], l
    ld   [hl], e

label_712DC::
    ld   [hl], h
    ld   l, l
    ld   h, c
    ld   l, e
    ld   h, l
    ld   [hl], e

label_712E2::
    jr   nz, label_71351
    ld   a, c
    jr   nz, label_7134F
    ld   h, l
    ld   h, c
    ld   h, h
    jr   nz, label_7130C
    jr   nz, label_71356
    ld   [hl], l

label_712EF::
    ld   [hl], d
    ld   [hl], h
    ld   hl, label_70DFF

label_712F4::
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ccf
    jr   nz, label_7134E
    ld   l, b
    ld   h, l

label_712FD::
    jr   nz, label_7136B
    ld   l, c
    ld   l, e
    ld   h, l

label_71302::
    ld   [hl], e
    ld   [hl], h
    ld   l, a
    jr   nz, label_7136E
    ld   l, a
    jr   nz, label_7137D

label_7130A::
    ld   [hl], h
    ld   h, c

label_7130C::
    ld   [hl], d
    ld   h, l
    jr   nz, label_71371

label_71310::
    ld   [hl], h
    jr   nz, label_71333
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_71387
    ld   h, e

label_71319::
    ld   h, l
    ld   h, c
    ld   l, [hl]

label_7131C::
    jr   nz, label_7137F
    ld   l, h

label_7131F::
    ld   l, h

label_71320::
    jr   nz, label_71384
    ld   a, c
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ld   h, l
    ld   l, h
    ld   h, [hl]
    ld   l, $2E
    ld   l, $20
    jr   nz, label_71387
    ld   l, b
    ld   a, c
    ccf

label_71333::
    ld   c, b
    ld   h, l

label_71335::
    ld   a, c
    inc  l
    jr   nz, label_71382
    ld   e, [hl]
    ld   l, l
    jr   nz, label_713A7
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_713A3
    jr   nz, label_713AF

label_71344::
    ld   l, c
    ld   h, h
    inc  l
    jr   nz, label_713AD
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_713B0

label_7134F::
    ld   [hl], e
    ld   l, e

label_71351::
    jr   nz, label_71373
    ld   l, l
    ld   h, l
    ld   hl, label_708FF
    ld   h, l
    ld   a, c
    ld   l, $2E
    ld   l, $20
    ld   d, a
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_713E1
    ld   l, a
    ld   [hl], l
    jr   nz, label_713E0
    ld   [hl], a
    ld   l, a

label_7136E::
    jr   nz, label_713D7
    ld   l, a

label_71371::
    ld   l, c
    ld   l, [hl]

label_71373::
    ld   h, a
    jr   nz, label_71396
    jr   nz, label_713EC
    ld   l, a
    ld   h, a
    ld   h, l
    ld   [hl], h
    ld   l, b

label_7137D::
    ld   h, l
    ld   [hl], d

label_7137F::
    ccf
    jr   nz, label_713A2

label_71382::
    ld   c, b
    ld   [hl], l

label_71384::
    ld   l, [hl]
    ld   l, b
    ccf

label_71387::
    ld   d, l
    ld   l, b
    inc  l
    jr   nz, label_713D5
    jr   nz, label_713F2
    ld   l, c
    ld   h, h
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_713B5
    jr   nz, label_713B7
    ld   l, l
    ld   h, l
    ld   h, c
    ld   l, [hl]
    jr   nz, label_713FE
    ld   l, [hl]
    ld   a, c
    ld   [hl], h
    ld   l, b
    ld   l, c

label_713A2::
    ld   l, [hl]

label_713A3::
    ld   h, a
    ld   l, $2E
    ld   l, $49
    ld   e, [hl]
    ld   l, l
    jr   nz, label_71416
    ld   [hl], l

label_713AD::
    ld   [hl], e
    ld   [hl], h

label_713AF::
    jr   nz, label_71412
    jr   nz, label_7141E
    ld   l, c
    ld   h, h

label_713B5::
    ld   hl, label_708FF
    ld   h, l
    ld   a, c
    jr   nz, label_71424
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_71423
    ld   [hl], d
    ld   l, a
    ld   hl, label_2020
    jr   nz, label_71409
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_71442
    ld   l, b
    ld   h, l
    jr   nz, label_71416
    ld   [hl], d
    ld   h, l
    ld   h, c

label_713D5::
    ld   l, l
    jr   nz, label_7142B
    ld   l, b
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   h, l
    jr   nz, label_71453
    ld   l, b

label_713E0::
    ld   h, l

label_713E1::
    ld   [hl], d
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   d, h
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_71460
    ld   h, c
    ld   a, c
    jr   nz, label_71465
    ld   l, b

label_713F2::
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    ld   [hl], e
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c

label_713FE::
    ld   l, [hl]

label_713FF::
    ld   h, a
    jr   nz, label_71469
    ld   l, a
    ld   l, a
    ld   h, h
    jr   nz, label_71427
    ld   l, c
    ld   l, [hl]

label_71409::
    ld   [hl], e
    ld   l, c
    ld   h, h
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    jr   nz, label_71437
    ld   c, c
    jr   nz, label_7147C
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l

label_7141E::
    ld   [hl], d
    jr   nz, label_7148F
    ld   l, a
    ld   [hl], h

label_71423::
    jr   nz, label_71498
    ld   h, c
    ld   a, c

label_71427::
    ld   h, c
    ld   l, [hl]
    ld   a, c
    ld   [hl], h

label_7142B::
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_71496
    ld   l, h
    ld   [hl], e
    ld   h, l
    jr   nz, label_71456
    jr   nz, label_71499
    ld   [hl], e
    jr   nz, label_71484
    ld   e, [hl]
    ld   l, l
    jr   nz, label_714A9
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_71442::
    jr   nz, label_714A5
    jr   nz, label_71466
    jr   nz, label_714B3
    ld   l, c
    ld   h, h
    ld   hl, label_708FF
    ld   [hl], l
    ld   l, [hl]
    ld   l, b
    ccf
    ld   hl, label_2020
    ld   c, l
    ld   h, c

label_71456::
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_714CB
    ld   l, a
    ld   [hl], h
    jr   nz, label_714D8
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_714DF

label_71466::
    ld   l, a
    ld   [hl], l
    ccf

label_71469::
    jr   nz, label_7148B
    jr   nz, label_714C4
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_714DA
    ld   h, c
    ld   [hl], b
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   h, h
    jr   nz, label_714EF
    ld   l, a

label_7147C::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ccf
    rst  $38
    ld   d, a
    ld   c, b
    ld   c, a

label_71484::
    ld   b, c
    ld   hl, label_71420
    ld   l, b
    ld   h, c
    ld   [hl], h

label_7148B::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_714F0

label_7148F::
    jr   nz, label_714B1
    ld   h, d
    ld   l, c
    ld   h, a
    jr   nz, label_71505

label_71496::
    ld   l, [hl]
    ld   h, l

label_71498::
    ld   hl, label_70820
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_714C0
    jr   nz, label_71512
    ld   l, b
    ld   l, a
    ld   [hl], h

label_714A5::
    ld   l, a
    jr   nz, label_7150F
    ld   [hl], l

label_714A9::
    ld   a, c
    ld   hl, label_70320
    ld   h, c
    ld   l, [hl]
    jr   nz, label_714D1

label_714B1::
    ld   a, c
    ld   l, a

label_714B3::
    ld   [hl], l
    jr   nz, label_7152A
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_7151C
    jr   nz, label_714DD
    jr   nz, label_714DF
    jr   nz, label_714E1
    ld   [hl], b
    ld   l, c
    ld   h, e

label_714C4::
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_71539
    ld   h, [hl]

label_714CB::
    jr   nz, label_71541
    ld   l, b
    ld   l, c
    ld   [hl], e
    ccf

label_714D1::
    rst  $38
    ld   c, c
    jr   nz, label_7153D
    ld   h, c
    halt

label_714D8::
    jr   nz, label_7153B

label_714DA::
    jr   nz, label_714FC
    jr   nz, label_714FE
    jr   nz, label_71500
    jr   nz, label_71502
    ld   h, [hl]
    ld   h, l
    ld   h, l
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   e, [hl]
    jr   nz, label_7155F
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71510

label_714F0::
    jr   nz, label_71512
    ld   c, c
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_7155B
    ld   h, c
    ld   [hl], h
    ld   h, e
    ld   l, b

label_714FC::
    jr   nz, label_7155F

label_714FE::
    jr   nz, label_71562

label_71500::
    ld   l, c
    ld   h, a

label_71502::
    ld   h, [hl]
    ld   l, c
    ld   [hl], e

label_71505::
    ld   l, b
    jr   nz, label_71569
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   l, $FF
    ld   c, c

label_7150F::
    ld   h, [hl]

label_71510::
    jr   nz, label_7158B

label_71512::
    ld   l, a
    ld   [hl], l
    jr   nz, label_71581
    ld   h, l
    ld   h, l
    ld   [hl], b
    jr   nz, label_71588
    ld   h, l

label_7151C::
    jr   nz, label_7157F
    ld   [hl], e
    ld   h, l
    ld   h, e
    ld   [hl], d
    ld   h, l
    ld   [hl], h
    inc  l
    jr   nz, label_71570
    ld   e, [hl]
    ld   l, h
    ld   l, h

label_7152A::
    jr   nz, label_7154C
    jr   nz, label_7154E
    ld   [hl], h
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_715AD
    ld   l, a
    ld   [hl], l
    jr   nz, label_715AB
    ld   l, a

label_71539::
    ld   l, l
    ld   h, l

label_7153B::
    dec  l
    jr   nz, label_7155E
    ld   [hl], h
    ld   l, b
    ld   l, c

label_71541::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_715BA
    ld   [hl], e
    ld   h, l
    ld   h, [hl]
    ld   [hl], l
    ld   l, h
    ld   l, $20

label_7154C::
    jr   nz, label_7156E

label_7154E::
    ld   b, a
    ld   l, a
    jr   nz, label_715C6
    ld   l, a
    jr   nz, label_715A9
    ld   l, a
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   h, d
    ld   l, a

label_7155B::
    jr   nz, label_7157D
    jr   nz, label_715B2

label_7155F::
    ld   l, b
    ld   l, a
    ld   [hl], d

label_71562::
    ld   h, l
    ld   [hl], e
    inc  l
    jr   nz, label_715DC
    ld   [hl], e
    ld   h, l

label_71569::
    jr   nz, label_715DF
    ld   l, b
    ld   h, l
    jr   nz, label_715DC
    ld   h, c

label_71570::
    ld   h, a
    ld   l, [hl]
    ld   l, c
    ld   h, [hl]
    ld   a, c
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_715E1
    ld   l, h
    ld   h, c
    ld   [hl], e

label_7157D::
    ld   [hl], e
    ld   h, c

label_7157F::
    ld   l, [hl]
    ld   h, h

label_71581::
    jr   nz, label_715FC
    ld   l, a
    ld   [hl], l
    jr   nz, label_715FE
    ld   l, c

label_71588::
    ld   l, h
    ld   l, h
    jr   nz, label_715AC
    jr   nz, label_715AE
    ld   h, [hl]
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_71607
    ld   l, a
    ld   l, l
    ld   h, l
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_715BC
    jr   nz, label_715BE
    ld   l, h
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_71611
    ld   h, l
    ld   l, $FF
    ld   d, h
    ld   [hl], e

label_715A9::
    ld   l, e
    jr   nz, label_71620

label_715AC::
    ld   [hl], e

label_715AD::
    ld   l, e

label_715AE::
    ld   l, $2E
    ld   l, $20

label_715B2::
    jr   nz, label_7160B
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   h, c
    jr   nz, label_7162D

label_715BA::
    ld   l, b
    ld   h, c

label_715BC::
    ld   l, l
    ld   h, l

label_715BE::
    ld   l, $2E
    ld   l, $FF
    ld   c, a
    ld   l, b
    jr   nz, label_7163A

label_715C6::
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_71645
    ld   l, a
    ld   [hl], l
    ld   hl, label_2020
    jr   nz, label_7162C
    ld   l, a
    ld   [hl], l
    jr   nz, label_71638
    ld   [hl], d
    ld   h, l
    jr   nz, label_71644
    ld   l, [hl]

label_715DC::
    ld   h, h
    ld   h, l
    ld   h, l

label_715DF::
    ld   h, h
    jr   nz, label_71643
    ld   h, a
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_7165C
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ld   l, a
    ld   l, [hl]
    ld   hl, label_72841
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_71671
    ld   l, c
    ld   l, h

label_715FC::
    ld   l, h
    jr   nz, label_71666
    ld   l, c
    halt
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_7167B

label_71607::
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_71675
    ld   l, [hl]
    jr   nz, label_7162F
    jr   nz, label_71631

label_71611::
    jr   nz, label_71685
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   l, [hl]
    ld   hl, label_719FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_71693
    ld   [hl], d

label_71620::
    ld   h, c
    ld   h, h
    ld   h, l
    ld   h, h
    jr   nz, label_7169F
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_7160B
    jr   nz, label_71693

label_7162D::
    ld   l, a
    ld   [hl], d

label_7162F::
    jr   nz, label_71612

label_71631::
    ld   hl, label_2020
    ld   c, l
    ld   h, c
    ld   a, c
    ld   h, d

label_71638::
    ld   h, l
    jr   nz, label_716B4
    ld   l, a
    ld   [hl], l
    jr   nz, label_716A2
    ld   h, c
    ld   l, [hl]
    jr   nz, label_716B7

label_71643::
    ld   [hl], d

label_71644::
    ld   h, c

label_71645::
    ld   h, h
    ld   h, l
    jr   nz, label_71669
    jr   nz, label_716BF
    ld   l, b
    ld   h, l
    jr   nz, label_716C1
    ld   l, c
    ld   h, d
    ld   h, d
    ld   l, a
    ld   l, [hl]
    jr   nz, label_716BC
    ld   l, a
    ld   [hl], d
    jr   nz, label_7167A
    ld   [hl], e
    ld   l, a

label_7165C::
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_716CA
    ld   l, h

label_71666::
    ld   [hl], e
    ld   h, l
    ld   hl, label_702FF
    ld   h, l
    ld   h, e
    ld   h, c
    ld   [hl], l
    ld   [hl], e
    ld   h, l

label_71671::
    jr   nz, label_716E7
    ld   l, b
    ld   h, l

label_71675::
    ld   a, c
    jr   nz, label_716D9
    ld   l, h
    ld   l, h

label_7167A::
    ld   l, h

label_7167B::
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_716E1
    ld   l, h
    ld   l, c
    ld   l, e
    ld   h, l
    inc  l

label_71685::
    jr   nz, label_716EC
    halt
    ld   l, [hl]
    ld   c, c
    jr   nz, label_716EE
    ld   l, l
    jr   nz, label_71703
    ld   l, a
    ld   l, l
    ld   h, l

label_71693::
    ld   [hl], h
    ld   l, c
    ld   l, l
    ld   h, l
    ld   [hl], e
    jr   nz, label_716BA
    ld   h, e
    ld   l, a
    ld   l, [hl]
    ld   h, [hl]
    ld   [hl], l

label_7169F::
    ld   [hl], e
    ld   h, l
    ld   h, h

label_716A2::
    ld   l, $20
    ld   l, $20
    ld   l, $20
    jr   nz, label_716CA
    ld   b, d
    ld   a, c
    jr   nz, label_71722
    ld   l, b
    ld   h, l
    jr   nz, label_71729
    ld   h, c
    ld   a, c

label_716B4::
    inc  l
    jr   nz, label_71724

label_716B7::
    ld   a, c
    jr   nz, label_716DA

label_716BA::
    ld   h, d
    ld   h, c

label_716BC::
    ld   h, d
    ld   a, c
    jr   nz, label_71737
    ld   h, c

label_716C1::
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_71727
    jr   nz, label_716E8
    jr   nz, label_716EA

label_716CA::
    ld   e, c
    ld   l, a
    ld   [hl], e
    ld   l, b
    ld   l, c
    jr   nz, label_71715
    ld   l, a
    ld   l, h
    ld   l, h
    ld   l, $20
    jr   nz, label_716F8
    jr   nz, label_716FA

label_716DA::
    ld   c, c
    jr   nz, label_71750
    ld   h, c
    ld   [hl], a
    jr   nz, label_71750

label_716E1::
    ld   l, [hl]
    ld   h, l
    jr   nz, label_71746
    ld   [hl], h
    jr   nz, label_7175C

label_716E8::
    ld   l, b
    ld   h, l

label_716EA::
    ld   d, h
    ld   [hl], d

label_716EC::
    ld   h, l
    ld   l, [hl]

label_716EE::
    ld   h, h
    ld   a, c
    jr   nz, label_71739
    ld   h, c
    ld   l, l
    ld   h, l
    inc  l
    jr   nz, label_71718

label_716F8::
    jr   nz, label_7171A

label_716FA::
    ld   h, d
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_71748
    jr   nz, label_71764
    ld   l, a
    ld   [hl], l

label_71703::
    ld   l, h
    ld   h, h
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_7172A
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_71778
    ld   [hl], h
    ld   l, $FF
    ld   c, a
    ld   l, b
    ld   hl, label_2020
    ld   d, a

label_71718::
    ld   l, c
    ld   l, h

label_7171A::
    ld   l, h
    jr   nz, label_71796
    ld   l, a
    ld   [hl], l
    jr   nz, label_71741
    jr   nz, label_7178A
    ld   l, c

label_71724::
    halt
    jr   nz, label_7179C
    ld   l, b

label_71729::
    ld   h, c

label_7172A::
    ld   [hl], h
    jr   nz, label_71791
    ld   l, a
    ld   l, h
    ld   l, h
    jr   nz, label_71752
    ld   [hl], h
    ld   l, a
    jr   nz, label_717A3
    ld   a, c

label_71737::
    jr   nz, label_7179B

label_71739::
    ld   h, c
    ld   h, d
    ld   a, c
    ccf
    ld   hl, label_2020
    jr   nz, label_71762
    jr   nz, label_71764
    jr   nz, label_71766

label_71746::
    ld   e, c
    ld   h, l

label_71748::
    ld   [hl], e
    jr   nz, label_7176B
    ld   c, [hl]
    ld   l, a
    cp   $42
    ld   h, l

label_71750::
    ld   h, e
    ld   h, c

label_71752::
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_717CB
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_717BD

label_7175C::
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, e

label_71762::
    jr   nz, label_717C5

label_71764::
    ld   l, h
    ld   l, c

label_71766::
    ld   l, e
    ld   h, l
    inc  l
    jr   nz, label_717D0

label_7176B::
    halt
    ld   l, [hl]
    ld   c, c
    jr   nz, label_717D2
    ld   l, l
    jr   nz, label_717E7
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h

label_71778::
    ld   l, c
    ld   l, l
    ld   h, l
    ld   [hl], e
    jr   nz, label_7179E
    ld   h, e
    ld   l, a
    ld   l, [hl]
    ld   h, [hl]
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   h, h
    ld   l, $2E
    ld   l, $20

label_7178A::
    jr   nz, label_717AC
    jr   nz, label_717AE
    rst  $38
    ld   b, c
    ld   l, b

label_71791::
    ld   h, l
    ld   l, l
    ld   hl, label_2020

label_71796::
    ld   d, d
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h

label_7179B::
    ld   a, c

label_7179C::
    inc  l
    jr   nz, label_717E8
    ld   l, l
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_717A3::
    jr   nz, label_7180E
    ld   l, [hl]
    ld   [hl], e
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_71820

label_717AC::
    ld   l, b
    ld   h, c

label_717AE::
    ld   [hl], h
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_71822
    ld   l, a
    ld   [hl], h
    jr   nz, label_7181A
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_717DE
    jr   nz, label_71834
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71826

label_717C5::
    ld   [hl], a
    ld   h, [hl]
    ld   [hl], l
    ld   l, h
    jr   nz, label_7182D

label_717CB::
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, c

label_717D0::
    ld   l, [hl]
    jr   nz, label_7183B
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2020
    ld   c, h
    ld   h, l
    ld   h, c
    halt

label_717DE::
    jr   nz, label_71854
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71848
    ld   [hl], d
    ld   h, l

label_717E7::
    ld   h, c

label_717E8::
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_7180E
    jr   nz, label_7185F
    ld   [hl], l
    ld   [hl], h
    ld   [hl], e
    ld   l, c
    ld   h, h
    ld   h, l
    jr   nz, label_71859
    ld   l, [hl]
    ld   h, h
    jr   nz, label_71870
    ld   l, b
    ld   h, l
    ld   l, [hl]

label_717FF::
    ld   [hl], a
    ld   h, l
    jr   nz, label_71866
    ld   h, c
    ld   l, [hl]
    jr   nz, label_7187B
    ld   h, c
    ld   l, h
    ld   l, e
    ld   hl, label_2020
    jr   nz, label_7182F
    ld   b, a
    ld   l, a
    ld   l, a
    ld   h, h
    jr   nz, label_71857
    ld   a, c
    ld   h, l
    ld   hl, label_719FF

label_7181A::
    ld   l, a
    ld   [hl], l
    jr   nz, label_71895
    ld   h, c
    ld   l, [hl]

label_71820::
    ld   [hl], h
    jr   nz, label_71897
    ld   l, a
    jr   nz, label_71891

label_71826::
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    ld   h, c
    ld   h, d
    ld   l, a
    ld   [hl], l

label_7182D::
    ld   [hl], h
    jr   nz, label_718A4
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71855
    jr   nz, label_71857
    jr   nz, label_71859
    ld   h, a
    ld   l, b

label_7183B::
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    ccf
    jr   nz, label_7188A
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_718A8
    ld   h, l
    ld   [hl], h

label_71848::
    jr   nz, label_718B2
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_718B7
    ld   h, c
    ld   [hl], b
    ld   [hl], b
    ld   a, c
    jr   nz, label_71875

label_71855::
    jr   nz, label_71877

label_71857::
    jr   nz, label_71879

label_71859::
    ld   [hl], h
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    ld   [hl], e

label_7185F::
    jr   nz, label_718D5
    ld   l, a
    jr   nz, label_718DD
    ld   l, a
    ld   [hl], l

label_71866::
    ld   l, $20
    jr   nz, label_718AB
    ld   [hl], d
    ld   h, l
    jr   nz, label_718E7
    ld   l, a
    ld   [hl], l

label_71870::
    jr   nz, label_718E4
    ld   h, l
    ld   h, c
    ld   h, h

label_71875::
    ld   a, c
    jr   nz, label_71898
    jr   nz, label_718E0
    ld   l, a

label_7187B::
    ld   [hl], d
    jr   nz, label_718DF
    jr   nz, label_718F0
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ccf
    rst  $38
    ld   c, b
    ld   l, a

label_7188A::
    jr   nz, label_718F4
    ld   l, a
    jr   nz, label_718F7
    ld   l, a
    ld   hl, label_2020
    jr   nz, label_718B5

label_71895::
    jr   nz, label_718B7

label_71897::
    jr   nz, label_718E2
    jr   nz, label_7190D
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    jr   nz, label_71903
    ld   [hl], b
    ld   [hl], b

label_718A4::
    ld   [hl], d
    ld   h, l
    dec  l
    jr   nz, label_7190C
    ld   l, c
    ld   h, c

label_718AB::
    ld   [hl], h
    ld   h, l
    jr   nz, label_71926
    ld   l, b
    ld   h, c
    ld   [hl], h

label_718B2::
    jr   nz, label_7192D
    ld   l, a

label_718B5::
    ld   [hl], l
    jr   nz, label_718D8
    ld   h, h
    ld   l, c
    ld   h, h
    jr   nz, label_71923
    ld   l, a
    ld   [hl], d
    jr   nz, label_7192E
    ld   a, c
    jr   nz, label_71934
    ld   l, a
    ld   l, a
    ld   [hl], d
    inc  l
    ld   [hl], b
    ld   [hl], d
    ld   h, l
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_71914
    ld   l, a
    ld   [hl], a
    ld   d, a

label_718D5::
    ld   l, a
    ld   [hl], a
    ld   hl, label_72F59
    ld   [hl], l
    jr   nz, label_7193E

label_718DD::
    ld   [hl], d
    ld   h, l

label_718DF::
    jr   nz, label_71954
    ld   [hl], l

label_718E2::
    ld   h, e
    ld   l, b

label_718E4::
    jr   nz, label_71947
    jr   nz, label_71908
    ld   l, [hl]
    ld   l, c
    ld   h, e
    ld   h, l
    jr   nz, label_71950
    ld   l, a
    ld   a, c

label_718F0::
    ld   hl, label_2020
    ld   c, b

label_718F4::
    ld   l, a
    ld   [hl], a
    jr   nz, label_71918
    ld   h, e
    ld   h, c
    ld   l, [hl]
    jr   nz, label_71946
    jr   nz, label_71964
    halt
    ld   [hl], d
    jr   nz, label_71976
    ld   h, l
    ld   [hl], b
    ld   h, c
    ld   a, c

label_71908::
    ld   a, c
    ld   l, a
    ld   [hl], l
    ccf

label_7190C::
    jr   nz, label_7192E
    ld   c, c
    jr   nz, label_7197C
    ld   l, [hl]
    ld   l, a
    ld   [hl], a

label_71914::
    ld   l, $2E
    ld   l, $20

label_71918::
    jr   nz, label_7193A
    ld   d, e
    ld   c, l
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a

label_71923::
    ld   b, e
    ld   c, b
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_71994

label_7192D::
    ld   l, a

label_7192E::
    ld   [hl], h
    jr   nz, label_71992
    jr   nz, label_719A5
    ld   h, l

label_71934::
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   h, [hl]
    ld   [hl], d

label_7193A::
    ld   l, a
    ld   l, l
    jr   nz, label_7198B

label_7193E::
    ld   h, c
    ld   h, h
    ld   h, c
    ld   l, l
    jr   nz, label_71991
    ld   h, l
    ld   l, a

label_71946::
    ld   [hl], a

label_71947::
    dec  l
    ld   c, l
    ld   h, l
    ld   l, a
    ld   [hl], a
    ld   l, $2E
    ld   l, $20

label_71950::
    ld   l, $2E
    ld   l, $20

label_71954::
    ld   l, $2E
    ld   l, $20
    ld   c, h
    dec  l
    ld   l, h
    dec  l
    ld   l, h
    ld   [hl], l
    ld   h, e
    ld   l, e
    ld   a, c
    ld   hl, label_708FF

label_71964::
    ld   l, a
    jr   nz, label_719CF
    ld   l, a
    jr   nz, label_719D2
    ld   l, a
    ld   hl, label_2020
    ld   c, l
    ld   a, c
    jr   nz, label_71992
    jr   nz, label_719B6
    ld   l, a
    ld   [hl], a

label_71976::
    ld   d, a
    ld   l, a
    ld   [hl], a
    jr   nz, label_719E4
    ld   [hl], e

label_7197C::
    jr   nz, label_719F1
    ld   l, a
    jr   nz, label_719A1
    jr   nz, label_719A3
    ld   [hl], b
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   h, h
    jr   nz, label_719F9
    ld   h, [hl]

label_7198B::
    jr   nz, label_719F5
    ld   l, c
    ld   [hl], e
    jr   nz, label_719B1

label_71991::
    jr   nz, label_719B3
    ld   h, [hl]

label_71994::
    ld   l, c
    ld   l, [hl]
    ld   h, l
    jr   nz, label_719FF
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_71A00
    ld   l, a
    ld   h, c
    ld   [hl], h
    ld   hl, label_701FF

label_719A3::
    ld   c, c
    ld   b, l

label_719A5::
    ld   b, l
    ld   b, l
    ld   b, l
    ld   b, l
    ld   b, l
    ld   b, l
    ld   b, l
    ld   hl, label_2020
    jr   nz, label_719D1

label_719B1::
    jr   nz, label_719FC

label_719B3::
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_719B6::
    jr   nz, label_71A2C
    ld   h, l
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   l, c
    ld   h, d
    ld   l, h
    ld   h, l
    ld   hl, label_7394D
    jr   nz, label_71A08
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    jr   nz, label_71A44
    ld   h, c
    ld   [hl], e

label_719CF::
    jr   nz, label_719F1

label_719D1::
    jr   nz, label_71A37
    ld   l, a
    ld   h, a
    ld   l, [hl]
    ld   h, c
    ld   [hl], b
    ld   [hl], b
    ld   h, l
    ld   h, h
    jr   nz, label_71A3F
    ld   a, c
    ld   l, $2E
    ld   l, $20
    ld   c, l
    ld   l, a

label_719E4::
    dec  l
    ld   l, l
    ld   l, a
    dec  l
    ld   c, l
    ld   c, a
    ld   b, d
    ld   c, h
    ld   c, c
    ld   c, [hl]
    ld   d, e
    ld   hl, label_2021
    ld   c, a
    ld   c, b
    ld   c, b

label_719F5::
    ld   c, b
    ld   hl, label_2020

label_719F9::
    ld   b, c
    ld   c, b
    ld   c, b

label_719FC::
    ld   c, b
    ld   c, b

label_719FE::
    ld   hl, label_2020
    jr   nz, label_71A53
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l

label_71A08::
    ld   hl, label_71320
    ld   l, a
    ld   l, l
    ld   h, l
    ld   h, d
    ld   l, a
    ld   h, h
    ld   a, c
    ld   l, b
    ld   h, l
    ld   l, h
    ld   [hl], b
    jr   nz, label_71A85
    ld   a, c
    jr   nz, label_71A8B
    ld   l, a
    ld   l, a
    ld   [hl], d
    jr   nz, label_71A40
    jr   nz, label_71A42
    ld   b, d
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    ld   hl, rNR42
    ld   c, a

label_71A2C::
    ld   l, b
    jr   nz, label_71AA3
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_71AAE
    ld   l, a
    ld   [hl], l

label_71A37::
    ld   hl, label_2020
    jr   nz, label_71A85
    ld   e, [hl]
    ld   l, l
    jr   nz, label_71AB3

label_71A40::
    ld   l, a
    jr   nz, label_71AAB
    ld   h, c

label_71A44::
    ld   [hl], b
    ld   [hl], b
    ld   a, c
    jr   nz, label_71AC2
    ld   l, a
    ld   [hl], l
    ld   h, d
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_71AC1
    ld   a, c
    jr   nz, label_71AB9
    ld   h, c
    ld   h, d
    ld   a, c
    jr   nz, label_71ABE
    ld   h, c
    ld   h, e
    ld   l, e
    ld   hl, label_70E20
    ld   l, a
    ld   [hl], a
    inc  l
    jr   nz, label_71ADE
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_71AD2
    ld   h, l
    jr   nz, label_71AD4
    jr   nz, label_71AD9
    ld   h, l
    ld   h, c
    ld   [hl], d
    jr   nz, label_71A9A
    jr   nz, label_71ADD
    ld   l, [hl]
    ld   h, h
    jr   nz, label_71AF4
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_71AED

label_71A85::
    ld   l, c
    ld   l, l
    jr   nz, label_71AEF
    ld   l, a
    ld   [hl], d

label_71A8B::
    ld   h, c
    jr   nz, label_71B05
    ld   h, c
    ld   l, h
    ld   l, e
    ccf
    jr   nz, label_71ADD
    ld   [hl], h
    jr   nz, label_71B0E
    ld   l, a
    ld   [hl], l
    ld   l, h

label_71A9A::
    ld   h, h
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    jr   nz, label_71B0B

label_71AA3::
    ld   h, l
    ld   l, h
    ld   [hl], b
    jr   nz, label_71B15
    ld   h, l
    jr   nz, label_71ACB

label_71AAB::
    ld   l, a
    ld   [hl], l
    ld   [hl], h

label_71AAE::
    jr   nz, label_71B11
    jr   nz, label_71B1E
    ld   l, a

label_71AB3::
    ld   [hl], h
    ld   hl, label_2020
    ld   e, c
    ld   l, a

label_71AB9::
    ld   [hl], l
    jr   nz, label_71B33
    ld   l, c
    ld   l, h

label_71ABE::
    ld   l, h
    ccf
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    ld   [hl], e
    ld   hl, label_717FF
    ld   h, l
    ld   l, h
    ld   l, h
    ld   l, $2E
    ld   l, $20
    ld   c, c

label_71AD4::
    jr   nz, label_71B46
    ld   [hl], d
    ld   h, l
    ld   [hl], h

label_71AD9::
    ld   [hl], h
    ld   a, c
    ld   l, l
    ld   [hl], l

label_71ADD::
    ld   h, e

label_71ADE::
    ld   l, b
    jr   nz, label_71B54
    ld   [hl], h
    ld   l, c
    ld   h, e
    ld   l, e
    jr   nz, label_71B5B
    ld   l, a
    jr   nz, label_71B0A
    jr   nz, label_71B59
    ld   a, c

label_71AED::
    ld   [hl], e
    ld   h, l

label_71AEF::
    ld   l, h
    ld   h, [hl]
    inc  l
    jr   nz, label_71B61

label_71AF4::
    ld   h, l
    jr   nz, label_71B58
    ld   l, [hl]
    ld   h, h
    jr   nz, label_71B1B
    ld   l, l
    ld   a, c
    jr   nz, label_71B6B
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   [hl], e

label_71B05::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_71B2B

label_71B0B::
    ld   c, l
    ld   a, c
    jr   nz, label_71B7D
    ld   h, c
    ld   l, l

label_71B11::
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_71B6D
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   h, l
    ld   hl, label_72854
    ld   h, l

label_71B1E::
    jr   nz, label_71B8F
    ld   l, [hl]
    ld   l, h
    ld   a, c
    jr   nz, label_71B99
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_71B74

label_71B2B::
    ld   h, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_71B9E
    ld   l, c

label_71B33::
    ld   l, e
    ld   h, l
    jr   nz, label_71B98
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, l
    ld   a, c
    jr   nz, label_71BA7
    ld   l, a
    ld   h, d
    ld   h, d
    ld   a, c
    jr   nz, label_71BAE
    ld   [hl], e

label_71B46::
    jr   nz, label_71BBC
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   c, c
    jr   nz, label_71BBC
    ld   h, l
    halt
    ld   [hl], d
    jr   nz, label_71BC6

label_71B54::
    ld   h, l
    ld   h, e
    ld   h, l
    ld   l, c

label_71B58::
    halt
    jr   nz, label_71BBD
    jr   nz, label_71BD0
    ld   h, l
    ld   [hl], e
    ld   [hl], b

label_71B61::
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   d, a
    ld   l, b

label_71B6B::
    ld   h, c
    ld   [hl], h

label_71B6D::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_71BE5
    ld   l, b
    ld   l, c
    ld   [hl], e

label_71B74::
    ccf
    ld   hl, label_2020
    ld   b, c
    ld   l, h
    ld   h, l
    ld   [hl], h
    ld   [hl], h

label_71B7D::
    ld   h, l
    ld   [hl], d
    jr   nz, label_71BE7
    ld   l, a
    ld   [hl], d
    jr   nz, label_71BF2
    ld   h, l
    ccf
    ld   hl, label_70920
    ld   e, [hl]
    ld   l, l
    jr   nz, label_71C01
    ld   l, a

label_71B8F::
    jr   nz, label_71BF9
    ld   h, c
    ld   [hl], b
    ld   [hl], b
    ld   a, c
    ld   hl, label_2020

label_71B98::
    jr   nz, label_71BC8
    ld   l, $2E
    ld   b, c
    ld   l, [hl]

label_71B9E::
    ld   h, h
    jr   nz, label_71C0D
    ld   l, a
    ld   l, a
    ld   l, e
    ld   hl, label_71420

label_71BA7::
    ld   l, b
    ld   h, l
    ld   l, h
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l

label_71BAE::
    ld   [hl], d
    jr   nz, label_71C14
    ld   h, c
    ld   l, l
    ld   h, l
    jr   nz, label_71C2D
    ld   l, c
    ld   [hl], h
    ld   l, b
    ld   h, c
    jr   nz, label_71C2C

label_71BBC::
    ld   l, b

label_71BBD::
    ld   l, a
    ld   [hl], h
    ld   l, a
    ld   h, a
    ld   [hl], d
    ld   h, c
    ld   [hl], b
    ld   l, b
    ld   hl, label_70DFF

label_71BC8::
    ld   l, l
    ld   l, l
    ld   l, $2E
    ld   l, $20
    ld   d, e
    ld   l, b

label_71BD0::
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_71C48
    ld   l, a
    jr   nz, label_71C3A
    ld   h, l
    ld   h, c
    ld   [hl], l
    ld   [hl], h
    ld   l, c
    ld   h, [hl]
    ld   [hl], l
    ld   l, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_71C06
    jr   nz, label_71C31
    jr   nz, label_71C57
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_71C56
    ld   l, c
    halt

label_71BF2::
    jr   nz, label_71C6D
    ld   l, a
    ld   [hl], l
    jr   nz, label_71C6B
    ld   l, a

label_71BF9::
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_71C68
    ld   l, a
    ld   [hl], d
    jr   nz, label_71C26

label_71C06::
    jr   nz, label_71C81
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_71C81

label_71C0D::
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   h, d
    ld   l, h
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   c, b
    ld   l, l
    ld   l, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_71C77
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_71C8F

label_71C26::
    ld   [hl], h
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, e
    ld   [hl], e

label_71C2C::
    jr   nz, label_71C9A
    ld   l, c
    ld   l, e
    ld   h, l

label_71C31::
    jr   nz, label_71C94
    ld   l, h
    ld   l, h
    jr   nz, label_71C80
    ld   l, b
    ld   h, c
    halt
    jr   nz, label_71CA6
    ld   [hl], e
    jr   nz, label_71CB4
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_71C65
    jr   nz, label_71C67
    ld   h, d

label_71C48::
    ld   [hl], d
    ld   l, a
    ld   l, a
    ld   l, l
    ld   l, $2E
    ld   l, $20
    ld   l, b
    ld   l, a
    ld   [hl], a
    ld   e, [hl]
    ld   l, h
    ld   l, h

label_71C56::
    jr   nz, label_71CCC
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71CBF
    ld   h, l
    ccf
    jr   nz, label_71C81
    jr   nz, label_71C83
    jr   nz, label_71C85

label_71C65::
    jr   nz, label_71C87

label_71C67::
    jr   nz, label_71C89
    jr   nz, label_71C8B

label_71C6B::
    ld   b, [hl]
    ld   l, c

label_71C6D::
    ld   l, [hl]
    ld   h, l
    jr   nz, label_71CBF
    ld   l, a
    ld   l, $2E
    ld   l, $FE
    ld   e, c

label_71C77::
    ld   l, a
    ld   [hl], l
    jr   nz, label_71CE2
    ld   l, a
    ld   [hl], h
    jr   nz, label_71CE0
    jr   nz, label_71CC3

label_71C81::
    ld   [hl], d
    ld   l, a

label_71C83::
    ld   l, a
    ld   l, l

label_71C85::
    jr   nz, label_71CE8

label_71C87::
    ld   [hl], e
    jr   nz, label_71D03
    ld   l, a

label_71C8B::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_71D01

label_71C8F::
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, h

label_71C94::
    jr   nz, label_71CB6
    ld   h, [hl]
    ld   [hl], d
    ld   l, a
    ld   l, l

label_71C9A::
    jr   nz, label_71CE9
    ld   [hl], d
    ld   l, $20
    ld   d, a
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   h, l
    ld   hl, label_70220
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_71D1F
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_71D20
    ld   l, b
    ld   l, a
    ld   [hl], h
    ld   l, a

label_71CB4::
    jr   nz, label_71CD6

label_71CB6::
    ld   [hl], a
    ld   h, c
    ld   [hl], e
    jr   nz, label_71D29
    ld   l, a
    ld   [hl], h
    jr   nz, label_71D2E

label_71CBF::
    ld   h, [hl]
    ld   l, $2E
    ld   l, $FF
    ld   d, b
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    ld   hl, label_70920
    jr   nz, label_71D41
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    ld   l, l
    ld   [hl], l

label_71CD6::
    ld   [hl], e

label_71CD7::
    ld   [hl], h
    jr   nz, label_71D43
    ld   l, [hl]
    ld   [hl], e
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_71D5A
    ld   l, a

label_71CE2::
    ld   [hl], l
    jr   nz, label_71D4D
    ld   h, c
    halt

label_71CE8::
    jr   nz, label_71D5E
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_71CD7
    ld   hl, label_2020
    jr   nz, label_71D14
    jr   nz, label_71D16
    jr   nz, label_71D18
    ld   c, a
    ld   l, e
    ld   h, c
    ld   a, c
    jr   nz, label_71D4C
    ld   l, a
    jr   nz, label_71D58

label_71D01::
    ld   h, c
    ld   a, c

label_71D03::
    cp   $4F
    ld   l, b
    jr   nz, label_71D6A
    ld   l, a
    ld   a, c
    ld   hl, label_2020
    ld   c, h
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_71D8C
    ld   [hl], d

label_71D16::
    ld   l, c
    ld   [hl], h

label_71D18::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_71D86
    ld   [hl], e
    jr   nz, label_71D93

label_71D20::
    ld   [hl], l
    ld   h, e
    ld   l, b
    jr   nz, label_71D86
    jr   nz, label_71D8E
    ld   [hl], d
    ld   h, l

label_71D29::
    ld   h, c
    ld   [hl], h
    jr   nz, label_71D95
    ld   l, a

label_71D2E::
    ld   h, d
    ld   h, d
    ld   a, c
    ld   hl, label_708FF
    ld   h, l
    ld   l, h
    ld   l, h
    ld   l, a
    ld   hl, label_2020
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_71D60
    jr   nz, label_71D62
    jr   nz, label_71DBB
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_71DAE

label_71D4C::
    ld   h, c

label_71D4D::
    ld   h, e
    ld   l, e
    jr   nz, label_71DC5
    ld   l, a
    jr   nz, label_71D97
    ld   l, b
    ld   [hl], d
    ld   l, c
    ld   [hl], e

label_71D58::
    ld   [hl], h
    ld   l, c

label_71D5A::
    ld   l, [hl]
    ld   h, l
    jr   nz, label_71DCC

label_71D5E::
    ld   l, a
    ld   [hl], a

label_71D60::
    ld   hl, label_713FF
    ld   h, c
    ld   l, h
    ld   [hl], l
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   l, c

label_71D6A::
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_71D92
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_71DEE
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_71DA0
    jr   nz, label_71DA2
    ld   l, e
    ld   l, [hl]
    ld   l, a
    ld   [hl], a

label_71D86::
    jr   nz, label_71DEA
    ld   a, c
    jr   nz, label_71DFF
    ld   l, b

label_71D8C::
    ld   h, l
    jr   nz, label_71DFB
    ld   l, a
    ld   l, a
    ld   l, e

label_71D92::
    ld   l, a

label_71D93::
    ld   h, [hl]
    jr   nz, label_71E03
    ld   h, l

label_71D97::
    inc  l
    jr   nz, label_71DFC
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_71DE7
    jr   nz, label_71DC0

label_71DA0::
    jr   nz, label_71DC2

label_71DA2::
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   h, h
    jr   nz, label_71E1C
    ld   l, a
    jr   nz, label_71E17
    ld   l, c
    halt

label_71DAE::
    jr   nz, label_71E19
    ld   l, [hl]
    jr   nz, label_71E27
    ld   l, b
    ld   h, l
    jr   nz, label_71E1A
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, h

label_71DBB::
    ld   h, l
    ld   hl, label_70D20
    ld   a, c

label_71DC0::
    jr   nz, label_71DE2

label_71DC2::
    ld   [hl], e
    ld   h, l
    ld   [hl], d

label_71DC5::
    halt
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_71E43

label_71DCC::
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_71DF1
    jr   nz, label_71E35
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ld   h, l
    ld   [hl], d
    ld   l, e
    jr   nz, label_71E3C
    ld   l, [hl]
    ld   h, h
    jr   nz, label_71E28
    jr   nz, label_71E01
    jr   nz, label_71E5A
    ld   h, c
    ld   [hl], e
    jr   nz, label_71E4D

label_71DE7::
    ld   l, a
    ld   [hl], d
    ld   h, e

label_71DEA::
    ld   h, l
    ld   h, h
    jr   nz, label_71E62

label_71DEE::
    ld   l, a
    jr   nz, label_71E11

label_71DF1::
    jr   nz, label_71E59
    ld   l, h
    ld   h, l
    ld   h, l
    jr   nz, label_71E6C
    ld   l, a
    jr   nz, label_71E68

label_71DFB::
    ld   a, c

label_71DFC::
    jr   nz, label_71E1E
    jr   nz, label_71E20
    jr   nz, label_71E22
    halt
    ld   l, h
    ld   l, h
    ld   h, c
    ld   l, $2E
    ld   l, $20
    ld   d, e
    ld   l, a
    inc  l
    jr   nz, label_71E89
    ld   l, a

label_71E11::
    ld   [hl], l
    ld   [hl], a
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_71E8C
    ld   l, b

label_71E19::
    ld   h, l

label_71E1A::
    jr   nz, label_71E87

label_71E1C::
    ld   h, l
    ld   a, c

label_71E1E::
    jr   nz, label_71E94

label_71E20::
    ld   l, a
    jr   nz, label_71E78
    ld   l, e
    ld   [hl], l
    ld   l, e
    ld   [hl], l

label_71E27::
    jr   nz, label_71E79
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   [hl], d
    ld   l, c
    ld   h, l
    inc  l
    jr   nz, label_71E52
    ld   h, h
    ld   l, a
    jr   nz, label_71EAF
    ld   l, a
    ld   [hl], l
    ccf
    jr   nz, label_71E5B
    ld   c, c

label_71E3C::
    jr   nz, label_71EAB
    ld   h, c
    ld   a, c
    jr   nz, label_71E62
    ld   h, d

label_71E43::
    ld   h, l
    jr   nz, label_71EA7
    ld   h, d
    ld   l, h
    ld   h, l

label_71E49::
    jr   nz, label_71EBF
    ld   l, a
    jr   nz, label_71EB6
    ld   h, l
    ld   l, h
    ld   [hl], b
    jr   nz, label_71ECC
    ld   l, a
    ld   [hl], l
    ld   l, $2E
    ld   l, $20

label_71E59::
    jr   nz, label_71EA7

label_71E5B::
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_71E81
    jr   nz, label_71ED0
    ld   h, c
    ld   l, e
    ld   h, l
    ld   l, $2E

label_71E68::
    ld   l, $20
    ld   h, c
    jr   nz, label_71ED1
    ld   h, l
    ld   h, c
    ld   l, h
    inc  l
    jr   nz, label_71EE6
    ld   l, b
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_71EF0

label_71E79::
    ld   h, l
    ccf
    jr   nz, label_71EC6
    jr   nz, label_71EF6
    ld   h, c
    ld   l, [hl]

label_71E81::
    ld   [hl], h
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_71EFB

label_71E87::
    ld   l, a
    jr   nz, label_71EFC
    ld   h, l
    ld   [hl], h

label_71E8C::
    ld   [hl], d
    ld   l, c
    ld   h, l
    halt
    jr   nz, label_71F07
    ld   l, b

label_71E94::
    ld   h, l
    jr   nz, label_71EDE
    ld   l, a
    ld   l, h
    ld   h, h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_71EEA
    ld   h, l
    ld   h, c
    ld   h, [hl]
    jr   nz, label_71EEC
    jr   nz, label_71F11
    ld   h, l
    ld   h, [hl]

label_71EA7::
    ld   [hl], h
    jr   nz, label_71F0C
    ld   h, l

label_71EAB::
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, h

label_71EAF::
    jr   nz, label_71F1A
    ld   l, [hl]
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_71F1A
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_71F35
    ld   l, b

label_71EBF::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_71F0C
    jr   nz, label_71F2B
    ld   l, h

label_71EC6::
    ld   h, l
    ld   h, h
    ld   l, $2E
    ld   l, $20

label_71ECC::
    jr   nz, label_71EEE
    jr   nz, label_71EF0

label_71ED0::
    jr   nz, label_71EF2
    jr   nz, label_71EF4
    jr   nz, label_71EF6
    ld   c, a
    ld   l, e
    ld   h, c
    ld   a, c
    jr   nz, label_71F2A
    ld   l, a
    jr   nz, label_71F36
    ld   h, c
    ld   a, c
    cp   $49
    jr   nz, label_71F46
    ld   l, l

label_71EE6::
    jr   nz, label_71F51
    ld   l, l
    ld   [hl], b

label_71EEA::
    ld   [hl], d
    ld   h, l

label_71EEC::
    ld   [hl], e
    ld   [hl], e

label_71EEE::
    ld   h, l
    ld   h, h

label_71EF0::
    ld   l, $20

label_71EF2::
    ld   d, h
    ld   l, b

label_71EF4::
    ld   h, l
    ld   [hl], d

label_71EF6::
    ld   h, l
    jr   nz, label_71F5A
    ld   [hl], d
    ld   h, l

label_71EFB::
    jr   nz, label_71F63
    ld   l, c
    halt
    jr   nz, label_71F22
    ld   l, h
    ld   h, l
    ld   h, c
    halt

label_71F07::
    ld   [hl], e
    jr   nz, label_71F73
    ld   l, [hl]
    jr   nz, label_71F6E
    ld   l, h
    ld   l, h
    ld   l, $20

label_71F11::
    jr   nz, label_71F65
    ld   h, l
    ld   l, l
    ld   h, l
    ld   l, l
    ld   h, d
    ld   h, l
    ld   [hl], d

label_71F1A::
    jr   nz, label_71F90
    ld   l, a
    jr   nz, label_71F81
    ld   [hl], l
    ld   a, c
    jr   nz, label_71F84
    jr   nz, label_71F98
    ld   l, b
    ld   l, a
    halt
    ld   l, h

label_71F2A::
    jr   nz, label_71F9B
    ld   l, [hl]
    jr   nz, label_71FA8
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   [hl], a
    ld   h, c
    ld   a, c

label_71F35::
    jr   nz, label_71F99
    ld   h, c
    ld   h, e
    ld   l, e
    ld   l, $FF
    ld   d, a
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_71F8C
    jr   nz, label_71FB3
    ld   h, l

label_71F46::
    halt
    ld   [hl], d
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_71FC3
    ld   l, b
    ld   l, a

label_71F51::
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_71FD0
    ld   l, a
    ld   [hl], l
    jr   nz, label_71F7B
    jr   nz, label_71FC9
    ld   l, a
    ld   l, a
    ld   l, e
    ld   h, l
    ld   h, h
    jr   nz, label_71FC7
    ld   l, a

label_71F65::
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   l, h
    ld   a, c
    inc  l
    ld   h, d
    ld   [hl], l

label_71F6E::
    ld   [hl], h
    ld   l, $2E
    ld   l, $20

label_71F73::
    jr   nz, label_71FC5
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    inc  l

label_71F7B::
    jr   nz, label_71FE9
    ld   h, l
    ld   h, c
    halt

label_71F81::
    jr   nz, label_71FF0
    ld   h, l

label_71F84::
    ld   l, $2E
    ld   l, $20
    ld   l, d
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_71F8C::
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_72000
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_71FFD
    ld   h, l
    ld   [hl], d
    ld   h, l

label_71F98::
    ld   hl, label_701FF

label_71F9B::
    ld   l, b
    ld   l, b
    ld   hl, label_2020
    ld   d, h
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    jr   nz, label_71FE8
    ld   l, c
    ld   h, l

label_71FA8::
    ld   l, [hl]
    ld   hl, label_2049
    ld   [hl], e
    ld   h, l
    ld   h, l
    jr   nz, label_7202A
    ld   l, a
    ld   [hl], l

label_71FB3::
    jr   nz, label_7201D
    ld   h, c
    halt
    jr   nz, label_71FDA
    ld   [hl], d
    ld   h, l
    ld   h, e
    ld   l, a
    halt
    ld   [hl], d
    ld   h, l
    ld   h, h

label_71FC3::
    jr   nz, label_72026

label_71FC5::
    ld   l, h
    ld   l, h

label_71FC7::
    jr   nz, label_72038

label_71FC9::
    ld   h, [hl]
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_7203B
    ld   h, l

label_71FD0::
    ld   h, c
    halt
    ld   [hl], e
    ld   hl, label_70E20
    ld   l, a
    ld   [hl], a
    inc  l

label_71FDA::
    ld   l, l
    ld   l, a
    halt
    jr   nz, label_72054
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_72047
    ld   l, a
    ld   a, b
    jr   nz, label_72009

label_71FE9::
    jr   nz, label_7204C
    ld   l, [hl]
    ld   h, h
    jr   nz, label_72068
    ld   l, a

label_71FF0::
    ld   [hl], l
    jr   nz, label_7206A
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_72018
    jr   nz, label_7201A
    ld   h, [hl]
    ld   l, c
    ld   l, [hl]

label_71FFD::
    ld   h, h
    jr   nz, label_72079

label_72000::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_72025
    jr   nz, label_72027
    jr   nz, label_72029

label_72009::
    jr   nz, label_7207D
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   hl, label_709FF
    jr   nz, label_72076
    ld   l, l
    jr   nz, label_7207E

label_72018::
    ld   l, a
    ld   [hl], d

label_7201A::
    ld   h, l
    halt

label_7201D::
    ld   [hl], d
    jr   nz, label_72089
    ld   l, [hl]
    jr   nz, label_7209C
    ld   l, a
    ld   [hl], l

label_72025::
    ld   [hl], d

label_72026::
    jr   nz, label_7208C
    ld   h, l

label_72029::
    ld   h, d

label_7202A::
    ld   [hl], h
    jr   nz, label_72093
    ld   l, a
    ld   [hl], d
    jr   nz, label_72051
    jr   nz, label_7209A
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   l, c
    ld   l, [hl]

label_72038::
    ld   h, a
    jr   nz, label_720A8

label_7203B::
    ld   a, c
    jr   nz, label_7205E
    jr   nz, label_72060
    jr   nz, label_72062
    ld   l, h
    ld   h, l
    ld   h, c
    halt

label_72047::
    ld   [hl], e
    jr   nz, label_720AC
    ld   h, c
    ld   h, e

label_7204C::
    ld   l, e
    ld   hl, label_701FF
    ld   l, b

label_72051::
    ld   hl, label_2020

label_72054::
    ld   b, d
    ld   l, a
    ld   l, [hl]
    ld   l, d
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   hl, label_2020

label_7205E::
    jr   nz, label_72083

label_72060::
    inc  hl
    inc  hl

label_72062::
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_720CD
    ld   l, a

label_72068::
    ld   [hl], d
    jr   nz, label_720DF
    ld   l, b
    ld   h, l
    jr   nz, label_7208F
    ld   l, h
    ld   l, a
    halt
    jr   nz, label_720E4
    ld   h, [hl]

label_72076::
    jr   nz, label_720E2
    ld   [hl], l

label_72079::
    ld   [hl], e
    ld   [hl], h
    ld   l, c
    ld   h, e

label_7207D::
    ld   h, l

label_7207E::
    inc  l
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_720F1
    ld   a, c
    jr   nz, label_720F6
    ld   [hl], a
    ld   l, [hl]

label_72089::
    jr   nz, label_720FE
    ld   h, c

label_7208C::
    ld   l, e
    ld   h, l
    inc  l

label_7208F::
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_72101
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_720FF
    ld   l, c

label_7209A::
    ld   l, [hl]
    ld   h, h

label_7209C::
    jr   nz, label_720BE
    jr   nz, label_72101
    ld   l, h
    ld   l, h
    jr   nz, label_72118
    ld   l, b
    ld   h, l
    jr   nz, label_72114

label_720A8::
    ld   h, l
    ld   h, c
    halt

label_720AC::
    ld   [hl], e
    ld   hl, label_705FF
    ld   [hl], d
    ld   l, $2E
    ld   l, $55
    ld   l, b
    ld   l, $2E
    ld   l, $48
    ld   l, l
    ld   l, l
    ld   l, $2E

label_720BE::
    ld   l, $48
    ld   l, a
    ld   [hl], a
    jr   nz, label_72138
    ld   l, a
    jr   nz, label_7213A
    ld   h, c
    ld   a, c
    ld   l, $2E
    ld   l, $20

label_720CD::
    jr   nz, label_720EF
    ld   d, b
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    jr   nz, label_7213A
    ld   h, c
    ld   l, h
    ld   l, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_7212F
    ld   [hl], l
    ld   [hl], h

label_720E2::
    ld   [hl], e
    ld   l, c

label_720E4::
    ld   h, h
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_7211A
    ld   l, $2E
    jr   nz, label_72139
    ld   [hl], h

label_720F1::
    jr   nz, label_72166
    ld   h, l
    ld   h, l
    ld   l, l

label_720F6::
    ld   [hl], e
    jr   nz, label_7216D
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_7211E

label_720FE::
    jr   nz, label_7216F
    ld   l, h

label_72101::
    ld   h, h
    jr   nz, label_72171
    ld   h, c
    ld   l, [hl]
    jr   nz, label_7215D
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    jr   nz, label_7212F
    ld   l, c
    ld   [hl], e
    jr   nz, label_72174
    jr   nz, label_72188
    ld   l, b
    ld   a, c
    jr   nz, label_72180
    ld   [hl], l

label_7211A::
    ld   a, c
    inc  l
    jr   nz, label_7213E

label_7211E::
    jr   nz, label_72189
    ld   l, [hl]
    jr   nz, label_72193
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ld   l, a
    ld   l, [hl]
    ld   l, $2E
    ld   l, $FF
    ld   e, [hl]
    ld   b, d
    ld   d, d

label_7212F::
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d

label_72138::
    ld   c, c

label_72139::
    ld   c, [hl]

label_7213A::
    ld   b, a
    ld   hl, label_72548

label_7213E::
    ld   l, h
    ld   l, h
    ld   l, a
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_72148::
    jr   nz, label_721B7
    ld   h, l
    inc  l
    ld   d, l
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_2020
    ld   b, c
    ld   [hl], e
    ld   l, e
    jr   nz, label_721C7
    ld   h, l
    jr   nz, label_721BE

label_7215D::
    ld   l, [hl]
    ld   a, c
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_721C7

label_72166::
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_7218C
    ld   [hl], h

label_7216D::
    ld   l, b
    ld   h, l

label_7216F::
    jr   nz, label_721DA

label_72171::
    ld   [hl], e
    ld   l, h
    ld   h, c

label_72174::
    ld   l, [hl]
    ld   h, h
    ld   hl, label_2020
    ld   c, c
    ld   h, [hl]
    jr   nz, label_721F6
    ld   l, a
    ld   [hl], l
    jr   nz, label_721E8
    ld   h, l
    ld   [hl], h
    jr   nz, label_721F1
    ld   l, a
    ld   [hl], e
    ld   [hl], h

label_72188::
    inc  l

label_72189::
    jr   nz, label_721AB
    jr   nz, label_721F4
    ld   l, c
    halt
    jr   nz, label_721FF
    ld   h, l

label_72193::
    jr   nz, label_721F6
    jr   nz, label_721FA
    ld   h, c
    ld   l, h
    ld   l, h
    ld   hl, label_70220
    ld   a, c
    ld   h, l
    ld   hl, label_70320
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_721AB::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]

label_721B7::
    ld   b, a
    ld   hl, label_72548
    ld   l, h
    ld   l, h
    ld   l, a

label_721BE::
    inc  l
    jr   nz, label_72235
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_7222F
    ld   [hl], e

label_721C7::
    jr   nz, label_721E9
    ld   d, l
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_2E20
    ld   l, $2E
    ld   d, a
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    ld   l, l

label_721DA::
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_7222C
    ld   l, a
    ld   h, d
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_72207
    jr   nz, label_72209

label_721E9::
    ld   l, h
    ld   l, c
    halt
    jr   nz, label_72258
    ld   l, [hl]
    jr   nz, label_72266
    ld   l, b
    ld   h, l

label_721F4::
    jr   nz, label_72243

label_721F6::
    ld   a, c
    ld   [hl], e
    dec  l
    ld   [hl], h

label_721FA::
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   l, a
    ld   [hl], l

label_721FF::
    ld   [hl], e
    jr   nz, label_72248
    ld   l, a
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h

label_72207::
    inc  l
    jr   nz, label_7226C
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_72281
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_7227F
    ld   l, c
    halt
    jr   nz, label_72281
    ld   l, [hl]
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_72281
    ld   h, c
    halt
    ld   [hl], e
    jr   nz, label_72293
    ld   h, [hl]
    jr   nz, label_7227B
    ld   h, c
    ld   l, h
    ld   d, h
    ld   h, c
    ld   l, h

label_7222C::
    jr   nz, label_72276
    ld   h, l

label_7222F::
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   [hl], e
    ld   l, $2E
    ld   l, $20
    jr   nz, label_72283
    jr   nz, label_722A4
    ld   l, a
    ld   [hl], b
    ld   h, l
    jr   nz, label_722B5
    ld   l, b
    ld   h, c

label_72243::
    ld   [hl], h
    jr   nz, label_722AF
    ld   [hl], e
    jr   nz, label_72269
    ld   [hl], a
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_722C8
    ld   l, a
    ld   [hl], l
    jr   nz, label_722CA
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   h, h

label_72258::
    jr   nz, label_722CE
    ld   l, a
    jr   nz, label_722C8
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    ld   hl, label_70320
    ld   c, h
    ld   c, c
    ld   b, e

label_72266::
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_7226C::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d

label_72276::
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72559
    ld   [hl], e
    inc  l
    jr   nz, label_722F4
    ld   l, b

label_72281::
    ld   l, c
    ld   [hl], e

label_72283::
    jr   nz, label_722EE
    ld   [hl], e
    jr   nz, label_722A8
    jr   nz, label_722AA
    ld   d, l
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   l, $20
    jr   nz, label_722E8
    ld   l, b
    ld   h, l
    jr   nz, label_722B8
    jr   nz, label_722BA
    ld   c, c
    ld   l, [hl]
    ld   h, h
    ld   l, c
    ld   h, a
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, c
    ld   h, d

label_722A4::
    ld   l, h
    ld   h, l
    jr   nz, label_722C8

label_722A8::
    jr   nz, label_722CA

label_722AA::
    ld   b, [hl]
    ld   l, h
    ld   l, a
    ld   [hl], a
    ld   h, l

label_722AF::
    ld   [hl], d
    ld   [hl], e
    jr   nz, label_72322
    ld   h, [hl]
    jr   nz, label_722D6
    jr   nz, label_722D8

label_722B8::
    jr   nz, label_722DA

label_722BA::
    ld   b, a
    ld   l, a
    ld   [hl], b
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   h, c
    jr   nz, label_72316
    ld   [hl], a
    ld   h, c
    ld   l, l
    ld   [hl], b
    ld   l, $2E
    ld   l, $54
    ld   l, b
    ld   l, a
    ld   [hl], e

label_722CE::
    ld   h, l
    jr   nz, label_72337
    ld   l, h
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d

label_722D6::
    ld   [hl], e
    jr   nz, label_722F9
    jr   nz, label_7233C
    ld   [hl], d
    ld   h, l
    jr   nz, label_72321
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_72308

label_722E8::
    jr   nz, label_7230A
    ld   h, [hl]
    ld   h, c
    halt

label_722EE::
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   h, l
    ld   l, $20

label_722F4::
    jr   nz, label_7234D
    ld   l, b
    ld   a, c
    jr   nz, label_7231A
    ld   h, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_7237A
    ld   l, a
    ld   [hl], l
    jr   nz, label_72379
    ld   h, c
    ld   l, e
    ld   h, l

label_72308::
    jr   nz, label_7232A

label_7230A::
    ld   l, b
    ld   l, c
    ld   l, l
    jr   nz, label_72375
    ld   l, a
    ld   [hl], d
    jr   nz, label_72374
    jr   nz, label_7238C
    ld   h, c

label_72316::
    ld   l, h
    ld   l, e
    jr   nz, label_7233A

label_7231A::
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ccf
    jr   nz, label_72342

label_72322::
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E

label_7232A::
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c

label_72337::
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72948

label_7233C::
    inc  l
    jr   nz, label_723A8
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_72342::
    jr   nz, label_72399
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_2E2E
    ld   l, $48
    ld   h, c
    halt
    jr   nz, label_723CC
    ld   l, a
    ld   [hl], l
    jr   nz, label_723C4
    ld   h, l
    ld   [hl], h
    jr   nz, label_723C0
    halt
    ld   [hl], d
    ld   a, c
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_723D3
    ld   l, [hl]
    jr   nz, label_723DB
    ld   l, b
    ld   h, l
    jr   nz, label_723D4
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ccf
    jr   nz, label_72393
    ld   d, h

label_72374::
    ld   l, b

label_72375::
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   e, [hl]

label_72379::
    ld   [hl], e

label_7237A::
    ld   h, c
    jr   nz, label_723EA
    ld   h, c
    ld   l, [hl]
    jr   nz, label_723EF
    ld   h, c
    ld   l, l
    ld   h, l
    ld   h, h
    jr   nz, label_723A7
    jr   nz, label_723A9
    jr   nz, label_723DD
    ld   l, c

label_7238C::
    ld   h, e
    ld   l, b
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_7240A

label_72393::
    ld   l, b
    ld   l, a
    jr   nz, label_723B7
    jr   nz, label_723B9

label_72399::
    jr   nz, label_72407
    ld   l, c
    halt
    ld   [hl], e
    jr   nz, label_7240A
    ld   l, [hl]
    jr   nz, label_723F4
    ld   l, a
    ld   [hl], h
    ld   l, b

label_723A7::
    ld   l, a

label_723A8::
    ld   l, h

label_723A9::
    ld   h, l
    ld   b, [hl]
    ld   l, c
    ld   h, l
    ld   l, h
    ld   h, h
    inc  l
    jr   nz, label_72425
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    ld   h, l

label_723B7::
    ld   h, c
    ld   [hl], e

label_723B9::
    ld   [hl], h
    ld   l, a
    ld   h, [hl]
    jr   nz, label_72432
    ld   l, b
    ld   h, l

label_723C0::
    jr   nz, label_72438
    ld   l, c
    ld   l, h

label_723C4::
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    ld   l, $20
    ld   d, a
    ld   l, b

label_723CC::
    ld   a, c
    jr   nz, label_7243D
    ld   l, a
    ld   [hl], h
    jr   nz, label_72443

label_723D3::
    ld   h, c

label_723D4::
    ld   a, c
    jr   nz, label_7243F
    ld   l, c
    ld   l, l
    jr   nz, label_7243C

label_723DB::
    jr   nz, label_72453

label_723DD::
    ld   l, c
    ld   [hl], e
    ld   l, c
    ld   [hl], h
    ccf
    jr   nz, label_72404
    ld   d, h
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_723EA::
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_72438

label_723EF::
    jr   nz, label_72454
    ld   h, c
    ld   l, [hl]
    jr   nz, label_72469
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_7241A
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_72465
    ld   l, a
    ld   [hl], d
    jr   nz, label_72471
    ld   l, a

label_72404::
    ld   [hl], a
    ld   hl, label_2020
    jr   nz, label_7242A

label_7240A::
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_7241A::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c

label_72425::
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72C4F

label_7242A::
    ld   h, h
    jr   nz, label_7249A
    ld   h, c
    ld   l, [hl]
    jr   nz, label_72486
    ld   l, h

label_72432::
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    jr   nz, label_72458

label_72438::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_7243C::
    ld   hl, label_2E20

label_7243F::
    ld   l, $2E
    ld   b, h
    ld   l, a

label_72443::
    jr   nz, label_724BE
    ld   l, a
    ld   [hl], l
    jr   nz, label_724B5
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_724B0
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   l, [hl]
    ld   h, c

label_72453::
    ld   [hl], e

label_72454::
    ccf
    jr   nz, label_72477
    jr   nz, label_724AD
    ld   [hl], d
    ld   a, c
    jr   nz, label_724D1
    ld   h, c
    ld   l, h
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_724D9

label_72465::
    ld   l, a
    jr   nz, label_72488
    ld   [hl], b

label_72469::
    ld   h, l
    ld   l, a
    ld   [hl], b
    ld   l, h
    ld   h, l
    jr   nz, label_724D9
    ld   l, [hl]

label_72471::
    jr   nz, label_724E7
    ld   l, b
    ld   h, l
    jr   nz, label_72497

label_72477::
    jr   nz, label_724EF
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_724E2
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   hl, label_2020

label_72488::
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]

label_72497::
    ld   b, d
    ld   d, d
    ld   d, d

label_7249A::
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72C55
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    jr   nz, label_72521
    ld   [hl], b
    ld   h, l

label_724B0::
    ld   h, c
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_724B5::
    ld   hl, label_72F59
    ld   [hl], l
    jr   nz, label_72526
    ld   l, [hl]
    ld   l, a
    ld   [hl], a

label_724BE::
    inc  l
    jr   nz, label_72535
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_72530
    ld   [hl], e
    jr   nz, label_7252B
    jr   nz, label_72538
    ld   l, c
    ld   h, d
    ld   [hl], d
    ld   h, c
    ld   [hl], d

label_724D1::
    ld   a, c
    jr   nz, label_7253D
    ld   l, [hl]
    jr   nz, label_7254B
    ld   l, b
    ld   h, l

label_724D9::
    jr   nz, label_72551
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_72557
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   l, l

label_724E7::
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_72555
    ld   h, c
    halt
    jr   nz, label_72565
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_7255E
    ld   l, a
    ld   l, a
    ld   h, h
    jr   nz, label_72565
    ld   l, [hl]
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    ld   l, l
    ld   h, c
    ld   [hl], h
    ld   l, c
    ld   l, a
    ld   l, [hl]
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_72584
    ld   l, a
    ld   [hl], l
    ld   hl, label_2020
    ld   d, h
    ld   h, c
    ld   l, h
    ld   l, e
    jr   nz, label_72536
    ld   [hl], h
    ld   l, a
    jr   nz, label_72593
    ld   l, a
    ld   [hl], l
    jr   nz, label_7258A
    ld   h, c
    ld   [hl], h
    ld   h, l

label_72521::
    ld   [hl], d
    ld   hl, label_2020
    jr   nz, label_7256A
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e

label_7252B::
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_72530::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a

label_72535::
    ld   hl, label_70220

label_72538::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a

label_7253D::
    ld   hl, label_72159
    inc  l
    jr   nz, label_725AC
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_7259D

label_72548::
    ld   l, h
    ld   [hl], d
    ld   l, c

label_7254B::
    ld   [hl], d

label_7254C::
    ld   h, c
    ld   hl, label_72F59
    ld   [hl], l

label_72551::
    jr   nz, label_725C6
    ld   h, c
    ld   a, c

label_72555::
    jr   nz, label_725D0

label_72557::
    ld   l, a
    ld   [hl], l

label_72559::
    jr   nz, label_7257B
    jr   nz, label_7257D
    jr   nz, label_725C7
    ld   h, c
    halt
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h

label_72565::
    jr   nz, label_725CD
    ld   l, a
    ld   [hl], l
    ld   l, [hl]

label_7256A::
    ld   h, h
    jr   nz, label_7258D
    jr   nz, label_725D0
    ld   l, h
    ld   l, h
    jr   nz, label_725D9
    ld   l, c
    halt
    jr   nz, label_725BF
    ld   l, a
    ld   l, h
    ld   h, h

label_7257B::
    ld   h, l
    ld   l, [hl]

label_7257D::
    jr   nz, label_725CB
    ld   h, l
    ld   h, c
    halt
    ld   [hl], e

label_72584::
    ccf
    jr   nz, label_725CE
    ld   l, a
    jr   nz, label_725EB

label_7258A::
    ld   [hl], e
    ld   l, e
    jr   nz, label_725AE
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_725F6

label_72593::
    ld   [hl], d
    ld   l, a
    ld   [hl], a
    jr   nz, label_725F9
    ld   [hl], h
    jr   nz, label_7260F
    ld   l, b
    ld   h, l

label_7259D::
    jr   nz, label_72602
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, h
    ld   h, l
    ld   l, $20
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_7261E
    ld   [hl], l

label_725AC::
    ld   [hl], d
    ld   h, l

label_725AE::
    ld   l, b
    ld   h, l
    jr   nz, label_72615
    ld   h, c
    ld   l, [hl]
    jr   nz, label_7261E
    ld   h, l
    ld   l, h
    ld   [hl], b
    jr   nz, label_72634
    ld   l, a
    ld   [hl], l
    ld   l, $42

label_725BF::
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    jr   nz, label_725E6

label_725C6::
    jr   nz, label_725E8
    jr   nz, label_725EA
    jr   nz, label_725EC
    jr   nz, label_725EE

label_725CE::
    ld   b, e
    ld   c, h

label_725D0::
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d

label_725D9::
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72C55

label_725E8::
    ld   [hl], d
    ld   l, c

label_725EA::
    ld   [hl], d

label_725EB::
    ld   h, c

label_725EC::
    jr   nz, label_72656

label_725EE::
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2E20
    ld   l, $2E

label_725F6::
    ld   d, e
    ld   l, b
    ld   l, a

label_725F9::
    halt
    ld   l, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_72646

label_72602::
    ld   l, c
    ld   h, h
    jr   nz, label_72626
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_7267B
    ld   [hl], l
    ld   [hl], d
    ld   h, e
    ld   l, b

label_7260F::
    ld   h, c
    ld   [hl], e
    ld   h, l
    jr   nz, label_72675
    jr   nz, label_72636
    ld   [hl], e
    ld   l, b
    ld   l, a
    halt
    ld   l, h
    ccf
    jr   nz, label_7263F
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_72691
    ld   h, c
    ld   a, c

label_72626::
    ld   h, [hl]
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_7269F
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_72634::
    jr   nz, label_72656

label_72636::
    ld   l, c
    ld   h, [hl]
    jr   nz, label_726B3
    ld   l, a
    ld   [hl], l
    jr   nz, label_726A2
    ld   l, c

label_7263F::
    ld   h, a
    jr   nz, label_726AA
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_726A8
    ld   l, [hl]
    ld   h, h
    jr   nz, label_726BF
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2020
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_70C43
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72159
    inc  l
    jr   nz, label_726DC
    ld   [hl], h
    ld   e, [hl]

label_72675::
    ld   [hl], e
    jr   nz, label_726CD
    ld   l, h
    ld   [hl], d
    ld   l, c

label_7267B::
    ld   [hl], d
    ld   h, c
    ld   hl, label_72854
    ld   h, l
    jr   nz, label_726E6
    ld   h, c
    halt
    jr   nz, label_726F1
    ld   l, [hl]
    jr   nz, label_726FF
    ld   l, b
    ld   h, l
    jr   nz, label_726E4
    ld   l, e
    ld   [hl], l

label_72691::
    ld   l, e
    ld   [hl], l
    jr   nz, label_726E5
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   [hl], d
    ld   l, c
    ld   h, l
    jr   nz, label_72706
    ld   [hl], e
    ld   [hl], h

label_7269F::
    ld   l, b
    ld   h, l
    jr   nz, label_7270E
    ld   h, l
    ld   a, c
    ld   hl, label_2020

label_726A8::
    ld   e, c
    ld   h, l

label_726AA::
    ld   [hl], e
    inc  l
    jr   nz, label_726F7
    ld   l, l
    ld   h, l
    ld   h, c
    ld   l, [hl]
    jr   nz, label_72728
    ld   l, b
    ld   h, l
    jr   nz, label_72723
    ld   h, l
    ld   a, c
    jr   nz, label_726DC
    jr   nz, label_726DE
    ld   h, e

label_726BF::
    ld   h, c
    halt
    inc  l
    jr   nz, label_72733
    ld   l, a
    jr   nz, label_72738
    ld   [hl], l
    ld   l, [hl]
    jr   nz, label_726EC
    jr   nz, label_726EE
    ld   l, c
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   h, h
    ld   hl, label_2020
    ld   b, d
    ld   a, c
    ld   h, l

label_726DC::
    ld   hl, label_70320
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E

label_726E6::
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]

label_726EC::
    ld   b, a
    ld   hl, label_70220
    ld   d, d

label_726F1::
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72948
    inc  l
    jr   nz, label_7276F
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_72769
    ld   [hl], e
    jr   nz, label_72723
    jr   nz, label_72725
    jr   nz, label_7275C
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_2020
    ld   c, c
    ld   l, [hl]
    jr   nz, label_72787
    ld   l, b
    ld   h, l
    jr   nz, label_72770
    ld   h, c
    ld   [hl], d
    ld   l, [hl]
    ld   h, c
    jr   nz, label_72761
    ld   h, l
    ld   [hl], e
    ld   h, l
    ld   [hl], d
    ld   [hl], h
    inc  l

label_72723::
    jr   nz, label_72745

label_72725::
    jr   nz, label_7279E
    ld   l, b

label_72728::
    ld   l, c
    ld   h, e
    ld   l, b
    jr   nz, label_72796
    ld   [hl], e
    jr   nz, label_7279C
    ld   l, a
    ld   h, e
    ld   h, c

label_72733::
    ld   [hl], h
    ld   h, l
    ld   h, h
    ld   l, c
    ld   l, [hl]

label_72738::
    jr   nz, label_727AE
    ld   l, b
    ld   h, l
    jr   nz, label_727B1
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   h, c
    ld   [hl], e

label_72745::
    ld   [hl], h
    ld   l, a
    ld   h, [hl]
    jr   nz, label_727BE
    ld   l, b
    ld   h, l
    jr   nz, label_727B7
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    inc  l
    jr   nz, label_72776
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_727D2
    ld   l, c

label_7275C::
    ld   l, h
    ld   l, h
    jr   nz, label_727C6
    ld   l, c

label_72761::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_72785
    jr   nz, label_727DA
    ld   l, a
    ld   l, l

label_72769::
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_7276F::
    jr   nz, label_727D4
    ld   h, c
    ld   l, h
    ld   l, h
    ld   h, l
    ld   h, h

label_72776::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_727BC
    ld   l, [hl]
    ld   h, a
    ld   l, h
    ld   h, l
    ld   [hl], d
    jr   nz, label_727CD
    ld   h, l
    ld   a, c
    ld   l, $20
    ld   c, b

label_72787::
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, $2E
    ld   l, $20
    ld   c, b
    ld   l, a
    ld   [hl], a
    jr   nz, label_72800
    ld   [hl], l
    ld   h, e
    ld   l, b

label_72796::
    ld   l, l
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_7280B

label_7279C::
    ld   h, d
    halt
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_72808
    ld   l, a
    jr   nz, label_727F0
    jr   nz, label_72811
    ld   h, c
    halt
    jr   nz, label_72822

label_727AE::
    ld   l, a
    jr   nz, label_72813

label_727B1::
    ld   h, l
    ccf
    jr   nz, label_727D5
    jr   nz, label_727F9

label_727B7::
    ld   a, c
    ld   h, l
    ld   hl, label_70320

label_727BC::
    ld   c, h
    ld   c, c

label_727BE::
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d

label_727C6::
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220

label_727CD::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a

label_727D2::
    ld   hl, label_72854

label_727D5::
    ld   l, c
    ld   [hl], e
    jr   nz, label_72842
    ld   [hl], e

label_727DA::
    jr   nz, label_72831
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_70E20
    ld   l, a
    ld   [hl], a
    jr   nz, label_72861
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_72851
    ld   h, l

label_727F0::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, b
    ld   h, c
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, l

label_727F9::
    ld   h, h
    jr   nz, label_7285E
    ld   a, c
    jr   nz, label_72860
    jr   nz, label_72821
    jr   nz, label_72823
    ld   h, a
    ld   l, b
    ld   l, a
    ld   [hl], e
    ld   [hl], h

label_72808::
    ccf
    ld   hl, label_71720
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_72832
    jr   nz, label_7287C
    ld   l, a
    ld   [hl], a
    jr   nz, label_72879
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_72892
    ld   h, c
    ld   l, e
    ld   l, c

label_72821::
    ld   l, [hl]

label_72822::
    ld   h, a

label_72823::
    ld   l, b
    ld   l, c
    ld   l, l
    jr   nz, label_7289F
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_72896
    ld   h, l
    jr   nz, label_72851

label_72831::
    jr   nz, label_72853
    ld   [hl], a
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_728AE
    ld   l, a
    jr   nz, label_728A4
    ld   l, a
    ccf
    jr   nz, label_72861

label_72841::
    jr   nz, label_72863
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_70320
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]

label_72851::
    ld   b, d
    ld   d, d

label_72853::
    ld   d, d

label_72854::
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]

label_7285E::
    ld   b, a
    ld   hl, label_72948
    inc  l

label_72863::
    jr   nz, label_728CE
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_728BF

label_7286A::
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_72854
    ld   h, l
    jr   nz, label_728B8
    ld   h, c
    ld   [hl], h
    ld   h, [hl]
    ld   l, c

label_72879::
    ld   [hl], e
    ld   l, b
    ld   e, [hl]

label_7287C::
    ld   [hl], e
    jr   nz, label_7289F
    jr   nz, label_728EE
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    jr   nz, label_728F0
    ld   [hl], e
    jr   nz, label_72901
    ld   l, c
    ld   h, h
    ld   h, l
    jr   nz, label_728AF
    jr   nz, label_72900
    ld   [hl], b

label_72892::
    ld   h, l
    ld   l, [hl]
    ccf
    jr   nz, label_728B7
    ld   c, c
    ld   [hl], h
    jr   nz, label_7290E
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h

label_7289F::
    ld   [hl], e
    ld   l, h
    ld   l, c
    ld   l, e
    ld   h, l

label_728A4::
    jr   nz, label_72907
    jr   nz, label_7290F
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   [hl], h
    jr   nz, label_728CE

label_728AE::
    jr   nz, label_728D0
    ld   [hl], b
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    jr   nz, label_7292B

label_728B7::
    ld   l, a

label_728B8::
    jr   nz, label_7291E
    ld   l, c
    halt
    ld   hl, label_2020
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E

label_728CE::
    ld   e, [hl]
    ld   b, d

label_728D0::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72C55
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    jr   nz, label_7294E
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2E20
    ld   l, $2E

label_728EE::
    ld   c, b
    ld   h, c

label_728F0::
    halt
    jr   nz, label_7296D
    ld   l, a
    ld   [hl], l
    jr   nz, label_7295A
    ld   h, l
    ld   h, l
    ld   l, [hl]
    jr   nz, label_72971
    ld   l, a
    ld   [hl], h
    ld   l, b

label_72900::
    ld   h, l

label_72901::
    jr   nz, label_72949
    ld   h, c
    ld   h, e
    ld   h, l
    jr   nz, label_7295B
    ld   l, b
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   h, l
    ccf

label_7290E::
    ld   c, c

label_7290F::
    ld   [hl], h
    jr   nz, label_7297B
    ld   [hl], e
    jr   nz, label_72983
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   l, b
    jr   nz, label_7298A
    ld   h, [hl]
    jr   nz, label_7293E

label_7291E::
    ld   b, c
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_7297C
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a

label_7292B::
    ld   h, l
    ld   l, $20
    ld   d, h
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_7299D
    ld   [hl], e
    jr   nz, label_72998
    jr   nz, label_729AF
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_7295E

label_7293E::
    ld   l, c
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, c
    ld   l, [hl]

label_72948::
    ld   h, a

label_72949::
    jr   nz, label_7296B

label_7294B::
    jr   nz, label_7296D
    jr   nz, label_729C1
    ld   [hl], l
    ld   l, c
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e

label_7295A::
    ld   c, e

label_7295B::
    ld   hl, $FF5E

label_7295E::
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c

label_7296B::
    ld   c, [hl]
    ld   b, a

label_7296D::
    ld   hl, label_72948
    inc  l

label_72971::
    jr   nz, label_729DC
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_729CD
    ld   l, h
    ld   [hl], d
    ld   l, c

label_7297B::
    ld   [hl], d

label_7297C::
    ld   h, c
    ld   hl, label_72148
    halt
    jr   nz, label_729FD
    ld   l, a
    ld   [hl], l
    jr   nz, label_729F0
    ld   h, l
    ld   h, c

label_7298A::
    ld   [hl], d
    ld   h, h
    jr   nz, label_729AE
    ld   l, a
    ld   h, [hl]
    jr   nz, label_72A06
    ld   l, b
    ld   h, l
    jr   nz, label_729DC
    ld   l, h
    ld   a, c

label_72998::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_729BD

label_7299D::
    jr   nz, label_729F1
    ld   l, a
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_72A16
    ld   h, [hl]
    jr   nz, label_729F7
    ld   h, c
    ld   h, d
    ld   h, l
    jr   nz, label_72A05

label_729AF::
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    ccf
    jr   nz, label_729D8
    ld   c, c
    ld   l, [hl]
    jr   nz, label_72A30
    ld   l, b

label_729BD::
    ld   h, l
    ld   h, a
    ld   l, a
    ld   l, a

label_729C1::
    ld   h, h
    jr   nz, label_72A33
    ld   l, h
    ld   h, h
    jr   nz, label_72A2C
    ld   h, c
    ld   a, c
    ld   [hl], e
    inc  l
    jr   nz, label_729EE
    ld   l, c
    ld   [hl], h
    jr   nz, label_72A47
    ld   [hl], e
    ld   h, l
    ld   h, h
    jr   nz, label_72A4B
    ld   l, a

label_729D8::
    jr   nz, label_72A41
    ld   l, c
    halt
    jr   nz, label_72A54
    ld   [hl], e
    jr   nz, label_72A54
    ld   l, c
    ld   h, h
    ld   h, l
    ld   [hl], e
    jr   nz, label_72A51
    ld   h, [hl]
    jr   nz, label_72A62
    ld   h, l
    jr   nz, label_72A0E

label_729EE::
    ld   l, b
    ld   h, l

label_729F0::
    ld   l, h

label_729F1::
    ld   h, h
    jr   nz, label_72A5D
    ld   [hl], h
    jr   nz, label_72A58

label_729F7::
    ld   h, d
    ld   l, a
    halt
    jr   nz, label_72A1D

label_729FD::
    jr   nz, label_72A6E
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_72A6B
    ld   h, l
    ld   h, c

label_72A05::
    ld   h, h

label_72A06::
    ld   [hl], e
    ld   l, $2E
    ld   l, $20
    ld   c, [hl]
    ld   l, a
    ld   [hl], a

label_72A0E::
    ld   l, c
    ld   [hl], h
    jr   nz, label_72A7B
    ld   [hl], e
    jr   nz, label_72A81
    ld   a, c

label_72A16::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_72A3B
    jr   nz, label_72A3D

label_72A1D::
    jr   nz, label_72A94
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    jr   nz, label_72A99
    ld   l, b
    ld   h, l
    jr   nz, label_72A49
    jr   nz, label_72A4B
    jr   nz, label_72A4D
    jr   nz, label_72A86
    ld   h, l

label_72A30::
    ld   h, c
    ld   [hl], h
    ld   l, b

label_72A33::
    ld   h, l
    ld   [hl], d
    ld   h, e
    ld   l, a
    ld   h, e
    ld   l, e
    ld   l, $2E

label_72A3B::
    ld   l, $20

label_72A3D::
    jr   nz, label_72A88
    ld   [hl], e
    jr   nz, label_72AB6
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_72ABC

label_72A47::
    ld   [hl], e
    ld   h, l

label_72A49::
    ld   h, [hl]
    ld   [hl], l

label_72A4B::
    ld   l, h
    jr   nz, label_72A6E
    ld   h, [hl]
    ld   l, a
    ld   [hl], d

label_72A51::
    jr   nz, label_72ACC
    ld   l, a

label_72A54::
    ld   [hl], l
    ccf
    jr   nz, label_72A78

label_72A58::
    ld   c, c
    jr   nz, label_72AC3
    ld   l, a
    ld   [hl], b

label_72A5D::
    ld   h, l
    ld   [hl], e
    ld   l, a
    ld   hl, label_70220
    ld   a, c
    ld   h, l
    ld   hl, label_70320
    ld   c, h
    ld   c, c
    ld   b, e

label_72A6B::
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d

label_72A7B::
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72948

label_72A81::
    inc  l
    jr   nz, label_72AED
    ld   [hl], h
    ld   e, [hl]

label_72A86::
    ld   [hl], e
    jr   nz, label_72ADE
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_72854
    ld   h, l
    jr   nz, label_72AFC

label_72A94::
    ld   h, l
    ld   h, c
    ld   h, h
    jr   nz, label_72B08

label_72A99::
    ld   h, [hl]
    jr   nz, label_72B10
    ld   l, b
    ld   h, l
    jr   nz, label_72B14
    ld   [hl], l
    ld   [hl], d
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_72B10
    ld   [hl], e
    jr   nz, label_72B13
    ld   l, [hl]
    jr   nz, label_72ACD
    jr   nz, label_72ACF
    ld   a, c
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_72B2C
    ld   h, c

label_72AB6::
    ld   a, c
    ccf
    jr   nz, label_72ADA
    ld   d, b
    ld   [hl], l

label_72ABC::
    ld   [hl], h
    jr   nz, label_72ADF
    ld   l, h
    ld   l, c
    ld   h, [hl]
    ld   h, l

label_72AC3::
    jr   nz, label_72B2E
    ld   l, [hl]
    ld   [hl], h
    ld   l, a
    jr   nz, label_72B33
    ld   [hl], h
    jr   nz, label_72B2E

label_72ACD::
    ld   l, [hl]
    ld   h, h

label_72ACF::
    ld   l, c
    ld   [hl], h
    jr   nz, label_72B4A
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_72B45
    ld   l, a
    halt
    ld   hl, label_2020

label_72ADE::
    jr   nz, label_72B29
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_72B59
    ld   [hl], d
    ld   [hl], l
    ld   h, l
    ld   hl, label_71420
    ld   [hl], d
    ld   [hl], l

label_72AED::
    ld   h, l
    ld   hl, label_73942
    ld   h, l
    ld   hl, label_2020
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    jr   nz, label_72B1F
    jr   nz, label_72B2F
    ld   l, $2E
    ld   d, e
    ld   d, a
    ld   b, c
    ld   c, l
    ld   d, b

label_72B08::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_72B2E
    ld   b, c
    jr   nz, label_72B81
    ld   h, c
    ld   [hl], h

label_72B13::
    ld   l, b

label_72B14::
    jr   nz, label_72B85
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    ld   [hl], e
    ld   l, $2E
    ld   l, $69
    ld   l, [hl]

label_72B1F::
    jr   nz, label_72B95
    ld   l, b
    ld   h, l
    jr   nz, label_72B87
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, l

label_72B29::
    ld   [hl], e
    ld   l, $2E

label_72B2C::
    ld   l, $FF

label_72B2E::
    jr   nz, label_72B50
    ld   l, $2E
    ld   l, $50
    ld   d, d
    ld   b, c
    ld   c, c
    ld   d, d
    ld   c, c
    ld   b, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_72B60
    ld   l, $2E
    ld   l, $50
    ld   d, d

label_72B45::
    ld   b, c
    ld   c, c
    ld   d, d
    ld   c, c
    ld   b, l

label_72B4A::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_72BA4

label_72B50::
    ld   l, b
    ld   h, l
    jr   nz, label_72BA4
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   [hl], d
    ld   l, c

label_72B59::
    ld   h, l
    jr   nz, label_72BC5
    ld   [hl], e
    jr   nz, label_72B7F
    jr   nz, label_72B81
    jr   nz, label_72B83
    ld   [hl], a
    ld   h, c
    ld   l, c
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, $2E
    ld   l, $FF
    ld   l, $2E
    ld   l, $57
    ld   b, c
    ld   d, h
    ld   b, l
    ld   d, d
    ld   b, [hl]
    ld   b, c
    ld   c, h
    ld   c, h
    ld   l, $2E
    ld   l, $20
    ld   c, c

label_72B7F::
    ld   [hl], h
    jr   nz, label_72BEB
    ld   [hl], e

label_72B83::
    jr   nz, label_72BED

label_72B85::
    ld   l, c
    ld   h, h

label_72B87::
    ld   h, h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_72BF5
    ld   l, [hl]
    jr   nz, label_72C03
    ld   l, b
    ld   h, l
    jr   nz, label_72C0A
    ld   h, c
    ld   [hl], h

label_72B95::
    ld   h, l
    ld   [hl], d
    ld   h, [hl]
    ld   h, c
    ld   l, h
    ld   l, h
    ld   l, $2E
    ld   l, $FF
    jr   nz, label_72BC1
    jr   nz, label_72BC3
    ld   l, $2E
    ld   l, $42
    ld   b, c
    ld   e, c
    ld   l, $2E
    ld   l, $20
    jr   nz, label_72BCF
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_72C27
    ld   l, a
    ld   h, c
    ld   h, h
    jr   nz, label_72C21
    ld   l, a
    ld   h, l
    ld   [hl], e
    jr   nz, label_72BDF
    ld   l, c
    ld   l, [hl]

label_72BC1::
    ld   [hl], h
    ld   l, a

label_72BC3::
    jr   nz, label_72C39

label_72BC5::
    ld   l, b
    ld   h, l
    jr   nz, label_72C2B
    ld   h, c
    ld   a, c
    ld   l, $2E
    ld   l, $20

label_72BCF::
    rst  $38
    jr   nz, label_72BF2
    jr   nz, label_72C02
    ld   l, $2E
    ld   d, e
    ld   c, b
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, l
    ld   l, $2E
    ld   l, $20
    ld   b, c
    ld   l, [hl]
    jr   nz, label_72C4D
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_72C5E

label_72BEB::
    ld   h, l
    ld   h, e

label_72BED::
    ld   [hl], d
    ld   h, l
    ld   [hl], h
    ld   l, c
    ld   l, [hl]

label_72BF2::
    jr   nz, label_72C68
    ld   l, b

label_72BF5::
    ld   h, l
    jr   nz, label_72C6B
    ld   l, b
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    jr   nz, label_72C31

label_72C03::
    ld   l, $2E
    ld   c, l
    ld   c, a
    ld   d, l
    ld   c, [hl]
    ld   d, h

label_72C0A::
    ld   b, c
    ld   c, c
    ld   c, [hl]
    ld   l, $2E
    ld   l, $20
    ld   d, e
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_72C7F
    ld   h, c
    ld   l, h
    ld   l, h
    ld   [hl], e
    jr   nz, label_72C42
    jr   nz, label_72C52
    ld   l, $2E
    ld   h, [hl]

label_72C27::
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_72CA0
    ld   l, b
    ld   h, l
    jr   nz, label_72C50
    jr   nz, label_72C52
    jr   nz, label_72CA1
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, c

label_72C39::
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    jr   nz, label_72C62

label_72C42::
    ld   l, $2E
    ld   l, $4F
    ld   b, e
    ld   b, c
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, c
    ld   l, $2E
    ld   l, $20

label_72C50::
    ld   d, h
    ld   l, b

label_72C52::
    ld   h, l
    jr   nz, label_72CC2

label_72C55::
    ld   [hl], l
    ld   [hl], e
    ld   l, c
    ld   h, e
    jr   nz, label_72CCA
    ld   h, [hl]
    jr   nz, label_72CD2

label_72C5E::
    ld   l, b
    ld   h, l
    ld   c, a
    ld   h, e

label_72C62::
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   h, c
    jr   nz, label_72CD5
    ld   h, l
    ld   h, c

label_72C6B::
    ld   h, h
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    jr   nz, label_72C93
    jr   nz, label_72C95
    ld   l, $2E
    ld   l, $45
    ld   b, a
    ld   b, a
    ld   l, $2E
    ld   l, $2E

label_72C7F::
    jr   nz, label_72CA1
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_72CCB
    ld   h, a
    ld   h, a
    jr   nz, label_72CF9
    ld   l, [hl]
    jr   nz, label_72D01
    ld   l, b
    ld   h, l
    jr   nz, label_72CB1
    ld   l, l
    ld   l, a

label_72C93::
    ld   [hl], l
    ld   l, [hl]

label_72C95::
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]
    jr   nz, label_72CFE
    ld   h, c
    ld   l, h
    ld   l, h
    ld   [hl], e
    ld   hl, label_714FF
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_72D00
    ld   c, a
    ld   d, l
    jr   nz, label_72D1E
    ld   [hl], a
    ld   h, l
    ld   h, l
    ld   [hl], b
    jr   nz, label_72CD1

label_72CB1::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_72D1F
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   hl, label_719FF
    ld   b, c
    ld   c, b
    ld   c, a
    ld   c, a

label_72CC2::
    ld   hl, label_2020
    jr   nz, label_72D10
    ld   e, [hl]
    ld   l, l
    jr   nz, label_72CEB

label_72CCB::
    jr   nz, label_72CED
    ld   h, [hl]
    ld   l, c
    ld   l, [hl]
    ld   h, l

label_72CD1::
    inc  l

label_72CD2::
    jr   nz, label_72D35
    ld   l, [hl]

label_72CD5::
    ld   h, h
    jr   nz, label_72D51
    ld   l, a
    ld   [hl], l
    ccf
    ld   hl, label_719FF
    ld   b, c
    ld   c, b
    ld   c, a
    ld   c, a
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_72D5F
    ld   l, a
    ld   [hl], d
    ld   l, e

label_72CEB::
    ld   h, l
    ld   h, h

label_72CED::
    ld   [hl], h
    ld   l, a
    ld   l, a
    jr   nz, label_72D5A
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_72D58
    ld   l, [hl]
    ld   h, h

label_72CF9::
    jr   nz, label_72D69
    ld   l, a
    ld   [hl], a
    ld   l, l

label_72CFE::
    ld   a, c
    jr   nz, label_72D63

label_72D01::
    ld   [hl], d
    ld   l, a
    ld   l, a
    ld   l, l
    jr   nz, label_72D70
    ld   [hl], e
    jr   nz, label_72D81
    ld   l, a
    ld   [hl], d
    ld   l, [hl]
    ld   [hl], h
    ld   l, a
    jr   nz, label_72D85
    ld   l, b
    ld   h, l
    jr   nz, label_72D7D
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   l, h
    ld   h, l
    ld   hl, label_719FF
    ld   b, c

label_72D1E::
    ld   c, b

label_72D1F::
    ld   c, a
    ld   c, a
    ld   hl, label_2020
    ld   e, c
    ld   b, c
    ld   c, b
    ld   c, a
    ld   c, a
    ld   hl, label_2020
    ld   b, c
    jr   nz, label_72D9D
    ld   h, l
    ld   [hl], a
    jr   nz, label_72D95
    ld   [hl], d
    ld   l, a

label_72D35::
    ld   l, a
    ld   l, l
    ccf
    ld   hl, label_2020
    jr   nz, label_72D83
    ld   l, a
    ld   [hl], d
    jr   nz, label_72DAE
    ld   h, l
    ccf
    jr   nz, label_72D65
    ld   c, c
    ld   [hl], h
    jr   nz, label_72DB2
    ld   [hl], e
    inc  l
    jr   nz, label_72DB6
    ld   [hl], e
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h

label_72D51::
    jr   nz, label_72DBC
    ld   [hl], h
    ccf
    ld   hl, label_2020

label_72D58::
    jr   nz, label_72D7A

label_72D5A::
    jr   nz, label_72D7C
    jr   nz, label_72D7E
    jr   nz, label_72D80
    ld   e, c
    ld   h, l
    ld   [hl], e

label_72D63::
    jr   nz, label_72D85

label_72D65::
    ld   c, [hl]
    ld   l, a
    cp   $4F

label_72D69::
    ld   l, e
    ld   h, c
    ld   a, c
    ld   hl, label_2020
    ld   c, c

label_72D70::
    ld   l, [hl]
    jr   nz, label_72DE5
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   l, [hl]
    ld   a, c
    ld   l, a

label_72D7A::
    ld   [hl], l
    jr   nz, label_72DE0

label_72D7D::
    ld   h, c

label_72D7E::
    ld   l, [hl]
    jr   nz, label_72DE9

label_72D81::
    ld   h, c
    halt
    jr   nz, label_72DA6
    jr   nz, label_72DA8
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_72DF4
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_72DB6
    jr   nz, label_72DB8
    ld   l, b
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_72DE7
    jr   nz, label_72E06
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_72DC6

label_72DA6::
    jr   nz, label_72DC8

label_72DA8::
    ld   [hl], a
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_72DF7

label_72DAE::
    jr   nz, label_72E23
    ld   [hl], a
    ld   h, l

label_72DB2::
    ld   [hl], b
    ld   [hl], h
    jr   nz, label_72E18

label_72DB6::
    ld   a, c
    jr   nz, label_72E2D
    ld   l, b
    ld   h, l
    jr   nz, label_72E2F
    ld   l, c
    halt
    ld   [hl], d
    jr   nz, label_72E25
    ld   h, c
    ld   l, [hl]
    ld   l, e

label_72DC6::
    ld   hl, label_719FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_72E32
    ld   a, b
    ld   h, e
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   h, l
    ld   h, h
    jr   nz, label_72DBF

label_72DD7::
    jr   nz, label_72E3F
    ld   l, a
    ld   [hl], d
    jr   nz, label_72E51
    ld   l, b
    ld   h, l
    jr   nz, label_72E47
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   l, c

label_72DE5::
    ld   l, [hl]
    ld   h, a

label_72DE7::
    jr   nz, label_72E51

label_72DE9::
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_72DD7
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, c

label_72DF4::
    ld   [hl], h
    jr   nz, label_72E17

label_72DF7::
    jr   nz, label_72E70
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_72E72
    ld   l, b
    ld   h, l
    jr   nz, label_72E68
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   l, c

label_72E06::
    ld   l, [hl]
    ld   h, a
    ld   l, b
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_72E70
    ld   h, l
    ld   h, e
    ld   l, a
    ld   l, l
    ld   h, l
    ccf
    rst  $38
    ld   e, c
    ld   b, c

label_72E17::
    ld   c, b

label_72E18::
    ld   c, a
    ld   c, a
    ld   hl, label_2020
    ld   b, c
    jr   nz, label_72E8E
    ld   h, l
    ld   [hl], a
    jr   nz, label_72E44
    jr   nz, label_72E88
    ld   [hl], d
    ld   l, a
    ld   l, a
    ld   l, l
    ld   hl, label_2020

label_72E2D::
    ld   d, e
    ld   [hl], l

label_72E2F::
    ld   [hl], b
    ld   h, l
    ld   [hl], d

label_72E32::
    ld   h, d
    ld   hl, label_70BFF
    ld   l, c
    ld   l, c
    ld   l, c
    ld   l, e
    ld   l, c
    ld   hl, label_2020
    ld   d, a

label_72E3F::
    ld   l, b
    ld   h, c
    ld   [hl], h
    ccf
    ld   hl, label_70120
    ld   l, h

label_72E47::
    ld   l, h
    jr   nz, label_72EBC
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    inc  l
    jr   nz, label_72EBE

label_72E51::
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   hl, label_7254C
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_72EBE
    ld   h, c
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    ld   hl, rNR42
    ld   b, e
    ld   l, b
    ld   l, c
    dec  l

label_72E68::
    ld   l, e
    ld   l, c
    ld   l, c
    ld   [hl], h
    ld   h, c
    ld   hl, label_70320

label_72E70::
    ld   l, b
    ld   l, c

label_72E72::
    dec  l
    jr   nz, label_72EE0
    ld   l, c
    ld   l, c
    ld   [hl], h
    ld   h, c
    ld   hl, label_2020
    ld   c, e
    ld   l, c
    ld   l, e
    ld   l, c
    jr   nz, label_72EF6
    ld   l, b
    ld   h, l
    ld   l, l
    ld   l, a
    ld   l, [hl]
    ld   l, e

label_72E88::
    ld   h, l
    ld   a, c
    ld   hl, label_2020

label_72E8D::
    ld   c, b

label_72E8E::
    ld   [hl], l
    ld   l, [hl]
    ld   h, a
    ld   [hl], d
    ld   a, c
    ld   hl, label_7294B
    ld   l, e
    ld   l, c
    jr   nz, label_72F0E
    ld   l, b
    ld   h, l
    jr   nz, label_72F0B
    ld   l, a
    ld   l, [hl]
    ld   l, e
    ld   h, l
    ld   a, c
    ld   hl, label_20FF
    jr   nz, label_72EC8
    jr   nz, label_72E8D
    ld   hl, label_2020
    jr   nz, label_72ECF
    db   $E3 ; Undefined instruction
    ld   hl, label_2020
    jr   nz, label_72ED5
    ld   c, a
    ld   l, a
    ld   l, a
    ld   l, b
    ld   hl, label_70F20

label_72EBC::
    ld   l, a
    ld   l, b

label_72EBE::
    ld   hl, label_70B20
    ld   l, c
    ld   l, e
    ld   l, c
    ld   hl, label_72F4D
    ld   l, [hl]

label_72EC8::
    ld   l, e
    ld   h, l
    ld   a, c
    ld   [hl], e
    ld   hl, label_2020

label_72ECF::
    ld   b, e
    ld   l, a
    ld   l, l
    ld   h, l
    ld   hl, label_71220
    ld   h, l
    ld   [hl], b
    ld   h, c
    ld   a, c
    jr   nz, label_72F44
    ld   l, c
    ld   l, l
    ld   hl, label_70B20
    ld   l, c
    ld   l, e
    ld   l, c
    ld   hl, label_70DFF
    ld   l, a
    ld   l, [hl]
    ld   l, e
    ld   h, l
    ld   a, c
    jr   nz, label_72F50
    ld   [hl], l
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   hl, label_72F44
    ld   l, [hl]
    ld   h, l
    ld   hl, label_2020
    ld   b, d
    ld   a, c
    ld   h, l
    jr   nz, label_72F64
    ld   a, c
    ld   h, l
    ld   hl, label_70F20
    ld   l, a
    ld   l, a
    ld   l, b
    ld   hl, label_2020
    ld   c, e

label_72F0E::
    ld   l, c
    ld   l, e
    ld   l, c
    ld   hl, label_719FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_72F7E
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_72F7F
    jr   nz, label_72F40
    jr   nz, label_72F42
    jr   nz, label_72F97
    ld   [hl], h
    ld   l, c
    ld   h, e
    ld   l, e
    jr   nz, label_72F8B
    jr   nz, label_72F99
    ld   l, a
    ld   l, [hl]
    ld   l, e
    ld   h, l
    ld   a, c
    jr   nz, label_72F53
    ld   l, h
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    jr   nz, label_72F9B
    ld   h, l
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, h
    ld   l, $2E

label_72F40::
    ld   l, $20

label_72F42::
    jr   nz, label_72F9D

label_72F44::
    ld   l, a
    ld   [hl], l
    jr   nz, label_72FBC
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_72FB6

label_72F4D::
    ld   [hl], h
    ld   hl, label_20FF
    jr   nz, label_72F73

label_72F53::
    jr   nz, label_72F38
    ld   hl, label_2020
    jr   nz, label_72F7A
    db   $E3 ; Undefined instruction
    ld   hl, label_2020
    jr   nz, label_72F80
    jr   nz, label_72F82
    ld   c, a
    ld   l, a

label_72F64::
    ld   l, a
    ld   l, b
    ld   hl, label_2020
    ld   c, a
    ld   l, a
    ld   l, a
    ld   l, b
    ld   hl, label_2020
    jr   nz, label_72FB9
    ld   l, c

label_72F73::
    halt
    jr   nz, label_72FEB
    ld   l, a
    jr   nz, label_72FC5

label_72F7A::
    ld   l, c
    ld   l, e
    ld   l, c
    ld   hl, label_203F

label_72F80::
    jr   nz, label_72FA2

label_72F82::
    jr   nz, label_72FA4
    ld   e, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_72FA9
    ld   c, [hl]
    ld   l, a

label_72F8B::
    ld   hl, label_719FE
    ld   l, a
    ld   [hl], l
    jr   nz, label_72FF6
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_73003
    ld   l, [hl]

label_72F99::
    ld   l, a
    ld   [hl], a

label_72F9B::
    jr   nz, label_72FBD

label_72F9D::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_73012

label_72FA2::
    ld   [hl], d
    ld   l, a

label_72FA4::
    ld   [hl], b
    ld   h, l
    ld   [hl], d
    jr   nz, label_72FC9

label_72FA9::
    jr   nz, label_72FCB
    jr   nz, label_72FCD
    ld   h, l
    ld   [hl], h
    ld   l, c
    ld   [hl], c
    ld   [hl], l
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l

label_72FB6::
    jr   nz, label_7302F
    ld   l, b

label_72FB9::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_72FDD

label_72FBD::
    ld   h, h
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7303D
    ld   l, c
    ld   [hl], h
    ld   l, b

label_72FC9::
    jr   nz, label_7302C

label_72FCB::
    jr   nz, label_72FED

label_72FCD::
    ld   l, h
    ld   h, c
    ld   h, h
    ld   a, c
    inc  l
    jr   nz, label_73038
    ld   l, a
    jr   nz, label_73050
    ld   l, a
    ld   [hl], l
    ccf
    jr   nz, label_72FFC
    jr   nz, label_73037
    ld   l, a
    ld   [hl], l
    jr   nz, label_73055
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_73051
    ld   h, c
    halt
    jr   nz, label_73050
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_7305C

label_72FF6::
    ld   l, h
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   [hl], e

label_72FFC::
    jr   nz, label_7306D
    ld   [hl], d
    jr   nz, label_73074
    ld   l, a
    ld   l, l

label_73003::
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    inc  l
    jr   nz, label_7302C
    jr   nz, label_73082
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_7305C
    jr   nz, label_73082
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_7307D
    ld   h, l
    jr   nz, label_7308B
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_7308C
    ld   l, [hl]
    ld   h, e
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   h, l
    ld   h, h
    jr   nz, label_730A0

label_7302C::
    ld   l, a
    ld   [hl], h
    ld   h, c

label_7302F::
    ld   l, h
    ld   l, e
    jr   nz, label_730AA
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_730B1

label_73038::
    ld   l, a
    ld   [hl], l
    ld   l, $2E
    ld   l, $4F
    ld   l, b
    jr   nz, label_730BA
    ld   h, l
    ld   [hl], e
    inc  l
    jr   nz, label_730AF
    ld   l, [hl]
    jr   nz, label_730B6
    ld   a, c
    jr   nz, label_7306C
    jr   nz, label_730B1
    ld   h, c
    ld   [hl], e

label_73050::
    ld   h, l

label_73051::
    inc  l
    jr   nz, label_730BC
    ld   l, c

label_73055::
    ld   h, d
    ld   l, c
    ld   [hl], e
    ld   h, e
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_7307D
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_730C4
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, $2E
    ld   l, $FF
    ld   c, a
    ld   l, b
    inc  l

label_7306C::
    jr   nz, label_730E7
    ld   l, a
    ld   [hl], l
    jr   nz, label_730D4
    ld   [hl], d
    ld   l, a

label_73074::
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_730E7
    ld   h, l
    jr   nz, label_730DE

label_7307D::
    jr   nz, label_730E7
    ld   l, c
    ld   h, d
    ld   l, c

label_73082::
    ld   [hl], e
    ld   h, e
    ld   [hl], l
    ld   [hl], e
    ld   hl, label_2020
    ld   c, b
    ld   l, a

label_7308B::
    ld   [hl], a

label_7308C::
    jr   nz, label_73101
    ld   [hl], a
    ld   h, l
    ld   h, l
    ld   [hl], h
    ld   hl, label_71720
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, e
    ld   h, l
    jr   nz, label_73119

label_730A0::
    ld   l, a
    ld   [hl], l
    jr   nz, label_73105
    ld   [hl], d
    ld   h, l
    jr   nz, label_730C8
    jr   nz, label_7311D

label_730AA::
    ld   [hl], l
    ld   h, e
    ld   l, b
    jr   nz, label_73110

label_730AF::
    jr   nz, label_73118

label_730B1::
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    ld   l, h
    ld   h, l

label_730B6::
    ld   l, l
    ld   h, c
    ld   l, [hl]
    ld   c, c

label_730BA::
    jr   nz, label_73124

label_730BC::
    ld   h, c
    halt
    jr   nz, label_73122
    jr   nz, label_73135
    ld   h, l

label_730C4::
    ld   [hl], c
    ld   [hl], l
    ld   h, l
    ld   [hl], e

label_730C8::
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    jr   nz, label_7313A
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_73141
    ld   h, [hl]
    jr   nz, label_7314E
    ld   l, a
    ld   [hl], l
    ld   l, $20
    ld   d, a
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_73158
    ld   l, a
    ld   [hl], l
    jr   nz, label_7314F
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l

label_730E7::
    ld   l, [hl]
    ccf
    jr   nz, label_7310B
    jr   nz, label_7310D
    ld   e, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_73112
    ld   c, [hl]
    ld   l, a
    cp   $49
    jr   nz, label_7316F
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_7316A
    ld   l, c
    ld   l, e
    ld   h, l

label_73101::
    jr   nz, label_7317C
    ld   l, a
    ld   [hl], l

label_73105::
    ld   [hl], h
    ld   l, a
    jr   nz, label_7317D
    ld   h, c
    ld   l, e

label_7310B::
    ld   h, l
    jr   nz, label_73182
    ld   l, b
    ld   l, c

label_73110::
    ld   [hl], e
    jr   nz, label_73133
    jr   nz, label_73135
    ld   l, h
    ld   h, l
    ld   [hl], h

label_73118::
    ld   [hl], h

label_73119::
    ld   h, l
    ld   [hl], d
    jr   nz, label_73191

label_7311D::
    ld   l, a
    jr   nz, label_73181
    jr   nz, label_7316F

label_73122::
    ld   [hl], d
    ld   l, $20
    ld   d, a
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   h, l
    jr   nz, label_731A3
    ld   l, b
    ld   l, a
    jr   nz, label_7319C
    ld   l, c
    halt

label_73133::
    ld   [hl], e
    jr   nz, label_731A5
    ld   l, [hl]
    jr   nz, label_731AD
    ld   l, b

label_7313A::
    ld   h, l
    jr   nz, label_7319F
    ld   l, a
    ld   [hl], d
    ld   h, h
    ld   h, l

label_73141::
    ld   [hl], d
    jr   nz, label_731B3
    ld   h, [hl]
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_73197
    ld   a, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l

label_7314E::
    ld   [hl], d

label_7314F::
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_73175
    ld   b, [hl]
    ld   l, a
    ld   [hl], d

label_73158::
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    inc  l
    jr   nz, label_731CE
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    ld   hl, label_2EFF
    ld   l, $2E
    ld   c, c
    ld   [hl], e

label_7316A::
    jr   nz, label_731E0
    ld   l, b
    ld   h, c
    ld   [hl], h

label_7316F::
    jr   nz, label_731E4
    ld   l, a
    ccf
    jr   nz, label_73195

label_73175::
    ld   b, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_731C3
    jr   nz, label_731F0

label_7317C::
    ld   l, b

label_7317D::
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b

label_73181::
    ld   [hl], h

label_73182::
    jr   nz, label_731A4
    jr   nz, label_731FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_73201
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_731F0
    jr   nz, label_731B1

label_73191::
    jr   nz, label_731B3
    jr   nz, label_731B5

label_73195::
    ld   h, a
    ld   h, l

label_73197::
    ld   l, [hl]
    ld   [hl], h
    ld   l, h
    ld   h, l
    ld   l, l

label_7319C::
    ld   h, c
    ld   l, [hl]
    ld   l, $2E
    ld   l, $FF
    ld   e, c

label_731A3::
    ld   l, a

label_731A4::
    ld   [hl], l

label_731A5::
    jr   nz, label_7321B
    ld   [hl], d
    ld   h, c
    ld   h, h
    ld   h, l
    ld   h, h
    jr   nz, label_73195
    jr   nz, label_73216

label_731B0::
    ld   l, a

label_731B1::
    ld   [hl], d
    ld   h, c

label_731B3::
    jr   nz, label_7321C

label_731B5::
    ld   l, a
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73228
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_731B0

label_731C3::
    ld   hl, label_2020
    ld   l, $2E
    ld   l, $47
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   [hl], h

label_731CE::
    ld   hl, $FF3F
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_73241
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    inc  l
    jr   nz, label_7324F
    ld   l, a
    ld   l, l
    ld   h, l
    dec  l

label_731E0::
    jr   nz, label_73256
    ld   l, c
    ld   l, l

label_731E4::
    ld   h, l
    ld   [hl], e
    jr   nz, label_73231
    jr   nz, label_7324D
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_73210

label_731F0::
    jr   nz, label_7325A
    ld   h, l
    ld   l, h
    ld   [hl], b
    jr   nz, label_7325C
    ld   h, c
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7325F
    jr   nz, label_73220
    jr   nz, label_73266
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_7327C
    ld   l, c
    ld   h, l
    ld   h, e
    ld   h, l

label_73210::
    jr   nz, label_73281
    ld   h, [hl]
    jr   nz, label_73285
    ld   h, c

label_73216::
    ld   [hl], b
    ld   h, l
    ld   [hl], d
    inc  l
    jr   nz, label_73281

label_7321C::
    halt
    ld   l, [hl]
    jr   nz, label_73241
    ld   l, c
    ld   h, [hl]
    jr   nz, label_7328E
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_73228::
    jr   nz, label_7328B
    jr   nz, label_73298
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_73231::
    ld   [hl], h
    ld   l, a
    jr   nz, label_732A2
    ld   a, c
    jr   nz, label_7329C
    ld   h, c
    ld   [hl], d
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_73260
    jr   nz, label_7328F
    ld   [hl], d
    ld   l, $20
    ld   d, a
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   c, b

label_7324F::
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   l, l
    ld   h, d
    ld   h, c
    ld   [hl], d

label_73256::
    ld   [hl], d
    ld   h, c
    ld   [hl], e
    ld   [hl], e

label_7325A::
    ld   l, c
    ld   l, [hl]

label_7325C::
    ld   h, a
    ld   hl, label_719FF

label_73260::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    halt
    jr   nz, label_732DA
    ld   h, c
    halt
    ld   h, h
    jr   nz, label_7328D
    jr   nz, label_7328F
    ld   b, d
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h

label_7327C::
    jr   nz, label_732DF
    jr   nz, label_732E6
    ld   h, l

label_73281::
    ld   h, c
    ld   [hl], d
    ld   [hl], e
    ld   l, a

label_73285::
    ld   l, l
    ld   h, l
    jr   nz, label_732EB
    ld   h, l
    ld   h, c

label_7328B::
    ld   [hl], e
    ld   [hl], h

label_7328D::
    ld   hl, label_717FF
    ld   l, a
    ld   [hl], a
    ld   hl, label_71420
    ld   l, b
    ld   h, l
    jr   nz, label_732EB
    ld   l, a
    ld   l, a
    ld   [hl], e

label_7329C::
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, b
    ld   h, c
    ld   [hl], e

label_732A2::
    jr   nz, label_73316
    ld   h, l
    ld   h, e
    ld   l, a
    halt
    ld   [hl], d
    ld   h, l
    ld   h, h
    ld   hl, label_2020
    ld   c, b
    ld   h, l
    jr   nz, label_73326
    ld   h, l
    ld   h, l
    ld   l, l
    ld   [hl], e
    jr   nz, label_7332F
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_732DE
    jr   nz, label_73326
    ld   [hl], d
    ld   l, c
    ld   h, l
    ld   l, [hl]
    ld   h, h
    ld   l, h
    ld   a, c
    ld   hl, label_71EFF
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_70220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_72159
    inc  l
    jr   nz, label_73347

label_732DE::
    ld   [hl], h

label_732DF::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73338
    ld   l, h
    ld   [hl], d
    ld   l, c

label_732E6::
    ld   [hl], d
    ld   h, c
    ld   hl, label_7394D

label_732EB::
    jr   nz, label_73364
    ld   l, c
    ld   h, [hl]
    ld   h, l
    jr   nz, label_73369
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_7336B
    ld   l, a
    jr   nz, label_7336E
    ld   l, b
    ld   h, l
    jr   nz, label_7333F
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_73325
    jr   nz, label_73327
    jr   nz, label_73329
    ld   d, [hl]
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_73373
    ld   l, [hl]
    ld   h, h
    jr   nz, label_73382

label_73316::
    ld   h, l
    ld   h, [hl]
    ld   [hl], h
    ld   l, l
    ld   h, l
    jr   nz, label_7337E
    ld   l, h
    ld   l, h
    jr   nz, label_73382
    ld   l, h
    ld   l, a
    ld   l, [hl]
    ld   h, l

label_73325::
    ld   l, $20

label_73327::
    jr   nz, label_73349

label_73329::
    ld   b, e
    ld   h, c
    ld   l, [hl]
    jr   nz, label_733A7
    ld   l, a

label_7332F::
    ld   [hl], l
    jr   nz, label_733A6
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_73357
    jr   nz, label_73359
    ld   l, b
    ld   h, l
    ld   [hl], d
    jr   nz, label_733B2
    ld   l, a

label_7333F::
    jr   nz, label_733A4
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_733AE
    ld   l, a

label_73347::
    ld   l, l
    ld   h, l

label_73349::
    ld   h, c
    ld   [hl], e
    jr   nz, label_733C0
    ld   l, a
    ld   l, a
    ld   l, [hl]
    jr   nz, label_733B3
    ld   [hl], e
    jr   nz, label_733C8
    ld   l, b
    ld   h, l

label_73357::
    jr   nz, label_73379

label_73359::
    ld   l, c
    ld   [hl], e
    jr   nz, label_733C1
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_73382
    jr   nz, label_73384

label_73364::
    jr   nz, label_73386
    jr   nz, label_73388
    jr   nz, label_733CD
    ld   l, h

label_7336B::
    ld   h, l
    ld   h, c
    ld   l, [hl]

label_7336E::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ccf
    jr   nz, label_73394
    jr   nz, label_73396
    jr   nz, label_73398
    jr   nz, label_733BC
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    jr   nz, label_733A1
    jr   nz, label_733A3
    jr   nz, label_733A5
    jr   nz, label_733A7
    jr   nz, label_733A9
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   b, a
    ld   [hl], d
    ld   h, c

label_73394::
    ld   l, [hl]
    ld   h, h

label_73396::
    ld   l, l
    ld   h, c

label_73398::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_7340A
    ld   l, a
    ld   [hl], h
    jr   nz, label_733C0
    jr   nz, label_7340A
    ld   h, l

label_733A3::
    ld   [hl], d

label_733A4::
    ld   h, l

label_733A5::
    ld   l, $20

label_733A7::
    ld   d, e
    ld   l, b

label_733A9::
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73417

label_733AE::
    ld   l, [hl]
    jr   nz, label_733D1
    ld   [hl], h

label_733B2::
    ld   l, b

label_733B3::
    ld   h, l
    jr   nz, label_733F7
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_733DD
    jr   nz, label_733DF
    jr   nz, label_733E1

label_733C1::
    ld   d, [hl]
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l

label_733C8::
    ld   l, $20
    ld   d, h
    ld   l, b
    ld   h, c

label_733CD::
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73449
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_7341E
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   [hl], b
    ld   h, c

label_733DD::
    jr   nz, label_733FF

label_733DF::
    jr   nz, label_73401

label_733E1::
    ld   d, l
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    jr   nz, label_7345C
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_7345D
    ld   l, [hl]
    jr   nz, label_73411
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_73466
    ld   l, b

label_733F7::
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   hl, label_719FF
    ld   h, l
    ld   [hl], b

label_733FF::
    inc  l
    jr   nz, label_73452
    ld   h, c
    ld   [hl], b
    ld   h, c
    ld   l, b
    ld   l, h
    jr   nz, label_73470
    ld   l, a

label_7340A::
    ld   [hl], h
    jr   nz, label_73479
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    inc  l

label_73411::
    jr   nz, label_7347D
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_73484
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_73485
    ld   h, l

label_7341E::
    jr   nz, label_73493
    ld   h, c
    ld   l, c
    ld   h, h
    ld   hl, label_2020
    ld   c, [hl]
    ld   l, a
    ld   [hl], a
    inc  l
    jr   nz, label_73475
    ld   h, c
    ld   l, l
    jr   nz, label_734A3
    ld   l, a
    jr   nz, label_73499
    ld   h, c
    ld   l, l
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   h, l
    ld   h, h
    jr   nz, label_73485
    ld   h, e
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_734B0
    ld   l, a
    halt
    ld   hl, label_2020

label_73449::
    ld   b, e
    ld   h, c
    ld   l, [hl]
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_734B8
    ld   l, c

label_73452::
    halt
    jr   nz, label_734C3
    ld   h, l
    jr   nz, label_734CC
    ld   l, a
    ld   l, l
    ld   h, l

label_7345C::
    halt
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    ld   [hl], e
    ccf
    jr   nz, label_73486

label_73466::
    jr   nz, label_73488
    jr   nz, label_7348A
    jr   nz, label_7348C
    jr   nz, label_7348E
    jr   nz, label_73490

label_73470::
    ld   e, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_73495

label_73475::
    ld   c, [hl]
    ld   l, a
    ld   [hl], b
    ld   h, l

label_73479::
    cp   $59
    ld   l, a
    ld   [hl], l

label_7347D::
    ld   e, [hl]
    ld   [hl], d
    ld   h, l

label_73480::
    jr   nz, label_734F1
    ld   l, [hl]
    ld   h, l

label_73484::
    jr   nz, label_734E9

label_73486::
    ld   l, a
    ld   l, h

label_73488::
    ld   h, h
    jr   nz, label_734F3
    ld   l, a

label_7348C::
    ld   l, l
    ld   h, d

label_7348E::
    ld   [hl], d
    ld   h, l

label_73490::
    ld   l, $2E
    ld   l, $FF
    ld   d, h

label_73495::
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_73480
    jr   nz, label_73505
    ld   [hl], e
    jr   nz, label_73512
    ld   l, a
    jr   nz, label_734C2
    jr   nz, label_734C4
    ld   h, h
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   hl, label_2020

label_734B0::
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_7351C
    ld   l, a
    ld   l, c
    ld   l, [hl]

label_734B8::
    ld   h, a
    jr   nz, label_7352F
    ld   l, a
    jr   nz, label_73523
    ld   h, c
    ld   [hl], h
    jr   nz, label_73536

label_734C2::
    ld   l, b

label_734C3::
    ld   h, l

label_734C4::
    and  $20
    ld   [hl], d
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_7353B
    ld   l, a
    ld   [hl], a
    ld   hl, label_2020
    jr   nz, label_734F4
    jr   nz, label_73518
    ld   l, a
    ld   l, [hl]
    jr   nz, label_7351B
    ld   [hl], b
    ld   [hl], b
    ld   h, l
    ld   [hl], h
    ld   l, c
    ld   [hl], h
    ld   hl, label_701FF
    ld   c, b
    ld   hl, label_2020
    ld   d, h
    ld   l, b

label_734E9::
    ld   l, c
    ld   [hl], e
    jr   nz, label_73556
    ld   [hl], e
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h

label_734F1::
    jr   nz, label_73560

label_734F3::
    ld   h, l

label_734F4::
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_7356D
    ld   l, a
    jr   nz, label_7355E
    ld   h, l
    jr   nz, label_73560
    jr   nz, label_73521
    jr   nz, label_73575
    ld   h, l

label_73504::
    ld   [hl], a

label_73505::
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_73556
    ld   h, l
    ld   [hl], d
    ld   h, l
    inc  l

label_73512::
    ld   [hl], h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_7358C

label_73518::
    ld   l, b
    ld   l, c
    ld   [hl], e

label_7351B::
    jr   nz, label_73504
    ld   hl, label_2020
    jr   nz, label_73542
    ld   c, c

label_73523::
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73589
    jr   nz, label_73592
    ld   l, c
    ld   h, d
    ld   l, c
    ld   [hl], e
    ld   h, e

label_7352F::
    ld   [hl], l
    ld   [hl], e
    ld   hl, label_719FF
    ld   l, a
    ld   [hl], l

label_73536::
    jr   nz, label_735AC
    ld   [hl], d
    ld   h, c
    ld   h, h

label_7353B::
    ld   h, l
    ld   h, h
    jr   nz, label_735B3
    ld   l, b
    ld   h, l
    jr   nz, label_73529
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_735BC
    ld   l, b
    ld   h, l
    jr   nz, label_73533
    ld   hl, label_704FF
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l

label_73556::
    ld   [hl], e
    ld   hl, label_2020
    ld   e, c
    ld   [hl], l
    ld   l, l
    ld   hl, label_71E49

label_73560::
    ld   l, l
    jr   nz, label_735C9
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, l
    ld   h, h
    jr   nz, label_735E1
    ld   l, c
    ld   [hl], h
    ld   l, b

label_7356D::
    jr   nz, label_735D4
    ld   l, [hl]
    ld   h, l
    ld   [hl], d
    ld   h, a
    ld   a, c
    inc  l

label_73575::
    jr   nz, label_735E5
    ld   l, a
    ld   [hl], a
    ld   hl, label_709FF
    ld   e, [hl]
    halt
    jr   nz, label_735E8
    ld   l, a
    ld   [hl], h
    jr   nz, label_735F9
    ld   l, a
    jr   nz, label_735FB
    ld   h, c

label_73589::
    ld   a, c
    inc  l
    ld   [hl], h

label_7358C::
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    ld   [hl], e
    jr   nz, label_735F4
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   hl, label_719FF
    ld   h, l
    ld   [hl], b
    inc  l
    jr   nz, label_735EF
    ld   h, c
    ld   [hl], b
    ld   h, c
    ld   l, b
    ld   l, h
    jr   nz, label_7360D
    ld   l, a
    ld   [hl], h
    jr   nz, label_73616
    ld   l, a
    ld   [hl], e

label_735AC::
    ld   [hl], h
    inc  l
    jr   nz, label_7361A
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_735B3::
    jr   nz, label_73621
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_73622
    ld   h, l
    jr   nz, label_73630
    ld   h, c
    ld   l, c
    ld   h, h
    ld   hl, label_2020
    ld   c, [hl]
    ld   l, a
    ld   [hl], a
    inc  l
    jr   nz, label_73612

label_735C9::
    ld   h, c
    ld   l, l
    jr   nz, label_73640
    ld   l, a
    jr   nz, label_73636
    ld   h, c
    ld   l, l
    ld   l, c
    ld   [hl], e

label_735D4::
    ld   l, b
    ld   h, l
    ld   h, h
    jr   nz, label_73622
    ld   h, e
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_7364D
    ld   l, a

label_735E1::
    halt
    ld   hl, label_2020
    ld   b, e
    ld   h, c

label_735E8::
    ld   l, [hl]
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_73655
    ld   l, c

label_735EF::
    halt
    jr   nz, label_73660
    ld   h, l

label_735F4::
    jr   nz, label_73669
    ld   l, a
    ld   l, l
    ld   h, l

label_735F9::
    halt

label_735FB::
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    ld   [hl], e
    ccf
    jr   nz, label_73623
    jr   nz, label_73625
    jr   nz, label_73627
    jr   nz, label_73629
    jr   nz, label_7362B
    jr   nz, label_7362D

label_7360D::
    ld   c, [hl]
    ld   l, a
    ld   [hl], b
    ld   h, l
    jr   nz, label_73656
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]

label_73616::
    ld   [hl], h
    cp   $53
    ld   l, b

label_7361A::
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73687
    ld   h, c
    ld   h, h

label_73621::
    jr   nz, label_73684

label_73623::
    ld   l, [hl]
    jr   nz, label_73646
    jr   nz, label_73648
    ld   h, c

label_73629::
    ld   [hl], a
    ld   h, [hl]

label_7362B::
    ld   [hl], l
    ld   l, h

label_7362D::
    jr   nz, label_736A3
    ld   [hl], d

label_73630::
    ld   h, c
    ld   h, a
    ld   h, l
    ld   h, h
    ld   a, c
    jr   nz, label_73657
    jr   nz, label_736A2
    ld   l, [hl]
    jr   nz, label_736B0
    ld   l, b
    ld   h, l
    jr   nz, label_736A8

label_73640::
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_73666

label_73646::
    jr   nz, label_73668

label_73648::
    ld   h, c
    ld   h, e
    ld   [hl], d
    ld   l, a
    ld   [hl], e

label_7364D::
    ld   [hl], e
    jr   nz, label_736C4
    ld   l, b
    ld   h, l
    jr   nz, label_736CB
    ld   h, c

label_73655::
    ld   a, c

label_73656::
    ld   hl, label_70920
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_736C8
    ld   [hl], l
    ld   [hl], e

label_73660::
    ld   [hl], h
    jr   nz, label_736C4
    ld   [hl], a
    ld   h, [hl]
    ld   [hl], l

label_73666::
    ld   l, h
    inc  l

label_73668::
    ld   h, c

label_73669::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_736CE
    ld   l, h
    ld   l, h
    jr   nz, label_736BA
    jr   nz, label_736D6
    ld   h, c
    ld   l, [hl]
    jr   nz, label_736DB
    ld   l, a
    ld   l, c
    ld   [hl], e
    jr   nz, label_736EF
    ld   [hl], a
    ld   h, l
    ld   h, l
    ld   [hl], b
    ld   hl, label_709FF
    jr   nz, label_736E6
    ld   l, l
    jr   nz, label_736FC
    ld   l, b
    ld   h, l
    jr   nz, label_736FF
    ld   [hl], b
    ld   l, c
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    jr   nz, label_73702
    ld   h, [hl]
    jr   nz, label_7370A
    ld   l, b
    ld   h, l
    jr   nz, label_73707
    ld   h, c
    ld   l, [hl]
    ld   [hl], e
    ld   l, c
    ld   l, a
    ld   l, [hl]
    ld   l, $20

label_736A2::
    ld   c, c

label_736A3::
    jr   nz, label_7370D
    ld   h, c
    halt

label_736A8::
    jr   nz, label_7370C
    ld   h, l
    ld   h, l
    ld   l, [hl]
    jr   nz, label_736CF
    jr   nz, label_736D1
    jr   nz, label_7372A
    ld   h, c
    ld   l, c
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_73721
    ld   l, a
    ld   [hl], d
    jr   nz, label_736DF
    jr   nz, label_736E1
    jr   nz, label_73736
    ld   l, a

label_736C4::
    ld   l, l
    ld   h, l
    ld   l, a
    ld   l, [hl]

label_736C8::
    ld   h, l
    jr   nz, label_7373F

label_736CB::
    ld   l, a
    jr   nz, label_736EE

label_736CE::
    jr   nz, label_736F0
    jr   nz, label_736F2
    ld   l, a
    halt
    ld   [hl], d

label_736D6::
    ld   h, e
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_73750
    ld   l, b
    ld   h, l
    jr   nz, label_73700
    jr   nz, label_73702
    ld   h, h
    ld   h, c
    ld   [hl], d
    ld   l, e

label_736E6::
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   l, $20
    ld   b, [hl]
    ld   l, c

label_736EE::
    ld   l, [hl]

label_736EF::
    ld   h, h

label_736F0::
    jr   nz, label_73712

label_736F2::
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_7376B
    ld   l, b
    ld   h, l
    jr   nz, label_7376E
    ld   h, l

label_736FC::
    ld   h, e
    ld   [hl], d
    ld   h, l

label_736FF::
    ld   [hl], h

label_73700::
    jr   nz, label_73722

label_73702::
    ld   [hl], e
    ld   l, b
    ld   h, l
    ld   l, h
    ld   l, h

label_73707::
    ld   [hl], e
    jr   nz, label_7376B

label_7370A::
    ld   l, [hl]
    ld   h, h

label_7370C::
    jr   nz, label_73775
    ld   l, a
    jr   nz, label_73731
    jr   nz, label_73787
    ld   l, b
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    jr   nz, label_7378F
    ld   l, b
    ld   h, l
    jr   nz, label_7373F
    jr   nz, label_73741

label_73721::
    jr   nz, label_7378A
    ld   h, c
    ld   [hl], h
    ld   h, l
    jr   nz, label_7379C
    ld   l, a
    jr   nz, label_7379D
    ld   h, l
    ld   h, e
    ld   h, l
    ld   l, c
    halt

label_73731::
    jr   nz, label_737A7
    ld   l, b
    ld   h, l
    jr   nz, label_737AC
    ld   l, h
    ld   [hl], h
    ld   l, c
    ld   l, l
    ld   h, c
    ld   [hl], h
    ld   h, l
    jr   nz, label_73760
    jr   nz, label_73762
    ld   [hl], e
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   h, h
    ld   hl, label_708FF
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, $20
    ld   c, [hl]

label_73750::
    ld   l, a
    jr   nz, label_73773
    jr   nz, label_73775
    jr   nz, label_73777
    jr   nz, label_73779
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], b
    ld   l, a
    ld   l, [hl]
    ld   [hl], e

label_73760::
    ld   h, l
    ld   l, $20
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_73788
    jr   nz, label_737D7
    ld   [hl], l

label_7376B::
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_737DD
    ld   l, a
    ld   [hl], h
    jr   nz, label_737DB

label_73773::
    ld   h, c
    halt
    jr   nz, label_73798
    jr   nz, label_737DF
    ld   l, [hl]
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    jr   nz, label_737F4
    ld   l, b
    ld   h, l
    ld   l, h
    ld   l, h
    ld   [hl], e
    ld   l, $FF

label_73788::
    ld   c, l
    ld   a, c

label_7378A::
    jr   nz, label_737F6
    ld   l, a
    ld   h, d
    jr   nz, label_737F8
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_737B5
    jr   nz, label_737B7
    jr   nz, label_73802
    ld   [hl], e
    jr   nz, label_73802

label_7379C::
    ld   l, c

label_7379D::
    ld   l, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   h, l
    ld   h, h
    ld   l, $FF
    ld   c, b
    ld   h, l

label_737A7::
    ld   a, c
    jr   nz, label_73823
    ld   l, a
    ld   [hl], l

label_737AC::
    ld   hl, label_70820
    ld   h, c
    halt
    jr   nz, label_737D4
    jr   nz, label_7382F
    ld   l, a

label_737B7::
    ld   [hl], l
    jr   nz, label_7381C
    ld   h, l
    ld   h, l
    ld   l, [hl]
    jr   nz, label_73833
    ld   l, a
    jr   nz, label_73836
    ld   l, b
    ld   h, l
    jr   nz, label_73809
    ld   h, c
    ld   l, l
    ld   h, l
    ld   [hl], d
    ld   h, c
    jr   nz, label_73820
    ld   l, b
    ld   l, a
    ld   [hl], b
    jr   nz, label_7383B
    ld   l, [hl]
    jr   nz, label_737F5
    ld   d, h
    ld   h, c

label_737D7::
    ld   l, h
    jr   nz, label_7382E
    ld   h, c

label_737DB::
    ld   l, h
    jr   nz, label_73826
    ld   h, l

label_737DF::
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   [hl], e
    ccf
    ld   c, c
    ld   a, c
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7385D
    ld   h, l
    ld   l, a
    ld   [hl], b
    ld   l, h
    ld   h, l
    jr   nz, label_73814

label_737F4::
    jr   nz, label_73816

label_737F6::
    ld   l, h
    ld   l, c

label_737F8::
    ld   l, e
    ld   h, l
    jr   nz, label_73870
    ld   l, a
    jr   nz, label_73866
    ld   l, a
    jr   nz, label_73876

label_73802::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, [hl]
    ld   h, h

label_73809::
    jr   nz, label_7387F
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_73830
    jr   nz, label_73832
    jr   nz, label_73834

label_73814::
    jr   nz, label_73836

label_73816::
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d

label_7381C::
    ld   h, l
    ld   [hl], e
    jr   nz, label_7388F

label_73820::
    ld   h, [hl]
    jr   nz, label_73843

label_73823::
    jr   nz, label_73845
    jr   nz, label_7389B
    ld   l, b
    ld   h, l
    ld   l, l
    ld   [hl], e
    ld   h, l
    ld   l, h
    halt

label_7382F::
    ld   [hl], e

label_73830::
    ld   l, $20

label_73832::
    jr   nz, label_73854

label_73834::
    jr   nz, label_73856

label_73836::
    ld   d, e
    ld   h, l
    ld   h, l
    ld   l, l
    ld   [hl], e

label_7383B::
    jr   nz, label_738A8
    ld   l, c
    ld   l, [hl]
    ld   h, h
    ld   h, c
    jr   nz, label_73863

label_73843::
    jr   nz, label_73865

label_73845::
    jr   nz, label_738AD
    ld   [hl], l
    ld   l, [hl]
    ld   l, [hl]
    ld   a, c
    jr   nz, label_738C1
    ld   l, a
    jr   nz, label_738BD
    ld   h, l
    ld   l, $FF
    ld   d, e

label_73854::
    ld   [hl], h
    ld   h, l

label_73856::
    ld   [hl], b
    jr   nz, label_738CB
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h

label_7385D::
    jr   nz, label_738D4
    ld   [hl], b
    jr   nz, label_73882
    jr   nz, label_738C5
    ld   l, [hl]

label_73865::
    ld   h, h

label_73866::
    jr   nz, label_738CF
    ld   h, l
    ld   [hl], h
    jr   nz, label_738E5
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_73891
    jr   nz, label_73893
    ld   [hl], e
    ld   l, a
    ld   [hl], l

label_73876::
    halt
    ld   l, [hl]
    ld   l, c
    ld   [hl], d
    jr   nz, label_738ED
    ld   l, b
    ld   l, a

label_7387F::
    ld   [hl], h
    ld   l, a
    ld   hl, label_707FF
    ld   l, a
    ld   l, a
    ld   h, h
    jr   nz, label_738F3
    ld   l, a
    ld   h, d
    ld   hl, label_2020
    jr   nz, label_738B0
    jr   nz, label_738B2
    jr   nz, label_738E9
    ld   [hl], e
    ld   h, l
    jr   nz, label_73901
    ld   [hl], h
    jr   nz, label_7390A

label_7389B::
    ld   l, [hl]
    jr   nz, label_73917
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_738C3
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   l, l
    ld   l, c

label_738A8::
    ld   h, l
    ld   [hl], e
    jr   nz, label_7390D
    ld   l, [hl]

label_738AD::
    ld   h, h
    jr   nz, label_73923

label_738B0::
    ld   h, l
    ld   h, l

label_738B2::
    jr   nz, label_7392B
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_73921
    ld   h, c
    ld   [hl], b
    ld   [hl], b
    ld   h, l

label_738BD::
    ld   l, [hl]
    ld   [hl], e
    ld   l, $20

label_738C1::
    jr   nz, label_738E3

label_738C3::
    ld   c, c
    ld   h, [hl]

label_738C5::
    jr   nz, label_73940
    ld   l, a
    ld   [hl], l
    jr   nz, label_7393D

label_738CB::
    ld   [hl], l
    ld   l, [hl]
    jr   nz, label_7393E

label_738CF::
    ld   [hl], l
    ld   [hl], h
    inc  l
    jr   nz, label_7393B

label_738D4::
    ld   l, a
    jr   nz, label_7394B
    ld   l, a
    jr   nz, label_7394E
    ld   l, b
    ld   h, l
    jr   nz, label_73944
    ld   l, a
    ld   [hl], d
    dec  l
    jr   nz, label_73903

label_738E3::
    ld   h, l
    ld   [hl], e

label_738E5::
    ld   [hl], h
    inc  l
    jr   nz, label_73959

label_738E9::
    ld   l, c
    ld   h, e
    ld   l, e
    jr   nz, label_73961
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_73913

label_738F3::
    ld   l, l
    ld   [hl], l
    ld   [hl], e
    ld   l, b
    ld   [hl], d
    ld   l, a
    ld   l, a
    ld   l, l
    ld   [hl], e
    inc  l
    jr   nz, label_73960
    ld   l, [hl]
    ld   h, h

label_73901::
    jr   nz, label_73923

label_73903::
    ld   c, c
    jr   nz, label_7397D
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_73978
    ld   h, c
    ld   l, e

label_7390D::
    ld   h, l
    jr   nz, label_73989
    ld   l, a
    ld   [hl], l
    jr   nz, label_73981
    ld   l, a
    ld   [hl], d
    ld   h, l

label_73917::
    ld   l, $FF
    ld   l, $20
    ld   l, $20
    ld   l, $20
    ld   l, $21

label_73921::
    jr   nz, label_7396C

label_73923::
    jr   nz, label_73988
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    ld   l, l
    ld   l, a

label_7392B::
    halt
    ld   hl, label_70220
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_7397D
    jr   nz, label_73997
    ld   l, l
    jr   nz, label_73959
    ld   [hl], e
    ld   [hl], h

label_7393B::
    ld   l, c
    ld   l, h

label_7393D::
    ld   l, h

label_7393E::
    jr   nz, label_739A1

label_73940::
    ld   l, h
    ld   l, h

label_73942::
    jr   nz, label_739B6

label_73944::
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, $59
    ld   l, a

label_7394B::
    ld   [hl], l
    ld   [hl], d

label_7394D::
    jr   nz, label_739BB
    ld   l, c
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_73976
    jr   nz, label_73978
    jr   nz, label_739CD
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   h, h
    jr   nz, label_739D7

label_73960::
    ld   l, a

label_73961::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_73986
    jr   nz, label_73988
    jr   nz, label_739CC
    ld   [hl], d
    ld   h, l

label_7396C::
    ld   h, c
    ld   l, e
    jr   nz, label_739E4
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_73995
    jr   nz, label_73997
    jr   nz, label_73999
    ld   h, d
    ld   l, a
    ld   [hl], h
    ld   [hl], h

label_7397D::
    ld   l, h
    ld   h, l
    ld   hl, label_70DFF
    ld   h, c
    ld   l, e
    ld   h, l
    dec  l

label_73986::
    ld   [hl], l
    ld   [hl], b

label_73988::
    ld   hl, label_70A20
    ld   h, l
    ld   [hl], a
    ld   h, l
    ld   l, h
    ld   [hl], e
    ld   hl, label_73244
    ld   h, l
    ld   [hl], e

label_73995::
    ld   [hl], e
    ld   h, l

label_73997::
    ld   [hl], e
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_73A15
    ld   h, c
    ld   l, [hl]
    ld   [hl], h

label_739A1::
    ld   l, c
    ld   [hl], h
    jr   nz, label_73A06
    ld   l, h
    ld   l, h
    ld   hl, label_2020
    ld   d, e
    ld   l, c
    ld   h, a
    ld   l, b
    ld   l, $2E
    ld   l, $41
    ld   l, [hl]
    ld   h, h
    jr   nz, label_73A29

label_739B6::
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_73A29

label_739BB::
    ld   h, l
    ld   [hl], a
    jr   nz, label_739DF
    jr   nz, label_739E1
    ld   h, c
    ld   h, e
    ld   h, e
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   l, a
    ld   [hl], d
    ld   l, c
    ld   h, l
    ld   [hl], e

label_739CC::
    jr   nz, label_739EE
    jr   nz, label_739F0
    jr   nz, label_73A49
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_73A3A
    ld   h, l
    jr   nz, label_73A49
    ld   l, c
    ld   h, e
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   c, l
    ld   h, c

label_739E4::
    ld   l, e
    ld   h, l
    dec  l
    ld   [hl], l
    ld   [hl], b
    ld   hl, label_70A20
    ld   h, l
    ld   [hl], a

label_739EE::
    ld   h, l
    ld   l, h

label_739F0::
    ld   [hl], e
    ld   hl, label_73244
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   h, l
    ld   [hl], e
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_73A76
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    ld   l, c
    ld   [hl], h
    jr   nz, label_73A67

label_73A06::
    ld   l, h
    ld   l, h
    ld   hl, label_2020
    ld   d, e
    ld   l, c
    ld   h, a
    ld   l, b
    ld   l, $2E
    ld   l, $41
    ld   l, [hl]
    ld   h, h

label_73A15::
    jr   nz, label_73A8A
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_73A8A
    ld   h, l
    ld   [hl], a
    jr   nz, label_73A40
    jr   nz, label_73A42
    ld   h, c
    ld   h, e
    ld   h, e
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   l, a

label_73A29::
    ld   [hl], d
    ld   l, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_73A4F
    jr   nz, label_73A51
    jr   nz, label_73AAA
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_73A9B
    ld   h, l

label_73A3A::
    jr   nz, label_73AAA
    ld   l, c
    ld   h, e
    ld   h, l
    ld   l, $2E
    ld   l, $4F
    ld   l, b
    ld   hl, label_71420
    ld   l, b
    ld   h, c

label_73A49::
    ld   [hl], h
    jr   nz, label_73A9E
    ld   l, c
    ld   h, d
    ld   h, d

label_73A4F::
    ld   l, a
    ld   l, [hl]

label_73A51::
    ld   hl, label_2049
    ld   l, [hl]
    ld   h, l
    ld   h, l
    ld   h, h
    jr   nz, label_73AC3
    ld   [hl], h
    ld   hl, label_2020
    ld   d, a
    ld   l, c
    ld   l, h
    ld   l, h
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_73ADB

label_73A67::
    ld   [hl], d
    ld   h, c
    ld   h, h
    ld   h, l
    jr   nz, label_73AD3
    ld   l, a
    ld   [hl], d
    jr   nz, label_73ADE
    ld   a, c
    ld   h, h
    ld   l, a
    ld   h, a
    jr   nz, label_73ADD
    ld   l, a
    ld   l, a
    ld   h, h
    ccf
    jr   nz, label_73A9D
    jr   nz, label_73A9F

label_73A7F::
    jr   nz, label_73AA1
    jr   nz, label_73AA3
    jr   nz, label_73AA5
    jr   nz, label_73AE0
    ld   h, l
    ld   [hl], e
    jr   nz, label_73AAB
    ld   c, [hl]
    ld   l, a
    ld   hl, label_719FE
    ld   l, a
    ld   [hl], l
    jr   nz, label_73AF9
    ld   a, b
    ld   h, e
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   h, l

label_73A9B::
    ld   h, h
    jr   nz, label_73A7F

label_73A9E::
    jr   nz, label_73B06
    ld   l, a

label_73AA1::
    ld   [hl], d
    jr   nz, label_73A86
    ld   hl, label_70920
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_73AAA::
    jr   nz, label_73B12
    ld   [hl], l
    ld   l, h
    ld   l, h
    ld   l, a
    ld   h, [hl]
    jr   nz, label_73B1D
    ld   [hl], l
    ld   l, c
    ld   h, e
    ld   a, c
    jr   nz, label_73B1B
    ld   h, l
    ld   h, l
    ld   h, [hl]
    ld   hl, label_70CFF
    ld   [hl], l
    ld   h, e
    ld   l, e
    ld   a, c

label_73AC3::
    ld   hl, label_2020

label_73AC6::
    ld   d, h
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    ld   [hl], e
    ld   hl, label_71720
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l

label_73AD3::
    jr   nz, label_73B3D
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73AFC
    jr   nz, label_73AFE

label_73ADE::
    ld   a, c
    ld   l, a

label_73AE0::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_73AC6
    ld   hl, label_705FF
    ld   l, b
    ccf
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_73B52
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_73B15
    jr   nz, label_73B59
    ld   h, l
    ld   l, h

label_73AF9::
    ld   l, c
    ld   h, l
    halt
    jr   nz, label_73B68
    ld   [hl], h
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l

label_73B06::
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_73B7F
    ld   l, b
    ld   h, l
    jr   nz, label_73B86
    ld   l, a
    ld   [hl], d
    ld   [hl], e

label_73B12::
    ld   [hl], h
    ld   hl, rNR42
    ld   c, c
    jr   nz, label_73B7A
    ld   l, l
    jr   nz, label_73B69
    ld   h, c

label_73B1D::
    ld   l, [hl]
    ld   h, d
    ld   l, a
    inc  l
    jr   nz, label_73B43
    jr   nz, label_73B45
    jr   nz, label_73B8A
    ld   l, b
    ld   l, c
    ld   l, h
    ld   h, h
    jr   nz, label_73B9C
    ld   h, [hl]
    jr   nz, label_73BA4
    ld   l, b
    ld   h, l
    jr   nz, label_73B87
    ld   [hl], l
    ld   l, [hl]
    ld   b, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   hl, label_2020

label_73B3D::
    ld   c, b
    ld   h, c
    halt
    jr   nz, label_73BBC

label_73B43::
    ld   l, a
    ld   [hl], l

label_73B45::
    jr   nz, label_73BAE
    ld   l, a
    ld   [hl], h
    jr   nz, label_73BAC
    ld   l, [hl]
    jr   nz, label_73B9D
    ld   h, e
    ld   h, c
    ld   [hl], d
    ld   l, c

label_73B52::
    ld   l, [hl]
    ld   h, c
    ccf
    jr   nz, label_73B77
    jr   nz, label_73B79

label_73B59::
    jr   nz, label_73BB4
    ld   h, l
    ld   [hl], e
    jr   nz, label_73B7F
    ld   c, [hl]
    ld   l, a
    cp   $56
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_73BDF

label_73B68::
    ld   h, l

label_73B69::
    ld   l, h
    ld   l, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_73B91
    jr   nz, label_73BBA
    ld   l, h
    ld   [hl], l
    ld   h, d
    jr   nz, label_73BBA
    ld   l, h

label_73B79::
    ld   [hl], l

label_73B7A::
    ld   h, d
    jr   nz, label_73BBF
    ld   l, h
    ld   l, a

label_73B7F::
    ld   l, a
    ld   [hl], b
    ld   hl, label_701FF
    ld   l, b
    ld   h, c

label_73B86::
    ld   l, b

label_73B87::
    ld   h, c
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_73BDA

label_73B91::
    jr   nz, label_73BB3
    ld   h, e
    ld   h, c
    ld   l, [hl]
    jr   nz, label_73C0C
    ld   h, l
    ld   h, c
    ld   h, e
    ld   l, b

label_73B9C::
    jr   nz, label_73C17
    ld   l, a
    ld   [hl], l
    jr   nz, label_73C0F
    ld   a, c
    ld   [hl], e

label_73BA4::
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   hl, label_70220
    ld   l, h
    ld   l, a

label_73BAC::
    ld   l, a
    ld   [hl], b

label_73BAE::
    ld   hl, label_719FF
    ld   l, a
    ld   [hl], l

label_73BB3::
    ld   e, [hl]

label_73BB4::
    halt
    jr   nz, label_73C24
    ld   h, l
    ld   h, c

label_73BBA::
    ld   [hl], d
    ld   l, [hl]

label_73BBC::
    ld   h, l
    ld   h, h
    jr   nz, label_73BE0
    ld   c, l
    ld   h, c
    ld   l, [hl]
    ld   h, d
    ld   l, a
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73C16
    ld   h, c
    ld   l, l
    ld   h, d
    ld   l, a
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_73C4F
    ld   l, a
    ld   [hl], l
    jr   nz, label_73C41

label_73BDA::
    ld   h, l
    ld   [hl], h
    jr   nz, label_73C4D
    ld   [hl], l

label_73BDF::
    ld   [hl], h

label_73BE0::
    ld   l, a
    ld   h, [hl]
    jr   nz, label_73C58
    ld   l, b
    ld   h, l
    jr   nz, label_73C5F
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    inc  l
    jr   nz, label_73C0F
    jr   nz, label_73C61
    ld   l, h
    ld   h, c
    ld   a, c
    jr   nz, label_73C5F
    ld   [hl], h
    ld   hl, label_709FF
    jr   nz, label_73C5D
    ld   l, l
    jr   nz, label_73C4C
    ld   h, c
    ld   l, [hl]
    ld   h, d
    ld   l, a
    inc  l
    jr   nz, label_73C26
    jr   nz, label_73C28
    jr   nz, label_73C6D
    ld   l, b
    ld   l, c

label_73C0C::
    ld   l, h
    ld   h, h
    jr   nz, label_73C7F
    ld   h, [hl]
    jr   nz, label_73C87
    ld   l, b
    ld   h, l
    jr   nz, label_73C6A

label_73C17::
    ld   [hl], l
    ld   l, [hl]
    ld   b, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, l
    ld   l, [hl]

label_73C24::
    jr   nz, label_73C9F

label_73C26::
    ld   l, a
    ld   [hl], l

label_73C28::
    jr   nz, label_73C9A
    ld   l, h
    ld   h, c
    ld   a, c
    jr   nz, label_73C9C
    ld   a, c
    jr   nz, label_73C7F
    ld   h, c
    ld   l, l
    ld   h, d
    ld   l, a
    inc  l
    jr   nz, label_73C59
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_73CA1
    ld   h, c
    ld   l, [hl]
    jr   nz, label_73CB9
    ld   h, c
    ld   [hl], d
    ld   [hl], b
    jr   nz, label_73CBB
    ld   l, a
    jr   nz, label_73C97
    ld   h, c
    ld   l, [hl]

label_73C4C::
    ld   h, d

label_73C4D::
    ld   l, a
    jr   nz, label_73CA0
    ld   l, a
    ld   l, [hl]
    ld   h, h
    ld   hl, label_2020
    ld   d, h
    ld   [hl], d

label_73C58::
    ld   a, c

label_73C59::
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e

label_73C5D::
    jr   nz, label_73CD3

label_73C5F::
    ld   [hl], l
    ld   l, [hl]

label_73C61::
    ld   h, l
    jr   nz, label_73CCD
    ld   l, [hl]
    jr   nz, label_73CDB
    ld   l, b
    ld   h, l
    ld   h, h

label_73C6A::
    ld   [hl], l
    ld   l, [hl]
    ld   h, a

label_73C6D::
    ld   h, l
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    inc  l
    jr   nz, label_73CE8
    ld   l, a
    ld   l, a
    ld   hl, label_2020
    ld   b, e
    ld   l, b
    ld   h, c
    dec  l
    ld   h, e
    ld   l, b

label_73C7F::
    ld   h, c
    dec  l
    ld   h, e
    ld   l, b
    ld   h, c
    ld   hl, label_701FF

label_73C87::
    ld   l, b
    ld   h, c
    ld   l, $2E
    ld   l, $20
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_73CF6
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    ld   l, b

label_73C97::
    ld   h, c
    halt

label_73C9A::
    jr   nz, label_73CFD

label_73C9C::
    ld   l, [hl]
    jr   nz, label_73CEE

label_73C9F::
    ld   h, e

label_73CA0::
    ld   h, c

label_73CA1::
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   h, c
    inc  l
    ld   [hl], e
    ld   l, a
    ld   l, $2E
    ld   l, $47
    ld   l, h
    ld   [hl], l
    ld   h, d
    jr   nz, label_73D18
    ld   l, h
    ld   [hl], l
    ld   h, d
    ld   hl, label_703FF
    ld   l, b
    ld   l, c

label_73CB9::
    ld   h, e
    ld   l, e

label_73CBB::
    ld   h, l
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_73D34
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   h, l
    jr   nz, label_73CE6
    ld   h, h
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_73D30
    ld   l, a

label_73CCD::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_73D3A
    ld   h, c

label_73CD3::
    halt
    jr   nz, label_73D4B
    ld   l, b
    ld   h, l
    jr   nz, label_73D41

label_73CDB::
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_73D04
    jr   nz, label_73D06

label_73CE6::
    ld   [hl], e
    ld   [hl], b

label_73CE8::
    ld   l, c
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    jr   nz, label_73D62

label_73CEE::
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_73D68
    ld   [hl], e
    ld   h, l
    ld   h, h

label_73CF6::
    ld   [hl], h
    ld   l, a
    ld   hl, label_2020
    ld   c, c
    ld   l, [hl]

label_73CFD::
    jr   nz, label_73D73
    ld   l, b
    ld   h, l
    jr   nz, label_73D72
    ld   l, h

label_73D04::
    ld   h, h
    jr   nz, label_73D6B
    ld   h, c
    ld   a, c
    ld   [hl], e
    inc  l
    jr   nz, label_73D81
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_73D75
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    ld   h, [hl]
    ld   l, h

label_73D18::
    ld   a, c
    inc  l
    jr   nz, label_73D82
    ld   l, h
    ld   h, c
    ld   [hl], b
    jr   nz, label_73D87
    ld   l, h
    ld   h, c
    ld   [hl], b
    ld   hl, label_70220
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_73D99
    ld   l, a
    ld   [hl], a
    inc  l
    jr   nz, label_73DA3

label_73D30::
    ld   h, l
    ld   h, l
    ccf
    jr   nz, label_73D55
    jr   nz, label_73D7A
    ld   l, h
    ld   [hl], l
    ld   h, e

label_73D3A::
    ld   l, e
    jr   nz, label_73DA0
    ld   l, h
    ld   [hl], l
    ld   h, e
    ld   l, e

label_73D41::
    ld   hl, label_717FF
    ld   l, a
    ld   [hl], a
    ld   hl, label_2020
    ld   b, c
    ld   l, l

label_73D4B::
    ld   h, c
    ld   a, d
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_2020
    ld   d, h
    ld   l, b

label_73D55::
    ld   h, c
    ld   [hl], h
    jr   nz, label_73DCB
    ld   l, a
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_73DCA
    ld   [hl], e

label_73D62::
    jr   nz, label_73DC5
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   h, c

label_73D68::
    ld   l, h
    ld   l, h
    ld   a, c

label_73D6B::
    jr   nz, label_73DD3
    ld   l, h
    ld   a, c
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_73D72::
    ld   hl, label_73449

label_73D75::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_73DE3
    ld   [hl], l

label_73D7A::
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_73DEA
    ld   l, c
    ld   l, e
    ld   h, l

label_73D81::
    jr   nz, label_73DCC
    ld   [hl], e
    ld   h, c
    ld   l, c
    ld   h, h

label_73D87::
    inc  l
    jr   nz, label_73DEF
    ld   l, b
    ccf
    jr   nz, label_73DAE
    ld   c, b
    ld   h, c
    halt
    jr   nz, label_73E0D
    ld   l, a
    ld   [hl], l
    jr   nz, label_73E0C
    ld   [hl], d

label_73D99::
    ld   l, c
    ld   h, l
    ld   h, h
    jr   nz, label_73E12
    ld   l, a
    jr   nz, label_73DC1
    jr   nz, label_73DC3

label_73DA3::
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, h
    jr   nz, label_73E11
    ld   l, c
    ld   l, l
    jr   nz, label_73E1C
    halt
    ld   [hl], d
    jr   nz, label_73DD2
    jr   nz, label_73E2D
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_73E21
    ld   h, l
    ld   h, c
    ld   h, h
    ccf
    jr   nz, label_73E02
    ld   l, h
    ld   [hl], l

label_73DC1::
    ld   h, e
    ld   l, e

label_73DC3::
    ld   b, e
    ld   l, h

label_73DC5::
    ld   [hl], l
    ld   h, e
    ld   l, e
    ld   hl, label_717FF

label_73DCB::
    ld   l, a

label_73DCC::
    ld   l, a
    ld   l, a
    ld   hl, label_2020
    ld   b, [hl]

label_73DD2::
    ld   l, c

label_73DD3::
    ld   l, [hl]
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    ld   hl, label_71420
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_73E46
    ld   l, h
    ld   a, c
    ld   l, c

label_73DE3::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_73E07
    jr   nz, label_73E09
    jr   nz, label_73E5D
    ld   l, a
    ld   l, a
    ld   [hl], e
    ld   [hl], h

label_73DEF::
    ld   h, l
    ld   [hl], d
    jr   nz, label_73E5C
    ld   [hl], e
    jr   nz, label_73E6A
    ld   l, b
    ld   h, l
    jr   nz, label_73E1A
    ld   h, a
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   [hl], e
    ld   [hl], h

label_73E02::
    ld   hl, label_20FF
    ld   c, b
    ld   h, l

label_73E07::
    ld   [hl], d
    ld   h, l

label_73E09::
    jr   nz, label_73E5E
    ld   l, h

label_73E0C::
    ld   h, l

label_73E0D::
    ld   h, l
    ld   [hl], b
    ld   [hl], e
    jr   nz, label_73E66

label_73E12::
    ld   l, b
    ld   h, l
    jr   nz, label_73E5C
    ld   l, h
    ld   a, c
    ld   l, c
    ld   l, [hl]

label_73E1A::
    ld   h, a
    jr   nz, label_73E6F
    ld   l, a
    ld   l, a
    ld   [hl], e
    ld   [hl], h

label_73E21::
    ld   h, l
    ld   [hl], d
    rst  $38
    ld   c, c
    ld   a, d
    jr   nz, label_73EA2
    ld   h, c
    ld   [hl], h
    jr   nz, label_73EA6
    ld   h, l

label_73E2D::
    ld   h, l
    jr   nz, label_73E50
    jr   nz, label_73E52
    jr   nz, label_73E54
    ld   c, l
    ld   h, l
    ld   [hl], d
    ld   l, l
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_73EB0
    ld   h, e
    ld   h, c
    ld   l, h
    ld   h, l
    ccf
    jr   nz, label_73E64
    ld   c, c
    jr   nz, label_73EAA
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_73EC2
    ld   [hl], e
    ld   h, l
    jr   nz, label_73EBA
    ld   [hl], h

label_73E52::
    jr   nz, label_73E74

label_73E54::
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    ld   l, $20
    ld   c, c
    jr   nz, label_73EC4

label_73E5C::
    ld   h, c

label_73E5D::
    halt
    jr   nz, label_73ED5
    ld   l, a
    jr   nz, label_73E84

label_73E64::
    ld   [hl], a
    ld   h, l

label_73E66::
    ld   [hl], d
    ld   l, e
    jr   nz, label_73ED9

label_73E6A::
    ld   l, [hl]
    jr   nz, label_73EE7
    ld   l, c
    ld   [hl], e

label_73E6F::
    jr   nz, label_73E91
    jr   nz, label_73E93
    jr   nz, label_73ED9
    ld   [hl], d
    ld   h, c
    ld   [hl], a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, $20
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_73EA2
    jr   nz, label_73EA4

label_73E84::
    ld   [hl], e
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_73EF3
    ld   l, a
    jr   nz, label_73EF5
    ld   l, c
    ld   l, [hl]

label_73E91::
    ld   l, c
    ld   [hl], e

label_73E93::
    ld   l, b
    ld   a, d
    ld   h, l
    ld   h, l
    jr   nz, label_73F06
    ld   h, l
    ld   [hl], d
    ld   l, l
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_73EC1
    jr   nz, label_73EC3
    jr   nz, label_73F18
    ld   [hl], h

label_73EA6::
    ld   h, c
    ld   [hl], h
    ld   [hl], l
    ld   h, l

label_73EAA::
    jr   nz, label_73F12
    ld   l, a
    ld   [hl], d
    jr   nz, label_73F1D

label_73EB0::
    ld   h, l
    ld   l, $FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_73EBA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_73EC1::
    nop

label_73EC2::
    nop

label_73EC3::
    nop

label_73EC4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_73ED5::
    nop
    nop
    nop
    nop

label_73ED9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_73EE7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_73EF3::
    nop
    nop

label_73EF5::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_73F06::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_73F12::
    nop
    nop
    nop
    nop
    nop
    nop

label_73F18::
    nop
    nop
    nop
    nop
    nop

label_73F1D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
