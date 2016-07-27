section "bank6",romx,bank[$06]

label_18000::
    ld   d, b
    inc  bc
    ld   d, d
    inc  bc
    ld   d, h
    inc  bc
    ld   d, [hl]
    inc  bc
    ld   d, b
    inc  bc
    ld   d, d
    inc  bc
    ld   d, h
    inc  bc
    ld   d, [hl]
    inc  bc
    ld   e, b
    inc  bc
    ld   e, d
    inc  bc
    ld   e, h
    inc  bc
    ld   e, [hl]
    inc  bc
    ld   e, d
    inc  hl
    ld   e, b
    inc  hl
    ld   e, [hl]
    inc  hl
    ld   e, h
    inc  hl
    ld   a, $21
    ld   [$FFEC], a
    ld   de, label_18000
    call label_3BC0
    call label_1A4C6
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1803B
    call label_1A5B4
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_1803B::
    call label_1A441
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_18049
    call label_1A41A

label_18049::
    ld   a, [$FFF0]
    rst  0
    ld   d, [hl]
    ld   b, b
    ld   l, b
    ld   b, b
    push bc
    ld   b, b
    ret  c
    ld   b, b
    jp   [hl]
    ld   b, b
    call label_3B12
    ld   a, [$DB15]
    cp   $06
    ret  c
    ld   [hl], $04
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $58
    ret
    call label_1A45D
    ret  nc
    ld   a, [$DB56]
    and  a
    jr   z, label_18077
    ld   e, $2D
    jp   label_180C1

label_18077::
    ld   a, [$FFF8]
    and  $10
    jr   z, label_18083
    ld   a, [$DB15]
    and  a
    jr   nz, label_180A0

label_18083::
    ld   a, [$FFF8]
    or   $10
    ld   [$FFF8], a
    ld   [$DAC7], a
    ld   a, $3A
    call label_2373
    ld   a, [$DB55]
    cp   $02
    jr   nc, label_1809D
    ld   a, $02
    ld   [$DB55], a

label_1809D::
    jp   label_3B12

label_180A0::
    ld   e, $3F
    cp   $05
    jr   c, label_180C1
    call label_3B12
    ld   [hl], $03
    call label_C05
    ld   [hl], $20
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $01
    ld   a, $FF
    ld   [$DB15], a
    ld   a, $09
    ld   [$FFA5], a
    ld   e, $3D

label_180C1::
    ld   a, e
    jp   label_2373
    ld   a, [$C177]
    and  a
    ld   a, $3B
    jr   z, label_180CF
    ld   a, $3C

label_180CF::
    call label_2373
    call label_3B12
    ld   [hl], $01
    ret
    call label_C05
    jr   nz, label_180E0
    call label_3B12

label_180E0::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $F8
    jp   label_1A54E
    call label_1A45D
    jr   nc, label_180FC
    ld   a, [$DB15]
    cp   $06
    ld   a, $3E
    jr   z, label_180F9
    ld   a, $3D

label_180F9::
    call label_2373

label_180FC::
    ld   a, [$FF98]
    sub  a, $78
    add  a, $02
    cp   $04
    ret  nc
    ld   a, [$FF99]
    sub  a, $20
    add  a, $05
    cp   $0A
    ret  nc
    ld   hl, $D401
    ld   a, $01
    ldi  [hl], a
    ld   a, $11
    ldi  [hl], a
    ld   a, $D8
    ldi  [hl], a
    ld   a, $88
    ldi  [hl], a
    ld   a, $70
    ldi  [hl], a
    call label_1A5DB
    jp   label_C7D

label_18126::
    rst  $38
    nop
    rst  $38
    jr   nz, label_1819B
    ld   [bc], a
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], h
    ld   [bc], a
    db   $76 ; Halt
    ld   [bc], a
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], h
    ldi  [hl], a

label_1813A::
    jr   z, label_18174
    ld   e, b
    ld   e, b
    ld   a, b
    adc  a, b
    jr   z, label_180CA

label_18142::
    ld   b, b
    ld   [hl], b
    jr   nz, label_18196
    ld   [hl], b
    ld   b, b
    ld   b, b
    ld   b, b
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_1A5DB
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], $3C
    ld   hl, $C460
    add  hl, bc
    ld   [hl], $FF
    ld   de, label_18126
    call label_3BC0
    call label_1A4C6
    call label_C56
    ld   a, [$FFF0]
    rst  0
    db   $76 ; Halt
    ld   b, c
    ld   a, [hl]
    ld   b, c
    or   [hl]
    ld   b, c
    jp   z, label_2241
    ld   b, d
    call label_C05
    ld   [hl], $40
    jp   label_3B12
    call label_C05
    ret  nz
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1813A
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_18142

label_18196::
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210

label_1819B::
    add  hl, bc
    ld   [hl], a
    call label_1A594
    add  a, $20
    cp   $40
    jr   nc, label_181AE
    call label_1A5A4
    add  a, $20
    cp   $40
    ret  c

label_181AE::
    call label_C05
    ld   [hl], $18
    jp   label_3B12
    call label_C05
    jr   nz, label_181C0
    ld   [hl], $30
    jp   label_3B12

label_181C0::
    cp   $0C
    ld   a, $01
    jr   nc, label_181C7
    inc  a

label_181C7::
    jp   label_3B0C
    call label_3B39
    call label_C05
    jr   nz, label_18218
    ld   [hl], $10
    call label_3B12
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_18217
    ld   a, $02
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C310
    add  hl, de
    ld   [hl], $04

label_181F8::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $18
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $40
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01
    push bc
    ld   c, e
    ld   b, d
    ld   a, $10
    call label_3BAA
    pop  bc
    ld   a, $08
    ld   [$FFF2], a

label_18217::
    ret

label_18218::
    and  $20
    ld   a, $03
    jr   nz, label_1821F
    inc  a

label_1821F::
    jp   label_3B0C
    call label_C05
    jr   nz, label_18230
    call label_3B12
    ld   [hl], b
    ld   a, $FF
    jp   label_3B0C

label_18230::
    cp   $08
    ld   a, $01
    jr   c, label_18237
    inc  a

label_18237::
    jp   label_3B0C
    call label_184B6
    call label_1A4C6
    call label_1A4F7
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1825E
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_1825E::
    ld   a, [$FFF0]
    rst  0
    ld   l, e
    ld   b, d
    ret
    ld   b, d
    inc  de
    ld   b, e
    push bc
    ld   b, e
    jr   z, label_182AF
    call label_C05
    jr   nz, label_182A2
    call label_3D7F
    call label_BFB
    jr   nz, label_18294
    call label_1A594
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  $01
    cp   e
    jr   nz, label_18294
    call label_3B12
    ld   [hl], $02
    call label_C05
    ld   [hl], $FF
    ld   a, $3B
    ld   [$FFF4], a
    ret

label_18294::
    call label_C05
    call label_280D
    and  $1F
    add  a, $10
    ld   [hl], a
    call label_3B12

label_182A2::
    ld   a, [$FFE8]
    and  a
    jr   z, label_182AD
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10

label_182AD::
    call label_1A541
    call label_3B23
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    rla
    and  $06
    call label_3B0C
    jp   label_3B39

label_182C1::
    ld   [label_8F8], sp
    ld    hl, sp+$F8
    ld    hl, sp+$08
    ld   [label_5CD], sp
    inc  c
    jr   nz, label_18310
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    call label_3B12
    ld   [hl], b
    call label_280D
    bit  2, a
    jr   z, label_182E5
    and  $03
    jr   label_182F5

label_182E5::
    call label_1A594
    push de
    call label_1A5A4
    ld   a, e
    and  $03
    dec  a
    dec  a
    sla  a
    pop  de
    or   e

label_182F5::
    ld   e, a
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   d, b
    ld   hl, label_182C1
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_182C5
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_18310::
    jp   label_182A2
    call label_3B70
    call label_C05
    jr   nz, label_1832B

label_1831B::
    call label_3B12
    ld   [hl], b
    call label_BFB
    call label_280D
    and  $1F
    add  a, $08
    ld   [hl], a
    ret

label_1832B::
    ld   a, $01
    ld   [$D3E6], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_1834B
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    sub  a, $0C
    jr   z, label_1834B
    and  $80
    jr   z, label_1834A
    inc  [hl]
    inc  [hl]

label_1834A::
    dec  [hl]

label_1834B::
    ld   a, [$FF9D]
    cp   $FF
    jr   z, label_183B8
    call label_1A594
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  $01
    cp   e
    jr   nz, label_183B8
    call label_1A594
    add  a, $40
    cp   $80
    jr   nc, label_183B8
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    push hl
    push af
    ld   a, [$FFEC]
    ld   [hl], a
    call label_1A5A4
    ld   e, a
    pop  af
    pop  hl
    ld   [hl], a
    ld   a, e
    add  a, $30
    cp   $60
    jr   nc, label_183B8
    ld   a, $08
    call label_3BB5
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   [$FF9B], a
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   [$FF9A], a
    push bc
    call label_21A8
    call label_3E19
    pop  bc
    ld   hl, $FFEE
    ld   a, [$FF98]
    sub  a, [hl]
    add  a, $04
    cp   $08
    jr   nc, label_183B8
    ld   hl, $FFEC
    ld   a, [$FF99]
    sub  a, [hl]
    add  a, $04
    cp   $08
    jr   nc, label_183B8
    call label_C05
    ld   [hl], $80
    call label_3B12

label_183B8::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    rla
    and  $06
    or   $01
    jp   label_3B0C
    call label_C05
    jr   z, label_183F5
    ld   a, [$FFE8]
    and  a
    jr   z, label_183E2
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_183E2
    inc  [hl]
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $0C
    ld   a, $09
    ld   [$FFF2], a

label_183E2::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    call label_3B0C
    ld   a, $FF
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    ret

label_183F5::
    ld   [hl], $0C
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    xor  a
    ld   [$FF9B], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  $01
    ld   a, $18
    jr   z, label_1840C
    ld   a, $E8

label_1840C::
    ld   [$FF9A], a
    ld   a, $10
    ld   [$FFA3], a
    ld   a, $20
    ld   [$DBC7], a
    ld   a, $02
    ld   [$C146], a
    ld   a, $02
    ld   [$DB94], a
    ld   a, $08
    ld   [$FFF2], a
    jp   label_3B12
    call label_C05
    jp   z, label_1831B
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    jp   label_183B8

label_18436::
    ld   h, d
    ld   hl, label_2160
    ld   l, b
    ld   hl, label_2166
    ld   h, b
    ld   bc, label_162
    ld   h, [hl]
    ld   bc, label_168
    ld   h, d
    ld   hl, label_2160
    ld   l, b
    ld   hl, label_2166
    ld   h, b
    ld   bc, label_162
    ld   h, [hl]
    ld   bc, label_168

label_18456::
    nop
    db   $FC ; Undefined instruction
    ld   h, d
    ld   hl, label_400
    ld   l, d
    ld   hl, label_C00
    ld   h, h
    ld   hl, $FC00
    ld   h, h
    ld   bc, label_400
    ld   l, d
    ld   bc, label_C00
    ld   h, d
    ld   bc, $FC00
    ld   h, d
    ld   hl, label_400
    ld   l, d
    ld   hl, label_C00
    ld   h, h
    ld   hl, $FC00
    ld   h, h
    ld   bc, label_400
    ld   l, d
    ld   bc, label_C00
    ld   h, d
    ld   bc, label_E00
    inc  h
    ld   bc, label_18F8
    inc  h
    ld   bc, label_1808
    inc  h
    ld   bc, label_13FE
    inc  h
    ld   bc, label_1303
    inc  h
    ld   bc, label_1303
    rst  $38
    ld   bc, $FA00
    inc  h
    ld   bc, $F0F8
    inc  h
    ld   bc, $F008
    inc  h
    ld   bc, $F5FE
    inc  h
    ld   bc, $F503
    inc  h
    ld   bc, $F503
    rst  $38
    ld   bc, $F1F0
    cp   $08
    jr   nc, label_184F1
    ld   de, label_18436
    call label_3BC0
    ld   a, [$FFF0]
    cp   $02
    ret  nz
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    rla
    and  $02
    ld   e, a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    or   e
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_18486
    add  hl, de
    ld   c, $03
    call label_3CE6
    ld   a, $03
    jp   label_3DA0

label_184F1::
    sub  a, $08
    rla
    rla
    and  $FC
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_18456
    add  hl, de
    ld   c, $03
    call label_3CE6
    jp   label_3CD9
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_18781
    ld   a, c
    ld   [$D202], a
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1853F
    inc  [hl]
    ld   a, $92
    call label_3B86
    ld   a, e
    ld   [$D201], a
    ld   a, [$FFD8]
    add  a, $10
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD7]
    add  a, $30
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C440
    add  hl, de
    inc  [hl]

label_1853F::
    call label_18767
    call label_3EE8
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_19308
    call label_1A4C6
    call label_1A4F7
    call label_3B39
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_18570
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_18570::
    ld   a, [$FFF0]
    rst  0
    ld   a, l
    ld   b, l
    ld   [bc], a
    ld   b, [hl]
    ld   [hl], b
    ld   b, [hl]
    ret
    ld   b, [hl]
    inc  d
    ld   b, a
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $00
    jr   nz, label_185E2
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    ld   [$FF98], a
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   [$FF99], a
    ld   a, $10
    call label_3BAA
    call label_1A541
    call label_3B23
    call label_1A594
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    add  a, $0C
    cp   $18
    jr   nc, label_185DA
    call label_1A5A4
    add  a, $0C
    cp   $18
    jr   nc, label_185DA
    call label_3B12
    ld   [hl], $02
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    call label_C05
    ld   [hl], $1F
    ld   a, $1C
    ld   [$FFF3], a

label_185DA::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jr   label_185E5

label_185E2::
    call label_3B12

label_185E5::
    ld   a, [$FFE8]
    and  a
    jr   z, label_185F0
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10

label_185F0::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  $01
    jp   label_3B0C

label_185FA::
    inc  c
    db   $F4 ; Undefined instruction
    inc  c
    db   $F4 ; Undefined instruction

label_185FE::
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $00
    jr   nz, label_18614
    call label_3B12
    ld   [hl], b

label_18614::
    call label_C05
    jr   nz, label_1863E
    call label_280D
    and  $1F
    add  a, $10
    ld   [hl], a
    and  $03
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, label_185FA
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_185FE
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_1863E::
    call label_1A541
    call label_3B23
    call label_185E5
    ld   a, [$FFE7]
    and  $08
    jr   z, label_1864F
    inc  [hl]
    inc  [hl]

label_1864F::
    ret

label_18650::
    nop
    ld   [bc], a
    inc  b
    ld   b, $08
    ld   a, [bc]
    inc  c
    ld   c, $00
    cp   $FC
    ld   a, [$F6F8]
    db   $F4 ; Undefined instruction
    ld   a, [$FF00+C]
    pop  af
    ld   a, [$FF00+C]
    or   $F8
    ld   a, [$F0FE]
    pop  af
    ld   a, [$FF00+C]
    or   $F8
    ld   a, [label_21FE]
    add  a, b
    jp   label_1BE09
    and  $01
    rla
    rla
    rla
    and  $08
    ld   e, a
    call label_C05
    jr   nz, label_18687
    ld   [hl], $20
    jp   label_3B12

label_18687::
    rra
    rra
    and  $07
    or   e

label_1868C::
    push bc
    ld   c, a
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   a, [$FFEE]
    ld   hl, label_18650
    add  hl, bc
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_18660
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    pop  bc
    ld   hl, $C310
    add  hl, bc
    add  a, [hl]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $02
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_186BD::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  $01
    or   $02
    jp   label_3B0C
    xor  a
    call label_1868C
    call label_C05
    jr   nz, label_186FB
    ld   [hl], $20
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $04
    push bc
    ld   c, e
    ld   b, d
    ld   a, $20
    call label_3BAA
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    pop  bc
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    ld   a, $08
    ld   [$FFF2], a
    jp   label_3B12

label_186FB::
    call label_185E5
    ld   a, $04
    call label_3BAA
    call label_1A594
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    call label_186BD
    call label_1A541
    jp   label_3B23
    call label_C05
    jr   nz, label_1871D
    call label_3B12
    ld   [hl], b

label_1871D::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  $01
    jp   label_3B0C

label_18727::
    nop
    db   $FC ; Undefined instruction
    ld   h, h
    ld   hl, label_400
    ld   h, d
    ld   hl, label_C00
    ld   h, b
    ld   hl, $FCF0
    ld   l, h
    ld   hl, $FC00
    ld   h, b
    ld   bc, label_400
    ld   h, d
    ld   bc, label_C00
    ld   h, h
    ld   bc, label_CF0
    ld   l, h
    ld   bc, $FC00
    ld   l, d
    ld   hl, label_400
    ld   l, b
    ld   hl, label_C00
    ld   h, [hl]
    ld   hl, $FCF0
    ld   l, h
    ld   bc, $FC00
    ld   h, [hl]
    ld   bc, label_400
    ld   l, b
    ld   bc, label_C00
    ld   l, d
    ld   bc, label_CF0
    ld   l, h
    ld   hl, $F1F0
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_18727
    add  hl, de
    ld   c, $04
    call label_3CE6
    jp   label_3CD9

label_1877D::
    ld   l, [hl]
    ld   bc, label_216E

label_18781::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $92
    ld   hl, $C5D0
    add  hl, bc
    ld   [hl], $FF
    ld   de, label_1877D
    call label_3BC0
    call label_1A4C6
    call label_C56
    call label_3B70
    call label_1A541
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE9], a
    and  $80
    ld   [$FFE8], a
    jr   z, label_187DA
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sra  a
    cpl
    cp   $07
    jr   nc, label_187C5
    xor  a
    jr   label_187C9

label_187C5::
    ld   a, $09
    ld   [$FFF2], a

label_187C9::
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    sra  [hl]
    sra  [hl]
    ld   hl, $C250
    add  hl, bc
    sra  [hl]
    sra  [hl]

label_187DA::
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    ld   [label_19347], a
    ld   c, b
    ld   d, h
    ld   c, b
    ld   d, l
    ld   c, b
    db   $48
    ld   c, b
    ld   a, [$FFE9]
    dec  a
    and  $80
    jr   z, label_18806
    ld   hl, $C250
    call label_187FA
    ld   hl, $C240

label_187FA::
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_18806
    and  $80
    jr   z, label_18805
    inc  [hl]
    inc  [hl]

label_18805::
    dec  [hl]

label_18806::
    call label_3B5A
    jr   nc, label_18852
    ld   a, [$C19B]
    and  a
    jr   nz, label_18852
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_18820
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_1882D
    jr   label_18852

label_18820::
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_18852
    ld   a, [$FFCC]
    and  $10
    jr   z, label_18852

label_1882D::
    ld   a, [$C3CF]
    and  a
    jr   nz, label_18852
    call label_3B12
    ld   [hl], $02
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $07
    ld   hl, $C490
    add  hl, bc
    ld   [hl], b
    ld   a, [$FF9E]
    ld   [$C15D], a
    call label_C05
    ld   [hl], $02
    ld   hl, $FFF3
    ld   [hl], $02

label_18852::
    ret
    ret
    ret
    ld   a, [$D202]
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jp   nc, label_188DB
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_188DB
    ld   hl, $C410
    add  hl, de
    ld   [hl], $10
    ld   hl, $C420
    add  hl, de
    ld   [hl], $20
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push hl
    ld   hl, $C3F0
    add  hl, de
    ld   [hl], a
    pop  hl
    cpl
    inc  a
    sra  a
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    push hl
    ld   hl, $C400
    add  hl, de
    ld   [hl], a
    pop  hl
    cpl
    inc  a
    sra  a
    ld   [hl], a
    ld   a, $07
    ld   [$FFF3], a
    ld   hl, $C360
    add  hl, de
    ld   a, [hl]
    sub  a, $02
    ld   [hl], a
    dec  a
    and  $80
    jr   z, label_188D7
    ld   hl, $C280
    add  hl, de
    ld   [hl], $01
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $1F
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    ld   [hl], $04
    ld   hl, $C430
    add  hl, bc
    res  7, [hl]
    ld   a, $10
    ld   [$FFF3], a

label_188D7::
    call label_3B12
    ld   [hl], b

label_188DB::
    jr   label_188EC
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $12
    call label_3B44
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $92

label_188EC::
    ld   a, [$FFE8]
    and  a
    jr   nz, label_1890C
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_18910
    and  $03
    jr   z, label_18902
    ld   hl, $C240
    jr   label_18905

label_18902::
    ld   hl, $C250

label_18905::
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    sra  a
    ld   [hl], a

label_1890C::
    call label_3B12
    ld   [hl], b

label_18910::
    ret

label_18911::
    ld   [hl], h
    ld   [bc], a
    db   $76 ; Halt
    ld   [bc], a
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], h
    ldi  [hl], a
    ld   [hl], b
    ld   bc, label_172
    ld   [hl], d
    ld   hl, label_2170
    ld   a, b
    nop
    ld   a, d
    nop
    ld   a, d
    jr   nz, label_189A0
    jr   nz, label_189A6
    inc  bc
    ld   a, [hl]
    inc  bc
    ld   a, [hl]
    inc  hl
    ld   a, h
    inc  hl
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $20
    ld   de, label_18911
    call label_3BC0
    call label_1A4C6
    call label_C56
    call label_1A541
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    ld   d, d
    ld   c, c
    and  e
    ld   c, c
    call nc, label_CD49
    add  hl, sp
    dec  sp
    call label_C05
    jr   nz, label_18962
    ld   [hl], $20
    call label_3D7F
    call label_3B12

label_18962::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]

label_18967::
    ld   hl, $C380
    add  hl, bc
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_18976
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

label_18976::
    ld   e, [hl]
    sla  e
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    rra
    rra
    rra
    and  $01
    or   e
    call label_3B0C
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    call label_3B12
    ld   [hl], $02
    call label_C05
    ld   [hl], $40
    jp   label_3D7F

label_1899B::
    inc  c
    db   $F4 ; Undefined instruction
    nop
    nop

label_1899F::
    nop

label_189A0::
    nop
    db   $F4 ; Undefined instruction
    inc  c
    call label_3B39

label_189A6::
    call label_C05
    jr   nz, label_189D2
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    call label_3B12
    ld   [hl], b
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1899B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1899F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_189D2::
    jr   label_18967
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_18AA7
    ld   [$FFD7], a
    ld   e, $0F
    ld   d, b

label_189E2::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_18A09
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $90
    jr   nz, label_18A09
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $02
    jr   nz, label_18A09
    ld   hl, $C2E0
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_18A09
    ld   a, [$FFD7]
    inc  a
    ld   [$FFD7], a

label_18A09::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_189E2
    ld   a, [$FFD7]
    cp   $03
    jp   nz, label_18AA7
    push bc
    ld   c, b
    ld   e, $0F
    ld   d, b

label_18A1B::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_18A37
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $90
    jr   nz, label_18A37
    ld   hl, $C380
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFD9
    add  hl, bc
    ld   [hl], a
    inc  bc

label_18A37::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_18A1B
    pop  bc
    call label_C20
    ld   e, $00
    ld   a, [$FFD9]
    ld   hl, $FFDA
    cp   [hl]
    jr   nz, label_18A62
    inc  hl
    cp   [hl]
    jr   nz, label_18A62
    ld   e, $FF
    cp   $02
    jr   nc, label_18A62
    ld   hl, $FFF2
    ld   [hl], $02
    ld   e, $2D
    cp   $01
    jr   nz, label_18A62
    ld   e, $2E

label_18A62::
    ld   a, e
    ld   [$FFE8], a
    ld   e, $0F
    ld   d, b

label_18A68::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_18AA1
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $90
    jr   nz, label_18AA1
    ld   a, [$FFE8]
    and  a
    jr   nz, label_18A85
    ld   hl, $C290
    add  hl, de
    ld   [hl], d
    jr   label_18AA1

label_18A85::
    ld   hl, $C4E0
    add  hl, de
    ld   [hl], a
    ld   hl, $C480
    add  hl, de
    ld   [hl], $1F
    ld   hl, $C280
    add  hl, de
    ld   [hl], $01
    ld   hl, $C340
    add  hl, de
    ld   [hl], $04
    ld   hl, $FFF4
    ld   [hl], $13

label_18AA1::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_18A68

label_18AA7::
    ret
    ld   c, d
    nop
    ld   c, h
    nop
    ld   c, h
    jr   nz, label_18AF9
    jr   nz, label_18AFF
    nop
    ld   c, [hl]
    jr   nz, label_18AC6
    xor  b
    ld   c, d
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    call label_3B39
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_18ACE
    ld   a, $06
    jp   label_A8F

label_18ACE::
    ld   a, [$FFF0]
    rst  0
    reti
    ld   c, d
    ld   [rWY], a
    dec  de
    ld   c, e
    ld   b, c
    ld   c, e
    call label_C05
    ret  nz
    jp   label_3B12
    ld   a, [$FFE7]
    xor  c
    and  $03
    jr   nz, label_18AEC
    ld   a, $08
    call label_3BAA

label_18AEC::
    call label_1A594
    add  a, $1C
    cp   $38
    jr   nc, label_18B0C
    call label_1A5A4
    add  a, $1C
    cp   $38
    jr   nc, label_18B0C
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $28
    ld   a, $10
    call label_3BAA
    call label_3B12

label_18B0C::
    call label_1A541
    call label_3B23
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_1A541
    call label_3B23
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   a, [hl]
    cp   $02
    jr   nc, label_18B3C
    ld   [hl], $C0
    call label_C05
    ld   [hl], $10
    call label_3D7F
    call label_3B12

label_18B3C::
    ld   a, $02
    jp   label_3B0C
    call label_C05
    ret  nz
    call label_1A57A
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_18B53
    and  $80
    ret  z

label_18B53::
    ld   [hl], b
    call label_C05
    ld   [hl], $20
    call label_3B12
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    ld   [hl], b
    bit  7, a
    ret  z
    cp   $D0
    ret  nc
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $0C
    ld   [$FFD8], a
    jp   label_D15

label_18B76::
    nop
    inc  bc
    ld   bc, label_2102
    or   b
    jp   nz, label_1BE09
    and  a
    jp   nz, label_18E88
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_18B98
    inc  [hl]
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C440
    add  hl, bc
    ld   [hl], $01

label_18B98::
    call label_394D
    call label_18E64
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_19308
    call label_1A4C6
    call label_3EE8
    call label_C56
    call label_3B44
    call label_1A541
    ld   a, [$C146]
    and  a
    jr   nz, label_18BE1
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $C4
    ld   a, [$FFF0]
    and  a
    jr   nz, label_18BDE
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_18B76
    add  hl, de
    ld   a, [hl]
    push af
    call label_1A5B4
    pop  af
    cp   e
    jr   z, label_18BDE
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $84

label_18BDE::
    call label_3B70

label_18BE1::
    ld   a, [$FFF0]
    rst  0
    jr   nz, label_18C32
    dec  sp
    ld   c, l

label_18BE8::
    inc  d
    nop
    db   $EC ; Undefined instruction
    nop

label_18BEC::
    nop
    inc  d
    nop
    db   $EC ; Undefined instruction

label_18BF0::
    ld   b, $07
    nop
    ld   bc, label_504
    ld   [bc], a
    inc  bc

label_18BF8::
    db   $10 ; Undefined instruction
    db   $F4 ; Undefined instruction
    inc  c
    ld   a, [$FFF0]
    db   $F4 ; Undefined instruction
    inc  c

label_18C00::
    db   $F4 ; Undefined instruction
    inc  c
    db   $10 ; Undefined instruction
    db   $F4 ; Undefined instruction
    inc  c
    ld   a, [$FFF0]

label_18C08::
    add  a, b
    add  a, b
    add  a, b
    ld   a, a
    ld   a, a
    ld   a, a
    add  a, b
    ld   a, a

label_18C10::
    add  a, b
    ld   a, a
    add  a, b
    add  a, b
    add  a, b
    ld   a, a
    ld   a, a
    ld   a, a

label_18C18::
    nop
    ld   [bc], a
    nop
    ld   bc, label_301
    ld   [bc], a
    inc  bc
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_18C4F
    call label_18C59
    call label_3B12
    ld   hl, $C380
    add  hl, bc

label_18C32::
    ld   a, [hl]
    ld   hl, $C390
    add  hl, bc
    ld   [hl], a
    call label_C05
    ld   [hl], $58
    call label_280D
    and  $01
    jr   nz, label_18C4C
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_18C4C::
    jp   label_3D7F

label_18C4F::
    call label_C05
    jr   z, label_18C59
    cp   $01
    jr   z, label_18C83
    ret

label_18C59::
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    cp   $20
    jr   c, label_18C78
    cp   $80
    jr   nc, label_18C78
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $28
    jr   c, label_18C73
    cp   $68
    jr   c, label_18C91

label_18C73::
    ld   a, [$FFEF]
    ld   [hl], a
    jr   label_18C7B

label_18C78::
    ld   a, [$FFEE]
    ld   [hl], a

label_18C7B::
    call label_C05
    ld   [hl], $15
    jp   label_3D7F

label_18C83::
    ld   hl, $C440
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    add  a, e
    and  $03
    ld   [hl], a

label_18C91::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_18BE8
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_18BEC
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    sla  e
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    or   e
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_18BF0
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_18D3A
    ld   a, $2F
    ld   [$FFF4], a
    ld   a, $01

label_18CCE::
    ld   [$FFE8], a
    ld   a, $8E
    call label_3B86
    jr   c, label_18D3A
    push bc
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    sla  a
    ld   hl, $FFE8
    or   [hl]
    ld   c, a
    ld   hl, label_18BF8
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_18C00
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_18C08
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_18C10
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, label_18C18
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C430
    add  hl, de
    ld   [hl], $00
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $0C
    pop  bc
    ld   a, [$FFE8]
    dec  a
    cp   $FF
    jr   nz, label_18CCE

label_18D3A::
    ret
    call label_C05
    jr   nz, label_18D51
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    xor  $02
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    call label_3B12
    ld   [hl], b
    ret

label_18D51::
    and  $03
    jr   nz, label_18D5E
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

label_18D5E::
    call label_18C91
    jp   label_3D7F

label_18D64::
    ld    hl, sp+$F8
    ld   h, b
    ld   [bc], a
    ld    hl, sp+$00
    ld   h, d
    ld   [bc], a
    ld    hl, sp+$08
    ld   h, d
    ldi  [hl], a
    ld    hl, sp+$10
    ld   h, b
    ldi  [hl], a
    ld   [label_1A4F8], sp
    ld   [bc], a
    ld   [label_1A600], sp
    ld   [bc], a
    ld   [label_1A608], sp
    ldi  [hl], a
    ld   [label_1A410], sp
    ldi  [hl], a
    ld   a, [label_1A0F8]
    ld   [bc], a
    ld   a, [label_1A200]
    ld   [bc], a
    ld   a, [label_1A208]
    ldi  [hl], a
    ld   a, [label_1A010]
    ldi  [hl], a
    ld   [label_1A4F8], sp
    ld   [bc], a
    ld   [label_1A600], sp
    ld   [bc], a
    ld   [label_1A608], sp
    ldi  [hl], a
    ld   [label_1A410], sp
    ldi  [hl], a
    ld    hl, sp+$F8
    ld   h, h
    ld   b, d
    ld    hl, sp+$00
    ld   h, [hl]
    ld   b, d
    ld    hl, sp+$08
    ld   h, [hl]
    ld   h, d
    ld    hl, sp+$10
    ld   h, h
    ld   h, d
    ld   [label_1A0F8], sp
    ld   b, d
    ld   [label_1A200], sp
    ld   b, d
    ld   [label_1A208], sp
    ld   h, d
    ld   [label_1A010], sp
    ld   h, d
    ld    hl, sp+$F8
    ld   h, h
    ld   b, d
    ld    hl, sp+$00
    ld   h, [hl]
    ld   b, d
    ld    hl, sp+$08
    ld   h, [hl]
    ld   h, d
    ld    hl, sp+$10
    ld   h, h
    ld   h, d
    ld   b, $F8
    ld   h, b
    ld   b, d
    ld   b, $00
    ld   h, d
    ld   b, d
    ld   b, $08
    ld   h, d
    ld   h, d
    ld   b, $10
    ld   h, b
    ld   h, d
    ld    hl, sp+$F8
    ld   l, b
    ld   [bc], a
    ld    hl, sp+$00
    ld   l, d
    ld   [bc], a
    ld    hl, sp+$08
    ld   h, d
    ldi  [hl], a
    ld    hl, sp+$10
    ld   h, b
    ldi  [hl], a
    ld   [label_1A8F8], sp
    ld   b, d
    ld   [label_1AA00], sp
    ld   b, d
    ld   [label_1A208], sp
    ld   h, d
    ld   [label_1A010], sp
    ld   h, d
    ld    hl, sp+$F8
    ld   l, b
    ld   [bc], a
    ld    hl, sp+$00
    ld   l, d
    ld   [bc], a
    ld    hl, sp+$06
    ld   h, d
    ldi  [hl], a
    ld    hl, sp+$0E
    ld   h, b
    ldi  [hl], a
    ld   [label_1A8F8], sp
    ld   b, d
    ld   [label_1AA00], sp
    ld   b, d
    ld   [label_1A206], sp
    ld   h, d
    ld   [label_1A00E], sp
    ld   h, d
    ld    hl, sp+$F8
    ld   h, b
    ld   [bc], a
    ld    hl, sp+$00
    ld   h, d
    ld   [bc], a
    ld    hl, sp+$08
    ld   l, d
    ldi  [hl], a
    ld    hl, sp+$10
    ld   l, b
    ldi  [hl], a
    ld   [label_1A0F8], sp
    ld   b, d
    ld   [label_1A200], sp
    ld   b, d
    ld   [label_1AA08], sp
    ld   h, d
    ld   [label_1A810], sp
    ld   h, d
    ld    hl, sp+$FA
    ld   h, b
    ld   [bc], a
    ld    hl, sp+$02
    ld   h, d
    ld   [bc], a
    ld    hl, sp+$08
    ld   l, d
    ldi  [hl], a
    ld    hl, sp+$10
    ld   l, b
    ldi  [hl], a
    ld   [label_1A0FA], sp
    ld   b, d
    ld   [label_1A202], sp
    ld   b, d
    ld   [label_1AA08], sp
    ld   h, d
    ld   [label_1A810], sp
    ld   h, d

label_18E64::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_18D64
    add  hl, de
    ld   c, $08
    jp   label_3CE6

label_18E78::
    ld   l, h
    nop
    ld   l, [hl]
    nop
    ld   l, [hl]
    jr   nz, label_18EEB
    jr   nz, label_18EED
    ld   b, b
    ld   l, [hl]
    ld   b, b
    ld   l, [hl]
    ld   h, b
    ld   l, h
    ld   h, b

label_18E88::
    ld   de, label_18E78
    call label_3BC0
    call label_1A4C6
    call label_C05
    jp   z, label_1A5DB
    cp   $06
    ret  nz
    jp   label_1A541

label_18E9D::
    ld    hl, sp+$10
    ld   a, [$F010]
    ld   a, [$FFA7]
    jr   nz, label_18EB7
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $10
    jp   label_3B12

label_18EB7::
    ld   de, label_18E9D
    call label_3BC0
    call label_1A4C6
    ld   a, [$FFBA]
    cp   $02
    jr   z, label_18EF2
    and  a
    jr   z, label_18EE3
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   nz, label_18EE2
    ld   [hl], b
    ld   a, $11
    ld   [$FFF4], a
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $20
    jr   nc, label_18EE2
    inc  [hl]

label_18EE2::
    ret

label_18EE3::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_18F0E

label_18EEB::
    ld   a, [$FFE7]

label_18EED::
    and  $0F
    jr   nz, label_18EF2
    dec  [hl]

label_18EF2::
    ld   a, [hl]
    cp   $04
    jr   nc, label_18F0D
    call label_3B5A
    ret  nc
    ld   a, $08
    ld   [$C13E], a
    ld   a, $10
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a

label_18F0D::
    ret

label_18F0E::
    call label_3B5A
    ret  nc
    jp   label_1A41F
    ld   a, [$FFF0]
    and  a
    jp   nz, label_18EB7
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $10
    jp   label_3B12

label_18F2C::
    ld   b, h
    ld   bc, label_2144
    ld   b, [hl]
    ld   bc, label_2146

label_18F34::
    ld   h, h
    ld   bc, label_2164
    ld   h, [hl]
    ld   bc, label_2166
    ld   de, label_18F2C
    ld   a, [$FFF7]
    cp   $0A
    jr   nz, label_18F48
    ld   de, label_18F34

label_18F48::
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    call label_3B39
    call label_1A541
    call label_3B23
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    xor  c
    and  $03
    jr   nz, label_18FAF
    call label_280D
    xor  c
    and  $07
    add  a, $04
    call label_3BB5
    ld   a, [$FFD7]
    ld   hl, $C250
    call label_18FA3
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0C
    jr   z, label_18F8C
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b

label_18F8C::
    ld   a, [$FFD8]
    ld   hl, $C240
    call label_18FA3
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_18FA2
    ld   hl, $C240
    add  hl, bc
    ld   [hl], b

label_18FA2::
    ret

label_18FA3::
    add  hl, bc
    sub  a, [hl]
    jr   z, label_18FAF
    bit  7, a
    jr   z, label_18FAE
    dec  [hl]
    jr   label_18FAF

label_18FAE::
    inc  [hl]

label_18FAF::
    ret

label_18FB0::
    ld   [$00F8], sp
    nop

label_18FB4::
    nop
    nop
    ld    hl, sp+$08
    call label_192BA
    xor  a
    ld   [$C167], a
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_19308
    call label_1A4C6
    call label_3EE8
    call label_1A4F7
    call label_C00
    jr   z, label_18FD7
    call label_191B0

label_18FD7::
    ld   a, [$FFF0]
    cp   $04
    jr   nc, label_18FF1
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jr   nz, label_18FF1
    call label_3B12
    ld   [hl], $05
    call label_C05
    ld   [hl], $20
    ret

label_18FF1::
    ld   a, [$FFF0]
    rst  0
    ld   [hl], h
    ld   d, b
    nop
    ld   d, b
    xor  b
    ld   d, b
    bit  2, b
    dec  sp
    ld   d, c
    cp   h
    ld   d, c
    call label_3B39
    call label_C05
    jr   z, label_1901A
    cp   $0A
    jr   nz, label_19017
    call label_1A5B4
    ld   hl, $C380
    add  hl, bc
    ld   a, e
    cp   [hl]
    jr   nz, label_19017

label_19017::
    jp   label_3B23

label_1901A::
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $02
    jr   nz, label_19037
    ld   [hl], b
    call label_280D
    and  $01
    jr   nz, label_19037
    call label_3B12
    ld   [hl], $02
    call label_C05
    ld   [hl], $30
    ret

label_19037::
    call label_C05
    call label_280D
    and  $1F
    or   $20
    ld   [hl], a
    call label_3B12
    ld   [hl], b
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a
    cp   $00
    jr   nz, label_19058
    call label_1A5B4
    jr   label_1905B

label_19058::
    call label_280D

label_1905B::
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_18FB0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_18FB4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ret
    call label_3B39
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   nz, label_19085
    call label_C05
    jr   nz, label_19093

label_19085::
    call label_280D
    and  $0F
    or   $10
    ld   [hl], a
    call label_3B12
    call label_3D7F

label_19093::
    call label_1A541
    call label_3B23

label_19099::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_3B39
    call label_C05
    jr   nz, label_190BA
    ld   [hl], $20
    call label_3B12
    ld   a, $18
    call label_3BAA

label_190BA::
    call label_19099
    call label_19099
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_190CA
    ld   a, $20
    ld   [$FFF2], a

label_190CA::
    ret
    call label_3B39
    call label_C05
    jr   nz, label_190D7
    call label_3B12
    ld   [hl], b

label_190D7::
    call label_1A541
    call label_3B23
    call label_1A594
    add  a, $18
    cp   $30
    jr   nc, label_19102
    call label_1A5A4
    add  a, $18
    cp   $30
    jr   nc, label_19102
    ld   a, [$C11C]
    cp   $00
    jr   nz, label_19102
    call label_3B12
    call label_C05
    ld   [hl], $4F
    ld   a, $16
    ld   [$FFF3], a

label_19102::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_19117
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $0A
    ld   [$FFD8], a
    ld   a, $0B
    call label_CC7

label_19117::
    jr   label_190BA

label_19119::
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0000

label_19123::
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    di
    rst  $30
    ei
    nop

label_1912F::
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    inc  d
    inc  d
    inc  d
    db   $10 ; Undefined instruction
    inc  b
    nop
    call label_C05
    jr   nz, label_19145
    call label_3B12
    ld   [hl], b
    ret

label_19145::
    cp   $20
    jr   nz, label_19179
    ld   a, $20
    ld   [$FF9B], a
    ld   a, [$FF98]
    cp   $50
    ld   a, $E0
    jr   nc, label_19157
    ld   a, $20

label_19157::
    ld   [$FF9A], a
    ld   a, $10
    ld   [$FFA3], a
    ld   a, $02
    ld   [$C146], a
    ld   a, $08
    ld   [$FFF2], a
    ld   a, $08
    ld   [$DB94], a
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, [$FFEF]
    ld   [$FF99], a
    call label_C00
    ld   [hl], $50
    ret

label_19179::
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_19119
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    call label_C05
    cp   $20
    jr   c, label_191BB
    sub  a, $20
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_19123
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FF98], a
    ld   hl, label_1912F
    add  hl, de
    ld   a, [hl]
    ld   [$FFA2], a
    ld   a, $02
    ld   [$C146], a
    ld   a, [$FFEF]
    ld   [$FF99], a

label_191B0::
    ld   a, $01
    ld   [$FFA1], a
    ld   a, $6A
    ld   [$FF9D], a
    ld   [$C167], a

label_191BB::
    ret
    call label_3B39
    call label_C05
    jr   nz, label_191C9
    call label_3B12
    ld   [hl], b
    ret

label_191C9::
    ld   e, $00
    cp   $10
    jr   c, label_191D0
    inc  e

label_191D0::
    cp   $10
    jr   nz, label_191F6
    ld   a, $02
    call label_3B86
    jr   c, label_191F6
    ld   a, [$FFD7]
    sub  a, $0C
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    sub  a, $00
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C310
    add  hl, de
    ld   [hl], $10
    jp   label_181F8

label_191F6::
    ld   a, e
    jp   label_3B0C

label_191FA::
    db   $F4 ; Undefined instruction
    ld    hl, sp+$60
    ld   bc, $00F4
    ld   h, d
    ld   bc, label_8F4
    ld   h, h
    ld   bc, label_10F4
    ld   h, [hl]
    ld   bc, $F804
    ld   l, b
    ld   bc, $0004
    ld   l, d
    ld   bc, label_804
    ld   l, h
    ld   bc, label_1004
    ld   l, [hl]
    ld   bc, $F8F4
    ld   h, [hl]
    ld   hl, $00F4
    ld   h, h
    ld   hl, label_8F4
    ld   h, d
    ld   hl, label_10F4
    ld   h, b
    ld   hl, $F804
    ld   l, [hl]
    ld   hl, $0004
    ld   l, h
    ld   hl, label_804
    ld   l, d
    ld   hl, label_1004
    ld   l, b
    ld   hl, $F8F4
    ld   h, b
    ld   [bc], a
    db   $F4 ; Undefined instruction
    nop
    ld   h, d
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld   [label_264], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [bc], a
    inc  b
    ld    hl, sp+$68
    ld   [bc], a
    inc  b
    nop
    ld   l, d
    ld   [bc], a
    inc  b
    ld   [label_26C], sp
    inc  b
    db   $10 ; Undefined instruction
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld    hl, sp+$66
    ldi  [hl], a
    db   $F4 ; Undefined instruction
    nop
    ld   h, h
    ldi  [hl], a
    db   $F4 ; Undefined instruction
    ld   [label_2262], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    ldi  [hl], a
    inc  b
    ld    hl, sp+$6E
    ldi  [hl], a
    inc  b
    nop
    ld   l, h
    ldi  [hl], a
    inc  b
    ld   [label_226A], sp
    inc  b
    db   $10 ; Undefined instruction
    ldi  [hl], a

label_1927A::
    db   $F4 ; Undefined instruction
    ld    hl, sp+$60
    inc  bc
    db   $F4 ; Undefined instruction
    nop
    ld   h, d
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [label_364], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  bc
    inc  b
    ld    hl, sp+$68
    inc  bc
    inc  b
    nop
    ld   l, d
    inc  bc
    inc  b
    ld   [label_36C], sp
    inc  b
    db   $10 ; Undefined instruction
    inc  bc
    db   $F4 ; Undefined instruction
    ld    hl, sp+$66
    inc  hl
    db   $F4 ; Undefined instruction
    nop
    ld   h, h
    inc  hl
    db   $F4 ; Undefined instruction
    ld   [label_2362], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  hl
    inc  b
    ld    hl, sp+$6E
    inc  hl
    inc  b
    nop
    ld   l, h
    inc  hl
    inc  b
    ld   [label_236A], sp
    inc  b
    db   $10 ; Undefined instruction
    inc  hl

label_192BA::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_1927A
    ld   a, [$FFF7]
    cp   $07
    jr   z, label_192D8
    ld   hl, label_1923A
    cp   $06
    jr   z, label_192D8
    ld   hl, label_191FA

label_192D8::
    add  hl, de
    ld   c, $08
    jp   label_3CE6
    ld   hl, $C460
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], $30
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   nc, label_192FF
    ld   e, $02
    cp   $04
    jr   nc, label_192FB
    ld   e, $03

label_192FB::
    ld   a, e
    call label_3B0C

label_192FF::
    call label_195B3
    ld   a, [$FFEA]
    cp   $05
    jr   z, label_19361

label_19308::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   d, $53
    inc  h
    ld   d, e
    inc  sp
    ld   d, e
    ld   h, b
    ld   d, e
    call label_C05
    ld   [hl], $A0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    jp   label_19634
    call label_C05
    ret  nz
    ld   [hl], $C0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    jp   label_19634
    call label_C05
    jr   nz, label_1935D
    ld   a, $1A
    ld   [$FFF4], a
    call label_27DD
    call label_3F50
    ld   a, [$FFEB]
    cp   $88
    ret  z

label_19347::
    ld   a, [$FFEB]
    cp   $89
    jr   z, label_19355
    cp   $8E
    jr   z, label_19355
    cp   $92
    jr   nz, label_1935A

label_19355::
    ld   a, [$FFF7]
    cp   $06
    ret  nc

label_1935A::
    jp   label_1ACC9

label_1935D::
    jp   label_1B00A
    ret

label_19361::
    call label_1A4C6
    call label_3EE8
    call label_3B70
    call label_1A41A
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_19387
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_19387::
    call label_C00
    jr   z, label_19394
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $6A
    ld   [$FF9D], a

label_19394::
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    cp   [hl]
    ld   [hl], a
    jp   z, label_19411
    cp   $08
    jr   nc, label_19411
    cp   $04
    jr   nc, label_193D3
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   nc, label_19411
    inc  [hl]
    ld   a, $05
    call label_3B86
    jr   c, label_19411
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    dec  a
    ld   [hl], a
    ld   [$FFD7], a
    ld   a, [$FFD8]
    ld   hl, $FFDA
    sub  a, [hl]
    ld   hl, $C210
    add  hl, de
    sub  a, $10
    jr   label_193F9

label_193D3::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $01
    jr   nc, label_19411
    inc  [hl]
    ld   a, $05
    call label_3B86
    jr   c, label_19411
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    add  a, $07
    ld   [hl], a
    ld   [$FFD7], a
    ld   a, [$FFD8]
    ld   hl, $FFDA
    sub  a, [hl]
    ld   hl, $C210
    add  hl, de

label_193F9::
    ld   [hl], a
    ld   [$FFD8], a
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0F
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C4
    ld   a, $02
    call label_CC7
    ld   a, $29
    ld   [$FFF4], a

label_19411::
    ld   a, [$FFF0]
    rst  0
    inc  h
    ld   d, h
    ld   b, d
    ld   d, h
    ld   d, [hl]
    ld   d, h
    add  a, [hl]
    ld   d, h
    cp   [hl]
    ld   d, h
    ret  c
    ld   d, h
    db   $ED ; Undefined instruction
    ld   d, h
    dec  d
    ld   d, l
    call label_C56
    call label_1A594
    add  a, $20
    cp   $40
    jr   nc, label_19441
    call label_1A5A4
    add  a, $20
    cp   $40
    jr   nc, label_19441
    call label_3B12
    call label_C05
    ld   [hl], $30

label_19441::
    ret
    call label_C56
    call label_C05
    jr   nz, label_1944F
    ld   [hl], $80
    call label_3B12

label_1944F::
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_C56
    call label_C05
    jr   nz, label_19476
    ld   [hl], $50
    call label_3B12
    ld   hl, $C340
    add  hl, bc
    res  7, [hl]
    ld   hl, $C350
    add  hl, bc
    res  7, [hl]
    ld   hl, $C430
    add  hl, bc
    res  6, [hl]
    ret

label_19476::
    ld   e, $08
    and  $04
    jr   z, label_1947E
    ld   e, $F8

label_1947E::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    jp   label_1A54E
    call label_1A4F7
    call label_C05
    jr   nz, label_1949C
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $30
    call label_3B12
    ld   a, $24
    ld   [$FFF2], a
    ret

label_1949C::
    ld   a, [$FFE8]
    and  a
    jr   z, label_194BB
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $0C
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $05
    ld   a, $08
    jr   nc, label_194B4
    ld   a, $0C

label_194B4::
    call label_3BAA
    ld   a, $20
    ld   [$FFF2], a

label_194BB::
    jp   label_1A541
    call label_1A4F7
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  $FE
    jr   nz, label_194D5
    call label_C05
    ld   [hl], $10
    call label_3D7F
    call label_3B12

label_194D5::
    jp   label_1A541
    call label_1A4F7
    call label_C05
    ld   a, $00
    jr   nz, label_194E7
    call label_3B12
    ld   a, $B0

label_194E7::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    ret
    call label_1A4F7
    ld   a, [$FFE8]
    and  a
    ret  z
    ld   a, $30
    ld   [$C157], a
    ld   a, $04
    ld   [$C158], a
    ld   a, $0B
    ld   [$FFF2], a
    call label_C05
    ld   [hl], $30
    ld   a, [$C146]
    and  a
    jr   nz, label_19512
    call label_C00
    ld   [hl], $40

label_19512::
    jp   label_3B12
    call label_1A4F7
    call label_C05
    jr   nz, label_19522
    call label_3B12
    ld   [hl], $02

label_19522::
    ret

label_19523::
    db   $F4 ; Undefined instruction
    ld    hl, sp+$70
    inc  bc
    db   $F4 ; Undefined instruction
    nop
    ld   [hl], d
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [label_2372], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  hl
    inc  b
    ld    hl, sp+$74
    inc  bc
    inc  b
    nop
    db   $76 ; Halt
    inc  bc
    inc  b
    ld   [label_37A], sp
    inc  b
    db   $10 ; Undefined instruction
    inc  hl
    db   $F4 ; Undefined instruction
    ld    hl, sp+$70
    ld   [bc], a
    db   $F4 ; Undefined instruction
    nop
    ld   a, b
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld   [label_2278], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    ldi  [hl], a
    inc  b
    ld    hl, sp+$74
    ld   [bc], a
    inc  b
    nop
    db   $76 ; Halt
    ld   [bc], a
    inc  b
    ld   [label_27A], sp
    inc  b
    db   $10 ; Undefined instruction
    ldi  [hl], a
    db   $F4 ; Undefined instruction
    ld    hl, sp+$70
    ld   [bc], a
    db   $F4 ; Undefined instruction
    nop
    ld   [hl], d
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld   [label_2272], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    ldi  [hl], a
    inc  b
    ld    hl, sp+$74
    ld   [bc], a
    inc  b
    nop
    db   $76 ; Halt
    ld   [bc], a
    inc  b
    ld   [label_2276], sp
    inc  b
    db   $10 ; Undefined instruction
    ldi  [hl], a
    db   $F4 ; Undefined instruction
    ld    hl, sp+$7C
    ld   [bc], a
    db   $F4 ; Undefined instruction
    nop
    ld   a, [hl]
    ld   [bc], a
    db   $F4 ; Undefined instruction
    ld   [label_227E], sp
    db   $F4 ; Undefined instruction
    db   $10 ; Undefined instruction
    ldi  [hl], a
    inc  b
    ld    hl, sp+$74
    ld   [bc], a
    inc  b
    nop
    db   $76 ; Halt
    ld   [bc], a
    inc  b
    ld   [label_2276], sp
    inc  b
    db   $10 ; Undefined instruction
    ldi  [hl], a

label_195A3::
    inc  c
    ei
    ld   h, $00
    inc  c
    ld   bc, $0026
    inc  c
    rlca
    ld   h, $00
    inc  c
    dec  c
    ld   h, $00

label_195B3::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_19523
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $04
    call label_3DA0
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_195E0
    ld   a, [$FFEF]
    ld   [$FFEC], a
    ld   hl, label_195A3
    ld   c, $04
    call label_3CE6

label_195E0::
    jp   label_3D8A

label_195E3::
    nop
    inc  b

label_195E5::
    db   $FC ; Undefined instruction
    ld   [label_21F8], sp
    ret  nc
    jp   nz, label_1BE09
    cp   $02
    jp   z, label_19988
    cp   $00
    jr   nz, label_19611
    inc  [hl]
    ld   a, $50
    ld   [$FFB0], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $FF
    call label_C05
    ld   [hl], $50
    ld   e, $00
    ld   a, $FF
    ld   hl, $D200

label_1960D::
    ldi  [hl], a
    dec  e
    jr   nz, label_1960D

label_19611::
    call label_198C9
    ld   a, [$FFEA]
    cp   $01
    jp   nz, label_196C8
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    add  hl, hl
    ld   d, [hl]
    db   $3A ; ldd  a, [hl]
    ld   d, [hl]
    ld   c, e
    ld   d, [hl]
    rst  0
    ld   d, [hl]
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    call label_C05
    ld   [hl], $60

label_19634::
    ld   hl, $C2C0
    add  hl, bc
    inc  [hl]
    ret
    call label_C05
    jr   nz, label_1964A
    ld   [hl], $CF
    call label_19634
    ld   hl, $C440
    add  hl, bc
    ld   [hl], $05

label_1964A::
    ret
    call label_C05
    jr   nz, label_1968A
    call label_27DD
    ld   a, $30
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $10
    call label_1A5DB
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    jr   label_196BB

label_1968A::
    and  $1F
    jr   nz, label_196C6
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C440
    add  hl, bc
    ld   e, [hl]
    dec  [hl]
    ld   d, b
    ld   hl, label_198C3
    add  hl, de
    sub  a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, $D200
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   nz, label_196C6
    push hl
    ld   hl, $D100
    add  hl, de
    ld   a, [hl]
    pop  hl
    sub  a, [hl]
    ld   [hl], $FF

label_196BB::
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $13
    ld   [$FFF4], a

label_196C6::
    ret
    ret

label_196C8::
    call label_1A4C6
    call label_3EE8
    call label_C00
    jr   z, label_19726
    and  $0F
    jr   nz, label_19726
    ld   a, $02

label_196D9::
    ld   [$FFE8], a
    ld   a, $87
    call label_3B86
    jr   c, label_19726
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, $C3B0
    add  hl, de
    and  $02
    ld   [hl], a
    ld   a, [$C1CD]
    ld   hl, label_195E3
    add  hl, bc
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_195E5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   a, [$C1CE]
    add  a, $00
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, de
    ld   [hl], $F0
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C1
    pop  bc
    ld   a, [$FFE8]
    dec  a
    jr   nz, label_196D9

label_19726::
    call label_1994C
    call label_C56
    ld   a, [$FFF0]
    cp   $02
    jr   c, label_19754
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  $FF
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFEE]
    ld   [hl], a
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFEF]
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    ld   hl, $D200
    add  hl, de
    ld   [hl], a

label_19754::
    ld   a, [$FFF0]
    rst  0
    ld   [hl], e
    ld   d, a
    xor  b
    ld   d, a
    db   $ED ; Undefined instruction
    ld   d, a
    inc  c
    ld   e, b
    dec  [hl]
    ld   e, b
    sbc  a, a
    ld   e, b

label_19763::
    jr   z, label_1979D
    ld   c, b
    ld   e, b
    ld   l, b
    ld   a, b
    adc  a, b
    jr   z, label_1979C
    ld   b, b
    ld   d, b
    ld   h, b
    ld   [hl], b
    jr   nc, label_197B2
    ld   d, b
    call label_C05
    ret  nz
    call label_C05
    ld   [hl], $18
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_19763
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $07
    ld   e, a
    ld   hl, label_1976B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc

label_1979C::
    ld   [hl], a

label_1979D::
    ld   hl, $C310
    add  hl, bc
    ld   [hl], b
    call label_3D8A
    jp   label_3B12
    call label_C05
    jr   nz, label_197E0
    ld   [hl], $20
    ld   a, [$FF98]
    push af

label_197B2::
    ld   a, [$FF99]
    push af
    ld   a, $58
    ld   [$FF98], a
    ld   a, $50
    ld   [$FF99], a
    ld   a, $08
    call label_3BAA
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $08
    ld   a, [$FFEE]
    ld   [$C1CD], a
    ld   a, [$FFEF]
    ld   [$C1CE], a
    call label_C00
    ld   [hl], $61
    call label_3B12

label_197E0::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    add  a, $05
    jp   label_3B0C
    call label_C05
    jr   nz, label_19803
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $20
    call label_3B12

label_19803::
    call label_1A541
    call label_1A57A
    jp   label_3B39
    call label_C05
    jr   nz, label_19816
    ld   [hl], $80
    call label_3B12

label_19816::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    ld   a, [hl]
    bit  0, a
    jr   nz, label_1982C
    ld   hl, $C320
    add  hl, bc
    and  $20
    jr   nz, label_1982B
    inc  [hl]
    inc  [hl]

label_1982B::
    dec  [hl]

label_1982C::
    call label_1A541
    call label_1A57A
    jp   label_3B39
    call label_C05
    jr   nz, label_19841
    ld   [hl], $60
    call label_3B12
    ld   [hl], b
    ret

label_19841::
    cp   $78
    jr   nz, label_19858
    ld   a, [$FFEE]
    ld   [$C1CD], a
    ld   a, [$FFEF]
    ld   [$C1CE], a
    call label_C00
    ld   [hl], $60
    ld   a, $23
    ld   [$FFF4], a

label_19858::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sub  a, $F4
    and  $80
    jr   nz, label_19864
    dec  [hl]

label_19864::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_19888
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_19879
    and  $80
    jr   z, label_19878
    inc  [hl]
    inc  [hl]

label_19878::
    dec  [hl]

label_19879::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_19888
    and  $80
    jr   z, label_19887
    inc  [hl]
    inc  [hl]

label_19887::
    dec  [hl]

label_19888::
    call label_1A541
    call label_1A57A
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_1989A
    call label_3B39

label_1989A::
    ld   a, $02
    jp   label_3B0C

label_1989F::
    ld   [hl], d
    inc  bc
    ld   [hl], h
    inc  bc
    ld   [hl], h
    inc  hl
    ld   [hl], d
    inc  hl
    ld   [hl], b
    inc  bc
    ld   [hl], b
    inc  hl
    ld   [hl], b
    ld   b, e
    ld   [hl], b
    ld   h, e
    db   $76 ; Halt
    inc  bc
    db   $76 ; Halt
    inc  hl
    ld   a, d
    ld   bc, label_1A17A
    ld   a, d
    ld   b, c
    ld   a, d
    ld   hl, label_378
    ld   a, b
    ld   h, e
    ld   a, b
    ld   b, e
    ld   a, b
    inc  hl

label_198C3::
    inc  c
    jr   label_198EA
    jr   nc, label_19904
    ld   c, b

label_198C9::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_198D8
    ld   de, label_1989F
    call label_3BC0

label_198D8::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   a, [$FFE7]
    and  $01
    jr   z, label_198ED
    ld   a, $06
    ld   [$FFE9], a
    ld   a, $00
    jr   label_198F3

label_198ED::
    ld   a, $FF
    ld   [$FFE9], a
    ld   a, $05

label_198F3::
    ld   [$FFE8], a
    ld   e, a
    ld   d, b
    ld   hl, label_198C3
    add  hl, de
    ld   a, [$FFD7]
    sub  a, [hl]
    and  $FF
    ld   e, a
    ld   d, $00
    ld   hl, $D000
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $D100
    add  hl, de
    ld   a, [hl]
    ld   [$FFEF], a
    ld   hl, $D200
    add  hl, de
    sub  a, [hl]
    ld   [$FFEC], a
    ld   a, [hl]
    and  $80
    jr   nz, label_19936
    ld   a, [$FFE8]
    cp   $05
    ld   a, $04
    jr   nz, label_1992E
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $07

label_1992E::
    ld   [$FFF1], a
    ld   de, label_1989F
    call label_3BC0

label_19936::
    ld   e, $FF
    ld   a, [$FFE7]
    and  $01
    jr   z, label_19940
    ld   e, $01

label_19940::
    ld   hl, $FFE9
    ld   a, [$FFE8]
    add  a, e
    cp   [hl]
    jr   nz, label_198F3
    jp   label_3D8A

label_1994C::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   d, a
    bit  7, a
    jr   z, label_19958
    cpl
    inc  a

label_19958::
    ld   e, a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_19964
    cpl
    inc  a

label_19964::
    cp   e
    jr   nc, label_19973
    bit  7, d
    jr   nz, label_1996F
    ld   a, $01
    jr   label_1997D

label_1996F::
    ld   a, $00
    jr   label_1997D

label_19973::
    bit  7, [hl]
    jr   nz, label_1997B
    ld   a, $02
    jr   label_1997D

label_1997B::
    ld   a, $03

label_1997D::
    jp   label_3B0C

label_19980::
    ld   a, h
    ld   hl, label_217E
    ld   a, h
    ld   bc, label_17E

label_19988::
    ld   de, label_19980
    call label_3C77
    call label_1A4C6
    call label_1A541
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  a
    jr   nz, label_199A2
    ld   hl, $C3B0
    add  hl, bc
    inc  [hl]

label_199A2::
    cp   $10
    ret  nz
    jp   label_1A5DB

label_199A8::
    ld   [hl], b
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], h
    ld   [bc], a
    db   $76 ; Halt
    ld   [bc], a
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], b
    ldi  [hl], a
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], h
    ldi  [hl], a
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  b
    ld   [bc], a
    ld   b, $02
    ld   [bc], a
    ldi  [hl], a
    nop
    ldi  [hl], a
    ld   b, $22
    inc  b
    ldi  [hl], a

label_199C8::
    ld   a, b
    ld   [bc], a
    ld   a, d
    ld   [bc], a
    ld   a, h
    ld   [bc], a
    ld   a, [hl]
    ld   [bc], a
    ld   a, d
    ldi  [hl], a
    ld   a, b
    ldi  [hl], a
    ld   a, [hl]
    ldi  [hl], a
    ld   a, h
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   [bc], a
    inc  d
    ld   [bc], a
    ld   d, $02
    ld   [de], a
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   d, $22
    inc  d
    ldi  [hl], a
    ld   a, [$C19F]
    and  a
    jr   z, label_19A0D
    ld   a, [$C173]
    cp   $82
    jr   z, label_19A0D
    call label_1A594
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    call label_3D7F
    ld   a, [$C170]
    ld   e, $00
    and  $06
    jr   z, label_19A0A
    inc  e

label_19A0A::
    ld   a, e
    ld   [$FFF1], a

label_19A0D::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_19A1B
    ld   a, [$FFF1]
    add  a, $02
    ld   [$FFF1], a

label_19A1B::
    ld   de, label_199A8
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_19A33
    ld   a, [$FFF6]
    cp   $B2
    jr   nz, label_19A36
    ld   a, [$DB0E]
    cp   $03
    jr   c, label_19A36

label_19A33::
    ld   de, label_199C8

label_19A36::
    ld   a, [$DB95]
    cp   $01
    jr   nz, label_19A43
    ld   a, [$FFF1]
    add  a, $04
    ld   [$FFF1], a

label_19A43::
    call label_3BC0
    call label_1A4C6
    call label_C56
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_19A67
    xor  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a

label_19A67::
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_19A98
    call label_1A45D
    jr   nc, label_19A98
    ld   e, $23
    ld   a, [$FFF6]
    cp   $B2
    jr   nz, label_19A91
    ld   e, $80
    ld   a, [$DB0E]
    cp   $02
    jr   nz, label_19A8A
    call label_3B12
    ld   [hl], $02
    ld   e, $81

label_19A8A::
    ld   a, e
    call label_2373
    jp   label_19ACC

label_19A91::
    ld   a, e
    call label_2385
    call label_19ACC

label_19A98::
    ld   a, [$FFF0]
    rst  0
    rst  $20
    ld   e, d
    ld   a, [hli]
    ld   e, e
    and  e
    ld   e, d
    pop  de
    ld   e, d
    ld   a, [$C19F]
    and  a
    jr   nz, label_19AD0
    ld   a, [$C177]
    and  a
    jr   nz, label_19AC3
    ld   a, $03
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    ld   a, $83
    call label_2373
    call label_19ACC
    jp   label_3B12

label_19AC3::
    call label_3B12
    ld   [hl], b
    ld   a, $84
    call label_2373

label_19ACC::
    ld   a, $18
    ld   [$FFF3], a

label_19AD0::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_19ADE
    call label_C0C
    call label_3B12
    ld   [hl], b

label_19ADE::
    ret

label_19ADF::
    ld   [bc], a
    ld   [label_80C], sp
    cp   $F8
    db   $F4 ; Undefined instruction
    ld    hl, sp+$AF
    call label_3B0C
    call label_C05
    jr   nz, label_19B27
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_19ADF
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, e
    and  $04
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $07
    ld   e, a
    ld   hl, label_19ADF
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_C05
    call label_280D
    and  $1F
    add  a, $30
    ld   [hl], a
    call label_3B12

label_19B27::
    jp   label_19B4C
    call label_1A541
    call label_3B23
    ld   a, [$FFE8]
    and  a
    jr   z, label_19B4C
    call label_C05
    jr   nz, label_19B41
    ld   [hl], $30
    call label_3B12
    ld   [hl], b
    ret

label_19B41::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C310
    add  hl, bc
    inc  [hl]

label_19B4C::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_19B56::
    ld   h, b
    ld   bc, label_162
    ld   h, d
    ld   hl, label_2160
    ld   h, h
    ld   bc, label_166
    ld   h, [hl]
    ld   hl, label_2164
    ld   l, b
    ld   bc, label_16A
    ld   l, h
    ld   bc, label_16E
    ld   l, d
    ld   hl, label_2168
    ld   l, [hl]
    ld   hl, label_216C
    call label_C05
    cp   $01
    jr   nz, label_19B83
    ld   [hl], b
    ld   a, $FF
    ld   [$DB93], a

label_19B83::
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_19B91
    call label_1A5B4
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_19B91::
    call label_1A441
    ld   de, label_19B56
    call label_3BC0
    ld   a, [$DB56]
    cp   $80
    jr   nz, label_19BC4
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_19BB6
    and  $80
    jr   z, label_19BC4

label_19BB6::
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFE7]
    and  $3F
    jr   nz, label_19BC4
    ld   [hl], $10

label_19BC4::
    call label_1A4C6
    ld   a, [$FFEF]
    ld   [$FFEC], a
    call label_1A41A
    call label_3D8A
    call label_1A45D
    ret  nc
    ld   e, $30
    ld   a, [$DB66]
    and  $02
    jr   z, label_19BF2
    ld   a, [$DB56]
    cp   $01
    jr   nz, label_19BF2
    xor  a
    ld   [$DB56], a
    call label_C05
    ld   [hl], $10
    ld   e, $2F
    jr   label_19C00

label_19BF2::
    ld   a, [$DB56]
    and  a
    jr   z, label_19C00
    ld   e, $31
    cp   $01
    jr   nz, label_19C00
    ld   e, $32

label_19C00::
    ld   a, e
    jp   label_19C04

label_19C04::
    ld   a, e
    call label_2373
    ld   hl, $C19F
    set  7, [hl]
    ret
    ld   hl, $C210
    add  hl, bc
    ld   a, $49
    ld   [hl], a
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    inc  hl
    inc  hl
    ld   a, $08
    ld   [hl], a
    inc  hl
    ld   a, $0A
    ld   [hl], a
    pop  bc
    call label_19C71
    call label_1A4C6
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_1A41A
    call label_1A45D
    ret  nc
    ld   a, [$DB55]
    and  a
    jr   nz, label_19C4C
    ld   a, $01
    ld   [$DB55], a

label_19C4C::
    ld   a, $40
    jp   label_2373

label_19C51::
    rst  $30
    nop
    ld   [hl], b
    ld   [bc], a
    rst  $30
    ld   [label_272], sp
    rlca
    nop
    ld   [hl], h
    ld   [bc], a
    rlca
    ld   [label_276], sp
    rst  $30
    nop
    ld   a, b
    ld   [bc], a
    rst  $30
    ld   [label_27A], sp
    rlca
    nop
    ld   a, h
    ld   [bc], a
    rlca
    ld   [label_27E], sp

label_19C71::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_19C51
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $04
    jp   label_3DA0

label_19C89::
    ld   d, b
    inc  bc
    ld   d, d
    inc  bc
    ld   d, h
    inc  bc
    ld   d, [hl]
    inc  bc
    ld   d, d
    inc  hl
    ld   d, b
    inc  hl
    ld   d, [hl]
    inc  hl
    ld   d, h
    inc  hl
    ld   a, [$FFF6]
    cp   $58
    jr   nz, label_19CBE
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    cp   $10
    jr   c, label_19CAB
    srl  a
    ld   [hl], a

label_19CAB::
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_1A5DB
    ld   hl, $C460
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], $3C

label_19CBE::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_19CCC
    ld   a, [$FFF1]
    add  a, $02
    ld   [$FFF1], a

label_19CCC::
    ld   de, label_19C89
    call label_3BC0
    ld   a, [$FFF0]
    and  a
    jr   nz, label_19CE5
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $04
    ld   [hl], a
    call label_3B12
    ld   a, [hl]
    ld   [$FFF0], a

label_19CE5::
    call label_1A4C6
    call label_1A4F7
    ld   a, [$FFF0]
    dec  a
    rst  0
    rst  $30
    ld   e, h
    xor  l
    ld   e, l
    ret  z
    ld   e, l
    rla
    ld   e, [hl]
    ld   a, [$FFF6]
    cp   $58
    jp   nz, label_19D8A
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    ld   de, $0000

label_19D0F::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $02
    jr   nz, label_19D4F
    ld   hl, $C420
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_19D4F
    ld   hl, $C2E0
    add  hl, de
    ld   a, [hl]
    cp   $22
    jr   nc, label_19D4F
    ld   hl, $C200
    add  hl, de
    ld   l, [hl]
    ld   a, [$FFD7]
    sub  a, l
    bit  7, a
    jr   z, label_19D37
    cpl
    inc  a

label_19D37::
    cp   $20
    jr   nc, label_19D4F
    ld   hl, $C210
    add  hl, de
    ld   l, [hl]
    ld   a, [$FFD8]
    sub  a, l
    bit  7, a
    jr   z, label_19D49
    cpl
    inc  a

label_19D49::
    cp   $20
    jr   nc, label_19D4F
    jr   label_19D9F

label_19D4F::
    inc  de
    ld   a, e
    and  $0F
    jr   nz, label_19D0F
    ld   a, [$C50C]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $05
    ret  nz
    ld   hl, $C2F0
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $10
    cp   $20
    ret  nc
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $28
    cp   $50
    ret  nc
    jr   label_19D9F

label_19D8A::
    call label_1A594
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    add  a, $18
    cp   $30
    ret  nc
    call label_1A5A4
    add  a, $30
    cp   $60
    ret  nc

label_19D9F::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $12
    call label_C05
    ld   [hl], $22
    jp   label_3B12
    call label_3B39
    call label_C05
    jr   nz, label_19DBA
    ld   [hl], $30
    jp   label_3B12

label_19DBA::
    call label_3D7F
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $08
    call label_1A57A
    jr   label_19E08
    call label_3B39
    call label_C05
    jp   z, label_3B12
    and  $01
    jr   nz, label_19E02
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD7]
    ld   hl, $C250
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_19DE7
    inc  [hl]
    inc  [hl]

label_19DE7::
    dec  [hl]
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_19DF5
    inc  [hl]
    inc  [hl]

label_19DF5::
    dec  [hl]
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_19E02::
    call label_1A541
    call label_19E14

label_19E08::
    call label_19E14
    ld   a, [hl]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_19E14::
    jp   label_29F8
    call label_3B39
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_19E51
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_19E34
    inc  [hl]
    inc  [hl]

label_19E34::
    dec  [hl]
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_19E44
    inc  [hl]
    inc  [hl]

label_19E44::
    dec  [hl]
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_19E51::
    call label_19E02

label_19E54::
    ld   a, [$FFEC]
    cp   $88
    jp   nc, label_1A5DB
    ld   a, [$FFEE]
    cp   $A8
    jp   nc, label_1A5DB
    ret

label_19E63::
    nop
    nop
    ld   h, h
    ld   [bc], a
    nop
    ld   [label_266], sp
    stop
    ld   l, b
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   l, d
    ld   [bc], a
    nop
    nop
    ld   h, b
    ld   [bc], a
    nop
    ld   [label_262], sp
    stop
    ld   l, b
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   l, d
    ld   [bc], a
    nop
    nop
    ld   h, [hl]
    ldi  [hl], a
    nop
    ld   [label_2264], sp
    stop
    ld   l, d
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   l, b
    ldi  [hl], a

label_19E93::
    and  b
    inc  d
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    inc  hl
    inc  hl
    inc  hl
    ld   a, $0A
    ld   [hl], a
    pop  bc
    ld   hl, $C210
    add  hl, bc
    ld   a, $28
    ld   [hl], a
    call label_C05
    jr   z, label_19EDE
    ld   a, [$FF98]
    ld   [$FFEE], a
    ld   a, [$C145]
    sub  a, $10
    ld   [$FFEC], a
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $03
    ld   [$FF9E], a
    xor  a
    ld   [$C137], a
    ld   [$C16A], a
    ld   [$C122], a
    ld   [$C121], a
    ld   de, label_19E93
    call label_3C77
    call label_3D8A

label_19EDE::
    ld   e, $00
    ld   a, [$FF98]
    cp   $30
    jr   c, label_19EEE
    ld   e, $01
    cp   $60
    jr   c, label_19EEE
    ld   e, $02

label_19EEE::
    ld   a, e
    ld   [$FFF1], a
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_19E63
    add  hl, de
    ld   a, [$FFEC]
    sub  a, $04
    ld   [$FFEC], a
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0
    call label_3D8A
    call label_1A4C6
    call label_1A41A
    ld   a, [$FFF0]
    rst  0
    jr   nc, label_19F7A
    ld   d, h
    ld   e, a
    sub  a, c
    ld   e, a
    inc  e
    ld   h, b
    dec  h
    ld   h, b

label_19F23::
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $28
    cp   $50
    jp   label_1A47E
    call label_19F23
    ret  nc
    ld   a, $17
    call label_2385
    ld   hl, $C19F
    set  7, [hl]
    ld   a, [$D415]
    and  $01
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   a, [$DB75]
    cp   $07
    jr   nz, label_19F51
    inc  [hl]
    inc  [hl]

label_19F51::
    jp   label_3B12
    call label_19F23
    ret  nc
    ld   a, [$DB0D]
    and  a
    jr   nz, label_19F76
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  $01
    ld   a, $18
    jr   z, label_19F6B
    ld   a, $19

label_19F6B::
    call label_2385
    ld   hl, $C19F
    set  7, [hl]
    jp   label_3B12

label_19F76::
    ld   a, $1C
    call label_2385
    ld   hl, $C19F
    set  7, [hl]
    ret

label_19F81::
    jr   z, label_19FC5
    rlca
    rlca

label_19F85::
    nop
    nop
    nop
    nop

label_19F89::
    inc  e
    ld   a, [hli]
    rlca
    rlca

label_19F8D::
    nop
    nop
    nop
    nop
    ld   a, [$C19F]
    and  a
    jp   nz, label_1A01B
    ld   a, [$C177]
    and  a
    jr   nz, label_1A00D
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_19F85
    add  hl, de
    ld   a, [hl]
    ld   hl, label_19F81
    add  hl, de
    ld   e, [hl]
    ld   d, a
    ld   a, [$DB5E]
    sub  a, e
    ld   a, [$DB5D]
    sbc  a, d
    jr   nc, label_19FBD
    ld   a, $1B
    jr   label_1A00F

label_19FBD::
    ld   a, [$DB75]
    inc  a
    and  $07
    ld   [$DB75], a
    jr   nz, label_19FD5
    ld   a, $1E
    call label_2385
    ld   hl, $C19F
    set  7, [hl]
    jp   label_3B12

label_19FD5::
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_19F89
    add  hl, de
    ld   a, [$DB92]
    add  a, [hl]
    ld   [$DB92], a
    rl   a
    ld   hl, label_19F8D
    add  hl, de
    rr   a
    ld   a, [$DB91]
    adc  a, [hl]
    ld   [$DB91], a
    ld   hl, $DB0D
    inc  [hl]
    ld   a, $1A
    call label_1A00F
    call label_3B12
    ld   [hl], $04
    call label_C05
    ld   [hl], $20
    ld   a, $01
    ld   [$FFF2], a
    ret

label_1A00D::
    ld   a, $1D

label_1A00F::
    call label_2385
    ld   hl, $C19F
    set  7, [hl]
    call label_3B12
    ld   [hl], b

label_1A01B::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_1A024
    jr   label_19FD5

label_1A024::
    ret
    call label_C05
    ret  nz
    ld   a, [$C19F]
    and  a
    jr   nz, label_1A048
    ld   a, [$C5A9]
    and  a
    jr   nz, label_1A044
    ld   a, $FF
    ld   [$DB93], a
    ld   a, $9A
    call label_2373
    ld   hl, $C19F
    set  7, [hl]

label_1A044::
    call label_3B12
    ld   [hl], b

label_1A048::
    ld   a, $02
    ld   [$FFA1], a
    ret

label_1A04D::
    ld   [hl], b
    nop
    ld   [hl], d
    nop
    ld   [hl], d
    jr   nz, label_1A0C4
    jr   nz, label_1A0CA
    nop
    db   $76 ; Halt
    nop
    db   $76 ; Halt
    jr   nz, label_1A0D0
    jr   nz, label_1A0CE
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], h
    ld   [bc], a
    db   $76 ; Halt
    ld   [bc], a
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], h
    ldi  [hl], a

label_1A06D::
    ld   a, b
    ld   [bc], a
    ld   a, d
    ld   [bc], a
    ld   a, h
    ld   [bc], a
    ld   a, [hl]
    ld   [bc], a
    ld   a, d
    jr   nz, label_1A0F0
    jr   nz, label_1A0F8
    jr   nz, label_1A0F8
    jr   nz, label_1A0BC
    nop
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1A0A2
    ld   de, label_1A07D
    call label_3C77
    call label_1A4C6
    call label_1A541
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    call label_C05
    jp   z, label_1A5DB
    ret

label_1A0A2::
    ld   a, [$DB56]
    cp   $80
    jp   nz, label_1A170
    ld   a, [$DB95]
    cp   $01
    jp   z, label_1A170
    ld   de, label_1A04D
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    cp   $72

label_1A0BC::
    jr   nz, label_1A0C1
    ld   de, label_1A05D

label_1A0C1::
    call label_3BC0

label_1A0C4::
    call label_1A5A4
    ld   a, e
    dec  a
    and  $02
    xor  $02
    ld   e, a

label_1A0CE::
    ld   a, [$FFE7]

label_1A0D0::
    rra
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    rst  0
    push hl
    ld   h, b
    db   $FD ; Undefined instruction
    ld   h, b
    inc  [hl]
    ld   h, c
    call label_1A4C6
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $30
    ld   a, $0E

label_1A0F0::
    ld   [$D368], a
    ld   [$FFB0], a
    ld   [$FFBD], a

label_1A0F7::
    ld   hl, $C2D0

label_1A0FA::
    add  hl, bc
    inc  [hl]
    ret
    call label_1A4C6
    call label_1A5A4
    add  a, $20
    cp   $40
    jr   c, label_1A110
    ld   hl, $C2C0
    add  hl, bc
    dec  [hl]
    jr   nz, label_1A124

label_1A110::
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFEB]
    cp   $71
    jr   nz, label_1A121
    ld   a, $20
    call label_237C

label_1A121::
    jp   label_1A0F7

label_1A124::
    ld   a, $08
    call label_3BAA
    call label_1A541
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ret
    xor  a
    ld   [$C167], a
    ld   a, [$FFEF]
    ld   [$FFEC], a
    call label_1A41A
    call label_3D8A
    call label_1A45D
    jr   nc, label_1A14C
    ld   a, $20
    call label_237C

label_1A14C::
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1A161
    and  $80
    jr   z, label_1A16F

label_1A161::
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1A16F
    ld   [hl], $10

label_1A16F::
    ret

label_1A170::
    ld   hl, $C380
    add  hl, bc
    ld   a, [$FFF1]
    or   [hl]
    ld   [$FFF1], a
    ld   de, label_1A06D
    call label_3BC0
    call label_1A4C6
    call label_1A230
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1A19F
    xor  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a

label_1A19F::
    ld   a, [$FFF0]
    rst  0
    and  [hl]
    ld   h, c
    db   $EC ; Undefined instruction
    ld   h, c
    call label_C05
    jr   nz, label_1A1EB
    ld   [hl], $80
    call label_3B12
    ld   a, $01
    call label_3B0C
    ld   a, $71
    call label_3B86
    jr   c, label_1A1EB
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   a, [$FFEB]
    cp   $71
    ld   a, $14
    jr   z, label_1A1E0
    ld   a, $EC

label_1A1E0::
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $24

label_1A1EB::
    ret
    call label_C05
    jr   nz, label_1A1F8
    ld   [hl], $60
    call label_3B12
    ld   [hl], b
    ret

label_1A1F8::
    cp   $60
    ret  nc
    cp   $40
    jr   nc, label_1A20A
    ld   a, [$FFE8]
    and  a

label_1A202::
    jr   z, label_1A20A
    ld   hl, $C320
    add  hl, bc

label_1A208::
    ld   [hl], $08

label_1A20A::
    xor  a
    jp   label_3B0C
    ld   a, [$FFF6]
    cp   $92
    jr   nz, label_1A21C
    ld   a, [$DB0E]
    cp   $07
    jp  c, label_1A5DB

label_1A21C::
    ld   de, label_1A04D
    call label_3BC0
    call label_1A4C6
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C

label_1A230::
    ld   a, [$FFEF]
    ld   [$FFEC], a
    call label_1A41A
    call label_3D8A
    call label_1A45D
    ret  nc
    ld   a, [$DB0E]
    cp   $0A
    jr   nz, label_1A24F
    ld   a, [$DB69]
    and  $02
    ld   a, $6F
    jp   nz, label_2373

label_1A24F::
    ld   a, [$DB74]
    and  a
    jr   z, label_1A25A
    ld   a, $23
    jp   label_2373

label_1A25A::
    ld   a, [$DB73]
    and  a
    jr   z, label_1A265
    ld   a, $21
    jp   label_2373

label_1A265::
    ld   a, [$FFF6]
    cp   $92
    jr   nz, label_1A277
    ld   a, [$D8FD]
    and  $30
    jr   nz, label_1A277
    ld   a, $20
    jp   label_2373

label_1A277::
    ld   a, [$DB66]
    and  $02
    jr   z, label_1A290
    ld   a, [$DABE]
    and  $10
    jr   nz, label_1A290
    ld   a, [$FFF6]
    cp   $83
    jr   nz, label_1A290
    ld   a, $22
    jp   label_2373

label_1A290::
    ld   hl, $DB7E
    ld   a, [hl]
    push af
    inc  a
    cp   $04
    jr   nz, label_1A29B
    xor  a

label_1A29B::
    ld   [hl], a
    ld   a, [$DB65]
    and  $02
    jr   nz, label_1A2A9
    pop  af
    add  a, $18
    jp   label_2373

label_1A2A9::
    pop  af
    ld   a, [$FFEB]
    sub  a, $70
    add  a, $1C
    jp   label_2373
    call label_1A376
    call label_1A4C6
    call label_C56
    call label_3B70
    call label_1A41A
    ld   a, [$FFF0]
    rst  0
    bit  4, d
    db   $D3 ; Undefined instruction
    ld   h, d
    and  $62
    call label_C05
    ld   [hl], $C0
    jp   label_3B12
    call label_C05
    jr   nz, label_1A2DD
    ld   [hl], $50
    call label_3B12

label_1A2DD::
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_C05
    jr   nz, label_1A2EF
    call label_3B12
    ld   [hl], b

label_1A2EF::
    cp   $4A
    jr   nz, label_1A311
    ld   a, $7D
    call label_3B86
    jr   c, label_1A311
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    push bc
    ld   c, e
    ld   b, d
    ld   a, $0C
    call label_3BAA
    pop  bc

label_1A311::
    ld   a, $02
    jp   label_3B0C

label_1A316::
    ld    hl, sp+$F8
    ld   [hl], b
    ld   [bc], a
    ld    hl, sp+$00
    ld   [hl], d
    ld   [bc], a
    ld    hl, sp+$08
    ld   [hl], d
    ldi  [hl], a
    ld    hl, sp+$10
    ld   [hl], b
    ldi  [hl], a
    ld   [label_1B4F8], sp
    ld   [bc], a
    ld   [label_1B600], sp
    ld   [bc], a
    ld   [label_1B608], sp
    ldi  [hl], a
    ld   [label_1B410], sp
    ldi  [hl], a
    ld   sp, hl
    ld   sp, hl
    ld   [hl], b
    ld   [bc], a
    ld   sp, hl
    ld   bc, label_272
    ld   sp, hl
    rlca
    ld   [hl], d
    ldi  [hl], a
    ld   sp, hl
    rrca
    ld   [hl], b
    ldi  [hl], a
    rlca
    ld   sp, hl
    ld   [hl], h
    ld   [bc], a
    rlca
    ld   bc, label_276
    rlca
    rlca
    db   $76 ; Halt
    ldi  [hl], a
    rlca
    rrca
    ld   [hl], h
    ldi  [hl], a
    ld    hl, sp+$F8
    ld   a, b
    ld   [bc], a
    ld    hl, sp+$00
    ld   a, d
    ld   [bc], a
    ld    hl, sp+$08
    ld   a, d
    ldi  [hl], a
    ld    hl, sp+$10
    ld   a, b
    ldi  [hl], a
    ld   [label_1BCF8], sp
    ld   [bc], a
    ld   [label_1BE00], sp
    ld   [bc], a
    ld   [label_1BE08], sp
    ldi  [hl], a
    ld   [label_1BC10], sp
    ldi  [hl], a

label_1A376::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_1A316
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $08
    jp   label_3DA0

label_1A38F::
    ld   e, $02
    ld   e, $62
    ld   e, $42
    ld   e, $22
    ldd  [hl], a
    nop
    ldd  [hl], a
    jr   nz, label_1A3CC
    nop
    jr   nc, label_1A3BF
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $30
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1A3B5
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [$FFED], a

label_1A3B5::
    ld   de, label_1A38F
    call label_3BC0
    call label_C05
    jr   z, label_1A3CE
    dec  a
    jp   z, label_1A5DB
    rra
    rra
    rra
    and  $01
    add  a, $02
    jp   label_3B0C

label_1A3CE::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   c, label_1A3DD
    call label_C05
    ld   [hl], $10
    ret

label_1A3DD::
    ld   [hl], b
    call label_1A4C6
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_3B39
    call label_1A541
    jp   label_19E54

label_1A3F4::
    ld   d, b
    ld   [bc], a
    ld   d, b
    ldi  [hl], a
    ld   d, d
    ld   [bc], a
    ld   d, d
    ldi  [hl], a
    ld   de, label_1A3F4
    call label_3BC0
    call label_1A4C6
    call label_C56
    call label_3B70
    call label_1A41A
    ld   a, [$FFE7]

label_1A410::
    ld   e, b
    and  $30
    jr   z, label_1A416
    inc  e

label_1A416::
    ld   a, e
    jp   label_3B0C

label_1A41A::
    call label_3B5A
    jr   nc, label_1A43C

label_1A41F::
    call label_CBE
    call label_CB6
    ld   a, [$C1A6]
    and  a
    jr   z, label_1A43C
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_1A43C
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_1A43C::
    ret

label_1A43D::
    ld   b, $04
    ld   [bc], a
    nop

label_1A441::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1A43D
    add  hl, de
    push hl
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    rra
    pop  hl
    and  $01
    or   [hl]
    jp   label_3B0C

label_1A45D::
    ld   e, b
    ld   a, [$FFEB]
    cp   $77
    jr   z, label_1A468
    cp   $7B
    jr   nz, label_1A474

label_1A468::
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $2C
    jr   label_1A47E

label_1A474::
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $28

label_1A47E::
    jr   nc, label_1A4C4
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_1A4C4
    inc  e
    ld   a, [$FFEB]
    cp   $78
    jr   z, label_1A49F
    push de
    call label_1A5B4
    ld   a, [$FF9E]
    xor  $01
    cp   e
    pop  de
    jr   nz, label_1A4C4

label_1A49F::
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_1A4C4
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_1A4C4
    ld   a, [$FFCC]
    and  $10
    jr   z, label_1A4C4
    scf
    ret

label_1A4C4::
    and  a
    ret

label_1A4C6::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_1A4F5

label_1A4CC::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_1A4F5
    cp   $01
    jr   z, label_1A4E2
    cp   $0B
    jr   nz, label_1A4F5
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_1A4F5

label_1A4E2::
    ld   hl, $C1A8
    ld   a, [$C19F]
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_1A4F5
    ld   a, [$C124]
    and  a
    jr   z, label_1A4F6

label_1A4F5::
    pop  af

label_1A4F6::
    ret

label_1A4F7::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1A540
    dec  a
    ld   [hl], a
    call label_3E8E
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C400
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_1A541
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_1A533
    call label_3B23

label_1A533::
    ld   hl, $C250
    add  hl, bc
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af

label_1A540::
    ret

label_1A541::
    call label_1A54E
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_1A54E
    pop  bc
    ret

label_1A54E::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1A579
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_1A566::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_1A570
    ld   e, $F0

label_1A570::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_1A579::
    ret

label_1A57A::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1A579
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_1A566

label_1A594::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_1A5A2
    inc  e

label_1A5A2::
    ld   d, a
    ret

label_1A5A4::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   nz, label_1A5B2
    inc  e

label_1A5B2::
    ld   d, a
    ret

label_1A5B4::
    call label_1A594
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_1A5C1
    cpl
    inc  a

label_1A5C1::
    push af
    call label_1A5A4
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_1A5CF
    cpl
    inc  a

label_1A5CF::
    pop  de
    cp   d
    jr   nc, label_1A5D7
    ld   a, [$FFD7]
    jr   label_1A5D9

label_1A5D7::
    ld   a, [$FFD8]

label_1A5D9::
    ld   e, a
    ret

label_1A5DB::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_1A5E1::
    ld   l, d
    inc  hl
    ld   l, b
    inc  hl
    ld   l, b
    inc  bc
    ld   l, d
    inc  bc
    ld   l, h
    ld   b, e
    ld   l, h
    ld   h, e
    ld   l, h
    inc  bc
    ld   l, h
    inc  hl
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [$FFED], a
    ld   de, label_1A5E1
    call label_3BC0
    call label_1A4C6
    call label_3B4F
    call label_1A541

label_1A608::
    call label_3B2E
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    jp   label_1A5DB

label_1A615::
    ld   e, h
    nop
    ld   e, h
    jr   nz, label_1A676
    inc  d
    ld   e, h
    inc  [hl]

label_1A61D::
    nop
    stop
    ld   a, [$FF00]
    ld   a, [$FF00]
    db   $10 ; Undefined instruction
    nop
    ld   a, [$FF00]
    stop
    ld   a, [$FF00]

label_1A62D::
    ld   bc, label_208
    inc  b
    ld   bc, label_204
    ld   [$013E], sp
    ld   [$FFBE], a
    ld   a, [$FFE7]
    rra
    and  $01
    ld   [$FFF1], a
    ld   de, label_1A615
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    call label_3B44
    call label_1A541
    call label_1A6CC
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    ld   e, a
    ld   hl, label_1A62D
    add  hl, de
    push hl
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    pop  hl
    and  [hl]
    jr   nz, label_1A685
    call label_C05
    jr   nz, label_1A690
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   nz, label_1A69D
    call label_C05
    ld   [hl], $09
    jr   label_1A69D

label_1A685::
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $03
    ld   [hl], a
    jr   label_1A69D

label_1A690::
    cp   $06
    jr   nz, label_1A69D
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    and  $03
    ld   [hl], a

label_1A69D::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    ld   e, a
    ld   hl, label_1A61D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    ld   e, a
    ld   hl, label_1A625
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ret

label_1A6CC::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push af
    ld   [hl], $01
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    push af
    ld   [hl], $01
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FF
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    pop  af
    or   [hl]
    ld   [hl], a
    pop  af
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    pop  af
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ret
    ld   b, d
    nop
    ld   b, d
    jr   nz, label_1A74D
    nop
    ld   b, b
    jr   nz, label_1A773
    nop
    ld   h, d
    jr   nz, label_1A775
    nop
    ld   h, b
    jr   nz, label_1A719

label_1A719::
    dec  b
    ld   a, [bc]
    dec  c

label_1A71C::
    ld   c, $0D
    ld   a, [bc]
    dec  b
    nop
    ei
    or   $F3
    ld   a, [$FF00+C]
    or   $FB
    nop
    dec  b
    ld   a, [bc]
    dec  c

label_1A72C::
    inc  c
    inc  b
    ld   [label_1100], sp
    ld   [$F067], sp
    rst  $30
    cp   $0A
    jr   nz, label_1A73C
    ld   de, label_1A710

label_1A73C::
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    ld   c, a
    ld   h, a

label_1A74D::
    adc  a, a
    ld   h, a
    call label_C05
    jp   nz, label_1A7E6
    call label_1A594
    add  a, $20
    cp   $40
    jp   nc, label_1A7E6
    call label_1A5A4
    add  a, $20
    cp   $40
    jp   nc, label_1A7E6
    call label_1A5B4
    ld   d, $00
    ld   hl, label_1A72C
    add  hl, de
    ld   a, [hl]

label_1A773::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_C05
    call label_280D
    and  $3F
    add  a, $50
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $01
    call label_3B12
    jp   label_1A7E6
    call label_1A541
    call label_3B23
    call label_C05
    jr   nz, label_1A7A2
    ld   [hl], $20
    call label_3B12
    ld   [hl], b
    jr   label_1A7E6

label_1A7A2::
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   c, label_1A7E6
    ld   [hl], b
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    add  a, [hl]
    and  $0F
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1A718
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1A71C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $1F
    jr   nz, label_1A7E6
    call label_280D
    and  $02
    dec  a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a

label_1A7E6::
    ld   a, [$FFF0]
    and  a
    jr   z, label_1A7F2
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01

label_1A7F2::
    jp   label_3B0C
    ld   a, c
    ld   [$C501], a
    ld   a, [$FFF6]
    cp   $64
    jr   nz, label_1A80D
    ld   a, [$D9E3]
    and  $40
    ret  z
    ld   a, [$DB69]
    and  $02
    jp   nz, label_1A5DB

label_1A80D::
    ld   a, [$FFF6]
    cp   $AC
    jr   nz, label_1A81A
    ld   a, [$FFF8]
    and  $10
    jp   z, label_1A5DB

label_1A81A::
    ld   a, [$FFF6]
    cp   $41
    jr   nz, label_1A829
    ld   a, [$DB11]
    and  a
    ret  z
    call label_C00
    ret  nz

label_1A829::
    ld   a, [$FFF6]
    cp   $EE
    jr   nz, label_1A835
    ld   a, [$DB12]
    and  a
    jr   label_1A89D

label_1A835::
    ld   a, [$FFF6]
    cp   $D2
    jr   z, label_1A84E
    cp   $36
    jr   nz, label_1A853
    ld   a, [$DB66]
    and  a
    jp   nz, label_1A5DB
    ld   a, [$DB56]
    cp   $01
    jp   nz, label_1A5DB

label_1A84E::
    ld   a, [$DB65]
    jr   label_1A89B

label_1A853::
    ld   a, [$FFF6]
    cp   $08
    jr   nz, label_1A869
    ld   a, [$DB6C]
    and  $02
    jp   nz, label_1A5DB
    ld   a, [$D808]
    and  $10
    ret  z
    jr   label_1A8A0

label_1A869::
    cp   $9D
    jr   nz, label_1A872
    ld   a, [$DB69]
    jr   label_1A89B

label_1A872::
    cp   $06
    jr   nz, label_1A87E
    ld   a, [$D806]
    and  $10
    ret  z
    jr   label_1A8A0

label_1A87E::
    cp   $B6
    jr   nz, label_1A887
    ld   a, [$DB67]
    jr   label_1A89B

label_1A887::
    cp   $17
    jr   z, label_1A88F
    cp   $9C
    jr   nz, label_1A894

label_1A88F::
    ld   a, [$DB6A]
    jr   label_1A89B

label_1A894::
    cp   $16
    jr   nz, label_1A8A0
    ld   a, [$DB66]

label_1A89B::
    and  $02

label_1A89D::
    jp   z, label_1A5DB

label_1A8A0::
    ld   a, [$FFF6]
    cp   $D2
    jr   z, label_1A8B4
    cp   $16
    jr   z, label_1A8B4
    cp   $36
    jr   z, label_1A8B4
    ld   a, [$FFF0]
    cp   $00
    jr   z, label_1A8B7

label_1A8B4::
    call label_1AA4F

label_1A8B7::
    ld   a, [$FFE7]
    and  $B0
    ld   a, $00
    jr   nz, label_1A8C0
    inc  a

label_1A8C0::
    call label_3B0C
    ld   a, [$C124]
    and  a
    ret  nz
    ld   a, [$FFF0]
    rst  0
    push de
    ld   l, b
    cpl
    ld   l, c
    ld   [hl], d
    ld   l, c
    and  c
    ld   l, c
    jp   z, label_F069
    or   $FE
    ld   a, [$FF00+C]
    inc  d
    ld   a, $1D
    ld   [$FFB0], a
    ld   a, [$FF99]
    cp   $44
    ret  c
    ld   a, [$FF98]
    sub  a, $58
    add  a, $18
    cp   $30
    ret  nc
    jr   label_1A8F6
    ld   a, [$DB4E]
    and  a
    jp   z, label_1A5DB

label_1A8F6::
    ld   a, [$FFB0]

label_1A8F8::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   a, $22
    ld   [$D368], a
    ld   [$FFB0], a
    ld   [$FFBD], a
    ld   a, [$FFF6]
    cp   $16
    jr   z, label_1A914
    cp   $36
    jr   z, label_1A914
    cp   $D2
    jr   nz, label_1A91A

label_1A914::
    call label_3B12
    ld   [hl], $02
    ret

label_1A91A::
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $20
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $18
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $10
    jp   label_3B12
    call label_1A5B4
    ld   a, e
    xor  $01
    ld   [$FF9E], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $05
    ld   [$C111], a
    call label_1A9BD
    call label_1A541
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1A951
    jp   label_3B12

label_1A951::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $FC
    call label_1A57A
    call label_29F8
    ld   a, [$FFE7]
    and  $03
    ret  nz
    ld   a, $00
    ld   hl, $C250
    call label_1AA2B
    ld   a, $00
    ld   hl, $C240
    jp   label_1AA2B
    call label_1A4C6
    call label_1A41A
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$C17B]
    and  a
    ret  nz
    ld   a, [$FFF6]
    cp   $06
    jr   nz, label_1A990
    ld   a, $CD
    call label_2385
    jr   label_1A993

label_1A990::
    call label_2A07

label_1A993::
    ld   a, $19
    ld   [$C5AB], a
    call label_3B12
    call label_C05
    ld   [hl], $10
    ret
    call label_1A4C6
    ld   a, [$FFF6]
    cp   $06
    jr   z, label_1A9B2
    call label_C05
    jr   nz, label_1A9BD
    call label_3B12

label_1A9B2::
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   hl, $D800
    add  hl, de
    set  5, [hl]
    ret

label_1A9BD::
    ld   a, $02
    ld   [$FFA1], a
    ld   a, [$FFE7]
    rra
    rra
    and  $02
    jp   label_3B0C
    call label_1A4C6
    call label_1A9BD
    call label_1A541
    call label_19E54
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $04
    call label_1A57A
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1AA05
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$D368], a
    ld   [$FFB0], a
    ld   a, [$D47C]
    and  a
    jr   z, label_1AA04
    ld   a, [$DC0F]
    and  a
    jr   nz, label_1AA04
    ld   a, $49
    ld   [$D368], a
    ld   [$FFBD], a

label_1AA04::
    ret

label_1AA05::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1AA0F
    ld   a, $05
    ld   [$FFF4], a

label_1AA0F::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_1AA36
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    call label_1AA2B
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240

label_1AA2B::
    add  hl, bc
    sub  a, [hl]
    jr   z, label_1AA36
    bit  7, a
    jr   z, label_1AA35
    dec  [hl]
    dec  [hl]

label_1AA35::
    inc  [hl]

label_1AA36::
    ret

label_1AA37::
    ld   a, b
    ld   bc, label_2178
    ld   a, d
    ld   bc, label_217A

label_1AA3F::
    nop
    ld    hl, sp+$7C
    ld   bc, $0000
    ld   a, [hl]
    ld   bc, label_800
    ld   a, [hl]
    ld   hl, label_1000
    ld   a, h
    ld   hl, $F1F0
    cp   $02
    jr   nc, label_1AA5B
    ld   de, label_1AA37
    jp   label_3BC0

label_1AA5B::
    ld   hl, label_1AA3F
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0
    ld   a, [$FFF6]
    cp   $08
    jr   z, label_1AA71
    jp   label_3CD9

label_1AA71::
    ld   hl, $C340
    add  hl, bc
    res  4, [hl]
    ret

label_1AA78::
    ld   d, b
    ld   [bc], a
    ld   d, d
    ld   [bc], a
    ld   a, [$FFEC]
    sub  a, $05
    ld   [$FFEC], a
    ld   de, label_1AA78
    call label_3BC0
    call label_1A4C6
    call label_1A45D
    ret  nc
    ld   e, $FD
    ld   a, [$FFF6]
    cp   $A9
    jp   z, label_1ABAD
    ld   e, $6E
    ld   a, [$DB0E]
    cp   $0A
    jr   nz, label_1AAA9
    ld   a, [$DB69]
    and  $02
    jp   nz, label_1ABAD

label_1AAA9::
    ld   e, $41
    ld   a, [$DAA9]
    and  $20
    jp   z, label_1ABAD
    ld   e, $46
    ld   a, [$DB65]
    and  $02
    jp   z, label_1ABAD
    ld   e, $42
    ld   a, [$DB56]
    cp   $80
    jp   z, label_1ABAD
    ld   e, $43
    ld   a, [$DB66]
    and  $02
    jp   z, label_1ABAD
    ld   e, $44
    ld   a, [$DB56]
    cp   $01
    jp   z, label_1ABB3
    ld   e, $44
    ld   a, [$DB55]
    cp   $02
    jp   nz, label_1ABAD
    ld   e, $45
    ld   a, [$DB0E]
    cp   $05
    jp  c, label_1ABAD
    ld   a, [$DB15]
    cp   $05
    jr   nc, label_1AB09
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $03
    jr   nz, label_1AB02
    xor  a
    ld   [hl], a

label_1AB02::
    ld   e, $28
    add  a, e
    ld   e, a
    jp   label_1ABB3

label_1AB09::
    ld   e, $48
    jp   z, label_1ABAD
    cp   $06
    jp   nz, label_1ABAD
    ld   e, $49
    ld   a, [$DB67]
    and  $02
    jp   z, label_1ABAD
    ld   e, $4A
    ld   a, [$DB12]
    and  a
    jp   z, label_1ABAD
    ld   e, $40
    ld   a, [$DB68]
    and  $02
    jp   z, label_1ABB3
    ld   a, [$DB79]
    and  a
    jr   z, label_1AB3F
    ld   e, $4B
    ld   a, [$D9E3]
    and  $40
    jr   z, label_1ABAD

label_1AB3F::
    ld   e, $4C
    ld   a, [$DB69]
    and  $02
    jr   z, label_1ABAD
    ld   e, $45
    ld   a, [$DB49]
    and  $01
    jp   z, label_1ABB3
    ld   e, $4D
    ld   a, [$DB6A]
    and  $02
    jr   z, label_1ABAD
    ld   e, $4E
    ld   a, [$DB7B]
    and  a
    jr   z, label_1AB6E
    ld   e, $46
    ld   a, [$DB14]
    and  a
    jp   z, label_1ABB3
    ld   e, $41

label_1AB6E::
    ld   a, [$DB6B]
    and  $02
    jr   nz, label_1AB7C
    ld   a, e
    cp   $4E
    jr   z, label_1ABAD
    jr   label_1ABB3

label_1AB7C::
    ld   e, $4F
    ld   a, [$D810]
    and  $30
    jr   z, label_1ABAD
    ld   e, $48
    ld   a, [$DB6C]
    and  $02
    jr   z, label_1ABB3
    ld   e, $42
    ld   a, [$D806]
    and  $30
    jr   z, label_1ABB3
    ld   e, $43
    ld   a, [$DA74]
    and  $40
    jr   z, label_1ABB3
    ld   e, $47
    ld   a, [$DB4E]
    cp   $02
    jr   c, label_1ABB3
    ld   e, $48
    jr   label_1ABB3

label_1ABAD::
    ld   a, e
    call label_2373
    jr   label_1ABB7

label_1ABB3::
    ld   a, e
    call label_237C

label_1ABB7::
    ld   hl, $DAA9
    set  5, [hl]
    ret

label_1ABBD::
    ld   e, [hl]
    ld   bc, label_1815E

label_1ABC1::
    inc  b
    db   $FC ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    ld   [bc], a
    cp   $05
    ld   a, [$F1F0]
    cp   $01
    jr   nz, label_1ABD5
    ld   a, [$FFEC]
    sub  a, $00
    ld   [$FFEC], a

label_1ABD5::
    ld   de, label_1ABBD
    call label_3C77
    call label_1A4C6
    ld   a, c
    sla  a
    sla  a
    sla  a
    ld   hl, $FFE7
    add  a, [hl]
    ld   [$FFF0], a
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_1A541
    ld   a, [$FFF0]
    and  $1F
    jr   nz, label_1AC12
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1ABC1
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    add  a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a

label_1AC12::
    ld   a, [$FFF0]
    add  a, $10
    and  $1F
    jr   nz, label_1AC30
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1ABC1
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_1AC30::
    ld   a, [$FFF0]
    and  $3F
    jr   nz, label_1AC6C
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, [$C50F]
    cp   $FF
    jr   z, label_1AC53
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    ld   [$FF98], a
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   [$FF99], a

label_1AC53::
    ld   a, $02
    call label_3BB5
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    ld   a, [$FFD7]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a

label_1AC6C::
    ret
    ld   a, c
    ld   [$D202], a
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_1AC7B
    ld   a, $10
    ld   [$FFF5], a

label_1AC7B::
    call label_1AE7E
    call label_3EE8
    call label_394D
    ld   a, [$FFEA]
    cp   $05
    jr   z, label_1ACE8
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $80
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    sbc  a, d
    ld   l, h
    xor  e
    ld   l, h
    call label_C05
    ld   [hl], $FF
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ret
    call label_C05
    jp   z, label_1ACBE
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    cp   $80
    jr   nc, label_1ACBD
    call label_1B00A

label_1ACBD::
    ret

label_1ACBE::
    call label_27DD
    call label_3F50
    ld   a, [$FFF7]
    cp   $07
    ret  z

label_1ACC9::
    ld   hl, $D900
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_1ACDB
    ld   hl, $DDE0
    jr   label_1ACE4

label_1ACDB::
    cp   $1A
    jr   nc, label_1ACE4
    cp   $06
    jr   c, label_1ACE4
    inc  d

label_1ACE4::
    add  hl, de
    set  5, [hl]
    ret

label_1ACE8::
    call label_1A4C6
    call label_1A4F7
    call label_3B39
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE9], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1AD0D
    ld   e, $00
    and  $80
    jr   nz, label_1AD08
    ld   e, $03

label_1AD08::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_1AD0D::
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    nop
    nop
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1AD32
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    ld   [hl], b
    cp   $F2
    jr   nc, label_1AD32
    ld   a, $20
    ld   [$FFF2], a

label_1AD32::
    ld   a, [$FFF0]
    rst  0
    dec  a
    ld   l, l
    ld   a, e
    ld   l, l
    xor  c
    ld   l, l
    or   b
    ld   l, l
    call label_C05
    ret  nz
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    ld   e, $08
    bit  7, a
    jr   nz, label_1AD55
    ld   e, $F8

label_1AD55::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    add  a, $10
    cp   $20
    jr   nc, label_1AD68
    call label_C05
    ld   [hl], $18
    jp   label_3B12

label_1AD68::
    call label_1A54E
    ld   a, [$FFE8]
    and  a
    jr   z, label_1AD76
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $0C

label_1AD76::
    ld   a, $01
    jp   label_3B0C
    call label_C05
    ret  nz
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   a, $10
    jr   nz, label_1AD8B
    ld   a, $F0

label_1AD8B::
    push af
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C240
    add  hl, de
    pop  af
    ld   [hl], a
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    call label_C05
    ld   [hl], $20
    call label_3B12
    xor  a
    jp   label_3B0C
    call label_C05
    ret  nz
    jp   label_3B12
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $08
    ld   a, $01
    jr   c, label_1ADBC
    inc  a

label_1ADBC::
    call label_3B0C
    call label_C05
    cp   $01
    jr   z, label_1ADD4
    cp   $00
    ret  nz
    ld   a, [$FFE8]
    and  a
    jr   z, label_1AE04
    call label_C05
    ld   [hl], $10
    ret

label_1ADD4::
    ld   e, $10
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $19
    ld   a, [$FFE9]
    cp   $05
    jr   nc, label_1ADE6
    ld   e, $14
    ld   [hl], $16

label_1ADE6::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   a, e
    jr   nz, label_1ADF1
    cpl
    inc  a

label_1ADF1::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFEC]
    cp   $50
    ld   a, e
    jr   c, label_1ADFF
    cpl
    inc  a

label_1ADFF::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_1AE04::
    call label_1A541
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    ret  z
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $08
    jp   label_3D7F

label_1AE1E::
    nop
    ld    hl, sp+$60
    ld   b, $00
    nop
    ld   h, d
    ld   b, $00
    ld   [label_664], sp
    ld   a, [$FF00]
    ld   l, [hl]
    ld   h, $00
    ld    hl, sp+$66
    ld   b, $00
    nop
    ld   l, b
    ld   b, $00
    ld   [label_66A], sp
    ld   a, [$FF00]
    ld   l, [hl]
    ld   b, $00
    ld    hl, sp+$66
    ld   b, $00
    nop
    ld   l, b
    ld   b, $00
    ld   [label_66A], sp
    ld   a, [$FF06]
    ld   l, [hl]
    ld   h, $00
    nop
    ld   h, h
    ld   h, $00
    ld   [label_2662], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, $F0
    ld   [label_66E], sp
    nop
    nop
    ld   l, d
    ld   h, $00
    ld   [label_2668], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, $F0
    ld   [label_266E], sp
    nop
    nop
    ld   l, d
    ld   h, $00
    ld   [label_2668], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, $F0
    ld   [bc], a
    ld   l, [hl]
    ld   b, $21
    add  a, b
    jp   label_F009
    pop  af
    add  a, [hl]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_1AE1E
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$FFE7]
    and  $01
    ret  nz
    ld   a, [$C3C0]
    ld   e, a
    ld   d, b
    ld   hl, $C030
    add  hl, de
    ld   a, [$FFEF]
    add  a, $0C
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, $02
    ldi  [hl], a
    ld   a, $26
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, [$FFEF]
    add  a, $0C
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, $04
    ldi  [hl], a
    ld   a, $26
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $02
    jp   label_3DA0

label_1AED5::
    ld   l, h
    rlca
    ld   l, h
    daa
    ld   l, h
    ld   b, a
    ld   l, h
    ld   h, a

label_1AEDD::
    ld   [hl], b
    ld   h, b
    ld   d, b
    ld   b, b
    jr   nc, label_1AF03
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_1AEED
    ld   a, $10
    ld   [$FFF5], a

label_1AEED::
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_1A5DB
    ld   a, c
    ld   [$D201], a
    call label_1AFEA
    call label_1A4C6
    ld   a, [$D202]
    ld   e, a
    ld   d, b

label_1AF03::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $01
    ret  z
    and  a
    jr   nz, label_1AF48
    call label_C05
    jr   nz, label_1AF47
    ld   [hl], $03
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   e, [hl]
    inc  [hl]
    ld   a, [hl]
    cp   $06
    jr   nz, label_1AF3C
    call label_1A5DB
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_3F48
    add  hl, de
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   a, [hl]
    ld   hl, $CF00
    add  hl, de
    or   [hl]
    ld   [hl], a

label_1AF3C::
    ld   d, b
    ld   hl, label_1AEDD
    add  hl, de
    ld   a, [hl]
    ld   [$FFD8], a
    jp   label_1B035

label_1AF47::
    ret

label_1AF48::
    call label_C56
    ld   a, [$FFA2]
    and  a
    jr   nz, label_1AF53
    call label_3B39

label_1AF53::
    call label_1A54E
    call label_3B23
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1AF86
    bit  7, a
    jr   z, label_1AF67
    cpl
    inc  a

label_1AF67::
    ld   e, $04
    cp   $08
    jr   nc, label_1AF6F
    ld   e, $08

label_1AF6F::
    cp   $04
    jr   nc, label_1AF75
    ld   e, $10

label_1AF75::
    cp   $02
    jr   nc, label_1AF7B
    ld   e, $20

label_1AF7B::
    ld   d, b
    ld   a, [$FFE7]
    and  e
    jr   z, label_1AF82
    inc  d

label_1AF82::
    ld   a, d
    call label_3B0C

label_1AF86::
    ld   a, [$FFF0]
    rst  0
    adc  a, a
    ld   l, a
    sub  a, b
    ld   l, a
    call nz, label_C96F
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_1AFB3
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    sra  a
    cpl
    inc  a
    ld   [hl], a
    ld   a, $20
    ld   [$C157], a
    xor  a
    ld   [$C158], a
    ld   a, $0B
    ld   [$FFF2], a
    call label_3B12

label_1AFB3::
    ld   a, [$D210]
    inc  a
    cp   $09
    jr   c, label_1AFC0
    ld   a, $1A
    ld   [$FFF3], a
    xor  a

label_1AFC0::
    ld   [$D210], a
    ret
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1AFD9
    ld   hl, $C240

label_1AFCD::
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1AFDA
    and  $80
    jr   z, label_1AFD8
    inc  [hl]
    inc  [hl]

label_1AFD8::
    dec  [hl]

label_1AFD9::
    ret

label_1AFDA::
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $50
    ret

label_1AFE4::
    add  a, b
    ld   [hl], b
    ld   h, b
    ld   d, b
    ld   b, b
    jr   nc, label_1B029
    jr   nz, label_1AFCD
    db   $EC ; Undefined instruction

label_1AFEE::
    ld   de, label_1AED5
    call label_3BC0
    ld   a, [$FFEC]
    add  a, $10
    ld   [$FFEC], a
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1AFE4
    add  hl, de
    cp   [hl]
    jr   nz, label_1AFEE
    jp   label_3D8A

label_1B00A::
    and  $07
    ret  nz
    call label_280D
    and  $1F
    sub  a, $10
    ld   e, a
    ld   hl, $FFEE
    add  a, [hl]
    ld   [hl], a
    call label_280D
    and  $1F
    sub  a, $14
    ld   e, a
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    jp   label_1B02A

label_1B02A::
    call label_1A4CC
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a

label_1B035::
    ld   a, $02
    call label_CC7
    ld   a, $13
    ld   [$FFF4], a
    ret
    ld   a, $36
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFF9]
    and  a
    jr   z, label_1B05F
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F0
    jr   label_1B06B

label_1B05F::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C310
    add  hl, de
    ld   [hl], $08

label_1B06B::
    call label_1A5DB
    jp   label_C4B

label_1B071::
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
    ld   bc, label_14A8

label_1B0A3::
    ld   bc, label_18FF
    db   $E8 ; add  sp, d
    ld   a, [$DBA5]
    and  a
    jr   z, label_1B0B8
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_1B0B8
    ld   a, $06
    jp   label_A47

label_1B0B8::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   z, label_1B123
    ld   hl, $C280
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    and  a
    jp   z, label_1A5DB
    ld   a, [$D202]
    ld   [$FFF1], a
    ld   de, label_1B0A1
    call label_3C77
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_1B120
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1B0A3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_1B0A5
    add  hl, de
    cp   [hl]
    jr   nz, label_1B100
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_1B100::
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1B0A3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_1B0A5
    add  hl, de
    cp   [hl]
    jr   nz, label_1B120
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_1B120::
    jp   label_1A541

label_1B123::
    ld   hl, label_1B071
    ld   a, [$FFE7]
    and  $08
    jr   z, label_1B12F
    ld   hl, label_1B089

label_1B12F::
    ld   c, $06
    call label_3CE6
    ld   a, $06
    call label_3DA0
    call label_3CD9
    ld   e, $FE
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $40
    jr   z, label_1B14A
    ld   e, $02

label_1B14A::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], e
    call label_1A57A
    call label_1A4C6
    ld   a, [$FFF0]
    rst  0
    ld   e, [hl]
    ld   [hl], c
    add  a, l
    ld   [hl], c
    pop  af
    ld   [hl], c
    xor  a
    ld   [$D202], a
    ld   a, c
    ld   [$D201], a
    ld   a, [$FF98]
    sub  a, $50
    add  a, $08
    cp   $10
    ret  nc
    ld   a, [$FF99]
    sub  a, $58
    add  a, $08
    cp   $10
    ret  nc
    call label_3B12
    call label_BFB
    ld   [hl], $48
    ld   a, $24
    jp   label_2385
    call label_BFB
    jr   nz, label_1B197
    call label_C05
    ld   [hl], $48
    call label_3B12
    ld   a, $26
    ld   [$FFF2], a
    ret

label_1B197::
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $1A
    ld   [$FFF2], a
    call label_1A4C6
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1B1BA
    ld   [hl], $01
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   c, label_1B1BA
    ld   a, $04
    ld   [$DB93], a

label_1B1BA::
    call label_C00
    jr   nz, label_1B1F0
    ld   [hl], $13
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $0A
    jr   z, label_1B1F0
    inc  [hl]
    ld   a, $84
    call label_3B86
    jr   c, label_1B1F0
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $01
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    add  a, $00
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    sub  a, $0E
    ld   [hl], a
    ld   hl, $C240
    add  hl, de
    ld   [hl], $E8

label_1B1F0::
    ret
    call label_C05
    jp   z, label_1A5DB
    ld   a, [$FFE7]
    and  $02
    ld   a, $00
    jr   z, label_1B201
    ld   a, $FF

label_1B201::
    ld   [$D202], a
    call label_3B0C
    ld   a, $02
    ld   [$FFA1], a
    ret

label_1B20C::
    ld   l, b
    ld   bc, label_16A
    ld   h, h
    ld   bc, label_166
    ld   l, h
    ld   bc, label_16E
    ld   l, d
    ld   hl, label_2168
    ld   h, [hl]
    ld   hl, label_2164
    ld   l, [hl]
    ld   hl, label_216C

label_1B224::
    ld   l, b
    nop
    ld   l, d
    nop
    ld   h, h
    nop
    ld   h, [hl]
    nop
    ld   l, h
    nop
    ld   l, [hl]
    nop
    ld   l, d
    jr   nz, label_1B29B
    jr   nz, label_1B29B
    jr   nz, label_1B29B
    jr   nz, label_1B2A7
    jr   nz, label_1B2A7
    jr   nz, label_1B25E
    add  a, b
    jp   label_F009
    pop  af
    add  a, [hl]
    ld   [$FFF1], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1B25A
    and  $80
    ld   a, $00
    jr   nz, label_1B255
    ld   a, $03

label_1B255::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_1B25A::
    ld   de, label_1B20C
    ld   a, [$FFF6]
    cp   $D9
    jr   nz, label_1B266
    ld   de, label_1B224

label_1B266::
    call label_3BC0
    call label_1A4C6
    ld   a, [$DBA5]
    and  a
    jp   z, label_1B372
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1B28C
    ld   [hl], b
    ld   hl, $C310
    add  hl, bc
    ld   [hl], b

label_1B28C::
    ld   a, [$FFF0]
    rst  0
    sbc  a, l
    ld   [hl], d
    db   $E3 ; Undefined instruction
    ld   [hl], d
    ld   [de], a
    ld   [hl], e

label_1B295::
    ld   [bc], a
    ld   b, $08
    ld   b, $FE
    ld   a, [$FAF8]
    call label_1B335
    xor  a
    call label_3B0C
    call label_C05

label_1B2A7::
    jr   nz, label_1B2E0
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1B295
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, e
    and  $04
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $07
    ld   e, a
    ld   hl, label_1B295
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_C05
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    call label_3B12

label_1B2E0::
    jp   label_1B308
    call label_1B335
    call label_1A541
    call label_3B23
    ld   a, [$FFE8]
    and  a
    jr   z, label_1B308
    call label_C05
    jr   nz, label_1B2FD
    ld   [hl], $30
    call label_3B12
    ld   [hl], b
    ret

label_1B2FD::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C310
    add  hl, bc
    inc  [hl]

label_1B308::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_1A541
    call label_3B23
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_1B323
    ld   hl, $C320
    add  hl, bc
    inc  [hl]

label_1B323::
    ld   a, [$FFE8]
    and  a
    jr   z, label_1B32C
    call label_3B12
    ld   [hl], b

label_1B32C::
    ld   a, [$FFE7]
    rra
    and  $02
    call label_3B0C
    ret

label_1B335::
    ld   a, [$C137]
    cp   $02
    jr   nz, label_1B371
    call label_1A594
    add  a, $18
    cp   $30
    jr   nc, label_1B371
    call label_1A5A4
    add  a, $18
    cp   $30
    jr   nc, label_1B371
    call label_3B12
    ld   [hl], $02
    ld   a, $10
    call label_3BB5
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $0C
    pop  af

label_1B371::
    ret

label_1B372::
    ret

label_1B373::
    ld   [hl], b
    ld   bc, label_2170
    ld   [hl], d
    ld   bc, label_2172
    ld   a, [$C166]
    cp   $01
    jr   nz, label_1B3AD
    ld   a, [$DB49]
    and  $04
    jr   z, label_1B3AD
    ld   a, [$DB4A]
    and  a
    jr   nz, label_1B3AD
    ld   a, [$FFEA]
    cp   $01
    jr   z, label_1B3AD
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $1F
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $04
    ld   hl, $FFF4
    ld   [hl], $13
    ret

label_1B3AD::
    ld   de, label_1B373
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    call label_1A541
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $01
    push hl
    call label_3B23
    pop  hl
    ld   [hl], b
    call label_3B39
    ld   a, [$FFF0]
    and  $01
    rst  0
    ld   [rUNKN3], a
    inc  hl
    ld   [hl], h

label_1B3D4::
    ld   [$F808], sp
    ld    hl, sp+$04
    db   $FC ; Undefined instruction

label_1B3DA::
    db   $FC ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    ld   [label_21F8], sp
    or   b
    jp   label_3609
    ld   bc, label_5CD
    inc  c
    ret  nz
    call label_3B12
    call label_280D
    and  $07
    add  a, $10
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $07
    cp   $06
    jr   c, label_1B409
    ld   a, $0A
    call label_3BAA
    jr   label_1B41F

label_1B409::
    ld   e, a
    ld   d, b
    ld   hl, label_1B3D4
    add  hl, de
    ld   a, [hl]

label_1B410::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1B3DA
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_1B41F::
    xor  a
    jp   label_3B0C
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    xor  a
    ld   [hl], a
    call label_3B12
    call label_C05
    call label_280D
    and  $0F
    add  a, $18
    ld   [hl], a
    jp   label_3D7F

label_1B446::
    ld   h, b
    rlca
    ld   h, d
    rlca
    ld   h, h
    rlca
    ld   h, [hl]
    rlca
    ld   de, label_1B446
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    xor  a
    ld   [$FFE8], a
    call label_3B70
    call label_3B5A
    jr   nc, label_1B472
    ld   a, $01
    ld   [$FFE8], a
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_1B472
    call label_CBE

label_1B472::
    call label_1A541
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    add  a, c
    ld   [hl], h
    sub  a, l
    ld   [hl], h
    jp   z, label_F074
    db   $E8 ; add  sp, d
    and  a
    jr   z, label_1B494
    call label_3B12
    call label_C05
    ld   [hl], $30
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $18

label_1B494::
    ret
    call label_C05
    jr   nz, label_1B4B2
    call label_3B12
    ld   hl, $C340
    add  hl, bc
    res  7, [hl]
    ld   hl, $C350
    add  hl, bc
    res  7, [hl]
    ld   hl, $C430
    add  hl, bc
    res  6, [hl]
    jp   label_3D7F

label_1B4B2::
    ld   e, $08
    and  $04
    jr   z, label_1B4BA
    ld   e, $F8

label_1B4BA::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    ret

label_1B4C0::
    ld    hl, sp+$FA

label_1B4C2::
    nop
    ld   b, $08
    ld   b, $00
    ld   a, [$FAF8]
    call label_C05
    jr   nz, label_1B4EF
    call label_280D
    and  $3F
    add  a, $20
    ld   [hl], a
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1B4C2
    add  hl, de
    ld   a, [hl]

label_1B4E0::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1B4C0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_1B4EF::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1B4FA::
    ld   d, b
    ld   [bc], a
    ld   d, b
    ldi  [hl], a

label_1B4FE::
    jr   nz, label_1B4E0
    nop
    nop

label_1B502::
    ld    hl, sp+$08
    nop
    nop

label_1B506::
    nop
    nop
    ld   [rNR41], a

label_1B50A::
    nop
    nop
    ld   [label_30F8], sp
    jr   nz, label_1B54F
    ld   bc, $BEE0
    ld   de, label_1B4FA
    call label_3BC0
    call label_1A4C6
    call label_C56
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    ld   l, $75
    ccf
    ld   [hl], l
    and  c
    ld   [hl], l
    jp   nz, label_F075
    xor  $21
    or   b
    jp   nz, label_1B709
    ld   a, [$FFEC]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    call label_C05
    jr   nz, label_1B599
    call label_3D7F
    call label_1A5A4
    add  a, $12
    cp   $24
    jr   nc, label_1B567
    call label_1A594
    ld   d, b
    ld   hl, label_1B4FE
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   e, $18
    jr   label_1B585

label_1B567::
    call label_1A594
    add  a, $12
    cp   $24
    jr   nc, label_1B599
    call label_1A5A4
    ld   d, b
    ld   hl, label_1B506
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   e, $10

label_1B585::
    call label_C05
    ld   [hl], e
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   z, label_1B59A
    call label_C05
    ld   [hl], b

label_1B599::
    ret

label_1B59A::
    ld   a, $0A
    ld   [$FFF4], a
    jp   label_3B12
    call label_1A541
    call label_C05
    jr   nz, label_1B5B5

label_1B5A9::
    ld   a, $07
    ld   [$FFF2], a
    call label_C05
    ld   [hl], $20
    jp   label_3B12

label_1B5B5::
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   nz, label_1B5A9
    ret
    call label_C05
    ret  nz
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1B502
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1B50A
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_1A541
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    cp   [hl]
    ret  nz
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    ret  nz
    call label_C05
    ld   [hl], $20
    call label_3B12
    ld   [hl], $01
    ret

label_1B604::
    ld   l, [hl]
    nop
    ld   l, [hl]
    jr   nz, label_1B66F
    jr   nz, label_1B66F
    jr   nz, label_1B671
    nop
    ld   h, [hl]
    nop
    ld   h, d
    nop
    ld   h, d
    jr   nz, label_1B675
    nop
    ld   h, b
    jr   nz, label_1B621
    ld    hl, sp+$00
    nop

label_1B61C::
    nop
    nop
    ld    hl, sp+$08

label_1B620::
    jr   nz, label_1B602
    nop
    nop

label_1B624::
    nop
    nop
    ld   [rNR41], a
    ld   de, label_1B604
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    call label_1A541
    call label_3B23
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   c, b
    db   $76 ; Halt
    ld   h, b
    db   $76 ; Halt
    adc  a, l
    db   $76 ; Halt
    cp   c
    db   $76 ; Halt
    ld   hl, $C2E0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1B65E
    call label_3B12
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $01
    call label_C00
    ld   [hl], $20

label_1B65E::
    jr   label_1B67E
    call label_C00
    jr   nz, label_1B679
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C290
    add  hl, bc
    add  a, [hl]

label_1B66F::
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, bc
    ld   [hl], $30
    jp   label_1B735

label_1B679::
    ld   a, [hl]
    and  $02
    jr   nz, label_1B686

label_1B67E::
    ld   a, $FF
    call label_3B0C
    jp   label_1B735

label_1B686::
    xor  a
    call label_3B0C
    jp   label_1B735
    xor  a
    call label_3B0C
    call label_C00
    cp   $02
    jr   nc, label_1B6B6
    ld   a, [hl]
    cp   $01
    jr   z, label_1B6A2
    ld   [hl], $18
    jp   label_1B735

label_1B6A2::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C290
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    cp   $01
    jr   nz, label_1B6B6
    call label_C00
    ld   [hl], $20

label_1B6B6::
    jp   label_1B735
    call label_3B39
    call label_C00
    cp   $28
    jr   z, label_1B6E9
    cp   $02
    jr   nc, label_1B72D
    ld   a, [hl]
    cp   $01
    jr   z, label_1B6DD
    ld   [hl], $40
    call label_1A5B4
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    inc  a
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ret

label_1B6DD::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C290
    add  hl, bc
    dec  [hl]
    ret

label_1B6E9::
    ld   a, $22
    call label_3B86
    jr   c, label_1B72D
    push bc
    ld   a, [$FFD9]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    ld   c, a
    ld   hl, label_1B618
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_1B61C
    add  hl, bc

label_1B709::
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_1B620
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_1B624
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a

label_1B725::
    pop  bc
    ld   a, [$FFD9]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a

label_1B72D::
    ld   hl, $C340
    add  hl, bc
    ld   a, $02
    ld   [hl], a
    ret

label_1B735::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $42
    ret

label_1B73C::
    nop
    ret  c
    ld   h, b
    nop
    nop
    ld   [$FF60], a
    jr   nz, label_1B745

label_1B745::
    jr   z, label_1B7A7
    nop
    nop
    jr   nc, label_1B7AB
    jr   nz, label_1B725

label_1B74D::
    nop
    ld   h, d
    nop
    ret  c
    ld   [label_2062], sp
    jr   z, label_1B756

label_1B756::
    ld   h, d
    nop
    jr   z, label_1B762
    ld   h, d
    jr   nz, label_1B74D
    ld   a, [$FF6A]
    nop
    ld   a, [$FFF8]

label_1B762::
    ld   l, d
    ld   h, b
    ld   a, [$FF10]
    ld   l, d
    ld   b, b
    ld   a, [$FF18]
    ld   l, d
    jr   nz, label_1B77D
    ld   a, [$FF6A]
    ld   b, b
    db   $10 ; Undefined instruction
    ld   l, d
    jr   nz, label_1B785

label_1B775::
    db   $10 ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    ld   l, d
    ld   h, b
    nop

label_1B77D::
    db   $E8 ; add  sp, d
    ld   h, b
    nop
    nop
    ld   a, [$FF60]
    jr   nz, label_1B785

label_1B785::
    jr   label_1B7E7
    nop
    nop
    jr   nz, label_1B7EB
    jr   nz, label_1B775

label_1B78D::
    nop
    ld   h, d
    nop
    db   $E8 ; add  sp, d
    ld   [label_2062], sp
    jr   label_1B796

label_1B796::
    ld   h, d
    nop
    jr   label_1B7A2
    ld   h, d
    jr   nz, label_1B78D
    ld   a, [$FFFF]
    nop
    ld   a, [$FFF8]

label_1B7A2::
    rst  $38
    nop
    ld   a, [$FF10]

label_1B7A6::
    rst  $38

label_1B7A7::
    nop
    ld   a, [$FF18]
    rst  $38

label_1B7AB::
    nop
    db   $10 ; Undefined instruction
    rst  $38
    nop
    db   $10 ; Undefined instruction

label_1B7B2::
    rst  $38
    nop
    db   $10 ; Undefined instruction
    rst  $38
    nop
    db   $10 ; Undefined instruction
    rst  $38
    nop
    ld   [$FFE0], a
    ld   l, b
    nop
    ld   [$FFE8], a
    ld   l, b
    ld   h, b
    jr   nz, label_1B7A6
    ld   l, b
    ld   b, b
    jr   nz, label_1B7B2
    ld   l, b
    jr   nz, label_1B7AD
    jr   nz, label_1B837
    ld   b, b
    ld   [$FF28], a
    ld   l, b
    jr   nz, label_1B7F5

label_1B7D5::
    jr   nz, label_1B83F
    nop
    jr   nz, label_1B802
    ld   l, b
    ld   h, b
    nop
    ld   a, [$FF64]
    nop
    nop
    ld    hl, sp+$64
    jr   nz, label_1B7D5

label_1B7E5::
    nop
    ld   h, [hl]

label_1B7E7::
    nop
    ld   a, [$FF08]
    ld   h, [hl]

label_1B7EB::
    jr   nz, label_1B7ED

label_1B7ED::
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_1B857
    jr   nz, label_1B805

label_1B7F5::
    nop
    ld   h, [hl]
    nop
    db   $10 ; Undefined instruction

label_1B7FA::
    ld   h, [hl]
    jr   nz, label_1B7E5
    db   $E8 ; add  sp, d
    ld   l, b
    nop
    db   $E8 ; add  sp, d
    ld   a, [$FF68]
    ld   h, b
    jr   label_1B7EE
    ld   l, b
    ld   b, b
    jr   label_1B7FA

label_1B80A::
    ld   l, b
    jr   nz, label_1B7F5
    jr   label_1B877
    ld   b, b
    db   $E8 ; add  sp, d
    jr   nz, label_1B87B
    jr   nz, label_1B82D

label_1B815::
    jr   label_1B87F
    nop
    jr   label_1B83A
    ld   l, b
    ld   h, b
    nop
    ld   a, [$FFFF]
    nop
    nop
    ld    hl, sp+$FF
    jr   nz, label_1B815
    nop
    rst  $38
    nop
    ld   a, [$FF08]
    rst  $38
    jr   nz, label_1B82D

label_1B82D::
    db   $10 ; Undefined instruction
    nop
    nop
    jr   label_1B832
    jr   nz, label_1B845
    nop
    rst  $38

label_1B837::
    nop
    db   $10 ; Undefined instruction

label_1B83A::
    rst  $38
    jr   nz, label_1B80A
    add  a, $64

label_1B83F::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, label_1B73C
    add  hl, de
    ld   c, $10
    call label_3CE6
    ld   a, $10
    jp   label_3DA0

label_1B86E::
    ld   e, d
    nop
    ld   e, d
    jr   nz, label_1B8CD
    inc  d
    ld   e, d
    inc  [hl]
    ld   de, label_1B86E
    call label_3BC0
    call label_1A4C6

label_1B87F::
    call label_1A4F7
    call label_3B39
    call label_1A541
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   nz, label_1B89B
    ld   a, [hl]
    and  $0C
    jr   nz, label_1B8A5
    jr   label_1B8AD

label_1B89B::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    jr   label_1B8AD

label_1B8A5::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_1B8AD::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1B8B7::
    ld   e, b
    ld   [bc], a
    ld   e, b
    ldi  [hl], a
    ld   e, d
    ld   [bc], a
    ld   e, d
    ldi  [hl], a

label_1B8BF::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction

label_1B8C3::
    db   $10 ; Undefined instruction
    ld   a, [$FFF0]
    ld   de, label_1B8B7
    call label_3BC0

label_1B8CD::
    call label_1A4C6
    call label_1A4F7
    call label_3B39
    call label_1A541
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_1B8E8
    call label_1B979

label_1B8E8::
    ld   a, [hl]
    and  $0C
    jr   z, label_1B8F0
    call label_1B97E

label_1B8F0::
    ld   a, [$FFF0]
    and  a
    jr   nz, label_1B921
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_1B918
    xor  a
    ld   [hl], a
    call label_3D7F
    ld   hl, $C290
    add  hl, bc
    inc  [hl]
    call label_C05
    call label_280D
    and  $3F
    add  a, $10
    ld   [hl], a
    ld   a, $01
    jp   label_3B0C

label_1B918::
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ret

label_1B921::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $10
    srl  a
    srl  a
    srl  a
    srl  a
    call label_3B0C
    and  a
    ret  nz
    call label_C05
    ret  nz
    call label_280D
    and  $07
    add  a, $10
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    call label_1A57A
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1B8BF
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1B8C3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $01
    jr   z, label_1B970
    ld   a, $14
    call label_3BAA

label_1B970::
    ld   hl, $C290
    add  hl, bc
    xor  a
    ld   [hl], a
    jp   label_3B0C

label_1B979::
    ld   hl, $C240
    jr   label_1B982

label_1B97E::
    ld   hl, $C240
    add  hl, bc

label_1B982::
    ld   a, [hl]
    cpl
    inc  a
    sra  a
    ld   [hl], a
    ret

label_1B989::
    ld   h, d
    jr   nz, label_1B9EC
    jr   nz, label_1B9F4
    jr   nz, label_1B9F4
    jr   nz, label_1B9F2
    nop
    ld   h, d
    nop
    ld   h, h
    nop
    ld   h, [hl]
    nop
    ld   l, b
    nop
    ld   l, b
    jr   nz, label_1BA08
    nop
    ld   l, d
    jr   nz, label_1BA10
    jr   nz, label_1BA10
    jr   nz, label_1BA12
    nop
    ld   l, [hl]
    nop
    ld   de, label_1B989
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    call label_1A541
    call label_19E54
    ld   a, [$FFF0]
    rst  0
    jp   nz, label_3E79
    ld   a, d
    ld   a, [$C1A2]
    and  a
    jp   nz, label_1BA38
    call label_C05
    jr   nz, label_1BA11
    call label_C00
    jr   nz, label_1BA21
    ld   a, [$C137]
    cp   $03
    jr   z, label_1B9FA
    call label_280D
    xor  c
    and  $07
    add  a, $06
    call label_3BB5
    ld   a, [$FFD7]
    ld   hl, $C250
    call label_1BA79
    ld   a, [$FFD8]
    ld   hl, $C240

label_1B9F2::
    call label_1BA79
    call label_3B44
    jr   label_1BA27

label_1B9FA::
    call label_1A594
    add  a, $24
    cp   $48
    jr   nc, label_1BA27
    call label_1A5A4
    add  a, $24

label_1BA08::
    cp   $48
    jr   nc, label_1BA27
    call label_C05
    ld   [hl], $20

label_1BA11::
    call label_3D7F
    call label_1BAB0
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    call label_1BA8C

label_1BA21::
    call label_3D7F
    jp   label_1BAB0

label_1BA27::
    call label_1A594
    sla  e
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    add  a, e
    jp   label_3B0C

label_1BA38::
    call label_3B12
    ld   [hl], $01
    ret
    ld   a, [$C1A2]
    and  a
    jr   z, label_1BA74
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $01
    call label_3B39
    ld   a, $04
    call label_3BB5
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    add  a, $04
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ret

label_1BA74::
    call label_3B12
    ld   [hl], b
    ret

label_1BA79::
    add  hl, bc
    sub  a, [hl]
    jr   z, label_1BA8B
    bit  7, a
    jr   z, label_1BA87
    dec  [hl]
    dec  [hl]
    dec  [hl]
    dec  [hl]
    jr   label_1BA8B

label_1BA87::
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_1BA8B::
    ret

label_1BA8C::
    call label_C00
    ld   [hl], $20
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $48
    ld   e, a
    ld   a, $48
    sub  a, e
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $50
    ld   e, a
    ld   a, $50
    sub  a, e
    ld   [hl], a
    ret

label_1BAB0::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    jr   z, label_1BAC7
    call label_1A594
    srl  e
    jr   c, label_1BAC3
    ld   a, $06
    jr   label_1BAC9

label_1BAC3::
    ld   a, $07
    jr   label_1BAC9

label_1BAC7::
    ld   a, $FF

label_1BAC9::
    call label_3B0C
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    call label_C05
    cp   $01
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ret

label_1BADD::
    and  [hl]
    dec  d
    adc  a, [hl]
    ld   d, $80
    dec  d
    and  [hl]
    dec  d
    xor  c
    inc  d
    ld   a, [hli]
    ld   b, c
    ld   a, [hli]
    ld   h, c

label_1BAEB::
    nop
    db   $FC ; Undefined instruction
    ldi  [hl], a
    nop
    nop
    inc  c
    ldi  [hl], a
    jr   nz, label_1BAF4

label_1BAF4::
    db   $FC ; Undefined instruction
    ldi  [hl], a
    ld   b, b
    nop
    inc  c
    ldi  [hl], a
    ld   h, b

label_1BAFB::
    rrca
    rrca
    db   $10 ; Undefined instruction
    ld   de, label_1011
    rrca

label_1BB03::
    nop
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   bc, $FA00
    and  l
    db   $DB
    and  a
    jr   z, label_1BB1C
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_1BB1C
    ld   a, $06
    jp   label_A53

label_1BB1C::
    ld   a, [$DBA5]
    and  a
    jr   z, label_1BB32
    ld   a, [$FFF7]
    and  a
    jr   nz, label_1BB32
    ld   a, [$FFF6]
    cp   $1C
    jr   nz, label_1BB32
    ld   a, $01
    ld   [$DE00], a

label_1BB32::
    ld   hl, label_1BAFB
    ld   a, [$FFF9]
    and  a
    jr   z, label_1BB3D
    ld   hl, label_1BB03

label_1BB3D::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFF1]
    cp   $05
    jr   nz, label_1BB5B
    ld   de, label_1BAD3
    call label_3BC0
    jr   label_1BB61

label_1BB5B::
    ld   de, label_1BADD
    call label_3C77

label_1BB61::
    ld   a, [$FFE7]
    and  $08
    ld   e, a
    ld   d, b
    ld   hl, label_1BAEB
    add  hl, de
    ld   c, $02
    call label_3CE6
    ld   a, $01
    call label_3DA0
    call label_3D8A
    call label_1A4C6
    ld   a, [$FFF9]
    and  a
    jr   nz, label_1BB85
    ld   a, [$FFA2]
    cp   $0C
    ret  c

label_1BB85::
    call label_3B5A
    ret  nc
    call label_3F5E
    call label_1A5DB
    ld   a, $01
    ld   [$FFF3], a
    ld   a, [$FFF1]
    rst  0
    cp   c
    ld   a, e
    cp   a
    ld   a, e
    ret  nc
    ld   a, e
    cp   c
    ld   a, e
    and  d
    ld   a, e
    xor  a
    ld   a, e
    ld   a, [$DB93]
    add  a, $18
    jr   nc, label_1BBAB
    ld   a, $FF

label_1BBAB::
    ld   [$DB93], a
    ret
    ld   a, [$DB45]
    add  a, $10
    daa
    ld   [$DB45], a
    ret
    ld   a, $0A
    ld   [$DB90], a
    ret
    ld   d, $0C
    call label_3E6B
    ld   a, $0B
    ld   [$FFA5], a
    ld   hl, $DB76
    ld   de, $DB4C
    jr   label_1BBD6
    ld   hl, $DB77
    ld   de, $DB4D

label_1BBD6::
    ld   a, [de]
    cp   [hl]
    ret  nc
    add  a, $10
    daa
    cp   [hl]
    jr   c, label_1BBE0
    ld   a, [hl]

label_1BBE0::
    ld   [de], a
    ret

label_1BBE2::
    ld   a, [$FFF7]
    cp   $0A
    ret  nz

label_1BBE7::
    ld   a, [$FFF6]
    cp   $97
    jr   z, label_1BBF0
    cp   $98
    ret  nz

label_1BBF0::
    ld   a, [$DB7F]
    and  a
    ret  z
    ld   a, $FF
    ld   [$FFF1], a
    ret

label_1BBFA::
    ld   d, [hl]
    ld   [bc], a
    ld   d, [hl]
    ldi  [hl], a
    call label_1BBE2
    ld   de, label_1BBFA
    call label_3C77
    jr   label_1BC2E

label_1BC09::
    ld   d, d
    ld   [bc], a
    ld   d, d
    ldi  [hl], a
    ld   d, h
    ld   [bc], a
    ld   d, h

label_1BC10::
    ldi  [hl], a

label_1BC11::
    ld   d, d
    nop
    ld   d, d
    jr   nz, label_1BC6A
    nop
    ld   d, h
    jr   nz, label_1BBE7
    ld  [$FF00+C], a
    ld   a, e
    ld   de, label_1BC09
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    and  $02
    jr   nz, label_1BC2B
    ld   de, label_1BC11

label_1BC2B::
    call label_3BC0

label_1BC2E::
    ld   hl, $C1AE
    inc  [hl]
    call label_1A4C6
    call label_1A57A
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1BC50
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_1BC50::
    ld   a, [$FFEB]
    cp   $1B
    jr   nz, label_1BCB7
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   nz, label_1BCB7
    ld   [hl], b
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    push hl
    push af
    ld   hl, $C3A0

label_1BC6A::
    add  hl, bc
    ld   [hl], $1C
    call label_3965
    pop  af
    pop  hl
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $04
    ld   [hl], a
    call label_3D7F
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    ld   a, $1C
    call label_3B86
    jr   c, label_1BCB7
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C460
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD7]
    add  a, $08
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $20

label_1BCB7::
    call label_1A4F7
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1BCD4
    ld   a, [$FFF0]
    and  $01
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    dec  a
    jr   nz, label_1BCD4
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $08

label_1BCD4::
    ld   a, [$FFF0]
    cp   $04
    jr   z, label_1BCE5
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1BCE5
    call label_3B39

label_1BCE5::
    ld   a, [$FFF0]
    rst  0
    dec  h
    ld   a, l
    ld   a, [$FF00+C]
    ld   [hl], $7D
    ld   h, e
    ld   a, l
    ld   [hl], b
    ld   a, l
    call label_C05
    jr   nz, label_1BD0F
    ld   [hl], $10
    call label_3D7F
    call label_280D
    and  $0F
    jr   nz, label_1BD0B
    call label_C05
    ld   [hl], $50
    jp   label_3B12

label_1BD0B::
    call label_3B12
    ld   [hl], b

label_1BD0F::
    call label_1A541
    call label_C00
    ret  nz
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $02
    call label_3B23
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b
    ret
    call label_1BD0F
    call label_C05
    ret  nz
    ld   [hl], $07
    call label_3B12
    ld   a, $04
    jp   label_3BAA
    call label_C05
    jr   nz, label_1BD4A
    call label_3B12
    ld   a, $10
    call label_3BAA
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    ret

label_1BD4A::
    call label_C05
    ld   hl, $C240
    add  hl, bc
    and  $04
    jr   nz, label_1BD59
    ld   [hl], $08
    jr   label_1BD5B

label_1BD59::
    ld   [hl], $F8

label_1BD5B::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    jp   label_1BD0F
    call label_1BD0F
    ld   a, [$FFE8]
    and  a
    jr   z, label_1BD6F
    call label_3B12
    ld   [hl], b

label_1BD6F::
    ret
    call label_C05
    jr   nz, label_1BD91
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $30
    ld   a, $10
    call label_3BAA
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    ld   hl, $C310
    add  hl, bc
    inc  [hl]
    call label_3B12
    ld   [hl], $03
    ret

label_1BD91::
    push af
    rra
    and  $07
    sub  a, $04
    ld   e, a
    ld   a, [$FF98]
    sub  a, e
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    pop  af
    rra
    rra
    and  $07
    sub  a, $04
    ld   e, a
    ld   a, [$FF99]
    sub  a, e
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ld   a, $01
    ld   [$C117], a
    call label_3B23
    ld   a, [$FFCC]
    and  a
    jr   z, label_1BDD3
    call label_1BDCD
    call label_1BDCD
    call label_1BDCD

label_1BDCD::
    call label_C05
    jr   z, label_1BDD3
    dec  [hl]

label_1BDD3::
    ret

label_1BDD4::
    ld   a, h
    ld   bc, label_217C
    ld   a, [hl]
    ld   bc, label_217E
    ld   de, label_1BDD4
    call label_3BC0
    call label_1A4C6
    call label_1A4F7
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   a, [$FF00+C]
    inc  c
    ld   a, [hl]
    call label_BFB
    jr   nz, label_1BE06
    call label_3B44
    jr   nc, label_1BE06
    ld   hl, $C2D0
    add  hl, bc

label_1BE00::
    inc  [hl]
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b

label_1BE06::
    call label_3B70

label_1BE09::
    jp   label_1BE9D
    ld   a, [$FFCC]
    and  $30
    jr   z, label_1BE27
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   c, label_1BE27
    call label_BFB
    ld   [hl], $15
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b
    ret

label_1BE27::
    ld   a, $FF
    ld   [$FF9D], a
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1BE55
    ld   hl, $DB00
    ld   e, b

label_1BE37::
    ld   a, [hl]
    cp   $04
    jr   nz, label_1BE4E
    ld   a, [$DB44]
    cp   $02
    jr   nc, label_1BE55
    ld   [hl], b
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$DB44]
    ld   [hl], a
    jr   label_1BE55

label_1BE4E::
    inc  hl
    inc  e
    ld   a, e
    cp   $02
    jr   nz, label_1BE37

label_1BE55::
    ld   a, [$C11C]
    cp   $00
    ret  nz
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, [$FFEF]
    ld   [$FF99], a
    xor  a
    ld   [$C146], a
    ld   [$FFA2], a
    call label_1BF05
    jp   label_1BF05

label_1BE6F::
    ld   [hl], h
    ld   [bc], a
    db   $76 ; Halt
    ld   [bc], a
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], h
    ldi  [hl], a

label_1BE77::
    ld   b, h
    ld   [bc], a
    ld   b, [hl]
    ld   [bc], a
    ld   b, [hl]
    ldi  [hl], a
    ld   b, h
    ldi  [hl], a

label_1BE7F::
    nop
    ld   [$00F8], sp
    ld    hl, sp+$08
    ld   de, label_1BE6F
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_1BE91
    ld   de, label_1BE77

label_1BE91::
    call label_3BC0
    call label_1A4C6
    call label_C56
    call label_3B39

label_1BE9D::
    call label_1A541
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   nz, label_1BEBB
    ld   a, [hl]
    and  $0C
    jr   z, label_1BEC3
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    xor  $F0
    ld   [hl], a
    jr   label_1BEC3

label_1BEBB::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    xor  $F0
    ld   [hl], a

label_1BEC3::
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1BED2
    call label_280D
    and  $3F
    jr   nz, label_1BEFF

label_1BED2::
    xor  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1BE7F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    and  a
    jr   nz, label_1BEFF
    call label_280D
    and  $01
    add  a, $04
    ld   e, a
    ld   d, b
    ld   hl, label_1BE7F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_1BEFF::
    ld   hl, $C290
    add  hl, bc
    xor  a
    ld   [hl], a

label_1BF05::
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
