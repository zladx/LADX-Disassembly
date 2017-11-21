section "bank53",romx,bank[$35]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    inc  b
    rst  $28
    inc  d
    rst  0
    db   $3A ; ldd  a, [hl]
    add  a, e
    ld   a, l
    adc  a, c
    db   $76 ; Halt
    ret  nc
    cpl
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    inc  c
    rst  $28
    inc  de
    db   $E3 ; Undefined instruction
    inc  e
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    rst  $38
    ldi  [hl], a
    rst  $38
    ld   b, c
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_D4032
    db   $10 ; Undefined instruction
    ld   [label_4FF], sp
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    rst  $38
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    ld   e, l
    pop  hl
    ld   e, [hl]
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   a, [$FF2F]
    ld    hl, sp+$17
    db   $FC ; Undefined instruction
    dec  bc
    cp   $05
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    rst  $38
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    ld   e, l
    pop  hl
    ld   e, [hl]
    ld   [$FF5F], a
    ld   [$FF5F], a
    rst  $38
    jr   nz, label_D4072
    db   $10 ; Undefined instruction
    ld   [label_4FF], sp
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    rst  $38
    ld   b, b

label_D4088::
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    rst  $38
    ld   b, b
    rst  $38
    ld   a, a
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
    jr   label_D40B5

label_D40B5::
    inc  a
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    inc  a
    nop
    inc  a
    nop
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
    rrca
    nop
    dec  c
    nop
    dec  c
    nop
    rrca
    nop
    inc  c
    nop
    inc  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D40E7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], $00
    or   [hl]
    nop
    or   [hl]
    nop
    ld   [hl], $00
    ld   [hl], $00
    inc  e
    nop
    nop
    nop

label_D4100::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], e
    nop
    jp   label_D7300
    nop
    dec  de
    nop
    db   $DB
    nop
    ld   [hl], e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, c
    nop
    ld   h, e
    nop
    pop  hl
    nop
    ld   h, b
    nop
    ld   h, e
    nop
    ld   h, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  8
    nop
    inc  c
    nop
    adc  a, $00
    ld   l, h
    nop
    ld   l, h
    nop
    rst  8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld   h, e
    nop
    ld   h, e
    nop
    ld   h, e
    nop
    ld   h, e
    nop
    ld   a, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, $00
    jr   label_D4196

label_D4196::
    sbc  a, b
    nop
    jr   label_D419A

label_D419A::
    jr   label_D419C

label_D419C::
    adc  a, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    ld   d, e
    rst  $38
    nop
    rst  $38
    rra
    rst  $38
    jr   c, label_D41D2
    ld   sp, label_31FF
    rst  $38
    ld   sp, label_31FF
    rst  $38
    jr   c, label_D41DC
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, $FF
    ld   d, l
    rst  $38
    ld   d, l
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    inc  c
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    ld   d, e
    rst  $38
    nop
    rst  $38
    rra
    rst  $38
    jr   nc, label_D4212
    ld   sp, label_31FF
    rst  $38
    jr   nc, label_D4218
    ld   sp, label_31FF
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, $FF
    ld   d, l
    rst  $38
    ld   d, l
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    adc  a, h
    rst  $38
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    ld   d, e
    rst  $38
    nop
    rst  $38
    rra
    rst  $38
    jr   nc, label_D4252
    ld   sp, label_30FF
    rst  $38
    ld   sp, label_31FF
    rst  $38
    jr   nc, label_D425C
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
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
    jr   label_D4292
    jr   c, label_D4294
    jr   label_D4296
    jr   label_D4298
    jr   label_D429A
    jr   label_D429C
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   h, [hl]
    rst  $38
    ld   b, $FF
    inc  a
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   h, [hl]
    rst  $38
    inc  c
    rst  $38
    ld   b, $FF
    ld   h, [hl]
    rst  $38
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
    inc  c
    rst  $38
    inc  e
    rst  $38
    inc  a
    rst  $38
    ld   l, h
    rst  $38
    ld   a, [hl]
    rst  $38
    inc  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, h
    rst  $38
    ld   h, b
    rst  $38
    ld   a, h
    rst  $38
    ld   b, $FF
    ld   b, $FF
    ld   a, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   h, b
    rst  $38
    ld   a, h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
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
    ld   a, [hl]
    rst  $38
    ld   b, $FF
    inc  c
    rst  $38
    jr   label_D4358
    jr   label_D435A
    jr   label_D435C
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
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
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, $FF
    ld   b, $FF
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
    inc  bc
    rst  $38
    ld   b, $FF
    inc  c
    rst  $38
    jr   label_D43B8
    jr   nc, label_D43BA
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, $FF
    ld   d, l
    rst  $38
    ld   d, l
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    ld    hl, sp+$FF
    nop
    ld   bc, label_F00
    ld   bc, label_E31
    ld   l, b
    rra
    ld   e, h
    ccf
    sbc  a, h
    ld   a, a
    adc  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, c
    ld   a, [hl]
    pop  bc
    ld   a, $43
    dec  a
    ld   h, a
    dec  de
    ccf
    ld   b, $2F
    inc  e
    ld   e, $00
    add  a, b
    nop
    pop  bc
    add  a, b
    db   $E3 ; Undefined instruction
    pop  bc
    db   $E3 ; Undefined instruction
    ld   b, c
    rst  $38
    ld   b, c
    db   $EB ; Undefined instruction
    ld   e, h
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, c
    rst  $38
    reti
    rst  $38
    sbc  a, c
    rst  $38
    adc  a, [hl]
    rst  $38
    nop
    ccf
    pop  bc
    rst  $28
    rlca
    rrca
    nop
    ld   a, [$FF00]
    ld    hl, sp+$F0
    ld   a, h
    sbc  a, b
    cp   $0C
    cp   $04
    rst  $38
    ld   [hl], $F7
    ld   a, d
    or   a
    ld   a, d
    rst  8
    ldd  [hl], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    cp   a
    ld   b, d
    sbc  a, l
    ld   h, [hl]
    jp  c, label_BC3C
    nop
    add  a, b
    nop
    add  a, b
    nop
    pop  bc
    add  a, b
    db   $E3 ; Undefined instruction
    pop  bc
    db   $E3 ; Undefined instruction
    ld   b, c
    rst  $38
    ld   b, c
    db   $EB ; Undefined instruction
    ld   e, h
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    ccf
    rst  0
    jp   hl
    rlca
    rrca
    nop
    ld    hl, sp+$00
    call c, label_F6B8
    call z, label_D5EE3
    ei
    ld   b, [hl]
    push af
    ld   e, d
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    db   $FD ; Undefined instruction
    ld   b, d
    rst  $38
    jp  c, label_9AFF
    rst  $38
    adc  a, h
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    nop
    ld   a, [$FF00]
    ld   a, b
    sub  a, b
    inc  a
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    inc  e
    db   $E8 ; add  sp, d
    ld   e, $E8
    rra
    db   $E8 ; add  sp, d
    ccf
    ret  c
    ccf
    call nc, label_B47F
    ld   sp, hl
    ld   h, [hl]
    cp   $C0
    cp   $00
    di
    ld   c, $FF
    ret  nz
    ld   [rJOYP], a
    rlca
    nop
    jr   label_D44CB
    inc  hl
    rra
    ld   b, a
    ccf
    ld   b, e
    ccf
    add  a, b

label_D44CB::
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ret  nz
    ccf
    pop  hl
    ld   e, $FF
    ld   b, c
    ld   a, a
    ccf
    ccf
    nop
    rra
    rlca
    rlca
    nop
    ld   a, [$FF00]
    ld   a, b
    sub  a, b
    inc  a
    ret  z
    sbc  a, [hl]
    db   $E8 ; add  sp, d
    ld   e, $E8
    rra
    ld   [$EA1F], a
    ccf
    jp  c, label_D63F
    ld   a, a
    or   h
    rst  $38
    ld   l, h
    cp   $D8
    ld   a, [$F434]
    db   $E8 ; add  sp, d
    ld    hl, sp+$80
    ld   [rJOYP], a
    rlca
    nop
    rra
    ld   bc, label_172F
    ld   e, a
    inc  l
    ld   a, a
    dec  de
    rst  $38
    ld   [hl], $FE
    dec  l
    db   $FD ; Undefined instruction
    ld   l, e
    db   $FD ; Undefined instruction
    ld   e, e
    ld    hl, sp+$57
    cp   b
    ld   d, a
    ld   a, b
    rla
    ld   l, h

label_D4519::
    inc  de
    cpl
    db   $10 ; Undefined instruction
    ld   [$000F], sp
    nop
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
    nop
    ld   [label_1107], sp
    rrca
    inc  hl
    rra
    ld   hl, label_201F
    rra
    ldi  [hl], a
    dec  e
    ldi  [hl], a
    dec  e
    jr   nc, label_D454B
    jr   label_D4545
    rrca
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc

label_D4545::
    rlca
    add  hl, bc
    rlca
    ld   [label_A07], sp

label_D454B::
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   [label_807], sp
    rlca
    jr   label_D4561
    jr   label_D4563
    inc  e
    inc  bc
    rrca
    nop
    nop

label_D4561::
    nop
    nop

label_D4563::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_D4574

label_D4574::
    ld   [hl], h
    jr   c, label_D4519
    ld   a, h
    jp   z, label_CA34
    inc  [hl]
    add  a, d
    ld   a, h
    ld   a, h
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    ld   de, label_130F
    rrca
    inc  hl
    dec  e
    daa
    jr   label_D45B6
    jr   label_D4608
    jr   z, label_D4606
    inc  l
    ld   e, h
    inc  sp
    cpl
    inc  e
    ld   a, e
    rlca
    ld   [hl], a
    jr   label_D45DC
    db   $10 ; Undefined instruction
    nop
    ld   [rJOYP], a
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    nop
    cp   $FC
    rst  $38
    add  a, d
    add  a, a
    ld   a, b
    add  a, e
    db   $FC ; Undefined instruction
    pop  bc
    cp   $C1
    cp   $81
    cp   $03
    db   $FC ; Undefined instruction

label_D45B6::
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   b, $F8
    inc  e
    ld   [$FFF8], a
    nop
    ld   [rJOYP], a
    rrca
    add  hl, bc
    ccf
    jr   label_D4644
    inc  bc
    ld   a, a
    ld   c, a
    rst  $38
    db   $D3 ; Undefined instruction
    rst  $38
    add  hl, de
    rst  $38
    dec  a
    rst  $38
    xor  a
    rst  $38
    and  a
    rst  $38
    add  hl, sp
    rst  $38
    inc  e
    rst  $38
    sbc  a, $7F
    ld   c, a
    ld   a, a
    inc  bc

label_D45DC::
    ccf
    jr   label_D45EE
    add  hl, bc
    dec  sp
    nop
    inc  a
    dec  de
    ld   a, $1D
    ccf
    ld   b, $3F
    dec  bc
    ccf
    dec  e
    ld   a, a
    jr   label_D45EE
    ld   e, c
    db   $ED ; Undefined instruction
    ld   e, [hl]
    db   $D3 ; Undefined instruction
    inc  l
    adc  a, a
    ld   [hl], b
    and  e
    ld   e, h
    or   e
    ld   l, h
    db   $D3 ; Undefined instruction
    ld   a, $61
    rra
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D4606::
    nop
    nop

label_D4608::
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
    nop
    ccf
    ld   b, $79
    rrca
    ld   [hl], h
    rrca
    db   $76 ; Halt
    rrca
    ld   [hl], b
    ld   [bc], a
    dec  a
    nop
    rrca
    inc  bc
    nop
    dec  c
    inc  bc
    dec  bc
    inc  b
    dec  d
    ld   a, [bc]
    rla
    ld   a, [bc]
    rla
    ld   a, [bc]
    rla
    ld   a, [bc]
    rla
    ld   a, [bc]
    daa
    ld   a, [de]
    dec  h
    ld   a, [de]
    dec  h
    ld   e, d
    ld   b, a
    cp   b
    ld   b, $F9
    ld   [bc], a
    db   $FD ; Undefined instruction
    nop
    ld   a, a
    nop
    rra
    jr   label_D4642

label_D4642::
    dec  [hl]
    jr   label_D46B0
    dec  e
    push af
    ld   l, a
    sub  a, b
    ld   a, a
    ld   h, e
    ld   e, $E7
    ld   a, [hl]
    add  a, l
    ld   a, [hl]
    ld   a, c
    ld   b, $0D
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    ld   b, $01
    inc  b
    inc  bc
    rrca
    nop
    rrca
    ld   b, $30
    nop
    xor  $30
    ei
    or   [hl]
    ld   e, a
    or   [hl]
    rst  $30
    inc  e
    rst  $20
    jp  c, label_FE63
    rst  8
    inc  a
    ld   l, [hl]
    jr   label_D46A7
    ld   [label_814], sp
    db   $F4 ; Undefined instruction
    ld   [$E854], sp
    db   $F4 ; Undefined instruction
    db   $E8 ; add  sp, d
    ld   d, h
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    ld   [label_67F], sp
    or   a
    ld   a, b
    cp   l
    ld   a, [hl]
    rst  $18
    ccf
    ld   [hl], a
    rra
    dec  l
    rla
    dec  hl
    dec  d
    ld   a, $01
    ld   a, $01
    ccf
    nop
    ld   a, a
    nop
    xor  [hl]
    ld   d, c
    sbc  a, e
    ld   [hl], l
    push de
    ccf
    ld   l, a
    rra
    rra
    nop
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $E4 ; Undefined instruction
    jr   label_D46AB

label_D46A7::
    ld    hl, sp+$E4
    ld    hl, sp+$94

label_D46AB::
    db   $E8 ; add  sp, d
    or   h
    ld   c, b
    or   d
    ld   c, h

label_D46B0::
    ld   a, [$FF00+C]
    ld   sp, hl
    ld   b, $B9
    ld   b, [hl]
    cp   c
    ld   b, [hl]
    db   $D3 ; Undefined instruction
    ld   l, h
    add  a, [hl]
    ld    hl, sp+$18
    ld   [$FFE0], a
    nop
    inc  bc
    nop
    dec  a
    inc  bc
    ld   c, e
    scf
    sbc  a, h
    ld   h, e
    or   a
    ld   e, b
    and  [hl]
    ld   a, e
    cp   l
    ld   h, e
    rst  8
    ld   sp, label_176E
    jr   c, label_D46DB
    rla
    ld   [label_E35], sp
    ld   c, [hl]
    ccf
    ld   e, c

label_D46DB::
    ccf
    ld   h, a
    jr   label_D4717
    nop
    ld   [rJOYP], a
    sbc  a, b
    ld   [$FFE4], a
    ld    hl, sp+$7A
    sbc  a, h
    sbc  a, d
    ld   l, h
    pop  de
    ld   l, [hl]
    ld   sp, hl
    ld   b, [hl]
    ld   a, l
    jp  c, label_FAE5
    reti
    and  $32
    call z, label_D7C82
    ret
    ld   [hl], $31
    adc  a, $66
    ld    hl, sp+$F8
    nop
    nop
    nop
    nop
    nop
    ccf
    nop
    ld   a, h
    inc  sp
    pop  af
    ld   l, a
    db   $E3 ; Undefined instruction
    ld   e, a
    and  e
    ld   e, l
    ld   b, a
    jr   c, label_D4758
    dec  sp

label_D4712::
    ld   c, a
    scf
    rst  $28
    ld   d, [hl]
    ei

label_D4717::
    ld   b, [hl]
    cp   h
    ld   h, e
    ld   e, a
    jr   c, label_D4754
    rrca
    rrca
    nop
    nop
    nop
    ld   e, $00
    dec  hl
    inc  e
    ld   e, h
    inc  sp
    ld   d, c
    cpl
    inc  hl
    rra
    ccf
    ld   bc, label_1C7F
    ld   e, a
    ld   a, $5F
    ld   l, $DD
    ld   l, $E3
    ld   e, h
    cp   a
    ld   h, b
    ld   e, a
    jr   c, label_D4774
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    inc  a
    ret  nz
    adc  a, [hl]
    db   $F4 ; Undefined instruction
    rst  8
    or   $CB
    or   [hl]
    rst  $20
    ld   a, [de]
    push hl
    ld   a, [de]
    ld  [$FF00+C], a
    inc  e

label_D4754::
    push bc
    db   $3A ; ldd  a, [hl]
    ccf
    jp   nz, label_6FD
    ld   a, [$EC1C]
    ld   a, [$FFF0]
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    dec  bc
    inc  b
    inc  e
    inc  bc
    ld   sp, label_D7B0F
    daa
    cp   e
    ld   [hl], l
    rst  $38
    jr   nc, label_D4770
    jr   nc, label_D4712
    ld   [hl], b

label_D4774::
    swap h
    cp   h
    ld   b, e
    cp   a
    ld   h, b
    ld   e, a
    jr   c, label_D47B4
    rrca
    rrca
    nop
    inc  bc
    nop
    rlca
    nop
    rrca
    rlca
    rra
    dec  bc
    rra
    ld   a, [bc]
    rra
    ld   c, $3F
    rra
    dec  a
    rla
    ccf
    dec  b
    ccf
    db   $10 ; Undefined instruction
    jr   label_D47B6
    nop
    ld   bc, $0100
    nop
    ld   bc, $0000
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    cp   h
    ret  nz
    db   $FC ; Undefined instruction
    ld   [$FFEE], a
    ld   [hl], b
    xor  $70
    rst  $18
    ld   [rIE], a
    add  a, b
    rst  $38
    add  a, b
    xor  a
    ld   [hl], b

label_D47B4::
    cp   $70

label_D47B6::
    xor  [hl]
    ld   [hl], b
    ld   a, [$AA04]
    call c, label_CC32
    call c, label_0
    nop
    inc  bc
    nop
    ld   [hl], a
    ld   [bc], a
    xor  a
    ld   [hl], l
    rst  $38
    ld   b, a
    cp   a
    ld   e, a
    ld   [hl], a
    rrca
    ccf
    dec  bc
    rst  $38
    inc  bc
    rst  $18
    ld   h, b
    cp   a
    ld   h, b
    ld   c, a
    inc  sp
    inc  l
    inc  de
    inc  e

label_D47DB::
    inc  bc
    ld   b, $01
    inc  bc
    nop
    nop
    nop
    ld   a, [$FF00]
    cp   b
    ret  nz
    db   $FC ; Undefined instruction
    ld   [$FFFC], a

label_D47E9::
    jr   nc, label_D47E9
    jr   nc, label_D47DB
    ld   a, [$FFDE]
    ld   [$FFFE], a
    nop
    push af
    ld   c, $FF
    ld   c, $F5
    ld   c, $FE
    add  a, b
    ld   [hl], b
    add  a, b
    ld   h, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D4806::
    nop
    nop
    ld   bc, $0100
    nop
    ld   bc, label_F00
    nop
    dec  d
    ld   c, $25
    ld   e, $4D
    ld   a, $9E
    ld   [hl], c
    cp   a
    ld   h, h
    push af
    ld   c, [hl]
    rst  $20
    jr   label_D47EE
    scf
    nop
    nop
    ccf
    nop
    ld   d, b
    cpl
    and  b
    ld   e, a
    ld   b, b
    cp   a
    ld   h, b
    cp   a
    ld   [hl], b
    sbc  a, a
    ld   a, a
    adc  a, a
    rst  $30
    rst  8
    rst  $30
    ld   l, a
    rst  $38
    jr   nc, label_D4806
    ld   [hl], $49
    or   [hl]
    rst  8
    jr   nc, label_D483C
    nop
    cp   b
    rst  0
    nop
    nop
    db   $E3 ; Undefined instruction
    nop
    rla
    pop  hl
    rrca
    pop  af
    ld   b, $F9
    rrca
    ld    hl, sp+$14
    ei
    push hl
    ei
    xor  $F5
    ei
    db   $E4 ; Undefined instruction
    ei
    inc  d
    inc  l
    db   $D3 ; Undefined instruction
    ld   a, c
    rst  0
    ld   [hl], e
    rst  8
    and  $1F
    inc  a
    rst  $18
    ld   a, b
    nop
    or   $38
    db   $FD ; Undefined instruction
    sbc  a, d
    rst  $20
    jp  c, label_DA27
    add  hl, sp
    add  a, $FE
    nop
    rst  $38
    ld   [$FF9F], a
    ld  [$FF00+C], a
    db   $FD ; Undefined instruction
    ld   b, $B9

label_D4875::
    ld   c, [hl]
    pop  de
    ld   a, $F2
    inc  e

label_D487A::
    db   $F4 ; Undefined instruction
    jr   label_D4875
    db   $10 ; Undefined instruction
    nop
    rst  $18
    cpl
    ld   a, [hl]
    rra
    ld   [hl], a
    ld   c, $7D
    ld   [bc], a
    ld   a, l
    ld   [bc], a
    dec  a
    ld   [bc], a
    dec  l
    ld   [de], a
    scf
    ld   [label_619], sp
    ld   e, $03
    daa
    jr   label_D48D6
    rra
    jr   nz, label_D48B9
    ccf
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    or   e
    or   $6D
    ld   a, [label_D76FD]
    ld   sp, hl
    xor  $35
    srl  h
    rst  $10
    jr   c, label_D487A
    dec  [hl]
    add  a, $39
    rst  8
    jr   nc, label_D48B1
    nop
    ld    hl, sp+$C0
    ld   [hl], b

label_D48B9::
    ret  nz
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    db   $E8 ; add  sp, d
    rst  $18
    ld   l, b
    rst  $18
    ld   l, c
    sbc  a, $7F
    ret  nz
    ld   a, e
    add  a, h
    xor  $19
    sbc  a, l
    ld   [hl], e
    ei
    rst  $20
    ld   e, $E3
    cp   $03
    ld   l, [hl]
    inc  de

label_D48D6::
    ld   [hl], a
    ld   [label_73F], sp

label_D48DA::
    inc  e
    rlca
    inc  c
    rlca
    rlca
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   h, b
    jr   label_D48DA
    ld   a, b
    ld   a, [$FFC8]
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF30]
    ret  nz
    ld   a, [$FF00]
    adc  a, b
    ld   [hl], b
    db   $F4 ; Undefined instruction
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$FC
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D490E::
    ld   bc, $0100
    nop
    ld   bc, label_D7F00
    nop
    pop  bc
    ld   a, [hl]
    pop  bc
    ld   a, [hl]
    pop  bc
    ld   a, [hl]
    pop  bc
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    dec  bc
    rlca
    ccf
    nop
    ld   d, b
    cpl

label_D492C::
    and  b
    ld   e, a

label_D492E::
    ld   b, b
    cp   a
    ld   h, b
    cp   a
    ld   [hl], b
    sbc  a, a

label_D4934::
    ld   a, b
    adc  a, a
    rst  $38
    add  a, a

label_D4938::
    rst  $38
    rst  0
    ei
    ld   h, a
    rst  $38
    jr   nc, label_D490E
    ld   [hl], $00
    nop
    rst  $38
    nop
    rla
    rst  $28
    rst  $28
    call c, label_1EEF
    dec  [hl]
    adc  a, $19
    and  $0B
    db   $F4 ; Undefined instruction
    rlca
    ld    hl, sp+$0F
    ld    hl, sp+$17
    ld    hl, sp+$E7
    ld    hl, sp+$CF
    ld   a, [$FFDD]
    ld  [$FF00+C], a
    rst  $38
    ld   [de], a
    dec  hl
    sub  a, $00

label_D4961::
    nop
    ld   [rJOYP], a
    ret  nc
    ld   [$FFD0], a
    ld   [$FFF0], a
    ret  nz
    jr   nc, label_D492C
    jr   nc, label_D492E
    ret  nc
    jr   nz, label_D4961
    ret  nz
    jr   nc, label_D4934
    ld   a, [$FF00]
    jr   nc, label_D4938
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    jp   label_E33C
    inc  a
    ld   l, [hl]
    inc  sp
    ld   [hl], a
    rrca
    ld   l, [hl]
    rra
    ld   [hl], l
    ld   c, $3F
    dec  b
    db   $3A ; ldd  a, [hl]
    dec  b
    dec  de
    inc  b
    dec  hl
    inc  d
    ld   a, a
    jr   c, label_D49DC
    inc  a
    ld   a, a
    nop
    ld   bc, $0000
    nop
    ret
    ld   [hl], $BF
    ld   b, b
    and  a
    ld   a, b
    call c, label_D733F
    adc  a, a
    db   $FC ; Undefined instruction
    ld   [hl], e
    or   $ED
    ld   a, [$F7FD]
    ld    hl, sp+$6E
    push af
    adc  a, e
    ld   a, h
    sub  a, a
    ld   a, b
    adc  a, d
    ld   [hl], h
    add  a, [hl]
    ld   a, b
    adc  a, h
    ld   [hl], b
    ld    hl, sp+$00
    ld   a, e
    add  a, $75
    adc  a, $E9
    ld   e, $39
    sbc  a, $EB
    call c, label_D96E
    ld   a, h
    jp   label_976F
    cp   a
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    nop
    di
    inc  c

label_D49D8::
    inc  a
    inc  bc

label_D49DA::
    ccf
    nop

label_D49DC::
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    jr   label_D49D8
    jr   c, label_D49DA
    ld   l, b
    ld   a, [$FFC8]
    ld   a, [$FF88]
    ld   a, [$FF98]
    ld   [$FFB0], a
    ret  nz
    db   $EC ; Undefined instruction
    sub  a, b
    jp   label_FD3C
    cp   $81
    cp   $81
    cp   $FF
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4A20
    jr   label_D4A22
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
    jr   label_D4A30
    jr   label_D4A32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A20::
    nop
    nop

label_D4A22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4A40
    jr   label_D4A42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A30::
    nop
    nop

label_D4A32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4A50
    jr   label_D4A52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A40::
    nop
    nop

label_D4A42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4A60
    jr   label_D4A62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A50::
    nop
    nop

label_D4A52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4A70
    jr   label_D4A72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A60::
    nop
    nop

label_D4A62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4A80
    jr   label_D4A82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A70::
    nop
    nop

label_D4A72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4A90
    jr   label_D4A92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A80::
    nop
    nop

label_D4A82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4AA0
    jr   label_D4AA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4A90::
    nop
    nop

label_D4A92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4AB0
    jr   label_D4AB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4AA0::
    nop
    nop

label_D4AA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4AC0
    jr   label_D4AC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4AB0::
    nop
    nop

label_D4AB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4AD0
    jr   label_D4AD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4AC0::
    ld   bc, label_E00
    ld   bc, label_D33
    ld   e, a
    ld   hl, label_D6C9F
    rst  $38
    dec  e
    cp   a
    ld   e, l
    cp   a
    ld   e, [hl]

label_D4AD0::
    cp   a
    ld   e, l

label_D4AD2::
    cp   a
    ld   b, e
    ld   a, a
    dec  de
    ld   c, a
    dec  a
    ld   b, a
    ld   a, $21
    ld   e, $19
    ld   b, $07
    nop
    ld   [rJOYP], a
    db   $10 ; Undefined instruction
    call c, label_F2E0
    db   $EC ; Undefined instruction
    ld   sp, hl
    ld   d, $FD
    jp  c, label_9AFD
    db   $FD ; Undefined instruction
    ld   l, d
    rst  $38
    ld   [$FFFD], a
    xor  $FD
    sbc  a, $F9
    sbc  a, $F2
    inc  e
    db   $F4 ; Undefined instruction
    db   $E8 ; add  sp, d
    jr   label_D4ADE
    ld   [rJOYP], a
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    db   $10 ; Undefined instruction
    jr   nz, label_D4B29
    ld   b, b
    ccf
    ld   b, e
    inc  a
    add  a, a
    ld   a, b
    rst  8
    ld   [hl], b
    rst  8
    ld   [hl], b
    rst  8
    ld   [hl], b
    xor  a
    ld   [hl], b
    ld   [hl], a
    jr   c, label_D4B78
    ld   a, $37
    rrca
    rrca
    nop
    ld   a, [hl]
    nop
    add  a, c
    ld   a, [hl]
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]

label_D4B29::
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    rst  $20
    inc  a
    rst  $38
    inc  h
    rst  $38
    inc  h
    rst  $38
    inc  h
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    jr   label_D4B5F
    inc  hl
    rra
    ld   b, a
    ccf
    ld   b, a
    ccf
    add  a, e

label_D4B5F::
    ld   a, a
    add  a, b
    ld   a, a
    add  a, d
    ld   a, a
    add  a, d
    ld   a, a
    add  a, d
    ld   a, a
    add  a, d
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    add  a, e
    ld   a, h
    rst  8
    ld   [hl], b
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    rst  $38
    ld   h, b

label_D4B78::
    xor  a
    ld   [hl], b
    ld   a, e
    inc  a
    ld   l, a
    rra
    rra
    nop
    inc  bc
    nop
    dec  c
    inc  bc
    inc  de
    rrca
    inc  de
    rrca
    ld   hl, label_201F
    rra
    ldi  [hl], a
    rra
    ldi  [hl], a
    rra
    ldi  [hl], a
    rra
    ldi  [hl], a
    rra
    jr   nz, label_D4BB5
    jr   nz, label_D4BB7
    jr   nz, label_D4BB9
    jr   nz, label_D4BBB
    jr   nz, label_D4BBD
    jr   nz, label_D4BBF
    jr   nc, label_D4BC1
    jr   nz, label_D4BC3
    jr   nc, label_D4BC5
    jr   nc, label_D4BC7
    jr   nz, label_D4BC9
    jr   nc, label_D4BCB
    jr   nc, label_D4BCD
    jr   nc, label_D4BCF
    ld   sp, label_331E
    inc  e
    dec  hl

label_D4BB5::
    inc  e
    dec  de

label_D4BB7::
    inc  c
    dec  e

label_D4BB9::
    ld   c, $0E

label_D4BBB::
    rlca
    rlca

label_D4BBD::
    ld   bc, $0001
    nop

label_D4BC1::
    nop
    inc  bc

label_D4BC3::
    nop
    inc  c

label_D4BC5::
    inc  bc
    ld   de, label_230F

label_D4BC9::
    rra
    ld   h, e

label_D4BCB::
    rra
    ld   b, c

label_D4BCD::
    ccf
    ld   b, b

label_D4BCF::
    ccf
    add  a, b
    ld   a, a
    add  a, h
    ld   a, a
    add  a, l
    ld   a, [hl]
    add  a, a
    ld   a, h
    rst  0
    ld   a, h
    add  a, a
    ld   a, b
    rst  0
    ld   a, b
    rst  0
    ld   a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    dec  bc
    rlca
    add  hl, bc

label_D4BF7::
    rlca
    inc  c
    rlca
    ld   c, $07
    rrca
    inc  bc
    rlca
    nop
    rst  $20
    ld   a, b
    ld   h, a
    jr   c, label_D4C78
    inc  a
    ld   d, e
    inc  a
    add  hl, sp
    ld   e, $2D
    ld   e, $1D
    ld   c, $1D
    ld   c, $39
    ld   c, $D3
    inc  a
    rst  0
    ld    hl, sp+$8F
    ld   a, [$FF3F]
    jp   label_1CFF
    db   $FC ; Undefined instruction
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
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    ld   [label_807], sp
    rlca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_A07], sp
    rlca
    dec  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    ccf
    nop
    ld   l, a
    ld   e, $4F
    ccf
    ld   h, e
    ccf
    ld   [hl], b
    rra
    jr   c, label_D4C63
    ld   d, $0D
    rrca
    ld   b, $0F
    inc  bc
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D4C63::
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    ld   b, $F8
    ld   a, c
    cp   $7C
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    inc  hl
    rst  $38

label_D4C78::
    ld   [hl], c
    cp   a
    ld   sp, hl
    rla
    db   $FC ; Undefined instruction
    inc  de
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [hl]
    add  a, c
    cp   [hl]
    pop  bc
    sbc  a, $E1
    adc  a, $71
    xor  $71
    and  $39
    and  $39
    ld   h, h
    cp   e
    ld   c, l
    or   e
    inc  e
    db   $E3 ; Undefined instruction
    ld   a, [hl]
    add  a, c
    cp   $79
    rst  $38
    add  a, h
    add  a, a
    inc  bc
    inc  bc
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
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   h, b
    ret  nz
    ld   [hl], b
    ld   [$FF30], a
    ld   [$FF38], a
    ld   a, [$FF18]
    ld   a, [$FF1C]
    ld    hl, sp+$1C
    ld    hl, sp+$1C
    ld    hl, sp+$1C
    ld    hl, sp+$1C
    ld    hl, sp+$3C
    ld    hl, sp+$38
    ld   a, [$FF38]
    ld   a, [$FF78]
    ld   [rSVBK], a
    ld   [$FFF0], a
    ret  nz
    ld   [$FF80], a
    ld   [rJOYP], a
    ld   e, h
    ld   [$FF7A], a
    db   $FC ; Undefined instruction
    ld   [hl], $FC
    xor  $1C
    cp   $F8
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4D00
    jr   label_D4D02
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
    jr   label_D4D10
    jr   label_D4D12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4D00::
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    rra
    rrca
    rra

label_D4D10::
    rrca
    rra

label_D4D12::
    rlca
    rrca
    rlca
    rrca
    inc  bc
    rlca
    inc  bc
    rlca
    ld   bc, $0103
    inc  bc
    nop
    ld   bc, $8000
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    ret  nz
    ld   [$FFC0], a
    ld   [$FFE0], a
    ld   a, [$FFE0]
    ld   a, [$FFF0]
    ld    hl, sp+$F0
    ld    hl, sp+$00
    ld    hl, sp+$00
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    rra
    ld   bc, $0007
    ld   bc, label_301
    inc  bc
    rlca
    rlca
    rrca
    inc  c
    rra
    db   $10 ; Undefined instruction
    nop
    ld   [hl], b
    nop
    ld   b, b
    nop
    ld   bc, label_700
    inc  b
    ld   e, $18
    ld   a, h
    ld   [hl], b
    ld    hl, sp+$E0
    ld   a, [$FFC0]
    ld   [$FF80], a
    ret  nz
    ret  nz
    ld   a, [$FFF0]
    db   $FC ; Undefined instruction
    ret  nz
    ld   a, [$FF00]
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
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    rra
    rra
    ld   a, a
    ld   a, a
    rst  $38
    ld   bc, label_1FF
    inc  bc
    ld   bc, $0103
    inc  bc
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
    nop
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    rst  $38
    cp   $FF
    ld    hl, sp+$FE
    ld   [$FFF8], a
    add  a, b
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
    ld   b, d
    ld   b, d
    inc  h
    inc  h

label_D4DC6::
    jr   label_D4DE0
    jr   label_D4DE2
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
    jr   label_D4DF0
    jr   label_D4DF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4DE0::
    nop
    nop

label_D4DE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4E00
    jr   label_D4E02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4DF0::
    nop
    nop

label_D4DF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D4E10
    jr   label_D4E12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D4E00::
    rlca
    nop

label_D4E02::
    dec  bc
    rlca
    rra
    rrca
    cpl
    rra
    ccf
    inc  de
    ccf
    inc  de
    dec  sp
    rla
    cpl
    dec  e

label_D4E10::
    rra
    rrca

label_D4E12::
    ccf
    dec  bc
    ld   a, a
    jr   nc, label_D4E92
    inc  [hl]
    jr   c, label_D4E21
    inc  e
    inc  bc
    ccf
    inc  e
    ccf
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   [$FFF8], a
    ld   a, [$FFFC]

label_D4E27::
    ld    hl, sp+$DC
    jr   c, label_D4E27
    jr   label_D4EA9
    sbc  a, b
    db   $F4 ; Undefined instruction
    ld    hl, sp+$DC
    ld   [$FFD2], a
    ld   l, h
    rst  $20
    jr   label_D4DC6
    db   $76 ; Halt
    rrca
    or   $06
    ld    hl, sp+$9E
    ld   h, b
    ld   a, [$FF00]
    rlca
    nop
    dec  bc
    rlca
    ld   e, $0F
    dec  l
    rra
    ccf
    rra
    ccf
    rra
    cpl
    rra
    scf
    inc  c
    ld   c, a
    jr   nc, label_D4E9A
    jr   c, label_D4E75
    rra
    db   $10 ; Undefined instruction
    ld   h, $19
    cpl
    ld   d, $3F
    ld   c, $3F
    nop
    ld   [rJOYP], a
    ld   d, b
    ld   [$FFF8], a
    ld   a, [$FF74]
    ld    hl, sp+$F4
    ld    hl, sp+$F4
    ld    hl, sp+$F4
    ld    hl, sp+$C8
    ld   [hl], b
    db   $F4 ; Undefined instruction
    ld   [label_D7886], sp
    rlca

label_D4E75::
    ld   a, [$F60F]
    ld   e, $E0
    inc  b
    ld    hl, sp+$9C
    ld   h, b
    ld   a, [$FF00]
    rlca
    nop
    dec  bc
    rlca
    rla
    rrca
    rra
    rrca
    rra
    ld   b, $1F
    ld   b, $1F
    ld   b, $17
    dec  bc
    rla
    rrca

label_D4E92::
    rra
    dec  b
    ccf
    db   $10 ; Undefined instruction
    rla
    db   $10 ; Undefined instruction

label_D4E9A::
    ld   de, label_1B0E
    dec  b
    rrca
    nop
    ld   [rJOYP], a
    ld    hl, sp+$E0
    db   $F4 ; Undefined instruction
    ld    hl, sp+$FC
    ld    hl, sp+$FC

label_D4EA9::
    ld   a, b
    db   $FC ; Undefined instruction

label_D4EAB::
    ld   a, b
    db   $F4 ; Undefined instruction
    ld   a, b
    db   $E8 ; add  sp, d
    ld   a, [$FFF0]
    add  a, b
    ld   c, b
    or   b
    db   $E4 ; Undefined instruction
    jr   label_D4EAB
    ld   l, b
    db   $FC ; Undefined instruction
    ld   h, b
    db   $F4 ; Undefined instruction
    ld   [$ECF2], sp
    db   $FC ; Undefined instruction

label_D4EBF::
    nop
    nop
    nop
    rlca
    nop
    dec  bc
    rlca
    rla
    rrca
    rla
    rrca
    rla
    inc  c
    rla
    inc  c
    rla
    inc  c
    rra
    rlca
    rla
    ld   c, $1F
    ld   b, $0F
    ld   bc, label_50B
    add  hl, de
    ld   b, $34
    dec  de
    ccf
    nop
    nop
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   a, [$FFF4]
    ld    hl, sp+$FC
    ld    hl, sp+$FC
    ld    hl, sp+$FC
    ld    hl, sp+$F4
    ld    hl, sp+$C8
    ld   a, [$FFF0]
    nop
    ret  z
    jr   nc, label_D4EBF
    or   b
    call nc, label_F2A8
    inc  c
    ld   a, [$FC74]
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rra
    inc  b
    cpl
    inc  d
    ld   b, a
    db   $3A ; ldd  a, [hl]
    add  a, e
    ld   a, l
    adc  a, c
    db   $76 ; Halt
    ld   d, b
    cpl
    inc  a
    inc  bc
    rra
    inc  c
    cpl
    inc  de
    inc  hl

label_D4F19::
    inc  e
    db   $10 ; Undefined instruction
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
    nop
    rlca
    nop
    ld   [label_1107], sp
    rrca
    inc  hl
    rra
    ld   hl, label_201F
    rra
    ldi  [hl], a
    dec  e
    ldi  [hl], a
    dec  e
    jr   nc, label_D4F4B
    jr   label_D4F45
    rrca
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc

label_D4F45::
    rlca
    add  hl, bc
    rlca
    ld   [label_A07], sp

label_D4F4B::
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   [label_807], sp
    rlca
    jr   label_D4F61
    jr   label_D4F63
    inc  e
    inc  bc
    rrca
    nop
    nop

label_D4F61::
    nop
    nop

label_D4F63::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_D4F74

label_D4F74::
    ld   [hl], h
    jr   c, label_D4F19
    ld   a, h
    jp   z, label_CA34
    inc  [hl]
    add  a, d
    ld   a, h
    ld   a, h
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    ld   de, label_130F
    rrca
    inc  hl
    dec  e
    daa
    jr   label_D4FB6
    jr   label_D5008
    jr   z, label_D5006
    inc  l
    ld   e, h
    inc  sp
    cpl
    inc  e
    ld   a, e
    rlca
    ld   [hl], a
    jr   label_D4FDC
    db   $10 ; Undefined instruction
    nop
    dec  d
    nop
    rra
    nop
    rra
    nop
    ccf
    rlca
    ld   a, a
    dec  l
    ld   a, a
    jr   z, label_D5008
    scf
    jr   c, label_D4FC7
    ccf
    db   $10 ; Undefined instruction
    ld   [label_277F], sp

label_D4FB6::
    ld   [hl], a
    jr   z, label_D4FEC
    rrca
    ld   e, $01
    dec  a
    ld   e, $1F
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction

label_D4FC7::
    ld   [$FFFE], a
    or   h
    cp   $B4
    db   $3A ; ldd  a, [hl]

label_D4FCD::
    db   $FC ; Undefined instruction
    inc  a
    ret  z
    db   $FC ; Undefined instruction
    jr   label_D4FCD
    inc  [hl]
    ld   a, [$FF00+C]
    ld   a, [$FC34]
    or   b
    jr   c, label_D4F9C

label_D4FDC::
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    dec  sp
    nop
    inc  a
    dec  de
    ld   a, $1D
    ccf
    ld   b, $3F
    dec  bc
    ccf
    dec  e

label_D4FEC::
    ld   a, a
    jr   label_D4FEE
    ld   e, c
    db   $ED ; Undefined instruction
    ld   e, [hl]
    db   $D3 ; Undefined instruction
    inc  l
    adc  a, a
    ld   [hl], b
    and  e
    ld   e, h
    or   e
    ld   l, h
    db   $D3 ; Undefined instruction
    ld   a, $61
    rra
    ccf
    nop
    nop
    nop
    nop
    nop

label_D5004::
    nop
    nop

label_D5006::
    nop
    nop

label_D5008::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, $0102
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  e
    inc  bc
    ld   h, b
    rra
    add  a, e
    ld   a, a
    rlca
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [label_807], sp
    rlca
    ld   [label_D7807], sp
    rlca
    ld    hl, sp+$37
    call c, label_EC63
    ld   [hl], e
    or   [hl]
    ld   a, c
    ld   [hl], a
    jr   c, label_D5004
    ld   [hl], a
    rst  $30
    ld   l, a
    rst  $38
    ld   a, h
    rst  $38
    jr   c, label_D5061

label_D5061::
    rst  $38
    nop
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
    ld    hl, sp+$1F
    ld   [$FF3F], a
    ret  nz
    ccf
    ret  nz
    rra
    ld   [$FF87], a
    ld   a, b
    ld   [$FF9F], a
    rst  $30
    ret  z
    db   $FD ; Undefined instruction
    jp   label_C7FF
    ld   a, l
    ld   [bc], a
    dec  d
    ld   a, [bc]
    inc  a
    inc  bc
    ld   h, [hl]
    add  hl, de
    ld   d, a
    jr   c, label_D50D9
    ld   sp, label_679
    ld   [hl], $0F
    ld   a, e
    rlca
    pop  de
    ccf
    cp   h
    ld   a, e
    adc  a, l
    ld   [hl], d
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $28
    sbc  a, $7B
    db   $FC ; Undefined instruction
    xor  [hl]
    ld   [hl], c
    db   $FC ; Undefined instruction
    inc  bc
    sbc  a, $39
    xor  a
    call c, label_E35D
    ld   [hl], c
    rst  $28
    rst  $10
    ld   l, b
    sbc  a, l
    ld   h, e
    cp   a
    ld   c, b
    rst  $38
    inc  c
    sbc  a, a
    inc  b
    ld   c, $00
    nop
    nop
    nop
    nop
    rst  $30
    ld   a, e
    sbc  a, $3F
    ld   [hl], l
    adc  a, [hl]
    ccf
    ret  nz
    ld   a, [$F73D]
    ld   a, b
    ld   a, l
    add  a, e
    adc  a, e
    rst  $30
    sub  a, $2F
    ld   [hl], l
    adc  a, [hl]
    ld   a, [$FF00+C]
    ld   a, [$FE65]

label_D50D9::
    ld   b, c
    rst  $20
    nop
    ld   bc, $0000
    nop
    cp   [hl]
    ld   b, b
    or   d
    ld   c, h
    db   $3A ; ldd  a, [hl]
    call z, label_C836
    ld   l, h
    sub  a, b
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    ret  nz
    sbc  a, b
    ld   [$FF78], a
    add  a, b
    ld   e, h
    ld   [$FFEC], a
    ld   a, [$FFCE]
    ld   a, [$FF3B]
    call c, label_BE4D
    pop  hl
    ld   e, $7E
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    ld   [bc], a
    ld   bc, label_172
    adc  a, h
    ld   [hl], e
    or   c
    ld   a, a
    or   c

label_D5111::
    ld   a, a
    adc  a, h
    ld   [hl], e
    ld   [hl], d
    ld   bc, $0102
    dec  b
    inc  bc
    dec  b
    inc  bc
    inc  b
    inc  bc
    inc  bc
    nop
    nop
    nop
    jr   c, label_D5124

label_D5124::
    ld   b, h
    jr   c, label_D5181
    inc  a
    ld   e, d
    inc  a
    ld   hl, label_181E
    rlca
    dec  b
    inc  bc
    dec  b
    inc  bc
    jr   label_D513B
    ld   hl, label_D5A1E
    inc  a
    ld   e, d
    inc  a
    ld   b, h

label_D513B::
    jr   c, label_D5175
    nop
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5160
    jr   label_D5162
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
    jr   label_D5170
    jr   label_D5172
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5160::
    nop
    nop

label_D5162::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5180
    jr   label_D5182
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5170::
    nop
    nop

label_D5172::
    ld   b, d
    ld   b, d
    inc  h

label_D5175::
    inc  h
    jr   label_D5190
    jr   label_D5192
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5180::
    nop

label_D5181::
    nop

label_D5182::
    nop
    nop
    nop
    nop
    ld   c, $00
    ld   e, $04
    dec  e
    ld   c, $1A
    rlca
    dec  b
    inc  bc

label_D5190::
    ld   [bc], a
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
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    rlca
    rrca
    inc  b
    ld   a, a
    dec  b
    ld   a, e
    scf
    ld   a, a
    ld   sp, label_1D3F
    ld   e, a
    inc  l
    ld   a, h
    inc  bc
    ld   a, e
    inc  [hl]
    ld   a, h
    inc  sp
    ccf
    nop
    rrca
    ld   b, $1F
    ld   c, $1F
    nop
    ld   a, [$FF00]
    ld    hl, sp+$F0
    ld   a, h
    ld    hl, sp+$3C
    ret  z
    rst  $38
    db   $E8 ; add  sp, d
    rst  $30
    db   $3A ; ldd  a, [hl]
    rst  $38
    and  $FE
    inc  l
    db   $FD ; Undefined instruction
    ld   a, [bc]
    call label_3732

label_D51D5::
    ret  z
    rst  8
    ld   [hl], $FF
    ld   b, $CE
    jr   nc, label_D51D5
    nop
    nop
    nop
    rst  $20
    nop
    rst  $38
    ld   h, a
    cp   $6F
    ld   a, [hl]
    add  hl, hl
    rst  $38
    dec  bc
    rst  $38
    ld   h, [hl]
    rst  $38

label_D51ED::
    ld   l, e
    rst  $38
    ld   [bc], a
    daa
    jr   label_D5272
    jr   nz, label_D51ED
    ld   [hl], b
    ld   a, b
    jr   nc, label_D5269
    jr   nz, label_D521B
    nop
    nop
    nop
    nop

label_D51FF::
    nop
    nop
    nop
    nop
    nop
    ld   a, $00
    ld   a, a
    inc  e
    ld   a, a
    ld   a, $7F
    ld   [hl], $7F
    ld   [hl], $7F
    ld   [hl], $7F
    jr   nc, label_D5292
    jr   nc, label_D5294
    ld   [hl], $7F
    ld   [hl], $7F
    ld   [hl], $7F

label_D521B::
    ld   a, $7F
    inc  e
    ld   a, $00
    nop
    nop
    nop
    nop
    nop
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
    ld   h, a
    rst  $38
    or   l
    rst  $38
    dec  [hl]
    rst  $38
    ld   [hl], l
    rst  $38
    or   l
    rst  $38
    or   l
    rst  $38
    ld   [hl], l
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
    cp   l
    nop
    rst  $38
    jr   label_D5252
    or   l
    rst  $38
    or   l
    rst  $38
    or   c
    rst  $38
    or   l
    rst  $38
    or   l
    rst  $38
    sbc  a, b
    db   $FD ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    cp   $0C
    cp   $CC

label_D5272::
    cp   $AC
    cp   $AC
    cp   $EC
    cp   $8C
    cp   $AC
    cp   $CC
    cp   $00
    nop
    nop
    rlca
    nop
    rra
    inc  bc
    ccf
    rrca
    ccf
    ld   e, $7F
    inc  e
    ld   a, a
    inc  a
    ld   a, a
    jr   c, label_D5310
    jr   c, label_D5312
    jr   c, label_D5314
    jr   c, label_D5316
    jr   c, label_D5318
    dec  e
    ccf
    rra
    ccf
    rlca
    rrca
    nop
    nop
    nop
    jp   label_F300
    add  a, c
    ei
    pop  hl
    ei
    pop  hl
    ei
    ld   [hl], c
    ei
    ld   [hl], c
    rst  $38
    ld   [hl], c
    rst  $38
    ld   [hl], e
    rst  $38
    ld   [hl], e
    rst  $38
    di
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  0
    rst  $28
    ld   [bc], a
    add  a, a
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    ld   a, $1C
    ld   a, a
    ld   a, $FF
    db   $76 ; Halt
    rst  $38
    ld   h, [hl]
    ld   l, a
    ld   b, $1F
    ld   c, $3F
    inc  e
    ld   a, $18
    inc  e
    nop
    inc  a
    jr   label_D5357
    jr   c, label_D5359
    jr   nc, label_D5317
    nop
    rlca
    rlca
    rra
    jr   label_D5324
    inc  hl
    ld   a, l
    ld   c, [hl]
    ld   [hl], e
    ld   e, h
    and  $B9
    and  $B9
    and  $B9
    add  a, $B9
    rst  0
    cp   b
    add  a, $B9
    ld   h, [hl]
    ld   e, c
    ld   [hl], b
    ld   c, a
    inc  a
    inc  hl
    rra
    jr   label_D5306
    rlca
    rlca
    rlca
    rra
    jr   label_D5344
    inc  hl

label_D5306::
    ld   a, h
    ld   c, a
    ld   [hl], a
    ld   e, b
    and  $B9
    and  $B9
    rst  $20
    cp   b

label_D5310::
    add  a, $B9

label_D5312::
    add  a, $B9

label_D5314::
    add  a, $B9

label_D5316::
    ld   h, a

label_D5317::
    ld   e, b

label_D5318::
    ld   [hl], b
    ld   c, a
    inc  a
    inc  hl
    rra
    jr   label_D5326
    rlca
    ld   [$FFE0], a
    ld    hl, sp+$18

label_D5324::
    db   $FC ; Undefined instruction
    call nz, label_F23E
    adc  a, $3A
    ld   h, a
    sbc  a, l
    ld   h, a
    sbc  a, l
    rst  0
    dec  a
    ld   h, e
    sbc  a, l
    ld   h, e
    sbc  a, l
    ld   h, e
    sbc  a, l
    add  a, $3A
    ld   c, $F2
    inc  a
    call nz, label_18F8
    ld   [$FFE0], a
    nop
    nop
    nop
    nop

label_D5344::
    ld   a, a
    nop
    ld   a, a
    ld   a, $7F
    ccf
    ld   a, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    ccf
    ld   a, a
    ld   a, $7F

label_D5357::
    jr   nc, label_D53D1

label_D5359::
    jr   nc, label_D53D3
    jr   nc, label_D53D5
    jr   nc, label_D53D7
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
    nop
    add  a, e
    nop
    add  a, e
    ld   bc, label_1FF
    rst  $38

label_D5373::
    ld   l, h
    rst  $38

label_D5375::
    ld   a, l
    rst  $38

label_D5377::
    ld   [hl], c
    ei

label_D5379::
    ld   h, c
    di

label_D537B::
    ld   h, c
    di
    ld   h, c
    di
    nop
    nop
    nop
    nop
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
    ret  nz
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   [hl], $FF
    cp   a
    rst  $38
    or   e
    rst  $38
    or   e
    rst  $38
    or   e
    rst  $38
    or   e
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
    inc  a
    nop
    rst  $38
    jr   label_D53B2
    ld   a, [hl]
    rst  $38
    jr   label_D5373
    jr   label_D5375
    jr   label_D5377
    jr   label_D5379
    jr   label_D537B
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    rrca
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38

label_D53D1::
    ld   l, l
    rst  $38

label_D53D3::
    ld   l, l
    rst  $38

label_D53D5::
    ld   l, l
    rst  $38

label_D53D7::
    ld   l, l
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
    cp   [hl]
    nop
    rst  $38
    inc  e
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld   b, $7F
    ld   [hl], $7F
    inc  e
    ld   a, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_3300
    ld   bc, label_317B
    ld   a, c
    jr   nc, label_D544B
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sbc  a, [hl]
    inc  c
    sbc  a, $8C
    call z, label_8080
    nop
    nop
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
    cp   $7C
    cp   $7C
    cp   $60
    ld   a, [$FF60]
    db   $FC ; Undefined instruction
    ld   h, b
    rst  $38
    ld   a, b
    rst  $38
    ld   a, c
    rst  $38
    ld   h, c
    di
    ld   h, c
    rst  $38
    ld   h, c
    rst  $38
    ld   a, l
    rst  $38
    ld   a, l
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
    cp   [hl]
    nop
    rst  $38
    or   [hl]
    rst  $38
    rst  $30
    rst  $38
    rst  0
    rst  $28
    add  a, [hl]
    rst  8
    add  a, [hl]
    rst  8
    add  a, [hl]
    rst  8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $28
    nop
    rst  $38
    rst  8
    rst  $38
    reti
    rst  $38
    add  hl, de
    cp   a
    add  hl, de
    ccf
    add  hl, de
    rra
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], a
    nop
    rst  $38
    ld   [hl], $FF
    cp   [hl]
    rst  $38
    cp   b
    db   $FC ; Undefined instruction
    or   b
    ld    hl, sp+$B0
    ld    hl, sp+$30
    ld   a, b
    nop
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    inc  a
    ld   a, [hl]
    nop
    nop
    nop
    jr   label_D54E4

label_D54E4::
    inc  a
    jr   label_D5565
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    jr   c, label_D556D
    jr   c, label_D556F

label_D54F3::
    jr   nc, label_D556D
    jr   nc, label_D5527
    nop
    ld   a, b
    jr   nc, label_D54F3
    ld   [hl], b
    ld    hl, sp+$60
    ld   [hl], b

label_D54FF::
    nop
    nop

label_D5501::
    nop
    jr   c, label_D5504

label_D5504::
    ld   a, b
    jr   nc, label_D54FF
    jr   nc, label_D5501
    ld   [hl], b
    ld    hl, sp+$70
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    db   $FC ; Undefined instruction
    jr   nc, label_D5517
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $78
    cp   $FC
    cp   $CC
    cp   $CC
    cp   $0C
    cp   $1C
    db   $FC ; Undefined instruction
    jr   c, label_D552B
    ld   [hl], b
    ld   a, [$FF60]
    ld   a, [$FFE0]
    cp   $C0
    cp   $FC
    cp   $FC
    cp   $00
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $78
    cp   $FC
    cp   $CC
    cp   $CC
    cp   $0C
    db   $FC ; Undefined instruction
    jr   c, label_D554D

label_D5551::
    jr   c, label_D5551
    inc  c
    cp   $CC
    cp   $CC
    cp   $CC
    cp   $FC
    cp   $78
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ld   a, $00
    ld   a, $1C
    ld   a, [hl]
    inc  e
    ld   a, [hl]
    inc  a
    cp   $3C
    cp   $7C
    cp   $6C
    cp   $EC
    cp   $CC
    rst  $38
    call z, label_FEFF
    rst  $38
    cp   $FF
    inc  c
    ld   e, $0C
    ld   e, $00
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    inc  bc
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rlca
    nop
    ld   [rJOYP], a
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   [bc], a
    rst  $38
    ld   b, $FF
    ld   a, [de]
    rst  $38
    ret  z
    cp   $40
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    ld   b, $7F
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    ld   b, $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rlca
    nop
    ld   [rJOYP], a
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $38
    ld   b, $FF
    ld   a, [bc]
    rst  $38
    ld   a, [de]
    cp   $38
    db   $FC ; Undefined instruction
    ld   b, b
    ld   a, [$FFC4]
    ld   [bc], a
    ccf
    jp   nz, label_3CDE
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    jr   c, label_D5602

label_D5602::
    ld   d, h
    jr   c, label_D5684
    jr   c, label_D5661
    dec  a
    add  hl, sp
    rra
    ccf
    rrca
    rla
    rrca
    ld   a, a
    rlca
    or   a
    ld   a, a
    cp   $7F
    xor  c
    db   $76 ; Halt
    ld   a, a
    ld   bc, $0103
    inc  bc
    ld   bc, $0003
    ld   bc, $0000
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   d, b
    ld   [$FFE8], a
    ld   a, [$FFF8]
    ld   a, [$FFF8]
    ld   a, [$FFF8]
    ld   a, [$FF98]
    ld   [rUNKN4], a
    ld    hl, sp+$FA
    db   $FC ; Undefined instruction
    cp   $CC
    ld   a, [$FC8C]
    sbc  a, b
    db   $EC ; Undefined instruction
    ld   a, [$FFF0]
    nop
    nop
    nop
    adc  a, $00
    rst  $18
    add  a, h
    rst  $38
    adc  a, [hl]
    rst  $38
    sbc  a, [hl]
    rst  $38
    cp   h
    cp   $F0
    ld    hl, sp+$E0
    ld   a, [$FFE0]
    ld    hl, sp+$B0
    db   $FC ; Undefined instruction
    or   b
    cp   $18
    cp   [hl]
    inc  e
    cp   [hl]
    inc  e
    cp   [hl]
    ld   [$001C], sp
    nop

label_D5661::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    rrca
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    nop
    ld   bc, $0100
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D5684::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   [hl]
    nop
    rst  $38
    inc  e
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld   b, $FF
    add  a, $FF
    ld   a, h
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D56A8
    db   $10 ; Undefined instruction
    jr   z, label_D56AC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D56B8
    db   $10 ; Undefined instruction
    jr   z, label_D56BC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D56C8
    db   $10 ; Undefined instruction
    jr   z, label_D56CC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D56D8
    db   $10 ; Undefined instruction
    jr   z, label_D56DC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D56E8
    db   $10 ; Undefined instruction
    jr   z, label_D56EC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D56F8
    db   $10 ; Undefined instruction
    jr   z, label_D56FC
    ld   b, h
    rst  $38
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, label_301
    ld   bc, $0103
    ld   bc, label_301
    ld   bc, $0103
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    ccf
    nop
    jr   nz, label_D5734
    jr   nz, label_D5736
    jr   nz, label_D5738
    jr   nz, label_D573A
    inc  hl
    rrca
    ld   h, $0F
    ld   h, $00
    rst  $38
    nop
    nop

label_D5734::
    rst  $38
    nop

label_D5736::
    rst  $38
    nop

label_D5738::
    rst  $38
    nop

label_D573A::
    rst  $38
    add  a, $FF
    ld   h, [hl]
    rst  $38
    ld   h, a
    nop
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    ld   h, h
    db   $F4 ; Undefined instruction
    call nz, label_84F4
    nop
    ccf
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction

label_D5758::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, h
    nop
    sbc  a, c
    nop
    add  hl, de
    nop
    add  hl, de
    nop
    sbc  a, h
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    jr   label_D5758
    ld   [label_834], sp
    sub  a, h
    ld   [label_894], sp
    sub  a, h
    ld   [$0034], sp
    rst  $38
    rlca
    rlca
    ld   e, $18
    cpl
    jr   nc, label_D57DA
    ld   l, a
    ld   c, l

label_D5789::
    db   $FD ; Undefined instruction
    pop  de
    ld   sp, hl
    ld   [hl], e
    ld   sp, hl
    inc  hl
    ld   [hl], c
    ld   [$FFE0], a
    ld   a, b
    jr   label_D5789
    inc  c
    jp   z, label_B6F6
    cp   e
    adc  a, e
    sbc  a, a
    adc  a, [hl]
    sbc  a, a
    add  a, h
    adc  a, [hl]
    rrca
    ld   h, $0F
    ld   h, $0F
    inc  hl
    rrca
    jr   nz, label_D57B8
    jr   nz, label_D57BA
    jr   nz, label_D57AD

label_D57AD::
    jr   nz, label_D57CE
    ccf
    rst  $38
    ld   h, a
    rst  $38
    ld   h, [hl]
    rst  $38
    add  a, $FF
    nop

label_D57B8::
    rst  $38
    nop

label_D57BA::
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    db   $F4 ; Undefined instruction
    call nz, label_E4F4
    db   $F4 ; Undefined instruction
    ld   h, h
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    inc  b
    inc  b

label_D57CE::
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [$0084], sp
    or   l
    nop
    or   l
    ld   [$0084], sp
    cp   l

label_D57DA::
    jr   label_D57C3
    rra
    jr   nz, label_D57DF

label_D57DF::
    ccf
    nop
    ld   h, l
    nop
    and  h
    nop
    and  h
    nop
    ld   h, l
    add  a, b
    dec  h
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    nop
    and  c
    nop
    or   e
    nop
    ldd  [hl], a
    nop
    ldd  [hl], a
    nop
    or   d
    nop
    cp   $F8
    inc  b
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_D5814

label_D5814::
    jr   label_D5816

label_D5816::
    nop
    nop
    nop
    nop
    jr   label_D581C

label_D581C::
    jr   label_D581E

label_D581E::
    nop
    nop
    nop
    nop
    jr   label_D5824

label_D5824::
    jr   label_D5826

label_D5826::
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    jr   label_D582C

label_D582C::
    jr   label_D582E

label_D582E::
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D5838
    db   $10 ; Undefined instruction
    jr   z, label_D583C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D5848
    db   $10 ; Undefined instruction
    jr   z, label_D584C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D5858
    db   $10 ; Undefined instruction
    jr   z, label_D585C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D5868
    db   $10 ; Undefined instruction
    jr   z, label_D586C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D5878
    db   $10 ; Undefined instruction
    jr   z, label_D587C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D5888
    db   $10 ; Undefined instruction
    jr   z, label_D588C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D5898
    db   $10 ; Undefined instruction
    jr   z, label_D589C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D58A8
    db   $10 ; Undefined instruction
    jr   z, label_D58AC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D58B8
    db   $10 ; Undefined instruction
    jr   z, label_D58BC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D58C8
    db   $10 ; Undefined instruction
    jr   z, label_D58CC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D58D8
    db   $10 ; Undefined instruction
    jr   z, label_D58DC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D58E8
    db   $10 ; Undefined instruction
    jr   z, label_D58EC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D58F8
    db   $10 ; Undefined instruction
    jr   z, label_D58FC
    ld   b, h
    rst  $38
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5920
    jr   label_D5922
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
    jr   label_D5930
    jr   label_D5932
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5920::
    nop
    nop

label_D5922::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5940
    jr   label_D5942
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5930::
    nop
    nop

label_D5932::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5950
    jr   label_D5952
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5940::
    nop
    nop

label_D5942::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5960
    jr   label_D5962
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5950::
    nop
    nop

label_D5952::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5970
    jr   label_D5972
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5960::
    nop
    nop

label_D5962::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5980
    jr   label_D5982
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5970::
    nop
    nop

label_D5972::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5990
    jr   label_D5992
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5980::
    nop
    nop

label_D5982::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D59A0
    jr   label_D59A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5990::
    nop
    nop

label_D5992::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D59B0
    jr   label_D59B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D59A0::
    nop
    nop

label_D59A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D59C0
    jr   label_D59C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D59B0::
    nop
    nop

label_D59B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D59D0
    jr   label_D59D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D59C0::
    nop
    nop

label_D59C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D59E0
    jr   label_D59E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D59D0::
    nop
    nop

label_D59D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D59F0
    jr   label_D59F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D59E0::
    nop
    nop

label_D59E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A00
    jr   label_D5A02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D59F0::
    nop
    nop

label_D59F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A10
    jr   label_D5A12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A00::
    nop
    nop

label_D5A02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A20
    jr   label_D5A22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A10::
    nop
    nop

label_D5A12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A30
    jr   label_D5A32
    inc  h
    inc  h
    ld   b, d
    ld   b, d

label_D5A1E::
    nop
    nop

label_D5A20::
    nop
    nop

label_D5A22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A40
    jr   label_D5A42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A30::
    nop
    nop

label_D5A32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A50
    jr   label_D5A52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A40::
    nop
    nop

label_D5A42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A60
    jr   label_D5A62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A50::
    nop
    nop

label_D5A52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A70
    jr   label_D5A72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A60::
    nop
    nop

label_D5A62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A80
    jr   label_D5A82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A70::
    nop
    nop

label_D5A72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5A90
    jr   label_D5A92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A80::
    nop
    nop

label_D5A82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5AA0
    jr   label_D5AA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5A90::
    nop
    nop

label_D5A92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5AB0
    jr   label_D5AB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5AA0::
    nop
    nop

label_D5AA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5AC0
    jr   label_D5AC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5AB0::
    nop
    nop

label_D5AB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5AD0
    jr   label_D5AD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5AC0::
    nop
    nop

label_D5AC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5AE0
    jr   label_D5AE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5AD0::
    nop
    nop

label_D5AD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5AF0
    jr   label_D5AF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5AE0::
    nop
    nop

label_D5AE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B00
    jr   label_D5B02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5AF0::
    nop
    nop

label_D5AF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B10
    jr   label_D5B12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B00::
    nop
    nop

label_D5B02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B20
    jr   label_D5B22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B10::
    nop
    nop

label_D5B12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B30
    jr   label_D5B32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B20::
    nop
    nop

label_D5B22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B40
    jr   label_D5B42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B30::
    nop
    nop

label_D5B32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B50
    jr   label_D5B52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B40::
    nop
    nop

label_D5B42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B60
    jr   label_D5B62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B50::
    nop
    nop

label_D5B52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B70
    jr   label_D5B72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B60::
    nop
    nop

label_D5B62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B80
    jr   label_D5B82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B70::
    nop
    nop

label_D5B72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5B90
    jr   label_D5B92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B80::
    nop
    nop

label_D5B82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5BA0
    jr   label_D5BA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5B90::
    nop
    nop

label_D5B92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5BB0
    jr   label_D5BB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5BA0::
    nop
    nop

label_D5BA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5BC0
    jr   label_D5BC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5BB0::
    nop
    nop

label_D5BB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5BD0
    jr   label_D5BD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5BC0::
    nop
    nop

label_D5BC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5BE0
    jr   label_D5BE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5BD0::
    nop
    nop

label_D5BD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5BF0
    jr   label_D5BF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5BE0::
    nop
    nop

label_D5BE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C00
    jr   label_D5C02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5BF0::
    nop
    nop

label_D5BF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C10
    jr   label_D5C12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C00::
    nop
    nop

label_D5C02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C20
    jr   label_D5C22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C10::
    nop
    nop

label_D5C12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C30
    jr   label_D5C32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C20::
    nop
    nop

label_D5C22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C40
    jr   label_D5C42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C30::
    nop
    nop

label_D5C32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C50
    jr   label_D5C52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C40::
    nop
    nop

label_D5C42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C60
    jr   label_D5C62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C50::
    nop
    nop

label_D5C52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C70
    jr   label_D5C72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C60::
    nop
    nop

label_D5C62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C80
    jr   label_D5C82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C70::
    nop
    nop

label_D5C72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5C90
    jr   label_D5C92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C80::
    nop
    nop

label_D5C82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5CA0
    jr   label_D5CA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5C90::
    nop
    nop

label_D5C92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5CB0
    jr   label_D5CB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5CA0::
    nop
    nop

label_D5CA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5CC0
    jr   label_D5CC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5CB0::
    nop
    nop

label_D5CB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5CD0
    jr   label_D5CD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5CC0::
    nop
    nop

label_D5CC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5CE0
    jr   label_D5CE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5CD0::
    nop
    nop

label_D5CD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5CF0
    jr   label_D5CF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5CE0::
    nop
    nop

label_D5CE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D00
    jr   label_D5D02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5CF0::
    nop
    nop

label_D5CF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D10
    jr   label_D5D12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D00::
    nop
    nop

label_D5D02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D20
    jr   label_D5D22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D10::
    nop
    nop

label_D5D12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D30
    jr   label_D5D32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D20::
    nop
    nop

label_D5D22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D40
    jr   label_D5D42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D30::
    nop
    nop

label_D5D32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D50
    jr   label_D5D52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D40::
    nop
    nop

label_D5D42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D60
    jr   label_D5D62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D50::
    nop
    nop

label_D5D52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D70
    jr   label_D5D72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D60::
    nop
    nop

label_D5D62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D80
    jr   label_D5D82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D70::
    nop
    nop

label_D5D72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5D90
    jr   label_D5D92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D80::
    nop
    nop

label_D5D82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5DA0
    jr   label_D5DA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5D90::
    nop
    nop

label_D5D92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5DB0
    jr   label_D5DB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5DA0::
    nop
    nop

label_D5DA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5DC0
    jr   label_D5DC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5DB0::
    nop
    nop

label_D5DB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5DD0
    jr   label_D5DD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5DC0::
    nop
    nop

label_D5DC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5DE0
    jr   label_D5DE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5DD0::
    nop
    nop

label_D5DD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5DF0
    jr   label_D5DF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5DE0::
    nop
    nop

label_D5DE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E00
    jr   label_D5E02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5DF0::
    nop
    nop

label_D5DF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E10
    jr   label_D5E12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E00::
    nop
    nop

label_D5E02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E20
    jr   label_D5E22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E10::
    nop
    nop

label_D5E12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E30
    jr   label_D5E32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E20::
    nop
    nop

label_D5E22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E40
    jr   label_D5E42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E30::
    nop
    nop

label_D5E32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E50
    jr   label_D5E52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E40::
    nop
    nop

label_D5E42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E60
    jr   label_D5E62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E50::
    nop
    nop

label_D5E52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E70
    jr   label_D5E72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E60::
    nop
    nop

label_D5E62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E80
    jr   label_D5E82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E70::
    nop
    nop

label_D5E72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5E90
    jr   label_D5E92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E80::
    nop
    nop

label_D5E82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5EA0
    jr   label_D5EA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5E90::
    nop
    nop

label_D5E92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5EB0
    jr   label_D5EB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5EA0::
    nop
    nop

label_D5EA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5EC0
    jr   label_D5EC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5EB0::
    nop
    nop

label_D5EB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5ED0
    jr   label_D5ED2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5EC0::
    nop
    nop

label_D5EC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5EE0
    jr   label_D5EE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5ED0::
    nop
    nop

label_D5ED2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5EF0
    jr   label_D5EF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5EE0::
    nop
    nop

label_D5EE2::
    ld   b, d

label_D5EE3::
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F00
    jr   label_D5F02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5EF0::
    nop
    nop

label_D5EF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F10
    jr   label_D5F12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F00::
    nop
    nop

label_D5F02::
    ld   b, d
    ld   b, d
    inc  h

label_D5F05::
    inc  h
    jr   label_D5F20
    jr   label_D5F22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F10::
    nop
    nop

label_D5F12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F30
    jr   label_D5F32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F20::
    nop
    nop

label_D5F22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F40
    jr   label_D5F42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F30::
    nop
    nop

label_D5F32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F50
    jr   label_D5F52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F40::
    nop
    nop

label_D5F42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F60
    jr   label_D5F62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F50::
    nop
    nop

label_D5F52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F70
    jr   label_D5F72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F60::
    nop
    nop

label_D5F62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F80
    jr   label_D5F82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F70::
    nop
    nop

label_D5F72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5F90
    jr   label_D5F92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F80::
    nop
    nop

label_D5F82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5FA0
    jr   label_D5FA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5F90::
    nop
    nop

label_D5F92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5FB0
    jr   label_D5FB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5FA0::
    nop
    nop

label_D5FA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5FC0
    jr   label_D5FC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5FB0::
    nop
    nop

label_D5FB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5FD0
    jr   label_D5FD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5FC0::
    nop
    nop

label_D5FC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5FE0
    jr   label_D5FE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5FD0::
    nop
    nop

label_D5FD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D5FF0
    jr   label_D5FF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5FE0::
    nop
    nop

label_D5FE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D6000
    jr   label_D6002
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D5FF0::
    nop
    nop

label_D5FF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D6010
    jr   label_D6012
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D6000::
    adc  a, c
    ld   b, b

label_D6002::
    ld   b, c
    ldi  [hl], a
    ldi  [hl], a
    inc  e
    inc  a
    nop
    jr   nc, label_D600A

label_D600A::
    inc  h
    ld   b, b
    ld   c, b
    add  a, b
    ret  nc
    ld   bc, label_D4088

label_D6012::
    ret  nz
    jr   nz, label_D6039
    db   $10 ; Undefined instruction
    ld   [label_2098], sp
    jr   c, label_D6060
    ld   b, h
    add  a, e
    add  a, e
    nop
    pop  bc
    ldi  [hl], a
    ldi  [hl], a
    inc  e
    inc  e
    nop
    add  hl, bc
    nop
    ld   c, b
    inc  b
    inc  h
    inc  bc
    inc  de
    nop
    ld   bc, label_180
    ld   [bc], a
    ld   [de], a
    inc  b
    inc  h
    ld   [label_104C], sp
    inc  e

label_D6039::
    jr   nz, label_D605F
    jp   nz, label_1C2
    add  a, c
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    db   $FC ; Undefined instruction
    ld   [label_10FB], sp
    rst  $30
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [$FF3F], a
    db   $10 ; Undefined instruction
    ld   [label_8EF], sp
    rst  $28

label_D605F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_D605F
    rrca
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    ld   [label_8DF], sp
    cpl
    jr   label_D6096
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    ld   a, a
    add  a, b
    ld   b, b
    cp   a
    ld   e, a
    and  b
    ld   e, e
    and  h
    ld   d, a
    xor  b
    ld   e, a
    and  b
    ld   e, a
    and  b
    nop
    rst  $38
    cp   $01
    ld   [bc], a
    db   $FD ; Undefined instruction

label_D6096::
    ld   a, [$DA05]
    dec  h
    ld   [$FA15], a
    dec  b
    ld   a, [label_D5F05]
    and  b
    ld   e, a
    and  b
    ld   d, a
    xor  b
    ld   e, e
    and  h
    ld   e, a
    and  b
    ld   b, b
    cp   a
    ld   a, a
    add  a, b
    nop
    rst  $38
    ld   a, [$FA05]
    dec  b
    ld   [$DA15], a
    dec  h
    ld   a, [label_205]
    db   $FD ; Undefined instruction
    cp   $01
    nop
    rst  $38
    ccf
    rst  $38
    ld   e, h
    db   $E3 ; Undefined instruction
    or   e
    ret  nz
    rst  $28
    add  a, b
    rst  $18
    add  a, b
    rst  $18
    add  a, b
    cp   a
    ret  nz
    cp   a
    ret  nz
    db   $FC ; Undefined instruction
    rst  $38
    db   $3A ; ldd  a, [hl]
    rst  0
    call label_BF03
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_3FD
    db   $FD ; Undefined instruction
    inc  bc
    cp   a
    ret  nz
    cp   a
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    cp   a
    ret  nz
    ld   e, h
    db   $E3 ; Undefined instruction

label_D60EE::
    ccf
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    ld   bc, label_5FB
    di
    dec  c
    push hl
    dec  de
    db   $3A ; ldd  a, [hl]
    rst  0
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    inc  bc
    rlca
    inc  b
    ld   c, $09
    dec  e
    dec  de
    dec  l
    dec  sp
    cpl
    add  hl, sp
    ld   c, e
    ld   a, h
    ld   b, l
    ld   a, [hl]
    ld   h, e
    ld   a, a
    ld   h, e
    ld   a, h
    ld   d, c
    ld   a, [hl]
    ld   e, h
    ld   l, a
    ccf
    inc  hl
    cpl
    jr   nc, label_D6138
    inc  e
    rlca
    rlca
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_D60EE
    call c, label_DAEC
    xor  $FA
    adc  a, $E9
    rra
    pop  de
    ccf
    pop  hl
    rst  $38
    db   $E3 ; Undefined instruction
    rra
    push bc
    ccf
    dec  e
    ei

label_D6138::
    cp   $E2
    ld   a, [$EC06]
    inc  e
    ld   a, [$FFF0]
    rst  $38
    rlca
    ld   a, [$CE3C]
    ld   c, b
    rst  $30
    ld   e, b
    rst  $18
    ld   [hl], e
    db   $EC ; Undefined instruction
    inc  [hl]
    jp   hl
    ld   a, c
    xor  l
    cp   c
    ld   a, [$EFBC]
    rst  $30
    xor  a
    or   b
    sub  a, [hl]
    sbc  a, b
    ei
    ld   a, h
    db   $EC ; Undefined instruction
    daa
    db   $DB
    ld   b, a
    rst  $38
    ld   a, a
    rst  $38
    ld   [$FF5F], a
    inc  a
    ld   [hl], e
    ld   [de], a
    rst  $38
    ld   [de], a
    ei
    adc  a, $37
    inc  l
    sub  a, a
    sbc  a, [hl]
    or   l
    sbc  a, l
    ld   e, a
    dec  a
    rst  $30
    rst  $28
    push af
    dec  c
    ld   l, c
    add  hl, de
    rst  $18
    ccf
    scf
    and  $DB
    ld  [$FF00+C], a
    rst  $38
    cp   $FF
    rst  $38
    ld   [$FF9F], a
    sub  a, b
    rst  $28
    adc  a, a
    ld   a, [$FF88]
    rst  $30
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, b
    rst  $30
    adc  a, a
    ld   a, [$FF8F]
    rst  $38
    sbc  a, a
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rst  $38
    rrca
    rra
    rst  $28
    rst  $18
    cpl
    rst  $18
    cpl
    rst  $18
    cpl
    rst  $18
    cpl
    rra
    rst  $28
    rst  $38
    rrca
    rst  $38
    rst  $30
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   a, e
    add  a, h
    ld   [hl], e
    adc  a, h
    ld   h, a
    sbc  a, b
    ld   b, [hl]
    cp   c
    ld   e, $E1
    ld   a, l
    add  a, d
    ld   [hl], e
    adc  a, h
    nop
    rst  $38
    sbc  a, $21
    adc  a, $31
    and  $19
    ld   h, d
    sbc  a, l
    ld   a, b
    add  a, a
    cp   [hl]
    ld   b, c
    adc  a, $31
    ld   [hl], e
    adc  a, h
    ld   a, l
    add  a, d
    ld   e, $E1
    ld   b, [hl]
    cp   c
    ld   h, a
    sbc  a, b
    ld   [hl], e
    adc  a, h
    ld   a, e
    add  a, h
    nop
    rst  $38
    adc  a, $31
    cp   [hl]
    ld   b, c
    ld   a, b
    add  a, a
    ld   h, d
    sbc  a, l
    and  $19
    adc  a, $31
    sbc  a, $21
    nop
    rst  $38

label_D6200::
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

label_D6220::
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
    rst  $38
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   [hl], b
    adc  a, a
    ld   c, a
    or   b
    jr   nz, label_D6220
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
    ld   c, $F1
    ld   a, [$FF00+C]
    inc  b
    dec  bc
    nop
    rst  $38
    ld   a, [hl]
    add  a, c
    ld   a, l
    add  a, d
    ld   a, h
    add  a, e
    ld   a, e
    add  a, h
    ld   a, e
    add  a, h
    ld   a, e
    add  a, h
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   a, e
    add  a, h
    ld   a, e
    add  a, h
    ld   a, b
    add  a, h
    ld   a, h
    add  a, e
    ld   a, h
    add  a, d
    ld   a, [hl]
    add  a, c
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    add  a, c
    cp   [hl]
    ld   b, c
    ld   a, $C1
    sbc  a, $21
    sbc  a, $21
    sbc  a, $21
    ret  nz
    ccf
    ret  nz
    ccf
    sbc  a, $21
    sbc  a, $21
    ld   e, $21
    ld   a, $C1
    ld   a, $41
    ld   a, [hl]
    add  a, c
    nop
    rst  $38
    rrca
    ret  nc
    ld   b, b
    or   b
    ld   [hl], b
    adc  a, a
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
    ld   a, [$FF0B]
    ld   [bc], a
    dec  c
    ld   c, $F1
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

label_D62C0::
    ld   h, b
    adc  a, a
    ret  nz
    rra
    add  a, b
    ccf
    rlca
    ld   a, a
    rra
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   b, $F1
    inc  bc
    ld    hl, sp+$01
    db   $FC ; Undefined instruction
    ld   [$FFFE], a
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    cp   a
    ld   a, a
    rst  $18
    ccf
    ld   l, a
    rra
    inc  sp
    adc  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    cp   $FF
    db   $FD ; Undefined instruction
    cp   $FB
    db   $FC ; Undefined instruction
    or   $F8
    call z, label_80F1
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
    jp   hl
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   [$FF1F], a
    rst  $28
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    ei
    inc  b
    ei
    inc  b
    ei
    inc  b
    rst  $28
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rra
    rst  $38
    nop
    rst  $38
    nop
    ei
    inc  b
    ei
    inc  b
    ei
    inc  b
    ei
    inc  b
    ei
    inc  b
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld    hl, sp+$FF
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    ld   a, [$FF10]
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    nop
    rlca
    inc  b
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
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

label_D63F7::
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    nop
    ld   bc, rJOYP
    ccf
    ld   a, a
    ld   b, d
    jp   nz, label_8484
    adc  a, d
    adc  a, b
    sub  a, e
    sub  a, b
    sub  a, [hl]
    sub  a, c
    sub  a, [hl]
    sub  a, c
    adc  a, e
    adc  a, c
    db   $FC ; Undefined instruction
    cp   $C2
    jp   label_A1B1
    sbc  a, c
    sub  a, c
    ld   e, c
    ld   de, label_11D9
    ld   e, c
    sub  a, c
    or   c
    and  c
    nop
    nop
    db   $10 ; Undefined instruction
    jr   c, label_D644E
    ld   a, h
    ld   b, h
    cp   $C6
    ld   a, [$F2AE]
    sbc  a, [hl]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   [$C6BE], a
    cp   $44
    ld   a, h
    jr   z, label_D6474
    db   $10 ; Undefined instruction
    nop
    nop
    ccf
    ld   a, a
    ld   b, e
    jp   label_858D
    sbc  a, b
    adc  a, b
    sbc  a, c
    adc  a, b
    sbc  a, e
    adc  a, b
    sbc  a, d
    adc  a, c

label_D644E::
    adc  a, l
    add  a, l
    ld   a, h
    ld   a, [hl]
    ldi  [hl], a
    inc  hl
    ld   de, label_D5111
    ld   de, label_9C9
    ld   l, c
    adc  a, c
    ld   l, c
    adc  a, c
    pop  de
    sub  a, c
    nop
    nop
    db   $10 ; Undefined instruction
    jr   z, label_D648E
    ld   c, h
    ld   b, h
    sbc  a, $C6
    cp   d
    xor  [hl]
    sub  a, d
    sbc  a, [hl]
    or   d
    sbc  a, [hl]
    or   d
    sbc  a, [hl]
    or   d
    sbc  a, [hl]

label_D6474::
    ld   [$C6BE], a
    cp   $44
    ld   a, h
    jr   z, label_D64B4
    db   $10 ; Undefined instruction
    nop
    nop
    ccf
    ld   a, a
    ld   b, b
    ret  nz
    sbc  a, a
    add  a, c
    cp   [hl]
    add  a, d
    cp   h
    add  a, h
    cp   b
    adc  a, b
    cp   c
    adc  a, b

label_D648E::
    sbc  a, l
    add  a, l
    db   $FC ; Undefined instruction
    cp   $02
    inc  bc
    ld   sp, hl
    pop  bc
    cp   l
    and  c
    dec  e
    ld   de, label_119D
    dec  e
    sub  a, c
    cp   c
    and  c
    nop
    nop
    db   $10 ; Undefined instruction
    jr   c, label_D64CE
    ld   a, h
    ld   b, h
    cp   $C6
    cp   $AA
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]

label_D64B4::
    ld   a, [$E6AE]
    sbc  a, $44
    ld   a, h
    jr   z, label_D64F4
    db   $10 ; Undefined instruction
    nop
    nop
    ccf
    ld   a, a
    ld   b, c
    pop  bc
    sbc  a, a
    add  a, e
    cp   l
    add  a, l
    cp   b
    adc  a, b
    cp   c
    adc  a, b
    cp   b
    adc  a, c

label_D64CE::
    sbc  a, l
    add  a, l
    db   $FC ; Undefined instruction
    cp   $82
    add  a, e
    ld   a, c
    ld   b, c
    dec  a
    ld   hl, label_119D
    db   $11
    ld   de, $915D
    cp   c
    and  c
    nop
    nop
    db   $10 ; Undefined instruction
    jr   c, label_D650E
    ld   a, h
    ld   b, h
    cp   $C6
    ld   a, [$F2AE]
    sbc  a, [hl]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]

label_D64F4::
    ld   [$C6BE], a
    cp   $4C
    ld   [hl], h
    jr   c, label_D6524
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    rst  $38
    ld   a, e
    add  a, h
    ld   [hl], e
    adc  a, h
    ld   h, a
    sbc  a, b
    ld   b, [hl]
    cp   c
    ld   e, $E1
    ld   a, l
    add  a, d

label_D650E::
    ld   [hl], e
    adc  a, h
    nop
    rst  $38
    sbc  a, $21
    adc  a, $31
    and  $19
    ld   h, d
    sbc  a, l
    ld   a, b
    add  a, a
    cp   [hl]
    ld   b, c
    adc  a, $31
    ld   [hl], e
    adc  a, h
    ld   a, l
    add  a, d

label_D6524::
    ld   e, $E1
    ld   b, [hl]
    cp   c
    ld   h, a
    sbc  a, b
    ld   [hl], e
    adc  a, h
    ld   a, e
    add  a, h
    nop
    rst  $38
    adc  a, $31
    cp   [hl]
    ld   b, c
    ld   a, b
    add  a, a
    ld   h, d
    sbc  a, l
    and  $19
    adc  a, $31
    sbc  a, $21
    nop
    rst  $38
    nop
    rst  $38
    ld   a, l
    add  a, d
    ld   a, c
    add  a, [hl]
    ld   [hl], e
    adc  a, h
    ld   h, e
    sbc  a, h
    ld   b, [hl]
    cp   c
    ld   e, $E1
    ld   a, c
    add  a, [hl]
    nop
    rst  $38
    cp   [hl]
    ld   b, c
    sbc  a, [hl]
    ld   h, c
    adc  a, $31
    add  a, $39
    ld   h, d
    sbc  a, l
    ld   a, b
    add  a, a
    sbc  a, [hl]
    ld   h, c
    ld   a, c
    add  a, [hl]
    ld   e, $E1
    ld   b, [hl]
    cp   c
    ld   h, e
    sbc  a, h
    ld   [hl], e
    adc  a, h
    ld   a, c
    add  a, [hl]
    ld   a, l
    add  a, d
    nop
    rst  $38
    sbc  a, [hl]
    ld   h, c
    ld   a, b
    add  a, a
    ld   h, d
    sbc  a, l
    add  a, $39
    adc  a, $31
    sbc  a, [hl]
    ld   h, c
    cp   [hl]
    ld   b, c
    nop
    rst  $38
    nop
    rst  $38
    ld   e, [hl]
    and  c
    dec  a
    jp   nz, label_8679
    ld   [hl], e
    adc  a, h
    ld   h, e
    sbc  a, h
    ld   c, a
    or   b
    ld   a, $C1
    nop
    rst  $38
    ld   a, d
    add  a, l
    cp   h
    ld   b, e
    sbc  a, [hl]
    ld   h, c
    adc  a, $31
    add  a, $39
    ld   a, [$FF00+C]
    ld   a, h
    add  a, e
    ld   a, $C1
    ld   c, a
    or   b
    ld   h, e
    sbc  a, h
    ld   [hl], e
    adc  a, h
    ld   a, c
    add  a, [hl]
    dec  a
    jp   nz, label_A15E
    nop
    rst  $38
    ld   a, h
    add  a, e
    ld   a, [$FF00+C]
    add  a, $39
    adc  a, $31
    sbc  a, [hl]
    ld   h, c
    cp   h
    ld   b, e
    ld   a, d
    add  a, l
    nop
    rst  $38
    nop
    rst  $38
    ld   l, a
    sub  a, b
    ld   c, [hl]
    or   c
    ld   e, $E1
    ld   a, l
    add  a, d
    ld   a, c
    add  a, [hl]
    ld   [hl], e
    adc  a, h
    ld   c, a
    or   b
    nop
    rst  $38
    or   $09
    ld   [hl], d
    adc  a, l
    ld   a, b
    add  a, a
    cp   [hl]
    ld   b, c
    sbc  a, [hl]
    ld   h, c
    adc  a, $31
    ld   a, [$FF00+C]
    ld   c, a
    or   b
    ld   [hl], e
    adc  a, h
    ld   a, c
    add  a, [hl]
    ld   a, l
    add  a, d
    ld   e, $E1
    ld   c, [hl]
    or   c
    ld   l, a
    sub  a, b
    nop
    rst  $38
    ld   a, [$FF00+C]
    adc  a, $31
    sbc  a, [hl]
    ld   h, c
    cp   [hl]
    ld   b, c
    ld   a, b
    add  a, a
    ld   [hl], d
    adc  a, l
    or   $09
    nop
    rst  $38
    nop
    nop
    inc  bc
    nop
    dec  c
    inc  bc
    rla
    rrca
    cpl
    rra
    cpl
    rra
    ld   d, a
    ccf
    ld   d, a
    ccf
    ld   e, e

label_D6611::
    ccf
    ld   e, l
    ccf
    ld   l, $1F
    inc  sp
    rra
    inc  e
    rrca
    add  hl, bc
    rlca
    ld   b, $01
    ld   bc, $FE00
    nop
    ld   a, l
    cp   $7D
    rst  $38
    ld   a, l
    rst  $38
    ld   a, l
    rst  $38
    ld   a, l
    rst  $38
    ld   a, l
    rst  $38
    cp   e
    rst  $38
    cp   e
    rst  $38
    cp   e
    rst  $38
    ld   d, h
    rst  $38
    sub  a, e
    rst  $28
    jr   c, label_D6611
    cp   e
    rst  $10
    ld   l, h
    rst  $10
    rst  $38
    nop
    nop
    nop
    add  a, b
    nop
    ld   h, b
    add  a, b
    ret  nc
    ld   [$FFE8], a
    ld   a, [$FFE8]
    ld   a, [$FFD4]
    ld    hl, sp+$D4
    ld    hl, sp+$B4
    ld    hl, sp+$74
    ld    hl, sp+$E8
    ld   a, [$FF98]
    ld   a, [$FF70]
    ld   [rNR41], a
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
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, $0003
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    and  c
    ld   e, [hl]
    and  c
    ld   e, [hl]
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    rst  $38
    nop
    rst  $18
    ld   a, [hl]
    rst  $18
    ld   a, [hl]
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
    ld   a, h
    nop
    cp   [hl]
    ld   a, h
    cp   a
    ld   a, [hl]
    cp   [hl]
    ld   a, a
    cp   [hl]
    ld   a, a
    cp   [hl]
    ld   a, a
    add  a, [hl]
    ld   a, a
    add  a, c
    ld   a, [hl]
    rst  $38
    ld   bc, $0003
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   z, label_D66D2
    cp   $10
    add  a, d
    ld   a, h
    ld   d, h

label_D66C7::
    jr   z, label_D66C7
    ld   b, h
    rst  $10
    add  a, d
    sub  a, e
    ld   bc, $0001
    nop
    nop

label_D66D2::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D66FF::
    nop
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
    jp   label_BD81
    jp   label_FF81
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    jp   label_FFBD
    jp   label_FFFF
    ccf
    ccf
    ld   a, a
    ld   b, b
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
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $02
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    add  a, b
    cp   a
    add  a, b
    rst  $18
    add  a, b
    and  b
    ret  nz
    ld   b, b
    ld   a, a
    ld   a, a
    ld   a, a
    ld   e, e
    ld   h, a
    rst  $38
    inc  a
    rst  $38
    ld   bc, label_1FD
    ei
    ld   bc, label_305
    ld   [bc], a
    cp   $FE
    cp   $DA
    and  $FF
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
    rst  $38
    ld   a, [hl]
    add  a, c
    ld   d, d
    xor  l
    ld   l, d
    sub  a, l
    ld   d, [hl]
    xor  c
    ld   c, d
    or   l
    ld   a, [hl]
    add  a, c
    nop
    rst  $38
    inc  a
    inc  a
    ld   a, $26
    ccf
    dec  h
    ccf
    inc  h
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    and  h
    rst  $38
    cp   h
    db   $E3 ; Undefined instruction
    cp   [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    pop  hl
    cp   a
    ld   [$FFBF], a
    rst  $38
    cp   a
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    ld   bc, rSB
    rst  $38
    rst  $38
    ld   c, c
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rlca
    inc  b
    rlca
    inc  bc
    inc  e
    rra
    jr   nz, label_D684A
    nop
    jr   nz, label_D6811

label_D6811::
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
    nop
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FFF0]
    inc  a
    db   $FC ; Undefined instruction
    ld   a, [$FFC4]
    ret  nz
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   a, h
    nop
    ld    hl, sp+$F8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    inc  e
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop

label_D684A::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    call c, label_EC00
    nop
    db   $E8 ; add  sp, d
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    nop
    inc  e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    inc  bc
    inc  hl
    rlca
    scf
    rrca
    rrca
    rra
    rra
    rra
    rra
    rra
    ld   e, $1F
    ld   e, $00
    nop
    ld   [$FFE0], a
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFB0]
    ld   [$FF60], a
    ret  nz
    ret  nz
    ret  nz
    add  a, b
    nop
    ret  nz
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
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0001
    ld   bc, $0000
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    ld    hl, sp+$E0
    ld    hl, sp+$C0
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld   a, [$FF00]
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    ld   b, b
    ld   b, $40
    ld   [bc], a
    ld   b, b
    nop
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
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  bc
    nop
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    rlca
    nop
    rrca
    nop
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_701
    ld   b, $0F
    rrca
    db   $10 ; Undefined instruction
    cp   $FE
    rst  $28
    rra
    rst  $30
    rst  $38
    ccf
    rst  $38
    rra
    ccf
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
    nop
    nop
    ret  nz
    ret  nz
    ld   a, [$FFF0]
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
    db   $EC ; Undefined instruction
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    add  a, b
    adc  a, $FE
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    rra
    rra
    rrca
    rrca
    ld   b, $07
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    ld   e, $00
    rlca
    nop
    inc  bc
    nop
    add  a, e
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
    ld   e, $00
    inc  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_303
    rlca
    daa
    rrca
    cpl
    rrca
    rrca
    cpl
    cpl
    ccf
    ccf
    ccf
    ld   a, $7F
    ld   a, h
    add  a, b
    add  a, b
    ld   [$FFE0], a
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFB0]
    ld   [$FF60], a
    ret  nz
    ret  nz
    ret  nz
    add  a, b
    nop
    jr   nc, label_D6993

label_D6993::
    jr   c, label_D6996
    inc  a

label_D6996::
    nop
    inc  e
    nop
    ld   e, $00
    ld   c, $00
    ld   c, $00
    rlca
    rst  $38
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    nop
    ld   a, b
    nop
    jr   nc, label_D69B0

label_D69B0::
    ld   [hl], e
    nop
    ld   a, h
    nop
    ccf
    nop
    rrca
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   [rJOYP], a
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
    jr   label_D69D3

label_D69D3::
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
    dec  e
    inc  e
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
    or   b
    ld   [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, a
    nop
    inc  e
    nop
    jr   nz, label_D6A0F

label_D6A0F::
    nop
    db   $DB
    ld    hl, sp+$7D
    ld   a, h
    ld   a, $3E
    rra
    rra
    rrca
    rrca
    rlca
    rlca
    rlca
    rlca
    ld   bc, $8003
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, b
    nop
    cp   h
    add  a, b
    sbc  a, $C0
    adc  a, $C0
    xor  $E0
    nop
    rst  $38
    nop
    ei
    nop
    ld   a, [$F400]
    nop
    db   $E8 ; add  sp, d
    nop
    add  a, b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $20
    ld   [$FFF3], a
    ld   a, [$FFF1]
    ld   a, [$FFC1]
    ld   [$FFC0], a
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
    nop
    nop
    ld   bc, label_300
    nop
    rlca
    nop
    rlca
    nop
    rlca
    inc  bc
    inc  de
    rlca
    rla
    rlca
    rlca
    rlca
    rlca
    rrca
    rrca
    rrca
    ld   c, $2F
    inc  l
    ccf
    jr   c, label_D6A81

label_D6A81::
    ld   [hl], b
    nop
    ld   a, b
    nop
    ld   a, b
    nop
    ld   a, h
    nop
    inc  a
    nop
    inc  a
    nop
    ld   e, $00
    ld   e, $7F
    ld   [hl], b
    rst  $38

label_D6A93::
    jr   nc, label_D6A93
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [hl], b
    nop
    ld   h, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   h, b
    nop
    jr   nz, label_D6AD0

label_D6AD0::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
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
    rst  $30
    rst  $30
    rst  $30
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   a, e
    ld   a, e
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
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
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
    rst  $30
    rst  $30
    rst  $30
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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

label_D6C9F::
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
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    nop
    nop
    nop
    nop
    rrca
    nop
    ld   e, $0B
    cpl
    dec  de
    dec  [hl]
    dec  de
    ld   e, b
    scf
    ld   l, c
    ld   [hl], $75
    ld   a, [hli]
    ld   l, d
    dec  d
    ld   a, a
    nop
    ccf
    nop
    rrca
    nop
    nop
    nop
    rlca
    nop
    nop
    nop
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    jp   label_D66FF
    ld   a, [hl]
    inc  a
    inc  a
    jr   label_D6E20
    nop
    ld   b, b
    nop
    ld   bc, label_3C00
    nop
    ld   b, d
    nop
    ld   h, d
    nop
    inc  a
    nop
    jr   label_D6E17

label_D6E17::
    ld   b, b
    jr   label_D6E34
    inc  a
    inc  a
    ld   h, [hl]
    ld   a, [hl]
    jp   label_81FF
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a

label_D6E34::
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF40]
    db   $E8 ; add  sp, d
    ld   [hl], b
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   a, [de]
    db   $F4 ; Undefined instruction
    ld   d, $EC
    sub  a, [hl]
    ld   l, b
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    nop
    nop
    ret  nz
    nop
    nop
    nop
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]

label_D6EC7::
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    nop
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
    ld   a, a
    ccf
    ld   h, b
    rra
    ccf
    nop
    ccf
    nop
    nop
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
    add  a, c
    add  a, c
    inc  a

label_D6F03::
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    nop
    nop
    nop
    nop
    jr   c, label_D6F26

label_D6F26::
    ld   a, h
    jr   c, label_D6EC7
    ld   a, h
    sbc  a, a
    ld   h, [hl]
    rst  $30
    inc  bc
    rlca
    inc  bc
    ld   [bc], a
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
    nop
    jr   c, label_D6F42

label_D6F42::
    ld   a, h
    jr   c, label_D6F03
    ld   a, h
    sbc  a, [hl]
    ld   a, h
    sbc  a, [hl]
    ld   h, h
    ld   l, a
    ld   b, $07
    inc  bc
    rlca
    inc  bc
    ld   [bc], a
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
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   h, b
    sub  a, b
    ld   h, b
    ld    hl, sp+$70
    ld   a, b
    jr   nc, label_D6FAA
    jr   label_D6F8C
    rrca
    rrca
    rlca
    ld   b, $01
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
    ld   h, b
    nop
    sub  a, b
    ld   h, b
    sub  a, c
    ld   h, b

label_D6F8C::
    rst  $28
    ld   [hl], c
    rst  $38
    ccf
    ld   a, $19
    add  hl, de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D6FAA::
    ld   bc, label_300
    ld   bc, label_307
    ld   b, $03
    rlca
    ld   [bc], a
    rrca
    ld   b, $1F
    ld   c, $7E
    inc  e
    sbc  a, [hl]
    ld   a, h
    adc  a, h
    ld   a, b
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
    inc  bc
    nop
    rrca
    inc  bc
    rra

label_D6FCF::
    rrca
    ld   a, $19
    ld   a, l
    jr   c, label_D704D
    jr   nc, label_D6FCF
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    ld   c, b
    jr   nc, label_D7017
    nop
    nop
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
    nop
    cp   $FC
    ld   [bc], a
    db   $FC ; Undefined instruction
    cp   $00
    db   $FC ; Undefined instruction
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    ret  nz
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   [hl], a
    sbc  a, a
    ei
    rst  $28
    ld   a, l
    ld   a, a
    cp   [hl]
    ccf
    sbc  a, $DF
    dec  l
    ld   e, a

label_D7017::
    xor  d
    ld   c, [hl]
    or   l
    ld   c, a
    or   l
    dec  l
    db   $D3 ; Undefined instruction
    xor  e
    rst  $10
    add  hl, hl
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  sp
    ld   c, h
    inc  sp
    adc  a, d
    ld   [hl], c
    ld   a, [bc]
    pop  af
    inc  c
    di
    rrca
    ld   a, [$FF91]
    ld   h, b
    sbc  a, h
    ld   h, b
    ld   d, d
    jr   nz, label_D70A8
    nop
    ld   d, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    inc  b
    nop
    add  a, h
    nop
    ld   b, h
    nop
    ld   b, h
    nop
    ld   b, d
    nop
    ld   b, c
    nop
    pop  hl

label_D704D::
    ld   b, b
    pop  af
    ld   h, b
    or   c
    and  b
    pop  af
    ret  nz
    pop  hl
    nop
    ld   h, c
    add  a, b
    ld   hl, label_31C0
    ret  nz
    ld   e, c
    add  a, b
    adc  a, c
    nop
    jr   nz, label_D7062

label_D7062::
    ld   b, h
    nop
    ld    hl, sp+$00
    rra
    nop
    rla
    ld   [label_1AF7], sp
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, a
    ld   a, a
    ld   e, a
    ccf
    ld   a, [hl]
    ccf
    ld   a, h
    ccf
    ld   [hl], b
    ccf
    ld   hl, label_1F1E
    nop
    ld   bc, label_D4100
    nop
    ld   hl, $D300
    ld   bc, $8257
    ld   c, [hl]
    add  a, l
    ld   c, a
    add  a, l
    dec  l
    jp   label_C7AB
    cpl
    add  a, $2F
    call nz, label_804C
    ld   c, h
    add  a, b
    adc  a, [hl]
    inc  b
    ld   c, $04
    inc  c
    nop
    rrca
    nop
    add  a, h
    nop
    add  a, h
    nop
    call nz, label_C480
    add  a, b

label_D70A8::
    jp   nz, label_C180
    add  a, b
    and  c
    nop
    sub  a, c
    nop
    ld   de, label_3140
    nop
    pop  hl

label_D70B5::
    nop
    ld   h, c
    nop
    ld   hl, label_3100
    nop
    ld   e, c
    nop
    adc  a, c
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, b
    add  a, b
    ld   a, [$FFC0]
    xor  a
    ld   [hl], b
    ld   a, [$E684]
    ld    hl, sp+$FD
    cp   $7F
    cp   $9F
    ld   a, h
    rrca
    nop
    rra
    ld   [label_81F], sp
    ccf
    add  hl, de
    dec  sp
    ld   de, label_337F
    ld   l, a
    inc  sp
    rst  $38
    ld   h, a
    rst  $30
    rrca
    xor  $1F
    inc  a
    rra
    ld   a, b
    ccf
    pop  af
    ld   a, [hl]
    jp   label_8FFC
    ld   [hl], b
    sbc  a, $A0

label_D7100::
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    cp   b
    ld   b, b
    rst  $38
    jr   c, label_D714A
    adc  a, $13
    rst  $28
    dec  c
    rst  $30
    add  a, a
    ld   a, e
    rlca
    ei
    dec  sp
    push bc
    swap l
    db   $D3 ; Undefined instruction
    xor  l
    db   $D3 ; Undefined instruction
    xor  h
    rla
    db   $EB ; Undefined instruction
    xor  a
    call nc, label_102C
    ld   c, b
    jr   nc, label_D716E
    jr   nc, label_D70B5
    ld   [hl], c
    adc  a, d
    ld   [hl], c
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    add  a, h
    ld   a, e
    rst  8
    jr   nc, label_D717F
    jr   nc, label_D715F
    db   $10 ; Undefined instruction
    nop
    add  hl, hl
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    db   $E4 ; Undefined instruction
    ret  nz
    ld  [$FF00+C], a
    ret  nz
    ld  [$FF00+C], a
    ret  nz
    ld   a, [$FF00+C]
    pop  af

label_D7149::
    nop

label_D714A::
    ld   de, $9100
    nop

label_D714E::
    ld   sp, label_D7100
    jr   nz, label_D710C
    jr   nc, label_D714E
    ld   [hl], b
    ld   sp, hl
    ld   h, b
    ld   [hl], c
    add  a, b
    ld   hl, label_D62C0
    add  a, b
    ld  [$FF00+C], a

label_D715F::
    nop
    ld   a, [hl]
    nop
    add  a, e
    nop
    rlca
    nop
    ld   a, l
    ld   b, $7F
    ld   a, $5F
    ccf
    ld   l, a
    rra

label_D716E::
    cpl
    rra
    ld   a, a
    ccf
    ld   a, a
    ccf
    ld   a, [hl]
    ccf
    ld   a, b
    ccf
    jr   nz, label_D7199
    inc  e
    inc  bc
    inc  bc
    nop
    nop

label_D717F::
    nop
    add  a, h
    nop
    inc  b
    nop
    db   $3A ; ldd  a, [hl]
    nop
    jp   z, label_D230
    and  b
    db   $D3 ; Undefined instruction
    and  b
    rla
    db   $E3 ; Undefined instruction
    xor  a
    call nz, label_C3AF
    ld   c, a
    add  a, a
    ld   c, a
    add  a, [hl]
    adc  a, [hl]
    nop
    adc  a, [hl]

label_D7199::
    inc  b
    add  a, [hl]
    nop
    add  a, h
    nop
    add  a, h
    nop
    inc  h
    nop
    ldi  [hl], a
    nop
    ldi  [hl], a
    nop
    ld   [de], a
    nop
    pop  af
    nop
    pop  af
    ld   [$FFF1], a
    ld   h, b
    pop  af
    ret  nz

label_D71B0::
    pop  de
    add  a, b
    adc  a, c
    ld   b, b
    adc  a, c
    nop
    sbc  a, c
    nop
    ld   [hl], c
    nop
    ld   hl, label_D6200
    nop
    ld  [$FF00+C], a
    nop
    jr   c, label_D7149
    scf
    ld   [$005F], sp
    ld   c, a
    rrca
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   bc, label_7FE
    ld    hl, sp+$3F
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    ld    hl, sp+$1F
    rst  $20
    ccf
    cp   b
    ret  nz
    scf
    ret  nz
    ld   e, a
    and  b
    ld   c, [hl]
    cp   a
    rst  $38
    nop
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    ld   bc, label_700
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    ret  nz
    nop
    nop
    nop
    add  a, $00
    add  hl, sp
    add  a, $0A
    db   $F4 ; Undefined instruction
    rlca
    ld    hl, sp+$87
    ld   a, e
    inc  bc
    db   $FD ; Undefined instruction
    pop  bc
    ld   a, $F1
    ld   c, $E0
    rra
    db   $FC ; Undefined instruction
    inc  bc
    ret  z
    scf
    ret  z
    or   a
    sub  a, b
    rst  $28
    sub  a, b
    rst  $28
    rla
    db   $E8 ; add  sp, d
    inc  l
    db   $10 ; Undefined instruction
    jr   nc, label_D726D
    jr   nc, label_D71B0
    ld   [hl], b
    adc  a, [hl]
    ld   [hl], c
    adc  a, d
    ld   [hl], c
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    ld   c, a
    jr   nc, label_D727F
    jr   nc, label_D725F
    db   $10 ; Undefined instruction
    nop
    ld   l, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    db   $F4 ; Undefined instruction
    ld   [$FFF2], a
    ld   h, b
    ld   a, [$F970]
    ld   [hl], b
    ld   sp, hl
    ld   [hl], b
    ei
    ld   [hl], b
    di
    nop
    adc  a, c
    nop
    ld   l, c

label_D7251::
    nop
    sbc  a, c
    nop
    db   $3A ; ldd  a, [hl]
    nop
    ld   a, [$FA30]
    ld   [hl], b
    ld   a, [$F260]
    nop
    ld   [hl], d

label_D725F::
    add  a, b
    ld   b, b
    nop
    di
    nop
    ld   a, [hl]
    inc  sp
    ld   a, a
    ld   a, $5F
    ccf
    ld   c, a
    ccf
    ld   a, a

label_D726D::
    ccf
    rst  $38
    ld   a, a
    cp   $7F
    ld    hl, sp+$7F
    ld   b, b
    ccf
    jr   nz, label_D7297
    inc  e
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop

label_D727F::
    nop
    pop  af
    nop
    ld   [rJOYP], a
    db   $FC ; Undefined instruction
    nop
    ret  z
    jr   nc, label_D7251
    or   b
    sub  a, b
    ld   [$FF90], a
    ld   [rNR22], a
    ld   [$FF2F], a
    jp   label_844F
    ld   c, a
    add  a, a
    adc  a, a

label_D7297::
    ld   b, $8E
    nop
    adc  a, [hl]
    inc  b
    add  a, [hl]
    nop
    add  a, h
    nop
    inc  d
    nop
    sub  a, d
    nop
    adc  a, d
    nop
    adc  a, c
    nop
    adc  a, c
    nop
    adc  a, e
    nop
    di
    nop
    ld   sp, hl
    ld   [hl], b
    ld   sp, hl
    sub  a, b
    ld   sp, hl
    ld   h, b
    ld   a, [$CAC0]
    nop
    adc  a, d
    nop
    sbc  a, d
    nop
    ld   a, [$FF00+C]
    ld   [hl], d
    nop
    ld   e, [hl]
    add  a, b
    ld   a, h
    add  a, b
    ld    hl, sp+$00
    ld   sp, hl
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    di
    cp   $1B
    cp   $ED
    rst  $38
    dec  [hl]
    rst  $38
    dec  d
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    rst  $38
    nop
    ld   bc, label_700
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    ld    hl, sp+$1F
    rst  $20
    ccf
    ld   l, h
    cp   a
    db   $DB
    ld   a, a
    sub  a, $7F
    call nc, label_FF7F
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_D7300::
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c

label_D733F::
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  a
    inc  a
    ld   e, d
    ld   e, d
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   e, d
    ld   e, d
    inc  a
    inc  a
    add  a, c
    add  a, c
    nop
    nop
    jr   label_D7504

label_D7504::
    inc  e
    nop
    inc  e
    nop
    inc  d
    inc  e
    inc  d
    inc  e
    jr   label_D7526
    and  h
    cp   [hl]
    ld   b, e
    rst  $38
    and  h
    cp   [hl]
    jr   label_D752E
    inc  d
    inc  e
    inc  d
    inc  e
    inc  e
    nop
    inc  e
    nop
    jr   label_D7520

label_D7520::
    nop
    nop
    nop
    nop
    jr   label_D7526

label_D7526::
    inc  e
    nop
    inc  d
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e

label_D752E::
    and  h
    cp   [hl]
    ld   b, e
    rst  $38
    and  h
    cp   [hl]
    inc  d
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e
    inc  e
    nop
    jr   label_D753E

label_D753E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_D7548

label_D7548::
    inc  e
    nop
    inc  d
    inc  e
    inc  d
    inc  e
    and  h
    cp   [hl]
    ld   b, e
    rst  $38
    and  h
    cp   [hl]
    inc  d
    inc  e
    inc  d
    inc  e
    inc  e
    nop
    jr   label_D755C

label_D755C::
    nop
    nop
    nop
    nop
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
    inc  d
    inc  e
    inc  d
    inc  e
    and  h
    cp   [hl]
    ld   b, e
    rst  $38
    and  h
    cp   [hl]
    inc  d
    inc  e
    inc  d
    inc  e
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
    nop
    nop
    jr   label_D758C

label_D758C::
    inc  e
    inc  b
    and  h
    cp   [hl]
    ld   b, e
    rst  $38
    and  h
    cp   [hl]
    inc  e
    inc  b
    jr   label_D7598

label_D7598::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  e
    inc  b
    inc  d
    inc  e
    and  h
    cp   [hl]
    ld   b, e
    rst  $38
    and  h
    cp   [hl]
    inc  d
    inc  e
    inc  e
    inc  b
    inc  e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    nop
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
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    inc  c
    ld   a, a
    inc  c
    ccf
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rlca
    nop
    inc  bc
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
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   b, $01
    inc  b
    inc  bc
    add  hl, bc
    rlca
    add  hl, bc
    rlca
    inc  de
    rrca
    inc  de
    rrca
    daa
    rra
    daa
    rra
    ld   c, a
    ccf
    ld   c, a
    ccf
    ld   c, a
    ccf
    sbc  a, a
    ld   a, a
    sbc  a, a
    ld   a, a
    sbc  a, a
    ld   a, a
    sbc  a, a
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
    ld   bc, label_200
    ld   bc, $0102
    inc  b
    inc  bc
    inc  b
    inc  bc
    dec  b
    ld   [bc], a
    ld   b, $00
    ld   b, $00
    nop
    nop
    ld   bc, label_200
    ld   bc, label_30C
    ld   de, label_200F
    rra
    ld   c, b
    ccf
    sub  a, e
    ld   a, h
    inc  hl
    db   $FC ; Undefined instruction
    ld   b, l
    ld    hl, sp+$09
    ld   a, [$FF71]
    add  a, b
    add  a, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, a
    ld   a, a
    ccf
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    sbc  a, a
    ld   a, a
    sbc  a, a
    ld   a, a
    sbc  a, a
    ld   a, a
    sbc  a, a
    ld   a, a
    sbc  a, a
    ld   a, a
    ld   c, a
    ccf
    ld   c, a
    ccf
    ld   c, a
    ccf
    daa
    rra
    daa
    rra
    inc  de
    rrca
    inc  de
    rrca
    add  hl, bc
    rlca
    add  hl, bc
    rlca
    add  hl, bc
    rlca
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
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
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
    inc  b
    inc  bc
    inc  b
    inc  bc
    dec  b
    ld   [bc], a
    ld   b, $00
    inc  b
    nop
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0106
    jr   label_D76F1
    ld   h, b
    rra
    add  a, h
    ld   a, a
    jr   label_D76EF
    ld   hl, label_2FE
    db   $FC ; Undefined instruction
    inc  e
    ld   [$FF60], a
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop

label_D76FD::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    ld   b, $00
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
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   [rIE], a
    rst  $38
    ld   a, $FF
    nop
    rst  $38
    rrca
    ld   a, [$FFFE]
    nop
    ld   a, [$FF00]
    nop
    nop
    ei
    cp   $C3
    rst  $38
    ld   de, label_D40E7
    and  a
    add  a, b
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   a, [$FFFF]
    rst  $38
    ccf
    rst  $38
    ld   c, $FF
    nop
    rst  $38
    nop
    ccf
    rst  $38
    rlca
    cp   $3F
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    add  a, b
    rst  $38
    inc  c
    rst  $38
    ld   a, $FF
    ld   a, a
    rst  $38
    ld   e, $FF
    ld   b, b
    cp   a
    ld   h, c
    sbc  a, $7F
    ret  nz
    ccf
    db   $E3 ; Undefined instruction
    sbc  a, l
    rst  $38
    rst  $20
    rst  $38
    rst  $28
    rst  $38
    rrca
    rst  $38
    add  a, $3F
    and  b
    rst  $18
    cp   b
    rst  0
    rra
    ld   [$FFDF], a
    ld   [rIE], a
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  0

label_D7781::
    ld   sp, hl
    adc  a, a
    di
    rra
    db   $E3 ; Undefined instruction
    ccf
    rst  0
    cp   $0F
    db   $FC ; Undefined instruction
    rra
    ld   sp, hl
    ld   a, a
    rst  $38
    rst  $38
    sbc  a, a
    pop  hl
    ccf
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    jr   c, label_D7781
    ld   a, a
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    cp   $CF
    db   $FC ; Undefined instruction
    adc  a, a
    rst  $30
    rra
    rst  $20
    add  hl, sp
    rst  8
    ld   a, h
    sbc  a, a
    cp   $1F
    rst  $38
    ccf
    rst  $38
    ld   a, a
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    ld   bc, $C3FF
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    jp   label_E1FF
    rst  $18
    ld    hl, sp+$C7
    cp   a
    ld   a, [$FF1F]
    ret  c
    rrca
    adc  a, $07
    add  a, a
    inc  bc
    inc  bc
    nop
    nop
    ld   a, [$FFFF]
    ld   bc, label_1FFE
    ld   [rIE], a
    nop
    rst  $38
    ld   bc, rIE
    rst  $38
    rst  $38
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
    jr   label_D77F4

label_D77F4::
    inc  a
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    inc  a
    nop
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

label_D7807::
    nop
    ld   bc, label_200
    ld   bc, $0007
    ld   c, $01
    jr   label_D7819
    db   $10 ; Undefined instruction
    jr   nz, label_D7835
    jr   nz, label_D7837
    ld   b, b

label_D7819::
    ccf
    ld   b, b
    ccf
    add  a, b

label_D781D::
    ld   a, a
    adc  a, b
    ld   a, a
    nop
    nop
    rlca
    nop
    jr   c, label_D782D
    ld   h, b
    rra
    add  a, b
    ld   a, a
    ld   [hl], b
    adc  a, a
    add  a, b

label_D782D::
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_D7835::
    rst  $38
    nop

label_D7837::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_D781D
    ld   [$FFBF], a
    cp   $00
    add  a, c
    ld   a, [hl]

label_D7844::
    ld   [hl], b
    adc  a, a
    inc  c

label_D7847::
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    jr   c, label_D7847
    ld   bc, $E200
    ld   bc, $C33C

label_D7866::
    ld   b, $F9
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
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    nop
    jr   nc, label_D7844
    jr   c, label_D7866

label_D7886::
    ld   h, b
    ret  nz
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld   a, [$FF80]
    ld   a, b
    add  a, b
    ld   [hl], h
    ret  z
    ld   a, d
    db   $E4 ; Undefined instruction
    ld   sp, hl
    or   $FD
    ld   a, [$F9FE]
    cp   $ED
    cp   $8D
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ret  nz
    nop
    cp   b
    ld   b, b
    cp   h
    ld   e, b
    sub  a, c
    ld   a, a
    or   e
    ld   l, [hl]
    or   a
    ld   l, [hl]
    rst  $20
    ld   e, [hl]
    xor  $5C
    ld   l, [hl]
    inc  e
    ld   l, [hl]
    inc  e
    ld   a, $1C
    ld   e, $0C
    ld   c, $04
    rlca
    ld   [bc], a
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
    ret  nz
    ccf
    ld   b, e
    ccf
    rst  0
    ld   a, [hl]
    adc  a, a
    ld   a, h
    sbc  a, a
    ld   a, b
    sbc  a, a
    ld   a, c
    cp   a
    ld   a, c
    ld   a, a
    ldd  [hl], a
    ld   a, a
    dec  [hl]
    ccf
    inc  d
    ccf
    ld   d, $3F
    ld   b, $9F
    ld   b, $1F
    ld   b, $1F
    rlca
    rra
    rlca
    di
    rst  8
    rst  $10
    xor  h
    rst  $28
    ld   d, e
    rst  $38
    ld   c, a
    rst  $38
    ld   e, $FF
    cp   [hl]
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ld   l, a
    rst  $38
    rrca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, a
    ld   a, a
    jp   label_1FBF
    rlca
    ccf
    rrca
    dec  l
    dec  de
    add  hl, sp
    inc  de
    ld   e, c
    scf
    ld   [hl], d
    daa
    ld   [hl], d
    ld   l, $A7
    ld   c, [hl]
    push hl
    ld   e, [hl]
    push hl
    ld   e, h
    call label_CB5C
    ld   e, h
    sbc  a, d
    ld   a, b
    ld   a, h
    jr   c, label_D7991
    jr   c, label_D7973
    db   $10 ; Undefined instruction
    ld   e, l
    ld   a, a
    cp   [hl]
    ld   a, a
    cp   [hl]
    ld   e, a
    cp   [hl]
    ld   c, a
    cp   l
    ld   c, a
    cp   l
    ld   c, a
    cp   l
    ld   c, a
    cp   d
    ld   l, a
    cp   d
    daa
    jp  c, label_DB37
    rla
    db   $EB ; Undefined instruction
    ld   d, $EB
    rla
    db   $ED ; Undefined instruction
    inc  hl
    db   $21
    ld   hl, $FCDE
    jr   c, label_D795F
    ld   a, b
    db   $EC ; Undefined instruction
    ret  c
    db   $EC ; Undefined instruction
    cp   b
    adc  a, $B8
    sbc  a, $78
    sbc  a, l
    ld   a, d
    cp   c
    or   $39
    or   $39

label_D7973::
    or   $79
    or   $79
    and  $F2
    db   $EC ; Undefined instruction
    ld  [$FF00+C], a
    call c, label_DCE2
    ld  [$FF00+C], a
    call c, label_173F
    cpl
    rla
    cpl
    rla
    ld   l, a
    scf
    ld   c, a
    scf
    ld   b, a
    dec  sp
    ld   b, a
    dec  sp
    ld   b, a
    dec  a
    ld   b, a

label_D7991::
    ld   a, $47
    ccf
    ld   b, a
    ccf
    ld   h, a
    ld   a, $67
    ld   a, $27
    ld   e, $2F
    ld   e, $3F
    ld   e, $01
    cp   $F1
    cp   $F9
    cp   $FC
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
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
    nop
    nop
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
    ld   bc, $0100
    nop
    ld   bc, label_303
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
    ld   bc, $0101
    ld   bc, $DE61
    ld   h, c
    cp   [hl]
    ld   h, c
    cp   [hl]
    ld   b, c
    cp   [hl]
    ld   b, c
    cp   a
    pop  bc
    cp   a
    pop  bc
    cp   a
    jp   label_837F
    ld   a, a
    add  a, e
    ld   a, a
    add  a, e
    ld   a, a
    rst  0
    ld   a, a
    rst  0
    ld   a, a
    ld   l, a
    cp   a
    ld   a, a
    cp   [hl]
    ld   a, a
    cp   [hl]
    jp   nz, label_C2BC
    inc  a
    ld  [$FF00+C], a
    ld   e, h
    pop  af
    ld   l, [hl]
    pop  af
    ld   l, [hl]
    ld   sp, hl
    db   $76 ; Halt
    db   $EB ; Undefined instruction
    ld   [hl], h
    db   $EB ; Undefined instruction
    ld   [hl], h
    jp   z, label_D274
    ld   l, h
    sub  a, d
    ld   l, h
    or   d
    ld   c, h
    or   [hl]
    ld   c, b
    or   $08
    cp   $00
    cp   $00
    ld   de, label_100E
    rrca
    db   $10 ; Undefined instruction
    ld   [label_807], sp
    rlca
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  c
    inc  bc
    dec  e
    ld   a, [bc]
    ld   a, l
    ld   a, [de]
    db   $FD ; Undefined instruction
    ld   a, d
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
    rlca
    inc  bc
    add  a, a
    inc  bc
    adc  a, a
    rlca
    cp   a
    rrca
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    ccf
    cp   a
    ld   e, a
    sbc  a, a
    ld   h, a
    rlca
    ld   sp, hl
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    rrca
    ld   a, [$FF09]
    or   $06
    ld   sp, hl
    dec  b
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
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    ld   a, [$FFEF]
    ld   a, [$FFEF]
    db   $FC ; Undefined instruction
    jp   label_9BE4
    sbc  a, b
    ld   h, a
    ld   [hl], b
    adc  a, a
    adc  a, b
    ld   [hl], a
    pop  hl
    sbc  a, $E1
    sbc  a, $E1
    sbc  a, $F1
    xor  $F1
    xor  $FB
    push hl
    ei
    add  a, l
    ei
    ld   [hl], l
    rst  $38
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $00
    cp   $00
    inc  e
    ld   [rTMA], a
    ld    hl, sp+$03
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
    ld   a, [$FF00]
    rrca
    ld   a, [$FF00]
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FE
    cp   $01
    cp   $03
    cp   $02
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    nop
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
    ld   a, [$FF00]
    adc  a, b
    ld   [hl], b
    add  a, h
    ld   a, b
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   bc, label_1FE
    cp   $01
    cp   $28
    db   $10 ; Undefined instruction
    jr   label_D7B29
    jr   label_D7B2B
    jr   label_D7B2D
    jr   label_D7B3F
    ld   [label_C32], sp
    ld   a, [hli]

label_D7B0F::
    inc  d
    ldi  [hl], a
    inc  e
    ldi  [hl], a
    inc  e
    ldd  [hl], a
    inc  c
    ld   de, label_110E
    ld   c, $11
    ld   c, $10
    rrca
    db   $10 ; Undefined instruction
    add  a, b
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz

label_D7B29::
    ld   a, a
    ld   [$FF7F], a
    ld   h, b

label_D7B2D::
    cp   a
    ld   [hl], b
    cp   a
    ld   a, b
    cp   a
    ld   a, h
    sbc  a, a
    ld   a, [hl]
    sbc  a, a
    ccf
    rst  $18
    ccf

label_D7B39::
    rst  8
    ccf
    rst  8
    rra
    rst  $28
    rra

label_D7B3F::
    rst  $28
    dec  bc
    db   $F4 ; Undefined instruction
    rrca
    ld   a, [$FF00+C]
    ld    hl, sp+$04
    ei
    inc  bc
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    dec  b
    ld   a, [$F906]
    nop

label_D7B51::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    db   $EC ; Undefined instruction
    rst  $38
    rst  $30
    rst  $38
    ld   sp, hl
    rst  $38
    ld   a, [$FF0F]
    cp   h
    jp   label_D7E8
    ret  nc
    cpl
    jr   nc, label_D7B39
    ret  z
    scf
    db   $F4 ; Undefined instruction
    ld   c, e
    db   $EC ; Undefined instruction
    inc  de
    jr   nz, label_D7B51
    nop
    rst  $38
    nop
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    nop
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
    rst  $38
    rlca
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
    ld   bc, label_FFF
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    nop
    rst  $38
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   b, $FD
    inc  b
    ei
    inc  b
    ei
    db   $F4 ; Undefined instruction
    ei

label_D7BCA::
    db   $FC ; Undefined instruction
    ei

label_D7BCC::
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    ld   a, h
    ei
    ld   a, [hl]
    ld   sp, hl
    cp   $FD
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   $07
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
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ccf
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    jr   nz, label_D7BCA
    jr   nz, label_D7BCC
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_8F0], sp
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    add  a, e
    db   $FC ; Undefined instruction
    add  a, c
    cp   $03
    nop
    dec  b
    ld   [bc], a
    ld   e, $04
    ccf
    inc  b
    ld   a, a
    ld   bc, label_1B7F
    ld   a, a
    rra
    rst  $38
    inc  hl
    rst  $38
    ld   d, c
    rst  $38
    ld   b, c
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    rst  $38
    ld   l, a
    rst  $38
    ld   l, a
    ld    hl, sp+$77
    db   $FC ; Undefined instruction
    ld   a, e
    rrca
    nop
    jr   c, label_D7C53
    rst  $38
    inc  a
    rst  $38
    ld   a, [$FFFF]
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $28
    rst  $38
    call c, label_FAFF
    rst  $38
    ld   a, [$FFFF]

label_D7C53::
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_D7C5B::
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ld   a, [label_404]
    ld    hl, sp+$E4
    jr   label_D7C5B
    ld   [$F8C4], sp
    db   $E4 ; Undefined instruction
    ld    hl, sp+$E4
    ld   a, b
    call nz, label_E438
    ld   e, b
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    jp   nz, label_817C
    cp   $C1
    cp   $E1
    cp   $E2
    db   $FC ; Undefined instruction
    jp   nz, label_FEFC
    ld   a, l

label_D7C82::
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    cp   a
    ld   a, [hl]
    cp   a
    ld   a, [hl]
    ld   a, a
    ccf
    ld   e, a
    ccf
    ccf
    rra
    rra
    rrca
    rrca
    rlca
    rrca
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    rrca
    rst  $38
    rst  $30
    rst  $38
    rlca
    rst  $38
    rlca
    ld   a, a
    adc  a, a
    cp   $FF
    sbc  a, h
    rst  $38
    ld    hl, sp+$FF
    pop  hl
    cp   $02
    db   $FD ; Undefined instruction
    inc  c
    di
    ld   a, [$FF0F]
    ld   b, b
    ccf
    jp   nz, label_C4F8
    ld    hl, sp+$C4
    ld    hl, sp+$84
    ld    hl, sp+$84
    ld    hl, sp+$84
    ld   a, [$FF04]
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF48]
    or   b
    adc  a, b
    ld   [hl], b
    ld   [label_8F0], sp
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$00
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   b, h
    rst  $38
    ld   b, h
    rst  $38
    rst  $38
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    nop
    inc  bc
    nop
    dec  b
    ld   [bc], a
    inc  bc
    nop
    dec  b
    ld   [bc], a
    ld   e, $04
    ccf
    inc  b
    ld   a, a
    ld   bc, label_1F7F
    ld   h, a
    ccf
    db   $23
    inc  hl
    rst  $38
    ld   d, c
    rst  $38
    ld   b, c
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    rst  $38
    ld   l, a
    rst  $38
    ld   l, a
    ld    hl, sp+$77
    db   $FC ; Undefined instruction
    ld   a, e
    rrca
    nop
    ld   a, $0F
    rst  $38
    jr   c, label_D7D46
    ld   [rIE], a
    rst  $20
    rst  $38
    rst  $18
    ei
    db   $FC ; Undefined instruction
    rst  $30
    ld   a, [$F0FF]
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_D7D5B::
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ld   a, [label_404]
    ld    hl, sp+$E4
    jr   label_D7D5B
    ld   [$F8C4], sp
    db   $E4 ; Undefined instruction
    ld    hl, sp+$A4
    ld   a, b
    call nz, label_E438
    ld   e, b
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    jp   nz, label_817C
    cp   $C1
    cp   $E1
    cp   $E2
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    cp   $7D
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    cp   a
    ld   a, [hl]
    cp   a
    ld   a, [hl]
    ld   a, a
    ld   a, $5F
    ccf
    ccf
    rra
    rra
    rrca
    rrca
    rlca
    rrca
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    ei
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    di
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld    hl, sp+$FF
    pop  hl
    cp   $02
    db   $FD ; Undefined instruction
    inc  c
    di
    ld   a, [$FF0F]
    ld   b, b
    ccf
    ld  [$FF00+C], a
    ld    hl, sp+$C4
    ld    hl, sp+$C4
    ld    hl, sp+$C4
    ld    hl, sp+$C4
    ld    hl, sp+$84
    ld   a, [$FF84]
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF48]
    or   b
    adc  a, b
    ld   [hl], b
    ld   [label_8F0], sp
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$FF
    rst  $38
    sub  a, a
    ld   sp, hl
    sub  a, c
    rst  $38
    rst  $38
    rst  $38
    and  l
    cp   $A4
    rst  $38
    rst  $38
    rst  $38
    sub  a, a
    ld   sp, hl
    sub  a, c
    rst  $38
    rst  $38

label_D7DF3::
    rst  $38
    and  l
    cp   $A4
    rst  $38
    rst  $38
    rst  $38
    sub  a, a
    ld   sp, hl
    sub  a, c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    rst  $38
    rst  $38
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    rst  $38
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    rst  $38
    rst  $38
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    rst  $38
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    rst  $38
    inc  bc
    nop
    dec  b
    ld   [bc], a
    ld   e, $04
    ccf
    nop
    ld   a, a
    add  hl, de
    ld   a, a
    dec  e
    ld   a, a
    inc  hl
    rst  $38
    ld   bc, label_D51FF
    rst  $38
    ld   b, e
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    rst  $38
    ld   l, a
    rst  $38
    ld   l, a
    ld    hl, sp+$77
    db   $FC ; Undefined instruction
    ld   a, e
    rrca
    nop
    ccf
    inc  c
    rst  $38
    jr   nc, label_D7E46
    rst  $20
    rst  $38
    rst  $28
    ei
    db   $FC ; Undefined instruction
    rst  $30
    ld    hl, sp+$FF
    ld   a, [$FF00+C]
    ld   a, [$FFFF]
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38

label_D7E59::
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ld   a, [$C404]
    jr   c, label_D7E59
    ld   [$C8F4], sp
    call nz, label_E4F8
    ld   a, b
    db   $E4 ; Undefined instruction
    jr   c, label_D7DF3
    ld   a, b
    call nz, label_E278
    db   $FC ; Undefined instruction
    jp   nz, label_C17C
    cp   $E1
    cp   $F1
    cp   $F2
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    cp   $7D
    rst  $38
    ld   a, a
    rst  $38
    ld   a, [hl]
    cp   a
    ld   a, [hl]
    cp   a
    ld   a, [hl]
    ld   a, [hl]
    ccf
    ld   e, a
    ccf
    ccf
    rra
    rra
    rrca
    rrca
    rlca
    rrca
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   a, a
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ld   bc, $FDF2
    rst  $30
    ld   sp, hl
    rst  $38
    ld   bc, label_3FF
    ld   a, a
    add  a, a
    rst  $38
    rst  $38
    adc  a, [hl]
    rst  $38
    ld    hl, sp+$FF
    pop  hl
    cp   $02
    db   $FD ; Undefined instruction
    inc  c
    di
    ld   a, [$FF0F]
    ld   b, b
    ccf
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    ld    hl, sp+$E4
    ld    hl, sp+$E4
    ld    hl, sp+$E4
    ld    hl, sp+$C4
    ld   a, [$FFC4]
    ld   a, [$FF88]
    ld   a, [$FF08]
    ld   a, [$FF48]
    or   b
    adc  a, b
    ld   [hl], b
    ld   [label_8F0], sp
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$00
    nop
    add  a, a
    nop
    rst  $18
    add  a, a
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
    nop
    rst  $38
    cp   a
    ld   l, b
    cp   a
    ld   b, b
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $30
    adc  a, h
    rst  $30
    ld   [label_3F7], sp
    nop
    rlca
    inc  bc
    rra
    rlca
    ccf
    rla
    ld   a, a
    dec  sp
    ld   a, a
    ccf
    ccf
    rra
    ccf
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
    ret  nz
    nop
    ld   [$FFC0], a
    rst  $30
    ld   [rIE], a
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    cp   a
    ld   l, b
    cp   a
    ld   b, b
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $30
    adc  a, h
    rst  $30
    ld   [label_3CF7], sp
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   a, [hl]
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
    nop
    rst  $38
    cp   a
    ld   l, b
    cp   a
    ld   b, b
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $30
    adc  a, h
    rst  $30
    ld   [$00F7], sp
    nop
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    ld   a, a
    ccf
    ld   a, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_D6300
    ld   bc, label_D63F7
    rst  $38
    ld   [hl], e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    cp   a
    ld   l, b
    cp   a
    ld   b, b
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $30
    adc  a, h
    rst  $30
    ld   [$00F7], sp
    nop
    ld   [rJOYP], a
    di
    ld   [rIE], a
    di
    rst  $38
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    cp   a
    ld   l, b
    cp   a
    ld   b, b
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $30
    adc  a, h
    rst  $30
    ld   [$00F7], sp
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    ld   [hl], a
    inc  bc
    rst  $38
    ld   [hl], a
    rst  $38
    ld   a, a
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
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ccf
    rra
    ld   a, a
    ccf
    rst  $38
    ccf
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    cp   a
    ld   l, b
    cp   a
    ld   b, b
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $30
    adc  a, h
    rst  $30
    ld   [$4CF7], sp
