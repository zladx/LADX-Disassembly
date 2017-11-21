section "bank16",romx,bank[$10]
    rst  $38
    rst  $38
    rst  $38
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
    rst  $28
    rst  $30
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   e, a
    ld   e, a
    xor  e
    xor  e
    push de
    push de
    ld   a, [$FFFA]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    ld   a, [$FDFA]
    db   $FD ; Undefined instruction
    cp   $FE
    rst  $38
    rst  $38
    ld   a, [label_415FA]
    ld   d, l
    xor  e
    xor  e
    ld   e, a
    ld   e, a
    rst  $38
    rst  $38
    ld   e, a
    ld   e, a
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    push de
    push de
    cp   $FE
    push af
    push af
    xor  e
    xor  e
    ld   d, a
    ld   d, a
    rst  $38
    rst  $38
    ld   e, l
    ld   e, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    cp   e
    cp   e
    ld   a, l
    ld   a, l
    cp   $FE
    rst  $18
    rst  $18
    xor  e
    xor  e
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   e, l
    ld   e, l
    ld   [$D5EA], a
    push de
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    ld   a, [hli]
    ld   a, [hli]
    dec  b
    dec  b
    ld   a, [label_43FFA]
    ld   a, a
    xor  a
    xor  a
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, b
    ld   d, b
    xor  e
    xor  e
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   [label_415EA], a
    ld   d, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    ld   a, [bc]
    ld   a, [bc]
    nop
    nop
    xor  a
    xor  a
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, l
    ld   d, l
    xor  d
    xor  d
    ld   d, b
    ld   d, b
    rst  $38
    rst  $38
    ccf
    ccf
    rra
    rra
    inc  bc
    inc  bc
    add  a, b
    add  a, b
    ld   a, [$FFF0]
    rst  $38
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
    rst  $20
    rra
    rra
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
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
    rlca
    rlca
    inc  bc
    inc  bc
    ld   bc, rSB
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    add  a, h
    add  a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_400FE::
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $28
    db   $10
    db   $10
    rst  $28
    add  a, b
    ld   a, a
    nop
    di
    nop
    ret  nz
    ld   a, [$FF00]
    inc  a
    nop
    ret  nz
    ccf
    rlca
    ld    hl, sp+$7F
    add  a, b
    cp   $01
    ccf
    ret  nz
    rrca
    ld   a, [$FF00]
    rrca
    rra
    nop
    ld   a, a
    add  a, b
    ld   c, $F1
    ld   a, [$FF0F]
    inc  bc
    db   $FC ; Undefined instruction
    sbc  a, a
    ld   h, b
    rst  $38
    nop
    rra
    ld   [$FF3E], a
    ld   bc, label_38C7
    ld   bc, label_3CFE
    jp   label_FF
    rst  $38
    nop
    cp   $01
    ld   a, [$FF0F]

label_4013E::
    ld   bc, label_1CF8
    nop
    rlca
    nop
    ld   e, $00
    ld   h, b
    nop
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ccf
    jr   c, label_40152

label_40152::
    ld   [rJOYP], a
    inc  bc
    nop
    ld   c, $00
    inc  a
    inc  c
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   [hl], b
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    nop
    inc  bc
    nop
    ld   [$FFE0], a
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    db   $FC ; Undefined instruction
    nop
    pop  hl
    nop
    rra
    nop
    cp   $00
    rst  $38
    rst  $38
    cp   $FE
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    add  a, e
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   label_EC3
    ld   c, $30
    jr   nc, label_40197

label_40197::
    nop
    ld   [hl], b
    ld   [hl], b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    ld   [$FFE0], a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, a
    ld   a, a
    ccf
    ccf
    rrca
    rrca
    rlca
    rlca
    pop  hl
    pop  hl
    ld   a, a
    ld   a, a
    rrca
    rrca
    nop
    nop
    add  a, b
    add  a, b
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$F8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    cp   a
    ccf
    rst  $18
    rra
    ld   l, a
    adc  a, a
    scf
    rst  0
    dec  de
    db   $E3 ; Undefined instruction
    add  hl, bc
    pop  af
    dec  c
    pop  af
    ld   b, $F8
    ld   b, $F8
    rlca
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$0F
    ld   a, [$FF0F]
    pop  af
    rra
    pop  hl
    ld   a, $C2
    rst  $38
    cp   $FD
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    ei
    ld    hl, sp+$FF
    ld    hl, sp+$F7
    ld   a, [$FFFF]
    ld   a, [$FFEE]
    ld   [rIE], a
    nop
    rst  $38
    nop
    and  $00
    add  a, $00
    add  a, $00
    adc  a, $00
    ld   a, h
    nop
    ld   a, b
    nop
    rlca
    nop
    ld   c, $00
    ld   e, $00
    inc  e
    nop
    ld   a, b
    nop
    ld   [rJOYP], a
    pop  bc
    ld   bc, label_3C3
    nop
    nop
    nop
    nop
    ld   sp, label_3131
    ld   sp, label_3333
    rst  $30
    rst  $30
    rst  $20
    rst  $20
    jp   label_FFC3
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  8
    adc  a, a
    adc  a, a
    adc  a, a
    adc  a, a
    rrca
    rrca
    rrca
    rrca
    ld   a, [$D0E5]
    rst  8
    db   $FD ; Undefined instruction
    pop  bc
    rst  $28
    rst  8
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $30
    ld   a, [$FFFE]
    ld   [$FF3F], a
    pop  bc
    nop
    rst  $38
    ld   sp, hl
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    inc  bc
    ld   a, b
    nop
    ld   a, b
    nop
    di
    ret  nz
    di
    nop
    ld   [hl], $C0
    sbc  a, [hl]
    add  a, b
    ld    hl, sp+$F8
    cp   $FE
    ccf
    ccf
    rst  0
    rlca
    nop
    nop
    ld   e, $1E
    dec  sp
    inc  hl
    dec  sp
    inc  hl
    inc  hl
    inc  hl
    ld   e, $1E
    adc  a, [hl]
    adc  a, [hl]
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    rst  $38
    rst  $38
    cp   a
    cp   a
    sbc  a, a
    sbc  a, a
    rra
    rra
    ccf
    ccf
    ld   a, a
    ld   a, a
    rst  $28
    adc  a, a
    rst  $28
    adc  a, a
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    ld   a, l
    ld   a, l
    ccf
    ccf
    dec  e
    inc  e
    ccf
    jr   c, label_40324
    ld   [hl], b
    ld   a, a
    ld   [hl], b
    adc  a, a
    adc  a, a
    rst  $38
    rst  $38
    ei
    ei
    di
    sub  a, e
    rst  $30
    scf
    cp   a
    ccf
    rst  $38
    ld   a, a
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
    rst  $38
    rst  $38
    add  a, a
    cp   a
    cp   a
    rst  $18
    sbc  a, a
    xor  a
    rst  8
    sub  a, a
    rst  $20
    dec  bc
    ld   [hl], e
    rrca
    ld   [hl], e
    dec  b
    ld   sp, hl
    rlca
    ld   sp, hl
    cp   $03
    db   $FC ; Undefined instruction
    dec  b
    ld    hl, sp+$0B
    ld   a, [$FF37]
    ret  nz
    rst  8
    add  a, c
    ld   a, [hl]
    and  $19
    ld    hl, sp+$07
    ld   [bc], a
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$06
    ld    hl, sp+$0F
    pop  af
    ld   a, [hl]
    add  a, d
    db   $FC ; Undefined instruction
    ld   [$FFD8], a
    ret  nz
    ld   sp, hl
    ret  nz
    cp   c
    add  a, b
    or   e
    add  a, b
    di
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    pop  af
    nop
    di
    nop
    rst  $20
    nop
    add  a, a
    nop
    rlca
    nop
    ld   b, $00
    ld   b, $00
    jp   label_C003
    nop

label_40324::
    jp   nz, label_C602
    ld   b, $86
    ld   b, $0E
    ld   c, $1C
    inc  e
    jr   label_40348
    add  a, e
    add  a, e
    inc  bc
    inc  bc
    rlca
    rlca
    rrca
    rrca
    ld   c, $0E
    inc  a
    inc  a
    ld   a, h
    ld   a, h
    ld   a, l
    ld   a, l
    rra
    rra
    ccf
    ccf
    ld   a, a
    ld   a, a
    rst  $30
    rst  $30

label_40348::
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   a
    cp   a
    rst  $18
    sbc  a, a
    xor  a
    rst  8
    sub  a, a
    rst  $20
    sbc  a, a
    rst  $20
    dec  bc
    ld   [hl], e
    rrca
    di
    dec  b
    ld   sp, hl
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    rst  $38
    cp   $FD
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ei
    ld    hl, sp+$FF
    ld    hl, sp+$F7
    add  a, h
    adc  a, a
    ld   [hl], h
    ld   a, $38
    rlca
    ld   sp, hl
    rlca
    ld   sp, hl
    rlca
    ld   sp, hl
    ld   b, $F8
    ld   c, $F2
    ld   a, $C3
    db   $FC ; Undefined instruction
    dec  b
    ld    hl, sp+$1B
    nop
    nop
    ld   bc, label_3701
    ld   [hl], $3F
    jr   c, label_403D8
    jr   nc, label_4037A
    ret  nc
    rst  $38
    ld   [$FFBF], a
    and  b
    rra
    db   $10
    db   $FF
    ld    hl, sp+$FF
    ld   b, $FF
    ld   bc, $00FF
    ld   [$FF1F], a
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    rst  $18
    rra
    rst  $30
    rlca
    ld   sp, hl
    ld   bc, $80FF
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    nop
    rst  $38

label_403C0::
    ld   a, [$FFF0]
    call c, label_E0C3
    sbc  a, a
    ld    hl, sp+$7F
    and  $07
    db   $FD ; Undefined instruction
    ld   bc, $C03E
    rst  $38
    stop
    cp   $40
    ccf
    db   $10
    db   $CF
    ld   [$00F7], sp
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    add  a, c
    add  a, c
    ld   l, [hl]
    ld   [rNR13], a
    ld   a, [$FF08]
    ld    hl, sp+$04
    db   $FC ; Undefined instruction
    ld   b, $FA
    add  a, b
    ld   a, h
    ld   b, c
    cp   a
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    sbc  a, b
    jr   label_403C3
    inc  c
    ld   h, h
    inc  b
    ldd  [hl], a
    ld   [bc], a
    stop
    ld   bc, $F001
    ld   a, [$FF00]
    nop
    rrca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    ccf
    nop
    inc  e
    nop
    nop
    nop
    rra
    rra
    rlca
    rlca
    pop  hl
    ld   bc, $00F0
    ld   a, [$FF00]
    add  a, b
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ei
    rst  $38
    ld   a, [$FFFF]
    rst  $38
    db   $EC ; Undefined instruction
    db   $E3 ; Undefined instruction

label_40428::
    ld   a, [$FFEF]
    rst  $18
    ret  nz
    rst  $18
    rst  $18
    ld   h, b
    ld   e, a

label_40430::
    inc  e
    db   $E8 ; add  sp, d
    call nz, label_FF3C
    ld  [$FF00+C], a

label_40436::
    ld   a, e
    sub  a, d
    rra

label_40439::
    db   $EC ; Undefined instruction
    rst  $30
    inc  b
    adc  a, a
    adc  a, b
    rst  $38
    ld   [hl], b
    ld   a, [$FF60]
    or   c
    jr   nc, label_40430
    jr   z, label_404BE
    and  h
    ld   l, e
    or   d
    rst  0
    dec  de
    rst  0
    ld   e, e

label_4044E::
    add  a, a
    cp   c
    rst  $38
    jp   label_40C7F
    ld   a, a
    ld   d, b
    ld   a, a
    ld   d, b
    ld   a, a
    ld   h, b
    ld   a, a
    ld   h, b
    ld   a, a
    ld   h, b
    ld   a, a
    ld   b, b
    ld    hl, sp+$87
    pop  hl
    ld   e, $C7
    jr   c, label_40436
    jr   nc, label_40428
    ld   b, b
    cp   a
    ld   b, b
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    jr   c, label_40439
    pop  hl
    ld   e, $C3
    inc  a
    rst  0
    jr   c, label_40400
    ld   a, b
    adc  a, a
    ld   [hl], b
    rst  8
    jr   nc, label_4044E
    jr   nc, label_40480
    inc  c
    cp   a
    ld   b, e
    cp   a
    ld   b, b
    rra
    ld   [rTAC], a
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ccf
    ccf
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    pop  af
    ld   c, $07
    ld    hl, sp+$1F
    ld   [$FF3F], a
    ret  nz
    pop  bc
    sbc  a, a
    ld   [$FF6F], a
    ld    hl, sp+$1F
    db   $FC ; Undefined instruction
    rlca
    cp   $03
    cp   $03
    rst  $38
    ld   bc, label_FEF
    nop
    nop
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    jr   nz, label_4049C
    jr   nz, label_4049E

label_404BE::
    db   $10
    db   $F0
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
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc

label_404CE::
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rrca
    rrca
    ccf
    ccf
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
    ld   a, $00
    ld    hl, sp+$F8
    rst  $20
    ld   [$FFF1], a
    ld   a, [$FFFC]
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    dec  b
    ld    hl, sp+$1B
    ret  nz
    rst  8
    jp   nz, label_F83D
    rlca
    db   $FD ; Undefined instruction
    ld   [bc], a

label_404FC::
    ld   a, a
    nop
    sbc  a, a

label_404FF::
    add  a, b
    and  b
    ccf
    ld   e, a
    sub  a, b
    jr   z, label_404CE
    ccf
    rst  8
    rla
    and  $1D
    push hl
    ld   e, $E4
    dec  e
    and  $7F

label_40511::
    and  b
    cp   a
    jr   nz, label_4055B
    ld   b, b
    add  a, [hl]
    add  a, b
    add  a, $00
    adc  a, $00
    db   $FC ; Undefined instruction
    add  a, b
    ld   a, b
    ld   b, b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $18
    ret  nz
    rst  $18
    ret  nz
    ld   l, a
    ld   h, b
    inc  l
    jr   nz, label_40511
    nop
    ret  nz
    nop
    pop  bc
    ld   bc, label_181
    add  a, e
    inc  bc
    add  a, e
    inc  bc
    rlca
    rlca
    ld   b, $06
    rst  $28
    db   $10
    db   $7F
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    inc  b
    cp   l
    add  a, h
    sbc  a, h
    add  a, h
    adc  a, $C2
    add  a, b
    ld   a, a
    ret  nz
    ccf
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38

label_4055B::
    nop
    rst  $38
    nop
    ccf
    nop
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF1F]
    ld   [rTAC], a
    ld    hl, sp+$81
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   c
    ld   [hl], $FC
    ld   e, $FE
    rlca
    rst  $38
    inc  bc
    db   $FD ; Undefined instruction
    dec  e
    rst  $38
    ld   [label_6FD], sp
    db   $FD ; Undefined instruction
    dec  b
    db   $10
    db   $F0
    adc  a, b
    ld   l, b
    ld   [label_878], sp
    ld   a, b
    ld   [$8438], sp
    inc  [hl]
    call z, label_CC14
    call nc, label_707
    rlca
    rlca
    rlca
    rlca
    rrca
    rrca
    rrca
    rrca
    rra
    rra
    rra
    rra
    ccf
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  8
    adc  a, a
    adc  a, a
    adc  a, a
    adc  a, a
    adc  a, a
    adc  a, a
    ld   e, e

label_405AF::
    ld   e, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  hl
    pop  hl
    ret  nz
    ret  nz

label_405BC::
    add  a, b
    add  a, b
    nop
    nop
    rst  $38
    rst  $38
    rst  $20
    ld   [$FFF1], a
    ld   a, [$FFFC]
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rrca
    push hl
    ld   a, [de]
    ld    hl, sp+$07
    ld   a, a
    nop
    ld   e, $00
    cp   $FE
    rst  $28
    ld   [$FFF3], a
    ld   a, [$FF19]
    ld  [$FF00+C], a
    jr   c, label_405AF
    ld   a, [$FF17]
    ld   [$FF2F], a
    ret  nz
    rst  $18
    ld   [$B1F7], sp
    ld   c, [hl]
    rst  $20
    jr   label_40615
    jr   nz, label_40624
    ld   sp, label_43C7C
    or   $F6
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    dec  b
    dec  b
    dec  b
    dec  b
    add  a, h
    add  a, h
    add  a, d
    add  a, d
    jp   nz, label_F1C2
    pop  af
    rst  $28
    rst  $28
    rst  $28
    db   $E4 ; Undefined instruction
    jp   label_420C1
    ld   h, b
    jr   nc, label_40646
    cp   $7E
    ei
    ld   c, e
    cp   a
    jr   z, label_405BC
    ld   l, b
    rst  $30
    nop
    rlca
    nop
    add  a, b
    add  a, b

label_40624::
    ld   h, b
    ld   h, b
    ccf
    ccf
    rst  $30
    rst  $30
    inc  a
    inc  a
    ld   a, [hl]
    db   $76 ; Halt
    or   l
    sub  a, a
    rst  $38
    nop
    ld   a, $00
    ld   bc, $E301
    ld  [$FF00+C], a
    sub  a, $D5
    ld   l, h
    ld   c, a
    inc  [hl]
    ld   h, $33
    inc  hl
    db   $ED ; Undefined instruction
    inc  c
    ld   l, b
    ld   h, a
    ret  nz
    cp   [hl]

label_40646::
    dec  l
    pop  bc
    dec  de
    add  a, [hl]
    ld   de, $D700
    call nz, label_D0D
    call c, label_9F44
    add  a, e
    rst  $18
    add  a, e
    rst  $28
    inc  bc
    rst  $28
    inc  bc
    db   $EB ; Undefined instruction
    inc  bc
    rst  $28
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  8
    rst  8
    rst  0
    rst  0
    jp   label_E1C3
    pop  hl
    ld   h, b
    ld   h, b
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    ld    hl, sp+$F8
    rst  $38
    rst  $38
    ei
    ld   sp, hl
    ei
    ld    hl, sp+$FD
    db   $FC ; Undefined instruction
    ld   a, $3E
    rrca
    rrca
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ld    hl, sp+$FB
    ld    hl, sp+$F7
    ld   a, [$FFF7]
    ld   a, [$FFEE]
    ld   [$FF7F], a
    inc  bc
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    sbc  a, a
    add  a, b
    rst  $20
    ld   h, b
    sbc  a, c
    jr   label_4069A
    rrca
    ld   [hl], d
    ld   [bc], a
    ld   [hl], c
    ld   bc, label_43D03
    daa
    reti
    rst  8

label_406A5::
    ld   sp, label_2FE
    db   $F4 ; Undefined instruction
    dec  b
    ld   sp, hl
    cp   $7E
    ld   bc, $809F
    and  b
    jr   nz, label_40703
    sub  a, b
    add  hl, sp
    reti
    dec  a
    call label_EB1B
    dec  e
    jp   hl
    db   $3A ; ldd  a, [hl]
    call z, label_16F1
    rst  $28
    push hl
    rst  $10
    add  a, $DE
    set  3, [hl]
    set  3, a
    ret
    call c, label_A0CB
    add  a, e
    and  h
    add  a, a
    rst  8
    ret  nz
    rrca
    ld   a, [$FF07]
    ld    hl, sp+$00
    rst  $38
    ld   [$FF1F], a
    ld   [$FFEF], a
    jr   c, label_406A5
    nop
    cp   $B8
    ld   e, $E1
    inc  e
    di
    nop
    rra
    ld   [rTAC], a
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    jp   label_39FC
    ld   hl, label_2139
    add  hl, sp
    ld   hl, label_22BB
    or   [hl]
    dec  h
    db   $EC ; Undefined instruction
    ld   l, e
    db   $D3 ; Undefined instruction
    ld   d, e
    db   $E8 ; add  sp, d
    ld   h, a
    sbc  a, e
    sbc  a, b
    ld    hl, sp+$E7
    add  a, b
    add  a, a
    adc  a, h
    ld   a, a
    rlca
    ld   a, [$E21F]
    rst  $38
    add  a, a
    rst  $38
    rst  $18
    cp   l
    ld   bc, $FC22
    ld   sp, label_431DE
    sbc  a, [hl]
    rst  $38
    db   $10
    db   $FF
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rra
    scf
    ld   b, a
    sbc  a, e
    pop  hl
    adc  a, c
    ld   a, [$FF00+C]
    or   a
    db   $EC ; Undefined instruction
    rst  $10
    ld    hl, sp+$EF
    rst  $38
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
    cp   a
    ccf
    sbc  a, a
    rra
    rst  $30
    ld   [hl], b
    rst  $18
    ld   e, a
    call label_824C
    ld   [bc], a
    add  a, a
    rlca
    ld   c, $0E
    inc  e
    inc  e
    jr   label_40768
    pop  hl
    ld   l, [hl]
    and  b
    sbc  a, a
    ld   sp, hl
    ld   b, $7F
    nop
    db   $C1
    pop  bc
    ld   a, l
    ld   a, h
    ld   [hl], a
    ld   [hl], b
    ld   a, l
    ld   l, h
    ld   a, [$FF77]
    call c, label_EE5B
    ld   c, l
    sub  a, a
    and  [hl]

label_40768::
    ld   a, [bc]
    ld   [hl], d
    ld   c, e
    or   e
    sbc  a, e
    ld   h, e
    rst  $30
    rlca
    ld   a, a
    cp   a
    rrca
    rst  $30
    inc  bc
    db   $FD ; Undefined instruction
    add  a, c
    ld   a, [hl]
    ret  nz
    ccf
    ld   h, b
    rra
    ld   h, b
    rra
    ld   h, b
    rra
    and  d
    add  a, e
    and  b
    add  a, b
    pop  de
    pop  bc
    ret  nc
    ret  nz
    call nz, label_EA40
    ld   l, b
    ld   a, h
    db   $FC ; Undefined instruction

label_4078E::
    ld   a, [hl]
    cp   [hl]
    jr   nz, label_4078E
    inc  bc
    ret  nz
    inc  e
    db   $E3 ; Undefined instruction
    add  a, b
    ld   a, [$FFC6]
    cp   c
    ld   h, b
    ld   e, a
    rst  $18
    ret  nz
    rst  $28
    ld   [$FFE3], a
    inc  a
    rlca
    ld    hl, sp+$07
    ld    hl, sp+$0F
    pop  af
    rra
    db   $E3 ; Undefined instruction
    ld   a, a
    adc  a, a
    ld   sp, hl
    add  hl, sp
    pop  hl
    pop  hl
    pop  af
    ld   l, [hl]
    pop  hl
    ld   e, [hl]
    db   $E3 ; Undefined instruction
    call c, label_BFCF
    rst  $10
    sbc  a, c
    add  a, a
    cp   e
    ld   c, $72
    adc  a, [hl]
    ld   [hl], d
    rst  $38
    ld   a, a
    ld    hl, sp+$78
    pop  hl
    pop  hl
    add  a, d
    add  a, d
    dec  b
    inc  b
    rlca
    inc  b
    rrca
    ld   [label_101F], sp
    pop  af
    pop  af
    add  a, b
    add  a, b
    jr   label_407D6

label_407D6::
    ld   a, [hl]
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   a, [label_3C3F]
    rra
    ld   e, $0F
    rrca
    rrca
    rrca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    cp   a
    rra
    cp   a
    rst  $18
    xor  a
    rst  8
    ccf
    rst  8
    ld   l, a
    adc  a, a
    rst  $38
    rra
    rst  $38
    cpl
    rst  $18
    rst  $28
    or   [hl]
    add  a, [hl]
    and  b
    add  a, b
    pop  hl
    sbc  a, [hl]
    ret  nz
    cp   a
    or   b
    adc  a, a
    rst  $18
    ret  nz
    rst  $30
    ld   a, [$FFFC]
    db   $FC ; Undefined instruction
    dec  a
    inc  a
    rst  $30
    ld   a, [$FFFC]
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    ret  nz
    ccf
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   bc, label_1FE
    cp   $03
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF7F]
    add  a, b
    rst  $38
    ccf
    ei
    db   $10
    db   $F0
    dec  e
    ld   sp, hl
    inc  c
    ld    hl, sp+$0E
    cp   $04
    cp   $06
    rst  $38
    inc  bc
    rst  $28
    rst  $28
    ld   a, [$FFF0]
    ld   d, b
    sub  a, b
    inc  h
    call nz, label_E216
    sub  a, e
    ld   h, l
    sub  a, c
    ld   h, [hl]
    ld   sp, hl
    ld   c, $DB
    jp   label_82FA
    ld   a, e
    ld   b, d
    ld   [hl], a
    ld   b, [hl]
    ld   a, $2E
    scf
    ld   [hl], $87
    add  a, l
    adc  a, $4E
    sbc  a, h
    ld   h, h
    ld   a, h
    sbc  a, h
    xor  l
    dec  [hl]
    ld   e, $26
    dec  e
    db   $E4 ; Undefined instruction
    dec  sp
    ret  z
    rst  $38
    ld    hl, sp+$3B
    inc  bc
    ld   a, a
    ld   h, b
    cp   a
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
    sbc  a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    db   $F4 ; Undefined instruction
    nop
    ld   a, [$FF00]
    pop  hl
    ld   bc, label_707
    ld   b, $06
    rrca
    ld   c, $0F
    rrca
    dec  e
    inc  e
    ld   a, $3C
    ld   a, b
    ld   a, b
    di
    di
    xor  a
    ld   c, a
    ccf
    rst  $18
    rst  $18
    rra
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
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
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
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    cp   a
    add  a, b
    rst  $18
    ret  nz
    rst  $20
    ld   [$FFFC], a
    db   $FC ; Undefined instruction
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

label_408DB::
    nop
    ccf

label_408DD::
    nop
    pop  hl
    ld   [rIE], a
    inc  bc
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    inc  b
    ld   a, [$FFFF]

label_408F2::
    jr   c, label_4091B
    db   $12
    ld   [de], a
    rst  $28
    ld   [label_7F7], sp
    push af
    inc  b
    di
    ld   [bc], a
    ld   a, [$A402]
    inc  hl
    cp   b
    rla
    cp   a
    ld   e, $19
    ld   l, c
    jr   label_408F2
    dec  d
    db   $E4 ; Undefined instruction
    sub  a, l
    ld   h, h
    db   $F4 ; Undefined instruction
    inc  b
    ld   [hl], d
    xor  h
    jr   z, label_408DB
    jr   nc, label_408DD
    db   $FC ; Undefined instruction
    adc  a, e
    rst  0
    ret  nz
    ld   a, h

label_4091B::
    ld   a, h
    db   $E3 ; Undefined instruction
    inc  hl
    ld   sp, hl
    ld   bc, label_42067
    reti
    sbc  a, b
    sub  a, h
    inc  h
    sbc  a, [hl]
    ld   h, $89
    ld   sp, label_43249
    add  hl, bc
    ldd  [hl], a
    cp   b
    add  a, e
    db   $E3 ; Undefined instruction
    inc  bc
    rst  0
    rlca
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    inc  de
    inc  de
    and  e
    and  e
    ld   h, a
    ld   h, a
    rst  $20
    ld   h, a
    rrca
    ld   [label_4307F], sp
    rst  $38
    nop
    ld   a, h
    nop
    add  a, b
    add  a, b
    ld    hl, sp+$F8
    cp   $FE
    rst  $38
    rst  $38
    ld   sp, hl
    ld   bc, label_1FD
    ld   a, l
    ld   bc, $00FC
    db   $FC ; Undefined instruction
    nop
    ld   a, b
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   a, d
    ld   [de], a
    ld   b, [hl]
    ld   e, d
    add  a, $3A
    add  a, $BA
    xor  $92
    ld   a, [$B782]
    add  a, l
    db   $EB ; Undefined instruction
    push hl
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    ld   a, [hl]
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    jr   c, label_4097E

label_4097E::
    nop
    nop
    ld    hl, sp+$CF
    ld   l, b
    ld   h, a
    dec  a
    ldd  [hl], a
    ld   e, $18
    ld   a, [de]
    dec  de
    rrca
    inc  c
    dec  e
    inc  e
    ccf
    ld   a, $A3
    inc  hl
    inc  bc
    ld   b, e
    inc  sp
    ld   d, e
    inc  sp
    db   $D3 ; Undefined instruction
    scf
    rst  $10
    ld   e, a
    sbc  a, a
    rst  $18
    rrca
    sbc  a, a
    rrca
    db   $E3 ; Undefined instruction
    sbc  a, l
    ld   [$FF9C], a
    cp   $82
    cp   d
    add  a, d
    rlca
    add  a, e
    rrca
    rst  $30
    rst  $30
    rlca
    rra
    rra
    nop
    nop
    ld   bc, label_701
    rlca
    ccf
    ccf
    rst  $38
    rst  $38
    cp   $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    ld   a, a
    ld   a, a
    cp   $F3
    jp   hl
    ld   [$FFA4], a
    and  d
    rla
    db   $10
    db   $18
    jr   label_409DC
    rrca
    rlca
    rlca
    xor  a
    adc  a, a
    cpl
    rst  8
    ld   e, a

label_409D5::
    sbc  a, a
    rra
    rra
    ccf
    ccf
    rst  $38
    rst  $38

label_409DC::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   label_420C1
    ld   h, b
    jr   nc, label_40A16
    ld   e, $1E
    adc  a, e
    adc  a, e
    ld   l, a
    ld   l, c
    ld   l, a
    add  hl, bc
    rst  $30
    nop
    rlca
    nop
    add  a, b
    add  a, b
    ld   h, b
    ld   h, b
    ccf
    ccf
    rst  $38
    rst  $38
    ld   h, d
    ld   h, d
    add  a, c
    add  a, c
    nop
    nop
    rst  8
    ret  nz
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ld   [$FF1F], a
    ld   [$FFEF], a
    jr   c, label_409D5
    ld   b, h
    cp   b
    ld   a, h
    ld   a, h
    cp   $02
    rst  $38
    nop

label_40A16::
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF07]
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    jp   label_404FC
    jp   label_CE01
    rra
    rst  $38
    adc  a, a
    rst  $28
    rst  8
    cp   a
    nop
    ccf
    ld   [$FFF8], a
    rst  $28
    ld   [$FF63], a
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    and  $F8
    rst  0
    reti
    rrca
    inc  sp
    rra
    rst  $20

label_40A3C::
    add  hl, sp
    ret
    pop  de
    ld   de, $F0F7
    rst  $38
    rst  $38
    ld   d, b
    sub  a, b
    inc  h
    call nz, label_E216
    sub  a, e
    ld   h, l
    sub  a, c
    ld   h, [hl]
    ld   sp, hl
    ld   c, $23
    inc  hl
    adc  a, d
    add  a, d
    ld   a, e
    ld   b, d
    ld   [hl], a
    ld   b, [hl]
    ld   a, $2E
    scf
    ld   [hl], $87
    add  a, l
    adc  a, $4E
    jp   label_C003
    nop
    jp   nz, label_C602
    ld   b, $86
    ld   b, $0E
    ld   c, $9C
    sbc  a, h
    ret  c
    ret  c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFF9]
    ld   sp, hl
    push af
    di
    db   $FD ; Undefined instruction
    ld   a, [$FF00+C]
    rst  $38
    pop  bc
    pop  bc
    add  a, e
    ld   a, h
    inc  sp
    call z, label_F9E7
    ld   h, $FB
    ld   l, $F3

label_40A8E::
    call z, label_B0F0
    add  a, b
    pop  af
    ld   a, [$FF1E]
    ld   e, $93
    ld   h, e
    db   $FC ; Undefined instruction
    ret  nz
    jr   c, label_40A3C
    add  hl, sp
    and  b
    ld   sp, $C320
    inc  bc
    ret  nz
    nop
    ld   b, d
    ld   [bc], a
    add  a, $C6
    ld   a, [hl]
    ld   a, [hl]
    ld   e, $1E
    add  a, a
    rlca
    inc  bc
    inc  bc
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rrca
    nop
    rlca
    nop
    nop
    nop
    rlca
    nop
    rra
    nop
    ld   a, $00
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    nop
    ld   c, $00
    nop
    jr   nz, label_40ACC

label_40ACC::
    jr   label_40A8E
    inc  c
    jr   nz, label_40AD1

label_40AD1::
    rst  $38
    nop
    ld   a, a
    add  a, b
    ccf
    ret  nz
    ld   c, $F0
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    cp   $00
    call c, label_8001
    rra
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
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_40AF8
    db   $10
    db   $FF
    jr   z, label_40AFC
    ld   b, h
    rst  $38
    nop
    nop
    nop
    rrca
    nop
    ccf
    nop
    rst  $38
    nop
    ld    hl, sp+$07
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    nop
    add  a, $00
    jr   nz, label_40B16
    nop
    rst  8
    nop

label_40B16::
    rst  $38
    nop
    cp   $01
    ld   a, b
    add  a, a
    nop
    ld    hl, sp+$00
    ld   a, b
    ld   a, h
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rlca
    nop
    dec  c
    nop
    ld   b, b
    nop
    nop
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF00]
    sbc  a, a
    nop
    add  a, [hl]
    nop
    db   $FC ; Undefined instruction
    nop
    call z, label_42F00
    nop
    inc  a
    nop
    inc  b
    nop
    inc  bc
    nop
    nop
    nop
    ld   a, h
    nop
    ccf
    nop
    pop  hl
    nop
    ld   [rJOYP], a
    db   $DB
    nop
    adc  a, a
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    jp   label_8000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, c
    nop
    jp   hl
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
    rst  $38
    nop
    ld   a, a
    inc  c
    rst  0
    ld   b, [hl]
    add  a, c
    add  a, c
    nop
    nop
    ld   a, [$FFA0]
    ld   b, b
    ld   b, b
    nop
    nop
    rst  $38
    ld   b, b
    rst  $28
    pop  hl
    rst  0
    jp   label_8383
    add  a, b
    add  a, b
    jr   label_40BA4
    db   $10
    db   $10
    nop
    nop
    jp   label_8000
    add  a, b

label_40BA4::
    ld   a, [$FF80]
    jr   c, label_40BC0
    inc  e
    inc  c
    ld   [$0008], sp
    nop
    nop
    nop
    ld    hl, sp+$30
    ld   a, [$FF60]
    ld   h, c
    ld   h, b
    ld   b, c
    ld   b, c
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   b, b
    ld   b, b

label_40BC0::
    inc  bc
    inc  bc
    rra
    ld   e, $7E
    ld   a, d
    rst  $38
    pop  af
    rst  $38
    rst  $10
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    ld   bc, $C701
    rst  0
    rst  $20
    dec  h
    ld   [hl], a
    ld   [hl], h
    ld   a, a
    ld   a, h
    rst  $38
    ld   a, $BF
    ccf
    rst  $38
    cp   a
    ret  nz
    ret  nz
    ld   sp, hl
    ld   sp, hl
    ei
    db   $EB ; Undefined instruction
    rst  $38
    rst  8
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  $30
    ld    hl, sp+$B8
    cp   $2E

label_40BF4::
    cp   a
    inc  de
    cp   a
    cp   e
    cp   a
    cp   e
    rst  $38
    ccf
    ld   a, a
    ccf
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
    ld   bc, label_3F00
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
    rlca
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
    rst  $38
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
    ld   bc, label_700
    nop
    ld   a, a
    nop
    rst  $38
    nop
    ld   bc, label_700
    nop
    rrca
    nop
    rra
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
    cp   a
    nop
    rst  $18
    jr   nz, label_40BF4
    ld   a, b
    nop
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

label_40C7F::
    nop
    nop
    nop
    add  a, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
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
    add  a, b
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, $10
    ret  nz
    inc  e
    ret  nz
    ld   e, $80
    ccf
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$00
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
    add  a, b
    nop
    ld   [rJOYP], a
    cp   $00
    rst  $38
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, $C700
    nop
    rst  $38
    nop
    rst  $38
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
    ld   bc, label_300
    nop
    inc  bc
    nop
    rlca
    nop
    rlca
    nop
    rrca
    nop
    ld   c, [hl]
    nop
    adc  a, a
    nop
    rra
    nop
    ccf
    nop
    pop  af
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
    ld   c, $12
    rlca
    add  hl, de
    inc  bc
    sbc  a, b
    ld   bc, label_1FC
    db   $FC ; Undefined instruction
    ld   bc, $00F0
    ld   [rJOYP], a
    ld   h, b
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    ld   b, b
    ld   [$FF60], a
    ld   [rNR41], a
    ld   a, [$FF30]
    nop
    call label_E800
    nop
    ret  nc
    nop
    ret  nc
    nop
    ret  nc
    nop
    ret  nc
    nop
    ret  nc
    nop
    ld   e, c
    nop
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    pop  af
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   [hl], b
    nop
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    ld   a, [$FF33]
    ld   a, [$FF17]
    ld   a, b
    rla
    ld   a, b
    rra
    ld   a, b
    rra
    ld   a, b
    rra
    ld   a, b
    rra
    ld   a, b
    dec  e
    nop
    rra
    nop
    rra
    nop
    ld   e, $00
    inc  e
    nop
    inc  c
    nop
    inc  c
    nop
    inc  b
    nop
    ld   b, $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    nop
    inc  a
    nop
    inc  e
    nop
    ld   c, $00

label_40D9D::
    rrca
    nop
    rrca
    nop
    jr   c, label_40DA3

label_40DA3::
    jr   label_40DA5

label_40DA5::
    stop
    db   $10
    db   $01
    db   $10
    db   $01

label_40DAB::
    jr   c, label_40DB0

label_40DAD::
    ld    hl, sp+$07

label_40DAF::
    ld   a, [$FF78]
    jr   label_40DAB
    jr   label_40DAD
    jr   label_40DAF
    db   $10
    db   $F0
    jr   nc, label_40DAB
    jr   nc, label_40D9D
    jr   nz, label_40DAF
    ld   b, b
    jr   label_40DC5
    inc  a
    ld   bc, $007E
    ld   a, a
    nop
    rst  $38
    nop
    rra
    ret  nz
    inc  bc
    ld   a, [$FF01]
    db   $FC ; Undefined instruction
    nop
    ld   e, $00
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    add  a, c
    nop
    rst  $38
    nop
    cp   $00
    add  a, h
    ld   sp, rJOYP
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
    rrca
    ld   h, b
    inc  bc
    ld   a, [$FF00]
    ld   sp, hl
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    rst  $38
    nop
    add  a, e
    jr   nc, label_40DFF

label_40DFF::
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    nop
    db   $FC ; Undefined instruction
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
    rrca
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
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $28
    nop
    ld   a, a
    nop
    db   $00
    nop
    ld   [hl], a
    nop
    xor  d
    nop
    ld   c, l
    nop
    sub  a, b
    ld   bc, label_201
    inc  bc
    dec  b
    rlca
    dec  b
    rlca
    dec  b
    rlca
    dec  b
    rlca
    ld   [bc], a
    inc  bc
    ld   bc, $C001
    pop  bc
    ld   hl, $D3E3
    rst  $30
    ld   de, label_11F3
    di
    pop  de
    di
    ld   hl, $C0E3
    pop  bc
    nop
    rst  $38
    sbc  a, h
    rst  $38
    or   [hl]
    rst  $38
    sbc  a, [hl]
    rst  $38
    add  a, [hl]
    rst  $38
    or   [hl]
    rst  $38
    sbc  a, h
    cp   $00
    sbc  a, h
    nop
    rst  $38
    ld   [hl], c
    rst  $38
    db   $DB
    rst  $38
    ld   a, b
    rst  $38
    jr   label_40E89
    db   $DB
    rst  $38
    ld   [hl], c
    ei
    inc  c
    ld   [hl], c
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   h, c
    rst  $38
    ret  nz
    rst  $38
    ld   h, b
    rst  $38
    ld   l, h
    rst  $38
    call z, label_8FF
    rst  $38
    nop
    rst  $38
    adc  a, $FF
    db   $DB
    rst  $38
    rst  8
    rst  $38
    jp   label_DBFF
    rst  $38
    adc  a, $FF
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_40EB3
    ld   l, l
    rst  $38
    inc  a
    rst  $38
    dec  c
    rst  $38
    ld   l, l
    rst  $38
    jr   c, label_40EBD
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    or   b
    rst  $38
    ld   [rIE], a
    or   b
    rst  $38
    or   b
    rst  $38
    ld   [rIE], a
    nop

label_40ECF::
    rst  $38
    nop
    rst  $38
    call label_CCFF
    rst  $38
    db   $ED ; Undefined instruction
    rst  $38
    db   $FF
    rst  $38
    call label_CDFF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    dec  l
    rst  $38
    cp   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    nop
    rst  $38
    nop
    cp   $C0
    cp   $EE
    rst  $38
    db   $DB
    rst  $38
    rst  $18
    rst  $38
    ret  c
    rst  $38
    rst  8
    rst  $38
    jr   nc, label_40ECF
    nop
    rst  $38
    nop
    ld   a, [hl]
    ld   e, b
    rst  $38
    ld   a, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, h
    rst  $38
    nop
    ld   l, h
    nop
    jr   nc, label_40F43
    ei
    di
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    di
    rst  $38
    nop
    di

label_40F20::
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   [$FFC0], a
    ld   [$FFC0], a
    ld   [$FF80], a
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop

label_40F43::
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
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
    jr   label_40F6D

label_40F6D::
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
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    nop
    rlca
    nop
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
    add  a, b
    nop
    rst  $38
    nop
    ld   a, [hl]
    nop
    jr   label_40F97

label_40F97::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
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
    ld   b, h
    ld   b, h
    jr   z, label_40FE0
    db   $10
    db   $10
    jr   z, label_40FE4
    ld   b, h
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

label_40FE0::
    nop
    rst  $38
    nop
    rst  $38

label_40FE4::
    nop
    rst  $38
    nop
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
    rst  $38
    nop
    rst  $28
    db   $10
    db   $10
    rst  $28
    add  a, b
    ld   a, a
    nop
    di
    nop
    ret  nz
    ld   a, [$FF00]
    inc  a
    nop
    ret  nz
    ccf
    rlca
    ld    hl, sp+$7F
    add  a, b
    cp   $01
    ccf
    ret  nz
    rrca
    ld   a, [$FF00]
    rrca
    rra
    nop
    ld   a, a
    add  a, b
    ld   c, $F1
    ld   a, [$FF0F]
    inc  bc
    db   $FC ; Undefined instruction
    sbc  a, a
    ld   h, b
    rst  $38
    nop
    rra
    ld   [$FF3E], a
    ld   bc, label_38C7
    ld   bc, label_3CFE
    jp   label_FF
    rst  $38
    nop
    cp   $01
    ld   a, [$FF0F]
    ld   bc, label_1CF8
    nop
    rlca
    nop
    ld   e, $00
    ld   h, b
    nop
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ccf
    jr   c, label_41052

label_41052::
    ld   [rJOYP], a
    inc  bc
    nop
    ld   c, $00
    inc  a
    inc  c
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   [hl], b
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    nop
    inc  bc
    nop
    ld   [$FFE0], a
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    db   $FC ; Undefined instruction
    nop
    pop  hl
    nop
    rra
    nop
    cp   $00
    nop
    nop
    rst  $38
    nop
    rst  $28
    db   $10
    db   $10
    rst  $28
    add  a, b
    ld   a, a
    nop
    di
    nop
    ret  nz
    ret  nz
    nop
    nop
    nop
    ret  nz
    ccf
    rlca
    ld    hl, sp+$7F
    add  a, b
    cp   $01
    ccf
    ret  nz
    rrca
    ld   a, [$FF00]
    rrca
    nop
    nop
    ld   a, a
    add  a, b
    ld   c, $F1
    ld   a, [$FF0F]
    inc  bc
    db   $FC ; Undefined instruction
    sbc  a, a
    ld   h, b
    rst  $38
    nop
    rra
    ld   [rJOYP], a
    nop
    rst  0
    jr   c, label_410B6
    cp   $3C
    jp   label_FF
    rst  $38
    nop
    cp   $01
    ld   a, [$FF0F]
    jr   nc, label_410C2

label_410C2::
    rra
    nop
    rra
    nop
    ld   a, [$FF00]
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ccf
    inc  a
    nop
    ld   a, [$FF00]
    jp   label_E00
    nop
    inc  a
    inc  c
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   c, $01
    ld   [hl], b
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    nop
    inc  bc
    nop
    ld   [$FFE0], a
    rst  $38
    rst  $38
    inc  bc
    ld    hl, sp+$00
    nop
    nop
    nop
    add  a, b
    nop
    db   $FC ; Undefined instruction
    nop
    pop  hl
    nop
    rra
    nop
    cp   $00
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $28
    db   $10
    db   $10
    rst  $28
    add  a, b
    ld   a, a
    nop
    di
    nop
    ret  nz
    nop
    nop
    nop
    nop
    ret  nz
    ccf
    rlca
    ld    hl, sp+$7F
    add  a, b
    cp   $01
    ccf
    ret  nz
    rrca
    ld   a, [$FF00]
    nop
    nop
    nop
    ld   a, a
    add  a, b
    ld   c, $F1
    ld   a, [$FF0F]
    inc  bc
    db   $FC ; Undefined instruction
    sbc  a, a
    ld   h, b
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  0
    jr   c, label_41138
    cp   $3C
    jp   label_FF
    rst  $38
    nop
    cp   $01
    ld   [rJOYP], a
    di
    nop
    rra
    nop
    ld   a, b
    nop
    ret  nz
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ccf
    nop
    rrca
    ld   [rJOYP], a
    inc  bc
    nop
    ld   c, $00
    inc  a
    inc  c
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    add  a, b
    ld   [hl], d
    ld   bc, $00FC
    rst  $38
    nop
    ccf
    nop
    inc  bc
    nop
    ld   [$FFE0], a
    rst  $38
    rst  $38
    ld   a, [$FF0F]
    nop
    ld    hl, sp+$00
    nop
    add  a, b
    nop
    db   $FC ; Undefined instruction
    nop
    pop  hl
    nop
    rra
    nop
    cp   $00
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $28
    db   $10
    db   $10
    rst  $28
    add  a, b
    ld   a, a
    nop
    di
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ccf
    rlca
    ld    hl, sp+$7F
    add  a, b
    cp   $01
    ccf
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    add  a, b
    ld   c, $F1
    ld   a, [$FF0F]
    inc  bc
    db   $FC ; Undefined instruction
    sbc  a, a
    ld   h, b
    nop
    nop
    nop
    nop
    nop
    nop
    rst  0
    jr   c, label_411BA
    cp   $3C
    jp   label_FF
    rst  $38
    nop
    nop
    ret  nz
    ld   a, [$FF00]
    ccf
    nop
    ld   a, b
    nop
    ld   [rJOYP], a
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ccf
    rrca
    ld   a, [$FF40]
    inc  c
    add  a, e
    nop
    ld   c, $00
    inc  a
    inc  c
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    adc  a, a
    nop
    ld   [hl], e
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    nop
    inc  bc
    nop
    ld   [$FFE0], a
    rst  $38
    rst  $38
    cp   $01
    ld   a, [$FF0F]
    nop
    ld   a, b
    add  a, b
    nop
    db   $FC ; Undefined instruction
    nop
    pop  hl
    nop
    rra
    nop
    cp   $00
    nop
    nop
    rrca
    nop
    ccf
    nop
    rst  $38
    nop
    ld    hl, sp+$07
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    nop
    add  a, $00
    jr   nz, label_41216
    nop
    rst  8
    nop

label_41216::
    rst  $38
    nop
    cp   $01
    ld   a, b
    add  a, a
    nop
    ld    hl, sp+$00
    ld   a, b
    ld   a, h
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rlca
    nop
    dec  c
    nop
    ld   b, b
    nop
    nop
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF00]
    sbc  a, a
    nop
    add  a, [hl]
    nop
    db   $FC ; Undefined instruction
    nop
    call z, label_42F00
    nop
    inc  a
    nop
    inc  b
    nop
    inc  bc
    nop
    nop
    nop
    ld   a, h
    nop
    ccf
    nop
    pop  hl
    nop
    ld   [rJOYP], a
    db   $DB
    nop
    adc  a, a
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    jp   label_8000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, c
    nop
    jp   hl
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
    rrca
    nop
    ccf
    nop
    ld    hl, sp+$07
    ld   [$FF1F], a
    add  a, b
    ld   a, h
    nop
    adc  a, b
    nop
    ld   [label_2000], sp
    inc  bc
    nop
    rst  8
    nop
    cp   $01
    ld   a, b
    add  a, a
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ccf
    ld   a, h
    nop
    cp   $00
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    nop
    add  a, a
    nop
    rlca
    nop
    ld   a, h
    nop
    ld    hl, sp+$00
    ld   b, b
    nop
    nop
    add  a, b
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF00]
    rst  $18
    nop
    sbc  a, c
    nop
    db   $FC ; Undefined instruction
    nop
    ld   [hl], e
    nop
    db   $3A ; ldd  a, [hl]
    nop
    ld   b, $00
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    pop  af
    nop
    ld   a, [$FF00]
    reti
    nop
    adc  a, a
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
    jp   label_8000
    nop

label_412E7::
    nop
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
    rrca
    nop
    jr   c, label_4130D
    ld   [rNR32], a
    add  a, b
    ld   a, b
    nop
    ret  z
    nop

label_4130D::
    adc  a, h
    nop
    di
    nop
    jr   nz, label_41316
    nop
    adc  a, $01

label_41316::
    jr   nc, label_412E7
    nop
    ld   a, $00
    scf
    nop
    ld    hl, sp+$00
    ld    hl, sp+$7C
    nop
    cp   $00
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rrca
    nop
    inc  c
    nop
    rst  $38
    nop
    ld   a, b
    nop
    ld   h, b
    nop
    ld   b, b
    nop
    nop
    add  a, b
    nop
    ld   a, a
    add  a, b
    rlca
    ld    hl, sp+$00
    rst  $18
    nop
    ld   [hl], l
    nop
    inc  sp
    nop
    ld   a, [de]
    nop
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
    call z, label_8700
    nop
    nop
    nop
    nop
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
    rlca
    nop
    ccf
    nop
    ret  z
    nop
    adc  a, e
    nop
    ld   a, h
    nop
    ld   e, $00
    inc  bc
    nop
    jr   nz, label_41393

label_41393::
    ld   bc, $CF00
    nop
    ld   a, a
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    call label_700
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    cp   $00
    ld   e, [hl]
    nop
    ld   h, e
    nop
    ret  nz
    nop
    nop
    nop
    ld   b, b
    nop
    nop
    nop
    add  a, b
    nop
    rst  $38
    nop
    ld   [$C700], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_600
    ld   bc, label_708
    jr   c, label_41411
    jr   nz, label_4142B
    ld   l, $11
    ld   e, $05
    dec  hl

label_41411::
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

label_41437::
    nop
    ld   [$FFC0], a
    ld   a, [$FFC0]
    ret  z
    jr   nc, label_41437
    nop
    ld   bc, label_600
    ld   bc, label_708
    jr   c, label_4144F
    jr   nz, label_41469
    ld   l, $11
    ld   e, $05
    dec  de

label_4144F::
    ld   b, $25
    dec  de
    ldi  [hl], a
    dec  e
    ld   b, e
    inc  a
    ld   b, a
    jr   c, label_41496
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
    db   $10
    db   $E0

label_4147E::
    ld   a, [$FF00]
    ld   bc, label_1E00
    ld   bc, label_F10
    db   $10
    db   $0F
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

label_41496::
    daa
    jr   label_414B5
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

label_414B5::
    ld   [$FFF0], a
    nop
    ld   e, b
    or   b
    ld   a, b
    or   b
    jr   nc, label_4147E

label_414BE::
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
    ld   a, [label_4328D]
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
    jr   c, label_414BE
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
    jr   c, label_4151F
    ccf
    jr   label_4154A
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
    jr   label_41577
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

label_41549::
    inc  d

label_4154A::
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
    jr   nc, label_41549

label_41565::
    jr   label_41565
    db   $E4 ; Undefined instruction
    cp   $94
    ld   a, [$FF00+C]
    xor  $70
    call c, label_F6E0
    ld   [$F60B], sp
    db   $EB ; Undefined instruction
    or   $0E

label_41577::
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
    jr   z, label_415B0
    db   $10
    db   $10
    jr   z, label_415B4
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
    jr   z, label_415C0
    db   $10
    db   $10
    jr   z, label_415C4
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
    jr   z, label_415D0
    db   $10
    db   $10
    jr   z, label_415D4
    ld   b, h
    ld   b, h
    nop
    nop

label_415B0::
    nop
    nop
    nop
    nop

label_415B4::
    ld   b, h
    ld   b, h
    jr   z, label_415E0
    db   $10
    db   $10
    jr   z, label_415E4
    ld   b, h
    ld   b, h
    nop
    nop

label_415C0::
    nop
    nop
    nop
    nop

label_415C4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_415D0::
    nop
    nop
    nop
    nop

label_415D4::
    nop
    nop
    ld   bc, $0000
    nop
    inc  b
    nop
    ld   [$0000], sp
    nop

label_415E0::
    nop
    nop
    nop
    nop

label_415E4::
    nop
    nop
    nop
    nop
    nop
    nop

label_415EA::
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
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop

label_415FA::
    ld   b, b
    nop
    ld   b, b
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
    inc  b
    nop
    ret  z
    nop
    jr   c, label_41610

label_41610::
    rra
    nop
    rra
    nop
    rrca
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
    rra
    nop
    ld   e, a
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
    nop
    nop
    add  a, b
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
    nop
    jr   label_4163E

label_4163E::
    nop
    nop
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, $00
    ret  nz
    nop
    ld   d, b
    nop
    ld   c, b
    nop
    ld   c, [hl]
    nop
    ld   a, [hl]
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
    ld   a, a
    nop
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
    ret  nz
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, $00
    nop
    nop
    ret  nz
    ret  nz
    ld   h, b
    ld   h, b
    jr   nc, label_416B6
    jr   label_416A0
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

label_416A0::
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   b, b
    ld   b, b
    ld   h, b
    ld   h, b
    jr   nz, label_416CA
    jr   nc, label_416DC
    db   $10
    db   $10
    jr   label_416C8
    ld   [label_C08], sp
    inc  c
    inc  b
    inc  b

label_416B6::
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
    ld   bc, $0101
    ld   bc, label_303
    ld   c, $0E

label_416C8::
    jr   label_416E2

label_416CA::
    jr   label_416E4
    inc  e
    inc  e
    ld   c, $0E
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, label_707
    ld   e, $1E
    ld   a, h
    ld   a, h

label_416DC::
    ld   [$FFE0], a
    ret  nz
    ret  nz
    ld   bc, label_301
    inc  bc

label_416E4::
    ld   e, $1E
    jr   c, label_41720
    jr   nc, label_4171A
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   [hl], b
    ld   [hl], b
    inc  e
    inc  e
    ld   b, $06
    ld   b, $06
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
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

label_4170F::
    nop
    inc  bc
    inc  bc
    ld   e, $1E
    jr   nc, label_41746
    jr   nz, label_41738
    jr   nz, label_4173A

label_4171A::
    jr   nz, label_4173C
    ld   b, b
    ld   b, b
    add  a, b
    add  a, b

label_41720::
    jr   c, label_4175A
    ld   [hl], b
    ld   [hl], b
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   h, b
    ld   h, b
    ld   [hl], b
    ld   [hl], b
    jr   c, label_41766
    inc  e
    inc  e
    ld   c, $0E
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca

label_41738::
    ld   e, $1E

label_4173A::
    inc  a
    inc  a

label_4173C::
    jr   c, label_41776
    jr   c, label_41778
    nop
    nop
    nop
    nop
    nop
    nop

label_41746::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_4175A::
    nop
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

label_41766::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_41776::
    nop
    nop

label_41778::
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
    call nz, label_40667
    nop
    rst  $38
    jr   nz, label_41843
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
    jr   c, label_4182C
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
    jp   label_403C0
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
    jr   label_41933
    jr   label_4192D
    jr   label_418FF
    ld   [label_838], sp
    jr   nc, label_418D4
    add  hl, de
    nop
    inc  de
    nop
    rst  $18
    add  a, e
    ld   a, e
    ld   b, a

label_418D4::
    ld   [hl], l
    cpl
    ld   e, l
    ccf
    ld   sp, hl
    rra
    reti

label_418DB::
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
    jr   c, label_41939
    inc  c
    rrca
    ld   b, $07
    db   $E3 ; Undefined instruction

label_418FF::
    db   $E3 ; Undefined instruction
    ld   [hl], h
    adc  a, e
    jr   z, label_418DB
    ld   d, $E9
    dec  c
    ld   a, [$FF00+C]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38

label_4190E::
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

label_4192D::
    jr   nz, label_4190E
    jr   nz, label_419AA
    ei
    jp   hl

label_41933::
    rst  8
    and  a
    add  a, $A3
    ret  nz
    rst  $20

label_41939::
    jp   label_EC2F
    sbc  a, a
    ld   [hl], b
    rst  $18
    jr   nz, label_418C8
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
    jr   nz, label_4192E
    jr   nz, label_41951

label_41951::
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
    jr   label_41979
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

label_419AA::
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

label_419BC::
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
    jr   nc, label_419BC

label_41A1D::
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
    jr   z, label_41A1D
    ld   b, [hl]
    rst  0
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc

label_41A38::
    ld   a, [$FF0F]
    pop  bc

label_41A3B::
    ccf
    ld   b, $FE
    jr   c, label_41A38
    adc  a, a
    ld   [hl], b
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF47]
    ld    hl, sp+$C7
    ld    hl, sp+$C3
    ld   a, h
    pop  hl
    ld   a, $70
    ccf
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
    jr   c, label_41A3B
    ld   a, [$FF0F]
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   hl, label_422FE
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
    jr   nc, label_41AAB
    jr   c, label_41AAD
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
    jp   label_4013E
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
    jr   c, label_41B93
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

label_41B4F::
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
    jr   z, label_41B4F
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
    jr   c, label_41BE5
    jr   c, label_41C00
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

label_41B93::
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

label_41BE5::
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
    jr   nz, label_41C35
    jr   nz, label_41C37
    jr   nz, label_41C39
    jr   nz, label_41C3B
    jr   nz, label_41C3D
    jr   nz, label_41C3F

label_41C00::
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
    sbc  a, [hl]
    sub  a, [hl]
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

label_41C35::
    nop
    nop

label_41C37::
    nop
    nop

label_41C39::
    nop
    nop

label_41C3B::
    nop
    nop

label_41C3D::
    nop
    ld   bc, $9F00
    cp   c
    sbc  a, $BB
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

label_41CD3::
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
    jr   nz, label_41D31
    jr   nz, label_41D33
    jr   nz, label_41D35
    jr   nz, label_41D37
    jr   nz, label_41D39
    jr   nz, label_41D3B
    jr   nz, label_41D3D
    jr   nz, label_41D3F
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_41CD3
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

label_41D33::
    ret  nz
    inc  bc

label_41D35::
    ld   [$FF03], a

label_41D37::
    jr   nz, label_41D40

label_41D39::
    ld   [$FF0B], a

label_41D3B::
    rst  0
    rra

label_41D3D::
    inc  c
    ld   e, b

label_41D3F::
    jr   nc, label_41D01
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
    ld   de, label_432ED
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

label_41DD3::
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
    jr   nz, label_41E31
    db   $10
    db   $1F
    db   $10
    db   $1F
    ld   [label_80F], sp
    rrca
    inc  b
    rlca
    inc  b
    rlca
    ld   [bc], a
    inc  bc
    dec  h
    jp  c, label_43C83
    sub  a, l
    ld   l, d
    jp   z, label_41E35
    and  c
    jr   c, label_41DD3
    nop
    rst  $38
    nop
    rst  $38
    ld   a, $F0

label_41E12::
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

label_41E20::
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
    jr   nc, label_41E12
    ld   a, [$FFE0]
    pop  hl

label_41E35::
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
    db   $76 ; Halt
    rst  $38
    push bc
    cp   $87
    db   $FC ; Undefined instruction
    sub  a, a
    db   $FC ; Undefined instruction
    rst  $30
    db   $EC ; Undefined instruction
    sbc  a, [hl]
    ld   a, c
    di
    ld   [rSCX], a
    add  a, b
    add  a, a
    nop
    adc  a, a
    nop
    rst  $18
    nop
    rst  $38
    nop
    cp   $01
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
    jr   nz, label_41EB1
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
    jr   nc, label_41EC9
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

label_41EAC::
    dec  c
    inc  bc
    rst  $38
    rst  $38
    ld   a, b

label_41EB1::
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
    jr   nc, label_41EAC
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

label_41F12::
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
    ld   [hl], b
    inc  de
    ld   a, [$FFB3]
    ld   [$FFE3], a
    ld   [$FF63], a
    jr   nz, label_41F90
    jr   nz, label_41F12
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
    call nz, label_C6BD
    ld   a, h
    rst  0
    ld   a, [$D347]
    ld   l, a
    and  c
    ld   a, a
    db   $E3 ; Undefined instruction
    ld   a, $F7
    ccf
    ld   a, [hl]
    add  a, c
    ld   a, h
    add  a, e
    ld   [hl], b
    rst  8
    ld   b, b
    rst  $38
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

label_41F90::
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    jr   nz, label_41FD7
    jr   nz, label_41FD9
    db   $10
    db   $1F
    db   $10
    db   $1F
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

label_41FD7::
    add  a, b
    add  a, b

label_41FD9::
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
    ld   bc, label_43F00
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
    jr   nc, label_420D5
    db   $10
    db   $F8
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

label_42067::
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
    sbc  a, a
    ld   [rTAC], a
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

label_4213C::
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
    jr   label_4216E
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

label_4216E::
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

label_4217E::
    nop
    nop
    rrca
    rrca
    rst  $38
    jr   nc, label_4217E
    add  a, $B7
    ld    hl, sp+$9F
    ld   a, [$FF5C]
    di
    cp   b
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
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
    jr   nc, label_421DB
    jr   nc, label_421ED
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
    jr   nz, label_421BD
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

label_421DB::
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

label_421EA::
    jp   hl
    rst  $30

label_421EC::
    inc  [hl]

label_421ED::
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
    jr   nz, label_421EA
    jr   nz, label_421EC
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

label_42235::
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
    jr   z, label_42233
    jr   z, label_42235
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
    jr   nc, label_42265
    jr   nc, label_42267
    jr   nc, label_42269
    db   $10
    db   $FF
    db   $10
    db   $FF
    db   $10
    db   $FF
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
    ld   c, b
    rst  $38
    ld   c, b
    rst  $38
    ld   b, c
    rst  $38
    ld   hl, label_21FF
    rst  $38
    ld   de, label_9FF
    rst  $38
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
    db   $10
    db   $FF
    db   $10
    db   $FF
    db   $10
    db   $FF
    db   $10
    db   $FF
    inc  de
    rst  $38
    sub  a, b
    rst  $38
    sub  a, b
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
    jr   nc, label_422CB
    ld   [rIE], a
    pop  bc
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   l, h
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    pop  hl
    rst  $18
    pop  bc
    cp   a
    add  a, d
    rst  $38
    add  a, d
    rst  $38
    call nz, label_404FF
    rst  $38
    ld   c, b
    rst  $38
    ld   [hl], b
    rst  $38
    nop
    nop

label_422F2::
    nop
    nop
    inc  h
    inc  h
    jr   label_42310
    jr   label_42312
    inc  h
    inc  h
    nop
    nop

label_422FE::
    nop
    nop
    jr   nc, label_422F2
    ld   [label_4F8], sp
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    add  a, d
    cp   $C2
    cp   $42
    cp   $61
    rst  $38

label_42310::
    adc  a, h
    rst  $38

label_42312::
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
    jr   c, label_4236B
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    jp   label_3C
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    pop  bc
    rst  $38
    jp   label_E7FF
    rst  $38
    cp   [hl]
    rst  $38
    cp   h
    rst  $38
    sbc  a, e
    db   $FC ; Undefined instruction
    and  a
    ret  c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    rst  $38
    sbc  a, [hl]
    pop  hl
    ld   a, a
    add  a, b
    ld   [bc], a
    db   $FD ; Undefined instruction
    nop
    rst  $38
    sub  a, b
    ld   l, a
    add  a, c
    rst  $38
    pop  bc
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $20
    rst  $38
    ccf
    rst  $38
    dec  e
    rst  $38
    ld   c, c
    cp   a
    pop  hl
    rra
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
    jr   nc, label_4241D
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

label_4241D::
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
    jr   c, label_42466

label_42466::
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
    jr   nc, label_42483
    sub  a, [hl]
    ld   bc, label_33C
    db   $10
    db   $0F
    jr   c, label_42483
    rst  $38
    nop
    rrca
    nop
    ld   b, e
    db   $FC ; Undefined instruction
    ld   h, c

label_42483::
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
    jr   nc, label_424B2
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

label_424DB::
    ld   [rIE], a
    nop
    ld   a, [$FF00]
    rra
    rrca
    rst  $30
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    rst  $38
    rst  $38
    inc  a
    jp   label_FCFC
    ld   a, [$890E]
    ld   a, a
    ld   sp, hl

label_424F7::
    rrca
    rst  $38
    rlca
    ld   a, [hl]
    add  a, a
    dec  b
    cp   $FD
    cp   $00
    nop
    nop
    rst  $38
    add  a, c
    ld   a, $18
    rst  $20
    nop
    rst  $38
    jr   nc, label_424DB
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    nop
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
    jr   nc, label_424F7
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    jr   nz, label_4257D
    jp   nz, label_401
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    nop

label_42569::
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
    nop
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
    nop
    nop
    nop
    rst  $38
    jp   nz, label_3C
    rst  $38
    jr   nc, label_42569
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
    ld   bc, label_400FE
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

label_425C2::
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
    jr   c, label_425A7
    jr   label_425C2
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
    jr   nz, label_42611
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

label_425FF::
    nop
    nop
    nop
    nop
    rst  $38
    jr   nc, label_425D4
    nop
    rst  $38
    ld   b, $F9
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    nop

label_42611::
    nop
    nop
    rst  $38
    add  a, d

label_42615::
    ld   a, h
    jr   label_425FF
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

label_42637::
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
    jr   nc, label_42615
    rlca
    ld    hl, sp+$8E
    ld   [hl], c

label_4264A::
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

label_4265F::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    di
    ld   [hl], e
    adc  a, h
    jr   label_4264A
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
    jr   nc, label_4267C

label_4267C::
    rst  $38
    nop
    rst  $38
    nop
    nop
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
    jr   nc, label_4265F
    nop
    nop
    nop
    rst  $38
    ld   a, [bc]
    pop  af
    jr   nz, label_42637
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    nop

label_426A1::
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

label_426AC::
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
    jr   label_426A1
    nop
    rst  $38
    nop
    rst  $38

label_426BE::
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
    jr   label_426AC
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
    jr   label_426BE
    ld   c, $F1
    rrca
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    rst  0
    jr   c, label_42723
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
    jr   nz, label_4272B
    jr   nc, label_4271D
    jr   nz, label_4272F
    db   $10
    db   $0F
    jr   nz, label_42733
    jr   nz, label_42735
    jr   nc, label_42727
    inc  e
    inc  bc
    inc  de
    inc  c
    ld   [label_707], sp
    nop
    inc  bc
    nop
    rlca

label_42723::
    inc  bc
    dec  de
    inc  b
    dec  a

label_42727::
    inc  de
    add  hl, sp
    rla
    jr   c, label_42743
    add  hl, hl
    rla
    jr   label_42737
    inc  d
    dec  bc
    ldi  [hl], a

label_42733::
    dec  e
    ld   hl, label_381E

label_42737::
    rlca
    jr   label_42749
    rla
    rrca
    ld   [label_707], sp
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20

label_42746::
    inc  a
    ret  z
    inc  e

label_42749::
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
    db   $10
    db   $0F
    ld   [label_707], sp
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nc, label_42746
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
    db   $10
    db   $E0
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    ld   b, h
    nop
    jr   z, label_427A8

label_427A8::
    stop
    jr   z, label_427AC

label_427AC::
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
    jr   z, label_427B8

label_427B8::
    stop
    jr   z, label_427BC

label_427BC::
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

label_427E3::
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
    jr   c, label_42806

label_42806::
    ld   a, h
    jr   c, label_427A7
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
    jr   c, label_42822

label_42822::
    ld   a, h
    jr   c, label_427E3
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
    jr   nc, label_4288A
    jr   label_4286C
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

label_4286C::
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

label_4288A::
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

label_428AF::
    rrca
    ld   a, $19
    ld   a, l
    jr   c, label_4292D
    jr   nc, label_428AF
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    ld   c, b
    jr   nc, label_428F7
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

label_428F7::
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
    ld   a, [$FF60]
    ld    hl, sp+$70
    cp   h
    ld   a, b
    ld   a, [hl]
    inc  a
    ld   e, [hl]
    inc  a
    cpl
    ld   e, $1F
    ld   b, $07
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38

label_4292D::
    ld   b, $3F
    ld   b, $7F
    inc  e
    cp   $30
    ld    hl, sp+$60
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    jr   label_429C5
    inc  h
    ld   a, [hl]
    inc  h
    ld   a, [hl]
    jr   z, label_429C9
    jr   label_429CB
    db   $10
    db   $FF
    jr   z, label_42952
    ld   l, d
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, h
    rst  $38
    ld   h, [hl]
    rst  $38
    db   $3A ; ldd  a, [hl]
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
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
    nop
    nop
    cp   $00
    cp   $7C
    rst  $38
    ld   h, [hl]
    cp   $7C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, b
    cp   $7C
    cp   $60
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF00]
    ld   c, $00
    ld   e, $0C
    ld   a, $1C
    ld   a, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $00
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    ld   a, a
    ld   a, $3F
    ld   b, $7E
    inc  a
    ld   a, h
    nop
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38

label_429C5::
    ld   b, [hl]
    ld   a, [hl]
    inc  e
    ld   a, a

label_429C9::
    ld   b, $FF

label_429CB::
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  a
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
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_429E8
    jr   label_429EA
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
    jr   label_429F8
    jr   label_429FA
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
    jr   label_42A91
    jr   label_42A93
    jr   label_42A95
    jr   label_42A97
    jr   label_42A99
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
    jr   label_42AB5
    jr   label_42AB7
    jr   label_42AB9
    jr   label_42ABB
    jr   label_42A81

label_42A81::
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

label_42A91::
    nop
    rst  $38

label_42A93::
    nop
    rst  $38

label_42A95::
    ld   h, [hl]
    rst  $38

label_42A97::
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

label_42AB5::
    ld   h, d
    rst  $38

label_42AB7::
    ld   h, d
    rst  $38

label_42AB9::
    ld   [hl], d
    rst  $38

label_42ABB::
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
    jr   label_42B15
    jr   label_42B17
    jr   label_42B19
    jr   label_42B1B
    jr   label_42AE1

label_42AE1::
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

label_42B15::
    ld   h, [hl]
    rst  $38

label_42B17::
    ld   h, [hl]
    rst  $38

label_42B19::
    ld   h, [hl]
    rst  $38

label_42B1B::
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
    jr   label_42C0F
    jr   label_42C11
    jr   label_42C13
    jr   label_42C15
    jr   label_42C17
    jr   label_42C19
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
    jr   label_42C02

label_42C02::
    inc  a
    jr   label_42C83
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

label_42C0F::
    nop
    inc  a

label_42C11::
    nop
    ld   a, [hl]

label_42C13::
    inc  a
    rst  $38

label_42C15::
    ld   h, [hl]
    rst  $38

label_42C17::
    ld   h, b
    rst  $38

label_42C19::
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
    jr   label_42CA3
    jr   label_42CA5
    jr   label_42CA7
    jr   label_42CEB
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

label_42CA3::
    ld   h, d
    rst  $38

label_42CA5::
    ld   [hl], d
    rst  $38

label_42CA7::
    ld   a, d
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $30
    ld   h, d

label_42CAE::
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
    rlca
    ld   bc, label_206
    inc  b
    nop
    inc  b
    nop
    ld   e, $00
    ld   [de], a
    nop
    add  hl, hl
    db   $10
    db   $28
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

label_42CEB::
    nop
    jr   nz, label_42CAE
    sub  a, b
    ld   h, b
    ld   h, b
    add  a, b
    jr   nz, label_42D34
    jr   nz, label_42CF6

label_42CF6::
    jr   nz, label_42CF8

label_42CF8::
    ld   a, b
    nop
    ld   c, b
    nop
    ld   [hl], h
    ld   [label_8F4], sp
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

label_42D34::
    rst  $38
    jr   label_42D73
    jr   label_42D75
    jr   label_42D77
    jr   label_42D79
    jr   label_42D7B
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
    jr   label_42D9B
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_42D68
    jr   label_42D6A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_42D73::
    ld   b, d
    rst  $38

label_42D75::
    inc  h
    rst  $38

label_42D77::
    jr   label_42D78

label_42D79::
    jr   label_42D7A

label_42D7B::
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
    jr   label_42D88
    jr   label_42D8A
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
    jr   label_42D98
    jr   label_42D9A

label_42D9B::
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
    jr   label_42DA8
    jr   label_42DAA
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
    jr   label_42DB8
    jr   label_42DBA
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
    jr   label_42E43
    jr   nc, label_42E2D
    jr   nz, label_42E3F
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
    jr   label_42E0D
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
    rst  $38

label_42E0D::
    ld   [bc], a
    add  a, l
    ld   a, d
    rst  $38
    ld   [bc], a
    add  a, l
    ld   a, d
    add  a, l
    nop
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
    nop
    ld   c, a
    jr   nz, label_42E7C
    inc  hl
    ld   d, e
    jr   nz, label_42E7D

label_42E29::
    jr   nz, label_42EA7
    jr   nz, label_42E29

label_42E2D::
    nop
    rrca
    ld   a, [$FFFF]
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    pop  af
    nop
    ld   e, h
    nop
    nop

label_42E3F::
    nop
    db   $F4 ; Undefined instruction
    nop
    ld   a, [$FF00+C]
    ld   [$EAC4], a
    inc  b
    db   $3A ; ldd  a, [hl]
    inc  b
    ld   a, [hl]
    inc  b
    rst  $38
    nop
    ld    hl, sp+$07
    rst  $38
    ld   [$EB14], sp
    inc  d
    nop
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
    rst  $38
    db   $10
    db   $29
    sub  a, $FF
    jr   nz, label_42EC4
    xor  [hl]
    ld   d, c
    nop
    rst  $38
    nop
    rra
    nop
    ld   a, [$FF00]

label_42E7C::
    ld   [rJOYP], a
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
    ld   [bc], a
    nop
    rst  $38
    ld   [bc], a
    add  a, l
    ld   a, d
    rst  $38
    ld   [bc], a
    add  a, l
    ld   a, d
    add  a, l
    nop
    rst  $38
    nop
    rst  $38
    nop
    jr   c, label_42E9C

label_42E9C::
    rlca
    nop
    nop
    nop
    add  hl, hl
    nop
    ld   c, a
    jr   nz, label_42EFC
    inc  hl
    ld   d, e

label_42EA7::
    jr   nz, label_42EFD

label_42EA9::
    jr   nz, label_42F27
    jr   nz, label_42EA9
    nop
    rrca
    ld   a, [$FFFF]
    nop
    nop
    rst  $38
    nop
    nop
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
    nop
    ld   a, [$FF00+C]

label_42EC4::
    ld   [$EAC4], a
    inc  b
    db   $3A ; ldd  a, [hl]
    inc  b
    ld   a, [hl]
    inc  b
    rst  $38
    nop
    ld    hl, sp+$07
    rst  $38
    ld   [$EB14], sp
    inc  d
    nop
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
    rst  $38
    db   $10
    db   $29
    sub  a, $FF
    jr   nz, label_42F44
    xor  [hl]
    ld   d, c
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   c, $00

label_42EFC::
    ret  nz

label_42EFD::
    nop
    ld   b, b
    nop

label_42F00::
    nop
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
    rst  $38
    ld   [bc], a
    add  a, l
    ld   a, d
    rst  $38
    ld   [bc], a
    add  a, l
    ld   a, d
    add  a, l
    nop
    rst  $38
    nop
    rlca
    nop
    ld   a, [hl]
    nop
    stop
    ld   bc, label_2900
    nop
    ld   c, a
    jr   nz, label_42F7C
    inc  hl
    ld   d, e

label_42F27::
    jr   nz, label_42F7D

label_42F29::
    jr   nz, label_42FA7
    jr   nz, label_42F29
    nop
    rrca
    ld   a, [$FFFF]
    nop
    nop
    rst  $38
    nop
    nop
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
    nop
    ld   a, [$FF00+C]

label_42F44::
    ld   [$EAC4], a
    inc  b
    db   $3A ; ldd  a, [hl]
    inc  b
    ld   a, [hl]
    inc  b
    rst  $38
    nop
    ld    hl, sp+$07
    rst  $38
    ld   [$EB14], sp
    inc  d
    nop
    rst  $38
    nop
    add  a, e
    nop
    ld   [rJOYP], a
    jr   label_42F5E

label_42F5E::
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
    rst  $38
    db   $10
    db   $29
    sub  a, $FF
    jr   nz, label_42FC4
    xor  [hl]
    ld   d, c
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    ld   a, [hl]
    nop

label_42F7C::
    inc  b

label_42F7D::
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
    ld   [bc], a
    nop
    rst  $38
    ld   [bc], a
    add  a, l
    ld   a, d
    rst  $38
    ld   [bc], a
    add  a, l
    ld   a, d
    add  a, l
    nop
    rst  $38
    nop
    ccf
    nop
    ld   bc, label_1800
    nop
    nop
    nop
    add  hl, hl
    nop
    ld   c, a
    jr   nz, label_42FFC
    inc  hl
    ld   d, e

label_42FA7::
    jr   nz, label_42FFD

label_42FA9::
    jr   nz, label_43027
    jr   nz, label_42FA9
    nop
    rrca
    ld   a, [$FFFF]
    nop
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    ei
    nop
    ld   a, $00
    ld   bc, label_1200
    nop
    db   $F4 ; Undefined instruction
    nop
    ld   a, [$FF00+C]

label_42FC4::
    ld   [$EAC4], a
    inc  b
    db   $3A ; ldd  a, [hl]
    inc  b
    ld   a, [hl]
    inc  b
    rst  $38
    nop
    ld    hl, sp+$07
    rst  $38
    ld   [$EB14], sp
    inc  d
    nop
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
    rst  $38
    db   $10
    db   $29
    sub  a, $FF
    jr   nz, label_43044
    xor  [hl]
    ld   d, c
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]

label_42FFC::
    inc  e

label_42FFD::
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $30
    rst  $38
    ret  nz
    ld   a, [$FFE0]
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
    ld   sp, hl
    ld   b, $FA
    inc  b
    rst  $38
    rst  $38
    jp   nz, label_25FF
    ld   d, b
    ld   bc, label_40F20
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

label_43044::
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ld   bc, label_410FF
    xor  a
    nop
    rst  $38
    nop

label_4307F::
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

label_430A8::
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
    jr   label_430B7
    ldi  [hl], a
    db   $FD ; Undefined instruction
    push de
    jr   z, label_430A8
    db   $10
    db   $FF
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

label_430CE::
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

label_430E3::
    rst  $38
    rst  $28
    rst  $38
    add  a, $FF
    jr   nc, label_430E9
    add  a, [hl]
    ld   a, c
    add  a, [hl]
    ld   a, c
    rst  8
    jr   nc, label_43121
    rst  $38
    ld   a, b
    rst  $38
    ld   a, b
    rst  $38
    jr   nc, label_430F7
    ret  nz
    rst  $38
    jr   label_430E3
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

label_43121::
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
    jp   label_4170F
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

label_43142::
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

label_4314F::
    nop
    nop
    rst  $38
    nop
    rst  $38
    jr   label_43155
    jr   label_4314F
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
    jr   label_43142
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

label_431BE::
    rla
    db   $E8 ; add  sp, d
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    nop

label_431CA::
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

label_431DE::
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
    db   $10
    db   $DF
    jr   nz, label_431BE
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
    jr   nc, label_431CA
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
    jr   label_4324D
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
    ld   bc, label_430FE
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
    inc  b
    db   $FD ; Undefined instruction

label_43249::
    ld   [bc], a
    rst  $38
    nop
    rst  $38

label_4324D::
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

label_4328D::
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
    jr   nz, label_432B8
    ld   a, [$FF47]
    cp   b
    ld   hl, label_1FDE
    ld   [$FFF8], a
    rlca
    ld   a, [$FF0F]

label_432B4::
    ret  nz
    ccf
    ret  nz
    ccf

label_432B8::
    add  a, b

label_432B9::
    ld   a, a
    add  a, h
    ld   a, e
    add  a, [hl]
    ld   a, c
    rst  8
    jr   nc, label_432E0
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

label_432E0::
    ld   b, $F8
    ld   a, $C0
    ccf
    ret  nz
    ld   a, a
    add  a, b
    ld   a, b
    add  a, a
    jr   nc, label_432B4
    jr   nc, label_432B9
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
    jr   label_432E0
    ccf
    rst  8
    ccf
    jp   label_E33F
    rra
    di
    rrca

label_4331A::
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
    jr   nc, label_43300
    ld   h, d
    ld   e, $E1
    cp   a
    ld   b, b
    cp   $00

label_4336A::
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
    jr   nz, label_4336A
    jr   label_4331A
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
    jr   c, label_43406
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

label_433C3::
    nop
    rst  $28
    jr   nc, label_433DA
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

label_433DA::
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
    jr   z, label_433C3
    nop
    rst  $38
    nop
    ld   [hl], a
    rst  0
    jr   c, label_433B2
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

label_43406::
    rst  $38
    nop
    db   $EB ; Undefined instruction
    db   $10
    db   $D7
    jr   nz, label_4340C
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
    db   $10
    db   $F7
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

label_43465::
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

label_4347B::
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

label_4348D::
    ld   a, a
    nop
    rst  $38
    db   $FC ; Undefined instruction

label_43491::
    inc  bc
    ld   b, e
    cp   h
    jr   nc, label_43465
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
    call c, label_430CE
    inc  a
    ret  nz
    ld   [rSB], a
    ld   [$FF1F], a
    nop
    rst  $38
    rst  $38
    nop

label_434C2::
    inc  b
    ei
    jr   c, label_4348D
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
    jr   label_434C2
    jr   nz, label_434A2
    ld   b, b
    ld   a, l
    ret  nz
    ld   [hl], e
    ret  z
    ld   e, e

label_434EB::
    add  a, h
    rst  0
    jr   c, label_4347B
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

label_43505::
    swap b
    add  a, a
    jr   nc, label_43491
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
    jr   nz, label_43505
    jr   nz, label_434EB
    ld   b, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_4353B
    ld   [hl], b

label_4353B::
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

label_4354B::
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

label_43564::
    nop
    rst  $38
    nop
    rst  $38
    db   $10
    db   $FF
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
    jr   nc, label_4354B
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_43582::
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
    db   $10
    db   $EF
    inc  bc
    ld   a, h
    add  a, a
    jr   c, label_43564
    jr   nc, label_435E6
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

label_435E6::
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    pop  hl
    rst  $38
    ld   [rIE], a
    call c, label_41E20
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
    jr   c, label_43582
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
    ld   bc, label_430FE
    adc  a, a
    ret  nz
    ld   sp, rJOYP
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    db   $10
    db   $EF
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

label_43639::
    rst  $38

label_4363A::
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
    jr   nz, label_43639
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
    jp   label_4213C
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
    jr   nz, label_43671
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

label_4369D::
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
    jr   nc, label_4363A
    jr   nc, label_436B4
    ld   a, b
    inc  bc
    db   $FC ; Undefined instruction
    ld   h, c
    cp   $00
    rst  $38

label_436B4::
    jr   label_4369D
    ld   c, $F1
    rrca
    ld   a, [$FF1F]
    ld   [$FF3F], a
    ret  nz
    sbc  a, a
    ld   [$FFF3], a
    inc  c
    rst  8
    jr   nc, label_436FF
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
    ld   bc, label_438FE
    add  a, a
    adc  a, [hl]
    ld   [hl], c
    ld   bc, $00FE

label_436DD::
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

label_436E7::
    dec  e

label_436E8::
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

label_436FF::
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
    jr   c, label_436DD
    jr   nc, label_436E7
    ld   sp, label_33CE
    call z, label_807F
    rst  $38
    nop
    ld   e, $E1
    inc  sp
    call z, label_9C63
    rst  8
    jr   nc, label_436E8
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

label_4373D::
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
    jr   nz, label_4373D
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

label_43833::
    nop
    nop
    nop
    nop

label_43837::
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
    jr   c, label_43833
    db   $3A ; ldd  a, [hl]
    rst  $20
    jr   c, label_43837
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
    jr   c, label_438B5
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

label_438FE::
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

label_439BD::
    xor  a
    ld   a, [$FFFF]
    rlca
    rrca
    rlca
    rra
    nop
    ccf
    jr   nz, label_439A5
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
    jr   c, label_439BD
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
    db   $10
    db   $0F
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
    jr   c, label_43AB3
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

label_43AAE::
    ret  nz
    cp   a
    ld   a, [$FFFF]
    jp   hl

label_43AB3::
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
    jr   label_43AAE
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

label_43AE3::
    ld   c, $0B
    dec  c
    rra
    ld   e, $35
    ld   [hl], $03
    inc  c
    ld   bc, label_30E
    inc  e
    ei
    jr   label_43AE3
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

label_43B37::
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
    jr   nc, label_43B37
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
    jr   label_43BDC
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

label_43C7C::
    db   $FC ; Undefined instruction
    ei
    ld   sp, hl
    cp   $18
    rra
    rra

label_43C83::
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

label_43D03::
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
    jr   label_43D8E
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
    jr   nc, label_43DF1
    jr   nc, label_43DF3
    jr   nc, label_43DF5
    or   b
    rst  $38
    jr   nc, label_43DF9
    ld   [hl], b
    rst  $38
    ld   [hl], b
    rst  $38
    jr   nc, label_43DFF
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

label_43F00::
    db   $E8 ; add  sp, d
    cp   a
    ret  c
    sbc  a, a

label_43F04::
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
    jr   nz, label_43F04
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
    jr   nc, label_43FBC
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
    jr   nc, label_43FD8
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

label_43FD8::
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_43FFA::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
