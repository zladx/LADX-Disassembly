section "bank45",romx,bank[$2D]
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

label_B400F::
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
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    jp   nz, label_B43FC

label_B4021::
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

label_B403F::
    nop
    nop
    ccf
    jr   nz, label_B4063
    ld   d, b
    adc  a, a
    jr   z, label_B400F
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
    jr   z, label_B4021
    ld   d, b
    adc  a, a
    and  b
    rra
    ld   b, b
    ccf
    ld   [bc], a
    db   $FC ; Undefined instruction
    dec  b

label_B4063::
    ld    hl, sp+$0A
    pop  af
    inc  d
    db   $E3 ; Undefined instruction
    jr   z, label_B4031
    ld   d, b
    adc  a, a
    jr   nz, label_B408D
    nop
    ccf
    ld   b, b
    ccf
    and  b
    rra
    ld   d, b
    adc  a, a
    jr   z, label_B403F
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

label_B4088::
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
    jr   label_B409F
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

label_B40BC::
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
    db   $76 ; Halt
    db   $EB ; Undefined instruction
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

label_B40FF::
    rst  $18

label_B4100::
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

label_B413E::
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
    jr   label_B4181
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
    ld  [$FF00+C], a
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
    ld   bc, label_B618F
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
    jr   label_B42A0
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
    jr   nz, label_B43A4

label_B43A4::
    ld   bc, label_800
    nop
    add  a, b
    nop
    nop
    nop
    ldi  [hl], a
    nop
    ld   [rJOYP], sp
    nop
    add  a, c
    ld   a, [hl]
    add  a, l
    ld   a, d
    and  c
    ld   e, [hl]
    add  a, c
    ld   a, [hl]
    adc  a, c
    db   $76 ; Halt
    add  a, c
    ld   a, [hl]
    rst  $38
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

label_B43FC::
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
    ld   bc, label_B7901
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
    or   b
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
    dec  c
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ccf
    ld   a, a
    ld   b, b
    ret  nz
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
    cp   $02
    inc  bc
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

label_B4465::
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
    rst  $38
    jp   label_B667E
    inc  a
    inc  a
    jr   label_B44B0
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
    jr   nz, label_B4465
    jr   nz, label_B4467
    ccf
    cp   a
    ccf
    cp   a
    ccf
    cp   h
    ccf
    cp   h

label_B44B0::
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

label_B44F6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_B44FF::
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

label_B450E::
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
    db   $E4 ; Undefined instruction
    ld   h, b
    db   $F4 ; Undefined instruction
    jr   nc, label_B451F
    jr   nc, label_B450E
    ld   h, b
    ret  nz
    ret  nz
    adc  a, b
    add  a, b
    ld   bc, $8B01
    inc  bc
    ld   b, a
    ld   b, $2F
    inc  c
    ld   l, a
    inc  c
    rst  0
    ld   b, $13
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
    jr   c, label_B44F6
    ld   a, h
    db   $10 ; Undefined instruction
    jr   c, label_B4567
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
    jr   label_B4581

label_B4581::
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
    jr   label_B4596

label_B4596::
    ld   b, b
    nop
    ld   a, [de]
    jr   label_B45D7
    inc  a
    ld   a, [hl]
    ld   h, [hl]
    rst  $38
    jp   label_BC3F
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

label_B45D7::
    rst  $38

label_B45D8::
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

label_B45F8::
    nop
    nop

label_B45FA::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    rst  $20
    nop
    call nz, label_403
    inc  bc
    inc  c
    inc  bc
    ld   a, h
    inc  bc
    ld   h, b
    rra
    ld   c, a
    ccf
    rlca
    nop
    rst  $20
    nop
    ld   h, e
    add  a, b
    jr   nz, label_B45D8
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
    add  a, $01
    rst  $20
    nop
    ld   [rJOYP], a
    ld   a, [$FF00+C]
    ld   b, $F8
    ld   a, $C0
    jr   nc, label_B45F8
    jr   nz, label_B45FA
    inc  hl
    ret  nz
    rst  $20
    nop
    rlca
    nop
    sub  a, c
    rrca
    ld   c, h
    inc  bc
    ld   c, $01
    adc  a, [hl]
    ld   bc, $8176
    ld   a, d
    add  a, c
    cp   h
    jp   label_FF80
    adc  a, c
    ld   a, [$FF32]
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
    db   $76 ; Halt
    add  a, c
    adc  a, [hl]
    ld   bc, $010E
    ld   c, h
    inc  bc
    sub  a, c
    rrca
    ld   bc, label_3DFF
    jp   label_815E
    ld   l, [hl]
    add  a, c
    ld   [hl], c
    add  a, b
    ld   [hl], b
    add  a, b
    ldd  [hl], a
    ret  nz
    adc  a, c
    ld   a, [$FF3C]
    nop
    add  hl, de
    nop
    jp   nz, label_B6601
    add  a, c
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
    jr   nc, label_B46B3
    sbc  a, b
    rlca
    call z, label_CF03
    nop
    sbc  a, [hl]
    ld   bc, label_F30
    daa
    rra
    pop  af
    adc  a, a
    ld   [hl], e

label_B46B3::
    rst  8
    ld   h, $FF
    dec  a
    cp   $1D
    cp   $26
    rst  $38
    ld   [hl], e
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
    jr   c, label_B4729
    ld   sp, label_B6BFE
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
    ld   a, [hl]
    rst  $38
    ld   [hl], a
    adc  a, $7B
    add  a, $5B
    and  $65
    cp   $7B
    db   $FC ; Undefined instruction
    sbc  a, $E1
    add  a, c
    rst  $38
    ld   a, [hl]
    rst  $38
    xor  $73
    sbc  a, $63
    jp  c, label_A667
    ld   a, a
    sbc  a, $3F
    ld   a, e
    add  a, a
    sbc  a, $E1
    ld   a, e
    db   $FC ; Undefined instruction
    ld   h, l
    cp   $5B
    and  $7B
    add  a, $77
    adc  a, $7E
    rst  $38
    add  a, c
    rst  $38
    ld   a, e
    add  a, a
    sbc  a, $3F
    and  [hl]
    ld   a, a
    jp  c, label_DE67
    ld   h, e
    xor  $73
    ld   a, [hl]
    rst  $38
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
    jp   nz, label_1901
    nop
    inc  a
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

label_B47AA::
    ld   h, h
    rst  $38
    adc  a, $F3
    adc  a, a
    pop  af
    db   $E4 ; Undefined instruction
    ld    hl, sp+$0C
    ld   a, [$FF79]
    add  a, b
    di
    nop
    inc  sp
    ret  nz
    add  hl, de
    ld   [$FF0C], a
    ld   a, [$FF02]
    db   $FC ; Undefined instruction
    jp   label_B66FF
    rst  $38
    cp   l
    ld   a, [hl]
    db   $DB
    inc  a

label_B47C8::
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
    jr   c, label_B47AA
    inc  [hl]
    sbc  a, a
    ldd  [hl], a

label_B480E::
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
    jr   c, label_B47C8
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
    jr   nc, label_B4862
    jr   nc, label_B4864
    ld   a, [$FFFF]
    ld   a, [$FFF7]
    nop

label_B484A::
    ei
    nop

label_B484C::
    db   $FD ; Undefined instruction
    nop

label_B484E::
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

label_B4862::
    db   $FD ; Undefined instruction
    nop

label_B4864::
    ei
    nop
    rst  $30
    nop
    rst  $38
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    jr   nc, label_B480E
    jr   nc, label_B48F0
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

label_B487C::
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
    jr   nc, label_B4842
    jr   nc, label_B4844
    jr   nc, label_B4846
    jr   nc, label_B4848
    jr   nc, label_B484A
    jr   nc, label_B484C
    jr   nc, label_B484E
    jr   nc, label_B487C
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
    db   $76 ; Halt
    db   $EB ; Undefined instruction
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

label_B48F0::
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
    ld  [$FF00+C], a
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
    db   $76 ; Halt
    ld    hl, sp+$EA
    db   $F4 ; Undefined instruction
    add  a, $F8
    ld   h, e
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

label_B4A32::
    ld   [label_B76F4], a
    ld    hl, sp+$3A
    db   $FC ; Undefined instruction
    ld   e, h
    cp   [hl]
    xor  [hl]
    ld   e, [hl]
    or   $0E
    nop
    nop
    jr   label_B4A49
    db   $10 ; Undefined instruction
    ld   [$C007], sp
    rlca
    and  b

label_B4A49::
    ld   b, e
    ld   b, b
    or   c
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    jr   label_B4A32
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
    jr   label_B4A77
    nop
    ccf
    nop
    rra
    ld   [bc], a
    adc  a, l
    dec  b

label_B4A77::
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
    ld   de, label_B40FF
    rst  $38
    ld   d, b
    cpl
    ld   sp, label_280F
    rla
    ld   [hl], b
    rrca
    ld   [hl], d
    rrca
    jr   nz, label_B4ACB
    jr   nc, label_B4ABD
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

label_B4ABD::
    rst  $38
    ld   e, e
    rst  $38
    add  a, c
    nop
    db   $76 ; Halt
    adc  a, c
    adc  a, c
    rst  $30
    and  e
    db   $89
    adc  a, c
    rst  $38
    db   $E3 ; Undefined instruction

label_B4ACB::
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
    db   $76 ; Halt
    db   $EB ; Undefined instruction
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
    ld   de, label_B44FF
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
    db   $76 ; Halt
    db   $EB ; Undefined instruction
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
    db   $76 ; Halt
    adc  a, c
    add  a, c
    nop
    ld   a, [$FF00+C]
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
    ld   [label_B6274], a
    cp   h
    ld   a, l
    cp   [hl]
    ld   b, c
    nop
    ld   b, c
    nop
    ld   b, l
    add  a, b
    pop  bc
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    inc  e
    db   $FC ; Undefined instruction
    nop
    jr   c, label_B4C0E

label_B4C0E::
    ld   [de], a
    nop
    ld    hl, sp+$00
    jr   label_B4C18
    inc  c
    nop
    inc  b
    add  a, e

label_B4C18::
    add  a, a
    ld   b, b
    rst  0
    nop
    ld   b, h
    jr   z, label_B4C8B
    db   $10 ; Undefined instruction
    nop
    stop
    sub  a, c
    ld   [label_2418], sp
    inc  a
    jp   label_E3
    pop  bc
    nop
    ret
    nop
    jr   c, label_B4C32

label_B4C32::
    db   $3A ; ldd  a, [hl]
    nop
    jr   c, label_B4C7A
    ld   h, h
    add  a, d
    add  a, $01
    sub  a, e
    nop
    add  a, e
    jr   c, label_B4C3E
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

label_B4C5F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B4C5F
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
    jr   label_B4C96
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    ccf
    ld   a, $41
    ld   a, $41
    inc  a
    ld   b, c
    jr   c, label_B4CCE
    nop
    ld   b, l
    nop
    ld   a, e
    nop
    nop
    nop
    ld   a, h
    nop
    ld   a, [hl]

label_B4C96::
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   c, $00
    or   $00
    ld    hl, sp+$00
    rlca
    nop
    ld   a, e
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
    or   $04
    ld   [$D20C], a
    inc  e
    ldi  [hl], a
    inc  a
    jp   nz, label_8200
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    add  a, c
    add  a, c
    add  a, c
    add  a, c
    jp   label_E781
    add  a, e
    rst  $38

label_B4CC9::
    ld   h, a
    rst  $38
    ccf
    ld   a, a
    inc  a

label_B4CCE::
    ccf
    jr   label_B4CC9
    nop
    jr   label_B4CD4

label_B4CD4::
    inc  a
    db   $10 ; Undefined instruction
    inc  h
    rst  $20
    rst  0
    rst  $28
    add  a, $FE
    call nz, label_FCFC
    ld   a, a
    ld   [de], a
    ccf
    db   $10 ; Undefined instruction
    ld   de, label_103F
    ld   a, a
    jr   c, label_B4CEA
    ld   h, a
    db   $E3 ; Undefined instruction
    pop  bc
    ret
    nop
    db   $FC ; Undefined instruction
    ld   a, b
    ld   a, [$F838]
    jr   c, label_B4CF3
    jr   z, label_B4CE7
    ld   b, h
    rst  $10
    add  a, d
    rst  0
    add  a, d
    rst  $38
    ret  nz
    ld   b, $00
    add  hl, hl
    dec  b
    rrca
    inc  bc
    nop
    nop
    jr   nz, label_B4D0A

label_B4D0A::
    ld   [bc], a
    nop
    ld   h, b
    nop
    or   c
    ld   b, b
    jr   nz, label_B4D12

label_B4D12::
    nop
    nop
    nop
    nop
    stop
    jr   z, label_B4D32
    jr   c, label_B4D2C
    nop
    nop
    add  a, b
    nop
    pop  af
    db   $10 ; Undefined instruction
    ld   h, b
    nop
    nop
    inc  c
    nop
    ld   d, d
    ld   [label_1216], sp

label_B4D2C::
    ld   e, $0C
    nop
    nop
    ld   b, d
    add  a, b

label_B4D32::
    ret  nz
    nop
    nop
    nop
    nop
    nop
    jr   label_B4D3A

label_B4D3A::
    inc  h
    db   $10 ; Undefined instruction
    inc  b
    inc  e
    jr   label_B4D40
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

label_B4D5F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B4D5F
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
    jr   label_B4D96
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    jr   label_B4D84

label_B4D84::
    dec  h
    inc  e
    ld   c, c
    jr   z, label_B4DD9
    db   $10 ; Undefined instruction
    jr   nz, label_B4D9D
    rrca
    inc  l
    rra
    ld   a, h
    nop
    add  a, d
    ld   a, [hl]
    dec  a
    ld   a, l

label_B4D96::
    jp   label_C3
    nop
    ld   b, $00
    ret

label_B4D9D::
    add  a, a
    dec  hl
    and  $29
    ld   e, $21
    rra
    jr   z, label_B4DC4
    ld   b, c
    inc  a
    ld   d, e
    add  hl, hl
    db   $76 ; Halt
    db   $3A ; ldd  a, [hl]
    dec  e
    inc  c
    ld   bc, $AA00
    and  $AA
    ldi  [hl], a
    ld   l, d
    ldi  [hl], a
    jp   z, label_12C6
    ld   c, $DA
    ld   c, $2E
    and  h
    ret  nz
    ret  nz
    ldi  [hl], a
    nop
    ld   a, $00

label_B4DC4::
    ld  [$FF00+C], a
    nop
    ld   b, c
    ld   bc, $0141
    ldi  [hl], a
    ld   [bc], a
    inc  e
    inc  e
    inc  b
    inc  b
    stop
    add  hl, bc
    nop
    ld   c, $0C
    ld   [$F808], sp

label_B4DD9::
    ld    hl, sp+$24
    inc  h
    ldi  [hl], a
    ldi  [hl], a
    ld   b, c
    ld   b, c
    ld   b, $04
    rlca
    rlca
    ret
    add  hl, bc
    jr   nc, label_B4DF8
    stop
    jr   label_B4DEC

label_B4DEC::
    ld   h, a
    nop
    ld   bc, label_B4100
    ld   b, c
    ld   sp, hl
    ld   sp, hl
    add  a, $86
    add  a, h
    add  a, h

label_B4DF8::
    add  a, h
    add  a, h
    cp   $C0
    ld   bc, $0000
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, a
    ld   h, b
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    ld   [rIE], a
    nop
    nop
    nop
    nop
    rst  $38
    rst  0
    jr   c, label_B4E22
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
    ld   bc, rJOYP
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    di
    inc  c
    rst  $38
    nop
    rst  $38
    nop
    nop
    ret  nz
    nop
    rst  $38
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

label_B4E5F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B4E5F
    rrca
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_B4E6F::
    nop
    rst  $28
    ld   [label_8DF], sp
    cpl
    jr   label_B4E96
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    pop  bc
    ldi  [hl], a
    ld   b, c
    ld   a, $1C
    and  d
    cp   [hl]
    ld   b, c
    sbc  a, h
    ld   b, c
    ld   bc, label_B6362
    sbc  a, h
    ld   sp, hl
    inc  b
    rst  $20
    db   $10 ; Undefined instruction
    ld   [label_FF0], sp

label_B4E96::
    rlca
    ld   [$F803], sp
    ret  c
    inc  h
    call c, label_DE23
    ld   hl, label_278
    ldd  [hl], a
    add  a, l
    add  a, a
    ld   c, b
    rst  8
    jr   nc, label_B4E6F
    stop
    add  hl, sp
    add  hl, sp
    add  a, $B9
    ld   b, d
    ld   c, $21
    nop
    pop  af
    ld   [hl], c
    adc  a, [hl]
    ld   a, e
    add  a, h
    add  hl, sp
    add  a, h
    nop
    add  a, $C6
    add  hl, sp
    rst  $28
    db   $10 ; Undefined instruction
    nop
    ld   a, $00
    ld  [$FF00+C], a
    nop
    ld   b, c
    ld   bc, $0141
    ldi  [hl], a
    ld   [bc], a
    inc  e
    inc  e
    inc  b
    inc  b
    stop
    add  hl, bc
    nop
    ld   c, $0C
    ld   [$F808], sp
    ld    hl, sp+$24
    inc  h
    ldi  [hl], a
    ldi  [hl], a
    ld   b, c
    ld   b, c
    ld   b, $04
    rlca
    rlca
    ret
    add  hl, bc
    jr   nc, label_B4EF8
    stop
    jr   label_B4EEC

label_B4EEC::
    ld   h, a
    nop
    ld   bc, label_B4100
    ld   b, c
    ld   sp, hl
    ld   sp, hl
    add  a, $86
    add  a, h
    add  a, h

label_B4EF8::
    add  a, h
    add  a, h
    cp   $C0
    ld   bc, $0000
    nop
    ld   a, [$FF00]
    ld   [de], a
    nop
    stop
    jr   label_B4F08

label_B4F08::
    rrca
    nop
    ld   bc, label_2100
    nop
    ld   bc, $0100
    nop
    ld   bc, label_B4100
    nop
    rrca
    nop
    jr   label_B4F1A

label_B4F1A::
    stop
    ld   [de], a
    nop
    ld   a, [$FF00]
    adc  a, a
    nop
    ld   [label_800], sp
    nop
    jr   label_B4F28

label_B4F28::
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
    jr   label_B4F3A

label_B4F3A::
    ld   [$8800], sp
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

label_B4F5F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B4F5F
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
    jr   label_B4F96
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
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
    ld   a, a
    nop
    rlca
    nop
    di
    nop
    ld   sp, hl
    nop

label_B4F96::
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
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    jr   label_B4FC4
    ld   a, [$FFF2]
    nop
    dec  b
    nop
    ld   a, [$FF00]
    ldd  [hl], a
    nop

label_B4FC4::
    jr   label_B4FD6
    inc  e
    jr   label_B5008
    rra
    rst  $38
    ld   a, a
    ld   [hl], c
    ld   sp, label_213F
    ld   hl, label_B6121
    ld   b, c
    ld   a, a
    ld   b, c

label_B4FD6::
    rst  $38
    ld   a, a
    db   $FC ; Undefined instruction
    ld    hl, sp+$B8
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $FC ; Undefined instruction
    ccf
    ccf
    ccf
    rrca
    dec  e
    ld   [label_187D], sp
    rst  $38
    rst  $38
    add  a, l
    ld   bc, $0081
    add  a, b
    nop
    add  a, $82
    sub  a, d
    add  a, d
    add  a, $82
    rst  $38
    rst  $38
    rst  $38
    sbc  a, b
    sbc  a, b
    ld   [label_808], sp
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

label_B5008::
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
    add  hl, bc
    nop
    ld   a, a
    dec  c
    ld   a, a
    cpl
    ld   a, a
    ccf
    rst  $38
    add  hl, sp
    ld   sp, hl
    or   b
    ld   a, [$FF62]
    ld   a, c
    ld   h, h
    jr   nc, label_B5062
    or   $30
    cp   $E4
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  e
    rra
    ld   c, l
    adc  a, a
    ld   b, $4E
    ld   h, $66
    ld   b, c

label_B5062::
    ld  [$FF00+C], a
    ret  z
    ld   l, a
    ld   b, b
    ld   [hl], c
    ld   h, h
    ld   a, [$FF60]
    jr   c, label_B507C
    rra
    inc  e
    inc  sp
    inc  bc
    ld   a, $02
    cpl
    add  a, d
    add  a, $12
    ld   h, $02
    sbc  a, a
    ld   [bc], a
    cp   $04

label_B507C::
    db   $FC ; Undefined instruction
    call c, label_2026
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
    ld   a, [$FF00+C]
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

label_B5149::
    add  a, b
    ret  nz
    add  a, b
    nop
    nop
    nop
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
    jp   label_B66BD
    db   $DB
    inc  a
    rst  $20
    jr   label_B5167

label_B5168::
    jr   nc, label_B5149
    ld   h, b
    cp   a
    ret  nz
    ld   a, a
    add  a, c
    cp   $C4
    cp   c
    ld   a, c
    jp   nz, label_E423
    ld   h, a
    sbc  a, b
    rst  8
    db   $10 ; Undefined instruction
    jr   nz, label_B51BC
    ld   b, b
    ld   a, [hl]
    add  a, b
    inc  hl
    sbc  a, l
    sbc  a, d
    ld   b, e
    call nz, label_E627
    add  hl, de
    rst  8
    db   $10 ; Undefined instruction
    jr   nz, label_B51CC
    ld   b, b
    ld   a, [hl]
    add  a, b
    inc  a
    add  a, c
    sbc  a, c
    ld   b, d
    jp   label_E724
    jr   label_B5168
    db   $10 ; Undefined instruction
    jr   nz, label_B51DC
    ld   b, b
    ld   a, [hl]
    add  a, b
    inc  a
    add  a, c
    sub  a, d
    ld   b, b
    and  l
    nop
    ld   e, d
    nop
    or   l
    nop
    ld   l, d
    nop
    ld   b, b
    nop
    add  a, b
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

label_B51BC::
    nop
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

label_B51CC::
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

label_B51DC::
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
    add  hl, bc
    nop
    ld   a, a
    dec  c
    ld   a, a
    cpl
    ld   a, a
    ccf
    rst  $38
    add  hl, sp
    ld   sp, hl
    or   b
    ld   a, [$FF62]
    ld   a, c
    ld   h, h
    jr   nc, label_B5262
    or   $30
    cp   $E4
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  e
    rra
    ld   c, l
    adc  a, a
    ld   b, $4E
    ld   h, $66
    ld   b, c

label_B5262::
    ld  [$FF00+C], a
    ret  z
    ld   l, a
    ld   b, b
    ld   [hl], c
    ld   h, h
    ld   a, [$FF60]
    jr   c, label_B527C
    rra
    inc  e
    inc  sp
    inc  bc
    ld   a, $02
    cpl
    add  a, d
    add  a, $12
    ld   h, $02
    sbc  a, a
    ld   [bc], a
    cp   $04

label_B527C::
    db   $FC ; Undefined instruction
    call c, label_2026
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
    ld  [$FF00+C], a
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
    ld   a, [$FF00+C]
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
    ld   hl, label_B79FF
    rst  $38
    rst  $20
    rst  $18
    ret  nz
    cp   a
    add  a, c
    rst  $38
    rst  $38

label_B536F::
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

label_B5381::
    ld   b, $DF
    rst  $20
    rst  $28
    rst  $30
    db   $FD ; Undefined instruction
    rst  $38
    ld   c, h

label_B5389::
    ld   a, a
    and  b
    ccf
    ld   [hl], c
    sbc  a, a
    jr   nc, label_B536F

label_B5390::
    rst  $38
    jr   nc, label_B5390
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
    jr   c, label_B5381
    ld   a, [$FF00+C]
    jr   nc, label_B53E5
    db   $3A ; ldd  a, [hl]
    rst  $18
    jr   c, label_B5389
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

label_B53C0::
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

label_B53E5::
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
    ld   a, [$FF00+C]
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
    jr   label_B5443
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    jr   c, label_B544C
    rst  $28
    jr   c, label_B5478
    jr   c, label_B547A
    jr   c, label_B547C
    jr   c, label_B547E
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
    jr   c, label_B5494
    jr   c, label_B5496
    jr   c, label_B5498
    jr   c, label_B549A
    rst  $38
    rst  $28
    nop
    jr   c, label_B5476
    nop

label_B5478::
    rst  $38
    rst  $38

label_B547A::
    nop
    rst  $38

label_B547C::
    jr   label_B547D

label_B547E::
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

label_B5494::
    db   $DB
    db   $DB

label_B5496::
    db   $DB
    db   $DB

label_B5498::
    db   $DB
    db   $DB

label_B549A::
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
    cp   $DC
    xor  a
    ld   a, [$FF00+C]
    pop  hl
    ld   e, c
    and  c
    pop  de
    ld   hl, $B141
    ld   l, d
    ld   a, [$FF00+C]
    db   $EC ; Undefined instruction
    sub  a, h
    db   $E4 ; Undefined instruction
    sub  a, h
    db   $E4 ; Undefined instruction
    or   h
    call nz, label_827A
    push bc
    ld   bc, label_183
    ld   bc, $0101
    nop
    ld   a, a
    ccf
    ld   a, [$FF4F]
    cp   b
    add  a, a
    sbc  a, l
    add  a, d
    sbc  a, d
    add  a, l
    adc  a, e
    add  a, h
    ld   b, a
    ld   c, [hl]
    add  hl, sp
    scf
    add  hl, hl
    daa
    add  hl, hl
    daa
    dec  l
    inc  hl
    ld   e, [hl]
    ld   b, c
    and  e
    add  a, b
    pop  bc
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    add  hl, bc
    nop
    ld   a, a
    dec  c
    ld   a, a
    cpl
    ld   a, a
    ccf
    rst  $38
    add  hl, sp
    ld   sp, hl
    or   b
    ld   a, [$FF62]
    ld   a, c
    ld   h, h
    jr   nc, label_B5562
    or   $30
    cp   $E4
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  e
    rra
    ld   c, l
    adc  a, a
    ld   b, $4E
    ld   h, $66
    ld   b, c

label_B5562::
    ld  [$FF00+C], a
    ret  z
    ld   l, a
    ld   b, b
    ld   [hl], c
    ld   h, h
    ld   a, [$FF60]
    jr   c, label_B557C
    rra
    inc  e
    inc  sp
    inc  bc
    ld   a, $02
    cpl
    add  a, d
    add  a, $12
    ld   h, $02
    sbc  a, a
    ld   [bc], a
    cp   $04

label_B557C::
    db   $FC ; Undefined instruction
    call c, label_2026
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
    ld   bc, label_301
    ld   [bc], a
    ld   b, $05
    ld   c, $09
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    ld   sp, hl
    sbc  a, [hl]
    cp   l
    jp   z, label_E89F
    nop
    nop
    add  a, b
    add  a, b
    adc  a, $4E
    cp   $32
    cp   d
    ld   h, [hl]
    ldd  [hl], a
    xor  $34
    db   $EC ; Undefined instruction
    daa
    rst  $38
    ld   c, e
    ld   a, h
    add  hl, hl
    ld   a, $7D
    ld   a, e
    rst  $38
    sbc  a, d
    cp   e
    adc  a, $5B
    ld   l, [hl]
    scf
    ld   a, $01
    rlca
    dec  l
    ei
    cp   l
    di
    ld   a, [$B266]
    ld   l, [hl]
    inc  [hl]
    db   $EC ; Undefined instruction
    inc  h
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$C0
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
    ld   a, [$FF00+C]
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
    ld   a, [$FF00+C]
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
    jr   nc, label_B569D
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
    ld  [$FF00+C], a
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
    rst  $38
    cp   $FF
    ld    hl, sp+$FF
    ei
    rst  $38
    ld   sp, hl
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    inc  sp
    inc  bc
    jp   label_FFC3
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $18
    rst  $38
    sbc  a, a
    rst  $38
    ccf
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   sp, hl
    rst  $38
    ei
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    cp   $FF
    rst  $38
    call z, label_FFC0
    ccf
    rst  $38
    sbc  a, a
    rst  $38
    rst  $18
    rst  $18
    ccf
    rst  $38
    ld   a, a
    rst  $38
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
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld   [$FF80], a
    rst  $38
    add  a, b
    cp   a
    ret  nz
    rst  $38
    rst  $38
    ret  nz
    ld   a, a
    rst  $38
    ld   a, a
    inc  bc
    ld   bc, $0103
    rlca
    ld   bc, label_1FF
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    rst  $38
    inc  bc
    cp   $FF
    cp   $FF
    ld   a, a
    rst  $18
    ret  nz
    cp   a
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    adc  a, a
    ld   a, [$FFF0]
    sub  a, a
    sub  a, b
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    inc  bc
    rst  $38
    ld   bc, label_1FF
    rst  $38
    pop  af
    rrca
    rrca
    jp   hl
    add  hl, bc
    rst  $38
    rst  $38
    ret  nz
    add  a, b
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
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0107
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
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
    inc  bc
    inc  bc
    rlca
    inc  b
    dec  c
    ld   a, [bc]
    ld   a, [de]
    dec  d
    inc  sp
    dec  l
    ld   h, a
    ld   e, l
    ld   l, l
    ld   e, e
    ld   l, l
    ld   e, e
    ret  nz
    ret  nz
    ld   [rNR41], a
    or   b
    ld   d, b
    ld   e, b
    xor  b
    db   $EC ; Undefined instruction
    or   h
    or   $BA
    jp  c, label_BEBE
    jp  c, label_B4B75
    ld   c, h
    ld   [hl], e
    ld   d, a
    ld    hl, sp+$5D
    ei
    ld   a, a
    ei
    dec  sp
    rst  $38
    dec  de
    ld   a, a
    rrca
    ccf
    cp   d
    sub  a, $36
    adc  a, $EE
    rra
    sbc  a, $FF
    sbc  a, $FF
    call c, label_D8FF
    cp   $F0
    db   $FC ; Undefined instruction
    add  hl, bc
    nop
    ld   a, a
    dec  c
    ld   a, a
    cpl
    ld   a, a
    ccf
    rst  $38
    add  hl, sp
    ld   sp, hl
    or   b
    ld   a, [$FF62]
    ld   a, c
    ld   h, h
    jr   nc, label_B5962
    or   $30
    cp   $E4
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  e
    rra
    ld   c, l
    adc  a, a
    ld   b, $4E
    ld   h, $66
    ld   b, c

label_B5962::
    ld  [$FF00+C], a
    ret  z
    ld   l, a
    ld   b, b
    ld   [hl], c
    ld   h, h
    ld   a, [$FF60]
    jr   c, label_B597C
    rra
    inc  e
    inc  sp
    inc  bc
    ld   a, $02
    cpl
    add  a, d
    add  a, $12
    ld   h, $02
    sbc  a, a
    ld   [bc], a
    cp   $04

label_B597C::
    db   $FC ; Undefined instruction
    call c, label_2026
    nop
    nop
    nop
    rra
    rra
    jr   nz, label_B59C6
    ld   b, b
    ccf
    ld   b, b
    inc  a
    ld   b, e
    jr   c, label_B59D5
    jr   c, label_B59D7
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
    ld  [$FF00+C], a
    jr   c, label_B59E9
    jr   c, label_B59EB
    inc  a
    ld   b, e
    ccf
    ld   b, b
    ccf
    ld   b, b
    rra
    jr   nz, label_B59AD

label_B59AD::
    rra
    nop
    nop
    inc  e
    ld  [$FF00+C], a
    inc  e
    ld  [$FF00+C], a
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

label_B59C6::
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

label_B59D5::
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

label_B59E9::
    cp   a
    add  a, c

label_B59EB::
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
    inc  bc
    inc  bc
    rlca
    inc  b
    dec  c
    ld   a, [bc]
    ld   a, [de]
    dec  d
    inc  sp
    dec  l
    ld   h, a
    ld   e, l
    ld   l, l
    ld   e, e
    ld   l, l
    ld   e, e
    ret  nz
    ret  nz
    ld   [rNR41], a
    or   b
    ld   d, b
    ld   e, b
    xor  b
    db   $EC ; Undefined instruction
    or   h
    or   $BA
    jp  c, label_BEBE
    jp  c, label_B4B75
    ld   c, h
    ld   [hl], e
    ld   d, a
    ld    hl, sp+$5D
    ei
    ld   a, a
    ei
    dec  sp
    rst  $38
    dec  de
    ld   a, a
    rrca
    ccf
    cp   d
    sub  a, $36
    adc  a, $EE
    rra
    sbc  a, $FF
    sbc  a, $FF
    call c, label_D8FF
    cp   $F0
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
    ld   a, [$FF00+C]
    jp   nz, label_203
    inc  bc
    ld   [bc], a
    rst  $38
    rst  $38
    cp   $DC
    xor  a
    ld   a, [$FF00+C]
    pop  hl
    ld   e, c
    and  c
    pop  de
    ld   hl, $B141
    ld   l, d
    ld   a, [$FF00+C]
    db   $EC ; Undefined instruction
    sub  a, h
    db   $E4 ; Undefined instruction
    sub  a, h
    db   $E4 ; Undefined instruction
    or   h
    call nz, label_827A
    push bc
    ld   bc, label_183
    ld   bc, $0101
    nop
    ld   a, a
    ccf
    ld   a, [$FF4F]
    cp   b
    add  a, a
    sbc  a, l
    add  a, d
    sbc  a, d
    add  a, l
    adc  a, e
    add  a, h
    ld   b, a
    ld   c, [hl]
    add  hl, sp
    scf
    add  hl, hl
    daa
    add  hl, hl
    daa
    dec  l
    inc  hl
    ld   e, [hl]
    ld   b, c
    and  e
    add  a, b
    pop  bc
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    add  hl, bc
    nop
    ld   a, a
    dec  c
    ld   a, a
    cpl
    ld   a, a
    ccf
    rst  $38
    add  hl, sp
    ld   sp, hl
    or   b
    ld   a, [$FF62]
    ld   a, c
    ld   h, h
    jr   nc, label_B5C62
    or   $30
    cp   $E4
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  e
    rra
    ld   c, l
    adc  a, a
    ld   b, $4E
    ld   h, $66
    ld   b, c

label_B5C62::
    ld  [$FF00+C], a
    ret  z
    ld   l, a
    ld   b, b
    ld   [hl], c
    ld   h, h
    ld   a, [$FF60]
    jr   c, label_B5C7C
    rra
    inc  e
    inc  sp
    inc  bc
    ld   a, $02
    cpl
    add  a, d
    add  a, $12
    ld   h, $02
    sbc  a, a
    ld   [bc], a
    cp   $04

label_B5C7C::
    db   $FC ; Undefined instruction
    call c, label_2026
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
    inc  bc
    inc  bc
    rlca
    inc  b
    dec  c
    ld   a, [bc]
    ld   a, [de]
    dec  d
    inc  sp
    dec  l
    ld   h, a
    ld   e, l
    ld   l, l
    ld   e, e
    ld   l, l
    ld   e, e
    ret  nz
    ret  nz
    ld   [rNR41], a
    or   b
    ld   d, b
    ld   e, b
    xor  b
    db   $EC ; Undefined instruction
    or   h
    or   $BA
    jp  c, label_BEBE
    jp  c, label_B4B75
    ld   c, h
    ld   [hl], e
    ld   d, a
    ld    hl, sp+$5D
    ei
    ld   a, a
    ei
    dec  sp
    rst  $38
    dec  de
    ld   a, a
    rrca
    ccf
    cp   d
    sub  a, $36
    adc  a, $EE
    rra
    sbc  a, $FF
    sbc  a, $FF
    call c, label_D8FF
    cp   $F0
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jp   label_B7FC3
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
    ld   hl, label_B4558
    ld   d, d
    ld   c, c
    ld   d, d
    ld   c, c
    ret  nz
    ret  nz
    jr   nz, label_B5DF4
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
    ld  [$FF00+C], a
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
    ld  [$FF00+C], a
    ld   [hl], e
    cp   $2F
    ld   e, $FF
    cp   $0F
    rrca
    dec  e
    ld   [de], a
    dec  a
    ldi  [hl], a
    ld   a, e
    ld   b, a
    ld   b, a
    ld   a, a
    ld   a, a
    ld   c, a
    ld   a, a
    ld   c, a
    ld   c, a
    ld   a, a
    ld   a, [$FFF0]
    cp   b
    ld   c, b
    cp   h
    ld   b, h
    sbc  a, $E2
    ld  [$FF00+C], a
    cp   $FE
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    cp   $7F
    ld   b, a
    ld   e, l
    ld   h, d
    ld   l, l
    ld   [hl], d
    ld   [hl], d
    ld   e, a
    ld   e, a
    ld   l, a
    ld   c, a
    ld   [hl], b
    jr   nz, label_B5F6D
    rra
    rra
    cp   $E2
    cp   d
    ld   b, [hl]
    or   [hl]
    ld   c, [hl]
    ld   c, [hl]
    ld   a, [$F6FA]
    ld   a, [$FF00+C]
    inc  b
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   b, $06
    ld   c, $0A
    ld   d, $1A
    rla
    dec  de
    ccf
    inc  a
    ld   e, a
    ld   h, b
    ld   a, a
    ld   e, h
    cp   a
    sbc  a, $60
    ld   h, b
    ld   [hl], b
    ld   d, b
    ld   l, b
    ld   e, b
    db   $E8 ; add  sp, d
    ret  c
    db   $FC ; Undefined instruction
    inc  a
    ld   a, [$FE06]
    db   $3A ; ldd  a, [hl]
    db   $FD ; Undefined instruction
    ld   a, e
    rst  $38
    sbc  a, [hl]
    rst  $38
    adc  a, [hl]
    cp   a
    ret  nz
    sub  a, a
    ld   a, [label_B726F]
    cpl
    jr   nc, label_B5F9C

label_B5F6D::
    inc  a
    ccf
    ccf
    rst  $38
    ld   a, c
    rst  $38
    ld   [hl], c
    db   $FD ; Undefined instruction
    inc  bc
    jp   hl
    ld   e, a
    or   $4E
    db   $F4 ; Undefined instruction
    inc  c
    db   $F4 ; Undefined instruction
    inc  a
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
    ld   a, a
    ld   d, a
    rst  $18
    or   d
    or   a
    ld    hl, sp+$FD
    adc  a, $EF
    sbc  a, a
    rst  8
    cp   l
    sbc  a, a
    ld   sp, hl
    sbc  a, a
    ld   sp, hl
    cp   $EA
    ei
    ld   c, l
    db   $ED ; Undefined instruction
    rra
    cp   a
    ld   [hl], e
    rst  $30
    ld   sp, hl
    di
    cp   l
    ld   sp, hl
    sbc  a, a
    ld   sp, hl
    sbc  a, a
    rst  $38
    ld   sp, hl
    sbc  a, c
    rst  $38
    xor  c
    rst  $18
    or   a
    rst  8
    rst  $18
    ld   h, b
    ld   c, a
    ld   [hl], b
    jr   nc, label_B602D
    rra
    rrca
    rst  $38
    sbc  a, a
    sbc  a, c
    rst  $38
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
    add  a, b
    add  a, [hl]
    nop
    add  a, d
    nop
    add  a, d
    inc  b
    add  a, [hl]
    ld   c, b
    call z, label_B7930
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
    inc  b
    add  a, [hl]
    ld   a, b
    ld   a, h
    add  a, b
    ld   a, $01
    ld   h, c
    nop
    ld   b, c
    nop
    ld   b, c
    jr   nz, label_B608A
    ld   [de], a
    inc  sp
    inc  c
    sbc  a, [hl]

label_B602D::
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
    jr   nz, label_B609E
    ld   e, $3E
    ld   bc, $00FF
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

label_B605F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B605F
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
    jr   label_B6096
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF0F]
    sub  a, [hl]
    ld   l, a
    sub  a, [hl]
    ld   l, a
    ld   [$FF1F], a
    ld   c, $F1

label_B608A::
    ld   l, [hl]
    pop  af
    ld   l, [hl]
    pop  af
    nop
    rst  $38
    ld   a, [$FF0F]
    or   $0F
    or   $0F

label_B6096::
    db   $10 ; Undefined instruction
    rra
    ld   [$FF67], a
    sbc  a, b
    ld   h, a
    sbc  a, b

label_B609E::
    rlca
    ld    hl, sp+$E0
    rra
    and  $19
    and  $19
    ld    hl, sp+$07
    ld   [label_B6FF7], sp
    ld   a, [$FF6F]
    ld   a, [$FF0F]
    ld   a, [$FF00]
    rst  $38
    db   $76 ; Halt
    adc  a, a
    db   $76 ; Halt
    adc  a, a
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
    jr   label_B60F6
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
    jp   nz, label_B7C80
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
    ld   hl, label_B53C0
    jr   nz, label_B6125
    jr   label_B6106
    nop
    ld   b, l
    nop
    add  hl, bc
    nop

label_B6106::
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

label_B611F::
    nop
    rst  $30

label_B6121::
    nop
    dec  de
    nop
    db   $ED ; Undefined instruction

label_B6125::
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

label_B615F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B615F
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
    jr   label_B6196
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
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
    inc  a

label_B618F::
    ld   b, e
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$06

label_B6196::
    ld   a, h
    add  a, d
    ld   l, h
    sub  a, d
    call nz, label_943A
    ld   l, d
    inc  a
    jp   nz, label_B413E
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
    rlca
    ld   [bc], a
    ld   b, l
    ld   bc, $0109
    sub  a, e
    add  a, c
    and  a
    add  a, c
    rst  8
    ld   b, d
    ccf
    inc  a
    rst  $30
    inc  h
    and  b
    nop
    and  d
    nop
    xor  [hl]
    ld   c, $D8
    ld   [$F8F8], sp
    or   a
    inc  h
    ld   a, [$EF22]
    ld   b, c
    rst  $30
    inc  h
    ccf
    daa
    db   $FD ; Undefined instruction
    add  hl, sp
    ld   d, $10
    dec  sp
    jr   nc, label_B621A
    cpl
    ld   h, l
    jr   nz, label_B6234
    ld   b, b
    rst  $28
    ld   b, c
    ld   sp, hl
    ld   sp, hl
    or   a
    add  a, [hl]
    db   $EC ; Undefined instruction
    add  a, h
    call nc, label_FC84
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
    ld   b, d
    pop  hl
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
    ld   a, [$FF00+C]
    jr   nz, label_B620E

label_B620E::
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

label_B621A::
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

label_B6234::
    rrca
    nop
    sbc  a, c
    nop
    jr   nc, label_B623A

label_B623A::
    and  $00
    inc  h
    nop
    ld   sp, rJOYP
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

label_B625F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B625F
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

label_B6274::
    cpl
    jr   label_B6296
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
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

label_B628A::
    ld   [hl], $00
    ld   l, a
    nop
    rst  $18
    nop
    sub  a, b
    nop
    ret  z
    nop
    ld   h, h
    nop

label_B6296::
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

label_B62A2::
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

label_B62B8::
    or   d
    nop
    ld   h, h
    nop
    ret  z
    nop
    sub  a, b
    nop
    add  a, d

label_B62C1::
    inc  b
    jr   z, label_B62CB
    ld   h, b
    rrca
    ld   [de], a
    inc  c
    ld   h, h
    sbc  a, b
    add  a, b

label_B62CB::
    ld   a, b
    ld   b, b
    ccf
    nop
    ldd  [hl], a
    inc  h
    db   $10 ; Undefined instruction
    ld   a, [$FF0A]
    ld   a, [$FF44]
    jr   c, label_B6319
    ccf
    sub  a, d
    ld   l, h
    jr   z, label_B62A2
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
    jr   nz, label_B62F2
    sub  a, b
    inc  b
    add  a, b
    ld   b, h

label_B62F2::
    jr   z, label_B62B8
    ld   d, c
    ld   l, $47
    jr   c, label_B62C1
    jr   nc, label_B6311
    ld   [rDIV], a
    jr   nz, label_B6310
    jr   nz, label_B628A
    ld   b, b
    ld   b, c
    ldi  [hl], a
    ldi  [hl], a
    inc  e
    inc  a
    nop
    jr   nc, label_B630A

label_B630A::
    inc  h
    ld   b, b
    ld   c, b
    add  a, b
    ret  nc
    ld   bc, label_B4088
    ret  nz
    jr   nz, label_B6339
    db   $10 ; Undefined instruction
    ld   [label_2098], sp
    jr   c, label_B6360
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

label_B6339::
    jr   nz, label_B635F
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

label_B635F::
    ld   [label_10F7], sp

label_B6362::
    ei
    db   $10 ; Undefined instruction
    jr   label_B635F
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
    jr   label_B6396
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
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
    ldd  [hl], a
    nop
    nop
    nop
    ld   a, h
    nop
    ld   c, [hl]
    nop

label_B6396::
    ld   a, [hl]
    nop
    ld   e, $00
    adc  a, $00
    ld   [rJOYP], a
    ld   h, b
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
    ld   h, c
    ld   b, b
    inc  sp
    ld   hl, label_123E
    ld   a, $1E
    ld   [hl], $22
    ld   h, e
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    ld   h, e
    add  a, b
    nop
    jp   nz, label_EC00
    ret  nz
    jr   c, label_B6408
    ld    hl, sp+$30
    ld    hl, sp+$28
    call z, label_C744

label_B63DF::
    add  a, e
    rst  $38
    rst  $20
    ld   a, $3C
    inc  e
    jr   label_B6403
    ld   [label_81C], sp
    rra
    inc  c
    ld   [hl], e
    inc  de
    ld   bc, $C701
    add  a, d
    cp   $42
    ld   a, h
    inc  h
    ld   a, h
    jr   c, label_B6475
    jr   nc, label_B63DF
    ld   b, b
    jp   nz, label_8180

label_B63FF::
    nop
    add  a, b
    nop
    adc  a, h

label_B6403::
    nop
    adc  a, [hl]
    nop
    add  a, $00

label_B6408::
    ld   h, b
    nop
    jr   nc, label_B640C

label_B640C::
    ld   e, b
    nop
    rrca
    nop
    rrca
    nop
    jr   label_B6414

label_B6414::
    jr   nc, label_B6416

label_B6416::
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
    jr   label_B642E

label_B642E::
    ld   a, [$FF00]
    ld   a, [$FF00]
    jr   label_B6434

label_B6434::
    inc  c
    nop
    ld   b, $00
    inc  sp
    nop
    ld   sp, $8100
    nop
    ld   bc, rJOYP
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

label_B645F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B645F
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

label_B6475::
    jr   label_B6496
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    cp   b
    ld   b, h
    ld   sp, hl
    inc  b
    jp   hl
    inc  d
    ld   a, c
    add  a, h
    ld   bc, label_378
    nop
    ccf
    nop
    ld   bc, $F802
    ld   bc, label_B40BC

label_B6496::
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

label_B64A8::
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
    jr   nc, label_B6513
    add  hl, sp
    jr   label_B64F7
    inc  de
    inc  c
    inc  h
    jr   label_B651D
    or   b
    ld   [bc], a
    ld   a, [$FF08]
    ld   a, [$FF51]
    adc  a, [hl]
    ld   b, h
    adc  a, b
    jr   nc, label_B64A8
    inc  d
    inc  hl
    ld   b, d
    ld   hl, label_21D2
    dec  c
    ld   a, [$FF00+C]
    ld   c, $10
    rrca
    jr   nz, label_B6506
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
    inc  b
    ld   h, $08
    ld   c, h
    db   $10 ; Undefined instruction
    jr   nz, label_B6539
    ld   b, b
    ld   h, h
    add  a, b
    ret  z
    nop
    sub  a, b
    nop
    ret  nz
    jr   nz, label_B6573

label_B6513::
    db   $10 ; Undefined instruction
    ld   [label_499], sp
    ld   c, h
    ld   [bc], a
    ld   h, $01
    inc  de

label_B651D::
    nop
    add  hl, bc
    nop
    sub  a, b
    ld   b, b
    ret  z
    jr   nz, label_B6589
    db   $10 ; Undefined instruction
    ld   [label_499], sp
    ld   c, h
    ld   [bc], a
    ld   b, $01
    inc  bc
    nop
    add  hl, bc
    ld   [bc], a
    inc  de
    inc  b
    ld   h, $08
    inc  c
    db   $10 ; Undefined instruction

label_B6539::
    jr   nz, label_B656D
    ld   b, b
    ld   h, h
    add  a, b
    ret  z
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

label_B655F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B655F
    rrca
    rst  $38

label_B6569::
    rlca
    rst  $38
    nop
    rst  $38

label_B656D::
    nop
    rst  $38
    nop
    rst  $28
    ld   [label_8DF], sp
    cpl
    jr   label_B6596
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    ccf
    nop
    ld   a, [hl]

label_B6585::
    ld   bc, label_26C
    ld   a, c

label_B6589::
    inc  b
    ld   [hl], e
    ld   [label_1066], sp
    ld   l, a
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [hl]
    add  a, b

label_B6596::
    ld   [hl], $40
    sbc  a, [hl]
    jr   nz, label_B6569
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
    inc  de
    ld   bc, label_2E7
    ld   l, $24
    sbc  a, h
    jr   label_B6605
    jr   label_B664A
    inc  h
    rst  $20
    ld   b, e
    rst  0
    add  a, e
    pop  bc
    add  a, b
    pop  hl
    ld   b, b
    db   $76 ; Halt
    inc  h
    jr   c, label_B65F0
    ld   l, h
    jr   z, label_B65A9
    ld   b, h
    rst  8
    add  a, $FB
    ret
    rst  0
    add  a, d
    rst  $38
    ld   b, a
    ld   a, a
    add  hl, hl
    dec  a
    jr   label_B6585
    ld   [label_C4E], sp
    ccf
    db   $3A ; ldd  a, [hl]
    db   $E3 ; Undefined instruction
    ld   bc, label_B71FB
    rst  $10
    ld   b, d
    xor  $84
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    ld   sp, hl
    jr   nc, label_B6679
    inc  a
    and  $42
    ret
    add  a, b
    ld   a, $00
    ld   a, $00
    and  d

label_B6605::
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
    nop
    ld   a, [$FF00]
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

label_B665F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B665F
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
    jr   label_B6696
    ld   a, [$FFFF]

label_B6679::
    ld   [rIE], a
    nop
    rst  $38
    nop

label_B667E::
    rst  $38
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
    ld   h, a
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ld   e, $00

label_B6696::
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

label_B66BD::
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
    call nz, label_B6809
    db   $10 ; Undefined instruction
    jr   nc, label_B671F
    ld   c, b
    jp   label_B4304
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

label_B66FF::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld  [$FF00+C], a
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

label_B6809::
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

label_B6827::
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
    cp   $DC
    xor  a
    ld   a, [$FF00+C]
    pop  hl
    ld   e, c
    and  c
    pop  de
    ld   hl, $B141
    ld   l, d
    ld   a, [$FF00+C]
    db   $EC ; Undefined instruction
    sub  a, h
    db   $E4 ; Undefined instruction
    sub  a, h
    db   $E4 ; Undefined instruction
    or   h
    call nz, label_827A
    push bc
    ld   bc, label_183
    ld   bc, $0101
    nop
    ld   a, a
    ccf
    ld   a, [$FF4F]
    cp   b
    add  a, a
    sbc  a, l
    add  a, d
    sbc  a, d
    add  a, l
    adc  a, e
    add  a, h
    ld   b, a
    ld   c, [hl]
    add  hl, sp
    scf
    add  hl, hl
    daa
    add  hl, hl
    daa
    dec  l
    inc  hl
    ld   e, [hl]
    ld   b, c
    and  e
    add  a, b
    pop  bc
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    ret  nz
    ret  nz
    ld   [$FFA0], a
    di
    sub  a, e
    cp   l
    adc  a, [hl]
    ld   e, c
    ld   c, [hl]
    ld   d, b
    ld   e, a
    ld   sp, label_133F
    ld   e, $03
    inc  bc
    rlca
    dec  b
    rst  8
    ret
    cp   l
    ld   [hl], c
    sbc  a, d
    ld   [hl], d
    ld   a, [bc]
    ld   a, [$FC8C]
    ret  z
    ld   a, b
    ld   h, e
    ld   a, [hl]
    adc  a, a
    cp   $8F
    ld   a, [label_B784F]
    ccf
    inc  a
    rla
    rla
    ld   sp, label_B6827
    ld   c, a
    add  a, $7E
    pop  af
    ld   a, a
    pop  af
    ld   e, a
    ld   a, [$FF00+C]
    db   $FC ; Undefined instruction
    inc  a
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    adc  a, h
    db   $E4 ; Undefined instruction
    ld   d, $F2
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

label_B69A6::
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
    db   $96
    sub  a, [hl]
    db   $EC ; Undefined instruction
    rst  $28
    inc  c
    dec  bc
    ld   c, $09
    dec  sp
    inc  a
    ld   a, a
    ld   b, h
    db   $9E
    sbc  a, [hl]
    db   $E3 ; Undefined instruction
    cp   [hl]
    cp   e
    ld   l, c
    scf
    rst  $30
    jr   nc, label_B69A6
    ld   [hl], b
    sub  a, b
    call c, label_FE3C
    ldi  [hl], a
    cp   e
    ld   a, c
    rst  0
    ld   a, l
    ld  [$FF00+C], a
    cp   d
    pop  hl
    cp   e
    ld   [$FFBC], a
    cp   a
    sbc  a, a
    sbc  a, a
    ret  nz
    add  a, b
    rst  $38
    ld   b, b
    ld   a, a
    ccf
    ccf
    ld   b, a
    ld   e, l
    add  a, a
    db   $07
    rlca
    dec  a
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    inc  bc
    ld   bc, label_2FF
    cp   $FC
    db   $FC ; Undefined instruction
    inc  a
    nop
    ld   b, [hl]
    nop
    ld  [$FF00+C], a
    nop
    ld   a, [$FF00+C]
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

label_B6AB2::
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
    jr   nc, label_B6B0A

label_B6B0A::
    jr   nc, label_B6B0C

label_B6B0C::
    ld   bc, $0100
    nop
    rlca
    db   $10 ; Undefined instruction
    jr   nz, label_B6B31
    ld   b, b
    ld   e, b
    nop
    jr   label_B6B5A
    jr   label_B6B5C
    sbc  a, b
    ld   b, b
    sbc  a, c
    ld   b, b
    ld   b, b
    nop
    nop
    ccf
    nop
    ld   b, b
    ccf
    add  a, b
    ld   a, a
    nop
    ld   [rJOYP], a
    jp   nz, label_8000
    nop
    jr   c, label_B6AB2
    ld   [hl], b
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    adc  a, h
    ld   bc, label_20C
    ld   bc, label_304
    ld   [$00FF], sp
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

label_B6B5F::
    ld   [label_10F7], sp
    ei
    db   $10 ; Undefined instruction
    jr   label_B6B5F
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
    jr   label_B6B96
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
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
    inc  bc
    ld   a, b
    nop
    nop
    ld   a, h
    nop
    ld   a, [hl]
    nop

label_B6B96::
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
    cp   $00
    db   $FC ; Undefined instruction
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    ld   bc, label_301
    ld   bc, label_38F
    rst  $18
    adc  a, l
    ld   sp, hl
    sub  a, b
    ld   sp, hl
    ld   [hl], b
    ld   a, a
    ld   c, c
    ld   l, a
    ld   b, a
    rlca
    nop
    adc  a, a
    rlca
    sbc  a, h
    inc  c
    ret  c
    ld   [$88F8], sp
    ld    hl, sp+$F8
    ld    hl, sp+$90
    cp   c
    db   $10 ; Undefined instruction
    ldi  [hl], a
    ld   h, a
    ldi  [hl], a
    ld   a, a
    ldi  [hl], a
    ld   a, a
    ccf
    ld   a, a
    ld   h, b
    pop  hl
    ld   b, b
    pop  bc
    ld   b, b
    add  a, e
    add  a, c
    cp   h
    db   $10 ; Undefined instruction
    jr   c, label_B6BF4
    ld   h, [hl]
    ld   [$FFC0], a
    ret  nz
    add  a, b
    add  a, $80
    add  a, $80

label_B6BFE::
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
    ld   a, [$FF00+C]
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
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
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
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
    db   $76 ; Halt
    and  c
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
    jr   nz, label_B6C87
    jr   nz, label_B6C89
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
    jr   nz, label_B6C99
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
    db   $76 ; Halt
    ei
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
    jr   nz, label_B6D87
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
    jr   nz, label_B6D97
    jr   nz, label_B6D99
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
    ld  [$FF00+C], a
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
    db   $76 ; Halt
    cp   b
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    and  $F8
    ld   a, [$FF00+C]
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
    jr   nc, label_B6EDB
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
    jr   c, label_B6F87
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
    jr   c, label_B6FA9
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

label_B6F87::
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
    jp   label_B7EBD
    nop
    nop
    or   l
    ei
    sub  a, d
    db   $FD ; Undefined instruction
    set  7, h
    ret  c
    xor  $D8

label_B6FA9::
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
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
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

label_B6FF7::
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    cp   [hl]
    cp   d

label_B6FFF::
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
    jr   nz, label_B7010
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    rlca
    rst  $38
    call c, label_B73FF
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
    jp   hl
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
    sbc  a, a
    or   b
    sbc  a, a
    cp   a
    sbc  a, a
    rst  $38
    jp   label_FFFF
    rst  $38
    rst  $38
    db   $E3 ; Undefined instruction
    inc  bc
    cp   a
    add  hl, sp
    rst  $28
    ld   sp, hl
    rrca
    ld   sp, hl
    rst  $38
    ld   sp, hl
    rst  $38
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
    ld   bc, label_B63FF
    rst  $38

label_B718E::
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
    jr   label_B71C1
    jr   label_B71C3
    ccf
    ret  nz
    rla
    db   $E8 ; add  sp, d
    ccf
    ret  nz
    ccf
    rst  $38
    jr   label_B71CD
    jr   label_B71CF
    jr   label_B71D1
    jr   label_B71D3
    db   $FC ; Undefined instruction
    inc  bc
    db   $E8 ; add  sp, d
    rla
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    jr   label_B71DD
    jr   label_B71DF
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

label_B71FB::
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
    jr   nc, label_B7281
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

label_B7251::
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

label_B7261::
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

label_B726F::
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

label_B7281::
    rst  $38
    ld   bc, label_31FE
    adc  a, $20
    rst  8
    jr   z, label_B7251
    dec  d
    ld  [$FF00+C], a
    ld   [label_7F1], sp
    ld    hl, sp+$00
    rst  $38
    add  a, b
    ld   a, a
    inc  c
    ld   [hl], e
    sub  a, h
    ld   h, e
    jr   z, label_B7261
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    jr   nc, label_B7381
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

label_B7381::
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

label_B73FF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_B7415::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_B741E

label_B741E::
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
    jr   nc, label_B7415
    ld   sp, label_B718E
    adc  a, [hl]
    ld   [hl], c
    adc  a, a
    ld   [hl], b
    rst  8
    jr   nc, label_B741E
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

label_B74D2::
    rst  $38
    nop
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
    ld  [$FF00+C], a
    rst  $38
    ld  [$FF00+C], a
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
    jr   c, label_B74D2
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
    db   $76 ; Halt
    add  a, c
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
    db   $76 ; Halt
    adc  a, a
    ld   a, e
    add  a, a
    dec  a
    jp   label_F18E
    adc  a, [hl]
    pop  af
    add  a, $F9
    ld   a, [$FFFF]
    ld   h, b
    ld   [$FF90], a
    ld   [hl], b
    ld   c, b
    cp   b
    and  h
    call c, label_CCB4
    call nc, label_C6EE
    cp   $C6
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
    db   $76 ; Halt
    rst  $38
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_B7658

label_B7658::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_B76FF
    rst  $38
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_B7668

label_B7668::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_B76FF
    rst  $38
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_B7678

label_B7678::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_B76FF
    rst  $38
    rst  $38
    adc  a, c
    adc  a, b
    nop
    jr   nc, label_B7688

label_B7688::
    ld   a, h
    nop
    rst  $38
    db   $10 ; Undefined instruction
    inc  a
    jp   label_B6FFF
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
    jr   nz, label_B7725
    jr   nc, label_B76E7
    jr   label_B76E9
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

label_B76E7::
    rst  $38
    nop

label_B76E9::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_B76F4::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_B76FF::
    rst  $38
    inc  c
    rrca
    db   $10 ; Undefined instruction
    ldi  [hl], a
    dec  a
    dec  h
    dec  sp
    ld   c, l
    ld   [hl], e
    ld   c, d
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

label_B7725::
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
    call c, label_B73FF
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
    jr   nz, label_B7770
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   h, b
    sbc  a, a
    nop
    rst  $38
    rlca
    rst  $38
    call c, label_B73FF
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

label_B778E::
    rst  $18
    jr   nz, label_B778E
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
    jp   hl
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   label_B77A9
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
    jr   label_B77B9
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
    jr   nz, label_B7811
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
    jr   nc, label_B7843
    ld   l, a
    ld   a, [$FFD0]
    ld   [$FFA3], a
    ret  nz
    or   e
    ret  nz
    cp   [hl]
    pop  bc
    sbc  a, b

label_B784F::
    rst  $20
    ld   a, [$FFFF]
    inc  e
    rst  $38
    and  $1F
    inc  de
    rrca
    dec  bc
    rlca
    jp   hl
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
    jp   hl
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
    add  a, e

label_B7901::
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

label_B7930::
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
    jp   label_B66FF
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
    jr   label_B79C1
    jr   label_B79C3
    ccf
    ret  nz
    rla
    db   $E8 ; add  sp, d
    ccf
    ret  nz
    ccf
    rst  $38
    jr   label_B79CD
    jr   label_B79CF
    jr   label_B79D1
    jr   label_B79D3
    db   $FC ; Undefined instruction
    inc  bc
    db   $E8 ; add  sp, d
    rla
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    jr   label_B79DD
    jr   label_B79DF
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
    call z, label_B7F00
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

label_B7A9B::
    rst  $18
    ld   e, l

label_B7A9D::
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

label_B7ABF::
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
    jr   c, label_B7A9B
    jr   c, label_B7A9D
    jr   c, label_B7B1F
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
    jr   nc, label_B7ABF
    jr   c, label_B7B01
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
    ld   hl, label_B611F
    rra
    ld   [hl], c
    rrca
    adc  a, a
    ld   a, a
    rrca
    ld   bc, label_F31
    ld   a, c

label_B7B1F::
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

label_B7B9D::
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

label_B7BBB::
    cp   a
    ld   b, c

label_B7BBD::
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
    jr   c, label_B7B9B
    jr   c, label_B7B9D
    jr   c, label_B7C1F
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
    jr   c, label_B7BBB
    jr   c, label_B7BBD
    jr   c, label_B7C3F
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

label_B7C1F::
    cp   a
    rst  $28
    ld   a, [$FFED]
    ld   a, [$FF00+C]
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

label_B7C3F::
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

label_B7C71::
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

label_B7C80::
    nop

label_B7C81::
    nop
    nop
    nop
    ld   bc, label_701
    rlca
    inc  c
    rrca
    ccf
    ccf
    ld   h, a
    ld   a, b
    rst  8
    ld   a, [$FF3C]
    inc  a
    sbc  a, $E6
    or   [hl]
    adc  a, $F6
    cp   $CE
    ld   a, $C3
    rst  $38
    or   e
    ld   a, a
    dec  bc
    rst  $38
    nop
    rst  $38
    ld   bc, label_31FE
    adc  a, $20
    rst  8
    jr   z, label_B7C71
    dec  d
    ld  [$FF00+C], a
    ld   [label_7F1], sp
    ld    hl, sp+$00
    rst  $38
    add  a, b
    ld   a, a
    inc  c
    ld   [hl], e
    sub  a, h
    ld   h, e
    jr   z, label_B7C81
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
    jr   c, label_B7CF2
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

label_B7CF2::
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
    ret  nz
    rst  $38
    jp   label_C7FF
    rst  $38
    rst  0
    rst  $38
    call z, label_CFFF
    rst  $38
    call z, label_F8FC
    ld    hl, sp+$07
    rst  $38
    jp   label_F3FF
    rst  $38
    di
    rst  $38
    ld   b, $FE
    db   $FC ; Undefined instruction
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
    jr   nz, label_B7E22
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
    jr   c, label_B7E0F
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

label_B7E22::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_B7E3F::
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
    jp   hl
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
    jr   c, label_B7ECD
    rst  $30
    jr   label_B7E6F
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

label_B7EBD::
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

label_B7ECD::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_B7F00::
    rrca
    rst  $38
    add  a, b
    rst  $38
    ld   [rIE], a
    rst  $38
    ld   a, a
    rst  $38
    rra
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
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
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
    jr   nc, label_B7F77
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

label_B7F77::
    inc  e
    inc  c
    ei
    inc  c
    ei
    jr   label_B7F7D
    rst  $38
    rst  $38
    rst  $38
    nop
    jp   label_B7E3F
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
    jp   hl
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

label_B7FC3::
    nop
    rst  $38
    nop
    rst  $38
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
