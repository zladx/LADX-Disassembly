section "bank43",romx,bank[$2B]
    nop

label_AC001::
    nop
    nop
    nop
    inc  b
    nop
    ld   [bc], a
    nop
    ld   [label_1A00], sp
    nop
    stop
    jr   nz, label_AC010

label_AC010::
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    nop
    nop
    sbc  a, b
    nop
    ld   b, b
    nop
    inc  c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    dec  b
    ld   b, $05
    ld   b, $00
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   h, b
    jr   nz, label_AC0C9
    jr   nz, label_AC0CB
    jr   nz, label_AC0BD
    jr   nc, label_AC0BF
    jr   nc, label_AC071

label_AC071::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AC0BD::
    nop
    nop

label_AC0BF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AC0C9::
    nop
    nop

label_AC0CB::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   d, b
    nop
    jr   nz, label_AC0F8

label_AC0F8::
    ld   h, b
    nop
    sub  a, b
    nop
    jr   nz, label_AC0FE

label_AC0FE::
    jr   nc, label_AC100

label_AC100::
    inc  b
    nop
    jr   c, label_AC104

label_AC104::
    ld   b, c
    nop
    ld   d, $00
    inc  e
    nop
    ld   [de], a
    nop
    inc  b
    nop
    nop
    nop
    stop
    jr   c, label_AC114

label_AC114::
    nop
    nop
    inc  a
    nop
    stop
    stop
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
    rra
    rra
    cpl
    jr   nc, label_AC147
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
    ret  nz
    ld    hl, sp+$38
    inc  [hl]
    inc  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AC147::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    dec  b
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $FF
    ld   a, [$FEFE]
    ld   d, b
    jr   nc, label_AC1B3
    jr   nc, label_AC1B5
    jr   nc, label_AC1B7
    jr   nc, label_AC1B9
    jr   nc, label_AC1BB
    jr   nc, label_AC1EC
    cpl
    rst  $38
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
    add  a, b
    add  a, b
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
    inc  bc
    inc  bc
    rra
    inc  e
    inc  l
    jr   nc, label_AC191

label_AC191::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$F8
    db   $F4 ; Undefined instruction
    inc  c
    add  hl, de
    add  hl, bc
    nop
    nop
    ld   bc, label_F01
    ld   c, $31
    ccf
    ld   e, [hl]
    ld   a, [hl]
    ld   [hl], b
    ld   h, b
    jp   label_F83
    inc  c
    ccf
    ld   a, a
    rst  $38

label_AC1B3::
    ret  nz
    rst  $38

label_AC1B5::
    nop
    rst  $38

label_AC1B7::
    rst  $38
    nop

label_AC1B9::
    nop
    nop

label_AC1BB::
    nop
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
    cp   $01
    ld   bc, $0000
    ld   [$FFE0], a
    db   $FC ; Undefined instruction
    inc  e
    ld   a, [$FFF0]
    db   $FC ; Undefined instruction
    inc  c
    cp   $02
    rst  $38
    ld   bc, $80FF
    ld   a, a
    ld   h, b
    rra
    db   $10
    db   $0F
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b

label_AC1EC::
    ld   [rNR41], a
    ld   a, [$FF10]
    stop
    inc  a
    nop
    ld   c, $00
    jr   c, label_AC1F8

label_AC1F8::
    ld   [label_1F00], sp
    nop
    jr   label_AC1FE

label_AC1FE::
    jr   label_AC200

label_AC200::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_AC216

label_AC216::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [bc]
    inc  c
    rlca
    ld   b, $07
    dec  b
    rlca
    inc  b
    rlca
    inc  b
    rlca

label_AC22B::
    inc  b
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   a, [de]
    ld   b, $0D
    inc  bc
    ld   b, $81
    jp   label_E1C0
    jr   nz, label_AC22B
    db   $10
    db   $F8
    ld   [label_C78], sp
    rlca
    rlca
    rlca
    rlca
    adc  a, a
    adc  a, a
    ld   c, a
    rst  8
    xor  a
    ld   l, a
    rst  $38
    ccf
    ld   a, a
    ccf
    ld   a, a
    ld   a, a
    cp   $FE
    rst  $38
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
    ccf
    rst  $38
    ccf
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
    ld   [$FFE0], a
    ld   [$FFE0], a
    pop  af
    pop  af
    ld   a, [$FF00+C]
    push af
    or   $FF
    db   $FC ; Undefined instruction
    cp   $FC
    cp   $FE
    ld   e, b
    ld   h, b
    or   b
    ret  nz
    ld   h, b
    add  a, c
    jp   label_8703
    inc  b
    rrca
    ld   [label_101F], sp
    ld   e, $30
    ld   d, c
    ld   sp, label_AE1E1
    pop  hl
    and  e
    rst  $20
    inc  h
    xor  $28
    call c, label_AF950
    ld   h, c
    db   $76 ; Halt
    ld   b, [hl]
    ccf

label_AC2A1::
    jr   nc, label_AC2A1
    ret  nz
    ld    hl, sp+$00
    ret  nz
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FFF0]
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
    ld   bc, label_F00
    nop
    rra
    nop
    rst  $38
    inc  bc
    rra
    nop
    rlca
    nop
    rlca
    nop
    ccf
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    rlca
    inc  b
    jp   label_E182
    ld   b, c
    ld    hl, sp+$20
    db   $FC ; Undefined instruction
    db   $10
    db   $FE
    ld   [label_4FF], sp
    rst  $38
    inc  b
    ld   a, [$FF10]
    ld    hl, sp+$18
    ld    hl, sp+$08
    cp   h
    call nz, label_AC47C
    ld   e, [hl]
    ld   h, d
    cpl
    ld   sp, label_3DA3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [bc]
    nop
    ld   a, d
    nop
    add  a, d
    nop
    add  a, d
    nop
    ld   a, a
    nop
    ld   a, [bc]
    nop
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
    ret  nz
    nop
    ld   d, b
    nop
    ld   [bc], a
    cp   $02
    ld   [bc], a
    or   $0A
    cp   $02
    cp   $02
    db   $EC ; Undefined instruction
    inc  d
    db   $FC ; Undefined instruction
    inc  b
    ld   [label_3CF8], sp
    inc  b
    rra
    dec  b
    rrca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    ld   b, $06
    ld   b, $06
    pop  hl
    pop  hl
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
    ld   e, $1E
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    rra
    rra
    rrca
    rrca
    rrca
    rrca
    rlca
    rlca
    rlca
    rlca
    add  a, a
    add  a, a
    rst  $38
    rst  $38
    cp   $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   [$FFE0], a
    ld   [$FFE0], a
    add  a, a
    add  a, a
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    ld   a, b
    ld   a, b
    cp   $FE
    ld   a, $20
    cp   $A0
    db   $FC ; Undefined instruction
    ret  nz
    db   $FD ; Undefined instruction
    pop  bc
    db   $FD ; Undefined instruction
    pop  bc
    rst  $38
    pop  bc
    ld   a, [hl]
    ld   h, d
    ld   a, [hl]
    ld   h, d
    ld   a, b
    ld   e, b
    ld   [$FFE0], a
    ret  nz
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
    ld   bc, label_F00
    nop
    ld   a, a
    nop
    jr   c, label_AC3B2

label_AC3B2::
    ld   bc, label_300
    nop
    ld   c, $01
    ccf
    ld   bc, label_3FD
    ld   a, [$FF00+C]
    db   $EC ; Undefined instruction
    inc  e
    cp   a
    ld   b, b
    ccf
    ret  nz
    ld   a, a
    ret  nz
    cp   a
    and  b
    ccf
    jr   nz, label_AC40A
    jr   nz, label_AC40C
    jr   nz, label_AC40E
    ld   hl, label_22FF
    rst  $38
    ldi  [hl], a
    rst  $38
    ld   hl, label_AE0DF
    rst  8
    ld   [hl], b
    rst  $28
    ld   [hl], b
    xor  a
    or   b
    rla
    jr   label_AC3B2
    ld   e, $D0
    rra
    db   $E8 ; add  sp, d
    rrca
    ld    hl, sp+$8F
    db   $FC ; Undefined instruction
    ld   b, a
    cp   l
    ld   h, a
    cp   [hl]
    ld   h, [hl]
    db   $FC ; Undefined instruction
    inc  h
    add  a, b
    rst  $38
    ld   b, b
    ret  nz
    ccf
    ld   [$FF3F], a
    ld   [$FFDF], a
    ld   a, [$FF2F]
    jr   c, label_AC42C
    jr   c, label_AC42B
    scf
    ld   de, label_2F00
    nop
    jr   nc, label_AC406

label_AC406::
    nop
    nop
    ld   b, $00

label_AC40A::
    stop

label_AC40C::
    dec  bc
    nop

label_AC40E::
    ld   [$8C00], sp
    nop
    jr   label_AC414

label_AC414::
    and  h
    nop
    adc  a, h
    nop
    ld   c, d
    nop
    ld   c, d
    nop
    jr   nz, label_AC41E

label_AC41E::
    inc  d
    nop
    ld   [label_8F8], sp
    adc  a, b
    ld   [hl], b
    sub  a, b
    ld   a, a
    sub  a, b
    ld   a, a
    sbc  a, a
    ld   h, b

label_AC42B::
    ld   a, [$FF80]
    ld   [$FFA0], a
    ret  nz
    ld   b, $06
    ld   b, $06
    ld   b, $06
    cp   $06
    cp   $E6
    ld   e, $1E
    rlca
    rlca
    rlca
    rlca
    ld   a, a
    ld   a, a
    ld   [$FFE0], a
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    jr   z, label_AC474
    jr   z, label_AC476
    nop
    nop
    jp   label_E0C3
    ld   [rSVBK], a
    ld   [hl], b
    jr   c, label_AC490
    inc  e
    inc  e
    inc  e
    inc  e
    inc  c
    inc  c
    nop
    nop
    jp   label_7C3
    rlca
    rrca
    rrca
    ld   e, $1E
    inc  a
    inc  a
    jr   c, label_AC4A4
    jr   nc, label_AC49E
    nop
    nop
    cp   $FE
    add  a, a
    add  a, a

label_AC474::
    inc  bc
    inc  bc

label_AC476::
    ld   bc, $0001
    nop
    inc  d
    inc  d

label_AC47C::
    inc  d
    inc  d
    nop
    nop
    ld   a, [hl]
    ld   h, d
    ld   a, [hl]
    ld   h, d
    ld   a, a
    ld   h, d
    ld   h, e
    ld   a, [hl]
    ld   h, e
    ld   a, [hl]
    ld   l, a
    ld   a, [hl]
    rst  $38
    ld   a, [$FF00+C]
    db   $E3 ; Undefined instruction

label_AC490::
    inc  bc
    nop
    rrca
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    ld   bc, label_2FE
    rst  $38
    nop
    cp   $01

label_AC4A4::
    di
    rrca
    call c, label_AE03C
    ld   [$FF80], a
    add  a, b
    nop
    nop
    nop
    nop
    ld   a, [$FF30]
    ld   b, b
    ret  nz
    add  a, b
    add  a, b

label_AC4B6::
    add  a, h
    add  a, h
    jp   z, label_2BCA

label_AC4BB::
    dec  hl
    ld   e, $1E
    nop
    nop
    ld   l, $36
    jr   c, label_AC4FC
    nop
    nop
    ccf
    ccf
    ld   b, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    ld   [de], a
    dec  e
    ld   [label_C0F], sp
    rlca
    db   $E4 ; Undefined instruction
    rst  $20
    ld   d, $13
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    ret  c
    jr   c, label_AC4BB
    jr   c, label_AC4B6
    ld   sp, label_19E9
    xor  e
    ld   a, [de]
    xor  e
    ld   a, [de]
    xor  e
    ld   a, [de]
    scf
    ld   c, $AC
    or   a
    xor  h
    or   l
    xor  [hl]
    dec  [hl]
    xor  [hl]
    dec  [hl]
    xor  [hl]
    dec  [hl]
    ld   l, $39

label_AC4FC::
    ld   e, [hl]
    ld   l, c
    ld   e, b
    ld   l, a
    ld   a, [bc]
    nop
    inc  bc
    nop
    ld   [bc], a
    nop
    nop
    nop
    ld   bc, $0000
    nop
    ld   bc, $0000
    nop
    dec  d
    nop
    push de
    nop
    dec  bc
    nop
    cp   c
    nop
    ret  nz
    nop
    ld   h, b
    nop
    db   $EC ; Undefined instruction
    nop
    ld   h, $00
    ld   a, a
    db   $FC ; Undefined instruction
    jp   label_EE7F
    ld   sp, label_10FF
    rst  $38
    db   $10
    db   $F8
    ld   [label_4FC], sp
    inc  b
    db   $FC ; Undefined instruction
    ld   b, $06
    and  $82
    ld   l, a
    di
    sbc  a, [hl]
    ld   a, a
    jp   hl
    ld   e, $FB
    inc  e
    ld   [hl], a
    jr   label_AC556
    jr   label_AC541

label_AC541::
    nop
    nop
    nop
    ld   a, [$FFF0]
    ld   c, $FE
    pop  hl
    rra
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

label_AC556::
    nop
    nop
    add  a, b
    add  a, b
    ld   h, b
    ld   [$FFDF], a
    ccf
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
    ld   bc, label_601
    rlca
    ei
    db   $FC ; Undefined instruction
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    ld   [hl], b
    ld   a, a
    add  a, a
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    ld   h, b
    ld   a, a
    ld   h, a
    rst  $38
    ld    hl, sp+$3F
    ld   a, [$FFDF]
    jr   nc, label_AC57A
    add  hl, de
    rst  $28
    add  hl, de
    rst  $28
    add  hl, de
    cp   $82
    db   $FC ; Undefined instruction
    add  a, h
    db   $FC ; Undefined instruction
    call nz, label_E4BC
    sbc  a, h
    sbc  a, h
    jr   label_AC524
    sbc  a, c
    ld   [label_899], sp
    nop
    nop
    rst  $38
    rst  $38
    add  a, e
    add  a, e
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $00
    cp   $00
    nop
    nop
    pop  af
    pop  af
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
    rst  $38
    rst  $38
    jr   c, label_AC5FE
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    rrca
    nop
    rlca
    ld   [bc], a
    rst  0
    jp   nz, label_AC645
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rst  $30
    inc  b
    rst  $30
    inc  b
    ld   [hl], $0C
    ld   [hl], $0C
    ld   [hl], $0C
    ld   d, $0C
    ld   d, $0C
    rla
    rrca
    rla
    rrca
    inc  d
    rrca
    ld   e, b
    ld   l, a
    ld   e, b
    ld   l, b
    sbc  a, a
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E4 ; Undefined instruction
    sbc  a, a
    db   $E4 ; Undefined instruction
    ccf
    call z, label_F0FF

label_AC5FE::
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
    call nz, label_AEE00
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
    nop
    inc  b
    db   $FC ; Undefined instruction
    ld   [bc], a
    add  a, d
    ld   a, [hl]
    add  a, d
    ld   a, d
    add  a, [hl]
    ld   a, [hl]
    add  a, d
    ld   l, [hl]
    sub  a, d
    ld   a, [hl]
    add  a, d
    ld   [bc], a
    cp   $17
    jr   label_AC64A
    jr   label_AC64C
    jr   label_AC642
    inc  c
    dec  bc
    inc  c
    add  hl, bc
    ld   c, $0C
    rrca
    ld   a, $1F
    rst  $38
    ld   h, b

label_AC642::
    rst  $38
    ld   a, [$FFFF]

label_AC645::
    ld   a, [hl]
    rst  $38
    ccf
    rst  $38
    rlca

label_AC64A::
    rst  $38
    nop

label_AC64C::
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $38
    nop
    ld   [rJOYP], a
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    ld   a, a
    nop
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $FF
    rrca
    rst  $38
    ld   a, [hl]
    rst  $38
    ld    hl, sp+$FF
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    rst  $28
    add  hl, de
    xor  $1B
    xor  $1B
    sbc  a, $33
    sbc  a, $33
    sbc  a, a
    ld   [hl], c
    ccf
    pop  af
    ld   a, a
    ld   sp, hl
    sbc  a, b
    ld   [label_8B8], sp
    cp   b
    ld   [label_8B8], sp
    xor  h
    inc  e
    xor  h
    inc  e
    ld   a, [hl]
    sbc  a, d
    rst  $38
    sbc  a, c
    nop
    nop
    ld   [hl], b
    ld   [hl], b
    and  b
    add  a, b
    or   b
    and  b
    cp   b
    and  b
    ccf
    inc  e
    rra
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
    nop
    nop
    nop
    rst  $38
    ld   bc, $FEFF
    nop
    nop
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rst  0
    inc  b
    call label_8D8E
    ld   c, $1D
    ld   d, $14
    rrca
    inc  d
    inc  c
    rra
    ld   [label_81F], sp
    ccf
    ld   [label_103F], sp
    ccf
    db   $10
    db   $30
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
    rst  $38
    rst  $38
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
    rst  $38
    nop
    nop
    nop
    nop
    add  a, b
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rlca
    dec  b
    rrca
    rlca
    rrca
    inc  b
    db   $FC ; Undefined instruction
    ld   [label_10F8], sp
    ld   a, [$FF13]
    pop  af
    rst  $20
    cp   $73
    db   $E3 ; Undefined instruction
    pop  bc
    add  a, d
    ld   bc, label_307
    dec  e
    ld   e, $6F
    ld   a, [$FFBF]
    ret  nz
    rst  $38
    nop
    ld   a, a
    add  a, b
    sbc  a, a
    ld   [rSCX], a
    db   $FC ; Undefined instruction
    ld    hl, sp+$FF
    rst  $30
    rlca
    pop  af
    nop
    ld    hl, sp+$00
    ld   a, [$FF08]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    ld   [$FFE0], a
    rst  $38
    rst  $38
    rra
    rst  $38
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    ld   sp, hl
    rlca
    jp   nz, label_1F3F
    cp   $EF
    ld   [$FFCF], a
    nop
    sbc  a, a
    nop
    rrca
    db   $10
    db   $7F
    call z, label_E39F
    rst  $30
    ld   sp, hl
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
    rst  $18
    or   b
    cp   a
    ld   a, [$FFBF]
    ld   [rIE], a
    pop  bc
    db   $ED ; Undefined instruction
    ld   [hl], e
    ei
    rrca
    db   $FD ; Undefined instruction
    ld   b, $FD
    ld   b, $C0
    ret  nz
    ld   a, [$FFB0]
    rst  $38
    adc  a, a
    rst  $38
    add  a, b
    rst  $38
    nop
    ei
    add  a, h
    pop  af
    ld   c, [hl]
    pop  af
    ld   l, [hl]
    ccf
    nop
    ld   c, $00
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   b, b

label_AC7BA::
    pop  af
    ld   sp, label_EFF
    rst  $38
    ld   [$0080], sp
    nop
    nop
    rlca
    rlca
    rst  $38
    ld    hl, sp+$FF
    ld   b, b
    rst  $38
    add  a, b
    ld   sp, hl
    ld   b, $FB
    inc  b
    ccf
    ldi  [hl], a
    cp   $E3
    pop  hl
    ld   hl, label_30D0
    rst  $28
    jr   label_AC7BA
    jr   c, label_AC794
    ld   l, h
    db   $D3 ; Undefined instruction
    ld   l, a
    cp   a
    rra
    ld   [rNR41], a
    ld   h, b
    and  b
    ret  nz
    ret  nz
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
    rst  $38
    rra
    nop
    nop
    nop
    ld   a, $00
    rst  $38

label_AC801::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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

label_AC820::
    daa
    ld   a, $1F
    inc  e

label_AC824::
    rrca
    inc  c
    ld   a, a
    ld   [label_8FF], sp
    cp   $09
    ld   a, a
    ld   [label_8FF], sp
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    ld   a, [$FF0F]
    cp   a
    ld   a, a
    ld   a, a
    pop  bc
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ld   [rNR23], a
    jr   nz, label_AC820
    jr   nz, label_AC824
    ld   [hl], b
    adc  a, a
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    cp   $81
    rst  $38
    add  a, b
    rra
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
    ld   [$FF80], a

label_AC85F::
    ld   [hl], b
    db   $FC ; Undefined instruction
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
    ld   bc, label_70E

label_AC871::
    jr   label_AC877
    dec  sp
    ld   b, $79
    ld   c, $F1
    rra
    pop  hl
    ccf
    pop  bc
    ld   a, a
    add  a, c
    rst  $38
    ld   bc, $00FF
    ccf
    ret  nz
    nop
    rst  $38
    ld   a, $FF
    pop  bc
    pop  bc
    jr   label_AC88C

label_AC88C::
    ld    hl, sp+$00
    rst  $38
    ld   bc, label_CFB
    adc  a, d
    ld   a, l
    ld   b, $F9
    inc  e
    di
    db   $E8 ; add  sp, d
    rst  $30
    ld   a, b
    ld   a, a
    cp   l
    add  a, a
    rra
    dec  de
    inc  hl
    db   $FC ; Undefined instruction
    inc  hl
    db   $FC ; Undefined instruction
    ld   b, a
    ld    hl, sp+$4F
    ld   a, [$FF6F]
    ld   a, [$FFF9]
    cp   [hl]
    rst  $38
    daa
    rst  $38
    jr   nc, label_AC871
    inc  h
    ld   [rNR11], a
    ret  nz
    inc  h
    ld   [rNR11], a
    ret  nz
    inc  h
    db   $E4 ; Undefined instruction
    dec  de
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   a, e
    add  a, h
    ld   sp, hl
    ld   b, $7C
    add  a, e
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, h
    add  a, e
    jp   label_1F3F
    db   $FC ; Undefined instruction
    rst  $38
    pop  hl
    jp   z, label_CD76
    di
    ld   b, [hl]
    ld   sp, hl
    ld   b, d
    db   $FD ; Undefined instruction
    ld   h, c
    cp   $F1
    sbc  a, [hl]
    ld    hl, sp+$8F
    db   $FD ; Undefined instruction
    add  a, a
    nop
    nop
    add  a, b
    nop
    add  a, e
    add  a, b
    pop  af
    add  a, b
    ld   a, a
    ret  nz
    cp   a
    ld   h, b
    rst  $38
    ld   [$FF9F], a
    db   $10
    db   $40
    nop
    add  a, b
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  c
    rst  $38
    inc  b
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

label_AC933::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, e
    rst  $38
    ld   a, h
    rst  $38
    nop
    db   $FC ; Undefined instruction
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

label_AC94D::
    add  a, b
    rst  $38
    add  a, b
    ret  nz
    jr   nc, label_AC933
    jr   label_AC94D
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $38
    nop
    ld   a, [$FF0F]
    inc  bc
    inc  c
    rlca
    jr   label_AC984
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rrca
    ld   a, [$FFFF]
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF

label_AC984::
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    inc  sp
    nop
    rrca
    ld   b, $07
    ld   [bc], a
    rlca
    ld   [bc], a
    adc  a, a
    add  a, h
    rst  $38
    ld   a, b
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $28
    ld   a, $CF
    ld   [hl], c
    call c, label_9C60
    ld   [$FFBF], a
    ld   a, [$FFBC]
    rst  $28
    ld   l, a
    ld   b, a
    ld   b, b
    ld   b, b
    ld   [rNR41], a
    rst  $38
    rst  $38
    pop  af
    ld   c, $71
    ld   c, $F0
    rrca
    ld   h, b
    sbc  a, a
    ld   [$FFDF], a
    cp   a
    ld   a, a
    cp   $8F
    cp   $F1
    and  $01
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $28
    rra
    ld   a, c
    ld   a, [$FFB0]
    ret  nz
    rst  $38
    add  a, e
    ld   a, a
    call nz, label_C47E
    cp   [hl]
    ld   h, h
    cpl
    ld  [$FF00+C], a
    rst  8
    pop  bc
    add  a, b
    add  a, b
    add  a, $C0
    rst  8
    adc  a, b
    ld   l, a
    ld   c, b
    cpl
    ld   [label_80F], sp
    rra
    db   $10
    db   $FF
    ld   [rSB], a
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    jr   label_ACA24

label_ACA24::
    add  a, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$0100], sp
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
    nop
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
    ld   a, a
    add  a, b
    ccf
    ret  nz
    ld   e, a
    ld   h, b
    rst  $38
    rlca
    db   $F4 ; Undefined instruction
    inc  c
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld   [rNR10], a
    add  a, b
    ld   h, b
    rst  $38
    ld   [$FF2F], a
    jr   nc, label_ACA84
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $07
    ld   [label_601], sp
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
    cp   $01
    ld    hl, sp+$06
    nop
    nop
    add  a, b
    add  a, b

label_ACA84::
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   sp, hl
    ld   bc, label_1C1

label_ACA96::
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   b, c
    ret  nz
    pop  hl
    ld   hl, label_1EDF
    jp   label_C300
    ret  nz
    ld   a, a
    ld   a, a
    pop  bc
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ret  nz
    jr   nz, label_ACA96
    and  b
    ld   h, b
    and  b
    ld   h, b
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   h, b
    ld   b, b
    ld   h, b
    ld   h, b
    sbc  a, b
    ld   a, [$FFBF]
    rst  8
    cp   b
    ret  nz
    ld   a, b
    ld   h, b
    ccf
    ccf
    jr   nz, label_ACAF0
    jp   label_E040
    ld   h, b
    and  b
    ld   [$FF60], a
    and  b
    ld   [rNR41], a
    and  b
    ld   h, b
    ld   [$FFC0], a
    ld   b, b
    ld   b, b
    ld   bc, $8000
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

label_ACAF0::
    rst  $38
    nop
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rrca
    nop
    rra
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
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    inc  bc
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    cp   $00
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
    pop  bc
    nop
    nop
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
    nop
    add  a, b
    nop
    db   $10
    db   $1F
    ld   b, b
    nop
    ccf
    nop
    cp   $00
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
    ld   [rJOYP], a
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
    ld   bc, $0006
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ret  nz
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, a
    nop
    dec  e
    nop
    nop
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
    ld   de, label_1F00
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
    add  a, b
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
    inc  bc
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    nop
    inc  b
    nop
    ld   a, a
    nop
    rrca
    nop
    ld   a, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    add  a, b
    nop
    ld    hl, sp+$00
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
    inc  bc
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    rra
    nop
    rlca
    nop
    rst  $38
    nop
    rra
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ret  nz
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
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
    ret  nz
    nop
    jr   c, label_ACC7C

label_ACC7C::
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    inc  bc
    nop
    rra
    nop
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    cp   $00
    ld   a, [$FF00]
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
    rst  $28
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    rrca
    nop
    nop
    nop
    ld   bc, rJOYP
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    add  a, b
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld    hl, sp+$00
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    ld   a, a
    nop
    rrca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    nop
    ccf
    nop
    rst  $38
    nop
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ret  nz
    nop
    add  a, b
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
    ld   [hl], d
    nop
    rra
    nop
    ld    hl, sp+$00
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
    rra
    nop
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   c, $00
    ld   a, [$FF00]
    add  a, b
    nop
    ld   a, a
    nop
    ld    hl, sp+$00
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
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    pop  bc
    nop
    ccf
    nop
    add  a, b
    nop
    rst  $38
    nop
    nop
    nop
    ld   bc, $8800
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $20
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    db   $FC ; Undefined instruction
    nop
    ld   [bc], a
    ld   a, [$FF0A]
    rst  $38
    rlca
    rst  $38
    ld   [label_10F1], sp
    db   $10
    db   $F0
    db   $10
    db   $F0
    nop
    ccf
    ld   [label_3F40], sp
    ld   b, b
    rst  $38
    ret  nz
    ld   a, a
    ld   [$FF9F], a
    ld   [hl], b
    ret  z
    ccf
    ld   l, h
    rra
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    jr   label_ACFDA
    inc  c
    ld   c, h
    ld   a, $46
    ccf
    ld   b, a
    ccf
    ld   b, l
    ccf
    ld   b, h
    ld   a, $42
    ld   [bc], a
    ld   a, $36
    ld   c, $1B
    rlca
    inc  c
    inc  bc
    ld   b, $01
    add  a, e
    add  a, b
    pop  bc
    ret  nz
    ld   [$FF60], a
    ld   [hl], b
    jr   nc, label_ACFC1

label_ACFC1::
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

label_ACFDA::
    ld   [hl], a
    adc  a, b
    ld   a, a
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rrca
    rrca
    inc  a
    inc  a
    ld   a, c
    ld   a, c
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    ld   a, b
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
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, $1E
    ld   a, h
    ld   a, h
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [$FFF0]
    ld    hl, sp+$F8
    nop
    nop
    nop
    nop
    jr   c, label_AD09E
    ld   [hl], b
    ld   [hl], b
    ld   a, c
    ld   a, c
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
    inc  a
    inc  a
    rst  $38
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
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    ccf
    ccf
    ccf
    ccf

label_AD09E::
    ld   a, a
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
    cp   $FE
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
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    jr   c, label_AD0FE
    ld   [hl], b
    ld   [hl], b
    ld   a, c
    ld   a, c
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
    inc  a
    inc  a
    rst  $38
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
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFE0], a
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

label_AD0FE::
    nop
    nop
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ccf
    ccf
    dec  sp
    scf
    ld   [de], a
    inc  d
    jr   label_AD120
    ld   a, [bc]
    inc  c
    ld   e, $1F
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jp   nz, label_8AE3
    ret
    adc  a, b
    adc  a, c
    adc  a, b
    adc  a, c
    ld   bc, label_201
    rlca

label_AD120::
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    and  b
    ld   h, b
    ld   h, b
    jr   nz, label_AD149
    jr   nz, label_AD14B
    ld   h, b
    ret  nz
    ret  nz
    and  b
    ld   h, b
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    rra
    rra
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  b
    inc  b
    ld   b, $06
    ld   bc, rSB
    rst  $38
    rst  $38
    rst  $38
    rra
    rra
    ld   e, h
    ld   e, h
    ld   c, h

label_AD149::
    ld   c, h
    ld   c, h

label_AD14B::
    ld   c, h
    nop
    nop
    push hl
    db   $E3 ; Undefined instruction
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    ld   [hl], b
    ld   [hl], b
    ld   h, b
    ld   h, b
    ld   [$FFE0], a
    ret  nz
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, l
    ld   a, e
    ld   a, b
    ld   a, d
    inc  e
    ld   a, [de]
    ld   b, $0E
    ld   c, $0F
    dec  d
    dec  de
    rst  $38
    rst  $38
    jp   hl
    pop  af
    push bc
    db   $E4 ; Undefined instruction

label_AD176::
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    nop
    ld   bc, $8381
    rst  $38
    rst  $38
    ld   [$FFE0], a
    ld   d, b
    or   b
    jr   nc, label_AD116
    db   $10
    db   $90
    db   $10
    db   $B0
    ld   [$FFE0], a
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ccf
    ccf
    inc  e
    inc  e
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   de, label_1911
    add  hl, de
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [hl], e
    ld   [hl], e
    ld   [hl], c
    ld   [hl], c
    ld   sp, label_331
    inc  bc
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [$FFE0], a
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, l

label_AD1C5::
    ld   a, e
    ld   a, b
    ld   a, d
    inc  e
    ld   a, [de]
    ld   b, $0E
    ld   [bc], a
    inc  bc
    ld   bc, rSB
    rst  $38
    jp   hl
    pop  af
    push bc
    db   $E4 ; Undefined instruction
    ld   b, h
    ld   b, h
    ld   b, h
    ld   b, h
    nop
    ld   bc, $8381
    rst  $38
    rst  $38
    ld   [$FFE0], a
    ld   d, b
    or   b
    jr   nc, label_AD176
    db   $10
    db   $90
    db   $10
    db   $B0
    ld   [$FFE0], a
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
    ccf
    ccf
    ccf
    ccf
    dec  hl
    scf
    scf
    inc  hl
    ld   l, e
    ld   [hl], a
    ld   a, a
    ld   a, a
    rra
    jr   label_AD216
    rlca
    rst  $38
    cp   $37
    cp   $CE
    scf

label_AD216::
    rst  8
    scf
    ld   sp, $C0CF
    rst  $38
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    ld   h, b
    jr   nz, label_AD283
    jr   nz, label_AD1C5
    ld   h, b
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, [$FFF0]
    or   b
    or   b
    nop
    nop
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
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
    scf
    rra
    rla
    rra
    inc  sp
    rra
    db   $E3 ; Undefined instruction
    rst  $38
    ccf
    ccf
    ccf
    ccf
    db   $FC ; Undefined instruction
    jp   label_AFF7F
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld    hl, sp+$F8
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [$FFE0], a
    dec  de
    ld   de, label_111B
    dec  d
    dec  de
    rrca
    rrca
    ld   e, $1F
    inc  a
    ccf
    scf
    scf
    inc  bc
    inc  bc
    or   e
    rst  $38
    or   e
    rst  $38
    rst  8
    or   e
    rst  8
    or   e
    inc  sp
    rst  8
    rrca
    rst  $38
    rst  $28
    ld   a, [$FFFF]
    rst  $38
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   d, b
    or   b
    or   b
    db   $10
    db   $58
    cp   b
    ld    hl, sp+$F8
    ld   [$FF60], a
    add  a, b
    add  a, b
    ld   [label_608], sp
    ld   b, $01
    ld   bc, $0101
    ld   bc, label_701
    rlca
    rra
    jr   label_AD2AE
    rrca
    rlca
    rlca
    rst  $30
    rst  $38
    sbc  a, b
    rrca
    ld   [$980F], sp
    rrca
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction

label_AD2AE::
    rst  $38
    rst  $38
    ret  nz
    ret  nz
    cp   $FE
    rst  $38
    rst  $38
    cp   $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld    hl, sp+$B8
    ld   [rNR41], a
    ld   [$FFE0], a
    inc  bc
    inc  bc
    rlca
    rlca
    ld   a, [bc]
    dec  c
    dec  c
    ld   [label_1D1F], sp
    rra
    rra
    rlca
    ld   b, $01
    ld   bc, $FF99
    sbc  a, c
    rst  $38
    and  l
    db   $DB
    and  l
    db   $DB
    sbc  a, c
    rst  $20
    rst  $20
    rst  $38
    rst  $38
    jr   label_AD2DE
    rst  $38
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   d, b
    or   b
    or   b
    db   $10
    db   $58
    cp   b
    ld    hl, sp+$F8
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
    nop
    nop
    rrca
    rrca
    ld   a, $3E
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, h
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    nop
    nop
    nop
    nop
    rra
    rra
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
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction

label_AD32F::
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    ld   bc, label_601
    ld   b, $19
    rra

label_AD33A::
    ld   l, $31
    ccf
    jr   nz, label_AD3BE
    ld   b, e
    nop
    nop
    ld   [$FFE0], a
    ld   a, $1E
    rrca
    add  hl, bc
    rlca
    inc  b
    pop  bc
    jp   nz, label_AE7A7
    ret  c
    cp   b
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    jr   nz, label_AD33A
    and  b
    ld   h, b
    ret  nc
    jr   nc, label_AD32F
    or   b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_601
    ld   b, $19
    rra

label_AD36C::
    ld   l, $31
    ccf
    jr   nz, label_AD371

label_AD371::
    nop
    nop
    nop
    ld   [$FFE0], a
    ld   a, $1E
    rrca
    add  hl, bc
    rlca
    inc  b
    pop  bc
    jp   nz, label_AE7A7
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
    jr   nz, label_AD36C
    and  b
    ld   h, b
    ld   a, [$FF10]
    nop
    nop
    nop
    nop
    rrca
    rrca
    db   $10
    db   $10
    daa
    jr   nz, label_AD3EA
    ld   b, h
    ld   d, l
    ld   c, [hl]
    ld   l, e
    ld   e, d
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    db   $10
    db   $10
    ret  z
    ld   [label_AC4E4], sp
    ld   d, h
    db   $E4 ; Undefined instruction
    xor  h
    or   h
    nop
    nop
    nop
    nop
    rrca
    rrca
    db   $10
    db   $10
    cpl
    cpl
    ld   e, a
    ld   d, b
    ld   e, b
    ld   d, b

label_AD3BE::
    db   $FC ; Undefined instruction
    ret  nc
    nop
    nop
    nop
    nop
    ld   [$FFE0], a
    db   $10
    db   $10
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    inc  d
    inc  [hl]
    inc  d
    ld   a, h
    inc  d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AD3EA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ccf
    rrca
    rrca
    ld   bc, $0101
    ld   bc, label_202
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    adc  a, a
    adc  a, a
    ld   l, $2E
    ld   h, $26
    ld   h, $26
    nop
    nop
    add  a, d
    add  a, c
    ld   a, a
    ld   a, a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, h
    ld   a, h
    jr   c, label_AD460
    jr   nc, label_AD45A
    ld   [hl], b
    ld   [hl], b
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    ld   a, h
    ld   c, h
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   [de], a
    ld   [de], a
    ld   [label_809], sp
    ld   [label_606], sp
    inc  bc
    inc  bc
    or   $96
    ld   l, [hl]
    ld   e, b
    ld   a, c
    ld   c, c
    ld   a, d
    ld   c, d
    ld   a, h
    call z, label_ADD71
    ld   [hl], d
    ld   e, [hl]
    xor  $FE
    ret  nc
    or   b
    sub  a, b
    ld   a, [$FF50]
    ld   a, [$FFB0]
    or   b
    add  a, b
    add  a, b

label_AD45A::
    nop
    nop
    nop
    nop
    nop
    nop

label_AD460::
    ld   a, a
    ld   b, e
    ld   a, h
    ld   c, h
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   [de], a
    ld   [de], a
    ld   [label_809], sp
    ld   [label_606], sp
    ret  c
    cp   b
    or   $96
    ld   l, [hl]
    ld   e, b
    ld   a, c
    ld   c, c
    ld   a, d
    ld   c, d
    ld   a, h
    call z, label_ADD71
    ld   [hl], d
    ld   e, [hl]
    ld    hl, sp+$88
    cp   $86
    sbc  a, d
    and  $7C
    db   $FC ; Undefined instruction
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    push af
    or   l
    db   $E4 ; Undefined instruction
    and  h
    db   $E4 ; Undefined instruction
    and  h
    ld   [$FFB8], a
    ld   [$FFA0], a
    scf
    ld   h, a
    ld   e, b
    ld   [hl], b
    rst  8
    cp   a
    ld   e, [hl]
    ld   e, d
    ld   c, [hl]
    ld   c, d
    ld   c, [hl]
    ld   c, d
    ld   c, $3A
    ld   c, $0A
    ret  c
    call z, label_1C34
    and  $FA
    cp   h
    xor  b
    cp   [hl]
    xor  b
    cp   d
    xor  h
    cp   [hl]
    and  h
    cp   a
    and  h
    dec  a
    db   $76 ; Halt
    ld   c, e
    ld   a, [hl]
    rst  0
    cp   a
    ld   a, d
    ld   a, [hli]
    ld   a, [$BA2A]
    ld   l, d
    ld   a, [$FA4A]
    ld   c, d
    ld   a, b
    call c, label_FCA4
    add  a, $FA
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, a
    cp   e
    add  a, a
    db   $E3 ; Undefined instruction
    sbc  a, a
    rst  $28
    sbc  a, a
    ld   a, b
    ld   c, b
    ld   a, a
    ld   a, a
    db   $FC ; Undefined instruction
    jp   label_AFF7F
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   [$FFE0], a
    add  a, b
    add  a, b
    ld   bc, label_201
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    inc  bc
    ld   bc, $0101
    ld   bc, label_203
    inc  bc
    inc  bc
    ld   l, $F6
    inc  a
    db   $E4 ; Undefined instruction
    db   $EC ; Undefined instruction
    inc  [hl]
    ld   h, $E6
    db   $3A ; ldd  a, [hl]
    sbc  a, $FC
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    inc  e
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
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   [bc], a
    ld   a, [de]
    dec  de
    rra
    rla
    inc  e
    inc  de
    rrca
    inc  c
    inc  bc
    inc  bc
    cp   $F2
    cpl
    pop  af
    db   $FC ; Undefined instruction
    ld   [$FC3C], sp
    scf
    rst  8
    db   $ED ; Undefined instruction
    sbc  a, e
    ld   [hl], e
    rst  $38
    sbc  a, [hl]
    sbc  a, [hl]
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
    ld   [rIE], a
    cp   b
    and  a
    and  a
    cp   b
    ld   e, b
    ld   h, a
    ld   e, c
    ld   h, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [$FC86]
    db   $FC ; Undefined instruction
    ld   c, $FE
    db   $3A ; ldd  a, [hl]
    jp   z, label_3ACA
    inc  [hl]
    call z, label_CC34
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   [hl]
    jp   nz, label_AFE7E
    ld   a, [$FFEF]
    xor  a
    or   b
    and  b
    cp   a
    ld   e, b
    ld   h, a
    ld   e, c
    ld   h, a
    ld   a, [hl]
    ld   a, [hl]
    ld   a, d
    ld   b, [hl]
    inc  a
    inc  a
    ld   e, $EE
    ld   [label_A1A], a
    ld   a, [$CC34]
    inc  [hl]
    call z, label_FCFC
    cp   h
    call nz, label_AF878
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, a
    ld   h, c
    sbc  a, e
    ld   h, l
    db   $DB
    dec  h
    db   $DB
    dec  h
    ei
    dec  b
    rst  $38
    dec  c
    ei
    dec  bc
    db   $DB
    ld   a, [hli]
    or   l
    jp   z, label_FFBF
    ld   [$FFC0], a
    sbc  a, a
    sbc  a, a
    ccf
    jr   nz, label_AD69A
    ld   b, b
    rst  $38
    add  a, c
    ld   [hl], a
    adc  a, [hl]
    sbc  a, a
    ld   h, c
    sbc  a, e
    push hl
    ei
    ld   h, l
    dec  sp
    dec  h
    sbc  a, e
    sub  a, l
    rst  $18
    ld   d, a
    ld   a, e
    cp   e
    db   $DB
    xor  e
    push af
    ld   [$DAF5], a
    rst  $38
    set  5, a
    set  5, a
    rst  0
    rst  $20
    and  a
    di
    and  e
    di
    sub  a, e
    sbc  a, a
    ld   h, c
    db   $DB
    push hl
    rst  $38
    rst  $28
    rst  $18
    cp   a
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    or   l
    jp   z, label_CAB5
    or   l
    jp   z, label_EAF5
    push af
    ld   a, [$F8FF]
    cp   $FD
    cp   $BD
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $C1
    ld    hl, sp+$37
    db   $FC ; Undefined instruction
    rrca
    rst  $38
    inc  sp
    rst  $38
    ret  nz
    db   $FD ; Undefined instruction
    ldd  [hl], a
    cp   h
    ld   c, a
    inc  bc
    rst  $38
    rst  $38
    ret  nz
    cp   $31
    call c, label_BF2F
    ld   [hl], e
    rst  $28
    ret  nc

label_AD69A::
    rst  $30
    jr   c, label_AD69A
    ld   c, $1B
    rst  $20
    rst  $38
    nop
    nop
    nop
    rrca
    nop
    ld   a, [$FF00]
    rst  $38
    inc  bc
    rrca
    inc  c
    ccf
    jr   c, label_AD6AE
    rst  0
    rst  $38
    inc  bc
    rst  $38
    inc  c
    ccf
    inc  a
    rst  $38
    jp   label_C0FF
    ld    hl, sp+$17
    inc  a
    rst  8
    rlca
    ei
    rst  $38

label_AD6C1::
    ret  nz
    rst  $38
    jr   nc, label_AD6C1
    rrca
    ccf
    di
    di
    call z, label_3FF0
    inc  c
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    srl  d
    ld   c, a
    cp   d
    ld   e, a
    cp   d
    rst  $10
    or   $B7
    sub  a, [hl]
    ld   b, a
    add  a, $7B
    ei
    ld   c, [hl]
    set  7, b
    ld   a, [$FFD1]
    sub  a, c
    sub  a, c
    sub  a, c
    sub  a, c
    sub  a, c
    ld   [$FF80], a
    sbc  a, a
    sbc  a, a
    ret  nz
    ret  nz
    ccf
    rst  $38
    db   $DB
    ld   l, e
    ld   a, a
    dec  hl
    ccf
    dec  hl
    ccf
    dec  hl
    rst  $38
    dec  l
    ccf
    add  hl, hl
    ld   [hl], a
    ld   e, c
    rst  $30
    xor  a
    di
    sub  a, c
    ld   sp, hl
    adc  a, c
    rst  $18
    xor  e
    rst  $18
    xor  a
    sbc  a, $BC
    call z, label_CEB4
    or   h
    add  a, e
    rst  $38
    cp   $FF
    or   $FC
    call nc, label_D494
    sub  a, h
    db   $F4 ; Undefined instruction
    ld   b, h
    ld   [hl], b
    ld   h, b
    ld    hl, sp+$70
    rst  $38
    sbc  a, a
    ld   a, $1F
    dec  de
    add  hl, bc
    ld   e, c
    ld   b, c
    ld   c, e
    ld   b, c
    ld   b, l
    ld   c, e
    rra
    ld   c, $3D
    ld   a, [de]
    ld    hl, sp+$EF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or   $C9
    ld   a, [$FF3F]
    inc  a
    rst  8
    dec  sp
    rst  $30
    ld   [$FFDF], a
    or   b
    ld   a, a
    inc  c
    rst  $38
    inc  bc
    rst  $38
    rst  0
    ld    hl, sp+$F1
    ld   a, $3D
    adc  a, $3F
    di
    db   $E3 ; Undefined instruction
    call c, label_BE71
    inc  e
    rst  $28
    inc  bc
    rst  $38
    rst  $38
    ret  nz
    rst  $30
    jr   c, label_AD7E2
    adc  a, $3F
    di
    rst  8
    ld   a, [$FFF3]
    inc  a
    inc  a
    rst  8
    rrca
    di
    rst  $38

label_AD7B1::
    ret  nz
    rst  $38
    jr   nc, label_AD7B1
    inc  c
    ld   a, a
    or   e
    rst  $18
    pop  hl
    di
    inc  a
    ld   a, l
    adc  a, [hl]
    rrca
    di
    rst  $38
    nop
    nop
    nop
    ld   a, [$FF00]
    rrca
    nop
    rst  $38
    ret  nz
    ld   a, [$FF30]
    db   $FC ; Undefined instruction
    inc  e
    ld   e, a
    and  e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AD7E2::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [hl], $1F
    rst  $38
    jr   label_AD805
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    jr   label_AD80B
    ld   bc, label_1FF
    rst  $38
    rst  $38
    nop
    rst  $18
    and  b
    ld   a, e
    ei
    ccf
    ret  nz
    adc  a, [hl]
    adc  a, [hl]
    ei
    rst  $38
    ld   sp, hl
    rrca
    ld    hl, sp+$FF
    rst  $38
    db   $10
    db   $50
    cp   a
    ret  z
    rst  8
    call z, label_3C4F
    scf
    ld    hl, sp+$FF
    ld    hl, sp+$0F
    ld    hl, sp+$FF
    rst  $38
    ld   bc, rJOYP
    jr   label_AD835
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    jr   label_AD83B
    nop
    rst  $38
    nop
    rst  $38
    rst  $30
    dec  de
    db   $F4 ; Undefined instruction
    db   $DB
    inc  [hl]
    ei
    inc  de
    db   $FC ; Undefined instruction
    db   $10
    db   $FF
    ccf
    rst  $38
    ld   b, d
    jp   label_FF3E
    cp   a
    ld   l, b
    cp   h
    ld   a, a
    or   [hl]
    ld   h, e
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    ld   [hl], $E3
    db   $FC ; Undefined instruction
    rst  $38
    adc  a, h
    add  a, a
    ld    hl, sp+$FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $10
    db   $EF
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    rst  $38
    ld   b, b
    ld   b, b
    db   $10
    db   $10
    db   $10
    db   $EF
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    ld   [$FF50], a
    ld   e, a
    db   $10
    db   $1F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   b, h
    cp   e
    rst  $38
    nop
    ld   de, $FFEE
    rst  $38
    add  a, c
    jp   label_FFFF
    add  a, e
    rst  $38
    cp   l
    jp   label_DFA1
    cp   l
    jp   label_FB85
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    ldi  [hl], a
    db   $FF
    rst  $38
    nop
    adc  a, b
    ld   [hl], a
    ld   a, a
    rst  $38
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  $18
    ld   [$FFC0], a
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    ld   bc, $0103
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ei
    rlca
    dec  de
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AD9E6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, $27
    pop  af
    rst  $38
    jr   c, label_AD9E6
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, $FF
    db   $E3 ; Undefined instruction
    add  a, c
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, label_3FFF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
    cpl
    rst  $18
    rst  $38
    rrca
    adc  a, a
    ld   a, a
    rst  $38
    rrca
    cpl
    rst  $18
    rst  $38
    rrca
    adc  a, a
    ld   a, a
    rst  $38
    ld   a, [$FFF4]
    ei
    rst  $38
    ld   a, [$FFF1]
    cp   $FF
    ld   a, [$FFF4]
    ei
    rst  $38
    ld   a, [$FFF1]
    cp   $BD
    jp   label_DFA1
    cp   l
    jp   label_FB85
    cp   l
    jp   label_DFA1
    cp   l
    jp   label_FB85
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    adc  a, b
    rst  $30
    rst  $38
    add  a, b
    and  d
    db   $FF
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    ld   de, $FFEE
    nop
    ld   b, h
    cp   e
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, rSB
    rst  $38
    ld   de, $FFEF
    ld   bc, $BB45
    rst  $38
    ld   bc, rIE
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  $18
    ld   [$FFD8], a
    rst  $20
    cp   $FF
    inc  bc
    ld   bc, $0103
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ei
    rlca
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
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
    rra
    rlca
    pop  af
    cp   $1F
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
    adc  a, l
    di
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rrca
    nop
    ld   a, [$FF00]
    add  a, b
    nop
    rst  $38
    nop
    nop
    nop
    rrca
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rrca
    nop
    ld   a, [$FF00]
    nop
    nop
    rst  $38
    nop
    rrca
    nop
    ld   [hl], b
    nop
    add  a, b
    nop
    rst  $38
    nop
    nop
    nop
    rrca
    nop
    ld   a, [$FF00]
    rst  $38
    inc  bc
    inc  c
    rrca
    jr   c, label_ADB9D
    rst  0
    rst  $38
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rrca
    inc  a
    ccf
    jp   label_C0FF
    rst  $38
    jr   nc, label_ADB6B
    inc  c
    rst  $38
    inc  bc
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_ADB73
    inc  c
    rst  $38
    inc  sp
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_ADB7B
    inc  c
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   de, $FFEF
    ld   bc, $BB45
    rst  $38
    ld   bc, $EF11
    db   $10
    db   $EF
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    db   $10
    db   $EF
    db   $10
    db   $EF
    ld   [$FFF7], sp
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    ld   [label_8F7], sp

label_ADBAF::
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    and  b
    rst  $18
    and  b
    rst  $18
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
    nop
    jr   nz, label_ADBAD
    jr   nz, label_ADBAF
    rst  $38
    nop
    rst  $38
    nop
    ei
    rlca
    call c, label_FF3C
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    rst  $20
    ld   e, $70
    ld   a, [$FFFF]
    add  a, b
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
    rst  $38
    nop
    rrca
    nop
    ld   a, [$FF00]
    nop
    nop
    rst  $38
    nop
    rrca
    nop
    ld   [hl], b
    nop
    add  a, b
    nop
    rst  $38
    ret  nz
    ccf
    ld   a, [$FF0C]
    db   $FC ; Undefined instruction
    inc  sp
    rst  $38
    pop  bc
    rst  $38
    jr   nc, label_ADC0B

label_ADC0C::
    inc  c
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    nop
    nop
    nop
    ld   a, [$FF00]
    rrca
    nop
    rst  $38
    ret  nz
    jr   nc, label_ADC0C
    inc  e
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    rst  $38
    nop
    ld   a, [$FF00]
    rrca
    nop
    nop
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    ld   c, $00
    ld   bc, rJOYP
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    rrca
    nop
    nop
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    ld   a, [$FF00]
    rrca
    nop
    ld   bc, rJOYP
    nop
    nop
    nop
    ld   a, [$FF00]
    rrca
    nop
    ld   [$FFF7], sp
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    rlca
    ld   a, [bc]
    ld   a, [$F808]
    ld   [$FFF7], sp
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    rst  $38
    ld   [bc], a
    ld   [bc], a
    ld   [$C408], sp
    ld   a, a
    rst  $38
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    rst  $38
    ld   a, a
    call nz, label_C47F
    ld   a, a
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF3F]
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
    nop
    nop
    nop
    nop
    nop
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
    ret  nz
    ccf
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, $B5FF
    jp   z, label_CAB5
    or   l
    jp   z, label_8AF5
    push af
    adc  a, d
    rst  $30
    adc  a, b
    or   $89
    or   $89
    sbc  a, a
    ld   h, c
    sbc  a, e
    ld   h, l
    db   $DB
    dec  h
    db   $DB
    dec  h
    ei
    dec  b
    rst  $38
    ld   bc, label_1FF
    db   $DB
    dec  h
    add  a, b
    rst  $38
    or   l
    jp   z, label_AAD5
    push de
    xor  d
    push af
    adc  a, d
    rst  $30
    adc  a, b
    or   $89
    or   $89
    ld   bc, $9BFF
    ld   h, l
    db   $DB
    dec  h
    db   $DB
    dec  h
    ei
    dec  b
    rst  $38
    ld   bc, label_1FF
    db   $DB
    dec  h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    rst  $38
    rst  0
    add  a, c
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
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, a
    ld   [$FF8F], a
    rst  $38
    inc  e
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
    inc  de

label_ADD71::
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    inc  de
    rst  $38
    inc  de
    rst  $38
    add  a, e
    rst  $38
    adc  a, h
    rst  $38
    or   b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    jp   label_CEFF
    rst  $38
    ld    hl, sp+$FF
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
    rst  $38
    pop  bc
    rst  $38
    ld   sp, label_DFF
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    jp   label_AF3FF
    rst  $38
    rra
    rst  $38
    or   $89
    rst  $38
    add  a, b
    db   $A2
    and  d
    db   $A2
    and  d
    db   $A2
    and  d
    call label_CDB2
    or   d
    call z, label_CBB3
    dec  [hl]
    ld   c, c
    or   a
    ld   e, l
    and  e
    ld   e, a
    and  c
    ld   d, l
    xor  e
    ld   [hl], l
    adc  a, e
    ld   [hl], l
    adc  a, e
    ld   [hl], a
    adc  a, c
    or   $89
    rst  $38
    add  a, b
    db   $A2
    and  d
    db   $A2
    and  d
    db   $A2
    and  d
    call label_CDB2
    or   d
    add  a, b
    rst  $38
    swap l
    ld   c, c
    or   a
    ld   e, l
    and  e
    ld   e, a
    and  c
    ld   d, l
    xor  e
    ld   [hl], l
    adc  a, e
    ld   [hl], l
    adc  a, e
    ld   bc, $00FF
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   label_ADE03
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    jr   label_ADE09
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    jr   label_ADE15
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    jr   label_ADE1B
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    jr   label_ADE23
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    jr   label_ADE29
    nop
    rst  $38
    nop
    rst  $38
    cp   $FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or   c
    rst  8
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    ld    hl, sp+$E0
    adc  a, a
    ld   a, a
    ld    hl, sp+$07
    rst  $38
    nop
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
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    rst  $38
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    ret
    rst  $38
    rst  8
    rst  $38
    ld   a, [$FFFF]
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  8
    rst  $38
    ld    hl, sp+$FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rla
    rst  $38
    sub  a, e
    rst  $38
    di
    rst  $38
    rrca
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    di
    rst  $38
    rra
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
    inc  de
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    inc  de
    rst  $38
    inc  de
    rst  $38
    call nz, label_FFFF
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    call nz, label_C4FF
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
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
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
    rst  $20
    ld   a, b
    ld   c, $0F
    rst  $38
    ld   bc, $0000
    rst  $38
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
    rst  $18
    ld   [$FF3B], a
    inc  a
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld    hl, sp+$07

label_AE03C::
    ld   a, [$FF0F]
    add  a, b
    ld   a, a
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ret  nz
    ccf
    add  a, b
    ld   a, a

label_AE048::
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
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    cp   $07
    cp   $07
    cp   $03
    cp   $03
    cp   $EF
    db   $10
    db   $E7
    jr   label_AE048
    inc  e
    pop  af
    ld   c, $F8
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    ld    hl, sp+$00
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
    nop
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
    rrca
    ld   a, [$FF01]
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
    inc  bc
    db   $FC ; Undefined instruction
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
    rst  $38
    nop
    rst  $38
    nop
    pop  bc
    ld   a, $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   [$FF1F], a
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
    add  a, c
    ld   a, a
    ld   bc, rIE
    ld   h, b
    rst  $38
    ld   h, b
    rst  $38
    ld   [rIE], a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    sbc  a, a
    ld   [$FF8F], a

label_AE0DF::
    ld   a, [$FFF8]
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
    nop
    rst  $38
    nop
    nop
    rst  $38
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
    rst  $38
    nop
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
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rrca
    ld   a, [$FF03]
    rst  $38
    inc  bc
    rst  $38
    rra
    db   $E3 ; Undefined instruction
    ccf
    jp   label_837B
    ei
    inc  bc
    di
    inc  bc
    di
    inc  bc
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
    ccf
    nop
    rra
    nop
    inc  bc
    nop
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   a, [$FF0F]
    ld    hl, sp+$07
    cp   $01
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
    rst  $38
    nop
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
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rlca
    cp   $8F
    ld   a, [$FF87]
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ccf
    ld   [$FF1F], a
    rst  $38

label_AE1E1::
    nop

label_AE1E2::
    rst  $38
    nop
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38

label_AE1EE::
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rrca
    or   $07
    db   $FC ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ret  nz
    ccf
    ld   a, [$FF0F]
    rst  $38
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
    ld   bc, $FFFE
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    nop
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    ld   a, [$FF0F]
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
    ld   bc, label_FFE
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    nop
    nop
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    ld   a, [$FF00]
    add  a, c
    nop
    rrca
    nop
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    inc  bc
    rst  $20
    rlca
    add  a, a
    rlca
    rra
    rlca
    ld   a, a
    rlca
    rst  $30
    rrca
    rst  $20
    rra
    rst  0
    ccf
    add  a, c
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
    ccf
    nop
    rrca
    nop
    ret  nz
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
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    nop
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
    ld    hl, sp+$00
    rlca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    ret  nz
    ccf
    rst  $38
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
    rlca
    cp   $07
    cp   $F7
    ld   c, $FC
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FF0F]
    ld    hl, sp+$07
    cp   $01
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rra
    nop
    rra
    nop
    nop
    rst  $38

label_AE2E2::
    nop
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$07
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    db   $FC ; Undefined instruction
    rrca
    ld    hl, sp+$0F
    ld    hl, sp+$4F
    or   b
    rst  $38
    db   $10
    db   $FF
    db   $10
    db   $F7
    jr   c, label_AE2E2
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
    nop
    rst  $38
    nop
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
    nop
    ld   [$FF1F], a
    nop
    rst  $38
    rrca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
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
    cp   $01
    ld   a, [$FF0F]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, [hl]
    ld   a, a
    ld   b, $FF
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  c
    rst  $38
    ld   c, $FF
    ld   a, $FF
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    ccf
    ret  nz
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, $00FE
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
    db   $FC ; Undefined instruction
    inc  bc
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
    sbc  a, a
    ld   h, b
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    cp   $0C
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    inc  c
    rrca
    db   $FC ; Undefined instruction
    rrca
    cp   $0E
    rst  $38
    rra
    rst  $38
    rrca
    nop
    rlca
    nop
    pop  bc
    nop
    ld   [rJOYP], a
    cp   $00
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
    ld   a, a
    nop
    rlca
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    pop  hl
    ld   a, $E0
    ccf
    ld   [$FF3F], a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ld    hl, sp+$47

label_AE400::
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, rIE
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
    inc  a
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
    ld   bc, label_3FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    daa
    rst  $38
    ld   b, a
    rst  $38
    ld   b, c
    rst  $38
    ld   b, b
    ret  nz
    rst  $38
    db   $F4 ; Undefined instruction
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
    rst  $38
    nop
    rst  $38
    ld   b, $FF
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    ld   c, $FF
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
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
    rst  $38
    rra
    ld   [rIF], a
    ld   a, [$FF00]
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    ld   b, e
    cp   $41
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    rst  8
    ret  nz
    rst  0
    ret  nz
    add  a, e
    ret  nz
    and  c
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_AE508::
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    jp   label_C0FF
    rst  $38
    rst  $38
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
    ld    hl, sp+$FE
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    nop
    rst  $38
    rlca
    rst  $38
    ld   a, b
    rst  $38
    ret  nz
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    add  a, b
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
    ld   bc, label_1FF
    rst  $38
    ld   [bc], a
    rst  $38
    inc  b
    rst  $38
    jr   label_AE54A
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    ei
    ld   b, b
    ld    hl, sp+$60
    cp   $20
    rst  $38
    jr   label_AE55C
    ld   b, $DF
    ld   bc, label_AFFFF
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    ccf
    ccf
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
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
    rlca
    rst  $38
    nop
    rrca
    nop
    ld   bc, $F000
    ret  nz
    cp   $38
    rst  $38
    ld   c, $FF
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    nop
    add  a, a
    nop
    ld   [rJOYP], a
    rst  $38
    ld   sp, hl
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    ld    hl, sp+$00
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ld   a, a
    ld   a, a
    ccf
    ld   a, a
    ccf
    rst  $38
    ld   b, a
    rst  $38
    ld   b, b
    nop
    rst  $38
    ld   [rIE], a
    ld    hl, sp+$FF
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
    or   b
    ret  nz
    sbc  a, h
    ld   [$FFDE], a
    ld   [$FFDF], a
    ld   [$FFCF], a
    ld   a, [$FFC7]
    ld    hl, sp+$E7
    ld    hl, sp+$E1
    cp   $FF
    ret  nz
    rst  $28
    ret  nz
    rst  $30

label_AE605::
    ld   [$FFF8], a
    jr   nc, label_AE605
    jr   label_AE60A
    rlca
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   bc, label_1F3
    rst  $20
    inc  bc
    rrca
    ld   b, $3F
    inc  c
    rst  $38
    ld   a, [$FFFF]
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
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
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
    sbc  a, a
    nop
    rra
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
    ld    hl, sp+$00
    inc  e
    inc  e
    scf
    inc  hl
    ldi  [hl], a
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    nop
    nop
    inc  bc
    inc  bc
    cp   $FC
    ld   b, $04
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
    add  a, b
    add  a, b
    add  a, b
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$C0
    rst  $38
    ld   [hl], b
    rst  $38
    inc  e
    rst  $38
    rrca
    rst  $38
    ld   bc, $003F
    rra
    nop
    rlca
    nop
    ld   bc, label_1F00
    nop
    rst  $38
    rlca
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
    ret  nz
    rst  $28
    ret  nz
    ld   [$FF60], a
    pop  af
    ld   h, b
    rst  $38
    ld   h, b
    rst  $38
    jr   nc, label_AE6DE
    inc  e
    rst  $20
    ld   bc, label_1CF
    rra
    ld   bc, $013F
    rst  $38
    ld   bc, label_3FF
    rst  $38
    ld   b, $FF
    inc  a
    rst  $38
    rst  $38
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
    rrca
    rst  $38
    rlca
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
    cp   $00
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], $22
    inc  e
    inc  e
    ld   [label_1108], sp
    ld   de, label_3939
    ld   b, b
    ld   b, b
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    inc  bc
    ld   [bc], a
    ld   c, c
    ld   c, c
    call label_CECC
    adc  a, $86
    add  a, [hl]
    nop
    nop
    inc  c
    adc  a, h
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    add  a, b
    add  a, b
    nop
    nop
    ret  nz
    add  a, b
    ld   a, [$FFF0]
    sbc  a, b
    adc  a, b
    rrca
    rrca
    rra
    ld   [label_30F0], sp
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AE7A7::
    nop
    nop
    nop
    ld   a, [$FFF0]
    call c, label_160C
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
    rst  $38
    rlca
    rst  $38
    ld   bc, $00FF
    ld   a, a
    nop
    ccf
    nop
    rrca
    nop
    ld   bc, $0000
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
    ei
    nop
    di
    nop
    inc  bc
    nop
    cp   $07
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    ld   bc, label_3FC
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rra
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
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   a, b
    ld    hl, sp+$3C
    db   $FC ; Undefined instruction
    inc  e
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$1C
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    ld   c, $FE
    ld   b, $FE
    rlca
    rst  $38
    inc  bc
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   c, label_AE89C
    jr   label_AE876
    db   $FC ; Undefined instruction
    ld   [$FFFE], a

label_AE869::
    sub  a, b
    rst  $38
    adc  a, b
    ld   a, a
    ld   b, b
    ccf
    jr   nc, label_AE869
    ld    hl, sp+$01
    nop
    ld   [hl], c
    nop

label_AE876::
    inc  bc
    ld   bc, $0103
    rst  8
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  e
    sbc  a, a
    ld   [$FF8F], a
    ret  nz
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FFDF], a
    and  d
    rst  $18
    and  h
    rst  $18
    xor  b
    db   $DB
    xor  h
    rst  $38
    nop
    cp   d
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop

label_AE89C::
    rst  $28
    db   $10
    db   $F7
    ld   [label_12CA], sp
    ld   h, e
    add  hl, bc
    di
    ld   bc, label_1FF
    rst  $38
    pop  hl
    rst  $38
    ld   bc, label_13FD
    db   $FD ; Undefined instruction
    inc  de
    nop
    nop
    nop
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
    ld   b, $00
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
    inc  a
    jp   label_F1C3
    ld   sp, $0000
    nop
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
    ld   [rNR41], a
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
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    ld   b, $FF
    ld   b, $FF
    ld   bc, label_1FF
    ld   a, a
    nop
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
    add  a, b
    add  a, b
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   c, $FE
    ld   b, $FE
    rlca
    rst  $38
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
    inc  bc
    rst  $38
    inc  bc
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, a
    db   $EB ; Undefined instruction
    sbc  a, a
    ld   [$CABF], a
    or   [hl]
    res  2, a
    db   $E8 ; add  sp, d
    rst  $10
    xor  c
    sub  a, a
    db   $E8 ; add  sp, d
    or   e
    call label_FEFF
    rst  $38
    nop
    rst  $18
    jr   nz, label_AE997

label_AE997::
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   d, c
    rst  $38
    ld   d, c
    rst  $38
    ld   d, c
    ld   a, a
    pop  de
    rst  $38
    ld   de, $91FF
    rst  $38
    ld   de, $93FD
    ld   c, $08
    jr   label_AE9C4
    add  hl, de
    db   $10
    db   $33
    jr   nz, label_AE9F8
    ld   hl, label_2E3E
    add  hl, de
    add  hl, de
    add  hl, bc
    add  hl, bc
    ld   a, h
    inc  c
    ld   a, $02

label_AE9C4::
    cp   $12
    rst  $28
    ld   l, c
    add  a, a
    add  a, l
    ldd  [hl], a
    ldd  [hl], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   a, [$FF90]
    ld   a, b
    ld   l, b
    ld   e, h
    ld   d, h
    sbc  a, h
    sub  a, h
    sbc  a, h
    sub  a, h
    call c, label_DCD4
    sub  a, h
    sbc  a, h
    sub  a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    nop
    nop
    nop
    nop
    nop

label_AE9F8::
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_AE1E2
    sbc  a, d
    add  hl, sp
    ld   b, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, [hl]
    nop
    cp   h
    db   $10
    db   $E8
    rlca
    rlca
    ccf
    jr   c, label_AEAA4
    ld   c, e
    cp   h
    add  a, a
    cp   a
    add  a, e
    rst  $18
    ret  z
    ld   a, b
    ld   a, b
    rlca
    rlca
    ret  nz
    ret  nz
    ld    hl, sp+$38
    db   $FC ; Undefined instruction
    and  h
    ld   a, d
    jp   nz, label_82FA
    or   $26
    inc  a
    inc  a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    inc  b
    cp   a
    ret  z
    sbc  a, a
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E8 ; add  sp, d
    adc  a, a
    ld    hl, sp+$CF
    cp   b
    adc  a, h
    db   $F4 ; Undefined instruction
    rst  8
    or   b
    rst  $38
    rst  $38
    rst  $38
    nop
    cp   $01
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    inc  de
    rst  $38
    ld   de, label_11FF
    rst  $38
    ld   de, label_1FF
    ld   bc, $EF07
    ld   bc, rIE
    add  hl, bc
    add  hl, bc
    ld   c, $08
    ld   [label_AE508], sp
    ld   h, l
    sbc  a, [hl]
    sbc  a, [hl]
    sbc  a, a
    sub  a, c
    rst  $38
    ld   h, d
    cp   a
    ld   a, $12
    ld   [de], a
    ld   c, $02
    inc  de
    ld   [de], a
    db   $E3 ; Undefined instruction
    ld  [$FF00+C], a
    rlca
    ld   [bc], a
    rst  $38
    cp   $FD
    inc  bc
    rst  $38
    inc  bc
    cp   h
    and  h
    call c, label_E0FC
    and  b
    ld   [$FFA0], a
    ld   [$FFA0], a

label_AEADA::
    ret  nz
    ret  nz
    ld   [rNR41], a
    ld   [rNR41], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldd  [hl], a
    dec  a
    ret  nz
    rlca
    jr   c, label_AEB0E
    ld   [$000D], sp
    ld   [bc], a
    nop
    nop
    nop

label_AEB0E::
    nop
    nop
    jr   nz, label_AEADA
    ld   h, b
    adc  a, a
    db   $FC ; Undefined instruction
    ld   [bc], a
    ld   a, [$FF04]
    ld   b, b
    ld   [$00A0], sp
    nop
    nop
    nop
    nop
    ld   [hl], b
    add  a, b
    ld   a, h
    add  a, b
    inc  e
    ld   h, d
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
    ld   c, $01
    ld   a, $01
    jr   c, label_AEB7C
    nop
    jr   c, label_AEB39

label_AEB39::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    ccf
    nop
    rst  $38
    nop
    cp   a
    nop
    db   $FD ; Undefined instruction
    nop
    ld   a, [bc]
    inc  c
    db   $10
    db   $1F
    inc  d
    dec  de
    ld    hl, sp+$16
    ld   a, a
    db   $10
    db   $F7
    jr   label_AEB7C
    db   $10
    db   $FF
    rrca

label_AEB80::
    ld   [hl], b
    nop
    ld   c, $F1
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
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
    sbc  a, b
    ld   h, b
    rst  $38
    rst  $38
    ld   c, $00
    ld   [hl], b
    adc  a, a
    rst  $20
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $18
    jr   nz, label_AEBAC
    jr   nz, label_AEB80
    rst  $38
    ld   h, e
    ldi  [hl], a
    inc  sp
    di
    inc  sp
    jp   nc, label_AF111
    ld    hl, sp+$08
    db   $EB ; Undefined instruction
    dec  de
    ei
    ld   a, [bc]
    di
    di
    db   $FC ; Undefined instruction
    inc  b
    inc  a
    inc  a
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    or   d
    sub  a, d
    rst  $38
    rst  $38
    ld   l, l
    jp   label_FFFF
    ld   [$FFA0], a
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [rJOYP], a
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
    nop
    nop
    nop

label_AEBF7::
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
    ei
    jr   nc, label_AEBF7
    ld   sp, label_20F0
    ld   [$FFE0], a
    ld   h, b
    cp   $40
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
    ccf
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
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
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
    ret  nz
    ccf
    cp   $01
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    rrca
    rst  $38
    ld   b, $FE
    inc  c
    db   $FC ; Undefined instruction
    ld   [$F8FC], sp
    db   $FC ; Undefined instruction
    jr   nc, label_AEC6B
    db   $10
    db   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    ccf
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
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
    rst  8
    ld   bc, label_FBF
    ccf
    rra
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $FC
    rst  $38
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    nop
    nop
    nop
    nop
    nop
    nop
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

label_AECCC::
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    jr   nz, label_AECCC
    ld   a, $E0
    rra
    ld    hl, sp+$07
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    ccf
    nop
    rrca
    nop
    pop  bc
    nop
    ld   [rJOYP], a
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
    rrca
    nop
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
    nop
    nop
    rst  $38
    nop
    cp   $10
    rst  $38
    db   $10
    db   $FF
    jr   label_AEDE6
    ld   [label_C7F], sp
    ld   a, a
    rlca
    ld   a, a
    ld   bc, $003F
    nop
    nop
    ld   bc, rJOYP
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FF
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    ld   a, a
    inc  e
    rst  $38
    jr   c, label_AED84
    ld   [hl], b
    rst  $38
    ld   [rIE], a
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $FF
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AEDE6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AEE00::
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rra
    ld   [rTAC], a
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rrca
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AEF00::
    rst  $38

label_AEF01::
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
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
    ccf
    ret  nz
    inc  bc
    db   $FC ; Undefined instruction
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
    nop
    rst  $38
    jr   nc, label_AEF01
    inc  e
    db   $E3 ; Undefined instruction
    rst  8
    ld   a, [$FF43]
    db   $FC ; Undefined instruction
    ld   [rIE], a
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FF0F]
    rst  $38
    nop
    rra
    ld   [$FF03], a
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38

label_AEFD1::
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
    rst  $38
    nop
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
    ei
    ld   a, [bc]
    ei
    dec  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [label_808], sp
    ld   [$0000], sp
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, label_AC001
    ld   b, b
    ld   b, c
    ld   b, b
    ld   b, c
    ld   b, b
    ld   b, c
    ld   b, b
    ld   b, e
    ld   b, b
    inc  hl
    jr   nz, label_AF08C
    jr   nz, label_AF07E
    jr   nz, label_AEFD1
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
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
    add  a, b
    nop
    ld    hl, sp+$00
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

label_AF07E::
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    rlca
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
    ld   bc, $C000
    ret  nz
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    jr   nz, label_AF0B8
    jr   nz, label_AF0BA
    ld   [hl], b
    ld   d, b
    or   b
    sub  a, b
    cp   b
    sbc  a, b
    rst  $38
    nop
    rst  $38
    dec  sp
    and  $64
    db   $EC ; Undefined instruction
    ld   b, h
    ret
    adc  a, b
    add  a, c
    add  a, c
    add  a, c
    add  a, b
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ret  nz

label_AF0B8::
    cp   a
    and  b

label_AF0BA::
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    add  a, b
    nop
    add  a, c
    nop
    jp   label_B700
    nop
    adc  a, l
    nop
    sbc  a, l
    nop
    or   e
    nop
    jp   label_8100
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [rNR41], a
    and  b
    jr   nz, label_AF06F
    db   $10
    db   $40
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
    jr   nz, label_AF10E
    db   $10
    db   $10
    ccf
    db   $10
    db   $3F
    ld   [$889F], sp
    adc  a, a
    add  a, h
    rst  8
    ld   b, d
    rst  $20
    ldi  [hl], a
    rst  $20
    ld   hl, label_31FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_AF10E::
    rst  $38
    jr   label_AF111

label_AF111::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_601
    rlca
    jr   label_AF13F
    ld   [label_808], sp
    ld   [label_808], sp
    inc  d
    inc  d
    ld   h, d
    ld   h, d
    ld   a, [$FF00+C]
    ld   a, d
    add  a, d
    ld   l, c
    sub  a, c
    ld   bc, $0101
    ld   bc, label_606
    inc  c
    inc  c
    inc  d
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    ld   b, d
    ld   b, d
    ld   b, c

label_AF13F::
    ld   b, c
    cpl
    jr   nz, label_AF16A
    jr   nz, label_AF165
    jr   nz, label_AF187
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    jp   label_0
    nop
    nop
    nop
    nop
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
    nop

label_AF165::
    nop
    nop
    nop
    nop
    nop

label_AF16A::
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AF187::
    nop
    nop
    nop
    ld   bc, $0100
    nop
    inc  bc
    nop
    adc  a, h
    adc  a, h
    sub  a, [hl]
    add  a, d
    adc  a, a
    add  a, c
    add  a, c
    add  a, b
    add  a, [hl]
    add  a, b
    add  a, c
    add  a, b
    add  a, d
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    add  a, b
    ld   [rLCDC], a
    ld   a, [$FF20]
    ld    hl, sp+$10
    di
    ldi  [hl], a
    di
    ld   de, label_11F3
    pop  af
    ld   de, label_21F1
    pop  af
    ld   hl, label_21F1
    db   $E3 ; Undefined instruction
    ld   b, d
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    ld   [label_C08], sp
    inc  c
    inc  c
    inc  c
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
    add  a, b
    add  a, b
    ld   h, b
    ld   h, b
    db   $10
    db   $10
    ld   [label_608], sp
    ld   b, $01
    ld   bc, $0000
    rlca
    rlca
    jr   label_AF225
    ld   h, e
    ld   a, h
    cp   [hl]
    ret  nz
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    db   $EB ; Undefined instruction
    nop
    pop  hl
    cp   $00
    rst  $38
    add  hl, hl
    sub  a, $DE
    ld   bc, $0003
    ld   l, b
    nop
    jp   label_9000
    nop
    sbc  a, c
    ld   h, c
    db   $10
    db   $E0
    ld   [$C0F0], sp
    jr   c, label_AF241
    nop
    ld    hl, sp+$00
    add  a, b
    nop
    ld   [hl], b
    nop
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    add  a, b

label_AF241::
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   a, a
    ld   b, b
    ld   a, a
    jr   nz, label_AF2CE
    jr   nz, label_AF251

label_AF251::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, rJOYP
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
    inc  bc
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
    ld   bc, label_F00
    nop
    rst  $38
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
    inc  e
    rst  $38
    ld   h, b
    or   b
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
    ld   [rIE], a
    jr   label_AF2AC
    inc  b
    rra
    ld   [bc], a
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld   h, b
    rst  $38
    ld   [hl], b
    rst  $38
    jr   nc, label_AF2BA
    jr   label_AF2BC
    inc  c
    rst  $38
    inc  c
    ld   [rJOYP], a
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

label_AF2CE::
    rst  $38
    nop
    inc  b
    inc  b
    ld   b, $02
    rlca
    inc  bc
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ld   h, b
    jr   nz, label_AF34B
    jr   nz, label_AF34D
    jr   nz, label_AF34F
    jr   nz, label_AF32F
    ld   b, $3F
    dec  b
    ccf
    inc  b
    ccf
    ld   [bc], a
    ccf
    ld   [bc], a
    rra
    ld   [bc], a
    rra
    ld   [bc], a
    rra
    ld   bc, $00F8
    ld   a, [$FF00]
    rst  $30
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    rst  $38
    nop
    ld   bc, $E700
    nop
    sub  a, b
    nop
    ld   c, l
    nop
    sbc  a, b
    nop
    ld   a, b
    nop
    rst  $20
    nop
    rst  $38
    nop
    add  a, b
    nop
    nop
    nop
    ld   b, b
    nop
    jr   z, label_AF328

label_AF328::
    ld   a, [$FF00]
    ret  nz
    nop
    add  a, b
    nop
    ld   bc, label_AC801
    ld   b, b
    ld   [hl], b
    ld   b, b
    ld   e, [hl]
    ld   b, b
    ld   [rLCDC], a
    ld   a, a
    ld   b, c
    and  c
    add  a, c
    add  a, e
    add  a, d
    scf
    add  a, d
    ld   a, a
    jr   nz, label_AF342
    jr   nz, label_AF344
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38

label_AF34B::
    nop
    rst  $38

label_AF34D::
    nop
    rst  $38

label_AF34F::
    nop
    add  a, c
    add  a, b
    add  a, b
    add  a, b
    ld   b, b
    ld   b, b
    jr   nz, label_AF378
    jr   nz, label_AF37A
    db   $10
    db   $10
    db   $10
    db   $10
    ld   [$E408], sp
    nop
    db   $76 ; Halt
    nop
    adc  a, b
    ld   b, $46
    ld   bc, label_334
    rra
    nop
    ld   d, h
    inc  bc
    cpl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_AF378::
    nop
    add  a, b

label_AF37A::
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_5FF
    rst  $38
    rlca
    db   $FD ; Undefined instruction
    dec  b
    rst  8
    adc  a, a
    cp   h
    or   b
    ld   a, [$FF40]
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    add  a, c
    nop
    rlca
    nop
    rrca
    ld   bc, $C1C7
    ld   [hl], e
    ld   sp, label_83B
    dec  a
    inc  b
    db   $FD ; Undefined instruction
    inc  d
    rst  $38
    ld   [hl], e
    sbc  a, [hl]
    sub  a, e
    ld   c, e
    ld   c, d
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
    ld   [$FFBF], a
    jr   nz, label_AF43E
    jr   nz, label_AF3C0
    ld   b, $FF
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_AF3CD::
    nop
    rst  $38
    nop
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    cp   $02
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    ld   h, b
    jr   nz, label_AF443
    jr   nz, label_AF445
    jr   nz, label_AF447
    jr   nz, label_AF449
    jr   nz, label_AF44B
    jr   nz, label_AF3CD
    and  b
    ld   a, [$FF90]
    nop
    nop
    nop
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

label_AF3FF::
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
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ei
    nop
    call c, label_F000
    nop
    ld    hl, sp+$00
    add  a, c
    ld   bc, $011F
    ld   bc, label_701
    ld   b, $0F
    rrca
    dec  e
    ld   de, label_203F

label_AF42A::
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  0
    ld   [bc], a
    rst  $38
    dec  b
    rst  $28
    ld   [$909F], sp
    rst  $18
    ld   d, b
    cp   a
    jr   nc, label_AF43C
    ld   [label_4F7], sp
    rst  $38
    nop
    rst  $38

label_AF443::
    nop
    rst  $38

label_AF445::
    add  a, b
    ld   a, a

label_AF447::
    ld   b, b
    ccf

label_AF449::
    jr   nz, label_AF42A

label_AF44B::
    db   $10
    db   $9F
    db   $10
    db   $DF
    db   $10
    db   $04
    inc  b
    inc  b
    inc  b
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   [de], a
    ld   bc, $000F
    rlca
    nop
    ld   a, [bc]
    ld   bc, $0005
    inc  bc
    nop
    ld   bc, $8100
    add  a, b
    nop
    ld   [rJOYP], a
    ld   a, [$FF80]
    ld   a, b
    nop
    ld    hl, sp+$E0
    inc  e
    add  a, b
    ld   a, h
    ret  nz
    ld   a, $E0
    ld   e, $FD
    inc  b
    db   $FD ; Undefined instruction
    dec  b
    rst  $38
    inc  bc
    rst  $38
    ld   bc, label_3FF
    rst  $38
    inc  b
    rst  $38
    rrca
    ld   sp, hl
    db   $10
    db   $BE
    adc  a, [hl]
    db   $F4 ; Undefined instruction
    ld   [hl], h
    db   $E4 ; Undefined instruction
    inc  h
    ld   a, b
    jr   nz, label_AF4FC
    inc  hl
    di
    and  d
    rst  $38
    jp   nc, label_BFCF
    dec  hl
    add  hl, hl
    ld   c, e
    ld   c, c
    ld   c, e
    ld   c, c
    dec  sp
    add  hl, bc
    adc  a, e
    adc  a, c
    sbc  a, e
    adc  a, d
    rst  $38
    sub  a, e
    rst  $28
    or   $7F
    ld   b, b
    ld   a, a
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_AF4BC
    ld   a, [$FF1F]
    ld   [$00FF], sp
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    ld   h, b
    rst  $38
    jr   nz, label_AF4CE
    db   $10
    db   $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$48
    ld    hl, sp+$68
    call c, label_DC54
    ld   c, h
    call z, label_CE44
    ld   b, d
    rst  8
    ld   b, e
    rst  $18
    add  a, e
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_1818], sp
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00+C]
    inc  c
    nop
    pop  af
    nop
    ccf
    nop
    ld   a, a
    ld   bc, label_1BF
    inc  hl
    ld   [bc], a
    db   $76 ; Halt
    dec  b
    ld   a, h
    dec  de
    pop  hl
    ld   a, $C3
    ld   a, h
    adc  a, a
    ld   a, [$FFBE]
    ret  nz
    ld   a, a
    add  a, b
    rst  $20
    jr   label_AF541
    ld   [$FF78], a
    add  a, b
    rst  $38
    nop
    add  a, b
    nop
    ld    hl, sp+$00
    nop
    nop
    ret  nz
    nop
    jp   label_302
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_301
    inc  bc
    dec  b
    rlca
    rst  $38

label_AF541::
    ld   a, c
    sbc  a, a
    add  a, a
    sbc  a, a
    ld   [hl], a
    ld   a, [label_AFAFF]
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   a, l
    rst  $38
    rst  $38
    di
    ld   c, $0C
    sbc  a, [hl]
    db   $EB ; Undefined instruction
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $38
    rst  $30

label_AF55D::
    rst  $38
    push af
    rst  $38
    rst  $38
    rst  8
    jr   c, label_AF574
    jr   c, label_AF55D
    db   $FD ; Undefined instruction
    rst  $38
    jp   nc, label_D7FF
    rst  $38
    rst  $30
    rst  $38
    db   $D3 ; Undefined instruction
    rst  $38
    rst  $38
    adc  a, a
    ld   sp, hl
    ld   [hl], b

label_AF574::
    ei
    db   $ED ; Undefined instruction
    rst  $38
    rst  $38
    and  a
    rst  $38
    and  a
    rst  $38
    or   [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld   h, c
    di
    sbc  a, $FF
    cp   $5E
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   e, [hl]
    rst  $38
    ld   e, [hl]
    rst  $38
    cp   b
    rst  $38
    rst  $38
    rst  0
    rst  $38
    ld   [$FFFE], a
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   c
    rst  $38

label_AF5A0::
    rst  $20
    rst  $38
    rst  $38
    inc  e
    ld   a, l
    db   $EB ; Undefined instruction
    ei
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    jp   hl
    rst  $38
    ld   sp, hl
    rst  $38
    rst  $38
    rst  8
    ld   sp, hl
    jr   c, label_AF5A0
    rst  $10
    or   a
    rst  $18
    rst  $10
    rst  $38
    db   $D3 ; Undefined instruction
    rst  $38
    db   $D3 ; Undefined instruction
    rst  $38
    rst  $10
    rst  $38
    rst  $38
    ld   a, l
    rst  8
    add  a, [hl]
    sbc  a, a
    rst  $38
    rst  $38
    ei
    sbc  a, d
    rst  $38
    sub  a, d
    rst  $38
    cp   d
    rst  $38
    sbc  a, d
    rst  $38
    rst  $38
    push af
    dec  a
    ld   [$FF38], sp
    or   a
    rst  $38
    ld   [hl], a
    rst  $38
    rst  $30
    rst  $38
    rst  $10
    rst  $38
    rst  0
    rst  $38
    cp   $3E
    db   $E3 ; Undefined instruction
    pop  bc
    pop  bc
    ld   a, [hl]
    rst  $38
    rst  $38
    db   $ED ; Undefined instruction
    rst  $38
    cp   l
    rst  $38
    cp   l
    rst  $38

label_AF5EE::
    cp   l
    rst  $38
    ld    hl, sp+$F8
    jr   c, label_AF5FC
    jr   c, label_AF5EE
    ld    hl, sp+$F8
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $FC ; Undefined instruction

label_AF5FC::
    db   $EC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $07
    ret  nz
    rst  $38
    rrca
    ld   a, [$FF3F]
    ret  nz
    rst  $38
    nop
    rst  8
    nop
    sbc  a, $00
    db   $E8 ; add  sp, d
    nop
    cp   $00
    add  a, e
    nop
    cp   $00
    ld   h, a
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    jr   nc, label_AF61E

label_AF61E::
    and  $00
    ret  nz
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  c
    inc  c
    jr   nc, label_AF660
    add  hl, bc
    rrca
    inc  e
    rra
    ld   a, $27
    ld   a, [hl]
    ld   b, e
    rst  $38
    add  a, c
    rrca
    ld   bc, $0107
    inc  bc
    ld   bc, $FF7D
    ld   a, l
    rst  $38
    ld   a, l
    rst  $38
    cp   l
    rst  $38
    dec  e
    rst  $38
    rst  $18
    rst  $38
    sbc  a, $FF
    cp   $FF
    push af
    rst  $38
    ld   a, e
    rst  $38
    ld   a, d
    rst  $38
    ld   a, d
    rst  $38
    ld   a, d
    rst  $38
    ld   a, [$FAFF]
    rst  $38
    cp   l
    rst  $38

label_AF660::
    db   $D3 ; Undefined instruction
    rst  $38
    rst  $10
    rst  $38
    set  7, a
    set  7, a
    set  7, a
    jp   hl
    rst  $38
    ld   l, c
    rst  $38
    ld   h, l
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  8
    rst  $38
    rst  8
    rst  $38
    rst  8
    rst  $38
    rst  8
    rst  $38
    set  7, a
    sbc  a, $FF
    rst  8
    rst  $38
    rst  8
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    rst  8
    rst  $38
    cp   c
    rst  $38
    add  hl, sp
    rst  $38
    cp   c
    rst  $38
    cp   c
    rst  $38
    cp   l
    rst  $38
    cp   l
    rst  $38
    cp   l
    rst  $38
    cp   c
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    rst  $30
    rst  $38
    rst  $30
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $30
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   [hl]
    rst  $38
    rst  $10
    rst  $38
    ld   d, a
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    cp   l
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    cp   a
    rst  $38
    cp   l
    rst  $38
    cp   e
    rst  $38
    cp   d
    cp   $BE
    cp   $BC
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    call c, label_E4FC
    db   $E4 ; Undefined instruction
    sbc  a, h
    add  a, h
    inc  e
    inc  b
    inc  l
    inc  b
    inc  e
    inc  b
    ld   e, h
    inc  b
    ccf
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ld   [hl], b
    nop
    adc  a, h
    nop
    rst  $38
    rrca
    nop
    rst  $38
    ld   a, [$FF0F]
    jr   c, label_AF712

label_AF712::
    pop  bc
    ld   bc, label_203
    rlca
    inc  b
    rst  $38
    ld    hl, sp+$29
    sub  a, $13
    db   $EC ; Undefined instruction
    adc  a, $30
    ld   h, b
    ld   b, b
    db   $EC ; Undefined instruction
    add  a, b
    and  b
    nop
    ld    hl, sp+$00
    ret  nz
    nop
    add  a, b
    nop
    ld   b, b
    nop
    add  a, b
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_301
    inc  bc
    inc  b
    inc  b
    ld   [label_1408], sp
    db   $10
    db   $AE
    rst  $38
    xor  [hl]
    rst  $38
    xor  [hl]
    rst  $38
    rst  $28
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    ld   a, a
    ld   a, a
    ccf
    cpl
    cp   l
    rst  $38
    cp   l
    rst  $38
    ld   a, l
    rst  $38
    ld   a, l
    rst  $38
    ld   e, l
    rst  $38
    ld   a, l
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  a
    ld   [hl], l
    rst  $38
    ld   [hl], l
    rst  $38
    ld   [hl], l
    rst  $38
    ld   [hl], d
    rst  $38
    ld   [hl], d
    rst  $38
    or   [hl]
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   a, b
    set  7, a
    set  7, a
    db   $EB ; Undefined instruction
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    rst  $38
    rst  $30
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    rst  8
    rst  $38
    rst  $38
    rst  $38
    cp   a
    rst  $38
    cp   a
    rst  $38
    cp   $DF
    rst  $38
    adc  a, a
    cp   c
    rst  $38
    cp   c
    rst  $38
    cp   c
    rst  $38
    cp   c
    rst  $38
    cp   e
    rst  $38
    sbc  a, a
    rst  $38
    rst  $18
    rst  $38
    rst  $38
    inc  a
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $10
    rst  $38
    rst  $38
    rst  $28
    rst  $38
    rst  0
    xor  a
    rst  $38
    xor  a
    rst  $38
    xor  a
    rst  $38
    xor  a
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    adc  a, a
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    cp   d
    rst  $38
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    inc  a
    db   $D3 ; Undefined instruction
    rst  $38
    rst  $10
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
    rst  $30
    rst  $38
    rst  $20
    cp   h
    db   $FC ; Undefined instruction
    cp   h
    db   $FC ; Undefined instruction
    cp   h
    db   $FC ; Undefined instruction
    ld   a, l
    db   $FC ; Undefined instruction
    ld   a, h
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $9A
    inc  e
    inc  b
    cp   [hl]
    ld   [bc], a
    rrca
    ld   bc, $013F
    sbc  a, a
    ld   bc, label_37F
    sbc  a, l
    dec  b
    ld   sp, hl
    add  hl, bc
    jr   c, label_AF809
    db   $EC ; Undefined instruction
    inc  bc
    ret  z
    rlca
    sbc  a, h
    inc  bc
    ld   [hl], l

label_AF809::
    ld   [bc], a
    db   $EC ; Undefined instruction
    inc  bc
    or   l
    ld   [bc], a
    ld   e, a
    nop
    dec  l
    ret  nz
    ld   [hl], $C0
    ret  z
    nop
    ld   [hl], c
    add  a, b
    ld   [label_AE400], a
    nop
    ret  z
    nop
    ret  nc
    nop
    nop
    nop
    nop
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
    dec  de
    db   $10
    db   $3C
    jr   nz, label_AF8A7
    ld   b, b
    db   $FC ; Undefined instruction
    ret  nz
    ld    hl, sp+$80
    cp   $80
    db   $FD ; Undefined instruction
    ret  nz
    ld   a, $20
    rra
    inc  de
    rra
    db   $10
    db   $1F
    db   $10
    db   $0F
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rra
    db   $10
    db   $80
    add  a, b
    ld   b, d
    ld   b, b
    ld   b, b
    ld   b, b
    jr   nz, label_AF878
    inc  hl
    jr   nz, label_AF86C
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $60
    rra
    ld   d, b
    cpl
    cp   h
    inc  bc
    or   a
    ld   [label_F70], sp
    cp   h
    inc  bc

label_AF86C::
    ld   a, d
    dec  b
    inc  e
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b

label_AF878::
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$FF
    ld   bc, label_2FE
    cp   $02
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    ei
    db   $10
    db   $F0
    db   $10
    db   $F0
    db   $10
    db   $07
    ld   bc, label_207
    rra
    inc  b
    ld   a, a
    ld   [label_10FF], sp
    rst  $38
    jr   nz, label_AF89C
    ld   b, b
    ld   a, a
    jr   nc, label_AF8B0
    nop
    rrca
    nop
    add  a, a
    add  a, b
    rst  $30

label_AF8A7::
    ld   a, [$FFFB]
    jr   label_AF8AA
    ld   c, $FF
    rlca
    rst  $38
    inc  bc

label_AF8B0::
    ld   e, a
    nop
    cpl
    nop
    scf
    nop
    ld   c, c
    nop
    inc  sp
    nop
    dec  e
    nop
    ld   b, a
    nop
    ld   l, e
    nop
    ld   b, b
    nop
    jr   z, label_AF8C4

label_AF8C4::
    sub  a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ld   l, a
    ld   a, [$FF02]
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    jr   nz, label_AF8FC
    jr   nz, label_AF8FE
    ld   d, b
    jr   nc, label_AF8E0
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    pop  af
    ld   de, label_20E0
    ret  nz
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    inc  b
    nop

label_AF8FC::
    nop
    nop

label_AF8FE::
    dec  bc
    nop
    ld   l, a
    nop
    rst  $38
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
    rst  $38
    nop
    jr   nz, label_AF912

label_AF912::
    ret  nz
    nop
    and  [hl]
    nop
    dec  h
    nop
    ld   c, c
    nop
    xor  e
    nop
    ld   d, a
    nop
    cp   e
    ld   bc, label_202
    rlca
    inc  b
    rra
    ld   [label_303E], sp
    ld   sp, hl
    ld   b, b
    cp   $40
    ld   sp, hl
    ret  nz
    xor  $00
    sbc  a, a
    db   $10
    db   $1F
    db   $10
    db   $8F
    add  hl, bc
    rlca
    dec  b
    add  a, d
    inc  bc
    ld   [bc], a
    inc  bc
    add  a, d
    inc  bc
    inc  bc
    inc  bc
    rst  $38
    ld   [hl], b
    rst  $18
    ld   d, b
    sbc  a, a
    sbc  a, b
    rrca
    ld   [$880F], sp
    rrca
    ld   [$C80F], sp
    rst  8
    ret  z

label_AF950::
    db   $10
    db   $10
    ld   [label_408], sp
    inc  b
    ld   b, $06
    ld   bc, $0002
    ld   bc, $0100
    nop
    nop
    xor  $01
    ccf
    nop
    rlca
    nop
    rrca
    nop
    add  a, e
    nop
    add  a, b
    ld   b, b
    ld   b, b
    and  b
    jr   nz, label_AF948
    ld   b, b
    cp   [hl]
    ret  nz
    ld   a, $80
    ld   a, a
    ld   h, b
    sbc  a, a
    or   b
    ld   c, a
    db   $E8 ; add  sp, d
    rla
    ld   [hl], b
    rrca
    inc  l
    inc  bc
    db   $FC ; Undefined instruction
    db   $10
    db   $FE
    inc  c
    cp   $02
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    cp   $04
    rra
    ld   [label_40F], sp
    rrca
    inc  b
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rrca

label_AF99D::
    inc  b
    rrca
    inc  b
    rst  $38
    nop
    rst  $38
    ld   [hl], b
    adc  a, a
    adc  a, h
    db   $E3 ; Undefined instruction
    ld   h, d
    ei
    ld   [de], a
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    di
    ld   [de], a
    ld   sp, label_1C00
    nop
    ld   l, $00
    scf
    nop
    rst  8
    nop
    or   a

label_AF9BB::
    nop
    ld   e, e
    nop
    rst  8
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
    ret  nz
    ccf
    ret  nc
    jr   nc, label_AF9BB
    jr   label_AF99D
    jr   c, label_AF9BB
    inc  e
    rst  $30
    rrca
    ld   [$FF1F], a
    ret  c
    daa
    ld   [$FF1F], a
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   a, [$FF10]
    db   $FD ; Undefined instruction
    ld   [label_8FA], sp
    ld   sp, hl
    ld   [label_8FB], sp
    dec  b
    nop
    inc  hl
    nop
    ld   de, label_2F00
    nop
    ld   b, a
    nop
    dec  hl
    nop
    dec  d
    nop
    sbc  a, d
    nop
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
    ld   a, h
    add  a, b
    rst  $38
    ld   [$DFF7], sp
    ld   [bc], a
    cpl
    inc  b
    rst  $18
    jr   label_AFA16
    jr   nz, label_AFA18
    add  a, b
    rst  $38
    nop
    ld   a, [de]
    ld   [rUNKN6], a
    add  a, b
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
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
    ret  nz
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    cpl
    jr   z, label_AFA62
    jr   label_AFA64
    jr   label_AFA56
    ld   [label_80F], sp
    rrca
    ld   [label_101F], sp
    rra
    db   $10
    db   $FF
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FF10]
    ld   [rNR41], a
    pop  bc
    ld   b, c
    db   $E3 ; Undefined instruction
    ldi  [hl], a

label_AFA62::
    rst  0
    call nz, label_80F
    rra
    db   $10
    db   $3F
    jr   nz, label_AFAEA
    ld   b, b
    rst  $38
    add  a, c
    rst  $38
    ld   bc, label_9F9
    ei
    dec  bc
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [rNR41], a
    rst  $38
    nop
    rst  $38
    ld   a, [$FF1F]
    inc  e
    rlca
    ld   [bc], a
    inc  bc
    ld   bc, $0101
    ld   bc, $0100
    nop
    rst  $30
    ld   d, $F9
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    rst  $38
    ccf
    rst  $38
    pop  bc
    ld   a, [$FF80]
    ld   [$FF80], a
    ld   [$FF80], a
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
    ld   h, b
    rra
    db   $10
    db   $1F
    db   $10
    db   $77
    nop
    cp   e
    nop
    ld   c, l
    nop
    or   a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    ccf
    nop
    ld   l, a
    nop
    ld   [$FF1F], a
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sub  a, b
    ld   l, a
    ret  nz
    ccf
    cp   b
    ld   b, a
    ld   [$FF1F], a
    ret  nz
    ccf
    ld   b, b
    cp   a
    ld   a, a
    ld    hl, sp+$FF
    add  a, b
    ld   sp, hl
    ld   [label_8FA], sp
    ld   sp, hl
    ld   [label_8F8], sp
    db   $FD ; Undefined instruction
    inc  b

label_AFAEA::
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    cp   $02
    push bc
    nop
    ld   l, e
    nop
    or   a
    nop
    db   $DB
    nop
    cpl
    nop
    jp   label_AEF00
    nop
    ld   a, a

label_AFAFF::
    inc  bc
    ld   bc, label_7FE
    ld    hl, sp+$20
    rst  $18
    dec  de
    db   $E4 ; Undefined instruction
    ld   [hl], a
    adc  a, b
    inc  bc
    db   $FC ; Undefined instruction
    rra
    ld   [$FF3F], a
    ret  nz
    db   $FD ; Undefined instruction
    nop
    ld    hl, sp+$00
    pop  af
    nop
    xor  $00
    sub  a, b
    nop
    ld   h, d
    nop
    call nz, label_D800
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
    ld   [label_808], sp
    ld   [label_1010], sp
    db   $10
    db   $10
    jr   nc, label_AFB6A
    ld   a, b
    ld   l, b
    ld   c, a
    ld   b, a
    adc  a, h
    add  a, b
    rra
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $3F
    jr   nz, label_AFBCA
    ld   b, b
    ld   a, a
    ld   b, b
    rst  $38
    add  a, b
    nop
    add  a, c
    nop
    jp   label_B700
    nop
    adc  a, l
    nop
    sbc  a, l
    nop
    or   e
    nop
    jp   label_8100
    nop
    nop
    inc  bc
    inc  bc
    dec  b
    dec  b
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc

label_AFB6A::
    ld   a, [bc]
    ld   a, [bc]
    adc  a, h
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [rNR41], a
    ld   a, [$FF30]
    ld   a, [$FFF0]
    ld   a, [$FF00]
    ld   [hl], b
    ld   h, b
    jr   c, label_AFB80

label_AFB80::
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
    nop
    ret  nz
    add  a, b
    ret  nz
    ld   b, b
    ret  nz
    add  a, b
    ret  nz
    ret  nz
    ret  nz
    nop
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    rrca
    ld   [label_407], sp
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    add  a, a
    add  a, h
    nop
    add  a, c
    nop
    jp   label_B700
    nop
    adc  a, l
    nop
    sbc  a, l
    nop
    or   e
    nop
    jp   label_8100
    nop
    add  a, c
    nop
    jp   label_B700
    nop
    adc  a, l
    nop
    sbc  a, l

label_AFBCA::
    nop
    or   e
    nop
    jp   label_8100
    cp   $00
    ld   a, [$FF00]
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop

label_AFBDA::
    nop
    nop
    add  a, b
    nop
    jp   label_200
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $8101

label_AFBEF::
    ld   bc, label_AE1EE
    rst  $38
    jr   label_AFBDA
    ld   c, h
    di
    inc  sp
    adc  a, a
    ld   c, h
    pop  bc
    ld   [rSB], a
    db   $10
    db   $80
    ld   [$807F], sp
    cp   $00
    db   $ED ; Undefined instruction
    nop
    rst  $38
    nop
    cp   $00
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    jp   nz, label_2400
    nop
    db   $DB
    nop
    cp   a
    nop
    or   h
    nop
    rst  $28
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    add  a, h
    inc  b
    ld   [$B008], sp
    jr   nc, label_AFBEF
    ld   b, c
    adc  a, a
    add  a, b
    inc  c
    nop
    ld   e, $00
    jr   label_AFC58
    inc  e
    jr   nz, label_AFC4B
    ld   [rNR50], a
    ret  nz
    ld   l, b
    add  a, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    jr   nz, label_AFC88
    jr   nz, label_AFC6A

label_AFC4B::
    db   $10
    db   $1F
    db   $10
    db   $17
    stop
    add  a, c
    nop
    jp   label_B700
    nop
    adc  a, l

label_AFC58::
    nop
    sbc  a, l
    nop
    or   e
    nop
    jp   label_8100
    nop
    add  a, c
    nop
    jp   label_B700
    nop
    adc  a, l
    nop
    sbc  a, l

label_AFC6A::
    nop
    or   e
    nop
    jp   label_8100
    cp   $01
    rst  $38
    nop
    ld   sp, hl
    ld   b, $FE
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    and  b
    ld   e, a
    ld   b, b
    cp   a
    jr   nz, label_AFC65
    add  a, b
    ld   a, a

label_AFC88::
    ret  nz
    ccf
    ld   [$FF1F], a
    or   b
    ld   c, a
    ret  c
    daa
    db   $E4 ; Undefined instruction
    dec  de
    ld   a, [$FF0F]
    ret  c
    daa
    db   $E8 ; add  sp, d
    rla
    db   $F4 ; Undefined instruction
    dec  bc
    ld   [$F115], a
    ld   c, $F8
    rlca
    add  a, $C6
    add  a, h
    adc  a, h
    adc  a, b
    adc  a, b
    ld   [label_818], sp
    jr   label_AFCAB

label_AFCAB::
    jr   label_AFCAD

label_AFCAD::
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
    nop
    add  a, c
    nop
    jp   label_B700
    nop
    adc  a, l
    nop
    sbc  a, l
    nop
    or   e
    nop
    jp   label_8100
    ld   h, b
    ld   e, h
    ld   b, b
    ld   a, [hl]
    ld   h, b
    ccf
    jr   nc, label_AFCF7
    jr   c, label_AFCE9
    jr   label_AFCEB
    inc  a
    rlca
    ld   e, $03
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_2FF
    rst  $38

label_AFCE9::
    ld   b, $FF

label_AFCEB::
    inc  b
    rst  $38
    inc  b
    cp   $04
    ld   [rJOYP], a
    sub  a, b
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   b, b
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    or   b
    nop
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
    ei
    inc  e
    ld   [$FF7F], a
    add  a, e
    db   $FC ; Undefined instruction
    rst  $18
    nop
    cp   $03
    cp   $07
    db   $FC ; Undefined instruction
    jr   label_AFD15
    ld   [$FFF8], a
    nop
    ld   [hl], b
    add  a, b
    ld   a, [$FF01]
    add  a, b
    add  a, e
    nop
    rrca
    ld   c, $B0
    dec  e
    ld   [rUNKN2], a
    add  a, b
    ld   a, c
    add  a, b
    db   $76 ; Halt
    add  a, b
    ld   [rJOYP], a
    ld   b, b
    add  a, b
    ld   [$8000], sp
    nop
    nop
    nop
    nop
    nop
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    inc  de
    db   $10
    db   $10
    db   $10
    db   $30
    db   $10
    db   $30
    db   $10
    db   $30
    db   $10
    db   $30
    db   $10
    db   $60
    jr   nz, label_AFD2F
    ld   h, b
    cp   $00
    ld   [hl], b
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
    nop
    nop
    nop
    rrca
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
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
    ld   bc, $0000
    nop
    add  a, e
    add  a, e
    add  a, a
    add  a, h
    rrca
    inc  b
    rra
    ld   [label_81F], sp
    ccf
    db   $10
    db   $3F
    db   $10
    db   $3F
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
    add  a, b
    nop
    add  a, b
    and  b
    ld   e, a
    sub  a, b
    ld   l, a
    ret  nz
    ccf
    and  b
    ld   e, a
    ret  nc
    cpl
    xor  b
    ld   d, a
    nop
    rst  $38
    ret  nz
    ccf
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
    ld   h, b
    ld   [$FF38], a
    ld    hl, sp+$1F
    rst  $38
    ccf
    ld   bc, $00BF
    ld   e, a
    nop
    rst  $38
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
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    cp   $04
    rst  $38
    ld   b, $FD
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    ret  nz
    nop
    jr   nc, label_AFDF4

label_AFDF4::
    ret  nz
    nop
    add  a, b
    nop
    ret  nz
    nop
    jr   nc, label_AFDFC

label_AFDFC::
    add  a, c
    nop
    pop  bc
    nop
    ld   [bc], a
    db   $FD ; Undefined instruction
    dec  b
    ld   a, [$FC03]
    inc  bc
    db   $FC ; Undefined instruction
    ld   c, $F1
    dec  d
    ld   [$F708], a
    nop
    rst  $38
    pop  hl
    ld   [bc], a
    db   $EB ; Undefined instruction
    inc  b
    jp   nz, label_ED0C
    db   $10
    db   $EF
    db   $10
    db   $1E
    ld   [$FF7F], a
    add  a, b
    rst  $38
    nop
    adc  a, b
    nop
    ld   [hl], h
    nop

label_AFE24::
    db   $E8 ; add  sp, d
    nop
    sub  a, d
    nop
    db   $E4 ; Undefined instruction
    nop
    sbc  a, b
    nop
    rst  $30
    nop
    ld   c, a
    ld   bc, $0001
    ld   bc, label_301
    inc  bc
    ld   b, $06
    jr   c, label_AFE52
    ld   a, [$FF70]
    ld    hl, sp+$C0
    rst  $38
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
    ret  nz
    nop
    rst  $38
    nop

label_AFE52::
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FF10]
    db   $E3 ; Undefined instruction
    jr   nz, label_AFE24
    ld   b, c
    adc  a, a
    add  a, e
    nop
    nop
    nop
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
    ret  nz
    nop
    ld   a, [$FF00]

label_AFE7E::
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
    inc  bc
    nop
    ld   a, a
    nop
    rst  $38
    nop
    inc  a
    inc  b
    inc  a
    inc  b
    ld   a, $06
    ld   a, $02
    ld   a, $02
    rra
    inc  bc
    rra
    inc  bc
    rra
    ld   bc, $C000
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$00
    cp   $00
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    and  b
    ld   e, a
    ret  z
    scf
    sub  a, b
    ld   l, a
    ret  z
    scf
    and  b
    ld   e, a
    ld   a, [$FF0F]
    ld    hl, sp+$07
    rra
    rst  $38
    rrca
    rst  $38
    rlca
    rst  $38
    add  a, e
    ld   a, a
    pop  hl
    rra
    add  a, c
    ld   a, a
    pop  hl
    rra
    pop  bc
    ccf
    rrca
    ld   a, [$FF08]
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$FE
    inc  b
    cp   $02
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
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   a, [$FF30]
    db   $FC ; Undefined instruction
    inc  c
    cp   $02
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF1F]
    ld   [$FF1F], a
    ld   [$FF7F], a
    add  a, b
    cp   $00
    rst  $20
    nop
    db   $FD ; Undefined instruction
    nop
    rst  $18
    nop
    rst  $38
    nop
    push af
    nop
    ld   a, a
    nop
    rst  $38
    ld   bc, label_3AF
    rst  $38
    ld   b, $BF
    inc  c
    ld   a, a
    jr   label_AFF28
    jr   nc, label_AFF2A
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    ld   e, $00
    inc  e
    ld   [$0006], sp
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
    ld   b, a
    ld   b, h
    daa
    inc  h
    rrca
    ld   [$C8CF], sp
    ccf
    jr   z, label_AFF9A
    jr   z, label_AFF7C
    ld   [label_AC85F], sp
    cp   $02
    cp   $02
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
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    ld   [rNR41], a
    ld    hl, sp+$18

label_AFF7C::
    cp   $06
    rst  $38

label_AFF7F::
    ld   bc, label_283F
    rra

label_AFF83::
    ld   [label_91F], sp
    rra
    add  hl, bc
    ld   e, $0A
    ld   e, $0A
    ld   a, $0A
    ld   a, $0A
    sub  a, b
    sub  a, b
    ret  nc
    ld   d, b
    ret  c
    ld   e, b
    db   $E8 ; add  sp, d
    jr   z, label_AFF83
    ld   a, [hli]

label_AFF9A::
    ld   a, [$FF00+C]
    ld   a, [$FF10]
    ld    hl, sp+$08
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  z
    scf
    db   $F4 ; Undefined instruction
    dec  bc
    ret  nc
    cpl
    ld    hl, sp+$07
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    dec  bc
    ld    hl, sp+$07
    db   $E3 ; Undefined instruction
    inc  bc
    ld   bc, $0101
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
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $80
    ld   a, a
    ret  nz
    ccf
    ret  nz
    ccf
    add  a, b
    ld   a, a
    nop
    rst  $38
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   d, b
    xor  a
    add  a, b
    ld   a, a
    nop
    rst  $38
    ld   b, b
    cp   a
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

label_AFFFF::
    nop
