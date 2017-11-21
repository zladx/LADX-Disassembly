section "bank41",romx,bank[$29]
    rst  $28
    inc  d
    and  a
    ld   e, d
    ld   bc, rSB
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
    adc  a, h
    ld   [hl], e
    sbc  a, h
    ld   h, e
    reti
    and  [hl]
    di
    ld   c, h
    ld   [rNR41], a
    rst  $38
    rra
    rst  $38
    ld   [$FF7F], sp
    and  b
    ld   h, b
    ret  nc
    jr   nc, label_3FD1
    ld   e, b
    sub  a, h
    ld   l, a
    ld   [bc], a
    ld   b, $FD
    rst  $38
    rst  $20
    add  hl, de
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    jr   nc, label_A403C

label_A403C::
    nop
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   [hl], b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
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
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    ld   e, a
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FFF8]
    rlca
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    nop
    nop
    stop
    stop
    ld   b, b
    nop
    ld   d, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   de, $A0EE
    ld   e, a
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_A410D::
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_5FE], sp
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
    cp   a
    ld   b, b
    ld   e, $E1
    ld   a, h
    add  a, e
    cp   c
    ld   b, [hl]
    di
    adc  a, h
    ret  nz
    ld   b, b
    rst  $28
    ccf
    xor  $11
    ld   b, b
    ret  nz
    and  d
    ld   h, b
    ld   d, b
    cp   a
    db   $E8 ; add  sp, d
    jr   label_A410D
    inc  l
    ld   [bc], a
    ld   b, $FF
    rst  $38
    adc  a, e

label_A413F::
    ld   [hl], h
    nop
    nop
    ld   b, $00
    nop
    rst  $38
    nop
    nop
    jr   nz, label_A414A

label_A414A::
    nop
    nop
    nop
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
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
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
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    ld   e, a
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]

label_A41BB::
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FFF8]
    rlca
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
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
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_CF3
    adc  a, a
    ld   [hl], b
    ld   a, $C1
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld  [$FF00+C], a
    sbc  a, l
    xor  $91
    db   $FC ; Undefined instruction
    ld   b, e
    nop
    ld   b, b
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFC]
    dec  bc
    adc  a, $35
    rla
    ld   [label_9F7], a
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    inc  a
    jp   label_6F9
    ld   [hl], e
    adc  a, h
    rst  0
    jr   c, label_A41BB
    add  a, b
    nop
    rst  $38
    rst  $38
    rst  $38
    add  a, [hl]
    nop
    add  a, [hl]
    nop
    add  a, [hl]
    nop
    add  a, b
    nop
    add  a, h
    nop
    add  a, [hl]
    nop
    add  a, [hl]
    nop
    add  a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, c
    cp   $83
    db   $FC ; Undefined instruction
    adc  a, a
    pop  af
    sbc  a, [hl]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    di
    rrca
    db   $FD ; Undefined instruction
    ld   a, [hl]
    sbc  a, a
    ld   [$FF7F], a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    adc  a, a
    ld   a, [$FFFF]
    ccf
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
    rst  $38
    ld   [bc], a
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $18
    ld   a, [$FF7F]
    ld   a, [$FF1F]
    ld    hl, sp+$07

label_A42B7::
    cp   $01
    rst  $38
    nop
    rst  $38
    jr   label_A42BD
    add  a, [hl]

label_A42BF::
    ld   a, a
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$87
    ld   a, b
    rst  0
    jr   c, label_A42B7
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
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

label_A42FF::
    nop
    ld   b, [hl]
    ret  nz
    and  b
    ld   h, b
    ret  nc
    ccf
    xor  b
    ld   e, b
    sub  a, h
    ld   l, h
    ld   [bc], a
    ld   b, $02
    cp   $FE
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
    nop
    nop
    nop

label_A4320::
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
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
    add  a, [hl]
    nop
    add  a, [hl]
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
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
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    ld   [bc], a
    rst  $38
    inc  b
    rst  $38

label_A436B::
    jr   label_A436B
    jr   nz, label_A436C
    ld   b, b
    db   $E3 ; Undefined instruction
    cp   a
    rst  $38
    ld    hl, sp+$F8
    ret  nz
    ld   a, [$FF00]
    and  b
    nop
    ld   d, b
    nop
    xor  b
    nop
    ld   a, a
    rrca
    rst  $38
    rst  $38
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A438B::
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    db   $EC ; Undefined instruction
    ld   a, [$FFFE]
    add  a, c
    ld    hl, sp+$7F
    rra
    rlca
    rlca
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop  bc
    ccf
    ld   a, b
    add  a, a
    inc  e
    db   $E3 ; Undefined instruction
    adc  a, [hl]
    pop  af
    jp   label_A617C
    ld   a, $70
    rra
    jr   c, label_A43CF
    jr   label_A43B9
    sbc  a, b
    rst  $30
    adc  a, b
    rst  $38
    ld   l, b
    rst  $38
    jr   z, label_A43C9
    sbc  a, b
    ld   a, a
    sub  a, h
    ld   a, a
    sub  a, h

label_A43CF::
    ld   a, a
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
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
    add  a, b

label_A4401::
    ld   a, a
    ld   [$FF1F], a
    ret  nz
    ccf
    ld   [$FF1F], a
    ret  nz
    ccf
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    ld   bc, label_187
    add  a, a
    ld   bc, $FFA0
    ld   a, [$FFDF]
    ld    hl, sp+$8F
    adc  a, h
    add  a, a
    add  a, [hl]
    add  a, e
    inc  bc
    ld   bc, $0003
    ld   hl, rNR41
    ld   b, b
    rst  $38
    ld   b, c
    cp   $46
    db   $FC ; Undefined instruction
    ld   c, b
    ld    hl, sp+$30
    ld   a, [$FF20]
    ld   [$FFA0], a
    ret  nz
    ld   b, b
    ld   a, [$FF70]
    ret  nz
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
    rrca
    rrca
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    inc  bc
    nop
    inc  bc
    nop
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
    rst  $38
    nop
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    ld   b, $00

label_A44A1::
    nop
    pop  bc
    ret  nz

label_A44A4::
    ld   a, [$FF30]
    db   $FC ; Undefined instruction
    inc  c
    di
    inc  bc
    di
    jr   nz, label_A44A5
    ld    hl, sp+$FC
    inc  h
    inc  a
    rlca
    ld   e, d
    rlca
    ld   l, $03
    ld   e, l
    inc  bc
    ld   l, [hl]
    ld   bc, $81BE
    sbc  a, $41
    ld   l, [hl]
    ld   hl, rNR14
    inc  d
    rst  $38
    inc  d
    rst  $38
    dec  d

label_A44C7::
    rst  $38
    sub  a, l
    cp   $96
    db   $FC ; Undefined instruction
    ld   e, b
    db   $FC ; Undefined instruction
    ld   h, b
    ld    hl, sp+$7F
    ret  nz
    ld   a, a
    ld   [rIE], a
    sub  a, b
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   label_A44EE
    jr   label_A44A1
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b

label_A44EE::
    ret  nz
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
    rst  $38
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
    nop
    nop
    inc  e
    nop
    nop
    rst  $38
    ld   [rJOYP], a
    rlca
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_A6000
    nop
    nop
    nop
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
    add  a, a
    ld   bc, label_187
    add  a, a
    ld   bc, label_187
    add  a, a
    ld   bc, label_187
    add  a, a
    ld   bc, label_187
    ld   sp, label_3110
    ld   de, label_1139
    db   $3A ; ldd  a, [hl]
    ld   a, [bc]
    ld   a, $0A
    ld   a, $06
    ld   a, $02
    ld   a, $02
    add  a, b
    add  a, b

label_A4562::
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_2121
    ld   b, c
    ld   b, c
    ld   b, c
    ld   b, c
    ret  nz
    ret  nz
    jr   nc, label_A45E3
    ld   b, b
    ld   h, b
    add  a, b
    ret  nz

label_A4576::
    add  a, b
    add  a, b
    nop
    add  a, b

label_A457A::
    nop
    nop
    inc  bc
    nop
    rrca
    inc  bc
    add  a, a
    ret  nz
    ld   l, a
    ld   h, b
    cpl
    jr   nc, label_A45B6
    db   $10 ; Undefined instruction
    nop
    rst  $38
    inc  bc
    cp   $FE
    add  a, b
    add  a, b
    ei
    inc  c
    rst  $38
    jr   label_A4594
    nop
    rst  $38
    db   $10 ; Undefined instruction
    jr   nc, label_A457A
    pop  de
    ccf
    ld   hl, label_A467E
    ld   [$FB37], a
    ld   d, e
    jp  c, label_CC48
    adc  a, b
    add  a, h
    add  a, h
    add  a, d
    ld   [bc], a
    pop  bc
    pop  hl
    jr   nc, label_A45E8
    ld   [hl], h
    inc  de
    inc  a
    dec  bc
    inc  e
    rlca

label_A45B6::
    ld   e, $03
    rrca
    inc  bc
    rrca
    ld   [bc], a
    add  a, e
    add  a, [hl]
    ld   h, e
    and  $41
    pop  hl
    ld   b, d
    jp   label_8685
    sbc  a, e
    adc  a, h

label_A45C8::
    scf
    jr   label_A460A
    db   $10 ; Undefined instruction
    jr   nz, label_A45C8
    ld   b, b
    rrca
    jr   label_A4562
    sbc  a, b
    adc  a, a
    jr   label_A4576
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nc, label_A45FE
    jr   nc, label_A45A1
    ld   b, b
    ret  nz

label_A45E3::
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b

label_A45E8::
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
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

label_A45FE::
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

label_A460A::
    ret  nz
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   [rJOYP], a
    rlca
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_A6000
    nop
    rst  $38
    rst  $38
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
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    sbc  a, a
    add  a, e
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    rst  8
    ret  nz
    rst  8
    ret  nz
    and  a
    ld   [$FF93], a
    ld   a, [$FF88]
    ld    hl, sp+$C0
    ld   b, b
    ret  nz
    ld   b, b
    pop  bc
    ld   b, b
    jp   label_E641
    inc  hl
    db   $E4 ; Undefined instruction
    daa
    or   $25
    cp   $39
    inc  c
    ld   b, $38
    ld   [label_38F0], sp
    ld   a, [$FFD0]
    ld   a, [$FF90]
    ret  nz
    and  b
    ld   [$FFA0], a

label_A467E::
    ld   [$FFA0], a
    ld   b, b
    ret  nz
    jr   nz, label_A46A4
    nop
    nop
    jr   nz, label_A46A8
    ld   h, b
    ld   h, b
    ld   b, b
    ld   h, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   h, b
    ld    hl, sp+$FC
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    ld   bc, $0103
    ld   bc, label_301
    ld   [label_808], sp
    inc  c

label_A46A4::
    inc  b
    inc  b
    inc  b
    inc  b

label_A46A8::
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, e
    ld   b, [hl]
    ld   b, e
    add  a, $47
    jp   nz, label_8287
    add  a, c
    add  a, e
    add  a, c
    add  a, e
    add  a, c
    add  a, e
    add  a, c
    add  a, e
    ld   a, [$F740]
    add  a, b
    db   $F4 ; Undefined instruction
    add  a, b
    ld   [rJOYP], a
    pop  bc
    nop
    jp   nz, label_8701
    ld   bc, label_30E
    ld   a, a
    jr   nz, label_A4712
    ld   h, b
    rst  $38
    ld   b, b
    ld   a, a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    ld   l, a
    sub  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    add  a, b
    ld   a, a

label_A4712::
    cp   a
    ld   a, a

label_A4714::
    cp   $41
    cp   $81
    cp   $01
    cp   $01
    cp   $01
    nop
    rst  $38
    ccf
    ret  nz
    rst  $38
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    cp   a
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
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
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a

label_A474D::
    nop
    add  a, a
    nop
    add  a, h
    db   $FC ; Undefined instruction
    add  a, e
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
    cpl
    jr   nc, label_A47A2
    jr   nz, label_A4714
    and  b
    db   $E3 ; Undefined instruction
    ld   h, b
    db   $E3 ; Undefined instruction
    jr   nz, label_A474D
    ld   hl, label_21E2
    di
    ld   [hl], c
    ret  nc
    or   b
    ret  z
    adc  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    add  a, b
    ret  nz
    add  a, d
    jp   nz, label_C2A2
    ld   a, [$FFC0]
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    jr   nz, label_A47A6
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    nop
    nop
    jr   label_A47BA

label_A47A2::
    nop
    nop
    nop
    nop

label_A47A6::
    nop
    nop
    nop
    nop
    ld   d, c
    ld   d, b
    ld   d, c
    ld   d, c
    ld   bc, $8301
    add  a, c
    add  a, e
    add  a, c
    add  a, e
    add  a, c
    add  a, c
    add  a, e
    add  a, e
    add  a, e

label_A47BA::
    add  a, e
    add  a, d
    add  a, e
    ld   [bc], a
    add  a, a
    ld   [bc], a
    inc  c
    rlca
    jr   c, label_A47D3
    or   b
    rra
    ld   a, [$FF6F]
    ld   a, [$FF8F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, b
    ret  nz
    ld   a, b

label_A47D3::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    ld   bc, $8786
    cp   $79
    cp   $01
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    cp   $01
    cp   $01
    cp   $01
    rst  $38

label_A482F::
    rst  $38
    ei
    jr   z, label_A482F
    jr   z, label_A4834
    jr   z, label_A4836
    ld    hl, sp+$7F
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    nop
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
    db   $D3 ; Undefined instruction
    sub  a, c
    adc  a, e
    adc  a, d
    adc  a, a
    adc  a, d
    adc  a, [hl]
    adc  a, d
    adc  a, [hl]
    add  a, h
    adc  a, $C4
    ld   b, h
    call nz, label_C464
    ld   d, b
    ld   [$FFB0], a
    ld   h, b
    ld   l, h
    jr   nc, label_A48B1
    inc  a
    scf
    ld   a, $7C
    ccf
    ld   sp, $A87F
    ld   a, a
    ccf
    ccf
    db   $10 ; Undefined instruction
    rra
    db   $10 ; Undefined instruction
    inc  c
    inc  bc
    inc  bc
    ret  nz
    nop
    ld   a, [$FFE0]
    rra
    rst  $38
    rst  $38
    rst  $38
    ld   [bc], a
    ld   [bc], a
    cp   $02
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FFF0]
    nop
    nop
    ld   [bc], a
    ld   bc, rIE
    inc  bc
    ld   bc, label_305
    inc  bc
    rlca
    dec  bc
    rlca
    rla
    rrca
    ld   l, e
    rra
    ld   a, [$FFFF]
    nop
    rst  $38
    add  a, e

label_A48B1::
    ld   b, $87
    inc  b
    rlca
    adc  a, h
    rla
    adc  a, h
    adc  a, a
    sbc  a, b
    rst  $28
    sbc  a, b
    rst  $18
    or   b
    rst  $38
    or   b
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, a
    ld   a, [$FFDF]
    ld   a, [$FFFF]
    rra
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    rst  $38
    rst  $38
    ld   a, [$FF0F]
    rst  $38
    rrca
    rst  $38
    ld    hl, sp+$7F
    add  a, b
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    ld   a, a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ccf
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    rst  $38
    rst  $38
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
    add  a, a
    nop
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
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    ld   h, h
    db   $E4 ; Undefined instruction
    or   b
    ret  nc
    res  1, e
    add  a, l
    add  a, l
    adc  a, h
    adc  a, h
    ld    hl, sp+$F8
    jr   label_A4986
    rrca
    rrca
    ld   d, h
    rst  $38
    sub  a, $FF
    db   $3A ; ldd  a, [hl]
    scf
    ld   a, $33
    ld   e, $13
    ld   e, $13
    sbc  a, d
    sub  a, a
    sbc  a, h
    sub  a, a
    rra
    db   $E8 ; add  sp, d
    dec  e
    db   $E8 ; add  sp, d
    inc  c
    db   $F4 ; Undefined instruction

label_A4986::
    rrca
    rst  $30
    add  hl, bc
    ld   sp, hl
    rlca
    cp   $07
    db   $FC ; Undefined instruction
    rlca
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    dec  bc
    call c, label_180B
    rla
    ld   [hl], b
    ld   a, a
    ret  c
    rst  8
    ld   [hl], b
    ccf
    cp   b
    sbc  a, a
    ld    hl, sp+$EF
    nop
    rst  $38
    inc  c
    di
    rlca
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    ld   bc, label_7FF
    cp   $07
    cp   $02
    rst  $38
    ld   e, a
    ld   a, [$FF7F]
    ld   a, [$FF7F]
    ret  nc
    rst  $38
    adc  a, b
    rst  $38
    ld   [label_4FF], sp
    rst  $38
    inc  b
    ld   a, a
    add  a, d
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    rst  $38
    ld   a, a
    cp   $81
    cp   $01
    cp   $01
    cp   $01
    nop
    rst  $38
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, rIE
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    ret  nz
    nop
    nop
    rst  $38
    jr   label_A4A0C

label_A4A0C::
    nop
    nop
    nop
    nop
    inc  c
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $000F
    nop
    nop
    nop
    nop
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
    adc  a, a
    ld   sp, hl
    ld   a, c
    ld   a, [$FF50]
    rst  $38
    ld   l, a
    cp   $21
    cp   $31
    rst  $38
    rra
    rst  $38
    nop
    inc  [hl]
    ccf
    db   $FC ; Undefined instruction
    rst  $28
    ld   a, b
    ld   c, a
    adc  a, h
    rst  $38
    rra
    rst  $38
    ld   a, l
    or   $FD
    and  [hl]
    cp   $27
    dec  b
    db   $FD ; Undefined instruction
    ld   b, e
    cp   [hl]
    ld   h, a
    sbc  a, h
    ld   e, $EF
    rlca
    ei
    db   $FC ; Undefined instruction
    cp   $04
    ld   b, $84
    ld   b, $D8
    rst  8
    ld   [hl], b
    ccf
    cp   b
    sbc  a, a
    rra
    ld    hl, sp+$F8
    rst  $30
    rrca
    rra
    ld   [label_818], sp
    jr   label_A4B04
    sbc  a, a
    ld   h, e
    sbc  a, a
    jp   nz, label_63F
    rst  $38
    inc  e
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $28
    inc  d
    rrca
    inc  l
    rra
    ccf
    jp   nz, label_C2BF
    ld   a, a
    db   $FD ; Undefined instruction
    ld   b, c
    pop  bc
    add  a, c
    add  a, b
    adc  a, b
    adc  a, b
    sbc  a, h
    sbc  a, h
    sub  a, b
    sub  a, b
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF8F]

label_A4ACA::
    ld   a, [$FF8F]
    ld   a, [$FF8F]
    ld   a, [$FF8F]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A4B04::
    nop
    nop
    nop
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
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
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

label_A4B4D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   sp, hl
    cpl
    ld    hl, sp+$2F
    ld   a, [$FF3F]
    ld   a, [$FF3F]
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   a, [$FF3F]
    db   $FC ; Undefined instruction
    cpl
    db   $FC ; Undefined instruction
    rst  $38
    rra
    db   $E3 ; Undefined instruction
    jr   c, label_A4B4D
    ld   h, b
    sbc  a, a
    ld   b, b
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    rst  $38
    db   $FC ; Undefined instruction
    di
    rlca
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    pop  bc
    ccf
    ld   b, c
    cp   a
    ld   bc, label_3FF
    rst  $38
    ld   b, $FF
    sub  a, c
    sub  a, c
    ld   e, c
    reti
    ld   a, a
    cp   $5F
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FFF0]
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FFDD]
    and  d
    di
    adc  a, h
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    ld   c, $F5
    ccf
    jp   nz, label_AF7
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   a, d
    add  a, l
    ld   h, b
    sbc  a, a
    rst  $18
    jr   nz, label_A4C2B

label_A4C2B::
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nz, label_A4CAD
    sub  a, a
    ld   a, e
    sub  a, h
    rst  $38
    ld   [label_800], sp
    ld   [rIE], sp
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    inc  hl
    rst  $38
    ld   hl, label_21FF
    ccf
    pop  hl
    ld   a, a
    rst  $38
    ld   a, h
    add  a, h
    ld   a, [hl]
    add  a, h
    ld   a, a
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    adc  a, a
    ld   bc, label_187
    ld   b, a
    add  a, c
    ccf
    pop  bc
    cp   $FE
    ld   bc, $C300
    nop
    rst  $38
    rst  $38
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    adc  a, h
    ei
    ld   [hl], e
    db   $FC ; Undefined instruction
    ld   d, b
    rst  $38
    ld   [hl], b
    cp   $F9
    adc  a, [hl]
    add  hl, bc
    ld   e, $0F
    ld   l, $19
    adc  a, $3F
    di
    pop  af
    rlca

label_A4CAD::
    ld   bc, label_1FF
    ld   e, a
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FF5F]
    ld   a, [$FFFF]
    rst  $38
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    rst  $38
    rst  $38
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    rst  $38
    rst  $38
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, rIE
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   c, $00
    nop
    rst  $38
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
    rst  $38
    inc  c
    nop
    nop
    nop
    ld   bc, $FE01
    rst  $38
    dec  b
    ld   b, $0B
    inc  c
    ld   d, l
    ld   a, [de]
    dec  l
    ld   a, [$FF00+C]
    ld   h, b
    cp   a
    rst  $38
    pop  hl
    sbc  a, [hl]
    nop
    rst  $38
    ld   sp, label_39CE
    add  a, $9B
    ld   h, l
    rst  8
    inc  sp
    rlca
    inc  b
    rst  $38
    ld    hl, sp+$FF
    db   $10 ; Undefined instruction
    ret  nz
    push hl
    ld   e, d
    add  a, b
    add  a, b
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
    sub  a, a
    ld   l, c
    rst  $18
    ldi  [hl], a
    inc  b
    ld   b, $FF
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sub  a, d
    ld   l, l
    rst  $18
    jr   nz, label_A4D65

label_A4D65::
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FE
    rst  $38
    ld   [bc], a
    rst  $38
    inc  h
    ei
    cpl
    ld   [hl], b
    ld   a, a
    cp   $E1
    rst  $38
    ret  nz
    ld   a, a
    add  a, b
    rst  $38
    nop
    sbc  a, a
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, $FFFE
    nop
    rst  $38
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $ED ; Undefined instruction
    inc  bc
    rst  $38
    ld   d, b
    rst  $18
    xor  h
    rst  $18
    and  a
    add  a, h
    and  a
    add  a, h
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   d, [hl]
    rst  $38
    rst  $38
    inc  bc
    db   $FD ; Undefined instruction
    rrca
    di
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF7F]
    add  a, b
    rst  $38
    nop
    cp   a
    nop
    sbc  a, a
    nop
    db   $ED ; Undefined instruction
    inc  de

label_A4DB2::
    push af
    adc  a, d
    ld   b, b
    ret  nz
    rst  $38
    ccf
    rst  $28
    jr   label_A4DB2
    inc  c
    rst  $28
    inc  b
    rst  8
    inc  b
    ret  z
    scf
    rst  $38
    add  a, b
    ret  nz
    ret  nz
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    rst  $38
    nop
    nop
    inc  b
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_201
    inc  bc
    ld   b, l
    ld   b, $0A
    db   $FD ; Undefined instruction
    rla
    jr   label_A4E44
    inc  [hl]
    ld   b, b
    ld   h, b
    cp   a
    rst  $38
    xor  e
    call nc, label_20DF
    ld   a, b
    add  a, a
    ld   a, $C1
    sbc  a, l
    ld   h, d
    rst  8
    ld   sp, label_203
    rst  $38
    db   $FC ; Undefined instruction
    ccf
    ret  z
    ld   a, a
    sub  a, b
    ld   a, a
    and  b
    rst  $38
    ld   b, b
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

label_A4E44::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ei

label_A4E63::
    ld   b, $F6
    rrca
    push hl
    rra
    ld  [$FF00+C], a
    rra
    pop  hl
    rra
    ld   a, [$FF0F]
    ld    hl, sp+$07
    add  a, b
    nop
    add  a, b
    nop
    pop  hl
    nop
    cp   a
    ret  nz
    ld   a, a
    rst  $38
    ret  nz
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   e, $03
    ld   a, a
    rlca
    cp   $1F
    db   $E4 ; Undefined instruction
    ld   a, a
    db   $FC ; Undefined instruction
    adc  a, a
    ld   a, [$FF3F]
    ld   [rIE], a
    inc  bc
    db   $FC ; Undefined instruction
    xor  e
    rst  $38
    ld   d, l
    rst  $38
    inc  bc
    rst  $38
    ld   bc, label_11FF
    rst  $28
    jr   c, label_A4E63
    cp   $01
    rst  $38
    nop
    ret  nz
    nop
    ld   [$FF80], a
    ld    hl, sp+$80
    rst  $38
    ld   h, b
    rst  $38
    sbc  a, a
    ld   a, b
    ret  nz
    ccf
    rst  $38
    add  a, b
    ld   a, a
    rrca
    inc  b
    dec  e
    ld   b, $34
    rrca
    xor  $1B
    ld   a, [label_34F7]
    rrca
    ld    hl, sp+$FF
    ld   bc, $FFFE
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, d
    inc  bc
    dec  b
    ld   b, $0B
    db   $FC ; Undefined instruction
    dec  d
    ld   a, [de]
    add  hl, hl
    ld   [hl], $40
    ld   h, b
    ld   b, b
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $28
    db   $10 ; Undefined instruction
    jp   label_A609F
    adc  a, $31
    db   $E3 ; Undefined instruction
    inc  e
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    ccf
    ret  nc
    ld   [hl], e
    xor  h
    db   $E8 ; add  sp, d
    ld   d, a
    rst  $28
    sub  a, b
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   b, a
    cp   c
    ld   [hl], a
    adc  a, e
    ccf
    jp   nz, label_200
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  8
    or   b
    pop  af
    ld   c, $7C
    add  a, e
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    ld   e, $E9
    sbc  a, $29
    rst  $38
    stop
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   e, [hl]
    and  c
    ld   b, $F9
    ei
    inc  b
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nz, label_A4FE5
    xor  a
    db   $FC ; Undefined instruction
    ld   b, e
    rst  $28
    ld   d, b
    ld   b, b
    ld   b, b
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    ld   a, [$FF0F]
    cp   e
    ld   b, l
    rst  8
    ld   sp, $0100
    ld   bc, rIE
    rst  $38
    add  a, b
    add  a, b
    add  a, [hl]
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    rst  $38
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_A4FA6

label_A4FA6::
    ld   [bc], a
    nop
    nop
    rst  $38
    nop
    nop
    nop
    nop
    jr   nz, label_A4FB0

label_A4FB0::
    pop  bc
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
    ld   b, $00
    nop
    nop
    add  a, b
    nop
    nop
    nop
    jr   nc, label_A4FC6

label_A4FC6::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    ld   [bc], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A4FE5::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [bc], a
    dec  b
    dec  b
    dec  b
    dec  b
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
    nop
    nop
    jr   nz, label_A503A
    ld   d, b
    ld   d, b
    jr   nz, label_A503E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A503A::
    nop
    nop
    nop
    nop

label_A503E::
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
    inc  c
    inc  c
    db   $10 ; Undefined instruction
    add  hl, hl
    jr   nz, label_A5067
    db   $10 ; Undefined instruction
    inc  bc
    ld   c, $0E
    ld    hl, sp+$F8
    cp   [hl]
    ld   b, $0F
    ld   bc, $0057
    cp   a
    ld   bc, label_63F
    ret  nz
    ret  nz
    inc  a
    inc  a
    rst  $38
    inc  de
    ccf

label_A5067::
    ld   [label_51E], sp
    rst  8
    call nz, label_A3A6
    sub  a, [hl]
    sub  a, e
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    jr   nz, label_A505A
    jr   nc, label_A506C
    ld   e, b
    ret  c
    sbc  a, h
    adc  a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A50C5::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A50F0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], b
    ld   [hl], b
    ld   c, b
    ld   c, b
    ld   c, b

label_A510B::
    ld   c, b
    jr   nc, label_A513E
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
    inc  c
    inc  c
    db   $10 ; Undefined instruction
    inc  h
    jr   nz, label_A510B
    ret  nz
    ld   bc, label_301
    ld   [bc], a
    dec  c
    ld   c, $EC
    ei
    inc  a
    rra
    jr   c, label_A512C

label_A512C::
    dec  sp
    nop
    jr   c, label_A5133
    add  a, b
    add  a, b
    ret  nz

label_A5133::
    ld   b, b
    ld   a, [$FF70]
    ret  c
    jr   c, label_A50C5
    ld   a, h
    db   $E4 ; Undefined instruction
    call c, label_3CA4

label_A513E::
    ret  c
    jr   label_A514F
    inc  c
    inc  bc
    inc  bc
    ld   bc, label_F01
    ld   c, $31
    jr   nc, label_A518E
    ld   b, c
    adc  a, a
    add  a, e
    rst  $38

label_A514F::
    cp   $FD
    ld   e, $EA
    ld   [label_A4ACA], a
    ret  z
    ld   c, b
    adc  a, e
    adc  a, b
    nop
    nop
    cp   $FE
    cp   $82
    db   $D3 ; Undefined instruction
    ld   d, c
    ld   [$F52A], a
    inc  d
    ld   [hl], a
    inc  de
    scf
    ld   [de], a
    ld   h, $26
    ld   c, a
    ld   b, a
    call label_C8C
    inc  c
    jp  c, label_99CE
    adc  a, a
    cp   e
    adc  a, l
    or   c
    cp   a
    ld   a, [$FF00+C]
    ld  [$FF00+C], a
    sbc  a, [hl]
    db   $E4 ; Undefined instruction
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

label_A518E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  bc
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  b
    inc  b
    dec  de
    jr   label_A521A
    rrca
    ld   bc, label_301
    ld   [bc], a
    reti
    nop
    rst  $38
    nop
    ld    hl, sp+$87
    db   $76 ; Halt
    dec  bc
    rst  $20
    dec  e

label_A521A::
    call z, label_CCB8
    jr   c, label_A5263
    inc  a
    rst  $18
    ccf
    inc  e
    call c, label_D454
    add  a, h
    sub  a, h
    add  a, h
    add  a, h
    or   b
    add  a, b
    adc  a, a
    rrca
    adc  a, a
    ld   [label_A44A4], sp
    db   $FC ; Undefined instruction
    call nz, label_A724E
    ld   a, h
    ld   h, d
    ld   l, h
    ld   [hl], d
    ld   a, $12
    db   $EC ; Undefined instruction
    call c, label_A50F0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    adc  a, a
    ld   a, h
    ld   a, h
    daa
    ld   h, $19
    rra
    inc  c
    dec  bc
    ld   e, $11
    inc  e
    inc  de
    jr   c, label_A5287
    dec  de
    ld   [label_1D77], sp
    rst  $30
    ccf
    call nc, label_3CEC
    call nz, label_CE72
    ld   a, [de]
    and  $32
    xor  $A8
    cp   b
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_A5287::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   [$FF7F], a

label_A52A4::
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
    ret  nz
    rst  $38
    ld   [$FF1F], a
    inc  de
    rst  8
    rst  8
    rst  8
    ld   c, h

label_A52BA::
    rst  $38
    jr   c, label_A52BC
    jr   nc, label_A52BE
    jr   nz, label_A52C0
    nop
    rst  $38
    nop
    ccf
    ret  nz
    rst  $18
    ld   [$FFEF], a
    jr   nc, label_A52CA
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    jr   nz, label_A52A4
    jr   nc, label_A52BA
    inc  e
    rst  8
    jr   nc, label_A52DA
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld    hl, sp+$18
    ld   [rNR41], a
    jp   label_FF43
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    add  a, h
    ld   a, h
    ld   [hl], h
    dec  c
    dec  c
    jp   label_4C2
    inc  b
    ld   b, $04
    rra
    ld   e, $23
    ld   hl, label_1E1A
    ld   b, $07
    ld   b, $04
    inc  bc
    inc  bc
    dec  de
    rlca
    ld   a, [$FF0F]
    ret  nz
    ccf
    add  a, e
    cp   a
    ld   a, h
    ld   a, h
    nop
    nop
    ld   [hl], c
    nop
    cp   $FF
    add  a, a
    add  a, a
    ld   b, b
    add  a, b
    ld   h, c
    pop  bc
    rst  $38
    cp   $7F
    jr   c, label_A534A
    ld   [hl], b
    ld   a, a
    ld   [$FFF5], a
    add  a, b
    rst  $20
    rst  $20
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
    cp   a
    ld   b, c
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

label_A534A::
    rst  $38
    nop
    rst  $28
    db   $10 ; Undefined instruction
    ld   h, d
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
    rst  $28
    db   $10 ; Undefined instruction
    sub  a, h
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
    rrca
    ld   a, [$FF10]
    rst  $28
    ccf
    rst  $18
    ld   [hl], b
    rst  $38
    ld   h, b
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    adc  a, a

label_A5392::
    ld   [hl], b
    ld   [hl], b
    inc  sp
    inc  sp
    add  a, a
    add  a, [hl]
    rst  8
    ld   c, h
    rst  $38
    jr   c, label_A539C
    db   $10 ; Undefined instruction
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b

label_A53A4::
    cp   a
    ld   [rIE], a
    ld   [hl], b
    rst  $38
    jr   label_A53AA
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   e, $FF
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
    nop
    rst  $20
    jr   label_A5392
    jr   nc, label_A53A4
    and  b
    rst  $38
    ld   [rIE], a
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
    rst  $38
    ld   [$FFF9], a
    ld   [hl], $E6
    add  hl, de
    rst  $28
    db   $10 ; Undefined instruction
    nop
    sbc  a, a
    sbc  a, h
    cp   a
    ld   [rIE], a
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
    di
    ldd  [hl], a
    ei
    ld   a, [de]
    rst  $38
    ld   b, $FF
    ld   b, $FF
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor  a
    ld   de, label_37F
    rst  $38
    rlca
    di
    ld   a, $CF
    ld   a, h
    cp   a
    ld   a, [$FF7F]
    ret  nz
    db   $FD ; Undefined instruction
    add  a, b
    cp   a
    rst  $38
    ld   a, [$FFFF]
    ld   [$FFDF], a
    ld   a, [$FF0F]
    ld   d, a
    xor  a
    db   $F4 ; Undefined instruction
    inc  e
    xor  l
    ld   e, h
    ret  z
    jr   c, label_A5460
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   c, $03
    daa
    ld   bc, label_15F
    cp   a
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
    add  a, b
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    ld   [$A9FF], sp
    rst  $38
    and  c
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
    ld   a, a
    rst  $38
    pop  bc
    add  a, b
    add  a, b
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
    jr   nz, label_A54BB
    and  $FF
    rst  $38
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
    add  a, l
    rst  $38
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
    ld   [bc], a
    rst  $38
    ld   a, [hli]
    rst  $38
    jr   z, label_A54DD
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   [$FF1F], a
    inc  e
    inc  bc
    ld   b, $21
    ccf
    rst  $38
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    scf
    ret  nz
    ld   sp, label_FC2
    ret  nc
    ld   d, a
    adc  a, c
    ccf
    rst  $18
    ld   a, a
    ld   h, b
    rst  $38
    pop  bc
    cp   b
    ld   e, b
    ld   c, c
    cp   b
    sub  a, [hl]
    ld   l, h
    ld   a, $DE
    db   $E3 ; Undefined instruction
    rst  $38
    ld   d, c
    xor  a
    db   $E8 ; add  sp, d
    rla
    ld   a, [$FF0F]
    ld   a, a
    nop
    rst  $20
    jr   label_A55A8
    inc  a
    jp   label_C33C
    inc  a
    pop  hl
    sbc  a, $61
    sbc  a, $71
    adc  a, $F0
    rst  $38
    push af
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    rst  $38
    cp   $FF
    ld   a, h
    cp   $01
    nop
    nop
    inc  c
    inc  c
    ld   a, [bc]
    ld   a, [bc]
    ld   c, d
    ld   c, d
    xor  d
    xor  d
    xor  d
    xor  d
    xor  d
    xor  d
    ld   e, d
    ld   e, d
    cp   $FE
    ld   b, $FC
    rlca
    db   $FC ; Undefined instruction
    ld   b, $FC
    ld   b, $FC
    rlca
    cp   $03
    cp   $91
    rst  $38
    dec  d
    nop
    xor  e
    nop
    cpl
    nop
    ld   e, a
    nop

label_A55A8::
    ld   e, $01
    jr   c, label_A55B3
    or   b
    rrca
    ld   a, [$FF8F]
    jr   nc, label_A55D1
    ei

label_A55B3::
    rrca
    rst  $38
    rlca
    rst  $38
    rlca
    ld   a, a
    add  a, e
    ccf
    jp   label_E31F
    rra
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   h, b

label_A55D1::
    rst  $38
    or   b
    cp   a
    cp   b
    cp   a
    ld    hl, sp+$FF
    jr   c, label_A55D9
    nop
    rst  $38
    nop
    rst  $38
    rlca
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
    inc  c
    inc  c
    inc  c
    inc  c
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   [de], a
    ld   [de], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_7FF
    ld   a, [$F308]
    db   $10 ; Undefined instruction
    inc  hl
    ld   [$FF27], a
    ret  nc
    scf
    db   $FC ; Undefined instruction
    rra
    ld   [hl], b
    cp   a
    ld    hl, sp+$DF
    ei
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    ld   a, h
    ld   a, [hl]
    add  a, c
    ld   [hl], b
    rst  $28
    ld    hl, sp+$E7
    ld    hl, sp+$E7
    di
    rst  8
    di
    adc  a, a
    jp   label_33F
    rst  $38
    rrca
    rst  $38
    ld   a, h
    add  a, e
    nop
    rst  $38
    nop
    rst  $38
    add  a, [hl]
    rst  $38
    adc  a, $FF
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   e, d
    ld   e, d
    ld   d, d
    ld   d, d
    ld   b, d
    ld   b, d
    ld   b, b
    ld   b, c
    ld   b, h
    ld   b, c
    sub  a, h
    add  a, b
    sub  a, h
    add  a, b
    sub  a, h
    add  a, b
    ld   [de], a
    rst  $38
    ld   [de], a
    rst  $38
    ld   a, c
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rra
    cp   $0F
    cp   $0F
    ld   a, $CF
    ld   a, [$FFCF]
    ld   [hl], b
    rst  8
    ld   [hl], b
    rst  $28
    ld   a, [$FFEF]
    ld   [hl], b
    rst  $28
    ld   [hl], b
    rst  $28
    jr   nc, label_A56AD
    jr   nc, label_A56AF
    rra
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    ccf
    rst  0
    ccf
    rst  0
    ccf
    rst  8
    ld   a, $CF
    ld   a, $CF
    ccf
    rst  0
    pop  hl
    rst  $38
    ld   [$F2FF], a
    rst  $38
    ld   a, [$FFEF]
    rst  $28
    ld   a, b
    rst  $28
    ld   a, a
    rst  $20
    ld   a, a
    ld   [$FF7F], a
    db   $FC ; Undefined instruction
    rst  $38
    call c, label_D8FF
    rst  $38
    ret  c
    rst  $38
    ret  c
    db   $FD ; Undefined instruction
    jp   nz, label_C7F8

label_A56DE::
    ld   a, [$FF0F]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   h, e
    ld   h, e
    add  a, [hl]
    add  a, [hl]
    nop
    nop
    or   e
    nop
    rst  $28
    db   $10 ; Undefined instruction
    dec  a
    inc  e
    inc  e
    ld   h, a
    ld   h, a
    add  a, b
    add  a, b
    jp   label_CC03
    inc  c
    rst  0
    rlca
    jr   nc, label_A56DE
    ld   e, $E0
    ld   [label_1408], sp
    inc  d
    rst  8
    rr   c
    add  hl, de
    jr   nz, label_A574A
    ld   c, a
    ld   b, b
    sbc  a, $C1
    adc  a, b
    add  a, a
    jr   nz, label_A5752
    ld   d, b
    ld   d, b
    ld   d, [hl]
    ld   d, [hl]
    sbc  a, d
    sbc  a, d
    ld   sp, $8431
    nop
    ld   a, b
    add  a, h
    inc  bc
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    inc  e
    inc  e
    push hl
    push hl
    ld   b, $06

label_A574A::
    jr   nz, label_A574C

label_A574C::
    ld   a, b
    nop
    adc  a, e
    ld   [hl], b
    add  a, b
    add  a, b

label_A5752::
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    rst  $38
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    ld   c, $0E
    ld   [hl], e
    ld   [hl], e
    pop  bc
    pop  bc
    sbc  a, c
    add  a, c
    xor  d
    sub  a, d
    adc  a, d
    or   d
    ld   c, c
    ld   sp, label_30CF
    inc  bc
    inc  bc
    dec  b
    dec  b
    ld   b, $04
    ld   [bc], a
    ld   [bc], a
    inc  b
    inc  b
    jr   label_A5794
    pop  hl
    ld   [rIF], a
    nop
    dec  d
    nop
    ld   e, a
    nop
    ld   e, a
    nop
    ld   a, a
    nop
    db   $EB ; Undefined instruction
    inc  d
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    inc  a
    rst  $18
    inc  a
    rst  $18

label_A5794::
    ld   a, a
    sbc  a, a
    ld   a, a
    adc  a, a
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF00]
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_A57A1
    ld   [hl], e
    rst  $28
    di
    rst  8
    di
    adc  a, a
    db   $E3 ; Undefined instruction
    rra
    inc  bc
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    rra
    rst  $20
    rra
    ld   [$FF8F], a
    ld   a, [$FF83]
    db   $FC ; Undefined instruction
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld   a, [$FFFF]
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ret  nz
    ccf
    inc  bc
    rst  $38

label_A57CA::
    rrca
    rst  $38

label_A57CC::
    ccf
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    ccf
    nop
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    sbc  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    nop
    rst  $38
    adc  a, a
    ld    hl, sp+$D8
    jr   nz, label_A57CA
    jr   nz, label_A57CC
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    jp   label_A6464
    ccf
    ccf
    ld   de, label_E11
    rrca
    inc  bc
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
    nop
    ld   bc, label_301
    ld   [bc], a
    rlca
    inc  b
    rrca
    ld   [label_101B], sp
    dec  [hl]
    jr   nz, label_A5894
    ld   b, b
    rst  $28
    sub  a, b
    rst  $10
    nop
    rst  8
    ld   bc, label_36F
    ld   a, a
    ld   b, $FB
    inc  c

label_A582A::
    rst  $30
    jr   label_A582A

label_A582D::
    jr   nc, label_A582D
    ld   h, b
    db   $FC ; Undefined instruction
    ld   h, b
    rst  $30
    add  a, c
    rst  $20
    inc  bc
    rst  $28
    inc  bc
    cp   a
    rlca
    ld   a, a
    ld   c, $7F
    inc  e
    rst  $38
    jr   c, label_A5840
    rst  $38
    ld   e, a
    rst  $30
    ccf
    jp  c, label_A42BF
    ld   a, [$FF0F]
    ld   [$FF1F], a
    db   $F4 ; Undefined instruction
    dec  bc
    ld   d, b
    cpl
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    reti
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $FF
    add  a, b
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
    rst  $38
    ret  nz
    ccf
    jr   nc, label_A5894
    ld   [label_407], sp
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $00FF
    rst  $38
    nop

label_A5894::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    ld   a, [$FF10]
    ld   [rNR41], a
    rst  $38
    rrca
    ld   a, [$FF70]
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
    ld   [rNR41], a
    ld   [rNR41], a
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

label_A58F0::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    nop
    nop
    inc  bc

label_A5901::
    ld   bc, label_607
    rrca
    inc  c
    ld   e, $18
    ccf
    jr   nz, label_A5984
    ld   b, d
    ld   l, e
    ld   d, b
    cp   a
    ret  nz
    rst  0
    jr   label_A5901
    ld   bc, label_59B
    cp   a
    ld   [bc], a
    ld   l, [hl]
    ld   e, $EA
    jr   label_A58F0
    jr   nz, label_A5926
    ld   [$FFD3], a
    ld   h, b
    or   a
    ret  nz
    rst  $18
    add  a, c

label_A5926::
    sbc  a, a
    inc  bc
    ld   a, a
    ld   b, $FF
    inc  b
    cp   $18
    db   $FC ; Undefined instruction
    jr   label_A592D
    ld   a, b
    ld    hl, sp+$A0
    ld   a, [$FF00+C]
    db   $E3 ; Undefined instruction
    nop
    db   $D3 ; Undefined instruction
    nop
    rla
    nop
    ld   l, a
    ld   bc, label_7DF
    ld    hl, sp+$87
    db   $E8 ; add  sp, d
    rla
    ld   a, [$FF0F]
    ld   e, [hl]
    or   l
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ret  nz
    cp   a
    jr   nz, label_A5951
    jr   nz, label_A5953
    ld   h, a
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    adc  a, b
    rst  $38
    add  a, b
    rst  $38
    add  hl, hl
    rst  $38
    cp   $FF
    cp   $FF
    rst  $38
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
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    ld   a, [$FF10]
    ld   a, [$FF10]
    rst  $38
    rrca
    ld   a, [$FF70]

label_A5984::
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
    ld   [$FF1F], a
    jr   label_A599C
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    ld   a, [$FF30]
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    jr   c, label_A59C2
    inc  b
    inc  bc
    inc  bc
    ld   bc, $E001
    jr   nz, label_A5983
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
    add  a, b
    add  a, b
    rst  $38
    ret  nz
    ccf
    jr   nz, label_A59F4
    db   $10 ; Undefined instruction
    ld   [label_80F], sp
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop

label_A59F4::
    nop
    nop
    nop
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
    add  a, b
    cp   $81
    db   $FC ; Undefined instruction
    add  a, e
    cp   $8C
    ld    hl, sp+$D0
    ld   [hl], a
    ld   [hl], b
    ld   a, e
    ld   h, b
    ld   d, a
    ld   b, b
    rra
    ret  nz
    cpl
    add  a, c
    sbc  a, a
    inc  bc
    cp   a
    ld   c, $FF
    inc  e
    rst  $38
    jr   nc, label_A5A1C
    ld   d, b
    db   $FD ; Undefined instruction
    ld   h, b
    ei
    ld   [$FFF6], a
    add  a, b
    push hl
    nop
    rst  $20
    nop
    and  a
    nop
    xor  a
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ld   c, $3F
    ld   c, $FF
    inc  e
    rst  $38
    jr   nc, label_A5A36
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   d, b
    xor  a
    ret  nc
    cpl
    ld   [$FF1F], a
    ret  nc
    cpl
    ld   a, [$FF0F]
    ld   c, b
    scf
    db   $E4 ; Undefined instruction
    dec  de
    ret  c
    daa
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    db   $10 ; Undefined instruction
    ldi  [hl], a
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
    ld   bc, label_704
    dec  bc
    inc  c
    rra
    db   $10 ; Undefined instruction
    jr   nz, label_A5B0B
    ld   b, c
    xor  $91
    ld   a, a
    ld   a, a
    db   $10 ; Undefined instruction
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$9805]
    ld   h, a
    adc  a, b
    ld   [hl], a
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_28FF], sp
    rst  $38
    cp   $FF
    ld   [label_1408], sp
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    ret
    pop  bc
    inc  e
    nop
    rst  $30
    ld   [label_1CE3], sp
    nop
    rst  $38
    ld   [label_1408], sp
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    ret
    pop  bc
    inc  e
    nop
    rst  $30
    ld   [label_1CE3], sp
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
    rst  $38
    add  a, b
    rst  $38
    add  a, c
    rst  $38
    add  a, e
    rst  $38
    adc  a, d
    rst  $38
    call z, label_A787F
    ld   a, a
    ld   l, b
    ld   a, a
    ld   b, b
    db   $FD ; Undefined instruction
    ret  nz
    rst  $30
    add  a, b
    and  a
    nop
    xor  a
    ld   bc, label_19F
    ld   a, a
    rlca
    rst  $38
    inc  c
    cp   $1A
    rst  $38
    ld   [label_30FF], sp
    rst  $38
    ld   [rIE], a
    ret  nz
    ld   sp, hl
    ret  nz
    or   $08
    cp   $00
    rst  $28
    nop
    ld   a, [$EB00]
    nop
    and  a
    nop
    cp   a
    nop
    sbc  a, $01
    db   $FD ; Undefined instruction
    inc  bc
    ei
    rlca
    rst  $38
    ld   c, $C0
    ccf
    adc  a, h
    ld   [hl], e
    rrca
    rst  $38
    ld   a, a
    rst  $38
    ld    hl, sp+$F7
    ret  nc
    xor  a
    ret  nz
    ccf
    ld   a, [$FF0F]
    ld   b, d
    rst  $38
    ld   h, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    ld   l, d
    rst  $38
    xor  l

label_A5B63::
    rst  $38
    rst  $38
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    inc  b
    rst  $38
    nop
    rst  $38
    ld   b, $FF
    ld   bc, label_301
    ld   [bc], a
    rlca
    inc  b
    dec  bc
    inc  c
    rra
    db   $10 ; Undefined instruction
    ldd  [hl], a
    ld   l, e
    ld   d, b
    ld   a, a
    ret  nz
    add  a, $19
    sbc  a, $01
    cp   e
    inc  b
    cp   l
    inc  bc
    jp   hl
    rla
    rst  $20
    ld   e, $DF
    inc  l
    ld   c, l
    cp   b
    ld   b, $FF
    jr   nc, label_A5B63
    ld   a, d
    push bc
    ld   a, [$FF0F]
    ld   a, [$FF0F]

label_A5B9A::
    db   $FC ; Undefined instruction
    inc  bc
    ld   c, b
    rlca
    ld   a, a
    cpl
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

label_A5BAA::
    nop
    rst  $38
    ld   d, h
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    jr   nz, label_A5BB3
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    xor  [hl]
    rst  $38
    nop
    nop
    add  a, b
    add  a, b
    add  a, e
    add  a, e
    call z, label_33CC
    jr   nc, label_A5B9A
    nop
    ld   a, b
    add  a, a
    nop
    rst  $38
    nop
    nop
    add  a, b
    add  a, b
    add  a, e
    add  a, e
    ld   c, h
    ld   c, h
    inc  sp
    jr   nc, label_A5BAA
    nop
    ld   a, b
    add  a, a
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
    ld   a, a
    ld   h, b
    rst  $38
    add  a, b
    jp   label_CF8D
    add  a, a
    rst  $38
    rst  8
    rst  $30
    call z, label_A7C67
    ld   [hl], a
    ld   a, b
    ccf
    ret  c
    cp   $E0
    rst  $38
    ret  nz
    db   $FD ; Undefined instruction

label_A5C17::
    adc  a, b
    push af
    inc  d
    rst  $28
    ld   [$00BF], sp
    xor  a
    nop
    rst  0
    nop
    rst  $28
    nop
    ld   a, a
    nop
    ld   a, [hl]
    add  a, c
    cp   a
    ld   b, e
    di
    ld   e, $FF
    inc  a
    rst  $38
    ld   [$FFDF], a
    scf
    cp   c
    ld   l, c
    ld   sp, hl
    ld   c, c
    cp   $C7
    cp   $01
    db   $F4 ; Undefined instruction
    nop
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rrca
    ld   a, b
    add  a, a
    ld   h, b
    sbc  a, a
    jr   nc, label_A5C17
    ld   l, h
    sub  a, e
    ret  nc
    cpl
    ld   [$FF1F], a
    ret  nc
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_A5C57
    nop
    rst  $38
    inc  d
    rst  $38
    ld   d, d
    rst  $38
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
    ld   [$8AFF], sp
    rst  $38
    xor  d
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
    ld   [$A9FF], sp
    rst  $38
    and  c
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
    dec  d
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
    jr   nz, label_A5C9B
    ld   h, $FF
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
    add  a, l
    rst  $38
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
    ld   [bc], a
    rst  $38
    ld   a, [hli]
    rst  $38
    jr   z, label_A5CBD
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
    rst  $28
    ret  nc
    ld   a, [$F180]
    add  a, b
    rst  $20
    add  a, b
    rst  $28
    add  a, b
    ei
    add  a, l
    ei
    add  a, a
    ld   a, a
    rst  8
    rlc  l
    rst  $38
    rlca
    rst  $38
    ld   c, $BF
    ld   e, h
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [$FFFE], a
    add  a, b
    rst  $38
    nop
    ld   sp, hl
    add  a, [hl]
    db   $FC ; Undefined instruction
    ld   [bc], a
    rst  $28
    nop
    add  a, a
    nop
    ld   [hl], a
    nop
    ld   a, e
    dec  b
    rst  $18
    inc  hl
    ld   c, [hl]
    or   a
    xor  a
    ld   de, label_37F
    rst  $38
    rlca
    di
    ld   a, $CF
    ld   a, h
    cp   a
    ld   a, [$FF7F]
    ret  nz
    db   $FD ; Undefined instruction
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    jp   nz, label_30FD
    rst  8
    cp   b
    ld   b, a
    ld   a, b
    add  a, a
    ld   a, b
    add  a, a
    db   $E4 ; Undefined instruction
    dec  de
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_A5D59
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
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
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_A5D79
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
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
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_A5D99
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
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
    db   $10 ; Undefined instruction
    ld   h, b
    rst  $38
    or   b
    rst  $38
    cp   b
    rst  $38
    ld    hl, sp+$FF
    jr   c, label_A5DB9
    nop
    rst  $38
    jr   nz, label_A5DBD
    jr   nc, label_A5DBF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, h
    ld   a, a
    ld   [hl], b
    ld   a, a
    ld   [hl], b
    ld   a, a
    ld   b, b
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$F781]
    adc  a, b
    db   $E3 ; Undefined instruction
    nop
    ret  nc
    inc  bc
    ld   a, a
    nop
    ld   h, $19
    ld   sp, hl
    rlca
    ld   sp, hl
    rrca
    ld   [hl], a
    cp   [hl]
    cp   $F8
    ld   a, e
    sbc  a, a
    db   $EC ; Undefined instruction
    ld   a, $1C
    ld   a, [$FF00+C]
    db   $E3 ; Undefined instruction
    push hl
    ret  nz
    db   $EC ; Undefined instruction
    nop
    sbc  a, [hl]
    nop
    ld   [hl], e
    dec  c
    ld   a, a
    add  a, b
    scf
    ret  nz
    ld   sp, label_FC2
    ret  nc
    ld   d, a
    adc  a, c
    ccf
    rst  $18
    ld   [hl], d
    ld   l, l
    jp   label_A4FC
    ld   e, e
    db   $E4 ; Undefined instruction
    dec  de
    or   b
    ld   c, a
    db   $76 ; Halt
    xor  a
    ld   [$FFDF], a
    nop
    rst  $38
    nop
    rst  $38
    sub  a, d
    ld   l, l
    ld   b, b
    rst  $38
    ld   d, b
    rst  $38
    rst  $38
    cp   a
    rst  $38
    rst  $38
    sbc  a, a
    ld   a, a
    jr   label_A5E5B
    nop
    rst  $38
    nop
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   c, [hl]
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    ld   d, b
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    ld   e, a
    rst  $38
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   c, [hl]
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    ld   d, b
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    ld   e, a
    rst  $38
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   c, [hl]
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_A5EB1
    ld   a, b
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    adc  a, $FF
    ld   b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A5EE4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    push bc

label_A5F02::
    rst  $38
    ld   [hl], d
    rst  $28
    ld   l, h
    cp   $F4
    ld   sp, hl
    ld   [$FF7B], a
    ret  nz
    ld   a, c
    add  a, $1D
    ld  [$FF00+C], a
    rst  $38
    ret  nz
    rst  $18
    rrca
    sbc  a, e
    dec  bc
    dec  sp

label_A5F17::
    dec  bc
    rst  $38
    rlca
    ld   e, a
    and  [hl]
    ccf
    ld    hl, sp+$FF
    ret  nz
    rst  $18
    daa
    jp  c, label_F92D
    ld   [hl], $FD
    ld  [$FF00+C], a
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $28
    db   $10 ; Undefined instruction
    ld   d, h
    rst  $20
    jr   label_A5F02
    jr   nc, label_A5EE4
    ld   d, b
    daa
    ret  c
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    ret  c
    daa
    ld    hl, sp+$07
    ld   a, [$FF0F]
    call nc, label_A782B
    add  a, a
    db   $E8 ; add  sp, d
    rla
    db   $F4 ; Undefined instruction
    dec  bc
    jr   c, label_A5F17
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A6000::
    ld   [bc], a
    nop
    jr   nz, label_A6004

label_A6004::
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$FC00], sp
    ld   [bc], a
    and  b
    nop
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [label_1D00], sp
    ld   [bc], a
    jr   nz, label_A6024

label_A6024::
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$FA00], sp
    nop
    jr   nz, label_A6034

label_A6034::
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [label_1D00], sp
    ld   [bc], a
    daa
    nop
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$FD00], sp
    ld   [bc], a
    rst  $18
    jr   nz, label_A605B
    ld   bc, $0009
    add  a, b
    nop
    nop

label_A605B::
    nop
    ldi  [hl], a
    nop
    ld   [$FD00], sp
    ld   [bc], a
    rst  $18

label_A6063::
    jr   nz, label_A6063
    ld   bc, label_8F4
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$FD00], sp
    ld   [bc], a
    rst  $18
    jr   nz, label_A6066
    nop
    ld   [$8000], sp
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$FD00], sp
    ld   [bc], a
    rst  $18
    jr   nz, label_A6093
    ld   bc, $000F
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$F200], sp
    nop
    ret  nz

label_A6093::
    jr   nz, label_A6096
    nop

label_A6096::
    ld   [$8000], sp
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$C000], sp
    nop
    and  b
    nop
    ld   b, b
    nop
    nop
    nop
    or   b
    nop
    db   $FC ; Undefined instruction
    nop
    cp   a
    ld   b, b
    ccf
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
    ldi  [hl], a
    nop
    adc  a, a
    nop
    ld   bc, $0000

label_A60C3::
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   e, $01
    inc  a
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    sbc  a, a
    ld   [$FF8F], a
    ld   a, [$FF87]
    ld    hl, sp+$87
    ld    hl, sp+$83
    db   $FC ; Undefined instruction
    rra
    nop
    rrca
    nop
    rra
    nop
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ld   [$FF1F], a
    ret  nz
    ccf
    jp   label_C3FC
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    pop  hl
    cp   $E1
    cp   $E1
    cp   $FF
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ret  nz
    ccf
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    ld   [$00FF], sp
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    and  b
    rst  $38
    jr   nz, label_A6135
    jr   nz, label_A6137
    jr   nz, label_A6139
    or   b
    rst  $38
    ld   [hl], b
    rst  $38
    jr   label_A613F
    ld   a, [$FF0F]
    ld   [hl], b
    adc  a, a
    ld   [hl], b
    adc  a, a
    ld   a, b
    add  a, a
    ld   a, [hl]
    add  a, c
    ld   e, $E1
    ld   a, $C1
    inc  e
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_2FF
    rst  $38
    rlca
    rst  $38
    ld   e, $FF
    inc  e
    rst  $38
    jr   label_A6161
    inc  c
    rst  $38
    inc  b
    rst  $38
    ld   b, $FF
    jp   label_C33F
    ccf
    di
    rrca
    ld   sp, hl
    rlca
    db   $10 ; Undefined instruction
    nop
    rst  $38

label_A6174::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    adc  a, e
    rst  $38

label_A617C::
    rst  $38
    rst  $38
    adc  a, a
    rst  $38
    jr   label_A6181
    jr   c, label_A6183
    jr   nc, label_A6185
    ld   h, e
    db   $FC ; Undefined instruction
    jp   label_8FFC
    ld   a, [$FF9D]
    ld   [$FF38], a
    ret  nz
    ld   a, c
    rlca
    ld   sp, label_310F
    rrca
    jr   nc, label_A61A7
    ld   [hl], b
    rrca
    ld   a, [$FF0F]
    ld    hl, sp+$07
    ld    hl, sp+$07
    rlca

label_A61A1::
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    add  a, d

label_A61A7::
    rst  $38
    jp   nz, label_A42FF
    rst  $38
    ld   b, e
    rst  $38
    ld   h, d
    rst  $38
    inc  a
    ret  nz
    jr   c, label_A6174
    ld   h, b
    add  a, b
    ld   [hl], c
    add  a, b
    db   $E3 ; Undefined instruction
    nop
    rst  $20
    nop
    ld   [hl], a
    add  a, b
    ccf
    ret  nz
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ret  nz
    ccf
    ret  nz
    ccf
    nop
    rst  $38
    ld   [hl], a
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, d
    rst  $38
    ld   b, e
    rst  $38
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    ld   h, b
    rst  $38
    ld   a, a
    add  a, b
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    rra
    ld   [$FF8F], a
    ld   a, [$FF83]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    dec  b

label_A61FB::
    cp   $1E
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    ld   a, [$FFE0]
    rst  $38
    pop  af
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    ld   b, c
    add  a, b
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$C100], sp
    cp   $C0
    rst  $38
    pop  hl
    cp   $E0
    rst  $38
    jr   c, label_A6219
    inc  l
    rra
    scf
    rrca
    ld   a, [bc]
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    nop
    and  b
    nop
    ld   b, b
    nop
    nop
    nop
    or   b
    nop
    db   $FC ; Undefined instruction
    nop
    cp   a
    ld   b, b
    ld   a, a
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_701
    ld   b, $1E
    jr   label_A61FB
    jr   nc, label_A6252
    nop

label_A6252::
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    add  a, c
    sbc  a, $47
    ei
    ld   c, h
    rst  $30
    ld   e, b
    ret  nz
    nop
    and  b
    nop
    ld   b, b
    nop
    ld   a, h
    ld   a, h
    db   $E4 ; Undefined instruction
    add  a, h
    db   $E4 ; Undefined instruction
    inc  c
    db   $DB
    inc  c
    rst  8
    jr   label_A6271

label_A6271::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    jp  c, label_C798
    adc  a, h
    ld   bc, $0000
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  b
    inc  b
    add  hl, bc
    ld   [label_1833], sp
    rst  $30
    db   $10 ; Undefined instruction
    nop
    and  b
    nop
    ld   b, c
    ld   bc, $CDCD
    inc  sp
    ldd  [hl], a
    db   $DB
    ld   [de], a
    rst  $28
    inc  c
    db   $FC ; Undefined instruction
    ld   l, e
    ld   [hl], b
    ld   [hl], b
    adc  a, b

label_A62A3::
    adc  a, b
    inc  b

label_A62A5::
    inc  b
    adc  a, h
    adc  a, h
    sbc  a, $5E
    reti
    ld   e, c
    ld   e, l
    reti
    sbc  a, a

label_A62AF::
    sub  a, $01
    nop
    nop
    nop
    nop
    nop

label_A62B6::
    nop
    nop
    inc  bc
    nop
    ld   e, $01
    cp   h
    add  a, e
    ld   a, h
    ld   b, e
    db   $FC ; Undefined instruction
    inc  bc

label_A62C2::
    ld   sp, hl
    rlca
    ld   a, [$FF00+C]
    push af
    ld   c, $EA
    inc  e
    db   $F4 ; Undefined instruction
    jr   label_A62A5
    jr   nc, label_A62AF
    jr   nc, label_A62D0
    ld   [$FF7F], a
    and  b
    rst  $38
    jr   nz, label_A6356
    ld   de, label_113F
    ld   [hl], $1B
    dec  [hl]
    ld   e, $37
    inc  e
    ld   d, b
    ld   h, b
    or   c
    ret  nz
    pop  hl
    add  a, b
    ld   h, c
    add  a, b
    pop  bc
    nop
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   a, a
    ret  nc
    ld   a, a
    ld   [$FF7F], a
    ret  nz
    ld   a, a
    ret  nz
    ld   e, a
    ld   [$FF5F], a
    ld   [$FFDF], a
    ld   h, b
    cp   a
    ld   h, b
    sub  a, a
    jr   label_A62C2
    db   $10 ; Undefined instruction
    jr   nc, label_A62B6
    jr   nc, label_A6338
    ld   sp, label_3967
    daa
    ld   a, c
    ld   b, d
    ld   a, a
    db   $E3 ; Undefined instruction
    add  a, [hl]
    db   $E3 ; Undefined instruction
    add  a, e
    pop  af
    add  a, c
    pop  af
    add  a, c
    ld   [hl], b
    add  a, b
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    rst  $10
    or   b
    ld   d, e
    ld   [hl], b
    ld   e, b
    ld   a, b
    ld   a, [hl]
    ld   [hl], $7D
    ld   sp, label_117D
    ld   a, [$FD0A]
    inc  c
    sbc  a, b
    sbc  a, a
    db   $97
    sub  a, a
    rst  $20
    ld   a, a
    inc  sp
    rrca

label_A6338::
    db   $D3 ; Undefined instruction
    adc  a, $F3
    cp   $2F
    rra
    di
    rrca
    rst  $18
    sub  a, b
    pop  de
    sbc  a, [hl]
    inc  de
    sbc  a, l
    or   [hl]
    ld   e, $1F
    db   $3A ; ldd  a, [hl]
    ld   h, e
    dec  a
    pop  bc
    ld   a, [hl]
    adc  a, a
    ld   a, [$FF7C]
    ld   b, e
    ld    hl, sp+$7F
    call nz, label_A7A87
    ld   b, e
    ld   a, c
    ld   b, c
    db   $FD ; Undefined instruction
    add  a, c
    ld   sp, hl
    ld   bc, label_3C2
    ld   [bc], a
    nop
    jr   nz, label_A6364

label_A6364::
    ld   bc, label_800
    nop
    add  a, b
    nop
    ld   bc, label_2201
    inc  bc
    inc  c
    ld   b, $02
    nop
    jr   nz, label_A6374

label_A6374::
    rlca
    rlca
    add  hl, bc
    inc  c
    sub  a, b
    jr   label_A638B
    db   $10 ; Undefined instruction
    jr   nc, label_A63A0
    jr   nz, label_A63A0
    rra
    ld   sp, $A030
    and  b
    ld   [rLCDC], a
    ret  nz
    ld   b, b
    ret  nz

label_A638B::
    ld   b, c
    ret  nz
    pop  bc
    pop  bc
    jp   label_2
    and  b
    add  a, b
    pop  bc
    ld   b, b
    ld   l, b
    jr   nz, label_A63C9
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_808], sp

label_A63A0::
    ld   [bc], a
    nop
    ld   hl, label_201
    ld   [bc], a
    ld   a, [bc]
    ld   [bc], a
    add  a, d
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ldi  [hl], a
    ld   [bc], a
    ld   a, [bc]
    ld   [bc], a
    ld   [bc], a
    nop

label_A63B2::
    and  b
    add  a, b
    ld   h, c
    ld   h, b
    jr   label_A63C8
    ld   [label_408], sp
    inc  b
    ld   [bc], a
    ld   [bc], a
    pop  hl
    ld   h, c
    ld   [label_280C], sp
    add  hl, bc
    ld   de, label_231B
    ld   [hl], $A7

label_A63C9::
    inc  [hl]
    daa
    inc  l
    ld   c, e
    ld   l, h
    ld   c, [hl]
    ld   c, c
    ld   hl, label_2321
    ld   hl, label_3623
    rra
    ld   e, $8F
    ld   [label_80F], sp
    dec  hl
    dec  c
    rrca
    rrca
    db   $E3 ; Undefined instruction
    jp   label_A67F3
    cp   $3F
    ld   a, [$FF4F]
    xor  $9F

label_A63EA::
    pop  de
    or   c

label_A63EC::
    db   $E3 ; Undefined instruction
    ld   hl, label_A438B
    add  a, [hl]
    inc  b
    jp   nz, label_E102
    add  a, c
    ld   [hl], b
    ret  nz
    jr   label_A63EA
    jr   label_A63EC
    ld    hl, sp+$10
    ld   a, [$FFE0]
    ld   [bc], a
    ld   [bc], a
    ldi  [hl], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    set  0, d
    inc  hl
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    add  hl, bc
    dec  bc
    sub  a, b
    ld   a, [$FFF0]
    sbc  a, b
    db   $E8 ; add  sp, d
    jr   label_A63FF
    jr   label_A63B2
    add  hl, bc
    dec  de
    ld   a, [bc]
    dec  de
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    call z, label_CBCB
    rst  $18
    rst  $18
    rst  $18
    or   e
    or   e
    and  c
    and  c
    and  b
    and  b
    rst  8
    ld   e, a
    rst  $30
    ld   a, b
    inc  bc
    ld   bc, $0020
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop

label_A643E::
    ld   [$C500], sp
    add  a, $28
    ld   [label_1010], sp
    db   $10 ; Undefined instruction
    sub  a, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   label_A645E
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_A6458

label_A6458::
    ccf
    inc  c
    ld   a, a
    rra
    rst  $38
    jr   nz, label_A643E
    ret  nc
    dec  bc
    add  hl, bc
    dec  e
    dec  d

label_A6464::
    dec  [hl]
    dec  l
    ld   [hl], d
    cpl
    ld  [$FF00+C], a
    rst  $18
    pop  af
    rrca
    ret  nz
    ccf
    pop  hl
    rra
    adc  a, a
    inc  b
    rrca
    add  a, l
    rrca
    adc  a, c
    sbc  a, a
    sub  a, e
    cp   [hl]
    rst  $20
    rst  $30
    adc  a, $EF
    sbc  a, [hl]
    db   $DB
    ld   a, $D0
    ld   [$FF80], a
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rla
    jr   label_A64BE
    inc  c
    dec  b
    ld   b, $0A
    inc  bc
    add  a, c
    ld   bc, $0000
    ldi  [hl], a
    nop
    ld   [$F300], sp
    ld   c, $87
    ld   a, h
    adc  a, $39
    ld   [hl], a
    sbc  a, b
    xor  a
    ld   a, [$FF7E]
    ld   h, c
    ld   d, b
    ld   l, a
    ld   a, h
    ld   b, e
    sub  a, e
    ld   a, d
    xor  d
    ld   [hl], e

label_A64B4::
    inc  sp
    pop  hl
    ld   b, e
    pop  hl
    ld   h, c
    ret  nz
    add  a, h
    call nz, label_86C6

label_A64BE::
    add  a, e
    add  a, a
    nop
    nop
    nop
    nop
    add  a, b
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nc
    ld   h, b
    ld   [hl], a
    jr   c, label_A650E
    rrca
    ld   [bc], a
    nop
    jr   nz, label_A64D4

label_A64D4::
    ld   bc, label_901
    ld   bc, label_181
    ld   bc, label_2301
    ld   bc, $0109
    cp   b
    rst  0
    db   $FC ; Undefined instruction
    add  a, e
    ld   h, b
    sbc  a, a
    ld    hl, sp+$07
    ld   [$FF1F], a
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   a, h
    add  a, e
    add  a, d
    add  a, e
    add  a, e
    add  a, d
    add  a, b
    add  a, d
    ret  nz
    add  a, b
    add  a, b
    ret  nz
    ld   h, b
    ret  nz
    ld   d, b
    ld   [$FFE8], a
    ld   a, [$FFC0]
    ld   [$FFBF], a
    rst  $38
    cp   $AA
    adc  a, b
    xor  d
    add  a, b
    adc  a, b
    nop
    add  a, b
    nop
    nop

label_A650E::
    nop
    nop
    ld   a, [$FF8F]
    db   $FD ; Undefined instruction
    add  a, e
    cp   $83
    cp   a
    jp   nz, label_C4BC
    ld   a, c
    ld   c, b
    ld   [hl], e
    ld   d, b
    add  hl, hl
    jr   nz, label_A64B4
    db   $FC ; Undefined instruction
    call z, label_333F
    rrca
    inc  [hl]
    dec  bc
    ld   a, a
    add  a, b
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$0000], sp
    ld   [rJOYP], a
    ld   e, $E2
    ld  [$FF00+C], a
    cp   $1E
    cp   $E4
    ld   e, $DE
    inc  h
    db   $F4 ; Undefined instruction
    inc  c
    rlca
    nop
    cpl
    nop
    ld   e, $01
    ccf
    nop
    cp   a
    nop
    rra
    nop
    nop
    ld   [bc], a
    ld   [$FD00], sp
    ld   [bc], a
    rst  $18

label_A6553::
    jr   nz, label_A6553

label_A6555::
    ld   bc, label_8F7
    ccf
    add  a, b
    rrca
    nop
    ld   hl, label_902
    nop
    db   $FC ; Undefined instruction
    inc  b
    sbc  a, $24
    db   $F4 ; Undefined instruction
    ld   c, $FA
    ld   b, $7D
    add  a, e
    cp   $01
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$00FF], sp
    rst  $38
    nop

label_A6574::
    cp   $01
    db   $FC ; Undefined instruction
    rrca
    db   $F4 ; Undefined instruction
    rra
    db   $EC ; Undefined instruction
    scf
    ret  c
    ld   l, a
    cp   b
    rst  8
    ld   a, [$FF20]
    and  b
    ld   h, b
    ld   b, b
    ld   [$FF60], a
    ret  nz
    ld   b, c
    ret  nz
    add  a, c
    ret  nz
    add  a, e
    ret  nz
    jp   label_A7780
    inc  e
    ld   a, a
    jr   label_A6574
    jr   c, label_A6555
    ld   [hl], b
    ld   a, [hl]
    ld   [$FFFC], a
    add  a, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    jr   nz, label_A65E2
    jr   nc, label_A65CC
    jr   label_A65C6
    ld   [label_407], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, e
    ld   a, [hl]
    ld   b, e
    ld   a, [hl]
    ld   l, a
    ld   a, h

label_A65C6::
    ld   [hl], a
    ld   a, b
    ld   a, a
    nop
    ld   a, a
    nop

label_A65CC::
    ld   a, [hl]
    nop
    ld   a, h
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
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
    ld    hl, sp+$08

label_A65E2::
    rst  $38
    rlca
    ld   a, [$F202]
    ld   [bc], a
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld  [$FF00+C], a
    ld   b, $7C
    rrca
    rra
    nop
    rst  0
    ret  nz
    ld   a, [$FFF0]
    cp   a
    rst  $38
    cp   a
    rst  $38
    ld   sp, hl
    cp   $E1
    cp   $72
    ld   [$FF98], a
    ld   a, b
    rst  $28
    rrca
    inc  c
    dec  bc
    db   $FC ; Undefined instruction
    di
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    inc  e
    rra
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    ld   [$00FF], sp
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    and  c
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   hl, $B1FF
    rst  $38
    ld   [hl], c
    rst  $38
    jr   label_A662F
    ret  c
    adc  a, a
    add  hl, de
    adc  a, a
    add  hl, de
    adc  a, a
    add  a, l
    rrca
    add  a, l
    rrca
    dec  c
    add  a, a
    rlca
    add  a, e
    jp   label_8383
    add  a, b
    rlca
    add  a, b
    add  a, a
    nop
    adc  a, [hl]
    nop
    adc  a, h
    nop
    adc  a, b
    nop
    adc  a, b
    nop
    nop
    add  a, b
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    jr   c, label_A665A

label_A665A::
    ld   h, b
    nop
    jp   label_CF00
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0103
    ld   c, $02
    inc  a
    inc  c
    ld   a, b
    ld   h, b
    ld   d, b
    ld   d, b
    ret  nc
    ld   d, b
    ret  z
    adc  a, b
    adc  a, b
    adc  a, b
    ld   [label_808], sp
    ld   [label_808], sp
    ld   bc, $0100
    nop
    ld   bc, label_300
    nop
    rlca
    nop
    rlca
    nop
    rra
    nop
    ccf
    nop
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    inc  b
    ld   a, [$F606]
    ld   [bc], a
    or   $02
    or   $02
    or   $02
    ld  [$FF00+C], a
    ld   b, $E0
    rst  $38
    and  b
    rst  $38
    and  b
    rst  $38
    and  b
    rst  $38
    ld   [$FF7F], a
    ld   a, [$FF7F]
    ld   a, [$FF7F]
    ret  c
    ld   a, a
    jr   label_A66C1
    inc  c
    rst  $38
    inc  b
    rst  $38
    rlca
    rst  $38
    jp   label_C33F
    ld   a, $F3
    ld   c, $FB
    ld   b, $C3
    add  a, c
    and  c
    ret  nz
    ld   [hl], b
    ret  nz
    ld   e, h
    ld   [$FF2F], a
    ld   a, [$FF97]
    ld    hl, sp+$7D
    ld   a, [hl]
    rra
    rra
    ld   bc, $8180
    add  a, b
    pop  bc
    add  a, b
    pop  bc
    add  a, b
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    nop
    rst  $38
    nop
    cp   $00
    ld    hl, sp+$00
    ld  [$FF00+C], a
    nop
    pop  hl
    nop
    ld   sp, hl
    db   $10 ; Undefined instruction
    jr   nz, label_A6700
    nop
    rst  $38
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    ld   a, [$FF30]
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    ld   bc, label_F00
    nop
    ei
    rlca
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    jr   label_A672A
    inc  de

label_A6723::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ccf
    and  c
    ld   a, a

label_A672A::
    ld   b, a
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    ld   a, a
    inc  b
    rst  $38
    inc  b
    ei
    inc  e
    db   $E8 ; add  sp, d
    ld   a, [$FFB0]
    ret  nz
    rst  $38
    ld   h, b
    rst  $18

label_A673D::
    ccf
    ccf
    db   $10 ; Undefined instruction
    ld   b, $86
    inc  b
    ld   c, $04
    inc  d
    inc  c
    db   $EC ; Undefined instruction
    jr   label_A6723
    jr   nc, label_A673D
    ld   [$FFE1], a
    nop
    ret  c
    ld   a, a
    call z, label_C47F
    ld   a, a
    add  a, $7F
    ld   b, e
    rst  $38
    ld   b, e
    rst  $38
    di
    adc  a, a
    ld   sp, hl
    add  a, a
    ld   a, d

label_A6761::
    rlca
    ld   sp, label_310F
    rrca
    jr   nc, label_A6777
    ld   [hl], b
    rrca
    ld   a, [$FF0F]
    ld    hl, sp+$07
    ld    hl, sp+$07
    add  a, c
    nop
    pop  bc
    nop
    db   $E3 ; Undefined instruction
    add  a, b
    cp   a

label_A6777::
    ret  nz
    xor  $F1
    ld   e, c
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   h, a
    cp   $FF
    nop
    rst  $38
    nop
    ld   sp, hl
    nop
    pop  af
    nop
    di
    add  a, b
    ld   h, e
    add  a, b
    jp   label_E320
    jr   nz, label_A6761
    ld   h, b
    ld   [rLCDC], a
    and  b
    ret  nz
    and  b
    ret  nz
    ld   [$FF80], a
    ld   a, [$FF80]
    ret  nc
    add  a, b
    sbc  a, h
    call nz, label_A40C0
    ld   b, b
    ld   b, b
    ld   h, b
    jr   nz, label_A6807
    jr   nz, label_A67C9
    jr   nz, label_A67DB
    db   $10 ; Undefined instruction
    ld   [label_3133], sp
    nop
    nop
    ld   bc, label_300
    ld   bc, label_203
    ld   b, $02
    ld   b, $02
    ld   b, $04
    ld   b, $04
    rst  $38
    ld   l, b
    rst  $38
    ld    hl, sp+$BF
    inc  e
    dec  bc
    ld   a, [bc]
    ld   bc, $0101
    ld   bc, label_A7878
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    add  a, c
    nop
    ld   [bc], a
    ld   bc, $0103
    rrca
    ld   bc, label_3FD
    ei

label_A67DB::
    add  a, [hl]
    push af
    adc  a, [hl]
    ld   a, a
    ld    hl, sp+$F9
    add  a, a
    or   c
    adc  a, a
    ld   sp, label_300F
    rrca
    ld   [hl], b
    rrca
    ld   a, [$FF0F]
    ei
    rlca
    rst  $38
    inc  c
    rlca
    rst  $38
    inc  bc

label_A67F3::
    rst  $38
    inc  bc
    rst  $38
    add  a, d
    rst  $38
    jp   nz, label_A42FF
    rst  $38
    jp   label_F2FF
    ccf
    ld   [hl], l
    cp   $6D
    cp   $67
    db   $FC ; Undefined instruction
    ld   b, a

label_A6807::
    db   $FC ; Undefined instruction
    ld   b, a
    db   $FC ; Undefined instruction
    ld   b, a
    db   $FC ; Undefined instruction
    ld   b, [hl]
    db   $FC ; Undefined instruction
    ld   h, [hl]
    db   $FC ; Undefined instruction
    and  e
    ld   h, b
    jp   label_E160
    ld   b, b
    pop  hl
    ld   b, b
    ld   h, b
    ld   b, b
    ld   h, b
    ld   b, b
    ld   [hl], b
    ld   b, b
    ld   d, b
    ld   h, b
    adc  a, a
    jp   label_A61C7
    pop  bc
    ld   [hl], b
    pop  af
    jr   c, label_A6828
    rrca
    cp   $02
    ld   a, [hl]
    ld   [bc], a
    rra
    inc  bc
    rst  0
    jp   label_C1E
    sub  a, b
    sbc  a, b
    ld   a, [$FF50]
    or   c
    and  c
    inc  hl
    inc  hl
    rlca
    rlca
    cp   $FE
    sub  a, $E6
    ld   a, h
    jr   c, label_A6845

label_A6845::
    nop
    ld   a, b
    ld   a, b
    cp   $FE
    add  a, e
    add  a, e
    nop
    nop
    nop
    nop
    dec  h
    dec  h
    add  hl, sp
    add  hl, sp
    ld   bc, $0101

label_A6857::
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    call nz, label_80C4
    add  a, b
    nop
    nop
    rrca

label_A6867::
    nop
    rra

label_A6869::
    nop
    inc  e
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    ld   h, b
    ccf
    ld   h, b
    ccf

label_A6875::
    jr   nz, label_A6896
    jr   nc, label_A6898
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    dec  e
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nc, label_A6875
    jr   nz, label_A6867
    jr   nz, label_A6869

label_A6889::
    jr   nz, label_A682B
    ld   h, b
    ld   h, b
    ld   [$FFD0], a
    sub  a, b
    cpl
    rra
    ld   d, $0F
    ld   c, $07

label_A6896::
    rlca
    inc  bc

label_A6898::
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    ld   c, $03
    and  $FC
    or   $FC
    db   $FC ; Undefined instruction
    cp   $C2
    cp   $43
    add  a, d
    ld   [bc], a
    inc  bc
    inc  hl
    ld   bc, $0109
    jr   c, label_A6912
    ld   l, b
    jr   nc, label_A68D1
    jr   nc, label_A68ED
    jr   label_A68D4

label_A68B9::
    inc  c
    dec  c
    ld   b, $87
    inc  bc
    ld   b, $81
    inc  c
    ld   c, $10
    jr   label_A68E5
    jr   nc, label_A6927
    jr   nz, label_A6889
    ld   h, b
    ld   [rLCDC], a
    ld   b, b
    ret  nz
    ret  nz
    ret  nz
    ld   b, $0E
    ld   bc, $0003
    ld   bc, $0000
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
    ld   a, h
    nop
    ld   [$FF80], a
    add  a, b
    add  a, b
    ld   b, b
    ret  nz
    ret  nz
    ld   b, b
    ret  nz

label_A68ED::
    ld   b, b
    ret  nz
    ld   b, b
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
    ld   c, $0C
    jr   c, label_A692E
    ld   h, b
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    ld   a, b
    call z, label_184
    nop
    ld   bc, label_200
    ld   bc, label_1E17

label_A6912::
    inc  a
    jr   label_A6945
    db   $10 ; Undefined instruction
    jr   nc, label_A68B9
    ld   h, b
    ld   [$FFE0], a
    sub  a, [hl]
    sbc  a, [hl]
    rst  8
    adc  a, c
    ld   [$0008], sp
    nop
    rlca
    ld   bc, label_60F
    rra
    ld   [label_103F], sp
    rst  $38
    inc  a

label_A692E::
    rst  $38
    jp   nz, label_70C
    ld   a, c
    rra
    cp   $FF
    push bc
    ld   a, $CC

label_A6939::
    ld   l, $CA
    ld   l, $CA
    ld   l, $8A
    ld   c, a
    pop  bc
    cp   $C0
    rst  $38
    pop  hl

label_A6945::
    ld   a, $10
    rra
    ld   [label_C0F], sp
    rlca
    inc  bc
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    nop
    jr   nz, label_A6954

label_A6954::
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    inc  hl
    ld   bc, label_1F1E
    jp   label_A6780
    ld   b, b
    scf
    inc  h
    dec  de
    ld   a, [de]
    add  a, c
    ld   bc, $0101
    cp   $FE
    rst  $38
    ld   bc, label_A61A1
    pop  hl
    ld   sp, label_18F0
    ld    hl, sp+$0C
    cp   $06
    cp   $C2
    ld   a, [hl]
    ld   [hl], d
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, c
    nop
    ld  [$FF00+C], a
    add  a, c
    rst  $38
    db   $E3 ; Undefined instruction
    dec  a
    ld   a, $06
    rra
    rlca
    dec  c
    rlca
    inc  b
    ld   b, b
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    ld   a, a
    add  a, b
    add  a, b
    rst  $38
    ld   a, a
    ld   a, a
    pop  bc
    ld   b, c
    rst  0
    add  a, [hl]
    adc  a, a
    adc  a, b
    rra
    ld   [label_1C2F], sp
    rra
    ld   a, [$FF00+C]
    pop  af
    db   $DB
    ret  nc
    rst  $28
    pop  af
    dec  e
    rra
    jp   label_F803
    nop
    cp   $00
    rst  $38
    rrca
    or   b
    ld   [hl], b
    ld   [$FFE0], a
    rst  $20
    inc  b
    rst  $20
    inc  b
    rst  $38
    ld    hl, sp+$0F
    ld   [label_101F], sp
    rra
    db   $10 ; Undefined instruction
    and  b
    ld   l, a
    ld   a, a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FE
    rst  $38
    inc  b
    db   $FC ; Undefined instruction
    ld   [$AF09], sp
    ret
    rst  $18
    db   $E4 ; Undefined instruction
    daa
    db   $E4 ; Undefined instruction
    daa
    cp   $FF
    ld   a, [hl]
    add  a, e
    ld   b, $03
    ld   [bc], a
    inc  bc
    ld   b, $04
    inc  b
    add  a, h
    add  a, l
    call nz, label_C2C6
    ld   b, d
    jp   nz, label_C262
    ld   b, e
    pop  hl
    ld   b, c
    pop  hl
    ld   bc, label_E01
    rrca
    jr   nc, label_A6A3E
    ld   b, b
    ld   h, b
    add  a, b
    pop  bc
    inc  bc
    add  a, a
    ld   c, $1F
    dec  a
    ld   a, [hl]
    ld   [$FFF0], a
    nop
    nop
    nop
    nop
    rra
    ccf
    ld   [rIE], a
    cp   a
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    ld   [$FFF0], a
    ld   a, [hl]
    rst  $38
    add  a, a
    ld   a, a
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    and  $79
    ld   sp, hl
    ld   e, $3D
    rlca
    ld   c, $03
    rlca
    ld   bc, $C08F
    jp   label_20E0
    ld   a, [$FFC3]
    jp   nz, label_A62A3
    add  hl, de
    ld   sp, hl
    add  a, [hl]
    ld   a, [hl]
    ld   l, e
    sub  a, a
    and  c
    rst  $18
    rst  $10
    ld   l, b
    and  h
    ld   a, e
    rrca
    ld   [label_487], sp
    adc  a, a

label_A6A55::
    adc  a, a
    ld   e, a
    reti
    ld   d, a
    ld   d, h
    rst  $10
    call nc, label_D251
    ld   sp, $B3F1
    jr   nz, label_A6A53
    jr   nz, label_A6A55
    ld   b, b
    ld   [$FFC0], a
    ld    hl, sp+$38
    rst  $38
    rlca
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [$FF60], a
    ld   [$FFE0], a
    and  b
    ld   [$FFA0], a
    ld   [$FFB0], a
    ld   [$FFD0], a
    ld   a, [$FF78]
    ld   [hl], b
    db   $EC ; Undefined instruction
    cp   b
    jr   c, label_A6ABA
    rla
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_80F], sp
    rrca
    inc  b
    rrca
    inc  b
    rlca
    inc  b
    ld    hl, sp+$D0
    jr   c, label_A6AB4
    ret  c
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_4F7], sp
    di
    ld   [bc], a
    di
    inc  bc
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $001F
    ld   a, a
    rra
    pop  hl
    ld   a, a
    add  a, c
    rst  $38
    ld   bc, label_A71FF
    pop  hl
    inc  hl
    pop  af

label_A6AB4::
    sub  a, l
    ei

label_A6AB6::
    adc  a, e
    rst  $38
    adc  a, $7E

label_A6ABA::
    ld   a, [$FFF0]
    ldi  [hl], a
    nop
    ld   [label_A6B00], sp
    db   $FC ; Undefined instruction
    rst  $28
    sbc  a, b
    rst  $10
    jr   c, label_A6AB6
    jr   nc, label_A6A88
    ld   h, b
    rst  $38
    ld   h, b
    ld   e, a
    ld   [$FF7F], a
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
    ld    hl, sp+$07
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$FF0F]
    rst  $38
    nop
    ld    hl, sp+$07
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    db   $10 ; Undefined instruction
    add  hl, bc
    db   $FC ; Undefined instruction
    inc  b
    cp   $02
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   b, b
    rst  $38
    ld   h, b
    rst  $18

label_A6B00::
    jp   nc, label_F33D
    inc  e
    ld   l, c
    ld   e, $38
    rrca
    dec  b
    ld   c, $3C
    add  a, a
    add  a, h
    add  a, a
    sbc  a, d
    rst  0
    sub  a, b
    ld   [hl], b
    ld   e, h
    cp   b
    ld    hl, sp+$18
    ld   l, l
    sbc  a, b
    cp   $0C
    rla
    db   $EC ; Undefined instruction
    ld   [hl], a
    adc  a, h
    ld   [hl], a
    adc  a, h
    ld   [$FFC0], a
    add  hl, sp
    add  hl, sp
    rrca
    rrca
    nop
    nop
    and  b
    nop
    ret  nc
    nop
    jp   hl
    ld   bc, label_1F1
    or   $BC
    cp   $1E
    ei
    sbc  a, a
    ld   l, l
    ld   l, a
    ld   h, a
    ld   h, a
    and  [hl]
    and  e
    ld   h, $23
    ccf
    inc  hl
    rlca
    inc  b
    rlca
    ld   b, $07
    ld   [bc], a
    add  a, e
    ld   [bc], a
    inc  bc
    add  a, c
    add  a, c
    add  a, c
    pop  bc
    add  a, c
    add  a, c
    jp   label_1F9
    ld   sp, hl
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    ret  nz
    nop
    ret  nz
    nop
    add  a, b
    nop
    add  a, c
    ld   bc, $F10F
    rst  $18
    pop  hl
    db   $FD ; Undefined instruction
    ld   h, e
    ld   e, $1E
    inc  c
    inc  c
    jr   label_A6B84
    ld   [hl], d
    ld   [hl], b
    ret  z
    ret  nz
    rst  $38
    ret  nz
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
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop

label_A6B84::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$FF0F]
    add  a, e
    ld   a, a
    cp   $01
    db   $EC ; Undefined instruction
    inc  de
    call z, label_9C33
    ld   [hl], e
    inc  a
    di
    ld   l, l
    di
    ld   sp, hl
    rst  $20
    ld   e, d
    and  $60
    rst  $18
    ld   [hl], b
    rst  8
    ld    hl, sp+$C7
    cp   h
    db   $E3 ; Undefined instruction
    cp   h
    and  e
    ld   e, $91
    ld   e, $11
    ld   a, $79
    ld   b, [hl]
    jp   label_C34E
    ld   b, [hl]
    db   $E3 ; Undefined instruction
    dec  l
    db   $E3 ; Undefined instruction
    ld   hl, label_27E3
    pop  af
    ld   d, e
    pop  af
    ld   e, [hl]
    rst  $30
    rla
    db   $EC ; Undefined instruction
    ld   [hl], a
    adc  a, h
    rla
    rst  $28
    inc  h
    sbc  a, $18
    db   $FC ; Undefined instruction
    ld   h, b
    ld   a, [$FF81]
    ret  nz
    ld   bc, $F900
    nop
    ld   sp, hl
    nop
    ld   [hl], c
    add  a, b
    pop  af
    add  a, b
    pop  af
    add  a, b
    pop  af
    add  a, b
    ld    hl, sp+$80
    ld    hl, sp+$C0
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
    ld   bc, $D303
    and  $FF
    db   $FC ; Undefined instruction
    ld   e, $00
    dec  a
    ld   bc, label_E3E
    ld   a, b
    ld   a, b
    ld  [$FF00+C], a
    ret  nz
    adc  a, b
    add  a, b
    rlca
    rlca
    inc  e
    inc  e
    pop  hl
    ld   [$FF88], a
    add  a, b
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [$FE00], sp
    add  a, c
    cp   h
    jp   label_C7BB
    cp   $47
    ld   [hl], l
    ld   c, a
    ld   e, a
    ld   l, l
    dec  hl
    add  hl, sp
    rla
    ld   de, rNR32
    ld   [$FFFD], a
    ld   bc, $81E1
    ld   bc, label_181
    add  a, b
    nop
    add  a, b
    nop
    add  a, c
    nop
    ld   [hl], d
    rst  8
    and  a
    rst  $18
    ld   e, a
    cp   a
    ei
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    ld   a, [$FFC0]
    ld   [$FF80], a
    ret  nz
    ret  nz
    add  a, b
    cp   $FD
    rst  $20
    db   $E4 ; Undefined instruction
    di
    ld   a, [$FF00+C]
    dec  sp
    dec  d
    dec  c
    ld   a, [bc]
    ld   b, $1D
    inc  bc
    rrca
    ld   bc, $FE4C
    ld   c, b
    ld    hl, sp+$48
    ld    hl, sp+$A9
    reti
    adc  a, $BF
    db   $ED ; Undefined instruction
    sub  a, [hl]
    rst  $20
    sbc  a, h
    or   a
    jp   z, label_1
    nop
    ld   bc, label_A7D70
    cp   l
    pop  bc
    ld   a, c
    add  a, e
    add  a, e
    rlca
    ld   [hl], $0F
    rst  $38
    ld   a, a
    ld    hl, sp+$C0
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    ld    hl, sp+$4F
    rst  $38
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    rlca

label_A6C81::
    rlca
    dec  bc
    rra
    ld   e, l
    ld   a, $F8
    rst  $38
    or   e
    db   $FC ; Undefined instruction
    ret  nc
    rst  $38
    ld    hl, sp+$8F
    ld   a, h
    rst  0
    ld   [bc], a
    nop
    ld   [$FFC0], a
    and  c
    ld   h, b
    ret  c
    jr   nc, label_A6C81
    jr   label_A6D03
    sbc  a, b
    ld   a, [label_3808]
    call z, label_103
    dec  c
    inc  bc
    rrca
    inc  bc
    dec  bc
    ld   b, $16
    inc  c
    db   $EC ; Undefined instruction
    jr   label_A6C65
    ld   [hl], b
    pop  af
    pop  bc
    add  a, c
    ld   bc, label_181
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   hl, $0070
    add  a, b
    add  a, b
    nop
    add  a, c
    ld   bc, label_181
    add  a, b
    nop
    nop
    add  a, b
    ret  nz
    add  a, b
    and  b
    ret  nz
    nop
    ld   bc, $000F
    add  a, c
    add  a, b

label_A6CD6::
    add  a, a
    add  a, b
    ld   bc, label_600
    ld   bc, $010F
    dec  b
    inc  bc
    jp   hl
    rst  $10
    rst  $38
    ret  nz
    rst  $18
    ld   [$FFBF], a
    and  b
    xor  a
    or   b
    sub  a, b
    sbc  a, a
    adc  a, a
    rrca
    rra
    db   $10 ; Undefined instruction
    rst  $38
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    ld   a, $FF
    pop  af
    rst  8
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    ret  nz
    rst  $38
    jr   nz, label_A6D03
    db   $10 ; Undefined instruction
    ret  c
    ccf
    ld   l, b
    sbc  a, a
    xor  b
    rst  $18
    ld   c, b
    rst  $38
    jr   z, label_A6D0F
    ld   a, [hl]
    db   $E3 ; Undefined instruction
    dec  h
    db   $E3 ; Undefined instruction
    inc  hl
    pop  hl
    ld   hl, label_20F1
    pop  af
    ld   sp, label_11F0
    ld   a, [$FF10]
    pop  af
    ld   a, d
    adc  a, h
    inc  d
    db   $EC ; Undefined instruction
    dec  [hl]
    call z, label_EC14
    cp   h
    call nz, label_C4BC
    sbc  a, [hl]
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    add  a, h
    ld   bc, $8001
    ret  nz
    jr   nz, label_A6CD6
    dec  a
    ld   a, $37
    inc  de
    jr   c, label_A6D4C
    ld   a, $18
    rra
    ccf
    ld   d, b
    ld   d, b
    jr   nz, label_A6DB4
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop

label_A6D4C::
    nop
    nop
    rst  $38
    nop
    ret  nc
    ld   h, b
    ld   l, b
    jr   nc, label_A6D90
    inc  e
    rra
    rlca
    add  a, b
    add  a, b
    sbc  a, h
    sbc  a, b
    add  a, a
    adc  a, a
    add  a, e
    add  a, d
    ld   e, e
    ld   b, $76
    inc  c
    call c, label_FA38
    ld  [$FF00+C], a
    ld   c, $04
    ld   e, h
    jr   c, label_A6D65
    ld   a, [$FFF1]
    sub  a, c
    rra
    db   $10 ; Undefined instruction
    jr   nz, label_A6DB3
    ld   hl, label_3F3F
    jr   nz, label_A6DB2
    ld   b, b
    ld   b, b
    rst  $30
    rst  $30
    ld   [$F098], sp
    rrca
    cp   $01
    cp   $FF
    dec  c
    add  a, e
    rlca
    nop
    ld   bc, $0000
    nop
    cp   h
    cp   h

label_A6D90::
    jr   label_A6D91
    db   $10 ; Undefined instruction
    ld   [$88FF], sp
    rst  $38
    ld   c, c
    rst  $38
    xor  d
    ld   a, a
    db   $E4 ; Undefined instruction
    ccf
    call c, label_313F
    pop  af
    inc  hl
    pop  af
    ld   h, [hl]
    db   $E3 ; Undefined instruction
    call c, label_A78C7
    sbc  a, a
    ld   [rIE], a
    ld   h, c
    cp   [hl]
    ld   h, e
    cp   h
    ld   a, $C4

label_A6DB2::
    inc  [hl]

label_A6DB3::
    call z, label_8C75
    ld   a, e
    adc  a, h
    ld   l, a
    sbc  a, b
    rst  $38
    db   $10 ; Undefined instruction
    ldi  [hl], a
    ld   [hl], a
    ret  z
    ld   [bc], a
    nop
    jr   nz, label_A6DC4

label_A6DC4::
    ld   bc, $E800
    nop
    ld   a, a
    add  a, b
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$0002], sp
    jr   nz, label_A6DD4

label_A6DD4::
    ld   bc, label_800
    nop
    ld   a, a
    add  a, b
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$0002], sp
    jr   nz, label_A6DE4

label_A6DE4::
    ld   bc, label_800
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    jp  c, label_F420
    ld   [label_3F3F], sp
    ld   a, a
    ccf
    ld   a, [hl]
    ccf
    ld   a, $79
    rst  $38
    ld   [hl], c
    ld   a, a
    ld   [rIE], a
    ld   [$FFBF], a
    and  b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   sp, $C0FF
    rst  $38
    ld    hl, sp+$07
    cp   $01
    cp   $01
    rst  $38
    ld   bc, $8282
    add  a, d
    add  a, d
    add  a, d
    add  a, d
    add  a, b
    add  a, d
    sub  a, b
    sub  a, b
    sbc  a, a
    sub  a, b
    sub  a, b
    sbc  a, a
    cp   a
    sbc  a, a
    sub  a, d
    sub  a, e
    ld   [bc], a
    sub  a, d
    inc  b
    ld   b, $06
    inc  b
    db   $FC ; Undefined instruction
    ld   b, $83
    ld   a, a
    inc  a
    db   $FC ; Undefined instruction
    rst  0
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   sp, label_3131
    ld   sp, label_A6939
    rst  $38
    add  a, $FF
    add  a, b
    rst  $38
    ld    hl, sp+$42
    ld   h, d
    push bc
    push bc
    add  a, $46
    call nz, label_C444
    ld   l, h
    db   $FC ; Undefined instruction
    inc  a
    db   $FC ; Undefined instruction
    ld   b, $FF
    inc  bc
    ld   a, b
    rra
    pop  af
    sbc  a, [hl]
    db   $76 ; Halt
    ld   e, c
    scf
    jr   label_A6E98
    db   $10 ; Undefined instruction
    ld   d, b
    ld   l, l
    ld   a, [$FF00+C]
    cp   b
    rst  $38
    rra
    rst  $18

label_A6E63::
    jr   nz, label_A6E63
    ld   bc, label_8F7
    ld   a, a
    add  a, b
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$82FD], sp
    rst  $18

label_A6E73::
    jr   nz, label_A6E73
    ld   bc, label_8F7
    ld   a, a
    add  a, b
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [label_2FD], sp
    rst  $18

label_A6E83::
    jr   nz, label_A6E83
    ld   bc, label_8F7
    ld   a, a
    add  a, b
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$00FE], sp
    call c, label_FD20
    nop
    or   $08

label_A6E98::
    ld   a, b
    add  a, b
    ld   [rJOYP], a
    ld  [$FF00+C], a
    nop
    ld   [$9F00], sp
    sbc  a, h
    jp   label_A60C3
    ld   h, b
    jr   label_A6EC0
    rlca
    rlca
    ret  nz
    ret  nz
    or   b
    ld   [hl], b
    rst  $28
    rra
    cp   $03
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   bc, label_203
    ld   b, $FC
    db   $FC ; Undefined instruction
    ld   bc, label_601
    rlca
    ei
    db   $FC ; Undefined instruction

label_A6EC0::
    or   b
    sbc  a, a
    cpl
    or   b
    ld   a, [hl]
    ld   hl, label_A6857
    cp   a
    ret  nz
    ld   a, a
    add  a, b
    db   $22

label_A6ECD::
    ldi  [hl], a
    rst  $30
    ld   [$FC08], sp
    ret  z
    jr   c, label_A6ECD
    inc  c
    or   $0F
    ld   a, l
    add  a, e
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [label_70F], sp
    nop
    nop
    nop
    nop
    rlca
    adc  a, a
    ld    hl, sp+$FF
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$001F], sp
    rlca
    rrca
    jr   label_A6F75
    rst  $20
    ld    hl, sp+$7F
    add  a, b
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    rst  $30
    ld   [$E25D], sp
    sbc  a, a
    ld   [rIE], a
    nop
    rst  $30
    ld   [$807F], sp
    rst  $38
    nop
    db   $22
    ldi  [hl], a
    or   $08
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A6F75::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A6FCA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A6FE8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_A7002::
    inc  bc
    db   $FC ; Undefined instruction
    ld   c, $F0
    jr   label_A6FE8
    jr   nz, label_A6FCA
    ld   h, b
    add  a, b
    ret  nz
    nop
    add  a, b
    nop
    rst  $38
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
    inc  bc
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$10
    ld   [rNR41], a
    ret  nz
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    ld   b, $F8
    inc  c
    ld   a, [$FF08]
    ld   a, [$FF10]
    ld   [rNR10], a
    ld   [rNR41], a
    ret  nz
    jr   nz, label_A7002
    nop
    ret  nz
    nop
    ret  nz
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   c, $1F
    inc  d
    ccf
    inc  h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, h
    cp   e
    add  a, e
    ld   a, l
    nop
    ld   a, l
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    add  a, b
    cp   l
    adc  a, l
    cp   a
    adc  a, a
    cp   a
    adc  a, a
    cp   a
    adc  a, a
    cp   $FE
    db   $F4 ; Undefined instruction
    ld   d, h
    db   $F4 ; Undefined instruction
    ld   d, h
    ld   bc, $BF01
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_A4401
    ld   b, h
    ld   b, h
    ld   b, h
    nop
    nop
    nop
    nop
    jp   label_ECC3
    db   $EC ; Undefined instruction
    jp   hl
    jp   hl
    di
    ld   a, [$FF00+C]
    call nc, label_D8DF
    nop
    nop
    nop
    nop
    ld    hl, sp+$F8
    ld   b, $06
    ld   a, [$FF00+C]
    ld   sp, hl
    add  hl, bc
    db   $FD ; Undefined instruction
    dec  b
    rst  $38
    dec  de
    nop
    nop
    nop
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
    ld   h, b
    and  b
    and  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A70FE::
    nop
    nop

label_A7100::
    inc  bc
    inc  bc
    dec  b
    inc  b
    rlca
    inc  b
    dec  b
    inc  b
    dec  b
    inc  b
    add  hl, bc
    ld   [label_80B], sp
    inc  de
    stop
    nop
    add  a, b
    add  a, b
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    jr   nz, label_A70FE
    jr   nz, label_A7100
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A715C::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_A71C2
    inc  h
    rra
    dec  e
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   e, $1E
    rra
    ld   [de], a
    ld   a, $22
    rst  $28
    jr   z, label_A7182
    jr   z, label_A715C
    rst  0
    ld   [label_22EA], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    add  a, e
    nop
    nop
    nop
    push af
    dec  d
    di
    ld   [hl], d
    db   $DB
    sub  a, d
    adc  a, e
    adc  a, e
    adc  a, c
    adc  a, c
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    add  a, h
    rst  $38
    add  a, e
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    and  $02
    rst  $38
    inc  bc
    cp   $FE
    cp   $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    jr   nc, label_A71EE
    inc  sp
    inc  sp
    rst  $18
    ret  c

label_A71C2::
    rra
    rra
    jr   c, label_A71DE

label_A71C6::
    dec  sp
    dec  sp
    db   $3A ; ldd  a, [hl]
    ld   a, [hli]
    ld   a, [hl]
    jr   z, label_A71C6
    jp   hl
    db   $FC ; Undefined instruction
    inc  a
    rst  $28
    ld   l, d
    add  a, a
    add  a, [hl]
    inc  bc
    ld   [bc], a
    cp   e
    cp   d
    inc  hl
    ldi  [hl], a
    rrca
    ld   [bc], a
    di
    ld   a, [$FF00+C]
    dec  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    and  b
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, b

label_A71EE::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A71FF::
    nop
    daa
    jr   nz, label_A7251
    ld   b, c
    sbc  a, l
    add  a, e
    sbc  a, e
    add  a, a
    rst  $20
    sbc  a, a
    res  7, a
    ld   [hl], a
    ld   a, a
    ld   c, a
    ld   a, a
    inc  a
    db   $FC ; Undefined instruction
    rst  8
    di
    adc  a, b
    pop  af
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $C6
    rst  0
    or   d
    or   e
    cp   d
    cp   e
    nop
    nop
    nop
    nop
    add  a, c
    add  a, c
    ld   b, a
    add  a, $EE
    ld   l, c
    cp   e
    ld   [hl], a
    scf
    rst  $28
    cpl
    rst  $38
    nop
    nop
    nop
    nop
    pop  af
    pop  af
    add  hl, hl
    add  hl, de
    dec  h
    call label_F5CD
    jp   hl
    ld   sp, hl
    jp   hl
    ld   sp, hl
    ld   b, b
    ld   b, b
    and  b
    and  b
    ret  nc
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop

label_A7251::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   hl, label_223F
    rra
    inc  d
    dec  de
    dec  de
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    rlca
    ld   b, $07
    inc  b
    add  a, e
    add  a, e
    rst  $38
    ld   a, h
    cp   e
    nop
    cp   e
    ld   bc, label_1C7
    rst  $28
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    jr   c, label_A72A4
    ld   c, b
    or   a
    or   h
    inc  hl
    inc  hl
    inc  h
    inc  h
    rst  8
    ret  z

label_A72AE::
    rst  8
    ld   c, b

label_A72B0::
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, e
    ld   a, h
    ld   a, h
    rst  $28
    jr   z, label_A72AE
    jr   z, label_A72B0
    ld   b, a
    rst  0
    ld   b, h
    rst  0
    ld   b, h
    rst  $28
    ld   b, a
    cp   a
    cp   b

label_A72CA::
    ld   c, b
    ld   c, b
    rst  $28
    cpl
    rst  $38

label_A72CF::
    jr   nc, label_A72CF
    ld   a, [label_1FF]
    rst  $38
    add  hl, bc
    cp   h
    cp   h
    db   $FC ; Undefined instruction
    inc  b
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    cp   [hl]
    cp   [hl]
    cp   a
    and  c
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
    nop
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
    rrca
    db   $10 ; Undefined instruction
    daa
    jr   nz, label_A72CA
    call nz, label_EEF5
    db   $EB ; Undefined instruction

label_A72FF::
    ld   a, [$9FA7]
    or   e
    adc  a, a
    sub  a, c
    adc  a, a
    sbc  a, c
    add  a, a
    adc  a, c
    add  a, a
    adc  a, e
    add  a, a
    sbc  a, e
    add  a, a
    sub  a, a
    adc  a, [hl]
    cp   e
    cp   e
    rst  0
    rst  0
    rst  $38
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
    ld   a, a
    rst  $38
    pop  de
    ld   a, [$FFAE]
    ld   [$FFF1], a
    adc  a, $6E
    rst  $18
    cp   [hl]
    rst  $18
    cp   $FF
    cp   $FF
    pop  af
    pop  af
    ld   [hl], c
    pop  af
    pop  af
    ld   [hl], c
    rst  $38
    ld   a, a
    ld   a, [$FF70]
    rst  $38
    ld   a, a
    pop  af
    ld   [hl], c
    ld   [hl], c
    pop  af
    or   b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   d, b
    and  b
    ld   [rNR41], a
    and  b
    and  b
    ld   [$FFF0], a
    ld   d, b
    or   b
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
    nop
    nop

label_A7360::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   c, $1E
    inc  d
    ld   a, $24
    dec  a
    jr   nz, label_A7391

label_A7391::
    nop
    nop
    nop
    cp   $FE
    ld   a, l
    ld   bc, $007D
    cp   $10
    cp   $10
    rst  $28
    jr   z, label_A7360
    add  a, b
    or   b
    add  a, b
    or   b
    add  a, b
    cp   d
    adc  a, d
    ld   a, [$FFFA]
    ld   e, a
    rst  $38
    ld   c, a
    cp   $0E
    pop  hl
    ld   bc, $0101
    ld   bc, $F901
    ld   sp, hl
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    inc  bc
    nop
    nop
    inc  bc
    inc  bc
    inc  c
    inc  c
    add  hl, bc
    add  hl, bc
    inc  de
    ld   [de], a
    rst  $10
    call nc, label_B8BF
    cp   a
    xor  b
    nop
    nop
    ld    hl, sp+$F8
    ld   b, $06
    ld   a, [$FF00+C]
    ld   sp, hl
    add  hl, bc
    db   $FD ; Undefined instruction
    dec  b
    rst  $38
    dec  de
    rst  $28
    ld   l, d
    nop
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
    ld   h, b
    and  b
    and  b
    and  b
    and  b
    pop  af
    pop  af
    sbc  a, $DE
    call nc, label_D4D4
    ret  c
    sub  a, b
    ret  nc
    ld   [hl], a
    ld   h, a
    ld   a, b
    ld   [hl], b
    rst  8
    ld   a, a
    push af
    adc  a, h
    ld   h, a
    ld   e, [hl]
    ld   c, e
    ld   a, d
    ld   sp, $0031
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    ccf
    rra
    rra
    add  a, a
    rlca
    jp   label_F103
    add  a, c
    ld   a, h
    ld   b, c
    ccf
    jr   nc, label_A742E
    rrca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, [label_FF1]
    pop  bc
    ld   a, $06

label_A742E::
    ld    hl, sp+$F8
    pop  af
    pop  af
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    ld   b, c
    pop  bc
    add  a, c
    add  a, c
    ld   bc, $0001
    nop
    nop
    nop
    or   b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    and  b
    ld   h, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  a
    inc  h
    rra
    dec  e
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   e, $1E
    rra
    ld   [de], a
    ld   a, $22
    ccf
    ld   hl, label_28EF
    rst  0
    rst  0
    ld   [label_22EA], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    add  a, e
    nop
    nop
    nop
    add  a, e
    add  a, e
    db   $FC ; Undefined instruction
    ld   c, h
    db   $EC ; Undefined instruction
    ld   a, h
    reti
    adc  a, c
    add  a, d
    adc  a, e
    add  a, [hl]
    adc  a, a
    adc  a, [hl]
    rst  $38
    ld   a, a
    adc  a, a
    cp   c
    ret
    adc  a, c
    adc  a, c
    adc  a, b
    adc  a, b
    ld   a, [$FFF0]
    ld   [label_618], sp
    ld   e, $0F
    rst  $38
    cp   $FE
    ld    hl, sp+$F8
    cp   a
    xor  a
    ld    hl, sp+$E8
    ei
    db   $EB ; Undefined instruction
    ld    hl, sp+$E8
    cp   $E8
    ld   a, c
    ld   l, c
    ld   [hl], h
    ld   [hl], h
    rst  8
    ld   a, e
    add  a, a
    add  a, [hl]
    inc  bc
    ld   [bc], a
    cp   e
    cp   d
    inc  bc
    ld   [bc], a
    rrca
    ld   [bc], a
    di
    ld   a, [$FF00+C]
    dec  b
    cp   $FA
    and  b
    and  b
    and  b
    and  b
    ret  nz
    ret  nz
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  bc
    ld   [label_808], sp
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    ld   [bc], a
    ld   a, a
    ld   a, a
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   [rNR41], a
    ret  nz
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    ld   b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    rra
    inc  d
    dec  de
    dec  de
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc

label_A758A::
    rlca
    ld   b, $07
    inc  b
    rlca
    rlca
    rst  $38
    ld   a, h
    cp   e
    nop
    cp   e
    ld   bc, label_1C7
    rst  $28
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    rst  $38
    call z, label_FE7C
    ld   [hl], e
    cp   a
    or   c
    ccf
    jr   nc, label_A75E8
    jr   nc, label_A758A
    ret  c
    rst  $18
    ld   e, a
    ld   [$FFE0], a
    ld   h, e
    ld   h, b
    ld   h, a
    ld   h, a
    rst  $38
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    rst  $28
    sbc  a, a
    ld   [hl], b
    ld   [hl], b
    rst  $28
    call nz, label_A44C7
    adc  a, a
    ld   b, a
    ccf
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$0F
    rst  8
    rst  $18
    ret  nc
    ld   e, a
    ld   e, a
    rst  $38
    ld   bc, label_9FF
    cp   h
    cp   h
    db   $FC ; Undefined instruction
    inc  b
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    cp   [hl]
    cp   [hl]
    cp   a
    and  c
    cp   a
    cp   a
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    add  a, b
    add  a, b

label_A75E8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A7604::
    nop
    nop
    rlca
    rlca
    rrca
    ld   [label_1718], sp
    jr   label_A7625
    jr   nc, label_A763F
    add  a, b
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    add  a, b
    ld   bc, $FD01
    ld   bc, label_1FD

label_A7626::
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    cp   $FF
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_A7604
    jr   label_A7626
    inc  c

label_A763F::
    db   $F4 ; Undefined instruction
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   b, $F9
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    inc  c
    di
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    ld   a, a
    add  a, b
    rst  $38
    add  a, [hl]
    ld   sp, hl
    ld   [$FF9F], a
    add  a, b
    rst  $38
    adc  a, h
    di
    add  a, b
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A7780::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A77B7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   hl, label_A4320
    ld   b, b
    ld   b, a
    ld   b, c
    adc  a, [hl]
    add  a, e
    sbc  a, h
    add  a, a
    cp   b
    adc  a, a
    ld   [hl], b
    ld   a, a
    ld   e, h
    ld   c, a
    db   $FC ; Undefined instruction
    inc  a
    rst  8
    di
    jr   label_A77B7
    ld   b, $F8
    ld   a, l
    cp   $C6
    rst  0
    or   d

label_A77DD::
    or   e
    cp   d
    cp   e
    nop
    nop
    nop
    nop
    add  a, c
    add  a, c
    ld   b, a
    add  a, $EE
    ld   l, c
    cp   b
    ld   [hl], a
    jr   nc, label_A77DD
    jr   nz, label_A77EF
    nop
    nop
    nop
    nop
    pop  af
    pop  af
    add  hl, hl
    add  hl, de
    dec  h
    call label_F50D
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A782B::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A7878::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A787F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, [hl]
    add  a, a
    add  a, [hl]
    add  a, e
    add  a, a
    add  a, c
    add  a, a

label_A78C7::
    add  a, c
    add  a, a
    add  a, c
    adc  a, [hl]

label_A78CB::
    add  a, e
    adc  a, a
    add  a, e
    adc  a, [hl]
    add  a, [hl]
    cp   d
    cp   e
    add  a, $C7
    ld   a, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    ld   a, a
    rrca
    sbc  a, a
    ld   de, label_2EF0
    ld   [$FF71], a
    adc  a, $60
    rst  $18
    jr   nz, label_A78CB
    nop
    rst  $38
    nop
    rst  $38
    sub  a, c
    pop  af
    ld   d, c
    pop  af
    pop  de
    ld   [hl], c
    rst  $18
    ld   a, a
    pop  de
    ld   [hl], c
    rst  $18
    ld   a, a
    pop  de
    ld   [hl], c
    ld   d, c
    pop  af
    rst  $38
    rst  $38
    cp   a
    pop  hl
    ld   d, d
    cp   a
    sub  a, e
    ld   a, [hl]
    dec  bc
    cp   $05
    cp   $06
    db   $FD ; Undefined instruction
    ld   b, $FD
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    ld   c, l
    di
    db   $3A ; ldd  a, [hl]
    rst  $20
    dec  h
    cp   $1A
    db   $FD ; Undefined instruction
    inc  d
    ei
    inc  d
    ei
    rst  $38
    rst  $38
    rst  $38
    nop
    cp   c
    rst  0
    ld   d, a
    xor  $2A
    db   $FD ; Undefined instruction
    inc  e
    di
    ld   [$00F7], sp
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_1F01
    rra
    jr   nc, label_A79A4
    ld   h, b
    ld   h, b
    ld   e, h
    ld   e, h
    xor  d
    xor  $CB
    call label_EFEF
    jr   nz, label_A79B0
    add  a, b
    add  a, b
    ld   a, [$FFF0]
    ld   a, b
    ld   c, b
    inc  l
    inc  [hl]
    ld   [hl], $3A
    dec  de
    dec  d
    sbc  a, c
    sbc  a, a
    ret
    adc  a, $00
    nop
    nop
    nop

label_A79A4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A79B0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, h
    add  a, h
    ld   e, d
    ld   c, d
    ld   a, e
    ld   c, e
    ld   sp, $0031
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    jr   label_A79F3
    inc  b
    rlca
    add  a, d
    add  a, e
    pop  bc
    pop  bc
    ld   h, c
    ld   b, c
    jr   c, label_A7A0E
    rrca
    rrca
    ld   bc, $00FF
    rst  $38
    rrca
    rst  $38
    ld   de, label_23F0
    ld   [$FFCF], a
    pop  bc
    ld   a, $06
    ld    hl, sp+$F8
    sub  a, c
    pop  af
    ld   hl, $A1E1
    pop  hl
    pop  bc
    ld   b, c
    add  a, c
    add  a, c
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $01
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0001

label_A7A0E::
    ld   bc, $8000
    ld   a, a
    ret  nz
    ccf
    ld   h, b
    rra
    jr   nc, label_A7A27
    db   $10 ; Undefined instruction
    ld   [label_807], sp
    rlca
    inc  b
    inc  bc
    ret  nz
    ccf
    jr   nc, label_A7A33
    ld   [label_407], sp

label_A7A27::
    inc  bc
    ld   [bc], a

label_A7A29::
    ld   bc, $0102
    ld   bc, $0100
    nop
    rst  $38
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
    rst  $38
    ret  nz
    ccf
    ld   [hl], b
    rrca
    jr   label_A7A4F
    inc  b
    inc  bc
    ld   b, $01
    inc  bc
    nop
    ld   bc, $0000
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, d
    ld   h, d
    ld   d, e
    ld   d, d
    ld   e, [hl]
    ld   e, [hl]
    ld   h, a
    ld   a, e
    daa
    jr   c, label_A7A99
    add  hl, de
    dec  b
    ld   b, $05
    ld   b, $26
    ld   h, $82
    ld   [bc], a
    ldi  [hl], a
    ldi  [hl], a
    daa

label_A7A87::
    jr   nz, label_A7A29
    ld   [$FFF0], a
    ld   [hl], c
    rst  $38
    rrca
    db   $FC ; Undefined instruction
    inc  bc
    xor  a
    db   $E8 ; add  sp, d
    cp   a
    call c, label_D7B3
    sub  a, e
    di
    sub  a, d

label_A7A99::
    or   $9C
    db   $FC ; Undefined instruction
    ld   a, [$FFD0]
    ld   [hl], b
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
    dec  bc
    ld   [label_808], sp
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    ld   [bc], a
    rst  $38
    rst  $38
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   [rNR41], a
    ret  nz
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    ld   b, b
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

label_A7AFC::
    nop
    nop
    nop
    nop
    rlca
    rst  $38
    jr   c, label_A7AFC
    ld   b, d
    jp   nz, label_C343
    ld   b, b
    ret  nz
    jr   nc, label_A7AFC
    rrca
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    inc  e
    rra
    ld   b, d
    ld   b, e
    jp   nz, label_2C3
    inc  bc
    inc  c
    rrca
    ld   a, [$FFFF]
    nop
    rst  $38
    rlca
    rst  $38
    ccf
    ld    hl, sp+$7F
    jp   nz, label_C37F
    ld   a, a
    ret  nz
    ccf
    ld   a, [$FF0F]
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    db   $FC ; Undefined instruction
    rra
    cp   $43
    cp   $C3
    cp   $03
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FFFF]
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
    nop
    nop
    inc  b
    rlca
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, label_302
    inc  b
    rlca
    inc  bc
    inc  bc
    ld   [hl], c
    adc  a, a
    inc  bc
    rst  $38
    cp   $02
    cp   $46
    ld   sp, $AE39
    xor  a
    ld   b, h
    rst  0
    jp   label_9FC3
    ccf
    db   $10 ; Undefined instruction
    and  $F9
    ld   [$FF9F], a
    add  a, b
    rst  $38
    adc  a, h
    di
    add  a, b
    rst  $38
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
    rlca
    rlca
    rrca
    ld   [label_1718], sp
    jr   label_A7BE5
    jr   nc, label_A7BFF
    nop
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    add  a, b
    nop
    nop
    cp   $00
    cp   $00

label_A7BE6::
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    cp   $FF
    ld   bc, $8001
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_A7BC4
    jr   label_A7BE6
    inc  c

label_A7BFF::
    db   $F4 ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A7C67::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_A7CF1
    ld   h, c
    ld   e, a
    ld   h, c
    ld   e, a
    db   $FC ; Undefined instruction
    add  a, d
    db   $FC ; Undefined instruction
    add  a, d
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_BFBE
    add  a, b
    ld   a, a
    nop
    ld   a, a
    ccf
    nop
    nop
    ccf
    ccf
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   bc, $00FE
    cp   $FC
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    cp   $00
    inc  c

label_A7CF1::
    db   $F4 ; Undefined instruction
    adc  a, [hl]
    ld   a, [$FF00+C]
    ld   a, [label_A413F]
    ccf
    ld   b, c
    ld   [hl], e
    ld   c, l
    daa
    ld   e, c
    rrca
    ld   [hl], c
    nop
    rst  $38
    nop
    rst  $38
    ld   sp, label_A72FF
    rst  $18
    push af
    sbc  a, [hl]
    rst  $30
    inc  e
    db   $EB ; Undefined instruction
    inc  e
    rst  $30
    ld   [$FF38], sp
    ld   l, b
    rst  $18
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E8 ; add  sp, d
    rra
    jp   hl
    rra
    db   $EB ; Undefined instruction
    ld   e, $EF
    inc  e
    di
    inc  c
    nop
    rst  $38
    nop
    rst  $38
    ld   b, e
    rst  $38
    and  e
    cp   $A3
    ld   a, [hl]
    and  l
    ld   a, [hl]
    rst  $10
    inc  a
    db   $EB ; Undefined instruction
    inc  e
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    or   b
    ld   a, a
    db   $ED ; Undefined instruction
    rra
    ei
    rlca
    db   $FD ; Undefined instruction
    inc  bc
    cp   $01
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   sp, label_A52FF
    rst  $38
    sub  a, l
    cp   $16
    db   $FD ; Undefined instruction
    ld   a, [bc]
    db   $FD ; Undefined instruction
    nop
    rst  $38
    jr   c, label_A7D61
    ld   l, b
    rst  $18
    ret  z
    cp   a
    adc  a, b
    ld   a, a
    add  hl, bc
    rst  $38
    dec  bc
    cp   $0E
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction

label_A7D70::
    nop
    rst  $38
    nop
    rst  $38
    ld   b, e
    rst  $38
    ld  [$FF00+C], a
    cp   a
    and  e
    ld   a, [hl]
    dec  h
    cp   $16
    db   $FD ; Undefined instruction
    ld   a, [bc]
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_A7D87
    adc  a, l
    ld   a, a
    inc  bc
    rst  $38
    ld   bc, $00FF
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
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_C2BE
    cp   [hl]
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   sp, hl
    nop
    rst  $38
    ld   a, [$FFE7]
    nop
    cp   $CC
    sbc  a, h
    nop
    add  hl, sp
    nop
    ld   [hl], e
    nop
    ld   e, e
    ld   h, l
    ld   [hl], e
    ld   c, l
    inc  hl
    ld   e, l
    inc  bc
    ld   a, l
    ld   b, e
    ld   a, l
    ld   b, e
    ld   a, l
    ld   b, e
    ld   a, l
    ld   b, e
    ld   a, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
