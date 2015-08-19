section "bank58",romx,bank[$3A]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_700
    ld   bc, label_70F
    rra
    rrca
    rra
    ld   c, $1F
    nop
    inc  bc
    ld   bc, $010F
    rrca
    rlca
    rlca
    ld   bc, $0103
    ld   bc, $0000
    nop
    nop
    nop
    jr   nc, label_E8024

label_E8024::
    ld   a, a
    jr   nc, label_E8023
    ld   a, e
    cp   $9D
    rst  $38
    xor  $FF
    or   $FF
    dec  d
    rst  $38
    db   $DB
    rst  $38
    ld   l, e
    rst  $38
    ld   l, e
    rst  $38
    ld   l, d
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    ld   h, c
    di
    inc  c
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [hl], b
    add  a, b
    ld   [label_8F0], sp
    ld   a, [$FF84]
    ld   a, b
    call nz, label_C4B8
    cp   b
    call nc, label_F428
    ld   c, b
    db   $FC ; Undefined instruction
    ld   b, b
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   c, c
    ld   [hl], $89
    halt
    ld   b, [hl]
    adc  a, a
    halt
    jr   c, label_E80E9
    nop
    add  a, d
    ld   a, h
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
    rlca

label_E808C::
    ccf
    rra
    ccf
    rra
    rra
    ld   c, $0F
    ld   bc, label_207
    rra
    ld   [bc], a
    rra
    ld   c, $0F
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    rst  $38
    ld   h, b
    ld    hl, sp+$F7
    db   $FC ; Undefined instruction
    dec  sp
    cp   $DD
    rst  $38
    db   $EC ; Undefined instruction
    rst  $38
    dec  hl
    rst  $38
    or   a
    rst  $38
    sub  a, $FF
    sub  a, $FF
    call nc, label_D0FF
    rst  $38
    sub  a, $FF
    ret  nz
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
    jr   nc, label_E808C
    ld   [label_4F0], sp
    ld    hl, sp+$82
    ld   a, h
    add  a, d
    ld   a, h
    sub  a, d
    ld   l, h
    sbc  a, $A0
    ld   [$FF80], a
    ret  nz
    nop
    nop
    nop
    nop
    nop
    rlca
    ld   [bc], a
    rlca
    inc  bc
    inc  bc
    nop
    ld   bc, label_F00

label_E80E9::
    nop
    ld   [label_607], sp
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
    db   $EB ; Undefined instruction
    inc  d
    sub  a, c
    ld   l, [hl]
    db   $EB ; Undefined instruction
    dec  d
    add  a, a
    ld   a, c
    push hl
    ld   a, [label_27F8]
    ld   sp, $CFCE
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E813F::
    nop
    nop
    nop
    nop
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
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ld   a, a
    rra
    ld   a, a
    jr   nc, label_E8168
    ld   l, a
    rst  $38
    ld   e, a
    rst  $38
    ccf
    rst  $38
    cp   h
    rst  $38
    add  a, e
    rst  $38
    or   a
    rst  $38
    or   a
    rst  $38
    or   a
    rst  8
    cp   a
    rst  $38
    or   b
    cp   a
    rra
    ld   e, a
    jr   nz, label_E8181

label_E8181::
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    ld   a, [$FF60]
    ld    hl, sp+$B0
    ld    hl, sp+$D0
    ei
    jr   nz, label_E818E
    xor  d
    rst  $38
    jp   z, label_EAAFF
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    sbc  a, [hl]
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ld   l, b
    db   $E8 ; add  sp, d
    ret  nz
    ret  nc
    jr   nz, label_E81A1

label_E81A1::
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    ld   a, a
    ret  nc
    cpl
    rst  $38
    jp   nz, label_DFE0
    rst  $38
    jr   c, label_E8248
    nop
    add  a, l
    ld   a, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_E88F0], sp
    or   b
    db   $FC ; Undefined instruction
    jr   label_E8223
    ret  c
    ld    hl, sp+$E0
    ld   a, [$FF00]
    ld   [$F8F0], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [bc], a
    ld   bc, $0001
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
    nop
    nop
    nop

label_E8223::
    nop
    rlca
    nop
    inc  e
    rlca
    db   $E8 ; add  sp, d
    rra
    ld   c, c
    cp   [hl]
    ld   b, l
    cp   [hl]
    inc  bc
    db   $FD ; Undefined instruction
    ld   h, e
    cp   l
    rst  $18
    inc  hl
    rst  $38
    db   $DB
    rst  $38
    db   $DB
    rst  $38
    dec  de
    daa
    rst  $18
    ccf
    rst  $18
    rra
    rst  $20
    ld   [bc], a
    ld   bc, $0001
    ld   bc, $0000
    nop

label_E8248::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    daa
    ret  c
    ld   b, h
    cp   a
    db   $F4 ; Undefined instruction
    ld   l, a
    di
    ld   l, a
    pop  af
    ld   l, a
    ld   h, b
    rra
    ld   b, b
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
    nop
    nop
    ld   bc, label_200
    ld   bc, label_31D
    jr   nc, label_E82AD
    jr   c, label_E82AF
    ld   a, [hli]
    dec  e
    dec  h
    ld   a, [de]
    rra
    ld   [bc], a
    rlca
    ld   [bc], a

label_E8298::
    rlca
    ld   [bc], a
    rrca
    ld   b, $0E
    rlca
    rrca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   [$E7F0], sp
    ld    hl, sp+$00

label_E82AD::
    rst  $38
    nop

label_E82AF::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jp   label_E63C
    db   $DB
    db   $ED ; Undefined instruction
    rst  $10
    ld   a, [hl]
    rst  0
    rst  $38

label_E82BF::
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
    add  a, b
    nop
    add  a, b
    nop
    ld   a, [$FF00]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_E8298
    and  b
    ld   b, b
    and  b
    ld   b, b
    ret  nz
    nop
    ld   h, b
    add  a, b
    rlca
    inc  bc
    inc  bc
    nop
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    inc  bc
    nop
    ld   [bc], a
    ld   bc, label_304
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
    nop
    nop
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, $DD
    ccf
    adc  a, $0F
    or   $07
    ld    hl, sp+$00
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

label_E8320::
    db   $10 ; Undefined instruction
    ld   [label_8F0], sp
    ld   a, [$FF10]
    ld   [$FF60], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_31D
    jr   z, label_E836B
    jr   c, label_E836D
    ldd  [hl], a
    dec  e
    dec  h
    ld   a, [de]
    rra
    ld   [bc], a
    rlca
    ld   [bc], a

label_E8356::
    rlca
    ld   [bc], a
    rrca
    ld   b, $0E
    rlca
    rrca
    rlca
    rlca
    inc  bc

label_E8360::
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   [$E7F0], sp
    ld    hl, sp+$00

label_E836B::
    rst  $38
    nop

label_E836D::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jp   label_E63C
    db   $DB
    db   $ED ; Undefined instruction
    rst  $10
    ld   a, [hl]
    rst  0
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
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
    add  a, b
    nop
    add  a, b
    nop
    ld   a, [$FF00]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_E8356
    and  b
    ld   b, b
    and  b
    ld   b, b
    ret  nz
    nop
    ld   b, b
    add  a, b
    jr   nz, label_E8360
    inc  bc
    nop

label_E83A2::
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
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
    ld    hl, sp+$07
    ld   a, b
    or   a
    ld   a, b
    or   a
    ld   a, h
    or   e
    ld   a, e
    or   h
    ld   sp, label_1CE
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
    jr   nz, label_E83A2
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_E83A8
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
    dec  c
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    ld   e, $01
    inc  d

label_E840B::
    dec  bc
    inc  d
    dec  bc
    dec  d
    ld   a, [bc]
    ld   [hl], e
    dec  c
    sub  a, e
    ld   l, l
    adc  a, e
    ld   [hl], h
    adc  a, c
    halt
    rlca

label_E841A::
    db   $FC ; Undefined instruction
    ld   a, e
    rst  $38

label_E841D::
    ld   a, h
    ld   a, a

label_E841F::
    ccf
    cp   [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, label_E84FE
    cp   e
    ld   b, h
    cp   e
    db   $FC ; Undefined instruction
    inc  bc
    and  $FD
    rst  $38
    db   $FC ; Undefined instruction
    cp   $01
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    jr   nc, label_E840B
    inc  sp
    call z, label_3FF
    nop
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   a, [$FF00]
    ret  nc
    jr   nz, label_E841D
    jr   nz, label_E841F
    jr   nz, label_E8461
    ld   [rNR10], a
    ld   [$FF30], a
    ret  nz
    jr   nz, label_E8418
    jr   nz, label_E841A
    ld   [rJOYP], a
    ld    hl, sp+$C0
    call nz, label_3FB8

label_E8461::
    rlca
    rrca
    rlca
    rlca
    inc  bc
    inc  bc
    nop
    inc  b
    inc  bc
    rrca
    rlca
    rrca
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
    ld   a, h
    ld   a, h
    add  a, e
    rst  $28
    rst  0
    rst  $28
    rst  0
    rst  0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call nz, label_C4B8
    cp   b
    call nz, label_B8B8
    nop
    ld   b, b
    add  a, b
    ld   [$FFC0], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, e
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   d, $29
    ld   d, $00
    nop
    nop
    nop
    nop

label_E84E5::
    nop
    nop

label_E84E7::
    nop
    nop
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
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    jr   label_E84E5

label_E84FE::
    jr   label_E84E7
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  hl, hl
    ld   d, $7E
    ld   bc, label_EBEF3
    rst  $38
    ld   a, [hl]
    rst  $38

label_E8529::
    nop
    rst  $38

label_E852B::
    nop
    ld   a, a
    nop
    sbc  a, e
    ld   h, h

label_E8530::
    sbc  a, a
    ld   a, e
    sbc  a, a
    ld   a, e
    sbc  a, a
    ld   a, b
    ld   a, a
    inc  b
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_E8529
    jr   label_E852B
    ld   bc, $C1FE
    ld   a, $81
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rrca
    pop  af
    rst  $38
    rrca
    ccf
    db   $ED ; Undefined instruction
    sbc  a, a
    xor  $DF
    ld   [hl], $FF
    ld   [hl], $FE
    inc  d
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    jr   nc, label_E8560

label_E8560::
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
    ret  nz
    nop
    jr   nz, label_E8530
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, hl
    ld   d, $7E
    ld   bc, label_EBEF3
    rst  $38
    ld   a, [hl]
    rst  $38

label_E8589::
    nop
    rst  $38

label_E858B::
    nop
    ld   a, a
    nop
    inc  c
    inc  bc
    rst  $38
    inc  c
    rst  $38
    ld   [hl], a
    rst  $38
    ld   [hl], a
    rst  $38
    add  hl, de
    ld   a, a
    ld   b, $1E
    inc  b
    inc  c
    nop
    nop
    nop
    jr   label_E8589
    jr   label_E858B
    ld   bc, $C1FE
    ld   a, $81
    ld   a, [hl]
    add  a, e
    ld   a, h
    ccf
    jp   label_BF43
    jp   label_C33F
    cp   [hl]
    jp   label_FFBE
    pop  bc
    ld   [$FF1F], a
    ld   a, a
    ccf
    ld   a, a
    ccf
    ld   a, a
    nop
    ld   [hl], b
    nop
    sub  a, b
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   a, [$FF00]
    stop
    stop
    db   $10 ; Undefined instruction
    ld   a, [$FF00]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    sub  a, b
    ld   h, b
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
    nop
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
    sub  a, b
    ld   h, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    sub  a, b
    ld   h, b
    ld   [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E8635::
    nop
    nop
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
    ld   bc, $0103
    rrca
    nop
    ld   [label_607], sp
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
    db   $EB ; Undefined instruction
    inc  d
    pop  de
    ld   l, $C3
    cp   h
    call label_F3B3
    ld   c, $DE
    pop  hl
    jr   z, label_E8635
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
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    add  a, b
    nop
    ld   b, b
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
    nop
    nop
    nop
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
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    add  a, b
    nop
    ld   l, e
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   d, $29
    ld   d, $29
    ld   d, $7E
    ld   bc, label_EBEF3
    rst  $38

label_E86D5::
    ld   a, [hl]
    rst  $38

label_E86D7::
    nop
    rst  $38

label_E86D9::
    nop
    ld   a, a
    nop
    jr   label_E86ED
    ccf
    db   $10 ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    jr   label_E86D3
    jr   label_E86D5
    jr   label_E86D7
    jr   label_E86D9
    ld   bc, $C1FE
    ld   a, $81
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    ld   b, $F8
    rra
    and  $FF
    rra
    rlca
    inc  bc
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    ld   [bc], a
    ld   bc, label_304
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
    nop
    nop
    db   $FC ; Undefined instruction
    di
    ld    hl, sp+$07
    db   $E8 ; add  sp, d
    rst  $10
    db   $E4 ; Undefined instruction
    db   $DB
    jp   nz, label_13D
    cp   $00
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
    db   $10 ; Undefined instruction
    ld   [label_8F0], sp
    ld   a, [$FF10]
    ld   [$FF60], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, b
    nop
    ccf
    rra
    ld   e, a
    cpl
    ld   e, a
    cpl
    ld   c, a
    jr   nc, label_E87BF
    ld   bc, label_70F
    rrca
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $20
    ld    hl, sp+$F7
    ld    hl, sp+$F7
    ld    hl, sp+$07
    rrca
    ld   a, [$FFFC]
    ld    hl, sp+$FC
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

label_E87BF::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    dec  [hl]
    rst  $38
    halt
    or   l
    adc  a, $7B
    adc  a, h
    ld   [hl], a
    adc  a, b
    inc  e
    rst  $38
    inc  h
    rst  $38
    call c, label_EB4E7
    adc  a, a
    jp   [hl]
    rra
    ld   [$ED1F], a
    ld   e, $F3
    inc  c
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_E8825
    ret  z
    rst  $38
    ld   sp, $F2DF
    rra
    db   $F4 ; Undefined instruction
    rra
    ld   sp, hl
    ld   c, $00
    rst  $38
    ld   [hl], b
    rst  $38
    adc  a, h
    rst  $38
    or   d
    rst  8
    add  hl, sp
    rst  0
    ld   a, l
    add  a, e
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    nop
    rst  $38
    add  a, c
    rst  $38
    jp   nz, label_A5FF
    cp   $55
    cp   [hl]
    ld   a, e
    sbc  a, h
    ei
    inc  c
    ei
    inc  b
    ret  nz
    rst  $38
    ld   b, c
    rst  $38
    and  d
    ld   a, a
    ldh  [$FF0C], a
    ccf
    push af
    ld   e, $FD
    ld   c, $FD
    ld   c, $FD
    ld   [bc], a
    nop
    rst  $38
    rrca
    rst  $38
    sub  a, h
    ei
    ld   c, e
    db   $FC ; Undefined instruction
    xor  e
    ld   a, h
    push hl
    ld   a, $F5
    ld   e, $F9
    ld   c, $00
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_E8877
    db   $EC ; Undefined instruction
    rra
    ld   a, [$FD07]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E88F0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   sp, label_E93FF
    cp   $D7
    cp   h
    rst  $10
    inc  a
    rst  $28
    jr   label_E8906
    ld   [$FF38], sp
    ld   e, b
    rst  $28
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E8 ; add  sp, d
    rra
    jp   [hl]
    rra
    ld   [$ED1F], a
    ld   e, $F1
    ld   c, $00
    rst  $38
    nop
    rst  $38
    ld   b, e
    rst  $38
    and  d
    rst  $38
    ldi  [hl], a
    rst  $38
    and  h
    ld   a, a
    push de
    ld   a, $EB
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
    nop
    nop
    nop
    nop
    nop
    nop

label_E8957::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   hl, label_E8320
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
    jr   label_E8957
    ld   b, $F8
    ld   a, l
    cp   $C6
    rst  0
    cp   d

label_E897D::
    cp   e
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
    jr   nc, label_E897D
    jr   nz, label_E898F
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
    ld   bc, $0101
    ld   bc, $0101
    rlca
    rlca
    rrca
    ld   [label_1718], sp
    jr   label_E89C5
    jr   nc, label_E89DF
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

label_E89C6::
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
    jr   c, label_E89A4
    jr   label_E89C6
    inc  c

label_E89DF::
    db   $F4 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $8000
    ld   a, a
    ret  nz
    ccf
    ld   h, b
    rra
    jr   nc, label_E8A27
    db   $10 ; Undefined instruction
    ld   [label_807], sp
    rlca
    inc  b
    inc  bc
    ret  nz
    ccf
    jr   nc, label_E8A33
    ld   [label_407], sp

label_E8A27::
    inc  bc
    ld   [bc], a
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
    jr   label_E8A4F
    inc  b
    inc  bc
    ld   b, $01
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
    adc  a, [hl]
    add  a, a
    add  a, [hl]
    add  a, e
    add  a, a
    add  a, c
    add  a, a
    add  a, c
    add  a, a
    add  a, c
    adc  a, [hl]

label_E8A6B::
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
    jr   nz, label_E8A6B
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
    jr   nc, label_E8AD1
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

label_E8ACA::
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    cp   $00
    inc  c

label_E8AD1::
    db   $F4 ; Undefined instruction
    adc  a, [hl]
    db   $F2 ; Undefined instruction
    add  a, [hl]
    ld   a, [label_E813F]
    ccf
    ld   b, c
    ld   [hl], e
    ld   c, l
    daa
    ld   e, c
    rrca
    ld   [hl], c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E8AE8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E8B02::
    inc  bc
    db   $FC ; Undefined instruction
    ld   c, $F0
    jr   label_E8AE8
    jr   nz, label_E8ACA
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
    jr   nz, label_E8B02
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    sbc  a, h
    add  a, h
    ld   e, [hl]
    ld   c, h
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
    jr   label_E8B93
    inc  b
    rlca
    add  a, d
    add  a, e
    pop  bc
    pop  bc
    ld   h, c
    ld   b, c
    jr   c, label_E8BAE
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    rst  $38
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
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [label_808], sp
    jr   label_E8C70
    jr   nc, label_E8C61

label_E8C61::
    nop
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ld   [rNR41], a
    ld   [rNR41], a

label_E8C70::
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
    ld   [bc], a
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
    ret  nz
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E8CBF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, e
    rst  $38
    rst  0
    ld   a, h

label_E8D06::
    and  $3C
    db   $F2 ; Undefined instruction
    ld   e, $FE
    inc  c
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    nop
    rst  $38
    add  a, [hl]
    rst  $38
    call label_ED79
    jr   c, label_E8D06
    jr   c, label_E8D18
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rst  $38
    ld   bc, label_3FF
    cp   $86
    db   $FC ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, b
    ei
    db   $10 ; Undefined instruction
    nop
    rst  $30
    nop
    rrca
    rst  $38
    ld   [hl], b
    ld   a, [$FF84]
    add  a, h
    add  a, a
    add  a, a
    add  a, b
    add  a, b
    ld   h, b
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   c, label_E8D83
    add  a, h
    add  a, a
    add  a, h
    add  a, a
    inc  b
    rlca
    jr   label_E8D6B
    ld   [rIE], a
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

label_E8D6B::
    nop
    nop
    nop
    nop
    nop
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    add  a, c
    ld   a, [hl]
    ld   [$FF1F], a
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

label_E8D83::
    ccf
    add  a, c
    ld   a, [hl]
    rlca
    ld    hl, sp+$FF
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    pop  hl
    cp   a
    or   e
    ld   e, $72
    ld   e, $FA
    ld   c, $FE
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    pop  bc
    ld   a, a
    db   $E3 ; Undefined instruction
    ld   a, $E6
    inc  a
    db   $FD ; Undefined instruction
    jr   label_E8E18
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rst  $38
    nop
    rst  $38
    add  a, c
    rst  $38
    ld   b, a
    ld   a, [hl]
    xor  $38
    ld   sp, hl
    db   $10 ; Undefined instruction
    nop
    rst  $30
    nop
    rlca
    rst  $38
    jr   c, label_E8E2C
    ld   b, d
    jp   nz, label_C343
    ld   b, b
    ret  nz
    jr   nc, label_E8E2C
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [hl], b
    rst  $18
    pop  de
    sbc  a, a
    or   c
    rra
    ld   a, e
    ld   c, $FA
    ld   c, $FD
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    ld   [$FFBF], a
    and  b
    ccf
    ld   sp, label_EB31F
    ld   e, $FC
    inc  e
    ei
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rst  $38
    nop
    rst  $38
    ld   h, b
    rst  $38
    and  e
    cp   a
    ld   l, [hl]
    inc  a
    db   $FD ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    rst  $30
    nop
    inc  bc
    rst  $38
    inc  e
    db   $FC ; Undefined instruction

label_E8F34::
    ld   hl, label_21E1
    pop  hl
    jr   nz, label_E8F1A
    jr   label_E8F34
    rlca
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFF]
    ld   c, $0F
    ld   hl, $E121
    pop  hl
    ld   bc, label_601
    rlca
    ld    hl, sp+$FF
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E9014::
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    jr   nc, label_E902B
    jr   nz, label_E903D
    jr   label_E9027
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E9027::
    nop
    nop
    nop
    nop

label_E902B::
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_3F00
    nop
    ld   sp, hl
    ld   [hl], $18
    sub  a, a
    ld   a, $38
    ld    hl, sp+$F6
    ld   a, c

label_E903D::
    or   $F9
    ld   d, $00
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_E9014
    db   $10 ; Undefined instruction
    sub  a, b
    ld   h, b
    ld   [hl], b
    nop
    sbc  a, b
    ld   h, b
    inc  d
    db   $E8 ; add  sp, d
    inc  h
    ret  c
    ld   de, label_EA10A
    ld   d, $43
    dec  a
    ccf
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rrca
    rlca
    rrca
    rlca
    rlca
    nop
    ld   [bc], a
    ld   bc, $0007
    jr   label_E907F
    jr   nz, label_E9099
    ld   b, h
    dec  sp
    ld   a, c
    ld   b, $0F

label_E907F::
    nop
    inc  h
    ret  c
    call nz, label_38
    ld    hl, sp+$80
    ld   [hl], b
    ret  nz
    and  b
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

label_E9099::
    nop
    nop
    nop
    nop
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
    rrca
    rlca
    rlca
    inc  bc
    rrca
    rlca
    rra
    rrca
    rra
    dec  bc
    rrca
    inc  bc
    rrca
    rlca
    rrca
    inc  b
    inc  c
    nop
    ld   bc, $0100
    nop
    nop
    nop
    rst  $38
    ld   a, a
    ld   a, a
    ccf
    ccf
    rrca
    ccf
    db   $10 ; Undefined instruction
    ldd  [hl], a
    ld   [hl], d
    dec  c
    db   $10 ; Undefined instruction
    jr   nz, label_E90EF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   h, h
    rst  $38
    ld   l, e
    rst  $38
    xor  e
    rst  $38
    rst  $10
    rst  $38
    sub  a, $FF
    call nc, label_D0FE
    cp   $B4
    rst  $38
    or   [hl]
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    db   $FC ; Undefined instruction

label_E90F9::
    ld   e, b
    db   $FC ; Undefined instruction
    jr   c, label_E90F9
    ld   a, b
    ld   a, h
    cp   b
    jp   nz, label_C2BC
    cp   h
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    pop  bc
    ld   a, $41
    ld   a, $42
    inc  a
    ld   b, d
    inc  a
    ldh  [$FF0C], a
    inc  e
    inc  h
    jr   label_E9139
    jr   label_E912F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E912F::
    nop
    nop
    nop
    nop
    nop
    rlca
    nop

label_E9136::
    ld   a, b
    rlca

label_E9138::
    ld   b, b

label_E9139::
    ld   a, $38
    rlca
    db   $10 ; Undefined instruction
    jr   nz, label_E9157
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E914C::
    nop
    nop

label_E914E::
    nop
    nop
    inc  bc
    nop
    cp   $01
    ldd  [hl], a
    dec  l
    ld   [hl], c

label_E9157::
    ld   l, [hl]
    ld    hl, sp+$F4
    push af
    db   $E8 ; add  sp, d
    ld   [hl], c
    xor  $FA
    dec  d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_E9136
    jr   nz, label_E9138
    ld   a, [$FF00]
    jr   z, label_E914C
    jr   z, label_E914E
    inc  h
    ret  c
    ld   b, c
    ld   l, $87
    ld   a, c
    rst  $38
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rrca
    rlca
    rrca
    rlca
    rra
    nop
    ldh  [$FF0C], a
    dec  e
    add  a, c
    ld   a, [hl]
    ld   h, [hl]
    add  hl, de
    inc  d
    dec  bc
    inc  hl
    inc  e
    ld   de, label_F0E
    nop
    ld   b, h
    cp   b
    add  a, h
    ld   a, b
    ld   [$80F0], sp
    ld   [hl], b
    ret  nz
    and  b
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

label_E91B9::
    nop
    nop
    nop
    nop
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
    ld   bc, label_1F3F
    rra
    rlca
    rst  $38
    rrca
    rst  $38
    ld   a, a
    ld   a, a
    rrca
    ccf
    ld   e, $1F
    nop
    nop
    nop
    ld   bc, $0100
    nop
    nop
    nop
    rst  $38
    ld   a, [hl]
    ld   a, a
    ld   a, $7F
    dec  c
    rst  $38
    ld   h, b
    rst  $38
    ld   [bc], a
    ld   [de], a
    dec  c
    db   $10 ; Undefined instruction
    jr   nz, label_E920F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   h, h
    rst  $38
    ld   l, e
    rst  $38
    xor  e
    rst  $38
    rst  $10
    rst  $38
    sub  a, $FF
    or   h
    cp   $70
    cp   $64
    rst  $38
    xor  $FF
    adc  a, $FF

label_E9215::
    adc  a, h
    db   $FC ; Undefined instruction
    jr   nc, label_E9215
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    ld   a, h
    cp   b
    jp   nz, label_C2BC
    cp   h
    add  a, d
    ld   a, h
    and  d
    ld   e, h
    ldh  [$FF0C], a
    inc  e
    ld   b, d
    inc  a
    ld   b, h
    jr   c, label_E9273
    jr   c, label_E91B9
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    sub  a, b
    ld   h, b
    sub  a, b
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
    db   $FC ; Undefined instruction
    ld   [hl], d
    ld   a, [$FF6C]
    ld   [$FFD8], a
    ret  nz
    jr   nc, label_E9299
    and  b
    add  a, b
    ld   b, b
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
    db   $FC ; Undefined instruction
    ld   h, d
    ld   [rNR32], a
    add  a, b
    ld   e, b
    nop
    or   b
    nop
    ld   [rJOYP], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E9299::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $8100
    nop
    add  a, c
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
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    add  a, h
    nop
    ld   b, h
    nop
    jr   c, label_E939E

label_E939E::
    nop
    ld   bc, $0040
    ret  nz
    nop
    and  b
    nop
    jr   nz, label_E93A8

label_E93A8::
    jr   nz, label_E93AA

label_E93AA::
    stop
    stop
    stop
    ld   [label_840], sp
    ld   b, b
    inc  b
    ld   b, b
    ld   [bc], a
    ld   h, b
    ld   bc, $0060
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    jr   nz, label_E93BF
    nop
    nop
    nop
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
    nop
    nop
    ld   [label_1800], sp
    nop
    jr   z, label_E93D8

label_E93D8::
    ret  z
    nop
    ld   [label_700], sp
    nop
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
    ret  nz
    nop
    jr   nz, label_E93EE

label_E93EE::
    jr   nz, label_E93F0

label_E93F0::
    ret  nz
    nop
    nop
    nop
    inc  b
    nop
    inc  b
    nop
    ld   a, [bc]
    nop
    db   $F2 ; Undefined instruction
    nop
    ld   bc, $0000

label_E93FF::
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
    nop
    nop
    nop
    ld   bc, label_600
    nop
    ld   [label_1000], sp
    nop
    ld   [rSB], a
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
    jr   label_E942A

label_E942A::
    jr   z, label_E942C

label_E942C::
    jr   z, label_E942E

label_E942E::
    ld   d, b
    nop
    sub  a, b
    nop
    sub  a, b
    nop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [$82C0], sp
    nop
    ld   a, h
    nop
    nop
    ld   bc, label_700
    nop
    rra
    inc  bc
    rst  $38
    adc  a, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, d
    nop
    inc  a
    nop
    nop
    nop
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $38
    jp   label_FFFF
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
    rlca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    ld   b, e
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
    jr   nz, label_E94A1
    ld   [hl], b
    rst  $38
    ld   a, b
    rst  $38
    rst  $38
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
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
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
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   label_E94E9
    ld   a, h
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
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FF
    rst  $38
    rrca
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
    rlca
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld    hl, sp+$00
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld    hl, sp+$FF
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
    nop
    nop
    ld   bc, label_200
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    pop  bc
    add  a, c
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
    nop
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
    ld   [hl], c
    add  a, b
    ld   e, $C0
    nop
    ld    hl, sp+$80
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
    ld   a, [$FF00]
    sbc  a, a
    jr   nz, label_E9597

label_E9597::
    ccf
    ld   b, b

label_E9599::
    ld   a, a
    pop  bc
    rst  $38
    ccf
    rst  $38

label_E959E::
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
    ld   l, b
    jr   nz, label_E9599
    jr   nz, label_E959E
    ld   a, b
    rst  0
    rst  $38
    db   $10 ; Undefined instruction
    ld    hl, sp+$FF
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
    ld   a, b
    nop
    add  a, a
    ld   b, b
    ret  nz
    ld   [rJOYP], a
    ld    hl, sp+$00
    rst  $38
    sbc  a, a
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
    inc  bc
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    ld   [hl], c
    nop
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
    nop
    nop
    pop  bc
    nop
    and  c
    ret  nz
    ld   e, a
    ld   h, c
    ld   [hl], b
    ld    hl, sp+$F8
    cp   $FF
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
    add  a, c
    nop
    ld   h, d
    nop
    inc  e
    nop
    nop
    jp   label_E701
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   sp, label_E80
    ret  nz
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sub  a, c
    nop
    ld   c, $00
    nop
    pop  af
    ld   a, [$FFFF]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_E9894
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

label_E982A::
    rst  $30
    jr   label_E982A

label_E982D::
    jr   nc, label_E982D
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
    jr   c, label_E9840
    rst  $38
    ld   e, a
    rst  $30
    ccf
    jp  c, label_E82BF
    ld   a, [$FF0F]
    ld   [$FF1F], a
    db   $F4 ; Undefined instruction
    dec  bc
    ld   d, b
    cpl
    rst  $38
    rst  $38
    nop
    rst  $38
    ccf
    ret  nz
    cp   a
    ld   b, b
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $38
    nop
    ei
    inc  b
    rst  $38
    rst  $38
    ld   hl, label_3EFF
    reti
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   sp, hl
    ld   b, $7F
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
    rst  $38
    ret  nz
    ccf
    jr   nc, label_E9894
    ld   [label_407], sp
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $00FF
    rst  $38
    nop

label_E9894::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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

label_E98ED::
    add  a, b
    add  a, b
    add  a, b

label_E98F0::
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

label_E9901::
    ld   bc, label_607
    rrca
    inc  c
    ld   e, $18
    ccf
    jr   nz, label_E9984
    ld   b, d
    ld   l, e
    ld   d, b
    cp   a
    ret  nz
    rst  0
    jr   label_E9901
    ld   bc, label_59B
    cp   a
    ld   [bc], a
    ld   l, [hl]
    ld   e, $EA
    jr   label_E98F0
    jr   nz, label_E9926
    ld   [$FFD3], a
    ld   h, b
    or   a
    ret  nz
    rst  $18
    add  a, c

label_E9926::
    sbc  a, a
    inc  bc
    ld   a, a
    ld   b, $FF
    inc  b
    cp   $18
    db   $FC ; Undefined instruction
    jr   label_E992D
    ld   a, b

label_E9932::
    ld    hl, sp+$A0
    db   $F2 ; Undefined instruction
    ret  nz
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
    rst  $18
    jr   nz, label_E9932
    jr   nz, label_E98ED
    ld   h, a
    nop
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    sub  a, $29
    ld   bc, $FFFE
    cp   $FF
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
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    ld   a, [$FF10]
    ld   a, [$FF10]
    rst  $38
    rrca
    ld   a, [$FF70]

label_E9984::
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
    jr   label_E999C
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
    jr   c, label_E99C2
    inc  b
    inc  bc
    inc  bc
    ld   bc, $E001
    jr   nz, label_E9983
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
    jr   nz, label_E99F4
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

label_E99F4::
    nop
    nop
    nop
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
    jr   nc, label_E9A1C
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
    jr   nc, label_E9A36
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   l
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $28
    db   $10 ; Undefined instruction
    ldi  [hl], a
    or   $1F
    pop  af
    rst  $18
    cp   b
    cpl
    cp   e
    xor  a
    cp   e
    xor  [hl]
    cp   a
    adc  a, h
    sbc  a, a
    ld   l, b
    rst  $38
    inc  bc
    nop
    nop
    nop
    ld   bc, label_704
    dec  bc
    inc  c
    rra
    db   $10 ; Undefined instruction
    jr   nz, label_E9B0B
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
    ld   hl, label_3EFF
    reti
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    ld   [label_29D6], sp
    ld   bc, label_3CFE
    nop
    jp   label_1800
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    call z, label_EB87F
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
    ld   c, $C1
    ld   a, $8D
    ld   [hl], d
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
    cp   l
    ld   b, d
    sbc  a, b
    ld   h, a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    rst  $38
    nop
    sub  a, l
    ld   l, d
    ld   d, d

label_E9B63::
    xor  l
    rra
    rst  $38
    rst  $38
    ld   [rIE], a
    nop
    ei
    inc  b
    rst  $38
    nop
    ld   sp, hl
    ld   b, $01
    ld   bc, label_203
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
    jp   [hl]
    rla
    rst  $20
    ld   e, $DF
    inc  l
    ld   c, l
    cp   b
    ld   b, $FF
    jr   nc, label_E9B63
    ld   a, d
    push bc
    ld   a, [$FF0F]
    ld   a, [$FF0F]
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
    nop
    rst  $38
    ld   d, h
    rst  $38
    rst  $38
    rst  $38
    db   $E7
    rst  $20
    rst  $18
    jr   nz, label_E9BB4
    nop
    rst  $38
    nop
    rst  $38
    nop
    ei
    inc  b
    dec  de
    db   $E4 ; Undefined instruction
    ld   d, c
    xor  [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    call z, label_EBC67
    ld   [hl], a
    ld   a, b
    ccf
    ret  c
    cp   $E0
    rst  $38
    ret  nz
    db   $FD ; Undefined instruction
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

label_E9C27::
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
    jr   nz, label_E9C27
    ld   l, h
    sub  a, e
    ret  nc
    cpl
    ld   [$FF1F], a
    ret  nc
    ld   a, a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    jr   nz, label_E9C58
    nop
    db   $EB ; Undefined instruction
    inc  d
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
    rst  $30
    ld   [label_AF5], sp
    push af
    ld   a, [bc]
    or   h
    ld   c, e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_E9C76::
    rst  $38
    nop
    rst  $30
    ld   [$A956], sp
    ld   e, [hl]
    and  c
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
    ld   [$0015], a
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
    rst  $18
    jr   nz, label_E9C76
    ld   h, $3F
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
    ld   a, d
    add  a, l
    ld   e, d
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
    db   $FD ; Undefined instruction
    ld   [bc], a
    push de
    ld   a, [hli]
    rst  $10
    jr   z, label_E9CBE
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
    inc  bc
    inc  bc
    inc  c
    inc  c
    jr   c, label_E9D0E
    cp   $C6
    rst  0
    ld   bc, $008F
    ccf
    ld   [bc], a
    rst  $38
    rlca
    ret  nz
    ret  nz
    ld   a, $3E
    ld   de, label_81F
    rrca
    inc  b
    rlca
    add  a, h
    add  a, a
    jp   label_EF43
    inc  l
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   h, b
    ld   [rNR10], a
    ld   a, [$FF08]
    ld    hl, sp+$C4
    db   $FC ; Undefined instruction
    call nz, label_EF7C
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

label_E9D0E::
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
    cp   e
    ld   b, h
    ld   a, d
    add  a, l
    ld   a, b
    add  a, a
    db   $E4 ; Undefined instruction
    dec  de
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  8
    jr   nc, label_E9D5A
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    rst  $38
    cp   $FD
    nop
    rst  $38
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    stop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  8
    jr   nc, label_E9D7A
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    rst  $38
    cp   $FD
    nop
    rst  $38
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_E9D8E::
    rst  $28
    stop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  8
    jr   nc, label_E9D9A
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    rst  $38
    cp   $FD
    nop
    rst  $38
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    db   $10 ; Undefined instruction
    ld   h, b
    xor  a
    or   b
    and  a
    cp   b
    ld   h, a
    ld    hl, sp+$C7
    jr   c, label_E9DBA
    nop
    rst  $18
    jr   nz, label_E9D8E
    jr   nc, label_E9DC1

label_E9DC1::
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  a
    ei
    ld   c, d
    ei
    jp   z, label_C8F9
    ei
    adc  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    db   $F2 ; Undefined instruction
    pop  bc
    db   $F2 ; Undefined instruction
    add  a, c
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
    db   $F2 ; Undefined instruction
    ld   a, h
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

label_E9E3A::
    ccf
    rst  $18
    ld   [hl], d
    ld   l, l
    jp   label_A4FC
    ld   e, e
    push hl
    ld   a, [de]
    sub  a, b
    ld   l, a
    ld   [hl], $FF
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    sub  a, d
    ld   l, l
    cp   a
    ld   b, b
    xor  a
    ld   d, b
    ld   b, b
    cp   a
    rst  $38
    rst  $38
    and  b
    ld   e, a
    daa
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    call label_B132
    ld   c, [hl]
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    xor  a
    ld   d, b
    ld   b, b
    cp   a
    rst  $38
    rst  $38
    and  b
    ld   e, a
    daa
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    call label_B132
    ld   c, [hl]
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    xor  a
    ld   d, b
    ld   b, b
    cp   a
    rst  $38
    rst  $38
    and  b
    ld   e, a
    daa
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    call label_B132
    ld   c, [hl]
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  0
    jr   c, label_E9E3A
    ld   a, b
    ld   bc, $81FE
    rst  $38
    ld   sp, $BFCE
    ld   b, b
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E9EE4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E9F02::
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
    ldh  [$FF0C], a
    rst  $38
    ret  nz
    rst  $18
    rrca
    sbc  a, e
    dec  bc
    dec  sp

label_E9F17::
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
    ldh  [$FF0C], a
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $28
    db   $10 ; Undefined instruction
    ld   d, h
    rst  $20
    jr   label_E9F02
    jr   nc, label_E9EE4
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
    ld   sp, hl
    ld   b, $F0
    rrca
    call nc, label_EB82B
    add  a, a
    db   $E8 ; add  sp, d
    rla
    db   $F4 ; Undefined instruction
    dec  bc
    jr   c, label_E9F17
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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

label_EA007::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  e
    ei
    jr   nc, label_EA007
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ret  nz
    ccf
    nop
    rst  $38
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ret  nz
    ccf
    add  a, b
    ld   a, a

label_EA048::
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
    db   $10 ; Undefined instruction
    jr   label_EA048
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
    rst  $38
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
    cp   $01
    ld   sp, hl
    rlca
    pop  bc
    ccf
    rst  $38
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
    ld   a, [$FFFF]
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
    nop
    rst  $38
    ret  nz
    ccf
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

label_EA10A::
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

label_EA17C::
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
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    jr   nz, label_EA17C
    ld   a, $E0
    rra
    ld    hl, sp+$07
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
    nop

label_EA1E2::
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

label_EA2E2::
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
    ld    hl, sp+$5F
    or   b
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   c, label_EA2E2
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
    nop
    rst  $38
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
    ld   a, [$FF0F]
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
    rst  $30
    rst  $38
    and  a
    rst  $38
    daa
    rst  $38
    ld   h, e
    rst  $18
    ld   h, c
    rst  $18
    ld   [hl], b
    rst  8
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
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    jp   label_E0FF
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
    cp   $FF
    ld    hl, sp+$0E
    ld   a, [$FFFF]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    ld   a, b
    rst  $38
    ret  nz
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    add  a, b
    rst  $38
    rlca
    ld    hl, sp+$FF
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    ld   de, label_39EF
    rst  0
    ld   a, a
    add  a, d
    rst  $38
    inc  b
    rst  $38
    jr   label_EA54A
    ld   [rIE], a
    nop
    rst  $38
    nop
    ld   a, b
    rst  0
    rst  $38
    ld   b, b
    ei
    ld   b, b
    ld    hl, sp+$60
    cp   $20
    rst  $38
    jr   label_EA55C
    ld   b, $DF
    ld   bc, $FF1F
    nop
    rst  $38
    rst  $38
    nop
    ccf
    nop
    nop
    nop
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    ld    hl, sp+$00
    nop
    nop
    rrca
    ld   bc, label_7FF
    rst  $38
    db   $FC ; Undefined instruction
    nop
    rst  $38
    rst  $38
    nop
    ld   [rJOYP], a
    rra
    nop
    rst  $38
    ccf
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
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
    rlca
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    rrca
    nop
    pop  bc
    nop
    ld   a, [$FFC0]
    cp   $38
    rst  $38
    ld   c, $FF
    inc  bc
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    ld   a, a
    ld   a, [$FF0F]
    ld   a, a
    nop
    ccf
    nop
    add  a, a
    nop
    ld   [rJOYP], a
    ld   sp, hl
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    cp   $01
    rst  $38
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
    ld   h, a
    rst  $18
    ld   h, b
    rst  $18
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
    cp   $F8
    rst  0
    rst  $28
    ret  nz
    rst  $30

label_EA605::
    ld   [$FFF8], a
    jr   nc, label_EA605
    jr   label_EA60A
    rlca
    rst  $38
    nop
    rst  $38
    nop
    dec  c
    pop  af
    di
    ld   bc, label_3E7
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
    rst  $38
    nop
    cp   $00
    add  a, b
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
    inc  bc
    nop
    ld   b, $01
    inc  e
    inc  bc
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
    ld   a, b
    rst  0
    db   $FC ; Undefined instruction
    jp   label_C0EF
    rst  $20
    ld   h, b
    pop  af
    ld   h, b
    ld    hl, sp+$60
    db   $FC ; Undefined instruction
    jr   nc, label_EA6DE
    inc  e
    ld   bc, label_1FF
    rst  $38
    add  a, c
    ld   a, a
    pop  hl
    rra
    ld   sp, hl
    rlca
    dec  de
    rlca
    ld   a, $07
    call z, label_F03F
    rst  $38
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
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
    rst  $38
    nop
    rrca
    ld   a, [$FF01]
    cp   $FF
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
    nop
    nop
    nop
    nop
    ccf
    ccf
    ld   a, a
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
    ld   a, a
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
    inc  bc
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    nop
    rrca
    nop
    ld   bc, $0000
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
    sbc  a, [hl]
    ld   a, a
    rst  0
    ccf
    db   $E3 ; Undefined instruction
    rra
    di
    rrca
    rst  $38
    ld   bc, $00FF
    rst  $38
    ld   bc, label_3FE
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
    rst  $38
    nop
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
    or   b
    rst  8
    sbc  a, h
    db   $E3 ; Undefined instruction
    rst  8
    ld   a, [$FFC3]
    db   $FC ; Undefined instruction
    ld   [rIE], a
    ld   a, [$FFFF]
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
    ld   a, [$FF0F]
    rst  $38
    nop
    rra
    ld   [$FF03], a
    db   $FC ; Undefined instruction
    nop
    rst  $38
    rst  $28
    ld   a, [$FFCF]
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
    rst  $28
    db   $10 ; Undefined instruction
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
    ccf
    rst  $38
    rrca
    rst  $38
    add  a, a
    ld   a, [hl]
    adc  a, [hl]

label_EA8B7::
    ld   a, h
    call z, label_FD38
    ld    hl, sp+$F9
    jr   nc, label_EA8B7
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $20
    rra
    db   $FC ; Undefined instruction
    inc  bc
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
    ld   bc, label_FFF
    rst  $38
    sbc  a, a
    ld   a, a
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
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    ld   [bc], a
    ld   a, a
    ld   bc, $007F
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
    jr   nz, label_EA997

label_EA997::
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
    ld    hl, sp+$10
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   label_EAA36
    ld   [label_C7F], sp
    ld   a, a
    rlca
    ld   a, a
    ld   bc, $003F
    rst  $38
    nop
    dec  a
    nop
    inc  bc
    nop
    rlca
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    sbc  a, h
    ld   a, a
    cp   b
    ld   a, a
    ld   a, [$FF7F]
    ld   [rIE], a
    rst  0
    ld    hl, sp+$BF
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    ld   b, $FF
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    ret  nz
    ccf
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
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
    nop
    nop
    nop
    nop
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
    ld   bc, label_EA1E2
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
    nop
    nop
    nop
    nop
    jr   label_EAA35

label_EAA35::
    inc  a

label_EAA36::
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
    nop
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
    nop
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
    ld   [$FF60], a
    and  b
    jr   nz, label_EAAC0
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

label_EAADA::
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

label_EAAFF::
    nop
    dec  c
    ldd  [hl], a
    dec  a
    ret  nz
    rlca
    jr   c, label_EAB0E
    ld   [$000D], sp
    ld   [bc], a
    nop
    nop
    nop

label_EAB0E::
    nop
    nop
    jr   nz, label_EAADA
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
    jr   c, label_EAB7C
    nop
    jr   c, label_EAB39

label_EAB39::
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
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rlca
    ccf
    jr   c, label_EABD4
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
    ld   a, [bc]
    inc  c
    nop
    rrca
    inc  d
    dec  de
    jr   label_EAB8E
    rra
    db   $10 ; Undefined instruction
    jr   label_EAB9C
    db   $10 ; Undefined instruction
    rrca

label_EAB80::
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

label_EAB8E::
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

label_EAB9C::
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
    jr   nz, label_EABAC
    jr   nz, label_EAB80
    rst  $38
    ld   h, b
    jr   nz, label_EABE3
    ld   a, [$FF30]

label_EABB5::
    ret  nc
    db   $10 ; Undefined instruction
    ld    hl, sp+$08
    db   $E8 ; add  sp, d
    jr   label_EABB5
    ld   [$F0F0], sp
    rst  $38
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ei
    nop
    pop  af
    nop
    ld   bc, $0000
    nop
    nop
    nop

label_EABD4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EABE3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
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
    ld   bc, label_718
    jr   nz, label_EAC35
    ld   b, e
    inc  a
    ld   b, a
    dec  sp
    add  a, a
    ld   a, e
    add  a, e
    ld   a, l
    sub  a, e
    ld   l, l
    nop
    nop
    nop
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
    rst  $38
    ld   c, $3F
    rst  $18
    ld   a, a
    cp   [hl]
    ld   a, [hl]

label_EAC35::
    cp   c
    ld    hl, sp+$77
    ld   a, [$FF2F]
    pop  af
    adc  a, $F3
    dec  l
    rst  $30
    rlc  b
    nop
    nop
    nop
    nop

label_EAC45::
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
    sbc  a, b
    ld   h, b
    rlca
    ld    hl, sp+$01
    cp   $81
    ld   a, [hl]
    jp   nz, label_FC3C
    ret  nz

label_EAC5E::
    ld   a, [$FFA0]
    ei
    inc  b
    rlca
    ld   bc, label_307
    inc  bc
    nop
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    rlca
    ld   [bc], a
    dec  bc
    dec  b
    add  hl, bc
    ld   b, $04
    inc  bc
    rlca
    nop
    rst  $30
    db   $EB ; Undefined instruction
    rst  $30
    ld   l, e
    or   $0B
    or   a
    ld   c, e
    rla
    db   $EB ; Undefined instruction
    ccf
    jp   label_38C7
    nop
    rst  $38
    sbc  a, b
    ld   h, a
    ld   a, [$FF0F]
    sbc  a, a
    ld   h, b
    nop
    rst  $38
    rst  $38
    nop
    ret  nz
    nop
    jr   nz, label_EAC5E
    ld   [rJOYP], a
    ld   a, [$FFA0]
    db   $FC ; Undefined instruction
    and  b
    ld   a, h
    ld    hl, sp+$F8
    ld   [$FFF0], a
    ld   [$FFE0], a
    add  a, b
    ret  c
    nop
    ld   a, h
    sbc  a, b
    inc  a
    ret  c
    ld   a, b
    ret  nz
    and  b
    ld   b, b
    ld   a, [hl]
    add  a, b
    db   $F2 ; Undefined instruction
    ld   l, h
    db   $E4 ; Undefined instruction
    jr   label_EAC45
    ld   [hl], b
    ld   a, [$FF00]
    ld   bc, label_700
    ld   bc, label_70F
    rrca
    inc  b
    inc  e
    dec  bc
    jr   label_EACD3
    ld   a, b
    rlca
    ld   [hl], b
    cpl
    ld   [hl], a
    jr   z, label_EAD52

label_EACD3::
    inc  hl
    ld   [hl], a
    dec  hl
    ld   [hl], a
    dec  hl
    inc  [hl]
    dec  bc
    rla
    dec  bc
    rla
    dec  bc
    rla
    add  hl, bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rlca
    rlca
    ld   sp, hl
    ld   bc, label_4FE
    ei
    inc  e
    db   $E3 ; Undefined instruction
    cp   $1D
    rst  $38
    cp   $FF
    halt
    halt
    halt
    cp   $FF
    cp   $FF
    ld   b, $FF
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    nop
    ld   a, [$FF00]
    ld   [hl], b
    and  b
    ld   [hl], b
    and  b
    ld   [hl], b
    and  b
    ld   [hl], b
    and  b
    ld   [hl], b
    and  b
    ld   h, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   l, a
    db   $10 ; Undefined instruction
    rra
    ld   c, b
    scf
    ld   l, b
    rla
    rst  $38
    ld   h, c
    ld   a, [$FF6F]
    ld   a, a
    nop
    ld   e, $0C
    ld   a, $00
    ld   b, d
    inc  a
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
    ld   bc, label_700
    ld   bc, label_70F
    rra
    inc  c
    inc  e
    dec  bc
    ld    hl, sp+$17
    ld    hl, sp+$57
    ld   a, [$FF4F]
    ld   a, [$FF4F]

label_EAD52::
    ld   a, [$FF4F]
    ld   a, [$FF4F]
    ld   [hl], h
    dec  hl
    ld   [hl], h
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  d
    ld   a, [de]
    dec  b
    ld   d, $09
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    ld   a, [$FFFE]
    db   $FC ; Undefined instruction
    rst  $38
    ld   b, $07
    ld   a, [$FD03]
    inc  bc
    db   $FD ; Undefined instruction
    ld   bc, label_1FE
    cp   $01
    cp   $01
    cp   $05
    ld   a, [$FA05]
    dec  bc
    push af
    dec  bc
    db   $F4 ; Undefined instruction
    rrca
    db   $F2 ; Undefined instruction
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
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
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
    inc  l
    inc  de
    inc  h
    dec  de
    ld   b, e
    inc  a
    ld   d, b
    cpl
    ld   e, h
    inc  hl
    ld   [hl], e
    inc  c
    ld   [hl], b
    cpl
    ccf
    nop
    ld   e, $0C
    ld   a, $00
    ld   b, d
    inc  a
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
    ld   bc, label_E00
    ld   bc, label_F10
    jr   nz, label_EADF3
    inc  hl
    inc  e
    ld   b, a
    dec  sp
    ld   b, a
    dec  sp
    ld   b, e
    dec  a
    ld   c, e
    dec  [hl]
    ld   c, e
    inc  [hl]
    nop
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
    rst  $38
    ld   c, $3F
    rst  $18
    ld   a, a
    cp   [hl]
    ld   a, [hl]

label_EADF3::
    cp   c
    ld    hl, sp+$77
    ld   a, [$FF2F]
    pop  af
    adc  a, $F3
    dec  l
    rst  $30
    set  6, a
    db   $EB ; Undefined instruction
    nop
    nop
    nop
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
    sbc  a, b
    ld   h, b
    inc  b
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    add  a, c
    ld   a, [hl]
    pop  bc
    ld   a, $F9
    add  a, $F6
    and  b
    ld   a, [$FFA0]
    ld   a, a
    ld   bc, label_307
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $30
    ld   l, e
    or   $0B
    or   a
    ld   c, e
    rla
    db   $EB ; Undefined instruction
    ccf
    jp   label_18E7
    ld   d, d
    dec  l
    ld   d, d
    dec  l
    ld   e, [hl]
    ld   hl, label_E8CBF
    sbc  a, [hl]
    ld   l, l
    rst  $38
    nop
    inc  a
    jr   label_EAE9A
    nop
    jr   nz, label_EAE7D
    ccf
    nop
    db   $FC ; Undefined instruction
    and  b
    ld   a, h
    ld    hl, sp+$F8
    ld   [$FFF0], a
    ld   [$FFE0], a
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    ret  nz
    nop
    nop
    nop
    nop
    nop
    add  a, b

label_EAE7D::
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
    ld   bc, label_600
    ld   bc, label_718
    jr   nz, label_EAEB5
    ld   b, e
    inc  a
    ld   b, a
    dec  sp

label_EAE9A::
    add  a, a
    ld   a, e
    add  a, e
    ld   a, l
    sub  a, e
    ld   l, l
    nop
    nop
    nop
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
    rst  $38
    ld   c, $3F
    rst  $18
    ld   a, a
    cp   [hl]
    ld   a, [hl]

label_EAEB5::
    cp   c
    ld    hl, sp+$77
    ld   a, [$FF2F]
    pop  af
    adc  a, $F3
    dec  l
    rst  $30
    rlc  b
    nop
    nop
    nop
    nop

label_EAEC5::
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
    sbc  a, b
    ld   h, b
    rlca
    ld    hl, sp+$01
    cp   $81
    ld   a, [hl]
    jp   nz, label_FC3C
    ret  nz
    ld   a, [$FFA0]
    ei
    inc  b
    rlca
    ld   bc, label_307
    inc  bc
    nop
    ld   bc, $0100
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   bc, label_207
    dec  bc
    dec  b
    add  hl, bc
    ld   b, $04
    inc  bc
    inc  bc
    nop
    rst  $30
    db   $EB ; Undefined instruction
    rst  $30
    ld   l, e
    or   $0B
    or   a
    ld   c, e
    rla
    db   $EB ; Undefined instruction
    ccf
    jp   label_38C7
    nop
    rst  $38
    add  a, h
    ld   a, e
    jp   label_3F3C
    ret  nz
    nop
    rst  $38
    rst  $38
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ret  nz
    nop
    ld   a, [$FFA0]
    db   $FC ; Undefined instruction
    and  b
    ld   a, h
    ld    hl, sp+$F8
    ld   [$FFF0], a
    ld   [$FFE0], a
    add  a, b
    ld   a, [$FF00]
    ld   a, b
    or   b
    ld   a, b
    or   b
    ld   a, [$FF00]
    jr   nz, label_EAEF6
    ld   a, [hl]
    add  a, b
    db   $F2 ; Undefined instruction
    ld   l, h
    db   $E4 ; Undefined instruction
    jr   label_EAEC5
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
    ld   bc, label_600
    ld   bc, label_708
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_EAF77
    ld   hl, label_2F1E
    ld   de, label_61F
    rrca
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
    nop
    rst  $38
    inc  a
    ccf
    adc  a, $0F
    di
    inc  bc
    db   $FD ; Undefined instruction
    inc  de
    db   $ED ; Undefined instruction
    ld   a, c

label_EAF77::
    sub  a, [hl]
    db   $FD ; Undefined instruction
    ld   a, d
    cp   $CD
    cp   $ED
    cp   $ED
    nop
    nop
    nop
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
    jr   nz, label_EAF50
    sub  a, b

label_EAF91::
    ld   h, b
    db   $E8 ; add  sp, d

label_EAF93::
    sub  a, b
    db   $F4 ; Undefined instruction
    xor  b
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $F4 ; Undefined instruction
    jr   z, label_EAF91
    jr   z, label_EAF93
    ld   l, b
    rrca
    ld   b, $09
    rlca
    rrca
    rlca
    ld   h, a
    ld   [bc], a
    rst  $38
    ld   h, c
    pop  af
    ld   l, [hl]
    ld   h, d
    dec  e

label_EAFAE::
    ld   e, $01

label_EAFB0::
    ld   [bc], a
    ld   bc, $0003
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    ld   bc, label_200
    ld   bc, $0003
    cp   $ED
    db   $F2 ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $ED
    cp   $1D
    ei
    db   $FC ; Undefined instruction
    cp   $01
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    rlca
    ei
    rst  $38
    jp   label_FC03
    rst  $38
    nop
    cp   $6C
    rst  $38
    nop
    ld   b, c
    cp   [hl]
    rst  $38
    nop
    db   $E4 ; Undefined instruction
    ld   e, b
    call c, label_A020
    ld   b, b
    and  b
    ld   b, b
    and  b
    ld   b, b
    ret  nz
    nop
    jr   nz, label_EAFAE
    jr   nz, label_EAFB0
    and  b
    ld   b, b
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
    ld   bc, label_700
    ld   bc, label_70F
    rra
    rrca
    rra
    ld   c, $1F
    nop
    inc  bc
    ld   bc, $010F
    rrca
    rlca
    rlca
    ld   bc, $0103
    pop  hl
    nop
    ld    hl, sp+$60
    nop
    nop
    jr   nc, label_EB024

label_EB024::
    ld   a, a
    jr   nc, label_EB023
    ld   a, e
    cp   $9D
    rst  $38
    xor  $FF
    or   $FF
    dec  d
    rst  $38
    db   $DB
    rst  $38
    ld   l, e
    rst  $38
    ld   l, e
    rst  $38
    ld   l, d
    sbc  a, a
    db   $E8 ; add  sp, d
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    ld   h, c
    di
    inc  c
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [hl], b
    add  a, b
    ld   [label_8F0], sp
    ld   a, [$FF84]
    ld   a, b
    call nz, label_C4B8
    cp   b
    call nc, label_F428
    ld   c, b
    db   $FC ; Undefined instruction
    ld   b, b
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   a, [hl]
    jr   c, label_EB0A2
    ld   c, $0F
    inc  bc
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
    ld   c, l
    ldd  [hl], a
    sub  a, c
    ld   l, [hl]
    pop  hl
    ld   e, $F2
    inc  l
    cp   $30
    ld   a, d
    inc  b
    add  a, d
    ld   a, h
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

label_EB0A2::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca

label_EB0DC::
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
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    rst  $38
    ld   h, b
    ld    hl, sp+$F7
    db   $FC ; Undefined instruction
    dec  sp
    cp   $DD
    rst  $38
    db   $EC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nc, label_EB0DC
    ld   [label_4F0], sp
    ld    hl, sp+$1F
    ld   b, $07
    ld   bc, label_207
    rra
    ld   [bc], a
    rra
    ld   c, $0F
    inc  bc
    rst  0
    inc  bc
    di
    ret  nz
    db   $FD ; Undefined instruction
    ld   [hl], b
    ld   a, a
    jr   label_EB154
    inc  bc
    rrca
    inc  bc
    rlca
    nop
    ld   [label_607], sp
    ld   bc, $0001
    rst  $38
    dec  hl
    rst  $38
    or   a
    rst  $38
    sub  a, $FF
    sub  a, $FF
    call nc, label_D03F
    rst  $38
    sub  a, $FF
    ret  nz
    db   $EB ; Undefined instruction
    inc  d
    pop  de
    ld   l, $C3
    cp   h
    call label_F3B3
    ld   c, $DE
    pop  hl
    jr   z, label_EB125
    rst  8
    nop
    add  a, d
    ld   a, h
    add  a, d
    ld   a, h
    sub  a, d
    ld   l, h
    sbc  a, $A0
    ld   [$FF80], a
    ret  nz
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
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    rra
    ld   b, $07
    ld   bc, label_207
    rra
    ld   [bc], a
    rra
    ld   c, $0F
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    ld   bc, label_200
    ld   bc, $000F
    rra
    rrca
    rrca
    nop
    ld   [label_607], sp
    ld   bc, $0001
    rst  $38
    dec  hl
    rst  $38
    or   a
    rst  $38
    sub  a, $FF
    sub  a, $FF
    call nc, label_D03F
    rst  $38
    sub  a, $FF
    ret  nz
    db   $EB ; Undefined instruction
    inc  d
    sub  a, [hl]
    ld   l, c
    rst  $38
    ld   b, $FF
    or   $FE
    ld   bc, label_27F8
    add  hl, hl
    add  a, $C6
    nop
    add  a, d
    ld   a, h
    add  a, d
    ld   a, h
    sub  a, d
    ld   l, h
    sbc  a, $A0
    ld   [$FF80], a
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EB1F1::
    nop
    nop
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
    rlca
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
    rra
    nop
    ld   a, a
    rra
    ld   a, a
    jr   nc, label_EB218
    ld   l, a
    rst  $38
    ld   e, a
    rst  $38
    ccf
    rst  $38
    cp   h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [$FFC0]
    ld   a, [$FF60]
    ld    hl, sp+$B0
    ld    hl, sp+$D0
    ei
    jr   nz, label_EB23E
    xor  d
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
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
    rst  $38
    add  a, e
    rst  $38
    or   a
    rst  $38
    or   a
    rst  $38
    or   a
    rst  8
    cp   a
    rst  $38
    or   b
    cp   a
    rra
    ld   e, a
    jr   nz, label_EB1F1
    ld   a, a
    sub  a, b
    ld   l, a
    rst  $38
    jp   nz, label_DFE0
    rst  $38
    jr   c, label_EB2F8
    nop
    add  a, l
    ld   a, b
    db   $FD ; Undefined instruction
    nop
    rst  $38
    jp   z, label_EAAFF
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    sbc  a, [hl]
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ld   l, b
    db   $E8 ; add  sp, d
    ret  nz
    ret  c
    jr   nz, label_EB2AF
    db   $E8 ; add  sp, d
    ld   e, a
    xor  b
    rst  $38
    dec  de
    rra
    pop  hl
    pop  af
    ld   [$FFF0], a
    nop
    ld   [$F8F0], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EB2AF::
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   a, [hl]
    inc  e
    rra
    ld   b, $07
    nop
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rrca
    ld   [bc], a
    ld   l, a
    inc  b
    ld   a, a
    inc  h
    ccf
    inc  e
    ccf
    ld   [bc], a
    ccf
    ld   a, [de]
    ld   e, $05
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
    ld   bc, label_20F
    rrca
    ld   [bc], a
    rrca
    ld   [bc], a
    rrca
    ld   bc, $000F
    rrca
    nop
    dec  c
    ld   [bc], a
    inc  c
    inc  bc
    rrca
    nop
    ccf
    nop
    ld   a, a
    ld   bc, label_1FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   h, b
    rst  $38
    ld   h, b
    rst  $38
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_EB31F::
    nop
    ld   b, $01
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $18
    ld   [$FFED], a
    cp   $FE
    ld   l, a
    or   [hl]
    ld   l, a
    rst  $38
    ld   [bc], a
    ld   a, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_207
    rlca
    ld   [bc], a
    rrca
    ld   [bc], a
    rrca
    inc  bc
    rrca
    ld   bc, $000F
    rrca
    nop
    rrca
    nop
    ld   c, $01
    rrca
    ld   bc, $0007
    rra
    nop
    ld   a, a
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    add  a, b
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
    cp   $0F
    cp   $0F
    rst  8
    ld   a, [hl]
    rst  $30
    adc  a, $FB
    add  a, $0D
    ld   [bc], a
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0102
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
    ld   a, a
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rra
    ld   [$FFC3], a
    inc  a
    ld   sp, label_F0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    cp   a
    ld   b, b
    rst  $18
    ld   h, b
    rst  $28
    ld   [hl], b
    rst  $30
    ld   a, b
    ei
    ld   [hl], a
    rst  $28
    ld   [hl], a
    ccf
    nop
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    jr   label_EB412
    jr   label_EB414
    jr   label_EB416
    rrca
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    cp   $80
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
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
    ld   a, h
    daa
    ccf
    inc  b

label_EB444::
    ccf
    nop

label_EB446::
    rra
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $F4 ; Undefined instruction
    dec  sp
    rst  $28
    jr   nc, label_EB444
    jr   nz, label_EB466
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
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
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
    nop
    nop
    nop
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
    nop
    ccf
    nop
    ccf
    nop
    ld   c, a
    jr   nc, label_EB446
    ld   a, b
    cp   a
    halt
    ld   [hl], a
    rst  $38
    ld   b, a
    ld   c, a
    rlca
    rlca
    nop
    ld   l, a
    nop
    ld   [hl], a
    jr   z, label_EB4BE
    jr   nc, label_EB540
    nop
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    rlca
    rst  $38
    add  a, e
    rst  $38
    ret  nz

label_EB4D8::
    rst  $38
    jr   nc, label_EB4DA
    jr   c, label_EB4D8
    inc  a
    ld   sp, hl
    ld   b, $80
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction

label_EB4E7::
    nop
    db   $FC ; Undefined instruction
    add  a, b
    cp   $C0
    cp   $60
    cp   $60
    rst  $38
    ld   h, b
    rst  $38
    ret  nz
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
    ldd  [hl], a
    sub  a, $3F
    ld   h, a
    rra
    ld   a, a
    inc  bc
    ccf
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
    cp   $01
    reti
    ld   h, $83
    ld   a, h
    rrca
    ld   a, [$FFFF]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EB540::
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
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
    nop
    nop
    nop
    nop
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
    nop
    rrca
    nop
    rra
    nop
    ccf
    ld   c, $3F
    ld   c, $7F
    inc  sp
    ld   a, a
    inc  sp
    rst  $38
    inc  sp
    rst  $38
    inc  sp
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
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
    nop
    rst  $38
    nop
    call c, label_3C3F
    rst  $38
    ei
    rlca
    di
    rrca
    rst  $38
    rrca
    rst  $28
    rra
    rst  8
    scf
    rst  8
    inc  sp
    ld   l, a
    db   $10 ; Undefined instruction
    jr   label_EB5E4
    inc  c
    ld   sp, label_1C0E
    inc  bc
    inc  c
    inc  bc
    rlca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ccf
    db   $FC ; Undefined instruction
    rra
    db   $FC ; Undefined instruction
    rst  $38
    inc  e
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
    ld   a, a
    add  a, b
    ccf
    ret  nz
    jp   label_C33F
    ccf
    rst  $38
    nop
    ccf
    nop
    add  a, b
    nop
    add  a, b
    nop

label_EB5E4::
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld   [$FFC0], a
    ld    hl, sp+$E0
    ld   [$FFC0], a
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    rst  $38
    add  a, e
    rst  $38
    or   a
    rst  $38
    or   a
    rst  $38
    or   a
    rst  8
    cp   a
    rst  $38
    or   b
    cp   a
    rra
    rst  $18
    jr   nz, label_EB611

label_EB611::
    rst  $38
    ld   h, b
    sbc  a, a
    cp   a
    ld   [bc], a
    jr   nz, label_EB637
    ld   a, a
    jr   c, label_EB698
    nop
    add  a, l
    ld   a, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EB637::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EB698::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [bc], a
    ld   bc, label_33D
    ld   a, l
    dec  sp
    cp   l
    ld   a, a
    cp   a
    ld   a, a
    adc  a, a
    ld   a, a
    ld   l, a
    rra
    dec  d
    rrca
    ld   de, label_D0F
    inc  bc
    dec  b
    inc  bc
    dec  b
    ld   [bc], a
    ld   b, $00
    ld   b, $00
    inc  b
    nop
    ld   a, [$FF00]
    ret  c
    ld   [$FFE8], a
    ld   a, [$FFE8]
    ld   a, [$FFDE]
    ld   [$FF91], a
    xor  $FD
    cp   $FD
    cp   $9D
    cp   $B9
    cp   $82
    ld   a, h
    cp   $00
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
    ld   a, [hl]
    inc  a
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, [hl]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EB82B::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EB87F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  d
    ld   [hl], $36
    nop
    nop
    ld   [hl], $36
    inc  d
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld    hl, sp+$00
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
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rlca
    nop
    rlca
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    db   $FC ; Undefined instruction
    rst  $38
    add  a, e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    pop  bc
    ccf
    ei
    rrca
    cp   $CF
    ld   a, $FF
    nop
    rst  $38
    rrca
    ld   a, [$FFBF]
    ret  nz
    rst  $38
    ret  nz
    cp   a
    ret  nz
    ccf
    ld   [$FF1F], a
    ld    hl, sp+$07
    nop
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
    ei
    ccf
    rlca
    inc  e
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$F8
    rst  $38
    rlca
    rst  $38
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, d
    add  a, c
    and  l
    ld   b, d
    jp   label_FF3C
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
    cp   $FE
    jp   label_8001
    nop
    add  a, b

label_EBA0B::
    nop
    pop  bc
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
    ret  nz
    ret  nz
    or   b
    ld   [hl], b
    ret  z
    jr   c, label_EBA0B
    inc  e
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   [rJOYP], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
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
    ld   [$FF1F], a
    nop
    rst  $38
    nop
    rst  $38
    ld   [hl], b
    adc  a, a
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
    ld   c, $F8
    rla
    ld    hl, sp+$27
    db   $FC ; Undefined instruction
    inc  hl
    inc  a
    db   $E3 ; Undefined instruction
    ld   a, [hl]

label_EBAAB::
    pop  bc
    ld   a, a
    ret  nz
    sbc  a, a
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    rlca
    ld    hl, sp+$00
    rst  $38
    add  a, b
    ld   a, a
    ld   c, $01
    rra
    nop
    ccf
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   [$FF1F], a
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   h, e
    jr   c, label_EBAAB
    jr   c, label_EBAA5
    inc  a
    rst  0
    inc  a
    rst  0
    ld   a, [hl]
    add  a, e
    cp   $03
    ld   sp, hl
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ei
    rlca
    ld   [bc], a
    cp   $06
    cp   $04
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    ld    hl, sp+$08
    rst  $38
    rst  $38
    nop
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rlca
    rlca
    dec  de
    inc  e
    cpl
    jr   nc, label_EBB86
    ld   h, b
    ld   a, a
    ld   b, b
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    ld   [$FFE0], a
    ld    hl, sp+$18
    call nz, label_8204
    ld   [bc], a
    add  a, d
    ld   [bc], a
    add  a, c
    inc  bc
    push bc
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    rlca
    rlca
    dec  de
    inc  e
    cpl
    jr   nc, label_EBBA6
    ld   h, b
    ld   a, a
    ld   b, b
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    ld   [$FFE0], a
    ld    hl, sp+$18
    call nz, label_8204
    ld   [bc], a
    add  a, d
    ld   [bc], a
    add  a, c
    inc  bc
    push bc
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rrca
    inc  c
    rra
    db   $10 ; Undefined instruction
    jr   nz, label_EBBEC
    ld   b, b
    rst  $38
    add  a, b
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
    rst  $38
    nop
    nop
    ld    hl, sp+$00

label_EBB86::
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   a, h
    ld   a, h
    ld   h, a
    ld   a, a
    ld   hl, label_303F
    ccf
    db   $10 ; Undefined instruction
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FF9F], a
    ld   [$FF8F], a
    ld   a, [$FF41]
    cp   $40
    rst  $38
    jr   nz, label_EBBAD
    jr   nz, label_EBBAF
    ld   [$FF1F], a
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$07
    ret  nz
    ccf
    nop
    rst  $38
    pop  af
    rrca
    ld   sp, hl
    rlca
    jp   [hl]
    rla
    pop  af
    rrca
    ldh  [$FF0C], a
    rra
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  e
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

label_EBBEC::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   d, b
    ld   a, [$FFB1]
    ld   a, [$FF61]
    ld   [$FFA3], a
    ld   [rSCX], a
    ret  nz
    rst  0
    ret  nz
    add  a, a
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
    cp   a
    ret  nz
    cp   a
    ret  nz
    sbc  a, a
    ld   [$FFDF], a
    ld   [$FFCF], a
    ld   a, [$FFE3]
    cp   h
    ld    hl, sp+$9F
    add  a, a
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    ld   sp, hl
    rlca
    ld   a, [$F207]
    rrca
    rst  0
    inc  a
    dec  de
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    ei
    cp   a
    ret  nz
    cp   a
    ret  nz
    sbc  a, a
    ld   [$FF5F], a
    ld   [rVBK], a
    ld   a, [$FFA3]
    ld   a, h
    jr   label_EBC4D
    rlca
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    ld   sp, hl
    rlca
    ei
    rlca
    di
    rrca
    push bc
    ccf
    ld   de, $E1FF
    rst  $38
    rlca
    rlca
    rra
    jr   label_EBCE4
    ld   h, b
    rst  $28

label_EBC67::
    ret  nc
    rst  0
    cp   b
    ld   [$FF1F], a
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    jr   label_EBCB1
    ld   [$8C0F], sp
    rrca
    add  a, h
    rlca
    add  a, $07
    jp   nz, label_E303
    inc  bc
    pop  hl
    ld   bc, rNR23
    ld   c, $FB
    ccf
    di
    cp   $C6
    ld   a, b
    ld   [label_818], sp
    inc  e
    inc  c
    rst  $38
    rst  $30
    nop

label_EBCB1::
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ccf
    rlca
    ld   [hl], b
    nop
    ld   a, b
    nop
    inc  a
    jr   c, label_EBCBE
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   [$FF0E], a
    nop
    ld   e, $00
    inc  a
    inc  e
    rst  $38
    rst  $38
    db   $10 ; Undefined instruction
    ld   h, b
    rst  $38
    ret  nz
    rst  $18
    ld   h, b
    ld   l, a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop

label_EBCE4::
    nop
    nop
    nop
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
    rst  $38
    rst  $38
    jp   label_BFF7
    xor  l
    add  a, e
    xor  l
    add  a, c
    xor  a
    add  a, c
    rst  $30
    add  a, c
    rst  $30
    add  a, c
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [$FF9F], a
    rst  $38
    rst  $38
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
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
    nop
    nop
    rst  $38
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
    nop
    nop
    rst  $38
    cp   $FF
    ld   [bc], a
    ld   bc, $0101
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, rIE
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    rrca
    ld   sp, hl
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
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    adc  a, a
    rst  $38
    ld   a, [$FF9F]
    rst  $38
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   sp, hl
    ld   bc, label_1F9
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    ld   sp, hl
    ld   a, a
    ld   a, a
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
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
    nop
    nop
    rst  $38
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
    nop
    nop
    rst  $38
    cp   $FE
    inc  bc
    ld   bc, $0101
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
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
    ld   a, [hl]
    ld   a, [hl]
    rst  $38
    jp   label_BFBD
    add  a, l
    xor  e
    add  a, l
    xor  c
    add  a, e
    xor  l
    di
    add  a, l
    di
    add  a, l
    ld   [$FF9F], a
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, [hl]
    add  a, c
    add  a, a
    sbc  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    ld   a, a
    rst  $38
    ret  nz
    cp   a
    ret  nz
    cp   a
    nop
    nop
    jp   nc, label_EF00
    nop
    sbc  a, a
    nop
    sbc  a, c
    nop
    ld   sp, hl
    nop
    rst  $38
    nop
    rst  $28
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    ld   a, $C1
    sbc  a, l
    ld   h, d
    sbc  a, l
    ld   h, d
    adc  a, c
    halt
    ld   [hl], $C9
    ld   [hl], $FD
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, $FFFE
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    rrca
    ld   sp, hl
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    reti
    add  hl, hl
    ld   sp, hl
    add  hl, bc
    ld    hl, sp+$08
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_EBE66::
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   a, [$FF9F]
    sbc  a, a
    sub  a, b
    sbc  a, e
    sub  a, h
    sbc  a, a
    sub  a, b
    sbc  a, a
    sub  a, b
    sbc  a, a
    sub  a, b
    sbc  a, a
    sub  a, b
    dec  de
    inc  d
    rlca
    ld   sp, hl
    ld   sp, hl
    ld   bc, label_1F9
    ld   sp, hl
    ld   bc, $8179
    pop  hl
    add  hl, de
    ld   sp, hl
    ld   bc, label_1F9
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    ld   a, a
    rst  $38
    ret  nz
    cp   a
    ret  nz
    cp   a
    rst  $38
    nop
    rst  $30
    ld   [label_4FB], sp
    ld   sp, hl
    ld   b, $89
    halt
    db   $3A ; ldd  a, [hl]
    rst  $20
    jr   label_EBEBE
    nop
    rst  $38
    nop
    rst  $28
    db   $10 ; Undefined instruction
    jr   nz, label_EBE66
    ld   h, b
    sub  a, c
    ld   l, [hl]
    and  e
    ld   e, h
    rst  $20
    jr   label_EBECE
    nop
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, $FFFE
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    di
    add  a, l
    sub  a, e

label_EBEF3::
    and  l
    sbc  a, c
    and  e
    sbc  a, c
    and  e
    sub  a, e
    and  l
    sub  a, e
    push hl
    add  a, e
    push de
    adc  a, c
    db   $D3 ; Undefined instruction
    sbc  a, l
    add  a, d
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    rst  $38
    rst  $38
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    reti
    nop
    ld   sp, hl
    nop
    rst  $38
    nop
    di
    nop
    ld   bc, $0000
    nop
    ret
    ld   [hl], $C9
    ld   [hl], $CB
    inc  [hl]
    db   $EB ; Undefined instruction
    inc  d
    db   $EB ; Undefined instruction
    inc  d
    rst  $28
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c

label_EBF4A::
    ld   a, l
    add  a, c

label_EBF4C::
    ld   a, l
    add  a, c
    rst  $38
    rst  $38
    ld   a, b
    adc  a, h
    rst  $30
    rrca
    rst  $38
    nop
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $28
    db   $10 ; Undefined instruction
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    ei
    inc  b
    rst  $38
    nop
    rst  $28
    db   $10 ; Undefined instruction
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  8
    jr   nc, label_EBF76
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    xor  $11
    rst  $38
    rst  $38
    dec  de
    inc  [hl]
    rst  $28
    ld   a, [$FFFF]
    nop
    call c, label_FD23
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    cp   c
    ld   b, c
    ld   sp, hl
    ld   bc, label_1F9
    ld   sp, hl
    ld   bc, label_1F9
    ld   sp, hl
    ld   bc, label_1F9
    rst  $38
    rst  $38
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
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
    rst  $20
    nop
    rst  $20
    nop
    add  a, c
    jr   label_EBF4A
    jr   label_EBF4C
    ld   h, [hl]
    rst  $20
    nop
    rst  $20
    jr   label_FFFF804E
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret
    sub  a, e
    sbc  a, c
    and  e
    sbc  a, c
    and  e
    cp   c
    jp   label_C399
    adc  a, e
    push de
    db   $3A ; ldd  a, [hl]
    ld   a, $00
    nop
