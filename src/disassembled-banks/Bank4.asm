section "bank4",romx,bank[$04]
    call label_394D
    call label_3EE8
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   d, $40
    rst  $20
    ld   b, d
    ccf
    ld   c, b
    reti
    ld   c, b
    ld   a, $49
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jr   c, label_1004E
    ld   a, $5C
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    sub  a, $18
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $27
    ld   hl, $C360
    add  hl, de
    ld   [hl], $08
    call label_3E34
    ld   a, $29
    ld   [$FFF4], a
    ret

label_1004E::
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $20
    ld   a, c
    ld   [$D002], a
    call label_102B3
    call label_13FA3
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $81
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $80
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE8], a
    and  $80
    jr   z, label_10085
    xor  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_10085::
    ld   a, [$FFF0]
    rst  0
    sub  a, b
    ld   b, b
    and  e
    ld   b, b
    ld   d, l
    ld   b, c
    inc  d
    ld   b, d
    ld   a, [$FF99]
    cp   $70
    jr   nc, label_1009E
    call label_3B12
    call label_C05
    ld   [hl], $FF

label_1009E::
    ret

label_1009F::
    nop
    ld   bc, label_200
    call label_C56
    call label_3B70
    call label_3B44
    jr   nc, label_100C7
    call label_CB6
    ld   a, $09
    ld   [$FFF2], a
    ld   a, $10
    ld   [$C13E], a
    ld   a, $14
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a

label_100C7::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_10118
    ld   a, [$FFE8]
    and  $80
    jr   z, label_100DF
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10
    ld   a, $20
    ld   [$FFF2], a

label_100DF::
    ld   a, [$FF98]
    push af
    ld   a, $50
    ld   [$FF98], a
    ld   a, [$FF99]
    push af
    ld   a, $48
    ld   [$FF99], a
    ld   a, $08
    call label_3BAA
    ld   a, [$FFEE]
    ld   hl, $FF98
    sub  a, [hl]
    add  a, $02
    cp   $04
    jr   nc, label_1010F
    ld   a, [$FFEF]
    ld   hl, $FF99
    sub  a, [hl]
    add  a, $02
    cp   $04
    jr   nc, label_1010F
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]

label_1010F::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    call label_12DCA

label_10118::
    call label_C05
    cp   $01
    jr   nz, label_10144
    ld   a, $5C
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210

label_10130::
    add  hl, de
    sub  a, $26
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $47
    ld   a, $06
    ld   [$FFF2], a

label_10144::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1009F
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    call label_C05
    jr   z, label_101AC
    dec  a
    jr   nz, label_10163
    call label_3B12
    ld   [hl], $03
    ret

label_10163::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_101A6
    call label_C05
    cp   $28
    jr   c, label_1018D
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    or   [hl]
    jr   z, label_1018D
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  $01
    jr   nz, label_1018D
    inc  [hl]
    ld   a, $7F
    call label_2373

label_1018D::
    call label_3D7F
    call label_C05
    cp   $28
    jr   nc, label_101A9
    ld   e, $08
    ld   a, [$FFE7]
    and  $04
    jr   z, label_101A1
    ld   e, $F8

label_101A1::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e

label_101A6::
    call label_12DCA

label_101A9::
    call label_3B23

label_101AC::
    call label_C56
    call label_3B70
    call label_13BE3
    ld   a, [$FFEE]
    ld   hl, $FF98
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_10210
    ld   a, [$FFEC]
    ld   hl, $FF99
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_10210
    call label_CB6
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_101DF
    ld   a, [$FFCB]
    and  $20
    jr   nz, label_101EC
    jr   label_10210

label_101DF::
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_10210
    ld   a, [$FFCB]
    and  $10
    jr   z, label_10210

label_101EC::
    ld   a, [$C3CF]
    and  a
    jr   nz, label_10210
    inc  a
    ld   [$C3CF], a
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $07
    ld   hl, $C490
    add  hl, bc
    ld   [hl], b
    ld   a, [$FF9E]
    ld   [$C15D], a
    ld   hl, $FFF3
    ld   [hl], $02
    call label_C05
    ld   [hl], $08

label_10210::
    xor  a
    jp   label_3B0C
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_10245
    ld   [hl], b
    call label_3B12
    ld   [hl], $02
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    ld   a, $08
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
    call label_C05
    ld   [hl], $C0
    ret

label_10245::
    call label_12D80
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $00
    call label_3B39
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $D0
    ld   a, [$FFE8]
    and  $80
    jr   z, label_10278
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10
    ld   a, $20
    ld   [$FFF2], a
    ld   a, $0C
    call label_3BAA

label_10278::
    call label_12DCA
    call label_3B23
    jp   label_10144

label_10281::
    ld   a, [$FF00]
    db   $76 ; Halt
    ld   b, $F0
    ld   [label_2676], sp
    nop
    nop
    ld   a, b
    ld   b, $00
    ld   [label_2678], sp
    ld   a, [$FF00]
    ld   a, d
    ld   b, $F0
    ld   [label_67C], sp
    nop
    nop
    ld   a, [hl]
    ld   b, $00
    ld   [label_267E], sp
    ld   a, [$FF00]
    ld   a, h
    ld   h, $F0
    ld   [label_267A], sp
    nop
    nop
    ld   a, [hl]
    ld   b, $00
    ld   [label_267E], sp

label_102B1::
    ld   h, $00

label_102B3::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_10281
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
    ld   a, [$FFEF]
    add  a, $0A
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    ld   de, label_102B1
    call label_3C77
    jp   label_3D8A
    call label_106F9
    ld   a, [$FFEA]
    cp   $05
    jr   z, label_1031A
    ld   hl, $C420
    add  hl, bc
    ld   a, [$FFE7]
    ld   [hl], a
    ld   a, [$FFF0]
    rst  0
    nop
    ld   b, e
    ld   [label_1143], sp
    ld   b, e
    call label_C05
    ld   [hl], $40
    jp   label_3B12
    call label_C05
    ret  nz
    ld   [hl], $A0
    jp   label_3B12
    call label_C05
    jp   z, label_11751
    jp   label_110EF

label_1031A::
    call label_13FA3
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   [$D000], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    ld   [$D001], a
    ld   a, [$FFF0]
    cp   $05
    jr   z, label_10336
    call label_3B44

label_10336::
    ld   a, [$FFF0]
    rst  0
    ld   b, l
    ld   b, e
    add  a, b
    ld   b, e
    sbc  a, a
    ld   b, h
    jp   hl
    ld   b, h
    rla
    ld   b, l
    ld   [hl], l
    ld   b, l
    call label_C05
    ret  nz
    call label_3B12
    call label_C00
    ld   [hl], $FF
    ld   a, [$D002]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    ld   a, $52
    jr   nz, label_1036D
    call label_3B12
    ld   [hl], $04
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $08
    ld   a, $53

label_1036D::
    jp   label_2385

label_10370::
    db   $10
    db   $14
    jr   label_10394
    jr   z, label_103A6
    jr   c, label_103B8
    rst  $38
    rst  $38

label_1037A::
    ld   h, b
    ld   b, b

label_1037C::
    ld   bc, label_8FF
    ld    hl, sp+$CD
    jp   z, label_216D
    add  a, b
    jp   label_11E09
    ld   d, b
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_103A6
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]

label_10394::
    ld   hl, label_1037E
    add  hl, de
    cp   [hl]
    jr   z, label_103A6
    ld   hl, label_1037C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    add  a, [hl]
    ld   [hl], a

label_103A6::
    ld   hl, label_1037A
    add  hl, de
    ld   a, [$FFEE]
    cp   [hl]
    jr   nz, label_103B7
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_103B7::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_103DD
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1037C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_1037E
    add  hl, de
    cp   [hl]
    jr   nz, label_103DD
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_103DD::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_C05
    jr   nz, label_10438
    push hl
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    cp   $08
    jr   c, label_103FF
    call label_3B12
    pop  hl
    ld   [hl], $30
    ret

label_103FF::
    ld   d, b
    ld   hl, label_10370
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a
    ld   a, $5C
    call label_3B86
    jr   c, label_10438
    ld   a, [$FFD7]
    sub  a, $0C
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    sub  a, $14
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $03
    ld   hl, $C320
    add  hl, de
    ld   [hl], $20
    ld   hl, $C240
    add  hl, de
    ld   [hl], $0C
    ld   hl, $C340
    add  hl, de
    ld   [hl], $42

label_10438::
    call label_C00
    jr   nz, label_10487
    ld   [hl], $30
    ld   a, $5C
    call label_3B86
    jr   c, label_10487
    push bc
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  $01
    ld   c, a
    ld   hl, label_1049D
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $24
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $04
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   c, e
    ld   b, d
    ld   a, $1F
    call label_3BAA
    pop  bc
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $10
    ld   a, $28
    ld   [$FFF4], a

label_10487::
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    and  $01
    ld   a, $02
    jr   z, label_1049A
    inc  a

label_1049A::
    jp   label_3B0C

label_1049D::
    db   $F4 ; Undefined instruction
    inc  c
    ld   a, [$D002]
    ld   e, a
    ld   d, b
    ld   a, [$FF98]
    push af
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    ld   [$FF98], a
    ld   a, [$FF99]
    push af
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    sub  a, $20
    ld   [$FF99], a
    ld   a, $10
    call label_3BAA
    call label_12DCA
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_104E2
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_104E2
    call label_C05
    ld   [hl], $10
    call label_3B12

label_104E2::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    ret
    call label_C05
    jp   z, label_12D7A
    cp   $04
    jr   nz, label_10516
    ld   a, $5C
    call label_3B86
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
    ld   [hl], $02
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $C7
    ld   a, $1F
    ld   [$FFF2], a

label_10516::
    ret
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $0C
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $81
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   nz, label_10535
    call label_3B12
    call label_C05
    ld   [hl], $80
    ret

label_10535::
    call label_12D80
    call label_3B70
    call label_12DCA
    call label_3B23
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_10568
    ld   a, $10
    call label_3BB5
    ld   hl, $C240
    add  hl, bc
    ld   a, [$FFD8]
    sub  a, [hl]
    and  $80
    jr   z, label_10559
    dec  [hl]
    dec  [hl]

label_10559::
    inc  [hl]
    ld   hl, $C250
    add  hl, bc
    ld   a, [$FFD7]
    sub  a, [hl]
    and  $80
    jr   z, label_10567
    dec  [hl]
    dec  [hl]

label_10567::
    inc  [hl]

label_10568::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    add  a, $02
    jp   label_3B0C
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $41
    call label_C05
    jr   nz, label_105F1
    call label_3B12
    ld   [hl], $04
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $01
    call label_280D
    and  $01
    jr   nz, label_105A6
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a

label_105A6::
    call label_3D7F
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b
    ld   a, $5C
    call label_3B86
    jr   c, label_105F0
    push bc
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  $01
    ld   c, a
    ld   hl, label_1049D
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $24
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $04
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   c, e
    ld   b, d
    ld   a, $1F
    call label_3BAA
    pop  bc
    ld   a, $28
    ld   [$FFF4], a

label_105F0::
    ret

label_105F1::
    ld   a, [$FF98]
    push af
    ld   a, $50
    ld   [$FF98], a
    ld   a, [$FF99]
    push af
    ld   a, $48
    ld   [$FF99], a
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD8]
    cpl
    inc  a
    push af
    ld   a, [$FFD7]
    push af
    ld   a, $04
    call label_3BB5
    ld   hl, $FFD8
    pop  af
    add  a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $FFD7
    pop  af
    add  a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    call label_12DCA
    call label_10634
    jp   label_10568

label_10634::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $48
    ld   e, a
    ld   a, $48
    sub  a, e
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $50
    ld   e, a
    ld   a, $50
    sub  a, e
    ld   hl, $C440
    add  hl, bc
    ld   [hl], a
    ret

label_10655::
    ld   a, [$FFF4]
    ld   h, b
    ld   [bc], a
    ld   a, [$FFFC]
    ld   h, d
    ld   [bc], a
    ld   a, [$FF04]
    ld   h, h
    ld   [bc], a
    ld   a, [$FF0C]
    ld   h, d
    ldi  [hl], a
    ld   a, [$FF14]
    ld   h, b
    ldi  [hl], a
    nop
    db   $F4 ; Undefined instruction
    ld   h, [hl]
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   l, b
    ld   [bc], a
    nop
    inc  b
    ld   l, d
    ld   [bc], a
    nop
    inc  c
    ld   l, b
    ldi  [hl], a
    nop
    inc  d
    ld   h, [hl]
    ldi  [hl], a
    ld   a, [$FFF4]
    ld   h, b
    ld   [bc], a
    ld   a, [$FFFC]
    ld   h, d
    ld   [bc], a
    ld   a, [$FF04]
    ld   h, h
    ldi  [hl], a
    ld   a, [$FF0C]
    ld   h, d
    ldi  [hl], a
    ld   a, [$FF14]
    ld   h, b
    ldi  [hl], a
    nop
    db   $F4 ; Undefined instruction
    ld   h, [hl]
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   l, b
    ld   [bc], a
    nop
    inc  b
    ld   l, d
    ldi  [hl], a
    nop
    inc  c
    ld   l, b
    ldi  [hl], a
    nop
    inc  d
    ld   h, [hl]
    ldi  [hl], a
    ld   a, [$FFF4]
    ld   h, b
    ld   [bc], a
    ld   a, [$FFFC]
    ld   h, d
    ld   [bc], a
    ld   a, [$FF04]
    ld   h, h
    ld   [bc], a
    ld   a, [$FF0C]
    ld   l, h
    ld   [bc], a
    ld   a, [$FF14]
    ld   l, [hl]
    ld   [bc], a
    nop
    db   $F4 ; Undefined instruction
    ld   h, [hl]
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   l, b
    ld   [bc], a
    nop
    inc  b
    ld   l, d
    ld   [bc], a
    nop
    inc  c
    ld   [hl], b
    ld   [bc], a
    nop
    inc  d
    ld   [hl], d
    ld   [bc], a
    ld   a, [$FFF4]
    ld   l, [hl]
    ldi  [hl], a
    ld   a, [$FFFC]
    ld   l, h
    ldi  [hl], a
    ld   a, [$FF04]
    ld   h, h
    ldi  [hl], a
    ld   a, [$FF0C]
    ld   h, d
    ldi  [hl], a
    ld   a, [$FF14]
    ld   h, b
    ldi  [hl], a
    nop
    db   $F4 ; Undefined instruction
    ld   [hl], d
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   [hl], b
    ldi  [hl], a
    nop
    inc  b
    ld   l, d
    ldi  [hl], a
    nop
    inc  c
    ld   l, b
    ldi  [hl], a
    nop
    inc  d
    ld   h, [hl]
    ldi  [hl], a

label_106F5::
    ld   [hl], h
    ld   [bc], a
    ld   [hl], h
    ldi  [hl], a

label_106F9::
    ld   a, [$FFF0]
    cp   $05
    jr   nz, label_10713
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_10713
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEC], a
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEE], a

label_10713::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    sla  e
    sla  e
    sla  e
    ld   a, e
    sla  e
    sla  e
    add  a, e
    ld   e, a
    ld   hl, label_10655
    add  hl, de
    ld   c, $0A
    call label_3CE6
    ld   a, $0A
    call label_3DA0
    ld   a, [$FFEC]
    add  a, $10
    ld   [$FFEC], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$FFF1], a
    ld   de, label_106F5
    call label_3C77
    jp   label_3D8A

label_1074D::
    stop
    ld   e, $01
    db   $10
    db   $08
    ld   e, $61
    stop
    ld   e, $01
    db   $10
    db   $08
    ld   e, $61
    stop
    ld   e, $01
    db   $10
    db   $08
    ld   e, $61
    stop
    ld   e, $01
    db   $10
    db   $08
    ld   e, $61
    ld   [label_3000], sp
    ld   bc, label_808
    jr   nc, label_107D6
    ld   [label_3000], sp
    ld   bc, label_808
    jr   nc, label_107DE
    ld   [label_3000], sp
    ld   bc, label_808
    jr   nc, label_107E6
    ld   [label_3000], sp
    ld   bc, label_808
    jr   nc, label_107EE
    inc  b
    nop
    jr   nc, label_10792
    inc  b

label_10792::
    ld   [label_12130], sp
    inc  d
    nop
    ld   e, $01
    inc  d
    ld   [label_1211E], sp
    inc  d
    nop
    ld   e, $01
    inc  d
    ld   [label_1211E], sp
    inc  d
    nop
    ld   e, $01
    inc  d
    ld   [label_1211E], sp
    nop
    nop
    jr   nc, label_107B2
    nop

label_107B2::
    ld   [label_12130], sp
    stop
    ld   e, $01
    db   $10
    db   $08
    ld   e, $61
    stop
    ld   e, $01
    db   $10
    db   $08
    ld   e, $61
    stop
    ld   e, $01
    db   $10
    db   $08
    ld   e, $61
    ld   a, [$FF00+C]
    jr   nc, label_107D2
    ld   a, [$FF00+C]
    jr   nc, label_10836
    ld   a, [$FF00+C]
    jr   nc, label_107DA
    ld   a, [$FF00+C]
    jr   nc, label_1083E
    cp   $FA
    jr   nc, label_107E2
    cp   $02
    jr   nc, label_10846
    cp   $06
    jr   nc, label_107EA
    cp   $0E
    jr   nc, label_1084E
    ld   a, [$FFF8]
    jr   nc, label_10832
    ld   a, [$FF00]
    jr   nc, label_10816
    ld   a, [$FF08]
    jr   nc, label_1083A
    ld   a, [$FF10]
    jr   nc, label_1081E
    nop
    ld    hl, sp+$30
    ld   b, c
    nop
    nop
    jr   nc, label_10826
    nop
    ld   [label_10130], sp
    nop
    db   $10
    db   $30
    ld   hl, $F8F0
    ldd  [hl], a
    ld   bc, $00F0
    ldd  [hl], a
    ld   h, c
    ld   a, [$FF08]
    ldd  [hl], a
    ld   bc, label_10F0
    ldd  [hl], a
    ld   h, c
    nop

label_1081E::
    ld    hl, sp+$32
    ld   bc, $0000
    ldd  [hl], a
    ld   h, c
    nop

label_10826::
    ld   [$0132], sp
    nop
    db   $10
    db   $32
    ld   h, c

label_1082D::
    ld   b, $05
    inc  b
    dec  b
    inc  b

label_10832::
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    ld   bc, label_302

label_1083A::
    inc  b
    dec  b
    inc  b
    dec  b

label_1083E::
    ld   b, $CD
    cp   b
    ld   c, b
    call label_13FA3
    call label_C05
    bit  7, a
    jr   z, label_1086D
    and  $7F

label_1084E::
    jr   nz, label_1085E
    ld   a, [$D002]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $03
    jp   label_12D7A

label_1085E::
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_10836
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_1086D::
    and  a
    jp   z, label_12D7A
    cp   $06
    jr   nz, label_108A6
    ld   a, $5C
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    cp   $14
    jr   nc, label_10889
    ld   a, $14

label_10889::
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $40
    ld   hl, $C340
    add  hl, de
    ld   [hl], $01
    ld   hl, $C350
    add  hl, de
    ld   [hl], $8C

label_108A6::
    call label_C05
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_1082D
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_1074D
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $08
    jp   label_3DA0

label_108D1::
    inc  [hl]
    ld   [bc], a
    inc  [hl]
    ldi  [hl], a
    inc  [hl]
    ld   [de], a
    inc  [hl]
    ldd  [hl], a
    ld   de, label_108D1
    call label_3BC0
    call label_13FA3
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push af
    ld   a, [$D000]
    add  a, [hl]
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    push af
    ld   a, [$D001]
    add  a, [hl]
    ld   [hl], a
    call label_12DCA
    pop  af
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    pop  af
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFF0]
    and  a
    jr   nz, label_10938
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_10937
    ld   [hl], b
    call label_3B12
    call label_C05
    ld   [hl], $08
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $E0

label_10937::
    ret

label_10938::
    call label_C05
    jp   z, label_12D7A
    ld   de, label_108D1
    call label_3BC0
    call label_13FA3
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_3B44
    call label_12DCA
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jp   nz, label_12D7A
    ret

label_1096B::
    xor  $12

label_1096D::
    ld    hl, sp+$08

label_1096F::
    xor  a
    ld   [$FFE8], a

label_10972::
    ld   a, $5B
    call label_3B86
    ld   hl, $C390
    add  hl, de
    ld   [hl], $01
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_1096B
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_1096D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C360
    add  hl, de
    ld   [hl], $05
    pop  bc
    ld   a, [$FFE8]
    inc  a
    ld   [$FFE8], a
    cp   $02
    jr   nz, label_10972
    jp   label_12D7A
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $7E
    call label_C05
    ld   [hl], $A0
    ret
    call label_394D
    call label_3EE8
    call label_10E52
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    rst  0
    call c, label_FB49
    ld   c, l
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $50
    ld   a, [$FFF0]
    rst  0
    db   $ED ; Undefined instruction
    ld   c, c
    dec  l
    ld   c, d
    ld   l, d
    ld   c, d
    ld   a, [hl]
    ld   c, d
    ld   a, [$C157]
    cp   $05
    jr   nz, label_109FB
    call label_3B12
    ld   a, $08
    ld   [$FFF2], a

label_109FB::
    call label_C05
    jr   nz, label_10A2C
    ld   [hl], $50
    ld   a, [$C1AE]
    cp   $02
    jr   nc, label_10A2C
    ld   a, $1B
    call label_3B86
    call label_280D
    and  $3F
    add  a, $40
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    call label_280D
    and  $3F
    add  a, $30
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C310
    add  hl, de
    ld   [hl], $70

label_10A2C::
    ret
    call label_10DB5
    call label_13FA3
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    cp   $A0
    jr   z, label_10A41
    dec  [hl]
    dec  [hl]

label_10A41::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   [hl], b
    ld   a, $50
    ld   [$C157], a
    ld   a, $04
    ld   [$C158], a
    call label_C05
    ld   [hl], $40
    call label_C4B
    ld   a, [$C146]
    and  a
    jr   nz, label_10A67
    call label_BFB
    ld   [hl], $14

label_10A67::
    jp   label_3B12
    call label_10DB5
    call label_13FA3
    call label_C05
    jr   nz, label_10A78
    call label_3B12

label_10A78::
    call label_10B2E
    jp   label_3B44
    call label_10DB5
    call label_13FA3
    call label_C56
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_10AA5
    cp   $01
    jp   z, label_1096F
    ld   [$FFA1], a
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_10AA0
    ld   hl, $FF99
    dec  [hl]

label_10AA0::
    ld   a, $06
    jp   label_3B0C

label_10AA5::
    call label_10B52
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_10ACB
    inc  a
    call label_3B0C
    call label_C00
    jr   nz, label_10ACB
    ld   [hl], $28
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]

label_10ACB::
    xor  a
    ld   [$FFE8], a
    ld   a, $14
    call label_10B37
    call label_3B70
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C300
    add  hl, bc
    or   [hl]
    jr   nz, label_10AEF
    call label_10B2E
    call label_3B44
    ld   a, $01
    ld   [$FFE8], a
    call label_3B70

label_10AEF::
    ld   a, $14
    call label_10B37
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_10B11
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_10B11
    call label_C00
    ld   [hl], $50
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   z, label_10B11
    inc  [hl]

label_10B11::
    ret

label_10B12::
    ld   [$0014], sp
    inc  c
    ld   [$0015], sp
    dec  bc
    ld   [$0016], sp
    ld   [label_1708], sp
    nop
    ld   b, $08
    jr   label_10B25

label_10B25::
    inc  b
    ld   [label_803], sp
    inc  bc
    ld   [label_20C], sp
    inc  c

label_10B2E::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    sla  a
    sla  a

label_10B37::
    ld   e, a
    ld   d, b
    ld   hl, label_10B12
    add  hl, de
    ld   e, l
    ld   d, h
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    ld   c, $04

label_10B4A::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_10B4A
    pop  bc
    ret

label_10B52::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   a, h
    ld   c, e
    rst  0
    ld   c, e

label_10B5C::
    db   $10
    db   $0C
    ld   b, $02
    ld   a, [$FFF4]
    ld   a, [label_10FE]
    inc  c
    ld   b, $02
    ld   a, [$FFF4]
    ld   a, [label_2FE]
    ld   b, $0C
    db   $10
    db   $02
    ld   b, $0C
    db   $10
    db   $FE
    ld   a, [$F0F4]
    cp   $FA
    db   $F4 ; Undefined instruction
    ld   a, [$FFCD]
    dec  b
    inc  c
    and  a
    jr   nz, label_10BC6
    call label_280D
    and  $1F
    add  a, $10
    ld   [hl], a
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]
    ld   e, $00
    ld   a, [$FFEE]
    cp   $50
    jr   c, label_10B98
    inc  e

label_10B98::
    ld   d, $00
    ld   a, [$FFEC]
    cp   $48
    jr   c, label_10BA2
    inc  d
    inc  d

label_10BA2::
    ld   a, d
    or   e
    sla  a
    sla  a
    push af
    call label_280D
    and  $03
    pop  de
    or   d
    ld   e, a
    ld   d, b
    ld   hl, label_10B5C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_10B6C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_10BC6::
    ret
    call label_C05
    jr   z, label_10BD5
    and  $0E
    ret  nz
    call label_12DCA
    jp   label_3B23

label_10BD5::
    ld   [hl], $30
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b
    ret

label_10BDD::
    ld   a, [$FFF0]
    ld   h, b
    inc  bc
    ld   a, [$FFF8]
    ld   h, d
    inc  bc
    ld   a, [$FF00]
    ld   [hl], b
    inc  bc
    ld   a, [$FF08]
    ld   [hl], b
    inc  hl
    ld   a, [$FF10]
    ld   h, d
    inc  hl
    ld   a, [$FF18]
    ld   h, b
    inc  hl
    nop
    ld   a, [$FF64]
    inc  bc
    nop
    ld    hl, sp+$6E
    inc  bc
    nop
    nop
    ld   [hl], d
    inc  bc
    nop
    ld   [label_2372], sp
    nop
    db   $10
    db   $6E
    inc  hl
    nop
    jr   label_10C70
    inc  hl
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
    nop
    nop
    rst  $38
    nop
    ld   a, [$FFF0]
    ld   l, b
    inc  bc
    ld   a, [$FFF8]
    ld   l, d
    inc  bc
    ld   a, [$FF00]
    ld   a, [hl]
    inc  bc
    ld   a, [$FF08]
    ld   a, [hl]
    inc  hl
    ld   a, [$FF10]
    ld   l, d
    inc  hl
    ld   a, [$FF18]
    ld   l, b
    inc  hl
    nop
    ld   a, [$FF6C]
    inc  bc
    nop
    ld    hl, sp+$6E
    inc  bc
    nop
    nop
    ld   [hl], d
    inc  bc
    nop
    ld   [label_2372], sp
    nop
    db   $10
    db   $6E
    inc  hl
    nop
    jr   label_10CB8
    inc  hl
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
    nop
    nop
    rst  $38
    nop
    ld   a, [$FFF0]
    ld   h, b
    inc  bc
    ld   a, [$FFF8]
    ld   h, d
    inc  bc
    ld   a, [$FF00]
    ld   h, d
    inc  hl
    ld   a, [$FF08]
    ld   h, d
    inc  bc
    ld   a, [$FF10]
    ld   h, d

label_10C70::
    inc  hl
    ld   a, [$FF18]
    ld   h, b
    inc  hl
    nop
    ld   a, [$FF64]
    inc  bc
    nop
    ld    hl, sp+$66
    inc  bc
    nop
    nop
    ld   h, [hl]
    inc  hl
    nop
    ld   [label_366], sp
    nop
    db   $10
    db   $66
    inc  hl
    nop
    jr   label_10CF0
    inc  hl
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
    nop
    nop
    rst  $38
    nop
    ld   a, [$FFEC]
    ld   h, b
    inc  bc
    ld   a, [$FFF4]
    ld   h, d
    inc  bc
    ld   a, [$FFFC]
    ld   h, d
    inc  hl
    ld   a, [$FF04]
    ld   [hl], h
    inc  bc
    ld   a, [$FF0C]
    ld   h, d
    inc  bc
    ld   a, [$FF14]
    ld   h, d
    inc  hl
    ld   a, [$FF1C]
    ld   h, b

label_10CB8::
    inc  hl
    nop
    db   $EC ; Undefined instruction
    ld   h, h
    inc  bc
    nop
    db   $F4 ; Undefined instruction
    ld   h, [hl]
    inc  bc
    nop
    db   $FC ; Undefined instruction
    ld   h, [hl]
    inc  hl
    nop
    inc  b
    db   $76 ; Halt
    inc  bc
    nop
    inc  c
    ld   h, [hl]
    inc  bc
    nop
    inc  d
    ld   h, [hl]
    inc  hl
    nop
    inc  e
    ld   h, h
    inc  hl
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    ld   a, [$FFE8]
    ld   h, b
    inc  bc
    ld   a, [$FFF0]
    ld   h, d
    inc  bc
    ld   a, [$FFF8]
    ld   h, d
    inc  hl
    ld   a, [$FF00]
    ld   a, b
    inc  bc
    ld   a, [$FF08]
    ld   a, b

label_10CF0::
    inc  hl
    ld   a, [$FF10]
    ld   h, d
    inc  bc
    ld   a, [$FF18]
    ld   h, d
    inc  hl
    ld   a, [$FF20]
    ld   h, b
    inc  hl
    nop
    db   $E8 ; add  sp, d
    ld   h, h
    inc  bc
    nop
    ld   a, [$FF66]
    inc  bc
    nop
    ld    hl, sp+$66
    inc  hl
    nop
    nop
    ld   a, d
    inc  bc
    nop
    ld   [label_237A], sp
    nop
    db   $10
    db   $66
    inc  bc
    nop
    jr   label_10D7E
    inc  hl
    nop
    jr   nz, label_10D80
    inc  hl
    ld   a, [$FFE8]
    ld   h, b
    inc  bc
    ld   a, [$FFF0]
    ld   h, d
    inc  bc
    ld   a, [$FFF8]
    ld   h, d
    inc  hl
    ld   a, [$FF00]
    ld   a, b
    inc  bc
    ld   a, [$FF08]
    ld   a, b
    inc  hl
    ld   a, [$FF10]
    ld   h, d
    inc  bc
    ld   a, [$FF18]
    ld   h, d
    inc  hl
    ld   a, [$FF20]
    ld   h, b
    inc  hl
    nop
    db   $E8 ; add  sp, d
    ld   h, h
    inc  bc
    nop
    ld   a, [$FF66]
    inc  bc
    nop
    ld    hl, sp+$66
    inc  hl
    nop
    nop
    ld   a, h
    inc  bc
    nop
    ld   [label_237C], sp
    nop
    db   $10
    db   $66
    inc  bc
    nop
    jr   label_10DBE
    inc  hl
    nop
    jr   nz, label_10DC0
    inc  hl
    ld   a, [$FFE6]
    ld   h, b
    inc  bc
    ld   a, [$FFEE]
    ld   h, d
    inc  bc
    ld   a, [$FFF6]
    ld   h, d
    inc  hl
    ld   a, [$FFFE]
    ld   a, b
    inc  bc
    ld   a, [$FF0A]
    ld   a, b
    inc  hl
    ld   a, [$FF12]
    ld   h, d
    inc  bc
    ld   a, [$FF1A]
    ld   h, d
    inc  hl
    ld   a, [$FF22]
    ld   h, b
    inc  hl
    nop

label_10D7E::
    and  $64

label_10D80::
    inc  bc
    nop
    xor  $66
    inc  bc
    nop
    or   $66
    inc  hl
    nop
    cp   $7C
    inc  bc
    nop
    ld   a, [bc]
    ld   a, h
    inc  hl
    nop
    ld   [de], a
    ld   h, [hl]
    inc  bc
    nop
    ld   a, [de]
    ld   h, [hl]
    inc  hl
    nop
    ldi  [hl], a
    ld   h, h
    inc  hl

label_10D9D::
    inc  c
    push af
    ld   h, $00
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
    inc  c
    inc  de
    ld   h, $00

label_10DB5::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   d, b
    rla
    rl   d

label_10DBE::
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    and  $C0
    ld   e, a
    ld   hl, label_10BDD
    add  hl, de
    ld   c, $10
    call label_3CE6
    ld   a, $10
    call label_3DA0
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$FFEF]
    sub  a, $08
    ld   [$FFEC], a
    ld   hl, label_10D9D
    ld   c, $06
    call label_3CE6
    ld   a, $06
    call label_3DA0
    jp   label_3D8A
    call label_10FFE
    ld   a, [$FFEA]
    cp   $05
    jp   z, label_10E60
    ld   hl, $C420
    add  hl, bc
    ld   a, [$FFE7]
    ld   [hl], a
    ld   a, [$FFF0]
    rst  0
    dec  d
    ld   c, [hl]
    dec  e
    ld   c, [hl]
    ld   h, $4E
    call label_C05
    ld   [hl], $40
    jp   label_3B12
    call label_C05
    ret  nz
    ld   [hl], $A0
    jp   label_3B12
    call label_C05
    jr   nz, label_10E4F
    ld   e, $0F
    ld   d, b

label_10E2E::
    ld   a, c
    cp   e
    jr   z, label_10E43
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_10E43
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $5B
    jr   z, label_10E4C

label_10E43::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_10E2E
    jp   label_11751

label_10E4C::
    jp   label_12D7A

label_10E4F::
    jp   label_110EF

label_10E52::
    call label_BFB
    jr   z, label_10E5F
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $6A
    ld   [$FF9D], a

label_10E5F::
    ret

label_10E60::
    call label_13FA3
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   nz, label_10E83
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_10E82
    call label_3B12
    ld   [hl], $02
    ld   a, $24
    ld   [$FFF2], a
    call label_3D7F
    jr   label_10E83

label_10E82::
    inc  [hl]

label_10E83::
    call label_12D80
    xor  a
    ld   [$FFE8], a
    ld   a, [$FFF0]
    rst  0
    and  h
    ld   c, [hl]
    db   $EB ; Undefined instruction
    ld   c, [hl]
    ld   h, l
    ld   c, a
    ld   a, [hl]
    ld   c, a

label_10E94::
    db   $10
    db   $0C
    nop
    db   $F4 ; Undefined instruction
    ld   a, [$FFF4]
    nop
    inc  c

label_10E9C::
    nop
    inc  c
    db   $10
    db   $0C
    nop
    db   $F4 ; Undefined instruction
    ld   a, [$FFF4]
    ld   a, $18
    call label_10B37
    call label_3B39
    call label_C05
    jr   nz, label_10EE7
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_10E94
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_10E9C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $03
    jr   nz, label_10ED8
    ld   a, $18
    call label_3BAA

label_10ED8::
    call label_280D
    and  $0F
    ld   hl, $C320
    add  hl, bc
    add  a, $08
    ld   [hl], a
    call label_3B12

label_10EE7::
    ld   a, b
    jp   label_3B0C
    call label_C05
    and  a
    jr   nz, label_10F60
    call label_12DCA
    call label_3B23
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   a, $18
    call label_10B37
    call label_3B44
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_10F14
    call label_3B70
    xor  a

label_10F14::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_10F60
    ld   [hl], b
    ld   hl, $C440
    add  hl, bc
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sub  a, $E0
    and  $80
    jr   z, label_10F49
    ld   a, $18
    ld   [$C157], a
    ld   a, $0B
    ld   [$FFF2], a
    ld   a, [$C146]
    and  a
    jr   nz, label_10F49
    call label_BFB
    ld   [hl], $0E
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    jr   label_10F57

label_10F49::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    ld   [hl], b
    cp   $F2
    jr   nc, label_10F57
    ld   a, $20
    ld   [$FFF2], a

label_10F57::
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $20

label_10F60::
    ld   a, $01
    jp   label_3B0C
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $60
    call label_12E03
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $70
    ret  c
    call label_C05
    ld   [hl], $30
    jp   label_3B12
    ld   a, $FF
    call label_3B0C
    call label_C05
    jr   nz, label_10FAD
    ld   [hl], $18
    ld   hl, $C440
    add  hl, bc
    ld   [hl], $01
    call label_3B12
    ld   [hl], $01
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $C0
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   a, $08
    ld   [$FFF2], a

label_10FAD::
    ret

label_10FAE::
    ld   a, [$FFF8]
    ld   h, b
    inc  bc
    ld   a, [$FF00]
    ld   h, d
    inc  bc
    ld   a, [$FF08]
    ld   h, d
    inc  hl
    ld   a, [$FF10]
    ld   h, b
    inc  hl
    nop
    ld    hl, sp+$64
    inc  bc
    nop
    nop
    ld   h, [hl]
    inc  bc
    nop
    ld   [label_2366], sp
    nop
    db   $10
    db   $64
    inc  hl
    ld   a, [$FFF8]
    ld   l, b
    inc  bc
    ld   a, [$FF00]
    ld   l, d
    inc  bc
    ld   a, [$FF08]
    ld   l, d
    inc  hl
    ld   a, [$FF10]
    ld   l, b
    inc  hl
    nop
    ld    hl, sp+$6C
    inc  bc
    nop
    nop
    ld   h, [hl]
    inc  bc
    nop
    ld   [label_2366], sp
    nop
    db   $10
    db   $6C
    inc  hl

label_10FEE::
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

label_10FFE::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   d, b
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    rla
    rl   d
    and  $E0
    ld   e, a
    ld   hl, label_10FAE
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $08
    call label_3DA0
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_11048
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_11048
    ld   a, [$FFEF]
    sub  a, $02
    ld   [$FFEC], a
    ld   hl, label_10FEE
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0

label_11048::
    jp   label_3D8A
    call label_C05
    ld   [hl], $FF
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $12
    ld   hl, $C200
    add  hl, bc
    call label_11067
    ld   hl, $C210
    add  hl, bc

label_11067::
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    ld   a, $FF
    jp   label_3B0C
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   a, [hl]
    ld   d, b
    ld   h, [hl]
    ld   d, h
    add  hl, bc
    ld   d, l
    sbc  a, l
    ld   d, l
    xor  a
    ld   [$C155], a
    call label_3EE8
    call label_394D
    call label_1142F
    ld   a, [$FFEA]
    cp   $05
    jp   z, label_1110F
    ld   hl, $C420
    add  hl, bc
    ld   a, [$FFE7]
    ld   [hl], a
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    rst  0
    and  l
    ld   d, b
    pop  hl
    ld   d, b
    jp   hl
    ld   d, b
    call label_C05
    ld   [hl], $80
    ld   e, $0F
    ld   d, b

label_110AD::
    ld   a, c
    cp   e
    jr   z, label_110D5
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   nz, label_110D5
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   c, label_110D5
    ld   [hl], $01
    ld   hl, $C480
    add  hl, de
    ld   [hl], $1F
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $F0
    or   $02
    ld   [hl], a

label_110D5::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_110AD

label_110DB::
    ld   hl, $C440
    add  hl, bc
    inc  [hl]
    ret
    call label_C05
    ret  nz
    ld   [hl], $FF
    jr   label_110DB
    call label_C05
    jp   z, label_11751

label_110EF::
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
    sub  a, $10
    ld   e, a
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    jp   label_11A05

label_1110F::
    call label_13FA3
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_11120
    ld   hl, $C390
    add  hl, bc
    ld   [hl], $FF

label_11120::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $08
    ld   a, [$FFF0]
    rst  0
    cpl
    ld   d, c
    ld   e, b
    ld   d, c
    db   $E8 ; add  sp, d
    ld   d, c
    call label_C05

label_11132::
    ret  nz
    ld   [hl], $FF
    jp   label_3B12

label_11138::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   bc, $0100
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call label_C05
    jr   z, label_1116C
    rra
    rra
    rra
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_11138
    add  hl, de

label_11168::
    ld   a, [hl]
    jp   label_3B0C

label_1116C::
    call label_3B12
    call label_C00
    ld   [hl], $A0
    call label_BFB
    ld   [hl], $FF
    ld   a, $B6
    jp   label_2385

label_1117E::
    inc  bc
    ld   [bc], a
    inc  b
    ld   [bc], a

label_11182::
    jr   z, label_111BC
    ld   c, b
    ld   e, b
    ld   l, b
    ld   a, b
    jr   z, label_11202
    jr   z, label_11204
    jr   z, label_111C6
    ld   c, b
    ld   e, b
    ld   l, b
    ld   a, b

label_11192::
    jr   nc, label_111C4
    jr   nc, label_111C6
    jr   nc, label_111C8
    ld   b, b
    ld   b, b
    ld   d, b
    ld   d, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b

label_111A2::
    jr   z, label_111DC
    ld   c, b
    ld   e, b
    ld   l, b
    ld   a, b
    jr   label_11132
    jr   label_11134
    jr   label_11136
    jr   label_11138
    jr   z, label_111EA
    ld   c, b
    ld   e, b
    ld   l, b
    ld   a, b

label_111B6::
    jr   nz, label_111D8
    jr   nz, label_111DA
    jr   nz, label_111DC

label_111BC::
    jr   nc, label_111EE
    ld   b, b
    ld   b, b
    ld   d, b
    ld   d, b
    ld   h, b
    ld   h, b

label_111C4::
    ld   [hl], b
    ld   [hl], b

label_111C6::
    ld   [hl], b
    ld   [hl], b

label_111C8::
    ld   [hl], b
    ld   [hl], b

label_111CA::
    nop
    inc  de
    ld   bc, label_212
    ld   de, label_1003
    inc  b
    rrca
    dec  b
    ld   c, $06
    dec  c

label_111D8::
    rlca
    inc  c

label_111DA::
    ld   [label_90B], sp
    ld   a, [bc]

label_111DE::
    jr   label_11168
    jr   label_1116A

label_111E2::
    jr   nz, label_11254
    ld   [hl], b
    jr   nz, label_111E7

label_111E7::
    rst  $38
    ld   a, [$FFE7]

label_111EA::
    and  $3F
    jr   nz, label_111FA

label_111EE::
    call label_280D
    and  $01
    jr   nz, label_111FA
    call label_C05
    ld   [hl], $1F

label_111FA::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   e, a

label_11202::
    ld   d, b
    ld   hl, label_111E6
    add  hl, de
    ld   a, [hl]
    ld   [$C155], a
    call label_BFB
    jr   nz, label_11273
    call label_280D
    and  $0F
    add  a, $18
    ld   [hl], a
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $14
    jr   c, label_11273
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   c, label_11273
    ld   a, $5A
    call label_3B86
    jr   c, label_11273
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01

label_11237::
    call label_280D
    and  $0F
    ld   hl, $C2C0
    add  hl, bc
    cp   [hl]
    jr   z, label_11237
    ld   [hl], a
    push bc
    ld   c, a
    ld   hl, label_11182
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_11192
    add  hl, bc

label_11254::
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $7F
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C350
    add  hl, de
    ld   [hl], $00
    ld   hl, $C430
    add  hl, de
    ld   [hl], $00
    pop  bc

label_11273::
    call label_C00
    jr   nz, label_112C9
    ld   [hl], $40
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $14
    jr   nc, label_112C9
    ld   a, $5A
    call label_3B86
    jr   c, label_112C9
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    push bc
    ld   hl, $C3D0
    add  hl, bc
    ld   c, [hl]
    inc  [hl]
    ld   hl, label_111CA
    add  hl, bc
    ld   c, [hl]
    ld   hl, label_111A2
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_111B6
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C350
    add  hl, de
    ld   [hl], $00
    ld   hl, $C430
    add  hl, de
    ld   [hl], $00
    ld   hl, $C4D0
    add  hl, de
    ld   [hl], $02
    pop  bc

label_112C9::
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_11340
    ld   [hl], $40
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   nc, label_11340
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $12
    jr   c, label_11340
    ld   a, $5A
    call label_3B86
    jr   c, label_11340
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $03
    push bc
    ld   hl, $C2D0
    add  hl, bc
    ld   c, [hl]
    inc  [hl]
    ld   hl, label_111DE
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   [$FFEE], a
    ld   hl, label_111E2
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   [$FFEF], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C350
    add  hl, de
    ld   [hl], $00
    ld   hl, $C430
    add  hl, de
    ld   [hl], $00
    ld   hl, $C4D0
    add  hl, de
    ld   [hl], $1B
    ld   c, e
    ld   b, d
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $01
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1133F
    call label_12D7A

label_1133F::
    pop  bc

label_11340::
    call label_C05
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1117E
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1135F
    ld   a, $02
    call label_3B0C

label_1135F::
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1137E
    dec  [hl]
    rra
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_1137F
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $48

label_1137E::
    ret

label_1137F::
    ld   [bc], a
    ld   bc, rJOYP
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
    ld   bc, $F802
    ld   a, [$FF70]
    inc  bc
    ld    hl, sp+$F8
    ld   [hl], d
    inc  bc
    ld    hl, sp+$10
    ld   [hl], d
    inc  hl
    ld    hl, sp+$18
    ld   [hl], b
    inc  hl
    ld   [label_13CF8], sp
    inc  bc
    ld   [label_13E00], sp
    inc  bc
    ld   [label_13E08], sp
    inc  hl
    ld   [label_13C10], sp
    inc  hl
    ld    hl, sp+$F0
    ld   [hl], h
    inc  bc
    ld    hl, sp+$F8
    db   $76 ; Halt
    inc  bc
    ld    hl, sp+$10
    db   $76 ; Halt
    inc  hl
    ld    hl, sp+$18
    ld   [hl], h
    inc  hl
    ld   [label_13CF8], sp
    inc  bc
    ld   [label_13E00], sp
    inc  bc
    ld   [label_13E08], sp
    inc  hl
    ld   [label_13C10], sp
    inc  hl
    ld    hl, sp+$F0
    ld   [hl], h
    inc  bc
    ld    hl, sp+$F8
    db   $76 ; Halt
    inc  bc
    ld    hl, sp+$10
    db   $76 ; Halt
    inc  hl
    ld    hl, sp+$18
    ld   [hl], h
    inc  hl
    ld   [label_120F8], sp
    inc  bc
    ld   [label_12200], sp
    inc  bc
    ld   [label_12208], sp
    inc  hl
    ld   [label_12010], sp
    inc  hl
    ld    hl, sp+$F0
    ld   a, b
    inc  bc
    ld    hl, sp+$F8
    ld   a, d
    inc  bc
    ld    hl, sp+$10
    ld   a, d
    inc  hl
    ld    hl, sp+$18
    ld   a, b
    inc  hl
    ld   [label_120F8], sp
    inc  bc
    ld   [label_12200], sp
    inc  bc
    ld   [label_12208], sp
    inc  hl
    ld   [label_12010], sp
    inc  hl
    ld    hl, sp+$F0
    ld   [hl], b
    inc  bc
    ld    hl, sp+$F8
    ld   [hl], d
    inc  bc
    ld    hl, sp+$10
    ld   [hl], d
    inc  hl
    ld    hl, sp+$18
    ld   [hl], b
    inc  hl
    ld   [label_120F8], sp
    inc  bc
    ld   [label_12200], sp
    inc  bc
    ld   [label_12208], sp
    inc  hl
    ld   [label_12010], sp
    inc  hl

label_1142F::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_1138F
    add  hl, de
    ld   c, $08
    jp   label_3CE6

label_11446::
    ld   l, b
    ld   b, $68
    ld   h, $6A
    ld   b, $6A
    ld   h, $6C
    ld   b, $6C
    ld   h, $6E
    ld   b, $6E
    ld   h, $00
    ld   bc, label_302
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    nop
    ld   de, label_11446
    call label_3BC0
    call label_13FA3
    call label_C05
    jp   z, label_12D7A
    cp   $50
    jr   nz, label_1147E
    ld   hl, $FFF2
    ld   [hl], $40

label_1147E::
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_11456
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    cp   $03
    jr   nz, label_114F0
    ld   a, [$C11C]
    cp   $06
    jr   z, label_114F0
    ld   a, [$FFA2]
    and  a
    jr   nz, label_114F0
    call label_12E35
    add  a, $08
    cp   $10
    jr   nc, label_114F0
    call label_12E45
    add  a, $08
    cp   $10
    jr   nc, label_114F0
    ld   a, $0C
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
    pop  bc
    call label_12E35
    add  a, $03
    cp   $06
    jr   nc, label_114F0
    call label_12E45
    add  a, $03
    cp   $06
    jr   nc, label_114F0
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, $06
    ld   [$C11C], a
    call label_CAF
    ld   [$C198], a
    call label_C05
    ld   [hl], $40
    ld   a, $50
    ld   [$DBCB], a

label_114F0::
    ret

label_114F1::
    ld   b, b
    ld   b, $40
    ld   h, $42
    ld   b, $42
    ld   h, $70
    ld   b, $70
    ld   h, $72
    ld   b, $72
    ld   h, $40
    rlca
    ld   b, b
    daa
    ld   b, d
    rlca
    ld   b, d
    daa
    ld   de, label_11501
    ld   a, [$FFF7]
    cp   $06
    jr   z, label_1151C
    ld   de, label_114F1
    cp   $01
    jr   nz, label_1151C
    ld   de, label_114F9

label_1151C::
    call label_3BC0
    call label_C56
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_11596
    call label_13FA3
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_11541
    ld   a, $3F
    ld   [$FFF2], a

label_11541::
    ld   a, [$FFF0]
    rst  0
    ld   c, d
    ld   d, l
    ld   l, c
    ld   d, l
    add  a, [hl]
    ld   d, l
    call label_C05
    ld   [hl], $60
    call label_3B12
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $01
    jp   z, label_11607
    cp   $10
    jp   z, label_11615
    cp   $20
    jp   z, label_1160E
    jp   label_11623
    call label_3B70
    call label_C05
    jr   z, label_1157E
    cp   $30
    ret  c
    and  $03
    jr   nz, label_1157D
    ld   hl, $C310
    add  hl, bc
    inc  [hl]

label_1157D::
    ret

label_1157E::
    call label_3B12
    ld   a, $18
    jp   label_3BAA
    call label_12DCA
    call label_3B23
    call label_3B39
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z

label_11596::
    jp   label_3E34

label_11599::
    ld   a, [$FF16]
    ld   a, [$FF36]
    ld   de, label_11599
    call label_3BC0
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_11596
    call label_13FA3
    ld   a, [$FFF0]
    rst  0
    or   a
    ld   d, l
    jp   label_E055
    ld   d, l
    call label_1161C
    call label_3B12
    call label_C05
    ld   [hl], $60
    ret
    call label_3B70
    call label_C05
    jr   z, label_115D8
    cp   $30
    ret  c
    and  $03
    jr   nz, label_115D7
    ld   hl, $C310
    add  hl, bc
    inc  [hl]

label_115D7::
    ret

label_115D8::
    call label_3B12
    ld   a, $18
    jp   label_3BAA
    call label_12DCA
    call label_3B23
    call label_3B39
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_11596
    ret

label_115F3::
    db   $10
    db   $12
    ld   de, label_1013
    ld   [de], a
    ld   de, label_1413
    ld   d, $15
    rla

label_115FF::
    db   $76 ; Halt
    ld   [hl], a
    db   $76 ; Halt
    ld   [hl], a

label_11603::
    db   $76 ; Halt
    ld   c, c
    db   $76 ; Halt
    ld   c, c

label_11607::
    ld   de, label_115FB
    ld   a, $AA
    jr   label_11628

label_1160E::
    ld   de, label_115FF
    ld   a, $AE
    jr   label_11628

label_11615::
    ld   de, label_11603
    ld   a, $1D
    jr   label_11628

label_1161C::
    ld   de, label_115F7
    ld   a, $0D
    jr   label_11628

label_11623::
    ld   de, label_115F3
    ld   a, $0D

label_11628::
    ld   [$FFD7], a
    push de
    ld   a, [$FFEF]
    sub  a, $0F
    ld   [$FFCD], a
    ld   a, [$FFEE]
    sub  a, $07
    ld   [$FFCE], a
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFCD]
    and  $F0
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    add  hl, de
    ld   a, [$FFD7]
    ld   [hl], a
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_1165F
    push bc
    ld   a, [$FFD7]
    ld   [$DDD8], a
    ld   a, $04
    call label_91D
    pop  bc

label_1165F::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $0A
    ld   [$D600], a
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
    xor  a
    ld   [hl], a
    ret

label_11690::
    xor  a
    ld   [$D201], a
    ld   e, $80
    ld   hl, $D100

label_11699::
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, label_11699
    ret

label_1169F::
    ld   b, $07
    nop
    ld   bc, label_302
    inc  b
    dec  b

label_116A7::
    call label_13FA3
    jp   label_3B39
    call label_394D
    call label_116A7
    call label_11902
    call label_C56
    ld   a, [$C124]
    and  a
    jp   nz, label_11690
    call label_3EE8
    ld   a, [$FFEA]
    cp   $05
    jp   z, label_11791
    ld   a, [$FFF0]
    rst  0
    push de
    ld   d, [hl]
    db   $E3 ; Undefined instruction
    ld   d, [hl]
    ld   a, [$FF00+C]
    dec  e
    ld   d, a
    call label_C05
    ld   [hl], $60
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    jp   label_3B12
    call label_C05
    ret  nz
    ld   [hl], $FF
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    jp   label_3B12
    call label_C05
    and  $1F
    ret  nz
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   z, label_11705
    inc  [hl]
    jp   label_11A05

label_11705::
    call label_C05
    ld   [hl], $30
    jp   label_3B12

label_1170D::
    nop
    ld   b, $08
    ld   b, $00
    ld   a, [$FAF8]

label_11715::
    ld    hl, sp+$FA
    nop
    ld   b, $08
    ld   b, $00
    ld   a, [label_5CD]
    inc  c
    jp   z, label_11751
    and  $03
    jr   nz, label_11750
    ld   a, [hl]
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1170D
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_11715
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    call label_11A05
    call label_C05
    cp   $10
    jr   nz, label_11750
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $05

label_11750::
    ret

label_11751::
    ld   a, $36
    call label_3B86
    ld   a, [$FFD7]
    cp   $88
    jr   c, label_1175E
    ld   a, $88

label_1175E::
    cp   $18
    jr   nc, label_11764
    ld   a, $18

label_11764::
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    cp   $70
    jr   c, label_11771
    ld   a, $70

label_11771::
    cp   $20
    jr   nc, label_11777
    ld   a, $20

label_11777::
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $FFF4
    ld   [hl], $1A
    jp   label_12D7A

label_11791::
    call label_3D8A
    call label_13FA3
    xor  a
    ld   [$D3D6], a
    ld   e, $10
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   c, label_117AE
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_117B8

label_117AE::
    call label_117C6
    ld   a, $01
    ld   [$D3D6], a
    ld   e, $0B

label_117B8::
    ld   hl, $D201
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   e
    jr   c, label_117C6
    ld   [hl], b
    ld   a, $1B
    ld   [$FFF4], a

label_117C6::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $7F
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFEE]
    ld   [hl], a
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFEC]
    ld   [hl], a
    call label_11AE6
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    srl  e
    ld   d, b
    ld   hl, label_1169F
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_117F2::
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_117F7
    db   $10
    db   $60
    jr   nz, label_1180B
    ld    hl, sp+$64
    nop
    ld   [label_12600], sp
    nop
    ld   [label_12608], sp
    jr   nz, label_11817
    db   $10
    db   $64
    jr   nz, label_1180B
    ld    hl, sp+$60
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_11817
    db   $10
    db   $60
    jr   nz, label_1182B
    ld    hl, sp+$6C
    nop
    ld   [label_12E00], sp
    nop
    ld   [label_12208], sp
    ld   h, b
    ld   [label_12010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   l, b
    nop
    ld    hl, sp+$00
    ld   l, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_11837
    db   $10
    db   $60
    jr   nz, label_1184B
    ld    hl, sp+$68
    ld   b, b
    ld   [label_12A00], sp
    ld   b, b
    ld   [label_12208], sp
    ld   h, b
    ld   [label_12010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   l, h
    ld   b, b
    ld    hl, sp+$00
    ld   l, [hl]
    ld   b, b
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_11857
    db   $10
    db   $60
    jr   nz, label_1186B
    ld    hl, sp+$60
    ld   b, b
    ld   [label_12200], sp
    ld   b, b
    ld   [label_12208], sp
    ld   h, b
    ld   [label_12010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   h, h
    ld   b, b
    ld    hl, sp+$00
    ld   h, [hl]
    ld   b, b
    ld    hl, sp+$08
    ld   h, [hl]
    ld   h, b
    ld    hl, sp+$10
    ld   h, h
    ld   h, b
    ld   [label_120F8], sp
    ld   b, b
    ld   [label_12200], sp
    ld   b, b
    ld   [label_12208], sp
    ld   h, b
    ld   [label_12010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   l, [hl]
    ld   h, b
    ld    hl, sp+$10
    ld   l, h
    ld   h, b
    ld   [label_120F8], sp
    ld   b, b
    ld   [label_12200], sp
    ld   b, b
    ld   [label_12208], sp
    ld   h, b
    ld   [label_12010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   l, d
    jr   nz, label_118B7
    db   $10
    db   $68
    jr   nz, label_118CB
    ld    hl, sp+$60
    ld   b, b
    ld   [label_12200], sp
    ld   b, b
    ld   [label_12A08], sp
    ld   h, b
    ld   [label_12810], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_118D7
    db   $10
    db   $60
    jr   nz, label_118EB
    ld    hl, sp+$60
    ld   b, b
    ld   [label_12200], sp
    ld   b, b
    ld   [label_12E08], sp
    jr   nz, label_118F7
    db   $10
    db   $6C
    jr   nz, label_11963
    nop
    ld   [hl], b
    jr   nz, label_11969

label_118F7::
    nop
    ld   [hl], d
    jr   nz, label_1196F
    nop
    ld   [hl], h
    jr   nz, label_11975
    nop
    db   $76 ; Halt
    jr   nz, label_11924
    ret  nc
    jp   nz, label_13E09
    cp   $05
    jp   nc, label_11A04
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_117F2
    add  hl, de

label_11924::
    ld   c, $08
    call label_3CE6
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $02
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jp   nc, label_11A04
    ld   a, [$FFD7]
    sub  a, $0C
    and  $7F
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $D100
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   a, $00
    ld   [$FFF1], a
    ld   de, label_118F2
    call label_3BC0
    ld   hl, $C2D0

label_11963::
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jp   nc, label_11A04
    ld   a, [$FFD7]
    sub  a, $18
    and  $7F
    ld   e, a
    ld   d, b
    ld   hl, $D000

label_11975::
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $D100
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   a, $00
    ld   [$FFF1], a
    ld   de, label_118F2
    call label_3BC0
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   nc, label_11A04
    ld   a, [$FFD7]
    sub  a, $24
    and  $7F
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $D100
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   a, $01
    ld   [$FFF1], a
    ld   de, label_118F2
    call label_3BC0
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_11A04
    ld   a, [$FFD7]
    sub  a, $2E
    and  $7F
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $D100
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $02
    ld   [$FFF1], a
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   hl, $FFED
    xor  [hl]
    ld   [hl], a
    ld   de, label_118F2
    call label_3BC0
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_11A04
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $90
    call label_3B70
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $D0

label_11A04::
    ret

label_11A05::
    call label_13FA9
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $13
    ld   [$FFF4], a
    ret

label_11A1A::
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    sla  e
    sla  e
    sla  e
    sla  e
    sla  e
    ld   d, b
    ld   hl, $D000
    add  hl, de
    push de
    ld   e, $20

label_11A31::
    xor  a
    ldi  [hl], a
    dec  e
    ld   a, e
    cp   $00
    jr   nz, label_11A31
    pop  de
    ld   hl, $D100
    add  hl, de
    ld   e, $20

label_11A40::
    xor  a
    ldi  [hl], a
    dec  e
    ld   a, e
    cp   $00
    jr   nz, label_11A40
    ret

label_11A49::
    ld   [hl], b
    nop
    ld   [hl], b
    jr   nz, label_11ABE
    ld   b, b
    ld   [hl], b
    ld   h, b
    ld   [hl], d
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    jr   nz, label_11ACA
    jr   nz, label_11AD0
    nop
    ld   a, b
    nop
    ld   a, b
    jr   nz, label_11AD6
    jr   nz, label_11AD8
    ld   b, b
    ld   a, b
    ld   b, b
    ld   a, b
    ld   h, b
    db   $76 ; Halt
    ld   h, b
    ld   a, d
    nop
    ld   a, d
    jr   nz, label_11AEA
    nop
    ld   a, h
    jr   nz, label_11A75
    inc  bc
    dec  b
    dec  b

label_11A75::
    nop
    nop
    inc  b
    inc  b
    ld   [bc], a
    ld   [bc], a
    ld   b, $06
    ld   bc, label_701
    rlca

label_11A81::
    nop
    ld   b, $0C
    ld   c, $10
    ld   c, $0C
    ld   b, $00
    ld   a, [$F2F4]
    ld   a, [$FFF2]
    db   $F4 ; Undefined instruction
    ld   a, [label_600]
    inc  c
    ld   c, $CD
    ld   a, a
    ld   e, e
    ld   a, [$C124]
    and  a
    jr   nz, label_11AA6
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_11AA9

label_11AA6::
    call label_11A1A

label_11AA9::
    call label_13FA3
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $1F
    ld   [hl], a
    ld   [$FFD7], a
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    sla  e

label_11ABE::
    sla  e
    sla  e
    sla  e
    sla  e
    ld   d, $00
    push de
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFD7]
    ld   e, a

label_11AD0::
    add  hl, de
    ld   a, [$FFEE]
    ld   [hl], a
    pop  de
    ld   hl, $D100

label_11AD8::
    add  hl, de
    ld   a, [$FFD7]
    ld   e, a
    add  hl, de
    ld   a, [$FFEC]
    ld   [hl], a
    call label_12D80
    call label_3B39

label_11AE6::
    ld   hl, $C420
    add  hl, bc

label_11AEA::
    ld   a, [hl]
    and  a
    jr   nz, label_11AF1
    call label_12DCA

label_11AF1::
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_11B28
    ld   e, $08
    bit  0, a
    jr   nz, label_11B10
    ld   e, $00
    bit  1, a
    jr   nz, label_11B10
    ld   e, $04
    bit  2, a
    jr   nz, label_11B10
    ld   e, $0C

label_11B10::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], e
    call label_280D
    rra
    jr   c, label_11B23
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_11B23::
    call label_C05
    ld   [hl], $10

label_11B28::
    call label_C00
    jr   nz, label_11B66
    ld   [hl], $04
    ld   a, [$FFEB]
    cp   $59
    jr   nz, label_11B37
    ld   [hl], $06

label_11B37::
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
    ld   hl, label_11A71
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_11A81
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, label_11A85
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a

label_11B66::
    call label_C05
    jr   nz, label_11B7E
    call label_280D
    and  $1F
    add  a, $10
    ld   [hl], a
    call label_280D
    and  $02
    dec  a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a

label_11B7E::
    ret
    ld   de, label_11A49
    call label_3BC0
    call label_13FA3
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    sla  e
    sla  e
    sla  e
    sla  e
    sla  e
    ld   d, b
    push de
    push de
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFD7]
    sub  a, $09
    and  $1F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    pop  de
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFD7]
    sub  a, $09
    and  $1F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   a, $08
    ld   [$FFF1], a
    ld   de, label_11A49
    call label_3BC0
    pop  de
    push de
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFD7]
    sub  a, $10
    and  $1F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    pop  de
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFD7]
    sub  a, $10
    and  $1F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   a, $09
    ld   [$FFF1], a
    ld   de, label_11A49
    call label_3BC0
    jp   label_3D8A

label_11BFC::
    ld   e, b
    ld   [bc], a
    ld   e, d
    ld   [bc], a
    ld   e, h
    ld   [bc], a
    ld   e, [hl]
    ld   [bc], a

label_11C04::
    inc  c
    db   $F4 ; Undefined instruction

label_11C06::
    ld   [$CDF8], sp
    and  [hl]
    ld   e, l
    jr   label_11C16
    call label_13F90
    ld   de, label_11BFC
    call label_3BC0

label_11C16::
    ld   a, [$FFF0]
    and  a
    jr   z, label_11C43
    ld   a, $FF
    call label_3B0C
    call label_12E35
    add  a, $10
    cp   $20
    jr   nc, label_11C42
    call label_12E45
    add  a, $10
    cp   $20
    jr   nc, label_11C42
    ld   a, [$C133]
    and  a
    jr   z, label_11C42
    call label_3B12
    ld   [hl], b
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $30

label_11C42::
    ret

label_11C43::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    xor  c
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $00
    jr   z, label_11C5A
    ld   a, $FF
    call label_3B0C

label_11C5A::
    call label_13FA3
    call label_12D80
    call label_3B70
    call label_12DCA
    call label_12E03
    call label_11D08
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_11D07
    call label_3B44
    call label_C05
    jr   nz, label_11C8C
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    and  $01
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a

label_11C8C::
    call label_C00
    jr   nz, label_11CA0
    call label_280D
    and  $0F
    add  a, $18
    ld   [hl], a
    and  $01
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a

label_11CA0::
    ld   a, [$FFE7]
    xor  c
    and  $03
    jr   nz, label_11D07
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFEE]
    cp   $28
    jr   nc, label_11CB5
    ld   [hl], $00
    jr   label_11CBB

label_11CB5::
    cp   $78
    jr   c, label_11CC0
    ld   [hl], $01

label_11CBB::
    call label_C05
    ld   [hl], $20

label_11CC0::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [$FFEC]
    cp   $28
    jr   nc, label_11CCE
    ld   [hl], $00
    jr   label_11CD4

label_11CCE::
    cp   $60
    jr   c, label_11CD9
    ld   [hl], $01

label_11CD4::
    call label_C00
    ld   [hl], $20

label_11CD9::
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_11C04
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_11CEF
    inc  [hl]
    inc  [hl]

label_11CEF::
    dec  [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_11C06
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_11D06
    inc  [hl]
    inc  [hl]

label_11D06::
    dec  [hl]

label_11D07::
    ret

label_11D08::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_11D25
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $10
    jr   z, label_11D25
    bit  7, a
    jr   z, label_11D1E
    inc  [hl]
    jr   label_11D25

label_11D1E::
    cp   $10
    jr   nc, label_11D24
    inc  [hl]
    ret

label_11D24::
    dec  [hl]

label_11D25::
    ret

label_11D26::
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
    ld   [label_124F8], sp
    ld   [bc], a
    ld   [label_12600], sp
    ld   [bc], a
    ld   [label_12808], sp
    ld   [bc], a
    ld   [label_12A10], sp
    ld   [bc], a
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
    ld   [label_124F8], sp
    ld   [bc], a
    ld   [label_12C00], sp
    ld   [bc], a
    ld   [label_12E08], sp
    ld   [bc], a
    ld   [label_12A10], sp
    ld   [bc], a
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
    ld   [label_12AF8], sp
    ldi  [hl], a
    ld   [label_12800], sp
    ldi  [hl], a
    ld   [label_12608], sp
    ldi  [hl], a
    ld   [label_12410], sp
    ldi  [hl], a
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
    ld   [label_12AF8], sp
    ldi  [hl], a
    ld   [label_12E00], sp
    ldi  [hl], a
    ld   [label_12C08], sp
    ldi  [hl], a
    ld   [label_12410], sp
    ldi  [hl], a
    call label_13F90
    ld   a, [$FFED]
    push af
    rla
    and  $40
    ld   [$FFD7], a
    pop  af
    and  $0F
    ld   [$FFED], a
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   hl, $FFD7
    add  a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_11D26
    add  hl, de
    ld   c, $08
    jp   label_3CE6

label_11DD1::
    ld   [hl], b
    ld   bc, label_172
    ld   [hl], d
    ld   hl, label_2170
    ld   [hl], h
    ld   bc, label_2174
    nop
    nop
    nop
    nop
    ld   a, d
    ld   bc, label_217A
    rst  $38
    nop
    rst  $38
    nop
    db   $76 ; Halt
    ld   bc, label_178
    ld   a, b
    ld   hl, label_2176
    ld   a, [$FFF1]
    cp   $03
    jr   nz, label_11E1C
    ld   a, [$FFEE]
    sub  a, $08
    ld   [$FFEE], a
    ld   a, $06
    ld   [$FFF1], a
    ld   de, label_11DD1
    call label_3BC0
    ld   a, [$FFEE]

label_11E09::
    add  a, $10
    ld   [$FFEE], a
    ld   a, $07
    ld   [$FFF1], a
    ld   de, label_11DD1
    call label_3BC0
    call label_3D8A
    jr   label_11E22

label_11E1C::
    ld   de, label_11DD1
    call label_3BC0

label_11E22::
    call label_13FA3
    call label_12D80
    ld   a, [$FFF0]
    rst  0
    ld   sp, label_1365E
    ld   e, [hl]
    or   [hl]
    ld   e, [hl]
    call label_3B39
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_C05
    cp   $18
    jr   nz, label_11E4A
    call label_11EC6
    and  a

label_11E4A::
    jr   nc, label_11E72
    call label_12E35
    add  a, $20
    cp   $40
    jr   nc, label_11E72
    call label_12E45
    add  a, $20
    cp   $40
    jr   nc, label_11E72
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_11E72
    call label_C05
    ld   [hl], $20
    call label_3B12
    ld   a, $3C
    ld   [$FFF2], a

label_11E72::
    ret

label_11E73::
    inc  b
    inc  bc
    ld   [bc], a
    call label_C05
    cp   $18
    jp   nc, label_3B39
    and  a
    jr   nz, label_11EA4
    ld   [hl], $40
    call label_3B12
    ld   a, $FF
    call label_3B0C
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

label_11EA4::
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_11E73
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_11EB3::
    ld   [bc], a
    inc  bc
    inc  b
    call label_C05
    cp   $18
    ret  nc
    and  a
    jr   nz, label_11EE5
    ld   [hl], $30
    call label_3B12
    ld   [hl], b
    ret

label_11EC6::
    ld   a, $58
    call label_3B86
    jr   c, label_11EE4
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFD7]
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFD8]
    ld   [hl], a
    push bc
    ld   c, e
    ld   b, d
    ld   a, $18
    call label_3BAA
    pop  bc

label_11EE4::
    ret

label_11EE5::
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_11EB3
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    ld   a, h
    nop
    ld   a, h
    jr   nz, label_11F77
    nop
    ld   a, [hl]
    jr   nz, label_11F0E
    db   $F4 ; Undefined instruction
    ld   e, [hl]
    call label_3BC0
    call label_13FA3
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_12DCA
    call label_3B2E
    call label_3B4F
    call label_3B70
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    call label_12D7A
    jp   label_12C20

label_11F28::
    nop
    ld   a, [$FF78]
    ld   bc, $F800
    ld   a, d
    ld   bc, $0000
    ld   [hl], b
    ld   bc, label_800
    ld   [hl], d
    ld   bc, $F000
    ld   a, h
    ld   bc, $F800
    ld   a, [hl]
    ld   bc, $0000
    ld   [hl], b
    ld   bc, label_800
    ld   [hl], d
    ld   bc, $F000
    ld   a, b
    ld   bc, $F800
    ld   a, d
    ld   bc, $0000
    ld   [hl], h
    ld   bc, label_800
    db   $76 ; Halt
    ld   bc, label_169A
    sbc  a, h
    ld   d, $21
    ld   b, b
    call nz, label_13E09
    and  a
    jr   z, label_11F96
    ld   a, [$FFEC]
    add  a, $04
    ld   [$FFEC], a
    ld   de, label_11F58
    call label_3BC0
    call label_12DCA
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_11F91
    call label_12D7A
    xor  a
    ld   [$DB7F], a
    ld   [$C167], a
    jp   label_C0C

label_11F91::
    ld   a, $02
    ld   [$FFA1], a
    ret

label_11F96::
    ld   a, [$FFF9]
    and  a
    jp   nz, label_120A4
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $84
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE8], a
    ld   a, [$C19F]
    and  a
    ld   hl, label_11F48
    jr   nz, label_11FC2
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    ld   hl, label_11F28
    and  $30
    jr   z, label_11FC2
    ld   hl, label_11F38

label_11FC2::
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0
    call label_13BE3
    ld   a, [$FFF0]
    rst  0
    ret  c
    ld   e, a
    rst  $28
    ld   e, a
    ld   b, c
    ld   h, b
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    call label_13C4B
    ret  nc
    ld   a, $02
    ld   [$C167], a
    ld   a, $45
    call label_2385
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   z, label_12007
    ld   [hl], b
    xor  a
    ld   [$C167], a
    ld   a, $46
    jp   label_2385

label_12007::
    push hl
    push de
    ld   a, [$DB90]
    ld   e, a
    ld   a, [$DB8F]

label_12010::
    ld   d, a
    ld   a, [$DB5E]
    ld   l, a
    ld   a, [$DB5D]
    ld   h, a

label_12019::
    ld   a, e
    or   d
    jr   z, label_12023
    daa
    inc  hl
    daa
    dec  de
    jr   label_12019

label_12023::
    ld   a, l
    sub  a, $10
    ld   a, h
    sbc  a, $00
    pop  de
    pop  hl
    jr   c, label_12037
    ld   a, $0A
    ld   [$DB92], a
    ld   a, $47
    jp   label_2385

label_12037::
    ld   [hl], b
    xor  a
    ld   [$C167], a
    ld   a, $4E
    jp   label_2385
    ld   a, [$C19F]

label_12044::
    and  a
    ret  nz
    call label_3E83
    jp   label_127FB

label_1204C::
    ld   e, b
    nop
    ld   e, d
    nop
    ld   d, [hl]
    jr   nz, label_12052
    nop
    ld   e, h
    nop
    ld   e, [hl]
    nop
    ld   e, b
    nop
    ld   e, d
    nop
    ld   e, b
    nop
    ld   e, d
    nop
    ld   e, h
    nop
    ld   e, [hl]
    nop
    ld   e, h
    nop
    ld   e, [hl]
    nop
    ld   d, [hl]
    nop
    rst  $38
    nop
    ld   e, [hl]
    jr   nz, label_120CB
    jr   nz, label_120C9
    nop
    ld   e, d
    nop

label_12074::
    ld   b, $16
    db   $10
    db   $10
    jr   c, label_120B2
    add  hl, sp
    add  hl, sp
    ld   d, $38

label_1207E::
    or   $00
    pop  af
    ld   a, [$FFF0]
    ld   a, [$FFF0]
    cp   $04
    ld   a, [$FF00+C]
    ld   a, [$FFFA]
    nop
    nop
    ld    hl, sp+$F8
    ld    hl, sp+$F2
    cp   $E8
    nop
    ld   [$FFE8], a
    nop
    nop
    nop
    nop
    inc  d

label_1209B::
    db   $10
    db   $E0
    ld    hl, sp+$10
    nop
    nop
    nop
    nop
    ld   a, [$FF3E]
    ld   bc, label_127EA
    pop  bc
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ret  nc
    ld   h, b
    add  a, c

label_120B2::
    ld   h, d
    db   $3A ; ldd  a, [hl]
    ld   h, h
    ld   hl, label_1867
    ld   e, b
    ld   h, b
    jr   label_12044
    ld   b, b
    ld   c, h
    inc  [hl]
    ld   l, b

label_120C0::
    ld   d, b
    ld   bc, $0000
    ld   bc, label_200
    ld   [bc], a
    ld   [bc], a

label_120C9::
    inc  bc

label_120CA::
    inc  bc

label_120CB::
    nop
    ld   a, $1E
    db   $10
    db   $30
    ld   a, $02
    ld   [$FFA1], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_12120
    inc  [hl]
    push bc
    ld   c, $05

label_120E0::
    ld   a, $54
    call label_3B86
    ld   hl, label_120B6
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_120BB
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de

label_120F8::
    ld   [hl], a
    ld   hl, label_120C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    ld   hl, label_120C5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], a
    ld   hl, label_120CA
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], a
    dec  c
    jr   nz, label_120E0
    xor  a
    ld   [$D004], a

label_1211E::
    pop  bc
    ret

label_12120::
    ld   a, [$FFF1]
    ld   e, a
    ld   d, b
    ld   hl, label_12074
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ld   hl, label_1207E
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_12088
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$FFEC], a
    ld   de, label_1204C
    call label_3BC0
    ld   a, [$FFF0]
    rst  0
    ld   d, h
    ld   h, c
    ld   a, e
    ld   h, c
    db   $E4 ; Undefined instruction
    ld   h, c
    push hl
    ld   h, c
    ld   b, a
    ld   h, d
    ld   d, d
    ld   h, d
    ld   l, h
    ld   h, d
    ld   a, [$C19F]
    and  a
    jr   nz, label_1216C
    ld   a, [$FFCC]
    and  $30
    jr   z, label_1216C
    call label_3B12
    call label_C05
    ld   [hl], $23
    xor  a
    ld   [$D002], a

label_1216C::
    ld   a, $09
    jp   label_121BA

label_12171::
    ld   bc, label_808
    ld   [label_808], sp
    ld   bc, label_302
    nop
    call label_C05
    jr   nz, label_121B6
    call label_3B12
    ld   a, $02
    ld   [$C3B0], a
    ld   a, $54
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $78
    ld   hl, $C210
    add  hl, de
    ld   [hl], $18
    ld   hl, $C240
    add  hl, de
    ld   [hl], $E2
    ld   hl, $C250
    add  hl, de
    ld   [hl], $FA
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $14
    ld   a, $08
    ld   [$FFF2], a
    ret

label_121B6::
    rra
    rra
    and  $1F

label_121BA::
    ld   e, a
    ld   d, b
    ld   hl, label_12171
    add  hl, de
    ld   a, [hl]
    ld   [$C3B0], a
    ld   e, a
    ld   d, b
    ld   hl, label_12092
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_1209B
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    ld   de, label_1226D
    call label_3BC0
    jp   label_3D8A
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C177]
    and  a
    jr   nz, label_12237
    ld   a, [$D004]
    cp   $05
    jr   c, label_12202
    ld   a, $4B
    call label_2385
    call label_3B12
    ld   [hl], $05
    ret

label_12202::
    push hl
    push de
    ld   a, [$DB90]
    ld   e, a

label_12208::
    ld   a, [$DB8F]
    ld   d, a
    ld   a, [$DB5E]
    ld   l, a
    ld   a, [$DB5D]
    ld   h, a

label_12214::
    ld   a, e
    or   d
    jr   z, label_1221E
    daa
    inc  hl
    daa
    dec  de
    jr   label_12214

label_1221E::
    ld   a, l
    sub  a, $10
    ld   a, h
    sbc  a, $00
    pop  de
    pop  hl
    jr   c, label_1223F
    ld   a, $0A
    ld   [$DB92], a
    ld   a, $47
    call label_2385
    call label_3B12
    ld   [hl], b
    ret

label_12237::
    ld   a, $46
    call label_2385
    jp   label_3B12

label_1223F::
    ld   a, $4E
    call label_2385
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3E83
    jp   label_127FB
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   [hl], $04
    ld   a, [$C177]
    and  a
    jr   nz, label_12267
    ld   a, $4C
    jp   label_2385

label_12267::
    ld   a, $46
    jp   label_2385
    ret

label_1226D::
    ld   d, b
    ld   [bc], a
    ld   d, h
    ld   [bc], a
    ld   d, b
    ld   [bc], a
    ld   d, d
    ld   [bc], a
    ld   d, b
    ld   b, d
    ld   d, h
    ld   [bc], a
    ld   d, h
    ld   b, d
    ld   d, b
    ld   b, d
    ld   d, h
    ld   h, d
    ld   d, b
    ld   h, d
    ld   a, c
    ld   [$D003], a
    ld   de, label_1226D
    call label_3BC0
    ld   a, [$FFEE]
    ld   [$D000], a
    ld   a, [$FFEF]
    ld   [$D001], a
    call label_13FA3
    ld   a, [$FFF0]
    rst  0
    sbc  a, a
    ld   h, d
    ld   [$CD63], sp
    rst  $10
    ld   l, l
    call label_12DCD
    ld   a, [$FFCB]
    and  $01
    jr   z, label_122BC
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_122BC
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_122BC
    inc  [hl]
    jr   label_122C1

label_122BC::
    call label_C05
    jr   nz, label_122E7

label_122C1::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_122D1
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $20
    jr   z, label_122D1
    inc  [hl]

label_122D1::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    cp   $03
    ld   [hl], a
    jr   nz, label_122E7
    xor  a
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_122E7
    inc  [hl]

label_122E7::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $2A
    jr   c, label_12307
    call label_3D7F
    call label_3B12

label_122F6::
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, $01
    call label_CC7
    ld   a, $0E
    ld   [$FFF2], a

label_12307::
    ret
    ld   hl, $C3B0
    ld   [hl], $00
    call label_C05
    jr   z, label_12317
    ld   hl, $C3B0
    ld   [hl], $04

label_12317::
    call label_C00
    jr   z, label_12321
    ld   hl, $C3B0
    ld   [hl], $05

label_12321::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_12DCA
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_12354
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    sub  a, $04
    jr   z, label_12345
    and  $80
    jr   z, label_12344
    inc  [hl]
    inc  [hl]

label_12344::
    dec  [hl]

label_12345::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12354
    and  $80
    jr   z, label_12353
    inc  [hl]
    inc  [hl]

label_12353::
    dec  [hl]

label_12354::
    ld   a, [$FFCC]
    and  $30
    jr   z, label_123B9
    call label_C05
    ld   [hl], $08
    ld   a, [$FF98]
    push af
    sub  a, $17
    ld   [$FF98], a
    ld   a, $04
    call label_3BAA
    pop  af
    ld   [$FF98], a
    ld   a, [$FFEC]
    cp   $25
    jr   nc, label_123AD
    ld   a, [$FFEE]
    cp   $70
    jr   c, label_123AD
    ld   hl, $C290
    ld   [hl], $03
    ld   a, $48
    call label_2385
    call label_12D7A
    ld   e, $0F
    ld   d, b

label_1238A::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_123A7
    ld   hl, $C2B0
    add  hl, de
    ld   a, [hl]
    cp   $02
    jr   c, label_123A7
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $02
    jr   c, label_123A7
    and  $01
    ld   [hl], a

label_123A7::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_1238A

label_123AD::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    jr   label_123DE

label_123B9::
    ld   a, [$FFCC]
    and  $05
    jr   z, label_123DE
    ld   a, [$FFEC]
    cp   $30
    jr   c, label_123DE
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_123DE
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FA
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $50
    call label_C00
    ld   [hl], $10

label_123DE::
    ld   a, [$FFEE]
    ld   hl, $C200
    add  hl, bc
    cp   [hl]
    jr   nz, label_123F0
    ld   a, [$FFEF]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jr   z, label_12402

label_123F0::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    push af
    push hl
    and  $80
    jr   z, label_123FC
    ld   [hl], b

label_123FC::
    call label_3B23
    pop  hl
    pop  af
    ld   [hl], a

label_12402::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1240E
    xor  a
    call label_3B0C

label_1240E::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    rla
    ret  c
    ld   a, $02
    jp   label_3B0C

label_1241A::
    ld   c, h
    nop
    ld   c, d
    nop
    ld   c, h
    nop
    ld   c, [hl]
    nop
    ld   c, b
    nop
    ld   c, d
    nop
    ld   c, b
    nop
    ld   c, [hl]
    nop
    ld   c, d
    jr   nz, label_12479
    jr   nz, label_1247D
    jr   nz, label_1247D
    jr   nz, label_1247D
    jr   nz, label_1247D
    jr   nz, label_12485
    jr   nz, label_12481
    jr   nz, label_1245C
    add  a, b
    jp   label_13E09
    and  a
    jr   nz, label_12448
    ld   a, [$FFF1]
    add  a, $04
    ld   [$FFF1], a

label_12448::
    ld   de, label_1241A
    call label_3BC0

label_1244E::
    call label_13FA3
    call label_12DCA
    ld   a, [$FFF0]
    rst  0
    ld   h, e
    ld   h, h
    sbc  a, e
    ld   h, h
    ld   a, [$FF00+C]
    dec  l
    ld   h, l
    ld   a, d
    ld   h, l
    adc  a, c
    ld   h, [hl]
    call label_1279B
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jp   z, label_12738
    call label_C05
    jr   nz, label_12482
    ld   [hl], $30
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    call label_3B12

label_12482::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_12497
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12497
    and  $80
    jr   z, label_12496
    inc  [hl]
    inc  [hl]

label_12496::
    dec  [hl]

label_12497::
    jr   label_124E0

label_12499::
    db   $10
    db   $F0
    call label_1279B
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jp   z, label_12762
    call label_C05
    jr   nz, label_124B3
    ld   [hl], $50
    call label_3B12
    ld   [hl], b

label_124B3::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_124E0
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push hl
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_12499
    add  hl, de
    sub  a, [hl]
    pop  hl
    and  a
    jr   z, label_124E0
    and  $80
    jr   z, label_124DF
    inc  [hl]
    inc  [hl]

label_124DF::
    dec  [hl]

label_124E0::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $34
    jr   nc, label_124EF
    inc  [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b

label_124EF::
    ret

label_124F0::
    ld   a, [$FF00+C]
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_C05
    jr   nz, label_12504
    call label_3B12

label_12504::
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_124F0
    add  hl, de
    ld   a, [$D000]
    add  a, [hl]
    ld   [$FF98], a
    ld   a, [$D001]
    ld   [$FF99], a
    ld   a, $04
    call label_3BAA
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_12DCA
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    add  a, $02
    call label_3B0C
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, [$D000]
    add  a, $04
    ld   [$FF98], a
    ld   a, [$D001]
    ld   [$FF99], a
    ld   a, $10
    call label_3BAA
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    call label_12DCA
    ld   a, [$D000]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_12575
    call label_3D7F
    call label_3B12
    ld   a, [$D003]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   [hl], b

label_12575::
    ret

label_12576::
    ld   d, h
    nop

label_12578::
    ld   [label_21F8], sp
    add  a, b
    jp   label_11E09
    ld   d, b
    ld   hl, label_12578
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, $FFF1
    ld   [hl], b
    ld   de, label_12576
    call label_3C77
    call label_3D8A
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_125DB
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, $00
    ld   [$FF98], a
    ld   a, $59
    ld   [$FF99], a
    ld   a, $08
    call label_3BB5
    ld   a, [$FFD7]
    ld   hl, $C250
    add  hl, bc
    sub  a, [hl]
    inc  [hl]
    and  $80
    jr   z, label_125C7
    dec  [hl]
    dec  [hl]

label_125C7::
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    inc  [hl]
    and  $80
    jr   z, label_125D5
    dec  [hl]
    dec  [hl]

label_125D5::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a

label_125DB::
    ld   a, [$FFCC]
    and  $30
    jr   z, label_12631
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jr   nz, label_125F1
    call label_280D
    and  $03
    jr   z, label_12631

label_125F1::
    ld   a, [$FF98]
    push af
    sub  a, $14
    ld   [$FF98], a
    ld   a, [$FF99]
    push af
    add  a, $08
    ld   [$FF99], a
    ld   a, $03
    call label_3BB5
    ld   a, [$FFD7]
    ld   hl, $C250
    add  hl, bc
    sub  a, [hl]
    inc  [hl]
    inc  [hl]
    and  $80
    jr   z, label_12615
    dec  [hl]
    dec  [hl]
    dec  [hl]
    dec  [hl]

label_12615::
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    inc  [hl]
    inc  [hl]
    and  $80
    jr   z, label_12626
    dec  [hl]
    dec  [hl]
    dec  [hl]
    dec  [hl]

label_12626::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    call label_C05
    ld   [hl], $10

label_12631::
    call label_12DCA
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12644
    rlca
    and  $01
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_12644::
    ld   hl, $C3B0
    ld   [hl], $05
    call label_C05
    jr   z, label_12659
    ld   a, [$FFE7]
    and  $30
    jr   z, label_12659
    ld   hl, $C3B0
    ld   [hl], $07

label_12659::
    ld   a, [$FFEC]
    cp   $2C
    jr   nc, label_12677
    ld   a, [$FFEE]
    cp   $74
    jr   c, label_12677
    call label_3B12
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $05
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F0
    jp   label_122F6

label_12677::
    ld   a, [$FFEE]
    cp   $03
    ret  nc
    ld   hl, $C290
    ld   [hl], $03
    ld   a, $49
    call label_2385
    jp   label_12D7A
    ld   hl, $C3B0
    ld   [hl], $01
    call label_12DCA
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    nop
    ld   a, [hl]
    cp   $0C
    ret  nz
    ld   hl, $C290
    ld   [hl], $03
    ld   a, c
    cp   $0F
    jr   nz, label_126E6
    ld   a, [$FFF8]
    and  $10
    jr   nz, label_126E6
    ld   a, $01
    ld   [$FFF2], a
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $01
    ld   hl, $D900
    add  hl, de
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ld   [$FFF8], a
    ld   a, [$DB5C]
    inc  a
    ld   [$DB5C], a
    cp   $04
    jr   nz, label_126DA
    xor  a
    ld   [$DB5C], a
    ld   hl, $DB93
    ld   [hl], $40
    ld   hl, $DB5B
    inc  [hl]
    ld   a, $FF
    jr   label_126DC

label_126DA::
    ld   a, $FE

label_126DC::
    call label_2373
    ld   hl, $DB90
    ld   [hl], $14
    jr   label_126FE

label_126E6::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $03
    ld   e, $14
    ld   a, $4A
    jr   z, label_126F7
    ld   e, $05
    ld   a, $4D

label_126F7::
    ld   hl, $DB90
    ld   [hl], e
    call label_2385

label_126FE::
    jp   label_12D7A

label_12701::
    ld   b, h
    nop
    ld   b, d
    nop
    ld   b, h
    nop
    ld   b, [hl]
    nop
    ld   b, b
    nop
    ld   b, d
    nop
    ld   b, b
    nop
    ld   b, [hl]
    nop
    ld   b, d
    jr   nz, label_12758
    jr   nz, label_1275C
    jr   nz, label_1275C
    jr   nz, label_1275C
    jr   nz, label_1275C
    jr   nz, label_12764
    jr   nz, label_12760
    jr   nz, label_12743
    add  a, b
    jp   label_13E09
    and  a
    jr   nz, label_1272F
    ld   a, [$FFF1]
    add  a, $04
    ld   [$FFF1], a

label_1272F::
    ld   de, label_12701
    call label_3BC0
    jp   label_1244E

label_12738::
    call label_C05
    jr   nz, label_1274A
    ld   [hl], $18
    ld   hl, $C380
    add  hl, bc

label_12743::
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    call label_3B12

label_1274A::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_1275F
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1275F

label_12758::
    and  $80
    jr   z, label_1275E

label_1275C::
    inc  [hl]
    inc  [hl]

label_1275E::
    dec  [hl]

label_1275F::
    ret

label_12760::
    ld   [$CDF8], sp
    dec  b

label_12764::
    inc  c
    jr   nz, label_1276D
    ld   [hl], $50
    call label_3B12
    ld   [hl], b

label_1276D::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_1279A
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push hl
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_12760
    add  hl, de
    sub  a, [hl]
    pop  hl
    and  a
    jr   z, label_1279A
    and  $80
    jr   z, label_12799
    inc  [hl]
    inc  [hl]

label_12799::
    dec  [hl]

label_1279A::
    ret

label_1279B::
    ld   a, [$D002]
    and  a
    jr   nz, label_127FA
    ld   a, [$D003]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_127FA
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_127FA
    ld   a, [$D000]
    ld   hl, $FFEE
    sub  a, [hl]
    rlca
    rlca
    and  $01
    ld   hl, $C380
    add  hl, bc
    cp   [hl]
    jr   nz, label_127FA
    ld   a, [$D000]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $18
    cp   $30
    jr   nc, label_127FA
    ld   a, [$D001]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_127FA
    call label_3B12
    ld   [hl], $02
    ld   hl, $D002

label_127EA::
    inc  [hl]
    ld   hl, $D004
    inc  [hl]
    call label_C05
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a

label_127FA::
    ret

label_127FB::
    call label_C83
    ld   a, [$FF98]

label_12800::
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FF99]
    sub  a, $08
    and  $F0
    or   e
    ld   [$D416], a
    xor  a

label_12810::
    ld   [$C167], a
    ret

label_12814::
    ld   c, h
    rlca
    ld   c, h
    daa
    ld   c, [hl]
    inc  b
    ld   c, [hl]
    inc  h

label_1281C::
    ld   a, h
    rlca
    ld   a, h
    daa
    ld   a, [hl]
    inc  b
    ld   a, [hl]
    inc  h
    ld   hl, $D45E
    inc  [hl]
    ld   de, label_12814
    ld   a, [$FFF7]
    cp   $01
    jr   nz, label_12834
    ld   de, label_1281C

label_12834::
    call label_3BC0
    call label_13FA3
    call label_3B70
    ld   a, [$FFF0]
    rst  0
    ld   c, b
    ld   l, b
    db   $FD ; Undefined instruction
    ld   l, b

label_12844::
    nop
    inc  bc
    ld   bc, $CD02
    ei
    dec  bc
    jr   nz, label_12852
    ld   [hl], $10
    jp   label_3B12

label_12852::
    ld   a, [$C11C]
    cp   $00
    jp   nz, label_128E4
    ld   a, [$FF9A]
    push af
    ld   a, [$FF9B]
    push af
    ld   e, $00
    ld   a, [$FFEB]
    cp   $52
    ld   a, $14
    jr   nz, label_1286D
    inc  e
    ld   a, $08

label_1286D::
    push de
    call label_3BB5
    pop  de
    ld   a, [$FFD7]
    bit  0, e
    jr   z, label_1287A
    cpl
    inc  a

label_1287A::
    ld   [$FF9B], a
    ld   a, [$FFD8]
    bit  0, e
    jr   z, label_12884
    cpl
    inc  a

label_12884::
    ld   [$FF9A], a
    push bc
    call label_21A8
    call label_3E19
    pop  bc
    pop  af
    ld   [$FF9B], a
    pop  af
    ld   [$FF9A], a
    xor  a
    ld   [$C144], a
    ld   a, [$FFEB]
    cp   $52
    jp   nz, label_128E4
    ld   a, [$C146]
    and  a
    jr   nz, label_128D4
    call label_12E35
    add  a, $04
    cp   $08
    jr   nc, label_128D4
    call label_12E45
    add  a, $04
    cp   $08
    jr   nc, label_128D4
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, [$FFEC]
    ld   [$FF99], a
    ld   a, $06
    ld   [$C11C], a
    call label_CAF
    ld   [$C198], a
    ld   a, $FF
    ld   [$DBCB], a
    ld   a, $0C
    ld   [$FFF3], a
    ret

label_128D4::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_12844
    add  hl, de
    ld   a, [hl]
    ld   [$FF9E], a

label_128E4::
    call label_1290D
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_128FC
    ld   a, $1F
    ld   [$FFF4], a

label_128FC::
    ret
    call label_BFB
    jr   nz, label_12908
    ld   [hl], $40
    call label_3B12
    ld   [hl], b

label_12908::
    ld   a, $00
    jp   label_3B0C

label_1290D::
    ld   e, $0F
    ld   d, b

label_12910::
    push de
    ld   a, e
    cp   c
    jp   z, label_129A5
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jp   z, label_129A5
    call label_3D8A
    push bc
    ld   c, e
    ld   b, d
    ld   a, [$FFE7]
    xor  c
    and  $01
    jr   nz, label_129A4
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, [$FFEF]
    ld   [$FF99], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    push af
    ld   a, $10
    call label_3BB5
    ld   e, $00
    ld   a, [$FFEB]
    cp   $52
    jr   nz, label_12954
    inc  e

label_12954::
    ld   a, [$FFD7]
    bit  0, e
    jr   nz, label_1295C
    cpl
    inc  a

label_1295C::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    bit  0, e
    jr   nz, label_12969
    cpl
    inc  a

label_12969::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_3D8A
    call label_12DCA
    call label_3B23
    ld   a, [$FFEE]
    ld   hl, $FF98
    sub  a, [hl]
    add  a, $02
    cp   $04
    jr   nc, label_12992
    ld   a, [$FFEC]
    ld   hl, $FF99
    sub  a, [hl]
    add  a, $02
    cp   $04
    jr   nc, label_12992
    call label_12D7A

label_12992::
    pop  af
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    pop  af
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a

label_129A4::
    pop  bc

label_129A5::
    pop  de
    dec  e
    ld   a, e
    cp   $FF
    jp   nz, label_12910
    ret
    ld   a, [$FFF7]
    cp   $14
    jr   c, label_129C9
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_12D7A
    ld   hl, $C460
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], $3C
    jr   label_129D5

label_129C9::
    ld   e, a
    ld   d, b
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    and  $01
    jp   nz, label_12D7A

label_129D5::
    call label_12AC7
    call label_3D8A
    call label_13FA3
    call label_12D80
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $00
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    di
    ld   l, c
    dec  a
    ld   l, d
    ld   l, d
    ld   l, d
    call label_C05
    jr   nz, label_12A25
    ld   a, [$FFE7]
    xor  c
    and  $07
    jr   nz, label_12A04
    ld   a, $04
    call label_3BAA

label_12A04::
    call label_12DCA
    call label_3B23
    call label_12E35
    add  a, $30
    cp   $60
    jr   nc, label_12A25
    call label_12E45
    add  a, $30
    cp   $60
    jr   nc, label_12A25
    call label_C05
    ld   [hl], $28
    jp   label_3B12

label_12A24::
    ret

label_12A25::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_12A24

label_12A2B::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_12A39::
    inc  b
    inc  c
    nop
    ld   [label_5CD], sp
    inc  c
    jr   nz, label_12A67
    call label_12E55
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   d, b
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    ld   hl, label_12A39
    add  hl, de
    cp   [hl]
    jr   nz, label_12A67
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $38
    ld   hl, $C440
    add  hl, bc
    ld   [hl], b
    call label_3B12

label_12A67::
    jp   label_12A2B
    call label_12E1D
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_12A7E
    ld   hl, $C440
    add  hl, bc
    inc  [hl]

label_12A7E::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12A8A
    and  $80
    jr   z, label_12AA6

label_12A8A::
    ld   [hl], b
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $10
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_12A39
    add  hl, de
    ld   a, [hl]
    add  a, $08
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], a

label_12AA6::
    ret

label_12AA7::
    ld   [hl], b
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], h
    ld   [bc], a
    db   $76 ; Halt
    ld   [bc], a
    ld   a, b
    ld   [bc], a
    ld   a, b
    ldi  [hl], a

label_12AB3::
    ld   a, [bc]
    ld   b, $03
    ld   bc, $0100
    inc  bc
    ld   b, $0A
    ld   c, $11
    inc  de
    inc  d
    inc  de
    ld   de, label_A0E
    ld   b, $03
    ld   bc, $A711
    ld   l, d
    call label_3BC0
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12B31
    xor  a
    ld   [$FFD7], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2D0
    add  hl, bc
    bit  1, a
    jr   nz, label_12B0B
    cp   $01
    ld   a, [hl]
    jr   nz, label_12AF0
    ld   hl, $FFD7
    inc  [hl]
    cpl
    inc  a

label_12AF0::
    ld   hl, $FFEE
    add  a, [hl]
    ld   [hl], a
    ld   hl, $C440

label_12AF8::
    add  hl, bc
    ld   a, [$FFD7]
    and  a
    ld   a, [hl]
    jr   z, label_12B02
    cpl
    and  $0F

label_12B02::
    ld   hl, $FFEC
    add  a, [hl]
    add  a, $F3
    ld   [hl], a
    jr   label_12B51

label_12B0B::
    cp   $02
    ld   a, [hl]
    jr   nz, label_12B16
    ld   hl, $FFD7
    inc  [hl]
    cpl
    inc  a

label_12B16::
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   hl, $C440
    add  hl, bc
    ld   a, [$FFD7]
    and  a
    ld   a, [hl]
    jr   nz, label_12B28
    cpl
    and  $0F

label_12B28::
    ld   hl, $FFEE
    add  a, [hl]
    add  a, $F8
    ld   [hl], a
    jr   label_12B51

label_12B31::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_12AB3
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    add  a, $F0
    ld   [$FFEC], a
    ld   hl, label_12AB7
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    add  a, $F3
    ld   [$FFEE], a

label_12B51::
    ld   a, $02
    ld   [$FFF1], a
    ld   de, label_12AA7
    call label_3BC0
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_12B7C
    call label_C00
    jr   nz, label_12B7C
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $40
    call label_3B39
    call label_12BE1

label_12B7C::
    ld   a, [$FFEE]
    add  a, $04
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    sra  a
    sra  a
    ld   [$FFD7], a
    ld   [$FFD9], a
    ld   a, [$FFEC]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    sra  a
    sra  a
    ld   [$FFD8], a
    ld   [$FFDA], a
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    call label_3D8A
    ld   a, $03

label_12BAD::
    ld   [$FFDB], a
    ld   a, [$FFEC]
    ld   hl, $FFD8
    add  a, [hl]
    ld   [de], a
    inc  de
    ld   a, [$FFEE]
    ld   hl, $FFD7
    add  a, [hl]
    ld   [de], a
    inc  de
    ld   a, $24
    ld   [de], a
    inc  de
    ld   a, $00
    ld   [de], a
    inc  de
    ld   a, [$FFD7]
    ld   hl, $FFD9
    add  a, [hl]
    ld   [$FFD7], a
    ld   a, [$FFD8]
    ld   hl, $FFDA
    add  a, [hl]
    ld   [$FFD8], a
    ld   a, [$FFDB]
    dec  a
    jr   nz, label_12BAD
    ld   a, $03
    jp   label_3DA0

label_12BE1::
    ld   a, [$FFEE]
    ld   [$FFDB], a
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFEC]
    sub  a, $10
    add  a, $04
    ld   [$FFDC], a
    and  $F0
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    ld   a, h
    add  hl, de
    ld   h, a
    ld   a, [hl]
    ld   [$FFAF], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A26
    cp   $00
    ret  z
    cp   $01
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    call label_C00
    ld   [hl], $08
    ld   a, $07
    ld   [$FFF2], a

label_12C20::
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $05
    jp   label_CC7

label_12C2D::
    ld   [hl], b
    inc  bc
    ld   [hl], b
    inc  hl
    ld   a, b
    inc  bc
    ld   a, d
    inc  bc
    ld   [hl], h
    inc  bc
    db   $76 ; Halt
    inc  bc
    ld   a, h
    inc  bc
    ld   a, [hl]
    inc  bc
    ld   [hl], d
    inc  bc
    ld   [hl], d
    inc  hl
    ld   a, [hl]
    inc  hl
    ld   a, h
    inc  hl
    db   $76 ; Halt
    inc  hl
    ld   [hl], h
    inc  hl
    ld   a, d
    inc  hl
    ld   a, b
    inc  hl

label_12C4D::
    db   $10
    db   $0E
    inc  c
    ld   b, $00
    ld   a, [$F2F4]
    ld   a, [$FFF2]
    db   $F4 ; Undefined instruction
    ld   a, [label_600]
    inc  c
    ld   c, $10
    ld   c, $0C
    ld   b, $F0
    ld   a, [$FFA7]
    jp   nz, label_12D0F
    ld   de, label_12C2D
    call label_3BC0
    call label_13FA3
    call label_3B44
    call label_3B23
    call label_C05
    jr   z, label_12CB4
    cp   $10
    jr   nz, label_12CB3
    ld   a, $2B
    call label_3B86
    jr   c, label_12CB3
    ld   a, $08
    ld   [$FFF4], a
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD9]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a

label_12CB3::
    ret

label_12CB4::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $07
    jr   nz, label_12D0E
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $0F
    ld   [hl], a
    srl  a
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ld   a, $2A
    call label_3B86
    jr   c, label_12D0E
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], c
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C0
    push bc
    ld   a, [$FFD9]
    ld   c, a
    ld   hl, label_12C51
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_12C4D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    pop  bc

label_12D0E::
    ret

label_12D0F::
    call label_3B2E
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_12D7A
    ld   a, [$FFEE]
    ld   hl, $FF98
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_12D5C
    ld   a, [$FFEF]
    ld   hl, $FF99
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_12D5C
    call label_12D7A
    ld   a, [$DBC7]
    and  a
    jr   nz, label_12D5C
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, $C2E0
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_12D5C
    ld   [hl], $20
    ld   hl, $C420
    add  hl, de
    ld   [hl], $10
    push bc
    ld   c, e
    ld   b, d
    ld   a, $40
    call label_3BAA
    pop  bc
    ret

label_12D5C::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    cp   $9C
    jp   nc, label_12D7A
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    cp   $78
    ret  c

label_12D7A::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_12D80::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12DC9
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
    call label_12DCA
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_12DBC
    call label_3B23

label_12DBC::
    ld   hl, $C250
    add  hl, bc
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af

label_12DC9::
    ret

label_12DCA::
    call label_12DD7

label_12DCD::
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_12DD7
    pop  bc
    ret

label_12DD7::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12E02
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_12DEF::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_12DF9
    ld   e, $F0

label_12DF9::
    swap a
    and  $0F
    or   e
    rr   d

label_12E00::
    adc  a, [hl]
    ld   [hl], a

label_12E02::
    ret

label_12E03::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]

label_12E08::
    and  a
    jr   z, label_12E02
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_12DEF

label_12E1D::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    push af
    swap a
    and  $F0
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C2D0
    jp   label_12DEF

label_12E35::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_12E43
    inc  e

label_12E43::
    ld   d, a
    ret

label_12E45::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   nz, label_12E53
    inc  e

label_12E53::
    ld   d, a
    ret

label_12E55::
    call label_12E35
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_12E62
    cpl
    inc  a

label_12E62::
    push af
    call label_12E45
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_12E70
    cpl
    inc  a

label_12E70::
    pop  de
    cp   d
    jr   nc, label_12E78
    ld   a, [$FFD7]
    jr   label_12E7A

label_12E78::
    ld   a, [$FFD8]

label_12E7A::
    ld   e, a
    ret
    ld   a, [$DB73]
    push af
    ld   a, [$FFF8]
    and  $10
    jr   z, label_12E8A
    xor  a
    ld   [$DB73], a

label_12E8A::
    call label_12E92
    pop  af
    ld   [$DB73], a
    ret

label_12E92::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_134D9
    ld   a, c
    ld   [$D210], a
    ld   a, $02
    ld   [$C50A], a
    call label_C00
    dec  a
    jr   nz, label_12EAE
    ld   a, $19
    ld   [$FFF2], a

label_12EAE::
    ld   a, [$FFF1]
    inc  a
    jr   z, label_12ECA
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_12EC1
    call label_12E55
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_12EC1::
    call label_13C98
    ld   de, label_136CB
    call label_3BC0

label_12ECA::
    call label_133FE
    call label_3D8A
    call label_13BE3
    call label_133B7
    ld   a, [$FFF0]
    cp   $03
    jr   c, label_12EE9
    ld   a, [$DB73]
    and  a
    jr   z, label_12EE9
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a

label_12EE9::
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFF0]
    rst  0
    jr   c, label_12F69
    add  a, $6F
    jr   nz, label_12F6E
    ld   a, a
    ld   [hl], b
    inc  c
    ld   [hl], c
    ld   a, c
    ld   [hl], c
    or   b
    ld   [hl], c
    rst  $38
    ld   [hl], c
    ld   c, c

label_12F09::
    ld   [hl], d
    ld   a, h
    ld   [hl], d
    sub  a, [hl]
    ld   [hl], d
    rst  $28

label_12F0F::
    ld   [hl], d
    cpl
    ld   [hl], e
    jr   c, label_12F6C
    ld   a, b

label_12F15::
    ld   e, b
    ld   b, b
    ld   [hl], b
    ld   l, $2E
    ld   l, $3E
    ld   c, [hl]
    ld   c, [hl]
    nop
    nop
    nop

label_12F21::
    inc  b
    ld   bc, label_502
    ld   [bc], a
    ld   [bc], a
    nop
    inc  bc
    inc  b
    add  a, c
    add  a, c
    add  a, c
    add  a, d
    add  a, c
    add  a, c

label_12F30::
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_12F37

label_12F37::
    nop
    ld   e, $06
    ld   d, $00

label_12F3C::
    push de
    ld   a, $4F
    ld   e, $0E
    call label_3B98
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, label_12F09
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_12F0F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_12F1B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, label_12F21
    add  hl, de

label_12F6C::
    ld   a, [hl]
    ld   hl, $C340
    add  hl, de
    ld   [hl], a
    ld   hl, label_12F15
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    push bc
    ld   c, e
    ld   b, d
    call label_136B3
    pop  bc
    pop  de
    dec  e
    jr   nz, label_12F3C
    xor  a
    ld   [$D206], a
    ld   a, $10
    ld   [$D202], a
    ld   [$D203], a
    ld   a, $16
    ld   [$D205], a
    ld   a, $18
    ld   [$D204], a
    ld   a, $00
    ld   [$D200], a
    ld   a, $04
    ld   [$D201], a
    call label_3B12
    ld   a, [$DB0E]
    ld   hl, $C390
    add  hl, bc
    ld   [hl], a
    ld   hl, $DC78
    ld   de, label_12F30

label_12FB8::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_12FB8
    ld   a, $02
    ld   [$DDD1], a
    ret
    ld   a, [$C167]
    and  a
    ret  nz
    ld   a, [$DB73]
    and  a
    jr   z, label_12FE2
    ld   a, [$FF98]
    cp   $6C
    jr   c, label_12FE2
    ld   hl, $DAA0
    set  4, [hl]
    ld   a, $6B
    ld   [$FF98], a
    jr   label_12FE6

label_12FE2::
    call label_13C06
    ret  nc

label_12FE6::
    xor  a
    ld   [$C120], a
    ld   [$FF9A], a
    ld   e, $06
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_12FF7
    dec  e

label_12FF7::
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   e
    jr   c, label_13004
    ld   a, $40
    jp   label_2385

label_13004::
    ld   a, [$DB73]
    and  a
    jr   z, label_1300E
    ld   a, $F7
    jr   label_1301A

label_1300E::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   a, $3B
    jr   z, label_1301A
    ld   a, $3E

label_1301A::
    call label_2385
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    ld   a, [$C19F]
    and  a
    jr   nz, label_1305C
    ld   a, [$C173]
    cp   $F8
    jr   z, label_13038
    ld   a, [$C177]
    cp   $01
    jr   nc, label_1304B

label_13038::
    ld   a, [$DB5E]
    sub  a, $10
    ld   a, [$DB5D]
    sbc  a, $00
    jr   nc, label_1305D
    ld   a, $34
    call label_2385
    jr   label_13056

label_1304B::
    ld   a, [$DB73]
    and  a
    jr   z, label_13056
    ld   a, $F8
    jp   label_2385

label_13056::
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01

label_1305C::
    ret

label_1305D::
    ld   a, [$DB73]
    and  a
    jr   z, label_13066
    ld   [$DB74], a

label_13066::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    ld   [hl], $01
    and  a
    ld   a, $3C
    jr   z, label_13074
    ld   a, $3F

label_13074::
    call label_2385
    ld   a, $0A
    ld   [$DB92], a
    jp   label_3B12
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    ld   [$D200], a
    ld   a, $10
    ld   [$D203], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_130A2
    ld   a, [$FFE7]
    and  $08
    srl  a
    srl  a
    srl  a
    add  a, $03
    jr   label_130A6

label_130A2::
    ld   a, [$FFE7]
    and  $10

label_130A6::
    ld   [$D202], a
    ld   a, [$DB73]
    and  a
    jr   z, label_130F4
    call label_BFB
    jr   z, label_130B9
    dec  a
    ret  nz
    jp   label_13104

label_130B9::
    call label_13FA3
    push bc
    ld   a, [$C50F]
    ld   c, a
    ld   a, [$FFE7]
    and  $10
    ld   a, $04
    jr   z, label_130CA
    inc  a

label_130CA::
    call label_3B0C
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $F8
    call label_12DD7
    ld   hl, $C200
    add  hl, bc
    pop  bc
    ld   a, [hl]
    cp   $28
    ret  nz
    call label_BFB
    ld   [hl], $18
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $02
    ld   e, $01
    jp   label_1323B

label_130F4::
    ld   a, [$FFCB]
    and  $20
    jr   z, label_1310B
    ld   a, [$FF98]
    cp   $20
    jr   c, label_1310B
    cp   $30
    jr   nc, label_1310B

label_13104::
    call label_3B12

label_13107::
    ld   a, $20
    ld   [$FFF4], a

label_1310B::
    ret
    call label_13165
    ld   a, $10
    ld   [$D203], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_13127
    ld   a, [$FFE7]
    and  $08
    srl  a
    srl  a
    srl  a
    add  a, $03
    jr   label_1312B

label_13127::
    ld   a, [$FFE7]
    and  $10

label_1312B::
    ld   [$D202], a
    ld   a, [$DB73]
    and  a
    jr   z, label_1313B
    ld   e, $02
    call label_1323B
    jr   label_13141

label_1313B::
    ld   a, [$FFCB]
    and  $20
    jr   z, label_13152

label_13141::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_13164
    ld   a, [$D204]
    inc  a
    ld   [$D204], a
    cp   $88
    jr   c, label_13164

label_13152::
    call label_3B12
    ld   a, [$DB73]
    and  a
    jr   z, label_13160
    call label_BFB
    ld   [hl], $10

label_13160::
    ld   a, $21
    ld   [$FFF4], a

label_13164::
    ret

label_13165::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    ld   [$D200], a
    ld   a, $01
    ld   [$FFA1], a
    ld   a, $02
    ld   [$FF9E], a
    ret
    call label_13165
    ld   a, $10
    ld   [$D202], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_13194
    ld   a, [$FFE7]
    and  $08
    srl  a
    srl  a
    srl  a
    add  a, $03
    jr   label_13198

label_13194::
    ld   a, [$FFE7]
    and  $10

label_13198::
    ld   [$D203], a
    call label_BFB
    ret  nz
    ld   a, [$DB73]
    and  a
    jr   nz, label_131AA
    ld   a, [$FFCB]
    and  $10
    ret  z

label_131AA::
    call label_13107
    jp   label_3B12
    call label_13165
    ld   a, $10
    ld   [$D202], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_131CB
    ld   a, [$FFE7]
    and  $08
    srl  a
    srl  a
    srl  a
    add  a, $03
    jr   label_131CF

label_131CB::
    ld   a, [$FFE7]
    and  $10

label_131CF::
    ld   [$D203], a
    ld   a, [$DB73]
    and  a
    jr   z, label_131DA
    jr   label_131E0

label_131DA::
    ld   a, [$FFCB]
    and  $10
    jr   z, label_131EF

label_131E0::
    ld   a, [$FFE7]
    and  $03
    ret  nz
    ld   a, [$D205]
    inc  a
    ld   [$D205], a
    cp   $55
    ret  c

label_131EF::
    call label_3B12
    call label_13160
    call label_C05
    ld   [hl], $60
    ld   e, $00
    jp   label_1323B
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$D200], a
    ld   a, $10
    ld   [$D202], a
    ld   [$D203], a
    call label_C05
    cp   $30
    jr   nc, label_1321D
    ld   hl, $D201
    ld   [hl], $02

label_1321D::
    and  a
    jr   nz, label_13248
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_13248
    ld   a, [$D206]
    inc  a
    ld   [$D206], a
    cp   $0F
    jr   nz, label_13248
    call label_C05
    ld   [hl], $FF
    call label_3B12
    ld   e, $00

label_1323B::
    ld   a, [$DB73]
    and  a
    ret  z
    ld   a, e
    ld   [$FF9E], a
    push bc
    call label_BF0
    pop  bc

label_13248::
    ret
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$D200], a
    call label_C05
    cp   $C8
    jr   nz, label_1325F
    ld   hl, $D206
    ld   [hl], $10

label_1325F::
    cp   $A0
    jr   nz, label_13268
    ld   hl, $D201
    ld   [hl], $03

label_13268::
    cp   $50
    jr   nz, label_13274
    ld   hl, $D201
    ld   [hl], $04
    jp   label_13332

label_13274::
    and  a
    ret  nz
    call label_3B12
    jp   label_13107
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$D200], a
    ld   a, [$FFE7]
    and  $03
    ret  nz
    ld   a, [$D206]
    dec  a
    ld   [$D206], a
    ret  nz
    jp   label_3B12
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$D200], a
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, $16
    ld   [$FF99], a
    ld   a, $18
    ld   [$FF98], a
    ld   a, [$D204]
    ld   [$C201], a
    ld   a, [$D205]
    ld   [$C211], a
    push bc
    ld   c, $01
    ld   a, $04
    call label_3BAA
    call label_12DCA
    ld   a, [$C201]
    ld   [$D204], a
    ld   a, [$C211]
    ld   [$D205], a
    pop  bc
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    ld   a, [$D204]
    cp   $18
    ret  nz
    ld   a, [$D205]
    cp   $16
    ret  nz
    call label_C05
    ld   [hl], $C0
    call label_3B12
    jp   label_13160
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$D200], a
    call label_C05
    cp   $60
    jr   nz, label_13325
    ld   hl, $D201
    ld   [hl], $02
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_13324
    ld   [hl], $00
    dec  a
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $02
    ld   a, [$DB73]
    and  a
    jr   z, label_13324
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $07

label_13324::
    ret

label_13325::
    and  a
    ret  nz
    ld   hl, $D201
    ld   [hl], $04
    jp   label_3B12
    jp   label_13056

label_13332::
    ld   a, [$DB73]
    and  a
    jr   z, label_1335F
    ld   a, $FF
    call label_3B0C
    ld   a, $4F
    call label_3B86
    ld   a, [$D204]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$D205]
    add  a, $18
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $06
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]

label_1335F::
    ld   e, $0F
    ld   d, b

label_13362::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_133B0
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_133B0
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $4F
    jr   nz, label_133B0
    ld   hl, $C200
    add  hl, de
    ld   a, [$D204]
    sub  a, [hl]
    add  a, $04
    cp   $08
    jr   nc, label_133B0
    ld   hl, $C210
    add  hl, de
    ld   a, [$D205]
    add  a, $18
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   nc, label_133B0
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    ld   a, e
    inc  a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    call label_C00
    ld   [hl], $10
    ld   hl, $C440
    inc  [hl]
    ret

label_133B0::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_13362
    ret

label_133B7::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_133E1
    dec  a
    ld   e, a
    ld   d, b
    ld   a, [$D204]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$D205]
    add  a, $18
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, $10
    ld   hl, $D206
    sub  a, [hl]
    add  a, $FE
    ld   hl, $C310
    add  hl, de
    ld   [hl], a

label_133E1::
    ret

label_133E2::
    db   $76 ; Halt
    inc  bc
    ld   a, b
    inc  bc
    ld   a, b
    inc  hl
    db   $76 ; Halt
    inc  hl
    ld   [hl], b
    inc  bc
    ld   [hl], b
    inc  hl
    ld   [hl], d
    inc  bc
    ld   [hl], b
    inc  hl
    ld   [hl], d
    inc  bc
    ld   [hl], d
    inc  hl
    ld   a, [hl]
    nop
    ld   a, [hl]
    jr   nz, label_13421
    nop
    ld   h, $00

label_133FE::
    ld   a, [$D204]
    ld   [$FFEE], a
    ld   a, [$D205]
    ld   hl, $D206
    add  a, [hl]
    add  a, $08
    ld   [$FFEC], a
    ld   a, [$D201]
    ld   [$FFF1], a
    ld   de, label_133E2
    call label_3BC0
    ld   a, [$D204]
    ld   [$FFEE], a
    ld   a, [$D205]

label_13421::
    ld   [$FFEC], a
    ld   a, [$D200]
    ld   [$FFF1], a
    ld   de, label_133E2
    call label_3BC0
    ld   a, [$D206]
    cp   $08
    jr   c, label_1344B
    ld   a, [$D204]
    ld   [$FFEE], a
    ld   a, [$D205]
    add  a, $10
    ld   [$FFEC], a
    ld   a, $05
    ld   [$FFF1], a
    ld   de, label_133E2
    call label_3BC0

label_1344B::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_13477
    ld   a, [$D204]
    ld   [$FFEE], a
    ld   a, [$D205]
    add  a, $20
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    ld   de, label_133FA
    ld   a, [$C3C0]
    push af
    call label_3BC0
    pop  af
    ld   e, a
    ld   d, b
    ld   hl, $C031
    add  hl, de
    inc  [hl]
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    dec  [hl]

label_13477::
    ld   hl, $C020
    ld   a, $50
    ldi  [hl], a
    ld   a, $28
    ldi  [hl], a
    ld   a, $7A
    ldi  [hl], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_1348C
    ld   a, $03
    jr   label_1348F

label_1348C::
    ld   a, [$D202]

label_1348F::
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $28
    ldi  [hl], a
    ld   a, $3E
    ldi  [hl], a
    ld   a, [$D202]
    ldi  [hl], a
    ld   a, $50
    ldi  [hl], a
    ld   a, $30
    ldi  [hl], a
    ld   a, $7C
    ldi  [hl], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_134AF
    ld   a, $03
    jr   label_134B2

label_134AF::
    ld   a, [$D203]

label_134B2::
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $30
    ldi  [hl], a

label_134B9::
    ld   a, $3E
    ldi  [hl], a
    ld   a, [$D203]
    ldi  [hl], a
    ret

label_134C1::
    rst  $38
    rst  $38
    sbc  a, [hl]
    db   $10
    db   $A6
    inc  d
    adc  a, [hl]
    ld   d, $86
    dec  d
    xor  b
    inc  d

label_134CD::
    sbc  a, d
    rla
    sbc  a, h
    rla
    ld   l, h
    inc  bc
    ld   l, [hl]
    inc  bc
    ld   l, [hl]
    inc  hl
    ld   l, h
    inc  hl

label_134D9::
    ld   a, [$FFF1]
    cp   $06
    jr   c, label_134F1
    ld   de, label_134B9
    cp   $07
    jr   z, label_134EF
    ld   a, [$FFE7]
    and  $10
    jr   nz, label_134EF
    ld   de, label_134BD

label_134EF::
    jr   label_1350C

label_134F1::
    cp   $03
    jr   nz, label_134FE
    ld   a, [$DB4B]
    and  a
    jp   nz, label_12D7A
    jr   label_13511

label_134FE::
    cp   $00
    jr   nz, label_13511
    ld   a, [$DB0E]
    and  a
    jp   nz, label_12D7A
    ld   de, label_134CD

label_1350C::
    call label_3BC0
    jr   label_13517

label_13511::
    ld   de, label_134C1
    call label_3C77

label_13517::
    call label_13FA3
    ld   a, [$FFF0]
    rst  0
    add  hl, hl
    ld   [hl], l
    ld   e, h
    ld   [hl], l
    ld   h, [hl]
    ld   [hl], l
    cp   h
    ld   [hl], l
    add  a, c
    db   $76 ; Halt
    sbc  a, b
    db   $76 ; Halt
    call label_12DCA
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    rst  0
    inc  a
    ld   [hl], l
    ld   b, h
    ld   [hl], l
    ld   c, h
    ld   [hl], l
    ld   d, h
    ld   [hl], l
    ld   b, e
    ld   [hl], l
    ld   a, [$FFEE]
    cp   $3A
    jp  c, label_136AA
    ret
    ld   a, [$FFEC]
    cp   $4E
    jp   nc, label_136AA
    ret
    ld   a, [$FFEE]
    cp   $78
    jp   nc, label_136AA
    ret
    ld   a, [$FFEC]
    cp   $2E
    jp  c, label_136AA
    ret
    call label_12E55
    ld   a, e
    xor  $01
    ld   e, a
    jp   label_1323B
    ld   a, [$DB73]
    and  a
    jr   z, label_13570
    ld   a, $02
    ld   [$FFA1], a

label_13570::
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_13598
    xor  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sra  a
    cpl
    ld   [hl], a
    cp   $07
    jr   nc, label_13594
    ld   [hl], b
    jr   label_13598

label_13594::
    ld   a, $09
    ld   [$FFF2], a

label_13598::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_135A9
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $56
    jr   z, label_135AA
    inc  a
    ld   [hl], a

label_135A9::
    ret

label_135AA::
    add  a, $0A
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $0A
    jp   label_3B12

label_135B6::
    ld   b, h
    ld   b, e
    ld   b, d
    ld   b, c
    dec  a
    ld   a, [hli]
    ld   a, [$DB73]
    and  a
    jr   z, label_135C6
    ld   a, $02
    ld   [$FFA1], a

label_135C6::
    call label_12E03
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jp   z, label_13680
    xor  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sra  a
    cpl
    ld   [hl], a
    cp   $07
    jr   nc, label_135EA
    xor  a
    ld   [hl], a

label_135EA::
    ld   a, [$FFF1]
    cp   $06
    jr   c, label_135F8
    ld   a, $F9
    call label_2385
    jp   label_3B12

label_135F8::
    ld   a, [$FFEE]
    ld   hl, $FF98
    sub  a, [hl]
    add  a, $07
    cp   $0E
    ret  nc
    ld   a, [$FFEC]
    ld   hl, $FF99
    sub  a, [hl]
    add  a, $05
    cp   $0A
    ret  nc
    ld   a, [$D210]
    ld   e, a
    ld   d, b
    ld   hl, $C480
    add  hl, de
    ld   a, [hl]
    and  a
    ret  nz
    ld   [hl], $18
    ld   a, [$FFF1]
    cp   $00
    jr   nz, label_1362D
    ld   a, $01
    ld   [$DB0E], a
    call label_C0C
    jp   label_12D7A

label_1362D::
    call label_12D7A
    ld   hl, $FFF3
    ld   [hl], $01
    ld   a, [$FFF1]
    ld   e, a
    ld   d, b
    ld   hl, label_135B6
    add  hl, de
    ld   a, [hl]
    call label_2385
    ld   a, [$FFF1]
    dec  a
    jr   nz, label_13647
    ret

label_13647::
    dec  a
    jr   nz, label_13653
    ld   a, [$DB90]
    add  a, $1E
    ld   [$DB90], a
    ret

label_13653::
    dec  a
    jr   nz, label_13673
    ld   hl, $DB76
    ld   a, [$DB4C]
    cp   [hl]
    jr   nc, label_13666
    add  a, $10
    daa
    cp   [hl]
    jr   c, label_13666
    ld   a, [hl]

label_13666::
    ld   [$DB4C], a
    ld   d, $0C
    call label_3E6B
    ld   a, $0B
    ld   [$FFA5], a
    ret

label_13673::
    dec  a
    jr   nz, label_1367B
    ld   d, $04
    jp   label_3E6B

label_1367B::
    ld   a, $FF
    ld   [$DB93], a

label_13680::
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$C1AD]
    and  a
    ret  nz
    ld   [$DB74], a
    ld   a, $18
    ld   [$C1BC], a
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ret

label_136A0::
    db   $FC ; Undefined instruction
    nop
    inc  b
    nop
    nop

label_136A5::
    nop
    inc  b
    nop
    db   $FC ; Undefined instruction
    nop

label_136AA::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

label_136B3::
    ld   e, a
    ld   d, b
    ld   hl, label_136A0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_136A5
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ret
    ret

label_136CB::
    ld   h, b
    inc  bc
    ld   h, d
    inc  bc
    ld   h, d
    inc  hl
    ld   h, b
    inc  hl
    ld   h, h
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   h, [hl]
    inc  hl
    ld   h, h
    inc  hl
    ld   l, b
    inc  bc
    ld   l, d
    inc  bc
    ld   l, h
    inc  bc
    ld   l, [hl]
    inc  bc
    ld   l, d
    inc  hl
    ld   l, b
    inc  hl
    ld   l, [hl]
    inc  hl
    ld   l, h
    inc  hl
    ld   a, [$C50A]
    and  a
    jr   nz, label_136F9
    ld   a, $01
    ld   [$C50A], a
    call label_1388E

label_136F9::
    ld   a, [$DB4E]
    and  a
    jr   z, label_13705
    ld   a, [$FFE7]
    and  $5F
    jr   nz, label_1370E

label_13705::
    call label_12E55
    ld   a, e
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_1370E::
    call label_13C98
    ld   de, label_136CB
    call label_3BC0
    call label_13B70
    ld   a, [$FFF0]
    cp   $04
    jr   nc, label_13723
    call label_13BE3

label_13723::
    ld   a, [$FFF0]
    rst  0
    ld    hl, sp+$77
    xor  a
    ld   a, b
    ld   e, l
    ld   a, c
    db   $7A
    ld   a, d
    db   $ED ; Undefined instruction
    ld   a, d
    ld   b, b
    ld   a, e

label_13732::
    sbc  a, b
    ld   h, e
    ld   [bc], a
    or   d
    or   b
    or   b
    sbc  a, b
    and  h
    ld   bc, label_13F7F
    sbc  a, b
    ld   h, a
    ld   [bc], a
    or   c
    or   b
    ld   a, a
    sbc  a, b
    xor  b
    ld   bc, $B30A
    sbc  a, b
    ld   l, d
    ld   [bc], a
    ld   a, a
    or   d
    or   b
    sbc  a, b
    xor  h
    ld   bc, $B1BA
    sbc  a, b
    ld   l, [hl]
    ld   [bc], a
    or   c
    or   b
    ld   a, a
    sbc  a, b
    or   b
    ld   bc, label_90A
    sbc  a, b
    ld   h, e
    ld   [bc], a
    cp   c
    cp   b
    or   b
    sbc  a, b
    and  h
    ld   bc, label_13F7F
    sbc  a, b
    ld   h, e
    ld   [bc], a
    or   c
    or   b
    ld   a, a
    sbc  a, b
    and  h
    ld   bc, label_90A
    nop

label_13775::
    sbc  a, b
    ld   h, d
    ld   b, e
    ld   a, a
    sbc  a, b
    add  a, e
    ld   b, d
    ld   a, a
    sbc  a, b
    and  e
    ld   b, d
    ld   a, a
    nop
    nop
    nop
    nop
    sbc  a, b
    ld   h, [hl]
    ld   b, e
    ld   a, a
    sbc  a, b
    add  a, a
    ld   b, d
    ld   a, a
    sbc  a, b
    and  a
    ld   b, d
    ld   a, a
    nop
    nop
    nop
    nop
    sbc  a, b
    ld   l, d
    ld   b, e
    ld   a, a
    sbc  a, b
    adc  a, e
    ld   b, d
    ld   a, a
    sbc  a, b
    xor  e
    ld   b, d
    ld   a, a
    nop
    nop
    nop
    nop
    sbc  a, b
    ld   l, [hl]
    ld   b, e
    ld   a, a
    sbc  a, b
    adc  a, a
    ld   b, d
    ld   a, a
    sbc  a, b
    xor  a
    ld   b, d
    ld   a, a
    nop
    nop
    nop
    nop

label_137B5::
    ld   bc, label_302
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   [bc], a
    inc  bc
    inc  b
    ld   b, $02
    inc  bc
    inc  b
    rlca
    ld   [label_A09], sp

label_137C9::
    jr   nc, label_137FC
    ldd  [hl], a
    inc  sp
    inc  l
    dec  l
    add  hl, sp
    nop
    nop
    nop

label_137D3::
    nop
    ld   [bc], a
    nop
    nop
    nop
    add  hl, bc
    nop
    nop
    nop

label_137DC::
    nop
    nop
    db   $10
    db   $20
    db   $10
    db   $80
    stop
    nop

label_137E5::
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    nop
    nop

label_137EE::
    nop
    ret  z
    ld   a, [bc]
    inc  d
    ld   a, [bc]
    call nc, label_A
    nop
    nop
    ld   a, [$DB46]
    and  a

label_137FC::
    jr   z, label_13839
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $40
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $50
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $03
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_13838
    ld   a, [$FF99]
    sub  a, $01
    ld   [$FF99], a
    cp   $74
    jr   nz, label_13838
    ld   a, $38
    call label_2385
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $04
    ld   a, $19
    ld   [$D368], a

label_13838::
    ret

label_13839::
    ld   e, $00
    ld   d, b
    ld   a, [$DB66]
    and  $02
    jr   z, label_13845
    ld   e, $04

label_13845::
    push bc
    ld   hl, $DB00
    ld   c, $0B

label_1384B::
    ld   a, [$DB7D]
    cp   $0B
    jr   z, label_13857
    ld   a, [hli]
    cp   $0B
    jr   nz, label_13859

label_13857::
    ld   e, $08

label_13859::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_1384B
    ld   hl, $DB00
    ld   c, $0B

label_13864::
    ld   a, [$DB7D]
    cp   $05
    jr   z, label_13870
    ld   a, [hli]
    cp   $05
    jr   nz, label_13872

label_13870::
    ld   e, $0C

label_13872::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_13864
    ld   hl, label_137B5
    add  hl, de
    ld   de, $C505
    ld   c, $04

label_13881::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_13881
    pop  bc
    call label_3B12
    jp   label_1388E

label_1388E::
    ld   de, $D601
    push bc
    ld   hl, $C505
    ld   c, $04

label_13897::
    ld   a, [hli]
    and  a
    jr   z, label_138A0
    push hl
    call label_1398B
    pop  hl

label_138A0::
    dec  c
    jr   nz, label_13897
    pop  bc
    ret

label_138A5::
    nop
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    ld   a, [$C509]
    and  a
    jr   z, label_138D4
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  $01
    jr   z, label_138D4
    ld   a, [$C11C]
    cp   $00
    jr   nz, label_138D4
    ld   a, [$FF99]
    cp   $7B
    jr   c, label_138D4
    sub  a, $02
    ld   [$FF99], a
    ld   a, $2F
    jp   label_2385

label_138D4::
    ld   a, [$FF99]
    cp   $48
    jr   nc, label_13940
    ld   a, [$FF9E]
    cp   $02
    jr   nz, label_13940
    ld   a, [$FFCC]
    and  $30
    jr   z, label_13940
    ld   a, [$C509]
    and  a
    jr   z, label_13907
    ld   a, [$FF98]
    add  a, $00
    swap a
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_138A5
    add  hl, de
    ld   a, [$C50B]
    cp   [hl]
    jr   nz, label_13940
    ld   a, $13
    ld   [$FFF2], a
    jp   label_1396D

label_13907::
    ld   a, [$FF98]
    add  a, $00
    swap a
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_138A5
    add  hl, de
    ld   a, [hl]
    ld   [$C50B], a
    ld   e, a
    ld   d, b
    ld   hl, $C505
    add  hl, de
    ld   a, [hl]
    ld   [$C509], a
    ld   [hl], b
    and  a
    jr   z, label_1392B
    ld   a, $13
    ld   [$FFF2], a

label_1392B::
    push bc
    ld   a, e
    swap a
    ld   e, a
    ld   hl, label_13775
    add  hl, de
    ld   de, $D601
    ld   c, $0D

label_13939::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_13939
    pop  bc

label_13940::
    call label_13C06
    ret  nc
    ld   a, [$C509]
    and  a
    jr   z, label_13958
    dec  a
    ld   e, a
    ld   d, b
    ld   hl, label_137C9
    add  hl, de
    ld   a, [hl]
    call label_2385
    jp   label_3B12

label_13958::
    ld   a, $2E
    jp   label_2385
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C177]
    cp   $00
    jr   z, label_139AB
    cp   $02
    jr   z, label_13984

label_1396D::
    ld   a, [$C50B]
    ld   e, a
    ld   d, b
    ld   hl, $C505
    add  hl, de
    ld   a, [$C509]
    ld   [hl], a
    ld   de, $D601
    call label_1398B
    xor  a
    ld   [$C509], a

label_13984::
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01
    ret

label_1398B::
    push de
    dec  a
    ld   d, a
    sla  a
    ld   e, a
    sla  a
    sla  a
    add  a, e
    add  a, d
    ld   e, a
    ld   d, b
    ld   hl, label_13732
    add  hl, de
    pop  de
    push bc
    ld   c, $0B

label_139A1::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_139A1
    xor  a
    ld   [de], a
    pop  bc
    ret

label_139AB::
    ld   a, [$C509]
    ld   e, a
    cp   $02
    jr   nz, label_139BB
    ld   a, [$C5A9]
    and  a
    jr   nz, label_13A05
    jr   label_13A0C

label_139BB::
    cp   $04
    jr   nz, label_139D9
    ld   hl, $DB00
    ld   d, $0C

label_139C4::
    ld   a, [hli]
    cp   $02
    jr   z, label_139CE
    dec  d
    jr   nz, label_139C4
    jr   label_13A0C

label_139CE::
    ld   a, [$DB4D]
    ld   hl, $DB77
    cp   [hl]
    jr   nc, label_13A05
    jr   label_13A0C

label_139D9::
    cp   $06
    jr   nz, label_139F7
    ld   hl, $DB00
    ld   d, $0C

label_139E2::
    ld   a, [hli]
    cp   $05
    jr   z, label_139EC
    dec  d
    jr   nz, label_139E2
    jr   label_13A0C

label_139EC::
    ld   a, [$DB45]
    ld   hl, $DB78
    cp   [hl]
    jr   nc, label_13A05
    jr   label_13A0C

label_139F7::
    cp   $03
    jr   nz, label_13A0C
    ld   hl, $DB00
    ld   d, $0C

label_13A00::
    ld   a, [hli]
    cp   $04
    jr   nz, label_13A09

label_13A05::
    ld   a, $29
    jr   label_13A24

label_13A09::
    dec  d
    jr   nz, label_13A00

label_13A0C::
    ld   d, b
    ld   hl, label_137D3
    add  hl, de
    ld   a, [hl]
    ld   hl, label_137DC
    add  hl, de
    ld   e, [hl]
    ld   d, a
    ld   a, [$DB5E]
    sub  a, e
    ld   a, [$DB5D]
    sbc  a, d
    jr   nc, label_13A2E
    ld   a, $34

label_13A24::
    call label_2385
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $03
    ret

label_13A2E::
    ld   hl, $C509
    ld   a, [hl]
    push af
    ld   [hl], $00
    ld   e, a
    ld   d, b
    ld   hl, label_137EE
    add  hl, de
    ld   a, [$DB92]
    add  a, [hl]
    ld   [$DB92], a
    rl   a
    ld   hl, label_137E5
    add  hl, de
    rr   a
    ld   a, [$DB91]
    adc  a, [hl]
    ld   [$DB91], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01
    pop  af
    push af
    ld   a, $35
    call label_2385
    pop  af
    dec  a
    rst  0
    xor  c
    ld   a, d
    jp   nc, label_D87A
    ld   a, d
    xor  [hl]
    ld   a, d
    ld   [hl], e
    ld   a, d
    ld   a, [hl]
    ld   a, d
    adc  a, h
    ld   a, d
    sub  a, c
    ld   a, d
    sbc  a, a
    ld   a, d
    ld   d, $05
    call label_3E6B
    ld   a, $20
    ld   [$DB45], a
    ret
    ld   a, [$DB45]
    add  a, $0A
    daa
    jr   nc, label_13A88
    ld   a, $99

label_13A88::
    ld   [$DB45], a
    ret
    ld   d, $09
    jp   label_3E6B
    ld   a, [$DB47]
    add  a, $0A
    daa
    jr   nc, label_13A9B
    ld   a, $99

label_13A9B::
    ld   [$DB47], a
    ret
    ld   a, [$DB0D]
    add  a, $01
    daa
    ld   [$DB0D], a
    ret
    ld   d, $0B
    jp   label_3E6B
    ld   a, [$DB4D]
    add  a, $0A
    daa
    jr   nc, label_13AB8
    ld   a, $99

label_13AB8::
    ld   [$DB4D], a
    ld   d, $02
    jp   label_3E6B
    ld   a, [$DB45]
    add  a, $0A
    daa
    jr   nc, label_13ACA
    ld   a, $99

label_13ACA::
    ld   [$DB45], a
    ld   d, $0C
    jp   label_3E6B
    ld   a, $18
    ld   [$DB93], a
    ret
    ld   d, $04
    jp   label_3E6B
    ld   a, [$C19F]
    and  a
    ret  nz
    jp   label_1396D

label_13AE5::
    inc  sp
    ld   h, d
    ld   a, [de]
    ld   bc, label_FFF
    rst  $38
    ld   a, a
    ld   a, [$C19F]
    and  a
    jr   nz, label_13B3F
    ld   a, $CA
    call label_3B86
    ld   a, $26
    ld   [$FFF4], a
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $C0
    call label_C05
    ld   [hl], $C0
    call label_3B12
    xor  a
    ld   [$DB0D], a
    ld   a, $FF
    ld   [$DB94], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_13B3F
    ld   hl, $DC88
    ld   de, label_13AE5

label_13B32::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_13B32
    ld   a, $02
    ld   [$DDD1], a

label_13B3F::
    ret
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    ret  nz
    ld   a, [$DB5A]
    and  a
    ret  nz
    ld   [$DB46], a
    ld   [$C50A], a
    jp   label_12D7A
    dec  e
    dec  a

label_13B58::
    ld   e, l
    ld   a, l

label_13B5A::
    sub  a, [hl]
    rla
    xor  b
    inc  d
    add  a, [hl]
    rla
    add  a, b
    rla
    adc  a, b
    ld   d, $FF
    rst  $38
    sub  a, b
    db   $10
    db   $AE
    db   $10
    db   $A0
    db   $10
    db   $2A
    ld   b, c
    ld   a, [hli]
    ld   h, c

label_13B70::
    ld   a, $04

label_13B72::
    ld   [$FFE6], a
    ld   e, a
    ld   d, b
    ld   hl, $C504
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_13BAC
    dec  a
    ld   [$FFF1], a
    ld   hl, label_13B55
    ld   a, [$FFE6]
    ld   e, a
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   a, $32
    ld   [$FFEC], a
    ld   a, [$FFF1]
    cp   $01
    jr   nz, label_13B9A
    ld   hl, $FFEC
    ld   [hl], $2F

label_13B9A::
    cp   $05
    jr   nz, label_13BA6
    ld   de, label_13B58
    call label_3BC0
    jr   label_13BAC

label_13BA6::
    ld   de, label_13B5A
    call label_3C77

label_13BAC::
    ld   a, [$FFE6]
    dec  a
    jr   nz, label_13B72
    call label_13BB7
    jp   label_3D8A

label_13BB7::
    ld   a, [$C509]
    and  a
    ret  z
    dec  a
    ld   [$FFF1], a
    ld   a, $01
    ld   [$C15C], a
    call label_CAF
    ld   a, [$FF98]
    ld   [$FFEE], a
    ld   a, [$FF99]
    sub  a, $0E
    ld   [$FFEC], a
    ld   a, [$FFF1]
    cp   $05
    jr   nz, label_13BDD
    ld   de, label_13B58
    jp   label_3BC0

label_13BDD::
    ld   de, label_13B5A
    jp   label_3C77

label_13BE3::
    call label_3B5A
    jr   nc, label_13C05
    call label_CBE
    call label_CB6
    ld   a, [$C1A6]
    and  a
    jr   z, label_13C05
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_13C05
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_13C05::
    ret

label_13C06::
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $20
    cp   $30

label_13C10::
    jr   nc, label_13C49
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_13C49
    call label_12E55
    ld   a, [$FF9E]
    xor  $01
    cp   e
    jr   nz, label_13C49
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_13C49
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_13C49
    ld   a, [$FFCC]
    and  $10
    jr   z, label_13C49
    scf
    ret

label_13C49::
    and  a
    ret

label_13C4B::
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_13C92
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_13C92
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_13C92
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $28
    jr   nc, label_13C92
    call label_12E55
    ld   a, [$FF9E]
    xor  $01
    cp   e
    jr   nz, label_13C92
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$FFCC]
    and  $10
    jr   z, label_13C92
    scf
    ret

label_13C92::
    and  a
    ret

label_13C94::
    ld   b, $04
    ld   [bc], a
    nop

label_13C98::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_13C94
    add  hl, de
    push hl
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    pop  hl
    and  $01
    or   [hl]
    jp   label_3B0C
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
    ld   a, d
    jr   nz, label_13D6A
    jr   nz, label_13D6C
    nop
    ld   a, d
    nop
    ld   a, [hl]

label_13CF8::
    nop
    ld   a, [hl]
    jr   nz, label_13D6C
    nop
    ld   [hl], d
    nop
    ld   [hl], h
    nop
    db   $76 ; Halt
    nop
    ld   a, h
    nop
    ld   a, h
    jr   nz, label_13D72
    jr   nz, label_13D72
    jr   nz, label_13D74
    nop
    ld   l, d
    nop
    ld   l, [hl]
    nop
    ld   l, [hl]
    jr   nz, label_13D74
    nop
    ld   h, d
    nop
    ld   h, h
    nop
    ld   h, [hl]
    nop
    ld   l, h
    nop
    ld   l, h
    jr   nz, label_13D31
    rst  $28
    ld   a, h
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_13D2B
    ld   de, label_13D07

label_13D2B::
    call label_C00
    rla
    rla
    rla

label_13D31::
    and  $10
    ld   [$FFED], a
    call label_3BC0
    call label_13FA3
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   nz, label_13D51
    ld   a, [$FFF0]
    and  a
    jr   nz, label_13D51
    call label_3B12
    call label_BFB
    ld   [hl], $6F

label_13D51::
    call label_12D80
    call label_12DCA
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    ld   l, c
    ld   a, l
    and  e
    ld   a, l

label_13D61::
    ld   [$00F8], sp
    nop

label_13D65::
    nop
    nop
    ld    hl, sp+$00
    call label_3B39

label_13D6C::
    call label_C05
    jr   nz, label_13D91
    call label_280D

label_13D74::
    and  $1F
    add  a, $30
    ld   [hl], a
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_13D61
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_13D65
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_13D91::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_13D9C::
    dec  b
    dec  b
    inc  b
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   a, [$C14A]
    and  a
    jr   z, label_13DAE
    call label_3B12
    ld   [hl], b
    ret

label_13DAE::
    call label_3B70
    call label_12E35
    add  a, $12
    cp   $24
    jr   nc, label_13DC3
    call label_12E45
    add  a, $12
    cp   $24
    jr   c, label_13DD1

label_13DC3::
    ld   a, [$FFE7]
    xor  c
    and  $03
    jr   nz, label_13DCF
    ld   a, $0E
    call label_3BAA

label_13DCF::
    jr   label_13DD4

label_13DD1::
    call label_3D7F

label_13DD4::
    call label_BFB
    jp   z, label_13EBA
    cp   $18
    jr   nz, label_13DE5
    ld   [hl], $0A
    call label_C00
    ld   [hl], $30

label_13DE5::
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_13D9C
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_13DF5::
    ld   a, d
    ldi  [hl], a
    ld   a, b
    ldi  [hl], a
    ld   a, b
    ld   [bc], a
    ld   a, d
    ld   [bc], a

label_13DFD::
    ld   l, d
    ldi  [hl], a
    ld   l, b

label_13E00::
    ldi  [hl], a
    ld   l, b
    ld   [bc], a
    ld   l, d
    ld   [bc], a

label_13E05::
    ld   [$00F8], sp

label_13E08::
    nop

label_13E09::
    nop
    nop
    ld    hl, sp+$08
    ld   de, label_13DF5
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_13E19
    ld   de, label_13DFD

label_13E19::
    call label_3BC0
    call label_13FA3
    call label_12D80
    call label_C00
    jr   nz, label_13E2A
    call label_3B39

label_13E2A::
    call label_12DCA
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    add  hl, sp
    ld   a, [hl]
    ld   c, h
    ld   a, [hl]
    add  a, e
    ld   a, [hl]
    call label_C05
    jr   nz, label_13E41
    call label_3B12

label_13E41::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_280D
    and  $03
    jr   z, label_13E5A
    call label_280D
    and  $03
    jr   label_13E5D

label_13E5A::
    call label_12E55

label_13E5D::
    ld   e, a
    ld   d, b
    ld   hl, label_13E05
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_13E09
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_C05
    call label_280D
    and  $0F
    add  a, $20
    ld   [hl], a
    call label_3B12
    ld   [hl], b
    ret
    call label_3B7B
    call label_C05
    jr   z, label_13EBA
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   nz, label_13E9B
    ld   a, [hl]
    and  $0C
    jr   nz, label_13EA5
    jr   label_13EB1

label_13E9B::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    jr   label_13EAD

label_13EA5::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_13EAD::
    ld   a, $09
    ld   [$FFF2], a

label_13EB1::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    jp   label_3B0C

label_13EBA::
    call label_13EC0
    jp   label_12D7A

label_13EC0::
    ld   a, $02
    call label_3B86
    jr   c, label_13EE4
    call label_C4B
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $17
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01

label_13EE4::
    ret

label_13EE5::
    ld   d, [hl]
    ld   [bc], a
    ld   d, [hl]
    ldi  [hl], a
    ld   d, h
    ld   [bc], a
    ld   d, h
    ldi  [hl], a
    ld   d, d
    ld   [bc], a
    ld   d, d
    ldi  [hl], a
    ld   d, b
    ld   [bc], a
    ld   d, b
    ldi  [hl], a
    ld   de, label_13EE5
    call label_3BC0
    call label_13FA3
    call label_12D80
    call label_12DCA
    call label_3B23
    ld   a, [$FFF0]
    and  $03
    rst  0
    inc  d
    ld   a, a
    daa
    ld   a, a
    ld   c, c
    ld   a, a
    ld   [hl], l
    ld   a, a
    ld   a, $FF
    call label_3B0C
    call label_C05
    ret  nz
    ld   [hl], $1F
    call label_3B12
    jp   label_3D7F

label_13F25::
    ld   bc, $CD00
    dec  b
    inc  c
    jr   nz, label_13F37
    call label_280D
    and  $3F
    add  a, $70
    ld   [hl], a
    jp   label_3B12

label_13F37::
    ld   hl, label_13F25

label_13F3A::
    srl  a
    srl  a
    srl  a
    srl  a
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    call label_3B39
    call label_C05
    jr   nz, label_13F59
    ld   [hl], $1F
    call label_3B12
    jp   label_3D7F

label_13F59::
    ld   a, [$FFE7]
    xor  c
    push af
    and  $0F
    jr   nz, label_13F66
    ld   a, $08
    call label_3BAA

label_13F66::
    pop  af
    srl  a
    srl  a
    and  $01
    call label_3B0C
    inc  [hl]
    inc  [hl]
    ret

label_13F73::
    nop
    ld   bc, label_5CD
    inc  c
    jr   nz, label_13F8A
    call label_280D
    and  $1F

label_13F7F::
    add  a, $30
    ld   [hl], a
    call label_3B12
    ld   a, $08
    jp   label_3BAA

label_13F8A::
    ld   hl, label_13F73
    jp   label_13F3A

label_13F90::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    rl   a
    ld   a, $00
    jr   c, label_13F9D
    ld   a, $20

label_13F9D::
    ld   hl, $FFED
    xor  [hl]
    ld   [hl], a
    ret

label_13FA3::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_13FCE

label_13FA9::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_13FCE
    cp   $0B
    jr   nz, label_13FCE
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_13FCE
    ld   hl, $C1A8
    ld   a, [$C19F]
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_13FCE
    ld   a, [$C124]
    and  a
    jr   z, label_13FCF

label_13FCE::
    pop  af

label_13FCF::
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
