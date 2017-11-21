section "bank10",romx,bank[$0A]
    nop
    ld   b, d
    inc  bc
    ld   b, d
    ld   b, d
    ld   b, d
    add  a, a
    ld   b, d
    or   e
    ld   b, d
    db   $E8 ; add  sp, d
    ld   b, d
    ld   a, [de]
    ld   b, e
    jr   c, label_28053
    adc  a, e
    ld   b, e
    ld  [$FF00+C], a
    ld   b, e
    rra
    ld   b, h
    ld   c, a
    ld   b, h
    ld   l, b
    ld   b, h
    and  h
    ld   b, h
    rst  $10
    ld   b, h
    ld   c, $45
    ld   l, $45
    ld   e, c
    ld   b, l
    ld   l, b
    ld   b, l

label_28026::
    xor  [hl]
    ld   b, l
    call c, label_C45

label_2802B::
    ld   b, [hl]
    ld   c, d
    ld   b, [hl]
    adc  a, h
    ld   b, [hl]
    rst  0
    ld   b, [hl]
    db   $FC ; Undefined instruction
    ld   b, [hl]
    dec  [hl]
    ld   b, a
    ld   [hl], d
    ld   b, a
    sbc  a, [hl]
    ld   b, a
    xor  [hl]
    ld   b, a
    rst  $18
    ld   b, a
    dec  d
    ld   c, b
    ld   b, d
    ld   c, b
    ld   a, l
    ld   c, b
    jp   nc, label_1D48
    ld   c, c
    ld   h, e
    ld   c, c
    sub  a, a
    ld   c, c
    ret  nz
    ld   c, c
    ld   [bc], a
    ld   c, d
    ld   l, $4A
    ld   e, h

label_28053::
    ld   c, d
    sub  a, d
    ld   c, d
    pop  de
    ld   c, d
    or   $4A
    ld   b, c
    ld   c, e
    adc  a, e
    ld   c, e
    bit  1, e
    ld    hl, sp+$4B
    inc  bc
    ld   c, h
    ld   e, d
    ld   c, h
    or   e
    ld   c, h
    ld   a, [label_2894C]
    ld   c, l
    add  a, c
    ld   c, l
    sub  a, $4D
    ld   a, [bc]
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    and  l
    ld   c, [hl]
    ld  [$FF00+C], a
    ld   c, [hl]
    rla
    ld   c, a
    ld   e, e
    ld   c, a
    and  d
    ld   c, a
    ld   [rVBK], a
    inc  d
    ld   d, b
    ld   e, [hl]
    ld   d, b
    add  a, c
    ld   d, b
    and  h
    ld   d, b
    sbc  a, $50
    inc  c
    ld   d, c
    ld   b, a
    ld   d, c
    sbc  a, e
    ld   d, c
    adc  a, $51
    add  hl, bc
    ld   d, d
    ld   d, a
    ld   d, d
    and  a
    ld   d, d
    db   $52
    ld   d, d
    ld   a, $53
    ld   a, a
    ld   d, e
    xor  d
    ld   d, e
    ret  nc
    ld   d, e
    cp   $53
    jr   c, label_280FA
    adc  a, b
    ld   d, h
    xor  e
    ld   d, h
    rst  $20
    ld   d, h
    jr   nz, label_28103
    ld   l, b
    ld   d, l
    and  [hl]
    ld   d, l
    dec  b
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    ld   e, [hl]
    ld   d, [hl]
    cp   d
    ld   d, [hl]
    rst  $20
    ld   d, [hl]
    ld   [label_1C56], a
    ld   d, a
    ld   c, a
    ld   d, a
    sub  a, a
    ld   d, a
    or   e
    ld   d, a
    ld    hl, sp+$57
    ld   a, [hli]
    ld   e, b
    ld   d, c
    ld   e, b
    ld   a, d
    ld   e, b
    call label_B58
    ld   e, c
    ld   d, b
    ld   e, c
    sbc  a, d
    ld   e, c
    sbc  a, $59
    add  hl, de
    ld   e, d
    ld   d, b
    ld   e, d
    xor  c
    ld   e, d

label_280DE::
    nop
    ld   e, e
    ld   c, c
    ld   e, e
    sub  a, [hl]
    ld   e, e
    db   $D3 ; Undefined instruction
    ld   e, e
    ld   b, d
    ld   e, h
    sub  a, c
    ld   e, h
    jp   z, label_155C
    ld   e, l
    ld   l, c
    ld   e, l
    or   d
    ld   e, l
    db   $E8 ; add  sp, d
    ld   e, l
    inc  sp
    ld   e, [hl]
    ld   l, [hl]
    ld   e, [hl]
    xor  b
    ld   e, [hl]

label_280FA::
    db   $E4 ; Undefined instruction
    ld   e, [hl]
    jr   label_2815D
    jr   label_2815F
    dec  de
    ld   e, a
    add  hl, sp

label_28103::
    ld   e, a
    ld   e, l
    ld   e, a
    sub  a, [hl]
    ld   e, a
    pop  de
    ld   e, a
    rst  $28
    ld   e, a
    ld   [bc], a
    ld   h, b
    ccf

label_2810F::
    ld   h, b
    ld   [hl], b
    ld   h, b
    xor  e
    ld   h, b
    ret
    ld   h, b
    db   $ED ; Undefined instruction
    ld   h, b
    jr   label_2817B
    ld   c, l
    ld   h, c
    adc  a, b
    ld   h, c
    call nc, label_961
    ld   h, d
    cpl
    ld   h, d
    add  a, h
    ld   h, d
    sbc  a, [hl]
    ld   h, d
    cp   h
    ld   h, d
    ld   sp, hl
    ld   h, d
    inc  de
    ld   h, e
    ld   l, h
    ld   h, e
    sub  a, c
    ld   h, e
    ret  c
    ld   h, e
    ld   [de], a
    ld   h, h
    ld   b, e
    ld   h, h
    ld   e, h
    ld   h, h
    ld   [hl], h
    ld   h, h
    xor  h
    ld   h, h
    ld  [$FF00+C], a
    ld   h, h

label_28140::
    ld   [de], a
    ld   h, l
    ld   b, e
    ld   h, l
    ld   [hl], c
    ld   h, l
    cp   b
    ld   h, l
    dec  b
    ld   h, [hl]
    ccf
    ld   h, [hl]
    ld   a, c
    ld   h, [hl]
    cp   l

label_2814F::
    ld   h, [hl]
    db   $FD ; Undefined instruction
    ld   h, [hl]
    ld   h, $67
    ld   d, h
    ld   h, a
    sub  a, h
    ld   h, a
    push de
    ld   h, a
    dec  h
    ld   l, b
    jr   z, label_281C6
    dec  hl

label_2815F::
    ld   l, b
    ld   l, $68
    ld   h, e
    ld   l, b
    sub  a, e
    ld   l, b
    rst  8
    ld   l, b
    inc  de
    ld   l, c
    ld   b, e
    ld   l, c
    sub  a, c
    ld   l, c
    bit  5, c
    cp   $69
    cpl
    ld   l, d
    add  a, d
    ld   l, d
    or   l
    ld   l, d
    ld   sp, hl
    ld   l, d
    jr   label_281E7
    add  hl, sp
    ld   l, e
    sub  a, l
    ld   l, e
    bit  5, e
    db   $ED ; Undefined instruction
    ld   l, e
    dec  sp
    ld   l, h

label_28186::
    ld   e, d
    ld   l, h
    sub  a, h
    ld   l, h
    xor  a
    ld   l, h
    jp   nc, label_326C
    ld   l, l
    ld   e, c
    ld   l, l
    sub  a, e
    ld   l, l
    jp  c, label_126D
    ld   l, [hl]
    inc  sp
    ld   l, [hl]
    ld   c, d
    ld   l, [hl]
    add  a, a
    ld   l, [hl]
    call z, label_6E
    ld   l, a
    inc  hl
    ld   l, a
    ld   d, a
    ld   l, a
    ld   a, h
    ld   l, a
    and  a
    ld   l, a
    db   $D3 ; Undefined instruction
    ld   l, a
    dec  sp
    ld   [hl], b
    ld   h, e

label_281AF::
    ld   [hl], b
    xor  h
    ld   [hl], b
    db   $E4 ; Undefined instruction
    ld   [hl], b
    daa
    ld   [hl], c
    ld   h, e
    ld   [hl], c
    sbc  a, e
    ld   [hl], c
    db   $D3 ; Undefined instruction
    ld   [hl], c
    rrca
    ld   [hl], d
    ld   [de], a
    ld   [hl], d
    dec  d
    ld   [hl], d
    ld   l, [hl]
    ld   [hl], d
    pop  bc
    ld   [hl], d

label_281C6::
    inc  d
    ld   [hl], e
    ld   b, [hl]
    ld   [hl], e
    sub  a, [hl]
    ld   [hl], e
    ld   bc, label_29574
    ld   [hl], h
    cp   c
    ld   [hl], h
    db   $EB ; Undefined instruction
    ld   [hl], h
    jr   c, label_2824B
    add  a, h
    ld   [hl], l
    add  a, $75
    inc  h
    db   $76 ; Halt
    inc  h
    db   $76 ; Halt
    ld   l, a
    db   $76 ; Halt
    or   h
    db   $76 ; Halt
    inc  c
    ld   [hl], a
    ld   d, e
    ld   [hl], a
    add  a, c

label_281E7::
    ld   [hl], a
    pop  de
    ld   [hl], a

label_281EA::
    dec  de
    ld   a, b
    sub  a, a
    ld   a, b
    ld   c, $79
    adc  a, b
    ld   a, c
    add  a, $79
    inc  bc
    ld   a, d
    inc  hl
    ld   a, d
    ld   [hl], e
    ld   a, d
    sbc  a, b
    ld   a, d
    db   $ED ; Undefined instruction
    ld   a, d
    scf
    ld   a, e
    nop
    dec  c
    cp   $04
    sub  a, e
    inc  bc
    db   $F4 ; Undefined instruction
    call nz, label_D04
    add  a, l
    ld   b, e
    dec  c
    add  a, [hl]
    ld   d, d
    dec  c
    add  a, l
    ld   h, e
    dec  c
    jp   label_2303
    ld   sp, label_3225
    ld   hl, label_2933
    jp   label_2341
    ld   [hl], c
    daa
    add  a, [hl]
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], a
    jr   z, label_281EA
    ld   b, a
    inc  h
    scf
    ld   h, $35
    ld   a, [hli]
    ld   [hl], $21
    jp   label_2405
    ld   b, d
    xor  h
    ld   b, [hl]
    xor  h
    ld   h, d
    xor  h
    ld   h, [hl]
    xor  h
    ld   d, h
    cp   [hl]
    ld  [$FF00+C], a
    nop
    jr   label_28268
    db   $10
    db   $FE
    inc  b
    dec  c
    ld   [hl], h
    pop  af
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl

label_2824B::
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, d
    ld   d, h
    rrca
    add  a, d
    ld   h, h
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_28482
    sub  a, a

label_28268::
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de
    ret  nz
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    ld   [rJOYP], a
    db   $D3 ; Undefined instruction

label_28284::
    ld   l, b
    ldi  [hl], a
    cp   $04
    dec  c
    add  hl, hl
    rst  $30
    inc  de
    xor  [hl]
    ld   d, $AE
    ldi  [hl], a
    xor  [hl]
    daa
    xor  [hl]
    ld   d, c
    xor  h
    ld   h, d
    xor  h
    ld   e, b
    xor  h
    ld   h, a
    xor  h
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   [hl], b
    inc  bc
    ld   [hl], c
    daa
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_28320
    jr   z, label_28323
    inc  bc
    jr   label_2826C
    ld  [$FF00+C], a
    nop
    add  hl, de
    ld   a, b
    db   $10
    db   $FE
    inc  b
    dec  c
    jr   nz, label_282A9
    add  hl, sp
    rst  $30
    ld   [hl], h
    db   $ED ; Undefined instruction
    db   $10
    db   $C9
    ld   b, b
    ret
    ld   [hl], e

label_282C0::
    ret  z
    db   $76 ; Halt
    ret  z
    add  hl, bc
    ld   hl, label_2279
    add  a, $19
    dec  c
    adc  a, c
    ld   hl, $890F
    ld   sp, $860F
    ld   h, h
    rrca
    adc  a, c
    ld   d, c
    ld   [de], a
    ld   de, label_2A1AC
    xor  h
    inc  h
    and  [hl]
    ld   h, $A6
    dec  [hl]
    and  [hl]
    scf
    and  [hl]

label_282E2::
    ldd  [hl], a
    and  a
    add  a, d
    ld   d, d
    xor  [hl]
    cp   $04
    dec  c
    jr   nc, label_282E2
    add  a, $10
    dec  c
    adc  a, b
    jr   nz, label_28301
    adc  a, b
    jr   nc, label_28304
    adc  a, b
    ld   h, b
    rrca
    add  a, d
    ld   b, [hl]
    rrca
    add  a, d
    ld   d, [hl]
    rrca
    inc  hl
    and  [hl]
    ld   h, $A6
    ldd  [hl], a
    and  [hl]

label_28304::
    dec  [hl]
    and  [hl]
    ld   b, h
    and  [hl]
    ld   b, a
    and  [hl]
    ld   d, e
    and  [hl]
    ld   d, [hl]

label_2830D::
    and  [hl]
    nop
    ld   hl, label_2270
    jr   label_282C0
    ld   l, b
    xor  h
    add  a, e
    ld   d, b
    ld   [de], a
    cp   $04
    rrca
    inc  bc
    rst  0
    ld   b, $C7

label_28320::
    inc  b
    ld   a, [$FF74]

label_28323::
    pop  af
    add  a, $11
    inc  e
    add  a, $18
    inc  e
    ld   [de], a
    rra
    rla
    rra
    ld   h, d
    ld   e, $67
    ld   e, $E2
    nop
    ld   a, [de]
    jr   z, label_2834A
    cp   $04
    adc  a, l
    inc  b
    db   $EC ; Undefined instruction
    ld   [hl], h
    push af
    add  hl, sp
    rst  $30
    add  a, d
    ld   [hl], h
    dec  c
    jp   nz, label_D39
    add  a, d
    nop
    inc  bc
    db   $10
    db   $03
    ld   [bc], a
    dec  h
    rlca
    ld   h, $C3
    rla
    inc  h
    ld   b, a
    ld   a, [hli]
    add  a, d
    ld   c, b
    ld   hl, label_1708
    add  hl, bc
    ld   [de], a
    jp   nz, label_1118
    jr   c, label_28375
    add  hl, sp
    inc  de
    ld   d, $AF
    ld   d, [hl]
    or   b
    jp   label_126
    add  a, e
    ld   d, a
    or   b
    ld   l, b
    inc  l
    ld   l, c
    ldi  [hl], a
    ld   a, b
    inc  h
    ld   a, c
    inc  bc
    ld   h, e

label_28375::
    ret  nz
    ld   h, [hl]
    ret  nz
    jr   nz, label_2839F
    ld   hl, label_1129
    dec  h
    ld   [de], a
    add  hl, hl
    ld   [bc], a
    dec  h
    ldi  [hl], a
    xor  [hl]
    dec  [hl]
    xor  [hl]
    ld   b, d

label_28387::
    and  a
    ld   h, c
    xor  h
    cp   $04
    ld   a, l
    ld   l, c
    rst  $30
    jr   nc, label_28387
    ld   [hl], h
    push af
    add  a, d
    ld   [hl], h
    dec  c
    jp   nz, label_D30
    adc  a, d
    nop
    ld   [de], a
    add  a, d
    ld   bc, $82AC
    ld   b, $AC
    inc  d
    and  b
    ld   hl, $8596
    ldi  [hl], a
    inc  de
    daa
    sub  a, l
    jr   nc, label_283C0
    ld   sp, label_3214
    dec  h
    add  a, e
    inc  sp
    ld   hl, label_2636
    scf
    dec  d
    add  a, d
    jr   c, label_283CE
    add  a, d
    ld   b, b
    ld   hl, label_2942

label_283C0::
    add  a, e
    ld   b, e
    ld   bc, $B044
    ld   b, [hl]
    ld   a, [hli]
    add  a, d
    ld   b, a
    ld   hl, label_2649
    adc  a, c
    ld   d, b

label_283CE::
    or   b
    ld   d, h
    dec  c
    ld   e, c
    inc  h
    ld   h, b
    ldi  [hl], a
    ld   h, c
    dec  hl
    ld   [hl], b
    inc  bc
    ld   [hl], c
    inc  hl
    jp   nz, label_D19
    jp   label_2459
    cp   $00
    dec  c
    jr   nc, label_283DC
    db   $76 ; Halt
    push af
    db   $76 ; Halt
    dec  hl
    ld   [hl], a
    dec  c
    ld   a, b
    inc  l
    inc  b
    dec  h
    ld   [label_926], sp
    inc  bc
    add  a, e
    nop
    ld   [de], a
    inc  bc
    ld   d, $C3
    inc  d
    inc  hl
    jr   label_28428
    add  hl, de
    ld   h, $0A
    ld   h, $C2
    inc  de
    db   $10
    db   $82
    jr   nc, label_2841B
    inc  sp
    inc  d
    ld   b, b
    dec  h
    add  a, e
    ld   b, c
    ld   hl, label_2944
    ld   b, d
    sbc  a, b
    ld   d, d
    sbc  a, $45
    xor  a
    ld   d, l
    ld   bc, $B065

label_2841B::
    jp   nz, label_D10
    cp   $04
    rlca
    ld   [hl], h
    push af
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c

label_28428::
    db   $76 ; Halt
    inc  l
    ld   hl, label_2A0AC
    daa
    ld   h, c
    dec  hl
    ld   [hl], b
    inc  bc
    ld   [hl], c
    daa
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_284B1
    jr   z, label_284B4
    inc  bc
    jr   z, label_283DF
    nop
    inc  bc
    ld   bc, label_1025
    dec  h
    ld   de, label_829
    ld   h, $09
    inc  bc
    jr   label_28476
    add  hl, de
    ld   h, $FE
    inc  b
    dec  c
    inc  b
    ld    hl, sp+$74
    push af
    inc  sp
    xor  h
    ld   [hl], $AC
    inc  bc
    rst  0
    ld   b, $C7
    add  a, h
    ld   b, e
    ret  nz
    dec  [hl]
    cp   [hl]
    ld  [$FF00+C], a
    nop
    dec  de
    ld   a, b
    db   $10
    db   $FE
    inc  b
    rrca
    add  hl, sp
    ld   b, d
    add  a, d
    nop
    inc  bc
    add  a, $10
    inc  bc
    add  a, d
    ld   [hl], b
    inc  bc
    ld   [bc], a

label_28476::
    dec  h

label_28477::
    ld   de, label_1225
    add  hl, hl
    inc  de
    ld   bc, label_1483
    or   b
    add  a, d
    rla

label_28482::
    ld   bc, label_22C4
    ld   bc, $B023
    add  a, d
    daa
    or   b
    ld   d, e
    xor  a
    add  a, d
    ld   d, a
    xor  a
    ld   h, e
    ld   bc, label_2A483
    xor  a
    add  a, d
    ld   h, a
    ld   bc, label_21C4
    inc  hl
    ld   h, c
    daa
    ld   h, d
    dec  hl
    ld   [hl], d
    daa
    inc  [hl]
    and  b
    cp   $04
    ld   e, l
    jr   nc, label_284E9
    ld   [hl], h
    push af
    inc  b
    db   $F4 ; Undefined instruction
    add  hl, sp
    rst  $30
    add  a, d
    inc  b
    dec  c

label_284B1::
    jp   nz, label_D39

label_284B4::
    ld   [label_924], sp
    inc  bc
    jp   nz, label_C013
    jp   nz, label_C016
    jr   label_284EA
    add  hl, de
    ld   hl, $AF32
    scf
    xor  a
    ld   b, d
    or   b
    ld   b, a

label_284C9::
    or   b
    ld   d, c
    xor  a
    ld   h, c
    ld   bc, label_2A287
    xor  a
    add  a, d
    ld   h, h

label_284D3::
    db   $28
    jr   z, label_28477
    cp   $04
    ld   l, l
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_284D3
    add  a, d
    inc  b
    dec  c
    jp   nz, label_D30
    nop
    inc  bc
    ld   bc, label_1023
    ld   hl, label_2911
    add  a, e
    inc  de
    rrca
    add  hl, de
    rst  $30
    add  hl, de
    inc  h
    jr   z, label_28501
    add  hl, sp
    and  [hl]
    jp   nz, label_D49
    add  a, e
    inc  hl
    rrca
    add  a, e

label_284FD::
    inc  sp
    rrca
    inc  h
    and  b

label_28501::
    daa
    and  [hl]
    ld   d, h
    and  [hl]
    ld   d, a
    and  [hl]
    add  hl, hl
    dec  c
    add  hl, de

label_2850A::
    ld   a, [hli]
    ld   l, c
    inc  l
    cp   $04
    dec  c
    ld   b, $F4
    jr   nc, label_2850A
    add  hl, sp
    rst  $28
    ld   [hl], h
    ei
    ld   b, $29
    rlca
    dec  c
    ld   [label_202A], sp
    dec  c
    add  a, h
    jr   nc, label_284C9
    add  a, [hl]
    inc  hl
    and  [hl]
    jp   nz, label_D40
    db   $10
    db   $29
    ld   h, b
    dec  hl
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_28522
    add  hl, sp
    rst  $30
    add  hl, hl
    jp   z, label_CA59
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    inc  sp
    inc  l
    inc  [hl]
    ldi  [hl], a
    dec  [hl]
    dec  hl
    ld   b, e
    ld   a, [hli]
    ld   b, h
    ld   hl, label_2945
    jr   z, label_284FD

label_2854F::
    ld   e, b
    xor  [hl]
    daa
    xor  a
    ld   d, a
    or   b
    jp   nz, label_137
    cp   $04
    rrca
    jr   nc, label_2854F
    inc  b
    ld   a, [$FF03]
    rst  0
    ld   b, $C7
    jr   nz, label_2852E
    ld   d, b
    ret
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF39]
    di
    add  hl, hl
    jp   z, label_CA59
    nop
    inc  bc
    add  hl, bc
    inc  bc
    ld   [hl], b
    inc  bc
    ld   a, c
    inc  bc
    ld   bc, label_825
    ld   h, $10
    dec  h
    ld   de, label_1829
    ld   a, [hli]

label_28584::
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   [hl], c
    daa
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_28609
    jr   z, label_28519
    ld   [de], a
    rst  $18
    add  a, d
    inc  d
    dec  c
    call nz, label_DF21
    add  a, [hl]
    ld   h, d
    rst  $18
    add  a, d
    ld   h, h
    dec  c
    jr   z, label_28582
    ld   e, b
    rst  $18
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   b, e
    ret  nz
    ld   b, [hl]

label_285AC::
    ret  nz
    cp   $04
    dec  c
    jr   nc, label_285A8
    add  hl, hl
    rst  $30
    ld   [hl], h
    push af
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    ld   e, c
    inc  l
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  l
    inc  hl
    xor  a
    ld   h, $AF
    inc  sp
    ld   bc, $0136
    ld   b, e
    or   b
    add  a, e
    ld   b, h
    xor  [hl]
    ld   b, [hl]
    or   b
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    dec  [hl]
    xor  d
    jr   z, label_2857C
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    ld   a, [$F620]
    inc  [hl]
    and  b
    jr   nz, label_28611
    jp   nz, label_D30
    ld   d, b
    dec  hl
    ld   de, label_2A101
    ld   bc, $B021
    ld   d, c
    xor  a
    ld   d, e
    ret  nz
    ld   d, [hl]
    ret  nz
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, h
    ld   b, e
    rrca
    inc  de
    xor  h
    ld   d, $AC

label_28609::
    jr   z, label_285AC

label_2860B::
    cp   $04
    dec  c
    add  hl, sp
    di
    add  a, e

label_28611::
    ldi  [hl], a
    rrca
    add  a, e
    ldd  [hl], a
    rrca
    add  a, e
    ld   b, d
    rrca
    ldi  [hl], a
    ret  nz

label_2861B::
    inc  h
    ret  nz
    inc  sp
    and  b
    ld   b, $26
    ld   d, $24
    ld   h, $2A
    add  a, d
    daa
    ld   hl, label_2629
    add  a, e
    rlca
    inc  bc
    add  a, e
    rla
    inc  bc
    add  a, e
    ld   h, a
    inc  bc
    add  a, e
    ld   [hl], a
    inc  bc
    ld   d, [hl]
    inc  l
    add  a, d
    ld   d, a
    ldi  [hl], a
    ld   e, c
    jr   z, label_286A4
    inc  h
    db   $76 ; Halt
    jr   z, label_28653
    xor  h
    dec  d

label_28644::
    xor  h
    ld   h, c
    xor  h
    ld   h, l
    xor  h
    cp   $04
    dec  c
    jr   nc, label_28644
    add  hl, sp
    rst  $30
    jr   nz, label_2861B
    ld   d, b

label_28653::
    ret
    ld   hl, $86B0
    ld   [de], a
    or   b
    jr   z, label_2860B
    ld   d, c
    xor  a
    add  a, [hl]
    ld   h, d
    xor  a
    ld   e, b
    xor  a
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    ld   e, c
    inc  l
    nop
    inc  bc
    add  hl, bc
    inc  bc
    ld   [hl], b
    inc  bc
    ld   a, c
    inc  bc
    ld   bc, label_825
    ld   h, $10
    dec  h
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   [hl], c

label_28682::
    daa
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_28700

label_28688::
    jr   z, label_286BC
    rrca
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_28688
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    jr   nz, label_286C4
    jp   nz, label_D30
    ld   d, b
    dec  hl
    add  a, $11
    rrca
    add  a, $18
    rrca

label_286A6::
    adc  a, b
    ld   de, label_2A20F
    rrca
    ld   h, a
    rrca
    jp   label_C022
    jp   label_C027
    inc  hl
    ret  nz
    ld   h, $C0
    ld   de, label_18AC
    xor  h
    ld   h, c

label_286BC::
    xor  h
    ld   l, b
    xor  h
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    db   $D3 ; Undefined instruction

label_286C4::
    ld   l, b
    ldi  [hl], a
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    rst  0
    ld   [bc], a
    ld   h, e
    jp   label_2AC10
    add  a, e
    ld   d, $6B
    rla
    ld   l, c
    add  a, e
    ld   h, $69
    daa
    add  a, d
    adc  a, d
    ld   b, b
    ld   l, l
    ld   b, d
    ld   h, d
    ld   b, l
    inc  b
    ld   c, b
    ld   h, d
    jp   label_29450
    jp   nz, label_29751
    jp   nz, label_2A358
    jp   nz, label_2AC59
    ld   [hl], c
    ld   d, h
    adc  a, b
    ld   [hl], d
    ld   e, e
    pop  hl
    nop
    ld   bc, label_2A048
    cp   $05
    sub  a, h
    adc  a, d
    nop

label_28700::
    ld   l, l
    rst  0
    rlca
    ld   h, e
    add  a, e
    ld   de, label_126B
    ld   l, c
    add  a, e
    ld   hl, label_2269
    add  a, d
    jp   nz, label_2AC19
    add  a, h
    ld   [hl], $6D
    scf
    ld   h, d
    ld   b, b
    ld   l, l
    ld   b, c
    ld   h, d
    add  a, d
    ld   b, e
    ld   l, l
    jp   label_29148
    jp   label_29449
    jp   nz, label_2AC50
    jp   nz, label_2A351
    adc  a, b
    ld   [hl], b
    ld   e, e
    add  a, d
    ld   a, b
    ld   d, h
    pop  hl
    nop
    inc  bc
    adc  a, b

label_28733::
    jr   nz, label_28733
    dec  b
    sub  a, h
    rst  0
    nop
    ld   l, h
    add  a, d
    jr   nc, label_287AA
    adc  a, d
    ld   [hl], b
    ld   l, l
    add  a, d
    ld   h, c
    ld   [hl], l
    ld   h, h
    ld   [hl], l
    add  a, e
    ldd  [hl], a
    ld   l, e
    inc  sp
    ld   l, c
    add  a, e
    ld   b, d
    ld   l, c
    ld   b, e
    add  a, d
    add  a, e
    ld   [hl], $6B
    scf
    ld   l, c
    add  a, e
    ld   b, [hl]
    ld   l, c
    ld   b, a
    add  a, d
    ld   [bc], a
    ld   c, l
    ld   [$C24D], sp
    dec  b
    ld   c, l
    ld   [de], a
    ld   a, b
    jr   label_287DC
    dec  h
    ld   a, b
    ldi  [hl], a
    ld   a, c
    jr   z, label_287E3
    dec  [hl]
    ld   a, c
    pop  hl
    nop
    dec  bc
    ld   e, b
    ld   b, b
    cp   $05
    sub  a, h
    add  a, e
    ld   sp, label_326B
    ld   l, c

label_28779::
    add  a, e
    ld   b, c
    ld   l, c
    ld   b, d
    add  a, d
    add  a, l
    dec  b
    ld   l, l
    jp   nz, label_2AC15
    add  a, $19
    ld   l, h
    add  a, l
    dec  [hl]
    ld   l, l
    adc  a, d
    ld   [hl], b
    ld   l, l
    rst  0
    rlca
    ld   h, e
    ld   h, h
    ld   [hl], l
    ld   h, [hl]
    ld   [hl], l
    ld   l, b
    ld   [hl], l
    scf
    ld   h, d
    pop  hl
    nop
    dec  bc
    ld   e, b
    ld   b, b
    cp   $04
    sub  a, e
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [hl], e
    push af
    ret  z
    inc  bc
    inc  hl
    ret  z
    inc  b
    dec  c

label_287AA::
    ret  z
    dec  b
    inc  h
    cp   $04
    dec  c
    ld   [hl], e
    push af
    ld   [hl], e
    dec  hl
    ld   [hl], h
    dec  c
    ld   [hl], l
    inc  l
    add  a, e
    inc  de
    rrca
    add  a, e
    inc  hl
    rrca
    add  a, e
    inc  sp
    rrca
    ld   [de], a
    xor  h
    ld   d, $AC
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    inc  h
    and  b
    jp   label_111
    jp   label_117
    jp   label_118
    ld   b, c
    or   b
    add  a, d
    ld   b, a
    or   b
    add  a, l
    ld   b, d
    xor  [hl]

label_287DC::
    ld   b, h
    dec  c
    cp   $05
    sub  a, h
    adc  a, d
    nop

label_287E3::
    ld   l, l
    jp   label_2A201
    jp   nz, label_2AC10
    add  a, d
    dec  d
    ld   [hl], c
    add  a, e
    rla
    ld   l, e
    jr   label_2885B
    add  a, e
    daa
    ld   l, c
    jr   z, label_28779
    add  a, e
    jr   nc, label_28867
    jp   label_29440
    jp   label_29741
    ld   b, e
    ld   h, h
    ld   d, e
    ld   h, l
    add  a, d
    ld   c, b
    ld   l, l
    add  a, d
    ld   [hl], b
    ld   d, h
    adc  a, b
    ld   [hl], d
    ld   e, e
    inc  hl
    ld   l, l
    pop  hl
    inc  bc
    ld   [hl], d
    jr   z, label_28884
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    rst  0
    ld   [$8363], sp
    ld   de, label_126B
    ld   l, c
    add  a, e
    ld   hl, label_2269
    add  a, d
    jp   label_2AC13
    jp   label_2AC16
    add  a, $19
    ld   d, c
    add  a, d
    ld   b, b
    ld   l, l

label_28833::
    ld   b, e
    ld   l, l
    ld   b, [hl]

label_28836::
    ld   l, l
    adc  a, c
    ld   [hl], b

label_28839::
    ld   e, e
    ld   a, c
    ld   d, h
    pop  hl
    inc  bc
    ld   h, a
    adc  a, b

label_28840::
    jr   nz, label_28840
    inc  b
    rlca
    add  hl, sp
    rst  $28
    ret  z
    nop
    inc  bc
    ld   [label_921], sp
    ld   h, $61
    inc  bc
    add  hl, de
    inc  h
    add  a, d
    ld   [hl], c
    inc  bc
    ld   l, c
    inc  bc
    add  a, d
    ld   a, b
    inc  bc
    ld   bc, label_1125
    inc  hl
    ld   [bc], a
    ld   hl, label_2751
    ld   d, d
    dec  hl
    ld   h, d
    daa
    ld   h, e
    dec  hl

label_28867::
    ld   [hl], e
    daa
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_288D5
    inc  l

label_2886F::
    ld   l, b
    jr   z, label_288E9
    jr   z, label_28896
    xor  e
    ld   h, l
    xor  e
    jp   label_2321
    jr   z, label_2881D
    cp   $04
    dec  l
    jr   nc, label_2886F
    add  hl, sp
    rst  $30
    ld   [hl], h

label_28884::
    push af
    nop
    inc  bc
    ld   c, c
    inc  bc
    ld   [hl], b
    inc  bc
    ld   bc, label_525
    rst  0
    db   $10
    db   $25
    ld   de, label_2029
    ret
    ld   d, b

label_28896::
    ret
    ld   h, b

label_28898::
    daa
    ld   h, c
    dec  hl
    ld   [hl], c
    daa
    ld   [de], a
    ld   bc, $B013
    ld   hl, label_22B0
    or   b
    add  a, e
    ld   d, $20
    add  a, e
    ld   h, $20
    daa
    and  b
    add  a, d

label_288AE::
    inc  hl
    jr   nz, label_28833
    ld   d, [hl]
    jr   nz, label_28836
    ld   h, [hl]
    jr   nz, label_28839
    ld   b, [hl]
    xor  [hl]
    ld   d, c
    xor  a
    ld   d, d
    xor  a
    ld   h, d
    ld   bc, $AF63
    jr   c, label_288EF
    add  hl, sp
    ret  z
    ld   c, b
    inc  h
    ld   e, b
    ld   a, [hli]
    ld   e, c
    rst  0
    ld   [hl], e

label_288CC::
    dec  hl
    ld   [hl], h
    dec  c
    ld   [hl], l
    inc  l
    cp   $04
    dec  l
    jr   nc, label_288CC
    add  hl, sp
    rst  $30
    add  a, $10
    dec  c
    adc  a, b
    ld   de, $88DB
    ld   hl, $88DB
    ld   sp, $00DB
    ld   hl, label_2270
    inc  b

label_288E9::
    inc  bc
    inc  bc
    ld   h, $05
    dec  h
    inc  de

label_288EF::
    ld   a, [hli]
    dec  d
    add  hl, hl
    inc  d
    rst  0
    rlca
    rst  0
    inc  hl
    and  [hl]
    dec  h
    and  [hl]
    daa
    and  b
    inc  [hl]
    call c, label_2B30
    ld   b, b
    inc  hl
    ld   d, b
    add  hl, hl
    adc  a, b
    ld   b, c
    xor  [hl]
    add  hl, sp
    inc  l
    ld   c, c
    inc  h
    ld   e, c
    ld   a, [hli]
    adc  a, b
    ld   d, c

label_2890F::
    call c, label_29384
    jr   nz, label_28898
    ld   h, e
    call c, label_C872
    ld   [hl], a
    ret  z
    inc  h
    dec  c
    cp   $04
    ld   c, l
    jr   nc, label_28917
    ld   e, c
    rst  $30
    add  a, $19

label_28925::
    dec  c
    add  hl, bc
    ld   hl, $C703
    ld   b, $C7
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z

label_28930::
    jp   nz, label_DC11
    dec  d
    xor  [hl]
    ldd  [hl], a
    xor  a
    add  a, a
    inc  sp
    xor  a
    inc  [hl]
    dec  c
    scf
    dec  c
    add  a, a
    ld   b, d
    or   b
    ld   b, h
    xor  [hl]
    ld   b, a
    xor  [hl]
    jr   nc, label_2890F
    ld   sp, label_2802B
    inc  bc
    ld   b, c

label_2894C::
    inc  hl
    ld   d, b
    rst  0
    ld   d, c
    add  hl, hl
    add  a, h
    ld   d, d
    call c, label_29682
    db   $DB
    add  a, d
    ld   h, [hl]
    db   $DB
    ld   c, c
    inc  l
    ld   e, c
    ld   a, [hli]
    ld   l, c
    dec  c
    ld   a, c
    ldi  [hl], a
    cp   $04
    ld   c, l
    add  hl, sp
    rst  $28
    ld   d, b
    or   $77
    push af
    inc  b
    rst  0
    add  hl, hl
    jp   z, label_CA59
    ld   [hl], h

label_28972::
    ret  z
    add  a, e
    jr   nc, label_28925
    add  a, e
    inc  hl

label_28978::
    rrca
    add  a, e

label_2897A::
    inc  sp
    rrca
    add  a, e
    ld   b, e
    rrca
    ld   b, b
    dec  hl
    add  a, d
    ld   b, c
    and  [hl]
    add  a, e
    ld   d, e
    and  [hl]
    call nz, label_A626
    ld   d, b
    add  hl, hl
    ld   h, b
    dec  c
    ld   [hl], b
    ldi  [hl], a
    db   $76 ; Halt
    dec  hl
    ld   [hl], a
    dec  c

label_28994::
    ld   a, b
    inc  l
    cp   $04
    dec  c
    jr   nc, label_28989
    inc  bc
    rst  0
    ld   b, $C7
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    add  a, e
    ld   de, $8320
    ld   hl, $8320
    ld   d, c
    jr   nz, label_28930
    ld   h, c
    jr   nz, label_28972
    inc  d
    jr   nz, label_28975
    ld   d, h
    jr   nz, label_2897A
    dec  h
    jr   nz, label_289D1
    cp   a
    ld  [$FF00+C], a
    ld   bc, $883B
    db   $10
    db   $FE
    inc  b
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    ld   [hl], a
    push af
    ld   de, label_16AC
    xor  h
    jr   c, label_28978
    rlca
    ld   h, $82
    ld   [$8203], sp
    jr   label_289D7
    rla
    inc  h
    daa

label_289D7::
    ld   a, [hli]
    jr   z, label_289FB
    add  hl, hl
    ld   h, $22
    and  b
    inc  hl
    xor  [hl]
    inc  [hl]
    xor  [hl]
    ld   b, l
    xor  [hl]
    ld   d, [hl]
    xor  [hl]
    ld   b, c
    xor  a
    ld   d, d
    xor  a
    ld   d, c
    or   b
    ld   h, d
    ld   bc, $AF63
    inc  bc
    add  hl, hl
    inc  b
    dec  c
    dec  b
    ld   a, [hli]
    db   $76 ; Halt
    dec  hl
    ld   [hl], a
    dec  c
    ld   a, b

label_289FB::
    inc  l
    pop  hl
    ld   bc, label_29036
    ld   a, h
    cp   $04
    dec  c
    rlca
    db   $F4 ; Undefined instruction
    ld   b, $29
    rlca
    dec  c
    ld   [$822A], sp
    ld   [de], a
    jr   nz, label_28A32
    jr   nz, label_28994
    ld   b, h
    and  a
    jp   nz, label_A653
    jp   nz, label_A656

label_28A1A::
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    add  a, d
    ld   d, h
    rlca
    add  a, d
    ld   h, h
    rlca
    jr   z, label_289C7
    ld   de, $E2CB
    ld   bc, $883D
    add  a, b
    cp   $04
    rrca
    ld   e, c
    di

label_28A32::
    ld   [hl], h
    ei
    nop
    inc  bc
    add  hl, bc
    inc  bc
    ld   bc, label_1025
    dec  h
    ld   de, label_829
    ld   h, $18
    ld   a, [hli]
    add  hl, de
    ld   h, $86
    ld   [de], a
    rst  $18
    ld   [de], a
    rst  $18
    rla
    rst  $18
    ld   b, c
    rst  $18
    ld   c, b
    rst  $18
    add  a, [hl]
    ld   h, d
    rst  $18
    add  a, d
    ld   h, h
    rrca
    jp   nz, label_DF21
    jp   nz, label_DF28
    cp   $04
    dec  c
    rlca
    db   $F4 ; Undefined instruction
    ld   d, b
    or   $73
    ret  z
    db   $76 ; Halt
    ret  z
    ld   h, e
    xor  a
    ld   h, [hl]
    xor  a
    jr   c, label_28A1A
    inc  de
    or   b
    ld   d, $B0
    ldi  [hl], a
    ret  nz
    add  a, h
    inc  hl
    jr   nz, label_28A9D
    ret  nz
    jp   nz, label_2032
    jp   nz, label_A637
    ld   d, d
    ret  nz
    add  a, h
    ld   d, e
    and  [hl]
    ld   d, a
    ret  nz
    ld   b, $29
    ld   b, h
    set  4, d
    ld   bc, label_183C
    add  a, b
    rlca
    dec  c
    ld   [$FE2A], sp
    inc  b
    dec  c
    ld   c, c
    di
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h

label_28A9D::
    inc  sp
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_28482
    sub  a, a
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de
    ret  nz
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h

label_28AC5::
    ld   l, b
    xor  h
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    ld   [rJOYP], a
    inc  h
    jr   c, label_28AF2
    cp   $04
    rrca
    ld   b, b
    ld   a, [$FF00+C]
    pop  af
    add  a, d
    nop
    inc  bc
    add  a, d
    ld   [label_1003], sp
    dec  h
    ld   [bc], a
    dec  h
    rlca
    ld   h, $19
    ld   h, $11
    rst  0
    jr   label_28AB0
    ld   [hl], d
    ret  z
    ld   [hl], a
    ret  z
    ld   [de], a
    add  hl, hl
    rla
    ld   a, [hli]
    inc  sp

label_28AF2::
    xor  h
    ld   [hl], $AC
    cp   $04
    rlca
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    ld   a, [label_309]
    ld   a, c
    inc  bc
    jr   label_28B2C
    ld   [label_1926], sp
    ld   h, $68
    inc  l
    ld   l, c
    jr   z, label_28B83
    jr   z, label_28B16
    inc  bc
    ldd  [hl], a
    xor  a
    add  a, l
    inc  hl
    xor  a
    add  a, d
    jr   z, label_28AC5

label_28B16::
    ld   b, d
    or   b
    ld   d, e
    or   b
    add  a, h
    ld   d, [hl]
    or   b
    add  a, d
    ld   d, h
    xor  [hl]
    jp   nz, label_133
    jp   nz, label_136
    jp   nz, label_137
    add  a, d
    jr   c, label_28B2D

label_28B2C::
    add  a, d

label_28B2D::
    ld   c, b
    ld   bc, label_29C4
    inc  h
    ld   de, label_2A1AB
    xor  e

label_28B36::
    add  a, d
    inc  h
    xor  [hl]
    ld   h, a
    cp   [hl]
    ld  [$FF00+C], a
    ld   bc, label_183E
    db   $10
    db   $FE
    inc  b
    dec  c

label_28B43::
    inc  bc
    rst  0
    inc  b
    ld    hl, sp+$06
    rst  0
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    inc  de
    xor  a
    ld   d, $AF
    ld   d, e
    or   b
    ld   d, [hl]
    or   b
    jp   label_123
    jp   label_126
    call nz, label_1114
    call nz, label_1015
    add  a, d
    inc  h
    xor  [hl]
    add  a, d
    ld   d, h
    xor  [hl]
    jr   z, label_28B95
    add  hl, hl
    jr   z, label_28B30

label_28B6C::
    jr   c, label_28B92
    ld   a, b
    jr   z, label_28B36
    add  hl, sp
    inc  bc
    nop
    dec  h
    db   $10
    db   $23
    jr   nz, label_28BA0
    ld   hl, $C42B
    ld   sp, $C523
    jr   nc, label_28B84
    ld   [hl], c
    daa

label_28B83::
    jr   label_28B43
    ld  [$FF00+C], a
    ld   bc, label_183A
    db   $10
    db   $FE
    inc  b
    rlca
    ld   [hl], h
    pop  af
    adc  a, d
    nop
    inc  bc

label_28B92::
    adc  a, d
    db   $10
    db   $03

label_28B95::
    ld   [bc], a
    dec  h
    ld   [de], a
    inc  hl
    add  a, h
    inc  bc
    ld   hl, label_2607
    rla
    inc  h

label_28BA0::
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    jr   nz, label_28BD0
    ld   hl, label_2221
    add  hl, hl
    inc  h
    and  b

label_28BB1::
    daa
    ld   a, [hli]
    jr   z, label_28BD6
    add  hl, hl
    ld   h, $82
    ld   b, c
    xor  a
    add  a, h
    ld   b, e
    xor  [hl]
    add  a, d
    ld   b, a
    xor  a
    add  a, d
    ld   d, c
    or   b
    add  a, d
    ld   d, a
    or   b
    ld   d, e
    xor  e
    ld   d, [hl]
    xor  e
    cp   $04
    dec  c
    ld   [hl], a
    db   $ED ; Undefined instruction
    inc  bc

label_28BD0::
    rst  0
    ld   b, $C7
    ld   [hl], e
    ret  z
    db   $76 ; Halt

label_28BD6::
    ret  z
    add  a, h
    inc  de
    jr   nz, label_28B5D
    inc  h
    jr   nz, label_28BA0
    ld   sp, $C220
    jr   c, label_28C03
    add  a, d
    ld   d, h
    jr   nz, label_28B6B
    ld   h, e
    jr   nz, label_28B6C
    inc  [hl]
    rrca
    inc  sp
    and  a
    ld   [hl], $A7
    jr   label_28BB1
    ld  [$FF00+C], a
    ld   bc, $883F
    db   $10
    db   $FE
    inc  b
    rlca
    inc  b
    ld   a, [$FF39]
    rst  $28
    ld   d, e
    xor  e
    ld   d, [hl]
    xor  e
    cp   $04
    rlca
    jr   nc, label_28BF5
    add  hl, sp
    di
    ld   [hl], h
    push af
    jp   nz, label_300
    jp   nz, label_309
    jp   nz, label_360
    jp   nz, label_369
    ld   bc, label_1125
    inc  hl
    ld   hl, label_2029
    dec  h
    ld   [label_1826], sp
    inc  h
    jr   z, label_28C4F
    add  hl, hl
    ld   h, $50
    daa
    ld   d, c
    dec  hl
    ld   h, c
    inc  hl
    ld   [hl], c
    daa
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_28C9C
    inc  h
    ld   a, b
    jr   z, label_28C5B
    inc  l
    add  a, d
    inc  h
    ldi  [hl], a
    ld   h, $2B
    jp   nz, label_2433
    jp   nz, label_2336
    ld   d, e
    ld   a, [hli]
    ld   d, [hl]
    add  hl, hl
    add  a, d
    ld   d, h
    sub  a, a
    inc  [hl]
    xor  e
    dec  [hl]
    xor  e

label_28C4F::
    add  a, d
    ld   b, h
    rrca
    ld   [hl], e
    dec  hl

label_28C54::
    db   $76 ; Halt
    inc  l
    add  a, d
    ld   [hl], h
    dec  c
    cp   $04

label_28C5B::
    dec  c
    jr   nc, label_28C54
    add  hl, sp
    rst  $30
    ld   [hl], h
    db   $ED ; Undefined instruction
    jp   nz, label_D39
    add  a, d
    nop
    inc  bc
    add  a, d
    db   $10
    db   $03
    add  a, d
    ld   [$8203], sp
    jr   label_28C74
    add  a, d
    ld   h, b
    inc  bc

label_28C74::
    add  a, d
    ld   [hl], b
    inc  bc
    add  a, d
    ld   l, b
    inc  bc
    add  a, d
    ld   a, b
    inc  bc
    jp   nz, label_DB37
    ld   [bc], a
    dec  h
    ld   [de], a
    inc  hl
    ldi  [hl], a
    add  hl, hl
    ld   hl, label_2021
    dec  h
    ld   d, b
    daa
    ld   d, c
    ldi  [hl], a
    ld   d, d
    dec  hl
    ld   h, d
    inc  hl
    ld   [hl], d
    daa
    rlca
    ld   h, $17
    inc  h
    daa
    ld   a, [hli]
    jr   z, label_28CBD

label_28C9C::
    add  hl, hl
    ld   hl, label_2259
    ld   e, b
    ldi  [hl], a
    ld   d, a
    inc  l
    ld   h, a
    inc  h
    ld   [hl], a
    jr   z, label_28CAC
    rst  0
    ld   b, $C7

label_28CAC::
    ld   [hl], e

label_28CAD::
    ret  z
    db   $76 ; Halt
    ret  z
    ldd  [hl], a
    rrca
    cp   $04
    dec  a
    jr   nc, label_28CAD
    add  hl, sp
    rst  $30
    ld   [hl], h
    push af

label_28CBB::
    jp   nz, label_D30
    jp   nz, label_D39
    add  a, d
    ld   [hl], h
    dec  c
    jp   nz, label_360
    jp   nz, label_369
    jp   nz, label_300
    jp   nz, label_309
    ld   bc, label_825
    ld   h, $11
    inc  hl
    jr   label_28CFC
    jr   nz, label_28CFB
    ld   hl, label_2829
    ld   a, [hli]
    add  hl, hl
    ld   hl, label_2250
    ld   d, c
    dec  hl
    jp   nz, label_2361
    ld   e, b
    inc  l
    ld   e, c
    ldi  [hl], a
    jp   nz, label_2468
    add  a, [hl]
    ld   h, d
    call c, label_C703
    ld   b, $C7
    inc  hl
    ret  nz
    ld   h, $C0
    cp   $04

label_28CFB::
    ld   c, l

label_28CFC::
    db   $76 ; Halt
    ret  z

label_28CFE::
    ld   [hl], h
    db   $DB
    ld   [hl], h
    call c, label_F739
    ld   [hl], h
    push af
    jr   nc, label_28CFE
    jp   nz, label_D30
    add  hl, de
    ld   a, [hli]
    ld   l, c
    inc  l
    call nz, label_D29

label_28D12::
    add  a, e
    nop

label_28D14::
    inc  bc
    add  a, e

label_28D16::
    db   $10
    db   $03

label_28D18::
    add  a, e
    ld   h, b
    inc  bc
    add  a, e
    ld   [hl], b
    inc  bc
    inc  bc
    dec  h
    inc  de
    inc  hl
    add  a, e
    jr   nz, label_28D46
    inc  hl
    add  hl, hl
    add  a, e
    ld   d, b
    ldi  [hl], a
    ld   d, e
    dec  hl
    ld   h, e
    inc  hl
    ld   [hl], e
    daa
    ldd  [hl], a
    rrca
    jp   nz, label_A633
    add  a, d
    inc  d
    jr   nz, label_28CBB
    ld   h, a
    jr   nz, label_28D60
    jr   nz, label_28D96
    jr   nz, label_28DA7
    jr   nz, label_28DB5
    inc  hl
    add  a, d
    ld   [hl], h

label_28D45::
    dec  c

label_28D46::
    db   $76 ; Halt
    inc  l
    cp   $04
    ld   c, l
    rlca
    db   $EC ; Undefined instruction
    jr   nc, label_28D45
    jp   nz, label_D30
    inc  bc
    rst  0
    ld   b, $C7
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    add  hl, hl
    jp   z, label_CA59
    nop
    inc  bc

label_28D60::
    ld   bc, label_1025
    ld   hl, label_2911
    ld   h, b
    ldi  [hl], a
    ld   [hl], b
    inc  bc
    ld   h, c
    dec  hl
    ld   [hl], c
    daa
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, h
    ld   b, e
    rrca
    add  a, h
    ld   d, e
    rrca
    add  a, d
    inc  [hl]
    and  [hl]
    add  a, d
    ld   b, h
    and  [hl]
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    add  a, d
    ld   h, b
    inc  bc
    add  a, d
    ld   [hl], b
    inc  bc
    add  a, d
    ld   l, b
    inc  bc
    add  a, d
    ld   a, b
    inc  bc
    ld   [bc], a
    rst  0
    rlca
    rst  0
    jr   nc, label_28D60
    add  hl, sp
    jp   z, label_2750
    ld   [hl], d
    daa
    ld   d, c
    ldi  [hl], a

label_28D9F::
    ld   d, d
    dec  hl
    ld   h, d
    inc  hl
    ld   d, a
    inc  l
    ld   e, b
    ldi  [hl], a

label_28DA7::
    ld   e, c
    jr   z, label_28E11
    inc  h
    ld   [hl], a
    jr   z, label_28DB1
    add  hl, hl
    ld   b, $2A

label_28DB1::
    add  a, d
    inc  b
    dec  c
    ld   d, e

label_28DB5::
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    inc  h
    jr   c, label_28DDD
    call nz, label_2011
    call nz, label_2012
    add  a, h
    inc  de
    rrca
    call nz, label_2017
    call nz, label_2018
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, d
    inc  h
    xor  h
    ld   hl, $FEA0
    inc  b
    dec  c
    inc  b
    db   $EC ; Undefined instruction
    inc  bc
    rst  0
    ld   b, $C7
    ld   d, b
    daa
    ld   d, c

label_28DE1::
    dec  hl
    ld   h, c
    daa
    ld   h, d
    dec  hl
    ld   [hl], d
    daa
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_28E54
    inc  l
    ld   l, b
    jr   z, label_28E68
    jr   z, label_28E53
    inc  bc
    ld   l, c
    inc  bc
    add  a, d
    ld   [hl], b
    inc  bc
    add  a, d
    ld   a, b
    inc  bc
    jr   z, label_28D9F
    add  a, d
    rla
    rrca
    daa
    rrca
    add  a, d
    scf
    rrca
    add  a, h

label_28E07::
    ld   b, e

label_28E08::
    jr   nz, label_28E08
    inc  b
    dec  e
    inc  b
    db   $F4 ; Undefined instruction
    add  hl, de
    rst  $30
    add  a, d

label_28E11::
    inc  b
    dec  c
    jp   nz, label_D49
    jr   nc, label_28DE1
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    nop
    inc  bc
    jp   label_309
    ld   a, c
    inc  bc
    ld   bc, label_1023
    dec  h
    ld   de, $C329
    ld   [label_3824], sp
    ld   a, [hli]
    add  hl, sp
    ld   hl, label_2878
    ld   l, b
    inc  l
    ld   l, c
    ldi  [hl], a
    jp   nz, label_DB48
    add  a, e
    inc  sp
    db   $DB
    add  a, e
    ld   d, e
    db   $DB
    ld   b, d
    db   $DB
    ld   b, [hl]
    db   $DB
    ld   b, e
    and  b
    ld   h, b
    daa
    ld   h, c
    dec  hl
    ld   [hl], b
    inc  bc
    ld   [hl], c
    daa
    cp   $04
    dec  c
    ld   e, b
    xor  d
    inc  b

label_28E53::
    db   $F4 ; Undefined instruction

label_28E54::
    ld   b, b
    or   $02
    rst  0
    rlca
    rst  0
    ld   [hl], d
    ret  z
    ld   [hl], a
    ret  z
    jp   nz, label_D40
    jp   nz, label_2011
    jr   z, label_28E07
    ld   h, b
    dec  hl

label_28E68::
    jr   nc, label_28E93
    add  a, d
    ld   sp, label_288AE
    xor  [hl]
    add  a, $13
    ld   bc, label_15C6
    ld   bc, label_17C6
    ld   bc, label_1483
    dec  c
    inc  h
    xor  [hl]
    ld   h, $AE
    dec  h
    xor  a
    ld   [de], a
    call c, label_DC22
    ld   d, $DC
    add  a, d
    ld   b, c
    db   $DB
    ld   d, d
    call c, label_DB62
    jp   nz, label_DB34
    jp   nz, label_DC54
    ld   [hl], $DC
    jp   nz, label_DB46
    ld   h, [hl]
    call c, label_AA58
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    rst  0
    ld   bc, $C363
    db   $10
    db   $6C
    add  a, e
    inc  d
    ld   l, e
    dec  d
    ld   l, c
    add  a, e
    inc  h
    ld   l, c
    dec  h
    add  a, d
    ldi  [hl], a
    ld   l, l
    jr   z, label_28F20
    add  hl, hl
    ld   l, l
    ldd  [hl], a
    ld   l, h
    call nz, label_2A338
    add  hl, sp
    ld   l, h
    add  a, e
    ld   b, b
    ld   l, l
    ld   b, c
    ld   h, d
    add  a, l
    ld   b, l
    ld   l, l
    ld   c, b
    ld   h, d
    jp   nz, label_29750
    jp   nz, label_2AC55
    ld   [hl], b
    ld   d, h
    adc  a, c
    ld   [hl], c
    ld   e, e
    pop  hl
    ld   bc, $882D

label_28EE0::
    jr   nz, label_28EE0
    dec  b
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    call nz, label_2A308
    add  a, e
    inc  d
    ld   l, e
    dec  d
    ld   l, c
    add  a, e
    inc  h
    ld   l, c
    dec  h
    add  a, d
    jp   label_2AC19
    add  a, e
    jr   nz, label_28F67
    add  a, d
    jr   nc, label_28F51
    ldd  [hl], a
    ld   l, h
    adc  a, d
    ld   b, b
    ld   l, l
    add  a, d
    ld   b, e
    inc  b
    jp   nz, label_29158
    jp   nz, label_29459
    adc  a, b
    ld   [hl], b
    ld   e, e
    add  a, d
    ld   a, b
    ld   d, h
    pop  hl
    ld   bc, $8825

label_28F15::
    jr   nz, label_28F15
    dec  b
    sub  a, h
    adc  a, d
    nop
    ld   d, h
    add  a, h
    db   $10
    db   $54
    add  a, e

label_28F20::
    jr   nz, label_28F76
    inc  d
    ld   e, [hl]
    inc  hl
    ld   e, [hl]
    jp   nz, label_29730
    jp   label_2A850
    jp   nz, label_2A561
    ld   h, c
    ld   h, h
    adc  a, b
    ld   h, d
    ld   l, b
    adc  a, b
    ld   [hl], d
    ld   l, b
    jp   label_2AC53
    jp   label_2AC57
    ld   d, $71
    jr   label_28FB2
    ld   b, c
    ld   [hl], c
    ldd  [hl], a
    ld   [hl], c
    dec  h
    ld   [hl], c
    daa
    ld   [hl], c
    add  hl, hl
    ld   [hl], c
    ld   sp, label_1570
    ld   [hl], b
    rla
    ld   [hl], b

label_28F51::
    add  hl, de
    ld   [hl], b
    ld   c, c
    ld   l, b
    pop  hl
    ld   bc, label_28829
    ld   d, b
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   d, h
    add  a, h
    ld   d, $54
    add  a, e
    daa
    ld   d, h
    jp   nz, label_29139
    dec  d
    ld   e, d
    ld   h, $5A
    jp   label_2A859
    add  a, d
    ld   b, b
    ld   l, b
    ld   b, [hl]
    ld   l, b
    ld   b, a

label_28F76::
    ld   h, h
    ld   d, a
    ld   h, l
    ld   h, b
    ld   l, b
    ld   h, a
    ld   l, b
    adc  a, b
    ld   [hl], b
    ld   l, b
    jp   label_2AC54
    jp   nz, label_2A568
    ld   l, b
    ld   h, h
    ld   de, label_1371
    ld   [hl], c
    jr   nz, label_28FFF
    ldi  [hl], a
    ld   [hl], c
    inc  h
    ld   [hl], c
    ld   c, b
    ld   [hl], c
    db   $10
    db   $70
    ld   [de], a
    ld   [hl], b
    inc  d
    ld   [hl], b
    jr   c, label_2900C
    pop  hl
    ld   bc, label_1827

label_28FA0::
    jr   nz, label_28FA0
    dec  b
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    jp   nz, label_29710
    push bc
    jr   nc, label_29001
    ld   sp, $C45B
    ld   b, c
    ld   d, h

label_28FB2::
    ldd  [hl], a
    ld   e, l
    jp   label_29742
    adc  a, b
    ld   [hl], d
    ld   d, h
    jp   label_2A301
    dec  d
    ld   e, d
    add  a, h
    ld   d, $54
    ld   h, $5A
    add  a, e
    daa
    ld   d, h
    add  a, d
    ld   h, e
    ld   c, h
    ld   h, a
    ld   c, h
    scf
    ld   [hl], c
    ld   c, b
    ld   [hl], c
    add  hl, sp
    ld   [hl], c
    jr   c, label_29044
    add  a, d
    ld   h, l
    ld   e, e
    add  a, d
    ld   l, b

label_28FD9::
    ld   e, e
    pop  hl
    ld   bc, label_2B82C
    ld   [hl], b
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    add  a, [hl]
    db   $10
    db   $54
    add  a, l
    jr   nz, label_2903F
    ld   d, $5E

label_28FED::
    dec  h
    ld   e, [hl]
    push bc
    ld   [label_3063], sp
    ld   [hl], c
    ldd  [hl], a
    ld   [hl], c
    inc  [hl]
    ld   [hl], c
    ld   b, c
    ld   [hl], c
    ld   b, e
    ld   [hl], c
    ld   sp, label_3370

label_28FFF::
    ld   [hl], b
    add  a, $19
    ld   d, c
    add  a, d
    ld   h, b
    ld   e, e
    add  a, [hl]
    ld   h, d
    ld   c, h
    ld   l, b
    ld   e, c
    adc  a, d

label_2900C::
    ld   [hl], b
    ld   d, h
    pop  hl
    ld   bc, $882F

label_29012::
    jr   nz, label_29012
    inc  b
    dec  c
    ld   l, c
    rst  $30
    ld   [hl], h

label_29019::
    ei
    ld   a, b
    push af
    add  a, d
    nop
    inc  bc
    ld   [bc], a
    dec  h
    rlca
    ld   h, $82
    ld   [label_1003], sp
    inc  bc
    ld   de, label_1225
    add  hl, hl
    rla
    ld   a, [hli]
    jr   label_29056
    add  hl, de
    inc  bc
    jr   nz, label_29059
    ld   hl, label_2829
    ld   a, [hli]

label_29038::
    add  hl, hl
    ld   h, $56
    inc  l
    ld   d, a
    ldi  [hl], a
    ld   e, b

label_2903F::
    sbc  a, b
    ld   e, c
    jr   z, label_290A9
    inc  h

label_29044::
    jp   nz, label_1067
    ld   l, c
    ld   [de], a
    db   $76 ; Halt
    jr   z, label_290C4
    dec  c
    ld   a, c
    inc  de
    add  a, d
    inc  h
    jr   nz, label_29086
    jr   nz, label_2908B
    jr   nz, label_28FD9
    ld   b, h
    jr   nz, label_2905D
    rst  0
    ld   b, $C7

label_2905D::
    cp   $04
    dec  c
    add  hl, sp
    ld   b, d
    ld   h, b
    or   $84
    inc  h
    inc  de
    add  a, d
    inc  [hl]
    jr   nz, label_28FED
    ld   b, h
    jr   nz, label_290BE
    daa
    adc  a, b
    ld   d, c
    ldi  [hl], a
    ld   e, c
    jr   z, label_28FFF
    ld   h, b
    ld   [de], a
    adc  a, d
    ld   [hl], b
    inc  de
    ldd  [hl], a
    rrca
    ld   [bc], a
    rst  0
    rlca
    rst  0
    cp   $04

label_29082::
    dec  c
    add  hl, hl
    rst  $30
    jr   nc, label_290D0

label_29087::
    ld   d, b
    daa
    adc  a, b
    ld   d, c

label_2908B::
    ldi  [hl], a
    ld   e, c
    jr   z, label_29019
    ld   h, b
    ld   [de], a
    adc  a, d
    ld   [hl], b
    inc  de
    add  a, e
    inc  de
    rrca
    add  a, e
    inc  hl
    rrca

label_2909A::
    add  a, e
    inc  sp
    rrca
    inc  h
    and  b
    ld   [bc], a
    rst  0
    rlca
    rst  0
    cp   $04
    dec  c
    jr   nz, label_2909A
    ld   [hl], h

label_290A9::
    pop  af
    ld   b, $26
    add  a, e
    rlca
    inc  bc
    ld   d, $2A
    rla
    ld   hl, label_2618
    add  hl, de
    inc  bc
    jr   z, label_290E3
    add  hl, hl
    ld   h, $50
    daa
    ld   d, c

label_290BE::
    ldi  [hl], a
    ld   d, d
    dec  hl
    ld   h, b
    ld   [de], a
    ld   h, c

label_290C4::
    ld   d, $62
    inc  hl
    ld   h, a
    inc  l
    ld   l, b
    ldi  [hl], a
    ld   l, c
    jr   z, label_2913E

label_290CE::
    inc  de
    ld   [hl], c

label_290D0::
    inc  d
    ld   [hl], d
    daa
    ld   [hl], a
    jr   z, label_2914E
    rrca
    ld   a, c
    inc  l
    db   $10
    db   $C9
    ld   b, b
    ret
    cp   $04
    dec  c
    inc  b
    ld   a, [$FB74]
    ld   [label_2B8F4], sp
    push af
    ld   b, $26
    add  a, $16
    inc  h
    db   $76 ; Halt
    jr   z, label_290F7
    inc  d
    ld   [label_90D], sp
    dec  d
    add  a, $17

label_290F7::
    ld   de, label_19C6
    db   $10
    db   $77
    ld   d, $78
    dec  c
    ld   a, c
    rla
    jr   z, label_290A4
    jr   nz, label_290CE
    ld   d, b
    ret
    ld   h, $CA
    ld   d, [hl]
    jp   z, label_4FE
    dec  c
    add  hl, hl
    di
    ld   [hl], l
    pop  af
    jp   label_A647
    ld   c, b
    and  [hl]
    ld   e, b
    sbc  a, $59
    dec  c
    jp   nz, label_D68
    ld   l, c
    inc  l
    ld   a, c
    inc  h
    ld   c, c
    ld   a, [hli]
    ld   [hl], a
    dec  hl
    nop
    dec  c
    ld   bc, label_1025
    dec  h
    ld   de, label_2A029
    daa
    add  a, e
    ld   h, c
    ldi  [hl], a
    ld   h, e
    sbc  a, b
    ld   h, h
    dec  hl

label_29137::
    add  a, d

label_29138::
    ld   [hl], b

label_29139::
    ld   [de], a
    ld   [hl], d
    ld   d, $73
    dec  c

label_2913E::
    ld   [hl], h
    daa
    ld   a, b

label_29141::
    dec  c
    inc  bc
    rst  0
    rlca
    rst  0
    cp   $04

label_29148::
    dec  c

label_29149::
    jr   nz, label_29141
    add  hl, hl
    rst  $30
    ld   [hl], e

label_2914E::
    push af
    ld   [bc], a
    rst  0
    dec  b
    rst  0
    rlca
    inc  h
    rla

label_29156::
    ld   a, [hli]
    add  a, d

label_29158::
    jr   label_2917B
    add  a, d

label_2915B::
    ld   [$C50D], sp
    add  hl, hl
    dec  c
    add  a, e
    inc  hl
    and  [hl]
    inc  h
    and  b
    call nz, label_1133
    add  a, d
    ld   b, c
    inc  de
    add  a, d
    ld   d, b
    dec  c
    ld   h, b
    ldi  [hl], a
    ld   h, c
    dec  hl
    jp   nz, label_D62
    ld   [hl], b
    inc  bc
    ld   [hl], c
    inc  hl
    jp   nz, label_A736
    call nz, label_A628
    add  a, e
    ld   d, l
    and  [hl]
    add  a, d
    ld   h, l
    ld   c, a
    ld   h, a
    and  a

label_29187::
    ld   [hl], e
    inc  l
    add  a, d
    ld   [hl], h
    ldi  [hl], a
    db   $76 ; Halt
    dec  hl
    ld   a, c
    inc  l
    ld   b, b
    add  hl, hl
    ld   a, b
    dec  c
    ld   d, d
    sbc  a, $07

label_29197::
    ld   h, $77
    dec  c
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_29197
    ld   [hl], e
    ld   c, b
    rlca
    ld   h, $09
    inc  h
    db   $10
    db   $29
    add  a, $17
    inc  h
    ret  z
    ld   [label_2B00F], sp
    ldi  [hl], a
    ld   [hl], a
    jr   z, label_2922D
    inc  h
    ld   c, b
    xor  a
    ld   e, b
    or   b
    jr   label_2915B
    daa
    jp   z, label_CA57
    jp   label_F13

label_291C2::
    add  a, l
    ld   b, c
    rrca
    add  a, e
    ld   d, d
    rrca
    ld   h, e
    rrca
    push bc
    jr   nz, label_291DA
    cp   $04
    dec  c
    inc  b
    ld   a, [$F749]
    ld   [label_6F4], sp
    ld   h, $82
    ld   d, $24
    ld   h, $2A
    add  a, d
    daa
    ld   hl, label_2629
    jr   label_29205
    add  hl, de
    dec  c
    ld   d, b
    daa
    add  a, d
    ld   d, c
    ldi  [hl], a
    ld   d, e
    dec  hl
    add  a, e
    ld   h, b
    inc  bc
    ld   h, e
    inc  hl
    add  a, e
    ld   [hl], b
    inc  bc
    ld   [hl], e
    daa
    jp   nz, label_1007

label_291FA::
    add  hl, bc
    ld   [de], a
    jp   nz, label_D08
    add  a, d
    jr   label_29215
    ldd  [hl], a
    rrca
    rla

label_29205::
    xor  h
    ld   h, d
    xor  h
    cp   $04
    dec  c
    dec  b
    ld   a, [$FF40]
    ld   a, [$FF00+C]
    rst  $30
    ld   [label_90D], sp
    inc  h

label_29215::
    jp   nz, label_1017
    add  hl, de
    ld   a, [hli]
    jr   z, label_291FA
    add  hl, hl
    and  [hl]
    call nz, label_D39

label_29221::
    add  hl, sp
    ld   [de], a
    ld   a, c

label_29224::
    ldi  [hl], a
    rlca
    add  hl, hl
    jr   nz, label_2924E
    nop
    ld   [de], a
    ld   bc, label_216
    dec  h
    ld   [de], a
    inc  hl
    ldi  [hl], a
    add  hl, hl
    ld   hl, label_1098
    inc  de
    ld   sp, label_30A7
    ret
    ld   h, b
    ret
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    add  a, d
    nop
    ld   [de], a
    ld   [bc], a
    and  [hl]

label_29246::
    inc  bc
    dec  c
    inc  b
    dec  h
    db   $10
    db   $13
    ld   de, label_120D
    dec  h
    inc  de
    ld   hl, label_2914

label_29254::
    scf

label_29255::
    sub  a, h
    cp   $04
    dec  c
    add  hl, hl
    jp   z, label_CA49
    inc  bc
    db   $F4 ; Undefined instruction
    add  hl, sp
    ld   c, d
    ld   b, b
    or   $74
    push af
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  l
    push bc
    jr   nz, label_2927C
    ld   [bc], a
    dec  c
    nop
    inc  bc
    ld   bc, label_1023
    ld   hl, label_2911
    jp   nz, label_1113

label_2927C::
    add  a, e
    jr   nc, label_29291
    inc  sp
    sub  a, e
    ld   hl, label_22BE

label_29284::
    sbc  a, $70
    ldi  [hl], a
    inc  b
    dec  c
    ld  [$FF00+C], a
    ld   [bc], a
    xor  d
    jr   label_2929E
    inc  bc
    ld   a, [hli]
    inc  b

label_29291::
    rst  0
    dec  b
    rst  0
    ld   b, $29
    add  a, d
    rlca
    dec  c
    add  hl, bc
    inc  h
    add  a, d
    ld   d, a
    jr   nz, label_29221
    ld   h, d
    jr   nz, label_29224
    ld   h, a
    jr   nz, label_292C5
    and  [hl]
    cp   $04
    dec  c
    jr   nc, label_292EC
    inc  bc
    ccf
    rlca
    ld   h, $C2
    ld   [label_90F], sp
    inc  h
    rla
    inc  h
    add  hl, de
    ld   a, [hli]
    daa
    ld   a, [hli]
    jr   z, label_29254
    add  hl, hl
    ld   h, $58
    inc  l
    ld   e, c
    jr   z, label_29246
    inc  h
    and  [hl]

label_292C5::
    add  a, h
    ld   d, h
    and  [hl]
    add  a, e
    inc  [hl]
    xor  a
    add  a, e
    ld   b, h
    or   b
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_29255
    ld   h, [hl]
    jr   nz, label_2933E
    inc  h
    jp   nz, label_369
    ld   a, b

label_292DB::
    jr   z, label_292DB
    inc  b
    dec  c
    db   $76 ; Halt
    push af
    ld   [hl], l
    dec  hl
    add  a, d
    db   $76 ; Halt
    dec  c
    ld   a, b
    inc  l
    add  a, d
    nop
    inc  bc
    add  a, d

label_292EC::
    ld   [label_1003], sp
    inc  bc
    add  hl, de
    inc  bc
    ld   [bc], a
    dec  h
    ld   de, label_2025
    dec  h
    rlca
    ld   h, $18
    ld   h, $29
    ld   h, $12
    add  hl, hl
    ld   hl, label_1729
    ld   a, [hli]
    jr   z, label_29330
    add  a, e
    dec  h
    rrca
    add  a, e
    dec  [hl]
    rrca
    add  a, e

label_2930D::
    ld   b, l
    rrca
    ld   [hl], b
    inc  hl
    ld   d, d
    inc  l
    ld   d, e
    ldi  [hl], a
    ld   d, h
    dec  hl
    jp   nz, label_2462
    jp   nz, label_363
    ld   h, h
    inc  hl
    ld   [hl], h
    daa

label_29321::
    ld   [hl], c

label_29322::
    dec  c

label_29323::
    add  a, d
    ldi  [hl], a
    db   $DB

label_29326::
    jp   nz, label_DB32
    inc  sp
    and  b
    jp   label_DC24
    ld   b, e
    call c, label_A715
    ld   [hl], $BE

label_29334::
    pop  hl

label_29335::
    ld   [bc], a

label_29336::
    ld   d, [hl]
    ld   l, b
    ld   b, b
    inc  bc
    rst  0
    ld   b, $C7
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction

label_29342::
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    nop
    inc  bc
    ld   bc, label_825
    ld   h, $09
    inc  bc
    db   $10
    db   $25
    ld   de, label_1329
    xor  h
    ld   d, $AC
    jr   label_29385
    add  hl, de
    ld   h, $31
    xor  h
    jr   c, label_2930D
    inc  sp
    inc  l
    add  a, d
    inc  [hl]
    ldi  [hl], a
    dec  [hl]
    sbc  a, b
    ld   [hl], $2B
    ld   b, e
    inc  h
    ld   b, [hl]
    inc  hl
    ld   d, e
    ld   a, [hli]
    add  a, d
    ld   d, h
    ld   hl, label_2956
    ldd  [hl], a
    rrca
    ld   b, h
    cp   [hl]
    pop  hl
    ld   [bc], a
    ld   d, a
    ld   c, b
    ld   h, b
    cp   $04
    dec  c
    ld   b, $F4
    db   $76 ; Halt

label_29384::
    push af

label_29385::
    dec  b

label_29386::
    add  hl, hl
    add  a, d
    ld   b, $0D
    ld   [$C82A], sp
    nop
    inc  hl
    ret  z
    ld   bc, $C80D
    ld   [bc], a
    inc  h
    ret  z
    inc  bc
    inc  bc
    ret  z
    inc  b
    inc  hl
    inc  b
    dec  h
    ld   [hl], h
    daa
    jr   z, label_29342
    add  a, d
    rla
    rrca
    daa
    rrca
    add  a, d
    scf
    rrca
    cp   $04
    dec  c
    ld   b, $F0
    add  hl, sp
    di
    db   $76 ; Halt
    pop  af
    dec  b
    rst  0
    ld   [$C8C7], sp
    nop
    inc  hl
    ret  z
    ld   bc, $C80D
    ld   [bc], a
    inc  h
    ret  z
    inc  bc
    inc  bc
    ret  z
    inc  b
    inc  hl
    inc  b
    dec  h
    ld   [hl], h
    daa
    ld   sp, label_2814F
    ld   c, a
    daa
    and  b
    cp   $04
    dec  c
    jr   nc, label_293CA
    add  a, [hl]
    inc  de
    call c, label_28C4
    call c, label_2A683
    call c, label_2C23
    add  a, e
    inc  h
    ldi  [hl], a
    daa
    dec  hl
    jp   nz, label_2433
    add  a, e
    inc  [hl]
    rrca
    add  a, e
    ld   b, h
    rrca
    jp   nz, label_2337
    ld   d, e
    ld   a, [hli]
    add  a, e
    ld   d, h
    rst  0
    ld   d, l
    sbc  a, b
    ld   d, a
    add  hl, hl
    ld   h, d
    and  a
    dec  [hl]

label_293FC::
    and  b
    cp   $04
    dec  c
    ld   b, $F4
    ld   [hl], h
    push af
    nop
    inc  hl
    ld   bc, $C30D
    ld   [bc], a
    inc  h
    jp   label_303
    inc  b
    dec  h
    jp   nz, label_2314
    ldd  [hl], a
    ld   a, [hli]
    inc  sp
    ld   hl, label_2934
    ld   h, b
    daa
    ld   [hl], c
    daa
    ld   l, c
    jr   z, label_29498
    jr   z, label_29483
    dec  hl
    ld   l, b
    inc  l

label_29425::
    ld   [hl], b
    inc  bc
    ld   a, c
    inc  bc
    ld   [hl], d
    ret  z
    ld   [hl], a
    ret  z
    jr   z, label_293D0
    add  a, d
    rla
    rrca

label_29432::
    daa

label_29433::
    rrca
    add  a, d
    scf

label_29436::
    rrca
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF39]
    rst  $30
    add  a, e
    nop

label_29440::
    inc  bc
    inc  bc
    dec  h

label_29443::
    ld   b, $26
    add  a, e
    rlca
    inc  bc
    db   $10
    db   $25
    add  a, d
    ld   de, label_1221
    rst  0
    inc  de

label_29450::
    add  hl, hl
    add  a, d
    inc  d
    rrca
    ld   d, $2A
    rla
    rst  0
    jr   label_2947B
    add  hl, de
    ld   h, $86
    ldi  [hl], a
    rrca
    add  a, [hl]

label_29460::
    ldd  [hl], a
    rrca
    add  a, [hl]
    ld   b, d
    rrca
    jp   nz, label_C023
    jp   nz, label_C026
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    ld   e, c
    inc  l
    add  a, d
    ld   d, c
    jr   nz, label_293FC
    ld   d, a

label_2947B::
    jr   nz, label_294DF
    jr   nz, label_294E6
    jr   nz, label_294D4
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    or   l
    ld   l, b

label_29486::
    jr   nz, label_29486
    inc  b
    dec  c
    jr   nc, label_2947E
    add  a, [hl]
    ld   de, $8601
    ld   hl, $86B0
    ld   d, c
    xor  a
    add  a, [hl]
    ld   h, c
    ld   bc, label_1782
    rrca
    add  a, d
    daa
    rrca
    add  a, d
    scf
    rrca
    jr   z, label_29443
    jr   nz, label_294CE
    jp   nz, label_D30
    ld   d, b
    dec  hl
    cp   $07
    dec  c
    inc  bc
    rst  0
    ld   b, $C7
    ld   [hl], h
    db   $ED ; Undefined instruction
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    nop
    inc  bc
    add  hl, bc
    inc  bc
    ld   bc, label_1025
    dec  h
    ld   de, label_829
    ld   h, $19
    ld   h, $18
    ld   a, [hli]
    ldi  [hl], a
    sub  a, [hl]
    inc  hl
    rrca
    inc  h
    sub  a, l
    dec  h

label_294CE::
    sub  a, [hl]
    ld   h, $0F
    daa
    sub  a, l
    add  a, [hl]

label_294D4::
    ldd  [hl], a
    rrca
    ld   b, d
    sub  a, h
    ld   b, e

label_294D9::
    rrca
    ld   b, h
    sub  a, e
    ld   b, l
    sub  a, h
    ld   b, [hl]

label_294DF::
    rrca
    ld   b, a
    sub  a, e
    ld   hl, label_2820

label_294E5::
    jr   nz, label_294E5
    rlca
    dec  c
    add  hl, sp
    rst  $28
    nop
    inc  bc
    add  hl, bc
    inc  bc
    ld   bc, label_1025
    dec  h
    ld   de, label_829
    ld   h, $19
    ld   h, $18
    ld   a, [hli]
    ld   h, b
    daa
    ld   [hl], c
    daa
    ld   l, c
    jr   z, label_2957A
    jr   z, label_29565
    dec  hl
    ld   l, b
    inc  l
    ld   [hl], b
    inc  bc
    ld   a, c
    inc  bc
    add  a, $13
    jp   nc, label_AF14
    add  a, $15
    pop  de
    push bc
    inc  h
    ld   bc, $B064

label_29518::
    jp   nz, label_D232
    jr   nz, label_294E6
    ld   d, b
    ret
    cp   $07
    dec  c
    inc  b
    ret  nc

label_29524::
    inc  b
    db   $EC ; Undefined instruction
    add  hl, sp

label_29527::
    rst  $28
    jr   nc, label_29518
    ld   [hl], h
    db   $ED ; Undefined instruction
    inc  bc
    rst  0
    ld   b, $C7
    ld   [hl], e
    ret  z

label_29532::
    db   $76 ; Halt
    ret  z
    add  a, d

label_29535::
    nop
    inc  bc
    ld   [bc], a
    dec  h
    rlca
    ld   h, $82
    ld   [label_1003], sp
    dec  h
    ld   de, label_1221
    add  hl, hl
    rla
    ld   a, [hli]
    jr   label_29569
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    ldi  [hl], a
    ld   h, d
    dec  hl
    ld   h, a
    inc  l
    ld   l, b
    ldi  [hl], a
    ld   l, c
    jr   z, label_294D9
    ld   [hl], b
    inc  bc
    add  a, d

label_2955A::
    ld   a, b
    inc  bc
    ld   [hl], d
    daa
    ld   [hl], a
    jr   z, label_29597
    set  4, c
    ld   [bc], a
    ld   c, h

label_29565::
    ld   l, b
    ld   b, b
    cp   $07

label_29569::
    dec  c
    jr   nc, label_2955A
    ld   [de], a
    rst  0
    rla
    rst  0
    adc  a, d
    nop
    inc  bc
    adc  a, d

label_29574::
    ld   [hl], b
    inc  bc
    db   $10
    db   $25
    adc  a, b
    ld   de, label_1921
    ld   h, $60
    daa

label_2957F::
    adc  a, b
    ld   h, c
    ldi  [hl], a
    add  a, a
    ldi  [hl], a
    pop  de
    jp   nz, label_D038
    add  a, h
    ld   b, h
    jp   nc, label_3286
    ret  nz
    jp   nz, label_C042
    add  a, h
    ld   d, l
    ret  nz
    ld   l, c
    jr   z, label_295A9

label_29597::
    rst  0
    rla
    rst  0
    ld   h, d
    ret  z
    ld   h, a
    ret  z
    ld   d, h
    set  4, c
    ld   [bc], a
    ld   c, l
    ld   c, b
    ld   d, b
    cp   $07
    dec  c
    inc  b

label_295A9::
    db   $EC ; Undefined instruction
    add  a, d
    nop
    inc  bc
    ld   [bc], a
    dec  h
    inc  bc
    rst  0
    ld   b, $C7
    rlca
    ld   h, $82
    ld   [label_1003], sp
    dec  h
    ld   de, label_1221
    add  hl, hl
    rla
    ld   a, [hli]
    jr   label_295E3
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   h, e
    xor  [hl]
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2963F
    inc  bc
    ld   [hl], c
    daa
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    ld   a, b
    jr   z, label_29652
    inc  bc
    jp   nz, label_CF31
    add  a, a
    ldd  [hl], a
    pop  de
    inc  sp
    rst  8
    dec  [hl]

label_295E3::
    rst  8
    scf
    rst  8
    ld   b, d
    ret  nc
    ld   b, e
    pop  de
    add  a, d
    ld   b, h
    xor  [hl]
    ld   b, [hl]
    ret  nc
    ld   b, a
    pop  de
    jp   nz, label_D048
    add  a, d
    ld   d, c
    jp   nc, label_CF53
    add  a, d
    ld   d, h
    jr   nz, label_2957F
    ld   d, [hl]
    jp   nc, label_2A383
    jp   nc, label_D066
    cp   $07
    dec  c
    ld   [hl], h
    pop  af
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, d
    ld   d, h
    rrca
    add  a, d
    ld   h, h
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_28482
    sub  a, a
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de
    ret  nz
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b

label_2963F::
    xor  h
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    ld   [rJOYP], a
    or   l
    ld   l, b
    ldi  [hl], a
    cp   $FE
    rlca
    dec  c
    inc  b
    ld   a, [$FF74]
    pop  af
    inc  bc

label_29652::
    rst  0
    ld   b, $C7
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    cp   $07
    dec  c
    inc  b
    ld    hl, sp+$39
    rst  $30
    inc  bc
    rst  0
    ld   b, $C7
    ld   de, label_12CF
    pop  de
    inc  de
    ret  nz
    add  a, h
    inc  d
    jp   nc, label_18C3
    rst  8
    add  a, e
    ld   hl, label_22D2
    ret  nc
    inc  h
    ret  nc
    dec  h
    ret  nz
    jp   nz, label_D026
    jp   nz, label_C027
    jp   label_D031
    jp   nz, label_C032
    inc  sp
    rst  8

label_2968B::
    inc  [hl]
    ret  nz
    dec  [hl]
    jp   nc, label_D036
    add  a, d
    ld   b, e
    jp   nc, label_D045
    ld   b, [hl]
    ret  nz
    ld   b, a
    rst  8
    ld   c, b
    pop  de
    ld   d, d
    pop  de
    jp   nz, label_D053
    add  a, d
    ld   d, h
    ret  nz
    ld   d, [hl]
    rst  8
    ld   d, a

label_296A7::
    pop  de
    ld   e, b
    ret  nz
    add  a, d
    ld   h, c

label_296AC::
    ret  nz
    ld   h, e
    ret  nc
    add  a, e
    ld   h, h
    pop  de

label_296B2::
    add  a, d
    ld   h, a
    ret  nz
    ld   sp, label_32D2
    ret  nc
    cp   $07
    dec  c
    jr   nc, label_2968F
    jr   nc, label_296B2
    jr   nz, label_2968B
    ld   d, b
    ret
    ld   de, label_1688
    adc  a, b
    add  a, d
    ld   hl, $8288
    dec  h
    adc  a, b
    add  a, d
    inc  sp
    adc  a, b
    jp   nz, label_8838
    jp   nz, label_8851
    jp   nz, label_8853
    jp   nz, label_8856
    ld   d, h
    adc  a, b
    jr   label_296AC
    ld  [$FF00+C], a
    ld   [bc], a
    xor  e
    adc  a, b
    add  a, b
    cp   $04
    dec  c
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    jp   label_2A401
    add  a, $10
    ld   d, a
    adc  a, c
    ld   sp, $8980
    ld   b, c
    add  a, c
    jp   label_2AC14
    jp   label_2AC15
    adc  a, c
    ld   d, c
    add  a, c
    adc  a, c
    ld   h, c
    add  a, c
    ld   h, h
    ld   d, b
    ld   h, l
    ld   d, [hl]
    ld   [hl], b
    ld   d, h
    adc  a, c
    ld   [hl], c
    ld   d, e

label_29710::
    add  a, d
    ld   [hl], h
    ld   d, h
    add  a, d
    ld   b, h
    ld   l, l
    pop  hl
    inc  bc
    ld   l, l
    jr   label_2973B
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    jp   label_2A508
    adc  a, c
    jr   nc, label_296A7
    adc  a, c
    ld   b, b
    add  a, c
    add  a, a
    ld   d, b
    add  a, c
    add  a, a
    ld   h, b
    add  a, c

label_29730::
    call nz, label_2AC12
    call nz, label_29119
    ld   d, d
    ld   l, l
    ld   d, a
    ld   d, b
    ld   e, b

label_2973B::
    ld   d, e
    jp   label_29459
    ld   h, a

label_29740::
    ld   d, c

label_29741::
    ld   l, b

label_29742::
    ld   d, h
    add  a, a
    ld   [hl], b
    ld   d, e
    add  a, e
    ld   [hl], a
    ld   d, h
    pop  hl
    inc  bc
    ld   l, [hl]
    jr   label_2976E
    cp   $0C

label_29750::
    dec  c

label_29751::
    add  hl, sp
    di
    ld   [hl], h
    pop  af
    ld   [bc], a
    ld   h, $83
    inc  bc
    ret  nz
    ld   b, $25
    ld   [$C226], sp
    add  hl, bc
    inc  bc
    ld   de, $C3C0
    ld   [de], a
    inc  h
    jp   label_2316
    inc  de
    rla
    inc  d
    ld   [de], a
    dec  d

label_2976E::
    ld   d, $23
    ld   de, label_1025
    inc  sp
    dec  d
    dec  [hl]
    inc  d
    rla
    ret  nz
    jr   label_2979F
    ld   b, d
    ld   a, [hli]
    ld   b, e
    rst  0
    ld   b, h
    sbc  a, b
    ld   b, l

label_29782::
    rst  0
    ld   b, [hl]
    add  hl, hl
    add  hl, hl
    ld   h, $28
    ld   a, [hli]
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_297F6
    inc  h
    jp   nz, label_369
    ld   a, b
    jr   z, label_297B9
    and  b
    cp   $0C
    dec  c
    jr   nc, label_29791
    ld   [hl], h
    push af
    jp   nz, label_F31
    add  a, d
    ld   h, h
    rrca
    inc  bc
    rst  0
    dec  b
    rst  0
    ldi  [hl], a
    and  [hl]
    inc  h
    and  [hl]
    ld   b, e
    and  [hl]
    ld   b, l
    and  [hl]
    call nz, label_F17
    cp   $04
    dec  c
    ld   [hl], h
    pop  af
    add  a, h
    inc  de

label_297B9::
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, d
    ld   d, h
    rrca
    add  a, d
    ld   h, h
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca

label_297CD::
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_28482
    sub  a, a
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de
    ret  nz
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    ld   [rJOYP], a
    dec  hl
    ld   c, b

label_297F6::
    ldi  [hl], a
    cp   $0C
    dec  c
    inc  b
    ld   a, [$FF74]
    push af
    ld   [bc], a
    rst  0
    rlca
    rst  0
    jr   nz, label_297CD
    add  a, d
    ld   h, c
    ld   [de], a
    ld   h, e
    inc  l
    add  a, d
    ld   h, h
    ldi  [hl], a
    ld   h, [hl]

label_2980D::
    dec  hl
    ld   [hl], e
    inc  h
    add  a, d
    ld   [hl], h
    inc  bc
    db   $76 ; Halt
    inc  hl
    ld   [hl], b
    inc  hl
    add  a, d
    ld   [hl], c
    dec  c
    add  a, d
    ld   [hl], a
    dec  c
    ld   a, c
    inc  h
    ldi  [hl], a
    adc  a, l
    daa
    adc  a, l
    ld   b, d
    adc  a, l
    ld   b, a
    adc  a, l
    dec  [hl]
    adc  a, l
    cp   $0C
    dec  c
    inc  b
    ld   a, [$FF74]
    pop  af
    adc  a, b
    ld   de, $881B
    ld   hl, $881B
    ld   sp, $881B
    ld   b, c
    dec  de
    adc  a, b
    ld   d, c
    dec  de
    adc  a, b
    ld   h, c
    dec  de
    inc  sp
    inc  l
    add  a, d
    inc  [hl]
    ldi  [hl], a
    ld   [hl], $2B
    ld   b, e
    ld   a, [hli]
    add  a, d
    ld   b, h
    ld   hl, label_2946
    cp   $0C
    ld   c, $74
    push af
    inc  bc
    rst  0
    rlca
    rst  0
    ret  z
    nop
    inc  bc
    ld   bc, $C625
    ld   de, label_2B123
    daa
    add  a, e
    inc  d
    dec  de
    add  a, e
    inc  h
    dec  de
    add  a, e
    inc  [hl]
    dec  de
    call nz, label_1B45
    dec  h
    and  b
    ld   b, l
    xor  c
    ld   [hl], h
    dec  hl
    db   $76 ; Halt
    inc  l
    ldd  [hl], a
    dec  de
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF74]
    push af
    ret  z
    nop
    inc  bc
    ret  z
    ld   bc, $C803
    ld   [bc], a
    inc  bc
    ret  z
    rlca
    inc  bc
    ret  z
    ld   [$C803], sp
    add  hl, bc
    inc  bc
    inc  bc
    dec  h
    ld   b, $26
    inc  de
    inc  hl
    ld   d, $24
    ldi  [hl], a
    dec  h
    inc  hl
    add  hl, hl
    ld   h, $2A
    daa
    ld   h, $C3
    ldd  [hl], a
    inc  hl
    jp   label_2437
    ld   h, d
    daa
    ld   h, e
    dec  hl
    ld   h, [hl]
    inc  l
    ld   h, a
    jr   z, label_29924
    daa
    db   $76 ; Halt
    jr   z, label_29839
    inc  sp
    rrca
    add  a, h
    ld   b, e
    rrca
    add  a, h
    ld   d, e
    rrca
    inc  sp
    xor  h
    ld   [hl], $AC
    ld   d, e
    xor  h
    ld   d, [hl]

label_298C4::
    xor  h
    ld   b, h
    cp   [hl]
    ld  [$FF00+C], a
    inc  bc
    rst  $28
    jr   label_298DC
    cp   $0C
    ld   c, $39
    rst  $30
    db   $76 ; Halt
    push af
    ld   [bc], a
    rst  0
    rlca
    rst  0
    add  a, e
    ld   d, $1B
    jp   nz, label_1B27
    jp   nz, label_1B28
    add  a, e
    ld   b, [hl]
    dec  de
    add  a, h
    ld   d, h
    dec  de
    add  a, a
    ld   h, c
    dec  de
    jp   nz, label_D39
    jp   nz, label_D58
    ld   [hl], l
    dec  hl
    db   $76 ; Halt
    dec  c
    ld   [hl], a
    inc  l
    add  hl, hl
    ld   a, [hli]
    ld   e, c
    inc  l
    ldi  [hl], a
    adc  a, l
    daa
    adc  a, l
    ld   b, d
    adc  a, l
    ld   b, a
    adc  a, l
    dec  [hl]
    adc  a, l
    jr   label_298C4
    ld  [$FF00+C], a
    inc  bc

label_29907::
    rra
    adc  a, b
    db   $10
    db   $FE
    inc  c
    dec  e
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_29907
    ld   e, c
    rst  $30
    db   $10
    db   $C9
    ld   h, b
    ret
    jr   nz, label_29942
    ld   d, b
    dec  hl
    jp   nz, label_D30
    call nz, label_2403
    push bc
    ld   b, $23

label_29924::
    call nz, label_304
    push bc
    dec  b
    inc  bc
    ld   b, e
    ld   a, [hli]
    ld   b, h
    ld   h, $54
    ld   a, [hli]
    ld   d, l
    ld   hl, label_2956
    ld   h, e
    and  a
    add  a, d
    inc  b
    ret  nz
    add  hl, hl
    jp   z, label_1182
    rrca
    add  a, d
    ld   hl, $820F

label_29942::
    ld   sp, label_2890F
    ld   a, [hli]
    ld   e, c
    ld   c, $82
    ld   l, b
    ld   c, $79
    ldi  [hl], a
    ldi  [hl], a
    and  b
    cp   $0C
    adc  a, l
    ld   [bc], a
    rst  0
    rlca
    rst  0
    inc  b
    db   $EC ; Undefined instruction
    ld   [hl], h
    push af
    add  hl, hl
    rst  $30
    ld   d, b
    or   $86
    ld   [hl], c
    dec  c
    jp   label_D19
    ldi  [hl], a
    inc  de
    daa
    inc  de
    ld   b, d
    ld   [de], a
    ld   b, a
    ld   [de], a
    ld   sp, label_3610
    db   $10
    db   $33
    ld   de, label_1138
    ldd  [hl], a
    inc  e
    scf

label_29977::
    inc  e
    ld   c, c
    inc  l
    jp   nz, label_2459
    ld   [hl], a
    inc  l
    ld   a, b
    ldi  [hl], a
    ld   a, c
    jr   z, label_299A4
    ret
    ld   b, b
    add  hl, hl
    add  a, d
    ld   d, b
    ld   c, $82
    ld   h, b
    ld   c, $70
    dec  hl
    ld   e, b
    jr   nz, label_29914
    ld   h, a
    jr   nz, label_29977
    inc  bc
    ld   a, h
    jr   z, label_299AC
    cp   $0C
    ld   a, l
    ld   b, b
    or   $72
    push af
    ld   [bc], a
    rst  0
    rlca
    rst  0

label_299A4::
    ld   c, c
    jp   z, label_15C2
    and  [hl]
    add  a, e
    ld   b, b
    ldi  [hl], a

label_299AC::
    ld   b, e
    dec  hl
    jp   label_2353
    ld   b, l
    and  a
    add  a, e
    ld   b, [hl]
    and  [hl]
    ld   d, b
    rla
    ld   d, c
    and  b
    ld   d, d
    ld   d, $C3
    ld   d, e
    inc  hl
    ld   d, h
    and  a
    ld   d, l
    sbc  a, $56
    and  [hl]
    jp   nz, label_1160
    ld   [hl], c
    dec  c
    jp   nz, label_1062
    add  a, e
    ld   d, $0F
    add  a, e
    ld   h, $0F
    add  a, e
    ld   [hl], $0F
    daa
    cp   [hl]
    ld  [$FF00+C], a
    inc  bc
    ld   a, l
    adc  a, b
    db   $10
    db   $FE
    inc  c
    ld   a, $04
    db   $F4 ; Undefined instruction
    ld   [hl], h
    push af
    call nz, label_300
    adc  a, b
    ld   [hl], c
    dec  c
    ld   bc, label_325
    rst  0
    rlca
    rst  0
    inc  b
    add  hl, hl
    ld   b, $2A
    jp   label_2311
    ld   b, b
    dec  h
    ld   b, c
    add  hl, hl
    dec  b

label_299FC::
    dec  de
    add  a, h
    dec  d
    dec  de
    jp   nz, label_1B27
    jp   nz, label_1B28
    add  a, e
    ld   b, [hl]
    dec  de
    add  a, h
    ld   d, h
    dec  de
    add  a, a
    ld   h, c
    dec  de
    add  a, a
    ld   [hl], c
    dec  de
    jp   nz, label_D58
    jp   nz, label_2058
    cp   $04
    dec  c
    ld   [bc], a
    rst  0
    inc  b
    ld    hl, sp+$07
    rst  0
    add  hl, hl
    rst  $30
    add  a, a
    ld   [de], a
    or   b
    add  a, d
    inc  d

label_29A28::
    dec  c
    add  a, $11
    ld   bc, label_2A286
    xor  a
    jr   c, label_299E0
    jp   nz, label_148
    ld   l, b
    or   b
    add  hl, de
    ld   a, [hli]
    add  hl, hl
    dec  c
    add  hl, sp
    inc  l
    ld   c, c
    inc  h
    ld   e, c
    ld   a, [hli]
    ld   l, c
    dec  c
    ld   a, c
    ldi  [hl], a
    ldi  [hl], a
    and  [hl]
    daa
    and  a
    ld   d, d
    and  [hl]
    ld   d, a
    and  [hl]

label_29A4C::
    add  a, d
    ld   d, h

label_29A4E::
    jr   nz, label_29A4E
    inc  c
    sbc  a, l
    dec  b
    db   $F4 ; Undefined instruction
    jr   nc, label_29A4C
    ld   [hl], l
    push af
    add  a, h
    dec  b
    ld   hl, label_2B188
    dec  c
    ret  z
    add  hl, bc
    inc  h
    nop
    dec  h
    ld   bc, label_221
    ld   h, $C4
    inc  bc
    inc  bc
    push bc
    inc  b
    inc  hl
    db   $10
    db   $29
    jp   nz, label_2412
    add  a, d
    jr   nc, label_29A97
    ldd  [hl], a
    jr   z, label_299FC

label_29A78::
    ld   b, b
    inc  bc

label_29A7A::
    add  a, h
    ld   d, b
    ld   hl, label_2954
    ld   [hl], b
    dec  hl
    inc  b
    dec  h
    add  hl, bc
    ld   h, $29
    jp   z, label_CA59
    ld   d, d
    rst  0
    dec  b
    add  hl, hl
    ld   b, $0D
    rlca
    ld   a, [hli]
    add  a, e
    dec  h
    rrca
    add  a, e
    dec  [hl]
    rrca

label_29A97::
    add  a, e
    ld   b, l
    rrca
    ld   [hl], $A0
    ld   de, $E2BE
    inc  bc
    ld   e, [hl]
    jr   label_29AB6
    dec  d
    jr   nz, label_29A28
    rla

label_29AA7::
    jr   nz, label_29AA7
    inc  c
    dec  l
    ld   [bc], a
    rst  0
    rlca
    rst  0
    jr   nz, label_29A7A
    ld   d, b
    ret
    ld   [hl], c
    push af
    add  hl, de

label_29AB6::
    rst  $30
    inc  d
    and  [hl]
    dec  d
    dec  de
    add  a, e
    ld   d, $0E
    jp   nz, label_1B19
    ld   hl, label_22A6
    sbc  a, $23
    and  a
    add  a, d
    inc  h
    dec  de
    add  a, e
    ld   h, $0E
    inc  sp
    inc  l
    inc  [hl]
    ldi  [hl], a
    dec  [hl]
    dec  hl
    ld   [hl], $A0
    add  a, e
    scf
    ld   c, $C3
    ld   b, e
    inc  h
    call nz, label_344
    call nz, label_2345
    jp   nz, label_1B46
    add  a, e
    ld   b, a
    ld   c, $53
    jp   z, label_C955
    add  a, e
    ld   d, a
    ld   c, $84
    ld   h, [hl]
    ld   c, $73
    jr   z, label_29A78
    db   $76 ; Halt
    ld   c, $79
    dec  c
    ld   de, $E2BE
    inc  bc
    ld   e, a
    adc  a, b
    db   $10
    db   $FE
    inc  c
    sbc  a, l
    rlca
    db   $F4 ; Undefined instruction
    db   $10
    db   $F6
    add  hl, hl
    rst  $30
    ld   [hl], l
    push af
    nop
    add  hl, hl
    ret  z
    rlca
    inc  h
    ld   [$C717], sp
    jr   label_29B25
    add  hl, bc
    ld   [de], a
    add  hl, de
    sub  a, [hl]
    add  a, $29
    db   $10
    db   $10
    dec  de
    add  a, a
    jr   nz, label_29B3B
    call nz, label_E30
    ld   sp, $C20E
    ldd  [hl], a
    dec  de
    call nz, label_1B36
    call nz, label_1B41
    jp   nz, label_E55
    add  a, d
    ld   [hl], l
    ld   c, $27
    jp   z, label_CA57
    add  a, h
    inc  de
    dec  de

label_29B3B::
    add  a, d
    inc  h
    dec  c
    add  a, d
    inc  sp
    dec  de
    dec  [hl]
    dec  c
    add  a, d
    ld   b, h
    dec  de
    dec  h
    ret  nz
    cp   $0C
    dec  e
    ld   [bc], a
    db   $F4 ; Undefined instruction
    db   $10
    db   $F6
    add  hl, hl
    rst  $30
    ld   [hl], e
    push af
    nop
    sub  a, e
    ld   [bc], a
    db   $10
    db   $C2
    inc  bc
    inc  hl
    jp   nz, label_2409
    db   $10
    db   $13
    ld   [de], a
    inc  d
    jr   nz, label_29B88
    ld   hl, label_2298
    ld   hl, label_2923
    add  hl, hl
    ld   a, [hli]
    add  hl, sp
    dec  c
    ld   c, c
    inc  l
    ld   d, b
    ret
    ld   e, c
    jp   z, label_2B73
    add  a, l
    ld   [hl], h
    dec  c
    ld   a, c
    inc  h
    add  a, l
    inc  h
    and  [hl]
    add  a, [hl]
    ld   b, e
    and  [hl]
    dec  h
    xor  a
    dec  [hl]
    ld   bc, $B045
    inc  [hl]
    xor  [hl]

label_29B88::
    ld   [hl], $AE
    add  a, d
    ld   b, c
    xor  a
    add  a, d
    ld   d, c
    ld   bc, $AF53

label_29B92::
    add  a, e
    ld   h, c
    or   b
    cp   $0C
    ld   e, $04
    db   $F4 ; Undefined instruction
    jr   nc, label_29B92
    db   $10
    db   $C9
    ld   d, b
    ret
    jr   nz, label_29BCB
    adc  a, b
    ld   bc, $861B
    ld   de, $841B
    inc  hl
    dec  de
    add  a, e
    inc  sp
    dec  de
    add  a, e
    ld   b, e
    dec  de
    add  a, d
    ld   d, d
    dec  de
    add  a, e
    ld   h, c
    dec  de
    scf
    and  b
    ld   b, a
    and  a
    ld   b, [hl]
    xor  c
    jr   z, label_29BCD
    ld   d, a
    ld   c, $82
    ld   h, l
    ld   c, $C2
    jr   nc, label_29BD4
    call nz, label_D21
    call nz, label_D12

label_29BCD::
    ld   b, b
    dec  hl
    jp   nz, label_2051
    cp   $0C

label_29BD4::
    sbc  a, [hl]
    inc  b
    db   $F4 ; Undefined instruction
    add  hl, de
    rst  $30
    ld   [hl], e
    push af
    jp   label_2300
    adc  a, b
    ld   bc, $C20D
    add  hl, bc
    inc  h
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    jr   nc, label_29C12
    add  a, h
    ld   sp, label_3522
    dec  hl
    jp   label_2345
    db   $10
    db   $C9
    ldd  [hl], a
    ret  z
    ld   b, b
    rla
    add  a, d
    ld   b, c
    ld   [de], a
    jp   label_1150
    call nz, label_1044
    add  a, e
    ld   d, c
    rrca
    add  a, e
    ld   h, c
    rrca
    add  a, e
    ld   [hl], c
    rrca
    ld   [hl], l
    daa
    add  a, h
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], a
    ret  z

label_29C12::
    jp   nz, label_2409
    adc  a, b
    ld   de, $861B
    ld   hl, $821B
    daa
    ld   c, $29
    ld   a, [hli]
    call nz, label_1B36
    add  a, e
    scf
    ld   c, $83
    ld   b, a
    ld   c, $83
    ld   d, a
    ld   c, $83
    ld   h, a
    dec  de
    add  a, d
    ld   de, $820D
    ld   hl, label_2830D
    dec  c
    ld   h, d
    cp   [hl]
    ld  [$FF00+C], a
    inc  bc
    ld   e, $18
    db   $10
    db   $C2
    ld   de, $FE20
    inc  c
    sbc  a, [hl]
    ld   bc, label_10F0
    or   $59
    rst  $30

label_29C4A::
    ld   [hl], l
    push af
    nop
    dec  h
    inc  bc
    ld   h, $C2
    inc  b
    inc  bc
    jp   nz, label_2305
    add  hl, bc
    dec  c
    db   $10
    db   $23
    add  a, d
    ld   de, label_130D
    inc  h
    jr   nz, label_29C8A
    inc  hl
    ld   a, [hli]
    inc  h
    ld   hl, label_2925
    ld   h, $1B
    add  a, h
    inc  [hl]
    dec  de
    add  a, [hl]
    ld   b, h
    dec  de
    ld   d, l
    inc  l
    add  a, h
    ld   d, [hl]
    ldi  [hl], a
    ld   d, a
    ret  z
    add  a, l
    ld   h, b
    dec  de
    ld   h, l
    inc  h
    ld   h, [hl]
    rla
    add  a, e
    ld   h, a
    ld   [de], a
    add  a, l
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], l
    jr   z, label_29CFC
    ld   de, label_2B783
    dec  c

label_29C8A::
    ld   d, h
    dec  de
    inc  [hl]
    ld   c, $12
    xor  d
    cp   $0C
    sbc  a, l
    dec  b
    db   $F4 ; Undefined instruction
    db   $10
    db   $F6
    ld   [hl], h
    push af
    add  a, d
    dec  b

label_29C9B::
    ld   c, $C5
    rlca
    inc  h
    add  a, $08
    ld   de, label_9C8
    db   $10
    db   $83
    db   $10
    db   $0E
    ld   d, $0E
    add  a, a
    jr   nz, label_29CBB
    add  a, l
    jr   nc, label_29CBE
    add  a, d
    dec  [hl]
    dec  de
    add  a, a
    ld   b, b
    dec  de
    ld   b, d
    ld   c, $27
    jp   z, label_29087
    ldi  [hl], a
    ld   d, d

label_29CBE::
    ret  z
    ld   d, a
    jr   z, label_29C4A
    ld   h, b
    ld   [de], a
    ld   l, b
    sub  a, e
    adc  a, c
    ld   [hl], b
    dec  c
    cp   $0C
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    db   $76 ; Halt
    db   $ED ; Undefined instruction
    jr   nz, label_29C9B
    ld   d, b
    ret
    add  hl, hl
    jp   z, label_CA59
    inc  bc
    add  hl, hl
    inc  b
    dec  c
    dec  b
    ld   a, [hli]
    add  hl, bc
    inc  h
    add  a, l
    ld   de, $C20E
    jr   label_29D01
    jp   label_F21
    add  a, l
    ldi  [hl], a
    ld   c, $32
    and  b
    add  a, h
    inc  sp
    ld   c, $82
    scf
    dec  de
    ld   b, d
    rrca
    add  a, h
    ld   b, e
    ld   c, $82
    ld   b, a
    dec  de

label_29CFC::
    add  a, l
    ld   d, c
    ld   c, $83
    ld   d, [hl]

label_29D01::
    dec  de
    add  a, h
    ld   h, c
    ld   c, $84
    ld   h, l
    dec  de
    add  hl, bc
    ld   h, $82
    inc  d
    dec  c
    add  a, h
    dec  b
    dec  c
    add  hl, bc
    inc  h
    ld   hl, $FE20
    inc  c
    dec  l
    inc  bc
    db   $F4 ; Undefined instruction
    db   $10
    db   $F7
    jp   label_1100
    add  a, e
    ld   bc, $830F
    ld   de, $830F
    ld   hl, $C30F
    inc  b
    db   $10
    db   $85
    dec  b
    ld   [de], a
    jr   nc, label_29D44
    add  a, e
    ld   sp, label_3413
    inc  d
    add  a, l
    dec  d
    inc  de
    ld   b, b
    dec  h
    add  a, h
    ld   b, c
    ld   hl, label_2945
    dec  h
    dec  h
    add  a, h
    ld   h, $21
    dec  [hl]

label_29D44::
    inc  hl
    daa
    rst  0
    ld   b, d
    rst  0
    add  a, h
    ld   [hl], $1B
    add  a, l
    ld   d, c
    dec  de
    add  a, h
    ld   b, [hl]
    dec  de
    add  a, h
    ld   d, [hl]
    dec  de
    adc  a, c
    ld   h, c
    dec  de
    ld   [de], a
    and  b
    ld   c, b
    and  [hl]
    add  a, d
    ld   b, [hl]
    ld   c, $86
    ld   d, d
    ld   c, $83
    ld   h, e
    ld   c, $C2
    ld   d, c

label_29D67::
    jr   nz, label_29D67
    inc  c
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_29D65
    ld   [hl], h
    push af
    adc  a, d
    nop
    dec  c
    add  a, [hl]
    nop
    ld   [de], a
    ld   b, $93
    add  a, e
    rlca
    dec  c
    adc  a, d
    db   $10
    db   $13
    dec  d
    dec  c
    adc  a, c
    jr   nz, label_29DA5
    ldi  [hl], a
    rst  0
    daa
    rst  0
    dec  h
    sbc  a, b
    add  hl, hl
    ld   h, $89
    jr   nc, label_29DAA
    dec  [hl]
    dec  de
    call nz, label_2439
    adc  a, c
    ld   b, b
    dec  de
    adc  a, c
    ld   d, b
    dec  de
    adc  a, c
    ld   h, b
    dec  de
    ld   b, c
    and  [hl]
    ld   b, h
    and  [hl]
    ld   b, a
    and  [hl]
    adc  a, c
    ld   [hl], b

label_29DA5::
    ldi  [hl], a
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h

label_29DAA::
    dec  de
    db   $76 ; Halt
    inc  l
    ld   a, c
    jr   z, label_29DF9
    di
    cp   $0C
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    ld   b, b
    ld   a, [$FF00+C]
    rst  $28
    ld   [hl], h
    pop  af
    adc  a, d
    nop
    dec  c
    add  hl, bc
    sub  a, h
    adc  a, d
    db   $10
    db   $13
    jr   nz, label_29DEB
    adc  a, b
    ld   hl, label_2921
    ld   h, $22
    rst  0
    daa
    rst  0
    add  a, h
    ld   sp, $831B
    dec  [hl]
    rrca
    add  a, l
    ld   b, c
    dec  de
    add  a, [hl]
    ld   d, c
    dec  de
    adc  a, b
    ld   h, c
    dec  de
    jp   nz, label_F47
    ld   d, l
    rrca
    ld   b, e
    and  [hl]
    ld   b, [hl]
    and  b
    cp   $0C
    dec  c
    dec  b

label_29DEB::
    rst  0
    ld   b, $EC
    ld   [label_289C7], sp
    jp   z, label_EE50
    add  a, d
    nop
    ld   [de], a
    ld   [bc], a
    ld   d, $03
    dec  h
    db   $10
    db   $13
    ld   [de], a
    inc  d
    inc  de
    inc  hl
    jp   label_F14
    jp   label_C015
    add  a, e
    ld   d, $1B
    jr   nz, label_29E31
    ld   hl, label_2298
    ld   hl, label_2923
    inc  h
    and  b
    add  a, e
    ld   h, $1B
    inc  sp
    ld   c, $83
    ld   [hl], $0E
    add  a, h
    ld   b, c
    ret  nz
    add  a, e
    ld   b, l
    ld   c, $C2
    ld   c, b
    dec  de
    ld   d, d
    dec  de
    add  a, l
    ld   d, e
    ld   c, $87
    ld   h, d
    dec  de
    ld   h, h
    ld   c, $84
    ld   sp, $FE0F
    inc  c
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    ld   [bc], a
    rst  0
    rlca
    rst  0
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  de
    ld   b, $2A
    adc  a, b
    ld   de, $821B
    inc  d
    dec  de
    adc  a, b
    ld   hl, $881B
    ld   sp, $881B
    ld   b, c
    dec  de
    adc  a, b
    ld   d, c
    dec  de
    adc  a, b
    ld   h, c
    dec  de
    jp   nz, label_C023
    jp   nz, label_C026
    add  a, h
    ld   b, e
    dec  c
    add  a, [hl]
    ld   d, d
    dec  c
    add  a, [hl]
    ld   h, d
    dec  c
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    dec  hl
    ld   c, b
    ldi  [hl], a
    cp   $0C
    dec  c
    inc  b
    ld   a, [$FF03]
    rst  0
    ld   b, $C7
    adc  a, b
    ld   de, $881B
    ld   hl, $881B
    ld   sp, $881B
    ld   b, c
    dec  de
    adc  a, b
    ld   d, c
    dec  de
    adc  a, b
    ld   h, c
    dec  de
    add  a, h
    inc  hl
    ld   c, $C2
    inc  sp
    ret  nz
    add  a, d
    inc  [hl]
    db   $C2
    jp   nz, label_C036
    jp   label_DD37
    jp   nz, label_E38
    jp   label_E42
    add  a, l
    ld   d, e
    db   $84
    add  a, h
    ld   h, h
    ld   c, $45
    dec  c
    ld   b, h
    and  b
    cp   $05
    sub  a, h
    add  a, e
    ld   [bc], a
    ld   l, e
    inc  bc
    ld   l, c
    add  a, e
    ld   [de], a
    ld   l, c
    inc  de
    add  a, d
    add  a, e
    ld   b, $6B
    rlca
    ld   l, c
    add  a, e
    ld   d, $69
    rla
    add  a, d
    jp   label_2AC00
    adc  a, d
    jr   nc, label_29F31
    add  a, d
    inc  sp
    inc  b
    scf
    ld   h, d
    ld   b, a
    ld   h, e
    call nz, label_29740
    add  a, a
    ld   d, c
    add  a, b
    add  a, a
    ld   h, c
    add  a, c
    add  a, a
    ld   [hl], c
    ld   d, e
    jp   nz, label_2A757
    jp   label_29148
    jp   label_29449
    add  a, d
    ld   a, b
    ld   d, h
    cp   $05
    sub  a, h
    add  a, e
    inc  bc
    ld   l, e
    inc  b
    ld   l, c
    add  a, e
    inc  de
    ld   l, c
    inc  d
    add  a, d
    jp   label_2A508
    jp   label_2AC09
    jr   nc, label_29F65
    ld   sp, $C264
    ld   b, c
    ld   h, l
    add  a, e
    scf
    ld   l, l
    jp   label_29740
    add  a, e
    ld   h, c
    ld   e, e
    add  a, h
    ld   h, h
    ld   c, h
    jp   label_29148
    jp   label_29449
    adc  a, d
    ld   [hl], b
    ld   d, h
    pop  hl
    inc  bc
    ld   l, d
    ld   a, b

label_29F16::
    jr   nc, label_29F16
    inc  c
    dec  c
    cp   $0C
    dec  c
    add  hl, sp
    di
    add  a, [hl]
    ldi  [hl], a
    rrca
    add  a, [hl]
    ldd  [hl], a
    rrca
    add  a, [hl]
    ld   b, d
    rrca
    inc  sp
    dec  c
    ld   [hl], $0D
    ld   d, e
    rrca
    ld   d, [hl]
    rrca
    ld   de, label_18A6

label_29F33::
    and  [hl]
    ld   h, c
    and  [hl]
    ld   l, b
    and  [hl]
    cp   $0C
    dec  c
    jr   nc, label_29F33
    add  a, h
    inc  hl
    db   $86
    add  a, [hl]
    ldd  [hl], a
    db   $86
    add  a, [hl]
    ld   b, d
    db   $84
    add  a, h
    ld   d, e
    db   $33
    inc  sp
    and  a
    ld   [hl], $A7
    ld   b, h
    and  [hl]
    ld   b, l
    and  [hl]
    ld   c, b
    db   $66
    ld   h, [hl]
    db   $68
    ld   l, b
    cp   [hl]
    ld  [$FF00+C], a
    inc  b
    xor  b
    jr   label_29F6F
    cp   $0C
    dec  c
    ld   [hl], h
    pop  af
    add  a, h
    inc  de
    rrca
    add  a, h

label_29F65::
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    add  a, d
    ld   d, h
    rrca
    add  a, d
    ld   h, h

label_29F6F::
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_28482
    sub  a, a
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de
    ret  nz
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0
    ld   [rJOYP], a
    reti
    ld   e, b
    ld   b, b
    cp   $0C
    dec  c
    ld   e, c
    di
    ret  z
    nop
    inc  bc
    ret  z
    ld   bc, $8303
    rlca
    inc  bc
    add  a, e
    rla
    inc  bc
    add  a, e
    daa
    inc  bc
    add  a, e
    scf
    inc  bc
    ld   [bc], a
    dec  h
    add  a, e
    inc  bc
    ld   hl, label_2606
    add  a, $12
    inc  hl
    jp   label_2416
    ld   b, [hl]
    ld   a, [hli]
    add  a, d
    ld   b, a
    ld   hl, label_2649
    ld   [hl], d
    daa
    add  a, e
    inc  de
    rrca
    add  a, e
    inc  hl
    rrca
    add  a, e
    inc  sp
    rrca
    inc  h
    and  b
    jp   nz, label_2056
    cp   $0C
    dec  c
    ld   d, b
    ld   a, [$FF00+C]
    pop  af
    add  a, [hl]
    ldi  [hl], a
    rrca
    add  a, [hl]
    ldd  [hl], a
    rrca
    add  a, [hl]
    ld   b, d
    rrca
    inc  sp
    dec  c
    ld   [hl], $0D
    ld   d, e
    rrca
    ld   d, [hl]
    rrca
    ld   de, label_18A6
    and  [hl]
    ld   l, b
    and  [hl]
    cp   $0C
    dec  c
    inc  b
    ld   a, [$FF74]
    pop  af
    add  a, [hl]
    ldi  [hl], a

label_29FF7::
    rrca
    add  a, [hl]
    ld   d, d
    rrca
    jp   nz, label_F32
    jp   nz, label_F37
    cp   $0C
    dec  c
    add  a, e
    ld   de, $830F
    ld   hl, $830F
    ld   sp, label_220F
    and  b
    inc  b
    ld   h, $05
    dec  h
    jp   nz, label_2414
    jp   nz, label_2315
    inc  [hl]
    ld   a, [hli]
    dec  [hl]
    add  hl, hl
    add  a, e
    ld   h, $AF
    add  a, e
    ld   [hl], $01
    ld   b, c
    xor  a
    ld   b, e
    xor  a
    add  a, l
    ld   b, h

label_2A029::
    ld   bc, label_291C2
    ld   bc, label_29386
    or   b
    add  a, d
    ld   d, a
    ld   bc, $9F67
    ld   l, b
    or   b
    jr   label_29FF7
    ld  [$FF00+C], a
    inc  b
    and  d
    jr   label_2A04E
    cp   $0C

label_2A040::
    dec  c
    inc  b
    ld   a, [$FF39]
    rst  $30
    ld   [hl], c
    push af

label_2A047::
    add  hl, hl

label_2A048::
    ld   a, [hli]

label_2A049::
    add  hl, sp
    dec  c
    ld   c, c
    inc  l
    ld   [hl], c

label_2A04E::
    dec  hl
    ld   [hl], d
    dec  c
    ld   [hl], e
    inc  l
    add  a, d
    ld   de, $82A6
    ldi  [hl], a
    and  [hl]
    inc  sp
    and  a
    add  a, d
    ld   b, h
    and  [hl]
    ld   d, l
    and  a
    add  a, d
    ld   h, [hl]
    and  [hl]
    jr   label_2A085
    ld   hl, label_3420
    jr   nz, label_2A0C0

label_2A06A::
    jr   nz, label_2A0CD
    jr   nz, label_2A0D6

label_2A06E::
    jr   nz, label_2A06E
    inc  c
    dec  a
    jr   nz, label_2A06A
    ld   [hl], a
    push af
    add  a, d
    ld   [hl], a
    dec  c
    jr   nc, label_2A088
    ld   [hl], h
    dec  c
    jr   nz, label_2A0A8
    jr   nc, label_2A08E
    ld   b, b
    dec  hl
    ld   de, $84A6
    inc  de
    or   b

label_2A088::
    add  a, d
    rla
    rrca
    add  a, h
    inc  hl
    and  [hl]

label_2A08E::
    daa
    rrca
    scf
    xor  a
    push bc
    ld   [hl], $A6
    jr   c, label_2A098
    add  a, d

label_2A098::
    ld   b, a
    ld   bc, label_29782
    ld   bc, label_2A782
    or   b
    jr   z, label_2A040
    add  a, d
    ld   [hl], h
    dec  c
    jr   label_2A047
    add  a, e

label_2A0A8::
    ld   h, d

label_2A0A9::
    jr   nz, label_2A0A9
    inc  b

label_2A0AC::
    dec  c
    ld   e, c
    di
    add  a, d
    inc  h
    ret  nz
    add  a, d
    ld   d, h
    ret  nz
    ld   b, c
    xor  h
    ld   c, b
    xor  h
    ld   de, $E2BE
    inc  b
    and  [hl]
    jr   label_2A0D3

label_2A0C0::
    add  a, d
    rla
    jr   nz, label_2A0EC

label_2A0C4::
    jr   nz, label_2A048
    ld   h, c

label_2A0C7::
    jr   nz, label_2A0C7
    inc  b
    dec  c
    ld   d, b
    ld   a, [$FF00+C]
    di
    call nz, label_300
    call nz, label_301
    call nz, label_309
    ld   [bc], a
    dec  h
    ld   [label_28026], sp
    dec  h
    ld   b, c
    ld   hl, label_2942
    jp   label_2312
    jp   label_2418
    ld   c, b
    ld   a, [hli]
    ld   c, c
    ld   h, $FE
    inc  c
    dec  l
    add  hl, sp
    rst  $30
    inc  b
    ld    hl, sp+$50
    or   $82
    inc  d
    rrca
    jr   nz, label_2A121
    add  a, a
    ld   hl, label_2822
    dec  hl
    add  hl, hl
    and  [hl]

label_2A101::
    jr   c, label_2A12A
    add  hl, sp
    ldi  [hl], a
    ld   b, b
    dec  h
    add  a, l
    ld   b, c
    ld   hl, label_2646
    ld   d, [hl]
    ld   a, [hli]
    add  a, e
    ld   d, a
    ld   hl, label_3088
    inc  bc
    add  a, e
    ld   b, a
    inc  bc
    cp   $0C
    ld   c, l
    jr   nc, label_2A112
    jr   nz, label_2A0C4
    jr   nc, label_2A142
    ld   sp, label_2802B
    inc  bc
    ld   b, c
    inc  hl
    ld   d, b
    ld   hl, label_2951

label_2A12A::
    add  a, h
    ld   [de], a
    ld   bc, label_2284
    ld   bc, label_3284
    ld   bc, label_28284
    ld   bc, label_29284
    or   b
    jp   nz, label_A627
    add  a, d
    ld   b, [hl]
    and  [hl]
    ld   c, b
    sbc  a, $56

label_2A142::
    and  [hl]
    ld   d, a
    cp   [hl]
    ld  [$FF00+C], a
    inc  b
    and  h
    jr   label_2A15A
    ld   h, a
    and  a
    cp   $0C
    dec  c
    ld   bc, label_2B1F4
    push af
    ld   bc, label_229
    dec  c
    inc  bc
    ld   a, [hli]
    ld   [hl], c

label_2A15A::
    dec  hl
    ld   [hl], d
    dec  de
    ld   [hl], e
    inc  l
    dec  b
    rst  0
    ld   [hl], l
    ret  z
    ld   b, b
    ret
    ld   c, c
    jp   z, label_1188
    dec  de
    adc  a, b
    ld   hl, $881B
    ld   sp, $881B
    ld   b, c
    dec  de
    adc  a, b
    ld   d, c
    dec  de
    adc  a, b
    ld   h, c
    dec  de
    add  a, e
    inc  [hl]
    ld   c, $83
    ld   b, h
    ld   c, $83
    ld   d, h
    ld   c, $E2
    inc  b

label_2A184::
    and  e

label_2A185::
    ld   c, b
    db   $10
    db   $FE
    inc  c
    dec  e
    rlca
    db   $F4 ; Undefined instruction
    add  hl, de
    rst  $30
    ld   [hl], e
    push af
    push bc
    ld   b, $A6
    add  a, d
    rlca
    rrca
    add  a, d
    rla
    rrca
    add  a, d

label_2A19A::
    daa
    rrca
    add  hl, bc
    ld   a, [hli]
    add  hl, de
    dec  c
    add  hl, hl
    and  [hl]
    rla
    and  b
    add  hl, hl
    and  [hl]
    jr   c, label_2A1D4
    ld   c, b
    ld   a, [hli]
    add  hl, sp

label_2A1AB::
    ldi  [hl], a

label_2A1AC::
    ld   c, c
    ld   hl, label_D59
    scf
    xor  a
    ld   b, a
    ld   bc, $B057
    add  a, d
    ld   d, d
    and  [hl]
    ld   h, e
    xor  a
    add  a, d
    ld   h, h
    xor  [hl]
    ld   h, [hl]
    xor  a
    ld   l, b
    and  [hl]
    ld   l, c
    inc  l
    jp   nz, label_DF21
    dec  [hl]
    rst  $18
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c
    db   $76 ; Halt
    inc  l
    jp   nz, label_2013
    cp   $0C
    dec  c
    ld   b, b
    or   $00
    ld   hl, label_D10
    jr   nz, label_2A184
    jr   nc, label_2A20B
    ld   b, b
    add  hl, hl
    ld   d, b
    dec  c
    ld   h, b
    dec  hl
    add  a, h
    ld   [de], a
    ld   bc, label_2284
    or   b
    add  a, d
    rla
    and  [hl]
    add  a, d
    daa
    rrca
    add  a, d
    scf
    rrca
    add  a, d
    ld   b, a
    rrca
    jr   c, label_2A19A
    add  a, [hl]
    ld   sp, label_286A6
    and  [hl]
    add  a, e
    ld   d, [hl]

label_2A201::
    and  [hl]
    ld   b, h
    rst  $18
    ld   h, c
    rst  $18
    ld   h, a
    rst  $18
    cp   $0C
    dec  c

label_2A20B::
    ld   bc, label_39F4
    rst  $30

label_2A20F::
    ldi  [hl], a
    ld   c, a
    daa
    ld   c, a
    ld   d, d
    ld   c, a
    ld   d, a
    ld   c, a
    inc  [hl]
    ld   c, a
    ld   b, l
    ld   c, a
    ld   bc, label_229
    dec  de
    inc  bc
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    ld   e, c
    inc  l
    add  a, d
    ld   [de], a
    dec  de

label_2A22B::
    call nz, label_1B23
    cp   $0C
    sub  a, e
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_2A22B
    ld   c, c
    di
    ld   [hl], e
    push af
    ret  z
    inc  b
    dec  c
    add  a, $05
    dec  c
    add  a, h
    jr   nc, label_2A24F
    adc  a, c
    ld   b, b
    dec  c
    add  a, h
    ld   d, l
    dec  c
    jp   label_D53
    add  a, e
    jr   nz, label_2A26F
    inc  hl

label_2A24F::
    add  hl, hl
    jp   nz, label_2303
    jp   label_2406
    ld   [hl], $2A
    add  a, e
    scf
    ld   hl, label_29082
    ldi  [hl], a
    ld   d, d
    dec  hl
    jp   nz, label_2362
    ld   h, l
    inc  l
    ld   [hl], l
    inc  h
    add  a, e
    ld   h, [hl]
    ldi  [hl], a
    ld   l, c
    jr   z, label_2A2A6
    ld   h, $83

label_2A26F::
    inc  sp
    rrca
    add  a, e
    ld   b, e
    rrca
    add  a, e
    ld   d, e
    rrca
    inc  sp
    and  [hl]
    dec  [hl]
    and  [hl]
    ld   d, e
    and  [hl]
    ld   d, l
    and  [hl]
    ld   b, h
    and  a
    dec  h
    xor  d
    cp   $0C
    dec  c

label_2A286::
    ld   b, b

label_2A287::
    ld   a, [$FF00+C]
    ldi  [hl], a
    rrca
    add  a, [hl]
    ldd  [hl], a
    rrca
    add  a, [hl]
    ld   b, d
    rrca
    inc  sp
    dec  c
    ld   [hl], $0D
    ld   d, e
    rrca
    ld   d, [hl]
    rrca
    ld   de, label_18A6
    and  [hl]
    cp   $0C
    dec  c
    add  hl, de
    di
    ld   e, c
    rst  $30
    add  a, [hl]
    ldi  [hl], a

label_2A2A6::
    rrca
    add  a, [hl]
    ldd  [hl], a
    rrca
    add  a, [hl]
    ld   b, d
    rrca
    inc  sp
    dec  c
    ld   [hl], $0D
    ld   d, e
    rrca
    ld   d, [hl]
    rrca
    ld   e, c
    ld   a, [hli]
    ld   l, c
    dec  c
    ld   a, c
    ldi  [hl], a
    cp   $0C
    dec  c
    db   $10
    db   $F2
    ld   [hl], d
    push af
    add  a, e

label_2A2C3::
    ld   d, $0F
    add  a, e
    ld   h, $0F
    add  a, e
    ld   [hl], $0F
    add  a, a
    ldd  [hl], a
    and  [hl]
    jr   nc, label_2A2F7
    ld   sp, $822B
    inc  [hl]
    dec  c
    ld   b, b
    inc  bc
    ld   b, c
    inc  hl
    ld   b, h
    and  a
    ld   b, l
    and  [hl]
    ld   d, b
    ld   hl, label_2951
    ld   h, b
    dec  c
    ld   h, c
    sbc  a, $70
    ldi  [hl], a
    db   $76 ; Halt
    dec  hl
    add  a, d
    ld   [hl], a

label_2A2EB::
    dec  c
    ld   a, c
    inc  h
    rla
    cp   [hl]
    ld  [$FF00+C], a
    inc  b
    and  l
    adc  a, b
    db   $10
    db   $82
    inc  [hl]

label_2A2F7::
    jr   nz, label_2A2F7
    inc  c
    dec  c
    ld   c, c
    di
    ld   [hl], h
    pop  af
    add  a, [hl]
    ldi  [hl], a

label_2A301::
    rrca
    add  a, [hl]
    ldd  [hl], a
    rrca
    add  a, [hl]
    ld   b, d
    rrca

label_2A308::
    inc  sp
    dec  c
    ld   [hl], $0D
    ld   d, e
    rrca
    ld   d, [hl]
    rrca
    ld   de, $FEA6
    inc  c
    dec  c
    inc  bc
    db   $F4 ; Undefined instruction
    ld   b, b
    or   $84
    ld   b, $03
    add  a, h
    ld   d, $03
    add  a, h
    ld   h, $03
    add  a, d
    inc  bc
    dec  c
    ld   [bc], a
    add  hl, hl
    jp   label_2405
    dec  [hl]
    ld   a, [hli]
    add  a, e
    ld   [hl], $21
    add  hl, sp
    ld   h, $60
    daa
    adc  a, b
    ld   h, c
    ldi  [hl], a
    ld   l, c
    jr   z, label_2A2C3
    ld   [hl], b
    inc  bc
    inc  d
    rst  $18
    ld   d, d
    rst  $18
    add  a, d
    ld   b, a
    rrca
    add  a, d
    ld   d, a
    rrca
    add  a, e
    ld   de, $830F
    ld   hl, $830F
    ld   sp, label_220F
    and  b
    ld   c, b

label_2A351::
    cp   [hl]
    ld  [$FF00+C], a
    inc  b
    and  a
    adc  a, b
    db   $10
    db   $15

label_2A358::
    ld   a, [hli]
    ld   d, $21
    rla
    ld   h, $27
    inc  h
    scf
    ld   a, [hli]
    jr   c, label_2A384
    add  hl, sp
    ld   h, $82
    dec  h
    jr   nz, label_2A2EB
    dec  [hl]

label_2A36A::
    jr   nz, label_2A36A
    inc  c
    dec  c
    ld   e, c
    rst  $30
    add  a, e
    ld   [de], a
    rrca
    add  a, e
    ldi  [hl], a
    rrca
    add  a, e
    ldd  [hl], a
    rrca
    add  a, h
    dec  d
    ld   bc, label_2584
    ld   bc, label_3584
    ld   bc, label_28584

label_2A384::
    or   b
    add  hl, de
    ld   a, [hli]
    add  hl, hl
    dec  c
    add  hl, sp
    inc  l

label_2A38B::
    inc  hl
    and  b
    add  a, $11

label_2A38F::
    jr   nz, label_2A38F
    inc  c
    dec  c
    add  hl, hl

label_2A394::
    rst  $30
    ld   d, b
    ld   a, [$FF00+C]
    ld   h, $82
    ld   [label_1003], sp
    add  hl, hl
    add  a, $13
    and  [hl]
    add  a, $15
    and  [hl]
    rla
    inc  h
    jr   label_2A368
    add  hl, de
    inc  bc
    jr   nz, label_2A3B9
    daa
    ld   a, [hli]
    add  a, d
    jr   z, label_2A3D2
    jr   nc, label_2A3DE
    ld   sp, label_33AE
    xor  a
    dec  [hl]
    xor  a

label_2A3B9::
    scf
    xor  a
    add  hl, sp
    and  [hl]
    ld   b, c
    and  [hl]
    ld   b, e
    or   b
    ld   b, l
    or   b
    ld   b, a
    or   b
    ld   c, c
    dec  c
    ld   d, a
    inc  l
    add  a, d
    ld   e, b
    ldi  [hl], a
    ld   h, a
    inc  h
    ld   l, b
    ret  nz
    ld   l, c
    inc  bc

label_2A3D2::
    ld   [hl], a
    jr   z, label_2A357
    ld   a, b

label_2A3D6::
    inc  bc
    cp   $0C
    dec  c
    ld   [bc], a
    ld   a, [$FF74]
    push af

label_2A3DE::
    jr   nc, label_2A3D6
    ld   b, $29
    add  a, d
    rlca
    dec  c
    add  hl, bc
    inc  h
    jr   nz, label_2A412
    jp   nz, label_D30
    jr   nc, label_2A394
    ld   d, b
    dec  hl
    push bc
    ld   d, $A6
    add  a, d
    rla
    xor  a
    add  a, d
    daa
    ld   bc, label_3782
    ld   bc, label_28782
    ld   bc, label_29782

label_2A401::
    or   b
    jr   label_2A3A2
    dec  d
    ret  nz
    ld   d, c
    jr   nz, label_2A38B
    ld   h, c
    jr   nz, label_2A433
    or   b
    scf
    jr   nz, label_2A457
    xor  a
    cp   $0C
    dec  a
    inc  b
    ld   a, [$FF74]
    push af
    ld   hl, label_28DD
    db   $82
    add  a, d
    ld   b, h
    db   $82
    add  a, d
    ld   d, h
    db   $51
    ld   d, c
    db   $58
    ld   e, b
    db   $82
    add  a, d
    ld   h, c
    db   $82
    add  a, d
    ld   h, a
    db   $32
    ldd  [hl], a
    and  [hl]
    scf
    and  [hl]
    add  a, d
    ld   [hl], c
    and  [hl]

label_2A433::
    add  a, d
    ld   [hl], a
    and  [hl]
    jp   label_1B55
    rst  0
    ld   d, $1B
    add  a, d
    ld   [hl], e
    dec  c
    jp   nz, label_D16
    cp   $0C
    dec  c
    add  hl, sp
    rst  $30
    ldi  [hl], a
    and  [hl]
    daa
    and  [hl]
    ld   d, d
    and  [hl]
    ld   d, a
    and  [hl]
    inc  hl
    jr   nz, label_2A488
    jr   nz, label_2A497
    jr   nz, label_2A4AC
    jr   nz, label_2A48C
    and  [hl]
    ld   b, l
    and  [hl]
    cp   $0C
    dec  l
    inc  b
    ld   a, [$FF30]
    ld   a, [$FF00+C]
    rst  $30
    jp   nz, label_D39
    add  hl, de
    and  [hl]
    ldi  [hl], a
    and  [hl]
    dec  [hl]
    and  [hl]
    ld   b, [hl]
    and  [hl]
    ld   d, e

label_2A470::
    and  [hl]
    ld   l, c
    and  [hl]
    cp   $0C
    ld   l, l
    inc  b
    db   $F4 ; Undefined instruction
    jr   nc, label_2A470
    ld   [hl], h
    db   $ED ; Undefined instruction
    add  a, d
    inc  b
    dec  c
    jp   nz, label_D30
    nop

label_2A483::
    add  hl, hl
    add  a, d
    ld   bc, $82A6

label_2A488::
    rlca
    and  [hl]
    db   $10
    db   $A6

label_2A48C::
    ld   h, b
    and  [hl]
    add  a, h
    inc  de
    db   $21
    ld   hl, label_28DD
    db   $35
    dec  [hl]
    db   $44

label_2A497::
    ld   b, h
    db   $52
    ld   d, d
    db   $57
    ld   d, a

label_2A49C::
    db   $61
    ld   h, c
    db   $68
    ld   l, b
    db   $C6
    add  a, $05
    dec  de
    ld   b, $1B
    add  a, d
    ld   d, e
    dec  de
    ld   h, e
    dec  de
    cp   $0C
    dec  c
    add  hl, sp
    di
    adc  a, b
    ld   de, $880F
    ld   hl, $880F
    ld   sp, $820F
    inc  [hl]
    dec  c
    inc  b
    ld   h, $05
    dec  h
    inc  d
    inc  h
    dec  d
    inc  hl

label_2A4C4::
    inc  h
    ld   a, [hli]
    dec  h

label_2A4C7::
    add  hl, hl
    ld   [hl], h
    jr   z, label_2A540
    daa
    ld   h, h
    inc  h
    ld   h, l
    inc  hl
    ld   d, h
    inc  l
    ld   d, l
    dec  hl
    ld   d, d
    ret  nz
    ld   d, a
    ret  nz
    daa
    and  b

label_2A4DA::
    ldi  [hl], a
    cp   [hl]
    ld  [$FF00+C], a
    inc  b
    xor  c
    adc  a, b
    db   $10
    db   $FE
    inc  c
    dec  c
    inc  b
    db   $EC ; Undefined instruction
    jr   nc, label_2A4DA
    ld   c, c
    rst  $30
    add  a, a
    ld   sp, label_2810F
    rrca
    daa
    rrca
    add  a, e
    rla
    rrca
    jr   z, label_2A49C
    inc  de
    dec  de
    call nz, label_1B14
    jp   label_1B45
    add  hl, bc
    ld   hl, label_29C2
    and  [hl]
    ld   c, c
    dec  c
    ld   e, c
    inc  l
    inc  hl

label_2A508::
    ret  nz
    ld   h, $C0
    ld   b, e
    ret  nz
    ld   b, [hl]
    ret  nz
    inc  d
    dec  c
    cp   $0C

label_2A513::
    dec  c
    ld   b, b

label_2A515::
    or   $59
    rst  $30
    nop
    ld   hl, label_D10
    jr   nz, label_2A4C4
    adc  a, c
    jr   nc, label_2A4C7
    ld   b, b
    dec  c
    ld   d, b
    dec  hl
    add  a, e
    ld   d, $0F
    add  a, e
    ld   h, $0F
    rla
    and  b
    ld   e, c
    ld   a, [hli]
    ld   l, c
    dec  c

label_2A531::
    add  a, h
    ld   [de], a
    ld   bc, label_2284

label_2A536::
    or   b
    ld   a, c

label_2A538::
    ldi  [hl], a
    ld   d, e
    ret  nz
    ld   d, [hl]
    ret  nz
    add  a, d
    db   $10
    db   $0F

label_2A540::
    ld   hl, $FE0F
    inc  c
    dec  c
    ld   d, b

label_2A546::
    or   $50

label_2A548::
    add  hl, hl
    adc  a, b
    ld   de, $880F
    ld   hl, $880F
    ld   sp, label_40F
    ld   h, $05
    dec  h
    inc  d
    inc  h
    dec  d
    inc  hl
    inc  h
    ld   a, [hli]
    dec  h
    add  hl, hl
    add  a, d
    inc  [hl]
    dec  c

label_2A561::
    ldi  [hl], a
    ret  nz
    daa
    ret  nz
    ld   h, b
    dec  c
    ld   [hl], b

label_2A568::
    ldi  [hl], a
    ld   d, e
    db   $FC ; Undefined instruction
    ld   [rJOYP], a
    reti
    ld   e, b
    ld   b, b
    cp   $05
    sub  a, h
    ld   de, $C583
    ld   hl, $8884
    ld   d, c
    add  a, h
    adc  a, b
    ld   h, c
    add  a, h
    add  a, e
    inc  sp
    add  a, e
    adc  a, d
    nop
    ld   l, l
    ld   bc, $8A65
    ld   [hl], b
    ld   l, l
    jp   label_2AC10
    jp   label_2AC12
    adc  a, d
    ld   b, b
    ld   l, l
    ld   b, c
    add  a, h
    add  a, e
    ld   b, e
    add  a, h
    adc  a, d
    ld   [hl], b
    ld   l, l
    add  a, d
    ld   h, c
    ld   [hl], d
    ld   h, e
    ld   [hl], e
    jp   nz, label_2AC50
    jp   nz, label_28B59
    ld   de, label_3683
    ld   l, l
    add  a, [hl]
    inc  de
    ld   e, h
    add  a, h
    inc  h
    inc  b
    jp   label_2AC19
    pop  hl
    inc  b
    add  a, [hl]
    adc  a, b

label_2A5B6::
    jr   nz, label_2A5B6
    dec  b
    sub  a, h
    add  a, d
    nop
    ld   l, l
    add  a, d
    ld   [$C36D], sp
    ld   de, $C66C
    jr   label_2A632
    db   $10
    db   $54
    add  hl, de
    ld   d, h
    jr   nz, label_2A620
    add  hl, hl
    ld   d, h
    jr   nc, label_2A624
    add  hl, sp
    ld   d, h
    call nz, label_29449
    add  a, d
    ld   b, b
    ld   l, l
    jp   nz, label_2AC58
    adc  a, c
    ld   [hl], b
    ld   l, l
    add  a, [hl]
    ld   [bc], a
    add  a, b
    add  a, [hl]
    ld   [de], a
    add  a, c
    add  a, [hl]
    ldi  [hl], a
    add  a, c
    add  a, [hl]
    ldd  [hl], a
    add  a, c
    add  a, [hl]
    ld   b, d
    add  a, c
    add  a, [hl]
    ld   d, d
    add  a, c
    add  a, [hl]
    ld   h, d
    add  a, c
    add  a, d
    ld   d, b
    ld   c, e
    add  a, d
    ld   h, b
    ld   c, e
    jp   nz, label_2AC24
    add  a, d
    ld   b, h
    ld   l, l
    pop  hl
    inc  b
    adc  a, l
    ld   d, b
    ld   c, b
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    push bc
    db   $10
    db   $6C
    add  a, l
    jr   nc, label_2A67D
    jp   label_2AC17
    ld   b, a
    ld   l, l
    add  a, d
    dec  [hl]
    ld   h, h
    jp   label_2A501
    ld   d, $8F
    add  a, d
    ld   h, b
    ld   l, l

label_2A620::
    add  a, d
    ld   [hl], b
    ld   d, h
    adc  a, b

label_2A624::
    ld   [hl], d
    ld   l, l
    add  a, e
    ld   b, e
    ld   l, e
    ld   b, h
    ld   l, c
    add  a, e
    ld   d, e
    ld   l, c
    ld   d, h
    add  a, d
    ld   d, c
    ld   [hl], l

label_2A632::
    jp   label_2AD29
    add  hl, sp
    ld   l, h
    ld   l, c
    ld   l, l
    pop  hl
    inc  b
    adc  a, h
    ld   a, b
    ld   h, b
    cp   $05
    sub  a, h
    add  a, e
    ld   [de], a
    ld   l, e
    inc  de
    ld   l, c
    add  a, e
    ldi  [hl], a
    ld   l, c
    inc  hl
    add  a, d
    adc  a, d
    nop
    ld   l, l
    add  a, $08
    ld   h, e
    ld   d, $8F
    jp   nz, label_2AC17
    push bc
    add  hl, de
    ld   l, h
    jr   nz, label_2A6C8
    jr   nc, label_2A6C9
    ld   sp, label_356D
    ld   l, l
    ld   [hl], $64
    scf
    ld   l, l
    jr   c, label_2A6C9
    add  hl, sp
    ld   l, l
    add  a, [hl]
    ld   b, b
    ld   l, l
    ld   h, b
    ld   l, l
    ld   l, c
    ld   l, l
    adc  a, d
    ld   [hl], b
    ld   l, l
    pop  hl
    inc  b
    sub  a, h
    ld   a, b

label_2A677::
    jr   nz, label_2A677
    dec  b
    sub  a, h
    adc  a, d
    nop

label_2A67D::
    ld   l, b
    jp   label_2A501
    jp   label_2AC10
    adc  a, c
    ld   sp, $C27B
    inc  de
    ld   c, l
    add  a, e
    inc  d
    ld   l, e
    dec  d
    ld   l, c
    add  a, e
    inc  h
    ld   l, c
    dec  h
    add  a, d
    jp   nz, label_28D16
    jp   nz, label_29740
    adc  a, c
    ld   d, c
    add  a, b
    adc  a, b
    ld   h, d
    add  a, c
    adc  a, b
    ld   [hl], d
    add  a, c
    add  a, d
    ld   a, b
    ld   d, e
    jp   nz, label_29460
    ld   h, c
    ld   d, [hl]
    ld   [hl], c
    ld   d, h
    adc  a, b
    ld   [hl], d
    ld   d, e
    inc  [hl]
    inc  b
    add  a, d
    scf
    inc  b
    ld   c, b
    ld   h, h
    pop  hl
    inc  b
    adc  a, c
    jr   label_2A6DC
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, b
    jp   label_2A508
    jp   label_2AC19

label_2A6C8::
    adc  a, c

label_2A6C9::
    jr   nc, label_2A746
    jp   nz, label_28D11
    jp   nz, label_28D16
    add  a, e
    inc  de
    ld   l, e
    inc  d
    ld   l, c
    add  a, e
    inc  hl
    ld   l, c
    inc  h
    add  a, d
    jp   nz, label_29149
    adc  a, c
    ld   d, b
    add  a, b
    adc  a, c
    ld   h, b
    add  a, c
    add  a, d
    ld   h, e
    ld   d, e
    adc  a, b
    ld   [hl], b
    ld   d, e
    add  a, d
    ld   [hl], e
    ld   d, h
    jp   nz, label_29469
    ld   l, b
    ld   d, [hl]
    ld   a, b
    ld   d, h
    add  a, d
    inc  sp
    inc  b
    pop  hl
    inc  b
    sub  a, [hl]
    adc  a, b
    ld   d, b
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    add  a, $10
    ld   l, h
    add  a, d
    jr   nc, label_2A775
    adc  a, d
    ld   [hl], b
    ld   l, l
    add  hl, sp
    ld   l, l
    ld   c, c
    ld   l, h
    ld   e, c
    ld   l, l
    jp   label_2A501
    call nz, label_28D12
    call nz, label_28D14
    jp   nz, label_28D16
    jp   nz, label_28D18
    pop  hl
    inc  b
    add  a, c
    adc  a, b
    ld   [hl], b
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, l
    add  a, $19
    ld   l, h
    adc  a, d
    ld   [hl], b
    ld   l, l
    add  a, e
    jr   nc, label_2A7A1
    add  a, e
    scf
    ld   l, l
    call nz, label_2A531
    add  a, $08
    ld   h, l
    ld   b, b
    ld   l, h
    jp   label_2AC42
    ld   d, b
    ld   l, l
    call nz, label_28D14
    jp   nz, label_28D16
    ld   sp, label_3864
    ld   h, h
    pop  hl
    inc  b
    sbc  a, [hl]
    jr   z, label_2A783
    cp   $05
    sub  a, h
    add  a, $00
    ld   l, b
    add  a, $01
    ld   h, l
    adc  a, b
    ld   [bc], a
    ld   l, b
    add  hl, de
    ld   l, b
    add  a, e
    ldi  [hl], a
    ld   l, b
    daa
    ld   l, b
    jr   z, label_2A7CC
    add  hl, hl
    ld   l, b
    add  a, e
    inc  sp
    ld   l, e
    inc  [hl]
    ld   l, c
    add  a, e
    ld   b, e
    ld   l, c
    ld   b, h
    add  a, d
    jp   nz, label_2A538
    add  a, e
    ld   d, a
    ld   l, b
    add  a, e
    ld   h, b
    ld   l, b
    add  a, h
    ld   h, e
    ld   c, h
    ld   h, a
    ld   l, b

label_2A782::
    add  a, d

label_2A783::
    ld   l, b
    ld   h, b
    add  a, d
    ld   [hl], b
    ld   h, b
    add  a, [hl]
    ld   [hl], d
    ld   l, b
    add  a, d
    ld   a, b
    ld   h, b
    pop  hl
    ld   [bc], a
    ld   c, d
    jr   label_2A7C3
    cp   $05
    sub  a, h
    jp   nz, label_2A000
    adc  a, c
    ld   bc, label_1168
    ld   l, b
    rst  0
    add  hl, de
    ld   l, b

label_2A7A1::
    add  a, d
    jr   nz, label_2A80C
    add  a, e
    inc  sp
    ld   l, e
    inc  [hl]
    ld   l, c
    add  a, e
    ld   b, e
    ld   l, c
    ld   b, h
    add  a, d
    ld   [hl], $64
    call nz, label_2AC37
    jr   c, label_2A819
    add  a, e
    ld   d, b
    ld   l, b
    jp   nz, label_2A546
    call nz, label_2A548
    add  a, e
    ld   d, b
    ld   l, b
    add  a, d
    ld   h, b

label_2A7C3::
    ld   h, b
    ld   h, d
    ld   l, b
    add  a, h
    ld   h, e
    ld   c, h
    add  a, d
    ld   [hl], b
    ld   h, b

label_2A7CC::
    add  a, [hl]
    ld   [hl], d
    ld   l, b
    pop  hl
    ld   [bc], a
    ld   e, h
    adc  a, b

label_2A7D3::
    jr   nz, label_2A7D3
    inc  c
    dec  c
    nop
    dec  c
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, $C329
    ld   [de], a
    db   $10
    db   $13
    dec  h
    add  a, d
    inc  d
    ld   hl, label_2616
    jp   label_1117
    jr   label_2A81C
    add  hl, de
    ld   h, $23
    inc  hl
    add  a, d
    inc  h
    dec  de
    ld   h, $24
    inc  sp
    daa
    add  a, d
    inc  [hl]
    ldi  [hl], a

label_2A800::
    ld   [hl], $28

label_2A802::
    ld   b, d
    add  a, a
    ld   d, d
    adc  a, $84

label_2A807::
    ld   b, e
    ld   [de], a

label_2A809::
    ld   b, a
    add  a, a
    ld   d, a

label_2A80C::
    adc  a, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2A886
    rst  $18
    ld   [hl], c
    daa

label_2A819::
    ld   a, b
    jr   z, label_2A895

label_2A81C::
    dec  c
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    adc  a, l
    jr   c, label_2A844
    cp   $0C
    dec  c
    cp   $0C
    dec  c
    cp   $0C
    dec  c
    cp   $04
    dec  c
    ld   [hl], e
    pop  af
    ld   [bc], a
    rst  0
    ld   [bc], a
    rst  0
    dec  b
    ld   h, $06

label_2A839::
    ld   a, [hli]
    adc  a, b
    ld   de, $880F
    ld   hl, $880F

label_2A841::
    ld   sp, $C30F

label_2A844::
    inc  d
    call c, label_15C3

label_2A848::
    inc  h
    daa
    and  b
    scf
    db   $DB
    add  hl, sp
    ld   a, [hli]
    add  a, h

label_2A850::
    ld   b, c
    call c, label_2A45
    add  a, e
    ld   b, [hl]
    ld   hl, $9847

label_2A859::
    ld   c, c
    ld   h, $07
    and  e
    ld   [rJOYP], a
    ld   l, h
    ld   c, b
    ld   b, b
    cp   $04
    dec  c
    ld   [hl], l
    pop  af
    ld   [bc], a
    rst  0
    inc  bc
    add  hl, hl
    inc  b
    dec  h
    rlca
    rst  0
    adc  a, b
    ld   de, $880F
    ld   hl, $880F
    ld   sp, $C30F
    inc  d
    inc  hl
    jp   label_DC15
    ldi  [hl], a
    and  b
    jr   nc, label_2A8AB
    ldd  [hl], a
    db   $DB
    ld   b, b
    dec  h

label_2A886::
    add  a, e
    ld   b, c
    ld   hl, $9842
    ld   b, h
    add  hl, hl
    add  a, h

label_2A88E::
    ld   b, l
    call c, label_DB32
    cp   $04
    dec  c

label_2A895::
    inc  bc
    ld   a, [$FF49]
    rst  $30
    ld   [hl], h
    push af
    ld   [bc], a
    rst  0
    dec  b
    rst  0
    push bc
    ld   d, $DC
    add  a, [hl]
    inc  hl
    db   $DB
    jp   nz, label_DB33
    ld   d, b
    daa
    add  a, d

label_2A8AB::
    ld   d, c
    ldi  [hl], a
    ld   d, e
    dec  hl
    ld   h, e
    inc  hl
    ld   [hl], e
    daa
    add  a, e
    ld   h, b
    inc  bc
    add  a, e
    ld   [hl], b
    inc  bc
    ld   h, [hl]
    inc  l
    add  a, e
    ld   h, a
    ldi  [hl], a
    db   $76 ; Halt
    jr   z, label_2A90A
    ld   a, [hli]
    ld   e, c
    dec  c
    add  a, e
    ld   [hl], a
    inc  bc
    ld   h, b
    ret  nz
    add  a, e
    ld   [hl], b
    ret  nz
    ld   d, c
    sbc  a, b
    cp   $04
    sbc  a, l
    ld   b, b
    db   $DB
    ld   b, b
    or   $76
    push af
    adc  a, b
    ld   bc, label_912
    ld   d, $C7
    add  hl, de
    db   $10
    db   $10
    dec  d
    add  a, a
    ld   de, label_1713
    sub  a, l
    inc  de
    dec  c
    add  a, $27
    ld   de, label_20C6
    inc  hl
    add  a, [hl]
    ld   hl, $C521
    ld   [hl], $24
    jr   nz, label_2A91B
    ldi  [hl], a
    rst  0
    inc  hl
    sbc  a, b
    inc  h
    rst  0
    ld   h, $26
    ld   b, b
    add  hl, hl
    ld   d, b
    dec  c
    ld   h, b
    dec  hl
    add  a, e
    ldd  [hl], a
    rrca
    add  a, e
    ld   b, d
    rrca

label_2A90A::
    add  a, e
    ld   d, d
    rrca
    add  a, l
    ld   h, c
    ret  nz
    ld   b, e
    and  b
    cp   $04
    sbc  a, l
    ld   [hl], d

label_2A916::
    push af
    adc  a, b
    ld   de, $88DB

label_2A91B::
    ld   hl, $88DB
    ld   sp, $88DB
    ld   b, c
    db   $DB
    adc  a, b

label_2A924::
    ld   d, c
    db   $DB
    adc  a, b
    ld   h, c
    db   $DB
    adc  a, d
    nop
    and  [hl]
    add  a, $10
    and  [hl]
    rst  0
    add  hl, de
    and  [hl]
    ld   [hl], b
    ld   de, label_D71
    ld   [hl], d
    db   $10
    db   $86
    ld   [hl], e
    and  [hl]
    add  a, d
    inc  d
    dec  c
    inc  sp
    dec  c
    ld   [hl], $0D
    cp   $04
    dec  c
    ld   [hl], h
    pop  af
    ld   [hl], e
    ret  z
    db   $76 ; Halt
    ret  z
    jr   nz, label_2A916
    ld   d, b
    ret
    add  hl, hl
    jp   z, label_CA59
    add  a, h
    inc  de
    rrca
    add  a, h
    inc  hl
    rrca
    add  a, h
    inc  sp
    rrca
    ld   [bc], a
    ld   h, $03
    ld   a, [hli]
    ld   b, $29
    rlca
    dec  h
    jp   label_2412
    ld   b, d
    ld   a, [hli]
    add  a, h
    ld   b, e
    ld   hl, label_28482
    sub  a, a
    add  a, d
    ld   d, h
    rrca
    add  a, d
    ld   h, h
    rrca

label_2A975::
    ld   b, a
    add  hl, hl
    jp   label_2317
    inc  de
    ret  nz

label_2A97C::
    ld   d, $C0
    inc  sp
    ret  nz
    ld   [hl], $C0

label_2A982::
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    ld   [rJOYP], a
    adc  a, h
    jr   c, label_2A9CF
    cp   $FE
    inc  c
    dec  a
    ld   [hl], h
    push af
    ld   [bc], a
    rst  0
    rlca
    rst  0
    ld   de, label_1820
    jr   nz, label_2A924
    ld   [de], a
    rrca
    add  a, [hl]
    ldi  [hl], a
    rrca
    add  a, [hl]
    ldd  [hl], a
    rrca
    jp   nz, label_1062
    add  a, [hl]
    ld   d, e
    inc  de
    ld   d, d
    sub  a, [hl]
    ld   h, e
    dec  h
    add  a, h
    ld   h, h
    ld   hl, label_2668
    ld   [hl], e
    inc  hl
    ld   a, b
    inc  h
    add  a, h
    ld   [hl], h
    dec  de
    add  a, [hl]
    ld   [de], a
    jr   nz, label_2A982
    ld   hl, $C220
    jr   z, label_2A9E5
    adc  a, b
    ld   b, c
    jr   nz, label_2A9EC
    and  b
    cp   $04
    dec  c
    dec  b
    db   $F4 ; Undefined instruction

label_2A9CF::
    ld   [hl], d
    push af
    add  a, e
    nop
    inc  bc
    inc  bc
    dec  h
    inc  b
    rst  0
    rlca
    rst  0
    ld   [label_926], sp
    inc  bc
    db   $10
    db   $25
    add  a, d
    ld   de, label_1321
    add  hl, hl

label_2A9E5::
    jr   label_2AA11
    add  hl, de
    ld   h, $23
    jr   nz, label_2AA14

label_2A9EC::
    jr   nz, label_2A975
    ldd  [hl], a
    and  [hl]
    ld   b, c
    jr   nz, label_2AA3A
    jr   nz, label_2A97C
    ld   d, c
    and  [hl]
    ld   h, l
    jr   nz, label_2AA2E
    and  a
    ld   b, h

label_2A9FC::
    jr   nz, label_2A9FC
    inc  b
    dec  c
    inc  b
    ld   a, [$FF29]
    rst  $30
    ld   [hl], h
    push af
    ld   b, $26
    ld   d, $2A
    add  a, e
    rla
    ld   hl, label_783
    inc  bc
    jr   nz, label_2A9DB
    ld   d, b
    ret

label_2AA14::
    add  hl, hl
    dec  c
    call nz, label_DB13
    call nz, label_DC36
    add  a, d
    scf
    call c, label_2C39
    jp   label_2047
    jp   label_2048
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h

label_2AA2B::
    dec  c
    db   $76 ; Halt
    inc  l

label_2AA2E::
    cp   $04
    dec  e
    ld   [bc], a
    db   $F4 ; Undefined instruction
    jr   nz, label_2AA2B
    add  hl, sp
    rst  $30
    db   $76 ; Halt
    push af
    db   $10
    db   $29
    jr   nz, label_2AA4A
    jr   nc, label_2AA6A
    rst  0
    ld   [bc], a
    rrca
    rst  0
    inc  bc
    rrca
    rst  0
    inc  b
    rrca
    add  a, [hl]
    ld   sp, label_33C0
    xor  h
    jp   nz, label_2406
    ld   d, [hl]
    inc  l
    add  a, d
    ld   d, a
    ldi  [hl], a
    ld   e, c
    jr   z, label_2AACE
    jr   z, label_2AAC1
    rla
    add  a, d
    ld   l, b
    ld   [de], a
    ld   [hl], a
    ld   de, label_D78

label_2AA62::
    ld   a, c
    sub  a, [hl]
    ld   h, $2A
    add  a, d
    daa
    ld   hl, label_2629
    add  hl, bc
    sub  a, h
    rlca
    ld   de, label_1517
    add  a, d
    jr   label_2AA87
    ld   h, [hl]
    inc  h
    rla
    xor  h
    inc  de
    and  b

label_2AA7A::
    ld   d, e
    cp   [hl]
    ld  [$FF00+C], a
    dec  b
    call c, label_1318
    cp   $04
    sbc  a, l
    jr   nc, label_2AA62
    jr   nc, label_2AA7A
    add  hl, sp
    di
    adc  a, d
    nop
    ld   [de], a
    adc  a, d
    ld   h, b
    ld   [de], a
    adc  a, d
    db   $10
    db   $13
    adc  a, d
    ld   [hl], b
    inc  de
    jr   nz, label_2AABD
    adc  a, b
    ld   hl, label_2921
    ld   h, $50
    daa
    adc  a, b
    ld   d, c
    ldi  [hl], a
    ld   e, c
    jr   z, label_2AAC8
    rst  0
    ld   h, $C7
    ld   d, e
    ret  z
    ld   d, [hl]
    ret  z
    inc  sp

label_2AAAD::
    jr   nz, label_2AAE5
    jr   nz, label_2AAF4
    jr   nz, label_2AAF9

label_2AAB3::
    jr   nz, label_2AAB3
    inc  b
    dec  c
    ld   [bc], a
    db   $F4 ; Undefined instruction
    jr   nc, label_2AAAD
    db   $76 ; Halt
    push af

label_2AABD::
    nop
    sub  a, e
    ld   bc, label_20D
    db   $10
    db   $03
    dec  h
    add  a, d
    db   $10
    db   $13

label_2AAC8::
    ld   [de], a
    inc  d
    jr   nz, label_2AAF1
    add  a, d
    ld   hl, label_2321
    add  hl, hl
    ld   d, b
    daa
    add  a, d
    ld   d, c
    ldi  [hl], a
    ld   d, e
    jr   z, label_2AB1C
    inc  l
    add  a, e
    ld   b, h
    ldi  [hl], a
    ld   b, a
    dec  hl
    jp   label_2357
    add  a, h
    ld   h, b
    ld   [de], a

label_2AAE5::
    ld   h, h
    sub  a, e
    ld   d, h
    xor  h
    ld   d, [hl]
    xor  h
    add  a, [hl]
    ld   [hl], b
    inc  de
    db   $76 ; Halt
    inc  d
    ld   h, [hl]

label_2AAF1::
    db   $10
    db   $78
    dec  c

label_2AAF4::
    inc  de
    inc  hl
    ld   a, c
    inc  h
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF74]
    pop  af
    inc  bc
    rst  0
    ld   b, $C7
    adc  a, b
    ld   de, $C40F
    ld   hl, $C40F
    jr   z, label_2AB1B
    adc  a, b
    ld   h, c
    rrca
    ld   de, label_1820
    jr   nz, label_2AB75
    jr   nz, label_2AB7E

label_2AB16::
    jr   nz, label_2AB16
    inc  b
    dec  c
    inc  b

label_2AB1B::
    db   $F4 ; Undefined instruction

label_2AB1C::
    ld   [hl], h
    pop  af
    adc  a, b
    ld   hl, $880F
    ld   sp, $880F
    ld   b, c
    rrca
    jp   label_D24
    jp   label_D25
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    ldd  [hl], a
    cp   [hl]

label_2AB33::
    ld  [$FF00+C], a
    dec  b
    db   $DB
    adc  a, b
    db   $10
    db   $FE
    inc  c
    sbc  a, l
    inc  bc

label_2AB3C::
    db   $F4 ; Undefined instruction
    ld   [hl], l
    push af
    ret  z
    nop
    inc  hl
    push bc
    ld   [bc], a
    db   $10
    db   $C4
    inc  bc
    inc  hl
    add  a, h
    inc  b
    dec  de
    add  a, h
    inc  d
    dec  de
    add  a, h
    inc  h
    dec  de
    add  a, h
    inc  [hl]
    dec  de
    call nz, label_2408
    push bc
    add  hl, bc
    inc  h
    ld   d, d
    sub  a, h
    ld   d, e
    ld   [de], a
    ld   d, h
    ld   d, $64
    db   $10
    db   $43
    daa
    ld   b, h
    ldi  [hl], a
    ld   b, l
    dec  hl
    call nz, label_1B46
    ld   b, a
    inc  l
    ld   c, b
    jr   z, label_2AB33
    ld   d, l
    inc  hl
    jp   label_2457

label_2AB75::
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_2AB3C
    ld   l, b
    inc  h
    jp   nz, label_369
    ld   [hl], c
    dec  c
    ld   [hl], d
    inc  l

label_2AB83::
    ld   [hl], e
    ldi  [hl], a
    ld   [hl], h
    dec  hl
    db   $10
    db   $C9
    ld   b, b
    ret
    add  hl, de
    jp   z, label_CA49
    ld   d, $A0
    add  a, d
    ld   h, d

label_2AB93::
    jr   nz, label_2AB93
    inc  b
    dec  c
    ld   [bc], a
    ld   a, [$FF72]
    pop  af
    dec  b
    ld   h, $06
    ld   a, [hli]
    jp   label_2415
    ld   b, l
    ld   a, [hli]
    add  a, e
    ld   b, [hl]
    ld   hl, $9847
    ld   c, c
    ld   h, $39
    ld   a, [hli]
    ld   de, label_1420
    jr   nz, label_2ABC8
    ld   de, label_1536
    jr   c, label_2ABCA
    ld   h, a
    inc  l
    ld   l, b
    ldi  [hl], a
    ld   l, c
    jr   z, label_2AC35
    jr   z, label_2AC38
    dec  c
    ld   a, c
    inc  l
    jr   label_2AB83
    ld  [$FF00+C], a
    dec  b
    db   $88

label_2ABC8::
    adc  a, b
    db   $10
    db   $FE
    inc  b
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    ld   c, c
    rst  $30
    inc  bc
    add  hl, hl
    add  a, d
    inc  b
    dec  c
    ld   b, $2A
    ld   [bc], a
    rst  0
    rlca
    rst  0
    jp   label_DC16
    add  a, d
    ld   d, a
    call c, label_28186
    db   $DB
    jp   nz, label_DB56
    ld   b, [hl]
    call c, label_A128
    cp   $07
    dec  c
    ld   de, label_68E
    db   $F4 ; Undefined instruction
    ld   b, b
    ld   a, [$FF00+C]
    ld   c, d
    ld   [hl], l
    push af
    ld   b, $26
    ld   d, $24
    ld   h, $2A
    daa

label_2AC00::
    ld   hl, $9828
    add  hl, hl
    ld   h, $07
    ld   de, label_D08

label_2AC09::
    add  hl, bc
    db   $10
    db   $19
    inc  d
    ld   [bc], a
    rst  0
    dec  b

label_2AC10::
    rst  0
    call nz, label_DB34

label_2AC14::
    add  a, e

label_2AC15::
    ld   b, c

label_2AC16::
    call c, label_DB35

label_2AC19::
    ld   [hl], c
    dec  hl
    ld   [hl], a
    dec  hl
    ld   [hl], d
    dec  c
    db   $76 ; Halt
    dec  c
    ld   [hl], e
    inc  l
    ld   [hl], a

label_2AC24::
    inc  l
    ld   [hl], l
    dec  hl
    add  a, d
    ld   [de], a
    jr   nz, label_2AC4E
    jr   nz, label_2AC52
    jr   nz, label_2AC90
    jr   nz, label_2AC6A
    jp   z, label_CA59
    add  a, e

label_2AC35::
    ld   b, [hl]
    rrca

label_2AC37::
    jp   label_F56
    cp   $07
    rlca
    ld   b, b
    call c, label_28140
    ldi  [hl], a

label_2AC42::
    xor  e
    ld   h, $AB
    add  a, l
    ldd  [hl], a
    and  [hl]
    ld   b, h
    and  [hl]

label_2AC4A::
    add  a, e
    ld   d, h
    and  [hl]
    add  a, e

label_2AC4E::
    ld   h, d
    and  [hl]

label_2AC50::
    ld   h, [hl]
    and  [hl]

label_2AC52::
    jr   label_2AC13

label_2AC54::
    ld  [$FF00+C], a

label_2AC55::
    dec  b

label_2AC56::
    reti

label_2AC57::
    adc  a, b

label_2AC58::
    db   $10
    db   $FE
    inc  b
    dec  c
    inc  bc
    rst  0
    ld   b, $C7
    rlca
    db   $F4 ; Undefined instruction
    db   $76 ; Halt
    push af
    rlca
    add  hl, hl
    ld   [label_90D], sp
    inc  h

label_2AC6A::
    jr   label_2AC4A
    inc  de
    jp  c, label_DA16
    ldi  [hl], a
    jp  c, label_DA27
    ld   sp, label_33DA
    jp  c, label_DA36
    jr   c, label_2AC56
    ld   b, d
    jp  c, label_28482
    jp  c, label_DA47
    ld   d, e
    jp  c, label_DA56
    add  a, d
    ld   h, h
    jp  c, label_BE11
    ld  [$FF00+C], a
    dec  b
    jp  c, label_1318
    ldd  [hl], a
    rrca
    cp   $04
    dec  c
    inc  bc
    rst  0
    inc  b
    ld    hl, sp+$06
    rst  0
    ld   [hl], h
    pop  af
    add  a, d
    ldd  [hl], a
    xor  h
    add  a, d
    ld   [hl], $AC
    add  a, d
    ld   b, d
    xor  h
    add  a, d
    ld   b, [hl]
    xor  h
    ld   b, d
    xor  e
    ld   b, a
    xor  e
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF74]
    ld   b, b
    inc  bc
    rst  0
    ld   b, $C7
    add  a, h
    inc  de
    rrca
    ldi  [hl], a
    rrca
    daa
    rrca
    ld   sp, $820F
    inc  [hl]
    rrca
    jr   c, label_2ACD6
    ld   b, d
    rrca
    add  a, d
    ld   b, h
    rrca
    ld   b, a
    rrca
    add  a, h
    ld   d, e
    rrca
    cp   $0C
    dec  c
    dec  b
    db   $F4 ; Undefined instruction

label_2ACD6::
    ld   c, c
    rst  $30
    ld   [hl], c
    push af
    nop
    inc  hl
    ld   bc, label_20D
    ld   a, [hli]
    inc  b
    add  hl, hl
    dec  b
    inc  hl
    jp   nz, label_1B06
    add  a, $07
    inc  h
    ld   [$C22A], sp
    inc  de
    db   $10
    db   $04
    add  hl, hl
    dec  b
    inc  hl
    dec  d
    add  hl, hl
    inc  d
    dec  h
    add  a, $18
    ld   de, $A622
    jp   nz, label_2324
    jp   label_1B25
    jp   label_1B26
    add  a, d

label_2AD06::
    ld   sp, label_3313
    inc  d
    ld   b, c
    dec  h
    add  a, d
    ld   b, d
    ld   hl, label_2944
    jp   label_2351
    add  a, l
    ld   d, d
    dec  de
    jp   nz, label_1B62
    ld   h, e
    inc  l
    add  a, e
    ld   h, h
    ldi  [hl], a
    ld   h, a
    jr   z, label_2AD92
    inc  hl
    ld   [hl], c
    inc  hl
    ld   [hl], e
    inc  h
    ld   [hl], h
    inc  l

label_2AD29::
    inc  hl
    dec  c
    jr   z, label_2AD3A
    ld   de, label_280DE
    ret
    cp   $0C
    dec  c
    ld   [bc], a
    ld   a, [$FF40]
    ld   a, [$FF00+C]
    xor  [hl]

label_2AD3A::
    ld   h, c
    xor  [hl]
    ld   l, b
    xor  [hl]
    inc  sp
    xor  a
    dec  [hl]
    xor  a
    ld   b, e
    or   b
    ld   b, l
    or   b
    rlca
    ld   h, $08
    dec  c
    add  hl, bc
    ld   a, [hli]
    rla
    ld   a, [hli]
    jr   label_2ACE8
    add  hl, de
    ld   h, $27
    xor  a
    scf
    or   b
    jr   c, label_2AD06
    cp   $04
    dec  c
    ld   [bc], a
    db   $F4 ; Undefined instruction
    add  hl, de
    di
    ld   [hl], h
    ei
    rst  0
    ld   b, $0F
    add  a, h
    ld   h, [hl]
    rrca
    ld   bc, label_229
    dec  c
    inc  bc
    inc  h
    inc  b
    inc  bc
    dec  b
    inc  hl
    rlca
    ld   a, [hli]
    ld   [de], a
    db   $DB
    inc  de
    ld   a, [hli]
    inc  d
    rst  0
    dec  d
    add  hl, hl
    ld   d, $DB
    ld   d, d
    db   $DB
    ld   d, [hl]
    db   $DB
    add  a, e
    inc  hl
    rrca
    add  a, e
    inc  sp
    rrca
    add  a, e
    ld   b, e
    rrca
    ld   e, c
    ld   a, [hli]
    ld   a, c
    ldi  [hl], a
    jr   nc, label_2AD59
    add  hl, sp
    jp   z, label_4FE
    dec  c
    db   $10
    db   $DB
    db   $10
    db   $F6
    ld   [hl], a
    pop  af
    ld   [bc], a
    rst  0
    rlca
    rst  0
    jp   label_F16
    jr   nc, label_2ADCB
    add  a, l
    ld   sp, $C322
    ld   b, [hl]
    inc  hl
    db   $76 ; Halt
    daa
    add  a, h
    ld   d, b
    ld   hl, label_2654
    jp   nz, label_2464
    add  a, [hl]
    ld   b, b
    inc  bc
    jp   label_355
    ld   h, b
    dec  c
    ld   [hl], b
    dec  hl
    add  a, e
    ld   [hl], c
    dec  c
    add  a, d
    rla
    rrca
    add  a, d
    daa
    rrca
    add  a, d

label_2ADC8::
    scf
    rrca
    ld   d, d

label_2ADCB::
    rst  0
    daa
    and  b
    dec  [hl]
    dec  hl
    ld   b, l
    daa
    ld   b, [hl]
    dec  hl
    add  a, e
    ld   h, b

label_2ADD6::
    rrca
    ld   [hl], d
    rrca
    cp   $04
    dec  c
    ld   b, $F0
    ld   e, c
    di
    ld   hl, label_27AC
    xor  h
    ld   h, c
    xor  h
    ld   h, a
    xor  h
    inc  sp
    xor  a
    inc  [hl]
    xor  [hl]
    dec  [hl]
    xor  a
    ld   b, e
    ld   bc, $0145
    ld   d, e
    or   b
    ld   d, h
    xor  [hl]
    ld   d, l
    or   b
    add  a, l
    nop
    inc  bc
    dec  b
    dec  h
    ld   [label_926], sp
    inc  bc
    db   $10
    db   $25
    add  a, h
    ld   de, label_1521
    add  hl, hl
    jr   label_2AE34
    add  hl, de
    ld   h, $E1
    dec  b
    call nc, label_2BC50
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF50]
    ld   a, [$FF00+C]
    xor  h
    jr   label_2ADC8
    ld   hl, label_22AF
    and  a
    add  a, h
    inc  hl
    inc  de
    scf
    and  a
    jr   z, label_2ADD6
    ld   sp, label_38B0
    or   b
    add  a, [hl]
    ld   b, d
    xor  [hl]
    ld   d, h
    and  a
    ld   h, l
    and  a
    cp   $04

label_2AE34::
    dec  c
    inc  b
    ccf
    ld   [hl], h
    db   $ED ; Undefined instruction
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    inc  b
    ld   b, a
    jp   nz, label_2032
    jp   nz, label_2037
    cp   $0C
    dec  c
    nop
    inc  hl
    ld   bc, label_2B7F4
    push af
    add  a, $01
    inc  hl
    push bc
    ld   [bc], a
    dec  de
    call nz, label_2403
    inc  b
    ld   a, [hli]
    rlca
    rst  0

label_2AE5F::
    jp   nz, label_1114
    inc  [hl]
    dec  d
    ld   [hl], $13
    scf
    sub  a, l
    ld   b, e
    ld   a, [hli]
    ld   b, h
    ld   hl, $9845
    ld   b, [hl]
    ld   h, $C3
    ld   b, a
    ld   de, label_29284
    dec  de
    ld   d, [hl]
    inc  h
    ld   h, c
    daa
    add  a, h
    ld   h, d
    ldi  [hl], a
    ld   h, [hl]
    jr   z, label_2AEF3
    ret  z
    db   $76 ; Halt
    ret  z
    add  a, e
    ld   d, $20
    cp   $04
    dec  c
    inc  b
    ld   a, [$F574]
    nop
    rla
    ld   bc, label_212
    ld   d, $03
    dec  h
    ld   b, $26
    rlca
    rla
    ld   [label_912], sp
    ld   d, $C2
    db   $10
    db   $11
    jp   nz, label_1012
    jp   label_2313
    jp   label_2416
    jp   nz, label_1117
    jr   label_2AECE
    jp   nz, label_1019
    jr   nc, label_2AE5F
    ldd  [hl], a
    xor  h
    scf
    xor  h
    add  hl, sp
    xor  h
    ld   b, b
    dec  h
    ld   b, c
    sbc  a, b
    ld   b, d
    ld   hl, label_2943
    ld   b, [hl]
    ld   a, [hli]
    ld   b, a
    ld   hl, $9848
    ld   c, c
    ld   h, $11
    and  b
    cp   $04
    dec  e

label_2AECE::
    rlca
    db   $F4 ; Undefined instruction
    jr   nz, label_2AE9B
    ld   d, b
    ret
    ld   [hl], a
    push af
    rst  0
    inc  b
    inc  h
    ret  z
    dec  b
    inc  bc
    rst  0
    ld   b, $23
    ld   b, $25
    add  hl, bc
    ld   h, $71
    dec  hl
    ld   [hl], d
    dec  c
    ld   [hl], e
    inc  l
    ld   [hl], h
    jr   z, label_2AF62
    daa
    add  a, d
    daa
    rrca
    add  a, d
    scf
    rrca

label_2AEF3::
    add  a, d
    ld   b, a
    rrca

label_2AEF6::
    inc  h
    jp   z, label_CA54
    scf
    and  b
    ret  z
    ld   [bc], a
    rrca
    cp   $04
    dec  c
    inc  b
    db   $EC ; Undefined instruction
    ld   c, c
    di
    ld   [hl], h
    push af
    inc  de
    ret  nz
    ld   d, $C0
    add  a, d
    nop
    inc  bc
    add  a, d
    ld   [label_203], sp
    dec  h
    rlca
    ld   h, $10
    dec  h
    ld   de, label_1221
    add  hl, hl
    rla
    ld   a, [hli]
    jr   label_2AF41
    add  hl, de
    ld   h, $FE
    inc  c
    dec  c
    rlca
    db   $DB
    rlca
    ld   a, [$FF40]
    ld   a, [$FF00+C]
    pop  af
    ld   b, a
    inc  l
    ld   c, b
    ldi  [hl], a
    ld   c, c
    jr   z, label_2AEF6
    ld   d, a
    inc  h
    ld   [hl], a
    jr   z, label_2AF92
    inc  l
    ld   a, b
    dec  c
    ld   a, c
    inc  h
    ld   [bc], a
    rst  0
    jp   label_F58
    ld   e, b
    and  b
    add  a, d
    nop
    inc  bc
    ld   [bc], a
    dec  h
    db   $10
    db   $25
    ld   de, label_1221
    add  hl, hl
    add  a, d
    rla
    rrca
    add  a, d
    ld   h, c
    rrca
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF03]
    rst  0
    ld   b, $C7
    add  a, e
    ldd  [hl], a
    rrca

label_2AF62::
    add  a, e
    ld   b, d
    rrca
    add  a, e
    ld   d, d
    rrca
    add  a, l
    ld   hl, $C3DC
    dec  [hl]
    call c, label_31C3
    call c, label_2A185
    call c, label_BE43
    ld  [$FF00+C], a
    dec  b
    ret  c
    jr   label_2AF8B

label_2AF7B::
    cp   $04
    dec  c
    rlca
    ld   a, [$FF39]
    rst  $30
    ld   bc, label_229
    dec  c
    inc  bc
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    ld   e, c
    inc  l
    ldi  [hl], a
    xor  h
    add  a, e

label_2AF92::
    inc  hl
    rrca
    ld   h, $AC
    jp   nz, label_F32
    jp   nz, label_F36
    ld   d, d
    xor  h
    add  a, e
    ld   d, e
    rrca
    ld   d, [hl]
    xor  h

label_2AFA3::
    jp   nz, label_F02
    cp   $07
    dec  c
    jr   nc, label_2AF7B
    jr   nc, label_2AFA3
    add  hl, sp
    rst  $30
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    jr   nz, label_2AFE2
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D30
    jp   nz, label_D39
    ld   d, b
    dec  hl
    ld   e, c
    inc  l
    jp   label_C032
    jp   label_C037
    ld   d, e
    db   $FC ; Undefined instruction

label_2AFCD::
    ld   [rJOYP], a
    adc  a, h
    jr   c, label_2B012
    cp   $07
    dec  c

label_2AFD5::
    jr   nc, label_2AFCD
    add  hl, sp
    rst  $30
    add  a, d
    nop
    inc  bc
    ld   [bc], a
    dec  h
    inc  b
    ld   h, $05
    dec  h

label_2AFE2::
    rlca
    ld   h, $82
    ld   [$8203], sp
    db   $10
    db   $03
    ld   [de], a
    inc  hl
    inc  d
    inc  h
    dec  d
    inc  hl
    rla
    inc  h
    add  a, d
    jr   label_2AFF8
    add  a, d
    jr   nz, label_2B019

label_2AFF8::
    ldi  [hl], a
    add  hl, hl
    inc  h
    ld   a, [hli]
    dec  h
    add  hl, hl
    daa
    ld   a, [hli]
    add  a, d
    jr   z, label_2B024
    jp   nz, label_D30
    jp   nz, label_D39
    add  a, d
    ld   d, b
    ldi  [hl], a
    ld   d, d
    dec  hl
    ld   d, a

label_2B00F::
    inc  l
    add  a, d
    ld   e, b

label_2B012::
    ldi  [hl], a
    adc  a, d
    ld   h, b
    inc  bc
    ld   h, d
    inc  hl
    ld   h, a

label_2B019::
    inc  h
    add  a, d
    ld   [hl], b
    inc  bc
    ld   [hl], d
    daa
    ld   [hl], a
    jr   z, label_2AFA4
    ld   a, b
    inc  bc

label_2B024::
    add  a, e
    inc  sp

label_2B026::
    jp   nc, label_34C3
    rst  8
    jp   nz, label_CF36
    jp   label_D043
    jp   nz, label_D045
    ld   d, [hl]
    pop  de
    ld   h, h
    pop  de
    add  a, d
    ld   h, l
    xor  [hl]
    cp   $07
    dec  c
    inc  b
    ld   a, [$FF30]
    or   $03
    rst  0
    ld   b, $C7
    jr   nz, label_2B070
    jp   nz, label_D30
    ld   d, b
    dec  hl
    ld   h, c
    jr   nz, label_2B0B7
    jr   nz, label_2AFD5
    inc  hl
    jp  c, label_3282
    jp  c, label_3682
    jp  c, label_28282
    jp  c, label_28682
    jp  c, label_29384
    jp  c, label_4FE
    dec  c
    inc  bc
    ld   a, [$FF02]
    rst  0
    dec  b
    rst  0
    rlca
    ld   h, $C6
    ld   [label_90F], sp
    inc  h
    call nz, label_2417
    ldi  [hl], a
    call c, label_DC26
    ld   sp, $83DC
    inc  sp
    call c, label_2740
    ld   b, c
    sbc  a, b
    ld   b, d
    dec  hl
    add  a, e
    ld   b, e
    db   $DB
    ld   b, h
    call c, label_2B50
    ld   d, c
    rrca
    ld   d, d
    inc  hl
    ld   d, e
    db   $DB
    ld   d, h
    inc  l
    ld   d, l
    sbc  a, b
    ld   d, [hl]
    ldi  [hl], a
    ld   d, a
    jr   z, label_2B0FB
    ret  nz
    ld   h, d
    daa
    ld   h, e
    ldi  [hl], a
    ld   h, h
    jr   z, label_2B026
    ld   h, l
    rrca
    jp   nz, label_C050
    ld   [hl], b
    inc  l
    ld   de, $FE20
    dec  b
    sub  a, h
    adc  a, d
    nop
    ld   l, b
    jp   label_2A501
    add  a, $10
    ld   l, b

label_2B0B7::
    add  a, e
    inc  d
    ld   l, e
    dec  d
    ld   l, c
    add  a, e
    inc  h
    ld   l, c
    dec  h
    add  a, d
    jr   c, label_2B127
    add  a, d
    ld   b, l
    ld   h, h
    jp   label_2A548
    jp   label_2A839
    ld   l, c
    ld   l, b
    adc  a, c
    ld   [hl], b
    ld   l, b
    ld   a, c
    ld   l, b
    add  a, d
    ld   sp, label_3368
    ld   h, h
    add  a, e
    ld   b, c
    ld   h, h
    jp   nz, label_2A551
    pop  hl
    dec  b
    jp   nc, label_29038
    cp   $05
    sub  a, h
    adc  a, d
    nop
    ld   l, b
    add  a, $08
    ld   h, l
    add  a, e
    ld   de, label_126B
    ld   l, c
    add  a, e
    ld   hl, label_2269
    add  a, d
    inc  d
    ld   l, b
    dec  d
    ld   l, b
    push bc

label_2B0FB::
    add  hl, de
    ld   l, b
    jr   nc, label_2B167
    ld   sp, $C264
    ld   b, c
    ld   h, l
    add  a, d
    inc  h
    ld   l, b
    add  a, d
    ld   b, h
    ld   h, h
    jp   nz, label_2A840
    adc  a, d
    ld   h, b
    ld   l, b
    add  a, h
    ld   h, e
    inc  b
    ld   h, e
    ld   [hl], l
    adc  a, d
    ld   [hl], b
    ld   l, b
    add  a, h
    ld   [hl], e
    ld   l, b
    add  a, d
    ld   [hl], b
    ld   h, b
    add  a, d
    ld   a, b
    ld   h, b
    pop  hl
    dec  b

label_2B123::
    jp   nz, label_2088
    cp   $05
    sub  a, h
    ld   [de], a
    ld   l, c
    ldi  [hl], a
    add  a, d
    inc  d
    ld   l, c
    inc  h
    add  a, d
    ld   d, $69
    ld   h, $82
    adc  a, d
    nop
    ld   l, b
    push bc
    ld   bc, $C663
    db   $10
    db   $68
    call nz, label_2A513
    call nz, label_2A515
    push bc
    rla
    ld   h, l
    add  a, d
    jr   c, label_2B1B2
    jp   label_2A848
    jp   label_29449
    add  a, a
    ld   h, c
    ld   c, h
    adc  a, d
    ld   [hl], b
    ld   l, b
    scf
    ld   h, h
    ld   h, l
    ld   l, b
    call nz, label_2A049
    pop  hl
    dec  b
    jp   label_2018
    cp   $05
    sub  a, h
    adc  a, d
    nop

label_2B167::
    ld   l, b
    jp   nz, label_2A308
    inc  de
    ld   h, h
    add  a, $19
    ld   l, b
    add  a, d
    jr   nc, label_2B1DB
    inc  sp
    ld   l, b
    add  a, d
    dec  [hl]
    ld   l, b
    jp   label_2A538
    jr   c, label_2B1E1
    call nz, label_2A840
    jp   label_2A841
    ld   b, e
    ld   l, b
    add  a, d
    ld   b, l
    ld   l, b

label_2B188::
    add  a, d
    ld   h, d
    ld   c, h
    ld   h, h
    ld   l, b
    ld   l, b
    ld   c, h
    adc  a, c
    ld   [hl], c
    ld   l, b
    call nz, label_2A040
    pop  hl
    dec  b
    cp   l
    jr   z, label_2B1EA
    cp   $05
    sub  a, h
    add  a, $01
    ld   h, l
    add  a, $00
    ld   l, b
    jp   label_2A802
    add  a, a
    inc  bc
    ld   h, b
    add  a, [hl]
    inc  de
    ld   l, b
    add  hl, de
    ld   h, b
    inc  hl
    ld   l, b
    add  a, d
    jr   z, label_2B21B
    add  a, e
    ldd  [hl], a
    ld   l, e
    inc  sp
    ld   l, c
    add  a, e
    ld   b, d
    ld   l, c
    ld   b, e
    add  a, d
    add  a, e
    scf
    ld   l, e
    jr   c, label_2B22B
    add  a, e
    ld   b, a
    ld   l, c
    ld   c, b
    add  a, d
    adc  a, d
    ld   h, b
    ld   l, b
    adc  a, d
    ld   [hl], b
    ld   h, b
    pop  hl
    dec  b
    cp   c
    jr   c, label_2B232
    cp   $05
    sub  a, h
    add  a, a
    nop
    ld   h, b
    jp   label_2A807

label_2B1DB::
    add  a, $08
    ld   h, l
    rst  0
    add  hl, bc
    ld   l, b

label_2B1E1::
    add  a, a
    db   $10
    db   $68
    db   $10
    db   $60
    ld   d, $60
    add  a, a
    jr   nz, label_2B253
    ldi  [hl], a
    inc  b
    inc  h
    inc  b
    add  a, e
    jr   nc, label_2B25D
    ld   sp, $8369
    ld   b, b
    ld   l, c
    ld   b, c
    add  a, d
    add  a, e
    dec  [hl]
    ld   l, e
    ld   [hl], $69
    add  a, e
    ld   b, l
    ld   l, c
    ld   b, [hl]
    add  a, d
    adc  a, d
    ld   h, b
    ld   l, b
    adc  a, d
    ld   [hl], b
    ld   h, b
    pop  hl
    dec  b
    cp   a
    adc  a, b

label_2B20D::
    jr   nz, label_2B20D
    inc  b
    dec  c
    cp   $04
    dec  c
    cp   $0C
    dec  c
    nop
    rst  $18
    ld   bc, label_225
    rst  0
    ld   b, $C7
    ld   [label_926], sp
    rst  $18
    db   $10
    db   $25
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $20
    add  hl, hl
    ld   hl, label_230F
    add  a, a
    dec  h

label_2B232::
    add  a, a
    add  hl, hl
    inc  h
    jr   nc, label_2B25C
    ld   sp, label_3221
    ld   h, $33
    adc  a, $34
    add  a, [hl]
    dec  [hl]
    adc  a, $36
    dec  h
    scf
    ld   hl, label_2638
    add  hl, sp
    ld   a, [hli]
    jp   nz, label_1B41
    ld   b, d
    inc  h
    ld   b, [hl]
    inc  hl
    ld   b, a
    rrca
    ld   c, b

label_2B253::
    inc  h
    ld   c, c
    dec  c
    ld   d, d
    ld   a, [hli]
    add  a, e
    ld   d, e
    ld   hl, $9854

label_2B25D::
    ld   d, [hl]
    add  hl, hl
    ld   e, b
    ld   a, [hli]
    ld   e, c
    ld   h, $85
    ld   h, c
    dec  de
    ld   l, b
    set  4, b
    nop
    and  $48
    ld   b, b
    cp   $0C
    dec  c
    ld   [bc], a
    rst  0
    ld   b, $C7
    db   $10
    db   $29
    ld   [de], a
    rrca
    ld   d, $25
    rla
    ld   hl, label_2618
    add  hl, de
    ld   a, [hli]
    jr   nz, label_2B2A7
    ld   hl, label_2221
    ld   h, $23
    add  a, a
    dec  h
    add  a, a
    call nz, label_2326
    jp   nz, label_2027
    jr   c, label_2B2B2
    jr   z, label_2B2BE
    add  hl, hl
    ld   h, $C2
    ldd  [hl], a
    inc  h
    inc  sp
    adc  a, $34
    add  a, [hl]
    dec  [hl]
    adc  a, $52
    ld   a, [hli]
    add  a, e
    ld   d, e
    ld   hl, label_2956
    ld   d, a

label_2B2A7::
    rrca
    add  a, a
    ld   h, c
    dec  de
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2B322
    ret  z
    db   $76 ; Halt

label_2B2B2::
    ret  z
    ld   a, b
    jr   z, label_2B32F
    dec  c
    ld   d, h
    sbc  a, b

label_2B2B9::
    ld   c, b
    set  4, b
    nop
    ld   d, d

label_2B2BE::
    ld   l, b

label_2B2BF::
    jr   nc, label_2B2BF
    inc  c
    dec  c
    ld   [bc], a
    rst  0
    ld   b, $C7
    db   $10
    db   $29
    ld   [de], a
    rrca
    ld   d, $25
    rla
    ld   hl, label_2618
    add  hl, de
    ld   a, [hli]
    jr   nz, label_2B2FA
    ld   hl, label_2221
    ld   h, $23
    add  a, a
    dec  h
    add  a, a
    call nz, label_2326
    jp   nz, label_2027
    jr   c, label_2B305
    jr   z, label_2B311
    add  hl, hl
    ld   h, $C2
    ldd  [hl], a
    inc  h
    inc  sp
    adc  a, $34
    add  a, [hl]
    dec  [hl]
    adc  a, $52
    ld   a, [hli]
    add  a, e
    ld   d, e
    ld   hl, label_2956
    ld   d, a

label_2B2FA::
    rrca
    add  a, a
    ld   h, c
    dec  de
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2B375
    ret  z
    db   $76 ; Halt

label_2B305::
    ret  z
    ld   a, b
    jr   z, label_2B382
    dec  c
    ld   d, h
    sbc  a, b
    ld   c, b
    set  4, b
    nop
    inc  b

label_2B311::
    ld   a, b
    ld   [hl], b
    cp   $04
    dec  c
    ld   [bc], a
    sbc  a, c
    jp   nz, label_DF11
    ld   [de], a
    sbc  a, d
    add  a, e
    dec  d
    rst  $18
    ldi  [hl], a
    push bc

label_2B322::
    ld   h, $A6
    daa
    adc  a, $28
    and  [hl]
    ldd  [hl], a
    add  a, $38
    jr   nz, label_2B370
    rst  $18
    ld   c, b

label_2B32F::
    rst  $18
    add  a, e
    ld   d, d
    rst  $18
    add  a, d
    ld   d, a
    jr   nz, label_2B2B9
    ld   h, c
    rst  $18
    add  a, d
    ld   h, a
    jr   nz, label_2B355
    xor  e
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    or   $58
    ld   b, d
    cp   $0C
    dec  b
    nop
    rst  $18
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, $8629

label_2B355::
    ld   [de], a
    dec  de
    jr   label_2B383
    add  hl, de
    ld   h, $C4
    ld   hl, $C41B
    ldi  [hl], a
    dec  de
    inc  hl
    inc  l
    add  a, d
    inc  h
    ldi  [hl], a
    ld   h, $2B
    call nz, label_1B27
    call nz, label_1B28
    ld   h, b
    daa

label_2B370::
    ld   h, c
    dec  hl
    add  a, [hl]
    ld   h, d
    dec  de

label_2B375::
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2B3EA
    rst  $18
    ld   [hl], c
    daa
    ld   [hl], e
    dec  hl
    add  a, d
    ld   [hl], h
    dec  c

label_2B382::
    db   $76 ; Halt

label_2B383::
    inc  l
    ld   a, b
    jr   z, label_2B400
    rst  $18
    jp   nz, label_2433
    jp   nz, label_2336
    ld   d, e
    ld   a, [hli]
    add  a, d
    ld   d, h
    sub  a, a
    ld   d, [hl]
    add  hl, hl
    cp   $0C
    sub  a, l
    nop
    rst  $18
    ld   bc, $8225
    ld   [bc], a
    ld   hl, label_2604
    dec  b
    rst  $18
    add  a, d
    ld   b, $0D
    ld   [label_10DF], sp
    dec  h
    ld   de, label_1429
    inc  h
    add  a, d
    dec  d
    rst  $18
    add  a, e
    rla
    dec  c
    jp   nz, label_2320
    inc  h
    ld   a, [hli]
    dec  h
    ld   h, $84
    ld   h, $DF
    jr   label_2B3CD
    dec  [hl]
    ld   a, [hli]
    ld   [hl], $26
    add  a, e
    scf
    rst  $18
    ld   b, b
    daa
    ld   b, c
    dec  hl
    ld   b, l
    dec  de

label_2B3CD::
    ld   b, [hl]
    ld   a, [hli]
    add  a, e
    ld   b, a
    ld   hl, $DF50
    ld   d, c
    daa
    ld   d, d
    dec  hl
    add  a, h
    ld   d, h
    dec  de
    add  a, d
    ld   e, b
    ld   c, $60
    dec  c
    ld   h, c
    rst  $18
    ld   h, d
    daa
    ld   h, e
    ldi  [hl], a
    ld   h, h
    dec  hl
    add  a, d
    ld   h, l

label_2B3EA::
    dec  de
    add  a, e
    ld   h, a
    ld   c, $82
    ld   [hl], b
    dec  c
    add  a, d
    ld   [hl], d

label_2B3F3::
    rst  $18
    ld   [hl], h

label_2B3F5::
    daa
    add  a, l
    ld   [hl], l
    ldi  [hl], a
    ldi  [hl], a
    set  4, b
    nop
    rst  $20
    ld   l, b

label_2B3FF::
    jr   nz, label_2B3FF
    inc  c
    sub  a, l
    ld   [bc], a
    dec  c
    add  a, d
    inc  b
    rst  $18
    jp   label_DF09
    add  a, d
    db   $10
    db   $0D
    inc  de
    rst  $18
    ld   d, $DF
    jr   label_2B3F3
    jr   nz, label_2B3F5
    add  a, l
    ld   hl, $850D
    jr   nc, label_2B3FB
    add  a, d
    dec  [hl]
    dec  c
    scf

label_2B420::
    rst  $18
    add  hl, sp
    dec  c
    add  a, h
    ld   b, b
    ld   hl, label_2644
    ld   b, l
    rst  $18
    add  a, d
    ld   b, [hl]
    dec  c
    jp   nz, label_DF48
    add  a, h
    ld   d, b
    ld   c, $54
    ld   a, [hli]
    ld   d, l
    ld   h, $56
    rst  $18
    add  a, l
    ld   h, b
    ld   c, $65
    ld   a, [hli]
    ld   h, [hl]
    ld   h, $C2
    ld   h, a
    rst  $18
    jp   nz, label_D68
    ld   l, c
    dec  c
    add  a, d
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], d
    dec  hl
    add  a, e
    ld   [hl], e
    ld   c, $76
    inc  h
    ld   a, c
    rst  $18
    cp   $0C
    dec  a
    nop
    rst  $18
    ld   bc, label_225
    add  hl, hl
    inc  bc
    dec  h
    dec  b
    ld   hl, label_2606
    rlca
    ld   a, [hli]
    ld   [$C826], sp
    add  hl, bc
    rst  $18
    db   $10
    db   $25
    ld   de, label_1229
    dec  h
    inc  de
    add  hl, hl
    ld   d, $2A
    rla
    ld   h, $C3
    jr   label_2B49D
    ld   hl, label_2225
    add  hl, hl
    daa
    inc  h
    jp   nz, label_2331
    dec  [hl]
    inc  l
    ld   [hl], $22
    scf
    jr   z, label_2B4CD
    inc  l
    ld   b, l
    jr   z, label_2B4D3
    inc  l
    ld   b, a
    ldi  [hl], a
    ld   c, b
    jr   z, label_2B4E4
    daa
    add  a, d
    ld   d, d
    ldi  [hl], a
    ld   d, h
    jr   z, label_2B4EF
    inc  l
    ld   d, [hl]
    jr   z, label_2B420
    ld   d, a
    rst  $18
    ld   h, e
    dec  de
    ld   h, h
    inc  l
    ld   h, l
    jr   z, label_2B50D
    rst  $18
    add  a, d
    ld   [hl], d
    dec  de
    ld   [hl], h
    inc  h
    ld   [hl], l
    rst  $18
    ld   a, b
    rst  $18
    inc  b
    and  e
    ld   [rJOYP], a
    cpl
    jr   label_2B528
    cp   $0C
    dec  b
    ld   [hl], h
    dec  a
    nop
    rst  $18
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l

label_2B4D3::
    ld   l, c
    jr   z, label_2B546
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2B555
    rst  $18
    ldi  [hl], a
    rrca
    ld   [hl], $0F
    ld   sp, label_2840F

label_2B4E4::
    rrca
    ld   h, a
    rrca
    add  a, d
    dec  h
    rrca
    cp   $0C
    sbc  a, l
    nop
    dec  h

label_2B4EF::
    add  a, d
    ld   bc, label_321
    ld   h, $82
    dec  b
    rst  $18
    jp   nz, label_2413
    add  a, d
    dec  d
    dec  b
    add  a, d
    rla
    rst  $18
    add  a, [hl]
    inc  h
    rst  $18
    daa
    dec  b
    add  a, d
    ld   sp, label_331B
    ld   a, [hli]
    add  a, [hl]
    inc  [hl]
    ld   hl, label_2740
    ld   b, c
    dec  hl
    adc  a, b
    ld   b, d
    dec  de
    ld   d, c
    daa
    adc  a, b
    ld   d, d
    ldi  [hl], a
    add  a, d
    ld   h, b
    dec  b
    adc  a, b
    ld   h, d
    rst  $18
    ld   h, h
    dec  c
    add  a, d
    ld   h, [hl]
    dec  c
    adc  a, c
    ld   [hl], b
    rst  $18
    ld   [hl], d

label_2B528::
    dec  b
    ld   [hl], e
    dec  c
    jp   label_2310
    ld   hl, label_121B
    set  4, b
    nop
    dec  hl
    ld   l, b

label_2B536::
    jr   nc, label_2B536
    inc  c
    sbc  a, l
    adc  a, d
    nop
    rst  $18
    add  a, e
    ld   b, $05
    add  a, d
    ld   de, $83DF
    dec  d
    rst  $18

label_2B546::
    adc  a, d
    jr   nz, label_2B528
    add  a, d
    dec  h
    dec  c
    adc  a, b
    jr   nc, label_2B570
    jr   c, label_2B577
    add  hl, sp
    rst  $18
    add  a, h
    ld   b, b

label_2B555::
    dec  de
    ld   b, h
    and  a
    ld   b, l
    xor  [hl]
    ld   c, b
    ld   a, [hli]
    ld   c, c
    ld   h, $86
    ld   d, b
    ldi  [hl], a
    ld   d, [hl]
    dec  hl
    jp   nz, label_2459
    add  a, [hl]
    ld   h, b
    rst  $18
    ld   h, d
    dec  b
    ld   h, e
    dec  c
    ld   h, [hl]
    inc  hl
    add  a, d

label_2B570::
    ld   [hl], c
    rst  $18
    add  a, e
    ld   [hl], e
    dec  b
    db   $76 ; Halt
    daa

label_2B577::
    add  a, d
    ld   [hl], a
    ldi  [hl], a
    ld   a, c
    jr   z, label_2B5E5
    set  4, b
    nop
    dec  l
    ld   e, b
    ld   d, b
    cp   $05
    sub  a, h
    adc  a, b
    nop
    ld   l, c
    jp   nz, label_2AC08
    jp   nz, label_2A809
    adc  a, b
    db   $10
    db   $69
    jr   nz, label_2B5F5
    ld   hl, label_2264
    ld   e, a
    add  a, a
    inc  hl
    ld   h, b
    jp   label_29730
    jp   nz, label_2A531
    ldd  [hl], a
    ld   e, d
    add  a, a
    inc  sp
    ld   e, h
    ld   d, e
    add  a, d
    ld   d, a
    add  a, d
    ld   h, b
    ld   d, h
    ld   h, c
    ld   e, e
    ld   h, d
    ld   e, l
    ld   h, e
    ld   c, h
    ld   h, h
    ld   e, c
    ld   h, l
    ld   e, l
    add  a, d
    ld   h, [hl]
    ld   c, h
    ld   l, b
    ld   e, c
    ld   l, c
    ld   e, e
    adc  a, d
    ld   [hl], b
    ld   d, h
    ld   [rJOYP], a
    ld   c, c
    ld   l, b
    ld   d, b
    cp   $05
    sub  a, h
    jp   nz, label_2A800
    jp   nz, label_2AD01
    ld   [bc], a
    ld   a, c
    inc  bc
    db   $E3 ; Undefined instruction
    add  a, d
    inc  b
    db   $E4 ; Undefined instruction
    ld   b, $E5
    ld   [de], a
    inc  bc
    inc  de
    ld   a, a
    add  a, d
    inc  d
    ld   c, l
    ld   d, $E6
    rlca
    db   $E3 ; Undefined instruction
    add  a, d
    ld   [label_17E4], sp
    ld   a, a
    add  a, d
    jr   label_2B637
    adc  a, d
    jr   nz, label_2B64D
    dec  h
    ld   h, c
    ld   h, $64
    daa
    ld   e, a
    add  a, l
    jr   nc, label_2B652
    dec  [hl]
    ld   e, [hl]
    jp   nz, label_2A536
    jp   nz, label_29137
    push bc
    jr   c, label_2B655
    push bc
    add  hl, sp
    ld   d, h
    ld   d, e
    add  a, d
    ld   d, l
    ld   h, h
    ld   d, [hl]
    ld   e, c
    add  a, e
    ld   d, a
    ld   d, h
    ld   h, b
    ld   e, e
    ld   h, c
    ld   e, l
    ld   h, l
    ld   h, l
    ld   h, [hl]
    ld   d, c
    add  a, e
    ld   h, a
    ld   d, h
    adc  a, d
    ld   [hl], b
    ld   d, h
    add  a, h
    ld   [hl], d
    ld   e, e
    ld   [rJOYP], a
    ld   c, d
    adc  a, b

label_2B622::
    jr   nc, label_2B622
    inc  c
    sbc  a, l
    ld   [bc], a
    dec  b
    inc  bc
    rst  $18
    inc  b
    dec  h
    add  a, h
    dec  b
    ld   hl, label_2609
    db   $10
    db   $05
    add  a, d
    ld   de, label_13DF

label_2B637::
    dec  h
    inc  d
    add  hl, hl
    rst  0
    add  hl, de
    inc  h
    jr   nz, label_2B664
    add  a, d
    ld   hl, label_2321
    add  hl, hl
    jp   label_2330
    dec  [hl]
    inc  l
    ld   [hl], $22
    scf
    dec  hl

label_2B64D::
    ld   b, l
    inc  h
    call nz, label_DF46

label_2B652::
    call nz, label_2347

label_2B655::
    ld   d, h
    inc  l
    ld   d, l
    jr   z, label_2B6BA
    daa
    add  a, h
    ld   h, c
    ldi  [hl], a
    ld   h, h
    jr   z, label_2B6C6
    rst  $18
    ld   h, [hl]
    dec  c

label_2B664::
    add  a, h
    ld   [hl], b
    rst  $18
    ld   sp, $E0CB
    nop
    inc  bc
    ld   c, b
    ld   d, b
    cp   $05
    sub  a, h
    add  a, e
    ld   [de], a
    ld   l, e
    inc  de
    ld   l, c
    add  a, e
    ldi  [hl], a
    ld   l, c
    inc  hl
    add  a, d
    add  a, e
    ld   d, $6B
    rla
    ld   l, c
    add  a, e
    ld   h, $69
    daa
    add  a, d
    adc  a, d
    nop
    ld   l, l
    adc  a, d
    ld   b, b
    ld   l, l
    jp   label_2AC10
    jp   label_2AC19
    call nz, label_2A501
    adc  a, d
    ld   d, b
    add  a, e
    adc  a, d
    ld   h, b
    add  a, h
    adc  a, d
    ld   [hl], b
    add  a, h
    ld   b, e
    ld   h, h
    add  a, e
    ld   b, h
    inc  b
    add  a, d
    ld   h, b
    ld   c, e
    add  a, d
    ld   [hl], b
    ld   c, e
    add  a, d
    ld   l, b
    ld   c, e
    add  a, d
    ld   a, b
    ld   c, e
    pop  hl
    inc  bc
    ld   h, [hl]
    ld   c, b
    ld   d, b
    cp   $0C
    sbc  a, l

label_2B6B6::
    nop
    rst  $18
    ld   bc, $8325
    ld   [bc], a
    ld   hl, label_2605
    ld   b, $DF
    add  hl, bc
    rst  $18
    db   $10
    db   $25
    ld   de, label_1529
    ld   a, [hli]
    ld   d, $26
    rla
    rst  $18
    jp   label_2320
    ld   h, $2A
    daa
    ld   h, $82
    jr   z, label_2B6B6
    add  a, e
    inc  [hl]
    xor  a
    scf
    ld   a, [hli]
    add  a, d
    jr   c, label_2B700
    ld   b, c
    and  [hl]
    ld   b, e
    xor  a
    add  a, e
    ld   b, h
    ld   bc, $AE47
    ld   d, b
    daa
    ld   d, c
    dec  hl
    add  a, h
    ld   d, e
    or   b
    ld   e, b
    and  a
    ld   h, b
    rst  $18
    ld   h, c
    daa
    add  a, h
    ld   h, d
    ldi  [hl], a
    ld   h, [hl]
    dec  hl
    ld   l, b
    xor  [hl]
    add  a, l
    ld   [hl], c
    rst  $18
    db   $76 ; Halt

label_2B700::
    daa
    add  a, e
    ld   [hl], a
    ldi  [hl], a
    inc  bc
    and  e
    ld   [rJOYP], a
    sbc  a, h
    ld   e, b
    db   $10
    db   $FE
    inc  c
    sbc  a, l
    add  a, e
    nop
    rst  $18
    dec  b
    rst  $18
    jp   nz, label_DF10
    add  a, e
    ld   d, $DF
    add  a, h
    ld   hl, label_29DF
    rst  $18
    add  a, h
    jr   nc, label_2B742
    inc  [hl]
    ld   h, $83
    dec  [hl]
    rst  $18
    add  a, d
    ld   b, d
    ld   c, $44
    ld   a, [hli]
    add  a, d
    ld   b, l
    ld   hl, label_2647
    ld   c, b
    rst  $18
    add  a, h
    ld   d, c
    ld   c, $82
    ld   d, l
    dec  de
    ld   d, a
    ld   a, [hli]
    ld   e, b
    ld   hl, label_2659
    add  a, e
    ld   h, c
    ld   c, $82

label_2B742::
    ld   h, h
    dec  de
    ld   l, c
    inc  h
    adc  a, c
    ld   [hl], b
    ldi  [hl], a
    ld   a, c
    jr   z, label_2B7A4
    and  e
    ld   [rJOYP], a
    sbc  a, l
    jr   c, label_2B782
    cp   $0C
    ld   c, $00
    rst  $18
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2B7DE
    rst  $18
    ld   [hl], c
    daa
    ld   [hl], e
    dec  hl
    ld   [hl], h
    ld   c, $75
    inc  l
    ld   a, b
    jr   z, label_2B7F3
    rst  $18
    ld   [rJOYP], a
    ld   l, $58

label_2B77F::
    jr   nz, label_2B77F
    inc  c

label_2B782::
    dec  c

label_2B783::
    nop
    dec  c
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, $C329
    ld   [de], a
    db   $10
    db   $13
    dec  h
    add  a, d
    inc  d
    ld   hl, label_2616
    jp   label_1117
    jr   label_2B7C8
    add  hl, de
    ld   h, $23
    inc  hl
    add  a, d
    inc  h

label_2B7A4::
    dec  de
    ld   h, $24
    inc  sp
    daa
    add  a, d
    inc  [hl]
    ldi  [hl], a
    ld   [hl], $28
    ld   b, d
    add  a, a
    ld   d, d
    adc  a, $84
    ld   b, e
    ld   [de], a
    ld   b, a
    add  a, a
    ld   d, a
    adc  a, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2B832
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2B841

label_2B7C8::
    dec  c
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    add  a, a
    jr   z, label_2B7E0
    cp   $0C
    sbc  a, l
    call nz, label_DF00
    call nz, label_DF21
    ld   [bc], a
    nop
    rst  0
    inc  bc
    inc  hl

label_2B7DE::
    rst  0
    ld   b, $24
    jp   label_DF07
    add  hl, bc
    nop
    ld   [de], a
    rst  $18
    jp   label_DF18
    add  hl, de
    rst  $18
    ldi  [hl], a
    nop
    add  hl, hl
    nop
    scf
    nop

label_2B7F3::
    ld   b, b

label_2B7F4::
    nop
    ld   b, d
    rst  $18
    ld   b, a
    rst  $18
    jp   nz, label_48
    jp   nz, label_52
    ld   d, a
    nop
    jp   label_DF59
    jp   nz, label_DF60
    jp   nz, label_DF68
    ld   [hl], c
    rst  $18
    ld   [hl], e
    daa
    add  a, d
    ld   [hl], h
    ldi  [hl], a
    db   $76 ; Halt
    jr   z, label_2B879
    set  4, b
    nop
    sub  a, d
    ld   e, b
    ld   d, d
    cp   $0C
    dec  c
    nop
    rst  $18
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de

label_2B82C::
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b

label_2B832::
    inc  l
    ld   l, c
    jr   z, label_2B8A6
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2B8B5
    rst  $18
    inc  bc
    rst  0
    ld   b, $C7

label_2B841::
    add  a, d
    inc  d
    dec  de
    add  a, h
    inc  hl
    dec  de
    add  a, h
    inc  sp
    dec  de
    add  a, d
    ld   b, h
    dec  de
    ld   [hl], h
    dec  a
    ld   [rJOYP], a
    db   $F4 ; Undefined instruction
    jr   label_2B874
    cp   $0C
    dec  c
    nop
    rst  $18
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2B8E0
    rst  $18
    ld   [hl], c
    daa
    ld   a, b

label_2B874::
    jr   z, label_2B8EF
    rst  $18
    inc  bc
    rst  0

label_2B879::
    ld   b, $C7
    add  a, d
    inc  d
    dec  de
    add  a, h
    inc  hl
    dec  de
    add  a, h
    inc  sp
    dec  de
    add  a, d
    ld   b, h
    dec  de
    ld   hl, label_31C5
    add  a, $24
    sbc  a, e
    dec  h
    sbc  a, h
    ld   [hl], h
    dec  a
    ld   [rJOYP], a
    db   $F4 ; Undefined instruction
    jr   label_2B8B6
    cp   $0C
    sub  a, l
    add  a, d
    nop
    rst  $18
    ld   [bc], a
    inc  hl
    add  a, h
    inc  bc
    ld   c, $06
    ld   a, [hli]
    rlca
    ld   h, $C2

label_2B8A6::
    ld   [$C2DF], sp
    add  hl, bc
    dec  c
    jp   nz, label_D10
    ld   de, label_12DF
    daa
    inc  de
    dec  hl
    add  a, e

label_2B8B5::
    inc  d

label_2B8B6::
    ld   c, $17
    inc  h
    jp   nz, label_D21
    ldi  [hl], a
    rst  $18
    inc  hl
    daa
    inc  h
    dec  hl
    add  a, d
    dec  h
    dec  de
    daa
    ld   a, [hli]
    jr   z, label_2B8EF
    add  hl, hl
    rst  $18
    jp   nz, label_D32
    inc  sp
    rst  $18
    inc  [hl]
    daa
    dec  [hl]
    dec  hl
    add  a, d
    ld   [hl], $1B
    jr   c, label_2B903
    add  hl, sp
    ld   h, $40
    dec  c
    add  a, d
    ld   b, d
    dec  c

label_2B8E0::
    jp   nz, label_DF44
    ld   b, l
    inc  hl
    ld   b, [hl]
    dec  de
    jp   label_2449
    ld   d, c
    dec  c
    ld   d, d
    rst  $18
    ld   d, l

label_2B8EF::
    daa
    ld   d, [hl]
    dec  hl
    jp   nz, label_DF63
    jp   nz, label_D64
    jp   nz, label_DF65
    ld   h, [hl]
    inc  hl
    ld   [hl], b
    rst  $18
    db   $76 ; Halt
    daa
    add  a, d

label_2B902::
    ld   [hl], a

label_2B903::
    ldi  [hl], a
    ld   a, c
    jr   z, label_2B96F
    set  4, b
    nop
    ld   sp, hl
    ld   a, b
    ld   d, b
    cp   $0C
    sub  a, b
    jp   nz, label_2300
    add  a, d
    ld   [bc], a
    dec  de
    jp   nz, label_2404
    add  a, e
    dec  b
    rst  $18
    add  a, e
    ld   de, label_151B
    rst  $18
    jr   label_2B902
    jr   nz, label_2B94C
    ld   hl, label_222B
    dec  de
    inc  hl
    ld   c, $24
    ld   a, [hli]
    dec  h
    ld   h, $82
    ld   h, $0D
    jp   label_DF29
    jp   nz, label_DF30
    ld   sp, $8323
    ldd  [hl], a
    ld   c, $35
    ld   a, [hli]
    ld   [hl], $26
    scf
    rst  $18
    jr   c, label_2B952
    ld   b, c
    daa
    ld   b, d
    dec  hl
    add  a, e
    ld   b, e
    ld   c, $46
    ld   a, [hli]
    ld   b, a
    ld   h, $48
    rst  $18

label_2B952::
    ld   d, b
    dec  c
    ld   d, c
    rst  $18
    ld   d, d
    daa
    ld   d, e
    dec  hl
    add  a, e
    ld   d, h
    ld   c, $57
    ld   a, [hli]
    ld   e, c
    ld   h, $61
    dec  c
    ld   h, d
    rst  $18
    ld   h, e
    daa
    ld   h, h
    ldi  [hl], a
    ld   h, l
    dec  hl
    add  a, e
    ld   h, [hl]
    ld   c, $69

label_2B96F::
    inc  h
    ld   [hl], d
    dec  c
    add  a, d
    ld   [hl], e
    rst  $18
    ld   [hl], l
    daa
    add  a, e
    db   $76 ; Halt
    ldi  [hl], a
    ld   a, c
    jr   z, label_2B9E5
    dec  de
    ld   bc, label_2980D
    and  e
    ld   [rJOYP], a
    adc  a, a
    ld   [$FE20], sp
    inc  c
    dec  b
    inc  b
    ld   b, a
    nop
    rst  $18
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2BA15
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2BA24
    rst  $18
    ldi  [hl], a
    rrca
    ld   [hl], $0F
    ld   sp, label_2840F
    rrca
    ld   h, a
    rrca
    add  a, d
    dec  h
    rrca
    add  hl, sp
    ld   a, [hli]
    ld   c, c
    dec  b
    ld   e, c
    inc  l
    jr   c, label_2B96F
    ld   b, d
    xor  [hl]
    ld   h, d
    xor  [hl]
    cp   $0C
    dec  c
    nop
    rst  $18
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, label_1829
    ld   a, [hli]
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2BA51
    rst  $18
    ld   [hl], c
    daa
    ld   a, b

label_2B9E5::
    jr   z, label_2BA60
    rst  $18
    ldi  [hl], a
    dec  b
    ld   [hl], $05
    ld   sp, label_28405
    dec  b
    ld   h, a
    dec  b
    add  a, d
    dec  h
    dec  b
    jr   nc, label_2BA20
    ld   b, b
    dec  b
    ld   d, b
    dec  hl
    ld   d, a
    set  4, b
    nop
    rst  8
    ld   e, b
    db   $10
    db   $FE
    inc  b
    dec  c
    adc  a, b
    ld   bc, $8899
    ld   de, label_219A
    adc  a, $23
    adc  a, $26
    adc  a, $28
    adc  a, $51
    adc  a, $53
    adc  a, $56
    adc  a, $58
    adc  a, $74
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    or   b

label_2BA20::
    jr   c, label_2BA54
    cp   $0C

label_2BA24::
    dec  c
    nop
    dec  c
    ld   bc, label_825
    ld   h, $09
    rst  $18
    db   $10
    db   $25
    ld   de, $C329
    ld   [de], a
    db   $10
    db   $13
    dec  h
    add  a, d
    inc  d
    ld   hl, label_2616
    jp   label_1117
    jr   label_2BA6A
    add  hl, de
    ld   h, $23
    inc  hl
    add  a, d
    inc  h
    dec  de
    ld   h, $24
    inc  sp
    daa
    add  a, d
    inc  [hl]
    ldi  [hl], a
    ld   [hl], $28
    ld   b, d

label_2BA51::
    add  a, a
    ld   d, d
    adc  a, $84
    ld   b, e
    ld   [de], a
    ld   b, a
    add  a, a
    ld   d, a
    adc  a, $60
    daa
    ld   h, c
    dec  hl
    ld   l, b

label_2BA60::
    inc  l
    ld   l, c
    jr   z, label_2BAD4
    rst  $18
    ld   [hl], c
    daa
    ld   a, b
    jr   z, label_2BAE3

label_2BA6A::
    dec  c
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    rra
    jr   c, label_2BAC2
    cp   $0C
    dec  c
    add  a, h
    ld   de, $851B
    ld   hl, $861B
    ld   sp, $861B
    ld   b, c
    dec  de
    add  a, a

label_2BA82::
    ld   d, c
    dec  de
    adc  a, b

label_2BA85::
    ld   h, c
    dec  de
    dec  h
    rrca
    ld   d, c
    ld   c, $83
    ld   h, c
    ld   c, $15
    and  b
    ld   [hl], h
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    jr   c, label_2BAEE

label_2BA96::
    jr   nc, label_2BA96
    inc  b
    sbc  a, l
    adc  a, d
    nop
    rst  $18
    add  a, d
    db   $10
    db   $DF
    add  a, d
    jr   label_2BA82
    add  a, d
    jr   nz, label_2BA85
    add  a, d
    daa
    rst  $18
    add  a, l

label_2BAAA::
    inc  [hl]
    rst  $18
    jp   nz, label_DF29
    add  a, d
    ld   b, h
    rst  $18
    add  a, d
    ld   d, h
    rst  $18
    add  a, d
    ld   [hl], h
    rst  $18
    inc  de
    dec  h
    add  a, d
    inc  d
    ld   hl, label_2616
    ldi  [hl], a
    dec  h
    inc  hl

label_2BAC2::
    add  hl, hl
    add  a, d
    inc  h
    dec  b

label_2BAC6::
    ld   h, $2A
    daa

label_2BAC9::
    ld   h, $32
    inc  hl
    add  a, h
    inc  sp
    dec  b
    scf
    inc  h
    ld   b, d
    daa
    ld   b, e

label_2BAD4::
    dec  hl
    add  a, d
    ld   b, h
    dec  b
    ld   b, [hl]
    inc  l
    ld   b, a
    jr   z, label_2BB30
    daa
    add  a, d
    ld   d, h
    ldi  [hl], a
    ld   d, [hl]
    jr   z, label_2BB08
    and  b
    ld   b, l
    set  4, b

label_2BAE8::
    nop
    ld   a, b
    jr   z, label_2BB5C
    cp   $00

label_2BAEE::
    sbc  a, l
    add  a, a
    nop
    rst  $18
    dec  b
    dec  c
    call nz, label_2307
    add  a, $09
    inc  h
    add  a, d
    ld   de, $C3DF
    inc  d
    dec  b
    jr   nz, label_2BB07
    dec  h
    rst  $18
    jp   label_DF28

label_2BB07::
    jr   nc, label_2BAE8
    add  a, e
    ld   b, b
    rst  $18
    ld   b, h
    rst  $18
    ld   b, l
    dec  h
    ld   b, [hl]
    ld   hl, label_2947
    ld   d, d
    dec  b
    ld   d, e
    rst  $18
    jp   nz, label_2355
    add  a, d
    ld   d, a
    rst  $18
    ld   h, b
    rst  $18
    ld   h, h
    rst  $18
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2BAAA
    ld   [hl], d
    rst  $18
    ld   [hl], l
    daa
    ld   a, b
    jr   z, label_2BBA7
    rst  $18
    db   $76 ; Halt

label_2BB30::
    db   $FD ; Undefined instruction
    ld   [rJOYP], a
    inc  de
    ld   e, b
    db   $10
    db   $FE
    dec  b
    sub  a, h
    adc  a, d
    nop
    add  a, h
    adc  a, d
    db   $10
    db   $84
    adc  a, d
    jr   nz, label_2BAC6
    adc  a, d
    jr   nc, label_2BAC9
    adc  a, d
    ld   b, b
    add  a, h
    adc  a, d
    ld   d, b
    add  a, h
    adc  a, d
    ld   h, b
    add  a, h
    adc  a, d
    ld   [hl], b
    add  a, h
    add  a, d
    nop
    ld   c, e
    add  a, d
    ld   [label_104B], sp
    ld   c, e
    add  hl, de
    ld   c, e
    ld   h, b

label_2BB5C::
    ld   [hl], d
    ld   h, c
    ld   [hl], e
    ld   l, b
    ld   [hl], h
    ld   l, c
    ld   [hl], d
    add  a, e
    ld   [hl], b
    ld   [hl], d
    ld   [hl], e
    ld   [hl], e
    ld   [hl], h
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    db   $76 ; Halt
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    ld   [hl], d
    pop  hl
    inc  bc
    ld   h, [hl]
    ld   c, b
    ld   d, b
    cp   $B7
    ld   a, e
    cp   [hl]
    ld   a, e
    and  $7B
    add  hl, sp
    ld   a, h
    ld   b, b
    ld   a, h
    ld   h, [hl]
    ld   a, h
    adc  a, l
    ld   a, h
    or   [hl]
    ld   a, h
    db   $ED ; Undefined instruction
    ld   a, h
    dec  hl
    ld   a, l
    ld   d, c
    ld   a, l
    adc  a, e
    ld   a, l
    or   d
    ld   a, l
    add  a, $7D
    push af
    ld   a, l
    ld   h, $7E
    ld   b, h
    ld   a, [hl]
    ld   [hl], l
    ld   a, [hl]
    xor  l
    ld   a, [hl]
    rst  $10
    ld   a, [hl]
    rst  $28
    ld   a, [hl]
    ld   [de], a
    ld   a, a
    nop
    ld   b, d
    nop
    ld   b, d

label_2BBA7::
    nop
    ld   b, d
    nop
    ld   b, d
    nop
    ld   b, d
    nop
    ld   b, d
    nop
    ld   b, d
    nop
    ld   b, d
    nop

label_2BBB4::
    ld   b, d
    nop
    ld   b, d
    inc  c
    dec  c
    ld   [hl], h
    pop  af
    add  hl, sp
    di
    cp   $0C
    dec  c
    jr   nc, label_2BBB4
    ld   [bc], a
    rst  0
    rlca
    rst  0
    ld   [hl], d
    ret  z
    ld   [hl], a
    ret  z
    jp   label_1012
    jp   label_1117
    add  a, h
    ld   b, e
    ld   [de], a
    ld   b, d
    sub  a, h
    ld   b, a
    sub  a, e
    add  a, h
    inc  de
    dec  de
    add  a, h
    inc  hl
    dec  de
    add  a, h
    inc  sp
    dec  de
    ld   [rJOYP], a
    ld   [hl], a
    ld   a, b
    ld   l, $FE
    inc  b
    dec  c
    add  hl, sp
    rst  $30
    ld   [bc], a

label_2BBEB::
    ld   h, $03
    ld   a, [hli]
    inc  b
    ld   hl, label_2905
    ld   b, $25
    inc  de
    ret  nz
    inc  hl
    dec  d
    jp   nz, label_2412
    inc  d
    and  b
    inc  h
    rrca
    dec  d
    ret  nz
    dec  h
    inc  d
    jp   nz, label_2316
    ldd  [hl], a
    ld   a, [hli]
    add  a, e

label_2BC09::
    inc  sp
    ld   hl, $9834
    ld   [hl], $29
    ld   b, e
    rrca
    ld   b, l
    rrca
    ld   h, e
    rrca
    ld   h, l
    rrca
    ld   [$C226], sp
    add  hl, bc
    inc  bc
    jr   z, label_2BC48
    add  hl, hl
    ld   h, $18
    inc  h
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_2BC9F
    jr   z, label_2BBEB
    ld   l, c
    inc  bc

label_2BC2B::
    ld   l, b
    inc  h
    ld   [hl], d
    ret  z
    db   $76 ; Halt
    ret  z

label_2BC31::
    ld   de, label_17AC
    xor  h
    jp   label_A746
    cp   $04
    dec  c
    ld   [hl], h
    pop  af
    jr   nc, label_2BC31
    cp   $04
    dec  c
    add  hl, sp
    rst  $30
    inc  bc
    rst  0
    inc  b
    ld    hl, sp+$06
    rst  0
    add  a, d
    ld   de, $82AF
    ld   hl, $8201
    ld   sp, $8501
    inc  sp
    xor  a

label_2BC56::
    add  a, a
    ld   b, c
    ld   bc, label_29187
    ld   bc, label_29187
    or   b
    jp   nz, label_DC17
    add  a, [hl]
    ld   h, d
    db   $DB
    cp   $04
    dec  c
    ld   [hl], h
    pop  af
    jr   nc, label_2BC5A
    ld   [bc], a
    rst  0
    rlca
    rst  0
    inc  hl
    rrca
    ld   h, $0F
    ld   d, e
    rrca
    ld   d, [hl]
    rrca
    add  a, d
    ld   de, $8220
    rla
    jr   nz, label_2BCA0
    jr   nz, label_2BCA9
    jr   nz, label_2BCD4
    jr   nz, label_2BCDD
    jr   nz, label_2BC09
    ld   h, c
    jr   nz, label_2BC0C
    ld   h, a

label_2BC8B::
    jr   nz, label_2BC8B
    inc  b
    dec  c
    ld   [hl], h
    push af
    add  hl, sp
    rst  $30
    inc  bc
    rst  0
    ld   b, $C7
    add  hl, hl
    jp   z, label_CA59
    jr   nz, label_2BC66
    ld   d, b
    ret

label_2BC9F::
    inc  sp

label_2BCA0::
    jr   nz, label_2BCE6
    jr   nz, label_2BC66
    ld   d, c
    jr   nz, label_2BC2B
    ld   d, l
    jr   nz, label_2BD12
    jr   nz, label_2BCCF
    and  [hl]
    inc  [hl]
    and  [hl]
    ld   b, l

label_2BCB0::
    and  [hl]
    ld   d, [hl]
    and  [hl]
    jr   z, label_2BC56
    cp   $04
    dec  c
    jr   nc, label_2BCB0
    ld   [bc], a
    rst  0
    rlca
    rst  0
    add  a, d
    inc  [hl]
    rrca
    add  a, d
    ld   b, h
    rrca
    ld   [de], a
    ld   e, b
    ld   hl, label_2259
    ld   e, d
    inc  hl
    ld   e, e
    ldd  [hl], a
    ld   e, h
    rla

label_2BCCF::
    ld   e, l
    ld   h, $5E
    daa
    ld   e, a

label_2BCD4::
    jr   z, label_2BD36
    scf
    ld   h, c
    ld   b, d
    ld   h, d
    ld   d, c
    ld   h, e
    ld   d, d

label_2BCDD::
    ld   h, h
    ld   d, e
    ld   h, l
    ld   h, d
    ld   h, [hl]
    ld   b, a
    ld   e, b
    ld   d, [hl]
    ld   e, c

label_2BCE6::
    ld   d, a
    ld   e, d
    ld   e, b
    ld   e, e
    ld   h, a
    ld   e, h
    cp   $04
    dec  c
    ld   [hl], h
    push af
    add  hl, sp
    rst  $30
    add  a, h
    inc  hl
    rrca
    inc  sp
    rrca
    add  a, d
    dec  [hl]
    rrca
    ld   b, e
    rrca
    ld   b, [hl]
    rrca
    add  a, h
    ld   d, e
    rrca
    nop
    inc  bc
    ld   bc, label_1025
    dec  h
    ld   de, label_829
    ld   h, $09
    inc  bc
    jr   label_2BD3A
    add  hl, de
    ld   h, $60
    daa
    ld   h, c
    dec  hl
    ld   [hl], b
    inc  bc
    ld   [hl], c
    daa
    ld   l, b
    inc  l
    ld   l, c
    jr   z, label_2BD97
    jr   z, label_2BD9A

label_2BD21::
    inc  bc
    ld   [de], a
    xor  h
    rla
    xor  h
    ld   h, d
    xor  h
    ld   h, a
    xor  h
    cp   $04
    dec  c
    jr   nc, label_2BD21
    inc  b
    db   $EC ; Undefined instruction
    inc  bc
    rst  0
    ld   b, $C7
    add  a, l

label_2BD36::
    inc  de
    ld   d, d
    add  a, e
    inc  h

label_2BD3A::
    ld   d, d
    dec  [hl]
    ld   d, d
    push bc
    ld   hl, $C350
    ldd  [hl], a
    ld   d, b
    ld   b, e
    ld   d, b
    ld   h, l
    ld   d, c
    jp   nz, label_29156
    jp   label_29147
    call nz, label_29138
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF39]
    di
    add  a, l
    ldi  [hl], a
    rrca
    ldd  [hl], a
    rrca
    inc  [hl]
    rrca
    ld   [hl], $0F
    add  a, l
    ld   b, d
    rrca
    ld   d, d
    rrca
    ld   d, h
    rrca
    ld   d, [hl]
    rrca
    add  a, l
    ld   h, d
    rrca
    ld   de, label_2A1AC
    xor  h
    rla
    xor  h
    ld   h, a
    xor  h
    ld   [$C226], sp
    add  hl, bc
    inc  bc
    jr   z, label_2BDA5
    add  hl, hl
    ld   h, $18
    inc  h
    ld   e, b
    inc  l
    ld   e, c
    jr   z, label_2BDFC
    jr   z, label_2BD48
    ld   l, c
    inc  bc
    ld   l, b
    inc  h
    cp   $04

label_2BD8C::
    dec  c
    inc  b
    ld   a, [$FF30]
    ld   a, [$FF00+C]

label_2BD92::
    rst  $30
    ld   de, label_2A88E
    jr   nz, label_2BDAB
    or   b
    add  a, d

label_2BD9A::
    ld   d, $B0
    add  a, l
    ld   h, d
    xor  a
    jp   label_29432
    call nz, label_29323

label_2BDA5::
    call nz, label_29524
    call nz, label_29425

label_2BDAB::
    call nz, label_29326
    jp   label_29527
    cp   $04
    dec  c
    ld   [hl], h
    pop  af
    jr   nc, label_2BDAA
    pop  bc
    ld   hl, $C1D4
    jr   z, label_2BD92
    add  a, d
    ld   b, h
    call nc, label_D461
    ld   l, b
    call nc, label_4FE
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    ld   [hl], h
    push af
    add  a, h
    inc  hl
    ld   d, e
    add  a, [hl]
    ldd  [hl], a
    ld   d, e
    add  a, [hl]
    ld   b, d
    ld   d, e
    add  a, h
    ld   d, e
    ld   d, e
    inc  h
    ld   d, l
    jp   nz, label_29532
    jp   nz, label_29535
    ld   d, e
    ld   d, l
    dec  h
    ld   d, h

label_2BDE4::
    jp   nz, label_29433
    jp   nz, label_29436
    ld   d, h
    ld   d, h
    ld   sp, label_281AF
    or   b
    jr   c, label_2BDA1
    ld   c, b
    or   b
    cp   $04
    dec  c
    add  hl, sp
    di
    ld   [hl], h
    push af
    add  a, d

label_2BDFC::
    ld   de, $8220
    rla
    jr   nz, label_2BE23
    jr   nz, label_2BE65
    jr   nz, label_2BE2E
    jr   nz, label_2BE70
    jr   nz, label_2BD8C
    inc  d
    ld   d, c
    add  a, [hl]
    ldi  [hl], a
    ld   d, c
    add  a, d
    ld   b, c
    ld   d, b
    add  a, d
    ld   b, a
    ld   d, b
    add  a, e
    ld   d, c
    ld   d, b
    add  a, e
    ld   d, [hl]
    ld   d, b
    add  a, d
    ld   h, d
    ld   d, b
    add  a, d
    ld   h, [hl]
    ld   d, b
    inc  de

label_2BE22::
    xor  h

label_2BE23::
    ld   d, $AC
    cp   $04
    dec  c
    ld   [hl], h
    ld   b, b
    jr   nc, label_2BE22
    add  hl, sp
    rst  $30

label_2BE2E::
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    ld   e, c
    inc  l
    add  a, [hl]
    ldi  [hl], a
    rrca
    jp   nz, label_F32
    jp   nz, label_F37
    add  a, [hl]
    ld   d, d
    rrca
    jr   z, label_2BDE4
    cp   $04
    dec  c
    inc  b
    db   $EC ; Undefined instruction
    ld   [hl], h
    ei
    jr   nc, label_2BE42
    add  hl, sp

label_2BE4D::
    rst  $30
    add  hl, hl
    ld   a, [hli]
    jp   nz, label_D39
    ld   e, c
    inc  l
    jr   nz, label_2BE80
    jp   nz, label_D30
    ld   d, b
    dec  hl
    add  a, $12
    ld   d, e
    push bc
    inc  de
    ld   d, e
    jp   label_29334

label_2BE65::
    jp   label_29335
    call nz, label_29336
    add  a, $17
    ld   d, e
    ld   b, h
    ld   d, l

label_2BE70::
    ld   d, l
    ld   d, h
    ld   h, e

label_2BE73::
    jr   nz, label_2BE73
    inc  b
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    ld   [hl], h
    push af
    jr   nc, label_2BE73
    jr   nz, label_2BEA8
    jp   nz, label_D30
    ld   d, b
    dec  hl
    ld   [bc], a
    rst  0
    rlca
    rst  0
    ld   [hl], d
    ret  z
    ld   [hl], a
    ret  z
    add  hl, hl
    jp   z, label_CA59
    dec  [hl]
    and  [hl]
    ld   b, h
    and  [hl]
    ld   d, e
    and  [hl]
    ld   [de], a
    ld   e, l
    ld   hl, label_225E
    ld   e, a
    inc  hl
    ld   h, b
    ldd  [hl], a
    ld   h, c
    ld   b, a

label_2BEA1::
    ld   e, b
    ld   d, [hl]
    ld   e, c

label_2BEA4::
    ld   d, a
    ld   e, d
    ld   e, b

label_2BEA7::
    ld   e, e

label_2BEA8::
    ld   h, a
    ld   e, h
    jr   z, label_2BE4D
    cp   $04
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    call nz, label_F21
    call nz, label_F28
    add  a, [hl]
    ld   [de], a
    rrca
    add  a, [hl]
    ld   h, d
    rrca
    jp   label_C022
    jp   label_C027
    inc  hl
    ret  nz
    ld   h, $C0
    ld   de, label_18AC
    xor  h
    ld   h, c
    xor  h
    ld   l, b
    xor  h
    ld   d, l
    set  4, b
    nop
    ld   [hl], a
    ld   a, b
    ld   l, $FE
    inc  b
    dec  c
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    dec  a
    dec  b
    ld   hl, label_2385
    ld   d, [hl]
    add  a, [hl]
    ldd  [hl], a
    ld   d, a
    add  a, [hl]
    ld   b, d
    ld   d, [hl]
    add  a, [hl]
    ld   d, d
    ld   d, a
    add  a, l
    ld   h, e
    ld   d, [hl]
    cp   $04
    dec  c
    inc  b
    ld   a, [$F339]
    jp   nz, label_29321
    jp   nz, label_29322
    jp   nz, label_29323
    push bc
    inc  h
    ld   d, e
    push bc
    dec  h
    ld   d, e
    push bc
    ld   h, $53
    inc  [hl]
    ld   d, l
    ld   b, l
    ld   d, h
    inc  bc
    rst  0
    ld   b, $C7
    ld   d, d
    and  b
    cp   $04
    dec  c
    inc  b
    ld   a, [$FF30]
    ld   a, [$FF00+C]
    ld   de, $8220
    rla
    jr   nz, label_2BEA1
    ld   h, c
    jr   nz, label_2BEA4
    ld   h, a
    jr   nz, label_2BEA7
    inc  [hl]
    xor  a
    add  a, d
    ld   b, h
    or   b
    inc  de
    ld   d, c
    add  a, e
    ld   hl, label_1651
    ld   d, c
    add  a, e
    ld   h, $51
    ld   h, e
    ld   d, b
    add  a, e
    ld   d, c
    ld   d, b
    ld   h, [hl]
    ld   d, b
    add  a, e
    ld   d, [hl]
    ld   d, b
    ld   [bc], a
    rst  0
    rlca
    rst  0
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
