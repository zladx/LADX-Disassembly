section "bank15",romx,bank[$0F]
    add  a, a
    add  a, a
    ld   bc, $C001
    ret  nz
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    jr   label_3C024
    add  a, c
    add  a, c
    add  a, e
    add  a, e
    rst  $20
    rst  $20
    rst  8
    rst  8
    ret
    rst  8
    adc  a, c
    adc  a, a
    sbc  a, c
    sbc  a, a
    sub  a, e
    sbc  a, a
    ld   [de], a
    ld   e, $1F

label_3C01F::
    rra
    rst  0
    rst  0
    jp   label_83C3
    add  a, e
    sub  a, e
    sub  a, e
    or   e
    or   e
    ld   sp, $0131
    ld   bc, label_303
    cp   c
    cp   c
    add  hl, sp
    add  hl, sp
    ld   sp, label_3131
    ld   sp, label_202
    ld   [bc], a
    ld   [bc], a
    add  a, [hl]
    add  a, [hl]
    and  $E6
    add  a, e
    add  a, e
    ld   [bc], a
    ld   [bc], a
    rra
    rra
    ld   sp, label_1F3F
    rra
    inc  bc
    inc  bc
    rlca
    rlca
    ccf
    ccf
    rst  $38
    rst  $38
    call nc, label_9CDC
    sbc  a, h
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    jp   label_FFC3
    rst  $38
    di
    di
    jp   label_C3C3
    jp   label_8181
    sbc  a, l
    sbc  a, l
    dec  e
    dec  e
    add  hl, sp
    add  hl, sp
    rst  $38
    rst  $38
    xor  d
    cp   d
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    ldd  [hl], a
    rst  $38
    rst  $38
    dec  de
    rra
    dec  c
    rrca
    ld   b, l
    ld   b, a
    ld   h, l
    ld   h, a
    ld   h, l
    ld   h, a
    dec  c
    rrca
    ccf
    ccf
    rrca
    rrca
    inc  bc
    inc  bc
    ld   sp, label_3931
    add  hl, sp
    ld   sp, label_331
    inc  bc
    rra
    rra
    rrca
    rrca
    rra
    rra
    rrca
    rrca
    add  a, e
    add  a, e
    pop  hl
    pop  hl
    pop  af
    pop  af
    inc  bc
    inc  bc
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    rrca
    rrca
    ld   bc, label_301
    inc  bc
    rra
    rra
    rra
    rra
    ld   bc, label_3C301
    ld   b, e
    rst  $38
    rst  $38
    sbc  a, a
    sbc  a, a
    sbc  a, c
    sbc  a, a
    add  hl, de
    rra
    rra
    rra
    add  hl, de
    add  hl, de
    ld   bc, $8701
    add  a, a
    rst  $38
    rst  $38
    rrca
    rrca
    ld   bc, label_301
    inc  bc
    rra
    rra
    rra
    rra
    ld   bc, label_3C301
    ld   b, e
    rst  $38
    rst  $38
    rra
    rra
    jr   nc, label_3C123
    scf
    ccf
    dec  e
    dec  e
    ld   bc, $8101
    add  a, c
    jp   label_FFC3
    rst  $38
    rst  $38
    rst  $38
    rst  8
    ld   a, [$FF97]
    ld   [$FF93], a
    ld   [$FF85], a
    ld    hl, sp+$82
    db   $FC ; Undefined instruction
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    sbc  a, a
    sbc  a, a
    sub  a, e
    sbc  a, a
    or   c
    cp   a
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    add  a, c
    add  a, c
    ld   bc, label_D01
    dec  c
    add  hl, de
    add  hl, de
    ld   bc, $8701
    add  a, a
    rst  $38
    rst  $38
    pop  bc
    pop  bc
    add  a, c
    add  a, c
    adc  a, a
    adc  a, a
    sbc  a, a
    sbc  a, a
    inc  sp
    inc  sp
    ld   [hl], e

label_3C123::
    ld   [hl], e
    ld   d, a
    ld   [hl], a
    db   $FD ; Undefined instruction
    rst  $38
    ld   h, l
    rst  $20
    ld   c, l
    rst  8
    call label_8FCF
    adc  a, a
    adc  a, $CE
    adc  a, d
    adc  a, [hl]
    sbc  a, d
    sbc  a, [hl]
    rst  $38
    rst  $38
    pop  bc
    pop  bc
    add  a, c
    add  a, c
    adc  a, a
    adc  a, a
    sbc  a, a
    sbc  a, a
    ccf
    ccf
    inc  bc
    inc  bc
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    ld   [hl], c
    pop  af
    pop  bc
    pop  bc
    add  a, c
    add  a, c
    adc  a, a
    adc  a, a
    di
    di
    ld   h, a
    rst  $20
    ld   b, l
    rst  0
    ld   c, l
    rst  8
    ld   a, e
    rst  $38
    jp   nc, label_92DE
    sbc  a, [hl]
    sbc  a, [hl]
    sbc  a, [hl]
    add  hl, sp
    add  hl, sp

label_3C162::
    inc  sp
    inc  sp
    add  a, e
    add  a, e
    rst  0
    rst  0
    cp   $FF
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    pop  hl
    pop  hl
    pop  bc
    pop  bc
    ldi  [hl], a
    ldi  [hl], a
    ld   [bc], a
    ld   [bc], a
    ld   b, $06
    rst  0
    rst  0
    ld   a, a
    rst  $38
    call z, label_8CCC
    adc  a, h
    adc  a, h
    adc  a, h
    rra
    rra
    ld   c, $0F
    ld   b, [hl]
    ld   b, a
    ld   h, [hl]
    ld   h, a
    rst  $38
    rst  $38
    ld   a, [$FFF0]
    ld   h, b
    ld   h, b
    ld   h, e
    ld   h, e
    rst  $38
    rst  $38
    ei
    rlca
    ld   bc, label_3FFFF
    rst  $38
    pop  bc
    pop  bc
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    sbc  a, b
    sbc  a, b
    adc  a, h
    adc  a, h
    adc  a, h
    adc  a, h
    dec  b
    dec  b
    ld   de, label_1111
    ld   de, label_3939
    add  hl, hl
    add  hl, sp
    cp   e
    cp   e
    ret
    ret
    reti
    reti
    sbc  a, b
    sbc  a, b
    nop
    nop
    add  a, c
    add  a, c
    sbc  a, c
    sbc  a, c
    cp   c
    cp   c
    cp   e
    cp   e
    adc  a, b

label_3C1C1::
    adc  a, b
    add  a, b

label_3C1C3::
    add  a, b
    and  d
    and  d
    and  d
    and  d
    or   [hl]
    or   [hl]
    cp   [hl]
    cp   [hl]
    and  d
    cp   [hl]
    cp   [hl]
    cp   [hl]
    ld   h, a
    ld   h, a
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, e
    ld   b, e
    ld   b, a
    ld   b, a
    ld   c, [hl]
    ld   c, [hl]
    ld   b, b
    ld   b, b
    pop  hl
    pop  hl
    ld   sp, hl
    ld   sp, hl
    di
    di
    and  [hl]
    rst  $20
    xor  h
    rst  $28
    and  h
    rst  $20
    cp   h
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $20
    rst  $20
    rst  $20
    rst  $38
    rst  $38
    rla
    db   $E3 ; Undefined instruction
    rst  8
    ld   bc, label_1FF
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    add  a, e
    ld   a, l
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    add  a, c
    ld   bc, label_1C1
    di
    inc  bc
    ei
    add  a, e
    rst  $38
    and  a
    rst  $38
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    nop
    sbc  a, a
    add  a, c
    cp   a
    add  a, e
    rst  $38
    jp   label_D7FF
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    di
    db   $F8
    ld    hl, sp+$FC
    ld   l, h
    ld   l, l
    inc  h
    add  a, c
    inc  h
    ld   e, d
    add  a, c
    ld    hl, sp+$F8
    rst  0
    add  a, a
    ld   a, [hl]
    ld   h, h
    rra
    jr   label_3C258
    ld   de, label_332F
    cpl
    inc  sp
    rst  $38
    db   $FC ; Undefined instruction
    ld   c, $0E
    ld   a, [$FF00+C]
    inc  e
    inc  e
    ld    hl, sp+$C8
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $F4 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $F4 ; Undefined instruction
    db   $FC ; Undefined instruction
    call nz, label_8487
    add  a, a
    db   $F4 ; Undefined instruction
    rst  $20
    sub  a, [hl]
    rst  $20
    sub  a, l

label_3C258::
    rst  $20
    sub  a, h
    push hl
    sub  a, a
    and  $97
    push hl
    sub  a, [hl]
    cp   $C7
    db   $FD ; Undefined instruction
    push bc
    rst  $38
    dec  e
    rst  $28
    push hl
    ld   e, $07
    cp   $E7
    sbc  a, l
    dec  e
    rst  $38
    add  hl, bc
    add  a, a
    rst  $30
    add  a, l
    add  a, [hl]
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $28
    ld   b, a
    ld   [hl], b
    ldi  [hl], a
    xor  c
    nop
    ld   e, l
    add  a, b
    rst  $38
    rst  $38
    rst  $18
    rst  $20
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    ld   h, d
    ldd  [hl], a
    ld   a, $4E
    inc  c
    push af
    nop
    sbc  a, e
    ld   h, b
    rst  $38
    rst  $38
    db   $EC ; Undefined instruction
    inc  de
    add  a, b
    ld   a, a
    ld   hl, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    rlca
    ld   hl, $B321
    or   e
    cp   $FF
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $C7C7
    inc  bc
    inc  bc
    ld   [hl], e
    ld   [hl], e
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   a, e
    ld   a, e
    dec  de
    dec  de
    ld   a, e
    ld   a, e
    ld   h, e
    ld   h, e
    ld   h, e
    ld   h, e
    ld   a, e
    ld   a, e
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   a, e
    ld   a, e
    dec  de
    dec  de
    ld   a, e
    ld   a, e
    dec  de
    dec  de
    dec  de
    dec  de
    ld   a, e
    ld   a, e
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    sub  a, e
    sub  a, e
    ld   l, l
    ld   bc, label_17D
    cp   e
    add  a, e
    rst  $10
    rst  0
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  0
    rst  0
    ld   b, a
    rst  0
    ld   b, l
    rst  0
    ld   c, l
    rst  8
    ld   c, c
    rst  8
    ld   c, c
    rst  8
    ld   e, c
    rst  $18
    rst  $38
    rst  $38
    rst  $38

label_3C301::
    rst  $38
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ei
    ei
    ei
    ei
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    reti
    reti
    ei
    ei
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    add  a, e
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    reti
    reti
    di
    di
    ei
    ei
    cp   e
    cp   e
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ei
    ei
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    db   $DB
    db   $DB
    add  a, c
    add  a, c
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  hl
    pop  hl
    rst  $28
    rst  $28
    rst  0
    rst  0
    ei
    ei
    ei
    ei
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ei
    ei
    rst  $30
    rst  $30
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    sbc  a, e
    sbc  a, e
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    pop  bc
    ei
    ei
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  hl
    pop  hl
    db   $DB
    db   $DB
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    reti
    reti
    db   $DB
    db   $DB
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, a
    add  a, a
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, h
    sbc  a, h
    sbc  a, c
    sbc  a, c
    sub  a, e
    sub  a, e
    add  a, e
    add  a, e
    adc  a, c
    adc  a, c
    sbc  a, h
    sbc  a, h
    rst  $38
    rst  $38

label_3C3C0::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_C08], sp
    inc  c
    cp   $FE
    rst  $38
    rst  $38
    cp   $FE
    inc  c
    inc  c
    ld   [$0008], sp
    nop
    nop
    nop
    nop

label_3C3F3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_3C3FE::
    nop

label_3C3FF::
    nop
    rst  $38
    rlca
    rst  $38
    rra
    rst  $38
    jr   nc, label_3C406
    ld   h, b
    rst  $38
    ld   b, b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    ld   a, b
    rst  $38
    ld   a, b
    rst  $38
    ld   sp, label_2FF
    rst  $38
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_3C426
    db   $10 ; Undefined instruction
    jr   label_3C42A
    sbc  a, b
    rst  $38
    adc  a, l
    rst  $38
    adc  a, a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [rIE], a
    db   $E3 ; Undefined instruction
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   bc, label_6FF
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    jr   label_3C44A
    sbc  a, b
    rst  $38
    jr   label_3C44E
    jr   label_3C450
    ret  nz
    rst  $38
    jr   nc, label_3C454
    jr   label_3C456
    jr   label_3C458
    inc  c
    rst  $38
    dec  c
    rst  $38
    dec  c
    rst  $38
    dec  c
    rst  $38
    nop
    rst  $38
    ld   bc, label_FFF
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    inc  l
    rst  $38
    ld   l, h
    rst  $38
    ld   c, [hl]
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
    db   $FC ; Undefined instruction
    rst  $38
    ld   h, $FF
    ld   h, $FF
    ret  nz
    rst  $38
    jp   label_E3FF
    rst  $38
    ld   h, b
    rst  $38
    ld   [hl], b
    rst  $38
    jr   c, label_3C48C
    rra
    rst  $38
    rlca
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    inc  h
    rst  $38
    cpl
    rst  $38
    inc  l
    rst  $38
    ld   l, h
    rst  $38
    call z, label_80FF
    rst  $38
    adc  a, d
    rst  $38
    adc  a, d
    rst  $38
    ret  z
    rst  $38
    ret  z
    rst  $38
    ret  z
    rst  $38
    jr   label_3C4AC
    ld   a, b
    rst  $38
    ld   h, b
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, a
    rst  $38
    ld   h, [hl]
    rst  $38
    db   $76 ; Halt
    rst  $38
    db   $76 ; Halt
    rst  $38
    rrca
    rst  $38
    nop
    rst  $38
    jr   label_3C4C2
    jr   label_3C4C4
    adc  a, b
    rst  $38
    inc  c
    rst  $38
    inc  b
    rst  $38
    inc  bc
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    dec  c
    rst  $38
    dec  c
    rst  $38
    add  hl, de
    rst  $38
    add  hl, de
    rst  $38
    ld   [hl], c
    rst  $38
    pop  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   c, h
    rst  $38
    ld   c, h
    rst  $38
    adc  a, h
    rst  $38
    adc  a, h
    rst  $38
    sbc  a, a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, $FF
    inc  l
    rst  $38
    jr   nc, label_3C4F6
    jr   z, label_3C4F8
    inc  l
    rst  $38
    ld   h, a
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    ret  nz
    rst  $38
    nop
    ret  nc
    cpl
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    adc  a, c
    ld   [hl], a
    adc  a, d
    ld   a, a
    call nz, label_FF3C
    nop
    ld   hl, label_20DE
    rst  $38
    ld   bc, label_3FEFF
    rst  $38
    sbc  a, a
    ld   [rDIV], a
    nop
    ld   d, e
    ld   [rIE], a
    nop
    ret  nz
    ccf
    sbc  a, a
    ld   a, a
    rst  $28
    ld   a, [$FFC0]
    nop
    inc  bc
    nop
    rrca
    ld   bc, label_1FF
    rst  $38
    nop
    rrca
    rst  $38
    db   $F4 ; Undefined instruction
    ld    hl, sp+$83
    nop
    jr   c, label_3C541
    rst  $20
    rra
    add  hl, de
    cp   $EC
    ld   a, [$FF7F]

label_3C541::
    rst  $38
    and  d

label_3C543::
    pop  bc
    dec  e

label_3C545::
    ld   c, $B7
    ld   a, b
    rst  $18
    ld   [$FF7B], a
    add  a, b
    add  a, c
    nop
    ld   bc, $E800
    add  hl, de
    inc  de
    ld   a, [$FF51]
    cp   b
    jr   label_3C554
    ld   sp, label_27E0
    ld   [$FF2F], a
    ld   [$FF67], a
    ld   [$FFF8], a
    ld   a, [$FF7E]
    cp   $B9
    ld   a, b
    db   $DB
    jr   c, label_3C543
    add  hl, sp
    push af
    inc  sp
    xor  d
    ld   h, a
    db   $3E
    ld   a, $E2
    rra
    adc  a, [hl]
    ld   a, h
    inc  d
    ld    hl, sp+$E8
    ld   a, [$FFA0]
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    ld   a, e
    db   $FC ; Undefined instruction
    rst  $10
    adc  a, a
    dec  h
    add  a, e
    ld   [hl], b
    nop
    cp   $00
    sbc  a, a
    nop
    adc  a, a
    nop
    ld   bc, $EF00
    rra
    or   h
    ld   a, b
    jp   nc, label_3CFE0
    ret  nz
    ccf
    ld   b, b
    dec  a
    nop
    db   $E8 ; add  sp, d
    nop
    ret  nz
    nop
    ld   bc, $8F00
    nop
    sbc  a, [hl]
    nop
    db   $FC ; Undefined instruction
    ld   bc, label_1FD
    ld   sp, label_501
    add  a, e
    sub  a, a
    adc  a, a
    add  a, b
    nop
    ld   [rJOYP], a
    jp   [hl]
    nop
    ld   a, l
    nop
    ld   a, a
    nop
    add  a, a
    nop
    ret  nc
    ld   [$FFF4], a
    ld    hl, sp+$8E
    add  a, b
    sbc  a, h
    add  a, b
    call c, label_8C80
    ret  nz
    xor  $C0
    adc  a, $E0
    ld   l, [hl]
    ld   [$FF67], a
    ld   [$FF71], a
    ld   bc, $0139
    dec  sp
    ld   bc, label_331
    ld   [hl], a
    inc  bc
    ld   [hl], e
    rlca
    db   $76 ; Halt
    rlca
    and  $07
    jp   label_E770
    ld   b, b
    rst  $30
    ld   h, b
    rrca
    ret  nz
    call c, label_9880
    add  a, b
    call c, label_3CF80
    ld   [$FFC3], a
    ld   c, $E6
    inc  bc
    rst  $28
    rlca
    pop  af
    inc  bc
    dec  sp
    ld   bc, $0119
    dec  sp
    ld   bc, label_7F3
    rrca
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rra
    nop
    rrca
    nop
    ld   a, [$FF00]
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    cp   $00
    ld    hl, sp+$00
    ld   a, [$FF00]
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
    ld   a, $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, $00
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
    ei
    db   $FC ; Undefined instruction
    ld   d, l
    adc  a, [hl]
    ld   c, $07
    and  $07
    di
    rlca
    rst  $30
    inc  bc
    di
    inc  bc
    db   $E3 ; Undefined instruction
    inc  bc
    jp   [hl]
    ld   a, [$FFE3]
    ret  nz
    rst  $28
    ret  nz
    rst  $20
    ret  nz
    ret  nc
    ld   [$FF7A], a
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    cp   $FF
    ld   a, l
    ld   bc, label_179
    ei
    ld   bc, label_3F9
    pop  af
    inc  bc
    ld   h, a
    inc  bc
    dec  bc
    add  a, a
    rla
    adc  a, a
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    ei
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, c
    cp   $7F
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ei
    rst  $38
    ld   a, a
    rst  $38
    cp   a
    ld   a, a
    adc  a, a
    ld   a, a
    rst  0
    ccf
    nop
    nop
    ld   [hl], c
    ld   [hl], c
    adc  a, d
    adc  a, d
    add  a, d
    add  a, d
    ld   [hl], e
    ld   [hl], e
    ld   a, [bc]
    ld   a, [bc]
    adc  a, d
    adc  a, d
    ld   [hl], d
    ld   [hl], d
    nop
    nop
    ret  z
    ret  z
    jr   z, label_3C6CE
    jr   z, label_3C6D0
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    dec  h
    dec  h
    dec  h
    dec  h
    ldi  [hl], a
    ldi  [hl], a
    nop
    nop
    cp   [hl]
    cp   [hl]
    and  b
    and  b
    and  b
    and  b
    cp   h
    cp   h
    jr   nz, label_3C6DC
    jr   nz, label_3C6DE
    ld   a, $3E
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   b, $06
    add  hl, bc
    add  hl, bc
    ld   [label_708], sp
    rlca

label_3C6D0::
    nop
    nop
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    ld   h, b
    ld   h, b
    add  a, b
    add  a, b

label_3C6DC::
    ret  nz
    ret  nz

label_3C6DE::
    jr   nz, label_3C700
    rst  $38
    nop
    call nz, label_803B
    ld   a, a
    add  a, b
    ld   a, a
    sub  a, b
    ld   l, a
    add  a, d
    ld   a, a
    add  a, d
    ld   a, l
    ret  nz
    ccf
    rst  $38
    nop
    ld   de, label_10FE
    rst  $28
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_1F7], sp
    cp   $00
    nop
    ld   [hl], c
    ld   [hl], c
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    add  a, d
    add  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    ld   [hl], c
    ld   [hl], c
    nop
    nop
    ret  z
    ret  z
    jr   z, label_3C73E
    inc  l
    inc  l
    ld   a, [hli]
    ld   a, [hli]
    add  hl, hl
    add  hl, hl
    jr   z, label_3C746
    ret  z
    ret  z
    nop
    nop
    cp   [hl]
    cp   [hl]
    adc  a, b
    adc  a, b
    adc  a, b
    adc  a, b
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
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   c, b
    ld   c, b
    ld   c, h
    ld   c, h
    ld   c, d
    ld   c, d
    ld   c, c
    ld   c, c
    ld   c, b
    ld   c, b

label_3C73E::
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    nop
    nop
    and  d
    and  d
    and  d
    and  d

label_3C746::
    and  d
    and  d
    and  d
    and  d
    and  d
    and  d
    and  d
    and  d
    sbc  a, h
    sbc  a, h
    nop
    nop
    ld    hl, sp+$F8
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   a, [$FFF0]
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld    hl, sp+$F8
    nop
    nop
    ld   [hl], d
    ld   [hl], d
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    xor  d
    xor  d
    sub  a, d
    sub  a, d
    ld   l, c
    ld   l, c
    nop
    nop
    ld   l, $2E
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    adc  a, $CE
    nop
    nop
    ld    hl, sp+$F8
    jr   nz, label_3C7A6
    jr   nz, label_3C7A8
    jr   nz, label_3C7AA
    jr   nz, label_3C7AC
    jr   nz, label_3C7AE
    jr   nz, label_3C7B0
    nop
    nop
    di
    di
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    di
    di
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, e
    adc  a, e
    nop
    nop
    rst  $28
    rst  $28
    ld   [bc], a
    ld   [bc], a

label_3C7A6::
    ld   [bc], a
    ld   [bc], a

label_3C7A8::
    jp   nz, label_2C2
    ld   [bc], a

label_3C7AC::
    ld   [bc], a
    ld   [bc], a

label_3C7AE::
    ld  [$FF00+C], a
    ld  [$FF00+C], a

label_3C7B0::
    nop
    nop
    and  d
    and  d
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
    inc  e
    inc  e
    nop
    nop
    ld   a, [$FF00+C]
    adc  a, d
    adc  a, d
    adc  a, e
    adc  a, e
    ld   a, [$FF00+C]
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    adc  a, d
    nop
    nop
    jr   nz, label_3C7F4
    jr   nz, label_3C7F6
    jr   nz, label_3C7F8
    and  b
    and  b
    ld   h, b
    ld   h, b
    jr   nz, label_3C7FE
    jr   nz, label_3C800
    nop
    nop
    ld   [label_C00], sp
    nop
    cp   $00
    rst  $38
    nop
    cp   $00
    inc  c
    nop
    ld   [$0000], sp
    nop
    nop
    nop

label_3C7F4::
    nop
    nop

label_3C7F6::
    nop
    nop

label_3C7F8::
    nop
    nop
    nop
    nop
    nop
    nop

label_3C7FE::
    nop
    nop

label_3C800::
    nop
    nop
    ld   sp, hl
    ld   sp, hl
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
    ld   hl, $0021
    nop
    ret  nz
    ret  nz
    jr   nz, label_3C836
    jr   nz, label_3C838
    jr   nz, label_3C83A
    jr   nz, label_3C83C
    jr   nz, label_3C83E
    ret  nz
    ret  nz
    nop
    nop
    jr   c, label_3C85C
    ld   b, l
    ld   b, l
    ld   b, c
    ld   b, c
    ld   e, l
    ld   e, l
    ld   b, l
    ld   b, l
    ld   b, l
    ld   b, l
    add  hl, sp
    add  hl, sp
    nop
    nop
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    ld   d, $16

label_3C836::
    dec  d
    dec  d

label_3C838::
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction

label_3C83A::
    inc  d
    inc  d

label_3C83C::
    inc  d
    inc  d

label_3C83E::
    inc  d
    inc  d
    nop
    nop
    ld   e, a
    ld   e, a
    ret  nc
    ret  nc
    ld   d, b
    ld   d, b
    ld   e, [hl]
    ld   e, [hl]
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   e, a
    ld   e, a
    nop
    nop
    inc  [hl]
    inc  [hl]
    ld   b, h
    ld   b, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, l
    add  a, l

label_3C85C::
    ld   b, [hl]
    ld   b, [hl]
    inc  [hl]
    inc  [hl]
    nop
    nop
    ld   e, l
    ld   e, l
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ret  z
    ret  z
    ld   e, h
    ld   e, h
    nop
    nop
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, a
    ld   b, a
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    nop
    nop
    ld   c, [hl]
    ld   c, [hl]
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    pop  de
    pop  de
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   c, [hl]
    ld   c, [hl]
    nop
    nop
    ld   b, l
    ld   b, l
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    jr   c, label_3C8D8
    nop
    nop
    ld   a, [$FFF0]
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
    nop
    nop
    cp   d
    cp   d
    sub  a, d
    sub  a, d
    sub  a, e
    sub  a, e
    sub  a, d
    sub  a, d
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    nop
    nop
    daa
    daa
    jr   z, label_3C8EE
    jr   z, label_3C8F0
    xor  e
    xor  e
    ld   l, b
    ld   l, b
    jr   z, label_3C8F6
    daa
    daa
    nop
    nop
    jr   nc, label_3C904
    adc  a, b
    adc  a, b
    inc  b
    inc  b

label_3C8D8::
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    adc  a, b
    adc  a, b
    jr   nc, label_3C910

label_3C8E0::
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_3C8E8

label_3C8E8::
    stop
    jr   z, label_3C8EC

label_3C8EC::
    ld   b, h
    nop

label_3C8EE::
    nop
    nop

label_3C8F0::
    nop
    nop
    nop
    nop
    ld   b, h
    nop

label_3C8F6::
    jr   z, label_3C8F8

label_3C8F8::
    stop
    jr   z, label_3C8FC

label_3C8FC::
    ld   b, h
    nop
    nop

label_3C8FF::
    nop
    nop
    cp   $00
    cp   $00
    cp   $00
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    ld   a, [$FA00]

label_3C910::
    nop
    nop
    nop
    rst  $38
    ld   a, a
    add  a, b
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    rlca
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
    rst  $38
    rst  $38
    cp   $00
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
    cp   $C0
    ld   a, $43
    nop
    nop
    ld   bc, rIE
    inc  bc
    rst  $38
    ld   b, $FE
    ld   b, $FE
    dec  c
    db   $FC ; Undefined instruction
    dec  c
    db   $FC ; Undefined instruction
    dec  de
    add  a, b
    rst  $38
    cp   [hl]
    ld   a, a
    ld   a, [hli]
    ld   a, a
    ld   [label_8FF], sp
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    inc  e
    rst  $38
    nop
    rst  $38
    call label_3C8FF
    rst  $38
    ld   c, b
    rst  $38
    ld   a, b
    rst  $38
    ld   c, b
    rst  $38
    ld   c, b
    rst  $38
    call label_FF
    rst  $38
    pop  af
    rst  $38
    sub  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   [rIE], a
    add  a, b
    rst  $38
    sub  a, b
    rst  $38
    pop  af
    rst  $38
    nop
    rst  $38
    rst  0
    rst  $38
    add  a, d
    rst  $38
    add  a, d
    rst  $38
    add  a, e
    rst  $38
    add  a, d
    rst  $38
    sub  a, d
    rst  $38
    rst  $30
    rst  $38
    nop
    rst  $38
    adc  a, $FF
    ld   d, e
    rst  $38
    db   $10 ; Undefined instruction
    sub  a, e
    rst  $38
    ld   de, label_3D1FF
    rst  $38
    adc  a, $FF
    nop
    rst  $38
    ld   a, l
    rst  $38
    inc  h
    rst  $38
    jr   nz, label_3C9A7
    jr   c, label_3C9A9
    jr   nz, label_3C9AB
    inc  h
    rst  $38
    ld   a, l
    rst  $38
    nop
    rst  $38
    sbc  a, e
    rst  $38
    sub  a, c
    rst  $38
    pop  de
    rst  $38
    pop  de
    rst  $38
    or   c
    rst  $38
    sub  a, c
    rst  $38
    sbc  a, e
    rst  $38
    nop
    rst  $38
    pop  bc
    rst  $38
    ldi  [hl], a
    rst  $38
    ldi  [hl], a
    rst  $38
    ldi  [hl], a
    rst  $38
    ldi  [hl], a
    rst  $38
    ldi  [hl], a
    rst  $38
    pop  bc
    rst  $38
    nop
    rst  $38
    rst  8
    rst  $38
    inc  h
    rst  $38
    inc  h
    rst  $38
    daa
    rst  $38
    inc  h
    rst  $38
    inc  h
    rst  $38
    adc  a, $FF
    nop
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
    ld   bc, label_1FA
    db   $F4 ; Undefined instruction
    ld   bc, label_3F4
    db   $F4 ; Undefined instruction
    inc  bc
    db   $E8 ; add  sp, d
    inc  bc
    jp   [hl]
    rlca
    db   $EB ; Undefined instruction
    rlca
    rst  0
    cp   $0F
    db   $FC ; Undefined instruction
    rra
    ld    hl, sp+$3F
    ld   a, [$FF7F]
    ld   [rIE], a
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    ld   sp, hl
    nop
    ld   a, [$F201]
    ld   bc, label_3F4
    db   $E4 ; Undefined instruction
    ld   a, $82

label_3CA32::
    ld   a, l
    add  a, h
    ld   a, l
    ld   a, [bc]
    ld   sp, hl
    jr   label_3CA32
    inc  d
    ei
    inc  [hl]
    di
    ld   h, h
    di
    jp   [hl]
    ld    hl, sp+$1B
    ld   [$FF30], a
    ret  nz
    ccf
    rst  $28
    ld   h, b
    rst  $30
    ld   [hl], b
    ei
    ret  c
    db   $DC
    call c, label_BECD
    nop
    rst  $38
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
    rrca
    rst  $38
    rrca
    nop
    rst  $38
    inc  bc
    nop
    nop
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    jp   label_C3FF
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    ld   a, a
    nop
    cp   a
    add  a, b
    rst  $18
    ret  nz
    rst  $18
    ld   [$FF1F], a
    and  b
    nop
    rst  $38
    nop
    inc  bc
    nop
    ei
    db   $FC ; Undefined instruction
    rra
    ld    hl, sp+$3F
    ld   a, [$FF7F]
    ld   [rIE], a
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    nop
    ret  nz
    rst  $38
    rst  $28
    ld   [rUNKN7], a
    ld   a, [$FF3B]
    ld    hl, sp+$1B
    db   $FC ; Undefined instruction
    dec  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    inc  b
    inc  bc
    rlca
    rst  $38
    rst  $38
    rlca
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    ei
    jr   label_3CAB1

label_3CAB1::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   a, [$FF7F]
    ld    hl, sp+$3F
    ld    hl, sp+$1B
    nop
    rst  $38
    nop
    nop
    ret  nz
    rst  $38
    rst  $38
    ld   [$FF7F], a
    ld   a, [$FF37]
    ld    hl, sp+$17
    ld    hl, sp+$07
    db   $E8 ; add  sp, d
    nop
    rst  $38
    db   $10 ; Undefined instruction
    ld   [hl], b
    rst  $38
    ld   a, [$FF3F]
    ld   a, [$FF37]
    ld    hl, sp+$37
    ld    hl, sp+$1F
    ld    hl, sp+$1F
    nop
    rst  $38
    inc  a
    rst  $38
    ld   b, d
    rst  $38
    cp   c
    rst  $38
    and  l
    rst  $38
    cp   c
    rst  $38
    and  l
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   c, $DF
    inc  c
    rst  $18
    jr   c, label_3CB05
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
    cp   $03
    db   $E8 ; add  sp, d
    rlca
    ret
    rlca
    pop  de
    rrca
    sub  a, c
    rrca
    and  c
    rra
    ld   hl, label_3C01F
    ccf
    ld   b, b
    rst  $30
    ret
    rst  0
    dec  bc
    adc  a, a
    inc  de
    sbc  a, a
    ld   h, $3E
    ld   b, [hl]
    ld   a, [hl]
    adc  a, l
    db   $FC ; Undefined instruction
    dec  c
    db   $FC ; Undefined instruction
    dec  de
    add  a, c
    cp   d
    add  a, c
    ld   a, d
    ld   bc, label_17A
    ld   a, [$FA01]
    ld   bc, label_1FA
    ld   a, [$FA01]
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    ld   c, $FC
    ld   c, $FC
    dec  c
    db   $FC ; Undefined instruction
    dec  c
    ld   a, [$FF02]
    rst  $38
    db   $E3 ; Undefined instruction
    ld   a, a
    db   $E3 ; Undefined instruction
    ld   a, a
    di
    ld   a, a
    ld   [hl], e
    ld   a, a
    ei
    ld   a, a
    ld   a, e
    rst  $38
    ld   a, a
    rst  $28
    ld   a, a
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  e
    cp   $1E
    ld   a, [$F91A]
    dec  e
    ld   sp, hl
    rra
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    dec  c
    cp   $07
    ld   a, [hl]
    ld   b, $7E
    ld   b, $7F
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    rlca
    db   $E8 ; add  sp, d
    rlca
    db   $E8 ; add  sp, d
    rlca
    db   $E8 ; add  sp, d
    rlca
    ret  nc
    rlca
    ret  nc
    ld   b, $D2
    ld   c, $D3
    ld   c, $A3
    ld    hl, sp+$1B
    db   $FC ; Undefined instruction
    dec  de
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    dec  c
    cp   $0D
    cp   $07
    ld   a, [hl]
    rlca
    inc  a
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
    db   $FC ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
    nop
    ld   sp, hl
    nop
    ld   a, [$F201]
    ld   bc, label_3F4
    db   $E4 ; Undefined instruction
    dec  a
    add  a, [hl]
    ld   a, l
    adc  a, d
    ld   a, l
    ld   a, [de]
    db   $FD ; Undefined instruction
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    inc  h
    rst  $20
    jr   z, label_3CC1E
    ld   sp, label_1BF8
    ld    hl, sp+$37
    ld   a, [$FF37]
    ld   a, [$FF6F]
    ld   [$FF6F], a
    ld   [$FFDF], a
    ret  nz
    rst  $18
    ret  nz
    cp   a
    ld   bc, label_1FA
    ld   a, [$FA01]
    ld   bc, label_1FA
    ld   a, [$FA01]
    ld   bc, label_1FA
    ld   a, [label_CF3]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    ld   c, $FF
    ld   c, $FF
    rrca
    ld   [$FF7F], a
    ld   [$FF7F], a
    ld   [$FF7F], a
    ld   [$FF7F], a
    pop  hl
    ld   [hl], c
    db   $E3 ; Undefined instruction
    ld   [hl], e
    rst  $20
    ld   l, e
    rst  $20
    ld   l, e
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    cp   $C0
    cp   $C0
    db   $FD ; Undefined instruction
    ret  nz
    db   $FD ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    inc  hl
    inc  [hl]
    ld   h, e
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   c, $A3
    ld   c, $A6
    sbc  a, a
    and  [hl]
    rra
    ld   b, a
    rra
    ld   b, a
    inc  e
    ld   c, h
    jr   nc, label_3CD1D
    ccf
    add  a, b
    ld   a, [hl]
    ld   b, $7F
    add  a, [hl]
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ccf
    add  a, e
    ccf
    add  a, e
    ccf
    pop  bc
    rst  $38
    ld   bc, rJOYP
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    ld   a, a
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
    cp   $03
    db   $E8 ; add  sp, d
    rlca
    ret  z
    rlca
    ret  nc
    rrca
    sub  a, c
    rrca
    and  e
    rra
    ld   h, $1F

label_3CD1D::
    ld   c, [hl]
    ld   a, $4C
    rst  $38
    ld   bc, label_3FF
    cp   a
    jp   label_3C6BF
    cp   [hl]
    ld   b, [hl]
    cp   [hl]
    ld   c, l
    cp   h
    ld   c, l
    inc  a
    sbc  a, e
    add  a, b
    cp   a
    add  a, b
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
    ld   bc, label_1FA
    ld   a, [$FA01]
    ld   bc, label_1FA
    ld   a, [$FA01]
    ld   bc, label_1FA
    ld   a, [label_FFD]
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rrca
    rst  $20
    di
    rst  0
    db   $D3 ; Undefined instruction
    rrca
    db   $D3 ; Undefined instruction
    rrca
    and  e
    rrca
    and  e
    rra
    and  e
    rra
    ld   b, e
    rra
    ld   b, e
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    rra
    and  b
    ret  nz
    ld   a, [$FAC0]
    pop  bc
    ld   a, [$F4C1]
    pop  bc
    db   $F4 ; Undefined instruction
    jp   label_C3F4
    db   $E8 ; add  sp, d
    jp   label_E3E8
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], h
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1E
    ld    hl, sp+$1D
    ld    hl, sp+$1D
    ld    hl, sp+$1A
    ld   a, [hl]
    add  a, d
    ld   a, [hl]
    add  a, d
    ld   a, [hl]
    add  a, d
    ld   a, [hl]
    add  a, a
    ld   a, [hl]
    add  a, a
    ld   a, h
    dec  b
    db   $FC ; Undefined instruction
    dec  c
    db   $FC ; Undefined instruction
    ld   c, $3F
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    sbc  a, a
    ld   a, a
    rra
    ld   a, b
    dec  de
    ld    hl, sp+$37
    ld   a, [$FF37]
    ld   a, [$FF3F]
    rst  $38
    ld   bc, label_1FF
    rst  $18
    ld   [$FFCF], a
    ld   [rVBK], a
    ld   h, b
    ld   c, a
    ret  nc
    ld   l, a
    ret  nc
    cpl
    ld   a, [$FF80]
    cp   a
    ret  nz
    cp   a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $18
    ld   [$FFDF], a
    ld   [$FF7F], a
    ld   [$FF6F], a
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
    db   $FC ; Undefined instruction

label_3CE04::
    nop
    db   $FD ; Undefined instruction
    nop
    ld   sp, hl
    nop
    ld   a, [$F201]
    ld   bc, label_3F4
    db   $E4 ; Undefined instruction
    inc  a
    adc  a, h
    ld   a, h
    adc  a, c
    ld   a, b
    ld   a, [de]
    ld   sp, hl
    ld   [de], a
    di
    inc  d
    di
    jr   z, label_3CE04
    jr   nc, label_3CE0E
    ld   b, c
    ld   a, b
    sbc  a, e
    ld   a, b
    scf
    ld   a, [$FF37]
    ld   a, [$FF6F]
    ld   [$FF6F], a
    ld   [$FFDF], a
    ret  nz
    rst  $18
    ret  nz
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
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   sp, hl
    ld   bc, label_3F2
    db   $E4 ; Undefined instruction
    rlca
    ret  z
    rrca
    sub  a, b
    rra
    jr   nz, label_3CE8A
    ld   b, a
    ld   a, a
    add  a, a
    cp   $0D
    ld    hl, sp+$08
    ld   a, [$FF0F]
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
    nop
    rst  $38
    ccf
    ld   b, e
    ccf
    add  a, e
    rst  $38
    inc  bc
    cp   $02
    cp   $03
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rra
    and  b
    sbc  a, a
    and  b
    ccf
    ld   b, b
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    add  a, a
    adc  a, b
    rlca
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    nop

label_3CE8A::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    db   $E3 ; Undefined instruction
    ld   [hl], h
    di
    ld   [hl], h
    rst  $20
    ld   l, b
    rst  8
    ld   d, b
    rst  $18
    ld   h, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    pop  hl
    inc  d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   sp, hl
    nop
    rst  $38
    db   $FC ; Undefined instruction
    ld   e, $F9
    db   $3A ; ldd  a, [hl]
    di
    ld   [hl], h
    rst  $20
    db   $E8 ; add  sp, d
    rst  $28
    ld   a, [$FFBF]
    ccf
    ccf
    rst  $38
    nop
    rst  $38
    ld   a, [$FF3F]
    ld    hl, sp+$3F
    db   $FC ; Undefined instruction
    rra
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    cpl
    ld   a, [$FF4F]
    sub  a, b
    sbc  a, a
    jr   nz, label_3CF16
    ld   b, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   [$FF6F], a
    ld   a, [$FF7F]
    ld    hl, sp+$3F
    db   $FC ; Undefined instruction
    rra
    cp   $0F
    cp   $FF
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
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $E8 ; add  sp, d
    rlca
    ret  z
    rlca
    ret  nc
    rrca
    sub  a, b
    rrca
    and  b
    rra
    jr   nz, label_3CF4C
    ld   a, a
    rst  $38
    rst  $38
    rst  $18
    ld   h, c
    cp   [hl]
    ld   bc, $00FF

label_3CF16::
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
    nop
    add  a, b
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
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_302
    db   $FC ; Undefined instruction
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
    db   $FD ; Undefined instruction
    dec  c
    db   $FD ; Undefined instruction
    rrca
    db   $FD ; Undefined instruction
    dec  de
    ld   sp, hl
    dec  de
    ld   sp, hl
    rra
    ld   sp, hl
    scf

label_3CF4C::
    pop  af
    rst  $30
    ld   a, [$FFEF]
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    jp   [hl]
    rst  $38
    nop
    rst  $38
    ld   [de], a
    rst  $38
    ld   [de], a
    rst  $38
    sub  a, d
    rst  $38
    ld   d, e
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   [de], a
    rst  $38
    ld   [de], a
    rst  $38
    nop
    rst  $38
    inc  l
    rst  $38
    ld   c, c
    rst  $38
    add  a, c
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   b, c
    rst  $38
    jr   nz, label_3CF7D
    nop
    rst  $38

label_3CF80::
    ld   [rIE], a
    db   $10 ; Undefined instruction
    nop
    rst  $38
    ld   [rIE], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [rIE], a
    nop
    rst  $38
    ld   de, label_29FF
    rst  $38
    add  hl, hl
    rst  $38
    ld   b, l
    rst  $38
    ld   a, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, h
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    inc  h
    rst  $38
    inc  h
    rst  $38
    dec  h
    rst  $38
    dec  h
    rst  $38
    dec  h
    rst  $38
    reti
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    and  h
    rst  $38
    and  l
    rst  $38
    ld   d, $FF
    push af
    rst  $38
    inc  d
    rst  $38
    inc  d
    rst  $38
    nop
    rst  $38
    ld   e, a
    rst  $38
    sub  a, b
    rst  $38
    db   $10 ; Undefined instruction
    ld   e, $FF
    db   $10 ; Undefined instruction
    sub  a, b
    rst  $38
    ld   e, a
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    ld   b, h
    rst  $38
    ld   h, h
    rst  $38
    ld   d, h
    rst  $38
    ld   c, h
    rst  $38
    ld   b, h
    rst  $38
    ld   b, h
    rst  $38
    nop
    rst  $38

label_3CFE0::
    sub  a, c
    rst  $38
    sub  a, c
    rst  $38
    sbc  a, c
    rst  $38
    sub  a, l
    rst  $38
    sub  a, e
    rst  $38
    sub  a, c
    rst  $38
    sub  a, c
    rst  $38
    nop
    rst  $38
    jr   c, label_3CFF1
    ld   b, h
    rst  $38
    ld   b, b
    rst  $38
    ld   e, h
    rst  $38
    ld   b, h
    rst  $38
    ld   b, h
    rst  $38
    jr   c, label_3CFFD
    nop
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    push af
    push af
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  bc
    pop  bc
    cp   l
    cp   l
    ld   a, l
    ld   a, l
    rst  $38
    rst  $38
    jp   label_DDC3
    db   $DD
    db   $DD
    db   $83
    add  a, e
    add  a, e
    cp   e
    cp   e
    ld   a, e
    ld   a, e
    rlca
    rlca
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction

label_3D021::
    db   $E3 ; Undefined instruction
    db   $DD
    db   $BF
    cp   a
    cp   a
    cp   a
    cp   a
    ld   a, a
    ld   a, a
    ld   a, e
    ld   a, e
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    jp   label_DDC3
    db   $DD
    db   $DD
    db   $BD
    cp   l
    cp   l
    cp   l
    cp   l
    ld   a, e
    ld   a, e
    rlca
    rlca
    rst  $38
    rst  $38
    pop  bc
    pop  bc
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    add  a, e
    add  a, e
    cp   a
    cp   a
    ld   a, a
    ld   a, a
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    pop  bc
    pop  bc
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    add  a, e
    add  a, e
    cp   a
    cp   a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $DD
    db   $BF
    cp   a
    cp   a
    cp   a
    cp   a
    ld   [hl], c
    ld   [hl], c
    ld   a, e
    ld   a, e
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    db   $DD
    db   $DD
    db   $DD
    db   $BB
    cp   e
    cp   e
    add  a, e
    add  a, e
    cp   e
    cp   e
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    adc  a, a
    adc  a, a
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ei
    ei
    ei
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    adc  a, a
    adc  a, a
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    rst  $10
    rst  $10
    rst  8
    rst  8
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    ld   l, a
    ld   l, a
    ld   [hl], a
    ld   [hl], a
    rst  $38
    rst  $38
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    cp   a
    cp   a
    cp   a
    cp   a
    cp   a
    cp   a
    ld   a, a
    ld   a, a
    rlca
    rlca
    rst  $38
    rst  $38
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ret
    ret
    push bc
    push bc
    xor  l
    xor  l
    cp   e
    cp   e
    ld   a, e
    ld   a, e
    ld   a, e
    ld   a, e
    rst  $38
    rst  $38
    db   $DD
    db   $DD
    db   $DD
    db   $8D
    adc  a, l
    adc  a, l
    xor  e
    xor  e
    or   e
    or   e
    ld   a, e
    ld   a, e
    ld   a, e
    ld   a, e
    rst  $38
    rst  $38
    jp   label_BDC3
    cp   l
    cp   l
    cp   l
    ld   a, l
    ld   a, l
    ld   a, e
    ld   a, e
    ld   a, e
    ld   a, e
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    jp   label_DDC3
    db   $BD
    cp   l
    cp   l
    add  a, e
    add  a, e
    cp   a
    cp   a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    jp   label_BDC3
    cp   l
    cp   l
    cp   l
    ld   a, l
    ld   a, l
    ld   h, e
    ld   h, e
    ld   a, e
    ld   a, e
    add  a, l
    add  a, l
    rst  $38
    rst  $38
    jp   label_DDC3
    db   $BD
    cp   l
    cp   l
    add  a, e
    add  a, e
    or   a
    or   a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    rst  $38
    rst  $38
    jp   label_BDC3
    cp   l
    cp   a
    cp   a
    rst  0
    rst  0
    ei
    ei
    ld   a, e
    ld   a, e
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    db   $DD
    db   $DD
    db   $DD
    db   $BB
    cp   e
    cp   e
    cp   e
    cp   e
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    adc  a, a
    adc  a, a
    rst  $38
    rst  $38
    ld   a, l
    ld   a, l
    ld   a, e
    ld   a, e
    ld   [hl], a
    ld   [hl], a
    ld   l, a
    ld   l, a
    ld   e, a
    ld   e, a
    ccf
    ccf
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    cp   l
    cp   l
    cp   l
    cp   l
    cp   e
    cp   e
    ld   l, e
    ld   l, e
    ld   c, e
    ld   c, e
    daa
    daa
    ld   [hl], a
    ld   [hl], a
    rst  $38
    rst  $38
    db   $DD
    db   $DB
    db   $DB
    db   $DB
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  8
    rst  8
    or   a
    or   a
    ld   [hl], a
    ld   [hl], a
    rst  $38
    rst  $38
    cp   l
    cp   l
    or   e
    or   e
    rst  8
    rst  8
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    ei
    ei
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    cp   a
    cp   a
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  0
    rst  0
    db   $DB
    db   $DB
    cp   e
    cp   e
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    rst  $18
    rst  $18
    cp   a
    cp   a
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ei
    jp   label_B7C3
    or   a
    or   a
    or   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    ld   sp, hl
    ld   sp, hl
    rst  $30
    rst  $30
    add  a, c
    add  a, c
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38

label_3D1FF::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    or   a
    or   a
    adc  a, a
    adc  a, a
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  0
    rst  0
    or   a
    or   a
    or   a
    or   a
    rst  $38
    rst  $38
    di
    di
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    di
    di
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    ld   l, a
    ld   l, a
    sbc  a, a
    sbc  a, a
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    db   $DB
    db   $DB
    rst  $10
    rst  $10
    rst  8
    rst  8
    or   a
    or   a
    cp   e
    cp   e
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    rst  $30

label_3D253::
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    set  1, e
    push de
    push de
    push de
    push de
    xor  e
    xor  e
    xor  e
    xor  e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $10
    rst  $10
    set  1, e
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    rst  0
    rst  0
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    rst  0
    rst  0
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    rst  $28
    rst  $28
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    jp   label_EFC3
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    set  1, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   e
    cp   e
    or   a
    or   a
    xor  a
    xor  a
    sbc  a, a
    sbc  a, a
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    push de
    push de
    push de
    push de
    xor  e
    xor  e
    xor  e
    xor  e
    rst  $10
    rst  $10
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $10
    rst  $10
    or   a
    or   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DD
    db   $EB
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    cp   a
    cp   a
    add  a, a
    add  a, a
    rst  8
    rst  8
    rst  8
    rst  8
    adc  a, $CE
    rst  8
    rst  8
    call label_81CD
    add  a, c
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  0
    rst  0
    add  a, e
    add  a, e
    ld   bc, $C701
    rst  0
    rst  0
    rst  0
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  0
    rst  0
    rst  0
    rst  0
    rst  0
    rst  0
    ld   bc, $8301
    add  a, e
    rst  0
    rst  0
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    rst  $20
    rst  $20
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    rst  $20
    rst  $20
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    di
    di
    add  a, c
    add  a, c
    add  a, b
    add  a, b
    add  a, c
    add  a, c
    di
    di
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_3D388

label_3D388::
    stop
    jr   z, label_3D38C

label_3D38C::
    ld   b, h
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
    rst  8
    rst  8
    rst  8
    rst  8
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
    sbc  a, a
    sbc  a, a
    rst  $18
    rst  $18
    cp   a
    cp   a
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
    ccf
    ccf
    rst  $38
    rst  $38
    jp   label_99C3
    sbc  a, c
    ld   sp, hl
    ld   sp, hl
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    rst  8
    rst  8
    rst  $38
    rst  $38
    sbc  a, a
    sbc  a, a
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   label_F7C3
    rst  $30
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    add  a, a
    add  a, a
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
    rlca
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, a
    sbc  a, a
    rst  $18
    rst  $18
    cp   a
    cp   a
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
    sub  a, e
    sub  a, e
    db   $DB
    db   $DB
    or   a
    or   a
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
    rst  8
    rst  8
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  8
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, a
    sbc  a, a
    rst  $18
    rst  $18
    cp   a
    cp   a
    rst  $28
    rst  $28
    rst  $10
    rst  $10
    rst  $10
    rst  $10
    rst  8
    rst  8
    sbc  a, c
    sbc  a, c
    ld   h, a
    ld   h, a
    ld   [hl], e
    ld   [hl], e
    adc  a, l
    adc  a, l
    di
    di
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $28
    rst  $28
    di
    di
    sbc  a, a
    sbc  a, a
    rst  $28
    rst  $28
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    sbc  a, a
    sbc  a, a
    rst  $28
    rst  $28
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
    rst  $28
    rst  $28
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    ei
    ei
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $28
    rst  $28
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    set  1, e
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    set  1, e
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    set  1, e

label_3D500::
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   a
    cp   a
    cp   e
    cp   e
    rst  0
    rst  0
    rst  $38
    rst  $38
    add  a, a
    add  a, a
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    rst  $10
    rst  $10
    cp   e
    cp   e
    cp   e
    cp   e
    ld   b, a
    ld   b, a
    ld   a, a
    ld   a, a
    or   $F6
    rst  $38
    rst  $38
    ld   sp, hl
    ld   sp, hl
    push af
    push af
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  bc
    pop  bc
    cp   l
    cp   l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    rst  $38
    rst  $38
    jp   label_BDC3
    cp   l
    cp   l
    cp   l
    ld   a, e
    ld   a, e
    ld   a, e
    ld   a, e
    add  a, a
    add  a, a
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    rst  $38
    rst  $38
    cp   e
    cp   e
    cp   e
    cp   e
    cp   e
    cp   e
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    adc  a, a
    adc  a, a
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_3D588

label_3D588::
    stop
    jr   z, label_3D58C

label_3D58C::
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
    jr   z, label_3D598

label_3D598::
    stop
    jr   z, label_3D59C

label_3D59C::
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
    jr   z, label_3D5A8

label_3D5A8::
    stop
    jr   z, label_3D5AC

label_3D5AC::
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
    jr   z, label_3D5B8

label_3D5B8::
    stop
    jr   z, label_3D5BC

label_3D5BC::
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
    jr   z, label_3D5C8

label_3D5C8::
    stop
    jr   z, label_3D5CC

label_3D5CC::
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
    jr   z, label_3D5D8

label_3D5D8::
    stop
    jr   z, label_3D5DC

label_3D5DC::
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
    jr   z, label_3D5E8

label_3D5E8::
    stop
    jr   z, label_3D5EC

label_3D5EC::
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
    jr   z, label_3D5F8

label_3D5F8::
    stop
    jr   z, label_3D5FC

label_3D5FC::
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
    jr   z, label_3D608

label_3D608::
    stop
    jr   z, label_3D60C

label_3D60C::
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
    jr   z, label_3D618

label_3D618::
    stop
    jr   z, label_3D61C

label_3D61C::
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
    jr   z, label_3D628

label_3D628::
    stop
    jr   z, label_3D62C

label_3D62C::
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
    jr   z, label_3D638

label_3D638::
    stop
    jr   z, label_3D63C

label_3D63C::
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
    jr   z, label_3D648

label_3D648::
    stop
    jr   z, label_3D64C

label_3D64C::
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
    jr   z, label_3D658

label_3D658::
    stop
    jr   z, label_3D65C

label_3D65C::
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
    jr   z, label_3D668

label_3D668::
    stop
    jr   z, label_3D66C

label_3D66C::
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
    jr   z, label_3D678

label_3D678::
    stop
    jr   z, label_3D67C

label_3D67C::
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
    jr   z, label_3D688

label_3D688::
    stop
    jr   z, label_3D68C

label_3D68C::
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
    jr   z, label_3D698

label_3D698::
    stop
    jr   z, label_3D69C

label_3D69C::
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
    jr   z, label_3D6A8

label_3D6A8::
    stop
    jr   z, label_3D6AC

label_3D6AC::
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
    jr   z, label_3D6B8

label_3D6B8::
    stop
    jr   z, label_3D6BC

label_3D6BC::
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
    jr   z, label_3D6C8

label_3D6C8::
    stop
    jr   z, label_3D6CC

label_3D6CC::
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
    jr   z, label_3D6D8

label_3D6D8::
    stop
    jr   z, label_3D6DC

label_3D6DC::
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
    jr   z, label_3D6E8

label_3D6E8::
    stop
    jr   z, label_3D6EC

label_3D6EC::
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
    jr   z, label_3D6F8

label_3D6F8::
    stop
    jr   z, label_3D6FC

label_3D6FC::
    ld   b, h
    nop
    nop
    nop
    jp   label_99C3
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    jp   label_FFC3
    rst  $38
    rst  $20
    rst  $20
    rst  0
    rst  0
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $38
    rst  $38
    jp   label_99C3
    sbc  a, c
    ld   sp, hl
    ld   sp, hl
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    rst  8
    rst  8
    sbc  a, a
    sbc  a, a
    add  a, c
    add  a, c
    rst  $38
    rst  $38
    jp   label_99C3
    sbc  a, c
    ld   sp, hl
    ld   sp, hl
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    sbc  a, c
    sbc  a, c
    jp   label_FFC3
    rst  $38
    di
    di
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    jp   label_93C3
    sub  a, e
    sub  a, e
    sub  a, e
    add  a, c
    add  a, c
    di
    di
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    add  a, e
    add  a, e
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    add  a, e
    add  a, e
    rst  $38
    rst  $38
    jp   label_99C3
    sbc  a, c
    sbc  a, a
    sbc  a, a
    add  a, e
    add  a, e
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    jp   label_FFC3
    rst  $38
    add  a, c
    add  a, c
    ld   sp, hl
    ld   sp, hl
    di
    di
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $38
    rst  $38
    jp   label_99C3
    sbc  a, c
    sbc  a, c
    sbc  a, c
    jp   label_99C3
    sbc  a, c
    sbc  a, c
    sbc  a, c
    jp   label_FFC3
    rst  $38
    jp   label_99C3
    sbc  a, c
    sbc  a, c
    sbc  a, c
    pop  bc
    pop  bc
    ld   sp, hl
    ld   sp, hl
    sbc  a, c
    sbc  a, c
    jp   label_FFC3
    rst  $38
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
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
    ld   b, h
    nop
    jr   z, label_3D7B8

label_3D7B8::
    stop
    jr   z, label_3D7BC

label_3D7BC::
    ld   b, h
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
    jp   label_99C3
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    add  a, c
    add  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    rst  $38
    rst  $38
    inc  bc
    inc  bc
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    add  a, e
    add  a, e
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    add  a, c
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, e
    add  a, e
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    add  a, e
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    sbc  a, a
    sbc  a, a
    add  a, e
    add  a, e
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    add  a, c
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    sbc  a, a
    sbc  a, a
    add  a, e
    add  a, e
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    rst  $38
    rst  $38
    rst  0
    rst  0
    rst  0
    rst  0
    ld   de, label_2901
    ld   de, $0111
    ld   bc, $C7C7
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    add  a, c
    nop
    ld   b, d
    nop
    inc  a
    nop
    jr   label_3D87D

label_3D87D::
    nop
    rst  $38
    rst  $38
    rst  8
    rst  8
    ld   l, a
    daa
    rst  $38
    rlca
    rst  $38
    daa
    di
    call label_CDC3
    pop  hl
    pop  hl
    rst  $18
    jp   label_C3C3
    rst  $38
    rst  0
    inc  h
    inc  a
    ld   c, [hl]
    jr   z, label_3D8F7
    jr   c, label_3D917
    ld   h, h
    db   $DB
    jp   label_C3C3
    sbc  a, a
    sbc  a, a
    sub  a, e
    sub  a, e
    pop  de
    db   $FD ; Undefined instruction
    ret  nz
    add  a, $C3
    jp   label_E3C3
    add  a, a
    add  a, a
    adc  a, a
    adc  a, a
    rst  $38
    rst  $38
    cp   l
    cp   l
    db   $DB
    db   $DB
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   l
    cp   l
    rst  $38
    rst  $38
    jp   label_81C3
    add  a, c
    ld   l, h
    ld   l, h
    ld   b, h
    ld   b, h
    add  a, c
    nop
    add  a, a
    or   e
    add  a, a
    add  a, a
    or   a
    or   a
    rst  8
    add  a, e
    rst  $38
    ld   bc, label_3F4FF
    ei
    ld   a, [label_3D253]
    ld   d, e
    ld   d, d
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    rst  $20
    add  a, e
    rst  $38
    ld   hl, label_3E0FF
    rst  $18
    call c, label_ABAB
    xor  e
    xor  d
    rst  0
    ld   b, h
    rst  $38
    inc  a
    rst  0
    add  a, e
    rst  $38
    ld   de, label_3FCFF
    xor  e

label_3D8F7::
    xor  e
    xor  b
    xor  b
    ld   c, h
    ld   b, h
    ld   a, l
    ld   a, l
    add  a, e
    add  a, e
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    jr   label_3D91E
    ld   a, [bc]
    inc  h
    ld   b, b
    jr   z, label_3D927
    inc  e
    ccf
    ccf
    rst  $38
    rst  $38
    jp   label_BDC3
    add  a, c
    cp   l
    add  a, c
    add  a, c

label_3D917::
    jp   label_FF81
    sbc  a, c
    rst  $20
    jp   label_E7BD
    jp   label_FCFC
    cp   h
    cp   [hl]
    jp   z, label_185

label_3D927::
    ld   a, d
    add  a, c
    inc  b
    add  a, b
    ld   sp, hl
    inc  bc
    ld   bc, $8387
    db   $EC ; Undefined instruction
    db   $E4 ; Undefined instruction
    jp   [hl]
    ld   [$FFE3], a
    pop  hl
    rst  $20
    db   $E3 ; Undefined instruction
    rst  8
    rst  0
    sbc  a, a
    adc  a, a
    ccf
    rra
    ld   a, a
    ccf
    ld    hl, sp+$F8
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $38
    pop  bc
    add  a, a
    add  a, c
    inc  de
    ld   de, label_3C545
    ld   de, $8311
    add  a, e
    rst  $38
    inc  h
    rst  $38
    add  a, c
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    jp   label_FF81
    add  a, c
    jp   label_FF81
    jp   label_FEFE
    cp   $FE
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    di
    di
    dec  de
    dec  bc
    rrca
    rlca
    rst  $38
    adc  a, a
    ld   sp, hl
    ld   sp, hl
    ei
    ei
    ei
    ld   a, e
    ld   a, e
    ld   a, e
    dec  sp
    dec  sp
    ld   a, e
    ld   a, e
    or   a
    inc  sp
    rst  8
    add  a, a
    push af
    pop  hl
    rst  $18
    sbc  a, $FE
    cp   [hl]
    cp   a
    cp   [hl]
    cp   $FE
    ld   e, l
    cp   l
    or   a
    inc  de
    ld   e, a
    cp   a
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    rst  $20
    pop  de
    ret  nz
    cp   b
    ret  nz
    cp   b
    rst  $20
    ret  c
    ld   a, [$FFE8]
    ld    hl, sp+$F0
    db   $FD ; Undefined instruction
    ld   sp, hl
    pop  hl
    pop  hl
    jp   nc, label_C0CC
    jp   nc, label_D2C0
    jp   nc, label_81CC
    add  a, c
    ccf
    rra
    ld   a, a
    ccf
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_3D9B8

label_3D9B8::
    stop
    jr   z, label_3D9BC

label_3D9BC::
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
    jr   z, label_3D9C8

label_3D9C8::
    stop
    jr   z, label_3D9CC

label_3D9CC::
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
    jr   z, label_3D9D8

label_3D9D8::
    stop
    jr   z, label_3D9DC

label_3D9DC::
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
    jr   z, label_3D9E8

label_3D9E8::
    stop
    jr   z, label_3D9EC

label_3D9EC::
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
    jr   z, label_3D9F8

label_3D9F8::
    stop
    jr   z, label_3D9FC

label_3D9FC::
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DA20
    jr   label_3DA22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DA30
    jr   label_3DA32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DA20::
    nop
    nop

label_3DA22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DA40
    jr   label_3DA42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DA30::
    nop
    nop

label_3DA32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DA50
    jr   label_3DA52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DA40::
    ei
    db   $FD ; Undefined instruction

label_3DA42::
    db   $ED ; Undefined instruction
    xor  $FA
    db   $EC ; Undefined instruction
    cp   l
    ld   sp, hl
    cp   e
    adc  a, e
    ld   a, [label_39FB]
    db   $ED ; Undefined instruction
    ld   d, h
    sbc  a, $DF
    cp   a

label_3DA52::
    cp   a
    ld   a, a
    ld   e, a
    ccf
    cp   l
    sbc  a, a
    db   $D1
    pop  de
    ld   e, a
    rst  $18
    sbc  a, h
    or   a
    ld   a, [hli]
    ld   a, e
    rrca
    rrca
    jr   label_3DA74
    dec  hl
    jr   nc, label_3DAB2
    ld   [hl], b
    adc  a, e
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FFFF]
    rst  $38
    nop
    nop

label_3DA74::
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
    ld   a, [$FFF0]
    jr   label_3DA8C
    call nc, label_D20C
    ld   c, $D1
    rrca
    pop  de
    rrca

label_3DA8C::
    pop  de
    rrca
    pop  de
    rrca
    adc  a, e
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FFFF]
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

label_3DAB2::
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
    nop
    nop
    nop
    nop
    jr   label_3DADE
    inc  h
    inc  h
    ld   e, d
    ld   b, d
    ld   e, d
    ld   b, d
    ld   b, [hl]
    ld   h, [hl]
    ld   a, [hl]
    ld   e, d
    ld   a, a
    rst  $38
    add  a, b
    add  a, b
    sbc  a, e
    cp   c
    and  d
    and  d
    and  d
    and  d
    and  e
    and  e
    sbc  a, d
    cp   d

label_3DADE::
    add  a, b
    add  a, b
    rst  $28
    nop
    rst  0
    nop
    cp   e
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    cp   e
    nop
    rst  0
    nop
    rst  $28
    nop
    nop
    nop
    ld   a, [hl]
    ld   bc, label_17E
    ld   a, [hl]
    ld   bc, label_17E
    ld   a, [hl]
    ld   bc, $0100
    nop
    ld   a, a
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DB20
    jr   label_3DB22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DB30
    jr   label_3DB32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DB20::
    nop
    nop

label_3DB22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DB40
    jr   label_3DB42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DB30::
    nop
    nop

label_3DB32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DB50
    jr   label_3DB52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DB40::
    sbc  a, a
    cp   a

label_3DB42::
    nop
    nop
    pop  de
    sub  a, c
    ld   e, e
    ld   e, e
    ld   e, a
    ld   d, l
    push de
    push de
    ld   d, c
    ld   d, c
    nop
    nop

label_3DB50::
    ld   sp, hl
    db   $FD ; Undefined instruction

label_3DB52::
    nop
    nop
    ld   [hl], a
    ld   [hl], a
    ld   b, h
    ld   b, h
    ld   h, h
    ld   h, h
    ld   b, a
    ld   b, a
    ld   [hl], l
    ld   [hl], l
    nop
    nop
    adc  a, b
    ld   a, [$FF8F]
    ld   a, [$FF90]
    rst  $28
    sub  a, b
    rst  $28
    and  b
    rst  $18
    and  b
    rst  $18
    ret  nz
    cp   a
    ret  nz
    cp   a
    nop
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
    ld   de, $F10F
    rrca
    add  hl, bc
    rst  $30
    add  hl, bc
    rst  $30
    dec  b
    ei
    dec  b
    ei
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    rst  $38
    rst  $38
    sub  a, b
    cp   b
    xor  b
    xor  b
    sub  a, b
    cp   b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, a
    db   $FD ; Undefined instruction
    cp   $FF
    rst  $38
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, rSB
    dec  c
    rst  $38
    db   $ED ; Undefined instruction
    cp   a
    ld   h, c
    ld   l, d
    ld   d, [hl]
    ld   l, d
    ld   d, [hl]
    ld   a, d
    ld   b, [hl]
    ld   l, e
    ld   d, [hl]
    ld   l, d
    ld   d, a
    ld   a, d
    ld   d, a
    dec  a
    ld   a, $00
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DBF0
    jr   label_3DBF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DC00
    jr   label_3DC02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DBF0::
    cp   $FF

label_3DBF2::
    ld   bc, label_3D01
    add  hl, de
    and  l
    and  l
    and  l
    and  l
    dec  a
    dec  a
    and  l
    and  l
    ld   bc, $F301

label_3DC01::
    rrca

label_3DC02::
    rst  8
    ccf
    sbc  a, h
    ld   a, a
    jr   c, label_3DC07
    jr   c, label_3DC01
    dec  sp
    db   $F4 ; Undefined instruction
    ccf
    di
    ld   a, a
    db   $F4 ; Undefined instruction
    rst  8
    ld   a, [$FFF3]
    db   $FC ; Undefined instruction
    add  hl, sp
    cp   $1C
    rst  $38
    inc  e
    rst  $28
    call c, label_FC2F
    rst  8
    cp   $3F
    or   [hl]
    ld   a, a
    ld   h, h
    ccf
    ld   l, c
    ld   a, $58
    ld   l, a
    ld   c, d
    ld   a, a
    ld   l, h
    ld   a, a
    call nc, label_856F
    cp   $6D
    cp   $26
    db   $FC ; Undefined instruction
    sub  a, [hl]
    ld   a, h
    ld   e, $F4
    ld   d, d
    cp   $36
    cp   $2B
    or   $A1
    ld   a, a
    db   $FE
    cp   $EE
    di
    db   $D3 ; Undefined instruction
    pop  hl
    rst  $18
    db   $EC ; Undefined instruction
    rst  $18
    db   $EC ; Undefined instruction
    sbc  a, $E1
    db   $ED ; Undefined instruction
    di
    rst  $38
    rst  $18
    rst  $38
    rrca
    db   $D3 ; Undefined instruction
    ld   sp, $E325
    di
    rst  8
    adc  a, $83
    adc  a, $83
    ld   h, h
    sbc  a, a
    rst  $20
    rra
    rst  $38
    nop
    ei
    rlca
    db   $EC ; Undefined instruction
    rra
    ret  nc
    ccf
    db   $E3 ; Undefined instruction
    inc  a
    and  a
    ld   a, b
    rst  0
    ld   a, b
    ld   b, a
    ld    hl, sp+$FF
    nop
    rst  $18
    ld   [$FF37], a
    ld    hl, sp+$0B
    db   $FC ; Undefined instruction
    rst  0
    inc  a
    push hl
    ld   e, $E3
    ld   e, $E2
    rra
    ld   e, $1E
    ld   hl, label_3D021
    ld   b, e
    ld   b, c
    ld   b, h
    ret  nz
    ld   c, b
    ld   [$FFA9], a
    ld   a, [$FF98]
    ld    hl, sp+$98
    ld   a, b
    ld   a, b
    add  a, h
    add  a, h
    ld   [de], a
    ld   [bc], a
    ld   [bc], a
    ld  [$FF00+C], a
    rlca
    ld   [de], a
    dec  c
    rrca
    add  hl, bc
    rrca
    add  hl, de
    ld   e, a
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    ldi  [hl], a
    ldi  [hl], a
    inc  d
    inc  d
    ld   [label_1408], sp
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    ld   sp, hl
    ld    hl, sp+$41
    adc  a, b
    ld   b, l
    adc  a, b
    ld   d, h
    adc  a, b
    ld   d, h
    adc  a, b
    dec  d
    adc  a, b
    dec  d
    adc  a, b
    rst  $38
    ld   a, [$FFCB]
    adc  a, h
    and  h
    rst  0
    rst  8
    di
    ld   [hl], e
    pop  bc
    ld   [hl], e
    pop  bc
    ld   h, $F9
    rst  $20
    ld    hl, sp+$BB
    ld   a, a
    ld   [hl], a
    rst  8
    res  0, a
    ei
    scf
    ei
    scf
    ld   a, e
    add  a, a
    or   a
    rst  8
    rst  $38
    ei
    call c, label_8CFB
    ei
    adc  a, a
    ld    hl, sp+$8F
    ld   sp, hl
    adc  a, a
    cp   $86
    db   $FD ; Undefined instruction
    rst  0
    db   $FC ; Undefined instruction
    rst  $30
    db   $FD ; Undefined instruction
    inc  sp
    rst  $18
    ld   sp, $F9DF
    rra
    pop  af
    sbc  a, a
    push af
    ld   a, a
    ld   h, c
    cp   a
    pop  hl
    ccf
    db   $EB ; Undefined instruction
    cp   a
    adc  a, b
    rst  $38
    cp   c
    rst  $38
    jp  c, label_DECE
    adc  a, h
    cp   $8C
    rst  $28
    sbc  a, [hl]
    ld   a, a
    ld   e, d
    dec  sp
    ld   sp, rNR11
    sbc  a, l
    rst  $38
    db   $DB
    ld   [hl], e
    ei
    ld   sp, label_3F1BF
    rst  $30
    ld   a, c
    ld   a, [hl]
    jp  c, label_8CDC
    sbc  a, $E3
    jp   nz, label_C2FF
    rst  $38
    jp   nz, label_3C3FF
    cp   $A3
    ld   a, [hl]
    ld   e, [hl]
    ccf
    rrca
    inc  bc
    inc  e
    rlca
    rra
    inc  b
    ld   h, l
    sbc  a, [hl]
    ld   h, d
    sbc  a, a
    sbc  a, [hl]
    inc  bc
    sbc  a, d
    rlca
    ld   [hl], e
    adc  a, a
    rst  $38
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    inc  e
    rst  $38
    jr   nc, label_3DD67
    ld   h, e
    db   $FC ; Undefined instruction
    ld   h, a
    ld    hl, sp+$C7
    ld    hl, sp+$C7
    ld    hl, sp+$00
    rst  $38
    ld   [rIE], a
    jr   c, label_3DD75
    inc  c
    rst  $38
    add  a, $3F
    and  $1F
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra
    db   $FC ; Undefined instruction
    and  h
    rst  $38
    and  a
    rst  $38
    and  d
    rst  $38
    jp   nc, label_8AFF
    ld   a, a
    ld   b, h
    ccf
    inc  h
    rra
    rra
    add  hl, hl
    ccf
    ret
    rst  $38
    ret
    ld   a, a
    ret
    ld   a, a
    db   $77
    ld   [hl], a
    cp   $22
    db   $FC ; Undefined instruction
    inc  l
    ld   sp, hl
    ld    hl, sp+$3F
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ldi  [hl], a
    ldi  [hl], a
    inc  d
    inc  d
    ld   [label_1408], sp
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    nop
    nop
    ld   d, l
    adc  a, b

label_3DDC2::
    ld   d, c
    adc  a, b
    ld   b, c
    adc  a, b
    ld   b, l
    adc  a, b
    ld   d, h
    adc  a, b
    ld   d, h
    adc  a, b
    dec  d
    adc  a, b
    dec  d
    adc  a, b
    ld   d, c
    adc  a, b
    ld   d, c
    adc  a, b
    ld   b, l
    adc  a, b
    ld   b, b
    adc  a, a
    rlca
    ld    hl, sp+$77
    adc  a, b
    ld   [hl], a
    adc  a, a
    ld    hl, sp+$FF
    jr   c, label_3DDC2
    ld    hl, sp+$20
    and  [hl]
    ld   a, c
    ld   b, [hl]
    ld   sp, hl
    ld   a, c
    ret  nz
    ld   e, c
    ld   [$FFCE], a
    pop  af
    rst  $38
    rst  $38
    ld   a, e
    rst  0
    ld   b, e
    rst  $38
    ld   b, e
    rst  $38
    ld   b, e
    rst  $38
    jp   nz, label_C57F
    ld   a, [hl]
    ld   a, d
    db   $FC ; Undefined instruction
    ld   a, [$FFC0]
    ld   bc, label_601
    rlca
    dec  bc
    inc  c
    ld   d, $18
    rla
    jr   label_3DE2E
    ccf
    cpl
    inc  a
    ld   [hl], h
    jr   c, label_3DE10
    rst  $38
    cp   $08
    rra
    inc  b
    rrca

label_3DE17::
    rlca
    ld    hl, sp+$0A
    ld   a, [$FF00+C]
    db   $D3 ; Undefined instruction
    inc  [hl]
    ld   a, b
    inc  de
    rst  $38

label_3DE21::
    rst  $38
    ld   a, a
    db   $10 ; Undefined instruction
    jr   nz, label_3DE17
    ld   [$FF1F], a
    ld   d, b
    ld   c, a
    cpl
    sra  h

label_3DE2E::
    ld   e, $C8
    nop
    nop
    ret  nz
    ret  nz
    or   b
    ld   [hl], b
    ret  z
    jr   c, label_3DE21
    jr   label_3DDFF
    db   $FC ; Undefined instruction
    db   $F4 ; Undefined instruction
    inc  a
    ld   l, [hl]
    inc  e
    ret  nz
    ld   a, a
    ld   h, b
    ccf
    ld   a, b
    ccf
    rst  $10
    ld   c, a
    adc  a, e
    add  a, a
    db   $FD ; Undefined instruction
    add  a, e
    add  a, [hl]
    cp   $7C
    ld   a, h
    sbc  a, a
    ld   [$FF8F], a
    ld   a, [$FF87]
    ld    hl, sp+$C0
    rst  $38
    ld    hl, sp+$FF
    ld   a, a
    rst  0
    rst  $38
    cp   e
    cp   $BB
    pop  af
    rrca
    pop  hl
    rra
    pop  bc
    ccf
    inc  bc
    rst  $38
    rra
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    db   $7F
    ld   a, a
    db   $03
    inc  bc
    cp   $06
    db   $FC ; Undefined instruction
    ld   e, $FC
    rst  $28

label_3DE77::
    ld   a, [$FF00+C]
    pop  hl
    rst  $18
    pop  hl
    pop  hl
    ld   a, a
    ld   a, a
    ld   a, $FF
    rst  $38
    ld   a, a
    db   $10 ; Undefined instruction
    jr   nz, label_3DE77
    ld   [$FF1F], a
    ld   d, b
    ld   c, a
    cpl
    sra  h
    ld   e, $C8

label_3DE90::
    rst  $38
    rst  $38
    cp   $08
    rra
    inc  b
    rrca
    rlca
    ld    hl, sp+$0A
    ld   a, [$FF00+C]
    db   $D3 ; Undefined instruction
    inc  [hl]
    ld   a, b
    inc  de
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DEC0
    jr   label_3DEC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DED0
    jr   label_3DED2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DEC0::
    rst  $38
    add  a, a

label_3DEC2::
    rst  $38
    ld    hl, sp+$FF
    add  a, b
    ld    hl, sp+$C7
    rst  0
    ld   a, b
    rst  $38
    ld   b, e
    rst  $38
    cp   $FF
    add  a, b

label_3DED0::
    rst  $38
    pop  hl

label_3DED2::
    rst  $38
    rra
    rst  $38
    ld   bc, $8779
    rst  8
    ld   sp, rIE
    rst  $38
    ld   [bc], a
    db   $E3 ; Undefined instruction
    ld   e, $DB
    jr   label_3DE90
    inc  l
    ld   c, d
    ld   c, [hl]
    adc  a, c
    adc  a, a
    sbc  a, c
    sbc  a, a

label_3DEEA::
    cp   l
    and  a
    ld   a, [hl]
    ld   b, d
    cp   l
    inc  a
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DF10
    jr   label_3DF12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    ld   c, b
    ld   [hl], b
    ret  c
    ld   h, b
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FF9F], a
    ld   [$FF8F], a
    ld   a, [$FF86]
    ld   sp, hl

label_3DF0E::
    add  a, b
    rst  $38

label_3DF10::
    ld   l, h
    jr   label_3DEEA
    ccf
    xor  a
    ld   [hl], b
    ld   e, h
    ld   [$FF58], a
    ld   [$FF98], a
    ld   [$FF9C], a
    ld   [$FF9F], a
    ld   [$FF36], a
    jr   label_3DF0E
    db   $FC ; Undefined instruction
    push bc
    ld   a, $62
    rra
    ldd  [hl], a
    rrca
    ld   sp, label_3F10F
    rrca
    pop  af
    rrca
    ldd  [hl], a
    ld   c, $3B
    ld   b, $F9
    rlca
    ld   sp, hl
    rlca
    ld   sp, hl
    rlca
    pop  af
    rrca
    ld   h, c
    sbc  a, a
    ld   bc, label_3F8FF
    ld   [label_1071], sp
    inc  a
    dec  l
    ld   a, $2D
    inc  l
    inc  sp
    rra
    rra
    rlca
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld   b, [hl]
    ld    hl, sp+$3C
    sub  a, b
    ld   a, b
    ld   a, e
    ld   a, [$FF9F]
    di
    rra
    di
    rst  8
    jr   c, label_3DF76
    rrca
    ld   a, $62
    rst  $18
    inc  a
    ld   l, c
    ld   e, $FE
    rrca
    ld   sp, hl
    rst  8

label_3DF6A::
    ld    hl, sp+$CF
    di
    inc  e
    db   $E8 ; add  sp, d
    ld   a, [$FF3E]
    db   $10 ; Undefined instruction
    ld   [$B43C], sp

label_3DF76::
    ld   a, h
    or   h
    inc  [hl]
    call z, label_F8F8
    ld   [rJOYP], a
    nop
    nop
    ld   [hl], $18
    db   $EB ; Undefined instruction
    db   $FC ; Undefined instruction
    push bc
    ld   a, $62
    rra
    ldd  [hl], a
    rrca

label_3DF8A::
    ld   sp, label_3F10F
    rrca
    pop  af
    rrca
    ld   l, h
    jr   label_3DF6A
    ccf
    xor  a
    ld   [hl], b
    ld   e, h
    ld   [$FF58], a
    ld   [$FF98], a
    ld   [$FF9C], a
    ld   [$FF9F], a
    ld   [rJOYP], a
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DFC0
    jr   label_3DFC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3DFD0
    jr   label_3DFD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3DFC0::
    add  a, a
    ld    hl, sp+$FF
    pop  bc
    cp   $7F

label_3DFC6::
    rst  $38
    ld   b, c
    adc  a, a
    ld   a, [$FFFC]
    add  a, e
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    jp   label_1FF

label_3DFD2::
    rst  $38
    pop  af
    rst  $28
    ld   e, $FF
    pop  af
    rst  $38
    ld   bc, $8F73
    rst  $38
    ld   bc, rIE
    rst  $20
    nop
    db   $DB
    jr   label_3DF8A
    inc  h
    ld   c, [hl]
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   e, [hl]
    ld   d, d
    cp   l
    inc  a
    jp   label_0
    nop

label_3DFF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3E010
    jr   label_3E012
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    rst  $20

label_3E001::
    jr   label_3DFC6
    inc  a
    nop
    rst  $38
    jr   label_3E007
    inc  a
    rst  $38
    rst  $38
    rst  $38
    jp   label_3E6FF
    add  a, c

label_3E010::
    jp   label_24C3
    rst  $20
    db   $DB
    inc  a
    rst  $20
    jr   label_3E018
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, a
    ld   [$FFDF], a
    ld   [$FFE7], a
    ld    hl, sp+$EF
    ld   [hl], b
    rst  $38
    ld   h, b
    rst  $18
    ld   h, b
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FFF9], a
    rlca
    ei
    rlca
    rst  $20
    rra
    rst  $30
    ld   c, $FF
    ld   b, $FB
    ld   b, $F9
    rlca
    ld   sp, hl
    rlca
    di
    inc  c
    ld   sp, hl
    ld   b, $F8
    rlca
    ld    hl, sp+$07
    db   $E3 ; Undefined instruction
    rra
    pop  af
    rrca
    ld   sp, hl
    rlca
    ld   sp, hl
    rlca
    rst  8
    jr   nc, label_3DFF2
    ld   h, b
    rra
    ld   [$FF1F], a
    ld   [$FFC7], a
    ld    hl, sp+$8F
    ld   a, [$FF9F]
    ld   [$FF9F], a
    ld   [$FFF1], a
    rrca
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
    adc  a, a
    ld   a, [$FFEF]
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop

label_3E078::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    adc  a, a
    ld   a, [$FF83]
    db   $FC ; Undefined instruction
    ld   b, b
    rst  $38
    cp   b
    ld   a, a
    ld   l, h
    rra
    rla
    rrca
    rrca
    rlca
    inc  b
    inc  bc
    pop  af
    rrca
    pop  bc
    ccf

label_3E094::
    ld   [bc], a
    rst  $38
    dec  e
    cp   $36
    ld    hl, sp+$E8
    ld   a, [$FFF0]
    ld   [rNR41], a
    ret  nz
    rlca
    inc  bc
    inc  c
    rlca
    dec  bc

label_3E0A5::
    inc  c
    ld   [hl], a
    jr   c, label_3E078
    ld   [hl], b
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FF9F], a
    ld   [$FFE0], a
    ret  nz
    jr   nc, label_3E094
    ret  nc
    jr   nc, label_3E0A5
    inc  e
    di
    ld   c, $F9
    rlca

label_3E0BC::
    ld   sp, hl
    rlca
    ld   sp, hl
    rlca
    nop
    nop
    nop
    ld    hl, sp+$00
    ld   h, h
    nop
    ld   d, h
    nop
    ld   c, d
    nop
    ld   hl, label_1F00
    nop
    nop

label_3E0D0::
    nop
    nop
    stop
    ld   d, h
    nop
    jr   z, label_3E0D8

label_3E0D8::
    nop
    nop
    nop
    nop
    nop
    nop

label_3E0DE::
    nop

label_3E0DF::
    nop
    jp   [hl]
    jr   label_3E0CC
    jr   label_3E0D0
    jr   label_3E0DE
    inc  c
    di
    rrca
    ld    hl, sp+$07
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$0F
    rst  $38

label_3E0F3::
    rlca
    ld    hl, sp+$20
    ld    hl, sp+$70
    sbc  a, h
    ld   a, [$FF0F]
    rst  $38
    rst  $20
    rra
    rst  $38

label_3E0FF::
    nop
    rra
    ld   a, [$FFFF]
    ld   [rIE], a
    inc  c
    rst  $38
    rra
    ld   a, [$FF1F]
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  8
    ld   a, [$FFFF]
    nop
    scf
    jr   label_3E12A
    jr   label_3E0BC
    jr   c, label_3E0E6
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
    sbc  a, a
    ld   h, b
    rra
    ld   [$FF3F], a
    ret  nz
    ld   sp, hl
    ld   b, $F8
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $20
    jr   label_3E0F3
    ccf
    rra
    rst  $38
    jr   c, label_3E137
    db   $E3 ; Undefined instruction
    ld    hl, sp+$C3
    ld   a, [$FFA7]
    ret  nc
    ld   h, e
    sub  a, b
    rst  $20
    jr   label_3E146
    db   $FC ; Undefined instruction
    ld    hl, sp+$FF

label_3E146::
    inc  e
    rst  $38
    rst  0
    rra
    jp   label_C50F
    dec  bc
    and  $09
    rst  0
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_8C3], sp
    db   $E3 ; Undefined instruction
    ld   [label_8C3], sp
    push bc
    ld   [label_8C5], sp
    pop  hl
    ld   [label_8E3], sp
    ld   l, b
    sub  a, a
    ld   b, b
    cp   b
    ld   c, b
    and  b
    add  a, l
    ld   b, b
    rrca
    add  a, a
    rra
    ld   c, a
    rra
    ccf
    ld   a, a
    ccf
    ld   d, $E9
    ld   b, $19
    ld   a, [de]
    dec  b
    and  b
    inc  bc
    ld   a, [$FFE1]
    ld    hl, sp+$F2
    ld    hl, sp+$FC
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3E1B0
    jr   label_3E1B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3E1C0
    jr   label_3E1C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3E1B0::
    nop
    nop

label_3E1B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3E1D0
    jr   label_3E1D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3E1C0::
    nop
    nop

label_3E1C2::
    stop
    ld   d, h
    nop
    jr   z, label_3E1C8

label_3E1C8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_3E1D0::
    nop
    nop

label_3E1D2::
    nop
    rra
    nop
    ld   h, $00
    ld   a, [hli]
    nop
    ld   d, d
    nop
    add  a, h
    nop
    ld    hl, sp+$00
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3E200
    jr   label_3E202
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    jp   label_81FF
    rst  $38
    inc  a
    jp   label_FF
    sbc  a, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_3E200::
    nop
    nop

label_3E202::
    rlca
    rlca
    rra
    jr   label_3E236
    jr   nc, label_3E259
    ld   l, a
    add  a, e
    rst  $38
    sbc  a, h
    rst  $38
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    inc  bc
    inc  bc
    add  a, l
    add  a, [hl]
    ld   c, c
    adc  a, $A9
    ld   l, [hl]
    ld   d, l
    cp   a
    adc  a, [hl]
    ld   a, [$F25A]
    sbc  a, e
    ld   [hl], d
    ld   [$FFE0], a
    sub  a, c
    ld   [hl], c
    sub  a, d
    ld   [hl], e
    sub  a, l
    db   $76 ; Halt
    xor  b
    rst  $38
    ld   [hl], c
    ld   e, a
    ld   d, d
    ld   e, a
    reti
    ld   c, [hl]
    nop
    nop
    ld   [$FFE0], a
    ld    hl, sp+$18

label_3E236::
    db   $F4 ; Undefined instruction
    inc  c
    ld   [bc], a
    cp   $C1
    rst  $38
    add  hl, sp
    rst  $38
    rst  $10

label_3E23F::
    scf
    adc  a, c
    ld   sp, hl
    sub  a, e
    di
    and  a
    push hl
    ld   b, a
    ld   b, l
    rlca
    dec  b
    inc  bc
    rlca
    rlca

label_3E24D::
    dec  b
    add  hl, bc
    ld   [$BF41], sp
    ld   b, d
    cp   a
    dec  b
    cp   $0F
    cp   $1F

label_3E259::
    ld   sp, hl
    ld   a, $F8
    rst  $38
    jp   [hl]
    rst  $38
    ld   b, [hl]
    pop  hl
    cp   $30
    rst  $38
    ret  c
    ccf
    db   $EC ; Undefined instruction
    ccf
    cp   $CF
    ld   a, e
    rrca
    rst  $38
    sub  a, e
    rst  $38
    ld   [hl], d
    ld   c, c
    rst  8
    ld   h, l
    rst  $20
    ld   [hl], e
    db   $D3 ; Undefined instruction
    ld   [hl], b
    ret  nc
    ld   [hl], b
    ret  nc
    ld   [hl], b
    ret  nc
    ld   [$FFA0], a
    sub  a, b
    db   $10 ; Undefined instruction
    rlca
    ld   [$C70D], a
    rlca
    add  a, b
    nop

label_3E288::
    add  a, a
    rlca
    dec  de
    jr   label_3E2C4
    daa
    add  hl, sp
    inc  l
    xor  [hl]
    xor  [hl]
    ld   d, l
    db   $DB
    cp   $DE
    ld   [hl], c
    ld   [hl], b
    rst  $18
    ret  nc
    ld   e, a
    ret  nc
    rst  $38
    ret  c
    or   a
    ld   a, h
    cp   $00
    call label_8C30
    ld   d, e
    adc  a, d
    ld   d, h
    and  b
    ld   e, a
    pop  bc
    jr   nz, label_3E24D
    ld   b, b
    daa
    ld   b, b
    ld   bc, label_1378
    adc  a, b
    inc  de
    db   $E8 ; add  sp, d
    cpl
    db   $10 ; Undefined instruction

label_3E2B9::
    ld   [$C837], sp
    ld   d, [hl]
    jr   z, label_3E24D
    jr   nc, label_3E2B9
    nop
    ld   [rJOYP], a

label_3E2C4::
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
    nop
    nop
    ld   bc, label_300
    nop
    rlca
    nop
    rlca
    nop
    rrca
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    ld    hl, sp+$01
    pop  hl
    ld   [bc], a
    jp   label_8604
    add  hl, bc
    adc  a, a
    db   $10 ; Undefined instruction
    jr   nz, label_3E30B
    ld   b, c
    inc  l
    sub  a, e
    ld   bc, $83C0
    ld   b, b
    rlca
    ret  nz
    rst  0
    jr   nz, label_3E288
    ld   [hl], b
    rrca
    ld   [$FF1F], a
    ret  nz
    rra
    add  a, b
    ld   d, $19
    inc  l
    inc  sp
    jr   c, label_3E32D
    ld   d, c
    ld   l, a
    ld   b, c
    ld   a, a
    ld   b, c

label_3E30B::
    ld   a, a
    add  a, e
    rst  $38
    add  a, l
    db   $FD ; Undefined instruction
    add  hl, de
    pop  af
    ld   c, h
    db   $FC ; Undefined instruction
    add  a, [hl]
    db   $FC ; Undefined instruction
    inc  sp
    rst  8
    ld   a, b
    add  a, a
    ld   [hl], b
    adc  a, a
    ld   h, b
    sbc  a, a
    ld   h, c
    sbc  a, a
    sbc  a, b
    adc  a, a
    jr   nc, label_3E363
    ld   h, e
    ccf
    call z, label_8EF3
    pop  af
    add  a, a
    ld    hl, sp+$83

label_3E32D::
    db   $FC ; Undefined instruction
    pop  bc
    cp   $E8
    jr   label_3E367
    call z, label_EC14
    add  a, d
    cp   $42
    cp   $42
    cp   $61
    rst  $38
    ld   [hl], c
    rst  $38
    ld   de, label_1F10
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rrca
    ld   [bc], a
    ld   bc, $0003
    ld   bc, $0000
    nop
    cp   $70
    cp   $08
    rst  $38
    add  hl, bc
    rst  $38
    add  a, $7E
    ld   [$FFBE], a
    ld   [hl], b
    rst  $38
    ld   [label_707], sp
    ld   a, a
    ld   [bc], a
    ld   a, a

label_3E363::
    ld   e, $FF
    sub  a, b
    rst  $38

label_3E367::
    ld   h, c
    ld   a, [hl]
    rlca
    ld   a, c
    ld   c, $FF
    db   $10 ; Undefined instruction
    ld   [$FFD8], a
    ld   [label_8F8], sp
    ld    hl, sp+$08
    ld   a, [$FFF0]
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    ld   [hl], e
    ld   e, b
    ld   a, [hl]
    ld   d, c
    xor  h
    di
    or   c
    xor  $A3
    db   $FC ; Undefined instruction
    add  a, b
    rst  $38
    ret  nz
    ld   a, a
    rst  $38
    ccf
    ld   h, $DC
    ld   l, d
    sbc  a, [hl]
    jp   z, label_963E
    ld   a, [hl]
    ld   h, $FC
    call z, label_38F8
    ld   a, [$FFF0]
    ret  nz
    inc  a
    ld   b, e
    inc  e
    inc  hl
    jr   label_3E3CD
    ld   [label_1327], sp

label_3E3A9::
    ld   c, h
    cp   a
    nop
    ld   a, a
    add  a, b
    ld   a, h
    nop
    ld   c, h
    sub  a, b
    nop
    sbc  a, $38
    pop  bc
    ld   a, b
    add  a, [hl]
    ld   a, [$FF00]
    ld   [rJOYP], a
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
    inc  bc
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a

label_3E3CD::
    nop
    rst  $38
    nop
    ld   a, $00
    ld   a, [hl]
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    nop
    nop
    jr   c, label_3E3A9

label_3E3E2::
    nop
    ld   a, $00
    inc  e
    inc  bc
    nop
    rrca
    jr   nz, label_3E3FA
    ld   d, b
    rrca
    ld   [hl], b
    rst  $38
    nop
    ld   a, $00
    ld   e, $60
    adc  a, [hl]
    ld   d, b
    ld   h, h
    adc  a, b
    or   b
    ld   b, h

label_3E3FA::
    ret  c
    ldi  [hl], a
    db   $EC ; Undefined instruction
    inc  de
    nop
    ld   c, $03
    inc  bc
    ld   b, $04
    dec  a
    ld   a, $47
    ld   b, a
    sbc  a, [hl]
    add  a, d
    or   [hl]
    adc  a, d
    and  $9A
    ld   a, h
    ld   b, h
    add  a, b
    add  a, b
    ld   a, [$FF70]
    ret  c
    adc  a, b
    xor  b
    ret  c
    ld   e, h
    ld   a, h
    ld   [hl], $22
    ld   a, $22
    ld   a, $3E
    ccf
    jr   c, label_3E46A
    ld   b, h
    rst  $10
    call nc, label_C4C7
    ei
    db   $FC ; Undefined instruction
    ld   [$FFBF], a
    cp   b
    sbc  a, a
    rst  $10
    rst  8
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    ld   sp, hl
    rlca
    pop  af
    ld   a, a
    adc  a, e
    adc  a, a
    xor  a
    xor  l
    adc  a, l
    adc  a, c
    ei
    di
    nop
    nop
    ld   e, $1E
    ld   sp, label_3831
    jr   z, label_3E486
    dec  h
    ld   e, $12
    inc  e
    inc  d
    ld   [label_708], sp
    rlca
    ld   [label_3F008], sp
    ld   [hl], b
    sub  a, c
    sub  a, b
    db   $10 ; Undefined instruction
    sbc  a, h
    inc  e
    ld   a, a
    ld   a, a
    rst  $38
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    inc  a
    inc  h
    ccf
    inc  de
    ld   e, $12
    ld   e, $12

label_3E46A::
    ld   a, $3E
    cp   $FE
    rst  $38
    ld   a, a
    nop
    nop
    ld   c, $0E
    sub  a, c
    sub  a, c
    ld   h, e
    ld   h, e
    daa
    dec  h
    ld   l, a
    ld   l, c
    rst  $38
    or   c
    cp   $2A
    sub  a, a
    sbc  a, h
    and  a
    cp   h

label_3E484::
    rst  0
    db   $FC ; Undefined instruction

label_3E486::
    sub  a, a
    db   $FC ; Undefined instruction
    sub  a, a
    db   $ED ; Undefined instruction
    ld   b, a
    ld   a, [hl]
    add  hl, hl
    add  hl, sp
    db   $10 ; Undefined instruction

label_3E490::
    rst  $38
    ld   a, a
    rst  $38
    di
    rst  $38
    di
    cp   a
    or   e
    sbc  a, a
    sub  a, e
    cp   $72
    rst  $38
    ld   bc, $80FF
    rst  $38
    inc  b
    rst  $38
    sub  a, h
    rst  $28
    call nz, label_C5FF
    ld   a, [hl]
    ld   h, a
    ld   a, h
    ld   d, a
    ld    hl, sp+$8F
    ld    hl, sp+$0F
    db   $FD ; Undefined instruction
    daa
    ld   sp, hl
    cpl
    pop  af
    rst  $38
    add  a, l
    rst  $38
    add  a, l
    ei
    add  a, c
    rst  $38
    cp   c
    rst  $38
    add  a, $C6
    rst  $38
    rst  $38
    db   $DB
    rst  $20
    db   $D3 ; Undefined instruction
    rst  $20
    db   $DB
    rst  $20
    set  6, a
    db   $DB
    rst  $20
    set  4, a
    db   $DB
    rst  $20
    ld   [$FFA0], a
    cp   a
    rst  $18
    sbc  a, b
    db   $E8 ; add  sp, d
    set  7, e
    ld   sp, hl
    cp   c
    cp   l
    db   $54
    ld   d, h
    ld   a, h
    ccf
    ccf
    db   $DB
    jr   label_3E490
    inc  l
    ld   c, d
    ld   c, [hl]
    adc  a, c
    adc  a, a
    sbc  a, c
    sbc  a, a
    cp   l
    and  a
    ld   a, [hl]
    ld   b, d
    cp   l
    inc  a
    ld   [bc], a
    nop
    ldi  [hl], a
    nop
    ld   [bc], a
    nop
    add  a, d
    nop
    ld   a, [bc]
    nop
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    jr   c, label_3E53A
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rrca
    inc  c
    ld   e, $10
    ld   a, $20
    ccf
    jr   nz, label_3E577
    ld   b, d
    push hl
    add  a, e
    ld   sp, hl
    add  a, a
    pop  hl
    rst  $38
    ld   sp, hl
    rra
    ld   a, $06
    db   $3A ; ldd  a, [hl]
    ld   b, $FE
    ld   [bc], a
    ld   [$FFA0], a
    cp   a
    rst  $18
    sbc  a, a
    db   $E4 ; Undefined instruction
    call nz, label_FFFF
    cp   a
    cp   a
    pop  de
    ld   d, c
    ld   a, a
    ccf
    ccf
    rlca
    dec  b
    db   $FD ; Undefined instruction
    ei
    ld   sp, hl
    daa
    inc  hl
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction

label_3E53A::
    db   $FD ; Undefined instruction
    dec  bc
    ld   a, [bc]
    cp   $FC
    db   $FC ; Undefined instruction
    add  hl, bc
    add  hl, bc
    dec  e
    dec  d
    rra
    inc  de
    rra
    ld   de, label_151B
    dec  sp
    ld   sp, label_3CA4F
    adc  a, a
    adc  a, h
    rst  $38
    db   $FC ; Undefined instruction
    rst  $30
    db   $F4 ; Undefined instruction
    rst  $20
    db   $E4 ; Undefined instruction
    rrca
    rrca
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    jp   nz, label_C040
    ld   b, b
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $18
    ld   e, a
    rst  8
    ld   c, a
    pop  bc
    pop  bc
    ld   h, c
    ld   h, c
    ld   a, a
    ld   e, a
    rst  $38
    adc  a, b
    db   $FC ; Undefined instruction
    inc  h
    cp   $22
    cp   $62
    cp   $92
    cp   $0A
    cp   $26
    db   $07
    rlca
    db   $FD ; Undefined instruction
    rst  0
    ld   [de], a
    db   $10 ; Undefined instruction
    jr   z, label_3E5C4
    daa
    ccf
    inc  h
    ccf
    inc  h

label_3E58A::
    rra
    inc  d
    rrca
    rrca
    nop
    nop
    rst  $38
    db   $E3 ; Undefined instruction
    sbc  a, h
    sbc  a, h
    add  a, h
    add  a, h
    cp   $FE
    add  a, a
    db   $FD ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rlca
    inc  b
    inc  bc

label_3E59F::
    inc  bc
    ld    hl, sp+$EF
    inc  d
    rra
    inc  d
    rra
    rla
    rra
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    inc  a
    db   $E8 ; add  sp, d
    jr   c, label_3E59F
    ld   a, [$FFC2]
    jp   nz, label_A2E2
    cp   $9E
    cp   $92
    ld   a, [hl]
    ld   d, d
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    db   $DB
    rst  $20
    set  6, a

label_3E5C4::
    db   $DB
    rst  $20
    db   $DB
    rst  $20
    db   $D3 ; Undefined instruction
    rst  $20
    ld   e, d
    rst  $20
    ld   a, [hl]
    inc  h
    inc  a
    jr   label_3E5D8
    dec  b
    db   $FD ; Undefined instruction
    ei
    add  hl, de
    rla
    db   $D3 ; Undefined instruction
    rst  $18

label_3E5D8::
    sbc  a, a
    sbc  a, l
    cp   l
    xor  e
    ld   a, [hli]
    ld   a, $FC
    db   $FC ; Undefined instruction
    rst  $20
    nop
    db   $DB
    jr   label_3E58A
    inc  h
    ld   c, [hl]
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   e, [hl]
    ld   d, d
    cp   l
    inc  a
    jp   label_3D500
    rst  $38
    nop
    rst  $38
    xor  d
    ld   d, l
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
    jr   label_3E61A
    jr   z, label_3E62C
    ld   l, $2E
    ld   e, a
    ld   c, c
    cp   a
    sbc  a, a
    or   c
    or   c
    push af
    push af
    or   c
    or   c
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

label_3E61A::
    rst  $30
    push af
    rst  $30
    rst  $30
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   e, $1E
    ld   [hl], $32
    db   $76 ; Halt
    ld   d, d
    rst  $30
    db   $D3 ; Undefined instruction

label_3E62C::
    rst  $30
    ret  nc
    ld   a, [$FFD0]
    ld   b, b
    ld   b, b
    add  a, b
    add  a, b
    ld   a, [$FFF0]
    ret  c
    sbc  a, b
    call c, label_DE94
    sub  a, [hl]
    sbc  a, $16
    ld   e, $16
    cp   $FF
    rst  8
    add  a, c
    sbc  a, a
    and  b
    cp   e
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    sub  a, d
    add  a, b
    call z, label_3FF80
    rst  $38
    rst  $38
    add  a, c
    rst  $18
    ld   hl, label_1FB
    rst  $38
    ld   bc, label_1FF
    add  hl, de
    ld   bc, label_1C3
    rrca
    rrca
    jr   label_3E674
    dec  hl
    jr   nc, label_3E6B2
    ld   [hl], b
    adc  a, e
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FFFF]
    rst  $38
    nop
    nop

label_3E674::
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
    ld   a, [$FFF0]
    jr   label_3E68C
    call nc, label_D20C
    ld   c, $D1
    rrca
    pop  de
    rrca

label_3E68C::
    pop  de
    rrca
    pop  de
    rrca
    adc  a, e
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF7F]
    ld   a, a
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    sub  a, b
    sbc  a, a
    sub  a, b
    sbc  a, a
    rst  $38
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    cp   $FE

label_3E6B2::
    add  a, c
    ld   bc, label_181
    adc  a, c
    ld   sp, hl
    adc  a, c
    ld   sp, hl
    rst  $38
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    nop
    nop
    nop
    nop
    jr   label_3E6DE
    inc  h
    inc  h
    ld   e, d
    ld   b, d
    ld   e, d
    ld   b, d
    ld   b, [hl]
    ld   h, [hl]
    ld   c, d
    ld   e, [hl]
    ld   a, a
    ccf
    ret  nz
    ld   b, b
    add  a, a
    adc  a, a
    adc  a, b
    adc  a, b
    rst  0
    rst  8
    add  a, b
    add  a, b
    adc  a, a
    adc  a, a

label_3E6DE::
    ld   b, b
    ret  nz
    rst  $28
    nop
    rst  0
    nop
    cp   e
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    cp   e
    nop
    rst  0
    nop
    rst  $28
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   a, a

label_3E6FF::
    nop
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, [hl]
    cp   a
    sbc  a, a
    or   e
    or   e
    jp   [hl]
    xor  c
    call nz, label_6C4
    ld   b, $05
    dec  b
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
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    ret  nz
    rst  $38
    rst  $18
    ld   a, [$FFB0]
    push af
    or   l
    ld   a, [$FFB0]
    rst  $38
    rst  $38
    cp   $F6
    cp   $F6
    cp   $06
    cp   $F6
    ld   e, $1A
    ld   e, [hl]
    ld   e, d
    ld   e, $1A
    cp   $FE
    sbc  a, a
    rst  $38
    rst  $38
    pop  af
    di
    sbc  a, l
    or   e
    rst  $18
    rst  $38
    db   $FC ; Undefined instruction
    cp   $85
    adc  a, h
    rst  $30
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    rst  $38
    adc  a, a
    rst  8
    cp   c
    call label_FFFB
    ccf
    ld   a, a
    and  c
    ld   sp, $FFEF
    rst  $38
    adc  a, b
    ld   a, [$FF8F]
    ld   a, [$FF90]
    rst  $28
    sub  a, b
    rst  $28
    and  b
    rst  $18
    and  b
    rst  $18
    ret  nz
    cp   a
    ret  nz
    cp   a
    nop
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
    ld   de, $F10F
    rrca
    add  hl, bc
    rst  $30
    add  hl, bc
    rst  $30
    dec  b
    ei
    dec  b
    ei
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    pop  de
    rrca
    sbc  a, a
    sbc  a, a
    add  a, b
    add  a, b
    ret  nz
    add  a, b
    cp   a
    ret  nz
    add  a, b
    cp   a
    ret  nz
    add  a, h
    ld   a, e
    ld   b, h
    ccf
    ccf
    ld   sp, hl
    ld   sp, hl
    add  a, c
    ld   bc, label_183
    ld   a, l
    add  a, e
    ld   bc, label_3FD
    ld   de, label_12EE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   c, d
    ld   d, [hl]
    ld   c, d
    ld   d, [hl]
    ld   c, d
    ld   b, [hl]
    ld   c, d
    ld   d, [hl]
    ld   l, d
    ld   d, [hl]
    ld   l, d
    ld   d, [hl]
    inc  a
    inc  a
    nop

label_3E7CF::
    nop
    rst  $38
    rst  $38
    nop
    nop
    or   e
    or   e
    ld   [de], a
    ld   [de], a
    ld   e, $9E
    sub  a, d
    sub  a, d
    inc  sp
    or   e
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    add  hl, sp
    add  hl, sp
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    add  hl, sp
    add  hl, sp
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  bc
    ld   [bc], a
    pop  hl
    pop  af
    sub  a, c
    sub  a, c
    db   $E3 ; Undefined instruction
    di
    add  a, c
    add  a, c
    pop  bc
    pop  bc
    ld   [bc], a
    inc  bc
    rst  $38
    ld   a, [$FFB8]
    rst  $30
    ret  c
    rst  $30
    db   $E8 ; add  sp, d
    rst  $30
    rst  $38
    ld   a, [$FFB0]
    rst  $38
    ret  nc
    rst  $38
    ld   [rIE], a
    rst  $38
    rrca
    dec  c
    rst  $38
    dec  bc
    rst  $38
    rlca
    rst  $38
    rst  $38
    rrca
    dec  e
    rst  $28
    dec  de
    rst  $28
    rla
    rst  $28
    ccf
    rst  $38
    ld   c, a
    ld   [$FF97], a
    rst  8
    db   $E8 ; add  sp, d
    sbc  a, b
    ret  nc
    or   b
    ret  nc
    or   b
    jp   nc, label_D0B0
    or   b
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FF00+C]
    jp   [hl]
    di
    rla
    add  hl, de
    ld   c, e
    dec  c
    dec  bc
    dec  c
    dec  bc
    dec  c
    dec  bc
    dec  c
    nop
    nop
    nop
    nop
    stop
    inc  bc
    inc  bc
    dec  b
    ld   b, $0B
    inc  c
    ld   a, [bc]
    dec  c
    dec  bc
    dec  c
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    and  d
    ld   h, b
    ret  nc
    jr   nc, label_3E8AD
    or   b
    ret  nc
    or   b
    nop
    nop
    jr   label_3E87C
    inc  h
    inc  h
    inc  sp
    inc  hl
    jr   c, label_3E88A
    ld   [hl], b
    ld   b, b
    ld   l, h
    ld   c, h
    db   $E4 ; Undefined instruction
    add  a, h
    nop
    nop
    jr   c, label_3E8AC
    ld   e, b
    ld   c, b
    cp   b
    adc  a, b
    inc  e
    inc  b
    ld   c, $02

label_3E87C::
    ld   l, [hl]
    ld   h, d
    ld   c, a
    ld   b, c
    ret  nc
    or   b
    jp   nc, label_D0B0
    or   b
    ret  nc
    or   b
    ret  nc
    or   b

label_3E88A::
    pop  de
    or   b
    ret  nc
    or   b
    ret  nc
    or   b
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
    stop
    inc  b
    nop
    nop
    nop
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    cp   l
    add  a, c
    cp   l
    add  a, c
    add  a, c
    add  a, c
    rst  $38
    rst  $38

label_3E8AC::
    db   $DB

label_3E8AD::
    db   $DB
    rst  $38
    rst  $38
    rst  $38
    nop
    inc  b
    ei
    inc  b
    ei
    inc  b
    ei
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    rst  $38
    add  a, a
    rst  $38
    ld    hl, sp+$FF
    add  a, b
    ld    hl, sp+$C7
    rst  0
    ld   a, b
    rst  $38
    ld   b, e
    rst  $38
    cp   $FF
    add  a, b
    rst  $38
    pop  hl
    rst  $38
    rra
    rst  $38
    ld   bc, $8779
    rst  8
    ld   sp, rIE
    rst  $38
    ld   [bc], a
    db   $E3 ; Undefined instruction
    ld   e, $00
    nop
    add  a, b
    nop

label_3E8E4::
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   a, [hl]
    nop
    cp   a
    ld   b, b
    rst  $18
    jr   nz, label_3E8E4
    db   $10 ; Undefined instruction
    ld   [label_14EB], sp
    db   $22
    ldi  [hl], a
    cp   [hl]
    ld   b, c
    ld   a, a
    add  a, b
    cp   a
    or   b
    ret  c
    sub  a, a
    xor  a
    rst  8
    sub  a, b
    ld   [$FFCF], a
    ld   a, [$FFEF]
    ld   [hl], b
    rst  $38
    jr   nc, label_3E98E
    rra
    db   $FD ; Undefined instruction
    dec  c
    dec  bc
    ld   sp, hl
    push af
    di
    add  hl, bc
    rlca
    di
    rrca
    or   $0F
    db   $FD ; Undefined instruction
    ld   c, $FE
    ld    hl, sp+$D8
    or   b
    db   $EC ; Undefined instruction
    sbc  a, b
    or   a
    adc  a, h
    db   $DB
    add  a, a
    xor  a
    ret  nz
    ret  nc
    ld   [$FFE0], a
    rst  $38
    rst  $38
    rst  $38
    dec  de
    dec  c
    scf
    add  hl, de
    db   $ED ; Undefined instruction
    ld   sp, $E1DB
    push af
    inc  bc
    dec  bc
    rlca
    rlca
    rst  $38
    rst  $38
    rst  $38
    add  hl, bc
    dec  c
    inc  b
    ld   b, $43
    inc  bc
    nop
    nop
    nop
    nop
    ld   hl, $0000
    nop
    nop
    nop
    sub  a, b
    or   b
    jr   nz, label_3E9B4
    ret  nz
    ret  nz
    inc  b
    nop
    nop
    nop
    inc  b
    nop
    nop
    nop
    nop
    nop
    db   $EB ; Undefined instruction
    adc  a, e
    adc  a, $AA
    db   $E4 ; Undefined instruction
    and  h
    db   $E4 ; Undefined instruction
    and  h
    xor  $AE
    ld   sp, hl
    sbc  a, c
    ld   a, c
    ld   c, b
    ld   a, a
    ld   c, b
    rra
    ld   bc, label_937
    ccf
    add  hl, bc
    ccf
    add  hl, bc
    ld   a, a
    add  hl, de
    rst  $38
    pop  hl
    cp   $22
    cp   $46
    dec  bc
    dec  c
    dec  bc
    dec  c
    dec  hl
    dec  c
    dec  bc
    dec  c
    dec  bc
    dec  c
    dec  bc
    dec  c
    dec  bc
    dec  c

label_3E98E::
    dec  bc
    dec  c
    nop
    nop
    stop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $DB
    and  l
    rst  $18
    and  c
    rst  $10
    xor  c
    rst  $30
    adc  a, c
    add  a, c
    add  a, c
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    rst  $38
    rst  $38
    rst  $38
    nop
    inc  b
    ei

label_3E9B4::
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
    rst  $38
    add  a, a
    ld    hl, sp+$FF
    pop  bc
    cp   $7F
    rst  $38
    ld   b, c
    adc  a, a
    ld   a, [$FFFC]
    add  a, e
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    jp   label_1FF
    rst  $38
    pop  af
    rst  $28
    ld   e, $FF
    pop  af
    rst  $38
    ld   bc, $8F73
    rst  $38
    ld   bc, rIE
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    res  6, l
    res  6, l
    db   $DB
    and  l
    rst  $20
    sbc  a, c
    jp   label_FFBD
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    xor  d
    ld   d, l
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    ccf
    ccf
    ld   b, b
    ld   b, b
    sub  a, b
    adc  a, a
    xor  a
    sbc  a, a
    sbc  a, e
    or   h
    cp   a
    and  b
    or   [hl]
    xor  c
    cp   a
    and  b
    ld    hl, sp+$F8
    inc  b
    inc  b
    ld   [de], a
    ld  [$FF00+C], a
    ld   [label_3F2F2], a
    sbc  a, d
    ld   [$FA1A], a
    ld   a, [bc]
    cp   d
    ld   c, d
    ld   l, $30
    inc  h
    jr   c, label_3EA49
    jr   c, label_3EA55
    jr   nc, label_3EA97
    ld   [hl], b
    db   $E4 ; Undefined instruction
    cp   b
    and  h
    cp   b
    xor  h
    or   b
    jr   z, label_3EA4A
    ld   l, b
    jr   label_3EA7D
    jr   c, label_3EA7F
    jr   c, label_3EAA5
    inc  e
    ld   l, $1A
    ld   a, [bc]
    db   $3A ; ldd  a, [hl]
    ld   c, d
    db   $3A ; ldd  a, [hl]
    adc  a, $9A
    sub  a, $8E
    ld   a, [$C6BE]
    add  a, $AA

label_3EA49::
    add  a, d

label_3EA4A::
    xor  e
    xor  d
    xor  e
    xor  e
    xor  $AB
    ld   [hl], e
    ld   e, c
    ld   l, e
    ld   [hl], c
    ld   e, a

label_3EA55::
    ld   a, l
    ld   h, e
    ld   h, e
    ld   d, l
    ld   b, c
    push de
    ld   d, l
    push de
    push de
    ld   [hl], a
    push de
    dec  sp
    dec  sp
    ld   a, $24
    rra
    add  hl, de
    rrca
    dec  bc
    rra
    dec  de
    rst  $38
    rst  $38
    add  a, a
    add  a, d
    xor  a
    xor  e
    call c, label_3FCDC
    inc  h
    cp   $9E
    push af
    push de
    push af
    push de
    db   $FD ; Undefined instruction
    sbc  a, l
    db   $FD ; Undefined instruction

label_3EA7D::
    dec  [hl]
    rst  $38

label_3EA7F::
    rst  8
    adc  a, a
    add  a, [hl]
    and  $80
    ld   a, [$FF00+C]
    ret  c
    ld   a, [$FFBC]
    ret  c
    or   $94
    jp   nc, label_DA92
    sub  a, d
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    cp   l
    rst  $38
    add  a, c

label_3EA97::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    cp   l
    rst  $38
    add  a, c
    rst  $38
    inc  a
    inc  a
    ld   e, [hl]
    ld   h, d
    add  a, e

label_3EAA5::
    db   $FD ; Undefined instruction
    add  a, c
    ld  [$FF00+C], a
    sbc  a, b
    reti
    sbc  a, b
    reti
    and  d
    pop  bc
    cp   [hl]
    db   $E3 ; Undefined instruction
    inc  a
    inc  a
    ld   a, d
    ld   b, [hl]
    pop  bc
    cp   a
    add  a, c
    ld   b, a
    add  hl, de
    sbc  a, e
    add  hl, de
    sbc  a, e
    ld   b, l
    add  a, e
    ld   a, l
    rst  0
    nop
    nop
    dec  a
    nop
    ld   b, l
    nop
    ld   b, l
    nop
    ld   c, b
    nop
    ld   d, a
    nop
    ld   l, b
    nop
    ld   [$0000], sp
    nop
    db   $FC ; Undefined instruction
    nop
    ld   [bc], a
    nop
    add  a, d
    nop
    ld   [hl], d
    nop
    ld   c, $00
    ld   [rJOYP], a
    ld   l, $00
    nop
    rst  $38
    ld   sp, label_3F8E
    add  a, b
    rra
    add  a, b
    rra
    add  a, b
    rra
    add  a, b
    inc  a
    add  a, b
    nop
    add  a, e
    nop
    rst  $38
    cp   $01
    cp   $01
    sbc  a, $21
    sbc  a, $01
    cp   $01
    ld   a, [hl]
    ld   bc, $8100
    adc  a, l
    sub  a, d
    ret  nz
    adc  a, a
    and  b
    ret  nz
    ld   e, a
    ld   h, b
    jr   nz, label_3EB49
    ccf
    ccf
    daa
    jr   c, label_3EB35
    jr   c, label_3EAF3
    ld   [de], a
    ld   b, $E2
    ld   a, [bc]
    ld   b, $F4
    inc  c
    ld   [$F8F8], sp
    ld    hl, sp+$C8
    jr   c, label_3EB67
    jr   c, label_3EACF
    or   b
    and  [hl]
    cp   b
    or   h
    sbc  a, b
    rst  $18
    adc  a, a
    and  b
    ret  nz
    ld   e, a
    ld   h, b
    ccf
    ccf
    nop
    nop
    ld   l, d
    ld   a, [de]
    ld   a, [hli]
    ld   a, [de]
    ld   a, [de]

label_3EB35::
    ldd  [hl], a
    or   $E2
    ld   a, [bc]
    ld   b, $F4
    inc  c
    ld    hl, sp+$F8
    nop
    nop
    cp   $AB
    rst  $38
    xor  a
    db   $FC ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    rst  0
    adc  a, $87
    adc  a, e
    add  a, a
    sub  a, a
    adc  a, h
    ld    hl, sp+$F8
    ld   a, a
    push de
    rst  $38
    rst  $30
    ccf
    rst  $38
    cp   a
    db   $E3 ; Undefined instruction
    ld   [hl], e
    pop  hl
    pop  de
    pop  hl
    jp   [hl]
    ld   sp, label_1F1F
    add  a, a
    add  a, d
    add  a, a
    add  a, e
    xor  a
    xor  e
    add  a, a

label_3EB67::
    add  a, e
    add  a, a
    add  a, d
    xor  a
    xor  e
    rst  $38
    add  a, e
    rst  $38
    rst  $38
    reti
    add  hl, bc
    db   $FD ; Undefined instruction
    adc  a, c
    ld   sp, hl
    ld   sp, hl
    rst  $38
    adc  a, a
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $86
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    pop  af
    ld   h, c
    ld   h, a
    ld   bc, label_74F
    dec  de
    rrca
    dec  a
    dec  de
    ld   l, a
    add  hl, hl
    ld   c, e
    ld   c, c
    ld   e, e
    ld   c, c
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    rst  $38
    sbc  a, c
    rst  $38
    rst  $38
    rst  $38
    sbc  a, h
    rst  $38
    ld   b, b
    ld   a, h
    ld   h, e
    ld   a, e
    ld   a, e
    ld   e, e
    ld   a, c
    ld   c, c
    ld   e, l
    ld   h, l
    ld   h, h
    inc  a
    ccf
    rra
    add  hl, sp
    rst  $38
    ld   [bc], a
    ld   a, $C6
    sbc  a, $DE
    jp  c, label_929E
    cp   d
    and  [hl]
    ld   h, $3C
    db   $FC ; Undefined instruction
    ld    hl, sp+$6C
    nop
    ld   d, a
    nop
    ld   c, b
    nop
    ld   b, [hl]
    nop
    ld   b, d
    nop
    ld   b, d
    nop
    ld   a, $00
    nop
    nop
    ld   a, [hli]
    nop
    ld   [label_A00], a
    nop
    and  $00
    sbc  a, b
    nop
    add  a, h
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    ld   bc, $FEFF
    ld   bc, $0100
    ld   bc, $8100
    nop
    ld   a, a
    nop
    db   $FD ; Undefined instruction
    dec  e
    ld  [$FF00+C], a
    ccf
    call label_E673
    ld   a, d
    di
    ld   e, $E7
    dec  a
    rst  $10
    ld   l, h
    and  e
    rst  $18
    rst  $18
    ret  c
    daa
    db   $FC ; Undefined instruction
    or   e
    adc  a, $4D
    ld   a, a
    rst  $18
    ld   [hl], e
    rst  $28
    cp   h
    db   $EB ; Undefined instruction
    ld   [hl], $C5
    ei
    rst  $28
    ld   a, $FF
    add  hl, de
    adc  a, $08
    adc  a, a
    inc  c
    adc  a, a
    ld   a, [bc]
    rrca
    add  hl, bc
    ld   e, $18
    scf
    inc  h
    push af
    ld   a, h
    ei
    sbc  a, b
    ld   [hl], a
    db   $10 ; Undefined instruction
    jr   nc, label_3EC38
    ld   d, b
    rst  $38
    sub  a, b
    ld   a, a
    jr   label_3EC3E
    inc  l
    rst  $38
    rrca
    ld   a, [$FF10]
    ld   a, [$FF20]
    ld   a, [$FF20]
    bit  0, b
    call c, label_F040
    add  a, b
    adc  a, c
    sub  a, b
    pop  hl
    ld   [$FF39], a
    jr   label_3EC91
    inc  b
    ld   h, $02
    dec  hl
    add  hl, bc
    rst  8
    dec  c
    ld   b, a
    dec  b
    and  [hl]
    ld   b, e
    or   d
    ld   h, [hl]
    ld   a, [$FF00+C]
    ld  [$FF00+C], a
    ld   h, $E2
    ld   h, $E0
    ld   h, $E0
    ld   h, $E0
    ld   b, [hl]
    add  a, $80
    dec  sp
    ld   b, [hl]
    ld   e, a
    inc  a
    ld   l, a
    inc  sp
    ld   a, l
    dec  h
    ld   a, a
    dec  h
    ccf
    inc  de
    jr   label_3EC86
    inc  d
    inc  c
    cp   $0E
    pop  af
    ld   de, label_28E8

label_3EC86::
    db   $DB
    ld   e, e
    db   $D3 ; Undefined instruction
    ld   d, e
    jp   label_8343
    sub  a, e
    add  a, c
    add  a, b
    inc  bc

label_3EC91::
    inc  bc
    add  a, l
    add  a, l
    ld   c, e
    ld   c, d
    cpl
    ld   l, $AF
    and  b
    xor  a
    xor  h
    ld   a, [$FD2A]
    ld   b, l
    ld   a, [$FF00]
    jp   label_8703
    inc  b
    adc  a, [hl]
    ld   [label_383E], sp
    dec  l
    ld   a, [hli]
    dec  e
    dec  de
    ld   a, [bc]
    ld   c, $01
    nop
    jp   label_E3C0
    jr   nz, label_3ED2E
    db   $10 ; Undefined instruction
    inc  e
    or   a
    ld   d, h
    cp   a
    ret  c
    ld   e, [hl]
    ld   [hl], b
    ld    hl, sp+$00
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
    nop
    nop
    ld   bc, label_300
    nop
    rlca
    nop
    rlca
    nop
    rrca
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3ED00
    jr   label_3ED02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d

label_3ECF3::
    ld   b, d
    inc  h
    inc  h
    jr   label_3ED10
    jr   label_3ED12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3ED00::
    add  a, b
    rst  $38

label_3ED02::
    or   h
    ei
    ret  c
    rst  $10
    add  hl, hl
    scf
    ld   hl, label_3E23F
    ccf
    push hl
    ld   a, $E7
    inc  a

label_3ED10::
    ld   bc, label_2DFF
    rst  $18
    rra
    db   $EB ; Undefined instruction
    sbc  a, h
    db   $E8 ; add  sp, d
    add  a, h
    db   $FC ; Undefined instruction
    ld   b, h
    db   $FC ; Undefined instruction
    and  h
    ld   a, h
    db   $E4 ; Undefined instruction
    inc  a
    ld   h, a
    ld   b, l
    ld   c, a
    ld   b, d
    db   $76 ; Halt
    ld   c, b
    dec  sp
    inc  a
    rra
    inc  b
    dec  a
    ld   b, $7E
    inc  bc

label_3ED2E::
    rst  $38
    ld   bc, $A6FE
    cp   $62
    xor  $12
    call c, label_FC3C
    jr   nz, label_3ECF3
    ld   h, b
    ld   h, b
    ret  nz
    add  a, b
    add  a, b
    cp   c
    sbc  a, c
    cp   c
    cp   c
    cp   c
    cp   a
    cp   c
    cp   c
    cp   c
    cp   b
    ret  nc
    sub  a, b
    db   $F4 ; Undefined instruction
    sub  a, [hl]
    db   $76 ; Halt
    sub  a, $F6
    db   $E3 ; Undefined instruction
    ei
    ld   a, [$FF00+C]
    ld   a, [$F9FB]
    ei
    ld   sp, hl
    ei
    ld   [hl], c
    ld   [hl], e
    ld   bc, label_305
    ret  nz
    add  a, b
    and  $80
    ld   a, a
    ld   h, b
    ld   e, e
    ld   d, [hl]
    ld   c, [hl]
    ld   c, a
    ld   l, a
    ld   c, a
    ld   l, b
    cpl
    rst  $38
    jr   label_3ED85
    inc  c
    inc  [hl]
    inc  c
    db   $E4 ; Undefined instruction
    ld   a, h
    ret  c
    sbc  a, b
    sub  a, d
    sub  a, d
    or   l
    sub  a, l
    rst  $28
    xor  c
    add  a, $C6
    rst  $20
    db   $E3 ; Undefined instruction
    ld   a, a
    inc  a
    rrca

label_3ED85::
    nop
    rst  $20
    rst  $20
    cp   b
    cp   b
    rst  0
    add  a, a
    ld   a, a
    ld   e, b
    rst  $38
    ld   [hl], b
    db   $FD ; Undefined instruction
    add  a, l
    rst  $38
    dec  e
    push af
    rla
    ld   a, [$FA0A]
    adc  a, d
    cp   $0A
    cp   $12
    inc  e
    ld   e, $0D
    dec  bc
    dec  a
    db   $3A ; ldd  a, [hl]
    dec  l
    dec  hl
    ld   a, [de]
    ld   e, $0D
    dec  bc
    dec  e
    ld   a, [bc]
    dec  a
    ld   b, $7F
    inc  bc
    cp   [hl]
    ret  nc
    cp   [hl]
    ld   e, h
    or   h
    call nc, label_3F858
    cp   b
    ret  nc
    cp   b
    ld   d, b
    cp   b
    ld   h, b
    ld   [$FFC0], a
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    ld   a, $00
    ld   a, [hl]
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3EE00
    jr   label_3EE02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3EE10
    jr   label_3EE12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3EE00::
    nop
    nop

label_3EE02::
    inc  bc
    inc  bc
    ld   b, $04
    ld   c, $08
    rrca

label_3EE09::
    ld   [label_80F], sp
    rlca
    inc  b
    rlca
    inc  b

label_3EE10::
    nop
    nop

label_3EE12::
    ret  nz
    ret  nz
    ld   h, b
    jr   nz, label_3EE87
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nc, label_3EE3F
    ld   [$FFF8], a
    sub  a, b
    cp   a
    ret  z
    ld   e, a
    ld   h, a
    rst  $28
    or   b
    cp   b
    sbc  a, a
    rst  $10
    adc  a, a
    and  b
    ret  nz
    sbc  a, a
    ld   [$FF79], a
    daa
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    rst  0
    dec  a
    dec  e
    ld   sp, hl
    db   $EB ; Undefined instruction
    pop  af
    dec  b
    inc  bc
    ld   sp, hl

label_3EE3F::
    rlca
    nop
    nop
    nop
    nop
    adc  a, b
    nop
    push de
    ld   [$887F], sp
    ld   [label_37DD], a
    rst  $38
    rst  $38
    nop
    ret  nc
    ld   h, b
    ret  nz

label_3EE53::
    ld   h, b
    db   $EC ; Undefined instruction

label_3EE55::
    ld   b, b
    ld    hl, sp+$40
    ld   [$FF50], a
    ret  nc
    ld   h, b
    cp   $60
    db   $E8 ; add  sp, d
    ld   [hl], b
    nop
    nop
    nop
    nop
    jr   c, label_3EE66

label_3EE66::
    ld   d, b
    jr   nz, label_3EE09
    ld   b, b
    xor  h
    ret  nz
    ld    hl, sp+$C0
    ld   [hl], b
    ret  nz
    rrca
    inc  bc
    dec  e
    inc  bc
    daa
    nop
    ld   b, $00
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $18
    ld   [$FF37], a
    ld    hl, sp+$4B

label_3EE87::
    inc  a
    rla
    inc  c
    dec  c
    ld   b, $3B
    ld   b, $0F
    ld   [bc], a

label_3EE90::
    rst  $38
    nop
    ei
    rlca
    db   $EC ; Undefined instruction
    rra
    jp   nc, label_E83C
    jr   nc, label_3EE4B
    ld   h, b
    call c, label_F060
    ld   b, b
    rst  $38
    ld   a, [hl]
    cp   l
    jp   label_81C3
    jp   label_E381
    add  a, c
    rst  0
    add  a, c
    jp   label_C381
    add  a, c
    rst  $38
    rst  $38
    nop
    rst  $38
    jp   label_813C
    ld   b, d
    jr   label_3EE53
    jr   label_3EE55
    add  a, c
    ld   b, d
    jp   label_FF3C
    rst  $38
    db   $DB
    rst  $20
    db   $D3 ; Undefined instruction
    rst  $20
    db   $DB
    rst  $20
    set  6, a
    db   $DB
    rst  $20
    set  4, a
    db   $DB
    rst  $20
    add  a, a
    rst  $38
    add  a, h
    db   $FC ; Undefined instruction
    set  7, e
    ei
    cp   e
    cp   c
    ret
    adc  a, l
    db   $FD ; Undefined instruction
    ld   b, h
    ld   a, h
    ccf
    ccf
    rrca
    ld   [label_1019], sp
    inc  sp
    jr   nz, label_3EF4E
    ld   b, b
    ld   a, a
    ld   b, a
    ld   e, b
    ld   l, b
    cpl
    ccf
    inc  de
    inc  de
    ld   [bc], a
    nop
    ldi  [hl], a
    nop
    ld   [bc], a
    nop
    add  a, d
    nop
    ld   a, [bc]
    nop
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction

label_3EEFD::
    nop
    nop
    nop
    rrca
    ld   [label_1019], sp
    inc  sp
    jr   nz, label_3EF6E
    ld   b, b
    ld   a, a
    ld   b, a
    ld    hl, sp+$88
    di
    sub  a, e
    di
    sub  a, e
    and  b
    ld   h, b
    ret  nc
    jr   nc, label_3EEFD
    jr   label_3EF0B
    inc  c
    ld   a, [$FF00+C]
    ld   a, d
    ld   b, [hl]
    add  hl, sp
    daa
    add  hl, sp
    daa
    add  a, c
    rst  $38
    pop  bc
    rst  $38
    pop  hl
    cp   a
    cp   [hl]
    rst  $18
    sbc  a, a
    db   $E8 ; add  sp, d
    adc  a, b
    rst  $38
    ld   c, b
    ld   a, a
    ccf
    ccf
    add  a, c
    ld   a, a
    add  a, c
    ld   a, a
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    dec  e
    dec  e
    di
    ld   de, label_12FF
    cp   $FC
    db   $FC ; Undefined instruction
    rst  $38
    nop
    cp   e
    rst  $38
    ld   d, h
    rst  $28
    xor  d
    ld   b, h
    ld   b, h
    nop
    nop
    nop
    nop
    nop

label_3EF4E::
    nop
    nop
    dec  bc

label_3EF51::
    ld   b, $03

label_3EF53::
    ld   b, $37
    ld   [bc], a
    rra
    ld   [bc], a
    rlca
    ld   a, [bc]
    dec  bc
    ld   b, $7F
    ld   b, $17
    ld   c, $F0
    ret  nz
    cp   b
    ret  nz
    db   $E4 ; Undefined instruction
    nop
    ld   h, b
    nop
    jr   nz, label_3EF6A

label_3EF6A::
    nop
    nop
    nop
    nop

label_3EF6E::
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    ld   a, [bc]
    inc  b
    dec  b
    ld   [bc], a
    dec  [hl]
    inc  bc
    rra
    inc  bc
    ld   c, $03
    db   $06
    ld   b, $5D
    ld   h, $67
    inc  e
    rst  $20
    inc  e
    adc  a, e
    ld   a, h
    ld   [hl], a
    ld    hl, sp+$BF
    ret  nz
    rst  $38
    nop
    cp   e
    ld   h, b
    cp   d
    ld   h, h
    and  $38
    rst  $20
    jr   c, label_3EF6A
    ld   a, $EE
    rra
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    nop
    cp   l
    jp   label_FF81
    add  a, c
    rst  $38
    jp   label_FFFF
    cp   l
    cp   l
    jp   label_FF81
    rst  $38
    rst  $38
    rst  $38
    nop

label_3EFB2::
    jp   label_813C
    ld   b, d
    jr   label_3EF51
    jr   label_3EF53
    add  a, c
    ld   b, d
    jp   label_FF3C
    rst  $38
    db   $DB
    rst  $20
    set  6, a
    db   $DB
    rst  $20
    db   $DB
    rst  $20
    db   $D3 ; Undefined instruction
    rst  $20
    ld   e, d
    rst  $20
    ld   a, [hl]

label_3EFCD::
    inc  h
    inc  a
    jr   label_3EFB2
    rst  $38
    ld   hl, $D33F
    rst  $18
    rst  $18
    db   $9D
    sbc  a, l
    sub  a, e
    or   c

label_3EFDB::
    cp   a
    ldi  [hl], a
    ld   a, $FC
    db   $FC ; Undefined instruction
    and  b
    ld   h, b
    ret  nc
    jr   nc, label_3EFCD
    jr   label_3EFDB
    inc  c
    ld   a, [$FF00+C]
    ld   h, [hl]
    ld   e, [hl]
    ld   a, h
    ld   a, h
    ret  z
    ret  z
    ld   b, h
    rst  $38
    rst  $38
    rst  $38
    xor  $11
    xor  $11
    xor  $11
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    and  d
    rst  $38
    and  d
    rst  $38
    and  d
    rst  $38
    and  d
    rst  $38

label_3F008::
    and  d
    rst  $38
    ld  [$FF00+C], a
    rst  $38
    sbc  a, [hl]
    rst  $38
    sub  a, a
    ei
    rst  $38
    inc  bc
    ld   b, $FA
    ld   a, [de]
    or   $07
    ld   a, [$F64B]
    rla
    ld   a, [$FF03]
    rst  $38
    rst  $38
    ei
    ld   b, $A6
    ld   e, e
    jp   nz, label_AA3F
    ld   e, a
    jp   nz, label_E23F
    rra
    add  a, d
    ld   a, a
    rst  $38
    rst  $38
    ret
    ccf
    add  hl, de
    rst  $38
    add  hl, bc
    rst  $38
    ld   c, c
    rst  $38
    ld   c, c
    rst  $38

label_3F03A::
    rrca
    rst  $38
    dec  [hl]
    rst  $38

label_3F03E::
    push af
    rst  8

label_3F040::
    sub  a, e
    db   $FC ; Undefined instruction

label_3F042::
    sbc  a, b
    rst  $38
    sub  a, b
    rst  $38
    sub  a, d
    rst  $38
    sub  a, d
    rst  $38
    ld   a, [$FFFF]
    xor  h
    rst  $38
    xor  a
    di
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, a
    rst  $38
    ld   a, c
    rst  $38
    jp   [hl]
    rst  $18
    jr   label_3F092
    rst  $10
    jr   nc, label_3F03A
    jr   nc, label_3F03E
    jr   nc, label_3F040
    jr   nc, label_3F042
    jr   nc, label_3F084
    ld    hl, sp+$FF
    rst  $38
    adc  a, [hl]
    nop
    pop  af
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    inc  sp
    call z, label_FFFF
    nop
    nop
    inc  bc
    inc  bc

label_3F084::
    inc  b
    rlca
    ld   [label_100F], sp
    rra
    jr   nz, label_3F0CB
    ld   [hl], c

label_3F08D::
    ld   c, [hl]
    ld   e, e
    ld   h, h
    nop
    nop

label_3F092::
    ld   [$FFE0], a
    sub  a, b
    ld   [hl], b
    adc  a, b
    ld   a, b
    add  a, h
    ld   a, h
    add  a, d
    ld   a, [hl]
    add  a, $3A
    ld   l, [hl]
    sub  a, d
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    rrca
    ld   a, [$FF10]
    xor  $20
    rst  $28
    ld   h, $DF
    ld   c, a
    rst  $18
    ld   c, a
    rst  $18
    ld   e, b
    cp   a
    sub  a, b
    rst  $38
    add  hl, sp
    and  $A6
    ld   a, b
    ld   h, b
    ld   a, h
    jr   c, label_3F08D
    ld   a, h
    call z, label_DDF4
    db   $FC ; Undefined instruction
    rst  $18
    ld   a, l
    rst  $38
    sbc  a, h
    ld   h, a
    ld   h, l
    ld   e, $06
    ld   a, $1C
    inc  hl
    ld   a, $33
    cpl
    cp   e
    ccf
    ei
    cp   [hl]
    rst  $38
    ld   a, [$FF0F]
    ld   [label_477], sp
    rst  $30
    ld   h, h
    ei
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [de]
    db   $FD ; Undefined instruction
    add  hl, bc
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ld   [$FFC0], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ld   [$FFC0], a
    rst  $38
    rst  $38
    sub  a, e
    db   $FC ; Undefined instruction
    sbc  a, b
    rst  $38
    sub  a, b
    rst  $38
    sub  a, d
    rst  $38
    sub  a, d
    rst  $38
    ld   a, [$FF7F]
    ld   a, $1F
    inc  bc

label_3F10F::
    ld   bc, label_3E0DF
    ld   h, l
    jp  c, label_FC43
    ld   d, l
    ld   a, [$F847]
    ld   b, a
    ld    hl, sp+$41
    cp   $FF
    rst  $38
    rst  $38
    ret  nz
    ld   h, b
    ld   e, a
    ld   e, b
    ld   l, a
    ld   [$FF5F], a
    jp   nc, label_E86F
    ld   e, a
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, l
    rst  $38
    ld   b, a
    cp   $7C
    ld    hl, sp+$C0
    add  a, b
    and  d
    rst  $38
    and  d
    rst  $38
    and  d
    rst  $38
    and  d
    rst  $38
    and  d
    rst  $38
    ld  [$FF00+C], a
    ld   a, a
    ld   a, $1F
    inc  bc
    ld   bc, label_3FC9
    add  hl, de
    rst  $38
    add  hl, bc
    rst  $38
    ld   c, c
    rst  $38
    ld   c, c
    rst  $38
    rrca
    cp   $7C
    ld    hl, sp+$C0
    add  a, b
    nop
    rst  $38
    rlca
    rst  $38
    inc  e
    rst  $38
    jr   nc, label_3F167
    ld   h, e
    db   $FC ; Undefined instruction
    ld   h, a
    ld    hl, sp+$C7
    ld    hl, sp+$C7
    ld    hl, sp+$00
    rst  $38
    ld   [rIE], a
    jr   c, label_3F175
    inc  c
    rst  $38
    add  a, $3F
    and  $1F
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra
    db   $DB
    ld   h, a
    call nz, label_CB7C
    ld   a, e
    bit  7, e
    ret
    ld   a, c
    ld   b, l
    ld   a, l
    ld   h, h
    inc  a
    ccf
    rra
    db   $DB
    and  $23
    ld   a, $D3
    sbc  a, $D3
    sbc  a, $93
    sbc  a, [hl]
    and  d
    cp   [hl]
    ld   h, $3C
    db   $FC ; Undefined instruction
    ld    hl, sp+$3F
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    inc  bc
    nop
    ld   bc, $BF00
    sub  a, b
    cp   a
    sub  a, d
    cp   a
    sub  a, d
    cp   a
    sub  a, d
    cp   a
    sub  a, a
    cp   a
    sbc  a, h
    rst  $38
    ld   a, b
    rst  $38

label_3F1BF::
    rst  $38
    and  $7E
    cp   $3C
    ld    hl, sp+$18
    ld   a, [$F84A]
    ret  z
    cp   $7C
    rst  $38
    ld   c, $FF
    rst  $38
    ld   h, a
    ld   a, [hl]
    ld   a, a
    inc  a
    rra
    jr   label_3F236
    ld   d, d
    rra
    inc  de
    ld   a, a
    ld   a, $FF
    ld   [hl], b
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    add  hl, bc
    db   $FD ; Undefined instruction
    ld   c, c
    db   $FD ; Undefined instruction
    ld   c, c
    db   $FD ; Undefined instruction
    ld   c, c
    db   $FD ; Undefined instruction
    jp   [hl]
    db   $FD ; Undefined instruction
    add  hl, sp
    rst  $38
    ld   e, $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rlca
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rlca

label_3F1FD::
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $F4 ; Undefined instruction
    rlca
    call nz, label_E807
    rrca
    pop  af
    ld   a, $C3

label_3F20D::
    ld   a, h
    rst  0
    ld   a, b
    db   $E3 ; Undefined instruction
    rst  $38
    inc  e
    rst  $38
    jr   label_3F1FD
    ld   sp, label_3CE
    db   $FC ; Undefined instruction
    jp   label_C13C
    ld   a, $80
    ld   a, a
    rst  0
    rst  $38
    jr   c, label_3F223
    jr   label_3F20D
    adc  a, h
    ld   [hl], e
    ret  nz
    ccf
    jp   label_833C
    ld   a, h
    ld   bc, $FFFE
    nop
    rst  $38
    ret  nz
    cpl
    ld   [rNR44], a
    ld   [rNR22], a
    ld   a, [$FF8F]
    ld   a, h
    jp   label_C33E
    ld   a, $87
    rst  $38
    jp   nz, label_C0FF
    ld   a, a
    and  b
    ccf
    ld   a, b
    ld   e, a
    ld   l, a
    ld   e, a
    jr   z, label_3F28D
    sbc  a, [hl]
    add  hl, de
    inc  e
    rst  $38
    inc  e
    rst  $38
    inc  e
    rst  $38
    ld   c, b
    rst  $38
    ld   [rIE], a
    ld   [hl], d
    rst  $38
    ld   a, [hl]
    rst  $18
    add  hl, sp
    rst  8
    jr   c, label_3F261
    jr   c, label_3F263
    jr   c, label_3F265
    db   $10 ; Undefined instruction
    inc  b
    rst  $38
    rra
    rst  $38
    ld   [hl], $FB
    db   $ED ; Undefined instruction
    di
    pop  hl
    rst  $38
    ld   b, e
    rst  $38
    inc  bc
    cp   $05
    db   $FC ; Undefined instruction
    ld   e, $FA
    ld   a, [$FF00+C]
    dec  e
    db   $FC ; Undefined instruction
    ld   a, c
    sbc  a, b
    rst  $38
    ld   h, b
    rst  $18
    ld   d, e
    rst  $38
    ld   d, h
    call c, label_EB6F
    ccf
    db   $FD ; Undefined instruction
    inc  de
    ld   sp, hl

label_3F28D::
    daa
    db   $E3 ; Undefined instruction
    ld   a, $FF
    inc  a
    ei
    add  a, $23
    rst  $38
    ld   a, l
    rst  $38
    ld   sp, hl
    adc  a, a
    or   $26
    reti
    ld   d, b
    rst  $38
    ld   d, b
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3F2C0
    jr   label_3F2C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3F2D0
    jr   label_3F2D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3F2C0::
    nop
    nop

label_3F2C2::
    ld   b, b
    nop
    nop
    inc  a
    inc  h
    ld   b, d
    ld   a, [hl]
    add  a, c
    ld   h, [hl]
    sbc  a, c
    ld   e, e

label_3F2CD::
    and  h
    ld   l, c
    sub  a, [hl]

label_3F2D0::
    nop
    inc  c

label_3F2D2::
    inc  b
    ld   [de], a
    ld   [$0014], sp
    inc  d
    nop
    inc  d
    nop
    ld   [$8000], sp
    nop
    cp   b
    jr   c, label_3F2E1
    jr   c, label_3F2E3
    jr   c, label_3F2E5
    db   $10 ; Undefined instruction
    nop
    rst  $38
    ld   hl, label_3C3FE
    db   $FC ; Undefined instruction
    ld   b, a
    ld    hl, sp+$87
    rst  $38

label_3F2F2::
    ld   b, e
    rst  $38
    ld   [$FF7F], a
    or   b
    ccf
    ld   [hl], b

label_3F2F9::
    ld   e, a
    ld   [hl], c
    ld   e, [hl]
    ld   h, e
    ld   a, h
    rst  0
    ld   a, b
    add  a, a
    ld    hl, sp+$96
    ld   sp, hl
    or   b
    rst  $38
    and  b
    rst  $38
    and  b

label_3F309::
    rst  $38
    add  a, e
    rst  $38
    add  a, a
    rst  $38
    add  a, a
    rst  $38
    jr   label_3F2F9
    add  hl, sp
    add  a, $33
    call z, label_FC03
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_CFE
    rst  $38
    jr   label_3F309
    sbc  a, h
    ld   h, e
    call z, label_C033
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    add  a, b
    ld   a, a
    jr   nc, label_3F32F
    pop  bc
    ccf
    add  hl, bc
    rst  $38
    dec  c
    rst  $38
    dec  b
    rst  $38
    dec  b
    rst  $38
    pop  bc
    rst  $38
    pop  hl
    rst  $38
    pop  hl
    rst  $38
    xor  h
    inc  sp
    ld   a, c
    ld   b, a
    ld   [hl], a
    ld   c, a
    ld   l, h
    ld   e, a
    ccf
    jr   c, label_3F2CD
    nop
    add  a, $00
    rst  $38
    nop
    ld   a, e
    add  a, h
    di
    adc  a, h
    rst  $28
    sbc  a, h
    db   $FD ; Undefined instruction
    sbc  a, [hl]
    di
    sbc  a, [hl]
    di
    sub  a, d
    ld   h, c
    ld   h, c
    inc  c
    nop
    rst  $18
    ld   hl, label_33ED
    cp   [hl]
    ld   [hl], e
    sbc  a, $73
    rst  $18
    ld   [hl], d
    db   $EC ; Undefined instruction
    ld   c, h
    sub  a, c
    add  a, b
    ccf
    nop
    ld   [hl], l
    adc  a, h
    cp   [hl]
    jp   nz, label_F2CE
    ld   [hl], $FA
    db   $FC ; Undefined instruction
    inc  e
    pop  bc
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $28
    inc  a
    ei
    ld   [hl], $DA
    ld   h, [hl]
    ld   b, d
    ld   a, [hl]
    ld   b, [hl]
    ld   a, [hl]
    ld   a, $3C
    adc  a, l
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    ld   a, b
    or   a
    call z, label_FEB3

label_3F396::
    db   $DB
    adc  a, $3B
    ld   c, $EE
    ld   c, $F1
    nop

label_3F39E::
    rst  $38
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3F3C0
    jr   label_3F3C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3F3D0
    jr   label_3F3D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_3F3C0::
    add  hl, sp
    ld   b, [hl]

label_3F3C2::
    ld   bc, $013A
    ld   [bc], a
    ld   bc, label_3C162
    sub  a, d
    jr   nz, label_3F39E
    nop
    ld   d, d
    nop
    ld   h, c

label_3F3D0::
    jr   z, label_3F396

label_3F3D2::
    ld   l, b
    sub  a, h
    ret  c
    inc  h
    add  a, b
    ld   a, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    ld   bc, label_1C80
    rst  $38
    inc  e
    rst  $38
    ld   [$00FF], sp
    rst  $38
    db   $10 ; Undefined instruction
    adc  a, h
    ld   a, a
    jp   nz, label_E23F
    rra
    pop  hl
    rst  $38
    jp   label_23FF
    cp   $25
    db   $FC ; Undefined instruction
    ld   e, $FA
    adc  a, [hl]
    ld   a, [hl]
    jp   nz, label_E33E
    ld   e, $E1
    rra
    ld   a, a
    add  a, d
    ld   a, $FC
    ld   a, a
    push hl
    ld   h, a
    push bc
    db   $C6
    add  a, $FE
    rst  0
    db   $E7
    rst  $20
    rst  $38
    rst  $38
    ccf
    rra
    rst  $18
    ld   [$8EF9], sp
    ld    hl, sp+$8F
    db   $EB ; Undefined instruction
    rra
    ld   de, $E5FF
    rst  $38

label_3F420::
    rst  $38
    ld    hl, sp+$CE
    adc  a, l
    db   $FC ; Undefined instruction
    rst  0
    cp   $67
    ld   a, [hl]
    cp   a
    ccf
    rst  0
    add  a, c
    rst  $38
    cp   h
    rst  $38
    rst  $38
    nop
    rra
    ld   [$FF1F], a
    rst  $38
    ccf
    pop  af
    ld   [hl], c
    pop  hl
    db   $ED ; Undefined instruction
    jp   label_83DF
    ld   l, e
    rst  $10
    ld   b, $FC
    db   $F4 ; Undefined instruction
    inc  c
    db   $E8 ; add  sp, d
    inc  e

label_3F446::
    ld   [label_8FE], sp
    db   $FD ; Undefined instruction
    ld   a, [bc]
    db   $FC ; Undefined instruction
    dec  de
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ld   a, [bc]
    ld   b, $16

label_3F453::
    inc  c
    inc  [hl]
    inc  c
    ld   l, l
    jr   label_3F446
    jr   label_3F472
    ld    hl, sp+$13
    inc  a
    ret  c
    ccf
    ld   d, b
    ld   h, b
    ld   l, b
    jr   nc, label_3F491
    jr   nc, label_3F41D
    jr   label_3F420
    jr   label_3F453
    rra
    ret  z
    inc  a
    dec  de
    db   $FC ; Undefined instruction
    ld   h, b
    ccf

label_3F472::
    cpl
    jr   nc, label_3F48C
    jr   c, label_3F487
    ld   a, a
    db   $10 ; Undefined instruction
    ld   d, b
    ccf
    ret  c
    ccf
    rst  $18
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  c
    rst  $38
    nop

label_3F487::
    rst  $38

label_3F488::
    ld   b, b
    rst  $38
    rlca
    rst  $38

label_3F48C::
    dec  de
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    jr   nc, label_3F490

label_3F491::
    rst  $38
    rst  $38
    rst  $38
    inc  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    rst  $18
    jr   c, label_3F4B6
    inc  c
    inc  a
    rst  $38
    ld   b, e
    jp   label_81F9
    db   $FC ; Undefined instruction
    ld    hl, sp+$46
    db   $FC ; Undefined instruction
    ld   e, e
    and  $2D
    di
    cp   $FD
    ld   [bc], a
    rst  $38
    inc  b
    rst  $38
    adc  a, [hl]
    rst  $38

label_3F4B6::
    db   $F9
    ld   sp, hl
    ld   a, [hl]
    ld   h, h
    ld   h, [hl]
    ld   b, d
    jp   nz, label_C282
    add  a, d
    push bc
    inc  bc
    jp   nz, label_3E001
    add  a, b
    jr   c, label_3F488
    or   h
    ret  c
    cp   d
    call c, label_CCAE
    or   [hl]
    call nz, label_C0A3
    ld   b, e
    add  a, b
    ld   b, $01
    inc  e
    inc  bc
    dec  l
    dec  de
    ld   e, l
    dec  sp
    ld   [hl], l
    inc  sp
    ld   l, l
    inc  hl
    ld   b, b
    rst  $38
    jr   nz, label_3F4E3
    ld   [hl], c
    rst  $38
    cp   e
    sbc  a, a
    ld   a, [hl]
    ld   h, $66
    ld   b, d
    ld   e, e
    ld   e, c
    ld   e, e
    ld   e, c
    inc  a
    rst  $38
    jp   nz, label_9FC3
    add  a, c
    ccf
    rra
    ld   h, d
    ccf
    jp  c, label_B467
    rst  8
    ld   a, a

label_3F4FF::
    cp   a
    xor  $F3
    rst  $30
    sbc  a, c
    ei
    adc  a, h
    cp   [hl]
    rst  0
    rst  $18
    pop  hl
    ld   l, a
    ld   a, [$FFF3]
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    dec  b
    ei
    pop  hl
    rst  $38
    ld   sp, $D91F
    rrca
    ld   sp, hl
    rst  8
    ei
    rrca
    rst  $28
    rra
    rst  $38
    rst  $38
    db   $E4 ; Undefined instruction
    rst  0
    call c, label_F487
    adc  a, a
    db   $EC ; Undefined instruction
    sbc  a, a

label_3F528::
    ld   sp, hl
    rst  $38
    jp   label_7FE
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    ld   l, [hl]
    rst  0
    ld   a, h
    rst  0
    ld   a, [hl]
    jp   label_E5DB
    db   $EB ; Undefined instruction
    pop  af
    pop  af
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    ei
    inc  e
    db   $DB
    inc  a
    sbc  a, e
    ld   a, h
    add  hl, bc
    cp   $0C
    rst  $38
    ld   b, $FF
    inc  bc
    rst  $38

label_3F54E::
    rst  $38
    rst  $38
    rst  $10
    ccf
    ret  nc
    jr   c, label_3F528
    inc  a
    pop  af
    ld   e, $E8
    rra
    ld   h, h
    sbc  a, a
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    db   $EB ; Undefined instruction
    db   $FC ; Undefined instruction
    dec  bc
    inc  e
    srl  h
    adc  a, a
    ld   a, b
    rla
    ld    hl, sp+$26
    ld   sp, hl
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    jr   c, label_3F54E
    inc  a
    reti
    ld   a, $90
    ld   a, a
    jr   nc, label_3F579
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    ret  nc
    ld   [rUNKN3], a
    jp   label_3C3F3
    ld   [hl], c
    ld   b, c
    ld   e, c
    ld   h, c
    xor  h
    ld   [hl], b
    rla
    ld    hl, sp+$FF
    rst  $38
    dec  bc
    rlca
    adc  a, $C3
    rst  8
    jp   nz, label_828E
    sbc  a, d
    add  a, [hl]
    dec  [hl]
    ld   c, $E8
    rra
    rst  $38
    rst  $38
    jp   label_F9C2
    add  a, c
    db   $FC ; Undefined instruction
    ld    hl, sp+$46
    db   $FC ; Undefined instruction
    ld   e, e
    and  $5D
    db   $E3 ; Undefined instruction
    cpl
    di
    db   $FD ; Undefined instruction
    cp   $F6
    or   d
    cp   $B2
    cp   d
    add  a, $85
    db   $FC ; Undefined instruction
    adc  a, $79
    ld   a, l
    di
    ld   a, [$FF00+C]
    db   $ED ; Undefined instruction
    rra
    cp   [hl]
    call nz, label_CFB4
    xor  a
    rst  $18
    sbc  a, h
    ld   a, [$FFB0]
    ld   [$FF60], a
    ret  nz
    rst  8
    add  a, b
    cp   b
    rlca
    ld   a, l
    inc  hl
    dec  l
    di
    push af
    ei
    add  hl, sp
    rrca
    dec  c
    rlca
    ld   b, $03
    di
    ld   bc, $E01D
    ld   h, a
    ld   b, c
    ld   e, a
    ld   h, c
    ld   c, l
    ld   [hl], e
    and  c
    ccf
    ld   [hl], e
    sbc  a, [hl]
    cp   [hl]
    rst  8
    ld   c, a
    rst  $38
    or   a
    ld    hl, sp+$C3
    ld   b, e
    sbc  a, a
    add  a, c
    ccf
    rra
    ld   h, d
    ccf
    jp  c, label_BA67
    rst  0
    db   $F4 ; Undefined instruction
    rst  8
    cp   a

label_3F5FF::
    ld   a, a
    cp   $F1
    adc  a, a
    rst  8
    ld   d, l
    db   $E4 ; Undefined instruction
    inc  hl
    db   $FC ; Undefined instruction
    dec  h
    di
    ld   l, a
    di
    jp   nz, label_CACF
    add  a, a
    db   $FD ; Undefined instruction
    cp   $4E
    sub  a, e
    ld   l, c
    sub  a, e
    pop  af
    db   $FD ; Undefined instruction
    db   $DB
    cp   l
    adc  a, a
    db   $77
    ld   [hl], a
    call label_FFC7
    or   d
    pop  bc
    adc  a, l
    di
    add  a, e
    rst  8
    xor  e
    rst  0
    or   c
    rst  8
    add  a, b
    pop  af
    ret  c
    pop  hl
    adc  a, $F1
    sbc  a, l
    db   $E3 ; Undefined instruction
    pop  bc
    rst  $38
    xor  e
    rst  0
    call label_BD83
    jp   label_E7D9
    inc  hl
    rst  $38
    ld   e, $3F
    nop
    nop

label_3F642::
    adc  a, b
    nop

label_3F644::
    push de
    ld   [$887F], sp
    ld   [$FFDD], a
    rst  $38

label_3F64C::
    ld   [hl], b
    rst  $38
    nop
    rst  $38
    jr   c, label_3F642
    jr   nz, label_3F644
    ld   [hl], $E0
    inc  a
    ld   [$FF30], a
    db   $E8 ; add  sp, d
    jr   z, label_3F64C
    ccf
    ld   a, [$FF34]
    ld    hl, sp+$00
    nop
    jr   label_3F664

label_3F664::
    jr   z, label_3F676
    ld   b, b
    jr   nc, label_3F5FF
    ld   h, b
    call c, label_3C8E0
    ld   a, [$FF20]
    ld   a, [$FF14]
    rrca
    ld   e, $07
    dec  sp
    rlca

label_3F676::
    ld   c, a
    nop
    inc  c
    nop
    ld   [$0000], sp
    nop
    nop
    nop
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, $F0FE
    rst  $38
    jr   label_3F687
    inc  l
    rra
    ld   d, $0F
    db   $76 ; Halt
    rrca
    ld   e, $07
    ret  nz
    ccf
    add  a, b
    ld   a, a
    rlca
    rst  $38
    inc  c
    rst  $38
    ld   a, [de]
    db   $FC ; Undefined instruction
    inc  [hl]
    ld    hl, sp+$37
    ld    hl, sp+$3C
    ld   a, [$FFFF]
    ld   h, b
    rst  $18
    ld   d, e
    rst  $38
    ld   d, h
    call c, label_EB6F
    ccf
    db   $FD ; Undefined instruction
    inc  de
    ld   sp, hl
    daa
    db   $E3 ; Undefined instruction
    ld   a, $FF
    inc  a
    ei
    add  a, $23
    rst  $38
    ld   a, l
    rst  $38
    ld   sp, hl
    adc  a, a
    or   $26
    reti
    ld   d, b
    rst  $38
    ld   d, b
    ld   a, [$FF0F]
    ret  nz
    ccf
    add  a, b
    ld   a, a
    jr   nz, label_3F6E7
    ret  nz
    rlca
    nop
    ld   a, a
    nop
    ld   a, a
    add  a, b
    ccf
    ld   a, a
    add  a, b
    rra
    ld   [rIF], a
    ld   a, [$FF07]
    ld    hl, sp+$03
    ld    hl, sp+$03
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   [$FFFE], a
    rst  $38
    push bc
    inc  bc
    sbc  a, d
    pop  hl
    push hl

label_3F6E7::
    ld    hl, sp+$FB
    db   $FC ; Undefined instruction
    db   $ED ; Undefined instruction
    adc  a, $B7
    adc  a, $87
    cp   $7F
    rst  $38
    and  e
    ret  nz
    ld   e, c
    add  a, a
    and  a
    rra
    rst  $18
    ccf
    or   a
    ld   [hl], e
    db   $ED ; Undefined instruction
    ld   [hl], e
    pop  hl
    ld   a, a
    db   $D3 ; Undefined instruction
    adc  a, a
    pop  hl
    sub  a, e
    add  a, d
    pop  hl
    call c, label_3E3E2
    db   $FC ; Undefined instruction
    add  hl, sp
    cp   $76
    rst  $28
    di
    pop  bc
    add  a, [hl]
    rst  8
    ld   h, h
    sbc  a, a
    call z, label_3F8FF
    ccf
    jr   label_3F759
    call z, label_AE3F
    ld   b, e
    dec  [hl]
    jp   label_3FFE0
    ld   a, [hl]
    rst  $38
    ld   d, e
    rst  $20
    xor  l
    jp   label_C7B9
    or   c
    rst  8
    add  a, c
    rst  $38
    jp   label_EFFF
    rra
    ld   b, h
    cp   a
    ld   b, $E7
    xor  d
    rst  0
    cp   d
    rst  0
    add  a, d
    rst  $38
    sbc  a, e
    rst  $20
    rst  0
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   d, h
    rst  $28
    xor  d
    ld   b, h
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    inc  d
    rrca

label_3F752::
    inc  b
    rrca
    ld   l, h
    rlca
    inc  a
    rlca
    inc  c

label_3F759::
    rla
    inc  d
    rrca
    db   $FC ; Undefined instruction
    rrca
    inc  l
    rra
    jr   z, label_3F752
    ld   l, b
    ld   a, [$FFDC]
    ld   [$FFF2], a
    nop
    jr   nc, label_3F76A

label_3F76A::
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_3F774

label_3F774::
    inc  d
    ld   [label_40A], sp
    ld   l, e
    ld   b, $3F
    rlca
    ld   e, $07
    inc  b
    rrca
    ld   e, b
    rrca
    ld   l, b
    rra
    ld   c, b
    ccf
    sbc  a, b
    ld   a, a
    jr   nc, label_3F789
    ld   [rIE], a
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    ld   d, $F8
    ld   d, $F8
    inc  de
    db   $FC ; Undefined instruction
    jr   label_3F797
    inc  c
    rst  $38
    rlca
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ccf
    rst  $28
    inc  a
    ei
    ld   [hl], $DA
    ld   h, [hl]
    ld   b, d
    ld   a, [hl]
    ld   b, [hl]
    ld   a, [hl]
    ld   a, $3C
    adc  a, l
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    ld   a, b
    or   a
    call z, label_FEB3
    db   $DB
    adc  a, $3B
    ld   c, $EE
    ld   c, $F1
    nop
    rst  $38
    nop
    ret  nz
    rrca
    ld   a, [$FF00]
    rst  $38
    nop
    rst  8
    nop
    rst  $38
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    add  hl, de
    add  a, b
    ld   a, a
    nop
    add  a, a
    ld   a, b
    inc  bc
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF01]
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, b
    add  a, a
    nop
    rst  8
    cp   $7F
    cp   $BE
    ld   a, a
    ld   a, h
    sbc  a, a
    scf
    ld    hl, sp+$58
    ld   [$FFA7], a
    ret  nz
    ld   e, h
    add  a, e
    di
    ld   a, a
    cp   $7F
    ld   a, l
    cp   $3E
    ld   sp, hl
    db   $EC ; Undefined instruction
    rra
    ld   a, [de]
    rlca
    push hl
    inc  bc
    db   $3A ; ldd  a, [hl]
    pop  bc
    jr   c, label_3F83A
    ld   b, [hl]
    ld   b, [hl]
    sbc  a, c
    add  a, c
    ld   a, [$FF88]
    ld   a, a
    ld   a, b
    add  hl, bc
    ld   c, $05
    ld   b, $73
    ld   [hl], e
    ld   bc, label_201
    ld   [bc], a
    ld   b, $04
    add  a, $C4
    ccf
    inc  a
    ld   [hl], l
    ld   b, $CA
    ld   h, l
    and  l
    ret  z
    add  a, b
    add  a, b
    ld   b, [hl]
    ld   b, [hl]
    dec  h
    dec  h
    ld   h, [hl]
    inc  h
    ld   a, [$FF00+C]
    rst  $18
    inc  a
    inc  l
    ret  nc
    push de
    ld   a, [bc]
    inc  a
    inc  a
    ld   h, d
    ld   b, d
    adc  a, l
    add  a, c
    sbc  a, $AE
    jr   nc, label_3F84A

label_3F83A::
    or   b
    db   $10 ; Undefined instruction
    ld   a, [$FF20]
    ld   h, b
    ld   bc, $0101
    ld   bc, label_1D1F
    scf
    inc  hl
    ld   a, $21

label_3F84A::
    cpl
    jr   nc, label_3F85D
    rra
    ld   a, [de]
    rrca
    cp   a
    ld   e, h
    cp   a
    ld   e, [hl]
    cp   a
    ld   e, a
    xor  a
    ld   c, a

label_3F858::
    di
    inc  bc
    db   $31
    ld   sp, $9C7F
    cp   a
    rra
    db   $FD ; Undefined instruction
    ld   a, $FF
    ccf
    rst  $38
    ld   a, h
    rst  $38
    ld   a, h
    rst  $20
    ld   h, b
    sbc  a, $41
    rst  $38
    inc  c
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    add  hl, sp
    rst  0
    rst  0
    add  a, b
    add  a, b
    ld    hl, sp+$F8
    call z, label_3E484
    sbc  a, h
    adc  a, b
    ld   a, b
    ret  c
    ld   a, [$FFF8]
    ld    hl, sp+$FC
    ld   b, h
    cp   a
    xor  a
    sub  a, c
    sub  a, c
    rst  0
    add  a, [hl]
    db   $FC ; Undefined instruction
    sbc  a, b
    or   $66
    cp   $2E
    ccf
    ccf
    ld   a, a
    ld   b, h
    ld   a, [label_12EA]
    ld   [de], a
    add  a, $C2
    ld   a, [hl]
    ldd  [hl], a
    rst  $18
    call z, label_E8FF
    nop
    nop
    inc  a
    inc  a
    ld   h, [hl]
    ld   b, d
    rst  $10
    add  a, c
    jp   z, label_A681
    reti
    jp  c, label_E7BD
    and  l
    nop
    nop
    ld   a, b
    ld   a, b
    call c, label_8E84
    ld   [bc], a
    sub  a, $02
    ld   c, d
    ld   [hl], $B6
    ld   a, d
    adc  a, $4A
    nop
    nop
    ld   b, b
    nop
    nop
    inc  a
    inc  h
    ld   b, d
    ld   a, [hl]
    add  a, c
    ld   h, [hl]
    sbc  a, c
    ld   e, e
    and  h
    ld   l, c
    sub  a, [hl]
    nop
    inc  c
    inc  b
    ld   [de], a
    ld   [$0014], sp
    inc  d
    nop
    inc  d
    nop
    ld   [$8000], sp
    nop
    cp   b
    rrca
    rrca
    db   $10 ; Undefined instruction
    jr   nz, label_3F906
    cpl
    jr   nz, label_3F928
    daa
    inc  a
    inc  l
    ccf
    cpl
    ld   a, c
    ld   l, c
    ld   a, [$FFF0]
    ld   [label_408], sp
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    inc  a
    inc  [hl]
    db   $FC ; Undefined instruction
    db   $F4 ; Undefined instruction
    sbc  a, [hl]

label_3F8FF::
    sub  a, [hl]
    adc  a, b
    adc  a, b
    and  h
    add  a, h
    ld   [hl], e
    ld   b, e

label_3F906::
    db   $3A ; ldd  a, [hl]
    jr   nz, label_3F938
    jr   nc, label_3F978
    ld   d, d
    rst  $38
    sbc  a, h
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    and  h
    ret  z
    cp   d
    db   $E4 ; Undefined instruction
    ret  nz
    jp   label_39
    inc  e
    ld   bc, label_9F6
    ld   [hl], l
    sbc  a, d
    rst  $38
    db   $EC ; Undefined instruction
    ld   [de], a
    add  hl, bc
    inc  hl
    ld   de, label_21C3
    dec  de
    dec  b

label_3F928::
    ld   de, label_2608
    db   $10 ; Undefined instruction
    inc  d
    db   $EB ; Undefined instruction
    inc  [hl]
    and  b
    ld   h, b
    ld   b, b
    ret  nz
    adc  a, h
    adc  a, h
    inc  d
    inc  d

label_3F938::
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   e, h
    inc  c
    ld   a, [$AD02]
    ld   d, c
    ld   d, $0C
    jr   label_3F94C
    inc  e
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_3F988
    inc  hl

label_3F94C::
    ccf
    ld   a, $00
    nop
    daa
    inc  bc
    db   $FD ; Undefined instruction
    ld   bc, label_10EC
    sub  a, [hl]
    ld   a, b
    ld   [hl], a
    ld    hl, sp+$8B
    db   $FC ; Undefined instruction
    ei
    inc  c
    rlca
    rlca
    rst  0
    ret  nz
    cp   a
    add  a, b
    ld   h, e
    inc  e
    db   $DB
    inc  a
    rst  $20
    ccf
    cp   a
    ld   h, b
    ld   h, b
    ret  nz
    ret  nz
    add  a, b
    db   $E8 ; add  sp, d
    jr   nc, label_3F98B
    db   $10 ; Undefined instruction
    ld   [label_4C4], sp

label_3F978::
    ld   b, h
    add  a, h
    db   $FC ; Undefined instruction
    call nz, label_3C7C
    nop
    nop
    db   $FC ; Undefined instruction
    inc  l
    or   c
    ld   h, b
    db   $FC ; Undefined instruction
    push hl
    sbc  a, h
    sbc  a, l

label_3F988::
    ld   b, h
    push bc
    cp   h

label_3F98B::
    sbc  a, h
    ld   l, l
    push af
    ei
    rlca
    ld   a, a
    ld   l, b
    dec  de
    inc  c
    ld   a, h
    ld   c, a

label_3F996::
    ld   [hl], b
    ld   [hl], d
    ld   b, h
    ld   b, [hl]
    ld   a, e
    ld   [hl], d
    ld   l, l
    ld   e, [hl]

label_3F99E::
    cp   a
    ret  nz
    rst  $20
    and  l
    cp   [hl]
    db   $FD ; Undefined instruction
    rst  $38
    and  l
    rst  $20
    cp   l
    cp   $BD
    rst  $38
    and  l
    and  $E7
    nop
    nop
    adc  a, $4A
    cp   $7A
    cp   $4A
    ld   c, d
    cp   $FE
    ld   a, d
    adc  a, $7A
    add  a, $CE
    nop
    nop
    add  hl, sp
    ld   b, [hl]
    ld   bc, $013A
    ld   [bc], a
    ld   bc, label_3C162
    sub  a, d
    jr   nz, label_3F99E
    nop
    ld   d, d
    nop
    ld   h, c
    jr   z, label_3F996
    ld   l, b
    sub  a, h
    ret  c
    inc  h
    add  a, b
    ld   a, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    ld   bc, $BF80
    xor  a
    cp   d
    xor  d
    cp   a
    xor  a
    cp   a
    and  b
    cp   a
    cp   a
    add  a, b
    add  a, b
    rst  $38
    sbc  a, b
    ld   h, a
    ld   h, a
    db   $FD ; Undefined instruction
    push af
    ld   e, l
    ld   d, l
    db   $FD ; Undefined instruction
    push af
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   bc, rSB
    add  hl, de
    and  $E6
    rst  $38
    ld   a, [$FF9F]
    sbc  a, b
    db   $EC ; Undefined instruction
    ld   c, h
    rst  $20
    inc  h
    push hl
    inc  h
    and  $24
    rst  $28
    inc  h
    rst  8
    ld   c, c
    rst  $38
    nop
    add  a, a
    nop
    ld   h, b
    nop
    rst  $38
    nop
    rst  $38
    add  hl, sp
    ld   a, [hl]
    ld   b, a
    adc  a, h
    di
    and  $F9
    rst  $38
    nop
    rst  $38
    rrca
    rst  $38
    jr   nc, label_3FA26
    ret  nz
    ld    hl, sp+$07
    ret  nz
    ccf
    nop
    rst  $38
    rrca
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFE]
    inc  c
    rst  $38
    inc  bc
    rra
    ld   [$FF03], a
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ld   a, [$FFFF]
    rst  0
    nop
    add  a, e
    nop
    jr   c, label_3FA46

label_3FA46::
    rst  $38
    nop
    rst  $38
    sbc  a, h
    ld   a, a
    ld  [$FF00+C], a
    ld   sp, label_3E7CF
    sbc  a, a
    rst  $38
    rrca
    ld   sp, hl
    add  hl, de
    db   $76 ; Halt
    ldd  [hl], a
    db   $E4 ; Undefined instruction
    inc  h
    db   $E4 ; Undefined instruction
    inc  h
    inc  h
    inc  h
    db   $F4 ; Undefined instruction
    inc  h
    ld   a, [$FF00+C]
    ld  [$FF00+C], a
    ld   b, e
    pop  af
    ld   hl, label_10F9
    cp   $38
    add  a, $44
    add  a, a
    add  a, h
    add  a, e
    add  a, d
    add  a, c
    add  a, c
    db   $10 ; Undefined instruction
    pop  af
    ld   a, [$FF61]
    ld   h, b
    ld   h, c
    ld   hl, label_21E1
    db   $E3 ; Undefined instruction
    ld   hl, label_3C1C3
    add  a, e
    add  a, e
    ld   [$8F0F], sp
    rrca
    add  a, [hl]
    ld   b, $86
    add  a, h
    add  a, a
    add  a, h
    rst  0
    add  a, h
    jp   label_C182
    pop  bc

label_3FA90::
    ld   b, a
    jp   nz, label_848F
    sbc  a, a
    ld   [label_1C7F], sp
    ld   h, e
    ldi  [hl], a
    pop  hl
    ld   hl, label_3C1C1
    add  a, c
    add  a, c
    rst  $38
    ld   e, $E1
    ld   hl, label_3C3C0
    ret  nz
    ld   b, h
    ret  nz
    ld   c, b
    ld   [$FFA9], a
    ld   a, [$FF98]
    db   $FC ; Undefined instruction
    sbc  a, h
    rst  $38
    ld   a, b
    sub  a, a
    add  a, h
    inc  bc
    ld   [bc], a
    inc  bc
    ld  [$FF00+C], a
    rlca
    ld   d, $0B
    ld   c, $09
    rrca
    add  hl, sp
    ccf
    rst  $38
    add  a, a
    rst  $38
    ld    hl, sp+$FF
    add  a, b
    ld    hl, sp+$C7
    rst  0
    ld   a, b
    rst  $38
    ld   b, e
    rst  $38
    cp   $FF
    add  a, b
    rst  $38
    pop  hl
    rst  $38
    rra
    rst  $38
    ld   bc, $8779
    rst  8
    ld   sp, rIE
    rst  $38
    ld   [bc], a
    db   $E3 ; Undefined instruction
    ld   e, $DB
    jr   label_3FA90
    inc  l
    ld   c, d
    ld   c, [hl]
    adc  a, c
    adc  a, a
    sbc  a, c
    sbc  a, a
    cp   l
    and  a
    ld   a, [hl]
    ld   b, d
    cp   l
    inc  a
    ld   [bc], a
    nop
    ldi  [hl], a
    nop
    ld   [bc], a
    nop
    add  a, d
    nop
    ld   a, [bc]
    nop
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ld   e, e
    ld   c, d
    db   $D3 ; Undefined instruction
    sub  a, d
    rst  $10

label_3FB05::
    sub  a, h
    rst  $10
    sub  a, h
    rst  $10
    sub  a, h
    rst  $18
    sbc  a, h
    call label_C48E
    ld   b, a

label_3FB10::
    sub  a, d
    dec  e
    add  hl, bc
    rrca
    ld   a, [bc]
    ld   c, $0C

label_3FB17::
    inc  c
    inc  c
    inc  c
    cp   b
    jr   c, label_3FB05

label_3FB1D::
    jr   z, label_3FB17
    jr   c, label_3FB91
    ld   a, [$FF80]
    add  a, b
    nop
    nop
    rrca
    nop
    ccf
    rlca
    ld   a, a
    jr   label_3FB1D
    jr   nz, label_3FB10
    ld   h, c
    ld   c, $0F
    ld   bc, $0001
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    ld   [$FFFE], a
    jr   label_3FB4C
    inc  b
    add  a, a
    add  a, [hl]
    ld   c, c
    cp   b
    sub  a, b
    ld   a, [$FF50]
    ld   [hl], b
    jr   nc, label_3FB78
    jr   nc, label_3FB7A
    dec  e
    inc  e

label_3FB4C::
    rla
    inc  d
    rra
    inc  e
    jp  c, label_CB52
    ld   c, c
    db   $EB ; Undefined instruction
    add  hl, hl
    db   $EB ; Undefined instruction
    add  hl, hl
    db   $EB ; Undefined instruction
    add  hl, hl
    ei
    add  hl, sp
    or   e
    ld   [hl], c
    inc  hl
    ld  [$FF00+C], a
    cp   b
    and  b
    call c, label_3EE90
    ld   c, b
    ld   e, e
    ld   l, h
    add  hl, sp
    ld   a, $84
    rlca
    di
    inc  bc
    ld    hl, sp+$00
    inc  bc
    inc  bc
    rlca
    inc  bc
    rrca
    inc  bc
    ei
    rlca

label_3FB78::
    di
    rrca

label_3FB7A::
    inc  b
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    rlca
    nop
    ret  nz
    ret  nz
    ld   [$FFC0], a
    ld   a, [$FFC0]
    rst  $18
    ld   [$FFCF], a
    ld   a, [$FF20]
    ccf
    rra
    rra
    ret  nz
    nop
    dec  e

label_3FB91::
    dec  b
    dec  sp
    add  hl, bc
    db   $76 ; Halt
    ld   [de], a
    jp  c, label_9C36
    ld   a, h
    ld   hl, $CFE0
    ret  nz
    rra
    nop
    rst  $38
    sub  a, a
    rst  $38
    or   d
    rst  $38
    jp   nc, label_8AFF
    ld   a, a
    ld   b, h
    ccf
    inc  h
    sbc  a, a
    rra
    ld   [rJOYP], a
    jp   [hl]
    rst  $38
    ret
    ld   a, a
    ret
    ld   a, a
    db   $77
    ld   [hl], a
    cp   $22
    db   $FC ; Undefined instruction
    inc  l
    ld   sp, hl
    ld    hl, sp+$03
    nop
    add  a, a
    ld    hl, sp+$FF
    pop  bc
    cp   $7F
    rst  $38
    ld   b, c
    adc  a, a
    ld   a, [$FFFC]
    add  a, e
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    jp   label_1FF
    rst  $38
    pop  af
    rst  $28
    ld   e, $FF
    pop  af
    rst  $38
    ld   bc, $8F73
    rst  $38
    ld   bc, rIE
    rst  $20
    nop
    db   $DB
    jr   label_3FB8A
    inc  h
    ld   c, [hl]
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   e, [hl]
    ld   d, d
    cp   l
    inc  a
    jp   label_C300
    rst  $38
    add  a, c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    jp   label_81C3
    ld   a, [hl]
    ld   a, [hl]
    add  a, c
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    cp   $0C
    ld    hl, sp+$10
    ld   a, [$FF20]
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    rst  $38
    rrca
    rst  $38
    ld   [hl], b
    rst  $18
    add  a, b
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   a, [$FFFF]
    rrca
    ld   sp, hl
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ld   a, a
    jr   nc, label_3FC58
    ld   [label_407], sp
    inc  bc
    ld   [bc], a
    ld   bc, $C001
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103

label_3FC58::
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    rst  $38
    nop
    ei
    rlca
    db   $EC ; Undefined instruction
    rra
    ret  nc
    ccf
    db   $E3 ; Undefined instruction
    inc  a
    and  a
    ld   a, b
    rst  0
    ld   a, b
    ld   b, a
    ld    hl, sp+$FF
    nop
    rst  $18
    ld   [$FF37], a
    ld    hl, sp+$0B
    db   $FC ; Undefined instruction
    rst  0
    inc  a
    push hl
    ld   e, $E3
    ld   e, $E2
    rra
    ld   e, $1E
    ld   hl, label_3D021
    ld   b, e
    ld   b, c
    ld   b, h
    ret  nz
    ld   c, b
    ld   [$FFA9], a
    ld   a, [$FF98]
    ld    hl, sp+$98
    ld   a, b
    ld   a, b
    add  a, h
    add  a, h
    ld   [de], a
    ld   [bc], a
    ld   [bc], a
    ld  [$FF00+C], a
    rlca
    ld   [de], a
    dec  c
    rrca
    add  hl, bc
    rrca
    add  hl, de
    ld   e, a
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   h, a
    ld    hl, sp+$63
    db   $FC ; Undefined instruction
    or   c
    ld   a, [hl]
    cp   b
    ld   a, a
    call c, label_3EE3F
    rra
    scf
    rrca
    dec  de
    rlca
    and  $1F
    add  a, $3F
    adc  a, l
    ld   a, [hl]
    dec  e
    cp   $3B
    db   $FC ; Undefined instruction
    db   $76 ; Halt
    ld    hl, sp+$EC
    ld   a, [$FFD8]
    ld   [rTAC], a
    rst  $38
    ld   sp, hl
    ld    hl, sp+$41
    adc  a, b
    ld   b, l
    adc  a, b
    ld   d, h
    adc  a, b
    ld   d, h
    adc  a, b

label_3FCDC::
    dec  d
    adc  a, b
    dec  d
    adc  a, b
    inc  a
    nop
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
    ld   a, [hl]
    nop
    inc  a
    nop
    nop
    nop
    nop
    nop
    jr   label_3FD0E
    inc  a
    inc  a
    ld   a, [hl]
    ld   a, [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_3FCFF::
    rst  $38
    rst  $38
    ld   bc, label_2FE
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38

label_3FD09::
    ld   [label_8FF], sp
    xor  $10

label_3FD0E::
    cp   $10
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    jr   nz, label_3FD56
    jr   nz, label_3FD58
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_80F], sp
    db   $FC ; Undefined instruction
    ld   a, [$FF30]
    ld   [$FFE0], a
    jr   nz, label_3FD87
    jr   nz, label_3FD09
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    rrca
    rrca
    inc  e
    rlca
    ccf
    inc  b
    ld   a, $04
    ccf
    ld   [bc], a
    ccf
    ld   [bc], a
    rra
    inc  bc
    rrca
    inc  bc
    ld   [$FF80], a
    ld   [$FF80], a
    and  b
    ret  nz
    ld   a, [$FFC0]
    ld   a, [$FFC0]
    ret  c
    ld   [$FFDC], a
    ld   [$FFEF], a
    ld   a, [$FF07]
    ld   bc, $0107
    dec  b
    inc  bc

label_3FD56::
    rrca
    inc  bc

label_3FD58::
    rrca
    inc  bc
    dec  de
    rlca
    dec  sp
    rlca
    rst  $30
    rrca
    nop
    rst  $38
    rlca
    rst  $38
    inc  e
    rst  $38
    jr   nc, label_3FD67
    ld   h, e
    db   $FC ; Undefined instruction
    ld   h, a
    ld    hl, sp+$C7
    ld    hl, sp+$C7
    ld    hl, sp+$00
    rst  $38
    ld   [rIE], a
    jr   c, label_3FD75
    inc  c
    rst  $38
    add  a, $3F
    and  $1F
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra
    db   $FC ; Undefined instruction
    and  h
    rst  $38
    and  a
    rst  $38
    and  d
    rst  $38

label_3FD87::
    jp   nc, label_8AFF
    ld   a, a
    ld   b, h
    ccf
    inc  h
    rra
    rra
    add  hl, hl
    ccf
    ret
    rst  $38
    ret
    ld   a, a
    ret
    ld   a, a
    db   $77
    ld   [hl], a
    cp   $22
    db   $FC ; Undefined instruction
    inc  l
    ld   sp, hl
    ld    hl, sp+$3F
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    inc  bc
    nop
    ld   bc, $C000
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    ld   a, a
    add  a, b
    rra
    ld   [rTAC], a
    ld    hl, sp+$80
    rst  $38
    ret  nz
    rst  $38
    inc  bc
    nop
    rrca
    nop
    rst  $38
    nop
    cp   $01
    ld    hl, sp+$07
    ld   [$FF1F], a
    ld   bc, label_3FF
    rst  $38
    ld   d, c
    adc  a, b
    ld   d, c
    adc  a, b
    ld   b, l
    adc  a, b
    ld   b, b
    adc  a, a
    rlca
    ld    hl, sp+$77
    adc  a, b
    ld   [hl], a
    adc  a, a
    ld    hl, sp+$FF
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
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    add  a, c
    add  a, c
    jp   label_FF42
    inc  a
    nop
    rst  $38
    cp   l
    ld   a, [hl]
    ld   e, d
    rst  $20
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    xor  l
    jp   label_C3A5
    cp   l
    ld   a, [hl]
    ld   e, d
    rst  $20
    and  l
    jp   label_FFFF
    add  a, b
    add  a, b
    nop
    nop
    ld   a, a
    nop
    rst  $38
    ld   a, $BD
    ld   a, [hl]
    ld   e, d
    rst  $20
    and  l
    jp   label_FFFF
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    cp   l
    ld   a, [hl]
    ld   e, d
    rst  $20
    and  l
    jp   label_FFFF
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    cp   l
    ld   a, [hl]
    ld   e, d
    rst  $20
    and  l
    jp   label_FFFF
    ld   bc, $0001
    nop
    cp   $00
    rst  $38
    cp   $BD
    ld   a, [hl]
    ld   e, d
    rst  $20
    and  l
    jp   label_C3A5
    and  l
    jp   label_C3A5
    xor  l
    jp   label_C3A5
    rst  $38
    nop
    ei
    rlca
    db   $EC ; Undefined instruction
    rra
    ret  nc
    ccf
    db   $E3 ; Undefined instruction
    inc  a
    and  a
    ld   a, b
    rst  0
    ld   a, b
    ld   b, a
    ld    hl, sp+$FF
    nop
    rst  $18
    ld   [$FF37], a
    ld    hl, sp+$0B
    db   $FC ; Undefined instruction
    rst  0
    inc  a
    push hl
    ld   e, $E3
    ld   e, $E2
    rra
    ld   e, $1E
    ld   hl, label_3D021
    ld   b, e
    ld   b, c
    ld   b, h
    ret  nz
    ld   c, b
    ld   [$FFA9], a
    ld   a, [$FF98]
    ld    hl, sp+$98

label_3FE90::
    ld   a, b
    ld   a, b
    add  a, h
    add  a, h
    ld   [de], a
    ld   [bc], a
    ld   [bc], a
    ld  [$FF00+C], a
    rlca
    ld   [de], a
    dec  c
    rrca
    add  hl, bc
    rrca
    add  hl, de
    ld   e, a
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3FED0
    jr   label_3FED2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_3FED0::
    rlca
    rst  $38

label_3FED2::
    ld   sp, hl
    ld    hl, sp+$41
    adc  a, b
    ld   b, l
    adc  a, b
    ld   d, h
    adc  a, b
    ld   d, h
    adc  a, b
    dec  d
    adc  a, b
    dec  d
    adc  a, b
    db   $DB
    jr   label_3FE90
    inc  l
    ld   c, d
    ld   c, [hl]
    adc  a, c
    adc  a, a
    sbc  a, c
    sbc  a, a
    cp   l
    and  a
    ld   a, [hl]
    ld   b, d
    cp   l
    inc  a
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3FF10
    jr   label_3FF12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop

label_3FEFF::
    nop
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

label_3FF10::
    rst  $38
    ld   de, label_11FF
    rst  $38
    ld   e, $FF
    inc  d
    rst  $38
    inc  d
    rst  $38
    inc  sp
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    inc  d
    rst  $38
    inc  d
    rst  $38
    ldi  [hl], a
    rst  $38
    ld   a, $FF
    ldi  [hl], a
    rst  $38
    ld   h, e
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ldi  [hl], a
    rst  $38
    jr   nz, label_3FF34
    jr   c, label_3FF36
    jr   nz, label_3FF38
    jr   nz, label_3FF3A
    ld   [hl], b
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   c, label_3FF4C
    ld   bc, rIE
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
    nop
    rst  $38
    rlca
    rst  $38
    inc  e
    rst  $38
    jr   nc, label_3FF67
    ld   h, e
    db   $FC ; Undefined instruction
    ld   h, a
    ld    hl, sp+$C7
    ld    hl, sp+$C7
    ld    hl, sp+$00
    rst  $38
    ld   [rIE], a
    jr   c, label_3FF75
    inc  c
    rst  $38
    add  a, $3F
    and  $1F
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra

label_3FF80::
    db   $FC ; Undefined instruction
    and  h
    rst  $38
    and  a
    rst  $38
    and  d
    rst  $38
    jp   nc, label_8AFF

label_3FF8A::
    ld   a, a
    ld   b, h
    ccf
    inc  h
    rra
    rra
    add  hl, hl
    ccf
    ret
    rst  $38
    ret
    ld   a, a
    ret
    ld   a, a
    db   $77
    ld   [hl], a
    cp   $22
    db   $FC ; Undefined instruction
    inc  l
    ld   sp, hl
    ld    hl, sp+$3F
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    inc  bc
    nop
    ld   bc, $0000
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_3FFD0
    jr   label_3FFD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    ld   d, l
    adc  a, b
    ld   d, c
    adc  a, b
    ld   b, c
    adc  a, b
    ld   b, l
    adc  a, b
    ld   d, h
    adc  a, b
    ld   d, h
    adc  a, b
    dec  d
    adc  a, b
    dec  d
    adc  a, b

label_3FFD0::
    ld   d, c
    adc  a, b

label_3FFD2::
    ld   d, c
    adc  a, b
    ld   b, l
    adc  a, b
    ld   b, b
    adc  a, a
    rlca
    ld    hl, sp+$77
    adc  a, b
    ld   [hl], a
    adc  a, a
    ld    hl, sp+$FF

label_3FFE0::
    rst  $20
    nop
    db   $DB
    jr   label_3FF8A
    inc  h
    ld   c, [hl]
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   e, [hl]
    ld   d, d
    cp   l
    inc  a
    jp   label_0
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_FFFF8010
    jr   label_FFFF8012
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop

label_3FFFF::
    nop
