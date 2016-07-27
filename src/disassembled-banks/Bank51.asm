section "bank51",romx,bank[$33]

label_CC000::
    nop
    nop
    add  hl, sp
    add  hl, sp
    dec  h
    dec  h
    dec  h
    dec  h
    add  hl, sp
    add  hl, sp
    ld   hl, label_2121
    ld   hl, $0000
    nop
    nop
    inc  c
    inc  c
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   e, $1E
    ld   [de], a
    ld   [de], a
    jp   nc, label_D2
    nop
    nop
    nop
    adc  a, e
    adc  a, e
    adc  a, d
    adc  a, d
    ld   d, e
    ld   d, e
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    inc  hl
    inc  hl
    nop
    nop
    nop
    nop
    cp   b
    cp   b
    inc  h
    inc  h
    and  h
    and  h
    jr   c, label_CC072
    inc  h
    inc  h
    and  h
    and  h
    nop
    nop
    ccf
    nop
    ret  nz
    ccf
    or   a
    rst  $38
    ld   b, e
    rst  $38
    nop
    rst  $38
    ld   b, a
    rst  $38
    rst  0
    rst  $38
    rrca
    rst  $38
    adc  a, a
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    sbc  a, [hl]
    rst  $38
    inc  c
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

label_CC072::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  [hl]
    rra
    jr   nc, label_CC0A3
    jr   nc, label_CC0A5
    ld   l, b
    ccf
    ld   l, h
    ccf
    ld   h, [hl]
    ccf
    ld   [hl], b
    rra
    ld   e, a
    cpl
    ld   bc, label_223E
    inc  e
    inc  d
    ld   [$001C], sp
    inc  e
    inc  e
    ldi  [hl], a
    ld   a, $2A
    ld   [hl], $1C
    inc  e
    ld   a, a
    rst  $38
    ld   a, a

label_CC0A3::
    rst  $38
    nop

label_CC0A5::
    rst  $38
    jr   label_CC0A7
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    pop  bc
    ld   a, $22
    inc  e
    inc  d
    ld   [$001C], sp
    inc  e
    inc  e
    ldi  [hl], a
    ld   a, $2A
    ld   [hl], $1C
    inc  e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    jr   label_CC0C7
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  0
    and  a
    db   $EC ; Undefined instruction
    rst  $28
    xor  e
    db   $EC ; Undefined instruction
    ret  nz
    and  b
    rst  0
    and  a
    xor  h
    rst  $28
    rst  8
    call z, label_FFFF
    rst  $38
    rst  $38
    nop
    rst  $38
    jr   label_CC0E7
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    db   $FD ; Undefined instruction
    ei
    rrca
    rst  $38
    ei
    rrca
    dec  b
    dec  bc
    push af
    ei
    inc  bc
    rst  $38
    push af
    dec  c
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, label_306
    ld   b, $03
    ld   b, $03
    dec  c
    rlca
    dec  c
    rlca
    inc  c
    rlca
    ld   a, [de]
    rrca
    dec  de
    rrca
    dec  de
    rrca
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    inc  bc
    ld   bc, $0103
    nop
    ld   bc, label_302
    ld   b, $03
    ld   b, $03
    dec  c
    rlca
    dec  c
    rlca
    inc  c
    rlca
    jr   label_CC14B
    db   $10 ; Undefined instruction
    nop
    nop
    ccf
    nop
    ret  nz
    ccf
    cp   d
    rst  $38
    ld   b, b
    cp   $08
    db   $FD ; Undefined instruction
    ld   bc, label_1CFD
    sbc  a, l
    ld   c, $FE
    adc  a, [hl]
    cp   $CF
    rst  $38
    rst  $18
    rst  $38
    sbc  a, [hl]
    rst  $38
    inc  a
    rst  $38

label_CC15A::
    jr   c, label_CC15A
    jr   nc, label_CC15A
    ld   [bc], a
    ld   a, [$008F]
    nop
    xor  a
    rlca
    ld   l, a
    and  e
    rst  $28
    nop
    rst  $28
    ld   a, [$FFF7]
    and  b
    rst  $30
    nop
    ld   [rIF], a
    rrca
    sbc  a, a
    rst  $18
    rra
    sbc  a, a
    rra
    cp   a
    rrca
    ccf
    rlca
    rra
    ret  nz
    rst  8
    add  a, b
    ld   [$FF34], a
    ld   e, $30
    rra
    jr   nc, label_CC1A5
    ld   l, h
    ccf
    ld   l, h
    ccf
    ld   h, [hl]
    ccf
    ld   a, [$FF1F]
    rst  $38
    rrca
    ld   b, c
    ld   a, $22
    inc  e
    inc  d
    ld   [$001C], sp
    jr   label_CC1B2
    jr   nz, label_CC1D4
    ldi  [hl], a
    ldd  [hl], a
    inc  c
    inc  c
    inc  b
    ld   b, $28
    db   $EC ; Undefined instruction
    ld   bc, $A0E9
    db   $E3 ; Undefined instruction
    ld   h, h
    rst  $20
    ld   c, [hl]
    rst  $28
    nop
    rst  8
    rst  8
    rst  8
    pop  bc
    ld   a, $22
    inc  e
    inc  d
    ld   [$0018], sp
    jr   label_CC1D2
    ldi  [hl], a
    db   $3A ; ldd  a, [hl]
    ldi  [hl], a
    ldi  [hl], a
    inc  e
    inc  e
    rrca
    adc  a, a
    ld   h, a
    ld   l, a
    inc  c
    rst  $28
    nop
    rst  $28
    inc  hl
    rst  $28
    ld   [hl], b
    di
    nop
    ld    hl, sp+$FE
    cp   $00
    nop

label_CC1D2::
    ld   b, h
    inc  h

label_CC1D4::
    ld   l, b
    ld   l, c
    inc  bc
    nop
    nop
    nop
    ld   b, a
    daa
    xor  h
    db   $ED ; Undefined instruction

label_CC1DE::
    ret  nz
    ret  nz
    sub  a, d
    sub  a, d
    jr   z, label_CC260
    ld   a, h
    ld   b, h
    cp   d
    add  a, $7C
    ld   b, h
    jr   z, label_CC268
    sub  a, d
    sub  a, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  0
    and  a
    db   $EC ; Undefined instruction
    rst  $28
    xor  e
    db   $EC ; Undefined instruction
    ret  nz
    and  b
    rst  0
    and  a
    xor  h
    rst  $28
    rst  8
    call z, label_0
    rst  0
    and  a
    db   $EC ; Undefined instruction
    rst  $28
    xor  e
    db   $EC ; Undefined instruction
    ret  nz
    and  b
    rst  0
    and  a
    xor  h
    rst  $28
    rst  8
    call z, label_0
    ld   bc, label_300
    ld   bc, $0102
    ld   b, $03
    nop
    nop
    nop
    ld   bc, label_302
    ld   b, $03
    nop
    ld   bc, label_818
    ld   a, [de]
    rrca
    jr   label_CC249
    scf
    rra
    ld   hl, $001F
    ld   bc, $0063
    add  a, b
    ld   h, a
    ld   h, [hl]
    rst  $20
    ret  nz
    ld   [$FF80], a

label_CC249::
    add  a, b
    nop
    inc  b
    nop
    sbc  a, h
    call z, label_8ECC
    adc  a, $87
    rst  $18
    ld   b, $3F
    ld   l, h
    ld   a, a
    ld   e, b
    ld   e, [hl]
    db   $10 ; Undefined instruction
    sub  a, b
    sbc  a, h
    ld   [bc], a
    add  a, d

label_CC260::
    add  a, a
    nop
    nop
    rlca
    ld   l, c
    ld   l, c
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction

label_CC268::
    ld   bc, label_3309
    scf
    jr   nz, label_CC2E5
    nop
    ld   [rIF], a
    rrca
    add  a, [hl]
    add  a, $10
    sub  a, b
    dec  e
    cp   l
    inc  c
    inc  a
    ld   bc, $C019
    res  0, b
    ld   [$FFD8], a
    ld   a, b
    ret  nc
    ld   a, a
    ret  nc
    ld   a, [hl]
    cp   b
    db   $FC ; Undefined instruction
    ld   h, b
    ld   sp, label_707
    ld   [rIF], a
    ld   [rJOYP], a
    ld   b, c
    ld   a, $22
    inc  b
    stop
    inc  b
    nop
    ld   [$0008], sp
    jr   label_CC29D

label_CC29D::
    stop
    nop
    inc  b
    ld   b, $28
    inc  l
    nop
    add  hl, hl
    nop
    and  e
    nop
    pop  hl
    adc  a, l
    db   $ED ; Undefined instruction
    nop
    call z, label_CCCC
    pop  bc
    ld   a, $22
    inc  d
    inc  b
    nop
    ld   [label_1000], sp
    db   $10 ; Undefined instruction
    jr   nz, label_CC2DD
    jr   nz, label_CC2C3
    inc  b
    inc  bc
    add  a, e
    ld   h, a

label_CC2C3::
    ld   h, a
    rlca
    rst  $20
    rlca
    rst  $20
    inc  bc
    db   $E3 ; Undefined instruction
    jr   nc, label_CC2BC
    nop
    ld   a, [$FF0E]
    ld   c, $00
    nop
    ld   b, h
    inc  h
    ld   c, b
    ld   c, c
    ld   bc, $0000
    nop
    ld   b, $26
    jr   nz, label_CC2FE
    add  a, b
    add  a, b
    nop
    nop
    ld   b, h
    ld   b, h
    db   $10 ; Undefined instruction

label_CC2E6::
    jr   c, label_CC310
    db   $10 ; Undefined instruction
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

label_CC2FE::
    nop
    nop
    nop
    nop
    db   $FD ; Undefined instruction
    ei
    rrca
    rst  $38
    ei
    rrca
    dec  b
    dec  bc
    push af
    ei
    inc  bc
    rst  $38
    push af
    dec  c

label_CC310::
    nop
    nop
    db   $FD ; Undefined instruction
    ei
    rrca
    rst  $38
    ei
    rrca
    dec  b
    dec  bc
    push af
    ei
    inc  bc
    rst  $38
    push af
    dec  c
    nop
    nop
    ld   bc, label_200
    nop
    ld   [bc], a
    ld   bc, $0104
    nop
    nop
    nop
    ld   bc, label_302
    nop
    ld   bc, $0000
    nop
    nop
    ld   a, [de]
    ld   c, $18
    inc  c
    dec  d
    dec  e
    nop
    nop
    nop
    nop
    ld   b, e
    nop
    add  a, b
    ld   b, l
    ld   b, b
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    inc  b
    inc  b
    jr   label_CC2E6
    adc  a, b
    adc  a, b
    ld   [bc], a
    ld   [bc], a
    ld   c, l
    ld   c, l
    inc  l
    inc  l
    ld   h, b
    ld   h, c
    ld   e, b
    ld   e, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [bc], a
    ld   [bc], a
    add  a, [hl]
    nop
    nop
    inc  b
    add  hl, hl
    add  hl, hl
    adc  a, h
    adc  a, h
    ld   bc, label_1009
    inc  d
    nop
    inc  d
    nop
    add  a, b
    rrca
    rrca
    add  a, b
    ret  nz
    db   $10 ; Undefined instruction
    dec  d
    sub  a, l
    nop
    nop
    ld   bc, $C009
    ret
    add  a, b
    ld   [rNR23], a
    jr   c, label_CC3DF
    ld   a, h
    ret  c
    ld   a, b
    or   b
    or   b
    nop
    nop
    dec  b
    dec  b
    ret  nz
    inc  c
    add  a, b
    nop
    ld   bc, $0006
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
    stop
    nop
    inc  b
    ld   b, $28
    inc  l
    ld   bc, $8209
    add  a, d
    nop
    nop
    dec  c
    dec  l
    nop
    nop
    call z, label_C1CC
    inc  b
    nop
    db   $10 ; Undefined instruction
    nop
    ld   [label_1000], sp
    db   $10 ; Undefined instruction
    jr   nz, label_CC3DD
    jr   nz, label_CC3C3
    inc  b
    ld   [bc], a
    add  a, d
    ld   b, h

label_CC3C3::
    ld   b, h
    add  a, b
    add  a, b
    nop
    nop
    inc  bc
    inc  bc
    add  a, b
    add  a, b
    nop
    sub  a, b
    ld   c, $0E
    nop
    nop
    inc  b
    inc  b
    ld   [$0008], sp
    nop
    nop
    nop
    ld   b, $26
    jr   nz, label_CC3FE
    add  a, b

label_CC3DF::
    add  a, b
    nop
    nop
    nop
    nop
    jr   z, label_CC40E
    stop
    jr   z, label_CC412
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_CC3FE::
    nop
    nop
    nop
    nop
    rst  0
    and  a
    db   $EC ; Undefined instruction
    rst  $28
    xor  e
    xor  h
    add  a, b
    add  a, b
    push bc
    and  l
    xor  h
    db   $ED ; Undefined instruction

label_CC40E::
    call z, label_CC
    nop

label_CC412::
    rst  0
    and  a
    db   $EC ; Undefined instruction
    rst  $28
    xor  e
    db   $EC ; Undefined instruction
    add  a, b
    add  a, b
    add  a, a
    add  a, a
    xor  h
    xor  $CC
    call z, label_0
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    ld   bc, $0000
    nop
    nop
    ld   [bc], a
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_CC440
    stop
    ld   bc, $0001
    nop
    nop
    nop

label_CC440::
    ld   [bc], a
    nop
    nop
    ld   b, h
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    inc  b
    inc  b
    db   $10 ; Undefined instruction
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    inc  b
    inc  b
    jr   nz, label_CC478
    ld   c, b
    ld   c, b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    ld   hl, $0021
    nop
    ld   bc, $0009
    nop
    nop
    inc  d
    nop
    add  a, b
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    dec  b
    dec  b

label_CC478::
    nop
    nop
    ld   bc, $8009
    add  a, c
    nop
    nop
    ld   [label_C28], sp
    inc  c
    add  a, b
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
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    inc  b
    inc  b
    jr   nz, label_CC4C4
    ld   bc, label_201
    ld   [bc], a
    nop
    nop
    ld   bc, $0021
    nop
    nop
    nop
    ld   b, c
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_CC4DC
    nop
    nop
    inc  b
    inc  b
    ld   [bc], a
    add  a, d
    inc  b
    inc  b

label_CC4C4::
    add  a, b
    add  a, b
    nop
    nop
    inc  bc
    inc  bc
    add  a, b
    add  a, b
    nop
    add  a, b
    ld   b, $06
    nop
    nop
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a

label_CC4DC::
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
    nop
    nop
    reti
    reti
    dec  c
    sbc  a, l
    add  hl, sp
    dec  c
    ld   bc, $F109
    ei
    inc  bc
    rst  $38
    push af
    dec  c
    nop
    nop
    db   $FD ; Undefined instruction
    ei
    rrca
    rst  $38
    ei
    rrca
    dec  b
    dec  bc
    ld   h, l
    ld   l, e
    inc  bc
    ld   h, e
    push bc
    dec  c
    nop
    nop
    jp   nz, label_88A2
    adc  a, b
    adc  a, b
    adc  a, h
    nop
    nop
    add  a, l
    add  a, l
    xor  h
    db   $EC ; Undefined instruction
    add  a, b
    add  a, b
    nop
    nop
    add  a, a
    add  a, a
    db   $E4 ; Undefined instruction
    and  $00
    nop
    nop
    nop
    add  a, h
    add  a, h
    add  a, b
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    rra
    dec  bc
    ccf
    dec  de
    inc  a
    dec  de
    ld   a, b
    scf
    ld   a, c
    ldd  [hl], a
    ld   [hl], c
    jr   nz, label_CC5B5
    nop
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
    nop
    nop
    ld   [bc], a
    ldi  [hl], a
    adc  a, b
    adc  a, b
    ld   [$000C], sp
    nop
    dec  b
    dec  b
    and  b
    ld   [$FF80], a
    add  a, b
    nop
    nop
    add  a, l
    add  a, l
    jr   nz, label_CC596
    nop
    nop
    nop
    nop
    add  a, h
    add  a, h
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
    rlca
    rlca
    ld   [label_F07], sp
    nop
    rlca
    ld   bc, $0000
    ld   bc, $0000
    nop
    nop

label_CC596::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    dec  bc
    inc  bc
    ld   b, $01
    inc  bc
    nop
    rlca
    inc  bc
    inc  b
    nop

label_CC5B5::
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_201
    inc  bc
    dec  b
    ld   bc, label_707
    dec  bc
    ld   [bc], a
    rrca
    nop
    ld   b, $00
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    jp   label_A8A3
    xor  c
    adc  a, b
    adc  a, h
    add  a, b
    add  a, b
    add  a, l
    add  a, l
    xor  h
    db   $ED ; Undefined instruction
    call z, label_CC
    nop
    add  a, a
    add  a, a
    db   $EC ; Undefined instruction
    rst  $28
    xor  d
    db   $EC ; Undefined instruction
    add  a, b
    add  a, b
    add  a, a
    add  a, a
    add  a, b
    ret  nz
    call z, label_CC
    nop
    sbc  a, c
    sbc  a, c
    nop
    nop
    ld   de, $0001
    nop
    pop  bc
    pop  bc
    nop
    add  a, h
    dec  b
    dec  c
    nop
    nop
    or   c
    or   e
    inc  b
    inc  b
    nop
    nop
    dec  b
    inc  bc
    jr   nz, label_CC65C
    nop
    nop
    add  a, c
    ld   bc, $0000
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF40]
    ld    hl, sp+$70
    cp   h
    ld   [hl], b
    ld   e, $F4
    ld   d, $EC
    ld   d, $68
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    nop
    nop

label_CC65C::
    ret  nz
    nop
    nop
    nop
    nop
    nop
    sub  a, c
    sub  a, c
    nop
    nop
    stop
    nop
    nop
    ld   b, c
    ld   b, c
    nop
    add  a, h
    inc  b
    inc  c
    nop
    nop
    ld   bc, label_403
    inc  b
    nop
    nop
    nop
    ld   [bc], a
    jr   nz, label_CC69C
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    rlca
    inc  c
    adc  a, e
    sbc  a, [hl]
    ld   e, l
    rst  $38
    sbc  a, b
    cp   $D9
    xor  a
    sbc  a, $73
    call label_CE11F
    ld   c, $1D
    rrca
    ld   e, $07
    rrca
    inc  c
    inc  bc

label_CC69C::
    rrca
    inc  c
    inc  d
    inc  d
    nop
    nop
    nop
    inc  c
    nop
    rlca
    inc  c
    dec  bc
    ld   e, $1D
    ccf
    jr   label_CC6EB
    reti
    rst  $28
    ld   e, $F3
    call label_C1BF
    ld   l, [hl]
    db   $FD ; Undefined instruction
    rst  8
    cp   $07
    rst  8
    inc  c
    inc  bc
    rrca
    inc  c
    inc  d
    inc  d
    nop
    inc  c
    nop
    rlca
    inc  c
    dec  bc
    ld   e, $1D
    ccf
    jr   label_CC709
    add  hl, de
    rrca
    ld   e, $13
    ld   l, l
    ccf
    pop  bc
    ld   l, [hl]
    cp   l
    ld   c, a
    cp   [hl]
    ld   h, a
    xor  a
    inc  l
    jp   label_AC0F
    inc  c
    call z, label_CCC0C
    nop
    inc  c
    nop
    rlca
    inc  c
    dec  bc
    ld   e, $1D
    ccf
    jr   label_CC709

label_CC6EB::
    ld   a, c
    ld   l, a
    sbc  a, [hl]
    di
    dec  c
    rst  $38
    pop  bc
    xor  [hl]
    db   $0F
    rrca
    cp   $07
    rrca
    inc  c
    inc  bc
    rrca
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c

label_CC700::
    nop
    nop
    sbc  a, c

label_CC703::
    sbc  a, c
    dec  c
    dec  e
    add  hl, de
    add  hl, bc
    nop

label_CC709::
    nop
    pop  af
    pop  af
    ld   bc, $C5E5
    dec  c
    nop
    nop
    cp   l
    cp   e
    dec  b
    dec  [hl]
    ld   bc, label_501
    inc  bc
    ld   h, h
    ld   l, d
    nop
    nop
    add  a, c
    ld   bc, $0000
    nop
    nop
    jr   c, label_CC726

label_CC726::
    ld   a, h
    jr   c, label_CC6C7
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
    jr   c, label_CC742

label_CC742::
    ld   a, h
    jr   c, label_CC703
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
    jr   nc, label_CC7AA
    jr   label_CC78C
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

label_CC78C::
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

label_CC7AA::
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

label_CC7CF::
    rrca
    ld   a, $19
    ld   a, l
    jr   c, label_CC84D
    jr   nc, label_CC7CF
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    ld   c, b
    jr   nc, label_CC817
    nop
    nop
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
    rst  $38
    ld   a, a
    rst  $38
    ld   [hl], a
    rst  $38
    ld   [hl], $FF

label_CC807::
    ld   b, $FF
    inc  b
    rst  $38
    inc  b
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    rst  $38
    rra
    rst  $38
    or   a
    rst  $38
    or   e
    rst  $38

label_CC817::
    and  d
    rst  $38
    ldi  [hl], a
    rst  $38
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    add  hl, bc
    rlca
    ld   [label_C07], sp
    inc  bc
    inc  b
    inc  bc
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
    nop
    rrca
    nop
    ld   a, a
    ld   bc, label_700
    nop
    rrca
    nop
    ld   e, $01
    inc  e
    inc  bc
    inc  e
    inc  bc
    add  hl, de

label_CC84D::
    rlca
    add  hl, bc
    rst  $20
    ld   [rJOYP], a
    ld    hl, sp+$00
    adc  a, $30
    inc  bc
    db   $FC ; Undefined instruction
    jr   c, label_CC859
    cp   $FF
    rst  $38
    jp   label_80FF
    inc  bc
    inc  bc
    rrca
    rrca
    rra
    ld   e, $1F
    jr   label_CC807
    ld   de, $8F50
    ld   hl, $8FDF
    rst  $38
    ret  nz
    ret  nz
    ld   a, [$FFF0]
    ld    hl, sp+$18
    db   $FC ; Undefined instruction
    inc  b
    ld   e, $E6
    ld   c, $F0
    rst  0
    ld    hl, sp+$F7
    ld    hl, sp+$00
    ld   c, $00
    ccf
    ld   e, $7F
    ld   a, a
    rst  $38
    rst  $38
    pop  hl
    rst  $38
    add  a, b
    jp   label_803C
    ld   a, a
    nop
    nop
    ld   bc, label_700
    add  a, b
    inc  c
    jp   label_F788
    reti
    rst  $20
    rst  $20
    ld   a, a
    rst  $28
    inc  e
    ld   a, h
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, $F0FE
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $1F
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ret  nz
    nop
    rst  0
    rlca
    rst  $18
    rra
    ld   a, a
    cp   b
    nop
    nop
    nop
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
    ld   a, [$FF30]
    ld   a, [$FF30]
    ld   [$FF60], a
    ld   [$FFE0], a
    ld   [$FFE0], a
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    cp   $1F
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $20
    inc  e
    rst  $20
    ld   a, l
    adc  a, [hl]
    ld   sp, hl
    ld   e, $F3
    inc  a
    db   $E3 ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    rra
    ld   a, c
    cp   $83
    db   $FC ; Undefined instruction
    rst  0
    cp   b
    rst  $38
    add  a, c
    rst  $38
    jp   label_FFFF
    sbc  a, a
    db   $FC ; Undefined instruction
    dec  de
    db   $E4 ; Undefined instruction
    add  hl, de
    and  $11
    xor  $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, c
    rst  $38
    ld   sp, hl
    rst  $38
    ld   [hl], a
    adc  a, b
    ld   h, [hl]
    sbc  a, c
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    adc  a, d
    rst  $38
    rst  8
    rst  $38
    nop
    ld   bc, label_300
    nop
    rlca
    ld   bc, $0107
    rrca
    inc  bc
    rrca
    ld   bc, $000F
    rlca
    inc  bc
    rst  $38
    ld   a, a
    cp   $FF
    ld   [$FFF8], a
    rst  0
    pop  af
    adc  a, a
    db   $E3 ; Undefined instruction
    sbc  a, a
    rst  $20
    sbc  a, [hl]
    rst  $20
    sbc  a, $C4
    rst  $38
    ld   a, [$FF7F]
    ld   a, [$FF3F]
    inc  hl
    rst  $18
    jp   label_E7FF
    ccf
    rst  $20
    ld   e, $87
    ld   a, [hl]
    inc  de
    db   $EC ; Undefined instruction
    nop
    rst  $38
    ret  nz
    rst  $38
    di
    rst  $38
    ld   sp, hl
    sbc  a, a
    db   $FD ; Undefined instruction
    rlca
    cp   $03
    jp   label_CF3D
    ld   a, h
    rst  $18
    jr   c, label_CC9C8
    cp   h
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   c, $FF
    rra
    rst  $38
    ccf
    rst  $38
    di
    inc  a
    ld   sp, hl
    ld   e, $FC
    rlca
    ld   e, $E7
    inc  c
    di
    jr   nz, label_CC97B
    ld   sp, $93FF
    rst  $38
    inc  e
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    add  a, [hl]
    rst  8
    inc  a
    cp   $79
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FE
    rst  $38
    rst  $38
    add  a, a
    rst  $38
    inc  bc
    rrca
    pop  af

label_CC99A::
    rlca
    ld    hl, sp+$F3
    db   $FC ; Undefined instruction
    ld   sp, hl
    cp   $FE
    rlca
    rra
    db   $E3 ; Undefined instruction
    rlca
    ld   sp, hl
    inc  bc
    db   $FD ; Undefined instruction
    add  a, e
    db   $FD ; Undefined instruction
    jp   label_C3FC
    rst  $38
    rst  8
    rst  $38
    ld   a, a
    ld   [$FFF0], a

label_CC9B3::
    rst  8
    ld   [$FF1F], a
    sbc  a, a
    ld   a, a
    ccf
    rst  $38
    ld   a, a
    db   $E3 ; Undefined instruction
    rst  $28
    sbc  a, $FF
    ld    hl, sp+$F0
    jr   nc, label_CC9B3
    db   $10 ; Undefined instruction
    sbc  a, b
    dec  sp
    ret  z

label_CC9C8::
    db   $FC ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    inc  e
    rst  $38
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    jr   c, label_CC99A
    ret  z
    ld   a, [$FFE4]
    ld    hl, sp+$F2
    inc  a
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
    ld   c, $1F
    inc  e
    ld   a, $31
    inc  a
    inc  sp
    inc  a
    inc  sp
    inc  e
    dec  de
    ld   a, b
    ld   bc, $9FE0
    jp   label_E3F
    db   $FD ; Undefined instruction
    ld   e, $F9
    ld   a, $F9
    ld   a, $F9
    ld   e, $F9
    add  a, b
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    rra
    db   $FC ; Undefined instruction
    ccf
    ld    hl, sp+$3F
    ld   a, [$FF3E]
    pop  af
    inc  e
    di
    sub  a, a
    ld   a, [hl]
    inc  de
    cp   $CB
    cp   $F7
    ld   a, $FF
    rlca
    inc  bc
    rst  $38
    add  hl, bc
    rst  $38
    ld   a, a
    rst  $38
    add  a, c
    ld   a, [hl]
    ld   e, $FF
    ccf
    rst  $38
    ld   a, h
    db   $E3 ; Undefined instruction
    ld   [hl], b
    rst  8
    ld   [hl], e
    rst  8
    ld   sp, hl
    rst  0
    ld   a, a
    ld   a, [$FF3F]
    ld   a, [$FF7F]
    ld   [$FF78], a
    rst  0
    ld   a, [$FFCF]
    ld   h, b
    sbc  a, a
    db   $E3 ; Undefined instruction
    sbc  a, a
    rst  0
    cp   a
    rst  8
    cp   b
    rst  $10
    rst  $38
    rst  0
    ld   a, h
    rst  $28
    jr   c, label_CCAF6
    sbc  a, b
    inc  e
    di
    adc  a, c
    rst  $30
    set  6, a
    rst  $38
    ld   l, a
    rst  $38
    rlca
    rst  $38
    ld   bc, $00FF
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   a, [$FFFF]
    ld   sp, hl
    cp   $FD
    adc  a, [hl]
    db   $E6
    and  $CD
    or   $FF
    ccf
    rst  $38
    add  a, a
    ld   a, a
    jp   label_E937
    and  a
    ld   a, b
    rst  $38
    ld   [hl], b
    rst  $38
    ld   b, b
    ld   [$FF5F], a
    adc  a, $7F
    rst  $38
    rst  $38
    rst  $38
    jp   label_F7EF
    rst  $28
    ld   a, [$FFFC]
    ld   a, e
    db   $FC ; Undefined instruction
    rra
    rst  $38
    rrca
    rra
    and  $1E
    db   $E3 ; Undefined instruction
    adc  a, a
    di
    rst  0
    ld   a, [label_CF8F7]
    ld   a, $C3
    rrca
    di
    rst  0
    ld   sp, hl
    db   $E3 ; Undefined instruction
    ld   a, l
    rst  $38
    ld   a, l
    rst  $38
    jp   label_1FF
    rlca
    ld    hl, sp+$FA
    inc  e
    ld   a, $CC
    inc  a
    call z, label_E7DC
    ld   e, [hl]
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  0
    rst  $38
    pop  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   a, [$FF80]
    ld    hl, sp+$C0
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    ld   [$FFF0], a
    ld   a, [$FFF8]
    ld   a, [$FFF8]

label_CCAF6::
    ld    hl, sp+$FC
    ld    hl, sp+$FC
    db   $FC ; Undefined instruction
    cp   $FC
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rlca
    ld   b, $0E
    add  hl, bc
    inc  e
    inc  de
    add  hl, sp
    scf
    ld   [hl], e
    ld   l, a
    rrca
    rrca
    db   $FC ; Undefined instruction
    rst  $38
    call c, label_3833
    rst  $20
    ld   [hl], c
    rst  $28
    pop  af
    rst  8
    pop  af
    adc  a, a
    ld   a, [$FF8F]
    sbc  a, a
    db   $FC ; Undefined instruction
    rlca
    cp   $7F
    rst  $38
    rst  $38
    ld   [$FFFC], a
    jp   label_C3FC
    db   $FD ; Undefined instruction
    db   $E3 ; Undefined instruction
    cp   $FD
    sbc  a, h
    ld   [hl], e
    call z, label_C43B
    cp   e
    or   $09
    rst  $18
    inc  a
    ccf
    ld    hl, sp+$EF
    rst  $38
    ld   c, $FF
    rst  $38
    cp   $FF
    db   $E4 ; Undefined instruction
    rst  $30
    call z, label_DF67
    ld   h, a
    sbc  a, a
    db   $E3 ; Undefined instruction
    rra
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    inc  a
    rst  $38
    ld   bc, rIE
    inc  bc
    cp   $07
    db   $FC ; Undefined instruction
    rst  $38
    pop  af
    rst  $38
    ld   [bc], a
    db   $FD ; Undefined instruction
    rra
    pop  hl
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    ld    hl, sp+$C7
    pop  af
    rst  8
    pop  af
    rst  8
    ld   sp, hl
    add  a, a
    ld   a, b
    add  a, a
    ld   a, [hl]
    pop  hl
    ld   a, a
    ld   a, [$FF7F]
    set  7, a
    sbc  a, b
    rst  $30
    adc  a, h
    di
    rst  8
    ei
    rst  $38
    db   $F4 ; Undefined instruction
    ei
    ld   c, $F1
    ld   a, a
    adc  a, b
    db   $FD ; Undefined instruction
    ld   c, $F1
    ld   c, $E1
    ld   a, $E3
    db   $FC ; Undefined instruction
    rst  0
    ld   sp, hl
    rlca
    ld   sp, hl
    rra
    db   $E3 ; Undefined instruction
    rst  $38
    rlca
    or   e
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    rst  $20
    ld    hl, sp+$87
    ei
    adc  a, a
    di
    ld   a, a
    rst  $38
    ld   e, $FF
    inc  a
    rst  8
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    pop  af
    cp   $DF
    ld   [$FFDF], a
    db   $FC ; Undefined instruction
    ld   l, a
    sbc  a, a
    ld   [$FF5F], a
    ld    hl, sp+$47
    db   $FD ; Undefined instruction
    dec  sp
    ei
    rra
    ld    hl, sp+$1F
    ld    hl, sp+$3F
    di
    rst  $38
    rst  0
    ei
    rlca
    ld   sp, hl
    rrca
    pop  af
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    rst  $20
    ld    hl, sp+$DF
    pop  hl
    ld   a, a
    adc  a, a
    rst  $38
    ld   a, h
    adc  a, a
    ld   a, [$FFFF]
    add  a, c
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    pop  hl
    cp   $FD
    sbc  a, $FF
    rst  0
    adc  a, a
    di
    rst  0
    ld    hl, sp+$C7
    ld    hl, sp+$C7
    ld    hl, sp+$F0
    ld   a, h
    ld   a, [$FF3C]
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, $C3
    add  a, e
    db   $FD ; Undefined instruction
    ld   sp, hl
    cp   $ED
    cp   $ED
    cp   $00
    nop
    nop
    nop
    ret  nz
    nop
    ld   [hl], b
    add  a, b
    cp   h
    ret  nz
    sbc  a, $E0
    add  a, $78
    rst  $20
    ld   a, b
    ld   [hl], e
    ld   c, a
    ld   a, [$FFCF]
    ld   a, [$FFCF]
    ei
    db   $E4 ; Undefined instruction
    rst  $38
    ld   [rIE], a
    di

label_CCC0C::
    ld   a, a
    ld   a, a
    ld   a, $3E
    db   $FC ; Undefined instruction
    jp   label_F9FE
    rlca
    rst  $38
    rst  $38
    rlca
    rst  $38
    ccf
    pop  af
    rst  $30
    ret
    rst  0
    add  hl, bc
    rlca
    ld   a, a
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rst  8
    ccf
    rst  0
    ccf
    ret  nz
    ccf
    ld   [$FF1F], a
    ld   a, [$FF0F]
    rst  $38
    nop
    nop
    rst  $38
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    ret  nz
    rst  $18
    pop  hl
    ld   e, $FD
    ccf
    call z, label_1CFF
    rst  $38

label_CCC3F::
    ld   a, $FC
    inc  bc
    rst  $38
    ld   b, b
    rst  $38
    ld   [hl], b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   a, a
    add  a, a
    cp   $1F
    cp   $3F
    db   $FC ; Undefined instruction
    rst  $38
    ld   sp, hl
    cp   $E3
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rra
    pop  hl
    ccf
    db   $FC ; Undefined instruction
    rra
    rst  $38
    adc  a, a
    ld   a, a
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    cp   a
    rst  $38
    rst  $38
    inc  a
    db   $EB ; Undefined instruction
    rst  $30
    adc  a, c
    rst  $30
    jr   c, label_CCC3F
    db   $FC ; Undefined instruction
    inc  de
    rst  $38
    jr   nc, label_CCC7C
    ld    hl, sp+$BF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$F8
    ld   a, [$F8FA]
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
    ld   a, [$FAFA]
    ld   a, [rIE]
    cp   $71
    rst  $38
    ld   a, b
    rst  $28
    ld   a, [hl]
    rst  $20
    rst  $38
    pop  af
    rst  $28
    cp   b
    rst  $20
    cp   $71
    rst  $18
    ld    hl, sp+$3F
    jp   label_7FF
    rst  $38
    ccf
    rst  $38
    rst  $38
    cp   $FF
    jr   c, label_CCCBB
    nop
    rst  $38
    ld   bc, $FFFE
    adc  a, a
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    ld   a, a
    add  a, b
    ld   e, a
    cp   a
    rst  $38
    rlca
    rst  $38
    ld   [hl], b
    rst  $18
    ld   a, a
    add  a, a
    ld    hl, sp+$0F
    pop  af
    ccf
    pop  bc
    rst  $38
    inc  bc
    rst  $38
    rrca
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, a
    ld    hl, sp+$FF
    di
    db   $FC ; Undefined instruction
    rst  $38
    ld   [rIE], a
    rst  $38
    rst  $20
    rst  $38
    ld    hl, sp+$C7
    cp   a
    ret  nz
    ld   [hl], a
    sub  a, b
    ld   [hl], b
    sub  a, b
    db   $E3 ; Undefined instruction
    ld   a, h
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    jp   label_7FC
    ld    hl, sp+$3E
    ret  nz
    db   $FC ; Undefined instruction
    nop
    ld   [rJOYP], a
    nop
    nop
    jr   label_CCD04

label_CCD04::
    inc  e
    nop
    inc  e
    nop
    inc  d
    inc  e
    inc  d
    inc  e
    jr   label_CCD26
    and  h
    cp   [hl]
    ld   b, e
    rst  $38
    and  h
    cp   [hl]
    jr   label_CCD2E
    inc  d
    inc  e
    inc  d
    inc  e
    inc  e
    nop
    inc  e
    nop
    jr   label_CCD20

label_CCD20::
    nop
    nop
    nop
    nop
    jr   label_CCD26

label_CCD26::
    inc  e
    nop
    inc  d
    inc  e
    inc  d
    inc  e
    inc  d
    inc  e

label_CCD2E::
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
    jr   label_CCD3E

label_CCD3E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_CCD48

label_CCD48::
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
    jr   label_CCD5C

label_CCD5C::
    nop
    nop
    nop
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
    jr   label_CCD8C

label_CCD8C::
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
    jr   label_CCD98

label_CCD98::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   label_CCEF1
    ld   h, b
    rra
    add  a, h
    ld   a, a
    jr   label_CCEEF
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
    nop
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
    ld   de, label_CC0E7
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
    nop
    di
    nop
    pop  bc
    nop
    add  a, b
    ld   e, $FF
    ld   b, b
    cp   a
    ld   h, c
    sbc  a, $7F
    ret  nz
    ccf
    db   $E3 ; Undefined instruction
    inc  e
    cp   $24
    cp   h
    ld   [label_F18], sp
    rst  $38
    add  a, $3F
    and  b
    rst  $18
    cp   b
    rst  0
    rra
    ld   [rIF], a
    jr   nc, label_CCF84
    nop
    nop
    nop
    rst  0
    ld   sp, hl
    adc  a, a
    di

label_CCF84::
    rra
    db   $E3 ; Undefined instruction
    ccf
    rst  0
    cp   $0F
    db   $FC ; Undefined instruction
    rra
    sbc  a, c
    rra
    ld   b, $06
    sbc  a, a
    pop  hl
    ccf
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    jr   label_CCF61
    rrca
    add  a, b
    rlca
    nop
    ld   bc, $CF00
    db   $FC ; Undefined instruction
    adc  a, a
    rst  $38
    rla
    rst  $28
    add  hl, sp
    rst  0
    ld   a, b
    add  a, e
    ld   a, [$FF01]
    ld   [rJOYP], a
    add  a, b
    nop
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
    nop
    inc  a
    pop  hl
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
    jr   label_CCFF4

label_CCFF4::
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
    rst  $38
    rrca
    rst  $38
    rrca
    ld   a, a
    rrca
    ld   a, a
    rrca
    ccf
    jr   nc, label_CD02A
    db   $10 ; Undefined instruction
    nop
    inc  bc
    nop
    rst  $38
    rrca
    rst  $38
    rrca
    cp   $0E
    cp   $0E
    db   $FC ; Undefined instruction
    ld   a, [$FFF8]
    ld   a, [$FFF0]
    ld   a, [$FFC0]
    ret  nz
    inc  bc
    inc  bc
    rrca
    rrca
    rra
    rra
    ccf
    cpl
    ld   a, a
    ld   [hl], b

label_CD02A::
    ld   a, a
    ld   [hl], b
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FF03]
    nop
    rrca
    nop
    rra
    nop
    cpl
    db   $10 ; Undefined instruction
    rrca
    ld   [hl], b
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    nop
    ret  nz
    nop
    ld   a, [$FF08]
    ld   a, [$FF0C]
    ld   a, [$FFF0]
    ld   c, $F0
    ld   c, $F0
    rrca
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
    inc  bc
    rlca
    jr   label_CD061

label_CD061::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_700
    nop
    ld   [hl], c
    ret  nz
    inc  a
    ld   h, b
    sbc  a, [hl]
    nop
    nop
    nop
    nop
    rrca
    nop
    ld   [$FF1F], a
    add  a, b
    ld   a, a
    ld   a, l
    add  a, d
    ccf
    ret  nz
    rra
    ld   [rJOYP], a
    rrca
    ld   [bc], a
    ld   a, l
    ld   bc, $81FE
    ld   a, [hl]
    add  a, b
    ld   a, a
    ret  nz
    ccf
    ld   h, b
    sbc  a, a
    ldi  [hl], a
    db   $7E
    ld   a, [hl]
    cp   a
    inc  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$07
    ld   a, b
    add  a, a
    dec  a
    jp   nc, label_CEEBB
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    xor  d
    ld   d, l
    rst  $10
    ld   l, b
    rst  $28
    sub  a, d
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    xor  c
    ld   d, [hl]
    ld   d, l
    cp   e
    cp   [hl]
    ld   l, c
    nop
    nop
    nop
    ld   [$FF7C], a
    add  a, e
    inc  a
    jp   label_F708
    ld    hl, sp+$07
    ld   a, [$FF5F]
    ld   [$FFBF], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$FF28], a
    db   $F4 ; Undefined instruction
    ld   h, $F9
    ld   hl, label_CD8FE
    rst  $20
    nop
    nop
    nop
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
    ld   b, b
    ld   [rJOYP], a
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF0E]
    ld   a, [$FF0E]

label_CD0F7::
    ld   a, [$FFF0]
    inc  c
    ld   a, [$FF08]
    ld   a, [$FF00]
    ret  nz
    nop
    rst  8
    jr   nc, label_CD102
    nop
    rst  $38
    ld   [label_CFF], sp
    cp   $F1
    cp   $F1
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FF0F]

label_CD111::
    di
    rrca
    rst  $38
    rra
    rst  $28
    ccf
    rst  8
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [hl], b
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FF03]
    nop
    rrca
    nop
    rra
    nop
    cpl
    db   $10 ; Undefined instruction
    inc  de
    ld   a, [hl]
    ld   sp, label_CF0FF
    rst  $38
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
    inc  bc
    nop
    rrca
    nop
    rra
    jr   nz, label_CD141

label_CD141::
    nop
    ld   bc, label_F00
    nop
    ccf
    nop
    rst  $38
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    pop  bc
    ld   a, $30
    ld   c, a
    adc  a, c
    db   $76 ; Halt
    adc  a, b
    ld   [hl], a
    sub  a, b
    ld   l, a
    db   $10 ; Undefined instruction
    dec  h
    jp  c, label_956A
    rst  $10
    jr   z, label_CD111
    ld   c, a
    ld   [hl], b
    adc  a, a
    adc  a, d
    ld   [hl], l
    ld   a, h
    add  a, e
    xor  b
    ld   e, l
    ld   a, b
    sbc  a, b
    db   $E8 ; add  sp, d
    ld   c, b
    ld    hl, sp+$B8
    rra
    ld   h, b
    rrca
    ld   [hl], $1F
    xor  [hl]
    ld   e, a
    and  $5F
    db   $E3 ; Undefined instruction
    ld   l, a
    pop  af
    ld   [hl], a
    ld    hl, sp+$7B
    db   $FC ; Undefined instruction
    dec  e
    ld   a, [$FF00+C]
    ld   [label_607], sp
    ccf
    ccf
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  a
    inc  a
    ld   e, a
    and  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   [hl], b
    rrca
    rrca
    inc  b
    inc  b
    rst  $38
    rst  8
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
    ld   [$FF08], sp
    cp   a
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
    rst  $38
    db   $10 ; Undefined instruction
    push de
    ld   a, [hli]
    xor  d
    ld   d, l
    rst  $38

label_CD1C5::
    ld   bc, label_2FE
    db   $FD ; Undefined instruction
    dec  c
    pop  af
    ld   sp, $C0C0
    jr   nc, label_CD200
    ld   c, a
    ld   a, [$FF8F]
    ld   a, [$FF87]
    ld    hl, sp+$F3
    ld   c, $FF
    add  a, c
    rst  $38
    ld    hl, sp+$FF
    cp   $FF
    cp   $20
    ret  nc
    ret  nz
    jr   c, label_CD1C5
    inc  e
    ld   [rNR12], a
    ld   [$FF99], a
    ret  nz
    db   $FC ; Undefined instruction
    add  a, b
    ld   a, b
    nop
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
    add  a, b
    nop
    ld   b, b
    nop
    jr   nz, label_CD210
    pop  af
    rst  8
    scf
    rst  $28
    rra
    rst  $28
    rra
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FF8F]
    ld   [hl], b
    adc  a, a
    ld   [hl], b
    adc  a, $30
    adc  a, $30
    ld   a, [$FFCC]
    ld   a, [$FFC8]
    ld   a, [$FF80]
    ret  nz
    nop
    nop
    nop
    nop
    ld   bc, label_700
    ld   bc, label_20E
    dec  e
    dec  b
    db   $3A ; ldd  a, [hl]
    ld   a, [de]
    ld   h, l
    inc  b
    ld   a, e
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    rra
    ld   [$FF81], a
    ld   a, [hl]
    ld   c, d
    or   l
    ld   d, a
    xor  [hl]
    xor  a
    ld   e, c
    rst  $38
    sub  a, [hl]
    ld   c, $F1
    ld   a, l
    add  a, d
    xor  a
    ld   d, b
    ld   e, a
    and  b
    rst  $38
    ld   b, $FF
    add  hl, bc
    rst  $38
    ld   d, $F6
    sub  a, [hl]
    cp   a
    ld   b, b
    rst  $38
    inc  c
    cp   $12
    rst  $38
    dec  l
    db   $ED ; Undefined instruction
    dec  l
    db   $D3 ; Undefined instruction
    inc  de
    adc  a, a
    adc  a, a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $B1
    cp   $51
    db   $FC ; Undefined instruction
    inc  hl
    db   $FC ; Undefined instruction
    ld   b, e
    ld   sp, hl
    rst  0
    di
    adc  a, a
    db   $E3 ; Undefined instruction
    rra
    db   $DB
    daa
    dec  a
    cp   $9E
    ld   a, a
    rst  $18
    ccf
    rrca
    rst  $38
    jp   label_EDFF
    rst  $38
    jp   [hl]
    rst  $30
    di
    rst  $38
    rst  $38
    inc  e
    rst  $38
    inc  bc
    ld   a, a
    add  a, e
    sbc  a, a
    ld   [$FFE3], a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  a
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    ccf
    rst  $38
    nop
    rrca
    ld   a, [$FFA0]
    rst  $38
    cp   e
    rst  $38
    rst  $38
    inc  e
    rst  $38
    ld   a, $FF
    ld   a, a

label_CD2A6::
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    or   a
    rst  $38
    rst  $38
    jr   label_CD2B2
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    nop
    ld   [$FF65], a
    ld   [label_3CFF], a
    rst  $38
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    nop
    ld   [rJOYP], a
    ld   a, [bc]
    dec  d
    nop
    rst  $38
    cp   $FD
    rst  $38
    ld    hl, sp+$FE
    ld   bc, label_2FC
    ld   [rJOYP], a
    inc  b
    dec  bc
    xor  d
    ld   d, l
    ld   bc, $00FE
    ld   [rJOYP], a
    ret  nz
    nop
    nop
    nop
    jr   z, label_CD2E9

label_CD2E9::
    ld   d, h
    nop
    ld   a, [label_CFD80]
    ld   d, b
    xor  [hl]
    nop
    jr   nz, label_CD2F3

label_CD2F3::
    stop
    stop
    ld   [label_400], sp
    nop
    inc  b
    nop
    ld   b, $00
    add  a, d
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FFF0]
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    inc  c
    rlca
    jr   label_CD33A
    jr   nz, label_CD35C
    ld   b, a
    ld   a, a
    adc  a, b
    rrca
    pop  af
    rlca
    jr   c, label_CD2A6
    ld   b, [hl]
    db   $FC ; Undefined instruction
    rrca
    rst  $38
    ccf
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   [$FF1F], a
    rst  $38
    sub  a, $FF
    dec  a
    ld   a, a
    inc  bc
    ccf
    add  a, b
    add  a, a
    ld    hl, sp+$F0
    rst  $38
    rst  $38
    rst  $38
    rrca
    rrca
    rst  $38
    adc  a, c
    rst  $38
    rlca
    rst  $38
    ld    hl, sp+$FF
    nop
    cp   $01
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [rIE], a
    nop
    db   $FC ; Undefined instruction
    inc  bc
    pop  bc
    ld   a, $1C
    rst  $38
    rst  $38
    rst  $38

label_CD35C::
    cp   $FF
    cp   $FF
    add  a, c
    ld   a, a
    ld   sp, $BCFF
    ld   a, a
    cp   e
    ld   a, a
    db   $3A ; ldd  a, [hl]
    db   $FD ; Undefined instruction
    inc  a
    rst  $38
    rst  $18
    rst  $38
    sbc  a, a
    ld   a, a
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

label_CD37A::
    rst  $30
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $30
    pop  bc
    di
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  0
    rst  $28
    add  a, e
    rst  $20
    or   e
    rst  8
    cp   e
    rst  $30
    rst  $10
    rst  $38
    sbc  a, e
    rst  $38
    jp  c, label_D9FF
    rst  $38
    db   $DB
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    sbc  a, $FF
    db   $FF
    rst  $38
    ld   a, e
    rst  $38
    db   $ED ; Undefined instruction
    rst  $38
    sub  a, $FF
    or   a
    rst  $38
    cp   e
    rst  $38
    ld   a, l
    cp   $FE
    pop  af
    db   $FD ; Undefined instruction
    add  a, b
    and  b
    rst  $28
    and  b
    rst  $28
    or   b
    push af
    jr   nc, label_CD37A
    ld   a, [$FF05]
    ld   a, [$FF02]
    ld   a, [$FF00]
    or   b
    nop
    nop
    rst  $38
    nop
    ld   [label_CD500], a
    nop
    xor  d
    nop
    ld   d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    cp   a
    nop
    ld   d, a
    nop
    xor  d
    nop
    dec  b
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    jr   z, label_CD3B9
    inc  d
    db   $EB ; Undefined instruction
    ld   a, [bc]
    push af
    inc  b
    ei
    ld   [bc], a
    ld   a, l
    ld   bc, $00BE
    ld   d, a
    nop
    rrca
    nop
    ld   b, d
    nop
    and  a
    nop
    ld   e, a
    nop
    cp   a
    ld   [label_1877], sp
    rst  $20
    inc  a
    jp   label_83FC
    nop
    inc  bc
    ld   bc, $0006
    rlca
    rlca
    ld   c, $07
    ld   b, $03
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $F801
    rlca
    rlca
    db   $FD ; Undefined instruction
    ld   a, a
    db   $FF
    rst  $38
    sbc  a, $FE
    rst  $28
    ld   a, [$FF6F]
    rst  0
    ld   a, b
    rra
    ld   [$FF1F], a
    db   $FD ; Undefined instruction
    rst  $38
    db   $FF
    rst  $38
    xor  $FF
    xor  $00
    rst  $38
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    rst  $38
    rra
    pop  hl
    rst  $20
    ret  c
    ld   sp, hl
    sbc  a, $FE
    db   $ED ; Undefined instruction
    ld   a, a
    db   $ED ; Undefined instruction
    rrca
    or   $F1
    ld   c, $FE
    ld   bc, rIE
    rst  $38
    ld   a, a
    db   $FC ; Undefined instruction
    ccf
    ld    hl, sp+$18
    ld   a, l
    adc  a, l
    cp   [hl]
    add  a, $DF
    and  c
    ld   h, a
    cp   b
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    ld    hl, sp+$16
    inc  e
    ld   a, [bc]
    ret  nz
    ret  nz
    jp   nz, label_3DC2
    dec  a
    jp   label_37C3
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $30
    pop  bc
    di
    ld   e, c
    ld   h, a
    db   $FB
    ei
    db   $EB ; Undefined instruction
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    reti
    rst  $20
    db   $FB
    ei
    db   $EB ; Undefined instruction
    rst  $38
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    di
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   [label_CD7FC], a
    db   $E3 ; Undefined instruction
    cp   h
    ld   e, $E1
    db   $FC
    db   $FC ; Undefined instruction
    sbc  a, $F0
    cp   a
    add  a, b
    cp   e
    nop
    cp   c
    nop
    ld   [hl], $00
    ld   [hl], h
    nop
    ld   [hl], e
    nop
    ei
    nop
    or   $00
    ld   l, l
    nop
    sbc  a, b
    nop
    di
    nop
    ld   a, h
    inc  bc
    ld   [rNR32], a
    nop
    ld   [$FF30], a
    nop
    or   b
    nop
    and  b
    inc  bc
    ld   h, b
    inc  e
    add  a, b
    ld   h, b
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  c
    rrca
    ld   [hl], b
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
    rst  $38
    ld    hl, sp+$07
    rst  $38
    nop
    ld   bc, label_F87
    ld   h, c
    rrca
    jr   nz, label_CD4EA
    ld   b, b
    ld   [label_1850], sp
    ret  z
    ld   bc, label_3E2
    ld   sp, hl
    db   $FC ; Undefined instruction
    jp   label_C3FC
    db   $FC ; Undefined instruction
    jp   label_C2FC
    ld   a, b
    ld   b, [hl]
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    jr   nz, label_CD544

label_CD500::
    nop
    inc  bc
    nop
    rlca
    ld   bc, label_70E
    jr   label_CD528
    jr   nz, label_CD53B
    rst  8
    inc  bc
    ld   a, h
    nop
    rra
    ld   a, a
    add  a, b
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  0
    dec  sp
    ld   a, a
    xor  b
    add  a, a
    ld   a, e
    ld   a, b
    adc  a, a
    rst  $38
    ld   bc, $FEFF
    rst  $38
    ld   a, a
    rst  $38
    add  a, e

label_CD528::
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, a
    rst  $38
    add  a, e
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rlca
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    nop
    rst  $38

label_CD53B::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    add  a, a
    ld   h, b
    ld    hl, sp+$C0

label_CD544::
    rst  $38
    ccf
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
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    cp   $FD
    rst  $38
    ld   bc, $EAFF
    rst  $38
    rst  $30
    rst  $38
    db   $E8 ; add  sp, d
    di
    ld   c, $FD
    db   $EB ; Undefined instruction
    ld    hl, sp+$57
    and  [hl]
    ld   e, c
    db   $FC ; Undefined instruction
    ld   b, e
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $20
    nop
    db   $D3 ; Undefined instruction
    nop
    res  1, b
    rst  $20
    add  a, b
    db   $FC ; Undefined instruction
    ret  nz
    ld   a, d
    ret  nz
    ld   [hl], c
    adc  a, [hl]
    adc  a, a
    ld   d, b
    call z, label_E222
    dec  c
    ld   [rNR21], a
    ld   [rNR22], a
    rst  $30
    rrca
    ld   [hl], e
    rrca
    ld   a, h
    inc  bc
    ld   [hl], b
    inc  c
    ret  nz
    jr   nc, label_CD597

label_CD597::
    ret  nz
    nop
    jr   c, label_CD5B3
    ld   [$FFB8], a
    ret  c
    nop
    add  a, b
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FF00]
    ld   bc, label_300
    inc  bc
    inc  c
    rlca
    rra
    nop
    ccf
    nop
    nop
    nop
    nop
    nop

label_CD5BF::
    nop
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    jr   c, label_CD5C6
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    rra
    ccf
    rrca
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FF0C]
    db   $FC ; Undefined instruction
    ld   [bc], a
    cp   $01
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    ld    hl, sp+$BF
    ld   a, [$FF60]
    inc  h
    nop
    inc  b
    nop
    adc  a, b
    nop
    db   $E8 ; add  sp, d
    nop
    ld   a, [$FF80]
    ld   h, b
    ret  nz
    jr   nz, label_CD5BF
    jr   nz, label_CD601

label_CD601::
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
    adc  a, a
    ld   [hl], c
    ld   de, label_6EE
    ld   a, c
    nop
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, a
    or   l
    ei
    ld   h, $3C
    jp   label_B847
    ld   [$00F7], sp
    ccf
    nop
    rlca
    nop
    nop
    rst  $38
    ld   [hl], a
    rst  $38
    xor  d
    ld   d, a
    xor  l
    ld   a, [label_1F05]
    ld   [rNR41], a
    rst  $18
    nop
    rst  $38
    nop
    rra
    rst  $38
    rst  $38
    rst  $38
    xor  d
    db   $FD ; Undefined instruction
    ld   d, [hl]
    xor  e
    ld   d, h
    rst  $38
    nop
    ld   [$00F7], sp
    cp   $00
    nop
    cp   $D5
    jp   [hl]
    or   [hl]
    ld   e, a
    and  b
    ld    hl, sp+$07
    add  a, b
    ld   a, a
    nop
    ld    hl, sp+$07
    dec  b
    inc  bc
    ld   b, $1E
    pop  hl
    ld    hl, sp+$07
    nop
    rst  $38
    add  a, b
    ld   [hl], b
    inc  c
    add  a, [hl]
    db   $FC ; Undefined instruction
    xor  d
    cp   $55
    cp   $AB
    add  hl, sp
    pop  hl
    inc  a
    ld   a, [$FF1F]
    jr   nc, label_CD696
    jr   c, label_CD688
    jr   label_CD6B2
    inc  c
    or   a
    ld   e, [hl]
    inc  bc
    add  a, a
    ld   a, b
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    rst  8
    nop
    and  a
    nop

label_CD688::
    sub  a, a
    db   $10 ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$0000]
    inc  bc
    ld   bc, label_3C2
    cp   l

label_CD696::
    cp   h
    ld   a, [hl]
    ret  c
    inc  a
    ld   [rNR32], a
    ld   a, [$FF08]
    ld   a, b
    rlca
    nop
    add  a, b
    add  a, b
    nop
    add  a, b
    add  a, b
    nop
    rlca
    inc  bc
    inc  b
    rlca
    inc  bc
    nop
    inc  a
    db   $10 ; Undefined instruction
    rst  $38
    rrca

label_CD6B2::
    rst  $38

label_CD6B3::
    rrca
    rst  $38

label_CD6B5::
    ld   c, $FF

label_CD6B7::
    ld   c, $FC

label_CD6B9::
    di
    ld    hl, sp+$F7
    ld   a, [$FFFF]
    ld   a, [$FFCF]
    rlca
    rra
    inc  bc
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop

label_CD6CC::
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    rst  $38
    ret  nz
    db   $FC ; Undefined instruction
    nop
    pop  bc
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $F03F
    ld   a, a
    ld   a, [$FF7F]
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    ret  nz
    jr   nz, label_CD6B3
    jr   nz, label_CD6B5
    jr   nz, label_CD6B7
    jr   nz, label_CD6B9
    jr   nz, label_CD6BB
    jr   nz, label_CD6BD
    ld   [hl], b
    ld   [$FFF0], a
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF0E]
    ld   a, [$FF0E]
    ld   a, [$FFF0]
    inc  c
    ld   a, [$FF08]
    ld   a, [$FF00]
    ret  nz
    nop
    rst  $38
    rrca
    rst  $38
    rrca
    ld   a, a
    adc  a, a
    ld   a, a
    adc  a, a
    rst  $38
    jr   nc, label_CD71A
    db   $10 ; Undefined instruction
    nop
    di
    inc  c
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_601
    rlca
    jr   c, label_CD76A
    ld   b, b
    ld   a, c
    add  a, [hl]
    ld   a, [hl]
    add  a, c
    nop
    ld   h, b
    ld   h, b
    sub  a, b
    ld   [rNR10], a
    ret  nz
    jr   nz, label_CD739

label_CD739::
    rst  0
    rst  0
    jr   z, label_CD6CC
    ld   [hl], e
    ld   e, a
    xor  a
    nop
    rlca
    ld   b, $0B
    ld   c, $17
    ld   e, $6E
    ld   a, h
    cp   [hl]
    ld    hl, sp+$77
    or   $CB
    sbc  a, $A7
    ld   bc, $0103
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

label_CD760::
    cp   $55
    cp   $AB
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38

label_CD76A::
    rrca
    ld   a, a
    ld   bc, $001F
    ld   bc, label_30D
    inc  c
    push af
    ld   b, b
    and  b
    nop
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    ld   sp, hl
    add  a, c
    db   $FC ; Undefined instruction
    ld   [$FF3F], a
    ld    hl, sp+$1F
    ld   a, h
    rlca

label_CD789::
    rra
    nop
    rlca
    nop
    nop
    nop
    nop
    ld   a, c
    rlca
    db   $E4 ; Undefined instruction
    inc  bc
    jp   nc, label_CB01
    ld   [$80E7], sp
    rst  $38
    rst  $38
    nop
    rst  $38

label_CD79E::
    nop
    nop
    ld   a, [$FFF8]
    ld   a, [$FFF8]
    jr   nc, label_CD79E
    ret  nc
    jr   c, label_CD789
    jr   label_CD7A3
    add  a, a
    ld   a, [hl]
    rst  $38
    nop
    ld   a, a
    ld   a, [hl]
    pop  bc
    ld   a, l
    jp   nz, label_CE13E
    ccf
    ld   h, b
    ld   e, $31
    rra
    jr   nc, label_CD7CC
    jr   c, label_CD7CE
    jr   label_CD760
    ld   l, c
    cp   a
    ld   e, [hl]
    ccf
    db   $3F
    ccf
    jp  c, label_CDFBF
    ccf
    sbc  a, $7F
    cp   l

label_CD7CE::
    ld   a, a
    cp   a
    db   $FC ; Undefined instruction
    ld   e, $F0
    db   $FC ; Undefined instruction
    sbc  a, h
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    cp   $F8
    ld   a, h
    add  a, b
    ld    hl, sp+$E0
    ld   a, [$FF00]
    ld   [rIE], a
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    rra
    ld   a, a
    rrca
    ccf
    ld   bc, $000F
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

label_CD7FC::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   a, b
    ld    hl, sp+$38
    ld    hl, sp+$0F
    rst  $38
    rst  0
    rst  $38
    ld   b, a
    rst  $38
    ld   a, a
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    ld    hl, sp+$F8
    ld   h, h
    db   $FC ; Undefined instruction
    add  a, [hl]
    cp   $FF
    rst  $38
    ld   d, l
    rst  $38
    and  d
    rst  $38
    add  a, c
    rst  $38
    ld   [label_1BF], sp
    sbc  a, a
    jr   nz, label_CD8A0
    nop
    sbc  a, h
    rst  $38
    rst  $38
    ld   d, l
    rst  $38
    ld   b, l
    rst  $38
    db   $10 ; Undefined instruction
    ld   [$00FB], sp
    cp   h
    ld   [bc], a
    sbc  a, a
    nop
    xor  h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    nop
    add  hl, bc
    nop
    ld   [bc], a
    nop
    ld   [label_1000], sp
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rst  0
    nop
    nop
    nop
    rlca
    inc  c
    ld   e, $10
    cp   c
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop

label_CD868::
    jr   label_CD871
    jr   nz, label_CD88B
    ld   b, b
    ccf
    ret  nz
    ccf
    nop

label_CD871::
    nop
    rrca
    nop
    ld   [hl], b
    rrca
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    nop
    nop
    add  a, b
    nop
    ld   [hl], b
    add  a, b
    jr   label_CD868
    ld   b, $F8
    inc  bc

label_CD88B::
    db   $FC ; Undefined instruction
    ret  nz
    ccf
    pop  hl
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
    ld   [rJOYP], a
    jr   nc, label_CD85E
    ld   [label_37F0], sp
    jp   nz, label_A659
    ld   d, c
    ld   l, $83
    ld   a, h
    add  a, [hl]
    ld   a, c
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    sbc  a, b
    ld   h, a
    ld   a, [$FF00+C]
    pop  af
    ld   a, [hl]
    ld   a, e
    rst  $30
    rrca
    rst  $30
    rra
    rst  $20
    ld   a, a
    rrca
    rra
    rst  $38
    rrca
    rst  $38
    scf
    ret  nz
    ld   e, e
    and  h
    ld   d, d
    dec  l
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    call nz, label_A03B
    ld   e, a
    adc  a, b
    ld   [hl], a
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    cp   $77
    rst  $30
    rra
    rst  $20
    ccf
    rst  $10
    ld   a, a
    adc  a, a
    rra
    rst  $38
    rrca
    rst  $38
    scf
    ret  nz
    ld   e, e
    and  h
    ld   d, d
    dec  l
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    call nz, label_A03B
    ld   e, a
    sbc  a, b
    ld   h, a
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    cp   $77
    rst  $38
    ccf
    rst  0
    ld   a, a
    sub  a, a
    rst  $38
    rrca
    rra
    rst  $38

label_CD8FE::
    rrca
    rst  $38
    ld   [hl], c
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, h
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    sbc  a, d
    cp   $8E
    cp   $46
    cp   $06
    cp   $04
    db   $FC ; Undefined instruction
    inc  a
    db   $FC ; Undefined instruction
    ld   c, $FE
    ld   bc, $00FF
    ld   l, c
    nop
    inc  [hl]
    ld   hl, $0021
    nop
    nop
    ld   b, h
    nop
    jr   nz, label_CD92D

label_CD92D::
    ld   [$0000], sp
    db   $10 ; Undefined instruction
    nop
    dec  c
    nop
    add  a, b
    nop
    ld   [de], a
    add  a, b
    add  a, b
    nop
    ld   [$0000], sp
    nop
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    ld   [label_1000], sp
    nop
    jr   nc, label_CD94C

label_CD94C::
    ld   d, b
    jr   nz, label_CD9BE
    jr   nc, label_CD952
    nop

label_CD952::
    rlca
    nop
    rrca
    inc  bc
    inc  c
    inc  b
    dec  sp
    inc  bc
    ld   a, h
    rra
    ld   h, e
    inc  a
    rst  $18
    ld   hl, $00FF
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
    ld   [$FF1F], a
    rst  $18
    ld   [rTAC], a
    ld    hl, sp+$FF
    nop
    cp   $F0
    ccf
    db   $FD ; Undefined instruction
    set  0, l
    rst  0
    ld   sp, hl
    inc  bc
    db   $FD ; Undefined instruction
    add  a, d
    ld   bc, $00E3
    db   $FC ; Undefined instruction
    add  a, b
    db   $FC ; Undefined instruction
    ret  nz
    call c, label_CFFC0
    ld   h, b
    xor  a
    ld   h, b
    sbc  a, a
    ld   [hl], b
    ld   d, a
    jr   nc, label_CD99D
    ld   a, [$FF04]
    ld    hl, sp+$06
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    and  e
    ld   e, h
    pop  bc
    ld   a, $E1

label_CD99D::
    ld   e, $FF
    nop
    call z, label_CFB13
    dec  b
    inc  hl
    dec  c
    rla
    dec  bc
    adc  a, a
    inc  bc
    add  a, h
    inc  bc
    rst  $20
    nop
    ld   a, c
    nop
    rrca
    rst  $38
    inc  bc
    rst  $38
    add  a, c
    rst  $38
    inc  c
    di
    ld   [label_CD0F7], sp
    xor  a
    add  a, b
    ld   a, a

label_CD9BE::
    pop  hl
    ld   e, $DC
    inc  hl
    ld   a, d
    dec  b
    inc  hl
    dec  e
    rla
    dec  bc
    adc  a, a
    inc  bc
    add  a, h
    inc  bc
    rst  $20
    nop
    ld   a, c
    nop
    nop
    ret  nz
    nop
    inc  c
    nop
    inc  bc
    nop
    nop
    nop
    jr   nc, label_CD9DB

label_CD9DB::
    db   $EC ; Undefined instruction
    nop
    ld   [hl], $60
    ld    hl, sp+$FC
    dec  bc
    ld   a, d
    dec  b
    inc  hl
    dec  e
    rla
    dec  bc
    adc  a, a
    inc  bc
    add  a, h
    inc  bc
    rst  $20
    nop
    ld   a, c
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
    sub  a, b
    nop
    ld   c, b
    nop
    jr   nz, label_CDA01

label_CDA01::
    rst  $38
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    rlca
    rst  $38
    ld   bc, $00FF
    rst  $38
    ld   h, c
    rst  $38
    rst  $20

label_CDA13::
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   a
    rst  $38
    adc  a, a
    rst  $38
    add  a, [hl]
    rst  $38
    add  a, d
    rst  $38
    nop
    ld   bc, label_300
    nop
    ld   hl, label_CC700
    nop
    ld   c, e
    nop
    rrca
    ld   [bc], a
    rlca
    ld   [bc], a
    add  a, e
    ld   [bc], a
    rst  $18
    dec  c
    cp   a
    db   $10 ; Undefined instruction
    ld   c, e
    rst  $38
    sbc  a, a
    rst  $38
    sbc  a, a
    rst  $38
    rra
    rst  $38
    cp   a
    rst  $38
    ld   h, e
    inc  a
    jr   nc, label_CDA63
    ld   e, $0F
    inc  e
    inc  bc
    db   $10 ; Undefined instruction
    jr   nz, label_CDA6B
    ld   b, b
    ccf
    ld   b, b
    ccf
    db   $FC ; Undefined instruction
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    ld    hl, sp+$02

label_CDA63::
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  hl
    call c, label_E912
    ld   [de], a

label_CDA6B::
    jp   [hl]
    inc  d
    ld   [$FF35], a
    ret  nz
    ld   a, l
    nop
    ld   bc, label_3FC
    ld   a, h
    nop
    inc  e
    add  a, b
    nop
    ld   b, b
    add  a, b
    cp   e
    nop
    ld   b, h
    add  hl, sp
    rst  $30
    sub  a, b
    db   $AA
    xor  d
    call z, label_8BAB
    jr   z, label_CDA13
    inc  l
    adc  a, [hl]
    inc  a
    adc  a, d
    ld   a, h
    ld   e, d
    cp   b
    rst  $38
    nop
    pop  bc
    nop
    add  a, b
    nop
    nop
    nop
    inc  b
    nop
    add  hl, bc
    nop
    ld   [de], a
    ld   bc, $0116
    nop
    nop
    ld   a, [$FF00]
    ld   c, $F0
    ccf
    ret  nz
    rst  $38
    ld   a, $FF
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
    add  a, b
    nop
    ret  nz
    nop
    ld   [$FF80], a
    ret  nc
    ld   [$FFEC], a
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    jr   nc, label_CDB09
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
    di
    rst  $38
    rra
    rst  $38
    inc  c
    rst  $38
    db   $10 ; Undefined instruction
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
    rlca
    nop
    rlca
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $8F00
    ld   bc, $87CA
    db   $E8 ; add  sp, d
    ld   [hl], a
    ld   a, [$FF6F]
    ld    hl, sp+$5F
    ld    hl, sp+$5F
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    ld   bc, label_2FE
    db   $FD ; Undefined instruction
    ld   e, $FD
    rst  $38
    ei
    rst  $38
    ei
    rst  $38
    ld   a, [$F8FF]
    rst  $38
    or   $37
    ret  nz
    ld   e, e
    and  h
    ld   d, d
    dec  l
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    call nz, label_A03B
    ld   e, a
    adc  a, b
    ld   [hl], a
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    cp   $7F
    rst  $30
    rrca
    rst  $30
    rra
    rst  $20
    ld   a, a
    adc  a, a
    rra
    rst  $38
    rrca
    rst  $38
    inc  a
    ret  z
    adc  a, [hl]

label_CDB83::
    ld   a, [$FFC7]
    ld   a, b
    jp   label_CE37C
    cp   h
    ld   h, c
    cp   [hl]
    ld   h, c
    cp   [hl]
    ld   l, c
    cp   [hl]
    inc  e
    inc  bc
    inc  a
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, $00FC
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $20
    ld   c, $D7
    ld   c, $10
    rst  $28
    jr   nz, label_CDB83
    ld   e, h
    add  a, e
    ld   h, b
    rra
    ld   b, b
    ccf
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ld   [$FF9E], a
    and  $F8
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    pop  bc
    cp   $C1
    cp   $81
    cp   $01
    cp   $03
    db   $FC ; Undefined instruction
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
    add  a, b
    and  b
    ld   b, b
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
    inc  bc
    nop
    rrca
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    nop
    cp   $68
    set  6, h
    inc  d
    cp   $A2
    rst  $38
    add  hl, bc
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    ld   sp, hl
    rst  $38
    ld   a, [$FEFF]
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    nop
    ld   [bc], a
    ld   bc, label_30D
    rra
    rlca
    rla
    rrca
    jr   nz, label_CDC25
    jr   nc, label_CDC0F
    jr   label_CDC17
    rst  $38
    nop
    ld   e, $E1
    ld   a, [$FFFF]
    add  a, d

label_CDC17::
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    inc  bc
    rst  $38
    nop
    rrca
    rst  $38
    ld   b, $3D
    add  a, $BF

label_CDC25::
    ret  c
    ld   a, [hl]
    ret  c
    db   $FD ; Undefined instruction
    bit  7, l
    sub  a, e
    ld   l, h
    or   c
    ld   c, b
    or   e
    db   $FD ; Undefined instruction
    ld   b, $1B
    db   $EC ; Undefined instruction
    di
    db   $EC ; Undefined instruction
    adc  a, l
    ld   a, [$FFF0]
    ld   a, [$FF00+C]
    cp   $03
    rst  $38
    nop
    rrca
    ret  nz
    cp   a
    ld   [$FF9F], a
    ld   h, c
    sbc  a, [hl]
    ld   d, c
    xor  [hl]
    ld    hl, sp+$07
    ld   l, h
    adc  a, e
    inc  bc
    db   $FC ; Undefined instruction
    nop
    ccf
    rrca
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    ld   a, [$FF87]
    ld   a, b
    ld   b, a
    cp   b
    inc  sp
    call z, label_14EB
    call z, label_CFA33
    dec  b
    inc  hl
    dec  e
    rla
    dec  bc
    adc  a, a
    inc  bc
    add  a, h
    inc  bc
    rst  $20
    nop
    ld   a, c
    nop
    rrca
    rst  $38
    rlca
    rst  $38
    add  a, c
    rst  $38
    add  a, h
    ei
    ld   [label_CD0F7], sp
    xor  a
    add  a, b
    ld   a, a
    pop  hl
    ld   e, $AF
    sub  a, $AB
    sub  a, $A9
    sub  a, $39
    add  a, $53
    xor  h
    ld   d, e
    xor  h
    adc  a, e
    ld   d, h
    dec  bc
    inc  d
    ld   sp, hl
    ld   b, $27
    ret  nz
    add  hl, bc
    ld   [$FFB0], a
    ld   l, [hl]
    ld   a, [$FF6F]
    jr   nz, label_CDCBB
    ld   b, b
    ccf
    ld   c, b
    scf
    ld   a, [$FFEC]
    ld   a, b
    ld   a, [$FF9C]
    ld   [hl], b
    ld   e, [hl]
    inc  l
    db   $3A ; ldd  a, [hl]
    inc  c
    ld   sp, label_318A
    add  a, b
    dec  sp
    add  a, c
    rlca
    nop
    inc  c
    nop
    ld   c, $00
    jr   label_CDCBA
    ld   sp, label_2307

label_CDCBB::
    rrca
    ld   [rTAC], a
    ret  nz
    rrca
    rst  $38
    nop
    ld   a, b
    add  a, a
    ld   bc, label_CFFFF
    cp   $FB
    db   $FD ; Undefined instruction
    ld   a, h
    ld   a, e
    call nz, label_7FA
    ld   a, [$FFFF]
    ld   c, $79
    sbc  a, [hl]
    di
    inc  a
    db   $F4 ; Undefined instruction
    ret  z
    jr   label_CDCBD
    inc  sp
    add  a, a
    ld   h, b
    rlca
    ret  nz
    rrca
    ccf
    ret  nz
    rst  0
    jr   label_CDD03
    ld   a, a
    ld   bc, $FFFE
    db   $FC ; Undefined instruction
    ld   a, a
    ld    hl, sp+$73
    ld    hl, sp+$07
    ld   sp, hl
    rst  $38
    nop
    jp   label_BF3C
    ld   b, d
    xor  $1C
    ld   c, h
    ld   [hl], b
    inc  b
    nop
    jr   label_CDD1E
    ld    hl, sp+$F0
    ld   a, a
    rrca

label_CDD02::
    ld   [hl], b

label_CDD03::
    ccf
    ret  nz
    ld   a, a
    ret  nz
    ccf
    ld   h, a
    jr   label_CDD02
    ld   [$007F], sp
    ccf
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ld   c, $03
    nop
    ld   e, $00
    ret  nz
    nop
    rst  $38
    nop
    ld    hl, sp+$00

label_CDD1E::
    pop  bc
    nop
    ld   l, h
    add  a, b
    call c, label_9C20
    ld   h, b
    sbc  a, b
    ld   b, b
    call z, label_9F00
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    nop
    ccf
    nop
    ld   [hl], b
    ret  nz
    nop
    ld   a, b
    nop
    inc  bc
    nop
    rst  $38
    nop
    rra
    nop
    rlca
    nop
    nop
    ccf
    nop
    ld   [hl], b
    ret  nz
    nop
    ld   a, b
    nop
    inc  bc
    nop
    rst  $38
    nop
    rra
    nop
    ld   a, [$FF00]
    rra
    ld   [$FFE7], a
    nop
    ld   a, a
    nop
    ld   [bc], a
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    db   $FC ; Undefined instruction
    nop

label_CDD62::
    adc  a, [hl]
    nop
    rst  $38
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop

label_CDD6C::
    rra
    nop
    ld   a, [$FF00]
    cp   a
    nop
    rst  $38
    nop
    rst  $30
    nop
    inc  b
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    jp   z, label_8C10
    nop
    rst  $18
    nop
    rst  $38
    nop
    dec  de
    nop
    rst  $38
    ld   bc, label_31D
    db   $FC ; Undefined instruction
    inc  bc
    sbc  a, b
    ld   h, a
    jr   nc, label_CDD62
    ld   [hl], b
    adc  a, [hl]
    di
    inc  l
    ld   a, [$FDE4]
    ld   [$FFCB], a
    db   $F4 ; Undefined instruction
    rra
    ld   [rNR30], a
    ld   bc, $815E
    adc  a, h
    nop
    adc  a, [hl]
    nop
    adc  a, a
    nop
    sbc  a, a
    nop
    cp   a
    nop
    ret  nz
    nop
    add  a, b
    db   $10 ; Undefined instruction
    add  a, b
    ld   h, b
    ld   [label_CE8F0], sp
    cp   h
    ld   h, b
    add  hl, bc
    jr   nc, label_CDD6C
    db   $10 ; Undefined instruction
    nop
    inc  c
    ld   h, $19
    ld   c, h
    sub  a, c
    ld   [$0027], sp
    ccf
    inc  b
    inc  sp
    ld   [$C023], sp
    ld   a, $00
    ld   [rTAC], a
    ld   [rJOYP], a
    ret  nz
    ld   [label_18C0], sp
    db   $FC ; Undefined instruction
    nop
    cp   c
    nop
    rst  $38
    nop
    rlca
    nop
    inc  bc
    ld   [hl], b
    nop
    nop
    nop
    xor  $03
    nop
    ld   [bc], a
    nop
    inc  a
    nop
    db   $F4 ; Undefined instruction
    nop
    ld   a, l
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    inc  a
    db   $E3 ; Undefined instruction
    ld   a, d
    daa
    ld   h, b
    ld   [label_1000], sp
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, $00
    rra
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
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    add  hl, de
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, a
    rst  $38
    rst  8
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    rrca
    rrca
    rra
    rra
    inc  e
    rra
    rrca
    rrca
    rra
    rra
    ld   a, $3F
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    cp   $FF
    rst  $28
    rst  $38
    ld   e, $FF
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    rrca
    rrca
    rra
    rra
    rra
    rra
    rrca
    rrca
    rra
    rra
    inc  e
    rra
    ret  c
    rst  $18
    ld   a, [$FFFF]
    cp   $FF
    adc  a, a
    rst  $38
    rra
    rst  $38
    add  a, $FF
    adc  a, $FF
    call z, label_DCFF
    rst  $38
    ld   [hl], h
    rst  $38
    ld   h, a
    rst  $38
    rst  0
    rst  $38
    adc  a, a
    rst  $38
    jr   nz, label_CDE81
    jr   nz, label_CDE83
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   [rIE], a
    add  a, b
    rst  $38
    nop
    rst  $38
    scf
    ret  nz
    ld   e, e
    and  h
    ld   d, d
    dec  l
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    call nz, label_B03B
    ld   c, a
    cp   b
    ld   d, a
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    cp   $7F
    adc  a, a
    rst  $38
    scf
    cp   a
    ld   d, a
    rst  $38
    rrca
    rra
    rst  $38
    rrca
    rst  $38
    scf
    ret  nz
    ld   e, e
    and  h
    ld   d, d
    dec  l
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    call nz, label_B03B
    ld   c, a
    xor  b
    ld   d, a
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    cp   $7F
    adc  a, a
    rst  $18
    scf
    cp   a
    ld   d, a
    rst  $18
    cpl
    rra
    rst  $38
    rrca
    rst  $38
    scf
    ret  nz
    ld   e, e
    and  h
    ld   d, d
    dec  l
    add  a, [hl]
    ld   a, c
    add  a, h
    ld   a, e
    call nz, label_B03B
    ld   c, a
    cp   b
    ld   b, a
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    cp   $7F
    adc  a, a
    cp   a
    ld   d, a
    rst  $38
    rla
    rst  $38
    ld   l, a
    rra
    rst  $38
    rrca
    rst  $38
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
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
    ld   b, b
    nop
    jr   nz, label_CDF05

label_CDF05::
    and  d
    nop
    ld   c, c
    nop
    add  a, l
    add  a, b
    and  l
    add  a, b
    and  b
    nop
    xor  b
    ld   h, a
    rst  $38
    inc  hl
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    dec  a
    rst  $38
    rrca
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    ld   a, [$FFF0]
    ld   h, b
    ld   [rLCDC], a
    ld   [$FFFC], a
    db   $FC ; Undefined instruction
    cp   $FE
    cp   a
    rst  $38
    rst  8
    rst  $38
    jp   label_8FF
    rra
    nop
    rra
    nop
    rra
    inc  c
    rra
    jr   c, label_CDF79
    ld   a, c
    ld   a, a
    ld   l, e
    ld   a, a
    ld   h, a
    ld   a, a
    jr   c, label_CDF41
    jr   nc, label_CDF43
    jr   nz, label_CDF45
    inc  l
    rst  $38
    ccf
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    ld   h, b
    rst  $38
    ld   [bc], a
    rra
    rlca
    rra
    ld   b, $1F
    inc  c
    rra
    jr   label_CDF99
    ld   a, c
    ld   a, a
    ld   l, e
    ld   a, a
    ld   h, a
    ld   a, a
    ld   a, c
    rst  $38
    or   $FF
    ld   l, a
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    ld   h, b
    rst  $38
    sbc  a, h
    rst  $38
    inc  e
    rst  $38
    jr   label_CDF75
    jr   label_CDF77
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    add  a, e
    nop
    sub  a, e
    nop
    ld   d, $00
    inc  de
    nop
    ld   c, d
    nop
    ld   c, c
    nop
    inc  h
    nop
    db   $10 ; Undefined instruction
    dec  bc
    ld   a, d
    dec  b
    inc  hl
    dec  e
    rla
    dec  bc
    adc  a, a

label_CDF99::
    inc  bc
    add  a, h
    inc  bc
    rst  $20
    nop
    ld   a, c
    nop
    cp   a
    rst  $38
    sbc  a, a
    rst  $38
    cpl
    rst  $38
    rra
    ld   a, a
    daa
    cp   a
    ld   d, $7F
    jr   nz, label_CE02D
    inc  de
    ccf
    db   $FC ; Undefined instruction
    dec  bc
    ld   l, d
    dec  d
    inc  hl
    dec  e
    rla
    dec  bc
    adc  a, a
    inc  bc
    add  a, h
    inc  bc
    rst  $20
    nop
    ld   a, c

label_CDFBF::
    nop
    db   $FC ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    pop  af
    rst  $38
    ld   a, [$F0FF]
    rst  $38
    inc  h
    cp   $48
    db   $FD ; Undefined instruction
    nop
    ld   a, [$E840]
    ld   b, b
    db   $E8 ; add  sp, d
    ld   b, b
    ld   [rJOYP], a
    jp   nz, label_C200
    nop
    inc  h
    nop
    ld   b, b
    nop
    add  a, b
    nop
    nop
    nop
    ld   [label_400], sp
    nop
    jr   nz, label_CDFE9

label_CDFE9::
    stop
    ld   [$0000], sp
    nop
    nop
    nop
    ccf
    nop
    sbc  a, c
    nop
    ld   h, a
    nop
    nop
    nop
    inc  bc
    nop
    ld   b, b
    nop
    jr   nc, label_CDFFF

label_CDFFF::
    ld   bc, $0000
    nop
    nop
    ld   bc, label_300
    nop
    dec  b
    ld   [bc], a
    add  hl, bc
    ld   b, $08
    rlca
    inc  c
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_700
    ld   bc, label_60E
    cp   a
    rrca
    ld   [hl], b
    sbc  a, a
    rlca
    nop
    jr   label_CE02B
    jr   nz, label_CE045
    cp   $01

label_CE028::
    rst  $38
    cp   $0F

label_CE02B::
    rra
    rst  $30

label_CE02D::
    rst  $38
    ccf
    rst  $38
    ld   a, [$FF00]
    ld   a, $C0
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ret  nz
    ccf
    ld   a, [$FFCF]
    cp   $F1
    rst  $38
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    jr   label_CE028
    inc  c
    ld   a, [$FF06]
    ld    hl, sp+$06
    ld    hl, sp+$83
    ld   a, h
    jr   nc, label_CE04E
    ret  nz
    ld   a, [$E400]
    nop
    add  hl, sp
    nop
    add  a, d
    nop
    inc  c
    nop
    nop
    nop
    ret  nz
    inc  c

label_CE061::
    inc  bc
    db   $10 ; Undefined instruction
    jr   nz, label_CE085
    jr   nz, label_CE087
    ld   e, a
    add  hl, sp
    ld   a, b
    daa
    ld   h, b
    rra
    ld   h, b
    rra
    jr   label_CE061
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_CE07F::
    rst  $38
    rrca
    pop  af
    ld   bc, $00FE

label_CE085::
    rst  $38
    nop

label_CE087::
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nc, label_CE07F
    call c, label_FEF8
    ld   a, h
    ld   a, a
    cp   [hl]
    ccf
    rst  $18
    rra
    rst  $28
    rrca
    rst  $30
    rrca
    rst  $30
    dec  d
    ei
    ld   h, b
    nop
    stop
    ld   [$8400], sp
    nop
    jp   nz, label_E180
    ret  nz
    pop  af
    ret  nz
    pop  af
    ld   [rJOYP], a
    stop
    jr   nz, label_CE0B5

label_CE0B5::
    ld   [label_1000], sp
    nop
    jr   nz, label_CE0BB

label_CE0BB::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    rlca
    nop
    add  hl, bc
    ld   b, $12
    inc  c
    ldi  [hl], a
    inc  e
    ld   hl, $F01E
    rrca
    nop
    nop
    rlca
    nop
    jr   label_CE0ED
    jr   nc, label_CE0F7
    ld   e, h
    inc  hl
    xor  a
    ld   b, b
    sbc  a, a

label_CE0ED::
    nop
    ld   h, h
    inc  bc
    nop
    nop
    rlca
    nop
    jr   label_CE0F6

label_CE0F6::
    jr   nc, label_CE0F8

label_CE0F8::
    ld   e, h
    nop
    cp   a
    db   $10 ; Undefined instruction
    ld   h, b
    ld   h, h
    jr   label_CE108
    inc  bc
    rlca
    ld   bc, label_708
    db   $10 ; Undefined instruction

label_CE108::
    jr   nz, label_CE129
    ld   b, b
    ccf
    ld   b, b
    ccf
    db   $E8 ; add  sp, d
    ld   [hl], a
    xor  a
    ret  nc
    inc  a
    rst  8

label_CE114::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_CE11F::
    rst  $38
    rst  $18
    ccf
    ccf
    pop  bc
    ld   bc, $00FE
    rst  $38
    nop

label_CE129::
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   de, $CFFF
    cp   $FF
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, a
    sbc  a, a
    ld   l, a
    adc  a, [hl]
    ld   [hl], a
    add  a, a
    ld   a, d

label_CE13E::
    add  a, e
    ld   a, h
    pop  hl
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    sub  a, b
    rst  $30
    or   b
    or   a
    ld   a, b
    rst  $28
    ld   e, b
    ld   l, a
    ret  c
    ret  nz
    nop
    jr   nc, label_CE114
    ld   [$84F0], sp
    ld   a, b
    add  a, d
    ld   a, h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   a, d
    add  a, h
    db   $FD ; Undefined instruction
    ld   [bc], a
    ld   b, b
    ccf
    ret  nz
    ccf
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, e
    ld   a, a
    sbc  a, [hl]
    ld   a, l
    db   $FC ; Undefined instruction
    ld   a, e
    db   $FD ; Undefined instruction
    ld   a, e
    nop
    rst  $38
    inc  b
    ei
    inc  b
    ld   a, [$F409]
    ld   [de], a
    jp   [hl]
    scf
    add  a, c
    add  hl, sp
    inc  b
    db   $76 ; Halt
    ld   [$8F10], sp
    jr   nz, label_CE1A0
    rst  0
    jr   nz, label_CE183
    nop
    rrca
    ld   a, [$FFDF]
    rst  $28
    rst  $38
    ret  c
    ld   a, e
    ld   [hl], h
    rst  $30
    ei
    rst  $20
    dec  de
    db   $E3 ; Undefined instruction
    cp   l
    db   $E3 ; Undefined instruction
    dec  a

label_CE198::
    pop  hl
    cp   [hl]
    pop  af
    ld   e, $F1
    rst  $18
    ld   sp, hl
    ld   e, a

label_CE1A0::
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    ld   a, [$FFFE]
    ld   a, [$FFFE]
    call nz, label_CCFF
    rst  $38
    inc  e
    ld   a, a
    or   h
    rst  $30
    ld   l, h
    add  a, b
    nop
    ret  nz
    nop
    ld   [hl], b
    add  a, b
    jr   label_CE198
    inc  c
    ld   a, [$FF84]
    ld   a, b
    db   $E4 ; Undefined instruction

label_CE1BD::
    jr   label_CE1BD
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
    rra
    nop
    cp   $1C
    ccf
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

label_CE1D9::
    nop
    ret  nz
    nop
    ld    hl, sp+$C0
    ccf
    ld   [hl], b
    add  a, b
    nop
    ret  nz
    nop
    jr   nz, label_CE1A6
    db   $10 ; Undefined instruction
    rla
    ld   [$FF89], a
    ld   [hl], b
    rst  8
    jr   nc, label_CE1D9
    inc  d
    add  a, b
    nop
    ret  nz
    nop
    jr   nz, label_CE1F6

label_CE1F6::
    stop
    rla
    nop
    adc  a, a
    ld   b, $CF
    nop
    ld   [$F001], a
    ld   l, a
    ld   b, b
    ccf
    ld   b, c
    ccf
    add  a, e
    ld   a, a
    rst  0
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    nop
    rst  $38
    ld   b, $FD
    inc  c
    ei
    inc  a
    ei

label_CE218::
    rst  $38
    ei
    rst  $38
    ld   a, [$F4FF]
    rst  $38
    ld   a, [$FF01]
    db   $EC ; Undefined instruction
    ld   [bc], a
    pop  hl
    daa
    ret  nz
    ld   l, h
    add  a, e
    xor  e
    ld   b, h
    cp   l
    ld   b, d
    rla
    db   $E8 ; add  sp, d
    add  a, a
    ld   a, a
    add  a, c
    ld   e, $81
    inc  c
    pop  bc
    nop
    pop  hl
    add  a, b
    reti
    ld   h, b
    db   $E4 ; Undefined instruction
    cp   b
    db   $F4 ; Undefined instruction
    cp   b
    ld   a, [$FF00+C]
    rst  $28
    ret  c
    db   $AA
    xor  d
    db   $AA
    xor  d
    sbc  a, a
    ld   l, b
    dec  e
    ret  c
    sbc  a, h
    ld   e, b
    or   h
    ld   a, b
    ld   a, b
    jr   nc, label_CE218
    nop
    add  a, c
    nop
    nop
    nop
    nop
    nop
    inc  b
    nop
    add  hl, bc
    nop
    ld   [de], a
    ld   bc, $0136
    ld   a, c
    scf
    ld   a, e
    scf
    ccf
    rla
    rra
    rlca
    rlca
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   e, e
    inc  b
    sub  a, a
    ld   bc, label_F97
    sub  a, b
    ld   c, $97
    ld   [label_79F], sp
    rst  $18
    rlca
    inc  a
    dec  bc
    ld   a, a
    ld   [hl], c
    ld   a, a
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, c
    rst  $38
    ld   a, a
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    ld   a, [$FF60]
    ld   [hl], b
    ld   [$FFF8], a
    ld   a, [$FFF4]
    ld   sp, hl
    ld   [hl], h
    ei
    xor  b
    rst  $30
    db   $E8 ; add  sp, d
    rst  $30
    ld   a, [$FFE7]
    or   $4D
    or   $4D
    db   $DB
    inc  l
    sbc  a, e
    ld   l, h
    cp   a
    ld   e, b
    rst  $30
    ld   a, b
    db   $FD ; Undefined instruction
    ld   [hl], b
    db   $FC ; Undefined instruction
    jr   nz, label_CE278
    nop
    add  a, c
    nop
    add  a, b
    nop
    add  a, b
    nop
    inc  b
    nop
    add  hl, de
    nop
    ldd  [hl], a
    ld   bc, label_176
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    ld   e, $FE
    cp   $FE
    rra
    rst  $38
    ld   a, $FE
    db   $FC ; Undefined instruction
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, d
    cp   h
    add  a, b
    ld   a, a
    add  a, h
    ld   a, e

label_CE304::
    ld   b, h
    dec  sp
    call nz, label_A23B
    ld   e, l
    and  d
    ld   e, l
    ld   [hl], d
    adc  a, l
    cp   c
    ld   h, [hl]
    dec  e
    ld  [$FF00+C], a
    rra
    ld   [rNR32], a
    db   $E3 ; Undefined instruction
    inc  a
    jp   label_D22D
    dec  hl
    call nc, label_D42B
    dec  d
    ld   [label_CFF8F], a
    rst  $38
    rst  $38
    ld   a, a
    cp   a
    ld   [hl], a
    cp   a
    db   $E3 ; Undefined instruction
    ld   a, a
    pop  bc
    rst  $38
    ret  nz
    rst  $38
    db   $E3 ; Undefined instruction
    inc  e
    ld   a, [$FAFD]
    db   $FD ; Undefined instruction
    ld   a, [$FAFD]
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   l, b
    or   b
    jr   c, label_CE304
    rra
    ld   [$FF1F], a
    ld   [rIF], a
    ld   a, [$FF0F]
    ld   [hl], b
    rrca
    ld   [hl], b
    rlca
    jr   c, label_CE38D
    inc  bc
    ld   a, h
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, $00FC
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $20
    ld   c, $D7
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
    db   $DB
    nop
    rst  $38

label_CE36D::
    db   $DB
    cp   $FF
    scf
    inc  c
    jr   nc, label_CE383
    jr   z, label_CE37D
    jr   z, label_CE37F
    inc  h
    inc  bc
    ld   [de], a
    ld   bc, $0091
    ret  nc

label_CE37F::
    nop
    rra
    rst  $38
    ccf

label_CE383::
    rst  $38
    rst  $38
    rrca
    cp   $FF
    adc  a, h
    sbc  a, a
    ld   a, h
    rst  $38
    ld   [hl], b

label_CE38D::
    rst  $38
    add  a, e
    ld   a, h
    ret  nc
    rst  $20
    ret  nc
    rst  $20

label_CE394::
    sub  a, b
    rst  $20
    db   $10 ; Undefined instruction
    jr   z, label_CE36D
    ld   c, b
    or   e
    ret  z
    ld   de, $0128
    ld    hl, sp+$00
    ld   a, h
    add  a, b
    ld   a, a
    add  a, b
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    rra
    ld   [$FF1F], a
    ld   [$FFFC], a
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    ld   bc, $00FC
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $20
    ld   c, $D7
    ld   c, $7C
    db   $FC ; Undefined instruction
    ld   h, b
    ld   [$FF30], a
    ld   a, [$FF30]
    ld   a, [$FF70]
    ld   a, [$FF60]
    ld   [$FFE0], a
    ld   [$FFC0], a
    ret  nz
    ld   [bc], a
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    ld   c, $FE
    ld   e, $FE
    cp   $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    rlca
    rst  $38
    rlca
    rst  $38

label_CE3E4::
    rlca
    rst  $38

label_CE3E6::
    ld   c, $FE

label_CE3E8::
    inc  e
    db   $FC ; Undefined instruction
    jr   label_CE3E4
    jr   c, label_CE3E6
    jr   c, label_CE3E8
    ld    hl, sp+$F8
    ld   a, [$FFF0]
    ld   [$FFE0], a
    nop

label_CE3F7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_CE400::
    rst  $30
    jr   c, label_CE3F7
    dec  sp
    ld   b, a
    cp   b
    ld   c, b
    or   b
    di
    rlca
    ld   c, $0E
    inc  bc
    rst  $38
    nop
    rrca

label_CE410::
    sbc  a, l
    ld   h, d
    call nc, label_A220
    ret  z
    add  a, d
    ld   a, [$FF00]
    ld   a, [$FFC0]
    ld   a, [$FF01]
    ld   h, b
    ld   b, $00
    adc  a, h
    ld   [hl], e
    add  a, e
    ld   a, h
    ld   b, b
    ccf
    jr   nc, label_CE437
    ld   [$F707], sp
    nop
    ld   [label_1000], sp
    add  a, b
    dec  b
    ld   a, [$F009]
    db   $10 ; Undefined instruction
    jr   nz, label_CE400
    rst  0
    nop
    ld   e, $20
    nop
    rlca
    add  hl, bc
    nop
    rra
    ld    hl, sp+$0F
    ld    hl, sp+$86
    ld   a, c
    ld   b, a
    jr   c, label_CE410
    jr   c, label_CE471
    jr   label_CE463
    ld   l, b
    adc  a, e
    db   $10 ; Undefined instruction
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [hl], b
    ld   a, a
    ld   a, b
    ld   a, a
    rra
    rra
    db   $F4 ; Undefined instruction
    cp   e
    db   $F4 ; Undefined instruction

label_CE463::
    cp   d
    ld   b, a
    cp   b
    ld   c, b
    sub  a, b
    di
    rlca
    ld   c, $0E
    inc  bc
    rst  $38
    nop
    rrca
    ld    hl, sp+$07
    adc  a, b
    ld   h, a
    add  a, h
    ld   l, e
    add  a, [hl]
    db   $FD ; Undefined instruction
    add  hl, bc
    cp   $C0
    rst  $38
    nop
    ld   a, h
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   h
    nop
    ld   b, b
    and  h
    pop  bc
    nop
    ccf
    ret  nz
    nop
    ld   b, b
    nop
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    ccf
    nop
    nop
    nop
    ld   [rJOYP], a
    rst  0
    nop
    nop
    nop
    ld   a, b
    nop
    ld   a, a
    ld   [$FF1F], a
    ld   [rNR34], a
    pop  hl
    sbc  a, a
    ld   h, b
    ld   e, a

label_CE4A9::
    jr   nz, label_CE4A9
    nop
    db   $76 ; Halt
    add  a, b
    adc  a, e
    stop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    inc  e
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    adc  a, a
    nop
    rst  $38
    nop
    rst  $18
    nop
    ld   a, a
    nop
    ccf
    nop
    rlca
    nop
    nop
    nop
    ld   b, b
    nop
    rst  $38
    nop
    cp   $00
    ei
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    pop  hl
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    pop  bc
    nop
    nop
    nop
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
    ld   a, [$FF00]
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    rrca
    nop
    ld   a, b
    rlca
    db   $FD ; Undefined instruction
    inc  sp
    rst  $38
    ld   a, e
    rst  0
    ld   a, h
    rst  $28
    inc  e
    rst  $38
    nop
    inc  sp
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
    add  a, h
    ld   a, b
    ld   a, $F8
    ld   a, a
    add  a, b
    add  a, a
    ld   a, b
    rlca
    db   $FC ; Undefined instruction
    ccf
    db   $FC ; Undefined instruction
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    and  $00
    add  hl, sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, de
    and  $01
    cp   $00
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ccf
    pop  bc
    ld   a, $FF
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld    hl, sp+$00
    ld   e, $00
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
    inc  bc
    inc  bc
    rlca
    rlca
    rrca
    rrca
    inc  e
    rra
    jr   label_CE58B
    jr   label_CE58D
    inc  e
    rra
    rlca
    rlca
    rra
    rra
    rra
    rra
    inc  a
    ccf
    jr   c, label_CE5B9
    jr   nc, label_CE5BB
    jr   nc, label_CE5BD
    ld   a, [$FFFF]
    ld   c, l
    cp   [hl]
    rst  $38
    cp   [hl]
    rst  $38

label_CE585::
    jr   nc, label_CE585
    nop
    ld   a, [hl]
    nop
    ld   [hl], b

label_CE58B::
    nop
    db   $FC ; Undefined instruction

label_CE58D::
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_CE5A2

label_CE5A2::
    ld   l, h
    db   $10 ; Undefined instruction
    ld   l, h
    reti
    ld   l, $7F
    inc  c
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
    nop

label_CE5B9::
    nop
    nop

label_CE5BB::
    nop
    nop

label_CE5BD::
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $18
    nop
    rst  $38
    nop
    sbc  a, a
    nop
    rst  $38
    nop
    rrca
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
    ld   sp, hl
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    rst  $38
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    ld   bc, $8000
    nop
    nop
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    rrca
    nop
    ld   a, b

label_CE609::
    nop
    db   $FC ; Undefined instruction
    jr   nc, label_CE609
    ld   a, b
    jp   label_EF40
    inc  e
    rst  $38
    nop
    ccf
    nop
    ld   [de], a
    nop
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    add  a, h
    inc  bc
    ld   b, $01
    ld   a, a
    nop
    add  a, a
    nop
    inc  bc
    nop
    inc  bc
    nop
    rra
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    call nz, label_1000
    nop
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
    ret  nz
    nop
    ret  nz
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ret  nz
    nop
    ret  nz
    nop
    rst  $38
    nop
    rrca
    nop
    rra
    nop
    ld   a, [$FF00]
    inc  c
    nop
    jr   label_CE65C

label_CE65C::
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [hl], b
    ld   a, [$FF38]
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, h
    db   $FC ; Undefined instruction
    ld   c, l
    cp   [hl]
    rst  $38
    cp   [hl]
    rst  $38

label_CE685::
    jr   nc, label_CE685
    nop
    ld   h, h
    nop
    ld   e, h
    nop
    ld   [rJOYP], a
    ret  c
    nop
    ret  nz
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
    ld   h, b
    nop
    ret  c
    ld   h, b
    or   $38
    ld   a, l
    ld   c, $1F
    ld   [bc], a
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
    rst  $38
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    ld   h, c
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
    ld   a, [$FF00]
    add  a, b
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, $00
    ld   a, a
    nop
    ccf
    nop
    rlca
    nop
    nop
    nop
    add  a, b
    nop
    jp   label_FF00
    nop
    ei
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ccf
    ccf
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    ret  nz
    rst  $38
    ld   a, [$FFFF]
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
    add  a, b
    rst  $38
    nop
    rst  $38
    inc  c
    rrca
    inc  c
    rrca
    ld   a, $3F
    ld   a, a
    ld   a, a
    ld   a, b
    ld   a, a
    ld   [hl], b
    ld   a, a
    ld   h, b
    ld   a, a
    ld   [rIE], a
    ld   [hl], e
    ld   [hl], e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    dec  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FFF0]
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  e
    db   $FC ; Undefined instruction
    rrca
    rst  $38

label_CE74A::
    rrca
    rst  $38

label_CE74C::
    rlca
    rst  $38
    inc  b
    rst  $38
    jr   c, label_CE74A
    jr   label_CE74C
    inc  e
    db   $FC ; Undefined instruction
    ld   a, $FE
    ld   a, $FE
    rrca
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    inc  e
    db   $FC ; Undefined instruction
    dec  c
    db   $FD ; Undefined instruction
    rrca
    rst  $38
    rrca
    rst  $38
    inc  b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   [hl], b
    ld   a, [$FF3C]
    db   $FC ; Undefined instruction
    ld   a, $FE
    rrca
    rst  $38
    rrca
    rrca
    ld   c, $0F
    inc  e
    rra
    ld   e, $1F
    ld   e, $1F
    ld   c, $0F
    rrca
    rrca
    inc  bc
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FF
    rst  $38
    ld   c, $FF
    ccf
    rst  $38
    rst  $30
    rst  $30
    jp   label_FFC3
    rst  $38
    rst  $38
    rst  $38
    ld   a, $3F
    ld   b, $07
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    db   $EC ; Undefined instruction
    rst  $28
    inc  c
    rrca
    ld   c, $0F
    ld   c, $0F
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
    ld   bc, rSB
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    ld   bc, label_CC000
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    nop
    add  a, b
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
    sbc  a, [hl]
    nop
    rst  $38
    nop
    rrca
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $20
    nop
    rst  $38
    nop
    ld   sp, hl
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    ld   a, h
    rst  $38
    ld   a, a
    rst  $38
    rra
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, h
    rst  $38
    adc  a, $FF
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
    ld   [rIE], a
    ld   b, b
    rst  $38
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
    inc  e
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    ld   a, $FF
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    cp   $FF
    rst  $28
    rst  $38
    ld   e, $3F
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

label_CE84E::
    nop
    nop
    jr   nc, label_CE84E
    ret  nz
    ld   a, [$E400]
    nop
    add  hl, sp
    nop
    add  a, d
    nop
    inc  c
    nop
    nop
    nop
    ret  nz
    nop
    ld   bc, $0100
    nop
    ld   bc, label_201
    ld   bc, $0102
    ld   [bc], a
    inc  bc
    inc  b
    rlca
    nop
    nop
    inc  bc
    inc  bc
    inc  b
    rlca
    ld   [label_807], sp
    rrca
    db   $10 ; Undefined instruction
    nop
    rra
    jr   nz, label_CE8FE
    add  a, b
    nop
    add  a, b
    add  a, b
    ld   b, b
    ld   a, [$FF0C]
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_CE88D::
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

label_CE899::
    nop
    ret  nc
    jr   z, label_CE899
    ld   [bc], a
    cp   $01
    nop
    add  a, b
    add  a, b
    nop
    add  a, b
    ld   b, b
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    jr   nz, label_CE88D
    db   $10 ; Undefined instruction
    ld   [label_1000], sp
    nop
    jr   nz, label_CE8B5

label_CE8B5::
    ld   [label_1000], sp
    nop
    jr   nz, label_CE8BB

label_CE8BB::
    nop
    nop
    nop
    nop
    nop
    ld   [label_30BF], sp
    rst  $38
    nop
    ld   [hl], d
    adc  a, b
    sbc  a, h
    nop
    ld   h, c
    nop
    dec  c
    jr   nz, label_CE8EE
    nop
    nop
    nop
    db   $FD ; Undefined instruction
    add  a, c
    or   e
    ld   b, $DF
    nop
    inc  c
    db   $10 ; Undefined instruction
    jr   nz, label_CE90B
    nop
    nop
    nop
    stop
    rst  $38
    ld   [label_200D], sp
    inc  hl
    nop
    nop
    ld   [$0048], sp
    inc  b
    nop
    nop

label_CE8EE::
    jr   nz, label_CE910

label_CE8F0::
    db   $10 ; Undefined instruction
    ld   [bc], a
    rrca
    nop
    sub  a, b
    nop
    db   $10 ; Undefined instruction
    ld   b, c
    nop
    nop
    nop
    inc  b

label_CE8FE::
    nop
    ld   b, b

label_CE900::
    rst  $38
    rst  $20
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    ccf
    rst  $38

label_CE90B::
    rrca
    rst  $38
    inc  bc
    rst  $38
    nop

label_CE910::
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   a
    rst  $38
    rst  8
    rst  $38
    jp   label_8FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    jr   c, label_CE92A
    ld   a, c
    rst  $38
    ld   l, e
    rst  $38
    ld   h, a
    rst  $38
    jr   c, label_CE932
    jr   nc, label_CE934
    jr   nz, label_CE936
    inc  l
    rst  $38
    ccf
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    rrca
    nop
    rrca
    db   $10 ; Undefined instruction
    jr   nz, label_CE9A8
    nop
    ccf
    ld   b, b
    ld   a, a
    nop
    ld   a, a
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   bc, label_1807
    ccf
    ld   b, b
    ld   a, a
    add  a, b
    nop
    ld   bc, label_403
    rlca
    ld   [label_201F], sp
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    add  a, b
    add  a, b
    ld   b, b
    ret  nz
    nop
    ld   [rNR10], a
    ld    hl, sp+$04
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld   [bc], a
    cp   $01
    ld    hl, sp+$00
    ld    hl, sp+$04
    ld    hl, sp+$04
    db   $FC ; Undefined instruction
    nop

label_CE9A8::
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    cp   $00
    jr   nc, label_CE9F1
    ld   l, h
    ld   a, a
    ld   a, b
    ld   a, a
    ld   [rIE], a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    ld   a, a
    ld   h, b
    ld   a, a
    nop
    ld   b, b
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
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    inc  b
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
    jr   label_CEA0A
    inc  a
    inc  a
    ld   h, [hl]
    ld   a, [hl]
    ld   b, d
    ld   a, [hl]
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    nop
    rst  $38
    add  a, c
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
    inc  bc

label_CEA0A::
    rst  $38
    ld   [hl], b
    rst  $38
    sbc  a, b
    rst  $38
    inc  b
    rst  $38
    ld   de, label_9FF
    rst  $38
    dec  bc
    cp   $06
    cp   $CE
    db   $FC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, h
    ld    hl, sp+$78
    ld   a, a
    ld   c, b
    rst  $38
    adc  a, $FF
    sbc  a, a
    rst  $38
    call c, label_F8FF
    ld   a, a
    ld   [hl], b
    ld   a, a
    ld   [hl], c
    rra
    inc  de
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [hl], b
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    and  h
    and  h
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sub  a, c
    sub  a, e
    db   $FD ; Undefined instruction
    sub  a, e
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ld    hl, sp+$20
    dec  [hl]
    ld   [$F42B], a
    rst  $38
    rst  $38
    and  $04
    xor  a
    ld   d, h
    sbc  a, a
    ld   h, h
    rst  $38
    rst  $38
    ld   b, b
    ld   b, b
    rst  $10
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    rst  $38
    ld   [label_CFB08], sp
    ld   [label_8FF], sp
    rst  $38

label_CEA71::
    rst  $38
    rra
    inc  b
    db   $EC ; Undefined instruction
    rla
    call nc, label_FF2F
    rst  $38
    ld   h, a
    jr   nz, label_CEA71
    dec  hl
    ld   a, [rNR51]
    rst  $38
    push af
    cpl
    dec  h
    rst  $38
    dec  h
    rst  $38
    rst  $38
    rst  $38
    jp   [hl]
    sbc  a, a
    ret
    cp   a
    ret
    cp   a
    rst  $38
    rst  $38
    ld   [bc], a
    ld   [bc], a
    db   $EB ; Undefined instruction
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    rst  $38
    db   $10 ; Undefined instruction
    sbc  a, $10
    rst  $38
    db   $10 ; Undefined instruction
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
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    ld   e, $FE
    cp   $FE
    rra
    rst  $38
    ld   a, $FE
    db   $FC ; Undefined instruction
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    db   $FC ; Undefined instruction
    inc  e
    db   $FC ; Undefined instruction
    and  $FE
    scf
    rst  $38
    dec  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ld   b, $FE
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
    db   $FC ; Undefined instruction
    inc  b
    ld   a, [$FF70]
    ld    hl, sp+$38
    ld    hl, sp+$38
    ld   a, [$FF30]
    ld   [$FF60], a
    ret  nz
    ret  nz

label_CEB1A::
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    inc  sp
    ccf
    inc  hl
    ccf
    ldi  [hl], a
    rra
    db   $10 ; Undefined instruction
    jr   label_CEB3A
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   c, $FF
    ld   [$00FF], sp
    rst  $38
    jr   nz, label_CEB1A
    ld   d, b
    adc  a, a
    adc  a, h
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
    sub  a, c
    sub  a, e
    db   $FD ; Undefined instruction
    sub  a, e
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
    and  $04
    xor  a
    ld   d, h
    sub  a, a
    ld   l, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    inc  b
    cp   l
    inc  b
    rst  $38
    inc  b
    rst  $38

label_CEB71::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   h, a
    jr   nz, label_CEB71
    dec  hl
    ld   a, [rNR51]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $ED ; Undefined instruction
    sbc  a, e
    ret
    cp   a
    ret
    cp   a
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
    nop
    ld   a, h
    db   $FC ; Undefined instruction
    ld   h, b
    ld   [$FF30], a
    ld   a, [$FF30]
    ld   a, [$FF70]
    ld   a, [$FF60]
    ld   [$FFE0], a
    ld   [$FFC0], a
    ret  nz
    ld   [bc], a
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    ld   c, $FE
    ld   e, $FE
    cp   $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    rlca
    rst  $38
    rlca
    rst  $38

label_CEBE4::
    rlca
    rst  $38

label_CEBE6::
    ld   c, $FE

label_CEBE8::
    inc  e
    db   $FC ; Undefined instruction
    jr   label_CEBE4
    jr   c, label_CEBE6
    jr   c, label_CEBE8
    ld    hl, sp+$F8
    ld   a, [$FFF0]
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
    jr   nc, label_CEC41
    jr   label_CEC23
    ld   c, $0F
    ld   bc, $0001
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
    rlca
    rst  $38
    ld    hl, sp+$F8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop

label_CEC23::
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    jr   nc, label_CEC6B
    rrca
    rrca
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
    pop  af
    rst  $38
    ld   c, $0E
    ld   a, [hl]

label_CEC41::
    rst  $38
    xor  c
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
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [hl], b
    ld   a, a
    ld   a, b
    ld   a, a
    rra
    rra
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_CEC68
    jr   label_CEC6A

label_CEC6B::
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
    jr   label_CEC78
    jr   label_CEC7A
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
    jr   label_CEC88
    jr   label_CEC8A
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
    jr   label_CEC98
    jr   label_CEC9A
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
    jr   label_CECA8
    jr   label_CECAA
    inc  h
    rst  $38
    ld   b, d
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
    inc  b
    rst  $38
    inc  e
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    adc  a, a
    nop
    rst  $38
    nop
    rst  $18
    nop
    ld   a, a
    nop
    ccf
    nop
    rlca
    nop
    nop
    nop
    ld   b, b
    nop
    rst  $38
    nop
    cp   $00
    ei
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    pop  hl
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    pop  bc
    nop
    nop
    nop
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
    ld   bc, label_F01
    rrca
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
    inc  bc
    inc  bc
    rst  0
    rst  0
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_CED60
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rra
    rst  $38
    ld   e, c
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
    or   b
    or   b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    rst  $38
    add  hl, de
    ld   sp, hl
    ld   [hl], b
    ld   a, [$FFC0]
    ret  nz
    nop
    nop
    inc  c
    db   $FC ; Undefined instruction
    ld   [label_18F8], sp
    ld    hl, sp+$30
    ld   a, [$FFE0]
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop

label_CED60::
    nop
    nop
    inc  bc
    inc  bc
    rlca
    rlca
    rrca
    rrca
    inc  e
    rra
    jr   label_CED8B
    jr   label_CED8D
    inc  e
    rra
    rlca
    rlca
    rra
    rra
    rra
    rra
    inc  a
    ccf
    jr   c, label_CEDB9
    jr   nc, label_CEDBB
    jr   nc, label_CEDBD
    ld   a, [$FFFF]
    nop
    nop
    ld   bc, label_F01
    rrca
    rra
    rra
    ld   a, a
    ld   a, a
    ld    hl, sp+$FF
    ld   h, b

label_CED8D::
    ld   a, a
    pop  hl
    rst  $38
    inc  bc
    inc  bc
    adc  a, a
    adc  a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    cp   $FF
    add  a, e
    rst  $38
    ld   [$FFE0], a
    ld   a, [$FFF0]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    jp   label_7FF
    rst  $38
    add  a, h
    rst  $38
    ld   bc, rSB
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_CEDB9::
    rst  $38
    ld    hl, sp+$FF
    ld   c, $FF
    ld   [bc], a
    rst  $38
    ret  nz
    ret  nz
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   e, $FF
    rlca
    rst  $38
    ld   [$00FF], sp
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FFF0]
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, $FE
    ld   e, $FE
    adc  a, a
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_CEDE8
    jr   label_CEDEA
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
    jr   label_CEDF8
    jr   label_CEDFA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    ld   a, a
    ld   a, a
    db   $E8 ; add  sp, d
    rst  $38
    add  a, c
    rst  $38
    ld   b, b
    ld   a, a
    nop
    ccf
    nop
    rlca
    nop
    nop
    nop
    nop
    xor  l
    rst  $38
    ld   h, e
    rst  $38
    ld    hl, sp+$FF
    ld   [$00FF], sp
    rst  $38
    nop
    cp   a
    nop
    rlca
    nop
    nop
    jp   label_7FF
    rst  $38
    ld   [$00FF], sp
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    nop
    add  a, [hl]
    nop
    nop
    sbc  a, [hl]
    cp   $CF
    rst  $38
    ld   b, a
    rst  $38
    inc  bc
    rst  $38
    nop
    cp   $00
    cp   [hl]
    nop
    nop
    nop
    nop
    rlca
    rlca
    ccf
    ccf
    ld   a, h
    ld   a, a
    add  a, $FF
    ld   [$00FF], sp
    ld   a, a
    nop
    ld   e, $00
    nop
    ret  nz
    ret  nz
    ld   a, [$FFF0]
    ld   a, $FE
    rrca
    rst  $38
    ld   h, b
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [hl], b
    ld   a, [$FF38]
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, h
    db   $FC ; Undefined instruction
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    jr   nz, label_CEEC5
    jr   label_CEEA7
    rlca
    rlca
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
    ret  nz
    rst  $38
    dec  sp
    ccf
    nop
    nop
    nop
    nop
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_CEEA7::
    rst  $38
    nop
    rst  $38
    or   b
    rst  $38
    inc  c
    rrca

label_CEEAE::
    inc  bc
    inc  bc
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

label_CEEBB::
    db   $FC ; Undefined instruction
    jr   nc, label_CEEAE
    add  a, b
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_8FF
    ld    hl, sp+$80
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_6FF
    cp   $00
    db   $FC ; Undefined instruction
    and  b
    ld   a, [$FF00]
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
    jr   label_CEEE8
    jr   label_CEEEA
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
    jr   label_CEEF8
    jr   label_CEEFA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    ld   bc, label_301
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ccf
    ccf
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    ret  nz
    rst  $38
    ld   a, [$FFFF]
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
    add  a, b
    rst  $38
    nop
    rst  $38
    inc  c
    rrca
    inc  c
    rrca
    ld   a, $3F
    ld   a, a
    ld   a, a
    ld   a, b
    ld   a, a
    ld   [hl], b
    ld   a, a
    ld   h, b
    ld   a, a
    ld   [rIE], a
    ld   [hl], e
    ld   [hl], e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    dec  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FFF0]
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  e
    db   $FC ; Undefined instruction
    rrca
    rst  $38

label_CEF4A::
    rrca
    rst  $38

label_CEF4C::
    rlca
    rst  $38
    inc  b
    rst  $38
    jr   c, label_CEF4A
    jr   label_CEF4C
    inc  e
    db   $FC ; Undefined instruction
    ld   a, $FE
    ld   a, $FE
    rrca
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    inc  e
    db   $FC ; Undefined instruction
    dec  c
    db   $FD ; Undefined instruction
    rrca
    rst  $38
    rrca
    rst  $38
    inc  b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   [hl], b
    ld   a, [$FF3C]
    db   $FC ; Undefined instruction
    ld   a, $FE
    rrca
    rst  $38
    rrca
    rrca
    ld   c, $0F
    inc  e
    rra
    ld   e, $1F
    ld   e, $1F
    ld   c, $0F
    rrca
    rrca
    inc  bc
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FF
    rst  $38
    ld   c, $FF
    ccf
    rst  $38
    rst  $30
    rst  $30
    jp   label_FFC3
    rst  $38
    rst  $38
    rst  $38
    ld   a, $3F
    ld   b, $07
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    db   $EC ; Undefined instruction
    rst  $28
    inc  c
    rrca
    ld   c, $0F
    ld   c, $0F
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
    ld   bc, rSB
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld    hl, sp+$78
    ld    hl, sp+$38
    rst  $38
    rrca
    rst  $38
    rst  0
    rst  $38
    ld   b, a
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
    ld   [$FFE0], a
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    ld   h, h
    cp   $86
    rst  $38
    rst  $38
    ld   d, l
    rst  $38
    and  d
    rst  $38
    add  a, c
    rst  $38
    ld   [label_1BF], sp
    sbc  a, a
    jr   nz, label_CF0A0
    nop
    sbc  a, h
    rst  $38
    rst  $38
    ld   d, l
    rst  $38
    ld   b, l
    rst  $38
    db   $10 ; Undefined instruction
    ld   [$00FB], sp
    cp   h
    ld   [bc], a
    sbc  a, a

label_CF03E::
    nop
    xor  h

label_CF040::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    nop
    add  hl, bc
    nop
    ld   [bc], a
    nop
    ld   [label_1000], sp
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rst  0
    nop
    nop
    nop
    rlca
    inc  c
    ld   e, $10
    cp   c
    or   e
    xor  $F3
    adc  a, $E3
    ld   e, $63
    sbc  a, [hl]
    inc  hl
    sbc  a, $31
    adc  a, $59
    add  a, [hl]
    adc  a, c
    ld   b, $0A
    inc  b
    add  a, [hl]
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    jr   nz, label_CF03E
    jr   nz, label_CF040
    nop
    nop
    nop
    nop
    nop
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
    dec  sp
    inc  e
    cpl
    inc  de
    ld   a, a
    rrca
    ld   a, a
    rra
    ld   a, a
    rra
    ld   a, h
    rrca

label_CF0A0::
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    ld   [hl], b
    cp   $85
    cp   $F9
    rst  $38
    cp   $7F
    cp   $9F
    ld   a, h
    ld   bc, label_200
    ld   bc, label_304
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [label_807], sp
    rlca
    ld   [label_907], sp
    ld   b, $0F
    nop
    rla
    ld   [label_817], sp
    ld   h, $19
    ld   a, [hli]
    dec  d
    ld   c, h
    inc  sp
    ld   c, h
    inc  sp
    sbc  a, b
    ld   h, a
    ld   a, [$FF0F]
    ld   [rNR34], a
    jr   nz, label_CF0C4
    ld   b, b
    cp   b
    add  a, c
    ld   [hl], b
    inc  bc
    ret  nz
    adc  a, a
    nop
    sbc  a, $81
    db   $FC ; Undefined instruction
    add  a, e
    ld    hl, sp+$07
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    di

label_CF0FF::
    cp   $FF
    ld   [hl], c
    rst  $38
    add  a, b

label_CF104::
    rst  $38
    ld   b, b
    rst  $38
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, h
    rst  $38
    rlca
    rst  $38
    inc  bc
    cp   $9A
    cp   $8E
    cp   $46
    cp   $06
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  a
    cp   $0E
    rst  $38
    ld   bc, label_CE900
    nop
    inc  [hl]
    ld   hl, $0021
    nop
    nop
    ld   b, h
    nop
    jr   nz, label_CF12D

label_CF12D::
    ld   [$0000], sp
    db   $10 ; Undefined instruction
    nop
    dec  c
    nop
    add  a, b
    nop
    ld   [de], a
    add  a, b
    add  a, b
    nop
    ld   [$0000], sp

label_CF13E::
    nop
    ld   [$C020], sp
    jr   nz, label_CF104
    ld   h, b
    add  a, b
    ld   h, b
    add  a, b
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   b, b
    add  a, b
    ld   h, b
    add  a, b
    ld   [rJOYP], a
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   b, b
    add  a, b
    or   b
    ld   b, b
    ld   d, e
    ld   c, $8F
    ld   b, $8B
    ld   b, $9B
    ld   b, $73
    ld   c, $23
    ld   e, $66
    inc  e
    and  $1C
    and  [hl]
    inc  e
    or   h
    ld   [label_894], sp
    ld   d, h
    adc  a, b
    ld   c, h
    add  a, b
    ld   b, b
    add  a, b
    jr   nz, label_CF13E
    jr   nz, label_CF140
    ld   a, a
    inc  sp
    rst  $38
    inc  e
    rst  $38
    cpl
    rst  $38
    ccf
    rst  $38
    inc  e
    sbc  a, a
    ld   h, a
    adc  a, a
    ld   [hl], b
    add  a, c
    ld   a, [hl]
    add  a, a
    ld   a, b
    pop  bc
    ld   a, $7F
    nop
    ld   e, $00
    nop
    nop
    ld   e, $00
    nop
    nop
    nop
    nop
    jp   label_FF3D
    inc  bc
    rst  $38
    ccf
    cp   $7F
    rst  $38
    ld   h, b
    rst  $38
    ld   b, e
    db   $FC ; Undefined instruction
    rrca
    di
    rra
    or   $1F
    db   $ED ; Undefined instruction
    ccf
    db   $EB ; Undefined instruction
    ccf
    ld   l, d
    ccf
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
    inc  bc
    inc  bc
    rrca
    rrca
    rrca
    rrca
    inc  e
    rra
    jr   c, label_CF20F
    nop
    ret  nz
    nop
    inc  c
    nop
    inc  bc
    nop
    nop
    nop
    jr   nc, label_CF1DB

label_CF1DB::
    db   $EC ; Undefined instruction
    nop
    ld   [hl], $60
    ld    hl, sp+$00
    nop
    nop
    nop
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    cp   $FF
    ld   h, b
    rst  $38
    ld   a, b
    rst  $38
    add  a, [hl]
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
    sub  a, b
    nop
    ld   c, b
    nop
    jr   nz, label_CF200
    nop
    rst  $38
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    rlca
    rst  $38
    ld   bc, $00FF
    rst  $38
    ld   h, c
    rst  $38
    rst  $20
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    cp   a
    rst  $38
    adc  a, a
    rst  $38
    add  a, [hl]
    rst  $38
    add  a, d
    nop
    ld   bc, label_300
    nop
    ld   hl, label_CC700
    nop

label_CF229::
    ld   c, e
    nop
    rrca
    ld   [bc], a
    rlca
    ld   [bc], a
    add  a, e
    ld   [bc], a
    rst  $18
    dec  c
    cp   a
    db   $10 ; Undefined instruction
    ld   c, e
    rst  $38
    sbc  a, a
    rst  $38
    sbc  a, a
    rst  $38
    rra
    rst  $38

label_CF23E::
    cp   a
    rst  $38

label_CF240::
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, a
    ld   b, $9D
    ld   b, $3E
    inc  b
    jp   z, label_8A04

label_CF269::
    inc  b
    sbc  a, d
    inc  b
    ld   a, [$FF00+C]
    ld   [hl], d
    inc  c
    and  $1C
    and  d
    inc  e
    and  [hl]
    inc  e
    ld   [hl], d
    adc  a, h
    ld   d, h
    adc  a, b
    ld   c, h
    add  a, b
    jr   nz, label_CF23E
    jr   nz, label_CF240
    nop
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
    ret  nz
    ret  nz
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
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    jr   label_CF269
    jr   c, label_CF229
    ld   a, h
    ld   a, [$FF00+C]
    ld   sp, hl
    and  $1D
    ld   a, [$FCE7]
    scf
    db   $FC ; Undefined instruction
    db   $DB
    cp   $6B
    cp   $2B
    cp   $FF
    nop
    cp   $00
    add  a, b
    nop
    or   b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    jr   nc, label_CF30A
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
    di
    rst  $38
    rra
    rst  $38
    inc  c
    rst  $38
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
    rrca
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_CF34D
    jr   nz, label_CF34F
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   b, e
    inc  a
    inc  h
    jr   label_CF363
    db   $10 ; Undefined instruction
    nop
    dec  b
    nop
    nop
    nop
    nop
    nop
    jr   c, label_CF346

label_CF346::
    ret  nc
    jr   nz, label_CF368
    ld   [rTAC], a
    ei
    inc  bc

label_CF34D::
    db   $FD ; Undefined instruction
    ld   bc, label_20FE
    rst  $18
    ld   b, h
    cp   e
    ld    hl, sp+$07
    rra
    nop
    rla
    nop
    push hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_CF363::
    nop
    nop
    nop
    ret  nz
    nop

label_CF368::
    rst  $38
    ret  nz
    ld    hl, sp+$70
    sbc  a, h
    ld    hl, sp+$EE
    ld   a, h
    ld   a, a
    cp   [hl]
    ccf
    sbc  a, $DE
    inc  l
    ld   e, l
    jr   z, label_CF3C3
    jr   nc, label_CF3C5
    jr   nc, label_CF3A9
    db   $10 ; Undefined instruction
    stop
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
    ld   a, [$FFE0]
    ld    hl, sp+$F0
    ld   a, h
    ld    hl, sp+$BC
    ld   a, b
    call c, label_DCB8
    cp   b
    adc  a, $BC
    rst  0
    cp   [hl]
    rst  $20
    ld   e, [hl]
    di
    ld   l, [hl]
    sub  a, c
    ld   l, [hl]
    sbc  a, h
    ld   h, e
    ld   d, d
    xor  l
    ld   [hl], c
    adc  a, [hl]
    ld   d, c

label_CF3A9::
    xor  [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, h
    ld   bc, label_3FC
    ld    hl, sp+$03
    ld    hl, sp+$06
    pop  af
    ld   b, $E1
    dec  c
    ld  [$FF00+C], a
    inc  c
    jp   label_831C
    sub  a, c
    nop
    sbc  a, h

label_CF3C3::
    nop
    ld   d, [hl]

label_CF3C5::
    inc  c
    ld   a, a
    ld   c, $7F
    ld   l, $FF
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    db   $FD ; Undefined instruction
    ld   a, [hl]
    db   $FD ; Undefined instruction
    cp   $FB
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    or   $F8
    and  $F8
    db   $ED ; Undefined instruction
    ld   a, [$FFCC]
    ld   a, [$FF9C]
    ld   [$FF7C], a
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  d
    cp   $A2
    rst  $38
    add  hl, bc
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    ld   sp, hl
    rst  $38
    ld   a, [$FEFF]
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rlca
    nop
    rrca
    rlca
    rrca
    nop
    rra
    rrca
    ccf
    rra
    jr   label_CF40C

label_CF40C::
    rlca
    nop
    inc  c
    nop
    inc  sp
    inc  bc
    ld   b, h
    nop
    add  a, e
    nop
    ret  z
    nop
    cp   a
    ret  nz
    rst  $38
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
    ld   bc, label_200
    ld   bc, label_304
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    dec  b
    ld   [bc], a
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
    cp   $00
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    inc  b
    ei
    ld   [label_CFEF7], sp
    add  a, c
    add  a, e
    nop
    rlca
    nop
    ld   a, c
    nop
    ld   b, c
    nop
    ld   b, b
    nop
    ld   h, b
    nop
    jr   nz, label_CF460

label_CF460::
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    cp   b
    ld   b, b
    rst  $38
    jr   c, label_CF4AA
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
    rlc  l
    ld   d, e
    dec  c
    ld   d, e
    inc  c
    inc  d
    ld   [label_102B], sp
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
    ld    hl, sp+$60
    ld   a, h
    jr   c, label_CF4CD
    jr   label_CF4D1
    inc  e
    ld   l, $1C
    ld   d, $0C
    rst  $30
    ld   c, $17
    ld   c, $97
    ld   c, $37
    ld   c, $CF
    jr   nc, label_CF4EF
    or   e
    ld   a, [hli]
    push de
    add  hl, sp
    add  a, $29
    sub  a, $81
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, h
    ld   bc, label_3FC
    ld    hl, sp+$03
    ld    hl, sp+$06
    pop  af
    ld   b, $E1
    dec  c
    ld  [$FF00+C], a
    inc  c
    jp   label_831C
    rst  8
    nop
    ld   c, h
    nop
    ld   l, $04
    ccf
    ld   b, $3F
    ld   d, $BF
    ld   a, [hl]
    rst  $38

label_CF4CD::
    ld   a, [hl]
    db   $FD ; Undefined instruction
    ld   a, [hl]
    db   $FD ; Undefined instruction

label_CF4D1::
    cp   $FB
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    or   $F8
    and  $F8
    db   $ED ; Undefined instruction
    ld   a, [$FFCC]
    ld   a, [$FF9C]
    ld   [rJOYP], a
    nop
    add  a, b
    nop
    rst  0
    add  a, b
    db   $04
    inc  b
    push hl
    add  a, h
    push bc
    add  a, h
    sbc  a, e
    add  hl, de
    ld   h, a

label_CF4EF::
    ld   h, e
    sbc  a, a
    add  a, a
    ld   a, [hl]
    rra
    cp   h
    rra
    ld   a, [$FF1F]
    pop  af
    ld   c, $FF
    nop
    ld   bc, $0100
    nop
    rlca
    nop
    rrca
    rlca
    rrca
    nop
    rra
    rrca
    ccf
    rra
    jr   label_CF50C

label_CF50C::
    rlca
    nop
    inc  c
    nop
    inc  de
    inc  bc
    inc  l
    nop
    ld   b, e
    nop
    add  a, b
    nop
    rst  8
    add  a, b
    cp   a
    ret  nz
    ld   a, a
    add  a, b
    ld   a, [$FF00]
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
    ld   [hl], b
    rrca
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_FFE
    ld   a, [$FF31]
    ret  nz
    ld   b, b
    add  a, b
    di
    nop
    ld   c, h
    nop
    ld   b, c
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    add  a, b
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
    rlca
    ld   c, b
    rlca
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rla
    ld   [$0000], sp
    nop
    nop
    add  a, b
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    nop
    jr   nc, label_CF58E

label_CF58E::
    jr   label_CF590

label_CF590::
    inc  e
    ld   [label_C9E], sp
    adc  a, [hl]
    inc  b
    adc  a, a
    ld   b, $8F
    ld   b, $8F
    inc  b
    rst  $30
    inc  c
    adc  a, a
    ld   b, $4F
    or   b
    ld   c, h
    or   e
    ld   a, [hli]
    push de
    add  hl, sp
    add  a, $69
    sub  a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, h
    ld   bc, label_3FC
    ld    hl, sp+$03
    ld    hl, sp+$06
    pop  af
    ld   b, $E1
    dec  c
    ld  [$FF00+C], a
    inc  c
    jp   label_831C
    ld   c, a
    nop
    ld   c, h
    nop
    ld   l, $04
    ccf
    ld   b, $7F
    ld   d, $BF
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    db   $FD ; Undefined instruction
    ld   a, [hl]
    db   $FD ; Undefined instruction
    cp   $FB
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    or   $F8
    and  $F8
    db   $ED ; Undefined instruction
    ld   a, [$FFCC]
    ld   a, [$FF9C]
    ld   [rTAC], a
    nop
    ld   a, b
    nop
    add  a, b
    nop
    jp   label_FF00
    jp   nz, label_FCFF
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ld   a, [$FFAF]
    pop  af
    ld   l, [hl]
    or   $68
    ld    hl, sp+$60
    ld   a, [$FFE0]
    ld   [$FFC0], a
    ld   [$FF80], a
    add  a, b
    nop
    ld   a, h
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    ld   [$FFE0], a
    ld   a, [$FFF0]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    add  hl, de
    rst  $38
    ld   a, a
    rst  $38
    sbc  a, a
    rst  $38
    rst  8
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    rrca
    rrca
    rra
    rra
    rra
    inc  e
    rrca
    rrca
    rra
    rra
    ccf
    ld   a, $FF
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    cp   $FF
    rst  $28
    rst  $38
    ld   e, $00
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    rrca
    rrca
    rra
    rra
    rra
    rra
    rrca
    rrca
    rra
    rra
    rra
    inc  e
    rst  $18
    ret  c
    rst  $38
    ld   a, [$FFFF]
    cp   $FF
    adc  a, a
    rst  $38
    rra

label_CF670::
    rst  $38
    add  a, $FF
    adc  a, $FF
    call z, label_DCFF
    rst  $38
    ld   [hl], h
    rst  $38
    ld   h, a
    rst  $38
    rst  0
    rst  $38
    adc  a, a
    rst  $38
    jr   nz, label_CF682
    jr   nz, label_CF684
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   [rIE], a
    add  a, b
    rst  $38
    nop
    nop
    nop
    add  a, b
    add  a, b
    rst  8
    rst  8
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    add  hl, de
    rst  $38
    ld   a, h
    rst  $38
    add  a, d
    rst  $38
    ld   a, [$FF00]
    ld   a, h

label_CF6A3::
    jr   nc, label_CF6A3
    ld   a, h
    rst  $38
    ld  [$FF00+C], a
    ld   a, [$E45C]
    cp   b
    ret  z
    ld   [hl], b
    jr   nc, label_CF670
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    sbc  a, [hl]
    ld   a, b
    ld   l, a
    ld   e, $1F
    rlca
    ccf
    rra
    db   $F4 ; Undefined instruction
    ccf
    rst  $38
    ld   [hl], b
    ld   a, [$FF40]
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
    ld    hl, sp+$00
    rst  $38
    ld   a, b
    rst  $20
    ccf
    ld   a, a
    rlca
    ld   e, $0F
    ld   a, b
    rra
    ld   sp, hl
    ld   a, [hl]
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
    ld   b, b
    nop
    jr   nz, label_CF705

label_CF705::
    and  d
    nop
    ld   c, c
    nop
    add  a, l
    add  a, b
    and  l
    add  a, b
    and  b
    nop
    xor  b
    rst  $38
    ld   h, a
    rst  $38
    inc  hl
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    dec  a
    rst  $38
    rrca
    rst  $38
    inc  bc
    rst  $38
    nop
    ld   a, [$FFF0]
    ld   [$FF60], a
    ld   [rLCDC], a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $FE
    rst  $38
    cp   a
    rst  $38
    rst  8
    rst  $38
    jp   label_81F
    rra
    nop
    rra
    nop
    rra
    inc  c
    ccf
    jr   c, label_CF7BA
    ld   a, c
    ld   a, a
    ld   l, e
    ld   a, a
    ld   h, a
    rst  $38
    jr   c, label_CF742
    jr   nc, label_CF744
    jr   nz, label_CF746
    inc  l
    rst  $38
    ccf
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    ld   h, b
    rra
    ld   [bc], a
    rra
    rlca
    rra
    ld   b, $1F
    inc  c
    ccf
    jr   label_CF7DA
    ld   a, c
    ld   a, a
    ld   l, e
    ld   a, a
    ld   h, a
    rst  $38
    ld   a, c
    rst  $38
    or   $FF
    ld   l, a
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    ld   h, b
    rst  $38
    sbc  a, h
    rst  $38
    inc  e
    rst  $38
    jr   label_CF776
    jr   label_CF778
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   [bc], a
    add  a, e
    nop
    sub  a, e
    nop
    ld   d, $00
    inc  de
    nop
    ld   c, d
    nop
    ld   c, c
    nop
    inc  h
    nop
    stop
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
    ld   b, a
    rst  $38
    add  hl, sp
    rst  $38
    cp   a
    rst  $38
    sbc  a, a
    rst  $38
    cpl
    rst  $38
    rra
    ld   a, a
    daa
    cp   a
    ld   d, $7F
    jr   nz, label_CF82D
    inc  de
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

label_CF7BA::
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, [$FFF0]
    db   $FC ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    pop  af
    rst  $38
    ld   a, [$F0FF]
    rst  $38
    inc  h
    cp   $48
    db   $FD ; Undefined instruction
    nop
    ld   a, [$E840]
    ld   b, b
    db   $E8 ; add  sp, d
    ld   b, b
    ld   [rJOYP], a
    jp   nz, label_C200

label_CF7DA::
    nop
    inc  h
    nop
    ld   b, b
    nop
    add  a, b
    nop
    nop
    nop
    ld   [label_400], sp
    nop
    jr   nz, label_CF7E9

label_CF7E9::
    stop
    ld   [$0000], sp
    nop
    nop
    nop
    ccf
    nop
    sbc  a, c
    nop
    ld   h, a
    nop
    nop
    nop
    inc  bc
    nop
    ld   b, b
    nop
    jr   nc, label_CF7FF

label_CF7FF::
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop

label_CF808::
    ld   bc, label_200
    ld   bc, $0007
    ld   c, $01
    jr   label_CF819
    db   $10 ; Undefined instruction
    jr   nz, label_CF835
    jr   nz, label_CF837
    ld   b, b

label_CF819::
    ccf
    ld   b, b
    ccf
    add  a, b

label_CF81D::
    ld   a, a
    add  a, b
    ld   [hl], a
    nop
    nop
    rlca
    nop
    jr   c, label_CF82D
    ld   h, b

label_CF827::
    rra
    add  a, b
    ld   a, a
    ld   [hl], b
    adc  a, a
    add  a, b

label_CF82D::
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_CF835::
    rst  $38
    nop

label_CF837::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_CF81D
    ld   b, b
    ccf
    cp   $00
    add  a, c
    ld   a, [hl]

label_CF844::
    ld   [hl], b
    adc  a, a

label_CF846::
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    jr   label_CF827
    ld   bc, $E200
    ld   bc, $C33C
    ld   b, $F9
    ld   bc, $00FE

label_CF86B::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ret  nz
    nop
    nop
    ret  nz
    nop
    jr   nc, label_CF844
    jr   label_CF846
    jr   nz, label_CF808
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   [hl], b
    nop
    ld   a, b
    add  a, b
    inc  a
    adc  a, b
    ld   e, $84
    rrca
    ld   b, $07
    ld   [bc], a
    rlca
    ld   bc, $0113
    ld   [hl], e
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
    ret  nz
    nop
    cp   b
    nop
    cp   h
    jr   label_CF841
    ld   l, [hl]
    sub  a, c
    ld   c, h
    sub  a, c
    ld   c, b
    and  c
    jr   label_CF86B
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    ld   [de], a
    nop
    ld   a, [bc]
    nop
    dec  b
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
    ret  nz
    ccf
    ld   b, b
    inc  a
    add  a, c
    ld   a, b
    add  a, e
    ld   [hl], b
    add  a, a
    ld   h, b
    add  a, a
    ld   h, c
    add  a, a
    ld   b, c
    ld   c, a
    ld   [bc], a
    ld   c, a
    dec  b
    cpl
    inc  b

label_CF8F4::
    cpl
    ld   b, $3F

label_CF8F7::
    ld   b, $9F
    ld   b, $1F
    ld   b, $1F
    rlca
    rra
    rlca
    jr   nc, label_CF90E
    ld   d, e
    jr   z, label_CF8F4
    ld   d, e
    rst  $38
    ld   c, a
    rst  $38
    ld   e, $FF
    cp   [hl]
    rst  $38
    db   $FD ; Undefined instruction

label_CF90E::
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
    jp   label_FFBF
    nop
    add  a, b
    rst  $38
    cp   $C1
    rst  $38
    nop
    db   $FC ; Undefined instruction
    ccf
    cp   $FF
    cp   $C7
    db   $FC ; Undefined instruction
    and  e
    cp   $05
    cp   $CF
    db   $FC ; Undefined instruction
    rst  0
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    and  e
    ld   b, c
    ld   b, c
    add  a, b
    ld   b, c
    add  a, b
    ld   b, c
    and  b
    ld   b, e
    or   c
    ld   b, e
    or   c
    ld   b, e
    or   c
    ld   b, a
    or   d
    ld   b, a
    or   d
    daa
    jp  c, label_DA26
    ld   d, $EA
    ld   d, $EB
    inc  de
    jp   [hl]
    inc  hl
    db   $21
    ld   hl, $FCDE
    jr   c, label_CF95F
    ld   a, b
    db   $EC ; Undefined instruction
    ret  c
    call z, label_CE98
    cp   b
    sbc  a, [hl]
    jr   c, label_CF90A
    ld   a, b
    add  hl, sp
    ld   [hl], b
    add  hl, sp
    ld   a, [$FF39]
    ld   a, [$FF79]
    ld   a, [$FF79]
    ld   [$FFF2], a

label_CF979::
    ld   [$FFE2], a
    ret  nz
    ld  [$FF00+C], a
    ret  nz
    ld  [$FF00+C], a
    ret  nz
    cpl
    rla
    cpl
    rla
    cpl
    rla
    ld   c, a
    scf
    ld   c, a
    scf
    ld   b, a
    dec  sp
    ld   b, a
    dec  sp
    ld   b, e
    add  hl, sp
    ld   b, c
    jr   c, label_CF9D3
    jr   c, label_CF9D5
    jr   c, label_CF9D7
    jr   c, label_CF9D9
    jr   c, label_CF9BB
    jr   label_CF9BD
    db   $10 ; Undefined instruction
    nop
    rst  $20
    rst  $18
    rst  $38
    rst  $38
    cp   $FF
    rst  $38
    ld   [rIE], a
    rst  $28
    rst  $38
    ld   a, [$FFFF]
    ld   a, [$FFF7]
    ld   a, [$FFFF]
    rst  $38
    ld   sp, hl
    ld   a, a
    ld   a, a
    ccf
    ld   c, [hl]
    ccf
    and  b

label_CF9B9::
    rra
    sub  a, b

label_CF9BB::
    rrca
    adc  a, a

label_CF9BD::
    nop
    add  a, h
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, b
    ld   a, a
    ld    hl, sp+$7F
    ld    hl, sp+$7F
    ld   a, [$FF7F]
    ld   a, [$FFFF]
    ld   [rIE], a
    call nz, label_88FB

label_CF9D5::
    rst  $30
    db   $10 ; Undefined instruction
    jr   nz, label_CF9B9
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    ld   hl, label_CC1DE
    cp   [hl]
    ld   b, c
    cp   [hl]
    ld   b, c
    cp   [hl]
    ld   b, b
    cp   [hl]
    ld   b, b
    cp   [hl]
    ld   b, b
    cp   [hl]
    add  a, b
    ld   a, h
    add  a, b
    ld   a, h
    add  a, b
    ld   a, h
    add  a, b
    ld   a, h
    add  a, b
    jr   c, label_CF979
    jr   c, label_CFA3B
    sub  a, b
    ld   b, c
    add  a, b
    ld   b, c
    add  a, b
    jp   nz, label_C280
    nop
    and  d
    ld   b, b
    sub  a, c
    ld   h, b
    sub  a, c
    ld   h, b
    adc  a, c
    ld   [hl], b
    adc  a, e
    ld   h, b
    adc  a, e
    ld   h, b
    adc  a, d
    ld   b, b
    sub  a, d
    ld   b, b
    sub  a, d
    nop
    or   d
    nop
    or   [hl]
    nop
    or   $00
    cp   $00
    cp   $00
    stop
    stop
    stop
    ld   [label_800], sp
    nop
    inc  b
    nop
    inc  b
    nop
    inc  c
    nop
    dec  d
    nop
    ld   h, l

label_CFA33::
    nop
    add  a, l
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop

label_CFA3B::
    nop
    nop
    nop
    nop
    nop
    add  a, [hl]
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
    rra
    sbc  a, a
    rlca
    rlca
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $000F
    add  hl, bc
    ld   b, $06
    ld   bc, label_205
    nop
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [$FFF0], a
    ld   [$FFF0], a

label_CFA75::
    ld   [$FFFC], a
    ret  nz
    db   $E4 ; Undefined instruction
    sbc  a, b
    sbc  a, b
    ld   h, b
    ld   [hl], b
    add  a, b
    adc  a, b
    ld   [hl], b
    ld   hl, label_21C0
    ret  nz
    ld   hl, $91C0
    ld   [$FFD1], a
    ld   [$FFFA], a
    ld   [$FFFA], a
    add  a, b
    adc  a, d
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
    cp   $00
    cp   $00
    inc  e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
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
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0000
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
    ld   [hl], b
    nop
    ret  z
    jr   nc, label_CFA75
    ld   a, b
    add  a, d
    ld   a, h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   bc, label_1FE
    cp   $01
    cp   $05
    ld   [bc], a
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc

label_CFB08::
    inc  b
    inc  bc
    ld   b, $01
    ld   b, $01
    dec  b
    ld   [bc], a
    inc  b
    inc  bc
    inc  b

label_CFB13::
    inc  bc
    ld   b, $01
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0080
    add  a, b
    nop
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   h, b
    add  a, b
    ld   [hl], b
    add  a, b
    ld   a, b
    add  a, b
    ld   a, h
    add  a, b
    ld   a, [hl]
    add  a, b

label_CFB36::
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    rra
    ld   [$FF1F], a
    ld   [$FF0B], a
    inc  b
    dec  c
    nop
    rlca
    nop
    inc  b
    inc  bc
    inc  bc
    nop
    ld   [bc], a
    ld   bc, label_205
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    db   $EC ; Undefined instruction
    nop
    rst  $30
    nop
    ld   sp, hl
    nop
    ld   a, [$FF00]
    ld   a, h
    ret  nz
    jr   z, label_CFB36
    ret  nc
    jr   nz, label_CFB99
    ret  nz
    ret  z
    jr   nc, label_CFB21
    ld   c, b
    db   $EC ; Undefined instruction
    nop
    jr   nz, label_CFB72

label_CFB72::
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_CFB99::
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
    nop
    nop
    nop
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
    nop
    nop
    ld   bc, label_F00
    nop
    rst  $38
    nop
    cp   $00
    nop
    nop
    ld   [bc], a
    ld   bc, $0102
    inc  b
    nop
    inc  b
    nop
    db   $F4 ; Undefined instruction
    nop

label_CFBCA::
    db   $FC ; Undefined instruction
    nop

label_CFBCC::
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    nop
    ld   a, [hl]
    nop
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    ld   bc, $0000
    rst  $38
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
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    nop
    rra
    nop
    rrca
    nop
    rlca
    add  a, b
    inc  bc
    ret  nz
    nop
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
    jr   nz, label_CFBCA
    jr   nz, label_CFBCC
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_8F0], sp
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, h
    ld   bc, $C07E
    ccf
    ld   b, b
    inc  a
    add  a, c
    ld   a, b
    add  a, e
    ld   [hl], b
    add  a, a
    ld   h, b
    add  a, a
    ld   h, c
    add  a, [hl]
    ld   b, e
    ld   c, l
    ld   [bc], a
    ld   c, a
    dec  b
    cpl
    inc  b

label_CFC34::
    cpl
    ld   b, $3F
    ld   b, $9F
    ld   b, $1F
    ld   b, $1F
    rlca
    rra
    rlca
    jr   nc, label_CFC4E
    ld   d, e
    jr   z, label_CFC34
    ld   d, e
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   e, $FF
    db   $FD ; Undefined instruction
    ld   a, a
    rst  $38

label_CFC4E::
    rst  $18
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
    jp   label_FFBF
    nop
    ld   [rIE], a
    cp   $81
    rst  $38
    nop
    db   $FC ; Undefined instruction
    ld   a, a
    cp   $FF
    cp   d
    rst  0
    ld   a, h
    and  e
    cp   $05
    cp   $CF
    db   $FC ; Undefined instruction
    rst  0
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    cp   $FF
    cp   $FF
    rst  $20
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [rIE], a
    rst  $28
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    rst  $38
    ld   sp, hl
    ld   a, a
    ld   a, a
    ccf
    ld   c, [hl]
    ccf
    and  b

label_CFC99::
    rra
    sub  a, b
    rrca
    adc  a, a
    nop
    add  a, h
    inc  bc
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   h
    rst  $38
    db   $FC ; Undefined instruction
    ccf
    db   $FC ; Undefined instruction
    ccf
    ld    hl, sp+$3F
    ld    hl, sp+$7F
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    db   $E4 ; Undefined instruction
    ei
    adc  a, b
    rst  $30
    db   $10 ; Undefined instruction
    jr   nz, label_CFC99
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    and  h
    and  h
    rst  $38
    rst  $38
    rst  $38
    sub  a, e
    db   $FD ; Undefined instruction
    sub  a, c
    rst  $38
    rst  $38
    rst  $38
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    ld   a, [bc]
    rrca
    ld   a, [bc]
    rrca
    rst  $38
    rst  $38
    cp   a
    db   $E4 ; Undefined instruction
    and  h
    rst  $38
    nop
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
    ret  nz
    ccf
    ld   b, b
    inc  a
    add  a, c
    ld   a, b
    add  a, e
    ld   [hl], b
    add  a, a
    ld   h, c
    add  a, a
    ld   h, c
    add  a, a
    ld   b, d
    ld   c, a
    nop
    ld   c, a
    dec  b
    cpl
    inc  b

label_CFD34::
    cpl
    ld   b, $3F
    ld   b, $9F
    ld   b, $1F
    ld   b, $1F
    rlca
    rra
    rlca
    jr   nc, label_CFD4E
    ld   d, e
    jr   z, label_CFD34
    ld   d, e
    rst  $38
    ld   c, $FF
    sbc  a, [hl]
    rst  $38
    rst  $18
    rst  $38
    ccf

label_CFD4E::
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ccf
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
    jp   label_FFBF
    nop
    db   $FC ; Undefined instruction
    jp   label_FF
    rst  $38
    ld   a, h
    db   $FC ; Undefined instruction
    rst  $38
    cp   [hl]
    rst  0
    ld   a, [hl]
    add  a, e
    ld    hl, sp+$25
    db   $FC ; Undefined instruction
    dec  b
    cp   $CF
    db   $FC ; Undefined instruction
    rst  0
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_CFD80::
    rst  $20
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    ld   [rIE], a
    rst  $28
    rst  $38
    rst  $28
    rst  $28
    ld   [rIE], a
    ld   a, [$FFF7]
    ld   a, [$FFFF]
    rst  $38
    ld    hl, sp+$7F
    ld   a, a
    ccf
    ld   c, [hl]
    ccf
    and  b

label_CFD99::
    rra
    sub  a, b
    rrca
    adc  a, a
    nop
    add  a, h
    inc  bc
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    cp   $1F
    ld   l, $DF
    ld   a, [hl]
    sbc  a, a
    db   $FC ; Undefined instruction
    rra
    db   $FC ; Undefined instruction
    ccf
    ld    hl, sp+$7F
    ld   a, [$FFFF]
    db   $E4 ; Undefined instruction
    ei
    adc  a, b
    rst  $30
    db   $10 ; Undefined instruction
    jr   nz, label_CFD99
    ret  nz
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, d
    cp   $FE
    cp   $FF
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
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
    ld   [$887F], sp
    rst  $38
    rst  $38
    rst  $38
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    rst  $38
    rst  $38
    ld   [$887F], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
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
    rst  $38
    and  l
    cp   $A4
    rst  $38
    rst  $38
    rst  $38
    ld   [bc], a
    inc  bc
    inc  b
    rlca
    dec  b
    rlca
    inc  bc
    inc  bc
    dec  b
    rlca
    inc  b
    rlca
    ld   [bc], a
    inc  bc
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    ld   [$887F], sp
    rst  $38
    rst  $38
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    rst  $38
    sbc  a, a
    rst  $38
    sbc  a, a
    rst  $38
    ld   e, a
    rst  $38
    ld   a, a
    rst  $38
    ld   e, a
    rst  $38
    sbc  a, a
    rst  $38
    sbc  a, a
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    cp   $82
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [label_8FF], sp
    rst  $38

label_CFEC7::
    rst  $38
    rst  $38
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    rst  $38
    rst  $38
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
    add  a, a
    nop

label_CFEE4::
    ld   e, b
    add  a, a
    jr   nz, label_CFEC7
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
    cp   a
    ld   l, b
    cp   a
    ld   b, b

label_CFEF7::
    cp   a
    rst  $38
    nop
    rst  $38
    rst  $30
    adc  a, h
    rst  $30
    ld   [label_3F7], sp
    nop
    inc  b
    inc  bc
    jr   label_CFF0D
    jr   z, label_CFF1F
    ld   b, h
    dec  sp
    ld   b, b
    ccf
    jr   nz, label_CFF2D
    jr   nz, label_CFF2F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_CFF1F::
    nop
    ret  nz
    nop
    jr   nz, label_CFEE4
    rla
    ld   [$FF08], a
    rst  $30
    ld   [$00F7], sp
    rst  $38
    nop

label_CFF2D::
    rst  $38
    nop

label_CFF2F::
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
    ld   b, d
    inc  a
    add  a, c
    ld   a, [hl]
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
    ld   b, d
    inc  a
    add  a, c
    ld   a, [hl]
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ld   b, b
    ccf
    ld   b, b
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
    ld   bc, label_CE200
    ld   bc, label_CE394
    adc  a, h
    ld   [hl], e
    nop
    rst  $38
    nop
    rst  $38
    nop

label_CFF8F::
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
    inc  de
    ld   [$FF0C], a
    di
    inc  b
    ei
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    inc  b
    inc  bc
    ld   [hl], h
    inc  bc
    adc  a, b
    ld   [hl], a
    add  a, b
    ld   a, a
    add  a, b
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
    jr   nz, label_FFFF8003
    ld   b, b
    ccf
    ret  nz
    ccf
    ld   b, b
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
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
