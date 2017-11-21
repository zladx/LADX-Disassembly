section "bank42",romx,bank[$2A]

label_A8000::
    nop
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
    rst  $38
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    adc  a, a
    add  a, h
    adc  a, b
    add  a, b
    adc  a, b
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
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    ld   b, d
    ld   b, d
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    ld   b, d
    ld   b, d
    inc  a
    inc  a
    rst  $38
    rst  $38
    jr   label_A805C
    inc  h
    inc  h
    inc  h
    inc  h
    jr   label_A8062
    nop
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    inc  bc
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $F101

label_A805C::
    inc  hl
    ld   de, label_1101
    rst  $38
    nop

label_A8062::
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
    nop
    rst  $38
    rst  $38
    nop
    add  a, b
    adc  a, b
    add  a, b
    adc  a, b
    ret  nz
    adc  a, b
    add  a, b
    adc  a, b
    add  a, b
    adc  a, b
    add  a, h
    adc  a, b
    add  a, b
    adc  a, b
    add  a, b
    adc  a, b
    jr   label_A809A
    inc  h
    inc  h
    inc  h
    inc  h
    jr   label_A80A0
    nop
    nop
    nop
    nop
    nop
    nop
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
    db   $10
    db   $0F

label_A809A::
    rrca
    nop
    nop
    nop
    nop
    nop

label_A80A0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$08
    ld   a, [$FFF0]
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0111
    ld   de, label_1101
    ld   bc, $0111
    ld   de, label_1121
    ld   bc, $0111
    ld   de, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    nop
    nop
    nop
    nop
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
    adc  a, b
    add  a, b
    adc  a, b
    add  a, h
    adc  a, b
    add  a, b
    adc  a, b
    ret  nz
    adc  a, b
    add  a, b
    adc  a, b
    add  a, b
    adc  a, b
    add  a, b
    adc  a, b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rrca
    inc  c
    jr   label_A810A
    jr   nc, label_A811C
    ld   l, a
    ld   c, a
    ld   e, b
    ld   e, a
    rrca
    rra
    rst  $38
    ld   a, [$FFE0]
    nop
    nop
    nop
    nop
    nop

label_A810A::
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    cp   $FE
    rst  $38
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop

label_A811C::
    rlca
    rlca
    ld   a, [de]
    add  hl, de
    nop
    nop
    ret  nz
    ret  nz
    ld    hl, sp+$38
    ld   e, $06
    rlca
    ld   bc, $0001
    ld   [$FFE0], a
    ld   [hl], b
    ld    hl, sp+$00
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
    ret  nz
    ret  nz
    ld   h, b
    ld   h, b
    jr   nc, label_A8142
    ld   de, label_1101
    ld   hl, $0111
    ld   de, label_1101
    ld   bc, $0111
    ld   de, label_1103
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_A816C

label_A816C::
    nop
    nop
    nop
    nop
    add  a, h
    adc  a, b
    add  a, b
    adc  a, a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    adc  a, a
    add  a, h
    adc  a, b
    add  a, b
    adc  a, b
    nop
    nop
    nop
    rst  $38
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
    nop
    nop
    rst  $38
    ld   bc, $0101
    ld   bc, label_3939
    ld   l, a
    rst  0
    rst  0
    add  a, e
    or   e
    or   d
    ld   [$FFA0], a
    add  a, b
    add  a, b
    add  a, b
    nop
    add  a, a
    rlca
    ld   [label_1008], sp
    db   $10
    db   $10
    stop
    nop
    ld   h, b
    ld   h, b
    jr   nz, label_A81D4
    db   $10
    db   $10
    nop
    add  a, b
    ld   b, b
    ld   b, b
    jr   nz, label_A81DC
    jr   nz, label_A81DE
    jr   nz, label_A81E0
    jr   nz, label_A81E2
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
    jr   label_A81E6
    jr   nz, label_A81F0
    inc  c
    inc  c
    ld   [bc], a
    ld   [bc], a

label_A81D4::
    ld   bc, $0101
    ld   bc, $0000
    ld   [$FFE0], a

label_A81DC::
    db   $10
    db   $30

label_A81DE::
    jr   label_A81F8

label_A81E0::
    ld   [hl], b
    jr   label_A820B
    rra
    jr   c, label_A81F2

label_A81E6::
    sub  a, h
    adc  a, h
    sbc  a, h
    add  a, h
    adc  a, h
    add  a, a
    ld   a, [bc]
    ld   b, $0E
    ld   [bc], a

label_A81F0::
    ld   hl, $0111
    pop  af
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_23F1
    ld   de, label_1101
    add  a, a
    adc  a, a
    sbc  a, a
    sbc  a, a
    cp   a
    cp   a
    cp   h
    cp   $F0
    cp   $E8

label_A820B::
    db   $FC ; Undefined instruction
    add  a, b
    db   $FC ; Undefined instruction
    ret  nz
    cp   h
    ld    hl, sp+$F0
    call c, label_68C
    inc  b
    inc  de
    ld   [hl], d
    ld   l, e
    sbc  a, d
    ld   d, c
    xor  c
    ld   [hl], c
    adc  a, l
    ld   hl, label_1DD
    ld   bc, $0101
    ld   bc, label_301
    ld   e, $12
    ld   c, $0E
    ld   [bc], a
    rlca
    rlca
    ccf
    jr   c, label_A81D4
    ld   a, [de]
    ld   h, d
    ld   a, [de]
    ld   [hl], d
    ld   a, [bc]
    db   $76 ; Halt
    ld   c, $7B
    dec  bc
    ld   a, [hl]
    ccf
    rst  $30
    call z, label_98EF
    nop
    nop
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ccf
    ccf
    rst  $18
    ld   [$FF7F], a
    add  a, b
    rst  $38
    nop
    nop
    nop
    jr   nz, label_A8272
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld    hl, sp+$78
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    nop
    jr   nz, label_A8282
    jr   nz, label_A8284
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    ld    hl, sp+$18
    ld   [label_808], sp
    ld   [label_808], sp
    nop
    nop
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    inc  d
    nop
    nop
    rrca
    inc  bc

label_A8282::
    rrca
    ld   [bc], a

label_A8284::
    rrca
    ld   [bc], a
    inc  c
    nop
    inc  e
    nop
    jr   label_A828C

label_A828C::
    ld   de, $0101
    ld   bc, $E0E0
    cp   b
    jr   label_A8299
    inc  c
    inc  b
    inc  b
    ld   b, $02
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    nop
    nop
    nop
    nop
    nop
    nop
    cp   b
    jr   c, label_A8325
    ld   b, h
    ld   c, h
    ld   b, h
    ld   c, h
    ld   b, h
    ld   c, h
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    ldi  [hl], a
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
    nop
    ret  nz
    ret  nz
    ld   [rNR41], a
    ld   h, b
    jr   nz, label_A832D
    jr   nz, label_A832F
    jr   nz, label_A8271
    ret  nz
    nop
    nop
    rlca
    inc  bc
    dec  d
    ld   c, $00
    nop
    nop
    nop
    inc  bc
    ld   bc, label_602
    db   $ED ; Undefined instruction
    sub  a, b
    add  a, c
    db   $FC ; Undefined instruction
    or   d
    cp   $EA
    cp   $FE
    rst  $38
    cp   a
    rst  $38
    rst  $38
    cp   a
    db   $E8 ; add  sp, d
    ld   a, [$FF71]
    adc  a, l
    ld   d, c
    xor  l
    ld   [hl], c
    adc  a, l
    and  e
    ld   e, c
    and  e
    ld   e, c
    ld   b, a
    ldd  [hl], a
    cp   a
    add  a, [hl]
    ld   a, a
    db   $FC ; Undefined instruction
    ld   h, c
    ld   b, b
    rst  0
    add  a, b
    rra
    nop
    jr   nc, label_A8338
    ld   b, b
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    add  a, c
    add  a, c
    rst  $30
    sbc  a, b
    rst  $38
    sub  a, b
    cp   a
    ret  nc
    ld   [hl], a
    ld   a, b
    dec  bc
    inc  c
    ld   b, $07
    ld   bc, $8101
    add  a, b
    nop
    nop
    ld   [rJOYP], a
    rst  $38

label_A8325::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18

label_A832D::
    ld   [$FFFE], a

label_A832F::
    ccf
    ccf
    nop
    ld   h, $01
    rst  $20
    nop
    rst  $38
    nop

label_A8338::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $F4 ; Undefined instruction
    inc  c
    db   $3A ; ldd  a, [hl]
    add  a, $19
    rst  $20
    ret
    ld   [hl], a
    db   $E8 ; add  sp, d
    scf
    ld   [$FF3F], a
    and  b
    ld   a, a
    ld   h, c
    rst  $38
    nop
    nop
    ccf
    ccf
    ret  nz
    ret  nz
    nop
    nop
    add  a, b
    add  a, b
    ld    hl, sp+$80
    add  a, h
    add  a, b
    nop
    nop
    inc  bc
    inc  bc
    stop
    ld    hl, sp+$C8
    inc  a
    inc  a
    inc  sp
    inc  de
    add  hl, de
    ld   [label_818], sp
    jr   label_A8378
    ld   a, [$FF00+C]
    ld   [hl], e
    ld   d, e
    ld   [hl], h
    ld   d, a
    db   $E4 ; Undefined instruction
    and  a

label_A8378::
    adc  a, a
    adc  a, b
    adc  a, a
    adc  a, b
    ret  nc
    ld   e, a
    ld   [$FF3F], a
    nop
    nop
    nop
    nop
    ld   a, [$FFF0]
    ld   c, $FE
    add  a, c
    ld   a, a
    ld    hl, sp+$07
    cp   $01
    ld   a, [hl]
    add  a, c
    ld   bc, $0111
    ld   de, label_1121
    ld   bc, $8111
    sub  a, c
    ld   h, c
    pop  af
    ld   de, $FBF1
    adc  a, c
    ld   c, h
    ld   b, h
    ld   a, a

label_A83A3::
    ld   a, a
    ld   a, a
    ld   a, a
    jp   label_9CFF
    db   $FC ; Undefined instruction
    and  b
    ld   a, [$FF54]
    call nc, label_9C9C
    ld   [bc], a
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    inc  bc
    and  b
    and  b
    push hl
    push hl
    rst  $30
    rlca
    ld   h, b
    jr   nz, label_A83A3
    ld   [$FFE0], a
    ld   [$FFF0], a
    ld   a, [$FFF8]
    ld    hl, sp+$7C
    ld    hl, sp+$3C
    inc  a
    ld   e, $1E
    ld   bc, label_201
    inc  bc
    inc  b
    ld   b, $04
    ld   b, $08
    inc  c
    ld   [label_80C], sp
    inc  c
    inc  b
    inc  b
    rst  $20
    inc  hl
    or   e
    ld   [hl], c
    pop  af
    pop  af
    ld   d, c
    ld   sp, label_3113
    cp   [hl]
    ld   a, [hl]
    sbc  a, h
    db   $FC ; Undefined instruction
    inc  [hl]
    inc  e
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    add  a, c
    add  a, c
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ld    hl, sp+$38
    rst  $38
    rla
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    add  a, [hl]
    add  a, d
    ld   b, $04
    ld   b, $04
    ld   b, $04
    ld   c, $0C
    ei
    cp   $03
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
    rst  $38
    rst  $38
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  c
    ld   [$9EFF], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    add  a, b
    add  a, b
    jr   label_A845A
    jr   nc, label_A8464
    ld   a, [$FF00]
    jr   nc, label_A8488
    inc  c
    inc  c

label_A845A::
    ld   b, $06
    ld   [bc], a
    ld   [bc], a
    inc  bc
    ld   [bc], a
    or   b
    rra
    jr   nc, label_A8483

label_A8464::
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    jr   nc, label_A84AB
    sub  a, b
    ld   a, a
    ld    hl, sp+$0F
    ccf
    ret  nz
    rra
    ld   [$FF1F], a
    ld   [rIF], a
    ld   a, [$FF0F]
    pop  af
    rrca
    pop  af
    rrca
    pop  af
    rrca
    pop  af
    sbc  a, c
    adc  a, c
    cp   l

label_A8483::
    add  a, l
    cp   l
    add  a, l
    cp   l
    add  a, l

label_A8488::
    dec  a
    dec  b
    add  hl, sp
    add  hl, bc
    ld   a, e
    add  hl, bc
    ld   a, c
    add  hl, bc
    add  a, e
    add  a, b
    ld   d, e
    ld   d, c
    ld   [hl], a
    ld   [hl], e
    rlca
    inc  bc
    ld   b, $07
    ld   d, [hl]
    ld   d, e
    ld   [hl], d
    ld   [hl], e
    add  a, c
    ld   bc, label_AA0FC
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    ld   c, $FC
    ld   b, $FE
    ld   b, $FC
    rlca
    rst  $38
    sbc  a, a
    ld    hl, sp+$1E
    ld   e, $AF
    xor  a
    rst  $28
    rst  $28
    rrca
    rrca
    xor  a
    xor  a
    rst  $28
    rst  $28
    rst  $18
    rst  8
    ld   a, e
    cpl
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   [$FFC0], a
    and  b
    ld   [$FFF0], a
    or   b
    ld   b, $04
    inc  b
    ld   b, $02
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ldi  [hl], a
    inc  bc
    ld   bc, $0001
    nop
    ld   [$0000], sp

label_A84E3::
    nop
    ld   bc, $0100
    inc  bc
    nop
    nop
    nop
    nop
    add  a, l
    inc  bc
    and  $FF
    ld   a, $16
    ccf
    ld   a, a
    cp   $DF
    cp   h
    rra
    ld   e, h
    scf
    ld   a, h
    rst  $20
    sbc  a, a
    rst  $38
    ld   e, e
    rst  $20
    ld   h, c
    jr   nz, label_A84E3
    and  b
    pop  hl
    pop  hl
    ld   b, d
    ld   a, [$C272]
    and  c
    pop  bc
    pop  bc
    pop  bc
    pop  hl
    pop  hl
    rst  $38
    ld   a, $FF
    ccf
    rst  $38
    rst  $38
    ld   h, a
    ld   a, [hl]
    ld   a, a
    ld   c, h
    rst  8
    ld    hl, sp+$DF
    ld    hl, sp+$9F
    add  a, h
    nop
    nop
    ret  nz
    nop
    ld   a, [$FFE0]
    rst  $38
    rra
    rst  $38
    ld   bc, label_3FC
    ld   sp, hl
    rlca
    di
    ld   c, $1C
    ld   [label_1C3C], sp
    ld   a, a
    ld   a, [hl]
    pop  hl
    rst  $38
    ld   a, a
    ld   [$FF7F], a
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   bc, $C301
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    ld   h, b
    sbc  a, a
    sub  a, b
    sbc  a, a
    sub  a, b
    adc  a, b
    adc  a, b
    sbc  a, b
    adc  a, b
    jr   c, label_A856E
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, a
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    ccf
    ld    hl, sp+$16
    inc  bc
    ld   [bc], a
    ld   b, $04
    ld   b, $04
    jr   label_A8570
    ld   a, [$FFF0]
    ret  nz
    ret  nz
    ret  nz
    ret  nz

label_A856E::
    ret  nz
    ret  nz

label_A8570::
    ld   [hl], h
    rrca
    inc  a
    rlca
    inc  c
    rlca
    inc  c
    rlca
    inc  c
    rlca
    inc  c
    rlca
    inc  l
    rlca
    jr   c, label_A858F
    ld   c, $F2
    ld   e, $E2
    ld   e, $E2
    inc  e
    db   $E4 ; Undefined instruction
    dec  a
    call nz, label_C43D
    dec  sp
    ret  z
    ld   a, e

label_A858F::
    adc  a, b
    ld   a, c
    add  hl, bc
    ld   [hl], c
    ld   de, label_11F1
    pop  af
    ld   de, label_31E1
    pop  hl
    ld   sp, label_31E1
    pop  bc
    ld   d, c
    sub  a, h
    sub  a, h
    call c, label_AA19C
    pop  bc
    ld   sp, hl
    ld   h, c
    rst  $18
    inc  a
    ld   [hl], e
    adc  a, a
    rra
    ld   [rJOYP], a
    rst  $38
    ld   l, a
    ld   l, b
    rlca
    ld   b, $4A
    ld   c, d
    rst  8
    adc  a, $FF
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    ld   [hl], e
    ccf
    ld   h, e
    ccf
    ld   [hl], e
    cpl
    di
    cpl
    di
    rst  8
    rst  $20
    rra
    adc  a, a
    ld   a, a
    rrca
    db   $FC ; Undefined instruction
    or   b
    rst  $38
    ret  nc
    or   b
    rst  $18
    or   b
    rst  $18
    cp   [hl]
    db   $FD ; Undefined instruction
    sbc  a, a
    db   $FD ; Undefined instruction
    sub  a, e
    rst  $10
    dec  [hl]
    and  a
    ld   [hl], l
    nop
    rst  $38
    inc  bc
    nop
    rst  $38
    nop
    di
    inc  c
    di
    ld   [hl], b
    adc  a, a

label_A85EB::
    ld    hl, sp+$EF

label_A85ED::
    sbc  a, [hl]
    sub  a, c
    rra
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_1FE
    xor  $11
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc

label_A85FE::
    db   $FC ; Undefined instruction
    inc  bc
    nop
    rst  $38
    nop
    ret  nz
    rra
    add  a, b
    ccf
    add  a, b

label_A8608::
    ld   a, a
    add  a, b
    inc  sp
    adc  a, h
    inc  sp
    add  a, b
    ccf
    add  a, b
    rlca
    rst  $38
    inc  a
    inc  c
    or   $18
    rst  $28
    jr   nc, label_A8608
    jr   nc, label_A861A
    jr   nz, label_A861C
    jr   nz, label_A85FE
    ld   h, b
    rst  $28
    sbc  a, a
    di
    ld   c, a
    ld   a, e
    daa
    ld   a, l
    inc  hl
    ld   a, a
    ld   de, label_113F
    ccf
    ld   de, label_109F
    add  a, b
    pop  bc
    ld   e, [hl]
    adc  a, h
    inc  de
    sbc  a, [hl]
    inc  d
    adc  a, e
    ld   e, $81
    inc  d
    adc  a, e
    ld   e, [hl]
    add  a, c
    add  a, h
    set  4, c
    ld   [$FF78], a
    ld    hl, sp+$26
    ld   a, [hl]
    and  c
    ccf
    db   $10
    db   $BF
    jr   nc, label_A85EB
    jr   nc, label_A85ED
    ld   sp, $E39F
    ld  [$FF00+C], a
    ccf
    ld   e, $07
    inc  bc
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    ld   [hl], b
    ld   a, [$FF7F]
    rst  $38
    db   $E3 ; Undefined instruction
    add  a, a
    rst  $38
    ccf
    ret  z
    ld   b, a
    ld   [$FFE0], a
    ld   a, a
    rra
    rlca
    inc  b
    inc  c
    ld   [$9199], sp
    di
    ld  [$FF00+C], a
    rst  $38
    ret  nz
    ccf
    ccf
    ld   a, [$FF00+C]
    rst  $38
    rrca
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   h, b
    rst  $38
    add  a, b
    ld   a, a
    db   $FC ; Undefined instruction
    ld   [hl], a
    inc  b
    rst  0
    call nz, label_3F7F
    ld   e, $08
    rrca
    inc  b
    ld   a, [$FF63]
    ret  nz
    xor  h
    ld   sp, hl
    add  a, c
    add  a, e
    add  a, e
    add  a, [hl]
    add  a, [hl]
    ld    hl, sp+$F8
    nop
    nop
    stop
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, d
    add  a, d
    ld   h, [hl]
    ld   [bc], a
    ld   [hl], $24
    ld   [hl], $14
    dec  sp
    ld   [de], a
    add  hl, sp
    ld   hl, label_F18
    inc  b
    rrca
    inc  b
    rrca
    inc  d
    rrca
    jr   label_A86C9
    jr   z, label_A86DB

label_A86BC::
    ret  nc
    ccf
    ld   [rIE], a
    ld   a, e
    cp   b
    set  1, b
    add  a, a
    add  a, h
    add  a, a
    add  a, h
    rst  8

label_A86C9::
    ld   c, b
    rst  $30
    jr   nc, label_A86BC
    ld   hl, label_A81CF
    pop  bc
    ld   d, c
    pop  bc
    ld   d, c
    and  c
    sub  a, c
    add  a, c
    sub  a, c
    add  a, c
    sub  a, c
    add  a, c

label_A86DB::
    sub  a, c
    ld   bc, label_311
    ld   de, $0000
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    cp   a
    ld   b, b
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $28
    db   $10
    db   $FE
    ld   bc, label_FF7
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   a, a
    rst  $38
    add  a, b
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    rst  $38
    ccf
    ret  nz
    rst  $38
    ld   sp, hl
    rlca
    rrca
    inc  de
    ld   c, $02
    ld   e, $23
    ld   e, $03
    ld   a, a
    ld   h, e
    sbc  a, a
    ld   h, e
    sbc  a, a
    rst  $38
    db   $E3 ; Undefined instruction
    cp   a
    ld   a, a
    xor  $72
    ld   h, a
    ld   h, [hl]
    and  $67
    db   $FD ; Undefined instruction
    daa
    push af
    ei
    ld   e, $FF
    rst  $38
    pop  hl
    ld   e, a
    db   $3A ; ldd  a, [hl]
    ld   e, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   [hl], d
    rst  $38
    ld   a, $22
    rst  $20
    ld   a, [label_AB1E7]
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    rst  $38
    ld   b, b
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    rst  $38
    ret  nz
    sbc  a, a
    db   $10
    db   $9F
    db   $10
    db   $9F
    db   $10
    db   $9F
    db   $10
    db   $9F
    db   $10
    db   $9F
    db   $10
    db   $9F
    db   $10
    db   $9F
    db   $10
    db   $E4
    jp   label_E0D0
    db   $EC ; Undefined instruction
    ld   a, [$FFF8]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   b
    rst  $38
    ld   [hl], d
    rra
    ld   h, l
    ld   a, $B7
    ld   a, h
    ld   e, e
    db   $FC ; Undefined instruction
    adc  a, a
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$F1
    inc  bc
    ld   sp, hl
    ld   bc, $00F8
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, [hl]
    ld   b, d
    ld   h, [hl]
    ld   b, h
    db   $E4 ; Undefined instruction
    call nz, label_C4EC
    db   $EC ; Undefined instruction
    call nz, label_E4AC
    cp   $A4
    sbc  a, $74
    ld   c, $06
    inc  e
    ld   [label_1030], sp
    jr   nc, label_A87D8
    ld   hl, label_2120

label_A87BB::
    ld   hl, label_2121
    ld   hl, label_721
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0102
    rst  0
    ld   b, b
    adc  a, a
    add  a, b
    rlca
    nop
    rlca
    nop
    rla
    db   $10
    db   $C8
    nop
    rst  $38
    add  a, a
    cp   $FF
    sbc  a, [hl]
    rst  $38

label_A87D8::
    or   e
    rst  8
    sbc  a, c
    rst  $20
    adc  a, l
    di
    adc  a, l
    di
    ld   a, a
    ld   a, a
    pop  hl
    rst  $38
    ld   b, b
    rst  $38
    ld   [$FF3F], a
    ld   [hl], b
    sbc  a, a
    jr   c, label_A87BB
    db   $10
    db   $EF
    adc  a, b
    rst  $30
    add  a, b
    rst  $38
    add  a, c
    cp   $81
    cp   $41
    cp   $21
    cp   $21
    cp   $23
    db   $FD ; Undefined instruction
    inc  hl
    db   $FD ; Undefined instruction
    rst  8
    ld   b, c
    sbc  a, $43
    sbc  a, $42
    sbc  a, [hl]
    add  a, d
    cp   h
    add  a, h
    cp   h
    add  a, a
    inc  a
    inc  b
    ld   a, b
    ld   [$C03F], sp
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
    or   $09
    or   $09
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_A8830::
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
    rst  $30
    ld   [$00FF], sp
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
    xor  a
    ld   d, b
    xor  l
    ld   d, d
    xor  l
    ld   d, d
    ld   h, d
    sbc  a, a
    ld   [hl], d
    adc  a, [hl]
    jp   label_E33E
    ld   e, $E3
    ld   e, $C3
    ld   a, $D7
    inc  l
    rst  $10
    inc  l
    nop
    rst  $38
    jr   nc, label_A8864

label_A8864::
    rst  $38
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    ld   b, $FC
    inc  b
    db   $E8 ; add  sp, d
    inc  e
    db   $E8 ; add  sp, d
    jr   label_A887F
    rst  $38
    inc  bc
    nop
    rst  $38
    db   $FC ; Undefined instruction
    rra
    dec  sp
    rrca
    dec  c
    ld   b, $06
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a

label_A887F::
    ld   [bc], a
    ld   a, a
    ret  nz
    ld   a, a
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $18
    ld   [$FFBE], a
    and  b
    xor  [hl]
    or   b
    sbc  a, a
    db   $10
    db   $BF
    ld   de, label_21BF
    cp   a
    ld   hl, label_213F
    ccf
    ld   hl, label_237C
    ld   a, h
    ld   b, e
    adc  a, b
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    ld   [label_17FF], sp
    ld    hl, sp+$1F
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    ld   a, [$FF9F]
    ld   a, [$FF9F]
    ld   a, [$FF9F]
    ld   a, [$FF9F]
    ld   a, [$FFFC]
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ei
    ld   e, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   c, a
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, [hl]
    ld   sp, $F121
    ld   hl, $F9FF
    rst  $38
    rrca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    ld   de, label_133F
    db   $FC ; Undefined instruction
    rra
    ld    hl, sp+$FF
    inc  c
    rst  $38
    ld   e, $07
    sbc  a, a
    ld   bc, $00BF
    inc  b
    ei
    inc  b
    ei
    inc  b
    ei
    inc  b
    ei
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld    hl, sp+$7F
    adc  a, [hl]
    pop  af
    add  a, h
    ei
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b

label_A891D::
    rst  $38
    ld   b, b

label_A891F::
    rst  $38
    inc  hl
    db   $FD ; Undefined instruction
    inc  hl
    db   $FD ; Undefined instruction
    ld   h, $FA
    ld   h, $FA
    ld   l, $F2
    ld   l, l
    call nc, label_E45D
    db   $E4
    db   $E4 ; Undefined instruction
    ld   a, b
    ld   [label_878], sp
    ld   [hl], b
    db   $10
    db   $F0
    db   $10
    db   $F0
    db   $10
    db   $E0
    jr   nz, label_A891D
    jr   nz, label_A891F
    jr   nz, label_A8940
    rst  $38
    ld   a, a
    add  a, b
    scf
    adc  a, b
    ccf
    add  a, b
    ccf
    add  a, b
    ld   a, a
    add  a, b
    cpl
    ret  nc
    nop
    rst  $38
    rst  $38
    rst  $38
    cp   $03
    cp   $03
    ld   a, $C3
    ld   a, $03
    cp   $03
    ld   a, [$FF00+C]
    inc  bc
    cp   $FF
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
    add  a, b
    ld   a, a
    rst  $38
    rst  $38
    ld   d, $FD
    ld   d, $FD
    ld   d, $FD
    ld   d, $FD
    inc  d
    rst  $38
    inc  [hl]
    rst  $18
    db   $F4 ; Undefined instruction
    rra
    rst  $38
    ld    hl, sp+$7F
    add  a, b
    scf
    adc  a, b
    ccf
    add  a, b
    ccf
    add  a, b
    ld   a, a
    add  a, b
    cpl
    ret  nc
    nop
    rst  $38
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    jr   c, label_A8960
    jr   c, label_A89A2
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld   [label_2F8], sp
    ld   [bc], a

label_A89A2::
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
    cp   h
    sub  a, b
    cp   e
    adc  a, h
    rst  $38
    rst  $38
    rst  $38
    sbc  a, b
    rst  $38
    add  a, a
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ld    hl, sp+$47
    ld   [$FF9F], a
    rst  $38
    rst  $38
    cp   $03
    cp   $02
    cp   $E2
    db   $FC ; Undefined instruction
    ld   e, $FC
    inc  b
    ld   a, a
    rst  $38
    add  a, [hl]
    cp   $01
    add  a, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, a
    ld   a, [$FF6F]
    ld   [hl], b
    sub  a, a
    sbc  a, b
    ld   c, a
    ret  z
    dec  hl
    ld   l, h
    rla
    inc  [hl]
    rla
    inc  [hl]
    rla
    inc  d
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   sp, hl
    nop
    ld   sp, hl
    ld   bc, label_1F9
    ccf

label_A8A01::
    inc  b
    scf
    inc  c
    scf
    inc  c
    scf
    rrca
    ld   a, a
    dec  bc
    ld   a, [hl]
    dec  bc
    ld   l, [hl]
    dec  de
    ld   l, [hl]
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    cp   $E0
    ld   a, $FE
    rlca
    rst  $38
    inc  b
    rst  $38
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    ld   [$FF3F], a
    ld    hl, sp+$F8
    rra
    ld    hl, sp+$0F
    rst  $38
    rlca
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
    ld   c, e
    rst  $38
    rst  $38
    rst  $38
    rst  0
    cp   a
    ld    hl, sp+$07
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   sp, hl
    adc  a, b
    ld   sp, hl
    db   $E8 ; add  sp, d
    ei
    ld    hl, sp+$13
    ld   a, [$FFF3]
    db   $10
    db   $F7
    db   $10
    db   $F7
    ld   de, label_21E7
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
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
    inc  bc
    cp   $03
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    db   $E3 ; Undefined instruction
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    db   $F4 ; Undefined instruction
    rra
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    ld   [label_8FC], sp
    inc  c
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, $E5
    ld   b, $03
    ld   [bc], a
    ld   [bc], a
    inc  bc
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
    ld   [bc], a
    jp   label_FF02
    inc  bc
    rst  $38
    ret  nz
    cp   a
    or   b
    adc  a, a
    adc  a, [hl]
    add  a, c
    add  a, c
    ret  nz
    ret  nz
    ld   a, [$FF30]
    rst  8
    rrca
    ld    hl, sp+$00
    db   $E4 ; Undefined instruction
    inc  b
    db   $E4 ; Undefined instruction
    inc  b
    call nz, label_C404
    call nz, label_B4B4
    adc  a, h
    adc  a, h
    call nz, label_FC84
    xor  $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  [hl]
    inc  d
    rla
    ld   d, $17
    dec  d
    rla
    inc  d
    rla
    ld   d, $17
    dec  d
    rla
    inc  d
    rla
    inc  d
    ei
    ld   bc, label_273
    adc  a, a
    add  a, d
    rst  $38
    ld   a, a
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   c, label_A8B0E
    rlca
    call c, label_DC3F
    ccf
    cp   b
    ld   a, a
    pop  af
    rst  $38
    rst  $38
    ld   e, $FF
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    inc  c
    rst  $38
    jr   label_A8B23
    ccf
    rst  $38
    and  $FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   a, a
    cp   $FF
    cp   $CF
    cp   $43
    db   $FC ; Undefined instruction
    add  a, e
    db   $FC ; Undefined instruction
    add  a, e
    db   $FC ; Undefined instruction
    add  a, a
    ld    hl, sp+$07
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    inc  bc
    cp   $03
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, a
    ld   [$FF7F], a
    rst  $38
    rra
    pop  af
    ccf
    ld  [$FF00+C], a
    xor  $22
    xor  $23
    sbc  a, $42
    call c, label_DC44
    ld   b, h
    ld    hl, sp+$C8
    ld    hl, sp+$08
    rst  $38
    rrca
    nop
    nop
    nop
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
    rst  $38
    rst  $38
    ld   hl, $0111
    pop  af
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_301
    ld   bc, rIE
    nop
    rst  $38
    ld   e, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    nop
    nop
    inc  bc
    cp   $03
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    ld   [bc], a
    ld   b, $03
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
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
    db   $10
    db   $FF
    nop
    rst  $38
    nop
    db   $F4 ; Undefined instruction
    rra
    or   $1C
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    ld   bc, label_1FF
    ld   bc, $000E
    nop
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
    ld   bc, $817F
    rst  $38
    add  a, c
    cp   a
    ret  nz
    ld   a, a
    ld   b, b
    ccf
    jr   nz, label_A8C3C
    db   $10
    db   $0F
    ld   [$E0FF], sp
    rst  $38
    inc  a
    db   $E3 ; Undefined instruction
    inc  hl
    rst  $38
    sbc  a, a
    ld   a, [$FF90]
    rst  $38
    ld   c, b
    db   $FC ; Undefined instruction
    ld   c, h
    cp   $26
    inc  e
    ld   e, $C4
    ld   b, $FC
    ld   b, $FC
    and  $5C
    ld   a, [hl]
    ld   e, h
    ld   a, [hl]
    cp   [hl]
    rst  $38
    cp   [hl]
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
    rla
    inc  d
    rla
    inc  d
    rla
    inc  d
    rla
    rla
    rla
    rla
    rla
    inc  d

label_A8C3C::
    inc  d
    inc  d
    inc  d
    inc  d
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    nop
    ret  nc
    nop
    db   $E8 ; add  sp, d
    add  a, b
    ld    hl, sp+$F8
    rlca
    rlca
    nop
    nop
    inc  bc
    inc  bc
    rst  $38
    ccf
    rra
    nop
    cpl
    nop
    rla
    nop
    cpl
    nop
    rst  $18
    ret  nz
    ld   a, a
    ld   a, a
    ld   [rIE], a
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_2FF
    di
    ld   c, $FF
    cp   $FB
    ld   a, [$F477]
    rst  $30
    nop
    rst  $30
    nop
    rst  $20
    nop
    rst  $28
    nop
    rst  $28
    nop
    rst  $28
    nop
    rst  8
    nop
    rst  $18
    nop
    db   $FC ; Undefined instruction
    rlca
    rst  $38
    rlca
    rst  $38
    add  hl, bc
    rst  $38
    ld   [label_10FF], sp
    rst  $38
    db   $10
    db   $FF
    db   $10
    db   $EF
    inc  l
    rst  $38
    ld  [$FF00+C], a
    rst  $38
    ld   [bc], a
    rst  $38
    call nz, label_38FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF1F]
    ld   a, [$FF10]
    cp   $10
    ld   [rNR41], a
    ld   [rNR41], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    nop
    rlca
    nop
    nop
    nop
    nop

label_A8CBD::
    nop
    nop

label_A8CBF::
    nop
    ld   [bc], a
    inc  bc
    db   $3A ; ldd  a, [hl]
    inc  bc
    ld   [bc], a
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    inc  e
    db   $F4 ; Undefined instruction
    rra
    cp   b
    ld   e, b
    ld   a, [$FF10]
    ret  nc
    jr   nc, label_A8CBD
    jr   nc, label_A8CBF
    jr   nc, label_A8CF1

label_A8CF1::
    nop
    jr   c, label_A8CF4

label_A8CF4::
    nop
    rst  $38
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
    dec  b
    ld   b, $03
    inc  bc
    nop
    rst  $38
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    rst  $38
    inc  de
    rst  $38
    add  hl, bc
    cp   $C5
    ld   a, $33
    rrca
    rrca
    ld   bc, $0001
    nop
    nop
    nop
    ccf
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    rra
    rst  $38
    pop  bc
    rst  $38
    inc  a
    ccf
    inc  bc
    inc  bc
    nop
    nop
    ret  nz
    nop
    ld   [hl], b
    add  a, b
    cp   $80
    rst  $38
    add  a, b
    cp   a
    ret  nz
    ld   a, a
    ret  nz
    rst  $18
    ld   [rNR14], a
    inc  d
    dec  bc
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    dec  bc
    ld   a, [$FB0B]
    dec  bc
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    nop
    rra
    ld   [rIE], a
    nop
    rst  $38
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    ld   bc, label_FFF
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ret  nz
    nop
    nop
    rst  $30
    db   $F4 ; Undefined instruction
    rst  $38
    call nz, label_F8FF
    rst  $38
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld   a, [$FF1F]
    db   $10
    db   $BF
    nop
    cp   a
    nop
    cp   a
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    db   $E3 ; Undefined instruction
    inc  hl
    ld   [rNR41], a
    ld   [$FF3F], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ld    hl, sp+$F8
    add  a, a
    rst  $38
    cp   $81
    ld   a, l
    ld   h, e
    ld   e, $FF
    jr   nz, label_A8DE7
    ld   h, b
    ld   a, a
    ld   b, b
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$F8
    sub  a, h
    db   $EC ; Undefined instruction
    ld   c, $F3
    ld   b, $FA
    ld   c, $F2
    dec  bc
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    jp   nz, label_0
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
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

label_A8DE7::
    nop
    nop
    nop
    rrca
    nop
    nop
    nop
    nop
    nop
    inc  bc
    ld   [bc], a
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   b, $03
    ld   [bc], a
    inc  bc
    add  a, c
    ld   bc, $0000
    nop
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    cp   e
    ld   b, h
    xor  a
    ld   d, b
    xor  a
    ld   d, b
    db   $ED ; Undefined instruction
    jp   nc, label_3F3F
    call c, label_A9030
    or   b
    ld   d, b
    or   b
    db   $10
    db   $F0
    ld   d, b
    or   b
    ld   h, b
    and  b
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
    rlca
    nop
    nop
    nop
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
    cp   $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_A8E72
    db   $10
    db   $0F
    ld   [label_407], sp
    inc  bc
    ld   [bc], a
    add  a, c
    ld   bc, $0000
    nop
    nop
    cp   $02
    cp   $02
    rst  $38
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b
    rst  $38
    rst  $38

label_A8E72::
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    db   $E3 ; Undefined instruction
    rst  $38
    or   b
    or   e
    ret  c
    ld   e, b
    rst  $28
    cpl
    or   $16
    ld   [$FFE0], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    rst  $38
    nop
    ccf
    add  a, c
    add  a, e
    rst  $38
    rst  $38
    ld   e, $10
    ld   a, $20
    cp   $E0
    db   $FC ; Undefined instruction
    ld   [$FFFD], a
    ret  nz
    push af
    ret  z
    ld   sp, hl
    ret  nz
    ld   a, e
    ret  nz
    ld   a, a
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_3FE
    cp   $03
    cp   $03
    db   $FC ; Undefined instruction
    rlca
    cp   $83
    ld   b, h
    rst  $38
    ld   [hl], b
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    ld   bc, $00FE
    rst  $38
    dec  c
    ld   a, [$FF00+C]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2BFE
    call nc, label_A857
    ld   c, $F0
    cp   h
    ld   b, b
    ld   [hl], h
    add  a, h
    inc  [hl]
    call nz, label_8E8
    ld   c, a
    adc  a, b
    sub  a, b
    db   $10
    db   $20
    jr   nz, label_A8F1D
    ld   b, b
    add  a, b
    add  a, b
    nop
    rst  $38
    ccf
    nop
    nop
    nop
    nop
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
    rst  $38
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
    rst  $38
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

label_A8F1D::
    nop
    nop
    nop
    ccf
    ld   a, [$FF0F]
    inc  c
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
    db   $FD ; Undefined instruction
    dec  c
    cp   $02
    ld   a, a
    add  a, c
    rst  $38
    ld   a, [$FFFF]
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    rst  $38
    ld   h, b
    ld   a, a
    sub  a, b
    sbc  a, a
    rst  0
    ld   b, [hl]
    pop  af
    or   c
    ld   a, h
    ld   a, h
    rlca
    rlca
    nop
    nop
    ld   sp, hl
    add  a, b
    di
    ret  nz
    inc  bc
    ld   a, [$FF87]
    ld   a, [hl]
    cp   $C1
    ccf
    inc  a
    ret  nz
    ret  nz
    ccf
    ccf
    db   $FC ; Undefined instruction
    rlca
    db   $F4 ; Undefined instruction
    rrca
    call nz, label_F83F
    ld   a, a
    ld   a, a
    add  a, b
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    dec  b
    ld   a, [label_A90AF]
    ld   a, $C0
    ld   sp, hl
    ld   bc, label_686
    ld   a, b
    ld   a, b
    add  a, b
    add  a, b
    pop  af
    ld   bc, label_6C7
    jr   label_A8F9E
    ld   h, b
    ld   h, b
    db   $FC ; Undefined instruction
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
    ld   [hl], h
    nop
    nop
    nop
    nop
    nop

label_A8F9E::
    nop
    rst  $38
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
    rra
    nop
    nop
    rst  $38
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    nop
    nop
    ld   a, [$FF00]
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
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

label_A8FDF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    or   b
    rrca
    ld   a, [$FF0F]
    db   $E3 ; Undefined instruction
    inc  e
    adc  a, $31
    sbc  a, h
    ld   h, e
    inc  a
    jp   label_C738
    jr   nc, label_A8FDF
    ret  nc
    rrca
    ld   l, b
    add  a, a
    inc  e

label_A9015::
    db   $E3 ; Undefined instruction
    inc  c
    di
    inc  b
    ei
    jr   nc, label_A902B
    inc  c
    jp   label_C12E
    pop  af
    ld   c, $E0
    rra
    ld   [rNR32], a
    swap b
    ld   d, a
    and  b
    ld   a, $C1
    inc  a
    jp   label_C738

label_A9030::
    db   $02

label_A9031::
    ld   [bc], a
    ld   l, c
    add  a, [hl]
    rra
    ld   [rIF], a
    ld   a, [$FF00]
    rst  $38
    jr   nc, label_A904B
    dec  bc
    rst  0
    inc  l
    rst  0
    ret  z
    rlca
    db   $EC ; Undefined instruction
    inc  bc
    inc  a
    jp   label_AA39C
    inc  c
    di
    or   b

label_A904B::
    rrca
    jr   z, label_A9015
    inc  [hl]
    jp   label_E11A
    adc  a, [hl]
    ld   [hl], c
    rst  $28
    db   $10
    db   $87
    ld   a, b
    ld   [hl], a
    adc  a, b
    ei
    inc  b
    dec  e
    ld   [bc], a
    ld   c, $01
    jr   nc, label_A9031
    inc  hl
    call c, label_F00D
    dec  de
    ld   [$FF3E], a
    pop  bc
    inc  a
    jp   label_BC43
    inc  e
    ld   [rNR34], a
    rst  $20
    ld   c, $F3
    rst  0
    add  hl, sp
    inc  sp
    call z, label_8778
    inc  e
    db   $E3 ; Undefined instruction
    push hl
    ld   a, [de]
    dec  sp
    inc  b
    jr   nc, label_A9051
    ldi  [hl], a
    call c, label_F00F
    rla
    ld   [rNR34], a
    pop  hl
    inc  a
    jp   label_C43B
    and  h
    ld   e, b
    ld   h, a
    ld   e, a
    inc  sp
    ld   l, a
    jr   c, label_A90CD
    rrca
    rra
    nop
    nop
    inc  b
    inc  bc
    jr   nz, label_A90BD
    add  a, b
    ld   a, a
    sub  a, b
    ld   a, [$FF10]
    ld   a, [$FF20]
    ld   [$FFC0], a
    ret  nz
    jr   nz, label_A90C9
    nop
    rst  $38
    nop
    rst  $38
    nop

label_A90AF::
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_A90D7
    nop
    rst  $38
    nop
    rst  $38
    nop

label_A90BD::
    rst  $38
    nop
    rst  $38
    ccf
    ld   a, [hl]
    dec  sp
    inc  a
    ccf
    jr   c, label_A90DE
    ld    hl, sp+$14

label_A90C9::
    ei
    add  hl, de
    rst  $38

label_A90CC::
    rrca

label_A90CD::
    rst  $38
    rlca
    rst  $38
    ld   [rJOYP], a
    add  a, b
    rrca
    nop
    ld   a, a
    rrca

label_A90D7::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38

label_A90DE::
    ld   a, [$FFFF]
    inc  c
    inc  b
    inc  b
    db   $F4 ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    ld   a, [$FFFF]
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b

label_A90F9::
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop

label_A9104::
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_A90CC
    inc  b
    ld    hl, sp+$01
    cp   $00
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   bc, label_3800
    nop
    inc  e
    nop
    inc  c
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    sbc  a, h
    nop
    jr   c, label_A912C

label_A912C::
    jr   nc, label_A912E

label_A912E::
    nop
    nop
    ld   [bc], a
    ld   bc, label_304
    ld   [label_807], sp
    rlca
    ld   [label_807], sp
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $8040
    jr   nz, label_A9104
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    jr   nz, label_A910E
    ld   b, b
    add  a, b
    add  a, b
    ld   a, a
    jr   nz, label_A9173
    inc  b
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_A9187
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

label_A9173::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_A9199
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_A9187::
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b

label_A9199::
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_4FE
    ld    hl, sp+$20
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
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, label_301
    ld   [bc], a
    inc  bc
    ld   b, $03
    ld   [bc], a
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  c
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    ld   c, $FF
    rra
    rst  $38
    ld   h, b
    rst  $38
    add  a, a
    rst  $38
    rra
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   a, [$FFFF]
    db   $FC ; Undefined instruction
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ret  nz
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ret  nz
    ld   h, b
    ret  nz
    ld   b, b
    ld   [rNR41], a
    ld   [rNR42], a
    pop  hl
    ldd  [hl], a
    db   $E3 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    ld   h, b
    ld   a, a
    adc  a, a
    ld   a, [$FF38]
    ret  nz
    ld   [hl], b
    add  a, b
    inc  b
    rrca
    ld   [label_180F], sp
    rrca
    ld   [label_101F], sp
    rra
    jr   nc, label_A928B
    db   $10
    db   $3F
    jr   nz, label_A92AF
    ld   bc, label_2FF
    rst  $38
    inc  b
    rst  $38
    ld   [label_17FF], sp
    rst  $38
    inc  a
    rst  $38
    inc  hl
    rst  $38
    ld   e, c
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    ld   a, a

label_A928B::
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
    cp   $FF
    ld    hl, sp+$FE
    ld   [$FFF8], a
    ret  nz
    ld   [rIE], a
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    add  a, b
    ld   a, [$FF00]
    add  a, b
    nop
    nop
    nop
    nop
    nop

label_A92AF::
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    nop
    rra
    ld   [label_C1F], sp
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    rlca
    ccf
    ld   bc, $0007
    ld   bc, $0000
    nop
    nop
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    rra
    ld   a, a
    ld   l, a
    rra
    inc  h
    rst  $30
    inc  d
    rst  $38
    add  hl, de
    cp   $19
    cp   $09
    cp   $09
    cp   $08
    rst  $38
    inc  b
    rst  $38
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    jr   nz, label_A9351
    ld   h, b
    ccf
    jr   nz, label_A9395
    ld   b, b
    ld   a, a
    ret  nz
    ld   a, a
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    ld   b, $FE
    inc  c
    db   $FC ; Undefined instruction
    ret  nz
    rst  $38
    daa
    rst  $38
    sbc  a, a
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rra
    rra
    rrca
    rrca
    rlca
    rrca
    rst  $38
    rst  $38
    cp   $FF
    db   $FD ; Undefined instruction
    cp   $F9
    db   $FC ; Undefined instruction
    pop  af
    ld    hl, sp+$E1
    ld   a, [$FFC1]
    pop  hl
    add  a, e
    pop  bc
    nop

label_A9351::
    ret  nz
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld    hl, sp+$80
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rla
    ld   c, $15
    rrca
    dec  c
    rlca
    inc  c
    rlca
    inc  c
    rlca
    ld   a, [bc]
    rlca
    ld   a, [bc]
    rlca
    dec  bc
    rlca
    ld   a, [$FF00]
    ret  nz
    nop
    ld   a, [$FF00]
    ld   [$FF80], a
    ld   a, [$FF80]
    ld   a, h
    ret  nz
    ld   a, a
    rst  $38
    rst  $38
    ret  nz
    nop
    nop
    nop
    nop
    nop

label_A9395::
    nop
    nop
    nop
    ld   bc, label_300
    nop
    rst  $38
    ld   sp, hl
    or   $0F
    ld   [hl], a
    rrca
    ld   a, e
    rlca
    db   $FD ; Undefined instruction
    ld   b, e
    ld   a, [hl]
    pop  bc
    ld   a, l
    ret  nz
    db   $FC ; Undefined instruction
    ret  nz
    ld   a, b
    ret  nz
    ld   [hl], b
    ret  nz
    ld   [rIE], a
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld   a, b
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, a
    inc  a
    ld   a, a
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    inc  bc
    rst  $38
    ld   bc, label_3FF
    rst  $38
    ld   a, a
    add  a, b
    ccf
    ret  nz
    rrca
    ld   a, [$FF00]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   [rIE], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
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
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    add  hl, de
    rst  $38
    di
    rra
    ccf
    ccf
    ld   hl, $E33F
    ccf
    rst  $38
    ld   a, a
    rlca
    rlca
    inc  bc
    add  a, a
    add  a, e
    add  a, a
    add  a, e
    add  a, a
    add  a, e
    add  a, a
    add  a, e
    add  a, a
    add  a, e
    add  a, a
    add  a, a
    adc  a, a
    rst  $38
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    cp   $FA
    db   $FC ; Undefined instruction
    cp   $F8
    rst  $30
    ld    hl, sp+$FE
    ld   a, [$FFEC]
    ld   a, [$FF03]
    add  a, c
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, label_306
    ld   b, $03
    ld   b, $03
    ld   b, $03
    ld    hl, sp+$80
    ld   a, b
    ret  nz
    ld   a, h
    ld   [$FF3C], a
    ld   [$FF3E], a
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    ld   sp, hl
    ld   c, $FB
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rra
    inc  e
    ld   a, a
    ld   h, b
    rst  $38
    add  a, b
    ld   a, a
    add  a, b
    rrca
    ld   b, $3F
    jr   c, label_A9464
    ret  nz
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
    rrca
    db   $FD ; Undefined instruction
    inc  bc
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
    ret  nz
    ret  nz
    ld    hl, sp+$38
    cp   $06
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ccf
    ccf
    rra
    ccf
    ld   a, $1F
    rst  $28
    ld   e, $FE
    adc  a, $FE
    ld   a, $E7
    ld   e, $FD
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38

label_A94BF::
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, rIE
    ld   bc, $0101
    ld   bc, rSB
    ld   bc, label_1FF
    rst  $38
    rst  $38
    add  a, b
    ret  nz
    sbc  a, a
    add  a, b
    cp   a
    add  a, b
    rst  $38
    add  a, b
    db   $FC ; Undefined instruction
    add  a, e
    ld    hl, sp+$87
    ld    hl, sp+$87
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    cp   c
    add  a, $B9
    add  a, $BF
    ret  nz
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  8
    jr   nc, label_A94CC
    nop
    rst  $38
    nop
    ld   h, e
    rst  $38
    rst  $38
    rst  $38
    sbc  a, $FE
    ld   e, h
    call c, label_C040
    ret  nz
    ret  nz
    and  c
    rst  $20
    rst  $18
    rst  $38
    rlca
    rrca
    rrca
    rra
    rrca
    rra
    rra
    ccf
    ccf
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    rst  $38
    ld   [$FFD8], a
    ld   [rIE], a
    ret  nz
    cp   a
    ret  nz
    rst  $18
    ld   [$FF3F], a
    ld   a, [$FF0F]
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  c
    rlca
    inc  c
    rlca
    inc  c
    rlca
    sbc  a, b
    rrca
    jr   label_A9549
    ret  c
    rrca
    ld    hl, sp+$0F
    ld   a, [$FF1F]
    inc  c
    rst  $38
    ld   [label_10FF], sp
    rst  $38
    jr   nz, label_A9547
    jr   nz, label_A9549
    ld   b, c
    cp   $81
    cp   $81
    cp   $F8
    rlca
    pop  af
    ld   c, $E1
    ld   e, $E3
    inc  e
    jp   label_C33C
    dec  a
    add  a, e
    ld   a, [hl]
    ld   b, $FC
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    inc  c
    ld    hl, sp+$30
    ld   [$FFC0], a
    add  a, b
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   [hl], b
    ld   [$FF80], a
    nop
    nop

label_A9576::
    nop
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
    nop
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
    ret  nz
    ccf
    jr   c, label_A95A4
    ld   b, $03
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    rst  $38
    ld   a, a
    rst  $38

label_A95A4::
    ld   a, a
    rst  $38
    ret  nz
    rst  $38
    ld   h, b
    ld   a, a
    ccf
    db   $10
    db   $1F
    ld   [label_C07], sp
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    ld   bc, $9DFF
    ld   h, e
    sbc  a, l
    ld   h, e
    db   $FD ; Undefined instruction
    inc  bc
    cp   c
    rst  0
    rst  $38
    rst  $38
    sbc  a, c
    rst  $20
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    and  l
    jp   label_C0BF
    adc  a, a
    ld   a, [$FF8F]
    ret  nz
    cp   a
    ret  nz
    cp   c
    add  a, $B9
    add  a, $BF
    ret  nz
    cp   a
    ret  nz
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   [$FF80], a
    ret  nz
    cp   a
    rst  $18
    and  b
    ret  nc
    and  b
    ret  nc
    and  b
    ret  nc
    and  b
    cp   a
    rst  $38
    ret  nz
    rst  $38
    cp   a
    rst  $38
    add  a, e
    rst  $38
    cp   a
    rst  $38
    add  a, a
    rst  $38
    adc  a, a
    rst  $38
    sbc  a, a
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    inc  bc
    cp   $01
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
    pop  af
    rra
    ld   a, [$FF00+C]
    call nc, label_A94BF
    rst  $38
    jr   z, label_A9629
    ld   [label_10FF], sp
    rst  $38
    db   $10
    db   $FF
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    ld   a, $FF
    inc  b
    db   $FC ; Undefined instruction
    ld   [label_10F8], sp
    ld   a, [$FF60]
    ld   [rBGPI], a
    ret  nz
    ld   a, [$FFC0]
    db   $EB ; Undefined instruction
    add  a, b
    rst  $38
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc

label_A9657::
    inc  bc
    rrca
    inc  c
    cp   a
    db   $10
    db   $FC
    jr   nz, label_A9657
    ld   b, b
    nop
    nop
    rrca
    nop
    rst  $38
    ccf
    ld   a, [$FFC0]
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
    rst  $38
    inc  bc
    rst  $38
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
    cp   $80
    rst  $38
    cp   $0F
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    inc  b
    inc  bc
    ld   b, $C5
    inc  bc
    push af
    jp   label_AB1AF
    ld   d, [hl]
    add  hl, sp
    ld   a, [hli]
    dec  e
    ld   d, $0D
    db   $FD ; Undefined instruction
    inc  bc
    pop  af
    rrca
    pop  af
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    sbc  a, l
    db   $E3 ; Undefined instruction
    sbc  a, l
    db   $E3 ; Undefined instruction
    rst  $38
    add  a, a
    ei
    sbc  a, h
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    ret  nc
    and  b
    ret  nc
    and  b
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nc
    and  b
    ret  nc
    and  b
    ret  nc
    and  b
    ret  nc
    and  b
    cp   a
    rst  $38
    sbc  a, a
    rst  $38
    rst  0
    rst  $38
    ld   b, a
    rst  $38
    ld   c, a
    rst  $38
    ld   b, a
    rst  $38
    ret  nc
    ld   a, a
    rst  $28
    ld   a, a
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   $FF
    db   $10
    db   $FF
    db   $10
    db   $FF
    jr   nz, label_A9705
    jr   nz, label_A9707
    jr   nz, label_A9709
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    ccf
    pop  hl
    ld   a, [de]
    ld   a, [$FF1C]
    ld   a, [$FF1E]
    ld    hl, sp+$1C
    ld    hl, sp+$0F
    ld    hl, sp+$0B
    ld    hl, sp+$0D
    ld    hl, sp+$FF
    add  a, c
    rst  $38
    ld   b, c
    ld   a, [hl]
    inc  hl
    ccf
    ld   [de], a
    dec  e
    ld   d, $1F
    inc  d
    sbc  a, e
    adc  a, h
    jp  c, label_AB04C
    add  a, b
    ld   [rJOYP], a
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_1000
    nop
    jr   c, label_A9744

label_A9744::
    jr   z, label_A9756
    ld   [label_A8830], sp
    jr   nc, label_A976F
    ld   a, b
    call nc, label_AB478
    ret  c
    nop
    nop
    nop
    nop
    nop
    nop

label_A9756::
    nop
    nop
    ld   [label_800], sp
    nop
    inc  c
    nop
    ld   c, $00
    dec  bc
    ld   b, $06
    inc  bc
    dec  b
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    ld   bc, $0100
    ld   bc, $EE00
    ld   [hl], c
    db   $D3 ; Undefined instruction
    ld   h, c
    db   $E3 ; Undefined instruction
    pop  bc
    and  e
    pop  bc
    dec  bc
    ret
    di
    sbc  a, c
    db   $EB ; Undefined instruction
    or   c
    xor  e
    pop  af
    ret  nc
    and  b
    rst  $18
    and  b
    ld   [$FF80], a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    call z, label_FC03
    inc  bc
    cpl
    ld   a, a
    and  a
    ld   a, a
    daa
    ld   a, a
    inc  de
    rst  $38
    ld   sp, hl
    rst  $38
    jr   label_A979B
    add  hl, hl
    rst  $18
    dec  sp
    rst  8
    rrca
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, [$FFE0]
    add  a, b
    cp   b
    ret  nz
    db   $F4 ; Undefined instruction
    ret  nz
    ret  c
    ld   [$FFF8], a
    ld   [$FFEC], a
    ld   a, [$FF80]
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, c
    rst  $38
    adc  a, a
    cp   $77
    ld   [hl], b
    rlca
    nop
    dec  c
    ld    hl, sp+$0C
    ld    hl, sp+$0A
    db   $FC ; Undefined instruction
    ld   a, [hl]
    db   $FC ; Undefined instruction
    call nz, label_8286
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $AA01
    ld   l, h
    ld   [$EA2C], a
    dec  l
    ld   [$FE2E], a
    inc  l
    ld   a, b
    inc  l
    ld   e, l
    add  hl, sp
    ld   [hl], b
    jr   label_A97E2
    nop

label_A97E2::
    ld   [bc], a
    ld   bc, label_305
    ld   a, [de]
    rlca
    ld   l, l
    rra
    or   c
    ld   a, c
    pop  bc
    pop  af
    ld   b, c
    ld   [$FFB6], a
    ret  c
    sbc  a, d
    adc  a, h
    dec  de
    adc  a, h
    dec  c
    ld   b, $0D
    ld   b, $86
    inc  bc
    add  a, c
    ld   bc, $80C0
    rrca
    nop
    rrca
    inc  b
    dec  b
    ld   b, $02
    rlca
    add  a, a
    inc  bc
    add  a, d
    ld   [bc], a
    ld   b, c
    add  a, c
    or   b
    ret  nz
    add  a, b
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld   a, h
    add  a, b
    sbc  a, a
    ld   [$FF71], a
    ld   a, [hl]
    ld   e, $0F
    add  a, e
    add  a, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    ld   [bc], a
    ret  nz
    ld   [bc], a
    inc  [hl]
    jp   nz, label_F4CA
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
    ei
    and  c
    di
    and  c
    pop  af
    and  e
    rst  $30
    jp   label_C3E7
    db   $EB ; Undefined instruction
    add  a, a
    rst  $28
    add  a, a
    rst  $38
    rst  0
    and  l
    jp   label_F3BF
    jp  c, label_EFCF
    adc  a, $FC
    add  a, $F7
    call nz, label_C7FB
    ld    hl, sp+$E1

label_A9860::
    cp   a
    ret  nz
    adc  a, a
    ld   a, [$FF8F]
    ret  nz
    cp   a
    ret  nz
    cp   h
    jp   label_E39C
    ret  nz
    ld   a, a
    rst  $38
    ld   sp, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    jr   label_A9860
    nop
    db   $FC ; Undefined instruction

label_A987B::
    inc  bc
    nop
    rst  $38
    rst  $38
    push af
    push af
    rrca
    db   $FC ; Undefined instruction
    rlca
    ld   a, [$E607]
    dec  de
    push hl
    inc  bc
    ccf
    pop  bc
    nop
    rst  $38
    rst  $38
    xor  a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    adc  a, a
    rst  $38
    ccf
    rst  $38
    inc  bc
    rst  $38
    cp   a
    rst  $38
    ld   c, a
    rst  $38
    cp   $F0
    or   $F8
    db   $FC ; Undefined instruction
    ld    hl, sp+$FB
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    ld   b, $00
    ld   b, $00
    inc  c
    nop
    inc  c
    nop
    db   $E8 ; add  sp, d
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    rlca
    ld   a, a
    sbc  a, b
    ld   bc, label_701
    ld   bc, $0107
    rrca
    ld   [bc], a
    rra
    ld   [bc], a
    ccf
    inc  b
    db   $FD ; Undefined instruction
    db   $E8 ; add  sp, d
    ld   a, $18
    ld   [hl], b
    jr   label_A987B
    jr   nc, label_A98FD
    or   b
    db   $E8 ; add  sp, d
    or   b
    ld   a, c
    ld   h, b
    ld   d, c
    ld   h, b
    ld   d, c
    ld   h, b
    pop  de
    ld   h, b
    ld   h, b
    ret  nz
    ld   h, b
    ret  nz
    ld   b, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    ret  nz
    add  a, b
    rst  8
    add  a, c
    rst  $18
    add  a, a
    ld   [rLCDC], a
    ld   [hl], b
    jr   nc, label_A9913
    inc  c
    rlca
    inc  bc

label_A98F8::
    nop
    nop
    nop
    nop
    ld   a, [$FFE0]
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   c, h
    ld   [hl], b
    inc  sp
    inc  a
    rrca
    rrca
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
    ld   b, b
    ld   b, b
    or   b

label_A9913::
    jr   nz, label_A98F8
    pop  bc
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $A401
    ld   a, h
    inc  [hl]
    jr   label_A991F
    db   $FC ; Undefined instruction
    adc  a, [hl]
    inc  b
    dec  b
    ld   b, $23
    ld   [bc], a
    ld   [hl], e
    ld   [hl], d
    cp   $FB
    inc  bc
    ld   bc, $0103
    rlca
    ld   bc, label_305
    ld   b, $03
    ld   c, $03
    dec  bc
    ld   b, $8D
    ld   b, $75
    rst  8
    ld   a, l
    rst  8
    jp   hl
    ld   e, a
    pop  af
    ld   e, a
    pop  af
    ld   e, a
    ld   h, c
    ld   a, a
    ld   [hl], c
    ccf
    ccf
    ccf
    cp   [hl]
    ld   [$FFBF], a
    ld   a, [$FF9F]
    ld   a, [$FFBF]
    sbc  a, $B9
    rst  $18
    cp   b
    rst  $18
    ld   sp, hl
    cp   $D5
    ld   l, [hl]
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    jr   nc, label_A996A
    nop
    rst  $38
    nop
    ccf
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   sp, $E77F
    ccf
    rst  $10
    ccf
    jp   hl
    rra
    call nz, label_FA3F
    rlca
    db   $FD ; Undefined instruction
    inc  bc
    ld   a, $01
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
    ccf
    rst  $38
    sbc  a, a
    rst  $38
    db   $FC ; Undefined instruction
    and  b
    cp   b
    ld   [$FFFC], a
    ret  nz
    ld   a, [$FFC0]
    ld    hl, sp+$C0
    ld    hl, sp+$C0
    ld   a, [$FFC0]
    ret  c
    ld   [$FF0D], a
    inc  b
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    rlca
    ld   bc, label_1D1F
    cpl
    inc  hl
    ld   b, a
    ld   b, c
    ld   b, a
    ld   b, c
    ld   [hl], c
    ld   b, b
    ld   [hl], c
    ld   b, b
    ld   [hl], c
    ld   b, b
    ld   d, c
    ld   h, b
    reti
    ld   [$FFC9], a
    ld   a, [$FFC9]
    ld   a, [$FFC8]
    ld   a, [$FFCE]
    sbc  a, h
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    adc  a, a
    ret  nz
    sub  a, l
    jp   z, label_CA85
    ld   c, a
    ret  nz
    ld   b, b
    ret  nz
    ld   a, $1E
    rrca
    rlca
    inc  bc
    inc  bc
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
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
    inc  bc
    inc  bc
    rlca
    ld   b, $0C
    inc  c
    jr   label_A9A20
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    sbc  a, e
    inc  bc
    ld   bc, $010F
    dec  hl
    dec  d
    dec  hl
    dec  d
    rra
    ld   bc, $0101
    nop
    ld   bc, label_E95
    or   l
    ld   c, $AA
    inc  e
    ld   l, d
    sbc  a, h
    ld   d, [hl]
    cp   b
    and  [hl]
    ld   a, b
    ld   h, [hl]
    ld    hl, sp+$E3
    cp   h
    inc  e
    inc  sp
    ld   de, label_1F3F
    ld   sp, label_3D1B
    ld   d, c
    ccf
    ld   e, l
    inc  sp
    ld   e, [hl]
    ld   sp, label_3D63
    rst  $28
    add  a, l
    add  a, a
    ld   b, $04
    ld   b, $0C
    inc  b
    sbc  a, h
    ld   [$F8F8], sp
    adc  a, b
    ld    hl, sp+$08
    ld    hl, sp+$6F
    rst  $38
    or   e
    ld   a, a
    ld   e, $FF
    rst  $30
    rrca
    ld   sp, hl
    rlca
    adc  a, $01
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    ld   [$FFFE], a
    ld   a, [$FFFB]
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, a
    ld   a, a
    ld   h, a
    rra
    ld   c, [hl]
    ld   b, e
    inc  a
    daa
    db   $FC ; Undefined instruction
    rra
    ld   a, [$FFFF]
    nop
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    pop  af
    rst  $38
    ld   e, b
    ld   [$FF50], a
    ld   [$FF91], a
    ld   [$FFB1], a
    ret  nz
    and  e
    ret  nz
    add  a, $81
    call label_3283
    adc  a, a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [hl], b
    ret  nz
    ld   [hl], c
    ld   [$FFD9], a
    ld   [$FF9D], a
    ld   a, [$FF8C]
    ld    hl, sp+$00
    nop
    nop
    nop
    ld   a, $3E
    pop  hl
    ld   h, c
    cp   b
    ret  c
    cp   $86
    rst  $38
    add  a, c

label_A9AAE::
    ld   a, a
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    rra
    rra
    nop
    nop
    ret  nz
    ret  nz
    rst  $38
    ccf
    nop
    nop
    inc  bc
    inc  bc
    ld   b, $06
    jr   c, label_A9B00
    pop  bc
    pop  bc
    inc  bc
    ld   [bc], a
    rra
    inc  e
    rst  $38
    ld   [rJOYP], a
    nop

label_A9AD2::
    ret  nz
    ret  nz
    jr   nz, label_A9AF6
    ld   [hl], b
    ld   [hl], b
    ret  nc
    or   b
    ret  nc
    jr   nc, label_A9AAE
    jr   nc, label_A9AD2
    ld   hl, label_3C73
    ld   l, e
    inc  a
    ld   c, e
    ld   a, h
    call label_CD7E
    ld   a, [hl]
    adc  a, d
    rst  $38
    adc  a, c
    rst  $38
    adc  a, b
    rst  $38
    ld   a, [hl]
    ccf
    ld   h, b
    ccf
    ld   h, c
    ld   a, $E1
    ld   a, $E1
    ld   a, $F1
    ld   e, $73
    sbc  a, h
    or   e
    call c, label_F48C
    sbc  a, [hl]
    ld  [$FF00+C], a
    sbc  a, a
    db   $E3 ; Undefined instruction
    rst  $38
    ld   b, [hl]
    ld   a, [$FC3F]
    rlca
    ld   sp, hl
    ld   c, $F3
    inc  e
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  b
    nop
    ld   [label_3C00], sp
    nop
    ld   b, a
    ld   bc, $0082
    nop
    nop
    nop
    nop
    ret  nz
    nop
    jr   nz, label_A9B29

label_A9B29::
    stop
    inc  a
    nop
    ld  [$FF00+C], a
    add  a, b
    ld   b, c
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  b
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    ld   [label_700], sp
    nop
    pop  hl
    pop  hl
    ld   a, [de]
    ei
    inc  b
    dec  a
    jp   nz, label_221D
    inc  c
    di
    jr   nz, label_A9B6F
    ld   a, [$FFFF]
    inc  c
    rst  $38
    ld  [$FF00+C], a
    rra
    pop  bc
    ccf
    adc  a, h
    ld   [hl], e
    inc  sp
    ret  nz
    ld   l, h
    add  a, e
    ld   e, e
    add  a, h
    ld   bc, label_1FF
    rst  $38
    ld   bc, $C1FF
    rst  $38
    ccf
    rst  $38
    dec  c
    di
    inc  c
    di
    ld   c, h

label_A9B6F::
    inc  sp
    ld   c, $FC
    rlca
    cp   $01
    rst  $38
    nop
    rst  $38
    inc  sp
    db   $FC ; Undefined instruction
    rrca
    ld    hl, sp+$C5
    cp   $F7
    inc  a
    ld   e, a
    ld   h, b
    cp   a
    jr   c, label_A9BD4
    add  a, a
    ld   [$FFF0], a
    rra
    rst  $38
    ld   a, [$FF0F]
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
    nop
    nop
    rst  $38
    rst  $38
    add  hl, bc
    ld   sp, hl
    add  a, $3E
    push hl
    dec  e
    rst  $38
    nop
    rst  $28
    rra
    db   $F4 ; Undefined instruction
    ld    hl, sp+$01
    nop
    rst  $38
    rst  $38
    jr   nz, label_A9BEB
    jp   label_A87FC
    ld   a, b
    push hl
    jp   label_874A
    inc  l
    rra
    ld   [hl], b
    rst  $38
    add  a, h
    rst  $38
    db   $E4 ; Undefined instruction
    rra
    db   $E8 ; add  sp, d
    rra
    db   $EB ; Undefined instruction
    rra
    ld   [label_8FF], sp
    rst  $38
    ld   [label_10FF], sp
    rst  $38
    db   $10
    db   $FF
    rra
    rst  $38
    ld   hl, $DBFF
    db   $E4 ; Undefined instruction
    ld   h, a
    ld    hl, sp+$07
    ld    hl, sp+$0C
    di
    inc  de
    rst  $28
    ld   c, $FF
    db   $FC ; Undefined instruction
    rst  $38
    db   $EC ; Undefined instruction
    di
    ld   b, b
    ccf
    xor  e
    ld   [hl], b
    ld   d, e
    ld   [$FFAE], a
    pop  bc
    xor  h
    jp   label_835C
    ld   a, b

label_A9BEB::
    add  a, a
    ld   sp, hl
    ld   b, $F7
    ld   [$8300], sp
    add  a, b
    ld   b, h
    nop
    ld   a, b
    ld   b, b
    jr   c, label_A9C31
    inc  b
    nop
    rlca
    inc  b
    inc  bc
    inc  bc
    nop
    nop
    pop  bc
    ld   bc, $0022
    ld   e, $02
    inc  e
    inc  e
    jr   nz, label_A9C0B

label_A9C0B::
    ld   [rNR41], a
    ret  nz
    ret  nz
    nop
    nop
    nop
    inc  e
    nop
    jr   c, label_A9C16

label_A9C16::
    ld   a, b
    nop
    ld   [hl], b
    nop
    di
    nop
    rst  $20
    nop
    add  a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    ld   [rJOYP], a

label_A9C2E::
    add  a, b
    nop
    ld   bc, $0006

label_A9C33::
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop

label_A9C40::
    ret  z
    rlca
    ld   l, h
    add  a, e
    inc  a
    ld   b, e
    inc  e
    inc  hl
    inc  c
    di
    or   b
    rrca
    jr   z, label_A9C15
    inc  [hl]
    ld   b, e
    call label_8E3E
    ld   a, a
    adc  a, a
    ld   a, l
    jr   label_A9C40
    inc  e
    ld    hl, sp+$E7
    cp   $01
    rst  $38
    ld   [bc], a
    db   $FD ; Undefined instruction
    rst  $38
    nop
    ld   a, a
    add  a, b
    sbc  a, a
    ld   [$FFF3], a
    ld   a, h
    rra
    rrca
    nop
    nop
    ld   [$FFC0], a
    ld   a, $F8
    ei
    dec  bc
    db   $FC ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    dec  b
    ei
    ld   a, [bc]
    rst  $38
    rst  $38
    db   $10
    db   $10
    db   $10
    db   $17
    db   $10
    db   $17
    cp   a
    and  b
    ld   a, a
    ld   b, b
    cp   a
    and  b
    ret  nc
    ld   e, a
    rst  $38
    rst  $38
    jr   nz, label_A9CAC
    jr   nz, label_A9C2E
    jr   nz, label_A9C33
    call z, label_983F
    ld   [hl], a
    inc  e
    di
    ld   l, h
    di
    or   l
    sbc  a, e
    ld   a, $1F
    pop  hl
    ld   a, $C3
    db   $FC ; Undefined instruction
    or   b
    rrca
    ld   a, [$FF0F]
    db   $E3 ; Undefined instruction
    inc  e
    adc  a, $31
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    inc  a
    db   $E3 ; Undefined instruction

label_A9CAC::
    cp   b
    ld   h, a
    or   b
    ld   l, a
    ld   a, [de]
    ld   hl, label_110E
    rrca
    db   $10
    db   $07
    ld   [label_877], sp
    ei
    inc  b
    dec  e
    ld   [bc], a
    ld   c, $01
    ld   bc, label_4FE
    ei
    ld   bc, $C0FE
    rst  $38
    ld    hl, sp+$7F
    ld   a, [hl]
    cp   a
    dec  a
    rst  $38
    dec  a
    cp   $07
    rst  $38
    or   h
    ld   c, a
    rrca
    di
    cp   a
    ld   b, b
    ld   e, a
    and  b
    rrca
    ld   a, [$FF83]
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   a, a
    ld   a, [$FFF0]
    rra
    rst  $38
    rlca
    ld    hl, sp+$80
    rst  $38
    ret  nz
    ccf
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    ccf
    ccf
    rst  $20
    ld    hl, sp+$FF
    nop
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, label_FFF
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    ccf
    ret  nz
    rst  $38
    ld   bc, label_EFF
    ld   a, a
    ld   a, [$FFBE]
    and  c
    or   b
    ld   l, a
    and  e
    ld   a, h
    call label_9B70
    ld   [rNR34], a
    pop  hl
    inc  a
    jp   label_BC43
    inc  e
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    rlca
    nop
    rlca
    nop
    ld   bc, $0000
    nop
    jr   c, label_A9D34

label_A9D34::
    inc  e
    nop
    ld   e, $00
    ld   c, $00
    rst  8
    nop
    rst  $20
    nop
    pop  hl
    nop
    ld   e, a
    ld    hl, sp+$DA
    db   $FC ; Undefined instruction
    db   $DB
    cp   h
    rst  $18
    cp   h
    db   $BE
    cp   [hl]
    rst  $18
    cp   a
    rst  8
    cp   a
    ld   l, a
    rst  $18
    dec  b
    inc  bc
    ld   bc, $0100
    nop
    ld   bc, $8300
    ld   bc, label_7CE
    ld    hl, sp+$FC
    sub  a, b
    ld   a, [$FFC0]
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $FE
    rst  $38
    rst  $38
    inc  a
    ld   a, a
    ld   [hl], c
    cp   $71
    cp   $70
    rst  $38
    add  hl, sp
    ld   a, a
    add  hl, sp
    ld   a, a
    inc  a
    inc  a
    ld   a, [$FAC6]
    ld   b, $F3
    rrca
    rra
    rst  $38
    ld    hl, sp+$E0
    ld   a, a
    add  a, b
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   [$FFE0], a
    ld   [hl], b
    db   $10
    db   $18
    ld   [label_8F8], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$F8
    ld   b, $FE
    pop  af
    rrca
    inc  e
    inc  bc
    ld   c, $01
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $8201
    add  a, e
    ld   b, d
    jp   label_7
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rrca
    nop
    rra
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  h
    rst  $20
    dec  h
    and  $99
    ld   a, [hl]
    sbc  a, c
    ld   a, [hl]
    sbc  a, c
    ld   a, [hl]
    sbc  a, c
    ld   a, [hl]
    add  hl, de
    cp   $18
    rst  $38
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   [rJOYP], a
    di
    ld   [bc], a
    db   $FD ; Undefined instruction
    rlca
    ld   sp, hl
    rrca
    ld   sp, hl
    dec  de
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$FF0F]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    jr   label_A9E01
    jr   label_A9E03
    inc  a
    rst  $38
    dec  a
    rst  $38
    ld   a, [hl]
    rst  $38
    db   $FC ; Undefined instruction
    cp   $F8
    db   $FC ; Undefined instruction
    ld   a, [$FFF8]
    ld   h, c
    or   e
    ld   b, c
    db   $E3 ; Undefined instruction
    add  a, c
    jp   label_8301
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    ld   bc, rIE
    rst  $38
    db   $E8 ; add  sp, d
    ld   a, [$FF58]
    ld   h, b
    db   $E8 ; add  sp, d
    ld   d, b
    db   $FC ; Undefined instruction
    ret  nc
    cp   h
    ret  nc
    xor  $88
    rst  8
    adc  a, b
    ld   b, a
    add  a, h
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, label_503
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    dec  bc
    rst  $38
    rst  $38
    ld   bc, $F903
    ld   bc, label_1FD
    rst  $38
    ld   bc, $C13F
    rra
    pop  hl
    rra
    pop  hl
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    rst  $38
    cp   $FF
    cp   $FD
    cp   $FE
    db   $FC ; Undefined instruction
    cp   $FC
    rst  0
    inc  b
    add  a, e
    ld   [bc], a
    add  a, e
    inc  bc
    jp   label_303
    ld   [bc], a
    add  a, a
    inc  b
    rlca
    inc  b
    rrca
    ld   [label_17FF], sp
    rst  $38
    ld   h, a
    rst  $38
    adc  a, a
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ccf
    sbc  a, l
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    sbc  a, c
    rst  $20
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    and  l
    jp   label_FCFB
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    ld    hl, sp+$F4
    ld    hl, sp+$F8
    ld   a, [$FFFC]
    ld   a, [$FFE8]
    ld   a, [$FFFC]
    ld   [rIF], a
    ld   [label_101F], sp
    rra
    db   $10
    db   $1F
    db   $10
    db   $3E
    ld   hl, label_213F
    ld   a, a
    ld   b, e
    ld   a, a
    ld   b, e
    rst  $38
    ld   a, a
    rst  $38
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
    rst  $38
    rst  $38
    ld   a, [$FFE0]
    ret  c
    ld   [$FFE1], a
    pop  bc
    pop  af
    pop  bc
    and  e
    jp   nz, label_82E3
    db   $E3 ; Undefined instruction
    add  a, d
    ld   b, [hl]
    add  a, h
    rst  $38
    add  a, a
    rst  $38
    add  a, a
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $20
    inc  b
    call label_8F08
    ld   [label_88F], sp
    ccf
    ld   sp, $C9DF
    sbc  a, a
    dec  bc
    rst  $38
    set  7, a
    ld   a, a
    rst  $38
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
    cp   a
    sbc  a, a
    ld   a, $3E
    pop  hl
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    rst  0
    ccf
    rst  $38
    sbc  a, a
    ld   a, a
    ld    hl, sp+$FF
    ld   e, a
    ccf
    cp   a
    ld   a, a
    ld   a, a
    rst  $38
    ld   [rIE], a
    add  a, b
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   [$FF7C], a
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca

label_A9F37::
    rst  $38
    ld   bc, $00FF
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    and  l

label_A9F41::
    jp   label_C3A5
    and  l
    jp   label_C3A5
    and  l
    jp   label_FB85
    ei
    add  a, $77
    adc  a, h
    adc  a, h
    rrca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rrca
    inc  c
    dec  bc
    ld   a, [bc]

label_A9F61::
    add  hl, de
    ld   a, $31
    rst  $28
    ret  nc
    add  a, a
    ld   a, b
    ld   [hl], a
    adc  a, b
    di
    inc  c
    ld   a, c
    add  a, [hl]
    jr   c, label_A9F37
    jr   nc, label_A9F41
    inc  hl
    call c, label_F00D
    dec  de
    ld   [$FF3E], a
    pop  bc
    inc  a
    jp   label_BC43
    dec  e
    ld  [$FF00+C], a
    rra
    ld   [rIF], a

label_A9F83::
    ld   a, [$FFC7]
    jr   c, label_A9FBA
    call z, label_C738
    inc  a
    jp   label_E31C
    adc  a, h
    ld   [hl], e
    jr   nc, label_A9F61
    ldi  [hl], a
    call c, label_F00F

label_A9F96::
    rla
    ld   [rNR34], a
    pop  hl
    inc  a
    jp   label_C639
    or   e
    ld   c, h
    add  a, b
    ld   a, a
    jr   nz, label_A9F83
    ld   [hl], c
    adc  a, [hl]
    ei
    inc  b
    dec  a
    jp   nz, label_E21D
    adc  a, h
    ld   [hl], e
    jr   nz, label_A9FCF
    ld   a, c
    add  a, [hl]
    pop  af
    ld   c, $E0
    rra
    ret  nz
    ccf
    adc  a, h
    ld   [hl], e

label_A9FBA::
    inc  sp
    ret  nz
    ld   l, h
    add  a, e
    ld   e, e
    add  a, h
    jp   label_C73C
    jr   c, label_A9F8C
    jr   c, label_A9F96
    jr   nc, label_A9FD7
    pop  af
    inc  c
    di
    inc  c
    di
    ld   b, b

label_A9FCF::
    ccf
    adc  a, e
    ld   [hl], b
    inc  de
    ld   [$FF2E], a
    pop  bc
    inc  l

label_A9FD7::
    jp   label_835C
    ld   a, b
    add  a, a
    ld   sp, hl
    ld   b, $F7
    ld   [$E718], sp
    inc  c
    di
    add  a, $39
    inc  sp
    call z, label_8778
    inc  e
    db   $E3 ; Undefined instruction
    push hl
    ld   a, [de]
    dec  sp
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AA008::
    nop
    ld   bc, $0101
    ld   bc, label_303
    ld   [bc], a
    nop
    nop
    rrca
    rra
    ld   a, $70
    ld   a, b
    ret  nz
    db   $FC ; Undefined instruction
    add  a, b
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $E4 ; Undefined instruction
    nop
    nop
    nop
    ld   a, [$FFF8]
    ld   c, $0E
    ld   bc, $0003
    nop
    nop
    nop
    ld   bc, label_603
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   b, b
    ret  nz
    ld   a, [$FFF0]
    ld   [$0018], sp
    nop
    nop
    nop
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_1414], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    add  a, b
    nop
    add  a, b
    nop
    add  a, a
    nop
    add  a, b
    nop
    add  a, c
    nop
    add  a, [hl]
    nop
    add  a, b
    nop
    add  a, b
    rst  $38
    nop
    ld   bc, $0100
    ld   a, [$FF01]
    add  a, b
    ld   bc, label_1E0
    jr   nz, label_AA07E
    jr   nz, label_AA080
    ret  nz

label_AA080::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    add  a, b
    nop
    add  a, b
    nop
    adc  a, a
    nop
    add  a, c
    nop
    add  a, e
    nop
    adc  a, h
    nop
    add  a, b
    nop
    add  a, c
    rst  $38
    nop
    ld   bc, $0100
    ld   [rSB], a
    nop
    ld   bc, label_1C0
    ld   b, b
    ld   bc, $0140
    add  a, b
    ccf
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, a
    inc  bc
    ld   b, h
    inc  bc
    ld   b, h
    inc  bc
    ld   b, h
    inc  bc
    ld   b, h
    ld   bc, rSCY
    nop
    nop
    nop
    nop
    rst  $30
    ld   [rNR14], a
    ld   h, b
    sub  a, h
    ld   h, b
    sub  a, h
    nop
    db   $E4 ; Undefined instruction
    ret  nz
    inc  [hl]
    rst  $38
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    dec  bc
    ld   bc, label_18A
    adc  a, d

label_AA0FC::
    ld   bc, label_18A
    adc  a, d
    inc  b
    rst  $38
    dec  b
    add  a, [hl]
    ld   a, d
    adc  a, l
    ld   l, c
    sbc  a, [hl]
    ld   a, d
    adc  a, l
    ld   a, c
    adc  a, [hl]
    ld   a, d
    adc  a, l
    dec  b
    cp   $FF
    add  a, e
    cp   $86
    cp   $8C
    db   $FC ; Undefined instruction
    adc  a, b
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   a, c
    add  a, c
    add  a, h
    adc  a, h
    ld   [label_908], sp
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    ld   [bc], a
    ld   [bc], a
    ld   bc, $8001
    add  a, b
    add  a, [hl]
    add  a, b
    inc  b
    rrca
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    rst  0
    add  a, h
    ld   b, a
    ld   b, h
    ld   b, a
    ld   b, h
    rst  8
    add  a, h
    rrca
    ld   [label_1F30], sp
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    inc  d
    inc  d
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    add  a, a
    nop
    add  a, c
    nop
    add  a, a
    nop
    add  a, h
    nop
    add  a, a
    nop
    add  a, c
    nop
    add  a, a
    ld   bc, $0100
    jr   nz, label_AA176
    jr   nz, label_AA178
    jr   nz, label_AA17A
    jr   nz, label_AA17C
    jr   nz, label_AA17E
    jr   nz, label_AA180
    jr   nz, label_AA181

label_AA181::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AA19C::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    adc  a, [hl]
    nop
    add  a, d
    nop
    adc  a, [hl]
    nop
    adc  a, b
    nop
    adc  a, [hl]
    nop
    add  a, d
    nop
    adc  a, [hl]
    ld   bc, $0100
    ld   b, b
    ld   bc, $0140
    ld   b, b
    ld   bc, $0140
    ld   b, b
    ld   bc, $0140
    ld   b, b
    nop
    ld   b, a
    inc  bc
    ld   b, h
    inc  bc
    ld   b, h
    inc  bc
    ld   b, h
    nop
    ld   b, a
    nop
    ld   b, b
    nop
    ld   c, [hl]
    inc  b
    ld   c, c
    ld   h, b
    sub  a, h
    ld   h, b
    sub  a, l
    ld   h, b
    sub  a, l
    ld   [$FF15], a
    nop
    rst  $30
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ld   bc, $010A
    jp   z, label_A8A01
    ld   bc, $004A
    ld   a, e
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    rst  $38
    inc  bc
    inc  bc
    rst  $28
    ld   [de], a
    rst  $38
    ld   bc, label_1FE
    cp   $01
    cp   $01
    nop
    rst  $38
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, b
    add  a, b
    cp   [hl]
    ld   b, b
    rst  $38
    rst  $38
    ld   [hl], b
    sbc  a, a
    ld   [hl], b
    sbc  a, a
    inc  d
    rst  $38
    nop
    inc  bc
    ld   bc, label_300
    inc  bc
    ld   a, $0F
    rst  $38
    ld   a, [$FF00+C]
    db   $E3 ; Undefined instruction
    ccf
    pop  bc
    rra
    jp   hl
    ld   h, b
    rst  $38
    add  a, b
    add  a, c
    or   $09
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    nop
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
    add  a, b
    nop
    add  a, l
    nop
    add  a, h
    nop
    add  a, l
    nop
    add  a, l
    nop
    add  a, c
    nop
    add  a, b
    nop
    add  a, l
    ld   bc, $0140
    ld   [rSB], a
    ld   b, b
    ld   bc, label_1E0
    ld   b, b
    ld   bc, label_180
    nop
    ld   bc, label_2000
    jr   nz, label_AA2A6
    inc  hl
    jr   nz, label_AA2AD
    jr   nz, label_AA2AF
    jr   nz, label_AA2B1
    jr   nz, label_AA2B3
    jr   nz, label_AA2B5
    jr   nz, label_AA2B7
    nop
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   a, a
    add  a, b
    ccf
    ret  nz
    add  a, d
    ld   b, h
    jp   nz, label_C204
    inc  b
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [bc], a
    cp   $E2
    ld   e, $CA
    ld   [hl], $1A
    ld   h, $3A

label_AA2AD::
    ld   b, $3A

label_AA2AF::
    ld   b, $00

label_AA2B1::
    add  a, b
    nop

label_AA2B3::
    adc  a, [hl]
    nop

label_AA2B5::
    adc  a, d
    nop

label_AA2B7::
    adc  a, h
    nop
    adc  a, d
    nop
    adc  a, [hl]
    nop
    adc  a, b
    nop
    adc  a, b
    ld   bc, $0100
    ld   b, b
    ld   bc, label_1F0
    ld   b, b
    ld   bc, label_1A0
    and  b
    ld   bc, $0120
    ld   h, b
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    pop  bc
    add  a, b
    ld   b, c
    add  a, b
    ld   b, c
    add  a, b
    ld   b, c
    add  a, b
    ld   b, c
    rst  $38
    nop
    nop

label_AA2E3::
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    inc  b
    nop
    inc  b
    nop
    inc  a
    nop
    inc  b
    cp   $00
    ld   [bc], a
    nop
    ld   [bc], a
    ld   a, [$FF62]
    sub  a, b
    ld   h, d
    sub  a, b
    ld   h, d
    sub  a, b
    ld   h, d
    sub  a, b
    ld   h, d
    sub  a, b
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, c
    ld   l, a
    sub  a, c
    ld   a, a
    add  a, c
    ld   a, a
    add  a, c
    ld   a, a
    add  a, c
    ld   bc, label_14FF
    rst  $38
    inc  d
    rra
    rst  $38
    rst  $38
    cp   a
    ld   b, b
    ld   e, a
    and  b
    cp   a
    ld   b, b
    ld   e, a
    and  b
    cp   a
    ld   b, b
    ccf
    ret
    rra
    jp   hl
    rst  $38
    rst  $38
    ld   a, [$FF00]
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38
    ld   a, [$FF1F]
    db   $10
    db   $1F
    db   $10
    db   $DF
    db   $10
    db   $DF
    db   $10
    db   $D0
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, d
    nop
    adc  a, [hl]
    nop
    add  a, d
    nop
    add  a, [hl]
    nop
    adc  a, d
    nop
    add  a, h
    nop
    add  a, b
    nop
    add  a, a
    ld   bc, label_1E0
    and  b
    ld   bc, label_1A0
    add  a, b
    ld   bc, label_190
    ld   a, [$FF01]
    nop
    ld   bc, label_20F0
    daa
    jr   nz, label_AA3AB
    jr   nz, label_AA3AD
    jr   nz, label_AA3AF
    jr   nz, label_AA3B1
    jr   nz, label_AA3B3
    jr   nz, label_AA3B5
    jr   nz, label_AA3B7
    jp   nz, label_C204
    inc  b
    jp   nz, label_C204
    inc  b
    jp   nz, label_C204
    inc  b

label_AA39C::
    jp   nz, label_C204
    inc  b
    db   $3A ; ldd  a, [hl]
    ld   b, $3A
    ld   b, $3A
    ld   b, $3A
    ld   b, $3A
    ld   b, $3A

label_AA3AB::
    ld   b, $3A

label_AA3AD::
    ld   b, $3A

label_AA3AF::
    ld   b, $00

label_AA3B1::
    add  a, b
    nop

label_AA3B3::
    add  a, c
    nop

label_AA3B5::
    add  a, l
    nop

label_AA3B7::
    add  a, l
    nop
    add  a, l
    nop
    sbc  a, a
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   bc, $0100
    nop
    ld   bc, $0100
    ret  nz
    ld   bc, $0100
    ld   [rSB], a
    nop
    rst  $38
    nop
    add  a, b
    ld   a, l
    sbc  a, b
    ld   h, l
    sbc  a, b
    ld   h, l
    ld    hl, sp+$05
    nop
    db   $FD ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    nop
    inc  a
    nop
    inc  b
    nop
    inc  b
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   a, [$FF02]
    nop
    ld   [bc], a
    ld   a, [$FF62]
    sub  a, b
    ld   [bc], a
    ld   a, [$FF02]
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    jr   nc, label_AA440
    rst  $38
    ld   l, e
    ld   d, h
    push de
    ld   l, d
    rst  $38
    ld   a, a
    push de
    ld   h, [hl]
    call z, label_D577
    ld   h, [hl]
    ld   c, h
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   d, l
    ld   h, [hl]
    call label_A9576
    ld   h, [hl]
    call label_FF76
    rst  $38
    rst  $38
    nop
    ld    hl, sp+$00
    rst  $38
    rst  $38
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]

label_AA440::
    add  a, b
    rst  $38
    ld   b, b
    ld   b, b
    ld   a, a
    ld   b, b
    cp   $C1
    ld   a, a
    ld   b, b
    ld   [hl], a
    ld   c, b
    ld   a, a
    ld   b, b
    ld   b, b
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
    add  a, l
    nop
    add  a, a
    nop
    add  a, c
    nop
    add  a, a
    nop
    add  a, e
    nop
    add  a, a
    nop
    add  a, d
    nop
    add  a, b
    ld   bc, label_150
    ld   [rSB], a
    ld   b, b
    ld   bc, label_160
    ld   h, b
    ld   bc, label_160
    ld   b, b
    ld   bc, label_2000
    daa
    jr   nz, label_AA4AB
    jr   nz, label_AA4AD
    jr   nz, label_AA4AF
    jr   nz, label_AA4B1
    jr   nz, label_AA4B3
    jr   nz, label_AA4B5
    jr   nz, label_AA4B7
    jp   nz, label_C204
    inc  b
    jp   nz, label_FA04
    inc  b
    ld   bc, $C0FE
    rra
    jp   nz, label_C204
    inc  b
    db   $3A ; ldd  a, [hl]
    ld   b, $3A
    ld   b, $3A
    ld   b, $3A
    ld   b, $FA
    ld   b, $3A

label_AA4AB::
    add  a, $3A

label_AA4AD::
    ld   b, $3A

label_AA4AF::
    ld   b, $00

label_AA4B1::
    nop
    nop

label_AA4B3::
    nop
    nop

label_AA4B5::
    nop
    nop

label_AA4B7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, b
    nop
    ld   c, c
    nop
    ld   c, c
    nop
    ld   c, b
    ld   [$0050], sp
    ld   d, e
    nop
    ld   d, e
    nop
    ld   d, b
    ld   b, b
    jr   nz, label_AA4E3

label_AA4E3::
    sub  a, a
    inc  b
    sbc  a, b
    jr   z, label_AA4F8
    nop
    ld   [hl], c
    ld   d, b
    inc  hl
    jr   nz, label_AA501
    jr   nz, label_AA501
    nop
    ld   b, $06
    ret
    ld   b, b
    add  hl, hl
    jr   nz, label_AA510

label_AA4F8::
    jr   nz, label_AA512
    ld   [$0092], sp
    sub  a, d
    nop

label_AA4FF::
    ld   [de], a
    ld   d, l

label_AA501::
    ld   h, [hl]
    ld   c, h
    ld   [hl], a
    ld   d, l
    ld   h, [hl]
    cpl
    ccf
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   b, $00

label_AA510::
    ld   d, l
    ld   h, [hl]

label_AA512::
    call label_A9576
    ld   h, [hl]
    cp   $FF
    rst  $38
    nop
    inc  bc
    nop
    stop
    nop
    nop
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
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
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    ld   d, l
    ld   h, [hl]
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    ld   h, b
    nop
    ld   bc, label_A8000
    ld   b, b
    ld   b, [hl]
    ld   b, b
    ld   b, b
    ld   b, b
    adc  a, b
    add  a, b
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
    add  a, b
    nop
    add  a, e
    nop
    adc  a, l
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, e
    ld   bc, label_1D0
    ld   d, b
    ld   bc, $0100
    nop
    ld   bc, label_1C0
    nop
    ld   bc, label_180
    ld   [rNR41], a
    daa
    jr   nz, label_AA5AB
    jr   nz, label_AA5AD
    jr   nz, label_AA5AF
    jr   nz, label_AA5B1
    jr   nz, label_AA5B3
    jr   nz, label_AA5B5
    jr   nz, label_AA5B7
    jp   nz, label_C204
    inc  b
    jp   nz, label_C204
    inc  b
    jp   nz, label_C204
    inc  b
    jp   nz, label_C204
    inc  b
    db   $3A ; ldd  a, [hl]
    ld   b, $3A
    ld   b, $3A
    ld   b, $3A
    ld   b, $3A
    ld   b, $3A

label_AA5AB::
    ld   b, $3A

label_AA5AD::
    ld   b, $3A

label_AA5AF::
    ld   b, $00

label_AA5B1::
    nop
    nop

label_AA5B3::
    nop
    nop

label_AA5B5::
    nop
    nop

label_AA5B7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$0050], sp
    ld   c, a
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    ccf
    ld   b, b
    ld   c, b
    jr   nc, label_AA5E7
    ret  z
    nop
    rlca
    nop

label_AA5E7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    jr   nz, label_AA60F
    ld   b, b
    jr   nz, label_AA5F5

label_AA5F5::
    ret  nz
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AA60F::
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
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    nop
    nop
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
    inc  b
    nop
    nop
    nop
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
    rst  $38
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
    nop
    add  a, e
    nop
    add  a, d
    nop
    add  a, e
    nop
    add  a, b
    nop
    add  a, c
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   bc, label_180
    add  a, b
    add  hl, de
    add  a, b
    rlca
    sub  a, b
    ld   [bc], a
    sub  a, b
    ld   d, $20
    jr   label_AA69E
    ret  nc
    jr   nz, label_AA6A1
    daa
    jr   nz, label_AA6AB
    jr   nz, label_AA6AD
    jr   nz, label_AA6AF
    daa
    daa
    jr   nz, label_AA6AC
    jr   nz, label_AA6AE
    jr   nz, label_AA6B0
    jp   nz, label_204
    db   $F4 ; Undefined instruction
    ld   [hl], b
    adc  a, a
    rst  $38
    nop
    rst  $28
    ld   a, [$FF1E]
    rra
    ld   bc, $0001
    nop
    db   $3A ; ldd  a, [hl]

label_AA6A1::
    ld   b, $3A
    ld   b, $3A
    add  a, $9A
    ld   h, [hl]
    jp   z, label_2236

label_AA6AB::
    sbc  a, $F2

label_AA6AD::
    xor  $1E

label_AA6AF::
    ld   e, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, e
    ld   hl, $0092
    sub  a, d
    ld   [bc], a
    inc  d
    db   $10
    db   $0C
    nop
    ld   c, h
    inc  b
    ld   c, b
    nop
    ld   c, b
    nop
    jp   label_3240
    db   $10
    db   $0A
    ld   [label_3C6], sp
    call nz, label_C403
    ld   bc, $0008
    ld   sp, label_3002
    ld   [bc], a
    ret  nc
    ld   [bc], a
    sbc  a, h
    add  a, d
    inc  d
    jp   nz, label_ABA04
    add  a, b
    ld   [hl], d
    add  a, b
    ld   [bc], a
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [bc]
    nop
    jr   z, label_AA71C

label_AA71C::
    inc  l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AA7C4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   c
    ld   [label_811], sp
    stop
    inc  c
    nop
    inc  bc
    nop
    nop
    nop
    nop
    rst  $38
    nop
    db   $10
    db   $8B
    nop
    adc  a, e
    db   $10
    db   $0B
    jr   nz, label_AA7FB
    nop
    pop  hl
    nop
    nop
    nop
    nop
    rst  $38
    nop
    ld   [bc], a
    ld    hl, sp+$02
    ld    hl, sp+$22
    ret  z
    ld   h, d
    adc  a, b
    ld   [bc], a
    sub  a, b
    ld   [bc], a

label_AA7FB::
    ld   h, b
    ld   [bc], a
    nop
    cp   $00
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   e, a
    and  b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, label_9F4
    db   $FC ; Undefined instruction
    ld   bc, label_1FC
    db   $EC ; Undefined instruction
    ld   de, label_1FC
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   e, a
    and  b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    nop
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
    rlca
    rlca
    ld   sp, hl
    cp   $00
    nop
    nop
    nop
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
    ei
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_AA8C2
    jr   nz, label_AA8C4
    jr   nz, label_AA8C6
    jr   nz, label_AA8C8
    jr   nz, label_AA8CA
    jr   nz, label_AA8CC
    jr   nz, label_AA8CE
    jr   nz, label_AA8D0
    and  d
    db   $AA
    xor  d
    push de
    xor  e
    call nc, label_D4AB
    and  e
    call c, label_F986
    add  a, d
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    rst  $38
    nop

label_AA8C2::
    rst  $38
    nop

label_AA8C4::
    ld   a, a
    add  a, b

label_AA8C6::
    ld   a, a
    add  a, b

label_AA8C8::
    rst  $38
    nop

label_AA8CA::
    rst  $38
    nop

label_AA8CC::
    ei
    nop

label_AA8CE::
    ei
    nop

label_AA8D0::
    ld   [hl], b
    ld   [label_870], sp
    ld   d, b
    ld   [label_8D0], sp
    or   b
    ld   [label_8B0], sp
    or   b
    ld   [label_830], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_11EE
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, [hl]
    add  a, c
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    cp   $00
    ld   bc, label_11EE
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    nop
    cp   $FF
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
    nop
    ld   bc, label_E01
    rrca
    db   $10
    db   $1F
    jr   nz, label_AA989
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    add  a, b
    rst  $38
    ld   a, $3F
    ret  nz
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
    ld   b, $FF
    ld   a, a
    add  a, b
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
    ld   bc, label_7FF
    cp   $FF
    nop
    rra
    ld   [rTAC], a
    ld   sp, hl
    ld   b, $FE
    rra
    ld    hl, sp+$7F
    ld   [rIE], a
    add  a, b
    rst  $38
    nop
    ld   [$FFE0], a
    cp   $3E
    pop  bc
    pop  bc
    nop
    nop
    ret  nz

label_AA989::
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   b, b
    ld   b, b
    jr   nz, label_AA9BA
    db   $10
    db   $10
    ld   [label_808], sp
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop

label_AA9A8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, e
    db   $E4 ; Undefined instruction
    sub  a, e
    db   $EC ; Undefined instruction
    sub  a, e
    db   $EC ; Undefined instruction
    sub  a, c
    xor  $91
    xor  $91
    xor  $93
    db   $EC ; Undefined instruction
    adc  a, c
    or   $FB
    nop
    ld   a, d
    add  a, b
    ld   a, d
    add  a, b
    ld   e, d
    and  b
    ld   e, e
    and  b
    db   $D3 ; Undefined instruction
    jr   nz, label_AA9A8
    jr   nz, label_AAA06
    ret  nz
    ld   a, [$FF08]
    ret  nc
    ld   [label_8D0], sp
    ld   d, b
    ld   [label_850], sp
    ret  nc
    ld   [label_8B0], sp
    or   b
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AAA06::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_AAA14

label_AAA14::
    jr   label_AAA16

label_AAA16::
    nop
    nop
    rst  $38
    nop
    ret  nz
    nop
    inc  c
    nop
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    nop
    nop
    ld   b, $00
    rst  $38
    nop
    inc  bc
    nop
    ccf
    nop
    ccf
    ret  nz
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   bc, $8000
    ld   a, a
    rst  $38
    nop
    di
    inc  c
    rst  $38
    nop
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    cp   b
    ccf
    call nz, label_FA07
    inc  bc
    push af
    add  hl, bc
    cp   $00
    nop
    cp   $09
    ld   sp, hl
    ld   [label_10F8], sp
    ld   a, [$FF10]
    ld   a, [$FF14]
    di
    sub  a, a
    ld   a, [$FF94]
    ld   a, [$FF54]
    ld   [hl], b
    adc  a, a
    ld    hl, sp+$5F
    ld   [hl], b
    ccf
    jr   nz, label_AAA86
    db   $10
    db   $0F
    ld   [$880F], sp
    add  a, a
    ld   b, h
    ld   h, a
    ld   h, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    rlca
    jp   hl
    ld   e, $F7
    ld   a, c
    cp   $00
    cp   $00
    rst  $38
    inc  bc

label_AAA86::
    db   $3E
    ld   a, $EF
    ld   a, [$FF7F]
    add  a, b
    rst  $38
    nop
    rst  $38
    ld   [rTIMA], a
    inc  b
    ld   a, l
    ld   a, h
    add  a, h
    call nz, label_303
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    add  a, b
    nop
    db   $E8 ; add  sp, d
    ld   a, [bc]
    db   $E8 ; add  sp, d
    add  hl, bc
    inc  d
    dec  d
    db   $E4 ; Undefined instruction
    push hl
    inc  b
    dec  b
    inc  b
    dec  b
    ld   [$8909], sp
    or   $89
    or   $89
    or   $81
    cp   $81
    cp   $91
    xor  $91
    xor  $81
    cp   $B7
    ld   b, b
    or   a
    ld   b, b
    cp   e
    ld   b, b
    cp   e
    ld   b, b
    cp   e
    ld   b, b
    cp   d
    ld   b, b
    cp   d
    ld   b, b
    ld   a, [$B000]
    ld   [label_8B0], sp
    or   b
    ld   [label_8B0], sp
    or   b
    ld   [label_8B0], sp
    or   b
    ld   [label_8B0], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $01
    nop
    rst  $38
    rst  $38
    nop
    ret  nz
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    nop
    nop
    ld   bc, label_600
    ld   bc, label_7F8
    rrca
    nop
    rrca
    nop
    add  hl, bc
    ld   b, $07
    nop
    inc  bc
    nop
    rst  $38
    nop
    pop  af
    ld   c, $00
    rst  $38
    rst  $38
    nop
    rst  8
    jr   nc, label_AAB2A
    nop
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    add  a, b
    ld   a, [hl]
    add  a, c
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   e, a
    and  b
    ld   a, [hl]
    add  a, b
    ld   bc, label_A90F9
    ld   [hl], b
    jr   nc, label_AAB84
    ret  c
    db   $10
    db   $D8
    db   $10
    db   $EC
    ld   [label_8CC], sp
    db   $3A ; ldd  a, [hl]
    inc  a
    sbc  a, $E4
    inc  de
    ld   [hl], e
    ldd  [hl], a
    ld   d, e
    dec  hl
    ld   e, d

label_AAB66::
    dec  [hl]
    ld   c, [hl]

label_AAB68::
    cpl
    ld   b, h
    dec  bc
    inc  c
    ld   e, $08
    ld   [hl], $18
    cp   a
    pop  bc
    cp   $02
    cp   $02
    db   $FC ; Undefined instruction
    inc  c
    pop  af
    ld   [hl], c
    ld   h, b
    jr   nz, label_AABDD
    jr   nz, label_AABDF
    jr   nz, label_AAB80
    jr   label_AAB92
    ld   b, $03
    ld   bc, $E0E1
    ld   de, label_810
    ld   [label_404], sp
    inc  b
    inc  b
    cp   $00

label_AAB92::
    cp   $00
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    cp   a
    ret  nz
    rst  $38
    ret  nz
    cp   a
    and  b
    ld   [hl], d
    ld   [hl], c
    ld   d, $11
    ld   a, [bc]
    add  hl, bc
    ld   a, [bc]
    add  hl, bc
    ld   [label_80B], sp
    dec  bc
    dec  bc
    ld   [$888B], sp
    add  a, c
    cp   $81
    cp   $81
    cp   $81
    cp   $91
    xor  $92
    db   $ED ; Undefined instruction
    sub  a, d
    db   $ED ; Undefined instruction
    add  a, b
    rst  $38
    ld   a, [label_ABA00]
    add  a, b
    ld   a, d
    add  a, b
    ld   a, l
    add  a, b
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    or   b
    ld   [label_8B0], sp
    or   b
    ld   [$8830], sp
    db   $10
    db   $88
    db   $10
    db   $88
    jr   nc, label_AAB66
    jr   nc, label_AAB68
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   label_AAC16

label_AAC16::
    nop
    nop
    jr   nz, label_AAC1A

label_AAC1A::
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, a
    nop
    add  a, b
    ld   a, a
    rlca
    nop
    ret  nz
    nop
    nop
    nop
    nop

label_AAC2B::
    nop
    inc  c
    nop
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    nop
    jr   nz, label_AAC3A

label_AAC3A::
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   b, $F7
    dec  bc
    inc  c
    rst  $10
    jr   label_AAC1A
    inc  e
    ret  c
    rra
    rst  $20
    rlca
    ld    hl, sp+$00
    nop
    rst  $38
    cp   $02
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    cp   $01

label_AAC5A::
    add  a, e
    rst  $38

label_AAC5C::
    ld   a, l
    ld   a, a
    ld   hl, label_3E3F
    db   $10
    db   $7C
    db   $10
    db   $FD
    ld   [$FF79], a
    ret  nz
    di
    ret  nz
    rst  $20
    add  a, c
    xor  $02
    cp   $06
    pop  bc
    ld   b, c
    pop  bc
    ld   b, c
    add  a, c
    add  a, c
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    ld   bc, $0001
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld    hl, sp+$F8
    add  a, $C6
    inc  a
    inc  a
    nop
    nop
    ld   b, b
    ld   b, b
    nop
    nop
    cp   a
    and  b
    xor  [hl]
    or   b
    ld   a, a
    ld   d, c
    ld   [hl], l
    ld   e, c
    ld   a, d
    ld   c, d
    db   $3A ; ldd  a, [hl]
    ld   a, [hli]
    dec  a
    inc  l
    inc  hl
    jr   nc, label_AAC2B
    adc  a, c
    sub  a, a
    sub  a, b
    ld   d, a
    ld   d, b
    ld   l, a
    ld   h, b
    ld   b, e
    ld   e, h
    cp   b
    rlca
    cp   $01
    or   $09
    adc  a, c
    or   $89
    or   $80
    rst  $38
    sub  a, d
    db   $ED ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    add  a, e
    db   $FC ; Undefined instruction
    sub  a, d
    db   $ED ; Undefined instruction
    sub  a, d
    db   $ED ; Undefined instruction
    db   $FD ; Undefined instruction
    nop
    ei
    nop
    ei
    nop
    rst  $30
    nop
    ld   a, e
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    rst  $38
    nop
    jr   nc, label_AAC5A
    jr   nc, label_AAC5C
    jr   nc, label_AACDE
    ld   [hl], b
    ld   [label_870], sp
    jr   nc, label_AAD28
    inc  [hl]
    ld   c, d

label_AACDE::
    inc  [hl]
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
    rst  $38
    nop
    nop
    nop
    jr   nc, label_AAD08

label_AAD08::
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    ld   bc, rJOYP
    nop
    nop
    nop
    ld   b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AAD28::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [hl]
    add  a, b
    ld   a, l
    add  a, c
    ld   a, e
    add  a, e
    ld   a, d
    add  a, e
    ld   h, h
    sub  a, a
    ld   [hl], h
    add  a, a
    inc  b
    rst  $30
    ld   b, c
    ld   a, a
    ret  nz
    rst  $38
    ld   [$FF3F], a
    ld    hl, sp+$1F
    db   $FC ; Undefined instruction
    rst  0
    ccf
    db   $E3 ; Undefined instruction
    rra
    ld    hl, sp+$07
    rst  $38
    ld   sp, hl
    rra
    ld   [rIE], a
    add  a, b
    rst  $38
    add  a, a
    ld    hl, sp+$8F
    ld   a, [$FFCF]
    ld   a, [$FFCF]
    ld   [hl], b
    rst  $20
    jr   c, label_AAD71

label_AAD71::
    nop
    add  a, b
    add  a, b
    ld   h, b
    ld   [$FFF8], a
    jr   label_AAD78
    rlca
    pop  af
    ld   [label_8F0], sp
    ld   a, [$FF08]
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
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, e
    ld   c, b
    ld   a, e
    ld   c, b
    cpl
    jr   nz, label_AAE02
    jr   nz, label_AADDC
    ld   e, b
    add  a, b
    sbc  a, a
    ld   a, h
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    xor  $11
    cp   $01
    cp   $01
    ld   e, $E1
    jp   nz, label_F83D
    rlca
    cp   $01
    sub  a, d
    db   $ED ; Undefined instruction
    sub  a, d
    db   $ED ; Undefined instruction
    sub  a, d
    db   $ED ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    adc  a, d
    push af
    adc  a, d
    push af
    db   $FC ; Undefined instruction
    ld   bc, label_2F9
    ld    hl, sp+$02
    ld   a, [$FA00]
    nop
    cp   $01
    db   $FC ; Undefined instruction
    ld   bc, label_17C
    inc  [hl]
    ld   c, e
    ld   sp, label_334E
    ld   c, h
    scf
    ret  z
    ld   [hl], a
    adc  a, b
    rst  $10
    ld   [label_8D7], sp
    rst  $10
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AAE02::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [hl], b
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    nop
    nop
    inc  b
    nop
    rst  $38
    nop
    jr   label_AAE3C

label_AAE3C::
    add  a, b
    nop
    nop
    nop
    inc  c
    rrca
    ld   l, b
    rrca
    ld   [label_180F], sp
    rra
    rst  $30
    rst  $38
    rst  $30
    jr   label_AAE3C
    inc  a
    jp   label_7F
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
    sub  a, a
    rla
    jr   nz, label_AAE80
    db   $FD ; Undefined instruction
    cp   $03
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
    inc  c
    rrca
    ld   [rNR10], a
    pop  af
    ld   a, [$FF7F]
    sbc  a, a
    pop  af
    ld   de, $9070
    ld   a, a
    cp   a
    add  a, $F8
    inc  c
    ld   a, [$FFF9]
    ld   c, d
    ld    hl, sp+$8B
    ld    hl, sp+$08
    ld   a, [$FFF0]
    nop
    nop
    rst  $38
    nop
    add  a, b
    add  a, b
    adc  a, h
    add  a, b
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, h
    add  a, e
    inc  c
    ld   [hl], e
    nop
    rrca
    nop
    inc  bc
    rst  $38
    nop
    nop
    nop
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    ld   [$00FF], sp
    rst  $38
    nop
    rra
    ld   [$FF03], a
    inc  e
    nop
    inc  bc
    adc  a, [hl]
    pop  af
    add  a, [hl]
    ld   sp, hl
    add  a, [hl]
    ld   sp, hl
    add  a, [hl]
    ld   sp, hl
    add  a, d
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    sub  a, [hl]
    jp   hl
    sub  a, [hl]
    jp   hl
    ld   a, h
    ld   bc, $00FF
    cp   l
    ld   b, b
    sbc  a, l
    ld   b, b
    sbc  a, l
    ld   b, b
    sbc  a, l
    ld   b, b
    dec  e
    ld   b, b
    dec  e
    ld   b, b
    sub  a, $09
    jp   nc, label_950D
    ld   a, [bc]
    sub  a, l
    ld   a, [bc]
    sub  a, [hl]
    add  hl, bc
    or   a
    ld   [label_8B7], sp
    or   a
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ret  nz
    nop
    ld   bc, $0000
    nop
    inc  bc
    nop
    stop
    ld   bc, rJOYP
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    nop
    nop
    inc  c
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    nop
    nop
    ret  nz
    nop
    ld   bc, rJOYP
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
    nop
    rst  $18
    ld   h, c
    sbc  a, c
    ld   h, a
    ld   a, h
    jp   label_20EF
    di
    jr   nz, label_AAF47
    jr   label_AAF4C
    rlca
    rst  $38
    nop
    rst  $38
    ret  nz
    cp   $01
    add  a, b
    rst  $38
    ld   a, a
    ld   b, b
    cp   a
    jr   nz, label_AAF99
    ld   hl, $C0FF
    db   $FC ; Undefined instruction
    nop
    cp   $03
    ccf
    pop  bc
    ld   bc, rIE
    nop
    rst  $38
    nop
    ld   a, e
    add  a, h
    ret  nz
    nop
    jr   c, label_AAF70

label_AAF70::
    dec  a
    pop  bc
    ld   a, d
    add  a, d
    ld   [hl], a
    add  a, h
    xor  b
    ret  z
    ld   a, [$FF70]
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, rJOYP
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
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    nop

label_AAF99::
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_AAFA4

label_AAFA4::
    rst  $38
    nop
    nop
    nop
    ld   h, b
    nop
    ld   bc, $0000
    nop
    ld   b, $00
    add  a, [hl]
    ld   sp, hl

label_AAFB2::
    add  a, d
    db   $FD ; Undefined instruction
    ld  [$FF00+C], a
    ld   a, l
    ld   e, $1F
    ld   bc, $8001
    nop
    ld   c, $00
    nop
    nop
    dec  e
    ld   b, b
    sbc  a, h
    ld   b, c
    inc  e
    ld   b, c
    rra
    ld   b, b
    ld   a, [$FFFF]
    nop
    nop
    nop
    nop
    stop
    or   a
    ld   [label_8B7], sp
    rst  $20
    inc  e
    inc  bc
    di
    ld   b, $00
    nop
    nop
    jr   label_AAFDE

label_AAFDE::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_AAFB2
    sub  a, b
    sbc  a, a
    sub  a, b
    rst  8
    ld   c, b
    rst  $20
    inc  h
    rst  $30
    inc  [hl]
    di
    ld   [de], a
    ld   sp, hl
    add  hl, bc
    db   $FC ; Undefined instruction
    inc  b
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    di
    ld   [de], a
    rst  $20
    inc  h
    rst  $28
    inc  l
    rst  8
    ld   c, b
    sbc  a, a
    sub  a, b
    ld   bc, rIE
    nop
    nop
    nop
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    ld   sp, hl
    add  hl, bc
    di
    ld   [de], a
    di
    ld   [de], a
    jr   nz, label_AB081

label_AB042::
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    nop

label_AB04C::
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    jr   z, label_AB042
    jr   z, label_AB04C
    inc  d
    rst  $30
    inc  d
    ei
    ld   a, [bc]
    ei
    ld   a, [bc]
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, rIE
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $20
    inc  h
    rst  8
    ld   c, b
    rst  8
    ld   c, b
    sbc  a, a
    sub  a, b
    ccf
    jr   nz, label_AB07A
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction

label_AB081::
    dec  b
    ld   sp, hl
    add  hl, bc
    di
    ld   [de], a
    rst  $30
    inc  d
    and  l
    inc  h
    ld   c, d
    ld   c, b
    sub  a, b
    sub  a, b
    ccf
    ccf
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_256
    xor  h
    inc  b
    inc  c
    inc  c
    ei
    ei
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AB0C8::
    nop
    nop

label_AB0CA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AB0D6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $30
    inc  d
    rst  $30
    inc  d
    rst  $28
    jr   z, label_AB0D6
    jr   z, label_AB0C8
    ld   d, b
    rst  $18
    ld   d, b
    cp   a
    and  b
    cp   a
    and  b
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
    nop
    rst  $38
    rst  $38
    nop
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
    inc  b
    db   $FC ; Undefined instruction
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    rst  $38
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    ccf
    jr   nz, label_AB0CA
    sub  a, b
    rst  8
    ld   c, b
    rst  8
    ld   c, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $FF
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    rst  $38
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    ccf
    jr   nz, label_AB12A
    and  b
    sbc  a, a
    sub  a, b
    rst  $18
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    cp   $FF
    nop
    nop
    nop
    rst  $38
    rst  $38
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    add  a, b
    rst  $38
    rst  $38
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
    add  a, b
    rst  $38

label_AB1AF::
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
    nop
    nop
    nop
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
    nop
    nop
    nop
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    dec  b
    ld   sp, hl
    add  hl, bc
    ei
    ld   a, [bc]
    nop
    ld   a, a
    rst  $38
    nop
    nop
    nop
    rst  $38

label_AB1E7::
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    db   $E3 ; Undefined instruction
    ldi  [hl], a
    pop  bc
    ld   b, c
    pop  hl
    ld   b, c
    pop  hl
    ld   b, c
    reti
    ld   b, c
    db   $E3 ; Undefined instruction
    ldi  [hl], a
    rst  $38
    inc  e
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
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    rst  $20
    inc  h
    di
    ld   [de], a
    di
    ld   [de], a
    ld   sp, hl
    add  hl, bc
    db   $FC ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    rst  $38
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
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    nop
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
    nop
    nop

label_AB254::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AB25E::
    nop
    nop
    rst  $18
    ld   d, b
    rst  $28
    jr   z, label_AB254
    jr   z, label_AB25E
    inc  d
    rst  $30
    inc  d
    rst  $38
    rst  $38
    rst  $38
    nop
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    cp   $02
    cp   $02
    rst  $38
    ccf
    ret  nz
    ret  nz
    ccf
    nop
    rst  $38
    ccf
    ret  nz
    ret  nz
    cp   a
    ccf
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    cp   $01
    ld   bc, $00FE
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    inc  bc
    ld    hl, sp+$F8
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b
    cp   a
    ccf
    rst  $18
    jr   nz, label_AB2BE
    sbc  a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AB2C8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ei
    ld   a, [bc]

label_AB2D2::
    rst  $30
    inc  d
    rst  $30
    inc  d
    rst  $28
    jr   z, label_AB2C8
    jr   z, label_AB2DA
    rst  $38
    rst  $38
    nop

label_AB2DE::
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   a, [$FF0F]

label_AB2EC::
    ld   [$FF1F], a

label_AB2EE::
    ret  nz
    ccf
    rst  $38
    nop
    rst  $38
    jr   label_AB2EC
    inc  h
    rst  $30
    inc  h
    rst  $38
    jr   label_AB2FA
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
    add  a, b
    ld   l, d
    ld   b, b
    dec  [hl]
    jr   nz, label_AB33D
    jr   nc, label_AB2EE
    rst  $18
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    xor  d
    nop
    ld   d, l
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    xor  d
    nop
    ld   d, l
    nop
    nop
    nop
    rst  $38
    rst  $38
    ccf
    jr   nz, label_AB2D2
    sub  a, b
    rst  8
    ld   c, b
    rst  $28
    jr   z, label_AB2DE
    inc  h
    ld   d, d
    ld   [de], a
    add  hl, bc

label_AB33D::
    add  hl, bc
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
    nop
    nop
    nop
    nop

label_AB354::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FD ; Undefined instruction
    dec  b
    cp   $02
    rst  $38
    ld   bc, label_1FF
    ld   d, l
    nop
    xor  d
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    or   l
    and  b
    xor  d
    and  b
    ld   d, b
    ld   d, b
    rst  $18
    rst  $18
    cp   $04
    db   $FD ; Undefined instruction
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    ei
    ld   a, [bc]
    rst  $38
    call z, label_ACBA
    sbc  a, [hl]
    sbc  a, d
    adc  a, d
    jp   z, label_C0FF
    ld   [rJOYP], a
    add  a, b
    nop
    nop
    nop
    rlca
    nop
    rra
    nop
    ccf
    jr   c, label_AB39E
    ld   b, c
    cp   $06
    ld   e, a
    ld   bc, label_43F
    rst  $38
    inc  b
    ei
    ld   a, [bc]
    di
    ldd  [hl], a
    db   $5D
    ld   e, l
    add  a, [hl]
    add  a, [hl]
    ld   a, a
    ld   d, b
    ccf
    jr   nc, label_AB354
    sbc  a, b
    rst  8
    ld   c, b
    ld   l, e
    dec  hl
    or   l
    dec  d
    cp   l
    dec  d
    sbc  a, c
    db   $DB
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FE
    cp   $02
    xor  l
    dec  b
    ld   d, l
    dec  b
    ld   a, [bc]
    ld   a, [bc]
    ei
    ei
    cp   a
    and  b
    ld   a, a
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ld   d, l
    nop
    xor  d
    nop
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
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld   [$FF1F], a
    ret  nz
    ccf

label_AB3F2::
    add  a, b
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
    nop
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
    rrca
    inc  bc
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
    add  a, b
    add  a, b
    ld   [$FF60], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AB42A::
    jr   c, label_AB42C

label_AB42C::
    ld   h, h
    jr   label_AB3F2
    inc  a
    nop
    nop
    inc  bc
    nop
    nop
    nop
    db   $E3 ; Undefined instruction
    nop
    rrca
    ld   a, [$FFC0]
    ccf
    ccf
    ret  nz
    ld   a, a
    add  a, b
    pop  hl
    jr   nz, label_AB42A

label_AB443::
    jr   nz, label_AB443
    ld   b, c
    cp   b
    ld   b, a
    ld   b, b
    add  a, b
    nop
    ld  [$FF00+C], a
    rst  $38
    nop
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  8
    nop
    add  a, a
    nop
    jr   nc, label_AB45D

label_AB45D::
    cp   $FC
    inc  bc
    add  a, c
    nop
    jp   label_3E00
    pop  bc
    inc  e
    db   $E3 ; Undefined instruction
    db   $10
    db   $EF
    nop
    rst  $38
    nop
    rlca
    nop
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AB478::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    res  5, d
    or   e
    sub  a, e
    ld   [hl], a
    ld   d, c
    ld   d, a
    ld   d, c
    scf
    ld   sp, label_1117
    rla
    ld   de, label_1117
    cp   $06
    ld    hl, sp+$38
    ret  z
    ret  z
    adc  a, b
    adc  a, b
    ld   [label_AA008], sp
    nop
    rrca
    rrca
    rra
    db   $10
    db   $02
    ld   [bc], a
    ld   [de], a
    ld   [de], a
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    ld   b, $00
    ld   [$FFF0], a
    ld    hl, sp+$08
    sbc  a, c
    push de
    push bc
    adc  a, c
    db   $ED ; Undefined instruction
    adc  a, c
    ld   [$EC8A], a
    adc  a, h
    db   $E8 ; add  sp, d
    adc  a, b
    db   $E8 ; add  sp, d
    adc  a, b
    db   $E8 ; add  sp, d
    adc  a, b
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
    ld   a, [$FF0F]
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF0F]
    ld   bc, label_FFE
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    cp   $01
    ld   a, [$FF0F]
    add  a, c
    ld   a, [hl]
    ccf
    ret  nz
    rst  $38
    nop
    cp   $00
    ld   a, [$FF00]
    rst  $38
    nop
    nop
    rst  $38
    rrca
    ld   a, [$FFFE]
    nop
    ld    hl, sp+$00
    pop  hl
    nop
    inc  bc
    nop
    rrca
    nop
    rst  $38
    nop
    ld   [$FF1F], a
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
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
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
    ld   a, [$FF0E]
    db   $FC ; Undefined instruction
    inc  bc
    rra
    pop  hl
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_1FE
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    inc  bc
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    nop

label_AB55B::
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    ld   a, [$FF0F]
    cp   $01
    rst  $38
    nop
    inc  bc
    nop
    nop
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
    add  a, b
    ld   a, a
    ld   sp, hl
    rlca
    rlca
    nop
    ret  nz
    nop
    rst  $38
    nop
    rla
    ld   de, label_90F
    inc  c
    dec  bc
    dec  b
    ld   b, $07
    inc  b
    rlca
    inc  b
    rlca
    rlca
    inc  b
    inc  b
    sbc  a, a
    db   $10
    db   $90
    db   $10
    db   $CF
    adc  a, a
    ld   a, [$FF60]
    ld   e, a
    ld   a, a
    ld   b, b
    ld   a, a
    rst  8
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    ld   [label_809], sp
    di
    pop  af
    ld   c, $07
    ld    hl, sp+$FF
    ld   [bc], a
    rst  $38
    rst  $20
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [$FF90]
    ld   a, [$FF90]
    ld   [$FFA0], a
    ld   h, b
    ld   [$FFA0], a
    jr   nz, label_AB55B
    jr   nz, label_AB5DD
    and  b
    and  b
    jr   nz, label_AB5D0
    ld   a, [$FF3F]
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    ret  nz
    nop

label_AB5D0::
    rst  $38
    nop
    ld   a, [$FF00]
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    ld   bc, label_700
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   bc, $0100
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
    ld    hl, sp+$00
    adc  a, $30
    jp   label_803C
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
    ret  nz
    nop
    rst  $38
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
    inc  bc
    inc  bc
    ld   a, a
    ld   a, h
    ld   [$FF80], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    db   $FC ; Undefined instruction
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
    rra
    rra
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    nop
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
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rrca
    nop
    rst  $38
    nop
    dec  c
    ld   [label_80B], sp
    dec  bc
    add  hl, bc
    ld   sp, hl
    ld   sp, hl
    add  hl, bc
    ld   [label_407], sp
    rst  $38
    inc  bc
    rst  $38
    nop
    ld   a, [hl]
    ld   h, d
    ld   a, b
    ld   a, a
    ld   [rIE], a
    rst  $38
    ld   a, a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    ccf
    inc  hl
    rra
    cp   $07
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FFF0]
    jr   label_AB6CC
    ld   [$8F08], sp
    rrca
    ld   a, [$FFF0]
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
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    nop
    inc  bc

label_AB6CC::
    rst  $38
    nop
    cp   $01
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   b, b
    nop
    di
    ld   [hl], b
    add  a, b
    inc  a
    jp   label_0
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  bc
    inc  sp
    nop
    ld   d, b
    rlca
    xor  b
    rlca
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    jr   nc, label_AB70C
    ld   [hl], b
    ld   c, $60
    rra
    ld   [$FF1F], a
    ret  nz
    ccf

label_AB70C::
    nop
    rst  $38
    nop
    rst  $38
    rlca
    nop
    ld   e, $01
    inc  a
    inc  bc
    ld    hl, sp+$07
    ld   a, [$FF0F]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    dec  bc
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, [$FF80]
    db   $FC ; Undefined instruction
    add  a, b
    pop  af
    add  a, b
    rst  8
    add  a, b
    rst  $38
    add  a, b
    ld   l, a
    ret  nz
    ld   a, [$FFC0]
    nop
    nop
    ld   bc, label_F00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3EFF
    nop
    nop
    rrca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    ld    hl, sp+$FF
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
    rra
    rst  $38
    ld   [rIE], a
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
    rlca
    rst  $38
    ld    hl, sp+$FF
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
    rlca
    rst  $38
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
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
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
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
    nop
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    nop
    adc  a, $31
    db   $E4 ; Undefined instruction
    dec  de
    cp   $01
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
    ld   d, a
    xor  b
    add  a, a
    ld   a, b
    xor  e
    ld   d, h
    cp   $FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    rst  $38
    cp   $01
    ld    hl, sp+$07
    ld   [$FF1F], a
    ret  nz
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    ld   a, [$FF3F]
    ret  nz
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
    ld   a, a
    rst  0
    ccf
    ld    hl, sp+$08
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$0E
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    cp   $FF
    ret  nz
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
    adc  a, a
    nop
    rlca
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    jr   label_AB84C
    ld   h, b
    db   $FC ; Undefined instruction
    add  a, b
    rst  $38
    nop
    rst  $38
    rlca
    cp   $18
    ld   a, [$FFE0]
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   a, a
    ld   [$FF80], a
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    inc  a
    inc  a
    rlca
    inc  bc
    dec  b
    dec  b
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   h, b
    ld   h, b
    ld   [hl], b
    jr   nc, label_AB917
    jr   nz, label_AB8A1

label_AB8A1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, a
    nop
    rra
    nop
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    nop
    inc  bc
    nop
    ccf
    nop
    cp   $FC
    inc  bc
    ld    hl, sp+$07
    pop  hl
    ld   e, $83
    ld   a, h
    rlca
    ld    hl, sp+$1E
    pop  hl
    ld   a, b
    rlca
    ld   [$FF1F], a
    rlca
    ld    hl, sp+$3F
    ret  nz
    db   $FC ; Undefined instruction
    inc  bc
    ret  nz
    ccf
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_AB900::
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    db   $FC ; Undefined instruction
    ld   b, $F6
    ld   [label_18F0], sp
    ld   [$FF08], a
    ld   a, [$FF07]
    ld    hl, sp+$00
    ret  nz
    nop
    nop
    nop
    nop
    nop

label_AB917::
    nop
    nop
    nop

label_AB91A::
    nop
    nop
    nop
    nop

label_AB91E::
    nop
    nop
    rla
    ccf
    rlca
    nop
    ld   bc, label_F00
    nop
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   b, [hl]
    cp   $F8
    ld   a, b
    pop  af
    jr   c, label_AB91A
    db   $10
    db   $C3
    jr   nz, label_AB91E
    jr   nz, label_AB900
    ld   b, b
    pop  bc
    ld   b, b
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
    ld   [rJOYP], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_601
    ld   b, $19
    add  hl, de
    nop
    nop
    nop
    nop
    ld   bc, label_E01
    ld   c, $70
    ld   [hl], b
    sbc  a, b
    sbc  a, b
    ld   h, b
    ld   h, b
    add  a, b
    add  a, b

label_AB980::
    ld   [bc], a
    ld   [bc], a
    ld   a, h
    ld   a, b
    adc  a, h
    add  a, h
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [hl], $36

label_AB98E::
    ld   l, d
    ld   l, d
    ld   a, h
    jr   nc, label_ABA12
    jr   nc, label_ABA14
    jr   nc, label_ABA16
    jr   nc, label_ABA18
    jr   nc, label_ABA1A
    jr   c, label_AB98E
    ld   a, $F0
    ccf
    nop
    nop
    nop
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    add  a, e
    ld   a, h
    ld   c, $F0
    jr   label_AB99E
    jr   nc, label_AB980
    nop
    ccf
    rrca
    ld   a, [$FF3C]
    ret  nz
    ret  nz
    nop
    add  a, b
    nop
    inc  bc
    nop
    rlca
    nop
    inc  b
    dec  bc
    inc  bc
    ret  nz
    rrca
    nop
    ld   e, $01
    jr   c, label_AB9DF
    ld   a, [$FF0F]
    pop  bc
    ld   a, $8F
    ld   [hl], b
    ld   a, a

label_AB9DF::
    add  a, b
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    rlca
    ld    hl, sp+$7F
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    rst  $38
    rra
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    add  a, b
    nop
    rlca
    nop

label_ABA00::
    ld   c, $F0
    rlca
    ld    hl, sp+$1F
    ld   [rVBK], a
    or   b
    rst  $38
    nop
    di
    nop
    di
    nop
    rst  $38
    nop
    nop
    nop

label_ABA12::
    jr   c, label_ABA14

label_ABA14::
    jr   nc, label_ABA16

label_ABA16::
    ld   sp, $F300
    nop

label_ABA1A::
    rst  $38
    nop
    ld  [$FF00+C], a
    nop
    ld   [rJOYP], a
    inc  bc
    nop
    rlca
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
    ld   [rLCDC], a
    ld   [rNR41], a
    ld   a, [$FF20]
    db   $FC ; Undefined instruction
    jr   nz, label_ABAB5
    db   $10
    db   $3E
    db   $10
    db   $7F
    db   $10
    db   $7F
    ld   [$00FF], sp
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
    add  a, b
    nop
    nop
    nop
    cp   $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or   $66
    ld   l, b
    ld   c, b
    ld   [hl], b
    ld   d, b
    ld   [hl], c
    ld   d, c
    ld   a, c
    ld   l, c
    add  hl, sp
    add  hl, hl
    jr   c, label_ABA96
    inc  e
    inc  d
    rra
    rra
    ld   l, b
    ld   l, b
    adc  a, [hl]
    adc  a, b
    ld   c, [hl]
    ld   c, b
    ld   c, c
    ld   c, c
    ld   c, $0E
    ld    hl, sp+$F8
    ld   bc, $CB01
    jp   z, label_AAA6B
    ld   e, e
    ld   e, d
    add  a, e
    add  a, e
    inc  bc
    ld   [bc], a
    rrca
    inc  c
    ld   a, a
    ld   [hl], b
    rst  $38
    add  a, b
    ld    hl, sp+$7F
    db   $FC ; Undefined instruction
    ld   c, a
    cp   $C7

label_ABA96::
    rst  $38
    add  a, e
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    cp   $01
    nop
    rst  $38
    ld   bc, label_7FE
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    db   $FC ; Undefined instruction
    add  a, c
    ld   h, b
    add  a, b
    ld   [rJOYP], a
    ret  nz

label_ABAB5::
    nop
    ret  nz
    ld   bc, label_780
    add  a, b
    inc  e
    nop
    ld   [hl], b
    rlca
    ld   [rSB], a
    ld   a, $07
    ld   a, b
    rra
    ld   [$FF78], a
    add  a, b
    rlca
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    add  a, c
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
    ld   [rJOYP], a
    rrca
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
    cp   $01
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    pop  hl
    ld   bc, $00FC
    db   $FC ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    ld   bc, label_6F8
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, $00F8
    nop
    nop
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
    nop
    add  a, b
    nop
    add  a, b
    ccf
    ld   [label_C7B], sp
    dec  a
    ld   c, $1C
    rrca
    inc  a
    rrca
    ld   e, $0F
    rra
    rlca
    add  hl, sp
    rlca
    ld   a, [$FF00]
    cp   $00
    rst  $38
    nop
    ld   a, a
    add  a, b
    ccf
    ld   [$FF2F], a
    rst  $38
    scf
    ld    hl, sp+$3B
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, $FEFD
    rst  $38
    nop
    rst  $38
    nop
    inc  e
    inc  d
    inc  e
    inc  d
    ld   a, $0A
    rst  $38
    rra
    rst  $18
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    ld   b, $1E
    jr   label_ABBE5
    ld   h, b
    ld   [$FF80], a
    ld   a, [$FF00]
    pop  af
    nop
    ei
    ld   bc, label_2FF
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    ccf
    rrca
    ld   a, a
    ld   sp, $C1FF
    rst  $38
    ld   bc, label_18F
    cp   $01
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    ld   a, a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  c
    inc  c
    ld   l, a
    ld   l, [hl]
    ld   l, e
    ld   l, d
    rla
    ld   d, $F0
    adc  a, a
    ld   [$FFFC], a
    inc  bc
    nop
    rlca
    nop
    ld   a, a
    nop
    rst  $38
    inc  c
    di
    ld   [de], a
    di
    ld   [de], a
    rra
    add  a, b
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
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$FF0F]
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    ld   a, [$FF0F]
    nop

label_ABBE5::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   [rNR10], a
    ld   [rNR10], a
    ld   a, [$FF0C]
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    nop
    add  a, b
    nop
    add  a, b
    rrca
    rlca
    dec  e
    rlca
    ld   a, $07
    ld   a, $03
    rra
    inc  bc
    inc  b
    inc  bc
    ld   b, $03
    rlca
    ld   bc, $FE1F
    ccf
    ei
    pop  hl
    ret  nz
    ret  nz
    ret  nz
    add  a, $86
    adc  a, a
    adc  a, c
    adc  a, e
    adc  a, b
    adc  a, a
    adc  a, a
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $18
    ld   [$FFF7], a
    ld    hl, sp+$7C
    ld   a, a
    ld   a, a
    ld   [hl], e
    add  hl, sp
    jr   c, label_ABCD7
    ld   a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    inc  bc
    ld   b, $FE
    ld    hl, sp+$F8
    ld    hl, sp+$08
    ld   a, $38
    rst  $30
    inc  c
    rst  $18
    inc  a
    ld   h, a
    and  $83
    add  a, d
    db   $E3 ; Undefined instruction
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    ld  [$FF00+C], a
    rlca
    inc  b
    ld   c, $0E
    rlca
    ld   bc, $0003
    ld   bc, $0000
    nop
    ld   bc, $C001
    nop
    ld   [rJOYP], a
    nop
    nop
    cp   e
    cp   e
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    add  a, d
    rrca
    push hl
    rst  $28
    inc  [hl]
    ccf
    nop
    ccf
    call nz, label_AA4FF
    ld   a, a
    rst  $38
    adc  a, h
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ret  nz
    ccf
    ld    hl, sp+$07
    ld   [$FF1F], a
    ret  nz
    ccf
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc

label_ABCD7::
    db   $FC ; Undefined instruction
    rlca
    ei
    inc  a
    call nz, label_18F8
    ld   a, [$FF30]
    rra
    ld   [$FF3F], a
    rst  0
    ld   a, b
    adc  a, b
    ld   a, [$FF30]
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $C0
    jr   c, label_ABD28
    inc  c
    inc  c
    inc  bc
    inc  bc
    ld   bc, $8101
    ld   bc, $0080
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, c
    add  a, b
    add  a, e
    add  a, b
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
    nop
    or   b
    nop
    and  b
    nop
    ld    hl, sp+$F0
    ld   [label_9F0], sp
    ld   a, [$FF0D]
    ld    hl, sp+$07
    ld    hl, sp+$00
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
    nop
    nop
    nop
    adc  a, l
    adc  a, h
    call z, label_CC88
    ret  z
    call nz, label_AA7C4
    ld   b, [hl]
    ld   [hl], e
    ld   h, e
    jr   c, label_ABD7E
    rrca
    rrca
    db   $E4 ; Undefined instruction
    ld   a, h
    db   $E4 ; Undefined instruction
    ld   a, h
    db   $E4 ; Undefined instruction
    inc  a
    ld  [$FF00+C], a
    ld   a, $F3
    ccf
    ld   a, [$FFFF]
    ld   h, h
    ld   a, a
    db   $E4 ; Undefined instruction
    rst  $38
    daa
    daa
    inc  h
    inc  h
    jr   label_ABD7E
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, e
    ld   bc, label_6EB
    rst  $38
    ld   a, [$FFF0]
    nop
    jr   nc, label_ABD75

label_ABD75::
    jr   c, label_ABDB7
    ld   a, a
    add  a, a
    rst  $38
    add  a, e
    rst  $38
    nop
    rst  $38

label_ABD7E::
    db   $10
    db   $FF
    nop
    nop
    nop
    nop
    jp   nz, label_3CC3
    rst  $38
    add  a, b
    rst  $38
    inc  b
    rst  $38
    inc  hl
    rst  $38
    inc  a
    rst  $38
    ld   h, b
    ld   a, a
    set  7, a
    dec  b
    rst  $38
    rrca
    rst  $38
    sbc  a, a
    ei
    rst  $28
    rst  $20
    or   $B3
    ldd  [hl], a
    sub  a, e
    rst  $38
    add  a, b
    ld    hl, sp+$07
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    ld   a, [$FF00]
    rst  $38
    nop

label_ABDB3::
    rst  $38
    nop
    rst  $38
    nop

label_ABDB7::
    rst  $38
    ld   bc, label_1FFE
    ld   [rIE], a
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FF3D]
    pop  bc
    ld   a, b
    add  a, c
    ei
    nop
    ld   [rJOYP], a
    db   $FD ; Undefined instruction
    nop
    ld   a, $00
    ld   h, e
    ld   h, e
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    add  a, d
    nop
    ld   bc, $C300
    nop
    daa
    ld   b, b
    rst  $18
    rst  0
    ld   a, a
    ld   l, h
    rra
    jr   label_ABDFE
    ld   b, $1D
    ld   hl, label_2109
    db   $DB
    ld   bc, label_AA2E3
    rst  $30
    ld   bc, $E2FF
    rst  $38
    inc  a
    cp   $10
    db   $FC ; Undefined instruction
    db   $10
    db   $FF
    ld   [label_7FF], sp

label_ABDFE::
    cp   $3C
    inc  bc
    nop
    rlca
    nop
    rrca
    nop
    rra
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   b, a
    ld   b, b
    ld   l, a
    ld   h, b
    ld   a, a
    ld   [hl], b
    ld   e, a
    ld   d, b
    ld   c, a
    ld   c, b
    rst  8
    adc  a, b
    rst  $28
    adc  a, b
    ld   a, a
    ld   [hl], b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    jr   nz, label_ABDB3
    jr   c, label_ABE35

label_ABE35::
    db   $10
    db   $70
    nop
    ld   [rTMA], a
    ld   [rJOYP], a
    db   $F4 ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ccf
    inc  bc
    ccf
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   [hl], b
    rst  $38
    ld   [hl], $FF
    adc  a, l
    ld   a, a
    pop  af
    ccf
    db   $FC ; Undefined instruction
    rrca
    rst  $38
    inc  bc
    ccf
    inc  bc
    inc  e
    nop
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   bc, $00FF
    rst  $38
    db   $10
    db   $FF
    ld  [$FF00+C], a
    rst  $38
    ld   a, [$FF00+C]
    ld   a, [$FFFF]
    add  hl, bc
    rst  $38
    inc  bc
    rst  $38
    cp   $FC
    ld   a, e
    ld  [$FF00+C], a
    add  hl, de
    pop  af
    inc  e
    db   $FC ; Undefined instruction
    dec  c
    cp   $07
    rst  $38
    pop  hl
    rst  $38
    add  a, $FF
    pop  de
    ld   a, b
    inc  bc
    ld   a, a
    cp   $FC
    nop
    nop
    adc  a, l
    inc  bc
    rst  $38
    cp   $B4
    db   $D3 ; Undefined instruction
    ld   h, a
    inc  h
    rst  8
    call nz, label_89F
    ccf
    db   $10
    db   $FF
    ld   h, b
    rst  $38
    add  a, b
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
    cp   $00
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
    ld   [rJOYP], a
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    rst  $18
    jr   nc, label_ABEE2
    rrca
    ld   a, [$FF00]
    ld   [rJOYP], a
    ret  nz
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    cp   a
    cp   a

label_ABEE2::
    nop
    nop
    inc  bc
    nop
    rlca
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    add  a, $FF
    inc  bc
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
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ld   [$FF1F], a
    ret  nz
    ccf
    ret  nz
    ccf
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
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
    cp   $01
    cp   $01
    cp   $01
    rst  $38
    nop
    db   $FD ; Undefined instruction
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
    add  a, b
    nop
    jr   nz, label_ABF44

label_ABF44::
    ld   [rJOYP], a
    pop  af
    nop
    rst  $30
    nop
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    ld   bc, label_700
    nop
    sub  a, l
    nop
    cp   $00
    ld   [hl], e
    nop
    di
    nop
    db   $FD ; Undefined instruction
    nop
    rra
    rra
    nop
    nop
    jp   nz, label_CF00
    nop
    di
    nop
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    xor  a
    rst  $38
    ld   a, [$FFF0]
    rlca
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
    cp   $00
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    rrca
    nop
    ccf
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    nop
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
    ret  nz
    nop
    nop
    nop
    inc  bc
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
    rrca
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
    add  a, b
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
    rst  $38
    ld   b, b
    rst  $38
    ret  nz
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
