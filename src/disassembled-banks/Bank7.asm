section "bank7",romx,bank[$07]

label_1C000::
    ld   a, $04
    ld   [$FFF4], a
    ret

label_1C005::
    ld   hl, $C250
    add  hl, bc
    ret

label_1C00A::
    ld   a, h
    ld   [bc], a
    ld   a, [hl]
    ld   [bc], a
    ld   a, [hl]
    ldi  [hl], a
    ld   a, h
    ldi  [hl], a

label_1C012::
    db   $F4 ; Undefined instruction
    ld   d, $F6
    ld   d, $F0
    rla
    db   $F2 ; Undefined instruction
    rla

label_1C01A::
    db   $F4 ; Undefined instruction
    ld   d, $F6
    ld   d, $F0
    ld   d, $F2
    ld   d, $21
    or   b
    jp   nz, label_1FE09
    cp   $02
    jp   z, label_1C1F0
    and  a
    jr   nz, label_1C053
    inc  [hl]
    ld   a, [$FFEE]
    rla
    rla
    and  $40
    push af
    ld   hl, $C430
    add  hl, bc
    or   [hl]
    ld   [hl], a
    pop  af
    sla  a
    ld   hl, $C350
    add  hl, bc
    or   [hl]
    ld   [hl], a
    ld   a, [$FFEE]
    rra
    rra
    rra
    rra
    and  $01
    ld   hl, $C440
    add  hl, bc
    ld   [hl], a

label_1C053::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [$FFEC]
    sub  a, [hl]
    ld   [$FFEC], a
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    ld   de, label_1C012
    ld   a, [$DBA5]
    and  a
    jr   z, label_1C06F
    ld   de, label_1C01A

label_1C06F::
    call label_3BC0
    call label_3D8A
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1C08A
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    ld   de, label_1C00A
    call label_3BC0

label_1C08A::
    call label_1FD96
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $04
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]

label_1C098::
    and  a

label_1C099::
    jr   z, label_1C0C1
    ld   [hl], b
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    xor  $01
    call label_3B0C
    ld   hl, $C3A0
    add  hl, bc
    ld   [hl], $05
    ld   hl, $FFF4
    ld   [hl], $05
    call label_C00
    ld   [hl], $1F
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    add  a, $02
    ld   [hl], a
    jp   label_1C198

label_1C0C1::
    call label_C56
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    sub  a, $40
    cp   c
    ld   b, c

label_1C0CE::
    db   $10 ; Undefined instruction
    nop
    nop

label_1C0D2::
    nop
    nop
    ld   a, [$FF10]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], b
    call label_C05
    jr   nz, label_1C128
    call label_1FE6D
    add  a, $08
    cp   $10
    jr   c, label_1C0F9
    push de
    call label_1FE5D
    add  a, $08
    pop  de
    cp   $10
    jr   nc, label_1C128
    ld   a, e
    cp   $02
    jr   z, label_1C128

label_1C0F9::
    call label_3B12
    call label_1FE7D
    ld   d, b
    ld   hl, label_1C0CE
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1C0D2
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    ld   hl, $C340
    add  hl, bc
    res  7, [hl]
    ld   hl, $C350
    add  hl, bc
    res  2, [hl]
    call label_3AEA
    call label_C05
    ld   [hl], $30
    ret

label_1C128::
    ld   hl, $C340
    add  hl, bc
    set  7, [hl]
    ld   hl, $C350
    add  hl, bc
    set  2, [hl]
    call label_3AEA
    call label_3B5A
    ret  nc
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_1C14E
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_1C15A
    ret

label_1C14E::
    ld   a, [$DB01]
    cp   $03
    ret  nz
    ld   a, [$FFCC]
    and  $10
    jr   z, label_1C1B8

label_1C15A::
    ld   a, [$C3CF]
    and  a
    ret  nz
    inc  a
    ld   [$C3CF], a
    call label_3B12
    ld   [hl], $02
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $07
    ld   hl, $C390
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C490
    add  hl, bc
    ld   [hl], b
    ld   a, [$FF9E]
    ld   [$C15D], a
    call label_C05
    ld   [hl], $02
    ld   hl, $FFF3
    ld   [hl], $02
    ld   hl, $C3A0
    add  hl, bc
    ld   [hl], $05
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    xor  $01
    call label_3B0C

label_1C198::
    ld   a, $BB
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
    ld   [hl], $02
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $40

label_1C1B8::
    ret
    call label_C05
    jr   nz, label_1C1C8

label_1C1BE::
    call label_C05
    ld   [hl], $20
    call label_3B12
    ld   [hl], b
    ret

label_1C1C8::
    call label_1FE0A
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1C1BE
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $04
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1C1E6::
    ld   a, [$FFF4]

label_1C1E8::
    nop
    inc  c
    db   $10 ; Undefined instruction
    nop
    db   $F4 ; Undefined instruction
    ld   a, [$FFF4]

label_1C1F0::
    ld   de, label_1C00A
    call label_3BC0
    call label_1FD96
    call label_1FDC3
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_1FE0A
    call label_3B23
    call label_3B39
    call label_C05
    jr   nz, label_1C233
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1C1E8
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1C1E6
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a

label_1C233::
    ret

label_1C234::
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
    halt
    db   $FC ; Undefined instruction
    ld   a, [$FF64]
    ld   bc, $F8FC
    ld   h, [hl]
    ld   bc, $0000
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $F0FC
    ld   h, h
    ld   bc, $F8FC
    ld   h, [hl]
    ld   bc, $0000
    ld   [hl], h
    ld   bc, label_800
    halt
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_1C5F7
    and  a
    jr   nz, label_1C2C4
    inc  [hl]
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    ld   a, $B8
    call label_3B86
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    add  a, $06
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    add  a, $10
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C350
    add  hl, de
    ld   [hl], $AC
    push bc
    ld   c, e
    ld   b, d
    call label_3AEA
    pop  bc

label_1C2C4::
    ld   a, [$FFF0]
    cp   $06
    jr   nc, label_1C2DC
    ld   a, [$C19F]
    and  a
    jr   z, label_1C2DC
    ld   a, [$FFF1]
    cp   $03
    ld   a, $02
    jr   nz, label_1C2DA
    ld   a, $04

label_1C2DA::
    ld   [$FFF1], a

label_1C2DC::
    call label_1C594
    ld   a, [$FFF0]
    cp   $0A
    jr   c, label_1C2E8
    call label_1C3FD

label_1C2E8::
    call label_1FD96
    ld   a, [$DC0C]
    bit  0, a
    jp   z, label_1C328
    bit  7, a
    jp   nz, label_1C328
    ld   a, [$DB0E]
    cp   $0D
    jp  c, label_1C328
    ld   a, [$FFF0]
    cp   $02
    jr   c, label_1C309
    call label_1C34E

label_1C309::
    ld   a, [$FFF0]
    rst  0
    dec  [hl]
    ld   b, e
    ld   d, [hl]
    ld   b, e
    ld   [hl], e
    ld   b, e
    ld   [hl], a
    ld   b, e
    add  a, d
    ld   b, e
    adc  a, h
    ld   b, e
    add  hl, bc
    ld   b, l
    xor  l
    ld   b, e
    push bc
    ld   b, e
    ld   a, [de]
    ld   b, h
    ld   d, h
    ld   b, h
    ld   d, h
    ld   b, h
    ld   [hl], l
    ld   b, h
    sbc  a, c
    ld   b, h

label_1C328::
    ld   a, [$FFF0]
    rst  0
    or   b
    ld   b, h
    db   $E8 ; add  sp, d
    ld   b, h
    add  hl, bc
    ld   b, l
    scf
    ld   b, l
    adc  a, e
    ld   b, l
    ld   hl, $C3A0

label_1C338::
    ld   a, [hli]
    cp   $FA
    jr   z, label_1C342
    ld   a, l
    and  $0F
    jr   nz, label_1C338

label_1C342::
    ld   a, l
    dec  a
    and  $0F
    ld   hl, $C390
    add  hl, bc
    ld   [hl], a
    jp   label_3B12

label_1C34E::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ret
    call label_1FD43
    jp   nc, label_1C4DC
    ld   a, [$FF9D]
    cp   $06
    jp   nz, label_1C4DC
    call label_1C34E
    ld   a, $02
    call label_3B0C
    ld   a, $25

label_1C36D::
    call label_2373
    jp   label_3B12
    ld   a, $E9
    jr   label_1C36D
    call label_C05
    ld   [hl], $40
    call label_3B12
    jp   label_1C4DC
    call label_1C4DC
    call label_C05
    ret  nz
    jp   label_3B12
    call label_1C4DC
    ld   hl, $C390
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    cp   $2A
    ret  nz
    ld   a, $08
    ld   hl, $C290
    add  hl, de
    ld   [hl], a
    call label_C05
    ld   [hl], $C0
    jp   label_3B12
    ld   a, [$FFE7]
    and  $07
    ret  nz
    ld   hl, $C390
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, $C210
    add  hl, de
    dec  [hl]
    ld   a, [hl]
    cp   $50
    ret  nc
    jp   label_3B12
    ld   hl, $C390
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1C3D7
    ld   hl, $C200
    add  hl, de
    inc  [hl]

label_1C3D7::
    ld   a, [$FFE7]
    and  $01
    ret  nz
    ld   hl, $C210
    add  hl, de
    dec  [hl]
    ld   e, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $02
    cp   e
    ret  c
    ld   a, $24
    call label_2373
    ld   a, $04
    call label_3B0C
    call label_C05
    ld   [hl], $50
    jp   label_3B12

label_1C3FD::
    push bc
    ld   bc, $C010
    ld   a, [$FF99]
    ld   [$FFD7], a
    ld   a, [$FF98]
    ld   [$FFD8], a
    ld   a, $06
    ld   [$FFD9], a
    ld   h, $F0
    ld   l, $FC
    call label_1819
    pop  bc
    ld   a, $6C
    ld   [$FF9D], a
    ret
    ld   a, $04
    call label_3B0C
    call label_C05
    jr   nz, label_1C429
    ld   [hl], $30
    call label_3B12

label_1C429::
    ld   a, [$FFF0]
    cp   $0C
    jr   c, label_1C436
    call label_1C005
    ld   a, [hl]
    bit  7, a
    ret  z

label_1C436::
    ld   hl, $C390
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $1A
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ret
    call label_1C429
    call label_C05
    ret  nz
    ld   [hl], $10
    ld   a, $04
    call label_3B0C
    call label_3B12
    ld   a, [hl]
    cp   $0C
    ret  nz
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $F8
    call label_1C005
    ld   [hl], $F8
    ret
    call label_1C429
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    cp   $4C
    jr   c, label_1C491
    call label_1C8FD
    ld   a, $17
    call label_2373
    ld   a, $04
    call label_3B0C
    jp   label_3B12

label_1C491::
    call label_1FE0A
    call label_1C005
    inc  [hl]
    ret
    call label_1C429
    ld   a, $40
    ld   [$FFF4], a
    ld   a, $16
    ld   [$DB95], a
    xor  a
    ld   [$DB96], a
    ld   [$C16B], a
    ld   [$C16C], a
    ret
    call label_1FD43
    jr   nc, label_1C4DC
    ld   a, [$FF9D]
    cp   $58
    jr   c, label_1C4BF
    cp   $5E
    jr   c, label_1C4DC

label_1C4BF::
    ld   a, [$DB0E]
    cp   $0B
    jr   nz, label_1C4CE
    ld   a, $E8
    call label_2373
    jp   label_3B12

label_1C4CE::
    cp   $0C
    jr   nc, label_1C4D7
    ld   a, $E7
    jp   label_2373

label_1C4D7::
    ld   a, $ED
    jp   label_2373

label_1C4DC::
    ld   a, [$FFE7]
    and  $30
    ld   e, b
    jr   z, label_1C4E4
    inc  e

label_1C4E4::
    ld   a, e
    jp   label_3B0C
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_1C503
    ld   a, $01
    ld   [$DB7F], a
    ld   [$C167], a
    call label_C05
    ld   [hl], $D0
    ld   a, $E9
    jp   label_2373

label_1C503::
    ld   [hl], b
    ld   a, $EA
    jp   label_2373
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $01
    ld   [$C10B], a
    call label_C05
    jr   nz, label_1C521
    ld   [hl], $20
    ld   a, $EB
    call label_2373
    call label_3B12

label_1C521::
    ld   e, $03
    cp   $30
    jr   c, label_1C533
    cp   $80
    jr   nc, label_1C4DC
    ld   a, [$FFE7]
    and  $18
    ld   e, b
    jr   z, label_1C533
    inc  e

label_1C533::
    ld   a, e
    jp   label_3B0C
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    jr   nz, label_1C586
    ld   [$C10B], a
    call label_3B12
    ld   a, $54
    call label_3B86
    ld   a, [$FFD7]
    sub  a, $20
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   [$FFEE], a
    ld   a, [$FFD8]
    add  a, $08
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   [$FFEC], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $20
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01
    push bc
    ld   c, e
    ld   b, d
    ld   a, $0A
    call label_3BAA
    pop  bc
    call label_1C8FD
    ld   a, $08
    ld   [$FFF2], a
    ld   a, $0C
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a

label_1C586::
    ld   a, $03
    jp   label_3B0C
    ld   a, $02
    ld   [$FFA1], a
    call label_3B12
    ld   [hl], b
    ret

label_1C594::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_1C234
    add  hl, de
    ld   c, $04
    jp   label_3CE6
    cp   $FE
    cp   $FE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   bc, $0101
    ld   bc, label_201
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
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0000
    rst  $38
    cp   $FE
    ld   bc, $0101
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
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    ld   bc, $0101
    cp   $FE
    rst  $38
    nop
    nop
    ld   bc, label_202

label_1C5EF::
    nop
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   bc, label_2100
    ret  nc
    jp   label_1FE09
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1C5EF
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, [$C290]
    cp   $0C
    jr   nc, label_1C61A
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$C210], a

label_1C61A::
    call label_1C67B
    call label_3B5A
    jr   nc, label_1C640
    ld   a, [$FF9B]
    and  $80
    jr   nz, label_1C640
    call label_1FE6D
    add  a, $08
    bit  7, a
    jr   z, label_1C640
    ld   a, [$FFEC]
    sub  a, $0F
    ld   [$FF99], a
    ld   a, $02
    ld   [$FF9B], a
    ld   a, $01
    ld   [$C147], a

label_1C640::
    call label_1FD96
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $07
    jr   nz, label_1C666
    ld   e, $48
    ld   a, [$C147]
    and  a
    jr   z, label_1C657
    ld   e, $4B

label_1C657::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, e
    jr   z, label_1C666
    and  $80
    jr   z, label_1C665
    inc  [hl]
    inc  [hl]

label_1C665::
    dec  [hl]

label_1C666::
    ret

label_1C667::
    nop
    ld    hl, sp+$68
    ld   [bc], a
    nop
    nop
    ld   l, d
    ld   [bc], a
    nop
    ld   [label_26A], sp
    nop
    db   $10 ; Undefined instruction
    ld   [bc], a
    nop
    jr   label_1C6E6
    ld   [bc], a

label_1C67B::
    ld   hl, label_1C667
    ld   c, $05
    jp   label_3CE6

label_1C683::
    ld   [hl], d
    ld   hl, label_2170
    ld   [hl], b
    ld   bc, label_172
    halt
    ld   a, b
    ld   bc, label_2178
    halt

label_1C693::
    ld   [hl], h
    nop
    ld   [hl], h
    jr   nz, label_1C70C
    db   $10 ; Undefined instruction
    jr   nc, label_1C69C

label_1C69C::
    db   $FC ; Undefined instruction
    ld   a, d
    ld   bc, label_400
    ld   a, h
    ld   bc, label_C00
    ld   a, [hl]
    ld   bc, $FC00
    ld   a, [hl]
    ld   hl, label_400
    ld   a, h
    ld   hl, label_C00
    ld   a, d
    ld   hl, $0000
    ld   bc, label_202
    ld   [bc], a
    ld   bc, label_2100
    ret  nc
    jp   nz, label_1FE09
    and  a
    jp   nz, label_1C90F
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_1C6E4
    ld   a, [$FFF8]
    and  $20
    jr   z, label_1C6D2
    inc  [hl]
    ret

label_1C6D2::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1C6B3
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a

label_1C6E4::
    ld   a, [$FFF1]

label_1C6E6::
    cp   $04
    jr   c, label_1C702
    sub  a, $04
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_1C69B
    add  hl, de
    ld   c, $03
    call label_3CE6
    jr   label_1C70B

label_1C702::
    ld   de, label_1C683
    call label_3BC0
    call label_3D8A

label_1C70B::
    ld   a, [$FFF0]
    cp   $05
    jr   z, label_1C715
    cp   $03
    jr   nc, label_1C727

label_1C715::
    ld   a, [$FFEC]
    add  a, $0B
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    ld   de, label_1C693
    call label_3BC0
    call label_3D8A

label_1C727::
    ld   a, [$FFF0]
    cp   $07
    jr   c, label_1C734
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a

label_1C734::
    call label_1FD96
    ld   a, [$FFF0]
    rst  0
    ld   d, b
    ld   b, a
    ld   e, c
    ld   b, a
    xor  [hl]
    ld   b, a
    or   c
    ld   b, a
    reti
    ld   b, a
    push af
    ld   b, a
    ld   a, [bc]
    ld   c, b
    ld   h, a
    ld   c, b
    adc  a, [hl]
    ld   c, b
    or   b
    ld   c, b
    jp   z, label_2148
    or   b
    jp   nz, label_3609
    jr   nc, label_1C71A
    ld   [de], a
    dec  sp
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    call label_1FE5D
    ld   a, e
    call label_3B0C
    call label_1FCF0
    call label_1FE5D
    add  a, $12
    cp   $24
    jr   nc, label_1C793
    call label_1FE6D
    add  a, $12
    cp   $24
    jr   nc, label_1C793
    ld   a, [$FF9C]
    and  a
    jr   z, label_1C793
    call label_3B12
    call label_C05
    ld   [hl], $14
    ld   a, $F1
    jp   label_2373

label_1C793::
    call label_1FD43
    ret  nc
    ld   a, [$DB0E]
    cp   $0C
    jr   nz, label_1C7A9
    ld   a, $F2
    call label_2373
    call label_3B12
    ld   [hl], $05
    ret

label_1C7A9::
    ld   a, $F0
    jp   label_2373
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C05
    jr   nz, label_1C7C8
    ld   [hl], $40
    call label_1C8FD
    call label_3B12
    ld   a, $FF
    jp   label_3B0C

label_1C7C8::
    ld   e, $FF
    cp   $10
    jr   nc, label_1C7D5
    ld   e, $02
    cp   $08
    jr   c, label_1C7D5
    inc  e

label_1C7D5::
    ld   a, e
    jp   label_3B0C
    call label_C05
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   [$FFEE], a
    call label_3B12
    ld   [hl], $01
    jp   label_1C8FD
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_1C804
    call label_C05
    ld   [hl], $C0
    ret

label_1C804::
    ld   [hl], b
    ld   a, $F4
    jp   label_2373
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C05
    jr   z, label_1C854
    cp   $70
    jr   nz, label_1C820
    dec  [hl]
    push af
    ld   a, $F3
    call label_2373
    pop  af

label_1C820::
    cp   $90
    jr   nz, label_1C83A
    ld   a, [$FF99]
    sub  a, $03
    ld   [$FFD8], a
    ld   a, [$FF98]
    ld   [$FFD7], a
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, $01
    call label_CC7
    call label_C05

label_1C83A::
    ld   e, $00
    cp   $20
    jr   c, label_1C846
    cp   $90
    jr   nc, label_1C846
    ld   e, $01

label_1C846::
    ld   a, e
    ld   [$FF9C], a
    ld   hl, $FFA1
    ld   [hl], $02
    ld   a, $04
    ld   [$C13B], a
    ret

label_1C854::
    ld   a, $0D
    ld   [$DB0E], a
    ld   [$FFA5], a
    call label_C0C
    call label_3B12
    call label_C05
    ld   [hl], $30
    ret
    call label_C05
    ret  nz
    call label_3B12
    ld   a, [$FFF1]
    add  a, $04
    call label_3B0C
    ld   e, $08
    cp   $04
    jr   nz, label_1C87D
    ld   e, $F8

label_1C87D::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_1C8FD
    jp   label_1F33F
    call label_1FE0A
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_1C8AF
    ld   [hl], b
    call label_3B12
    call label_1C8FD
    call label_C05
    ld   [hl], $10

label_1C8AF::
    ret
    call label_C05
    jr   nz, label_1C8BF
    ld   [hl], $20
    ld   a, $FF
    call label_3B0C
    jp   label_3B12

label_1C8BF::
    ld   e, $02
    cp   $08
    jr   nc, label_1C8C6
    inc  e

label_1C8C6::
    ld   a, e
    jp   label_3B0C
    call label_C05
    ret  nz
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jr   nz, label_1C8E0
    xor  a
    ld   [$FFA1], a
    ld   [$C167], a
    jp   label_1FEA4

label_1C8E0::
    inc  [hl]
    call label_280D
    and  $01
    call label_3B0C
    ld   e, $10
    and  a
    jr   z, label_1C8F0
    ld   e, $F0

label_1C8F0::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    call label_3B12
    ld   [hl], $07
    ret

label_1C8FD::
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, $01
    call label_CC7
    ld   a, $0E
    ld   [$FFF2], a
    ret

label_1C90F::
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    inc  hl
    ld   a, $0A
    ldi  [hl], a
    ld   a, $FC
    ldi  [hl], a
    ld   a, $10
    ld   [hl], a
    pop  bc
    ld   a, [$FFF0]
    rst  0
    ld   l, $49
    ld   b, l
    ld   c, c
    ld   e, c
    ld   c, c
    add  a, d
    ld   c, c
    call label_1FD96
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $58
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $80
    ld   a, [$C130]
    and  a
    ret  z
    jp   label_3B12
    call label_1FD96
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_1C005
    ld   [hl], $FC
    call label_1C8FD
    jp   label_3B12
    call label_1C9DC
    call label_1FD96
    call label_1FE0A
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_1C977
    ld   [hl], b
    call label_3B12

label_1C977::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_1FCF0
    call label_1FE5D
    ld   a, e
    add  a, $02
    ld   [$FFF1], a
    call label_1C9DC
    call label_1FD96
    call label_1FD43
    ret  nc
    ld   a, $F7
    jp   label_2373

label_1C99C::
    ld   a, [$FF00]
    ld   [hl], b
    ld   bc, label_8F0
    ld   [hl], d
    ld   bc, $0000
    ld   [hl], h
    ld   bc, label_800
    halt
    ld   a, [$FF00]
    ld   [hl], d
    ld   hl, label_8F0
    ld   [hl], b
    ld   hl, $0000
    halt
    nop
    ld   [label_2174], sp
    ld   a, [$FFFF]
    ld   [hl], d
    ld   hl, label_7F0
    ld   [hl], b
    ld   hl, $0000
    ld   a, d
    ld   hl, label_800
    ld   a, b
    ld   hl, label_1F0
    ld   [hl], b
    ld   bc, label_9F0
    ld   [hl], d
    ld   bc, $0000
    ld   a, b
    ld   bc, label_800
    ld   a, d
    ld   bc, $F1F0
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_1C99C
    add  hl, de
    ld   c, $04
    jp   label_3CE6

label_1C9EF::
    ld   l, [hl]
    jr   nz, label_1CA5E
    jr   nz, label_1CA60
    nop
    ld   l, [hl]
    nop

label_1C9F7::
    ld   [hl], b
    nop
    ld   [hl], d
    ld   bc, $0074
    halt
    ld   a, b
    nop
    ld   a, d
    ld   bc, $007C
    halt

label_1CA07::
    ld   [hl], d
    jr   nz, label_1CA7A
    ld   hl, label_2076
    ld   [hl], h
    ld   hl, label_207A
    ld   a, b
    ld   hl, label_2076
    ld   a, h
    ld   hl, label_17E
    ld   a, [hl]
    ld   hl, $A5FA
    db   $DB
    and  a
    jr   z, label_1CA69
    ld   a, [$DB0E]
    cp   $08
    jr   nc, label_1CA30
    ld   a, [$DB67]
    and  $02
    jp   nz, label_1FEA4

label_1CA30::
    ld   de, label_1CA07
    ld   a, [$DB0E]
    cp   $08
    jr   nc, label_1CA43
    call label_1FE5D
    ld   a, e
    ld   [$FFF1], a
    ld   de, label_1C9EF

label_1CA43::
    call label_3BC0
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_1FCF0
    call label_1FD43
    ret  nc
    ld   a, [$DB0E]
    cp   $08
    jr   nc, label_1CA64
    ld   a, $27
    jp   label_2385

label_1CA64::
    ld   a, $76
    jp   label_2373

label_1CA69::
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_1FEA4
    ld   de, label_1C9F7
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1CA7E
    ld   de, label_1CA07

label_1CA7E::
    call label_3BC0
    ld   a, [$DB0E]
    cp   $08
    jr   nc, label_1CAA0
    ld   a, [$FFEE]
    add  a, $10
    ld   [$FFEE], a
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    ld   de, label_1CA17
    call label_3BC0
    call label_3D8A

label_1CAA0::
    call label_1FD96
    call label_1FCF0
    ld   a, [$FFF0]
    rst  0
    or   e
    ld   c, d
    di
    ld   c, d
    inc  e
    ld   c, e
    ld   d, b
    ld   c, e
    ld   e, e
    ld   c, e
    call label_1FE5D
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    add  a, $24
    cp   $48
    jr   nc, label_1CAE9
    call label_1FE6D
    add  a, $24
    cp   $48
    jr   nc, label_1CAE9
    call label_1FD43
    jr   nc, label_1CAE5
    ld   a, [$DB0E]
    cp   $07
    ld   a, $70
    jr   z, label_1CADA
    ld   a, $77

label_1CADA::
    call label_2373
    call label_3B12
    ld   a, $01
    ld   [$C167], a

label_1CAE5::
    xor  a
    jp   label_3B0C

label_1CAE9::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    ld   a, [$C177]
    and  a
    jr   nz, label_1CB0E
    ld   a, [$DB0E]
    cp   $07
    jr   nz, label_1CB0E
    ld   a, $72
    call label_2373
    call label_3B12
    call label_C05
    ld   [hl], $C0
    ret

label_1CB0E::
    ld   a, $71
    call label_2373
    xor  a
    ld   [$C167], a
    call label_3B12
    ld   [hl], b
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_1CB44
    call label_C05
    jr   nz, label_1CB3B
    ld   [$C10B], a
    ld   a, $73
    call label_2373
    ld   a, $08
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    jp   label_3B12

label_1CB3B::
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $01
    ld   [$C10B], a

label_1CB44::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $02
    jp   label_3B0C
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C0C
    jp   label_3B12
    call label_1CB44
    call label_1FD43
    ret  nc
    xor  a
    ld   [$C167], a
    ld   a, $75
    jp   label_2373

label_1CB6B::
    ld   a, [label_1F000]
    inc  bc
    ld   a, [label_1F208]
    inc  bc
    ld   a, [label_1F410]
    inc  bc
    ld   a, [label_1F018]
    inc  hl
    ld   a, [bc]
    nop
    halt
    ld   a, [bc]
    ld   [label_378], sp
    ld   a, [bc]
    db   $10 ; Undefined instruction
    inc  hl
    ld   a, [bc]
    jr   label_1CC00
    inc  hl

label_1CB8B::
    ld   a, [label_1F000]
    inc  bc
    ld   a, [label_1F408]
    inc  hl
    ld   a, [label_1F210]
    inc  hl
    ld   a, [label_1F018]
    inc  hl
    ld   a, [bc]
    nop
    halt
    ld   a, [bc]
    ld   [label_378], sp
    ld   a, [bc]
    db   $10 ; Undefined instruction
    inc  hl
    ld   a, [bc]
    jr   label_1CC20
    inc  hl

label_1CBAB::
    ld   a, [hl]
    rlca

label_1CBAD::
    ld   a, d
    ld   bc, label_17C

label_1CBB1::
    ld   a, h
    ld   hl, label_217A
    xor  a
    ld   [$FFF1], a
    ld   a, $4A
    ld   [$FFEC], a
    ld   de, label_1CBAD
    call label_3BC0
    ld   a, $68
    ld   [$FFEE], a
    ld   de, label_1CBB1
    call label_3BC0
    ld   a, [$DB0E]
    cp   $06
    jr   nz, label_1CBE1
    ld   a, $74
    ld   [$FFEE], a
    ld   a, $38
    ld   [$FFEC], a
    ld   de, label_1CBAB
    call label_3C77

label_1CBE1::
    call label_3D8A
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, label_1CB6B
    and  a
    jr   z, label_1CBF2
    ld   hl, label_1CB8B

label_1CBF2::
    ld   c, $08
    call label_3CE6
    ld   a, $06
    call label_3DA0
    xor  a
    call label_3B0C

label_1CC00::
    call label_1FD96
    ld   a, [$FFE7]
    and  $20
    call label_3B0C
    call label_1FCF0
    ld   a, [$FFF0]
    rst  0
    ld   d, $4C
    ld   c, c
    ld   c, h
    ld   [hl], b
    ld   c, h
    call label_1FD36
    ret  nc
    ld   e, $D3
    ld   a, [$D8FD]
    and  $30
    jr   nz, label_1CC45
    ld   a, [$DB0E]
    cp   $06
    jr   nz, label_1CC32
    ld   a, $CF
    call label_1CC83
    jp   label_3B12

label_1CC32::
    ld   e, $D4
    ld   a, [$DB73]
    and  a
    jr   nz, label_1CC45
    ld   e, $CE
    ld   a, [$DB0E]
    cp   $07
    jr   nz, label_1CC45

label_1CC43::
    ld   e, $D2

label_1CC45::
    ld   a, e
    jp   label_1CC83
    ld   a, [$C19F]
    and  a
    jr   nz, label_1CC6F
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   z, label_1CC5E
    ld   [hl], b
    ld   a, $D1
    jp   label_1CC83

label_1CC5E::
    ld   a, $07
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    call label_C0C
    call label_C05
    ld   [hl], $70

label_1CC6F::
    ret
    call label_C05
    jr   nz, label_1CC82
    ld   a, [$C19F]
    and  a
    jr   nz, label_1CC82
    call label_1CC43
    call label_3B12
    ld   [hl], b

label_1CC82::
    ret

label_1CC83::
    ld   e, a
    ld   a, [$FF99]
    push af
    ld   a, $10
    ld   [$FF99], a
    ld   a, e
    call label_2373
    pop  af
    ld   [$FF99], a
    ret

label_1CC93::
    ld   [hl], b
    ld   bc, label_2170
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_1FEA4
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_1CD84
    ld   a, c
    ld   [$D201], a
    call label_C05
    and  $20
    jr   z, label_1CCB6
    ld   hl, $FFEE
    dec  [hl]

label_1CCB6::
    ld   de, label_1CC93
    call label_3BC0
    call label_1FD96
    ld   a, [$FFF0]
    rst  0
    call z, label_1F4C
    ld   c, l
    daa
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, [hl]
    ld   c, l
    ld   a, [$DB7F]
    cp   $02
    jr   nz, label_1CCE7
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $10
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $10
    call label_3B12
    ld   [hl], $04
    ret

label_1CCE7::
    xor  a
    ld   [$D202], a
    call label_3B12

label_1CCEE::
    ld   a, $B3
    call label_3B86
    jr   c, label_1CD1D
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01
    ld   hl, $C240
    add  hl, de
    ld   [hl], $0E
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C1
    ld   hl, $C350
    add  hl, de
    ld   [hl], $00
    and  a
    ret

label_1CD1D::
    scf
    ret
    ld   a, [$D202]
    and  a
    jp   nz, label_3B12
    ret
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jp   z, label_3B12
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1CD4C
    call label_1CCEE
    jr   c, label_1CD4C
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    ld   hl, $C3D0
    add  hl, de
    ld   [hl], a
    ld   hl, $C240
    add  hl, de
    ld   [hl], b

label_1CD4C::
    ret
    ret
    call label_C05
    ret  nz
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    call label_3B5A
    ret  nc
    xor  a
    ld   [$DB7F], a
    ld   a, $06
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    call label_C0C
    jp   label_1FEA4

label_1CD80::
    ld   [hl], d
    nop
    ld   [hl], d
    ld   b, b

label_1CD84::
    ld   de, label_1CD80
    call label_3C77
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    call label_3B0C
    call label_1FD96
    ld   a, [$FFF0]
    rst  0
    and  l
    ld   c, l
    dec  h
    ld   c, [hl]
    adc  a, h
    ld   c, [hl]

label_1CD9F::
    ld   bc, label_10FF
    ld   a, [$FF0B]
    push af
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_1CDEA
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1CD9F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_1CDA1
    add  hl, de
    cp   [hl]
    jr   nz, label_1CDCB
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_1CDCB::
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1CD9F
    add  hl, de
    ld   a, [hl]
    call label_1C005
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_1CDA3
    add  hl, de
    cp   [hl]
    jr   nz, label_1CDEA
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_1CDEA::
    call label_1FE0A
    ld   a, [$D202]
    and  a
    jp   nz, label_3B12
    ret

label_1CDF5::
    ld   a, [$FFE8]
    db   $E8 ; add  sp, d
    ld   [$FFE0], a
    ret  c
    db   $10 ; Undefined instruction
    jr   label_1CE1F
    jr   nz, label_1CE29
    nop
    ld    hl, sp+$08
    ld    hl, sp+$08
    nop
    nop
    ld   [label_8F8], sp
    ld    hl, sp+$00

label_1CE0D::
    nop
    ld    hl, sp+$08
    ld    hl, sp+$08
    nop
    nop
    ld   [label_8F8], sp
    ld    hl, sp+$00
    db   $10 ; Undefined instruction
    jr   label_1CE3D
    jr   nz, label_1CE47

label_1CE1F::
    ld   a, [$FFE8]
    db   $E8 ; add  sp, d
    ld   [$FFE0], a
    ret  c
    ld   a, $22
    ld   [$FFF2], a

label_1CE29::
    ld   a, [$D204]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jp   z, label_1FEA4
    ld   a, [$FFE7]
    and  $07
    ld   hl, $C3D0
    add  hl, bc
    cp   [hl]
    jr   nz, label_1CE89
    ld   a, [$D204]
    ld   e, a
    ld   d, b

label_1CE47::
    ld   hl, $C380
    add  hl, de
    ld   a, [hl]
    ld   e, a
    ld   hl, $C3D0
    add  hl, bc
    rla
    rla
    and  $FC
    add  a, e
    add  a, e
    add  a, [hl]
    ld   e, a
    ld   d, b
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    push bc
    ld   a, [$D204]
    ld   c, a
    ld   hl, label_1CDF5
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    add  a, [hl]
    ld   [$FF98], a
    ld   hl, label_1CE0D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    add  a, [hl]
    ld   [$FF99], a
    pop  bc
    ld   a, $24
    call label_3BAA
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a

label_1CE89::
    jp   label_1FE0A
    ret

label_1CE8D::
    ld   e, d
    ldi  [hl], a
    ld   e, b
    ldi  [hl], a
    ld   e, [hl]
    ldi  [hl], a
    ld   e, h
    ldi  [hl], a
    ld   e, b
    ld   [bc], a
    ld   e, d
    ld   [bc], a
    ld   e, h
    ld   [bc], a
    ld   e, [hl]
    ld   [bc], a
    ld   d, h
    ld   [bc], a
    ld   d, [hl]
    ld   [bc], a
    ld   d, [hl]
    ldi  [hl], a
    ld   d, h
    ldi  [hl], a
    ld   d, b
    ld   [bc], a
    ld   d, d
    ld   [bc], a
    ld   d, d
    ldi  [hl], a
    ld   d, b
    ldi  [hl], a
    ld   [hl], h
    ld   [bc], a
    halt
    ld   a, c
    ld   [$D204], a
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1CEC5
    inc  [hl]
    ld   a, [$FFF8]
    and  $40
    jp   nz, label_1FEA4

label_1CEC5::
    ld   a, [$DB67]
    and  $02
    jp   z, label_1FEA4
    ld   de, label_1CE8D
    call label_3BC0
    call label_1FD96
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_1CEEE
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_1CEEE::
    ld   a, [$FFF0]
    rst  0
    rst  $38
    ld   c, [hl]
    rra
    ld   c, a
    ld   d, [hl]
    ld   c, a
    add  a, $4F
    ld   c, [hl]
    ld   d, b
    or   h
    ld   d, b
    db   $E3 ; Undefined instruction
    ld   d, b
    ld   a, $02
    call label_3B0C
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $60
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $58
    call label_1FCF0
    call label_1FD43
    ret  nc
    ld   a, $C0
    call label_2373
    jp   label_3B12
    call label_1FCF0
    ld   a, [$C19F]
    and  a
    jr   nz, label_1CF4D
    ld   a, [$C177]
    and  a
    jr   nz, label_1CF44
    ld   a, $02
    ld   [$DB7F], a
    ld   hl, $D887
    set  6, [hl]
    call label_C05
    ld   [hl], $A0
    ld   a, $01
    ld   [$FFF2], a
    jp   label_3B12

label_1CF44::
    ld   a, $C2
    call label_2373
    call label_3B12
    ld   [hl], b

label_1CF4D::
    ret

label_1CF4E::
    ld   a, b
    ld   bc, $00FF
    ld   a, d
    ld   bc, label_17C
    ld   a, $01
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    cp   $30
    jr   c, label_1CF7B
    xor  a
    ld   [$FFF1], a
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a
    ld   de, label_1CF4E
    call label_3BC0
    call label_3D8A
    ld   a, $08
    jp   label_3B0C

label_1CF7B::
    cp   $18
    jr   nc, label_1CFA5
    ld   a, $02
    ld   [$FF9E], a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $FE
    call label_1C005
    ld   [hl], $F4
    call label_1FE0A
    call label_C05
    jr   nz, label_1CFA5
    ld   a, $34
    ld   [$D368], a
    ld   [$FFB0], a
    call label_C05
    ld   [hl], $C0
    jp   label_3B12

label_1CFA5::
    ld   a, $01
    ld   [$FFF1], a
    ld   a, [$FFEE]
    sub  a, $0C
    ld   [$FFEE], a
    ld   de, label_1CF4E
    call label_3BC0
    call label_3D8A
    call label_C05
    rra
    rra
    rra
    rra
    and  $01
    add  a, $02
    jp   label_3B0C
    ld   a, $01
    ld   [$FFA1], a
    call label_C05
    jr   nz, label_1CFD4
    ld   [hl], $0C
    call label_3B12

label_1CFD4::
    call label_C05
    cp   $20
    jr   nz, label_1CFE5
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    call label_1F33F
    xor  a

label_1CFE5::
    cp   $60
    jr   nz, label_1CFED
    ld   hl, $D202
    inc  [hl]

label_1CFED::
    cp   $A0
    jr   nz, label_1CFFC
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $A0

label_1CFFC::
    and  $20
    jr   z, label_1D012
    ld   a, $01
    ld   [$FFF1], a
    ld   a, [$FFEE]
    sub  a, $0E
    ld   [$FFEE], a
    ld   a, [$FFEC]
    sub  a, $08
    ld   [$FFEC], a
    jr   label_1D01B

label_1D012::
    xor  a
    ld   [$FFF1], a
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a

label_1D01B::
    ld   de, label_1CF4E
    call label_3BC0
    call label_3D8A
    call label_C05
    ld   e, $02
    and  $20
    jr   z, label_1D02E
    inc  e

label_1D02E::
    ld   a, e
    jp   label_3B0C

label_1D032::
    jr   nz, label_1D034

label_1D034::
    ld   [rJOYP], a

label_1D036::
    nop
    ld   [rJOYP], a
    jr   nz, label_1D03B

label_1D03B::
    ld   [bc], a
    ld   bc, label_1603
    jr   z, label_1D069
    jr   z, label_1D06B
    jr   z, label_1D06D
    jr   z, label_1D06F
    jr   z, label_1D071
    jr   z, label_1D04B

label_1D04B::
    ld   [bc], a
    inc  b
    ld   b, $3E
    ld   bc, $A1E0
    call label_C05
    jr   nz, label_1D06E
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $0B
    jp   z, label_3B12
    ld   e, a
    ld   d, b
    ld   hl, label_1D03D
    add  hl, de

label_1D069::
    ld   e, [hl]
    call label_C05

label_1D06D::
    ld   [hl], e

label_1D06E::
    ld   hl, $C3D0

label_1D071::
    add  hl, bc
    ld   a, [hl]
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1D032
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1D036
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    ld   hl, label_1D03A
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    call label_1FE7D
    ld   a, e
    xor  $01

label_1D09A::
    ld   [$FF9E], a
    call label_1FE0A
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1D04A
    add  hl, de
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    or   [hl]
    jp   label_3B0C
    ld   a, $01
    ld   [$FFA1], a
    ld   hl, $C380
    add  hl, bc
    ld   a, $01
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $E4
    call label_1C005
    ld   [hl], $08
    call label_1FE0A
    ld   a, [$FFEE]
    cp   $C0
    jr   c, label_1D0DF
    cp   $C4
    jp   nc, label_1D0DF
    xor  a
    ld   [$C167], a
    call label_3B12

label_1D0DF::
    ld   a, $01
    jr   label_1D09A
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    inc  [hl]
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    add  a, $10
    ld   [hl], a
    ld   hl, $C310
    add  hl, de
    ld   [hl], $10
    jp   label_1FEA4

label_1D104::
    ld   b, b
    ld   [bc], a
    ld   b, b
    ldi  [hl], a
    ld   b, d
    ld   [bc], a
    ld   b, d
    ldi  [hl], a
    ld   de, label_1D104
    call label_3BC0
    call label_1FD96
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFF0]
    rst  0
    cpl
    ld   d, c
    ld   a, h
    ld   d, c

label_1D127::
    ld   [$00F8], sp
    nop

label_1D12B::
    nop
    nop
    ld    hl, sp+$08
    call label_1FCF0
    jr   nc, label_1D16E
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_1D16E
    ld   a, $01
    ld   [$C144], a
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $10
    jr   nz, label_1D173
    call label_3B12
    call label_1FE7D
    ld   hl, $C380
    add  hl, bc
    ld   a, e
    xor  $01
    ld   e, a
    ld   [hl], e

label_1D159::
    ld   d, b
    ld   hl, label_1D127
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1D12B
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    ret

label_1D16E::
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b

label_1D173::
    ret

label_1D174::
    db   $10 ; Undefined instruction
    nop
    nop

label_1D178::
    nop
    nop
    ld   a, [$FF10]
    ld   a, $01
    ld   [$FFA1], a
    ld   a, $3E
    ld   [$FFF2], a
    ld   a, [$FFCC]
    and  $0F
    ld   d, a
    jr   z, label_1D1AA
    and  $03
    jr   z, label_1D198
    ld   e, $00
    and  $01
    jr   nz, label_1D196
    inc  e

label_1D196::
    jr   label_1D19F

label_1D198::
    ld   e, $02
    bit  2, d
    jr   nz, label_1D19F
    inc  e

label_1D19F::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  e
    cp   $01
    jr   z, label_1D1AA
    ld   [hl], e

label_1D1AA::
    call label_1FE0A
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   hl, $C210
    add  hl, bc
    or   [hl]
    and  $0F
    jp   nz, label_1D29F
    ld   a, [hl]
    sub  a, $10
    ld   [$FFCD], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [$FFCE], a
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFCD]
    and  $F0
    or   e
    ld   e, a
    ld   d, b
    ld   hl, $D711
    add  hl, de
    ld   [hl], $0D
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_1D1F2
    push bc
    ld   a, $0D
    ld   [$DDD8], a
    ld   a, $07
    call label_91D
    pop  bc

label_1D1F2::
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0A
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    ld   a, $12
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $11
    ldi  [hl], a
    ld   a, $13
    ldi  [hl], a
    ld   [hl], b
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    call label_1D159
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1D174
    add  hl, de
    ld   a, [$FFCE]
    add  a, [hl]
    swap a
    and  $0F
    push af
    ld   hl, label_1D178
    add  hl, de
    pop  af
    ld   e, a
    ld   a, [$FFCD]
    add  a, [hl]
    and  $F0
    or   e
    ld   e, a
    ld   d, b
    ld   hl, $D711
    add  hl, de
    ld   e, [hl]
    ld   d, $01
    call label_2A26
    cp   $0B
    jr   z, label_1D29F
    cp   $50
    jr   z, label_1D29F
    cp   $51
    jr   z, label_1D29F
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $2F
    ld   [$FFF2], a
    ld   a, $02
    call label_CC7
    ld   hl, $C520
    add  hl, de
    ld   [hl], $0F
    call label_1FEA4
    ld   a, [$C18E]
    and  $0F
    cp   $0E
    jr   nz, label_1D29F
    push bc
    ld   c, b
    ld   hl, $D700

label_1D287::
    ld   a, [hli]
    push hl
    ld   e, a
    ld   d, $01
    call label_2A26
    pop  hl
    cp   $50
    jr   z, label_1D29E
    cp   $51
    jr   z, label_1D29E
    dec  c
    jr   nz, label_1D287
    call label_C60

label_1D29E::
    pop  bc

label_1D29F::
    ret

label_1D2A0::
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

label_1D2C0::
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

label_1D2E0::
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
    jr   z, label_1D2FB
    cpl
    inc  a

label_1D2FB::
    ld   d, a
    ld   a, [$FFD7]
    bit  7, a
    jr   z, label_1D304
    cpl
    inc  a

label_1D304::
    cp   d
    jr   nc, label_1D314
    sra  a
    sra  a
    add  a, h
    ld   e, a
    ld   d, b
    ld   hl, label_1D2A0
    add  hl, de
    ld   a, [hl]
    ret

label_1D314::
    ld   a, d
    sra  a
    sra  a
    add  a, h
    ld   e, a
    ld   d, b
    ld   hl, label_1D2C0
    add  hl, de
    ld   a, [hl]
    ret
    ld   hl, $C470
    add  hl, bc
    ld   [hl], b
    ld   hl, $C3F0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C400
    add  hl, bc
    ld   [hl], b
    call label_1D453
    call label_1FD96
    call label_C56
    ld   a, [$FFF0]
    rst  0
    ld   c, c
    ld   d, e
    ld   e, d
    ld   d, e
    add  a, e
    ld   d, e
    cp   l
    ld   d, e
    call label_D853
    ld   d, e
    ld   a, [$FFEE]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFEF]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    call label_C05
    jr   nz, label_1D37F
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]
    call label_1FE5D
    add  a, $20
    cp   $40
    jr   nc, label_1D37F
    call label_1FE6D
    add  a, $20
    cp   $40
    jr   nc, label_1D37F
    call label_C05
    ld   [hl], $30
    call label_3B12

label_1D37F::
    xor  a
    jp   label_3B0C
    call label_C05
    jr   nz, label_1D39E
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    call label_3B0C
    call label_C05
    ld   [hl], $18
    ld   hl, $C340
    add  hl, bc
    res  6, [hl]
    jp   label_3B12

label_1D39E::
    cp   $10
    jr   nz, label_1D3B8
    ld   a, $1F
    call label_3BAA
    call label_1D2E0
    sra  a
    add  a, $02
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], a
    ld   a, $18
    call label_3BAA

label_1D3B8::
    ld   a, $01
    jp   label_3B0C
    call label_1FE0A
    call label_C05
    jr   nz, label_1D3CA
    ld   [hl], $20
    call label_3B12

label_1D3CA::
    jp   label_3B39
    call label_C05
    jr   nz, label_1D3D5
    call label_3B12

label_1D3D5::
    jp   label_3B39
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF98], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF99], a
    ld   a, $10
    call label_3BAA
    call label_1FE5D
    add  a, $02
    cp   $04
    jr   nc, label_1D41F
    call label_1FE6D
    add  a, $02
    cp   $04
    jr   nc, label_1D41F
    ld   hl, $C200
    add  hl, bc
    ld   a, [$FF98]
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FF99]
    ld   [hl], a
    xor  a
    call label_3B0C
    call label_3B12
    ld   [hl], $01
    call label_C05
    ld   [hl], $20

label_1D41F::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    call label_1FE0A
    jp   label_3B39

label_1D42B::
    rst  $38
    nop
    rst  $38
    jr   nz, label_1D49C
    ld   [bc], a
    ld   l, h
    ldi  [hl], a
    ld   h, h
    ldi  [hl], a
    ld   h, d
    ldi  [hl], a
    ld   l, b
    ldi  [hl], a
    ld   h, [hl]
    ldi  [hl], a
    ld   h, b
    ld   [bc], a
    ld   h, b
    ldi  [hl], a
    ld   h, [hl]
    ld   [bc], a
    ld   l, b
    ld   [bc], a
    ld   h, d
    ld   [bc], a
    ld   h, h
    ld   [bc], a
    ld   h, [hl]
    ld   b, d
    ld   l, b
    ld   b, d
    ld   h, b
    ld   b, d
    ld   h, b
    ld   h, d
    ld   l, b
    ld   h, d
    ld   h, [hl]
    ld   h, d

label_1D453::
    ld   de, label_1D42B
    call label_3BC0
    ld   a, [$FFF0]
    cp   $03
    ret  c
    ld   a, [$FFEE]
    ld   hl, $C2B0
    add  hl, bc
    sub  a, [hl]
    sra  a
    sra  a
    ld   [$FFD7], a
    ld   [$FFD9], a
    ld   a, [$FFEC]
    ld   hl, $C2C0
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
    ld   a, $03

label_1D48A::
    ld   [$FFDB], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   [de], a
    inc  de
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]

label_1D49C::
    add  a, $04
    ld   [de], a
    inc  de
    ld   a, $6A
    ld   [de], a
    inc  de
    ld   a, $02
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
    jr   nz, label_1D48A
    ld   a, $03
    jp   label_3DA0
    ld   b, h
    add  hl, hl
    add  a, d
    bit  4, h
    pop  bc
    ret  nc
    ld   [hl], h
    ld   l, d
    ld   [hl], $5E
    db   $EC ; Undefined instruction
    push af
    sbc  a, l

label_1D4D0::
    sbc  a, d
    ld   d, $9C
    ld   d, $74
    nop
    halt

label_1D4D8::
    sbc  a, d
    rla
    sbc  a, h
    rla
    sbc  a, d
    rla
    sbc  a, h
    rla
    sbc  a, d
    rla
    sbc  a, h
    rla
    sbc  a, d
    rla
    sbc  a, h
    rla
    sbc  a, d
    inc  d
    sbc  a, h
    inc  d
    sbc  a, d
    inc  d
    sbc  a, h
    inc  d
    sbc  a, d
    rla
    sbc  a, h
    rla
    sbc  a, d
    inc  d
    sbc  a, h
    inc  d
    sbc  a, d
    rla
    sbc  a, h
    rla
    sbc  a, d
    ld   d, $9C
    ld   d, $9A
    rla
    sbc  a, h
    rla
    sbc  a, d
    ld   d, $9C
    ld   d, $9A
    rla
    sbc  a, h
    rla
    sbc  a, d
    rla
    sbc  a, h
    rla
    ld   a, [$DBA5]
    and  a
    jr   nz, label_1D52E
    ld   a, [$FFF6]
    cp   $6B
    jr   z, label_1D528
    cp   $7A
    jr   z, label_1D528
    cp   $8B
    jr   z, label_1D528
    cp   $7B
    jr   nz, label_1D52E

label_1D528::
    ld   a, [$D87B]
    and  $10
    ret  z

label_1D52E::
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_1FEA4
    ld   a, [$FFFE]
    and  a
    jr   z, label_1D55A
    ld   a, [$FFF9]
    and  a
    jr   z, label_1D545
    ld   a, [$FFEC]
    add  a, $02
    ld   [$FFEC], a

label_1D545::
    push hl
    ld   de, label_1D4D8
    ld   a, [$DB0E]
    dec  a
    sla  a
    sla  a
    ld   l, a
    ld   h, $00
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    jr   label_1D572

label_1D55A::
    ld   de, label_1D4D4
    ld   a, [$DB0E]
    cp   $04
    jr   z, label_1D572
    ld   a, [$FFF9]
    and  a
    jr   z, label_1D56F
    ld   a, [$FFEC]
    add  a, $02
    ld   [$FFEC], a

label_1D56F::
    ld   de, label_1D4D0

label_1D572::
    call label_3BC0
    call label_C05
    jr   nz, label_1D59A
    call label_3B5A
    jr   nc, label_1D599
    ld   a, $10
    ld   [$D368], a
    ld   [$C167], a
    ld   a, [$FFBF]
    ld   [$FFB0], a
    call label_C05
    ld   a, $68
    ld   [hl], a
    ld   a, $66
    ld   [$C111], a
    jp   label_CAF

label_1D599::
    ret

label_1D59A::
    cp   $10
    jr   nz, label_1D5BA
    dec  [hl]
    ld   a, [$DB0E]
    ld   e, a
    ld   d, b
    ld   hl, label_1D4C1
    add  hl, de
    ld   a, [hl]
    cp   $9D
    jr   z, label_1D5B1
    cp   $44
    jr   nz, label_1D5B6

label_1D5B1::
    call label_2385
    jr   label_1D5B9

label_1D5B6::
    call label_2373

label_1D5B9::
    xor  a

label_1D5BA::
    dec  a
    jr   nz, label_1D5CD
    xor  a
    ld   [$DB7F], a
    ld   [$C167], a
    call label_1D60D
    or   $20
    ld   [hl], a
    jp   label_1FEA4

label_1D5CD::
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFF6]
    cp   $C9
    jr   nz, label_1D5DF
    ld   a, $04
    ld   [$C13B], a

label_1D5DF::
    ld   hl, $C13B
    ld   a, [$FF99]
    add  a, [hl]
    ld   hl, $C210
    add  hl, bc
    sub  a, $10
    ld   [hl], a
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
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
    ret

label_1D60D::
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, label_1D622
    cp   $06
    jr   c, label_1D622
    inc  d

label_1D622::
    add  hl, de
    ld   a, [hl]
    ret

label_1D625::
    ld   [$00F8], sp
    nop

label_1D629::
    nop
    nop
    ld    hl, sp+$08

label_1D62D::
    ld   d, b
    ld   [bc], a
    ld   d, b
    ldi  [hl], a
    ld   d, d
    ld   [bc], a
    ld   d, d
    ldi  [hl], a
    ld   d, b
    ld   b, d
    ld   d, b
    ld   h, d
    ld   d, d
    ld   b, d
    ld   d, d
    ld   h, d
    ld   d, h
    ld   [bc], a
    ld   d, [hl]
    ld   [bc], a
    ld   e, b
    ld   [bc], a
    ld   e, d
    ld   [bc], a
    ld   d, [hl]
    ldi  [hl], a
    ld   d, h
    ldi  [hl], a
    ld   e, d
    ldi  [hl], a
    ld   e, b
    ldi  [hl], a
    ld   de, label_1D62D
    call label_3BC0
    call label_1D805
    call label_1FD96
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1D66F
    ld   hl, $C290
    add  hl, bc
    ld   a, $01
    ld   [hl], a
    ld   [$FFF0], a
    call label_C05
    ld   [hl], $40

label_1D66F::
    call label_1FDC3
    call label_1FE0A
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1D693
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], b

label_1D693::
    call label_3B23
    ld   a, [$FFF0]
    cp   $02
    jp   z, label_1D77A
    and  a
    jr   z, label_1D6FF
    call label_C05
    jr   z, label_1D6BD
    cp   $0A
    jr   nz, label_1D6B7
    call label_1FE7D
    ld   hl, $C380
    add  hl, bc
    ld   a, e
    cp   [hl]
    jr   nz, label_1D6B7
    call label_1D7B0

label_1D6B7::
    call label_3D7F
    jp   label_1D721

label_1D6BD::
    call label_280D
    and  $1F
    or   $20
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a
    cp   $00
    jr   nz, label_1D6DD
    call label_1FE7D
    jr   label_1D6E0

label_1D6DD::
    call label_280D

label_1D6E0::
    and  $03
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, label_1D625
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1D629
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    jp   label_1D721

label_1D6FF::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   nz, label_1D70D
    call label_C05
    jr   nz, label_1D71E

label_1D70D::
    call label_280D
    and  $0F
    or   $10
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01
    call label_3D7F

label_1D71E::
    call label_1FD1A

label_1D721::
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1D777
    call label_1FE5D
    add  a, $20
    cp   $40
    jr   nc, label_1D777
    call label_1FE6D
    add  a, $20
    cp   $40
    jr   nc, label_1D777
    ld   a, [$DB00]
    cp   $01
    jr   nz, label_1D74A
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_1D757
    jr   label_1D777

label_1D74A::
    ld   a, [$DB01]
    cp   $01
    jr   nz, label_1D777
    ld   a, [$FFCC]
    and  $10
    jr   z, label_1D777

label_1D757::
    call label_1FE7D
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $01
    cp   e
    jr   z, label_1D777
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    ld   a, $10
    call label_3BAA
    call label_3B12
    ld   [hl], $02
    jp   label_1F33F

label_1D777::
    jp   label_3B39

label_1D77A::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    call label_1FE7D
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    call label_1FD1A
    ld   a, [$FFE8]
    and  a
    jr   z, label_1D79F
    call label_3B12
    ld   [hl], $01
    call label_C05
    ld   [hl], $20

label_1D79F::
    ret

label_1D7A0::
    ld   [$00F8], sp
    nop

label_1D7A4::
    nop
    nop
    ld    hl, sp+$08

label_1D7A8::
    jr   nz, label_1D78A
    nop
    nop

label_1D7AC::
    nop
    nop
    ld   [rNR41], a

label_1D7B0::
    ld   a, $0A
    call label_3B86
    jr   c, label_1D7F4
    push bc
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $01
    ld   a, [$FFD9]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    ld   c, a
    ld   hl, label_1D7A0
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_1D7A4
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_1D7A8
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_1D7AC
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    pop  bc
    and  a

label_1D7F4::
    ret

label_1D7F5::
    nop
    db   $FC ; Undefined instruction
    ldi  [hl], a
    ld   b, b
    nop
    inc  c
    ldi  [hl], a
    ld   h, b
    nop
    db   $FC ; Undefined instruction
    ldi  [hl], a
    nop
    nop
    inc  c
    ldi  [hl], a
    jr   nz, label_1D827
    ret  nz
    jp   nz, label_1FE09
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, b
    ld   hl, label_1D7F5
    add  hl, de
    ld   c, $02
    jp   label_3CE6

label_1D81A::
    ld   a, b
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   a, d
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], b
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   a, h

label_1D827::
    ld   [bc], a
    ld   a, [hl]
    ld   [bc], a
    ld   [hl], h
    ld   [bc], a
    halt

label_1D82E::
    ld   [hl], d
    ldi  [hl], a
    ld   a, b
    ldi  [hl], a
    ld   [hl], d
    ldi  [hl], a
    ld   a, d
    ldi  [hl], a
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], b
    ldi  [hl], a
    ld   a, [hl]
    ldi  [hl], a
    ld   a, h
    ldi  [hl], a
    halt
    ld   [hl], h
    ldi  [hl], a
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_1FEA4
    ld   de, label_1D81A
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1D857
    ld   de, label_1D82E

label_1D857::
    call label_3BC0
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1D874
    xor  a
    ld   [$FFF1], a
    ld   a, [$FFEC]
    sub  a, $0E
    ld   [$FFEC], a
    ld   de, label_1D94D
    call label_3BC0
    call label_3D8A

label_1D874::
    call label_1FD96
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1D891
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_1D891::
    ld   a, [$FFF0]
    rst  0
    xor  b
    ld   e, b
    ld   a, [de]
    ld   e, c
    inc  [hl]
    ld   e, c
    ld   d, c
    ld   e, c
    sub  a, a
    ld   e, c
    xor  h
    ld   e, d
    dec  h
    ld   e, e
    ld   l, c
    ld   e, e
    reti
    ld   e, e
    ld   a, [$FF5B]
    ld   a, [$DB56]
    cp   $01
    jr   nz, label_1D8DE
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1D8C9
    call label_1FE5D
    add  a, $18
    cp   $30
    jr   nc, label_1D8DD
    call label_1FE6D
    add  a, $18
    cp   $30
    jr   nc, label_1D8DD

label_1D8C9::
    call label_C05
    ld   [hl], $10
    call label_3B12
    ld   [hl], $05
    ld   a, $60

label_1D8D5::
    call label_2373
    ld   a, $14
    ld   [$C5AB], a

label_1D8DD::
    ret

label_1D8DE::
    call label_1FCF0
    call label_1FD43
    jr   nc, label_1D8FA
    ld   a, [$DB0E]
    cp   $04
    jr   nz, label_1D8F5
    ld   a, $65
    call label_1D8D5
    jp   label_3B12

label_1D8F5::
    ld   a, $61
    call label_1D8D5

label_1D8FA::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1D919
    call label_280D
    and  $01
    jr   nz, label_1D919
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_1D919::
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_1D92E
    call label_C05
    ld   [hl], $10
    ret

label_1D92E::
    ld   [hl], b
    ld   a, $61
    jp   label_1D8D5
    call label_C05
    jr   nz, label_1D948
    ld   [hl], $80
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $80
    ld   a, $01
    ld   [$FFF2], a
    call label_3B12

label_1D948::
    ld   a, $02
    ld   [$FFA1], a
    ret

label_1D94D::
    sbc  a, d
    rla
    sbc  a, h
    rla
    ld   a, $03
    call label_3B0C
    call label_C05
    jr   nz, label_1D96A
    ld   a, $36
    ld   [$D368], a
    ld   [$FFB0], a
    call label_BFB
    ld   [hl], $80
    jp   label_3B12

label_1D96A::
    cp   $10
    jr   nz, label_1D973
    ld   a, $62
    call label_1D8D5

label_1D973::
    ld   a, $02
    ld   [$FFA1], a
    ret

label_1D978::
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b

label_1D97F::
    jr   label_1D9A1
    jr   z, label_1D9B3
    jr   c, label_1D9C5
    ld   c, b

label_1D986::
    nop
    ld   a, b
    jr   z, label_1D9E2
    ld   b, b
    jr   nc, label_1D9ED

label_1D98D::
    nop
    nop
    add  a, b
    add  a, b
    nop
    add  a, b
    nop

label_1D994::
    db   $10 ; Undefined instruction
    jr   nz, label_1D9D6
    ld   [bc], a
    ld   [$FFA1], a
    call label_1D8FA
    call label_BFB

label_1D9A1::
    jr   nz, label_1D9C8
    ld   a, $02
    ld   [$FFF2], a
    ld   a, [$D87B]
    or   $10
    ld   [$D87B], a
    ld   a, $01
    ld   [$DB7F], a
    ld   a, $63
    ld   [$C168], a
    call label_1D8D5
    call label_3B12
    ld   [hl], $05
    ld   hl, $C3D0
    add  hl, bc

label_1D9C5::
    ld   [hl], $06
    ret

label_1D9C8::
    cp   $01
    jr   nz, label_1D9D5
    ld   a, $05
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a

label_1D9D5::
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1DA2A
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $07

label_1D9E2::
    jr   z, label_1DA2A
    ld   a, $AD
    call label_3B86
    jr   c, label_1DA2A
    push bc
    call label_1F33F
    ld   hl, $C2D0
    add  hl, bc
    ld   c, [hl]
    inc  [hl]
    ld   hl, label_1D978
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], a
    ld   hl, label_1D97F
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, de
    ld   [hl], a
    ld   hl, label_1D986
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_1D98D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C290
    add  hl, de
    ld   [hl], $07
    ld   hl, $C300
    add  hl, de
    ld   [hl], $80
    pop  bc

label_1DA2A::
    call label_BFB
    cp   $40
    ret  nc
    ld   a, [$FFE7]
    and  $3F
    ret  nz
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $03
    ret  nc
    ld   e, a
    ld   d, b
    inc  [hl]
    ld   hl, label_1D994
    add  hl, de
    ld   a, [hl]
    ld   [$FFCD], a
    ld   a, $40
    ld   [$FFCE], a
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_1DA5F
    push bc
    ld   a, $DB
    ld   [$DDD8], a
    ld   a, $07
    call label_91D
    pop  bc

label_1DA5F::
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0A
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $0C
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $0D
    ldi  [hl], a
    ld   a, $1D
    ldi  [hl], a
    ld   [hl], b
    ld   hl, $D725
    ld   [hl], $DB
    ld   a, $87
    call label_B2F
    ld   hl, $D735
    ld   [hl], $DB
    ld   a, $87
    call label_B2F
    ld   hl, $D745
    ld   [hl], $DB
    ld   a, $87
    jp   label_B2F
    call label_C05
    jr   nz, label_1DB19
    call label_3B12
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   c, label_1DADE
    call label_280D
    and  $0F
    add  a, $10
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    ld   e, $10
    and  $01
    jr   z, label_1DAD1
    ld   e, $F0

label_1DAD1::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    call label_1C005
    ld   [hl], $F0
    jp   label_1DB08

label_1DADE::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, [$D154]
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
    ld   a, $14
    call label_3BAA
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a

label_1DB08::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   e, $00
    and  $80
    jr   z, label_1DB14
    inc  e

label_1DB14::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_1DB19::
    call label_1D8FA
    call label_C00
    ret  z
    ld   a, $04
    jp   label_3B0C
    call label_1FE0A
    ld   a, [$FFEF]
    cp   $08
    jp  c, label_1FEA4
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   nc, label_1DB3B
    call label_3B23

label_1DB3B::
    ld   a, [$FFE8]
    and  a
    jr   z, label_1DB64
    call label_3B12
    ld   [hl], $05
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   c, label_1DB59
    call label_C05
    ld   [hl], $10
    call label_C00
    ld   [hl], $10
    ret

label_1DB59::
    call label_C05
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a

label_1DB64::
    ld   a, $03
    jp   label_3B0C
    call label_C05
    jr   nz, label_1DBCA
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF98], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF99], a
    ld   hl, $C300
    add  hl, bc
    ld   a, [$C168]
    or   [hl]
    ld   a, $10
    ld   e, $10
    jr   nz, label_1DB94
    ld   a, $08
    ld   e, $08

label_1DB94::
    push de
    call label_3BAA
    pop  de
    ld   hl, $C320
    add  hl, bc
    ld   [hl], e
    ld   a, [$C168]
    and  a
    jr   z, label_1DBBE
    ld   a, [$FFD7]
    call label_1C005
    cpl
    inc  a
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    cpl
    inc  a
    ld   [hl], a
    ld   a, [$FFEF]
    cp   $90
    jr   c, label_1DBBE
    call label_1FEA4

label_1DBBE::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    call label_3B12
    call label_1DB08

label_1DBCA::
    call label_1C005
    ld   a, [hl]
    and  $80
    ld   a, $02
    jr   z, label_1DBD6
    ld   a, $04

label_1DBD6::
    jp   label_3B0C
    ld   a, [$FFE8]
    and  a
    jr   z, label_1DBE8
    call label_C05
    ld   [hl], $08
    call label_3B12
    dec  [hl]
    dec  [hl]

label_1DBE8::
    ld   a, $03
    call label_3B0C
    jp   label_1FE0A
    ret
    ld   l, d
    nop
    ld   l, d
    jr   nz, label_1DC5E
    nop
    ld   l, b
    jr   nz, label_1DC0B
    pop  af
    ld   e, e
    call label_3BC0
    call label_1FD96
    call label_1FDC3
    call label_3B39
    call label_1FE0A

label_1DC0B::
    call label_3B23
    ld   hl, $C470
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1DC2A
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $10
    ld   a, [$FFEE]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFEF]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a

label_1DC2A::
    xor  a
    call label_3B0C
    ld   a, [$FFF0]
    rst  0
    dec  [hl]
    ld   e, h
    ld   a, c
    ld   e, h
    call label_C05
    jr   nz, label_1DC58
    call label_1FE6D
    ld   a, e
    cp   $03
    jr   z, label_1DC58
    call label_3D7F
    call label_C05
    ld   [hl], $25
    call label_1FE5D
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    call label_3B12
    ld   [hl], $01
    ret

label_1DC58::
    call label_1C005
    ld   a, [hl]
    sub  a, $04

label_1DC5E::
    jr   z, label_1DC67
    and  $80
    jr   z, label_1DC66
    inc  [hl]
    inc  [hl]

label_1DC66::
    dec  [hl]

label_1DC67::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1DC76
    and  $80
    jr   z, label_1DC75
    inc  [hl]
    inc  [hl]

label_1DC75::
    dec  [hl]

label_1DC76::
    ret

label_1DC77::
    ld   bc, $CDFF
    dec  b
    inc  c
    jr   nz, label_1DC85
    ld   [hl], $40
    call label_3B12
    ld   [hl], b
    ret

label_1DC85::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_1DCA0
    call label_1C005
    dec  [hl]
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1DC77
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    add  a, [hl]
    ld   [hl], a

label_1DCA0::
    ld   a, $01
    jp   label_3B0C

label_1DCA5::
    ld   a, [$FFF1]
    inc  a
    jr   z, label_1DCF3
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl

label_1DCB8::
    ld   a, [$FFEC]
    add  a, [hl]
    cp   $7E
    jr   c, label_1DCC0
    xor  a

label_1DCC0::
    ld   [de], a
    inc  hl
    inc  de
    push bc
    ld   a, [$C155]
    ld   c, a
    ld   a, [$FFEE]
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  hl
    inc  de
    ld   a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    push af
    add  a, c
    ld   [de], a
    pop  af
    cp   $FF
    jr   nz, label_1DCDF
    dec  de
    xor  a
    ld   [de], a
    inc  de

label_1DCDF::
    pop  bc
    inc  de
    ld   a, [$FFED]
    xor  [hl]
    inc  hl
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_1DCB8
    ld   a, [$C123]
    ld   c, a
    ld   a, $0A
    jp   label_3DA0

label_1DCF3::
    ld   a, [$C123]
    ld   c, a
    ret

label_1DCF8::
    nop
    nop
    ld   c, h
    rlca
    nop
    ld   [label_274C], sp
    ld   a, [$FF00]
    ld   c, d
    rlca
    ld   a, [$FF08]
    ld   c, d
    daa
    ld   [rJOYP], a
    ld   c, d
    rlca
    ld   [$FF08], a
    ld   c, d
    daa
    ret  nc
    nop
    ld   c, d
    rlca
    ret  nc
    ld   [label_274A], sp
    ret  nz
    nop
    ld   c, b
    rlca
    ret  nz
    ld   [label_2748], sp
    nop
    nop
    ld   c, d
    rlca
    nop
    ld   [label_274A], sp
    ld   a, [$FF00]
    ld   c, d
    rlca
    ld   a, [$FF08]
    ld   c, d
    daa
    ld   [rJOYP], a
    ld   c, d
    rlca
    ld   [$FF08], a
    ld   c, d
    daa
    ret  nc
    nop
    ld   c, b
    rlca
    ret  nc
    ld   [label_2748], sp
    ret  nz
    nop
    rst  $38
    rlca
    ret  nz
    ld   [label_27FF], sp
    nop
    nop
    ld   c, d
    rlca
    nop
    ld   [label_274A], sp
    ld   a, [$FF00]
    ld   c, d
    rlca
    ld   a, [$FF08]
    ld   c, d
    daa
    ld   [rJOYP], a
    ld   c, b
    rlca
    ld   [$FF08], a
    ld   c, b
    daa
    ret  nc
    nop
    rst  $38
    rlca
    ret  nc
    ld   [label_27FF], sp
    ret  nz
    nop
    rst  $38
    rlca
    ret  nz
    ld   [label_27FF], sp
    nop
    nop
    ld   c, d
    rlca
    nop
    ld   [label_274A], sp
    ld   a, [$FF00]
    ld   c, b
    rlca
    ld   a, [$FF08]
    ld   c, b
    daa
    ld   [rJOYP], a
    rst  $38
    rlca
    ld   [$FF08], a
    rst  $38
    daa
    ret  nc
    nop
    rst  $38
    rlca
    ret  nc
    ld   [label_27FF], sp
    ret  nz
    nop
    rst  $38
    rlca
    ret  nz
    ld   [label_27FF], sp
    nop
    nop
    ld   c, b
    rlca
    nop
    ld   [label_2748], sp
    ld   a, [$FF00]
    rst  $38
    rlca
    ld   a, [$FF08]
    rst  $38
    daa
    ld   [rJOYP], a
    rst  $38
    rlca
    ld   [$FF08], a
    rst  $38
    daa
    ret  nc
    nop
    rst  $38
    rlca
    ret  nc
    ld   [label_27FF], sp
    ret  nz
    nop
    rst  $38
    rlca
    ret  nz
    ld   [label_27FF], sp
    ld   a, [$FF99]
    ld   e, a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, e
    jr   c, label_1DDD0
    ld   a, $01
    ld   [$DE00], a

label_1DDD0::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_1DFAB
    and  a
    jp   nz, label_1DF4D
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_1FEA4
    ld   a, [$C124]
    and  a
    jr   nz, label_1DDF5
    ld   hl, $C3E0
    add  hl, bc
    ld   a, [$FFF6]
    cp   [hl]
    jp   nz, label_1FEA4

label_1DDF5::
    ld   a, [$FFF1]
    cp   $05
    jr   nc, label_1DE12
    rla
    rla
    and  $FC
    sla  a
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b

label_1DE09::
    ld   hl, label_1DCF8
    add  hl, de
    ld   c, $0A
    call label_1DCA5

label_1DE12::
    call label_C56
    call label_3B70
    call label_1FCF0
    ld   a, [$FFF0]
    rst  0
    ld   a, [hli]
    ld   e, [hl]
    dec  hl
    ld   e, [hl]
    ld   b, e
    ld   e, [hl]
    push bc
    ld   e, [hl]
    db   $F2 ; Undefined instruction
    ld   e, [hl]
    ld   de, $C95F
    call label_1DEEA
    call label_C05
    jr   nz, label_1DE36
    jp   label_3B12

label_1DE36::
    ld   e, $00
    and  $04
    jr   z, label_1DE3E
    ld   e, $02

label_1DE3E::
    ld   a, e
    ld   [$C155], a
    ret
    call label_1DEEA
    ld   a, [$FFE7]
    call label_1DE36
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1DE67
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $05
    jp   z, label_1DEA7
    call label_280D
    and  $03
    jr   z, label_1DE67
    call label_1DF61

label_1DE67::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_1DEA6
    ld   a, $A7
    call label_3B86
    jr   c, label_1DEA6
    call label_280D
    and  $07
    sub  a, $04
    ld   hl, $FFD8
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    call label_280D
    and  $1F
    sub  a, $10
    ld   hl, $FFD7
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $10
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01

label_1DEA6::
    ret

label_1DEA7::
    ld   a, $00
    ld   [$C155], a
    ld   a, [$DB72]
    inc  a
    ld   [$DB72], a
    cp   $04
    jr   c, label_1DEBF
    call label_C05
    ld   [hl], $20
    jp   label_3B12

label_1DEBF::
    call label_1EE7F
    jp   label_1FEA4
    call label_C05
    jr   nz, label_1DEDE
    ld   [hl], $20
    ld   a, $08
    ld   [$DB95], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    jp   label_3B12

label_1DEDE::
    ld   e, $00
    and  $04
    jr   z, label_1DEE6
    ld   e, $02

label_1DEE6::
    ld   a, e
    ld   [$C155], a

label_1DEEA::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C111], a
    ret
    xor  a
    ld   [$C155], a
    call label_C05
    jr   nz, label_1DF06
    call label_1EE7F
    ld   hl, $DB6B
    set  2, [hl]
    jp   label_1FEA4

label_1DF06::
    jp   label_1DEEA

label_1DF09::
    nop
    ld   [bc], a
    inc  b
    ld   b, $06
    inc  b
    ld   [bc], a
    nop
    xor  a
    ld   [$C156], a
    call label_C05
    jr   nz, label_1DF1D
    jp   label_1FEA4

label_1DF1D::
    push af
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1DF09
    add  hl, de
    ld   a, [hl]
    ld   [$C156], a
    pop  af
    cp   $20
    jr   nc, label_1DF37
    and  $03
    jr   nz, label_1DF37
    call label_1DF61
    xor  a

label_1DF37::
    cp   $40
    jr   c, label_1DF44
    and  $07
    jr   nz, label_1DF44
    ld   hl, $FFF4
    ld   [hl], $0C

label_1DF44::
    ret

label_1DF45::
    jr   nc, label_1DF48
    jr   nc, label_1DF6A
    ldd  [hl], a
    ld   bc, label_2132

label_1DF4D::
    ld   de, label_1DF45
    call label_3BC0
    call label_C05
    jp   z, label_1FEA4
    cp   $04
    ret  nz
    ld   a, $01
    jp   label_3B0C

label_1DF61::
    ld   a, $A7
    call label_3B86
    jr   c, label_1DF9A
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C340
    add  hl, de
    ld   [hl], $D1
    ld   hl, $C310
    add  hl, de
    ld   [hl], $70
    call label_280D
    and  $3F
    sub  a, $20
    ld   hl, $FFD7
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    call label_280D
    and  $3F
    sub  a, $20
    ld   hl, $FFD8
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_1DF9A::
    ret

label_1DF9B::
    ld   d, $03
    ld   d, $23

label_1DF9F::
    jr   label_1DFB1
    inc  c
    ld   [$F40C], sp
    inc  c
    db   $F4 ; Undefined instruction

label_1DFA7::
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    inc  c
    inc  c

label_1DFAB::
    ld   a, [$FFEC]
    add  a, $08
    ld   [$FFEC], a

label_1DFB1::
    ld   de, label_1DF9B
    call label_3C77
    call label_1FE0A
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   [hl], b
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    cp   $04
    jp   z, label_1FEA4
    ld   e, a
    ld   d, b
    ld   hl, label_1DF9F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1DFA3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1DFA7
    add  hl, de

label_1DFF8::
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    ld   a, e
    and  $01
    jp   label_3B0C

label_1E003::
    ld   c, [hl]
    nop
    ld   c, [hl]
    jr   nz, label_1DFF8
    ld   [label_7FE], a
    jr   nz, label_1E02A
    ld   a, [$C11C]
    cp   $05
    jr   nz, label_1E019
    ld   a, $10
    ld   [$C5AE], a

label_1E019::
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

label_1E02A::
    ld   de, label_1E003
    call label_3BC0
    ld   a, [$C124]
    and  a
    ret  nz
    ld   a, [$FFF6]
    ld   [$DB6F], a
    ld   a, [$FFEE]
    ld   [$DB70], a
    ld   a, [$FFEF]
    ld   [$DB71], a
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$FFEA]
    cp   $02
    ret  z
    call label_C56
    call label_3B70
    call label_1FE0A
    call label_1FE43
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
    jr   z, label_1E08F
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sra  a
    cpl
    cp   $07
    jr   c, label_1E082
    push af
    ld   a, $17
    ld   [$FFF4], a
    pop  af
    jr   label_1E083

label_1E082::
    xor  a

label_1E083::
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    sra  [hl]
    call label_1C005
    sra  [hl]

label_1E08F::
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $03
    ld   e, $03
    ld   a, e

label_1E098::
    ld   [$FFED], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    ld   a, [$FFEF]
    add  a, e
    ld   [$FFEF], a
    call label_3B23
    ld   a, [$FFED]
    ld   e, a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, e
    ld   [hl], a
    ld   a, [$FFEF]
    sub  a, e
    ld   [$FFEF], a
    ld   a, [$FFF0]
    rst  0
    pop  bc
    ld   h, b
    inc  [hl]
    ld   h, c
    dec  [hl]
    ld   h, c
    ld   a, [$FFE9]
    dec  a
    and  $80
    jr   z, label_1E0DD
    ld   hl, $C250
    call label_1E0D1
    ld   hl, $C240

label_1E0D1::
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E0DD
    and  $80
    jr   z, label_1E0DC
    inc  [hl]
    inc  [hl]

label_1E0DC::
    dec  [hl]

label_1E0DD::
    call label_3B5A
    jr   nc, label_1E133
    ld   a, [$C19B]
    and  a
    jr   nz, label_1E133
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_1E0F7
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_1E104
    jr   label_1E133

label_1E0F7::
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_1E133
    ld   a, [$FFCC]
    and  $10
    jr   z, label_1E133

label_1E104::
    ld   a, [$C3CF]
    and  a
    jr   nz, label_1E133
    inc  a
    ld   [$C3CF], a
    ld   a, [$FFEA]
    cp   $07
    jr   z, label_1E133
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

label_1E133::
    ret
    ret
    ld   a, [$FFE8]
    and  a
    jr   nz, label_1E159
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E164

label_1E142::
    ld   a, $07
    ld   [$FFF2], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    sra  a
    ld   [hl], a
    call label_1C005
    ld   a, [hl]
    cpl
    inc  a
    sra  a
    ld   [hl], a

label_1E159::
    ld   hl, $C5D0
    add  hl, bc
    ld   [hl], $FF
    call label_3B12
    ld   [hl], b
    ret

label_1E164::
    call label_1FD96
    ld   a, $0B
    ld   [$C19E], a
    call label_3B7B
    ld   e, $0F
    ld   d, b

label_1E172::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_1E188
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $A7
    jr   nz, label_1E188
    push de
    call label_1E18F
    pop  de

label_1E188::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_1E172
    ret

label_1E18F::
    call label_C05
    jr   nz, label_1E1CD
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_1E1CD
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $18
    cp   $28
    jr   nc, label_1E1CD
    call label_1E142
    ld   a, $25
    ld   [$FFF4], a
    ld   a, $0B
    ld   [$FFF2], a
    call label_C05
    ld   [hl], $10
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_1E1CD
    inc  [hl]
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $50

label_1E1CD::
    ret

label_1E1CE::
    ld   d, b
    rlca
    ld   d, b
    daa
    ld   de, label_1E1CE
    call label_3BC0
    call label_1FD96
    call label_1E39E
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    and  a
    jr   nz, label_1E1FA
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E248
    call label_1E31C
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $F0
    ld   e, $10

label_1E1FA::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_1E20E
    call label_1C005
    ld   a, [hl]
    sub  a, e
    jr   z, label_1E20E
    and  $80
    jr   z, label_1E20D
    inc  [hl]
    inc  [hl]

label_1E20D::
    dec  [hl]

label_1E20E::
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $02
    call label_1C005
    ld   a, [hl]
    push hl
    push af
    ld   [hl], e
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    push hl
    push af
    call label_3B23
    pop  af
    pop  hl
    ld   [hl], a
    pop  af
    pop  hl
    ld   [hl], a
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $30
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E246
    call label_1C005
    ld   [hl], b
    call label_1E31C
    ld   hl, $C250
    add  hl, de
    ld   [hl], $00

label_1E246::
    jr   label_1E25F

label_1E248::
    call label_1C005
    ld   a, [hl]
    and  a
    jr   z, label_1E256
    and  $80
    jr   z, label_1E255
    inc  [hl]
    inc  [hl]

label_1E255::
    dec  [hl]

label_1E256::
    call label_1E31C
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $00

label_1E25F::
    ld   a, [$FFEF]
    and  $0F
    cp   $00
    jr   nz, label_1E2D1
    ld   a, [$FFEF]
    sub  a, $10
    ld   [$FFCD], a
    and  $F0
    ld   e, a
    ld   a, [$FFEE]
    sub  a, $08
    ld   [$FFCE], a
    swap a
    and  $0F
    or   e
    ld   e, a
    ld   d, b
    call label_1C005
    ld   a, [hl]
    and  a
    jr   z, label_1E2D1
    and  $80
    jr   nz, label_1E2D2
    ld   hl, $D711
    add  hl, de
    ld   [hl], $4D
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_1E2A2
    push bc
    ld   a, $4D
    ld   [$DDD8], a
    ld   a, $07
    call label_91D
    pop  bc

label_1E2A2::
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0A
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $44
    ldi  [hl], a
    ld   a, $54
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $45
    ldi  [hl], a
    ld   a, $55
    ldi  [hl], a
    ld   [hl], b

label_1E2D1::
    ret

label_1E2D2::
    ld   hl, $D711
    add  hl, de
    ld   [hl], $04
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_1E2EC
    push bc
    ld   a, $04
    ld   [$DDD8], a
    ld   a, $07
    call label_91D
    pop  bc

label_1E2EC::
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0A
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   [hl], b
    ret

label_1E31C::
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [$FFD7], a
    ld   e, b
    ld   d, b

label_1E327::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_1E341
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $A6
    jr   nz, label_1E341
    ld   hl, $C460
    add  hl, de
    ld   a, [$FFD7]
    cp   [hl]
    jr   z, label_1E347

label_1E341::
    inc  e
    ld   a, e
    cp   $10
    jr   nz, label_1E327

label_1E347::
    ret

label_1E348::
    nop
    nop
    ld   d, b
    rlca
    nop
    ld   [label_752], sp
    nop
    db   $10 ; Undefined instruction
    daa
    nop
    jr   label_1E3A7
    daa
    ld   hl, label_1E348
    ld   c, $04
    call label_3CE6
    call label_1FD96
    call label_C05
    ld   e, a
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $03
    or   e
    jr   nz, label_1E39E

label_1E372::
    ld   a, [$FFEB]
    cp   $A4
    jp   z, label_1E3FB
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1E3F7
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_1E3F9
    add  hl, de
    cp   [hl]
    jr   nz, label_1E39E
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    call label_C05
    ld   [hl], $6A

label_1E39E::
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFEE]
    push af
    call label_1FE0A
    pop  af
    ld   e, a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, e
    ld   [$FFE8], a
    call label_3B23
    call label_3B5A
    jr   nc, label_1E3F6
    ld   a, [$FF9B]
    and  $80
    jr   nz, label_1E3F6
    call label_1FE6D
    add  a, $08
    bit  7, a
    jr   z, label_1E3F6
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [$FF99], a
    ld   a, [$FF9A]
    push af
    ld   a, [$FFE8]
    ld   [$FF9A], a
    ld   hl, $FF98
    add  a, [hl]
    ld   [hl], a
    push bc
    call label_3E19
    pop  bc
    pop  af
    ld   [$FF9A], a
    ld   a, $02
    ld   [$FF9B], a
    ld   a, $01
    ld   [$C147], a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $10

label_1E3F6::
    ret

label_1E3F7::
    ld   bc, label_6FF
    ld   a, [$B021]
    jp   nz, label_1DE09
    ld   d, b
    ld   hl, label_1E3F7
    add  hl, de
    ld   a, [hl]
    call label_1C005
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_1E3F9
    add  hl, de
    cp   [hl]
    jr   nz, label_1E41F
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    call label_C05
    ld   [hl], $6A

label_1E41F::
    jp   label_1E39E

label_1E422::
    nop
    nop
    ld   d, b
    rlca
    nop
    ld   [label_752], sp
    nop
    db   $10 ; Undefined instruction
    daa
    nop
    jr   label_1E481
    daa
    call label_C00
    jr   z, label_1E43B
    ld   a, $04
    ld   [$FFF5], a

label_1E43B::
    ld   hl, label_1E422
    ld   c, $04
    call label_3CE6
    call label_1FD96
    call label_1E39E
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E489
    ld   e, $04
    ld   a, [$FFF6]
    cp   $3B
    jr   z, label_1E466
    call label_C00
    ld   [hl], $08
    ld   a, [$C3CF]
    and  a
    jr   z, label_1E489
    ld   e, $04

label_1E466::
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   z, label_1E478
    inc  [hl]
    cp   $03
    jr   nz, label_1E478
    ld   a, $11
    ld   [$FFF4], a

label_1E478::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_1E488
    call label_1C005

label_1E481::
    ld   a, [hl]
    sub  a, e
    and  $80
    jr   z, label_1E488
    inc  [hl]

label_1E488::
    ret

label_1E489::
    call label_1C005
    ld   [hl], b
    ld   hl, $C440
    add  hl, bc
    ld   [hl], b
    ret

label_1E493::
    sbc  a, b
    nop
    ld   d, e
    ld   a, a
    sbc  a, b
    jr   nz, label_1E4ED
    ld   a, a
    sbc  a, b
    ld   b, b
    ld   d, e
    ld   a, a
    sbc  a, b
    ld   h, b
    ld   d, e
    ld   a, a
    sbc  a, b
    add  a, b
    ld   d, e
    ld   a, a
    sbc  a, b
    and  b
    ld   d, e
    ld   a, a
    sbc  a, b
    ret  nz
    ld   d, e
    ld   a, a
    sbc  a, b
    ld   [rHDMA3], a
    ld   a, a
    sbc  a, c
    nop
    ld   d, e
    ld   a, a
    sbc  a, c
    jr   nz, label_1E50D
    ld   a, a
    sbc  a, c
    ld   b, b
    ld   d, e
    ld   a, a
    sbc  a, c
    ld   h, b
    ld   d, e
    ld   a, a
    sbc  a, c
    add  a, b
    ld   d, e
    ld   a, a
    sbc  a, c
    and  b
    ld   d, e
    ld   a, a
    sbc  a, c
    ret  nz
    ld   d, e
    ld   a, a
    sbc  a, c
    ld   [rHDMA3], a
    ld   a, a
    sbc  a, d
    nop
    ld   d, e
    ld   a, a
    sbc  a, d
    jr   nz, label_1E52D
    ld   a, a
    sbc  a, b
    nop
    ld   d, e
    ld   bc, label_2098
    ld   d, e
    ld   bc, label_1C098
    ld   d, e
    ld   bc, label_1E098
    ld   d, e
    ld   bc, $8098

label_1E4ED::
    ld   d, e
    ld   bc, $A098
    ld   d, e
    ld   bc, $C098
    ld   d, e
    ld   bc, $E098
    ld   d, e
    ld   bc, $0099
    ld   d, e
    ld   bc, label_2099
    ld   d, e
    ld   bc, label_1C099
    ld   d, e
    ld   bc, label_1E099
    ld   d, e
    ld   bc, $8099

label_1E50D::
    ld   d, e
    ld   bc, $A099
    ld   d, e
    ld   bc, $C099
    ld   d, e
    ld   bc, $E099
    ld   d, e
    ld   bc, $009A
    ld   d, e
    ld   bc, label_209A
    ld   d, e
    ld   bc, $E0AF
    sub  a, [hl]
    ld   [$FF97], a
    ld   [$C12F], a
    ld   [$C12E], a
    ld   hl, $D6FD
    res  5, [hl]
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $09
    jr   z, label_1E59D
    ld   a, [$D600]
    ld   e, a
    add  a, $08
    ld   [$D600], a
    ld   d, b
    push bc
    ld   hl, $C3D0
    add  hl, bc
    ld   c, [hl]
    sla  c
    sla  c
    sla  c
    ld   hl, label_1E493
    add  hl, bc
    ld   c, l
    ld   b, h
    ld   hl, $D601
    add  hl, de
    ld   e, $08

label_1E55E::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_1E55E
    ld   [hl], $00
    ld   a, [$FFFE]
    and  a
    jr   z, label_1E596
    pop  bc
    ld   a, [$DC90]
    ld   e, a
    add  a, $08
    ld   [$DC90], a
    ld   d, b
    push bc
    ld   hl, $C3D0
    add  hl, bc
    ld   c, [hl]
    sla  c
    sla  c
    sla  c
    ld   hl, label_1E493
    add  hl, bc
    ld   c, l
    ld   b, h
    ld   hl, $DC91
    add  hl, de
    ld   e, $08

label_1E58E::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_1E58E
    ld   [hl], $00

label_1E596::
    pop  bc
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ret

label_1E59D::
    call label_C05
    ret  nz
    ld   a, [$FFF7]
    add  a, $50
    call label_2373
    ld   a, $E4
    ld   [$DB97], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_1E5CB
    ld   de, $DC18
    ld   hl, rSVBK
    di

label_1E5B9::
    ld   [hl], $02
    ld   a, [de]
    ld   [hl], $00
    ld   [de], a
    inc  de
    ld   a, e
    and  $07
    jr   nz, label_1E5B9
    ld   a, $01
    ld   [$DDD1], a
    ei

label_1E5CB::
    jp   label_1FEA4

label_1E5CE::
    ld   c, d
    ld   [bc], a
    ld   c, h
    ld   [bc], a
    ld   c, h
    ldi  [hl], a
    ld   c, d
    ldi  [hl], a
    ld   c, [hl]
    ld   [bc], a
    ld   c, [hl]
    ldi  [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_1E523
    ld   de, label_1E5CE
    call label_3BC0
    call label_1FD96
    call label_1FDC3
    ld   a, [$FFF9]
    and  a
    jp   nz, label_1E693
    ld   a, [$FFF0]
    rst  0
    ld   b, $66
    ld   c, c
    ld   h, [hl]
    ld   l, e
    ld   h, [hl]

label_1E5FE::
    ld   [$00F8], sp
    nop

label_1E602::
    nop
    nop
    ld    hl, sp+$08
    call label_3B70
    call label_1E6F2
    call label_C05
    jr   nz, label_1E647
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $04
    jr   nz, label_1E62A
    ld   [hl], b
    call label_1FE7D
    jr   label_1E630

label_1E62A::
    call label_280D
    and  $03
    ld   e, a

label_1E630::
    ld   d, b
    ld   hl, label_1E5FE
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1E602
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    call label_3B12

label_1E647::
    jr   label_1E660
    call label_3B70
    call label_1E6F2
    call label_C05
    jr   nz, label_1E65A
    ld   [hl], $20
    call label_3B12
    ld   [hl], b

label_1E65A::
    call label_1FE0A
    call label_3B23

label_1E660::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1E66B::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C2
    call label_C05
    jr   nz, label_1E68E
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], $2D
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $0C
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $04

label_1E68E::
    ld   a, $02
    jp   label_3B0C

label_1E693::
    ld   a, [$FFF0]
    cp   $02
    jr   z, label_1E66B
    call label_3B70
    call label_1E6FE
    ld   a, [$FFF0]
    rst  0
    and  [hl]
    ld   h, [hl]
    cp   b
    ld   h, [hl]
    call label_1FE5D
    ld   a, $08
    dec  e
    jr   nz, label_1E6B0
    ld   a, $F8

label_1E6B0::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    call label_1FE0A
    call label_1C005
    inc  [hl]
    inc  [hl]
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_1E6D4
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_1E6D4::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $08
    jr   z, label_1E6EE
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    and  $F0
    add  a, $03
    ld   [hl], a
    call label_1C005
    ld   [hl], b
    jp   label_1E660

label_1E6EE::
    xor  a
    jp   label_3B0C

label_1E6F2::
    ld   a, [$FFA2]
    and  a
    jp   z, label_3B5A
    cp   $08
    jp  c, label_3B5A
    ret

label_1E6FE::
    jp   label_3B5A

label_1E701::
    ld   b, b
    ld   [bc], a
    ld   b, b
    ldi  [hl], a
    ld   b, d
    ld   [bc], a
    ld   b, d
    ldi  [hl], a
    ld   de, label_1E701
    call label_3BC0
    call label_1FD96
    call label_1FDC3
    call label_3B39
    call label_1FE0A
    call label_1FE43
    call label_3B23
    ld   hl, $C350
    add  hl, bc
    set  7, [hl]
    ld   hl, $C430
    add  hl, bc
    set  6, [hl]
    ld   a, [$FFF0]
    rst  0
    ld   [hl], $67
    sub  a, b
    ld   h, a
    rst  $10
    ld   h, a
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E747
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1E753
    dec  [hl]
    jr   label_1E753

label_1E747::
    ld   hl, $C350
    add  hl, bc
    res  7, [hl]
    ld   hl, $C430
    add  hl, bc
    res  6, [hl]

label_1E753::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1E776
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E768
    and  $80
    jr   z, label_1E767
    inc  [hl]
    inc  [hl]

label_1E767::
    dec  [hl]

label_1E768::
    call label_1C005
    ld   a, [hl]
    and  a
    jr   z, label_1E776
    and  $80
    jr   z, label_1E775
    inc  [hl]
    inc  [hl]

label_1E775::
    dec  [hl]

label_1E776::
    call label_BFB
    jr   nz, label_1E77E
    call label_3B12

label_1E77E::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E78D
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1E78D
    dec  [hl]

label_1E78D::
    jp   label_1E7AE
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   c, label_1E7A7
    call label_BFB
    call label_280D
    and  $1F
    add  a, $80
    ld   [hl], a
    jp   label_3B12

label_1E7A7::
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_1E7AE
    inc  [hl]

label_1E7AE::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C3D0
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rra
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1E7C3::
    nop
    dec  b
    ld   a, [bc]
    dec  c

label_1E7C7::
    ld   c, $0D
    ld   a, [bc]
    dec  b
    nop
    ei
    or   $F3
    db   $F2 ; Undefined instruction
    di
    or   $FB
    nop
    dec  b
    ld   a, [bc]
    dec  c
    call label_1E7AE
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $10
    jr   z, label_1E7EB
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1E7EA
    inc  [hl]

label_1E7EA::
    ret

label_1E7EB::
    call label_BFB
    jr   nz, label_1E7F6
    ld   [hl], $60
    call label_3B12
    ld   [hl], b

label_1E7F6::
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $18
    jr   c, label_1E83D
    ld   [hl], b
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C440
    add  hl, bc
    add  a, [hl]
    and  $0F
    ld   [hl], a
    ld   hl, $C440
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1E7C3
    add  hl, de
    ld   a, [hl]
    sra  a
    call label_1C005
    ld   [hl], a
    ld   hl, label_1E7C7
    add  hl, de
    ld   a, [hl]
    sra  a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $07
    jr   nz, label_1E83D
    call label_280D
    and  $02
    dec  a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a

label_1E83D::
    ret

label_1E83E::
    ld   b, h
    inc  bc
    ld   b, [hl]
    inc  bc
    ld   b, h
    inc  bc
    ld   c, b
    inc  bc
    ld   b, [hl]
    inc  hl
    ld   b, h
    inc  hl
    ld   c, b
    inc  hl
    ld   b, h
    inc  hl
    ld   hl, $C380
    add  hl, bc
    ld   a, [$FFF1]
    add  a, [hl]
    ld   [$FFF1], a
    ld   de, label_1E83E
    call label_3BC0
    call label_1FD96
    call label_1FDC3
    call label_3B39
    call label_1FE0A
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1E882
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $08
    call label_C00
    ld   [hl], $20

label_1E882::
    ld   a, [$FFF0]
    rst  0
    sub  a, a
    ld   l, b
    ret  c
    ld   l, b
    add  hl, hl
    ld   l, c

label_1E88B::
    ld   [$00F8], sp
    nop

label_1E88F::
    nop
    nop
    ld    hl, sp+$08

label_1E893::
    ld   [bc], a
    nop
    rst  $38
    rst  $38
    call label_C05
    jr   nz, label_1E8D0
    call label_3B12
    call label_C05
    call label_280D
    and  $1F
    add  a, $30
    ld   [hl], a
    and  $03
    ld   e, a

label_1E8AD::
    ld   d, b
    ld   hl, label_1E88B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1E88F
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    ld   hl, label_1E893
    add  hl, de
    ld   a, [hl]
    cp   $FF
    jr   z, label_1E8CF
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_1E8CF::
    ret

label_1E8D0::
    call label_3D7F
    call label_1E8F0
    jr   label_1E8E6
    call label_C05
    jr   nz, label_1E8E3
    ld   [hl], $18
    call label_3B12
    ld   [hl], b

label_1E8E3::
    call label_1E8F0

label_1E8E6::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1E8F0::
    call label_C00
    jr   nz, label_1E919
    call label_1FE5D
    add  a, $08
    cp   $10
    jr   nc, label_1E91A
    call label_1FE6D

label_1E901::
    call label_1E8AD
    ld   hl, $C240
    add  hl, bc
    sla  [hl]
    call label_1C005
    sla  [hl]
    call label_3B12
    ld   [hl], $02
    call label_C05
    ld   [hl], $30

label_1E919::
    ret

label_1E91A::
    call label_1FE6D
    add  a, $08
    cp   $10
    jr   nc, label_1E928
    call label_1FE5D
    jr   label_1E901

label_1E928::
    ret
    call label_C05
    jr   nz, label_1E939
    ld   [hl], $20
    call label_3B12
    ld   [hl], b
    call label_C00
    ld   [hl], $40

label_1E939::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    jp   label_3B0C

label_1E942::
    db   $3A ; ldd  a, [hl]
    push de
    sub  a, $D7
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    call label_CEE1
    db   $3A ; ldd  a, [hl]
    inc  bc
    add  hl, bc
    inc  bc
    add  hl, bc
    add  a, $1B
    dec  de
    inc  bc
    inc  bc
    add  hl, bc
    ld   c, $1B
    dec  de
    dec  de
    dec  de

label_1E95B::
    ld   [bc], a
    ld   [de], a
    ldi  [hl], a
    ldd  [hl], a

label_1E95F::
    ld   b, d
    nop
    ld   [label_1810], sp
    jr   nz, label_1E98E
    jr   nc, label_1E9A0
    ld   b, b
    ld   c, b

label_1E96A::
    call label_1FD96
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFF0]
    rst  0
    ld   a, a
    ld   l, c
    adc  a, d
    ld   l, c
    sub  a, [hl]
    ld   l, c
    and  d
    ld   l, c
    call label_1C000
    call label_C05
    ld   [hl], $28
    jp   label_3B12
    call label_C05
    ret  nz

label_1E98E::
    ld   a, $4C
    ld   [$D368], a
    jp   label_3B12
    ld   a, $1D
    ld   [$FFF4], a
    call label_C05
    ld   [hl], $80
    jp   label_3B12
    ld   a, [$FFE7]
    ld   e, $00
    and  $08
    jr   z, label_1E9AC
    ld   e, $02

label_1E9AC::
    ld   a, e
    ld   [$C155], a
    call label_C05
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    inc  a
    ld   [hl], a
    ld   [$FFE8], a
    ld   a, e
    and  $1F
    jp   nz, label_1E9D0
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $0A
    jp   z, label_1EA34
    inc  a
    ld   [hl], a

label_1E9D0::
    ld   hl, $C3D0
    add  hl, bc
    push hl
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_1E95F
    add  hl, de
    ld   a, [hl]
    ld   [$FFCD], a
    ld   a, $20
    ld   [$FFCE], a
    call label_2887
    pop  hl
    ld   d, h
    ld   e, l
    ld   hl, $DE01
    ld   a, $1A
    ldi  [hl], a
    ld   a, $71
    ldi  [hl], a
    ld   a, $11
    ldi  [hl], a
    ld   a, $07
    ld   [hl], a
    call label_BD7
    push bc
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    dec  a
    rra
    and  $07
    push af
    ld   e, a
    ld   d, b
    ld   hl, label_1E95B
    add  hl, de
    ld   e, [hl]
    ld   hl, $D711
    add  hl, de
    ld   c, l
    ld   b, h
    pop  af
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_1E942
    add  hl, de
    ld   e, $05

label_1EA23::
    ld   a, [hli]
    ld   [bc], a
    push hl
    ld   h, b
    ld   l, c
    ld   a, $87
    call label_B2F
    pop  hl
    inc  bc
    dec  e
    jr   nz, label_1EA23
    pop  bc
    ret

label_1EA34::
    xor  a
    ld   [$C155], a
    ld   [$C167], a
    call label_27DD
    jp   label_1FEA4
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jp   z, label_1E96A
    and  a
    jr   nz, label_1EA52
    inc  [hl]
    call label_1EED0

label_1EA52::
    call label_1EFB1
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_1FEAA
    call label_1FD96
    call label_394D
    call label_3EE8
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $16
    jr   nz, label_1EA89
    ld   a, [$FFF0]
    cp   $09
    jr   nc, label_1EA84
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    call label_3B12
    ld   a, $09
    ld   [hl], a
    ld   [$FFF0], a
    jr   label_1EA89

label_1EA84::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]

label_1EA89::
    call label_1FDC3
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1EAA6
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_1EAA6::
    ld   a, [$FFF0]
    cp   $09
    jr   nc, label_1EAC0
    call label_3B65
    ld   hl, $C410
    add  hl, bc
    ld   a, [$C13E]
    or   [hl]
    and  a
    jr   nz, label_1EAC0
    call label_3B5A
    call label_3B70

label_1EAC0::
    ld   a, [$FFF0]
    rst  0
    rst  $18
    ld   l, d
    push af
    ld   l, d
    ld   d, $6B
    ld   l, b
    ld   l, e
    ret  z
    ld   l, e
    db   $F4 ; Undefined instruction
    ld   l, e
    add  hl, sp
    ld   l, h
    jr   label_1EB40
    ld   e, a
    ld   l, l
    ld   a, a
    ld   l, l
    sbc  a, a
    ld   l, l
    reti
    ld   l, l
    or   $6D
    ld   e, b
    ld   l, [hl]
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    call label_C05
    jr   nz, label_1EAF4
    ld   [hl], $30
    call label_3B12
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $6F

label_1EAF4::
    ret
    call label_C05
    jr   z, label_1EB08
    cp   $01
    jr   nz, label_1EB02
    ld   a, $08
    ld   [$FFF2], a

label_1EB02::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ret

label_1EB08::
    ld   a, [$FFE8]
    and  a
    jr   z, label_1EB15
    call label_C05
    ld   [hl], $40
    call label_3B12

label_1EB15::
    ret
    call label_C05
    cp   $01
    jr   nz, label_1EB33
    ld   e, $12
    ld   a, [$FFF6]
    cp   $92
    jr   z, label_1EB2F
    cp   $84
    jr   z, label_1EB2F
    cp   $80
    jr   nz, label_1EB33
    ld   e, $14

label_1EB2F::
    ld   a, e
    call label_2373

label_1EB33::
    call label_C05
    jr   nz, label_1EB45
    ld   [hl], $A0
    ld   a, [$FFF6]
    cp   $95
    jr   z, label_1EB42

label_1EB40::
    ld   [hl], $20

label_1EB42::
    jp   label_3B12

label_1EB45::
    ld   hl, $D20E
    ld   [hl], $F0
    ld   hl, $D20B
    ld   [hl], $F8
    ld   hl, $D20D
    ld   [hl], $F0
    cp   $20
    jr   c, label_1EB67
    ld   hl, $D20E
    ld   [hl], $F2
    ld   hl, $D20B
    ld   [hl], $FA
    ld   hl, $D20D
    ld   [hl], $F2

label_1EB67::
    ret
    call label_C05
    jr   nz, label_1EB72
    ld   [hl], $20
    jp   label_3B12

label_1EB72::
    and  $3F
    jr   nz, label_1EB76

label_1EB76::
    call label_C05
    and  $40
    jr   z, label_1EBA3

label_1EB7D::
    call label_1EEF0
    ld   hl, $D208
    ld   [hl], $01
    ld   hl, $D209
    ld   [hl], b
    ld   hl, $D20A
    ld   [hl], $F0
    ld   hl, $D20B
    ld   [hl], $F8
    ld   hl, $D20D
    ld   [hl], $F3
    ld   hl, $D20C
    ld   [hl], $10
    ld   hl, $D207
    ld   [hl], $00
    ret

label_1EBA3::
    call label_1EEF0
    ld   hl, $D208
    ld   [hl], b
    ld   hl, $D209
    ld   [hl], b
    ld   hl, $D20A
    ld   [hl], $F8
    ld   hl, $D20B
    ld   [hl], $F8
    ld   hl, $D20D
    ld   [hl], $F0
    ld   hl, $D20C
    ld   [hl], $10
    ld   hl, $D207
    ld   [hl], $00
    ret
    call label_1EEA2
    call label_C05
    ret  nz
    call label_280D
    and  $1F
    add  a, $30
    ld   [hl], a
    ld   a, $08
    call label_3BAA
    call label_3B12

label_1EBDF::
    call label_1FE5D
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_1EBE7::
    call label_1EB7D
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    jp   label_1EBA3
    call label_1EEA2
    call label_1FE5D
    add  a, $20
    cp   $40
    jr   nc, label_1EC14
    call label_1FE6D
    add  a, $1C
    cp   $38
    jr   nc, label_1EC14
    call label_3B12
    ld   [hl], $06
    call label_C05
    ld   [hl], $30
    ret

label_1EC14::
    call label_C05
    jr   nz, label_1EC27
    call label_280D
    and  $0F
    add  a, $10
    ld   [hl], a
    call label_3B12
    ld   [hl], $04
    ret

label_1EC27::
    and  $0F
    jr   nz, label_1EC33
    ld   a, [$D209]
    xor  $01
    ld   [$D209], a

label_1EC33::
    call label_1FE0A
    jp   label_3B23
    call label_C05
    jr   nz, label_1EC55

label_1EC3E::
    call label_C05
    ld   [hl], $20
    call label_3B12
    ld   [hl], $04
    ld   hl, $C350
    add  hl, bc
    set  7, [hl]
    ld   hl, $C430
    add  hl, bc
    res  6, [hl]
    ret

label_1EC55::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1ECB8
    call label_C05
    cp   $18
    jr   c, label_1EC77
    call label_1EBA3
    ld   a, $08
    ld   [$D20C], a
    ld   a, $E0
    ld   [$D20D], a
    ld   a, $01
    ld   [$D207], a
    ret

label_1EC77::
    cp   $10
    jr   c, label_1EC9E
    cp   $17
    jr   nz, label_1EC89
    ld   a, $27
    ld   [$FFF4], a
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $10

label_1EC89::
    ld   a, $FF
    ld   [$D207], a
    ld   a, $F0
    ld   [$D20A], a
    ld   a, $F4
    ld   [$D20B], a
    ld   a, $01
    ld   [$D208], a
    ret

label_1EC9E::
    ld   a, $03
    ld   [$D207], a
    ld   a, $F8
    ld   [$D20C], a
    ld   a, $08
    ld   [$D20D], a
    ld   a, $F0
    ld   [$D20A], a
    ld   a, $F0
    ld   [$D20B], a
    ret

label_1ECB8::
    call label_C05
    cp   $18
    jr   c, label_1ECD7
    call label_1EB7D
    ld   a, $01
    ld   [$D209], a
    ld   a, $F8
    ld   [$D20C], a
    ld   a, $E8
    ld   [$D20D], a
    ld   a, $00
    ld   [$D207], a
    ret

label_1ECD7::
    cp   $10
    jr   c, label_1ECFE
    cp   $17
    jr   nz, label_1ECE9
    ld   a, $27
    ld   [$FFF4], a
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $10

label_1ECE9::
    ld   a, $FF
    ld   [$D207], a
    ld   a, $F0
    ld   [$D20A], a
    ld   a, $F0
    ld   [$D20B], a
    ld   a, $00
    ld   [$D208], a
    ret

label_1ECFE::
    ld   a, $02
    ld   [$D207], a
    ld   a, $10
    ld   [$D20C], a
    ld   a, $08
    ld   [$D20D], a
    ld   a, $F0
    ld   [$D20A], a
    ld   a, $EC
    ld   [$D20B], a
    ret
    call label_1EBE7
    call label_C05
    jr   nz, label_1ED46
    call label_3B12
    call label_1F33F
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $30
    and  a
    jr   nz, label_1ED3B
    ld   [hl], $28
    ld   a, $18
    jp   label_3BAA

label_1ED3B::
    ld   a, $08
    call label_3BAA
    call label_1C005
    ld   [hl], $F0
    ret

label_1ED46::
    ld   a, [$D20E]
    add  a, $02
    ld   [$D20E], a
    ld   a, [$D20B]
    add  a, $02
    ld   [$D20B], a
    ld   a, [$D20D]
    add  a, $02
    ld   [$D20D], a
    ret
    call label_C05
    jr   z, label_1ED70
    dec  a
    jr   nz, label_1ED6A
    call label_1EC3E

label_1ED6A::
    call label_1EBE7
    jp   label_1ED46

label_1ED70::
    call label_1EC33
    ld   a, [$FFE8]
    and  a
    ret  z
    call label_C05
    ld   [hl], $10
    jp   label_1EB15
    ld   a, [$FFE8]
    and  a
    jr   z, label_1ED9C
    call label_3B12
    call label_C05
    ld   [hl], $20
    ld   hl, $C350
    add  hl, bc
    res  7, [hl]
    ld   hl, $C430
    add  hl, bc
    set  6, [hl]
    ld   a, $28
    ld   [$FFF2], a

label_1ED9C::
    jp   label_1EC33
    call label_C05
    jr   nz, label_1EDA9
    ld   [hl], $C0
    jp   label_3B12

label_1EDA9::
    ld   hl, $D20B
    ld   a, [hl]
    sub  a, $03
    jr   z, label_1EDB8
    bit  7, a
    jr   z, label_1EDB7
    inc  [hl]
    inc  [hl]

label_1EDB7::
    dec  [hl]

label_1EDB8::
    ld   hl, $D20D
    ld   a, [hl]
    sub  a, $03
    jr   z, label_1EDC7
    bit  7, a
    jr   z, label_1EDC6
    inc  [hl]
    inc  [hl]

label_1EDC6::
    dec  [hl]

label_1EDC7::
    call label_C05
    cp   $14
    jr   nc, label_1EDD8
    ld   a, [$D20E]
    and  a
    jr   z, label_1EDD8
    inc  a
    ld   [$D20E], a

label_1EDD8::
    ret
    call label_C05
    jr   nz, label_1EDE3
    ld   [hl], $30
    jp   label_3B12

label_1EDE3::
    cp   $30
    jr   nc, label_1EDF5
    and  $03
    jr   nz, label_1EDF5
    ld   a, [$D20E]
    add  a, $02
    cpl
    inc  a
    ld   [$D20E], a

label_1EDF5::
    ret
    ld   a, [$D20E]
    cp   $F0
    jr   z, label_1EE01
    dec  a
    ld   [$D20E], a

label_1EE01::
    call label_C05
    jr   nz, label_1EE35
    ld   e, $FF
    ld   a, [$FFF6]
    cp   $80
    jr   z, label_1EE16
    ld   e, $03
    cp   $95
    jr   z, label_1EE16
    ld   e, $02

label_1EE16::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   e
    jr   c, label_1EE32
    ld   hl, $C350
    add  hl, bc
    set  7, [hl]
    call label_3B12
    ld   a, $13
    call label_2373
    call label_C05
    ld   [hl], $04
    ret

label_1EE32::
    jp   label_1EC3E

label_1EE35::
    cp   $24
    jr   nc, label_1EE57
    ld   hl, $D20B
    ld   a, [hl]
    sub  a, $F8
    jr   z, label_1EE48
    bit  7, a
    jr   z, label_1EE47
    inc  [hl]
    inc  [hl]

label_1EE47::
    dec  [hl]

label_1EE48::
    ld   hl, $D20D
    ld   a, [hl]
    sub  a, $F0
    jr   z, label_1EE57
    bit  7, a
    jr   z, label_1EE56
    inc  [hl]
    inc  [hl]

label_1EE56::
    dec  [hl]

label_1EE57::
    ret
    call label_1EBE7
    call label_C05
    jr   z, label_1EE6A
    dec  a
    jr   nz, label_1EE67
    ld   a, $3F
    ld   [$FFF4], a

label_1EE67::
    jp   label_1ED46

label_1EE6A::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $30
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $78
    jr   c, label_1EEA1
    call label_27DD
    call label_1FEA4

label_1EE7F::
    ld   hl, $D900
    ld   a, [$FFF6]
    cp   $FF
    jr   nz, label_1EE8D
    ld   hl, $DDE0
    jr   label_1EE9A

label_1EE8D::
    ld   e, a
    ld   d, b
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, label_1EE9A
    cp   $06
    jr   c, label_1EE9A
    inc  d

label_1EE9A::
    add  hl, de
    ld   a, [hl]
    or   $20
    ld   [hl], a
    ld   [$FFF8], a

label_1EEA1::
    ret

label_1EEA2::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    call label_1FE5D
    add  a, $30
    cp   $60
    jr   nc, label_1EEC3
    call label_1FE6D
    add  a, $30
    cp   $60
    jr   nc, label_1EEC3
    ld   a, e
    cp   $02
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $01

label_1EEC3::
    call label_3B12
    ld   [hl], $07
    call label_C05
    ld   [hl], $20
    jp   label_1EBDF

label_1EED0::
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $7F
    call label_C05
    ld   [hl], $80
    ld   a, [$FFB0]
    ld   hl, $C390
    add  hl, bc
    ld   [hl], a
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    ld   a, [$FFF6]
    cp   $80
    jr   nz, label_1EEF0
    ld   [hl], $C0

label_1EEF0::
    ld   a, $F8
    ld   [$D20A], a
    ld   a, $F8
    ld   [$D20B], a
    ld   a, $F0
    ld   [$D20E], a
    ld   a, $00
    ld   [$D207], a
    ld   [$D208], a
    ld   [$D209], a
    ld   a, $10
    ld   [$D20C], a
    ld   a, $F0
    ld   [$D20D], a
    ret

label_1EF15::
    ld   [hl], b
    ld   bc, label_2170

label_1EF19::
    nop
    ld    hl, sp+$60
    nop
    nop
    nop
    ld   h, d
    nop
    nop
    ld   [$0064], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    ld    hl, sp+$66
    jr   nz, label_1EF2E

label_1EF2E::
    nop
    ld   h, h
    jr   nz, label_1EF32

label_1EF32::
    ld   [label_2062], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_1EF3A

label_1EF3A::
    ld    hl, sp+$68
    nop
    nop
    nop
    ld   l, d
    nop
    nop
    ld   [$006C], sp
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    ld    hl, sp+$6E
    jr   nz, label_1EF4E

label_1EF4E::
    nop
    ld   l, h
    jr   nz, label_1EF52

label_1EF52::
    ld   [label_206A], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_1EF5A

label_1EF5A::
    nop
    ld   [hl], d
    inc  bc
    ld    hl, sp+$08
    ld   [hl], h
    inc  bc
    ld    hl, sp+$00
    ld   [hl], h
    inc  hl
    nop
    ld   [label_2372], sp
    nop
    nop
    ld   [hl], d
    ld   b, e
    ld   [label_1F408], sp
    ld   b, e
    ld   [label_1F400], sp
    ld   h, e
    nop
    ld   [label_1E372], sp

label_1EF79::
    stop
    halt
    db   $10 ; Undefined instruction
    ld   a, b
    nop
    db   $10 ; Undefined instruction
    ld   a, d
    nop
    ld   [label_1FC18], sp
    nop
    ld    hl, sp+$18
    ld   a, [hl]
    nop

label_1EF8D::
    db   $10 ; Undefined instruction
    halt
    stop
    ld   a, b
    jr   nz, label_1EFA6

label_1EF96::
    ld    hl, sp+$7A
    jr   nz, label_1EFA2
    ld   a, [$FF7C]
    jr   nz, label_1EF96
    ld   a, [$FF7E]
    jr   nz, label_1EFAE

label_1EFA2::
    ei
    ld   h, $00
    inc  c

label_1EFA6::
    ld   bc, $0026
    inc  c
    rlca
    ld   h, $00
    inc  c

label_1EFAE::
    dec  c
    ld   h, $00

label_1EFB1::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $70
    ret  nc
    call label_1EFE6
    call label_1F015
    call label_1F03A
    call label_1F06F
    call label_1F090
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1EFE3
    ld   a, [$FFEF]
    sub  a, $02
    ld   [$FFEC], a
    ld   hl, label_1EFA1
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0

label_1EFE3::
    jp   label_3D8A

label_1EFE6::
    ld   a, [$D20C]
    ld   hl, $FFEE
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D20D]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D207]
    cp   $FF
    jr   z, label_1F012
    rla
    rla
    rla

label_1F000::
    and  $F8
    ld   e, a
    ld   d, b
    ld   hl, label_1EF59
    add  hl, de
    ld   c, $02
    call label_3CE6
    ld   a, $02
    jp   label_1F034

label_1F012::
    jp   label_3D8A

label_1F015::
    ld   hl, $C300

label_1F018::
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    call label_1F0B7
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    ld   hl, label_1EF79
    and  a
    jr   z, label_1F02D
    ld   hl, label_1EF8D

label_1F02D::
    ld   c, $05
    call label_3CE6
    ld   a, $05

label_1F034::
    call label_3DA0
    jp   label_3D8A

label_1F03A::
    ld   a, [$D20A]
    ld   hl, $FFEE
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D20A]
    add  a, $0C
    ld   [$D5C0], a
    ld   a, [$D20B]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D20B]
    add  a, $08
    ld   [$D5C2], a
    ld   a, $08
    ld   [$D5C1], a
    ld   a, $06
    ld   [$D5C3], a
    ld   de, label_1EF15
    call label_3BC0
    ld   a, $02
    jp   label_1F034

label_1F06F::
    ld   a, [$D20E]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D208]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_1EF19
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $04
    jp   label_1F034

label_1F090::
    ld   a, [$D20E]
    cp   $00
    ret  z
    ld   a, [$D20F]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D209]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_1EF39
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $04
    jp   label_1F034

label_1F0B7::
    ld   hl, $C146
    ld   a, [$DBC7]
    or   [hl]
    jr   nz, label_1F111
    ld   a, [$FFEC]
    add  a, $18
    ld   e, a
    ld   a, [$FF99]
    ld   hl, $FFA2
    sub  a, [hl]
    add  a, $08
    sub  a, e
    add  a, $0C
    cp   $18
    jr   nc, label_1F111
    ld   hl, $C380
    add  hl, bc
    ld   e, $08
    ld   a, [hl]
    and  a
    jr   z, label_1F0E0
    ld   e, $F8

label_1F0E0::
    ld   a, [$FFEE]
    add  a, e
    ld   hl, $FF98
    sub  a, [hl]
    add  a, $1A
    cp   $34
    jr   nc, label_1F111
    ld   a, $28
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a
    ld   a, $02
    ld   [$C146], a
    ld   a, $13
    ld   [$FFA3], a
    ld   a, $08
    ld   [$DB94], a
    ld   a, $20
    ld   [$DBC7], a
    ld   a, $03
    ld   [$FFF3], a

label_1F111::
    ret

label_1F112::
    ld   [de], a
    inc  d
    ld   d, $18
    add  hl, de
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    ld   a, [de]
    call label_1FD96
    call label_1FE5D
    add  a, $20
    cp   $40
    jr   nc, label_1F131
    call label_1FE6D
    add  a, $20
    cp   $40
    jr   c, label_1F197

label_1F131::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $7F
    ret  nz
    ld   e, $0F
    ld   d, b

label_1F13E::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $82
    jr   z, label_1F161
    cp   $9E
    jr   z, label_1F161
    cp   $7D
    jr   z, label_1F161
    ld   hl, $C340
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   nz, label_1F161
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   z, label_1F168

label_1F161::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_1F13E
    ret

label_1F168::
    ld   a, [$C18F]
    and  a
    ret  nz
    ld   a, $7D
    call label_3B86
    jr   c, label_1F197
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
    ld   a, [$FFF7]
    ld   e, a
    ld   a, $14
    cp   $0A
    jr   nc, label_1F193
    ld   hl, label_1F112
    add  hl, de
    ld   a, [hl]

label_1F193::
    call label_3BAA
    pop  bc

label_1F197::
    ret
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    cp   $00
    jr   nz, label_1F1B4
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_1FEA4
    ld   hl, $C460
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], $3C

label_1F1B4::
    call label_1FD96
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   z, label_1F246
    ld   a, $14
    call label_3B86
    jr   c, label_1F246
    ld   hl, $C4E0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C4E0
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    add  a, $08
    ld   [hl], a
    call label_3E34
    ld   a, [$FFEE]
    sub  a, $08
    ld   [$FFCE], a
    ld   a, [$FFEF]
    sub  a, $10
    ld   [$FFCD], a
    ld   a, [$FFCE]
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFCD]
    and  $F0
    or   e
    ld   e, a
    ld   d, b
    ld   hl, $D711
    add  hl, de
    ld   [hl], $91
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_1F21D
    push bc
    ld   a, $91
    ld   [$DDD8], a
    ld   a, $07
    call label_91D
    pop  bc

label_1F21D::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $0A
    ld   [$D600], a
    ld   e, $08
    call label_1F233
    ld   e, $09

label_1F233::
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    inc  a
    ld   [$FFD0], a
    ld   a, $81
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    inc  a
    inc  a
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_1F246::
    ret

label_1F247::
    ld   [hl], h
    ld   bc, label_2174
    halt
    ld   a, b
    ld   bc, label_17A
    ld   a, d
    ld   hl, label_2178
    halt
    ld   a, h
    ld   bc, label_17C
    ld   de, label_1F247
    call label_3BC0
    call label_1FD96
    call label_1FDC3
    call label_3B39
    call label_1FE0A
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   nz, label_1F280
    ld   a, [hl]
    and  $0C
    jr   nz, label_1F28A
    jr   label_1F291

label_1F280::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    jr   label_1F291

label_1F28A::
    call label_1C005
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_1F291::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    jp   label_3B0C

label_1F29B::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   d, h
    nop
    ld   d, h
    jr   nz, label_1F2FA
    nop
    ld   d, d
    jr   nz, label_1F302
    nop
    ld   d, [hl]
    nop
    ld   a, [$FFF1]
    cp   $01
    jr   nz, label_1F2BD
    ld   de, label_1F2AB
    call label_3C77
    jr   label_1F2C3

label_1F2BD::
    ld   de, label_1F29B
    call label_3BC0

label_1F2C3::
    call label_1FD96
    call label_1FDC3
    call label_1FE43
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_1F2E3
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_1F2E3::
    ld   a, [$FFF0]
    rst  0
    db   $F4 ; Undefined instruction
    ld   [hl], d
    jr   nz, label_1F35D
    ld   d, b
    ld   [hl], e
    ld   e, h
    ld   [hl], e
    ld   a, h
    ld   [hl], e
    and  b
    ld   [hl], e
    rst  $10
    ld   [hl], e
    call label_C05
    jr   nz, label_1F31F
    call label_1FE5D
    add  a, $20
    cp   $40
    jr   nc, label_1F31F

label_1F302::
    call label_1FE6D
    add  a, $20
    cp   $40
    jr   nc, label_1F31F
    call label_3B12
    call label_C05
    ld   [hl], $20
    call label_280D
    and  $03
    add  a, $03
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a

label_1F31F::
    ret
    call label_C05
    jr   nz, label_1F344
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $12
    ld   a, $03
    call label_3B0C
    call label_3B12

label_1F33F::
    ld   a, $24
    ld   [$FFF2], a
    ret

label_1F344::
    ld   e, $01
    cp   $10
    jr   nc, label_1F34C
    ld   e, $02

label_1F34C::
    ld   a, e
    jp   label_3B0C
    ld   a, [$FFE8]
    and  a
    ret  z
    call label_C05
    ld   [hl], $20
    jp   label_3B12
    call label_3B70
    call label_C05
    jr   nz, label_1F36C
    ld   [hl], $10
    call label_3D7F
    jp   label_3B12

label_1F36C::
    ld   e, $08
    and  $04
    jr   z, label_1F374
    ld   e, $F8

label_1F374::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    jp   label_1FE17
    call label_3B39
    call label_1FE0A
    call label_1F3F7
    call label_C05
    jr   nz, label_1F39B
    ld   a, $0C
    call label_3BAA
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    call label_1F33F
    call label_3B12

label_1F39B::
    ld   a, $03
    jp   label_3B0C
    call label_3B39
    call label_1FE0A
    call label_1F3F7
    ld   a, [$FFE8]
    and  a
    jr   z, label_1F3D2
    call label_3D7F
    call label_3B12
    ld   [hl], $04
    call label_C05
    ld   [hl], $20
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    jr   nz, label_1F3D2
    call label_3B12
    ld   [hl], $06
    call label_C05
    ld   [hl], $30
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $D2

label_1F3D2::
    ld   a, $02
    jp   label_3B0C
    call label_C05
    jr   nz, label_1F3E6
    ld   [hl], $50
    call label_3B12
    ld   [hl], b
    xor  a
    jp   label_3B0C

label_1F3E6::
    ld   e, $03
    cp   $20
    jr   nc, label_1F3F3
    ld   e, $01
    cp   $10
    jr   c, label_1F3F3
    inc  e

label_1F3F3::
    ld   a, e
    jp   label_3B0C

label_1F3F7::
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $03
    call label_3B23

label_1F400::
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b
    ret
    call label_1FD96
    ld   a, [$FFF0]
    rst  0
    db   $10 ; Undefined instruction
    xor  b
    ld   [hl], h

label_1F410::
    ld   a, [$FFEE]
    and  $70
    ld   [$D201], a
    call label_C05
    ld   [hl], $80
    jp   label_3B12

label_1F41F::
    inc  hl
    ld   d, [hl]
    ld   h, $53
    ldd  [hl], a
    ld   b, a
    ld   b, d
    scf
    inc  sp
    ld   b, [hl]
    ld   b, e
    ld   [hl], $24
    ld   d, l
    dec  h
    ld   d, h
    ld   hl, label_1D328
    ld   d, [hl]
    inc  [hl]
    ld   b, l
    dec  [hl]
    ld   b, h
    ld   sp, label_3848
    ld   b, c
    inc  d
    ld   h, [hl]
    dec  d
    ld   h, e
    ld   sp, label_3845
    ld   b, h
    inc  de
    ld   d, [hl]
    ld   d, $53
    daa
    ld   b, d
    ld   b, a
    ldi  [hl], a
    ld   h, l
    inc  sp
    ld   h, h
    ld   [hl], $23
    ld   d, [hl]
    ld   h, $53
    ldd  [hl], a
    ld   b, a
    ld   b, d
    scf
    inc  sp
    ld   b, [hl]
    ld   b, e
    ld   [hl], $24
    ld   d, l
    dec  h
    ld   d, h
    inc  hl
    ld   d, [hl]
    ld   h, $53
    ldd  [hl], a
    ld   b, a
    ld   b, d
    scf
    inc  sp
    ld   b, [hl]
    ld   b, e
    ld   [hl], $24
    ld   d, l
    dec  h
    ld   d, h
    inc  hl
    ld   d, [hl]
    ld   h, $53
    ldd  [hl], a
    ld   b, a
    ld   b, d
    scf
    inc  sp
    ld   b, [hl]
    ld   b, e
    ld   [hl], $24
    ld   d, l
    dec  h
    ld   d, h
    inc  hl
    ld   d, [hl]
    ld   h, $53
    ldd  [hl], a
    ld   b, a
    ld   b, d
    scf
    inc  sp
    ld   b, [hl]
    ld   b, e
    ld   [hl], $24
    ld   d, l
    dec  h
    ld   d, h
    inc  hl
    ld   d, [hl]
    ld   h, $53
    ldd  [hl], a
    ld   b, a
    ld   b, d
    scf
    inc  sp
    ld   b, [hl]
    ld   b, e
    ld   [hl], $24
    ld   d, l
    dec  h
    ld   d, h

label_1F49F::
    jr   nc, label_1F4D1
    jr   nc, label_1F4D3
    jr   nc, label_1F4D5
    jr   nc, label_1F4CF
    jr   z, label_1F4CA
    ret  nc
    jp   label_1FE09
    cp   $10
    jp   z, label_1FEA4
    call label_C05
    jr   nz, label_1F52C
    push hl
    ld   a, [$FFF7]
    ld   e, a
    ld   d, b
    ld   hl, label_1F49F
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a
    ld   a, $5A
    call label_3B86
    jr   c, label_1F52C

label_1F4CA::
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    push bc

label_1F4D1::
    ld   a, [$D201]
    ld   hl, $C3D0
    add  hl, bc
    add  a, [hl]
    inc  [hl]
    ld   c, a
    ld   hl, $C440
    add  hl, de
    ld   a, [$FFEF]
    sub  a, $10
    and  $F0
    jr   z, label_1F4E8
    ld   [hl], a

label_1F4E8::
    ld   a, c
    cp   $0F
    jr   nz, label_1F4F8
    ld   a, [$C18E]
    and  $1F
    cp   $03
    jr   nz, label_1F4F8
    ld   [hl], $01

label_1F4F8::
    ld   hl, label_1F41F
    add  hl, bc
    ld   a, [hl]
    push af
    swap a
    and  $F0
    or   $08
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    pop  af
    and  $F0
    add  a, $10
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
    ld   [hl], $00
    pop  bc

label_1F52C::
    ret
    ld   [hl], b
    nop
    ld   [hl], b
    jr   nz, label_1F5A4
    nop
    ld   [hl], d
    jr   nz, label_1F547
    dec  l
    ld   [hl], l
    call label_3BC0
    call label_1FD96
    call label_1FDC3
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra

label_1F547::
    and  $01
    call label_3B0C
    call label_1FE0A
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   z, label_1F56A
    call label_C05
    ld   [hl], $10
    call label_3D7F
    call label_3B12
    xor  a
    ld   [hl], a
    ld   [$FFF0], a

label_1F56A::
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    halt
    sub  a, a
    ld   [hl], l
    or   a
    ld   [hl], l
    call label_C05
    jr   nz, label_1F596
    ld   [hl], $20
    call label_3B12
    call label_280D
    and  $02
    dec  a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $02
    dec  a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a

label_1F596::
    ret
    call label_C05
    jp   z, label_3B12
    and  $01
    jr   nz, label_1F5B6
    ld   hl, $C2B0

label_1F5A4::
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    call label_1C005
    add  a, [hl]
    ld   [hl], a

label_1F5B6::
    ret
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_1F5DD
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1F5CF
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $10
    ret

label_1F5CF::
    call label_1F5D6
    call label_1C005
    ld   a, [hl]

label_1F5D6::
    bit  7, a
    jr   z, label_1F5DC
    inc  [hl]
    inc  [hl]

label_1F5DC::
    dec  [hl]

label_1F5DD::
    ret

label_1F5DE::
    ld   h, b
    inc  bc
    ld   h, d
    inc  bc
    ld   h, h
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   h, d
    ld   h, e
    ld   h, b
    ld   h, e
    ld   h, [hl]
    ld   h, e
    ld   h, h
    ld   h, e
    ld   h, [hl]
    inc  hl
    ld   h, h
    inc  hl
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1F5FE
    ld   a, c
    ld   [$D201], a

label_1F5FE::
    ld   de, label_1F5DE
    call label_3BC0
    call label_1FD96
    call label_1FE0A
    call label_1FE43
    call label_3B23
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE8], a
    dec  a
    and  $80
    jr   z, label_1F633
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE9], a
    sra  a
    cpl
    cp   $07
    jr   nc, label_1F632
    xor  a

label_1F632::
    ld   [hl], a

label_1F633::
    ld   a, [$FFF0]
    rst  0
    ld   b, b
    halt
    halt
    halt
    halt
    ld   [hl], a
    jp   label_1F733

label_1F643::
    nop
    inc  c
    db   $10 ; Undefined instruction
    nop
    db   $F4 ; Undefined instruction
    ld   a, [$FFF4]

label_1F64B::
    ld   a, [$FFF4]
    nop
    inc  c
    db   $10 ; Undefined instruction
    nop
    db   $F4 ; Undefined instruction

label_1F653::
    nop
    ld   bc, $0004
    call label_C05
    jr   nz, label_1F671
    call label_3D7F
    call label_3B12
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_1F653
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_1F671::
    and  $07
    jr   nz, label_1F67E
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

label_1F67E::
    ld   a, [$FFE8]
    dec  a
    and  $80
    jr   z, label_1F6C2
    call label_1F6E7
    ld   a, [$FFE9]
    sub  a, $FC
    and  $80
    jr   nz, label_1F696
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_1F6C2

label_1F696::
    call label_280D
    and  $01
    ld   e, $01
    jr   z, label_1F6A1
    ld   e, $FF

label_1F6A1::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    add  a, e
    and  $07
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, label_1F643
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1F64B
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a
    call label_1F6E7

label_1F6C2::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1F6ED
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $04
    ld   [hl], a
    call label_C05
    srl  [hl]
    ld   hl, $C240
    call label_1F6E0
    ld   hl, $C250

label_1F6E0::
    add  hl, bc
    ld   a, [hl]
    cpl
    sra  a
    inc  a
    ld   [hl], a

label_1F6E7::
    ld   hl, $C5D0
    add  hl, bc
    ld   [hl], $FF

label_1F6ED::
    ret
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $03
    ret  nz
    inc  [hl]
    call label_3B12
    ld   a, [$FFF1]
    cp   $00
    jr   nz, label_1F716
    ld   hl, $C3B0
    add  hl, de
    ld   a, [hl]
    cp   $00
    jp   z, label_C60

label_1F716::
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $40
    call label_C05
    ld   [hl], $40
    jp   label_C20
    call label_C05
    cp   $01
    jr   nz, label_1F730
    ld   a, $01
    call label_3B0C

label_1F730::
    jp   label_1F733

label_1F733::
    call label_3B5A
    jr   nc, label_1F783
    ld   a, [$C19B]
    and  a
    jr   nz, label_1F783
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_1F74D
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_1F75A
    jr   label_1F783

label_1F74D::
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_1F783
    ld   a, [$FFCC]
    and  $10
    jr   z, label_1F783

label_1F75A::
    ld   a, [$C3CF]
    and  a
    jr   nz, label_1F783
    inc  a
    ld   [$C3CF], a
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

label_1F783::
    ret
    ld   [hl], b
    nop
    ld   [hl], b
    jr   nz, label_1F7FB
    nop
    ld   [hl], d
    jr   nz, label_1F801
    nop
    ld   [hl], h
    jr   nz, label_1F807
    nop
    halt

label_1F794::
    ld   h, b
    nop
    ld   h, b
    jr   nz, label_1F7FB
    nop
    ld   h, d
    jr   nz, label_1F801
    nop
    ld   h, h
    jr   nz, label_1F807
    nop
    ld   h, [hl]
    jr   nz, label_1F7B6
    add  a, h
    ld   [hl], a
    ld   a, [$FFF7]
    cp   $03
    jr   nz, label_1F7B0
    ld   de, label_1F794

label_1F7B0::
    call label_3BC0
    call label_1FD96

label_1F7B6::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1F7C1
    call label_3D7F

label_1F7C1::
    call label_1FDC3
    call label_3B39
    call label_1FE0A
    call label_1FE43
    call label_3B23
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   nz, label_1F7E2
    and  a
    jr   nz, label_1F80D

label_1F7E2::
    ld   [hl], b
    ld   a, [$FFF0]
    cp   $03
    jr   nz, label_1F808
    ld   hl, $C240
    add  hl, bc
    sra  [hl]
    call label_1C005
    sra  [hl]
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sra  a

label_1F7FB::
    cpl
    ld   [hl], a
    cp   $07
    jp   nc, label_1F80D
    ld   [hl], b
    call label_3D7F
    jr   label_1F80D

label_1F808::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_1F80D::
    ld   a, [$FFF0]
    cp   $04
    jr   c, label_1F814
    ret

label_1F814::
    rst  0
    dec  h
    ld   a, b
    ld   h, b
    ld   a, b
    and  l
    ld   a, b
    db   $EC ; Undefined instruction
    ld   a, b

label_1F81D::
    ld   b, $FA
    nop
    nop

label_1F821::
    nop
    nop
    ld   a, [$CD06]
    ld   a, a
    dec  a
    call label_C05
    jr   nz, label_1F85E
    call label_280D
    and  $1F
    add  a, $30
    ld   [hl], a
    call label_3B12
    call label_280D
    and  $06
    jr   nz, label_1F844
    call label_1FE7D
    jr   label_1F84A

label_1F844::
    call label_280D
    and  $03
    ld   e, a

label_1F84A::
    ld   d, b
    ld   hl, label_1F81D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1F821
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a

label_1F85E::
    jr   label_1F86E
    call label_C05
    jr   nz, label_1F86B
    ld   [hl], $18
    call label_3B12
    ld   [hl], b

label_1F86B::
    call label_1F8E1

label_1F86E::
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $80
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $48
    call label_1FE5D
    add  a, $06
    cp   $0A
    jr   c, label_1F88C
    call label_1FE6D
    add  a, $06
    cp   $0A
    jr   nc, label_1F89C

label_1F88C::
    call label_1FE7D
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    call label_3B12
    call label_C05
    ld   [hl], $FF

label_1F89C::
    ret

label_1F89D::
    jr   label_1F887
    nop
    nop

label_1F8A1::
    nop
    nop
    db   $E8 ; add  sp, d
    jr   label_1F873
    dec  b
    inc  c
    jr   z, label_1F8DD
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1F89D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    jr   z, label_1F8C3
    and  $80
    jr   nz, label_1F8C2
    inc  [hl]
    inc  [hl]

label_1F8C2::
    dec  [hl]

label_1F8C3::
    ld   hl, label_1F8A1
    add  hl, de
    ld   a, [hl]
    call label_1C005
    sub  a, [hl]
    jr   z, label_1F8D5
    and  $80
    jr   nz, label_1F8D4
    inc  [hl]
    inc  [hl]

label_1F8D4::
    dec  [hl]

label_1F8D5::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1F8E1

label_1F8DD::
    call label_3B12
    ld   [hl], b

label_1F8E1::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $00
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    inc  a
    inc  a
    call label_3B0C
    call label_C05
    jr   nz, label_1F91A
    call label_3B12
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    ld   hl, $C240
    add  hl, bc
    ld   [hl], b
    ret

label_1F91A::
    cp   $60
    jr   nc, label_1F92B
    and  $04
    ld   a, $08
    jr   nz, label_1F926
    ld   a, $F8

label_1F926::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a

label_1F92B::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    push af
    ld   [hl], $01
    call label_3B23
    pop  af
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a
    ret
    ld   b, $04
    ld   [bc], a
    nop
    ld   a, [$FFF7]
    cp   $15
    jr   nz, label_1F94F
    ld   a, [$DB56]
    cp   $80
    jp   nz, label_1FEA4

label_1F94F::
    call label_1FAB5
    call label_1FD96
    ld   a, [$FFF7]
    cp   $15
    jr   z, label_1F963
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1F966

label_1F963::
    call label_1FA55

label_1F966::
    call label_1FDC3
    call label_3B65
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    add  a, b
    ld   a, c
    or   h
    ld   a, c
    rst  $10
    ld   a, c

label_1F978::
    ld   b, $FA
    nop
    nop

label_1F97C::
    nop
    nop
    ld   a, [$CD06]
    inc  hl
    dec  sp
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], $00
    call label_1FA2D
    call label_C05
    jr   nz, label_1F9B3
    ld   [hl], $80
    call label_3B12

label_1F996::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, label_1F978
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1F97C
    add  hl, de
    ld   a, [hl]
    call label_1C005
    ld   [hl], a

label_1F9B3::
    ret
    call label_1FA2D
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1F9C2
    call label_1F996

label_1F9C2::
    call label_1FE0A
    call label_3B23
    call label_1FD1A
    call label_C05
    jr   nz, label_1F9D6
    ld   [hl], $30

label_1F9D2::
    call label_3B12
    ld   [hl], b

label_1F9D6::
    ret
    call label_C00
    jr   z, label_1F9F9
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_1F9F9
    ld   a, [$FFF7]
    cp   $15
    jr   nz, label_1F9F9
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_1FA1E
    inc  [hl]
    ld   a, $90
    call label_2373
    jr   label_1FA1E

label_1F9F9::
    ld   a, [hl]
    and  a
    jr   nz, label_1FA1E
    call label_C05
    jr   nz, label_1FA07
    ld   [hl], $18
    call label_1F9D2

label_1FA07::
    call label_1FD1A
    call label_1FD1A
    call label_1FE0A
    call label_3B23
    ld   a, [$FFE7]
    xor  c
    and  $0F
    ret  nz
    ld   a, $0A
    call label_3BAA

label_1FA1E::
    call label_1FE7D
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    jp   label_1FD1A

label_1FA29::
    ld   bc, label_300
    ld   [bc], a

label_1FA2D::
    ld   a, [$C502]
    and  a
    jr   nz, label_1FA55
    call label_1FE5D
    add  a, $30
    cp   $60
    jr   nc, label_1FA6C
    call label_1FE6D
    add  a, $30
    cp   $60
    jr   nc, label_1FA6C
    call label_1FE7D
    ld   d, b
    ld   hl, label_1FA29
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    cp   [hl]
    jr   z, label_1FA6C

label_1FA55::
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   z, label_1FA65
    push hl
    call label_C00
    ld   [hl], $10
    pop  hl

label_1FA65::
    ld   [hl], $02
    call label_C05
    ld   [hl], $80

label_1FA6C::
    ret

label_1FA6D::
    nop
    nop
    ld   sp, hl
    ld   sp, hl
    ld    hl, sp+$F2
    ld   [label_80E], sp
    ld   c, $F8
    db   $F2 ; Undefined instruction
    nop
    nop
    nop
    nop

label_1FA7D::
    ld   [bc], a
    ld   [bc], a
    ld   b, $06
    inc  b
    inc  b
    nop
    nop

label_1FA85::
    inc  c
    inc  c
    inc  b
    inc  b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  d
    inc  d

label_1FA8D::
    inc  d
    inc  d
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  c
    inc  c
    inc  c
    inc  c

label_1FA95::
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

label_1FAB5::
    call label_3D57
    ld   a, [$FFF1]
    cp   $02
    jr   nc, label_1FAC1
    call label_1FB30

label_1FAC1::
    ld   a, [$FFF1]
    cp   $02
    jr   z, label_1FACB
    cp   $03
    jr   nz, label_1FAD1

label_1FACB::
    ld   de, label_1FA95
    call label_3BC0

label_1FAD1::
    push bc
    ld   a, [$FFEC]
    ld   [$FFD7], a
    ld   a, [$FFEE]
    ld   [$FFD8], a
    ld   a, [$FFF1]
    ld   e, a
    ld   d, b
    ld   hl, label_1FA85
    add  hl, de
    ld   a, [hl]
    ld   [$D5C0], a
    ld   hl, label_1FA8D
    add  hl, de
    ld   a, [hl]
    ld   [$D5C2], a
    ld   a, $02
    ld   [$D5C1], a
    ld   [$D5C3], a
    ld   hl, label_1FA7D
    add  hl, de
    ld   a, [hl]
    ld   [$FFD9], a
    ld   hl, label_1FA75
    add  hl, de
    ld   a, [hl]
    ld   hl, label_1FA6D
    add  hl, de
    ld   l, [hl]
    ld   h, a
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   c, l
    ld   b, h
    xor  a
    ld   [$FFDA], a
    pop  hl
    call label_1819
    ld   a, $02
    call label_3DA0
    pop  bc
    ld   a, [$FFF1]
    cp   $02
    ret  z
    cp   $03
    ret  z
    ld   de, label_1FA95
    jp   label_3BC0

label_1FB30::
    xor  $01
    push af
    ld   a, [$C3C0]
    ld   l, a
    ld   h, $00
    ld   de, $C030
    add  hl, de
    pop  de
    ld   a, [$FFEC]
    add  a, d
    add  a, $04
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, $FE
    ldi  [hl], a
    ld   a, $86
    ldi  [hl], a
    ld   [hl], $16
    ld   a, $01
    jp   label_3DA0

label_1FB53::
    add  a, d
    rla
    add  a, [hl]
    inc  d

label_1FB57::
    add  a, d
    dec  d
    add  a, [hl]
    dec  d
    adc  a, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    sbc  a, b
    ld   d, $90
    rla
    sub  a, d
    ld   d, $96
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    dec  d
    add  a, h
    db   $10 ; Undefined instruction
    dec  d
    sbc  a, d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  d
    ret  nz
    inc  d
    jp   nz, label_C414
    inc  d
    add  a, $14
    jp   z, label_C014
    inc  d
    jp   nz, label_C415
    inc  d
    add  a, $14
    jp   z, label_A617
    dec  d
    and  [hl]
    dec  d
    and  [hl]
    dec  d
    and  [hl]
    dec  d
    and  [hl]
    dec  d
    sbc  a, [hl]
    inc  d

label_1FB99::
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, h
    sbc  a, l
    sbc  a, [hl]
    sbc  a, a
    and  b
    and  c
    and  d
    and  e
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d
    xor  h
    xor  e
    xor  l
    xor  [hl]
    xor  [hl]
    rst  $28
    ld   b, $10
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   bc, label_1001
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   bc, label_1010
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_3E00
    ld   [bc], a
    ld   [$FFA1], a
    xor  a
    ld   [$C137], a
    ld   [$C16A], a
    ld   a, [$FFF1]
    cp   $22
    jr   nz, label_1FC29
    ld   a, $1B
    call label_3B86
    jp  c, label_1FEA4
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $18
    ld   hl, $C310
    add  hl, de
    ld   [hl], $06
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $50
    ld   hl, $C240
    add  hl, de
    ld   [hl], $08
    ld   hl, $C290
    add  hl, de
    ld   [hl], $03
    ld   a, $1D
    ld   [$FFF2], a
    jp   label_1FEA4

label_1FC29::
    cp   $21
    jr   z, label_1FC5E
    cp   $10
    jr   nz, label_1FC36
    ld   a, $01
    ld   [$DB0D], a

label_1FC36::
    ld   a, [$FFFE]
    and  a
    jr   z, label_1FC58
    ld   a, [$FFF7]
    cp   $05
    jr   nz, label_1FC49
    ld   a, [$FFF6]
    cp   $CE
    jr   nz, label_1FC58
    jr   label_1FC53

label_1FC49::
    cp   $06
    jr   nz, label_1FC58
    ld   a, [$FFF6]
    cp   $1A
    jr   nz, label_1FC58

label_1FC53::
    ld   de, label_1FB53
    jr   label_1FC5B

label_1FC58::
    ld   de, label_1FB57

label_1FC5B::
    call label_3C77

label_1FC5E::
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_1FE0A
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $10
    jr   nz, label_1FC76
    call label_1C005
    ld   [hl], $00

label_1FC76::
    cp   $08
    jr   nz, label_1FC93
    ld   a, [$FFF1]
    ld   e, a
    ld   d, b
    ld   hl, label_1FBBB
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_1FC93
    cp   $01
    jr   nz, label_1FC90
    ld   a, $01
    ld   [$FFF2], a
    jr   label_1FC93

label_1FC90::
    ld   [$D368], a

label_1FC93::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $26
    jr   nz, label_1FCEA
    ld   a, [$FFF1]
    ld   e, a
    ld   d, b
    cp   $21
    jr   nz, label_1FCB1
    ld   a, [$FFF6]
    cp   $96
    jr   nz, label_1FCB1
    ld   a, $11
    call label_2373
    jr   label_1FCE9

label_1FCB1::
    ld   a, e
    cp   $01
    jr   nz, label_1FCC1
    ld   a, [$DB44]
    cp   $02
    jr   nz, label_1FCC1
    ld   a, $ED
    jr   label_1FCE6

label_1FCC1::
    ld   a, e
    cp   $0B
    jr   nz, label_1FCD1
    ld   a, [$DB4E]
    cp   $02
    jr   nz, label_1FCD1
    ld   a, $9F
    jr   label_1FCE6

label_1FCD1::
    ld   a, e
    cp   $00
    jr   nz, label_1FCE1
    ld   a, [$DB43]
    cp   $02
    jr   nz, label_1FCE1
    ld   a, $EE
    jr   label_1FCE6

label_1FCE1::
    ld   hl, label_1FB99
    add  hl, de
    ld   a, [hl]

label_1FCE6::
    call label_2385

label_1FCE9::
    xor  a

label_1FCEA::
    cp   $28
    ret  nz
    jp   label_1FEA4

label_1FCF0::
    call label_3B5A
    jr   nc, label_1FD14
    call label_CBE
    call label_CB6
    ld   a, [$C1A6]
    and  a
    jr   z, label_1FD12
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_1FD12
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_1FD12::
    scf
    ret

label_1FD14::
    and  a
    ret

label_1FD16::
    ld   b, $04
    ld   [bc], a
    nop

label_1FD1A::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1FD16
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

label_1FD36::
    ld   e, b
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $38
    jr   label_1FD4E

label_1FD43::
    ld   e, b
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $28

label_1FD4E::
    jr   nc, label_1FD94
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_1FD94
    inc  e
    ld   a, [$FFEB]
    cp   $B5
    jr   z, label_1FD6F
    push de
    call label_1FE7D
    ld   a, [$FF9E]
    xor  $01
    cp   e
    pop  de
    jr   nz, label_1FD94

label_1FD6F::
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_1FD94
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_1FD94
    ld   a, [$FFCC]
    and  $10
    jr   z, label_1FD94
    scf
    ret

label_1FD94::
    and  a
    ret

label_1FD96::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_1FDC1

label_1FD9C::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_1FDC1
    cp   $0B
    jr   nz, label_1FDC1
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_1FDC1
    ld   a, [$C19F]
    ld   hl, $C1A8
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_1FDC1
    ld   a, [$C124]
    and  a
    jr   z, label_1FDC2

label_1FDC1::
    pop  af

label_1FDC2::
    ret

label_1FDC3::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1FE09
    dec  a
    ld   [hl], a
    call label_3E8E
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    push af
    call label_1C005
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
    call label_1C005
    ld   [hl], a
    call label_1FE0A
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_1FDFD
    call label_3B23

label_1FDFD::
    call label_1C005
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af

label_1FE09::
    ret

label_1FE0A::
    call label_1FE17
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_1FE17
    pop  bc
    ret

label_1FE17::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1FE42
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_1FE2F::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_1FE39
    ld   e, $F0

label_1FE39::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_1FE42::
    ret

label_1FE43::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1FE42
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_1FE2F

label_1FE5D::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_1FE6B
    inc  e

label_1FE6B::
    ld   d, a
    ret

label_1FE6D::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   nz, label_1FE7B
    inc  e

label_1FE7B::
    ld   d, a
    ret

label_1FE7D::
    call label_1FE5D
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_1FE8A
    cpl
    inc  a

label_1FE8A::
    push af
    call label_1FE6D
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_1FE98
    cpl
    inc  a

label_1FE98::
    pop  de
    cp   d
    jr   nc, label_1FEA0
    ld   a, [$FFD7]
    jr   label_1FEA2

label_1FEA0::
    ld   a, [$FFD8]

label_1FEA2::
    ld   e, a
    ret

label_1FEA4::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_1FEAA::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    or   [hl]
    ld   a, [hl]
    rst  0
    ld   a, [hl]
    sub  a, $7E
    call label_C05
    ld   [hl], $A0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF

label_1FEC1::
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
    jp   label_1FEC1
    call label_C05
    jr   nz, label_1FF13
    ld   a, [$FFEB]
    cp   $5F
    jr   nz, label_1FF0A
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
    ld   hl, $C320
    add  hl, de
    ld   [hl], $18
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $20
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    ld   [$FFB0], a
    jp   label_1FF76

label_1FF0A::
    call label_C4B
    call label_27DD
    jp   label_3F50

label_1FF13::
    jp   label_1FF16

label_1FF16::
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
    jp   label_1FF36

label_1FF36::
    call label_1FD9C
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
    jr   z, label_1FF6A
    call label_1C005
    ld   [hl], $F0
    jr   label_1FF76

label_1FF6A::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C310
    add  hl, de
    ld   [hl], $08

label_1FF76::
    call label_1FEA4
    ld   hl, $FFF4
    ld   [hl], $1A
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
