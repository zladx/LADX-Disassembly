section "bank25",romx,bank[$19]

label_64000::
    ld   a, [$FF00]
    ld   c, b
    ld   b, $F0
    ld   [label_2648], sp
    nop
    nop
    ld   c, d
    ld   b, $00
    ld   [label_264A], sp

label_64010::
    ld   a, [$FF00]
    ld   a, b
    ld   b, $F0
    ld   [label_2678], sp
    nop
    nop
    ld   a, d
    ld   b, $00
    ld   [label_267A], sp

label_64020::
    ld   d, $01
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a

label_64028::
    jr   z, label_6404A
    ld   de, label_64020
    call label_3C77
    call label_67D3D
    call label_67DB8
    call label_67DF1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jp   nz, label_67E61
    ret

label_6404A::
    ld   hl, label_64000
    ld   a, [$FFF7]
    cp   $01
    jr   nz, label_64056
    ld   hl, label_64010

label_64056::
    ld   c, $04
    call label_3CE6
    call label_3CD9
    call label_67D3D
    call label_C56
    call label_3B70
    ld   a, [$FFF0]
    rst  0
    ld   [hl], b
    ld   b, b
    inc  hl
    ld   b, c
    inc  hl
    ld   b, c
    call label_3B23
    call label_67CA2
    call label_67E0B
    add  a, $10
    cp   $20
    jp   nc, label_6411C
    call label_67E1B
    add  a, $20
    cp   $30
    jp   nc, label_6411C
    ld   a, [$C19B]
    and  a
    jp   nz, label_6411C
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_640A0
    ld   a, [$FFCB]
    and  $20
    jr   nz, label_640AD
    jr   label_6411C

label_640A0::
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_6411C
    ld   a, [$FFCB]
    and  $10
    jr   z, label_6411C

label_640AD::
    ld   a, [$C3CF]
    and  a
    jr   nz, label_6411C
    ld   a, $01
    ld   [$FFA1], a
    ld   [$C3CF], a
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, label_1F51
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ld   hl, label_1F55
    add  hl, de
    ld   a, [$FFCB]
    and  [hl]
    jr   z, label_6411C
    ld   hl, label_1F59
    add  hl, de
    ld   a, [hl]
    ld   [$C13C], a
    ld   hl, label_1F5D
    add  hl, de
    ld   a, [hl]
    ld   [$C13B], a
    ld   hl, $FF9D
    inc  [hl]
    ld   a, [$DB43]
    cp   $02
    jr   nz, label_6411C
    ld   e, $08
    ld   a, [$D47C]
    and  a
    jr   z, label_640F4
    ld   e, $03

label_640F4::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   e
    jr   c, label_64122
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

label_6411C::
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    ret

label_64122::
    ret
    call label_67DB8
    call label_67DF1
    call label_3B23
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   nz, label_64143
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z

label_64143::
    call label_64183
    ld   a, [$C18E]
    and  $1F
    cp   $0B
    ret  nz
    ld   a, [$C50D]
    cp   $35
    jr   c, label_64159
    cp   $3D
    jr   c, label_64162

label_64159::
    ld   a, [$C503]
    cp   $35
    ret  c
    cp   $3D
    ret  nc

label_64162::
    jp   label_C60

label_64165::
    nop
    ld   [label_800], sp
    nop
    ld   [$F8F8], sp
    nop
    nop
    ld   [$FC08], sp
    dec  b
    ld   a, [$FB06]
    inc  b

label_64177::
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    rst  $38
    inc  bc
    ld   [bc], a

label_6417D::
    jr   label_64193
    inc  de
    ld   d, $12
    inc  d

label_64183::
    ld   a, $00

label_64185::
    ld   [$FFE8], a
    ld   a, $9D
    call label_3B86
    jr   c, label_641E2
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]

label_64193::
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C1
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_64165
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_6416B
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, label_64171
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_64177
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, label_6417D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C320
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   a, [$FFE8]
    inc  a
    cp   $06
    jr   nz, label_64185

label_641E2::
    ld   a, $29
    ld   [$FFF4], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    jp   label_67E61

label_64201::
    rla
    ld   de, label_2836
    ld   b, l
    ld   d, d
    ld   a, d
    ld   h, h
    sub  a, e
    and  c
    push bc
    call nc, label_E28
    ccf
    ld   e, l
    ld   a, [$DBA5]
    and  a
    jr   nz, label_64279
    ld   a, [$FFF6]
    cp   $CF
    jr   z, label_64226
    cp   $DE
    jr   z, label_64226
    cp   $CE
    jp   nz, label_64406

label_64226::
    call label_67D3D
    ld   a, [$C146]
    and  a
    ret  nz
    ld   a, [$FF98]
    sub  a, $50
    add  a, $03
    cp   $06
    ret  nc
    ld   a, [$FF99]
    sub  a, $46
    add  a, $04
    cp   $08
    ret  nc
    ld   a, $01
    ld   [$D401], a
    ld   a, $1F
    ld   [$D402], a
    ld   a, $F8
    ld   [$D403], a
    ld   a, $50
    ld   [$D404], a
    ld   [$FF98], a
    ld   a, $48
    ld   [$D405], a
    ld   [$FF99], a
    ld   a, $45
    ld   [$D416], a
    ld   a, $06
    ld   [$C11C], a
    call label_CAF
    ld   [$C198], a
    ld   a, $51
    ld   [$DBCB], a
    ld   a, $0C
    ld   [$FFF3], a
    jp   label_67E61

label_64279::
    ld   a, $01
    ld   [$C19D], a
    ld   a, [$FFF7]
    ld   e, a
    ld   d, b
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    and  $01
    jp   z, label_642E0
    call label_643A9
    ld   a, [$FFF0]
    rst  0
    sbc  a, d
    ld   b, d
    and  e
    ld   b, d
    cp   b
    ld   b, d
    push af
    ld   b, d
    call label_3B12
    ld   a, $1B
    ld   [$D368], a
    ret
    call label_67E0B
    add  a, $04
    cp   $08
    jp   nc, label_3B12
    call label_67E1B
    add  a, $04
    cp   $08
    ret  c
    jp   label_3B12
    ld   a, [$FFA2]
    and  a
    jr   nz, label_642E0
    call label_67E0B
    add  a, $03
    cp   $06
    jr   nc, label_642E0
    call label_67E1B
    add  a, $03
    cp   $06
    jr   nc, label_642E0
    call label_3B12
    ld   a, $20
    ld   [$C1C6], a
    call label_C05
    ld   [hl], $50
    ld   a, $1C
    ld   [$FFF2], a

label_642E0::
    ret

label_642E1::
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    sub  a, h
    sub  a, h
    sub  a, h
    sub  a, h
    ld   d, h
    ld   d, h
    ld   d, h
    ld   d, h
    nop
    nop
    nop
    nop

label_642F1::
    nop
    inc  bc
    ld   bc, $CD02
    xor  a
    inc  c
    ld   [$DB94], a
    ld   [$DBC7], a
    ld   [$C13E], a
    ld   [$C137], a
    ld   [$C16A], a
    ld   [$C166], a
    ld   [$C1A9], a
    inc  a
    ld   [$C167], a
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, [$FFEC]
    ld   [$FF99], a
    call label_C05
    jr   nz, label_64355
    ld   hl, $D401
    ld   a, $01
    ldi  [hl], a
    ld   a, [$FFF7]
    ldi  [hl], a
    inc  hl
    ld   a, $50
    ldi  [hl], a
    push hl
    ld   a, [$FFF7]
    ld   e, a
    sla  e
    ld   d, $00
    ld   hl, label_64201
    add  hl, de
    ld   a, [$FFF6]
    cp   [hl]
    jr   nz, label_6433D
    inc  hl

label_6433D::
    ld   a, [hl]
    ld   [$D403], a
    pop  hl
    cp   $64
    ld   a, $48
    jr   nz, label_6434A
    ld   a, $28

label_6434A::
    ld   [hl], a
    xor  a
    ld   [$C167], a
    call label_67E61
    jp   label_C9E

label_64355::
    ld   hl, $FFA1
    ld   [hl], $01
    push af
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_642F1
    add  hl, de
    ld   a, [hl]
    ld   [$FF9E], a
    push bc
    call label_BF0
    pop  bc
    ld   hl, $C440
    add  hl, bc
    pop  af
    cp   $40
    jr   nc, label_64383
    and  $03
    jr   nz, label_64383
    ld   a, [hl]
    cp   $0C
    jr   z, label_64383
    inc  [hl]

label_64383::
    ld   a, [$FFE7]
    and  $03
    add  a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_642E1
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ret

label_64393::
    ld   e, $02
    ld   e, $62
    ld   e, $42
    ld   e, $22

label_6439B::
    ld    hl, sp+$FA

label_6439D::
    nop
    ld   b, $08
    ld   b, $00
    ld   a, [$FAF8]

label_643A5::
    inc  h
    ld   bc, $0124

label_643A9::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C2
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$FFF1], a
    ld   de, label_64393
    call label_3BC0
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C1
    xor  a

label_643C5::
    ld   [$FFE8], a
    ld   e, a
    call label_643D4
    ld   a, [$FFE8]
    add  a, $02
    and  $07
    jr   nz, label_643C5
    ret

label_643D4::
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    add  a, e
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_6439D
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_6439B
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   de, label_643A5
    call label_3C77
    jp   label_3D8A

label_643FA::
    ld   a, [$00FC]
    inc  b
    ld   b, $04
    nop
    db   $FC ; Undefined instruction
    ld   a, [label_3EFC]
    nop

label_64406::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C1
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [$FFED], a
    ld   a, [$FFEE]
    ld   [$FFE5], a
    ld   a, [$FFEC]
    ld   [$FFE6], a
    xor  a

label_6441D::
    ld   [$FFE8], a
    ld   e, a
    call label_6442C
    ld   a, [$FFE8]
    add  a, $02
    and  $07
    jr   nz, label_6441D
    ret

label_6442C::
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    add  a, e
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_643FC
    add  hl, de
    ld   a, [$FFE5]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_643FA
    add  hl, de
    ld   a, [$FFE6]
    add  a, [hl]
    add  a, $04
    ld   [$FFEC], a
    ld   de, label_64404
    jp   label_3C77

label_64451::
    jr   c, label_64467
    jr   c, label_64489
    and  h
    inc  d
    rst  $38
    rst  $38
    jr   c, label_644AF
    jr   c, label_644D1
    rst  $38
    rst  $38
    and  h
    inc  [hl]
    ld   a, $01
    ld   [$C14D], a
    ld   de, label_64451
    call label_3BC0
    call label_67D3D
    call label_29F8
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_64481
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

label_64481::
    ld   a, $08
    ld   [$C19E], a
    call label_3B7B

label_64489::
    call label_67DB8
    call label_3B2E
    call label_644CC
    ld   a, [$FFF0]
    rst  0
    sbc  a, c
    ld   b, h
    cp   d
    ld   b, h
    call label_C05
    jr   nz, label_644A6
    ld   a, $08
    call label_3BAA
    jp   label_3B12

label_644A6::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_644B9
    call label_C05
    ld   [hl], b
    call label_645A3
    ld   a, $07
    ld   [$FFF2], a

label_644B9::
    ret
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_644C5
    ld   a, $20
    call label_3BAA

label_644C5::
    call label_3B44
    ret  nc
    jp   label_67E61

label_644CC::
    ld   a, [$DBA5]
    and  a
    ret  nz

label_644D1::
    ld   a, [$FFAF]
    cp   $D3
    jr   z, label_644DA
    cp   $5C
    ret  nz

label_644DA::
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFE9]
    ld   e, a
    ld   d, b
    call label_2178
    ld   a, [$FFCE]
    add  a, $08
    ld   [$FFD7], a
    ld   a, [$FFCD]
    add  a, $10
    ld   [$FFD8], a
    ld   a, $08
    call label_CC7
    ld   a, $13
    ld   [$FFF4], a
    ret

label_644FC::
    nop
    nop
    ld   [$0020], sp
    ld   [label_2006], sp
    nop
    nop
    ld   b, $00
    nop
    ld   [$0008], sp
    nop
    inc  b
    inc  b
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    inc  b
    inc  b
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_6451C::
    nop
    nop
    db   $FC ; Undefined instruction
    inc  b

label_64520::
    ld   bc, $0001
    nop
    ld   hl, $C14D
    inc  [hl]
    ld   a, [$FFF0]
    and  a
    jr   nz, label_64562
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, label_6451C
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_64520
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    sla  [hl]
    ld   hl, $C250
    add  hl, bc
    sla  [hl]
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    ld   a, $3B
    ld   [$FFF2], a
    jp   label_3B12

label_64562::
    call label_645B2
    call label_67D3D
    ld   a, $01
    ld   [$C19E], a
    call label_3B7B
    call label_67DB8
    call label_3B2E
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_645A0
    ld   a, [$FFE7]
    inc  a
    and  $03
    jr   nz, label_6459F
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $0D
    call label_CC7
    ld   hl, $C520
    add  hl, de
    ld   [hl], $08
    ld   a, [$FFF1]
    ld   hl, $C590
    add  hl, de
    ld   [hl], a

label_6459F::
    ret

label_645A0::
    call label_67E61

label_645A3::
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $03
    ld   [$FFD8], a
    ld   a, $05
    jp   label_CC7

label_645B2::
    ld   a, [$FFF1]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, b
    ld   hl, label_644FC
    add  hl, de
    ld   c, $02
    jp   label_3CE6

label_645C4::
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

label_645E4::
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]
    set  7, [hl]
    ld   a, [$DB0E]
    cp   $0E
    jp   nz, label_67E61
    ld   a, [$DB7F]
    and  a
    jp   nz, label_67E61
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $50
    ld   de, label_645C4
    call label_3BC0
    call label_67CD4
    ld   a, [$FFE7]
    and  $3F
    jr   nz, label_64618
    call label_67E3A
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_64618::
    call label_67CA2
    ld   a, [$FFF0]
    rst  0
    ld   h, $46
    sub  a, b
    ld   b, [hl]
    ld   b, a
    ld   b, a
    rst  $20
    ld   b, [hl]
    call label_67D3D
    ld   e, b
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $26
    cp   $4C
    call label_67CFB
    ret  nc
    ld   a, [$DB7D]
    cp   $00
    jr   z, label_64643
    cp   $0D
    jr   nz, label_64663

label_64643::
    ld   a, $21
    call label_237C
    jp   label_3B12
    di
    ld   d, c
    ld   h, a
    jr   z, label_64643
    ld   d, c
    ld   h, a
    jr   z, label_6462D
    ld   de, label_10CE
    rla
    inc  d
    ld   [$D910], sp
    ld   de, label_10CE
    di
    ld   d, c
    ld   h, a
    jr   z, label_646A2
    dec  h
    call label_237C
    ld   a, [$DB7D]
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_64633
    add  hl, de
    ld   e, l
    ld   d, h
    ld   hl, $DC8A

label_6467B::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $0F
    cp   $0E
    jr   nz, label_6467B
    ld   a, $02
    ld   [$DDD1], a
    call label_3B12
    ld   [hl], $03
    ret
    call label_67D3D
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_646DB
    ld   a, [$DB00]
    and  a
    jr   z, label_646DB

label_646A2::
    cp   $01
    jr   z, label_646E1
    cp   $04
    jr   z, label_646E1
    cp   $03
    jr   z, label_646E1
    cp   $02
    jr   z, label_646E1
    cp   $09
    jr   z, label_646E1
    cp   $0C
    jr   z, label_646E1
    cp   $05
    jr   z, label_646E1
    ld   [$DB7D], a
    ld   a, $0D
    ld   [$DB00], a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_C05
    ld   [hl], $80
    ld   a, $01
    ld   [$C167], a
    ld   a, $10
    ld   [$D368], a
    ret

label_646DB::
    ld   [hl], b
    ld   a, $23
    jp   label_237C

label_646E1::
    ld   [hl], b
    ld   a, $27
    jp   label_237C
    call label_67D3D
    call label_3B12
    ld   [hl], $02
    ld   a, [$C177]
    and  a
    jr   nz, label_64725
    ld   hl, $DB00
    ld   de, $0000

label_646FB::
    ld   a, [hl]
    cp   $0D
    jr   z, label_64707
    inc  hl
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, label_646FB

label_64707::
    ld   a, [$DB7D]
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   a, $0D
    ld   [$DB7D], a
    call label_C05
    ld   [hl], $80
    ld   a, $01
    ld   [$C167], a
    ld   a, $10
    ld   [$D368], a
    ret

label_64725::
    ld   [hl], b
    ld   a, $23
    jp   label_237C

label_6472B::
    nop
    rla
    add  a, h
    rla
    add  a, b
    rla
    add  a, d
    rla
    add  a, [hl]
    rla
    adc  a, b
    rla
    adc  a, d
    inc  d
    adc  a, h
    inc  d
    sbc  a, b
    rla
    sub  a, b
    rla
    sub  a, d
    rla
    sub  a, [hl]
    rla
    adc  a, [hl]
    rla
    and  h
    inc  d
    call label_C05
    jr   nz, label_64755
    xor  a
    ld   [$C167], a
    call label_3B12
    ld   [hl], b
    ret

label_64755::
    cp   $08
    jr   nz, label_6476A
    dec  [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $0D
    ld   a, $24
    jr   z, label_64767
    ld   a, $26

label_64767::
    call label_237C

label_6476A::
    ld   a, [$FF98]
    ld   [$FFEE], a
    ld   a, [$FF99]
    sub  a, $0C
    ld   [$FFEC], a
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    call label_CAF
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    ld   de, label_6472B
    call label_3C77
    jp   label_3D8A

label_64796::
    ld   l, d
    ldi  [hl], a
    ld   l, b
    ldi  [hl], a
    ld   l, [hl]
    ldi  [hl], a
    ld   l, h
    ldi  [hl], a
    ld   l, b
    ld   [bc], a
    ld   l, d
    ld   [bc], a
    ld   l, h
    ld   [bc], a
    ld   l, [hl]
    ld   [bc], a
    ld   h, h
    ld   [bc], a
    ld   h, [hl]
    ld   [bc], a
    ld   h, [hl]
    ldi  [hl], a
    ld   h, h
    ldi  [hl], a
    ld   h, b
    ld   [bc], a
    ld   h, d
    ld   [bc], a
    ld   h, d
    ldi  [hl], a
    ld   h, b
    ldi  [hl], a

label_647B6::
    nop
    db   $F4 ; Undefined instruction
    inc  c

label_647B9::
    nop
    inc  c
    db   $F4 ; Undefined instruction
    ld   a, [$FFF7]
    cp   $1F
    jp   z, label_645E4
    ld   de, label_64796
    call label_3BC0
    call label_67D3D
    call label_67D6E
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $48
    call label_67E3A
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $01
    cp   e
    jr   nz, label_647E8
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $08

label_647E8::
    call label_3B39
    ld   a, [$C133]
    and  a
    ret  nz
    ld   a, [$FFCB]
    and  $0F
    ret  z
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_647B6
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFCB]
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_647B9
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_67DB8
    call label_3B23
    ld   a, [$FF9E]
    xor  $01
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    rla
    and  $06
    ld   e, a
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    rra
    and  $01
    or   e
    jp   label_3B0C

label_64838::
    ld   [bc], a
    ld   de, label_30C0
    inc  d

label_6483D::
    ld   [bc], a
    ld   de, label_650C1
    inc  d

label_64842::
    ld   [bc], a
    rrca
    push af
    sub  a, h
    ld   d, d
    call label_67D3D
    call label_C05
    jr   z, label_64869
    cp   $01
    jr   nz, label_6485C
    ld   a, [$C11C]
    ld   [$D463], a
    call label_64891

label_6485C::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, $04
    ld   [$C13B], a
    ret

label_64869::
    ld   a, [$C11C]
    cp   $01
    jr   nz, label_64890
    ld   a, [$FF9C]
    and  a
    jr   z, label_64890
    call label_67E0B
    add  a, $0C
    cp   $18
    jr   nc, label_64890
    call label_67E1B
    add  a, $0C
    cp   $18
    jr   nc, label_64890
    xor  a
    ld   [$C166], a
    call label_C05
    ld   [hl], $10

label_64890::
    ret

label_64891::
    ld   de, label_64842
    ld   a, [$FFF6]
    cp   $EA
    jr   z, label_648A6
    ld   de, label_64838
    ld   a, [$FF98]
    cp   $30
    jr   c, label_648A6
    ld   de, label_6483D

label_648A6::
    ld   hl, $D401
    push bc
    ld   c, $05

label_648AC::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_648AC
    pop  bc
    call label_67E61
    ld   a, [$FF98]
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FF99]
    sub  a, $08
    and  $F0
    or   e
    ld   [$D416], a
    jp   label_C83

label_648CA::
    ld   e, b
    ld   bc, label_15A
    ld   e, b
    ld   bc, label_15C
    ld   e, d
    ld   hl, label_2158
    ld   e, h
    ld   hl, label_2158
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $4C
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_648EE
    ld   a, [$FFF1]
    add  a, $02
    ld   [$FFF1], a

label_648EE::
    ld   de, label_648CA
    call label_3BC0
    call label_67D3D
    call label_C56
    call label_67DF1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_64914
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_64914::
    ld   a, [$C3C8]
    and  a
    jr   z, label_64947
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    ld   e, $00
    cp   [hl]
    jr   c, label_64931
    inc  e

label_64931::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   a, [$FFE7]
    and  $3F
    jr   nz, label_64942
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $0C

label_64942::
    call label_649FD
    jr   label_6494A

label_64947::
    call label_3B70

label_6494A::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_64963
    cp   $08
    jr   nz, label_64963
    call label_3B12
    ld   a, $02
    ld   [hl], a

label_6495C::
    ld   [$FFF0], a
    call label_C05
    ld   [hl], $10

label_64963::
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_64980
    call label_67CF0
    jr   nc, label_64980
    ld   a, [$C3C8]
    and  a
    ld   a, $20
    jr   z, label_6497D
    ld   a, $96
    call label_2373
    jr   label_64980

label_6497D::
    call label_2385

label_64980::
    ld   a, [$C3C8]
    and  a
    ret  nz
    ld   a, [$FFF0]
    rst  0
    sbc  a, b
    ld   c, c
    db   $DB
    ld   c, c
    rlca
    ld   c, d
    inc  l
    ld   c, d

label_64990::
    ld   [bc], a
    ld   [label_80C], sp
    cp   $F8
    db   $F4 ; Undefined instruction
    ld    hl, sp+$AF
    call label_3B0C
    call label_C05
    jr   nz, label_649D8
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_64990
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
    ld   hl, label_64990
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

label_649D8::
    jp   label_649FD
    call label_67DB8
    call label_3B23
    ld   a, [$FFE8]
    and  a
    jr   z, label_649FD
    call label_C05
    jr   nz, label_649F2
    ld   [hl], $30
    call label_3B12
    ld   [hl], b
    ret

label_649F2::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C310
    add  hl, bc
    inc  [hl]

label_649FD::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_C05
    jr   nz, label_64A23
    call label_3B12
    ld   a, $24
    call label_3BAA
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    call label_67E0B
    ld   hl, $C380
    add  hl, bc
    ld   a, e
    ld   [hl], a

label_64A23::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_67DB8
    call label_3B23
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $52
    call label_3B44
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $92
    ld   a, [$FFE8]
    and  a
    jr   z, label_64A4F
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $20

label_64A4F::
    ret

label_64A50::
    add  a, b
    ld   h, $95
    ld   h, e
    jr   nz, label_64A90
    ld   [hl], l
    ld   l, e
    and  b
    ld   d, c
    dec  [hl]
    ld   [hl], e
    ld   [label_187D], sp
    ld   a, a
    xor  l
    ld   a, b
    ld   sp, hl
    ld   a, [hl]
    ld   d, b
    ld   e, h
    jp  c, label_1276
    ld   b, b
    cp   e
    ld   l, d
    dec  d
    jr   nc, label_64A2B
    ld   h, [hl]
    rla
    inc  d
    cp   l
    ld   e, [hl]
    rst  $10
    inc  b
    db   $FD ; Undefined instruction
    ld   d, [hl]
    scf
    dec  b
    dec  e
    ld   d, a
    sub  a, a
    add  hl, bc
    dec  a
    ld   e, e
    push af
    add  hl, bc
    ld   e, h
    ld   e, e
    db   $10 ; Undefined instruction
    ld   e, d
    ld   e, e
    ld   c, e
    ld   b, $79
    ld   d, a
    and  b
    ld   [bc], a
    sub  a, l
    ld   d, a

label_64A90::
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$DDD5]
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFE7]
    srl  a
    and  $3C
    ld   e, a
    ld   d, $00
    ld   hl, label_64A50
    add  hl, de
    ld   de, $DC84

label_64AAD::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, e
    and  $03
    jr   nz, label_64AAD
    ld   a, $02
    ld   [$DDD1], a
    ret

label_64ABB::
    ld   h, b
    ld   a, b
    ld   a, b
    ld   h, b
    ld   b, b
    jr   z, label_64AEA
    ld   b, b

label_64AC3::
    jr   nz, label_64AFD
    ld   e, b
    ld   a, b
    ld   a, b
    ld   e, b
    jr   c, label_64AEB
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_64BCC
    ld   a, c
    ld   [$D461], a
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_67E61
    ld   a, [$FFF0]
    rst  0
    db   $EC ; Undefined instruction
    ld   c, d
    dec  c
    ld   c, e
    dec  de
    ld   c, e
    ccf
    ld   c, e

label_64AEA::
    ld   l, l

label_64AEB::
    ld   c, e
    ld   a, [$DB49]
    and  $04
    ret  z
    ld   a, [$DB4A]
    cp   $00
    ret  nz
    ld   a, [$C166]
    cp   $01

label_64AFD::
    ret  nz
    call label_27F2
    call label_C05
    ld   [hl], $30
    xor  a
    ld   [$C5A3], a
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    ret  nz
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    ret  nz
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    cp   $08
    jr   nz, label_64B36
    ld   [hl], b
    call label_C05
    ld   [hl], $40
    jp   label_3B12

label_64B36::
    call label_64B6E
    call label_C05
    ld   [hl], $20
    ret
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    ret  nz
    ld   e, $41
    ld   hl, $DB67

label_64B4C::
    ld   a, [hli]
    and  $02
    jr   z, label_64B57
    inc  e
    ld   a, e
    cp   $47
    jr   nz, label_64B4C

label_64B57::
    ld   a, e
    ld   [$D368], a
    ld   [$D465], a
    ld   a, $FF
    ld   [$C166], a
    xor  a
    ld   [$D210], a
    ld   [$D211], a
    jp   label_3B12
    ret

label_64B6E::
    ld   [$FFE8], a
    ld   e, a
    ld   d, b
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    and  $02
    jr   z, label_64BAB
    ld   a, $DE
    call label_3B86
    ret  c
    ld   a, $2B
    ld   [$FFF4], a
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_64ABB
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    add  a, $08
    ld   [hl], a
    ld   hl, label_64AC3
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, c
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    pop  bc

label_64BAB::
    ret

label_64BAC::
    ld   d, b
    ld   b, $52
    ld   b, $54
    ld   b, $56
    ld   b, $58
    ld   b, $5A
    ld   b, $5C
    ld   b, $5E
    ld   b, $60
    ld   b, $62
    ld   b, $64
    ld   b, $66
    ld   b, $68
    ld   b, $6A
    ld   b, $6C
    ld   b, $6E
    ld   b, $21
    or   b
    jp   nz, label_67E09
    cp   $02
    jp   z, label_64CFF
    ld   a, [$FFF0]
    and  a
    jr   nz, label_64C21
    call label_64A90
    ld   a, [$C5A3]
    cp   $03
    jr   z, label_64BF7
    ld   hl, $FFF1
    ld   a, [$FFE7]
    rra
    rra
    rra
    xor  [hl]
    and  $03
    ret  z
    ld   de, label_64BAC
    jp   label_3BC0

label_64BF7::
    ld   a, [$FFF1]
    cp   $07
    jp   nz, label_67E61
    ld   e, $08
    ld   hl, $DB65

label_64C03::
    ld   a, [hli]
    and  $02
    jr   z, label_64C1A
    dec  e
    jr   nz, label_64C03
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_67E61
    call label_C05
    ld   [hl], $A0
    jp   label_3B12

label_64C1A::
    xor  a
    ld   [$C5A3], a
    jp   label_67E61

label_64C21::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    jp   nz, label_64CEA
    ld   [$C155], a
    ld   [$C5A3], a
    ld   hl, $D736
    ld   a, $C1
    ld   [hl], a
    ld   a, $99
    call label_B2F
    ld   hl, $D746
    ld   a, $CB
    ld   [hl], a
    ld   a, $99
    call label_B2F
    ld   a, $50
    ld   [$FFCE], a
    ld   a, $20
    ld   [$FFCD], a
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_64C88
    push bc
    ld   a, $C1
    ld   [$DDD8], a
    ld   a, $19
    call label_91D
    ld   a, [$FFCF]
    ld   h, a
    ld   a, [$FFD0]
    ld   l, a
    push hl
    ld   de, $0040
    add  hl, de
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    ld   a, $CB
    ld   [$DDD8], a
    ld   a, $19
    call label_91D
    pop  hl
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    pop  bc

label_64C88::
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $07
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, $1F
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, $1F
    ldi  [hl], a
    ld   [hl], b
    call label_27F2
    ld   a, $23
    ld   [$FFF2], a
    call label_64D45
    call label_C4B
    ld   de, $DC5C
    ld   hl, rSVBK

label_64CD6::
    ld   [hl], $02
    ld   a, [de]
    ld   [hl], $00
    ld   [de], a
    inc  e
    ld   a, e
    and  $03
    jr   nz, label_64CD6
    ld   a, $02
    ld   [$DDD1], a
    jp   label_67E61

label_64CEA::
    ld   e, $01
    and  $04
    jr   z, label_64CF2
    ld   e, $FF

label_64CF2::
    ld   a, e
    ld   [$C155], a
    ret

label_64CF7::
    ld   d, $00
    ld   d, $20
    ld   d, $60
    ld   d, $40

label_64CFF::
    ld   de, label_64CF7
    call label_3C77
    call label_67DB8
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    call label_C05
    ld   [$C167], a
    jr   z, label_64D1A
    ld   a, $02
    ld   [$FFA1], a
    ret

label_64D1A::
    ld   hl, $D806
    set  4, [hl]
    ld   a, [hl]
    ld   [$FFF8], a
    jp   label_67E61

label_64D25::
    nop
    inc  b
    ld   [label_800], sp
    nop
    inc  b
    ld   [$0000], sp
    nop
    inc  b
    inc  b
    ld   [label_808], sp

label_64D35::
    ld   a, [$FFFC]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  b
    db   $10 ; Undefined instruction
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    ld    hl, sp+$08
    inc  c
    ld   [$E0AF], sp
    db   $E8 ; add  sp, d
    ld   a, $DE
    call label_3B86
    ret  c
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    call label_280D
    and  $1F
    add  a, $30
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], a
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_64D25
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    add  a, $54
    ld   [hl], a
    ld   hl, label_64D2D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    add  a, $3C
    ld   [hl], a
    ld   hl, label_64D35
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_64D3D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    sub  a, $08
    ld   [hl], a
    pop  bc
    ld   a, [$FFE8]
    inc  a
    cp   $08
    jr   nz, label_64D46
    ret

label_64D9B::
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_67E61
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_64F30
    ld   a, [$FFF0]
    rst  0
    cp   h
    ld   c, l
    nop
    ld   c, [hl]
    add  hl, bc
    ld   c, [hl]
    ld   b, e
    ld   c, [hl]
    ld   [hl], h
    ld   c, [hl]

label_64DB8::
    ld   h, b
    rlca
    ld   h, d
    rlca
    ld   a, c
    ld   [$D201], a
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $50
    call label_64E00
    ld   a, [$DB49]
    and  $01
    ret  z
    ld   a, [$C166]
    cp   $01
    ret  nz
    ld   a, [$DB4A]
    cp   $02
    ret  nz
    ld   a, $DC
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $94
    ld   hl, $C210
    add  hl, de
    ld   [hl], $D8
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C1
    ld   a, $55
    ld   [$D368], a
    jp   label_3B12
    ret

label_64E00::
    ld   de, label_64DB8
    call label_3BC0
    jp   label_67CA2
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_64E00
    call label_C05
    jr   nz, label_64E36
    ld   [hl], $A0
    call label_3B12
    ld   a, $02
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFD7]
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFD8]
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20

label_64E36::
    ret

label_64E37::
    ld   a, [$FF00]
    ld   h, h
    inc  bc
    nop
    nop
    ld   h, [hl]
    inc  bc
    nop
    ld   [label_368], sp
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   hl, label_64E37
    ld   c, $03
    call label_3CE6
    call label_C05
    jp   z, label_64E62
    cp   $70
    jr   nz, label_64E61
    ld   a, $10
    ld   [$D368], a

label_64E61::
    ret

label_64E62::
    ld   a, [$FF99]
    push af
    ld   a, $10
    ld   [$FF99], a
    ld   a, $6D
    call label_2373
    pop  af
    ld   [$FF99], a
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   hl, label_64E37
    ld   c, $03
    call label_3CE6
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $D5
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, $01
    ld   [$DB7B], a
    xor  a
    ld   [$C167], a
    call label_67F0E
    jp   label_67E61

label_64EAA::
    ld   l, d
    ld   b, $6C
    ld   b, $6E
    ld   b, $02
    ld   [bc], a
    ld   bc, label_401
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    ld   b, $07
    ld   [label_607], sp
    dec  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0100
    ld   [bc], a
    inc  bc
    inc  b
    dec  b
    ld   b, $07
    ld   [label_808], sp
    add  hl, bc
    ld   a, [bc]
    dec  bc
    inc  c
    inc  c
    inc  c
    dec  bc
    ld   a, [bc]
    add  hl, bc
    ld   [label_607], sp
    dec  b
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    dec  bc
    ld   a, [bc]
    add  hl, bc
    ld   [label_607], sp
    dec  b
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0100
    ld   [bc], a
    inc  bc
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
    inc  b
    inc  b
    inc  b
    inc  b

label_64F1C::
    nop
    inc  bc
    ld   b, $07

label_64F20::
    ld   [label_607], sp
    inc  bc
    nop
    db   $FD ; Undefined instruction
    ld   a, [$F8F9]
    ld   sp, hl
    ld   a, [$00FD]
    inc  bc
    ld   b, $07

label_64F30::
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [$FFED], a
    ld   de, label_64EAA
    call label_3C77
    call label_67D3D
    call label_C05
    jr   z, label_64F5A
    cp   $01
    jp   z, label_67E61
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_64EB0
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_64F5A::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $07
    jr   nz, label_64F8F
    ld   hl, $C2C0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $49
    jr   nz, label_64F8F
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    inc  [hl]
    ld   hl, $C420
    add  hl, de
    ld   [hl], $40
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $80
    jp   label_67E61

label_64F8F::
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_64EB4
    add  hl, de
    ld   e, [hl]
    ld   hl, label_64F20
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_64F1C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_67DB8
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    and  $07
    jr   nz, label_64FDA
    ld   a, $DC
    call label_3B86
    ret  c
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
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $1F

label_64FDA::
    ret
    ld   h, b
    nop
    ld   h, d
    nop
    ld   h, h
    nop
    ld   h, [hl]
    nop
    ld   h, d
    jr   nz, label_65046
    jr   nz, label_6504E
    jr   nz, label_6504E
    jr   nz, label_65054
    nop
    ld   l, d
    nop
    ld   l, h
    nop
    ld   l, [hl]
    nop
    ld   l, d
    jr   nz, label_6505E
    jr   nz, label_65066
    jr   nz, label_65066
    jr   nz, label_6506C
    inc  bc
    ld   [hl], d
    inc  bc
    ld   [hl], h
    inc  bc
    halt
    ld   [hl], d
    inc  hl
    ld   [hl], b
    inc  hl
    halt
    ld   [hl], h
    inc  hl

label_6500B::
    db   $F2 ; Undefined instruction
    ld   c, $21
    ld   b, b
    jp   label_3609
    jp   nc, label_DB11
    ld   c, a
    call label_3BC0
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_65027
    inc  [hl]
    ld   a, $57
    ld   [$D368], a

label_65027::
    ld   a, [$DB7B]
    and  a
    jr   nz, label_65034
    ld   a, [$DB6B]
    and  a
    jp   nz, label_650C4

label_65034::
    call label_67D3D
    call label_67CA2
    ld   a, [$FFE7]
    and  $7F
    jr   nz, label_6504A
    call label_280D
    and  $02
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_6504A::
    ld   a, [$FFE7]
    ld   e, $00

label_6504E::
    and  $30
    jr   z, label_65053
    inc  e

label_65053::
    ld   hl, $C380
    add  hl, bc
    ld   a, e
    add  a, [hl]
    call label_3B0C
    ld   a, [$FFE7]

label_6505E::
    and  $3F
    cp   $0F
    jr   nz, label_65093
    ld   a, $08

label_65066::
    call label_3B86
    jr   c, label_65092
    push bc

label_6506C::
    ld   hl, $C380
    add  hl, bc
    ld   c, [hl]
    srl  c
    ld   hl, label_6500B
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
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $17
    ld   hl, $C440
    add  hl, de
    inc  [hl]
    pop  bc

label_65092::
    ret

label_65093::
    call label_67CF0
    ret  nc
    ld   a, [$DB7B]
    and  a
    ld   a, $8B
    jr   z, label_650A1
    ld   a, $8C

label_650A1::
    jp   label_2373

label_650A4::
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  de
    ld   [de], a
    ld   de, $0010
    add  hl, bc
    ld   [bc], a
    add  hl, bc
    nop
    rst  $30
    cp   $F7

label_650B4::
    inc  c
    add  hl, bc
    ld   a, [bc]
    rst  $30
    db   $F4 ; Undefined instruction
    rst  $30
    or   $09

label_650BC::
    inc  bc
    ld   bc, $0000
    nop

label_650C1::
    nop
    ld   bc, $F003
    ld   a, [$FFA7]
    jr   nz, label_650D2
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $50
    call label_3B12

label_650D2::
    ld   e, $00
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_650DF
    ld   e, $02

label_650DF::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_650A4
    add  hl, de
    ld   a, [hl]
    sub  a, $03
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [$FFE7]
    and  $20
    ld   a, $04
    jr   nz, label_65107
    ld   a, $05

label_65107::
    add  a, [hl]
    call label_3B0C
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    add  a, [hl]
    ld   [$FFF1], a
    ld   hl, $C340
    add  hl, bc
    res  4, [hl]
    ld   de, label_64FFB
    call label_3BC0
    call label_3D8A
    call label_67D3D
    ld   a, [$FFE7]
    and  $3F
    jr   nz, label_65158
    call label_280D
    and  $01
    jr   nz, label_65158
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_650B4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_650AC
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_65158::
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    nop
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_650BC
    add  hl, de
    ld   a, [$FFE7]
    and  [hl]
    call z, label_67DB8
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_65181
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_65181::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0C
    jr   z, label_65192
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_65192::
    call label_67E0B
    add  a, $12
    cp   $24
    ret  nc
    call label_67E1B
    add  a, $10
    cp   $20
    ret  nc
    call label_C05
    ret  nz
    ld   [hl], $80
    ld   a, $8D
    jp   label_2373

label_651AD::
    ld   a, [$FF00]
    ld   a, b
    rlca
    ld   a, [$FF08]
    ld   a, d
    rlca
    nop
    nop
    ld   a, h
    rlca
    nop
    ld   [label_77E], sp
    ld   a, [$DBA5]
    and  a
    jr   z, label_651D2
    ld   a, [$FFF6]
    cp   $E4
    jp   z, label_64D9B
    cp   $F4
    jp   z, label_64D9B
    jp   label_6500D

label_651D2::
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_67E61
    ld   a, [$FFF0]
    rst  0
    ld   [rHDMA1], a
    or   c
    ld   d, d
    call label_67D3D
    ld   a, [$DB43]
    cp   $02
    ret  c
    call label_67E0B
    add  a, $08
    cp   $10
    jp   nc, label_652AB
    call label_67E1B
    add  a, $10
    cp   $20
    jp   nc, label_652AB
    ld   a, [$C133]

label_65200::
    and  a
    jp   z, label_652AB
    ld   a, [$FF9E]
    cp   $02

label_65208::
    jp   nz, label_652AB
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $18
    ret  nz
    call label_C05
    ld   [hl], $40
    ld   hl, $D746
    ld   [hl], $0C
    ld   hl, $D756
    ld   [hl], $C6
    ld   a, $99
    call label_B2F
    ld   a, $50
    ld   [$FFCE], a
    ld   a, $30
    ld   [$FFCD], a
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_65267
    push bc
    ld   a, $0C
    ld   [$DDD8], a
    ld   a, $19
    call label_91D
    ld   a, [$FFCF]
    ld   h, a
    ld   a, [$FFD0]
    ld   l, a
    push hl
    ld   de, $0040
    add  hl, de
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    ld   a, $C6
    ld   [$DDD8], a
    ld   a, $19
    call label_91D
    pop  hl
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    pop  bc

label_65267::
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0E
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   a, $68
    ldi  [hl], a
    ld   a, $77
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   a, $69
    ldi  [hl], a
    ld   a, $4B
    ldi  [hl], a
    ld   [hl], b
    ld   a, $11
    ld   [$FFF4], a
    call label_3B12
    jr   label_652B1

label_652AB::
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    ret

label_652B1::
    call label_67D3D
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   hl, label_651AD
    ld   c, $04
    call label_3CE6
    call label_C05
    jp   nz, label_65363
    ld   [$C167], a
    ld   hl, $D736
    ld   [hl], $91
    ld   a, $99
    call label_B2F
    ld   hl, $D746
    ld   [hl], $5E
    ld   a, $99
    call label_B2F
    ld   a, $50
    ld   [$FFCE], a
    ld   a, $20
    ld   [$FFCD], a
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_6531E
    push bc
    ld   a, $91
    ld   [$DDD8], a
    ld   a, $19
    call label_91D
    ld   a, [$FFCF]
    ld   h, a
    ld   a, [$FFD0]
    ld   l, a
    push hl
    ld   de, $0040
    add  hl, de
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    ld   a, $5E
    ld   [$DDD8], a
    ld   a, $19
    call label_91D
    pop  hl
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    pop  bc

label_6531E::
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0E
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $12
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $6C
    ldi  [hl], a
    ld   a, $6D
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   a, $13
    ldi  [hl], a
    ld   [hl], b
    ld   a, $23
    ld   [$FFF2], a
    call label_67F0E
    jp   label_67E61

label_65363::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FC
    jp   label_67DBB

label_6536C::
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_65371
    db   $10 ; Undefined instruction
    jr   nz, label_65385
    ld    hl, sp+$60
    ld   b, b
    ld   [label_66200], sp
    ld   b, b
    ld   [label_66208], sp
    ld   h, b
    ld   [label_66010], sp
    ld   h, b

label_6538C::
    nop
    inc  b
    ld   [$F004], sp
    rst  $20
    rla
    rla
    and  $10
    ld   [$FFED], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_6538C
    add  hl, de
    ld   a, [hl]
    ld   [$FFF5], a
    ld   hl, label_6536C
    ld   c, $08
    call label_3CE6
    call label_67D3D
    call label_3B44
    call label_67DB8
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_653CE
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_653CE::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0C
    jr   z, label_653DF
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_653DF::
    ret

label_653E0::
    ld   a, d
    ld   b, d
    ld   a, d
    ld   h, d
    ld   a, d
    ld   d, h
    ld   a, d
    ld   [hl], h
    ld   a, d
    ld   [bc], a
    ld   a, d
    ldi  [hl], a
    ld   a, d
    inc  d
    ld   a, d
    inc  [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_654FD
    ld   a, [$FFF0]
    rst  0
    ld   [bc], a
    ld   d, h
    ld   d, $54
    ld   l, a
    ld   d, h
    call label_C05
    call label_280D

label_65408::
    and  $3F
    add  a, $30
    ld   [hl], a
    jp   label_3B12

label_65410::
    rst  $38
    ld   bc, label_3FD

label_65414::
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    call label_C05
    jr   nz, label_6546E
    ld   a, [$C5A1]
    cp   $02
    ret  nc
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $D0
    call label_3B12

label_6542A::
    ld   a, $01

label_6542C::
    ld   [$FFE9], a
    ld   a, $DA
    call label_3B86
    ret  c
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    push bc
    ld   a, [$FFE9]
    ld   c, a
    ld   hl, label_65410
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_65412
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_65414
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   a, [$FFE9]
    dec  a
    cp   $FF
    jr   nz, label_6542C
    ret

label_6546E::
    ret
    ld   hl, $C5A0
    inc  [hl]
    ld   de, label_653E0
    call label_3BC0
    call label_67D3D
    call label_3B44
    call label_67DBB
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    ld   e, $00
    ld   a, [hl]
    and  $80
    jr   nz, label_65490
    ld   e, $02

label_65490::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $70
    jr   c, label_654AC
    ld   [hl], $70
    call label_3B12
    ld   [hl], b
    call label_6542A

label_654AC::
    ld   a, [$FFE7]
    xor  c
    and  $0F
    ret  nz
    ld   a, $DA
    call label_3B86
    ret  c
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
    ld   [hl], $18
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   a, [$FFF1]
    rla
    and  $04
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ret

label_654DD::
    ld   a, h
    ld   b, d
    ld   a, h
    ld   h, d
    ld   a, h
    ld   d, h
    ld   a, h
    ld   [hl], h
    ld   a, [hl]
    ld   b, d
    ld   a, [hl]
    ld   h, d
    ld   a, [hl]
    ld   d, h
    ld   a, [hl]
    ld   [hl], h
    ld   a, h
    ld   [bc], a
    ld   a, h
    ldi  [hl], a
    ld   a, h
    inc  d
    ld   a, h
    inc  [hl]

label_654F5::
    ld   a, [hl]
    ld   [bc], a
    ld   a, [hl]
    ldi  [hl], a
    ld   a, [hl]
    inc  d
    ld   a, [hl]
    inc  [hl]

label_654FD::
    cp   $02
    jr   z, label_6552D
    ld   a, [$FFE7]
    xor  c
    rra
    jr   c, label_65519
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    ld   e, a
    ld   a, [$FFF1]
    add  a, e
    ld   [$FFF1], a
    ld   de, label_654DD
    call label_3BC0

label_65519::
    call label_67D3D
    call label_C05
    jp   z, label_67E61
    cp   $08
    jr   nz, label_6552C
    ld   hl, $C3B0
    add  hl, bc
    inc  [hl]
    inc  [hl]

label_6552C::
    ret

label_6552D::
    ld   de, label_654F5
    call label_3BC0
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    call label_3B0C
    call label_67DB8
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $10
    ret  nz
    jp   label_67E61

label_6554B::
    nop
    nop
    ld   d, b
    ld   [bc], a
    nop
    ld   [label_252], sp
    nop
    db   $10 ; Undefined instruction
    ldi  [hl], a
    nop
    jr   label_655AA
    ldi  [hl], a
    stop
    ld   d, h
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   d, [hl]
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   d, [hl]
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   d, h
    ldi  [hl], a

label_6556B::
    nop
    nop
    ld   d, b
    inc  bc
    nop
    ld   [label_352], sp
    nop
    db   $10 ; Undefined instruction
    inc  hl
    nop
    jr   label_655CA
    inc  hl
    stop
    ld   d, h
    inc  bc
    db   $10 ; Undefined instruction
    ld   d, [hl]
    inc  bc
    db   $10 ; Undefined instruction
    ld   d, [hl]
    inc  hl
    db   $10 ; Undefined instruction
    ld   d, h
    inc  hl
    ld   a, [$FFF1]
    and  a
    ld   a, $00
    jr   z, label_65594
    ld   a, $08

label_65594::
    ld   [$FFF5], a
    ld   hl, label_6554B
    ld   a, [$FFF0]
    and  a
    jr   z, label_655A1
    ld   hl, label_6556B

label_655A1::
    ld   c, $08
    call label_3CE6
    call label_67D3D
    call label_C56
    ld   a, [$FFF0]
    rst  0
    or   l
    ld   d, l
    db   $55
    ld   d, l
    jr   c, label_6560B
    call label_67CA2
    ret  nc
    and  a
    ret  z
    call label_CAF
    ld   a, [$FF9A]
    cpl
    inc  a
    sra  a
    sra  a
    ld   [$FF9A], a
    ld   a, $E8

label_655CA::
    ld   [$FF9B], a
    call label_C05
    ld   [hl], $20
    ld   a, $01
    call label_3B0C
    ld   a, $0B
    ld   [$FFF2], a
    jp   label_3B12
    call label_67CA2
    call label_C05
    cp   $01
    jr   nz, label_655EC
    ld   hl, $FFF2
    ld   [hl], $08

label_655EC::
    and  a
    ret  nz
    call label_67DBB
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $70
    jr   nc, label_655FD
    add  a, $03
    ld   [hl], a

label_655FD::
    ld   hl, $C210

label_65600::
    add  hl, bc
    ld   a, [hl]
    add  a, $10
    ld   [hl], a
    ld   a, [$FFEF]
    add  a, $10
    ld   [$FFEF], a

label_6560B::
    call label_3B23
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [hl], a
    ld   a, [$FFEF]
    sub  a, $10
    ld   [$FFEF], a
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    call label_C4B
    call label_C05
    ld   [hl], $30
    ld   a, $30
    ld   [$C157], a
    ld   a, $04
    ld   [$C158], a
    jp   label_3B12
    jp   label_658A2

label_6563B::
    nop
    nop
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    rrca
    rrca
    rrca
    ld   c, $0E
    ld   c, $08
    ld   [label_707], sp
    rlca
    ld   b, $06
    ld   b, $08
    ld   [label_909], sp
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_6565B::
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  c
    inc  c
    dec  c
    dec  c
    dec  c
    ld   c, $0E
    ld   c, $04
    inc  b
    dec  b
    dec  b
    dec  b
    ld   b, $06
    ld   b, $0C
    inc  c
    dec  bc
    dec  bc
    dec  bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_6567B::
    ld   a, [$FFD7]
    rlca
    and  $01
    ld   e, a
    ld   a, [$FFD8]
    rlca
    rla
    and  $02
    or   e
    rla
    rla
    rla
    and  $18
    ld   h, a
    ld   a, [$FFD8]
    bit  7, a
    jr   z, label_65696
    cpl
    inc  a

label_65696::
    ld   d, a
    ld   a, [$FFD7]
    bit  7, a
    jr   z, label_6569F
    cpl
    inc  a

label_6569F::
    cp   d
    jr   nc, label_656AF
    sra  a
    sra  a
    add  a, h
    ld   e, a
    ld   d, b
    ld   hl, label_6563B
    add  hl, de
    ld   a, [hl]
    ret

label_656AF::
    ld   a, d
    sra  a
    sra  a
    add  a, h
    ld   e, a
    ld   d, b
    ld   hl, label_6565B
    add  hl, de
    ld   a, [hl]
    ret

label_656BD::
    ld   e, d
    inc  bc
    ld   e, d
    inc  hl
    ld   e, b
    ld   [bc], a
    ld   e, b
    ldi  [hl], a
    ld   de, label_656BD
    call label_3BC0
    call label_67D3D
    call label_C56
    call label_3B39
    xor  a
    call label_3B0C
    ld   a, [$FFF0]
    rst  0
    db   $E3 ; Undefined instruction
    ld   d, [hl]
    db   $ED ; Undefined instruction
    ld   d, [hl]
    db   $10 ; Undefined instruction
    ld   c, b
    ld   d, a
    ld   a, [$FFEC]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_3B12
    call label_C05
    ret  nz
    call label_67E0B
    ld   e, a
    add  a, $28
    cp   $50
    ret  nc
    ld   a, $01
    call label_3B0C
    ld   a, e
    add  a, $18
    cp   $30
    ret  nc
    call label_3D7F
    call label_C05
    ld   [hl], $08
    jp   label_3B12
    ld   a, $01
    call label_3B0C
    call label_C05
    cp   $01
    jr   nz, label_65721
    ld   hl, $FFF2
    ld   [hl], $08

label_65721::
    and  a
    ret  nz
    call label_67DBB
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $70
    jr   nc, label_65732
    add  a, $03
    ld   [hl], a

label_65732::
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, $09
    ld   [$FFF2], a
    call label_C05
    ld   [hl], $30
    jp   label_3B12
    call label_C05
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFEC]
    cp   [hl]
    jr   nz, label_6575F
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $20
    ret

label_6575F::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F8
    jp   label_67DBB

label_65768::
    nop
    nop
    ld   [hl], b
    rlca
    nop
    ld   [label_772], sp
    nop
    db   $10 ; Undefined instruction
    daa
    nop
    jr   label_657E7
    daa
    stop
    ld   [hl], h
    rlca
    db   $10 ; Undefined instruction
    halt
    db   $10 ; Undefined instruction
    halt
    db   $10 ; Undefined instruction
    ld   [hl], h
    daa

label_65788::
    rst  $38
    rlca
    rst  $38
    rlca
    ld   l, [hl]
    rlca
    ld   a, [hl]
    rlca
    ld   a, d
    rlca
    ld   a, d
    daa
    ld   a, [hl]
    daa
    ld   l, [hl]
    daa
    ld   a, [hl]
    daa
    ld   a, h
    daa
    ld   a, [hl]
    daa
    ld   l, h
    daa
    ld   a, b
    rlca
    ld   a, b
    daa
    ld   l, h
    rlca
    ld   a, [hl]
    rlca
    ld   a, h
    rlca
    ld   a, [hl]
    rlca

label_657AC::
    inc  b
    dec  b
    ld   b, $07
    ld   [label_201], sp
    inc  bc
    ld   a, [$FFEC]
    add  a, $08
    ld   [$FFEC], a
    ld   a, [$FFEE]
    add  a, $08
    ld   [$FFEE], a
    ld   de, label_65788
    call label_3BC0
    call label_3D8A
    ld   hl, label_65768
    ld   c, $08
    call label_3CE6
    ld   a, $06
    call label_3DA0
    call label_67D3D
    call label_C56
    call label_3B70
    call label_658A2
    ld   a, [$FFF0]
    rst  0
    db   $ED ; Undefined instruction
    ld   d, a

label_657E7::
    rst  $30
    ld   d, a
    scf
    ld   e, b
    add  a, c
    ld   e, b
    ld   a, [$FFEC]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_3B12
    call label_C05
    ret  nz
    call label_67E0B
    add  a, $F8

label_65800::
    ld   e, a
    add  a, $28
    cp   $50
    jr   nc, label_6581D
    ld   a, e

label_65808::
    add  a, $18
    cp   $30
    jr   nc, label_6581D
    call label_3D7F
    ld   a, $08
    ld   [$FFF2], a
    ld   a, $00
    call label_3B0C
    jp   label_3B12

label_6581D::
    ld   a, [$FFE7]
    and  $07
    ret  nz
    ld   a, $1F
    call label_3BB5
    call label_6567B
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_657AC
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    call label_67DBB
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $70
    jr   nc, label_65846
    add  a, $03
    ld   [hl], a

label_65846::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $10
    ld   [hl], a
    ld   a, [$FFEF]
    add  a, $10
    ld   [$FFEF], a
    call label_3B23
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [hl], a
    ld   a, [$FFEF]
    sub  a, $10
    ld   [$FFEF], a
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    call label_C4B
    call label_C05
    ld   [hl], $30
    ld   a, $30
    ld   [$C157], a
    ld   a, $04
    ld   [$C158], a
    jp   label_3B12
    call label_C05
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFEC]
    cp   [hl]
    jr   nz, label_65899
    call label_3B12
    ld   [hl], $01
    call label_C05
    ld   [hl], $20
    ret

label_65899::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F8
    jp   label_67DBB

label_658A2::
    call label_3B5A
    ret  nc
    call label_67E1B
    add  a, $08
    bit  7, a
    jr   nz, label_658C0
    call label_3B18
    ld   a, $10
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a
    ret

label_658C0::
    ld   a, [$FF9B]
    and  $80
    jr   nz, label_658D8
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [$FF99], a
    ld   a, $02
    ld   [$FF9B], a
    ld   a, $01
    ld   [$C147], a

label_658D8::
    ret
    ld   e, [hl]
    ld   b, $5E
    ld   h, $11
    reti
    ld   e, b
    call label_3BC0
    call label_67D3D
    ld   a, [$FFF0]
    rst  0
    rst  $28
    ld   e, b
    ld   a, c
    ld   e, c
    ld   a, c
    ld   e, c
    call label_3B5A
    jr   nc, label_65922
    call label_67E1B
    ld   e, a
    add  a, $03
    cp   $06
    jr   nc, label_65901
    call label_6599B

label_65901::
    ld   a, [$FF9B]
    and  $80
    jr   nz, label_65922
    call label_67E1B
    add  a, $08
    bit  7, a
    jr   z, label_65922
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [$FF99], a
    ld   a, $02
    ld   [$FF9B], a
    ld   a, $01
    ld   [$C147], a

label_65922::
    call label_67E0B
    add  a, $12
    cp   $24
    ret  nc
    call label_67E1B
    add  a, $12
    cp   $24
    ret  nc
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_65945
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_65950
    ret

label_65945::
    ld   a, [$DB01]
    cp   $03
    ret  nz
    ld   a, [$FFCC]
    and  $10
    ret  z

label_65950::
    ld   a, [$C3CF]
    and  a
    ret  nz
    inc  a
    ld   [$C3CF], a
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $07
    ld   hl, $C490
    add  hl, bc
    ld   [hl], b
    call label_C05
    ld   [hl], $02
    ld   hl, $FFF3
    ld   [hl], $02
    call label_3B12
    ld   [hl], $02
    ld   a, [$FF9E]
    ld   [$C15D], a
    ret
    call label_67DB8
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   nz, label_65989
    cp   $40
    jr   nc, label_6598B

label_65989::
    inc  [hl]
    inc  [hl]

label_6598B::
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    call label_3E34
    jp   label_67E61

label_6599B::
    call label_CB6
    ld   a, [$C146]
    and  a
    jr   nz, label_659B7
    ld   a, $02
    ld   [$C13E], a
    call label_67E0B
    ld   a, e
    and  a
    ld   a, $10
    jr   z, label_659B4
    ld   a, $F0

label_659B4::
    ld   [$FF9A], a
    ret

label_659B7::
    ld   a, [$FF9F]
    ld   [$FF98], a
    ret

label_659BC::
    ld   b, d
    inc  hl
    ld   b, b
    inc  hl
    ld   b, [hl]
    inc  hl
    ld   b, h
    inc  hl
    ld   b, b
    inc  bc
    ld   b, d
    inc  bc
    ld   b, h
    inc  bc
    ld   b, [hl]
    inc  bc
    ld   c, h
    inc  bc
    ld   c, h
    inc  hl
    ld   c, [hl]
    inc  bc
    ld   c, [hl]
    inc  hl
    ld   c, b
    inc  bc
    ld   c, b
    inc  hl
    ld   c, d
    inc  bc
    ld   c, d
    inc  hl
    ld   a, [$DB7B]
    and  a
    jp   z, label_67E61
    ld   a, [$FFF6]
    ld   hl, $C3E0
    add  hl, bc
    ld   [hl], a
    ld   hl, $C220
    add  hl, bc
    ld   [hl], b
    ld   hl, $C230
    add  hl, bc
    ld   [hl], b
    ld   de, label_659BC
    call label_3BC0
    ld   a, [$FFEA]
    cp   $07
    jp   z, label_65B3C
    ld   a, [$C11C]
    cp   $01
    jr   nz, label_65A0D
    call label_65B00
    jr   label_65A31

label_65A0D::
    call label_67DF1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_65A35
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10
    ld   a, [$C146]
    ld   e, a
    ld   a, [$C14A]
    or   e
    jr   z, label_65A31
    ld   [hl], $20

label_65A31::
    call label_3B12
    ld   [hl], b

label_65A35::
    call label_67D3D
    ld   a, [$FFF0]
    and  a
    jr   nz, label_65A85
    call label_67E3A
    sla  e
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    call label_67E0B
    add  a, $12
    cp   $24
    jr   nc, label_65A5F
    call label_67E1B
    add  a, $12
    cp   $24
    jr   c, label_65A9F

label_65A5F::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_65A7F
    ld   a, [$C14A]
    and  a
    ld   a, $0C
    jr   z, label_65A6F
    ld   a, $20

label_65A6F::
    ld   e, a
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    push af
    push hl
    ld   [hl], b
    ld   a, e
    call label_3BAA
    pop  hl
    pop  af
    ld   [hl], a

label_65A7F::
    call label_67DB8
    jp   label_3B23

label_65A85::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_65A90
    inc  [hl]
    inc  [hl]

label_65A90::
    dec  [hl]
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_65A9C
    inc  [hl]
    inc  [hl]

label_65A9C::
    dec  [hl]
    jr   label_65A7F

label_65A9F::
    call label_3D7F
    call label_3B5A
    ret  nc
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_65AB9
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_65AC4
    ret

label_65AB9::
    ld   a, [$DB01]
    cp   $03
    ret  nz
    ld   a, [$FFCC]
    and  $10
    ret  z

label_65AC4::
    ld   a, [$C11C]
    cp   $02
    ret  nc
    ld   a, [$C3CF]
    and  a
    ret  nz
    ld   [$C11C], a
    inc  a
    ld   [$C3CF], a
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $07
    ld   hl, $C490
    add  hl, bc
    ld   [hl], b
    call label_C05
    ld   [hl], $02
    ld   hl, $FFF3
    ld   [hl], $02
    call label_3B12
    ld   [hl], $01
    ld   a, $02
    ld   [$FFA2], a
    ld   [$C146], a
    ret

label_65AF8::
    ld   b, $07
    ld   [label_909], sp
    ld   [label_607], sp

label_65B00::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_65AF8
    add  hl, de
    ld   e, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    sub  a, e
    ret  z
    ld   e, a
    ld   a, [$FFE7]
    and  $01
    ret  nz
    ld   a, e
    and  $80
    jr   z, label_65B27
    inc  [hl]
    inc  [hl]

label_65B27::
    dec  [hl]
    ret

label_65B29::
    rrca
    nop
    ld   bc, label_20F
    rrca
    rrca
    rrca
    inc  bc
    rrca
    rrca

label_65B34::
    inc  d
    inc  d
    dec  d
    ld   d, $17
    rla
    ld   d, $15

label_65B3C::
    ld   a, [$FF9E]
    rla
    and  $06
    ld   e, a
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    ld   a, $02
    ld   [$C146], a
    xor  a
    ld   [$FFA3], a
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_65B75
    ld   a, [$FFE7]
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_65B34
    add  hl, de
    ld   e, [hl]
    ld   hl, $FFA2
    ld   a, [hl]
    sub  a, e
    jr   z, label_65B75
    and  $80
    jr   z, label_65B74
    inc  [hl]
    inc  [hl]

label_65B74::
    dec  [hl]

label_65B75::
    ld   a, [$FFCB]
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_65B29
    add  hl, de
    ld   a, [hl]
    cp   $0F
    jr   z, label_65B89
    ld   [$FF9E], a
    ld   [$C15D], a

label_65B89::
    ld   a, [$C133]
    and  $03
    jr   z, label_65B93
    xor  a
    ld   [$FF9B], a

label_65B93::
    ld   a, [$C133]
    and  $0C
    jr   z, label_65B9D
    xor  a
    ld   [$FF9A], a

label_65B9D::
    jp   label_29F8
    ld   h, h
    nop
    ld   h, h
    jr   nz, label_65C0B
    nop
    ld   h, [hl]
    jr   nz, label_65C09
    nop
    ld   h, b
    jr   nz, label_65C0F
    nop
    ld   h, d
    jr   nz, label_65C19
    nop
    ld   l, d
    nop
    ld   l, h
    nop
    ld   l, [hl]
    nop
    ld   l, d
    jr   nz, label_65C23
    jr   nz, label_65C2B
    jr   nz, label_65C2B
    jr   nz, label_65BD2
    and  b
    ld   e, e
    call label_3BC0
    call label_67D3D
    call label_67DB8
    call label_67DF1
    call label_3B23

label_65BD2::
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_65BE9
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_65BE9::
    ld   a, [$FFF0]
    rst  0
    ld   [label_6495C], sp
    ld   e, h

label_65BF0::
    nop
    stop
    ld   a, [$FF0C]
    inc  c
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction

label_65BF8::
    ld   a, [$FF00]
    stop
    db   $F4 ; Undefined instruction
    inc  c
    inc  c
    db   $F4 ; Undefined instruction

label_65C00::
    nop
    ld   b, $02
    inc  b
    nop
    ld   b, $02
    inc  b
    call label_C05

label_65C0B::
    jr   nz, label_65C41
    call label_3B12
    call label_280D
    and  $1F
    or   $10
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $07
    ld   e, a
    ld   d, b

label_65C23::
    ld   hl, label_65BF0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240

label_65C2B::
    add  hl, bc
    ld   [hl], a
    ld   hl, label_65BF8
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, label_65C00
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_65C41::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    jp   label_3B0C
    ld   a, [$FFE8]
    and  a
    jr   z, label_65C61
    call label_C05
    call label_280D
    and  $1F
    add  a, $10
    ld   [hl], a
    call label_3D7F
    call label_3B12
    ld   [hl], b
    ret

label_65C61::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    inc  a
    jp   label_3B0C

label_65C6A::
    nop
    inc  l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sub  a, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, $01
    ld   [$FFA1], a
    ld   [$C167], a
    call label_178E
    ld   a, [$FF9C]
    rst  0
    ld   a, l
    ld   e, l
    adc  a, a
    ld   e, l
    xor  h
    ld   e, l
    ld   a, [$FFB7]
    and  a
    jr   nz, label_65D8A
    ld   a, $01
    ld   [$FF9C], a
    ld   a, $25
    ld   [$FFF2], a

label_65D8A::
    ret

label_65D8B::
    nop
    inc  bc
    ld   bc, $F002
    or   a
    and  a
    jr   nz, label_65D99
    ld   a, $02
    ld   [$FF9C], a
    ret

label_65D99::
    ld   a, [$FFE7]
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_65D8B
    add  hl, de
    ld   a, [hl]
    ld   [$FF9E], a
    jp   label_BF0
    call label_65D99
    ld   a, [$FFA2]
    add  a, $04
    ld   [$FFA2], a
    cp   $78
    jr   c, label_65DF7
    ld   [$DBC8], a
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00

label_65DC1::
    ld   hl, label_65C6A
    add  hl, de
    ld   e, [hl]
    ld   hl, $D800
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   z, label_65DC1
    ld   a, e
    ld   [$D403], a
    xor  a
    ld   [$D401], a
    ld   [$D402], a
    ld   a, $70
    ld   [$D405], a
    ld   [$FF99], a
    ld   a, $68
    ld   [$D404], a
    ld   [$FF98], a
    ld   [$D475], a
    ld   a, $66
    ld   [$D416], a
    call label_C83
    xor  a
    ld   [$C167], a

label_65DF7::
    ret

label_65DF8::
    ld   b, d
    inc  hl
    ld   b, b
    inc  hl
    ld   b, [hl]
    inc  hl
    ld   b, h
    inc  hl
    ld   b, b
    inc  bc
    ld   b, d
    inc  bc
    ld   b, h
    inc  bc
    ld   b, [hl]
    inc  bc
    ld   c, b
    inc  bc
    ld   c, d
    inc  bc
    ld   c, h
    inc  bc
    ld   c, [hl]
    inc  bc

label_65E10::
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    inc  de
    ld   [de], a
    ld   de, $FA10
    ld   a, c
    db   $DB
    cp   $01
    jp   nz, label_67E61
    ld   a, [$FFF6]
    ld   hl, $C3E0
    add  hl, bc
    ld   [hl], a
    ld   hl, $C220
    add  hl, bc
    ld   [hl], b
    ld   hl, $C230
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFE7]
    xor  c
    and  $01
    jr   nz, label_65E3E
    ld   de, label_65DF8
    call label_3BC0

label_65E3E::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_65E5B
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_65E10
    add  hl, de
    ld   a, [hl]
    sub  a, $04
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a

label_65E5B::
    ld   a, [$FFF0]
    and  a
    jr   nz, label_65EAF
    call label_67E3A
    ld   a, e
    cp   $02
    ld   e, $04
    jr   z, label_65E6F
    call label_67E0B
    sla  e

label_65E6F::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    call label_67E0B
    add  a, $18
    cp   $30
    jr   nc, label_65E99
    ld   a, [$FF99]
    push af
    add  a, $0C
    ld   [$FF99], a
    call label_67E1B
    ld   e, a
    pop  af
    ld   [$FF99], a
    ld   a, e
    add  a, $18
    cp   $30
    jr   c, label_65EAF

label_65E99::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_65EAC
    ld   a, [$C14A]
    and  a
    ld   a, $08
    jr   z, label_65EA9
    ld   a, $18

label_65EA9::
    call label_3BAA

label_65EAC::
    call label_67DB8

label_65EAF::
    ld   a, [$DBA5]
    and  a
    jp   nz, label_65FBF
    ld   a, [$DB7A]
    and  a
    jp   z, label_65F5F
    ld   a, [$FFF6]
    cp   $64
    jp   nz, label_65F84
    ld   a, [$FFF0]
    rst  0
    call label_E05E
    ld   e, [hl]
    inc  a
    ld   e, a
    call label_67D3D
    ld   a, [$FF98]
    cp   $3C
    ret  nc
    ld   a, [$FF99]
    cp   $7A
    ret  nc
    ld   [$C167], a
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    ld   a, [$FF99]
    push af
    ld   a, [$FF98]
    push af
    ld   hl, $C310
    add  hl, bc
    ld   a, $60
    sub  a, [hl]
    ld   [$FF99], a
    ld   a, $28
    ld   [$FF98], a
    ld   a, $08
    call label_3BAA
    call label_67E0B
    push af
    ld   a, e
    sla  a
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    pop  af
    add  a, $03
    cp   $06
    jr   nc, label_65F30
    call label_67E1B
    add  a, $0C
    cp   $18
    jr   nc, label_65F30
    pop  af
    ld   [$FF98], a
    pop  af
    ld   [$FF99], a
    ld   a, $16
    call label_237C
    ld   a, $2D
    ld   [$FFF2], a
    call label_3B12
    ld   hl, $C2C0
    add  hl, bc
    inc  [hl]
    ret

label_65F30::
    pop  af
    ld   [$FF98], a
    pop  af
    ld   [$FF99], a
    call label_67DB8
    jp   label_66053
    ld   a, $02
    ld   [$FFA1], a
    call label_67D3D
    ld   hl, $C310
    add  hl, bc
    dec  [hl]
    jr   nz, label_65F5C
    xor  a
    ld   [$DB79], a
    ld   [$DB7A], a
    ld   [$C167], a
    ld   hl, $D9E3
    set  6, [hl]
    jp   label_67E61

label_65F5C::
    jp   label_66053

label_65F5F::
    call label_67D3D
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   a, [$FFF6]
    cp   $F6
    jp   nz, label_65F84
    ld   a, [$FF99]
    cp   $40
    ret  c
    ld   a, [$FF98]
    cp   $78
    ret  nc
    inc  [hl]
    ld   a, $2D
    ld   [$FFF2], a
    ld   a, $13
    jp   label_237C

label_65F84::
    call label_67D3D
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFE7]
    and  $01
    ret  nz
    ld   hl, $C440
    add  hl, bc
    dec  [hl]
    ret  nz
    call label_280D
    and  $03
    ld   hl, $C3C8
    or   [hl]
    ret  nz
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]
    ld   a, $2D
    ld   [$FFF2], a
    ld   a, [$DB7A]
    and  a
    ld   a, $11
    jr   z, label_65FBC
    ld   a, $10

label_65FBC::
    jp   label_237C

label_65FBF::
    call label_67D3D
    ld   a, [$FFF7]
    cp   $1E
    ret  nz
    ld   a, [$FFF6]
    cp   $E3
    ret  nz
    ld   a, [$FFF8]
    and  $20
    ret  nz
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFF0]
    rst  0
    rst  $20
    ld   e, a
    rst  $38
    ld   e, a
    scf
    ld   h, b
    ld   h, h
    ld   h, b
    add  a, b
    ld   h, b
    and  l
    ld   h, b
    call label_C05
    ld   [hl], $40
    jp   label_3B12

label_65FEF::
    ld   h, b
    jr   z, label_6601A
    ld   l, b

label_65FF3::
    nop
    ld    hl, sp+$FC
    ld   [$FCF8], sp
    ld    hl, sp+$02

label_65FFB::
    inc  b
    ld   [bc], a
    inc  b
    nop
    call label_C05
    jr   nz, label_66035
    ld   hl, $C3D0
    add  hl, bc

label_66008::
    ld   e, [hl]
    ld   d, b
    ld   hl, label_65FEF
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2E0
    add  hl, bc
    ld   [hl], a
    ld   hl, label_65FF3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_65FF7
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_66028::
    ld   hl, label_65FFB
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    call label_3B12

label_66035::
    jr   label_66053
    call label_C05
    jr   nz, label_66050
    ld   [hl], $50
    call label_3B12
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $04
    jr   z, label_66050
    call label_3B12
    ld   [hl], b

label_66050::
    call label_67DB8

label_66053::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    add  a, e
    jp   label_3B0C
    call label_C05
    jr   nz, label_6607D
    ld   [hl], $50
    ld   a, [$FF99]
    push af
    ld   a, $10
    ld   [$FF99], a
    ld   a, $14
    call label_237C
    pop  af

label_66078::
    ld   [$FF99], a
    call label_3B12

label_6607D::
    jp   label_66053
    call label_C05
    jr   nz, label_6608D
    ld   a, $15
    call label_237C
    call label_3B12

label_6608D::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $0A
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $FC
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $02
    call label_67DB8
    jp   label_66053
    ld   a, $01
    ld   [$DB7A], a
    call label_67F0E
    call label_67E61
    jp   label_C7D
    nop
    sbc  a, b
    ld   b, $89
    nop
    inc  b
    nop
    inc  b
    nop
    inc  b
    nop
    inc  b
    nop
    db   $10 ; Undefined instruction
    rlca
    adc  a, c
    ld   bc, $0111
    ld   de, label_1101
    ld   bc, $0111
    ld   de, label_898
    adc  a, c
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    ld   [label_789], sp
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    add  hl, bc
    adc  a, c
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    ld   a, [bc]
    adc  a, c
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    dec  bc
    adc  a, c
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    dec  bc
    adc  a, c
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    inc  c
    adc  a, c
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    dec  c
    adc  a, c
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    ld   c, $89
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    sbc  a, b
    rrca
    adc  a, c
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    inc  de
    sbc  a, b
    ld   b, $89
    inc  b
    nop
    inc  b
    nop
    inc  b
    nop
    inc  b
    nop
    inc  b
    inc  d
    sbc  a, b
    rlca
    adc  a, c
    ld   de, label_1101
    ld   bc, $0111
    ld   de, label_1101
    ld   bc, label_898
    adc  a, c
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    ld   [label_689], sp
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    add  hl, bc
    adc  a, c
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    ld   a, [bc]
    adc  a, c
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    dec  bc
    adc  a, c
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    dec  bc
    adc  a, c
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    inc  c
    adc  a, c
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    sbc  a, b
    dec  c
    adc  a, c
    rlca
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $07
    ld   b, $98
    ld   c, $89
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    ld   [de], a
    ld   [bc], a
    sbc  a, b
    rrca
    adc  a, c
    dec  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    dec  d

label_661EC::
    ld   d, b
    ld   h, c
    or   h
    ld   h, b

label_661F0::
    add  a, h
    ld   h, c
    db   $E8 ; add  sp, d
    ld   h, b

label_661F4::
    cp   b
    ld   h, c
    inc  e
    ld   h, c

label_661F8::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_6650F
    ld   a, [$FFF0]
    rst  0
    inc  de
    ld   h, d
    ld   e, $62
    ld   d, d
    ld   h, d
    ld   e, d
    ld   h, d
    ld   e, a
    ld   h, d
    sub  a, e
    ld   h, d
    cp   d
    ld   h, d
    call label_27F2
    call label_C05
    ld   [hl], $FF
    call label_3B12
    call label_C05
    jr   nz, label_66230
    ld   [$C155], a
    call label_3B0C
    ld   a, $2E
    ld   [$FFF2], a
    jp   label_3B12

label_66230::
    cp   $A0
    jr   nz, label_66238
    ld   a, $1D
    ld   [$FFF4], a

label_66238::
    jr   c, label_66245
    and  $10
    ld   a, $00
    jr   z, label_66242
    ld   a, $FF

label_66242::
    jp   label_3B0C

label_66245::
    ld   e, $01
    and  $04
    jr   z, label_6624D
    ld   e, $FE

label_6624D::
    ld   a, e
    ld   [$C155], a
    ret
    call label_C05
    and  a
    ret  nz
    jp   label_3B12
    ld   hl, label_661EC
    jr   label_66262
    ld   hl, label_661F0

label_66262::
    push bc
    push hl
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rla
    and  $02
    ld   e, a
    ld   d, b
    pop  hl
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   c, $34
    ld   hl, $D601

label_66278::
    dec  de
    ld   a, [de]
    inc  de
    cp   $98
    ld   a, [de]
    jr   nz, label_66288
    ld   a, [$FF96]
    and  a
    ld   a, [de]
    jr   z, label_66288
    add  a, $0C

label_66288::
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_66278
    ld   [hl], $00
    pop  bc
    jp   label_3B12
    ld   hl, label_661F4
    call label_66262
    call label_C05
    ld   [hl], $18
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $0C
    jr   nz, label_662B4
    ld   a, [$FFBF]
    ld   [$D368], a
    ret

label_662B4::
    call label_3B12
    ld   [hl], $02
    ret
    call label_67F0E
    set  4, [hl]
    xor  a
    ld   [$C155], a
    ld   [$C167], a
    ld   a, $02
    ld   [$FFF2], a
    ld   hl, $D736
    ld   a, $E1
    ld   [hl], a
    ld   a, $99
    call label_B2F
    ld   hl, $D746
    ld   a, $77
    ld   [hl], a
    ld   a, $99
    call label_B2F
    ld   hl, $D756
    ld   a, $77
    ld   [hl], a
    ld   a, $99
    call label_B2F
    call label_66374
    call label_663B5
    jp   label_67E61

label_662F4::
    sbc  a, b
    ld   c, d
    add  a, a
    inc  c
    inc  e
    ld   h, h
    ld   h, [hl]
    rrca
    rrca
    rrca
    rrca
    sbc  a, b
    ld   c, e
    add  a, a
    dec  c
    dec  e
    ld   h, l
    ld   h, a
    rra
    rra
    rra
    rra
    sbc  a, b
    ld   c, c
    add  a, c
    dec  bc
    dec  de
    sbc  a, b
    ld   c, h
    add  a, c
    ld   c, $1E

label_66314::
    sbc  a, b
    ld   d, [hl]
    add  a, a
    inc  c
    inc  e
    ld   h, h
    ld   h, [hl]
    rrca
    rrca
    rrca
    rrca
    sbc  a, b
    ld   d, a
    add  a, a
    dec  c
    dec  e
    ld   h, l
    ld   h, a
    rra
    rra
    rra
    rra
    sbc  a, b
    ld   d, l
    add  a, c
    dec  bc
    dec  de
    sbc  a, b
    ld   e, b
    add  a, c
    ld   c, $1E

label_66334::
    sbc  a, b
    ld   c, d
    add  a, a
    inc  c
    inc  e
    ld   h, h
    ld   h, [hl]
    rrca
    rrca
    rrca
    rrca
    sbc  a, b
    ld   c, e
    add  a, a
    dec  c
    dec  e
    ld   h, h
    ld   h, [hl]
    rra
    rra
    rra
    rra
    sbc  a, b
    ld   c, c
    add  a, c
    dec  bc
    dec  de
    sbc  a, b
    ld   c, h
    add  a, c
    ld   c, $1E

label_66354::
    sbc  a, b
    ld   d, [hl]
    add  a, a
    inc  c
    inc  e
    ld   h, h
    ld   h, [hl]
    rrca
    rrca
    rrca
    rrca
    sbc  a, b
    ld   d, a
    add  a, a
    dec  c
    dec  e
    ld   h, h
    ld   h, [hl]
    rra
    rra
    rra
    rra
    sbc  a, b
    ld   d, l
    add  a, c
    dec  bc
    dec  de
    sbc  a, b
    ld   e, b
    add  a, c
    ld   c, $1E

label_66374::
    ld   a, $20
    ld   [$D600], a
    ld   hl, $D601
    ld   de, label_662F4
    ld   a, [$FFFE]
    and  a
    jr   z, label_66387
    ld   de, label_66334

label_66387::
    ld   a, [$FF96]
    and  a
    jr   z, label_66397
    ld   de, label_66314
    ld   a, [$FFFE]
    and  a
    jr   z, label_66397
    ld   de, label_66354

label_66397::
    push bc
    ld   c, $20

label_6639A::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_6639A
    pop  bc
    ld   [hl], b
    ret

label_663A3::
    sbc  a, b
    adc  a, e
    add  a, l
    ld   h, $26
    ld   bc, $0101
    ld   bc, $9798
    add  a, l
    ld   h, $26
    ld   bc, $0101
    ld   bc, $FEF0
    and  a
    jr   z, label_663D8
    ld   a, $05
    ld   [$DC90], a
    ld   hl, $DC91
    ld   de, label_663A3
    ld   a, [$FF96]
    and  a
    jr   z, label_663CD
    ld   de, label_663AC

label_663CD::
    push bc
    ld   c, $09

label_663D0::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_663D0
    pop  bc
    ld   [hl], b

label_663D8::
    ret

label_663D9::
    ld   d, b
    ld   e, h
    ld   l, b
    ld   [hl], b
    ld   a, d
    ld   a, [hl]
    ld   e, b
    ldd  [hl], a
    jr   c, label_6641B
    ld   b, b
    ld   b, h
    ld   d, b

label_663E6::
    jr   nz, label_66408
    jr   nz, label_6640A
    jr   nz, label_6640B
    ld   e, $1F
    jr   nz, label_66410
    jr   nz, label_66412
    jr   nz, label_663F7
    inc  bc
    inc  b
    inc  b

label_663F7::
    dec  b
    dec  b
    ld   b, $01
    ld   bc, label_202
    inc  bc
    inc  bc

label_66400::
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    ret  nz
    jr   c, label_66443
    dec  sp

label_6640A::
    ld   b, h

label_6640B::
    ld   c, h
    ld   e, b

label_6640D::
    rst  $38
    rst  $38
    rst  $38

label_66410::
    rst  $38
    rst  $38

label_66412::
    rst  $38
    rst  $38
    cpl
    jr   nc, label_66447
    jr   nc, label_66449
    jr   nc, label_6641B

label_6641B::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_302
    inc  b
    inc  b

label_66427::
    nop
    nop
    ld   [hl], b
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    nop
    ld   [hl], d
    ld   b, $00
    ld   [label_674], sp
    nop
    nop
    rst  $38
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    nop

label_66449::
    halt
    nop
    ld   [label_678], sp
    nop
    db   $10 ; Undefined instruction
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    nop
    ld   a, h
    ld   b, $00
    ld   [label_67E], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, $00
    jr   label_664E2
    ld   h, $00
    nop
    ld   a, d
    ld   h, $00
    ld   [label_2678], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, $00
    nop
    rst  $38
    ld   b, $00
    nop
    ld   [hl], h
    ld   h, $00
    ld   [label_2672], sp
    nop
    nop
    rst  $38
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    jr   nc, label_664FA
    ld   h, $00
    ret  c
    ld   [hl], b
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    nop
    rst  $38
    ld   b, $00
    nop
    ld   h, b
    dec  d
    stop
    ld   h, d
    ld   b, $20
    nop
    ld   h, d
    ld   b, $00
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
    ld   h, h
    dec  d
    stop
    ld   h, [hl]
    ld   b, $20
    nop
    ld   h, [hl]
    ld   b, $00
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
    ld   [bc], a
    ld   l, b
    dec  d
    db   $10 ; Undefined instruction
    ld   l, d
    ld   b, $20
    ld   [bc], a
    ld   l, d
    ld   b, $00
    dec  b
    ld   l, b
    dec  [hl]
    db   $10 ; Undefined instruction
    ld   l, d
    ld   h, $20
    dec  b
    ld   l, d
    ld   h, $00
    ld   bc, label_1568
    db   $10 ; Undefined instruction
    ld   l, d
    ld   b, $20
    ld   bc, label_66A
    nop
    rlca
    ld   l, b
    dec  [hl]
    db   $10 ; Undefined instruction
    ld   l, d
    ld   h, $20
    rlca
    ld   l, d
    ld   h, $00
    nop
    ld   l, b

label_664FA::
    dec  d
    stop
    ld   l, d
    ld   b, $20
    nop
    ld   l, d
    ld   b, $00
    ld   [label_3568], sp
    db   $10 ; Undefined instruction
    ld   l, d
    ld   h, $20
    ld   [label_266A], sp

label_6650F::
    ld   hl, $C3D0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_663D9
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, label_663E6
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   hl, label_663F3
    add  hl, de
    ld   a, [hl]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_66427
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $02
    call label_3DA0
    ld   hl, $C3D0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_66400
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, label_6640D
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   hl, label_6641A
    add  hl, de
    ld   a, [hl]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    rla
    and  $F0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_66497
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, $04
    jp   label_3DA0

label_66571::
    sbc  a, b
    ld   [bc], a
    add  hl, bc
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    ldi  [hl], a
    add  hl, bc
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    ld   b, d
    add  hl, bc
    inc  c
    dec  c
    inc  c
    dec  c
    inc  c
    dec  c
    inc  c
    dec  c
    inc  c
    dec  c
    sbc  a, b
    ld   h, d
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    ld   [bc], a
    add  hl, bc
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    ldi  [hl], a
    add  hl, bc
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    ld   b, d
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    ld   h, d
    add  hl, bc
    rrca
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $98
    ld   [bc], a
    add  hl, bc
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    ld   d, l
    ld   d, [hl]
    sbc  a, b
    ldi  [hl], a
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    ld   b, d
    add  hl, bc
    rrca
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $98
    ld   h, d
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    ld   [bc], a
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    ldi  [hl], a
    add  hl, bc
    rrca
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $98

label_66628::
    ld   b, d
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    ld   h, d
    add  hl, bc
    rrca
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $98
    add  a, d
    add  hl, bc
    rrca
    ld   c, $0F
    rrca
    rrca
    ld   c, $0F
    ld   c, $0F
    ld   c, $98
    and  d
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    jp   nz, label_F09
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $98
    ldh  [$FF0C], a
    add  hl, bc
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    sbc  a, b
    add  a, d
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    and  d
    add  hl, bc
    rrca
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $98
    jp   nz, label_1E09
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $98
    ldh  [$FF0C], a
    add  hl, bc
    add  hl, bc
    ld   [label_918], sp
    ld   a, [hl]
    ld   a, [hl]
    add  hl, bc
    ld   [label_918], sp
    sbc  a, b
    add  a, d
    add  hl, bc
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    ld   c, $0F
    sbc  a, b
    and  d
    add  hl, bc
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    sbc  a, b
    jp   nz, label_909
    ld   [label_918], sp
    ld   a, [hl]
    ld   a, [hl]
    add  hl, bc
    ld   [label_918], sp
    sbc  a, b
    ldh  [$FF0C], a
    add  hl, bc
    add  hl, bc
    inc  b
    dec  b
    add  hl, bc
    ld   a, [hl]
    ld   a, [hl]
    add  hl, bc
    inc  b
    dec  b
    add  hl, bc
    sbc  a, b
    add  a, d
    add  hl, bc
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    sbc  a, b
    and  d
    add  hl, bc
    add  hl, bc
    ld   [label_918], sp
    ld   a, [hl]
    ld   a, [hl]
    add  hl, bc
    ld   [label_918], sp
    sbc  a, b
    jp   nz, label_909
    inc  b
    dec  b
    add  hl, bc
    ld   a, [hl]
    ld   a, [hl]
    add  hl, bc
    inc  b
    dec  b
    add  hl, bc
    sbc  a, b
    ldh  [$FF0C], a
    add  hl, bc
    add  hl, de
    inc  d
    dec  d
    add  hl, de
    rra
    rra
    add  hl, de
    inc  d
    dec  d
    add  hl, de
    sbc  a, b
    ld   [bc], a
    ld   c, c
    inc  bc
    sbc  a, b
    ldi  [hl], a
    ld   c, c
    inc  bc
    sbc  a, b
    ld   b, d
    ld   c, c
    dec  b
    sbc  a, b
    ld   h, d
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   [bc], a
    ld   c, c
    inc  bc
    sbc  a, b
    ldi  [hl], a
    ld   c, c
    inc  bc
    sbc  a, b
    ld   b, d
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   h, d
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   [bc], a
    ld   c, c
    inc  bc
    sbc  a, b
    ldi  [hl], a
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   b, d
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   h, d
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   [bc], a
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ldi  [hl], a
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   b, d
    ld   c, c
    ld   [bc], a
    sbc  a, b
    ld   h, d
    ld   c, c
    ld   [bc], a
    sbc  a, b
    add  a, d
    add  hl, bc
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
    sbc  a, b
    and  d
    add  hl, bc
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
    sbc  a, b
    jp   nz, label_209
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    sbc  a, b
    ldh  [$FF0C], a
    add  hl, bc
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $8298
    add  hl, bc
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
    sbc  a, b
    and  d
    add  hl, bc
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
    sbc  a, b
    jp   nz, label_109
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    sbc  a, b
    ldh  [$FF0C], a
    add  hl, bc
    ld   bc, $0000
    ld   bc, $0101
    ld   bc, $0000
    ld   bc, $8298
    add  hl, bc
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
    sbc  a, b
    and  d
    add  hl, bc
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $C298
    add  hl, bc
    ld   bc, $0000
    ld   bc, $0101
    ld   bc, $0000
    ld   bc, $E298
    add  hl, bc
    ld   bc, $0000
    ld   bc, $0101
    ld   bc, $0000
    ld   bc, $8298
    add  hl, bc
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $A298
    add  hl, bc
    ld   bc, $0000
    ld   bc, $0101
    ld   bc, $0000
    ld   bc, $C298
    add  hl, bc
    ld   bc, $0000
    ld   bc, $0101
    ld   bc, $0000
    ld   bc, $E298
    add  hl, bc
    ld   bc, $0000
    ld   bc, $0101
    ld   bc, $0000
    ld   bc, label_66571
    and  l
    ld   h, l
    reti
    ld   h, l
    dec  c
    ld   h, [hl]

label_66829::
    ld   b, c
    ld   h, [hl]
    ld   [hl], l
    ld   h, [hl]
    xor  c
    ld   h, [hl]
    db   $66
    ld   h, [hl]

label_66831::
    ld   de, label_2167
    ld   h, a
    ld   sp, label_64167
    ld   h, a

label_66839::
    ld   d, c
    ld   h, a
    add  a, l
    ld   h, a
    cp   c
    ld   h, a
    db   $ED ; Undefined instruction
    ld   h, a

label_66841::
    ld   a, [$FFF6]
    cp   $0E
    jp   z, label_661F8
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFF0]
    rst  0
    ld   e, d
    ld   l, b
    ld   l, e
    ld   l, b
    sub  a, h
    ld   l, b
    ld   sp, hl
    ld   l, b
    ld   a, $04
    ld   [$FFF4], a
    call label_C05
    ld   [hl], $AC
    call label_C00
    ld   [hl], $AC
    call label_3B12
    call label_C05
    cp   $A0
    jr   nz, label_66877
    ld   hl, $FFF4
    ld   [hl], $2E

label_66877::
    and  a
    jr   nz, label_66881
    ld   a, $2F
    ld   [$FFF2], a
    call label_3B12

label_66881::
    ld   e, $01
    and  $04
    jr   z, label_66889
    ld   e, $FE

label_66889::
    ld   a, e
    ld   [$C155], a
    call label_C00
    ret  nz
    jp   label_66A4F
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    push af
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, label_66821
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push bc
    ld   c, $34
    ld   hl, $D601

label_668AC::
    ld   a, [de]
    cp   $98
    jr   nz, label_668BA
    ld   a, [$FF97]
    and  a
    ld   a, $98
    jr   z, label_668BA
    ld   a, $9A

label_668BA::
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_668AC
    ld   [hl], $00
    pop  bc
    pop  af
    push af
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, label_66831
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push bc
    ld   c, $10
    ld   hl, $DC91

label_668D6::
    ld   a, [de]
    cp   $98
    jr   nz, label_668E4
    ld   a, [$FF97]
    and  a
    ld   a, $98
    jr   z, label_668E4
    ld   a, $9A

label_668E4::
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_668D6
    ld   [hl], $00
    pop  bc
    pop  af
    cp   $03
    jr   nz, label_668F6
    ld   a, [$FFBF]
    ld   [$D368], a

label_668F6::
    jp   label_3B12
    push bc
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, label_66829
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   c, $34
    ld   hl, $D601

label_66910::
    ld   a, [de]
    cp   $98
    jr   nz, label_6691E
    ld   a, [$FF97]
    and  a
    ld   a, $98
    jr   z, label_6691E
    ld   a, $9A

label_6691E::
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_66910
    ld   [hl], $00
    pop  bc
    push bc
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, label_66839
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   c, $34
    ld   hl, $DC91

label_6693D::
    ld   a, [de]
    cp   $98
    jr   nz, label_6694B
    ld   a, [$FF97]
    and  a
    ld   a, $98
    jr   z, label_6694B
    ld   a, $9A

label_6694B::
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_6693D
    ld   [hl], $00
    pop  bc
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $04
    jr   z, label_66961
    jp   label_66A3C

label_66961::
    ld   hl, $D712
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   hl, $D712
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    ld   hl, $D722
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   a, $B3
    ldi  [hl], a
    ld   hl, $D722
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    ld   hl, $D732
    ld   a, $AD
    ldi  [hl], a
    ld   a, $B1
    ldi  [hl], a
    ld   a, $E7
    ldi  [hl], a
    ld   a, $AD
    ldi  [hl], a
    ld   a, $B1
    ldi  [hl], a
    ld   hl, $D732
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    ld   hl, $D742
    ld   a, $AE
    ldi  [hl], a
    ld   a, $B2
    ldi  [hl], a
    ld   a, $E3
    ldi  [hl], a
    ld   a, $AE
    ldi  [hl], a
    ld   a, $B2
    ldi  [hl], a
    ld   hl, $D742
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    inc  hl
    ld   a, $99
    call label_B2F
    call label_67F0E
    set  4, [hl]
    xor  a
    ld   [$C155], a
    ld   [$C167], a
    ld   a, $02
    ld   [$FFF2], a
    jp   label_67E61

label_66A3C::
    call label_3B12
    ld   [hl], $01
    call label_C05
    ld   [hl], $30
    ret

label_66A47::
    jr   label_66AA1
    jr   z, label_66A93
    jr   c, label_66A6D
    ld   d, b
    ld   b, b

label_66A4F::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_66A8C
    ld   a, $A7
    call label_3B86
    jr   c, label_66A8C
    push bc
    call label_280D
    and  $07
    ld   c, a
    ld   hl, label_66A47
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a

label_66A6D::
    call label_280D
    and  $07
    add  a, $47
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $10
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01

label_66A8C::
    ret

label_66A8D::
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

label_66AA1::
    ld   l, h
    ld   bc, label_16E
    ld   l, d
    ld   hl, label_2168
    ld   l, [hl]
    ld   hl, label_216C
    ld   a, [$FF10]
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_66841
    ld   a, [$FFF7]
    cp   $0A
    jr   nz, label_66ACE
    ld   a, [$FFF6]
    cp   $97
    jr   z, label_66AC8
    cp   $98
    jr   nz, label_66ACE

label_66AC8::
    ld   a, [$DB7F]
    and  a
    jr   nz, label_66AD4

label_66ACE::
    ld   de, label_66A8D
    call label_3BC0

label_66AD4::
    call label_67D3D
    call label_67D6E
    call label_3B39
    call label_67DB8
    call label_3B23
    ld   a, [$C133]
    and  a
    jr   nz, label_66B41
    ld   a, [$FFCB]
    and  $03
    jr   z, label_66B11
    ld   e, a
    ld   d, b
    ld   hl, label_66AAC
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    ld   a, e
    and  $02
    add  a, $04
    ld   e, a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, e
    jp   label_3B0C

label_66B11::
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_66B41
    rra
    rra
    cpl
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_66AAC
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], b
    ld   a, e
    dec  a
    xor  $01
    sra  a
    rla
    rla
    ld   e, a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, e
    jp   label_3B0C

label_66B41::
    jp   label_3D7F

label_66B44::
    ld   h, b
    ld   bc, label_162
    ld   h, h
    ld   bc, label_166
    ld   h, d
    ld   hl, label_2160
    ld   h, [hl]
    ld   hl, label_2164
    ld   de, label_66B44
    call label_3BC0
    call label_67D3D
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    rlca
    rlca
    and  $02
    ld   e, a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    or   e
    call label_3B0C
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    ld   a, [hl]
    ld   l, e
    and  c
    ld   l, e
    xor  [hl]
    ld   l, e
    ld   hl, $C240
    ld   a, [$FFEB]
    cp   $AA
    jr   z, label_66B8A
    ld   hl, $C250

label_66B8A::
    add  hl, bc
    ld   [hl], $08

label_66B8D::
    ld   e, $80
    ld   a, [$FFEB]
    cp   $AA
    jr   z, label_66B97
    ld   e, $60

label_66B97::
    call label_C05
    ld   [hl], e
    call label_3B12
    ld   [hl], $01
    ret
    call label_C05
    jr   nz, label_66BAB
    ld   [hl], $28
    call label_3B12

label_66BAB::
    jp   label_67DB8
    call label_C05
    jr   nz, label_66BC6
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    jp   label_66B8D

label_66BC6::
    ret
    ld   a, [$FFF0]
    cp   $05
    jr   nz, label_66BD3
    ld   a, [$FFED]
    or   $40
    ld   [$FFED], a

label_66BD3::
    ld   de, label_66B44
    call label_3BC0
    call label_67D3D
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    rlca
    rlca
    and  $02
    ld   e, a
    call label_67D6E
    ld   a, [$FFF0]
    cp   $05
    jr   z, label_66BFD
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    or   e
    call label_3B0C
    call label_3B39

label_66BFD::
    ld   a, [$FFF0]
    rst  0
    inc  c
    ld   l, h
    inc  e
    ld   l, h
    db   $3A ; ldd  a, [hl]
    ld   l, h
    ld   l, [hl]
    ld   l, h

label_66C08::
    add  a, h
    ld   l, h
    xor  c
    ld   l, h
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $03
    ld   a, [$FFEF]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    call label_C05
    call label_280D
    and  $7F
    add  a, $30
    ld   [hl], a
    call label_280D
    ld   e, $F4
    and  $01
    jr   z, label_66C32
    ld   e, $0C

label_66C32::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    jp   label_3B12
    call label_C05
    jr   nz, label_66C53
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $D4
    ld   a, [$FFEC]
    sub  a, $08
    call label_66CD3
    ld   a, $24
    ld   [$FFF2], a
    jp   label_3B12

label_66C53::
    call label_C00
    jr   nz, label_66C68
    call label_280D
    and  $3F
    or   $10
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_66C68::
    call label_67DC5
    jp   label_3B23
    call label_C05
    ret  nz
    call label_67DBB
    call label_66C99
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $18
    ret  nz
    jp   label_3B12
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jr   nc, label_66C96
    call label_3B12
    ld   [hl], $01
    ret

label_66C96::
    call label_67DBB

label_66C99::
    ld   hl, $C430
    add  hl, bc
    set  0, [hl]
    call label_3B23
    ld   hl, $C430
    add  hl, bc
    res  0, [hl]
    ret
    ld   hl, $C340
    add  hl, bc
    set  7, [hl]
    set  6, [hl]
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    push hl
    ld   hl, $C470
    add  hl, bc
    ld   a, [hl]
    pop  hl
    and  a
    jr   z, label_66CC2
    ld   [hl], $06

label_66CC2::
    call label_67DBB
    ld   a, [$FFEC]
    cp   $70
    jr   c, label_66C99
    cp   $88
    jp   nc, label_67E61
    ret
    ld   a, [$FFEC]

label_66CD3::
    ld   [$FFD8], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, $01
    call label_CC7
    ld   a, $0E
    ld   [$FFF2], a
    ret

label_66CE3::
    sbc  a, d
    dec  d
    sbc  a, h
    dec  d

label_66CE7::
    ld   de, label_66CE3
    call label_3BC0
    call label_67DF1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jp   nz, label_67E61
    ret

label_66D00::
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    ld   a, $0B
    ldi  [hl], a
    ld   a, $09
    ldi  [hl], a
    ld   a, $08
    ldi  [hl], a
    ld   a, $0B
    ld   [hl], a
    pop  bc
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_66CE7
    call label_66EC5
    call label_67CA2
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFF0]
    rst  0
    inc  a
    ld   l, l
    ld   [hl], d
    ld   l, l
    adc  a, e
    ld   l, l
    ld   [$FF6D], a
    call label_67CF0
    jr   nc, label_66D67
    ld   e, $CD
    ld   a, [$FFF8]
    and  $20
    jr   nz, label_66D63
    ld   e, $CC
    ld   a, [$DAFE]
    and  $20
    jr   nz, label_66D63
    ld   e, $C6
    ld   a, [$DB0E]
    cp   $03
    jr   nz, label_66D63
    ld   a, $C7
    call label_2373
    jp   label_3B12

label_66D63::
    ld   a, e
    call label_2373

label_66D67::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   z, label_66D86
    ld   [hl], b
    ld   a, $C9
    jp   label_2373

label_66D86::
    ld   a, $C8
    jp   label_2373
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $CD
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    sub  a, $02
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
    ld   [hl], $20
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   a, $24
    ld   [$FFF2], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_66DD4
    ld   hl, $DC7A
    ld   a, $FF
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ld   a, $31
    ldi  [hl], a
    ld   a, $52
    ldi  [hl], a
    ld   a, $02
    ld   [$DDD1], a

label_66DD4::
    call label_C05
    ld   [hl], $C0
    jp   label_3B12

label_66DDC::
    nop
    ld   bc, $0102
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    jr   nz, label_66E01
    xor  a
    ld   [$C167], a
    ld   a, $04
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    call label_C0C
    call label_3B12
    ld   [hl], b
    ret

label_66E01::
    cp   $80
    jr   c, label_66E0A
    ld   a, $03
    jp   label_3B0C

label_66E0A::
    cp   $08
    jr   nz, label_66E14
    dec  [hl]
    ld   a, $CA
    call label_2373

label_66E14::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_66DDC
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_66E25::
    nop
    nop
    ld   d, b
    inc  bc
    nop
    ld   [label_352], sp
    nop
    db   $10 ; Undefined instruction
    inc  bc
    stop
    ld   d, [hl]
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, b
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, d
    inc  bc
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
    ld   d, b
    inc  bc
    nop
    ld   [label_352], sp
    nop
    db   $10 ; Undefined instruction
    inc  bc
    stop
    ld   d, [hl]
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, b
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, [hl]
    inc  bc
    db   $10 ; Undefined instruction
    ld   h, b
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   h, d
    inc  bc
    nop
    ld   [label_364], sp
    nop
    db   $10 ; Undefined instruction
    inc  bc
    stop
    ld   l, b
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, b
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, [hl]
    inc  bc
    db   $10 ; Undefined instruction
    ld   h, b
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   l, d
    inc  bc
    nop
    ld   [label_36C], sp
    nop
    db   $10 ; Undefined instruction
    inc  bc
    stop
    ld   l, b
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, b
    inc  bc
    db   $10 ; Undefined instruction
    ld   e, [hl]
    inc  bc
    db   $10 ; Undefined instruction
    ld   h, b
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_66EA5::
    stop
    ld   [hl], h
    rlca
    db   $10 ; Undefined instruction
    halt
    db   $10 ; Undefined instruction
    ld   [hl], h
    rlca
    db   $10 ; Undefined instruction
    halt
    nop
    db   $10 ; Undefined instruction
    rlca
    nop
    jr   label_66F32
    rlca
    nop
    nop
    ld   [hl], h
    rlca
    nop
    ld   [label_776], sp

label_66EC5::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_66E25
    add  hl, de
    ld   a, [$FFEE]
    add  a, $03
    ld   [$FFEE], a
    ld   c, $07
    call label_3CE6
    ld   a, $02
    call label_3DA0
    ld   a, $78
    ld   [$FFEE], a
    ld   a, $5C
    ld   [$FFEC], a
    ld   hl, label_66EA5
    ld   c, $08
    ld   a, [$DB0E]
    cp   $04
    jr   nz, label_66EFA
    dec  c
    dec  c

label_66EFA::
    call label_3CE6
    ld   a, $03
    call label_3DA0
    jp   label_3D8A

label_66F05::
    ld   [label_67004], sp
    ld   bc, label_C08
    ld   [hl], d
    ld   bc, label_1408
    ld   [hl], b
    ld   hl, $A5FA
    db   $DB
    and  a
    jr   nz, label_66F25
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C3
    ld   hl, label_66F05
    ld   c, $03
    jp   label_3CE6

label_66F25::
    ld   a, [$FFF6]
    cp   $FE
    jp   z, label_66D00
    ld   a, [$FFEE]
    cp   $30
    jp  c, label_670A9
    ld   a, [$FFF0]
    and  a
    jr   nz, label_66F66
    call label_3B12
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $48
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $04
    ld   [hl], a
    ld   a, $CD
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $28
    ld   hl, $C210
    add  hl, de
    ld   [hl], $28
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $40

label_66F66::
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    ld   a, $0A
    ldi  [hl], a
    ld   a, $08
    ldi  [hl], a

label_66F75::
    ld   a, $FF
    ldi  [hl], a
    ld   a, $09
    ld   [hl], a
    pop  bc
    call label_67039
    call label_67CA2
    ld   a, [$FFF0]
    rst  0
    adc  a, e
    ld   l, a
    adc  a, h
    ld   l, a
    push bc
    ld   l, a
    ret
    call label_BFB
    ret  nz
    call label_67CF0
    jr   nc, label_66FB8
    ld   a, [$DB0E]
    cp   $0D
    jr   nz, label_66FA0
    ld   a, $8F
    jr   label_66FAD

label_66FA0::
    cp   $0E
    jr   nz, label_66FAB
    ld   a, $D8
    call label_2385
    jr   label_66FB0

label_66FAB::
    ld   a, $9B

label_66FAD::
    call label_2373

label_66FB0::
    ld   hl, $C19F
    set  7, [hl]
    call label_3B12

label_66FB8::
    ld   a, [$FFE7]
    ld   e, $00
    and  $20
    jr   z, label_66FC1
    inc  e

label_66FC1::
    ld   a, e
    jp   label_3B0C
    ld   a, [$C19F]
    and  a
    jr   nz, label_66FD0
    call label_3B12
    ld   [hl], $01

label_66FD0::
    call label_67E0B
    ld   a, e
    add  a, $02
    jp   label_3B0C

label_66FD9::
    ld    hl, sp+$F8
    ld   e, d
    ld   [bc], a
    ld    hl, sp+$00
    ld   e, h
    ld   [bc], a
    ld    hl, sp+$08
    ld   e, [hl]
    ld   [bc], a
    ld   [label_66000], sp
    ld   [bc], a
    ld   [label_66208], sp
    ld   [bc], a
    ld    hl, sp+$10
    ld   e, d
    ldi  [hl], a
    ld    hl, sp+$00
    ld   e, [hl]
    ldi  [hl], a
    ld    hl, sp+$08
    ld   e, h
    ldi  [hl], a
    ld   [label_66200], sp
    ldi  [hl], a
    ld   [label_66008], sp
    ldi  [hl], a
    nop
    db   $10 ; Undefined instruction

label_67004::
    ldi  [hl], a
    ld    hl, sp+$00
    ld   d, h

label_67008::
    ldi  [hl], a
    ld    hl, sp+$08
    ld   d, d
    ldi  [hl], a
    ld   [label_65800], sp
    ldi  [hl], a
    ld   [label_65608], sp
    ldi  [hl], a
    nop
    ld    hl, sp+$50
    ld   [bc], a
    ld    hl, sp+$00
    ld   d, d
    ld   [bc], a
    ld    hl, sp+$08
    ld   d, h
    ld   [bc], a
    ld   [label_65600], sp
    ld   [bc], a
    ld   [label_65808], sp
    ld   [bc], a

label_67029::
    ld   a, [$FF00]
    halt
    ld   a, [$FF08]
    halt
    nop
    nop
    ld   a, b
    ld   bc, label_800
    ld   a, b
    ld   hl, $F1F0
    rla
    rla
    and  $FC
    ld   e, a
    rla
    rla
    and  $F0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_66FD9
    add  hl, de
    ld   a, [$FFEE]
    add  a, $04
    ld   [$FFEE], a
    ld   c, $05
    call label_3CE6
    ld   a, [$FFEE]
    add  a, $10
    ld   [$FFEE], a
    ld   hl, label_67029
    ld   c, $04
    call label_3CE6
    call label_67CA2
    ld   a, [$FF98]
    sub  a, $68
    add  a, $04
    cp   $08
    jr   nc, label_670A6
    ld   a, [$FF99]
    sub  a, $50
    add  a, $04
    cp   $08
    jr   nc, label_670A6
    ld   a, [$FF9E]
    cp   $02
    jr   nz, label_670A6
    call label_67D16
    jr   nc, label_670A6
    call label_BFB
    jr   nz, label_670A6
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_670A6
    ld   a, $08
    ld   [$DB95], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    call label_BFB
    ld   [hl], $08

label_670A6::
    jp   label_3D8A

label_670A9::
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    inc  hl
    inc  hl
    inc  hl
    ld   a, $09
    ld   [hl], a
    pop  bc
    call label_C05
    jr   z, label_670C2
    ld   a, $00
    ld   [$FFF1], a

label_670C2::
    call label_6717C
    call label_67CA2
    ld   hl, $C380
    add  hl, bc
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    inc  a
    add  a, [hl]
    call label_3B0C
    call label_67E1B
    add  a, $13
    cp   $26
    jr   nc, label_670F2
    call label_67E0B
    add  a, $13
    cp   $26
    jr   nc, label_670F2
    ld   a, e
    sla  a
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_670F2::
    call label_67CF0
    ret  nc
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  $01
    jr   z, label_67112
    ld   e, $AF
    call label_280D
    and  $3F
    jr   z, label_67114
    ld   e, $FB
    call label_280D
    and  $07
    jr   z, label_67114

label_67112::
    ld   e, $FA

label_67114::
    ld   a, e
    jp   label_2385

label_67118::
    db   $F4 ; Undefined instruction
    nop
    ld   h, h
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [label_366], sp
    inc  b
    nop
    ld   l, b
    inc  bc
    inc  b
    ld   [label_36A], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    ld    hl, sp+$70
    inc  bc
    db   $F4 ; Undefined instruction
    nop
    ld   l, h
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [label_36E], sp
    inc  b
    nop
    ld   [hl], d
    inc  bc
    inc  b
    ld   [label_374], sp
    inc  b
    ld    hl, sp+$7A
    inc  bc
    db   $F4 ; Undefined instruction
    nop
    ld   l, h
    inc  bc
    db   $F4 ; Undefined instruction
    ld   [label_36E], sp
    inc  b
    nop
    ld   a, h
    inc  bc
    inc  b
    ld   [label_374], sp
    inc  b
    db   $10 ; Undefined instruction
    inc  hl
    db   $F4 ; Undefined instruction
    nop
    ld   l, [hl]
    inc  hl
    db   $F4 ; Undefined instruction
    ld   [label_236C], sp
    inc  b
    nop
    ld   [hl], h
    inc  hl
    inc  b
    ld   [label_2372], sp
    inc  b
    db   $10 ; Undefined instruction
    inc  hl
    db   $F4 ; Undefined instruction
    nop
    ld   l, [hl]
    inc  hl
    db   $F4 ; Undefined instruction
    ld   [label_236C], sp
    inc  b
    nop
    ld   [hl], h
    inc  hl
    inc  b
    ld   [label_237C], sp

label_6717C::
    ld   a, [$FFF1]
    rla
    rla
    and  $FC
    ld   e, a
    rla
    rla
    and  $F0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_67118
    add  hl, de
    ld   c, $05
    jp   label_3CE6

label_67193::
    nop
    ld   b, $0C
    inc  de
    add  hl, de
    jr   nz, label_671C0
    inc  l
    inc  sp
    add  hl, sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, b
    ld   b, e
    ld   b, [hl]
    ld   c, c
    ld   c, h
    ld   c, a
    ld   d, d
    ld   d, l
    ld   e, b
    ld   e, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   hl, $C2B0
    add  hl, bc

label_671C0::
    ld   a, [hl]
    cp   $02
    jp   z, label_6787D
    and  a
    jp   nz, label_674D8
    ld   a, [$DB0F]
    cp   $20
    jr   z, label_671FD
    cp   $05
    jr   nc, label_671FD
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  $02
    jr   nz, label_671FD
    ld   a, [$FF98]
    cp   $18
    jr   c, label_671FD
    ld   a, [hl]
    and  a
    jr   nz, label_671F6
    ld   a, [$DB4E]
    and  $02
    jr   nz, label_671FD
    ld   a, $79
    call label_2373
    inc  [hl]
    ret

label_671F6::
    ld   a, [$C19F]
    and  a
    ret  nz
    inc  [hl]
    ret

label_671FD::
    ld   a, [$FF98]
    cp   $38
    jr   nc, label_67215
    cp   $20
    jr   c, label_67215
    ld   hl, $C11E
    set  7, [hl]
    cp   $24
    jr   c, label_67215
    ld   hl, $C11D
    set  7, [hl]

label_67215::
    ld   a, [$DB0F]
    and  a
    ret  z
    ld   e, a
    ld   d, b
    ld   hl, label_67193
    add  hl, de
    ld   a, [hl]
    ld   [$FFE8], a
    ld   a, [$FFF8]
    and  $10
    call label_673BD
    ld   a, [$FFF0]
    rst  0
    ld   b, c
    ld   [hl], d
    ld   d, [hl]
    ld   [hl], d
    ld   h, e
    ld   [hl], d
    sbc  a, e
    ld   [hl], d
    rlca
    ld   [hl], e
    jr   z, label_672AC
    scf
    ld   [hl], e
    ld   [hl], h
    ld   [hl], e
    ld   [hl], l
    ld   [hl], e
    add  a, d
    ld   [hl], e
    ld   a, [$FF98]
    cp   $3C
    jr   c, label_67255
    call label_178E
    call label_CAF
    call label_3B12
    call label_C05
    ld   [hl], $58

label_67255::
    ret
    ld   a, $01
    ld   [$C167], a
    ld   a, [$C146]
    and  a
    jp   z, label_3B12
    ret
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    ret  nz
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [$FFE8]
    sub  a, [hl]
    jr   nc, label_6727A
    ld   a, [$FFE8]
    ld   [hl], a
    jp   label_3B12

label_6727A::
    ld   e, a
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_6729A
    call label_280D
    and  $01
    jr   nz, label_6729A
    ld   a, e
    rra
    rra
    rra
    rra
    and  $0F
    and  a
    jr   nz, label_67294
    ld   a, $01

label_67294::
    add  a, [hl]
    ld   [hl], a
    ld   a, $06
    ld   [$FFF3], a

label_6729A::
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$DB0F]
    cp   $20
    jr   c, label_672C9
    call label_C05

label_672AC::
    ld   [hl], $40
    call label_3B12
    call label_67921
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $01
    ld   a, $56
    ld   [$D368], a

label_672BF::
    xor  a
    ld   [$C167], a
    call label_C00
    ld   [hl], $3F
    ret

label_672C9::
    ld   hl, $DAE9
    cp   $05
    jr   nz, label_672E0
    bit  5, [hl]
    jr   nz, label_672F4
    call label_3B12
    ld   [hl], $06
    ld   a, $23
    ld   [$FFF2], a
    jp   label_672BF

label_672E0::
    cp   $10
    jr   nz, label_672F4
    bit  6, [hl]
    jr   nz, label_672F4
    call label_3B12
    ld   [hl], $06
    ld   a, $23
    ld   [$FFF2], a
    jp   label_672BF

label_672F4::
    ld   a, $1D
    ld   [$FFF2], a
    call label_3B12
    ld   [hl], $05
    call label_C00
    ld   [hl], $3F
    xor  a
    ld   [$C167], a
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    cp   $3E
    jr   nz, label_6731A
    ld   hl, $FFF2
    ld   [hl], $23

label_6731A::
    and  a
    jr   nz, label_67327
    ld   a, $7B
    call label_2373
    call label_3B12
    ld   [hl], $08

label_67327::
    ret
    call label_C00
    ret  nz
    ld   a, $7A
    call label_2373
    call label_3B12
    ld   [hl], $07
    ret
    call label_C00
    jr   nz, label_67373
    call label_3B12
    ld   a, $CF
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   [hl], $48
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $14
    ld   a, $02
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   [hl], $48
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20

label_67373::
    ret
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C00
    ld   [hl], $20
    jp   label_3B12
    call label_C00
    ret  nz
    ld   a, $CF
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   [hl], $48
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $4F
    call label_3B12
    ld   [hl], $07
    ret

label_673A9::
    ld   d, b
    nop
    ld   d, b
    jr   nz, label_673EA
    nop
    inc  a
    jr   nz, label_673EC
    nop
    db   $3A ; ldd  a, [hl]
    jr   nz, label_673D4
    nop
    ld   e, $60
    ld   e, $10
    ld   e, $70

label_673BD::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_673EE
    ld   a, $88
    ld   [$FFEE], a
    ld   a, $80
    ld   [$FFEC], a
    ld   de, label_673A9
    call label_3BC0
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   a, $80
    sub  a, e
    ld   [$FFEC], a

label_673DE::
    ld   de, label_673A9
    call label_3BC0
    ld   a, [$FFEC]
    add  a, $10
    ld   [$FFEC], a

label_673EA::
    cp   $80

label_673EC::
    jr   c, label_673DE

label_673EE::
    call label_C00
    ret  z
    rra
    rra
    rra
    and  $03
    ld   [$FFF1], a
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   a, $80
    sub  a, e
    ld   [$FFEC], a
    ld   a, $78
    ld   [$FFEE], a
    ld   de, label_673AD
    call label_3BC0
    ld   a, $98
    ld   [$FFEE], a
    ld   de, label_673AD
    jp   label_3BC0

label_67418::
    ret  c
    db   $E8 ; add  sp, d
    ld   a, h
    ld   b, b
    ret  c
    ld   a, [$FF7C]
    jr   nz, label_67409

label_67421::
    db   $E8 ; add  sp, d
    ld   a, h
    nop
    db   $E8 ; add  sp, d
    ld   a, [$FF7C]
    ld   h, b
    ld    hl, sp+$F8
    ld   a, h
    nop
    ld    hl, sp+$00
    ld   a, h
    ld   h, b
    ld   [label_67C08], sp
    nop
    ld   [label_67C10], sp
    ld   h, b
    jr   label_67452
    ld   a, h
    nop
    jr   label_6745E
    ld   a, h
    ld   h, b
    jr   z, label_6745A
    ld   a, h
    ld   b, b
    jr   z, label_67466
    ld   a, h
    jr   nz, label_67421
    ld    hl, sp+$7C
    nop
    ret  c
    nop
    ld   a, h
    ld   h, b
    db   $E8 ; add  sp, d
    ld   [$007C], sp
    db   $E8 ; add  sp, d
    db   $10 ; Undefined instruction
    ld   h, b
    ld    hl, sp+$08

label_6745A::
    ld   a, h
    ld   b, b
    ld    hl, sp+$10

label_6745E::
    ld   a, h
    jr   nz, label_67469
    ld    hl, sp+$7C
    ld   b, b
    ld   [label_67C00], sp
    jr   nz, label_67481

label_67469::
    ld    hl, sp+$7C
    nop
    jr   label_6746E

label_6746E::
    ld   a, h
    ld   h, b
    jr   z, label_6747A
    ld   a, h
    nop
    jr   z, label_67486
    ld   a, h
    ld   h, b
    ret  c
    ld   [label_6407C], sp
    ret  c
    db   $10 ; Undefined instruction
    jr   nz, label_67469

label_67481::
    ld    hl, sp+$7C
    ld   b, b
    db   $E8 ; add  sp, d
    nop

label_67486::
    ld   a, h
    jr   nz, label_67481
    ld    hl, sp+$7C
    nop
    ld    hl, sp+$00
    ld   a, h
    ld   h, b
    ld   [label_67C08], sp
    nop
    ld   [label_67C10], sp
    ld   h, b
    jr   label_674A2
    ld   a, h
    ld   b, b
    jr   label_674AE
    ld   a, h
    jr   nz, label_674C9
    ld    hl, sp+$7C
    ld   b, b
    jr   z, label_674A6

label_674A6::
    ld   a, h
    jr   nz, label_67481
    jr   label_67527
    nop
    ret  c
    jr   nz, label_6752B
    ld   h, b
    db   $E8 ; add  sp, d

label_674B1::
    jr   label_6752F
    ld   b, b
    db   $E8 ; add  sp, d
    jr   nz, label_67533
    jr   nz, label_674B1
    ld   [label_6407C], sp
    ld    hl, sp+$10

label_674BE::
    ld   a, h
    jr   nz, label_674C9
    ld    hl, sp+$7C
    ld   b, b
    ld   [label_67C00], sp
    jr   nz, label_674E1

label_674C9::
    db   $E8 ; add  sp, d
    ld   a, h
    ld   b, b
    jr   label_674BE
    ld   a, h
    jr   nz, label_674F9
    db   $E8 ; add  sp, d
    ld   a, h
    nop
    jr   z, label_674C6
    ld   a, h
    ld   h, b

label_674D8::
    ld   a, [$FFF0]
    rst  0
    db   $EB ; Undefined instruction
    ld   [hl], h
    ld   de, label_66F75
    ld   [hl], l

label_674E1::
    ld   b, b
    halt
    halt
    halt

label_674E8::
    halt
    ld   [hl], a
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    jr   z, label_67509
    cp   $30

label_674F9::
    ret  c
    sub  a, $30
    rra
    rra
    rra
    and  $03
    ld   [$FFF1], a
    ld   de, label_673AD
    jp   label_3BC0

label_67509::
    call label_C05
    ld   [hl], $A0
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    jr   nz, label_67526
    ld   [hl], $FF
    ld   a, $1E
    ld   [$FFF3], a
    call label_3B12

label_67526::
    call label_C05
    and  $04

label_6752B::
    ld   e, $E4
    jr   z, label_67531

label_6752F::
    ld   e, $84

label_67531::
    ld   a, e
    ld   [$DB97], a
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_67547
    ld   a, $33
    ld   [$FFF4], a
    call label_280D
    and  $03
    call label_3B0C

label_67547::
    ld   a, [$FFE7]
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    rla
    and  $E0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_67418
    add  hl, de
    ld   c, $0C
    call label_3CE6
    ld   a, $0A
    jp   label_3DA0

label_6756B::
    ld   a, d
    nop
    ld   a, d
    jr   nz, label_675AE
    ld   [bc], a
    ld   [$FFA1], a
    ld   [$C167], a
    call label_67526
    call label_C05
    jr   nz, label_67586
    call label_BFB
    ld   [hl], $28
    jp   label_3B12

label_67586::
    cp   $50
    jr   nc, label_67597
    ld   hl, label_67620
    ld   c, $08
    call label_3CE6
    ld   a, $06
    jp   label_3DA0

label_67597::
    xor  a
    ld   [$FFF1], a
    ld   de, label_6756B
    jp   label_3BC0

label_675A0::
    ld    hl, sp+$00
    ld   l, [hl]
    nop
    ld    hl, sp+$08
    ld   l, [hl]
    jr   nz, label_675A1
    nop
    ld   l, [hl]
    nop
    ld    hl, sp+$08

label_675AE::
    ld   l, [hl]
    jr   nz, label_675B9
    nop
    ld   [hl], b
    nop
    ld   [label_67008], sp
    jr   nz, label_675C1

label_675B9::
    nop
    ld   [hl], b
    nop
    ld   [label_67008], sp
    jr   nz, label_675B9

label_675C1::
    ld    hl, sp+$68
    nop
    ld    hl, sp+$00
    ld   l, d
    nop
    ld    hl, sp+$08
    ld   l, d
    jr   nz, label_675C5
    db   $10 ; Undefined instruction
    jr   nz, label_675D9
    nop
    ld   l, h
    nop
    ld   [label_66C08], sp
    jr   nz, label_675E1

label_675D9::
    nop
    ld   l, h
    nop
    ld   [label_66C08], sp
    jr   nz, label_675D9

label_675E1::
    ld    hl, sp+$62
    nop
    ld    hl, sp+$00
    ld   h, h
    nop
    ld    hl, sp+$08
    ld   h, h
    jr   nz, label_675E5
    db   $10 ; Undefined instruction
    jr   nz, label_675F9
    nop
    ld   h, [hl]
    nop
    ld   [label_66608], sp
    jr   nz, label_67601

label_675F9::
    nop
    ld   h, [hl]
    nop
    ld   [label_66608], sp
    jr   nz, label_675F9

label_67601::
    ld    hl, sp+$5A
    nop
    ld    hl, sp+$00
    ld   e, h
    nop
    ld    hl, sp+$08
    ld   e, h
    jr   nz, label_67605
    db   $10 ; Undefined instruction
    jr   nz, label_67619
    ld    hl, sp+$5E
    nop
    ld   [label_66000], sp
    nop
    ld   [label_66008], sp
    jr   nz, label_67625
    db   $10 ; Undefined instruction
    jr   nz, label_67619
    ld    hl, sp+$56
    nop
    ld    hl, sp+$00
    ld   e, b
    nop
    ld    hl, sp+$08
    ld   e, b
    jr   nz, label_67625
    db   $10 ; Undefined instruction
    jr   nz, label_67639
    ld    hl, sp+$56
    ld   b, b
    ld   [label_65800], sp
    ld   b, b
    ld   [label_65808], sp
    ld   h, b
    ld   [label_65610], sp
    ld   h, b
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFE7]
    and  $0F
    or   $20
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    call label_BFB
    jr   nz, label_6765A
    jp   label_3B12

label_6765A::
    rra
    rra
    and  $0F
    cp   $04
    jr   c, label_67664
    ld   a, $04

label_67664::
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_675A0
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $06
    jp   label_3DA0
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_678F1
    call label_67DBB
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $80
    jr   nz, label_676B0
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $70
    jr   c, label_676B0
    ld   [hl], $70
    ld   a, $17
    ld   [$FFF4], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jp  c, label_3B12
    cpl
    inc  a
    sra  a
    ld   [hl], a

label_676B0::
    ret
    xor  a
    ld   [$C167], a
    call label_678F1
    call label_3B5A
    jr   nc, label_676CA
    call label_3B12
    ld   a, $0F
    ld   [$D368], a
    call label_C05
    ld   [hl], $FF

label_676CA::
    ret
    call label_C05
    and  $08
    ld   e, $E4
    jr   z, label_676D6
    ld   e, $84

label_676D6::
    ld   a, e
    ld   [$DB97], a
    call label_C05
    jr   nz, label_67709
    ld   [hl], $20
    ld   a, $10
    ld   [$D368], a
    ld   a, $9F
    call label_2385
    ld   a, [$DAE9]
    or   $10
    ld   [$DAE9], a
    ld   [$FFF8], a
    ld   a, $02
    ld   [$DB4E], a
    ld   a, $FF
    ld   [$DB93], a
    xor  a
    ld   [$DB0F], a
    ld   [$C167], a
    call label_3B12

label_67709::
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, $04
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, $13
    ld   [hl], a
    call label_3D8A
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    ld   a, $6B
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
    call label_6784F
    jp   label_678EC
    call label_678EC
    ld   a, [$C19F]
    and  a
    ret  nz
    jp   label_67E61
    nop
    inc  b
    ld   [hl], d
    nop
    ld   [rDIV], a
    ld   [hl], d
    nop
    nop
    ld   a, [$FF78]
    jr   nz, label_6775C

label_6775C::
    ld    hl, sp+$78
    ld   b, b
    nop
    db   $10 ; Undefined instruction
    ld   h, b
    nop

label_67764::
    jr   label_677DE
    nop
    ld   a, [$FFE8]
    halt
    ld   a, [$FFF0]
    halt
    ld   a, [$FF18]
    halt
    ld   a, [$FF20]
    halt
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    ld   [hl], h
    jr   nz, label_67764
    inc  d
    ld   [hl], h
    nop
    ld    hl, sp+$04
    ld   [hl], d
    nop
    ret  c

label_67784::
    inc  b
    ld   [hl], d
    nop
    db   $FC ; Undefined instruction

label_67788::
    db   $E8 ; add  sp, d
    ld   a, b
    jr   nz, label_67788

label_6778C::
    ld   a, [$FF78]
    ld   b, b
    db   $FC ; Undefined instruction
    jr   label_6780A
    ld   h, b
    db   $FC ; Undefined instruction
    jr   nz, label_6780E
    nop
    db   $E8 ; add  sp, d
    ld   [rUNKN6], a
    jr   nz, label_67784
    db   $E8 ; add  sp, d
    halt
    db   $E8 ; add  sp, d
    jr   nz, label_67818
    ld   h, b
    db   $E8 ; add  sp, d
    jr   z, label_6781C
    nop
    ld   [$FFF0], a
    ld   [hl], h
    jr   nz, label_6778C
    jr   label_67822
    nop
    nop
    nop
    ld   [hl], h
    jr   nz, label_677B4

label_677B4::
    ld   [$0074], sp
    ld   a, [$FF04]
    ld   [hl], d
    nop
    ret  nc

label_677BC::
    inc  b
    ld   [hl], d
    nop
    ld    hl, sp+$E0
    ld   a, b
    jr   nz, label_677BC
    db   $E8 ; add  sp, d
    ld   a, b
    ld   b, b
    ld    hl, sp+$20
    ld   a, b
    ld   h, b
    ld    hl, sp+$28
    ld   a, b
    nop
    ld   [$FFD8], a
    halt
    ld   [$FFE0], a
    halt
    ld   [$FF28], a
    halt
    ld   [$FF30], a
    halt
    ret  c
    db   $EC ; Undefined instruction
    ld   [hl], h
    jr   nz, label_677BC

label_677E4::
    inc  e
    ld   [hl], h
    nop
    ld    hl, sp+$FC
    ld   [hl], h
    jr   nz, label_677E4
    inc  c
    ld   [hl], h
    nop
    nop
    ld    hl, sp+$76
    jr   nz, label_677F4

label_677F4::
    nop
    halt
    nop
    ld   [label_66076], sp
    nop
    db   $10 ; Undefined instruction
    nop
    db   $E4 ; Undefined instruction
    inc  b
    ld   [hl], d
    nop
    nop
    ld    hl, sp+$78
    jr   nz, label_67808

label_67808::
    nop
    ld   a, b

label_6780A::
    ld   b, b
    nop

label_6780C::
    ld   [label_66078], sp
    nop
    db   $10 ; Undefined instruction
    nop
    db   $F4 ; Undefined instruction

label_67814::
    ld   a, [$FF76]
    jr   nz, label_6780C

label_67818::
    ld    hl, sp+$76
    ld   b, b
    db   $F4 ; Undefined instruction

label_6781C::
    db   $10 ; Undefined instruction
    ld   h, b
    db   $F4 ; Undefined instruction

label_67820::
    jr   label_67898

label_67822::
    nop
    db   $EC ; Undefined instruction
    ld    hl, sp+$74
    jr   nz, label_67814
    db   $10 ; Undefined instruction
    nop
    ld   a, [$FFD8]
    ld   a, b
    jr   nz, label_67820
    ld   [$FF78], a
    ld   b, b
    ld   a, [$FF28]
    ld   a, b
    ld   h, b
    ld   a, [$FF30]
    ld   a, b
    nop
    call z, label_674E8
    jr   nz, label_6780C
    jr   nz, label_678B6
    nop

label_67843::
    ld   c, a
    ld   [hl], a
    ld   a, a
    ld   [hl], a
    or   a
    ld   [hl], a
    rst  $38
    ld   [hl], a

label_6784B::
    inc  c
    ld   c, $12
    ld   de, $ECF0
    sub  a, $00
    ld   [$FFEC], a
    ld   a, [$FFE7]
    rra
    rra
    nop
    push af
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_6784B
    add  hl, de
    ld   c, [hl]
    pop  af
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, label_67843
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    call label_3CE6
    ld   a, $10
    jp   label_3DA0

label_67879::
    ld   a, [hl]
    nop
    ld   a, [hl]
    jr   nz, label_6784B
    dec  b
    inc  c
    ret  nz
    ld   de, label_67879
    call label_3BC0
    call label_67DBB
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $80
    jr   nz, label_678CB
    ld   hl, $C210
    add  hl, bc

label_67898::
    ld   a, [hl]
    cp   $70
    jr   c, label_678CB
    ld   [hl], $70
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    call label_3B5A
    jr   nc, label_678CB
    ld   a, $01
    ld   [$FFF3], a
    call label_67E61
    ld   hl, $DAE9
    ld   a, [$DB0F]

label_678B6::
    cp   $05
    jr   nz, label_678BE
    set  5, [hl]
    jr   label_678C0

label_678BE::
    set  6, [hl]

label_678C0::
    add  a, $01
    daa
    ld   [$DB0F], a
    ld   a, $EF
    call label_2385

label_678CB::
    ret

label_678CC::
    ld    hl, sp+$00
    ld   d, d
    nop
    ld    hl, sp+$08
    ld   d, d
    jr   nz, label_678DD

label_678D5::
    nop
    ld   d, h
    nop
    ld   [label_65408], sp
    jr   nz, label_678D5

label_678DD::
    nop
    ld   d, h
    ld   b, b
    ld    hl, sp+$08
    ld   d, h
    ld   h, b
    ld   [label_65200], sp
    ld   b, b
    ld   [label_65208], sp
    ld   h, b

label_678EC::
    ld   hl, label_678DC
    jr   label_678F4

label_678F1::
    ld   hl, label_678CC

label_678F4::
    ld   c, $04
    call label_3CE6
    ld   a, $02
    jp   label_3DA0

label_678FE::
    sbc  a, b
    ld   d, b
    adc  a, l
    ld   l, h
    ld   l, [hl]
    ld   l, h
    ld   l, [hl]
    ld   l, h
    ld   l, [hl]
    ld   l, h
    ld   l, [hl]
    ld   l, h
    ld   l, [hl]
    ld   l, h
    ld   l, [hl]
    ld   l, h
    ld   l, [hl]
    sbc  a, b
    ld   d, c
    adc  a, l
    ld   l, l
    ld   l, a
    ld   l, l
    ld   l, a
    ld   l, l
    ld   l, a
    ld   l, l
    ld   l, a
    ld   l, l
    ld   l, a
    ld   l, l
    ld   l, a
    ld   l, l
    ld   l, a
    nop

label_67921::
    push bc
    ld   c, $23
    ld   a, $22
    ld   [$D600], a
    ld   hl, $D601
    ld   de, label_678FE

label_6792F::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_6792F
    pop  bc
    ld   a, $89
    ld   [$D729], a
    ld   [$D739], a
    ld   [$D749], a
    ld   [$D759], a
    ld   [$D769], a
    ld   [$D779], a
    ld   [$D789], a
    ret

label_6794E::
    db   $FC ; Undefined instruction
    inc  b
    nop
    nop

label_67952::
    rst  $38
    nop
    nop
    nop

label_67956::
    nop
    nop
    inc  b
    db   $FC ; Undefined instruction

label_6795A::
    nop
    nop
    nop

label_6795D::
    rst  $38
    inc  c
    jr   label_67985
    jr   nc, label_6799F
    ld   c, b
    ld   a, [$C124]
    cp   $04
    jr   nc, label_6796C
    ret

label_6796C::
    ld   a, [$C125]
    ld   e, a
    ld   d, $00
    ld   hl, label_6794E
    add  hl, de
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, label_67952
    add  hl, de
    ld   a, [hl]
    ld   [$FFD8], a
    ld   hl, label_67956
    add  hl, de
    ld   a, [hl]

label_67985::
    ld   [$FFD9], a
    ld   hl, label_6795A
    add  hl, de
    ld   a, [hl]
    ld   [$FFDA], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    rl   d
    ld   [hl], a
    ld   hl, $C220
    add  hl, bc
    ld   a, [$FFD8]
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FFD9]
    add  a, [hl]
    rl   d
    ld   [hl], a
    ld   hl, $C230
    add  hl, bc
    ld   a, [$FFDA]
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ld   a, [$FFEB]
    cp   $7F
    jr   nz, label_679CF
    ld   hl, $C440
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   [hl], a
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [$FFD9]
    add  a, [hl]
    ld   [hl], a
    jp   label_67A74

label_679CF::
    cp   $87
    jr   nz, label_67A0F
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_67A74
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE6], a
    ld   a, $06

label_679E6::
    ld   [$FFE8], a
    ld   e, a
    ld   d, b
    ld   hl, label_6795D
    add  hl, de
    push hl
    ld   a, [$FFE6]
    sub  a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFD7]
    add  a, [hl]
    ld   [hl], a
    ld   a, [$FFE6]
    pop  hl
    sub  a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFD9]
    add  a, [hl]
    ld   [hl], a
    ld   a, [$FFE8]
    dec  a
    jr   nz, label_679E6

label_67A0F::
    cp   $C1
    jr   nz, label_67A33
    ld   a, [$DB73]
    and  a
    jr   z, label_67A74
    ld   e, $10
    ld   hl, $D155

label_67A1E::
    ld   a, [$FFD7]
    add  a, [hl]
    ldi  [hl], a
    dec  e
    jr   nz, label_67A1E
    ld   e, $10
    ld   hl, $D175

label_67A2A::
    ld   a, [$FFD9]
    add  a, [hl]
    ldi  [hl], a
    dec  e
    jr   nz, label_67A2A
    jr   label_67A74

label_67A33::
    cp   $69
    jr   z, label_67A64
    cp   $B0
    jr   z, label_67A64
    cp   $6D
    jr   nz, label_67A74
    ld   a, [$DB56]
    cp   $01
    jr   nz, label_67A4C
    ld   a, [$FFE7]
    and  $07
    jr   z, label_67A74

label_67A4C::
    ld   e, $06
    ld   hl, $D100

label_67A51::
    ld   a, [$FFD7]
    add  a, [hl]
    ldi  [hl], a
    dec  e
    jr   nz, label_67A51
    ld   e, $06
    ld   hl, $D110

label_67A5D::
    ld   a, [$FFD9]
    add  a, [hl]
    ldi  [hl], a
    dec  e
    jr   nz, label_67A5D

label_67A64::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [$FFD9]
    add  a, [hl]
    ld   [hl], a

label_67A74::
    ld   a, [$FFF6]
    ld   hl, $C3E0
    add  hl, bc
    cp   [hl]
    ret  z
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    cp   $A0
    jr   nc, label_67A8F
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    cp   $78
    ret  c

label_67A8F::
    ld   a, [$FFEB]
    cp   $A7
    ret  z
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret
    ld   a, [$C1A5]
    and  a
    ret  z
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$FFE7]
    and  $03
    sla  a
    add  a, $B6
    ld   l, a
    ld   a, $7A
    adc  a, $00
    ld   h, a
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    jp   [hl]
    cp   [hl]
    ld   a, d
    db   $DB
    ld   a, d
    ld    hl, sp+$7A
    inc  b
    ld   a, e
    ld   hl, $DCCF
    ld   de, $DCCF
    db   $3A ; ldd  a, [hl]
    push af
    db   $3A ; ldd  a, [hl]
    push af
    ld   c, $07

label_67ACA::
    db   $3A ; ldd  a, [hl]
    ld   [de], a
    dec  de
    db   $3A ; ldd  a, [hl]
    ld   [de], a
    dec  de
    dec  c
    jr   nz, label_67ACA
    pop  hl
    pop  bc
    ld   a, b
    ld   [de], a
    dec  de
    ld   a, h
    ld   [de], a
    ret
    ld   hl, $DCD0
    ld   de, $DCD0
    ld   a, [hli]
    push af
    ld   a, [hli]
    push af
    ld   c, $07

label_67AE7::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_67AE7
    pop  hl
    pop  bc
    ld   a, b
    ld   [de], a
    inc  de
    ld   a, h
    ld   [de], a
    ret
    ld   hl, $DCE0
    ld   e, $10

label_67AFD::
    rlc  [hl]
    inc  hl
    dec  e
    jr   nz, label_67AFD
    ret
    ld   hl, $DCF0
    ld   e, $10

label_67B09::
    rrc  [hl]
    inc  hl
    dec  e
    jr   nz, label_67B09
    ret

label_67B10::
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   d, $00
    db   $FC ; Undefined instruction
    inc  c
    ld   d, $00
    ld   c, $FB
    ld   d, $00
    inc  c
    dec  c
    ld   d, $00
    ei
    db   $FD ; Undefined instruction
    ld   d, $00
    ld   a, [label_160B]
    nop
    dec  bc
    db   $FC ; Undefined instruction
    ld   d, $00
    add  hl, bc
    inc  c
    ld   d, $00
    db   $FD ; Undefined instruction
    cp   $16
    nop
    db   $FC ; Undefined instruction
    ld   a, [bc]
    ld   d, $00
    dec  bc
    db   $FD ; Undefined instruction
    ld   d, $00
    ld   [label_160A], sp
    nop
    rst  $38
    nop
    ld   d, $00
    nop
    ld   [$0016], sp
    ld   a, [bc]
    rst  $38
    ld   d, $00
    ld   [label_1609], sp
    nop

label_67B50::
    ld   [bc], a
    db   $FC ; Undefined instruction
    jr   z, label_67B54

label_67B54::
    ei
    inc  b
    jr   z, label_67BB8
    dec  b
    ld   b, $28
    nop
    ld   bc, label_280A
    jr   nz, label_67B62
    rst  $38

label_67B62::
    jr   z, label_67B64

label_67B64::
    ld   sp, hl
    inc  b
    jr   z, label_67BC8
    ld   [label_2806], sp
    nop
    ld   [bc], a
    rlca
    jr   z, label_67B90
    nop
    nop
    jr   z, label_67B94
    ld    hl, sp+$02
    jr   z, label_67BD8
    inc  b
    inc  b
    jr   z, label_67B9C
    ld   a, [bc]
    rlca
    jr   z, label_67BA0
    cp   $01
    jr   z, label_67BA4
    inc  b
    ld   bc, label_66028
    inc  b
    dec  b
    jr   z, label_67BAC
    inc  c
    rlca
    jr   z, label_67BB0

label_67B90::
    db   $FD ; Undefined instruction
    nop
    jr   z, label_67BB4

label_67B94::
    inc  b
    cp   $28
    ld   h, b
    ld   [label_2808], sp
    jr   nz, label_67BAB
    add  hl, bc
    jr   z, label_67BC0

label_67BA0::
    db   $FC ; Undefined instruction
    rst  $38
    jr   z, label_67BA4

label_67BA4::
    inc  b
    ld   a, [label_64028]
    ld   [label_2809], sp

label_67BAB::
    jr   nz, label_67BBC
    ld   a, [bc]
    jr   z, label_67BB0

label_67BB0::
    ei
    cp   $28
    nop

label_67BB4::
    inc  bc
    ld   sp, hl
    jr   z, label_67BF8

label_67BB8::
    ld   [label_280C], sp
    nop

label_67BBC::
    ld   de, label_280B
    nop

label_67BC0::
    ld   a, [label_28FD]
    nop
    ld   bc, label_28F7
    ld   b, b

label_67BC8::
    add  hl, bc
    dec  c
    jr   z, label_67BCC

label_67BCC::
    rrca
    inc  c
    jr   z, label_67BD0

label_67BD0::
    ld   [bc], a
    db   $FC ; Undefined instruction
    jr   z, label_67BDA
    ei
    inc  b
    jr   z, label_67C3E

label_67BD8::
    dec  b
    ld   b, $28
    ld   b, $01
    ld   a, [bc]
    jr   z, label_67C06
    ld   bc, label_28FF
    ld   b, $F9
    inc  b
    jr   z, label_67C4E
    ld   [label_2806], sp
    ld   b, $02
    rlca
    jr   z, label_67C16
    nop
    nop
    jr   z, label_67C1A
    ld    hl, sp+$02
    jr   z, label_67C5E

label_67BF8::
    inc  b
    inc  b
    jr   z, label_67C22
    ld   a, [bc]
    rlca
    jr   z, label_67C26

label_67C00::
    cp   $01
    jr   z, label_67C2A
    inc  b
    ld   bc, label_66628

label_67C08::
    inc  b
    dec  b
    jr   z, label_67C32
    inc  c
    rlca
    jr   z, label_67C36

label_67C10::
    db   $FD ; Undefined instruction
    nop
    jr   z, label_67C3A
    inc  b
    cp   $28
    ld   h, [hl]
    ld   [label_2808], sp
    ld   h, $0E
    add  hl, bc
    jr   z, label_67C46
    db   $FC ; Undefined instruction
    rst  $38

label_67C22::
    jr   z, label_67C2A
    inc  b
    ld   a, [label_64628]
    ld   [label_2809], sp
    ld   h, $0F
    ld   a, [bc]
    jr   z, label_67C36
    ei
    cp   $28
    ld   b, $03
    ld   sp, hl

label_67C36::
    jr   z, label_67C7E
    ld   [label_280C], sp
    ld   b, $11
    dec  bc

label_67C3E::
    jr   z, label_67C46
    ld   a, [label_28FD]
    ld   b, $01
    rst  $30

label_67C46::
    jr   z, label_67C8E
    add  hl, bc
    dec  c
    jr   z, label_67C52
    rrca
    inc  c

label_67C4E::
    jr   z, label_67C56
    ld   a, [$FFF1]

label_67C52::
    cp   $FF
    jr   z, label_67C6D

label_67C56::
    cp   $01
    jr   z, label_67C6D
    ld   a, [$FFD7]
    and  $0C

label_67C5E::
    sla  a
    sla  a
    ld   e, a
    ld   d, b
    ld   hl, label_67B10
    add  hl, de
    ld   c, $04
    jp   label_3CE6

label_67C6D::
    inc  a
    jr   nz, label_67C8D
    ld   [$FFF1], a
    ld   a, [$FFE7]
    xor  c
    rra
    ret  c
    ld   a, [$FFFE]
    and  a
    jr   z, label_67C8D
    ld   a, [$DBA5]
    and  a
    jr   nz, label_67C8D
    ld   a, [$FFF6]
    cp   $32
    jr   nz, label_67C8D
    ld   hl, label_67BD0
    jr   label_67C90

label_67C8D::
    ld   hl, label_67B50

label_67C90::
    ld   a, [$FFD7]
    and  $1C
    xor  $1C
    sla  a
    sla  a
    ld   e, a
    ld   d, b
    add  hl, de
    ld   c, $04
    jp   label_3CE6

label_67CA2::
    call label_3B5A
    jr   nc, label_67CCE
    call label_CBE
    ld   a, [$C1A6]
    and  a
    jr   z, label_67CC1
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_67CC1
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_67CC1::
    ld   a, [$C14A]
    ld   e, a
    call label_CB6
    call label_178E
    ld   a, e
    scf
    ret

label_67CCE::
    and  a
    ret

label_67CD0::
    ld   b, $04
    ld   [bc], a
    nop

label_67CD4::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_67CD0
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

label_67CF0::
    ld   e, b
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $28

label_67CFB::
    jr   nc, label_67D3B
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_67D3B
    inc  e
    push de
    call label_67E3A
    ld   a, [$FF9E]
    xor  $01
    cp   e
    pop  de
    jr   nz, label_67D3B

label_67D16::
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_67D3B
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_67D3B
    ld   a, [$FFCC]
    and  $10
    jr   z, label_67D3B
    scf
    ret

label_67D3B::
    and  a
    ret

label_67D3D::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_67D6C

label_67D43::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_67D6C
    cp   $01
    jr   z, label_67D59
    cp   $0B
    jr   nz, label_67D6C
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_67D6C

label_67D59::
    ld   hl, $C1A8
    ld   a, [$C19F]
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_67D6C
    ld   a, [$C124]
    and  a
    jr   z, label_67D6D

label_67D6C::
    pop  af

label_67D6D::
    ret

label_67D6E::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_67DB7
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
    call label_67DB8
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_67DAA
    call label_3B23

label_67DAA::
    ld   hl, $C250
    add  hl, bc
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af

label_67DB7::
    ret

label_67DB8::
    call label_67DC5

label_67DBB::
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_67DC5
    pop  bc
    ret

label_67DC5::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_67DF0
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_67DDD::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_67DE7
    ld   e, $F0

label_67DE7::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_67DF0::
    ret

label_67DF1::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_67DF0
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310

label_67E09::
    jr   label_67DDD

label_67E0B::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_67E19
    inc  e

label_67E19::
    ld   d, a
    ret

label_67E1B::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   nz, label_67E29
    inc  e

label_67E29::
    ld   d, a
    ret
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $FFEC
    sub  a, [hl]
    bit  7, a
    jr   nz, label_67E38
    inc  e

label_67E38::
    ld   d, a
    ret

label_67E3A::
    call label_67E0B
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_67E47
    cpl
    inc  a

label_67E47::
    push af
    call label_67E1B
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_67E55
    cpl
    inc  a

label_67E55::
    pop  de
    cp   d
    jr   nc, label_67E5D
    ld   a, [$FFD7]
    jr   label_67E5F

label_67E5D::
    ld   a, [$FFD8]

label_67E5F::
    ld   e, a
    ret

label_67E61::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   [hl], e
    ld   a, [hl]
    add  a, h
    ld   a, [hl]
    sub  a, e
    ld   a, [hl]
    call label_C05
    ld   [hl], $A0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF

label_67E7E::
    ld   hl, $C2C0
    add  hl, bc
    inc  [hl]
    ret
    call label_C05
    ret  nz
    ld   [hl], $C0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    jp   label_67E7E
    call label_C05
    jr   nz, label_67EA1
    call label_C4B
    call label_27DD
    jp   label_3F50

label_67EA1::
    jp   label_67EA4

label_67EA4::
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
    jp   label_67EC4

label_67EC4::
    call label_67D43
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
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
    jr   z, label_67EF9
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F0
    jr   label_67F05

label_67EF9::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C310
    add  hl, de
    ld   [hl], $08

label_67F05::
    call label_67E61
    ld   hl, $FFF4
    ld   [hl], $1A
    ret

label_67F0E::
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, label_67F23
    cp   $06
    jr   c, label_67F23
    inc  d

label_67F23::
    add  hl, de
    ld   a, [hl]
    or   $20
    ld   [hl], a
    ld   [$FFF8], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
