section "bank60",romx,bank[$3C]

label_F0000::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F0007::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    cp   $01
    db   $FD ; Undefined instruction
    inc  bc
    di
    rlca
    rst  $20
    rrca
    rst  $18
    rra
    rst  $18
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_BFF
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    ret  nz
    rst  $18
    ret  nz
    rst  $18
    ld   [$FFEF], a
    ld   [$FFEF], a
    ld   a, [$FFF3]
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [$E0FE]
    cp   a
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [label_3FFF]
    rst  $38
    rra
    rst  $38
    rrca
    rst  $28
    rrca
    rst  8
    rra
    sbc  a, a
    rra
    sbc  a, a
    rra
    cp   a
    ccf
    sbc  a, a
    ccf
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ld   [$FFEF], a
    ld   [$FFEF], a
    ld   [rIE], a
    pop  af
    ld   a, [$FFFC]
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38

label_F00BC::
    rst  $38
    rst  $38
    rst  $38

label_F00BF::
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
    add  a, b
    cp   a
    ret  nz
    rst  $18
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
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld   [$FFDF], a
    ccf
    cp   a
    ccf
    cp   a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ccf
    ld   a, a
    ccf
    cp   a
    rrca
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ld   a, a

label_F00F7::
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ccf
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
    ld   sp, hl
    rst  $38
    rst  $30
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
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    ei
    adc  a, h
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
    rst  $30
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FAFE]
    cp   $F6
    cp   $CC
    db   $FD ; Undefined instruction
    inc  e
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    ld    hl, sp+$FB
    ld    hl, sp+$FB
    ld   a, [$FAFF]
    rst  $38
    ld   a, [$FFFF]
    ld   b, h
    rst  $38
    inc  b
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    ld   [label_1FFF], sp
    sbc  a, a
    rra
    rst  $18
    rrca
    rst  8
    rrca
    rst  $28
    rrca
    rst  $28
    rlca
    rst  $30
    ld   bc, $00F9
    cp   $3F
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    rlca
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
    ld   a, a
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
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $18
    ret  nz
    rst  $38
    ld   [$FFEF], a
    ld   [$FFF7], a
    ld   [$FFF7], a
    ld   a, [$FFF7]
    ld   a, [$FFFF]
    ld   [$FFDF], a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld    hl, sp+$F7
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    db   $FD ; Undefined instruction
    ld   bc, label_3FB
    ei
    inc  bc
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rra
    cp   a
    ccf
    cp   a
    ld   a, a
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
    rra
    rst  $38
    ccf
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
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $28
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   [rIE], a
    ret  nz
    rst  $38
    ret  nz
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
    db   $FC ; Undefined instruction
    ei
    ld   a, [$FFF7]
    ld   a, [$FFF7]
    ld   [$FFEF], a
    ret  nz
    rst  $18
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    db   $10 ; Undefined instruction
    jr   nz, label_F0255
    ld   b, b
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
    ld   sp, hl
    rlca
    rst  $30
    rra
    rst  $28
    ccf
    rst  $18
    rra
    rst  $18
    ccf
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    rst  $38
    rst  $38
    rlca
    rlca
    add  a, e
    ei
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
    rlca
    rst  $38
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    cp   a
    ret  nz
    rst  $38
    ret  nz
    rst  $18
    ld   [$FFCF], a
    ld   [$FFCF], a
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
    ld   [rIE], a
    rra
    sbc  a, a
    rrca
    rst  $28
    inc  bc
    pop  af
    nop
    db   $FC ; Undefined instruction
    nop
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
    rst  $38
    ld   [bc], a
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
    rra
    rra
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rra
    rst  $38
    scf
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
    rrca
    rrca
    rlca
    rst  $30
    nop
    ld   sp, hl
    nop
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $00FF
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
    add  a, c
    rst  $38
    ld   [$FFEF], a
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $38
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    ld   [rIE], a
    ld   [$FFDF], a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   b, $F9
    rlca
    rst  $28
    rra
    rst  8
    rra
    sbc  a, a
    ccf
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    rst  $38
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rra
    rst  $38
    rra
    rst  $20
    rst  $38
    rlca
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
    inc  e
    rst  $38
    rra
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
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
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   [$FFE3], a
    ret  nz
    rst  $18
    nop
    rst  $38
    cp   $FE
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    inc  b
    rst  $38
    inc  a
    rst  $38
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
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
    ld   bc, label_7FD
    rst  $30
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
    ld   bc, label_FFF

label_F03FF::
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction

label_F0402::
    rlca
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    rra
    rst  $18
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   bc, label_FFF
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    cp   a
    rst  $38
    rst  $38

label_F041F::
    rst  $38
    ld   a, a
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
    rst  $38
    rst  $38
    rra
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
    ld   a, [rIE]
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
    ld   a, [$F0FF]
    rst  0
    ld   a, [$FFB7]
    ld   a, [$FFBB]
    or   b
    ei
    or   b
    cp   e
    or   b
    ei
    ld   [hl], b
    ei
    ld   a, [$FFF7]
    ld   a, [$FFFF]
    ret  nz
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ei
    dec  b
    rst  $30
    dec  bc
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
    ld   bc, label_4FF
    rst  $38
    ld   [$00FF], sp
    cp   $01
    pop  af
    rrca
    rst  $20
    dec  de
    rst  $18
    ccf
    ccf
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
    ld   a, [bc]
    rst  $38
    ld   [label_20FF], sp
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    ld   bc, $00FF
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld    hl, sp+$FF
    call c, label_DFFA
    rst  $38
    cp   a
    cp   $7D
    cp   $7D
    rst  $38
    ret  nz
    cp   a
    sbc  a, b
    rst  $20
    or   h
    ei
    ret  z
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    nop
    ld    hl, sp+$07
    rst  $30
    rra
    rst  $38
    ccf
    rst  $38
    cp   a
    ccf
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rla
    rst  $28
    ccf
    rst  $18
    ld   a, a
    cp   a
    ccf
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    inc  bc
    ld    hl, sp+$FC
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
    rst  $38
    ld    hl, sp+$FF
    cp   $FF
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
    rst  $38
    nop
    ld   a, a
    nop
    rst  $18
    ret  nz
    rst  $38
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    cp   a
    sub  a, b
    rst  $28
    sbc  a, b
    rst  $30
    call nz, label_CCFB
    ei
    call z, label_FB
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    db   $FD ; Undefined instruction
    ld   bc, label_3FB
    di
    rlca
    di
    rlca
    rst  $30
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
    rlca
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, [hl]
    nop
    ret  z
    di
    di
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
    jr   nz, label_F0597
    rla
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ld   a, a
    ld   b, e
    cp   a
    adc  a, a
    ld   [hl], c
    sbc  a, b
    rst  $28
    rra
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    add  a, b
    ld   a, a
    adc  a, [hl]
    rst  $38
    sub  a, b
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, rIE
    nop
    nop
    rst  $38
    ccf
    ld   a, [$FFFC]
    ccf
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
    rrca
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ret  nz
    ld   a, [$FF3F]
    rlca
    cp   $FF
    ld   bc, rJOYP
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    ret  nz
    rst  $38
    ld   bc, $FEFF
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
    rlca
    nop
    rst  $38
    rst  $38
    nop
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
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
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    rrca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    ld   a, a
    rst  $38
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    nop
    nop
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
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
    ld   a, [$FFFF]
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
    add  a, c
    ret  nz
    rst  8
    add  a, b
    sbc  a, a
    ret  nz
    rst  $18
    ret  nz
    rst  $18
    ld   [$FFEF], a
    ld   a, [$FFF7]
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    jr   nz, label_F067B
    jr   nz, label_F067D
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
    nop
    ld   [$FFEF], a
    ret  nc
    rst  $18
    ret  nz
    rst  $18
    ret  nz
    rst  $18
    and  b
    cp   a
    and  b
    cp   a
    and  b
    cp   a
    rst  $38
    nop
    ld   [rIE], a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    nop
    ld   bc, label_3FE
    cp   $07
    ei
    inc  bc
    db   $FD ; Undefined instruction
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    ld   bc, label_3FF
    rst  $38
    ld   b, $FF
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    nop
    db   $E3 ; Undefined instruction
    rra
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    cp   a
    rst  $38
    rst  8
    rst  $38
    rst  $28
    rst  $38
    nop
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    ld   a, [$FFFF]
    ret  nc
    rst  $38
    nop
    nop
    ld   a, [$FFF7]
    ld   [rIE], a
    ld   [$FFEF], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [$FFF7], a
    ret  nz
    pop  af
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_F0715
    jr   nc, label_F0707
    ld   [label_20F7], sp
    rst  $38
    ld   b, b
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF0F]
    rst  $38
    nop
    ld   a, [$FF00]
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
    rlca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rrca
    rst  $28
    dec  bc
    rst  $28
    nop
    rst  $18
    ccf
    ld   a, a
    rst  $38
    rst  $38
    nop
    nop
    inc  bc
    rst  $28
    rst  $38
    nop
    ld   [$00FF], sp
    rst  $38
    nop
    rst  $38
    rrca
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
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
    rst  $38
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
    rlca
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
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
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
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
    rst  $38
    rst  $38
    ccf
    rst  $38
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
    rra
    rst  $38
    ld   [rIE], a
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $18
    rst  $38
    rlca
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
    nop
    cp   $FE
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    rst  $38
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
    ld   [rIE], a
    rst  $38
    rst  $38
    cp   $FF
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFF]
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, a
    call nz, label_F7C0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ld   [$00FF], sp
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
    cpl
    ld   d, a
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
    xor  b
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
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld   a, [$FFF3]
    ld   a, [$FFFF]
    ld   [$FFEF], a
    ret  nz
    rst  $18
    ret  nz
    rst  $18
    adc  a, h

label_F0891::
    ei
    inc  c
    ei
    inc  d
    ei
    db   $10 ; Undefined instruction
    jr   z, label_F0891
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    rlca
    rst  $30
    inc  bc
    ei
    ld   bc, $00FD
    ld   a, $C0
    rst  $18
    ld   [$FFEE], a
    ld   a, [$FFF7]
    ld    hl, sp+$FB
    rlca
    rst  $38
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
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
    add  a, a
    db   $FC ; Undefined instruction
    jr   c, label_F090D
    ret  nz
    rst  $18
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
    rst  $38
    nop
    rst  $38
    ret  nz

label_F08DF::
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
    inc  de
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
    db   $FC ; Undefined instruction
    rst  $38
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
    nop
    rst  $38
    nop
    rst  $38
    ret  nz

label_F090D::
    ccf
    jr   nc, label_F08DF
    nop
    rst  $38
    nop
    rst  $38

label_F0914::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_F091F
    rst  $38
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FE
    cp   $FC
    cp   $FE
    cp   $FE
    cp   $FC
    cp   $F8
    cp   $E0
    cp   $C0
    cp   $83
    ld   a, a
    db   $FC ; Undefined instruction
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    rst  $38
    rst  $38
    ld   bc, $FEFF
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
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $FEFF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFF]
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
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    inc  bc
    db   $FD ; Undefined instruction
    ld   a, [$FFFB]
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    ld   a, a
    rst  $38
    ld   [bc], a
    rst  $38
    inc  d
    rst  $38
    inc  b
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    ret  nz
    rst  $38
    cp   $FF
    rrca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [$0095], a
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, $E0FA
    rst  $38
    ld   a, l
    rst  $38
    inc  bc
    di
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    ret  nz
    rst  $38
    dec  a
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   a, [$FF6F]
    rst  $38
    jr   label_F0A2C
    ld   [rJOYP], a
    inc  bc
    cp   $00
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   a, [$FFFF]
    rst  $30
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    ld   b, b
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    ret  nz
    ld   c, a

label_F0A2C::
    ld   [$FFDF], a
    nop
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    and  b
    rst  $38
    nop
    rst  $38
    ld   [label_4FF], sp
    ei
    inc  bc
    db   $FD ; Undefined instruction
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_4FF], sp
    rst  $38
    ld   [bc], a
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
    ld   [bc], a
    rst  $38
    ccf
    rst  $38
    rst  $38
    pop  af
    dec  hl
    rst  $38
    inc  bc
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
    ld   c, $FF
    sub  a, h
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    cp   $FF
    cp   $FF
    ld   a, [$82FF]
    ld   bc, label_1FE
    cp   $01
    cp   $01
    cp   $00
    cp   $00
    cp   $06
    cp   $7C
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    cp   $FF
    ld   a, a
    sbc  a, a
    ld   a, a
    rst  $20
    ld   a, a
    ld   sp, hl
    ld   a, a
    cp   $7E
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    ld   h, b
    ld   a, a
    ld   a, b
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
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
    rst  8
    rst  $38
    rst  $28
    rst  $38
    rst  $20
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
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ret  nz
    rst  $18
    ld   [$FFFB], a
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    ld   b, b
    rst  $38
    jr   z, label_F0AEB
    jr   label_F0AF5
    nop
    rst  $38
    inc  bc
    cp   $03
    cp   $01
    cp   $02
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
    ld   [de], a
    rst  $38
    ld   a, [hl]
    pop  hl
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
    dec  b
    rst  $38
    sbc  a, a
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
    ld   bc, $B7FF
    rst  $38
    rst  $30
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
    ld   a, $FF
    ld   a, a
    rst  $30
    rst  $38
    rst  $30
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    ccf
    ld    hl, sp+$C1
    db   $FC ; Undefined instruction
    call nz, label_18F3
    add  a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, a
    rst  $38
    db   $FC ; Undefined instruction
    jp   label_CFF2
    adc  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  0
    rst  $38
    rrca
    ld   a, [$FFD8]
    ld   e, [hl]
    ld   d, d
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rrca
    ld   e, [hl]
    pop  hl
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  bc
    cp   $01
    cp   $01
    cp   $01
    cp   $1B
    cp   $3B
    add  a, $F7
    or   $FF
    cp   $3F
    ld   a, $00
    cp   $00
    cp   $00
    cp   $04
    cp   $FE
    ld   a, [$FEF6]
    cp   $FE
    ld   a, $FE
    rst  $30
    rst  $38
    di
    rst  $38
    ei
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, a
    rst  $38
    rst  8
    rst  $38
    rst  $30
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
    ld   a, [$FFFF]
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    ld    hl, sp+$FB
    ld    hl, sp+$FB
    ld    hl, sp+$FB
    ld   a, [$FFFF]
    ld   [$FFCF], a
    ld   b, $FD
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  c

label_F0BF5::
    ei
    ld   [label_8FF], sp
    rst  $38
    db   $10 ; Undefined instruction
    jr   z, label_F0BF5
    ld   [rIE], a

label_F0C00::
    db   $FC ; Undefined instruction
    rst  $38
    call z, label_80E3
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   a, [$FFFF]
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
    jr   nz, label_F0C31
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    cp   a
    ld   bc, label_27FE
    ret  c
    nop

label_F0C31::
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
    ld   c, $FE
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    ld   [bc], a
    jp   nz, label_C203
    dec  c
    ld   l, b
    dec  bc
    add  a, b
    rrca
    adc  a, b
    cp   $0F
    db   $FC ; Undefined instruction
    ld   a, e
    ld   a, [$FFFF]
    jp   nz, label_C23D
    dec  a
    ld   l, b
    sub  a, a
    add  a, b
    ld   a, a
    adc  a, b
    ld   [hl], a
    ldd  [hl], a
    rrca
    ld   b, b
    rra
    ret  nz
    cp   a
    xor  b
    ld   a, a
    and  b
    ld   a, a
    add  a, b
    ld   a, a
    ld   d, c
    ld   a, a
    ld   b, c
    rst  $38
    db   $10 ; Undefined instruction
    jr   nz, label_F0C73
    add  a, b
    ld   a, a
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   bc, $FEFF
    rst  $38
    ei
    ei
    db   $FD ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    cp   [hl]
    rst  $38
    ld   a, $7F
    ld   a, h
    rst  $38
    sbc  a, a
    rst  $38
    rst  $18
    rst  $38
    di
    rst  $38
    pop  af
    rst  $38
    jr   c, label_F0C9B
    cp   c
    rst  $38
    ld   e, b
    rst  $38
    ld   de, label_21AE
    ld   c, [hl]
    add  a, e
    db   $EC ; Undefined instruction
    sbc  a, e
    db   $E4 ; Undefined instruction
    set  4, h
    push bc
    jp   nc, label_DA65
    ld   h, c
    cp   $80
    ld   a, [hl]
    ld   b, b
    cp   [hl]
    ld   [$FF9E], a
    and  b
    sbc  a, $20
    sbc  a, $10
    xor  $B0
    xor  $B0
    xor  $80
    ld   a, b
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, c
    ld   a, [hl]
    sub  a, h
    ld   l, e
    call c, label_FF23
    nop
    rst  $38
    nop
    rlca
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    rst  $38
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   l, h
    sub  a, e
    ld   a, l
    ld   [bc], a
    ccf
    nop
    pop  af
    rst  $38
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
    ld   sp, hl
    rst  $38
    cp   $FF
    rra
    rst  $18
    jr   c, label_F0CCC
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    ei
    inc  [hl]
    set  7, b
    rst  $38
    cp   $FF
    ccf
    rst  $38
    ld   bc, $00FF
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
    ld    hl, sp+$FB
    ld   d, b
    ld   a, a
    ld   c, h

label_F0D29::
    adc  a, a
    ld   a, [hli]
    call nc, label_FB04
    nop
    rst  $38
    inc  bc
    rst  $38
    inc  b
    rst  $38
    rst  $30
    db   $FC ; Undefined instruction
    ret  nz
    rst  $38
    inc  e
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   a, [$FFFF]
    db   $FD ; Undefined instruction
    inc  bc
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ld   b, b
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   d, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_F0D29
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_AFE
    push af
    ld   bc, $89FE
    ld   [hl], h
    ld   h, d
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   l, b
    rst  $38
    ret  nz
    db   $FC ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    nop
    ret  z
    ld   [$FFE2], a
    ld   bc, label_2C1
    ld   b, d
    rla
    inc  d

label_F0D90::
    rst  $38
    ld   l, b
    db   $FC ; Undefined instruction
    jp   label_C3FC
    ret  z
    scf
    ld  [$FF00+C], a
    db   $FD ; Undefined instruction
    pop  bc
    ld   a, $42
    cp   l
    inc  d
    db   $EB ; Undefined instruction
    dec  de
    ld   [label_F0007], sp
    rrca
    ld   [label_F1057], sp
    sub  a, a
    db   $10 ; Undefined instruction
    or   $FF
    ld   a, h
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   [label_F00F7], sp
    cp   a
    ld   [label_F10F7], sp
    xor  [hl]
    db   $10 ; Undefined instruction
    or   $08
    ld   a, l
    add  a, c
    ld   a, [$FF00+C]
    cp   $FF
    cp   $FF
    cp   $FE
    sbc  a, a
    rst  $38
    adc  a, a
    cp   a
    add  a, a
    cp   a
    ld   b, e
    cp   e
    ldd  [hl], a
    rst  $10
    sbc  a, c
    rst  $38
    sbc  a, c
    rst  $38
    sbc  a, d
    rst  $38
    or   h
    rst  $38
    or   e
    rst  $38
    ld   a, d
    rst  $38
    cp   $7F
    inc  hl
    ccf
    ccf
    rst  $38
    ccf
    rst  $38
    add  hl, sp
    ei
    ld   hl, $C126
    sbc  a, $C1
    rst  $38
    ld   h, e
    ld   a, h
    jr   nz, label_F0D90
    ret  c
    rst  $38
    ret  nc
    rst  $38
    and  $FF
    scf
    rst  $38
    ld   e, a
    rst  $38
    cp   $FF
    rst  $18
    rst  $38
    sbc  a, a
    rst  $38

label_F0E00::
    pop  hl
    or   $E5
    ld   a, [label_F3EA1]
    and  l
    ld   e, d
    add  a, e
    ld   d, h
    dec  b
    xor  d
    daa
    db   $10 ; Undefined instruction
    ld   c, b
    jr   nc, label_F0E00
    jr   nc, label_F0E02
    ld   a, [$FFEE]
    ld   a, [$FFEE]
    ret  nc
    xor  $E0
    sbc  a, $80
    sbc  a, $00
    adc  a, [hl]
    add  a, b
    dec  c
    add  a, b
    nop
    add  a, b
    nop
    adc  a, e
    dec  bc
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    dec  c
    ld   [hl], d
    nop
    ld   a, a
    nop
    ld   a, a
    dec  bc
    ld   [hl], h
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    nop
    inc  hl
    nop
    cpl
    nop
    nop
    add  a, b
    add  a, b
    ld   l, h
    ld   l, h
    ld    hl, sp+$F8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  hl
    call c, label_D02F
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   l, h
    sub  a, e
    ld    hl, sp+$07
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
    ld   e, a
    nop
    ld   [bc], a
    add  a, b
    add  a, b
    pop  af
    pop  af
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   e, a
    and  b
    ld   [bc], a
    db   $FD ; Undefined instruction
    add  a, b
    ld   a, a
    pop  af
    ld   c, $FF
    nop
    add  a, b
    ld   a, a
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    dec  c
    nop
    add  a, b
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
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ccf
    ret  nz
    ccf
    rst  $38
    nop
    cp   a
    nop
    dec  l
    nop
    inc  d
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
    ccf
    rst  0
    nop
    rst  $38
    ld   [hl], b
    adc  a, [hl]
    ld   b, b
    cp   [hl]
    ret  nz
    ld   a, $FE
    nop
    rst  $38
    nop
    cp   [hl]
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
    ld   b, c
    ld   [$FF36], a
    ld   [hl], $DB
    ld   [label_1FE0], sp
    ld   e, a
    db   $FD ; Undefined instruction
    ld   a, a
    ld   a, [$FF00+C]
    ccf
    db   $FC ; Undefined instruction
    ld   a, a
    ld   [$FF5F], a
    scf
    ld    hl, sp+$2F
    db   $D3 ; Undefined instruction
    ld   a, h
    rst  $38
    rrca
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, a
    ld    hl, sp+$FD
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    nop
    cp   a
    nop
    db   $76 ; Halt
    ld   a, a
    ccf
    add  a, b
    rst  $38
    inc  sp
    and  e
    rst  $38
    call label_87FE
    ld   a, h
    call z, label_F00BF
    rst  $38
    ld   bc, rIE
    add  a, b
    add  a, a
    ld    hl, sp+$7F
    cp   h
    ld   sp, hl
    rst  $38
    ld    hl, sp+$7F
    ld   a, c
    ccf
    pop  bc
    ld   [hl], e
    ld   a, [hl]
    set  7, l
    ld   [de], a
    db   $FD ; Undefined instruction
    ld   [de], a
    ld   sp, hl
    inc  sp
    ld   sp, hl
    jp   nz, label_12F2
    ld   a, [$FF00+C]
    ld   [bc], a
    db   $D3 ; Undefined instruction
    cp   c
    inc  bc
    ld   a, [$FA02]
    ld   b, $F6
    rlca
    or   $0F
    db   $ED ; Undefined instruction
    rra
    dec  c
    sbc  a, a
    db   $E3 ; Undefined instruction
    add  hl, sp
    ld   d, a
    dec  b
    ret
    ld   [$C008], sp
    ld   b, b
    pop  bc
    ld   b, c
    pop  de
    ld   d, c
    add  a, d
    sub  a, d
    sbc  a, h
    rst  $18
    and  c
    or   d
    scf
    scf
    rst  $38
    rst  $30
    rst  $38
    cp   a
    rst  $38
    cp   [hl]
    rst  $38
    xor  [hl]
    rst  $28
    ld   l, l
    nop
    ld   bc, label_F041F
    call nc, label_E3E2
    pop  af
    rla
    scf
    dec  c
    cpl
    ccf
    ld   a, $2E
    rrca
    ld   sp, hl
    cp   $A4
    and  b
    sbc  a, c
    reti
    rst  $28
    ld   l, $DF
    ret  z
    db   $D0
    ret  nc
    cp   $C0
    sbc  a, $D0
    cp   e
    ld   l, h
    di
    ld   c, [hl]
    db   $D3 ; Undefined instruction
    db   $EC ; Undefined instruction
    sbc  a, l
    xor  d
    or   c
    xor  d
    di
    db   $E8 ; add  sp, d
    cp   a
    and  h
    ld   l, c
    db   $F4 ; Undefined instruction
    jr   z, label_F0F98
    ld   b, d
    ld   b, $C4
    ld   [bc], a
    jp   z, label_E640
    ld   b, h
    db   $E4 ; Undefined instruction
    inc  b
    db   $E4 ; Undefined instruction
    ld   b, b
    ld   h, d
    ld   [bc], a
    rst  $38
    ld   a, a
    rst  $38
    ld   l, d
    rst  $38
    jr   nc, label_F0FA6
    jr   z, label_F0FA8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   l, d
    dec  d
    jr   nc, label_F1005
    jr   z, label_F100F
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    ei
    rst  $38
    ld   h, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_F0FCD::
    nop
    rst  $38
    nop
    rst  $38
    nop
    ei
    inc  b
    ld   h, b
    sbc  a, a
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
    xor  a
    rst  $38
    add  a, d
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
    xor  a
    ld   d, b
    add  a, d
    ld   a, l
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_F1000::
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    rst  $38
    rst  $30
    rst  $38

label_F1005::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rla
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_F100F::
    nop
    db   $EC ; Undefined instruction
    inc  de
    rst  $30
    ld   [$00FF], sp
    rst  $38
    nop
    rla
    db   $E8 ; add  sp, d
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    ld   [$FFE0], a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    rst  $38
    nop
    nop
    rst  $38
    ld   [$FF1F], a
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    ld    hl, sp+$00
    rst  $38
    nop
    inc  e
    add  a, b
    add  a, b
    add  a, c
    ld   bc, $A4A4
    rst  $38
    rst  $38
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    ccf
    inc  e
    db   $E3 ; Undefined instruction
    add  a, b
    ld   a, a
    ld   bc, $A4FE

label_F1057::
    ld   e, e
    rst  $38
    nop
    cp   $01
    rst  $38
    nop
    ccf
    ret  nz
    ld   e, d
    rst  $38
    ei
    rst  $20
    rst  0
    add  a, e
    ld   b, d
    add  a, b
    pop  hl
    ld   bc, $A07C
    cp   h
    ld   b, e
    add  a, a
    sbc  a, $1A
    db   $E3 ; Undefined instruction
    ld   a, e
    sbc  a, e
    rst  $38
    ld   a, h
    rst  $38
    ld   a, a
    ld   a, a
    ld   a, [hl]
    ccf
    sbc  a, a
    sbc  a, h
    sbc  a, h
    ld   h, $A0
    ld   a, [de]
    ld   e, l
    ld   [hl], b
    db   $EC ; Undefined instruction
    sbc  a, e
    ld   [hl], b
    ld   a, d
    ld   [bc], a
    ld   bc, label_1A00
    ld   bc, label_1BC7
    ld   b, d
    cp   [hl]
    xor  d
    ldd  [hl], a
    ld   h, e
    ld   b, c
    sbc  a, a
    add  a, a
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    cp   $FE
    rst  $20
    db   $EC ; Undefined instruction
    inc  bc
    ld   bc, $B212
    ld   b, h
    inc  h
    inc  b
    ld   b, h
    add  a, h
    ld   b, h
    ret  nz
    ld   b, b
    adc  a, b
    adc  a, b
    adc  a, e
    adc  a, e
    sub  a, d
    sub  a, d
    ld   e, a
    ld   c, l
    rst  $18
    db   $DB
    cp   a
    cp   e
    cp   a
    cp   e
    ld   a, a
    ccf
    rst  $38
    ld   [hl], a
    rst  $38
    ld   [hl], h
    rst  $38
    ld   l, l
    add  a, e
    sub  a, d
    sub  a, c
    sub  a, d
    ld   hl, $0125
    dec  h
    ld   bc, $002B
    dec  hl
    inc  l
    ld   l, $2E
    ld   a, [hli]
    rst  $28
    ld   l, l
    db   $FD ; Undefined instruction
    ld   l, l
    ei
    jp  c, label_DADB
    push de
    call nc, label_D4D4
    db   $FD ; Undefined instruction
    pop  de
    ei
    pop  de
    ld   l, $0F
    add  a, [hl]
    xor  a
    xor  [hl]
    xor  a
    cpl
    ld   l, $16
    rla
    ld   [bc], a
    rla
    dec  c
    rlca
    rrca
    rlca
    sbc  a, $D0
    sub  a, $50
    cp   $50
    cp   $D0
    cp   $E8
    ld   [$F5E8], a
    ld   a, [$FFF7]
    ld   a, [$FFED]
    db   $F4 ; Undefined instruction
    cpl
    ld   a, d
    sbc  a, a
    ld   a, [$BA9D]
    rst  $18
    ld   a, [$BE4D]
    cpl
    cp   h
    rlca
    sbc  a, h
    and  $02
    xor  d
    add  a, b
    sbc  a, d
    nop
    ret  c
    ld   b, b
    jp  c, label_F0C00
    ld   b, b
    ld   l, h
    ld   b, b
    ld   h, h
    ld   h, b
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
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
    rst  $28
    ld   d, e
    xor  a
    add  a, a
    cp   $08
    cp   $D1
    ei
    di
    ld   a, a
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ld   c, a
    ld   e, e
    db   $ED ; Undefined instruction
    xor  a
    ld   l, e
    rst  $38
    ld   sp, hl
    ld   sp, hl
    pop  af
    jr   nc, label_F11A9
    rst  0
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_2EF], a
    ld   b, l
    and  d
    ld   l, e
    ld   [rOBPI], a
    ld   l, b
    ld   a, [de]
    ld   h, c
    or   l
    ld   bc, $D2E5
    db   $EB ; Undefined instruction
    db   $76 ; Halt
    rst  8
    cp   d
    cp   d
    or   [hl]
    or   h
    or   l
    push af
    ld   l, l
    push hl
    ld   l, e
    ld   l, d
    dec  de
    ld   a, [de]
    ld   d, [hl]
    call nc, label_F036
    dec  h
    dec  h
    db   $10 ; Undefined instruction
    inc  e
    ld   e, l
    inc  de
    sbc  a, e
    add  hl, sp

label_F11A9::
    cp   e
    db   $E4 ; Undefined instruction
    or   $D2
    or   $6A
    adc  a, $FF
    jp  c, label_AABA
    cp   [hl]
    and  d
    ld   [hl], a
    ld   h, h
    ld   a, l
    ld   b, h
    db   $ED ; Undefined instruction
    add  hl, bc
    db   $DB
    add  hl, bc
    ld   e, e
    ld   de, label_F2642
    ret  nz
    ld   b, h
    inc  c
    ld   c, h
    inc  c
    adc  a, h
    jr   z, label_F11F6
    ld   [label_F0A2C], sp
    ld   l, h
    ld   a, [bc]
    ld   c, h
    db   $DB
    sbc  a, c
    ei
    cp   e
    cp   a
    or   e
    ld   a, a

label_F11D7::
    ld   [hl], e
    ei
    db   $D3 ; Undefined instruction
    db   $DB
    db   $D3 ; Undefined instruction
    db   $DB
    sub  a, e
    cp   e
    or   e
    dec  bc
    rrca
    ld   b, d
    ld   b, a
    ld   b, c
    ld   b, a
    ld   h, c
    ld   h, l
    ld   h, l
    ld   h, l
    ld   b, c
    ld   h, c
    ld   bc, $0022
    ldi  [hl], a
    ei
    ld   a, [$FFFA]
    cp   b
    ld   sp, hl
    cp   b

label_F11F6::
    ei
    sbc  a, d
    rst  $38
    sbc  a, d
    rst  $18
    sbc  a, [hl]
    db   $DD
    db   $DD
    db   $DD
    db   $07
    rlca
    sbc  a, [hl]
    ld   b, c
    sbc  a, $59
    sub  a, $2B
    and  $AF
    ld   l, d
    push hl
    and  d
    db   $E3 ; Undefined instruction
    and  d
    or   c
    ret  z
    ld   h, [hl]
    ld   h, b
    ld   h, b
    jr   nz, label_F1285
    jr   nz, label_F1249
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   label_F11D7
    inc  e
    sub  a, [hl]
    ld   d, $07
    sub  a, [hl]
    ld   a, [$FFE3]
    rst  $38
    ei
    jr   label_F1238
    rst  $18
    rst  $18
    adc  a, l
    adc  a, l
    ld   d, e
    ld   [de], a
    di
    ld   a, [$FF69]
    add  hl, bc
    dec  c
    ld   de, label_400
    rst  $20
    ld   [$0020], sp
    ld   [hl], d
    nop
    xor  h
    ld   b, c
    inc  c
    inc  bc
    add  a, b
    ld   e, e
    ld   a, [bc]
    xor  l
    sub  a, b
    or   d
    jr   label_F1263
    ld   [hl], c

label_F1249::
    ld   b, c
    jp   z, label_BA8B
    db   $3A ; ldd  a, [hl]
    cp   d
    nop
    inc  h
    and  h
    ld    hl, sp+$FA
    ld   c, l
    dec  c
    and  $06
    adc  a, [hl]
    jr   c, label_F12D0
    ld   bc, $8145
    call label_F232
    adc  a, $A6

label_F1263::
    xor  $3E
    cp   $6C
    ld   a, $00
    ld   c, h
    and  c
    db   $76 ; Halt
    ld   a, [hli]
    db   $ED ; Undefined instruction
    sub  a, [hl]
    nop
    db   $D3 ; Undefined instruction
    ld   de, label_11B7
    ccf
    add  a, c
    db   $ED ; Undefined instruction
    pop  bc
    adc  a, e
    inc  sp
    xor  d
    add  a, h
    db   $3A ; ldd  a, [hl]
    ld   [de], a
    ld   l, a
    rlca
    ld   a, [bc]
    ld   c, h
    ld   c, d
    call z, label_DC58
    ld   e, b
    ld   e, h
    xor  l
    cp   c
    ld   h, l
    ld   l, a
    dec  de
    inc  de
    ld   [hl], h
    ld   [hl], b
    cp   e
    or   e
    ld   a, e
    inc  sp
    ld   a, e
    inc  hl
    ld   a, e
    and  e
    xor  e
    ld   b, d
    push af
    or   b
    rst  $38
    sbc  a, l
    adc  a, a
    adc  a, a
    nop
    inc  hl
    nop
    inc  hl
    nop
    inc  hl
    ld   d, c
    ld   [hl], e
    pop  hl
    di
    dec  hl
    dec  sp
    db   $EB ; Undefined instruction
    ld   a, e
    ld   [hl], d
    ld   a, e
    call c, label_DCDC
    call c, label_DCDC
    db   $8C
    adc  a, h
    db   $ED ; Undefined instruction
    inc  c
    rst  $28
    call nz, label_84EF
    or   $84
    dec  a
    ld   e, h
    ld   a, l
    ld   l, h
    ld   l, c
    ld   a, [hl]
    add  a, e
    cp   h
    rst  0
    ret  c
    rst  8
    ld   [$FF9F], a
    ld   [$FF7F], a
    nop

label_F12D0::
    sbc  a, [hl]
    add  a, d
    xor  $82
    db   $E8 ; add  sp, d
    add  a, b
    add  a, $40
    and  $20
    sbc  a, $00
    cp   [hl]
    nop
    cp   $00

label_F12E0::
    ld   a, l
    ld   sp, $E3EB
    add  a, b
    add  a, b
    add  a, [hl]
    nop
    jp   nz, label_1380
    inc  bc
    jr   z, label_F130E
    ld   [de], a
    db   $10 ; Undefined instruction
    ld   c, [hl]
    inc  d
    ld   [$007F], sp
    ld   a, c
    add  a, [hl]
    dec  [hl]
    ld   c, d
    xor  $10
    rst  $10
    ld   [label_2ED], sp
    inc  d
    db   $10 ; Undefined instruction
    add  a, c

label_F1304::
    or   $D6
    reti
    pop  bc
    ei
    db   $DB
    add  a, c
    add  a, c
    ld   b, a
    ld   b, a

label_F130E::
    rst  $18
    rra
    xor  d
    ld   b, l
    ld   l, a
    db   $10 ; Undefined instruction
    jr   nz, label_F133D
    jr   label_F131D
    jr   nz, label_F1399
    nop
    cp   b

label_F131D::
    nop
    jr   nz, label_F12E0
    ld   a, [$FF3E]
    reti
    rst  8
    ret  nc
    push bc
    sub  a, a
    add  a, h

label_F1328::
    ret  nz
    ret  nz
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    cp   b
    cp   b
    and  $E4
    cpl
    rst  8
    ld   h, $16
    ld   l, $16
    ld   l, c
    ld   [de], a
    scf
    ld   [$0112], sp
    ld   b, a

label_F133D::
    nop
    dec  de
    ld   [bc], a
    ld   h, h
    add  a, h
    dec  a
    dec  [hl]
    dec  hl
    and  h
    ret  nz
    add  a, b
    inc  a
    inc  l
    ld   h, a
    inc  bc
    rra
    rra
    rst  $30
    ld   [hl], b
    sbc  a, e
    ei
    jp   nz, label_F1C88
    inc  bc
    ccf
    ld   b, b
    jp   label_9C10
    ld   h, h
    and  b
    ld   b, c
    rst  8
    ld   c, a
    db   $E3 ; Undefined instruction
    xor  [hl]
    add  a, a
    jr   label_F1304
    and  b
    ld   e, a
    jr   nz, label_F1328
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00+C]
    ld   l, a
    jr   nz, label_F1364
    db   $10 ; Undefined instruction
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
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    inc  hl
    ld   hl, $A1BB
    ld   a, h
    ld   a, b
    add  a, $D8
    inc  h
    ld   h, b
    rra
    inc  c
    nop
    nop
    add  a, a
    inc  d
    call c, label_F0402
    ld   a, [de]
    add  a, e
    inc  b
    add  hl, sp
    ld   b, $99
    add  a, [hl]
    ld   [$FFF3], a
    rst  $38
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    ei
    rst  $38
    ld   a, a
    inc  e
    inc  e
    cp   a
    cp   a
    ld   [hl], e
    ld   [hl], e
    cpl
    ld   l, $EA
    and  b
    cp   b
    nop
    push bc
    add  a, c
    nop
    add  a, b
    db   $E3 ; Undefined instruction
    nop
    ld   b, b
    nop
    adc  a, h
    nop
    pop  de
    nop
    rla
    ld   c, b
    ld   b, a
    cp   b
    cp   b
    ld   b, [hl]
    rst  $28
    pop  hl
    ld   l, a
    cpl
    call nc, label_F142
    ld   l, h
    db   $10 ; Undefined instruction
    or   d
    scf
    ld   [$FFEF], a
    nop
    rlca
    inc  d
    ld   c, $90
    ld   b, b
    xor  a
    rra
    adc  a, [hl]
    rra
    db   $FC ; Undefined instruction
    dec  e
    ld   e, b
    sbc  a, d
    jr   nc, label_F1435
    ld    hl, sp+$7D
    ld   [$FFF9], a
    nop
    ld   h, b
    nop
    nop
    nop
    ret  nz
    nop
    ld   h, b
    add  a, b
    sub  a, b
    ld   b, b
    ld   [$FF80], a
    pop  de
    ld   e, $1E
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    cp   a
    cp   a
    sbc  a, a
    rst  $18
    ld   l, a
    rst  $28
    rra
    ld   e, a
    cp   a
    cp   a
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    add  a, h
    ld   e, e
    jr   nc, label_F142B
    ld   [bc], a
    nop
    ld   bc, label_3914
    add  hl, hl
    ld   [hl], b
    adc  a, c
    ld   a, a
    add  a, b
    ld   a, a
    nop
    xor  e

label_F1435::
    add  a, h
    rst  $38
    db   $FC ; Undefined instruction
    cp   $FF
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $38
    sub  a, $76
    db   $76 ; Halt
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $EB ; Undefined instruction
    inc  d
    jp   hl
    add  a, b
    ld   de, label_F08
    nop
    and  c

label_F144F::
    jr   nz, label_F144F
    nop
    cp   $00
    cp   $00
    cp   $00
    sub  a, $00
    cp   [hl]
    ld   a, [$FFFE]
    cp   $FE
    sbc  a, $7F
    adc  a, $35
    ld   sp, label_F3078
    ret  nz
    nop
    add  a, b
    nop
    ld   b, c

label_F146B::
    nop
    sub  a, b
    db   $10 ; Undefined instruction
    nop
    ld   a, [$FFF1]
    rlc  h
    add  a, a
    ld   [$C03F], sp
    ld   a, a
    add  a, b
    cp   [hl]
    ld   b, c
    ld   l, a
    add  a, b
    dec  c
    ld   a, [$FF00+C]
    ld   b, d
    ld   c, $03
    add  hl, de
    add  hl, bc
    dec  b
    inc  b
    jr   nc, label_F148A

label_F148A::
    dec  l
    ld   hl, label_303
    ld   a, h
    ld   a, l
    ld   c, c
    or   l
    ld   a, [$FF00+C]
    xor  $10
    ld   a, [$CF01]
    jr   nc, label_F146B
    ld   c, $FD
    ld   bc, label_383
    nop
    add  a, b
    ld   bc, label_2000
    ld   b, b
    ret  nz
    ret  nz
    and  b
    and  b
    add  a, b
    add  a, b
    ld   [$0000], sp
    ld   [rIE], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    ccf
    ccf
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    and  $00
    ld   [bc], a
    rlca
    inc  b
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
    ld   bc, $FD00
    db   $FD ; Undefined instruction
    cp   $FA
    rst  $38
    db   $FD ; Undefined instruction
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
    ld   l, b
    ld   [bc], a
    ld   e, b
    dec  h
    xor  $50
    ld   c, h
    jr   nz, label_F14E9

label_F14E9::
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    jp  c, label_EFDA
    xor  a
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   hl, label_3C0
    ret  nz
    rlca
    add  a, b
    add  hl, bc
    nop
    ld   b, c
    nop
    add  a, a
    nop
    rra
    nop
    ld   a, a
    ld   b, $5E
    ld   e, [hl]
    cp   $FE
    cp   $FE
    cp   $FE
    cp   $FE
    cp   $F8
    cp   $E0
    ld   a, [$FF88]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ccf
    ld   bc, label_7FF
    rst  $38
    rrca
    rst  $38
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
    ld   bc, label_7FF
    rst  $38
    rrca
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    nop
    ld   a, h
    nop
    ld   h, [hl]
    ld   b, $40
    nop
    ld   e, l
    ld   b, h
    nop
    add  a, b
    ld   d, $92
    add  hl, sp
    xor  b
    ld   b, $F9
    add  a, c
    ld   a, [hl]
    sbc  a, c
    ld   h, b
    cp   a
    ld   b, b
    and  [hl]
    add  hl, de
    ei
    add  a, h
    ld   l, e
    ld   h, h
    ld   b, [hl]
    ld   d, c
    ld   h, e
    inc  c
    ccf
    db   $10 ; Undefined instruction
    ret  nz
    rra
    db   $10 ; Undefined instruction
    ld   b, b
    rra
    db   $10 ; Undefined instruction
    inc  b
    adc  a, a
    ld   [bc], a
    sbc  a, e
    ld   l, h
    rst  8
    jr   nz, label_F15D4
    nop
    rst  $28
    nop
    cp   a
    nop
    rst  $28
    nop
    di
    ld   [$8C71], sp
    ld   a, [$FF00]
    cp   $00
    rst  $38
    nop
    ret  nz
    nop
    cp   a
    ld   a, a
    call c, label_E33F
    inc  e
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    nop
    rst  $38
    nop
    ret  nz
    ccf
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    nop
    rst  $38
    nop
    ld   b, b
    add  a, b
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $38
    nop
    adc  a, a
    ld   [hl], b
    ld   [hl], a
    ld    hl, sp+$7F
    ld   b, $FF
    nop

label_F15D4::
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
    ld   [hl], b
    jp   label_AF80
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    dec  c
    pop  af
    ld   [de], a
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
    ld   [bc], a
    cp   $0C
    rst  $30
    ld   d, $F3
    ld   h, d
    ld   b, a
    ld   b, [hl]
    push af
    ld   [hl], h
    db   $1E
    ld   e, $E7
    ld   b, $7F
    nop
    ccf
    ret  nz
    ret  z
    jr   nz, label_F159F
    db   $10 ; Undefined instruction
    and  b
    adc  a, d
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    cp   $80
    ld   a, $C0
    ld   a, a
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
    ld   a, a
    rst  $38
    rst  $38
    ld   a, a
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
    ld   a, a
    inc  e
    inc  b
    add  a, e
    pop  bc
    ld   a, [$FF00+C]
    ld   bc, label_741
    add  a, [hl]
    inc  e
    dec  [hl]
    pop  hl
    ld   [$FFE0], a
    ld   b, b
    di
    ret  z
    ld   a, [hl]
    ld   c, h
    dec  bc
    ld   a, [de]
    cp   [hl]
    cp   h
    ld   a, c
    ld   a, b
    call z, label_1EC2
    ld   bc, $C0FF
    ret
    ld   bc, label_10B0
    sub  a, h
    nop
    ld   l, $20
    inc  d
    nop
    cpl
    inc  hl
    ld   d, [hl]
    ld   b, [hl]
    ld   c, e
    inc  bc
    ld   [hl], $C8
    rrca
    ld   [rOBPD], a
    sub  a, h
    pop  af
    adc  a, $EB
    db   $F4 ; Undefined instruction
    ret  nc
    call z, label_10A9
    or   h
    ld   c, b
    ld   a, a
    nop
    ld   e, a
    ld   b, b
    ld   a, a
    jr   nz, label_F1706
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    jp   label_77F
    rst  $38
    ld   bc, $00FF
    cp   a
    nop
    sbc  a, a
    ld   b, b
    sbc  a, [hl]
    ld   bc, label_33C
    jr   nc, label_F16AB
    ld   a, [$FF0F]
    ld    hl, sp+$07
    adc  a, a
    ld   [hl], b
    di
    inc  c
    dec  c
    cp   $7B
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction

label_F16AB::
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    ld   [hl], e
    adc  a, h
    add  a, a
    ld   a, b
    rlca
    ld   a, [$FC03]
    ld   bc, $00FE
    rst  $38
    db   $EC ; Undefined instruction
    ld   bc, label_19EF
    rst  $30
    inc  bc
    rst  $30
    dec  c
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    sbc  a, a
    ld   [$FFEF], a
    ld   e, $FF
    rlca
    rst  $30
    rrca
    db   $FD ; Undefined instruction
    dec  b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rra
    ld   b, b
    sbc  a, a
    or   b
    rrca
    ld    hl, sp+$AF
    ld   e, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, [hl]
    ld   [$FF5E], a
    ld   [hl], b
    ld   d, $F0
    ld   b, $50
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_F1706::
    nop
    rst  $38
    ld   bc, label_3FF
    rst  $38
    rlca
    rst  $38
    rlca
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
    ld   bc, label_3FF
    rst  $38
    rlca
    rst  $38
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   sp, $F5FF
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
    ld   sp, $F5FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   h, h
    ld   h, b
    ld   h, $20
    add  hl, de
    db   $10 ; Undefined instruction
    sub  a, b
    adc  a, h
    inc  c
    ld   b, c
    ld   bc, $010B
    jp   z, label_9B08
    inc  b
    reti
    ld   b, $E6
    add  hl, bc
    ld   h, e
    inc  c
    ld   [hl], e
    add  a, b
    cp   [hl]
    ld   b, b
    db   $F4 ; Undefined instruction
    ld   a, [bc]
    dec  [hl]
    jp   nz, label_3377
    nop
    nop
    ld   e, e
    ld   bc, $00C4
    ld   b, e
    inc  bc
    pop  de
    ld   b, c
    ld   d, e
    ld   d, e
    ld   b, [hl]
    ld   b, $88
    ld   b, h
    rst  $38
    nop
    and  h
    ld   e, d
    dec  sp
    call nz, label_F00BC
    ld   l, $90
    xor  h
    nop
    cp   c
    ld   b, b
    ld   a, [hl]
    add  a, c
    rst  $38
    ld   [rNR22], a
    db   $10 ; Undefined instruction
    rst  $28
    rst  $18
    rst  $18
    rra
    rra
    adc  a, a
    adc  a, a
    rst  $28
    rst  $28
    ld   a, a
    nop
    rra
    nop
    rst  $28
    nop
    nop

label_F1797::
    db   $10 ; Undefined instruction
    nop
    ld   [rJOYP], a
    ld   [hl], b
    nop
    stop
    rra
    rst  $38
    push hl
    add  hl, de
    rst  $38
    nop
    db   $E1
    pop  hl
    ret  z
    ret  z
    adc  a, h
    add  a, b
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    ld  [$FF00+C], a
    ld   [bc], a
    ld   [$FF1F], a
    ld   a, [$FE07]
    ld   bc, $001E
    scf
    nop
    ld   [hl], e
    inc  c
    inc  e
    nop
    rra
    ld   [rIE], a
    ld   [$FFBF], a
    add  a, b
    rst  $38
    nop
    add  a, a
    sbc  a, b
    ld   b, b
    ld   bc, label_303
    nop
    nop
    jr   nz, label_F17F0
    rlca
    ld    hl, sp+$5F
    ld   [$FF7F], a
    add  a, b
    ld   h, a
    jr   nz, label_F1797
    ld   b, b
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $18
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
    ld    hl, sp+$91
    sub  a, b
    cp   e
    cp   d

label_F17F0::
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    ld   b, $00
    ld   l, [hl]
    nop
    ld   b, h
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, e
    ld   a, a
    sub  a, a
    ld   a, a
    rst  8
    ld   a, a
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    inc  bc
    ld   a, a
    rla
    ld   a, a
    ld   c, a
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FF
    rst  $38
    rst  8
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
    ld   bc, label_3FF
    rst  $38
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    adc  a, a
    rst  $38
    rst  $18
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
    rst  $38
    inc  bc
    rst  $38
    adc  a, a
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   z, label_3CC0
    ld   e, h
    rlca
    rst  $30
    inc  bc
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    add  a, [hl]
    ld   a, a
    inc  sp
    and  b
    dec  a
    ld   [bc], a
    add  a, e
    and  b
    ld   [$00F8], sp
    cp   $00
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    xor  b
    ld   e, a

label_F1880::
    cp   a
    cp   a
    cp   $FE
    sbc  a, $9E
    cp   b
    ld   a, b
    ld   a, e
    ei
    ccf
    ei
    ld   bc, $00ED
    rst  $38
    ld   b, b
    nop
    ld   bc, label_2100
    ld   b, b
    add  a, a
    ret  nz
    add  a, h
    add  a, b
    jr   nz, label_F1880
    ld   a, [de]
    db   $FC ; Undefined instruction
    ld   bc, rIE
    ei
    db   $DB

label_F18A3::
    rst  $18
    jr   nc, label_F18E4
    adc  a, b
    sub  a, [hl]
    rst  $30
    rst  $30
    cp   a
    cp   a
    rst  $18
    rst  $18
    rst  $20
    rst  $20
    nop
    inc  b
    inc  h
    inc  b
    rst  0
    rrca
    ld   a, a
    rla
    ld   [label_F0000], sp
    nop
    jr   nz, label_F18BE

label_F18BE::
    jr   label_F18C0

label_F18C0::
    di
    and  $38
    cp   a
    inc  sp
    xor  l
    ld   h, c
    ld   b, b
    inc  sp
    ld   d, l
    add  a, b
    ld   a, [$FF00+C]
    inc  sp
    ld   c, d
    jp   nc, label_150C
    push bc
    push bc
    sbc  a, $DF
    rst  $18
    rst  $20
    db   $E8 ; add  sp, d
    and  $6D
    ld   l, e
    call z, label_A5CC
    cp   b
    ld   d, [hl]
    ld   d, [hl]
    add  a, e
    add  a, e

label_F18E4::
    ret  z
    ld   b, b
    dec  de
    db   $00
    nop
    ld   e, d
    jr   nz, label_F18A3
    ld   h, e
    inc  hl
    inc  bc
    ld   [bc], a
    xor  c
    nop
    ld   a, h
    add  a, b
    scf
    adc  a, b
    dec  l
    xor  $A5
    or   l
    call c, label_9C96
    ld   b, b
    db   $FC ; Undefined instruction
    ld   bc, $C8C9
    push de
    ret  nz
    sbc  a, l
    sbc  a, h
    scf
    db   $3A ; ldd  a, [hl]
    ld   b, l
    ld   d, b
    pop  bc
    ld   c, d
    ld   b, c
    db   $10 ; Undefined instruction
    sbc  a, [hl]
    ld   [hl], $00
    ld   a, [hli]
    inc  d
    ld   h, d
    nop
    call nz, label_2E04
    cp   h
    ld   [hl], $B6
    cp   [hl]
    ld   e, b
    ld   h, b
    nop
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    and  b
    rst  $38
    ld   h, d
    cp   a
    ld   c, a
    call z, label_F500
    nop
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    and  b
    ld   a, a
    call label_F57B
    ld   a, [bc]
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    rst  $38
    ld   [$00F1], sp
    rst  $38
    ld   a, [$FF2F]
    ld   a, $F5
    rla
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    ld   b, b
    add  a, b
    rlca
    ld   sp, hl
    nop
    rst  $38
    jr   c, label_F1977
    or   $0F
    db   $FD ; Undefined instruction
    inc  de
    rst  $38
    ld   [bc], a
    rst  $38
    nop
    ret  nc
    sub  a, b
    sub  a, b
    db   $10 ; Undefined instruction
    nop
    dec  b
    db   $FC ; Undefined instruction
    nop
    rst  $38
    sbc  a, b
    rst  $38
    ccf
    ld   d, b
    inc  hl
    ld   a, [$FF00+C]
    ld   b, d
    ld   l, a
    add  a, b
    rst  0
    cp   b
    ld   [bc], a
    db   $FD ; Undefined instruction
    nop
    rst  $38
    ld   [rIE], a
    ld   e, a
    cp   a
    ld   a, [$FF00+C]
    inc  bc
    inc  bc
    rlca
    rlca
    ld   [$A00F], sp
    cpl
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    sbc  a, b
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    pop  af
    rlca
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    sbc  a, b
    ld   a, a
    jp   hl
    db   $E8 ; add  sp, d
    rst  $30
    or   $1F
    xor  $25
    jp  c, label_FE01
    ld   bc, $D1FE
    cp   $D9
    nop
    ld   d, $10
    ld   [$F000], sp
    ld   a, [$FF6A]
    cp   $00
    cp   $00
    cp   $0E
    cp   $00
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
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rra
    ld   [rTAC], a
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
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
    ld   [hl], e
    adc  a, h
    ld   d, b
    xor  a
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    ccf
    ret  nz
    rra
    ld   [$FF1F], a
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
    nop
    db   $FC ; Undefined instruction
    nop
    db   $E8 ; add  sp, d
    ld   bc, $0000
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
    ld   bc, $FFFE
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $F4 ; Undefined instruction
    nop
    ei
    nop
    ld   a, [$FF00+C]
    xor  c
    nop
    ld   bc, $0006
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
    ld   b, $F9
    rst  $38
    nop
    nop
    db   $E3 ; Undefined instruction
    inc  b
    ld   h, h
    ld   bc, label_2E2
    nop
    inc  l
    jr   nz, label_F1B05
    call nz, label_28C0
    nop
    nop
    db   $E3 ; Undefined instruction

label_F1A93::
    inc  e
    ld   h, h
    sbc  a, a
    ld  [$FF00+C], a
    dec  e
    ld   bc, label_23FF
    rst  $18
    rst  8
    ld   a, a
    ccf
    rst  $38
    rst  $38
    nop
    ret  nz
    sub  a, b
    add  a, b
    ld   b, b
    ld   bc, label_701
    dec  b
    dec  bc
    dec  c
    inc  sp
    ccf
    ld   [rIE], a
    nop
    nop
    cp   a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    ei
    cp   $F7
    db   $FD ; Undefined instruction
    ld   [rIE], a
    rst  $38
    nop
    add  hl, bc
    ld   c, $33
    ld   e, $82
    dec  a
    inc  e
    or   e
    jr   nc, label_F1A93
    ld   h, b
    sbc  a, a
    add  a, b
    ld   a, a
    nop
    nop
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    call label_13FE
    db   $FC ; Undefined instruction
    add  a, a
    ld    hl, sp+$1F
    ld   [$FF7F], a
    add  a, b
    rst  $38
    nop
    rrca
    inc  c
    rlca
    ld   b, $0F
    rrca
    rra
    ld   c, $1B
    dec  bc
    rrca
    rlca
    inc  bc
    inc  bc
    nop
    nop
    inc  c
    di
    ld   b, $F9
    rrca
    ld   a, [$FF0E]
    pop  af
    dec  bc
    db   $F4 ; Undefined instruction
    rlca
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    rst  $38
    nop
    nop
    rst  $38
    nop

label_F1B05::
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

label_F1B11::
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
    rst  $38
    cp   a
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ld   a, [$FFFF]
    cp   $FF
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
    ld   a, [$FFFF]
    cp   $FF
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
    rst  $38
    nop
    rst  $30
    nop
    db   $FD ; Undefined instruction
    nop
    cp   $00
    xor  c
    nop
    nop
    rlca
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
    rlca
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    dec  sp
    nop
    sub  a, $00
    ld   c, d
    nop
    rra
    add  a, b
    jr   nc, label_F1B11
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
    ld   b, c
    cp   $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ei
    nop
    ld   b, $58
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
    ld   e, b
    and  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    nop
    ei
    nop
    ret  nc
    nop
    add  a, b
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
    rlca
    rst  $38
    ld   a, [$FFFF]
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    nop
    ldd  [hl], a
    nop
    ld   a, [$FF00]
    nop
    stop
    nop
    ld   bc, $0007
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rra
    rst  $28
    rst  $38
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$00
    ld   h, $00
    add  a, $00
    ld   b, b
    dec  b
    nop
    ld   h, b
    nop
    nop
    nop
    nop
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    dec  b
    ld   a, [$9F7C]
    rst  $38
    rst  $38
    ld   bc, $FBFF
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   b, c
    ld   b, c
    rrca
    cp   b
    ld   a, [$FF80]
    ld   bc, label_F3901
    ld   a, a
    ld   bc, label_F3EFF
    db   $FD ; Undefined instruction
    ld   a, [bc]
    push af
    ld   b, c
    cp   [hl]
    cp   b
    ld   b, a
    adc  a, a
    ld   a, a
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    dec  b
    cp   $3E
    jp   label_F2869
    jr   nc, label_F1CA4
    ld   h, b
    nop
    jr   label_F1C57
    db   $10 ; Undefined instruction
    rlca
    rst  $38
    sbc  a, [hl]
    di
    ld   [hl], b
    rst  $38
    ld   l, b
    sub  a, a
    ld   h, a
    sbc  a, a
    rra
    rst  $38
    ld    hl, sp+$FF
    db   $10 ; Undefined instruction
    ld   bc, $83FE
    ld   a, h
    ld   a, a
    add  a, b
    adc  a, a
    rrca
    db   $10 ; Undefined instruction
    ld   h, b
    sbc  a, a
    rrca
    db   $FD ; Undefined instruction
    inc  a
    db   $EB ; Undefined instruction
    ret  nz
    ld   e, a
    nop
    cp   l
    nop
    ld   sp, hl
    ld   a, a
    rst  $38
    ld   a, [$FFFF]
    ld   h, c
    rst  $38
    dec  b
    cp   $EB
    db   $F4 ; Undefined instruction
    ld   e, a
    and  b
    cp   l
    ld   b, d
    ld   sp, hl
    ld   b, $F1
    cp   $8E
    and  c
    ret  nz
    rra
    nop
    ld   a, a

label_F1C88::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    rst  $38
    and  c
    sbc  a, $1F
    ld   [$FF7F], a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    cp   $00
    db   $FC ; Undefined instruction

label_F1CA4::
    nop
    db   $FC ; Undefined instruction
    nop
    ld   [rJOYP], a
    ret  nz
    ld   bc, label_7C1
    rlca
    rrca
    rrca
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    ld   [$FF1F], a
    ret  nz
    ccf
    pop  bc
    ld   a, $07
    ld    hl, sp+$0F
    ld   a, [$FF09]
    add  hl, bc
    rrca
    rrca
    rra
    rra
    ccf
    ld   a, $7F
    ld   a, a
    rst  $38
    cp   $FF
    cp   $FF
    cp   $09
    or   $0F
    ld   a, [$FF1F]
    ld   [$FF3E], a
    pop  bc
    ld   a, a
    add  a, b
    cp   $01
    cp   $01
    cp   $01
    ld   a, [$FF10]
    ld   a, a
    ld   c, a
    rst  $38
    rst  $30
    rst  $38
    ld   sp, hl
    cp   $FF
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    rst  $38
    ld   a, [$FFFF]
    ld   c, [hl]
    cp   a
    add  a, a
    rst  $38
    ld    hl, sp+$FF
    db   $FD ; Undefined instruction
    cp   $FE
    db   $FD ; Undefined instruction
    cp   $FF
    rst  $38
    rst  $38
    nop
    nop
    rrca
    rrca
    jp   label_FFFF
    rst  $38
    inc  bc
    inc  sp
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    ld   [rIE], a
    rrca
    rst  $38
    rst  $18
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    inc  sp
    rst  8
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    cp   b
    nop
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $F2
    db   $F4 ; Undefined instruction
    inc  a
    nop
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  a
    jp   label_FF
    rst  $38
    nop
    sub  a, b
    ld   bc, label_30F8
    rra
    rst  $28
    ld   [label_F30FF], sp
    ld   a, a
    ld   a, a
    ld   l, $04
    db   $F4 ; Undefined instruction
    nop
    ei
    ld   [hl], c
    cp   $FF
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  hl
    rst  $18
    db   $F4 ; Undefined instruction
    dec  bc
    ei
    inc  b
    inc  bc
    inc  bc
    nop
    inc  bc
    rst  $38
    inc  c
    nop
    rst  $38
    ret  nz
    rst  $38
    rst  $30
    inc  e
    inc  e
    inc  bc
    nop
    ld   a, a
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_3FF], sp
    db   $FC ; Undefined instruction
    ld   a, a
    add  a, b
    or   b
    adc  a, a
    rra
    ld   a, [$FF00+C]
    ld   a, a
    rlca
    rst  $38
    rra
    ld   [$FFE0], a
    rra
    nop
    ld   a, a
    nop
    rst  $38
    or   b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    rra
    ld   [$FF7F], a
    add  a, b
    rst  $38
    nop
    nop
    rst  $38
    inc  bc
    rst  $38
    ld   a, a
    ld   a, [$FFF0]
    jp   label_3F00
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    rst  $38
    inc  b
    rst  $38
    ld   [label_F03FF], sp
    db   $FC ; Undefined instruction
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    nop
    rst  $38
    rst  0
    cp   $8F
    ld   bc, $8E71
    nop
    rst  $38
    nop
    call label_8000
    nop
    nop
    ld   bc, label_1FF
    rst  $38
    ld   bc, $8EFE
    ld   [hl], c
    rst  $38
    nop
    call label_8032
    ld   a, a
    nop
    rst  $38
    ld   [hl], b
    cp   $FF
    reti
    add  a, b
    rst  $38
    nop
    cp   $00
    ld   a, [$FF00]
    ld   a, [$FF07]
    add  a, e
    daa
    dec  h
    ld   [bc], a
    rst  $38
    reti
    ld   h, $FF
    nop
    cp   $01
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    add  a, e
    ld   a, h
    dec  h
    jp  c, label_FEC0
    nop
    ld   [rJOYP], a
    and  b
    ld   a, [bc]
    ld   a, [de]
    rra
    rra
    sbc  a, a
    rra
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    cp   $01
    ld   [$FF1F], a
    and  b
    ld   e, a
    ld   a, [de]
    push hl
    rra
    ld   [$FF1F], a
    ld   [$FF7F], a
    add  a, b
    rst  $38
    nop
    nop
    ld   bc, $0000
    nop
    ld   hl, $C0C4
    ld   l, a
    ld   l, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $00FE
    rst  $38
    ld   hl, $C0DE
    ccf
    ld   l, a
    sub  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    rrca
    ld   b, b
    inc  bc
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    rst  $38
    nop
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ret  nz
    ccf
    rlca
    rlca
    rrca
    rrca
    rra
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    ld   [rTAC], a
    ld    hl, sp+$0F
    ld   a, [$FF1F]
    ld   [$FF7F], a
    add  a, b
    ld   a, a
    add  a, b
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld   [$FF1F], a
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld   [$FF1F], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $18
    ld   [$FFF9], a
    ret  nz
    jp   hl
    ld  [$FF00+C], a
    ld    hl, sp+$F8
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ld  [$FF00+C], a
    db   $FD ; Undefined instruction
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    cp   d
    nop
    nop
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    cp   d
    ld   b, l
    nop
    rst  $38
    rst  0
    jr   c, label_F1EDE
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    call c, label_400
    nop
    nop
    push bc
    push bc
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    call c, label_423
    ei
    nop
    rst  $38
    push bc
    db   $3A ; ldd  a, [hl]
    rst  $38
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   e, b
    nop
    nop
    nop
    nop
    nop
    nop
    sub  a, e
    sub  a, e
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    ld   e, b
    and  a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    sub  a, e
    ld   l, h
    rst  $38
    nop
    ld   [bc], a
    nop
    add  a, c
    ld   bc, label_40C
    ccf
    rrca
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $18
    rst  $38
    inc  bc
    nop
    rst  $38
    ld   bc, label_4FE
    ei
    rrca
    ld   a, [$FF7F]
    add  a, b
    ld   a, a
    add  a, b
    rst  $18
    jr   nz, label_F1F42
    db   $FC ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $E3 ; Undefined instruction

label_F1F42::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ld   [rIE], a
    add  a, b
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$07
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    ei
    rst  $38
    ld   h, b
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
    ei
    inc  b
    ld   h, b
    sbc  a, a
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
    ld   [hl], a
    rst  $38
    ld   bc, $00FF
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
    ld   [hl], a
    adc  a, b
    ld   bc, $00FE
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
    rst  $30
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
    nop
    rst  $30
    ld   [label_1FE0], sp
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
    ld   h, c
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
    rst  $38
    ld   h, c
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
    ld   a, [hl]
    nop
    jp   label_A500
    nop
    sbc  a, c
    nop
    sbc  a, c
    nop
    and  l
    nop
    jp   label_F3E00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2000::
    ld   bc, $0110
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, label_314
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
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    dec  b
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
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, label_814
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
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    dec  c
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
    inc  d
    ld   bc, label_1014
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    dec  d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, label_1A14
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    inc  e
    inc  d
    dec  e
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
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    daa
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   l, $14
    cpl
    inc  d
    jr   nc, label_F2120
    ld   sp, label_3210
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    inc  [hl]
    inc  d
    ld   [hl], $14

label_F2120::
    scf
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
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   b, a
    inc  d
    ld   c, b
    inc  d
    ld   bc, label_F0914
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   d, c
    inc  d
    ld   bc, label_F1214
    inc  d
    ld   d, e
    inc  d
    ld   d, h
    inc  d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   e, b
    inc  d
    ld   e, c
    inc  d
    ld   e, d
    inc  d
    ld   e, e
    inc  d
    ld   e, h
    inc  d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   h, e
    inc  d
    ld   h, h
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   l, l
    inc  d
    ld   l, [hl]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    inc  d
    ld   [hl], d
    inc  d
    ld   [hl], e
    inc  d
    ld   [hl], h
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   a, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    inc  d
    ld   a, [hl]
    inc  d
    ld   a, a
    inc  d
    add  a, b
    inc  d
    add  a, c
    inc  d
    add  a, d
    inc  d
    add  a, e
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
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
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    sub  a, d
    inc  d
    sub  a, e
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    sbc  a, b
    inc  d
    sbc  a, c
    inc  d
    sbc  a, d
    inc  d
    sbc  a, e
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    sbc  a, [hl]
    inc  d
    sbc  a, a
    inc  d
    and  b
    inc  d
    and  c
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    and  h
    inc  d
    and  l
    inc  d
    and  [hl]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    xor  h
    inc  d
    xor  l
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    or   d
    inc  d
    or   e
    inc  d
    or   h
    inc  d
    or   l
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $BA14
    inc  d
    cp   e
    inc  d
    cp   h
    inc  d
    cp   l
    inc  d
    cp   [hl]
    inc  d
    cp   a
    inc  d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    jp   label_C414
    inc  d
    push bc
    inc  d
    add  a, $14
    rst  0
    inc  d
    ret  z
    inc  d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    adc  a, d
    inc  d
    jp   z, label_CB14
    inc  d
    call z, label_CD14
    inc  d
    adc  a, $14
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    rst  8
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    adc  a, c
    ld   d, h
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $D014
    inc  d
    pop  de
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    ret  c
    inc  d
    jp   nc, label_D310
    db   $10 ; Undefined instruction
    inc  d
    push de
    inc  d
    sub  a, $14
    ret  c
    inc  d
    ret  c
    inc  d
    rst  $10
    inc  d
    ret  c
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $DA14
    db   $10 ; Undefined instruction
    inc  d
    db   $DB
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    sbc  a, $10
    rst  $18
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld  [$FF00+C], a
    inc  d
    db   $E3 ; Undefined instruction
    inc  d
    db   $E4 ; Undefined instruction
    inc  d
    adc  a, d
    inc  d
    adc  a, d
    inc  d
    push hl
    inc  d
    and  $14
    adc  a, d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d

label_F2642::
    ld   bc, $0114
    inc  d
    ld   bc, $E714
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   [$E814], a
    db   $10 ; Undefined instruction
    inc  d
    ld   [$EB14], a
    inc  d
    db   $EC ; Undefined instruction
    inc  d
    db   $ED ; Undefined instruction
    inc  d
    xor  $14
    rst  $28
    inc  d
    ld   a, [$FF14]
    pop  af
    inc  d
    ld   a, [$FF00+C]
    ld    hl, sp+$14
    ld   a, [$FF14]
    di
    inc  d
    db   $F4 ; Undefined instruction
    inc  d
    cp   b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $F514
    db   $10 ; Undefined instruction
    inc  d
    rst  $30
    inc  d
    or   $14
    rst  $30
    inc  d
    ld    hl, sp+$14
    or   $14
    rst  $30
    inc  d
    ld    hl, sp+$14
    ld   sp, hl
    inc  d
    ld   a, [$FB14]
    inc  d
    ei
    inc  d
    add  a, b
    inc  d
    add  a, b
    ld   d, h
    db   $F4 ; Undefined instruction
    inc  d
    cp   b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $C214
    ld   d, b
    pop  bc
    ld   d, b
    cp   b
    ld   d, b
    db   $FC ; Undefined instruction
    inc  d
    db   $FD ; Undefined instruction
    inc  d
    db   $FC ; Undefined instruction
    inc  d
    db   $FD ; Undefined instruction
    inc  d
    db   $FC ; Undefined instruction
    inc  d
    adc  a, d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $C214
    ld   d, b
    xor  c
    ld   d, b
    adc  a, d
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
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $B114
    ld   d, b
    adc  a, d
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
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $B914
    ld   d, b
    cp   b
    ld   d, b
    adc  a, d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $C254
    ld   d, b
    pop  bc
    ld   d, b
    xor  c
    ld   d, b
    xor  c
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0114
    inc  d
    ld   bc, $0014
    ld   a, h
    ld   a, [hli]
    dec  e
    adc  a, l
    add  hl, hl
    add  a, a
    dec  e
    add  hl, bc
    ld   h, $8F
    db   $3A ; ldd  a, [hl]
    xor  e
    ld   b, l
    ld   a, [$FF35]
    inc  c
    ld   c, [hl]
    ld   c, l
    ld   d, d
    ld   d, b
    ld   d, [hl]
    or   e
    ld   h, d
    ld   d, d
    ld   b, [hl]
    sub  a, h
    ld   c, [hl]
    ld   d, [hl]
    ld   b, l
    rst  $30
    ld   e, [hl]
    nop
    ld   a, h
    ld   a, [hli]
    dec  e
    adc  a, l
    add  hl, hl
    add  a, a
    dec  e
    add  hl, bc
    ld   h, $8F
    db   $3A ; ldd  a, [hl]
    ld   c, l
    ld   d, d
    bit  1, l
    inc  c
    ld   c, [hl]
    xor  e
    ld   b, l
    rst  $30
    ld   e, [hl]
    or   e
    ld   h, d
    ld   d, d
    ld   b, d
    ld   d, d
    ld   d, d
    sub  a, h
    ld   d, [hl]
    ld   d, b
    ld   d, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2860::
    cp   c
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2869::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2870::
    cp   c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2880::
    ld   a, c
    ld   e, l
    ld   [label_B00], sp
    adc  a, h
    ret  nc
    db   $F4 ; Undefined instruction
    ld   h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2890::
    ld   a, c
    ld   d, d
    ld   [label_B00], sp
    xor  c
    rst  $20
    sbc  a, a
    ld   bc, label_F3EC0
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   [$FF79], a
    ld   b, a
    ld   [label_B00], sp
    call nz, label_16D0
    and  l
    set  1, c
    dec  b
    ret  nc
    db   $10 ; Undefined instruction
    jr   z, label_F292A
    inc  a
    ld   [label_B00], sp
    ld   a, [$FF12]
    and  l
    ret
    ret
    ret  z
    ret  nc
    inc  e
    and  l
    jp   z, label_F39C9
    ld   sp, $0008
    dec  bc
    inc  c
    and  l
    jp   z, label_F3EC9
    ret  nc
    ld   b, $A5
    set  1, c
    ld   a, [hl]

label_F28D0::
    ld   a, c
    ld   h, $08
    nop
    dec  bc
    add  hl, sp
    call label_C48
    ret  nc
    inc  [hl]
    and  l
    ret
    ret
    add  a, b
    ret  nc

label_F28E0::
    ld   a, c
    dec  de
    ld   [label_B00], sp
    ld   [$EAEA], a
    ld   [$A9EA], a
    ld   bc, label_F0FCD
    inc  c
    ret  nc

label_F28F0::
    ld   a, c
    db   $10 ; Undefined instruction
    nop
    dec  bc
    ld   c, h
    jr   nz, label_F2900
    ld   [$EAEA], a
    ld   [label_F20EA], a
    ld   [label_1EA], a
    rst  $38
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    stop

label_F2910::
    add  hl, hl
    ld   [bc], a
    xor  a
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
    ld   [hl], c
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F292A::
    nop
    nop
    nop
    nop
    nop
    nop

label_F2930::
    sbc  a, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2940::
    sbc  a, c
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

label_F2950::
    and  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2960::
    ret
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
    ld   c, a
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FF4F]
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FF4F]
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   c, a
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   c, a
    rst  $38
    ld   a, [hl]
    cp   a
    ld   a, [$FF4A]
    rst  $38
    ld   a, [hl]
    cp   a
    ld   a, [$FF4A]
    db   $FD ; Undefined instruction
    ld   a, a
    rst  $38
    ld   a, [$FF4F]
    db   $FD ; Undefined instruction
    ld   a, a
    rst  $38
    ld   a, [$FF4F]
    db   $FD ; Undefined instruction
    rst  $38
    rst  $18
    ld   a, [$FF4F]
    db   $FD ; Undefined instruction
    rst  $38
    rst  $18
    ld   a, [$FF4F]
    rst  $38
    rst  $38
    push de
    ld   a, [$FF4F]
    rst  $38
    rst  $38
    push de
    ld   a, [$FF4F]
    rst  $38
    rst  $38
    rst  $18
    ld   a, [$FF4F]
    rst  $38
    rst  $38
    rst  $18
    ld   a, [$FF55]
    ld   d, l
    ld   d, l
    ld   d, l
    ld   d, l
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   e, e
    rrca
    ccf
    dec  l
    ldi  [hl], a
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F2A12::
    adc  a, c
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
    ld   a, [$FFFE]
    and  a
    ret  nz
    ld   bc, $001E
    call label_F2B92
    ld   hl, label_F2A12
    call label_F2B51
    call label_F2B86
    ld   a, [$FF00]
    and  $03
    cp   $03
    jr   nz, label_F2A76
    ld   a, $20
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, $30
    ld   [rJOYP], a
    ld   a, $10
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, $30
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    and  $03
    cp   $03
    jr   nz, label_F2A76
    ld   hl, label_F2A02
    call label_F2B51
    call label_F2B86
    sub  a, a
    ret

label_F2A76::
    ld   hl, label_F2A02
    call label_F2B51
    call label_F2B86
    ld   hl, label_F2860
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F2960
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F2880
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F2890
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F28A0
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F28B0
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F28C0
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F28D0
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F28E0
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F28F0
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F2900
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F2910
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F0000
    ld   de, label_F2930
    call label_F2BA3
    ld   hl, label_F1000
    ld   de, label_F2940
    call label_F2BA3
    ld   hl, label_F2000
    ld   de, label_F2950
    call label_F2BA3
    ld   hl, $8000
    ld   bc, label_2000

label_F2B30::
    xor  a
    ldi  [hl], a
    dec  bc
    ld   a, c
    or   b
    jr   nz, label_F2B30
    ld   a, $81
    ld   [rLCDC], a
    ld   bc, $0006
    call label_F2B92
    ld   hl, label_F2870
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    xor  a
    ld   [rLCDC], a
    ret

label_F2B51::
    ld   a, [hl]
    and  $07
    ret  z
    ld   b, a
    ld   c, $00

label_F2B58::
    push bc
    xor  a
    ld  [$FF00+C], a
    ld   a, $30
    ld  [$FF00+C], a
    ld   b, $10

label_F2B60::
    ld   e, $08
    ld   a, [hli]
    ld   d, a

label_F2B64::
    bit  0, d
    ld   a, $10
    jr   nz, label_F2B6C
    ld   a, $20

label_F2B6C::
    ld  [$FF00+C], a
    ld   a, $30
    ld  [$FF00+C], a
    rr   d
    dec  e
    jr   nz, label_F2B64
    dec  b
    jr   nz, label_F2B60
    ld   a, $20
    ld  [$FF00+C], a
    ld   a, $30
    ld  [$FF00+C], a
    pop  bc
    dec  b
    ret  z
    call label_F2B86
    jr   label_F2B58

label_F2B86::
    ld   de, label_1B58

label_F2B89::
    nop
    nop
    nop
    dec  de
    ld   a, d
    or   e
    jr   nz, label_F2B89
    ret

label_F2B92::
    ld   de, label_6D6

label_F2B95::
    nop
    nop
    nop
    dec  de
    ld   a, d
    or   e
    jr   nz, label_F2B95
    dec  bc
    ld   a, b
    or   c
    jr   nz, label_F2B92
    ret

label_F2BA3::
    push de
    ld   a, $E4
    ld   [rBGP], a
    ld   de, $8800
    ld   bc, label_1000
    call label_2914
    ld   hl, $9800
    ld   de, $000C
    ld   a, $80
    ld   c, $0D

label_F2BBB::
    ld   b, $14

label_F2BBD::
    ldi  [hl], a
    inc  a
    dec  b
    jr   nz, label_F2BBD
    add  hl, de
    dec  c
    jr   nz, label_F2BBB
    ld   a, $81
    ld   [rLCDC], a
    ld   bc, $0005
    call label_F2B92
    pop  hl
    call label_F2B51
    ld   bc, $0006
    call label_F2B92
    xor  a
    ld   [rLCDC], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F3078::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F30FF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F3901::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F39C9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F3E00::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F3EA1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F3EC0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F3EC9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_F3EFF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
