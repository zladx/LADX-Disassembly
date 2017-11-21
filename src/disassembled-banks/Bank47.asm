section "bank47",romx,bank[$2F]
    add  a, a

label_BC001::
    add  a, a
    ld   bc, $C001
    ret  nz
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    jr   label_BC024
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
    ld   bc, label_BC301
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
    ld   bc, label_BC301
    ld   b, e
    rst  $38
    rst  $38
    rra
    rra
    jr   nc, label_BC123
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

label_BC0FF::
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

label_BC123::
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

label_BC13E::
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

label_BC162::
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
    ld   bc, label_BFFFF
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
    adc  a, b
    add  a, b
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
    jr   label_BC258
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

label_BC258::
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

label_BC301::
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

label_BC340::
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

label_BC350::
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

label_BC3F3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_BC3FE::
    nop

label_BC3FF::
    nop
    rst  $38
    rlca
    rst  $38
    rra
    rst  $38
    jr   nc, label_BC406
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
    jr   nc, label_BC426
    db   $10
    db   $FF
    jr   label_BC42A
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
    jr   label_BC44A
    sbc  a, b
    rst  $38
    jr   label_BC44E
    jr   label_BC450
    ret  nz
    rst  $38
    jr   nc, label_BC454
    jr   label_BC456
    jr   label_BC458
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
    jr   c, label_BC48C
    rra

label_BC48E::
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
    jr   label_BC4AC
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
    jr   label_BC4C2
    jr   label_BC4C4
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
    jr   nc, label_BC4F6
    jr   z, label_BC4F8
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
    ld   bc, label_BFEFF
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
    jr   c, label_BC541
    rst  $20
    rra
    add  hl, de
    cp   $EC
    ld   a, [$FF7F]

label_BC541::
    rst  $38
    and  d

label_BC543::
    pop  bc
    dec  e

label_BC545::
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
    jr   label_BC554
    ld   sp, label_27E0
    ld   [$FF2F], a
    ld   [$FF67], a
    ld   [$FFF8], a
    ld   a, [$FF7E]
    cp   $B9
    ld   a, b
    db   $DB
    jr   c, label_BC543
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
    jp   nc, label_BCFE0
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
    jp   hl
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
    call c, label_BCF80
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
    jp   hl
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
    jr   z, label_BC6CE
    jr   z, label_BC6D0
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
    jr   nz, label_BC6DC
    jr   nz, label_BC6DE
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

label_BC6D0::
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

label_BC6DC::
    ret  nz
    ret  nz

label_BC6DE::
    jr   nz, label_BC700
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
    jr   z, label_BC73E
    inc  l
    inc  l
    ld   a, [hli]
    ld   a, [hli]
    add  hl, hl
    add  hl, hl
    jr   z, label_BC746
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

label_BC73E::
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    nop
    nop
    and  d
    and  d
    and  d
    and  d

label_BC746::
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
    jr   nz, label_BC7A6
    jr   nz, label_BC7A8
    jr   nz, label_BC7AA
    jr   nz, label_BC7AC
    jr   nz, label_BC7AE
    jr   nz, label_BC7B0
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

label_BC7A6::
    ld   [bc], a
    ld   [bc], a

label_BC7A8::
    jp   nz, label_2C2
    ld   [bc], a

label_BC7AC::
    ld   [bc], a
    ld   [bc], a

label_BC7AE::
    ld  [$FF00+C], a
    ld  [$FF00+C], a

label_BC7B0::
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
    jr   nz, label_BC7F4
    jr   nz, label_BC7F6
    jr   nz, label_BC7F8
    and  b
    and  b
    ld   h, b
    ld   h, b
    jr   nz, label_BC7FE
    jr   nz, label_BC800
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

label_BC7F4::
    nop
    nop

label_BC7F6::
    nop
    nop

label_BC7F8::
    nop
    nop
    nop
    nop
    nop
    nop

label_BC7FE::
    nop
    nop

label_BC800::
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
    jr   nz, label_BC836
    jr   nz, label_BC838
    jr   nz, label_BC83A
    jr   nz, label_BC83C
    jr   nz, label_BC83E
    ret  nz
    ret  nz
    nop
    nop
    jr   c, label_BC85C
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

label_BC836::
    dec  d
    dec  d

label_BC838::
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction

label_BC83A::
    inc  d
    inc  d

label_BC83C::
    inc  d
    inc  d

label_BC83E::
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

label_BC85C::
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
    jr   c, label_BC8D8
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
    jr   z, label_BC8EE
    jr   z, label_BC8F0
    xor  e
    xor  e
    ld   l, b
    ld   l, b
    jr   z, label_BC8F6
    daa
    daa
    nop
    nop
    jr   nc, label_BC904
    adc  a, b
    adc  a, b
    inc  b
    inc  b

label_BC8D8::
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    adc  a, b
    adc  a, b
    jr   nc, label_BC910

label_BC8E0::
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_BC8E8

label_BC8E8::
    stop
    jr   z, label_BC8EC

label_BC8EC::
    ld   b, h
    nop

label_BC8EE::
    nop
    nop

label_BC8F0::
    nop
    nop
    nop
    nop
    ld   b, h
    nop

label_BC8F6::
    jr   z, label_BC8F8

label_BC8F8::
    stop
    jr   z, label_BC8FC

label_BC8FC::
    ld   b, h
    nop
    nop
    nop
    ld   bc, $0100
    nop

label_BC904::
    ld   bc, label_200
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    dec  b
    nop
    dec  b
    nop

label_BC910::
    rst  $38
    nop
    nop
    nop
    nop
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    nop
    rst  $38
    inc  bc
    rst  $38
    rlca
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
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    rst  $38
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
    pop  bc
    cp   $82
    ld   a, $FF
    nop
    ld   bc, label_301
    rst  $38
    ld   b, $FF
    rlca
    cp   $0C
    cp   $0E
    db   $FC ; Undefined instruction
    jr   label_BC94C
    add  a, b
    add  a, b
    ld   a, $BE
    xor  d
    ld   a, [hli]
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_1C08], sp
    inc  e
    nop
    nop
    call label_BC8CD
    ld   c, b
    ld   c, b
    ld   c, b
    ld   a, b
    ld   a, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    call label_CD
    nop
    pop  af
    pop  af
    sub  a, b
    sub  a, b
    add  a, b
    add  a, b
    ld   [$FFE0], a
    add  a, b
    add  a, b
    sub  a, b
    sub  a, b
    pop  af
    pop  af
    nop
    nop
    rst  0
    rst  0
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    add  a, e
    add  a, e
    add  a, d
    add  a, d
    sub  a, d
    sub  a, d
    rst  $30
    rst  $30
    nop
    nop
    adc  a, $CE
    ld   d, e
    ld   d, e
    db   $10
    db   $10
    sub  a, e
    sub  a, e
    ld   de, label_BD111
    ld   d, c
    adc  a, $CE
    nop
    nop
    ld   a, l
    ld   a, l
    inc  h
    inc  h
    jr   nz, label_BC9C8
    jr   c, label_BC9E2
    jr   nz, label_BC9CC
    inc  h
    inc  h
    ld   a, l
    ld   a, l
    nop
    nop
    sbc  a, e
    sbc  a, e
    sub  a, c
    sub  a, c
    pop  de
    pop  de
    pop  de
    pop  de
    or   c
    or   c
    sub  a, c
    sub  a, c
    sbc  a, e
    sbc  a, e
    nop
    nop
    pop  bc
    pop  bc
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a

label_BC9C8::
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a

label_BC9CC::
    ldi  [hl], a
    ldi  [hl], a
    pop  bc
    pop  bc
    nop
    nop
    rst  8
    rst  8
    inc  h
    inc  h
    inc  h
    inc  h
    daa
    daa
    inc  h
    inc  h
    inc  h
    inc  h
    adc  a, $CE
    nop
    nop

label_BC9E2::
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop

label_BC9EB::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $010A
    ld   a, [bc]
    ld   bc, label_308
    inc  d
    inc  bc
    dec  d
    inc  bc
    inc  de
    rlca

label_BCA0E::
    ccf
    rlca
    ld   c, $FE
    inc  e
    db   $FC ; Undefined instruction
    jr   c, label_BCA0E
    ld   [hl], b
    ld   a, [$FFE0]
    ld   [$FFC0], a
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    ld   bc, label_300
    nop
    ld   [bc], a
    nop
    ld   b, $00
    dec  b
    nop
    inc  c
    ld   bc, $010A
    jr   label_BCA33
    ld   b, e
    ld   a, $06

label_BCA33::
    ld   a, l
    adc  a, b
    ld   a, l
    ld   e, $F9
    ld   [de], a
    ld   sp, hl
    jr   nc, label_BCA37
    ld   l, b
    di
    push hl
    di
    inc  e
    ld    hl, sp+$2F
    ld   [rJOYP], a
    ret  nz
    ld   [hl], b
    rst  $28
    ld   a, b
    rst  $30
    call c, label_FEFB
    db   $8C
    adc  a, h

label_BCA4F::
    call label_0
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    nop
    nop
    db   $FC ; Undefined instruction
    inc  bc
    inc  bc
    nop
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    jp   label_C3FF
    rst  $38
    nop
    nop
    rst  $38
    nop
    nop
    nop
    add  a, b
    ld   a, a
    ret  nz
    cp   a
    ld   [$FFDF], a
    ret  nz
    rst  $18
    ld   b, b
    rra
    nop
    nop

label_BCA82::
    db   $FC ; Undefined instruction
    nop
    inc  b
    nop
    inc  e
    db   $FC ; Undefined instruction
    jr   c, label_BCA82
    ld   [hl], b
    ld   a, [$FFE0]
    ld   [$FFC0], a
    ret  nz
    nop
    nop
    rst  $38
    nop
    ret  nz
    ret  nz
    ld   a, [$FFEF]
    ld   a, b
    ld   [hl], a
    inc  a
    dec  sp
    jr   label_BCAB9
    ld   [$000B], sp
    nop
    ld    hl, sp+$04
    rlca
    rlca
    rlca
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    inc  e
    ei
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [hl], b
    ld   a, [$FF38]
    ld    hl, sp+$1C
    ld    hl, sp+$00
    nop
    rst  $38
    nop
    ret  nz
    ret  nz
    ld   [rIE], a

label_BCAC8::
    ld   [hl], b
    ld   a, a

label_BCACA::
    jr   nc, label_BCB03
    db   $10
    db   $17
    db   $10
    db   $07
    nop
    nop
    ld   [rNR10], a

label_BCAD4::
    ld   [hl], b
    ld   [hl], b

label_BCAD6::
    jr   nc, label_BCAC8

label_BCAD8::
    jr   c, label_BCACA
    jr   nc, label_BCAD4
    jr   label_BCAD6
    jr   label_BCAD8
    nop
    nop
    inc  a
    inc  a
    ld   b, d
    ld   b, d
    cp   c
    cp   c
    and  l
    and  l
    cp   c
    cp   c
    and  l
    and  l
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, $0E
    inc  l

label_BCB03::
    inc  c
    jr   c, label_BCB3E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_1400
    inc  bc
    ld   sp, label_2907
    rlca
    ld   h, c
    rrca
    ld   d, c
    rrca
    pop  bc
    rra
    and  b
    rra
    add  a, b
    ccf
    pop  bc
    rst  $30
    inc  sp
    rst  0
    ld   h, e
    adc  a, a
    ld   b, [hl]
    sbc  a, a
    add  a, a
    ld   a, $0C
    ld   a, [hl]

label_BCB3C::
    ld   c, $FC

label_BCB3E::
    jr   label_BCB3C
    call nz, label_481
    add  a, c
    add  a, h
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    dec  c
    db   $FC ; Undefined instruction
    dec  c
    db   $FC ; Undefined instruction
    ld   c, $FC
    ld   c, $FC
    dec  c
    ld   a, [$FFE3]
    rst  $38
    ld   h, e
    ld   a, a
    ld   [hl], e
    ld   a, a
    di
    ld   a, a
    ld   a, e
    ld   a, a
    ei
    ld   a, a
    ld   a, a
    rst  $38
    ld   l, a
    rst  $28
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [label_803], sp
    inc  bc
    ld   [label_803], sp
    inc  bc
    ld   [label_803], sp
    inc  bc
    ld   [label_803], sp
    inc  bc
    ld   e, $FD
    rra
    cp   $1F
    ld   a, [$F91B]
    add  hl, de
    ld   sp, hl
    add  hl, de
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$0C
    db   $FC ; Undefined instruction
    ld   c, $FC
    ld   b, $FE
    add  a, a
    ld   a, [hl]
    add  a, a
    ld   a, [hl]
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    db   $10
    db   $07
    db   $10
    db   $07
    db   $10
    db   $07
    jr   z, label_BCBCF
    jr   z, label_BCBD1
    dec  hl
    ld   b, $22
    ld   c, $52

label_BCBCF::
    ld   c, $1C

label_BCBD1::
    ld    hl, sp+$18
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    ld   c, $FC
    inc  c
    cp   $06
    cp   $86
    ld   a, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_BCC0F::
    nop
    ld   bc, label_300
    nop
    ld   [bc], a

label_BCC15::
    nop
    ld   b, $00
    dec  b
    nop
    inc  c
    ld   bc, $010A
    jr   label_BCC23
    ld   b, h
    dec  a
    ld   [$987D], sp

label_BCC25::
    ld   a, l
    jr   nz, label_BCC25
    inc  l
    pop  af
    jr   c, label_BCC0F
    jr   nc, label_BCC15
    ld   hl, label_1CEF
    ld    hl, sp+$30
    ld    hl, sp+$38
    ld   a, [$FF60]
    ld   a, [$FF70]
    ld   [$FFC0], a
    ld   [$FFE0], a
    ret  nz
    add  a, b
    ret  nz
    inc  b
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    nop
    di
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
    rst  $38
    ld   h, b
    ld   [$FF60], a
    ld   [$FF60], a
    ld   [$FF60], a
    ld   [$FF6F], a
    pop  hl
    ld   l, a
    db   $E3 ; Undefined instruction
    ld   [hl], e
    rst  $20
    ld   [hl], e
    rst  $20
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    pop  bc
    ret  nz
    pop  bc
    ret  nz
    jp   nz, label_C2C0
    ret  nz
    ld   [label_803], sp
    inc  bc
    ld   [label_803], sp
    inc  bc
    db   $E8 ; add  sp, d
    inc  hl
    db   $E8 ; add  sp, d
    ld   h, e
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    add  hl, de
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$03
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    ld   d, d
    ld   c, $57
    ld   c, $C6
    sbc  a, a
    and  a
    rra
    and  a
    rra
    xor  a
    inc  e
    add  a, b
    jr   nc, label_BCD0F
    ccf
    add  a, a
    ld   a, [hl]
    ld   b, $7F
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    ld   b, e
    ccf
    ld   b, e
    ccf
    ld   bc, $013F
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_1400
    inc  bc
    jr   nc, label_BCD1B
    jr   z, label_BCD1D
    ld   h, c
    rrca
    ld   d, e
    rrca
    add  a, $1F
    xor  [hl]

label_BCD1D::
    rra
    adc  a, l
    ld   a, $01
    rst  $38
    inc  bc
    rst  $38
    add  a, e
    cp   a
    ld   b, $BF
    rlca
    cp   [hl]
    inc  c
    cp   [hl]
    ld   c, $BC
    ld   e, b
    inc  a
    ret  nz
    add  a, b
    nop
    add  a, b
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
    inc  b
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    inc  b
    ld   bc, $0104
    dec  c
    db   $FD ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $20
    db   $EB ; Undefined instruction
    rst  0
    inc  hl
    rrca
    ld   d, e
    rrca
    ld   d, e
    rrca
    ld   b, e
    rra
    and  e
    rra
    and  e
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    ld   b, b

label_BCD7B::
    rra
    ld   b, b
    rra
    ld   b, b
    rra
    push bc
    ret  nz
    push bc
    ret  nz
    call nz, label_CAC1
    pop  bc
    jp   z, label_C8C1
    jp   label_C3D4
    call nc, label_BE8C3
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   l, b
    db   $E3 ; Undefined instruction
    add  hl, de
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$19
    ld    hl, sp+$1A
    ld    hl, sp+$1A
    ld    hl, sp+$1D
    ld    hl, sp+$03
    ld   a, [hl]
    inc  bc
    ld   a, [hl]
    inc  bc
    ld   a, [hl]
    ld   b, $7E
    ld   b, $7E
    add  a, [hl]
    ld   a, h
    ld   c, $FC

label_BCDBE::
    dec  c
    db   $FC ; Undefined instruction

label_BCDC0::
    ld   b, b
    ccf
    nop
    ld   a, a

label_BCDC4::
    rra
    ld   a, a
    sbc  a, a
    ld   a, a
    sbc  a, h
    ld   a, b
    jr   nc, label_BCDC4
    jr   c, label_BCDBE
    jr   nc, label_BCDC0
    ld   bc, label_1FF
    rst  $38
    ret  nz
    rst  $18
    ret  nc
    rst  8
    ret  nc
    ld   c, a
    ld   h, b
    ld   c, a
    ld   b, b
    ld   l, a
    jr   nz, label_BCE0F
    ret  nz
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFC0], a
    ret  nz
    ld   [$FF60], a
    ld   [rSVBK], a
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
    nop
    nop
    ld   bc, label_300
    nop
    ld   [bc], a

label_BCE05::
    nop
    ld   b, $00
    dec  b
    nop
    inc  c
    ld   bc, $010A
    jr   label_BCE13
    ld   c, a
    inc  a
    ld   a, [bc]

label_BCE13::
    ld   a, h
    sbc  a, l
    ld   a, b

label_BCE16::
    inc  d
    ld   sp, hl
    jr   label_BCE0D
    inc  h
    di
    jr   z, label_BCE05
    ld   d, c
    rst  $28
    inc  e
    ld   a, b
    or   b
    ld   a, b
    jr   c, label_BCE16
    ld   h, b
    ld   a, [$FF70]
    ld   [$FFC0], a
    ld   [$FFE0], a
    ret  nz
    add  a, b
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
    ld   bc, label_300
    nop
    ld   b, $00
    inc  c
    ld   bc, label_318
    jr   nc, label_BCE4D
    ld   h, b
    rrca
    ret  nz
    rra
    add  a, a
    ccf
    rlca

label_BCE4D::
    ld   a, a
    inc  c
    cp   $0F
    ld    hl, sp+$00
    ld   a, [$FF00]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    add  a, e
    ccf
    ld   b, e
    ccf
    inc  bc
    rst  $38
    inc  bc
    cp   $02
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   b, b
    rra
    ret  nz
    sbc  a, a
    add  a, b
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   a, [$FF87]
    ld   [$0007], sp
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   l, b
    db   $E3 ; Undefined instruction
    ld   a, b
    di
    ld   [hl], b
    rst  $20
    ld   h, b
    rst  8
    ld   b, b
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   a, [bc]
    pop  hl
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$00FC]
    nop
    dec  e
    db   $FC ; Undefined instruction

label_BCEB2::
    inc  a
    ld   sp, hl
    ld   a, b
    di
    ld   a, [$FFE7]
    ld   [$FFEF], a
    ld   a, a
    cp   a

label_BCEBC::
    ccf
    ccf
    nop
    nop
    jr   nc, label_BCEB2
    jr   c, label_BCEBC
    inc  e
    db   $FC ; Undefined instruction
    rrca
    rst  $38
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    jr   nz, label_BCF01
    jr   nz, label_BCF23
    ld   b, b
    sbc  a, a
    add  a, b
    ccf
    nop
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   [hl], b
    ld   [rSVBK], a
    ld   a, [$FF38]
    ld    hl, sp+$1C
    db   $FC ; Undefined instruction
    ld   c, $FE
    cp   $FE
    cp   $FE
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  d

label_BCF01::
    inc  bc
    jr   nc, label_BCF0B
    jr   z, label_BCF0D
    ld   h, b
    rrca
    ld   d, b
    rrca
    ret  nz

label_BCF0B::
    rra
    cp   a

label_BCF0D::
    ccf
    rst  $38
    rst  $38
    ld   b, c
    rst  $18
    ld   b, b
    cp   [hl]
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
    ld   a, a
    nop
    nop

label_BCF23::
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
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   bc, label_300
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
    rrca
    db   $FD ; Undefined instruction
    dec  c
    db   $FD ; Undefined instruction
    add  hl, de
    db   $FD ; Undefined instruction
    dec  e
    ld   sp, hl
    add  hl, de
    ld   sp, hl
    ld   sp, $F9F9
    pop  af
    ld   [$FFF0], a
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
    jp   hl
    jp   hl
    nop
    nop
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    sub  a, d
    sub  a, d
    ld   d, e
    ld   d, e
    ldd  [hl], a
    ldd  [hl], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    nop
    nop
    inc  l
    inc  l
    ld   c, c
    ld   c, c
    add  a, c
    add  a, c
    nop
    nop
    add  a, b
    add  a, b
    ld   b, c
    ld   b, c
    jr   nz, label_BCF9E
    nop
    nop

label_BCF80::
    ld   [$FFE0], a
    db   $10
    db   $10
    nop
    nop
    ld   [$FFE0], a
    db   $10
    db   $10
    db   $10
    db   $10
    ld   [$FFE0], a
    nop
    nop
    ld   de, label_2911
    add  hl, hl
    add  hl, hl
    add  hl, hl
    ld   b, l
    ld   b, l
    ld   a, l
    ld   a, l
    ld   b, l
    ld   b, l
    ld   b, h
    ld   b, h

label_BCF9E::
    nop
    nop
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    dec  h
    reti
    reti
    nop
    nop
    ld   b, h
    ld   b, h
    and  h
    and  h
    and  l
    and  l
    ld   d, $16
    push af
    push af
    inc  d
    inc  d
    inc  d
    inc  d
    nop
    nop
    ld   e, a
    ld   e, a
    sub  a, b
    sub  a, b
    db   $10
    db   $10
    ld   e, $1E
    db   $10
    db   $10
    sub  a, b
    sub  a, b
    ld   e, a
    ld   e, a
    nop
    nop
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   h, h
    ld   h, h
    ld   d, h
    ld   d, h
    ld   c, h
    ld   c, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    nop
    nop

label_BCFE0::
    sub  a, c
    sub  a, c
    sub  a, c
    sub  a, c
    sbc  a, c
    sbc  a, c
    sub  a, l
    sub  a, l
    sub  a, e
    sub  a, e
    sub  a, c
    sub  a, c
    sub  a, c
    sub  a, c
    nop
    nop
    jr   c, label_BD02A
    ld   b, h
    ld   b, h
    ld   b, b
    ld   b, b
    ld   e, h
    ld   e, h
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    jr   c, label_BD036
    nop
    nop
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
    db   $E3 ; Undefined instruction
    db   $DD
    db   $BF
    cp   a
    cp   a
    cp   a
    cp   a
    ld   a, a
    ld   a, a

label_BD02A::
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

label_BD036::
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

label_BD253::
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

label_BD2DF::
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
    jr   z, label_BD388

label_BD388::
    stop
    jr   z, label_BD38C

label_BD38C::
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

label_BD500::
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
    jr   z, label_BD588

label_BD588::
    stop
    jr   z, label_BD58C

label_BD58C::
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
    jr   z, label_BD598

label_BD598::
    stop
    jr   z, label_BD59C

label_BD59C::
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
    jr   z, label_BD5A8

label_BD5A8::
    stop
    jr   z, label_BD5AC

label_BD5AC::
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
    jr   z, label_BD5B8

label_BD5B8::
    stop
    jr   z, label_BD5BC

label_BD5BC::
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
    jr   z, label_BD5C8

label_BD5C8::
    stop
    jr   z, label_BD5CC

label_BD5CC::
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
    jr   z, label_BD5D8

label_BD5D8::
    stop
    jr   z, label_BD5DC

label_BD5DC::
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
    jr   z, label_BD5E8

label_BD5E8::
    stop
    jr   z, label_BD5EC

label_BD5EC::
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
    jr   z, label_BD5F8

label_BD5F8::
    stop
    jr   z, label_BD5FC

label_BD5FC::
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
    jr   z, label_BD608

label_BD608::
    stop
    jr   z, label_BD60C

label_BD60C::
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
    jr   z, label_BD618

label_BD618::
    stop
    jr   z, label_BD61C

label_BD61C::
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
    jr   z, label_BD628

label_BD628::
    stop
    jr   z, label_BD62C

label_BD62C::
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
    jr   z, label_BD638

label_BD638::
    stop
    jr   z, label_BD63C

label_BD63C::
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
    jr   z, label_BD648

label_BD648::
    stop
    jr   z, label_BD64C

label_BD64C::
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
    jr   z, label_BD658

label_BD658::
    stop
    jr   z, label_BD65C

label_BD65C::
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
    jr   z, label_BD668

label_BD668::
    stop
    jr   z, label_BD66C

label_BD66C::
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
    jr   z, label_BD678

label_BD678::
    stop
    jr   z, label_BD67C

label_BD67C::
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
    jr   z, label_BD688

label_BD688::
    stop
    jr   z, label_BD68C

label_BD68C::
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
    jr   z, label_BD698

label_BD698::
    stop
    jr   z, label_BD69C

label_BD69C::
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
    jr   z, label_BD6A8

label_BD6A8::
    stop
    jr   z, label_BD6AC

label_BD6AC::
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
    jr   z, label_BD6B8

label_BD6B8::
    stop
    jr   z, label_BD6BC

label_BD6BC::
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
    jr   z, label_BD6C8

label_BD6C8::
    stop
    jr   z, label_BD6CC

label_BD6CC::
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
    jr   z, label_BD6D8

label_BD6D8::
    stop
    jr   z, label_BD6DC

label_BD6DC::
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
    jr   z, label_BD6E8

label_BD6E8::
    stop
    jr   z, label_BD6EC

label_BD6EC::
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
    jr   z, label_BD6F8

label_BD6F8::
    stop
    jr   z, label_BD6FC

label_BD6FC::
    ld   b, h
    nop
    nop
    nop
    jp   label_99C3
    sbc  a, c

label_BD704::
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
    jr   z, label_BD7B8

label_BD7B8::
    stop
    jr   z, label_BD7BC

label_BD7BC::
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
    jr   label_BD87D

label_BD87D::
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
    jr   z, label_BD8F7
    jr   c, label_BD917
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
    ld   bc, label_BF4FF
    ei
    ld   a, [label_BD253]
    ld   d, e
    ld   d, d
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    rst  $20
    add  a, e
    rst  $38
    ld   hl, label_BE0FF
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
    ld   de, label_BFCFF
    xor  e

label_BD8F7::
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
    jr   label_BD91E
    ld   a, [bc]
    inc  h
    ld   b, b
    jr   z, label_BD927
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

label_BD917::
    jp   label_FF81
    sbc  a, c
    rst  $20
    jp   label_E7BD
    jp   label_FCFC
    cp   h
    cp   [hl]
    jp   z, label_185

label_BD927::
    ld   a, d
    add  a, c
    inc  b
    add  a, b
    ld   sp, hl
    inc  bc
    ld   bc, $8387
    db   $EC ; Undefined instruction
    db   $E4 ; Undefined instruction
    jp   hl
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
    ld   de, label_BC545
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
    jr   z, label_BD9B8

label_BD9B8::
    stop
    jr   z, label_BD9BC

label_BD9BC::
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
    jr   z, label_BD9C8

label_BD9C8::
    stop
    jr   z, label_BD9CC

label_BD9CC::
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
    jr   z, label_BD9D8

label_BD9D8::
    stop
    jr   z, label_BD9DC

label_BD9DC::
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
    jr   z, label_BD9E8

label_BD9E8::
    stop
    jr   z, label_BD9EC

label_BD9EC::
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
    jr   z, label_BD9F8

label_BD9F8::
    stop
    jr   z, label_BD9FC

label_BD9FC::
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
    jr   label_BDA20
    jr   label_BDA22
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
    jr   label_BDA30
    jr   label_BDA32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDA20::
    nop
    nop

label_BDA22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BDA40
    jr   label_BDA42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDA30::
    nop
    nop

label_BDA32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BDA50
    jr   label_BDA52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDA40::
    ei
    db   $FD ; Undefined instruction

label_BDA42::
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

label_BDA52::
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
    jr   label_BDA74
    dec  hl
    jr   nc, label_BDAB2
    ld   [hl], b
    adc  a, e
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FFFF]
    rst  $38
    nop
    nop

label_BDA74::
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
    jr   label_BDA8C
    call nc, label_D20C
    ld   c, $D1
    rrca
    pop  de
    rrca

label_BDA8C::
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

label_BDAB2::
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
    jr   label_BDADE
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

label_BDADE::
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
    jr   label_BDB20
    jr   label_BDB22
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
    jr   label_BDB30
    jr   label_BDB32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDB20::
    nop
    nop

label_BDB22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BDB40
    jr   label_BDB42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDB30::
    nop
    nop

label_BDB32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BDB50
    jr   label_BDB52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDB40::
    sbc  a, a
    cp   a

label_BDB42::
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

label_BDB50::
    ld   sp, hl
    db   $FD ; Undefined instruction

label_BDB52::
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
    sub  a, a
    cp   b
    xor  a
    xor  b
    sub  a, a
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
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, $0101
    rst  $38
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
    jr   label_BDBF0
    jr   label_BDBF2
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
    jr   label_BDC00
    jr   label_BDC02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDBF0::
    cp   $FF

label_BDBF2::
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
    ld   bc, label_301

label_BDC01::
    rrca

label_BDC02::
    rrca
    ccf
    inc  e
    ld   a, a

label_BDC06::
    jr   c, label_BDC07
    jr   c, label_BDC01
    dec  sp
    db   $F4 ; Undefined instruction
    ccf
    di
    ld   a, a
    db   $F4 ; Undefined instruction
    ret  nz
    ld   a, [$FFF0]
    db   $FC ; Undefined instruction

label_BDC14::
    jr   c, label_BDC14
    inc  e
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
    nop
    nop
    inc  bc
    inc  bc
    inc  c
    rrca

label_BDC66::
    db   $10
    db   $1F
    inc  hl
    inc  a
    daa
    jr   c, label_BDCB4
    ld   a, b
    ld   b, a
    ld   a, b
    nop
    nop
    ret  nz
    ret  nz
    jr   nc, label_BDC66
    ld   [$C4F8], sp
    inc  a
    db   $E4 ; Undefined instruction
    inc  e
    ld  [$FF00+C], a
    ld   e, $E2
    ld   e, $1E
    ld   e, $21
    ld   hl, label_BC350
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

label_BDCB4::
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
    ld   sp, label_BF1BF
    rst  $30
    ld   a, c
    ld   a, [hl]
    jp  c, label_8CDC
    sbc  a, $E3
    jp   nz, label_C2FF
    rst  $38
    jp   nz, label_BC3FF
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
    nop
    rlca
    rlca
    inc  e
    rra
    jr   nc, label_BDDA7
    ld   h, e
    ld   a, h
    ld   h, a
    ld   a, b
    rst  0
    ld    hl, sp+$C7
    ld    hl, sp+$00
    nop
    ld   [$FFE0], a
    jr   c, label_BDD6E
    inc  c
    db   $FC ; Undefined instruction
    add  a, $3E
    and  $1E
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

label_BDDA7::
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

label_BDDC2::
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
    jr   c, label_BDDC2
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
    jr   label_BDE2E
    ccf
    cpl
    inc  a
    ld   [hl], h
    jr   c, label_BDE10
    rst  $38
    cp   $08
    rra
    inc  b
    rrca

label_BDE17::
    rlca
    ld    hl, sp+$0A
    ld   a, [$FF00+C]
    db   $D3 ; Undefined instruction
    inc  [hl]
    ld   a, b
    inc  de
    rst  $38

label_BDE21::
    rst  $38
    ld   a, a
    db   $10
    db   $F9
    jr   nz, label_BDE17
    ld   [$FF1F], a
    ld   d, b
    ld   c, a
    cpl
    sra  h

label_BDE2E::
    ld   e, $C8
    nop
    nop
    ret  nz
    ret  nz
    or   b
    ld   [hl], b
    ret  z
    jr   c, label_BDE21
    jr   label_BDDFF
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
    ld   c, a
    rst  0
    cp   a
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
    rst  $20
    db   $E3 ; Undefined instruction
    rst  $18
    db   $7F
    ld   a, a
    db   $03
    inc  bc
    cp   $06
    db   $FC ; Undefined instruction
    ld   e, $FC
    rst  $28

label_BDE77::
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
    db   $10
    db   $F9
    jr   nz, label_BDE77
    ld   [$FF1F], a
    ld   d, b
    ld   c, a
    cpl
    sra  h
    ld   e, $C8

label_BDE90::
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
    jr   label_BDEC0
    jr   label_BDEC2
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
    jr   label_BDED0
    jr   label_BDED2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDEC0::
    rst  $38
    add  a, a

label_BDEC2::
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

label_BDED0::
    rst  $38
    pop  hl

label_BDED2::
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
    jr   label_BDE90
    inc  l
    ld   c, d
    ld   c, [hl]
    adc  a, c
    adc  a, a
    sbc  a, c
    sbc  a, a

label_BDEEA::
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
    jr   label_BDF10
    jr   label_BDF12
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

label_BDF0E::
    add  a, b
    rst  $38

label_BDF10::
    ld   l, h
    jr   label_BDEEA
    ccf
    xor  a
    ld   [hl], b
    ld   e, h
    ld   [$FF58], a
    ld   [$FF98], a
    ld   [$FF9C], a
    ld   [$FF9F], a
    ld   [$FF36], a
    jr   label_BDF0E
    db   $FC ; Undefined instruction
    push bc
    ld   a, $62
    rra
    ldd  [hl], a
    rrca
    ld   sp, label_BF10F
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
    ld   bc, label_BF8FF
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
    jr   c, label_BDF76
    rrca
    ld   a, $62
    rst  $18
    inc  a
    ld   l, c
    ld   e, $FE
    rrca
    ld   sp, hl
    rst  8

label_BDF6A::
    ld    hl, sp+$CF
    di
    inc  e
    db   $E8 ; add  sp, d
    ld   a, [$FF3E]
    db   $10
    db   $9E
    ld   [$B43C], sp

label_BDF76::
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

label_BDF8A::
    ld   sp, label_BF10F
    rrca
    pop  af
    rrca
    ld   l, h
    jr   label_BDF6A
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
    jr   label_BDFC0
    jr   label_BDFC2
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
    jr   label_BDFD0
    jr   label_BDFD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BDFC0::
    add  a, a
    ld    hl, sp+$FF
    pop  bc
    cp   $7F

label_BDFC6::
    rst  $38
    ld   b, c
    adc  a, a
    ld   a, [$FFFC]
    add  a, e
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    jp   label_1FF

label_BDFD2::
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
    jr   label_BDF8A
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

label_BDFF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BE010
    jr   label_BE012
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BE000::
    rst  $20

label_BE001::
    jr   label_BDFC6
    inc  a
    nop
    rst  $38
    jr   label_BE007
    inc  a
    rst  $38
    rst  $38
    rst  $38
    jp   label_BE6FF
    add  a, c

label_BE010::
    jp   label_24C3
    rst  $20
    db   $DB
    inc  a
    rst  $20
    jr   label_BE018
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
    jr   nc, label_BDFF2
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
    db   $10
    db   $FF
    nop
    rst  $38
    nop

label_BE078::
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

label_BE094::
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

label_BE0A5::
    inc  c
    ld   [hl], a
    jr   c, label_BE078
    ld   [hl], b
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FF9F], a
    ld   [$FFE0], a
    ret  nz
    jr   nc, label_BE094
    ret  nc
    jr   nc, label_BE0A5
    inc  e
    di
    ld   c, $F9
    rlca

label_BE0BC::
    ld   sp, hl
    rlca
    ld   sp, hl
    rlca
    nop
    nop
    nop
    ld    hl, sp+$18
    ld   h, h
    jr   z, label_BE11C
    inc  [hl]
    ld   c, d
    ld   e, $21

label_BE0CC::
    nop
    rra
    nop
    nop

label_BE0D0::
    nop
    nop
    jr   nz, label_BE0D4

label_BE0D4::
    ldd  [hl], a
    nop
    ld   d, $00
    call nz, label_BE000
    nop
    nop
    nop

label_BE0DE::
    nop

label_BE0DF::
    nop
    jp   hl
    jr   label_BE0CC
    jr   label_BE0D0
    jr   label_BE0DE
    inc  c
    di
    rrca
    ld    hl, sp+$07
    rst  $38
    nop
    rst  $38
    nop
    db   $ED ; Undefined instruction
    ld   e, $F8

label_BE0F3::
    nop
    ld    hl, sp+$20
    ld    hl, sp+$70
    sbc  a, h
    ld   a, [$FF0F]
    rst  $38
    rst  $20
    rra
    rst  $38

label_BE0FF::
    nop
    or   a
    ld   a, b
    rst  $38
    nop
    rst  $38
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
    jr   label_BE12A
    jr   label_BE0BC
    jr   c, label_BE0E6
    ld   a, [$FF3F]
    ret  nz
    rst  $38
    nop

label_BE11C::
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
    jr   label_BE0F3
    ccf
    rra
    rst  $38
    jr   c, label_BE137
    db   $E3 ; Undefined instruction
    ld    hl, sp+$C3
    ld   a, [$FFA7]
    ret  nc
    ld   h, e
    sub  a, b
    rst  $20
    jr   label_BE146
    db   $FC ; Undefined instruction
    ld    hl, sp+$FF

label_BE146::
    inc  e
    rst  $38
    rst  0
    rra
    jp   label_C50F
    dec  bc
    and  $09
    rst  0
    db   $10
    db   $C7
    db   $10
    db   $A3
    db   $10
    db   $A3
    db   $10
    db   $A3
    db   $10
    db   $C7
    db   $10
    db   $C3
    db   $10
    db   $C3
    db   $10
    db   $C3
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
    jr   label_BE1B0
    jr   label_BE1B2
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
    jr   label_BE1C0
    jr   label_BE1C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BE1B0::
    nop
    nop

label_BE1B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BE1D0
    jr   label_BE1D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BE1C0::
    nop
    nop

label_BE1C2::
    jr   nz, label_BE1C4

label_BE1C4::
    ldd  [hl], a
    nop
    ld   d, $00
    call nz, label_BE000
    nop
    nop
    nop
    nop
    nop

label_BE1D0::
    nop
    nop

label_BE1D2::
    nop
    rra
    jr   label_BE1FC
    inc  d
    ld   a, [hli]
    inc  l
    ld   d, d
    ld   a, b
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
    jr   label_BE200
    jr   label_BE202
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

label_BE1FC::
    nop
    nop
    nop
    nop

label_BE200::
    nop
    nop

label_BE202::
    rlca
    rlca
    rra
    jr   label_BE236
    jr   nc, label_BE259
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
    adc  a, d
    cp   $52
    ld   a, [label_BFB92]
    ld   [$FFE0], a
    pop  de
    ld   sp, label_BF392
    sub  a, l
    db   $76 ; Halt
    xor  b
    rst  $38
    ld   d, c
    ld   a, a
    ld   d, d
    ld   e, a
    ld   c, c
    sbc  a, $00
    nop
    ld   [$FFE0], a
    ld    hl, sp+$18

label_BE236::
    db   $F4 ; Undefined instruction
    inc  c
    ld   [bc], a
    cp   $C1
    rst  $38
    add  hl, sp
    rst  $38
    rst  $10
    scf
    adc  a, a
    ld   sp, hl
    sbc  a, a
    di
    cp   a
    push hl
    rst  $30
    ld   b, l
    db   $07
    rlca
    ld   [hl], e
    rlca
    rst  $18

label_BE24D::
    dec  b
    ld   sp, hl
    ld   [rSB], sp
    ld   [bc], a
    rst  $38
    dec  b
    cp   $0F
    cp   $1F

label_BE259::
    ld   sp, hl
    ld   a, $F8
    rst  $38
    jp   hl
    rst  $38
    ld   b, [hl]
    ld   [rIE], a
    jr   nc, label_BE263
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
    ld   a, c
    rst  8
    ld   a, l
    rst  $20
    ld   [hl], a
    db   $D3 ; Undefined instruction
    ld   a, a
    ret  nc
    ld   a, l
    ret  nc
    ld   d, a
    ld   a, [$FFFE]
    and  b
    sbc  a, e
    db   $10
    db   $F7
    rlca
    db   $E8 ; add  sp, d
    rrca
    rst  0
    rlca
    add  a, b
    nop

label_BE288::
    add  a, a
    rlca
    dec  de
    jr   label_BE2C4
    daa
    add  hl, sp
    inc  l
    xor  a
    xor  [hl]
    ld   d, c
    rst  $18
    rst  $38
    sbc  a, $7F
    ld   [hl], b
    rst  $18
    ret  nc
    ld   d, a
    ret  c
    ei
    call c, label_BFCB7
    cp   $00
    call label_8C30
    ld   d, e
    adc  a, d
    ld   d, h
    and  b
    ld   e, a
    pop  bc
    jr   nz, label_BE24D
    ld   b, b
    daa
    ld   b, b
    ld   bc, label_1378
    adc  a, b
    inc  de
    db   $E8 ; add  sp, d
    cpl
    db   $10
    db   $D7

label_BE2B9::
    ld   [$C837], sp
    ld   d, [hl]

label_BE2BD::
    jr   z, label_BE24D
    jr   nc, label_BE2B9
    nop
    ld   [rJOYP], a

label_BE2C4::
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
    db   $10
    db   $0F
    jr   nz, label_BE30B
    ld   b, c
    inc  l
    sub  a, e
    ld   bc, $83C0
    ld   b, b
    rlca
    ret  nz
    rst  0
    jr   nz, label_BE288
    ld   [hl], b
    rrca
    ld   [$FF1F], a
    ret  nz
    rra
    add  a, b
    rla
    jr   label_BE32F
    inc  sp
    jr   c, label_BE32D
    ld   d, c
    ld   l, a
    ld   b, c
    ld   a, a
    ld   b, c

label_BE30B::
    ld   a, a
    add  a, e
    rst  $38
    add  a, l
    db   $FD ; Undefined instruction
    dec  de
    pop  af
    ld   c, l
    db   $FC ; Undefined instruction
    add  a, [hl]
    db   $FC ; Undefined instruction
    dec  sp
    rst  0
    ld   c, h
    add  a, e
    jr   label_BE2A3
    jr   nz, label_BE2BD
    ld   b, c
    cp   a
    ret  c
    adc  a, a
    or   b
    ccf
    ld   h, e
    ccf
    ret  c
    rst  $20
    adc  a, d
    pop  af
    add  a, l
    ld    hl, sp+$83

label_BE32D::
    db   $FC ; Undefined instruction
    pop  bc

label_BE32F::
    cp   $E8
    jr   label_BE367
    call z, label_EC14
    add  a, d
    cp   $42
    cp   $42
    cp   $61
    rst  $38
    ld   [hl], c
    rst  $38
    or   c
    db   $10
    db   $D7
    jr   nc, label_BE3A3
    ld   sp, label_3FCF
    and  a
    rra
    ld   [hl], c
    rrca
    call c, label_BF703
    nop
    cp   $70
    xor  $18
    ld   a, a
    adc  a, c
    rst  $18
    and  $EE
    ld   a, [$FFF6]
    ld    hl, sp+$3B
    db   $FC ; Undefined instruction
    add  a, a
    ld   a, a
    ld   a, a
    ld   [bc], a
    ld   a, a
    ld   e, $FC
    sub  a, e
    ld   sp, hl

label_BE367::
    ld   h, a
    ld   [hl], a
    rrca
    ld   l, a
    rra
    sbc  a, $3F
    ld   a, [$FFFF]
    sbc  a, $08
    ei
    inc  c
    add  hl, sp
    adc  a, $F1
    cp   $E2
    db   $FC ; Undefined instruction
    rst  0
    ld    hl, sp+$1D
    ld   [rUNKN7], a
    add  a, b
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
    inc  h
    sbc  a, $6A
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

label_BE3A3::
    inc  hl
    jr   label_BE3CD
    ld   [label_1327], sp

label_BE3A9::
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

label_BE3CD::
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
    jr   c, label_BE3A9

label_BE3E2::
    nop
    ld   a, $00
    inc  e
    inc  bc
    nop
    rrca
    jr   nz, label_BE3FA
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

label_BE3FA::
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
    jr   c, label_BE46A
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
    jr   z, label_BE486
    dec  h
    ld   e, $12
    inc  e
    inc  d
    ld   [label_708], sp
    rlca
    ld   [label_BF008], sp
    ld   [hl], b
    sub  a, c
    sub  a, b
    db   $10
    db   $10
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

label_BE46A::
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

label_BE484::
    rst  0
    db   $FC ; Undefined instruction

label_BE486::
    sub  a, a
    db   $FC ; Undefined instruction
    sub  a, a
    db   $ED ; Undefined instruction
    ld   b, a
    ld   a, [hl]
    add  hl, hl
    add  hl, sp
    db   $10
    db   $10

label_BE490::
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
    jr   label_BE490
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
    ld   a, [hl]
    ld   bc, label_116E
    ld   a, [hl]
    ld   bc, label_BC13E
    ld   a, d
    dec  b
    nop
    ld   bc, label_BFF00
    jr   c, label_BE53A
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
    jr   nz, label_BE577
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

label_BE53A::
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
    ld   sp, label_BCA4F
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
    db   $10
    db   $10
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
    db   $10
    db   $38
    jr   z, label_BE5C4
    daa
    ccf
    inc  h
    ccf
    inc  h

label_BE58A::
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

label_BE59F::
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
    jr   c, label_BE59F
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

label_BE5C4::
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
    jr   label_BE5D8
    dec  b
    db   $FD ; Undefined instruction
    ei
    add  hl, de
    rla
    db   $D3 ; Undefined instruction
    rst  $18

label_BE5D8::
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
    jr   label_BE58A
    inc  h
    ld   c, [hl]
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   e, [hl]
    ld   d, d
    cp   l
    inc  a
    jp   label_BD500
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
    jr   label_BE61A
    jr   z, label_BE62C
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

label_BE61A::
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

label_BE62C::
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
    call z, label_BFF80
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
    jr   label_BE674
    dec  hl
    jr   nc, label_BE6B2
    ld   [hl], b
    adc  a, e
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FF8B]
    ld   a, [$FFFF]
    rst  $38
    nop
    nop

label_BE674::
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
    jr   label_BE68C
    call nc, label_D20C
    ld   c, $D1
    rrca
    pop  de
    rrca

label_BE68C::
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
    cp   [hl]
    ret  nz
    ld   [$FF80], a
    ld   a, [$FF9F]
    ld   a, [$FF9F]
    cp   a
    sbc  a, a
    sbc  a, a
    rst  $38
    rst  $38
    sbc  a, a
    cp   $FE

label_BE6B2::
    ld   a, l
    add  a, e
    rlca
    add  a, c
    adc  a, a
    ld   sp, hl
    adc  a, a
    ld   sp, hl
    ei
    ld   sp, hl
    ld   sp, hl
    rst  $38
    rst  $38
    ld   sp, hl
    nop
    nop
    nop
    nop
    jr   label_BE6DE
    inc  h
    inc  h
    ld   e, d
    ld   b, d
    ld   e, d
    ld   b, d
    ld   b, [hl]
    ld   h, [hl]
    ld   a, d
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

label_BE6DE::
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
    ld   a, [hl]
    ld   bc, label_17E
    ld   a, [hl]
    ld   bc, label_17E
    ld   a, [hl]
    ld   bc, $0100
    nop

label_BE6FF::
    ld   a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, [hl]
    cp   a
    sbc  a, a
    or   e
    or   e
    jp   hl
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
    rst  $38
    sbc  a, a
    cp   [hl]
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    rst  $38
    rst  $38
    cp   a
    or   e
    call nz, label_BFFC4
    ld   a, a
    ccf
    rst  $38
    ld   sp, hl
    ld   a, l
    add  a, c
    ld   bc, $8383
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    call label_1313
    cp   $FE
    db   $FC ; Undefined instruction
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
    cp   a
    ld   a, a
    ld   h, b
    ret  nz
    rst  $10
    adc  a, a
    xor  e
    sbc  a, h
    or   [hl]
    sbc  a, b
    cp   a
    sub  a, b
    cp   e
    sub  a, h
    cp   [hl]
    sub  a, b
    db   $FD ; Undefined instruction
    cp   $06
    inc  bc
    db   $EB ; Undefined instruction
    pop  af
    push de
    add  hl, sp
    xor  l
    ld   e, c
    cp   l
    add  hl, bc
    ld   a, l
    adc  a, c
    db   $FD ; Undefined instruction
    add  hl, bc
    rst  $38
    nop
    rst  $28
    nop
    rst  $28
    db   $10
    db   $FF
    inc  bc
    cp   l
    ld   b, $FA
    inc  c
    db   $FC ; Undefined instruction
    add  hl, bc
    db   $FD ; Undefined instruction
    add  hl, bc
    rst  $38
    nop
    rst  $28
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ret  nz
    cp   l
    ld   h, d
    ld   e, a
    jr   nc, label_BE89C
    sub  a, b
    cp   a
    sub  a, b
    nop
    nop
    jr   label_BE87C
    inc  h
    inc  h
    inc  sp
    inc  hl
    jr   c, label_BE88A
    ld   [hl], b
    ld   b, b
    ld   l, h
    ld   c, h
    db   $E4 ; Undefined instruction
    add  a, h
    nop
    nop
    jr   c, label_BE8AC
    ld   e, b
    ld   c, b
    cp   b
    adc  a, b
    inc  e
    inc  b
    ld   c, $02

label_BE87C::
    ld   l, [hl]
    ld   h, d
    ld   c, a
    ld   b, c
    cp   a
    sub  a, b
    cp   a
    sub  a, b
    cp   e
    sub  a, h
    cp   a
    sub  a, b
    cp   a
    sub  a, b

label_BE88A::
    cp   e
    sub  a, b
    cp   [hl]
    sub  a, c
    cp   a
    sub  a, b
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop

label_BE898::
    cp   a
    nop
    db   $DB
    jr   nz, label_BE898
    inc  b
    rst  $38
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

label_BE8AC::
    db   $DB
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

label_BE8C2::
    rst  $38

label_BE8C3::
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
    ld   a, [hl]
    add  a, b
    ld   a, [hl]
    add  a, b
    ld   a, [hl]
    add  a, b
    ld   a, [hl]
    add  a, b
    ld   a, [hl]
    add  a, b

label_BE8EC::
    nop
    add  a, b
    nop
    cp   $DF
    ld   h, b
    rst  $28
    jr   nc, label_BE8EC
    jr   label_BE8C2
    inc  e
    sbc  a, l
    ld   [hl], $3E
    ld   h, e
    ld   a, a
    pop  bc
    cp   a
    ret  nz
    ld   a, a
    ld   [hl], b
    cp   b
    or   a
    sbc  a, a
    rst  $18
    add  a, b
    ld   [$FF9F], a
    ld   [$FF5F], a
    ld   [$FFBF], a
    ld   a, a
    ld   a, a
    nop
    cp   $0E

label_BE912::
    dec  c
    db   $FD ; Undefined instruction
    ld   sp, hl
    ei
    ld   bc, $F907
    rlca
    ld   a, [$FD07]
    cp   $FE
    nop
    or   a
    sbc  a, b
    xor  d
    sbc  a, h
    sub  a, h
    adc  a, a
    res  0, a
    and  a
    ret  nz
    ret  nc
    ld   [$FFE0], a
    rst  $38
    rst  $38
    rst  $38
    ld   l, l
    sbc  a, c
    ld   d, l
    add  hl, sp
    add  hl, hl
    pop  af
    db   $D3 ; Undefined instruction
    pop  hl
    push hl
    inc  bc
    dec  bc
    rlca
    rlca
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$BD0C]
    ld   b, $BF
    ld   b, e
    rst  $38
    nop
    rst  $18
    nop
    sbc  a, $21
    cp   $00
    rst  $38
    nop
    ld   e, a
    jr   nc, label_BE912
    ld   h, b
    ei
    ret  nz
    ei
    inc  b
    rst  $18
    nop
    ei
    inc  b
    ei
    nop
    rst  $38
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
    db   $FD ; Undefined instruction
    add  hl, bc
    ld   a, l
    add  hl, bc
    db   $FD ; Undefined instruction
    add  hl, bc
    db   $29
    add  hl, hl
    db   $FD ; Undefined instruction
    add  hl, bc
    db   $FD ; Undefined instruction
    add  hl, bc
    db   $FD ; Undefined instruction
    add  hl, bc
    db   $09
    add  hl, bc
    db   $02
    ld   [bc], a
    rst  $18
    jr   nz, label_BE994
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
    rst  $38
    rst  $38
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
    ld   a, a
    ld   b, b
    rst  $28
    sbc  a, a
    rst  $18
    cp   a
    or   $BD
    db   $E8 ; add  sp, d

label_BEA0B::
    or   a
    jp   hl
    cp   a
    db   $E4 ; Undefined instruction
    cp   e
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    inc  b
    xor  $F2
    or   $FA
    sbc  a, [hl]
    ld   a, [$BA4E]
    ld   e, $EA
    adc  a, $7A
    ld   sp, label_393E
    ld   a, $3B
    inc  a
    inc  sp
    inc  a
    ld   [hl], c
    ld   a, [hl]
    cp   c
    cp   $FB
    cp   h
    di
    cp   h
    ret  c
    jr   c, label_BEA0B
    jr   c, label_BE9ED
    ld   a, b
    cp   b
    ld   a, b
    sbc  a, h
    ld   a, h
    jp  c, label_FE3E
    db   $3A ; ldd  a, [hl]
    cp   [hl]
    ld   a, d
    adc  a, $9A
    sub  a, $8E
    ld   a, [$C6BE]
    add  a, $AA
    add  a, d
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
    and  l
    ld   a, $39
    rra
    adc  a, e
    rrca
    dec  de
    rra
    rst  $38
    rst  $38
    ld   a, [$FB87]
    xor  a
    db   $DC
    call c, label_BFCA4
    sbc  a, [hl]
    cp   $D7
    push af
    rst  $10
    push af
    sbc  a, a
    db   $FD ; Undefined instruction
    scf
    db   $FD ; Undefined instruction
    rst  8
    rst  $38
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
    rst  $38
    rst  $38
    jp   nz, label_BAFF
    rst  0
    or   d
    rst  0
    and  a
    rst  8
    adc  a, b
    rst  $18
    sub  a, a
    ld    hl, sp+$F3
    ld    hl, sp+$FF
    rst  $38
    inc  bc
    rst  $38
    ld   a, l
    inc  bc
    ld   c, l
    add  a, e
    add  a, c
    di
    pop  af
    rst  $38
    rra
    rst  $38
    pop  de
    ccf
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
    ld   a, [$FF00+C]
    cp   a
    rst  8
    rst  $18
    ld   [$FF60], a
    ld   a, a
    ccf
    ccf
    ccf
    ccf
    add  hl, sp
    ld   a, $33
    inc  a
    ld   e, $F2
    ld   a, [$F6E6]
    ld   c, $0C
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    cp   b
    ld   a, b
    sbc  a, b
    ld   a, b
    pop  af
    cp   [hl]
    ld   sp, hl
    cp   [hl]
    db   $D3 ; Undefined instruction
    cp   h
    xor  a
    rst  $18
    rst  $18
    ld   [$FF60], a
    ld   a, a
    ccf
    ccf
    nop
    nop
    sbc  a, [hl]
    ld   a, d
    sbc  a, $3A
    or   [hl]
    ld   a, d
    ld   [$F6F6], a
    ld   c, $0C
    db   $FC ; Undefined instruction
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
    jp   hl
    ld   sp, label_1F1F
    ld   a, [$FB87]
    add  a, a
    ei
    xor  a
    ei
    add  a, a
    ld   a, [$FB87]
    xor  a
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    cpl
    reti
    adc  a, e
    db   $FD ; Undefined instruction
    rst  $38
    ld   sp, hl
    adc  a, a
    rst  $38
    rlca
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    add  a, [hl]
    cp   $FC
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
    ld    hl, sp+$90
    db   $FC ; Undefined instruction
    xor  b
    rst  $18
    or   a
    rst  8
    cp   c
    rst  0
    cp   l
    jp   label_C3A1
    pop  bc
    rst  $38
    rst  $38
    rst  $38
    dec  d
    dec  sp
    dec  d
    ei
    pop  af
    ei
    add  hl, de
    rst  $38
    ld   h, a
    sbc  a, a
    dec  bc
    add  a, a
    inc  bc
    rst  $38
    rst  $38
    rst  $38
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
    dec  e
    dec  e
    ldi  [hl], a
    ccf
    ld   c, l
    ld   [hl], e
    ld   h, a
    ld   a, d
    ld   d, d
    ld   e, a
    daa
    dec  a
    ld   e, l
    ld   h, [hl]
    cp   e
    rst  0
    ret  c
    ret  c
    inc  h
    db   $FC ; Undefined instruction
    or   d
    adc  a, $ED
    ld   e, a

label_BEC18::
    ld   d, e
    di
    db   $ED ; Undefined instruction
    cp   l
    cp   d
    ld   h, [hl]
    db   $E3
    db   $E3 ; Undefined instruction
    rst  $28
    ld   a, $FB
    dec  a
    ld   [$8F2C], a
    inc  c
    adc  a, e

label_BEC29::
    ld   c, $0B
    dec  c
    ld   a, [de]
    inc  e
    cpl
    inc  [hl]
    rst  $30
    ld   a, h
    rst  $18
    cp   h
    ld   d, a
    inc  [hl]
    rst  $30

label_BEC37::
    jr   nc, label_BEC18
    ld   [hl], b
    rst  $10
    cp   b
    ld   e, e
    inc  a
    db   $FD ; Undefined instruction
    ld   l, $FF
    rrca
    di
    inc  e
    db   $E8 ; add  sp, d
    jr   nc, label_BEC37
    jr   nz, label_BEC29
    ld   c, e
    pop  bc
    ld   e, h
    adc  a, b
    ld   a, [$FFC1]
    sub  a, b
    di
    ld   [$FF9F], a
    ld   a, b

label_BEC54::
    push hl
    ld   a, $72
    cpl
    adc  a, e
    ld   l, a
    dec  e
    rst  8
    sub  a, l
    ld   c, a
    ld   a, e
    add  a, $A7
    db   $76 ; Halt
    di
    ld   h, $F3
    ld   h, $F3
    ld   h, $F2
    ld   h, $A0
    ld   h, [hl]
    ret  nz
    ld   b, [hl]
    add  a, $80
    add  a, $7F
    cp   h
    ld   a, a
    or   e
    ld   a, a
    and  l
    ld   a, l
    rst  $20
    dec  a
    ld   d, a
    dec  sp
    add  hl, hl
    inc  e
    db   $76 ; Halt
    inc  c
    cp   $0E
    pop  af
    ld   de, label_28E8
    db   $DB
    ld   e, e
    db   $D3 ; Undefined instruction
    ld   d, e
    jp   label_8343
    sub  a, e
    add  a, c
    add  a, b
    inc  bc
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
    jp   label_8403
    rlca
    adc  a, b
    ld   c, $38
    ld   a, $2A
    cpl
    dec  de
    rra
    ld   c, $0E
    ld   bc, $C300
    ret  nz
    inc  hl
    ld   [rNR22], a
    ld   [hl], b
    rra
    ld   a, h
    ld   d, a
    db   $F4 ; Undefined instruction
    rst  $18
    ld    hl, sp+$7E
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
    jr   label_BED00
    jr   label_BED02
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
    jr   label_BED10
    jr   label_BED12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BED00::
    ret  nz
    cp   a

label_BED02::
    or   d
    db   $FD ; Undefined instruction
    call nc, label_ADDB
    or   e
    add  hl, sp
    daa
    ldd  [hl], a
    cpl
    inc  h
    ld   a, $24
    inc  a

label_BED10::
    inc  bc
    db   $FD ; Undefined instruction

label_BED12::
    ld   c, l
    cp   a
    dec  hl
    db   $DB
    or   l
    call label_E49C
    ld   c, h
    db   $F4 ; Undefined instruction
    inc  h
    ld   a, h
    inc  h
    inc  a
    ld   d, a
    ld   h, l
    ld   l, e
    ld   b, [hl]
    ld   [hl], d
    ld   c, h
    db   $3A ; ldd  a, [hl]
    inc  a
    rla
    inc  c
    dec  a
    ld   b, $7A
    rlca
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    and  [hl]
    rst  $28
    ld   [hl], d
    rst  0
    db   $3A ; ldd  a, [hl]
    sbc  a, $3C
    and  h
    ld   a, b
    jr   z, label_BED2C
    ld   d, b
    ld   [$FFE0], a
    add  a, b
    cp   b
    sbc  a, c
    cp   l
    cp   c
    cp   c
    cp   a
    cp   a
    cp   c
    cp   d
    cp   c
    pop  de
    sub  a, b
    push af
    sub  a, [hl]
    ld   [hl], a
    sub  a, $EF
    ld   a, [$FF00+C]
    ei
    db   $FD ; Undefined instruction
    ei
    rst  $38
    ld   sp, hl
    rst  $38
    ld   sp, hl
    ld   a, e
    pop  af
    push hl
    inc  bc
    ei
    rlca
    rst  $28
    add  a, b
    cp   c
    add  a, $6D
    db   $76 ; Halt
    ld   d, h
    ld   e, a
    ld   c, [hl]
    ld   c, a
    ld   l, a
    ld   c, a
    ld   l, b
    cpl
    ei
    inc  e
    db   $F4 ; Undefined instruction
    ld   c, $E5
    ld   e, $6D
    cp   $FB
    sbc  a, h
    or   [hl]
    sbc  a, d
    sbc  a, l
    or   l
    cp   a
    xor  c
    and  $C6
    rst  $20
    db   $E3 ; Undefined instruction
    ld   a, a
    inc  a
    rrca
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
    ld   e, $0B
    rrca
    db   $3A ; ldd  a, [hl]
    ccf
    dec  hl
    cpl
    ld   e, $1E
    dec  bc
    rrca
    ld   a, [de]
    rrca
    ld   a, $07
    ld   a, a
    inc  bc
    sbc  a, $F0
    ld   e, [hl]
    db   $FC ; Undefined instruction
    call nc, label_BF8F4
    ld   a, b
    ret  c
    ld   a, [$FF58]
    ld   a, [$FF78]
    ld   [$FFE0], a
    ret  nz
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
    jr   label_BEE00
    jr   label_BEE02
    inc  h

label_BEDEB::
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
    jr   label_BEE10
    jr   label_BEE12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BEE00::
    nop
    nop

label_BEE02::
    inc  bc
    inc  bc
    ld   b, $04
    ld   c, $08
    rrca

label_BEE09::
    ld   [label_80F], sp
    rlca
    inc  b
    dec  b
    ld   b, $00
    nop

label_BEE12::
    ret  nz
    ret  nz
    ld   h, b
    jr   nz, label_BEE67
    jr   nc, label_BEDE9
    jr   nc, label_BEDEB
    jr   nc, label_BEDAD
    ld   [hl], b
    jr   nz, label_BEE00
    ld    hl, sp+$90
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
    rst  $18
    and  b
    ld   a, c
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

label_BEE53::
    ld   h, b
    db   $EC ; Undefined instruction

label_BEE55::
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
    jr   c, label_BEE66

label_BEE66::
    ld   d, b

label_BEE67::
    jr   nz, label_BEE09
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
    rst  $20
    nop
    reti
    ld   [$FF34], a
    ld    hl, sp+$4A
    inc  a
    ld   d, $0C
    inc  c
    ld   b, $3A
    ld   b, $0E
    ld   [bc], a
    ld   h, [hl]
    nop
    sbc  a, e
    rlca
    xor  h
    rra
    ld   d, d
    inc  a
    ld   l, b
    jr   nc, label_BEECB
    ld   h, b
    ld   e, h
    ld   h, b
    ld   [hl], b
    ld   b, b
    ld   a, [hl]
    rst  $38
    jp   label_9DFF
    jp   label_C39D
    sbc  a, c
    db   $E3 ; Undefined instruction
    sbc  a, e
    rst  0
    sbc  a, l
    jp   label_81C3
    rst  $38
    rst  $38
    nop
    nop
    jp   label_813C
    ld   b, d
    jr   label_BEE53
    jr   label_BEE55
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

label_BEECB::
    rst  $20
    set  4, a
    db   $DB
    rst  $20
    rst  $30
    adc  a, a
    db   $F4 ; Undefined instruction
    call z, label_ABBB
    db   $DB
    sbc  a, e
    jp   hl
    adc  a, c
    or   l
    call label_BEC54
    ccf
    ccf
    rrca
    ld   [label_1019], sp
    inc  sp
    jr   nz, label_BEF4E
    ld   b, b
    ld   a, a
    ld   b, a
    ld   e, b
    ld   l, b
    cpl
    ccf
    inc  de
    inc  de
    nop
    nop
    ld   a, [hl]
    ld   bc, label_116E
    ld   a, [hl]
    ld   bc, label_BC13E
    ld   a, d
    dec  b
    nop

label_BEEFD::
    ld   bc, label_BFF00
    rrca
    ld   [label_1019], sp
    inc  sp
    jr   nz, label_BEF6E
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
    jr   nc, label_BEEFD
    jr   label_BEF0B
    inc  c
    ld   a, [$FF00+C]
    ld   a, d
    ld   b, [hl]
    add  hl, sp
    daa
    add  hl, sp
    daa
    pop  af
    adc  a, a
    pop  af
    rst  8
    or   c
    xor  a
    sbc  a, $9F
    db   $EB ; Undefined instruction
    adc  a, b
    cp   h
    bit  3, h
    ld   l, e
    ccf
    ccf
    adc  a, c
    ld   [hl], a
    adc  a, e
    ld   [hl], a
    rst  $28
    push af
    ld   a, l
    dec  de
    ld   de, label_19F7
    rst  $30
    ld   a, [de]
    or   $FC
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

label_BEF4E::
    nop
    nop
    dec  bc

label_BEF51::
    ld   b, $03

label_BEF53::
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
    jr   nz, label_BEF6A

label_BEF6A::
    nop
    nop
    nop
    nop

label_BEF6E::
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

label_BEF7E::
    ld   c, $03
    call c, label_BDC06
    ld   h, $67
    inc  e
    rst  $20
    inc  e
    adc  a, d
    ld   a, h
    db   $76 ; Halt
    ld    hl, sp+$BC
    ret  nz
    pop  hl
    nop
    cp   e
    ld   h, b
    db   $3A ; ldd  a, [hl]
    ld   h, h
    ld   h, [hl]
    jr   c, label_BEF7E
    jr   c, label_BEFEA
    ld   a, $6E
    rra
    dec  a
    inc  bc
    add  a, a
    nop
    and  c
    rst  $18
    db   $E3 ; Undefined instruction
    rst  $18
    db   $E3 ; Undefined instruction
    rst  $18
    rst  $38
    rst  $38
    sbc  a, l
    jp   label_DFE3
    db   $E3 ; Undefined instruction
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    nop
    jp   label_813C
    ld   b, d
    jr   label_BEF51
    jr   label_BEF53

label_BEFBA::
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

label_BEFCD::
    inc  h
    inc  a
    jr   label_BEFBA
    rst  $30
    dec  hl
    scf
    rst  $18
    push de
    db   $DB
    db   $DB
    sub  a, c
    sub  a, a
    xor  c

label_BEFDB::
    or   a
    ld   a, [hli]
    ld   [hl], $FC
    db   $FC ; Undefined instruction
    and  b
    ld   h, b
    ret  nc
    jr   nc, label_BEFCD
    jr   label_BEFDB
    inc  c
    ld   a, [$FF00+C]

label_BEFEA::
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

label_BF008::
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

label_BF03A::
    rrca
    rst  $38
    dec  [hl]
    rst  $38

label_BF03E::
    push af
    rst  8

label_BF040::
    sub  a, e
    db   $FC ; Undefined instruction

label_BF042::
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
    jp   hl
    rst  $18
    jr   label_BF092
    rst  $10
    jr   nc, label_BF03A
    jr   nc, label_BF03E
    jr   nc, label_BF040
    jr   nc, label_BF042
    jr   nc, label_BF084
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

label_BF084::
    inc  b
    rlca
    ld   [label_100F], sp
    rra
    jr   nz, label_BF0CB
    ld   [hl], c

label_BF08D::
    ld   c, [hl]
    ld   e, e
    ld   h, h
    nop
    nop

label_BF092::
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
    ret  z
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   c, label_BF08D
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

label_BF10F::
    ld   bc, label_BE0DF
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
    nop
    rlca
    rlca
    inc  e
    rra
    jr   nc, label_BF1A7
    ld   h, e
    ld   a, h
    ld   h, a
    ld   a, b
    rst  0
    ld    hl, sp+$C7
    ld    hl, sp+$00
    nop
    ld   [$FFE0], a
    jr   c, label_BF16E
    inc  c
    db   $FC ; Undefined instruction
    add  a, $3E
    and  $1E
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

label_BF1A7::
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

label_BF1BF::
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
    jr   label_BF236
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
    jp   hl
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

label_BF1FD::
    inc  bc
    rst  $38
    rst  $38
    nop
    nop
    inc  bc
    inc  bc
    inc  b
    rlca
    inc  b
    rlca
    ld   [label_310F], sp
    ld   a, $43

label_BF20D::
    ld   a, h
    ld   b, a
    ld   a, b
    db   $E3 ; Undefined instruction
    rst  $38
    inc  e
    rst  $38
    jr   label_BF1FD

label_BF216::
    ld   sp, label_3CE
    db   $FC ; Undefined instruction
    jp   label_C13C
    ld   a, $80
    ld   a, a
    rst  0
    rst  $38
    jr   c, label_BF223
    jr   label_BF20D
    adc  a, h
    ld   [hl], e
    ret  nz
    ccf
    jp   label_833C
    ld   a, h
    ld   bc, $00FE
    nop
    ret  nz
    ret  nz
    jr   nz, label_BF216

label_BF236::
    jr   nz, label_BF218
    db   $10
    db   $F0
    adc  a, h
    ld   a, h
    jp   nz, label_C23E
    ld   a, $87
    rst  $38
    jp   nz, label_BC0FF
    ld   a, a
    jr   nz, label_BF287
    ld   a, b
    ld   e, a
    ccf
    ld   c, a
    jr   c, label_BF28D
    ld   e, $19
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
    jr   c, label_BF261
    jr   c, label_BF263
    jr   c, label_BF265
    db   $10
    db   $FF
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
    ld   [bc], a
    cp   $04
    db   $FC ; Undefined instruction
    ld   e, $FA
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    db   $FC ; Undefined instruction
    ld   a, b
    sbc  a, b
    ld   h, b
    ld   h, b
    ld   [hl], e
    ld   d, e
    ld   [hl], l
    ld   d, [hl]
    ld   c, [hl]

label_BF287::
    ld   a, l
    dec  hl
    ccf
    dec  e
    inc  de
    add  hl, hl

label_BF28D::
    scf
    ldi  [hl], a
    ld   a, $7C
    ld   a, h
    jp  c, label_23E6
    rst  $38
    ld   a, l
    rst  $38
    adc  a, c
    adc  a, a
    ld   h, $2F
    ld   [hl], b
    ld   d, [hl]
    ld   d, b
    ld   [hl], b
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BF2C0
    jr   label_BF2C2
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
    jr   label_BF2D0
    jr   label_BF2D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BF2C0::
    nop
    nop

label_BF2C2::
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

label_BF2D0::
    nop
    inc  c

label_BF2D2::
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
    jr   c, label_BF2E1
    jr   c, label_BF2E3
    jr   c, label_BF2E5
    db   $10
    db   $FF
    nop
    rst  $38
    ld   hl, label_BC3FE
    db   $FC ; Undefined instruction
    ld   b, a
    ld    hl, sp+$87
    rst  $38
    ld   b, e
    rst  $38
    ld   [$FF7F], a
    or   b
    ccf
    ld   [hl], b

label_BF2F9::
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

label_BF309::
    rst  $38
    add  a, e
    rst  $38
    add  a, a
    rst  $38
    add  a, a
    rst  $38
    jr   label_BF2F9
    add  hl, sp
    add  a, $33
    call z, label_FC03
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_CFE
    rst  $38
    jr   label_BF309
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
    jr   nc, label_BF32F
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
    and  h
    inc  sp
    ld   l, c
    ld   b, a
    ld   [hl], a
    ld   c, a
    inc  l
    ld   e, a
    dec  bc
    inc  a
    sub  a, d
    nop
    and  [hl]
    ld   b, b
    rst  8
    jr   nc, label_BF3AB
    add  a, h
    sub  a, d
    adc  a, h
    xor  [hl]
    sbc  a, h
    db   $FD ; Undefined instruction
    sbc  a, [hl]
    db   $D3 ; Undefined instruction
    cp   [hl]
    dec  de
    ld   a, [$FF00+C]
    ld   h, b
    ld   [label_BD704], sp
    ld   hl, label_31EB
    cp   l
    ld   [hl], e
    call label_BCD7B
    ei
    ld   h, d
    adc  a, $50
    add  a, c
    db   $10
    db   $62
    ld   d, l
    adc  a, h
    xor  [hl]
    jp   nz, label_F2CE
    inc  [hl]
    ld   a, [$9C79]
    ld   c, b
    add  a, b
    ld   [bc], a
    sub  a, c
    ld   c, h
    inc  sp
    ld   l, $3E
    db   $3A ; ldd  a, [hl]
    ld   [hl], $5A
    ld   h, [hl]
    ld   d, d
    ld   l, [hl]
    ld   b, [hl]
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    nop
    inc  a
    nop
    nop
    ld   a, b
    ld   a, b

label_BF392::
    or   h
    call z, label_FEB2

label_BF396::
    jp   z, label_ACE
    ld   c, $0E
    ld   c, $00
    ld   b, $00
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_BF3C0
    jr   label_BF3C2
    inc  h

label_BF3AB::
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
    jr   label_BF3D0
    jr   label_BF3D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_BF3C0::
    add  hl, sp
    ld   b, [hl]

label_BF3C2::
    ld   bc, $013A
    ld   [bc], a
    ld   bc, label_BC162
    sub  a, d
    jr   nz, label_BF39E
    nop
    ld   d, d
    nop
    ld   h, c

label_BF3D0::
    jr   z, label_BF396

label_BF3D2::
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
    db   $10
    db   $FF
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

label_BF420::
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

label_BF446::
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

label_BF453::
    inc  c
    inc  [hl]
    inc  c
    ld   l, l
    jr   label_BF446
    jr   label_BF472
    ld    hl, sp+$13
    inc  a
    ret  c
    ccf
    ld   d, b
    ld   h, b
    ld   l, b
    jr   nc, label_BF491
    jr   nc, label_BF41D
    jr   label_BF420
    jr   label_BF453
    rra
    ret  z
    inc  a
    dec  de
    db   $FC ; Undefined instruction
    ld   h, b
    ccf

label_BF472::
    cpl
    jr   nc, label_BF48C
    jr   c, label_BF487
    ld   a, a
    db   $10
    db   $BF
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

label_BF487::
    rst  $38

label_BF488::
    ld   b, b
    rst  $38
    rlca
    rst  $38

label_BF48C::
    dec  de
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    jr   nc, label_BF490

label_BF491::
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
    jr   c, label_BF4B6
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

label_BF4B6::
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
    jp   nz, label_BE001
    add  a, b
    jr   c, label_BF488
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
    jr   nz, label_BF4E3
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

label_BF4FF::
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

label_BF528::
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

label_BF54E::
    rst  $38
    rst  $38
    rst  $10
    ccf
    ret  nc
    jr   c, label_BF528
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
    jr   c, label_BF54E
    inc  a
    reti
    ld   a, $90
    ld   a, a
    jr   nc, label_BF579
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    ret  nc
    ld   [rUNKN3], a
    jp   label_BC3F3
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

label_BF5FF::
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

label_BF642::
    adc  a, b
    nop

label_BF644::
    push de
    ld   [$887F], sp
    ld   [$FFDD], a
    rst  $38

label_BF64C::
    ld   [hl], b
    rst  $38
    nop
    rst  $38
    jr   c, label_BF642
    jr   nz, label_BF644
    ld   [hl], $E0
    inc  a
    ld   [$FF30], a
    db   $E8 ; add  sp, d
    jr   z, label_BF64C
    ccf
    ld   a, [$FF34]
    ld    hl, sp+$00
    nop
    jr   label_BF664

label_BF664::
    jr   z, label_BF676
    ld   b, b
    jr   nc, label_BF5FF
    ld   h, b
    call c, label_BC8E0
    ld   a, [$FF20]
    ld   a, [$FF14]
    rrca
    ld   e, $07
    dec  sp
    rlca

label_BF676::
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
    jr   label_BF687
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
    call c, label_CC56
    ld   a, l
    db   $EB ; Undefined instruction
    ccf
    pop  af
    inc  de
    pop  hl
    scf
    db   $E3 ; Undefined instruction
    ld   a, $FF
    ld   a, h
    jp   label_23E6
    rst  $38
    ld   a, l
    rst  $38
    ld   sp, hl
    adc  a, a
    or   $26
    reti
    ld   d, b
    rst  $18
    ld   [hl], b
    ld   a, [$FF0F]
    ret  nz
    ccf
    add  a, b
    ld   a, a
    jr   nz, label_BF6E7
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

label_BF6E7::
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

label_BF703::
    sub  a, e
    add  a, d
    pop  hl
    call c, label_BE3E2
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
    call z, label_BF8FF
    ccf
    jr   label_BF759
    call z, label_AE3F
    ld   b, e
    dec  [hl]
    jp   label_BFFE0
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

label_BF752::
    inc  b
    rrca
    ld   l, h
    rlca
    inc  a
    rlca
    inc  c

label_BF759::
    rla
    inc  d
    rrca
    db   $FC ; Undefined instruction
    rrca
    inc  l
    rra
    jr   z, label_BF752
    ld   l, b
    ld   a, [$FFDC]
    ld   [$FFF2], a
    nop
    jr   nc, label_BF76A

label_BF76A::
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_BF774

label_BF774::
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
    jr   nc, label_BF789
    ld   [rIE], a
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    ld   d, $F8
    ld   d, $F8
    inc  de
    db   $FC ; Undefined instruction
    jr   label_BF797
    inc  c
    rst  $38
    rlca
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ccf
    rst  $28
    ld   a, $F3
    ld   [hl], $C2
    ld   h, [hl]
    ld   b, d
    ld   l, [hl]
    ld   b, [hl]
    ld   a, [hl]
    ld   a, $3C
    adc  a, l
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    ld   a, b
    add  a, a
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
    jr   c, label_BF83A
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
    jr   nc, label_BF84A

label_BF83A::
    or   b
    db   $10
    db   $10
    ld   a, [$FF20]
    ld   h, b
    ld   bc, $0101
    ld   bc, label_1D1F
    scf
    inc  hl
    ld   a, $21

label_BF84A::
    cpl
    jr   nc, label_BF85D
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
    call z, label_BE484
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    db   $E3 ; Undefined instruction
    ld   b, [hl]
    push hl
    sbc  a, e
    db   $DB
    cp   l
    or   h
    rst  $28
    sbc  a, [hl]
    rst  $30
    rst  $38
    inc  c
    ei
    ld   d, $F5
    ld   e, $FF
    inc  d
    db   $E3 ; Undefined instruction
    inc  d
    rst  $30
    ld   [$80FF], sp
    rst  $38
    cp   b
    rrca
    rrca
    rra
    db   $10
    db   $3F
    jr   nz, label_BF917
    cpl
    daa
    ccf
    cpl
    inc  a
    cpl
    ccf
    ld   l, a
    ld   a, c
    ld   a, [$FFF0]
    ld    hl, sp+$08

label_BF8F4::
    db   $FC ; Undefined instruction
    inc  b
    inc  c
    db   $F4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $F4 ; Undefined instruction
    inc  a
    db   $F4 ; Undefined instruction
    db   $FC ; Undefined instruction
    or   $9E
    adc  a, b
    adc  a, b
    and  h
    add  a, h
    ld   [hl], e
    ld   b, e
    db   $3A ; ldd  a, [hl]
    jr   nz, label_BF938
    jr   nc, label_BF978
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
    ld   de, label_2608
    db   $10
    db   $EA
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

label_BF938::
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   e, h
    inc  c
    ld   a, [$AD02]
    ld   d, c
    ld   d, $0C
    jr   label_BF94C
    inc  e
    db   $10
    db   $33
    db   $10
    db   $33
    jr   nz, label_BF988
    inc  hl

label_BF94C::
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
    jr   nc, label_BF98B
    db   $10
    db   $38
    ld   [label_4C4], sp

label_BF978::
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

label_BF988::
    ld   b, h
    push bc
    cp   h

label_BF98B::
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
    ld   [hl], b
    ld   [hl], d
    ld   b, h
    ld   b, [hl]
    ld   a, e
    ld   [hl], d
    ld   l, l
    ld   e, [hl]
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
    sub  a, $6F
    cp   $3B
    cp   $03
    cp   $63
    cp   [hl]
    db   $D3 ; Undefined instruction
    rst  $38
    jp   nc, label_BD2DF
    adc  a, a
    ld   [hl], c
    rst  $20
    call z, label_B4DF
    daa
    db   $FC ; Undefined instruction
    ld   a, a
    ld    hl, sp+$7F
    ld   b, b
    ld   a, a
    ld   b, b
    ccf
    ld   b, b
    ld   a, a
    add  a, b
    rst  $28
    cp   a
    rst  $28
    cp   d
    rst  $28
    cp   a
    ld   [$FFBF], a
    rst  $38
    cp   a
    rst  $38
    add  a, b
    sbc  a, b
    rst  $38
    rst  $38
    ld   h, a
    rst  $30
    db   $FD ; Undefined instruction
    rst  $30
    ld   e, l
    rst  $30
    db   $FD ; Undefined instruction
    rlca
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   bc, rNR24
    rst  $38
    and  $FF
    ld   a, [$FFBF]
    sbc  a, b
    call z, label_EF4C
    inc  h
    push hl
    inc  h
    and  $24
    xor  $25
    call label_FF4B
    nop
    add  a, a
    nop
    ld   h, b
    nop
    db   $FC ; Undefined instruction
    inc  bc
    cp   c
    ld   a, a
    ld   a, a
    add  a, $8D
    di
    and  $F9
    rst  $38
    nop

label_BFA22::
    rst  8
    ccf
    ld   [hl], $F8
    rst  $38
    ret  nz
    ld   a, [$FF0F]
    ret  nz
    ccf
    add  a, b
    ld   a, a
    rrca
    rst  $38
    rst  $38
    nop
    di
    db   $FC ; Undefined instruction
    ld   l, l
    ld   e, $FF
    inc  bc
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    ld   bc, $F0FE
    rst  $38
    rst  0
    nop
    add  a, e
    nop
    jr   c, label_BFA46

label_BFA46::
    ccf
    ret  nz
    sbc  a, l
    cp   $FE
    ld   h, e
    or   c
    rst  8
    ld   h, a
    sbc  a, a
    rst  $38
    rrca
    ld   sp, hl
    add  hl, de
    ld   [hl], a
    ldd  [hl], a
    or   $24
    db   $E4 ; Undefined instruction
    inc  h
    inc  h
    inc  h
    ld   [hl], h
    and  h
    or   d
    jp   nc, label_E342
    or   c
    ld   h, c
    jr   label_BFA97
    cp   [hl]
    ld   a, b
    ld   b, [hl]
    db   $FC ; Undefined instruction
    cp   l
    add  a, $CE
    add  a, e
    add  a, e
    add  a, c
    db   $10
    db   $F0
    pop  af
    ld   a, [$FFB0]
    ld   h, c
    ld   h, c
    ld   hl, label_2163
    and  e
    ld   h, c
    ld   h, c
    jp   label_83C3
    ld   [$8F0F], sp
    rrca
    dec  c
    add  a, [hl]
    add  a, [hl]
    add  a, h
    add  a, $84
    push bc
    add  a, [hl]
    add  a, [hl]
    jp   label_C1C3

label_BFA90::
    ld   b, d
    rst  0
    adc  a, l
    add  a, [hl]
    jr   label_BFA22
    ld   a, l

label_BFA97::
    ld   e, $62
    ccf
    cp   l
    ld   h, e
    ld   [hl], e
    pop  bc
    pop  bc
    add  a, c
    rst  $38
    ld   e, $61
    ld   hl, label_BC340
    ret  nz
    ld   b, h
    ret  nz
    ld   c, b
    ld   [$FFA9], a
    ld   a, [$FF98]
    db   $FC ; Undefined instruction
    sbc  a, h
    db   $FD ; Undefined instruction
    ld   a, b
    sub  a, a
    add  a, h
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
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
    jr   label_BFA90
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
    ld   a, [hl]
    ld   bc, label_116E
    ld   a, [hl]
    ld   bc, label_BC13E
    ld   a, d
    dec  b
    nop
    ld   bc, label_BFF00

label_BFB00::
    jp  c, label_D74B
    sub  a, d
    rst  $10

label_BFB05::
    sub  a, h
    rst  $10
    sub  a, h
    rst  $10
    sub  a, h
    rst  $18
    sbc  a, h
    call label_BC48E
    rst  0
    or   d

label_BFB11::
    dec  e
    add  hl, de
    rrca
    dec  bc
    ld   c, $0E

label_BFB17::
    inc  c
    inc  c
    inc  c
    cp   h
    jr   c, label_BFB05
    jr   z, label_BFB17
    jr   c, label_BFB11
    ld   a, [$FFC0]
    add  a, b
    nop
    nop
    inc  c
    inc  bc
    scf
    rrca
    ld   a, e
    inc  e
    db   $E8 ; add  sp, d
    jr   nc, label_BFB00
    ld   h, c
    rrca
    rrca
    inc  bc
    ld   bc, $0000
    jr   nc, label_BFAF8
    db   $EC ; Undefined instruction
    ld   a, [$FFDE]
    jr   c, label_BFB54
    inc  c
    adc  a, e
    add  a, [hl]
    ld   c, l
    cp   b
    sbc  a, b
    ld   a, [$FFD0]
    ld   [hl], b
    ld   [hl], b
    jr   nc, label_BFB79
    jr   nc, label_BFB88
    inc  e
    rla
    inc  d
    rra
    inc  e
    ld   e, e
    jp   nc, label_BC9EB

label_BFB54::
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
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    cp   b
    and  b
    call c, label_BFE90
    ret  z
    ld   c, e
    ld   a, h
    add  hl, sp
    ld   a, $8C
    rlca
    ld   h, e
    inc  bc
    sbc  a, h
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    dec  bc
    rlca
    ei
    rlca
    db   $E3 ; Undefined instruction

label_BFB79::
    rra
    dec  b
    cp   $FC
    ld    hl, sp+$03
    nop
    ld   [$FFC0], a
    ld   [$FFC0], a
    ret  nc
    ld   [$FFDF], a
    ld   [$FFC7], a
    ld    hl, sp+$A0
    ld   a, a
    ccf
    rra
    ret  nz
    nop
    dec  e
    dec  b

label_BFB92::
    dec  sp
    add  hl, bc
    ld   a, [hl]
    inc  de
    jp   nc, label_9C3E
    ld   a, h
    ld   sp, $C6E0
    ret  nz
    dec  a
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
    jp   hl
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
    jr   label_BFB8A
    inc  h
    ld   c, [hl]
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   e, [hl]
    ld   d, d

label_BFBEC::
    cp   l
    inc  a
    jp   label_C300
    rst  $38
    sbc  a, c
    rst  $20
    inc  a
    jp   label_FF00
    inc  a
    jp   label_81C3
    ld   a, [hl]
    ld   a, [hl]
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    ld   c, $FC
    jr   label_BFBFA
    jr   nc, label_BFBEC
    ld   b, b
    ret  nz
    add  a, b
    add  a, b
    rrca
    rst  $38
    ld   a, a
    ld   a, [$FFDF]
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
    ld   a, [$FFFF]
    cp   $0F
    ei
    ld   bc, $00F0
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
    rst  $38
    ret  nz
    rst  $38
    ld   [hl], b
    ccf
    jr   label_BFC49
    inc  b
    rlca
    ld   [bc], a
    inc  bc
    ld   bc, label_BC001
    add  a, b
    ret  nz
    nop
    ret  nz
    nop
    add  a, b
    nop
    add  a, b

label_BFC49::
    nop
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
    add  a, b
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    nop
    nop
    inc  bc
    inc  bc
    inc  c
    rrca

label_BFC66::
    db   $10
    db   $1F
    inc  hl
    inc  a
    daa
    jr   c, label_BFCB4
    ld   a, b
    ld   b, a
    ld   a, b
    nop
    nop
    ret  nz
    ret  nz
    jr   nc, label_BFC66
    ld   [$C4F8], sp
    inc  a
    db   $E4 ; Undefined instruction
    inc  e
    ld  [$FF00+C], a
    ld   e, $E2
    ld   e, $1E
    ld   e, $21
    ld   hl, label_BC350
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

label_BFCA4::
    ret  z
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   h, a
    ld    hl, sp+$63
    db   $FC ; Undefined instruction

label_BFCB4::
    ld   sp, $B8FE

label_BFCB7::
    ld   a, a
    sbc  a, h
    ld   a, a
    adc  a, $3F
    rst  $20
    rra
    di
    rrca
    and  $1F
    add  a, $3F
    adc  a, h
    ld   a, a
    dec  e
    cp   $39
    cp   $73
    db   $FC ; Undefined instruction
    rst  $20
    ld    hl, sp+$CF
    ld   a, [$FF07]
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
    jr   label_BFD0E
    inc  a
    inc  a
    ld   a, [hl]
    ld   a, [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_BFCFF::
    rst  $38
    ld   bc, label_3FF
    cp   $05
    cp   $0B
    db   $FC ; Undefined instruction
    rrca
    ld    hl, sp+$1F
    ld   a, [$FF1E]
    ld   a, [$FF3C]
    ld   [$FF80], a
    rst  $38
    ret  nz
    ld   a, a
    ld   h, b
    ccf
    db   $10
    db   $3F
    db   $10
    db   $1F
    jr   label_BFD2B
    ld   [label_C0F], sp
    rlca
    ret  c
    ld   [$FFD0], a
    ld   [$FF60], a
    ret  nz
    and  b
    ret  nz
    ret  nz
    add  a, b
    ret  nz

label_BFD2B::
    add  a, b
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    dec  bc
    rlca
    dec  de
    rlca
    ld   a, $03
    dec  a
    inc  bc
    dec  a
    inc  bc
    ccf
    ld   bc, $011F
    ld   c, $01
    ld   h, b
    add  a, b
    ld   h, b
    add  a, b
    jr   nc, label_BFD06
    or   b
    ret  nz
    cp   b
    ret  nz
    sbc  a, h
    ld   [$FFDE], a
    ld   [$FFCF], a
    ld   a, [$FF06]
    ld   bc, $0106
    inc  c
    inc  bc
    dec  c
    inc  bc
    dec  e
    inc  bc
    add  hl, sp
    rlca
    ld   a, e
    rlca
    di
    rrca
    nop
    nop
    rlca
    rlca
    inc  e
    rra
    jr   nc, label_BFDA7
    ld   h, e
    ld   a, h
    ld   h, a
    ld   a, b
    rst  0
    ld    hl, sp+$C7
    ld    hl, sp+$00
    nop
    ld   [$FFE0], a
    jr   c, label_BFD6E
    inc  c
    db   $FC ; Undefined instruction
    add  a, $3E
    and  $1E
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

label_BFDA7::
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
    ld   [$FF03], a
    db   $FC ; Undefined instruction
    add  a, b
    rst  $38
    ld   [rIE], a
    inc  bc
    nop
    rrca
    nop
    rst  $38
    nop
    cp   $01
    ld    hl, sp+$07
    ret  nz
    ccf
    ld   bc, label_7FF
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
    nop
    rst  $38
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
    nop
    nop
    inc  bc
    inc  bc
    inc  c
    rrca

label_BFE66::
    db   $10
    db   $1F
    inc  hl
    inc  a
    daa
    jr   c, label_BFEB4
    ld   a, b
    ld   b, a
    ld   a, b
    nop
    nop
    ret  nz
    ret  nz
    jr   nc, label_BFE66
    ld   [$C4F8], sp
    inc  a
    db   $E4 ; Undefined instruction
    inc  e
    ld  [$FF00+C], a
    ld   e, $E2
    ld   e, $1E
    ld   e, $21
    ld   hl, label_BC350
    ld   b, c
    ld   b, h
    ret  nz
    ld   c, b
    ld   [$FFA9], a
    ld   a, [$FF98]
    ld    hl, sp+$98

label_BFE90::
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

label_BFE9C::
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
    cp   a
    rst  $38
    rst  $38
    ccf

label_BFEB4::
    cp   a
    ld   a, a
    rra
    rst  $38
    rra
    rst  $38
    jr   nz, label_BFE9C
    ld   b, b
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
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
    db   $DB
    jr   label_BFE90
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
    jr   label_BFF10
    jr   label_BFF12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop

label_BFEFF::
    nop

label_BFF00::
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

label_BFF10::
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
    jr   nz, label_BFF34
    jr   c, label_BFF36
    jr   nz, label_BFF38
    jr   nz, label_BFF3A
    ld   [hl], b
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    db   $10
    db   $FF
    db   $10
    db   $FF
    db   $10
    db   $FF
    db   $10
    db   $FF
    jr   c, label_BFF4C
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
    nop
    rlca
    rlca
    inc  e
    rra
    jr   nc, label_BFFA7
    ld   h, e
    ld   a, h
    ld   h, a
    ld   a, b
    rst  0
    ld    hl, sp+$C7
    ld    hl, sp+$00
    nop
    ld   [$FFE0], a
    jr   c, label_BFF6E
    inc  c
    db   $FC ; Undefined instruction
    add  a, $3E
    and  $1E
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra

label_BFF80::
    db   $FC ; Undefined instruction
    and  h
    rst  $38
    and  a
    rst  $38
    and  d
    rst  $38
    jp   nc, label_8AFF

label_BFF8A::
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

label_BFFA7::
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
    jr   label_BFFD0
    jr   label_BFFD2
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

label_BFFC4::
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

label_BFFD0::
    ld   d, c
    adc  a, b

label_BFFD2::
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

label_BFFE0::
    rst  $20
    nop
    db   $DB
    jr   label_BFF8A
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

label_BFFFF::
    nop
