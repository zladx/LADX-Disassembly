section "bank21",romx,bank[$15]
    call label_3D7F
    ld   hl, $C330
    add  hl, bc
    ld   [hl], b
    ld   hl, $C260
    add  hl, bc
    ld   [hl], b
    ld   hl, $C270
    add  hl, bc
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   hl, $C290
    add  hl, bc
    ld   [hl], b
    ld   hl, $C2A0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C440
    add  hl, bc
    ld   [hl], b
    ld   hl, $C390
    add  hl, bc
    ld   [hl], b
    ld   hl, $C2E0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C2F0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C300
    add  hl, bc
    ld   [hl], b
    ld   hl, $C310
    add  hl, bc
    ld   [hl], b
    ld   hl, $C380
    add  hl, bc
    ld   [hl], b
    xor  a
    call label_3B0C
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C360
    add  hl, bc
    ld   [hl], b
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b
    ld   hl, $C220
    add  hl, bc
    ld   [hl], b
    ld   hl, $C230
    add  hl, bc
    ld   [hl], b
    ld   hl, $C470
    add  hl, bc
    ld   [hl], b
    ld   hl, $C450
    add  hl, bc
    ld   [hl], b
    ld   hl, $C480
    add  hl, bc
    ld   [hl], b
    ld   hl, $C490
    add  hl, bc
    ld   [hl], b
    ld   hl, $C420
    add  hl, bc
    ld   [hl], b
    ld   hl, $C4E0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C4F0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C5D0
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C4A0
    add  hl, bc
    ld   [hl], b
    ret
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_57C31
    call label_57B0D
    ld   a, [$FFF0]
    rst  0
    or   d
    ld   b, b
    pop  bc
    ld   b, b
    push de
    ld   b, b
    ld   a, [$C1CB]
    and  a
    jr   z, label_540C0
    call label_3B12
    call label_C05
    ld   [hl], $20

label_540C0::
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    ret  nz
    ld   [hl], $30
    ld   a, $11
    ld   [$FFF4], a
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    jr   nz, label_540EF
    ld   [$C167], a
    ld   [$C155], a
    ld   a, $39
    call label_2385
    call label_57CDB
    jp   label_57C31

label_540EF::
    ld   e, $01
    and  $04
    jr   z, label_540F7
    ld   e, $FF

label_540F7::
    ld   a, e
    ld   [$C155], a
    ret

label_540FC::
    ld    hl, sp+$17
    ld   a, [label_1117]
    db   $FC ; Undefined instruction
    ld   b, b
    call label_3BC0
    call label_57B0D
    xor  a
    ld   [$FFE8], a
    ld   a, [$FFF0]
    rst  0
    inc  de
    ld   b, c
    daa
    ld   b, c
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    add  a, $10
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    ld   a, [$FFBA]
    cp   $02
    jr   z, label_5416F
    and  a
    jr   z, label_5414D
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   c, label_5414C
    ld   [hl], b
    ld   a, $11
    ld   [$FFF4], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jr   z, label_5414C
    dec  [hl]

label_5414C::
    ret

label_5414D::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jr   z, label_5416B
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    cp   $0D
    jr   c, label_5416F
    ld   [hl], b
    ld   hl, $C210
    add  hl, bc
    inc  [hl]
    jr   label_5416F

label_5416B::
    ld   hl, $FFE8
    inc  [hl]

label_5416F::
    call label_3D8A
    call label_57BDB
    add  a, $0C
    cp   $18
    jr   nc, label_541C9
    call label_57BEB
    add  a, $10
    cp   $1C
    jr   nc, label_541C9
    call label_CB6
    call label_178E
    call label_57C0A
    ld   a, e
    cp   $00
    jr   nz, label_54199
    ld   a, [$FFEE]
    add  a, $0C
    ld   [$FF98], a
    ret

label_54199::
    cp   $01
    jr   nz, label_541A4
    ld   a, [$FFEE]
    add  a, $F4
    ld   [$FF98], a
    ret

label_541A4::
    cp   $02
    jr   nz, label_541B9
    ld   a, [$FFEB]
    cp   $47
    jr   nz, label_541B2
    ld   a, [$FFE8]
    and  a
    ret  nz

label_541B2::
    ld   a, [$FFEC]
    add  a, $F0
    ld   [$FF99], a
    ret

label_541B9::
    ld   a, [$FFEB]
    cp   $46
    jr   nz, label_541C3
    ld   a, [$FFE8]
    and  a
    ret  nz

label_541C3::
    ld   a, [$FFEC]
    add  a, $0C
    ld   [$FF99], a

label_541C9::
    ret
    ld   de, label_540FC
    call label_3BC0
    call label_57B0D
    xor  a
    ld   [$FFE8], a
    ld   a, [$FFF0]
    rst  0
    db   $41
    ld   b, c
    pop  af
    ld   b, c
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    sub  a, $10
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    ld   a, [$FFBA]
    cp   $02
    jr   z, label_54239
    and  a
    jr   z, label_54217
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   c, label_54216
    ld   [hl], b
    ld   a, $11
    ld   [$FFF4], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jr   z, label_54216
    inc  [hl]

label_54216::
    ret

label_54217::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jr   z, label_54235
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    cp   $0D
    jr   c, label_54239
    ld   [hl], b
    ld   hl, $C210
    add  hl, bc
    dec  [hl]
    jr   label_54239

label_54235::
    ld   hl, $FFE8
    inc  [hl]

label_54239::
    jp   label_5416F
    ld   de, label_540FC
    call label_3BC0
    call label_57B0D
    xor  a
    ld   [$FFE8], a
    ld   a, [$FFF0]
    rst  0
    ld   c, a
    ld   b, d
    ld   h, e
    ld   b, d
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    add  a, $10
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    ld   a, [$FFBA]
    cp   $02
    jr   z, label_542AB
    and  a
    jr   z, label_54289
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   c, label_54288
    ld   [hl], b
    ld   a, $11
    ld   [$FFF4], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    cp   [hl]
    jr   z, label_54288
    dec  [hl]

label_54288::
    ret

label_54289::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    cp   [hl]
    jr   z, label_542A7
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    cp   $0D
    jr   c, label_542AB
    ld   [hl], b
    ld   hl, $C200
    add  hl, bc
    inc  [hl]
    jr   label_542AB

label_542A7::
    ld   hl, $FFE8
    inc  [hl]

label_542AB::
    jp   label_5416F
    ld   de, label_540FC
    call label_3BC0
    call label_57B0D
    xor  a
    ld   [$FFE8], a
    ld   a, [$FFF0]
    rst  0
    pop  bc
    ld   b, d
    push de
    ld   b, d
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    sub  a, $10
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    jp   label_3B12
    ld   a, [$FFBA]
    cp   $02
    jr   z, label_5431D
    and  a
    jr   z, label_542FB
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   c, label_542FA
    ld   [hl], b
    ld   a, $11
    ld   [$FFF4], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    cp   [hl]
    jr   z, label_542FA
    inc  [hl]

label_542FA::
    ret

label_542FB::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    cp   [hl]
    jr   z, label_54319
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    cp   $0D
    jr   c, label_5431D
    ld   [hl], b
    ld   hl, $C200
    add  hl, bc
    dec  [hl]
    jr   label_5431D

label_54319::
    ld   hl, $FFE8
    inc  [hl]

label_5431D::
    jp   label_5416F

label_54320::
    ld   e, b
    inc  bc
    ld   e, b
    inc  hl
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    call label_C05
    rla
    and  $10
    ld   [$FFED], a
    ld   de, label_54320
    call label_3BC0
    call label_57B0D
    call label_C56
    call label_3B70
    call label_57A6E
    call label_3B23
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_54364
    ld   [hl], b
    ld   a, [$D6F8]
    and  a
    jr   nz, label_54364
    ld   a, $01
    ld   [$D6F8], a
    call label_C05
    ld   [hl], $18
    ld   a, $0E
    ld   [$FFF3], a

label_54364::
    ret
    ld   a, [$FFF0]
    and  a
    jp   nz, label_543CA
    call label_57B0D
    call label_C05
    jr   nz, label_543AD
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    ld   a, [$FF99]
    cp   $18
    ret  c
    ld   a, $45
    call label_3B86
    ret  c
    call label_280D
    rla
    rla
    rla
    rla
    and  $70
    add  a, $18
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   [hl], $10
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C350
    add  hl, de
    set  7, [hl]
    ld   hl, $C290
    add  hl, de
    inc  [hl]

label_543AD::
    ret
    ld   e, h
    nop
    ld   e, [hl]
    nop
    ld   e, [hl]
    jr   nz, label_54411
    jr   nz, label_54415
    ld   h, b
    ld   e, h
    ld   h, b
    ld   e, h
    ld   b, b
    ld   e, [hl]
    ld   b, b

label_543BE::
    inc  c
    db   $F4 ; Undefined instruction
    dec  b
    ei

label_543C2::
    ld   [label_60A], sp
    inc  c

label_543C6::
    jr   label_543E8
    inc  e
    jr   z, label_543DC
    xor  [hl]
    ld   b, e
    call label_3BC0
    call label_57B0D
    call label_C56
    call label_3B39
    ld   a, [$FFE7]
    rra

label_543DC::
    rra
    rra
    and  $03
    call label_3B0C
    call label_57B88
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_54430
    ld   [hl], b
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_543BE
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b

label_54411::
    ld   hl, label_543C2
    add  hl, de

label_54415::
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_543C6
    add  hl, de
    ld   a, [hl]
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    ld   a, $20
    ld   [$FFF2], a

label_54430::
    ld   a, [$FFEE]
    cp   $A8
    jp   nc, label_57C31
    ld   a, [$FFEC]
    cp   $84
    jp   nc, label_57C31
    ret
    call label_57B0D
    ld   e, $0F
    ld   d, b

label_54445::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   nz, label_5448C
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $08
    jr   nz, label_5448C
    ld   hl, $C2E0
    add  hl, de
    ld   a, [hl]
    cp   $08
    jr   nz, label_5448C
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_5448C
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_5448C
    ld   a, [$FFF6]
    cp   $DF
    ld   a, $92
    jr   z, label_54489
    ld   a, [$DB79]
    and  a
    ret  nz
    ld   a, $43

label_54489::
    jp   label_2385

label_5448C::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_54445
    ret
    call label_57B0D
    call label_57ABC
    ret  nc
    ld   a, $12
    jp   label_2385

label_5449F::
    rst  $38
    nop
    rst  $38
    nop
    ld   d, h
    nop
    ld   d, [hl]
    nop
    ld   e, b
    nop
    ld   e, d
    nop
    ld   d, [hl]
    jr   nz, label_54502
    jr   nz, label_5450A
    jr   nz, label_5450A
    jr   nz, label_54510
    nop
    ld   e, h
    jr   nz, label_54516
    nop
    ld   e, [hl]
    nop
    ld   a, [$FFF1]
    cp   $FF
    jr   z, label_544D7
    cp   $05
    jr   c, label_544D1
    sub  a, $05
    ld   [$FFF1], a
    ld   de, label_544B3
    call label_3C77
    jr   label_544D7

label_544D1::
    ld   de, label_5449F
    call label_3BC0

label_544D7::
    call label_57B0D
    call label_57B3E
    call label_57B88
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, h
    nop
    ld   b, l
    ld   d, e
    ld   b, l
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $08
    call label_C05
    call label_280D
    and  $7F
    add  a, $40
    ld   [hl], a
    jp   label_3B12
    call label_3B44
    call label_C05
    jr   nz, label_54530
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $12
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    call label_3B12
    ld   hl, $C240
    add  hl, bc
    sla  [hl]

label_5451D::
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $00
    ld   [$FFD8], a
    ld   a, $01
    jp   label_CC7

label_54530::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_54541
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_54541::
    ld   hl, $C240
    add  hl, bc
    ld   e, $06
    ld   a, [hl]
    and  $80
    jr   z, label_5454E
    ld   e, $05

label_5454E::
    ld   a, e
    jp   label_3B0C
    ret
    call label_3B39
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_54588
    ld   [hl], b
    call label_5451D
    call label_C05
    call label_280D
    and  $7F
    add  a, $50
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    sra  [hl]
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $52
    call label_3B12
    ld   [hl], $01
    ret

label_54588::
    ld   e, $01
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_54595
    ld   e, $03

label_54595::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_5459F
    inc  e

label_5459F::
    ld   a, e
    jp   label_3B0C

label_545A3::
    nop
    nop
    ld   b, [hl]
    rlca
    nop
    ld   [label_77E], sp
    ld   a, [$FF00]
    ld   b, [hl]
    rlca
    ld   a, [$FF08]
    ld   a, [hl]
    rlca
    ld   [rJOYP], a
    ld   b, [hl]
    rlca
    ld   [$FF08], a
    ld   a, [hl]
    rlca
    ret  nc
    nop
    ld   b, [hl]
    rlca
    ret  nc
    ld   [label_77E], sp
    ret  nz
    nop
    ld   b, [hl]
    rlca
    ret  nz
    ld   [label_77E], sp

label_545CB::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    add  a, $01
    sla  a
    ld   c, a
    ld   hl, label_545A3
    call label_3CE6
    ld   a, $0A
    call label_3DA0
    call label_57B0D
    ld   a, [$DB95]
    cp   $01
    ret  z
    ld   a, [$FFF0]
    rst  0
    or   $45
    cp   $45
    daa
    ld   b, [hl]
    dec  a
    ld   b, [hl]
    ld   h, b
    ld   b, [hl]
    call label_C05
    ld   [hl], $C0
    jp   label_3B12
    call label_C05
    cp   $40
    jr   nz, label_5460B
    dec  [hl]
    ld   a, $D7
    jp   label_2385

label_5460B::
    and  a
    ret  nz
    ld   a, $50
    dec  a
    ld   [$FFD7], a
    ld   a, $30
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $2F
    ld   [$FFF2], a
    ld   a, $00
    call label_3B0C
    jp   label_3B12
    ld   a, [$FF98]
    sub  a, $50
    add  a, $08
    cp   $10
    jr   nc, label_5463A
    ld   a, [$FF99]
    sub  a, $30
    add  a, $08
    cp   $10
    ret  c

label_5463A::
    jp   label_3B12
    ld   a, [$FF98]
    sub  a, $50
    add  a, $08
    cp   $10
    jr   nc, label_5465F
    ld   a, [$FF99]
    sub  a, $30
    add  a, $08
    cp   $10
    jr   nc, label_5465F
    ld   a, [$C146]
    and  a
    ret  nz
    call label_3B12
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $30

label_5465F::
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF99], a
    ld   a, $50
    ld   [$FF98], a
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_54682
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   z, label_54682
    inc  [hl]

label_54682::
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_5469C
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    cp   $12
    jr   nc, label_5469C
    xor  a
    ld   [$DB96], a
    ld   a, $01
    ld   [$DB95], a
    ret

label_5469C::
    ld   a, $02
    ld   [$FF9E], a
    ld   a, [$FFE7]
    and  $08
    ld   [$C120], a
    push bc
    call label_BF0
    pop  bc
    call label_CAF
    ld   [$C137], a
    ld   [$C16A], a
    ret
    ld   a, [$DB56]
    cp   $80
    jp   nz, label_57C31
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_546D0
    ld   a, [$FFF1]
    cp   $0C
    jr   nc, label_546D0
    add  a, $06
    ld   [$FFF1], a

label_546D0::
    call label_54AC9
    ld   a, [$FFEA]
    cp   $01
    jr   nz, label_546E1
    ld   a, $0C
    call label_548B6
    jp   label_57C37

label_546E1::
    call label_394D
    call label_57B0D
    call label_57B3E
    call label_3B39
    ld   hl, $C430
    add  hl, bc
    set  6, [hl]
    ld   hl, $C340
    add  hl, bc
    res  7, [hl]
    call label_57B88
    call label_3B23
    call label_57BC1
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
    jr   z, label_5471A
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_5471A::
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    rst  0
    inc  [hl]
    ld   b, a
    ld   d, b
    ld   b, a
    add  a, b
    ld   b, a
    ccf
    ld   c, b
    ld   [hl], e
    ld   c, b
    rst  8
    ld   c, b
    ld   c, h
    ld   c, c
    ld   [hl], a
    ld   c, c
    sbc  a, h
    ld   c, c
    jp   nz, label_CD49
    dec  b
    inc  c
    ld   [hl], $20
    xor  a
    ld   [$D228], a
    call label_3B0C
    call label_3B12

label_54743::
    call label_57BDB
    ld   a, e
    ld   [$D227], a
    ld   hl, $C380
    add  hl, bc

label_5474E::
    ld   [hl], a
    ret
    call label_C05
    ret  nz
    ld   a, $91
    call label_2373
    ld   hl, $C19F

label_5475C::
    res  7, [hl]
    call label_3B12
    call label_BFB
    ld   [hl], $30
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $84
    ld   a, $01
    ld   [$D228], a
    ld   a, $01
    jp   label_3B0C

label_54776::
    ld   [$FCF8], sp
    db   $FC ; Undefined instruction

label_5477A::
    jr   nz, label_5475C

label_5477C::
    nop
    nop

label_5477E::
    ret  nc
    jr   nc, label_5474E
    nop
    inc  c
    jr   z, label_547E3
    cp   $0C
    jr   nz, label_547D1
    ld   a, $0C
    call label_3B86
    jr   c, label_547D1
    ld   a, $0A
    ld   [$FFF4], a
    push bc
    ld   a, [$FFD9]
    ld   c, a
    ld   hl, label_54776
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_54778
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_5477A
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_5477C
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD9]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    pop  bc

label_547D1::
    call label_C00
    ld   e, $00
    cp   $0C
    jr   c, label_547DC
    ld   e, $02

label_547DC::
    ld   a, e
    call label_3B0C
    jp   label_3D7F

label_547E3::
    call label_BFB
    jr   nz, label_547F3
    call label_C05
    ld   [hl], $30
    call label_3D7F
    jp   label_3B12

label_547F3::
    ld   a, [$FFE8]
    and  a
    jr   z, label_54816
    ld   a, [$FF98]
    push af
    call label_57BDB
    ld   d, b
    ld   hl, label_5477E
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]

label_54806::
    ld   [$FF98], a
    ld   a, $0C
    call label_3BAA
    pop  af
    ld   [$FF98], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10

label_54816::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   [$D228], a
    call label_54743
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_5483C
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    call label_C00
    ld   [hl], $18

label_5483C::
    ret

label_5483D::
    jr   z, label_54817
    call label_C05
    jr   nz, label_5485C
    ld   [hl], $22
    call label_3D7F
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_5483D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    jp   label_3B12

label_5485C::
    and  $07
    jr   nz, label_54864
    ld   a, $09
    ld   [$FFF2], a

label_54864::
    call label_3D7F
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $02
    jp   label_3B0C
    call label_C05
    jr   nz, label_5487E
    call label_3B12
    jp   label_3B12

label_5487E::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_548AE
    xor  a
    ld   [$C158], a
    ld   a, $20
    ld   [$C157], a
    ld   a, $0B
    ld   [$FFF2], a
    ld   hl, $C240
    add  hl, bc
    sra  [hl]
    sra  [hl]
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $28
    call label_3B12
    call label_C05
    ld   [hl], $60

label_548AE::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    add  a, $04

label_548B6::
    call label_3B0C
    ld   a, $FF
    ld   [$D228], a
    ret

label_548BF::
    nop
    cp   $FD
    cp   $00
    ld   [bc], a
    inc  bc
    ld   [bc], a

label_548C7::
    nop
    inc  b
    ld   [label_100C], sp
    inc  c
    ld   [label_2104], sp
    jr   nc, label_54896
    add  hl, bc
    res  6, [hl]
    ld   hl, $C340
    add  hl, bc
    set  7, [hl]
    call label_C05
    jr   nz, label_548F0
    ld   [hl], $40
    call label_3B12
    call label_3B12
    ld   a, $00
    ld   [$D228], a
    jp   label_3B0C

label_548F0::
    ld   a, [$FFE8]
    and  a
    jr   z, label_548F8
    call label_3D7F

label_548F8::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $0C
    call label_3B0C
    ld   a, [$C3C0]
    ld   e, a
    ld   d, b
    ld   hl, $C030
    add  hl, de
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $07
    call label_5491C
    ld   a, $02
    jp   label_3DA0

label_5491C::
    call label_54928
    ld   a, [$FFE7]
    rra
    rra
    rra
    add  a, $04
    and  $07

label_54928::
    push bc
    push hl
    ld   e, a
    ld   d, $00
    ld   hl, label_548BF
    add  hl, de
    ld   b, [hl]
    ld   hl, label_548C7
    add  hl, de
    ld   c, [hl]
    pop  hl
    ld   a, [$FFEC]
    add  a, b
    add  a, $F6
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, c
    add  a, $FC
    ldi  [hl], a
    ld   [hl], $24
    inc  hl
    ld   [hl], $00
    inc  hl
    pop  bc
    ret
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $FE
    jr   nz, label_54960
    call label_3D7F
    call label_C05
    ld   [hl], $40
    jp   label_3B12

label_54960::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_5496D
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_5496D::
    dec  [hl]
    dec  [hl]
    ld   a, $00
    ld   [$D228], a
    jp   label_3B0C
    call label_3D7F
    call label_C05
    jr   nz, label_54990

label_5497F::
    call label_BFB
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    call label_3B12
    ld   [hl], $02
    ret

label_54990::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    ld   [$D227], a
    ret
    call label_3B12
    call label_C05
    ld   [hl], $60
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   [$FF9A], a
    ld   a, $28
    ld   [$C13E], a
    ld   a, $40
    ld   [$DBC7], a
    ld   a, [$DB94]
    add  a, $08
    ld   [$DB94], a
    ld   a, $0B
    ld   [$FFF2], a
    ret
    call label_3D7F
    call label_C05
    jr   nz, label_549CD
    jp   label_5497F

label_549CD::
    cp   $40
    ld   a, $00
    jr   nc, label_549DC
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01

label_549DC::
    call label_3B0C
    ld   [$D228], a
    jp   label_54743

label_549E5::
    ld    hl, sp+$FC
    ld   d, h
    ldi  [hl], a
    ld    hl, sp+$04
    ld   d, d
    ldi  [hl], a
    ld    hl, sp+$0C
    ld   d, b
    ldi  [hl], a
    rst  $30
    db   $FC ; Undefined instruction
    ld   d, h
    ldi  [hl], a
    rst  $30
    inc  b
    ld   d, d
    ldi  [hl], a
    rst  $30
    inc  c
    ld   d, b
    ldi  [hl], a
    ld    hl, sp+$FC
    ld   d, b
    ld   [bc], a
    ld    hl, sp+$04
    ld   d, d
    ld   [bc], a
    ld    hl, sp+$0C
    ld   d, h
    ld   [bc], a
    rst  $30
    db   $FC ; Undefined instruction
    ld   d, b
    ld   [bc], a
    rst  $30
    inc  b
    ld   d, d
    ld   [bc], a
    rst  $30
    inc  c
    ld   d, h
    ld   [bc], a

label_54A15::
    nop
    db   $FC ; Undefined instruction
    ld   d, [hl]
    ld   [bc], a
    nop
    inc  b
    ld   e, b
    ld   [bc], a
    nop
    inc  c
    ld   e, d
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   e, h
    ld   [bc], a
    nop
    inc  b
    ld   e, b
    ld   [bc], a
    nop
    inc  c
    ld   e, [hl]
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   e, h
    ld   [bc], a
    nop
    inc  b
    ld   e, b
    ld   [bc], a
    nop
    inc  c
    ld   e, d
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   d, [hl]
    ld   [bc], a
    nop
    inc  b
    ld   e, b
    ld   [bc], a
    nop
    inc  c
    ld   e, [hl]
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   [bc], a
    nop
    inc  b
    ld   [hl], d
    ld   [bc], a
    nop
    inc  c
    ld   [hl], h
    ld   [bc], a
    ld   bc, label_570FC
    ld   [bc], a
    nop
    inc  b
    db   $76 ; Halt
    ld   [bc], a
    nop
    inc  c
    ld   a, b
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   e, d
    ldi  [hl], a
    nop
    inc  b
    ld   e, b
    ldi  [hl], a
    nop
    inc  c
    ld   d, [hl]
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   e, [hl]
    ldi  [hl], a
    nop
    inc  b
    ld   e, b
    ldi  [hl], a
    nop
    inc  c
    ld   e, h
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   e, d
    ldi  [hl], a
    nop
    inc  b
    ld   e, b
    ldi  [hl], a
    nop
    inc  c
    ld   e, h
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   e, [hl]
    ldi  [hl], a
    nop
    inc  b
    ld   e, b
    ldi  [hl], a
    nop
    inc  c
    ld   d, [hl]
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   [hl], h
    ldi  [hl], a
    nop
    inc  b
    ld   [hl], d
    ldi  [hl], a
    nop
    inc  c
    ld   [hl], b
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   a, b
    ldi  [hl], a
    nop
    inc  b
    db   $76 ; Halt
    ldi  [hl], a
    ld   bc, label_5700C
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   a, d
    ld   [bc], a
    nop
    inc  b
    ld   a, h
    ld   [bc], a
    nop
    inc  c
    ld   a, [hl]
    ld   [bc], a
    nop
    db   $FC ; Undefined instruction
    ld   a, [hl]
    ldi  [hl], a
    nop
    inc  b
    ld   a, h
    ldi  [hl], a
    nop
    inc  c
    ld   a, d
    ldi  [hl], a

label_54ABD::
    inc  c
    rst  $38
    ld   h, $02
    inc  c
    inc  b
    ld   h, $02
    inc  c
    add  hl, bc
    ld   h, $02

label_54AC9::
    ld   a, [$D227]
    sla  a
    ld   e, a
    ld   a, [$D228]
    cp   $FF
    jr   z, label_54AEB
    add  a, e
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_549E5
    add  hl, de
    ld   c, $03
    call label_3CE6

label_54AEB::
    ld   a, [$FFF1]
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_54A15
    add  hl, de
    ld   c, $03
    call label_3CE6
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$FFEF]
    ld   [$FFEC], a
    ld   hl, label_54ABD
    ld   c, $03
    call label_3CE6

label_54B14::
    jp   label_3D8A

label_54B17::
    db   $E8 ; add  sp, d
    cp   $74
    nop
    db   $E8 ; add  sp, d
    ld   b, $74
    jr   nz, label_54B14
    ld   bc, $0076
    db   $F4 ; Undefined instruction
    add  hl, bc
    db   $76 ; Halt
    jr   nz, label_54B28

label_54B28::
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp
    db   $E8 ; add  sp, d
    nop
    ld   [hl], h
    nop
    db   $E8 ; add  sp, d
    ld   [label_2074], sp
    db   $F4 ; Undefined instruction
    nop
    db   $76 ; Halt
    nop
    db   $F4 ; Undefined instruction
    ld   [label_2076], sp
    nop
    nop
    db   $76 ; Halt
    nop
    nop

label_54B44::
    ld   [label_2076], sp
    db   $E8 ; add  sp, d
    ld   [bc], a
    ld   [hl], h
    nop
    db   $E8 ; add  sp, d
    ld   a, [bc]
    ld   [hl], h
    jr   nz, label_54B44
    rst  $38
    db   $76 ; Halt
    nop
    db   $F4 ; Undefined instruction
    rlca
    db   $76 ; Halt
    jr   nz, label_54B58

label_54B58::
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp
    db   $E8 ; add  sp, d
    nop
    ld   [hl], h
    nop
    db   $E8 ; add  sp, d
    ld   [label_2074], sp
    db   $F4 ; Undefined instruction
    nop
    db   $76 ; Halt
    nop
    db   $F4 ; Undefined instruction
    ld   [label_2076], sp
    nop
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp

label_54B77::
    db   $F4 ; Undefined instruction
    rst  $38
    ld   [hl], h
    nop
    db   $F4 ; Undefined instruction
    rlca
    ld   [hl], h
    jr   nz, label_54B80

label_54B80::
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp
    db   $F4 ; Undefined instruction
    nop
    ld   [hl], h
    nop
    db   $F4 ; Undefined instruction
    ld   [label_2074], sp
    nop
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp
    db   $F4 ; Undefined instruction
    ld   bc, $0074
    db   $F4 ; Undefined instruction
    add  hl, bc
    ld   [hl], h
    jr   nz, label_54BA0

label_54BA0::
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp
    db   $F4 ; Undefined instruction
    nop
    ld   [hl], h
    nop
    db   $F4 ; Undefined instruction
    ld   [label_2074], sp
    nop
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp

label_54BB7::
    nop
    rst  $38
    ld   [hl], h
    nop
    nop
    rlca
    ld   [hl], h
    jr   nz, label_54BC0

label_54BC0::
    nop
    ld   [hl], h
    nop
    nop
    ld   [label_2074], sp
    nop
    ld   bc, $0074
    nop
    add  hl, bc
    ld   [hl], h
    jr   nz, label_54BD0

label_54BD0::
    nop
    ld   [hl], h
    nop
    nop
    ld   [label_2074], sp

label_54BD7::
    ld   a, [$00FC]
    inc  b
    ld   b, $04
    nop
    db   $FC ; Undefined instruction
    ld   a, [label_21FC]
    or   b
    jp   nz, label_57E09
    and  a
    jp   nz, label_54CD9
    call label_54C85
    call label_57B0D
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jr   nc, label_54C49
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $02
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $14
    jr   nz, label_54C49
    dec  [hl]
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, $E3
    call label_3B86
    jr   c, label_54C49
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
    inc  [hl]
    push bc
    ld   c, e
    ld   b, d
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, bc
    ld   [hl], $18
    pop  bc

label_54C49::
    call label_C56
    call label_3B39
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    and  $03
    call label_3B0C
    call label_C05
    jr   nz, label_54C7F
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_54BD9
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_54BD7
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_54C7F::
    call label_57B88
    jp   label_3B23

label_54C85::
    ld   d, b
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_54CA9
    ld   a, [$FFF1]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    rla
    and  $F0
    add  a, e
    ld   e, a
    ld   hl, label_54B17
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, $04
    jp   label_3DA0

label_54CA9::
    cp   $02
    jr   z, label_54CC4
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   hl, label_54B77
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $02
    jp   label_3DA0

label_54CC4::
    ld   a, [$FFF1]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   hl, label_54BB7
    add  hl, de
    ld   c, $02
    jp   label_3CE6
    db   $76 ; Halt
    nop
    db   $76 ; Halt
    jr   nz, label_54CEB
    push de
    ld   c, h
    call label_3BC0
    call label_57B0D
    call label_57B3E
    call label_C05
    jr   nz, label_54CED
    call label_3B39

label_54CED::
    call label_57B88
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_54D03
    ld   hl, $C240
    call label_54D0F
    ret  c

label_54D03::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0C
    jr   z, label_54D39
    ld   hl, $C250

label_54D0F::
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   a, $09
    ld   [$FFF2], a
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $03
    jr   c, label_54D39
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $2F
    ld   [$FFF2], a
    call label_57C31
    scf
    ret

label_54D39::
    and  a
    ret

label_54D3B::
    ld   [hl], b
    ld   [bc], a
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], d
    inc  bc
    ld   [hl], d
    inc  hl
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_54DB5
    ld   de, label_54D3B
    call label_3BC0
    call label_C00
    ld   e, $00
    and  a
    jr   z, label_54D5B
    inc  e

label_54D5B::
    ld   a, e
    call label_3B0C
    call label_57B0D
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $0F
    jr   nz, label_54D9C
    call label_C00
    ld   [hl], $08
    ld   a, $E2
    call label_3B86
    ret  c
    ld   a, $12
    ld   [$FFF4], a
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    add  a, $04
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], $10
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $30

label_54D9C::
    ret

label_54D9D::
    ld   a, b
    ld   [bc], a
    ld   a, b
    ldi  [hl], a
    db   $76 ; Halt
    ld   [bc], a
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], h
    ld   [bc], a
    ld   [hl], h
    ldi  [hl], a

label_54DA9::
    ld   a, d
    ld   [bc], a
    ld   a, h
    ld   [bc], a
    ld   a, h
    ldi  [hl], a
    ld   a, d
    ldi  [hl], a

label_54DB1::
    db   $FC ; Undefined instruction
    inc  b

label_54DB3::
    db   $F4 ; Undefined instruction
    inc  c

label_54DB5::
    cp   $02
    jp   z, label_54E62
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [$FFED], a
    ld   de, label_54D9D
    call label_3BC0
    call label_57B0D
    call label_C56
    call label_3B70
    ld   a, [$DBC7]
    push af
    call label_3B5A
    pop  af
    ld   e, a
    ld   a, [$DBC7]
    cp   e
    jr   z, label_54DF2
    cp   $20
    jr   c, label_54DF2
    ld   a, $1F
    ld   [$DBC7], a
    ld   a, $30
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a

label_54DF2::
    call label_57B8B
    ld   a, [$FFF0]
    and  a
    jr   z, label_54E49
    xor  a

label_54DFB::
    ld   [$FFE8], a
    ld   a, $E2
    call label_3B86
    jr   c, label_54E46
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, label_54DB1
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_54DB3
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    add  a, $00
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, de
    ld   [hl], $0C
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20
    pop  bc
    ld   a, [$FFE8]
    inc  a
    cp   $02
    jr   c, label_54DFB

label_54E46::
    jp   label_57C31

label_54E49::
    call label_C05
    jp   z, label_57C31
    ld   hl, $C3B0
    add  hl, bc
    cp   $10
    jr   z, label_54E5B
    cp   $20
    jr   nz, label_54E61

label_54E5B::
    ld   a, [hl]
    cp   $02
    jr   z, label_54E61
    inc  [hl]

label_54E61::
    ret

label_54E62::
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [$FFED], a
    ld   de, label_54DA9
    call label_3BC0
    call label_57B0D
    call label_57B88
    call label_C05
    jp   z, label_57C31
    ret

label_54E7D::
    ld   c, d
    ld   bc, $014C
    ld   c, h
    ld   hl, label_214A
    ld   c, [hl]
    ld   bc, label_214E

label_54E89::
    nop
    ld   b, $FA
    ld   a, [label_54806]
    ld   bc, label_56148
    ld   c, b
    ld   b, c
    ld   c, b
    ld   hl, $B021
    jp   nz, label_57E09
    and  a
    jr   z, label_54EEE
    ld   de, label_54E8E
    call label_3BC0
    call label_57B0D
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_57B88
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_54ECB
    call label_3B39
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_54EDF

label_54ECB::
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $07
    ld   [$FFF2], a
    ld   a, $05
    call label_CC7
    jp   label_57C31

label_54EDF::
    ld   a, [$FFEE]
    cp   $A8
    jp   nc, label_57C31
    ld   a, [$FFEC]
    cp   $84
    jp   nc, label_57C31
    ret

label_54EEE::
    ld   de, label_54E7D
    call label_3BC0
    call label_57B0D
    call label_57B3E
    call label_C05
    jr   nz, label_54F02
    call label_3B39

label_54F02::
    call label_C00
    cp   $01
    jr   nz, label_54F50
    ld   a, [$FFF7]
    cp   $03
    ret  c
    ld   a, $1E
    call label_3B86
    ret  c
    ld   a, $0A
    ld   [$FFF4], a
    ld   hl, $C410
    add  hl, de
    ld   [hl], b
    ld   hl, $C340
    add  hl, de
    set  6, [hl]
    set  4, [hl]
    ld   hl, $C430
    add  hl, de
    set  1, [hl]
    set  4, [hl]
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
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    push bc
    ld   c, e
    ld   b, d
    ld   a, $18
    call label_3BAA
    pop  bc

label_54F50::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   e, d
    ld   c, a
    ld   a, [de]
    ld   d, b
    call label_57B88
    call label_3B23
    ld   a, [$FFCC]
    and  $30
    jr   z, label_54FAE
    call label_57BDB
    add  a, $24
    cp   $48
    jr   nc, label_54FAE
    call label_57BEB
    add  a, $24
    cp   $48
    jr   nc, label_54FAE
    call label_C05
    ld   [hl], $08
    call label_C00
    ld   [hl], b
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $15
    ld   a, $24
    ld   [$FFF2], a
    ld   a, $12
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
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], $02
    ret

label_54FAE::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   nz, label_54FC6
    ld   a, [hl]
    and  $0C
    jr   z, label_54FCE
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    xor  $F0
    ld   [hl], a
    jr   label_54FCE

label_54FC6::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    xor  $F0
    ld   [hl], a

label_54FCE::
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_54FDD
    call label_280D
    and  $2F
    jr   nz, label_5500A

label_54FDD::
    xor  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_54E89
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    and  a
    jr   nz, label_5500A
    call label_280D
    and  $01
    add  a, $03
    ld   e, a
    ld   d, b
    ld   hl, label_54E89
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_5500A::
    ld   hl, $C290
    add  hl, bc
    xor  a
    ld   [hl], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_57B88
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    push hl
    ld   [hl], $01
    call label_3B23
    pop  hl
    ld   [hl], b
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_55057
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    call label_C00
    ld   [hl], $10

label_55057::
    ret

label_55058::
    ld   [$EAEB], a
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [$FFF1]
    ld   a, [$FF00+C]

label_55064::
    ld   a, [$D219]
    rla
    and  $FE
    ld   e, a
    ld   d, b
    ld   hl, label_55058
    add  hl, de
    ld   a, [hli]
    ld   [$C195], a
    ld   a, [hl]
    ld   [$C196], a
    ld   a, $01
    ld   [$FF91], a
    ld   [$C10E], a
    ret
    ld   a, [$C124]
    and  a
    jr   nz, label_55093
    ld   a, [$C116]
    and  a
    jr   nz, label_55093
    inc  a
    ld   [$C116], a
    call label_55064

label_55093::
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_545CB
    and  a
    jp   nz, label_554D6
    ld   a, [$D219]
    rst  0
    or   c
    ld   d, b
    rst  $18
    ld   d, c
    ld   b, e
    ld   d, a
    rst  $10
    ld   e, a
    ret  z
    ld   h, e
    dec  hl
    ld   l, [hl]
    ld   a, [$FFF0]
    rst  0
    jp   nz, label_1D50
    ld   d, c
    jr   c, label_5510B
    ld   d, e
    ld   d, c
    ld   l, [hl]
    ld   d, c
    sub  a, c
    ld   d, c
    or   l
    ld   d, c
    ld   a, [$C146]
    and  a
    ret  nz
    ld   a, $5D
    ld   [$D368], a
    ld   hl, $DA74
    set  6, [hl]
    ld   a, $F5
    call label_2385
    call label_C05
    ld   [hl], $50
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   e, $80
    ld   hl, $D000

label_550E7::
    ldi  [hl], a
    dec  e
    jr   nz, label_550E7
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   e, $80
    ld   hl, $D100

label_550F7::
    ldi  [hl], a
    dec  e
    jr   nz, label_550F7
    xor  a
    ld   [$D21A], a
    ld   [$D21B], a
    ld   [$D21C], a
    ld   [$D21D], a
    ld   [$D21E], a

label_5510B::
    ld   [$D21F], a
    ld   [$D220], a
    ld   [$D221], a
    ld   [$D222], a
    ld   [$D223], a
    jp   label_3B12
    call label_55631
    call label_C05
    jr   nz, label_5512D
    call label_3B12

label_55128::
    ld   a, $35
    ld   [$FFF2], a
    ret

label_5512D::
    cp   $30
    jr   nz, label_55137
    dec  [hl]
    ld   a, $23
    ld   [$D368], a

label_55137::
    ret
    call label_55631
    call label_57B0D
    ld   hl, $C250
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    cp   $E8
    jr   nz, label_55150
    call label_C05
    ld   [hl], $08
    call label_3B12

label_55150::
    jp   label_57B8B
    call label_55631
    call label_57B0D
    call label_57B8B
    call label_C05
    ret  nz
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    ret  nz
    call label_C05
    ld   [hl], $80
    jp   label_3B12
    call label_55631
    call label_C05
    jr   z, label_55184
    and  $07
    jr   nz, label_55184
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   z, label_55185
    inc  [hl]

label_55184::
    ret

label_55185::
    call label_C05
    ld   [hl], $C0
    jp   label_3B12

label_5518D::
    ld   b, $05
    rlca
    dec  b
    call label_5569F
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_5518D
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    call label_C05
    ret  nz
    ld   [hl], $2F
    jp   label_3B12

label_551AF::
    ld   [$0100], sp
    ld   [bc], a
    inc  bc
    inc  b
    call label_5569F
    call label_C05
    jr   nz, label_551D0
    ld   hl, $D219
    inc  [hl]
    xor  a
    call label_3B0C
    call label_3B12
    ld   [hl], b
    ld   hl, $C340
    add  hl, bc
    res  7, [hl]
    ret

label_551D0::
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_551AF
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    call label_5572B
    call label_57B0D
    call label_C56
    ld   a, [$FFF0]
    rst  0
    rst  $38
    ld   d, c
    inc  c
    ld   d, d
    inc  l
    ld   d, d
    adc  a, d
    ld   d, d
    xor  d
    ld   d, d
    or   [hl]
    ld   d, d
    ld   [hl], b
    ld   d, e
    pop  hl
    ld   d, e
    rla
    ld   d, e
    jr   nc, label_55252
    call label_C05
    ld   [hl], $80
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    jp   label_3B12
    call label_C05
    ret  nz
    ld   a, [$FFE7]
    and  $07
    ret  nz
    ld   hl, $C3B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $03
    ret  nz
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $28
    ld   a, $08
    call label_3BAA
    jp   label_3B12
    call label_55435
    call label_3B39
    call label_57B88
    call label_3B23
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_5527A
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $01
    jr   nz, label_5526E
    call label_280D
    and  $01
    jr   nz, label_5526E
    call label_C05
    ld   [hl], $1F
    call label_3B12
    ld   [hl], $08
    jr   label_5527A

label_5526E::
    ld   a, $20
    ld   [$FFF2], a
    call label_C05
    ld   [hl], $30
    call label_3B12

label_5527A::
    ld   e, $03
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $0C
    jr   c, label_55286
    inc  e

label_55286::
    ld   a, e
    jp   label_3B0C
    ld   a, $05
    call label_3B0C
    call label_C05
    jr   nz, label_552A4
    ld   a, $0C
    call label_3BAA
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_3B12
    dec  [hl]
    dec  [hl]

label_552A4::
    call label_55435
    jp   label_3B39
    call label_C05
    ret  nz
    jp   label_55335

label_552B1::
    ld   a, $23
    ld   [$FFF3], a
    ret
    call label_C05
    jr   nz, label_552FF

label_552BB::
    ld   a, [$D219]
    inc  a
    ld   [$D219], a
    call label_55064
    xor  a
    ld   [$D221], a
    ld   [$D222], a
    ld   [$D223], a
    ld   [$D220], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], b
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C0
    ld   a, $02
    ld   [$C197], a
    inc  a
    ld   [$C10D], a
    ld   a, $FF
    call label_3B0C
    call label_C05
    ld   [hl], $40
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    call label_3B12
    ld   [hl], b
    ld   a, $01
    ld   [$D21A], a
    ret

label_552FF::
    cp   $18
    ret  nc
    cp   $17
    jr   nz, label_5530B
    ld   hl, $FFF2
    ld   [hl], $35

label_5530B::
    rra
    rra
    rra
    and  $03
    jp   label_3B0C

label_55313::
    rst  $38
    nop
    ld   bc, $CD02
    dec  b
    inc  c
    jr   nz, label_55321
    ld   [hl], $80
    jp   label_3B12

label_55321::
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_55313
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    call label_C05
    jr   nz, label_55355

label_55335::
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_55911
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_55919
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    call label_3B12
    ld   [hl], $01

label_55355::
    ret

label_55356::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5535E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_55366::
    nop
    jr   label_55389
    jr   label_5536B

label_5536B::
    db   $E8 ; add  sp, d
    ld   [$FFE8], a
    nop
    jr   label_553AF
    rst  $38
    call label_3B0C
    call label_C05
    ld   [hl], $80
    call label_3B12
    ld   [hl], $04
    ld   a, $21
    ld   [$FFF3], a

label_55383::
    xor  a

label_55384::
    ld   [$FFE8], a
    ld   a, $E6
    call label_3B86
    ret  c
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   a, [$FFD7]
    ld   hl, label_55356
    add  hl, bc
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, label_5535E
    add  hl, bc
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a

label_553AF::
    ld   hl, label_55368
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_55366
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $2F
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C390
    add  hl, de
    inc  [hl]
    pop  bc
    ld   a, [$FFE8]
    inc  a
    cp   $08
    jr   nz, label_55384
    ret

label_553DD::
    dec  b
    inc  bc
    inc  b
    inc  bc
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_553F9
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_553F9::
    call label_C05
    jr   z, label_5540E
    rra
    nop
    nop
    nop
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_553DD
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_5540E::
    ld   a, [$D220]
    inc  a
    ld   [$D220], a
    cp   $03
    jr   nc, label_5541F
    call label_3B12
    ld   [hl], $02
    ret

label_5541F::
    ld   a, $06
    call label_3B0C
    call label_C05
    ld   [hl], $80
    call label_3B12
    ld   [hl], $05

label_5542E::
    ld   a, $37
    ld   [$FFF4], a
    jp   label_55383

label_55435::
    ld   a, [$DB4B]
    and  a
    jr   z, label_55465
    ld   a, [$DB00]
    cp   $0C
    jr   nz, label_55450
    ld   a, [$FFCC]
    and  $20
    jr   z, label_55465
    ld   a, $03
    ld   [$D220], a
    jp   label_554A2

label_55450::
    ld   a, [$DB01]
    cp   $0C
    jr   nz, label_55465
    ld   a, [$FFCC]
    and  $10
    jr   z, label_55465
    ld   a, $03
    ld   [$D220], a
    jp   label_554A2

label_55465::
    ld   e, $0F
    ld   d, b

label_55468::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   nz, label_554B7
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $08
    jr   nz, label_554B7
    ld   hl, $C2E0
    add  hl, de
    ld   a, [hl]
    cp   $08
    jr   nz, label_554B7
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_554B7
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_554B7
    call label_C05
    ld   [hl], $80

label_554A2::
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $14
    ld   a, $07
    ld   [$FFF3], a
    ld   a, $37
    ld   [$FFF2], a
    call label_3B12
    ld   [hl], $07
    pop  af
    ret

label_554B7::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_55468
    ret

label_554BE::
    ld   c, [hl]
    nop
    ld   c, [hl]
    jr   nz, label_5550F
    nop
    ld   c, h
    jr   nz, label_55511
    nop
    ld   c, d
    jr   nz, label_554CD
    ld   [bc], a
    ld   [bc], a

label_554CD::
    ld   bc, $0001

label_554D0::
    rrca
    rlca
    inc  bc
    ld   bc, $0000

label_554D6::
    ld   de, label_554BE
    call label_3BC0
    call label_57B0D
    call label_C05
    jp   z, label_57C31
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_554CA
    add  hl, de
    push de
    ld   a, [hl]
    call label_3B0C
    pop  de
    ld   hl, label_554D0
    add  hl, de
    ld   a, [$FFE7]
    and  [hl]
    ret  nz
    jp   label_57B88

label_55501::
    nop
    nop
    ld   c, h
    nop
    nop
    ld   [label_204C], sp
    nop
    ld   [label_20FF], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_55512

label_55512::
    ld    hl, sp+$FF
    ld   b, b
    nop
    nop
    rst  $38
    ld   b, b
    nop
    ld   [label_560FF], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, b
    nop
    nop
    ld   c, [hl]
    nop
    nop
    ld   [label_204E], sp
    nop
    ld   [label_20FF], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_55532

label_55532::
    ld    hl, sp+$FF
    ld   b, b
    nop
    nop
    rst  $38
    ld   b, b
    nop
    ld   [label_560FF], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, b
    ld    hl, sp+$F8
    ld   a, d
    nop
    ld    hl, sp+$00
    ld   a, h
    nop
    ld    hl, sp+$08
    ld   a, h
    jr   nz, label_55546
    db   $10 ; Undefined instruction
    jr   nz, label_5555A
    ld    hl, sp+$7A
    ld   b, b
    ld   [label_57C00], sp
    ld   b, b
    ld   [label_57C08], sp
    ld   h, b
    ld   [label_57A10], sp
    ld   h, b
    ld    hl, sp+$F8
    db   $76 ; Halt
    nop
    ld    hl, sp+$00
    ld   a, b
    nop
    ld    hl, sp+$08
    ld   a, b
    jr   nz, label_55566
    db   $10 ; Undefined instruction
    jr   nz, label_5557A
    ld    hl, sp+$76
    ld   b, b
    ld   [label_57800], sp
    ld   b, b
    ld   [label_57808], sp
    ld   h, b
    ld   [label_57610], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   [hl], d
    nop
    ld    hl, sp+$00
    ld   [hl], h
    nop
    ld    hl, sp+$08
    ld   [hl], h
    jr   nz, label_55586
    db   $10 ; Undefined instruction
    jr   nz, label_5559A
    ld    hl, sp+$72
    ld   b, b
    ld   [label_57400], sp
    ld   b, b
    ld   [label_57408], sp
    ld   h, b
    ld   [label_57210], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   h, [hl]
    nop
    ld    hl, sp+$00
    ld   l, b
    nop
    ld    hl, sp+$08
    ld   l, b
    jr   nz, label_555A6
    db   $10 ; Undefined instruction
    jr   nz, label_555BA
    ld    hl, sp+$66
    ld   b, b
    ld   [label_56A00], sp
    nop
    ld   [label_56A08], sp
    jr   nz, label_555C6
    db   $10 ; Undefined instruction
    ld   h, b
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_555C6
    db   $10 ; Undefined instruction
    jr   nz, label_555DA
    ld    hl, sp+$60
    ld   b, b
    ld   [label_56400], sp
    nop
    ld   [label_56408], sp
    jr   nz, label_555E6
    db   $10 ; Undefined instruction
    ld   h, b
    ld    hl, sp+$F8
    ld   l, h
    nop
    ld    hl, sp+$00
    ld   l, [hl]
    nop
    ld    hl, sp+$08
    ld   l, [hl]
    jr   nz, label_555E6
    db   $10 ; Undefined instruction
    jr   nz, label_555FA
    ld    hl, sp+$6C
    ld   b, b
    ld   [label_57000], sp
    nop
    ld   [label_57008], sp
    jr   nz, label_55606
    db   $10 ; Undefined instruction
    ld   h, b
    nop
    nop
    ld   c, d
    nop
    nop

label_55606::
    ld   [label_204A], sp
    nop
    ld   [label_20FF], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_55612

label_55612::
    ld    hl, sp+$FF
    ld   b, b
    nop
    nop
    rst  $38
    ld   b, b
    nop
    ld   [label_560FF], sp
    nop
    db   $10 ; Undefined instruction
    ld   h, b

label_55621::
    ld   c, h
    nop
    ld   c, h
    jr   nz, label_5566E
    nop
    ld   c, b
    jr   nz, label_55652
    inc  hl
    ld   e, $19
    inc  d
    rrca
    ld   a, [bc]
    dec  b

label_55631::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE9], a
    xor  a

label_55639::
    ld   [$FFE8], a
    ld   e, a
    ld   d, b
    ld   hl, label_55629
    add  hl, de
    ld   a, [$FFE9]
    sub  a, [hl]
    and  $7F
    ld   e, a
    ld   d, b
    ld   hl, $D000
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $D100

label_55652::
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   de, label_55625
    ld   a, [$FFE8]
    cp   $00
    jr   z, label_5566B
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FFEC]
    cp   [hl]
    jr   z, label_55676
    ld   de, label_55621

label_5566B::
    xor  a
    ld   [$FFF1], a

label_5566E::
    call label_3BC0
    ld   a, $02
    call label_3DA0

label_55676::
    ld   a, [$FFE8]
    inc  a
    cp   $08
    jr   nz, label_55639
    call label_3D8A
    call label_5569F
    call label_57B0D
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  $7F
    ld   e, a
    ld   d, b
    ld   a, [$FFEC]
    ld   hl, $D100
    add  hl, de
    ld   [hl], a
    ld   a, [$FFEE]
    ld   hl, $D000
    add  hl, de
    ld   [hl], a
    ret

label_5569F::
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
    ld   hl, label_55501
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $08
    jp   label_3DA0

label_556BB::
    nop
    nop
    ld   c, d
    nop
    nop
    ld   [label_204A], sp
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
    ld   c, h
    nop
    nop
    ld   [label_204C], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    nop

label_556DC::
    nop
    ld   c, [hl]
    nop
    nop
    ld   [label_204E], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    jr   nz, label_556DC
    nop
    ld   e, h
    nop
    ld   a, [$FF08]
    ld   e, h
    jr   nz, label_556F4

label_556F4::
    nop
    ld   e, [hl]
    nop
    nop
    ld   [label_205E], sp
    ld   a, [$FF00]
    ld   b, h
    nop
    ld   a, [$FF08]
    ld   b, h
    jr   nz, label_55704

label_55704::
    nop
    ld   b, h
    ld   b, b
    nop
    ld   [label_56044], sp
    nop
    db   $FC ; Undefined instruction
    ld   b, b
    nop
    nop
    inc  b
    ld   b, d
    nop
    nop
    inc  c
    ld   b, b
    jr   nz, label_55718

label_55718::
    nop
    rst  $38
    nop
    nop

label_5571C::
    nop
    ld   c, b
    nop
    nop
    ld   [label_2048], sp
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    jr   nz, label_5571C
    pop  af
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_556BB
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $04
    jp   label_3DA0
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_55DD5
    and  a
    jp   nz, label_55DED
    ld   a, c
    ld   [$D201], a
    ld   a, [$D21A]
    and  a
    jr   nz, label_5575E
    call label_55A67

label_5575E::
    call label_57B0D
    call label_57B3E
    ld   a, [$FFF0]
    rst  0
    ld   a, e
    ld   d, a
    rst  8
    ld   d, a
    dec  bc
    ld   e, b
    ld   d, h
    ld   e, b
    db   $ED ; Undefined instruction
    ld   e, b
    ld   h, $59
    ld   h, e
    ld   e, c
    cp   c
    ld   e, c
    dec  b
    ld   e, d
    rra
    ld   e, d
    xor  a
    call label_3B0C
    call label_5572B
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, $50
    ld   [$FF98], a
    ld   a, $30
    ld   [$FF99], a
    ld   a, $10
    call label_3BAA
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_557B7
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_557B7
    call label_C05
    ld   [hl], $50
    call label_3B12
    ld   [hl], $01

label_557B7::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_57B88

label_557C0::
    inc  b
    inc  bc
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
    nop
    call label_C05
    jr   z, label_557E5
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_557C0
    add  hl, de
    ld   a, [hl]
    ld   [$FFF1], a
    jp   label_5572B

label_557E5::
    xor  a
    ld   [$D21A], a
    call label_55819
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [hl], a
    call label_C05
    ld   [hl], $40
    call label_3B12
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    inc  [hl]
    jp   label_552B1

label_55807::
    rrca
    ld   a, [bc]
    dec  b
    nop
    call label_C05
    jr   nz, label_55819
    ld   a, $22
    ld   [$FFF3], a
    ld   [hl], $C0
    jp   label_3B12

label_55819::
    call label_57C0A
    ld   a, e
    ld   [$D21E], a
    ld   d, b
    ld   hl, label_55807
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_5582B::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    add  a, [hl]
    jp   label_3B0C
    nop
    ld   bc, label_302

label_5583C::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop

label_5584C::
    jr   label_55836
    nop
    nop

label_55850::
    nop
    nop
    ld   a, [$FF00]
    call label_C05
    jr   nz, label_558C0
    ld   [$D21D], a
    ld   [hl], $50
    ld   a, $E6
    call label_3B86
    ld   hl, $C440
    add  hl, de
    inc  [hl]
    push bc
    ld   a, [$D21E]
    ld   c, a
    ld   hl, label_5584C
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_55850
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $42
    ld   hl, $C350
    add  hl, de
    ld   [hl], d
    ld   a, $38
    ld   [$FFF4], a
    ld   a, [$D220]
    cp   $02
    jr   c, label_558B5
    ld   a, [$FF98]
    ld   hl, $FFE7
    add  a, [hl]
    and  $01
    jr   nz, label_558B5
    ld   hl, $C290
    add  hl, de
    ld   [hl], $03
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $1C
    ld   a, $39
    ld   [$FFF4], a

label_558B5::
    ld   c, e
    ld   b, d
    ld   a, $18
    call label_3BAA
    pop  bc
    jp   label_3B12

label_558C0::
    rra
    rra
    rra
    and  $03
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_C05
    rra
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_5583C
    add  hl, de
    ld   a, [hl]
    ld   [$D21D], a
    call label_C05
    cp   $40
    jp  c, label_5582B
    and  $1F
    jp   z, label_55819
    jp   label_5582B
    call label_C05
    jr   nz, label_55908
    ld   [hl], $27
    ld   a, $35
    ld   [$FFF2], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    ld   a, $01
    ld   [$D21A], a
    jp   label_3B12

label_55908::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $04
    jp   label_5582B

label_55911::
    ld   d, b
    jr   z, label_5598C
    jr   label_5589E
    jr   c, label_55980
    ld   d, b

label_55919::
    jr   nc, label_5594B
    jr   nc, label_5596D
    ld   d, b
    ld   [hl], b
    ld   [hl], b
    ld   [hl], h

label_55921::
    nop
    ld   bc, label_302
    inc  b
    call label_C05
    jr   nz, label_5594A
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_55911
    add  hl, de
    ld   a, [hl]
    ld   [$D21B], a
    ld   hl, label_55919
    add  hl, de
    ld   a, [hl]
    ld   [$D21C], a
    call label_C05
    ld   [hl], $1F
    jp   label_3B12

label_5594A::
    rra

label_5594B::
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_55921
    add  hl, de
    ld   a, [hl]
    ld   [$FFF1], a
    jp   label_5572B

label_5595B::
    jr   label_55971
    db   $10 ; Undefined instruction
    ld   [label_205], sp
    ld   bc, $E0AF
    pop  af
    call label_5572B
    ld   a, [$FF99]
    push af
    ld   a, [$FF98]
    push af
    ld   a, [$D21B]
    ld   [$FF98], a
    ld   a, [$D21C]
    ld   [$FF99], a
    call label_C05
    rra
    rra
    and  $07

label_55980::
    ld   e, a
    ld   d, b
    ld   hl, label_5595B
    add  hl, de
    ld   a, [hl]
    call label_3BAA
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_559AC
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_559AC
    call label_C05
    ld   [hl], $50
    call label_3B12
    ld   [hl], $01

label_559AC::
    pop  af
    ld   [$FF98], a
    pop  af
    ld   [$FF99], a
    jp   label_57B88

label_559B5::
    nop
    ld   a, [bc]
    rrca
    dec  b
    call label_C05
    jr   nz, label_559D3
    call label_5542E
    ld   a, $01
    ld   [$D21A], a
    ld   a, $06
    call label_3B0C
    call label_C05
    ld   [hl], $50
    jp   label_3B12

label_559D3::
    ld   a, [$D221]
    cp   $80
    jr   nc, label_559DE
    inc  a
    ld   [$D221], a

label_559DE::
    ld   a, [$D221]
    ld   hl, $D222
    add  a, [hl]
    ld   [hl], a
    jr   nc, label_559EC
    ld   hl, $D223
    inc  [hl]

label_559EC::
    ld   a, [$D223]
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_559B5
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    jp   label_5582B
    call label_C05
    jr   nz, label_55A10
    call label_55128
    jp   label_3B12

label_55A10::
    cp   $18
    jr   nc, label_55A1C
    rra
    rra
    rra
    and  $03
    call label_3B0C

label_55A1C::
    jp   label_5572B
    call label_5572B
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, $50
    ld   [$FF98], a
    ld   a, $30
    ld   [$FF99], a
    ld   a, $10
    call label_3BAA
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_55A5E
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_55A5E
    call label_552BB
    call label_C05
    ld   [hl], $31
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    call label_55F9A

label_55A5E::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_57B88

label_55A67::
    call label_55D8D
    call label_55B2C
    call label_55B0B
    jp   label_55D48

label_55A73::
    ld   l, d
    nop
    ld   l, h
    nop
    ld   l, h
    jr   nz, label_55AE4
    jr   nz, label_55AE6
    nop
    rst  $38
    rst  $38
    ld   l, d
    jr   nz, label_55A81
    rst  $38

label_55A83::
    nop
    nop
    ld   l, d
    nop
    ld   [label_57A08], sp
    nop
    ld   [label_57A00], sp
    jr   nz, label_55A90

label_55A90::
    ld   [label_206A], sp

label_55A93::
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   [bc], a
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

label_55AA7::
    ld   a, [$FFF3]
    di
    ld   a, [$FFF5]
    ld   a, [$FFF3]
    di
    ld   a, [$FFF5]
    pop  af
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    rrca
    db   $10 ; Undefined instruction
    ld   c, $10

label_55ABB::
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  af
    pop  af
    db   $FD ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  af
    pop  af
    db   $FD ; Undefined instruction
    db   $F4 ; Undefined instruction
    or   $F7
    or   $F8
    db   $F4 ; Undefined instruction
    or   $F7
    or   $F8

label_55ACF::
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0101
    inc  bc
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

label_55AE3::
    db   $10 ; Undefined instruction
    dec  c

label_55AE6::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    dec  c
    db   $10 ; Undefined instruction
    push af
    or   $F5
    db   $F4 ; Undefined instruction
    di
    inc  de
    ld   [de], a
    inc  de
    inc  d
    dec  d

label_55AF7::
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  af
    pop  af
    db   $FD ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  af
    pop  af
    db   $FD ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    ld   a, [$FF00+C]
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    ld   a, [$FF00+C]
    or   b
    jp   label_57E09
    ld   e, a
    ld   d, b
    ld   hl, label_55AE3
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_55AF7
    add  hl, de
    ld   a, [$FFEC]
    add  a, $08
    add  a, [hl]
    ld   [$FFEC], a
    ld   hl, label_55ACF
    add  hl, de
    jr   label_55B4B

label_55B2C::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_55AA7
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_55ABB
    add  hl, de
    ld   a, [$FFEC]
    add  a, $08
    add  a, [hl]
    ld   [$FFEC], a
    ld   hl, label_55A93
    add  hl, de

label_55B4B::
    ld   a, [hl]
    cp   $04
    jr   nc, label_55B5A
    ld   [$FFF1], a
    ld   de, label_55A73
    call label_3BC0
    jr   label_55B6C

label_55B5A::
    sub  a, $04
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, b
    ld   hl, label_55A83
    add  hl, de
    ld   c, $02
    call label_3CE6

label_55B6C::
    ld   a, $02
    call label_3DA0
    jp   label_3D8A

label_55B74::
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_55B79
    db   $10 ; Undefined instruction
    jr   nz, label_55B8A
    ld    hl, sp+$6E
    nop
    ld   [label_56400], sp
    nop
    ld   [label_56408], sp
    jr   nz, label_55B96
    db   $10 ; Undefined instruction
    jr   nz, label_55B8D
    ld    hl, sp+$60
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_55B99
    db   $10 ; Undefined instruction
    jr   nz, label_55BAA
    ld   sp, hl
    ld   l, [hl]
    nop
    ld   [label_56400], sp
    nop
    ld   [label_56408], sp
    jr   nz, label_55BB6
    rrca
    ld   l, [hl]
    jr   nz, label_55BAD
    ld    hl, sp+$60
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_55BB9
    db   $10 ; Undefined instruction
    jr   nz, label_55BCB
    ld   sp, hl
    ld   l, [hl]
    nop
    ld   [label_56400], sp

label_55BCB::
    nop
    ld   [label_56408], sp
    jr   nz, label_55BD7
    rrca
    ld   l, [hl]
    jr   nz, label_55BCD
    ld    hl, sp+$60

label_55BD7::
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_55BD9
    db   $10 ; Undefined instruction
    jr   nz, label_55BEB
    ld    hl, sp+$6E
    nop
    ld   [label_56400], sp

label_55BEB::
    nop
    ld   [label_56408], sp

label_55BEF::
    jr   nz, label_55BF7
    db   $10 ; Undefined instruction
    jr   nz, label_55BEF
    ld    hl, sp+$60

label_55BF7::
    nop
    ld   a, [label_56200]

label_55BFB::
    nop
    ld   a, [label_56208]
    jr   nz, label_55BFB
    db   $10 ; Undefined instruction
    jr   nz, label_55C0D
    ld    hl, sp+$6E
    nop
    ld   [label_56400], sp
    nop
    ld   [label_56408], sp

label_55C0F::
    jr   nz, label_55C19
    db   $10 ; Undefined instruction
    jr   nz, label_55C0F
    ld    hl, sp+$60
    nop
    ld   a, [label_56600]

label_55C1B::
    nop
    ld   a, [label_56608]
    jr   nz, label_55C1B
    db   $10 ; Undefined instruction
    jr   nz, label_55C2A
    ld    hl, sp+$6E
    nop
    ld   [label_56800], sp
    nop
    ld   [label_56808], sp

label_55C2F::
    jr   nz, label_55C36
    db   $10 ; Undefined instruction
    jr   nz, label_55C2F
    ld    hl, sp+$60
    nop
    ld   a, [label_56600]

label_55C3B::
    nop
    ld   a, [label_56608]
    jr   nz, label_55C3B
    db   $10 ; Undefined instruction
    jr   nz, label_55C4A
    ld   sp, hl
    ld   l, [hl]
    nop
    ld   [label_56800], sp
    nop
    ld   [label_56808], sp

label_55C4F::
    jr   nz, label_55C56
    rrca
    ld   l, [hl]
    jr   nz, label_55C4F
    ld    hl, sp+$60
    nop
    ld   a, [label_56600]

label_55C5B::
    nop
    ld   a, [label_56608]
    jr   nz, label_55C5B
    db   $10 ; Undefined instruction
    jr   nz, label_55C6B
    ld   sp, hl
    ld   l, [hl]
    nop
    ld   [label_56800], sp

label_55C6B::
    nop
    ld   [label_56808], sp

label_55C6F::
    jr   nz, label_55C77
    rrca
    ld   l, [hl]
    jr   nz, label_55C6F
    ld    hl, sp+$60

label_55C77::
    nop
    ld   a, [label_56600]

label_55C7B::
    nop
    ld   a, [label_56608]
    jr   nz, label_55C7B
    db   $10 ; Undefined instruction
    jr   nz, label_55C8B
    ld    hl, sp+$6E
    nop
    ld   [label_56800], sp

label_55C8B::
    nop
    ld   [label_56808], sp
    jr   nz, label_55C97
    db   $10 ; Undefined instruction
    jr   nz, label_55C8D
    ld    hl, sp+$60

label_55C97::
    nop
    ld    hl, sp+$00
    ld   h, [hl]
    nop
    ld    hl, sp+$08
    ld   h, [hl]
    jr   nz, label_55C99
    db   $10 ; Undefined instruction
    jr   nz, label_55CA9
    ld    hl, sp+$6E
    nop
    ld   [label_56800], sp
    nop
    ld   [label_56808], sp
    jr   nz, label_55CB5
    db   $10 ; Undefined instruction
    jr   nz, label_55CAD

label_55CB5::
    db   $FC ; Undefined instruction
    ld   [hl], d
    nop
    ld    hl, sp+$04
    ld   [hl], h
    nop
    ld   [label_57600], sp
    nop
    ld   [label_57808], sp
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
    ld   a, [label_572FB]
    nop
    ld   a, [label_57403]
    nop
    ld   [label_57600], sp
    nop
    ld   [label_57808], sp
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

label_55CF1::
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$04
    ld   [hl], h
    jr   nz, label_55CF1
    inc  c
    ld   [hl], d
    jr   nz, label_55D05
    nop
    ld   a, b
    jr   nz, label_55D09
    ld   [label_2076], sp
    rst  $38

label_55D05::
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_55D09::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_55D13::
    rst  $38
    ld   a, [label_57405]
    jr   nz, label_55D13
    dec  c
    ld   [hl], d
    jr   nz, label_55D25
    nop
    ld   a, b
    jr   nz, label_55D29
    ld   [label_2076], sp
    rst  $38

label_55D25::
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_55D29::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_55D34::
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    inc  c
    inc  c
    inc  c
    inc  c
    dec  c

label_55D48::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_55D34
    add  hl, de
    ld   a, [hl]
    ld   d, $00
    ld   e, a
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
    ld   hl, label_55B74
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $08
    jp   label_3DA0

label_55D79::
    ld   e, $00
    ld   e, $60
    ld   a, h
    nop
    ld   a, h
    jr   nz, label_55E00
    nop
    ld   a, [hl]
    jr   nz, label_55D9A
    db   $EC ; Undefined instruction
    nop
    nop

label_55D89::
    nop
    nop
    ld   a, [$FF04]

label_55D8D::
    ld   a, [$FFED]
    push af
    call label_55D97
    pop  af
    ld   [$FFED], a
    ret

label_55D97::
    ld   a, [$D21D]

label_55D9A::
    and  a
    ret  z
    dec  a
    ld   [$FFF1], a
    ld   a, [$FFE7]
    rla
    rla
    rla
    and  $50
    ld   [$FFED], a
    ld   a, [$D21E]
    ld   e, a
    ld   d, b
    ld   hl, label_55D85
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_55D89
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   de, label_55D79
    call label_3BC0
    ld   a, $02
    call label_3DA0
    jp   label_3D8A

label_55DCD::
    ld   b, [hl]
    nop
    ld   b, [hl]
    ld   h, b
    ld   [hl], b
    nop
    rst  $38
    rst  $38

label_55DD5::
    ld   de, label_55DCD
    ret

label_55DD9::
    ld   a, [hl]
    nop
    ld   a, [hl]
    jr   nz, label_55E5A

label_55DDE::
    nop
    ld   a, h
    jr   nz, label_55E00
    nop
    ld   e, $60
    ld   e, b
    nop
    ld   e, b
    jr   nz, label_55E44
    nop
    ld   e, d
    jr   nz, label_55DDE
    rst  $20
    rla
    rla
    rla
    and  $50
    ld   [$FFED], a
    ld   de, label_55DD9
    call label_3BC0
    call label_57B0D
    call label_C56
    ld   a, [$FFF0]
    cp   $04
    jr   nz, label_55E24
    call label_C00
    jp   z, label_57C31
    xor  c
    bit  0, a
    ld   e, $FF
    jr   z, label_55E20
    call label_C00
    ld   e, $01
    cp   $08
    jr   nc, label_55E20
    ld   e, $02

label_55E20::
    ld   a, e
    jp   label_3B0C

label_55E24::
    call label_57B88
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    dec  [hl]
    ld   e, [hl]
    add  a, l
    ld   e, [hl]
    xor  h
    ld   e, [hl]
    ldi  [hl], a
    ld   e, a
    call label_3B39

label_55E38::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $03
    jr   nz, label_55E79
    ld   a, $E6
    call label_3B86
    ret  c
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C350
    add  hl, de
    ld   [hl], d
    ld   hl, $C440
    add  hl, de
    inc  [hl]
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0F
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C290
    add  hl, de
    ld   [hl], $04

label_55E79::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_55E84
    jp   label_57C31

label_55E84::
    ret
    ld   a, $08
    ld   [$FFF4], a
    ld   a, $18
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    ld   [$FF9A], a
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, $10
    ld   [$C13E], a
    jp   label_3B12
    call label_55E38
    ld   a, [$D21A]
    and  a
    ret  nz
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_55F19
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_55F19
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    sla  a
    ld   hl, $C3F0
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    sla  a
    ld   hl, $C400
    add  hl, de
    ld   [hl], a
    ld   hl, $C410
    add  hl, de
    ld   [hl], $12
    call label_57C31
    ld   a, [$D220]
    inc  a
    ld   [$D220], a
    cp   $04
    jr   c, label_55F0F
    ld   hl, $C290

label_55F02::
    add  hl, de
    ld   [hl], $07
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $C0
    ld   a, $36
    ld   [$FFF2], a

label_55F0F::
    ld   hl, $C420
    add  hl, de
    ld   [hl], $14
    ld   a, $07
    ld   [$FFF3], a

label_55F19::
    ret

label_55F1A::
    jr   nz, label_55F3C
    ld   [$FFE0], a

label_55F1E::
    jr   nz, label_55F00
    jr   nz, label_55F02
    call label_3B44
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $03
    call label_3B0C
    call label_C05
    jr   z, label_55F3F
    and  $01
    jr   nz, label_55F3F
    ld   a, $18

label_55F3C::
    call label_3BAA

label_55F3F::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_55F99
    ld   a, $36
    ld   [$FFF4], a
    xor  a

label_55F4C::
    ld   [$FFE8], a
    ld   a, $7D
    call label_3B86
    jr   c, label_55F96
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
    inc  [hl]
    push bc
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_55F1A
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_55F1E
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   a, [$FFE8]
    inc  a
    cp   $04
    jr   nz, label_55F4C

label_55F96::
    jp   label_57C31

label_55F99::
    ret

label_55F9A::
    ld   e, $80
    ld   hl, $D100

label_55F9F::
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, label_55F9F
    ret

label_55FA5::
    inc  bc
    inc  bc
    dec  b
    dec  b
    nop
    nop
    inc  b
    inc  b
    ld   [bc], a
    ld   [bc], a
    ld   b, $06
    ld   bc, label_701
    rlca

label_55FB5::
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
    ld   c, $06
    rlca
    nop
    ld   bc, label_302
    inc  b
    dec  b

label_55FD1::
    call label_57B0D
    jp   label_3B39
    ld   a, [$FFF0]
    rst  0
    ld   c, d
    ld   h, b
    call nc, label_C160
    ld   h, b
    adc  a, h
    ld   h, b

label_55FE2::
    nop
    nop
    ld   c, d
    nop
    nop
    ld   [label_204A], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   c, h
    nop
    nop
    ld   [label_204C], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_56010::
    rst  $38
    rst  $38
    nop
    nop
    ld   c, [hl]
    nop
    nop
    ld   [label_204E], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld    hl, sp+$78
    nop
    ld    hl, sp+$00
    ld   a, d
    nop
    ld    hl, sp+$08
    ld   a, d
    jr   nz, label_56037

label_56037::
    db   $10 ; Undefined instruction
    jr   nz, label_56043
    nop
    ld   a, h
    nop
    ld   [label_57C08], sp
    jr   nz, label_56046

label_56043::
    inc  bc

label_56044::
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    xor  a
    ld   [$FFF1], a
    call label_C05
    jr   nz, label_56055
    jp   label_3B12

label_56055::
    cp   $20
    jr   nz, label_5605F
    dec  [hl]
    call label_552B1
    ld   a, $20

label_5605F::
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_56042

label_56069::
    add  hl, de
    ld   a, [hl]
    rla
    rla
    rla
    and  $F8

label_56070::
    ld   e, a
    rla
    and  $F0
    add  a, e
    ld   e, a
    ld   hl, label_55FE2
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, $06
    jp   label_3DA0

label_56084::
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    xor  a
    ld   [$FFF1], a
    call label_C05
    jr   nz, label_560B5
    call label_552BB
    call label_55128
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $40
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $0A
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $90
    jp   label_3AEA

label_560B5::
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_56084
    jr   label_56069
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_560D4
    call label_C05
    ld   [hl], $1F
    call label_5542E
    jp   label_3B12

label_560D4::
    call label_55FD1
    call label_56245
    call label_C56
    call label_3D8A
    call label_57B0D
    xor  a
    ld   [$D3D6], a
    ld   e, $0C
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_560FB
    call label_56109
    ld   a, $01
    ld   [$D3D6], a
    ld   e, $0C

label_560FB::
    ld   hl, $D202
    ld   a, [hl]

label_560FF::
    inc  a
    ld   [hl], a
    cp   e
    jr   c, label_56109
    ld   [hl], b
    ld   a, $38
    ld   [$FFF2], a

label_56109::
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
    call label_56331
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    srl  e
    ld   d, b
    ld   hl, label_55FC9
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_56135::
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_5613A
    db   $10 ; Undefined instruction
    jr   nz, label_5614E
    ld    hl, sp+$64

label_56148::
    nop
    ld   [label_56600], sp
    nop
    ld   [label_56608], sp
    jr   nz, label_5615A
    db   $10 ; Undefined instruction
    jr   nz, label_5614E
    ld    hl, sp+$60
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_5615A
    db   $10 ; Undefined instruction
    jr   nz, label_5616E
    ld    hl, sp+$6C
    nop
    ld   [label_56E00], sp
    nop
    ld   [label_56208], sp
    ld   h, b
    ld   [label_56010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   l, b
    nop
    ld    hl, sp+$00
    ld   l, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_5617A
    db   $10 ; Undefined instruction
    jr   nz, label_5618E
    ld    hl, sp+$68
    ld   b, b
    ld   [label_56A00], sp
    ld   b, b
    ld   [label_56208], sp
    ld   h, b
    ld   [label_56010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   l, h
    ld   b, b
    ld    hl, sp+$00
    ld   l, [hl]
    ld   b, b
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_5619A
    db   $10 ; Undefined instruction
    jr   nz, label_561AE
    ld    hl, sp+$60
    ld   b, b
    ld   [label_56200], sp
    ld   b, b
    ld   [label_56208], sp
    ld   h, b
    ld   [label_56010], sp
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
    ld   [label_560F8], sp
    ld   b, b
    ld   [label_56200], sp
    ld   b, b
    ld   [label_56208], sp
    ld   h, b
    ld   [label_56010], sp
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
    ld   [label_560F8], sp
    ld   b, b
    ld   [label_56200], sp
    ld   b, b
    ld   [label_56208], sp
    ld   h, b
    ld   [label_56010], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   l, d

label_56200::
    jr   nz, label_561FA
    db   $10 ; Undefined instruction
    jr   nz, label_5620E
    ld    hl, sp+$60

label_56208::
    ld   b, b
    ld   [label_56200], sp
    ld   b, b
    ld   [label_56A08], sp
    ld   h, b
    ld   [label_56810], sp
    ld   h, b
    ld    hl, sp+$F8
    ld   h, b
    nop
    ld    hl, sp+$00
    ld   h, d
    nop
    ld    hl, sp+$08
    ld   h, d
    jr   nz, label_5621A
    db   $10 ; Undefined instruction
    jr   nz, label_5622E
    ld    hl, sp+$60
    ld   b, b
    ld   [label_56200], sp
    ld   b, b
    ld   [label_56E08], sp
    jr   nz, label_5623A
    db   $10 ; Undefined instruction
    jr   nz, label_562A6
    nop
    ld   [hl], b
    jr   nz, label_562AC

label_5623A::
    nop
    ld   [hl], d
    jr   nz, label_562B2
    nop
    ld   [hl], h
    jr   nz, label_562B8
    nop
    db   $76 ; Halt
    jr   nz, label_56267
    ld   b, b
    jp   label_3609
    ld   c, b
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
    ld   hl, label_56135
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $42
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
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
    ld   de, label_56235
    call label_3BC0
    ld   a, [$FFD7]
    sub  a, $18
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
    ld   de, label_56235

label_562AC::
    call label_3BC0
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
    ld   de, label_56235
    call label_3BC0
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
    ld   de, label_56235
    call label_3BC0
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_56330
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_56330
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $90
    call label_3B70
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $D0
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $F0
    jr   nc, label_56330
    call label_3B12
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $50

label_56330::
    ret

label_56331::
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_56342
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_56342
    call label_57B88

label_56342::
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_56379
    ld   e, $08
    bit  0, a
    jr   nz, label_56361
    ld   e, $00
    bit  1, a
    jr   nz, label_56361
    ld   e, $04
    bit  2, a
    jr   nz, label_56361
    ld   e, $0C

label_56361::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], e
    call label_280D
    rra
    jr   c, label_56374
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_56374::
    call label_C05
    ld   [hl], $10

label_56379::
    call label_C00
    jr   nz, label_563AF
    ld   [hl], $06
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
    ld   hl, label_55FA5
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_55FB5
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, label_55FB9
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a

label_563AF::
    call label_C05
    jr   nz, label_563C7
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

label_563C7::
    ret
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jp   z, label_56D40
    cp   $02
    jp   z, label_56D6E
    and  a
    jp   nz, label_56C61
    ld   a, [$FFF0]
    cp   $02
    jr   c, label_56425
    cp   $0B
    jr   z, label_563E9
    cp   $0C
    jr   nz, label_563F2

label_563E9::
    ld   a, $06
    ld   [$FFF1], a
    call label_5572B
    jr   label_563F5

label_563F2::
    call label_5692A

label_563F5::
    call label_57B0D
    call label_C56
    ld   a, [$FFF0]
    cp   $09
    jr   nc, label_56425
    call label_3B39
    ld   hl, $C360
    add  hl, bc

label_56408::
    ld   a, [hl]
    cp   $E8
    jr   nc, label_56425
    call label_3B12
    ld   [hl], $09
    ld   a, $09
    ld   [$FFF0], a
    ld   a, $10
    ld   [$FFF3], a
    call label_C05
    ld   [hl], $80
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $80

label_56425::
    ld   a, [$FFF0]
    rst  0
    cp   h
    ld   h, h
    ld   c, $65
    ld   d, e
    ld   h, l
    and  [hl]
    ld   h, l
    jr   label_56498
    call z, label_55366
    ld   h, a
    adc  a, a
    ld   h, a
    ld  [$FF00+C], a
    ld   h, a
    db   $E3 ; Undefined instruction
    ld   h, a
    ld   a, [label_1167]
    ld   l, b
    sub  a, [hl]
    ld   l, b
    rst  $20
    ld   l, b

label_56444::
    nop
    nop
    ld   c, d
    nop
    nop
    ld   [label_204A], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   c, h
    nop
    nop
    ld   [label_204C], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   c, [hl]
    nop
    nop
    ld   [label_204E], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FF00]
    ld   e, h
    nop
    ld   a, [$FF08]
    ld   e, h
    jr   nz, label_56495

label_56495::
    nop
    ld   e, [hl]
    nop

label_56498::
    nop
    ld   [label_205E], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_564A4::
    nop
    db   $FC ; Undefined instruction
    ld   l, d
    nop
    nop
    inc  b
    ld   l, h
    jr   nz, label_564AD

label_564AD::
    inc  c
    ld   l, d
    jr   nz, label_564A4
    db   $FC ; Undefined instruction
    ld   d, b
    nop
    di
    inc  b
    ld   d, d
    nop
    di
    inc  c
    ld   l, [hl]
    nop
    xor  a
    ld   [$FFF1], a
    call label_3B0C
    call label_5572B
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, $50
    ld   [$FF98], a
    ld   a, $30
    ld   [$FF99], a
    ld   a, $10
    call label_3BAA
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_564F8
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_564F8
    call label_C05
    ld   [hl], $60
    call label_3B12

label_564F8::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_57B88

label_56501::
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call label_C05
    jr   nz, label_5652E
    ld   [$D224], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [hl], a
    call label_C05
    ld   [hl], $08
    ld   a, $04
    call label_3B0C
    call label_552B1
    jp   label_3B12

label_5652E::
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_56501
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
    ld   hl, label_56444
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, $06
    jp   label_3DA0
    call label_C05
    jr   nz, label_56565
    ld   [hl], $7F
    jp   label_3B12

label_5655D::
    call label_57BDB
    ld   a, e
    ld   [$D21E], a
    ret

label_56565::
    ret

label_56566::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_56586::
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   [bc], a
    rlca
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
    ld   a, $00
    ld   [$D21E], a
    call label_C05
    jr   nz, label_565BB
    call label_BFB
    ld   [hl], $4C
    call label_5655D
    jp   label_3B12

label_565BB::
    cp   $40
    jr   nz, label_565C4
    ld   hl, $FFF4
    ld   [hl], $19

label_565C4::
    cp   $58
    jr   nz, label_565CD
    ld   hl, $FFF2
    ld   [hl], $39

label_565CD::
    rra
    rra
    and  $3F
    ld   e, a
    ld   d, b
    ld   hl, label_56586
    add  hl, de
    ld   a, [hl]
    ld   [$D224], a
    ld   hl, label_56566
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   a, [$D224]

label_565E6::
    cp   $05
    jr   z, label_565F5
    ld   a, $F3
    ld   [$D225], a
    ld   a, $F0
    ld   [$D226], a
    ret

label_565F5::
    ld   a, $F8
    ld   [$D225], a
    ld   a, $FE
    ld   [$D226], a
    ret

label_56600::
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    ld   bc, label_302

label_56608::
    db   $E8 ; add  sp, d
    nop
    jr   label_56624
    nop
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    nop

label_56610::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $E8 ; add  sp, d
    ld   a, [$FF10]
    jr   label_565E6
    ei
    dec  bc
    jr   nz, label_56628
    ld   [$D221], a
    call label_C05
    ld   [hl], $30
    jp   label_3B12

label_56628::
    ld   a, [$D21E]
    and  a
    ld   a, $F5
    jr   z, label_56632
    ld   a, $0B

label_56632::
    ld   [$D225], a
    ld   a, $EE
    ld   [$D226], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    and  $01
    call label_3B0C
    ld   a, [$D21E]
    and  a
    ld   hl, label_56600
    jr   z, label_56651
    ld   hl, label_56604

label_56651::
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    nop
    and  $03
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    inc  a
    ld   [$D224], a
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_566C7
    ld   a, [$D221]
    cp   $06
    jr   nc, label_566C7
    ld   a, $E6
    call label_3B86
    ret  c
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $30
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    push bc
    ld   hl, $C340
    add  hl, de
    ld   [hl], $42
    ld   hl, $C350
    add  hl, de
    ld   [hl], $00
    push de
    ld   c, e
    ld   b, d
    call label_3AEA
    pop  de
    ld   a, [$D21E]
    and  a
    ld   a, [$D221]
    jr   nz, label_566A0
    xor  $07

label_566A0::
    ld   c, a
    ld   hl, label_56610
    add  hl, bc
    ld   a, [$D225]
    add  a, [hl]
    ld   hl, $FFD7
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_56608
    add  hl, bc
    ld   a, [hl]
    sub  a, $0C
    ld   hl, $FFD8
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $D221
    inc  [hl]
    pop  bc

label_566C7::
    ret

label_566C8::
    dec  bc
    ld   a, [bc]
    ld   [bc], a
    ld   a, [bc]
    ld   a, [$D21E]
    and  a
    ld   a, $FD
    jr   z, label_566D6
    ld   a, $03

label_566D6::
    ld   [$D225], a
    ld   a, $EC
    ld   [$D226], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    nop
    nop
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_566C8
    add  hl, de
    ld   a, [hl]
    inc  a
    ld   [$D224], a
    call label_C05
    jr   nz, label_5674E
    ld   [hl], $40
    xor  a
    ld   [$D224], a
    call label_3B12
    ld   a, $E6
    call label_3B86
    jr   c, label_5674E
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   a, [$FFD8]
    sub  a, $10
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$D21E]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    and  a
    ld   a, $08
    jr   nz, label_56724
    ld   a, $F8

label_56724::
    ld   hl, $FFD7
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $40
    ld   hl, $C350
    add  hl, de
    ld   [hl], $08
    push bc
    ld   c, e
    ld   b, d
    call label_3AEA
    ld   a, $18
    call label_3BAA
    call label_C05
    ld   [hl], $30
    ld   a, $27
    ld   [$FFF4], a
    pop  bc

label_5674E::
    ld   a, $02
    jp   label_3B0C
    call label_C05
    jr   nz, label_5676A
    ld   [hl], $1F
    call label_280D
    and  $07
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    call label_55128
    call label_3B12

label_5676A::
    ld   a, $03
    jp   label_3B0C

label_5676F::
    jr   z, label_567C1
    ld   a, b
    jr   z, label_567EC
    jr   z, label_567C6
    ld   a, b

label_56777::
    jr   nz, label_567A1
    jr   nz, label_567AB
    jr   nc, label_567CD
    ld   d, b
    ld   d, b

label_5677F::
    jr   nz, label_5679F
    inc  e
    ld   a, [de]
    jr   label_5679B
    inc  d
    ld   [de], a
    db   $10 ; Undefined instruction
    inc  c
    ld   a, [bc]
    ld   [label_406], sp
    ld   [bc], a
    ld   a, $04
    call label_3B0C
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]

label_5679F::
    ld   d, b
    ld   hl, label_5676F
    add  hl, de
    ld   a, [hl]
    ld   [$FF98], a
    ld   hl, label_56777
    add  hl, de

label_567AB::
    ld   a, [hl]
    ld   [$FF99], a
    call label_C05
    rra
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, label_5677F
    add  hl, de
    ld   a, [hl]
    call label_3BAA
    ld   hl, $FFEE

label_567C1::
    ld   a, [$FF98]
    sub  a, [hl]
    add  a, $03

label_567C6::
    cp   $06
    jr   nc, label_567D9
    ld   hl, $FFEC

label_567CD::
    ld   a, [$FF99]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_567D9
    call label_3B12

label_567D9::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_57B88
    ret
    call label_C05
    jr   nz, label_567F9
    ld   [hl], $40
    call label_5542E
    call label_3B12
    ld   a, $00
    call label_3B0C
    xor  a
    ld   [$D224], a

label_567F9::
    ret
    ld   a, $06
    ld   [$FFF1], a
    call label_5572B
    call label_C05
    ret  nz
    ld   hl, $C340

label_56808::
    add  hl, bc
    res  6, [hl]
    call label_3B12
    jp   label_3D7F
    call label_3B39
    call label_57B88
    call label_3B23
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_5683F
    ld   a, $18
    call label_3BB5
    ld   a, [$FFD7]
    ld   hl, $C250
    sub  a, [hl]
    bit  7, a
    jr   z, label_56831
    dec  [hl]
    dec  [hl]

label_56831::
    inc  [hl]
    ld   a, [$FFD8]
    ld   hl, $C240
    sub  a, [hl]
    bit  7, a
    jr   z, label_5683E
    dec  [hl]
    dec  [hl]

label_5683E::
    inc  [hl]

label_5683F::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_5685F
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]
    call label_C05
    ld   [hl], $80
    call label_27F2
    ld   a, $10
    ld   [$FFF3], a
    call label_55383
    jp   label_3B12

label_5685F::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $07
    ret  nz
    ld   a, $E6
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
    ld   [hl], $03
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $1F
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C2
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $01
    ret
    call label_C05
    cp   $01
    jr   nz, label_568A1
    dec  [hl]
    jp   label_55128

label_568A1::
    and  a
    ret  nz
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, $50
    ld   [$FF98], a
    ld   a, $30
    ld   [$FF99], a
    ld   a, $0C
    call label_3BAA
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_568D6
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_568D6
    call label_C05
    ld   [hl], $5F
    call label_3B12

label_568D6::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_57B88

label_568DF::
    nop
    nop
    nop
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    call label_C05
    jr   nz, label_56914
    call label_3D7F
    call label_552BB
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $C0
    call label_BFB
    ld   [hl], $90
    xor  a
    ld   [$D223], a
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $3F
    ret

label_56914::
    cp   $20
    jr   c, label_5691A
    ld   a, $1F

label_5691A::
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_568DF
    add  hl, de
    ld   a, [hl]
    ld   [$FFF1], a
    jp   label_5572B

label_5692A::
    ld   a, [$FFF0]
    cp   $0A
    ret  nc
    ld   a, [$FFF1]
    inc  a
    ret  z
    ld   a, [$D21E]
    and  a
    ld   a, [$FFF1]
    jr   z, label_5693D
    add  a, $05

label_5693D::
    ld   [$FFF1], a
    call label_569D2
    call label_56A69
    jp   label_56C10

label_56948::
    ld    hl, sp+$FC
    ld   d, b
    nop
    ld    hl, sp+$04
    ld   d, d
    nop
    ld    hl, sp+$0C
    ld   l, [hl]
    nop
    ld   [label_56AF8], sp
    nop
    ld   [label_56C00], sp
    nop
    ld   [label_56C08], sp
    jr   nz, label_56969
    db   $10 ; Undefined instruction
    jr   nz, label_56964
    rst  $38
    rst  $38
    rst  $38
    ei

label_56969::
    cp   $50
    nop
    ei
    ld   b, $52
    nop
    ei
    ld   c, $6E
    nop
    ld   [label_56AF8], sp
    nop
    ld   [label_56C00], sp
    nop
    ld   [label_56C08], sp
    jr   nz, label_56989
    db   $10 ; Undefined instruction
    jr   nz, label_56984

label_56985::
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FC
    ld   l, [hl]
    jr   nz, label_56985
    inc  b
    ld   d, d
    jr   nz, label_56989
    inc  c
    ld   d, b
    jr   nz, label_5699D
    ld    hl, sp+$6A
    nop
    ld   [label_56C00], sp
    nop
    ld   [label_56C08], sp
    jr   nz, label_569A9
    db   $10 ; Undefined instruction
    jr   nz, label_569A4
    rst  $38
    rst  $38
    rst  $38
    ei

label_569A9::
    ld   a, [label_206E]

label_569AC::
    ei
    ld   [bc], a
    ld   d, d
    jr   nz, label_569AC
    ld   a, [bc]
    ld   d, b
    jr   nz, label_569BD
    ld    hl, sp+$6A
    nop
    ld   [label_56C00], sp
    nop
    ld   [label_56C08], sp
    jr   nz, label_569C9
    db   $10 ; Undefined instruction
    jr   nz, label_569C4
    rst  $38
    rst  $38
    rst  $38

label_569C8::
    nop

label_569C9::
    nop
    ld   [bc], a
    ld   bc, label_200
    ld   [bc], a
    nop
    inc  bc
    ld   [bc], a

label_569D2::
    ld   a, [$FFF1]
    ld   e, a
    ld   d, b
    ld   hl, label_569C8
    add  hl, de
    ld   a, [hl]
    rla
    rla
    rla
    rla
    rla
    and  $70
    ld   e, a
    ld   hl, label_56948
    add  hl, de
    ld   c, $07
    call label_3CE6
    ld   a, $07
    jp   label_3DA0

label_569F1::
    db   $F4 ; Undefined instruction
    ld    hl, sp+$64
    nop
    cp   $11
    ld   h, b
    nop
    cp   $19
    ld   h, d
    nop
    db   $F4 ; Undefined instruction
    ld   sp, hl
    ld   h, h

label_56A00::
    nop
    cp   $11
    ld   h, b
    nop
    cp   $19
    ld   h, d

label_56A08::
    nop
    ld   a, [$FF00]
    ld   h, h
    jr   nz, label_56A0D
    rst  $38
    rst  $38
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
    db   $10 ; Undefined instruction
    nop
    ei
    jr   label_56A82
    nop
    nop
    ld    hl, sp+$66
    nop
    cp   $10
    ld   h, [hl]
    jr   nz, label_56A29
    rst  $38
    rst  $38
    rst  $38
    db   $F4 ; Undefined instruction

label_56A2E::
    db   $10 ; Undefined instruction

label_56A30::
    jr   nz, label_56A30
    rst  $28
    ld   h, d

label_56A34::
    jr   nz, label_56A34

label_56A36::
    rst  $30
    ld   h, b
    jr   nz, label_56A2E
    rrca
    ld   h, h

label_56A3C::
    jr   nz, label_56A3C
    rst  $28
    ld   h, d

label_56A40::
    jr   nz, label_56A40
    rst  $30
    ld   h, b
    jr   nz, label_56A36
    ld   [$0064], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_56A55::
    ei
    ld   a, [$FF62]
    jr   nz, label_56A55
    ld    hl, sp+$60

label_56A5C::
    jr   nz, label_56A5C
    ld    hl, sp+$66
    nop
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_56A65
    rst  $38
    rst  $38
    rst  $38

label_56A69::
    ld   a, [$FFF1]
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_569F1
    add  hl, de
    ld   c, $03
    call label_3CE6
    ld   a, $03
    jp   label_3DA0

label_56A84::
    db   $EC ; Undefined instruction
    nop
    ld   [hl], b
    nop
    db   $EC ; Undefined instruction
    ld   [label_2070], sp
    db   $F4 ; Undefined instruction
    nop
    ld   a, h
    nop
    db   $F4 ; Undefined instruction
    ld   [label_207C], sp
    ld   [label_57C00], sp
    ld   b, b
    ld   [label_57C08], sp
    ld   h, b
    inc  d
    nop
    ld   [hl], b
    ld   b, b
    inc  d
    ld   [label_56070], sp

label_56AA4::
    nop
    nop
    ld   a, [hl]
    ld   b, b
    nop
    ld   [label_207E], sp
    di
    dec  c
    ld   a, b
    jr   nz, label_56AA4
    dec  d
    db   $76 ; Halt
    jr   nz, label_56AC2
    di
    db   $76 ; Halt
    ld   b, b
    dec  c
    ei
    ld   a, b
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_56AC2::
    rst  $38
    rst  $38
    nop
    db   $EC ; Undefined instruction
    ld   [hl], d
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   [hl], h
    nop
    nop
    db   $FC ; Undefined instruction
    ld   a, d
    nop
    nop
    inc  c
    ld   a, d
    nop
    nop
    inc  d
    ld   [hl], h
    jr   nz, label_56AD9

label_56AD9::
    inc  e
    ld   [hl], d
    jr   nz, label_56ADD

label_56ADD::
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    ld   a, [hl]
    nop
    nop
    ld   [label_5607E], sp
    di
    di
    db   $76 ; Halt
    nop
    di
    ei
    ld   a, b
    nop
    dec  c
    dec  c
    ld   a, b
    ld   h, b

label_56AF8::
    dec  c
    dec  d

label_56AFA::
    db   $76 ; Halt
    ld   h, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  af
    rrca
    ld   a, b
    jr   nz, label_56AFA
    rla
    db   $76 ; Halt
    jr   nz, label_56B1A
    di
    db   $76 ; Halt
    ld   b, b
    dec  c
    ei
    ld   a, b
    ld   b, b
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   [rIE], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  af
    pop  af
    db   $76 ; Halt
    nop
    pop  af
    ld   sp, hl
    ld   a, b
    nop
    dec  c
    dec  c
    ld   a, b
    ld   h, b
    dec  c
    dec  d
    db   $76 ; Halt
    ld   h, b
    nop
    nop
    rst  $38
    rst  $38
    nop
    ld   [rIE], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_56B41::
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$08
    ld   a, b
    jr   nz, label_56B41
    db   $10 ; Undefined instruction
    jr   nz, label_56B55
    ld    hl, sp+$76
    ld   b, b
    ld   [label_57800], sp
    ld   b, b
    nop

label_56B55::
    nop
    rst  $38
    ld   b, b
    nop
    ld   [label_20FF], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction

label_56B65::
    inc  b
    ld   a, b
    jr   nz, label_56B65
    inc  c
    db   $76 ; Halt
    jr   nz, label_56B71
    db   $FC ; Undefined instruction
    db   $76 ; Halt
    ld   b, b
    inc  b

label_56B71::
    inc  b
    ld   a, b
    ld   b, b
    nop
    nop
    rst  $38
    ld   b, b
    nop
    ld   [label_20FF], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$F8
    db   $76 ; Halt
    nop
    ld    hl, sp+$00
    ld   a, b
    nop
    ld   [label_57808], sp
    ld   h, b
    ld   [label_57610], sp
    ld   h, b
    nop
    nop
    rst  $38
    nop
    nop
    ld   [label_560FF], sp
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
    db   $76 ; Halt
    nop
    db   $FC ; Undefined instruction
    inc  b
    ld   a, b
    nop
    inc  b
    inc  b
    ld   a, b
    ld   h, b
    inc  b
    inc  c
    db   $76 ; Halt
    ld   h, b
    nop
    nop
    rst  $38
    nop
    nop
    ld   [label_560FF], sp
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld    hl, sp+$72
    nop
    nop
    nop
    ld   [hl], h
    nop
    nop
    ld   [label_2074], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_56BD5

label_56BD5::
    ld   [rIE], sp
    nop
    db   $10 ; Undefined instruction
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    ei
    ld   [hl], d
    nop
    nop
    inc  bc
    ld   [hl], h
    nop
    nop
    dec  b
    ld   [hl], h
    jr   nz, label_56BF1

label_56BF1::
    dec  c
    ld   [hl], d
    jr   nz, label_56BF5

label_56BF5::
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    nop
    inc  c
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38

label_56C00::
    nop
    nop
    rst  $38
    rst  $38

label_56C04::
    ld   [label_606], sp
    ld   b, $04
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b

label_56C10::
    ld   a, [$D224]
    and  a
    ret  z
    ld   a, [$D225]
    ld   hl, $FFEE
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D226]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   a, [$D224]
    dec  a
    ld   e, a
    ld   d, b
    ld   hl, label_56C04
    add  hl, de
    ld   c, [hl]
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
    ld   a, e
    and  $E0
    ld   e, a
    ld   hl, label_56A84
    add  hl, de
    push bc
    call label_3CE6
    pop  de
    ld   a, e
    call label_3DA0
    jp   label_3D8A

label_56C59::
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    ld   bc, label_302

label_56C61::
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $09
    jp   nc, label_57C31
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   hl, label_56C59
    jr   z, label_56C8A
    ld   hl, label_56C5D

label_56C8A::
    add  hl, de
    ld   a, [hl]
    inc  a
    ld   [$D224], a
    xor  a
    ld   [$D225], a
    ld   [$D226], a
    call label_56C10
    xor  a
    ld   [$D224], a
    call label_57B0D
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_56CAB
    ld   a, $3A
    ld   [$FFF4], a

label_56CAB::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    call label_57B88
    call label_3B44
    call label_C05
    jr   z, label_56CBC
    ret

label_56CBC::
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    ld   [$FF98], a
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    sub  a, $0C
    ld   [$FF99], a
    ld   a, $10
    call label_3BB5
    ld   hl, $C250
    add  hl, bc
    ld   a, [$FFD7]
    sub  a, [hl]
    and  $80
    jr   nz, label_56CE9
    inc  [hl]
    inc  [hl]

label_56CE9::
    dec  [hl]
    ld   hl, $C240
    add  hl, bc
    ld   a, [$FFD8]
    sub  a, [hl]
    and  $80
    jr   nz, label_56CF7
    inc  [hl]
    inc  [hl]

label_56CF7::
    dec  [hl]
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_56D29
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_56D29
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $08
    jr   nz, label_56D29
    ld   [hl], $03
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $4C
    call label_57C31

label_56D29::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    ret
    ld   c, d
    nop
    ld   c, d
    jr   nz, label_56D81
    nop
    ld   c, h
    jr   nz, label_56D87
    nop
    ld   c, [hl]
    jr   nz, label_56D3D

label_56D3D::
    nop
    ld   bc, label_1101
    jr   nc, label_56DB0
    call label_3BC0
    call label_57B0D
    call label_C05
    jp   z, label_57C31
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_56D3C
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_56D5E::
    ld   e, $00
    ld   e, $60
    inc  [hl]
    nop
    inc  [hl]
    jr   nz, label_56DBB
    nop
    ld   d, h
    jr   nz, label_56DC1
    nop
    ld   d, [hl]
    jr   nz, label_56D5F
    rst  $20
    rla
    rla
    and  $10
    ld   [$FFED], a
    ld   de, label_56D5E
    call label_3BC0
    call label_57B0D
    ld   a, [$FFF0]

label_56D81::
    rst  0
    add  a, [hl]
    ld   l, l
    sbc  a, h
    ld   l, l
    call label_C05
    jr   nz, label_56D90
    ld   [hl], $20
    jp   label_3B12

label_56D90::
    ld   e, $00
    cp   $18
    jr   nc, label_56D98
    ld   e, $01

label_56D98::
    ld   a, e
    jp   label_3B0C
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $02
    call label_3B0C
    call label_C05
    cp   $01
    jr   nz, label_56DB8
    ld   a, $28
    ld   [$FFF4], a
    ld   a, $30
    call label_3BAA

label_56DB8::
    ld   a, [$FFE7]
    xor  c

label_56DBB::
    rra
    jr   nc, label_56DC4
    call label_57B88

label_56DC1::
    call label_3B44

label_56DC4::
    ld   a, [$FFEE]
    cp   $A8
    jp   nc, label_57C31
    ld   a, [$FFEC]
    cp   $88
    jp   nc, label_57C31
    ret

label_56DD3::
    ld   bc, label_302
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   bc, label_2320
    ld   h, $29
    inc  l
    cpl
    ldd  [hl], a
    dec  [hl]
    jr   c, label_56E1D
    jr   c, label_56E1F
    jr   c, label_56E21
    jr   c, label_56E23
    jr   c, label_56E25
    jr   c, label_56E27
    jr   c, label_56E29
    jr   c, label_56E2B

label_56DF3::
    jr   nz, label_56E18
    ld   h, $29
    inc  l
    cpl
    ldd  [hl], a
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_56E00::
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_56E08::
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_56E0B::
    jr   z, label_56E34
    ld   h, $25
    inc  h
    inc  hl
    ldi  [hl], a
    ld   hl, label_1F20
    ld   e, $1D
    inc  e

label_56E18::
    dec  de
    ld   a, [de]
    add  hl, de
    jr   label_56E35

label_56E1D::
    jr   label_56E37

label_56E1F::
    jr   label_56E39

label_56E21::
    jr   label_56E3B

label_56E23::
    inc  bc
    ld   [bc], a

label_56E25::
    ld   bc, $0000
    nop

label_56E29::
    nop
    nop

label_56E2B::
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_56E4E
    cp   $10

label_56E35::
    jr   nz, label_56E3D

label_56E37::
    dec  [hl]
    call label_552B1

label_56E3B::
    ld   a, $10

label_56E3D::
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_56E23
    add  hl, de
    ld   a, [hl]
    ld   [$FFF1], a
    jp   label_5572B

label_56E4E::
    call label_57056
    ld   a, [$FFF0]
    and  a
    jr   z, label_56E5A
    xor  a
    ld   [$DB94], a

label_56E5A::
    call label_57B0D
    ld   a, [$FFF0]
    rst  0
    ld   h, [hl]
    ld   l, [hl]
    and  c
    ld   l, a
    cp   h
    ld   l, a
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $F0
    jr   nc, label_56E9B
    ld   a, $03
    ld   [$C5A7], a
    ld   a, $F6
    call label_2385
    ld   a, $5E
    ld   [$D368], a
    call label_C05
    ld   [hl], $80
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $80
    ld   hl, $C350
    add  hl, bc
    res  7, [hl]
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]
    call label_27F2
    jp   label_3B12

label_56E9B::
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_56EB5
    ld   a, [$D223]
    cp   $04
    jr   nc, label_56EB5
    inc  a
    ld   [$D223], a
    cp   $01
    jr   nz, label_56EB5
    ld   hl, $D368
    ld   [hl], $50

label_56EB5::
    call label_C56
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cpl
    cp   $17
    jr   c, label_56EC4
    ld   a, $17

label_56EC4::
    ld   e, a
    ld   d, b
    ld   hl, label_56DDB
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   hl, label_56DF3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ld   hl, label_56E0B
    add  hl, de
    ld   a, [$D210]
    inc  a
    cp   [hl]
    jr   c, label_56EEA
    ld   a, $3D
    ld   [$FFF2], a
    xor  a

label_56EEA::
    ld   [$D210], a
    ld   a, $00
    call label_3B0C
    call label_BFB
    jr   nz, label_56F0B
    call label_280D
    and  $0F
    add  a, $20
    ld   [hl], a
    call label_280D
    and  $01
    jr   nz, label_56F0B
    call label_C00
    ld   [hl], $7F

label_56F0B::
    ld   hl, $C350
    add  hl, bc
    set  7, [hl]
    call label_C00
    jr   z, label_56F30
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_56DD3
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    cp   $03
    jr   nz, label_56F30
    ld   hl, $C350
    add  hl, bc
    res  7, [hl]

label_56F30::
    call label_3B39
    ld   e, $0F
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $F8
    jr   nc, label_56F40
    ld   e, $07

label_56F40::
    ld   a, [$FFE7]
    and  e
    jr   nz, label_56F70
    ld   a, [$FF99]
    push af
    sub  a, $20
    ld   [$FF99], a
    ld   a, $08
    call label_3BB5
    ld   a, [$FFD7]
    ld   hl, $C250
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_56F5E
    inc  [hl]
    inc  [hl]

label_56F5E::
    dec  [hl]
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_56F6C
    inc  [hl]
    inc  [hl]

label_56F6C::
    dec  [hl]
    pop  af
    ld   [$FF99], a

label_56F70::
    call label_57B88
    call label_3B23
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    jr   nc, label_56F8B
    ld   a, [$D221]
    inc  a
    ld   [$D221], a

label_56F8B::
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    jr   nc, label_56FA0
    ld   a, [$D222]
    dec  a
    ld   [$D222], a

label_56FA0::
    ret
    call label_C05
    cp   $02
    jr   nz, label_56FAD
    ld   hl, $D368
    ld   [hl], $5F

label_56FAD::
    and  a
    ret  nz
    ld   [hl], $80
    ld   a, $3D
    ld   [$FFF4], a
    ld   a, $10
    ld   [$FFF3], a
    jp   label_3B12
    call label_C05
    and  $0F
    jr   nz, label_56FF5
    ld   a, [$D223]
    cp   $00
    jr   nz, label_56FF1
    call label_C4B
    call label_55383
    call label_57C31
    ld   a, $E6
    call label_3B86
    ld   hl, $C390
    add  hl, de
    ld   [hl], $02
    ld   hl, $C210
    add  hl, de
    ld   [hl], $30
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $FF
    ret

label_56FF1::
    dec  a
    ld   [$D223], a

label_56FF5::
    ret

label_56FF6::
    ld   a, [$FFFC]
    ld   h, b
    nop
    ld   a, [$FF04]
    ld   h, d
    nop
    ld   a, [$FF0C]

label_57000::
    ld   h, b
    jr   nz, label_56FF3
    db   $FC ; Undefined instruction
    ld   h, h
    nop
    ld   a, [$FF04]

label_57008::
    ld   h, [hl]
    nop
    ld   a, [$FF0C]

label_5700C::
    ld   h, h
    jr   nz, label_56FFF
    db   $FC ; Undefined instruction
    ld   l, b
    nop
    ld   a, [$FF04]
    ld   l, d
    nop
    ld   a, [$FF0C]
    ld   l, b
    jr   nz, label_5700B
    db   $FC ; Undefined instruction
    ld   h, h
    nop
    ld   a, [$FF04]
    ld   h, [hl]
    nop
    ld   a, [$FF0C]
    ld   h, h
    jr   nz, label_57027

label_57027::
    db   $FC ; Undefined instruction
    ld   l, h
    nop
    nop
    inc  b
    ld   l, [hl]
    nop
    nop
    inc  c
    ld   l, h
    jr   nz, label_57033

label_57033::
    db   $FC ; Undefined instruction
    ld   [hl], b
    nop
    nop
    inc  b
    ld   [hl], d
    nop
    nop
    inc  c
    ld   [hl], b
    jr   nz, label_5703F

label_5703F::
    db   $FC ; Undefined instruction
    ld   [hl], h
    nop
    nop
    inc  b
    db   $76 ; Halt
    nop
    nop

label_57047::
    inc  c
    ld   [hl], h
    jr   nz, label_5704B

label_5704B::
    db   $FC ; Undefined instruction
    ld   a, b
    nop
    nop
    inc  b
    ld   a, d
    nop
    nop
    inc  c
    ld   a, b
    jr   nz, label_57047
    rst  $20
    rra
    rra
    rra
    and  $03
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_56FF6
    add  hl, de
    ld   c, $03
    call label_3CE6
    ld   a, $03
    call label_3DA0
    ld   a, [$FFF1]
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_57026
    add  hl, de
    ld   c, $03
    call label_3CE6
    ld   a, $03
    call label_3DA0
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    push af
    push hl
    sub  a, $08
    ld   [hl], a
    call label_3D8A
    call label_5717B
    pop  hl
    pop  af
    ld   [hl], a
    jp   label_3D8A

label_570A7::
    ret  nc
    pop  de
    call nc, label_DFD9
    and  $EE
    rst  $30

label_570AF::
    nop
    add  hl, bc
    ld   [de], a
    ld   a, [de]
    ld   hl, label_2C27
    cpl
    jr   nc, label_570E8
    inc  l
    daa
    ld   hl, label_121A
    add  hl, bc
    nop
    rst  $30
    xor  $E6
    rst  $18
    reti
    call nc, label_D0D1
    pop  de
    call nc, label_DFD9
    and  $EE
    rst  $30

label_570CF::
    jp  c, label_DDDB
    pop  hl
    and  $EB
    ld   a, [$FF00+C]

label_570D7::
    nop
    rlca
    ld   c, $15
    ld   a, [de]
    rra
    inc  hl
    dec  h
    ld   h, $25
    inc  hl
    rra
    ld   a, [de]
    dec  d
    ld   c, $07
    nop

label_570E8::
    ld   sp, hl
    ld   a, [$FF00+C]
    and  $E1
    db   $DB
    db   $DB
    jp  c, label_DDDB
    pop  hl
    and  $EB
    ld   a, [$FF00+C]

label_570F7::
    db   $E4 ; Undefined instruction
    push hl
    rst  $20
    jp   [hl]
    db   $ED ; Undefined instruction

label_570FC::
    pop  af
    or   $FB

label_570FF::
    nop
    dec  b
    ld   a, [bc]
    rrca
    inc  de
    rla
    add  hl, de
    dec  de
    inc  e
    dec  de
    add  hl, de
    rla
    inc  de
    rrca
    ld   a, [bc]
    dec  b
    nop
    ei
    or   $F1
    db   $ED ; Undefined instruction
    jp   [hl]
    rst  $20
    push hl
    db   $E4 ; Undefined instruction
    push hl
    rst  $20
    jp   [hl]
    db   $ED ; Undefined instruction
    pop  af
    or   $FB

label_5711F::
    xor  $EF
    ld   a, [$FFF2]
    db   $F4 ; Undefined instruction
    or   $FA
    db   $FD ; Undefined instruction

label_57127::
    nop
    inc  bc
    ld   b, $0A
    inc  c
    ld   c, $10
    ld   de, label_1112
    db   $10 ; Undefined instruction
    inc  c
    ld   a, [bc]
    ld   b, $03
    nop
    db   $FD ; Undefined instruction
    ld   a, [$F4F6]
    ld   a, [$FF00+C]
    rst  $28
    xor  $EF
    ld   a, [$FFF2]
    db   $F4 ; Undefined instruction
    or   $FA
    db   $FD ; Undefined instruction
    ld    hl, sp+$F9
    ld   a, [$FBFB]
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $38
    nop
    ld   bc, label_403
    dec  b
    dec  b
    ld   b, $07
    ld   [label_607], sp
    dec  b
    dec  b
    inc  b
    inc  bc
    ld   bc, rJOYP
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ei
    ei
    ld   a, [$F8F9]
    ld   sp, hl
    ld   a, [$FBFB]
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $38

label_5716F::
    ld   c, [hl]
    nop
    ld   c, [hl]
    jr   nz, label_571C0
    nop
    ld   c, h
    jr   nz, label_571F4
    ld   [bc], a
    ld   a, h
    ldi  [hl], a

label_5717B::
    ld   a, [$D223]
    cp   $04
    jr   c, label_571A0
    ld   a, [$D221]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_570AF
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_570A7
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, $02
    call label_572CF

label_571A0::
    ld   a, [$D223]
    cp   $03
    jr   c, label_571C5
    ld   a, [$D221]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_570D7
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_570CF
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a

label_571C0::
    ld   a, $01
    call label_572CF

label_571C5::
    ld   a, [$D223]
    cp   $02
    jr   c, label_571EA
    ld   a, [$D221]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_570FF
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_570F7
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, $01
    call label_572CF

label_571EA::
    ld   a, [$D223]
    cp   $01
    jr   c, label_57226
    ld   a, [$D221]

label_571F4::
    and  $0F
    cp   $07
    jr   z, label_57202
    cp   $08
    jr   z, label_57202
    cp   $09
    jr   nz, label_57208

label_57202::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_57226

label_57208::
    ld   a, [$D221]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_57127
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_5711F
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, $00
    call label_572CF

label_57226::
    ld   a, [$D223]
    cp   $04
    jr   c, label_5724B
    ld   a, [$D222]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_570AF
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_570A7
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, $02
    call label_572CF

label_5724B::
    ld   a, [$D223]
    cp   $03
    jr   c, label_57270
    ld   a, [$D222]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_570D7
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_570CF
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, $01
    call label_572CF

label_57270::
    ld   a, [$D223]
    cp   $02
    jr   c, label_57295
    ld   a, [$D222]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_570FF
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_570F7
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, $01
    call label_572CF

label_57295::
    ld   a, [$D223]
    cp   $01
    ret  c
    ld   a, [$D222]
    and  $0F
    cp   $07
    jr   z, label_572AC
    cp   $08
    jr   z, label_572AC
    cp   $09
    jr   nz, label_572B1

label_572AC::
    ld   a, [$FFE7]
    and  $01
    ret  z

label_572B1::
    ld   a, [$D222]
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_57127
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFEE], a
    ld   hl, label_5711F
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, $00
    jp   label_572CF

label_572CF::
    ld   [$FFF1], a
    ld   de, label_5716F
    call label_3BC0
    ld   a, $02
    call label_3DA0
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_5731D
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_5731D
    ld   hl, $C146
    ld   a, [$DBC7]
    or   [hl]

label_572FB::
    jr   nz, label_5731D
    ld   a, $08
    ld   [$DB94], a
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a
    ld   a, $10
    ld   [$C13E], a
    ld   a, $30
    ld   [$DBC7], a
    ld   a, $03
    ld   [$FFF3], a

label_5731D::
    jp   label_3D8A

label_57320::
    ld   e, b
    ld   [bc], a
    ld   e, b
    ldi  [hl], a
    ld   e, d
    ld   [bc], a
    ld   e, d
    ldi  [hl], a

label_57328::
    db   $10 ; Undefined instruction
    nop
    nop

label_5732C::
    nop
    nop
    ei
    dec  b
    ld   de, label_57320
    call label_3BC0
    call label_57B0D
    call label_57B3E
    call label_57B88
    call label_3B23
    call label_3B39
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_5735C
    call label_C05
    jr   nz, label_57382

label_5735C::
    call label_C05
    call label_280D
    and  $7F
    add  a, $30
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_57328
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_5732C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_57382::
    ret

label_57383::
    ld   e, h
    inc  bc
    ld   e, [hl]
    inc  bc
    ld   e, [hl]
    inc  hl
    ld   e, h
    inc  hl
    ld   e, [hl]
    ld   h, e
    ld   e, h
    ld   h, e
    ld   e, h
    ld   b, e
    ld   e, [hl]
    ld   b, e

label_57393::
    inc  l
    inc  bc
    ld   l, $03
    ld   l, $23
    inc  l
    inc  hl
    ld   l, $63
    inc  l
    ld   h, e
    inc  l
    ld   b, e
    ld   l, $43

label_573A3::
    db   $FD ; Undefined instruction
    inc  bc
    nop
    nop

label_573A7::
    nop
    nop
    inc  bc
    db   $FD ; Undefined instruction
    ld   de, label_57383
    ld   a, [$DB95]
    cp   $01
    jr   nz, label_573B8
    ld   de, label_57393

label_573B8::
    call label_3BC0
    call label_57B0D
    call label_57B3E
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $03
    call label_3B0C
    call label_57C0A
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   hl, $C340
    add  hl, bc
    res  7, [hl]
    ld   a, [$C15B]
    and  a
    jr   z, label_573E9
    ld   a, [$FF9E]
    xor  $01
    cp   e
    jr   nz, label_573E9
    set  7, [hl]

label_573E9::
    call label_3B5A
    jr   nc, label_57428
    call label_CBE
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_573A3
    add  hl, de

label_57403::
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc

label_57408::
    ld   [hl], a
    ld   hl, label_573A7
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   a, $3E
    ld   [$FFF2], a
    call label_57B88
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $03
    call label_3B23
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b

label_57428::
    ld   a, [$C16A]
    and  a
    jr   nz, label_57433
    ld   a, [$C15B]
    and  a
    ret  nz

label_57433::
    jp   label_3B70

label_57436::
    jr   nc, label_57408
    call label_57B0D
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_57436
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_57B8B
    call label_3B23
    ld   a, [$FFAF]
    cp   $9D
    jr   z, label_5746A
    ld   e, a
    ld   d, $01
    call label_2A26
    and  a
    jr   nz, label_5746A
    call label_57C31
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEA], a

label_5746A::
    ld   a, [$FFEE]
    sub  a, $08
    ld   [$FFCE], a
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFEC]
    add  a, $04
    sub  a, $10
    ld   [$FFCD], a
    and  $F0
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    add  hl, de
    ld   [hl], $9D
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_5749D
    push bc
    ld   a, $9D
    ld   [$DDD8], a
    ld   a, $15
    call label_91D
    pop  bc

label_5749D::
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
    push hl
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    pop  hl
    and  a
    jr   nz, label_574E6
    ld   a, $04
    ldi  [hl], a
    ld   a, [$FFEA]
    and  a
    ld   a, $08
    jr   nz, label_574CB
    ld   a, $04

label_574CB::
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $05
    ldi  [hl], a
    ld   a, [$FFEA]
    and  a
    ld   a, $09
    jr   nz, label_574E2
    ld   a, $05

label_574E2::
    ldi  [hl], a
    ld   [hl], $00
    ret

label_574E6::
    ld   a, [$FFEA]
    and  a
    ld   a, $0A
    jr   nz, label_574EF
    ld   a, $04

label_574EF::
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [$FFEA]
    and  a
    ld   a, $0B
    jr   nz, label_57506
    ld   a, $05

label_57506::
    ldi  [hl], a
    ld   a, $05
    ldi  [hl], a
    ld   [hl], $00
    ret
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_5757F
    call label_57B0D
    call label_57BDB
    add  a, $20
    cp   $40
    jr   nc, label_5756E
    call label_57BEB
    add  a, $20
    cp   $40
    jr   nc, label_5756E
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $3F
    jr   nz, label_5756E
    ld   a, $B2
    ld   e, $04
    call label_3B98
    jr   c, label_5756E
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $18
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $20
    push bc
    ld   c, e
    ld   b, d
    ld   a, $08
    call label_3BAA
    pop  bc

label_5756E::
    ret

label_5756F::
    ld   [$00F8], sp
    nop

label_57573::
    nop
    nop
    ld    hl, sp+$08
    ld   [hl], b
    nop
    ld   [hl], d
    nop
    ld   [hl], d
    jr   nz, label_575EE
    jr   nz, label_57591
    ld   [hl], a
    ld   [hl], l
    call label_3BC0
    call label_57B0D
    call label_57B3E
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_57B88
    call label_C00
    jr   nz, label_575A0
    call label_3B23

label_575A0::
    call label_3B39
    call label_C05
    jr   nz, label_575CB
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_5756F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_57573
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_575CB::
    ret
    ld   a, $01

label_575CE::
    ld    hl, sp+$08
    nop
    nop

label_575D2::
    nop
    nop
    ld   [$CDF8], sp
    dec  c
    ld   a, e
    ld   a, [$FFF0]
    and  a
    jr   nz, label_575E1
    call label_3B4F

label_575E1::
    call label_57B88
    call label_3B2E
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_57639
    push hl
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEF]
    ld   [$FFD8], a
    ld   a, $05
    call label_CC7
    pop  hl
    ld   a, [hl]
    cp   $02
    jp   nz, label_57C31
    ld   [hl], $00
    ld   hl, $C290
    add  hl, bc
    ld   [hl], a
    ld   a, [$FF9E]
    and  $02
    jr   nz, label_57616
    ld   hl, $C240
    jr   label_57619

label_57616::
    ld   hl, $C250

label_57619::
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    call label_CAF
    ld   a, $10
    ld   [$C13E], a
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, label_575CE
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, label_575D2
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a
    ret

label_57639::
    ld   a, [$FFEE]
    add  a, $04
    ld   [$FFD7], a
    ld   a, [$FFEF]
    ld   [$FFD8], a
    ld   a, $06
    call label_CC7
    ld   [hl], $10
    ret

label_5764B::
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    nop
    ld   [label_2274], sp
    nop
    nop
    rst  $38
    ld   [bc], a
    ld   a, [$FF08]
    ld   a, d
    ld   [bc], a
    nop
    nop
    db   $76 ; Halt
    ld   [bc], a
    nop
    ld   [label_278], sp
    ld   a, [$FF00]
    ld   a, d
    ldi  [hl], a
    nop
    nop
    ld   a, b
    ldi  [hl], a
    nop
    ld   [label_2276], sp
    nop
    nop
    ld   [hl], h
    ld   b, d
    nop
    ld   [label_56274], sp
    nop
    nop
    rst  $38
    ld   [bc], a
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_57825
    ld   hl, label_5764B
    ld   a, [$FFF1]
    rla
    rla
    and  $FC
    ld   e, a
    rla
    add  a, e
    ld   e, a
    ld   d, b
    add  hl, de
    ld   c, $03
    call label_3CE6
    call label_3CD9
    ld   a, [$FFF0]
    cp   $02
    jr   nc, label_576EF
    ld   a, [$C157]
    and  a
    jr   z, label_576EF
    ld   a, [$C178]
    and  a
    jr   z, label_576EF
    ld   a, [$FFEE]
    add  a, $08
    ld   hl, $C179
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_576EF
    ld   a, [$FFEF]
    add  a, $08
    ld   hl, $C17A
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_576EF
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $18
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $18
    call label_3B12
    ld   [hl], $02
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $15
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $0C
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $FA
    ret

label_576EF::
    ld   a, [$FFF0]
    rst  0
    ld   a, [label_A76]
    ld   [hl], a
    sub  a, e
    ld   [hl], a
    cp   a
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    call label_C05
    ld   [hl], $80
    jp   label_3B12
    call label_57B0D
    call label_C05
    ret  nz
    ld   [hl], $50
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    cp   $03
    jr   nz, label_5771E
    xor  a

label_5771E::
    ld   [hl], a
    ld   [$FFF1], a
    cp   $00
    jr   z, label_57792
    call label_C05
    ld   [hl], $28
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $0F
    jr   nz, label_57738
    ld   a, $02
    jr   label_5773A

label_57738::
    ld   a, $E0

label_5773A::
    call label_3B86
    ret  c
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    sub  a, $0C
    add  a, $18
    ld   [hl], a
    ld   hl, $C310
    add  hl, de
    ld   [hl], $18
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   hl, $C320
    add  hl, de
    ld   [hl], $20
    ld   a, [$FFF1]
    cp   $01
    ld   a, $F8
    jr   z, label_5776B
    ld   a, $08

label_5776B::
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, de
    ld   [hl], $0C
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C430
    add  hl, de
    set  0, [hl]
    ld   a, $08
    ld   [$FFF2], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $60
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01

label_57792::
    ret
    ld   a, $03
    call label_3B0C
    call label_57B88
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_577BE
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_3D7F
    call label_3B12

label_577BA::
    ld   a, $14
    ld   [$FFF3], a

label_577BE::
    ret
    ld   a, $00
    call label_3B0C
    call label_57B88
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_577FE
    ld   [hl], $01
    call label_280D
    and  $0F
    add  a, $08
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
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

label_577FE::
    ld   a, [$FFEE]

label_57800::
    cp   $A8
    jp   nc, label_57C31
    ld   a, [$FFEC]
    cp   $80
    jp   nc, label_57C31
    ld   a, [$FFE7]
    and  $0F
    jr   z, label_577BA
    ret

label_57813::
    ld   a, h
    ld   bc, label_17E
    ld   a, [hl]
    ld   hl, label_217C

label_5781B::
    nop
    inc  c

label_5781D::
    db   $10 ; Undefined instruction
    nop
    db   $F4 ; Undefined instruction
    ld   a, [$FFF4]
    nop
    inc  c

label_57825::
    ld   de, label_57813
    call label_3BC0
    call label_57B0D
    call label_57B3E
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_3B39
    call label_57B88
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_5788C
    ld   [hl], b
    call label_280D
    and  $0F
    add  a, $10
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_5781D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_5781B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    ld   a, [hl]
    cp   $04
    jp   z, label_57C31
    ld   a, $09
    ld   [$FFF2], a

label_5788C::
    ret

label_5788D::
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
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_578AB
    ld   a, [$FFF1]
    add  a, $02
    ld   [$FFF1], a

label_578AB::
    ld   de, label_5788D
    call label_3BC0
    call label_57B0D
    call label_57BC1
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_578CF
    xor  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a

label_578CF::
    ld   a, [$FFF0]
    rst  0
    sbc  a, $78
    ld   l, $79

label_578D6::
    ld   [bc], a
    ld   [label_80C], sp
    cp   $F8
    db   $F4 ; Undefined instruction
    ld    hl, sp+$CD
    dec  b
    inc  c
    jr   nz, label_5791A
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_578D6
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
    ld   hl, label_578D6
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
    jp   label_3B12

label_5791A::
    ld   a, $01
    call label_3B0C
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_5792D
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $04
    ld   [hl], a

label_5792D::
    ret
    call label_57B88
    call label_3B23
    ld   a, [$FFE8]
    and  a
    jr   z, label_57950
    call label_C05
    jr   nz, label_57945
    ld   [hl], $48
    call label_3B12
    ld   [hl], b
    ret

label_57945::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $08
    ld   hl, $C310
    add  hl, bc
    inc  [hl]

label_57950::
    ld   a, $00
    jp   label_3B0C

label_57955::
    nop
    ld   [label_1810], sp
    jr   nz, label_57983
    jr   nc, label_57995
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $0F

label_57964::
    sla  a
    sla  a
    ld   e, a
    ld   a, [$C3C0]
    add  a, e
    cp   $60
    jr   c, label_57973
    sub  a, $60

label_57973::
    ld   [$C3C0], a
    ld   a, [$C3C1]
    add  a, e
    ld   [$C3C1], a
    cp   $60
    jr   c, label_57994
    ld   a, [$FFE7]

label_57983::
    ld   hl, $C123
    add  a, [hl]
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_57955
    add  hl, de
    ld   a, [hl]
    ld   [$C3C0], a

label_57994::
    ret

label_57995::
    ld   a, [$FFEA]
    cp   $07
    ret  z
    ld   hl, $C470
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_579DF
    cp   $03
    jp   z, label_57A27
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$FFF9]
    and  a
    ret  nz
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $10
    ret  z
    ld   a, [$FFE7]
    xor  c
    and  $01
    ret  nz
    ld   a, [$C3C0]
    ld   l, a
    ld   h, $00
    ld   de, $C030
    add  hl, de
    ld   a, [$FFEF]
    add  a, $0A
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, $04
    ldi  [hl], a
    ld   a, $26
    ldi  [hl], a
    ld   [hl], b
    ld   a, $01
    jp   label_57964

label_579DF::
    ld   a, [$FFEB]
    cp   $02
    jr   nz, label_579F0
    ld   hl, $FFEC
    dec  [hl]
    dec  [hl]
    call label_579F0
    jp   label_3D8A

label_579F0::
    ld   a, [$C3C0]
    ld   l, a
    ld   h, $00
    ld   de, $C030
    add  hl, de
    ld   e, $00
    ld   a, [$FFE7]
    and  $04

label_57A00::
    jr   z, label_57A04
    ld   e, $10

label_57A04::
    ld   a, [$FFEC]
    add  a, $0B

label_57A08::
    ldi  [hl], a
    ld   a, [$FFEE]
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, e

label_57A10::
    ldi  [hl], a
    ld   a, [$FFEC]
    add  a, $0B
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, $08
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, e
    or   $20
    ldi  [hl], a
    ld   a, $02
    jp   label_57964

label_57A27::
    push bc
    ld   hl, $C3D0
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   c, b
    or   [hl]
    jr   z, label_57A40
    ld   a, e
    rla
    rla
    and  $20
    ld   c, a

label_57A40::
    ld   a, [$C3C0]
    ld   l, a
    ld   h, $00
    ld   de, $C030
    add  hl, de
    ld   a, [$FFEC]
    add  a, $08
    ldi  [hl], a
    ld   a, [$FFEE]
    dec  a
    ldi  [hl], a
    ld   a, $1A
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    ld   a, [$FFEC]
    add  a, $08
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, $07
    ldi  [hl], a
    ld   a, $1A
    ldi  [hl], a
    ld   a, c
    ld   [hl], a
    pop  bc
    ld   a, $02
    jp   label_57964
    ret

label_57A6E::
    call label_3B5A
    jr   nc, label_57A9A
    call label_CBE
    ld   a, [$C1A6]
    and  a
    jr   z, label_57A8D
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_57A8D
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_57A8D::
    ld   a, [$C14A]
    ld   e, a
    call label_CB6
    call label_178E
    ld   a, e
    scf
    ret

label_57A9A::
    and  a
    ret

label_57A9C::
    ld   b, $04
    ld   [bc], a
    nop
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_57A9C
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

label_57ABC::
    ld   e, b
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $28
    jr   nc, label_57B0B
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_57B0B
    inc  e
    push de
    call label_57C0A
    ld   a, [$FF9E]
    xor  $01
    cp   e
    pop  de
    jr   nz, label_57B0B
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    ld   hl, $DE05
    or   [hl]
    jr   nz, label_57B0B
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_57B0B
    ld   a, [$FFCC]
    and  $10
    jr   z, label_57B0B
    scf
    ret

label_57B0B::
    and  a
    ret

label_57B0D::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_57B3C

label_57B13::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_57B3C
    cp   $01
    jr   z, label_57B29
    cp   $0B
    jr   nz, label_57B3C
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_57B3C

label_57B29::
    ld   hl, $C1A8
    ld   a, [$C19F]
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_57B3C
    ld   a, [$C124]
    and  a
    jr   z, label_57B3D

label_57B3C::
    pop  af

label_57B3D::
    ret

label_57B3E::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_57B87
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
    call label_57B88
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_57B7A
    call label_3B23

label_57B7A::
    ld   hl, $C250
    add  hl, bc
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af

label_57B87::
    ret

label_57B88::
    call label_57B95

label_57B8B::
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_57B95
    pop  bc
    ret

label_57B95::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_57BC0
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_57BAD::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_57BB7
    ld   e, $F0

label_57BB7::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_57BC0::
    ret

label_57BC1::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_57BC0
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_57BAD

label_57BDB::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_57BE9
    inc  e

label_57BE9::
    ld   d, a
    ret

label_57BEB::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   nz, label_57BF9
    inc  e

label_57BF9::
    ld   d, a
    ret
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $FFEC
    sub  a, [hl]
    bit  7, a
    jr   nz, label_57C08
    inc  e

label_57C08::
    ld   d, a
    ret

label_57C0A::
    call label_57BDB
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_57C17
    cpl
    inc  a

label_57C17::
    push af
    call label_57BEB
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_57C25
    cpl
    inc  a

label_57C25::
    pop  de
    cp   d
    jr   nc, label_57C2D
    ld   a, [$FFD7]
    jr   label_57C2F

label_57C2D::
    ld   a, [$FFD8]

label_57C2F::
    ld   e, a
    ret

label_57C31::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_57C37::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   b, e
    ld   a, h
    ld   d, h
    ld   a, h
    ld   h, e
    ld   a, h
    call label_C05
    ld   [hl], $A0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF

label_57C4E::
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
    jp   label_57C4E
    call label_C05
    jr   nz, label_57C6E
    call label_C4B
    jp   label_3F50

label_57C6E::
    jp   label_57C71

label_57C71::
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
    jp   label_57C91

label_57C91::
    call label_57B13
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
    jr   z, label_57CC6
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F0
    jr   label_57CD2

label_57CC6::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C310
    add  hl, de
    ld   [hl], $08

label_57CD2::
    call label_57C31
    ld   hl, $FFF4
    ld   [hl], $1A
    ret

label_57CDB::
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, label_57CF0
    cp   $06
    jr   c, label_57CF0
    inc  d

label_57CF0::
    add  hl, de
    ld   a, [hl]
    or   $20
    ld   [hl], a
    ld   [$FFF8], a
    ret
    ld   a, [$FFF0]
    rst  0
    ld   bc, label_5787D
    ld   a, l
    ld   sp, $CD7E
    db   $DB
    ld   a, e
    add  a, $0E
    cp   $1C
    jr   nc, label_57D4F
    call label_57BEB
    add  a, $0C
    cp   $18
    jr   nc, label_57D4F
    ld   a, [$FF9E]
    and  a
    jr   nz, label_57D4F
    ld   a, [$C133]
    and  a
    jr   z, label_57D4F
    call label_3B12
    call label_C05
    ld   [hl], $A0
    ld   a, $01
    ld   [$FFA2], a
    ld   a, $02
    ld   [$C146], a
    ld   a, $12
    ld   [$FFA3], a
    ld   a, $0C
    ld   [$FF9A], a
    xor  a
    ld   [$FF9B], a
    ld   a, $00
    ld   [$FF9E], a
    ld   a, $01
    ld   [$C10A], a
    ld   a, $1E
    ld   [$D368], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a

label_57D4F::
    ret

label_57D50::
    ld   d, b
    rlca
    ld   d, d
    rlca
    ld   d, h
    nop
    ld   d, [hl]
    nop

label_57D58::
    ld   d, b
    rlca
    ld   d, d
    rlca
    ld   d, h
    ld   [bc], a
    ld   d, [hl]
    ld   [bc], a

label_57D60::
    ld   d, b
    rlca
    ld   d, d
    rlca
    ld   d, h
    inc  bc
    ld   d, [hl]
    inc  bc

label_57D68::
    nop
    nop
    ld   e, [hl]
    ld   b, $00
    ld   [label_265E], sp

label_57D70::
    sbc  a, b
    ld   b, d
    sbc  a, b
    ld   d, b
    sbc  a, c
    sub  a, b
    sbc  a, c
    add  a, d
    ld   a, [$C146]
    and  a
    ret  nz
    call label_C05
    jr   nz, label_57D94
    ld   a, $01
    ld   [$C17F], a
    xor  a
    ld   [$C180], a
    ld   a, $08
    ld   [$C3CA], a
    call label_3B12
    xor  a

label_57D94::
    push af
    cp   $80
    jr   nc, label_57DEC
    push af
    and  $1F
    jr   nz, label_57DAF
    ld   a, [$C16B]
    cp   $02
    jr   z, label_57DAF
    ld   a, $03
    ld   [$C16C], a
    push bc
    call label_1A22
    pop  bc

label_57DAF::
    pop  af
    and  $0F
    jr   nz, label_57DEC
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   z, label_57DEC
    ld   a, [$D600]
    ld   e, a
    ld   d, b
    add  a, $05
    ld   [$D600], a
    ld   hl, $D601
    add  hl, de
    push hl
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    sla  a
    ld   e, a
    ld   d, b
    ld   hl, label_57D70
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    ld   a, $64
    ldi  [hl], a
    ld   a, $65
    ldi  [hl], a
    ld   [hl], b

label_57DEC::
    pop  af
    ld   e, $00
    cp   $80
    jr   c, label_57DF4
    inc  e

label_57DF4::
    ld   a, e

label_57DF5::
    ld   [$FFF1], a
    ld   a, $58
    ld   [$FFEE], a
    ld   [$FF98], a
    ld   a, $44
    ld   [$FFEC], a
    ld   [$FF99], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $FF

label_57E09::
    ld   [$FF9D], a
    ld   de, label_57D50
    ld   a, [$DC0F]
    and  a
    jr   z, label_57E1E
    ld   de, label_57D58
    cp   $01
    jr   z, label_57E1E
    ld   de, label_57D60

label_57E1E::
    call label_3BC0
    ld   a, [$FFFE]
    and  a
    jr   z, label_57E2E
    ld   hl, label_57D68
    ld   c, $02
    call label_3CE6

label_57E2E::
    jp   label_3D8A
    xor  a
    call label_57DF5
    ld   a, [$C17F]
    and  a
    ret  nz
    xor  a
    ld   [$FF9D], a
    ld   hl, $D401
    ld   a, $01
    ldi  [hl], a
    ld   a, [$FFF7]
    ldi  [hl], a
    ld   a, $CE
    ldi  [hl], a
    ld   a, $50
    ldi  [hl], a
    ld   a, $7C
    ld   [hl], a
    call label_57C31
    jp   label_C9E

label_57E55::
    ld   e, b
    nop
    ld   e, b
    ld   bc, label_258
    ld   e, b
    inc  bc
    ld   e, b
    ld   bc, label_57E55
    ld   d, a
    ld   a, [hl]
    ld   e, c
    ld   a, [hl]
    ld   e, e

label_57E66::
    ld   a, [hl]
    ld   e, c
    ld   a, [hl]
    ld   e, e
    ld   a, [hl]
    ld   d, l
    ld   a, [hl]

label_57E6D::
    ld   e, l
    ld   a, [hl]

label_57E6F::
    ld   e, b
    nop
    ld   e, d
    nop
    ld   e, d
    jr   nz, label_57E66
    pop  af
    and  a
    jr   z, label_57E82
    ld   de, label_57E6D
    call label_3BC0
    jr   label_57EA6

label_57E82::
    ld   a, [$FFFE]
    and  a
    jr   z, label_57EA0
    push bc
    ld   hl, label_57E5F
    ld   a, [$FFF6]
    cp   $B5
    jr   z, label_57E96
    sla  c
    rl   b
    add  hl, bc

label_57E96::
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    ld   d, a
    pop  bc
    call label_3C77
    jr   label_57EA6

label_57EA0::
    ld   de, label_57E6F
    call label_3C77

label_57EA6::
    call label_57B0D
    ld   a, [$FFF0]
    rst  0
    cp   c
    ld   a, [hl]
    inc  b
    ld   a, a

label_57EB0::
    ld   [bc], a
    inc  b
    ld   b, $00
    ld   a, [bc]
    ld   [label_D0C], sp
    dec  hl
    ld   a, [$DB95]
    cp   $07
    jr   z, label_57EC4
    xor  a
    ld   [$C5A2], a

label_57EC4::
    xor  a
    call label_3B0C
    call label_57ABC
    ret  nc
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, label_57ED6
    ld   e, $08
    jr   label_57EF3

label_57ED6::
    ld   e, $00
    ld   a, [$FFEE]
    cp   $20
    jr   c, label_57EE9
    inc  e
    cp   $40
    jr   c, label_57EE9
    inc  e
    cp   $70
    jr   c, label_57EE9
    inc  e

label_57EE9::
    ld   a, [$FFEF]
    cp   $40
    jr   c, label_57EF3
    ld   a, e
    add  a, $04
    ld   e, a

label_57EF3::
    ld   d, b
    ld   hl, label_57EB0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_237C
    jp   label_3B12
    ld   a, $01
    call label_3B0C
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   [hl], b
    ld   a, [$C177]
    and  a
    jr   nz, label_57F82
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   e, a
    cp   $0E
    jr   nz, label_57F4F
    ld   a, [$DB0E]
    cp   $0E
    jr   nz, label_57F4F
    ld   a, [$DB7F]
    and  a
    jr   nz, label_57F4F
    ld   a, [$FFF8]
    and  $20
    jr   nz, label_57F44
    call label_57CDB
    call label_280D
    rla
    rla
    rla
    and  $18
    ld   [$DB7C], a

label_57F44::
    ld   a, [$DB7C]
    rra
    rra
    rra
    and  $03
    add  a, $17
    ld   e, a

label_57F4F::
    ld   a, [$FFF6]
    cp   $B5
    jr   z, label_57F72
    ld   a, e
    cp   $0D
    jr   nz, label_57F6F
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ld   a, $07
    ld   [$DB95], a
    ld   a, $01
    ld   [$C5A2], a
    ret

label_57F6F::
    jp   label_237C

label_57F72::
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ld   a, $0D
    ld   [$DB95], a
    ret

label_57F82::
    xor  a
    jp   label_3B0C

label_57F86::
    ld   [hl], h
    inc  bc
    db   $76 ; Halt
    inc  bc
    ld   [hl], b
    inc  bc
    ld   [hl], d
    inc  bc
    db   $76 ; Halt
    inc  hl
    ld   [hl], h
    inc  hl
    ld   [hl], d
    inc  hl
    ld   [hl], b
    inc  hl
    ld   a, [$DB74]
    and  a
    jp   z, label_57C31
    ld   de, label_57F86
    call label_3BC0
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    ld   e, $00
    cp   [hl]
    jr   nc, label_57FB5
    ld   e, $02

label_57FB5::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    call label_57A6E
    call label_57ABC
    ret  nc
    ld   a, $96
    jp   label_2373
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
