section "bank32",romx,bank[$20]

label_80000::
    inc  [hl]
    ld   l, d
    inc  bc
    ld   h, c
    ld   b, h

label_80005::
    add  hl, de
    sub  a, [hl]
    ld   h, [hl]
    inc  bc
    db   $E3 ; Undefined instruction
    ld   a, e
    jr   label_3FBF
    ld   l, c
    inc  bc
    jr   z, label_80064
    inc  bc
    ld   c, c
    ld   d, d
    inc  bc
    db   $7B
    ld   a, e
    rlca
    ld   h, [hl]
    ld   a, c
    jr   label_80005
    ld   d, a
    inc  bc
    ld   h, $6A
    inc  bc

label_80021::
    daa
    ld   e, b
    inc  bc
    call z, label_36A
    rst  0
    ld   a, b
    ld   b, $F5
    ld   a, [hl]
    inc  b
    ld   c, [hl]
    ld   [hl], h
    ld   b, $0D
    ld   e, h
    inc  b
    ld   [label_45C], sp
    dec  c
    ld   e, h
    inc  b
    ret  c
    ld   e, c
    inc  bc
    ld   b, c
    ld   a, c
    rlca
    db   $76 ; Halt
    ld   a, b
    ld   b, $35
    ld   h, [hl]
    ld   b, $35
    ld   h, [hl]
    ld   b, $7B
    ld   [hl], e
    ld   b, $30
    ld   h, a
    ld   b, $B4
    ld   c, d
    ld   b, $19
    ld   a, h
    ld   b, $FE
    ld   a, e
    ld   b, $00
    nop
    nop
    sub  a, [hl]
    ld   c, [hl]
    dec  d

label_8005D::
    add  a, l
    ld   a, [hl]
    ld   b, $3C
    ld   c, a
    ld   b, $28

label_80064::
    db   $76 ; Halt
    ld   b, $F1
    ld   h, l
    ld   b, $DC
    ld   a, l
    ld   b, $FB
    ld   c, a
    inc  bc
    ld   b, h
    ld   c, h
    inc  bc
    ld   b, h
    ld   c, h
    inc  bc
    db   $10 ; Undefined instruction
    ld   b, $AF
    ld   l, d
    add  hl, de
    sub  a, l
    ld   e, d
    inc  b
    ld   h, c
    ld   l, h
    inc  b
    sub  a, $75
    dec  d
    and  h
    ld   [hl], a
    rlca
    jr   c, label_800E6
    inc  bc
    sbc  a, [hl]
    ld   h, b
    inc  bc
    ld   e, e
    ld   h, c
    inc  bc
    adc  a, c
    ld   e, h
    inc  bc
    sbc  a, c
    ld   e, e
    inc  bc
    adc  a, b
    ld   e, e
    inc  bc
    ld   l, l
    ld   e, e
    inc  bc
    ld   e, l
    ld   e, e
    inc  bc
    ld   d, c
    ld   e, d
    inc  bc
    call c, label_359
    ld   a, l
    ld   h, b
    inc  bc
    jp   nz, label_35F
    sub  a, e
    ld   e, l
    inc  bc
    ld   c, e
    ld   e, l
    inc  bc
    ld   d, a
    ld   h, b
    inc  bc
    db   $FD ; Undefined instruction
    ld   e, a
    inc  bc
    db   $D3 ; Undefined instruction
    ld   e, a
    inc  bc
    ld   h, d
    ld   c, [hl]
    dec  b
    ld   l, d
    ld   c, c
    dec  b
    db   $D3 ; Undefined instruction
    ld   b, a
    dec  b
    push af
    ld   h, a
    ld   b, $7A
    ld   e, [hl]
    jr   label_8005D
    ld   b, h
    dec  d
    ccf
    ld   b, h
    dec  d
    ld   h, l
    ld   b, e
    dec  d
    nop
    ld   b, c
    dec  d
    jp   z, label_1541
    inc  a
    ld   b, d
    dec  d
    xor  [hl]
    ld   b, d
    dec  d
    ld   a, a
    ld   e, b
    ld   [hl], $26
    ld   d, e
    inc  bc
    nop
    nop

label_800E6::
    nop
    db   $EB ; Undefined instruction
    db   $76 ; Halt
    inc  b
    jp   z, label_476
    ld   a, h
    ld   l, [hl]
    inc  b
    xor  c
    ld   a, c
    ld   b, $AE
    ld   l, c
    inc  b
    inc  h
    ld   l, b
    inc  b
    inc  h
    ld   l, b
    inc  b
    ld   e, h
    ld   e, a
    inc  b
    dec  c

label_80100::
    ld   a, [hl]
    inc  b
    rra
    ld   a, l
    inc  b
    pop  af
    ld   e, l
    inc  b
    db   $FC ; Undefined instruction
    ld   e, [hl]
    inc  b
    xor  l
    ld   d, [hl]
    inc  b
    ld   [hl], b
    ld   d, b
    inc  b
    ret
    ld   c, c
    inc  b
    nop
    ld   b, b
    inc  b
    call c, label_56C
    push hl
    ld   a, e
    dec  b
    ld   b, c
    ld   l, d
    rlca
    ld   l, a
    ld   l, b
    dec  b
    ld   de, label_1942
    inc  d
    ld   h, e
    dec  b
    add  a, b
    ld   e, d
    dec  b
    jp   hl
    ld   e, l
    jr   label_801A6
    ld   d, l
    dec  b
    inc  h
    ld   b, e
    dec  d
    ld   l, e
    ld   d, l
    dec  b
    jr   c, label_801AE
    dec  d
    adc  a, $53
    jr   label_8019D
    ld   d, e
    dec  b
    add  a, l
    ld   e, l
    jr   label_80169
    ld   b, l
    dec  b
    jr   c, label_80189
    dec  b
    ret
    ld   l, e
    ld   b, $DA
    ld   c, b
    add  hl, de
    ld   c, $62
    ld   b, $7F
    ld   h, b
    ld   b, $7F
    ld   h, b
    ld   b, $0E
    ld   h, d
    ld   b, $47
    ld   c, [hl]
    jr   label_80177
    ld   c, l
    jr   label_80100
    ld   c, e
    jr   label_80174
    ld   e, h
    ld   b, $E8

label_80169::
    ld   e, c
    ld   b, $76
    ld   e, e
    ld   b, $99
    ld   e, h
    ld   b, $95
    ld   e, [hl]
    ld   b, $B3
    ld   h, d
    ld   b, $9F
    ld   h, e
    ld   b, $FC
    ld   h, e
    ld   b, $01
    ld   [hl], e
    jr   label_801FD
    ld   l, d
    ld   b, $6D
    ld   l, h
    ld   b, $E3
    ld   l, [hl]
    ld   b, $F8
    ld   a, h
    dec  d
    and  a
    ld   [hl], b
    ld   b, $3C
    ld   [hl], d
    ld   b, $0B
    ld   a, e
    ld   b, $E8
    ld   d, l
    ld   b, $DE
    ld   d, d
    ld   b, $B8
    ld   c, a

label_8019D::
    ld   b, $1F
    ld   l, [hl]
    ld   [hl], $1F
    ld   l, [hl]
    ld   [hl], $A1
    ld   c, [hl]

label_801A6::
    ld   b, $15
    ld   c, a
    ld   b, $7A
    ld   c, e
    ld   b, $BC

label_801AE::
    ld   b, a
    add  hl, de
    ld   sp, label_649
    db   $3A ; ldd  a, [hl]
    ld   b, d
    ld   b, $09
    ld   b, l
    ld   b, $4A
    ld   b, c
    ld   b, $98
    ld   [hl], c
    rlca
    jr   nz, label_80201
    ld   b, $C0
    ld   e, e
    add  hl, de
    ld   b, a
    ld   c, b
    add  hl, de
    ld   a, [$FF00+C]
    rlca

label_801CB::
    dec  [hl]
    ld   [hl], l
    rlca

label_801CE::
    ld   b, $74
    rlca
    xor  a
    ld   [hl], d

label_801D3::
    rlca
    ld   e, e
    ld   [hl], d
    rlca
    ldi  [hl], a
    ld   b, b
    add  hl, de
    inc  e
    ld   [hl], c
    rlca
    jp  c, label_765
    add  hl, bc
    ld   h, a
    rlca
    ld   c, [hl]
    ld   l, b
    rlca
    push de
    ld   l, [hl]
    ld   [hl], $58
    ld   h, e
    rlca
    ld   e, b
    ld   h, e
    rlca
    ldd  [hl], a
    ld   h, h
    rlca
    jp   nc, label_761
    ret  nz
    ld   e, l
    rlca
    rlca
    ld   h, b
    rlca

label_801FB::
    ld   sp, hl
    ld   e, e

label_801FD::
    rlca
    ld   d, h

label_801FF::
    ld   l, e
    add  hl, de

label_80201::
    ld   d, h
    ld   l, e
    add  hl, de
    rst  0
    ld   l, e
    add  hl, de

label_80207::
    ld   b, d
    ld   e, b
    rlca
    ld   c, l
    ld   d, [hl]
    rlca
    db   $10 ; Undefined instruction
    rlca
    ldi  [hl], a
    ld   d, e
    rlca
    inc  c
    ld   d, c
    rlca
    dec  c
    ld   [hl], l
    dec  d
    sub  a, a
    ld   c, h
    rlca
    or   c
    ld   c, [hl]

label_8021E::
    rlca
    or   l

label_80220::
    ld   c, e
    rlca
    dec  de
    ld   c, d
    rlca
    cp   e
    ld   b, [hl]
    rlca
    add  a, h
    ld   b, d

label_8022A::
    rlca
    ld   e, c
    ld   [hl], a
    jr   label_80250
    ld   a, b
    jr   label_80254
    ld   b, b
    rlca

label_80234::
    sub  a, $6F

label_80236::
    jr   label_80234
    ld   l, c
    jr   label_80207
    ld   h, h
    jr   label_801CB
    ld   h, e
    jr   label_801D3
    ld   h, d
    jr   label_801CE
    ld   h, c
    jr   label_8021E
    ld   e, [hl]
    jr   label_8024A

label_8024A::
    ld   b, b
    jr   label_8024E
    ld   d, l

label_8024E::
    jr   label_801FB

label_80250::
    ld   [hl], e
    dec  d

label_80252::
    jr   nc, label_802C7

label_80254::
    dec  d
    nop
    ld   b, l
    jr   label_801FF
    ld   d, d
    jr   label_80254
    ld   a, [hl]
    dec  b
    db   $4E
    ld   c, [hl]
    jr   label_80236
    ld   c, c
    jr   label_80220
    ld   b, h
    dec  d
    ld   de, label_196F
    jr   c, label_802B5
    jr   label_8022A
    ld   [hl], c
    add  hl, de
    ld   l, $7F
    dec  b
    sub  a, [hl]
    ld   a, a
    dec  d
    ld   l, e
    ld   d, d
    jr   label_80252
    ld   d, c
    jr   label_80295
    ld   e, [hl]
    add  hl, de
    call c, label_1959
    db   $58
    ld   e, b
    add  hl, de
    push bc
    ld   d, [hl]
    add  hl, de
    or   h
    ld   d, a
    add  hl, de
    adc  a, e
    ld   d, l
    add  hl, de
    ld   a, [$FF53]
    add  hl, de
    sub  a, b
    ld   d, e
    add  hl, de
    cp   l

label_80295::
    ld   d, c
    add  hl, de
    ld   [hl], l
    ld   a, [hl]
    dec  d
    bit  1, d
    add  hl, de
    inc  h
    ld   b, l
    add  hl, de
    ld   a, e
    db   $76 ; Halt
    dec  d
    sbc  a, l
    ld   a, b
    dec  d
    ld   b, e
    ld   c, l
    dec  d
    pop  hl
    ld   c, e
    dec  d
    or   [hl]
    ld   b, [hl]
    dec  d
    inc  e
    ld   a, e
    ld   b, $80
    ld   d, b
    dec  d

label_802B5::
    sbc  a, a
    ld   b, b
    dec  d
    add  a, a
    ld   a, d
    rla
    ld   l, b
    ld   h, [hl]
    ld   [hl], $68
    ld   h, [hl]
    ld   [hl], $68
    ld   h, [hl]
    ld   [hl], $C9
    ld   h, e
    ld   [hl], $C9
    ld   h, e
    ld   [hl], $C9
    ld   h, e
    ld   [hl], $41
    ld   h, d
    ld   [hl], $41
    ld   h, d
    ld   [hl], $41
    ld   h, d
    ld   [hl], $A2
    ld   e, a
    ld   [hl], $A2
    ld   e, a
    ld   [hl], $F7
    ld   e, e
    ld   [hl], $5E
    ld   e, e
    ld   [hl], $3F
    ld   e, c
    ld   [hl], $3F
    ld   e, c
    ld   [hl], $E2
    ld   d, h
    ld   [hl], $B6
    ld   c, h
    ld   [hl], $12
    ld   c, c
    ld   [hl], $F0
    db   $EB ; Undefined instruction
    ld   e, a
    ld   d, b
    ld   hl, label_80000
    add  hl, de
    add  hl, de
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    inc  hl
    ld   a, [hl]
    ld   l, e
    ld   h, d
    ret
    ld   a, [$C5A0]
    ld   [$C5A1], a
    xor  a
    ld   [$C5A0], a
    ld   [$C10C], a
    ld   [$FFB2], a
    ld   [$C117], a
    ld   [$C19D], a
    ld   [$C147], a
    ld   [$C5A8], a
    ld   [$D45E], a
    ret

label_80322::
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   l, [hl]
    ld   d, c
    ld   l, l
    ld   d, b
    ld   c, h
    ld   c, e
    xor  a
    ld   c, a
    ld   c, h
    ld   c, e
    xor  a
    ld   c, a
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   e, h
    ld   c, e
    ld   c, h
    ld   c, e
    or   l
    ld   c, a
    or   l
    ld   c, a
    or   l
    ld   c, a
    rst  $10
    ld   e, c
    ld  [$FF00+C], a
    ld   c, [hl]
    xor  b
    ld   c, [hl]
    adc  a, $4E
    call nz, label_80C4E
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   d, e
    ld   c, c
    ld   c, h
    ld   c, e
    rst  $10
    ld   c, [hl]
    ld   [de], a
    dec  sp
    ld   [de], a
    dec  sp
    ld   c, h
    ld   c, e
    rst  $10
    ld   c, [hl]
    ld   c, h
    ld   c, e
    ld   [de], a
    dec  sp
    ld   c, h
    ld   c, e
    ld   b, h
    ld   c, h
    ld   b, h
    ld   c, h
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    xor  e
    dec  a
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   e, $4F
    ld   a, d
    ld   c, a
    ld   a, d
    ld   c, a
    dec  l
    ld   c, a
    ld   a, b
    ld   c, d
    ld   a, d
    ld   c, a
    ld   a, d
    ld   c, a
    ld   a, d
    ld   c, a
    ld   d, [hl]
    ld   c, e
    ld   a, d
    ld   c, a
    ld   a, d
    ld   c, a
    ld   a, d
    ld   c, a
    and  c
    ld   c, a
    ld   d, [hl]
    ld   c, e
    ld   e, $4F
    ld   e, $4F
    ei
    ld   c, [hl]
    add  a, b
    ld   c, d
    adc  a, $4A
    ld   b, d
    ld   c, e
    ld   [hl], e
    ld   c, d
    ld   c, h
    ld   c, e
    and  c
    ld   c, a
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    rra
    ld   c, h
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   b, e
    ld   c, e
    ld   c, h
    ld   c, e
    dec  [hl]
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    dec  [hl]
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    or   [hl]
    dec  a
    pop  bc
    dec  a
    call z, label_D73D
    dec  a
    ld  [$FF00+C], a
    dec  a
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    db   $ED ; Undefined instruction
    dec  a
    ld   [hl], b
    ld   c, a
    ld    hl, sp+$3D
    inc  bc
    ld   a, $57
    ld   c, e
    ld   c, $3E
    ld   c, h
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    call nc, label_1B49
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   e, e
    ld   c, d
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    cpl
    ld   c, e
    add  hl, de
    ld   c, d
    daa
    ld   c, d
    cpl
    ld   c, e
    cpl
    ld   c, e
    cpl
    ld   c, e
    jr   z, label_8045A
    cpl
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   c, $4B
    ld   d, [hl]
    ld   c, e
    cpl
    ld   c, e
    add  a, e
    ld   c, a
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   a, h
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    xor  l
    ld   c, c
    inc  [hl]
    ld   c, d
    ld   d, [hl]
    ld   c, e
    db   $F4 ; Undefined instruction
    ld   c, c
    ld  [$FF00+C], a
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    add  a, e
    ld   c, a
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ret  z
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    add  a, b
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   h, $49
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e

label_8045A::
    xor  b
    ld   c, [hl]
    ld   d, [hl]
    ld   c, e
    jp   nz, label_81649
    ld   c, e
    ld   d, [hl]
    ld   c, e
    dec  a
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   b, e
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    or   l
    ld   c, c
    ld   c, h
    ld   c, e
    ld   l, b
    ld   c, a
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    add  a, e
    ld   c, a
    ld   [hl], h
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    or   c
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   h, l
    ld   c, c
    ld   [hl], e
    ld   c, c
    add  a, e
    ld   c, a
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   e, d
    ld   c, c
    inc  [hl]
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   h, c
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    xor  b
    ld   c, [hl]
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    and  $49
    and  [hl]
    ld   c, c
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    ld   c, h
    ld   c, e
    add  a, c
    ld   c, e
    add  a, c
    ld   c, e
    add  a, c
    ld   c, e
    adc  a, a
    ld   c, e
    sbc  a, d
    ld   c, e
    and  [hl]
    ld   c, e
    ret  nz
    ld   c, e
    cp   b
    ld   c, e
    call c, label_8164B
    ld   c, e
    db   $EB ; Undefined instruction
    ld   c, e
    ld   bc, label_2D4C
    ld   c, h
    bit  1, e
    ld   d, [hl]
    ld   c, e
    ld   a, [$FFEB]
    ld   e, a
    ld   d, $00
    ld   hl, label_80322
    sla  e
    rl   d
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    push de
    pop  hl
    ret

label_8052B::
    nop
    nop
    call z, label_80856
    ld   h, a
    ld   [hl], $63
    jr   z, label_80598
    ld   c, l
    ld   h, h
    adc  a, c
    ld   h, l
    ld   d, c
    sub  a, $E9
    ld   h, d
    ret
    ld   h, a
    adc  a, a
    ld   l, c
    or   $68
    ld   h, b
    ld   h, [hl]
    ld   l, l
    ld   l, d
    xor  $6A
    add  a, b
    ld   l, l
    adc  a, e
    ld   l, a
    ld   a, [bc]
    ld   [hl], c
    ldi  [hl], a
    ld   [hl], h
    db   $E3 ; Undefined instruction
    ld   [hl], l
    xor  b
    ld   h, d
    add  a, e
    ld   [hl], d
    adc  a, h
    ld   d, a
    push af
    ld   e, d
    ret  z
    ld   e, e
    inc  c
    ld   e, l
    ld   e, e
    ld   e, [hl]
    ld   b, a
    ld   e, a
    inc  b
    ld   h, b
    inc  b
    ld   h, b
    sbc  a, d
    ld   c, [hl]
    ld   d, b
    ld   d, b
    rst  $28
    ld   d, c
    adc  a, [hl]
    ld   d, e
    dec  l
    ld   d, l
    add  a, c
    ld   [hl], a
    call nc, label_374D
    ld   l, h
    ld   hl, label_8052B
    ld   b, $00
    ld   a, [$D6FF]
    sla  a
    ld   c, a
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    inc  hl
    ld   a, [hl]
    ld   d, a
    ret
    ld   c, h
    ld   h, d
    ld   h, e
    ld   h, [hl]
    ld   l, e
    ld   h, e
    ld   h, l
    ld   h, h
    ld   h, b
    ld   c, h
    ld   c, l
    ld   c, h
    ld   c, h
    ld   c, h
    ld   c, [hl]

label_80598::
    ld   c, [hl]
    ld   c, [hl]
    ld   c, l
    ld   c, l
    ld   c, a
    ld   h, c
    ld   h, e
    ld   h, e
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, [hl]
    ld   c, [hl]
    ld   c, l
    ld   b, b
    ld   b, b
    ld   l, h
    ld   b, b
    ld   b, b
    ld   l, h
    ld   b, b
    ld   l, [hl]
    ld   c, d
    ld   b, b
    ld   b, [hl]
    ld   b, b
    ld   b, b
    ld   b, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   b, [hl]
    ld   c, b
    ld   c, d
    ld   b, b
    ld   b, [hl]
    ld   l, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, b
    ld   c, b
    ld   b, [hl]
    ld   c, d
    ld   a, c
    ld   a, c
    ld   [hl], a
    ld   a, c
    ld   a, c
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, c
    ld   h, e
    ld   a, d
    nop
    nop
    nop
    ld   a, e
    ld   a, e
    ld   a, e
    ld   a, d
    ld   a, e
    ld   a, c
    ld   a, h
    ld   a, d
    ld   [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, e
    ld   a, d

label_805EA::
    ld   e, [hl]
    dec  l
    ld   e, [hl]
    dec  l
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   e, [hl]
    dec  l
    ld   e, [hl]
    dec  l
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   d, b
    dec  l
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   d, b
    dec  l
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    ld   h, d
    dec  [hl]
    push de
    ld   a, [$FFF6]
    and  a
    jr   z, label_80620
    cp   $05
    jr   nz, label_80640

label_80620::
    ld   a, [$D6FB]
    and  a
    jr   z, label_80640
    ld   a, c
    cp   $40
    jr   z, label_8062F
    cp   $80
    jr   nz, label_80640

label_8062F::
    xor  $C0
    ld   l, a
    ld   h, $5E
    ld   a, [$D6FB]
    ld   [$FFBB], a
    ld   [$D6FA], a
    pop  de
    ld   a, $2D
    ret

label_80640::
    ld   hl, label_805EA
    ld   a, [$FFF6]
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    inc  hl
    ld   a, [hl]
    ld   e, a
    dec  hl
    ld   a, [hl]
    ld   h, a
    ld   l, $00
    add  hl, bc
    ld   a, e
    pop  de
    ret
    dec  e
    sla  e
    ld   d, $00
    ld   hl, label_80664
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ret

label_80664::
    sbc  a, e
    jr   nc, label_8065E
    jr   z, label_80638

label_80669::
    dec  hl
    inc  bc
    inc  l
    dec  l
    dec  l
    jr   z, label_8069C
    dec  l
    dec  l
    ld   a, [$FF28]
    ld   [hl], e
    ld   l, $69
    inc  b
    jp   hl
    dec  l
    ld   l, c
    inc  b
    ld   e, [hl]
    ld   l, $FC
    jr   c, label_80669
    jr   z, label_806FC
    dec  l
    and  a
    dec  l
    db   $10 ; Undefined instruction
    ld   b, c
    ld   l, $06
    ld   l, $66
    ld   a, [hli]
    cp   $2A
    ld   sp, hl
    ld   a, [hli]
    ld   [$812A], a
    dec  hl
    ld   [hl], d
    dec  hl
    ld   h, $2B
    ld   [hl], d
    dec  hl

label_8069C::
    xor  [hl]
    ld   a, [hli]
    scf
    ld   a, [hli]
    ld   d, a
    ld   a, [hli]
    dec  bc
    ld   l, $21
    ld   l, $15
    add  hl, sp
    dec  e
    add  hl, sp

label_806AA::
    ld   d, c
    dec  [hl]
    ld   c, a
    dec  [hl]
    nop
    nop
    ld   c, e
    dec  [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    dec  [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, b
    dec  [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, h
    dec  [hl]
    ld   c, [hl]
    dec  [hl]
    nop
    nop
    nop
    nop
    nop
    nop

label_806D6::
    nop
    nop
    ld   c, l
    ld   sp, $0000
    ld   c, h
    dec  [hl]
    ld   d, c
    ld   l, $45
    dec  [hl]
    ld   b, l
    dec  [hl]
    nop
    nop
    ld   b, l
    dec  [hl]
    nop
    nop
    ld   b, l
    dec  [hl]
    nop
    nop
    ld   c, c
    dec  [hl]
    nop
    nop
    nop
    nop
    ld   b, l
    dec  [hl]
    nop
    nop
    ld   b, l
    dec  [hl]
    nop
    nop

label_806FC::
    nop
    nop
    nop
    nop
    nop
    nop

label_80702::
    ld   d, b
    dec  [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  [hl]
    nop
    nop
    nop
    nop
    ld   c, d
    dec  [hl]
    nop
    nop
    ld   b, [hl]
    dec  [hl]
    nop
    nop
    nop
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
    dec  [hl]

label_8072E::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, l
    dec  [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, a
    dec  [hl]
    nop
    nop
    ld   b, a
    dec  [hl]
    ld   b, a
    dec  [hl]
    nop
    nop
    ld   b, a
    dec  [hl]
    nop
    nop
    ld   b, a
    dec  [hl]
    ld   b, a
    dec  [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, a
    dec  [hl]
    nop
    nop
    ld   hl, label_806AA
    ld   a, [$FFF6]
    rla
    ld   e, a
    ld   d, $00
    inc  e
    push de
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_80776
    ld   d, a
    dec  hl
    ld   a, [hl]
    ld   b, a
    ld   c, $04
    ld   a, d
    ld   h, $20
    call label_A13

label_80776::
    pop  de
    push de
    ld   hl, label_806D6
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_8078C
    ld   d, a
    dec  hl
    ld   a, [hl]
    ld   b, a
    ld   c, $05
    ld   a, d
    ld   h, $20
    call label_A13

label_8078C::
    pop  de
    push de
    ld   hl, label_80702
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_807A2
    ld   d, a
    dec  hl
    ld   a, [hl]
    ld   b, a
    ld   c, $06
    ld   a, d
    ld   h, $20
    call label_A13

label_807A2::
    pop  de
    ld   hl, label_8072E
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_807B7
    ld   d, a
    dec  hl
    ld   a, [hl]
    ld   b, a
    ld   c, $07
    ld   a, d
    ld   h, $20
    call label_A13

label_807B7::
    ld   a, [$FFF6]
    cp   $01
    jr   nz, label_807C2
    ld   a, $20
    call label_A32

label_807C2::
    ret

label_807C3::
    nop
    ld   b, b
    add  a, b
    ret  nz
    nop
    ld   b, b
    add  a, b
    ret  nz

label_807CB::
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    inc  b
    nop
    nop

label_807E1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    nop
    nop
    nop
    dec  b
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    ld   a, [$FFF6]
    ld   c, a
    ld   hl, label_807CB
    ld   a, b
    and  a
    jr   z, label_80804
    ld   hl, label_807E1

label_80804::
    ld   b, $00
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   b, a
    ld   c, $00
    ld   a, [$FFA6]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_807C3
    add  hl, de
    ld   l, [hl]
    ld   h, $00
    ld   de, label_82000
    add  hl, bc
    add  hl, de
    ld   de, $8FC0
    ld   bc, $0040
    ld   a, $35
    and  a
    ret
    di
    ld   bc, $D700
    ld   de, $D000
    ld   hl, rSVBK

label_80837::
    ld   a, [bc]
    cp   $56
    jr   z, label_80840
    cp   $57
    jr   nz, label_8084B

label_80840::
    ld   [hl], $05
    ld   a, [de]
    ld   [hl], $00

label_80845::
    and  a
    jr   z, label_8084B
    ld   a, $0D
    ld   [bc], a

label_8084B::
    inc  bc
    inc  de
    ld   a, e
    cp   $C0
    jr   nz, label_80837
    ei
    ret

label_80854::
    ld   a, [$FFFE]

label_80856::
    and  a
    ret  z
    di
    ld   a, $05
    ld   [rSVBK], a
    ld   hl, $D000

label_80860::
    xor  a
    ldi  [hl], a
    ld   a, l
    cp   $C0
    jr   nz, label_80860
    xor  a
    ld   [rSVBK], a
    ei
    ret

label_8086C::
    add  hl, bc
    dec  b
    ld   [label_A08], sp
    ld   a, [bc]
    rlca
    inc  c

label_80874::
    ld   hl, label_8086C
    add  hl, de
    ld   a, [$FFD7]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   [$FFD7], a
    ld   hl, label_80870
    add  hl, de
    ld   a, [$FFD8]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ld   e, a
    ld   [$FFCD], a
    ld   a, [$FFD7]
    or   e
    ld   e, a
    ret

label_80898::
    push de
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0A
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    ld   [hl], $00
    ret
    ld   a, [$C17B]
    and  a
    ret  nz
    ld   a, [$FFF7]
    cp   $FF
    ret  nz
    ld   a, [$FFCD]
    ld   d, a
    ld   a, [$FFCE]
    ld   e, a
    push de
    ld   d, $00
    ld   a, [$FF9E]
    ld   e, a
    ld   a, [$FF98]
    ld   [$FFD7], a
    ld   a, [$FF99]
    ld   [$FFD8], a
    call label_80874
    ld   hl, $D711
    add  hl, de
    ld   a, [hl]
    cp   $53
    jr   z, label_808FC
    cp   $55
    jr   z, label_808FC
    cp   $54
    jr   nz, label_8090A

label_808FC::
    ld   a, [$C146]
    and  a
    jr   nz, label_80917
    call label_80954
    call label_14CB
    jr   label_80917

label_8090A::
    cp   $56
    jr   z, label_80912
    cp   $57
    jr   nz, label_80917

label_80912::
    call label_80923
    jr   label_80917

label_80917::
    pop  de
    ld   a, d
    ld   [$FFCD], a
    ld   a, e
    ld   [$FFCE], a
    ret

label_8091F::
    db   $10 ; Undefined instruction
    ld   de, label_3E13
    dec  c
    ld   [$DDD8], a
    ld   [hl], a
    ld   a, [$DB90]
    add  a, $05
    ld   [$DB90], a
    di
    ld   a, $05
    ld   [rSVBK], a
    ld   hl, $D011
    add  hl, de
    ld   [hl], a
    xor  a
    ld   [rSVBK], a
    ei
    call label_2887
    push bc
    ld   a, $20
    call label_91D

label_80948::
    pop  bc
    ld   de, label_8091F
    call label_80898
    ret

label_80950::
    db   $76 ; Halt
    ld   [hl], a
    db   $76 ; Halt
    ld   [hl], a

label_80954::
    ld   a, [hl]
    inc  a
    ld   [$FFD7], a
    dec  a
    cp   $55
    jr   nz, label_80961
    ld   a, $AE
    ld   [$FFD7], a

label_80961::
    ld   a, [$FFD7]
    ld   [hl], a
    call label_2887
    push bc
    ld   a, [$FFD7]
    ld   [$DDD8], a
    ld   a, $20
    call label_91D
    pop  bc
    ld   a, [$FFD7]
    cp   $AE
    jr   nz, label_8097F
    ld   de, label_80950
    call label_80898

label_8097F::
    ret

label_80980::
    dec  [hl]
    inc  sp
    inc  de
    dec  d

label_80984::
    rla
    push bc
    push de
    ld   hl, label_80980
    ld   a, [$DDD9]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFE9
    cp   [hl]
    jr   nz, label_809AF
    ld   a, [$DDD9]
    inc  a
    ld   [$DDD9], a
    cp   $05
    jr   nz, label_809AF
    ld   a, $80
    ld   [$DDD9], a
    ld   a, $02
    ld   [$FFF2], a
    call label_80854

label_809AF::
    pop  de
    pop  bc
    ret

label_809B2::
    db   $10 ; Undefined instruction
    ld   [label_C08], sp
    inc  c
    ld   a, [$FF10]
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, label_809B2
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$C179], a
    ld   hl, label_809B6
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$C17A], a
    ld   a, $02
    ld   [$C178], a
    ret
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    ld   a, [$FFE2]
    ld   b, a
    ld   a, [$FFE3]
    ld   c, a
    ld   a, [$FFE4]
    ld   d, a
    ld   a, [$FFE5]
    ld   e, a
    ret

label_809EC::
    ld   bc, label_2001
    jr   nz, label_80984
    sub  a, e
    inc  de
    inc  de

label_809F4::
    ld   a, [$C127]
    ld   [$D602], a
    ld   a, [$C126]
    or   $98
    ld   [$D601], a
    ld   hl, label_809F0
    add  hl, bc
    ld   a, [hl]
    ld   [$D603], a
    ld   a, $00
    ld   [$D618], a
    ld   a, $EE
    ld   [$D614], a
    ld   [$D615], a
    ld   [$D616], a
    ld   [$D617], a
    ld   b, $D6
    ld   c, $04
    ret

label_80A22::
    ld   a, [$C127]
    ld   [$D602], a
    ld   [$DC92], a
    ld   a, [$C126]
    or   $98
    ld   [$D601], a
    ld   [$DC91], a
    ld   hl, label_809F0
    add  hl, bc
    ld   a, [hl]
    ld   [$D603], a
    ld   [$DC93], a
    ld   a, $00
    ld   [$D618], a
    ld   [$DCA8], a
    ld   a, $EE
    ld   [$D614], a
    ld   [$D615], a
    ld   [$D616], a
    ld   [$D617], a
    ld   b, $D6
    ld   c, $04
    ld   [$DCA4], a
    ld   [$DCA5], a
    ld   [$DCA6], a
    ld   [$DCA7], a
    ld   a, $DC
    ld   [$FFE2], a
    ld   [$FFE4], a
    ld   a, $94
    ld   [$FFE3], a
    ld   a, $AB
    ld   [$FFE5], a
    ret
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   a, [$C12A]
    ld   [$FFD9], a
    ld   hl, label_809EC
    add  hl, bc
    ld   a, [$FFFE]
    and  a
    jr   nz, label_80A8F
    call label_809F4
    jr   label_80A92

label_80A8F::
    call label_80A22

label_80A92::
    ret

label_80A93::
    ld   [label_C06], sp
    ld   a, [bc]
    rst  $38
    inc  b
    ld   a, [bc]
    inc  c
    ld   b, $08
    ld   a, [bc]
    inc  c
    rst  $38
    inc  b
    inc  c
    ld   a, [bc]

label_80AA3::
    inc  hl

label_80AA4::
    inc  hl
    ld   h, e
    ld   h, e
    inc  bc
    inc  bc
    ld   b, e
    ld   b, e
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   b, e
    ld   b, e
    inc  hl
    inc  hl
    push hl
    ld   a, [$FFD7]
    add  a, h
    ld   [bc], a
    inc  bc
    ld   a, [$FFD8]
    add  a, l
    ld   [bc], a
    inc  bc
    ld   hl, label_80A93
    ld   a, [$FFD9]
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    ld   [bc], a
    cp   $FF
    jr   nz, label_80AD4
    dec  bc
    ld   a, $F0
    ld   [bc], a
    inc  bc

label_80AD4::
    inc  bc
    ld   hl, label_80AA3
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFDA
    or   [hl]
    ld   [bc], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_80AEF
    ld   a, [$FFDA]
    and  a
    jr   z, label_80AEF
    ld   a, [bc]
    and  $F8
    or   $04
    ld   [bc], a

label_80AEF::
    inc  bc
    pop  hl
    ld   a, [$FFD7]
    add  a, h
    ld   [bc], a
    inc  bc
    ld   a, [$FFD8]
    add  a, l
    add  a, $08
    ld   [bc], a
    inc  bc
    ld   hl, label_80A94
    add  hl, de
    ld   a, [hl]
    ld   [bc], a
    inc  bc
    ld   hl, label_80AA4
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFDA
    or   [hl]
    ld   [bc], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_80B1E
    ld   a, [$FFDA]
    and  a
    jr   z, label_80B1E
    ld   a, [bc]
    and  $F8
    or   $04
    ld   [bc], a

label_80B1E::
    ret
    xor  a
    ld   [$C14E], a
    ld   [$C14D], a
    ld   [$C1A4], a
    ld   [$C15C], a
    ld   [$C1AE], a
    ld   a, [$C144]
    and  a
    jr   z, label_80B39
    dec  a
    ld   [$C144], a

label_80B39::
    ret

label_80B3A::
    stop
    ld   [label_308], sp
    inc  bc
    ld   [label_808], sp
    ld   [label_D00], sp

label_80B46::
    ld   [label_308], sp
    inc  b
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, label_80B3A
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$C140], a
    ld   hl, label_80B3E
    add  hl, de
    ld   a, [hl]
    ld   [$C141], a
    ld   hl, label_80B42
    add  hl, de
    ld   a, [$C145]
    add  a, [hl]
    ld   [$C142], a
    ld   hl, label_80B46
    add  hl, de
    ld   a, [hl]
    ld   [$C143], a
    xor  a
    ld   [$C5B0], a
    ret

label_80B79::
    ld   [$00F8], sp
    nop

label_80B7D::
    nop
    nop
    db   $FD ; Undefined instruction
    inc  b
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $10
    ld   a, [$C1C0]
    and  a
    jp   z, label_80B9E
    xor  a
    ld   [$C1C0], a
    ld   a, [$C1C2]
    ld   c, a
    ld   b, d
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01
    ret

label_80B9E::
    ld   a, $06
    ld   [$C1C0], a
    ld   a, e
    ld   [$C1C1], a
    ld   a, $0C
    ld   [$C19B], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $A0
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], d
    ld   hl, $C480
    add  hl, de
    ld   [hl], $03
    ld   a, [$FFF9]
    and  a
    jr   nz, label_80BC8
    ld   a, $09
    ld   [$FFF2], a
    jr   label_80BCD

label_80BC8::
    ld   hl, $C310
    add  hl, de
    ld   [hl], d

label_80BCD::
    ld   hl, $C240
    add  hl, de
    ld   [hl], d
    ld   hl, $C250
    add  hl, de
    ld   [hl], d
    ld   hl, $C320
    add  hl, de
    ld   [hl], d
    ld   a, [$FF9E]
    ld   c, a
    ld   b, d
    ld   hl, label_80B79

label_80BE3::
    add  hl, bc
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_80B7D
    add  hl, bc
    ld   a, [$FF99]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_80BF8::
    ret
    jr   label_80BE3

label_80BFB::
    nop
    db   $E8 ; add  sp, d
    jr   label_80BFF

label_80BFF::
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $28
    ld   c, $04
    ld   b, $00
    ld   a, [$FFCB]

label_80C0B::
    srl  a
    jr   nc, label_80C10
    inc  b

label_80C10::
    dec  c
    jr   nz, label_80C0B
    ld   a, b
    cp   $02
    jr   c, label_80C3E
    ld   a, [$FFCB]
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, label_80BF8
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   a, [$FFCB]
    srl  a
    srl  a
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, label_80BFB
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a

label_80C3E::
    ret

label_80C3F::
    ld   c, $F2
    nop
    nop

label_80C43::
    nop
    nop
    db   $F4 ; Undefined instruction
    inc  c
    ld   a, $05
    ld   [$FFF2], a
    ld   a, $0E
    ld   [$C19B], a
    ld   a, [$DB4C]
    sub  a, $01
    daa
    ld   [$DB4C], a
    jr   nz, label_80C6D
    ld   hl, $DB00
    ld   a, [hl]
    cp   $0C
    jr   nz, label_80C65
    ld   [hl], $00

label_80C65::
    inc  hl
    ld   a, [hl]
    cp   $0C
    jr   nz, label_80C6D
    ld   [hl], $00

label_80C6D::
    push bc
    ld   a, [$FF9E]
    ld   c, a
    ld   hl, label_80C3F
    add  hl, bc
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_80C43
    add  hl, bc
    ld   a, [$FF99]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $17
    pop  bc
    ret
    ld   a, [$C5AC]
    and  a
    jr   nz, label_80CA2
    ld   a, $2D
    ld   [$FFF4], a

label_80CA2::
    ret
    xor  a
    ld   [$FFE6], a
    ld   [$C19C], a
    ld   [$C504], a
    ld   [$DBC8], a
    ld   [$DBC9], a
    ld   [$C1A2], a
    ld   [$C1C6], a
    ld   [$D6FA], a
    ld   [$C50A], a
    ld   [$FFAC], a
    ld   [$C113], a
    ld   [$D460], a
    ld   [$C1BE], a
    ld   [$C50E], a
    ld   [$C3C8], a
    ld   [$C5A6], a
    ld   [$D462], a
    ld   [$C3CD], a
    ld   [$DDD9], a
    ld   a, $FF
    ld   [$D401], a
    ld   [$C50F], a
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
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [$FFE2], a
    push hl
    db   $E8 ; add  sp, d
    db   $EB ; Undefined instruction
    xor  $F1
    db   $F4 ; Undefined instruction
    rst  $30
    ld   a, [$00FD]
    inc  bc
    ld   b, $09
    inc  c
    rrca
    ld   [de], a
    dec  d
    jr   label_80D68
    ld   e, $21
    inc  h
    daa
    ld   a, [hli]
    dec  l
    jr   nc, label_80D88
    ld   [hl], $39
    inc  a
    ccf
    ld   b, d
    ld   b, l
    ld   c, b
    inc  sp
    ld   [hl], $39
    inc  a
    ccf
    ld   b, d
    ld   b, l
    ld   c, b
    ld   a, [$FFF0]
    ld   a, [$FFF0]

label_80D68::
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFE0]
    ld  [$FF00+C], a
    db   $E4 ; Undefined instruction
    and  $E8
    ld   [$EEEC], a
    ld   a, [$FFF2]
    db   $F4 ; Undefined instruction
    or   $F8
    ld   a, [$FEFC]
    nop
    ld   [bc], a
    inc  b
    ld   b, $08

label_80D88::
    ld   a, [bc]
    inc  c
    ld   c, $10
    ld   [de], a
    inc  d
    ld   d, $18
    ld   a, [de]
    inc  e
    dec  e
    ld   e, $20
    ldi  [hl], a
    inc  h
    ld   h, $28
    ld   a, [hli]
    inc  l
    ld   l, $20
    ldi  [hl], a
    inc  h
    ld   h, $28
    ld   a, [hli]
    inc  l
    ld   l, $F0
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    rst  $18
    ld   [$FFE2], a
    db   $E3 ; Undefined instruction
    push hl
    and  $E8
    jp   hl
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    xor  $EF
    pop  af
    ld   a, [$FF00+C]
    push af
    rst  $30
    ld    hl, sp+$FA
    ei
    db   $FD ; Undefined instruction
    cp   $00
    ld   bc, label_403
    ld   b, $07
    add  hl, bc
    ld   a, [bc]
    inc  c
    dec  c
    rrca
    db   $10 ; Undefined instruction
    inc  de
    dec  d
    ld   d, $18
    add  hl, de
    dec  de
    inc  e
    ld   e, $1F
    ld   hl, label_2422
    add  hl, de
    dec  de
    inc  e
    ld   e, $1F
    ld   hl, label_2422
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    push hl
    and  $E8
    jp   hl
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    xor  $F0
    ld   a, [$FF00+C]
    or   $F7
    ld    hl, sp+$F9
    ld   a, [$FDFC]
    cp   $FF
    nop
    ld   bc, label_403
    ld   b, $07
    add  hl, bc
    ld   a, [bc]
    inc  c
    dec  c
    rrca
    db   $10 ; Undefined instruction
    inc  de
    dec  d
    ld   d, $18
    add  hl, de
    dec  de
    inc  e
    ld   e, $1F
    ld   hl, label_2222
    inc  h
    dec  h
    daa
    add  hl, hl
    dec  hl
    inc  l
    ld   l, $2F
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    pop  hl
    ld  [$FF00+C], a
    db   $E4 ; Undefined instruction
    push hl
    and  $E8
    jp   hl
    ld   [$EDEC], a
    xor  $F0
    pop  af
    ld   a, [$FF00+C]
    push af
    or   $F8
    ld   sp, hl
    ld   a, [$FEFC]
    rst  $38
    nop
    ld   bc, label_402
    dec  b
    ld   b, $08
    add  hl, bc
    ld   a, [bc]
    inc  c
    dec  c
    ld   c, $10
    ld   de, label_1412
    dec  d
    ld   d, $18
    add  hl, de
    ld   a, [de]
    inc  e
    dec  e
    ld   e, $20
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    daa
    jr   z, label_80E8D
    dec  hl
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFE2]
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    and  $E8
    jp   hl
    ld   [$EDEC], a
    xor  $EF
    pop  af
    ld   a, [$FF00+C]
    push af
    or   $F8
    ld   sp, hl
    ld   a, [$FDFB]
    cp   $FF
    nop
    ld   bc, label_302
    dec  b
    ld   b, $07
    ld   [label_B0A], sp

label_80E8D::
    inc  c
    dec  c
    rrca
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  d
    dec  d

label_80E95::
    ld   d, $17
    add  hl, de
    ld   a, [de]
    dec  de
    dec  e
    ld   e, $20
    ld   hl, label_2322
    dec  h
    ld   h, $27
    jr   z, label_80E95
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFE3]
    db   $E4 ; Undefined instruction
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   hl
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $F0
    pop  af
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    or   $F7
    ld    hl, sp+$F9
    ei
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    nop
    ld   bc, label_302
    inc  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    ld   c, $10
    ld   de, label_1312
    inc  d
    dec  d
    ld   d, $18
    add  hl, de
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    rra
    jr   nz, label_80F01
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    ld   a, [$FFE4]
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   hl
    ld   [$ECEB], a
    xor  $EF
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    push af
    or   $F8
    ld   sp, hl
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction

label_80F01::
    cp   $FF
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    inc  c
    dec  c
    ld   c, $0F
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    dec  d
    ld   d, $17
    jr   label_80F34
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    ld   hl, label_2322
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   hl
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$F9
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction
    cp   $FF
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    db   $10 ; Undefined instruction

label_80F55::
    ld   [de], a
    inc  de
    inc  d
    dec  d
    ld   d, $17
    jr   label_80F76
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    jr   nz, label_80F55
    ld   a, [$FFF0]
    and  $E7
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    jp   hl
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [$FFF0]
    pop  af
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$F8
    ld   sp, hl
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction
    cp   $FF
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    rlca
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  d
    dec  d
    ld   d, $17
    jr   label_80FB8
    ld   a, [de]
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   a, [$FFF0]
    rst  $20
    db   $E8 ; add  sp, d
    jp   hl
    ld   [$ECEB], a
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    di
    db   $F4 ; Undefined instruction
    push af

label_80FB8::
    or   $F7
    rst  $30
    ld    hl, sp+$F9
    ld   a, [$FCFB]
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    nop
    ld   bc, label_302
    inc  b
    inc  b
    dec  b
    ld   b, $07
    ld   [label_909], sp
    ld   a, [bc]
    dec  bc
    inc  c
    dec  c
    ld   c, $0E
    rrca
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  d
    dec  d
    ld   d, $16
    rla
    jr   label_80FFB
    ld   a, [de]
    dec  de
    ld   a, [$FFE9]
    jp   hl
    ld   [$EBEB], a
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EE
    rst  $28
    ld   a, [$FFF0]
    pop  af
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$F8

label_80FFB::
    ld   sp, hl
    ld   a, [$FCFB]
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    nop
    nop
    ld   bc, label_302
    inc  bc
    inc  b
    dec  b
    ld   b, $06
    rlca
    ld   [label_A09], sp
    ld   a, [bc]
    dec  bc
    inc  c
    inc  c
    dec  c
    ld   c, $0E
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   [de], a
    inc  de
    inc  d
    dec  d
    dec  d
    ld   d, $17
    jr   label_8103C
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EE
    rst  $28
    ld   a, [$FFF0]
    pop  af
    ld   a, [$FF00+C]
    di
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    push af
    or   $F6
    rst  $30
    ld    hl, sp+$F8
    ld   sp, hl
    ld   a, [$FBFA]
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction

label_81040::
    cp   $FE
    rst  $38
    nop
    nop
    ld   bc, label_202
    inc  bc
    inc  b
    inc  b
    dec  b
    ld   b, $06
    rlca
    ld   [label_908], sp
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    inc  c
    inc  c
    dec  c
    ld   c, $0E
    rrca
    db   $10 ; Undefined instruction
    ld   de, label_1212
    inc  de
    inc  d
    inc  d
    dec  d
    db   $ED ; Undefined instruction
    xor  $EE
    rst  $28
    ld   a, [$FFF0]
    pop  af
    pop  af
    ld   a, [$FF00+C]
    di
    di
    di
    db   $F4 ; Undefined instruction
    push af
    push af
    or   $F6
    rst  $30
    ld    hl, sp+$F8
    ld   sp, hl
    ld   sp, hl
    ld   a, [$FBFB]
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    cp   $FF
    rst  $38
    nop
    nop
    ld   bc, label_201
    inc  bc
    inc  bc
    inc  b
    inc  b
    dec  b
    ld   b, $06
    rlca

label_81090::
    rlca
    ld   [label_909], sp
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    inc  c
    inc  c
    dec  c
    dec  c
    ld   c, $0F
    rrca
    db   $10 ; Undefined instruction
    ld   de, label_1212
    inc  de
    ld   a, [$FFF1]
    pop  af
    ld   a, [$FF00+C]
    di
    di
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    push af
    push af
    or   $F6
    rst  $30
    rst  $30
    ld    hl, sp+$F8
    ld   sp, hl
    ld   sp, hl
    ld   a, [$FBFA]
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    rst  $38
    rst  $38
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    inc  b
    inc  b
    dec  b
    dec  b
    ld   b, $06
    rlca
    rlca
    ld   [label_908], sp
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    inc  c
    inc  c
    dec  c
    dec  c
    ld   c, $0E
    rrca
    rrca
    db   $10 ; Undefined instruction
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    push af
    push af
    or   $F6
    or   $F7
    rst  $30
    ld    hl, sp+$F8
    ld    hl, sp+$F9
    ld   sp, hl
    ld   a, [$FAFA]
    ei
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    rst  $38
    rst  $38
    nop
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    ld   b, $06
    rlca
    rlca
    rlca
    ld   [label_908], sp
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    dec  bc
    inc  c
    inc  c
    dec  c
    dec  c
    push af
    or   $F6
    or   $F7
    rst  $30
    rst  $30
    ld    hl, sp+$F8
    ld    hl, sp+$F9
    ld   sp, hl

label_81130::
    ld   sp, hl
    ld   a, [$FAFA]
    ei
    ei
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    cp   $FF
    rst  $38
    rst  $38
    nop
    nop
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    ld   b, $06
    ld   b, $07
    rlca
    rlca
    ld   [label_808], sp
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ei
    ei
    ei
    ei
    ld   a, [$FAFA]
    ld   a, [$FBFB]
    ei
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    cp   $FE
    rst  $38
    rst  $38

label_81180::
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   b, $06
    ld   b, $06
    rlca
    rlca
    rlca
    rlca
    ld   [$FB08], sp
    ei
    ei
    ei
    ei
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    cp   $FE
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
    ld   bc, $0101
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a

label_811D0::
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    cp   $FE
    cp   $FE
    cp   $FE
    cp   $FE
    rst  $38
    cp   $FF
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
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc

label_81224::
    inc  h
    ld   c, l
    ld   h, h
    ld   c, l
    and  h
    ld   c, l
    inc  h
    ld   c, [hl]
    and  h
    ld   c, [hl]
    db   $E4 ; Undefined instruction
    ld   c, [hl]
    ld   h, h
    ld   c, a
    and  h
    ld   c, a
    db   $E4 ; Undefined instruction
    ld   c, a
    ld   h, h
    ld   d, b
    and  h
    ld   d, b
    db   $E4 ; Undefined instruction
    ld   d, b
    inc  h
    ld   d, c
    ld   h, h
    ld   d, c
    and  h
    ld   d, c
    db   $E4 ; Undefined instruction
    ld   d, c
    db   $E4 ; Undefined instruction
    ld   c, h

label_81246::
    jr   z, label_81272
    inc  l
    inc  l
    ld   l, $2E
    jr   nc, label_8127E
    ld   sp, label_3333
    inc  [hl]
    dec  [hl]
    ld   [hl], $38
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, [$DB96]
    cp   $0A
    ret  nc
    ld   hl, $C17C
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    ld   d, $00
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_8127C
    ld   a, [$C17E]
    inc  a
    cp   $10
    jr   c, label_81279
    ld   a, $10
    ld   [$C17E], a
    ret

label_81279::
    ld   [$C17E], a

label_8127C::
    ld   a, [$C17E]
    ld   e, a
    ld   hl, label_81246
    add  hl, de
    ld   a, [hl]
    ld   [$FFD7], a
    sla  e
    ld   hl, label_81224
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   c, a

label_81290::
    ld   a, [$FF44]
    cp   $10
    jr   nz, label_81290

label_81296::
    ld   a, [$FF41]
    and  $03
    jr   nz, label_81296
    ld   hl, $FFD8
    ld   [hl], $01
    ld   a, [$FFFE]
    and  a
    jr   z, label_812A8
    ld   [hl], $03

label_812A8::
    ld   a, [$C17D]
    inc  a
    ld   [$C17D], a
    and  [hl]
    jr   nz, label_812A8
    ld   a, [$FFD7]
    ld   l, a
    ld   a, [$C17C]
    ld   e, a
    inc  a
    ld   [$C17C], a
    cp   $3A
    jr   z, label_812DC
    cp   l
    jr   c, label_812CE
    ld   a, [$FFFE]
    and  a
    jr   nz, label_812DC
    xor  a
    ld   [rBGP], a
    jr   label_81296

label_812CE::
    ld   hl, $0000
    add  hl, de
    add  hl, bc
    ld   a, [hl]
    ld   hl, $FF97
    add  a, [hl]
    ld   [rSCY], a
    jr   label_81296

label_812DC::
    ld   a, [$FF97]
    sub  a, $38
    ld   [rSCY], a

label_812E2::
    ld   a, [$FF44]
    cp   $48
    jr   c, label_812E2

label_812E8::
    ld   a, [$FF41]
    and  $03
    jr   nz, label_812E8
    ld   a, [$FF97]
    ld   [rSCY], a
    ld   a, [$DB97]
    ld   [rBGP], a
    ret
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
    ld   a, $98
    ld   [rBGPI], a
    ld   hl, rBGPD
    ld   b, $08

label_81311::
    ld   [hl], $FF
    ld   [hl], $7F
    dec  b
    jr   nz, label_81311
    ret

label_81319::
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    db   $10 ; Undefined instruction
    ld   [de], a
    nop
    inc  b
    ld   b, $06
    inc  b
    ld   [label_C0A], sp
    ld   c, $18
    ld   a, [bc]
    inc  e
    ld   c, $0A
    ld   [label_C0E], sp
    ld   a, [bc]
    jr   label_81342
    inc  e
    jr   nz, label_81359
    inc  h
    ld   h, $28
    ld   a, [hli]
    ld   a, [hli]
    jr   z, label_8136E
    ldd  [hl], a
    jr   nz, label_81363
    inc  [hl]

label_81342::
    ld   [hl], $24
    ld   h, $38
    db   $3A ; ldd  a, [hl]
    jr   z, label_81373
    db   $3A ; ldd  a, [hl]
    jr   c, label_81376
    jr   z, label_8138E
    ld   b, b
    ld   b, d
    ld   b, d
    ld   b, h
    ld   b, [hl]
    ld   c, b
    ld   c, d
    ld   c, h
    ld   c, [hl]
    ld   d, b
    ld   d, d

label_81359::
    ld   c, [hl]
    ld   c, h
    ld   d, d
    ld   d, b
    add  a, b
    ld   [bc], a
    add  a, d
    nop
    add  a, h
    add  a, [hl]

label_81363::
    adc  a, b
    adc  a, d
    adc  a, h
    adc  a, [hl]
    sub  a, b
    sub  a, d
    sub  a, h
    sub  a, [hl]
    sbc  a, b
    sbc  a, d
    sbc  a, h

label_8136E::
    sbc  a, [hl]
    sbc  a, d
    and  d
    and  h
    ld   [label_CA6], sp
    xor  b

label_81376::
    xor  d
    xor  h
    xor  [hl]
    or   b
    or   d
    or   h
    or   [hl]
    or   b
    or   d
    or   h
    or   [hl]
    inc  b
    ret  nz
    ld   b, $C2
    ld   e, d
    ld   e, b
    ld   e, [hl]
    ld   e, h
    ld   e, b
    ld   e, d
    ld   e, h
    ld   e, [hl]
    ld   b, h

label_8138E::
    ld   b, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   b, b
    ld   b, b
    ld   d, [hl]
    ld   d, [hl]
    ld   a, d
    ld   a, b
    ld   a, [hl]
    ld   a, h
    ld   a, b
    ld   a, d
    ld   a, h
    ld   a, [hl]
    ld   [hl], h
    db   $76 ; Halt
    db   $76 ; Halt
    ld   [hl], h
    ld   [hl], b
    ld   [hl], d
    ld   [hl], d
    ld   [hl], b
    jp   z, label_D6C8
    call nc, label_CAC8
    call nc, label_CCD6
    adc  a, $D8
    jp  c, label_C4C4
    add  a, $C6
    call c, label_DEDC
    sbc  a, $EA
    db   $EC ; Undefined instruction
    xor  $F0
    ld   a, [$FF00+C]
    or   $F6
    ld    hl, sp+$FA
    ld   [$FFE2], a
    db   $E4 ; Undefined instruction
    and  $E8
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    inc  d
    ld   d, $18
    inc  e
    ld   [de], a
    db   $10 ; Undefined instruction
    inc  d
    inc  e
    jr   label_8143C
    ld   l, b
    ld   l, d
    ld   l, h
    ld   l, b
    ld   h, [hl]
    ld   l, b
    ld   h, [hl]
    ld   l, h
    ld   l, d
    ld   h, [hl]
    ld   l, b
    ld   h, b
    ld   h, b
    ld   h, d
    ld   h, d
    ld   h, h
    ld   h, h
    ld   h, d
    ld   h, d
    ld   h, h
    ld   h, h
    ld   h, b
    ld   h, b
    ld   d, h
    ld   d, h
    inc  a
    ld   a, $FE
    cp   $18
    ld   a, [de]
    inc  e
    ld   e, $2C
    ld   l, $B8
    cp   d
    ld   l, $2C
    cp   d
    cp   b
    cp   h
    cp   [hl]
    ret  nc
    jp   nc, label_FCA0
    db   $FC ; Undefined instruction
    and  b

label_81407::
    nop
    nop
    jr   nz, label_8142B
    nop
    nop
    nop
    jr   nz, label_81410

label_81410::
    nop
    jr   nz, label_81433
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_8143D
    jr   nz, label_8143F
    jr   nz, label_81441
    jr   nz, label_81443
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_8144B

label_8142B::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_81433::
    nop
    nop
    nop
    nop
    jr   nz, label_81459
    jr   nz, label_8145B
    nop

label_8143C::
    jr   nz, label_8143E

label_8143E::
    jr   nz, label_81440

label_81440::
    nop

label_81441::
    nop
    nop

label_81443::
    nop
    nop
    nop
    nop
    jr   nz, label_81469
    jr   nz, label_8146B

label_8144B::
    nop
    nop
    nop
    jr   nz, label_81450

label_81450::
    nop
    nop
    nop
    nop

label_81454::
    nop
    nop
    nop
    nop
    nop

label_81459::
    nop
    nop

label_8145B::
    nop
    nop
    jr   nz, label_8145F

label_8145F::
    nop
    jr   nz, label_81462

label_81462::
    jr   nz, label_81464

label_81464::
    nop
    nop
    nop
    nop
    nop

label_81469::
    nop
    nop

label_8146B::
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_81473

label_81473::
    jr   nz, label_81495
    jr   nz, label_81497
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_81480

label_81480::
    jr   nz, label_81482

label_81482::
    jr   nz, label_814A4
    jr   nz, label_814A6
    jr   nz, label_81488

label_81488::
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_814AF
    nop
    nop
    jr   nz, label_814B3
    jr   nz, label_814B5

label_81495::
    jr   nz, label_814B7

label_81497::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_814A2

label_814A2::
    jr   nz, label_814A4

label_814A4::
    jr   nz, label_814A6

label_814A6::
    jr   nz, label_814A8

label_814A8::
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_814B0

label_814B0::
    nop
    nop
    nop

label_814B3::
    nop
    nop

label_814B5::
    nop
    jr   nz, label_814B8

label_814B8::
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_814DF
    jr   nz, label_814E1
    jr   nz, label_814E3
    nop
    nop
    nop
    nop
    ld   h, b
    ld   h, b
    jr   nz, label_814EB
    jr   nz, label_814ED
    ld   b, b
    ld   b, b
    nop
    jr   nz, label_814D2

label_814D2::
    jr   nz, label_814D4

label_814D4::
    jr   nz, label_81516
    ld   h, b
    ld   b, b
    ld   h, b
    ld   b, b
    ld   h, b
    nop
    jr   nz, label_814DE

label_814DE::
    nop

label_814DF::
    nop
    jr   nz, label_814E2

label_814E2::
    nop

label_814E3::
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_8150B

label_814EB::
    jr   nz, label_8150D

label_814ED::
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_81515
    ld   a, [$FF9D]
    cp   $FF
    ret  z
    ld   hl, label_81319
    sla  a
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   e, [hl]
    push hl
    ld   hl, label_81407
    add  hl, bc
    ld   a, [$C11D]
    and  $98
    or   [hl]
    ld   [$C11D], a
    inc  hl
    ld   a, [$C11E]

label_81516::
    and  $98
    or   [hl]
    ld   [$C11E], a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, label_81800
    add  hl, de
    ld   c, l
    ld   b, h
    ld   hl, $8000
    ld   d, $20
    call label_1D0A
    pop  hl
    inc  hl
    ld   e, [hl]
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, label_81800
    add  hl, de
    ld   c, l
    ld   b, h
    ld   hl, $8020
    ld   d, $20
    call label_1D0A
    ret

label_81560::
    ld   [label_A08], sp
    ld   a, [bc]

label_81564::
    ld   bc, $F0FF
    stop
    nop
    inc  bc
    nop

label_8156C::
    ld   bc, $E01F
    jr   nz, label_8158F
    rst  $38
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    and  $02
    jr   nz, label_8157E
    ld   e, $DF

label_8157E::
    ld   hl, label_81560
    add  hl, bc
    ld   a, [hl]
    ld   [$C128], a
    ld   a, [$C129]
    and  $01
    jr   z, label_81598
    ld   hl, label_81564
    add  hl, bc
    ld   a, [$C12A]
    add  a, [hl]
    ld   [$C12A], a

label_81598::
    ld   hl, label_8156C
    add  hl, bc
    ld   a, [$C127]
    add  a, [hl]
    rr   d
    and  e
    ld   [$C127], a
    ld   hl, label_81568
    add  hl, bc
    ld   a, [$C126]
    rl   d
    adc  a, [hl]
    and  $03
    ld   [$C126], a
    ld   a, [$C129]
    dec  a
    ld   [$C129], a
    jr   nz, label_815C1
    jp   label_815C2

label_815C1::
    ret

label_815C2::
    ld   a, [$C124]
    inc  a
    ld   [$C124], a
    ret
    ld   a, [$FFA8]
    and  a
    jr   z, label_815F0
    ld   a, [$C16B]
    cp   $03
    jr   nz, label_815F0
    ld   a, [$C16C]
    and  $03
    cp   $03
    jr   nz, label_815F0
    ld   hl, $FFA9
    ld   a, [hl]
    inc  hl
    or   [hl]
    jr   z, label_815F0
    ld   a, [$FFA8]
    and  $FC
    or   $01
    ld   [$FFA8], a
    ret

label_815F0::
    ld   hl, $C16C
    inc  [hl]
    ld   a, [hl]
    and  $03
    jr   nz, label_8162E
    ld   hl, $C16B
    ld   a, [hl]
    cp   $04
    jr   z, label_8162E
    inc  [hl]
    xor  a
    ld   [$FFD7], a

label_81605::
    ld   a, [$FFD7]
    cp   $03
    jr   z, label_8162E
    ld   hl, $DB97
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    ld   c, a
    ld   b, $00

label_81616::
    ld   a, c
    and  $03
    jr   z, label_8161C
    dec  c

label_8161C::
    rrc  c
    rrc  c
    inc  b
    ld   a, b
    cp   $04
    jr   nz, label_81616
    ld   a, c
    ld   [hl], a
    ld   hl, $FFD7
    inc  [hl]
    jr   label_81605

label_8162E::
    ret

label_8162F::
    nop
    ld   bc, label_302
    nop
    inc  bc
    ld   bc, $0000
    ld   bc, label_302
    ld   hl, $C16C
    inc  [hl]
    ld   a, [$C16C]
    and  $03
    jr   nz, label_8168A
    ld   hl, $C16B

label_81649::
    ld   a, [hl]
    inc  [hl]

label_8164B::
    cp   $04
    jr   z, label_8168A
    xor  a
    ld   [$FFD7], a

label_81652::
    ld   a, [$FFD7]
    cp   $03
    jr   z, label_8168A
    ld   hl, $DB97
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    push hl
    ld   c, a
    ld   b, $00

label_81664::
    ld   a, [$FFD7]
    sla  a
    sla  a
    or   b
    ld   e, a
    ld   hl, label_8162F
    add  hl, de
    ld   a, c
    and  $03
    cp   [hl]
    jr   z, label_81677
    inc  c

label_81677::
    rrc  c
    rrc  c
    inc  b
    ld   a, b
    cp   $04
    jr   nz, label_81664
    ld   a, c
    pop  hl
    ld   [hl], a
    ld   hl, $FFD7
    inc  [hl]
    jr   label_81652

label_8168A::
    ret
    daa
    ld   l, d
    ld   l, h
    ld   hl, label_2322
    inc  h
    dec  h
    ld   h, $6A
    rst  $38
    ld   l, h
    ld   l, d
    ld   l, h
    ld   l, d
    ld   l, h
    ld   h, l
    ld   h, l
    ld   h, [hl]
    ld   sp, label_3332
    inc  [hl]
    dec  [hl]
    ld   [hl], $67
    ld   l, b
    ld   h, h
    ld   h, a
    ld   l, c
    ld   h, l
    ld   h, [hl]
    ld   b, b
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    ld   a, [label_823FA]
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   h, b
    rst  $38
    ld   a, [label_80948]
    ld   c, d
    ld   a, [$FFFA]
    ld   h, d
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    rst  $38
    nop
    ld   bc, $0100
    ld   a, [label_81EFF]
    ld   e, a
    inc  b
    dec  b
    ld   b, $07
    jr   z, label_81702
    add  hl, hl
    ld   a, [hli]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   a, [label_82EFA]
    ld   l, a
    inc  d
    dec  d
    ld   d, $17
    jr   c, label_81709
    jr   nz, label_81725
    nop
    ld   bc, $0100
    ei
    rst  $38
    cp   $FE
    ld   [label_A09], sp
    dec  bc
    jr   c, label_81719
    jr   nz, label_81735
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ei
    ei
    cp   $FE
    jr   label_8171E
    ld   a, [de]
    dec  de
    ld   c, b
    ld   c, c

label_81709::
    ld   c, c
    ld   c, d
    ei
    rst  $38
    inc  c
    dec  c
    ld   b, b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   a, [$FFFA]
    ld   e, b
    ld   c, $0F

label_81719::
    ld   a, [$FBFA]
    ei
    inc  e

label_8171E::
    dec  e
    ld   a, [$FAFA]
    ld   a, [$FAFA]

label_81725::
    ld   a, [label_1E5D]
    rra
    ld   a, [label_CFA]
    dec  c
    inc  c
    dec  c
    ei
    ei
    jr   z, label_8175D
    ld   a, [$FAFA]
    ld   e, b
    dec  l
    ld   l, $2E
    cpl
    inc  e
    dec  e
    inc  e
    dec  e
    ei
    ld   d, [hl]
    ld   h, c
    ld   c, d
    ld   a, [label_819FA]
    ld   e, d
    dec  a
    ld   a, $3E
    ccf
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ei
    ei
    ei
    jr   z, label_8177E
    ld   e, e

label_81756::
    ld   a, [rIE]
    ld   d, h
    ld   d, h
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction

label_8175D::
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ei
    rst  $38
    ei
    jr   c, label_81795
    db   $3A ; ldd  a, [hl]
    ld   a, [rIE]
    ld   d, h
    ld   d, h
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ei
    ld   c, b
    cp   $4A
    ld   a, [label_81756]
    ld   d, h
    ld   d, h
    inc  bc
    ld   [de], a
    inc  de

label_8177E::
    ld   [de], a
    inc  de
    ld   [bc], a
    rst  $38
    ei
    ld   e, h
    dec  hl
    ld   a, [$FAFA]
    ld   a, [label_81454]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc

label_81795::
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_400
    inc  b
    inc  b
    inc  b
    nop
    ld   bc, label_404
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   bc, $0000
    nop
    nop
    nop
    ld   [bc], a
    ld   bc, label_401
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_401
    ld   b, $04
    inc  b
    inc  b
    rlca
    rlca
    inc  b
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    inc  b
    ld   b, $04
    inc  b
    inc  b
    rlca
    rlca
    inc  b
    nop
    nop
    nop
    nop
    nop

label_81800::
    nop
    ld   bc, label_401
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    ld   bc, label_202
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    inc  b
    ld   [bc], a
    rlca
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
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
    nop
    nop
    rlca
    rlca
    ld   bc, $0001
    nop
    inc  b
    inc  b
    nop
    nop
    nop
    inc  b
    dec  b
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    ld   bc, $0001
    inc  b
    inc  b
    inc  b
    nop
    nop
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    nop
    rlca
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    ld   [bc], a
    nop
    inc  b
    inc  b
    inc  b
    nop
    nop
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    nop
    inc  b
    inc  b
    inc  b
    nop
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    rlca
    nop
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   a, $8B
    ld   [$FFE1], a
    ld   a, $56
    ld   [$FFE2], a
    xor  a
    ld   [$FFE3], a
    call label_818AD
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, $8B
    ld   [$FFE1], a
    ld   a, $57
    ld   [$FFE2], a
    ld   hl, $FFE3
    inc  [hl]
    call label_818AD
    ret

label_818AD::
    ld   de, $9822
    ld   bc, $0000

label_818B3::
    ld   a, [$C5A2]
    and  a
    jr   nz, label_818CB
    ld   a, [$DB95]
    cp   $01
    jr   z, label_818CB
    ld   hl, $D800
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   a, $2C
    jr   z, label_818D3

label_818CB::
    ld   a, [$FFE1]
    ld   l, a
    ld   a, [$FFE2]
    ld   h, a
    add  hl, bc
    ld   a, [hl]

label_818D3::
    ld   h, a
    ld   a, [$FFE3]
    and  a
    jr   z, label_818EA
    ld   a, $01
    ld   [rVBK], a
    ld   a, h
    cp   $2C
    jr   nz, label_818E4
    ld   a, $01

label_818E4::
    ld   [de], a
    xor  a
    ld   [rVBK], a
    jr   label_818EC

label_818EA::
    ld   a, h
    ld   [de], a

label_818EC::
    inc  c
    jr   z, label_81903
    inc  e
    ld   a, e
    and  $1F
    cp   $12
    jr   nz, label_81901
    ld   a, e
    and  $E0
    add  a, $22
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a

label_81901::
    jr   label_818B3

label_81903::
    ret
    ld   a, [$DB96]
    rst  0
    ldi  [hl], a
    ld   e, c
    ld   b, e
    ld   e, c
    ret  nc
    ld   e, c
    db   $FD ; Undefined instruction
    ld   e, d
    dec  h
    ld   e, l
    ld   d, d
    ld   e, l
    ld   a, [de]
    ld   e, [hl]
    rst  $28
    ld   e, [hl]
    call nz, label_8363
    ld   h, l
    xor  b
    ld   h, l
    cp   b
    ld   h, l
    jp   nc, label_F065
    cp   $A7
    jr   z, label_81940
    ld   hl, $DC10
    ld   c, $80
    di

label_8192D::
    xor  a
    ld   [rSVBK], a
    ld   b, [hl]
    ld   a, $03
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_8192D
    xor  a
    ld   [rSVBK], a
    ei

label_81940::
    call label_82683
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_81969
    xor  a
    ld   [$C14F], a
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a
    xor  a
    ld   [$DE06], a
    ld   [$DE07], a
    ld   [$DE08], a
    ld   [$DE09], a
    call label_82683

label_81969::
    ret

label_8196A::
    sbc  a, h
    xor  d
    add  a, c
    ld   b, $06
    sbc  a, h
    xor  h
    add  a, c
    ld   b, $06
    sbc  a, h
    xor  [hl]
    add  a, c
    ld   b, $06
    sbc  a, h
    or   b
    add  a, c
    ld   b, $06
    sbc  a, h
    or   d
    add  a, c
    ld   b, $06
    sbc  a, h
    ld   [hl], c
    add  a, c
    inc  bc
    inc  bc
    nop

label_81989::
    sbc  a, h
    xor  h
    add  a, c
    inc  b
    inc  b
    sbc  a, h
    xor  [hl]
    add  a, c
    inc  bc
    inc  bc
    nop

label_81994::
    sbc  a, h
    ld   l, d
    add  a, e
    sub  a, h
    sub  a, l
    ret  nz
    pop  bc
    sbc  a, h
    ld   l, h
    add  a, e
    and  b
    and  c
    jp   nz, label_9CC3
    ld   l, [hl]
    add  a, e
    sbc  a, d
    sbc  a, e
    call nz, label_9CC5
    ld   l, a
    add  a, c
    sbc  a, h
    sbc  a, l
    sbc  a, h
    or   b
    add  a, c
    add  a, $C7
    sbc  a, h
    ld   [hl], c
    add  a, c
    sbc  a, [hl]
    sbc  a, a
    sbc  a, h
    or   d
    add  a, c
    jp   z, label_9CCB
    sub  a, d
    ld   bc, label_83F7F
    sbc  a, h
    db   $D3 ; Undefined instruction
    nop
    ld   a, a
    nop

label_819C7::
    inc  bc
    ld   a, [bc]
    ld   de, label_522
    inc  c
    inc  de
    dec  e
    daa
    ld   hl, $D601
    ld   bc, label_81994
    ld   e, $33

label_819D8::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_819D8
    ld   a, [$FFFE]
    and  a
    jr   z, label_81A23
    ld   hl, $DC91
    ld   bc, label_8196A
    ld   e, $1F

label_819EB::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_819EB
    ld   a, $1E
    ld   [$DC90], a
    ld   a, [$DBA5]
    and  a

label_819FA::
    jr   z, label_81A23
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_81A06
    cp   $0A
    jr   nc, label_81A23

label_81A06::
    ld   hl, $DC91
    ld   a, [$DC90]
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   bc, label_81989
    ld   e, $0B

label_81A15::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_81A15
    ld   a, [$DC90]
    add  a, $0A
    ld   [$DC90], a

label_81A23::
    ld   de, $DB0C
    ld   bc, $0000

label_81A29::
    ld   a, c
    cp   $02
    jr   nz, label_81A34
    ld   a, [$DB7F]
    and  a
    jr   nz, label_81A57

label_81A34::
    ld   a, c
    cp   $04
    jr   nz, label_81A4F
    ld   de, $DB11
    ld   a, [$DBA5]
    and  a
    jr   z, label_81A4F
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_81A4C
    cp   $0A
    jr   nc, label_81A4F

label_81A4C::
    ld   de, $DBCC

label_81A4F::
    ld   a, [de]
    cp   $FF
    jr   z, label_81A57
    and  a
    jr   nz, label_81A75

label_81A57::
    push de
    ld   hl, label_819C7
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    ld   a, $7F
    ldi  [hl], a
    ldi  [hl], a
    ld   a, c
    cp   $02
    jr   nz, label_81A74
    ld   de, $0005
    add  hl, de
    ld   a, $7F
    ldi  [hl], a
    ld   [hl], a

label_81A74::
    pop  de

label_81A75::
    inc  de
    inc  c
    ld   a, c
    cp   $09
    jr   nz, label_81A29
    ld   hl, $D601
    ld   de, $002C
    add  hl, de
    ld   a, [$DB0F]
    and  a
    jr   z, label_81A97
    ld   e, a
    swap a
    and  $0F
    add  a, $B0
    ldi  [hl], a
    ld   a, e
    and  $0F
    add  a, $B0
    ldi  [hl], a

label_81A97::
    ld   hl, $D601
    ld   de, $0031
    add  hl, de
    ld   a, [$DBA5]
    and  a
    jr   z, label_81AD1
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_81AAE
    cp   $0A
    jr   nc, label_81AD1

label_81AAE::
    ld   a, [$DBD0]
    and  a
    jr   z, label_81ADE
    push af
    push hl
    ld   b, $00
    ld   a, [$DC90]
    ld   c, a
    ld   hl, $DC91
    add  hl, bc
    ld   a, l
    sub  a, $11
    ld   l, a
    ld   a, h
    sbc  a, $00
    ld   h, a
    ld   [hl], $01
    inc  hl
    ld   [hl], $01
    pop  hl
    pop  af
    jr   label_81ADB

label_81AD1::
    ld   a, [$DB15]
    and  a
    jr   z, label_81ADE
    cp   $06
    jr   nc, label_81ADE

label_81ADB::
    add  a, $B0
    ld   [hl], a

label_81ADE::
    ld   a, $32
    ld   [$D600], a
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a
    jp   label_81D34

label_81AEE::
    nop
    dec  b
    ld   [bc], a
    dec  b
    dec  b
    ld   b, $06
    dec  b
    dec  b
    dec  b
    ld   b, $01
    ld   [bc], a
    ld   [bc], a
    dec  b
    ld   a, [$FFFE]
    and  a
    jr   z, label_81B3D
    ld   b, $00
    ld   a, [$DB0E]
    ld   c, a
    ld   hl, label_81AEE
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   a, $9C
    ld   [$DC91], a
    ld   [$DC95], a
    ld   a, $6E
    ld   [$DC92], a
    ld   a, $8E
    ld   [$DC96], a
    ld   a, $41
    ld   [$DC93], a
    ld   [$DC97], a
    ld   a, [$FFD7]
    ld   [$DC94], a
    ld   [$DC98], a
    xor  a
    ld   [$DC99], a
    ld   a, [$DC90]
    add  a, $08
    ld   [$DC90], a

label_81B3D::
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a
    call label_82683
    ret

label_81B49::
    ld   a, [$FFD8]
    cp   $09
    jr   z, label_81B8B
    cp   $0C
    jr   z, label_81B80
    dec  a
    jr   z, label_81B73
    dec  a
    jr   z, label_81BA5
    dec  a
    jr   z, label_81B69
    dec  a
    jr   z, label_81B6E
    dec  a
    jr   z, label_81BA0

label_81B62::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ret

label_81B69::
    ld   a, [$DB43]
    jr   label_81B76

label_81B6E::
    ld   a, [$DB44]
    jr   label_81B76

label_81B73::
    ld   a, [$DB4E]

label_81B76::
    add  a, $B0
    ld   c, a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, c
    inc  de
    ldi  [hl], a
    ret

label_81B80::
    ld   a, [$DB4B]
    and  a
    jr   nz, label_81B62
    ld   a, [$DB4C]
    jr   label_81BA8

label_81B8B::
    ld   a, [$DB49]
    and  a
    jp   z, label_81B62
    ld   a, [$DB4A]
    inc  a
    swap a
    call label_81BA8
    dec  hl
    ld   [hl], $7F
    inc  hl
    ret

label_81BA0::
    ld   a, [$DB45]
    jr   label_81BA8

label_81BA5::
    ld   a, [$DB4D]

label_81BA8::
    push af
    and  $0F
    add  a, $B0
    ld   c, a
    pop  af
    swap a
    and  $0F
    add  a, $B0
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    ret

label_81BB9::
    push bc
    ld   a, [$DC90]
    ld   e, a
    ld   d, $00
    ld   hl, $DC91
    add  hl, de
    add  a, $05
    ld   [$DC90], a
    push hl
    sla  c
    ld   hl, label_81C84
    add  hl, bc
    push hl
    pop  de
    pop  hl
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    push hl
    ld   a, [$FFD8]
    sla  a
    ld   c, a
    ld   hl, label_81C14
    add  hl, bc
    push hl
    pop  de
    pop  hl
    cp   $06
    jr   nz, label_81BF9
    ld   a, [$DB43]
    cp   $02
    jr   nz, label_81BF9
    ld   a, $02
    ldi  [hl], a
    ldi  [hl], a
    jr   label_81C10

label_81BF9::
    cp   $18
    jr   nz, label_81C0B
    ld   a, [$DB4B]

label_81C00::
    and  a
    jr   z, label_81C0B
    ld   a, $02
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    jr   label_81C10

label_81C0B::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a

label_81C10::
    xor  a
    ld   [hl], a
    pop  bc
    ret

label_81C14::
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_303
    ld   bc, label_202
    ld   bc, label_303
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_303
    ld   [bc], a
    ld   [bc], a

label_81C30::
    ld   a, a
    ld   a, a
    ld   a, a

label_81C33::
    ld   a, a
    ld   a, a
    ld   a, a
    add  a, h
    ld   a, a
    ld   a, a
    add  a, l
    cp   d
    ld   a, a
    add  a, b
    ld   a, a
    ld   a, a
    add  a, c
    ld   a, a
    ld   a, a
    add  a, d
    ld   a, a
    ld   a, a
    add  a, e
    cp   d
    ld   a, a
    add  a, [hl]
    ld   a, a
    ld   a, a
    add  a, a
    cp   d
    ld   a, a
    adc  a, b
    ld   a, a
    ld   a, a
    adc  a, c
    ld   a, a
    ld   a, a
    adc  a, d
    ld   a, a
    ld   a, a
    adc  a, e
    ld   a, a
    ld   a, a
    adc  a, h
    ld   a, a
    ld   a, a
    adc  a, l
    ld   a, a
    ld   a, a
    sbc  a, b
    ld   a, a
    ld   a, a
    sbc  a, c
    ld   a, a
    ld   a, a
    sub  a, b
    ld   a, a
    ld   a, a
    sub  a, c
    ld   a, a
    ld   a, a
    sub  a, d
    ld   a, a
    ld   a, a
    sub  a, e
    ld   a, a
    ld   a, a
    sub  a, [hl]
    ld   a, a
    ld   a, a
    sub  a, a
    ld   a, a
    ld   a, a
    adc  a, [hl]
    ld   a, a
    ld   a, a
    adc  a, a
    ld   a, a
    ld   a, a
    and  h
    ld   a, a
    ld   a, a
    and  l
    ld   a, a
    ld   a, a

label_81C84::
    sbc  a, h
    ld   bc, label_69C
    sbc  a, h
    ld   h, c
    sbc  a, h
    ld   h, l
    sbc  a, h
    pop  bc
    sbc  a, h
    push bc
    sbc  a, l
    ld   hl, label_259D
    sbc  a, l
    add  a, c
    sbc  a, l
    add  a, l
    sbc  a, l
    pop  hl
    sbc  a, l
    push hl

label_81C9C::
    push de
    push bc
    ld   hl, $DB00
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    sla  a
    ld   e, a
    sla  a
    add  a, e
    ld   [$FFD7], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_81CB5
    call label_81BB9

label_81CB5::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $0C
    ld   [$D600], a
    push hl
    sla  c
    ld   hl, label_81C84
    add  hl, bc
    push hl
    pop  de
    pop  hl
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    push hl
    ld   a, [$FFD7]
    ld   c, a
    ld   hl, label_81C30
    add  hl, bc
    push hl
    pop  de
    pop  hl
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    pop  bc
    push bc
    push hl
    sla  c
    ld   hl, label_81C84
    add  hl, bc
    push hl
    pop  de
    pop  hl
    inc  de
    inc  hl
    ld   a, [de]
    add  a, $20
    ld   [hl], a
    dec  de
    dec  hl
    ld   a, [de]
    inc  de
    inc  de
    adc  a, $00
    ldi  [hl], a
    inc  hl
    ld   a, $02
    ldi  [hl], a
    push hl
    ld   a, [$FFD7]
    ld   c, a
    ld   hl, label_81C33
    add  hl, bc
    push hl
    pop  de
    pop  hl
    ld   a, [de]
    inc  de
    ldi  [hl], a
    call label_81B49
    xor  a
    ld   [hl], a
    pop  bc
    pop  de
    dec  c
    ld   a, c
    cp   e
    jp   nz, label_81C9C
    ret
    ld   a, [$C154]
    ld   c, a
    ld   b, $00
    ld   e, $FF
    call label_81C9C
    xor  a
    ld   [$C154], a

label_81D34::
    call label_82683
    call label_28CF
    ld   a, $20
    call label_AB5
    xor  a
    ld   [$D600], a
    ld   [$D601], a
    ld   [$DC90], a
    ld   [$DC91], a
    ld   a, [$D6FD]
    ld   [rLCDC], a
    ret
    call label_28CF
    call label_3FD1
    ld   a, [$D6FD]
    ld   [rLCDC], a
    call label_82683
    ret

label_81D61::
    rst  $38
    ld   d, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   d, a
    ld   sp, $C552
    jr   z, label_81D70

label_81D70::
    nop
    rst  $38
    ld   d, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   d, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   d, a
    xor  [hl]
    ld   a, [hl]
    nop
    ld   a, h
    nop
    nop
    rst  $38
    ld   d, a
    rst  $38
    ld   a, a
    ld   b, d
    ld   b, $00
    nop
    rst  $38
    ld   d, a
    cp   e
    ld   [de], a
    ld   d, c
    ld   bc, $0000
    rst  $38
    ld   d, a
    ld   [bc], a
    dec  hl
    nop
    ld   a, [bc]
    nop
    nop
    rst  $38
    ld   d, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   c, [hl]
    nop
    ld   a, h
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   c, [hl]
    nop
    ld   a, h
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   c, [hl]
    nop
    ld   a, h
    nop
    nop
    ld   sp, rHDMA2
    ld   a, a
    nop
    ld   a, h
    rst  $18
    ld   a, [de]
    ld   a, l
    jr   label_81DC8

label_81DC8::
    nop
    nop
    ld   a, h
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   a, a
    nop
    ld   a, h
    nop
    nop
    rra
    nop
    rst  $38
    ld   a, a
    nop
    ld   a, h
    nop
    nop
    nop
    ld   a, h
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    ld   b, d
    ld   b, $BE
    rrca
    inc  de
    ld   [bc], a
    ld   a, a
    rrca
    ld   [$FF09], a
    rst  $18
    ldd  [hl], a
    ld   a, l
    jr   label_81DF1
    ld   a, a
    dec  a
    ld   [label_83EAE], sp
    nop
    ld   a, h
    rst  $38
    ld   a, a

label_81DFB::
    ld   sp, $E152
    ld   e, l
    push hl

label_81E00::
    ld   e, l
    jp   hl
    ld   e, l
    db   $ED ; Undefined instruction
    ld   e, l
    pop  af
    ld   e, l
    push af
    ld   e, l
    ld   sp, hl
    ld   e, l

label_81E0B::
    nop
    ld   bc, label_700
    ld   [bc], a
    nop
    nop
    inc  bc
    inc  b
    dec  b
    nop
    nop
    nop
    nop
    ld   b, $AF
    ld   [$DB9A], a
    ld   a, $01
    ld   [$DDD5], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_81E6D
    ld   bc, label_81D61
    ld   hl, $DC10
    di
    ld   a, $02
    ld   [rSVBK], a

label_81E33::
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, l
    cp   $90
    jr   nz, label_81E33
    xor  a
    ld   [rSVBK], a
    ei
    ld   hl, label_81E0B
    ld   a, [$DB0E]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_81E6D
    sla  a
    ld   e, a
    ld   hl, label_81DFB
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $DC3A
    ld   c, $04
    di
    ld   a, $02
    ld   [rSVBK], a

label_81E61::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    ld   a, c
    and  a
    jr   nz, label_81E61
    xor  a
    ld   [rSVBK], a
    ei

label_81E6D::
    xor  a
    ld   [$C16B], a
    call label_82683
    ret

label_81E75::
    add  a, b
    ld   h, $00
    ld   de, label_3A20
    ld   [rNR23], a
    and  b
    ld   d, c
    ret  nz
    jr   nz, label_81E8A
    ld   a, l
    add  a, h
    inc  [hl]
    xor  l
    ld   a, h
    ld   b, [hl]
    jr   nc, label_81EDA

label_81E8A::
    ld   e, h
    daa
    jr   z, label_81EA0
    ld   b, b
    ld   [label_151C], sp
    jr   nc, label_81E9D
    inc  d
    rla
    inc  d
    add  hl, bc
    nop
    rst  $10
    inc  b
    ld   l, d
    inc  b

label_81E9D::
    scf
    dec  b
    adc  a, d

label_81EA0::
    inc  b
    sub  a, a
    add  hl, bc
    xor  d
    inc  b
    push af
    add  hl, bc
    ret
    inc  b
    db   $10 ; Undefined instruction
    rst  $20
    inc  b
    ld   c, e
    ld   b, $05
    dec  b
    and  b
    ld   [bc], a
    jr   nz, label_81EB6

label_81EB5::
    ld   a, [$FFFE]
    and  a
    jr   z, label_81EEE
    ld   a, [$DE07]
    ld   c, a
    ld   a, [$DE06]
    inc  a
    ld   [$DE06], a
    cp   $08
    jr   c, label_81ED6
    xor  a
    ld   [$DE06], a
    ld   a, c
    add  a, $04
    and  $3C
    ld   [$DE07], a
    ld   c, a

label_81ED6::
    ld   b, $00
    ld   hl, label_81E75
    add  hl, bc
    ld   bc, $DC4A
    ld   e, $04

label_81EE1::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    ld   a, e
    and  a
    jr   nz, label_81EE1
    ld   a, $01
    ld   [$DDD1], a

label_81EEE::
    ret
    call label_8235C
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_81EFF
    call label_82683

label_81EFF::
    ret

label_81F00::
    nop
    ld   bc, $00FF
    cp   $02

label_81F06::
    ld   a, [$DBA3]
    ld   [$C1B6], a
    ld   a, [$C1B8]
    ld   hl, $C1B9
    or   [hl]
    jr   nz, label_81F59
    ld   a, [$C1B5]
    and  a
    jr   nz, label_81F38
    ld   a, [$FFCC]
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_81F00
    add  hl, de
    ld   a, [$DBA3]
    add  a, [hl]
    cp   $0A
    jr   c, label_81F35
    rla
    ld   a, $00
    jr   nc, label_81F35
    ld   a, $09

label_81F35::
    ld   [$DBA3], a

label_81F38::
    ld   a, [$FFCC]
    srl  a
    srl  a
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_81F03
    add  hl, de
    ld   a, [$DBA3]
    add  a, [hl]
    cp   $0A
    jr   c, label_81F56
    rla
    ld   a, $00
    jr   nc, label_81F56
    ld   a, $09

label_81F56::
    ld   [$DBA3], a

label_81F59::
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_81F69
    ld   a, [$C1B5]
    and  a
    jr   nz, label_81F69
    xor  a
    ld   [$C159], a

label_81F69::
    ld   a, [$C1B5]
    and  a
    jr   z, label_81F85
    ld   a, [$C1B8]
    ld   hl, $C1B9
    or   [hl]
    jr   nz, label_81F85
    ld   a, [$FFCC]
    and  $80
    jr   z, label_81F85
    ld   a, $01
    ld   [$C1BA], a
    jr   label_81FB2

label_81F85::
    ld   a, [$DBA3]
    ld   hl, $C1B6
    cp   [hl]
    jr   z, label_81FC1
    ld   hl, $FFF2
    ld   [hl], $0A
    ld   e, a
    ld   d, $00
    ld   hl, $DB02
    add  hl, de
    ld   a, [hl]
    cp   $09
    jr   nz, label_81FB2
    ld   a, [$DB49]
    and  a
    jr   z, label_81FB2
    ld   a, $08
    ld   [$FF90], a
    ld   a, $10
    ld   [$C1B8], a
    ld   a, $01
    jr   label_81FBE

label_81FB2::
    ld   a, [$C1B5]
    and  a
    jr   z, label_81FC1
    ld   a, $10
    ld   [$C1B9], a
    xor  a

label_81FBE::
    ld   [$C1B5], a

label_81FC1::
    ld   hl, $C1B9
    ld   a, [$C1B8]
    or   [hl]
    jp   nz, label_8204A
    ld   a, [$FFCC]
    and  $10
    jr   z, label_81FED
    ld   a, [$DB01]
    push af
    ld   hl, $DB02
    ld   a, [$DBA3]

label_81FDB::
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   a, [hl]
    ld   [$DB01], a
    pop  af
    ld   [hl], a
    ld   c, $01
    ld   b, $00
    ld   e, $00
    jr   label_8200D

label_81FED::
    ld   a, [$FFCC]
    and  $20
    jr   z, label_8204A
    ld   a, [$DB00]
    push af
    ld   hl, $DB02
    ld   a, [$DBA3]
    ld   c, a
    ld   b, $00

label_82000::
    add  hl, bc
    ld   a, [hl]
    ld   [$DB00], a
    pop  af
    ld   [hl], a
    ld   c, $00
    ld   b, $00
    ld   e, $FF

label_8200D::
    cp   $09
    jr   nz, label_82027
    ld   a, [$DB49]
    and  a
    jr   z, label_82027
    ld   a, $08
    ld   [$FF90], a
    ld   a, $10
    ld   [$C1B8], a
    ld   a, $01
    ld   [$C1B5], a
    jr   label_82036

label_82027::
    ld   a, [$C1B5]
    and  a
    jr   z, label_82036
    xor  a
    ld   [$C1B5], a
    ld   a, $10
    ld   [$C1B9], a

label_82036::
    call label_81C9C

label_82039::
    ld   a, $13
    ld   [$FFF2], a
    ld   a, [$DBA3]
    add  a, $02
    ld   c, a
    ld   b, $00
    dec  a
    ld   e, a
    call label_81C9C

label_8204A::
    ret

label_8204B::
    ld    hl, sp+$F0
    ldi  [hl], a
    ld   bc, $F8F8
    ldi  [hl], a
    ld   hl, $00F8
    inc  h
    ld   [bc], a
    ld    hl, sp+$08
    inc  h
    ldi  [hl], a
    ld    hl, sp+$10
    ld   h, $00
    ld    hl, sp+$18
    ld   h, $20
    ld   [label_20F0], sp
    nop
    ld   [label_20F8], sp
    nop
    ld   [label_2000], sp
    nop
    ld   [label_2008], sp
    nop
    ld   [label_2010], sp
    nop
    ld   [label_2018], sp
    nop
    ei
    db   $F4 ; Undefined instruction
    jr   nz, label_8207F

label_8207F::
    ei
    db   $FC ; Undefined instruction
    jr   nz, label_820A3
    ei
    nop
    jr   nz, label_82087

label_82087::
    ei
    ld   [label_2020], sp
    ei
    inc  c
    jr   nz, label_8208F

label_8208F::
    ei
    inc  d
    jr   nz, label_820B3
    dec  b
    db   $F4 ; Undefined instruction
    jr   nz, label_82097

label_82097::
    dec  b
    db   $FC ; Undefined instruction
    jr   nz, label_8209B

label_8209B::
    dec  b
    nop
    jr   nz, label_8209F

label_8209F::
    dec  b
    ld   [$0020], sp

label_820A3::
    dec  b
    inc  c
    jr   nz, label_820A7

label_820A7::
    dec  b
    inc  d
    jr   nz, label_820AB

label_820AB::
    db   $FD ; Undefined instruction
    ld    hl, sp+$20
    nop
    db   $FD ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_820B1
    nop
    jr   nz, label_820B7

label_820B7::
    db   $FD ; Undefined instruction
    ld   [label_2020], sp
    db   $FD ; Undefined instruction
    ld   [$0020], sp
    db   $FD ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_820C7
    ld    hl, sp+$20
    nop

label_820C7::
    inc  bc
    db   $10 ; Undefined instruction
    nop
    inc  bc
    nop
    jr   nz, label_820CF

label_820CF::
    inc  bc
    ld   [$0020], sp
    inc  bc
    ld   [$0020], sp
    inc  bc
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    jr   nz, label_820DF

label_820DF::
    nop
    ld   [label_2020], sp
    nop
    nop
    jr   nz, label_820E7

label_820E7::
    nop
    ld   [label_2020], sp
    nop
    nop
    jr   nz, label_820EF

label_820EF::
    nop
    ld   [label_2020], sp
    nop
    nop
    jr   nz, label_820F7

label_820F7::
    nop
    ld   [$0020], sp
    nop
    nop
    jr   nz, label_820FF

label_820FF::
    nop
    ld   [$0020], sp
    nop
    nop
    jr   nz, label_82107

label_82107::
    nop
    ld   [$0020], sp

label_8210B::
    ld   d, b
    ld   h, b
    ld   [hl], b

label_8210E::
    inc  b
    ld   [bc], a
    ld   bc, $B9FA
    pop  bc
    and  a
    jr   z, label_82131
    dec  a
    ld   [$C1B9], a
    jr   nz, label_8212E
    ld   hl, $FF90
    ld   [hl], $0B
    ld   a, [$C1BA]
    and  a
    jr   z, label_8212D
    ld   a, $0C
    ld   [$DB96], a

label_8212D::
    ret

label_8212E::
    cpl
    jr   label_8213B

label_82131::
    ld   a, [$C1B8]
    and  a
    jr   z, label_82141
    dec  a
    ld   [$C1B8], a

label_8213B::
    rra
    rra
    and  $03
    jr   label_8214A

label_82141::
    ld   a, [$C1B5]
    and  a
    jp   z, label_82214
    ld   a, $00

label_8214A::
    ld   [$C1B7], a
    ld   a, [$C1B7]
    ld   d, $00
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   hl, label_8204B
    add  hl, de
    ld   de, $C018
    ld   c, $0C
    ld   b, $04

label_8216A::
    ld   a, [hli]
    add  a, $30
    ld   [de], a
    inc  de
    ld   a, [hli]
    add  a, $60
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    cp   $22
    jr   z, label_82185
    cp   $24
    jr   z, label_82189
    cp   $26
    jr   z, label_8218D
    jr   label_8219A

label_82185::
    ld   b, $04
    jr   label_8218F

label_82189::
    ld   b, $02
    jr   label_8218F

label_8218D::
    ld   b, $01

label_8218F::
    ld   a, [$DB49]
    and  b
    jr   nz, label_8219A
    dec  de
    ld   a, $20
    ld   [de], a
    inc  de

label_8219A::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_8216A
    ld   a, [$C1B7]
    cp   $00
    jr   nz, label_82214
    ld   a, [$FFCC]
    and  $01
    jr   z, label_821C5

label_821AD::
    ld   hl, $DB4A
    ld   a, [hl]
    inc  a
    cp   $03
    jr   nz, label_821B7
    xor  a

label_821B7::
    ld   [hl], a
    ld   e, a
    ld   d, $00
    ld   hl, label_8210E
    add  hl, de
    ld   a, [$DB49]
    and  [hl]
    jr   z, label_821AD

label_821C5::
    ld   a, [$FFCC]
    and  $02
    jr   z, label_821E4

label_821CB::
    ld   hl, $DB4A
    ld   a, [hl]
    dec  a
    cp   $80
    jr   c, label_821D6
    ld   a, $02

label_821D6::
    ld   [hl], a
    ld   e, a
    ld   d, $00
    ld   hl, label_8210E
    add  hl, de
    ld   a, [$DB49]
    and  [hl]
    jr   z, label_821CB

label_821E4::
    ld   a, [$FFCC]
    and  $03
    jr   z, label_821ED
    call label_82039

label_821ED::
    ld   hl, $C010
    ld   a, $38
    ldi  [hl], a
    push hl
    ld   a, [$DB4A]
    ld   e, a
    ld   d, $00
    ld   hl, label_8210B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push af
    ld   a, $28
    ldi  [hl], a
    ld   a, $06
    ldi  [hl], a
    ld   a, $38
    ldi  [hl], a
    pop  af
    add  a, $08
    ldi  [hl], a
    ld   a, $28
    ldi  [hl], a
    ld   [hl], $26

label_82214::
    ret

label_82215::
    ld   a, [$DBA5]
    and  a
    jr   z, label_8228D
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_82226
    cp   $08
    jp   nc, label_8228D

label_82226::
    ld   a, [$D46B]
    and  $F8
    add  a, $50
    ld   h, a
    ld   a, [$D46B]
    rla
    rla
    rla
    and  $38
    add  a, $60
    ld   l, a
    ld   a, [$DBB0]
    and  $20
    jr   z, label_8224D
    ld   a, [$D46B]
    and  $38
    cp   $20
    jr   nc, label_8224D
    ld   a, h
    sub  a, $08
    ld   h, a

label_8224D::
    ld   a, [$DBB0]
    and  $10
    jr   z, label_82261
    ld   a, [$D46B]
    and  $07
    cp   $04
    jr   c, label_82261
    ld   a, l
    add  a, $08
    ld   l, a

label_82261::
    ld   a, h
    ld   [$C000], a
    ld   a, l
    ld   [$C001], a
    ld   a, $3F
    ld   [$C002], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_82285
    ld   a, $01
    ld   [$C003], a
    ld   a, [$FFE7]
    and  $08
    jr   z, label_8228D
    ld   a, $04
    ld   [$C003], a
    jr   label_8228D

label_82285::
    ld   a, [$FFE7]
    rla
    and  $10
    ld   [$C003], a

label_8228D::
    ret

label_8228E::
    ld   [label_828], sp
    jr   z, label_8229B
    jr   z, label_8229D
    jr   z, label_8229F
    jr   z, label_822C1
    jr   z, label_822DB

label_8229B::
    ld   b, b
    ld   e, b

label_8229D::
    ld   e, b
    ld   [hl], b

label_8229F::
    ld   [hl], b
    adc  a, b
    adc  a, b

label_822A2::
    ld   a, [$C159]
    inc  a
    ld   [$C159], a
    and  $10
    jr   nz, label_822DD
    ld   a, [$DBA3]
    ld   e, a
    ld   d, $00
    ld   hl, label_82298
    add  hl, de
    ld   a, [hl]
    ld   [$C004], a
    ld   [$C008], a
    ld   hl, label_8228E

label_822C1::
    add  hl, de
    ld   a, [hl]
    ld   [$C005], a
    add  a, $20
    ld   [$C009], a
    ld   a, $BE
    ld   [$C006], a
    ld   [$C00A], a
    ld   a, $34
    ld   [$C007], a
    ld   a, $14
    ld   [$C00B], a

label_822DD::
    ret

label_822DE::
    ld   a, [$DE09]
    ld   b, a
    ld   a, [$DE08]
    inc  a
    ld   [$DE08], a
    cp   $10
    jr   c, label_822F2
    xor  a
    ld   [$DE08], a
    inc  b

label_822F2::
    ld   a, b
    ld   [$DE09], a
    ld   [$FFE6], a
    ld   hl, $C050
    ld   b, $4A
    ld   c, $53
    ld   d, $08
    ld   a, $90
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    add  a, $08
    ld   c, a
    ld   a, b
    inc  b
    inc  b
    ldi  [hl], a
    ld   a, $26
    ldi  [hl], a
    ld   a, [$FFE6]
    and  $03
    jr   nz, label_8231A
    ld   c, $9B
    jr   label_8232E

label_8231A::
    ld   a, $90
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    add  a, $08
    ld   c, a
    ld   a, b
    ldi  [hl], a
    inc  b
    inc  b
    ld   a, $06
    ldi  [hl], a
    dec  d
    ld   a, d
    and  a
    jr   nz, label_8231A

label_8232E::
    ld   a, $90
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    ld   a, $4A
    ldi  [hl], a
    ld   a, $26
    ld   [hl], a
    ret

label_8233A::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction

label_82346::
    ld   c, $0E
    ld   h, $26
    ld   a, $3E
    ld   d, [hl]
    ld   d, [hl]
    ld   l, [hl]
    ld   l, [hl]
    add  a, [hl]
    add  a, [hl]
    ld   a, [$DB97]
    cp   $E4
    ret  c
    ld   d, $02
    jr   label_8235E

label_8235C::
    ld   d, $0C

label_8235E::
    ld   hl, $DB00
    ld   e, $00

label_82363::
    ld   a, [hli]

label_82364::
    cp   $01
    jr   z, label_8236E
    inc  e
    ld   a, e
    cp   d
    jr   nz, label_82363
    ret

label_8236E::
    ld   d, $00
    ld   hl, label_8233A
    add  hl, de
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, label_82346
    add  hl, de
    ld   a, [hl]
    ld   [$FFD8], a
    ld   a, [$D47C]
    dec  a
    jr   nz, label_823BE
    ld   a, [$FFE7]
    and  $08
    jr   nz, label_823BE
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    ld   a, [$DB95]
    cp   $0C
    jr   nz, label_823A1
    ld   a, [$DB96]
    cp   $02
    jr   nc, label_823A2

label_823A1::
    add  hl, de

label_823A2::
    ld   a, [$C1B5]
    and  a
    jr   z, label_823AB
    ld   hl, $C09C

label_823AB::
    ld   a, [$DB9A]
    push hl
    ld   hl, $FFD8
    add  a, [hl]
    pop  hl
    ldi  [hl], a
    ld   a, [$FFD7]
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    ld   a, $54
    ldi  [hl], a

label_823BE::
    ld   a, $01
    call label_3DA0
    ret
    call label_81EB5
    call label_82215
    call label_81F06
    call label_82111
    call label_822A2
    call label_8235C
    call label_822DE
    ld   a, [$C1BA]
    and  a
    jr   z, label_823F5
    ld   a, [$DB96]
    cp   $0C
    jr   nz, label_82445
    xor  a
    ld   [$C1BA], a
    ld   [$C1B5], a
    ld   [$C1B8], a
    ld   [$C1B9], a
    jr   label_82436

label_823F5::
    ld   a, [$FFCC]
    and  $40
    jr   z, label_8241E
    ld   a, $09
    ld   [$DB96], a
    ld   a, $90
    ld   [$DE0A], a
    ld   a, [$0005]
    and  a
    jr   z, label_8241C
    ld   a, [$C17B]
    xor  $01
    ld   [$C17B], a
    ld   a, $01
    ld   [$DC0C], a
    xor  a
    ld   [$DC0D], a

label_8241C::
    jr   label_82445

label_8241E::
    ld   a, [$C1B5]
    ld   hl, $C1B8
    or   [hl]
    ld   hl, $C1B9
    or   [hl]
    jr   nz, label_82445
    ld   a, [$FFCC]
    and  $80
    jr   z, label_82445
    ld   a, $0C
    ld   [$DB96], a

label_82436::
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    inc  a
    ld   [$DDD5], a
    ld   a, $12
    ld   [$FFF2], a

label_82445::
    ret

label_82446::
    ld   a, [$FFE2]
    ldi  [hl], a
    ld   a, [$FFE1]
    ldi  [hl], a
    add  a, $08
    ld   [$FFE1], a
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, [de]
    ldi  [hl], a
    inc  de
    dec  c
    ld   a, c
    and  a
    jr   nz, label_82446
    ret
    ld   b, b
    dec  b
    ld   b, b
    dec  h
    ld   e, h
    inc  bc
    ld   e, [hl]
    inc  bc
    ld   b, b
    ld   b, $40
    ld   h, $60
    inc  bc
    ld   h, d
    inc  bc
    ld   b, b
    rlca
    ld   b, b
    daa
    ld   h, h
    inc  bc
    ld   a, [hl]
    inc  bc

label_82474::
    ld   e, h
    ld   h, h
    ld   h, h
    ld   h, h
    ld   l, h
    ld   h, h
    ld   b, d
    ld   b, $42
    ld   h, $66
    inc  bc
    ld   a, d
    inc  bc
    ld   l, [hl]
    inc  bc
    ld   b, [hl]
    ld   b, $42
    ld   h, $68
    inc  bc
    ld   a, d
    inc  bc
    ld   l, [hl]
    inc  bc
    ld   b, h
    ld   b, $42
    ld   h, $6A
    inc  bc
    ld   a, d
    inc  bc
    ld   l, [hl]
    inc  bc
    ld   b, h
    ld   b, $46
    ld   h, $6C
    inc  bc
    ld   a, d
    inc  bc
    ld   l, [hl]
    inc  bc

label_824A2::
    ld   a, d
    ld   h, h
    add  a, h
    ld   h, h
    adc  a, [hl]
    ld   h, h
    sbc  a, b
    ld   h, h

label_824AA::
    ld   a, h
    inc  bc
    ld   c, b
    inc  bc
    ld   c, b
    inc  hl

label_824B0::
    ld   h, [hl]
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   l, b
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   l, d
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   l, h
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   l, [hl]
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   [hl], b
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   [hl], d
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   [hl], h
    inc  bc
    ld   h, [hl]
    inc  bc
    db   $76 ; Halt
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   a, b
    inc  bc
    ld   l, b
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   l, b
    inc  bc
    ld   l, b
    inc  bc
    ld   l, b
    inc  bc
    ld   l, d
    inc  bc

label_824E4::
    ld   a, d
    inc  bc
    ld   l, b
    inc  bc
    ld   l, d
    inc  bc
    ld   a, h
    inc  bc
    ld   a, h
    inc  bc

label_824EE::
    ld   hl, $C010
    ld   a, $53
    ld   [$FFE1], a
    ld   a, [$DE0A]
    ld   [$FFE2], a
    push hl
    ld   c, $04
    ld   hl, label_82474
    ld   a, [$DC0F]
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    pop  hl
    call label_82446
    ld   a, [$FFE2]
    ldi  [hl], a
    ld   a, [$FFE1]
    ldi  [hl], a
    add  a, $08
    ld   [$FFE1], a
    ld   a, $7C
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    push hl
    ld   c, $06
    ld   de, label_824A2
    ld   h, $00
    ld   a, [$DB5C]
    sla  a
    ld   l, a
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    pop  hl
    call label_82446
    ld   a, $53
    ld   [$FFE1], a
    ld   a, [$DE0A]
    add  a, $10
    ld   [$FFE2], a
    ld   c, $03
    ld   de, label_824AA
    call label_82446
    ld   e, $00
    ld   a, [$DC0C]

label_8254E::
    bit  0, a
    jr   z, label_82553
    inc  e

label_82553::
    srl  a
    and  a
    jr   nz, label_8254E
    ld   a, [$DC0D]
    and  $0F

label_8255D::
    bit  0, a
    jr   z, label_82562
    inc  e

label_82562::
    srl  a
    and  a

label_82565::
    jr   nz, label_8255D
    ld   d, $00
    sla  e
    sla  e
    push hl
    ld   c, $02
    ld   hl, label_824B0
    add  hl, de
    push hl
    pop  de
    pop  hl
    call label_82446
    ld   c, $05
    ld   de, label_824E4
    call label_82446
    ret
    call label_81EB5
    call label_824EE
    ld   a, [$FFCB]
    and  $40
    jr   nz, label_82596
    ld   a, $0B
    ld   [$DB96], a
    jr   label_825A7

label_82596::
    ld   a, [$DE0A]
    sub  a, $04
    cp   $78
    jr   nc, label_825A4
    call label_82683
    ld   a, $78

label_825A4::
    ld   [$DE0A], a

label_825A7::
    ret
    call label_81EB5
    call label_824EE
    ld   a, [$FFCB]
    and  $40
    jr   nz, label_825B7
    call label_82683

label_825B7::
    ret
    call label_81EB5
    call label_824EE
    ld   a, [$DE0A]
    add  a, $04
    cp   $90
    jr   c, label_825CE
    ld   a, $08
    ld   [$DB96], a
    ld   a, $90

label_825CE::
    ld   [$DE0A], a
    ret
    call label_8235C
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jp   nz, label_82682
    ld   a, $01
    ld   [$DDD5], a
    xor  a
    ld   [$C50A], a
    ld   [$C116], a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C167], a
    ld   [$C14F], a
    ld   a, $07
    ld   [$FFA9], a
    ld   a, $70
    ld   [$FFAA], a
    ld   a, $0B
    ld   [$DB95], a
    ld   [$FFBC], a
    ld   a, $02
    ld   [$DB96], a
    ld   a, [$DBA5]
    and  a
    ld   a, $06
    jr   nz, label_82628
    ld   a, [$FFF6]
    cp   $64
    jr   nz, label_82626
    ld   hl, $C193
    ld   [hl], $A4
    inc  hl
    ld   [hl], $E5
    inc  hl
    ld   [hl], $82
    inc  hl
    ld   [hl], $A2

label_82626::
    ld   a, $07

label_82628::
    ld   [$D6FE], a
    ld   hl, $C124
    ld   e, $00

label_82630::
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, label_82630
    ld   a, $80
    ld   [$DB9A], a
    ld   a, $07
    ld   [rWX], a
    ld   a, $08
    ld   [$C150], a
    ld   a, $07
    ld   [$FFA9], a
    ld   a, $70
    ld   [$FFAA], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_82682
    ld   hl, $DC10
    ld   c, $80
    di

label_82659::
    ld   a, $03
    ld   [rSVBK], a
    ld   b, [hl]
    dec  a
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_82659
    xor  a
    ld   [rSVBK], a
    ld   a, [$D6FD]
    and  $7F
    ld   [rLCDC], a
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_8267C
    ld   a, $01
    ld   [$FF91], a

label_8267C::
    ld   a, [$D6FD]
    ld   [rLCDC], a
    ei

label_82682::
    ret

label_82683::
    ld   hl, $DB96
    inc  [hl]
    ret
    nop
    ld   [label_248], sp
    nop
    nop
    ld   b, b
    ld   [bc], a
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   [label_24A], sp
    nop
    nop
    ld   c, h
    ld   [bc], a
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    ld   c, d
    ldi  [hl], a
    nop
    ld   [label_224C], sp
    nop
    ld   [rIE], sp
    nop
    nop
    ld   c, b
    ldi  [hl], a
    nop
    ld   [label_2240], sp
    nop
    ld   [rIE], sp
    nop
    inc  c
    ld   b, h
    ld   [bc], a
    nop
    inc  b
    ld   b, [hl]
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   b, b
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   b, h
    ldi  [hl], a
    nop
    inc  b
    ld   b, [hl]
    ldi  [hl], a
    nop
    inc  c
    ld   b, b
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   b, h
    ldi  [hl], a
    nop
    inc  b
    ld   b, d
    ldi  [hl], a
    nop
    inc  c
    ld   b, b
    ldi  [hl], a
    nop
    inc  c
    ld   b, h
    ld   [bc], a
    nop
    inc  b
    ld   b, d
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   b, b
    ld   [bc], a
    nop
    ld   [$0048], sp
    nop
    nop
    ld   b, b
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   [$004A], sp
    nop
    nop
    ld   c, h
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    ld   c, d
    jr   nz, label_82705

label_82705::
    ld   [label_204C], sp
    nop
    ld   [rIE], sp
    nop
    nop
    ld   c, b
    jr   nz, label_82711

label_82711::
    ld   [label_2040], sp
    nop
    ld   [rIE], sp
    nop
    inc  c
    ld   b, h
    nop
    nop
    inc  b
    ld   b, [hl]
    nop
    nop
    db   $FC ; Undefined instruction
    ld   b, b
    nop
    nop
    db   $FC ; Undefined instruction
    ld   b, h
    jr   nz, label_82729

label_82729::
    inc  b
    ld   b, [hl]
    jr   nz, label_8272D

label_8272D::
    inc  c
    ld   b, b
    jr   nz, label_82731

label_82731::
    db   $FC ; Undefined instruction
    ld   b, h
    jr   nz, label_82735

label_82735::
    inc  b
    ld   b, d
    jr   nz, label_82739

label_82739::
    inc  c
    ld   b, b
    jr   nz, label_8273D

label_8273D::
    inc  c
    ld   b, h
    nop
    nop
    inc  b
    ld   b, d
    nop
    nop
    db   $FC ; Undefined instruction
    ld   b, b
    nop
    nop
    ld   [label_348], sp
    nop
    nop
    ld   b, b
    inc  bc
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   [label_34A], sp
    nop
    nop
    ld   c, h
    inc  bc
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    ld   c, d
    inc  hl
    nop
    ld   [label_234C], sp
    nop
    ld   [rIE], sp
    nop
    nop
    ld   c, b
    inc  hl
    nop
    ld   [label_2340], sp
    nop
    ld   [rIE], sp
    nop
    inc  c
    ld   b, h
    inc  bc
    nop
    inc  b
    ld   b, [hl]
    inc  bc
    nop
    db   $FC ; Undefined instruction
    ld   b, b
    inc  bc
    nop
    db   $FC ; Undefined instruction
    ld   b, h
    inc  hl
    nop
    inc  b
    ld   b, [hl]
    inc  hl
    nop
    inc  c
    ld   b, b
    inc  hl
    nop
    db   $FC ; Undefined instruction
    ld   b, h
    inc  hl
    nop
    inc  b
    ld   b, d
    inc  hl
    nop
    inc  c
    ld   b, b
    inc  hl
    nop
    inc  c
    ld   b, h
    inc  bc
    nop
    inc  b
    ld   b, d
    inc  bc
    nop
    db   $FC ; Undefined instruction
    ld   b, b
    inc  bc
    nop
    nop
    ld   c, h
    ld   [bc], a
    nop
    ld   [label_24E], sp
    nop
    nop
    rst  $38
    ld   [bc], a
    nop
    nop
    ld   c, [hl]
    ldi  [hl], a
    nop
    ld   [label_224C], sp
    nop
    nop
    rst  $38
    ld   [bc], a
    nop
    nop
    ld   d, b
    ld   [bc], a
    nop
    ld   [label_25A], sp
    nop
    nop
    rst  $38
    ld   [bc], a
    nop
    nop
    ld   e, d
    ldi  [hl], a
    nop
    ld   [label_2250], sp
    nop
    nop
    rst  $38
    ld   [bc], a
    nop
    nop
    ld   c, h
    nop
    nop
    ld   [$004E], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    ld   c, [hl]
    jr   nz, label_827E9

label_827E9::
    ld   [label_204C], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    ld   d, b
    nop
    nop
    ld   [$005A], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    ld   e, d
    jr   nz, label_82801

label_82801::
    ld   [label_2050], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    ld   c, h
    inc  bc
    nop
    ld   [label_34E], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    ld   c, [hl]
    inc  hl
    nop
    ld   [label_234C], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    ld   d, b
    inc  bc
    nop
    ld   [label_35A], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    ld   e, d
    inc  hl
    nop
    ld   [label_2350], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    ld   a, b
    inc  bc
    nop
    ld   [label_37A], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    ld   a, h
    inc  bc
    nop
    ld   [label_37E], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    ld   a, d
    inc  hl
    nop
    ld   [label_2378], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    ld   a, [hl]
    inc  hl
    nop
    ld   [label_237C], sp
    nop
    nop
    rst  $38
    inc  bc
    nop
    nop
    rst  $38
    inc  bc
    db   $FD ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  hl
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ldi  [hl], a
    inc  bc
    nop
    nop
    ld   a, b
    inc  bc
    nop
    ld   [label_37A], sp
    rlca
    db   $10 ; Undefined instruction
    inc  bc
    rlca
    db   $FD ; Undefined instruction
    ldi  [hl], a
    inc  hl
    rst  $38
    nop
    ld   a, b
    inc  bc
    rst  $38
    ld   [label_37A], sp
    db   $FD ; Undefined instruction
    dec  bc
    ldi  [hl], a
    inc  hl
    db   $FD ; Undefined instruction
    ld    hl, sp+$22
    inc  bc
    nop
    nop
    ld   a, d
    inc  hl
    nop
    ld   [label_2378], sp
    rlca
    dec  bc
    ldi  [hl], a
    inc  bc
    rlca
    ld    hl, sp+$22
    inc  hl
    rst  $38
    nop
    ld   a, d
    inc  hl
    rst  $38
    ld   [label_2378], sp
    db   $F4 ; Undefined instruction
    ld    hl, sp+$40
    rlca
    db   $F4 ; Undefined instruction
    nop
    ld   b, d
    rlca
    db   $F4 ; Undefined instruction
    ld   [label_744], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    rlca
    inc  b
    ld    hl, sp+$48
    rlca
    inc  b
    nop
    ld   c, d
    rlca
    inc  b
    ld   [label_74C], sp
    inc  b
    db   $10 ; Undefined instruction
    rlca
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    daa
    db   $F4 ; Undefined instruction
    ld   [label_2742], sp
    db   $F4 ; Undefined instruction
    nop
    ld   b, h
    daa
    db   $F4 ; Undefined instruction
    ld    hl, sp+$46
    daa
    inc  b
    db   $10 ; Undefined instruction
    daa
    inc  b
    ld   [label_274A], sp
    inc  b
    nop
    ld   c, h
    daa
    inc  b
    ld    hl, sp+$4E
    daa
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    daa
    db   $F4 ; Undefined instruction
    ld   [label_2752], sp
    db   $F4 ; Undefined instruction
    nop
    ld   d, h
    daa
    db   $F4 ; Undefined instruction
    ld    hl, sp+$56
    daa
    inc  b
    db   $10 ; Undefined instruction
    daa
    inc  b
    ld   [label_275A], sp
    inc  b
    nop
    ld   e, h
    daa
    inc  b
    ld    hl, sp+$5E
    daa
    db   $F4 ; Undefined instruction
    ld    hl, sp+$50
    rlca
    db   $F4 ; Undefined instruction
    nop
    ld   d, d
    rlca
    db   $F4 ; Undefined instruction
    ld   [label_754], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    rlca
    inc  b
    ld    hl, sp+$58
    rlca
    inc  b
    nop
    ld   e, d
    rlca
    inc  b
    ld   [label_75C], sp
    inc  b
    db   $10 ; Undefined instruction
    rlca
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   b, b
    rlca
    ld   [bc], a
    inc  b
    ld   b, d
    rlca
    ld   [bc], a
    inc  c
    ld   b, b
    daa
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    ld   a, [$FF00+C]
    ld   b, h
    rlca
    ld   a, [$FF00+C]
    ld   b, h
    daa
    ld   [bc], a
    nop
    ld   b, [hl]
    rlca
    ld   [bc], a
    ld   [label_2746], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    ld   a, [$FF00+C]
    ld   c, b
    rlca
    ld   a, [$FF00+C]
    ld   c, b
    daa
    ld   [bc], a
    nop
    ld   c, d
    rlca
    ld   [bc], a
    ld   [label_274A], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    ld   a, [$FF00+C]
    ld   c, h
    rlca
    ld   a, [$FF00+C]
    ld   c, h
    daa
    ld   [bc], a
    ld    hl, sp+$4E
    rlca
    ld   [bc], a
    nop
    ld   d, b
    rlca
    ld   [bc], a
    ld   [label_2750], sp
    ld   [bc], a
    db   $10 ; Undefined instruction
    daa
    ld   a, [$FF00+C]
    ld   d, d
    rlca
    ld   a, [$FF00+C]
    ld   d, [hl]
    rlca
    ld   a, [$FF00+C]
    ld   e, d
    rlca
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   d, h
    rlca
    ld   [bc], a
    inc  b
    ld   e, b
    rlca
    ld   [bc], a
    inc  c
    ld   e, h
    rlca
    ld   a, [$FF00+C]
    ld   e, d
    daa
    ld   a, [$FF00+C]
    ld   d, [hl]
    daa
    ld   a, [$FF00+C]
    ld   d, d
    daa
    ld   [bc], a
    db   $FC ; Undefined instruction
    ld   e, h
    daa
    ld   [bc], a
    inc  b
    ld   e, b
    daa
    ld   [bc], a
    inc  c
    ld   d, h
    daa
    ld   a, [$FF00+C]
    ld   c, h
    inc  b
    ld   a, [$FF00+C]
    ld   c, h
    inc  h
    ld   [bc], a
    ld    hl, sp+$4E
    inc  b
    ld   [bc], a
    nop
    ld   d, b
    inc  b
    ld   [bc], a
    ld   [label_2450], sp
    ld   [bc], a
    db   $10 ; Undefined instruction
    inc  h
    ld   a, [$FFFC]
    ld   d, b
    ld   bc, label_4F0
    ld   d, d
    ld   bc, label_CF0
    ld   d, h
    ld   bc, $FC00
    ld   d, [hl]
    ld   bc, label_400
    ld   e, b
    ld   bc, label_C00
    ld   e, d
    ld   bc, $FCF0
    ld   d, b
    ld   bc, label_4F0
    ld   d, d
    ld   bc, label_CF0
    ld   d, h
    ld   bc, $FC00
    ld   e, h
    ld   bc, label_400
    ld   e, b
    ld   bc, label_C00
    ld   e, [hl]
    ld   bc, label_4F4
    jr   nz, label_82A35
    nop
    inc  b
    adc  a, [hl]
    ld   d, $F4
    inc  b
    jr   nz, label_82A1D
    nop

label_82A1D::
    inc  b
    adc  a, [hl]
    ld   d, $F4
    nop
    ld   b, b
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [label_2340], sp
    db   $F4 ; Undefined instruction
    nop
    ld   b, b
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld   [label_2240], sp

label_82A30::
    ld   a, [$FFFE]
    and  a
    jp   z, label_82B81
    ld   a, e
    cp   $03
    ret  c
    ld   a, $01
    ld   [$FFE4], a
    ld   a, $02
    ld   [$FFE5], a
    ld   a, $04
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   d, $40
    ld   a, e
    cp   $06
    jr   nc, label_82A52
    ld   d, $28

label_82A52::
    and  $10
    jr   z, label_82A68
    ld   a, [$FFE4]
    sla  a
    ld   [$FFE4], a
    ld   a, [$FFE5]
    sla  a
    ld   [$FFE5], a
    ld   a, [$FFE6]
    sla  a
    ld   [$FFE6], a

label_82A68::
    push hl
    ld   a, [$FFE4]
    ld   c, a
    ld   a, [hl]
    and  $1F
    add  a, c
    cp   $20
    jr   c, label_82A76
    ld   a, $1F

label_82A76::
    ld   [$FFD7], a
    ld   a, [$FFE5]
    ld   c, a
    ld   a, [hli]
    and  $E0
    swap a
    ld   b, a
    ld   a, [hl]
    and  $03
    swap a
    or   b
    and  $3E
    add  a, c
    cp   $40
    jr   c, label_82A90
    ld   a, $3E

label_82A90::
    ld   [$FFD8], a
    ld   a, [$FFE6]
    ld   c, a
    ld   a, [hl]
    and  $7C
    add  a, c
    cp   $80
    jr   c, label_82A9F
    ld   a, $7C

label_82A9F::
    ld   [$FFD9], a
    pop  hl
    ld   a, [$FFD7]
    ld   b, a
    ld   a, [$FFD8]
    swap a
    ld   c, a
    and  $E0
    or   b
    ldi  [hl], a
    ld   a, [$FFD9]
    ld   b, a
    ld   a, c
    and  $03
    or   b
    ldi  [hl], a
    dec  d
    ld   a, d
    and  a
    jr   nz, label_82A68
    ld   a, $03
    ld   [$DDD1], a
    ret
    ld   a, [$FFFE]
    and  a
    jp   z, label_82B81
    ld   a, e
    cp   $06
    ret  c
    ld   a, $01
    ld   [$FFE4], a
    ld   a, $02
    ld   [$FFE5], a
    ld   a, $04
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   a, $40
    ld   [$FFDA], a
    ld   a, e
    and  $10
    jr   z, label_82AF5
    ld   a, [$FFE4]
    sla  a
    ld   [$FFE4], a
    ld   a, [$FFE5]
    sla  a
    ld   [$FFE5], a
    ld   a, [$FFE6]
    sla  a
    ld   [$FFE6], a

label_82AF5::
    push hl
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    ld   d, a
    dec  hl
    xor  a
    ld   [rSVBK], a
    ld   a, [$FFE4]
    ld   c, a
    ld   a, e
    and  $1F
    ld   b, a
    ld   a, [hl]
    and  $1F
    cp   b
    jr   c, label_82B17
    jr   z, label_82B17
    sub  a, c
    jr   c, label_82B17
    cp   b
    jr   nc, label_82B18

label_82B17::
    ld   a, b

label_82B18::
    ld   [$FFD7], a
    ld   a, e
    and  $E0
    swap a
    ld   b, a
    ld   a, d
    and  $03
    swap a
    or   b
    ld   b, a
    ld   a, [hli]
    and  $E0
    swap a
    ld   c, a
    ld   a, [hl]
    and  $03
    swap a
    or   c
    push af
    ld   a, [$FFE5]
    ld   c, a
    pop  af
    cp   b
    jr   c, label_82B43
    jr   z, label_82B43
    sub  a, c
    jr   c, label_82B43
    cp   b
    jr   nc, label_82B44

label_82B43::
    ld   a, b

label_82B44::
    ld   [$FFD8], a
    ld   a, [$FFE6]
    ld   c, a
    ld   a, d
    and  $7C
    ld   b, a
    ld   a, [hl]
    and  $7C
    cp   b
    jr   c, label_82B5B
    jr   z, label_82B5B
    sub  a, c
    jr   c, label_82B5B
    cp   b
    jr   nc, label_82B5C

label_82B5B::
    ld   a, b

label_82B5C::
    ld   [$FFD9], a
    pop  hl
    ld   a, [$FFD7]
    ld   b, a
    ld   a, [$FFD8]
    swap a
    ld   c, a
    and  $E0
    or   b
    ldi  [hl], a
    ld   a, [$FFD9]
    ld   b, a
    ld   a, c
    and  $03
    or   b
    ldi  [hl], a
    ld   a, [$FFDA]
    dec  a
    ld   [$FFDA], a
    and  a
    jp   nz, label_82AF5
    ld   a, $03
    ld   [$DDD1], a

label_82B81::
    xor  a
    ld   [$DDD5], a
    ret

label_82B86::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [bc]
    or   [hl]
    ld   e, a
    inc  bc
    inc  hl
    ld   a, [bc]
    or   [hl]
    ld   d, a
    dec  bc
    dec  hl
    xor  a
    ld   [rSVBK], a
    ld   [hl], e
    inc  hl
    ld   [hl], d
    inc  hl
    ret

label_82B9C::
    nop
    nop
    add  a, h
    db   $10 ; Undefined instruction
    ld   sp, label_1084
    ld   a, [$FFFE]
    and  a
    jp   z, label_82B81
    ld   a, [$D002]
    and  a
    jr   z, label_82BB4
    cp   $18
    jr   nc, label_82BDB

label_82BB4::
    ld   hl, label_82B9C
    sla  e
    add  hl, de
    push hl
    pop  bc
    ld   hl, $DC10
    ld   a, $08
    ld   [$FFD7], a

label_82BC3::
    call label_82B86
    call label_82B86
    call label_82B86
    inc  hl
    inc  hl
    ld   a, [$FFD7]
    dec  a
    and  a
    ld   [$FFD7], a
    jr   nz, label_82BC3
    ld   a, $01
    ld   [$DDD1], a

label_82BDB::
    ret
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   hl, $DC10
    ld   bc, $DC50
    ld   d, $20

label_82BE8::
    ld   a, $FF
    ldi  [hl], a
    ld   [bc], a
    inc  bc
    ldi  [hl], a
    ld   [bc], a
    inc  bc
    dec  d
    ld   a, d
    and  a
    jr   nz, label_82BE8
    ld   a, $03
    ld   [$DDD1], a
    ld   a, $01
    ld   [$DDD5], a
    ret
    ld   a, [$FFFE]
    and  a
    jp   z, label_82B81
    ld   c, $80
    ld   hl, $DC10

label_82C0B::
    ld   a, $02
    ld   [rSVBK], a
    ld   b, [hl]
    xor  a
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_82C0B
    ld   a, $03
    ld   [$DDD1], a
    xor  a
    ld   [$DDD5], a
    ret
    ld   a, [$FFFE]
    and  a
    jr   z, label_82C4E
    ld   hl, $DC50
    ld   a, [$DC0F]
    and  a
    jr   z, label_82C3D
    inc  a
    sla  a
    sla  a
    sla  a
    ld   c, a
    ld   b, $00
    add  hl, bc

label_82C3D::
    ld   b, $08

label_82C3F::
    ld   a, $02
    ld   [rSVBK], a
    ld   c, [hl]
    xor  a
    ld   [rSVBK], a
    ld   [hl], c
    inc  hl
    dec  b
    ld   a, b
    and  a
    jr   nz, label_82C3F

label_82C4E::
    ret
    ld   a, [$FFFE]
    and  a
    jp   z, label_82B81
    ld   a, [$C16C]
    and  $01
    jr   z, label_82C60
    ld   a, $02
    jr   label_82C76

label_82C60::
    ld   a, $04
    ld   [$FFE4], a
    ld   a, $08
    ld   [$FFE5], a
    ld   a, $10
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   d, $40
    call label_82A68
    ld   a, $01

label_82C76::
    ld   [$DDD1], a
    ret
    ld   a, [$FFFE]
    and  a
    jp   z, label_82B81
    ld   a, [$C16C]
    and  $01
    jr   z, label_82C8B
    ld   a, $02
    jr   label_82CA3

label_82C8B::
    ld   a, $04
    ld   [$FFE4], a
    ld   a, $08
    ld   [$FFE5], a
    ld   a, $10
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   a, $40
    ld   [$FFDA], a
    call label_82AF5
    ld   a, $01

label_82CA3::
    ld   [$DDD1], a
    ret
    ld   a, [$C3CA]
    cp   $20
    jr   z, label_82D0D
    push af
    and  $02
    jr   nz, label_82CB5
    ld   a, $01

label_82CB5::
    or   $80
    ld   [$DDD1], a
    ld   a, [$C3CA]
    and  $01
    swap a
    ld   [$DDD3], a
    ld   a, $10
    ld   [$DDD4], a
    pop  af
    inc  a
    ld   [$C3CA], a
    ld   a, $08
    ld   [$FFE4], a
    ld   a, $10
    ld   [$FFE5], a
    ld   a, $20
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   a, $40
    ld   [$FFDA], a
    ld   a, [$C17F]
    cp   $03
    jr   z, label_82CFA
    ld   a, [$DDD1]
    push af
    call label_82A30
    pop  af
    ld   [$DDD1], a
    ld   a, $01
    ld   [$DDD5], a
    jr   label_82D0D

label_82CFA::
    ld   a, [$C3CA]
    dec  a
    and  $03
    jr   nz, label_82D0D
    ld   a, [$DDD1]
    push af
    call label_82AF5
    pop  af
    ld   [$DDD1], a

label_82D0D::
    ret
    ld   a, [hl]
    dec  a
    cp   $04
    jr   c, label_82D51
    ld   a, [$FFE7]
    and  $01
    jr   z, label_82D1E
    ld   a, $02
    jr   label_82D4E

label_82D1E::
    ld   a, [hl]
    dec  a
    cp   $0E
    jr   c, label_82D38
    ld   a, $01
    ld   [$FFE4], a
    ld   a, $02
    ld   [$FFE5], a
    ld   a, $04
    ld   [$FFE6], a
    ld   hl, $DC30
    ld   d, $20
    call label_82A68

label_82D38::
    ld   a, $01
    ld   [$FFE4], a
    ld   a, $02
    ld   [$FFE5], a
    ld   a, $04
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   d, $20
    call label_82A68
    ld   a, $01

label_82D4E::
    ld   [$DDD1], a

label_82D51::
    ret
    ld   e, $20
    ld   a, [hl]
    cp   $30
    jr   c, label_82D60
    ld   hl, $DC50
    ld   a, $02
    jr   label_82D65

label_82D60::
    ld   hl, $DC10
    ld   a, $01

label_82D65::
    ld   [$DDD1], a

label_82D68::
    push hl
    ld   a, [hl]
    inc  a
    and  $1F
    jr   nz, label_82D71
    ld   a, $1F

label_82D71::
    ld   [$FFD7], a
    ld   a, [hli]
    and  $E0
    swap a
    ld   d, a
    ld   a, [hl]
    and  $03
    swap a
    or   d
    add  a, $02
    and  $3E
    jr   nz, label_82D87
    ld   a, $3E

label_82D87::
    ld   [$FFD8], a
    ld   a, [hl]
    add  a, $04
    and  $7C
    jr   nz, label_82D92
    ld   a, $7C

label_82D92::
    ld   [$FFD9], a
    pop  hl
    ld   a, [$FFD7]
    ld   d, a
    ld   a, [$FFD8]
    swap a
    and  $E0
    or   d
    ldi  [hl], a
    ld   a, [$FFD9]
    ld   d, a
    ld   a, [$FFD8]
    swap a
    and  $03
    or   d
    ldi  [hl], a
    dec  e
    jr   nz, label_82D68
    ret
    ld   a, [$DBA5]
    and  a
    ret  nz
    ld   a, [$FFF6]
    cp   $0E
    jr   nz, label_82DC6
    ld   a, [$D80E]
    and  $10
    jr   z, label_82E1A
    ld   hl, label_81090
    jr   label_82E14

label_82DC6::
    cp   $8C
    jr   nz, label_82DD6
    ld   a, [$D88C]
    and  $10
    jr   z, label_82E1A
    ld   hl, label_811D0
    jr   label_82E14

label_82DD6::
    cp   $79
    jr   nz, label_82DE6
    ld   a, [$D879]
    and  $10
    jr   z, label_82E1A
    ld   hl, label_81180
    jr   label_82E14

label_82DE6::
    cp   $06
    jr   nz, label_82DF6
    ld   a, [$D806]
    and  $10
    jr   z, label_82E1A
    ld   hl, label_81040
    jr   label_82E14

label_82DF6::
    cp   $1B
    jr   nz, label_82E06
    ld   a, [$D82B]
    and  $10
    jr   z, label_82E1A
    ld   hl, label_810E0
    jr   label_82E14

label_82E06::
    cp   $2B
    jr   nz, label_82E1A
    ld   a, [$D82B]
    and  $10
    jr   z, label_82E1A
    ld   hl, label_81130

label_82E14::
    ld   a, $27
    ld   [$FFD7], a
    jr   label_82E3C

label_82E1A::
    ld   a, $26
    ld   [$FFD7], a
    ld   a, [$FFF6]
    cp   $CC
    jr   c, label_82E2A
    ld   hl, $FFD7
    inc  [hl]
    sub  a, $CC

label_82E2A::
    ld   hl, label_80000
    ld   b, a
    and  b

label_82E2F::
    jr   z, label_82E3C
    ld   a, l
    add  a, $50
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
    dec  b
    jr   label_82E2F

label_82E3C::
    ld   de, $D711

label_82E3F::
    ld   bc, $000A
    push de
    call label_B1A
    pop  de
    ld   a, e
    add  a, $10
    ld   e, a
    cp   $91
    jr   nz, label_82E3F
    ret
    push hl
    ld   c, [hl]
    ld   b, $0E
    ld   hl, label_82E65

label_82E57::
    ld   a, [hli]
    cp   c
    jr   nz, label_82E5F
    scf
    ccf
    jr   label_82E63

label_82E5F::
    dec  b
    jr   nz, label_82E57
    scf

label_82E63::
    pop  hl
    ret

label_82E65::
    inc  bc
    inc  b
    add  hl, bc
    ld   e, [hl]
    sub  a, c
    and  c
    xor  d
    call nz, label_CCC6
    db   $DB
    pop  hl
    db   $E3 ; Undefined instruction
    db   $E8 ; add  sp, d
    inc  e
    inc  e
    ld   a, $3C
    ld   a, $3E
    ld   a, $30
    rrca
    ld   [hl], $36
    ld   a, [de]
    rrca
    inc  [hl]
    rrca
    ld   a, $20
    jr   nz, label_82E95
    jr   c, label_82EB0
    jr   z, label_82EBC
    ldd  [hl], a
    jr   nz, label_82EAD
    jr   c, label_82EC7
    jr   z, label_82EB9
    ldd  [hl], a
    ldd  [hl], a
    rrca
    ld   h, $0F
    inc  h
    rrca
    ld   e, $2A
    rrca
    ld   h, $26
    ld   l, $2E
    rrca
    ld   a, [hli]
    ld   a, [hli]
    ld   a, [hli]
    rrca
    inc  h
    ld   l, $2E
    db   $3A ; ldd  a, [hl]
    rrca
    ld   h, $2C
    ldi  [hl], a
    ldi  [hl], a

label_82EAD::
    ldi  [hl], a
    rrca
    db   $3A ; ldd  a, [hl]

label_82EB0::
    db   $3A ; ldd  a, [hl]
    rrca
    inc  l
    rst  $38
    nop
    nop
    nop
    rst  $38
    ld   bc, label_500
    nop

label_82EBC::
    add  hl, bc
    nop
    nop
    dec  b
    dec  b
    dec  b
    rst  $38
    nop
    nop
    rst  $38
    rst  $38

label_82EC7::
    ld   [bc], a
    ld   bc, $0101
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    ld   [bc], a
    nop
    rst  $38
    ld   c, $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [bc], a
    ld   [bc], a
    rst  $38
    ld   [bc], a
    ld   [bc], a
    add  hl, bc
    add  hl, bc

label_82EFA::
    rst  $38
    ld   [bc], a
    ld   [bc], a
    add  hl, bc
    ld   [bc], a
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    rst  $38
    ld   bc, label_501
    nop
    nop
    nop
    nop
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    nop
    nop
    nop
    add  hl, bc
    nop
    nop
    add  hl, bc
    add  hl, bc
    nop
    nop
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    nop
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    add  hl, bc
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   bc, $0005
    nop
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    rst  $38
    rst  $38
    ld   b, $07
    rlca
    rlca
    rst  $38
    rst  $38
    ld   b, $06
    rst  $38
    rst  $38
    rst  $38
    add  hl, bc
    rst  $38
    rst  $38
    rst  $38
    rlca
    rst  $38
    rst  $38
    rlca
    rst  $38
    rlca
    dec  b
    rst  $38
    rst  $38
    dec  b
    dec  b
    dec  b
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
    add  hl, de
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    ld   c, $03
    ld   c, $FF
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    rst  $38
    ld   c, $0E
    rst  $38
    ld   c, $0E
    ld   c, $0E
    add  hl, bc
    nop
    ld   c, $09
    rst  $38
    rst  $38
    ld   c, $09
    nop
    ld   c, $FF
    ld   [bc], a
    ld   c, $0E
    ld   c, $02
    rst  $38
    ld   bc, $0101
    add  hl, bc
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
    rrca
    ld   [label_C00], sp
    inc  c
    inc  bc
    inc  c
    inc  c
    inc  c
    nop
    nop
    nop
    inc  c
    nop
    inc  bc
    inc  bc
    nop
    add  hl, de
    nop
    ld   [label_30C], sp
    inc  c
    inc  c
    ld   [label_C19], sp
    dec  b
    inc  c
    nop
    nop
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
    rst  $38
    ld   bc, label_3FF
    inc  bc
    inc  bc
    rst  $38
    inc  bc
    inc  bc
    rst  $38
    dec  bc
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rlca
    rlca
    rst  $38
    rst  $38
    ld   b, $FF
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   c, $0E
    rst  $38
    rst  $38
    ld   c, $0E
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
    rla
    rla
    rla
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    dec  bc
    rst  $38
    dec  c
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
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
    add  hl, bc
    ld   bc, $0000
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, $FF0C
    rst  $38
    rst  $38
    ld   a, [de]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    ld   bc, label_C0C
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    dec  b
    dec  b
    dec  b
    ld   bc, label_505
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    inc  b
    dec  b
    inc  b
    inc  b
    inc  b
    nop
    ld   [label_404], sp
    ld   [$0008], sp
    ld   [label_808], sp
    ld   [label_808], sp
    dec  b
    dec  b
    ld   [label_C0C], sp
    ld   [label_504], sp
    inc  c
    inc  b
    ld   [label_505], sp
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    dec  b
    inc  c
    inc  c
    inc  c
    inc  c
    inc  bc
    inc  bc
    nop
    inc  bc
    rst  $38
    ld   [label_C00], sp
    inc  c
    inc  b
    inc  b
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    rst  $38
    ld   bc, $0100
    ld   bc, $0008
    ld   [label_808], sp
    ld   [label_C08], sp
    inc  c
    rst  $38
    ld   [label_408], sp
    inc  c
    inc  c
    inc  c
    inc  c
    nop
    ld   [label_C0C], sp
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    nop
    inc  c
    inc  c
    nop
    inc  c
    inc  c
    jr   label_830B5
    nop
    ld   [$0000], sp
    nop

label_830B5::
    dec  bc
    dec  bc
    nop
    nop
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    ld   c, $0B
    dec  bc
    dec  bc
    jr   label_830D3
    dec  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_830D3::
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, l
    ld   b, l
    ld   b, [hl]
    ld   b, [hl]
    nop
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    ld   b, h
    ld   d, b
    jr   nz, label_83159
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, l
    scf
    scf
    ld   c, a
    inc  e
    ld   c, a
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    ld   d, b
    ld   c, [hl]
    ld   [bc], a
    ld   a, l
    nop
    ld   c, $48
    ld   b, a
    scf
    ld   b, $06
    nop
    ld   d, c
    ld   d, b
    ld   d, b
    ld   h, d
    ld   h, d
    ld   h, d
    ld   [bc], a
    ld   a, l
    nop
    ld   c, $48
    ld   b, a
    scf
    ld   b, $06
    nop
    ld   d, c
    ld   d, c
    nop
    ld   h, d
    ld   h, d
    ld   h, d
    nop
    ld   b, c
    ld   a, [hl]
    ld   a, [hl]
    ld   a, d
    ld   b, $28
    jr   z, label_8312D
    ld   de, label_82364
    dec  l
    dec  l
    dec  l
    dec  l
    ld   bc, label_8342E
    ld   a, a
    jr   c, label_83151
    jr   z, label_83154
    ld   de, label_1111
    ld   h, h
    dec  l
    dec  l
    dec  l
    dec  l
    nop
    nop
    ld   a, [hl]
    nop
    nop
    jr   z, label_83163
    dec  b
    ld   e, b
    ld   e, c
    ld   e, d
    nop
    dec  l
    dec  l
    dec  l
    dec  l
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   z, label_83174
    ld   e, e
    ld   e, h
    nop
    ld   [de], a
    dec  l
    dec  l

label_83151::
    dec  l
    dec  l
    dec  a

label_83154::
    inc  bc
    ld   a, [bc]
    dec  bc
    add  hl, sp
    ld   h, c

label_83159::
    jr   label_83173
    ld   c, d
    inc  l
    ld   [hl], d
    nop
    ld   a, [hli]
    ld   l, a
    dec  l
    dec  l

label_83163::
    nop
    nop
    ld   b, e
    ld   a, [bc]
    ld   b, b
    ld   a, $00
    nop
    ld   [hl], l
    ld   e, a
    ld   [hl], e
    ld   [hl], b
    ld   a, [hli]
    ld   l, a
    dec  l
    dec  l

label_83173::
    inc  de

label_83174::
    inc  c
    ld   a, [bc]
    nop
    dec  sp
    nop
    dec  sp
    dec  sp
    ld   e, a
    ld   d, h
    scf
    ld   [hl], c
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    nop
    rrca
    inc  c
    add  hl, bc
    add  hl, bc
    nop
    dec  sp
    dec  sp
    dec  sp
    ld   [hl], a
    ld   [hl], d
    ld   [hl], b
    ld   c, e
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   [label_708], sp
    rlca
    inc  a
    inc  a
    inc  a
    nop
    ld   a, b
    inc  hl
    ld   h, $57
    inc  [hl]
    dec  [hl]
    dec  e
    ld   a, e
    rlca
    rlca
    rlca
    rlca
    inc  a
    inc  a
    inc  a
    ld   a, d
    ld   a, c
    ld   h, $1F
    ld   d, e
    cpl
    inc  [hl]
    nop
    ld   c, l
    rlca
    rlca
    nop
    ld   b, d
    nop
    sub  a, b
    sub  a, c
    ld   h, $26
    dec  h
    ld   [hl], $33
    ld   sp, label_83C30
    ld   c, l
    rlca
    rlca
    rlca
    nop
    sub  a, b
    sub  a, b
    sub  a, c
    nop
    rra
    ld   h, $1F
    nop
    jr   nc, label_831F2
    ld   c, h
    ld   a, h
    ld   bc, label_E03
    rlca
    rlca
    nop
    dec  b
    ld   bc, label_300
    inc  e
    dec  b
    ld   bc, $0101
    nop
    nop
    ld   [bc], a
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    nop
    nop
    ld   h, e

label_831F2::
    ld   h, e
    inc  d
    nop
    inc  d
    inc  d
    nop
    ld   b, $13
    ld   b, $13
    inc  de
    ld   c, $08
    inc  de
    ld   [label_706], sp
    ld   b, $06
    nop
    nop
    dec  de
    dec  de
    ld   b, $1B
    ld   b, $00
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    jr   label_8322D
    jr   label_8322F
    nop
    dec  d
    nop
    nop
    rla
    nop
    rla
    rla
    ld   b, $17
    ld   b, $00
    jr   label_83261
    inc  a
    inc  a
    rla
    rla
    rla
    rla
    rla
    ld   c, $16
    nop

label_8322F::
    rla
    ld   bc, label_3333
    nop
    nop
    ld   c, $31
    add  hl, de
    jr   nc, label_8326C
    ldd  [hl], a
    nop
    nop
    ldd  [hl], a
    ldd  [hl], a
    nop
    ldd  [hl], a
    jr   nc, label_83273
    nop
    jr   nc, label_83278
    nop
    jr   nc, label_83279
    nop
    jr   nc, label_8327C
    jr   nc, label_8327E
    jr   nc, label_83283
    inc  sp
    nop
    ld   bc, label_1E1E
    rrca
    ld   e, $1E
    dec  e
    nop
    nop
    inc  h
    inc  h
    inc  h
    nop
    inc  h
    inc  h

label_83261::
    inc  h
    inc  h
    inc  h
    nop
    ld   e, $1F
    rra
    ld   e, $1E
    inc  b
    inc  b

label_8326C::
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b

label_83273::
    inc  b
    inc  b
    inc  sp
    inc  sp
    inc  sp

label_83278::
    inc  sp

label_83279::
    inc  sp
    inc  sp
    inc  sp

label_8327C::
    inc  sp
    ld   h, h

label_8327E::
    ld   h, h
    add  a, b
    nop
    nop
    nop

label_83283::
    jr   z, label_832AD
    jr   z, label_832AF
    ld   h, c
    rrca
    ld   h, c
    nop
    nop
    jr   z, label_832B6
    nop
    dec  h
    ld   h, $61
    add  hl, hl
    daa
    nop
    jr   z, label_832F8
    nop
    ld   h, $00
    add  hl, hl
    ld   a, [hli]
    nop
    nop
    ld   h, d
    nop
    ld   h, c
    nop
    daa
    ld   h, c
    ld   h, c
    daa
    daa
    daa
    daa
    nop
    ld   h, c
    ld   h, e
    ld   h, e

label_832AD::
    inc  sp
    inc  sp

label_832AF::
    inc  sp
    inc  sp
    nop
    nop
    ld   b, h
    ld   b, h
    ld   b, h

label_832B6::
    nop
    ld   c, d
    ld   h, a
    ld   h, a
    nop
    ld   a, a
    nop
    nop
    inc  sp
    inc  sp
    nop
    ld   l, [hl]
    ld   a, [de]
    ld   h, a
    ld   h, a
    nop
    add  a, b
    ld   c, d
    ld   a, [hl]
    ld   h, a
    nop
    ld   a, a
    ld   a, a
    dec  a
    add  a, b
    stop
    ld   l, [hl]
    ld   a, [de]
    nop
    nop
    ccf
    inc  l
    inc  l
    ld   e, [hl]
    inc  [hl]
    add  hl, sp
    nop
    ld   e, a
    ld   h, b
    ld   a, $39
    dec  hl
    dec  hl
    nop
    add  hl, sp
    dec  l
    dec  l
    dec  l
    dec  l
    dec  l
    dec  l
    ld   l, $2D
    dec  l
    dec  l
    ld   l, $00
    dec  l
    dec  l
    nop
    ld   [hl], $00
    dec  [hl]
    rrca
    scf

label_832F8::
    dec  [hl]
    dec  [hl]
    nop
    scf
    nop
    jr   c, label_83334
    rrca
    dec  [hl]
    jr   c, label_83304
    rrca

label_83304::
    ld   e, h
    ld   d, [hl]
    nop
    ld   d, b
    ld   e, h
    nop
    ld   d, c
    ld   d, [hl]
    ld   e, b
    ld   e, e
    ld   e, e
    nop
    ld   d, h
    nop
    ld   d, c
    ld   e, d
    nop
    ld   e, c
    ld   e, c
    nop
    ld   d, a
    ld   e, d
    ld   e, c
    ld   e, c
    nop
    ld   e, h
    ld   e, h
    ld   d, d
    nop
    ld   d, l
    nop
    ld   e, h
    ld   e, h
    nop
    ld   d, e
    ld   d, d
    ld   d, d
    nop
    ld   e, e
    nop
    ld   e, h
    nop
    ld   d, e
    ld   d, d
    ld   e, e
    ld   e, d
    ld   d, e
    inc  sp

label_83334::
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    inc  sp
    ld   bc, $0101
    dec  a
    ld   bc, $0101
    ld   bc, label_16F
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    dec  a
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    ld   bc, label_82601
    ld   h, [hl]
    ld   h, [hl]
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, [hl]
    ld   h, [hl]
    ld   h, l
    dec  a
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, [hl]
    ld   h, [hl]
    ld   h, [hl]
    dec  c
    dec  c
    add  hl, bc
    ld   h, l
    add  hl, bc
    add  hl, bc
    add  hl, bc
    nop
    ld   c, c
    db   $10 ; Undefined instruction
    jr   nz, label_833A6
    ld   bc, label_A0A
    dec  bc
    inc  c
    add  hl, bc
    ld   c, e
    ld   h, l
    ld   h, l
    ld   c, h
    ld   h, l
    ld   h, l
    db   $10 ; Undefined instruction
    dec  bc
    ld   h, l
    add  hl, bc
    ld   bc, label_82565
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    dec  c
    dec  c
    nop
    nop
    ld   hl, label_2121
    ld   hl, label_2221
    ld   h, [hl]
    ld   h, l
    ld   h, l
    add  hl, bc
    add  hl, bc
    ld   h, [hl]
    dec  c
    dec  c
    ld   h, a
    ld   h, a
    ld   hl, label_2121
    ld   hl, label_80021
    ld   h, [hl]
    ld   b, c
    ld   a, l
    ld   c, l
    ld   c, l
    ld   b, [hl]
    ld   h, [hl]
    ld   h, [hl]
    db   $3A ; ldd  a, [hl]
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    add  hl, bc
    ld   h, [hl]
    ld   h, [hl]
    ld   h, l
    ld   h, l
    dec  sp
    ld   b, a
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    ld   h, l
    db   $3A ; ldd  a, [hl]
    ld   h, a
    ld   h, a
    ld   h, a
    ld   h, [hl]
    ld   a, h
    ld   h, l
    ld   h, l
    dec  sp
    ld   h, a
    ld   h, a
    ld   b, e
    ld   bc, label_80845
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    adc  a, [hl]
    ld   a, h
    ret  z
    and  h
    ld   c, d
    ld   a, h
    sub  a, e
    and  h
    push hl
    rst  $38
    ld   c, [hl]
    and  h
    sub  a, c
    add  a, e
    and  d
    and  h
    ld   b, d
    adc  a, d
    rst  $38
    and  h
    ld   b, d
    add  a, e
    and  d
    and  h
    add  a, c
    db   $E3 ; Undefined instruction
    and  d
    and  h
    push hl
    db   $E3 ; Undefined instruction
    rst  $38
    and  h
    push hl
    ld   b, e
    rst  $20
    and  h
    push hl
    and  $FF
    and  h
    push hl
    and  $E7
    and  h
    push hl
    ld   b, e
    and  h
    and  h
    adc  a, [hl]
    add  a, e
    and  h
    and  h
    ld   c, d
    add  a, e

label_8342E::
    ld   b, b
    and  h
    push hl
    ld   c, h
    rst  $20
    and  h
    ld   c, l
    add  a, e
    rst  $38
    and  h
    ld   b, d
    sub  a, d
    ld   e, d
    and  h
    ld   h, c
    sub  a, d
    ld   h, a
    and  h
    push hl
    rst  $38
    rst  $38
    and  h
    db   $E3 ; Undefined instruction
    adc  a, e
    rst  $38
    and  h
    db   $E3 ; Undefined instruction
    add  a, e
    db   $76 ; Halt
    and  h
    add  a, c
    ld   a, c
    db   $76 ; Halt
    and  h
    ld   h, c
    adc  a, e
    rst  $38
    and  h
    ld   l, h
    adc  a, e
    ld   l, e
    and  h
    rst  $38
    adc  a, e
    rst  $38
    and  h
    db   $E3 ; Undefined instruction
    adc  a, e
    and  d
    and  h
    push hl
    rst  $38
    rst  $38
    and  h
    ld   c, d
    adc  a, a
    ld   l, l
    and  h
    add  a, c
    ld   l, [hl]
    ld   d, d
    and  h
    ld   c, l
    ld   b, e
    and  d
    and  h
    ld   h, c
    ld   a, c
    db   $76 ; Halt
    and  h
    add  a, $7C
    ld   b, c
    and  h
    push bc
    ld   l, [hl]
    ld   l, a
    and  h
    push bc
    rst  $38
    ld   [hl], b
    and  h
    ld   h, c
    rst  $38
    ld   [hl], c
    and  h
    ld   h, c
    rst  $38
    ld   [hl], d
    and  h
    ld   h, c
    ld   a, c
    ld   [hl], e
    and  h
    ld   h, c
    ld   a, c
    rst  $38
    and  h
    db   $E3 ; Undefined instruction
    ld   a, c
    db   $76 ; Halt
    and  h
    ld   b, d
    add  a, d
    and  d
    and  h
    ld   b, d
    rst  $38
    add  a, d
    and  h
    ld   h, c
    ld   a, b
    and  d
    and  h
    add  a, c
    adc  a, a
    rst  $20
    and  h
    db   $E3 ; Undefined instruction
    adc  a, e
    adc  a, h
    and  h
    add  a, a
    ld   a, b
    and  d
    and  h
    ld   l, h
    ld   a, h
    ret  z
    and  h
    call nz, label_CFE6
    and  h
    rst  $38
    ld   l, [hl]
    ld   l, a
    and  h
    rst  $38
    and  $CF
    and  h
    rst  $38
    add  a, e
    rst  $38
    and  h
    call nz, label_83679
    and  h
    call nz, label_FFFF
    and  h
    call nz, label_CF43
    and  h
    rst  $38
    ld   a, c
    rst  $38
    and  h
    rst  $38
    rst  $38
    and  d
    and  h
    ld   h, c
    ld   a, c
    and  d
    and  h
    push hl
    rst  $38
    rst  $38
    and  h
    push hl
    add  a, d
    and  d
    and  h
    db   $E3 ; Undefined instruction
    add  a, e
    and  d
    and  h
    sub  a, c
    add  a, e
    db   $76 ; Halt
    and  h
    rst  $38
    ld   a, h
    and  d
    and  h
    db   $E3 ; Undefined instruction
    adc  a, e
    and  d
    and  h
    db   $E3 ; Undefined instruction
    rst  $38
    db   $76 ; Halt
    and  h
    rst  $38
    and  $A2
    and  h
    rst  $38
    ld   a, h
    and  d
    and  h
    add  a, c
    db   $E3 ; Undefined instruction
    call nc, label_E5A4
    and  $DC
    and  h
    add  a, a
    sub  a, $D7
    and  h
    ld   d, b
    ld   d, c
    and  d
    and  h
    ld   l, h
    adc  a, a
    and  d
    and  h
    ld   c, d
    add  a, e
    and  d
    and  h
    ld   c, d
    add  a, e
    rst  $38
    and  h
    add  a, c
    adc  a, a
    db   $76 ; Halt
    and  h
    db   $E3 ; Undefined instruction
    adc  a, e
    rst  $38
    and  h
    rst  $38
    ld   a, c
    rst  $38
    and  h
    add  a, c
    ld   l, [hl]
    rst  $38
    and  h
    add  a, c
    ld   l, [hl]
    adc  a, h
    and  h
    add  a, a
    adc  a, a
    db   $76 ; Halt
    and  h
    rst  $38
    adc  a, a
    rst  $38
    and  h
    add  a, a
    rst  $38
    rst  $38
    and  h
    add  a, a
    add  a, e
    db   $76 ; Halt
    and  h
    add  a, a
    add  a, e
    sbc  a, b
    and  h
    rst  $38
    ld   a, c
    db   $76 ; Halt
    and  h
    db   $E3 ; Undefined instruction
    add  a, e
    and  d
    and  h
    ld   h, c
    ld   a, c
    sub  a, e
    and  h
    rst  $38
    ld   a, c
    sub  a, e
    and  h
    call nz, label_FF79
    and  h
    rst  $38
    sub  a, d
    ld   e, d
    and  h
    ld   h, c
    sub  a, d
    adc  a, h
    and  h
    ld   b, d
    sub  a, d
    rst  $38
    and  h
    ld   h, c
    rst  $38
    rst  $38
    and  h
    ld   h, c
    rst  $38
    adc  a, h
    and  h
    rst  $38
    add  a, e
    sub  a, e
    and  h
    ld   h, c
    adc  a, e
    rst  $38
    and  h
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    and  h
    ld   h, c
    rst  $38
    ld   h, a
    and  h
    rst  $38
    rst  $38
    and  d
    and  h
    add  a, a
    db   $E3 ; Undefined instruction
    sub  a, e
    and  h
    add  a, a
    rst  $38
    rst  $38
    and  h
    add  a, a
    sub  a, d
    ld   e, d
    and  h
    add  a, $9C
    sbc  a, b
    and  h
    add  a, $9C
    rst  $38
    and  h
    rst  $38
    sbc  a, h
    sub  a, e
    and  h
    add  a, c
    rst  $38
    rst  $38
    and  h
    rst  $38
    sbc  a, h
    sbc  a, b
    and  h
    rst  $38
    add  a, e
    rst  $38
    and  h
    add  a, c
    rst  $38
    sub  a, e
    and  h
    add  a, c
    sbc  a, h
    sub  a, e
    and  h
    ld   b, h
    sbc  a, h
    sbc  a, b
    and  h
    sub  a, c
    ld   a, b
    and  d
    and  h
    rst  $38
    ld   a, b
    and  d
    and  h
    ld   h, c
    rst  $38
    and  d
    and  h
    rst  $38
    ld   a, c
    and  d
    and  h
    ld   h, c
    add  a, e
    rst  $38
    and  h
    rst  $38
    add  a, e
    and  d
    and  h
    rst  $38
    ld   a, h
    rst  $38
    and  h
    db   $E3 ; Undefined instruction
    adc  a, e
    and  d
    and  h
    db   $E3 ; Undefined instruction
    add  a, e
    rst  $38
    and  h
    rst  $38
    add  a, e
    db   $76 ; Halt
    and  h
    ld   h, c
    add  a, e
    rst  $38
    and  h
    ld   h, c
    rst  $38
    db   $76 ; Halt
    and  h
    ld   h, c
    rst  $38
    and  d
    and  h
    add  a, c
    ld   l, [hl]
    rst  $38
    and  h
    add  a, c
    rst  $38
    adc  a, h
    and  h
    ld   c, d
    ld   a, h
    sub  a, e
    and  h
    sub  a, c
    ld   a, h
    and  d
    and  h
    ld   c, l
    ld   a, h
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    rst  $38
    rst  $38
    rst  $38
    and  h
    add  a, c
    adc  a, a
    call nc, label_81A4
    ld   a, c
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sub  a, b
    sub  a, c
    sub  a, d
    sbc  a, b
    sub  a, b
    sub  a, c
    xor  e
    rst  $38
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, h
    sbc  a, a
    sub  a, b
    sub  a, c
    or   b
    or   c
    sub  a, b
    sub  a, c
    sbc  a, h
    sub  a, e
    sub  a, b
    sub  a, c
    sub  a, a
    sbc  a, e
    rst  $38
    rst  $38
    or   [hl]
    or   a
    and  h
    ld   c, h
    ld   c, c
    ld   b, [hl]
    and  h
    rst  $38
    ld   b, l
    ld   l, l
    and  h
    rst  $38
    ld   b, a
    ld   c, b
    and  h
    rst  $38
    ld   c, h
    ld   c, e
    sub  a, b
    sub  a, c
    sub  a, [hl]
    rst  $38
    rst  $38
    rst  $38
    ld   c, a
    ld   d, b
    rst  $38
    rst  $38

label_83679::
    ld   c, a
    ld   d, c
    and  h
    add  a, a
    add  a, h
    adc  a, c
    and  h
    rst  $38
    adc  a, b
    rst  0
    and  b
    and  c
    add  a, h
    add  a, e
    sub  a, b
    sub  a, c
    ld   d, h
    and  [hl]
    sub  a, b
    sub  a, c
    sub  a, a
    sub  a, e
    sub  a, b
    sub  a, c
    xor  d
    rst  $38
    sub  a, b
    sub  a, c
    or   h
    or   l
    sub  a, b
    sub  a, c
    sbc  a, h
    sbc  a, [hl]
    sub  a, b
    sub  a, c
    sbc  a, h
    sbc  a, l
    ld   l, b
    sub  a, c
    ld   d, [hl]
    ld   h, b
    xor  h
    xor  l
    xor  [hl]
    xor  a
    sub  a, b
    sub  a, c
    ld   e, b
    sbc  a, e
    sub  a, b
    sub  a, c
    and  [hl]
    ld   e, c
    rst  $38
    rst  $38
    cp   b
    cp   c
    sub  a, b
    sub  a, c
    ld   h, d
    ld   h, e
    sub  a, b
    sub  a, c
    xor  b
    sbc  a, a
    and  h
    rst  $18
    and  e
    rst  $38
    sub  a, b
    sub  a, c
    sub  a, d
    sbc  a, d
    and  h
    ld   e, e
    ld   e, h
    rst  $38
    and  [hl]
    sub  a, c
    sub  a, a
    sbc  a, e
    sub  a, b
    sub  a, c
    sbc  a, h
    ld   h, b
    rst  $38
    rst  $38
    or   d
    or   e
    and  [hl]
    sub  a, c
    ld   d, a
    rst  $38
    and  [hl]
    sub  a, c
    sub  a, l
    sbc  a, b
    and  [hl]
    sub  a, c
    ld   e, [hl]
    ld   h, b
    and  [hl]
    sub  a, c
    xor  d
    sub  a, e
    and  [hl]
    sub  a, c
    ld   e, b
    sbc  a, c
    sub  a, b
    sub  a, c
    sub  a, l
    sub  a, e
    ld   e, a
    sub  a, c
    ld   d, l
    sbc  a, c
    ld   h, [hl]
    sub  a, c
    ld   e, [hl]
    ld   e, c
    ld   h, [hl]
    sub  a, c
    ld   d, h
    ld   e, c
    adc  a, l
    adc  a, [hl]
    adc  a, a
    ld   l, d
    ld   l, b
    sub  a, c
    sbc  a, e
    ld   h, b
    ld   l, b
    sub  a, c
    sub  a, h
    sbc  a, a
    ld   l, b
    sub  a, c
    sbc  a, h
    ld   h, b
    ld   e, a
    ld   h, l
    ld   e, l
    ld   h, h
    rst  $38
    sub  a, c
    ld   d, l
    rst  $38
    ld   e, a
    sub  a, c
    sub  a, l
    sbc  a, c
    ld   e, a
    sub  a, c
    ld   e, [hl]
    sbc  a, c
    ld   e, a
    sub  a, c
    xor  c
    rst  $38
    ld   e, a
    sub  a, c
    sub  a, h
    sbc  a, a
    sub  a, b
    sub  a, c
    ld   d, l
    sub  a, e
    and  h
    rst  $38
    ld   a, h
    rst  $38
    cp   h
    cp   l
    cp   [hl]
    cp   a
    and  [hl]
    sub  a, c
    sbc  a, h
    sbc  a, l
    rst  $38
    push de
    ld   a, b
    ld   d, e
    sub  a, b
    sub  a, c
    rst  $38
    rst  $38
    ld   e, a
    sub  a, c
    ld   d, l
    sbc  a, b
    and  h
    rst  $38
    rst  $38
    ld   l, c
    and  h
    rst  $38
    ld   c, h
    ld   [hl], h
    and  b
    and  c
    ld   [hl], l
    ld   c, [hl]
    and  h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    and  h
    rst  $38
    rst  $38
    rst  0
    ret  nz
    pop  bc
    jp   nz, label_A4C3
    call z, label_CECD
    and  h
    ret
    jp   z, label_A4CB
    pop  de
    jp   nc, label_DD6A
    push hl
    db   $D3 ; Undefined instruction
    db   $DD
    db   $FF
    rst  $38
    sbc  a, $FF
    and  h
    adc  a, l
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    ld   c, c
    rst  $38
    rst  $38
    call nz, label_FFFF
    and  h
    add  a, b
    ld   a, h
    and  l
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   d
    cp   e
    ld   [hl], a
    sub  a, c
    and  a
    rst  $38
    ld   a, e
    sub  a, c
    ld   a, d
    xor  e
    ld   a, e
    sub  a, c
    ld   d, a
    sbc  a, c
    ld   [hl], a
    sub  a, c
    ld   a, d
    xor  d
    ld   a, e
    sub  a, c
    ld   d, h
    sbc  a, c
    ld   a, e
    sub  a, c
    ld   d, [hl]
    rst  $38
    ld   [hl], a
    sub  a, c
    ld   d, h
    sbc  a, c
    ld   a, e
    sub  a, c
    rst  $38
    rst  $38
    ld   e, a
    sub  a, c
    sbc  a, l
    sbc  a, c
    ld   a, e
    sub  a, c
    sub  a, [hl]
    sbc  a, c
    ld   a, e
    sub  a, c
    ld   a, d
    sbc  a, c
    ld   [hl], a
    sub  a, c
    ld   a, d
    sbc  a, c
    ld   [hl], a
    sub  a, c
    sub  a, [hl]
    sbc  a, c
    ld   e, a
    sub  a, c
    ld   d, l
    sub  a, e
    rst  $38
    sub  a, c
    sub  a, l
    sub  a, e
    sub  a, b
    sub  a, c
    ld   d, l
    sub  a, e
    and  [hl]
    sub  a, c
    sub  a, l
    ld   h, b
    and  [hl]
    sub  a, c
    sub  a, l
    sbc  a, c
    ld   e, a
    reti
    jp  c, label_81FDB
    reti
    jp  c, label_FF64
    sub  a, c
    sub  a, b
    db   $76 ; Halt
    rst  $38
    sub  a, c
    sub  a, b
    sbc  a, b
    rst  $38
    ld   c, d
    sub  a, b
    db   $76 ; Halt
    ld   e, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    sub  a, b
    and  [hl]
    and  h
    rst  $38
    rst  $38
    db   $F4 ; Undefined instruction
    db   $E8 ; add  sp, d
    jp   hl
    ld   [$FFEB], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    and  c
    ld   [hl], l
    ld   c, [hl]
    rst  $38
    ld   h, c
    rst  $38
    rst  $38
    and  h
    rst  $38
    add  a, [hl]
    rst  $38
    and  h
    rst  $38
    adc  a, e
    rst  $38
    and  h
    ld   c, l
    rst  $38
    rst  $38

label_8383F::
    ld   b, l
    ld   a, b
    ld   a, l
    ld   a, b
    or   l
    ld   a, b
    nop
    nop
    push bc
    ld   c, h
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a
    nop
    nop
    ld   h, d
    inc  a
    push hl
    ld   l, b
    sub  a, $5E
    nop
    nop
    nop
    jr   nz, label_8385A

label_8385A::
    ld   d, b
    xor  l
    dec  [hl]
    nop
    nop
    rrca
    ld   h, [hl]
    sub  a, $6E
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    rrca
    ld   h, [hl]
    sub  a, $6E
    rst  $38
    ld   a, a
    xor  h
    ld   e, c
    rrca
    ld   h, [hl]
    sub  a, $6E
    rst  $38
    ld   a, a
    ld   c, c
    ld   c, l
    rrca
    ld   h, [hl]
    sub  a, $6E
    rst  $38
    ld   a, a
    nop
    nop
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a
    push bc
    ld   c, h
    nop

label_83886::
    nop
    push hl
    ld   l, b
    sub  a, $5E
    ld   h, d
    inc  a
    nop
    nop
    nop
    ld   d, b
    xor  l
    dec  [hl]
    nop
    jr   nz, label_83896

label_83896::
    nop
    sub  a, $6E
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    push bc
    ld   c, h
    sub  a, $6E
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    ld   h, d
    inc  a
    sub  a, $6E
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    nop
    jr   nz, label_83886
    ld   l, [hl]
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    nop
    nop
    rst  $38
    ld   a, a
    push bc
    ld   c, h
    ld   l, b
    ld   a, l
    nop
    nop
    sub  a, $5E
    ld   h, d
    inc  a
    push hl
    ld   l, b
    nop
    nop
    xor  l
    dec  [hl]
    nop
    jr   nz, label_838CC

label_838CC::
    ld   d, b
    nop
    nop
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    sub  a, $6E
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    sub  a, $6E
    push hl
    ld   l, b
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    sub  a, $6E
    nop
    ld   d, b
    rst  $38
    ld   a, a
    rrca
    ld   h, [hl]
    sub  a, $6E
    ld   a, [$D000]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_8383F
    add  hl, de
    ld   a, [hli]
    ld   b, a
    ld   h, [hl]
    ld   l, b
    ld   bc, $0038
    ld   de, $DC10
    call label_2914
    xor  a
    ld   [$DDD3], a
    ld   a, $1C
    ld   [$DDD4], a
    ld   a, $81
    ld   [$DDD1], a
    ret

label_83915::
    nop
    nop
    db   $10 ; Undefined instruction
    nop
    ld   [label_1704], sp
    nop
    db   $10 ; Undefined instruction
    rla
    nop
    jr   label_8392A
    scf
    nop
    jr   nz, label_8392C
    scf
    nop

label_8392A::
    jr   z, label_8393C

label_8392C::
    scf
    stop
    ld   [label_1017], sp
    ld   [label_170A], sp
    db   $10 ; Undefined instruction
    inc  c
    rla
    db   $10 ; Undefined instruction
    inc  c

label_8393C::
    scf
    db   $10 ; Undefined instruction
    ld   a, [bc]
    scf
    db   $10 ; Undefined instruction
    ld   [label_2037], sp
    db   $10 ; Undefined instruction
    rla
    jr   nz, label_83963
    jr   nc, label_83964
    jr   nc, label_8395F
    jr   nz, label_83968
    jr   nc, label_8396B
    jr   nc, label_8396C
    ld   b, b
    db   $10 ; Undefined instruction
    rla
    ld   b, b
    jr   label_8398C
    rla
    ld   d, b
    db   $10 ; Undefined instruction
    rla
    ld   d, b
    jr   label_83994

label_83964::
    rla
    ld   h, b
    db   $10 ; Undefined instruction

label_83968::
    rla
    ld   h, b
    jr   label_8399C

label_8396C::
    rla
    ld   [hl], b
    db   $10 ; Undefined instruction
    rla
    ld   [hl], b
    jr   label_839A4
    rla
    add  a, b
    db   $10 ; Undefined instruction
    rla
    add  a, b
    jr   label_839AC
    rla
    sub  a, b
    db   $10 ; Undefined instruction
    rla
    sub  a, b
    jr   label_839B4
    rla
    and  b
    db   $10 ; Undefined instruction
    rla
    and  b
    jr   label_839BC

label_8398C::
    rla
    or   b
    db   $10 ; Undefined instruction
    rla
    or   b
    jr   label_839C4

label_83994::
    rla

label_83995::
    nop
    nop
    ld   [de], a
    rla
    nop
    ld   [label_1714], sp
    nop
    db   $10 ; Undefined instruction
    rla
    nop
    jr   label_839BA

label_839A4::
    scf
    nop
    jr   nz, label_839BC
    scf
    nop
    jr   z, label_839BE

label_839AC::
    scf
    stop
    jr   label_839C8
    db   $10 ; Undefined instruction
    ld   a, [de]

label_839B4::
    rla
    db   $10 ; Undefined instruction
    inc  e
    rla
    db   $10 ; Undefined instruction
    inc  e

label_839BC::
    scf
    db   $10 ; Undefined instruction
    ld   a, [de]
    scf
    db   $10 ; Undefined instruction
    jr   label_839FC
    jr   nz, label_839D7
    ld   b, b

label_839C8::
    rla
    jr   nz, label_839E3
    ld   d, b
    rla
    jr   nc, label_839DF
    ld   b, b
    rla
    jr   nc, label_839EB
    ld   d, b
    rla
    ld   b, b
    db   $10 ; Undefined instruction
    rla
    ld   b, b
    jr   label_83A2C
    rla
    ld   d, b
    db   $10 ; Undefined instruction
    rla
    ld   d, b
    jr   label_83A34
    rla
    ld   h, b
    db   $10 ; Undefined instruction
    rla
    ld   h, b
    jr   label_83A3C
    rla
    ld   [hl], b
    db   $10 ; Undefined instruction
    rla
    ld   [hl], b
    jr   label_83A44
    rla
    add  a, b
    db   $10 ; Undefined instruction
    rla
    add  a, b
    jr   label_83A4C

label_839FC::
    rla
    sub  a, b
    db   $10 ; Undefined instruction
    rla
    sub  a, b
    jr   label_83A54
    rla
    and  b
    db   $10 ; Undefined instruction
    rla
    and  b
    jr   label_83A5C
    rla
    or   b
    db   $10 ; Undefined instruction
    rla
    or   b
    jr   label_83A64
    rla

label_83A15::
    nop
    nop
    ldi  [hl], a
    rla
    nop
    ld   [label_1724], sp
    nop
    db   $10 ; Undefined instruction
    rla
    nop
    jr   label_83A4A
    scf
    nop
    jr   nz, label_83A4C
    scf
    nop
    jr   z, label_83A4E

label_83A2C::
    scf
    stop
    jr   z, label_83A48
    db   $10 ; Undefined instruction
    ld   a, [hli]

label_83A34::
    rla
    db   $10 ; Undefined instruction
    inc  l
    rla
    db   $10 ; Undefined instruction
    inc  l

label_83A3C::
    scf
    db   $10 ; Undefined instruction
    ld   a, [hli]
    scf
    db   $10 ; Undefined instruction
    jr   z, label_83A7C
    jr   nz, label_83A57
    ld   h, b

label_83A48::
    rla
    jr   nz, label_83A63
    ld   [hl], b

label_83A4C::
    rla
    jr   nc, label_83A5F
    ld   h, b
    rla
    jr   nc, label_83A6B
    ld   [hl], b

label_83A54::
    rla
    ld   b, b
    db   $10 ; Undefined instruction
    rla
    ld   b, b
    jr   label_83ACC

label_83A5C::
    rla
    ld   d, b
    db   $10 ; Undefined instruction
    rla
    ld   d, b
    jr   label_83AD4

label_83A64::
    rla
    ld   h, b
    db   $10 ; Undefined instruction
    rla
    ld   h, b
    jr   label_83ADC
    rla
    ld   [hl], b
    db   $10 ; Undefined instruction
    rla
    ld   [hl], b
    jr   label_83AE4
    rla
    add  a, b
    db   $10 ; Undefined instruction
    rla
    add  a, b
    jr   label_83AEC

label_83A7C::
    rla
    sub  a, b
    db   $10 ; Undefined instruction
    rla
    sub  a, b
    jr   label_83AF4
    rla
    and  b
    db   $10 ; Undefined instruction
    rla
    and  b
    jr   label_83AFC
    rla
    or   b
    db   $10 ; Undefined instruction
    rla
    or   b
    jr   label_83B04
    rla

label_83A95::
    nop
    nop
    ldd  [hl], a
    rla
    nop
    ld   [label_1734], sp
    nop
    db   $10 ; Undefined instruction
    rla
    nop
    jr   label_83ADA
    scf
    nop
    jr   nz, label_83ADC
    scf
    nop
    jr   z, label_83ADE
    scf
    stop
    jr   c, label_83AC8
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    rla
    db   $10 ; Undefined instruction
    inc  a
    rla
    db   $10 ; Undefined instruction
    inc  a
    scf
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    scf
    db   $10 ; Undefined instruction
    jr   c, label_83AFC
    jr   nz, label_83AD7
    ld   d, d

label_83AC8::
    rla
    jr   nz, label_83AE3
    ld   h, d

label_83ACC::
    rla
    jr   nc, label_83ADF
    ld   d, d
    rla
    jr   nc, label_83AEB
    ld   h, d

label_83AD4::
    rla
    ld   b, b
    db   $10 ; Undefined instruction
    rla
    ld   b, b

label_83ADA::
    jr   label_83B3E

label_83ADC::
    rla
    ld   d, b

label_83ADE::
    db   $10 ; Undefined instruction
    rla
    ld   d, b
    jr   label_83B46

label_83AE4::
    rla
    ld   h, b
    db   $10 ; Undefined instruction
    rla
    ld   h, b
    jr   label_83B4E

label_83AEC::
    rla
    ld   [hl], b
    db   $10 ; Undefined instruction
    rla
    ld   [hl], b
    jr   label_83B56

label_83AF4::
    rla
    add  a, b
    db   $10 ; Undefined instruction
    rla
    add  a, b
    jr   label_83B5E

label_83AFC::
    rla
    sub  a, b
    db   $10 ; Undefined instruction
    rla
    sub  a, b
    jr   label_83B66

label_83B04::
    rla
    and  b
    db   $10 ; Undefined instruction
    rla
    and  b
    jr   label_83B6E
    rla
    or   b
    db   $10 ; Undefined instruction
    rla
    or   b
    jr   label_83B76
    rla

label_83B15::
    nop
    nop
    ld   b, d
    rla
    nop
    ld   [label_1744], sp
    nop
    db   $10 ; Undefined instruction
    rla
    nop
    jr   label_83B6A

label_83B24::
    scf
    nop
    jr   nz, label_83B6C
    scf
    nop
    jr   z, label_83B6E
    scf
    stop
    ld   c, b
    rla
    db   $10 ; Undefined instruction
    ld   c, d
    rla
    db   $10 ; Undefined instruction
    ld   c, h
    rla
    db   $10 ; Undefined instruction
    ld   c, h
    scf
    db   $10 ; Undefined instruction
    ld   c, d
    scf
    db   $10 ; Undefined instruction
    ld   [label_2037], sp

label_83B46::
    db   $10 ; Undefined instruction
    rla
    jr   nz, label_83B63
    ld   h, [hl]
    rla
    jr   nc, label_83B5F
    ld   d, [hl]
    rla
    jr   nc, label_83B6B
    ld   h, [hl]
    rla
    ld   b, b

label_83B56::
    db   $10 ; Undefined instruction
    rla
    ld   b, b
    jr   label_83BC2
    rla
    ld   d, b

label_83B5E::
    db   $10 ; Undefined instruction
    rla
    ld   d, b
    jr   label_83BCA
    rla
    ld   h, b

label_83B66::
    db   $10 ; Undefined instruction
    rla
    ld   h, b

label_83B6A::
    jr   label_83BD2

label_83B6C::
    rla
    ld   [hl], b

label_83B6E::
    db   $10 ; Undefined instruction
    rla
    ld   [hl], b
    jr   label_83BDA
    rla
    add  a, b

label_83B76::
    db   $10 ; Undefined instruction
    rla
    add  a, b
    jr   label_83BE2
    rla
    sub  a, b
    db   $10 ; Undefined instruction
    rla
    sub  a, b
    jr   label_83BEA
    rla
    and  b
    db   $10 ; Undefined instruction
    rla
    and  b
    jr   label_83BF2
    rla
    or   b
    db   $10 ; Undefined instruction
    rla
    or   b
    jr   label_83BFA
    rla

label_83B95::
    ld   [hl], b
    ld   l, b
    ld   h, b
    ld   e, b
    ld   d, b
    ld   c, b
    ld   b, b
    jr   c, label_83BCE
    jr   nc, label_83BD0
    jr   nc, label_83BD2
    jr   nc, label_83B24
    ld   a, b
    push bc
    ld   a, [$FFEC]
    swap a
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_83B95
    add  hl, de
    ld   b, [hl]
    ld   hl, label_83915
    ld   a, [$FFF1]
    cp   $05
    jr   z, label_83BFC
    and  a
    jr   z, label_83BD4
    ld   hl, label_83995

label_83BC2::
    dec  a
    jr   z, label_83BD4
    ld   hl, label_83A15
    dec  a
    jr   z, label_83BD4
    ld   hl, label_83A95

label_83BCE::
    dec  a
    jr   z, label_83BD4
    ld   hl, label_83B15

label_83BD4::
    ld   de, $C00C
    ld   c, $00

label_83BD9::
    ld   a, c

label_83BDA::
    and  $03
    cp   $00
    jr   nz, label_83BE4
    ld   a, [$FFEC]

label_83BE2::
    jr   label_83BF0

label_83BE4::
    cp   $01
    jr   nz, label_83BF3
    push hl
    ld   hl, $C155
    ld   a, [$FFEE]
    sub  a, [hl]
    pop  hl

label_83BF0::
    add  a, [hl]
    jr   label_83BF4

label_83BF3::
    ld   a, [hl]

label_83BF4::
    ld   [de], a
    inc  hl
    inc  de
    inc  c
    ld   a, c
    cp   b

label_83BFA::
    jr   nz, label_83BD9

label_83BFC::
    pop  bc
    ret

label_83BFE::
    ld   c, b
    ld   [hl], c
    ld   sp, label_3156
    ld   d, [hl]
    sbc  a, h
    ld   [hl], e
    daa
    ld   h, l
    rst  $28
    ld   c, l
    rst  $28
    ld   c, l
    add  hl, sp
    ld   h, a
    ld   b, $69
    xor  l
    ld   b, l
    xor  l
    ld   b, l
    sub  a, $5A
    push hl
    ld   c, h
    ld   l, e
    dec  a
    ld   l, e
    dec  a
    ld   [hl], e
    ld   c, [hl]
    and  h
    inc  a
    add  hl, hl
    ld   sp, label_3129
    rst  $28
    dec  a
    ld   a, [$D00D]
    cp   $50
    ret  nc
    ld   b, a
    and  $0F
    ret  nz

label_83C30::
    ld   a, b
    and  $F0
    srl  a
    ld   c, a
    ld   b, $00
    push bc
    ld   hl, label_83BFE
    add  hl, bc
    ld   bc, $0008
    ld   de, $DC10
    call label_2914
    pop  bc
    ld   a, c
    cp   $20
    jr   z, label_83C50
    ld   a, $04
    jr   label_83C5B

label_83C50::
    ld   hl, $DC48
    ld   a, $A4
    ldi  [hl], a
    ld   a, $3C
    ld   [hl], a
    ld   a, $20

label_83C5B::
    ld   [$DDD4], a
    xor  a
    ld   [$DDD3], a
    ld   a, $81
    ld   [$DDD1], a
    ret

label_83C68::
    nop
    add  hl, de
    ld   e, e
    ld   b, $03
    db   $10 ; Undefined instruction
    ld   b, $05
    ld   [label_659], sp
    ld   [$EB20], sp
    dec  b
    nop
    jr   nz, label_83C65
    dec  b
    ld   [$DF18], sp
    dec  b
    nop
    jr   label_83C61
    dec  b
    ld   [$CF10], sp
    dec  b
    nop

label_83C89::
    db   $10 ; Undefined instruction
    dec  b
    ld   [$C108], sp
    dec  b
    nop
    ld   [label_5C0], sp
    stop
    ld   e, l
    dec  b
    ld   [label_81C00], sp
    dec  b
    ld   [$EB20], sp
    dec  b
    nop
    jr   nz, label_83C8D
    dec  b
    ld   [$DF18], sp
    dec  b
    nop
    jr   label_83C89
    dec  b
    ld   [$CF10], sp
    dec  b
    nop

label_83CB1::
    db   $10 ; Undefined instruction
    dec  b
    ld   [$C108], sp
    dec  b
    nop
    ld   [label_5C0], sp
    stop
    ld   e, a
    dec  b
    ld   [label_81E00], sp
    dec  b
    ld   [$EB20], sp
    dec  b
    nop
    jr   nz, label_83CB5
    dec  b
    ld   [$DF18], sp
    dec  b
    nop
    jr   label_83CB1
    dec  b
    ld   [$CF10], sp
    dec  b
    nop

label_83CD9::
    db   $10 ; Undefined instruction
    dec  b
    ld   [$D108], sp
    dec  b
    nop
    ld   [label_5D0], sp
    stop
    db   $ED ; Undefined instruction
    dec  b
    ld   [$EC00], sp
    dec  b
    ld   [$EB20], sp
    dec  b
    nop
    jr   nz, label_83CDD
    dec  b
    ld   [$DF18], sp
    dec  b
    nop
    jr   label_83CD9
    dec  b
    ld   [$CF10], sp
    dec  b
    nop
    db   $10 ; Undefined instruction
    dec  b
    ld   [$D108], sp
    dec  b
    nop
    ld   [label_5D0], sp
    stop
    rst  $28
    dec  b
    ld   [$EE00], sp
    dec  b

label_83D14::
    ld   [hl], h
    ld   a, h
    sbc  a, h
    ld   a, h
    call nz, label_EC7C
    ld   a, h
    ld   a, $6C
    ld   [$C3C0], a
    ld   a, [$FFE7]
    and  $60
    swap a
    ld   e, a
    ld   d, $00
    ld   hl, label_83D14
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   h, [hl]
    ld   l, d
    ld   c, $28
    call label_83D40
    ld   hl, label_83C68
    ld   c, $0C
    call label_83D40
    ret

label_83D40::
    push bc
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C000
    add  hl, de
    ld   d, h
    ld   e, l
    pop  hl
    ld   a, c
    srl  a
    srl  a
    ld   c, a

label_83D55::
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_83D55
    pop  bc
    ld   a, [$C3C0]
    add  a, c
    cp   $A0
    jr   c, label_83D74
    xor  a

label_83D74::
    ld   [$C3C0], a
    ld   a, [$C123]
    ld   c, a
    ret
    ld   a, $03
    ld   [$FFE4], a
    ld   a, $06
    ld   [$FFE5], a
    ld   a, $0C
    ld   [$FFE6], a
    ld   hl, $DC10
    ld   d, $24
    call label_83D97
    ld   a, $01
    ld   [$DDD1], a
    xor  a
    ret

label_83D97::
    push hl
    ld   a, [$FFE4]
    ld   c, a
    ld   a, [hl]
    and  $1F
    jr   z, label_83DA4
    sub  a, c
    jr   nc, label_83DA4
    xor  a

label_83DA4::
    ld   [$FFD7], a
    ld   a, [$FFE5]
    ld   c, a
    ld   a, [hli]
    and  $E0
    swap a
    ld   b, a
    ld   a, [hl]
    and  $03
    swap a
    or   b
    and  $3E
    jr   z, label_83DBD
    sub  a, c
    jr   nc, label_83DBD
    xor  a

label_83DBD::
    ld   [$FFD8], a
    ld   a, [$FFE6]
    ld   c, a
    ld   a, [hl]
    and  $7C
    jr   z, label_83DCB
    sub  a, c
    jr   nc, label_83DCB
    xor  a

label_83DCB::
    ld   [$FFD9], a
    pop  hl
    ld   a, [$FFD7]
    ld   b, a
    ld   a, [$FFD8]
    swap a
    ld   c, a
    and  $E0
    or   b
    ldi  [hl], a
    ld   a, [$FFD9]
    ld   b, a
    ld   a, c
    and  $03
    or   b
    ldi  [hl], a
    dec  d
    jr   nz, label_83D97
    ret
    ld   c, $10
    ld   b, $68
    ld   a, $38
    ld   h, $20
    call label_A13
    ld   c, $11
    ld   b, $69
    ld   a, $38
    ld   h, $20
    call label_A13
    ld   c, $12
    ld   b, $6A
    ld   a, $38
    ld   h, $20
    call label_A13
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

label_83EAE::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_83F7F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
