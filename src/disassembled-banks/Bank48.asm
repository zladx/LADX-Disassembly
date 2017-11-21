section "bank48",romx,bank[$30]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30

label_C0005::
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   a
    rst  $38
    ld   a, a
    rst  $38
    rst  $28
    rst  $38
    ld   a, [$FFF7]
    rst  $38
    ld   sp, hl
    rst  $38
    ld   b, d
    rst  $38
    rrca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    xor  e
    rst  $18
    jp  c, label_FFE7
    ld   a, [$FFFE]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    or   l
    rst  $38
    jr   c, label_C0005
    ld   h, e
    sbc  a, a
    db   $FC ; Undefined instruction
    ei
    db   $FD ; Undefined instruction
    cp   $7E
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   a, [$CDFD]
    ld   [hl], e
    ld   [hl], a
    adc  a, a
    sbc  a, a
    ld   a, a
    dec  l
    rst  $38
    and  b
    ld   e, a
    push af
    ld   a, [bc]
    cpl
    ret  nc
    ld   l, [hl]
    ld   sp, hl
    dec  [hl]
    rst  $18
    sbc  a, b
    rst  $20
    rst  $20
    ld    hl, sp+$A0
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    ld   l, [hl]
    sub  a, c
    di
    rrca
    xor  a
    ld   a, a
    ld   a, l
    rst  $38
    xor  e
    db   $F4 ; Undefined instruction
    call c, label_C1F23
    cp   e
    dec  a
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    db   $EB ; Undefined instruction
    rst  $18
    ld   b, e
    cp   l
    and  e
    ld   a, h
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   [$D5FF], a
    ld   a, a
    ld   a, [label_2FAF]
    ld   d, l
    dec  d
    ld   a, [bc]
    ld   [bc], a
    dec  b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    ld   e, l
    rst  $30
    or   l
    ld   [label_C15AA], a
    ld   d, b
    xor  d
    add  a, b
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    push af
    rst  $38
    rst  $18
    xor  d
    ld   a, [bc]
    ld   d, l
    dec  b
    ld   [bc], a
    nop
    nop
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    xor  d
    rst  $38
    ld   d, a
    db   $FD ; Undefined instruction
    xor  l
    ld   a, [label_C15EA]
    ld   d, h
    xor  d
    and  b
    ld   d, h
    rst  $38
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    inc  bc
    rst  $38
    add  a, b
    rst  $38
    ld   a, [$FFFF]
    rst  $38
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
    rra
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    ld   bc, rIE
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    add  a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_C00FE::
    rst  $38
    rst  $38
    nop
    nop
    stop
    rst  $28
    nop
    ld   a, a
    nop
    di
    inc  c
    ret  nz
    ccf
    nop
    rrca
    nop
    jp   label_3F
    ld    hl, sp+$00
    add  a, b
    nop
    ld   bc, $C000
    nop
    ld   a, [$FF00]
    rrca
    ld   a, [$FF00]
    ld   [$FF80], a
    nop
    pop  af
    nop
    rrca
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, b
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   bc, label_38C0
    nop
    cp   $00
    jp   label_0
    nop
    nop
    nop
    ld   bc, label_F00
    nop

label_C013E::
    ld    hl, sp+$06
    nop
    db   $E3 ; Undefined instruction
    nop
    ld    hl, sp+$00
    pop  hl
    nop
    sbc  a, a
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    nop
    ccf
    ccf
    nop
    rst  0
    nop
    rra
    nop
    db   $FC ; Undefined instruction
    nop
    pop  af
    inc  c
    rst  8
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    adc  a, a
    nop
    inc  bc
    nop
    nop
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    ld   [rIE], a
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
    inc  bc
    nop
    ld   e, $00
    ld   [rJOYP], a
    ld   bc, rIE
    cp   $FF
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   label_EFF
    rst  $38
    jr   nc, label_C0195
    nop
    rst  $38
    ld   [hl], b
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    ld   [rIE], a
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    pop  hl
    rst  $38
    ld   a, a
    rst  $38
    rrca
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   a, a
    rra
    ccf
    adc  a, a
    rra
    rst  0
    rrca
    db   $E3 ; Undefined instruction
    rlca
    pop  af
    rlca
    pop  af
    inc  bc
    ld    hl, sp+$01
    ld    hl, sp+$01
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld   a, [$FF00]
    pop  af
    ld   bc, label_1E1
    jp   nz, label_FE03
    cp   $FC
    cp   $FC
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    ld    hl, sp+$F8
    ld   a, [$FFF8]
    ld   a, [$FFF0]
    ld   [$FFF1], a
    nop
    nop
    nop
    nop
    nop
    add  hl, de
    nop
    add  hl, sp
    nop
    add  hl, sp
    nop
    ld   sp, $8300
    nop
    add  a, a
    nop
    ld    hl, sp+$00
    pop  af
    nop
    pop  hl
    nop
    db   $E3 ; Undefined instruction
    nop
    add  a, a
    nop
    rra
    ld   bc, label_33F
    ccf
    nop
    rst  $38
    nop
    rst  $38
    ld   sp, label_31FF
    rst  $38
    inc  sp
    rst  $38
    rst  $30
    rst  $38
    rst  $20
    rst  $38
    jp   label_FFFF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  $38
    adc  a, a
    rst  $38
    adc  a, a
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    push hl
    ld   [$FFCF], a
    ld   [$FFC1], a
    jp   label_DFCF
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFF8]
    ld   [$FFE1], a
    pop  bc
    ld   bc, $00FF
    ld    hl, sp+$FE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    nop
    add  a, a
    nop
    add  a, a
    ret  nz
    call z, label_C00
    ret  nz
    add  hl, bc
    add  a, b
    pop  hl
    ld    hl, sp+$FF
    cp   $FF
    ccf
    rst  $38
    rlca
    ccf
    nop
    rst  $38
    ld   e, $FF
    inc  hl
    rst  $20
    inc  hl
    rst  $20
    inc  hl
    rst  $38
    ld   e, $FF
    adc  a, [hl]
    rst  $38
    db   $EC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    sbc  a, a
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    adc  a, a
    sbc  a, a
    adc  a, a
    sbc  a, a
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld   a, l
    rst  $38
    ccf
    rst  $38
    inc  e
    cp   $38
    ld    hl, sp+$70
    ld    hl, sp+$70
    ld   a, [$FF8F]
    rst  $38
    rst  $38
    rst  $38
    ei
    rst  $38
    sub  a, e
    sbc  a, a

label_C02B8::
    scf
    ccf
    ccf
    ld   a, a
    ld   a, a
    ld   a, a
    ccf
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
    add  a, a
    add  a, a
    cp   a
    rst  $38
    sbc  a, a
    cp   a
    rst  8
    sbc  a, a
    rst  $20
    adc  a, a
    ld   [hl], e
    add  a, a
    ld   [hl], e
    add  a, e
    ld   sp, hl
    inc  bc
    ld   sp, hl
    ld   bc, label_203
    dec  b
    ld   b, $0B
    inc  c
    scf
    jr   c, label_C02B8
    ld   a, [$FF7E]
    nop
    add  hl, de
    nop
    rlca
    nop
    db   $FC ; Undefined instruction
    ld   bc, $00FC
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$01
    pop  af
    ld   bc, label_382
    ld   [$FFE3], a
    ret  nz
    rst  $20
    ret  nz
    add  a, $80
    add  a, $80
    call z, label_8C80
    nop
    add  a, b
    nop
    nop
    nop
    rrca
    nop
    ld   c, $00
    inc  c
    nop
    jr   label_C0319

label_C0319::
    ld   a, b
    nop
    ld    hl, sp+$00
    ld   sp, hl
    nop
    ld   sp, hl
    inc  bc
    ccf
    nop
    ccf
    ld   [bc], a
    ccf
    ld   b, $3F
    ld   b, $7F
    ld   c, $FF
    inc  e
    rst  $38
    jr   label_C032F
    add  a, e
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    ld   c, $FF
    inc  a
    rst  $38
    ld   a, h
    rst  $38
    ld   a, l
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    sbc  a, a
    cp   a
    rst  8
    sbc  a, a
    rst  $20
    adc  a, a
    rst  $20
    add  a, a
    ld   [hl], e
    add  a, a
    di
    inc  bc
    ld   sp, hl
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
    rst  $38
    rst  $38
    cp   $FF
    cp   $FE
    db   $FC ; Undefined instruction
    cp   $FC
    cp   $F8
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    add  a, h
    adc  a, h
    ld   [hl], h
    inc  b
    jr   c, label_C0379
    ld   sp, hl
    ld   bc, label_1F9
    ld   sp, hl
    ld   bc, label_1F8
    ld   a, [$FF00+C]
    jp   label_502
    ld   b, $1B
    inc  e
    nop
    rst  $38
    ld   bc, label_36FF
    cp   $38
    ld    hl, sp+$30
    ld   a, [$FFD0]
    ld   a, [$FFE0]
    ld   [$FFA0], a
    ld   [rNR10], a
    ld   a, [$FFF8]
    ld    hl, sp+$06
    ld   b, $01
    ld   bc, $0000
    rra
    nop
    inc  bc
    nop
    ld   bc, label_1F00
    ccf
    rlca
    rrca
    ld   bc, $8007
    add  a, b
    nop
    nop
    nop
    nop
    ret  nz
    nop
    rst  $38
    nop

label_C03C0::
    ld   a, [$FFFF]
    jp   label_9FE0
    add  a, b
    ld   a, a
    ld   a, b
    rlca
    ld   e, $01
    inc  bc
    ret  nz
    ld   bc, label_1010
    cp   $01
    ccf
    add  a, b
    rst  8
    jr   nz, label_C03CE
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    add  a, c
    rst  $38
    ld   [$FF71], a
    ld   a, [$FF1C]
    ld    hl, sp+$0F
    db   $FC ; Undefined instruction
    rlca
    ld   a, [label_C3C03]
    inc  bc
    cp   a
    ld   bc, rIE
    ld   a, a
    rst  $38
    jr   label_C0475
    inc  c
    ccf
    inc  b
    sbc  a, a
    ld   [bc], a
    rst  8
    nop
    rst  $28
    ld   bc, $F0FF
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    add  a, b
    nop
    nop
    nop
    ret  nz
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    rra
    rst  $38
    rlca
    rst  $38
    ld   bc, $001F
    rrca
    nop
    rrca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    ei
    ld    hl, sp+$F0
    ld   a, [$FFFF]
    rst  $38
    db   $E3 ; Undefined instruction
    ld   a, [$FFEF]
    ld   [$FFC0], a
    ld   [$FFDF], a
    rst  $38
    ld   e, a
    ret  nz
    db   $E8 ; add  sp, d
    dec  bc
    inc  a
    rlca
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    sub  a, d
    ld   d, $EC
    inc  c
    inc  b
    inc  c
    adc  a, b
    ld    hl, sp+$70
    ld   [hl], b
    ld   h, b
    ld   l, a
    jr   nc, label_C04C2
    jr   z, label_C0482
    and  h
    inc  l
    or   d
    ld   h, $1B
    inc  hl
    ld   e, e
    ld   h, e
    cp   c
    pop  bc
    jp   label_C0CC3
    call z, label_D050
    ld   d, b
    ret  nc
    ld   h, b
    ld   [$FF60], a
    ld   [$FF60], a
    ld   [rLCDC], a
    ret  nz
    add  a, a
    add  a, b
    ld   e, $00
    jr   c, label_C0466

label_C0466::
    jr   nc, label_C0468

label_C0468::
    ld   b, b
    nop
    ld   b, b
    nop
    nop
    inc  bc
    nop
    rrca
    rst  0
    nop
    ld   e, $00
    inc  a

label_C0475::
    nop
    jr   c, label_C0478

label_C0478::
    ld   a, b
    nop
    ld   [hl], b
    nop
    jr   nc, label_C047E

label_C047E::
    jr   nc, label_C0480

label_C0480::
    inc  c
    inc  c

label_C0482::
    ld   b, e
    inc  bc
    ld   b, b
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    rst  $38
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    ld   c, $00
    ld    hl, sp+$00
    ld   [rJOYP], a
    ret  nz
    nop
    sbc  a, a
    and  c
    ld   l, a
    ld   [hl], b
    rra
    jr   label_C04AE
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, label_F01
    rra
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   a, [$FF1F]
    nop
    rst  $38

label_C04C2::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    inc  bc

label_C04CD::
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    rrca
    rst  $38
    ccf
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
    pop  bc
    ld    hl, sp+$FF
    ld   [$FFF8], a
    ld   a, [$FFFE]
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    dec  b
    ld   b, $1B
    inc  e
    rst  8
    ld   a, [$FF3D]
    nop
    rlca
    nop
    ld   [bc], a
    nop
    nop
    add  a, b
    add  a, b
    ld   [$FF3F], a
    ld   h, b
    sub  a, b
    jr   nc, label_C04CD
    rra
    rst  8
    rrca
    and  $0E
    push hl
    rlca
    db   $E4 ; Undefined instruction
    dec  b
    and  $04
    and  b
    jr   nz, label_C0533
    ld   h, b
    ld   b, b
    ld   sp, hl
    add  a, b
    ld   sp, hl
    nop
    add  hl, sp
    nop
    ld   sp, $8380
    ld   b, b
    rst  0
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFC0], a
    ld   [$FF60], a
    ld   a, [$FF20]
    di
    nop
    rra
    nop

label_C0533::
    ccf
    ld   bc, $013F
    ld   a, a
    inc  bc
    ld   a, a
    inc  bc
    ld   a, a
    rlca
    rst  $38
    ld   b, $FF
    stop
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    inc  b
    call nz, label_C684
    add  a, h
    rst  $20
    jp   nz, label_C3FF3
    nop
    ccf
    nop
    rrca
    nop
    inc  bc
    nop
    nop

label_C0559::
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    add  a, b
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld    hl, sp+$00
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], $70
    ld   e, $1D
    rlca
    ld   b, $03
    inc  bc
    dec  e
    rra
    ld   [label_608], sp
    inc  b
    dec  b
    rlca
    ld   a, [$FF1F]
    ld   l, b
    rra
    ld   a, b
    adc  a, a
    ld   a, b
    adc  a, a
    jr   c, label_C0559
    inc  [hl]
    ld   c, a
    inc  d
    daa
    call nc, label_7E7
    rst  $38
    rlca
    rst  $38
    rlca
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  $38
    adc  a, a
    rst  $38
    adc  a, a
    rst  $38
    adc  a, a
    rst  $38
    ld   e, b
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  hl
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   [$FFF8], a
    ld   a, [$FFFE]
    db   $FC ; Undefined instruction
    rst  $38

label_C05C8::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    ld   a, [$FF1A]
    nop
    rlca
    nop
    nop
    add  a, b
    nop
    pop  hl
    cp   $FF
    ld   [$FFF0], a
    ld   a, [$FFFC]
    ld  [$FF00+C], a
    inc  b
    rrc  h
    rla
    jr   label_C0616
    jr   nc, label_C05C8
    ld   [$FFF7], a
    nop
    ld   c, [hl]

label_C05ED::
    nop
    jr   label_C05F0

label_C05F0::
    jr   nz, label_C05ED
    ld   sp, label_C3CFF
    rst  $38
    or   $FF
    rst  $30
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    dec  b
    rst  $38
    dec  b
    rst  $38
    add  a, h
    rst  $38
    add  a, d
    rst  $38
    jp   nz, label_F1FF
    rst  $38
    rst  $28
    rst  $38
    db   $E4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    pop  bc
    db   $FD ; Undefined instruction
    ld   h, b
    rst  $38
    jr   nc, label_C0615

label_C0616::
    ld   a, [hl]
    ld   a, a
    ld   c, e
    ld   c, a
    jr   z, label_C0684
    ld   l, b
    ld   [label_800], sp
    nop
    ld    hl, sp+$80
    rst  $38
    ld   h, b
    rst  $38
    ccf
    rst  $38
    rst  $30
    rst  $38
    inc  a
    rst  $38
    db   $76 ; Halt
    rst  $30
    sub  a, a
    db   $00
    nop
    nop
    nop
    pop  bc
    ld   bc, $E2FF
    cp   $D5
    db   $FC ; Undefined instruction
    ld   c, a
    call c, label_ED26
    inc  hl
    rst  $28
    inc  c
    ld   e, $67
    ld   a, [$FFBE]
    add  a, c
    pop  bc
    inc  de
    add  a, [hl]
    ld   h, d
    ld   [bc], a
    rst  $28
    rst  0
    rst  $28
    rrca
    rst  $38
    ld   b, h
    ld   h, a
    add  a, e
    rst  $20
    add  a, e
    and  e
    inc  bc
    inc  de
    inc  bc
    inc  de
    inc  bc
    rla
    rla
    rla
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  $38
    rst  0
    rst  $38
    jp   label_E1FF
    rst  $38
    ld   h, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    ld   sp, hl
    db   $FD ; Undefined instruction
    ld    hl, sp+$FC
    db   $FC ; Undefined instruction
    cp   $FE
    ccf
    rst  $38
    rrca
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38

label_C0684::
    db   $FD ; Undefined instruction
    rst  $38
    ld    hl, sp+$FC
    ld    hl, sp+$FC
    ld   a, [$FFF8]
    ld   a, [$FFF8]
    ld   [$FFF1], a
    inc  bc
    add  a, e
    db   $FD ; Undefined instruction
    cp   $80
    ld   [$FF60], a
    ld   a, b
    jr   label_C0718
    rrca
    rrca
    ld   [bc], a
    adc  a, a
    ld   bc, label_C3D8F
    add  a, c
    reti
    ld   bc, $0131

label_C06A6::
    ld   [bc], a
    inc  bc
    dec  b
    ld   c, $FE
    ld    hl, sp+$01
    add  a, b
    add  a, b
    ld   [rNR41], a
    ld   a, a
    sub  a, b
    ccf
    reti
    rra
    call label_EB0F
    rrca
    jp   hl
    dec  bc
    call z, label_1609
    jr   label_C06A6
    push af
    add  a, $EE
    set  5, d
    set  5, d
    ret
    jp   hl
    set  5, b
    add  a, e
    call c, label_DC87
    ret  nz
    ld   a, [$FFF0]
    nop
    ld    hl, sp+$00
    rst  $38
    nop
    rra
    nop
    rst  $28
    ld   a, [$FFC7]
    nop
    cp   $01
    ld   e, $59
    inc  e
    ld   [bc], a
    nop
    inc  c
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  nz
    ld   hl, label_21E7
    rst  $20
    ld   hl, label_22E7
    ld   h, [hl]
    dec  h
    ld   l, h
    ld   l, e
    ld   a, b
    ld   d, e
    ld   a, a
    ld   h, a
    ld   [hl], b
    sbc  a, b
    db   $FC ; Undefined instruction
    rst  $20
    ld   [$FF87], a
    ld    hl, sp+$7F
    inc  c
    ld   a, [$E202]
    ld   [bc], a
    add  a, a
    add  a, a
    rst  $18
    rst  $18
    ld   bc, $FC43
    ld   hl, label_10DE
    sbc  a, [hl]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rra
    ccf
    ld   b, a
    adc  a, a
    pop  hl
    add  a, l
    ld   a, [$FF00+C]
    or   a
    add  a, h
    rst  $10
    call nz, label_E8EF
    rst  $38
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
    ccf
    ld   a, a
    rra
    ld   a, a
    ld   [hl], b
    ld   a, b
    ld   e, a
    ld   a, a
    ld   c, h
    ld   a, [hl]
    ld   [bc], a
    ld   a, a
    rlca
    ld   a, a
    ld   c, $FF
    inc  e
    rst  $38
    jr   label_C074F
    ld   l, [hl]
    ld   [hl], b
    sbc  a, a
    ret  nz
    ld   b, $00
    nop
    add  a, b
    pop  bc
    db   $E3 ; Undefined instruction
    ld   a, h
    cp   $70
    ld    hl, sp+$6C
    xor  $77
    ld   a, b
    ld   e, e
    ld   a, b
    ld   c, l
    ld   e, h
    and  [hl]
    adc  a, $72
    add  a, a
    or   e
    rlca
    ld   h, e
    rlca
    rlca
    rrca
    cp   a
    ccf
    rst  $30
    rlca
    db   $FD ; Undefined instruction
    ld   bc, $007E
    ccf
    nop
    rra
    add  a, b
    rra
    add  a, b
    rra
    add  a, b
    add  a, e
    sbc  a, $80
    rst  $18
    pop  bc
    rst  $28
    ret  nz
    rst  $28
    ld   b, b
    ld   a, e
    ld   l, b
    ld   a, l
    db   $FC ; Undefined instruction
    ld   a, a
    cp   [hl]
    ccf
    db   $FC ; Undefined instruction
    inc  hl
    ret  nz
    inc  a
    db   $E3 ; Undefined instruction
    nop
    ld   a, [$FF8F]
    cp   c
    add  a, b
    ld   e, a

label_C079B::
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, [$FF3C]
    jr   nz, label_C079B
    nop
    ld    hl, sp+$00
    pop  af
    ld   bc, label_3E3
    adc  a, a
    rrca
    add  hl, sp
    ccf
    pop  hl
    rst  $38
    ld   l, [hl]
    ld   h, b
    ld   e, [hl]
    ret  nz
    call c, label_BFC0
    adc  a, a
    sbc  a, c
    or   c
    cp   e
    jp   label_8372
    ld   [hl], d
    inc  bc
    ld   a, a
    ld   a, a
    ld   a, b
    ld   a, a
    pop  hl
    rst  $38
    add  a, d
    rst  $38
    inc  b
    cp   $04
    db   $FC ; Undefined instruction
    ld   [label_10F8], sp
    ld   a, [$FFF1]
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $20
    nop
    add  a, c
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    ld   a, [label_3CF8]
    db   $FC ; Undefined instruction
    ld   e, $FE
    rrca
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    rlca
    rst  $38
    rlca
    rst  $38
    rra
    ld   e, a
    rst  $18
    sbc  a, a
    rst  8
    sbc  a, a
    rst  8
    rrca
    adc  a, a
    rra
    rra
    rra
    cpl
    cpl
    rst  $28
    rst  8
    add  a, [hl]
    rst  8
    add  a, b
    rst  $18
    sbc  a, [hl]
    add  a, b
    cp   a
    add  a, b
    adc  a, a
    ret  nz
    ret  nz
    ld   [$FFF0], a
    ld    hl, sp+$FC
    rst  $38
    inc  a
    cp   $F0
    ld    hl, sp+$03
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    add  a, b
    nop
    ccf
    ccf
    db   $10 ; Undefined instruction
    dec  e
    ld   [de], a
    inc  c
    ld   a, [bc]
    ld   c, $09
    inc  b
    dec  b
    ld   b, $07
    inc  bc
    inc  bc
    rst  $28
    rst  $38
    ld   a, [$FFFF]
    sub  a, b
    ccf
    call nz, label_E21F
    dec  bc
    ld   h, l
    add  hl, bc
    ld   h, [hl]
    ld   [label_80E], sp
    jp   label_82E7
    add  a, a
    jp   nz, label_C646
    ld   c, [hl]
    xor  $2F
    cp   $36
    db   $FD ; Undefined instruction
    add  a, l
    ld   a, [hl]
    ld   c, a
    ld   h, h
    rlca
    sbc  a, h
    rra
    dec  [hl]
    ld   h, a
    ld   h, $C7
    db   $E4 ; Undefined instruction
    ld   b, $C8
    inc  c
    ld    hl, sp+$F8
    inc  bc
    rst  0
    ld   h, b
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
    nop
    nop
    add  a, b
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    dec  bc
    nop
    rrca
    ld   bc, label_71F
    rst  $38
    ld   b, $FF
    ld   c, $FE
    rrca
    rst  $38
    inc  e
    cp   $3C
    db   $FD ; Undefined instruction
    ld   a, b
    rst  $38
    di
    rst  $38
    ld   c, a
    rra
    rst  $18
    rra
    rra
    ccf
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
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
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
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld    hl, sp+$FC
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
    ret  nz
    ld   [$FFFE], a
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   c, $FF
    ld   a, [$FF27]
    ld   [rNR12], a
    jr   nc, label_C08FF
    jr   label_C0900
    rrca
    inc  b
    ld   c, $02
    ld   c, $02

label_C08FF::
    rlca

label_C0900::
    inc  hl
    ld   a, b
    rla
    ld   d, b
    ld   e, $5E
    ld   l, c
    adc  a, a
    db   $E8 ; add  sp, d
    rrca
    db   $E4 ; Undefined instruction
    ld   c, $64
    ld   c, $04
    rrca
    xor  h
    ld   hl, label_10C7
    rst  0
    ld   [$888B], sp
    ret  nz
    ld    hl, sp+$7C
    rst  $38
    inc  hl
    ccf
    ld   bc, label_C2007
    ld    hl, sp+$98
    cp   [hl]
    inc  h
    ld   c, a
    ld   h, $47
    ld   sp, label_C3247
    call nz, label_C432
    add  a, e
    call nz, label_1F03
    rlca
    ccf
    rrca
    ei
    rrca
    ei
    rra
    di
    cp   a
    db   $E3 ; Undefined instruction
    ld   a, a
    rst  $20
    ld   a, a
    ld   h, a
    inc  c
    db   $FC ; Undefined instruction
    ld   a, [$FFF8]
    nop
    nop
    nop
    add  a, e
    add  a, b
    rst  $38
    ld    hl, sp+$FF
    cp   $FF
    rst  $38
    rst  $38
    ld   bc, $0107
    inc  bc
    ld   bc, $0083
    inc  bc
    nop
    inc  bc
    nop
    add  a, a
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   [de], a
    sub  a, a
    ld   e, d
    db   $E3 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    inc  bc
    cp   d
    add  a, e
    sub  a, d
    add  a, e
    add  a, d
    add  a, a
    add  a, l
    call label_F1E5
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
    add  a, c
    nop
    add  a, e
    nop
    add  a, e
    nop
    rst  0
    nop
    rst  $38
    rst  8
    ret  z
    ld   h, a
    ld   a, [$FF32]
    ld   a, [$FF18]
    ld   sp, hl
    dec  de
    cp   $0C
    db   $FC ; Undefined instruction
    inc  e
    cp   $3E
    cp   $23
    ld   a, a
    ld   b, e
    cp   a
    ld   d, e
    sbc  a, a
    db   $D3 ; Undefined instruction
    rra
    rst  $10
    rra
    sbc  a, a
    ccf
    rrca
    cpl
    rrca
    ld   l, a
    sbc  a, l
    add  a, c
    sbc  a, h
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    rst  0
    add  a, e
    ld   a, e
    rst  $30
    rlca
    rlca
    rrca
    rra
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FF7F]
    rst  $38
    ld   a, [$FF00+C]
    ld   [$FFF7], a
    ld   [$FFB9], a
    ld   a, [$FF18]
    ld    hl, sp+$1F
    rst  $38
    rrca
    rst  $38
    rlca
    adc  a, a
    rst  $18
    rst  8
    rra
    sbc  a, a
    ccf
    rra
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    db   $FD ; Undefined instruction
    ld   h, b
    rst  $38
    jr   nc, label_C09E5
    ld   e, $FF
    adc  a, e
    rst  $38
    ld   l, c
    ld   sp, hl
    add  hl, bc
    sbc  a, c
    nop
    ld   [$F800], sp
    add  a, b
    rst  $38
    ld   h, b
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    ld   h, d
    rst  $38
    add  a, c
    rst  $38
    nop
    rst  $38
    ret  nz
    ld   a, [$FFF0]
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rra
    nop
    rst  $28
    ld   a, [$FFC7]
    nop
    cp   b
    inc  bc
    ld   a, h
    rst  $38
    ld   [bc], a
    inc  bc
    nop
    nop
    add  a, b
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  nz
    jp   label_CE78
    jr   nc, label_C0A24
    rra
    rst  $28
    sbc  a, a
    cp   a
    adc  a, a
    ccf
    ret  nz
    ld    hl, sp+$E7
    ld   [$FFF0], a
    db   $FC ; Undefined instruction
    ld   h, b
    db   $FC ; Undefined instruction
    ld   [$FFF8], a
    pop  hl
    reti
    pop  hl
    inc  sp
    jp   label_7E7
    ret
    rrca
    ld   de, $F03F
    ld    hl, sp+$FF
    rst  $38
    sub  a, b
    ccf
    call nz, label_E21F
    dec  bc
    ld   h, l
    add  hl, bc
    ld   h, [hl]
    ld   [label_80E], sp
    inc  hl
    rst  $38
    add  a, d
    rst  $30
    jp   nz, label_C646
    ld   c, [hl]
    xor  $2F
    cp   $36
    db   $FD ; Undefined instruction
    add  a, l
    ld   a, [hl]
    ld   c, a
    inc  bc
    ccf
    nop
    ccf
    ld   [bc], a
    ccf
    ld   b, $3F
    ld   b, $7F
    ld   c, $FF
    sbc  a, h
    rst  $38
    ret  c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    cp   $F9
    db   $FC ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    di
    ld   sp, hl
    ld   a, [$FF00+C]
    rst  $38
    rst  $38
    pop  bc
    rst  $38
    ld   a, h
    nop
    call z, label_F900
    pop  hl
    ei
    ldi  [hl], a
    di
    ldi  [hl], a

label_C0A8E::
    ld   a, [$FFC3]
    add  a, b
    rst  8
    ld   a, [$FFFE]
    ld   e, $FF
    ld   h, e
    rrca
    ret  nz
    jp   label_C27A0
    and  b
    ld   h, [hl]
    jr   nz, label_C0A8E
    inc  bc
    ccf
    nop
    ccf
    ld   [bc], a
    cp   a
    add  a, $FF
    ld   a, [hl]
    rst  $38

label_C0AAA::
    ld   e, $FF
    rlca
    ld   a, a
    inc  bc
    rst  $38
    nop
    nop
    add  a, b
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    rst  $38
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    pop  bc
    ld   bc, $0000
    nop
    nop
    ld   b, b
    nop
    pop  af
    nop
    rst  $38
    nop
    rra
    ld   h, b
    daa
    jr   label_C0AAA
    call nz, label_0
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   sp, label_FC0
    ld   a, [$FF00]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2300
    nop
    ld   a, [hl]

label_C0AE5::
    ld   bc, label_1FE0
    ret  nz
    ccf
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
    ld   b, h
    rst  $38
    jr   z, label_C0AF8
    db   $10 ; Undefined instruction
    jr   z, label_C0AFC
    ld   b, h

label_C0AFE::
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF0F]
    ret  nz
    ccf
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    add  a, b
    add  hl, sp
    add  hl, sp
    rst  $18
    nop
    db   $FC ; Undefined instruction
    inc  bc
    jr   nc, label_C0AE5
    nop
    rst  $38
    nop
    cp   $00
    ld   a, b
    rlca
    rlca
    add  a, a
    add  a, a
    add  a, e
    ld   a, h
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    ld   a, [$FF00+C]
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rrca
    ld   h, b
    ld   h, b
    ld   a, c
    nop
    inc  bc
    nop
    inc  sp
    nop
    sub  a, b
    nop
    jp   label_FB00
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    add  a, e
    nop
    ret  nz
    nop
    ld   e, $00
    rra
    nop
    inc  h
    nop
    ld   [hl], b
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, a
    nop
    rra
    nop
    nop
    nop
    inc  a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   h, [hl]
    nop
    ld   d, $00
    ld    hl, sp+$00
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
    nop
    rst  $38
    add  a, b
    ld   a, a
    db   $3A ; ldd  a, [hl]
    rst  0
    ld   a, a
    add  a, c
    rst  $38
    nop
    adc  a, a
    ld   a, [$FFBF]
    ld   b, b
    rst  $38
    nop
    pop  bc
    rst  $38
    pop  af
    rst  $28
    ei
    rst  0
    rst  $38
    add  a, e

label_C0B98::
    rst  $38
    add  a, b
    rst  $20
    jr   label_C0B8C
    db   $10 ; Undefined instruction
    nop
    inc  a
    jp   label_807F
    rrca
    ld   a, [$FFCF]
    jr   c, label_C0B98
    inc  e
    rst  $38
    ld   [$00FF], sp
    rst  $38
    nop
    add  a, a
    ld    hl, sp+$CF
    ld   a, [$FFDE]
    ld   h, c
    cp   $41
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    inc  bc
    cp   $1E
    ld   a, [$F17E]
    rst  $38
    rst  $10
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $C7FF
    dec  a
    daa
    ld   a, h
    ld   [hl], a
    ld   a, h
    ld   a, a
    ld   a, [hl]
    ld   a, a
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    ret  nz
    rst  $38
    ld   sp, hl
    rst  $28
    ei
    rst  8
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    rst  $38
    cp   a
    cp   b
    cpl
    ld   l, $13
    rra

label_C0BF6::
    cp   e
    cp   a
    cp   e
    cp   a
    cp   a
    cp   a
    ld   a, a
    ld   a, a
    ld   a, a
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
    ret  nz
    ccf
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
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    ld    hl, sp+$07
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
    rst  $38
    ld   a, [$FF0F]
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    cp   $01
    ld    hl, sp+$07
    add  a, b
    ld   a, a
    nop
    rst  $38
    cp   $01
    ld    hl, sp+$07
    ld   a, [$FF0F]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, b
    nop
    jr   nz, label_C0C6C

label_C0C6C::
    ld   e, c
    jr   nz, label_C0BF6
    ld   a, b
    rra
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
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
    ld   a, a
    add  a, b
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    ld   a, [$FF00]
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
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF00]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    ld   hl, label_2F00
    db   $10 ; Undefined instruction
    inc  e
    ld   h, c
    ld   e, $C0
    ccf
    ld   a, a
    add  a, b
    rra

label_C0CC3::
    ld   [rIF], a
    ld   a, [$FF07]
    ld    hl, sp+$00
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
    rra
    ld   [rSB], a
    cp   $00
    rst  $38
    ccf
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
    cp   $00
    jr   c, label_C0CF4

label_C0CF4::
    nop
    nop
    nop
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
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00

label_C0D0E::
    ld   a, [$FF00]
    or   c
    ld   sp, label_C3070
    ld   [$FFE0], a
    ret  nz
    ret  nz
    ld   c, $0E
    rra
    rra
    rra
    rra
    ccf
    ccf
    db   $ED ; Undefined instruction
    ld  [$FF00+C], a
    and  $E1
    ld   h, e
    ld   h, b
    inc  bc
    nop
    ld   bc, label_F00
    ld   c, $1F
    rra
    sbc  a, a
    sbc  a, a
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    ccf
    ret  nz
    cp   a
    ld   b, b
    sbc  a, a
    ld   h, b
    rst  $18
    jr   nz, label_C0D0E
    jr   nc, label_C0D73
    ld   [bc], a
    rla
    rlca
    cpl
    rrca
    cpl
    rrca
    cpl
    rrca
    cpl
    rrca

label_C0D4C::
    xor  a
    rrca
    and  $06
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    rra
    rra
    ld   c, $0E
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, a

label_C0D61::
    sbc  a, a
    sbc  a, a
    sbc  a, a
    adc  a, a
    adc  a, a
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    call z, label_E8B0

label_C0D73::
    sub  a, b
    db   $E8 ; add  sp, d
    sub  a, b
    ld   h, b
    jr   label_C0DD9
    jr   label_C0DDB
    jr   label_C0DDD
    jr   label_C0D61
    sbc  a, b
    ld   [rJOYP], a
    ld   [rJOYP], a
    pop  hl

label_C0D85::
    ld   bc, label_3F3
    di
    inc  bc
    di
    inc  bc
    ei
    inc  bc
    ld   sp, hl
    ld   bc, $0101
    inc  bc
    inc  bc
    add  a, e
    add  a, e
    jp   label_E3C3
    db   $E3 ; Undefined instruction
    pop  af
    pop  af
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    rst  0
    rst  0
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    xor  $EF
    xor  $EF
    call nz, label_7C7
    nop
    rrca
    nop
    daa
    ret  c
    daa
    ret  c
    rlca
    ld    hl, sp+$07
    ld    hl, sp+$4F
    or   b
    rst  8
    jr   nc, label_C0D4C
    ld   [hl], b
    sbc  a, a
    ld   h, b
    db   $E4 ; Undefined instruction
    jr   label_C0D85
    inc  a
    add  a, c
    ld   a, [hl]
    add  a, b
    ld   a, a
    nop
    rst  $38
    jr   nz, label_C0DEB
    inc  c

label_C0DCD::
    inc  bc
    ld   [bc], a
    ld   bc, $E1E1
    rlca
    rlca
    adc  a, a
    rrca
    ld   h, b
    add  a, a
    inc  e

label_C0DD9::
    db   $E3 ; Undefined instruction
    ld   bc, label_C0AFE

label_C0DDD::
    add  a, h
    nop
    nop
    rst  $38
    ld   a, [$FFCE]
    pop  af
    jr   label_C0DCD
    nop
    rst  $38
    nop
    rst  $38
    sub  a, b

label_C0DEB::
    rrca
    inc  c
    inc  bc
    ld   b, $00
    rla
    db   $E8 ; add  sp, d
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_1FE
    cp   $00
    rst  $38
    ld   c, h
    add  a, e
    ld   bc, rJOYP
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
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
    rrca
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
    rst  $38
    rst  $38
    rst  $38
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
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    ld   a, [$FF0F]
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    stop
    add  a, b
    nop
    ldi  [hl], a
    nop
    adc  a, b
    nop
    ld   d, l
    nop
    or   d
    nop
    ld   l, a
    nop
    rst  $38
    ld   bc, label_2FE
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    db   $FD ; Undefined instruction
    dec  b
    cp   $02
    rst  $38
    ld   bc, $C0FE
    dec  a
    ld   hl, $D3DB
    dec  e
    ld   de, label_111D
    db   $D1
    pop  de
    dec  a
    ld   hl, $C0FE
    nop
    nop
    sbc  a, h
    sbc  a, h
    or   [hl]
    or   [hl]
    sbc  a, [hl]
    sbc  a, [hl]
    add  a, [hl]
    add  a, [hl]
    or   [hl]
    or   [hl]
    sbc  a, l
    sbc  a, h
    ld   h, e
    nop
    nop
    nop
    ld   [hl], c
    ld   [hl], c
    db   $DB
    db   $DB
    ld   a, b
    ld   a, b
    jr   label_C0EA2
    db   $DB
    db   $DB
    ld   [hl], l
    ld   [hl], c
    add  a, d
    inc  c
    nop
    nop
    ret  nz
    ret  nz
    ld   h, c
    ld   h, c
    ret  nz
    ret  nz
    ld   h, b
    ld   h, b
    ld   l, h
    ld   l, h
    call z, label_8CC
    ld   [$0000], sp

label_C0EA2::
    adc  a, $CE
    db   $DB
    db   $DB
    rst  8
    rst  8
    jp   label_DBC3
    db   $DB
    adc  a, $CE
    nop
    nop
    nop
    nop
    jr   c, label_C0EEC
    ld   l, l
    ld   l, l
    inc  a
    inc  a
    dec  c
    dec  c
    ld   l, l
    ld   l, l
    jr   c, label_C0EF6
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    or   b
    or   b
    ld   [$FFE0], a
    or   b
    or   b
    or   b
    or   b
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    call label_CCCD
    call z, label_EDED
    db   $DD
    db   $CD
    call label_CDCD
    call label_0
    nop
    nop
    add  a, b
    add  a, b
    dec  l
    dec  l
    cp   [hl]
    cp   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]

label_C0EEC::
    or   [hl]
    or   [hl]
    nop
    nop
    ld   bc, $C100
    ret  nz
    xor  $EE

label_C0EF6::
    db   $DB
    db   $DB
    rst  $18
    rst  $18
    ret  c
    ret  c
    rst  8
    rst  8
    nop
    jr   nc, label_C0F01

label_C0F01::
    nop
    add  a, c
    nop
    ld   e, b
    ld   e, b
    ld   a, l
    ld   a, l

label_C0F08::
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, h
    ld   l, h
    sub  a, e
    nop
    rst  8
    nop
    inc  [hl]
    jr   nc, label_C0F08
    di
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    di
    di
    inc  c
    nop

label_C0F20::
    rst  $38
    nop
    ld   a, a
    nop
    cp   a
    add  a, b
    rst  $18
    ret  nz
    rst  $18
    ret  nz
    rst  $18
    ret  nz
    cp   a
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
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
    rst  $38
    nop
    ccf
    nop
    rrca
    nop
    rlca
    nop
    rlca
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
    ld   [label_1E00], sp
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    nop
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
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_F00
    nop
    rrca
    nop
    rra
    nop
    ld   a, a
    nop
    nop
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, h
    nop
    jr   nc, label_C0FA4

label_C0FA4::
    nop
    nop
    nop
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
    ld   b, h
    rst  $38
    jr   z, label_C0FB8
    db   $10 ; Undefined instruction
    jr   z, label_C0FBC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    stop
    rst  $28
    nop
    ld   a, a
    nop
    di
    inc  c
    ret  nz
    ccf
    nop
    rrca
    nop
    jp   label_3F
    ld    hl, sp+$00
    add  a, b
    nop
    ld   bc, $C000
    nop
    ld   a, [$FF00]
    rrca
    ld   a, [$FF00]
    ld   [$FF80], a
    nop
    pop  af
    nop
    rrca
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, b
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   bc, label_38C0
    nop
    cp   $00
    jp   label_0
    nop
    nop
    nop
    ld   bc, label_F00
    nop
    ld    hl, sp+$06
    nop
    db   $E3 ; Undefined instruction
    nop
    ld    hl, sp+$00
    pop  hl
    nop
    sbc  a, a
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    nop
    ccf
    ccf
    nop
    rst  0
    nop
    rra
    nop
    db   $FC ; Undefined instruction
    nop
    pop  af
    inc  c
    rst  8
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    adc  a, a
    nop
    inc  bc
    nop
    nop
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    ld   [rIE], a
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
    inc  bc
    nop
    ld   e, $00
    ld   [rJOYP], a
    ld   bc, rJOYP
    nop
    nop
    stop
    rst  $28
    nop
    ld   a, a
    nop
    di
    inc  c
    ret  nz
    ccf
    nop
    ccf
    nop
    rst  $38
    ccf
    nop
    ld    hl, sp+$00
    add  a, b
    nop
    ld   bc, $C000
    nop
    ld   a, [$FF00]
    rrca
    ld   a, [$FF00]
    rst  $38
    add  a, b
    nop
    pop  af
    nop
    rrca
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, b
    nop
    nop
    nop
    ld   [rJOYP], a
    nop
    rst  $38
    jr   c, label_C10B4

label_C10B4::
    cp   $00
    jp   label_0
    nop
    nop
    nop
    ld   bc, label_F00
    nop
    nop
    rst  8
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    rrca
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    nop
    ccf
    ccf
    nop
    jp   label_F00
    nop
    inc  a
    nop
    pop  af
    inc  c
    rst  8
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $00F0
    adc  a, a
    nop
    inc  bc
    nop
    nop
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    ld   [rIE], a
    rst  $38
    rst  $38
    ld    hl, sp+$04
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    inc  bc
    nop
    ld   e, $00
    ld   [rJOYP], a

label_C10FF::
    ld   bc, rJOYP
    nop
    rst  $38
    nop
    nop
    stop
    rst  $28
    nop
    ld   a, a
    nop
    di
    inc  c
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    ccf
    nop
    ld    hl, sp+$00
    add  a, b
    nop
    ld   bc, $C000
    nop
    ld   a, [$FF00]
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    nop
    pop  af
    nop
    rrca
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, b
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_C1136

label_C1136::
    cp   $00
    jp   label_0
    nop
    nop
    nop
    ld   bc, $0000
    rra
    nop
    inc  c
    nop
    ld   [rJOYP], a
    add  a, a
    nop
    ccf
    nop
    ld    hl, sp+$00
    nop
    ccf
    ccf
    rrca
    ld   a, [$FF00]
    rra
    nop
    db   $FC ; Undefined instruction
    nop
    pop  af
    inc  c
    rst  8
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    ld   [hl], b
    ld   bc, $008C
    inc  bc
    nop
    nop
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    ld   [rIE], a
    rst  $38
    rst  $38
    rrca
    nop
    ld    hl, sp+$07
    nop
    rst  $38
    nop
    ld   a, a
    nop
    inc  bc
    nop
    ld   e, $00
    ld   [rJOYP], a
    ld   bc, rJOYP
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    stop
    rst  $28
    nop
    ld   a, a
    nop
    di
    inc  c
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ccf
    nop
    ld    hl, sp+$00
    add  a, b
    nop
    ld   bc, $C000
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    nop
    pop  af
    nop
    rrca
    nop
    db   $FC ; Undefined instruction
    nop
    ld   h, b
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_C11B8

label_C11B8::
    cp   $00
    jp   label_0
    nop
    nop
    nop
    ret  nz
    ccf
    nop
    rrca
    nop
    ret  nz
    nop
    add  a, a
    nop
    rra
    nop
    ld    hl, sp+$00
    nop
    ccf
    ccf
    ld   a, [$FF00]
    inc  c
    or   e
    nop
    ld   a, h
    nop
    pop  af
    inc  c
    rst  8
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   [hl], b
    nop
    adc  a, h
    nop

label_C11E5::
    inc  bc
    nop
    nop
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    ld   [rIE], a
    rst  $38
    rst  $38
    ld   bc, label_F00
    nop
    ld   a, b
    add  a, a
    nop
    ld   a, a
    nop
    inc  bc
    nop
    ld   e, $00
    ld   [rJOYP], a
    ld   bc, $00FF
    ld   a, [$FF0F]
    ret  nz
    ccf
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    add  a, b
    add  hl, sp
    add  hl, sp
    rst  $18
    nop
    db   $FC ; Undefined instruction
    inc  bc
    jr   nc, label_C11E5
    nop
    rst  $38
    nop
    cp   $00
    ld   a, b
    rlca
    rlca
    add  a, a
    add  a, a
    add  a, e
    ld   a, h
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    ld   a, [$FF00+C]
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rrca
    ld   h, b
    ld   h, b
    ld   a, c
    nop
    inc  bc
    nop
    inc  sp
    nop
    sub  a, b
    nop
    jp   label_FB00
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    add  a, e
    nop
    ret  nz
    nop
    ld   e, $00
    rra
    nop
    inc  h
    nop
    ld   [hl], b
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, a
    nop
    rra
    nop
    nop

label_C1265::
    nop
    inc  a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   h, [hl]
    nop
    ld   d, $00
    ld    hl, sp+$00
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
    ld   a, [$FF0F]
    ret  nz
    ccf
    nop
    ld    hl, sp+$00
    ld   [$FF03], a
    add  a, e
    ld   [hl], a
    ld   [hl], a
    rst  $30
    rst  $30
    rst  $18
    nop
    db   $FC ; Undefined instruction
    inc  bc
    jr   nc, label_C1265
    nop
    cp   $00
    ld   a, b
    ld   bc, label_301
    inc  bc
    ret  nz
    ret  nz
    add  a, e
    ld   a, h
    ld   bc, $00FE
    rst  $38
    nop
    inc  bc
    ld   a, b
    ld   a, b
    ld    hl, sp+$F8
    add  a, e
    add  a, e
    rlca
    rlca
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rrca
    jr   nz, label_C12DE
    ld   h, [hl]
    ld   h, [hl]
    inc  bc
    nop
    adc  a, h
    nop
    push bc
    nop
    ld   sp, hl
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   c, $00
    rrca
    nop
    ld   h, $00
    ld   [hl], b
    nop
    rst  $38
    nop

label_C12DA::
    rst  $38
    nop
    rst  $38
    nop

label_C12DE::
    rst  $38
    nop
    nop
    nop
    inc  a
    nop

label_C12E4::
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
    ld    hl, sp+$00
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
    ld   a, [$FF0F]
    ret  nz
    jr   c, label_C130A
    db   $E3 ; Undefined instruction
    rlca
    add  a, a

label_C130A::
    scf
    scf
    ld   [hl], e
    ld   [hl], e
    inc  c
    inc  c
    rst  $18
    nop
    db   $FC ; Undefined instruction
    inc  bc
    jr   nc, label_C12E4
    nop
    jr   nc, label_C12DA
    pop  bc
    ret  z
    ret  z
    rlca
    rlca
    rlca
    rlca
    add  a, e
    ld   a, h
    ld   bc, $00FE
    inc  bc
    ld   a, [$FFF0]
    di
    di
    nop
    nop
    add  a, a
    add  a, a
    sbc  a, a
    sbc  a, a
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    nop
    ld   a, a
    nop
    rlca
    jr   nz, label_C135C
    adc  a, d
    adc  a, d
    call z, label_E5CC
    nop
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
    nop
    rst  $38
    nop
    inc  sp
    nop
    ld   a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_C135C::
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ret  nz
    nop
    scf
    scf
    ld   [hl], h
    ld   [hl], h
    add  a, e
    add  a, e
    pop  hl
    pop  hl
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $18
    nop
    cp   $00
    jr   nc, label_C1396

label_C1396::
    add  a, b
    add  a, b
    inc  bc
    inc  bc
    rlca
    rlca
    ldd  [hl], a
    ldd  [hl], a
    ld    hl, sp+$F8
    rst  $38
    nop
    inc  bc
    nop
    ld    hl, sp+$F8
    ld   bc, $A101
    and  c
    sbc  a, h
    sbc  a, h
    ccf
    ccf
    rst  $38
    rst  $38
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    nop
    nop
    nop
    dec  d
    dec  d
    jr   c, label_C13F4
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_C13F4::
    rst  $38
    nop
    rst  $38
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
    ld   bc, label_600
    ld   bc, label_708
    jr   c, label_C1411
    jr   nz, label_C142B
    ld   l, $11
    ld   e, $05
    dec  hl

label_C1411::
    ld   d, $45
    dec  sp
    add  a, d
    ld   a, l
    add  a, a
    ld   a, b
    ld   a, c
    ld   b, $11
    ld   c, $20
    rra
    ccf
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   l, [hl]
    ld   a, [$FF05]
    cp   $1D
    ld  [$FF00+C], a
    ld   a, $D0
    ld    hl, sp+$10
    ld    hl, sp+$50
    db   $FC ; Undefined instruction
    ld   e, b
    db   $FC ; Undefined instruction
    ld    hl, sp+$78
    ld   a, [$FFF0]

label_C1437::
    nop
    ld   [$FFC0], a
    ld   a, [$FFC0]
    ret  z
    jr   nc, label_C1437
    nop
    ld   bc, label_600
    ld   bc, label_708
    jr   c, label_C144F
    jr   nz, label_C1469
    ld   l, $11
    ld   e, $05
    dec  de

label_C144F::
    ld   b, $25
    dec  de
    ldi  [hl], a
    dec  e
    ld   b, e
    inc  a
    ld   b, a
    jr   c, label_C1496
    ld   [bc], a
    ld   [label_1007], sp
    rrca
    rra
    nop
    ld   a, [$FF00]
    ld   l, h
    ld   a, [$FF06]
    db   $FC ; Undefined instruction
    ld   a, [de]
    db   $E4 ; Undefined instruction
    ld   a, $D0
    ld    hl, sp+$10
    ld    hl, sp+$50
    db   $FC ; Undefined instruction
    ld   e, b
    db   $FC ; Undefined instruction
    ld    hl, sp+$78
    ld   a, [$FFF0]
    nop
    ld   [$FFC0], a
    ld   [$FFC0], a
    ld   [rJOYP], a
    db   $10 ; Undefined instruction

label_C147E::
    ld   a, [$FF00]
    ld   bc, label_1E00
    ld   bc, label_F10
    db   $10 ; Undefined instruction
    ld   d, $09
    rrca
    ld   [bc], a
    rla
    ld   a, [bc]
    daa
    dec  de
    daa
    add  hl, de
    ld   b, d
    dec  a
    ld   b, e
    inc  a

label_C1496::
    daa
    jr   label_C14B5
    inc  bc
    ld   [label_1007], sp
    rrca
    rra
    nop
    ld   [rJOYP], a
    ld   a, b
    ld   [rDIV], a
    ld    hl, sp+$06
    db   $FC ; Undefined instruction
    ld   a, [bc]
    db   $F4 ; Undefined instruction
    ld   a, [de]
    db   $E4 ; Undefined instruction
    ld   a, h
    sub  a, b
    ld    hl, sp+$50
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    ld    hl, sp+$78

label_C14B5::
    ld   [$FFF0], a
    nop
    ld   e, b
    or   b
    ld   a, b
    or   b
    jr   nc, label_C147E

label_C14BE::
    ld   a, [$FF00]
    nop
    nop
    rrca
    nop
    ld   [label_807], sp
    rlca
    dec  bc
    inc  b
    rlca
    ld   bc, label_50B
    inc  de
    dec  c
    inc  de
    inc  c
    ld   hl, label_211E
    ld   e, $13
    inc  c
    ld   c, $01
    ld   [label_1007], sp
    rrca
    rra
    nop
    ld   a, [$FF00]
    inc  a
    ld   a, [$FF02]
    db   $FC ; Undefined instruction
    inc  bc
    cp   $05
    ld   a, [label_C328D]
    cp   [hl]
    ld   c, b
    db   $FC ; Undefined instruction
    xor  b
    cp   $EC
    ld   a, [hl]
    db   $FC ; Undefined instruction
    cp   h
    ld   [hl], b
    ld    hl, sp+$00
    inc  l
    ret  c
    inc  a
    ret  c
    jr   c, label_C14BE
    ld   a, [$FF00]
    rrca
    nop
    ld   a, a
    rlca
    rst  $38
    nop
    ld   a, a
    rlca
    rst  $38
    inc  c
    ld   a, a
    rla
    cpl
    dec  e
    ld   d, $0F
    ccf
    nop
    ld   d, h
    dec  sp
    ld   a, e
    scf
    jr   c, label_C151F
    ccf
    jr   label_C154A
    inc  e
    rla
    inc  c
    ld   c, $01
    ret  nz
    nop
    or   b
    ld   b, b
    ld    hl, sp+$90
    ld    hl, sp+$30
    db   $F4 ; Undefined instruction
    xor  b
    or   d
    db   $EC ; Undefined instruction
    and  d
    call c, label_FC
    inc  h
    ret  c
    ld   e, $EC
    sbc  a, $EC
    inc  e
    ld   [$FFFE], a
    inc  c
    ld   a, [$F41C]
    jr   label_C1577
    nop
    rlca
    nop
    rrca
    nop
    rra
    nop
    ccf
    inc  de
    ccf

label_C1549::
    inc  d

label_C154A::
    daa
    rra
    rla
    rrca
    dec  c
    inc  bc
    dec  de
    inc  b
    ld   l, $19
    dec  a
    dec  de
    inc  e
    inc  bc
    rla
    inc  c
    rra
    inc  c
    rla
    inc  c
    ld   c, $01
    ld   a, [$FF00]
    ret  z
    jr   nc, label_C1549

label_C1565::
    jr   label_C1565
    db   $E4 ; Undefined instruction
    cp   $94
    ld   a, [$FF00+C]
    xor  $70
    call c, label_F6E0
    ld   [$F60B], sp
    db   $EB ; Undefined instruction
    or   $0E

label_C1577::
    ld   a, [$FFFE]
    nop
    db   $FD ; Undefined instruction
    ld   c, $FA
    dec  e
    inc  a
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   b, h
    ld   b, h
    jr   z, label_C15B0
    db   $10 ; Undefined instruction
    jr   z, label_C15B4
    ld   b, h
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    ld   b, h
    jr   z, label_C15C0
    db   $10 ; Undefined instruction
    jr   z, label_C15C4
    ld   b, h
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    ld   b, h
    jr   z, label_C15D0
    db   $10 ; Undefined instruction

label_C15AA::
    jr   z, label_C15D4
    ld   b, h
    ld   b, h
    nop
    nop

label_C15B0::
    nop
    nop
    nop
    nop

label_C15B4::
    ld   b, h
    ld   b, h
    jr   z, label_C15E0
    db   $10 ; Undefined instruction
    jr   z, label_C15E4
    ld   b, h
    ld   b, h
    nop
    nop

label_C15C0::
    nop
    nop
    nop
    nop

label_C15C4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C15D0::
    nop
    nop
    nop
    nop

label_C15D4::
    nop
    nop
    ld   bc, $0001
    nop
    inc  b
    inc  b
    ld   [$0008], sp
    nop

label_C15E0::
    nop
    nop
    nop
    nop

label_C15E4::
    nop
    nop
    nop
    nop
    nop
    nop

label_C15EA::
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
    inc  b
    inc  b
    ret  z
    ret  z
    jr   c, label_C1648
    rra
    rra
    rra
    rra
    rrca
    rrca
    rlca
    rlca
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    ld   e, a
    ld   e, a
    add  a, a
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
    nop
    add  a, b
    add  a, b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   label_C1656
    nop
    nop
    ret  nz
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, $DE

label_C1648::
    ret  nz
    ret  nz
    ld   d, b
    ld   d, b
    ld   c, b
    ld   c, b
    ld   c, [hl]
    ld   c, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38

label_C1656::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    ld   c, $0E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [$FFE0], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, $C6
    nop
    nop
    ret  nz
    ret  nz
    ld   h, b
    ld   h, b
    jr   nc, label_C16B6
    jr   label_C16A0
    inc  c
    inc  c
    ld   b, $06
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
    nop
    nop
    nop

label_C16A0::
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   b, b
    ld   b, b
    ld   h, b
    ld   h, b
    jr   nz, label_C16CA
    jr   nc, label_C16DC
    db   $10 ; Undefined instruction
    jr   label_C16C8
    ld   [label_C08], sp
    inc  c
    inc  b
    inc  b

label_C16B6::
    inc  b
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
    ld   bc, $0100
    nop
    inc  bc
    nop
    ld   c, $00
    jr   label_C16CB

label_C16CB::
    jr   label_C16CD

label_C16CD::
    inc  e
    nop
    ld   c, $00
    inc  bc
    nop
    ld   bc, $0100
    nop
    rlca
    nop
    ld   e, $00
    ld   a, h

label_C16DC::
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    ld   bc, label_300
    nop
    ld   e, $00
    jr   c, label_C16E9

label_C16E9::
    jr   nc, label_C16EB

label_C16EB::
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   [hl], b
    nop
    inc  e
    nop
    ld   b, $00
    ld   b, $00
    ld   [bc], a
    nop
    ld   [bc], a
    nop
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
    nop
    nop

label_C170F::
    nop
    nop
    rlca
    nop
    ld   e, $00
    jr   c, label_C1717

label_C1717::
    jr   nc, label_C1719

label_C1719::
    jr   nz, label_C171B

label_C171B::
    ld   h, b
    nop
    ld   b, b
    nop
    ret  nz
    jr   nz, label_C175A
    ld   b, b
    ld   [hl], b
    add  a, b
    ld   [$FF80], a
    ld   [rNR10], a
    ld   [hl], b
    ld   b, b
    ld   [hl], b
    inc  b
    inc  a
    db   $10 ; Undefined instruction
    ld   [label_40E], sp
    rlca
    inc  b
    rlca
    inc  b
    rlca
    db   $10 ; Undefined instruction
    ldi  [hl], a
    ld   a, $00
    jr   c, label_C173F

label_C173F::
    jr   c, label_C1741

label_C1741::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_C175A::
    ld   h, c
    nop
    ccf
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop  hl
    nop
    rst  $38
    nop
    adc  a, $00
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
    ld   bc, label_300
    ld   bc, $0103
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
    inc  c
    nop
    ld   c, $04
    rlca
    ld   [bc], a
    inc  bc
    ld   bc, $0103
    rlca
    ld   [bc], a
    ld   c, $04
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
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   bc, label_F00
    ld   bc, label_F1F
    rrca
    ld   bc, $0001
    ld   bc, $0100
    nop
    nop
    nop
    nop
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
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld    hl, sp+$C0
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ret  nz
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    inc  [hl]
    bit  4, b
    sbc  a, a
    ld   d, h
    xor  e
    ld   [$FF1F], a
    and  b
    ld   e, a
    ret  z
    scf
    and  b
    ld   e, a
    ld   d, b
    xor  a
    ld   b, c
    add  a, d
    inc  b
    pop  bc
    ld   b, b
    and  c
    ldi  [hl], a
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$10
    db   $EC ; Undefined instruction
    add  a, [hl]
    ld   a, c
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    adc  a, c
    db   $76 ; Halt
    ld   e, [hl]
    and  c
    ld   d, l
    xor  d
    ld   a, [$EC05]
    inc  de
    db   $FD ; Undefined instruction
    ccf
    ret  nz
    ccf
    ld   d, b
    cp   a
    sub  a, b
    ld   a, a
    xor  b
    ld   l, a
    add  hl, hl
    rst  $28
    ld   h, $E6
    db   $E4 ; Undefined instruction
    call nz, label_C0667
    nop
    rst  $38
    jr   nz, label_C1843
    ld   h, b
    rst  $38
    and  c
    cp   a
    ld   h, e
    ccf
    push de
    dec  e
    db   $DB
    add  hl, de
    db   $D3 ; Undefined instruction
    ld   de, rJOYP
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    xor  b
    ld   d, a
    ret  z
    scf
    or   $09
    ld   l, d
    sub  a, l
    ld   a, e
    add  a, h
    jr   c, label_C182C
    ld   [bc], a
    ld   [$FF30], a
    ret  nz
    ld   bc, label_7FE
    ld    hl, sp+$59
    and  [hl]
    ld   c, e
    or   h
    rla
    db   $E8 ; add  sp, d
    ld   l, d
    dec  d
    sbc  a, h
    inc  bc
    ld   [$B607], sp
    ld   c, c
    dec  c
    ld   a, [$FF00+C]
    xor  h
    dec  b
    ld   a, [$E51A]
    inc  bc
    db   $FC ; Undefined instruction
    dec  d
    ld   [$F50A], a
    rlca
    db   $FD ; Undefined instruction
    ld   b, $FE
    inc  b
    db   $FC ; Undefined instruction
    add  a, h
    ld   a, h
    add  a, [hl]
    ld   a, h
    add  a, [hl]
    ld   a, h
    add  a, [hl]
    ld   a, h
    add  a, d
    ld   a, [hl]
    jp   label_C03C0
    ld   b, b
    jp   label_8780
    add  a, b
    add  a, a
    add  a, b
    add  a, a
    add  a, b
    add  a, a
    nop
    rlca
    nop
    ld   h, b
    ld   [rSVBK], a
    ld   [rSVBK], a
    ld   [$FFF0], a
    ld   h, b
    ld   [rSVBK], a
    ld   [rSVBK], a
    ld    hl, sp+$70
    ld    hl, sp+$70
    db   $FD ; Undefined instruction
    jr   label_C1933
    jr   label_C192D
    jr   label_C18FF
    ld   [label_838], sp
    jr   nc, label_C18D4
    add  hl, de
    nop
    inc  de
    nop
    rst  $18
    add  a, e
    ld   a, e
    ld   b, a

label_C18D4::
    ld   [hl], l
    cpl
    ld   e, l
    ccf
    ld   sp, hl
    rra
    reti

label_C18DB::
    ccf
    ld   a, [$FF00+C]
    and  $7F
    sub  a, $EF
    dec  c
    di
    ld   h, [hl]
    ld   sp, hl
    add  a, a
    rst  $38
    inc  e
    db   $FC ; Undefined instruction
    or   b
    ld   a, [$FF60]
    ld   [$FFE3], a
    jp   label_27DB
    rst  $20
    sbc  a, c
    jp   label_E1FF
    rst  $38
    jr   c, label_C1939
    inc  c
    rrca
    ld   b, $07
    db   $E3 ; Undefined instruction

label_C18FF::
    db   $E3 ; Undefined instruction
    ld   [hl], h
    adc  a, e
    jr   z, label_C18DB
    ld   d, $E9
    dec  c
    ld   a, [$FF00+C]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38

label_C190E::
    nop
    rst  $38
    ld   d, [hl]
    xor  c
    xor  l
    ld   d, e
    db   $DB
    ld   h, $76
    adc  a, h
    call z, label_D38
    ld    hl, sp+$1B
    ld   a, [$FF1B]
    ld   a, [$FFC3]
    rst  $38
    ld   a, h
    add  a, e
    add  a, [hl]
    ld   bc, label_71B
    ld   a, h
    inc  bc
    rst  $38
    nop
    rst  $18

label_C192D::
    jr   nz, label_C190E
    jr   nz, label_C19AA
    ei
    jp   hl

label_C1933::
    rst  8
    and  a
    add  a, $A3
    ret  nz
    rst  $20

label_C1939::
    jp   label_EC2F
    sbc  a, a
    ld   [hl], b
    rst  $18
    jr   nz, label_C18C8
    ld   b, a
    jp   hl
    db   $EB ; Undefined instruction
    add  hl, de
    rst  $18
    ld   a, a
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $18
    jr   nz, label_C192E
    jr   nz, label_C1951

label_C1951::
    rst  $38
    ret  nz
    rst  $38
    ld   a, [$FF3F]
    ld   sp, hl
    adc  a, [hl]
    dec  e
    ld   b, $C7
    ld   [bc], a
    di
    ld   bc, label_1FB
    ld   a, b
    add  a, h
    push de
    ld   a, [hli]
    ld   [$FF1F], a
    ret  z
    scf
    and  b
    ld   e, a
    ret  nc
    cpl
    and  b
    ld   e, a
    ret  z
    scf
    jr   label_C1979
    ld   d, h
    xor  e
    inc  e
    db   $E3 ; Undefined instruction
    ld   l, $D1
    ld   e, $E1
    ld   c, d
    or   l
    sbc  a, [hl]
    ld   h, c
    inc  l
    db   $D3 ; Undefined instruction
    ld   b, l
    cp   d
    dec  hl
    call nc, label_21DE
    ld   [hl], h
    adc  a, e
    ret  c
    daa
    ld   [$FF1F], a
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    cp   $02
    rst  $38
    ld   bc, label_1FF
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
    nop
    rrca
    nop
    adc  a, a
    nop
    sbc  a, $01
    rst  $38
    add  a, c

label_C19AA::
    db   $FD ; Undefined instruction
    jp   label_E77B
    ccf
    rst  $38
    ld   [hl], b
    ld    hl, sp+$74
    ld    hl, sp+$DC
    db   $E8 ; add  sp, d
    xor  d
    call z, label_8C5F
    dec  a
    sub  a, [hl]

label_C19BC::
    or   [hl]
    inc  bc
    rst  $28
    ld   bc, $0007
    rrca
    ld   bc, label_31F
    ld   a, l
    rlca
    ld   sp, hl
    rrca
    sub  a, $39
    xor  [hl]
    ld   [hl], c
    rst  $18
    ld   [$FFCD], a
    rst  $38
    add  hl, sp
    rst  $38
    db   $EB ; Undefined instruction
    rst  $30
    ld   d, e
    rst  $28
    inc  sp
    rst  $28
    ld   b, e
    cp   a
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra
    and  [hl]
    add  a, $EC
    adc  a, h
    ld   l, b
    adc  a, b
    ld   l, b
    adc  a, b
    ld   l, b
    adc  a, b
    ld   a, h
    adc  a, h
    ld   [hl], a
    add  a, a
    ld   [hl], b
    add  a, b
    inc  de
    ld   de, label_909
    dec  b
    inc  b
    inc  b
    inc  b
    ld   a, h
    inc  b
    ld    hl, sp+$18
    ld   [$FFE0], a
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    add  a, c
    ld   a, a
    rra
    ld   a, [$FF1F]
    ld   a, [$FF9F]
    ld   a, [$FF9F]
    ld   a, [$FF5F]
    ld   [hl], b
    ccf
    jr   nc, label_C19BC

label_C1A1D::
    nop
    rst  $38
    nop
    sbc  a, a
    ld   h, b
    sbc  a, a
    ld   h, b
    adc  a, a
    ld   [hl], b
    xor  a
    ld   [hl], b
    and  a
    ld   a, b
    or   c
    ld   a, [hl]
    jr   z, label_C1A1D
    ld   b, [hl]
    rst  0
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc

label_C1A38::
    ld   a, [$FF0F]
    pop  bc

label_C1A3B::
    ccf
    ld   b, $FE
    jr   c, label_C1A38
    adc  a, a
    ld   [hl], b
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF47]
    ld    hl, sp+$C7
    ld    hl, sp+$43
    db   $FC ; Undefined instruction
    and  c
    ld   a, [hl]
    ld   a, [$FF3F]
    ld   sp, hl
    nop
    db   $FD ; Undefined instruction
    nop
    db   $FD ; Undefined instruction
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
    db   $E4 ; Undefined instruction
    sbc  a, e
    ld   a, [$FF00+C]
    cp   l
    jp   nz, label_E09F
    rst  0
    ld   a, b
    ret  nz
    ld   a, a
    ld   [$FF3F], a
    ret  c
    rra
    sbc  a, h
    ld   h, e
    jr   c, label_C1A3B
    ld   a, [$FF0F]
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   hl, label_C22FE
    db   $FD ; Undefined instruction
    sbc  a, a
    ld   [$FFBC], a
    ret  nz
    cp   b
    ret  nz
    cp   b
    ret  nz
    cp   b
    ret  nz
    cp   b
    ret  nz
    call c, label_CEE0
    ld   a, [$FF87]
    ld   a, a
    ld   [hl], c
    rrca
    inc  e
    inc  bc
    inc  c
    inc  bc
    ld   c, $01
    ld   c, $01
    ld   c, $01
    ld   e, $01
    rst  0
    ld    hl, sp+$C7
    ld    hl, sp+$E3
    db   $FC ; Undefined instruction
    ld   h, c
    cp   $70
    rst  $38
    jr   nc, label_C1AAB
    jr   c, label_C1AAD
    inc  a
    rst  $38
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00
    ld   a, a
    add  a, b
    ccf
    ret  nz
    rra
    ld   [$FF03], a
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    rrca
    nop
    nop
    nop
    ld   e, $00
    ld   bc, $0000
    nop
    nop
    nop
    ld   [bc], a
    nop
    ld   bc, $8000
    nop
    ld   h, b
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ret  z
    ccf
    adc  a, $3F
    ld   l, e
    sbc  a, c
    xor  h
    ld   e, b
    ld   h, [hl]
    sbc  a, h
    and  a
    ld   e, h
    jp   label_C013E
    cp   a
    db   $EC ; Undefined instruction
    sub  a, e
    and  c
    rst  $18
    db   $E3 ; Undefined instruction
    rst  $18
    ld   [hl], c
    rrca
    dec  sp
    rlca
    pop  hl
    rra
    pop  af
    rrca
    db   $FC ; Undefined instruction
    add  a, e
    reti
    reti
    add  a, b
    and  h
    nop
    nop
    add  a, b
    add  a, b
    ld   a, [$FF70]
    ret  z
    ret  z
    add  a, h
    add  a, h
    adc  a, h
    adc  a, h
    jp   label_C3
    inc  b
    nop
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, label_206
    inc  b
    inc  b
    ld   a, [$FF9F]
    ld   a, b
    ld   c, a
    ld   a, h
    rlca
    ld   a, a
    inc  de
    ei
    rst  $30
    rra
    dec  e
    rrca
    add  hl, bc
    ld   l, l

label_C1B4F::
    ld   l, a
    ccf
    ret  nz
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_30FE
    rst  $38
    jr   z, label_C1B4F
    rst  8
    rlca
    ld   [rJOYP], a
    di
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    rlca
    ld    hl, sp+$00
    inc  a
    ret  nz
    push hl
    cp   d
    and  $39
    jp   z, label_9C75
    di
    db   $3A ; ldd  a, [hl]
    push af
    call c, label_27D3
    jr   c, label_C1BE5
    jr   c, label_C1C00
    ld    hl, sp+$7F
    db   $E8 ; add  sp, d
    scf
    db   $E4 ; Undefined instruction
    dec  sp
    ld   a, [$FF00+C]
    ld   sp, hl
    rrca
    cp   $07
    rst  $38
    inc  bc
    rst  $38
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld   h, c
    sbc  a, a
    inc  bc
    rst  $38
    adc  a, $FF
    ld   sp, hl
    cp   $06
    ld    hl, sp+$66
    rst  $38
    ld   h, e
    rst  $38
    pop  bc
    rst  $38
    or   b
    rst  8
    ld   e, h
    add  a, e
    add  a, [hl]
    ld   bc, $0003
    inc  bc
    nop
    rlca
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    add  a, c
    cp   $C3
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   h, e
    db   $FC ; Undefined instruction
    ld   b, e
    db   $FC ; Undefined instruction
    ld   b, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
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
    rst  $38
    rst  $38
    nop
    nop
    nop

label_C1BE5::
    ld   l, d
    nop
    adc  a, [hl]
    nop
    adc  a, d
    nop
    ld   l, d
    nop
    nop
    rst  $38
    rst  $38
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    jr   nz, label_C1C35
    jr   nz, label_C1C37
    jr   nz, label_C1C39
    jr   nz, label_C1C3B
    jr   nz, label_C1C3D
    jr   nz, label_C1C3F

label_C1C00::
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
    rlca
    rst  $38
    ld   [bc], a
    cp   $03
    cp   $7F
    pop  af
    rra
    ld   a, [$FF1F]
    ld    hl, sp+$1F
    di
    inc  a
    rst  $20
    ld   sp, hl
    call z, label_D7A
    rst  $38
    ccf
    sub  a, d
    sub  a, [hl]
    sub  a, [hl]
    sbc  a, [hl]
    call z, label_A08C
    sbc  a, b
    add  a, c
    add  a, b
    add  a, b
    add  a, d
    call nz, label_8084
    jp   nz, label_400
    inc  b
    nop
    nop

label_C1C35::
    nop
    nop

label_C1C37::
    nop
    nop

label_C1C39::
    nop
    nop

label_C1C3B::
    nop
    nop

label_C1C3D::
    nop
    ld   bc, $9F00
    cp   c
    sbc  a, [hl]
    ei
    ld   a, [hl]
    ld   [hl], e
    ld   e, $E3
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$0F
    ld   a, [$FFFF]
    ld   b, h
    rst  0
    ld   b, h
    rst  $10
    ld   b, h
    rst  $10
    ld   d, h
    rst  $10
    ld   b, h
    rst  $10
    ld   c, h
    rst  8
    ld   e, a
    rst  $18
    ld   [hl], c
    ei
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF1B]
    db   $E3 ; Undefined instruction
    dec  sp
    jp   label_E119
    inc  c
    ld   a, [$FF04]
    ld    hl, sp+$87
    ld    hl, sp+$C0
    ld   a, h
    add  a, [hl]
    ld    hl, sp+$0F
    ld   a, [$FF0A]
    push af
    inc  e
    db   $E3 ; Undefined instruction
    sbc  a, h
    db   $E3 ; Undefined instruction
    ld   a, d
    ld   h, l
    inc  a
    ccf
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, $98FF
    ld   [$FFCE], a
    ld   a, [$FF63]
    db   $FC ; Undefined instruction
    inc  sp
    rst  $38
    inc  e
    cp   $06
    rst  $38
    and  c
    rst  $18
    add  a, b
    rst  $38
    inc  bc
    nop
    rlca
    nop
    and  $01
    db   $FC ; Undefined instruction
    add  a, e
    ld   [hl], c
    ld   l, a
    cp   e
    rra
    cp   [hl]
    rst  8
    ld    hl, sp+$FF
    ld   b, e
    db   $FC ; Undefined instruction
    ld   b, e
    db   $FC ; Undefined instruction
    ld   b, e
    db   $FC ; Undefined instruction
    jp   label_C3FC
    db   $FC ; Undefined instruction
    ld   h, c
    cp   $61
    cp   $21
    cp   $E0
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    rst  $38
    rst  $38
    nop

label_C1CD3::
    ld   bc, $EA00
    nop
    xor  e
    nop
    ret  z
    nop
    xor  e
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    add  a, b
    nop
    db   $3A ; ldd  a, [hl]
    nop
    sub  a, d
    nop
    sub  a, d
    nop
    ld   [de], a
    nop
    nop
    rst  $38
    rst  $38
    jr   nz, label_C1D31
    jr   nz, label_C1D33
    jr   nz, label_C1D35
    jr   nz, label_C1D37
    jr   nz, label_C1D39
    jr   nz, label_C1D3B
    jr   nz, label_C1D3D
    jr   nz, label_C1D3F
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_C1CD3
    ld   d, [hl]
    xor  c
    jp   z, label_E135
    ld   h, c
    ret  nz
    ret  nz
    call nz, label_CE8C
    adc  a, [hl]
    adc  a, a
    add  a, a
    rst  0
    add  a, h
    ld   b, b
    ret  nz
    ld   a, b
    ld   [$FFC0], a
    ret  nz
    ld   [$FFC1], a
    ld   [$FFA1], a
    ld   a, [$FFA1]
    ld    hl, sp+$F1
    cp   h
    ld   a, b
    cp   $0C
    rra
    ld   [bc], a
    ld   bc, $0100

label_C1D33::
    ret  nz
    inc  bc

label_C1D35::
    ld   [$FF03], a

label_C1D37::
    jr   nz, label_C1D40

label_C1D39::
    ld   [$FF0B], a

label_C1D3B::
    rst  0
    rra

label_C1D3D::
    inc  c
    ld   e, b

label_C1D3F::
    jr   nc, label_C1D01
    ld   a, a
    rst  $30
    ccf
    ret  z
    ld   a, b
    ld   a, [$FF30]
    db   $76 ; Halt
    ld   a, [$FF00+C]
    di
    ccf
    ld   c, $03
    nop
    ld  [$FF00+C], a
    pop  af
    sub  a, h
    sbc  a, e
    ret  c
    adc  a, a
    reti
    ld   c, a
    rst  $38
    ld   c, a
    rst  $38
    ld   c, c
    rst  $28
    ld   d, e
    rst  $38
    rlca
    add  a, e
    db   $FC ; Undefined instruction
    add  a, b
    rst  $38
    sub  a, c
    xor  $8F
    pop  af
    rlca
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    inc  de
    db   $EC ; Undefined instruction
    set  6, h
    ld   a, [$FE0D]
    ld   de, label_C32ED
    adc  a, [hl]
    pop  af
    add  a, a
    ld    hl, sp+$C1
    ld   a, [hl]
    ld   b, b
    ld   a, a
    ld   h, b
    ccf
    rst  $38
    rst  $38
    nop
    rlca
    nop
    sub  a, h
    nop
    rst  $10
    nop
    or   h
    nop
    sub  a, a
    nop
    nop
    rst  $38
    rst  $38
    call z, label_C7F3
    ld    hl, sp+$E3
    db   $FC ; Undefined instruction
    or   c
    cp   $98
    rst  $38
    xor  [hl]
    rst  $18
    or   a
    rst  8
    pop  de
    rst  $28
    inc  bc
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FFF9]
    nop
    pop  hl
    nop
    ld   [hl], e
    add  a, b
    ld   e, $E1
    add  a, b
    rst  $38
    di
    rst  $38
    ld   a, [$FF3F]
    or   b
    ld   a, a
    ret  c
    rst  $18
    adc  a, h
    sbc  a, a
    and  $9F
    rst  8
    rst  $38
    ld   [hl], h
    rst  $38
    ld   sp, hl
    cp   $FF
    nop
    ld   a, a
    add  a, b
    ccf
    ret  nz
    rra
    ld   [rIF], a
    ld   a, [$FF83]
    db   $FC ; Undefined instruction
    ld   [hl], b
    rst  $38
    nop
    rst  $38
    nop
    nop
    ret  nz

label_C1DD3::
    nop
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    nop
    jr   nz, label_C1E31
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_80F], sp
    rrca
    inc  b
    rlca
    inc  b
    rlca
    ld   [bc], a
    inc  bc
    dec  h
    jp  c, label_C3C83
    sub  a, l
    ld   l, d
    jp   z, label_C1E35
    and  c
    jr   c, label_C1DD3
    nop
    rst  $38
    nop
    rst  $38
    ld   a, $F0

label_C1E12::
    rrca
    db   $FC ; Undefined instruction
    ccf
    di
    ld   [hl], c
    ld   [$FF61], a
    ret  nz
    db   $E3 ; Undefined instruction
    ret  nz
    rst  $28
    add  a, b
    rst  $38
    add  a, b

label_C1E20::
    rlca
    ld   bc, label_182
    db   $E3 ; Undefined instruction
    add  a, b
    di
    ld   [$FFB3], a
    ld   h, b
    sub  a, e
    ld   [hl], b
    sub  a, e
    ld   [hl], b
    sub  a, e
    ld   [hl], b
    jr   nc, label_C1E12
    ld   a, [$FFE0]
    pop  hl

label_C1E35::
    and  b
    ld   [$FFA1], a
    pop  hl
    db   $E3 ; Undefined instruction
    rst  $20
    and  c
    and  a
    pop  hl
    ld  [$FF00+C], a
    pop  hl
    rrca
    nop
    db   $FD ; Undefined instruction
    inc  bc
    adc  a, a
    ld   a, a
    ld   [hl], a
    cp   $C5
    cp   $87
    db   $FC ; Undefined instruction
    sub  a, a
    db   $FC ; Undefined instruction
    rst  $30
    db   $EC ; Undefined instruction
    sbc  a, [hl]
    ld   a, c
    di
    ld   [$FFC3], a
    nop
    add  a, a
    nop
    adc  a, a
    nop
    rst  $18
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ld   a, [$FF0F]
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    cp   $03
    cp   $01
    rst  $38
    ld   bc, label_1FF
    rst  $38
    jr   nz, label_C1EB1
    or   b
    rra
    or   b
    rra
    sub  a, b
    rra
    sub  a, b
    rra
    ret  c
    rrca
    call z, label_CF0F
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_C1EC9
    ld   [label_40F], sp
    rlca
    ld   [bc], a
    inc  bc
    rst  $38
    rst  $38
    nop
    ld   [hl], $00
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, $00
    inc  e
    nop
    ld   [rIE], sp
    rst  $38
    rst  $38
    inc  de
    rrca
    inc  de
    rrca
    dec  de
    rlca
    dec  de
    rlca
    add  hl, bc
    rlca

label_C1EAC::
    dec  c
    inc  bc
    rst  $38
    rst  $38
    ld   a, b

label_C1EB1::
    add  a, b
    ld   a, b
    add  a, b
    inc  a
    ret  nz
    inc  a
    ret  nz
    ld   e, $E0
    sbc  a, [hl]
    ld   [$FF8F], a
    ld   a, [$FF8F]
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $06
    add  hl, bc
    add  hl, bc
    inc  de
    inc  de
    add  a, h
    inc  b
    ld   b, e
    ld   b, c
    ld   b, a
    ld   b, c
    ld   b, a
    ld   b, c
    cpl
    ld   hl, label_232D
    add  hl, de
    rla
    add  hl, bc
    rrca
    rlca
    rlca
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    jr   nc, label_C1EAC
    ld   [$FF80], a
    add  a, b
    nop
    ld   [label_40F], sp
    rlca
    inc  b
    rlca
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   bc, $0101
    ld   bc, $0101
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [$FF1F], a
    ld    hl, sp+$07
    ld   e, h
    and  e
    rst  $38
    add  a, b

label_C1F12::
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    ld   a, a
    ret  z
    ld   a, a
    db   $ED ; Undefined instruction
    ld   a, $F6
    inc  c
    db   $FC ; Undefined instruction
    ld   b, $FC
    sub  a, e
    ld   [hl], b
    sub  a, e

label_C1F23::
    ld   [hl], b
    inc  de
    ld   a, [$FFB3]
    ld   [$FFE3], a
    ld   [$FF63], a
    jr   nz, label_C1F90
    jr   nz, label_C1F12
    ld   b, b
    and  e
    ld   [$FFE3], a
    and  b
    and  e
    and  b
    and  c
    and  b
    pop  hl
    and  b
    pop  hl
    and  b
    and  c
    ld   [$FFA0], a
    ld   [$FFBF], a
    call nz, label_C4BF
    ld   a, l
    add  a, $FA
    ld   b, a
    db   $D3 ; Undefined instruction
    ld   l, a
    and  c
    ld   a, a
    db   $E3 ; Undefined instruction
    ld   a, $F7
    ccf
    cp   $01
    ld   a, [hl]
    add  a, c
    ld   a, h
    add  a, e
    or   b
    rst  8
    ret  nz
    rst  $38
    or   c
    ccf
    ld   e, $0F
    inc  c
    rlca
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_3FF
    rst  $38
    inc  bc
    cp   $07
    cp   $0F
    db   $FC ; Undefined instruction
    dec  sp
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    rrca
    ld    hl, sp+$3F
    ld   a, [$FF1F]
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    db   $FC ; Undefined instruction
    rlca
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld    hl, sp+$00
    or   b
    ret  nz
    ld   b, b
    add  a, b

label_C1F90::
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    jr   nz, label_C1FD7
    jr   nz, label_C1FD9
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [$810F], sp
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    pop  bc
    pop  bc
    rst  $38
    rst  $38
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
    add  a, c
    add  a, c
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
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b

label_C1FD7::
    add  a, b
    add  a, b

label_C1FD9::
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    rst  $38
    nop
    cpl
    nop
    ld   a, [$FF00]
    jp   label_1F00
    nop
    db   $FC ; Undefined instruction
    nop
    rrca
    nop
    rlca
    nop
    rst  $38
    nop
    ld   [rJOYP], a
    ccf
    nop
    di
    nop
    nop
    nop
    cp   $00
    rlca
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ld   [bc], a
    nop
    ld    hl, sp+$00
    ccf
    nop
    nop
    nop
    add  a, b
    nop
    inc  b
    nop
    ld   bc, label_C3F00
    nop
    nop
    nop
    nop
    nop
    add  a, a
    nop
    ld   a, h
    nop
    add  a, b
    nop
    nop
    nop
    push af
    nop
    inc  bc
    inc  bc
    dec  b
    ld   b, $FF
    rlca
    ccf
    nop
    nop
    nop
    add  a, a
    rlca
    ld   e, $18
    dec  sp
    daa
    rst  0
    add  a, a
    ld   a, d
    adc  a, $FC
    db   $FC ; Undefined instruction
    rst  $38
    jr   nc, label_C20D5
    db   $10 ; Undefined instruction
    ret  nc
    ld   a, [$FF30]
    db   $F0
    ld   a, [$FF3F]
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
    ld    hl, sp+$00
    ld   [rJOYP], a
    ret  nz
    nop
    add  a, b
    nop
    add  a, c
    ld   bc, label_302
    ld   [bc], a
    inc  bc
    inc  b
    rlca
    ld   bc, label_1F01
    rra
    ld   h, e
    ld   a, h
    add  a, b
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    inc  e
    rst  $38
    ld   h, e
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    sbc  a, $E6
    db   $FD ; Undefined instruction
    dec  sp
    dec  [hl]
    rst  8
    rlca
    rst  $38
    rst  $38
    cp   $EE
    inc  e
    ld   b, $FC
    ld   a, a
    ld   a, a
    sbc  a, h
    db   $E3 ; Undefined instruction
    ld   a, $FF
    ld   d, e
    pop  hl
    and  c
    ret  nz
    and  c
    ret  nz
    or   e
    ret  nz
    sbc  a, [hl]
    pop  hl
    rlca
    rlca
    db   $DB
    call c, label_F32F
    xor  l
    cp   $70
    rst  $38
    ld   a, a
    rst  $18
    ld   e, [hl]
    rst  8
    ld   e, b
    rst  8
    ld   [$FFE0], a
    ld   a, [hl]
    cp   $B1
    rst  8
    ret  nz
    ccf
    nop
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, e
    add  a, a
    ld   b, $F9
    db   $FC ; Undefined instruction
    nop
    inc  bc
    nop
    ld   a, [$FF00]
    nop
    nop
    rrca
    nop
    ld   a, [$FF00]
    rra
    nop
    ld   sp, hl
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rra
    nop
    ld   [rJOYP], a
    rlca
    nop
    ld    hl, sp+$00
    add  a, b
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    ld   b, b
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    inc  bc
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ld   bc, $0000
    nop

label_C213C::
    nop
    nop
    ld   b, b
    nop
    rst  $28
    ld   e, h
    sub  a, h
    ei
    and  e
    rst  $38
    cp   $FF
    db   $ED ; Undefined instruction
    ld   [hl], e
    ld   h, c
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    jr   label_C216E
    db   $FC ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   e, $F8
    ld   sp, hl
    ld   [$FFE0], a
    nop
    nop
    nop
    ld   b, b
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

label_C216E::
    nop
    nop
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

label_C217E::
    nop
    nop
    rrca
    rrca
    db   $FC ; Undefined instruction
    jr   nc, label_C217E
    add  a, $B1
    ld    hl, sp+$9F
    ld   a, [$FF5C]
    di
    cp   b
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    sbc  a, a
    nop
    inc  h
    nop
    rst  $38
    nop
    add  a, e
    ld   a, h
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   h, d
    add  a, c
    dec  b
    rlca
    rlca
    rlca
    inc  b
    rlca
    ld   [label_180F], sp
    rla
    jr   nc, label_C21DB
    jr   nc, label_C21ED
    ld   [$800F], sp
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    inc  c
    rst  $38
    add  hl, de
    cp   $30
    rst  $38
    jr   nz, label_C21BD
    ld   b, b
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    push bc
    cp   $36
    rst  8
    rst  0
    ccf
    inc  b
    rst  $38
    dec  de
    db   $FC ; Undefined instruction
    inc  [hl]
    ei
    add  hl, hl
    rst  $30
    ld   b, b
    rst  $38
    cp   a
    ld   a, a
    ld   d, c
    ld   [$FFD1], a
    ld   [$FF4E], a
    pop  af
    ld   h, c

label_C21DB::
    rst  $38
    rst  $38
    rst  $38
    adc  a, [hl]
    rst  $38
    rst  $28
    rst  $18
    ld   c, c
    cp   $38
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   b, a
    rst  $38

label_C21EA::
    jp   hl
    rst  $30

label_C21EC::
    inc  [hl]

label_C21ED::
    ei
    ld   [de], a
    db   $FD ; Undefined instruction
    pop  hl
    cp   $D8
    ccf
    ld   a, $CF
    dec  bc
    rst  $30
    ld   bc, $80FF
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rlca
    nop
    inc  bc
    nop
    add  a, c
    add  a, b
    ld   b, c
    ret  nz
    jr   nz, label_C21EA
    jr   nz, label_C21EC
    sub  a, b
    ld   a, [$FFD0]
    ld   a, [$FF38]
    ccf
    ld   h, b
    ld   e, a
    ld   b, c
    ld   a, a
    ld   [hl], d
    ld   a, a
    ld   a, [bc]
    rrca
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    sbc  a, a
    add  a, h
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ld   h, c
    rst  $38
    jp   label_83FF

label_C2235::
    rst  $38
    add  a, d
    rst  $38
    add  a, [hl]
    rst  $38
    ld   b, $FF
    inc  b
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    and  h
    rst  $18
    inc  h
    rst  $18
    inc  h
    rst  $18
    inc  b
    rst  $38
    rlca
    rst  $38
    rlca
    cp   $06
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    ld   e, d
    cp   l
    jr   z, label_C2233
    jr   z, label_C2235
    inc  c
    rst  $38
    add  a, h
    rst  $38
    add  a, h
    ld   a, a
    ld   b, $FF
    ld   [bc], a
    rst  $38
    ld   [rIE], a
    ld   h, b
    rst  $38
    jr   nc, label_C2265
    jr   nc, label_C2267
    jr   nc, label_C2269
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   hl, label_21FF
    rst  $38
    rla
    rst  $38
    inc  d
    db   $FC ; Undefined instruction
    ld   d, $FA
    dec  bc
    db   $FD ; Undefined instruction
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    ld   a, a
    ret  z
    ld   a, a
    ret  z
    ld   a, a
    pop  bc
    ccf
    pop  hl
    ccf
    pop  hl
    rra
    pop  af
    rrca
    ld   sp, hl
    rlca
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ld   c, $FF
    inc  b
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  de
    rst  $38
    sub  a, c
    cp   $90
    rst  $38
    add  a, b
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    rrca
    cp   $1F
    cp   $9E
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    rst  $38
    add  a, d
    rst  $38
    add  a, d
    ld   a, a
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [de], a
    rst  $38
    jr   nc, label_C22CB
    ld   [rIE], a
    pop  bc
    rst  $38
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    rst  $38
    cp   $7F
    db   $EC ; Undefined instruction
    ld   a, a
    ret  nz
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    pop  bc
    rst  $38
    add  a, c
    cp   $83
    cp   $83
    db   $FC ; Undefined instruction
    rst  0
    ld   a, h
    rst  0
    ld   a, b
    rst  8
    ld   [hl], b
    rst  $38
    nop
    nop

label_C22F2::
    nop
    nop
    inc  h
    inc  h
    jr   label_C2310
    jr   label_C2312
    inc  h
    inc  h
    nop
    nop

label_C22FE::
    nop
    nop
    jr   nc, label_C22F2
    ld   [label_4F8], sp
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    add  a, d
    cp   $C2
    cp   $42
    cp   $61
    rst  $38

label_C2310::
    adc  a, h
    rst  $38

label_C2312::
    adc  a, c
    rst  $38
    adc  a, c
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    rst  $38
    ld   c, b
    rst  $38
    inc  bc
    rst  $38
    add  a, a
    rst  $38
    rst  0
    cp   $E6
    rst  $38
    cp   $7F
    ld   a, [hl]
    cp   a
    ld   a, $FF
    ld   a, [hl]
    rst  $38
    call z, label_C8FF
    ccf
    ld   [label_8FF], sp
    rst  $38
    ld   [label_8FF], sp
    rst  $38
    ld   [label_10FF], sp
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    inc  a
    rst  $38
    inc  a
    rst  8
    inc  e
    rst  $28
    inc  c
    rst  $38
    rrca
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ldi  [hl], a
    rst  $38
    ld  [$FF00+C], a
    rst  $38
    jp   nz, label_11FF
    rst  $38
    rla
    rst  $38
    rra
    rst  $38
    cp   $FD
    ld   a, h
    ei
    jr   c, label_C236B
    inc  a
    rst  $38
    ld   a, $FF
    ret
    rst  $38
    adc  a, c
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
    ld   l, c
    rst  $38
    ld   a, [$FFE0]
    rst  $18
    ccf
    inc  sp
    nop
    call nz, label_FB00
    nop
    rra
    ld   [$FFC0], a
    rst  $38
    ccf
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    ld   l, e
    nop
    inc  d
    nop
    rst  $38
    nop
    jp   label_3C
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    pop  bc
    rst  $38
    jp   label_E7FF
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    cp   $FF
    cp   h
    rst  $38
    sbc  a, b
    rst  $38
    rst  $38
    di
    rst  $38
    pop  bc
    rst  $38
    sbc  a, h
    db   $E3 ; Undefined instruction
    ld   a, a
    add  a, b
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    adc  a, c
    db   $76 ; Halt
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    pop  bc
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    di
    ld   a, a
    rst  $30
    ccf
    rst  $38
    dec  e
    rst  $38
    add  hl, bc
    cp   a
    ret  nz
    db   $D3 ; Undefined instruction
    db   $EC ; Undefined instruction
    pop  bc
    cp   $C1
    cp   $C8
    rst  $30
    sbc  a, h
    db   $E3 ; Undefined instruction
    cp   [hl]
    pop  bc
    cp   [hl]
    pop  bc
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
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    jp   label_3FD
    ld   sp, hl
    rlca
    pop  af
    rrca
    and  c
    ld   e, a
    dec  b
    ei
    dec  c
    di
    cpl
    db   $D3 ; Undefined instruction
    rst  $38
    inc  bc
    cp   $00
    inc  bc
    nop
    inc  e
    nop
    ld  [$FF00+C], a
    ld   bc, $0001
    ld   b, $01
    jr   nc, label_C241D
    ret  nz
    ccf
    rst  $38
    ld   bc, label_181
    ldd  [hl], a
    rrca
    rrca
    db   $FC ; Undefined instruction
    cp   a
    ld   [hl], b
    ccf
    ld   [$FF5F], a

label_C241D::
    ld   [$FF5F], a
    ld   [$FFBF], a
    ret  nz
    ccf
    ret  nz
    cpl
    ret  nc
    rrca
    ld   a, [$FF07]
    ld    hl, sp+$E2
    dec  e
    ld   [$FF1F], a
    ld   a, [$FF0F]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    add  hl, de
    and  $00
    rst  $38
    ld   [$FF1F], a
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld    hl, sp+$07
    or   b
    ld   c, a
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$FF
    nop
    pop  bc
    add  a, b
    call z, label_F070
    ccf
    db   $FD ; Undefined instruction
    ld   c, $FC
    rlca
    ld   a, [$FA07]
    rlca
    ld   a, a
    nop
    ret  nz
    nop
    jr   c, label_C2466

label_C2466::
    ld   b, a
    add  a, b
    add  a, b
    nop
    ld   h, b
    add  a, b
    inc  c
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    ld   b, b
    ccf
    jr   nc, label_C2483
    sub  a, [hl]
    ld   bc, label_33C
    db   $10 ; Undefined instruction
    jr   c, label_C2483
    rst  $38
    nop
    rrca
    nop
    ld   b, e
    db   $FC ; Undefined instruction
    ld   h, c

label_C2483::
    cp   $3C
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    ret  nz
    ccf
    ld   c, $01
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    inc  e
    db   $E3 ; Undefined instruction
    rst  0
    rst  $38
    ld   a, b
    rst  $38
    nop
    rst  $38
    ld   a, [$FF0F]
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    nop
    ld   a, [hl]
    add  a, c
    cp   l
    jp   label_FFFF
    nop
    rst  $38
    rst  8
    jr   nc, label_C24B2
    nop
    rst  $38
    nop
    cp   $01
    inc  a
    jp   label_FFE3
    ld   e, $FF
    nop
    rst  $38
    jp   nz, label_863F
    ld   a, a
    inc  a
    rst  $38
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    ld   [hl], b
    add  a, b
    ld   [bc], a
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FF69]
    add  a, b
    inc  a
    ret  nz
    ld   [label_1CF0], sp

label_C24DB::
    ld   [rIE], a
    nop
    ld   a, [$FF00]
    rra
    rrca
    db   $F4 ; Undefined instruction
    ld    hl, sp+$E8
    nop
    inc  de
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    rst  $38
    rst  $38
    inc  a
    jp   label_FCFC
    ld   l, d
    ld   c, $99
    ld   a, a
    add  hl, bc

label_C24F7::
    rrca
    rst  $20
    rlca
    ld   a, [hl]
    add  a, a
    dec  b
    cp   $FD
    cp   $FF
    nop
    nop
    rst  $38
    add  a, c
    ld   a, $18
    rst  $20
    nop
    rst  $38
    jr   nc, label_C24DB
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    nop
    rst  $38
    adc  a, h
    ld   [hl], e
    nop
    rst  $38
    ld   b, b
    sbc  a, a
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $F9
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_C24F7
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   bc, label_2CFE
    db   $D3 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [hl], d
    adc  a, h
    add  hl, de
    ld   [$FFC0], a
    ccf
    inc  [hl]
    rlc  b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_C257D
    jp   nz, label_401
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    nop

label_C2569::
    rst  $38
    nop
    rst  $38
    rlca
    ld    hl, sp+$3B
    call nz, label_F804
    ld   [rIE], a
    rst  $38
    rst  $38
    rrca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [$FF1F], a
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    nop
    rst  $38
    ld   [hl], b
    adc  a, a
    ld   [bc], a
    ld   sp, hl
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    di
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    jp   nz, label_3C
    rst  $38
    jr   nc, label_C2569
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
    ld   bc, label_C00FE
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
    rst  $38
    add  a, b
    ld   a, a
    ld   [bc], a
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_C25C2::
    ld   h, c
    sbc  a, [hl]
    rlca
    ld    hl, sp+$FC
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    jp   nz, label_383D
    rst  0
    rlca
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_C25A7
    jr   label_C25C2
    rlca
    nop
    ld   a, [$FF0F]
    nop
    rst  $38
    nop
    rst  $38
    rlca
    ld    hl, sp+$3F
    ret  nz
    ei
    inc  b
    jr   nz, label_C2611
    pop  bc
    ld   c, $30
    ret  nz
    ld   b, $F9
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   a, [$FF0F]
    rst  $38

label_C25FF::
    nop
    rst  $38
    nop
    nop
    rst  $38
    jr   nc, label_C25D4
    nop
    rst  $38
    ld   b, $F9
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    rst  $38

label_C2611::
    nop
    nop
    rst  $38
    add  a, d

label_C2615::
    ld   a, h
    jr   label_C25FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    di
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
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

label_C2637::
    rst  $38
    ld   [bc], a
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
    jr   nc, label_C2615
    rlca
    ld    hl, sp+$8E
    ld   [hl], c

label_C264A::
    ld    hl, sp+$07
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $F9
    ld   a, [$FF0F]
    ccf
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    nop

label_C265F::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    di
    ld   [hl], e
    adc  a, h
    jr   label_C264A
    inc  b
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    add  hl, de
    and  $E6
    add  hl, de
    dec  c
    nop
    jr   nc, label_C267C

label_C267C::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    jp   label_3C
    rst  $38
    inc  c
    di
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_C265F
    rst  $38
    nop
    nop
    rst  $38
    ld   a, [bc]
    pop  af
    jr   nz, label_C2637
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    nop

label_C26A1::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    nop
    rst  $38

label_C26AC::
    nop
    rst  $38
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   label_C26A1
    nop
    rst  $38
    nop
    rst  $38

label_C26BE::
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
    ld   b, b
    cp   a
    jr   label_C26AC
    ret  z
    rlca
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
    ld   [hl], b
    rrca
    jr   label_C26BE
    ld   c, $F1
    rrca
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    rst  0
    jr   c, label_C2723
    rst  0
    call nz, label_1738
    ld   [$FFE0], a
    rst  $38
    rrca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    pop  bc
    ld   a, $3C
    jp   label_1867
    call nz, label_303
    nop
    inc  b
    inc  bc
    add  hl, sp
    rlca
    ld   b, b
    ccf
    ld   b, b
    ccf
    jr   nz, label_C272B
    jr   nc, label_C271D
    jr   nz, label_C272F
    db   $10 ; Undefined instruction
    jr   nz, label_C2733
    jr   nz, label_C2735
    jr   nc, label_C2727
    inc  e
    inc  bc
    inc  de
    inc  c
    ld   [label_707], sp
    nop
    inc  bc
    nop
    rlca

label_C2723::
    inc  bc
    dec  de
    inc  b
    dec  a

label_C2727::
    inc  de
    add  hl, sp
    rla
    jr   c, label_C2743
    add  hl, hl
    rla
    jr   label_C2737
    inc  d
    dec  bc
    ldi  [hl], a

label_C2733::
    dec  e
    ld   hl, label_381E

label_C2737::
    rlca
    jr   label_C2749
    rla
    rrca
    ld   [label_707], sp
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20

label_C2746::
    inc  a
    ret  z
    inc  e

label_C2749::
    db   $E8 ; add  sp, d
    ld   e, h
    xor  b
    inc  [hl]
    ret  z
    sbc  a, b
    ld   [rNR23], a
    ld   [rNR14], a
    db   $E8 ; add  sp, d
    inc  h
    ret  c
    call z, label_1830
    ld   a, [$FFE8]
    ld   a, [$FF10]
    ld   [$FFE0], a
    nop
    rrca
    nop
    ld   [hl], $0F
    ld   h, b
    ccf
    ld   d, b
    cpl
    inc  sp
    inc  c
    rra
    ld   [bc], a
    rra
    ld   a, [bc]
    ccf
    ld   e, $2E
    dec  e
    inc  d
    dec  bc
    inc  c
    inc  bc
    inc  d
    dec  bc
    dec  de
    inc  b
    db   $10 ; Undefined instruction
    ld   [label_707], sp
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nc, label_C2746
    ld   [label_4F0], sp
    ld    hl, sp+$04
    ld    hl, sp+$08
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$F8
    nop
    db   $10 ; Undefined instruction
    ld   [rJOYP], a

label_C27A0::
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_C27A8

label_C27A8::
    stop
    jr   z, label_C27AC

label_C27AC::
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
    jr   z, label_C27B8

label_C27B8::
    stop
    jr   z, label_C27BC

label_C27BC::
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_F00
    ld   bc, label_E1F
    ld   c, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C27E3::
    nop
    ld   bc, label_300
    ld   bc, label_207
    ld   c, $04
    ld   c, $04
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
    jr   c, label_C2806

label_C2806::
    ld   a, h
    jr   c, label_C27A7
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
    jr   c, label_C2822

label_C2822::
    ld   a, h
    jr   c, label_C27E3
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
    jr   nc, label_C288A
    jr   label_C286C
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

label_C286C::
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

label_C288A::
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

label_C28AF::
    rrca
    ld   a, $19
    ld   a, l
    jr   c, label_C292D
    jr   nc, label_C28AF
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    ld   c, b
    jr   nc, label_C28F7
    nop
    nop
    nop
    ld   [bc], a
    nop
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rrca
    dec  b
    dec  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   e, $0C
    rrca
    ld   [bc], a
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

label_C28F7::
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
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2908
    jr   label_C290A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2918
    jr   label_C291A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2928
    jr   label_C292A
    inc  h
    rst  $38

label_C292D::
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2938
    jr   label_C293A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2948
    jr   label_C294A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2958
    jr   label_C295A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2968
    jr   label_C296A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2978
    jr   label_C297A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2988
    jr   label_C298A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2998
    jr   label_C299A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C29A8
    jr   label_C29AA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C29B8
    jr   label_C29BA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C29C8
    jr   label_C29CA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C29D8
    jr   label_C29DA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C29E8
    jr   label_C29EA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C29F8
    jr   label_C29FA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    nop
    nop
    ld   a, [hl]
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
    ld   h, [hl]
    nop
    nop
    cp   $00
    rst  $38
    ld   a, h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    nop
    nop
    ld   a, [hl]
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
    ld   h, b
    ld   a, [$FF60]
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $78
    rst  $38
    ld   h, h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, b
    ld   a, [$FF60]
    ld   a, [$FF60]
    cp   $60
    cp   $7C
    rst  $38
    inc  a
    ld   a, [hl]
    jr   label_C2A91
    jr   label_C2A93
    jr   label_C2A95
    jr   label_C2A97
    jr   label_C2A99
    nop
    nop
    nop
    cp   $7C
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
    nop
    nop
    nop
    nop
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    inc  a
    inc  a
    jr   label_C2AB5
    jr   label_C2AB7
    jr   label_C2AB9
    jr   label_C2ABB
    jr   label_C2A81

label_C2A81::
    nop
    ccf
    nop
    ccf
    ld   e, $3F
    inc  c
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    nop

label_C2A91::
    nop
    rst  $38

label_C2A93::
    nop
    rst  $38

label_C2A95::
    ld   h, [hl]
    rst  $38

label_C2A97::
    ld   h, [hl]
    cp   $6C
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$70
    ld    hl, sp+$70
    nop
    nop
    rst  $30
    nop
    rst  $30
    ld   h, d
    rst  $38
    ld   h, d
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    nop
    nop
    rst  $30
    nop
    rst  $30

label_C2AB5::
    ld   h, d
    rst  $38

label_C2AB7::
    ld   h, d
    rst  $38

label_C2AB9::
    ld   [hl], d
    rst  $38

label_C2ABB::
    ld   [hl], d
    rst  $38
    ld   a, d
    rst  $38
    ld   a, d
    nop
    nop
    ld   a, [hl]
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
    ld   h, b
    ld   a, [hl]
    inc  a
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    jr   label_C2B15
    jr   label_C2B17
    jr   label_C2B19
    jr   label_C2B1B
    jr   label_C2AE1

label_C2AE1::
    nop
    rst  $38
    nop
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    nop
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   a, [hl]
    rst  $38
    inc  d
    ld   a, [hl]
    nop
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
    nop
    nop
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38

label_C2B15::
    ld   h, [hl]
    rst  $38

label_C2B17::
    ld   h, [hl]
    rst  $38

label_C2B19::
    ld   h, [hl]
    rst  $38

label_C2B1B::
    ld   a, h
    cp   $00
    nop
    nop
    rst  $38
    ld   h, b
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    db   $3A ; ldd  a, [hl]
    ld   a, [hl]
    nop
    nop
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, h
    cp   $78
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    cp   $60
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    nop
    nop
    cp   $60
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF00]
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   c, $3F
    ld   c, $3F
    inc  e
    ld   a, $1C
    ld   a, [hl]
    inc  e
    ld   e, $0C
    cp   $0C
    cp   $6C
    cp   $6C
    cp   $6C
    cp   $38
    ld   a, h
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    cp   $6C
    cp   $6C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    nop
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   h, d
    rst  $30
    ld   h, d
    rst  $30
    nop
    nop
    nop
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, d
    rst  $30
    ld   h, d
    rst  $30
    nop
    nop
    nop
    rst  $38
    ld   b, $FF
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  a
    ld   a, [hl]
    nop
    nop
    nop
    inc  a
    jr   label_C2C0F
    jr   label_C2C11
    jr   label_C2C13
    jr   label_C2C15
    jr   label_C2C17
    jr   label_C2C19
    nop
    nop
    nop
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, $7F
    inc  d
    ld   a, $00
    nop
    nop
    rst  $30
    nop
    rst  $38
    ld   h, d
    rst  $38
    ld   [hl], h
    cp   $38
    ld   a, a
    inc  e
    rst  $38
    ld   l, $FF
    ld   b, [hl]
    rst  $28
    nop
    jr   label_C2C02

label_C2C02::
    inc  a
    jr   label_C2C83
    inc  h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38

label_C2C0F::
    nop
    inc  a

label_C2C11::
    nop
    ld   a, [hl]

label_C2C13::
    inc  a
    rst  $38

label_C2C15::
    ld   h, [hl]
    rst  $38

label_C2C17::
    ld   h, b
    rst  $38

label_C2C19::
    ld   h, b
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   a, b
    cp   $64
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $64
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, b
    cp   $7C
    cp   $60
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, $7E
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    inc  a
    inc  a
    jr   label_C2CA3
    jr   label_C2CA5
    jr   label_C2CA7
    jr   label_C2CEB
    inc  a
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   l, h
    cp   $78
    cp   $78
    rst  $38
    ld   l, h
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $30
    ld   h, d
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   l, d
    rst  $38
    ld   h, d
    rst  $30
    ld   h, d
    rst  $30
    nop
    rst  $20
    nop
    rst  $30

label_C2CA3::
    ld   h, d
    rst  $38

label_C2CA5::
    ld   [hl], d
    rst  $38

label_C2CA7::
    ld   a, d
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $30
    ld   h, d

label_C2CAE::
    di
    nop
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
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
    ld   bc, label_200
    ld   bc, label_205
    ld   b, $00
    inc  b
    nop
    inc  b
    nop
    inc  b
    nop
    ld   e, $00
    ld   [de], a
    nop
    add  hl, sp
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
    nop
    ret  nz

label_C2CEB::
    nop
    jr   nz, label_C2CAE
    sub  a, b
    ld   h, b
    ld   h, b
    nop
    jr   nz, label_C2CF4

label_C2CF4::
    jr   nz, label_C2CF6

label_C2CF6::
    jr   nz, label_C2CF8

label_C2CF8::
    ld   a, b
    nop
    ld   c, b
    nop
    ld   a, h
    ld   [label_8FC], sp
    db   $FC ; Undefined instruction
    nop
    cp   $7C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    db   $FC ; Undefined instruction
    ld   h, b
    ld   a, [$FF60]
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    cp   $7C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    cp   $6C
    rst  $38
    ld   h, [hl]
    rst  $30
    nop
    ld   a, $00
    ld   a, [hl]
    inc  a
    db   $FC ; Undefined instruction
    ld   h, b
    ld   a, [hl]
    inc  a
    rst  $38
    ld   b, $FF
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    jr   label_C2D73
    jr   label_C2D75
    jr   label_C2D77
    jr   label_C2D79
    jr   label_C2D7B
    nop
    rst  $20
    nop
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
    ld   a, [hl]
    inc  a
    inc  a
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  h
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    jr   label_C2D9B
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_C2D68
    jr   label_C2D6A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_C2D73::
    ld   b, d
    rst  $38

label_C2D75::
    inc  h
    rst  $38

label_C2D77::
    jr   label_C2D78

label_C2D79::
    jr   label_C2D7A

label_C2D7B::
    inc  h
    rst  $38
    ld   b, d
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
    rrca
    rrca
    rlca
    rlca
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    jr   c, label_C2D97
    ld   a, h
    nop
    ld   a, a

label_C2D97::
    nop
    jr   nc, label_C2D9A

label_C2D9A::
    nop

label_C2D9B::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    ld   a, [de]
    nop
    db   $3A ; ldd  a, [hl]
    nop
    ld   h, h
    nop
    sbc  a, b
    nop
    ld   h, b
    nop
    add  a, b
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    rrca
    nop
    cp   $00
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
    inc  bc
    nop
    rrca
    inc  bc
    rra
    rrca
    ld   a, a
    rra
    xor  $77
    ld   a, l
    ld   b, $1D
    ld   c, $1A
    inc  c
    db   $3A ; ldd  a, [hl]
    inc  e
    inc  [hl]
    jr   label_C2E43
    jr   nc, label_C2E2D
    jr   nz, label_C2E3F
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ccf
    rrca
    ld   a, a
    ccf
    rst  $38
    ld   [hl], a
    rst  $38
    ld   b, a
    ld   e, l
    ld   c, $1E
    inc  c
    db   $3A ; ldd  a, [hl]
    inc  e
    db   $3A ; ldd  a, [hl]
    inc  e
    inc  [hl]
    jr   label_C2E0D
    ld   [$0018], sp
    nop
    nop
    nop
    nop
    nop
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
    nop
    db   $FD ; Undefined instruction

label_C2E0D::
    ld   [bc], a
    rst  $38
    ld   a, d
    db   $FD ; Undefined instruction
    nop
    rst  $38
    ld   a, d
    add  a, l
    ld   a, d
    rst  $38
    nop
    ld   a, h
    nop
    rra
    nop
    nop
    nop
    stop
    add  hl, hl
    db   $10 ; Undefined instruction
    jr   nc, label_C2E9C
    inc  hl
    ld   [hl], e
    jr   nz, label_C2E9D
    jr   nz, label_C2E87
    nop
    db   $FC ; Undefined instruction

label_C2E2D::
    nop
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    pop  af
    nop
    ld   e, h
    nop
    nop

label_C2E3F::
    nop
    db   $F4 ; Undefined instruction
    ld   [label_CF6], sp
    xor  $C4
    xor  $04
    ld   a, $04
    ld   a, d
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $30
    nop
    rst  $38
    db   $EB ; Undefined instruction
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    nop
    nop
    nop
    adc  a, b
    nop
    nop
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
    rst  $28
    db   $10 ; Undefined instruction
    sub  a, $DF
    nop
    rst  $38
    xor  [hl]
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    rra
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop

label_C2E87::
    nop
    nop
    nop
    ld   [bc], a
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    ld   a, d
    db   $FD ; Undefined instruction
    nop
    rst  $38
    ld   a, d
    add  a, l
    ld   a, d
    rst  $38
    nop
    rst  $38
    nop
    jr   c, label_C2E9C

label_C2E9C::
    rlca

label_C2E9D::
    nop
    nop
    nop
    add  hl, hl
    db   $10 ; Undefined instruction
    jr   nc, label_C2F1C
    inc  hl
    ld   [hl], e
    jr   nz, label_C2F1D
    jr   nz, label_C2F07
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rlca
    nop
    cp   a
    nop
    ret  nz
    nop
    ld   c, b
    nop
    db   $F4 ; Undefined instruction
    ld   [label_CF6], sp
    xor  $C4
    xor  $04
    ld   a, $04
    ld   a, d
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $30
    nop
    rst  $38
    db   $EB ; Undefined instruction
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    di
    nop
    inc  a
    nop
    pop  hl
    nop
    nop
    nop
    nop
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
    rst  $28
    db   $10 ; Undefined instruction
    sub  a, $DF
    nop
    rst  $38
    xor  [hl]
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    rst  $38
    nop
    ld   c, $00
    ret  nz
    nop
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C2F07::
    nop
    nop
    nop
    ld   [bc], a
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    ld   a, d
    db   $FD ; Undefined instruction
    nop
    rst  $38
    ld   a, d
    add  a, l
    ld   a, d
    rst  $38
    nop
    rlca
    nop
    ld   a, [hl]
    nop

label_C2F1C::
    stop
    ld   bc, label_2900
    db   $10 ; Undefined instruction
    jr   nc, label_C2F9C
    inc  hl
    ld   [hl], e
    jr   nz, label_C2F9D
    jr   nz, label_C2F87
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    nop
    ld   a, [de]
    nop
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   [label_CF6], sp
    xor  $C4
    xor  $04
    ld   a, $04
    ld   a, d
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $30
    nop
    rst  $38
    db   $EB ; Undefined instruction
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    add  a, e
    nop
    ld   [rJOYP], a
    jr   label_C2F5E

label_C2F5E::
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
    inc  e
    nop
    rst  $28
    db   $10 ; Undefined instruction
    sub  a, $DF
    nop
    rst  $38
    xor  [hl]
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    ld    hl, sp+$00
    ld   a, [hl]
    nop
    inc  b
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

label_C2F87::
    nop
    nop
    nop
    ld   [bc], a
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    ld   a, d
    db   $FD ; Undefined instruction
    nop
    rst  $38
    ld   a, d
    add  a, l
    ld   a, d
    rst  $38
    nop
    ccf
    nop
    ld   bc, label_1800

label_C2F9D::
    nop
    nop
    nop
    add  hl, hl
    db   $10 ; Undefined instruction
    jr   nc, label_C301C
    inc  hl
    ld   [hl], e
    jr   nz, label_C301D
    jr   nz, label_C3007
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    ei
    nop
    ld   a, $00
    ld   bc, label_1200
    nop
    db   $F4 ; Undefined instruction
    ld   [label_CF6], sp
    xor  $C4
    xor  $04
    ld   a, $04
    ld   a, d
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $30
    nop
    rst  $38
    db   $EB ; Undefined instruction
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, $C000
    nop
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
    inc  e
    nop
    rst  $28
    db   $10 ; Undefined instruction
    sub  a, $DF
    nop
    rst  $38
    xor  [hl]
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    inc  e
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $30
    rst  $38
    ret  nz
    ld   a, [$FFE0]

label_C3007::
    ld   [$FFCB], a
    ld   [$FF87], a
    ret  nz
    adc  a, [hl]
    ret  nz
    sbc  a, a
    ret  nz
    rst  $38
    rst  $38
    xor  a
    rst  $38
    ret  nc
    ld   c, $3B
    nop
    ret  nz
    nop
    rst  $38
    nop

label_C301C::
    ld   sp, hl

label_C301D::
    ld   b, $FA
    inc  b
    rst  $38
    rst  $38
    jp   nz, label_25FF
    ld   d, b
    ld   bc, label_C0F20
    nop
    cp   $01
    ei
    inc  b
    rst  $28
    nop
    rst  $38
    rst  $38
    rrca
    rst  $38
    or   l
    rrca
    sbc  a, e
    rlca
    ei
    rlca
    jp   hl
    rla
    ld   a, l
    inc  bc
    push af
    dec  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [rIE], a
    rst  $20
    rst  $38
    rst  $28
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    ld   bc, $80FF
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ld   a, $FF
    inc  c
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction

label_C3070::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ld   bc, label_C10FF
    xor  a
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    rra
    rst  $38
    ccf
    rst  $28
    ccf
    rst  $28
    rra
    rst  $28
    rst  $20
    rst  $38
    pop  hl
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    sbc  a, $FF

label_C30A8::
    sbc  a, [hl]
    rst  $38
    inc  de
    db   $EC ; Undefined instruction
    rra
    ld   [$FF1F], a
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   label_C30B7
    ldi  [hl], a
    db   $FD ; Undefined instruction
    push de
    jr   z, label_C30A8
    db   $10 ; Undefined instruction
    nop
    nop
    rst  $38
    nop
    rst  $38
    add  hl, de
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    dec  bc
    rst  $38
    sub  a, b
    ld   l, a

label_C30CE::
    ld   a, [$FF0F]
    nop
    rst  $38
    ld   bc, $81FF
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    di
    db   $FC ; Undefined instruction
    sbc  a, a
    ld   h, b
    rst  $38
    nop
    add  a, $FF
    rst  $28

label_C30E3::
    rst  $38
    rst  $28
    rst  $38
    add  a, $FF
    jr   nc, label_C30E9
    add  a, [hl]
    ld   a, c
    add  a, [hl]
    ld   a, c
    rst  8
    jr   nc, label_C3121
    rst  $38
    ld   a, b
    rst  $38
    ld   a, b
    rst  $38
    jr   nc, label_C30F7
    ret  nz
    rst  $38
    jr   label_C30E3
    rra
    ld   [$FF3F], a
    ret  nz
    xor  a
    ret  nz
    and  a
    ret  z
    db   $DB
    add  a, b
    rst  $38
    add  a, b
    jp   label_E0FC
    rst  $38
    xor  b
    rst  $38
    rst  $38
    rst  $38
    call c, label_FF20
    nop
    cp   a
    nop
    rst  $38
    nop
    rrca
    ld   a, [$FF73]
    adc  a, a
    ld   c, $FF
    rst  $38
    rst  $38
    rst  $38

label_C3121::
    nop
    rst  $30
    ld   [$00FF], sp
    or   a
    ld   a, b
    ld   d, e
    db   $EC ; Undefined instruction
    ld   a, h
    add  a, a
    ld   [hl], $FF
    rst  $38
    rst  $38
    push bc
    inc  hl
    jp   hl
    rlca
    jp   label_C170F
    rrca
    xor  l
    rra
    ld   l, c
    sbc  a, a
    dec  bc
    rst  $38
    rst  $38
    rst  $38
    ld   h, b
    rst  $38

label_C3142::
    ret  z
    rst  $30
    sbc  a, b
    rst  $20
    ldi  [hl], a
    db   $07
    rlca
    ld    hl, sp+$3F
    ret  nz
    rst  $38
    nop
    rst  $38

label_C314F::
    nop
    nop
    rst  $38
    nop
    rst  $38
    jr   label_C3155
    jr   label_C314F
    ld   [bc], a
    db   $FD ; Undefined instruction
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
    inc  bc
    rst  $38
    rla
    rst  $28
    ld   a, $C7
    db   $FC ; Undefined instruction
    rrca
    db   $F4 ; Undefined instruction
    rrca
    ld   a, [$FF0F]
    rra
    rst  $28
    ld   a, a
    rst  $38
    cp   a
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    dec  de
    rst  $38
    rla
    ei
    ccf
    rst  $38
    ld   a, [$FFFF]
    pop  af
    rst  $38
    ei
    cp   $F8
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    inc  sp
    call z, label_C738
    add  hl, sp
    add  a, $1E
    pop  hl
    ld   e, $E1
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  a
    jp   label_FF
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  e
    nop
    inc  e
    nop
    inc  e
    nop
    rst  $38
    rst  $20
    jr   label_C3142
    ld   [hl], b
    ld   c, a
    or   b
    ccf
    ret  nz
    ccf
    ld   b, b
    rra
    ld   h, b
    rra
    ld   h, b

label_C31BE::
    rla
    db   $E8 ; add  sp, d
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    nop

label_C31CA::
    rst  $38
    nop
    rst  $38
    nop
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   sp, hl
    ld   b, $F0
    rrca
    ld   a, [$FF0F]
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  h
    db   $DB
    ld   l, l
    sub  a, d
    ld   h, l
    sbc  a, d
    pop  af
    ld   c, $EF
    db   $10 ; Undefined instruction
    jr   nz, label_C31BE
    ld   b, [hl]
    or   a
    ld   c, b
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [hl], h
    adc  a, e
    db   $22
    ldi  [hl], a
    jp   label_CF3C
    jr   nc, label_C31CA
    ld   c, b
    ld   a, e
    add  a, h
    or   a
    ld   c, b
    call label_1832
    rst  $20
    db   $22
    ldi  [hl], a
    pop  hl
    ld   e, $FF
    nop
    rst  $38
    nop
    adc  a, a
    ld   [hl], b
    rst  $20
    jr   label_C324D
    db   $DB
    ld   l, l
    sub  a, d
    ld   h, l
    sbc  a, d
    pop  af
    ld   c, $07
    ld   e, b
    inc  bc
    cp   h
    ld   bc, label_C30FE
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    di
    inc  c
    di
    inc  c
    ei
    inc  b
    ei

label_C3247::
    inc  b
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    nop
    rst  $38

label_C324D::
    nop
    rst  $38
    nop
    cpl
    rst  $38
    cpl
    rst  $38
    dec  sp
    rst  $38
    scf
    ei
    sub  a, e
    ccf
    dec  de
    ccf
    rst  $28
    rra
    rst  $20
    rra
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    pop  af
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $20
    rst  $38
    adc  a, $FF
    db   $FD ; Undefined instruction
    rst  $38
    jp   label_3CFF
    jp   label_C33C
    add  a, $F9
    jp   nz, label_80FC
    cp   $C0
    cp   $C0
    cp   $A0
    sbc  a, $00
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    nop
    db   $E3 ; Undefined instruction
    nop
    ld   [hl], $00
    inc  e
    nop
    adc  a, b
    nop

label_C328D::
    ld   h, e
    nop
    nop
    ld   e, $E1
    ld   e, $E1
    ld   sp, label_20CF
    rra
    nop
    ccf
    nop
    cp   a
    nop
    ccf
    inc  bc
    inc  a
    rst  $38
    nop
    rst  $18
    nop
    rra
    ret  nz
    rst  $18
    jr   nz, label_C32B8
    ld   a, [$FF47]
    cp   b
    ld   hl, label_1FDE
    ld   [$FFF8], a
    rlca
    ld   a, [$FF0F]

label_C32B4::
    ret  nz
    ccf
    ret  nz
    ccf

label_C32B8::
    add  a, b

label_C32B9::
    ld   a, a
    add  a, h
    ld   a, e
    add  a, [hl]
    ld   a, c
    rst  8
    jr   nc, label_C32E0
    ld   [rIF], a
    ld   a, [$FF1F]
    ld   [$FF7F], a
    add  a, b
    ccf
    ret  nz
    rra
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FFF3], a
    rrca
    di
    rrca
    di
    rrca
    db   $E3 ; Undefined instruction
    rra
    db   $E3 ; Undefined instruction
    rra
    rst  $10
    cpl
    rst  $18
    daa
    rst  $10
    cpl

label_C32E0::
    ld   b, $F8
    ld   a, $C0
    ccf
    ret  nz
    ld   a, a
    add  a, b
    ld   a, b
    add  a, a
    jr   nc, label_C32B4
    jr   nc, label_C32B9
    inc  sp
    call z, label_1C00
    nop
    add  a, b
    nop
    ld   h, e
    add  a, b
    nop
    nop
    db   $E3 ; Undefined instruction
    nop
    ld   a, $00
    rst  $38
    pop  bc
    ld   a, $31
    ld   c, $3F
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rrca
    ld   a, [$FF07]
    ld   [$E807], sp
    rst  $20
    jr   label_C32E0
    ccf
    rst  8
    ccf
    jp   label_E33F
    rra
    di
    rrca

label_C331A::
    di
    rrca
    di
    rrca
    di
    rrca
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    and  $FF
    rst  $28
    rst  $38
    rst  $28
    rst  $38
    and  $FF
    rra
    ld   [$FF1F], a
    ld   [$FF3F], a
    ret  nz
    ccf
    ret  nz
    ld   c, $F1
    ld   b, h
    ei
    ld   b, h
    ei
    ld   c, $F1
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    sub  a, h
    ld   l, e
    rst  $38
    nop
    ld   a, a
    add  a, b
    ccf
    ret  nz
    ccf
    ret  nz
    ld   a, a
    add  a, b
    cp   a
    ld   b, b
    ld   e, a
    add  a, b
    ld   e, b
    add  a, a
    ret  nc
    rrca
    di
    inc  c
    rst  $30
    ld   [label_8F7], sp
    rst  $38
    nop
    rst  8
    jr   nc, label_C3300
    ld   h, d
    ld   e, $E1
    cp   a
    ld   b, b
    cp   $00

label_C336A::
    rst  $38
    nop
    adc  a, l
    nop
    ld   [hl], e
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   b, $79
    push bc
    db   $3A ; ldd  a, [hl]
    db   $F4 ; Undefined instruction
    ld   [label_13E8], sp
    ret  z
    inc  sp
    and  a
    ld   b, b
    rst  $10
    jr   nz, label_C336A
    jr   label_C331A
    ld   a, [bc]
    ld   [hl], $49
    add  a, l
    ld   a, d
    xor  d
    ld   d, h
    sub  a, h
    ld   l, b
    call nz, label_FF39
    nop
    rst  $38
    nop
    and  c
    ld   c, [hl]
    cp   c
    ld   b, $44
    jr   c, label_C3406
    sub  a, b
    ld   d, c
    and  d
    and  a
    ld   b, b
    pop  hl
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    pop  hl
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    sbc  a, c
    and  $D0
    rst  $28
    ret  nc
    rst  $28
    sbc  a, c
    and  $2F
    ld   a, [$FF67]
    ld    hl, sp+$67
    ld    hl, sp+$2F
    ld   a, [$FFFE]
    nop
    rst  $38

label_C33C3::
    nop
    rst  $28
    jr   nc, label_C33DA
    db   $EC ; Undefined instruction
    ld   a, e
    add  a, b
    ld   a, e
    add  a, b
    rst  0
    nop
    rst  $38
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

label_C33DA::
    ld    hl, sp+$07
    ld   a, [$FF00+C]
    db   $E8 ; add  sp, d
    rla
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    push hl
    ld   a, [de]
    sub  a, d
    ld   a, l
    jr   z, label_C33C3
    nop
    rst  $38
    nop
    ld   [hl], a
    rst  0
    jr   c, label_C33B2
    ld   b, b
    ld   a, e
    add  a, b
    add  a, h
    ei
    adc  a, h
    di
    ld   sp, label_3CE
    db   $FC ; Undefined instruction
    rlca
    ld   a, b
    cp   a
    nop
    ld   a, [hl]
    ld   bc, label_2FD

label_C3406::
    rst  $38
    nop
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_C340C
    nop
    ld   e, a
    add  a, b
    rra
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF3F], a
    ret  nz
    rra
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $28
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
    ret  nz
    ld   a, $C0
    dec  sp
    add  a, b
    ld   [hl], l
    add  a, b
    ld   a, e
    nop
    rst  $28
    nop
    rst  $10
    ld   bc, label_1EE
    cp   $00
    xor  d
    nop
    ld   [hl], a
    nop
    rst  $38
    nop
    rst  $38
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    or   b
    rra
    ld   h, b
    ccf
    ret  nz
    ld   a, a
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

label_C3465::
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$FF0F]
    add  a, b
    ld   a, a
    sbc  a, a
    ld   [$FF1F], a
    ld   [$FF3F], a
    ret  nz
    ccf
    ret  nz
    ld   e, $E1
    add  hl, de

label_C347B::
    rst  $20
    nop
    rst  $38
    ld   h, b
    rst  $38
    rst  $38
    nop
    cp   $01
    or   $09
    add  a, a
    ld   a, b
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, $80FE

label_C348D::
    ld   a, a
    nop
    rst  $38
    db   $FC ; Undefined instruction

label_C3491::
    inc  bc
    ld   b, e
    cp   h
    jr   nc, label_C3465
    ld   c, $F1
    add  a, c
    ld   a, [hl]
    ld   a, [$FF0F]
    ld   a, a
    add  a, b
    rra
    ld   [rSB], a
    cp   $06
    ld   sp, hl
    ld    hl, sp+$07
    inc  bc
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  bc
    ld   bc, $FFFE
    nop
    rst  $38
    nop
    cp   c
    ld   a, [hl]
    dec  sp
    and  $23
    call c, label_C30CE
    inc  a
    ret  nz
    ld   [rSB], a
    ld   [$FF1F], a
    nop
    rst  $38
    rst  $38
    nop

label_C34C2::
    inc  b
    ei
    jr   c, label_C348D
    pop  bc
    ld   a, $07
    ld    hl, sp+$7E
    add  a, c
    ld    hl, sp+$07
    ret  nz
    ccf
    rst  $38
    nop
    ld   a, a
    add  a, b
    pop  af
    ld   c, $F3
    inc  c
    or   [hl]
    ld   c, c
    inc  a
    jp   label_C738
    ld   sp, $E7CE
    jr   label_C34C2
    jr   nz, label_C34A2
    ld   b, b
    ld   a, l
    ret  nz
    ld   [hl], e
    ret  z
    ld   e, e

label_C34EB::
    add  a, h
    rst  0
    jr   c, label_C347B
    ld   [hl], e
    cp   $01
    db   $F4 ; Undefined instruction
    dec  bc
    ld    hl, sp+$07
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    nop
    rst  $38
    ld   [label_4FF], sp

label_C3505::
    swap b
    add  a, a
    jr   nc, label_C3491
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    pop  af
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  $28
    rst  $38
    db   $ED ; Undefined instruction
    cp   $C1
    cp   $E0
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    and  b
    rst  $38
    ld    hl, sp+$E0
    ret  c
    jr   nz, label_C3505
    jr   nz, label_C34EB
    ld   b, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_C353B
    ld   [hl], b

label_C353B::
    nop
    ld   [hl], b
    nop
    cp   b
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FE
    rst  $38
    ld   h, b

label_C354B::
    rlca
    ld   [rSB], a
    di
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
    pop  af
    nop
    ld   [rJOYP], a
    ld   [$FF80], a
    ld   h, b
    nop
    rst  $38
    nop
    rst  $38

label_C3564::
    nop
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    nop
    rst  $30
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_24FF], sp
    ei
    ld   b, h
    ei
    nop
    rst  $30
    jr   nc, label_C354B
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_C3582::
    nop
    rst  $38
    ld   [$00FF], sp
    rst  $38
    ld   bc, label_6FF
    rst  $38
    inc  c
    rst  $38
    ld   [label_33FF], sp
    call z, label_C936
    dec  a
    jp   label_C73A
    di
    adc  a, $12
    db   $ED ; Undefined instruction
    inc  h
    ret
    dec  l
    jp   nz, label_E11E
    di
    call z, label_AE51
    sub  a, b
    ld   h, a
    and  h
    ld   d, e
    ld   d, [hl]
    xor  c
    inc  bc
    sbc  a, h
    or   c
    ld   c, [hl]
    ld   a, a
    add  a, b
    ld   h, a
    sbc  a, b
    db   $E3 ; Undefined instruction
    inc  e
    ld   [$FF1F], a
    ld   l, b
    sub  a, a
    ld   h, b
    sbc  a, a
    ld   h, b
    sbc  a, a
    ld  [$FF00+C], a
    dec  e
    ld   [rNR34], a
    pop  bc
    inc  a
    pop  bc
    inc  a
    ret  nz
    ld   a, $10
    rst  $38
    ld   [label_20F7], sp
    rst  $38
    db   $10 ; Undefined instruction
    inc  bc
    ld   a, h
    add  a, a
    jr   c, label_C3564
    jr   nc, label_C35E6
    ld   [hl], b
    rra
    ld   [$FF1F], a
    ld   [$FF3F], a
    ret  nz
    ccf
    ret  nz
    add  a, b
    rst  $38
    call z, label_EFFF
    rst  $38

label_C35E6::
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    pop  hl
    rst  $38
    ld   [rIE], a
    call c, label_C1E20
    and  b
    rra
    ld   [$FFEF], a
    ld   a, [$FF60]
    rst  $38
    ret  nc
    rst  $28
    db   $EC ; Undefined instruction
    di
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    jr   c, label_C3582
    db   $FC ; Undefined instruction
    nop
    ld   a, [hl]
    nop
    cp   $01
    nop
    rst  $38
    ld   [label_4FF], sp
    ei
    nop
    rst  $38
    di
    nop
    ld   a, [$F801]
    rlca
    nop
    rst  $38
    inc  e
    db   $E3 ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_C30FE
    adc  a, a
    ret  nz
    ld   sp, rJOYP
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    db   $10 ; Undefined instruction
    rrca
    ld   a, [$FF81]
    ld   a, [hl]
    ret  nz
    ccf
    ld   [label_4FF], sp
    ei
    nop
    rst  $38
    nop
    rst  $38
    nop

label_C3639::
    rst  $38

label_C363A::
    add  a, b
    ld   a, a
    ld   a, [$FF0F]
    ccf
    ret  nz
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
    ret  nz
    ccf
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    add  hl, bc
    cp   $15
    ld   a, [$F748]
    jr   nz, label_C3639
    add  a, b
    rst  $38
    ld   [hl], b
    adc  a, a
    ccf
    ret  nz
    ld   e, $C1
    di
    inc  c
    or   e
    ld   c, h
    ld   [hl], $C9
    inc  a
    jp   label_C738
    or   c
    ld   c, [hl]
    inc  sp
    call z, label_E718
    inc  c
    di
    add  a, [hl]
    ld   a, c
    jp   label_C213C
    sbc  a, [hl]
    ld   a, [$FF0F]
    sbc  a, b
    ld   h, a
    inc  c
    di
    ld   [$FF1F], a
    ld   h, b
    sbc  a, a
    ld   h, b
    sbc  a, a
    ld   h, d
    sbc  a, l
    ld   [$FF1F], a
    db   $E3 ; Undefined instruction
    inc  e
    ld   h, a
    sbc  a, b
    ld   l, a
    sub  a, b
    jr   nz, label_C3671
    add  a, b
    rst  $38
    ld   b, b
    cp   a
    nop
    cp   $C1
    inc  a
    pop  bc
    inc  a
    ret  nz

label_C369D::
    ld   a, $E0
    rra
    ccf
    ret  nz
    ccf
    ret  nz
    rra
    ld   [$FF1F], a
    ld   h, b
    adc  a, a
    jr   nc, label_C363A
    jr   nc, label_C36B4
    ld   a, b
    inc  bc
    db   $FC ; Undefined instruction
    ld   h, c
    cp   $00
    rst  $38

label_C36B4::
    jr   label_C369D
    ld   c, $F1
    rrca
    ld   a, [$FF1F]
    ld   [$FF3F], a
    ret  nz
    sbc  a, a
    ld   [$FFF3], a
    inc  c
    rst  8
    jr   nc, label_C36FF
    push bc
    add  a, b
    rst  $38
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [hl], h
    adc  a, e
    ld   [hl], a
    add  a, b
    rst  8
    nop
    db   $FC ; Undefined instruction
    inc  bc
    add  a, a
    ld   a, b
    ld   bc, label_C38FE
    add  a, a
    adc  a, [hl]
    ld   [hl], c
    ld   bc, $00FE

label_C36DD::
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    add  a, h
    ld   a, a
    ld  [$FF00+C], a

label_C36E7::
    dec  e

label_C36E8::
    ld   a, d
    adc  a, h
    dec  d
    db   $E8 ; add  sp, d
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    di
    nop
    rst  $38
    rlca
    ld    hl, sp+$7F
    add  a, b
    ld   a, [$FF0F]
    add  a, b
    ld   a, a
    nop
    rst  $38
    rst  $38

label_C36FF::
    nop
    ld   [hl], b
    adc  a, a
    ld   c, $F1
    add  a, e
    ld   a, h
    pop  hl
    ld   e, $38
    rst  0
    ld   c, $F1
    nop
    rst  $38
    nop
    rst  $38
    ld   [hl], $C9
    cp   h
    ld   b, e
    jr   c, label_C36DD
    jr   nc, label_C36E7
    ld   sp, label_33CE
    call z, label_807F
    rst  $38
    nop
    ld   e, $E1
    inc  sp
    call z, label_9C63
    rst  8
    jr   nc, label_C36E8
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld    hl, sp+$07
    db   $F4 ; Undefined instruction

label_C373D::
    dec  bc
    cp   $01
    ld   bc, label_1FE
    xor  $00
    rst  $10
    nop
    rst  $28
    add  a, b
    ld   a, a
    add  a, b
    ld   a, e
    ret  nz
    dec  [hl]
    ret  nz
    dec  sp
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    nop
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_C373D
    nop
    ld   a, e
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
    ld   [rIF], a
    or   b
    add  a, b
    ld   a, a
    jp   label_E33F
    rrca
    rst  $38
    inc  bc
    ld   sp, hl
    rlca
    pop  af
    rrca
    ld   a, [$FF0F]
    ld   sp, hl
    rlca
    ld   [hl], a
    rst  $38
    rst  $38
    rst  $38
    di
    rst  $38
    dec  sp
    rst  $38
    ld   e, a
    cp   a
    ld   h, a
    rst  $38
    jp   label_1BFF
    rst  $20
    db   $E8 ; add  sp, d
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    db   $EC ; Undefined instruction
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
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
    jp   label_3C
    rst  $38
    inc  a
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
    pop  af
    ld   c, $00
    rst  $38
    ld   c, $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [rNR34], a
    ld   a, [$FF0F]
    ld    hl, sp+$07
    cp   $01
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    or   l
    nop
    ld   a, e
    nop
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    ld   sp, hl
    rlca
    di
    rrca
    rlca
    cp   $1E
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    ret  nz
    ld   [$FF80], a
    pop  bc
    add  a, b
    jp   label_E780
    add  a, b
    rst  8
    add  a, b
    ret  nz
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   [$B020], sp
    nop
    ld   [rDIV], a
    ret  nz
    nop
    nop
    nop
    ld   bc, rJOYP
    rst  $38
    rst  $38
    nop
    nop
    nop
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    ret  nz
    nop
    add  a, b
    nop
    rst  $38
    rst  $38
    rst  $38

label_C3833::
    nop
    nop
    nop
    nop

label_C3837::
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
    rst  $38
    ccf
    rst  $38
    scf
    di
    ccf
    di
    dec  l
    rst  $38
    jr   c, label_C3833
    db   $3A ; ldd  a, [hl]
    rst  $20
    jr   c, label_C3837
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
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    call c, label_FCCF
    rst  8
    inc  [hl]
    rst  $38
    inc  c
    rst  $38
    xor  h
    ld   a, a
    adc  a, h
    ld   a, a
    adc  a, h
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rrca
    rrca
    ld   a, $3F
    rst  $38
    ei
    cp   $FF
    rst  $28
    inc  de
    inc  bc
    dec  b
    ld   b, a
    ld   a, e
    rst  8
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    pop  af
    rst  $38
    pop  af
    ret  nc
    sbc  a, a
    ret  nc
    cp   a
    ld    hl, sp+$BF
    db   $FC ; Undefined instruction
    cp   a
    db   $FD ; Undefined instruction
    cp   e
    rst  $38
    or   [hl]
    cp   $BC
    cp   $BD
    inc  c
    rst  $38
    inc  e
    rst  $38
    jr   c, label_C38B5
    ld   [hl], b
    rst  $38
    ld   a, [$FFFF]
    ret  c
    rst  $20
    ld   [label_18CF], sp
    rra
    rra
    or   $0F
    rst  $38
    rra
    rst  $38
    ccf
    cp   $3F
    rst  $38
    ld   e, a
    rst  $18
    scf
    or   a
    rrca
    rrca
    adc  a, b
    ld   [rJOYP], a
    ld    hl, sp+$05
    db   $FD ; Undefined instruction
    sbc  a, [hl]
    rst  $38
    ld   a, $FF
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    cp   $FF
    cp   $01
    nop
    ld   b, e
    nop
    ld   b, c
    ld   [bc], a
    nop
    rst  $20
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ld   bc, $00FE
    rst  $38
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_1005], sp
    rrca
    nop
    ccf
    ld   h, l
    sbc  a, e
    rst  $38
    rrca
    rst  $38
    rla

label_C38FE::
    add  a, b
    ld   a, a
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
    ret  nz
    add  a, b
    inc  bc
    nop
    ld   c, $00
    inc  e
    nop
    ld   a, b
    nop
    ld   a, [$FF00]
    ld   bc, $0100
    nop
    inc  bc
    nop
    dec  b
    nop
    ld   b, $00
    ld   [label_3100], sp
    ld   bc, label_7C7
    daa
    rlca
    rst  $38
    rrca
    xor  $0D
    nop
    nop
    rra
    nop
    ccf
    ld   bc, $9F9F
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    cp   $0C
    inc  c
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    ei
    rst  8
    rst  $38
    adc  a, a
    and  a
    rlca
    ld   [$0006], sp
    rrca
    ld   [$FFF8], a
    add  a, $F7
    call label_FFFF
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    ld   a, b
    ld   a, a
    add  a, b
    nop
    nop
    nop
    ret  nz
    cp   b
    ld    hl, sp+$FF
    db   $FD ; Undefined instruction
    dec  bc
    adc  a, c
    add  a, c
    ld   b, c
    ld   bc, $0101
    ld   bc, label_303
    rlca
    rlca
    rrca
    rrca
    rra
    rra
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ret  nz
    rst  $38
    ld   h, b
    rst  $28
    rst  $38
    db   $FD ; Undefined instruction
    ld   sp, hl
    rst  $38
    ld   a, [$FFFF]
    add  a, b
    rst  $38
    ldd  [hl], a
    rst  $28
    rrca
    rst  $38
    ccf
    cp   $7F
    rst  $38
    rst  $38
    pop  hl
    rst  $28
    pop  af
    ei
    rst  8
    cp   $8D
    ld   e, l
    and  a
    ei
    rlca
    rst  $38
    dec  c
    db   $FD ; Undefined instruction
    rra
    db   $FD ; Undefined instruction
    cp   e
    cp   $BF
    cp   $BF
    cp   $BD
    jp  c, label_E49F
    sbc  a, a
    rst  $28
    sbc  a, a
    rst  $38
    sbc  a, a
    inc  a
    cp   [hl]
    inc  a
    cp   $10
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    and  b
    rst  $18
    ld   a, b

label_C39BD::
    xor  a
    ld   a, [$FFFF]
    rlca
    rrca
    rlca
    rra
    nop
    ccf
    jr   nz, label_C39A5
    nop
    ei
    nop
    ld   a, [$FF40]
    and  b
    ld   [rSB], a
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$1F
    db   $FC ; Undefined instruction
    ccf
    sbc  a, $7E
    cpl
    inc  a
    rst  $18
    jr   c, label_C39BD
    ld   [hl], d
    cp   a
    nop
    rst  $38
    add  a, b
    ld   a, a
    call nz, label_9C3B
    ld   h, e
    ld   c, $F1
    ccf
    pop  bc
    ld   a, [hl]
    add  a, c
    ld   c, l
    sub  a, d
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    rst  8
    ret  nc
    push hl
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    pop  bc
    add  a, c
    jp   nz, label_C282
    add  a, d
    call nz, label_C484
    add  a, h
    ret  nz
    add  a, b
    rlca
    nop
    inc  bc
    nop
    rlca
    ld   bc, $010F
    rra
    inc  bc
    rrca
    rlca
    rrca
    rrca
    rrca
    rrca
    db   $FC ; Undefined instruction
    dec  de
    db   $FC ; Undefined instruction
    ld   [hl], e
    ld   [$FFFC], a
    ld   [$FFC8], a
    ret  nz
    ret  nc
    add  a, b
    add  a, b
    nop
    add  a, b
    add  a, b
    add  a, c
    ld   a, h
    cp   h
    cp   h
    ld   [bc], a
    ld   e, b
    rlca
    db   $10 ; Undefined instruction
    nop
    ccf
    rrca
    ld   a, a
    sub  a, a
    ld   a, a
    dec  a
    db   $FD ; Undefined instruction
    nop
    rra
    nop
    ccf
    ld   e, $ED
    ccf
    rst  $38
    ld   a, [$FFFF]
    rst  $28
    rst  $38
    or   a
    rst  $38
    ccf
    rst  $38
    add  a, a
    ld   a, b
    ld   bc, $00FE
    rst  $38
    call nz, label_DEFF
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    inc  e
    ld   [$FF0C], a
    ld   a, [$FF06]
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    adc  a, d
    db   $FC ; Undefined instruction
    cp   $FC
    db   $E8 ; add  sp, d
    rst  $28
    jr   c, label_C3AB3
    inc  a
    ccf
    ld   a, $3F
    ccf
    ccf
    rra
    rra
    rlca
    rlca
    ld   bc, label_1F03
    rst  $38
    rlca
    rst  $38
    ld   b, $FF
    ld   c, $FF
    cp   $FF
    ld   a, a
    ld   a, a
    rst  $18
    call c, label_F0FF
    jp   label_13D
    rst  $38
    inc  bc
    db   $FD ; Undefined instruction
    ld   bc, label_3FF
    db   $FD ; Undefined instruction
    rlca
    ld   sp, hl
    add  a, a
    pop  af
    db   $E3 ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $18
    sbc  a, a
    rst  8
    adc  a, a
    jp   label_C783
    adc  a, a
    rst  0
    cp   a
    jp   label_C0BF
    cp   a

label_C3AAE::
    ret  nz
    cp   a
    ld   a, [$FFFF]
    jp   hl

label_C3AB3::
    rst  $38
    ld   a, [$FFFF]
    pop  af
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  0
    rst  $38
    rlca
    rst  $38
    rst  $28
    inc  sp
    ret  nz
    inc  de
    add  a, b
    add  a, a
    nop
    rlca
    nop
    rrca
    add  a, b
    sbc  a, e
    ld   [$FFD6], a
    ld   [$FF81], a
    nop
    pop  bc
    inc  a
    cp   $6D
    db   $EC ; Undefined instruction
    jr   label_C3AAE
    nop
    add  a, b
    nop
    nop
    add  hl, bc
    nop
    ld   e, $80
    ld   a, $C0
    and  e
    inc  d
    dec  b

label_C3AE3::
    ld   c, $0B
    dec  c
    rra
    ld   e, $35
    ld   [hl], $03
    inc  c
    ld   bc, label_30E
    inc  e
    ei
    jr   label_C3AE3
    ld   [hl], b
    ld   [rJOYP], a
    pop  hl
    nop
    di
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld   e, l
    bit  3, l
    rst  $18
    ld   e, l
    bit  3, l
    jp   label_C35D
    ld   d, l
    bit  3, l
    jp   label_D34D
    rrca
    rrca
    rra
    rra
    rrca
    rrca
    ccf
    ccf
    ld   a, $3E
    dec  [hl]
    inc  [hl]
    ld   h, b
    ld   h, b
    ld   h, c
    ld   h, b
    jp   nz, label_80C1
    add  a, a
    pop  af
    rrca
    db   $E3 ; Undefined instruction
    rra
    rst  $28
    rra
    rst  $18
    ccf
    sbc  a, a
    rra
    ccf
    ccf
    ld   [hl], d
    di
    and  $FF
    call c, label_9FFF

label_C3B37::
    rst  $38
    cp   [hl]
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ei
    rrca
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ld   e, [hl]
    rst  $18
    cp   $FF
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
    ld   a, a
    adc  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FC
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  8
    ccf
    rst  $38
    dec  e
    inc  bc
    ld   a, $D1
    ld   a, [hl]
    ld   sp, hl
    db   $FD ; Undefined instruction
    ld   a, [$FAF4]
    ld    hl, sp+$FE
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    ld   [rIE], a
    ld   [rIE], a
    ld   h, b
    jr   nc, label_C3B37
    nop
    rra
    nop
    rra
    nop
    rra
    nop
    rrca
    db   $E3 ; Undefined instruction
    dec  e
    add  a, a
    ld   a, c
    rlca
    push af
    rrca
    ld   sp, hl
    rra
    rst  $38
    rra
    rst  $38
    ccf
    db   $FD ; Undefined instruction
    ld   a, e
    sbc  a, l
    pop  bc
    cp   [hl]
    db   $E3 ; Undefined instruction
    cp   h
    db   $DB
    sbc  a, c
    pop  bc
    add  a, c
    ret  nz
    add  a, b
    db   $E3 ; Undefined instruction
    sbc  a, h
    rst  $38
    ret  nz
    ld   a, a
    rst  $38
    ret  z
    ld   c, e
    ld   a, [$FFF7]
    ld   a, [$FFF7]
    ld   [$FFE7], a
    ret  nz
    jp   label_3FE
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    nop
    jp   label_E700
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF0F]
    ld   [$FF3F], a
    ld   [rIE], a
    ret  nz
    rst  $38
    rst  $38
    ld   c, $F1
    ld   c, $F9
    rlca
    or   $80
    ld   h, b
    add  a, b
    nop
    rst  $20
    jr   label_C3BDC
    nop
    rst  $38
    rst  $38
    ld   bc, label_33E
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$03
    ld   [hl], b
    inc  bc
    nop
    rrca
    ld   a, [$FFFF]
    nop
    rst  $38
    rst  $38
    ld    hl, sp+$07
    ld    hl, sp+$03
    ld   a, [$FF00+C]
    ld   sp, $E0C0
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    cp   d
    sub  a, a
    cp   d

label_C3C03::
    cp   a
    cp   d
    sub  a, a
    cp   d
    add  a, a
    cp   d
    rst  0
    or   d
    adc  a, a
    cp   d
    add  a, a
    cp   d
    add  a, a
    ld   h, c
    ld   h, b
    jp   label_CFF0
    ld   a, [$FCEE]
    inc  e
    db   $FC ; Undefined instruction
    ld   a, $FA
    inc  a
    ld   a, h
    ld   a, a
    db   $FC ; Undefined instruction
    ccf
    ccf
    cp   a
    ld   a, a
    db   $76 ; Halt
    scf
    inc  h
    daa
    inc  [hl]
    scf
    inc  [hl]
    scf
    ld   a, $3F
    sbc  a, a
    rra
    rst  $38
    rst  $38
    ld   a, $FF
    rra
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
    rrca
    rst  $38
    ld   h, a
    rst  $38
    db   $D3 ; Undefined instruction
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
    cp   $FF
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    jp   hl
    rst  $28
    pop  af
    rst  $38
    di
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    push af
    rst  $38
    db   $FC
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
    db   $FD ; Undefined instruction
    ld   a, [$FF00+C]
    cp   $FF
    ld    hl, sp+$FC
    di
    cp   $FB
    db   $FC ; Undefined instruction
    ei
    ld   sp, hl
    cp   $18
    rra
    rra

label_C3C83::
    ld   e, $8F
    inc  c
    adc  a, a
    nop
    cpl
    ret  nz
    ld   b, a
    add  a, b
    rst  0
    nop
    rst  0
    nop
    rst  $38
    rra
    rst  $38
    ccf
    db   $FD ; Undefined instruction
    ccf
    db   $DB
    dec  e
    sbc  a, e
    dec  l
    or   a
    ld   e, e
    ld   a, a
    dec  a
    ld   b, e
    ld   a, l
    rst  $38
    rst  $38
    nop
    nop
    ld   bc, $9300
    nop
    sbc  a, e
    nop
    sbc  a, e
    nop
    ld   h, h
    sbc  a, e
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    ld   a, [$FF07]
    ld    hl, sp+$23
    call c, label_DA77
    ld   a, a
    db   $E4 ; Undefined instruction
    ld    hl, sp+$17
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    cp   a
    nop
    rst  $38
    nop
    ld   a, a
    nop
    db   $FD ; Undefined instruction
    ld   b, $FD
    adc  a, [hl]
    rlca
    pop  af
    rla
    pop  hl
    daa
    pop  de
    rst  $38
    ld   bc, label_1F7
    rst  $30
    ld   bc, label_5FB
    add  a, a
    ld   a, c
    inc  b
    rst  $38
    ld   b, $FD
    ld   b, $FD
    ld   b, $FD
    ld   b, $FD
    ld   b, $FD
    ld   b, $FD
    inc  b
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    or   b
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, c
    jp   label_C383
    add  a, e
    rst  8
    adc  a, a
    rst  8
    adc  a, a
    rst  $18
    sbc  a, a
    rst  $38
    ld    hl, sp+$FE
    ld   a, [$FFF2]
    db   $FC ; Undefined instruction
    ld   [rIE], a
    ei
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [label_1F5F]
    rra
    rra
    ld   e, a
    rra
    cp   a
    ccf
    ccf
    ccf
    cpl
    daa
    ccf
    scf
    sbc  a, a
    rrca
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    ei
    rst  $38
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rst  $30
    adc  a, $FF
    adc  a, a
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  0
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
    rst  $38
    rst  $38
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
    rst  8
    rst  $38
    add  a, e
    rst  $38
    ld   sp, hl
    cp   $FC
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    push hl
    cp   $E5
    cp   $C4
    cp   $CD
    cp   $E7
    dec  b
    ld   a, $81
    cp   $03
    cp   $07
    cp   a
    rlca
    db   $76 ; Halt
    dec  bc
    rst  $20
    jr   label_C3D8E

label_C3D8F::
    inc  c
    ld   bc, label_3FF
    db   $FD ; Undefined instruction
    ld   bc, label_3FF
    db   $FD ; Undefined instruction
    rlca
    ld   sp, hl
    adc  a, a
    ld   [hl], c
    rst  $18
    add  hl, hl
    rst  $38
    inc  de
    ret  nz
    ccf
    ld   [$FF1F], a
    pop  af
    rrca
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $30
    rrca
    ld   a, [$FF0F]
    ld    hl, sp+$07
    ld   a, a
    db   $E3 ; Undefined instruction
    rst  $38
    push de
    rst  $38
    db   $E3 ; Undefined instruction
    push hl
    pop  af
    call label_83E0
    jp   nz, label_8103
    ld   b, $80
    xor  $07
    ret  c
    inc  bc
    add  a, h
    inc  bc
    inc  b
    rlca
    ld   c, $07
    sbc  a, a
    inc  c
    cp   $19
    cp   [hl]
    add  a, c
    inc  bc
    db   $FD ; Undefined instruction
    rlca
    ld   sp, hl
    inc  bc
    db   $FD ; Undefined instruction
    rlca
    ld   sp, hl
    rlca
    pop  af
    rlca
    pop  hl
    rlca
    pop  af
    rlca
    pop  hl
    dec  b
    db   $FC ; Undefined instruction
    dec  b
    db   $FC ; Undefined instruction
    dec  b
    db   $FC ; Undefined instruction
    dec  b
    db   $FC ; Undefined instruction
    dec  b
    db   $FC ; Undefined instruction
    dec  b
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    dec  b
    db   $FC ; Undefined instruction
    jr   nc, label_C3DF1
    jr   nc, label_C3DF3
    jr   nc, label_C3DF5
    or   b
    rst  $38
    jr   nc, label_C3DF9
    ld   [hl], b
    rst  $38
    ld   [hl], b
    rst  $38
    jr   nc, label_C3DFF
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $18
    sbc  a, a
    db   $FD ; Undefined instruction
    adc  a, [hl]
    db   $E8 ; add  sp, d
    sub  a, a
    ret  nc
    cp   a
    ld   [$FFBF], a
    ld   [$FFBF], a
    db   $FD ; Undefined instruction
    cp   $FC
    cp   $FB
    db   $FD ; Undefined instruction
    ld   a, a
    rst  $30
    ld   a, a
    rst  $18
    ccf
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    daa
    rst  $38
    inc  bc
    pop  bc
    ld   b, c
    pop  bc
    add  a, b
    jp   nz, label_C281
    ret  nz
    pop  af
    add  a, b
    or   c
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
    ld   a, a
    ld   a, [$FF3F]
    ret  nz
    ccf
    rst  $38
    rst  $38
    cpl
    nop
    reti
    ld   h, $D9
    ld   h, $FB
    inc  b
    ei
    inc  b
    inc  b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    ld    hl, sp+$FF
    ld   [hl], b
    ld   a, a
    pop  af
    rst  $38
    inc  sp
    ccf
    rlca
    rst  $38
    rrca
    rst  $38
    xor  a
    rst  $28
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    xor  $ED
    ld   [$FFFE], a
    ld   sp, hl
    db   $EC ; Undefined instruction
    jp   hl
    sbc  a, $F0
    db   $FC ; Undefined instruction
    ret  nz
    ld   sp, hl
    db   $E8 ; add  sp, d
    pop  de
    ld    hl, sp+$81
    reti
    ld   b, $B9
    ld   b, $FF
    ld   [label_FFE], sp
    ld   e, $F9
    inc  e
    rst  $38
    ld   e, h
    cp   a
    cp   h
    ld   a, a
    cp   b
    ld   e, a
    ld   a, h
    rst  $30
    ld   a, a
    cp   l
    ld   a, a
    ld   a, l
    ld   a, a
    ld   sp, hl
    ld   [hl], a
    or   c
    ld   [hl], a
    add  a, c
    ld   [hl], a
    add  a, c
    rst  $38
    ld   bc, label_1FF
    ld   a, h
    inc  bc
    rst  $38
    nop
    xor  [hl]
    ld   bc, label_B50
    nop
    add  a, a
    nop
    rlca
    nop
    rrca
    nop
    sbc  a, a
    dec  c
    ret  nz
    cpl
    sub  a, b
    ld   e, $E1
    rra
    ld   [$FF3F], a
    ret  nz
    ld   a, [hl]
    add  a, c
    dec  a
    jp   nz, label_8E77
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
    nop
    rst  $38
    rst  $38
    rst  $38
    rlca
    pop  hl
    rlca
    pop  bc
    rrca
    add  a, c
    rra
    ld   bc, $013F
    ld   a, a
    ld   b, c
    ld   a, a
    ld   bc, label_1FF
    rst  $38
    rst  $38
    sbc  a, l
    add  a, b
    and  d
    db   $A6
    and  [hl]
    reti
    or   a
    adc  a, b
    or   a
    adc  a, b
    ret  nz
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    ld   bc, label_3C5
    db   $ED ; Undefined instruction
    inc  bc
    ei
    rlca
    db   $ED ; Undefined instruction
    inc  bc
    ld   bc, rIE
    rst  $38

label_C3F00::
    db   $E8 ; add  sp, d
    cp   a
    ret  c
    sbc  a, a

label_C3F04::
    rst  $10
    sub  a, l
    cp   $BF
    rst  $38
    cp   a
    sbc  a, $9F
    ret  z
    sbc  a, a
    ret  nz
    sbc  a, a
    ccf
    rst  $38
    ccf
    rst  $18
    ld   l, [hl]
    cp   a
    ld   e, a
    rst  $38
    rst  $38
    rst  $38
    rra
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    inc  sp
    ret  nz
    ccf
    ret  nz
    inc  a
    ret  nz
    adc  a, b
    ld   a, [$FFC0]
    ld    hl, sp+$E1
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    rst  $28
    ld    hl, sp+$80
    ld   a, a
    add  a, b
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, $A0
    inc  e
    ld   h, b
    nop
    ret  nz
    jr   nz, label_C3F04
    inc  h
    pop  hl
    rst  $38
    nop
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    dec  sp
    ld   h, b
    ld   bc, label_3F3F
    ei
    rst  $38
    add  a, c
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ld   b, $F8
    ld   b, $F1
    add  a, b
    rst  $38
    nop
    cp   $00
    rst  $38
    nop
    cp   $00
    ld   a, h
    ld   b, b
    inc  a
    ret  nz
    ld   a, $00
    rst  $38
    ld   [hl], b
    ld   c, $40
    rra
    inc  bc
    cp   l
    inc  bc
    rra
    rlca
    ld   a, $0F
    inc  a
    ccf
    ld   a, h
    ld   a, a
    ld    hl, sp+$7C
    rst  $38
    db   $FD ; Undefined instruction
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    rst  $18
    ld   h, b
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld    hl, sp+$17
    ld   [hl], e
    dec  b
    ld   [hl], e
    dec  b
    ld   a, a
    ld   bc, label_9F7
    rlca
    pop  af
    rlca
    ld   sp, hl
    rlca
    pop  af
    rlca
    ld   sp, hl
    nop
    rst  $38
    ld   de, label_3FEE
    ret  nz
    rst  $38
    ld   b, b
    cp   $80
    db   $FD ; Undefined instruction
    add  a, d
    rst  $38
    ld   b, b
    rst  $38
    rst  $38
    db   $E8 ; add  sp, d
    rra
    di
    ld   e, $FF
    inc  a
    db   $FC ; Undefined instruction
    ld   a, h
    ld   a, b
    ld   a, b
    rst  $38
    jr   nc, label_C3FBC
    nop
    rst  $38
    rst  $38
    rst  $38
    inc  e
    rst  $38
    ld   a, h
    rst  $38
    ld   a, b
    ccf
    jr   nc, label_C3FD8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   a, a
    ld   bc, label_11D7
    rst  $20
    dec  h
    rst  $38
    ld   a, c

label_C3FD8::
    rst  $38
    ld   sp, hl
    rst  $38
    pop  af
    rst  $38
    ld   h, e
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
    nop
    rst  $38
    nop

label_C3FF3::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
