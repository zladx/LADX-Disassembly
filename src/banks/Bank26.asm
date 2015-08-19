section "bank26",romx,bank[$1A]
    inc  bc
    inc  b
    ld   a, [$FFF5]
    db   $F2 ; Undefined instruction
    push af
    ld   bc, label_21F5

label_68009::
    push af
    call nz, label_F509
    push bc
    ld    hl, sp+$F5
    jp   nz, label_F547
    jp   nz, label_F542
    jp   label_F533
    jp   nz, label_F544
    db   $10 ; Undefined instruction
    jp   nz, label_3720

label_68021::
    ld   b, b
    ld   l, $41
    inc  a
    jp   label_3751
    ld   d, b
    ld   a, $60
    add  hl, sp
    ld   [hl], b
    ld   c, $16
    ld   a, [bc]
    call nz, label_A07
    rlca
    ld   b, h
    dec  [hl]
    ld   b, h
    cp   $03
    inc  b
    push bc
    ld   sp, hl
    push af
    call nz, label_F508
    add  a, h
    ld   a, [$FFF5]
    call nz, label_F50F
    ld   [hl], b
    push af
    ld   de, $823D
    ld   [de], a
    cpl
    inc  d
    inc  a
    add  a, e
    dec  d
    ld   a, [bc]
    add  a, e
    dec  h
    ld   a, [bc]
    dec  d
    db   $FD ; Undefined instruction
    ld   h, $5B
    jp   label_3821
    inc  h
    scf
    inc  [hl]
    inc  sp
    dec  [hl]
    inc  a
    ld   b, l
    scf
    ld   d, c
    ldd  [hl], a
    add  a, e
    ld   d, d
    inc  l
    ld   d, l
    ld   sp, label_2282
    ld   c, $82
    ldd  [hl], a
    ld   c, $83
    ld   b, d
    ld   c, $82
    ld   [hl], $0A
    ldh  [$FF0C], a
    rrca
    or   c
    adc  a, h
    ldi  [hl], a
    ld   b, a
    ld   b, h
    ld   h, e
    ld   b, h
    cp   $10
    inc  b
    add  a, [hl]
    rst  $38
    push af
    add  a, l
    nop
    push af
    call nz, label_F51F
    jp   label_69C21
    ld   b, d
    ld   e, h
    ld   d, e
    ld   e, h
    add  a, h
    ld   h, e
    ld   e, h
    ld   d, c
    ld   [hl], $52
    inc  a
    ld   h, d
    scf
    ld   [hl], d
    ld   l, $84
    ld   [hl], e
    cpl
    ld   [hl], a
    ld   c, b
    ld   a, b
    ld   c, d
    ld   a, c
    ld   c, c
    add  a, l
    ld   d, l
    dec  bc
    inc  h
    or   $E1
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    ld   d, h
    ld   b, h
    ld   l, b
    ld   b, h
    cp   $03
    inc  b
    add  a, [hl]
    rst  $38
    push af
    add  a, l
    nop
    push af
    add  a, h
    ld   [hl], b
    cpl
    ld   [hl], c
    ld   [rUNKN4], a
    ld   c, [hl]
    ld   h, h
    dec  a
    ld   h, l
    dec  [hl]
    ld   hl, label_225F
    ld   e, a

label_680D2::
    inc  hl
    ld   e, a
    ld   sp, label_3360
    ld   h, b
    ld   b, c
    jr   nz, label_6811E
    jr   nz, label_6812F
    jr   nz, label_68111
    ldh  [$FF0C], a
    pop  hl
    inc  de
    xor  d
    ld   d, b
    ld   a, h
    ld   d, b
    dec  bc
    jp   nz, label_B51
    ld   h, $44
    ld   b, b
    ld   b, h
    ld   d, h
    ld   b, h
    ld   h, a
    ld   b, h
    jp   nz, label_F549
    cp   $03
    inc  b
    rst  $38
    push af
    add  a, l
    nop
    push af
    call nz, label_F515
    add  a, e
    ldi  [hl], a
    ld   e, h
    jp   nz, label_69C35
    jp   nz, label_436
    ld   [hl], $F5
    daa

label_6810C::
    ld   [hl], $28
    inc  a
    jr   c, label_6813F

label_68111::
    add  hl, sp
    cpl
    ld   c, b
    ld   a, $49
    db   $3A ; ldd  a, [hl]
    add  hl, hl
    ld   a, [bc]
    add  a, e
    ld   d, a
    ld   a, [bc]
    add  a, d
    ld   l, b

label_6811E::
    ld   a, [bc]
    ld   a, c
    ld   a, [bc]
    ld   e, b
    add  hl, sp
    ld   e, c
    pop  hl
    pop  hl
    ld   de, label_690CD
    ld   a, h
    jp   nz, label_F54F
    cp   $03

label_6812F::
    ld   a, [bc]
    adc  a, d
    nop
    inc  b
    adc  a, d
    db   $10 ; Undefined instruction
    add  a, a
    jr   nz, label_6813D
    adc  a, b
    jr   nc, label_6816B

label_6813C::
    adc  a, b

label_6813D::
    ld   b, b
    db   $3A ; ldd  a, [hl]

label_6813F::
    adc  a, b
    ld   d, b
    db   $3A ; ldd  a, [hl]
    inc  [hl]
    ld   c, b
    ld   [hl], $49
    scf
    ld   c, [hl]
    rla
    dec  a
    add  a, d
    jr   label_6817C
    daa
    jr   c, label_680D2
    ld   [hl], e
    inc  b
    add  a, d
    ld   l, b
    inc  b
    add  a, d
    ld   [hl], a
    inc  b
    ld   b, a
    ccf
    ld   d, a
    dec  sp
    add  a, [hl]
    inc  b
    inc  b
    add  a, d
    dec  d
    inc  b
    add  a, d
    jr   z, label_6819F
    add  a, d
    jr   c, label_681A2
    dec  h
    jr   nz, label_681A0

label_6816B::
    ld   c, d
    ld    hl, sp+$F5
    add  a, d
    ld   l, b
    ld   b, h
    ld   [hl], e
    ld   b, h
    jp   label_459
    jp   nz, label_F549
    add  a, e
    nop
    push af

label_6817C::
    ld   hl, $C344
    dec  [hl]
    ld   [$FFFE], a
    inc  bc
    inc  b
    add  a, a
    inc  bc
    db   $3A ; ldd  a, [hl]
    ld   [bc], a
    jr   c, label_6810C
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   c, [hl]
    add  a, d
    jr   nz, label_681CB
    add  a, d
    jr   nc, label_681CE
    ldi  [hl], a
    ccf
    ldd  [hl], a
    dec  sp
    add  a, d
    inc  de
    ld   a, [bc]
    add  a, d
    inc  hl
    ld   a, [bc]
    inc  sp

label_6819F::
    ld   a, [bc]

label_681A0::
    add  a, d
    ld   b, e

label_681A2::
    ld   a, [bc]
    add  a, l
    ld   d, b
    ld   a, [bc]
    ld   d, a
    ld   a, [bc]
    add  a, e
    ld   h, b
    ld   a, [bc]
    ld   h, l
    ld   a, [bc]
    add  a, h
    ld   [hl], b
    ld   a, [bc]
    ld   l, c
    push af
    scf
    ld   b, h
    ld   d, l
    ld   b, h
    add  a, e
    dec  d
    ld   e, h
    ld   a, [$FFF5]
    daa
    db   $E8 ; add  sp, d
    inc  [hl]
    db   $E8 ; add  sp, d
    ld   b, [hl]
    db   $E8 ; add  sp, d
    ld   c, b
    db   $E8 ; add  sp, d
    ld   d, h
    db   $E8 ; add  sp, d
    ld   h, [hl]
    db   $E8 ; add  sp, d
    jp   label_450
    jp   nz, label_F54F
    add  a, d

label_681CE::
    ld   b, c
    ld   a, [bc]
    add  a, h
    ld   [hl], $0B
    add  a, d
    ld   b, h
    dec  bc
    jp   nz, label_B64
    ld   sp, $E1BA
    ld   de, label_680F4
    ld   a, h
    cp   $03
    inc  b
    jp   nz, label_F529
    or   $F5
    ld   [$85F5], sp
    nop
    db   $3A ; ldd  a, [hl]
    dec  b
    dec  sp
    inc  h
    push af
    inc  sp
    ld   a, [bc]
    ld   [hl], $0A
    add  a, d
    ld   b, h
    ld   a, [bc]
    ld   de, label_2344
    ld   b, h
    ld   h, $44
    ldd  [hl], a
    ld   b, h
    scf
    ld   b, h
    ld   b, e
    ld   b, h
    ld   b, [hl]
    ld   b, h
    ld   d, h
    ld   b, h
    ld   d, l
    ld   b, h
    ld   h, h
    ld   b, h
    ld   h, l
    ld   b, h
    rla
    ld   e, h
    jp   nz, label_69C28
    ld   l, a
    push af
    ld   l, b
    push af
    add  a, d
    jr   nc, label_68225
    add  a, d
    ld   b, c
    dec  bc
    jp   nz, label_B52
    add  a, d
    ld   h, e
    dec  bc
    ld   [hl], h
    dec  bc

label_68225::
    ld   [hl], a
    ld   l, [hl]
    ld   [bc], a
    cp   d
    pop  hl
    rra
    di
    ld   d, b
    ld   a, h
    cp   $03
    inc  b
    add  a, h
    db   $F2 ; Undefined instruction
    push af
    jp   nz, label_F52F
    nop
    push af
    ld   a, c
    push af
    add  a, d
    ld   h, b
    push af
    ld   d, $44
    ldd  [hl], a
    ld   b, h
    ld   c, c
    ld   b, h
    ld   h, a
    ld   b, h
    inc  [hl]
    push af
    dec  [hl]
    push af
    dec  [hl]
    ld   b, l
    ld   b, l
    pop  hl
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    add  a, l
    ld   d, l
    dec  bc
    jp   nz, label_B65
    ld   [hl], a
    push af
    cp   $03
    inc  b
    ld   a, [$FFF5]
    push bc
    ld   sp, hl
    push af
    add  a, l
    ld   a, a
    push af
    scf
    call nc, label_5C5
    dec  bc
    jp   label_69C12
    inc  de
    ld   b, h
    inc  d
    ld   e, h
    jp   nz, label_69C17
    jr   nz, label_682BB
    inc  [hl]
    db   $E8 ; add  sp, d
    ld   b, c
    ld   e, h
    ld   b, e
    ld   e, h
    add  a, [hl]
    ld   d, b
    dec  bc
    ld   d, [hl]
    db   $E8 ; add  sp, d
    ld   e, b
    ld   b, h
    ld   h, c
    ld   e, h
    ld   h, e
    ld   e, h
    jp   nz, label_B64

label_6828B::
    ld   h, l
    ld   e, h
    ld   h, a
    ld   e, h
    ld   [hl], e
    inc  b
    cp   $03
    inc  b
    add  a, [hl]
    rst  $38
    push af
    call nz, label_F51F
    add  a, a
    inc  de
    inc  l
    push bc
    ld   sp, label_6B937
    dec  a
    ld   [de], a
    dec  hl
    ldi  [hl], a
    ld   sp, label_2B21
    inc  h
    ei
    dec  h
    ei
    dec  h
    jp   label_E135
    ld   b, [hl]
    call nc, label_685C4
    dec  bc
    ld   b, d
    ei
    ld   b, a
    ei
    ldh  [$FF0C], a
    db   $10 ; Undefined instruction
    ld   [$FE70], sp
    inc  bc
    inc  b
    add  a, d
    rst  $38
    push af
    add  a, d
    db   $10 ; Undefined instruction
    ld   [de], a
    dec  l
    ldi  [hl], a
    jr   c, label_682FE
    ldd  [hl], a
    add  a, d
    inc  sp
    inc  l
    jp   label_3845
    ret  z
    rlca
    jr   c, label_6829F
    ld   [$C80E], sp
    add  hl, bc
    scf
    jp   nz, label_69C43
    jp   nz, label_69C44
    add  a, h
    ld   h, c
    ld   e, h
    ld   [hl], b
    cpl
    ld   [hl], c
    ld   c, b
    ld   [hl], d
    ld   c, d
    ld   [hl], e
    ld   c, d
    ld   [hl], h
    ld   c, c
    ld   [hl], l
    ld   c, [hl]
    dec  [hl]
    dec  l
    ld   d, $44
    ld   hl, label_2444
    ld   b, h
    ld   d, b
    ld   b, h
    cp   $03
    inc  b

label_682FE::
    ret  z
    nop
    jr   c, label_6828B
    ld   bc, $853A
    ld   de, $C6B9
    ld   d, $38
    add  a, e
    rla
    db   $3A ; ldd  a, [hl]
    add  a, l
    ld   hl, $C6B3
    jr   z, label_6834B
    add  hl, hl
    db   $3A ; ldd  a, [hl]
    add  a, l
    ld   sp, $C5B3
    add  hl, sp
    ld   c, $85
    ld   b, c
    cp   c
    ld   b, d
    cp   b
    ld   b, h
    cp   b
    add  a, l
    ld   d, c
    cp   c
    ld   d, c
    or   [hl]
    ld   d, l
    or   [hl]
    add  a, l

label_6832A::
    ld   h, c
    cp   c
    ld   h, c
    or   a
    ld   h, l
    or   a
    add  a, l
    ld   [hl], c
    cpl
    ld   [hl], d
    ld   c, b
    ld   [hl], e
    ld   [rUNKN4], a
    ld   c, c
    halt

label_6833B::
    ld   [hl], $F2
    ld   b, [hl]
    di
    ld   d, [hl]
    db   $F4 ; Undefined instruction
    ld   c, b
    db   $F2 ; Undefined instruction
    ld   e, b
    di
    ld   l, b
    db   $F4 ; Undefined instruction
    daa
    ld   [hl], b
    ld   d, $DD

label_6834B::
    jr   z, label_6832A
    cp   $03
    inc  b
    ret  z
    nop
    jr   c, label_682DD
    ld   bc, $853A
    ld   de, $C6B9
    ld   d, $38
    add  a, e
    rla
    db   $3A ; ldd  a, [hl]
    add  a, $28
    jr   c, label_6838C
    db   $3A ; ldd  a, [hl]
    push bc
    add  hl, sp
    ld   c, $85
    ld   b, c
    cp   c
    ld   b, d
    cp   b
    ld   b, h
    cp   b
    add  a, l
    ld   d, c
    cp   c
    ld   d, c
    or   [hl]
    ld   d, l
    or   [hl]
    add  a, l

label_68376::
    ld   h, c
    cp   c
    ld   h, c
    or   a
    ld   h, l
    or   a
    add  a, l
    ld   [hl], c
    cpl
    ld   [hl], d
    ld   c, b
    ld   [hl], e
    ld   [rUNKN4], a
    ld   c, c
    halt
    ld   [hl], $F2
    ld   b, [hl]
    di
    ld   d, [hl]

label_6838C::
    db   $F4 ; Undefined instruction
    ld   c, b
    db   $F2 ; Undefined instruction
    ld   e, b
    di
    ld   l, b
    db   $F4 ; Undefined instruction
    daa
    ld   [hl], b
    ld   d, $DD
    jr   z, label_68376
    add  a, l
    ld   bc, $85B3
    ld   de, label_21B3
    xor  l
    ldi  [hl], a
    or   c
    inc  hl
    rst  $20
    inc  h
    xor  l
    dec  h
    or   c
    ld   sp, label_32AE

label_683AC::
    or   d
    inc  sp
    db   $E3 ; Undefined instruction
    inc  [hl]
    xor  [hl]
    dec  [hl]
    or   d
    pop  hl
    dec  b
    call nc, label_6BC50
    cp   $03
    ld   c, $8A
    nop
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, d
    jr   nz, label_683FE
    call nz, label_3722
    call nz, label_423
    call nz, label_424
    jp   nz, label_3825
    ld   b, l
    ldd  [hl], a
    add  a, h
    ld   b, [hl]
    inc  l
    ld   b, a
    ld   [$FF62], a
    inc  sp
    add  a, l
    ld   h, e
    cpl
    ld   h, h
    ld   c, b
    ld   h, l
    ld   [$FF66], a
    ld   c, c
    ld   l, b
    inc  a
    ld   a, b
    scf
    add  a, l

label_683E7::
    ld   d, l
    inc  b
    jp   nz, label_469
    ld   l, c
    ld   l, [hl]
    ldi  [hl], a
    sbc  a, $25

label_683F1::
    db   $13
    inc  de
    cp   d
    pop  hl
    rra
    xor  h
    ld   d, b
    ld   a, h
    cp   $0A
    inc  b
    adc  a, d
    nop

label_683FE::
    db   $3A ; ldd  a, [hl]
    adc  a, d
    db   $10 ; Undefined instruction
    add  a, h
    jr   nz, label_6843F
    inc  h
    scf
    jr   z, label_68412
    add  a, h
    jr   nc, label_6841A
    inc  [hl]
    inc  sp
    add  a, l
    dec  [hl]
    cpl
    ld   [hl], $48
    scf
    ld   [$FF38], a
    ld   c, c
    add  a, d

label_68418::
    ld   b, b
    inc  l

label_6841A::
    ld   b, d
    dec  l
    add  a, a
    ld   b, e
    ld   c, $52
    ldd  [hl], a
    add  a, a
    ld   d, e
    inc  l
    ld   h, b
    ld   l, [hl]
    add  a, d
    ld   h, c
    jr   nz, label_683AC
    ld   h, e
    ld   e, h
    ld   h, [hl]
    jr   nz, label_683F1
    ld   l, b
    ld   l, [hl]
    ld   [hl], c
    ld   l, [hl]

label_68433::
    ld   [hl], e
    ld   l, [hl]
    halt

label_68437::
    inc  h
    sbc  a, $FE
    ld   a, [bc]
    inc  b
    nop
    db   $3A ; ldd  a, [hl]
    ld   bc, label_103F
    pop  hl
    pop  hl
    rra
    rst  $30
    adc  a, b
    ld   h, b
    ld   de, $C53F
    jr   c, label_68484
    ret  z
    dec  b
    scf
    add  a, $06
    ld   a, [bc]
    rst  0
    rlca
    ld   a, [bc]
    ret  z
    inc  bc
    ld   c, $C8
    inc  b
    ld   c, $26
    push af
    jr   nc, label_6848E
    ld   sp, label_2134
    jr   c, label_683E7
    ld   b, b
    ld   c, $82
    ld   d, b
    inc  l
    ld   d, d
    dec  l
    push bc
    add  hl, sp
    ld   c, $28
    dec  a
    add  hl, hl
    inc  [hl]
    jp   nz, label_3809
    jp   nz, label_3E05
    add  a, d
    ld   b, $3A
    ld   [$823F], sp
    ld   d, $3A
    jr   label_684BD
    add  a, e
    ld   [bc], a

label_68484::
    jp   [hl]
    add  a, e

label_68486::
    ld   [de], a
    jp   [hl]
    jp   nz, label_E22
    jp   nz, label_3862

label_6848E::
    ld   b, a
    ld   l, a
    ld   h, c

label_68491::
    jr   nz, label_68491
    inc  bc
    inc  b
    ret  z
    nop
    ld   c, $C8
    ld   bc, $C437
    ld   [bc], a
    push af
    jp   nz, label_F5F3
    inc  b
    push af
    rlca
    push af
    push bc
    ld    hl, sp+$F5
    call nz, label_F509
    dec  h
    ld   a, [bc]
    ld   h, $5C
    jp   nz, label_A34
    ld   d, l
    call nc, label_6A6C2
    dec  bc
    ld   [hl], a
    ld   a, [bc]
    ld   h, a
    ld   b, h
    cp   $03

label_684BD::
    inc  b
    call nz, label_F50F
    ld   a, [$FFF5]
    add  a, d
    ld   [hl], b
    push af
    ld   [label_6A8F5], sp
    push af
    jp   label_F5F9
    jp   nz, label_F559
    ld   [hl], a
    push af
    ldi  [hl], a
    push af
    ld   b, l
    push af
    dec  h
    ld   b, h
    ld   d, e
    ld   b, h
    cp   $10
    inc  c
    ld   b, l
    add  a, $87
    inc  bc
    db   $3A ; ldd  a, [hl]
    add  a, e
    inc  h
    ld   e, h
    jp   label_69C33
    jp   label_69C37
    add  a, e
    ld   h, h
    ld   e, h
    ret  z
    nop
    inc  b
    push bc
    rst  $38
    push af
    ld   [bc], a
    add  hl, sp
    ret  z
    ld   bc, $C704
    add  hl, de
    inc  b
    ld   l, c
    dec  bc
    dec  [hl]
    sub  a, c
    ld   b, l
    ld   e, [hl]
    pop  hl
    rra
    db   $F4 ; Undefined instruction
    ld   e, b
    ld   [hl], b
    add  a, e
    inc  h
    ld   b, h
    jp   label_68433
    jp   label_68437
    add  a, e
    ld   h, h
    ld   b, h
    dec  h
    call c, label_10FE
    inc  b
    add  a, h
    nop
    db   $3A ; ldd  a, [hl]
    ld   bc, label_4E0
    dec  sp
    add  a, e
    inc  hl
    ld   e, h
    jp   label_69C32
    jp   label_69C36
    inc  sp
    rst  $30
    ld   b, e
    ld   b, b
    ld   b, h
    ld   b, c
    ld   b, l
    ld   b, d
    pop  hl
    ld   c, $A1
    ld   d, b
    ld   a, h
    add  a, e
    daa
    dec  bc
    push bc
    ld   de, $880B
    ld   h, b
    dec  bc
    jp   label_B37
    ld   d, $44
    add  hl, bc

label_68544::
    push af
    jp   label_F539
    cp   $03
    inc  b
    push af
    push af
    dec  [hl]
    push af
    ld   b, h
    push af
    add  a, d
    ld   d, c
    push af
    add  a, d
    ld   h, b
    push af
    add  a, e
    ld   a, a
    push af
    adc  a, d
    jr   nz, label_68568
    jp   label_69C14
    jp   nz, label_69C33
    ld   b, d
    ld   e, h
    inc  de
    call nc, label_15C2
    jr   nz, label_6857A
    push af
    jp   label_F53F
    add  a, e
    rlca
    ld   a, [bc]
    add  a, e
    rla
    ld   a, [bc]
    jr   c, label_685BB
    jp   nz, label_A39

label_6857A::
    ld   b, a
    ld   a, [bc]
    add  a, d
    ld   d, [hl]
    ld   a, [bc]
    ld   l, c
    ld   a, [bc]
    add  a, h
    halt
    cp   $03
    ld   a, [bc]
    add  a, d
    inc  b
    inc  b
    jr   label_685E8
    ldi  [hl], a
    ld   e, h
    add  a, d
    inc  hl
    inc  b
    add  a, d
    inc  sp
    inc  b
    inc  hl
    push af
    add  a, l
    ld   d, l
    dec  bc
    add  a, d
    ld   a, b
    inc  b
    ld   a, b
    push af
    add  a, d
    jr   nz, label_685AC
    add  a, d
    ld   sp, $830B
    ld   b, d
    dec  bc
    jp   nz, label_B54
    add  a, l
    ld   h, h

label_685AC::
    dec  bc
    add  a, d
    ld   e, b
    dec  bc
    add  a, d
    ld   d, b
    inc  b
    add  a, d
    ld   h, c
    inc  b
    ld   [hl], h
    inc  b
    halt
    dec  [hl]

label_685BB::
    dec  hl
    ld   [hl], $2C
    scf
    dec  l
    ld   b, l
    scf
    ld   b, [hl]
    db   $E8 ; add  sp, d

label_685C4::
    ld   b, a
    jr   c, label_6861C
    inc  sp
    ld   d, [hl]
    ld   [$FF57], a
    inc  [hl]
    add  hl, bc

label_685CD::
    inc  b
    add  hl, bc
    push af
    cp   $03

label_685D2::
    inc  b
    call nz, label_F509
    jr   c, label_685CD
    add  a, l
    ld   [hl], b
    push af
    add  a, d
    db   $10 ; Undefined instruction
    ldi  [hl], a
    ld   a, [bc]
    jp   nz, label_A30
    add  a, e
    ld   h, b
    ld   a, [bc]
    rrca
    push af

label_685E8::
    jr   label_685D2
    inc  hl
    db   $E8 ; add  sp, d
    dec  [hl]
    db   $E8 ; add  sp, d
    ld   b, c
    db   $E8 ; add  sp, d
    ld   d, [hl]
    db   $E8 ; add  sp, d
    scf
    ld   e, h
    push bc
    inc  b
    dec  bc

label_685F7::
    add  a, l
    ld   d, b
    dec  bc
    cp   $03
    inc  b
    call nz, label_F50F
    jr   nc, label_685F7
    ld   h, e
    push af
    ld   l, c
    push af
    add  a, l
    ld   [hl], b
    push af
    jp   nz, label_B04
    rlca
    dec  hl
    add  a, d
    ld   [label_172C], sp
    ld   [$E822], a
    add  a, e
    inc  h
    dec  bc
    daa
    ld   a, [$FF29]
    ld   b, h

label_6861C::
    scf
    pop  af
    ld   b, e
    db   $E8 ; add  sp, d
    ld   b, a
    ld   l, $49
    ld   c, c
    ld   d, d
    add  hl, bc
    ld   d, a
    add  hl, sp
    add  a, d
    ld   e, b
    db   $3A ; ldd  a, [hl]
    jp   nz, label_E048
    ld   h, c
    ld   l, [hl]
    ld   b, [hl]
    ld   l, [hl]
    ld   b, h
    ld   a, [label_3FE]
    inc  b
    ld   l, a
    push af
    add  a, e
    ld   [hl], l
    push af
    call nz, label_F5F9
    add  a, d
    ld   [hl], b
    push af
    add  a, e
    nop

label_68644::
    inc  l
    inc  bc
    dec  l
    ld   de, $C244
    inc  de
    jr   c, label_68662
    ld   b, h
    ld   sp, $C23D
    ldd  [hl], a
    ld   [$FF33], a
    ld   c, [hl]
    ld   b, b
    cpl
    ld   b, c
    ld   c, [hl]
    ld   b, e
    dec  sp
    ld   b, a
    ld   b, h
    ld   d, b
    db   $3A ; ldd  a, [hl]
    ld   d, c
    dec  sp
    ld   h, c

label_68662::
    ld   b, h
    daa
    call nc, label_E836
    jp   nz, label_B05
    add  a, d
    dec  h
    dec  bc
    ld   b, [hl]
    dec  bc
    add  a, l
    ld   d, d
    dec  bc
    jp   nz, label_B64
    rst  $30
    push af
    cp   $03
    inc  b
    add  a, [hl]
    rst  $38
    push af
    jp   label_F51F
    add  hl, de
    push af

label_68682::
    inc  bc
    inc  b
    push bc
    inc  b
    dec  bc
    ld   [de], a
    ld   e, h
    ld   d, $5C
    jr   label_686E9
    ld   hl, label_2344
    db   $E8 ; add  sp, d
    dec  h
    ld   e, h
    daa
    db   $E8 ; add  sp, d
    ldd  [hl], a
    ld   e, h
    ld   [hl], $5C
    scf
    ld   b, h
    jr   c, label_686F9
    ld   b, e
    db   $E8 ; add  sp, d
    ld   b, l
    ld   e, h
    ld   b, a
    db   $E8 ; add  sp, d
    ld   d, d
    ld   e, h
    add  a, [hl]
    ld   d, h
    dec  bc
    ld   h, c
    ld   b, h
    jp   nz, label_B67
    ld   [hl], l
    ld   b, h
    add  a, d
    ld   a, a
    push af
    ld   a, b
    push af
    cp   $03
    inc  b
    jp   nz, label_F5FF
    jp   nz, label_3701
    ld   hl, $8233
    ldi  [hl], a
    cpl
    inc  h
    inc  a
    inc  [hl]
    inc  sp
    dec  [hl]
    dec  [hl]
    jr   z, label_68700
    add  hl, hl
    inc  [hl]
    jp   nz, label_3809
    add  a, l
    ld   [hl], b
    push af
    dec  b
    dec  bc
    add  a, e
    dec  d
    dec  bc
    jp   label_B27
    adc  a, b
    ld   d, b
    dec  bc
    cp   $03
    inc  b
    add  a, l
    nop
    db   $3A ; ldd  a, [hl]
    dec  b
    dec  sp
    db   $10 ; Undefined instruction
    jp   label_E08
    add  a, [hl]
    inc  [hl]
    ld   c, $86
    ld   b, h
    ld   c, $C3
    ld   d, e
    ld   c, $C3
    ld   d, h
    ld   c, $C2
    rlca
    jr   c, label_686BC
    add  hl, bc
    scf
    add  hl, hl
    ld   l, $23
    dec  a

label_68700::
    inc  h
    ld   c, b
    dec  h
    ld   [rNR52], a
    ld   c, c
    daa
    inc  [hl]
    inc  sp
    jr   c, label_68744
    add  hl, sp
    ld   b, b
    ld   b, h
    ld   b, d
    dec  a
    ld   b, e
    inc  [hl]
    jp   label_3852
    ld   l, b
    ld   b, h
    ld   d, $44
    ld   l, b
    ld   b, h
    halt
    ld   [hl], b
    push af
    ld   d, l
    dec  hl
    add  a, h
    ld   d, [hl]
    inc  l
    jp   nz, label_3765
    ld   a, c
    dec  hl
    cp   $03
    inc  b
    jp   nz, label_3800
    add  a, l
    ld   bc, label_33A
    ld   [rTIMA], a
    pop  hl
    pop  hl
    rra
    ld   a, [$FF38]
    db   $10 ; Undefined instruction
    dec  sp
    jp   nz, label_3808
    call nz, label_E09
    ld   de, label_123A
    sbc  a, $20
    ld   c, [hl]
    jp   nz, label_E21
    ldi  [hl], a
    ld   l, $23

label_6874F::
    ld   c, b
    inc  h
    ld   c, d
    dec  h
    ld   c, c

label_68754::
    add  a, d
    ld   h, $2F
    jr   z, label_687A7
    jr   nc, label_68796
    ldd  [hl], a
    add  hl, sp
    add  a, l
    inc  sp
    db   $3A ; ldd  a, [hl]
    jr   c, label_6879D
    adc  a, d
    ld   b, b
    ld   c, $8A

label_68766::
    ld   d, b
    inc  l
    adc  a, d
    ld   [hl], b
    inc  l
    cp   $03
    ld   c, $C5
    ld   [$C637], sp
    add  hl, bc
    inc  b
    ld   de, $842B
    ld   [de], a
    inc  l
    ld   d, $2D
    ld   hl, label_2237
    add  a, $E1
    rra
    pop  af
    adc  a, b
    ld   h, b
    add  a, e
    inc  hl
    cp   c
    dec  h
    cp   b
    ld   h, $38
    ld   sp, label_3233
    cpl
    inc  sp
    ld   c, b
    inc  [hl]
    ld   [$FF35], a
    ld   c, c
    ld   [hl], $34
    adc  a, b
    ld   d, b
    inc  l
    ld   e, b
    ld   sp, label_6A08A
    inc  b
    adc  a, d
    ld   [hl], b
    inc  l
    add  hl, hl
    ld   l, [hl]
    ld   e, c
    ld   l, [hl]
    cp   $0A
    inc  b
    ld   bc, label_36E
    ld   l, [hl]
    ld   [$886E], sp
    ld   de, label_1420
    ld   e, h
    jp   nz, label_6AE06
    add  a, a
    jr   nz, label_68828
    jp   label_2028
    add  hl, hl
    ld   l, [hl]
    ld   sp, $836E
    inc  sp
    jr   nz, label_68747
    ld   [hl], $5C
    ld   b, h
    jr   nz, label_6874F
    ld   b, l
    ld   l, [hl]
    add  a, d
    ld   b, a

label_687CE::
    jr   nz, label_68754
    ld   d, b
    ld   l, [hl]
    ld   h, d
    ld   e, h
    add  a, h
    ld   h, e
    jr   nz, label_6883D
    ld   e, h
    ld   l, b
    jr   nz, label_68766
    ld   [hl], b
    inc  l
    cp   $0A
    inc  b
    jp   nz, label_3802
    add  a, d
    inc  bc
    ld   c, $C2
    dec  b
    scf
    ret  z
    ld   [$C838], sp
    add  hl, bc
    ld   c, $C3
    ld   de, $825C
    inc  de
    ld   c, $20
    ld   l, [hl]
    ldi  [hl], a
    ldd  [hl], a
    add  a, d
    inc  hl
    inc  l
    dec  h
    ld   sp, label_6AE32
    add  a, e
    ld   b, b
    ld   l, [hl]
    ld   b, [hl]
    ld   [hl], $47
    inc  a
    add  a, d
    ld   d, h
    jr   nz, label_687CE
    ld   d, a
    scf
    add  a, a
    ld   [hl], b
    inc  l
    ld   [hl], d
    dec  l
    ld   [hl], e
    inc  b
    ld   [hl], h
    dec  hl
    ld   [hl], a
    ld   sp, label_3FE
    inc  b
    ld   [bc], a
    push af
    ret  z
    ld   bc, $C837
    nop
    ld   c, $C2
    ld   b, $0B
    add  a, h

label_68828::
    ld   d, $0B
    ldi  [hl], a
    ld   [hl], $23
    inc  a
    add  a, e
    inc  h
    ld   e, h
    daa
    dec  a
    jr   z, label_6886A
    inc  sp
    ld   l, $34
    ld   c, b
    dec  [hl]
    ld   c, d
    ld   [hl], $49

label_6883D::
    scf
    ld   c, [hl]
    ld   b, e
    add  hl, sp
    add  a, e
    ld   b, h
    db   $3A ; ldd  a, [hl]
    ld   b, a
    dec  sp
    jp   nz, label_69C38
    jp   nz, label_6A254
    jp   nz, label_6A256
    ld   d, l
    ld   h, c
    add  a, e
    ld   h, a
    dec  bc
    ld   [hl], a
    dec  bc
    pop  hl
    ld   de, label_690A4
    ld   a, h
    ld    hl, sp+$F5
    rlca
    ld   a, [bc]
    ld   c, b
    ld   b, h
    ld   h, e
    ld   b, h
    ld   a, c
    push af
    cp   $03
    inc  b
    add  a, e
    inc  b

label_6886A::
    ld   a, [bc]
    dec  h
    ld   d, d
    dec  [hl]
    ldh  [$FF0C], a
    pop  hl
    ld   [de], a
    or   d
    ld   d, b
    ld   a, h
    add  a, d
    ld   a, [$FFF5]
    add  a, d
    rst  $30
    push af
    db   $10 ; Undefined instruction
    call nz, label_B11
    add  a, d
    ld   b, d
    dec  bc
    add  a, d
    ld   h, b
    dec  bc
    adc  a, c
    ld   [hl], c
    dec  bc
    add  a, d
    ld   [hl], $0A
    add  a, d
    ld   [hl], $0A
    add  a, h
    ld   b, l
    ld   a, [bc]
    add  a, l
    ld   d, e
    ld   a, [bc]
    ld   b, h
    and  $15
    ld   a, [bc]
    jp   nz, label_6A226
    ld   [de], a
    rst  $30
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    ld   h, $44
    ld   d, d
    ld   b, h
    ld   l, b
    ld   b, h
    ld   a, a
    push af
    cp   $10
    inc  b
    add  a, h
    inc  hl
    ld   a, [bc]
    add  a, h
    inc  sp
    ld   a, [bc]
    add  a, l
    ld   b, e
    ld   a, [bc]
    add  a, l
    ld   d, e
    ld   a, [bc]
    daa
    push af
    jp   nz, label_A29
    inc  [hl]
    db   $FD ; Undefined instruction
    pop  hl
    db   $10 ; Undefined instruction

label_688C3::
    ld   d, b
    ld   a, h
    add  a, a
    ld   [de], a
    ld   h, d
    push bc
    ldi  [hl], a
    ld   h, d
    add  a, [hl]
    ld   h, e
    ld   h, d
    jp   nz, label_6A248
    ld   h, l
    inc  b
    rst  $38
    push af
    add  a, [hl]
    ld   [hl], b
    dec  bc
    jp   nz, label_B55
    ld   sp, $FE44
    inc  bc
    ld   a, [bc]
    ret  z
    add  hl, bc
    inc  b
    add  a, [hl]
    ldi  [hl], a
    ld   e, h
    add  a, [hl]
    ldd  [hl], a
    ld   e, h
    add  a, [hl]
    ld   b, d
    ld   e, h
    add  a, [hl]
    ld   d, d
    ld   e, h
    add  a, [hl]
    ld   h, d
    ld   e, h
    push bc
    ld   sp, hl
    push af
    cp   $03
    ld   a, [bc]
    jp   label_405
    add  a, l
    ld   sp, $8504
    ld   b, c
    inc  b
    add  a, e
    ld   d, d
    inc  b
    ld   b, c
    ld   b, h
    ld   d, h
    ld   b, h
    ret  z
    nop
    inc  b
    push bc
    rst  $38
    push af
    add  a, h
    ld   bc, $8204
    pop  af
    push af
    ldi  [hl], a
    push af
    inc  hl
    push af
    inc  hl
    ld   b, l
    inc  sp
    pop  hl
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    ld   b, h
    call nc, label_2682
    inc  b
    add  a, d
    ld   [hl], $04
    ld   h, $F5
    jp   label_458
    jp   label_459
    jp   nz, label_F558
    ld   c, b
    ld   [hl], $49
    cpl
    cp   $03
    inc  b
    add  a, [hl]
    ld   [bc], a
    ld   a, [bc]
    ld    hl, sp+$F5
    add  a, a
    ld   de, label_180A
    dec  hl
    add  hl, de
    inc  l
    push bc
    jr   nz, label_68954
    add  a, $21
    ld   a, [bc]
    add  a, $22
    ld   a, [bc]
    inc  hl
    dec  hl
    add  a, h
    inc  h

label_68954::
    inc  l
    jr   z, label_68988
    push bc
    inc  sp
    scf
    inc  sp
    ld   [$F043], a
    ld   d, e
    pop  af
    ld   [hl], e
    ld   l, $86
    ld   [hl], h
    cpl
    dec  [hl]
    ld   a, [bc]
    ld   b, h
    ld   a, [bc]
    ld   b, [hl]
    ld   a, [bc]
    ld   d, l
    ld   a, [bc]
    ld   b, b
    inc  a
    jp   label_3750
    cp   $03
    ld   c, $8A
    nop
    inc  b
    add  a, l
    ld   a, [$FFF5]
    add  a, e
    db   $10 ; Undefined instruction
    inc  de
    dec  l
    add  a, [hl]
    inc  d
    rrca
    push bc
    jr   nz, label_6898A
    push bc
    ld   hl, $C504

label_6898A::
    ldi  [hl], a
    inc  b
    push bc
    inc  hl
    jr   c, label_68A00
    ld   c, b
    ld   [hl], c
    ld   [rUNKN2], a
    ld   c, c
    ld   [hl], e
    ld   c, [hl]
    dec  [hl]
    ld   a, [de]
    ld   [hl], $10
    scf
    add  hl, de
    jp   nz, label_1245
    ld   b, [hl]
    ld   e, h
    jp   nz, label_1147
    ld   d, [hl]
    inc  b
    ld   h, l
    jr   label_68A10
    rrca
    ld   h, a
    rla
    add  hl, de
    ld   l, [hl]
    cp   $03
    inc  b
    add  a, l
    ld   a, [$FFF5]
    dec  b
    push af
    add  hl, bc
    push af
    add  a, d
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  d
    add  a, $20
    ld   c, $C6
    ld   hl, $C60E
    ldi  [hl], a
    ld   c, $82
    jr   z, label_689D5
    jr   c, label_689D7
    jp   nz, label_F545
    add  a, d
    ld   b, a
    dec  bc
    jp   label_B57

label_689D5::
    ld   e, c
    dec  hl

label_689D7::
    jp   nz, label_3769
    ld   [de], a
    rrca
    inc  de
    inc  d
    add  a, $23
    ld   [de], a
    db   $10 ; Undefined instruction
    cp   $03
    inc  b
    add  a, d
    ld   a, [$FFF5]
    rrca
    push af
    add  a, e
    push af
    push af
    add  a, d
    ld   d, b
    inc  l
    ld   d, d
    ld   sp, label_3742
    ldd  [hl], a
    dec  hl
    add  a, h
    inc  sp
    inc  l
    scf
    dec  l
    ld   b, a
    ldd  [hl], a
    ld   c, b
    dec  l

label_68A00::
    jp   label_3858
    ld   h, b
    push af
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    inc  l
    halt
    jp   nz, label_B04
    add  a, l

label_68A10::
    jr   nz, label_68A1D
    ld   d, $F5
    ld   c, c
    ld   l, [hl]
    ld   b, h
    ld   l, a
    cp   $03
    inc  b
    add  a, d
    rst  $38

label_68A1D::
    push af
    call nz, label_B07
    add  a, d
    jr   c, label_68A2F
    add  a, l
    ldi  [hl], a
    ld   l, [hl]
    ldd  [hl], a
    ld   l, [hl]
    add  a, e
    ld   b, b
    ld   l, [hl]
    ld   b, l
    ld   l, [hl]
    call nz, label_6AE47
    ld   h, c
    ld   l, [hl]
    ld   h, e
    ld   l, [hl]
    ld   h, l
    ld   l, [hl]
    inc  b
    ld   b, h
    ld   sp, label_68644
    ld   b, h
    ld   d, h
    ld   b, h
    ld    hl, sp+$F5
    add  hl, de
    push af
    ld   a, c
    push af
    cp   $03
    inc  b
    adc  a, c
    jr   nc, label_68A56
    add  a, l
    ld   a, [$FFF5]
    dec  b
    push af
    rra
    push af
    add  a, d
    inc  d
    push af
    add  a, e

label_68A56::
    ld   b, d
    push af
    add  a, [hl]
    ld   a, a
    push af
    inc  hl
    call nc, label_D348
    pop  hl
    ld   de, label_28D0
    ld   b, b
    cp   $03
    inc  b
    jp   label_3802
    ldd  [hl], a
    ldd  [hl], a
    inc  sp
    dec  l
    call nz, label_3843
    jp   nz, label_3705
    dec  h
    inc  sp
    ld   h, $3C
    push bc
    ld   [hl], $37
    ret  z
    add  hl, bc
    scf
    ld   b, a
    add  a, $E1
    ld   de, label_6B8D1
    ld   b, b
    jp   nz, label_A06
    ld   [label_2744], sp
    ld   b, h
    ld   a, [$FFF5]
    add  a, d
    ld   a, a
    push af
    jp   label_E03
    jp   label_E04
    push bc

label_68A98::
    inc  [hl]
    ld   c, $C5
    dec  [hl]
    ld   c, $61
    ld   l, [hl]
    ld   d, e
    db   $F2 ; Undefined instruction
    ld   h, e
    di
    ld   [hl], e
    db   $F4 ; Undefined instruction
    ld   d, [hl]
    ld   [$F066], a
    halt
    ld   l, b
    ld   l, [hl]
    cp   $03
    inc  bc
    nop
    dec  a
    ld   bc, label_93C
    dec  a
    rst  0
    db   $10 ; Undefined instruction
    rst  0
    ld   de, $C737
    add  hl, de
    jr   c, label_68B31
    ld   l, $87
    ld   [hl], d
    cpl
    ld   [hl], h
    ld   c, b
    ld   [hl], l
    ld   [rUNKN6], a
    ld   c, c
    ld   a, c
    ld   c, [hl]
    jp   label_B945
    ld   h, h
    cp   c
    ld   h, [hl]
    cp   c
    add  a, a
    ld   [bc], a
    or   e
    add  a, a
    ld   [de], a
    or   e
    ldi  [hl], a
    xor  l
    inc  hl
    xor  a
    inc  h
    or   c
    dec  h
    rst  $20
    ld   h, $AD
    daa
    xor  a
    jr   z, label_68A98
    ldd  [hl], a
    xor  [hl]
    inc  sp
    or   b
    inc  [hl]
    or   d

label_68AED::
    dec  [hl]
    db   $E3 ; Undefined instruction
    ld   [hl], $AE
    scf
    or   b
    jr   c, label_68AA7
    pop  hl
    ld   d, $8F
    ld   d, b
    ld   a, h
    cp   $03
    inc  bc
    adc  a, d
    nop
    cpl
    adc  a, d
    db   $10 ; Undefined instruction
    add  a, $20
    or   [hl]
    call nz, label_B643
    jp   label_B625
    ld   d, l
    or   a
    call nz, label_B647
    add  a, d
    ld   a, b
    or   [hl]
    ld   c, c
    or   [hl]
    ld   e, c
    or   a
    inc  sp
    cp   b
    scf
    cp   b
    cp   $03
    inc  bc
    adc  a, d
    nop
    cpl
    adc  a, d
    db   $10 ; Undefined instruction
    push bc
    dec  h
    or   [hl]
    ld   b, b
    or   [hl]
    ld   d, b
    or   a
    adc  a, d
    ld   [hl], b
    or   [hl]
    ldd  [hl], a
    cp   b

label_68B31::
    ld   d, d
    cp   b
    jr   c, label_68AED
    ld   e, b
    cp   b
    ld   d, h
    add  a, $E1
    ld   de, label_6A8FC
    ld   h, b
    jp   label_B933
    add  a, e
    ld   b, d
    cp   c
    jp   label_B937
    add  a, e
    ld   b, [hl]
    cp   c
    cp   $0A
    inc  bc
    add  a, d
    nop
    cpl
    ld   [bc], a
    ld   c, [hl]
    inc  b
    ld   l, $05
    cpl
    ld   b, $3C
    rlca
    add  hl, bc
    push bc
    ld   [$C538], sp
    add  hl, bc
    ld   c, $82
    db   $10 ; Undefined instruction
    ld   [de], a
    dec  sp
    inc  d
    add  hl, sp
    dec  d
    db   $3A ; ldd  a, [hl]
    add  a, $16
    scf
    jp   label_B622
    jp   nz, label_B634
    ld   d, d
    or   a
    ld   d, h
    or   a
    ld   sp, label_35B8
    cp   b
    ld   d, c
    cp   b
    ld   d, l
    cp   b
    ld   h, a
    add  hl, bc
    ld   [hl], b
    or   [hl]
    ld   [hl], d
    or   [hl]
    ld   [hl], h
    or   [hl]
    halt
    ld   [hl], a
    inc  a
    ld   e, b
    ldd  [hl], a
    ld   e, c
    dec  l
    jp   nz, label_3869
    add  a, $23
    cp   c
    inc  h
    cp   c
    add  a, e
    ld   h, d
    cp   c
    cp   $03
    inc  b
    ret  z
    nop
    ld   c, $C8
    ld   bc, label_6B237
    push af
    ld   l, b
    push af
    add  a, d
    ld   [hl], a
    push af
    call nz, label_B07
    ld   [hl], $0B
    add  a, d
    ld   b, l
    dec  bc
    jp   nz, label_69C48
    jp   label_B55
    ld   [bc], a
    ld   b, h
    inc  d
    ld   b, h
    jr   c, label_68C01
    call nz, label_F5F9
    ld   [de], a
    db   $FD ; Undefined instruction
    pop  hl
    dec  e
    ld   a, [label_6BC50]
    cp   $03
    inc  b
    call nz, label_F5FF
    ld   h, b
    push af
    add  a, [hl]
    ld   a, a
    push af
    add  a, a
    ld   hl, label_2160
    ld   e, a
    daa
    ld   e, a
    ld   sp, label_3760
    ld   h, b
    jp   label_A32
    jp   label_A36
    inc  sp
    rst  $30
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    rlca
    ld   b, h
    inc  de
    ld   b, h
    add  hl, sp
    ld   b, h
    ld   l, b
    ld   b, h
    inc  [hl]
    ld   h, c
    cp   $03
    inc  b
    add  a, [hl]
    ld   a, a
    push af
    add  a, a
    ld   [de], a
    inc  c
    call nz, label_C22
    call nz, label_C28
    add  a, a
    ld   h, d
    inc  c
    add  a, l
    inc  hl
    dec  c
    jp   nz, label_D33
    jp   nz, label_D37
    add  a, l
    ld   d, e
    dec  c
    inc  [hl]
    push af
    dec  [hl]
    push af
    dec  [hl]
    ld   b, l
    ld   b, l
    pop  hl
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    rlca
    ld   b, h
    jr   nz, label_68C67
    ld   h, c
    ld   b, h
    cp   $03
    inc  b
    add  a, e
    inc  d
    ld   e, h
    call nz, label_69C23
    call nz, label_69C27
    add  a, d
    ld   h, h
    ld   e, h
    inc  h
    rst  $30
    inc  [hl]
    ld   b, b
    dec  [hl]
    ld   b, c
    ld   [hl], $42
    pop  hl
    rrca
    and  b
    ld   d, b
    ld   a, h
    rst  0
    ld   [$C738], sp
    add  hl, bc
    ld   c, $82
    ld   [hl], e
    inc  b
    ld   h, [hl]
    push af
    add  a, h
    ld   a, a
    push af
    adc  a, b
    nop
    ld   a, [bc]
    ld   a, b
    ldd  [hl], a
    ld   a, c
    inc  l
    add  hl, bc
    inc  b
    ld   sp, hl
    push af
    ld   [label_180A], sp
    dec  a
    add  hl, de
    cpl
    ld   b, c
    ld   b, h
    cp   $03
    ld   a, [bc]
    nop
    inc  b

label_68C67::
    rst  $38
    push af
    ret  z
    ld   [$C804], sp
    add  hl, bc
    inc  b
    push bc
    ld    hl, sp+$F5
    db   $10 ; Undefined instruction
    push bc
    jr   nz, label_68CAE
    add  a, d
    ld   b, e
    inc  b
    ld   b, e
    push af
    ld   b, l
    call nc, label_691C4
    inc  b
    jp   label_452
    jp   nz, label_F551
    jp   nz, label_463
    ld   h, d
    push af
    ld   [hl], b
    ld   sp, $E826
    add  a, e
    dec  [hl]
    db   $E8 ; add  sp, d
    ld   b, [hl]
    db   $E8 ; add  sp, d
    jp   nz, label_E847
    cp   $03
    inc  b
    inc  b
    ld   l, d
    ld   [label_146A], sp
    ld   l, e
    jr   label_68D0E
    add  a, e
    dec  b
    ld   l, h
    add  a, e
    dec  d
    ld   h, d
    ld   d, $C2
    inc  bc
    add  hl, sp
    add  hl, bc

label_68CAE::
    db   $3A ; ldd  a, [hl]
    inc  de
    or   [hl]
    inc  hl
    or   a
    inc  sp
    or   [hl]
    ld   b, e
    or   a
    ld   b, h
    or   [hl]
    ld   d, h
    or   a
    ld   b, [hl]
    or   [hl]
    ld   d, [hl]
    ret  nz
    ld   c, b
    or   [hl]
    ld   e, b
    or   a
    add  hl, de
    dec  de
    inc  h
    ld   de, label_2583
    dec  de
    jr   z, label_68CE6
    add  hl, hl
    db   $10 ; Undefined instruction
    dec  d
    add  a, e
    dec  [hl]
    db   $10 ; Undefined instruction
    ld   d, $C2
    ld   d, e
    ld   a, [bc]
    ld   h, h
    ld   a, [bc]
    pop  hl
    ld   [bc], a
    ld   d, d
    ld   d, b
    ld   a, h
    rst  0
    nop
    scf
    ld   [hl], b
    ld   l, $89
    ld   [hl], c

label_68CE6::
    cpl
    ld   [hl], l
    ld   c, b
    halt
    ld   [hl], a
    ld   c, c
    rst  0
    ld   bc, $C70A
    ld   [bc], a
    ld   a, [bc]
    ld   d, l
    ld   l, [hl]
    ld   d, a
    ld   l, [hl]
    ld   l, b
    ld   l, [hl]
    cp   $03
    ld   c, $83
    nop
    db   $3A ; ldd  a, [hl]
    ld   bc, label_3E0
    dec  sp
    db   $10 ; Undefined instruction
    add  a, d
    ld   de, label_1310
    add  hl, de
    dec  d
    ld   a, [de]
    ld   d, $19

label_68D0E::
    jr   nz, label_68D26
    add  a, d
    ld   hl, label_2304
    ld   de, label_1825
    ld   h, $17
    call nz, label_430
    ld   sp, label_3213
    rrca
    inc  sp
    rla
    jp   label_440
    jp   label_1141
    ld   b, [hl]
    ld   a, [de]
    ld   b, a
    add  hl, de
    ld   d, e
    ld   a, [de]
    ld   d, h
    add  hl, de
    ld   d, [hl]
    jr   label_68D8A
    rla
    ld   h, e
    jr   label_68D9B
    rla
    adc  a, d
    ld   [hl], b
    cpl
    jr   label_68D57
    jr   z, label_68D57
    add  hl, de
    db   $10 ; Undefined instruction
    rrca
    cp   $03
    inc  b
    rst  0
    nop
    ld   c, $C7
    ld   bc, $C70E
    ld   [bc], a
    ld   c, $C2
    inc  sp
    ld   c, $05
    push af
    jp   nz, label_B07

label_68D57::
    ret  z
    add  hl, bc
    scf
    jp   label_F526
    call nz, label_A45
    ld   d, e
    dec  a
    ld   d, h
    dec  [hl]
    ld   h, d
    ld   c, $63
    jr   c, label_68DCD
    ld   a, [bc]
    add  a, e
    ld   [hl], b
    cpl
    ld   [hl], e
    ld   c, [hl]
    add  a, d

label_68D70::
    ld   [hl], h
    db   $D3 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_68D85
    ld   de, label_2119
    rla
    jp   label_1203
    inc  hl
    jr   label_68DA4
    inc  d
    jp   nz, label_1234
    cp   $03
    inc  b
    call nz, label_F500

label_68D8A::
    jp   nz, label_F551
    inc  bc
    scf
    ld   b, $38
    inc  de
    ld   l, $82
    inc  d
    cpl
    ld   d, $4E
    inc  hl
    add  hl, sp

label_68D9A::
    inc  h

label_68D9B::
    db   $3A ; ldd  a, [hl]
    dec  h
    pop  hl
    pop  hl
    ld   a, [bc]
    sub  a, l
    ld   [hl], b
    ld   a, h
    ld   h, $3B
    call nz, label_3808
    ld   b, l
    dec  a
    add  a, d
    ld   b, [hl]
    cpl
    ld   c, b
    ld   c, [hl]
    ld   d, [hl]
    db   $3A ; ldd  a, [hl]
    ld   d, a
    pop  hl
    pop  hl
    ld   a, [bc]
    sub  a, d
    jr   nc, label_68E34
    ld   e, b
    dec  sp
    jp   label_3855
    call nz, label_A29
    add  a, e
    ld   h, [hl]
    ld   a, [bc]
    add  a, d
    halt
    inc  sp
    ld   b, h
    ld   e, c
    ld   l, [hl]
    ld   [hl], a
    ld   l, [hl]
    ld   a, c

label_68DCD::
    ld   l, [hl]
    cp   $03
    inc  b
    jp   nz, label_3866
    ld   d, [hl]
    dec  a
    add  a, e
    ld   d, a
    cpl
    add  a, e
    ld   h, a
    ld   c, $83
    ld   [hl], a
    ld   c, $C3
    rlca
    ld   l, [hl]
    ld   de, label_136E
    ld   l, [hl]
    dec  d
    ld   l, [hl]
    ld   sp, label_346E
    jr   nz, label_68D70
    dec  [hl]
    ld   l, [hl]
    jp   nz, label_6AE44
    add  a, e
    ld   d, b
    ld   l, [hl]
    inc  b
    ld   b, h
    add  hl, de
    ld   b, h
    ld   [hl], h
    ld   b, h
    ld   [hl], b
    ld   l, [hl]
    ld   [hl], d
    ld   l, [hl]
    ld   sp, hl

label_68E00::
    push af
    cp   $03
    inc  b
    jr   nz, label_68E4A
    inc  hl
    dec  a
    add  a, [hl]
    inc  h
    cpl
    ld   h, $48
    daa
    ld   [$FF28], a
    ld   c, c
    inc  sp
    jr   c, label_68D9A
    inc  [hl]
    ld   c, $42
    dec  a
    ld   b, e
    inc  [hl]
    ld   b, h
    ld   c, $45
    dec  hl
    add  a, h
    ld   b, [hl]
    inc  l
    add  a, d
    ld   d, b
    cpl
    ld   d, d
    inc  [hl]
    add  a, d
    ld   d, e
    ld   c, $55
    scf
    add  a, h
    ld   d, [hl]
    ld   a, [bc]
    add  a, l
    ld   h, b
    ld   c, $65
    inc  sp
    ld   h, [hl]

label_68E34::
    ld   [$FF67], a
    inc  a
    add  a, d
    ld   l, b
    ld   a, [bc]
    add  a, a
    ld   [hl], b
    ld   c, $77
    scf
    ld   a, b
    ld   a, [bc]
    ld   a, c
    push af
    add  a, [hl]
    rst  $38
    push af
    cp   $03
    inc  b
    jp   label_E04
    jp   label_E05
    add  a, l
    jr   nc, label_68E60
    jp   nz, label_3803
    add  a, e
    jr   nz, label_68E87
    inc  hl
    inc  [hl]
    jp   label_3706
    dec  [hl]
    dec  hl
    ld   [hl], $31
    add  a, l
    ld   b, b
    inc  l
    ld   b, l
    ld   sp, label_9C8
    scf
    jp   label_A27
    ld   b, [hl]
    ld   a, [bc]
    adc  a, b
    ld   d, b
    ld   a, [bc]
    add  a, d
    ld   h, l
    ld   a, [bc]
    jp   nz, label_A68
    jr   c, label_68ED5
    ld   e, b
    ld   e, h
    ld   h, h
    ld   e, h
    ld   [label_6B644], sp
    ld   b, h
    ld   a, a
    push af
    add  a, d
    rst  $38
    push af
    cp   $03
    inc  bc
    rst  0
    nop
    jr   c, label_68E8E
    add  hl, sp

label_68E8E::
    add  a, a
    ld   [bc], a
    db   $3A ; ldd  a, [hl]
    dec  b
    ld   [$FF09], a
    dec  sp
    ld   d, $B6
    add  a, e
    inc  hl
    or   [hl]
    jp   nz, label_B633
    add  a, d
    inc  [hl]
    or   a
    ld   d, e
    or   a
    ld   h, $B7
    ld   b, h
    cp   b
    add  a, e
    ld   b, a
    or   [hl]
    ld   d, a
    or   [hl]
    add  a, d
    ld   e, b
    or   a

label_68EAE::
    ld   h, a
    or   a
    ld   [hl], b
    ldd  [hl], a
    adc  a, c
    ld   [hl], c
    inc  l
    add  a, e
    inc  de
    cp   c
    jp   label_B917
    call nz, label_B922
    jp   label_B936
    jp   nz, label_B945
    ld   d, h
    cp   c
    cp   $03
    inc  bc
    nop
    or   a
    call nz, label_B603
    add  a, e
    rlca
    or   a
    add  a, h
    ld   [hl], $B6
    add  a, h

label_68ED5::
    ld   b, b
    or   [hl]
    jp   nz, label_B646
    add  a, e
    ld   b, a
    or   a
    add  a, h
    ld   d, b
    or   a
    ld   h, [hl]
    or   a
    adc  a, d
    ld   [hl], b
    inc  l

label_68EE5::
    inc  h
    cp   b
    cp   $03
    inc  bc
    adc  a, d
    nop
    or   a
    call nz, label_B622
    jp   label_B607
    add  a, e
    scf
    or   [hl]
    jr   nc, label_68EAE
    ld   b, b
    or   a
    add  a, e
    ld   b, a
    or   a
    ld   d, $B8
    ld   b, h
    cp   b
    adc  a, d
    ld   [hl], b
    inc  l
    ld   h, d
    or   a
    call nz, label_B915
    add  a, e
    inc  h
    cp   c
    add  a, e
    inc  [hl]
    cp   c
    cp   $03
    inc  bc
    ld   b, $39
    ret  z
    rlca
    scf
    adc  a, b
    ld   [hl], b
    inc  l
    ld   [hl], a
    ld   sp, label_9C8
    jr   c, label_68F48
    add  hl, bc
    ld   l, b
    add  hl, bc
    nop
    or   a
    ld   [bc], a
    or   [hl]
    inc  b
    or   [hl]
    ld   [de], a
    or   a
    inc  d
    or   a
    jr   nc, label_68EE5
    ldd  [hl], a
    or   [hl]
    inc  [hl]
    or   [hl]
    ld   b, b
    or   a
    ld   b, d
    or   a
    ld   b, h
    or   a
    inc  sp
    cp   b
    ld   d, l
    cp   b
    jp   nz, label_B903
    jp   nz, label_B941
    ld   b, e
    cp   c
    ld   b, l
    cp   c
    ld   d, d

label_68F48::
    cp   c
    ld   d, h
    cp   c
    cp   $03
    inc  b
    jp   nz, label_3701
    jp   nz, label_E00
    ld   hl, label_2031
    dec  hl
    push bc
    jr   nc, label_68F92
    add  a, d
    rst  $30
    push af
    db   $F2 ; Undefined instruction
    push af
    ldi  [hl], a
    ld   [hl], $23
    inc  a
    inc  sp
    ld   l, $34
    cpl
    dec  [hl]
    ld   c, b
    ld   [hl], $43
    scf
    ld   c, c
    jr   c, label_68FBE
    jr   z, label_68FAF
    add  hl, hl
    cpl
    add  a, h
    ld   b, h
    db   $3A ; ldd  a, [hl]
    ld   b, e
    add  hl, sp
    ld   c, b
    dec  sp
    ld   [hl], b
    ld   l, $82
    ld   [hl], c
    cpl
    ld   [hl], e
    ld   c, b
    ld   [hl], h
    ld   b, e
    ld   [hl], l
    ld   c, c
    add  a, d
    halt
    ld   a, b
    ld   c, [hl]
    ld   l, b
    dec  a
    ld   l, c
    cpl
    inc  d
    call nc, label_5C2
    dec  bc
    jp   nz, label_B16
    ld   d, [hl]
    dec  bc
    add  a, e
    ld   h, h
    dec  bc
    daa
    ld   b, h
    ld   d, l
    ld   b, h
    cp   $03
    inc  b
    add  a, [hl]
    rst  $38
    push af
    add  a, e
    jr   nz, label_68FD8
    inc  hl
    dec  [hl]
    ld   h, b
    dec  [hl]
    ld   d, a
    dec  [hl]

label_68FAF::
    ld   d, [hl]
    dec  a
    jp   nz, label_3866
    jp   label_F539
    add  a, d
    ld   h, $5C
    add  a, e
    ld   b, d
    ld   e, h
    ld   b, l

label_68FBE::
    db   $E8 ; add  sp, d
    dec  d
    ld   b, h
    ld   h, d
    ld   b, h
    ld   l, b
    ld   b, h
    cp   $03
    inc  b
    add  a, [hl]
    rst  $38
    push af
    jp   label_F53F
    add  a, e
    dec  [hl]
    push af
    ld   b, c
    push af
    ld   l, c
    push af
    ld   a, b
    push af
    add  a, e

label_68FD8::
    ld   d, e
    db   $E8 ; add  sp, d
    ld   b, e
    db   $E8 ; add  sp, d
    ld   d, $44
    ldi  [hl], a
    ld   b, h
    cp   $03
    inc  b
    add  a, h
    rst  $38
    push af
    add  a, d
    ld   b, $F5
    call nz, label_F519
    add  a, d
    ccf
    push af
    ld   l, a
    push af
    add  a, d
    ld   [hl], b
    push af
    ld   [hl], h
    dec  hl
    add  a, e
    ld   [hl], l
    inc  l
    ld   a, b
    dec  l
    inc  [hl]
    ld   e, h
    jr   c, label_6905B
    ld   d, [hl]
    ld   e, h
    inc  hl
    ld   b, h
    ld   [hl], $44
    ld   d, l
    ld   b, h
    cp   $03
    inc  b
    pop  af
    push af
    add  a, d
    nop
    push af
    call nz, label_F51F
    ld   b, b
    push af
    add  a, [hl]
    inc  b
    ld   a, [bc]
    add  a, [hl]
    inc  d
    ld   a, [bc]
    add  a, h
    ld   hl, label_220A
    call nc, label_1A25
    add  a, h
    ld   h, $10
    add  a, e
    ld   sp, label_340A
    ld   a, [de]
    dec  [hl]
    ld   d, $36
    db   $E8 ; add  sp, d
    scf
    call nc, label_E842
    ld   b, e
    ld   a, [bc]
    ld   b, h
    ld   [de], a
    ld   b, [hl]
    inc  de
    add  a, e
    ld   b, a
    rrca
    ld   d, d
    ld   l, [hl]
    ld   d, e
    ld   a, [de]
    ld   d, h
    ld   d, $C2
    ld   d, [hl]
    ld   de, $D457
    add  a, d
    ld   e, b
    dec  de
    jp   nz, label_449
    ld   c, c
    push af
    ld   h, c
    db   $E8 ; add  sp, d
    ld   h, d
    ld   a, [bc]
    jp   nz, label_1263
    ld   h, l
    call nc, label_6A783
    dec  de
    add  a, d
    ld   [hl], c

label_6905B::
    ld   a, [bc]
    halt
    add  a, e
    ld   [hl], a
    db   $10 ; Undefined instruction
    ld   [$F804], sp
    push af
    cp   $03
    inc  b
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    nop
    add  hl, sp
    ld   b, $E0
    add  a, e
    ld   [hl], h
    ld   a, [bc]
    add  a, h
    db   $10 ; Undefined instruction
    add  a, h
    ld   d, $0A
    adc  a, b
    ldi  [hl], a
    ld   a, [bc]
    inc  d
    push af
    dec  h
    push af
    jr   nz, label_69092
    ld   hl, label_2219
    call nc, label_1531
    add  a, d
    ldd  [hl], a

label_6908A::
    db   $10 ; Undefined instruction
    add  hl, de
    scf
    call nc, label_6AE38
    add  a, d

label_69092::
    ld   b, b
    rrca
    ld   b, d
    inc  d
    ld   b, e
    ld   b, h
    ld   b, h
    dec  d
    add  a, d
    ld   b, l
    db   $10 ; Undefined instruction
    add  hl, de
    add  a, d
    ld   d, b
    dec  de
    ld   d, d
    jr   label_690F8
    inc  d
    ld   d, l
    jr   nz, label_690FF
    call nc, label_1157
    add  a, e
    ld   h, b
    dec  de
    jp   nz, label_1263
    ld   h, h
    call nc, label_1365
    ld   h, [hl]
    rrca
    ld   h, a
    rla
    ld   [hl], b
    add  hl, de
    add  a, d
    ld   [hl], c
    dec  de
    ld   [hl], e
    ld   [de], a
    ld   [hl], h
    ld   b, h
    ld   [hl], l
    ld   de, label_688C3
    ld   a, [bc]
    add  a, e
    halt
    jp   nz, label_440
    ld   c, a
    push af
    jp   label_F539
    daa
    ld   a, [bc]
    cp   $03
    ld   a, [bc]
    ldi  [hl], a
    dec  hl
    add  a, d
    inc  hl
    inc  l
    dec  h
    dec  l
    ldd  [hl], a
    ld   l, $82
    inc  sp
    cpl
    dec  [hl]
    ld   c, [hl]
    ld   b, d
    add  hl, sp
    ld   b, e
    pop  hl
    pop  hl
    ld   de, $80C9
    ld   a, h
    ld   b, h
    db   $3A ; ldd  a, [hl]
    ld   b, l
    dec  sp
    ret  z
    nop
    inc  b
    adc  a, d
    nop

label_690F8::
    db   $3A ; ldd  a, [hl]
    jp   nz, label_A10
    add  hl, de
    db   $D3 ; Undefined instruction
    daa

label_690FF::
    ld   e, h
    jp   label_F53F
    add  hl, sp
    db   $D3 ; Undefined instruction
    add  a, h
    ld   b, [hl]
    db   $D3 ; Undefined instruction
    jp   label_6AE52
    add  a, [hl]
    ld   d, h
    db   $D3 ; Undefined instruction
    add  a, a
    ld   h, e
    ld   e, h
    add  a, a
    ld   [hl], e
    db   $D3 ; Undefined instruction
    halt
    ld   l, c
    ld   a, [bc]
    dec  d
    ld   l, [hl]
    add  hl, de
    ld   l, [hl]
    add  hl, sp
    ld   l, [hl]
    add  a, h
    ld   b, [hl]
    ld   l, [hl]
    rla
    ld   l, a
    cp   $03
    db   $D3 ; Undefined instruction
    ret  z
    rlca
    ld   l, [hl]
    ret  z
    ld   [$C804], sp
    add  hl, bc
    scf
    jp   nz, label_69C11
    jp   nz, label_69C14
    dec  d
    ld   e, h
    add  a, $16
    ld   e, h
    jr   nz, label_69146
    add  a, [hl]
    ld   sp, $835C
    ld   d, d
    ld   e, h
    add  a, d
    ld   h, b
    ld   e, h
    ld   h, h

label_69146::
    ld   e, h
    ld   [hl], c
    ld   a, [bc]
    ld   [hl], h
    ld   a, [bc]
    halt
    ld   h, b
    ld   a, [bc]
    add  a, e
    nop
    db   $3A ; ldd  a, [hl]
    inc  bc
    dec  sp
    cp   $03
    inc  b
    jp   nz, label_300
    pop  af
    push af
    inc  bc
    add  hl, bc
    inc  b
    add  hl, bc
    ld   de, label_1209
    inc  bc
    jr   nz, label_6916F
    ldi  [hl], a
    add  hl, bc
    jr   nc, label_691A7
    call nz, label_3840
    add  a, d
    ld   sp, label_332F
    ld   c, [hl]
    inc  hl
    jr   c, label_69188
    dec  a
    inc  d
    cpl
    dec  d
    ld   c, [hl]
    dec  b
    jr   c, label_691A1
    db   $3A ; ldd  a, [hl]
    dec  h
    dec  sp
    ld   b, c
    db   $3A ; ldd  a, [hl]
    ld   b, d
    pop  hl
    pop  hl
    ld   a, [bc]
    sub  a, e
    jr   nc, label_69205
    ld   b, e
    dec  sp
    jp   label_A06
    dec  [hl]
    ld   a, [bc]
    jp   label_A34
    add  a, e
    ld   d, c
    ld   a, [bc]
    add  a, e
    ld   h, c
    ld   a, [bc]
    add  a, d
    ld   [hl], c
    ld   a, [bc]
    jr   c, label_691DB
    add  hl, sp
    cpl
    jp   nz, label_3848
    ld   l, b
    ld   c, [hl]
    ld   h, a
    dec  a

label_691A7::
    ld   [hl], a
    jr   c, label_69222
    ccf
    call nz, label_E49
    rlca
    ld   l, [hl]
    add  hl, bc
    ld   l, [hl]
    add  a, d
    ld   h, $6E
    cp   $03
    ld   c, $86
    nop
    inc  b
    ld   b, $38
    add  a, e
    db   $10 ; Undefined instruction
    add  a, e
    inc  de
    dec  a
    add  a, d

label_691C4::
    inc  d
    cpl
    ld   d, $34
    add  a, e
    jr   nz, label_691CF
    inc  hl
    jr   c, label_691FE
    ld   c, b

label_691CF::
    ld   sp, label_32E0
    ld   c, c
    inc  sp
    inc  [hl]
    rla
    jp   z, label_CA62
    ld   h, l
    ld   d, c

label_691DB::
    ld   [bc], a
    ld   l, [hl]
    nop
    ld   l, [hl]
    cp   $03
    ld   c, $C8
    rlca
    scf
    ld   [$C70A], sp
    jr   label_691EE
    push bc
    ld   sp, hl
    push af
    cp   $03
    inc  b
    add  a, d
    rlca
    ld   a, [bc]
    jp   label_A52
    ld   h, e
    ld   a, [bc]
    ld   b, $44
    ld   de, label_68544
    ld   b, h

label_691FE::
    ld   e, b
    ld   b, h
    ld   h, a
    ld   b, h
    inc  hl
    ld   e, h
    ld   h, $5C
    ld   d, e

label_69207::
    ld   e, h
    ld   d, [hl]
    ld   e, h
    add  hl, bc
    ld   l, $19
    add  hl, sp
    daa
    push af
    jr   c, label_69207
    ld   l, b
    push af
    ld   b, a
    call nc, label_FFC5
    push af
    ld   bc, label_110A
    ld   b, h
    ld   [de], a
    ld   a, [bc]
    add  a, e
    ld   d, $0A

label_69222::
    ld   hl, $C40A
    ld   b, c
    ld   a, [bc]
    jp   label_A52
    cp   $03
    inc  b
    adc  a, d
    ld   b, b
    ld   a, [bc]
    adc  a, d
    nop
    cpl
    adc  a, d
    db   $10 ; Undefined instruction
    adc  a, c
    ld   h, c
    ld   a, [bc]
    adc  a, c
    ld   [hl], c
    ld   a, [bc]
    adc  a, d
    ld   d, b
    inc  c
    adc  a, d
    jr   nc, label_692A4
    ld   b, b
    ld   h, d
    ld   hl, $8255
    ldi  [hl], a
    ld   e, d
    inc  h
    ld   d, [hl]
    ld   sp, $8257
    ldd  [hl], a
    ld   e, c
    inc  [hl]
    ld   e, b
    add  a, h
    ld   b, c
    ld   e, e
    ld   b, d
    ldh  [$FF0C], a
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    jp   nz, label_6A260
    jr   z, label_692A5
    ld   [hl], $FD
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    cp   $03
    inc  b
    adc  a, c
    nop
    cpl
    adc  a, c
    db   $10 ; Undefined instruction
    add  hl, bc
    inc  a
    rst  0
    add  hl, de
    scf
    add  a, a
    jr   nc, label_692DB
    jr   label_69235
    pop  hl
    ld   a, [bc]
    rst  $30
    ld   h, b
    ld   a, h
    ld   hl, $E1F7
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    inc  h
    rst  $30
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    push bc
    scf
    ld   h, d
    ld   b, b
    ld   a, [bc]
    add  a, [hl]
    ld   d, b
    inc  c
    add  a, [hl]
    ld   h, b
    ld   a, [bc]
    add  a, [hl]
    ld   [hl], b
    ld   a, [bc]
    jp   label_C56
    cp   $08
    ld   [label_20C5], sp

label_692A4::
    jr   c, label_692B6
    dec  a
    ld   [hl], b
    ldd  [hl], a
    nop
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   de, $0134
    dec  a
    add  a, [hl]
    ld   [bc], a
    cpl
    ld   [label_183C], sp
    inc  sp
    add  hl, de
    inc  a
    add  hl, hl
    inc  sp
    ld   [hl], l
    dec  hl
    add  a, e
    halt
    ld   a, c
    ld   sp, label_699C2
    scf
    ld   c, c
    dec  hl
    add  a, e
    ld   [de], a
    rst  8
    add  a, h
    ld   hl, $84CF
    ld   sp, $83CF
    dec  d
    ret  nc
    add  a, h
    dec  h
    ret  nc
    add  a, h
    dec  [hl]
    ret  nc
    add  a, h

label_692DB::
    ld   b, c
    pop  de
    add  a, h
    ld   d, c
    pop  de
    add  a, h
    ld   h, c
    pop  de
    add  a, h
    ld   b, l
    jp   nc, label_69584
    jp   nc, label_6A584
    jp   nc, label_6B182
    inc  l
    ld   [hl], e
    dec  l
    cp   $08
    ld   [label_9C8], sp
    jr   c, label_692F8

label_692F8::
    dec  a
    add  a, [hl]
    ld   bc, label_72F
    inc  a
    ld   [label_1009], sp
    jr   c, label_6931A
    inc  sp
    jr   label_69342
    jr   nz, label_6933C
    push bc
    jr   z, label_69342
    ld   a, b
    ld   sp, label_2C77
    halt
    ld   b, b
    dec  l
    jp   label_3850
    ldd  [hl], a
    ld   l, c
    add  a, e
    ld   b, h

label_6931A::
    ld   l, c
    add  a, e
    ld   d, c
    ld   l, c
    add  a, d
    ld   [hl], d
    ld   l, c
    inc  de
    ld   l, a
    inc  b
    ld   c, b
    dec  b
    pop  hl
    ld   b, $49
    pop  hl
    rra
    ld   sp, hl
    ld   a, b
    ld   h, b
    cp   $03
    inc  b
    ret  z
    nop
    scf
    nop
    ld   a, $87
    ld   bc, label_83A
    dec  sp
    jr   nc, label_6936B
    ld   b, b
    ld   a, $89
    ld   sp, $892F
    ld   b, c
    db   $3A ; ldd  a, [hl]
    scf
    ld   c, b
    jp   nz, label_E038
    add  hl, sp
    ld   c, c
    inc  [hl]
    ld   c, b
    dec  [hl]
    ld   b, e
    ld   [hl], $49
    jp   nz, label_B14
    dec  h
    dec  bc
    ld   h, e
    ld   [hl], $64
    inc  a
    ld   [hl], h
    ld   l, $75
    ld   c, b
    halt
    ld   [hl], a
    ld   c, c
    add  a, d
    ld   a, b
    cpl
    cp   $03
    inc  b
    call nz, label_F5F9
    jp   nz, label_3806
    ld   h, $4E
    ld   [hl], $3B
    add  a, e
    inc  sp
    db   $3A ; ldd  a, [hl]
    dec  h
    ld   c, c
    inc  hl
    ld   c, b
    inc  h
    ld   c, d
    ldi  [hl], a
    dec  a
    ldd  [hl], a
    ld   c, [hl]
    add  a, d
    jr   nc, label_693B2
    add  a, d
    ld   b, b
    db   $3A ; ldd  a, [hl]
    ld   b, d
    dec  sp
    adc  a, d
    ld   [hl], b
    cpl
    ld   [hl], h
    ld   c, b
    halt
    ld   [hl], l
    ld   c, d
    add  a, e
    ld   d, [hl]
    ld   e, h
    add  a, d
    ld   h, d
    ld   e, h
    ld   bc, label_1444
    ld   b, h
    daa
    ld   b, h
    ld   d, e
    ld   b, h
    cp   $03
    inc  b

label_693A2::
    call nz, label_F5FF
    ld    hl, sp+$F5
    add  hl, bc
    push af
    add  hl, hl
    push af
    jr   c, label_693A2
    ld   c, c
    push af
    ld   b, e
    push af
    adc  a, d

label_693B2::
    ld   [hl], b
    cpl
    ld   [de], a
    ld   b, h
    jr   label_693FC
    dec  h
    ld   b, h
    ld   d, d
    ld   b, h
    cp   $03
    inc  c
    add  a, d
    ld   a, [$FFF5]
    jp   label_F50F
    call nz, label_F5F9
    inc  b
    ld   l, $83
    dec  b
    cpl

label_693CD::
    ld   [label_144E], sp
    add  hl, sp
    jr   label_6940E
    add  a, e
    dec  d
    ld   h, d
    ld   d, $C2
    add  a, d
    ld   de, $8204
    ld   hl, $8204
    ld   sp, $8204

label_693E2::
    ld   b, c
    inc  b
    add  a, e
    ld   d, c
    inc  b
    ld   l, b
    inc  b
    inc  [hl]
    or   [hl]
    jr   c, label_693A3
    ld   b, [hl]
    or   [hl]
    ld   b, h
    or   a
    ld   c, b
    or   a
    ld   d, [hl]
    ret  nz
    adc  a, d
    ld   [hl], b
    cpl
    pop  hl
    nop
    rla
    ld   d, b

label_693FC::
    ld   a, h
    cp   $03
    inc  b
    adc  a, d
    ld   [hl], b
    cpl
    call nz, label_F5FF
    add  a, d
    ld   bc, label_30A
    ld   [de], a
    dec  b
    ld   b, h
    rlca

label_6940E::
    inc  de
    ld   [label_90F], sp
    inc  d
    ld   de, label_120A
    ld   a, [de]
    inc  de
    ld   d, $C2
    rla
    ld   de, label_18C2
    dec  de
    jp   nz, label_1219
    ld   hl, label_22D4
    jr   label_6944A
    rrca
    inc  h
    inc  d
    dec  h
    db   $D3 ; Undefined instruction
    pop  hl
    ld   de, $88FB
    ld   [hl], b
    add  a, d
    ld   sp, label_330A
    ld   l, [hl]
    inc  [hl]
    jr   label_6946E
    rrca
    ld   [hl], $14
    scf
    dec  d
    jr   c, label_69450
    add  hl, sp
    ld   d, $42
    ld   l, [hl]
    add  a, d
    ld   b, e
    db   $D3 ; Undefined instruction
    ld   b, [hl]
    jr   label_693CD

label_6944A::
    ld   b, a
    rrca
    ld   d, d
    call nc, label_A53

label_69450::
    add  a, h
    ld   d, h
    db   $E8 ; add  sp, d
    add  a, d
    ld   e, b
    ld   a, [bc]
    ld   e, c
    ld   l, [hl]
    add  a, h
    ld   h, c
    ld   a, [bc]
    ld   h, d
    jr   nz, label_693E2
    ld   h, h
    db   $E8 ; add  sp, d
    ld   l, b
    db   $D3 ; Undefined instruction
    ld   l, c
    ld   a, [bc]
    ld   b, b
    push af
    ld   b, h
    ld   l, [hl]
    ld   b, l
    ld   l, [hl]
    ld   d, e

label_6946B::
    jr   nz, label_6946B
    inc  bc

label_6946E::
    inc  b
    adc  a, d
    ld   [hl], b
    cpl
    ld   a, c
    inc  a
    jp   nz, label_1100
    add  a, d
    ld   bc, label_31B
    ld   [de], a
    jp   nz, label_1105
    add  a, e
    ld   b, $0A
    jp   label_F5F9
    ld   de, label_121B
    ld   a, [de]
    inc  de
    ld   d, $14
    ld   l, [hl]
    add  a, e
    ld   d, $0A
    jr   nz, label_694A7
    ld   hl, label_2210
    ld   d, $23
    inc  de
    inc  h
    rrca
    dec  h
    rla
    ld   h, $D4
    add  a, d
    daa
    ld   a, [bc]
    ld   sp, label_3244
    call nc, label_1133

label_694A7::
    add  a, d
    inc  [hl]
    ld   a, [bc]
    ld   [hl], $20
    scf
    call nc, label_A38
    add  a, e
    ld   b, b
    rrca
    ld   b, e
    rla
    add  a, l
    ld   b, h
    ld   a, [bc]
    adc  a, c
    ld   d, b
    ld   a, [bc]
    ld   d, h
    call nc, label_6A089
    ld   a, [bc]
    jp   nz, label_438
    ld   e, b
    push af
    ld   d, b
    ld   l, [hl]
    cp   $03
    inc  b
    jp   label_F5FF
    push bc
    ld   bc, $880A
    ld   [bc], a
    db   $D3 ; Undefined instruction
    ld   b, $0A
    add  a, d
    ld   [de], a
    db   $D3 ; Undefined instruction
    add  a, l
    inc  d
    ld   e, h
    add  hl, de
    ld   a, [bc]
    adc  a, b
    ldi  [hl], a
    db   $D3 ; Undefined instruction
    ld   h, $5C
    ldd  [hl], a
    db   $D3 ; Undefined instruction
    add  a, e
    ld   [hl], $5C
    add  hl, sp
    ld   a, [bc]
    add  a, h
    ld   b, [hl]
    ld   l, [hl]
    ld   b, a
    call nc, label_F550
    ld   d, d
    ld   a, [bc]
    ld   e, c
    ld   l, [hl]
    add  a, e
    ld   h, d
    ld   a, [bc]
    ld   h, l
    db   $D3 ; Undefined instruction

label_694F9::
    ld   h, [hl]
    push af
    add  a, e
    ld   [hl], b
    push af
    ld   a, b
    push af
    call nz, label_6AE02
    inc  sp
    db   $FD ; Undefined instruction
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    cp   $03
    inc  b
    add  a, [hl]
    nop
    db   $D3 ; Undefined instruction
    ld   bc, label_40A
    ld   a, [bc]
    ld   b, $0A
    call nz, label_6AE07
    db   $10 ; Undefined instruction
    add  a, [hl]
    ld   de, label_135C
    db   $D3 ; Undefined instruction
    jp   nz, label_D315
    add  a, d
    jr   nz, label_694F9
    add  a, e
    ldi  [hl], a
    ld   e, h
    jp   nz, label_69C26
    jr   nc, label_69538
    ld   sp, $835C
    ldd  [hl], a
    db   $D3 ; Undefined instruction
    add  a, d
    dec  [hl]
    ld   e, h
    ld   b, b
    db   $D3 ; Undefined instruction

label_69538::
    add  a, l
    ld   b, c
    ld   e, h
    ld   b, [hl]
    ld   l, [hl]
    add  a, [hl]
    ld   d, b
    ld   l, [hl]
    push bc
    add  hl, bc
    scf
    ld   e, c
    ld   l, $69
    add  hl, sp
    add  a, l
    ld   [hl], b
    push af
    ld   h, a
    push af
    ld   d, e
    call nc, label_3FE
    inc  b
    push bc
    nop
    jr   c, label_695A5
    ld   c, [hl]
    ld   h, b
    dec  sp
    ld   [hl], b
    push af
    push bc
    ld   bc, $C40A
    rlca
    jr   c, label_695A4
    dec  a
    add  a, e

label_69563::
    ld   d, h
    db   $3A ; ldd  a, [hl]
    ld   b, h
    ld   c, b
    jp   nz, label_E045
    ld   b, [hl]
    ld   c, c
    ld   d, a
    dec  sp
    jp   label_3853
    ret  z
    ld   [$C80E], sp
    add  hl, bc
    ld   c, $84
    ld   h, h
    ld   c, $84
    ld   [hl], h
    ld   c, $47
    ld   c, [hl]
    ld   [$FE3B], sp
    inc  bc
    ld   c, $13
    jp   z, label_22C2
    ld   d, c
    ld   b, d
    ld   d, c
    ld   d, e
    ld   d, c
    add  a, e
    ld   h, c
    jp   z, label_6A484
    ld   d, c
    ld   h, l
    jp   z, label_CA57
    jr   z, label_69563
    jp   label_69138
    add  a, h
    inc  d
    ld   d, c
    ld   b, c
    jp   z, label_F824
    pop  hl

label_695A4::
    inc  b

label_695A5::
    and  c
    ld   d, b
    ld   a, h
    cp   $03
    ld   c, $07
    scf
    add  a, d
    ld   [$8204], sp
    inc  sp
    inc  b
    add  a, h
    ld   b, e
    inc  b
    ld   h, [hl]
    inc  b
    add  a, e
    ld   [hl], h
    inc  b
    ld   sp, hl
    push af
    rla
    inc  sp
    jr   label_695A1
    add  hl, de
    cpl
    ldi  [hl], a
    dec  hl
    add  a, d
    inc  hl
    inc  l
    dec  h
    dec  l
    jp   nz, label_3732
    dec  [hl]
    ldd  [hl], a
    ld   [hl], $2C
    scf
    dec  l
    ld   b, [hl]
    inc  b
    call nz, label_3847
    ld   d, d
    inc  sp
    ld   d, e
    inc  a
    add  a, e
    ld   d, h
    inc  b
    jp   nz, label_3763
    add  a, d
    ld   h, h
    inc  b
    halt
    inc  [hl]
    ld   l, a
    cp   $03
    inc  b
    ret  z
    nop
    ld   c, $C8
    ld   bc, $0137
    inc  b
    jp   nz, label_A02
    ld   b, d
    ld   b, h
    jp   label_A52
    ld   l, b
    dec  a
    ld   l, c
    cpl
    ld   a, b
    jr   c, label_6967C
    ld   c, $C3
    ld   [$82F5], sp
    ld   h, $0A
    jp   nz, label_A35
    add  a, d
    ld   d, [hl]
    ld   a, [bc]
    ld   [hl], $F5
    scf
    push af
    scf
    ld   b, l
    ld   b, a
    pop  hl
    ld   h, h
    ld   b, h
    ld   d, $44
    jp   nz, label_A62
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    rst  $38
    push af
    db   $10 ; Undefined instruction
    ld   de, $FE3C
    inc  bc
    ld   a, [bc]
    add  a, l
    inc  de
    inc  b
    add  a, a
    ldi  [hl], a
    inc  b
    add  a, a
    ldd  [hl], a
    inc  b
    add  a, a
    ld   b, d
    inc  b
    ld   d, c
    inc  b
    add  a, l
    ld   d, e
    inc  b
    add  a, a
    ld   [hl], e
    inc  b
    inc  hl
    ld   b, h
    jr   c, label_69689
    ld   b, [hl]
    ld   b, h
    ld   d, l
    ld   b, h
    ld   d, c
    ld   h, d
    add  a, $00
    ld   h, d
    add  a, h
    ld   h, [hl]
    ld   h, d
    add  a, d
    ld   h, b
    cpl
    ld   h, d
    inc  a
    add  a, d
    ld   [hl], b
    ld   c, $72
    scf
    add  a, e
    ld   [hl], h
    push af
    cp   $03
    inc  b
    jp   label_3709
    add  hl, sp
    ld   l, $49
    add  hl, sp
    add  a, [hl]
    nop
    ld   a, [bc]
    add  a, h
    db   $10 ; Undefined instruction
    add  a, d
    jr   nz, label_6967B
    add  a, d
    jr   nc, label_6967E
    add  a, d
    ld   b, b
    ld   a, [bc]
    add  a, d
    ld   [hl], b
    ld   a, [bc]
    ld   b, $0C

label_6967C::
    call nz, label_6A207
    inc  d
    rst  $30
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    add  a, d
    ldi  [hl], a
    ld   e, h

label_69689::
    ldd  [hl], a
    ld   e, h
    inc  sp
    ld   h, c
    add  a, h
    ld   b, d
    inc  c
    add  a, l
    ld   h, b
    ld   h, d
    jp   label_C52
    ld   b, [hl]
    ld   h, d
    ld   d, e
    ld   a, [bc]
    add  a, e
    ld   d, h
    ld   h, d
    ld   c, b
    ld   b, h
    ld   e, b
    push af
    ld   [hl], e
    push af
    add  a, d
    halt
    add  a, d
    ld   [hl], b
    inc  b
    ld   [hl], b
    push af
    cp   $08
    ld   [$00C8], sp
    scf
    nop
    ld   [hl], $82
    ld   bc, label_32F
    inc  [hl]
    dec  b
    ld   l, $84
    ld   b, $2F
    dec  d
    add  hl, sp
    add  a, h
    ld   d, $3A
    db   $10 ; Undefined instruction
    jr   nz, label_6967D
    jr   nc, label_69704
    push bc
    ld   sp, $8203
    ld   h, d
    inc  bc
    add  a, d
    ld   [hl], d
    inc  bc
    ld   h, e
    add  hl, bc
    ldi  [hl], a
    dec  a
    inc  hl
    dec  [hl]
    jp   nz, label_3832
    ld   d, d
    ldd  [hl], a
    ld   d, e
    inc  l
    ld   d, h
    dec  l
    jp   nz, label_3864
    halt
    add  a, d
    ld   [hl], a
    inc  l
    ld   a, c
    ld   sp, label_3769
    ld   e, c
    dec  hl
    ld   h, $69
    ld   b, e
    ld   l, c
    cp   $03
    ld   [label_68E00], sp
    ld   b, $33
    rlca
    cpl
    ld   [$C835], sp
    add  hl, bc
    jr   c, label_69711
    dec  sp
    ld   b, l
    ld   [hl], $46
    cpl
    ld   b, a
    inc  a
    ld   d, b
    dec  l
    jp   nz, label_3757
    ld   h, b
    jr   c, label_69780
    ldd  [hl], a

label_69711::
    add  a, [hl]
    ld   [hl], c
    inc  l
    ld   [hl], a
    ld   sp, label_698C3
    inc  bc
    add  a, d
    ld   [bc], a
    ld   l, c
    inc  de
    ld   l, c
    inc  h
    ld   l, c
    dec  [hl]
    ld   l, c
    ld   h, [hl]
    ret  z
    cp   $02
    inc  bc
    ret  z
    nop
    scf
    add  a, l
    dec  b
    db   $3A ; ldd  a, [hl]
    inc  b
    add  hl, sp
    inc  [hl]
    ei
    add  hl, sp
    ei
    ld   [hl], $FB
    ld   e, c
    ei
    add  a, d
    ld   h, a
    ld   e, h
    ld   h, l
    ld   e, h
    add  a, [hl]
    ld   [hl], h
    cpl
    ld   [hl], e
    dec  a
    ld   [hl], l
    ld   c, b
    halt
    ld   [hl], a
    ld   c, c
    cp   $02
    inc  bc
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]

label_6974D::
    add  a, e
    dec  d
    ld   e, h
    jr   label_6974D
    cpl
    ei
    ld   c, a
    ei
    add  a, d
    ld   h, c
    ld   e, h
    add  a, e
    ld   [hl], b
    cpl
    ld   [hl], e
    ld   c, [hl]
    jp   nz, label_3853
    ld   b, e
    dec  a
    ld   b, h
    cpl
    ld   b, l
    dec  [hl]
    ld   c, b
    ld   [hl], $49
    cpl
    add  a, [hl]
    ld   d, h
    ld   [label_6A486], sp
    ld   [label_6B486], sp
    ld   [label_69C12], sp
    ld   h, [hl]
    inc  h
    ld   a, b
    dec  hl
    ld   a, c
    inc  l
    ld   [de], a
    call nc, label_2FE

label_69780::
    inc  bc
    adc  a, d
    nop

label_69783::
    db   $3A ; ldd  a, [hl]
    db   $10 ; Undefined instruction
    jr   label_69783
    ld   e, b
    ei
    add  a, a
    ld   b, b
    cpl
    ld   b, a
    inc  a
    jp   nz, label_3757
    ld   [hl], a
    ld   l, $78
    inc  a
    ld   [hl], b
    inc  l
    ld   [hl], c
    dec  l
    add  a, a
    ld   d, b
    ld   [label_6A087], sp
    ld   [label_6B285], sp
    ld   [label_2452], sp
    ld   h, h
    inc  h
    cp   $02
    inc  bc
    adc  a, d
    nop
    db   $3A ; ldd  a, [hl]
    db   $10 ; Undefined instruction
    ld   d, $FB
    jr   label_697AE
    ld   d, b
    ei
    ld   d, [hl]
    ei
    ld   e, b
    ei
    ld   [hl], b
    cpl
    ld   [hl], d
    ld   c, b
    add  a, e
    ld   [hl], e
    ld   c, d
    halt
    add  a, e
    ld   [hl], a
    cpl
    jp   nz, label_69C32
    ld   [hl], b
    inc  bc
    ld   [hl], c
    dec  a
    inc  de
    db   $FD ; Undefined instruction
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h
    cp   $02
    ld   [$008A], sp
    db   $3A ; ldd  a, [hl]
    add  a, $10
    inc  bc
    add  a, $11
    inc  bc
    jp   label_69C32
    add  a, d
    ld   [hl], b
    cpl
    ld   [hl], d
    ld   c, [hl]
    ld   h, d
    jr   c, label_6983C
    dec  a
    ld   d, e
    dec  [hl]
    jr   c, label_69813
    ld   h, h
    inc  h
    db   $10 ; Undefined instruction
    ld   [de], a
    ei
    inc  d
    ei
    ld   d, b
    ei
    ld   l, c
    dec  hl
    ld   a, c
    scf
    cp   $02
    ld   [$0089], sp
    db   $3A ; ldd  a, [hl]
    add  hl, bc
    scf
    dec  d
    inc  h
    add  hl, de
    ld   l, $23
    ret  z
    daa
    and  b
    jr   z, label_6982F
    add  hl, hl
    add  hl, sp
    ld   sp, label_3624
    ret  z
    jp   nz, label_2037
    jp   label_438
    jp   label_439
    ld   d, d
    ret  z
    ld   d, [hl]
    ld   [hl], $57
    inc  a
    ld   h, b
    dec  l
    ld   h, a
    inc  sp
    ld   l, b
    cpl
    ld   l, c
    inc  a
    ld   [hl], b
    ldd  [hl], a
    add  a, e

label_6982F::
    ld   [hl], c
    inc  l
    ld   [hl], h
    dec  l
    ld   a, c
    scf
    cp   $03
    inc  b
    add  a, l
    ld   a, [$FFF5]
    ld   b, $3D
    rlca
    dec  [hl]
    add  a, [hl]
    db   $10 ; Undefined instruction
    ld   d, $4E
    add  a, e
    rla
    ld   a, [bc]
    add  a, [hl]
    jr   nz, label_69884
    inc  [hl]
    add  a, $E1
    rra
    ld   [$FF88], a
    ld   [hl], b
    ld   h, $3B
    add  a, e
    daa
    ld   a, [bc]
    ldd  [hl], a
    push af
    add  a, e
    dec  [hl]
    ld   a, [bc]
    jr   c, label_69852
    add  a, d
    ld   b, h
    push af
    jp   nz, label_F549
    ld   h, b
    dec  a
    ld   h, c
    cpl
    ld   h, d
    inc  a
    ld   [hl], b
    jr   c, label_698DD
    db   $3A ; ldd  a, [hl]
    ld   [hl], d
    ld   l, $73
    inc  a
    cp   $03

label_69873::
    inc  b
    add  a, l
    ld   a, [$FFF5]
    rlca
    push af
    ld   h, $F5
    add  a, d
    jr   nc, label_69873
    dec  [hl]
    push af
    ld   b, e
    push af
    add  a, [hl]
    db   $10 ; Undefined instruction
    add  a, [hl]
    jr   nz, label_69892
    inc  [hl]
    ld   a, [bc]
    ld   d, $C6
    pop  hl
    rra
    push hl
    jr   z, label_698C1
    ld   d, a

label_69892::
    db   $E8 ; add  sp, d
    ld   [hl], a
    inc  b
    jp   nz, label_F54F
    add  hl, hl
    ld   b, h
    ld   d, l
    ld   b, h
    ld   a, b
    ld   b, h
    add  a, e
    ld   [hl], c
    push af
    cp   $03
    inc  b
    add  a, [hl]
    inc  b
    ld   c, $86
    inc  d
    ld   c, $C3
    jr   z, label_698BB
    jp   label_E29
    jp   nz, label_3803
    inc  hl
    ldd  [hl], a
    add  a, e
    inc  h
    inc  l
    daa
    dec  l
    jp   nz, label_3837
    ld   d, a
    ldd  [hl], a
    add  a, d
    ld   e, b

label_698C1::
    inc  l
    ld   a, [$FFF5]
    ld   [hl], $09
    ld   h, h
    add  hl, bc
    ld   d, b
    inc  bc
    add  a, e
    ld   h, b
    inc  bc
    add  a, [hl]
    ld   [hl], b
    inc  bc
    ld   b, d
    push af

label_698D2::
    ld   b, e
    push af
    ld   b, e
    ld   b, l
    ld   d, e
    pop  hl
    pop  hl
    db   $10 ; Undefined instruction
    ld   d, b
    ld   a, h

label_698DD::
    cp   $03
    ld   c, $39
    inc  b
    ld   [hl], b
    inc  b
    add  a, h
    ld   b, [hl]
    inc  b
    add  a, d
    ld   e, b
    inc  b
    inc  d
    dec  hl
    add  a, l
    dec  d
    inc  l
    inc  hl
    jp   z, label_3724
    add  a, l
    dec  h
    inc  b
    add  a, e
    ld   [hl], $04
    inc  [hl]
    inc  sp
    dec  [hl]
    inc  a
    ld   b, d
    jp   z, label_3745
    ld   d, l
    inc  sp
    ld   d, [hl]
    cpl
    ld   d, a
    inc  a
    ld   h, a
    inc  sp
    add  a, d
    ld   l, b
    cpl
    add  a, e
    ld   d, b
    inc  l
    ld   d, e
    dec  l
    ld   d, l
    inc  sp
    ld   d, [hl]
    cpl
    ld   d, a
    inc  a
    add  a, d
    ld   h, b
    ld   a, [bc]
    ld   h, d
    ld   e, h
    jp   nz, label_3863
    ld   h, a

label_69920::
    inc  sp
    add  a, d
    ld   l, b
    cpl
    add  a, d
    ld   [hl], c
    ld   a, [bc]
    add  a, e
    ld   [hl], a
    jp   z, label_68682
    inc  b
    ld   c, b
    ld   b, h
    ld   h, $C6
    pop  hl
    ld   a, [bc]
    sbc  a, b
    ld   l, b
    ld   h, b
    cp   $03
    inc  b
    adc  a, d
    nop
    ld   c, $8A
    db   $10 ; Undefined instruction
    add  a, a
    inc  hl
    ld   c, $85
    inc  sp
    ld   c, $83
    ld   b, h
    ld   c, $83
    inc  b
    inc  b
    inc  bc
    scf
    rlca
    jr   c, label_698D2
    db   $10 ; Undefined instruction
    ld   [de], a
    dec  l
    inc  de
    inc  sp
    add  a, e
    inc  d
    cpl
    rla
    inc  [hl]
    ldi  [hl], a
    jr   c, label_69920
    inc  h
    jp   z, label_36C2
    jp   z, label_2B38
    add  hl, sp
    inc  l
    ldd  [hl], a
    ldd  [hl], a
    inc  sp
    dec  l
    ld   b, e
    ldd  [hl], a
    ld   b, h
    dec  l
    ld   b, a
    dec  hl
    ld   c, b
    ld   sp, label_3254
    add  a, d
    ld   d, l
    inc  l
    ld   d, a
    ld   sp, label_3C60
    ld   [hl], b
    scf
    ld   a, c
    push af
    inc  b
    ld   b, h
    ld   hl, label_68044
    ld   b, h
    ld   h, a
    ld   b, h
    push bc
    dec  d
    db   $DB
    ld   d, d
    push af
    ld   [hl], e
    push af
    cp   $03
    inc  b
    jp   label_E00
    rst  0
    ld   [label_6B738], sp
    dec  a
    ld   a, b
    inc  [hl]
    ret  z
    add  hl, bc
    ld   c, $82
    ld   a, a
    push af
    ld   d, d
    push af
    rlca
    ld   b, h
    inc  de
    ld   b, h
    inc  [hl]
    ld   b, h
    ld   b, [hl]
    ld   b, h
    ld   h, b
    ld   b, h
    ld   [hl], e
    ld   b, h
    jp   label_3701
    jr   nc, label_699E1
    ld   sp, $FE31
    inc  bc
    inc  b
    ret  z
    nop
    ld   c, $C3
    ld   bc, $C30E
    ld   [bc], a

label_699C2::
    scf
    ldd  [hl], a
    ld   sp, label_2B31
    call nz, label_3741
    inc  d
    dec  a
    add  a, l
    dec  d
    cpl
    push bc
    inc  h
    jr   c, label_69A47
    ldd  [hl], a
    add  a, [hl]
    ld   [hl], l
    inc  l
    add  a, l
    dec  h
    dec  de
    add  a, l
    dec  [hl]
    dec  de
    add  a, l
    ld   b, l
    dec  de
    add  a, l

label_699E1::
    ld   d, l
    dec  de
    add  a, l
    ld   h, l
    dec  de
    dec  [hl]
    dec  hl
    ld   [hl], $2C
    scf
    dec  l
    ld   b, l
    scf
    ld   b, [hl]
    db   $E8 ; add  sp, d
    ld   b, a
    jr   c, label_69A48
    inc  sp
    ld   d, [hl]
    ld   [$FF57], a
    inc  [hl]
    ld   b, d
    ld   b, h
    ld   h, e
    ld   b, h
    add  a, e
    db   $F4 ; Undefined instruction
    push af
    cp   $03
    inc  b
    jp   nz, label_F5F3
    add  a, d
    or   $F5
    db   $10 ; Undefined instruction
    ld   de, label_213C
    scf
    ld   sp, label_3233
    ld   [$FF33], a
    inc  a
    jp   label_3743
    add  a, e
    ld   [hl], b
    inc  l
    ld   [hl], e
    ld   sp, label_20C2
    dec  de
    add  a, e
    ld   b, b
    dec  de
    add  a, e
    ld   d, b
    dec  de
    add  a, e
    ld   h, b
    dec  de
    jr   label_69A55
    add  hl, de
    inc  l
    daa
    dec  hl
    jr   z, label_69A61
    scf
    scf
    ld   b, [hl]
    dec  hl
    ld   b, a
    ld   sp, label_696C3
    scf
    add  hl, hl
    inc  bc
    add  a, d
    jr   c, label_69A41
    add  a, d
    ld   c, b
    inc  bc

label_69A41::
    add  a, e
    ld   d, a
    inc  bc
    add  a, e
    ld   h, a
    inc  bc

label_69A47::
    add  a, e

label_69A48::
    ld   [hl], a
    inc  bc
    ld   [bc], a
    ld   b, h
    rla
    ld   b, h
    ld   h, l
    ld   b, h
    ld   [hl], h
    ld   b, h
    ld   a, [$FFF5]
    cp   $03
    ld   [label_3700], sp
    db   $10 ; Undefined instruction
    call nz, label_3804
    ld   b, $33
    add  a, e

label_69A61::
    rlca
    cpl
    call nz, label_301
    call nz, label_302
    call nz, label_303
    add  a, $20
    inc  bc
    ld   sp, $823D
    ldd  [hl], a
    cpl
    inc  [hl]
    ld   c, [hl]
    add  a, d
    ld   b, d
    db   $3A ; ldd  a, [hl]
    ld   b, h
    dec  sp
    call nz, label_3841
    ld   bc, label_68009
    add  hl, bc
    add  hl, de
    or   [hl]
    ld   a, c
    or   [hl]
    add  hl, hl
    or   a
    ld   d, a
    ret  z
    ld   h, e
    ret  z
    cp   $03
    ld   [$0087], sp
    cpl
    rlca
    inc  a
    rst  0
    rla
    scf
    ret  z
    ld   [$C803], sp
    add  hl, bc
    jr   c, label_69AAE
    or   [hl]
    jr   nz, label_69A58
    inc  [hl]
    ld   l, c
    ld   [hl], b
    or   [hl]
    add  a, e
    ld   [hl], h
    or   [hl]
    cp   $02
    inc  bc
    add  a, [hl]
    ld   d, h
    ld   e, $8A
    ld   h, b
    rra
    adc  a, d
    ld   [hl], b
    rra
    ld   d, b
    rra
    jp   label_3700
    jr   nc, label_69AE9
    ld   b, b
    add  hl, sp
    ld   sp, label_6813C
    scf
    ld   d, c
    ld   l, $61
    add  hl, sp
    ld   d, d
    cpl
    ld   h, d
    db   $3A ; ldd  a, [hl]
    ld   d, e
    ld   c, [hl]
    ld   h, e
    dec  sp
    push bc
    inc  bc

label_69ACF::
    jr   c, label_69A57
    inc  b
    db   $3A ; ldd  a, [hl]
    ld   b, $E0
    add  a, [hl]
    inc  d
    ld   [label_2486], sp
    ld   [label_3486], sp
    ld   [label_68486], sp
    ld   [label_2427], sp
    ld   b, [hl]
    ret  z
    cp   $02
    ld   [label_6908A], sp
    ld   e, $8A
    ld   h, b
    rra
    adc  a, d
    ld   [hl], b
    rra
    add  a, e
    nop
    db   $3A ; ldd  a, [hl]
    inc  bc
    dec  sp
    ld   [label_937], sp
    inc  bc
    jr   label_69B2A
    add  hl, de
    cpl
    add  hl, hl
    db   $3A ; ldd  a, [hl]
    jr   z, label_69B3B
    ld   d, $24
    jr   c, label_69B2A
    ld   b, c
    inc  h
    ld   b, h
    inc  hl
    inc  sp
    ret  z
    ld   b, [hl]
    ret  z
    ld   c, c
    dec  hl
    ld   e, c
    scf
    ld   l, c
    ld   l, $79
    add  hl, sp
    cp   $02
    ld   [label_300], sp
    ld   bc, label_738
    ld   a, $08
    ld   l, $09
    cpl
    db   $10 ; Undefined instruction
    ld   de, label_164E
    inc  h
    rla

label_69B2A::
    add  hl, sp
    jr   label_69B6B
    jp   nz, label_3A19
    jr   nz, label_69B6C
    ld   hl, label_283B
    add  hl, sp
    dec  [hl]
    inc  hl
    jr   c, label_69B5E
    ld   b, b

label_69B3B::
    inc  l
    ld   b, c
    dec  l
    ld   b, h
    inc  hl
    ld   b, a
    ret  z
    ld   d, b
    inc  bc
    ld   d, c
    jr   c, label_69ACF
    ld   d, d
    ld   e, $60
    cpl
    ld   h, c
    ld   c, [hl]
    adc  a, b
    ld   h, d
    rra
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    ld   [hl], c
    dec  sp
    adc  a, b
    ld   [hl], d
    rra
    cp   $02
    ld   [$008A], sp
    db   $3A ; ldd  a, [hl]
    adc  a, d

label_69B5E::
    db   $10 ; Undefined instruction
    adc  a, d
    ld   d, b
    ld   e, $8A
    ld   h, b
    rra
    adc  a, d
    ld   [hl], b
    rra
    nop
    cpl

label_69B6B::
    ld   bc, $C24E
    db   $10 ; Undefined instruction
    ld   de, label_213F
    dec  sp
    inc  hl
    inc  h
    jr   c, label_69B9C
    ld   b, e
    ret  z
    cp   $02
    ld   [label_6908A], sp
    ld   e, $8A
    ld   h, b
    rra
    adc  a, d
    ld   [hl], b
    rra
    add  a, d
    nop
    db   $3A ; ldd  a, [hl]
    add  a, d
    db   $10 ; Undefined instruction
    ld   [bc], a
    ccf
    ld   [de], a
    dec  sp
    add  a, $09
    scf
    ld   l, c
    inc  sp
    dec  d
    inc  h
    inc  [hl]
    ret  z
    jr   c, label_69BBF
    ld   b, c

label_69B9C::
    inc  h
    ld   de, $E1BA
    rra
    push af
    ld   c, b
    ld   a, h
    cp   $02
    ld   [label_6908A], sp
    ld   e, $8A
    ld   h, b
    rra
    adc  a, d
    ld   [hl], b
    rra
    jp   nz, label_300
    ld   bc, $823D
    ld   [bc], a
    cpl
    inc  b
    inc  [hl]
    push bc
    add  hl, bc
    scf
    ld   de, label_2238
    ei
    dec  d
    inc  h
    jr   nz, label_69C02
    ld   hl, label_274E
    ei
    jp   label_3830
    ld   sp, label_6833B
    ret  z
    ld   e, c
    ld   l, $60
    inc  [hl]
    ld   l, c
    ld   a, $79
    add  hl, sp
    cp   $03
    inc  b
    push bc
    nop
    jr   c, label_69BA7
    ld   bc, label_20E
    add  hl, sp
    rst  0
    ld   [de], a
    ld   c, $C4
    inc  bc
    scf
    add  hl, bc
    push af
    ld   d, $44
    inc  [hl]
    ld   b, h
    scf
    ld   b, h
    ld   b, e
    ld   l, $44
    inc  a
    ld   c, c
    ld   b, h
    ld   d, b
    ld   c, [hl]
    ld   d, e
    add  hl, sp
    ld   d, h
    ld   l, $55
    cpl
    ld   d, [hl]
    inc  a
    ld   h, b

label_69C02::
    ccf
    jp   nz, label_E63
    ld   h, h
    add  hl, sp
    ld   h, l
    db   $3A ; ldd  a, [hl]
    ld   h, [hl]
    ld   l, $83
    ld   h, a
    cpl
    ld   [hl], b
    dec  sp

label_69C11::
    add  a, l

label_69C12::
    ld   [hl], c
    ld   c, $76
    add  hl, sp
    add  a, e

label_69C17::
    ld   [hl], a
    db   $3A ; ldd  a, [hl]
    add  a, d
    daa
    ld   a, [bc]
    scf
    ld   a, [bc]
    inc  h
    db   $FD ; Undefined instruction
    pop  hl

label_69C21::
    ld   e, $E3

label_69C23::
    ld   d, b
    ld   a, h
    add  a, d

label_69C26::
    ld   b, l

label_69C27::
    ld   a, [bc]

label_69C28::
    add  a, d
    inc  d
    ld   a, [bc]
    cp   $03
    inc  b
    rrca
    push af
    jr   label_69C27

label_69C32::
    jr   c, label_69C71
    add  hl, sp

label_69C35::
    cpl

label_69C36::
    jp   nz, label_3848
    adc  a, b
    ld   h, b
    cpl
    adc  a, b
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    ld   l, b

label_69C40::
    ld   c, [hl]
    ld   a, b
    dec  sp

label_69C43::
    call nz, label_E49
    ld   b, [hl]
    push af

label_69C48::
    rlca
    ld   b, h
    add  a, e
    ld   de, label_2F5
    push af
    inc  b
    push af
    add  a, e
    inc  sp
    db   $E8 ; add  sp, d
    add  a, d
    ld   b, d
    push af
    add  a, e
    pop  af
    push af
    cp   $03
    inc  b
    ldd  [hl], a
    dec  hl
    add  a, d
    inc  sp
    inc  l
    dec  [hl]
    dec  l
    ld   b, d
    scf
    add  a, d
    ld   b, e
    inc  b
    ld   b, l
    jr   c, label_69CBE
    inc  sp
    add  a, d
    ld   d, e
    cpl
    ld   d, e

label_69C71::
    ld   [rHDMA5], a
    inc  [hl]
    db   $10 ; Undefined instruction
    ld   de, label_122F
    ld   c, b
    inc  de
    ld   [rNR14], a
    ld   c, c
    dec  d
    inc  a
    jr   nz, label_69CBA
    add  a, h
    ld   hl, label_250E
    inc  sp
    ld   h, $2F
    daa
    inc  a
    jr   nc, label_69CC1
    call nz, label_E31
    push bc
    ld   [hl], $0E
    jp   label_3737
    ld   h, a
    ld   l, $68
    inc  a
    ld   [hl], a
    add  hl, sp
    ld   a, b
    ld   l, $79
    cpl
    ld   b, h
    ld   e, h
    add  a, [hl]
    ld   h, b
    ld   c, $86
    ld   [hl], b
    ld   c, $C3
    ld   b, b
    jp   z, label_CA64
    add  a, e
    ld   [hl], c
    jp   z, label_68418
    ld   l, c
    ld   b, h
    cp   $03
    inc  b
    inc  bc
    jr   c, label_69C40

label_69CBA::
    inc  b
    ld   c, $83
    rlca

label_69CBE::
    jp   z, label_3213

label_69CC1::
    add  a, l
    inc  d
    inc  l
    add  hl, de
    dec  l
    call nz, label_3829
    add  a, d
    inc  hl
    db   $E8 ; add  sp, d
    add  a, h
    dec  h
    ld   e, h
    add  a, e
    ldd  [hl], a
    db   $E8 ; add  sp, d
    add  a, h
    dec  [hl]
    ld   e, h
    add  a, d
    ld   b, d
    db   $E8 ; add  sp, d
    add  a, l
    ld   b, h
    ld   e, h
    add  a, d
    ld   d, d
    db   $E8 ; add  sp, d

label_69CDE::
    add  a, l
    ld   d, h
    ld   e, h
    add  a, e
    ld   h, d
    db   $E8 ; add  sp, d
    add  a, e
    ld   h, l
    ld   e, h
    ld   l, b
    dec  a
    ld   l, c
    inc  [hl]
    adc  a, b
    ld   [hl], b
    cpl
    ld   a, b
    inc  [hl]
    ld   a, c
    ld   c, $47
    add  a, $E1
    rra
    or   $88
    ld   [hl], b
    cp   $03
    inc  b
    call nz, label_3700
    add  a, $14
    ld   c, $C6
    dec  d
    ld   c, $C2
    ld   sp, hl
    push af
    inc  hl
    db   $F2 ; Undefined instruction
    ld   h, $EA
    ld   sp, $C220
    inc  sp
    di
    jp   nz, label_F036
    ld   b, b
    inc  sp
    ld   b, c
    inc  a
    ld   c, b
    jr   nz, label_69CDE
    ld   d, b
    ld   c, $51
    scf
    ld   d, e
    db   $F4 ; Undefined instruction
    ld   d, [hl]
    pop  af
    ld   h, c
    inc  sp
    ld   h, d
    cpl
    ld   h, e
    inc  [hl]
    ld   h, l
    jp   z, label_3366
    add  a, e
    ld   h, a
    cpl
    adc  a, c
    ld   [hl], c
    ld   c, $82
    ld   [hl], e
    jp   z, label_68412
    jr   label_69D7E
    ld   b, a
    ld   b, h
    ld   d, d
    ld   b, h
    di
    push af
    inc  de
    dec  a
    inc  d
    cpl
    dec  d
    ld   [rNR21], a
    inc  a
    cp   $03
    inc  b
    add  a, d
    rst  $38
    push af
    rra
    push af
    call nz, label_3807
    ld   b, l
    dec  a
    ld   b, [hl]
    cpl
    ld   b, a
    inc  [hl]
    ld   d, h
    dec  a
    ld   d, l
    inc  [hl]
    add  a, h
    ld   h, b
    cpl
    ld   h, h
    inc  [hl]
    ret  z
    ld   [$C80E], sp
    add  hl, bc
    ld   c, $82
    ld   d, [hl]
    ld   c, $83
    ld   h, l
    ld   c, $8A
    ld   [hl], b
    ld   c, $C3
    add  hl, hl
    jp   z, label_CA48
    ld   d, a
    jp   z, label_3FE
    inc  b
    ret  z
    nop
    ld   c, $C8
    ld   bc, $C20E
    ld   bc, label_6A137
    inc  sp
    ld   h, d
    inc  a
    ld   [hl], d
    inc  sp
    jr   nz, label_69DB7
    ld   hl, $C231
    jr   nc, label_69DC8
    ld   d, b
    inc  sp
    ld   d, c
    inc  a
    ld   h, c
    inc  sp
    ld   h, d
    inc  a
    ld   [hl], d
    inc  sp
    add  a, e
    inc  b
    push af
    dec  d
    push af
    inc  h
    ld   e, h
    dec  [hl]
    ld   e, h
    add  a, d
    ld   b, h
    ld   e, h
    add  a, e
    ld   d, e
    ld   e, h
    ld   h, e
    ld   e, h
    ld   [hl], $F5
    ld   [de], a
    ld   b, h
    daa
    ld   b, h
    inc  sp
    ld   b, h
    ld   b, c
    ld   b, h
    ld   d, d

label_69DB7::
    ld   b, h
    ld   e, b
    ld   b, h
    ld   h, [hl]
    ld   b, h
    add  a, a
    ld   [hl], e
    cpl
    ld   sp, $FE04

label_69DC2::
    inc  bc
    inc  b
    add  a, d
    nop
    push af
    ldi  [hl], a

label_69DC8::
    call nc, label_3706
    add  a, e
    rlca
    inc  bc
    ld   d, $2E
    rla
    ld   c, b
    jr   label_69E1E
    add  hl, de
    ld   c, c
    ld   h, $39
    add  a, e
    daa
    db   $3A ; ldd  a, [hl]
    ld   d, l
    dec  a
    add  a, h
    ld   d, [hl]
    cpl
    ld   h, h
    dec  a
    ld   h, l
    inc  [hl]
    add  a, h
    ld   [hl], b
    cpl
    ld   [hl], h
    inc  [hl]
    add  a, h
    ld   h, [hl]
    ld   c, $85
    ld   [hl], l
    ld   c, $14
    ld   b, h
    jr   nc, label_69E37
    ld   [hl], $44
    ld   b, e
    ld   b, h
    ld   c, c
    ld   b, h
    ld   h, d
    ld   b, h
    cp   $03
    ld   [label_900], sp
    ld   bc, label_1038
    cpl
    ld   de, label_204E
    db   $3A ; ldd  a, [hl]
    ld   hl, $8A3B
    ld   d, b
    cpl
    adc  a, d
    ld   h, b
    ld   c, $8A
    ld   [hl], b
    ld   c, $09
    or   a
    inc  hl
    or   [hl]
    ld   h, $B6
    inc  sp
    or   a
    ld   [hl], $B7
    add  hl, sp

label_69E1E::
    or   [hl]
    ld   c, c
    or   a
    inc  hl
    call label_CD26
    inc  sp
    adc  a, $36
    adc  a, $FE
    inc  bc
    ld   [label_6A08A], sp
    ld   c, $8A
    ld   [hl], b
    ld   c, $C2
    ld   [label_3703], sp
    inc  bc

label_69E37::
    ld   b, [hl]
    inc  bc
    jp   nz, label_69C28
    add  a, d
    inc  [hl]
    jr   nz, label_69DC2
    ld   b, h
    jr   nz, label_69E05
    rlca
    scf
    daa
    ld   sp, label_2B24
    add  a, d
    dec  h
    inc  l
    jp   nz, label_3734
    add  a, a
    ld   d, b
    cpl
    ld   d, h
    ld   l, $64
    add  hl, sp
    ld   d, a
    ld   c, [hl]
    ld   b, a
    dec  a
    ld   c, b
    cpl
    ld   c, c
    ld   c, [hl]
    call nz, label_3809
    add  a, d
    ld   h, l
    db   $3A ; ldd  a, [hl]
    nop
    or   a
    jr   nc, label_69E1E
    ld   b, b
    or   a
    add  a, e
    inc  b
    or   a
    ld   h, a
    dec  sp
    ld   [hl], $09
    ld   e, b
    db   $3A ; ldd  a, [hl]
    ld   e, c
    dec  sp
    cp   $00
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    jr   nz, label_69EDA
    jr   nz, label_69EDC
    jr   nz, label_69EE2
    jr   nz, label_69EE4
    jr   nz, label_69EE6
    jr   nz, label_69EE8
    ld   b, b
    ld   h, d
    jr   nz, label_69EEC
    ld   b, b
    ld   e, [hl]
    ld   b, b
    ld   e, [hl]
    nop
    ld   [hl], h
    nop
    ld   a, b
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    jr   nz, label_69EFA
    jr   nz, label_69EFC
    jr   nz, label_69F02
    jr   nz, label_69F04
    ld   b, b
    ld   h, d
    ld   b, b
    ld   h, d
    ld   b, b
    ld   h, d
    jr   nz, label_69F0C
    jr   nz, label_69F0E
    jr   nz, label_69F10
    nop
    ld   c, h
    nop
    ld   c, h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   a, h
    nop
    ld   a, h
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   l, d
    ld   b, b
    ld   l, d
    nop
    ld   a, b
    nop
    ld   a, b

label_69EDA::
    nop
    ld   [hl], h

label_69EDC::
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    nop
    ld   [hl], h

label_69EE2::
    nop
    ld   a, h

label_69EE4::
    nop
    ld   a, h

label_69EE6::
    ld   b, b
    ld   h, [hl]

label_69EE8::
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]

label_69EEC::
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   l, d
    ld   b, b
    ld   l, d
    nop
    ld   b, b
    nop
    ld   b, b

label_69EFA::
    nop
    ld   b, b

label_69EFC::
    nop
    ld   b, b
    nop
    ld   l, b
    nop
    ld   l, b

label_69F02::
    nop
    ld   l, h

label_69F04::
    nop
    ld   l, h
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b

label_69F0C::
    nop
    ld   d, b

label_69F0E::
    ld   b, b
    ld   l, [hl]

label_69F10::
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   l, b
    nop
    ld   l, b
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   l, b
    nop
    ld   l, b
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   d, h
    nop
    ld   d, h
    nop
    ld   e, b
    nop
    ld   e, b
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   l, b
    nop
    ld   [hl], b
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   d, h
    nop
    ld   d, h
    nop
    ld   e, b
    nop
    ld   e, b
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    nop
    ld   b, h
    nop
    ld   b, h
    nop
    ld   c, b
    nop
    ld   c, h
    nop
    ld   c, h
    nop
    ld   c, h
    nop
    ld   e, h
    nop
    ld   h, b
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   a, h
    nop
    ld   a, h
    jr   nz, label_69FE6
    jr   nz, label_69FE8
    nop
    ld   b, h
    nop
    ld   b, h
    nop
    ld   c, b
    nop
    ld   c, h
    nop
    ld   c, h
    nop
    ld   c, h
    nop
    ld   e, h
    nop
    ld   e, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   a, h
    nop
    ld   a, h
    jr   nz, label_6A006
    jr   nz, label_6A008
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, h
    nop
    ld   b, h
    nop
    ld   e, b
    nop
    ld   e, b
    nop
    ld   e, b
    nop
    ld   e, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   b, b
    nop
    ld   c, b
    nop
    ld   b, h
    nop
    ld   b, h
    nop
    ld   e, b
    nop
    ld   e, b
    nop
    ld   e, b
    nop
    ld   e, b

label_69FE6::
    nop
    ld   h, b

label_69FE8::
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   c, h
    nop
    ld   c, h
    nop
    ld   d, h

label_6A000::
    nop
    ld   d, h
    nop
    ld   d, h
    nop
    ld   d, h

label_6A006::
    nop
    ld   h, b

label_6A008::
    nop
    ld   h, b
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   l, b
    nop
    ld   e, h
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   b, b

label_6A018::
    nop
    ld   b, b
    nop
    ld   c, h
    nop
    ld   c, h
    nop
    ld   d, h
    nop
    ld   d, h
    nop
    ld   d, h
    nop
    ld   d, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   l, b
    nop
    ld   [hl], b
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   l, b
    nop
    ld   l, b
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   d, b
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   h, h
    nop
    ld   l, b
    nop
    ld   l, b
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   b, b
    nop
    ld   b, h
    nop
    ld   d, h
    nop
    ld   c, b
    nop
    ld   e, b
    nop
    ld   c, h
    nop
    ld   e, h
    nop
    ld   d, b
    nop

label_6A087::
    ld   h, h
    nop

label_6A089::
    ld   b, b

label_6A08A::
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop

label_6A137::
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop

label_6A207::
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b

label_6A226::
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b

label_6A248::
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b

label_6A254::
    nop
    ld   b, b

label_6A256::
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b

label_6A260::
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, h
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   c, b
    nop
    ld   b, b
    nop
    ld   b, h
    nop
    ld   b, b
    nop
    ld   d, b
    nop
    ld   c, h
    nop
    ld   d, h
    nop
    ld   c, h
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, h
    nop
    ld   e, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   e, b

label_6A476::
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    daa

label_6A484::
    daa
    daa

label_6A486::
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    dec  h
    dec  h
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    daa
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    daa
    daa
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    daa
    daa
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    daa
    daa
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    daa
    daa
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    ldi  [hl], a
    ldi  [hl], a
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    ldi  [hl], a
    ldi  [hl], a
    dec  h
    dec  h
    dec  h
    dec  h
    daa
    daa
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    dec  h
    dec  h
    dec  h
    dec  h
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    dec  h
    dec  h
    dec  h
    dec  h
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a

label_6A576::
    push hl
    push bc
    ld   a, [$DBA5]
    and  a
    jp   nz, label_6A58B
    ld   b, $00
    ld   a, [$FFF6]
    ld   c, a

label_6A584::
    ld   hl, label_6A476
    add  hl, bc
    ld   a, [hl]
    ld   [$FFDF], a

label_6A58B::
    ld   b, $00
    ld   a, [$FFF6]
    sla  a
    ld   c, a
    rl   b
    ld   hl, label_69E76
    ld   a, [$DBA5]
    and  a
    jp   z, label_6A630
    ld   a, $23
    ld   [$FFDF], a
    inc  h
    inc  h
    ld   b, $00
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_6A5B2
    ld   hl, label_6A000
    jp   label_6A636

label_6A5B2::
    ld   c, a
    sla  c
    rl   b
    cp   $09
    jr   c, label_6A630
    cp   $0A
    jr   nz, label_6A5C5
    ld   a, [$FFF6]
    cp   $FD
    jr   z, label_6A5D5

label_6A5C5::
    ld   a, [$FFF7]
    cp   $11
    jr   nz, label_6A5D9
    ld   a, [$FFF6]
    cp   $C0
    jr   z, label_6A5D5
    cp   $C1
    jr   nz, label_6A5D9

label_6A5D5::
    ld   c, $1E
    jr   label_6A62A

label_6A5D9::
    ld   a, [$FFF7]
    cp   $0F
    jr   nz, label_6A5E9
    ld   a, [$FFF6]
    cp   $A0
    jr   nz, label_6A5E9
    ld   c, $00
    jr   label_6A62A

label_6A5E9::
    ld   a, [$FFF7]
    cp   $1F
    jr   nz, label_6A5FD
    ld   a, [$FFF6]
    cp   $EB
    jr   z, label_6A5F9
    cp   $EC
    jr   nz, label_6A5FD

label_6A5F9::
    ld   c, $28
    jr   label_6A62A

label_6A5FD::
    ld   a, [$FFF7]
    cp   $10
    jr   nz, label_6A616
    ld   a, [$FFF6]
    cp   $E9
    jr   nz, label_6A60D
    ld   c, $26
    jr   label_6A62A

label_6A60D::
    cp   $B5
    jr   nz, label_6A616
    ld   bc, label_1FE
    jr   label_6A62A

label_6A616::
    ld   a, [$FFF7]
    cp   $16
    jr   nz, label_6A62A
    ld   a, [$FFF6]
    cp   $6F
    jr   z, label_6A62E
    cp   $7F
    jr   z, label_6A62E
    cp   $8F
    jr   z, label_6A62E

label_6A62A::
    ld   a, $24
    ld   [$FFDF], a

label_6A62E::
    inc  h
    inc  h

label_6A630::
    add  hl, bc
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    push bc
    pop  hl

label_6A636::
    pop  bc
    add  hl, bc
    ld   a, h
    ld   [$FFE0], a
    ld   a, l
    ld   [$FFE1], a
    pop  hl
    ret
    dec  l
    ld   l, $43
    ld   b, h
    adc  a, h
    ld   [label_302F], sp
    ld   sp, label_3209
    ld   a, [bc]
    dec  bc
    inc  sp
    inc  c
    inc  [hl]
    dec  [hl]
    ld   [hl], $43
    ld   b, h
    adc  a, h
    ld   [label_3837], sp
    add  hl, sp
    add  hl, bc
    db   $3A ; ldd  a, [hl]
    ld   a, [bc]
    dec  bc
    dec  sp
    inc  c
    inc  a
    and  h
    and  l
    ld   b, e
    ld   b, h
    ld   b, e
    ld   b, h
    ld   b, e
    ld   b, h
    adc  a, h
    ld   [label_88C], sp
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    inc  c
    inc  c
    ld   b, e
    ld   b, h
    ld   b, e
    ld   b, h
    adc  a, h
    ld   [label_88C], sp
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    inc  c
    inc  c
    ld   b, e
    ld   b, h
    ld   b, e
    ld   b, h

label_6A688::
    dec  [hl]
    ld   [hl], $43
    ld   b, h
    adc  a, h
    ld   [label_3837], sp
    add  hl, sp
    add  hl, bc
    db   $3A ; ldd  a, [hl]
    ld   a, [bc]
    dec  bc
    dec  sp
    inc  c
    inc  a
    dec  [hl]
    ld   [hl], $35
    ld   [hl], $37
    jr   c, label_6A6D6
    jr   c, label_6A6DA
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    dec  sp
    inc  a
    inc  a

label_6A6A8::
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0100
    nop
    inc  bc
    inc  bc
    ld   bc, label_201
    ld   [bc], a
    nop
    nop
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0100
    nop
    inc  bc
    inc  bc

label_6A6C2::
    ld   bc, label_201
    ld   [bc], a
    nop
    nop
    ld   bc, label_300
    ld   [bc], a
    ld   bc, label_300
    ld   [bc], a
    ld   bc, label_300
    ld   [bc], a
    ld   [bc], a
    inc  bc

label_6A6D6::
    nop
    ld   bc, label_302

label_6A6DA::
    nop
    ld   bc, $0001
    inc  bc
    ld   [bc], a
    ld   bc, label_300
    ld   [bc], a
    ld   [bc], a
    inc  bc
    nop
    ld   bc, label_302
    nop
    ld   bc, $0001
    inc  bc
    ld   [bc], a

label_6A6F0::
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0100
    nop
    inc  bc
    inc  bc
    ld   bc, label_201
    ld   [bc], a
    nop
    nop
    ld   bc, label_300
    ld   [bc], a
    ld   bc, label_300
    ld   [bc], a
    ld   [bc], a
    inc  bc
    nop
    ld   bc, label_302
    nop
    ld   bc, label_68021
    ld   h, [hl]
    push bc
    ld   a, b
    and  a
    jr   z, label_6A71B
    ld   hl, label_6A688

label_6A71B::
    add  hl, de
    ld   b, $00
    ld   a, [hl]
    sla  a
    rl   b
    sla  a
    rl   b
    ld   c, a
    call label_6A576
    pop  bc
    ld   hl, label_6A6A8
    ld   a, b
    and  a
    jr   z, label_6A736
    ld   hl, label_6A6F0

label_6A736::
    add  hl, de
    ld   b, $00
    ld   a, [hl]
    ld   c, a
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    add  hl, bc
    ld   a, h
    ld   [$FFE0], a
    ld   a, l
    ld   [$FFE1], a
    ret
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    halt
    halt
    ld   e, d
    ld   a, a
    ld   a, a
    ld   e, d
    ld   a, h
    ld   a, h
    ld   a, h
    nop
    ld   a, h
    ld   a, h
    ld   bc, label_6BC02
    ld   a, h
    inc  bc
    ld   a, h
    inc  c
    dec  c
    inc  e
    dec  e
    ld   [hl], d
    ld   [hl], e
    ld   [hl], e
    ld   [hl], d
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    rrca
    rrca
    rrca
    rrca
    ld   c, $0E
    ld   c, $0E
    ld   l, l
    ld   l, l

label_6A783::
    ld   l, l
    ld   l, l
    ld   e, d
    ld   a, a
    inc  b
    inc  b
    inc  d
    inc  d
    ld   a, a
    ld   e, d
    ld   e, d
    dec  d
    ld   a, a
    dec  d
    dec  b
    ld   a, a
    dec  b
    ld   e, d
    ld   e, d
    ld   a, a
    ld   a, a
    rla
    ld   e, d
    ld   a, a
    ld   b, $5A
    ld   e, d
    rlca
    ld   a, a
    ld   e, d
    ld   d, $7F
    ld   a, a
    ld   e, d
    ld   e, d
    dec  d
    inc  b
    jr   label_6A7AF
    ld   a, a
    add  hl, de
    inc  b
    inc  d
    ld   [label_157F], sp
    add  hl, bc
    inc  d
    dec  b
    ld   e, d
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, l
    ld   a, l
    ld   d, $5C
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, [hl]
    ld   l, a
    ld   l, [hl]
    ld   l, a
    ld   a, [$FFF2]
    pop  af
    di
    ld   c, $01
    db   $10 ; Undefined instruction
    ld   c, d
    ld   c, e
    ld   e, d
    ld   e, e
    ld   c, $0F
    ld   e, $1F
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    jr   nz, label_6A800
    jr   nc, label_6A812
    ldi  [hl], a
    inc  hl
    ldd  [hl], a
    inc  sp
    inc  h
    dec  h
    inc  [hl]
    dec  [hl]
    ld   h, $27
    ld   [hl], $37
    jr   z, label_6A810
    jr   nc, label_6A822
    ldi  [hl], a
    add  hl, hl
    ldd  [hl], a
    inc  sp
    ld   c, h
    ld   c, d
    ld   c, b
    ld   e, h
    ld   c, d
    ld   c, d
    ld   b, l
    ld   b, l
    ld   c, d
    ld   c, l
    ld   e, l

label_6A800::
    ld   e, c
    ld   c, b
    ld   d, c
    ld   b, h
    ld   d, [hl]
    ld   b, l
    ld   b, l
    ld   d, l
    ld   d, [hl]
    inc  c
    dec  c
    inc  e
    dec  e
    ld   c, [hl]
    ld   c, c
    ld   b, l

label_6A810::
    ld   d, d
    ld   c, c

label_6A812::
    ld   c, a
    ld   d, c
    ld   b, l
    ld   c, b
    ld   d, c
    ld   d, h
    ld   d, [hl]
    ld   d, d
    ld   e, c
    ld   d, l
    ld   d, a
    ld   b, l
    ld   a, [hli]
    ld   d, l
    db   $3A ; ldd  a, [hl]
    dec  hl

label_6A822::
    ld   b, l
    dec  sp
    ld   d, [hl]
    ld   c, b
    ld   c, c
    ld   c, b
    ld   c, c
    ld   c, c
    ld   e, c
    ld   c, c
    ld   e, c
    ld   b, h
    ld   d, [hl]
    ld   d, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   b, a
    ld   d, l
    ld   d, a
    ld   b, l
    ld   b, c
    ld   b, e
    ld   c, c
    ld   b, d
    ld   b, l
    ld   c, c
    ld   b, b
    ld   b, h
    ld   d, [hl]
    ld   b, h
    ld   d, [hl]
    ld   d, l
    ld   b, a
    ld   d, l
    ld   b, a
    add  hl, bc
    ld   a, h
    ld   d, $0D
    ld   a, h
    ld   a, h
    dec  e
    ld   e, $7C
    add  hl, de
    rra
    jr   label_6A8CA
    ld   [hl], h
    ld   d, [hl]
    ld   d, [hl]
    ld   l, [hl]
    ld   e, d
    ld   e, d
    ld   l, a
    ld   d, b
    ld   d, e
    ld   b, [hl]
    ld   e, b
    ld   b, e
    ld   c, c
    ld   c, b
    ld   c, c
    ld   c, c
    ld   b, b
    ld   c, c
    ld   e, c
    ld   b, l
    ld   a, [hli]
    ld   d, l
    ld   d, [hl]
    dec  hl
    ld   b, l
    ld   d, l
    ld   d, [hl]
    ld   a, a
    ld   a, a
    ld   d, [hl]
    ld   d, [hl]
    ld   c, b
    ld   c, c
    ld   b, l
    ld   d, d
    ld   c, c
    ld   e, c
    ld   d, c
    ld   b, l
    ld   a, h
    ld   a, h
    ld   b, l
    ld   b, l
    ld   d, d
    ld   e, c
    ld   d, l
    ld   b, a
    ld   [bc], a
    ld   e, $12
    inc  de
    ld   a, l
    ld   a, l
    ld   b, l
    ld   b, l
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   e, [hl]
    ld   e, [hl]
    ld   e, a
    ld   e, a
    ld   e, e
    ld   e, e
    ld   e, e
    ld   e, e
    ld   [label_1809], sp
    add  hl, de
    ld   b, $07
    add  hl, bc
    ld   a, h
    rlca
    ld   [label_197C], sp
    add  hl, bc
    ld   a, h
    ld   d, $17
    ld   a, h
    add  hl, de
    rla
    jr   label_6A92A
    ld   a, h
    rla
    rla
    rlca
    rlca
    ld   a, h
    ld   a, h
    inc  l
    dec  l
    inc  a
    dec  a
    db   $F4 ; Undefined instruction
    or   $F5
    rst  $30
    ld   a, l
    ld   a, l
    ld   e, l
    rla
    ld   [bc], a
    inc  bc
    ld   [de], a
    inc  de
    inc  b
    dec  b
    inc  b
    dec  b
    inc  b

label_6A8CA::
    dec  b
    inc  d
    dec  d
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    inc  c
    inc  c
    inc  e
    inc  e
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   c, $7F
    ld   c, $11
    ld   a, a
    inc  de
    inc  b
    dec  b
    inc  d
    dec  d
    ld   b, $07
    ld   d, $17
    ld   [label_1809], sp
    add  hl, de
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_6A8F5::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [de]
    ld   a, [de]
    dec  bc
    dec  bc
    dec  de

label_6A8FC::
    dec  de
    nop
    ld   bc, label_1E0E
    ld   b, d
    ld   b, c
    ld   d, c
    ld   d, d
    jr   c, label_6A940
    ld   d, h
    ld   d, a
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    inc  b
    ld   a, a
    inc  b
    ld   c, $00
    ld   bc, label_1104
    ld   [bc], a
    inc  bc
    ld   [de], a
    dec  b
    rlca
    ld   b, $06
    rlca
    rlca
    dec  bc
    ld   b, $1B
    ld   c, $06
    ld   e, $07
    rrca
    rra
    rrca
    rra
    dec  c

label_6A92A::
    dec  c
    inc  e
    inc  e
    inc  e
    inc  e
    dec  e
    dec  e
    dec  c
    dec  c
    dec  e
    dec  e
    inc  c
    inc  c
    inc  c
    inc  c
    ld   a, h
    ld   a, [bc]
    ld   a, [bc]
    ld   a, a
    ld   a, [de]
    ld   a, h
    ld   a, a

label_6A940::
    ld   a, [de]
    ld   a, [de]
    ld   a, [bc]
    ld   a, a
    ld   a, a
    ld   c, $05
    ld   a, a
    dec  b
    ld   a, h
    ld   a, h
    ld   b, $5C
    ld   a, h
    ld   a, h
    ld   e, l
    rlca
    inc  h
    dec  h
    ld   c, $0F
    ld   h, $27
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   a, h
    nop
    nop
    ld   bc, label_6BC01
    ld   [de], a
    ld   [bc], a
    ld   a, h
    ld   [bc], a
    ld   [de], a
    ld   [de], a
    inc  bc
    ld   a, h
    inc  bc
    ld   [de], a
    ld   a, h
    ld   a, h
    inc  b
    ld   [de], a
    ld   a, h
    dec  b
    ld   [de], a
    ld   [de], a
    ld   b, $7C
    ld   [de], a
    rlca
    ld   a, h
    ld   a, h
    ld   [de], a
    ld   [de], a
    inc  bc
    nop
    add  hl, bc
    ld   [bc], a
    ld   a, h
    ld   [$0100], sp
    dec  bc
    ld   a, h
    inc  bc
    ld   a, [bc]
    ld   bc, label_1202
    ld   [de], a
    ld   a, h
    ld   a, h
    ld   [de], a
    nop
    ld   l, h
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   a, h
    inc  de
    inc  d
    dec  bc
    dec  bc
    dec  de
    dec  de
    nop
    dec  bc
    db   $10 ; Undefined instruction
    dec  bc
    ld   bc, label_111B
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    nop
    dec  bc
    nop
    dec  bc
    dec  bc
    ld   bc, $010B
    add  hl, bc
    add  hl, bc
    add  hl, de
    add  hl, de
    ld   [label_818], sp
    jr   label_6A9B8
    add  hl, bc
    ld   [label_904], sp
    inc  bc
    dec  b
    jr   label_6A9C6
    inc  d
    ld   [de], a
    add  hl, de
    dec  d
    jr   label_6A9DD
    inc  de
    ld   [bc], a

label_6A9C6::
    inc  bc
    ld   [label_6A018], sp
    ld   h, c
    ld   [hl], b
    ld   [hl], c
    ld   h, d
    ld   h, e
    ld   [hl], b
    ld   [hl], c
    nop
    ld   bc, $0100
    ld   [label_1218], sp
    inc  de
    dec  bc
    dec  bc
    dec  bc
    ld   e, $0B
    dec  bc
    ld   e, $1E
    dec  bc
    dec  bc
    ld   e, $0B
    dec  bc
    ld   e, $1B
    ld   e, $1E
    dec  bc
    ld   e, $1B
    inc  d
    ld   a, a
    dec  bc
    dec  de
    ld   a, a
    ld   c, $1E
    ld   e, $0A
    ld   a, [bc]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   e, $1E
    add  hl, bc
    ld   [label_409], sp
    add  hl, de
    inc  d
    ld   e, $1E
    jr   label_6AA11
    dec  b
    inc  b
    dec  d
    inc  d
    ld   e, $1E
    jr   label_6AA1A

label_6AA11::
    dec  b
    add  hl, bc
    dec  d
    add  hl, de
    ld   c, $0F
    rrca
    ld   c, $1E

label_6AA1A::
    ld   e, $09
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, de
    add  hl, de
    nop
    ld   bc, label_1110
    ld   [bc], a
    inc  bc
    ld   [de], a
    inc  de
    ld   b, $07
    ld   d, $17
    inc  c
    dec  c
    inc  e
    dec  e
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    inc  b
    dec  b
    inc  d
    dec  d
    ld   b, $07
    ld   d, $17
    ld   [label_1809], sp
    add  hl, de
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   a, a
    dec  d
    inc  e
    inc  c
    ld   [bc], a
    inc  bc
    dec  c
    dec  e
    ld   a, a
    ld   a, a
    rrca
    rrca
    inc  c
    inc  c
    inc  e
    inc  e
    ld   [bc], a
    ld   bc, label_1112
    ld   c, $0F
    ld   e, $1F
    ld   c, $0F
    ld   e, $1F
    ld   l, b
    ld   l, c
    ld   [hl], a
    ld   c, e
    rrca
    ld   bc, label_1110
    ld   [label_1809], sp
    add  hl, de
    ld   [bc], a
    rra
    ld   [de], a
    inc  de
    ld   c, $1E
    ld   e, $0E
    ld   a, [hl]
    ld   a, [hl]
    rra
    rra
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    inc  b
    dec  b
    inc  d
    dec  d
    ld   b, $07
    ld   d, $17
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    db   $F4 ; Undefined instruction
    or   $F5
    rst  $30
    ld    hl, sp+$FA
    ld   sp, hl
    ei
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    inc  c
    dec  c
    inc  e
    dec  e
    ld   c, $0F
    ld   e, $1F
    ld   b, l
    ld   b, l
    ld   d, l
    ld   d, [hl]
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   c, d
    ld   c, d
    ld   b, l
    ld   b, l
    inc  c
    dec  c
    inc  e
    dec  e
    ld   l, [hl]
    ld   e, d
    ld   e, d
    ld   l, a
    ld   c, c
    ld   b, b
    ld   c, c
    ld   e, c
    ld   b, e
    ld   c, c
    ld   c, b
    ld   c, c
    nop
    nop
    nop
    nop
    ld   e, e
    ld   e, e
    ld   e, e
    ld   e, e
    ld   h, h
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, $2F
    ld   a, $3F
    ld   a, [hl]
    ld   a, [hl]
    rra
    rra
    dec  d
    ld   d, $17
    jr   label_6AB5B
    ld   a, l
    ld   a, l
    ld   a, l
    ld   [hl], h
    inc  c
    ld   [hl], h
    inc  e
    ld   e, $1E
    ld   a, [hl]
    ld   a, [hl]
    ld   l, b
    ld   l, c
    ld   a, b
    ld   a, c
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   c, b
    ld   c, c
    ld   c, b
    ld   e, a
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, a
    ld   l, a
    ld   a, l
    ld   a, l
    ld   c, b
    ld   a, a
    ld   c, b
    ld   a, a
    ld   c, b
    ld   e, [hl]
    ld   c, b
    ld   c, c
    ld   c, c
    ld   e, c
    ld   e, a
    ld   e, c
    ld   a, a
    ld   e, c
    ld   a, a
    ld   e, c
    ld   e, [hl]
    ld   e, c
    ld   c, c
    ld   e, c
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    halt
    halt
    ld   e, d
    ld   a, a
    ld   a, a
    ld   e, d
    ld   a, h
    ld   a, h
    ld   a, h
    nop
    ld   a, h
    ld   a, h
    ld   bc, label_6BC02
    ld   a, h
    inc  bc
    ld   a, h
    inc  c
    dec  c
    inc  e
    dec  e
    ld   [hl], d
    ld   [hl], e
    ld   [hl], e
    ld   [hl], d
    ld   d, e
    ld   h, l
    ld   h, a
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    rrca
    rrca
    rrca
    rrca
    ld   c, $0E
    ld   c, $0E
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   e, d
    ld   a, a

label_6AB5B::
    inc  b
    inc  b
    inc  d
    inc  d
    ld   a, a
    ld   e, d
    ld   e, d
    dec  d
    ld   a, a
    dec  d
    dec  b
    ld   a, a
    dec  b
    ld   e, d
    ld   e, d
    ld   a, a
    ld   a, a
    rla
    ld   e, d
    ld   a, a
    ld   b, $5A
    ld   e, d
    rlca
    ld   a, a
    ld   e, d
    ld   d, $7F
    ld   a, a
    ld   e, d
    ld   e, d
    dec  d
    inc  b
    jr   label_6AB83
    ld   a, a
    add  hl, de
    inc  b
    inc  d
    ld   [label_157F], sp
    add  hl, bc
    inc  d
    dec  b
    ld   e, d
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, l
    ld   a, l
    ld   d, $5C
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   l, [hl]
    ld   l, a
    ld   l, [hl]
    ld   l, a
    ld   a, [$FFF2]
    pop  af
    di
    ld   c, $01
    db   $10 ; Undefined instruction
    ld   c, d
    ld   c, e
    ld   e, d
    ld   e, e
    ld   c, $0F
    ld   e, $1F
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    jr   nz, label_6ABD4
    jr   nc, label_6ABE6
    ldi  [hl], a
    inc  hl
    ldd  [hl], a
    inc  sp
    inc  h
    dec  h
    inc  [hl]
    dec  [hl]
    ld   h, $27
    ld   [hl], $37
    jr   z, label_6ABE4
    jr   nc, label_6ABF6
    ldi  [hl], a
    add  hl, hl
    ldd  [hl], a
    inc  sp
    ld   c, h
    ld   c, d
    ld   c, b
    ld   e, h
    ld   c, d
    ld   c, d
    ld   b, l
    ld   b, l
    ld   c, d
    ld   c, l
    ld   e, l

label_6ABD4::
    ld   e, c
    ld   c, b
    ld   d, c
    ld   b, h
    ld   d, [hl]
    ld   b, l
    ld   b, l
    ld   d, l
    ld   d, [hl]
    inc  c
    dec  c
    inc  e
    dec  e
    ld   c, [hl]
    ld   c, c
    ld   b, l

label_6ABE4::
    ld   d, d
    ld   c, c

label_6ABE6::
    ld   c, a
    ld   d, c
    ld   b, l
    ld   c, b
    ld   d, c
    ld   d, h
    ld   d, [hl]
    ld   d, d
    ld   e, c
    ld   d, l
    ld   d, a
    ld   b, l
    ld   a, [hli]
    ld   d, l
    db   $3A ; ldd  a, [hl]
    dec  hl

label_6ABF6::
    ld   b, l
    dec  sp
    ld   d, [hl]
    ld   c, b
    ld   c, c
    ld   c, b
    ld   c, c
    ld   c, c
    ld   e, c
    ld   c, c
    ld   e, c
    ld   b, h
    ld   d, [hl]
    ld   d, h
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   b, a
    ld   d, l
    ld   d, a
    ld   b, l
    ld   b, c
    ld   b, e
    ld   c, c
    ld   b, d
    ld   b, l
    ld   c, c
    ld   b, b
    ld   b, h
    ld   d, [hl]
    ld   b, h
    ld   d, [hl]
    ld   d, l
    ld   b, a
    ld   d, l
    ld   b, a
    add  hl, bc
    ld   a, h
    ld   d, $0D
    ld   a, h
    ld   a, h
    dec  e
    ld   e, $7C
    add  hl, de
    rra
    jr   label_6AC9E
    ld   [hl], h
    ld   d, [hl]
    ld   d, [hl]
    ld   l, [hl]
    ld   e, b
    ld   e, b
    ld   l, a
    ld   d, b
    ld   d, b
    ld   b, [hl]
    ld   b, [hl]
    ld   b, e
    ld   c, c
    ld   c, b
    ld   c, c
    ld   c, c
    ld   b, b
    ld   c, c
    ld   e, c
    ld   b, l
    ld   a, [hli]
    ld   d, l
    ld   d, [hl]
    dec  hl
    ld   b, l
    ld   d, l
    ld   d, [hl]
    ld   a, a
    ld   a, a
    ld   d, [hl]
    ld   d, [hl]
    ld   c, b
    ld   c, c
    ld   b, l
    ld   d, d
    ld   c, c
    ld   e, c
    ld   d, c
    ld   b, l
    ld   a, h
    ld   a, h
    ld   b, l
    ld   b, l
    ld   d, d
    ld   e, c
    ld   d, l
    ld   b, a
    ld   [bc], a
    ld   e, $12
    inc  de
    ld   a, l
    ld   a, l
    ld   b, l
    ld   b, l
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   e, [hl]
    ld   e, [hl]
    ld   e, a
    ld   e, a
    ld   h, h
    ld   h, h
    dec  bc
    dec  bc
    ld   [label_1809], sp
    add  hl, de
    ld   b, $07
    add  hl, bc
    ld   a, h
    rlca
    ld   [label_197C], sp
    add  hl, bc
    ld   a, h
    ld   d, $17
    ld   a, h
    add  hl, de
    rla
    jr   label_6ACFE
    ld   a, h
    rla
    rla
    rlca
    rlca
    ld   a, h
    ld   a, h
    inc  l
    dec  l
    inc  a
    dec  a
    db   $F4 ; Undefined instruction
    or   $F5
    rst  $30
    ld   a, l
    ld   a, l
    ld   e, l
    rla
    ld   [bc], a
    inc  bc
    ld   [de], a
    inc  de
    inc  b
    dec  b
    inc  b
    dec  b
    inc  b

label_6AC9E::
    dec  b
    inc  d
    dec  d
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    inc  c
    inc  c
    inc  e
    inc  e
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   c, $7F
    ld   c, $11
    ld   a, a
    inc  de
    inc  b
    dec  b
    inc  d
    dec  d
    ld   b, $07
    ld   d, $17
    ld   [label_1809], sp
    add  hl, de
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [de]
    ld   a, [de]
    dec  bc
    dec  bc
    dec  de
    dec  de
    nop
    ld   bc, label_1E0E
    ld   b, d
    ld   b, c
    ld   d, c
    ld   d, d
    jr   c, label_6AD14
    ld   d, h
    ld   d, a
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    inc  b
    ld   a, a
    dec  b
    ld   c, $00
    ld   bc, label_1104
    ld   [bc], a
    inc  bc
    ld   [de], a
    dec  b
    rlca
    ld   b, $06
    rlca
    rlca
    dec  bc
    ld   b, $1B
    ld   c, $06
    ld   e, $07
    rrca
    rra
    rrca
    rra
    dec  c

label_6ACFE::
    dec  c
    inc  e
    inc  e
    inc  e
    inc  e
    dec  e
    dec  e
    dec  c
    dec  c
    dec  e
    dec  e
    inc  c
    inc  c
    inc  c
    inc  c
    ld   a, h
    ld   a, [bc]
    ld   a, [bc]
    ld   a, a
    ld   a, [de]
    ld   a, h
    ld   a, a

label_6AD14::
    ld   a, [de]
    ld   a, [de]
    ld   a, [bc]
    ld   a, a
    ld   a, a
    ld   c, $04
    ld   a, a
    dec  b
    ld   a, h
    ld   a, h
    ld   b, $5C
    ld   a, h
    ld   a, h
    ld   e, l
    rlca
    inc  h
    dec  h
    ld   c, $0F
    ld   h, $27
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   a, h
    nop
    nop
    ld   bc, label_6BC01
    ld   [de], a
    ld   [bc], a
    ld   a, h
    ld   [bc], a
    ld   [de], a
    ld   [de], a
    inc  bc
    ld   a, h
    inc  bc
    ld   [de], a
    ld   a, h
    ld   a, h
    inc  b
    ld   [de], a
    ld   a, h
    dec  b
    ld   [de], a
    ld   [de], a
    ld   b, $7C
    ld   [de], a
    rlca
    ld   a, h
    ld   a, h
    ld   [de], a
    ld   [de], a
    inc  bc
    nop
    add  hl, bc
    ld   [bc], a
    ld   a, h
    ld   [$0100], sp
    dec  bc
    ld   a, h
    inc  bc
    ld   a, [bc]
    ld   bc, label_1202
    ld   [de], a
    ld   a, h
    ld   a, h
    ld   [de], a
    nop
    ld   l, h
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   a, h
    inc  de
    inc  d
    dec  bc
    dec  bc
    dec  de
    dec  de
    nop
    dec  bc
    db   $10 ; Undefined instruction
    dec  bc
    ld   bc, label_111B
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    nop
    dec  bc
    nop
    dec  bc
    dec  bc
    ld   bc, $010B
    add  hl, bc
    add  hl, bc
    add  hl, de
    add  hl, de
    ld   [label_818], sp
    jr   label_6AD8C
    add  hl, bc
    ld   [label_904], sp
    inc  bc
    dec  b
    jr   label_6AD9A
    inc  d
    ld   [de], a
    add  hl, de
    dec  d
    jr   label_6ADB1
    inc  de
    ld   [bc], a

label_6AD9A::
    inc  bc
    ld   [label_6A018], sp
    ld   h, b
    ld   [hl], b
    ld   [hl], b
    ld   h, d
    ld   h, d
    ld   [hl], b
    ld   [hl], b
    nop
    ld   bc, $0100
    ld   [label_1218], sp
    inc  de
    dec  bc
    dec  bc
    dec  bc
    ld   e, $0B
    dec  bc
    ld   e, $1E
    dec  bc
    dec  bc
    ld   e, $0B
    dec  bc
    ld   e, $1B
    ld   e, $1E
    dec  bc
    ld   e, $1B
    inc  d
    ld   a, a
    dec  bc
    dec  de
    ld   a, a
    ld   c, $1E
    ld   e, $0A
    ld   a, [bc]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   e, $1E
    add  hl, bc
    ld   [label_409], sp
    add  hl, de
    inc  d
    ld   e, $1E
    jr   label_6ADE5
    dec  b
    inc  b
    dec  d
    inc  d
    ld   e, $1E
    jr   label_6ADEE

label_6ADE5::
    dec  b
    add  hl, bc
    dec  d
    add  hl, de
    ld   c, $0F
    rrca
    ld   c, $1E

label_6ADEE::
    ld   e, $09
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, de
    add  hl, de
    nop
    ld   bc, label_1110
    ld   [bc], a
    inc  bc
    ld   [de], a
    inc  de
    ld   b, $07
    ld   d, $17
    inc  c

label_6AE02::
    dec  c
    inc  e
    dec  e
    db   $FC ; Undefined instruction

label_6AE06::
    db   $FD ; Undefined instruction

label_6AE07::
    cp   $FF
    inc  b
    dec  b
    inc  d
    dec  d
    ld   b, $07
    ld   d, $17
    ld   [label_1809], sp
    add  hl, de
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    ld   a, a
    dec  d
    inc  e
    inc  c
    ld   [bc], a
    inc  bc
    dec  c
    dec  e
    ld   a, a
    ld   a, a
    rrca
    rrca
    inc  c
    inc  c
    inc  e
    inc  e
    ld   [bc], a
    ld   bc, label_1112
    ld   c, $0F
    ld   e, $1F
    ld   c, $0F
    ld   e, $1F
    ld   l, b
    ld   l, c
    ld   [hl], a

label_6AE38::
    ld   c, e
    rrca
    ld   bc, label_1110
    ld   [label_1809], sp
    add  hl, de
    ld   [bc], a
    rra
    ld   [de], a

label_6AE44::
    inc  de
    ld   c, $1E

label_6AE47::
    ld   e, $0E
    ld   a, [hl]
    ld   a, [hl]
    rra
    rra
    ld   l, d
    ld   l, e
    ld   a, d
    ld   a, e
    inc  b

label_6AE52::
    dec  b
    inc  d
    dec  d
    ld   b, $07
    ld   d, $17
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    db   $F4 ; Undefined instruction
    or   $F5
    rst  $30
    ld    hl, sp+$FA
    ld   sp, hl
    ei
    ld   a, [bc]
    dec  bc
    ld   a, [de]
    dec  de
    inc  c
    dec  c
    inc  e
    dec  e
    ld   c, $0F
    ld   e, $1F
    ld   b, l
    ld   b, l
    ld   d, l
    ld   d, [hl]
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   c, d
    ld   c, d
    ld   b, l
    ld   b, l
    inc  c
    dec  c
    inc  e
    dec  e
    ld   l, [hl]
    ld   e, d
    ld   e, d
    ld   l, a
    ld   c, c
    ld   b, b
    ld   c, c
    ld   e, c
    ld   b, e
    ld   c, c
    ld   c, b
    ld   c, c
    nop
    nop
    nop
    nop
    ld   e, e
    ld   e, e
    ld   e, e
    ld   e, e
    ld   h, h
    ld   h, h
    ld   h, [hl]
    ld   h, [hl]
    ld   l, $2F
    ld   a, $3F
    ld   a, [hl]
    ld   a, [hl]
    rra
    rra
    dec  d
    ld   d, $17
    jr   label_6AF2F
    ld   a, l
    ld   a, l
    ld   a, l
    ld   [hl], h
    inc  c
    ld   [hl], h
    inc  e
    ld   e, $1E
    ld   a, [hl]
    ld   a, [hl]
    ld   l, b
    ld   l, c
    ld   a, b
    ld   a, c
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   c, b
    ld   c, c
    ld   c, b
    ld   e, a
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, a
    ld   l, a
    ld   a, l
    ld   a, l
    ld   c, b
    ld   a, a
    ld   c, b
    ld   a, a
    ld   c, b
    ld   e, [hl]
    ld   c, b
    ld   c, c
    ld   c, c
    ld   e, c
    ld   e, a
    ld   e, c
    ld   a, a
    ld   e, c
    ld   a, a
    ld   e, c
    ld   e, [hl]
    ld   e, c
    ld   c, c
    ld   e, c
    ld   h, c
    ld   h, e
    ld   [hl], c
    ld   e, b
    ld   h, e
    ld   h, c
    ld   e, b
    ld   [hl], c
    ld   [hl], c
    ld   e, b
    ld   h, c
    ld   h, e
    ld   e, b
    ld   [hl], c
    ld   h, e
    ld   h, c
    ld   h, e
    ld   h, e
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   h, e
    ld   h, e
    ld   [hl], c
    ld   a, h
    ld   [hl], c
    ld   a, h
    ld   a, h
    ld   [hl], c
    ld   a, h
    ld   [hl], c
    ld   h, e
    ld   h, e
    ld   h, e
    ld   h, e
    ld   [hl], c
    ld   [hl], c
    ld   [hl], c
    ld   [hl], c
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h

label_6AF1D::
    ld   d, l
    ld   d, [hl]
    ld   a, [bc]
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F

label_6AF2F::
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    inc  b
    dec  b
    ld   h, h
    ld   h, l
    ld   b, $07
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    inc  d
    dec  d
    ld   h, [hl]
    ld   h, a
    ld   d, $17
    ld   d, l
    ld   d, [hl]
    halt
    ld   [hl], d
    ld   [hl], e
    halt
    ld   [hl], d
    ld   [hl], e
    ld   l, b
    ld   l, c
    halt
    ld   [hl], e
    ld   [hl], d
    halt
    ld   [hl], e
    ld   [hl], d
    ld   [hl], a
    ld   c, e
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    halt
    halt
    ld   [hl], d
    ld   [hl], e
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    halt
    halt
    ld   [hl], e
    ld   [hl], d
    ld   l, l
    ld   l, l
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, l
    ld   l, l
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h

label_6AF81::
    ld   d, l
    ld   d, [hl]
    ld   a, [bc]
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    inc  b
    dec  b
    ld   h, h
    ld   h, h
    ld   b, $07
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    inc  d
    dec  d
    ld   h, [hl]
    ld   h, [hl]
    ld   d, $17
    ld   d, l
    ld   d, [hl]
    halt
    ld   [hl], d
    ld   [hl], e
    halt
    ld   [hl], d
    ld   [hl], e
    ld   l, b
    ld   l, c
    halt
    ld   [hl], e
    ld   [hl], d
    halt
    ld   [hl], e
    ld   [hl], d
    ld   [hl], a
    ld   c, e
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    halt
    halt
    ld   [hl], d
    ld   [hl], e
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    halt
    halt
    ld   [hl], e
    ld   [hl], d
    ld   l, l
    ld   l, l
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, l
    ld   l, l
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h
    ld   l, h

label_6AFE5::
    ld   d, l
    ld   d, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   d, l
    ld   d, [hl]
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l

label_6B049::
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  hl
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  hl
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
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

label_6B0AD::
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
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
    ld   h, d
    ld   l, e
    ld   a, [$FFFE]
    and  a
    jr   z, label_6B152
    push bc
    push hl
    ld   a, [hl]
    dec  a
    ld   e, a
    sla  a
    sla  a
    sla  a
    add  a, e
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_6B049
    ld   a, [$FFE8]
    and  $01
    jr   z, label_6B134
    ld   hl, label_6B0AD

label_6B134::
    add  hl, de
    ld   d, h
    ld   e, l
    ld   c, $0A
    ld   hl, $DC91
    ld   a, [$DC90]
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $09
    ldi  [hl], a

label_6B148::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    dec  c
    jr   nz, label_6B148
    xor  a
    ld   [hl], a
    pop  hl
    pop  bc

label_6B152::
    ld   a, [hl]
    dec  a
    ld   e, a
    sla  a
    sla  a
    sla  a
    add  a, e
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_6AFE5
    ld   a, [$FFE8]
    and  $01
    jr   nz, label_6B173
    ld   hl, label_6AF1D
    ld   a, [$FFFE]
    and  a
    jr   z, label_6B173
    ld   hl, label_6AF81

label_6B173::
    add  hl, de
    push hl
    ld   a, [$D600]
    ld   e, a
    ld   d, b
    add  a, $0D
    ld   [$D600], a
    ld   hl, $D601

label_6B182::
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $09
    ldi  [hl], a
    pop  de
    push bc
    ld   c, $0A

label_6B190::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_6B190
    ld   [hl], b
    pop  bc
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

label_6B237::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6B285::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6B486::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6B644::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6B738::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6B8D1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6B937::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6BC01::
    nop

label_6BC02::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6BC50::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
