section "bank49",romx,bank[$31]
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
    ccf
    nop
    ld   e, c
    ld   a, $AE
    ld   [hl], c
    and  a
    ld   a, b
    ld   d, c
    ld   a, $61
    ld   e, $72
    dec  l
    rst  $38
    ld   h, c
    rst  $38
    ld   bc, $DDE2
    nop
    nop
    nop
    nop
    ld   [hl], e
    nop
    sbc  a, a
    ld   h, e
    rra
    db   $EC ; Undefined instruction
    dec  sp
    call c, label_C5CBB
    rst  $38
    inc  e
    xor  $1B
    or   a
    ld   l, e
    ld   [hl], l
    ei
    sbc  a, d
    db   $FD ; Undefined instruction
    sbc  a, e
    db   $FD ; Undefined instruction
    rst  $30
    ei
    rst  $38
    rst  $30
    ld   l, [hl]
    rst  $30
    ld   d, d
    dec  a
    ld   l, [hl]
    ld   sp, label_C6CD3
    pop  hl
    ld   e, [hl]
    ret
    ld   a, [hl]
    or   e
    ld   a, h
    ld   a, [hl]
    ld   bc, label_33D
    ld   h, $1B
    halt
    ld   l, [hl]
    inc  sp
    ld   a, [hl]
    ld   b, e
    halt
    rlca
    ld   bc, $0003
    ld   bc, label_C7E00
    rst  $28
    ld   a, a
    rst  $28
    add  hl, de
    rst  $28
    sbc  a, c
    ld   l, a

label_C4068::
    rst  $38
    rrca
    halt
    db   $3A ; ldd  a, [hl]
    rst  0
    ld   c, h
    or   e
    add  a, a
    ld   a, b
    add  a, d
    ld   a, l
    dec  bc
    db   $FD ; Undefined instruction
    dec  [hl]
    ei
    ld   e, l
    db   $E3 ; Undefined instruction
    cp   [hl]
    pop  bc
    rst  $30
    ld   b, $C3
    inc  bc
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
    ccf
    nop
    ld   e, c
    ld   a, $AF
    ld   [hl], b
    sbc  a, a
    ld   h, a

label_C4094::
    ld   a, b
    rrca
    ld   [hl], a
    jr   c, label_C4068
    ld   [hl], b
    rst  $18
    ld   h, b
    cp   a
    ld   [hl], b
    ld   c, a
    jr   c, label_C40A4
    nop
    rlca
    inc  bc

label_C40A4::
    ld   a, h
    rlca
    sbc  a, l
    ld   h, [hl]
    dec  de
    and  $3F
    adc  a, $73
    sbc  a, h
    rst  $28
    jr   nc, label_C40B0
    jr   nz, label_C40B2
    jr   nz, label_C4094
    or   b
    ld   a, a
    ret  nc
    cp   a
    ld   l, c
    rst  $18
    add  hl, sp
    and  $19
    db   $FD ; Undefined instruction

label_C40BF::
    ld   [bc], a
    ld   a, a
    ld   [label_E7D], sp
    rst  $10
    ld   l, a
    reti
    ld   h, a
    call z, label_A773
    ld   a, b
    ld   a, a
    nop
    inc  a
    inc  bc
    ld   h, $1B
    halt
    ld   l, [hl]
    inc  sp
    ld   a, [hl]
    ld   b, e
    halt
    rlca
    ld   bc, $0003
    ld   bc, $FD00
    inc  bc
    xor  $19
    rst  $38
    db   $F4 ; Undefined instruction
    ei
    db   $EC ; Undefined instruction
    scf
    ret  c
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   e, b
    scf
    adc  a, $13
    xor  $5D
    and  $BD
    add  a, $FF
    inc  bc
    rst  0
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    inc  d
    dec  bc
    jr   nz, label_C4129
    jr   nz, label_C412B
    inc  h
    dec  de
    ld   a, [hli]
    dec  e
    ld   l, $1D
    ld   e, $0D
    ld   d, $0D
    ld   a, [bc]
    dec  b
    ld   b, $01
    ld   [bc], a
    ld   bc, $0001
    ld   bc, $F300
    nop
    inc  c
    di
    inc  bc
    db   $FC ; Undefined instruction

label_C4126::
    ld   h, b
    sbc  a, a
    add  a, l

label_C4129::
    ld   a, e
    add  a, d

label_C412B::
    ld   a, l
    adc  a, c
    ld   a, [hl]
    db   $E4 ; Undefined instruction
    rra
    jp   nc, label_BA2F
    ld   [hl], a
    cp   [hl]
    ld   a, e
    cp   h
    ld   h, e
    sub  a, l
    ld   l, d
    ld   e, a
    and  c
    dec  a
    jp   label_C7789
    push hl
    dec  de
    and  h
    ld   e, e
    xor  c
    ld   d, a
    ld   l, c
    rla
    ld   c, c
    scf
    add  a, h
    ld   a, e
    add  a, h
    ld   a, e
    add  a, c
    ld   a, a
    ld   b, l
    dec  sp
    ld   h, $19
    ldi  [hl], a
    dec  e
    ldi  [hl], a
    dec  e
    ld   hl, label_101F
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    rlca
    nop
    ld   [label_3007], sp
    rrca
    ld   d, c
    ld   l, $B3
    ld   l, l
    or   [hl]
    ld   c, c
    rst  $30
    jr   z, label_C4126
    ld   l, b
    or   e
    ld   l, h
    or   b
    ld   c, a
    ld   a, [$FF2F]
    cp   b
    ld   [hl], a
    sbc  a, a
    ld   a, b
    ld   c, a
    ccf
    jr   nz, label_C419D
    rra
    nop
    di
    nop
    inc  c
    di
    inc  bc
    db   $FC ; Undefined instruction
    ld   h, b
    sbc  a, a
    add  a, l
    ld   a, e
    add  a, d
    ld   a, l
    adc  a, c
    ld   a, [hl]
    db   $E4 ; Undefined instruction
    rra
    ld   [hl], d
    adc  a, a
    jp  c, label_CE27
    inc  sp
    and  h
    ld   e, e
    sub  a, l
    ld   l, d
    ld   c, a
    or   c
    dec  a

label_C419D::
    jp   label_C7789
    ld   bc, label_301
    ld   [bc], a
    dec  b
    ld   b, $0D
    ld   c, $1C
    rla
    ld   d, $1B

label_C41AC::
    inc  hl
    dec  a
    daa
    ld   a, $2F
    inc  a

label_C41B2::
    ccf
    inc  a
    ccf
    inc  a
    rla
    inc  a
    dec  d
    ld   e, $16
    rra
    rrca
    rra
    inc  bc

label_C41BF::
    rlca

label_C41C0::
    rst  $38
    rst  $38
    rst  $28
    jr   nc, label_C41AC
    jr   c, label_C41C0
    ld   e, [hl]
    cp   [hl]
    rst  0
    cp   a
    pop  bc
    cp   a
    pop  bc
    rst  $28
    pop  af
    rst  $30
    sbc  a, c
    ld   sp, hl
    rst  8
    cp   l
    rst  $20
    sbc  a, l
    rst  $30
    rst  8
    cp   $FD
    ld   a, $F9
    adc  a, [hl]
    ei
    call z, label_FCFB
    ld   d, e
    db   $FC ; Undefined instruction
    ld   d, e
    rst  $38
    ld   [hl], a
    db   $FC ; Undefined instruction
    ld   e, e
    db   $EC ; Undefined instruction
    sbc  a, e
    db   $EC ; Undefined instruction
    adc  a, h
    rst  $30
    adc  a, a
    rst  $30
    sbc  a, a
    db   $FC ; Undefined instruction
    db   $ED ; Undefined instruction
    or   $6E
    di
    daa
    ei
    daa
    ld   a, h
    add  hl, de
    ld   a, [hl]
    ld   [label_73F], sp
    rra
    inc  bc
    nop
    rrca
    nop
    rra
    nop
    ccf
    inc  bc
    ccf
    ld   bc, label_63F
    ld   d, a
    jr   c, label_C4282
    inc  a
    ld   a, e
    inc  [hl]
    ld   h, e
    inc  a
    ld   h, a
    jr   c, label_C425E
    jr   c, label_C4262
    jr   nc, label_C424E
    ld   bc, label_207
    rlca
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld    hl, sp+$00
    cp   b
    ld   b, b
    cp   h
    ld   b, b
    cp   h
    ld   b, b
    call c, label_EC20
    db   $10 ; Undefined instruction
    nop
    call c, label_CC20
    ld   [hl], b

label_C423C::
    xor  b
    ret  nc
    ld    hl, sp+$00
    jr   c, label_C4242

label_C4242::
    cpl
    db   $10 ; Undefined instruction
    nop
    ccf
    nop
    ld   a, a
    ld   b, $7F
    ld   [bc], a
    ld   a, a
    inc  c

label_C424E::
    xor  a
    ld   [hl], b
    rst  $20
    ld   a, b
    rst  $30
    ld   l, b
    rst  0
    ld   a, b
    rst  8
    ld   [hl], b
    adc  a, a
    ld   [hl], b
    sub  a, e
    ld   h, c
    ld   h, a
    ld   [bc], a

label_C425E::
    rlca
    nop
    rrca
    nop

label_C4262::
    rla
    ld   [label_10AE], sp
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $30
    ld   [$00FE], sp
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    cp   $00
    call c, label_C820
    ld   [hl], b
    xor  b
    ret  nc
    ld    hl, sp+$00
    rlca
    nop

label_C4282::
    rrca
    rlca
    ccf
    inc  c
    ld   a, h
    dec  hl
    rst  $38
    ld   l, b
    rst  $38
    ld   c, a
    ld   a, a
    db   $10 ; Undefined instruction
    dec  d
    jr   c, label_C42A9
    ccf
    jr   label_C42D4
    rra
    rra
    rrca
    rrca
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld   a, [$FFE0]
    db   $FC ; Undefined instruction
    ld   h, b
    cp   $7C
    rst  $38
    sbc  a, $FE
    db   $10 ; Undefined instruction
    ret  nc
    ld   a, h
    or   b
    cp   $64
    rst  $38
    sbc  a, $FF
    db   $F2 ; Undefined instruction
    db   $F2 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rst  8
    rlca
    rst  $38
    ld   c, h
    db   $FC ; Undefined instruction
    ld   l, e
    ld   a, a
    jr   z, label_C430C
    rrca
    ccf
    db   $10 ; Undefined instruction
    dec  d
    db   $3A ; ldd  a, [hl]
    dec  d

label_C42D4::
    db   $3A ; ldd  a, [hl]
    dec  d
    jr   c, label_C42EF
    rra
    ld   [label_70F], sp
    rlca
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    rst  $20
    ret  nz
    rst  $38
    and  $FE
    ld   l, h
    db   $FC ; Undefined instruction
    ld   a, b

label_C42EC::
    ld    hl, sp+$D0
    ld    hl, sp+$10
    db   $3A ; ldd  a, [hl]
    ret  nc
    ld   a, a
    or   d
    ld   a, a
    and  [hl]
    ld   a, [hl]
    cp   h
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   a, [$FFE0]
    ld   [rJOYP], a
    nop

label_C42FF::
    nop
    rrca
    nop
    ccf
    rrca
    ld   a, a
    inc  sp
    ld   a, a
    dec  l
    ld   a, a
    dec  l
    ccf
    dec  c

label_C430C::
    ccf
    ld   c, $3F
    ld   a, [de]
    ccf
    rra
    rra
    inc  c
    rrca
    inc  bc
    rra
    dec  bc
    ccf
    inc  c
    rst  $28
    jr   nc, label_C42EC
    ld   [hl], b
    ld   [hl], b

label_C431F::
    nop
    ret  nz
    nop
    db   $EC ; Undefined instruction
    ret  nz
    cp   $EC
    rst  $38
    xor  $FF
    or   $FF
    or   $F9
    or   $FE
    ld   a, [$FFF0]
    jr   nz, label_C4393
    add  a, b
    ld   a, [$FF00]
    ret  nc
    jr   nz, label_C4369
    ret  nz
    ld    hl, sp+$00
    ld    hl, sp+$00
    nop
    nop
    rra
    nop
    ccf
    rra
    ld   a, a
    jr   nc, label_C43C6
    ld   [hl], $FF
    ld   l, a
    rst  $38
    ld   e, a
    rst  $38
    ld   e, a
    ld   a, a
    ld   d, $3F
    rra
    rra
    ld   c, $0F
    ld   bc, $011F
    rla
    ld   [label_63F], sp
    dec  a
    ld   c, $1F
    nop
    add  a, b
    nop
    ld    hl, sp+$80
    db   $FC ; Undefined instruction
    ret  c
    cp   $EC
    cp   $74
    ld   a, [$FC74]
    or   b
    ld    hl, sp+$C0
    db   $E8 ; add  sp, d
    sub  a, b
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   [$FF80], a
    sub  a, b
    ld   h, b
    ld    hl, sp+$00
    ld    hl, sp+$00
    nop
    nop
    rra
    nop
    ccf
    rra
    ld   a, a
    jr   nc, label_C4406
    ld   [hl], $FF
    ld   l, a
    rst  $38
    ld   e, a
    rst  $38
    ld   e, a
    ld   a, a
    ld   d, $3F
    rra
    rra

label_C4393::
    ld   b, $3F
    add  hl, de
    ccf
    add  hl, de
    rra
    nop
    jr   nc, label_C43AB
    ccf
    nop
    nop
    nop
    add  a, b
    nop
    ld    hl, sp+$80
    db   $FC ; Undefined instruction
    ret  c
    cp   $EC
    cp   $74
    ld   a, [$FC74]
    or   b
    ld    hl, sp+$D0
    ld   a, [$FFA0]
    ld   [rJOYP], a
    ld   [$FF80], a
    ld   [$FF80], a
    sub  a, b
    ld   h, b
    ld   a, b
    add  a, b
    ld    hl, sp+$00
    nop
    nop
    rlca
    nop
    ld   l, a
    inc  b
    rst  $38
    ld   l, e

label_C43C6::
    rst  $38
    ld   h, a
    ld   a, a
    dec  bc
    ld   a, a
    rrca
    ld   a, a
    dec  c
    ccf
    dec  c
    scf
    dec  c
    dec  de
    rlca
    rra
    nop
    rrca
    nop
    dec  de
    inc  b
    inc  a
    inc  bc
    ld   [hl], a
    jr   c, label_C445E
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    ld    hl, sp+$70
    db   $FC ; Undefined instruction
    cp   b
    cp   $38
    rst  $38
    jp   z, label_F6FF
    rst  $38
    and  $D6
    db   $EC ; Undefined instruction
    cp   h
    ret  nz
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    jr   nc, label_C4477
    or   b
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    ld   e, $00
    ccf
    ld   e, $3F
    add  hl, de

label_C4406::
    ccf
    add  hl, de
    rra
    rrca
    dec  c
    inc  bc
    ld   l, b
    rlca
    cp   $0F
    cp   a
    ld   e, $3F
    inc  e
    rra
    inc  bc
    ccf
    rra
    ld   a, e
    inc  a
    ld   [hl], l
    jr   c, label_C4456
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    cp   $90
    rst  $38
    db   $EC ; Undefined instruction
    rst  $38
    cp   $FF
    ldh  [$FF0C], a
    cp   $F8
    ld   a, [$E47C]
    ld   a, b
    ld   a, h
    add  a, b
    or   h
    ret  z
    cp   h
    ret  nz
    ld    hl, sp+$00
    ld   [$FFC0], a
    ld   [$FFC0], a
    ret  nz
    nop
    inc  c
    nop
    rra
    nop
    ld   a, $01
    ld   a, a
    ld   bc, label_D1F
    ccf
    rra
    ld   a, a
    add  hl, sp
    rst  $38
    scf
    ld   a, a
    ccf
    ccf
    rra

label_C4454::
    ld   a, [de]
    rlca

label_C4456::
    ld   e, $01
    ld   a, e
    rlca
    ld   e, e
    daa
    ld   a, a
    nop

label_C445E::
    jr   label_C4460

label_C4460::
    nop

label_C4461::
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    jr   nc, label_C4461
    jr   nc, label_C4454
    ld   a, [$FFB1]
    ret  nz
    di
    ld   [$FFDE], a
    ld   [$FFBC], a
    ret  nz
    cp   $1C
    sbc  a, [hl]

label_C4477::
    db   $FC ; Undefined instruction
    xor  $F4
    cp   d
    call nz, label_20C6
    nop
    nop
    ld   e, b
    nop
    ld   a, a
    nop
    ld   a, $01
    rra
    ld   bc, label_D1F
    ccf
    rra
    ld   a, a
    add  hl, sp
    rst  $38
    scf
    ld   a, a
    ccf
    ccf
    rra
    ld   a, [de]

label_C4495::
    rlca
    ld   e, $01
    ld   a, e
    rlca
    ld   e, e
    daa
    ld   a, a
    nop
    jr   label_C44A0

label_C44A0::
    nop

label_C44A1::
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    jr   nc, label_C44A1
    jr   nc, label_C4495
    ld   a, [$FFB2]
    ret  nz
    db   $FC ; Undefined instruction
    ld   [$FFDC], a
    ld   [$FFB2], a
    call z, label_FE
    sbc  a, [hl]
    db   $FC ; Undefined instruction
    cp   $FC
    sbc  a, [hl]
    db   $EC ; Undefined instruction
    cp   $04
    ld   b, $00
    ld   bc, label_E00
    ld   bc, label_D33
    ld   e, a
    ld   hl, label_C6C9F
    rst  $38
    dec  e
    cp   a
    ld   e, l
    cp   a
    ld   e, [hl]
    cp   a
    ld   e, l
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
    jr   label_C44DE
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, label_305
    rlca
    ld   [bc], a
    dec  b
    ld   [bc], a
    rlca
    ld   [bc], a
    dec  b
    ld   [bc], a
    inc  bc
    nop
    inc  bc
    ld   bc, $0102
    ld   bc, $0000
    nop
    rlca
    nop
    rrca
    nop
    rrca
    ld   bc, $013F
    rst  $38
    rlca
    cp   a
    db   $ED ; Undefined instruction
    rst  $38
    dec  c
    ld   a, a
    rst  $30
    rst  $38
    xor  e
    rst  $38
    ld   a, [$CB75]
    rst  $38
    nop
    db   $DB
    cp   l
    rst  8
    cp   e
    add  a, $3B
    ccf
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    cp   $00
    rst  $38
    ret  nz
    rst  $38
    ld   l, h
    cp   $7C
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFEE]
    ld   [hl], b
    ret  c
    ld   [$FFF0], a
    nop
    ld   h, b
    add  a, b
    ld   d, b
    and  b
    ld   a, [$FF00]
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, label_305
    rlca
    ld   [bc], a
    dec  b
    ld   [bc], a
    rlca
    ld   [bc], a
    dec  b
    ld   [bc], a
    inc  bc
    nop
    inc  bc
    ld   bc, $0102
    ld   bc, $0000
    nop
    nop
    nop
    rlca
    nop
    rrca
    nop
    rra
    inc  b
    rst  $38
    inc  b
    xor  a
    rst  $30
    rst  $38
    dec  b
    ld   a, a
    push af
    rst  $38
    xor  a
    rst  $38
    rst  $28
    ld   a, a
    set  7, a
    rlca
    rst  $30
    cp   b
    rst  $10
    cp   e
    adc  a, a
    ld   [hl], a
    ld   a, a
    ld   b, $1F
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $B0
    cp   $B0
    db   $FC ; Undefined instruction
    ld   a, [$FFDE]
    ld   [$FFBE], a
    ret  nz
    ld   a, h
    add  a, b
    ld   [rJOYP], a
    ld   [rJOYP], a
    sub  a, b
    ld   h, b
    ld   a, [$FF00]
    ld   a, [$FF00]
    rrca
    nop
    rra
    nop
    rra
    ld   b, $1F
    rlca
    rrca
    dec  b
    rra
    dec  b
    ccf
    rla
    ccf
    rra
    ccf
    rra
    rra
    inc  b
    rra
    rlca
    ccf
    dec  de
    ccf
    jr   label_C45FA
    nop
    add  hl, sp
    ld   e, $3F
    nop
    ld   a, b
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    ret  nz
    ld   a, [$FF40]
    ld    hl, sp+$40
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   a, [$FFF0]
    ret  nz
    ld    hl, sp+$B0
    ld    hl, sp+$30
    ld    hl, sp+$00

label_C45FA::
    ld    hl, sp+$00
    cp   h
    ld   a, b
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
    nop
    nop
    nop
    rlca
    nop
    rrca
    rlca
    rra
    rrca
    rra
    rrca
    ld   a, a
    ld   a, [bc]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [$FFC0]
    ld    hl, sp+$F0
    ld    hl, sp+$D0
    ld   a, a
    ldi  [hl], a
    db   $EC ; Undefined instruction
    ld   e, a
    ld   [$FF5F], a
    rst  $38
    ld   h, b
    rst  $38
    ld   a, a
    ld   [hl], a
    jr   label_C468C
    nop
    ld   a, a
    dec  de
    ld   a, a
    nop
    rst  $38
    ld   h, [hl]
    adc  a, b
    ld   [hl], a
    ld   a, a
    nop
    rst  $28
    ld   [hl], e
    ld   b, d
    dec  a
    ccf
    nop
    nop
    nop
    ld   a, [$FFA0]
    ld    hl, sp+$70
    ld    hl, sp+$70
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    ld   a, [$FFFC]

label_C466B::
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ld   [$887C], sp
    ld   a, h
    adc  a, b
    db   $FC ; Undefined instruction
    jr   label_C466B
    ld   a, b
    db   $F2 ; Undefined instruction
    ld   l, h
    ld   d, [hl]
    xor  b
    inc  c
    ld   a, [$FFF8]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C468C::
    nop
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
    ld   bc, label_307
    rra
    ld   [bc], a
    ccf
    jr   label_C46A1

label_C46A1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [$FFE0]
    db   $FC ; Undefined instruction
    ld   a, [$FFFE]
    cp   h
    cp   $A4
    dec  sp
    rla
    ld   a, b
    scf
    ld   a, a
    jr   c, label_C4746
    ccf
    dec  sp
    inc  c
    rra
    nop
    ccf
    inc  c
    ccf
    nop
    ld   a, a
    inc  sp
    ld   b, h
    dec  sp
    ccf
    nop
    ld   a, a
    ld   sp, label_3946
    ld   hl, label_1F1E
    nop
    nop
    nop
    inc  a
    ret  c
    ld   a, $DC
    cp   $38
    cp   $FC
    rst  $38
    ld   a, b
    rst  $38
    ld   [bc], a
    rst  $18
    ldh  [$FF0C], a
    rst  $18
    ldi  [hl], a
    rst  $38
    ld   [bc], a
    ld   a, a
    cp   [hl]
    rst  $38
    ld   a, $EA
    sub  a, h
    add  hl, hl
    sub  a, $03
    db   $FC ; Undefined instruction
    cp   $00
    nop
    nop
    rlca

label_C4701::
    nop
    ccf
    nop
    ld   a, a
    ld   [bc], a
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    dec  hl
    rst  $38
    dec  sp
    db   $D3 ; Undefined instruction
    ccf
    ld   a, a
    rra
    cpl
    ld   e, $37
    rrca
    inc  l
    inc  de
    ld   a, a
    inc  [hl]
    ld   [hl], e
    cpl
    jr   nc, label_C472D

label_C471E::
    ccf
    nop
    ld   [rJOYP], a
    db   $FC ; Undefined instruction
    nop
    cp   $80
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    xor  h
    rst  $38

label_C472D::
    cp   h
    sbc  a, d
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FAF5]
    xor  $F0

label_C4736::
    ld   [hl], a
    adc  a, b
    rst  $38
    ld   e, b
    cp   [hl]
    ret  c
    inc  e
    ld   [$FFFC], a
    nop
    rlca
    nop
    ccf
    nop
    ld   a, a
    nop

label_C4746::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    ld   bc, label_37E
    dec  a
    ld   [bc], a
    ccf
    nop
    ld   a, a
    jr   nz, label_C47D0
    jr   z, label_C477E
    inc  e
    inc  hl
    rra
    ccf
    nop
    ld   [rJOYP], a
    ld   a, h
    add  a, b
    ld   a, [hl]
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $C0
    ld   e, $E0
    db   $FC ; Undefined instruction
    nop
    jr   c, label_C4736
    db   $FC ; Undefined instruction
    ld   [label_8FC], sp
    db   $EC ; Undefined instruction
    db   $10 ; Undefined instruction
    ld    hl, sp+$FC
    nop
    rra
    nop
    ccf
    nop
    ccf
    inc  c
    ccf
    ld   e, $3F
    rra
    ccf
    rla
    ld   a, a
    scf
    ld   [hl], e
    ccf
    ld   a, a
    ccf
    ld   a, a
    ccf
    ccf
    rra
    ld   de, label_F0E
    ld   bc, label_B1F
    ld   d, $0B
    rrca
    nop
    ret  nz
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00
    xor  [hl]
    ld   [hl], b
    cp   $70
    sbc  a, $F0
    db   $EC ; Undefined instruction
    ld   a, [$FFBE]
    call nz, label_C8B7
    ld   a, a
    add  a, b
    rst  $18
    jr   nz, label_C4817
    and  b
    ld   c, b
    or   b
    add  a, h
    ld   a, b
    db   $FC ; Undefined instruction
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    ld   a, [bc]
    ld   a, a
    rra
    ld   a, a
    rra
    ccf
    dec  de
    ld   a, a
    dec  sp
    ld   a, c
    ccf

label_C47D0::
    ld   a, a
    ccf
    ld   a, a
    rra
    cpl
    rra
    db   $10 ; Undefined instruction
    rrca
    nop
    dec  e
    ld   c, $11
    ld   c, $0F
    nop
    ld   [rJOYP], a
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $38
    nop
    rst  $10
    cp   b
    rst  $38
    cp   b
    rst  $28
    ld    hl, sp+$F6
    ld    hl, sp+$DC
    ld   [$FFDE], a
    db   $E4 ; Undefined instruction
    or   [hl]
    ret  z
    cp   $00
    cp   h
    ret  nz
    db   $E8 ; add  sp, d
    ret  nc
    ld   h, h
    ret  c
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
    inc  bc
    inc  b
    rrca
    nop
    rrca
    db   $10 ; Undefined instruction
    nop
    rra
    nop
    rra
    ld   [label_E1B], sp
    ld   e, $03
    rrca
    nop
    inc  bc
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
    ret  nz
    jr   nz, label_C489D
    add  a, b
    ld   a, [$FF08]
    ld   e, b
    ld   [$FFF8], a
    and  b
    ld   e, b
    ld   [$FFF8], a
    nop
    ld   a, [$FF08]
    ld   a, [$FF00]
    ret  nz
    jr   nz, label_C483F

label_C483F::
    nop
    nop
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
    inc  b
    rrca
    nop
    rrca
    db   $10 ; Undefined instruction
    inc  c
    rra
    dec  bc
    rrca
    ld   [bc], a
    rla
    ld   [label_F10], sp
    rrca
    nop
    inc  bc
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
    ret  nz
    jr   nz, label_C48DD
    add  a, b
    ld   a, [$FF08]
    xor  b
    ld   [hl], b
    ld    hl, sp+$50
    xor  b
    ld   a, [$FF78]
    add  a, b
    ld   a, [$FF08]
    ld   a, [$FF00]
    ret  nz
    jr   nz, label_C487F

label_C487F::
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
    rrca
    nop
    ld   e, $01
    rra
    jr   nz, label_C48CF
    ld   bc, $013F
    ld   a, $11
    scf
    inc  e
    dec  a
    ld   b, $1F
    nop
    rlca

label_C489D::
    ld   [$0000], sp
    ret  nz
    nop
    ld   h, $C0
    add  hl, hl
    add  a, $71
    adc  a, [hl]
    pop  de
    ld   l, [hl]
    sbc  a, c
    ld   h, [hl]
    pop  af
    ld   c, $F1
    ld   c, $B9
    add  a, $F6
    ld   b, b
    or   b
    ret  nz
    ld   a, [$FF00]
    ld   [rNR10], a
    ld   [rJOYP], a
    add  a, b
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $000F
    ld   e, $01
    rra

label_C48CF::
    jr   nz, label_C4910
    jr   label_C4912
    ld   d, $1F
    dec  b
    ld   l, $11
    ld   hl, label_1F1E
    nop
    rlca

label_C48DD::
    ld   [$0000], sp
    nop
    nop
    ret  nz
    nop
    ld   h, $C0
    add  hl, hl
    add  a, $71
    adc  a, [hl]
    pop  de
    ld   l, [hl]
    reti
    ld   h, $F1
    ld   c, $51
    xor  $F9
    and  [hl]
    ld   d, [hl]
    ld   [$FFF0], a
    nop
    ld   [rNR10], a
    ld   [rJOYP], a
    add  a, b
    ld   b, b
    nop
    nop
    inc  a
    nop
    ldi  [hl], a
    inc  e
    add  hl, hl
    ld   d, $27
    jr   label_C4938
    db   $10 ; Undefined instruction
    ld   [$001F], sp
    ld   a, a
    ld   bc, label_C41BF

label_C4912::
    rst  $38
    ld   bc, label_3FF
    ld   a, a
    dec  bc
    ccf
    rrca
    ld   a, a
    rlca
    rst  $38
    inc  de
    rst  $38
    nop
    rra
    nop
    ld   hl, $D91E
    ld   h, $61
    sbc  a, [hl]
    jp   nz, label_F23C
    inc  c
    ld   a, h
    add  a, b
    db   $FC ; Undefined instruction
    add  a, b
    cp   $80
    rst  $38
    add  a, b
    rst  $38
    ld   d, b
    rst  $38
    ld   [hl], b

label_C4938::
    xor  $F0
    db   $FC ; Undefined instruction
    ret  nz
    cp   $88
    rst  $38
    nop
    ld   c, $00
    add  hl, bc
    ld   b, $0B
    inc  b
    ld   c, $01
    rra
    nop
    cpl
    db   $10 ; Undefined instruction
    inc  b
    ccf
    inc  b
    ld   a, a
    inc  b
    ld   a, a
    ld   b, $7F
    dec  b
    ccf
    dec  c
    ccf
    rrca
    ccf
    rrca
    ld   a, a
    rlca
    rst  $38
    nop
    ld   a, b
    nop
    add  a, h
    ld   a, b
    or   h
    ld   c, b
    call nz, label_8838

label_C4969::
    ld   [hl], b
    ret  z
    jr   nc, label_C4969
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    ld   h, b
    cp   $E0
    call c, label_FEE0
    add  a, b
    rst  $38
    jr   nz, label_C497E
    nop
    db   $FC ; Undefined instruction
    dec  bc
    ld   [hl], a
    jr   label_C49C4
    inc  de
    rra
    dec  b
    rrca
    ld   b, $0F
    inc  b
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

label_C4997::
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
    ld   b, b
    cp   [hl]
    ld   h, b
    ret  c
    jr   nc, label_C4997
    add  a, b
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

label_C49C4::
    inc  h
    rst  $38
    jr   label_C49C7
    jr   label_C49C9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C49D7
    jr   label_C49D9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C49E7
    jr   label_C49E9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C49F7
    jr   label_C49F9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    ld   bc, label_700
    ld   bc, label_60F
    rra
    ld   c, $1F
    dec  c
    ccf
    dec  de
    cpl
    dec  de
    scf
    dec  bc
    ld   a, l
    ld   b, e
    ld   [hl], h
    ld   c, e
    ld   [hl], a
    ld   l, b
    ld   a, $21
    ld   a, $31
    rra
    inc  e
    rlca
    rlca
    ld   c, $00
    rra
    ld   c, $7F
    dec  c
    rst  $38
    ld   [hl], l
    db   $FD ; Undefined instruction
    ld   a, e
    db   $FC ; Undefined instruction
    ld   a, e
    cp   $21
    ld   a, a
    inc  e
    ld   a, a
    dec  a
    rst  $38
    cp   e
    rst  $38
    add  a, e
    rst  $30
    ret
    ld   a, a
    ld   h, b
    ld   a, $31
    rra

label_C4A3D::
    inc  e
    rlca
    rlca
    rlca
    nop
    ccf
    ld   bc, label_127F
    ld   a, a
    db   $3A ; ldd  a, [hl]
    ld   a, a
    add  hl, bc
    ccf
    jr   label_C4A8C
    ld   [label_87F], sp
    rst  $38
    add  hl, de
    ei
    ld   [hl], a
    di
    ld   l, a
    ld   l, a
    dec  de
    cpl
    inc  e
    rla
    rrca
    rrca
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ldh  [$FF0C], a
    sbc  a, h
    db   $FD ; Undefined instruction
    ld   b, d
    rst  $38
    ld   b, b
    rst  $18
    and  b
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    rst  $38
    ret  nz
    rst  $38
    add  a, $FF
    add  a, [hl]
    sbc  a, [hl]
    ld   l, h
    cp   h
    ret  c
    ld   a, h
    sbc  a, b
    sbc  a, h
    ld   [$000C], sp
    jr   c, label_C4A82

label_C4A82::
    ld   e, b
    jr   nz, label_C4A3D
    ld   b, b
    cp   a
    ld   b, b
    cp   c
    ld   b, [hl]
    rst  $30
    ld   [label_30FF], sp
    rst  $38
    ld   c, b
    rst  $38
    ld   c, b
    rst  $38
    jr   nc, label_C4A94
    nop
    ld   a, a
    rra
    ld   a, a
    dec  [hl]
    ld   a, a
    inc  de
    ld   a, $03
    inc  bc
    nop
    ld   [rJOYP], a
    ld   a, [$FF60]
    rst  $38
    ld   [hl], b
    rst  $38
    ld   e, $FE
    inc  c
    db   $EC ; Undefined instruction
    db   $10 ; Undefined instruction
    ret  c
    ld   a, [$FEEC]
    db   $F4 ; Undefined instruction
    cp   $74
    sbc  a, [hl]
    ld   l, h
    jp  c, label_D43C
    cp   b
    ld   c, b
    or   b
    ld   a, [$FF00]
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
    ld   c, $00
    ld   [de], a
    inc  c
    ld   l, $10
    ld   l, $10
    ld   e, [hl]
    jr   nz, label_C4B37
    jr   nz, label_C4ADA
    add  a, c
    rst  $38
    jp   label_C7E7E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_C4AF0

label_C4AF0::
    inc  l
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   d, d
    rst  $28
    sub  a, c
    rst  $38
    add  a, c
    rst  $38
    jp   label_C7E7E
    ld   c, $00
    dec  e
    ld   c, $20
    rra
    jr   nz, label_C4B27
    dec  h
    ld   a, [de]
    rra
    dec  b
    rra
    rrca
    rra
    ld   [bc], a
    ld   a, a
    dec  e
    cp   a
    ld   d, l
    cp   a
    ld   e, l
    sbc  a, a
    ld   h, d
    cp   a
    ld   c, b
    or   a
    ld   c, a
    xor  a
    ld   d, b
    rst  $28
    inc  e
    ld    hl, sp+$00
    ld   h, h
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ld   [bc], a

label_C4B27::
    db   $FC ; Undefined instruction
    add  a, d
    ld   a, h
    call nz, label_E8B8
    ret  nc
    db   $FC ; Undefined instruction

label_C4B2F::
    jr   nz, label_C4B2F
    ret  z
    db   $FD ; Undefined instruction
    ld   e, d
    push af
    jp  c, label_26F9
    db   $E2
    ldh  [$FF0C], a
    cp   l
    jp   nz, label_1AE5
    rst  $30
    jr   c, label_C4BC0
    inc  c
    ld   l, a
    inc  sp
    ld   a, a
    ccf
    ld   a, a
    add  hl, hl
    ld   a, a
    ccf
    ld   a, a
    ldi  [hl], a
    ld   a, a
    ccf
    ld   a, a
    dec  h
    ld   a, a
    ccf
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
    rlca
    nop
    inc  c
    rlca
    ld   de, label_100E
    rrca
    ld   d, $09
    rra
    ld   b, $1F
    rrca
    ccf
    inc  bc
    ld   a, a
    inc  l
    rst  $38
    dec  l
    cp   a
    ld   c, l
    cp   a
    ld   d, e
    cp   a
    ld   b, a
    or   a
    ld   c, a
    xor  a
    ld   d, b
    rst  $28
    inc  e
    ld   a, h
    nop
    and  d
    ld   a, h
    ld   b, c
    cp   $01
    cp   $01
    cp   $01
    cp   $82
    ld   a, h
    or   h
    ld   c, b
    cp   $30
    ld   sp, hl
    or   [hl]
    jp   [hl]
    or   $F9
    add  a, $BD
    jp   nz, label_827D
    push hl
    ld   a, [de]
    rst  $30
    jr   c, label_C4BAF
    nop
    ld   a, [bc]
    inc  b
    ld   c, $00
    ld   a, [bc]
    inc  b
    ld   a, [bc]
    inc  b
    ld   c, $00
    ld   a, [bc]
    inc  b
    ld   de, label_150E
    ld   c, $1F
    nop
    dec  d
    ld   c, $25
    ld   e, $2D
    ld   e, $4D
    ld   a, $5D
    ld   a, [hli]
    ld   a, a
    nop

label_C4BC0::
    nop
    rst  $38
    nop
    rst  $38

label_C4BC4::
    inc  h
    rst  $38
    jr   label_C4BC7
    jr   label_C4BC9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C4BD7
    jr   label_C4BD9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C4BE7
    jr   label_C4BE9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C4BF7
    jr   label_C4BF9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_C4C02

label_C4C02::
    ld   e, a
    jr   nz, label_C4BC4
    ld   b, b
    db   $FC ; Undefined instruction
    inc  bc
    or   a
    ld   a, b
    rst  $38
    inc  bc
    rra
    rlca
    ccf
    ld   c, $3E
    dec  c
    ld   a, [hl]
    dec  c
    ld   a, a
    ld   c, $BF
    ld   b, a
    rst  $38
    ld   b, e
    cp   a
    ld   h, b
    ld   e, a
    ccf
    ccf
    nop
    inc  e
    nop
    db   $F2 ; Undefined instruction
    inc  c
    db   $FD ; Undefined instruction
    ld   [bc], a
    ccf
    ret  nz
    db   $ED ; Undefined instruction
    ld   e, $FF
    ret  nz
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   a, h
    or   b
    ld   a, [hl]
    sub  a, b
    sbc  a, [hl]
    ld   h, b
    call label_FFB2
    add  a, d
    db   $FD ; Undefined instruction
    ld   b, $FA
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    ld   hl, label_C471E
    ccf
    ld   [hl], a
    dec  c
    rst  $28
    ld   [hl], a
    db   $E8 ; add  sp, d
    rla
    ld   a, [$FF6F]
    db   $FC ; Undefined instruction
    ld   e, a
    rst  $38
    ld   a, $7F
    ld   a, $5E
    ccf
    dec  l
    ld   e, $1F
    ld   bc, $001F
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

label_C4C6C::
    ld   h, b
    add  a, b
    ld   e, $E0
    dec  e
    ldh  [$FF0C], a
    add  hl, sp
    add  a, $1A
    db   $E4 ; Undefined instruction
    inc  d
    db   $E8 ; add  sp, d
    ld    hl, sp+$00
    ld   a, [$FF40]
    ret  nc
    ld   [$FFF0], a
    nop
    nop
    nop
    rrca
    nop
    db   $10 ; Undefined instruction
    inc  hl
    rra
    dec  sp
    ld   b, $77
    dec  sp
    ld   [hl], h
    dec  bc
    ld   a, b
    scf
    ld   a, [hl]
    cpl
    ccf
    ld   e, $3F
    ld   e, $3F
    rra
    cpl
    rra
    ld   de, label_F0E
    ld   bc, $001F
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
    ld   [$FF80], a
    ld   e, $E0
    dec  e
    ldh  [$FF0C], a
    add  hl, sp
    add  a, $1A
    db   $E4 ; Undefined instruction
    inc  d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    add  a, b
    ld   [rLCDC], a
    ret  nc
    ld   [$FFF0], a

label_C4CBF::
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    sbc  a, [hl]
    ld   h, b
    ld   h, c
    ld   e, $47
    ccf
    ld   [hl], a
    dec  c
    rst  $28
    ld   [hl], a
    db   $E8 ; add  sp, d
    rla
    ld   a, [$FF6F]
    db   $FC ; Undefined instruction
    ld   e, a
    cp   $3F
    ld   a, [hl]
    ccf
    ld   e, [hl]
    ccf
    dec  l
    ld   e, $1F
    ld   bc, $001F
    rlca
    nop
    rra
    nop
    cpl
    db   $10 ; Undefined instruction
    jr   nc, label_C4C6C
    ld   a, h
    add  a, d
    ld   a, h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   b, $F8
    add  hl, bc
    or   $31
    adc  a, $02
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$78
    add  a, b
    ld   a, [$FF40]
    ret  nc
    ld   [$FFF0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, $00
    rra
    ld   c, $0F
    ld   bc, $0001
    nop
    nop
    ld   b, $00
    rrca
    nop
    dec  c
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
    ld   [hl], b
    nop
    ld   a, c
    jr   nc, label_C4D6E
    db   $10 ; Undefined instruction
    ld   [$8BFE], sp
    or   [hl]
    ld   c, c
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
    ld   a, [$FF00]
    jr   c, label_C4D14
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   h
    nop
    ret  c
    nop
    rrca
    nop
    rrca
    nop
    rra
    nop
    rra
    ld   [label_C17], sp
    rrca
    ld   b, $07
    inc  bc

label_C4D6E::
    inc  bc
    ld   bc, $0001
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
    rst  $38
    jr   label_C4D82
    jr   label_C4D84
    jr   label_C4D86
    dec  [hl]
    rst  $38
    or   a
    cp   $FF
    rst  $38
    ld   a, h
    ld   a, a
    cp   b
    ld   a, a
    add  a, d
    rst  $20
    ld   e, e
    ei
    push bc
    pop  de
    adc  a, [hl]
    sbc  a, a
    nop
    ld   e, $0B
    rra
    ld   a, [bc]
    ld   e, $00
    rst  0
    nop
    rst  8
    ld   b, $DD
    ld   c, $FE
    inc  e
    ld   a, [$FC3C]
    ld   a, b
    ld   l, b
    ld   a, [$FF30]
    ret  nz
    ret  nz
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
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
    ld   bc, label_200
    ld   bc, label_307
    rrca
    ld   b, $1F
    dec  c
    ccf
    jr   label_C4DF3
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
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   a, [$FFC0]
    ld    hl, sp+$70
    db   $FC ; Undefined instruction
    cp   b
    cp   $1C
    sbc  a, a
    ld   b, $87
    nop
    nop
    nop

label_C4DFE::
    nop
    nop
    rrca
    nop
    rra
    inc  c
    rst  $38
    nop
    ld   sp, hl
    ld   a, [hl]
    ld   a, a
    nop
    rra
    dec  c
    rra
    dec  b
    ld   a, a
    rra
    cp   a
    ld   e, [hl]
    sbc  a, [hl]
    ld   h, c

label_C4E14::
    ret  nz
    ccf
    rst  $38
    ld   b, b
    db   $FC ; Undefined instruction
    ld   e, e
    ld   a, a
    jr   label_C4E38
    rlca
    ccf
    nop
    ld    hl, sp+$00
    or   h
    ld   a, b
    ld   a, d
    db   $FC ; Undefined instruction
    ld   l, d
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    db   $E4 ; Undefined instruction
    ret  c
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    ret  nz
    jr   label_C4E14
    ld   a, b
    add  a, b
    sbc  a, b
    ld   h, b

label_C4E38::
    jr   c, label_C4DFA

label_C4E3A::
    ld    hl, sp+$00
    jr   nz, label_C4DFE

label_C4E3E::
    ld   a, [$FF00]
    ccf
    nop
    ld   e, e
    inc  a
    cp   l
    ld   a, [hl]
    xor  l
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    ld   a, a
    ld   bc, label_374F
    ld   l, a
    ld   de, label_E31
    and  b
    rra
    ld   a, [$FF0F]
    rst  $38
    ld   h, b
    db   $FC ; Undefined instruction
    ld   e, e
    ld   a, a
    jr   label_C4E78
    rlca
    ccf
    nop
    ld   [rJOYP], a
    ld   a, [$FF60]
    cp   $00
    ld   a, $FC
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF60]
    ld    hl, sp+$40
    db   $FC ; Undefined instruction
    ld   a, [$FFFA]
    db   $F4 ; Undefined instruction
    db   $F2 ; Undefined instruction
    inc  c
    inc  b
    ld    hl, sp+$F8
    nop

label_C4E78::
    jr   c, label_C4E3A
    ld    hl, sp+$00
    jr   nz, label_C4E3E
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
    ccf
    nop
    ld   a, a
    ccf
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
    cp   h
    ret  nz
    ld   a, e
    db   $FC ; Undefined instruction
    or   $0F
    dec  c
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
    inc  e
    nop
    ccf
    inc  e
    rra
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [$FF80], a
    ld   a, b
    ld   [$FFDC], a
    jr   c, label_C4F1D
    inc  e
    rla
    ld   c, $0B
    rlca
    dec  b
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
    nop
    nop
    rrca
    nop
    scf
    rrca
    ld   e, a
    ccf
    cp   a
    ld   a, a
    cp   a
    ld   a, a
    ld   e, a
    ccf
    scf
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop

label_C4F1D::
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, label_305
    rlca
    inc  bc
    dec  bc
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    rrca
    rlca
    dec  bc
    rlca
    rlca
    inc  bc
    dec  b
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
    rra
    nop
    ld   l, a
    rra
    cp   a
    ld   a, a
    cp   a
    ld   a, a
    ld   l, a
    rra
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
    ld   bc, label_200
    ld   bc, $0103
    dec  b
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    dec  b
    inc  bc
    inc  bc
    ld   bc, $0102
    ld   bc, $0000
    nop
    nop
    nop
    rra
    nop
    ld   l, $1F
    ccf
    rra
    ccf
    rra
    ccf
    rra
    cpl
    rra
    rra
    rrca
    rla
    rrca
    rrca
    rlca
    dec  b
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
    jr   label_C4FA6

label_C4FA6::
    ld   h, $18
    dec  l
    ld   e, $1F
    rrca
    rla
    rrca
    rrca
    rlca
    rlca
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
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    rra
    nop
    ccf
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
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   h, b
    nop
    ld   [hl], b
    nop
    jr   nc, label_C4FF0

label_C4FF0::
    jr   nc, label_C4FF2

label_C4FF2::
    jr   nz, label_C4FF4

label_C4FF4::
    ld   b, b
    nop

label_C4FF6::
    nop
    nop

label_C4FF8::
    nop
    nop

label_C4FFA::
    nop
    nop
    nop
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
    ccf
    ld   [bc], a
    ld   a, [hl]
    dec  a
    db   $FD ; Undefined instruction
    ld   l, d

label_C5010::
    ld   a, [$FC45]
    ld   d, e
    ld   a, [$FF7F]
    db   $E3 ; Undefined instruction
    ld   a, h
    call nz, label_C603B
    rra
    ld   a, a
    nop
    sbc  a, a
    nop
    ld   e, $00
    add  hl, de
    ld   c, $25
    ld   a, [de]
    rst  $18
    jr   nz, label_C4FD9
    ld   b, b
    ld   d, b
    and  b
    sbc  a, b
    ld   h, b
    jr   label_C5010
    ld   a, b
    add  a, b
    jr   nc, label_C4FF4
    jr   nz, label_C4FF6
    jr   nz, label_C4FF8
    jr   nz, label_C4FFA
    ld   h, b
    add  a, b
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    rlca
    nop
    dec  e
    rlca
    jr   c, label_C5067
    ldi  [hl], a
    dec  e
    ld   h, a
    add  hl, sp
    ld   h, [hl]
    dec  sp
    call label_FA76
    ld   a, l
    ld   a, l
    ld   [bc], a
    inc  e
    inc  bc
    ld   e, $01
    rrca
    nop
    rrca

label_C505B::
    nop
    rlca
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

label_C5067::
    add  a, b
    ld   [$FF80], a
    ld   [hl], b
    and  b
    cp   b
    ld   h, b
    sbc  a, h
    ld   l, b
    ld   a, a
    adc  a, b
    dec  d
    ld   [label_8F7], a
    inc  [hl]
    ret  z
    ld    hl, sp+$00
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
    inc  bc
    nop
    dec  e

label_C5089::
    inc  bc
    daa
    rra
    ld   e, [hl]
    ld   hl, label_C40BF
    cp   a
    ld   b, e
    cp   a

label_C5093::
    ld   b, e
    cp   h
    ld   b, e
    ld   e, a
    jr   nz, label_C50F8
    jr   nz, label_C50C2
    jr   label_C50B5
    rlca
    rlca
    nop
    nop
    nop
    inc  c

label_C50A3::
    nop
    cp   $0C
    ld   a, d
    db   $E4 ; Undefined instruction
    adc  a, h
    ld   a, [$FF04]
    ld    hl, sp+$C4
    ld    hl, sp+$44
    ld    hl, sp+$88
    ld   [hl], b
    ld   c, b
    or   b
    ld   d, b

label_C50B5::
    and  b
    ret  nc
    jr   nz, label_C5089
    jr   nz, label_C505B
    ld   b, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    inc  a
    nop

label_C50C2::
    ld   a, h
    jr   c, label_C5134
    jr   nc, label_C5125
    ccf
    daa
    jr   label_C50E5
    nop
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    ccf
    nop
    ld   h, b
    ccf
    ld   c, a
    jr   nc, label_C514F
    nop
    nop
    nop
    nop
    nop
    add  a, b

label_C50E5::
    nop

label_C50E6::
    ld   b, b
    add  a, b
    jr   nz, label_C50AA
    sub  a, b
    ld   h, b
    ret  z
    jr   nc, label_C5093
    jr   label_C50A3
    inc  c
    xor  d
    inc  b
    and  l
    ld   [bc], a
    and  l
    ld   [bc], a

label_C50F8::
    and  l
    ld   [bc], a
    ld   a, c
    add  a, [hl]
    ld   [bc], a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    ld   bc, label_200
    ld   bc, $0106
    add  hl, bc
    ld   b, $18
    rlca
    inc  h
    dec  de
    ld   h, d
    dec  e
    sub  a, c
    ld   l, [hl]
    adc  a, c
    halt
    ld   sp, label_C4CBF
    sbc  a, a
    ld   h, c
    cp   d
    ld   a, l
    ld   b, a
    jr   c, label_C5155
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nz, label_C50E6
    db   $10 ; Undefined instruction
    adc  a, b
    ld   [hl], b
    ld   b, h
    cp   b
    ld   h, $D8
    ccf
    add  a, $FF
    jr   nc, label_C5132
    add  a, [hl]

label_C5134::
    ld   sp, hl
    ld   [hl], $CE
    or   b
    ld   [hl], b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    ld   b, $00
    rlca
    ld   [bc], a
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0102
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    ld   a, [bc]

label_C514F::
    inc  b
    ld   a, [bc]
    inc  b
    inc  d
    ld   [label_814], sp
    jr   z, label_C5168
    cpl
    db   $10 ; Undefined instruction
    ccf
    ld   a, a
    nop
    nop
    nop
    or   b
    nop
    db   $FC ; Undefined instruction
    and  b
    ld   [de], a
    ld   [$FFA9], a
    ld   b, b

label_C5168::
    dec  h
    ret  nz
    db   $D3 ; Undefined instruction
    jr   nz, label_C51BD
    jr   nz, label_C5197
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_814], sp
    ld   [$FE00], sp
    nop
    ld   [bc], a
    db   $FC ; Undefined instruction
    cp   $00
    nop
    nop
    nop
    nop
    rlca
    nop
    dec  bc
    rlca
    db   $10 ; Undefined instruction
    ld   hl, label_C431F
    ld   a, $47
    inc  a
    ld   c, a
    jr   c, label_C51F0
    jr   nc, label_C5212
    ldi  [hl], a
    ld   a, a
    ld   bc, label_197F
    ld   e, a
    ld   l, $2F
    rla
    rla
    ld   [$000F], sp
    nop
    nop
    ld   a, [$FF00]
    ld    hl, sp+$C0
    db   $FC ; Undefined instruction
    adc  a, b
    cp   $04
    rst  $38
    ld   h, $FF
    ld   a, [de]
    rst  $38
    sbc  a, h
    db   $FD ; Undefined instruction
    ld   l, d
    ld   a, [$F474]
    xor  b
    db   $E8 ; add  sp, d
    ret  nc
    ret  nc
    and  b
    and  b
    ld   b, b
    ld   b, b

label_C51BD::
    add  a, b
    add  a, b
    nop
    nop
    nop
    rlca
    nop
    rra
    rlca
    jr   c, label_C51E7
    ld   h, c
    ld   a, $63
    dec  a
    ld   h, e
    inc  a
    ld   a, c
    ld   e, $7F
    daa
    ld   a, a
    jr   label_C5254
    daa
    ld   a, a
    jr   nc, label_C5256
    ld   h, $3B
    inc  c
    ld   a, [de]
    dec  b
    rlca
    nop
    inc  e
    nop
    cp   $14
    ld   a, [$F4AC]

label_C51E7::
    ld   e, b
    db   $EC ; Undefined instruction
    or   b
    sub  a, $6C
    and  [hl]
    call c, label_38DE

label_C51F0::
    cp   $E4
    cp   $18
    ld   a, [$F2E4]
    inc  c
    ld   [hl], $C8
    inc  h
    ret  c
    ld   a, b
    add  a, b
    ld   [rJOYP], a
    rlca
    nop
    jr   label_C520B
    inc  hl
    rra
    cpl
    db   $10 ; Undefined instruction
    jr   nz, label_C5289

label_C520B::
    ld   bc, label_334D
    or   l
    ld   a, e
    cp   a
    ld   a, c

label_C5212::
    cp   d
    ld   l, l
    rst  $38
    inc  l
    ld   e, [hl]
    dec  [hl]
    ld   h, d
    dec  e
    ld   a, $01
    rla
    inc  c
    ld   c, $00
    inc  bc
    nop

label_C5222::
    inc  c
    inc  bc
    rla
    rrca
    cpl
    inc  e
    ld   l, l
    inc  de
    ei
    ld   b, a
    db   $E8 ; add  sp, d
    rla
    ld   c, a
    jr   nc, label_C5290
    jr   nz, label_C5222
    rra
    rst  $28
    ld   d, a
    xor  a
    ld   e, c
    ld   d, a
    cpl
    jr   c, label_C5243
    rra
    nop
    rlca
    nop
    add  a, b
    nop
    ld   h, b

label_C5243::
    add  a, b
    cp   b
    ret  nz
    db   $FC ; Undefined instruction
    nop
    ld   a, d
    add  a, h
    ld   a, l
    add  a, [hl]
    db   $FD ; Undefined instruction
    ld   b, $FD
    ld   b, $FD
    ld   b, $7D
    add  a, [hl]

label_C5254::
    cp   c
    add  a, $BA
    call nz, label_CCB2
    ld   h, h
    sbc  a, b
    ld    hl, sp+$00
    ret  nz
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    nop
    ld   e, $01
    dec  a
    inc  bc
    dec  a
    inc  bc
    ld   e, [hl]
    ld   hl, label_205F
    ld   e, a
    jr   nz, label_C52C2
    jr   nc, label_C529C
    jr   label_C529C
    dec  de
    inc  d
    dec  bc
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    ld   b, $00
    add  hl, bc
    ld   b, $15
    ld   c, $1B
    inc  c
    rra

label_C5289::
    ld   [label_817], sp
    ld   e, $01
    dec  e
    inc  bc

label_C5290::
    ld   a, l
    inc  bc
    sbc  a, [hl]
    ld   h, c
    xor  a
    ld   [hl], b
    ld   e, e
    inc  a
    ccf
    nop
    nop
    nop

label_C529C::
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
    jr   label_C52AF
    ld   h, $1F
    ld   [hl], e
    inc  c
    adc  a, h
    ld   [hl], e
    xor  c

label_C52AF::
    ld   [hl], a
    sbc  a, l
    ld   h, e
    ld   l, a
    inc  e
    dec  l
    ld   e, $21
    ld   e, $13
    inc  c
    inc  c
    nop
    nop
    nop
    nop
    nop
    jr   label_C52C2

label_C52C2::
    inc  a
    jr   label_C52FF
    inc  e
    ld   [de], a
    inc  c
    ld   e, $00
    dec  d
    ld   c, $7F
    ld   b, $EF
    ld   [hl], c
    cp   $6D
    ld   a, l
    ld   c, $09
    ld   b, $07
    nop
    dec  bc
    ld   b, $05
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop

label_C52E0::
    nop
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
    ld   a, a
    ld   b, $E9
    halt
    ld   h, b
    ld   [hl], h
    jr   label_C5333
    nop
    ld   a, [hl]
    inc  c
    or   h
    ld   l, b
    call z, label_9070
    ld   h, b
    ld   h, b

label_C52FF::
    nop
    inc  b
    nop
    ld   c, $04
    ld   c, $04
    ld   c, $04
    rrca
    ld   b, $0F
    rlca
    rra
    rlca
    dec  sp
    rla
    ld   l, l
    inc  sp
    ld   e, [hl]
    ld   hl, $00FF
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    cp   h
    ld   b, e
    cp   [hl]
    ld   h, c
    ld   e, e
    inc  a
    nop
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc
    rlca
    inc  de
    rrca
    di
    rrca
    pop  af
    xor  $F3
    db   $ED ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $ED ; Undefined instruction
    inc  hl

label_C5333::
    db   $C1
    pop  bc
    ld   a, $30
    rst  8
    ld   sp, hl
    rst  $10
    db   $EB
    db   $EB ; Undefined instruction
    dec  l
    di
    add  a, c
    ld   a, [hl]
    ld   a, a
    nop
    rst  $30
    jr   c, label_C52E0
    ld   a, l
    adc  a, a
    ld   a, e
    adc  a, a
    ld   [hl], l
    ld   c, a
    dec  [hl]

label_C534C::
    dec  sp
    dec  b
    inc  c
    inc  bc
    rla
    ld   [label_1F20], sp
    cpl
    db   $10 ; Undefined instruction
    nop
    daa
    jr   label_C53AA
    jr   nc, label_C53DC
    nop
    ccf
    nop
    db   $E3 ; Undefined instruction
    dec  e
    di
    inc  c
    db   $DB
    and  l
    rst  8
    jr   nc, label_C534C
    rst  $18
    pop  af
    adc  a, a
    cp   a
    ret  nc
    ld   l, a
    sbc  a, e
    or   c
    ld   c, a
    rrca
    ld   a, [$FF04]
    ei
    add  a, a
    ld   a, b
    rst  8
    jr   nc, label_C537A
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    ei
    rlca
    di
    rst  $28
    di
    xor  $D1
    xor  $21
    sbc  a, $C1
    ld   a, $00
    rst  $38
    ld    hl, sp+$E7
    ld   l, l
    di
    dec  d
    ei
    add  a, c
    ld   a, [hl]
    rst  $38
    add  a, b
    rst  $18
    ccf
    cp   a
    ld   a, a
    sbc  a, a
    ld   h, b
    cp   [hl]
    ld   b, c

label_C53AA::
    or   a
    ld   c, b
    or   c
    ld   c, [hl]
    or   h
    ld   c, e
    cp   a
    ld   b, b
    or   a
    ld   c, c
    or   d
    ld   c, l
    sbc  a, e
    ld   h, h
    adc  a, a
    ld   [hl], b
    db   $E4 ; Undefined instruction
    dec  de
    ld   sp, label_1F0E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    ccf
    db   $10 ; Undefined instruction
    ld   sp, label_215F
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FD
    cp   h
    ld   b, e

label_C53DC::
    cp   [hl]
    ld   h, c
    ld   e, e
    inc  a
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   [hl], l
    inc  bc
    jp   [hl]
    halt
    ld   b, h
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    inc  e
    db   $3E
    ld   a, $DF
    ld   a, $EF
    ld   a, [de]
    pop  de
    xor  $3F
    ld   [$FF9F], a
    ld   l, h
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $000F
    inc  de
    inc  c
    dec  l
    ld   e, $40
    ccf
    ld   [hl], b
    rrca
    ld   e, l
    ld   a, $9D
    ld   a, [hl]
    sbc  a, e
    ld   a, h
    add  a, l
    ld   a, e
    ret  z
    scf
    rlca
    nop
    dec  c
    ld   [bc], a
    rst  8
    nop
    jp   [hl]
    add  a, a
    ld   [hl], d
    rst  8
    or   c
    ld   l, [hl]
    ld   b, d
    cp   l
    dec  h
    db   $DB
    and  l
    ld   e, e
    call label_9A33
    ld   a, l
    add  a, c
    ld   a, [hl]
    sbc  a, h
    ld   h, e
    rst  $18
    inc  h
    ld   a, e
    add  a, [hl]
    cp   a
    ret  nz
    add  a, b
    nop
    ld   c, [hl]
    add  a, b
    sbc  a, $04
    ei
    call z, label_EC33
    jp   z, label_E735
    reti
    push af
    db   $EB ; Undefined instruction
    db   $F4 ; Undefined instruction
    dec  hl
    or   $29
    ei
    call c, label_3EC1
    dec  e
    ldh  [$FF0C], a
    db   $FD ; Undefined instruction
    ld   [de], a
    jp   [hl]
    ld   [hl], $F1
    ld   c, $38
    nop
    ld   a, [hl]
    jr   c, label_C540C
    ld   a, d
    sbc  a, a
    ld   h, d
    adc  a, c
    halt
    sbc  a, b
    add  a, l
    ld   a, [$EC12]
    inc  c
    ld   a, [$FF84]
    ld   a, b
    inc  b
    ld    hl, sp+$04
    ld    hl, sp+$38
    ret  nz
    db   $10 ; Undefined instruction
    or   b
    ld   b, b
    ld   a, [$FF00]
    add  a, e
    ld   a, h
    add  a, b
    ld   a, a
    ld   h, [hl]
    rra
    inc  hl
    rra
    jr   nc, label_C5499
    jr   label_C5493
    rra
    nop
    inc  de
    inc  c
    inc  c
    inc  bc
    ld   [label_1E07], sp
    ld   bc, label_1F2A
    inc  h

label_C5499::
    dec  de
    ccf
    nop
    inc  bc
    nop
    nop
    nop
    ld   a, $D9
    cp   l
    ld   [hl], d
    dec  a
    cp   $3B
    db   $FC ; Undefined instruction
    dec  d
    ld   a, [label_C7E81]
    jp   label_C7F3C
    add  a, b
    ld   l, a
    sub  a, b
    dec  c
    ld   a, [$FF04]
    ld    hl, sp+$4F
    ld   a, [$FF9F]
    ld   h, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    rra
    ld   [$FFFE], a
    ld   bc, label_6F9
    db   $E3 ; Undefined instruction
    inc  e
    ld   c, $F1
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    jp  c, label_1005
    rrca
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   sp, hl
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    ld   [rJOYP], a
    and  b
    ld   b, b
    ld   [hl], b
    add  a, b
    ld    hl, sp+$00
    ld   l, h
    ld   a, [$FF74]
    ld    hl, sp+$0A
    db   $FC ; Undefined instruction
    ld   a, [de]
    db   $FC ; Undefined instruction
    ld   b, d
    cp   h
    inc  a
    ret  nz
    ld   [label_C78F0], sp
    add  a, b
    ld   c, $F0
    dec  hl
    db   $FC ; Undefined instruction
    sub  a, e
    ld   l, h
    cp   $00
    nop
    nop
    nop
    nop
    rlca
    nop
    rra
    rlca
    ccf
    rra
    ld   a, a
    ccf
    ld   a, a
    ld   l, $FF
    ld   l, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   l, [hl]
    cp   a
    ld   [hl], c
    ld   e, a
    ccf
    ld   l, a
    rra
    ld    hl, sp+$67
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    cp   $FC
    rst  $38
    cp   $F7
    xor  $F9
    or   $FF
    ld    hl, sp+$F9
    cp   $F2
    db   $FC ; Undefined instruction
    call c, label_2EE0
    call c, label_FE
    nop
    nop
    nop
    nop
    rlca
    nop
    rra
    rlca
    ccf
    rra
    ld   a, a
    ccf
    ld   a, a
    cpl
    rst  $38
    ld   l, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   [hl], a
    cp   a
    ld   a, b
    ld   e, a
    ccf
    ld   l, a
    rra
    ld    hl, sp+$67
    rst  $38
    nop
    inc  sp
    nop
    ld   a, a
    inc  sp
    ld   a, a
    daa
    ld   a, a
    ld   d, $7F
    ccf
    ld   a, a
    ccf
    rst  $38
    ld   h, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    cp   a
    ld   h, b
    ld   e, a
    ccf
    ld   l, a
    rra
    ld    hl, sp+$67
    rst  $38
    nop
    add  a, $00
    rst  $38
    add  a, $FF
    ld   l, [hl]
    db   $FD ; Undefined instruction
    sbc  a, $F9
    cp   $F2
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [label_C7EF9]
    ld   sp, hl
    ld   a, $F9
    ld   a, $F9
    ld   l, $F9
    ld   l, [hl]
    db   $F2 ; Undefined instruction
    call c, label_E0DC
    ld   l, $DC
    cp   $00
    nop
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
    ei
    rst  $38
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $38
    rrca
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
    jr   nc, label_C55C4

label_C55C4::
    ld   a, a
    jr   nc, label_C5646
    daa
    ld   a, a
    rra
    ld   a, a
    ld   l, $7F
    ld   l, $FF
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   [hl], a
    rst  $38
    ld   [hl], a
    cp   a
    ld   [hl], a
    ld   e, a
    ccf
    ld   l, a
    rra
    ld    hl, sp+$67
    rst  $38
    nop
    nop
    nop
    ld   b, $00
    rst  $28
    ld   b, $FF
    xor  $FD
    cp   $F9
    cp   $F2
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [$FEF9]
    ld   sp, hl
    cp   $F9
    cp   $F9
    cp   $F2
    db   $FC ; Undefined instruction
    call c, label_2EE0
    call c, label_FE
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    ld   b, $07
    dec  c
    ld   c, $1B
    inc  e
    ld   e, $19
    inc  d
    dec  de
    inc  a
    inc  sp
    jr   z, label_C564F
    jr   c, label_C5641
    jr   c, label_C5643
    jr   c, label_C5645
    jr   c, label_C5647
    nop
    nop
    nop
    nop
    ccf
    ccf
    rst  $28
    ld   a, [$FF3F]
    ret  nz
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    jr   c, label_C5669
    ld   a, b

label_C5643::
    ld   h, a
    ld   a, b

label_C5645::
    ld   b, a

label_C5646::
    db   $E4 ; Undefined instruction

label_C5647::
    sbc  a, e
    rst  8
    or   b
    rst  $18
    or   b
    rst  $18
    or   b
    rst  $10

label_C564F::
    cp   b
    ld   l, a
    ld   e, b
    ld   [hl], a
    ld   c, h
    add  hl, sp
    ld   h, $1F
    db   $10 ; Undefined instruction
    ld   a, [bc]
    dec  c
    dec  bc
    ld   c, $09
    rlca
    inc  b
    ccf
    rst  $38
    inc  bc
    rst  $38
    ld   a, l
    add  a, e
    sbc  a, $39
    add  a, a

label_C5669::
    ld   a, h
    ei
    ld   b, $B5
    ld   a, e
    ld   a, e
    db   $FD ; Undefined instruction
    ld   a, a
    db   $FD ; Undefined instruction
    ld   a, [hl]
    db   $FD ; Undefined instruction
    ld   a, [hl]
    push hl
    cp   a
    ld   h, h
    add  a, $39
    db   $FC ; Undefined instruction
    inc  bc
    pop  af
    ld   c, $FF
    ld   h, c
    nop
    nop
    inc  bc
    inc  bc
    rlca
    inc  b
    ld   c, $09
    ld   a, l
    ld   [hl], e
    ei
    add  a, [hl]
    db   $DB
    inc  [hl]
    cp   a
    ld   h, b
    ld    hl, sp+$07
    rst  $30
    adc  a, a
    rst  $28
    sbc  a, a
    rst  $28
    inc  de
    xor  a
    ld   d, e
    cp   a
    ld   c, a
    sbc  a, a
    ld   h, b
    ret
    or   a
    ld    hl, sp+$F8
    cp   $06
    adc  a, a
    ld   [hl], e
    ccf
    ret  nz
    rst  $38
    nop
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   [hl], b
    adc  a, a
    xor  c
    rst  $10
    push hl
    db   $DB
    db   $ED ; Undefined instruction
    db   $DB
    xor  l
    db   $DB
    ld   e, l
    or   e
    cp   e
    ld   h, a
    rst  $30
    rst  8
    nop
    nop
    inc  b
    inc  b
    nop
    nop
    jr   label_C56E0
    jr   label_C56E2
    ld   b, $06
    ld   b, [hl]
    ld   b, [hl]
    nop
    nop
    jr   label_C56EA
    dec  e
    dec  e
    dec  c
    dec  c
    ld   bc, label_C4701
    ld   b, a
    ld   b, $06
    nop
    nop
    nop
    nop

label_C56E0::
    nop
    nop

label_C56E2::
    db   $10 ; Undefined instruction
    nop
    nop
    ret  nz
    ret  nz
    ld   [$FFE0], a

label_C56EA::
    ld   l, h
    ld   l, h
    inc  c
    inc  c
    ld   a, b
    ld   a, b
    ld   a, b
    ld   a, b
    sbc  a, b
    sbc  a, b
    sbc  a, h
    sbc  a, h
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $FE
    ld   a, $3E
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
    ld   bc, label_700
    nop
    rrca
    nop
    rra
    nop
    ccf
    nop
    ccf
    ld   bc, label_215F
    ld   l, [hl]
    ld   sp, label_3857
    dec  l
    ld   e, $1B
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C5726::
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
    ld   [rIE], a
    jr   nc, label_C5734
    jr   nc, label_C5726
    ld   a, [$FF1F]
    ld   [$FFFD], a

label_C573B::
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    nop
    jr   nz, label_C5742

label_C5742::
    jr   nz, label_C5744

label_C5744::
    ld   h, b
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00

label_C5750::
    cp   $00
    rst  $10
    jr   c, label_C5750
    inc  l
    cp   l
    halt
    ld    hl, sp+$E4
    ld    hl, sp+$98
    ld   [$FFE0], a
    nop
    inc  bc
    nop
    ld   b, $03
    dec  c
    ld   b, $0B
    inc  b
    rra
    nop
    rra
    ld   bc, $011F
    ld   l, $11
    ccf
    db   $10 ; Undefined instruction
    jr   label_C57B0
    inc  e
    ld   l, $1F
    rla
    rrca
    dec  bc
    rlca
    ld   b, $01

label_C577E::
    ld   bc, $8100
    nop
    db   $FD ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    jr   nc, label_C578C
    jr   nc, label_C577E
    ld   a, [$FF1F]
    ld   [rIE], a
    nop
    cp   $01
    ei
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    call z, label_B800
    ret  nz
    ld   a, [$FFC0]
    ld   d, b
    ld   [$FFF0], a
    ld   h, b
    xor  b
    ld   [hl], b
    ld    hl, sp+$30
    db   $F4 ; Undefined instruction
    jr   c, label_C576D
    ld   a, b
    ld   a, h
    ld    hl, sp+$F4
    ld    hl, sp+$E4
    ld    hl, sp+$C8
    ld   a, [$FF10]
    ld   [$FF60], a
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

label_C57D1::
    nop
    nop
    nop
    ld   [hl], b
    nop
    ret  c
    jr   nz, label_C57D1
    nop
    ld    hl, sp+$00
    ld   [hl], b
    nop
    jr   nz, label_C57E0

label_C57E0::
    rlca
    nop
    rra
    nop
    ld   a, $01
    ld   a, l
    inc  bc
    ld   a, l
    inc  bc
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    sbc  a, a
    ld   h, b
    ld   b, a
    jr   c, label_C5839
    ccf
    jr   nz, label_C581B
    jr   label_C5805
    rlca
    nop
    rrca
    nop
    dec  de
    rlca
    cpl

label_C5805::
    rra
    ccf
    rra
    ld   e, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    ccf
    ld   e, a
    inc  a
    ld   a, a
    inc  e
    rst  $28
    ld   e, a
    ret  c
    ld   h, a
    sub  a, a
    ld   l, b
    ld   a, b

label_C581B::
    rlca
    ld   a, h
    dec  sp
    ld   a, a
    nop
    ld   a, [$FF00]
    ld   l, b
    sub  a, b
    call nc, label_F2E8
    db   $EC ; Undefined instruction
    ld   [$F934], a
    ld   [hl], $F9
    ld   [hl], $FE
    ld   a, [$FFEA]
    db   $F4 ; Undefined instruction
    pop  de
    xor  $A9
    sbc  a, $75
    sbc  a, d
    and  l

label_C5839::
    ld   e, d
    add  hl, de
    and  $06
    ld    hl, sp+$FC
    nop
    inc  bc
    nop
    inc  c
    inc  bc

label_C5844::
    inc  de
    rrca
    ld   h, $1F
    inc  h
    rra
    jr   nz, label_C586B
    jr   nc, label_C585D
    jr   nc, label_C585F
    jr   z, label_C5869
    ld   b, a
    jr   c, label_C5895
    ccf
    ld   b, b
    ccf
    ld   h, b
    rra
    ld   b, b
    ccf
    jr   nz, label_C587D
    rra

label_C585F::
    nop
    ld   [rJOYP], a
    jr   label_C5844
    inc  b
    ld    hl, sp+$04
    ld    hl, sp+$02

label_C5869::
    db   $FC ; Undefined instruction
    ld   [bc], a

label_C586B::
    db   $FC ; Undefined instruction
    ldi  [hl], a
    call c, label_C43A
    add  a, $38
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, label_C41FE
    cp   [hl]
    adc  a, c

label_C5879::
    halt
    ret  nz
    ld   a, h

label_C587D::
    cp   b
    db   $FC ; Undefined instruction
    nop
    ccf

label_C5881::
    nop
    ld   d, [hl]
    add  hl, sp
    ld   a, e
    inc  a
    cp   a
    ld   a, h
    db   $FD ; Undefined instruction
    ld   h, $FF
    ld   h, $FF
    ld   h, $BF
    ld   a, [hl]
    cp   l
    ld   e, [hl]
    cp   e
    ld   e, h
    ld   [hl], l

label_C5895::
    dec  sp
    ld   c, d
    scf
    ld   a, c
    ld   b, $3E
    ld   bc, label_3C7B
    ld   a, a
    nop
    ld   a, [$FF00]
    call z, label_2F0
    db   $FC ; Undefined instruction
    ld   bc, $81FE
    ld   a, [hl]
    sub  a, c
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld   [bc], a
    adc  a, e
    ld   [hl], b
    ld   [$8CF0], sp
    ld   [hl], b
    ld   [de], a
    db   $EC ; Undefined instruction
    add  a, c
    ld   a, [hl]
    rlca
    ld    hl, sp+$1F
    ldh  [$FF0C], a
    rst  $38
    inc  e
    cp   $00
    ccf
    nop
    ld   e, e
    inc  a
    ld   a, l
    ld   a, $BF
    ld   a, [hl]
    cp   $53
    rst  $38
    ld   d, e
    rst  $38
    ld   d, e
    rst  $38
    ld   a, a
    cp   $6F
    cp   l
    ld   l, [hl]
    ld   a, d
    dec  a
    push bc
    dec  sp
    cp   h
    ld   b, e
    rst  $38
    nop
    rra
    rlca
    ccf
    nop
    ld   [rJOYP], a
    ld   e, b
    ld   [$FF84], a
    ld   a, b
    add  a, d
    ld   a, h
    jp   nz, label_D23C
    inc  l
    ld   a, [$CE04]
    jr   nc, label_C5879
    ld   [hl], b
    ret  z
    jr   nc, label_C5881
    ld   a, [$FF42]
    cp   h
    add  a, c
    ld   a, [hl]
    pop  bc
    ld   a, $FF
    ret  nz
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rra
    ld   [bc], a
    ccf
    inc  bc
    ld   a, a
    nop
    ld   a, e
    rlca
    rst  $30
    rrca
    rst  $28
    ld   e, $FE
    dec  e
    db   $FC ; Undefined instruction
    dec  de
    db   $FC ; Undefined instruction
    dec  de
    cp   $1D
    ld   l, a
    ld   e, $77
    rrca
    cp   e
    ld   h, a
    adc  a, a
    ld   [hl], b
    ld   a, h
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction

label_C5923::
    jr   nz, label_C5923
    ld   h, b
    cp   $00
    rst  $28
    ld   a, [$FFF7]
    ld   a, b
    ld   a, e
    cp   h
    ccf
    call c, label_EC1F
    rra
    db   $EC ; Undefined instruction
    ld   a, $DC
    ld   a, d
    cp   h
    push af
    ld   a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    cp   $00
    nop
    nop
    rlca
    nop
    rra
    ld   [bc], a
    ccf
    inc  bc
    ld   a, a
    nop
    ld   a, e
    rlca
    rst  $30
    rrca
    rst  $28
    inc  e
    db   $FC ; Undefined instruction
    dec  de
    db   $FC ; Undefined instruction
    dec  de
    db   $FC ; Undefined instruction
    dec  de
    cp   $1D
    ld   l, a
    ld   e, $77
    rrca
    cp   e
    ld   h, a
    adc  a, a
    ld   [hl], b
    ld   a, h
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction

label_C5963::
    jr   nz, label_C5963
    ld   h, b
    cp   $00
    rst  $28
    ld   a, [$FFF7]
    ld    hl, sp+$FB
    sbc  a, h
    sbc  a, a
    ld   l, h
    rra
    db   $EC ; Undefined instruction
    rra
    db   $EC ; Undefined instruction
    ld   a, $DC
    ld   a, d
    cp   h
    push af
    ld   a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    cp   $00
    nop
    nop
    rlca
    nop
    rra
    ld   [bc], a
    ccf
    inc  bc
    ld   a, a
    nop
    ld   a, e
    rlca
    rst  $30
    rrca
    rst  $28
    ld   e, $FF
    inc  e
    rst  $38
    jr   label_C5992
    jr   label_C5994
    jr   label_C5A05
    rra
    ld   [hl], a
    ld   c, $BB
    ld   h, a
    adc  a, a
    ld   [hl], b
    ld   a, h
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction

label_C59A3::
    jr   nz, label_C59A3
    ld   h, b
    cp   $00
    rst  $28
    ld   a, [$FFF7]
    ld   a, b
    ei
    inc  a
    rst  $38
    inc  e
    rst  $38
    inc  c
    rst  $38
    inc  c
    cp   $0C
    cp   d
    ld   a, h
    push af
    db   $3A ; ldd  a, [hl]
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    cp   $00
    nop
    nop
    rlca
    nop
    rra
    ld   [bc], a
    ccf
    inc  bc
    ld   a, a
    nop
    ld   a, e
    rlca
    rst  $30
    rrca
    rst  $28
    ld   e, $FF
    ld   e, $FF
    add  hl, de
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    add  hl, de
    ld   [hl], a
    rrca
    cp   e
    ld   h, a
    adc  a, a
    ld   [hl], b
    ld   a, h
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction

label_C59E3::
    jr   nz, label_C59E3
    ld   h, b
    cp   $00
    rst  $28
    ld   a, [$FFF7]
    ld   a, b
    ei
    inc  a
    rst  $38
    inc  a
    rst  $38
    ld   c, h
    rst  $38
    inc  b
    cp   $04
    ld   a, [$F54C]
    ld   a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    cp   $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C5A05::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_C5A12

label_C5A12::
    ld   a, e
    jr   nc, label_C5A14
    db   $3A ; ldd  a, [hl]
    rst  $18
    halt
    ld   a, [hl]
    ld   e, l
    ld   a, $23
    inc  e
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
    ld   h, b
    nop
    ld   [hl], b
    jr   nz, label_C5A8C
    jr   nc, label_C5A5A
    rla
    ld   sp, label_270F
    jr   label_C5A5C
    ld   a, [de]
    ccf
    nop
    dec  l
    ld   e, $5B
    ld   a, $45
    db   $3A ; ldd  a, [hl]
    ld   a, $00
    jr   nc, label_C5A42

label_C5A42::
    jr   c, label_C5A54
    ccf
    db   $10 ; Undefined instruction
    rrca
    inc  hl
    rra

label_C5A4A::
    cpl
    db   $10 ; Undefined instruction
    inc  d
    cpl
    db   $10 ; Undefined instruction

label_C5A51::
    dec  e
    ld   h, d
    dec  e

label_C5A54::
    sub  a, b
    ld   l, a
    sbc  a, a
    ld   h, b
    xor  l
    ld   e, [hl]

label_C5A5A::
    ld   e, e
    ld   a, $45
    db   $3A ; ldd  a, [hl]
    ld   a, $00
    ld   b, $00
    ld   c, $04
    ld   a, [$B40C]
    ret  c
    jr   label_C5A4A
    db   $E4 ; Undefined instruction
    jr   label_C5A51
    sbc  a, b
    db   $E4 ; Undefined instruction
    jr   label_C5A75
    ld    hl, sp+$1A
    db   $E4 ; Undefined instruction
    dec  [hl]

label_C5A75::
    adc  a, $F9
    ld   b, $B5
    ld   a, d
    jp  c, label_A27C
    ld   e, h
    ld   a, h
    nop
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5A87
    jr   label_C5A89
    inc  h
    rst  $38

label_C5A8C::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5A97
    jr   label_C5A99
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5AA7
    jr   label_C5AA9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5AB7
    jr   label_C5AB9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5AC7
    jr   label_C5AC9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5AD7
    jr   label_C5AD9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5AE7
    jr   label_C5AE9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5AF7
    jr   label_C5AF9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  hl, sp
    nop
    ld   [hl], e
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    dec  e
    rla
    dec  c
    dec  bc
    rlca
    rra
    nop
    dec  a
    ld   a, [de]
    ld   a, $1B
    ld   a, c
    rlca
    ld   a, b
    rlca
    ld   a, a
    nop
    ld   c, a
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $6C
    ld   a, [$ECBC]
    or   b
    ret  c
    ld   [$FFFC], a
    nop
    sbc  a, $20
    ld   a, $EC
    rst  $18
    db   $EC ; Undefined instruction
    ld   a, a
    add  a, b
    cp   l
    ld   a, b
    ld    hl, sp+$00
    ld   [hl], e
    nop
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    dec  sp
    cpl
    dec  de
    rla
    rrca
    ccf
    nop
    ld   a, e
    inc  b
    ld   a, h
    scf
    ei
    scf
    cp   $01
    cp   l
    ld   e, $1F
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  c
    db   $F4 ; Undefined instruction
    ld   a, b
    ret  c
    ld   h, b
    or   b
    ret  nz
    ld    hl, sp+$00
    cp   h
    ld   e, b
    ld   a, h
    ret  c
    sbc  a, [hl]
    ld   [rNR34], a
    ld   [$FFFE], a
    nop
    db   $F2 ; Undefined instruction
    nop
    ld   [hl], e
    nop
    rst  $20
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
    dec  bc
    ccf
    dec  de
    rra
    rrca
    rrca
    nop
    rrca
    ld   b, $0F
    ld   b, $06
    ld   bc, $0003
    rlca
    inc  bc
    rlca
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld   h, b
    ld    hl, sp+$60
    ld   a, [$FFC0]
    ld   a, [$FF80]
    ld    hl, sp+$00
    ld   a, h
    add  a, b
    inc  a
    ret  nz
    ld   a, $C0
    cp   $00
    sbc  a, $E0
    ld    hl, sp+$00
    nop
    nop
    ld   [hl], e
    nop
    rst  $20
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
    dec  bc
    ccf
    dec  de
    rra
    rrca
    rrca
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    rrca
    nop
    rra
    inc  c
    rra
    nop
    nop
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld   h, b
    ld    hl, sp+$60
    ld   a, [$FFC0]
    cp   $80
    cp   a
    ld   b, b
    sbc  a, a
    ld   h, b
    sbc  a, a
    ld   h, b
    ccf

label_C5BFB::
    ret  z
    db   $FC ; Undefined instruction
    jr   c, label_C5BFB
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
    rrca
    ld   b, $0E
    dec  b
    ld   d, $0D
    db   $10 ; Undefined instruction
    inc  e
    dec  bc
    rla
    inc  c
    ccf
    rla
    dec  hl
    rla
    db   $3A ; ldd  a, [hl]
    dec  b
    ld   c, a
    inc  [hl]
    ld   a, a
    nop
    ld   b, $00
    rrca
    ld   b, $0E
    dec  b
    ld   d, $0D
    db   $10 ; Undefined instruction
    rra

label_C5C2B::
    ld   [label_C1F], sp
    rla
    rrca
    dec  bc
    rlca
    add  hl, bc
    rlca
    ld   a, [bc]
    dec  b
    rrca
    inc  b
    dec  c
    ld   [bc], a
    add  hl, bc
    ld   b, $12
    inc  c
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
    ld   b, $00
    dec  c
    ld   b, $08
    rlca
    ld   de, label_110F
    rrca
    db   $10 ; Undefined instruction
    ld   a, [de]
    dec  b
    db   $3A ; ldd  a, [hl]
    dec  d
    inc  h
    dec  de
    jr   nc, label_C5C6B
    ld   c, h
    inc  sp
    ld   a, a
    nop
    ld   b, $00
    dec  c
    ld   b, $08
    rlca
    ld   de, label_110F
    rrca
    db   $10 ; Undefined instruction
    ld   [de], a
    dec  c
    ld   a, [de]
    dec  b

label_C5C70::
    inc  d
    dec  bc
    inc  d
    dec  bc
    dec  c
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    add  hl, bc
    ld   b, $12
    inc  c
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
    rlca

label_C5C89::
    nop
    ld   c, $07
    ld   c, $03
    ld   e, $03
    ld   hl, label_211F
    rra
    inc  a
    inc  bc
    rra
    ld   c, $0A
    dec  b
    inc  b
    inc  bc
    add  hl, bc
    ld   b, $0F
    nop
    nop
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

label_C5CAC::
    ld   b, b
    add  a, b
    jr   nc, label_C5C70
    adc  a, b
    ld   a, [$FF84]
    ld    hl, sp+$E4
    jr   label_C5C89
    ld   l, h
    adc  a, d
    ld   [hl], h
    and  $18
    add  a, [hl]
    ld   a, b
    db   $FC ; Undefined instruction
    nop
    inc  e
    nop
    db   $3A ; ldd  a, [hl]
    inc  e
    add  hl, sp
    ld   c, $79
    ld   c, $86
    ld   a, a
    add  a, $3F
    jr   nz, label_C5CED
    ld   [hl], b
    rrca
    ld   a, [hl]
    dec  a
    ldd  [hl], a
    dec  c
    ld   c, $01
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    jr   nz, label_C5CAC
    db   $10 ; Undefined instruction
    ld   [$88F0], sp
    ld   [hl], b
    db   $E8 ; add  sp, d
    ld   d, b
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    jr   label_C5D1A
    ld   e, $1D
    ld   [bc], a
    dec  b
    ld   [bc], a
    ld   b, $00
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    ld   b, $1F
    inc  c
    ccf
    nop
    ccf
    jr   label_C5D4C
    inc  e
    ccf
    ld   e, $1F
    inc  c
    ld   a, a
    inc  bc
    rst  $30
    ld   l, a
    rst  $30
    ld   l, a
    di
    ld   l, a

label_C5D1A::
    ld   sp, hl
    ld   h, a
    ld   h, h
    inc  bc
    inc  bc
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   l, b
    cp   $FC
    cp   $D4
    cp   $D4
    cp   $FC
    cp   $60
    cp   $1C
    rst  $38
    cp   [hl]
    rst  $38
    or   d
    rst  $18
    cp   [hl]
    xor  d
    call c, label_E01C
    ld   [rJOYP], a
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    ld   b, $1F
    inc  c
    ccf
    jr   label_C5D8A
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    ld   a, a
    ld   a, $7F
    ld   a, $FF
    ld   e, l
    rst  $38
    ld   h, e
    di
    ld   l, a
    ld   sp, hl
    ld   h, a
    ld   h, h
    inc  bc
    inc  bc
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   l, b
    cp   $FC
    cp   $D4
    cp   $D4
    cp   $FC
    cp   $60
    cp   $1C
    rst  $38
    cp   [hl]
    rst  $38
    or   d
    rst  $38
    or   d
    db   $BE
    cp   [hl]
    ld   a, [hli]
    call c, label_FC
    inc  bc
    nop
    rrca
    inc  bc
    ccf
    rrca
    ld   a, a
    ccf
    rst  $38
    ld   [hl], b

label_C5D8A::
    rst  $38
    ld   l, h
    ld   a, a
    ld   [de], a
    ccf
    ld   [de], a
    ccf
    inc  c
    ccf
    ld   de, label_3F7F
    ld   a, a
    scf
    ld   a, a
    ld   [hl], $5B
    ld   [hl], $2D
    ld   [de], a
    ld   d, $00
    nop
    nop
    inc  bc
    nop
    rrca
    inc  bc
    ccf
    rrca
    ld   a, a
    ccf
    rst  $38
    ld   [hl], b
    rst  $38
    ld   l, h
    ld   a, a
    ld   [de], a
    ld   a, a
    ld   [de], a
    rst  $38
    ld   l, l
    rst  $38
    ld   [hl], e
    cp   a
    ld   l, [hl]
    ld   d, a
    inc  l
    ld   a, [hli]
    inc  b
    ld   b, $00
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5DC7
    jr   label_C5DC9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5DD7
    jr   label_C5DD9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5DE7
    jr   label_C5DE9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5DF7
    jr   label_C5DF9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    nop
    inc  bc
    ld   bc, $0003
    rlca
    inc  bc
    ld   a, a
    rlca
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   e, a
    cp   a
    ld   a, a
    ld   c, a
    inc  sp
    ld   [hl], $0F
    rrca
    nop
    inc  b
    inc  bc
    ld   a, [bc]
    dec  b
    add  hl, bc
    ld   b, $0C
    inc  bc

label_C5E1E::
    rlca
    nop
    ld   h, b
    nop
    ld   a, [$FF60]
    ld    hl, sp+$B0
    db   $FC ; Undefined instruction
    ret  nc
    cp   $F4
    cp   $F8
    rst  $38
    ld   a, [$F8BF]
    ld   a, a
    cp   d
    cp   [hl]
    ld   a, b
    inc  [hl]
    ld    hl, sp+$74
    ld    hl, sp+$EA
    db   $F4 ; Undefined instruction
    db   $F2 ; Undefined instruction
    inc  c
    add  a, $F8
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rrca
    inc  bc
    rra
    dec  c
    rra
    rrca
    rla
    rrca
    dec  bc
    rlca
    dec  b
    ld   [bc], a
    rrca
    nop
    rla
    rrca
    jr   nz, label_C5E73
    ld   l, $11
    cpl
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_708], sp
    rlca
    nop
    nop
    nop
    add  a, b
    nop
    ld   a, [$FF80]
    rst  $38
    ret  nc
    rst  $38
    ld   a, [$FEFF]
    cp   [hl]
    ld   a, h
    ld   a, e
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, d
    rst  $30

label_C5E73::
    cp   b
    ld   h, a
    jp  c, label_D06E
    ld   a, $C4
    inc  l
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5E87
    jr   label_C5E89
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5E97
    jr   label_C5E99
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5EA7
    jr   label_C5EA9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5EB7
    jr   label_C5EB9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5EC7
    jr   label_C5EC9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5ED7
    jr   label_C5ED9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5EE7
    jr   label_C5EE9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C5EF7
    jr   label_C5EF9
    inc  h

label_C5EFB::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  e
    nop
    ld   a, $1C
    ld   a, a
    ld   a, $73
    ld   a, $33
    dec  e
    dec  e
    inc  bc
    inc  a
    dec  de
    ld   [hl], e
    inc  a
    ld   [hl], e
    ld   a, $7F
    ld   a, $3F
    inc  e
    rra
    nop
    inc  de
    inc  c
    add  hl, de

label_C5F1B::
    rlca
    inc  c
    inc  bc
    rlca
    nop
    inc  bc
    nop
    rlca
    inc  bc
    ld   b, $03

label_C5F26::
    ld   [hl], l
    ld   [bc], a
    rst  $38
    ld   [hl], c
    push hl
    ld   a, e
    db   $E4 ; Undefined instruction
    ld   a, e
    rst  $38
    ld   [hl], b

label_C5F30::
    ld   a, [hl]
    inc  bc
    ld   c, $07
    rrca
    rlca
    rla
    dec  bc
    inc  de
    inc  c
    add  hl, de
    rlca
    inc  c
    inc  bc
    rlca
    nop
    rra
    nop
    ld   a, $1F
    ld   a, [hl]
    dec  hl

label_C5F46::
    ld   a, [hl]
    dec  hl
    or   [hl]
    ld   a, a
    add  a, b
    ld   a, a
    add  a, c
    ld   a, [hl]
    cp   $01

label_C5F50::
    ld   a, [hl]
    ccf

label_C5F52::
    inc  a
    inc  bc
    inc  e
    rrca
    add  hl, sp
    ld   e, $38
    rra
    dec  l
    rra
    rla
    rrca
    ccf
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nz, label_C5F26
    db   $10 ; Undefined instruction
    ret  nc
    jr   nz, label_C5EFB
    ld   h, b
    db   $10 ; Undefined instruction
    jr   nz, label_C5F30
    inc  hl
    ret  nz
    ld   b, l
    add  a, d
    push af
    ld   [bc], a
    add  hl, bc
    or   $01
    cp   $F1
    cp   $6A
    sbc  a, h
    db   $FC ; Undefined instruction
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nz, label_C5F46
    db   $10 ; Undefined instruction
    ret  nc
    jr   nz, label_C5F1B
    ld   h, b
    db   $10 ; Undefined instruction
    jr   nz, label_C5F50
    jr   nz, label_C5F52
    ld   b, [hl]
    add  a, b
    ld   [label_1204], a
    db   $EC ; Undefined instruction
    inc  b
    ld    hl, sp+$CC
    ld    hl, sp+$F8
    ld   [hl], b
    db   $FC ; Undefined instruction
    nop
    inc  bc
    nop
    inc  e
    inc  bc
    ld   a, $01
    rrca
    inc  b
    rra
    rrca
    cpl
    dec  de
    ld   c, a
    dec  sp
    ld   b, b
    ccf
    ld   d, b
    cpl
    ld   c, a
    jr   nc, label_C5FD5
    rra
    rra
    nop
    dec  bc
    rlca
    dec  a
    inc  bc
    ld   [hl], a
    jr   c, label_C603D
    nop
    ret  nz
    nop
    ld   a, h
    add  a, b
    cp   $00
    ld   a, [$FF60]
    db   $E8 ; add  sp, d
    ld   a, [$FFE4]
    cp   b
    ldh  [$FF0C], a
    cp   h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [de], a
    db   $EC ; Undefined instruction
    ldh  [$FF0C], a
    inc  e
    inc  b

label_C5FD5::
    ld    hl, sp+$F8
    nop
    ret  c
    ld   [$FFAC], a
    ret  c
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
    di
    nop
    inc  a
    inc  bc
    ld   c, [hl]
    ld   sp, label_C7887
    cp   a
    halt
    nop
    db   $F2 ; Undefined instruction
    ld   a, l
    ld   a, a

label_C5FFF::
    nop
    nop
    nop
    dec  de
    nop
    dec  a
    dec  de
    ld   l, c
    scf
    ei
    and  h
    db   $FD ; Undefined instruction
    sub  a, e
    rst  $38
    db   $F2 ; Undefined instruction
    rra
    ld   [bc], a
    dec  a
    dec  de
    ld   [hl], a

label_C6013::
    inc  a
    ld   l, c
    ld   [hl], $76
    jr   nz, label_C6089
    jr   nz, label_C6013
    xor  b
    ld    hl, sp+$98
    ld   [hl], b
    ld   [hl], b
    nop
    nop
    nop
    nop
    dec  de
    nop
    dec  a
    dec  de
    ld   l, c
    scf
    db   $DB
    ld   h, h
    db   $FD ; Undefined instruction
    inc  de
    rst  $28
    ldh  [$FF0C], a
    rra
    ld   [bc], a
    dec  a
    dec  de
    ld   h, a
    inc  a
    reti
    ld   h, [hl]
    or   $40
    ld   [rLCDC], a
    ld   [rNR41], a
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    db   $E3 ; Undefined instruction
    nop
    or   $61
    rst  $38
    ld   [hl], b
    cp   a
    ld   [hl], d
    ld   e, a
    ldd  [hl], a
    ccf
    db   $10 ; Undefined instruction
    jr   label_C6092
    inc  e
    ccf
    rra
    dec  sp
    inc  e
    ld   [hl], h
    jr   c, label_C60AA
    jr   nc, label_C609C
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_C6064

label_C6064::
    ld   a, e
    jr   nc, label_C60E5
    add  hl, sp
    ld   e, a
    inc  [hl]
    ccf
    dec  d
    ccf
    ld   de, label_102F
    rra
    ld   [label_C1F], sp
    rra
    rrca
    dec  sp
    inc  e
    inc  h

label_C6079::
    jr   label_C609A

label_C607B::
    nop
    inc  bc
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   l, [hl]
    add  a, b
    cp   $0C
    cp   $1C
    ld   a, [$F43C]
    jr   c, label_C6079
    jr   nc, label_C607B
    ld   [hl], b
    db   $E8 ; add  sp, d
    ld   a, [$FF78]
    ld   a, [$FFBC]
    ld   a, b

label_C609A::
    call c, label_F838
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, $0003
    ld   b, $01
    rrca
    nop

label_C60AA::
    rrca
    ld   bc, label_30D
    dec  c
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    rlca
    ld   bc, $0106
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   b, $01
    rrca
    nop
    rrca
    nop
    rrca
    inc  b
    rrca
    nop
    rra
    inc  bc
    dec  [hl]
    dec  de
    ld   h, $19
    dec  e
    ld   [bc], a
    inc  b
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

label_C60E5::
    nop
    ret  nz
    nop
    ld   h, b
    add  a, b
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FFC0]
    ld   a, [$FF00]
    ld   a, b
    sub  a, b
    rst  $38
    ld   a, [$FFFF]
    or   $ED
    ld   a, [hl]
    cp   d
    ld   a, h
    call nz, label_F838
    nop
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6107
    jr   label_C6109
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6117
    jr   label_C6119
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    ld   bc, label_300
    ld   bc, label_1E3
    rst  $30
    ld   h, b
    rst  $38
    ld   [hl], h
    ld   a, l
    dec  hl

label_C612E::
    ld   a, b
    daa
    di
    ld   l, h
    rst  $30
    ld   l, c
    ld   [hl], a
    jr   z, label_C612E
    ld   l, b
    di
    adc  a, h
    ld    hl, sp+$E7
    ld   [hl], a
    ld   a, b
    rrca
    rrca
    nop
    nop
    rlca
    rlca
    rra
    inc  e
    ccf
    ld   sp, label_C677F
    ld   a, a
    ld   l, [hl]
    rst  $38
    call z, label_CDFF
    rst  $38
    ld   h, a
    rst  $38
    ld   [hl], e
    rst  $38
    cp   b
    rst  $38
    sbc  a, a
    ld   a, a
    ld   b, a
    ccf
    jr   nc, label_C616C
    rrca
    nop
    nop
    ld   bc, label_300
    ld   bc, label_1E3
    rst  $30
    ld   h, b
    rst  $38
    ld   [hl], b
    ld   a, a
    inc  l

label_C616C::
    ld   a, a
    ld   l, $FF
    ld   l, e
    rst  $38
    ld   l, b
    ld   a, c
    daa
    di
    ld   l, h
    db   $F4 ; Undefined instruction
    ld   c, e
    pop  af
    adc  a, [hl]
    rst  $38
    pop  af
    ccf
    ccf
    rlca
    rlca
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6187
    jr   label_C6189
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6197
    jr   label_C6199
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C61A7
    jr   label_C61A9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C61B7
    jr   label_C61B9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C61C7
    jr   label_C61C9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C61D7
    jr   label_C61D9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C61E7
    jr   label_C61E9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C61F7
    jr   label_C61F9
    inc  h
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
    rlca
    nop
    rrca
    rlca
    rla
    ld   [label_817], sp
    rla
    ld   [label_30C], sp
    dec  bc
    rlca
    add  hl, bc
    rlca
    rlca
    inc  bc
    rlca
    inc  bc
    dec  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    rlca
    nop
    rrca
    rlca
    rra
    rrca
    rst  $18
    rrca
    ei
    adc  a, [hl]
    rst  $30
    jp   z, label_C63FF
    rst  $38
    ld   hl, $B07F
    ld   e, a
    cp   h
    rst  $28
    inc  e
    cp   [hl]
    ld   b, e
    sbc  a, a
    ld   a, h
    ld   a, a
    add  a, c
    ld   e, [hl]
    cp   a
    rst  $38
    nop
    ld    hl, sp+$00
    db   $FD ; Undefined instruction
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $B7
    ld   a, d
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   [hl], $FF
    cp   $FF
    call z, label_F8FF
    rst  $38
    ld   c, d
    db   $FD ; Undefined instruction
    ld   b, $BB
    db   $EC ; Undefined instruction
    ld   e, a
    or   b
    ldh  [$FF0C], a
    inc  e
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   [hl], b
    db   $F4 ; Undefined instruction
    jr   label_C62A3
    ret  z
    db   $FC ; Undefined instruction
    ld   [label_8FC], sp
    db   $F4 ; Undefined instruction
    jr   label_C62D7
    or   b
    ld   d, b
    ld   [$FFF0], a
    nop
    ld   h, b
    ret  nz
    ld   h, b
    ret  nz
    ld   h, b
    ret  nz
    and  b
    ld   b, b
    ret  nz
    nop
    nop
    nop
    rlca
    nop
    ld   c, $07
    rrca
    rlca
    rrca
    rlca
    ld   [label_407], sp
    inc  bc
    inc  bc
    nop
    inc  bc
    nop
    rlca
    nop
    rrca
    rlca
    ld   e, $09
    rla
    ld   [label_51F], sp
    ld   a, $0B
    ld   a, [hl]
    scf
    ld   a, a
    nop
    inc  a
    inc  bc
    call c, label_C573B
    cp   h
    ld   e, e
    or   a
    ld   c, l
    cp   e
    rst  $30
    dec  c
    rlc  a
    rst  0
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF80]
    ld   a, b
    ret  nz
    ld    hl, sp+$40
    or   h
    ld   c, b
    ld   c, h
    or   b
    ld    hl, sp+$00
    ld   a, [$FF00]
    rst  $38
    ld   [hl], b
    cp   a
    sub  a, $7D
    or   [hl]

label_C62C8::
    rst  $30
    ld   l, b
    ld   sp, hl
    ld   b, b
    jp   label_8F80
    nop
    rra
    ld   bc, label_31E
    scf
    ld   a, [bc]
    add  hl, sp

label_C62D7::
    ld   b, $1E
    ld   bc, $0007
    nop
    nop
    nop
    nop
    ld   [hl], b
    nop
    cp   b
    ld   [hl], b
    ld   a, b
    ld   a, [$FF78]
    ld   a, [$FF08]
    ld   a, [$FF90]
    ld   h, b
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nc
    ld   [$FFE8], a
    db   $10 ; Undefined instruction
    and  b
    db   $FC ; Undefined instruction
    ret  nc
    ld   a, [hl]
    db   $EC ; Undefined instruction
    cp   $00
    nop
    nop
    nop
    nop
    rrca
    nop
    scf
    rrca
    ld   e, a

label_C6305::
    ccf
    ld   a, a
    jr   nc, label_C62C8
    ld   h, a
    cp   a
    ld   l, c
    cp   a
    ld   l, c
    or   a
    ld   l, l
    cp   e
    ld   h, [hl]
    cp   [hl]
    ld   h, e
    cp   a
    ld   h, e
    ld   a, a
    ldd  [hl], a
    ld   e, a
    jr   c, label_C634A
    rra
    db   $10 ; Undefined instruction
    rrca
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0103
    dec  b
    inc  bc
    rlca
    inc  bc
    dec  de
    rlca
    ld   l, $17
    dec  l
    ld   d, $6F
    jr   label_C62E6
    ld   l, [hl]
    sbc  a, $30
    ld   a, [$BA5C]
    ld   a, h
    ld   b, h
    jr   c, label_C6377
    nop
    ld   c, $00
    ld   e, $0C
    ld   l, $1C
    db   $3A ; ldd  a, [hl]
    inc  e
    ld   e, h
    jr   c, label_C63BF
    jr   c, label_C6305
    ld   [hl], b
    db   $E8 ; add  sp, d
    ld   [hl], b
    ld   [hl], b
    ld   [$FFD0], a
    ld   [$FFE0], a
    ret  nz
    and  b
    ret  nz
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    ld   c, $00
    dec  [hl]
    ld   c, $5E
    ccf
    ld   a, a
    ccf
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    cp   a
    ld   a, a
    cp   a
    ld   a, a
    ld   a, a
    ccf
    ld   e, a
    ccf
    cpl

label_C6377::
    rra
    dec  de
    rlca
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
    add  a, b
    nop
    ld   b, b

label_C6387::
    add  a, b
    and  b
    ret  nz
    ret  c
    ld   [$FFF7], a
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
    ld   a, l
    cp   $FE
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, label_305
    dec  bc
    rlca
    scf
    rrca
    rst  $18
    ccf
    cp   $FF
    db   $FD ; Undefined instruction
    cp   $FA
    db   $FC ; Undefined instruction
    db   $F4 ; Undefined instruction
    ld    hl, sp+$D8
    ld   [$FF60], a
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop

label_C63BF::
    nop
    ld   d, [hl]
    inc  a
    halt
    ld   l, [hl]
    inc  a
    ld   l, d
    inc  a
    ld   l, h
    jr   c, label_C6387
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    db   $F4 ; Undefined instruction
    ld   a, b
    ld   a, b
    ld   a, [$FFE8]
    ld   a, [$FFF0]
    ld   [$FFD0], a
    ld   [$FFE0], a
    ret  nz
    and  b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    ld   bc, $0100
    ld   bc, $0100
    inc  b
    inc  bc
    ld   b, $07
    ld   [de], a
    rlca
    ld   [de], a
    rra
    ld   a, [bc]
    rra
    ld   a, [bc]
    rra
    ld   a, [bc]
    rra
    ld   a, [bc]
    cpl
    ld   a, [de]
    ccf
    ld   a, [de]
    dec  sp
    ld   d, $3F
    ld   d, $3D

label_C63FF::
    ld   d, $06
    nop
    rrca
    ld   b, $0F
    ld   b, $1F
    ld   b, $2F
    ld   d, $2F
    ld   d, $4F
    ld   [hl], $4B
    ld   [hl], $77
    dec  sp
    ld   [hl], l
    dec  sp
    ld   b, e
    inc  a
    ld   hl, label_391F
    rra
    jr   label_C642B
    inc  c
    inc  bc
    inc  bc
    nop
    ld   [bc], a
    ld   bc, $013A
    ld   b, [hl]
    add  hl, sp
    sbc  a, [hl]
    ld   h, c
    and  d
    ld   e, l
    adc  a, [hl]

label_C642B::
    ld   [hl], c
    sub  a, d
    ld   h, c
    ld   h, d
    ld   bc, $0102
    db   $3A ; ldd  a, [hl]
    ld   bc, label_3946
    sbc  a, [hl]
    ld   h, c
    and  d
    ld   e, l
    adc  a, [hl]
    ld   [hl], c
    sub  a, d
    ld   h, c
    ld   h, d
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
    ld   b, $00
    rrca
    ld   b, $0F
    ld   b, $1F
    ld   b, $2F
    ld   d, $2F
    ld   d, $4F
    ld   [hl], $4B
    ld   [hl], $77
    dec  sp
    ld   [hl], l
    dec  sp
    ld   b, e
    inc  a
    ld   hl, label_391F
    rra
    jr   label_C647B
    inc  c
    inc  bc
    inc  bc
    nop
    ld   [bc], a
    ld   bc, $013A
    ld   b, [hl]
    add  hl, sp
    sbc  a, [hl]
    ld   h, c
    and  d
    ld   e, l
    adc  a, [hl]

label_C647B::
    ld   [hl], c
    sub  a, d
    ld   h, c
    ld   h, d
    ld   bc, $0000
    nop
    nop
    ld   [hl], b
    nop
    db   $E8 ; add  sp, d
    ld   [hl], b
    cp   h
    ld   a, b
    xor  $1C
    sub  a, a
    ld   l, [hl]
    adc  a, e
    halt
    dec  sp
    ld   [hl], l
    dec  sp
    ld   b, e
    inc  a
    ld   hl, label_391F
    rra
    jr   label_C64AB
    inc  c
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    ld   a, $3F
    ld   h, l
    ld   a, [hl]
    ld   e, e
    ld   h, h
    xor  [hl]
    pop  de
    and  l

label_C64AB::
    db   $DB
    res  7, a
    rst  $18
    cp   e
    rst  $18
    cp   c
    rst  8
    cp   c
    and  a
    db   $B3
    or   e
    rst  8
    ld   e, h
    ld   h, e
    ld   h, a
    ld   a, b
    jr   c, label_C64FD
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    dec  c
    dec  c
    ld   a, [de]
    rra
    dec  d
    ld   a, [de]
    ld   [hl], $39
    add  hl, hl
    scf
    dec  hl
    scf
    dec  hl
    scf
    add  hl, hl
    scf
    ld   [hl], $39
    add  hl, de
    ld   e, $0E
    rrca
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
    nop
    inc  bc
    inc  bc
    ld   b, $07
    dec  b
    ld   b, $0A
    dec  c
    ld   a, [bc]
    dec  c
    dec  c
    ld   c, $06
    rlca
    inc  bc
    inc  bc
    nop
    nop
    nop

label_C64FD::
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    ret  nz
    cp   a
    ret  nz
    cp   a
    add  a, [hl]
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    di
    call z, label_D3EC
    ld   [$FFDF], a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ld   h, h
    ld   a, a
    inc  [hl]
    dec  sp
    jr   label_C653D
    rrca
    rrca
    rst  $38
    rst  $38
    rst  8
    jr   nc, label_C6555
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    pop  af
    ld   c, $0E
    pop  af
    nop
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    adc  a, h

label_C653D::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    ret  nz
    cp   a
    ret  nz
    cp   a
    add  a, a
    rst  $38
    db   $FD ; Undefined instruction
    cp   $C2
    db   $FD ; Undefined instruction
    di
    call label_D3EC
    ld   [$FFDF], a
    ret  nz

label_C6555::
    rst  $38
    ret  nz
    rst  $38
    ld   h, h
    ld   a, a
    inc  [hl]
    ccf
    ld   a, [de]
    rra
    rrca
    rrca
    rst  $38
    rst  $38
    rst  8
    jr   nc, label_C65D5
    adc  a, a
    ld    hl, sp+$FF
    halt
    adc  a, l
    ld   [hl], e
    db   $F2 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $1E
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    ld   a, a
    ret
    rst  $38
    rst  $18
    ld   [rIE], a
    inc  c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    or   $69
    ld   [$FF1F], a
    ret  nz
    ccf
    db   $ED ; Undefined instruction
    ld   d, e
    rst  $28
    ld   d, h
    rst  8
    scf
    swap [hl]
    rst  $20
    ld   e, b
    ld   [$FF5F], a
    jp   label_E03C
    rra
    or   $69
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    or   $69
    ld   [$FF1F], a
    jp   label_E53C
    ld   e, e
    rst  $20
    ld   e, e
    rst  0
    db   $3A ; ldd  a, [hl]
    push bc
    db   $3A ; ldd  a, [hl]
    db   $E3 ; Undefined instruction
    ld   e, h
    ld   [$FF5F], a
    pop  bc
    ld   a, $E0
    rra
    or   $69
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    rrca
    add  hl, bc
    ccf
    jr   label_C6644
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

label_C65D5::
    inc  e
    rst  $38
    sbc  a, $7F
    ld   c, a
    ld   a, a
    inc  bc
    ccf
    jr   label_C65EE
    add  hl, bc
    ld   a, a
    ld   a, a
    ld   c, a
    ld   [hl], b
    ld   b, a
    ld   a, b
    jr   nz, label_C6627
    rra
    rra
    jr   nz, label_C662B
    ld   b, e
    ld   a, h

label_C65EE::
    ld   b, e
    ld   a, h
    add  a, c
    cp   $80
    rst  $38
    and  e
    rst  $38
    jp   nc, label_9EFF
    rst  $38
    ld   b, b
    ld   a, a
    jr   nz, label_C663D
    rra
    rra
    nop
    nop
    ccf
    ccf
    ld   hl, label_213E
    ld   a, $21
    ld   a, $21
    ld   a, $3F
    jr   nz, label_C664E
    jr   nz, label_C6632
    ld   a, $21
    ld   a, $21
    ld   a, $21
    ld   a, $3F
    ccf
    ccf
    ccf
    nop
    nop
    nop
    nop
    ld   bc, label_201
    inc  bc
    inc  b
    rlca
    ld   [label_1C0F], sp
    inc  de
    ld   h, $39
    ld   b, e
    ld   a, h
    add  a, c
    cp   $C3
    db   $FC ; Undefined instruction

label_C6632::
    ld   h, [hl]
    ld   a, c
    inc  a
    inc  sp
    inc  e
    dec  de
    inc  c
    rrca
    ld   b, $07
    inc  bc

label_C663D::
    inc  bc
    ld   bc, label_301
    nop
    ld   [bc], a
    ld   bc, $0003
    ld   [bc], a
    ld   bc, $010F
    dec  de
    dec  c
    ld   l, $11

label_C664E::
    ld   e, d
    ld   hl, label_C41B2
    and  d
    ld   b, c
    and  d
    ld   b, c
    and  d
    ld   b, c
    cp   [hl]
    ld   b, c
    add  a, a
    ld   a, l
    cp   $01
    ld   a, a
    nop
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ccf
    ccf
    ld   a, a
    ld   b, b
    rst  $28
    sbc  a, a
    ret  nc
    cp   a
    ld   [$FFBF], a
    ld   [$FFBF], a
    ld   [$FFBF], a
    ret  nc
    cp   a
    rst  $28
    sbc  a, a
    cp   a
    ret  nz
    sbc  a, a
    ld   [$FFC0], a
    rst  $38
    ld   h, b
    ld   a, a
    ccf
    ccf
    inc  hl
    inc  a
    daa
    jr   c, label_C66C8
    jr   c, label_C66C6
    inc  a
    inc  sp
    inc  a
    inc  l
    ccf
    dec  hl
    scf
    daa
    jr   c, label_C66D0
    inc  a
    daa
    jr   c, label_C66D8
    jr   c, label_C66D6
    inc  a
    inc  sp
    inc  a
    inc  l
    ccf
    dec  hl
    scf
    daa
    jr   c, label_C66E0
    inc  a
    daa
    jr   c, label_C66E8
    jr   c, label_C66E6
    inc  a
    inc  sp
    inc  a

label_C66C6::
    inc  l
    ccf

label_C66C8::
    daa
    dec  sp
    ld   h, e
    ld   a, h
    and  e
    db   $FC ; Undefined instruction
    and  a
    ld    hl, sp+$A7
    ld    hl, sp+$B3
    call c, label_CFBC

label_C66D6::
    sbc  a, e
    rst  $20

label_C66D8::
    adc  a, a
    ld   a, [$FFC0]
    rst  $38
    ld   h, b
    ld   a, a
    ccf
    ccf

label_C66E0::
    inc  bc
    nop
    rrca
    nop
    rra
    nop

label_C66E6::
    ld   a, $01

label_C66E8::
    dec  a
    inc  bc
    ld   a, l
    inc  bc
    ld   a, [hl]
    ld   bc, label_205F
    ld   e, a
    jr   nz, label_C6742
    jr   nc, label_C6718
    inc  e
    jr   nz, label_C6717
    db   $10 ; Undefined instruction
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_700
    nop
    rrca
    nop
    rra
    dec  c
    rra
    rrca
    ccf
    ld   a, [bc]
    ccf
    rra
    ld   a, a
    dec  sp
    ld   a, a
    inc  b
    ccf
    rra
    rra

label_C6717::
    nop

label_C6718::
    rra
    inc  b
    ccf
    ld   d, $3F
    ld   b, $07
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$10
    ld    hl, sp+$90
    ld    hl, sp+$C0
    db   $FC ; Undefined instruction
    ret  nz
    cp   $C0
    sbc  a, $E0
    sub  a, $68
    or   [hl]
    ret  z
    db   $EC ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   b, b
    xor  $DC
    cp   $C0
    ret  nz
    nop
    nop
    nop

label_C6742::
    inc  bc
    nop
    rlca
    nop
    rrca
    ld   [bc], a
    rrca
    ld   [bc], a
    ccf
    ld   [label_307F], sp
    ld   a, a
    jr   nc, label_C67A0
    jr   nc, label_C6792
    nop
    ccf
    nop
    ld   l, a
    jr   nc, label_C67D8
    jr   nz, label_C67DA
    inc  [hl]
    dec  sp
    rlca
    rlca
    nop
    nop
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $3A ; ldd  a, [hl]
    call nz, label_EC12
    sub  a, [hl]
    ld   l, b
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    sbc  a, b
    db   $FC ; Undefined instruction

label_C677F::
    nop
    ld   c, $00
    rra
    ld   c, $3F
    ld   b, $3F
    nop
    ld   a, a
    dec  c
    ld   a, a
    rrca
    ld   a, a
    ld   a, [bc]
    ccf
    rra
    ld   a, a
    dec  sp

label_C6792::
    ld   a, a
    inc  b
    ccf
    rra
    rra
    nop
    rra
    nop
    scf
    jr   label_C67DC
    nop
    ld   bc, label_1C00
    nop
    ld   a, $1C
    ld   a, a
    inc  c
    rst  $38
    nop
    rst  $38
    dec  c
    rst  $38
    rrca
    ld   a, a
    ld   a, [bc]
    ccf
    rra
    ld   a, a
    dec  sp
    ld   a, a
    inc  b
    ccf
    rra
    rra
    nop
    rra
    nop
    scf
    jr   label_C67FC
    nop
    ld   bc, label_300
    nop
    ld   l, a
    nop
    rst  $38
    ld   l, l
    rst  $38
    ld   c, d
    rst  $38
    ld   e, a
    rst  $38
    dec  sp
    ld   a, a
    inc  b
    ld   e, a
    ccf
    cpl
    rra
    rra
    nop
    inc  de
    inc  c
    jr   label_C67DF

label_C67D8::
    rrca
    nop

label_C67DA::
    rlca
    nop

label_C67DC::
    inc  bc
    ld   bc, $0001
    ret  nz
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    cp   b
    cp   $B8
    cp   $88
    cp   $C0
    cp   $60
    sbc  a, $E0
    db   $FC ; Undefined instruction
    add  a, b
    db   $FC ; Undefined instruction
    nop
    ld   e, $E0
    ld   e, $E0
    rst  $38
    inc  b
    rst  $38
    ld   c, $CF
    add  a, [hl]
    add  a, $00
    inc  e
    nop
    ld   a, $1C
    ld   a, a
    ld   a, $73
    ld   a, $33
    dec  e
    dec  e
    inc  bc
    inc  a
    dec  de
    ld   [hl], e
    inc  a
    ld   [hl], e
    ld   a, $7F
    ld   a, $3F
    inc  e
    rra
    nop
    inc  de
    inc  c
    add  hl, de
    rlca
    inc  c
    inc  bc
    rlca
    nop
    inc  bc
    nop
    rlca
    inc  bc
    ld   b, $03
    ld   [hl], l
    ld   [bc], a
    rst  $38
    ld   [hl], c
    push hl
    ld   a, e
    db   $E4 ; Undefined instruction
    ld   a, e
    rst  $38
    ld   [hl], b
    ld   a, [hl]
    inc  bc
    ld   c, $07
    rrca
    rlca
    rla
    dec  bc
    inc  de
    inc  c
    add  hl, de
    rlca
    inc  c
    inc  bc
    rlca
    nop
    inc  bc
    nop
    ld   [bc], a
    ld   bc, $0003
    ld   [bc], a
    ld   bc, $010F
    dec  de
    dec  c
    ld   l, $11
    ld   e, d
    ld   hl, label_C41B2
    and  d
    ld   b, c
    and  d
    ld   b, c
    and  d
    ld   b, c
    cp   [hl]
    ld   b, c
    add  a, a
    ld   a, l
    cp   $01
    ld   a, a
    nop
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6887
    jr   label_C6889
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6897
    jr   label_C6899
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    nop
    inc  e
    inc  bc
    ld   a, $01
    rrca
    inc  b
    rra
    rrca
    cpl
    dec  de
    ld   c, a
    dec  sp
    ld   b, b
    ccf
    ld   d, b
    cpl
    ld   c, a
    jr   nc, label_C68D5
    rra
    rra
    nop
    dec  bc
    rlca
    dec  a
    inc  bc
    ld   [hl], a
    jr   c, label_C693D
    nop
    ret  nz
    nop
    ld   a, h
    add  a, b
    cp   $00
    ld   a, [$FF60]
    db   $E8 ; add  sp, d
    ld   a, [$FFE4]
    cp   b
    ldh  [$FF0C], a
    cp   h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [de], a
    db   $EC ; Undefined instruction
    ldh  [$FF0C], a
    inc  e
    inc  b

label_C68D5::
    ld    hl, sp+$F8
    nop
    ret  c
    ld   [$FFAC], a
    ret  c
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
    di
    nop
    inc  a
    inc  bc
    ld   c, [hl]
    ld   sp, label_C7887
    cp   a
    halt
    nop
    db   $F2 ; Undefined instruction
    ld   a, l
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
    rlca
    nop
    rrca
    rlca
    dec  c
    inc  bc
    rrca
    rlca
    rra
    inc  bc
    rra
    ld   [$001F], sp
    ccf
    db   $10 ; Undefined instruction
    ld   c, $7F
    rra
    rst  $38
    rra
    rst  $38
    inc  hl
    rst  $38
    scf
    rst  $38
    ld   [hl], $FF

label_C693D::
    ld   bc, label_C5FFF
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld    hl, sp+$BE
    call z, label_F4FE
    cp   $84
    cp   $34
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    ld   b, b
    cp   $00
    rst  $38
    add  a, b
    rst  $38
    jp   label_C6FF
    rst  $38
    add  a, $FF
    add  a, [hl]
    rst  $38
    ld   b, $0F
    nop
    rra
    nop
    rra
    nop
    rra
    inc  c
    rra
    ld   c, $1F
    inc  c
    rra
    ld   c, $0F
    ld   b, $07
    nop
    inc  bc
    nop
    rrca
    nop
    rra
    rrca
    ccf
    rra
    ccf
    dec  d
    ccf
    nop
    nop
    nop
    rst  $38
    ld   h, b
    rst  $38
    ld   h, b
    rst  $38
    rst  $38
    rst  $38
    adc  a, a
    db   $D3 ; Undefined instruction
    xor  a
    db   $FC ; Undefined instruction
    adc  a, a
    cp   a
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    rst  $18
    ld   a, a
    rst  8
    ld   a, a
    ld   [hl], b
    cp   a
    cp   a
    rst  $18
    rst  $18
    ld   [rIE], a
    nop
    nop
    nop
    ld   [hl], e
    nop
    ld   e, a
    inc  sp
    inc  l
    dec  de
    scf
    inc  c
    ld   l, e
    ld   [hl], $7D
    inc  hl
    halt
    ld   e, a
    jr   nc, label_C6A20
    inc  e
    ld   e, e
    daa
    ld   c, a
    jr   c, label_C6A06
    ccf
    ld   c, a
    ccf
    daa
    rra
    jr   label_C69C5
    rlca
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    jr   c, label_C69B6
    db   $EC ; Undefined instruction
    jr   label_C6A3F
    adc  a, h
    cp   [hl]
    ld   b, h
    cp   [hl]
    ld   b, h
    ld   a, [$F60C]
    jr   c, label_C69AD
    db   $E4 ; Undefined instruction
    ld   a, [$FA14]
    call nz, label_FCF2
    db   $E4 ; Undefined instruction
    ld    hl, sp+$18
    ld   [$FFE0], a
    nop
    inc  a
    inc  a
    rst  $20
    rst  $20
    sbc  a, c
    db   $DB
    sub  a, c
    rst  $30
    ld   d, d
    ld   a, [hl]
    inc  h
    inc  a
    inc  a
    inc  a
    ld   a, [hl]
    ld   b, d
    rst  $20
    add  a, c
    rst  $38
    db   $DB
    rst  $20
    and  l
    rst  $20
    add  a, c
    rst  $38
    db   $DB
    rst  $38
    and  l
    ld   a, [hl]
    ld   b, d
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    ld   e, $00

label_C6A06::
    ld   hl, label_C5E1E
    ld   hl, label_215E
    ld   e, [hl]
    ld   hl, label_1E6D
    ld   a, a
    nop
    ld   e, [hl]
    ld   hl, label_3F4C
    ld   l, l
    ld   e, $7F
    nop
    ld   e, [hl]
    ld   hl, label_1E2D
    ld   e, $00

label_C6A20::
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  0
    ld   a, [hl]
    jp   label_C3FE
    cp   $FE
    inc  a
    cp   h
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
    add  a, b
    nop
    nop
    nop
    nop

label_C6A3F::
    nop
    nop
    nop
    nop
    nop
    jr   c, label_C6A7E
    inc  l
    inc  [hl]
    cpl
    inc  sp
    rst  $20
    ld    hl, sp+$B8
    rst  $18
    cp   a
    rst  0
    ld   e, a
    ld   h, b
    ld   l, $31
    rst  $38
    rst  $38
    cp   a
    ret  nz
    sbc  a, a
    ld   [rLCDC], a
    ld   a, a
    jr   nc, label_C6A9D
    rrca
    rrca
    inc  e
    inc  e
    ld   a, $22
    scf
    add  hl, sp
    rra
    add  hl, de
    rst  $28
    rst  $38
    xor  d
    ld   a, [hl]
    ld   [$DEDE], a
    ldd  [hl], a
    cp   d
    ld   h, [hl]
    ld   a, [$F4C6]
    inc  c
    db   $E4 ; Undefined instruction
    inc  e
    adc  a, b
    ld   a, b
    db   $10 ; Undefined instruction
    ld   h, b
    ld   [$FF80], a
    add  a, b
    ld   a, h
    ld   a, h
    cp   $82
    ld   a, [hl]
    ld   a, d
    inc  e
    inc  d
    jr   c, label_C6AB2
    ld   a, h
    ld   e, h
    cp   $82
    ld   a, h
    ld   a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C6A9D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C6AB2::
    rrca
    nop
    scf
    rrca
    ld   l, a
    ccf
    rst  $18
    ld   a, a
    rst  0
    ld   a, a
    rst  8
    ld   a, a
    rst  $18
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
    nop
    ld   [rJOYP], a
    ret  c
    ld   [$FFE4], a
    ld    hl, sp+$F2
    db   $FC ; Undefined instruction
    db   $F2 ; Undefined instruction
    db   $FC ; Undefined instruction
    and  $FC
    adc  a, [hl]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6AE7
    jr   label_C6AE9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6AF7
    jr   label_C6AF9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    nop
    dec  b
    inc  bc
    dec  b
    ld   [bc], a
    inc  bc
    nop
    inc  c
    inc  bc
    ld   de, label_2F0F
    dec  d
    ld   e, a
    dec  l
    ld   a, a
    dec  l
    cp   a
    ld   h, b
    or   c
    ld   c, [hl]
    db   $ED ; Undefined instruction
    ld   [de], a
    adc  a, h
    ld   [hl], e
    pop  hl
    ld   e, $6D
    ld   [de], a
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
    add  a, $00
    xor  $44
    cp   $6C
    ld   a, h
    jr   z, label_C6B69
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [hl], l
    rst  $38
    ld   h, b
    ei
    rlca
    sbc  a, b
    ld   h, a
    sbc  a, a
    ld   h, b
    ld   c, a
    jr   nc, label_C6BA0
    ld   [hl], $2B
    ld   d, $15
    dec  bc
    dec  de
    inc  c
    daa
    rra
    ld   a, b
    rlca
    rst  $30
    ld   a, b
    rst  $38
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    and  b
    db   $FC ; Undefined instruction
    and  b
    ld   a, [hl]

label_C6B69::
    ld   a, [$FF7E]
    sub  a, h
    cp   $1C
    ld   a, [$FC3C]
    ld   a, b
    ld   a, [$B974]
    add  a, $FD
    ld   a, [de]
    cp   [hl]
    ret  c
    ld   e, $E0
    rst  $28
    ld   e, $FF
    nop
    jr   nc, label_C6B82

label_C6B82::
    ld   c, b
    jr   nc, label_C6BCD
    jr   nc, label_C6BD3
    jr   nc, label_C6BDB
    inc  l
    ld   d, d
    inc  l
    ld   b, d
    inc  a
    ld   b, h
    jr   c, label_C6BD9
    jr   nc, label_C6BDB
    jr   nc, label_C6BDD
    jr   nc, label_C6BDF
    jr   nc, label_C6BE1
    jr   nc, label_C6BE3
    jr   nc, label_C6BE5
    jr   nc, label_C6BCF
    nop

label_C6BA0::
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    ld   [de], a
    inc  c
    ld   de, label_C0E
    inc  bc
    ld   [de], a
    dec  c
    db   $10 ; Undefined instruction
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
    add  a, b

label_C6BCD::
    nop
    ld   b, b

label_C6BCF::
    add  a, b
    jr   nz, label_C6B92
    db   $10 ; Undefined instruction
    adc  a, b
    ld   [hl], b
    ld   b, h
    jr   c, label_C6BFB

label_C6BD9::
    inc  e
    ld   [de], a

label_C6BDB::
    inc  c
    inc  c

label_C6BDD::
    nop
    nop

label_C6BDF::
    nop
    nop

label_C6BE1::
    rst  $38
    nop

label_C6BE3::
    rst  $38
    inc  h

label_C6BE5::
    rst  $38
    jr   label_C6BE7
    jr   label_C6BE9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C6BF7
    jr   label_C6BF9
    inc  h

label_C6BFB::
    rst  $38

label_C6BFC::
    nop
    rst  $38
    nop
    rst  $38
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
    jr   z, label_C6C68
    scf
    jr   c, label_C6C27
    ccf
    db   $10 ; Undefined instruction
    ld   [label_277F], sp
    ld   [hl], a
    jr   z, label_C6C4C
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

label_C6C27::
    ld   [$FFFE], a
    or   h
    cp   $B4
    db   $3A ; ldd  a, [hl]

label_C6C2D::
    db   $FC ; Undefined instruction
    inc  a
    ret  z
    db   $FC ; Undefined instruction
    jr   label_C6C2D
    inc  [hl]
    db   $F2 ; Undefined instruction
    call z, label_34FA
    db   $FC ; Undefined instruction
    or   b
    jr   c, label_C6BFC
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    rlca
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    jr   nz, label_C6CCA
    jr   nz, label_C6CAC
    jr   nz, label_C6C8E
    db   $10 ; Undefined instruction
    jr   label_C6CD2
    inc  l
    ld   a, a
    inc  hl
    inc  sp
    inc  c
    ld   d, $0F
    ccf
    ld   bc, label_E3F
    rra
    nop
    or   b
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop

label_C6C68::
    cp   $04
    cp   $04
    ld   a, [$FC04]
    ld   [label_18F4], sp
    db   $E8 ; add  sp, d
    jr   nc, label_C6C71
    ret  nz
    adc  a, $34
    ld   l, $F4
    call c, label_FCE0
    nop
    ld    hl, sp+$00
    dec  hl
    nop
    ccf
    nop
    ccf
    nop
    rra
    rrca
    ccf
    dec  d
    ccf
    dec  b
    ld   e, e
    ccf

label_C6C8E::
    ld   b, e
    inc  a
    ld   a, a
    nop
    ccf
    ld   bc, label_F17
    rrca
    nop
    ld   de, label_1F0E

label_C6C9B::
    nop
    dec  bc
    rlca
    rra

label_C6C9F::
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    ret  c

label_C6CAC::
    db   $F4 ; Undefined instruction
    ld    hl, sp+$F8
    ld   [hl], b
    ld    hl, sp+$F0
    ld    hl, sp+$E0
    db   $E4 ; Undefined instruction
    jr   label_C6C9B
    ret  c
    db   $E4 ; Undefined instruction
    ret  c
    ld    hl, sp+$00
    ret  nc
    ld   [$FFF8], a
    nop
    nop
    nop
    dec  hl
    nop
    ccf
    nop
    ccf
    nop
    rra
    rrca

label_C6CCA::
    ccf
    dec  d
    ccf
    dec  b
    ld   e, e
    ccf
    ld   b, e
    inc  a

label_C6CD2::
    ld   a, a

label_C6CD3::
    nop
    ccf
    nop
    rla
    dec  c
    rrca
    ld   bc, $001F
    dec  a
    ld   e, $3F
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    ret  c
    db   $F4 ; Undefined instruction
    ld    hl, sp+$F8
    ld   [hl], b
    ld    hl, sp+$E0
    db   $E4 ; Undefined instruction
    jr   label_C6CBB
    cp   b
    call nz, label_FEB8
    inc  b
    cp   $7C
    cp   $00
    rlca
    nop
    rrca
    nop
    rrca
    ld   b, $1F
    ld   c, $1F
    inc  c
    dec  e
    ld   [bc], a
    rra
    inc  bc
    rra
    inc  bc
    rra
    inc  bc
    rra
    ld   [bc], a
    rra
    inc  bc
    ccf
    ld   bc, label_307F
    ld   e, h
    dec  sp
    ld   l, a
    jr   label_C6D5B
    nop
    cp   h
    nop
    cp   $00
    cp   $60
    cp   $E0
    ld    hl, sp+$A0
    db   $FC ; Undefined instruction
    and  b
    cp   $EC
    cp   $FC
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    ld   h, b
    rst  $38
    add  a, $FF
    add  a, d
    cp   $0C
    db   $3A ; ldd  a, [hl]
    call c, label_18F6
    inc  a
    nop
    rlca
    nop
    rrca
    nop
    rst  8
    inc  bc
    rst  $20
    ld   b, e
    rst  $30
    ld   h, d
    rst  $38
    ld   h, d
    ld   a, a
    dec  bc
    ld   a, a
    ld   c, $3F
    ld   b, $1F
    ld   [bc], a
    rra
    ld   [bc], a
    ccf
    ld   bc, label_307F
    ld   e, h

label_C6D5B::
    dec  sp
    ld   l, a
    jr   label_C6D9B
    nop
    cp   h
    nop
    cp   $00
    cp   $60
    cp   $E0
    ld    hl, sp+$A0
    db   $FC ; Undefined instruction
    and  b
    cp   $EC
    cp   $FC
    db   $FC ; Undefined instruction
    ld   a, b
    cp   $60
    rst  $30
    ld   c, [hl]
    rst  $38
    add  a, d
    cp   $0C
    db   $3A ; ldd  a, [hl]
    call c, label_18F6
    inc  a
    nop
    ld   c, $00
    rra
    nop
    ccf
    nop
    ccf
    nop
    rra
    dec  c
    ccf
    rrca
    ccf
    ld   a, [de]
    ccf
    ld   a, [de]
    rra
    ld   [label_73E], sp
    ld   a, h
    scf
    ld   a, [hl]
    cpl
    ld   a, b
    rrca
    ld   e, l

label_C6D9B::
    ld   l, $6F
    db   $10 ; Undefined instruction
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld   [$FF80], a
    ld   a, [$FF80]
    ld    hl, sp+$B0
    ld    hl, sp+$F0
    ld   a, [$FFC0]
    ld    hl, sp+$40
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   h, b
    cp   $6C
    ld   a, d
    sbc  a, h
    or   $18
    inc  a
    nop
    rlca
    nop
    rrca
    nop
    rrca
    inc  bc
    rlca
    inc  bc
    rlca
    ld   [bc], a
    rrca
    ld   [bc], a
    rra
    dec  bc
    rra
    ld   c, $0F
    inc  b
    rrca
    nop
    ld   a, l
    ld   c, $F9
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld   e, [hl]
    pop  af
    ld   e, $7B
    inc  e
    ld   a, $00
    inc  bc
    nop
    rlca
    inc  bc
    ld   c, $05
    rrca
    inc  b
    rlca
    inc  bc
    rrca
    nop
    rla
    dec  c
    dec  hl
    inc  e
    dec  l
    dec  de
    ld   b, c
    ccf
    ld   b, c
    ccf
    ld   b, b
    ccf
    ld   c, b
    scf
    jr   z, label_C6E13
    inc  e
    inc  bc
    rlca
    nop
    nop
    nop
    nop
    nop
    nop

label_C6E05::
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, $0003
    dec  c
    inc  bc
    rra

label_C6E13::
    rrca
    inc  a
    rra
    ld   d, b
    ccf
    ld   c, h
    inc  sp
    ret  z
    scf
    add  a, d
    ld   a, l
    add  a, c
    ld   a, [hl]
    nop
    nop
    nop
    nop
    rra
    nop
    ld   l, a
    rra
    cp   a
    ld   a, a
    ld   h, e
    rst  $38
    ld   bc, $F0FF
    rrca
    ret  z
    rst  $30
    nop
    rst  $38
    jr   nc, label_C6E05

label_C6E36::
    ld   b, b
    cp   a

label_C6E38::
    ld   b, b
    cp   a

label_C6E3A::
    ld   [hl], b
    adc  a, a
    jr   c, label_C6E3D
    inc  c
    rst  $38
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    db   $EC ; Undefined instruction
    ld   a, [$FFFA]
    db   $FC ; Undefined instruction
    ld   l, l
    cp   $26
    rst  $38
    inc  bc
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
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    jr   nz, label_C6E36
    jr   nz, label_C6E38
    jr   nz, label_C6E3A
    db   $10 ; Undefined instruction
    inc  e
    ld   [rNR12], a
    db   $EC ; Undefined instruction
    and  c
    ld   e, [hl]
    db   $E3 ; Undefined instruction
    inc  e
    db   $FD ; Undefined instruction
    ld   b, d
    db   $FD ; Undefined instruction
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld   l, [hl]
    or   a
    ld   l, [hl]
    ld   a, a
    ld   h, $5B
    ld   h, $3F
    ld   [bc], a
    ld   d, $09
    dec  sp
    inc  e
    ld   [hl], b
    ccf
    ld   a, a
    nop
    nop
    nop
    nop

label_C6E9D::
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    dec  b
    ei
    rlca
    ei
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    ld   bc, label_9FE
    or   $09
    or   $FC
    inc  bc
    rst  $38
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
    add  a, b
    ld   a, a
    ret  nz
    rst  $38
    nop
    rst  $38
    jr   nc, label_C6E9D
    inc  c
    di
    ldd  [hl], a
    db   $FD ; Undefined instruction
    dec  a
    cp   $1F
    rst  $38
    add  a, a
    ld   a, a
    ret  nz
    ccf
    ccf
    nop
    nop
    nop
    nop
    nop
    ld   [de], a
    db   $EC ; Undefined instruction
    inc  b
    ld    hl, sp+$0A
    db   $FC ; Undefined instruction
    dec  c
    cp   $05
    cp   $01
    cp   $11
    xor  $11
    xor  $39
    add  a, $C6

label_C6EF3::
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
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
    rra
    nop
    ld   l, a
    rra
    cp   a
    ld   a, a
    ld   h, e
    rst  $38
    ld   bc, $F0FF
    rrca
    ret  z
    rst  $30
    jr   nz, label_C6EF3
    ld   [hl], b
    adc  a, a
    ld   a, b
    or   a
    ld   a, b
    sub  a, a
    jr   z, label_C6EF3
    jr   c, label_C6F1D
    inc  c
    rst  $38
    inc  bc
    nop
    dec  c
    inc  bc
    rra

label_C6F25::
    rrca
    inc  a
    rra
    ld   d, b
    ccf
    ld   c, h
    inc  sp
    ret  z
    scf
    add  a, d
    ld   a, l
    add  a, c
    ld   a, [hl]
    and  c
    ld   e, [hl]
    db   $E3 ; Undefined instruction
    inc  e
    db   $FD ; Undefined instruction
    ld   b, d
    db   $FD ; Undefined instruction
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld   l, [hl]
    or   a
    ld   l, [hl]
    ld   a, a
    ld   h, $F0
    nop
    call z, label_23F0
    call c, label_8E71
    ld   a, b
    or   a
    ld   a, b
    sub  a, a
    jr   z, label_C6F25
    jr   c, label_C6F4F
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
    ld   e, e
    ld   h, $35
    ld   a, [bc]
    inc  de
    inc  c
    db   $10 ; Undefined instruction
    ld   [label_807], sp
    rlca
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   c, $01
    ld   [de], a
    dec  c
    add  hl, sp
    ld   e, $70
    ccf
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
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, label_304
    ld   c, $01
    jr   c, label_C6F9F
    ld   a, b
    scf
    pop  af
    ld   l, [hl]
    sub  a, e
    ld   l, h
    ld   a, b

label_C6F9F::
    rlca
    ld   bc, label_600
    ld   bc, label_708
    inc  de
    rrca
    jr   label_C6FB1
    ld   h, b
    rra
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    nop

label_C6FB1::
    rst  $38

label_C6FB2::
    nop
    rst  $38
    ld   h, b
    rst  $38
    call nc, label_3CEB
    db   $DB
    ld   a, h
    adc  a, e
    add  hl, sp
    rst  0
    inc  bc
    rst  $38
    ld    hl, sp+$00
    db   $E4 ; Undefined instruction
    ld    hl, sp+$08
    ld   a, [$FF90]
    ld   h, b
    ld   a, b
    add  a, b
    ld   b, $F8
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    cp   a
    add  hl, hl
    rst  $18
    dec  l
    rst  $18
    sub  a, a
    rst  $28
    rst  $10
    rst  $28
    nop
    nop
    nop
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
    jr   nz, label_C6FB2
    db   $10 ; Undefined instruction
    rla
    ld   [$FF09], a
    or   $09
    or   $21
    cp   $A1
    cp   $F2
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
    nop
    nop
    nop
    nop
    inc  bc
    nop
    dec  c
    inc  bc
    rra
    rrca
    inc  a
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
    ld   a, [$FF00]
    call z, label_22F0

label_C703D::
    call c, label_8E73
    ld   d, b
    ccf
    ld   c, h
    inc  sp
    ret  z
    scf
    add  a, d
    ld   a, l
    add  a, c
    ld   a, [hl]
    and  c
    ld   e, [hl]
    db   $E3 ; Undefined instruction
    inc  e
    db   $FD ; Undefined instruction
    ld   b, d
    db   $FD ; Undefined instruction
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld   l, [hl]
    or   a
    ld   l, [hl]
    rst  $38
    and  [hl]
    db   $DB
    and  [hl]
    rst  $38
    jp   nz, label_C787F
    rra
    rra
    ld   a, c
    or   a
    ld   a, b
    sub  a, a
    jr   z, label_C703D
    jr   c, label_C7067
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
    rst  $38
    nop
    rst  $38
    rst  $38
    add  a, b
    nop
    ret  nz
    add  a, b
    and  b
    ret  nz
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_8F0], sp
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    rrca
    di
    cp   $0E
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   bc, label_600
    ld   bc, label_70F
    ld   e, $0F
    jr   z, label_C70C9
    ld   h, $19
    ld   h, h
    dec  de
    ld   b, c
    ld   a, $40
    ccf
    ret  nc
    xor  a
    pop  af
    adc  a, [hl]
    cp   $A1
    cp   $B7
    cp   $87
    ld   a, a
    ld   [hl], b
    rra
    rra
    ld    hl, sp+$00
    and  $F8
    sub  a, e
    xor  $39
    rst  0
    inc  a

label_C70C9::
    db   $DB
    inc  a
    rl   h
    db   $EB ; Undefined instruction
    inc  e
    rst  $38
    add  a, [hl]
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
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    and  b
    ret  nz
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_8F0], sp
    ld   a, [$FF06]
    ld   a, [$FA06]
    ld   b, $FA
    ld   b, $FA
    ld   e, $E6
    db   $FC ; Undefined instruction
    inc  e
    ld    hl, sp+$F8
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    rra
    nop
    ccf
    ld   [bc], a
    ccf
    ld   b, $3F
    ld   b, $1F
    rlca
    ccf
    dec  bc

label_C7114::
    ld   a, h
    dec  bc
    ld   [hl], a
    rrca
    ld   a, e
    rlca
    rra
    nop
    nop
    nop
    nop
    nop
    jr   c, label_C7122

label_C7122::
    ld   d, [hl]
    jr   c, label_C7114
    ld   d, $DA
    ld   l, h
    sbc  a, l
    ld   h, d
    or   l
    ld   e, d
    and  $18
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$80
    db   $FC ; Undefined instruction
    ld   d, b
    xor  $70
    cp   [hl]
    ret  nz
    ld   a, [hl]
    add  a, b
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
    ret  nz
    add  a, b
    ld    hl, sp+$C0
    ld   a, a
    ld    hl, sp+$1F
    ld   a, a
    nop
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
    rrca
    nop
    inc  de
    rrca
    add  hl, bc
    rlca
    add  hl, bc
    rlca
    dec  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, label_306
    ld   c, $07
    dec  d
    ld   c, $11
    ld   c, $21
    ld   e, $21
    ld   e, $60
    ld   e, a
    ld   [hl], b
    ld   l, a
    ccf
    ccf
    nop
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld    hl, sp+$80
    db   $FC ; Undefined instruction
    ld    hl, sp+$7E
    db   $FC ; Undefined instruction
    ld   c, $FC
    pop  bc
    ld   a, $3F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    cpl
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
    rlca
    ld   a, a
    rrca
    ld   a, a
    rra
    ccf
    dec  de
    rra
    dec  bc
    rla
    rrca
    dec  de
    rlca
    rra
    ld   [label_C1E], sp
    ld   c, $00
    call c, label_3F00
    ret  c
    rst  $38
    db   $10 ; Undefined instruction
    ld   l, h
    swap h
    cp   $01
    ei
    ld   b, $FD
    add  a, [hl]
    rst  $38
    call nc, label_C74FA
    call c, label_BD68
    ret  c
    ld   [hl], l
    sbc  a, b
    ld   sp, hl
    jr   nc, label_C724E
    jr   nz, label_C723F
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    and  b
    ret  nz
    ld   h, b
    ret  nz
    db   $10 ; Undefined instruction
    sub  a, b
    ld   h, b
    db   $10 ; Undefined instruction
    adc  a, b
    ld   [hl], b
    and  h
    ld   a, b
    ld   [hl], h
    ld    hl, sp+$7A
    call c, label_8CDE
    adc  a, $84
    add  a, $00
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
    rra
    nop
    ccf
    ld   [bc], a
    ccf
    ld   b, $3F
    ld   b, $1F
    rlca
    ccf
    dec  bc

label_C7216::
    ld   a, a
    dec  bc
    rst  $30
    rrca
    ei
    rlca
    ld   [hl], a
    ld   [label_BFF], sp
    nop
    nop
    jr   c, label_C7224

label_C7224::
    ld   d, [hl]
    jr   c, label_C7216
    ld   d, $DA
    ld   l, h

label_C722A::
    sbc  a, l
    ld   h, d
    or   l
    ld   e, d
    and  $18
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    add  a, b
    cp   $50
    rst  $28
    ld   [hl], b
    cp   a
    ret  nz
    ld   a, [hl]
    add  a, b
    rst  $38
    ld   b, b
    rst  $38

label_C723F::
    ld   b, b
    rst  $38
    ld   [label_18EF], sp
    ld   a, a
    rla
    inc  a
    rrca
    ld   hl, label_201E
    rra
    db   $10 ; Undefined instruction

label_C724E::
    inc  c
    inc  bc
    inc  bc
    nop

label_C7252::
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    jr   nz, label_C7252
    jr   nc, label_C72E3
    sbc  a, b
    jr   c, label_C7228

label_C7268::
    jr   nz, label_C722A

label_C726A::
    and  b
    ld   b, b

label_C726C::
    ld   a, [hl]
    add  a, b
    ld   c, $FC
    inc  a
    ld    hl, sp+$78
    ld   [$FF60], a
    ret  nz
    ld   h, b
    ret  nz
    ld   [$FFC0], a
    ld   [rLCDC], a
    ld   b, b
    nop
    nop
    nop
    rst  $38
    ld   [label_18EF], sp
    ld   a, a
    rla
    inc  a
    rrca
    jr   nz, label_C72A9
    ld   hl, label_231E
    inc  e
    inc  h
    jr   label_C72B3
    inc  e

label_C7292::
    ld   c, c
    ld   a, $5D
    ld   a, $BE
    ld   [hl], a
    rst  $30
    ld   h, e
    db   $E3 ; Undefined instruction
    ld   b, c
    ld   b, c
    nop
    nop
    nop
    rst  $38
    jr   nz, label_C7292
    jr   nc, label_C7323
    sbc  a, b
    jr   c, label_C7268
    jr   nz, label_C726A
    jr   nz, label_C726C
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop

label_C72B3::
    nop
    nop
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
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C72C7
    jr   label_C72C9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C72D7
    jr   label_C72D9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_C72E3::
    rst  $38
    inc  h
    rst  $38
    jr   label_C72E7
    jr   label_C72E9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C72F7
    jr   label_C72F9
    inc  h

label_C72FB::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    ld   bc, label_600
    ld   bc, label_70C
    ld   a, [de]
    dec  c
    ld   d, $09
    ld   c, $05
    ld   c, $05
    add  hl, de
    ld   c, $30
    rrca
    ld   l, b
    scf
    xor  [hl]
    ld   [hl], c
    add  a, $7B
    adc  a, a
    halt
    ld   [hl], $5D
    ldi  [hl], a
    nop
    nop
    ld   [rJOYP], a
    ret  nc
    ld   [$FF28], a
    ld   a, [$FF18]
    ld   a, [$FF14]
    ld    hl, sp+$04
    ld    hl, sp+$C4
    jr   c, label_C72FB
    cp   h
    ld   b, l
    cp   [hl]
    add  a, l
    ld   a, [hl]
    ret
    cp   [hl]
    ld   c, d
    cp   h
    ld   b, h
    cp   b
    ld   b, d
    cp   h
    ldi  [hl], a
    call c, label_1F2C
    ld   e, b
    ccf
    ld   b, e
    inc  a
    ld   b, l
    ld   a, $62
    rra
    ld   a, b
    daa
    or   [hl]
    ld   l, c
    cp   e
    ld   e, h
    db   $3E
    ld   a, $AF
    ld   e, h
    sbc  a, a
    ld   h, b
    adc  a, c
    halt
    ld   [hl], a
    ld   d, b
    cpl
    jr   nc, label_C736D
    rra
    nop
    sub  a, d
    ld   l, h
    ld   a, h
    add  a, b
    db   $FC ; Undefined instruction

label_C7365::
    jr   label_C7365
    inc  a
    cp   $04
    ld   l, a
    or   $1F

label_C736D::
    xor  $3D
    sbc  a, $3B
    call c, label_D22D
    ld   a, c
    add  a, [hl]
    push bc
    db   $3A ; ldd  a, [hl]
    ld   b, [hl]
    cp   b
    ld   b, h
    cp   b
    ld   c, b
    or   b
    ld   a, [$FF00]
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C7387
    jr   label_C7389
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C7397
    jr   label_C7399
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C73A7
    jr   label_C73A9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C73B7
    jr   label_C73B9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C73C7
    jr   label_C73C9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C73D7
    jr   label_C73D9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C73E7
    jr   label_C73E9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C73F7
    jr   label_C73F9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_C7402

label_C7402::
    ld   c, h
    jr   c, label_C744B
    inc  a
    ld   c, e
    inc  [hl]
    ld   e, h
    dec  hl
    ld   e, a
    jr   z, label_C748C
    rlca
    rst  $38
    ld   a, a
    rst  $38
    ld   c, d
    ld   a, a
    ld   a, [hli]
    ccf
    rrca
    ccf
    rra
    ccf
    ld   de, label_1B7F
    rst  $38
    ld   e, a
    rst  $38
    ld   l, e
    ld   e, $00
    add  hl, sp
    ld   e, $61
    ld   a, $E1
    ld   e, $E2
    ld   e, h
    ldh  [$FF0C], a
    ld   e, h
    cp   $00
    rst  $38
    cp   $FB
    ld   h, [hl]
    cp   $EC
    db   $FC ; Undefined instruction
    ld   [$FFF8], a
    ld   [$FFFC], a
    ret  c
    cp   $BC
    db   $FD ; Undefined instruction
    cp   [hl]
    sbc  a, a
    ld   l, [hl]
    rst  $38
    ld   [hl], b
    cp   a
    ld   a, h
    ld   e, a
    dec  a
    ld   a, a
    dec  d
    ld   a, a

label_C7449::
    inc  hl
    ld   a, a

label_C744B::
    ccf
    ld   a, a
    add  hl, hl
    ld   a, a
    ccf
    ld   a, a
    ldi  [hl], a
    ld   a, a
    ccf
    ld   a, a
    dec  h
    ld   a, a
    ccf
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    ld   d, $0C
    inc  de
    ld   c, $15
    ld   a, [bc]
    ld   e, $05
    rra

label_C746B::
    ld   [label_77F], sp
    ld   a, a
    cpl
    ld   l, a
    inc  e
    ld   a, a
    dec  a
    rst  $38
    ld   a, a
    rst  $38
    rrca
    rst  $38
    ld   e, a
    rst  $38
    ld   a, h
    ld   a, h
    dec  sp
    ld    hl, sp+$47
    jr   c, label_C7482

label_C7482::
    ld   h, h
    jr   c, label_C7449
    ld   a, b
    ld   h, h
    sbc  a, b
    call nc, label_A468
    ret  c

label_C748C::
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld    hl, sp+$EC
    sbc  a, b

label_C7492::
    ld    hl, sp+$F0
    ld   a, [$FF80]
    ld    hl, sp+$B0
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    ld   a, l
    cp   $3F
    xor  $0F
    nop
    jr   label_C74AB
    rra
    ld   a, [bc]
    ccf
    inc  b
    ccf
    ld   a, [de]
    ld   e, a

label_C74AB::
    jr   c, label_C74FC
    inc  sp
    ld   l, e
    rla
    jr   c, label_C74B9
    rlca
    nop
    dec  b
    ld   [bc], a
    dec  b
    inc  bc
    dec  bc

label_C74B9::
    inc  b
    add  hl, bc
    rlca
    ld   [label_707], sp
    nop
    nop
    nop
    ld   a, [$FF00]
    adc  a, b
    ld   [hl], b
    ret  z
    ld   a, [$FFC8]
    ld   a, [$FFC8]
    jr   nc, label_C74BD
    add  a, b
    jr   nz, label_C7490
    jr   nz, label_C7492
    ret  nz
    nop
    and  b
    ld   b, b
    and  b
    ret  nz
    ret  nc
    jr   nz, label_C746B
    ld   [rNR10], a
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
    dec  b
    ld   [bc], a

label_C74F6::
    dec  b
    inc  bc
    dec  bc
    inc  b

label_C74FA::
    add  hl, bc
    rlca

label_C74FC::
    ld   [label_707], sp
    nop
    inc  e
    nop
    rra
    inc  c
    rrca
    ld   b, $1F
    inc  bc
    ccf
    jr   label_C754A
    ld   e, $7F
    inc  c
    rst  8
    scf
    rst  $20
    ld   e, e
    di
    ld   l, h
    ld    hl, sp+$07
    ld   a, a
    jr   nc, label_C7591
    scf
    rst  $38
    nop
    or   e
    ld   a, h
    rst  $38
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld   [hl], h
    ret  z
    cp   [hl]
    ld   e, h
    db   $BE
    cp   [hl]
    db   $E3 ; Undefined instruction
    ld   e, $F5
    adc  a, $F9
    and  $F6
    jr   z, label_C7557
    ret  c
    jr   c, label_C74F6
    ld   a, [$FF00]
    ld   [hl], b
    add  a, b
    ld   a, [$FF00]
    ld   l, b
    ld   a, [$FFF8]
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    dec  c
    ld   b, $1A
    inc  c
    inc  d
    ld   [$0018], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C7557::
    nop
    nop
    nop
    nop
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
    ret  nc
    ld   [$FFF8], a
    ld   [hl], b
    ld   e, h
    jr   c, label_C7599
    jr   label_C758D
    inc  c
    ld   d, $0C
    rrca

label_C7573::
    ld   b, $0B
    ld   b, $0B
    rlca
    rlca
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    rst  $38
    nop
    ld   b, b
    ccf
    ld   b, a
    ccf
    ld   l, e
    rla
    inc  h

label_C758D::
    dec  de
    inc  sp
    inc  c
    db   $10 ; Undefined instruction
    jr   label_C759B
    inc  c
    inc  bc
    ld   b, $01
    inc  bc

label_C7599::
    nop
    ld   bc, $0000
    nop
    nop
    nop
    rst  $38
    nop
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
    cp   $FF
    nop
    ld   c, $F0
    db   $E8 ; add  sp, d
    ld   a, [$FFE8]
    ld   a, [$FFD8]
    ld   [$FF34], a
    ret  z
    db   $F4 ; Undefined instruction
    ld   [$C836], sp
    inc  sp
    call z, label_8E71
    pop  af
    ld   c, $E9
    ld   b, $0F
    nop
    nop
    nop
    jr   label_C75E2

label_C75E2::
    inc  h
    jr   label_C7627
    inc  a
    ld   b, e
    inc  a
    dec  a
    nop
    add  hl, sp
    db   $10 ; Undefined instruction
    nop
    ld   b, h
    jr   c, label_C7573
    ld   a, h
    add  a, d
    ld   a, h
    add  a, h
    ld   a, b
    ld   c, b
    jr   nc, label_C762A
    nop
    ld   sp, label_1A00
    nop
    inc  c
    nop
    inc  e
    nop
    db   $3A ; ldd  a, [hl]
    inc  e
    add  hl, hl
    ld   e, $11
    ld   c, $39
    ld   e, $1B
    inc  c
    rla
    ld   [$001F], sp
    dec  bc
    inc  b
    ld   [label_407], sp
    inc  bc
    rlca
    nop
    rlca
    nop
    dec  c
    ld   b, $0B
    inc  b
    rrca
    nop
    inc  a
    nop
    ld   b, d
    inc  a
    sbc  a, c
    ld   h, [hl]
    cp   l

label_C7627::
    ld   b, d
    inc  a
    jp   label_E718
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    ld   b, d
    cp   l

label_C7634::
    rst  $38
    ld   b, d
    rst  $38
    inc  a
    cp   l
    ld   a, [hl]
    db   $DB
    inc  a
    cp   l
    nop

label_C763E::
    nop
    nop
    nop
    nop
    jr   nc, label_C7644

label_C7644::
    ld   a, b
    jr   nc, label_C76A3
    jr   c, label_C7634
    ld   e, h
    cp   e
    ld   a, h
    ld   d, a
    jr   c, label_C763E
    ld   d, b
    cp   e
    ld   [hl], h
    ld   c, b
    scf
    inc  h
    dec  de
    rra
    nop
    rlca
    nop
    dec  c
    ld   b, $0B
    inc  b
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
    dec  c
    nop
    rra
    inc  c
    ccf
    jr   label_C76A6
    jr   label_C76E4
    inc  e
    ld   [hl], d
    dec  l
    ld   [hl], d
    dec  e
    ld   d, a
    jr   z, label_C769E
    ld   a, [de]
    rla
    ld   [$000F], sp
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C7687
    jr   label_C7689
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C7697
    jr   label_C7699
    inc  h
    rst  $38
    nop
    rst  $38

label_C769E::
    nop
    rst  $38
    nop
    rst  $38
    nop

label_C76A3::
    rst  $38
    inc  h
    rst  $38

label_C76A6::
    jr   label_C76A7
    jr   label_C76A9

label_C76AA::
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C76B7
    jr   label_C76B9
    inc  h
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
    inc  bc
    nop
    inc  b
    inc  bc
    dec  de
    rlca
    inc  [hl]
    rrca
    ld   e, b
    cpl
    and  e
    ld   e, a
    rst  $20
    inc  e
    cp   h
    ld   e, e
    sbc  a, [hl]
    ld   h, c
    ld   [label_C4445], a
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_C76E4::
    nop
    nop
    ret  nz
    nop
    jr   c, label_C76AA
    call nc, label_2AE8
    db   $F4 ; Undefined instruction
    ld   a, [de]
    db   $F4 ; Undefined instruction
    add  a, $F8
    db   $E4 ; Undefined instruction
    jr   c, label_C7731
    ret  c
    ld   a, d
    add  a, h
    ld   d, d
    xor  h
    ld   l, $C4
    adc  a, $04
    inc  b
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    nop
    db   $FD ; Undefined instruction
    ld   a, e
    ei
    ld   [hl], a
    adc  a, e
    ld   [hl], a
    ld   sp, hl
    ld   [hl], a
    adc  a, h
    ld   [hl], e
    rst  $30
    ld   a, b
    ei
    ld   a, a
    add  a, h
    ld   a, e
    rst  $38
    nop
    or   c
    ld   c, [hl]
    cp   a
    ld   b, b
    add  a, b
    ld   a, a
    ld   a, a
    nop
    ccf
    nop
    ld   a, a
    jr   c, label_C77A4
    ld   sp, label_304F
    ld   a, e
    inc  [hl]
    ld   a, c
    ld   [hl], $4C
    inc  sp
    ld   [hl], a
    jr   c, label_C77AC

label_C7731::
    ccf
    ld   a, e
    ccf
    ld   b, h
    dec  sp
    ld   a, a
    nop
    ld   e, c
    ld   h, $5F
    jr   nz, label_C777D
    ccf
    ccf
    nop
    rrca
    nop
    ld   [hl], e
    rrca
    rst  $30
    ld   l, a
    sbc  a, a
    ld   h, h
    rst  $38
    ld   h, b
    sbc  a, a
    ld   l, a
    di
    ld   l, a
    sub  a, [hl]
    ld   l, a
    cp   e
    ld   [hl], a
    ld   d, a
    jr   c, label_C7775
    rra
    ld   a, a
    ccf
    ld   b, e
    inc  a
    rst  $38
    ld   a, b
    rst  $38
    nop
    ld   a, a
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   [$FFE8], a
    ld   a, [$FFEC]
    or   b
    xor  $34
    rrca
    or   $EB
    or   $7D
    adc  a, [hl]
    db   $ED ; Undefined instruction
    ld   a, [hl]
    ld   [label_C7E7C], a

label_C7775::
    add  a, b
    add  a, d
    db   $FC ; Undefined instruction
    cp   [hl]
    ld   a, h
    jp   label_FF3C

label_C777D::
    ld   a, $FF
    nop
    nop
    nop
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

label_C77A4::
    rrca
    rlca
    rrca
    inc  b
    ld   a, a
    dec  b
    ld   a, e
    scf

label_C77AC::
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

label_C77D5::
    ret  z
    rst  8
    ld   [hl], $FF
    ld   b, $CE
    jr   nc, label_C77D5
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

label_C77ED::
    ld   l, e
    rst  $38
    ld   [bc], a
    daa
    jr   label_C7872
    jr   nz, label_C77ED
    ld   [hl], b
    ld   a, b
    jr   nc, label_C7869
    jr   nz, label_C781B
    nop
    nop
    nop
    nop
    nop
    dec  sp
    dec  sp
    dec  h
    ld   a, $19
    rra
    dec  bc
    rrca
    dec  de
    rra
    rst  $38
    rst  $38
    ld   a, [$FB87]
    xor  a
    ld   a, [$FB87]
    add  a, a
    ei
    xor  a
    ei
    add  a, a
    ld   a, [$FB87]

label_C781B::
    xor  a
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    call c, label_A4DC
    ld   a, h
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
    dec  sp
    dec  sp
    dec  h
    ld   a, $19
    rra
    dec  bc
    ld   c, $FF
    cp   $FB
    add  a, a
    ld   a, [$FBAF]
    add  a, a
    ld   a, [$FB87]
    xor  a
    ei
    add  a, a
    ei
    add  a, a
    ld   a, [$83AF]
    rst  $38
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    call c, label_A4DC
    ld   a, h
    sbc  a, b
    ld    hl, sp+$D2
    ld   [hl], d
    rst  $10

label_C7869::
    ld   [hl], l
    sbc  a, a
    db   $FD ; Undefined instruction
    scf
    db   $FD ; Undefined instruction
    rst  0
    db   $FD ; Undefined instruction
    cpl
    rst  $18

label_C7872::
    adc  a, a
    ld   sp, hl
    ei
    db   $FD ; Undefined instruction
    adc  a, a
    ld   sp, hl
    ld   [hl], a
    rst  $38
    rst  $38
    adc  a, l
    rst  $38
    add  a, l
    cp   $FE
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C7887
    jr   label_C7889
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C7897
    jr   label_C7899
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C78A7
    jr   label_C78A9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C78B7
    jr   label_C78B9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C78C7
    jr   label_C78C9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C78D7
    jr   label_C78D9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C78E7
    jr   label_C78E9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_C78F0::
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C78F7
    jr   label_C78F9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc
    rlca
    dec  bc
    rlca
    dec  bc
    dec  b
    dec  bc
    dec  b
    dec  bc
    dec  b
    dec  bc
    rlca
    dec  bc
    rlca
    dec  bc
    rlca
    dec  b
    inc  bc
    inc  b
    inc  bc
    inc  e
    rlca
    jr   c, label_C793B
    inc  hl
    inc  e
    inc  a
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   [label_1307], sp
    rrca
    inc  de
    rrca
    inc  de
    ld   c, $09
    rlca
    add  hl, bc
    rlca
    inc  b
    inc  bc
    inc  e
    inc  bc
    ld   l, $19
    ld   [hl], h
    rrca
    ld   [hl], b

label_C793B::
    rrca
    ccf
    nop
    jr   c, label_C7940

label_C7940::
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   h, b
    add  a, b
    sub  a, b
    ld   [$FFD0], a
    ld   [$FFC8], a
    or   b
    db   $E8 ; add  sp, d
    ld   d, b
    db   $E8 ; add  sp, d
    ld   d, b
    db   $E8 ; add  sp, d
    ld   a, [$FF48]
    ld   a, [$FF10]
    ld   [$FF30], a
    ret  nz
    jr   label_C794C
    adc  a, h
    ld   a, b
    ld   a, b
    nop
    jr   nz, label_C7962

label_C7962::
    ld   b, a
    nop
    ld   c, b
    rlca
    ld   de, label_130F
    rrca
    inc  de
    dec  c
    ld   d, e
    dec  c
    dec  hl
    rlca
    add  hl, bc
    rlca
    add  hl, hl
    rlca
    ld   [hl], h
    inc  bc
    inc  b
    inc  bc
    inc  e
    rlca

label_C797A::
    jr   c, label_C799B
    inc  hl
    inc  e
    inc  a
    nop
    add  a, b
    nop
    ld   b, b
    nop
    add  a, b
    nop
    ld   e, h
    add  a, b
    ret  z
    add  a, b
    xor  b
    ld   b, b
    and  b
    ld   b, b
    and  b
    ret  nz
    and  b
    ret  nz
    and  h
    ret  nz
    jr   z, label_C7956
    inc  h
    ret  nz
    jr   c, label_C797A
    inc  e

label_C799B::
    ld    hl, sp+$C4
    jr   c, label_C79DB
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    dec  b
    inc  bc
    ld   a, $01
    ld   e, l
    ld   a, $7F
    ld   [hl], $5D
    ld   a, $3E
    ld   bc, label_304

label_C79B2::
    inc  b
    inc  bc

label_C79B4::
    inc  b
    inc  bc

label_C79B6::
    inc  b
    inc  bc
    jr   label_C79C1
    add  hl, hl
    ld   e, $23
    inc  e
    ld   e, $00
    ld   e, $00
    dec  l
    ld   e, $2C
    rra
    jr   nz, label_C79E7
    db   $10 ; Undefined instruction
    rra
    nop
    ccf
    ld   e, $7D
    ld   [hl], $5A
    dec  a
    ld   a, $01
    inc  b
    inc  bc
    inc  b
    inc  bc

label_C79D8::
    jr   label_C79E1
    add  hl, hl

label_C79DB::
    ld   e, $23
    inc  e
    ld   e, $00
    nop

label_C79E1::
    nop
    jr   c, label_C79E4

label_C79E4::
    db   $F4 ; Undefined instruction
    jr   c, label_C79DB

label_C79E7::
    ld   e, b
    db   $E8 ; add  sp, d
    ld   [hl], b
    sub  a, b
    ld   h, b
    ld   [rJOYP], a
    jr   nz, label_C79B0
    jr   nz, label_C79B2
    jr   nz, label_C79B4
    jr   nz, label_C79B6
    jr   label_C79D8
    inc  d

label_C79F9::
    ld    hl, sp+$C4
    jr   c, label_C79F9
    nop
    jr   c, label_C7A00

label_C7A00::
    rlca
    nop
    jr   label_C7A0B
    ld   c, $01
    rrca
    nop
    dec  de
    inc  c
    ldd  [hl], a

label_C7A0B::
    dec  e
    ld   a, [hli]
    dec  d
    ld   c, a
    jr   nc, label_C7A69
    daa
    sub  a, d
    ld   l, a
    and  a
    ld   e, d
    xor  [hl]
    ld   e, c
    cp   h
    ld   b, e
    ld   h, l
    inc  bc
    inc  bc
    nop
    nop
    nop
    add  a, c
    nop
    ld   a, [hl]
    add  a, c
    inc  a
    rst  $38
    sbc  a, c
    ld   a, [hl]
    ld   e, d
    cp   l
    ld   h, [hl]
    db   $DB
    ld   h, [hl]
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   b, d
    rst  $20
    ld   e, d
    jp   label_C7EBD
    rst  $38
    inc  a
    rst  $38
    cp   l
    jp   label_C3
    nop
    nop
    ld   c, $00
    ccf
    ld   [label_3758], sp
    cp   [hl]
    ld   b, c
    ld   a, a
    nop
    rra
    nop
    ld   b, $01
    ld   [bc], a
    ld   bc, $0007
    ld   [label_1207], sp
    rrca
    daa
    ld   a, [de]
    ld   l, $19
    inc  e
    inc  bc
    dec  b
    inc  bc
    inc  bc
    nop
    nop
    nop
    add  a, c
    nop
    ld   a, [hl]
    add  a, c
    inc  a
    rst  $38
    sbc  a, c

label_C7A69::
    ld   a, [hl]
    ld   e, d
    cp   l
    ld   h, [hl]
    db   $DB
    ld   h, [hl]
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   b, d
    rst  $20
    ld   e, d
    jp   label_C7EBD
    rst  $38
    inc  a
    rst  $38
    cp   l
    jp   label_C3
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc
    ld   b, $17

label_C7A87::
    nop
    ccf
    nop
    halt
    ld   h, d
    dec  a
    ldi  [hl], a
    dec  e
    ld   de, label_3D0E
    ld   d, $27
    ld   a, [de]
    inc  l
    inc  de
    ld   l, $11
    inc  l
    inc  de
    dec  e
    inc  bc
    inc  de
    nop
    add  a, c
    nop
    ld   a, [hl]
    add  a, c
    inc  a
    rst  $38
    db   $DB
    inc  a
    ld   h, [hl]
    db   $DB
    ld   h, [hl]
    rst  $38
    inc  a
    jp   label_C42FF
    rst  $38
    ld   b, d
    ld   a, [hl]
    add  a, c
    ld   h, [hl]
    sbc  a, c
    cp   l
    ld   b, d
    ld   b, d
    cp   l
    inc  a
    jp   label_C3BD
    jp   label_0
    nop
    nop
    nop
    ld   [label_1800], sp
    nop
    ld   a, $00
    ld   a, a
    ld   b, $6F
    ld   [de], a
    swap a
    cp   a
    ld   [hl], l
    rst  $38
    ld   [hl], l
    ei
    ld   h, a
    rst  $20
    ld   b, d
    rst  0
    ld   [bc], a
    add  a, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    ld   b, $00
    ld   c, $00
    rrca
    ld   b, $1F
    ld   [bc], a
    dec  de
    rlca
    rra
    dec  b
    rra
    dec  b
    dec  de
    rlca
    rra
    ld   [bc], a
    rra
    ld   [bc], a
    dec  bc
    nop
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    nop
    db   $FD ; Undefined instruction
    ld   a, e
    ei
    ld   [hl], a
    adc  a, e
    ld   [hl], a
    ld   sp, hl
    ld   [hl], a
    adc  a, h
    ld   [hl], e
    rst  $30
    ld   a, b
    ei
    ld   a, a
    add  a, h
    ld   a, e
    rst  $38
    nop
    or   c
    ld   c, [hl]
    cp   a

label_C7B1B::
    ld   b, b
    add  a, b
    ld   a, a
    ld   a, a
    nop
    ccf
    nop
    ld   a, a
    jr   c, label_C7BA4
    ld   sp, label_304F
    ld   a, e
    inc  [hl]
    ld   a, c
    ld   [hl], $4C
    inc  sp
    ld   [hl], a
    jr   c, label_C7BAC
    ccf
    ld   a, e
    ccf
    ld   b, h
    dec  sp
    ld   a, a
    nop
    ld   e, c
    ld   h, $5F
    jr   nz, label_C7B7D
    ccf
    ccf
    nop
    rra
    nop
    ld   a, $1F
    ld   a, [hl]
    dec  hl

label_C7B46::
    ld   a, [hl]
    dec  hl
    or   [hl]
    ld   a, a
    add  a, b
    ld   a, a
    add  a, c
    ld   a, [hl]
    cp   $01

label_C7B50::
    ld   a, [hl]
    ccf

label_C7B52::
    inc  a
    inc  bc
    inc  e
    rrca
    add  hl, sp
    ld   e, $38
    rra
    dec  l
    rra
    rla
    rrca
    ccf
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nz, label_C7B26
    db   $10 ; Undefined instruction
    ret  nc
    jr   nz, label_C7AFB
    ld   h, b
    db   $10 ; Undefined instruction
    jr   nz, label_C7B30
    inc  hl
    ret  nz
    ld   b, l
    add  a, d
    push af
    ld   [bc], a
    add  hl, bc
    or   $01
    cp   $F1
    cp   $6A

label_C7B7D::
    sbc  a, h
    db   $FC ; Undefined instruction
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nz, label_C7B46
    db   $10 ; Undefined instruction
    ret  nc
    jr   nz, label_C7B1B
    ld   h, b
    db   $10 ; Undefined instruction
    jr   nz, label_C7B50
    jr   nz, label_C7B52
    ld   b, [hl]
    add  a, b
    ld   [label_1204], a
    db   $EC ; Undefined instruction
    inc  b
    ld    hl, sp+$CC
    ld    hl, sp+$F8
    ld   [hl], b
    db   $FC ; Undefined instruction
    nop
    nop
    rst  $38
    nop
    rst  $38

label_C7BA4::
    inc  h
    rst  $38
    jr   label_C7BA7
    jr   label_C7BA9
    inc  h
    rst  $38

label_C7BAC::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  h
    rst  $38
    jr   label_C7BB7
    jr   label_C7BB9
    inc  h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    nop
    inc  c
    inc  bc
    inc  de
    rrca
    cpl
    rra
    cpl
    rra
    ld   e, h
    ccf
    ld   e, c
    ld   a, $59
    ld   a, $59
    ccf
    ld   e, c
    ccf
    inc  l
    rra
    cpl
    rra
    inc  de
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  c
    ld   b, l
    ld   c, [hl]
    ld   d, $0F
    scf
    rrca
    rrca
    rst  $38
    ld   a, h
    rst  $38
    add  hl, sp
    ld   a, [hl]
    ld   e, c
    ld   a, $D9
    cp   a
    ld   e, c
    ccf
    inc  a
    ld   a, a
    ld   a, a
    rst  $38
    rrca
    rst  $38
    ld   [hl], $0F
    ld   d, l
    ld   c, [hl]
    nop
    inc  c
    di
    nop
    adc  a, h
    ld   [hl], e
    ld   d, h
    dec  hl
    scf
    inc  c
    ld   d, d
    dec  l
    ld    hl, sp+$07
    rst  $38
    ld   l, b
    db   $6B
    ld   l, e
    sbc  a, e
    ld   h, [hl]
    ld   [hl], a
    rrca
    ld   a, l
    inc  bc
    ld   [hl], e
    inc  c
    ld   a, a
    inc  bc
    inc  hl
    inc  e
    ld   [hl], a
    ld   a, $7F
    nop
    rst  8
    nop
    ld   sp, label_2ACE
    call nc, label_30EC
    ld   c, d
    or   h
    add  hl, de
    and  $FD
    ld   [de], a
    cp   a
    ret  nc
    rst  $18
    ld   h, [hl]
    db   $EB ; Undefined instruction
    or   $B9
    add  a, $EE
    db   $10 ; Undefined instruction
    ld   [$FFF0], a
    nop
    ld    hl, sp+$00
    ret  nz
    nop
    di
    nop
    adc  a, h
    ld   [hl], e
    ld   c, a
    jr   nc, label_C7C86
    rrca
    ccf
    db   $10 ; Undefined instruction
    nop
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    xor  a
    ld   d, b
    ld   h, b
    rra
    jr   nc, label_C7C65
    ccf
    nop
    ccf
    nop
    inc  hl
    inc  e
    ld   b, c
    ld   a, $7F
    nop
    rst  8
    nop
    ld   sp, $E2CE

label_C7C65::
    inc  e
    db   $F4 ; Undefined instruction
    db   $E8 ; add  sp, d
    cp   $14
    rst  $38
    ld   b, $FB
    ld   b, $F9
    ld   b, $E9
    ld   d, $0F
    ld   a, [$FF1C]
    ld   [$FFFC], a
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    rrca
    nop
    ld   a, [$FF0F]
    sub  a, $29

label_C7C86::
    adc  a, [hl]
    ld   [hl], e
    add  a, c
    ld   a, [hl]
    add  a, e
    ld   a, l
    ld   [hl], a
    dec  bc
    ld   a, a
    ldd  [hl], a
    ld   e, a
    jr   c, label_C7CCA
    ld   [label_71E], sp
    inc  e
    rlca
    ld   [label_707], sp
    nop
    inc  bc
    ld   bc, $0007
    ld   [rJOYP], a
    db   $10 ; Undefined instruction
    ld   l, b
    sub  a, b
    inc  e
    ld   [$FF8E], a
    ld   [hl], h
    cp   [hl]
    ld   c, b
    rst  $38
    jr   nc, label_C7CAE
    nop
    rst  $28
    ld   [hl], b
    rlca
    ld   a, [label_C7A87]
    rlca
    ld    hl, sp+$8F
    ld   [hl], b
    db   $FC ; Undefined instruction
    nop
    add  a, [hl]
    ld    hl, sp+$FE
    nop
    nop
    nop
    rrca
    nop
    ld   a, [$FF0F]
    sub  a, $29
    adc  a, [hl]
    ld   [hl], e

label_C7CCA::
    add  a, c
    ld   a, [hl]
    add  a, e
    ld   a, l
    ld   [hl], a
    dec  bc
    ld   a, a
    ldd  [hl], a
    ld   e, a
    jr   c, label_C7D0C
    dec  bc
    ld   e, $03
    inc  e
    inc  bc
    rrca
    nop
    inc  e
    rrca
    rra
    nop
    nop
    nop
    ld   [rJOYP], a
    db   $10 ; Undefined instruction
    ld   l, b
    sub  a, b
    inc  e
    ld   [$FF8E], a
    ld   [hl], h
    cp   $08
    rst  $38
    jr   nc, label_C7CF0
    nop
    cp   a
    ld   [hl], b
    ld   b, a
    cp   d
    rlca
    ld   a, [$B04F]
    ld   sp, hl
    ld   b, $79
    sbc  a, [hl]
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

label_C7D0C::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  c
    nop
    ld   a, a
    dec  b
    or   a
    ld   a, b
    or   c
    ld   c, [hl]
    cp   b
    ld   b, a
    ld   a, h
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
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld   [rLCDC], a
    ld   [$FFC0], a
    ret  nc
    jr   nz, label_C7D4F
    ld   [$FF7E], a
    ld   bc, $013E
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    ld   bc, label_235E
    ld   a, l
    ld   h, $5B
    dec  a
    rst  $38
    ld   b, e
    xor  a
    ld   d, a
    ld   a, b
    rla
    ld   [hl], l
    ld   a, [de]
    rst  $38
    ld   l, l
    rst  $38
    nop
    ld   l, b
    sub  a, b
    ld   l, b
    sub  a, b
    ld   [label_4F0], sp
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    adc  a, d
    ld   [hl], h
    adc  a, d
    db   $F4 ; Undefined instruction
    adc  a, $F0
    set  6, [hl]
    pop  de
    ld   l, [hl]
    jp   nc, label_FE6C
    ret  z
    rst  $38
    adc  a, [hl]
    rst  $38
    nop
    ld   c, $00
    rra
    ld   c, $1F
    ld   a, [bc]
    ld   e, $0D
    inc  l
    inc  de
    ld   b, b
    ccf
    ld   d, c
    cpl
    ld   a, b
    rla
    ccf
    ld   [label_275F], sp
    rst  $10
    ld   l, b
    sub  a, e
    ld   l, l
    ld   e, e
    dec  l
    ld   a, d
    dec  c
    rst  $28
    halt
    nop
    ld   c, $00
    rra
    ld   c, $1F
    ld   a, [bc]
    ld   e, $0D
    inc  l
    inc  de
    ld   b, b
    ccf
    ld   d, c
    cpl
    ld   e, b
    scf
    ccf
    jr   label_C7E22
    rra
    rst  $10
    ld   l, a
    sbc  a, b
    ld   h, a
    ld   e, a
    jr   z, label_C7E35
    dec  c
    rst  $28
    halt
    nop
    dec  de
    nop
    ccf
    dec  de
    ccf
    add  hl, bc
    ccf
    dec  de
    ld   e, e
    inc  h
    add  a, b
    ld   a, a
    sbc  a, b
    ld   a, a
    add  a, c
    ld   a, [hl]
    ld   a, [hl]
    ld   bc, label_3F7F
    rst  $38
    ld   b, c
    and  a
    ld   e, e
    ld   [hl], a
    dec  de
    ld   [hl], h
    dec  de
    rst  $38
    ld   l, h
    rst  $38
    nop
    add  a, b
    nop
    ld   [$FF80], a
    ret  nc
    and  b
    ret  c
    and  b
    add  a, h
    ld   a, b
    inc  [hl]
    ret  z
    inc  [hl]
    ret  z
    add  a, h
    ld   a, b
    call z, label_D2F0
    db   $EC ; Undefined instruction
    sub  a, e
    ld   l, [hl]
    sub  a, c
    ld   l, [hl]
    or   d
    ld   l, h
    or   [hl]
    ld   l, b
    rst  $30
    adc  a, $FF
    nop

label_C7E00::
    nop
    nop
    nop
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
    ld   bc, label_30D
    inc  d
    rrca
    add  hl, hl
    ld   e, $21
    ld   e, $20
    rra
    inc  de
    inc  c
    inc  c
    inc  bc
    dec  b
    inc  bc
    nop
    nop

label_C7E22::
    nop
    nop
    jr   label_C7E26

label_C7E26::
    dec  a
    jr   label_C7EA8
    dec  l
    ld   a, a
    dec  [hl]
    rst  $38
    add  hl, sp
    add  hl, sp
    add  a, $80
    rst  $38
    nop
    rst  $38
    ld   h, b

label_C7E35::
    sbc  a, a
    ld   b, b
    cp   a
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   h, e
    sbc  a, h
    db   $E3
    db   $E3 ; Undefined instruction
    rlca
    nop
    rrca
    ld   b, $FE
    dec  b
    rst  $38
    pop  hl
    db   $FD ; Undefined instruction
    sub  a, $FA
    or   a
    ld    hl, sp+$67
    db   $EC ; Undefined instruction
    rst  $18
    ret  c
    ccf
    nop
    rst  $38
    inc  e
    db   $E3 ; Undefined instruction
    ld   a, [hli]
    push de
    ld   a, [hl]
    sub  a, l
    cp   h
    ld   d, e
    or   $0F
    db   $FD ; Undefined instruction
    cp   $00
    nop
    ld   a, [$FF00]
    ld   a, [$FFE0]
    ld   a, [$FFE0]
    ret  c
    ld   [$FFB8], a
    ld   d, b
    adc  a, h
    ld   [hl], b
    halt
    inc  sp
    adc  a, $3B
    add  a, $3B
    add  a, $37
    adc  a, $7D
    sbc  a, [hl]
    halt

label_C7E7C::
    call c, label_B860
    ret  nz
    ld   b, $01
    rra
    nop
    daa
    inc  e
    ld   c, e
    ld   [hl], $4F
    jr   nc, label_C7EDA
    inc  a
    ld   c, [hl]
    ld   sp, label_1D2F
    dec  a
    inc  bc
    dec  h
    dec  de
    inc  hl
    dec  e
    ld   [de], a
    dec  c
    rra
    nop
    ccf
    ld   d, $7C
    cpl
    ld   a, a
    nop
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    cp   a
    ld   a, a
    ld   [$FF1F], a

label_C7EA8::
    ld   a, a
    ret  nz
    ccf
    call c, label_3EFF
    ld   a, a
    cp   [hl]
    rst  $38
    cp   [hl]
    cp   $DD
    db   $FD ; Undefined instruction
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, [hl]
    ld   a, a
    rst  $38

label_C7EBD::
    nop
    rst  $38
    nop
    ei
    db   $FD ; Undefined instruction
    rst  $28
    pop  af
    scf
    ret  z
    and  $1B
    cp   [hl]
    rst  0
    ld   a, $C1
    call c, label_C5C2B
    rst  $28
    ld   l, [hl]
    pop  af
    xor  $F7
    rst  $28
    ld   a, [$FFC8]
    rst  $30
    sub  a, a
    db   $E8 ; add  sp, d

label_C7EDA::
    cpl
    sub  a, $F3
    rrca
    rst  $38
    nop
    ld   a, h
    add  a, b
    ld   c, h
    or   b
    sbc  a, h
    ld   a, b
    jp   z, label_C423C
    cp   h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   h, $D8
    ld   a, $C0
    ld   a, h
    add  a, b
    db   $FC ; Undefined instruction
    ld   b, b
    rst  $38
    ld   h, b
    cp   l

label_C7EF9::
    ld   [hl], d
    rst  $18
    cp   d
    rst  $28
    ld   e, [hl]
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
    inc  bc
    nop
    dec  c
    inc  bc
    db   $3A ; ldd  a, [hl]
    dec  c
    ld   d, d
    dec  a
    ld   b, b
    ccf
    ld   b, e
    inc  a
    inc  h
    dec  de
    rla
    dec  bc
    rrca
    inc  bc
    rlca
    nop
    inc  b
    inc  bc
    nop
    nop
    jr   label_C7F24

label_C7F24::
    dec  a
    jr   label_C7FA6
    dec  l
    ld   a, a
    dec  [hl]
    rst  $38
    add  hl, bc
    jp   [hl]
    or   $60
    sbc  a, a
    ld   b, b
    cp   a
    nop
    rst  $38
    ld   [$FF1F], a
    sbc  a, h
    ld   h, e
    ld   a, [$FD6D]
    ld   l, [hl]

label_C7F3C::
    rst  $38
    nop
    cp   $FF
    rlca
    nop
    rst  $38
    ld   b, $FE
    push hl
    rst  $38
    pop  de
    ld   sp, hl
    or   [hl]
    db   $FC ; Undefined instruction
    ld   l, a
    db   $FC ; Undefined instruction
    rst  $18
    ret  nc
    ccf
    ld   b, $F9
    inc  b
    ei
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  b
    ei
    adc  a, [hl]
    ld   [hl], e
    db   $FD ; Undefined instruction
    ld   c, $00
    nop
    ld   a, [$FF00]
    ld   a, [$FFE0]
    ld   a, [$FFE0]
    ret  c
    ld   [$FFB8], a
    ld   d, b
    adc  a, h
    ld   [hl], b
    halt
    inc  sp
    adc  a, $3B
    add  a, $3B
    add  a, $37
    adc  a, $7D
    sbc  a, [hl]
    halt
    call c, label_B860
    ret  nz
    rlca
    nop
    ld   [label_1607], sp
    rrca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    add  hl, bc
    ld   b, $07
    ld   bc, label_205
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    dec  b
    inc  bc
    rlca
    inc  bc
    dec  b
    inc  bc
    ld   c, $00
    rst  $18
    ld   c, $3F
    ret  z

label_C7FA6::
    add  hl, bc
    or   $00
    rst  $38
    ld   [$FF1F], a
    ld   a, [$FFAF]
    db   $FC ; Undefined instruction
    or   e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    call nz, label_B73B
    ld   a, a
    and  [hl]
    ld   a, a
    sub  a, b
    ld   l, a
    rst  $38
    add  a, b
    ld   a, b
    nop
    db   $FC ; Undefined instruction
    ld   a, b
    rst  $38
    call nz, label_BAFD
    cp   $67
    ld   l, h
    sbc  a, a
    nop
    rst  $38
    nop
    rst  $38
    ld   [$FF1F], a
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, h
    add  a, e
    inc  a
    jp   label_E31C
    halt
    cp   l
    ld   a, [hl]
    nop
    nop
    ld   [rJOYP], a
    ld   h, b
    ret  nz
    db   $FC ; Undefined instruction

label_C7FE7::
    ret  nz
    db   $FC ; Undefined instruction
    jr   c, label_C7FE7
    ld   a, b
    cp   $30
    ld   e, [hl]
    xor  h
    ldi  [hl], a
    call c, label_C03F
    rra
    ldh  [$FF0C], a
    dec  de
    and  $1B
    and  $35
    adc  a, $DA
    inc  a
    db   $F4 ; Undefined instruction
    ld    hl, sp+$2B
