section "bank13",romx,bank[$0D]

label_34000::
    nop
    nop
    ld   a, a
    nop
    ld   [hl], b
    ccf
    ld   a, b
    ccf
    ld   e, h
    ccf
    ld   c, [hl]
    ccf
    ld   b, a
    ccf
    ld   b, e

label_3400F::
    ccf
    nop
    nop
    cp   $00
    ld   c, $FC
    ld   e, $FC
    db   $3A ; ldd  a, [hl]
    db   $FC ; Undefined instruction
    ld   [hl], d
    db   $FC ; Undefined instruction
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    jp   nz, label_343FC

label_34021::
    ccf
    ld   b, a
    ccf
    ld   c, [hl]
    ccf
    ld   e, h
    ccf
    ld   a, b
    ccf
    ld   [hl], b
    ccf
    ld   a, a
    nop
    nop
    nop
    jp   nz, label_E2FC
    db   $FC ; Undefined instruction
    ld   [hl], d
    db   $FC ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    db   $FC ; Undefined instruction
    ld   e, $FC
    ld   c, $FC
    cp   $00
    nop

label_3403F::
    nop
    nop
    ccf
    jr   nz, label_34063
    ld   d, b
    adc  a, a
    jr   z, label_3400F
    inc  d
    db   $E3 ; Undefined instruction
    ld   a, [bc]
    pop  af
    dec  b
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$0A
    pop  af
    inc  d
    db   $E3 ; Undefined instruction
    jr   z, label_34021
    ld   d, b
    adc  a, a
    and  b
    rra
    ld   b, b
    ccf
    ld   [bc], a
    db   $FC ; Undefined instruction
    dec  b

label_34063::
    ld    hl, sp+$0A
    pop  af
    inc  d
    db   $E3 ; Undefined instruction
    jr   z, label_34031
    ld   d, b
    adc  a, a
    jr   nz, label_3408D
    nop
    ccf
    ld   b, b
    ccf
    and  b
    rra
    ld   d, b
    adc  a, a
    jr   z, label_3403F
    inc  d
    db   $E3 ; Undefined instruction
    ld   a, [bc]
    pop  af
    inc  b
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    nop
    rst  $38
    nop
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $FF
    ld   b, $F9
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   b, $F9
    ld   sp, hl
    ld   b, $FF
    rst  $38
    jr   label_3409F
    ld   b, b
    ccf
    ld   b, [hl]
    dec  a
    ld   b, [hl]
    dec  a
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   h, b
    rra
    ld   h, b
    rra
    ld   b, b
    ccf
    ld   h, e
    rst  $18
    ld   d, e
    rst  $28
    ld   d, e
    rst  $28
    db   $E3 ; Undefined instruction
    rst  $18
    db   $E3 ; Undefined instruction
    rst  $18
    ld   h, e
    rst  $18

label_340BC::
    ld   l, e
    rst  $18
    ld   l, e
    rst  $18
    add  a, c
    nop
    ld   a, [hl]
    add  a, c
    add  a, l
    ei
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $30
    ld   a, $3E
    db   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    cp   a
    pop  hl
    rst  $18
    halt
    db   $FD ; Undefined instruction
    ld   [hl], $FF
    rst  $38
    inc  a
    db   $DB
    cp   [hl]
    ld   a, l
    ld   b, a
    ld   a, $63
    rra
    ld   b, c
    ccf
    ld   b, e
    ccf
    ld   b, a
    ld   a, $46
    dec  a
    cp   [hl]
    ld   a, l
    ld   l, a
    rst  $18
    ld   d, e
    rst  $38
    di
    ld   l, a
    db   $E3 ; Undefined instruction
    rst  $18
    di
    rst  $28
    ei
    ld   [hl], a
    ld   a, a
    db   $DB
    ld   l, a

label_340FF::
    rst  $18

label_34100::
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ld   a, [$FF70]
    rst  $38
    ld   a, b
    rst  $18
    ld   l, h
    rst  $18
    ld   h, a
    rst  $18
    ld   h, e
    rst  $18
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    cp   $0F
    ld   c, $FF
    ld   e, $FB
    ld   [hl], $FB
    and  $FB
    add  a, $FB

label_34120::
    ld   h, e
    rst  $18
    ld   h, e
    rst  $18
    ld   h, [hl]
    rst  $18
    ld   l, h
    rst  $18
    ld   a, b
    rst  $18
    ld   a, a
    ld   a, [$FFFF]
    rst  $38
    ret  nz
    rst  $38
    add  a, $FB
    add  a, $FB
    ld   h, [hl]
    ei
    ld   [hl], $FB
    ld   e, $FB
    cp   $0F
    rst  $38
    rst  $38

label_3413E::
    inc  bc
    rst  $38
    ld   h, e
    ld   e, a
    and  e
    rst  $18
    jp   label_131F
    rst  $28
    dec  bc
    rst  $30
    rlca
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, $FA
    push bc
    ei
    jp   label_C8F8
    rst  $30
    ret  nc
    rst  $28
    ld   [$FFDF], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    ei
    dec  bc
    rst  $30
    inc  de
    rst  $28
    jp   label_A31F
    rst  $18
    ld   h, e
    ld   e, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [$FFDF], a
    ret  nc
    rst  $28
    ret  z
    rst  $30
    jp   label_C5F8
    ei
    add  a, $FA
    jr   label_34181
    rst  $38
    rst  $38
    ld   sp, hl
    ld   b, $06
    ld   sp, hl
    ret  nz
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   b, $F9
    ld   b, $FF
    nop
    rst  $38
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    rst  $38
    nop
    nop
    nop
    add  a, $FB
    jp   z, label_CAF7
    rst  $30
    rst  0
    ei
    rst  0
    ei
    add  a, $FB
    sub  a, $FB
    sub  a, $FB
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   h, d
    cp   h
    ld   h, d
    cp   h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   b, $F8
    ld   b, $F8
    ld   [bc], a
    db   $FC ; Undefined instruction
    inc  a
    db   $DB
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    ld   [hl], $76
    db   $EB ; Undefined instruction
    pop  hl
    rst  $18
    pop  bc
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, $DD
    rst  $30
    ld   a, $E3
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, l
    ei
    ld   a, [hl]
    add  a, c
    add  a, c
    nop
    or   $FB
    jp   z, label_CFFF
    or   $C7
    ei
    rst  8
    rst  $30
    rst  $18
    xor  $FE
    db   $DB
    or   $FB
    ld   a, l
    cp   [hl]
    ldh  [$FF0C], a
    ld   a, h
    add  a, $F8
    add  a, d
    db   $FC ; Undefined instruction
    jp   nz, label_E2FC
    ld   a, h
    ld   h, d
    cp   h
    ld   a, l
    cp   [hl]
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ld   bc, $0101
    ld   bc, $0101
    rst  $38
    ld   bc, $FD03
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ret  nz
    cp   h
    pop  bc
    cp   l
    pop  bc
    cp   l
    pop  bc
    cp   c
    jp   label_C3BB
    cp   e
    ret  nz
    cp   h
    rst  $38
    rst  $38
    inc  bc
    dec  a
    add  a, e
    cp   l
    add  a, e
    cp   l
    add  a, e
    sbc  a, l
    jp   label_C3DD
    db   $03
    inc  bc
    dec  a
    rst  $38
    rst  $38
    rra
    nop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    ld   bc, rSB
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_3618F
    ld   h, c
    ld   a, l
    ld   a, l
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    pop  af
    add  a, [hl]
    add  a, [hl]
    cp   [hl]
    cp   [hl]
    rst  $38
    rst  $38
    ld    hl, sp+$00
    ld   [label_8F0], sp
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FFBF]
    rst  $38
    cp   h
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   sp, hl
    rst  $38
    rra
    rst  $38
    rst  $38
    rst  $38
    pop  af
    rst  $38
    rst  $30
    rst  $38
    cp   a
    rst  $38
    cp   h
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   sp, hl
    rst  $38
    sbc  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  a
    rst  $38
    jr   label_342A0
    rst  $38
    rst  $38
    sbc  a, [hl]
    rst  $38
    adc  a, h
    sbc  a, $80
    db   $ED ; Undefined instruction
    and  c
    jp   nc, label_CCB3
    cp   a
    ret  nz
    cp   a
    rst  $38
    rst  $38
    rst  $38
    ld   a, c
    rst  $38
    ld   sp, label_17B
    or   a
    add  a, l
    ld   c, e
    call label_FD33
    inc  bc
    db   $FD ; Undefined instruction
    add  a, c
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    rst  $38
    ld   h, [hl]
    jp   label_C366
    ld   a, [hl]
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $F117
    cpl
    db   $E3 ; Undefined instruction
    ld   e, a
    rst  0
    ld   e, a
    rst  0
    cpl
    db   $E3 ; Undefined instruction
    rla
    pop  af
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    db   $E8 ; add  sp, d
    adc  a, a
    db   $F4 ; Undefined instruction
    rst  0
    ld   a, [$FAE3]
    db   $E3 ; Undefined instruction
    db   $F4 ; Undefined instruction
    rst  0
    db   $E8 ; add  sp, d
    adc  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $20
    ld   h, [hl]
    jp   label_C366
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    add  a, c
    ret  nz
    cp   h
    jp   label_C3BB
    cp   e
    pop  bc
    cp   c
    pop  bc
    cp   l
    pop  bc
    cp   l
    ret  nz
    cp   h
    rst  $38
    rst  $38
    inc  bc
    dec  a
    jp   label_C3DD
    db   $83
    add  a, e
    sbc  a, l
    add  a, e
    cp   l
    add  a, e
    cp   l
    inc  bc
    dec  a
    rst  $38
    rst  $38
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    rst  $38
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_F10
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rra
    nop
    rst  $38
    rst  $38
    ld   a, l
    ld   a, l
    ld   h, c
    ld   h, c
    ld   bc, label_18F
    rst  $38
    ld   bc, label_1FF
    rst  $38
    rst  $38
    ld   bc, rIE
    cp   [hl]
    cp   [hl]
    add  a, [hl]
    add  a, [hl]
    add  a, b
    pop  af
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    ld   [label_8F0], sp
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FFF8]
    nop
    rst  $38
    rst  $38
    ret  nz
    cp   a
    call z, label_D2BF
    or   e
    db   $ED ; Undefined instruction
    and  c
    sbc  a, $80
    rst  $38
    adc  a, h
    rst  $38
    sbc  a, [hl]
    rst  $38
    rst  $38
    inc  bc
    db   $FD ; Undefined instruction
    inc  sp
    db   $FD ; Undefined instruction
    ld   c, e
    call label_85B7
    ld   a, e
    ld   bc, label_31FF
    rst  $38
    ld   a, c
    rst  $38
    rst  $38
    ld   [bc], a
    nop
    jr   nz, label_343A4

label_343A4::
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$0000], sp
    nop
    ld   a, [hl]
    nop
    ld   a, d
    nop
    ld   e, [hl]
    nop
    ld   a, [hl]
    nop
    halt
    ld   a, [hl]
    nop
    nop
    nop
    db   $E3 ; Undefined instruction
    rst  $38
    ld   a, a
    ccf
    ld   a, a
    daa
    ld   h, a
    inc  hl
    ld   h, a
    inc  hl
    ld   a, a
    daa
    ld   a, a
    ccf
    db   $E3 ; Undefined instruction
    rst  $38
    rla
    pop  af
    cpl
    db   $E3 ; Undefined instruction
    ld   e, a
    rst  0
    ld   e, a
    rst  0
    cpl
    db   $E3 ; Undefined instruction
    rla
    pop  af
    rst  $38
    ld   bc, rIE
    db   $E8 ; add  sp, d
    adc  a, a
    db   $F4 ; Undefined instruction
    rst  0
    ld   a, [$FAE3]
    db   $E3 ; Undefined instruction
    db   $F4 ; Undefined instruction
    rst  0
    db   $E8 ; add  sp, d
    adc  a, a
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  0
    rst  $38
    cp   $FC
    cp   $E4
    and  $C4
    and  $C4
    cp   $E4

label_343FC::
    cp   $FC
    rst  0
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    sbc  a, [hl]
    sbc  a, [hl]
    sbc  a, [hl]
    sub  a, d
    sbc  a, [hl]
    sub  a, d
    sbc  a, [hl]
    sub  a, d
    sbc  a, [hl]
    sbc  a, [hl]
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    ld   bc, label_37901
    ld   a, c
    ld   a, c
    ld   c, c
    ld   a, c
    ld   c, c
    ld   a, c
    ld   c, c
    ld   a, c
    ld   a, c
    ld   bc, rSB
    rst  $38
    add  a, b
    add  a, b
    and  b
    cp   a
    and  b
    cp   a
    and  b
    cp   a
    and  b
    cp   a
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    ld   bc, label_501
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ccf
    ccf
    ld   b, b
    ld   b, b
    adc  a, a
    adc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    adc  a, a
    adc  a, a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [bc], a
    ld   [bc], a
    pop  af
    pop  af
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    pop  af
    pop  af
    rst  $38
    rst  $38
    ret  nz
    cp   a
    pop  bc

label_34465::
    cp   [hl]
    jp   label_C7BC
    cp   b
    adc  a, $B1
    call z, label_C8B3
    or   a
    rst  $38
    rst  $38
    inc  bc
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, l
    jp   label_E33D
    dec  e
    ld   [hl], e
    adc  a, l
    inc  sp
    call label_ED13
    rst  $38
    rst  $38
    sbc  a, a
    pop  bc
    sbc  a, a
    pop  bc
    sbc  a, a
    pop  bc
    sbc  a, a
    pop  bc
    add  a, c
    pop  bc
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    jp   label_366FF
    ld   a, [hl]
    inc  a
    inc  a
    jr   label_344B0
    ld   b, b
    nop
    ld   bc, label_3C00
    nop
    ld   b, d
    nop
    nop
    rst  $38
    nop
    add  a, b
    jr   nz, label_34465
    jr   nz, label_34467
    ccf
    cp   a
    ccf
    cp   a
    ccf
    cp   h
    ccf
    cp   h

label_344B0::
    nop
    rst  $38
    nop
    ld   bc, $FD7C
    ld   b, h
    push bc
    call nz, label_C4C5
    push bc
    call nz, label_C445
    ld   b, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_344F6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_344FF::
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    push de
    sbc  a, l
    push de
    sbc  a, l
    call nc, label_DF9C
    sbc  a, a
    ret  nz
    add  a, b
    rst  $38
    rst  $38
    ld   bc, rSB
    rst  $38
    xor  e
    cp   c
    xor  e
    cp   c
    dec  hl
    add  hl, sp
    ei
    ld   sp, hl
    inc  bc
    ld   bc, rIE
    add  a, b
    add  a, b
    rst  0
    ret  nz
    ld   h, h
    ld   [$FF34], a
    ld   a, [$FF36]
    ld   a, [$FF63]
    ld   [$FFC0], a
    ret  nz
    adc  a, b
    add  a, b
    ld   bc, $8B01
    inc  bc
    ld   b, [hl]
    rlca
    inc  l
    rrca
    ld   l, h
    rrca
    add  a, $07
    inc  de
    inc  bc
    ld   bc, $8001
    add  a, b
    add  a, b
    ret  nz
    add  a, b
    cp   a
    add  a, b
    add  a, b
    call nz, label_E284
    ld   b, d
    cp   a
    and  b
    rst  $18
    rst  $38
    ld   bc, $0101
    inc  bc
    ld   bc, label_1FD
    ld   bc, label_2123
    ld   b, a
    ld   b, d
    db   $FD ; Undefined instruction
    dec  b
    ei
    rst  $38
    rst  $10
    jr   c, label_344F6
    ld   a, h
    db   $10 ; Undefined instruction
    jr   c, label_34567
    ld   a, h
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
    inc  a
    rst  $38
    jr   label_34581

label_34581::
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
    rst  $38
    rst  $38
    nop
    nop
    ld   h, d
    nop
    inc  a
    nop
    jr   label_34596

label_34596::
    ld   b, b
    nop
    ld   a, [de]
    jr   label_345D7
    inc  a
    ld   h, [hl]
    ld   a, [hl]
    jp   label_3FFF
    cp   h
    daa
    cp   h
    daa
    cp   h
    daa
    cp   h
    daa
    cp   h
    ccf
    cp   a
    nop
    add  a, b
    nop
    rst  $38
    call nz, label_C445
    ld   b, l
    call nz, label_C445
    ld   b, l
    call nz, label_FC45
    db   $FD ; Undefined instruction
    nop
    ld   bc, rJOYP
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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

label_345D7::
    rst  $38

label_345D8::
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

label_345F8::
    nop
    nop

label_345FA::
    nop
    nop

label_345FC::
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  c
    inc  bc
    ld   a, h
    inc  bc
    ld   h, b
    rra
    ld   c, a
    ccf
    nop
    nop
    ld   [rJOYP], a
    ld   h, b
    add  a, b
    jr   nz, label_345D8
    or   b
    ret  nz
    cp   [hl]
    ret  nz
    add  a, d
    db   $FC ; Undefined instruction
    add  a, d
    db   $FC ; Undefined instruction
    ld   b, c
    ccf
    ld   b, c
    ccf
    ld   a, l
    inc  bc
    dec  c
    inc  bc
    inc  b
    inc  bc
    ld   b, $01
    rlca
    nop
    nop
    nop
    db   $F2 ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   b, $F8
    ld   a, $C0
    jr   nc, label_345F8
    jr   nz, label_345FA
    jr   nz, label_345FC
    ld   [rJOYP], a

label_3463E::
    nop
    nop
    ld   bc, label_C0F
    inc  bc
    ld   c, $01
    adc  a, [hl]
    ld   bc, $8176
    ld   a, d
    add  a, c
    cp   h
    jp   label_FF80
    add  a, b
    ld   a, [$FF30]
    ret  nz
    ld   [hl], b
    add  a, b
    ld   [hl], c
    add  a, b
    ld   l, [hl]
    add  a, c
    ld   e, [hl]
    add  a, c
    dec  a
    jp   label_FF01
    add  a, b
    rst  $38
    cp   h
    jp   label_817A
    halt
    adc  a, [hl]
    ld   bc, $010E
    inc  c
    inc  bc
    ld   bc, $010F
    rst  $38
    dec  a
    jp   label_815E
    ld   l, [hl]
    add  a, c
    ld   [hl], c
    add  a, b
    ld   [hl], b
    add  a, b
    jr   nc, label_3463E
    add  a, b
    ld   a, [$FF00]
    nop
    ld   bc, $C200
    ld   bc, $8166
    inc  a
    jp   label_C7B8
    or   b
    rst  8
    sub  a, b
    rst  $28
    db   $DB
    rst  $20
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    sbc  a, b
    ld   a, a
    db   $DB
    inc  a
    rst  $28
    inc  a
    jp   label_817E
    rst  $38
    ld   b, b
    ccf
    jr   nc, label_346B3
    jr   label_346AD
    inc  c
    inc  bc
    rrca
    nop
    ld   e, $01
    jr   nc, label_346BD
    daa
    rra
    pop  af
    adc  a, a
    ld   [hl], e

label_346B3::
    rst  8
    ld   h, $FF
    dec  a
    cp   $1D
    cp   $26
    rst  $38
    ld   [hl], e

label_346BD::
    rst  8
    ld   sp, hl
    add  a, a
    rst  $38
    nop
    cp   l
    ld   a, [hl]
    ld   a, [hl]
    rst  $38
    rst  $18
    db   $E3 ; Undefined instruction
    cp   l
    jp   label_C7B9
    sbc  a, c
    rst  $20
    adc  a, c
    rst  $30
    db   $DB
    rst  $20
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    sbc  a, b
    ld   a, a
    db   $DB
    inc  a
    cp   l
    ld   a, [hl]
    ld   h, [hl]
    rst  $38
    jp   label_DFFF
    ccf
    or   b
    ld   a, a
    db   $EC ; Undefined instruction
    ld   [hl], e
    cp   $61
    rst  $38
    ld   h, b
    ld    hl, sp+$67
    or   b
    ld   a, a
    rst  $18
    ccf
    cp   c
    rst  0
    db   $D3 ; Undefined instruction
    rst  $28
    ld   h, [hl]
    rst  $38
    dec  a
    cp   $3D
    cp   $66
    rst  $38
    db   $D3 ; Undefined instruction
    rst  $28
    or   c
    rst  8
    add  a, e
    cp   $CF
    db   $FC ; Undefined instruction
    ld   [hl], a
    ld    hl, sp+$33
    db   $FC ; Undefined instruction
    ld   e, b
    rst  $38
    adc  a, h
    rst  $38
    add  a, $BF
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    ld   a, a
    sub  a, $3F
    adc  a, h
    ld   a, a
    inc  e
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   h, [hl]
    ei
    rst  8
    pop  af
    adc  a, a
    ld   a, [$FFF1]
    rrca
    di
    adc  a, a
    ld   h, [hl]
    rst  $18
    ld   c, h
    rst  $38
    jr   c, label_34729
    ld   sp, label_36BFE
    db   $FC ; Undefined instruction
    rst  0
    cp   $C7
    ld    hl, sp+$63
    db   $FD ; Undefined instruction
    ld   sp, label_1AFF
    rst  $38
    call z, label_EE3F
    rra
    di
    ccf
    pop  bc
    ld   a, a
    add  a, c
    rst  $38
    ld   a, a
    cp   $76
    adc  a, $7A
    add  a, $5A
    and  $66
    db   $FC ; Undefined instruction
    ld   a, h
    ld    hl, sp+$E0
    ret  nz
    add  a, c
    rst  $38
    cp   $7F
    ld   l, [hl]
    ld   [hl], e
    ld   e, [hl]
    ld   h, e
    ld   e, d
    ld   h, a
    ld   h, [hl]
    ccf
    ld   a, $1F
    rlca
    inc  bc
    ld   [$FFC0], a
    ld   a, h
    ld    hl, sp+$66
    db   $FC ; Undefined instruction
    ld   e, d
    and  $7A
    add  a, $76
    adc  a, $7F
    cp   $81
    rst  $38
    rlca
    inc  bc
    ld   a, $1F
    ld   h, [hl]
    ccf
    ld   e, d
    ld   h, a
    ld   e, [hl]
    ld   h, e

label_3477A::
    ld   l, [hl]
    ld   [hl], e
    cp   $7F
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    jp   label_EF7E
    inc  a
    db   $DB
    inc  a
    sbc  a, b
    ld   a, a
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    db   $DB
    rst  $20
    sub  a, b
    rst  $28
    or   b
    rst  8
    cp   b
    rst  0
    inc  a
    jp   label_8166
    jp   nz, label_101
    nop
    nop
    nop
    sbc  a, a
    pop  hl
    adc  a, $F3
    ld   h, h
    rst  $38
    cp   b
    ld   a, a
    cp   h
    ld   a, a

label_347AA::
    ld   h, h
    rst  $38
    adc  a, $F3
    adc  a, a
    pop  af
    db   $E4 ; Undefined instruction
    ld    hl, sp+$0C
    ld   a, [$FF78]
    add  a, b
    ld   a, [$FF00]
    jr   nc, label_3477A
    jr   label_3479C
    inc  c
    ld   a, [$FF02]
    db   $FC ; Undefined instruction
    jp   label_366FF
    rst  $38
    cp   l
    ld   a, [hl]
    db   $DB
    inc  a

label_347C8::
    sbc  a, b
    ld   a, a
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    db   $DB
    rst  $20
    adc  a, c
    rst  $30
    sbc  a, c
    rst  $20
    cp   c
    rst  0
    cp   l
    jp   label_E3DF
    ld   a, [hl]
    rst  $38
    cp   l
    ld   a, [hl]
    rst  $38
    nop
    sbc  a, l
    db   $E3 ; Undefined instruction
    set  6, a
    ld   h, [hl]
    rst  $38
    cp   h
    ld   a, a
    cp   h
    ld   a, a
    ld   h, [hl]
    rst  $38
    set  6, a
    adc  a, l
    di
    ei
    db   $FC ; Undefined instruction
    dec  c
    cp   $37
    adc  a, $7F
    add  a, [hl]
    rst  $38
    ld   b, $1F
    and  $0D
    cp   $FB
    db   $FC ; Undefined instruction
    rst  $38
    nop
    add  a, b
    nop
    add  a, b
    ccf
    sbc  a, a
    ccf
    sbc  a, a
    jr   c, label_347AA
    inc  [hl]
    sbc  a, a
    ldd  [hl], a

label_3480E::
    sbc  a, a
    ld   sp, $00FF
    ld   bc, $0100
    db   $FC ; Undefined instruction
    ld   sp, hl
    db   $FC ; Undefined instruction
    ld   sp, hl
    inc  e
    ld   sp, hl
    inc  l
    ld   sp, hl
    ld   c, h
    ld   sp, hl
    adc  a, h
    sbc  a, a
    ld   sp, label_329F
    sbc  a, a
    inc  [hl]
    sbc  a, a
    jr   c, label_347C8
    ccf
    add  a, b
    ccf
    add  a, b
    nop
    rst  $38
    nop
    ld   sp, hl
    adc  a, h
    ld   sp, hl
    ld   c, h
    ld   sp, hl
    inc  l
    ld   sp, hl
    inc  e
    ld   sp, hl
    db   $FC ; Undefined instruction
    ld   bc, label_1FC
    nop
    rst  $38
    nop
    sbc  a, a
    jr   nc, label_34862
    jr   nc, label_34864
    ld   a, [$FFFF]
    ld   a, [$FFF7]
    nop

label_3484A::
    ei
    nop

label_3484C::
    db   $FD ; Undefined instruction
    nop

label_3484E::
    cp   $00
    ld   sp, hl
    inc  c
    ld    hl, sp+$0C
    ld    hl, sp+$0F
    rst  $38
    rrca
    rst  $28
    nop
    rst  $18
    nop
    cp   a
    nop
    ld   a, a
    nop
    cp   $00

label_34862::
    db   $FD ; Undefined instruction
    nop

label_34864::
    ei
    nop
    rst  $30
    nop
    rst  $38
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    jr   nc, label_3480E
    jr   nc, label_348F0
    nop
    cp   a
    nop
    rst  $18
    nop
    rst  $28
    nop
    rst  $38
    rrca
    ld    hl, sp+$0F

label_3487C::
    ld    hl, sp+$0C
    ld   sp, hl
    inc  c
    rst  $38
    nop
    nop
    nop
    nop
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
    rst  $38
    rst  $38
    rst  $38
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    rst  $38
    inc  b
    rst  $38
    rst  $38
    sbc  a, a
    jr   nc, label_34842
    jr   nc, label_34844
    jr   nc, label_34846
    jr   nc, label_34848
    jr   nc, label_3484A
    jr   nc, label_3484C
    jr   nc, label_3484E
    jr   nc, label_3487C
    cp   a
    res  7, a
    res  7, a
    ei
    rst  $38
    res  7, a
    res  7, a
    rst  8
    cp   a
    res  7, a
    add  a, c
    nop
    ld   a, [hl]
    add  a, c
    add  a, l
    ei
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $30
    ld   a, $3E
    db   $FF
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    pop  bc
    cp   a
    pop  hl
    rst  $18
    halt
    db   $FD ; Undefined instruction
    ld   [hl], $FF
    rst  $38
    inc  a
    db   $DB
    cp   [hl]
    ld   a, l
    ld   b, a
    ld   a, $63
    rra
    ld   b, c
    ccf
    ld   b, e
    ccf
    ld   b, a
    ld   a, $46
    dec  a
    cp   [hl]
    ld   a, l

label_348F0::
    ld   l, a
    rst  $18
    ld   d, e
    rst  $38
    pop  af
    ld   l, a
    pop  hl
    rst  $18
    pop  af
    rst  $28
    ld   sp, hl
    ld   [hl], a
    ld   a, l
    db   $DB
    ld   l, a
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ld   [$FFBF], a
    ret  nc
    cp   a
    rst  8
    cp   a
    call z, label_CBBF
    cp   a
    res  7, a
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rlca
    db   $FD ; Undefined instruction
    dec  bc
    db   $FD ; Undefined instruction
    di
    db   $FD ; Undefined instruction
    inc  sp
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    res  7, a
    res  7, a
    call z, label_CFBF
    cp   a
    ret  nc
    cp   a
    ld   [$FFBF], a
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  sp
    db   $FD ; Undefined instruction
    di
    db   $FD ; Undefined instruction
    dec  bc
    db   $FD ; Undefined instruction
    rlca
    db   $FD ; Undefined instruction
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    res  7, a
    srl  a
    dec  hl
    rst  $18
    dec  de
    rst  $28
    ei
    rst  $38
    rlca
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FC ; Undefined instruction
    call nc, label_D8FB
    rst  $30
    rst  $18
    rst  $38
    ld   [$FFDF], a
    rst  $38
    rst  $38
    rst  $38

label_3495F::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    ei
    ei
    rst  $38
    dec  de
    rst  $28
    dec  hl
    rst  $18
    srl  a
    res  7, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [$FFDF], a
    rst  $18
    rst  $38
    ret  c
    rst  $30
    call nc, label_D3FB
    db   $FC ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    inc  b
    inc  b
    rst  $38
    inc  b
    rst  $38
    rst  $38
    rst  $38
    ld   b, b
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
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $18
    rst  $38
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    di
    db   $FD ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   sp, hl
    inc  c
    ld   sp, hl
    inc  c
    ld   sp, hl
    inc  c
    ld   sp, hl
    inc  c
    ld   sp, hl
    inc  c
    ld   sp, hl
    inc  c
    ld   sp, hl
    inc  c
    ld   sp, hl
    inc  c
    inc  a
    db   $DB
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    ld   [hl], $76
    db   $EB ; Undefined instruction
    pop  hl
    rst  $18
    pop  bc
    cp   a
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    ld   a, $DD
    rst  $30
    ld   a, $E3
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, l
    ei
    ld   a, [hl]
    add  a, c
    add  a, c
    nop
    or   $FB
    jp   z, label_8FFF
    or   $87
    ei
    adc  a, a
    rst  $30
    sbc  a, a
    xor  $BE
    db   $DB
    or   $FB
    ld   a, l
    cp   [hl]
    ldh  [$FF0C], a
    ld   a, h
    add  a, $F8
    add  a, d
    db   $FC ; Undefined instruction
    jp   nz, label_E2FC
    ld   a, h
    ld   h, d
    cp   h
    ld   a, l
    cp   [hl]
    nop
    nop
    ld   l, a
    ld   [hl], b
    ld   [hl], l
    ld   a, d
    db   $3A ; ldd  a, [hl]
    ld   a, l
    ld   e, h
    ccf
    ld   l, [hl]
    rra
    ld   d, a
    cpl
    ld   h, e
    rra
    nop
    nop
    or   $0E
    xor  [hl]
    ld   e, [hl]
    ld   e, h
    cp   [hl]
    db   $3A ; ldd  a, [hl]
    db   $FC ; Undefined instruction
    halt
    ld   [$C6F4], a
    ld    hl, sp+$63
    rra
    ld   d, a
    cpl
    ld   l, [hl]
    rra
    ld   e, h
    ccf
    db   $3A ; ldd  a, [hl]
    ld   a, l
    ld   [hl], l
    ld   a, d
    ld   l, a
    ld   [hl], b
    nop
    nop
    add  a, $F8

label_34A32::
    ld   [label_376F4], a
    ld    hl, sp+$3A
    db   $FC ; Undefined instruction
    ld   e, h
    cp   [hl]
    xor  [hl]
    ld   e, [hl]
    or   $0E
    nop
    nop
    jr   label_34A49
    db   $10 ; Undefined instruction
    ld   [$C007], sp
    rlca
    and  b

label_34A49::
    ld   b, e
    ld   b, b
    or   c
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    jr   label_34A32
    ld   [label_10F0], sp
    ld   [$FF03], a
    ld   [rTIMA], a
    jp   nz, label_8D02
    nop
    rra
    nop
    ccf
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$40
    or   c
    and  b
    ld   b, e
    ret  nz
    rlca
    ld   [label_1007], sp
    rrca
    jr   label_34A77
    nop
    ccf
    nop
    rra
    ld   [bc], a
    adc  a, l
    dec  b

label_34A77::
    jp   nz, label_E003
    db   $10 ; Undefined instruction
    ld   [label_18F0], sp
    ld   [rJOYP], a
    nop
    sbc  a, c
    nop
    cp   $01
    ld   e, e
    and  h
    add  a, h
    ld   a, e
    nop
    rst  $38
    db   $10 ; Undefined instruction
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    xor  $FF
    ld   a, l
    rst  $38
    rst  $10
    rst  $38
    ld   b, h
    rst  $38
    ld   de, label_340FF
    rst  $38
    ld   d, b
    cpl
    ld   sp, label_280F
    rla
    ld   [hl], b
    rrca
    ld   [hl], d
    rrca
    jr   nz, label_34ACB
    jr   nc, label_34ABD
    ld   l, b
    rla
    rla
    rst  $38
    cp   a
    rst  $38
    rrca
    rst  $38
    ld   e, e
    rst  $38
    rrca
    rst  $38
    ccf
    rst  $38
    rla

label_34ABD::
    rst  $38
    ld   e, e
    rst  $38
    add  a, c
    nop
    halt
    adc  a, c
    rst  $30
    and  e
    db   $89
    adc  a, c
    rst  $38
    db   $E3 ; Undefined instruction

label_34ACB::
    rst  $38
    rst  $30
    ld   a, $3E
    db   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    cp   a
    db   $FD ; Undefined instruction
    rst  $18
    halt
    inc  a
    rst  $30
    dec  a
    rst  $38
    inc  a
    db   $DB
    cp   [hl]
    ld   a, l
    ld   d, a
    ld   l, $43
    ccf
    add  hl, hl
    ld   e, a
    ld   b, e
    ccf
    ld   d, a
    ld   l, $46
    dec  a
    cp   [hl]
    ld   a, l
    ld   c, a
    rst  $38
    rla
    rst  $38
    rst  $38
    ld   l, a
    db   $EB ; Undefined instruction
    rst  $18
    rst  $38
    rst  $28
    rst  $38
    ld   [hl], a
    rra
    ei
    rrca
    rst  $38
    ret  nz
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    ld   [hl], b
    rst  $38
    db   $3A ; ldd  a, [hl]
    rst  $38
    dec  e
    rst  $38
    sbc  a, a
    rst  $38
    rlca
    rst  $38
    cpl
    rst  $38
    inc  bc
    rst  $38
    daa
    rst  $38
    ld   c, $FF
    ld   e, h
    rst  $38
    cp   b
    rst  $38
    ld   sp, hl
    rst  $38
    ld   [rIE], a
    db   $F4 ; Undefined instruction
    rst  $38
    cpl
    rst  $38
    rlca
    rst  $38
    sbc  a, a
    rst  $38
    dec  e
    rst  $38
    db   $3A ; ldd  a, [hl]
    rst  $38
    ld   [hl], b
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    ret  nz
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    ld   [rIE], a
    ld   sp, hl
    rst  $38
    cp   b
    rst  $38
    ld   e, h
    rst  $38
    ld   c, $FF
    daa
    rst  $38
    inc  bc
    rst  $38
    ld   d, a
    ccf
    xor  a
    rra
    ld   b, e
    sbc  a, a
    add  a, a
    rst  $28
    inc  hl
    rst  $30
    or   e
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    ld   [$F5FC], a
    ld    hl, sp+$C2
    ld   sp, hl
    pop  hl
    rst  $30
    call nz, label_CDEF
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    or   e
    rst  $38
    inc  hl
    rst  $30
    add  a, a
    rst  $28
    ld   b, e
    sbc  a, a
    xor  a
    rra
    ld   d, a
    ccf
    rst  $38
    rst  $38
    cp   a
    rst  $38
    call label_C4FF
    rst  $28
    pop  hl
    rst  $30
    jp   nz, label_F5F9
    ld    hl, sp+$EA
    db   $FC ; Undefined instruction
    ld   b, b
    rst  $38
    ld   de, label_344FF
    rst  $38
    rst  $10
    rst  $38
    ld   a, l
    rst  $38
    xor  $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [bc], a
    rst  $38
    db   $10 ; Undefined instruction
    nop
    rst  $38
    add  a, h
    ld   a, e
    ld   e, e
    and  h
    cp   $01
    sbc  a, c
    nop
    nop
    nop
    db   $E8 ; add  sp, d
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    jp  c, label_F0FF
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    jp  c, label_AFF
    db   $F4 ; Undefined instruction
    adc  a, h
    ld   a, [$FF14]
    db   $E8 ; add  sp, d
    ld   c, $F0
    ld   c, [hl]
    ld   a, [$FF04]
    ld    hl, sp+$0C
    ld   a, [$FF16]
    db   $E8 ; add  sp, d
    inc  a
    db   $DB
    dec  a
    rst  $38
    inc  a
    rst  $30
    halt
    db   $FD ; Undefined instruction
    rst  $18
    rst  $30
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, $DD
    rst  $30
    ld   a, $E3
    rst  $38
    adc  a, c
    rst  $38
    and  e
    db   $89
    adc  a, c
    rst  $30
    halt
    add  a, c
    nop
    db   $F2 ; Undefined instruction
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    rst  $38
    or   $D7
    ei
    rst  $38
    rst  $30
    rst  $38
    xor  $F8
    rst  $18
    ld   a, [$FFFF]
    ld   a, l
    cp   [hl]
    ld   [$C274], a
    db   $FC ; Undefined instruction
    sub  a, h
    ld   a, [$FCC2]
    ld   [label_36274], a
    cp   h
    ld   a, l
    cp   [hl]
    ld   b, c
    nop
    ld   b, c
    nop
    ld   b, l
    nop
    pop  bc
    nop
    db   $E3 ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    jr   c, label_34C0E

label_34C0E::
    ld   [de], a
    nop
    ld    hl, sp+$00
    jr   label_34C14

label_34C14::
    inc  c
    nop
    inc  b
    nop
    add  a, a
    nop
    rst  0
    nop
    ld   b, h
    nop
    ld   l, h
    nop
    ld   d, b
    nop
    stop
    sub  a, c
    nop
    jr   label_34C28

label_34C28::
    inc  a
    nop
    db   $E3 ; Undefined instruction
    nop
    pop  bc
    nop
    ret
    nop
    jr   c, label_34C32

label_34C32::
    db   $3A ; ldd  a, [hl]
    nop
    jr   c, label_34C36

label_34C36::
    ld   h, h
    nop
    add  a, $00
    sub  a, e
    nop
    add  a, e
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_34C6A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_34C6F
    rrca
    rlca
    rlca

label_34C6A::
    nop
    nop
    nop
    nop
    nop

label_34C6F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_34C8E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf

label_34C83::
    nop
    ld   b, c
    nop
    ld   b, c
    nop
    ld   b, c
    nop
    ld   b, d
    nop
    ld   b, l
    nop

label_34C8E::
    ld   a, e
    nop
    nop
    nop
    ld   a, h
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   c, $00
    or   $00
    ld    hl, sp+$00
    rlca

label_34CA1::
    nop
    ld   a, e

label_34CA3::
    nop
    ld   a, l
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, $00
    nop
    nop
    or   $00
    ld   [$D200], a
    nop
    ldi  [hl], a
    nop
    jp   nz, label_8200
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    add  a, c
    nop
    add  a, c
    ld   b, d
    add  a, c
    ld   h, h
    add  a, e
    sbc  a, b

label_34CC9::
    ld   h, a
    ret  nz

label_34CCB::
    ccf
    ld   b, e
    inc  a
    daa
    jr   label_34CC9
    nop
    jr   label_34CD4

label_34CD4::
    inc  l
    db   $10 ; Undefined instruction
    inc  h
    jr   nz, label_34CA1
    add  hl, hl
    add  a, $3A
    call nz, label_FC00
    ld   l, l
    ld   [de], a
    cpl
    db   $10 ; Undefined instruction
    ld   de, label_102F
    ld   b, a
    jr   c, label_34C83
    ld   h, a
    ldi  [hl], a
    pop  bc
    ret
    nop
    add  a, h
    ld   a, b
    jp   nz, label_C038
    jr   c, label_34CCB
    jr   z, label_34CA3
    ld   b, h
    ld   d, l
    add  a, d
    ld   b, l
    add  a, d
    ccf
    ret  nz
    ld   b, $00
    jr   z, label_34D05
    inc  c

label_34D05::
    inc  bc
    nop
    nop
    jr   nz, label_34D0A

label_34D0A::
    ld   [bc], a
    nop
    ld   h, b
    nop
    or   c
    nop
    jr   nz, label_34D12

label_34D12::
    nop
    nop
    nop
    nop
    stop
    jr   nz, label_34D22
    jr   z, label_34D2C
    nop
    nop
    add  a, b
    nop
    pop  hl
    db   $10 ; Undefined instruction
    ld   h, b
    nop
    nop
    inc  c
    nop
    ld   d, [hl]
    nop
    inc  c
    ld   [de], a

label_34D2C::
    ld   [de], a
    inc  c
    nop
    nop
    ld   b, d
    nop
    ret  nz
    nop
    nop
    nop
    nop
    nop
    jr   label_34D3A

label_34D3A::
    inc  l
    nop
    jr   c, label_34D42
    inc  b
    jr   label_34D41

label_34D41::
    nop

label_34D42::
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_34D6A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_34D6F
    rrca
    rlca
    rlca

label_34D6A::
    nop
    nop
    nop
    nop
    nop

label_34D6F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_34D8E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_34D85

label_34D85::
    dec  h
    db   $10 ; Undefined instruction
    jr   nz, label_34DDA
    nop
    ld   l, a
    nop
    stop
    inc  l
    nop
    ld   a, h
    nop
    add  a, d
    add  a, d
    dec  a
    nop
    jp   label_0
    nop
    ld   b, $00
    ret
    nop
    dec  hl
    nop
    add  hl, hl
    nop
    ld   hl, label_2801
    ld   [bc], a
    ld   b, c
    inc  b
    ld   d, e
    nop
    halt
    dec  e
    nop
    ld   bc, $AA00
    ld   b, h
    xor  d
    call nz, label_2A
    jp   z, label_1200
    nop
    jp  c, label_2E40
    nop
    ret  nz
    ldi  [hl], a
    nop
    ld   a, $00
    ldh  [$FF0C], a
    nop
    ld   b, b
    ld   bc, $0140
    jr   nz, label_34DCE
    nop
    inc  e

label_34DCE::
    nop
    inc  b
    stop
    add  hl, bc
    nop
    ld   [bc], a
    inc  c
    nop
    ld   [$F800], sp

label_34DDA::
    nop
    inc  h
    nop
    ldi  [hl], a
    nop
    ld   b, c
    ld   [bc], a
    inc  b
    inc  bc
    rlca
    pop  bc
    add  hl, bc
    jr   nz, label_34DF8
    stop

label_34DEA::
    jr   label_34DEC

label_34DEC::
    ld   h, a
    nop
    ld   bc, label_34000
    ld   b, c
    ld   [$FFF9], a
    ret  nz
    add  a, [hl]
    add  a, b
    add  a, h

label_34DF8::
    nop
    add  a, h
    ld   a, $C0
    ld   bc, $0000
    nop
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
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    rst  $38
    nop
    jr   c, label_34E22

label_34E22::
    nop
    nop
    nop
    nop
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
    nop
    nop
    inc  c
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_34E6A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_34E6F
    rrca
    rlca
    rlca

label_34E6A::
    nop
    nop
    nop
    nop
    nop

label_34E6F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_34E8E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    db   $00
    nop
    pop  bc
    nop
    ld   e, l
    nop
    cp   [hl]
    nop
    cp   [hl]
    nop
    sbc  a, l
    nop
    ld   h, e
    nop

label_34E8E::
    ei
    nop
    rst  $28
    nop
    rst  $30
    nop
    ld   a, [$FF00]
    rst  $30
    nop
    rlca
    nop
    db   $DB
    nop
    call c, label_DE00
    nop
    db   $FD ; Undefined instruction
    nop
    ld   a, d
    nop
    or   a
    nop
    rst  8
    nop
    rst  $28
    nop
    add  a, $00
    add  hl, sp
    nop
    cp   l
    nop
    sbc  a, $00
    ld   c, $00
    ld   [hl], c
    nop
    ld   a, e
    nop
    ld   a, e
    nop
    add  hl, sp
    nop
    add  a, $00
    rst  $28
    nop
    ldi  [hl], a
    nop
    ld   a, $00
    ldh  [$FF0C], a
    nop
    ld   b, b
    ld   bc, $0140
    jr   nz, label_34ECE
    nop
    inc  e

label_34ECE::
    nop
    inc  b
    stop
    add  hl, bc
    nop
    ld   [bc], a
    inc  c
    nop
    ld   [$F800], sp
    nop
    inc  h
    nop
    ldi  [hl], a
    nop
    ld   b, c
    ld   [bc], a
    inc  b
    inc  bc
    rlca
    pop  bc
    add  hl, bc
    jr   nz, label_34EF8
    stop
    jr   label_34EEC

label_34EEC::
    ld   h, a
    nop
    ld   bc, label_34000
    ld   b, c
    ld   [$FFF9], a
    ret  nz
    add  a, [hl]
    add  a, b
    add  a, h

label_34EF8::
    nop
    add  a, h
    ld   a, $C0
    ld   bc, $0000
    nop
    ld   a, [$FF00]
    ld   [de], a
    nop
    stop
    jr   label_34F08

label_34F08::
    rrca
    nop
    ld   bc, label_2100
    nop
    ld   bc, $0100
    nop
    ld   bc, label_34100
    nop
    rrca
    nop
    jr   label_34F1A

label_34F1A::
    stop
    ld   [de], a
    nop
    ld   a, [$FF00]
    adc  a, a
    nop
    ld   [label_800], sp
    nop
    jr   label_34F28

label_34F28::
    ld   a, [$FF00]
    add  a, h
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, d
    nop
    ld   a, [$FF00]
    jr   label_34F3A

label_34F3A::
    ld   [$8800], sp
    nop
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_34F6A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_34F6F
    rrca
    rlca
    rlca

label_34F6A::
    nop
    nop
    nop
    nop
    nop

label_34F6F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_34F8E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    rst  8
    nop
    sub  a, b
    nop
    daa
    nop
    ld   c, a
    nop
    ld   e, a
    nop
    ld   e, a
    nop

label_34F8E::
    ld   a, a
    nop
    rlca
    nop
    di
    nop
    ld   sp, hl
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    ld   e, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    sbc  a, h
    inc  bc
    rst  8
    nop
    ld   [rJOYP], a
    cp   $00
    ld   a, [$FA04]
    inc  b
    db   $F2 ; Undefined instruction
    inc  c
    db   $E4 ; Undefined instruction
    jr   label_34FC4
    ld   a, [$FFF2]
    nop
    dec  b
    nop
    ld   a, [$FF00]
    ldd  [hl], a
    nop

label_34FC4::
    ld   [label_410], sp
    jr   label_34FE9
    rra
    add  a, b
    ld   a, a
    ld   b, b
    ld   sp, label_211E
    nop
    ld   hl, label_34120
    ld   a, $41
    add  a, b
    ld   a, a
    inc  b
    ld    hl, sp+$A8
    db   $10 ; Undefined instruction
    stop
    db   $FC ; Undefined instruction
    nop
    ccf
    jr   nc, label_34FF3
    dec  d
    ld   [label_1865], sp
    nop

label_34FE9::
    rst  $38
    add  a, h
    ld   bc, $0081
    add  a, b
    nop
    ld   b, h
    add  a, d
    db   $10 ; Undefined instruction
    ld   b, h
    add  a, d
    nop
    rst  $38
    ld   h, a
    sbc  a, b
    sub  a, b
    ld   [label_800], sp
    rrca
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    and  b
    and  b
    sbc  a, a
    sub  a, a
    ret  z
    adc  a, b
    db   $E8 ; add  sp, d
    ret  nz
    di
    and  c
    db   $D3 ; Undefined instruction
    or   e
    ld   bc, label_301
    inc  bc
    dec  b
    dec  b
    ld   sp, hl
    jp   [hl]
    inc  de
    ld   de, label_317
    rst  8
    add  a, l
    set  1, l
    db   $D3 ; Undefined instruction
    or   e
    db   $D3 ; Undefined instruction
    or   e
    reti
    or   c
    push hl
    and  c
    db   $ED ; Undefined instruction
    xor  l
    or   $BC
    jp   label_FFBE
    rst  $38
    set  1, l
    set  1, l

label_35034::
    sbc  a, e
    adc  a, l
    and  a
    add  a, l
    or   a
    or   l
    ld   l, a
    dec  a
    jp   label_FF7D
    rst  $38
    inc  b
    add  hl, bc
    ld   a, a
    dec  c
    dec  sp
    ld   l, a
    ld   [hl], b
    ccf
    rst  $20
    jr   c, label_35034
    or   b
    ld   e, b
    ld   [rNR24], a
    ld   h, b
    jr   nc, label_35062
    or   $30
    call c, label_CF6
    db   $FC ; Undefined instruction
    push hl
    inc  e
    rla
    dec  c
    sbc  a, d
    rlca
    ld   c, b
    ld   b, $26
    ld   b, b

label_35062::
    ldi  [hl], a
    ret  nz
    cpl
    ld   b, b
    ld   sp, label_1840
    ld   [rIF], a
    jr   nc, label_35070
    inc  e
    nop
    inc  sp

label_35070::
    inc  a
    ld   [bc], a
    inc  l
    inc  bc
    call nz, label_2402
    ld   [bc], a
    sbc  a, h
    inc  bc
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, $00
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    nop
    nop
    rst  $38
    nop
    rst  $18
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $18
    ld   a, a
    nop
    nop
    rst  $38
    nop
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $CD
    ld   a, [hl]
    db   $DB
    ld   a, h
    rst  $30
    ld   a, b
    rst  $28
    ld   [hl], b
    db   $63
    ld   h, e
    or   $4F
    ret  c
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, $FF
    ld   a, $63
    db   $F2 ; Undefined instruction
    add  a, e
    jp   nz, label_203
    inc  bc
    ld   [bc], a
    rst  $38
    rst  $38
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    ret  nc
    rst  $28
    sub  a, b
    rst  $28
    sub  a, b
    rst  $28
    sbc  a, a
    ld   [$FFBF], a
    rst  $18
    ld   [$FFBF], a
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $0B
    rst  $30
    add  hl, bc
    rst  $30
    add  hl, bc
    rst  $30
    ld   sp, hl
    rlca
    db   $FD ; Undefined instruction
    ei
    rlca
    db   $FD ; Undefined instruction
    ret  nc
    rst  $28
    sub  a, b
    rst  $28
    sub  a, b
    rst  $28
    sub  a, b
    rst  $28
    sbc  a, a
    ld   [$FFBF], a
    rst  $38
    ld   [rIE], a
    rst  $18
    ld   [$FF0B], a
    rst  $30
    add  hl, bc
    rst  $30
    add  hl, bc
    rst  $30
    add  hl, bc
    rst  $30
    ld   sp, hl
    rlca
    db   $FD ; Undefined instruction
    rst  $38
    rlca
    rst  $38
    ei
    rlca
    cp   a
    ret  nz
    ld   a, [$FF80]
    ld   [$FF80], a
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz

label_3514B::
    add  a, b
    nop
    nop
    nop

label_3514F::
    nop
    db   $FD ; Undefined instruction
    inc  bc
    rrca
    ld   bc, $0107
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0000
    nop
    nop
    add  a, c
    ld   a, [hl]
    ld   b, d
    cp   l
    inc  h
    db   $DB
    jr   label_3514F
    db   $10 ; Undefined instruction
    jr   nz, label_3514B
    ld   b, b
    cp   a
    add  a, b
    ld   a, a
    add  a, [hl]
    ld   a, b
    ld   e, l
    and  b
    dec  de
    ret  nz
    ld   h, a
    add  a, b
    rst  $28
    nop
    rst  $18
    nop
    cp   a
    nop
    ld   a, a
    nop
    ld   h, c
    ld   e, $BA
    dec  b
    ret  c
    inc  bc
    and  $01
    rst  $28
    nop
    rst  $18
    nop
    cp   a
    nop
    ld   a, a
    nop
    ld   a, [hl]
    nop
    cp   l
    nop
    db   $DB
    nop
    rst  $20
    nop
    rst  $28
    nop
    rst  $18
    nop
    cp   a
    nop
    ld   a, a
    nop
    ld   a, $00
    sub  a, h
    nop
    adc  a, c
    nop
    ld   b, d
    nop
    and  l
    nop
    ld   c, d
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    nop
    rst  $38
    ld   bc, label_201
    ld   [bc], a
    dec  b
    inc  b
    add  hl, bc
    ld   [$E8EC], sp
    sbc  a, [hl]
    sbc  a, b
    jp   z, label_A888
    ret  z
    nop
    nop
    add  a, b
    add  a, b
    ld   c, [hl]
    ld   c, [hl]
    ldd  [hl], a
    ldd  [hl], a
    ld   h, [hl]
    ldi  [hl], a
    xor  [hl]
    ld   h, d
    inc  l
    db   $E4 ; Undefined instruction
    scf
    rst  $28
    ld   e, h
    ld   l, b
    ld   l, $38
    ld   a, e
    ld   a, c
    sbc  a, d
    sbc  a, d
    adc  a, $8A
    ld   l, [hl]
    ld   c, d
    ld   [hl], $3E
    dec  b
    inc  bc
    dec  hl
    ld   sp, hl
    or   c
    di
    ld   h, [hl]
    ld   h, d
    ld   l, d
    ld   h, $EC
    inc  h
    db   $F4 ; Undefined instruction
    inc  l
    cp   b
    ld   a, b
    ret  nc
    ld   [$FF80], a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, e
    rst  $38
    add  a, h
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    ld   bc, $0101
    ld   bc, $0101
    rst  $38
    pop  bc
    rst  $38
    ld   hl, label_11FF
    rst  $38
    ld   de, label_11FF
    rst  $38
    sbc  a, h
    rst  $30
    and  b
    rst  $28
    ret  z
    rst  $38
    ld    hl, sp+$FE
    adc  a, b
    rst  $38
    adc  a, c
    ld   sp, hl
    adc  a, c
    rst  $38
    rst  $38
    rst  $38
    add  hl, sp
    rst  $28
    dec  b

label_35234::
    rst  $30
    inc  de
    rst  $38
    rra
    ld   a, a
    ld   de, $91FF
    sbc  a, a
    sub  a, c
    rst  $38
    rst  $38
    inc  b
    add  hl, bc
    ld   a, a
    dec  c
    dec  sp
    ld   l, a
    ld   [hl], b
    ccf
    rst  $20
    jr   c, label_35234
    or   b
    ld   e, b
    ld   [rNR24], a
    ld   h, b
    jr   nc, label_35262
    or   $30
    call c, label_CF6
    db   $FC ; Undefined instruction
    push hl
    inc  e
    rla
    dec  c
    sbc  a, d
    rlca
    ld   c, b
    ld   b, $26
    ld   b, b

label_35262::
    ldi  [hl], a
    ret  nz
    cpl
    ld   b, b
    ld   sp, label_1840
    ld   [rIF], a
    jr   nc, label_35270
    inc  e
    nop
    inc  sp

label_35270::
    inc  a
    ld   [bc], a
    inc  l
    inc  bc
    call nz, label_2402
    ld   [bc], a
    sbc  a, h
    inc  bc
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, $00
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    rst  $38
    rst  $38
    sbc  a, a
    add  a, c
    rst  $20
    add  a, b
    ld    hl, sp+$80
    ei
    add  a, e
    ei
    sub  a, e
    ld   sp, hl
    or   c
    cp   c
    and  c
    rst  $38
    rst  $38
    ld   sp, hl
    add  a, c
    pop  hl
    rlca
    ld   bc, $C11F
    rst  $18
    ret
    rst  $18
    adc  a, l
    sbc  a, a
    add  a, a
    sbc  a, l
    cp   b
    add  a, b
    ld   a, [$FF87]
    pop  hl
    adc  a, a
    pop  bc
    sbc  a, a
    add  a, c
    cp   a
    add  a, c
    cp   [hl]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    dec  e
    ld   de, $89EF
    rst  $30
    add  a, l
    ei
    add  a, e
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, l
    ld   bc, rIE
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $18
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, h
    rst  $38
    ld   a, b
    nop
    nop
    rst  $38
    nop
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    add  a, [hl]
    rst  $18
    add  a, d
    xor  a
    jp   nz, label_E297
    bit  6, d
    ei
    ld   [hl], b
    db   $F4 ; Undefined instruction
    ld   a, b
    pop  af
    ld   a, [hl]
    db   $FC ; Undefined instruction
    ld   a, a
    db   $EB ; Undefined instruction
    ld   b, a
    pop  bc
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    rst  $38
    rst  $20
    db   $3A ; ldd  a, [hl]
    di
    ld   e, $3B
    ld   c, $4F
    add  a, [hl]
    sub  a, a
    ldh  [$FF0C], a
    ld   [hl], e
    cp   $2F
    ld   e, $FF
    cp   $00
    nop
    rst  $30
    ld    hl, sp+$98
    rst  $28
    adc  a, a
    rst  $30
    ld   c, a
    ld    hl, sp+$30
    rst  $38
    cpl
    rst  $38
    dec  l
    db   $FD ; Undefined instruction
    nop
    nop
    rst  $28
    rra
    dec  e
    di
    pop  af
    rst  $28
    db   $F2 ; Undefined instruction
    rra
    inc  c
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    or   h
    cp   a
    daa
    rst  $38
    pop  hl
    rst  $38
    ld   hl, label_379FF
    rst  $38
    rst  $20
    rst  $18
    ret  nz
    cp   a
    add  a, c
    rst  $38
    rst  $38

label_3536F::
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    add  a, a
    rst  $38
    add  a, h
    rst  $38
    sbc  a, [hl]
    rst  $38
    rst  $20
    ei
    inc  bc
    db   $FD ; Undefined instruction
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_35381::
    ld   b, $DF
    rst  $20
    rst  $28
    rst  $30
    db   $FD ; Undefined instruction
    rst  $38
    ld   c, h

label_35389::
    ld   a, a
    and  b
    ccf
    ld   [hl], c
    sbc  a, a
    jr   nc, label_3536F

label_35390::
    rst  $38
    jr   nc, label_35390
    di
    ei
    rst  $30
    sbc  a, a
    rst  $38
    ld   a, [de]
    cp   $05
    db   $FC ; Undefined instruction
    ld   c, $F9
    inc  c
    ei
    jr   c, label_35381
    db   $F2 ; Undefined instruction
    rst  $38
    jr   nc, label_353E5
    db   $3A ; ldd  a, [hl]
    rst  $18
    jr   c, label_35389
    rra
    rst  $38
    rst  $28
    ld   a, [$FFDF]
    ld   [rNR32], a
    ei
    ld   c, a
    rst  $38
    inc  c
    db   $FC ; Undefined instruction
    ld   e, a
    ld    hl, sp+$1C
    ei
    ld    hl, sp+$FF
    rst  $30
    rrca
    ei
    rlca

label_353C0::
    nop
    nop
    rst  $38
    nop
    rst  $18
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $18
    ld   a, a
    nop
    nop
    rst  $38
    nop
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $CD
    ld   a, [hl]
    db   $DB
    ld   a, h
    rst  $30

label_353E5::
    ld   a, b
    rst  $28
    ld   [hl], b
    db   $63
    ld   h, e
    or   $4F
    ret  c
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, $FF
    ld   a, $63
    db   $F2 ; Undefined instruction
    add  a, e
    jp   nz, label_203
    inc  bc
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    cp   $9D
    pop  hl
    sbc  a, l
    pop  hl
    xor  c
    pop  de
    xor  c
    pop  de
    sbc  a, c
    pop  hl
    sbc  a, l
    pop  hl
    sbc  a, l
    pop  hl
    adc  a, c
    pop  af
    xor  c
    pop  de
    xor  c
    pop  de
    cp   l
    db   $FD ; Undefined instruction
    jp   label_81C3
    sbc  a, c
    add  a, c
    and  l
    add  a, c
    and  l
    rst  $38
    ld   a, a
    cp   c
    add  a, a
    cp   c
    add  a, a
    sub  a, l
    adc  a, e
    sub  a, l
    adc  a, e
    sbc  a, c
    add  a, a
    cp   c
    add  a, a
    cp   c
    add  a, a
    sub  a, c
    adc  a, a
    sub  a, l
    adc  a, e
    sub  a, l
    adc  a, e
    cp   l
    cp   a
    jp   label_81C3
    sbc  a, c
    add  a, c
    and  l
    add  a, c
    and  l
    rst  $38
    rst  $38
    jr   label_35443
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    jr   c, label_3544C
    rst  $28
    jr   c, label_35478
    jr   c, label_3547A
    jr   c, label_3547C
    jr   c, label_3547E
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
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    jr   c, label_35494
    jr   c, label_35496
    jr   c, label_35498
    jr   c, label_3549A
    rst  $38
    rst  $28
    nop
    jr   c, label_35476
    nop

label_35478::
    rst  $38
    rst  $38

label_3547A::
    nop
    rst  $38

label_3547C::
    jr   label_3547D

label_3547E::
    rst  $38
    rst  $38
    inc  a
    inc  a
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   b, d
    ld   h, [hl]
    ld   b, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    adc  a, $CE

label_35494::
    db   $DB
    db   $DB

label_35496::
    db   $DB
    db   $DB

label_35498::
    db   $DB
    db   $DB

label_3549A::
    db   $DB
    db   $DB
    adc  a, $CE
    nop
    nop
    nop
    nop
    ldi  [hl], a
    ldi  [hl], a
    inc  d
    inc  d
    ld   [label_808], sp
    ld   [label_1414], sp
    ldi  [hl], a

label_354AD::
    ldi  [hl], a
    nop
    nop
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    and  c
    rst  $38
    and  l
    rst  $38
    add  a, l
    rst  $38
    rst  $38
    rst  $38
    inc  a
    inc  a
    ld   h, $26
    dec  h
    dec  h
    inc  h
    inc  h
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    and  h
    and  h
    cp   h
    cp   h
    cp   [hl]
    and  d
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    cp   $FE
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    cp   a
    and  c
    cp   a
    and  b
    cp   a
    cp   a
    add  a, b
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    rst  $38
    rst  $38
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    ld   [bc], a
    ld   [bc], a
    cp   $02
    cp   $FE
    ld   c, d
    cp   $FE
    cp   $FA
    call c, label_F22D
    inc  e
    pop  hl
    ret  c
    ld   hl, label_21D0
    ret  nz
    ld   sp, label_372E8
    sub  a, b
    db   $EC ; Undefined instruction
    sub  a, b
    db   $E4 ; Undefined instruction
    sub  a, b
    db   $E4 ; Undefined instruction
    or   b
    call nz, label_8278
    call nz, label_8201
    ld   bc, $0100
    ld   bc, label_35F00
    ccf
    or   b
    ld   c, a
    jr   c, label_354AD
    dec  e
    add  a, d
    dec  de
    add  a, h
    dec  bc
    add  a, h
    rlca
    ld   c, [hl]
    add  hl, bc
    scf
    add  hl, bc
    daa
    add  hl, bc
    daa

label_35534::
    dec  c
    inc  hl
    ld   e, $41
    inc  hl
    add  a, b
    ld   b, c
    add  a, b
    nop
    add  a, b
    add  a, b
    nop
    inc  b
    add  hl, bc
    ld   a, a
    dec  c
    dec  sp
    ld   l, a
    ld   [hl], b
    ccf
    rst  $20
    jr   c, label_35534
    or   b
    ld   e, b
    ld   [rNR24], a
    ld   h, b
    jr   nc, label_35562
    or   $30
    call c, label_CF6
    db   $FC ; Undefined instruction
    push hl
    inc  e
    rla
    dec  c
    sbc  a, d
    rlca
    ld   c, b
    ld   b, $26
    ld   b, b

label_35562::
    ldi  [hl], a
    ret  nz
    cpl
    ld   b, b
    ld   sp, label_1840
    ld   [rIF], a
    jr   nc, label_35570
    inc  e
    nop
    inc  sp

label_35570::
    inc  a
    ld   [bc], a
    inc  l
    inc  bc
    call nz, label_2402
    ld   [bc], a
    sbc  a, h
    inc  bc
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, $00
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    ld   bc, label_201
    ld   [bc], a
    dec  b
    inc  b
    add  hl, bc
    ld   [$E8EC], sp
    sbc  a, [hl]
    sbc  a, b
    jp   z, label_A888
    ret  z
    nop
    nop
    add  a, b
    add  a, b
    ld   c, [hl]
    ld   c, [hl]
    ldd  [hl], a
    ldd  [hl], a
    ld   h, [hl]
    ldi  [hl], a
    xor  [hl]
    ld   h, d
    inc  l
    db   $E4 ; Undefined instruction
    scf
    rst  $28
    ld   e, h
    ld   l, b
    ld   l, $38
    ld   a, e
    ld   a, c
    sbc  a, d
    sbc  a, d
    adc  a, $8A
    ld   l, [hl]
    ld   c, d
    ld   [hl], $3E
    dec  b
    inc  bc
    dec  hl
    ld   sp, hl
    or   c
    di
    ld   h, [hl]
    ld   h, d
    ld   l, d
    ld   h, $EC
    inc  h
    db   $F4 ; Undefined instruction
    inc  l
    cp   b
    ld   a, b
    ret  nc
    ld   [$FF80], a
    add  a, b
    ret  nz
    ret  nz
    and  b
    and  b
    sbc  a, a
    sub  a, a
    ret  z
    adc  a, b
    db   $E8 ; add  sp, d
    ret  nz
    di
    and  c
    db   $D3 ; Undefined instruction
    or   e
    ld   bc, label_301
    inc  bc
    dec  b
    dec  b
    ld   sp, hl
    jp   [hl]
    inc  de
    ld   de, label_317
    rst  8
    add  a, l
    set  1, l
    db   $D3 ; Undefined instruction
    or   e
    db   $D3 ; Undefined instruction
    or   e
    reti
    or   c
    push hl
    and  c
    db   $ED ; Undefined instruction
    xor  l
    or   $BC
    jp   label_FFBE
    rst  $38
    set  1, l
    set  1, l
    sbc  a, e
    adc  a, l
    and  a
    add  a, l
    or   a
    or   l
    ld   l, a
    dec  a
    jp   label_FF7D
    rst  $38
    ld   a, [hl]
    rst  $38
    db   $FC ; Undefined instruction
    ccf
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    dec  c
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    nop
    nop
    rst  $20
    ld    hl, sp+$30
    rst  $38
    rra
    rst  $38
    rra
    rst  $28
    ccf
    rst  8
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $20
    rra
    inc  c
    rst  $38
    ld    hl, sp+$FF
    ld    hl, sp+$F7
    db   $FC ; Undefined instruction
    di
    rst  $38
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    nop
    dec  c
    db   $F2 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    ret  c
    rst  $38
    db   $FC ; Undefined instruction
    ccf
    ld   a, [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    rra
    ccf
    rst  8
    rra
    rst  $28
    rra
    rst  $38
    jr   nc, label_3569D
    rst  $20
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FC
    di
    ld    hl, sp+$F7
    ld    hl, sp+$FF
    inc  c
    rst  $38
    rst  $20
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
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    sbc  a, a
    add  a, c
    rst  $20
    add  a, b
    ld    hl, sp+$80
    ei
    add  a, e
    ei
    sub  a, e
    ld   sp, hl
    or   c
    cp   c
    and  c
    rst  $38
    rst  $38
    ld   sp, hl
    add  a, c
    pop  hl
    rlca
    ld   bc, $C11F
    rst  $18
    ret
    rst  $18
    adc  a, l
    sbc  a, a
    add  a, a
    sbc  a, l
    cp   b
    add  a, b
    ld   a, [$FF87]
    pop  hl
    adc  a, a
    pop  bc
    sbc  a, a
    add  a, c
    cp   a
    add  a, c
    cp   [hl]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    dec  e
    ld   de, $89EF
    rst  $30
    add  a, l
    ei
    add  a, e
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, l
    ld   bc, rIE
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $18
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, h
    rst  $38
    ld   a, b
    nop
    nop
    rst  $38
    nop
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    add  a, [hl]
    rst  $18
    add  a, d
    xor  a
    jp   nz, label_E297
    bit  6, d
    ei
    ld   [hl], b
    db   $F4 ; Undefined instruction
    ld   a, b
    pop  af
    ld   a, [hl]
    db   $FC ; Undefined instruction
    ld   a, a
    db   $EB ; Undefined instruction
    ld   b, a
    pop  bc
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    rst  $38
    rst  $20
    db   $3A ; ldd  a, [hl]
    di
    ld   e, $3B
    ld   c, $4F
    add  a, [hl]
    sub  a, a
    ldh  [$FF0C], a
    ld   [hl], e
    cp   $2F
    ld   e, $FF
    cp   $FF
    rst  $28
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    add  a, e
    add  a, b
    or   b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    ld   bc, label_1901
    ld   bc, rIE
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    jp   nz, label_FFC0
    rst  $38
    sub  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    jp   nz, label_FFC0
    rst  $38
    inc  de
    inc  bc
    rst  $38
    rst  $38
    ld   hl, rSB
    rst  $38
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    add  hl, bc
    ld   bc, rIE
    add  a, b
    add  a, b
    sbc  a, e
    add  a, e
    cp   $FE
    ld    hl, sp+$F8
    ei
    ei
    db   $FD ; Undefined instruction
    ld   sp, hl
    cp   $FC
    rst  $38
    rst  $38
    inc  sp
    inc  bc
    jp   label_37FC3
    ld   a, a
    rst  $38
    rst  $38
    rst  $18
    rst  $18
    cp   a
    sbc  a, a
    ld   a, a
    ccf
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ei
    ld   sp, hl
    ei
    ei
    rst  $38
    rst  $38
    cp   $FE
    cp   $FE
    rst  $38
    rst  $38
    call z, label_3FC0
    ccf
    rst  $18
    sbc  a, a
    rst  $18
    rst  $18
    ccf
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    add  hl, de
    ld   bc, rIE
    sbc  a, a
    add  a, c
    rst  $20
    add  a, b
    ld    hl, sp+$80
    ei
    add  a, e
    ei
    sub  a, e
    ld   sp, hl
    or   c
    cp   c
    and  c
    rst  $38
    rst  $38
    ld   sp, hl
    add  a, c
    pop  hl
    rlca
    ld   bc, $C11F
    rst  $18
    ret
    rst  $18
    adc  a, l
    sbc  a, a
    add  a, a
    sbc  a, l
    cp   b
    add  a, b
    ld   a, [$FF87]
    pop  hl
    adc  a, a
    pop  bc
    sbc  a, a
    add  a, c
    cp   a
    add  a, c
    cp   [hl]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    dec  e
    ld   de, $89EF
    rst  $30
    add  a, l
    ei
    add  a, e
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, l
    ld   bc, rIE
    rst  $38
    rst  $38
    cp   $9D
    pop  hl
    sbc  a, l
    pop  hl
    xor  c
    pop  de
    xor  c
    pop  de
    sbc  a, c
    pop  hl
    sbc  a, l
    pop  hl
    sbc  a, l
    pop  hl
    adc  a, c
    pop  af
    xor  c
    pop  de
    xor  c
    pop  de
    cp   l
    db   $FD ; Undefined instruction
    jp   label_81C3
    sbc  a, c
    add  a, c
    and  l
    add  a, c
    and  l
    rst  $38
    ld   a, a
    cp   c
    add  a, a
    cp   c
    add  a, a
    sub  a, l
    adc  a, e
    sub  a, l
    adc  a, e
    sbc  a, c
    add  a, a
    cp   c
    add  a, a
    cp   c
    add  a, a
    sub  a, c
    adc  a, a
    sub  a, l
    adc  a, e
    sub  a, l
    adc  a, e
    cp   l
    cp   a
    jp   label_81C3
    sbc  a, c
    add  a, c
    and  l
    add  a, c
    and  l
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
    nop
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    ld   [$FF80], a
    rst  $38
    add  a, b
    cp   a
    ret  nz
    rst  $38
    rst  $38
    ret  nz
    ld   a, a
    cp   a
    ld   a, a
    nop
    nop
    rst  $38
    nop
    rlca
    ld   bc, label_1FF
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    rst  $38
    inc  bc
    cp   $FC
    cp   $00
    nop
    rst  $38
    nop
    nop
    nop
    ld   a, a
    ccf
    ld   [hl], b
    ld   l, a
    ld   h, b
    ld   e, a
    ld   h, a
    ld   e, a
    ld   a, b
    ld   a, b
    ld   c, e
    ld   c, b
    ld   a, a
    ld   a, a
    nop
    nop
    cp   $FC
    ld   b, $FE
    ld   [bc], a
    cp   $E2
    cp   $1E
    ld   e, $D2
    ld   [de], a
    cp   $FE
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    cp   $80
    ld   [$FF80], a
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
    rlca
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    rra
    rra
    ccf
    jr   nz, label_35944
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    inc  b
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    ld   a, a
    ld   b, b
    ld   e, a
    ld   b, b
    ld   l, a
    ld   b, b
    ld   d, b
    ld   h, b
    jr   nz, label_35929
    ccf
    ccf
    dec  l
    inc  sp
    ccf
    ld   e, $FE
    ld   [bc], a
    ld   a, [$F602]
    ld   [bc], a
    ld   a, [bc]
    ld   b, $04
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    or   h
    call z, label_378FC
    inc  bc
    inc  bc
    inc  b
    inc  b
    ld   a, [bc]
    ld   [label_1015], sp
    inc  l
    ld   hl, label_34558
    ld   d, d
    ld   c, c
    ld   d, d
    ld   c, c
    ret  nz
    ret  nz
    jr   nz, label_35934
    ld   d, b
    db   $10 ; Undefined instruction
    ld   [$A414], sp
    ld   a, [bc]
    or   d
    ld   h, $9A
    ld   b, d
    sbc  a, d
    ld   c, d
    ld   b, c
    ld   [hl], e
    ld   b, b
    db   $E8 ; add  sp, d
    ld   d, b
    ldh  [$FF0C], a
    ld   e, c
    pop  bc

label_35929::
    ld   a, e
    push hl
    dec  sp
    ld   [hl], h
    dec  de
    ccf
    rrca
    ld   b, [hl]
    sub  a, d
    jp   z, label_1B06
    ld   c, $2B
    sbc  a, $BF
    sbc  a, $BF
    call c, label_D83E
    db   $FC ; Undefined instruction
    ld   a, [$FF04]
    add  hl, bc
    ld   a, a
    dec  c

label_35944::
    dec  sp
    ld   l, a
    ld   [hl], b
    ccf
    rst  $20
    jr   c, label_35934
    or   b
    ld   e, b
    ld   [rNR24], a
    ld   h, b
    jr   nc, label_35962
    or   $30
    call c, label_CF6
    db   $FC ; Undefined instruction
    push hl
    inc  e
    rla
    dec  c
    sbc  a, d
    rlca
    ld   c, b
    ld   b, $26
    ld   b, b

label_35962::
    ldi  [hl], a
    ret  nz
    cpl
    ld   b, b
    ld   sp, label_1840
    ld   [rIF], a
    jr   nc, label_35970
    inc  e
    nop
    inc  sp

label_35970::
    inc  a
    ld   [bc], a
    inc  l
    inc  bc
    call nz, label_2402
    ld   [bc], a
    sbc  a, h
    inc  bc
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, $00
    nop
    nop
    rra
    rra
    jr   nz, label_359C6
    ld   b, b
    ccf
    ld   b, b
    inc  a
    ld   b, e
    jr   c, label_359D5
    jr   c, label_359D7
    nop
    nop
    nop
    ld    hl, sp+$F8
    inc  b
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    inc  a
    jp   nz, label_E21C
    inc  e
    ldh  [$FF0C], a
    jr   c, label_359E9
    jr   c, label_359EB
    inc  a
    ld   b, e
    ccf
    ld   b, b
    ccf
    ld   b, b
    rra
    jr   nz, label_359AD

label_359AD::
    rra
    nop
    nop
    inc  e
    ldh  [$FF0C], a
    inc  e
    ldh  [$FF0C], a
    inc  a
    jp   nz, label_2FC
    db   $FC ; Undefined instruction
    ld   [bc], a
    ld    hl, sp+$04
    nop
    ld    hl, sp+$00
    nop
    rst  $38
    rst  $38
    sbc  a, a
    add  a, c
    rst  $20
    add  a, b

label_359C6::
    ld    hl, sp+$80
    ei
    add  a, e
    ei
    sub  a, e
    ld   sp, hl
    or   c
    cp   c
    and  c
    rst  $38
    rst  $38
    ld   sp, hl
    add  a, c
    pop  hl

label_359D5::
    rlca
    ld   bc, $C11F
    rst  $18
    ret
    rst  $18
    adc  a, l
    sbc  a, a
    add  a, a
    sbc  a, l
    cp   b
    add  a, b
    ld   a, [$FF87]
    pop  hl
    adc  a, a
    pop  bc
    sbc  a, a
    add  a, c

label_359E9::
    cp   a
    add  a, c

label_359EB::
    cp   [hl]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    dec  e
    ld   de, $89EF
    rst  $30
    add  a, l
    ei
    add  a, e
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, l
    ld   bc, rIE
    rst  $38
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    and  b
    and  b
    sbc  a, a
    sub  a, a
    ret  z
    adc  a, b
    db   $E8 ; add  sp, d
    ret  nz
    di
    and  c
    db   $D3 ; Undefined instruction
    or   e
    ld   bc, label_301
    inc  bc
    dec  b
    dec  b
    ld   sp, hl
    jp   [hl]
    inc  de
    ld   de, label_317
    rst  8
    add  a, l
    set  1, l
    db   $D3 ; Undefined instruction
    or   e
    db   $D3 ; Undefined instruction
    or   e
    reti
    or   c
    push hl
    and  c
    db   $ED ; Undefined instruction
    xor  l
    or   $BC
    jp   label_FFBE
    rst  $38
    set  1, l
    set  1, l
    sbc  a, e
    adc  a, l
    and  a
    add  a, l
    or   a
    or   l
    ld   l, a
    dec  a
    jp   label_FF7D
    rst  $38
    inc  bc
    inc  bc
    inc  b
    inc  b
    ld   a, [bc]
    ld   [label_1015], sp
    inc  l
    ld   hl, label_34558
    ld   d, d
    ld   c, c
    ld   d, d
    ld   c, c
    ret  nz
    ret  nz
    jr   nz, label_35A74
    ld   d, b
    db   $10 ; Undefined instruction
    ld   [$A414], sp
    ld   a, [bc]
    or   d
    ld   h, $9A
    ld   b, d
    sbc  a, d
    ld   c, d
    ld   b, c
    ld   [hl], e
    ld   b, b
    db   $E8 ; add  sp, d
    ld   d, b
    ldh  [$FF0C], a
    ld   e, c
    pop  bc
    ld   a, e
    push hl
    dec  sp
    ld   [hl], h
    dec  de
    ccf
    rrca
    ld   b, [hl]
    sub  a, d
    jp   z, label_1B06
    ld   c, $2B
    sbc  a, $BF
    sbc  a, $BF
    call c, label_D83E
    db   $FC ; Undefined instruction
    ld   a, [$FF00]
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    rst  $38
    rst  $38
    sbc  a, a
    add  a, c
    rst  $20
    add  a, b
    ld    hl, sp+$80
    ei
    add  a, e
    ei
    sub  a, e
    ld   sp, hl
    or   c
    cp   c
    and  c
    rst  $38
    rst  $38
    ld   sp, hl
    add  a, c
    pop  hl
    rlca
    ld   bc, $C11F
    rst  $18
    ret
    rst  $18
    adc  a, l
    sbc  a, a
    add  a, a
    sbc  a, l
    cp   b
    add  a, b
    ld   a, [$FF87]
    pop  hl
    adc  a, a
    pop  bc
    sbc  a, a
    add  a, c
    cp   a
    add  a, c
    cp   [hl]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    dec  e
    ld   de, $89EF
    rst  $30
    add  a, l
    ei
    add  a, e
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, l
    ld   bc, rIE
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    add  a, e
    rst  $38
    add  a, h
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    ld   bc, $0101
    ld   bc, $0101
    rst  $38
    pop  bc
    rst  $38
    ld   hl, label_11FF
    rst  $38
    ld   de, label_11FF
    rst  $38
    sbc  a, h
    rst  $30
    and  b
    rst  $28
    ret  z
    rst  $38
    ld    hl, sp+$FE
    adc  a, b
    rst  $38
    adc  a, c
    ld   sp, hl
    adc  a, c
    rst  $38
    rst  $38
    rst  $38
    add  hl, sp
    rst  $28
    dec  b
    rst  $30
    inc  de
    rst  $38
    rra
    ld   a, a
    ld   de, $91FF
    sbc  a, a
    sub  a, c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop

label_35BAD::
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    nop
    nop
    rst  $38
    nop
    rst  $18
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $18
    ld   a, a
    nop
    nop
    rst  $38
    nop
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $FF
    cp   $CD
    ld   a, [hl]
    db   $DB
    ld   a, h
    rst  $30
    ld   a, b
    rst  $28
    ld   [hl], b
    db   $63
    ld   h, e
    or   $4F
    ret  c
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, $FF
    ld   a, $63
    db   $F2 ; Undefined instruction
    add  a, e
    jp   nz, label_203
    inc  bc
    ld   [bc], a
    rst  $38
    rst  $38
    ld   a, [label_2DDC]
    db   $F2 ; Undefined instruction
    inc  e
    pop  hl
    ret  c
    ld   hl, label_21D0
    ret  nz
    ld   sp, label_372E8
    sub  a, b
    db   $EC ; Undefined instruction
    sub  a, b
    db   $E4 ; Undefined instruction
    sub  a, b
    db   $E4 ; Undefined instruction
    or   b
    call nz, label_8278
    call nz, label_8201
    ld   bc, $0100
    ld   bc, label_35F00
    ccf
    or   b
    ld   c, a
    jr   c, label_35BAD
    dec  e
    add  a, d
    dec  de
    add  a, h
    dec  bc
    add  a, h
    rlca
    ld   c, [hl]
    add  hl, bc
    scf
    add  hl, bc
    daa
    add  hl, bc
    daa

label_35C34::
    dec  c
    inc  hl
    ld   e, $41
    inc  hl
    add  a, b
    ld   b, c
    add  a, b
    nop
    add  a, b
    add  a, b
    nop
    inc  b
    add  hl, bc
    ld   a, a
    dec  c
    dec  sp
    ld   l, a
    ld   [hl], b
    ccf
    rst  $20
    jr   c, label_35C34
    or   b
    ld   e, b
    ld   [rNR24], a
    ld   h, b
    jr   nc, label_35C62
    or   $30
    call c, label_CF6
    db   $FC ; Undefined instruction
    push hl
    inc  e
    rla
    dec  c
    sbc  a, d
    rlca
    ld   c, b
    ld   b, $26
    ld   b, b

label_35C62::
    ldi  [hl], a
    ret  nz
    cpl
    ld   b, b
    ld   sp, label_1840
    ld   [rIF], a
    jr   nc, label_35C70
    inc  e
    nop
    inc  sp

label_35C70::
    inc  a
    ld   [bc], a
    inc  l
    inc  bc
    call nz, label_2402
    ld   [bc], a
    sbc  a, h
    inc  bc
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, $00
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    inc  bc
    inc  bc
    inc  b
    inc  b
    ld   a, [bc]
    ld   [label_1015], sp
    inc  l
    ld   hl, label_34558
    ld   d, d
    ld   c, c
    ld   d, d
    ld   c, c
    ret  nz
    ret  nz
    jr   nz, label_35CF4
    ld   d, b
    db   $10 ; Undefined instruction
    ld   [$A414], sp
    ld   a, [bc]
    or   d
    ld   h, $9A
    ld   b, d
    sbc  a, d
    ld   c, d
    ld   b, c
    ld   [hl], e
    ld   b, b
    db   $E8 ; add  sp, d
    ld   d, b
    ldh  [$FF0C], a
    ld   e, c
    pop  bc
    ld   a, e
    push hl
    dec  sp
    ld   [hl], h
    dec  de
    ccf
    rrca
    ld   b, [hl]
    sub  a, d
    jp   z, label_1B06
    ld   c, $2B
    sbc  a, $BF
    sbc  a, $BF
    call c, label_D83E
    db   $FC ; Undefined instruction
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $28
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    add  a, e
    add  a, b
    or   b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    ld   bc, label_1901
    ld   bc, rIE
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    jp   nz, label_FFC0
    rst  $38
    sub  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    jp   nz, label_FFC0
    rst  $38
    inc  de
    inc  bc
    rst  $38
    rst  $38
    ld   hl, rSB
    rst  $38
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    add  hl, bc
    ld   bc, rIE
    add  a, b
    add  a, b
    sbc  a, e
    add  a, e
    cp   $FE
    ld    hl, sp+$F8
    ei
    ei
    db   $FD ; Undefined instruction
    ld   sp, hl
    cp   $FC
    rst  $38
    rst  $38
    inc  sp
    inc  bc
    jp   label_37FC3
    ld   a, a
    rst  $38
    rst  $38
    rst  $18
    rst  $18
    cp   a
    sbc  a, a
    ld   a, a
    ccf
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ei
    ld   sp, hl
    ei
    ei
    rst  $38
    rst  $38
    cp   $FE
    cp   $FE
    rst  $38
    rst  $38
    call z, label_3FC0
    ccf
    rst  $18
    sbc  a, a
    rst  $18
    rst  $18
    ccf
    rra
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    add  hl, de
    ld   bc, label_303
    inc  b
    inc  b
    ld   a, [bc]
    ld   [label_1015], sp
    inc  l
    ld   hl, label_34558
    ld   d, d
    ld   c, c
    ld   d, d
    ld   c, c
    ret  nz
    ret  nz
    jr   nz, label_35DF4
    ld   d, b
    db   $10 ; Undefined instruction
    ld   [$A414], sp
    ld   a, [bc]
    or   d
    ld   h, $9A
    ld   b, d
    sbc  a, d
    ld   c, d
    ld   b, c
    ld   [hl], e
    ld   b, b
    db   $E8 ; add  sp, d
    ld   d, b
    ldh  [$FF0C], a
    ld   e, c
    pop  bc
    ld   a, e
    push hl
    dec  sp
    ld   [hl], h
    dec  de
    ccf
    rrca
    ld   b, [hl]
    sub  a, d
    jp   z, label_1B06
    ld   c, $2B
    sbc  a, $BF
    sbc  a, $BF
    call c, label_D83E
    db   $FC ; Undefined instruction
    ld   a, [$FF80]
    add  a, b
    ret  nz
    ret  nz
    and  b
    and  b
    sbc  a, a
    sub  a, a
    ret  z
    adc  a, b
    db   $E8 ; add  sp, d
    ret  nz
    di
    and  c
    db   $D3 ; Undefined instruction
    or   e
    ld   bc, label_301
    inc  bc
    dec  b
    dec  b
    ld   sp, hl
    jp   [hl]
    inc  de
    ld   de, label_317
    rst  8
    add  a, l
    set  1, l
    db   $D3 ; Undefined instruction
    or   e
    db   $D3 ; Undefined instruction
    or   e
    reti
    or   c
    push hl
    and  c
    db   $ED ; Undefined instruction
    xor  l
    or   $BC
    jp   label_FFBE
    rst  $38
    set  1, l
    set  1, l
    sbc  a, e
    adc  a, l
    and  a
    add  a, l
    or   a
    or   l
    ld   l, a
    dec  a
    jp   label_FF7D
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
    rra
    rrca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    rrca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    rra
    nop
    nop
    nop
    nop
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$04
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    rra
    rrca
    rra
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld    hl, sp+$FC
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rra
    rra
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $18
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, h
    rst  $38
    ld   a, b
    nop
    nop
    rst  $38
    nop
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    add  a, [hl]
    rst  $18
    add  a, d
    xor  a
    jp   nz, label_E297
    bit  6, d
    ei
    ld   [hl], b
    db   $F4 ; Undefined instruction
    ld   a, b
    pop  af
    ld   a, [hl]
    db   $FC ; Undefined instruction
    ld   a, a
    db   $EB ; Undefined instruction
    ld   b, a
    pop  bc
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    rst  $38
    rst  $20
    db   $3A ; ldd  a, [hl]
    di
    ld   e, $3B
    ld   c, $4F
    add  a, [hl]
    sub  a, a
    ldh  [$FF0C], a
    ld   [hl], e
    cp   $2F
    ld   e, $FF
    cp   $0F
    rrca
    ld   [de], a
    db   $10 ; Undefined instruction
    jr   nz, label_35F4A
    ld   b, a
    ld   [hl], a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   a, a
    ld   c, a
    ld   a, [$FFF0]
    ld   c, b
    ld   [label_444], sp
    jp   nz, label_EEE2
    db   $F2 ; Undefined instruction
    db   $F2 ; Undefined instruction
    db   $F2 ; Undefined instruction
    db   $F2 ; Undefined instruction
    db   $F2 ; Undefined instruction
    cp   $F2
    ld   b, a
    ld   b, a
    ld   h, d
    ld   b, b
    ld   [hl], d
    ld   h, b
    ld   a, a
    ld   d, d
    ld   e, a
    ld   l, a
    ld   b, b
    ld   [hl], b
    cpl
    jr   nc, label_35F4E
    rra
    ldh  [$FF0C], a
    ldh  [$FF0C], a
    ld   b, [hl]
    ld   [bc], a
    ld   c, [hl]
    ld   b, $FE
    ld   c, d
    ld   a, [label_2F6]
    ld   c, $F4
    inc  c
    ld    hl, sp+$F8
    ld   b, $06
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [de]
    ld   [de], a
    dec  de
    inc  de
    inc  a
    inc  a

label_35F4A::
    ld   h, b
    ld   b, b
    ld   e, h
    ld   e, h

label_35F4E::
    sbc  a, $9E
    ld   h, b
    ld   h, b
    ld   d, b
    ld   d, b
    ld   e, b
    ld   c, b
    ret  c
    ret  z
    inc  a
    inc  a
    ld   b, $02
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, e
    ld   a, c
    sbc  a, [hl]
    sbc  a, [hl]
    adc  a, [hl]
    adc  a, [hl]
    ret  nz
    add  a, b
    ld   a, [label_37292]
    ld   h, d
    jr   nc, label_35F8C
    inc  a
    inc  l
    ccf
    ccf
    ld   a, c
    ld   a, c
    ld   [hl], c
    ld   [hl], c
    inc  bc
    ld   bc, label_3495F
    ld   c, [hl]
    ld   b, [hl]
    inc  c
    inc  b
    inc  a
    inc  [hl]
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d

label_35F8C::
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    ld   d, a
    ld   d, a
    or   d
    sub  a, d
    ld    hl, sp+$B0
    adc  a, $CC
    sbc  a, a
    adc  a, a
    xor  l
    sbc  a, l
    ld   sp, hl
    sbc  a, c
    reti
    cp   c
    ld   [label_34DEA], a
    ld   c, c
    rra
    dec  c
    ld   [hl], e
    inc  sp
    ld   sp, hl
    pop  af
    or   l
    cp   c
    sbc  a, a
    sbc  a, c
    sbc  a, e
    sbc  a, l
    ld   sp, hl
    ld   sp, hl
    sbc  a, a
    ld   sp, hl
    xor  c
    rst  $18
    or   a
    rst  8
    rst  $18
    ld   h, b
    ld   c, a
    ld   [hl], b
    jr   nc, label_3602D
    rra
    rrca
    sbc  a, a
    sbc  a, a
    ld   sp, hl
    sbc  a, a
    sub  a, l
    ei
    db   $ED ; Undefined instruction
    di
    ei
    ld   b, $F2
    ld   c, $0C
    db   $FC ; Undefined instruction
    ld    hl, sp+$F0
    ld   a, h
    nop
    add  a, [hl]
    nop
    add  a, d
    nop
    add  a, d
    nop
    add  a, [hl]
    nop
    call z, label_37900
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   a, c
    nop
    call z, label_8600
    nop
    add  a, d
    nop
    add  a, d
    nop
    add  a, [hl]
    nop
    ld   a, h
    nop
    ld   a, $00
    ld   h, c
    nop
    ld   b, c
    nop
    ld   b, c
    nop
    ld   h, c
    nop
    inc  sp
    nop
    sbc  a, [hl]

label_3602D::
    nop
    ret  nz
    nop
    ret  nz
    nop
    sbc  a, [hl]
    nop
    inc  sp
    nop
    ld   h, c
    nop
    ld   b, c
    nop
    ld   b, c
    nop
    ld   h, c
    nop
    ld   a, $00
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_3606A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_3606F
    rrca
    rlca
    rlca

label_3606A::
    nop
    nop
    nop
    nop
    nop

label_3606F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_3608E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF0F]
    sub  a, [hl]
    ld   l, a
    sub  a, [hl]
    ld   l, a
    ld   [$FF1F], a
    ld   c, $F1
    ld   l, [hl]
    pop  af
    ld   l, [hl]
    pop  af

label_3608E::
    nop
    rst  $38
    ld   a, [$FF0F]
    or   $0F
    or   $0F
    db   $10 ; Undefined instruction
    rra
    ld   [$FF67], a
    sbc  a, b
    ld   h, a
    sbc  a, b
    rlca
    ld    hl, sp+$E0
    rra
    and  $19
    and  $19
    ld    hl, sp+$07
    ld   [label_36FF7], sp
    ld   a, [$FF6F]
    ld   a, [$FF0F]
    ld   a, [$FF00]
    rst  $38
    halt
    halt
    ld   [hl], b
    adc  a, a
    rlca
    ld    hl, sp+$69
    or   $69
    or   $0F
    ld   a, [$FF60]
    inc  e
    ret  z
    rlca
    add  a, l
    ld   [bc], a
    add  a, l
    ld   [bc], a
    ret
    ld   b, $30
    rst  8
    nop
    ld   a, a
    jr   label_360F6
    inc  bc
    db   $10 ; Undefined instruction
    ld   a, [$FF84]
    ld   b, b
    ld   [bc], a
    add  a, b
    nop
    add  a, d
    ld   b, h
    add  a, d
    inc  a
    jp   nz, label_37C80
    ld   bc, label_1C3E
    ld   h, e
    ldi  [hl], a
    ld   b, c
    ld   b, b
    ld   bc, $0142
    inc  a
    inc  bc
    add  a, b
    ld   e, $C0
    nop
    nop
    ld    hl, sp+$60
    sbc  a, [hl]
    jp   nc, label_A121
    ld   b, b
    add  a, c
    ld   b, b
    ld   hl, label_353C0
    jr   nz, label_36125
    jr   label_36106
    nop
    ld   b, l
    nop
    add  hl, bc
    nop

label_36106::
    inc  de
    nop
    ld   h, $00
    call label_1B00
    nop
    rst  $30
    nop
    and  b
    nop
    and  b
    nop
    and  h
    nop
    ret  nc
    nop
    ld   l, b
    nop
    or   a
    nop
    ret  c
    nop
    rst  $28

label_3611F::
    nop
    rst  $30
    nop
    dec  de
    nop
    db   $ED ; Undefined instruction

label_36125::
    nop
    ld   d, $00
    dec  bc
    nop
    dec  b
    nop
    ld   b, l
    nop
    dec  b
    nop
    rst  $28
    nop
    ret  c
    nop
    or   a
    nop
    ld   l, b
    nop
    ret  nc
    nop
    and  h
    nop
    and  b
    nop
    and  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_3616A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_3616F
    rrca
    rlca
    rlca

label_3616A::
    nop
    nop
    nop
    nop
    nop

label_3616F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_3618E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
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
    rra
    ld   h, b
    ld   a, $41
    ld   [hl], $49
    inc  hl
    ld   e, h
    add  hl, hl
    ld   d, [hl]

label_3618E::
    inc  a

label_3618F::
    ld   b, e
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$06
    ld   a, h
    add  a, d
    ld   l, h
    sub  a, d
    call nz, label_943A
    ld   l, d
    inc  a
    jp   nz, label_3413E
    ld   l, $51
    ld   h, $59
    scf
    ld   c, b
    ld   a, $41
    rra
    ld   h, b
    nop
    ccf
    nop
    nop
    ld   a, h
    add  a, d
    ld   [hl], h
    adc  a, d
    ld   h, h
    sbc  a, d
    db   $EC ; Undefined instruction
    ld   [de], a
    ld   a, h
    add  a, d
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    dec  b
    ld   [bc], a
    ld   b, h
    ld   bc, $0108
    ld   [de], a
    add  a, c
    ld   h, $81
    adc  a, l
    ld   b, d
    inc  bc
    inc  a
    db   $D3 ; Undefined instruction
    inc  h
    and  b
    nop
    and  d
    nop
    and  b
    ld   c, $D0
    ld   [$F800], sp
    sub  a, e
    inc  h
    ret  c
    ldi  [hl], a
    xor  [hl]
    ld   b, c
    db   $D3 ; Undefined instruction
    inc  h
    dec  de
    daa
    push bc
    add  hl, sp
    ld   b, $10
    dec  bc
    jr   nc, label_361EB

label_361EB::
    cpl
    ld   b, l
    jr   nz, label_361F4
    ld   b, b
    xor  $41
    ld   [$FFF9], a

label_361F4::
    or   c
    add  a, [hl]
    db   $E8 ; add  sp, d
    add  a, h
    ld   d, b
    add  a, h
    nop
    db   $FC ; Undefined instruction
    and  b
    ld   b, d
    and  c
    ld   b, b
    add  a, h
    nop
    daa
    nop
    ld   l, b
    nop
    add  hl, bc
    nop
    sbc  a, d
    nop
    db   $F2 ; Undefined instruction
    nop
    jr   nz, label_3620E

label_3620E::
    add  hl, hl
    nop
    inc  d
    nop
    or   $00
    ld   [de], a
    nop
    ret  c
    nop
    rrca
    nop
    ld   h, [hl]
    nop
    inc  b
    nop
    sub  a, l
    nop
    inc  l
    nop
    inc  l
    nop
    ld   h, b
    nop
    ld   sp, hl
    nop
    inc  c
    nop
    ld   h, a
    nop
    inc  h
    nop
    sub  a, h
    nop
    or   h
    nop
    inc  h
    nop
    rrca
    nop
    sbc  a, c
    nop
    jr   nc, label_3623A

label_3623A::
    and  $00
    inc  h
    nop
    ld   sp, $0000
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_3626A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_3626F
    rrca
    rlca
    rlca

label_3626A::
    nop
    nop
    nop
    nop
    nop

label_3626F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp

label_36274::
    jr   z, label_3628E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, bc
    nop
    inc  de
    nop
    ld   h, $00
    ld   c, l
    nop
    sbc  a, e
    nop

label_3628A::
    ld   [hl], $00
    ld   l, a
    nop

label_3628E::
    rst  $18
    nop
    sub  a, b
    nop
    ret  z
    nop
    ld   h, h
    nop
    or   d
    nop
    reti
    nop
    db   $EC ; Undefined instruction
    nop
    or   $00
    ei
    nop
    db   $DB
    nop

label_362A2::
    ld   l, a
    nop
    scf
    nop
    sbc  a, e
    nop
    ld   c, l
    nop
    ld   h, $00
    inc  de
    nop
    add  hl, bc
    nop
    ei
    nop
    or   [hl]
    nop
    db   $EC ; Undefined instruction
    nop
    reti
    nop

label_362B8::
    or   d
    nop
    ld   h, h
    nop
    ret  z
    nop
    sub  a, b
    nop
    add  a, d

label_362C1::
    inc  b
    jr   z, label_362CB
    ld   h, b
    rrca
    ld   [de], a
    inc  c
    ld   h, h
    sbc  a, b
    add  a, b

label_362CB::
    ld   a, b
    ld   b, b
    ccf
    nop
    ldd  [hl], a
    inc  h
    db   $10 ; Undefined instruction
    ld   a, [$FF0A]
    ld   a, [$FF44]
    jr   c, label_36319
    ccf
    sub  a, d
    ld   l, h
    jr   z, label_362A2
    sbc  a, c
    ld   b, h
    dec  d
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   e, d
    inc  h
    nop
    db   $FC ; Undefined instruction
    inc  de
    inc  c
    ld   l, b
    rlca
    jr   nz, label_362F2
    sub  a, b
    inc  b
    add  a, b
    ld   b, h

label_362F2::
    jr   z, label_362B8
    ld   d, c
    ld   l, $47
    jr   c, label_362C1
    jr   nc, label_36311
    ld   [rDIV], a
    jr   nz, label_36310
    jr   nz, label_3628A
    nop
    ld   b, c
    nop
    ldi  [hl], a
    nop
    inc  a
    nop
    jr   nc, label_3630A

label_3630A::
    inc  h
    nop
    ld   c, b
    nop
    ret  nc
    nop

label_36310::
    adc  a, b

label_36311::
    nop
    ret  nz
    nop
    inc  h
    nop
    ld   [de], a
    nop
    sbc  a, b

label_36319::
    nop
    jr   c, label_3631C

label_3631C::
    ld   b, h
    nop
    add  a, e
    nop
    pop  bc
    nop
    ldi  [hl], a
    nop
    inc  e
    nop
    add  hl, bc
    nop
    ld   c, b
    nop
    inc  h
    nop
    inc  de
    nop
    ld   bc, $0100
    nop
    ld   [de], a
    nop
    inc  h
    nop
    ld   c, h
    nop
    inc  e
    nop
    inc  h
    nop
    jp   nz, label_8100
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_3636A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction

label_36365::
    jr   label_3636F
    rrca
    rlca
    rlca

label_3636A::
    nop
    nop
    nop
    nop
    nop

label_3636F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_3638E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld   h, a
    nop
    ld   e, a
    nop
    ld   a, [hl]
    nop
    ld   a, h
    nop
    ld   a, c
    nop

label_3638E::
    ldd  [hl], a
    nop
    nop
    nop
    ld   a, h
    nop
    ld   c, [hl]
    nop
    ld   a, [hl]
    nop
    ld   e, $00
    adc  a, $00
    ld   [rJOYP], a
    ld   h, b

label_3639F::
    nop
    ld   [bc], a
    nop
    dec  sp
    nop
    ld   c, c
    nop
    ld   e, h
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]

label_363AB::
    nop
    inc  a
    nop
    nop
    nop
    and  $00
    jp   z, label_9600
    nop
    ld   l, $00
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    inc  a
    nop
    nop
    nop
    add  a, c
    nop
    ld   hl, label_1240
    ld   hl, label_122C
    jr   nz, label_363E8
    inc  d
    ldi  [hl], a
    ld   b, c
    ldi  [hl], a
    add  a, b
    ld   h, e
    add  a, b
    nop
    jp   nz, label_2C00
    ret  nz
    ld   [$C830], sp
    jr   nc, label_363AB
    jr   z, label_36365
    ld   b, h
    ld   b, h
    add  a, e
    jr   label_363C9
    ld   [bc], a
    inc  a
    inc  b
    jr   label_363FB
    ld   [label_814], sp
    inc  de
    inc  c
    ld   h, b
    inc  de
    nop
    ld   bc, $8245
    cp   h
    ld   b, d
    ld   e, b
    inc  h
    ld   b, h
    jr   c, label_36445
    jr   nc, label_3639F

label_363FB::
    ld   b, b
    ld   b, d
    add  a, b
    add  a, c

label_363FF::
    nop
    add  a, b
    nop
    adc  a, h
    nop
    adc  a, [hl]
    nop
    add  a, $00
    ld   h, b
    nop
    jr   nc, label_3640C

label_3640C::
    ld   e, b
    nop
    rrca
    nop
    rrca
    nop
    jr   label_36414

label_36414::
    jr   nc, label_36416

label_36416::
    ld   h, d
    nop
    ret  nz
    nop
    adc  a, h
    nop
    adc  a, h
    nop
    add  a, b
    nop
    ld   bc, label_3100
    nop
    ld   [hl], c
    nop
    ld   h, e
    nop
    ld   b, $00
    inc  c
    nop
    jr   label_3642E

label_3642E::
    ld   a, [$FF00]
    ld   a, [$FF00]
    jr   label_36434

label_36434::
    inc  c
    nop
    ld   b, $00
    inc  sp
    nop
    ld   sp, $8100
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop

label_36445::
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_3646A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_3646F
    rrca
    rlca
    rlca

label_3646A::
    nop
    nop
    nop
    nop
    nop

label_3646F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_3648E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    cp   b
    ld   b, h
    ld   sp, hl
    inc  b
    jp   [hl]
    inc  d
    ld   a, c
    add  a, h
    ld   bc, label_378
    nop

label_3648E::
    ccf
    nop
    ld   bc, $F802
    ld   bc, label_340BC
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $EC ; Undefined instruction
    ld   [de], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    ret  nz
    inc  a
    ld   a, a
    nop
    ld   l, a
    db   $10 ; Undefined instruction
    ld   bc, label_57A

label_364A8::
    ld   a, $41
    ld   e, $21
    add  a, b
    ld   e, $C0
    nop
    add  a, b
    ld   b, b
    ld   e, $80
    ccf
    nop
    ld   a, e
    inc  b
    ld   l, a
    db   $10 ; Undefined instruction
    nop
    ld   a, a
    nop
    ld   bc, $803E
    nop
    ld   b, b
    adc  a, a
    ld   l, c
    sub  a, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    add  hl, bc
    jr   nc, label_36513
    add  hl, sp
    jr   label_364F7
    inc  de
    inc  c
    inc  h
    jr   label_3651D
    or   b
    ld   [bc], a
    ld   a, [$FF08]
    ld   a, [$FF51]
    adc  a, [hl]
    ld   b, h
    adc  a, b
    jr   nc, label_364A8
    inc  d
    inc  hl
    ld   b, d
    ld   hl, label_21D2
    dec  c
    db   $F2 ; Undefined instruction
    ld   de, label_100E
    rrca
    jr   nz, label_36506
    add  a, b
    ld   [hl], b
    nop
    ld    hl, sp+$64
    sbc  a, b
    sub  a, d
    inc  c
    ld   de, $E00E
    inc  de
    nop
    pop  hl
    add  a, b
    ld   bc, $0001
    inc  de
    nop
    ld   h, $00
    ld   c, h
    nop

label_36506::
    sbc  a, b
    nop
    jr   nc, label_3650A

label_3650A::
    ld   h, h
    nop
    ret  z
    nop
    sub  a, b
    nop
    ret  nz
    nop
    ld   h, b

label_36513::
    nop
    ldd  [hl], a
    nop
    sbc  a, c
    nop
    ld   c, h
    nop
    ld   h, $00
    inc  de

label_3651D::
    nop
    add  hl, bc
    nop
    sub  a, b
    nop
    ret  z
    nop
    ld   h, h
    nop
    ldd  [hl], a
    nop
    sbc  a, c
    nop
    ld   c, h
    nop
    ld   b, $00
    inc  bc
    nop
    add  hl, bc
    nop
    inc  de
    nop
    ld   h, $00
    inc  c
    nop
    add  hl, de
    nop
    ldd  [hl], a
    nop
    ld   h, h
    nop
    ret  z
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_3656A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction

label_36565::
    jr   label_3656F
    rrca
    rlca

label_36569::
    rlca

label_3656A::
    nop
    nop
    nop
    nop
    nop

label_3656F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_3658E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop

label_3657D::
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld   a, [hl]
    ld   bc, label_26C
    ld   a, c
    inc  b
    ld   [hl], e
    ld   [label_1066], sp

label_3658E::
    ld   l, a
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [hl]
    add  a, b
    ld   [hl], $40
    sbc  a, [hl]
    jr   nz, label_36569
    db   $10 ; Undefined instruction
    ld   [$00F6], sp
    ld   h, a
    ld   [label_473], sp
    ld   a, c
    ld   [bc], a
    ld   e, h
    ld   bc, $007E
    ccf
    ld   b, b
    nop
    ccf
    nop
    nop
    and  $10
    adc  a, $20
    sbc  a, [hl]
    ld   b, b
    ld   [hl], $80
    ld   a, [hl]
    nop
    db   $FC ; Undefined instruction
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    ld   [de], a
    ld   bc, label_2E5
    ld   a, [bc]
    inc  h
    add  a, h
    jr   label_365ED
    jr   label_36626
    inc  h
    and  h
    ld   b, e
    ld   b, h
    add  a, e
    ld   b, c
    add  a, b
    and  c
    ld   b, b
    ld   d, d
    inc  h
    jr   nz, label_365F0
    ld   b, h
    jr   z, label_36565
    ld   b, h
    add  hl, bc
    add  a, $32
    ret
    ld   b, l
    add  a, d
    cp   b
    ld   b, a
    ld   d, [hl]
    add  hl, hl
    dec  h
    jr   label_3657D
    ld   [label_C42], sp
    dec  b

label_365ED::
    db   $3A ; ldd  a, [hl]
    ldh  [$FF0C], a
    ld   bc, label_3718A
    sub  a, l
    ld   b, d
    ld   l, d
    add  a, h
    inc  d
    db   $E8 ; add  sp, d
    ret
    jr   nc, label_3663D
    inc  a
    and  h
    ld   b, d
    ld   c, c
    add  a, b
    ld   a, $00
    ld   a, $00
    and  d
    nop
    ld   b, c
    nop
    ld   b, c
    nop
    ld   h, e
    nop
    sbc  a, a
    nop
    rlca
    nop
    stop
    ld   [label_2F00], sp
    nop
    ld   [$F800], sp
    nop
    db   $E4 ; Undefined instruction
    nop
    db   $E3 ; Undefined instruction
    nop
    pop  hl
    nop
    daa
    nop
    add  a, a
    nop
    ret  z
    nop

label_36626::
    ld   [hl], b
    nop
    ld   [hl], b
    nop
    ld   a, c
    nop
    rst  0
    nop
    ld   b, e
    nop
    pop  hl
    nop
    pop  af
    nop
    adc  a, [hl]
    nop
    add  a, h
    nop
    sub  a, h
    nop
    call nz, label_F900

label_3663D::
    nop
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_3666A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_3666F
    rrca
    rlca
    rlca

label_3666A::
    nop
    nop
    nop
    nop
    nop

label_3666F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_3668E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld   [hl], e
    nop
    ld   h, [hl]
    nop
    ld   c, h
    nop
    ld   e, c
    nop
    ld   [hl], e
    nop

label_3668E::
    ld   h, a
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ld   e, $00
    ld   a, [hl]
    nop
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    ld   c, a
    nop
    ld   e, a
    nop
    ld   e, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    ld   b, b
    nop
    ccf
    nop
    nop
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    inc  a
    ld   [bc], a
    inc  a
    ld   [bc], a
    dec  h
    add  a, d
    ld   b, $43
    ld   l, $43
    ld   e, e
    daa
    db   $E3 ; Undefined instruction
    rra
    dec  de
    rlca
    stop
    nop
    ld   [label_F20], sp
    sub  a, b
    ld   [$F800], sp
    inc  d
    ld   [$FFD3], a
    ld   [$FFD1], a
    ld   [$FF0B], a
    rlca
    adc  a, c
    rlca
    call nz, label_36809
    db   $10 ; Undefined instruction
    jr   nc, label_3671F
    ld   c, b
    jp   label_34304
    nop
    pop  de
    ld   [$FF89], a
    ld   a, [$FFF2]
    adc  a, h
    ld   c, b
    add  a, h
    ld   d, b
    add  a, h
    add  a, h
    ld   b, b
    cp   c
    ld   b, b
    or   b

label_366FF::
    ld   b, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    and  b
    and  b
    sbc  a, a
    sub  a, a
    ret  z
    adc  a, b
    db   $E8 ; add  sp, d
    ret  nz
    di
    and  c
    db   $D3 ; Undefined instruction
    or   e
    ld   bc, label_301
    inc  bc
    dec  b
    dec  b
    ld   sp, hl
    jp   [hl]
    inc  de
    ld   de, label_317
    rst  8
    add  a, l
    set  1, l
    db   $D3 ; Undefined instruction
    or   e
    db   $D3 ; Undefined instruction
    or   e
    reti
    or   c
    push hl
    and  c
    db   $ED ; Undefined instruction
    xor  l
    or   $BC
    jp   label_FFBE
    rst  $38
    set  1, l
    set  1, l
    sbc  a, e
    adc  a, l
    and  a
    add  a, l
    or   a
    or   l
    ld   l, a
    dec  a
    jp   label_FF7D
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
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    nop
    nop
    rst  $38
    nop
    rst  $18
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, h
    rst  $38
    ld   a, b
    nop
    nop
    rst  $38
    nop
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    add  a, [hl]
    rst  $18
    add  a, d
    xor  a
    jp   nz, label_E297
    bit  6, d
    ei
    ld   [hl], b
    db   $F4 ; Undefined instruction
    ld   a, b
    pop  af
    ld   a, [hl]
    db   $FC ; Undefined instruction
    ld   a, a
    db   $EB ; Undefined instruction
    ld   b, a
    pop  bc
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    rst  $38
    rst  $20
    db   $3A ; ldd  a, [hl]
    di
    ld   e, $3B
    ld   c, $4F
    add  a, [hl]
    sub  a, a
    ldh  [$FF0C], a
    ld   [hl], e
    cp   $2F
    ld   e, $FF
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    db   $FC ; Undefined instruction

label_36809::
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   a, [$FFF0]
    ld   [$FFE0], a
    rst  $38
    rst  $38
    ld   a, [$FFF0]
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
    rst  $38
    rst  $38
    rrca
    rrca
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    ccf
    ccf
    rra
    rra
    rrca
    rrca
    rlca
    rlca
    ld   [$FFE0], a
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $8001
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_301
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    nop
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop

label_368AD::
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $FE
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
    add  a, b
    add  a, b
    ld   a, [$FFF0]
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
    ld   bc, label_F01
    rrca
    rst  $38
    rst  $38
    rlca
    rlca
    rrca
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
    rst  $38
    rst  $38
    rst  $38
    ld   a, [label_2DDC]
    db   $F2 ; Undefined instruction
    inc  e
    pop  hl
    ret  c
    ld   hl, label_21D0
    ret  nz
    ld   sp, label_372E8
    sub  a, b
    db   $EC ; Undefined instruction
    sub  a, b
    db   $E4 ; Undefined instruction
    sub  a, b
    db   $E4 ; Undefined instruction
    or   b
    call nz, label_8278
    call nz, label_8201
    ld   bc, $0100
    ld   bc, label_35F00
    ccf
    or   b
    ld   c, a
    jr   c, label_368AD
    dec  e
    add  a, d
    dec  de
    add  a, h
    dec  bc
    add  a, h
    rlca
    ld   c, [hl]
    add  hl, bc
    scf
    add  hl, bc
    daa
    add  hl, bc
    daa
    dec  c
    inc  hl
    ld   e, $41
    inc  hl
    add  a, b
    ld   b, c
    add  a, b
    nop
    add  a, b
    add  a, b
    nop
    ret  nz
    ret  nz
    and  b
    and  b
    sub  a, e
    sub  a, e
    call label_3698E
    ld   c, [hl]
    ld   [hl], b
    ld   e, a
    ld   sp, label_133F
    ld   e, $03
    inc  bc
    dec  b
    dec  b
    ret
    ret
    or   e
    ld   [hl], c
    sub  a, [hl]
    ld   [hl], d
    ld   c, $FA
    adc  a, h
    db   $FC ; Undefined instruction
    ret  z
    ld   a, b
    ld   h, e
    ld   a, [hl]
    adc  a, a
    cp   $8F
    ld   a, [label_3784F]
    ccf
    inc  a
    rra
    rla
    add  hl, hl
    daa
    ld   e, b
    ld   c, a
    add  a, $7E
    pop  af
    ld   a, a
    pop  af
    ld   e, a
    db   $F2 ; Undefined instruction
    ld   e, $FC
    inc  a
    ld    hl, sp+$E8
    sub  a, h
    db   $E4 ; Undefined instruction
    ld   a, [de]
    db   $F2 ; Undefined instruction
    nop
    rst  $38
    nop
    add  a, b
    ccf
    add  a, e
    ccf
    add  a, d
    ccf
    cp   [hl]
    ccf
    and  d
    ccf
    and  d

label_3698E::
    ccf
    and  d
    ccf
    rst  $38
    ccf
    ld   hl, $E1FF
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, label_21E1
    rst  $38
    ccf
    ld   a, $A2
    ccf
    and  e
    inc  hl
    and  e

label_369A6::
    ccf
    cp   a
    ccf
    cp   a
    ccf
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    or   l
    sub  a, [hl]
    db   $EC ; Undefined instruction
    rst  $28
    inc  c
    dec  bc
    ld   c, $09
    dec  sp
    inc  a
    ld   b, a
    ld   b, h
    cp   l
    sbc  a, [hl]
    and  e
    cp   [hl]
    xor  l
    ld   l, c
    scf
    rst  $30
    jr   nc, label_369A6
    ld   [hl], b
    sub  a, b
    call c, label_E23C
    ldi  [hl], a
    cp   l
    ld   a, c
    call label_A77D
    cp   d
    and  l
    cp   e
    and  e
    cp   h
    rst  $18
    sbc  a, a
    and  b
    ret  nz
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    ccf
    ccf
    push hl
    ld   e, l
    and  l
    db   $C5
    push bc
    dec  a
    ei
    ld   sp, hl
    dec  b
    inc  bc
    ld   bc, label_2FF
    cp   $FC
    db   $FC ; Undefined instruction
    inc  a
    nop
    ld   b, [hl]
    nop
    ldh  [$FF0C], a
    nop
    db   $F2 ; Undefined instruction
    nop
    ld   a, [$F800]
    nop
    db   $FD ; Undefined instruction
    nop
    ld   a, l
    nop
    nop
    nop
    ld   [hl], e
    nop
    rst  8
    nop
    cp   a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, e
    nop
    ld   [hl], a
    nop
    scf
    nop
    cpl
    nop
    cpl
    nop
    rra
    nop
    sbc  a, a
    nop
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
    nop
    cp   $00
    cp   $00
    cp   $00
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    di
    nop
    rst  $28
    nop
    rst  $18
    nop
    jp   label_F900
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    ld   a, $00
    cp   [hl]
    nop
    cp   a
    nop
    cp   a
    nop
    cp   a
    nop
    cp   a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, [hl]
    nop
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, $00
    ld   a, $00
    ccf
    nop
    cp   a
    nop
    cp   a
    nop
    ld   a, a
    nop
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
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   a, [$FF00]
    pop  af
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    pop  hl
    nop
    sbc  a, [hl]
    nop
    ld   a, [$F200]
    nop
    ld   [$F900], a
    nop
    di
    nop
    rst  $20
    nop
    rst  $28
    nop
    rst  8
    nop
    inc  a
    nop
    inc  a
    nop
    ld   a, b
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    rst  $18
    nop
    sbc  a, a
    nop
    ld   e, [hl]
    nop
    ld   e, c
    nop
    ld   b, c
    nop
    inc  sp
    nop
    sbc  a, [hl]
    nop
    ret  nz
    nop
    cp   $00
    cp   [hl]
    nop
    ccf
    nop
    ld   e, a
    nop
    ld   c, a
    nop
    ld   c, [hl]
    nop
    ld   h, d
    nop
    inc  a
    nop
    add  a, e
    nop
    inc  hl
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_36B0A

label_36B0A::
    jr   nc, label_36B0C

label_36B0C::
    ld   bc, $0100
    nop
    rlca
    nop
    ld   c, $00
    inc  e
    nop
    ld   e, b
    nop
    jr   label_36B1A

label_36B1A::
    jr   label_36B1C

label_36B1C::
    sbc  a, b
    nop
    sbc  a, c
    nop
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   [rJOYP], a
    jp   nz, label_8000
    nop
    jr   c, label_36B32

label_36B32::
    ld   [hl], b
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    adc  a, h
    nop
    inc  c
    nop
    ld   bc, label_300
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc  c
    ld   [label_101B], sp
    rla
    db   $10 ; Undefined instruction
    stop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jr   nc, label_36B6A
    ret  c
    ld   [label_8E8], sp
    db   $E8 ; add  sp, d
    ld   [label_1017], sp
    dec  de
    db   $10 ; Undefined instruction
    jr   label_36B6F
    rrca
    rlca
    rlca

label_36B6A::
    nop
    nop
    nop
    nop
    nop

label_36B6F::
    nop
    db   $E8 ; add  sp, d
    ld   [label_8D8], sp
    jr   z, label_36B8E
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, [hl]
    ld   bc, label_27C
    ld   a, c
    inc  b

label_36B8E::
    inc  bc
    ld   a, b
    nop
    nop
    ld   a, h
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   e, $60
    ld   c, $10
    ld   [$FF0E], a
    ld   a, [$FF00]
    inc  bc
    nop
    ld   a, c
    ld   [bc], a
    ld   a, h
    ld   bc, $007E
    ld   a, [hl]
    nop
    ld   a, $40
    nop
    ld   a, $00
    nop
    and  $10
    adc  a, $20
    ld   e, $C0
    ld   a, $00

label_36BB8::
    cp   $00
    db   $FC ; Undefined instruction
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ld   bc, $0102
    adc  a, h
    inc  bc
    ld   d, d
    adc  a, l
    ld   l, c
    sub  a, b
    adc  a, c
    ld   [hl], b
    ld   [hl], $49
    jr   z, label_36C17
    rlca
    nop
    adc  a, b
    rlca
    sub  a, b
    inc  c
    ret  nc
    ld   [$8870], sp
    nop
    ld    hl, sp+$68
    sub  a, b
    xor  c
    db   $10 ; Undefined instruction
    ldi  [hl], a
    ld   b, l
    ldi  [hl], a
    ld   e, l
    ldi  [hl], a
    ld   b, b
    ccf
    rra
    ld   h, b
    and  c
    ld   b, b
    add  a, c
    ld   b, b
    ld   [bc], a
    add  a, c
    xor  h
    db   $10 ; Undefined instruction
    jr   c, label_36B8E
    ld   h, [hl]
    jr   nz, label_36BB8
    ld   b, b
    add  a, b
    ld   b, [hl]
    add  a, b
    ld   b, [hl]
    add  a, b

label_36BFE::
    add  a, b
    nop
    nop
    nop
    ld   a, a
    nop
    ld   a, b
    ccf
    ld   a, h
    ccf
    ld   e, [hl]
    ccf
    ld   c, a
    ccf
    ld   b, a
    ccf
    ld   b, a
    ccf
    nop
    nop
    cp   $00
    ld   e, $FC
    ld   a, $FC
    ld   a, d
    db   $FC ; Undefined instruction
    db   $F2 ; Undefined instruction
    db   $FC ; Undefined instruction
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    ld   b, a
    ccf
    ld   b, a
    ccf
    ld   c, a
    ccf
    ld   e, [hl]
    ccf
    ld   a, h
    ccf
    ld   a, b
    ccf
    ld   a, a
    nop
    nop
    nop
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    db   $F2 ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, d
    db   $FC ; Undefined instruction
    ld   a, $FC
    ld   e, $FC
    cp   $00
    nop
    nop
    ld   h, $1D
    inc  [hl]
    rrca
    rst  $10
    rrca
    ld   l, [hl]
    add  a, l
    ld   d, $E5
    cp   $F9
    dec  b
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ld   h, h
    cp   b
    ld   l, h
    or   b
    db   $EB ; Undefined instruction
    ld   a, [$FF76]
    and  c
    ld   l, b
    and  a
    ld   a, a
    sbc  a, a
    cp   [hl]
    dec  b
    ld   b, h
    ccf
    ld   [bc], a
    db   $FC ; Undefined instruction
    push af
    ld   [$F9FE], sp
    ld   d, $E5
    ld   l, [hl]
    add  a, l
    sub  a, $0D
    ld   [hl], $0D
    inc  h
    rra
    ld   b, h
    ccf
    cp   a
    inc  b
    ld   a, a
    sbc  a, a
    ld   l, b
    and  a
    halt
    ld   l, e
    or   b
    ld   l, h
    or   b
    inc  h
    ld    hl, sp+$00
    nop
    cp   a
    ld   h, b
    ldd  [hl], a
    db   $ED ; Undefined instruction
    jr   nz, label_36C87
    jr   nz, label_36C89
    rst  $38
    rst  $38
    rst  $30
    inc  c
    inc  b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    rst  $38
    rst  $38
    rst  $38
    jr   nz, label_36C99
    cp   a
    ld   h, b
    rst  $38
    rst  $38
    inc  b
    rst  $38
    ld   b, [hl]
    dec  a
    ld   h, [hl]
    dec  e
    ld   b, a
    ccf
    ld   b, h
    ccf
    ld   h, [hl]
    dec  e
    ld   a, [hl]
    ld   a, l
    ld   b, $7D
    ld   b, [hl]
    dec  a
    ld   l, e
    rst  $18
    ld   l, e
    rst  $18
    rst  $28
    rst  $18
    ld   l, e
    rst  $18
    ld   l, e
    rst  $18
    ld   a, e
    rst  $38
    ld   c, e
    rst  $38
    ld   l, e
    rst  $18
    add  a, c
    nop
    cp   $81
    sub  a, d
    db   $ED ; Undefined instruction
    add  a, b
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  a
    inc  a
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  0
    rst  $38
    rst  $38
    rst  $38
    and  $DF
    rst  $38
    ld   h, h
    rst  $38
    rst  $38
    inc  a
    rst  $38
    cp   $7D
    ld   c, [hl]
    dec  a
    ld   c, a
    ld   a, $67
    rra
    ld   b, a
    ccf
    ld   b, a
    ccf
    ld   l, [hl]
    dec  e
    adc  a, [hl]
    ld   a, l
    ld   l, a
    rst  $18
    ld   a, a
    rst  $18
    rst  $38
    rst  $38
    db   $EB ; Undefined instruction
    rst  $18
    db   $EB ; Undefined instruction
    rst  $18
    ei
    rst  $28
    ld   a, a
    rst  $38
    ld   a, a
    rst  $18
    call nz, label_FFFF
    rst  $38
    rst  $38
    ld   a, [$FF70]
    rst  $38
    ld   a, a
    rst  $18
    ld   l, h
    rst  $18
    ld   l, a
    rst  $18
    ld   l, e
    rst  $18
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    ld   c, $FF
    cp   $FB
    ld   [hl], $FB
    or   $FB
    sub  a, $FB
    ld   l, e
    rst  $18
    ld   l, e
    rst  $18
    ld   l, [hl]
    rst  $18
    ld   l, a
    rst  $18
    ld   a, b
    rst  $18
    ld   a, a
    ld   a, [$FFFF]
    rst  $38
    call nz, label_D6FF
    ei
    sub  a, $FB
    halt
    or   $FB
    ld   e, $FB
    cp   $0F
    rst  $38
    rst  $38
    rlca
    rst  $38
    ld   l, e
    ld   e, a
    xor  e
    rst  $18
    rr   a
    dec  de
    rst  $28
    ei
    rst  $30
    rlca
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sub  a, $FA
    push de
    ei
    db   $D3 ; Undefined instruction
    ld    hl, sp+$D8
    rst  $30
    rst  $18
    rst  $28
    ld   [$FFDF], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    ei
    ei
    rst  $30
    dec  de
    rst  $28
    rr   a
    xor  e
    rst  $18
    ld   l, e
    ld   e, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [$FFDF], a
    rst  $18
    rst  $28
    ret  c
    rst  $30
    db   $D3 ; Undefined instruction
    ld    hl, sp+$D5
    ei
    sub  a, $FA
    inc  b
    rst  $38
    rst  $38
    rst  $38
    cp   a
    ld   h, b
    jr   nz, label_36D87
    rst  $38
    rst  $38
    inc  b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    rst  $38
    rst  $30
    inc  c
    rst  $38
    rst  $38
    jr   nz, label_36D97
    jr   nz, label_36D99
    ldd  [hl], a
    db   $ED ; Undefined instruction
    cp   a
    ld   h, b
    nop
    nop
    sub  a, $FB
    sub  a, $FB
    rst  $30
    ei
    sub  a, $FB
    sub  a, $FB
    sbc  a, $FF
    jp   nc, label_D6FF
    ei
    ld   h, d
    cp   h
    ld   h, [hl]
    cp   b
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    ldi  [hl], a
    db   $FC ; Undefined instruction
    ld   h, [hl]
    cp   b
    ld   a, [hl]
    cp   [hl]
    ld   h, b
    cp   [hl]
    ld   h, d
    cp   h
    inc  a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   h, h
    and  $DF
    rst  $38
    rst  $38
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  a
    rst  $18
    rst  $38
    inc  a
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    add  a, b
    rst  $38
    sub  a, d
    db   $ED ; Undefined instruction
    cp   $81
    add  a, c
    nop
    or   $FB
    cp   $FB
    rst  $38
    rst  $38
    rst  $10
    ei
    rst  $10
    ei
    rst  $18
    rst  $30
    cp   $FF
    cp   $FB
    ld   [hl], c
    cp   [hl]
    halt
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    ldh  [$FF0C], a
    db   $FC ; Undefined instruction
    and  $F8
    db   $F2 ; Undefined instruction
    ld   a, h
    ld   [hl], d
    cp   h
    ld   a, a
    cp   [hl]
    nop
    nop
    rra
    nop
    inc  l
    rra
    ld   e, a
    ccf
    ld   a, h
    ccf
    ld   e, [hl]
    ccf
    ld   d, a
    ccf
    ld   d, e
    ccf
    nop
    nop
    ld    hl, sp+$00
    inc  [hl]
    ld    hl, sp+$FA
    db   $FC ; Undefined instruction
    ld   a, $FC
    ld   a, d
    db   $FC ; Undefined instruction
    ld   [$CAFC], a
    db   $FC ; Undefined instruction
    ld   d, e
    ccf
    ld   d, a
    ccf
    ld   e, [hl]
    ccf
    ld   a, h
    ccf
    ld   e, a
    ccf
    inc  l
    rra
    rra
    nop
    nop
    nop
    jp   z, label_EAFC
    db   $FC ; Undefined instruction
    ld   a, d
    db   $FC ; Undefined instruction
    ld   a, $FC
    ld   a, [label_34FC]
    ld    hl, sp+$F8
    nop
    nop
    nop
    add  hl, sp
    rla
    add  hl, bc
    rla
    add  a, e
    ld   c, $8B
    add  a, $D7
    ldi  [hl], a
    dec  bc
    pop  af
    dec  a
    ld   sp, hl
    rst  $38
    add  a, $9C
    db   $E8 ; add  sp, d
    sub  a, b
    db   $E8 ; add  sp, d
    pop  bc
    ld   [hl], b
    pop  de
    ld   h, e
    db   $EB ; Undefined instruction
    ld   b, h
    ret  nc
    adc  a, a
    cp   h
    sbc  a, a
    rst  $38
    ld   h, e
    rst  $38
    add  a, $3D
    ld   sp, hl
    dec  bc
    pop  af
    rst  $10
    ldi  [hl], a
    adc  a, e
    add  a, $83
    ld   c, $09
    rla
    add  hl, sp
    rla
    rst  $38
    ld   h, e
    cp   h
    sbc  a, a
    ret  nc
    adc  a, a
    db   $EB ; Undefined instruction
    ld   b, h
    pop  de
    ld   h, e
    pop  bc
    ld   [hl], b
    sub  a, b
    db   $E8 ; add  sp, d
    sbc  a, h
    db   $E8 ; add  sp, d
    nop
    nop
    cp   l
    ld   a, [hl]
    ld   h, [hl]
    jp   label_81C3
    jp   label_3C
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    rst  $38
    rst  $38
    inc  a
    rst  $38
    add  a, c
    rst  $38
    db   $DB
    rst  $20
    inc  a
    rst  $38
    add  a, c
    ld   a, [hl]
    ld   h, [hl]
    sbc  a, c
    and  l
    jp   label_3758
    add  hl, sp
    ld   h, a
    ld   h, e
    ld   c, a
    ld   b, d
    ld   c, a
    ld   b, d
    ld   c, a
    ld   h, e
    ld   c, a
    add  hl, sp
    ld   h, a
    ld   e, b
    scf
    xor  l
    rst  $18
    ld   c, c
    cp   a
    db   $D3 ; Undefined instruction
    ccf
    dec  de
    ld   [hl], a
    dec  de
    ld   [hl], a
    db   $D3 ; Undefined instruction
    ccf
    ld   c, c
    cp   a
    xor  l
    rst  $18
    nop
    nop
    cp   l
    ld   a, [hl]
    ld   h, [hl]
    jp   label_C383
    jp   label_C7FF
    ld   a, [hl]
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    cp   e
    rst  $38
    add  a, e
    rst  $38
    rst  $38
    rst  0
    db   $FC ; Undefined instruction
    rst  $38
    jr   nc, label_36EDB
    ld   sp, hl
    ld   [hl], $FF
    ld   sp, hl
    ld   e, h
    dec  sp
    cpl
    ld   a, a
    ld   h, e
    ld   c, a
    ld   b, c
    ld   c, a
    ld   b, e
    ld   c, a
    ld   h, a
    ld   c, a
    ccf
    ld   a, l
    ld   e, l
    dec  sp
    rst  $18
    cp   a
    reti
    cp   a
    ei
    rst  $30
    ei
    rst  $30
    db   $DB
    or   a
    sbc  a, c
    ld   a, a
    adc  a, a
    ld   a, a
    rst  8
    cp   a
    rst  0
    pop  hl
    pop  hl
    cp   $70
    rst  $38
    jr   c, label_36F87
    inc  e
    ld   a, a
    adc  a, a
    ld   a, a
    add  a, a
    ld   a, a
    rst  0
    cp   a
    db   $E3 ; Undefined instruction
    add  a, a
    add  a, a
    ld   a, a
    ld   c, $FF
    inc  e
    cp   $38
    cp   $F1
    cp   $E1
    cp   $E3
    db   $FD ; Undefined instruction
    rst  0
    cp   a
    add  a, a
    ld   a, a
    adc  a, a
    ld   a, a
    inc  e
    ld   a, a
    jr   c, label_36FA9
    ld   [hl], b
    rst  $38
    pop  hl
    cp   $C7
    pop  hl
    db   $E3 ; Undefined instruction
    db   $FD ; Undefined instruction
    pop  hl
    cp   $F1
    cp   $38
    cp   $1C
    cp   $0E
    rst  $38
    add  a, a
    ld   a, a
    db   $E3 ; Undefined instruction
    add  a, a
    ld   c, l
    cp   a
    adc  a, c
    ccf
    dec  hl
    rst  $18
    dec  de
    rst  $28
    ei
    rst  $30
    add  a, a
    ei
    ccf
    rst  $38
    rst  $38
    rst  $38
    or   d
    db   $FD ; Undefined instruction
    sub  a, c
    db   $FC ; Undefined instruction
    call nc, label_D8FB
    rst  $30
    rst  $18
    rst  $28
    pop  hl
    rst  $18
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    add  a, a
    ei
    ei
    rst  $30
    dec  de
    rst  $28
    dec  hl
    rst  $18
    adc  a, c
    ccf
    ld   c, l
    cp   a
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    pop  hl
    rst  $18
    rst  $18
    rst  $28
    ret  c
    rst  $30
    call nc, label_91FB
    db   $FC ; Undefined instruction
    or   d
    db   $FD ; Undefined instruction
    and  l
    jp   label_9966
    add  a, c
    ld   a, [hl]
    inc  a

label_36F87::
    rst  $38
    db   $DB
    rst  $20
    add  a, c
    rst  $38
    inc  a
    rst  $38
    rst  $38
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    jp   label_C33C
    add  a, c
    ld   h, [hl]
    jp   label_37EBD
    nop
    nop
    or   l
    ei
    sub  a, d
    db   $FD ; Undefined instruction
    set  7, h
    ret  c
    xor  $D8

label_36FA9::
    xor  $CB
    db   $FC ; Undefined instruction
    sub  a, d
    db   $FD ; Undefined instruction
    or   l
    ei
    ld   a, [de]
    db   $EC ; Undefined instruction
    sbc  a, h
    and  $C6
    db   $F2 ; Undefined instruction
    ld   b, d
    db   $F2 ; Undefined instruction
    ld   b, d
    db   $F2 ; Undefined instruction
    add  a, $F2
    sbc  a, h
    and  $1A
    db   $EC ; Undefined instruction
    rst  $38
    ld   sp, hl
    ld   sp, hl
    ld   [hl], $30
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  0
    add  a, e
    rst  $38
    cp   e
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ld   l, [hl]
    db   $FD ; Undefined instruction
    rst  0
    ld   a, [hl]
    jp   label_83FF
    jp   label_C366
    cp   l
    ld   a, [hl]
    nop
    nop
    ei
    db   $FD ; Undefined instruction
    sbc  a, e
    db   $FD ; Undefined instruction
    rst  $18
    rst  $28
    rst  $18
    rst  $28
    db   $DB
    db   $ED ; Undefined instruction
    sbc  a, c
    cp   $F1
    cp   $F3
    db   $FD ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    call c, label_FEF4
    add  a, $F2
    add  a, d

label_36FF7::
    db   $F2 ; Undefined instruction
    jp   nz, label_E6F2
    db   $F2 ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   [hl]
    cp   d

label_36FFF::
    call c, label_FF
    rlca
    ld    hl, sp+$00
    rst  $38
    ld   a, h
    rst  $38
    rst  0
    rst  $38
    add  hl, sp
    rst  0
    cp   $01
    rst  $18
    jr   nz, label_37010
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    rlca
    rst  $38
    call c, label_373FF
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF9F]
    ld   [$FF99], a
    and  $CC
    di
    call nz, label_D0F3
    rst  $20
    xor  [hl]
    pop  bc
    xor  e
    call nz, label_C0BF
    db   $FD ; Undefined instruction
    inc  bc
    rst  $30
    rrca
    cpl
    reti
    ld   [hl], a
    sbc  a, c
    ld   d, c
    sbc  a, a
    ld   c, c
    sbc  a, a
    rst  $10
    rrca
    jp   [hl]
    rlca
    rrca
    rst  $38
    inc  sp
    db   $FC ; Undefined instruction
    ld   d, b
    ld   [$FFA0], a
    ret  nz
    and  e
    ret  nz
    db   $D3 ; Undefined instruction
    ld   [$FFCF], a
    ld   a, [$FF8F]
    ld   a, [$FFF8]
    rst  $38
    inc  d
    rrca
    ld   a, [bc]
    rlca
    dec  b
    inc  bc
    dec  b
    inc  bc
    ei
    rlca
    db   $E3 ; Undefined instruction
    rra
    pop  af
    rrca
    rst  $38
    rst  $38
    di
    db   $FC ; Undefined instruction
    ret  c
    ld   [$FFB0], a
    ret  nz
    cp   a
    ret  nz
    rst  $18
    ld   [$FFC3], a
    db   $FC ; Undefined instruction
    adc  a, a
    ld   a, [$FFFF]
    rst  $38
    rla
    rrca
    dec  bc
    rlca
    dec  b
    inc  bc
    dec  e
    inc  bc
    ei
    rlca
    db   $E3 ; Undefined instruction
    rra
    pop  af
    rrca
    rst  $38
    rst  $38
    pop  bc
    rst  $38
    add  a, b
    rst  $38
    add  a, h
    rst  $38
    add  a, b
    rst  $38
    sub  a, b
    rst  $38
    add  a, $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    ld   bc, label_9FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    inc  de
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    add  a, b
    cp   a
    sbc  a, h
    or   a
    sub  a, a
    or   b
    sub  a, b
    cp   a
    sbc  a, a
    cp   l
    jp   label_FFFF
    rst  $38
    rst  $38
    pop  hl
    inc  bc
    cp   a
    add  hl, sp
    rst  $28
    jp   [hl]
    rrca
    add  hl, bc
    rst  $38
    ld   sp, hl
    db   $FD ; Undefined instruction
    add  a, e
    rst  $38
    rst  $38
    di
    di
    ld   a, [$FFF0]
    rst  $38
    ld   a, [$FFF7]
    ld    hl, sp+$FC
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    rst  $38
    rst  8
    rst  8
    rrca
    rrca
    rst  $38
    rrca
    rst  $28
    rra
    ccf
    rst  $38
    rst  $38
    ccf
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    add  a, b
    cp   a
    add  a, b
    xor  a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   h
    jp   label_FFFF
    rst  $38
    rst  $38
    pop  hl
    inc  bc
    rra
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_9F7
    ld   a, l
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    inc  e
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    sbc  a, b
    rst  $20
    ld   a, a
    add  a, b
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    inc  e
    pop  bc
    ld   a, $00
    rst  $38
    inc  a
    rst  $38
    jp   label_18FF
    rst  $20
    cp   $01
    sbc  a, a
    ld   [$FFEF], a
    ld   a, [$FFB4]
    sbc  a, e
    xor  $99
    adc  a, [hl]
    ld   sp, hl
    sub  a, d
    ld   sp, hl
    db   $EB ; Undefined instruction
    ld   a, [$FF97]
    ld   [$FFF9], a
    rlca
    add  hl, sp
    rst  0
    inc  sp
    rst  8
    inc  de
    rst  8
    dec  bc
    rst  $20
    ld   [hl], l
    add  a, e
    db   $23
    inc  hl
    db   $FD ; Undefined instruction
    inc  bc
    adc  a, e
    db   $FC ; Undefined instruction
    or   h
    rst  8
    cp   e
    rst  0
    ld   e, c
    rst  $20
    ldi  [hl], a
    rst  $38
    inc  e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $18
    ccf
    ld   sp, $CDFF
    di
    sbc  a, l
    db   $E3 ; Undefined instruction
    ld   e, l
    db   $E3 ; Undefined instruction
    dec  l
    di
    ld   [de], a
    rst  $38
    inc  c
    rst  $38
    adc  a, e
    db   $FC ; Undefined instruction
    or   h
    rst  8
    cp   e
    rst  0
    reti
    rst  $20
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    ccf
    ld   sp, $CDFF
    di
    sbc  a, l
    db   $E3 ; Undefined instruction
    db   $E3
    db   $E3 ; Undefined instruction
    db   $ED ; Undefined instruction
    di
    di
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   label_1FF
    rst  $38
    ld   de, label_1FF
    rst  $38

label_3718A::
    ld   bc, label_363FF
    rst  $38

label_3718E::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    add  a, d
    rst  $38
    add  a, b
    rst  $38
    add  a, c
    rst  $38
    sub  a, b
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
    rst  $30
    rst  $28
    rst  $38
    ld   [$FFE0], a
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
    rst  $28
    rst  $30
    rst  $38
    rlca
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   label_371C1
    jr   label_371C3
    ccf
    ret  nz
    rla
    db   $E8 ; add  sp, d
    ccf
    ret  nz
    ccf
    rst  $38
    jr   label_371CD
    jr   label_371CF
    jr   label_371D1
    jr   label_371D3
    db   $FC ; Undefined instruction
    inc  bc
    db   $E8 ; add  sp, d
    rla
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    jr   label_371DD
    jr   label_371DF
    rst  $38
    rst  $38
    pop  hl
    inc  bc
    rra
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_9F7
    ld   a, l
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    add  a, b
    cp   a
    add  a, b
    xor  a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   h
    jp   label_FFFF
    rst  $38
    rst  $38
    sub  a, b
    and  e
    add  a, l
    and  d
    add  a, l
    and  d
    add  a, l
    and  d
    add  a, l
    and  d
    call c, label_FFA3
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    ld   bc, $0103
    scf
    ld   bc, $010B
    rla
    ld   bc, label_3FD
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $81
    ret  nz
    cp   a
    ret  z
    cp   a
    ld   [$FFBF], a
    ret  z
    cp   a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $E5
    push hl
    ld   h, a
    db   $67
    ld   h, a
    db   $67
    ld   h, a
    db   $67
    ld   h, a
    db   $C7
    rst  0
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    jr   nc, label_37281
    ld   d, b
    ld   a, a
    sbc  a, b
    rst  $38
    adc  a, c
    rst  $38
    adc  a, a
    rst  $38
    adc  a, c
    rst  $38
    sub  a, b
    rst  $38
    ld   d, b
    ld   a, a
    rst  $38

label_37251::
    rst  $38
    pop  bc
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    rst  $38
    pop  bc
    rst  $38
    rst  $38

label_37261::
    rst  $38
    add  a, e
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    rst  $38
    add  a, e
    rst  $38
    inc  c
    db   $FC ; Undefined instruction
    ld   a, [bc]
    cp   $19
    rst  $38
    sub  a, c
    rst  $38
    pop  af
    rst  $38
    sub  a, c
    rst  $38
    add  hl, bc
    rst  $38
    ld   a, [bc]
    cp   $00

label_37281::
    rst  $38
    ld   bc, label_31FE
    adc  a, $20
    rst  8
    jr   z, label_37251
    dec  d
    ldh  [$FF0C], a
    ld   [label_7F1], sp
    ld    hl, sp+$00
    rst  $38

label_37292::
    add  a, b
    ld   a, a
    inc  c
    ld   [hl], e
    sub  a, h
    ld   h, e
    jr   z, label_37261
    db   $10 ; Undefined instruction
    ld   h, [hl]
    sbc  a, c
    adc  a, d
    ld   [hl], c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
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
    nop
    nop
    nop
    ccf
    nop
    rrca
    nop
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
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
    rra
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

label_372E8::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    sbc  a, b
    add  a, b
    add  a, b
    sub  a, b
    add  a, b
    sub  a, b
    add  a, b
    sub  a, b
    add  a, b
    sub  a, b
    xor  b
    sub  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    and  a
    ld   b, b
    nop
    ld   b, b
    add  a, a
    ld   b, b
    adc  a, a
    ld   b, b
    add  a, a
    ld   b, b
    cp   a
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$A607]
    ld   e, e
    jp   label_A33E
    ld   e, [hl]
    db   $E3 ; Undefined instruction
    ld   e, $83
    ld   a, [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    call label_D3B
    ei
    add  hl, de
    rst  $38
    add  hl, bc
    rst  $38
    ld   c, c
    rst  $38
    add  hl, bc
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_37381
    ld   d, b
    ld   a, a
    sbc  a, b
    rst  $38
    adc  a, c
    rst  $38
    adc  a, a
    rst  $38
    adc  a, c
    rst  $38
    sub  a, b
    rst  $38
    ret  nc
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    rst  $38
    pop  bc
    rst  $38
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
    rst  $38
    add  a, e
    rst  $38
    inc  c
    db   $FC ; Undefined instruction
    ld   a, [bc]
    cp   $19
    rst  $38
    sub  a, c
    rst  $38
    pop  af
    rst  $38
    sub  a, c
    rst  $38
    add  hl, bc
    rst  $38
    ld   a, [bc]
    cp   $00

label_37381::
    rst  $38
    ld   b, b
    sbc  a, [hl]
    ld   h, c
    adc  a, [hl]
    ldd  [hl], a
    pop  bc
    ld   e, $E1
    nop
    rst  $38
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  b
    ld    hl, sp+$14
    db   $E3 ; Undefined instruction
    cp   b
    ld   b, a
    ld   a, [$FF0F]
    jp   nz, label_1239
    pop  hl
    db   $FC ; Undefined instruction
    inc  bc
    nop
    rst  $38
    ret  nz
    ccf
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0100
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   bc, $0000

label_373FF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_37415::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_3741E

label_3741E::
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, $31
    adc  a, $31
    rst  8
    jr   nc, label_37415
    ld   sp, label_3718E
    adc  a, [hl]
    ld   [hl], c
    adc  a, a
    ld   [hl], b
    rst  8
    jr   nc, label_3741E
    ccf
    ret
    ccf
    ret  z
    ccf
    ld   c, h
    cp   a
    inc  b
    rst  $38
    inc  b
    rst  $38
    call nz, label_CC3F
    ccf
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    inc  de
    ld   e, $12
    rra
    add  hl, bc
    rrca
    dec  b
    ld   b, $FF
    rst  $38
    ld   bc, rSB
    ld   bc, rIE
    ret  z
    ld   a, b
    ld   c, b
    ld    hl, sp+$90
    ld   a, [$FFA0]
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    cp   a
    rst  $18
    cp   a
    xor  a
    rst  $18
    rst  $28
    rst  $18
    ld   b, a
    rst  $38
    ld   b, a
    rst  $38
    ld   h, e
    rst  $38
    inc  sp
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
    ld   sp, label_37FF
    rst  $38
    scf
    rst  $38
    scf
    rst  $38
    and  e
    rst  $38
    and  e
    rst  $38
    inc  sp
    rst  $38
    inc  sp
    rst  $38
    rst  $38
    nop

label_374D2::
    rst  $38
    nop
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
    ei
    db   $FD ; Undefined instruction
    ei
    db   $FD ; Undefined instruction
    push af
    ei
    rst  $30
    ei
    ldh  [$FF0C], a
    rst  $38
    ldh  [$FF0C], a
    rst  $38
    add  a, $FF
    call z, label_FF
    nop
    ld   bc, label_700
    nop
    ccf
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
    nop
    nop
    ld   a, [$FF00]
    ld   sp, hl
    nop
    rst  $38
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
    ld   [hl], b
    nop
    ld    hl, sp+$00
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  0
    jr   c, label_374D2
    ld   [hl], b
    inc  e
    ld   [$FF58], a
    ld   [$FF58], a
    ld   [$FFD8], a
    ld   [$FFCC], a
    ld   a, [$FFE7]
    ld    hl, sp+$8E
    ld   a, a
    adc  a, $3F
    rst  0
    ccf
    ld   h, e
    rra
    ld   h, e
    rra
    ld   h, e
    rra
    rst  0
    ccf
    add  a, a
    ld   a, a
    dec  b
    ld   b, $05
    ld   b, $05
    ld   b, $FF
    rst  $38
    add  a, b
    add  a, b
    cp   a
    add  a, b
    sbc  a, h
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    and  b
    ld   h, b
    and  b
    ld   h, b
    and  b
    ld   h, b
    rst  $38
    rst  $38
    ld   bc, $F701
    add  hl, bc
    ld   a, l
    add  a, e
    rst  $38
    rst  $38
    rst  $30
    ld   [label_18E7], sp
    call label_C932
    ld   [hl], $89
    halt
    ld   a, [hl]
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   a, a
    add  a, b
    ccf
    ret  nz
    dec  sp
    call nz, label_E41B
    add  hl, de
    and  $09
    or   $01
    cp   $00
    rst  $38
    ccf
    rst  $38
    ld   l, e
    rst  $30
    ld   e, c
    rst  $20
    cp   c
    rst  0
    cp   e
    rst  0
    or   d
    rst  8
    and  [hl]
    rst  $18
    and  a
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  e
    rst  $38
    halt
    ld   a, e
    add  a, a
    dec  a
    jp   label_F18E
    adc  a, [hl]
    pop  af
    add  a, $F9
    ld   a, [$FFFF]
    ld   a, a
    ld   [$FF9F], a
    ld   [hl], b
    ld   c, a
    cp   b
    and  a
    call c, label_CCB7
    push de
    xor  $C7
    cp   $C7
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
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    sub  a, $EF
    sbc  a, d
    rst  $20
    sbc  a, l
    db   $E3 ; Undefined instruction
    db   $E3
    db   $E3 ; Undefined instruction
    ld   c, l
    di
    ld   h, l
    ei
    push hl
    ei
    rst  $38
    nop
    rst  $38
    nop
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
    adc  a, l
    cp   $CD
    cp   $CD
    cp   $CD
    cp   $85
    cp   $85
    cp   $8D
    cp   $8D
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
    or   $3F
    rst  $38
    ld   c, c
    ret
    add  a, b
    add  a, b
    add  a, b
    or   [hl]
    add  a, b
    rst  $38
    and  b
    rst  $38
    or   $FF
    rst  $38
    halt
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_37658

label_37658::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_376FF
    rst  $38
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_37668

label_37668::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_376FF
    rst  $38
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_37678

label_37678::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_376FF
    rst  $38
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_37688

label_37688::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_36FFF
    db   $FC ; Undefined instruction
    rst  $38
    sub  a, d
    sub  a, e
    ld   bc, $0101
    ld   l, l
    ld   bc, label_5FF
    rst  $38
    ld   l, a
    rst  $38
    rst  $38
    ld   h, b
    ld   a, a
    ld   h, b
    ld   a, a
    jr   nz, label_37725
    jr   nc, label_376E7
    jr   label_376E9
    ld   c, $1F
    rlca
    rrca
    ld   bc, label_303
    rst  $38
    inc  bc
    rst  $38
    ld   [bc], a
    rst  $38
    ld   b, $FE
    inc  c
    cp   $F8
    db   $FC ; Undefined instruction
    ld   a, [$FFF8]
    add  a, b
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_376E7::
    rst  $38
    nop

label_376E9::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_376F4::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_376FF::
    rst  $38
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF1F]
    ldh  [$FF0C], a
    dec  a
    push hl
    dec  sp
    call label_CA73
    ld   [hl], a
    sbc  a, d
    rst  $20
    add  a, d
    rst  $38
    rra
    ld    hl, sp+$2B
    ld   a, [$FFC3]
    ld   [$FFA7], a
    ret  nz
    ld   l, [hl]
    add  a, c
    ld   a, h
    add  a, e
    ld   a, h
    add  a, e
    ld   [hl], b
    adc  a, a
    rst  $38
    rst  $38
    db   $FF
    rst  $38
    rst  $38

label_37725::
    db   $DD
    db   $DD
    db   $99
    sbc  a, c
    db   $DD
    db   $99
    sbc  a, c
    db   $99
    sbc  a, c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FF
    rst  $38
    rst  $38
    db   $DD
    db   $DD
    db   $99
    sbc  a, c
    db   $DD
    db   $99
    sbc  a, c
    db   $99
    sbc  a, c
    rst  $38
    rst  $38
    sbc  a, a
    ld   [$FF99], a
    and  $CC
    di
    call nz, label_D0F3
    rst  $20
    xor  [hl]
    pop  bc
    xor  e
    call nz, label_C0BF
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    rlca
    rst  $38
    call c, label_373FF
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FFFF]
    nop
    rlca
    ld    hl, sp+$00
    rst  $38
    ld   a, h
    rst  $38
    rst  0
    rst  $38
    add  hl, sp
    rst  0
    cp   $01
    rst  $18
    jr   nz, label_37770
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    rlca
    rst  $38
    call c, label_373FF
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FFFF]
    nop
    rlca
    ld    hl, sp+$00
    rst  $38
    ld   a, h
    rst  $38
    rst  0
    rst  $38
    add  hl, sp
    rst  0
    cp   $01

label_3778E::
    rst  $18
    jr   nz, label_3778E
    inc  bc
    rst  $30
    rrca
    cpl
    reti
    ld   [hl], a
    sbc  a, c
    ld   d, c
    sbc  a, a
    ld   c, c
    sbc  a, a
    rst  $10
    rrca
    jp   [hl]
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   label_377A9
    inc  a
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
    jr   label_377B9
    inc  a
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   b, [hl]
    rst  $38
    ld   b, l
    cp   $C9
    cp   $F9
    cp   $C4
    rst  $38
    sbc  a, d
    rst  $20
    cp   l
    jp   label_C1BE
    jr   nz, label_37811
    sub  a, b
    ld   a, a
    ret  z
    ccf
    and  a
    ld   e, a
    di
    rrca
    ld   a, c
    add  a, a
    ld   bc, rIE
    rst  $38
    and  $9F
    add  a, l
    cp   $C9
    cp   $F9
    cp   $C4
    rst  $38
    xor  d
    rst  0
    adc  a, l
    jp   label_C1BE
    dec  [hl]
    ei
    adc  a, c
    ld   a, a
    rst  $10
    rrca
    rlc  a
    push hl
    inc  bc
    ld   a, c
    add  a, a
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rrca
    rst  $38
    jr   nc, label_37843
    ld   l, a
    ld   a, [$FFD0]
    ld   [$FFA3], a
    ret  nz
    or   e
    ret  nz
    cp   [hl]
    pop  bc
    sbc  a, b

label_3784F::
    rst  $20
    ld   a, [$FFFF]
    inc  e
    rst  $38
    and  $1F
    inc  de
    rrca
    dec  bc
    rlca
    jp   [hl]
    rlca
    ld   a, c
    add  a, a
    ld   sp, $FFCF
    rst  $38
    ld   a, [$FFFF]
    rst  $28
    ld   a, [$FFD0]
    ld   [$FFA3], a
    ret  nz
    or   e
    ret  nz
    cp   [hl]
    pop  bc
    sbc  a, b
    rst  $20
    rst  $38
    rst  $38
    rra
    rst  $38
    rst  $20
    rra
    inc  de
    rrca
    dec  bc
    rlca
    jp   [hl]
    rlca
    ld   a, c
    add  a, a
    ld   sp, $FFCF
    rst  $38
    add  a, [hl]
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rla
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
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ret  nz
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ret  nz
    ret  nz
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    inc  bc
    rla
    rla
    jp   label_FF03
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    di
    di
    ld   a, [$FFF0]
    rst  $38
    ld   a, [$FFF7]
    ld    hl, sp+$FC
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    rst  $38
    rst  8
    rst  8
    rrca
    rrca
    rst  $38
    rrca
    rst  $28
    rra
    ccf
    rst  $38
    rst  $38
    ccf
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    add  a, b
    cp   a
    add  a, b
    xor  a
    sub  a, b
    xor  l
    add  a, d
    rst  $38
    add  a, b
    sbc  a, h
    db   $E3 ; Undefined instruction
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    pop  hl
    inc  bc
    rra
    ld   bc, label_1FF
    rst  $30
    add  hl, bc
    rst  $30
    ld   bc, $8779
    inc  bc
    rst  $38

label_37900::
    add  a, e

label_37901::
    db   $FC ; Undefined instruction
    rst  $20
    ld    hl, sp+$22
    db   $FD ; Undefined instruction
    ret  nc
    ccf
    pop  de
    ccf
    cp   [hl]
    ld   a, a
    ld   a, [hli]
    rst  $30
    inc  sp
    rst  $28
    add  a, e
    ld   a, a
    rlca
    rst  $38
    inc  c
    rst  $38
    ei
    db   $FC ; Undefined instruction
    ld   e, a
    cp   b
    sub  a, l
    ld   a, d
    ld   h, $F9
    db   $E4 ; Undefined instruction
    ei
    jp   label_E7FC
    ld    hl, sp+$D2
    db   $FD ; Undefined instruction
    xor  b
    rst  $18
    or   a
    adc  a, a
    sub  a, [hl]
    adc  a, a
    jp  c, label_B387
    rst  8
    cp   c
    ld   b, a
    inc  sp
    rst  8
    rrca
    rst  $38
    pop  af
    rst  $38
    ld   c, a
    or   c
    sbc  a, e
    ld   h, c
    dec  de
    pop  hl
    rst  8
    pop  af
    cp   [hl]
    pop  bc
    cp   [hl]
    pop  bc
    db   $FD ; Undefined instruction
    jp   label_E759
    ld   h, e
    rst  $38
    ld   a, $FF
    inc  e
    rst  $38
    nop
    rst  $38
    add  a, e
    rst  $38
    sbc  a, a
    pop  hl
    cp   a
    pop  bc
    cp   l
    jp   label_E799
    jp   label_366FF
    rst  $38
    inc  a
    rst  $38
    cp   [hl]
    pop  bc
    cp   [hl]
    pop  bc
    db   $FD ; Undefined instruction
    jp   label_E7D9
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    sbc  a, a
    pop  hl
    cp   a
    pop  bc
    cp   l
    jp   label_E799
    jp   label_E7FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rla
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
    add  a, [hl]
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    rst  $38
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
    rst  $30
    rst  $28
    rst  $38
    ld   [$FFE0], a
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
    rst  $28
    rst  $30
    rst  $38
    rlca
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   label_379C1
    jr   label_379C3
    ccf
    ret  nz
    rla
    db   $E8 ; add  sp, d
    ccf
    ret  nz
    ccf
    rst  $38
    jr   label_379CD
    jr   label_379CF
    jr   label_379D1
    jr   label_379D3
    db   $FC ; Undefined instruction
    inc  bc
    db   $E8 ; add  sp, d
    rla
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    jr   label_379DD
    jr   label_379DF
    rst  $38
    rst  $38
    pop  hl
    inc  bc
    rra
    ld   bc, label_1FF
    rst  $30
    add  hl, bc
    rst  $30
    ld   bc, $837D
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    add  a, b
    cp   a
    add  a, b
    xor  a
    sub  a, b
    xor  a
    add  a, b
    cp   a
    add  a, b
    cp   h
    jp   label_FFC1
    adc  a, h
    ld   a, [$FF9C]
    ld   [$FFE1], a
    cp   $F0
    ret  nz
    adc  a, $F0
    call z, label_C4F0
    ld    hl, sp+$C6
    ld    hl, sp+$79
    rlca
    ld   sp, $870F
    ld   a, a
    rrca
    ld   bc, label_F71
    ld   hl, label_211F
    rra
    ld   [hl], c
    rrca
    rst  $38
    rst  $38
    ld   b, b
    add  a, b
    add  a, b
    nop
    call z, label_37F00
    add  a, b
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0116
    db   $FC ; Undefined instruction
    inc  bc
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    ld   d, e
    rst  $28
    set  6, a
    rst  $20
    rst  $38
    cp   h
    rst  $38
    and  a
    rst  $38
    add  a, b
    rst  $38
    sub  a, c
    rst  $38
    ret  nz
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld   c, a
    cp   a
    ld   l, a
    sbc  a, a
    sub  a, c
    rst  $38
    ld   h, c
    rst  $38
    add  hl, bc
    rst  $38
    add  a, e
    rst  $38
    rrca
    rst  $38
    ret  nz
    rst  $38
    push hl
    rst  $38
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    and  $FF
    ld   [rIE], a
    ld   a, [$FFFF]
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, a
    rst  $38
    rst  $18
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    cp   a
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    cp   a
    rst  $38
    db   $FD ; Undefined instruction
    cp   $FA
    db   $FD ; Undefined instruction
    db   $F4 ; Undefined instruction
    ei
    ret  nz
    rst  $38
    jp   nc, label_80EF
    rst  $38
    add  hl, sp
    rst  $38
    rst  $30
    rst  $38
    cp   a
    ld   a, a
    rst  $18
    ccf
    ld   l, a
    sbc  a, a
    scf
    rst  8
    dec  de
    rst  $20
    dec  hl

label_37A9B::
    rst  $18
    ld   e, l

label_37A9D::
    cp   a
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
    rst  $38
    rst  $38
    db   $EB ; Undefined instruction
    rst  $30
    pop  hl
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    ld   a, l
    db   $E3 ; Undefined instruction
    rst  $38
    push de
    db   $E3 ; Undefined instruction
    db   $E3
    db   $E3 ; Undefined instruction
    jp   label_EFFF

label_37ABF::
    rst  $38
    dec  c
    ld   c, $0D
    ld   c, $0E
    rrca
    ld   a, [bc]
    rrca
    ld   [label_90F], sp
    ld   c, $09
    ld   c, $09
    ld   c, $D8
    jr   c, label_37A9B
    jr   c, label_37A9D
    jr   c, label_37B1F
    cp   b
    ld   [label_28F8], sp
    ld    hl, sp+$B8
    ld   a, b
    ld    hl, sp+$38
    nop
    nop
    inc  bc
    inc  bc
    dec  b
    ld   b, $09
    ld   c, $08
    rrca
    add  hl, bc
    ld   c, $09
    ld   c, $09
    ld   c, $00
    nop
    ld   [$FFE0], a
    ret  nc
    jr   nc, label_37ABF
    jr   c, label_37B01
    ld    hl, sp+$28
    ld    hl, sp+$B8
    ld   a, b
    ld    hl, sp+$38
    adc  a, $F0
    call z, label_CCF0
    ld   a, [$FFC6]
    ld    hl, sp+$F1
    cp   $E0
    add  a, b
    sbc  a, h
    ld   [$FF8E], a
    ld   a, [$FF31]
    rrca
    ld   hl, label_3611F
    rra
    ld   [hl], c
    rrca
    adc  a, a
    ld   a, a
    rrca
    ld   bc, label_F31
    ld   a, c

label_37B1F::
    rlca
    db   $EB ; Undefined instruction
    inc  e
    inc  e
    db   $EB ; Undefined instruction
    ld   [rIE], sp
    rst  $38
    or   b
    rst  8
    pop  bc
    cp   [hl]
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    db   $EB ; Undefined instruction
    inc  e
    inc  c
    ei
    ld   [rIE], sp
    rst  $38
    cp   [hl]
    pop  bc
    ret  nz
    cp   a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    ret  z
    rst  $38
    ret  nz
    rst  $38
    call nz, label_E0FF
    rst  $38
    sbc  a, $FF
    ret  nz
    rst  $38
    rra
    rst  $38
    ld   b, a
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    ccf
    rst  $38
    rrca
    rst  $38
    adc  a, a
    rst  $38
    rra
    rst  $38
    di
    rst  $38
    ld   a, [$FFFF]
    ld   sp, hl
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ei
    rst  $38
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    cp   a
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    ccf
    rst  $18
    rrca
    rst  $38
    and  a
    rst  $38
    rla
    rst  $38
    xor  a
    ld   a, a
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFF8]
    rst  $20
    db   $E4 ; Undefined instruction
    db   $DB
    jp   nz, label_38BD
    rst  $38
    cp   $FF
    rst  $38

label_37B9D::
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ei
    rst  $38
    ei
    rst  $38
    rst  $28
    rst  $38
    call label_EBFF
    db   $CC
    call z, label_BB
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    ld   l, a
    rst  $38
    cpl
    rst  $38
    ld   l, a
    cp   a
    ld   c, c

label_37BBB::
    cp   a
    ld   b, c

label_37BBD::
    cp   a
    nop
    rst  $38
    dec  c
    ld   c, $0D
    ld   c, $0E
    rrca
    ld   a, [bc]
    rrca
    ld   [label_90F], sp
    ld   c, $09
    ld   c, $09
    ld   c, $D8
    jr   c, label_37B9B
    jr   c, label_37B9D
    jr   c, label_37C1F
    cp   b
    ld   [label_28F8], sp
    ld    hl, sp+$B8
    ld   a, b
    ld    hl, sp+$38
    dec  c
    ld   c, $0D
    ld   c, $0E
    rrca
    ld   a, [bc]
    rrca
    ld   [label_90F], sp
    ld   c, $09
    ld   c, $09
    ld   c, $D8
    jr   c, label_37BBB
    jr   c, label_37BBD
    jr   c, label_37C3F
    cp   b
    ld   [label_28F8], sp
    ld    hl, sp+$B8
    ld   a, b
    ld    hl, sp+$38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFF3]
    ld   [$FFE7], a
    ret  nz
    rst  $38
    add  a, $FF
    sub  a, $FF
    jp   nc, label_C8FF
    rst  $38
    rst  $38
    cp   a
    ld   a, a
    rst  $18
    ccf
    ld   a, a
    sbc  a, a
    rst  $38
    rra
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38

label_37C1F::
    cp   a
    rst  $28
    ld   a, [$FFED]
    db   $F2 ; Undefined instruction
    rst  $30
    db   $DB
    rst  $30
    jp  c, label_FEDB
    sbc  a, $F5
    rst  $38
    pop  de
    cp   $D1
    ld   a, e
    rst  $18
    cp   a
    db   $DB
    ld   l, a
    sbc  a, e
    rst  $28
    dec  de
    ld   l, e
    sbc  a, a
    ld   e, a
    cp   e
    rst  $18
    cp   c
    rst  $28

label_37C3F::
    ei
    rst  $38
    cp   $FC
    db   $FD ; Undefined instruction
    ld    hl, sp+$F9
    ei
    ld   sp, hl
    rst  $38
    ld   sp, hl
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $FE
    cp   $7F
    rst  $38
    ccf
    rst  $38
    ld   e, a
    cp   a
    rst  $38
    sbc  a, a
    rst  $38
    sbc  a, a

label_37C5A::
    ld   e, a
    cp   a
    ccf
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ret  nz
    cp   b
    rst  0
    or   e
    call z, label_D8A7
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_37C71::
    rst  $38
    rlca
    inc  bc
    call label_9D33
    ld   h, e
    cp   l
    ld   b, e
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_37C80::
    nop

label_37C81::
    nop
    nop
    nop
    nop
    ld   bc, label_700
    inc  bc
    inc  c
    nop
    ccf
    jr   label_37CEE
    jr   nc, label_37C50
    nop
    inc  a
    jr   nz, label_37C5A
    ld   c, b
    add  a, [hl]
    ld   [label_30F6], sp
    ld   c, $3C
    jp   label_334C
    db   $F4 ; Undefined instruction
    dec  bc
    nop
    rst  $38
    ld   bc, label_31FE
    adc  a, $20
    rst  8
    jr   z, label_37C71
    dec  d
    ldh  [$FF0C], a
    ld   [label_7F1], sp
    ld    hl, sp+$00
    rst  $38
    add  a, b
    ld   a, a
    inc  c
    ld   [hl], e
    sub  a, h
    ld   h, e
    jr   z, label_37C81
    db   $10 ; Undefined instruction
    ld   h, [hl]
    sbc  a, c
    adc  a, d
    ld   [hl], c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    rst  $38
    cp   $FB
    ld   sp, hl
    sbc  a, h
    adc  a, e
    jr   c, label_37CF2
    ld   h, e
    ld   b, b
    ld   sp, hl
    pop  af
    scf
    inc  hl
    cp   d
    sub  a, a
    ld   [hl], $1F
    db   $FC ; Undefined instruction
    ccf
    db   $EC ; Undefined instruction
    rst  0
    ld   b, $03
    swap c
    rst  $38
    ld   a, [$FFFF]
    ret  nz
    cp   a
    reti
    cp   a
    reti
    cp   a
    ret
    cp   a
    ret  nz
    sbc  a, a
    xor  $FF
    db   $E4 ; Undefined instruction
    rst  $18
    ccf

label_37CF2::
    rst  $28
    rra
    rst  $30
    rst  8
    rst  $30
    rst  8
    rst  $30
    adc  a, a
    rst  $20
    rra
    adc  a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    pop  hl
    rst  $38
    push af
    rst  $28
    cp   $CF
    ld    hl, sp+$DF
    rst  $28
    rst  $18
    ld   [$E9D6], a
    ret
    or   $FF
    cp   a
    rst  $38
    cp   a
    xor  a
    ld   a, a
    ld   c, a
    ei
    cp   a
    db   $D3 ; Undefined instruction
    ld   e, a
    cp   e
    rst  $28
    dec  sp
    rst  $18
    ld   a, e
    sbc  a, $F7
    cp   $F5
    push af
    cp   $F6
    rst  $38
    rst  $38
    cp   $FD
    cp   $FE
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $FD
    db   $FD ; Undefined instruction
    rst  $18
    db   $ED ; Undefined instruction
    rst  $18
    rst  $18
    ld   l, l
    rst  $18
    ld   l, l
    ld   a, l
    rst  8
    rst  $28
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    cp   $FC
    db   $FD ; Undefined instruction
    ld    hl, sp+$F9
    ei
    ld   sp, hl
    rst  $38
    ld   sp, hl
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $FE

label_37D4F::
    cp   $7F
    rst  $38
    ccf
    rst  $38
    ld   e, a
    cp   a
    rst  $38
    sbc  a, a
    rst  $38
    sbc  a, a

label_37D5A::
    ld   e, a
    cp   a
    ccf
    rst  $38
    ld   a, a
    rst  $38
    ld   de, label_22FF
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
    ld   de, label_22FF
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
    ret  nz
    inc  a
    jp   label_C738
    jr   c, label_37D4F
    inc  sp
    call z, label_CF30
    jr   nc, label_37D5A
    nop
    ld    hl, sp+$F8
    rlca
    inc  a
    jp   label_F30C
    inc  c
    di
    ld    hl, sp+$06
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   b, b
    sbc  a, [hl]
    ld   h, c
    adc  a, [hl]
    ldd  [hl], a
    pop  bc
    ld   e, $E1
    nop
    rst  $38
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  b
    ld    hl, sp+$14
    db   $E3 ; Undefined instruction
    cp   b
    ld   b, a
    ld   a, [$FF0F]
    jp   nz, label_1239
    pop  hl
    db   $FC ; Undefined instruction
    inc  bc
    nop
    rst  $38
    ret  nz
    ccf
    db   $03
    inc  bc
    ld   [hl], a
    adc  a, a
    sbc  a, [hl]
    rst  $38
    db   $FD ; Undefined instruction
    or   $FF
    db   $F4 ; Undefined instruction
    rst  $38
    rst  $38
    ret  nc
    ld   [$FFE0], a
    rst  $38
    di
    ld   sp, hl
    push de
    ei
    or   l
    db   $DB
    ei
    sub  a, a
    ei
    rst  $20
    db   $F4 ; Undefined instruction
    rst  8
    db   $E8 ; add  sp, d
    rra
    rra
    rst  $38
    rst  $38
    jr   nz, label_37E22
    call nc, label_FF0F
    and  a
    rst  $38
    rla
    rst  $38
    xor  a
    ld   a, a
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFF8]
    rst  $20
    db   $E4 ; Undefined instruction
    db   $DB
    jp   nz, label_38BD
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ld   a, a
    ld   [$FF7F], a
    cp   b
    rst  $38
    adc  a, a
    rst  $38
    ret  nz
    rst  $38
    ld   h, b
    rst  $38
    jr   c, label_37E0F
    rst  $38
    rst  $38
    ld   b, $FC
    rrca
    db   $FC ; Undefined instruction
    dec  sp
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rlca
    rst  $38
    dec  c
    rst  $38
    add  hl, sp
    rst  $38
    rst  $38
    rst  $38

label_37E22::
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

label_37E3F::
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    rra
    add  a, a
    ld   a, b
    adc  a, b
    inc  d
    di
    ld   [hl], e
    sub  a, a
    ld   [hl], a
    sub  a, a
    rla
    rst  $30
    rst  $38
    rst  $38
    cp   $01
    ld    hl, sp+$E1
    ld   e, $11
    inc  l
    set  1, [hl]
    jp   [hl]
    xor  $E9
    db   $E8 ; add  sp, d
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    inc  e
    inc  c
    ei
    inc  c
    ei
    inc  c
    rst  $38
    rst  $38
    rst  $38
    cp   l
    jp   label_BFC1
    rst  $38
    rst  $38
    rst  $30
    jr   c, label_37ECD
    rst  $30
    jr   label_37E6F
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    ld   a, a
    add  a, c
    add  a, c
    ld   a, a
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    sub  a, b
    nop
    rst  $38
    nop
    rlca
    ei
    cp   $02
    ld   h, e
    sbc  a, a
    rra
    ld   [rIE], a
    rst  $38
    cp   $01
    pop  bc
    nop
    rst  $38
    nop
    or   h
    set  7, a
    add  a, b
    adc  a, [hl]
    pop  af
    ld   a, [$FF0F]
    sbc  a, a
    adc  a, a
    db   $EC ; Undefined instruction
    call nz, label_E95D
    ld   l, h
    ld    hl, sp+$3F
    db   $FC ; Undefined instruction
    scf
    db   $E3 ; Undefined instruction
    ld   h, b
    ret  nz
    db   $D3 ; Undefined instruction
    adc  a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $18
    sbc  a, a
    add  hl, sp
    pop  de
    inc  e

label_37EBD::
    inc  h
    add  a, $02
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_37ECD::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_37F00::
    rrca
    rst  $38
    add  a, b
    rst  $38
    ld   [rIE], a
    ld   a, a
    rst  $38
    rst  $18
    ccf
    rst  $38
    nop
    pop  hl
    nop
    add  a, b
    nop
    pop  hl
    rst  $38
    inc  bc
    rst  $38
    rrca
    rst  $38
    db   $FD ; Undefined instruction
    cp   $F7
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rst  $38
    rst  $38
    db   $FF
    rst  $38
    rst  $38
    db   $DD
    db   $DD
    db   $99
    sbc  a, c
    db   $DD
    db   $99
    sbc  a, c
    db   $99
    sbc  a, c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FF
    rst  $38
    rst  $38
    db   $DD
    db   $DD
    db   $99
    sbc  a, c
    db   $DD
    db   $99
    sbc  a, c
    db   $99
    sbc  a, c
    rst  $38
    rst  $38
    ld   [hl], a
    sub  a, a
    ld   d, a
    or   a
    ld   a, e
    sub  a, e
    inc  c
    ld    hl, sp+$3F
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    xor  $E9
    xor  $E9
    ret  c
    rst  8
    jr   nc, label_37F77
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    cp   a
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    db   $EB ; Undefined instruction
    inc  e
    inc  e
    db   $EB ; Undefined instruction
    inc  c
    ei
    inc  c
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    ld   a, a
    ld   bc, rIE
    rst  $38
    db   $EB ; Undefined instruction

label_37F77::
    inc  e
    inc  c
    ei
    inc  c
    ei
    jr   label_37F7D
    rst  $38
    rst  $38
    rst  $38
    nop
    jp   label_37E3F
    add  a, d
    inc  bc
    rst  $38
    inc  a
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    adc  a, [hl]
    pop  af
    ld   a, [$FF8F]
    add  a, b
    rst  $38
    ld   a, h
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    sbc  a, a
    xor  e
    rst  $18
    xor  l
    db   $DB
    rst  $18
    jp   [hl]
    rst  $18
    rst  $20
    cpl
    di
    rla
    ld    hl, sp+$F8
    rst  $38
    cp   e
    ret  nz
    xor  $F1
    ld   a, c
    rst  $38
    cp   a
    ld   l, a
    rst  $38
    cpl
    rst  $38
    rst  $38
    dec  bc
    rlca
    rlca
    rst  $38
    rst  $38
    nop
    rst  $38

label_37FC3::
    nop
    rst  $38
    nop
    rst  $38
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
